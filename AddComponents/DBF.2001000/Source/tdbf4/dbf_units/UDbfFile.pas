unit UDbfFile;

interface
uses
  Classes,Dialogs, SysUtils, Windows, UDbfCommon,db,
  UDbfCursor, UDbfPagedFile, UDbfFieldDef;

{$I _DbfCommon.inc}
//====================================================================
//=== Dbf support (first part)
//====================================================================
//  TxBaseVersion = (xUnknown,xClipper,xBaseIII,xBaseIV,xBaseV,xFoxPro,xVisualFoxPro);
//  TPagedFileMode = (pfOpen,pfCreate);
//  TDbfGetMode = (xFirst,xPrev,xCurrent, xNext, xLast);
//  TDbfGetResult = (xOK, xBOF, xEOF, xError);

type
  TDbfFile = class;
 	EDbfFile = class (Exception);


//====================================================================
	EDbfFileError = class (Exception);
//====================================================================
  TDbfFile = class(TPagedFile)
  protected
    _RecordBufferSize:integer;
    _DbfVersion : xBaseVersion;
    _FieldList: TDbfFieldDefs;
    procedure _ConstructFieldList;
  public
    constructor Create(lFileName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
		destructor Destroy; override;
    procedure WriteHeader; override;
    procedure _WriteFieldHdr; // OH 2000-11-15 dBase7 support. Writeback last next-autoinc value
    property DbfVersion : xBaseVersion read _DbfVersion;
    procedure CreateTable(FieldDefs:TDbfFieldDefs);
    procedure GetFieldList(aFieldList:TDbfFieldDefs);
    procedure PackTable;
    function GetFieldInfo(FieldName:string):TDbfFieldDef;
    function GetFieldData(Column:Integer;DataType:TFieldType; Src,Dst:Pointer): Boolean;
    procedure SetFieldData(Column:integer;DataType:TFieldType; Src,Dst:Pointer);
    procedure IncAutoInc;
    procedure InitRecord(p:pchar);
  end;
//====================================================================
  TDbfCursor = class(TVirtualCursor)
  protected
    _PhysicalRecno:integer;
  public
    constructor Create(DbfFile:TDbfFile);
    function Next:boolean; override;
    function Prev:boolean; override;
    procedure First; override;
    procedure Last; override;
    function PhysicalRecno:integer; override;
    function GetRecordCount:integer; override;
    function GetRecNo:integer; override;
    procedure SetRecNo(Recno:integer); override;
    procedure GotoBookmark(Bookmark:rBookmarkData); override;
		procedure Insert(Recno:integer; Buffer:PChar); override;
		procedure Update(Recno: integer; PrevBuffer,NewBuffer: PChar); override;
    function GetBookMark:integer; override;
  end;

// OH 2000-11-15 dBase7 support. Swap byte order for 4 and 8 Byte Integer
function SwapInt  ( const Value ) : Integer;

{$ifndef DELPHI_3}
function SwapInt64( const Value ) : Int64;
{$endif}

var
	tDbf_TrimFields : boolean;

implementation

const
  sDBF_DEC_SEP= '.';
//====================================================================
type
  PDbfHdr = ^rDbfHdr;
	rDbfHdr = record
		VerDBF      : byte;   // 0
		Year        : byte;   // 1
		Month       : byte;   // 2
		Day         : byte;   // 3
    RecordCount : Integer;  // 4-7
    FullHdrSize : word;   // 8-9
    RecordSize  : word;   // 10-11
    Dummy1      : Word;   // 12-13
    IncTrans    : byte;   // 14
    Encrypt     : byte;   // 15
    Dummy2      : Integer; // 16-19
    Dummy3      : array[20..27] of byte; // 20-27
    MDXFlag     : char; // 28
		Language    : char; // 29
    dummy4      : word; // 30-31
  end;
type
  PFieldHdrIII = ^rFieldHdrIII;
  rFieldHdrIII = record
    FieldName   : array[0..10] of char;
    FieldType   : char; // 11
		Dummy        : array[12..15] of byte;
    FieldSize   : byte; // 16
    FieldPrecision  : byte; //17
    dummy2      : array[18..31] of byte;
  end;
//====================================================================
// OH 2000-11-15 dBase7 support. Header Update (add fields like Next AutoInc Value)
  rFieldHdrV = packed record
    FieldName      : array [0..31] of char;
    FieldType      : char;  // 32
    FieldSize      : byte;  // 33
    FieldPrecision : byte;  // 34
    Reserved1      : Word;  // 35-36
    MDXFlag        : Byte;  // 37
    Reserved2      : DWord; // 38-39
    NextAutoInc    : DWord; // 40-43
    Reserved3      : Word;  // 44-47
  end;
//====================================================================
  rAfterHdrIII = record // Empty
  end;
//====================================================================
  rAfterHdrV = record
    Dummy   : array[32..67] of byte;
  end;

function SwapInt  ( const Value ) : Integer;
var i : Integer;
begin
  PByteArray(@i)[0] := PByteArray(@Value)[3];
  PByteArray(@i)[1] := PByteArray(@Value)[2];
  PByteArray(@i)[2] := PByteArray(@Value)[1];
  PByteArray(@i)[3] := PByteArray(@Value)[0];
  result := i;
end;

{$ifndef DELPHI_3}
function SwapInt64( const Value ) : Int64;
var i : Int64;
begin
  PByteArray(@i)[0] := PByteArray(@Value)[7];
  PByteArray(@i)[1] := PByteArray(@Value)[6];
  PByteArray(@i)[2] := PByteArray(@Value)[5];
  PByteArray(@i)[3] := PByteArray(@Value)[4];
  PByteArray(@i)[4] := PByteArray(@Value)[3];
  PByteArray(@i)[5] := PByteArray(@Value)[2];
  PByteArray(@i)[6] := PByteArray(@Value)[1];
  PByteArray(@i)[7] := PByteArray(@Value)[0];
  result := i;
end;
{$endif}
//====================================================================
// International separator
// thanks to Bruno Depero from Italy
// and Andreas Wöllenstein from Denmark
//====================================================================
function DbfStrToFloat(s: string): Extended;
var iPos: integer;
     eValue: extended;
begin
    iPos:= Pos(sDBF_DEC_SEP, s);
    if iPos> 0 then
      s[iPos]:= DecimalSeparator;
    if TextToFloat(pchar(s), eValue, fvExtended) then
			Result:= eValue
    else Result:= 0;
end;

function FloatToDbfStr(f: Extended; size, prec: integer): string;
var iPos: integer;
begin
    Result:= FloatToStrF(f, ffFixed, Size, prec);
    iPos:= Pos(DecimalSeparator, Result);
    if iPos> 0 then
      Result[iPos]:= sDBF_DEC_SEP;
end;

//====================================================================
// TDbfFile
//====================================================================
constructor TDbfFile.Create(lFileName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
  lRecordCount:Integer;
begin
  // check if the file exists
  inherited Create(lFileName,Mode,AutoCreate,ReadOnly);

  _FieldList:=TDbfFieldDefs.Create(nil);

  if IsNew or (Mode = pfCreate) then begin
  end else begin
    HeaderSize:=sizeof(rDbfHdr); // temporary

// OH 2000-11-15 dBase7 support. I build dBase Tables with different
// BDE dBase Level (1. without Memo, 2. with Memo)
//                          Header Byte ($1d hex) (29 dec) -> Language driver ID.
//  $03,$83 xBaseIII        Header Byte $1d=$00, Float -> N($13.$04) DateTime C($1E)
//  $03,$8B xBaseIV/V       Header Byte $1d=$58, Float -> N($14.$04)
//  $04,$8C xBaseVII        Header Byte $1d=$00  Float -> O($08)     DateTime @($08)
//  $03,$F5 FoxPro Level 25 Header Byte $1d=$03, Float -> N($14.$04)
// Access 97
//  $03,$83 dBaseIII        Header Byte $1d=$00, Float -> N($13.$05) DateTime D($08)
//  $03,$8B dBaseIV/V       Header Byte $1d=$00, Float -> N($14.$05) DateTime D($08)
//  $03,$F5 FoxPro Level 25 Header Byte $1d=$09, Float -> N($14.$05) DateTime D($08)

    case PDbfHdr(Header).VerDBF of
    $83:                  _DbfVersion:=xBaseIII;
    $03,$8B,$8E,$7B:      _DbfVersion:=xBaseIV;
    $04,$8C :             _DbfVersion:=xbaseVII;
    $30 :                 _DbfVersion:=xVisualFoxPro;
    $F5 :                 _DbfVersion:=xFoxPro;
    else
      _DbfVersion:=xBaseIV; // The most compatible with other programs ?
    end;
{
    case PDbfHdr(Header).VerDBF of
    $03,$83:              _DbfVersion:=xBaseIII;
    $04,$8B,$8E,$7B:      _DbfVersion:=xBaseIV;
    $05,$8C :             _DbfVersion:=xbaseV;
    $30 :                 _DbfVersion:=xVisualFoxPro;
    $F5 :                 _DbfVersion:=xFoxPro;
    else
      _DbfVersion:=xBaseIV; // The most compatible with other programs ?
    end;
}

    HeaderSize:=PDbfHdr(Header).FullHdrSize;

    RecordSize:=PDbfHdr(Header).RecordSize;
    lRecordCount:=RecordCount;
    if PDbfHdr(Header).RecordCount <> lRecordCount then begin
      ShowMessage('Invalid Record Count,'+^M+
                                     'RecordCount in Hdr : '+IntToStr(PDbfHdr(Header).RecordCount)+^M+
                                     'expected : '+IntToStr(lRecordCount));
      PDbfHdr(Header).RecordCount := lRecordCount; // Correct it
    end;
    _ConstructFieldList;
  end;
end;


destructor TDbfFile.Destroy;
begin
  FreeAndNil(_FieldList);
	inherited Destroy;
end;

procedure TDbfFile.WriteHeader;
var
	SystemTime: TSystemTime;
  lDataHdr:PDbfHdr;
begin
  Assert(HeaderSize<>0,'HeaderSize=0');
  //FillHeader(0);
  lDataHdr:=PDbfHdr(Header);
  GetLocalTime(SystemTime);
  lDataHdr.Year := SystemTime.wYear - 1900;
  lDataHdr.Month := SystemTime.wMonth;
  lDataHdr.Day := SystemTime.wDay;
  lDataHdr.RecordCount := RecordCount;
  inherited WriteHeader;
// OH 2000-11-15 dBase7 support. Writeback last next-autoinc value
  if DbfVersion >= xBaseVII then
    _WriteFieldHdr;
  SeekPage(RecordCount+1); // last byte usually...
  WriteChar($1A); // Terminator...
end;

procedure TDbfFile._WriteFieldHdr;
var
  SaveHeaderSize : Integer;
  SaveRecordSize : Integer;
  i              : Integer;
  lFieldHdrV     : rFieldHdrV;
begin
  SaveHeaderSize := HeaderSize;
  SaveRecordSize := RecordSize;
  HeaderSize :=SizeOf(rAfterHdrV) + SizeOf(rDbfHdr);
  RecordSize :=SizeOf(rFieldHdrV);
  for i := 0 to _FieldList.Count-1 do begin
    with TDbfFieldDef(_FieldList.Items[i]) do begin
      if NativeFieldType = '+' then begin
        ReadRecord(i+1, @lFieldHdrV);
        if lFieldHdrV.NextAutoInc <> AutoInc then begin
          lFieldHdrV.NextAutoInc := AutoInc;
          WriteRecord(i+1, @lFieldHdrV);
        end;
      end;
    end;
  end;
  HeaderSize := SaveHeaderSize;
  RecordSize := SaveRecordSize;
end;

procedure TDbfFile.GetFieldList(aFieldList:TDbfFieldDefs);
var
  Il : Integer;
  Src : TDbfFieldDef;
begin
  aFieldList.Clear;
  if _FieldList.Count=0 then begin
    _ConstructFieldList;
  end;
  for Il:=0 to _FieldList.Count-1 do begin
    Src:=_FieldList.Items[Il];
    with aFieldList.AddFieldDef do begin
      Name:=Src.Name;
      Size:=Src.Size;
      Prec:=Src.Prec;
      FieldType:=Src.FieldType;
    end;
  end;
end;

procedure TDbfFile._ConstructFieldList;
var
  lColumnCount,lHeaderSize,lFieldSize:Integer;
  Il : Integer;
  lFieldOffset : Integer;
  lFieldHdrIII:rFieldHdrIII;
  lFieldHdrV:rFieldHdrV;
begin
  _FieldList.Clear;
  if DbfVersion>=xBaseV then begin
    lHeaderSize:=SizeOf(rAfterHdrV) + SizeOf(rDbfHdr);
    lFieldSize:=SizeOf(rFieldHdrV);
  end else begin
    lHeaderSize:=SizeOf(rAfterHdrIII) + SizeOf(rDbfHdr);
    lFieldSize:=SizeOf(rFieldHdrIII);
  end;
  HeaderSize:=lHeaderSize;
  RecordSize:=lFieldSize;

  lColumnCount:= (PDbfHdr(Header).FullHdrSize - lHeaderSize) div lFieldSize;

  if (lColumnCount <= 0) or (lColumnCount > 4096) then
      Raise EDbfFileError.Create('Invalid field count : ' + IntToStr(lColumnCount) + ' (must be between 1 and 4095)');

  lFieldOffset := 1;
  try
    for Il:=1 to lColumnCount do begin
      with _FieldList.AddFieldDef do begin
        Offset:=lFieldOffset;
        if _DbfVersion>=xBaseV then begin
          ReadRecord(Il,@lFieldHdrV);
          Name:=UPPERcase(PCHAR(@lFieldHdrV.FieldName[0]));
          Size:=lFieldHdrV.FieldSize;
          Prec:=lFieldHdrV.FieldPrecision;
          NativeFieldType:=lFieldHdrV.FieldType;
          AutoInc := lFieldHdrV.NextAutoInc;
        end else begin
          ReadRecord(Il,@lFieldHdrIII);
          Name:=UPPERcase(PCHAR(@lFieldHdrIII.FieldName[0]));
          Size:=lFieldHdrIII.FieldSize;
          Prec:=lFieldHdrIII.FieldPrecision;
          NativeFieldType:=lFieldHdrIII.FieldType;
        end;
        Inc(lFieldOffset,Size);
      end;
    end;
    if (lFieldOffset <> PDbfHdr(Header).RecordSize) then begin
      ShowMessage('Invalid Record Size,'+^M+
                                      'Record Size in Hdr : '+IntToStr(PDbfHdr(Header).RecordSize)+^M+
                                      'Expected : '+IntToStr(lFieldOffset));
      PDbfHdr(Header).RecordSize := lFieldOffset;
    end;
  finally
    HeaderSize:=PDbfHdr(Header).FullHdrSize;
    RecordSize:=PDbfHdr(Header).RecordSize;
  end;
end;

procedure TDbfFile.CreateTable(FieldDefs:TDbfFieldDefs);
var
  ix:Integer;
  Offs:Integer;
  lFieldHdrIII:rFieldHdrIII;
  lFieldDef:TDbfFieldDef;
  lSize,lPrec:integer;
begin
  // first reset file.
  try
    RecordCount:= 0;
    RecordSize := SizeOf(rDbfHdr) + SizeOf(rAfterHdrIII);
    HeaderSize := SizeOf(rFieldHdrIII);
    PDbfHdr(Header).VerDBF:=$03; // Default version xBaseV without memo
//		PDbfHdr(Header).Language:='X';

    Offs:=1; // deleted mark count 1.
    for Ix:=1 to FieldDefs.Count do
    begin
      lFieldDef:=FieldDefs.Items[Ix-1];
      FillChar(lFieldHdrIII,SizeOf(lFieldHdrIII),#0);


      lFieldHdrIII.FieldType:=lFieldDef.NativeFieldType; //DataType;
      StrPLCopy(lFieldHdrIII.FieldName,lFieldDef.Name,sizeof(lFieldHdrIII.FieldName)-1);
      lFieldHdrIII.FieldSize:=lFieldDef.Size;
      lFieldHdrIII.FieldPrecision:=lFieldDef.Prec;

      WriteRecord(Ix,@lFieldHdrIII);
      Inc(Offs,lFieldDef.Size);
    end;
    // end of header
    WriteChar($0d);

    // update header
    PDbfHdr(Header).RecordSize := Offs;
    PDbfHdr(Header).FullHdrSize := HeaderSize + RecordSize * FieldDefs.Count + 1;
    inherited WriteHeader;
  finally
    RecordSize := PDbfHdr(Header).RecordSize;
    HeaderSize := PDbfHdr(Header).FullHdrSize;
    WriteHeader;
    // write the updated header
  end;
end;

{ To pack I fill the holes with the last records.
  by this way I read each records only once.
}
procedure TDbfFile.PackTable;
var
  iDel,iNonDel: integer;
  iLastDeleted: integer;
  p: Pointer;
  function FindDel: boolean;
  begin
    Result:= FALSE;
    while iDel<iNonDel do begin
      ReadRecord(iDel, p);
      if (PCHAR(p)^ <> ' ') then begin
        Result:= TRUE;
        break;
      end;
      Inc(iDel);
    end;
  end;
  function FindNonDel: boolean;
  begin
    Result:= FALSE;
    while iDel<iNonDel do begin
      ReadRecord(iNonDel, p);
      if (PCHAR(p)^= ' ') then begin
        Result:= TRUE;
        break;
      end;
      dec(iNonDel);
    end;
  end;
begin
  if RecordSize< 1 then
    Exit;
  iNonDel:=RecordCount;
  if iNonDel< 0 then
    Exit;
  iDel:= 1;
  GetMem(p, RecordSize);
  try
    iLastDeleted:=0;
    while FindDel and FindNonDel do begin
      ReadRecord(iNonDel, p);
      WriteRecord(iDel, p);
      iLastDeleted:=iDel;
      PCHAR(p)^:= '*';
      WriteRecord(iNonDel,p);
      inc(iNonDel);
      dec(iDel);
    end;
    if iLastDeleted>0 then recordCount:=(iLastDeleted-1)
    else recordCount:=0;
  finally
    FreeMem(p);
  end;
end;

function TDbfFile.GetFieldInfo(FieldName:string):TDbfFieldDef;
var
  i:Integer;
  lfi:TDbfFieldDef;
begin
  FieldName:=UpperCase(FieldName);
  for i:=0 to _FieldList.Count-1 do begin
    lfi:=TDbfFieldDef(_FieldList.Items[i]);
    if lfi.Name = FieldName then begin
      result:=lfi;
      exit;
    end;
  end;
  result:=nil;
end;

function TDbfFile.GetFieldData(Column:Integer;DataType:TFieldType; Src,Dst:Pointer): Boolean;
var
  FieldOffset: Integer;
  FieldSize: Integer;
  s:string;
  d:TDateTime;
  ld,lm,ly: word;
  MyFieldDef:TDbfFieldDef;
	function TrimStr(const s: string): string;
	begin
		if DataType=ftString then
		begin
			if tDbf_TrimFields then Result:=Trim(s)
			else Result:=TrimRight(s);
		end
		else Result:= Trim(s);
	end;
  procedure CorrectYear(var wYear: word);
  var wD, wM, wY, CenturyBase: word;
{$ifdef DELPHI_3}
  // Delphi 3 standard-behavior no change possible
  const TwoDigitYearCenturyWindow= 0;
{$endif}
  begin
     if wYear>= 100 then
       Exit;
     DecodeDate(Date, wY, wm, wD);
     // use Delphi-Date-Window
     CenturyBase := wY{must be CurrentYear} - TwoDigitYearCenturyWindow;
     Inc(wYear, CenturyBase div 100 * 100);
     if (TwoDigitYearCenturyWindow > 0) and (wYear < CenturyBase) then
        Inc(wYear, 100);
  end;
begin
  MyFieldDef:=TDbfFieldDef(_FieldList.Items[Column]);
  FieldOffset := MyFieldDef.Offset;
	FieldSize := MyFieldDef.Size;
// OH 2000-11-15 dBase7 support. Read values for new fieldtypes
  if MyFieldDef.NativeFieldType in ['+', 'I', 'O', '@'] then begin
    result := False;
    Src := PChar(Src) + FieldOffset;
    if MyFieldDef.NativeFieldType in ['+', 'I'] then begin
      Integer(Dst^) := SwapInt(Integer(Src^));
      result := DWord(Dst^) <> 0;
      if result then
        Integer(Dst^) := Integer( DWord(Dst^) - $80000000);
    end else begin
{$ifndef DELPHI_3}
      if (Int64(Src^) <> 0) then begin
        Int64(Dst^) := SwapInt64(Int64(Src^));
        if MyFieldDef.NativeFieldType = 'O' then begin
          if Int64(Dst^) > 0 then
            Int64(Dst^) := not Int64(Dst^)
          else
            Double(Dst^) := Double(Dst^)*-1;
        end;
        result := True;  // Field is not NULL
      end else begin
        result := False; // Field is NULL
      end;
{$endif}
    end;
  end else begin
    SetString(s, PChar(Src) + FieldOffset, FieldSize );
    s:=TrimStr(s);
    result:=length(s)>0; // return if field is empty
    if Result and (Dst<>nil) then// data not needed if Result= FALSE or Dst=nil
      case DataType of
      ftBoolean:
        begin
          // in DBase- FileDescription lowercase t is allowed too
          // with asking for Result= TRUE s must be longer then 0
          // else it happens an AV, maybe field is NULL
          if (UpCase(s[1])='T') then Word(Dst^) := 1
          else Word(Dst^) := 0;
        end;
      ftInteger, ftSmallInt{$ifndef DELPHI_3},ftLargeInt{$endif}:
        begin
          case DataType of
          ftSmallInt : SmallInt(Dst^):= StrToIntDef(s, 0);
          {$ifndef DELPHI_3}
          ftLargeint : LargeInt(Dst^):= StrToInt64Def(s, 0);
          {$endif}
          else // ftInteger :
            Integer(Dst^):= StrToIntDef(s, 0);
          end; // case
        end;
      ftFloat:
        begin
          Double(Dst^) := DBFStrToFloat(s);
        end;
      ftCurrency:
        begin
          Double(Dst^) := DBFStrToFloat(s);
        end;
      ftDate:
        begin
          ld:=StrToIntDef(Copy(s,7,2),1);
          lm:=StrToIntDef(Copy(s,5,2),1);
          ly:=StrToIntDef(Copy(s,1,4),0);
          if ld=0 then ld:=1;
          if lm=0 then lm:=1;
  //           if (ly<1900) or (ly>2100) then ly:=1900;
  //           Year from 0001 to 9999 is possible
  //           everyting else is an error, an empty string too
  //           Do DateCorrection with Delphis possibillities for one or two digits
          if (ly< 100) and (Length(Trim(Copy(s,1,4)))in [1, 2]) then CorrectYear(ly);
          try
            d:=EncodeDate(ly,lm,ld);
            if Assigned(Dst) then  Integer(Dst^) := DateTimeToTimeStamp(d).Date;
          except
            Integer(Dst^) := 0;
          end;
        end;
          ftString: begin
          StrPCopy(Dst,s);
        end;
     end;
  end;
end;

procedure TDbfFile.SetFieldData(Column:integer;DataType:TFieldType; Src,Dst:Pointer);
var
  FieldSize,FieldPrec: Integer;
	s:string;
  fl:Double;
  ts:TTimeStamp;
  MyFieldDef:TDbfFieldDef;
  IntValue  : Integer;
begin
  MyFieldDef:=TDbfFieldDef(_FieldList.Items[Column]);
  FieldSize := MyFieldDef.Size;
  FieldPrec := MyFieldDef.Prec;

	Dst:=PChar(Dst)+MyFieldDef.Offset;
// OH 2000-11-15 dBase7 support. Write values for new fieldtypes
  if MyFieldDef.NativeFieldType in ['+', 'I', 'O', '@'] then begin
    if MyFieldDef.NativeFieldType in ['+', 'I'] then begin
      if src = nil then
        IntValue := 0 // Field = NULL
      else begin
        IntValue := Integer(DWord(Src^) + $80000000);
        Integer(Dst^) := SwapInt(IntValue);
      end;
    end else
{$ifndef DELPHI_3}
    if MyFieldDef.NativeFieldType = 'O' then begin
      if src = nil then
        Int64(Dst^) := 0 // Field = NULL
      else begin
        if Double(Src^) < 0 then
          Int64(Dst^) := not Int64(Src^)
        else
          Double(Dst^):= Double(Src^)*-1;
        Int64(Dst^) := SwapInt64(Dst^);
      end;
    end else
    if MyFieldDef.NativeFieldType = '@' then begin
      if src = nil then
        Int64(Dst^) := 0 // Field = NULL
      else
        Int64(Dst^) := SwapInt64(Src^);
    end;
{$endif}
  end else begin
    if src<>nil then begin
      case DataType of
      ftBoolean:
        begin
          if Word(Src^) = 1 then s:='T'
          else s:='F';
        end;
      ftInteger, ftSmallInt {$ifndef DELPHI_3},ftLargeInt{$endif}:
        begin
          case DataType of
          ftSmallInt : s:= IntToStr(SmallInt(Src^));
          {$ifndef DELPHI_3}
          ftLargeInt: s:= IntToStr(LargeInt(Src^));
          {$endif}
          else //ftInteger
            s:= IntToStr(Integer(Src^));
          end;
          // left filling
          if Length(s)<FieldSize then s:=StringOfChar(' ',FieldSize-Length(s)) + s;
        end;
      ftFloat,ftCurrency:
        begin
          fl := Double(Src^);
          s:=FloatToDbfStr(fl,FieldSize,FieldPrec);
          if Length(s)<FieldSize then s:=StringOfChar(' ',FieldSize-Length(s)) + s;
        end;
      ftDate:
        begin
          ts.Time:=0;
          ts.Date:=Integer(Src^);
          s:= FormatDateTime('yyyymmdd', TimeStampToDateTime(ts));
        end;
      ftString:
        begin
          s:=PChar(Src); // finish with first 0
        end;
      end; // case
    end; // if src<>nil (thanks andreas)
    if Length(s)<FieldSize then begin
      s:=s+StringOfChar(' ',FieldSize-Length(s));
    end else if (Length(s)>FieldSize) then begin
      if DataType= ftString then begin
        // never raise for strings to long, its not customary
        // TTable never raises
        SetLength(s, FieldSize)
      end else begin
        raise EDbfFileError.Create('Field data too long :' + IntToStr(Length(s))
          + ' (must be between 1 and ' + IntToStr(FieldSize) + ').');
      end;
    end;
    Move(PChar(s)^, Dst^, FieldSize);
  end;
end;

procedure TDbfFile.IncAutoInc;
var
  i:integer;
begin
  for i :=0 to _FieldList.Count-1 do begin
    with _FieldList.Items[i] do begin
      if NativeFieldType = '+' then
        inc(AutoInc);
    end;
  end;
end;

procedure TDbfFile.InitRecord(p:pchar);
var
  MyFieldDef:TDbfFieldDef;
  i:integer;
  IntValue:integer;
begin
  for i := 0 to _FieldList.Count-1 do begin
    MyFieldDef:=_FieldList.Items[i];
    if (MyFieldDef.NativeFieldType = '+') then begin
      IntValue := MyFieldDef.AutoInc+$80000000;
      PInteger(p+MyFieldDef.Offset)^:= SwapInt(IntValue);
    end;
  end;
end;
//====================================================================
// tDbfCursor
//====================================================================
constructor TDbfCursor.Create(DbfFile:TDbfFile);
begin
  inherited Create(DbfFile);
end;

function TDbfCursor.Next:boolean;
var
  max:integer;
begin
  max:=TDbfFile(PagedFile).RecordCount;
  if _PhysicalRecno<=max then inc(_PhysicalRecno)
  else _PhysicalRecno:=max+1;
	result:=(_PhysicalRecno<=max);
end;

function TDbfCursor.Prev:boolean;
begin
  if _PhysicalRecno>0 then dec(_PhysicalRecno)
  else _PhysicalRecno:=0;
  result:=(_PhysicalRecno>0);
end;

procedure TDbfCursor.First;
begin
  _PhysicalRecno:=0;
end;

procedure TDbfCursor.Last;
var
  max:integer;
begin
  max:=TDbfFile(PagedFile).RecordCount;
  if max=0 then _PhysicalRecno:=0
  else _PhysicalRecno:=max+1;
end;

function TDbfCursor.PhysicalRecno:integer;
begin
	result:=_PhysicalRecno;
end;

function TDbfCursor.GetRecordCount:integer;
begin
  result:=TDbfFile(PagedFile).RecordCount;
end;

function TDbfCursor.GetRecNo:integer;
begin
	result:=_PhysicalRecno;
end;

procedure TDbfCursor.SetRecNo(Recno:integer);
begin
	_PhysicalRecno:=Recno;
end;

procedure TDbfCursor.GotoBookmark(Bookmark:rBookmarkData);
begin
  _PhysicalRecno:=Bookmark.CursorBookMark;
end;

procedure TDbfCursor.Insert(Recno:integer; Buffer:PChar); {override;}
begin
	_PhysicalRecno:=TDbfFile(PagedFile).RecordCount;
end;

procedure TDbfCursor.Update(Recno: integer; PrevBuffer,NewBuffer: PChar); {override;}
begin
end;

function TDbfCursor.GetBookMark:integer; {override;}
begin
  result:=_PhysicalRecno;
end;

(*
first
  if TDbfFile(_File).CalcRecordCount=0 then InternalLast
  elseif _curIndex<0 then
  else _curIndex.First;
*)

(*
PhysicalRecno
if _curIndex>=0 then _PhysicalRecno:=_CurIndex.GetRealRecNo;*)

(**
Next
					if _curIndex>=0 then begin
						Acceptable:=_curIndex.Next;
					end else begin
					end;
Prev
					if _curIndex>=0 then begin
						Acceptable:=_curIndex.Prev;
					end else begin
					end;

**)



end.
