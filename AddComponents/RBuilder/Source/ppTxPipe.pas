{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppTxPipe;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, SysUtils, Graphics,
  ppTypes, ppDB, ppUtils;

                                                                          
const
  {note: only these datatypes are supported buy the TextPipeline}
  cValidTextDataType = [dtString, dtInteger, dtLongint, dtDouble, dtBoolean];

type

  TppTextPipeline = class;

  { TppFileDataStream }
  TppFileDataStream = class(TObject)
    private
      FActive: Boolean;
      FCurrentRecordSize: Longint;
      FFieldBuf: PChar;
      FFieldDelimiter: Char;
      FFieldStrings: TStringList;
      FFileStream: TFileStream;
      FStreamSize: Longint;
      FMaxRecordSize: Longint;
      FRecordBuf: PChar;
      FTextPipeline: TppTextPipeline;
      FEOF: Boolean;

      function  CalcMaxRecordSize: Integer;
      procedure FetchNext;
      procedure FetchPrior;
      procedure GetFieldData;
      function GetFieldStringIndex(aFieldName: String): Integer;
      procedure LoadFieldBufferDelimited;
      procedure LoadFieldBufferFixed;
      procedure SeekPrior;

      function GetBOF: Boolean;
      function GetEOF: Boolean;

    public
      constructor Create(aTextPipeline: TppTextPipeline);
      destructor Destroy; override;

      procedure Open;
      procedure Close;

      function  GetBookmark: Longint;
      procedure GoToBookmark(aBookmark: Longint);
      procedure FreeBookmark(aBookmark: Longint);

      procedure First;
      procedure Last;
      procedure MoveBy(aIncrement: Longint);

      function  GetFieldAsString(aFieldName: String): String;
      function  GetFieldAsInteger(const aFieldName: String): Longint;
      function  GetFieldAsFloat(const aFieldName: String): Double;
      function  GetFieldAsBoolean(const aFieldName: String): Boolean;

      property Active: Boolean read FActive;
      property BOF: Boolean read GetBOF;
      property EOF: Boolean read GetEOF;

  end; {class, TppFileDataStream}


  { TppTextPipeline }
  TppTextPipeline = class(TppCustomDataPipeline)
    private
      FBooleanTrue: String;
      FBooleanFalse: String;
      FCustomDelimiter: Char;
      FFileName: String;
      FFileType: TppFileType;
      FFileStream: TppFileDataStream;

      procedure SetFileName(const aFileName: String);
      procedure SetFileType(aFileType: TppFileType);
      procedure SetBooleanTrue(aValue: String);
      procedure SetBooleanFalse(aValue: String);
      procedure SetCustomDelimiter(aDelimeter: Char);

    protected
 
      {overriden from TppDataPipeline}
      procedure CloseDataSet; override;
      function  GetActive: Boolean; override;
      function  CheckBOF: Boolean; override;
      function  CheckEOF: Boolean; override;
      procedure GotoFirstRecord; override;
      procedure GotoLastRecord; override;
      procedure OpenDataSet; override;
      procedure TraverseBy(aIncrement: Integer); override;

      {field support}
      property AutoCreateFields default False;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      {overriden from TppCacheable}
      procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
      procedure SaveToCache(aAbsolutePageNo: Longint); override;

      {overriden from TppDataPipeline}
      procedure FreeBookmark(aBookmark: Longint); override;
      function  GetBookmark: Longint; override;
      function  GetDataSetName: String; override;
      function  GetFieldAlignment(aFieldName: String): TAlignment; override;
      function  GetFieldAsDouble(aFieldName: String): Double; override;
      function  GetFieldAsPicture(aFieldName: String): TPicture; override;
      function  GetFieldAsString(aFieldName: String): String; override;
      function  GetFieldDataType(aFieldName: String): TppDataType; override;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; override;
      function  GetFieldIsCalculated(aFieldName: String): Boolean; override;
      function  GetFieldSize(aFieldName: string): Integer; override;
      function  GetFieldValue(aFieldName: string): Variant; override;

      procedure GotoBookmark(aBookmark: Longint); override;

      function  IsValidDataType(aDataType: TppDataType): Boolean; override;


    published
      property BooleanTrue: String read FBooleanTrue write SetBooleanTrue;
      property BooleanFalse: String read FBooleanFalse write SetBooleanFalse;
      property CustomDelimiter: Char read FCustomDelimiter write SetCustomDelimiter default ',';
      property FileName: String read FFileName write SetFileName;
      property FileType: TppFileType read FFileType write SetFileType default ftComma;

      {TppDataPipeline properties}
      property MasterDataPipeline;
      property MasterFieldLinks;
      property MoveBy;
      property RangeEnd;
      property RangeEndCount;
      property RangeBegin;
      property SkipWhenNoRecords;
      property UserName;
      property Visible;

      {TppDataPipeline events}
      property OnClose;
      property OnDataChange;
      property OnFirst;
      property OnGotoBookmark;
      property OnLast;
      property OnMasterRecordPositionChange;
      property OnNext;
      property OnOpen;
      property OnPrior;
      property OnRecordPositionChange;
      property OnTraversal;

  end; {class, TppTextPipeline}


 { TppChildTextPipeline }
  TppChildTextPipeline = class(TppTextPipeline)
    public
      function HasParent: Boolean; override;

    end; {class, TppChildTextPipeline}



implementation


{******************************************************************************
 *
 ** C H I L D   T E X T  P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildTextPipeline.HasParent }

function TppChildTextPipeline.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** F I L E  D A T A  S T R E A M
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFileDataStream.Create }

constructor TppFileDataStream.Create(aTextPipeline: TppTextPipeline);
begin

  inherited Create;

  FTextPipeline := aTextPipeline;

  FActive       := False;
  FFieldStrings := nil;
  FFileStream   := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFileDataStream.Destroy }

destructor TppFileDataStream.Destroy;
begin
  if FActive then
    Close;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppFileDataStream.Open }

procedure TppFileDataStream.Open;
begin

  if FActive then Exit;

  case FTextPipeline.FileType of

    ftTab:    FFieldDelimiter := #9;

    ftComma:  FFieldDelimiter := ',';

    ftCustom: FFieldDelimiter := FTextPipeline.CustomDelimiter;

  else {fixed length, not used}
    FFieldDelimiter := ',';
  end;

  FFileStream   := TFileStream.Create(FTextPipeline.FileName, fmOpenRead or fmShareDenyWrite);
  FFieldStrings := TStringList.Create;

  FActive     := True;
  FStreamSize := FFileStream.Size;

  FCurrentRecordSize  := 0;
  FMaxRecordSize      := CalcMaxRecordSize;

  FRecordBuf := AllocMem(FMaxRecordSize+2);
  FFieldBuf  := AllocMem(FMaxRecordSize+2);

  FEOF := False;

  {load the field buffer with data from the first record}
  First;
  SeekPrior;


end; {procedure, Open}

{------------------------------------------------------------------------------}
{ TppFileDataStream.Close }

procedure TppFileDataStream.Close;
begin

  if not FActive then Exit;

  FreeMem(FRecordBuf, FMaxRecordSize+2);
  FreeMem(FFieldBuf,  FMaxRecordSize+2);

  FFileStream.Free;
  FFileStream := nil;

  FFieldStrings.Free;
  FFieldStrings := nil;

  FRecordBuf := nil;
  FFieldBuf  := nil;

  FActive := False;

end; {procedure, Close}


{------------------------------------------------------------------------------}
{ TppFileDataStream.CalcMaxRecordSize }

function TppFileDataStream.CalcMaxRecordSize: Integer;
var
  liField: Integer;

begin

  Result := 0;

  {calc sum of all field lengths}
  for liField := 0 to FTextPipeline.FieldCount-1 do
    Result := Result + FTextPipeline.Fields[liField].FieldLength;

  {add one for field separator}
  Result := Result + ((FTextPipeline.FieldCount-1) * Length(FFieldDelimiter));

  {each record will have and an end of line marker (i.e. #13#10 pair) }
  Result := Result + 2;

end; {function, CalcRecordBufSize}

{------------------------------------------------------------------------------}
{ TppFileDataStream.GetBOF }

function TppFileDataStream.GetBOF: Boolean;
begin
  Result := (FFileStream = nil) or (FFileStream.Size = 0)
                                or (FFileStream.Position = 0);

end; {function, GetBOF}


{------------------------------------------------------------------------------}
{ TppFileDataStream.GetEOF }

function TppFileDataStream.GetEOF: Boolean;
begin
  Result := (FFileStream = nil) or (FFileStream.Size = 0)
                                or FEOF;


end; {function, GetEOF}

{------------------------------------------------------------------------------}
{ TppFileDataStream.GetBookmark }

function TppFileDataStream.GetBookmark: Longint;
begin

  Result := -1;

  if not FActive then Exit;

  if FFileStream.Position = 0 then
    Result := 0
  else
    Result := FFileStream.Position - FCurrentRecordSize;

end; {function, GetBookmark}

{------------------------------------------------------------------------------}
{ TppFileDataStream.FreeBookmark }

procedure TppFileDataStream.FreeBookmark(aBookmark: Longint);
begin

end; {procedure, FreeBookmark}

{------------------------------------------------------------------------------}
{ TppFileDataStream.GotoBookmark }

procedure TppFileDataStream.GotoBookmark(aBookmark: Longint);
begin
  if not FActive then Exit;

  FFileStream.Position := aBookmark;

  FetchNext;

  GetFieldData;

end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppFileDataStream.First }

procedure TppFileDataStream.First;
begin

  if not FActive then Exit;

  FFileStream.Seek(0, soFromBeginning);

  FetchNext;
  
  GetFieldData;

end; {procedure, First}

{------------------------------------------------------------------------------}
{ TppFileDataStream.Last }

procedure TppFileDataStream.Last;
begin

  if not FActive then Exit;

  FFileStream.Seek(0, soFromEnd);

  SeekPrior;
  FetchNext;

  GetFieldData;

end; {procedure, Last}

{------------------------------------------------------------------------------}
{ TppFileDataStream.MoveBy }

procedure TppFileDataStream.MoveBy(aIncrement: Longint);
var
  liMove: Integer;

begin

  if not FActive then Exit;

  for liMove := 1 to Abs(aIncrement) do

    if aIncrement > 0 then
      FetchNext
    else
      FetchPrior;

  GetFieldData;

end; {procedure, MoveBy}

{------------------------------------------------------------------------------}
{ TppFileDataStream.FetchNext }

procedure TppFileDataStream.FetchNext;
var
  llBytesRead: Longint;
  llStreamPosition: Longint;
  lpEndOfLine: PChar;
  llMaxRecSize: Longint;

begin

  FEOF := (FFileStream.Position >= FFileStream.Size);

  if FEOF then Exit;

  {save current position in stream}
  llStreamPosition := FFileStream.Position;

  llMaxRecSize := FMaxRecordSize;

  {read data from stream into record buffer}
  llBytesRead := FFileStream.Read(FRecordBuf^, llMaxRecSize+1);

  FRecordBuf[llBytesRead] := #0;

  {find end of line}
  lpEndOfLine := StrPos(FRecordBuf, #13#10);

  if (lpEndOfLine <> nil) then
    lpEndOfLine^ := #0; 

  FCurrentRecordSize := StrLen(FRecordBuf) + 2;

  {increment stream position }

  FFileStream.Position := llStreamPosition + FCurrentRecordSize;

  {llStreamPosition := llStreamPosition + FCurrentRecordSize;

  FFileStream.Position := llStreamPosition

  if llStreamPosition <= FFileStream.Size then
     FFileStream.Position := llStreamPosition
  else
    FFileStream.Position := FFileStream.Size;}

end; {function, FetchNext}


{------------------------------------------------------------------------------}
{ TppFileDataStream.FetchPrior }

procedure TppFileDataStream.FetchPrior;
var
  llCurrentRecStart: Longint;

begin

  if GetBOF then Exit;

  {move to start of current record}
  llCurrentRecStart := FFileStream.Position - (FCurrentRecordSize+2);

  if llCurrentRecStart >= 0 then
    FFileStream.Position := llCurrentRecStart
  else
    FFileStream.Position := 0;

  {need to check BOF again here}
  if GetBOF then Exit;


  {find start of prior record}
  SeekPrior;

  {read the record}
  FetchNext;


end; {function, FetchPrior}

{------------------------------------------------------------------------------}
{ TppFileDataStream.SeekPrior }

procedure TppFileDataStream.SeekPrior;
var
  llBytesRead: Longint;
  llSavePosition: Longint;
  lpStartOfLine: PChar;
  llReadSize: Longint;
  lRecordBuf: PChar;

begin


  if GetBOF then Exit;

  {save current position in stream}
  llSavePosition := FFileStream.Position;

  {go backwards (max record size + #13#10) }
  if FFileStream.Position > FMaxRecordSize then
    begin
      FFileStream.Position := FFileStream.Position - (FMaxRecordSize+2);
      llReadSize := FMaxRecordSize;
    end
  else
    begin
      FFileStream.Position := 0;
      llReadSize := llSavePosition-2;
    end;

  {read data from stream into record buffer}
  llBytesRead := FFileStream.Read(FRecordBuf^, llReadSize);

  lRecordBuf := PChar(FRecordBuf);

  lRecordBuf[llBytesRead] := #0;

  {find start of rec}
  lpStartOfLine := lRecordBuf + StrLen(lRecordBuf);

  while not(lpStartOfLine^ in [#13,#10]) and (lpStartOfLine >= lRecordBuf) do
    Dec(lpStartOfLine);

  Inc(lpStartOfLine);

  StrCopy(lRecordBuf, lpStartOfLine);


  {decrement stream position }
  FFileStream.Position := llSavePosition - (Integer(StrLen(lRecordBuf)) + 2);


end; {seek prior}

{------------------------------------------------------------------------------}
{ TppFileDataStream.GetFieldData }

procedure TppFileDataStream.GetFieldData;
begin

  {load field buffer }
  if FTextPipeline.FileType = ftFixedLength then
    LoadFieldBufferFixed
  else
    LoadFieldBufferDelimited;

end;  {procedure, GetFieldData}


{------------------------------------------------------------------------------}
{ TppFileDataStream.LoadFieldBufferDelimited }

procedure TppFileDataStream.LoadFieldBufferDelimited;
var
  lpStartStr, lpEndStr: PChar;
  lpEndBuffer: PChar;
  lbEndString: Boolean;
  llBufSize: Longint;

begin

  {copy record bugger to field buffer}
  StrCopy(FFieldBuf, FRecordBuf);

  {parse the field buffer}
  llBufSize   := StrLen(FFieldBuf);
  lpStartStr  := FFieldBuf;
  lpEndBuffer := lpStartStr + llBufSize;
  lbEndString := False;

  FFieldStrings.Clear;

  while not lbEndString do
    begin

      {remove leading spaces}
   {   while (lpStartStr^ = ' ') and (lpStartStr <= lpEndBuffer) do
        Inc(lpStartStr);}

      {search for end of string}
      lpEndStr := lpStartStr;

      while (lpEndStr^ <> '#0') and (lpEndStr^ <> FFieldDelimiter) and
            (lpEndStr <= lpEndBuffer) do

        Inc(lpEndStr);


      if (lpEndStr^ = FFieldDelimiter) then
        lpEndStr^ := #0;
        
      {add parsed string to result list}
      FFieldStrings.Add(lpStartStr);


      {increment pointer to start of next string}
      if not lbEndString then
        lpStartStr := lpEndStr + Length(FFieldDelimiter);

      {check for ending condition}
       if lpStartStr > lpEndBuffer then
        lbEndString := True;

    end;


end; {procedure, LoadFieldBufferDelimited }

{------------------------------------------------------------------------------}
{ TppFileDataStream.LoadFieldBufferFixed }

procedure TppFileDataStream.LoadFieldBufferFixed;
var
  lpField: PChar;
  liField: Integer;
  liFieldLength: Integer;
  lcSaveChar: Char;

begin

  FFieldStrings.Clear;

  {initialize}
  FFieldBuf^ := #0;
  lpField    := FRecordBuf;

  for liField := 0 to FTextPipeline.FieldCount-1 do
    begin

      {temporarily convert field to a null terminated string}
      liFieldLength := FTextPipeline.Fields[liField].FieldLength;
      lcSaveChar := lpField[liFieldLength];
      lpField[liFieldLength] := #0;

      {add to field strings}
      FFieldStrings.Add(lpField);

      {restore the orginal char to the record buf}
      lpField[liFieldLength] := lcSaveChar;

      {advance the field pointer}
      lpField  := lpField + liFieldLength;

    end; {for each field}


end; {procedure, LoadFieldBufferFixed }

{------------------------------------------------------------------------------}
{ function TppFileDataStream.GetFieldStringIndex }

function TppFileDataStream.GetFieldStringIndex(aFieldName: String): Integer;
var
  liIndex: Integer;
begin

  liIndex := FTextPipeline.IndexOfFieldName(aFieldName);

  if (liIndex < FFieldStrings.Count) then
    Result := liIndex
  else
    Result := -1;

end; {function, GetFieldStringIndex;

{------------------------------------------------------------------------------}
{function TppFileDataStream.GetFieldAsString}

function TppFileDataStream.GetFieldAsString(aFieldName: String): String;
var
  liIndex: Integer;

begin

  liIndex := GetFieldStringIndex(aFieldName);

  if (liIndex >= 0) then
    Result := FFieldStrings[liIndex]
  else
    Result := '';

end; {function, GetFieldAsString}

{------------------------------------------------------------------------------}
{function TppFileDataStream.GetFieldAsInteger}

function TppFileDataStream.GetFieldAsInteger(const aFieldName: String): Longint;
var
  liIndex: Integer;

begin

  liIndex := GetFieldStringIndex(aFieldName);

  if liIndex >= 0 then
    Result := StrToInt(FFieldStrings[liIndex])
  else
    Result := 0;

end; {function, GetFieldAsInteger}

{------------------------------------------------------------------------------}
{function TppFileDataStream.GetFieldAsFloat}

function TppFileDataStream.GetFieldAsFloat(const aFieldName: String): Double;
var
  liIndex: Integer;

begin

  liIndex := GetFieldStringIndex(aFieldName);

  if liIndex >= 0 then
    Result := StrToFloat(FFieldStrings[liIndex])
  else
    Result := 0.0;

end; {function, GetFieldAsFloat}


{------------------------------------------------------------------------------}
{function TppFileDataStream.GetFieldAsBoolean}

function TppFileDataStream.GetFieldAsBoolean(const aFieldName: String): Boolean;
var
  liIndex: Integer;

begin

  liIndex := GetFieldStringIndex(aFieldName);

  if liIndex >= 0 then
    Result := (FFieldStrings[liIndex] = FTextPipeline.BooleanTrue)
  else
    Result := False;

end; {function, GetFieldAsBoolean}



{******************************************************************************
 *
 ** T E X T   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTextPipeline.Create }

constructor TppTextPipeline.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  AutoCreateFields := False;

  FCustomDelimiter := ',';
  FFileName   := '';
  FFileStream := TppFileDataStream.Create(Self);
  FFileType   := ftComma;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTextPipeline.Destroy }

destructor TppTextPipeline.Destroy;
begin

  Close;

  FFileStream.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SetFileName }

procedure TppTextPipeline.SetFileName(const aFileName: String);
begin
  FFileName := aFileName;

  DoOnDataChange;
  PropertyChange;
end; {procedure, SetFileName}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SetFileType }

procedure TppTextPipeline.SetFileType(aFileType: TppFileType);
begin
  FFileType := aFileType;

  DoOnDataChange;

end; {procedure, SetFileType}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SetBooleanTrue }

procedure TppTextPipeline.SetBooleanTrue(aValue: String);
begin
  FBooleanTrue := aValue;

  DoOnDataChange;

end; {procedure, SetBooleanTrue}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SetBooleanFalse }

procedure TppTextPipeline.SetBooleanFalse(aValue: String);
begin
  FBooleanFalse := aValue;

  DoOnDataChange;

end; {procedure, SetBooleanFalse}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SetFileType }

procedure TppTextPipeline.SetCustomDelimiter(aDelimeter: Char);
begin
  FCustomDelimiter := aDelimeter;

  DoOnDataChange;

end; {procedure, SetCustomDelimiter}


{------------------------------------------------------------------------------}
{ TppTextPipeline.GetActive }

function TppTextPipeline.GetActive: Boolean;
begin
  Result := FFileStream.Active;
end; {procedure, GetActive}

{------------------------------------------------------------------------------}
{ TppTextPipeline.SaveToCache }

procedure TppTextPipeline.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  {save record states}
  lRec.FNoRecords   := (ppdaNoRecords in State);
  lRec.FLastRecord  := (ppdaLastRecord in State);
  lRec.FFirstRecord := (ppdaFirstRecord in State);

  lRec.FTraversalCount := TraversalCount;

  {bookmark record position}
  if not(ppdaNoRecords in State) and
     not(FFileStream.BOF) and not(FFileStream.EOF) then
    begin
      lRec.FBookmarked := True;

      lRec.FBookmark := Longint(FFileStream.GetBookmark);
    end
  else
    begin
      lRec.FBookmarked := False;
      
      lRec.FBookmark := 0;
    end;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppTextPipeline.RestoreFromCache }

procedure TppTextPipeline.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  ExcludeState([ppdaNoRecords, ppdaLastRecord, ppdaFirstRecord]);

  if lRec.FNoRecords   then IncludeState([ppdaNoRecords]);
  if lRec.FLastRecord  then IncludeState([ppdaLastRecord]);
  if lRec.FFirstRecord then IncludeState([ppdaFirstRecord]);

  TraversalCount := lRec.FTraversalCount;

  {restore record position}
  if (ppdaFirstRecord in State) then
    First

  else if (ppdaLastRecord in State) then
    Last

  else if lRec.FBookmarked then
    GotoBookmark(lRec.FBookmark);


end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetDataSetName }

function TppTextPipeline.GetDataSetName: String;
begin
  Result := FFileName;
end; {function, GetDataSetName}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldAlignment }

function TppTextPipeline.GetFieldAlignment(aFieldName: String): TAlignment;
begin

  if SetFieldName(aFieldName) then
    Result := CurrentField.Alignment
  else
    Result := taLeftJustify;

end; {function, GetFieldAlignment}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldAsDouble }

function TppTextPipeline.GetFieldAsDouble(aFieldName: String): Double;
begin

  try
    if (ppdaNoRecords in State) then
      Result := 0
    else
      Result := FFileStream.GetFieldAsFloat(aFieldName);
  except
    {note: the report component will likely trap the exception and return '' or 0}
    raise EDataError.Create(ppLoadStr(1024)); {'Invalid Value'}
  end;

end; {function, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldAsPicture }

function TppTextPipeline.GetFieldAsPicture(aFieldName: String): TPicture;
begin
  Result := nil;
end; {function, GetFieldAsPicture}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldAsString }

function TppTextPipeline.GetFieldAsString(aFieldName: String): String;
begin

  try
    if (ppdaNoRecords in State) then
      Result := ''
    else
      Result := FFileStream.GetFieldAsString(aFieldName);
  except
    {note: the report component will likely trap the exception and return '' or 0}
    raise EDataError.Create(ppLoadStr(1024)); {'Invalid Value'}
  end;


end; {function, GetFieldAsString}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldDataType }

function TppTextPipeline.GetFieldDataType(aFieldName: String): TppDataType;
begin
  Result := dtNotknown;

  if SetFieldName(aFieldName) then
    Result := CurrentField.DataType;

end; {function, GetFieldDataType}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldDisplayWidth }

function TppTextPipeline.GetFieldDisplayWidth(aFieldName: String): Integer;
begin
  if SetFieldName(aFieldName) then
    Result := CurrentField.DisplayWidth
  else
    Result := 0;

end; {function, GetFieldDisplayWidth}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldIsCalculated }

function TppTextPipeline.GetFieldIsCalculated(aFieldName: String): Boolean;
begin
  Result := False;
end; {function, GetFieldIsCalculated}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldSize }

function TppTextPipeline.GetFieldSize(aFieldName: string): Integer;
begin

  if SetFieldName(aFieldName) then
    Result := CurrentField.FieldLength
  else
    Result := 0;

end; {function, GetFieldSize}


{------------------------------------------------------------------------------}
{ TppTextPipeline.GetFieldValue }

function TppTextPipeline.GetFieldValue(aFieldName: string): Variant;
begin

  if not Active then
    Open;

  Result := Null;

  if (ppdaNoRecords in State) then Exit;

  if not SetFieldName(aFieldName) then Exit;

  try

    case CurrentField.DataType of

      dtString:
        Result := FFileStream.GetFieldAsString(aFieldName);

    {  dtDate, dtTime, dtDateTime:
          Result := FFileStream.GetFieldAsDateTime(aFieldName);  }

      dtInteger, dtLongint:
        Result := FFileStream.GetFieldAsInteger(aFieldName);

      dtDouble:
        Result := FFileStream.GetFieldAsFloat(aFieldName);

      dtBoolean:
        Result := FFileStream.GetFieldAsBoolean(aFieldName);

      end; {case, datatype}

    except
      {note: the report component will likely trap the exception and return '' or 0}
      raise EDataError.Create(ppLoadStr(1024)); {'Invalid Value'}
    end;


end; {function, GetFieldValue}

{------------------------------------------------------------------------------}
{ TppTextPipeline.IsValidDataType }

function TppTextPipeline.IsValidDataType(aDataType: TppDataType): Boolean;
begin
  Result := aDataType in cValidTextDataType;
  
end; {function, IsValidDataType}


{------------------------------------------------------------------------------}
{ TppTextPipeline.FreeBookmark }

procedure TppTextPipeline.FreeBookmark(aBookmark: Longint);
begin
  FFileStream.FreeBookmark(aBookmark);
end; {procedure, FreeBookmark}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GetBookmark }

function  TppTextPipeline.GetBookmark: Longint;
begin
  Result := FFileStream.GetBookmark;
end; {procedure, GetBookmark}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GotoBookmark }

procedure TppTextPipeline.GotoBookmark(aBookmark: Longint);
begin

  FFileStream.GotoBookmark(aBookmark);

  inherited GotoBookmark(aBookmark);

end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppTextPipeline.CheckBOF }

function TppTextPipeline.CheckBOF: Boolean;
begin
  Result := FFileStream.BOF;

end; {procedure, CheckBOF}

{------------------------------------------------------------------------------}
{ TppTextPipeline.CheckEOF }

function TppTextPipeline.CheckEOF: Boolean;
begin
  Result := FFileStream.EOF;

end; {procedure, CheckEOF}

{------------------------------------------------------------------------------}
{ TppTextPipeline.OpenDataSet }

procedure TppTextPipeline.OpenDataSet;
begin
  FFileStream.Open;
end; {procedure, OpenDataSet}

{------------------------------------------------------------------------------}
{ TppTextPipeline.CloseDataSet }

procedure TppTextPipeline.CloseDataSet;
begin
  FFileStream.Close;

end; {procedure, CloseDataSet}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GotoFirstRecord }

procedure TppTextPipeline.GotoFirstRecord;
begin
  FFileStream.First;

end; {procedure, GotoFirstRecord}

{------------------------------------------------------------------------------}
{ TppTextPipeline.TraverseBy }

procedure TppTextPipeline.TraverseBy(aIncrement: Integer);
begin
  FFileStream.MoveBy(aIncrement);

end; {procedure, MoveBy}

{------------------------------------------------------------------------------}
{ TppTextPipeline.GotoLastRecord }

procedure TppTextPipeline.GotoLastRecord;
begin
  FFileStream.Last;

end; {procedure, GotoLastRecord}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppTextPipeline, TppChildTextPipeline]);

finalization

  UnRegisterClasses([TppTextPipeline, TppChildTextPipeline]);

end.
