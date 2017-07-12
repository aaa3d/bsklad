unit dbf;
{===============================================================================
||         TDbf Component         ||         http://tdbf.netfirms.com         ||
===============================================================================}
(*
  tDBF is supplied as is. The author disclaims all warranties,
  expressed or implied, including, without limitation, the warranties of
  merchantability and of fitness for any purpose. The author assumes no
  liability for damages, direct or consequential, which may result from the
  use of MyDBF.

  You are allowed to use this component in any project free of charge.
  You are
    NOT allowed to claim that you have created this component.  You are
    NOT allowed to copy this component's code into your own component and
  claim that the code is your idea.

*)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  UDbfPagedFile, UDbfFile, UDbfIndex, UDbfMemo,
  UDbfCursor, UDbfEngine, UDbfFieldDef,UDbfCommon
  ;
// If you got a compilation error here or asking for dsgntf.pas, then just add
// this file in your project:
// dsgnintf.pas in 'C:\Program Files\Borland\Delphi5\Source\Toolsapi\dsgnintf.pas'


{$i _dbfCommon.inc}
//====================================================================
// Delphi is a bit to permissive for me,  I mean protected doesn't work within
// one unit. So i decided that convention:
//    private member begins by '_'
// It's forbidden to access any '_something' except from the class where it
// is defined. To check that, I just have to look for '._' anywhere in the code.
//====================================================================
type

//====================================================================
//====================================================================
	TDbf = class;
//====================================================================
  TMyBlobFile = class(TMemoryStream)
  public
    Mode: TBlobStreamMode;
    Field:TField;
    MemoRecno:Integer;
    ReadSize:Integer;
    constructor Create(ModeVal:TBlobStreamMode; FieldVal:TField);
    destructor destroy;  override;
  end;
//====================================================================
	rBeforeRecord = record
    BookmarkData: rBookmarkData;
    BookmarkFlag: TBookmarkFlag;
    //... record come here
  end;
//====================================================================
  pDbfRecord = ^rDbfRecord;
  rDbfRecord = record
    BookmarkData: rBookmarkData;
    BookmarkFlag: TBookmarkFlag;
    DeletedFlag : char;
    Fields : array[0..4000] of char;
  end;
//====================================================================
	TCompareRecordEvent = procedure(Dbf: TDbf;
		var Accept: Boolean) of object;

	TTranslateEvent = procedure(Dbf: TDbf; Src, Dest: PChar; ToOem: Boolean) of object;

	TOnIndexFilter = procedure(First,Last:PChar;var Accept: Boolean) of object;

  TDbfStorage = (stoMemory,stoAuto,stoFile);
  TDbfOpenMode = (omNormal,omAutoCreate,omTemporary);
// and at LEAST the most useful class : TDbf
//====================================================================
  TDbfIndexDef = class;

  TDbfIndexCollection = class(TCollection)
  public
  	_Owner : TDataset;
	 private
    function GetItem(n:integer) : TDbfIndexDef;
		procedure SetItem(n:integer;Value:TDbfIndexDef);
	 protected
		function getowner : Tpersistent; override;
	 public
		constructor Create(Owner:TDataset);
		function Add : TDbfIndexDef;
    function GetIndexByFilename(FileName:string):TDbfIndexDef;
		property Items[n:integer]:TDbfIndexDef read GetItem write SetItem; default;
  end;
//====================================================================
	TDbfIndexDef = class(TCollectionItem)
  protected
		_IndexDefFileName: string;
    procedure _SetIndexDefFileName(value:string);
	public
		_SortField: string;
    constructor Create(Collection: TCollection); override;
		destructor Destroy; override;
  published
    property IndexFile:string read _IndexDefFileName write _SetIndexDefFileName;
    property SortField:string read _SortField write _SortField;
	end;
//====================================================================
  PIndex = ^TDbfIndexDef;
//====================================================================
	TDbf = class(TDataSet)
	private
		_OnCompareRecord:TNotifyEvent;
		_OnIndexFilter:TOnIndexFilter;
    _OpenMode:TDbfOpenMode;
    _Storage:TDbfStorage;
		_TableName: string;    // table path and file name
		_RelativePath: string;
    _AbsolutePath: string;
    _IndexName:string;
    _ReadOnly:boolean;
    _Engine:TDbfEngine;
		_FilterBuffer:pchar;
    _IndexDefs:TDbfIndexCollection;
    _FieldDefs:TDbfFieldDefs;
    _OnTranslate:TTranslateEvent;

		procedure _SetIndexname(IndexFile: string);
		procedure _SetDbfIndexes(Value:TDbfIndexCollection);
    procedure _SetFieldDefs(Value:TDbfFieldDefs);
    procedure _SetRelativePath(value:string);
		procedure _SetTableName(const s:string);
    procedure _SetVersion(s: string);

    function _ComponentInfo:string;
    function _GetIndexname: string;
    function _GetVersion: string;
    function _GetPhysicalRecno:integer;

		function _GetShowDeleted: boolean;
		procedure _SetShowDeleted(Value: boolean);
    procedure _FlushBuffers; // Andreas where is that called ?
    procedure _CheckDbfFieldDef;
	public
		{ my own methods and properties}
		{ most looks like ttable functions but they are not tdataset related
     I use the same syntax to facilitate the conversion between bde and tdbf  }
    easyfilter:string;

    procedure About;
{$ifdef DELPHI_3}
		procedure AddIndex(const IndexFile, Fields: String; Options: TIndexOptions);
{$else}
		procedure AddIndex(const IndexFile, Fields: String; Options: TIndexOptions; const DescFields: String='');
{$endif}

    procedure CreateTable; //(FieldDefs:TFieldDefs);
// Index Support (use same syntax that tTable but is not related)
		procedure OpenIndexFile(IndexFile:string);
    procedure DeleteIndex(const IndexFile: string);
    procedure CloseIndexFile(const IndexFile: string);
    procedure PackTable;
		property PhysicalRecno:integer read _GetPhysicalRecno;
    function Locate (const KeyFields : String; const KeyValues : Variant; Options : TLocateOptions) : Boolean; override;
    function LocateRecord (const KeyFields : String; const KeyValues : Variant; Options : TLocateOptions; bSyncCursor : Boolean) : Boolean;
    property AbsolutePath: string read _AbsolutePath;
  published
    property Version:string read _GetVersion write _SetVersion;
		property Indexes:TDbfIndexCollection read _IndexDefs write _SetDbfIndexes;
		property OnIndexFilter:TOnIndexFilter read _OnIndexFilter write _OnIndexFilter;
    property IndexName:string read _GetIndexname write _SetIndexname;
		property OpenMode:TDbfOpenMode read _OpenMode write _OpenMode;
    property Storage:TDbfStorage read _Storage write _Storage;
    property FieldDefs : TDbfFieldDefs read _FieldDefs write _SetFieldDefs;
  public
    { abstract methods }
		function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override; {virtual abstract}
    {virtual methods (mostly optionnal) }
		function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override; {virtual}
{$ifdef DELPHI_3}
    procedure Translate(Src, Dest: PChar; ToOem: Boolean); override; {virtual}
{$else}
    function Translate(Src, Dest: PChar; ToOem: Boolean): Integer; override; {virtual}
{$endif}
    procedure ClearCalcFields(Buffer : PChar); override;
  protected
    { abstract methods }
    function AllocRecordBuffer: PChar; override; {virtual abstract}
		procedure FreeRecordBuffer(var Buffer: PChar); override; {virtual abstract}
		procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override; {virtual abstract}
    function GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; override; {virtual abstract}
		function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override; {virtual abstract}
		function GetRecordSize: Word; override; {virtual abstract}
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override; {virtual abstract}
    procedure InternalClose; override; {virtual abstract}
    procedure InternalDelete; override; {virtual abstract}
		procedure InternalFirst; override; {virtual abstract}
    procedure InternalGotoBookmark(Bookmark: Pointer); override; {virtual abstract}
		procedure InternalHandleException; override; {virtual abstract}
    procedure InternalInitFieldDefs; override; {virtual abstract}
    procedure InternalInitRecord(Buffer: PChar); override; {virtual abstract}
    procedure InternalLast; override; {virtual abstract}
    procedure InternalOpen; override; {virtual abstract}
    procedure InternalPost; override; {virtual abstract}
    procedure InternalSetToRecord(Buffer: PChar); override; {virtual abstract}
    function IsCursorOpen: Boolean; override; {virtual abstract}
		procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override; {virtual abstract}
    procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override; {virtual abstract}
    procedure SetFieldData(Field: TField; Buffer: Pointer); override; {virtual abstract}
		{virtual methods (mostly optionnal) }

		function GetRecordCount: Integer; override; {virtual}
		function GetRecNo: Integer; override; {virtual}
		procedure SetRecNo(Value: Integer); override; {virual}
    function GetCanModify: Boolean; override; {virtual}
    procedure SetFiltered(Value: Boolean); override; {virtual;}
  public
    function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer; override;
    constructor Create(AOwner: TComponent); override;
		destructor Destroy; override;

	published
    property ComponentInfo: string  read _ComponentInfo;
    property TableName: string  read _TableName write _SetTableName;
    property FilePath: string  read _RelativePath write _SetRelativePath;
    property ReadOnly : Boolean read _ReadOnly write _Readonly default False;
    property ShowDeleted:boolean read _GetShowDeleted write _SetShowDeleted;
		property OnCompareRecord:TNotifyEvent read _OnCompareRecord write _OnCompareRecord;
		// redeclared data set properties
    property Active;
    property Filtered;
    property BeforeOpen;
		property AfterOpen;
    property BeforeClose;
		property AfterClose;
		property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
		property BeforePost;
    property AfterPost;
		property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
		property OnPostError;
    property OnTranslate:TTranslateEvent read _OnTranslate write _OnTranslate;
	end;

var
  _DbfExePath:string;

implementation

// OH 2000-11-15 load the icon resource
//$R dbf.dcr

//====================================================================
// Some types and consts which are not useful in the interface.
//====================================================================
(*
 * tSmallint  16 bits = -32768 to 32767
 *                      123456 = 6 digit max
 * ftInteger  32 bits = -2147483648 to 2147483647
 *                      12345678901 = 11 digits max
 * ftLargeInt 64 bits = -9223372036854775808 to 9223372036854775807
 *                      12345678901234567890 = 20 digits max
 *)

type
 	EDbfError = class (Exception);

//====================================================================
function _ExpandPath(base,path:string):string;
begin
  if ((length(path)>=1) and (path[1]='\'))
    or ((length(path)>=2) and (path[2]=':')) then begin
    // if the _FilePath is absolute...
    // it is either \ or \blahblah or c:\
    base:=path;
  end else begin
    path:= base + path;
  end;
  path:=ExpandFileName(path);
  if (length(path)>0)
     and (path[length(path)]<>'\') then begin
     path:=path+'\';
  end;
  Result:=UpperCase(path);
end;

//====================================================================
function _ExpandFileName(base:string;FileName:string):string;
var
  lpath:string;
  lfile:string;
begin
  lpath:=_ExpandPath(base,ExtractFilePath(FileName));
  lfile:=ExtractFileName(FileName);
  lpath:=lpath+lfile;
  UpperCase(lpath);
  result:=lpath;

end;
(*
		_PrevBuffer:pchar;
*)

//====================================================================
procedure TDbf._SetRelativePath(value:string);
begin
	CheckInactive;
  _RelativePath:=value;
  _AbsolutePath:=_ExpandPath(_DbfExePath,_RelativePath);
end;

procedure TDbf._SetTableName(const s:string);
var
  lpath:string;
begin
  _TableName:=ExtractFileName(s);
  lpath:=ExtractFilePath(s);
  if length(lpath)>0 then begin
    lpath:=ExtractRelativePath(_DbfExePath,lpath);
    FilePath:=lpath;
  end;
end;

procedure TDbf._SetDbfIndexes(Value:TDbfIndexCollection);
begin
	_IndexDefs.Assign(Value);
end;

procedure TDbf._SetFieldDefs(Value:TDbfFieldDefs);
begin
	_FieldDefs.Assign(Value);
end;


function TDbf._ComponentInfo:string;
begin
  Result:='TDbf V' + IntToStr(_MAJOR_VERSION) + '.' + IntToStr(_MINOR_VERSION);
end;

function TDbf._GetIndexname: string;
begin
  result:=_IndexName;
end;

//==========================================================
//============ TMyBlobFile
//==========================================================
constructor TMyBlobFile.Create(ModeVal:TBlobStreamMode;FieldVal:TField);
begin
  Mode:=ModeVal;
  Field:=FieldVal;
end;

destructor TMyBlobFile.destroy;
var
  Dbf:TDbf;
begin
  if (Mode=bmWrite) then begin
    Size:=Position; // Strange but it leave tailing trash bytes if I do not write that.
    Dbf:=TDbf(Field.DataSet);
    Dbf._Engine._dbtFile.WriteMemo(MemoRecno,ReadSize,Self);

    Dbf._Engine._dbfFile.SetFieldData(Field.FieldNo-1,
      ftInteger,@MemoRecno,@pDbfRecord(TDbf(Field.DataSet).ActiveBuffer).deletedflag);
    // seems not bad
    Dbf.SetModified(true);
    // but would that be better
    //if not (State in [dsCalcFields, dsFilter, dsNewValue]) then begin
    //  DataEvent(deFieldChange, Longint(Field));
    //end;
  end;
	inherited Destroy;
end;

//====================================================================
// TDbf = TDataset Descendant.
//====================================================================
constructor TDbf.Create(AOwner: TComponent); {override;}
begin
	inherited create(aOwner);
  _Engine := TDbfEngine.Create(Self);

	BookmarkSize:=sizeof(rBookmarkData)*1;
  _IndexDefs:= TDbfIndexCollection.Create(self);
  _FieldDefs:= TDbfFieldDefs.Create(self);
  _Storage := stoFile;
  _OpenMode := omAutoCreate;

  _IndexName:='';
  _SetRelativePath('');
  _OnTranslate:=nil;
end;

destructor TDbf.Destroy; {override;}
//var
//	i:integer;
begin
	_IndexName:='';
  FreeAndNil(_IndexDefs);
  FreeAndNil(_FieldDefs);
	inherited Destroy;
  _Engine.Free;
end;

procedure TDbf.About;
begin
  ShowMessage(
    'This program use ' + Version + ' to access its data.' + #13 +
    #13 +
    'For more info, please visit the website : http://tdbf.netfirms.com');
end;

function TDbf.AllocRecordBuffer: PChar; {override virtual abstract from TDataset}
begin
  Result:=stralloc(_engine.GetRecordSize+sizeof(rBeforeRecord)+CalcFieldsSize);
end;

procedure TDbf.FreeRecordBuffer(var Buffer: PChar); {override virtual abstract from TDataset}
begin
  StrDispose(Buffer);
end;

procedure TDbf.GetBookmarkData(Buffer: PChar; Data: Pointer); {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
begin
  prec:=pDbfRecord(Buffer);
  pBookMarkData(Data)^:=prec.BookMarkData;
end;

function TDbf.GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
begin
  prec:=pDbfRecord(Buffer);
  result:=prec.BookMarkFlag;
end;

function TDbf.GetFieldData(Field: TField; Buffer: Pointer): Boolean; {override virtual abstract from TDataset}
var
	src:PChar;
begin
	if State=dsFilter then begin
		src:=_FilterBuffer;
	end else   if State = dsCalcFields then  begin
		// ***** calc fields *****  set correct buffer
		src :=@(pDbfRecord(CalcBuffer).deletedflag);
	end else begin
		if IsEmpty then begin
      result:=false;
      exit;
    end;
		src:=@(pDbfRecord(ActiveBuffer).deletedflag);
	end;
  Result:=_Engine.GetFieldData(Field,src,Buffer);
end;


function TDbf.GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; {override virtual abstract from TDataset}
var
	prec:pDBFRecord;
  acceptable:boolean;
  SaveState:TDataSetState;
  s:string;
begin
	prec:=pDBFRecord(Buffer);
  acceptable:=false;
  repeat
    Result:=_Engine.GetRecord(@prec.DeletedFlag,GetMode,DoCheck);
    if Result=grOk then begin
      if Assigned(OnFilterRecord) and Filtered then begin
        _FilterBuffer:=@prec.DeletedFlag;
        SaveState:=SetTempState(dsFilter);
        OnFilterRecord(self,acceptable);
        RestoreState(SaveState);
      end else if Length(easyfilter)<>0 then begin
        SetString(s,buffer,RecordSize);
        s:=UpperCase(s);
        if Pos(easyfilter,s)>0 then begin
          acceptable:=true;
        end;
      end else acceptable:=true;
      if (GetMode=gmCurrent) and (acceptable=false) then Result:=grError;
    end;
	until (Result <> grOK) or Acceptable;

  if Result = grOK then begin
	 	ClearCalcFields(Buffer); //run automatically
    try
  	  GetCalcFields(Buffer);
    finally
     	prec.BookmarkFlag := bfCurrent;
	   	prec.BookmarkData.CursorBookMark:=_Engine._Cursor.GetBookMark;
    end;
  end;
  //else if (Result = grError) and DoCheck then
  //raise eDbfError.Create ('GetRecord: Invalid record');
end;

function TDbf.GetRecordSize: Word; {override virtual abstract from TDataset}
begin
  Result:=_Engine.GetRecordSize;
end;

procedure TDbf.InternalAddRecord(Buffer: Pointer; Append: Boolean); {override virtual abstract from TDataset}
begin
  // Nothing to do
end;

procedure TDbf.InternalClose; {override virtual abstract from TDataset}
begin
  // disconnect field objects
  BindFields(False);
  // destroy field object (if not persistent)
  if DefaultFields then begin
    DestroyFields;
  end;
  _Engine._CloseFiles;
end;

procedure TDbf.InternalDelete; {override virtual abstract from TDataset}
begin
//  CheckActive;
  pDbfRecord(ActiveBuffer)^.DeletedFlag := '*'; //_DataHdr.LastDeleted;
  _Engine._dbfFile.WriteRecord(_Engine._Cursor.PhysicalRecNo, @pDbfRecord(ActiveBuffer)^.DeletedFlag);
  Resync([]);
end;

procedure TDbf.InternalFirst; {override virtual abstract from TDataset}
begin
  _Engine._Cursor.First;
end;

procedure TDbf.InternalGotoBookmark(Bookmark: Pointer); {override virtual abstract from TDataset}
var
	RecInfo: rBookmarkData;
begin
	RecInfo := rBookmarkData(Bookmark^);
  _Engine._Cursor.GotoBookmark(RecInfo);
end;

procedure TDbf.InternalHandleException; {override virtual abstract from TDataset}
begin
	Application.HandleException(Self);
end;

procedure TDbf.InternalInitFieldDefs; {override virtual abstract from TDataset}
begin
	CheckInactive;
	FieldDefs.Clear;
	with FieldDefs do
	begin
    _CheckDbfFieldDef;
    _Engine._OpenFiles(_FieldDefs,_AbsolutePath + _TableName,pfOpen,false,true);
    _Engine.CreateFieldDefs(_FieldDefs);
    _Engine._CloseFiles();
  end;
end;

procedure TDbf.InternalInitRecord(Buffer: PChar); {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
  i : Integer;
  MyFieldInfo:TDbfFieldDef;
  IntValue : Integer;
begin
  prec:=pDbfRecord(Buffer);
	prec.BookmarkData.CursorBookMark:=-1;
  prec.BookmarkFlag:=TBookmarkFlag(0);
// OH 2000-11-15 dBase7 support.
// Init Record with zero and set autoinc field with next value
  if _Engine._DbfFile.DbfVersion < xBaseVII then begin
    fillchar(prec.DeletedFlag,_Engine._RecordDataSize,' ');
  end else begin
    _Engine._DbfFile.InitRecord(@prec.DeletedFlag);
  end;
end;

procedure TDbf.InternalLast; {override virtual abstract from TDataset}
begin
  _Engine._Cursor.Last;
end;

procedure TDbf.InternalOpen; {override virtual abstract from TDataset}
var
  i:integer;
  lIndex:TDbfIndexDef;
  hasMemo:boolean;
begin
  _CheckDbfFieldDef;
  _Engine._OpenFiles(_FieldDefs,_AbsolutePath + _TableName,pfOpen,_OpenMode in [omAutoCreate,omTemporary],_ReadOnly);
//	FieldDefs.Clear;
  _Engine.CreateFieldDefs(_FieldDefs);
  // create the fields dynamically
  if DefaultFields then begin
    CreateFields; // Create fields from fielddefs.
  end;

  BindFields (True);

  hasMemo:=false;
  for i:=0 to FieldCount-1 do begin
    if Fields[i].isBlob then hasMemo:=true;
  end;
  if hasMemo then begin
    _Engine._OpenMemo(_AbsolutePath + _TableName,pfOpen,_OpenMode in [omAutoCreate,omTemporary],_ReadOnly);
  end;

  for i:=0 to _IndexDefs.Count-1 do begin
    lIndex:=_IndexDefs.Items[i];
    _Engine.OpenIndex(_ExpandFileName(_AbsolutePath,lIndex._IndexDefFileName),lIndex._SortField,pfOpen,true,_ReadOnly);
  end;
  _Engine.SetIndex(_IndexName);
  _Engine._IsCursorOpen:=true;
  InternalFirst;
end;

procedure TDbf.InternalPost; {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
begin
	CheckActive;
	prec:=pDbfRecord(ActiveBuffer);
	prec.DeletedFlag:=' ';

	if State = dsEdit then
	begin
    _Engine.Update(@prec.DeletedFlag);
	end else begin
    _Engine.Insert(@prec.DeletedFlag);
	end;
end;

procedure TDbf._CheckDbfFieldDef;
var
	ix:integer;
begin
  if  _FieldDefs.Count=0 then begin
    for Ix := 0 to FieldCount - 1 do	begin
      with Fields[Ix] do begin
        if FieldKind = fkData then
          _FieldDefs.Add(FieldName,DataType,Size,Required);
      end;
    end;
  end;
end;

procedure TDbf.CreateTable; //(FieldDefs:TFieldDefs);
var
	ix:integer;
  lIndex:TDbfIndexDef;
begin
	CheckInactive;
	//  InternalInitFieldDefs;
  _CheckDbfFieldDef;
  try
    _Engine._OpenFiles(_FieldDefs,_AbsolutePath + _TableName,pfCreate,true,false);
    for ix:=0 to _IndexDefs.Count-1 do begin
      lIndex:=_IndexDefs.Items[ix];
      _Engine.OpenIndex(_ExpandFileName(_AbsolutePath,lIndex._IndexDefFileName),lIndex._SortField,pfCreate,true,_ReadOnly);
    end;
  finally
    // close the file
    _Engine._CloseFiles;
  end;
end;

procedure TDbf.PackTable;
begin
  CheckBrowseMode;
	_Engine._dbfFile.PackTable;
	Resync([]);
end;

function TDbf.LocateRecord (const KeyFields : String; const KeyValues : Variant;
                              Options : TLocateOptions; bSyncCursor : Boolean) : Boolean;
var
  lstKeys               : TList;
  iIndex                : Integer;
  ReturnBookMark        : TBookMarkStr;
  Field                 : TField;
  bMatchedData          : Boolean;
  bVarIsArray           : Boolean;
  varCompare            : Variant;

  function CompareValues : Boolean;
  var
    sCompare            : String;
  begin
    If (Field.DataType = ftString) Then
    Begin
      sCompare          := VarToStr (varCompare);
      If loCaseInsensitive in Options Then
      Begin
        Result      := CompareText (Field.AsString,sCompare) = 0;
        If Not Result and (iIndex = lstKeys.Count - 1) And (loPartialKey in Options) And
          (Length (sCompare) < Length (Field.AsString)) Then
        Begin
          If Length (sCompare) = 0 Then
            Result  := True
          Else
            Result  := CompareText (Copy (Field.AsString,1,Length (sCompare)),sCompare) = 0;
        End;
      End
      Else
      Begin
        Result        := Field.AsString = sCompare;
        If Not Result and (iIndex = lstKeys.Count - 1) And (loPartialKey in Options) And
          (Length (sCompare) < Length (Field.AsString)) Then
        Begin
          If Length (sCompare) = 0 Then
            Result    := True
          Else
            Result    := Copy (Field.AsString,1,Length (sCompare)) = sCompare;
        End;
      End;
    End
    Else
      Result        := Field.Value = varCompare;
  end;

begin
  Result                := False;
  bVarIsArray           := False;
  CheckBrowseMode;
  CursorPosChanged;
  lstKeys               := TList.Create;
  Try
    GetFieldList (lstKeys,KeyFields);
    If VarArrayDimCount (KeyValues) = 0 Then
      bMatchedData      := lstKeys.Count = 1
    Else If VarArrayDimCount (KeyValues) = 1 Then
    Begin
      bMatchedData      := VarArrayHighBound (KeyValues,1) + 1 = lstKeys.Count;
      bVarIsArray       := True;
    End
    Else
      bMatchedData      := False;
    If bMatchedData Then
    Begin
      ReturnBookMark    := BookMark;
      DisableControls;
      Try
        (*
          When we have indexes, add code here to chose the best index
        *)

        First;
        While Not Eof and Not Result Do
        Begin
          Result            := True;
          iIndex            := 0;
          While Result And (iIndex < lstKeys.Count) Do
          Begin
            Field           := TField (lstKeys [iIndex]);
            If bVarIsArray Then
              varCompare    := KeyValues [iIndex]
            Else
              varCompare    := KeyValues;
            Result          := CompareValues;
            iIndex          := iIndex + 1;
          End;
          If Not Result Then
            Next;
        End;
        If Not Result Then
          BookMark          := ReturnBookMark;
      Finally
        EnableControls;
      End;
    End;
  Finally
    lstKeys.Free;
  End;
end;

function TDbf.Locate (const KeyFields : string; const KeyValues : Variant; Options : TLocateOptions) : Boolean;
begin
  DoBeforeScroll;
  Result := LocateRecord (KeyFields,KeyValues,Options,True);
  If Result Then
    DoAfterScroll;
end;

function TDbf.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; {override virtual}
var
  Memoi:array[1..32] of char;
  lBlob:TMyBlobFile;
begin
  lBlob:=TMyBlobFile.Create(Mode,Field);
  if _Engine._dbfFile.GetFieldData(Field.FieldNo-1, ftString,@pDbfRecord(ActiveBuffer).deletedflag,@Memoi[1]) then begin
    lBlob.MemoRecno:=StrToIntDef(Memoi,0);
    _Engine._dbtFile.ReadMemo(lBlob.MemoRecno,lBlob);
    lBlob.ReadSize:=lBlob.Size;
  end else lBlob.MemoRecno:=0;
  Result:=lBlob;
end;

{$ifdef DELPHI_3}
procedure TDbf.Translate(Src, Dest: PChar; ToOem: Boolean); {override virtual}
{$else}
function TDbf.Translate(Src, Dest: PChar; ToOem: Boolean): Integer; {override virtual}
{$endif}
begin
  if (Src <> nil) and (Dest<>nil) then begin
    if Assigned(_OnTranslate) then begin
      _OnTranslate(Self,Src,Dest,ToOem);
    end else begin
      if ToOem then CharToOem(Src,Dest)
      else OemToChar(Src,Dest);
    end;
{$ifdef DELPHI_3}
  end;
{$else}
    result:= StrLen(Dest);
  end else result:=0;
{$endif}
end;

procedure TDbf.ClearCalcFields(Buffer: PChar);
var
  realbuff,calcbuff:pchar;
begin
  realbuff:=@pDbfRecord(Buffer).DeletedFlag;
  calcbuff:=@realbuff[_Engine._dbfFile.RecordSize];
  FillChar(calcbuff^, CalcFieldsSize, 33);
end;

procedure TDbf.InternalSetToRecord(Buffer: PChar); {override virtual abstract from TDataset}
var
	prec:pDbfRecord;
begin
	if Buffer=nil then exit;
	prec:=pDbfRecord(Buffer);
  if prec.BookMarkFlag=bfInserted then begin
    // do what ???
  end else begin
  	_Engine._Cursor.GotoBookmark(prec.BookmarkData);
  end;
end;

function TDbf.IsCursorOpen: Boolean; {override virtual abstract from TDataset}
begin
  result:=_Engine._IsCursorOpen;
end;

procedure TDbf.SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
begin
  prec:=pDbfRecord(Buffer);
  prec.BookMarkFlag:=Value;
end;

procedure TDbf.SetBookmarkData(Buffer: PChar; Data: Pointer); {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
begin
  prec:=pDbfRecord(Buffer);
  prec.BookMarkData:=pBookMarkData(Data)^;
end;

procedure TDbf.SetFieldData(Field: TField; Buffer: Pointer); {override virtual abstract from TDataset}
var
  prec:pDbfRecord;
	dst:pointer;
begin
	if (Field.FieldNo >= 0) then begin
		prec:=pDbfRecord(ActiveBuffer);
		dst:=@prec.DeletedFlag;
		_Engine._dbfFile.SetFieldData(Field.FieldNo - 1,Field.DataType,Buffer,Dst);
	end else begin    { ***** fkCalculated, fkLookup ***** }
		prec:=pDbfRecord(CalcBuffer);
		dst:=@prec.DeletedFlag;
		Inc(integer(dst), GetRecordSize + Field.Offset);
		Boolean(dst^) := LongBool(Buffer);
		if Boolean(dst^) then begin
      Inc(integer(dst), 1);
  		Move(Buffer^, dst^, Field.DataSize);
		end;
	end;     { end of ***** fkCalculated, fkLookup ***** }
	if not (State in [dsCalcFields, dsFilter, dsNewValue]) then begin
		DataEvent(deFieldChange, Longint(Field));
	end;
end;


// this function is just for the grid scrollbars
// it doesn't have to be perfectly accurate, but fast.
function TDbf.GetRecordCount: Integer; {override virtual}
begin
  result:=_Engine._Cursor.GetRecordCount;
end;

// this function is just for the grid scrollbars
// it doesn't have to be perfectly accurate, but fast.
function TDbf.GetRecNo: Integer; {override virtual}
begin
	UpdateCursorPos;
  result:=_Engine._Cursor.GetRecno
end;

procedure TDbf.SetRecNo(Value: Integer); {override virual}
begin
  _Engine._Cursor.SetRecno(Value);
	Resync([]);
end;

function tDbf.GetCanModify: Boolean; {override;}
begin
  if _ReadOnly then Result:=false
  else Result := inherited GetCanModify;
end;

procedure tDbf.SetFiltered(Value: Boolean); {override;}
begin
  inherited;
  Resync([]);
end;

function Tdbf.CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;
const
   RetCodes: array[Boolean, Boolean] of ShortInt = ((2,-1),(1,0));
var
   b1,b2:integer;
begin
  // Check for uninitialized bookmarks
  Result := RetCodes[Bookmark1 = nil, Bookmark2 = nil];
  if (Result = 2) then
  begin
    b1:=PInteger(Bookmark1)^;
    b2:=PInteger(Bookmark2)^;
    if b1<b2 then Result:=-1
    else if b1>b2 then Result:=1
    else Result:=0;
  end;
end;

procedure TDBf._FlushBuffers;
begin
  CheckBrowseMode;
  if _ReadOnly then Exit;
  _Engine._dbfFile.WriteHeader;
end;

function TDbf._GetVersion: string;
begin
  Result:='tDbf v' + Format('%2.3f',[_MAJOR_VERSION + _MINOR_VERSION / 1000.0]);
end;

procedure TDbf._SetVersion(s: string);
begin
  // What an idea...
end;

procedure TDbf.OpenIndexFile(IndexFile:string);
var
  lIndexFileName:string;
begin
	CheckActive;
  lIndexFileName:=_ExpandFileName(_AbsolutePath,IndexFile);
  _Engine.OpenIndex(lIndexFileName,'',pfOpen,true,_ReadOnly);
end;

{$ifdef DELPHI_3}
procedure TDbf.AddIndex(const IndexFile, Fields: String; Options: TIndexOptions);
{$else}
procedure TDbf.AddIndex(const IndexFile, Fields: String; Options: TIndexOptions; const DescFields: String='');
{$endif}
var
  lIndexFileName:string;
begin
	CheckActive;
  lIndexFileName:=_ExpandFileName(_AbsolutePath,IndexFile);
  _Engine.OpenIndex(lIndexFileName,Fields,pfCreate,true,_ReadOnly);
end;

procedure TDbf._SetIndexname(IndexFile: string);
var
  lIndexFileName:string;
begin
  _IndexName:=IndexFile;
  lIndexFileName:=_ExpandFileName(_AbsolutePath,IndexFile);
  _Engine.SetIndex(lIndexFileName);
end;

procedure TDBf.DeleteIndex(const IndexFile: string);
var
  lIndexFileName:string;
begin
  CloseIndexFile(IndexFile);
  lIndexFileName:=_ExpandFileName(_AbsolutePath,IndexFile);
  if fileexists(lIndexFileName) then DeleteFile(lIndexFileName)
  else raise eDbfError.Create('Index does not exist');
end;

procedure TDbf.CloseIndexFile(const IndexFile: string);
var
  lIndex:TDbfIndexDef;
  lIndexFileName:string;
begin
  lIndexFileName:=ExtractRelativePath(_AbsolutePath,ExtractFilePath(IndexFile))
    + ExtractFileName(IndexFile);
  _Engine.CloseIndex(IndexFile);
end;

function TDbf._GetPhysicalRecno:integer;
begin
  Result:=_Engine._GetPhysicalRecno;
end;

function TDbf._GetShowDeleted: boolean;
begin
  Result:=_Engine._ShowDeleted;
end;

procedure TDbf._SetShowDeleted(Value: boolean);
begin
  _Engine._ShowDeleted:=Value;
end;

//==========================================================
//============ TDbfIndexCollection
//==========================================================
constructor TDbfIndexCollection.Create(Owner:TDataset);
begin
 inherited Create(TDbfIndexDef);
 _Owner := Owner;
end;

function TDbfIndexCollection.Add : TDbfIndexDef;
begin
 Result := TDbfIndexDef(inherited Add);
end;

Procedure TDbfIndexCollection.Setitem(n:integer;Value:TDbfIndexDef);
begin
 inherited Setitem(n,Value);
end;

function TDbfIndexCollection.GetItem(n:integer) : TDbfIndexDef;
begin
  Result := TDbfIndexDef(inherited GetItem(n));
end;

function TDbfIndexCollection.getowner : tpersistent;
begin
 Result := _Owner;
end;

function TDbfIndexCollection.GetIndexByFilename(FileName:string):TDbfIndexDef;
var
   i:integer;
   lIndex:TDbfIndexDef;
begin
  filename := Uppercase(filename);
  for i:=0 to count-1 do begin
    lIndex:=TDbfIndexDef(inherited GetItem(i));
    if lIndex._IndexDefFileName=filename then begin
       result:=lIndex;
       exit;
    end
  end;
  result:=nil;
end;

//==========================================================
//============ TDbfIndexDef
//==========================================================
constructor TDbfIndexDef.Create(Collection: TCollection); {override;}
begin
  inherited Create(Collection);
end;

destructor TDbfIndexDef.Destroy; {override;}
begin
	inherited Destroy;
end;

procedure TDbfIndexDef._SetIndexDefFileName(value:string);
begin
  _IndexDefFileName:=UpperCase(value);
end;

initialization
		tDbf_TrimFields := true;
    if _DbfExePath='' then _DbfExePath:=extractfilepath(Application.Exename);

finalization

end.



