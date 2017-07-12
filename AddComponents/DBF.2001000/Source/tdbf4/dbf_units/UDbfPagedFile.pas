unit UDbfPagedFile;

interface

uses
  classes, SysUtils;

type
	xBaseVersion = (xUnknown,xClipper,xBaseIII,xBaseIV,xBaseV,xBaseVII,xFoxPro,xVisualFoxPro);

  EPagedFile = Exception;

  TPagedFileMode = (pfOpen,pfCreate);



	TPagedFile = class(TObject)
  private
    _HeaderSize : Integer;
    _RecordSize : Integer;
    _Cntuse:integer;
    _Filename:string;
    _RecordCount:integer;
    _Header:pchar;
    _Stream : TStream;
    _CacheSize : integer;
    _isNew  : boolean;
	protected
    procedure _SetRecordSize(value:integer);
    procedure _SetHeaderSize(value:integer);
    procedure _RecalcRecordCount;
    procedure _FillHeader(char:byte);
  public
    constructor Create(lFileName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
    destructor Destroy; override;

    procedure AddRef;
    procedure Release;
		procedure ReadRecord(IntRecNum:Integer;Buffer:Pointer);
		procedure WriteRecord(IntRecNum:Integer;Buffer:Pointer);
    procedure WriteHeader; virtual;

    procedure _SetRecordCount(value:Integer);
    procedure WriteChar(c:byte);
		procedure SeekPage(page:Integer);

    property HeaderSize : Integer read _HeaderSize write _SetHeaderSize;
    property RecordSize : Integer read _RecordSize write _SetRecordSize;
    property RecordCount : integer read _RecordCount write _SetRecordCount;
    property Header : PChar read _Header;
    property FileName : string read _Filename;
    property IsNew: boolean read _IsNew;
 	end;

function GetPagedFile(FileName: string):TPagedFile;

implementation

var
		_PagedFiles : TList;
//====================================================================
// TPagedFile
//====================================================================
function GetPagedFile(FileName: string):TPagedFile;
var
  idx:integer;
  idf:TPagedFile;
begin
  FileName:=UpperCase(FileName);
  for idx:=0 to _PagedFiles.Count-1 do begin
    idf:= TPagedFile(_PagedFiles[idx]);
    if idf._FileName=FileName then begin
      result:=idf;
      exit;
    end;
  end;
  result:=nil;
end;

procedure TPagedFile.AddRef;
begin
   Inc(_cntuse);
end;

procedure TPagedFile.Release;
begin
  dec(_cntuse);
  if _cntuse<=0 then begin
    _PagedFiles.Delete(_PagedFiles.IndexOf(self));
    Free;
  end;
end;

constructor TPagedFile.Create(lFileName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
  fileopenmode:word;
begin
  if not fileExists(lFileName) then begin
    if AutoCreate or (Mode = pfCreate) then fileopenmode:=fmCreate
    else raise EPagedFile.Create ('Open: Table file not found : ' + lFileName);
    _IsNew:=true;
  end else begin
    if ReadOnly  then fileopenmode := fmOpenRead + fmShareDenyNone
    else fileopenmode := fmOpenReadWrite + fmShareDenyNone; // + fmShareDenyWrite;
    _IsNew:=false;
  end;
  _Stream:=TFileStream.Create(lFileName, fileopenmode);
  //_Stream:=TFileStream.Create(FileName,Mode);

	_HeaderSize:=0;
  _RecordSize:=0;
  _cntuse:=0;
  _Header:=nil;
  _filename:=Uppercase(lFileName);
  _PagedFiles.Add(Self);
  _RecalcRecordCount;
end;

procedure TPagedFile._RecalcRecordCount;
begin
  if _RecordSize=0 then _RecordCount:=0
  else _RecordCount:=(_Stream.Size - _HeaderSize) div _RecordSize;
  if _RecordCount<0 then _RecordCount:=0;
end;

destructor TPagedFile.Destroy;
begin
  _Stream.Free;
  _Stream:=nil;
  inherited;
end;

procedure TPagedFile.SeekPage(page:Integer);
var
  p:Integer;
begin
  p:=_HeaderSize + (_RecordSize * (page-1) );
  _Stream.Position := p;
end;

Procedure TPagedFile.ReadRecord(IntRecNum:Integer; Buffer:Pointer);
begin
  SeekPage(IntRecNum);
  _Stream.Read(Buffer^,_RecordSize);
end;

procedure TPagedFile.WriteRecord(IntRecNum:Integer; Buffer:Pointer);
begin
  SeekPage(IntRecNum);
	_Stream.Write(Buffer^, _RecordSize);
  if IntRecNum>=_RecordCount then _RecordCount:=IntRecNum;
end;

procedure TPagedFile.WriteHeader;
begin
  _Stream.Position := 0;
	_Stream.Write(_Header^, _HeaderSize);
end;


procedure TPagedFile._SetHeaderSize(value:integer);
begin
  if _HeaderSize<>value then begin
    if _Header<>nil then strDispose(_Header);
    _HeaderSize:=value;
    if _HeaderSize<>0 then _Header:=strAlloc(_HeaderSize)
    else _Header:=nil;
    _RecalcRecordCount;
    _FillHeader(0);
    _Stream.Position := 0;
    _Stream.Read(_Header^,_HeaderSize);
  end;
end;

procedure TPagedFile._FillHeader(char:byte);
begin
  if _Header=nil then exit;
  FillChar(_Header^,_HeaderSize,char);
end;


procedure TPagedFile._SetRecordSize(value:integer);
begin
  _RecordSize:=value;
  _RecalcRecordCount;
end;

procedure TPagedFile._SetRecordCount(value:Integer);
begin
  _Stream.Size:=_HeaderSize + _RecordSize * value;
  _RecalcRecordCount;
end;

procedure TPagedFile.WriteChar(c:byte);
begin
	_Stream.Write(c, 1);
end;

initialization
		_PagedFiles := TList.Create;

finalization
		_PagedFiles.free;

end.

