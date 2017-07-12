unit UDbfEngine;

interface
uses
  SysUtils,db, classes, ExptIntf, Forms,
  UDbfPagedFile, UDbfFile, UDbfIndex, UDbfMemo,
  UDbfCursor,UDbfFieldDef,UDbfCommon;

{$i _DbfCommon.inc}
type
 	EDbfEngineError = class (Exception);

//====================================================================
  TDbfEngine = class
  public
    _DbfFile: TDbfFile;
    _CurIndex:integer;
		_Indexes:TList;
    _Cursor:TVirtualCursor;
		_DbfCursor:TDbfCursor;
		_dbtFile : TDbtFile;
//		_MdbFile : TIndexFile;
    _IsCursorOpen:boolean;
		_PrevBuffer:pchar;
    _Owner:TDataSet;
		_ShowDeleted : Boolean;
    _ReadOnly: boolean;
//    _DbfFieldDefs:TDbfFieldDefs;

    constructor Create(Owner:TDataSet);
    destructor Destroy; override;
    procedure _OpenFiles(pDBfFieldDefs:TDbfFieldDefs;TableName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
    procedure _OpenMemo(TableName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
    procedure _CloseFiles;
    function _GetPhysicalRecno:integer;
		function _RecordDataSize:integer;
		procedure _ResyncIndexes(Buffer: PChar);
    function GetFieldData(Field: TField; src,dst: Pointer): Boolean; {override virtual abstract from TDataset}
    function GetRecordSize: Word; {override virtual abstract from TDataset}
    function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; {override virtual abstract from TDataset}
    procedure OpenIndex(IndexFileName,IndexField:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
    procedure CloseIndex(IndexFileName:string);
    procedure SetIndex(IndexFileName:string);
    procedure Insert(Buffer:pchar);
    procedure Update(Buffer:pchar);
    procedure CreateFieldDefs(pDBFFieldDefs:TDBFFieldDEfs);
    procedure InitRecord(p:pchar);
  end;

implementation


//====================================================================
// DbfEngine
//====================================================================
constructor TDbfEngine.Create(Owner:TDataSet); {override;}
begin
  _Owner:=Owner;
	_IsCursorOpen:=false;
  _Indexes:=TList.Create;
//  _DbfFieldDefs:=TDbfFieldDefs.Create;
end;

destructor TDbfEngine.Destroy; {override;}
begin
  FreeAndNil(_Indexes);
//  FreeAndNil(_DbfFieldDefs);
end;

procedure TDbfEngine._OpenFiles(pDBfFieldDefs:TDBfFieldDefs;TableName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
  i:integer;
  lIndex:TVirtualCursor;
{  lPath:string;
  fileopenmode : integer;
  isAbsolute:boolean;
  lIndexFile:TIndexFile;}
begin
  if (csDesigning in _Owner.ComponentState) then ReadOnly:=true;
  _ReadOnly:=ReadOnly;

//  lIndexName:=ChangeFileExt(TableName,'.mdx');

  //_DbfFile:=GetDbfFile(lFileName,Create,ReadOnly);
  _DbfFile:=TDbfFile(GetPagedFile(TableName));
  if _DbfFile=nil then _DbfFile:=TDbfFile.Create(TableName,Mode,AutoCreate,ReadOnly);

  if _DbfFile.isNew or (mode=pfCreate) then begin
    _dbfFile.CreateTable(pDBfFieldDefs);
//    _dbfFile._ConstructFieldList;
  end else begin
    _dbfFile.GetFieldList(pDBfFieldDefs);
  end;
  _DbfCursor:=TDbfCursor.Create(_DbfFile);
  _PrevBuffer:=stralloc(GetRecordSize);
  _Cursor:=_DbfCursor;
end;

procedure TDbfEngine._OpenMemo(TableName:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
  lMemoName : string;
  i:integer;
begin
  if (csDesigning in _Owner.ComponentState) then ReadOnly:=true;
  _ReadOnly:=ReadOnly;

  lMemoName:=ChangeFileExt(TableName,'.dbt');

  _dbtFile:=TDbtFile(GetPagedFile(lMemoName));
  if _dbtFile=nil then _dbtFile:=TDbtFile.Create(lMemoName,Mode,AutoCreate,ReadOnly,_DbfFile.DbfVersion);
  // Correct the referencing counter
  if assigned(_dbtFile) then _dbtFile.AddRef;
end;

procedure TDbfEngine._CloseFiles;
var
  i:integer;
	lindex:TVirtualCursor;
begin
  if _ReadOnly=false then _DbfFile.WriteHeader;


  if _DbfCursor<>nil then begin
    _DbfCursor.Free;
    _DbfCursor:=nil;
  end;

  for i:=_Indexes.Count-1 downto 0 do begin
  	lindex:=TVirtualCursor(_indexes.Items[i]);
    lindex.Free;
  end;
  _Indexes.Clear;

  if _dbtFile<>nil then begin
    _dbtFile.Release;
    _dbtFile:=nil;
  end;

  if (_PrevBuffer<>nil) then begin
    StrDispose(_PrevBuffer);
    _PrevBuffer:=nil;
  end;
  _IsCursorOpen:=false;
end;

function TDbfEngine._GetPhysicalRecno:integer;
begin
  Result:=_Cursor.PhysicalRecno;
end;


function TDbfEngine._RecordDataSize:integer;
begin
  if _DbfCursor=nil then result:=0
  else result:=_DbfCursor.RecordSize;
end;

procedure TDbfEngine._ResyncIndexes(Buffer: PChar);
begin
end;

function TDbfEngine.GetFieldData(Field: TField; Src,Dst: Pointer): Boolean; {override virtual abstract from TDataset}
begin
	if Field.FieldNo>0 then begin
		Result:=_DbfFile.GetFieldData(Field.FieldNo - 1,Field.DataType,Src,Dst);
	end else begin { calculated fields.... }
		Inc(PChar(Src), Field.Offset + GetRecordSize);
		Result := Boolean(PChar(Dst)[0]);
		if Result and (Src <> nil) then
			Move(PChar(Src)[1], Dst^, Field.DataSize);
	end;
end;

function TDbfEngine.GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; {override virtual abstract from TDataset}
var
	Acceptable : Boolean;
  lPhysicalRecno:integer;
begin
	if (_DbfFile.RecordCount<1) or (_Cursor=nil) then
		Result := grEOF
	else repeat
		result := grOk;
		case GetMode of
			gmCurrent :
				begin
					//if prec.BookmarkData.Recno=_PhysicalRecno then begin
					//	exit;		// try to fasten a bit...
					//end;
				end;
			gmNext :
				begin
          Acceptable:=_Cursor.Next;
					if Acceptable then begin
						result:= grOk;
					end else begin
						_Cursor.Last;
						result:= grEOF
					end;
				end;
			gmPrior :
				begin
          Acceptable:=_Cursor.Prev;
					if Acceptable then begin
						result:= grOk;
					end else begin
						_Cursor.First;
						result:= grBOF
					end;
				end;
		end;
		if result=grOk then begin
			lPhysicalRecno:=_Cursor.PhysicalRecno;
      if (lPhysicalRecno>_DbfFile.RecordCount)
				or (lPhysicalRecno<=0) then begin
				result:=grError;
			end else begin
				_DbfFile.ReadRecord(lPhysicalRecno,Buffer);
				result:=grOk;
			end;
		end;
		Acceptable := _ShowDeleted or (PCHAR(Buffer)^ = ' ');
		if (GetMode=gmCurrent) and Not Acceptable then Result := grError;
	until (Result <> grOK) or Acceptable;
end;

function TDbfEngine.GetRecordSize: Word; {override virtual abstract from TDataset}
begin
	Result := _RecordDataSize; // data only
end;

procedure TDbfEngine.OpenIndex(IndexFileName,IndexField:string;Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
//  lFileName:string;
  lIndexFile:TIndexFile;
  lFieldInfo:TDbfFieldDef;
  cur,last,i:integer;
  lIndexCursor,lExistingCursor:TVirtualCursor;

begin
//  lFileName:=IndexFileName;
//  lFileName:=_ExpandFileName(ExtractFilePath(_DbfFile.Filename),lFileName);
  lIndexFile:=TIndexFile(GetPagedFile(IndexFileName));
  if lIndexFile=nil then begin
    if not fileexists(IndexFileName) then Mode:=pfCreate;
    if mode=pfOpen then begin
      lIndexFile:=TIndexFile.Create(IndexFileName,pfOpen,false,false);
      lFieldInfo:=_DbfFile.GetFieldInfo(PNdxHdr(lIndexFile.Header).KeyDesc);
      if lFieldInfo=nil then raise EDbfEngineError.Create('Index based on unknown field "' + PNdxHdr(lIndexFile.Header).KeyDesc + '"');
      lIndexFile._FieldPos := lFieldInfo.Offset;
      lIndexFile._FieldLen := lFieldInfo.Size;
    end else begin
      lFieldInfo:=_DbfFile.GetFieldInfo(IndexField);
      if lFieldInfo=nil then raise EDbfEngineError.Create('Cannot create index based on field "' + IndexField + '"');
      lIndexFile:=TIndexFile.Create(IndexFileName,pfCreate,false,false);
      lIndexFile.SetFieldInfo(lFieldInfo.Offset,lFieldInfo.Size,IndexField);
    end;
  end;
  if lIndexFile=nil then raise EDbfEngineError.Create('Cannot open index : "' + IndexFileName + '"');
  if (mode=pfCreate) then lIndexFile.Clear;
  lIndexCursor:=nil;
  for i:=0 to _Indexes.count-1 do begin
    lExistingCursor:=TIndexCursor(_Indexes.Items[i]);
    if lExistingCursor.PagedFile = lIndexFile then begin
      lIndexCursor:=lExistingCursor;
      break;
    end;
  end;
  if lIndexCursor=nil then begin
    lIndexCursor:=TIndexCursor.Create(lIndexFile);
    if lIndexCursor<>nil then _Indexes.Add(lIndexCursor);
  end;
  if (mode=pfCreate) and (lIndexCursor<>nil) then begin
    lIndexFile.Init;    
    cur:=1;
    last:=_DbfFile.RecordCount;
    while cur<=last do begin
      _DbfFile.ReadRecord(cur, _PrevBuffer);
      lIndexCursor.Insert(cur,_PrevBuffer);
      inc(cur);
    end;
  end;
end;

procedure TDbfEngine.CloseIndex(IndexFileName:string);
var
  i,lIndexNo:integer;
  lIndex,lIndexCursor:TVirtualCursor;
begin
  lIndexNo:=-1;
  for i:=0 to _Indexes.Count-1 do begin
    lIndexCursor:=TIndexCursor(_Indexes.Items[i]);
    if lIndexCursor.PagedFile.FileName=IndexFileName then begin
      lIndexNo:=i;
      lIndex:=lIndexCursor;
      break;
    end;
  end;
  if (lIndexNo>=0) then begin
    _Indexes.Delete(lIndexNo);
    lIndex.Free;
    if (_CurIndex=lIndexNo) then begin
      _CurIndex:=-1;
      _Cursor:=_DbfCursor;
      if _Owner.Active then _Owner.Resync([]);
    end;
  end;
end;

procedure TDbfEngine.SetIndex(IndexFileName:string);
var
  i,lIndexNo:integer;
  lIndex,lIndexCursor:TVirtualCursor;
begin
  lIndexNo:=-1;
  for i:=0 to _Indexes.Count-1 do begin
    lIndexCursor:=TIndexCursor(_Indexes.Items[i]);
    if lIndexCursor.PagedFile.FileName=IndexFileName then begin
      lIndexNo:=i;
      lIndex:=lIndexCursor;
      break;
    end;
  end;
  _CurIndex:=lIndexNo;
  if lIndexNo>=0 then _Cursor:=lIndexCursor
  else _Cursor:=_DbfCursor;
  if _Owner.Active then _Owner.Resync([]);
end;

procedure TDbfEngine.Insert(Buffer:pchar);
var
  i:integer;
  newrecord:integer;
  lindex:TVirtualCursor;
begin
  newRecord:=_DbfFile.RecordCount+1;
  _DbfCursor.SetRecNo(newRecord);
	_dbfFile.WriteRecord(newRecord,Buffer);
  if _indexes.Count>0 then begin
		for i:=0 to _indexes.Count-1 do begin
			lindex:=TVirtualCursor(_indexes.Items[i]);
      lindex.Insert(newRecord,Buffer);
		end;
	end;
// OH 2000-11-15 dBase7 support.
// After insert a new record we have to inc the autoinc fields.
  _DbfFile.IncAutoInc;
end;

procedure TDbfEngine.Update(Buffer:pchar);
var
  i:integer;
  lindex:TVirtualCursor;
begin
  //_Engine._Cursor.Append;
  if _indexes.Count>0 then begin
		_dbfFile.ReadRecord(_Cursor.PhysicalRecno,_PrevBuffer);
  end;
  _dbfFile.WriteRecord(_Cursor.PhysicalRecno,Buffer);
  if _indexes.Count>0 then begin
		for i:=0 to _indexes.Count-1 do begin
			lindex:=TVirtualCursor(_indexes.Items[i]);
			lindex.Update(_Cursor.PhysicalRecno,_PrevBuffer,Buffer);
		end;
	end;
end;

procedure TDbfEngine.CreateFieldDefs(pDBFFieldDefs:TDBFFieldDEfs);
var
  Il : Integer;
  ft:TFieldType;
  nfs,fd:Integer;
  MyFieldDef:TDbfFieldDef;
begin
  _Owner.FieldDefs.Clear;
  nfs:=0;
  fd:=0;
  _DbfFile.GetFieldList(pDBfFieldDefs);
  for Il:=0 to pDBfFieldDefs.Count-1 do begin
    MyFieldDef:=pDbfFieldDefs.Items[Il];
    nfs := MyFieldDef.Size;
    fd  := MyFieldDef.Prec;
    ft:=MyFieldDef.FieldType;
    if ft in [ftString,ftBCD] then
      _Owner.FieldDefs.Add(MyFieldDef.Name ,ft,MyFieldDef.Size,false)
    else
      _Owner.FieldDefs.Add(MyFieldDef.Name,ft,0,false);
// AutoInc fields are readonly
{$ifdef DELPHI_5}
    if ft = ftAutoInc then
      _DbfFieldDefs[Il].Attributes :=[faReadOnly];
{$endif}
  end;
end;

procedure TDBfEngine.InitRecord(p:pchar);
begin
  fillchar(p,_RecordDataSize,#0);
  p[0] := ' ';
  _DbfFile.InitRecord(p);
end;


(*
  Stuffs non implemented yet
  TDBaseMDXHeader       = Record
    MDXVersion          : Byte;
    Year                : Byte;
    Month               : Byte;
    Day                 : Byte;
    FileName            : TMDXFileName;
    BlockSize           : Word;
    BlockSizeAdder      : Word;
    ProductionIndexFlag : Byte;
    NumTags             : Byte;
    TagLength           : Byte;
    Reserved_27         : Byte;
    NumTagsUsed         : Word;
    Reserved_30_31      : Word;
    NumPages            : Cardinal;
    FreePage            : Cardinal;
    FreeBlocks          : Cardinal;
    UpdateYear          : Byte;
    UpdateMonth         : Byte;
    UpdateDay           : Byte;
    Reserved_47         : Byte;
  End;
  PDBaseMDXHeader       = ^TDBaseMDXHeader;

  TFoxCDXHeader         = Record
    PointerRootNode     : Integer;
    PointerFreeList     : Integer;
    Reserved_8_11       : Cardinal;
    KeyLength           : Word;
    IndexOption         : Byte;
    IndexSignature      : Byte;
    Reserved_Null       : TFoxReservedNull;
    SortOrder           : Word;
    TotalExpressionLen  : Word;
    ForExpressionLen    : Word;
    Reserved_506_507    : Word;
    KeyExpressionLen    : Word;
    KeyForExpression    : TKeyForExpression;
  End;
  PFoxCDXHeader         = ^TFoxCDXHeader;

  TFoxCDXNodeCommon     = Record
    NodeAttributes      : Word;
    NumberOfKeys        : Word;
    PointerLeftNode     : Integer;
    PointerRightNode    : Integer;
  End;

  TFoxCDXNodeNonLeaf    = Record
    NodeCommon          : TFoxCDXNodeCommon;
    TempBlock           : Array [12..511] of Byte;
  End;
  PFoxCDXNodeNonLeaf    = ^TFoxCDXNodeNonLeaf;

  TFoxCDXNodeLeaf       = Packed Record
    NodeCommon          : TFoxCDXNodeCommon;
    BlockFreeSpace      : Word;
    RecordNumberMask    : Integer;
    DuplicateCountMask  : Byte;
    TrailByteCountMask  : Byte;
    RecNoBytes          : Byte;
    DuplicateCountBytes : Byte;
    TrailByteCountBytes : Byte;
    HoldingByteCount    : Byte;
    DataBlock           : TDataBlock;
  End;
  PFoxCDXNodeLeaf       = ^TFoxCDXNodeLeaf;

*)

end.



