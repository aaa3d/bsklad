unit UDbfIndex;

interface

uses
  UDbfPagedFile,sysutils,classes,UDbfFile, db,
  UDbfCursor;

type
//====================================================================
//=== Index support
//====================================================================

  TIndexFile = class;
  TIndexPage = class;


  TIndexCursor = class(TVirtualCursor)
  public
    constructor Create(dbfIndexFile:TIndexFile);
    function Next:boolean; override;
    function Prev:boolean; override;
    procedure First; override;
    procedure Last; override;
    function PhysicalRecno:integer; override;
    function GetRecordCount:integer; override;
    function GetRecNo:integer; override;
    procedure SetRecNo(Recno:integer); override;
    procedure GotoBookmark(Bookmark:rBookmarkData); override;
    function GetBookMark:integer; override;
		procedure Insert(Recno:integer; Buffer:PChar); override;
		procedure Update(Recno: integer; PrevBuffer,NewBuffer: PChar); override;
///////////
	protected
		_TagPosition:Integer;

		function GetCurrentPos:TIndexPage;
	public
		IndexRecNo:integer;
		function Find(Recno:integer; Buffer:PChar; var pPos:TIndexPage):integer;

		function Delete:boolean;
//		procedure GotoKey(Recno:integer; Buffer:PChar);
//    procedure ResyncInd;
//		function GetRealRecNo: Integer;
//		procedure InitFieldDef(dbfFile:TDbfFile;FieldDesc:string);
		destructor Destroy; override;
// optionnal
		function GuessRecordCount: Integer;
		function GuessRecNo: Integer;
  end;

  PDouble = ^double;

  PMdxTag = ^rMdxTag;
  rMdxTagHdr = record
    RootPage        : longint;// 0..3
    FilePages        : longint;// 4..7
    KeyFormat        : byte;   // 8
    KeyType          : char;   // 9
    dummy            : word;   // 10..11
    IndexKeyLength   : word;   // 12..13
    MaxNbKeys       : word;   // 14..15
    SecondKeyType   : word;   // 16..17
    IndexKeyItemLen  : word;   // 18..19
    dummy2           : array [20..22] of byte;
    UniqueFlag      : byte;   // 23
  end;

  PNdxHdr = ^rNdxHdr;
	rNdxHdr = record
		startpage : Integer; // 0..3
    nbPage : Integer; // 4..7
		keyformat: Char; //8
    keytype : char; //9
    dummy : Word; // 10..11
    keylen : Word; // 12..13
    nbkey : Word; // 14..15
    skeytype : Word; // 16..17
    keyreclen : Word; // 18..19
    dummy2 : Word; // 20..21
    dummy3 : Byte; // 22
    Unique : Byte; // 23
		KeyDesc : array[0..231] of char; // 24...255
    dummy4 : array[256..511] of byte;
  end;

  rMdxTag = record
    pageno      : Integer; // 0..3
    tagname      : array [0..11] of char; // 4..14
    keyformat    : byte; // 15
    forwardTag1  : char; // 16
    forwardTag2 : byte; // 17
    backwardTag : byte; // 18
		dummy       : byte; // 19
    keytype     : byte; // 20
  end;

  NdxKeyType = (N,C);
  PNdxPage  = ^rNdxPage;
  rNdxPage  = record
    NbEntries : longint;  //  0..3 lower page
    Entries   : ARRAY [0..507] OF char;
  end;

  PNdxentry  = ^rNdxentry;
  rNdxentry  = record
    _LowerPage : longint;  //  0..3 lower page
    RecNo     : Longint;  //  4..7 recno
    case NdxKeyType of
      N: ( NKey: double);
      C: ( CKey: array [0..503] of char);
  end;
//====================================================================
//  TIndexCursor = class;
//====================================================================
  PIndexPosInfo = ^TIndexPage;

  TIndexPage = class
  protected
    _IndexFile : TIndexFile;
    _PageNo : Integer;
    _EntryNo : Integer;
    _LowerLevel : TIndexPage;
    _UpperLevel : TIndexPage;
		_PageBuff:rNdxPage;
    _Weight : integer;
    _Modified: boolean;
    Entry : PNdxentry;

    procedure LocalFirst;
    procedure LocalLast;
    procedure _setModified(v:boolean);
    property Modified:boolean read _Modified write _SetModified;

    function  LocalPrev:boolean;
    function  LocalNext:boolean;
    function  LastEntryNo:integer;
    function  LocalInsert(Recno:Integer; Buffer:PChar; LowerPage:integer):boolean;
    function  LocalDelete:boolean;

    function  GetPEntry(vEntryNo:integer):PNdxEntry;

    procedure First;
    procedure Last;
    function Prev:boolean;
    function Next:boolean;

  public
		_dbfFile:TPagedFile;

    constructor Create(Parent:TIndexFile);
    destructor Destroy; override;

    function LowerLevel:TIndexPage;
    procedure SetPageNo(page:Integer);
    property UpperLevel:TIndexPage read _UpperLevel;
    procedure _SetEntryNo(value:Integer);
    function FindNearest(Recno:integer; Key:PChar):integer;
    function Insert(Recno:integer; Buffer:pchar; LowerPage:integer):boolean;
    procedure SetEntry(Recno:integer; key:pchar; LowerPage:integer);
    function Delete:boolean;
    property EntryNo:integer read _EntryNo write _SetEntryNo;
    function HasLowerLevel:boolean;
  end;
//====================================================================
(*
	rMdxHdr = record
    MdxHdr   : byte;       // 0
    Year        : byte;       // 1
    Month       : byte;       // 2
    Day         : byte;      // 3
    FileName    : array[0..15] of char; // 4..19 of byte
    BlockSize    : word; // 20 21
    BlockAdder  : word; // 22 23
    IndexFlag   : byte; // 24
    NoTag       : byte; // 25
    TagSize     : byte; // 26
    Dummy1      : byte; // 27
    TagUsed     : word; // 28..29
    Dummy2      : word; // 30..31
    NbPage      : Integer; // 32..35
    FreePage    : Integer; // 36..39
    BlockFree   : Integer; // 40..43
    UpdYear     : byte; // 44
    UpdMonth    : byte; // 45
    UpdDay      : byte; // 46
	end;
*)
//====================================================================
  TIndexFile = class(TPagedFile)
  protected
    _IndexVersion : xBaseVersion;
//    _MdxHdr : rMdxHdr;
		_NbLevel : integer;
		_Root:TIndexPage;
  public
		_FieldPos : integer;
		_FieldLen : integer;
    procedure Clear;
    procedure Init;
    procedure SetFieldInfo(fieldStart,fieldLen:integer; FieldDesc:string);
    procedure AddNewLevel;
    constructor Create(lFileName:string; Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
    destructor Destroy; override;
  end;
//====================================================================
implementation


procedure MyMove(Source, Dest:PChar; Count: Integer);
var
  c:char;
  i:integer;
begin
  i:=0;
  while i<Count do begin
    c:=PChar(Source)[i];
    if c=#0 then break;
    PChar(Dest)[i]:=c;
    Inc(i);
  end;
  while i<Count do begin
    PChar(Dest)[i]:=' ';
    Inc(i);
  end;
end;

//==========================================================
//============ TIndexFile
//==========================================================
constructor TIndexFile.Create(lFileName:string; Mode:TPagedFileMode;AutoCreate,ReadOnly:Boolean);
var
  ext:string;
begin
  inherited Create(lFileName,Mode,AutoCreate,ReadOnly);

  HeaderSize:=512;
  RecordSize:=512;

  ext:=ExtractFileExt(lFileName);
  if (ext='.mdx') then begin
    _IndexVersion:=xBaseIV;
  end else begin
    _IndexVersion:=xBaseIII;
  end;
  _Root:=TIndexPage.Create(self);
  if Mode=pfCreate then Clear
  else _Root.SetPageNo(PNdxHdr(Header).startpage);
  Init;
end;

procedure TIndexFile.Clear;
begin
  PNdxHdr(Header).startpage:=1;
  PNdxHdr(Header).nbPage:=1;
  WriteHeader;
  RecordCount:=1;
  _Root._PageNo:=1;
  fillchar(_Root._PageBuff,sizeof(_Root._PageBuff),0);
  Init;
end;

procedure TIndexFile.Init;
var
  lPos:TIndexPage;
  lChild:TIndexPage;
begin
  lPos:=_Root;
  _nblevel:=1;
  _Root._Weight:=1;

  if _Root.HasLowerLevel then begin
    _Root._LowerLevel.Free;
    _Root._LowerLevel:=nil;
  end;
  repeat
    lPos.EntryNo:=0;
    if lPos.Entry._LowerPage=0 then break;
    inc(_nblevel);
    lChild:=TIndexPage.Create(self);
    lChild._UpperLevel:=lPos;
    lPos._LowerLevel:=lChild;
    lChild.SetPageNo(lPos.Entry._LowerPage);
    lPos:=lChild;
  until false;
  lPos._Weight:=1;
  repeat
    if lPos.UpperLevel=nil then break;
    lPos.UpperLevel._Weight:=lPos._Weight * (PNdxHdr(Header).nbkey+1);
    lPos:=lPos.UpperLevel;
  until false;
end;

procedure TIndexFile.SetFieldInfo(fieldStart,fieldLen:integer; FieldDesc:string);
begin
  PNdxHdr(Header).keytype:='C';
  PNdxHdr(Header).keylen:=fieldLen;
  PNdxHdr(Header).keyreclen:=fieldLen+8;

  PNdxHdr(Header).startpage:=1;
  PNdxHdr(Header).nbPage:=1;
  PNdxHdr(Header).keyformat:=#0;

  PNdxHdr(Header).dummy:=$5800;
  PNdxHdr(Header).Unique:=0;
  PNdxHdr(Header).KeyDesc[0]:=' ';
  PNdxHdr(Header).nbkey:=(512-8) div (fieldLen+8);
  StrLCopy(PNdxHdr(Header).KeyDesc,PChar(UpperCase(fieldDesc)),255);
  WriteHeader;
  RecordCount:=0;
  _FieldPos := fieldstart;
  _FieldLen := fieldlen;
  _Root.SetPageNo(PNdxHdr(Header).startpage);
end;

destructor TIndexFile.Destroy;
begin
	inherited Destroy;
end;


//==========================================================
//============ TIndexPage
//==========================================================
constructor TIndexPage.Create(Parent:TIndexFile);
begin
  _LowerLevel:=nil;
  _UpperLevel:=nil;
  _IndexFile:=Parent;
  _PageNo:=-1;
  _EntryNo:=-1;
  modified:=false;
end;

destructor TIndexPage.Destroy;
begin
  if HasLowerLevel then LowerLevel.Free;
  if Modified then SetPageNo(1);
	inherited Destroy;
end;

function  TIndexPage.GetPEntry(vEntryNo:integer):PNdxEntry;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  Result:=PNdxentry(@_PageBuff.Entries[PNdxHdr(_IndexFile.Header).keyreclen*vEntryno]);
end;

function  TIndexPage.LocalInsert(Recno:integer; Buffer:Pchar;LowerPage:integer):boolean;
var
  src,dst:pointer;
  siz:integer;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  assert(_PageBuff.NbEntries>=0);
  if _PageBuff.NbEntries < PNdxHdr(_IndexFile.Header).nbkey then begin
    src:=Entry;
    dst:=GetPEntry(EntryNo+1);
    siz:=(_PageBuff.NbEntries - EntryNo)
      * PNdxHdr(_IndexFile.Header).keyreclen + 8;
    Move(Src^, Dst^, Siz);
    inc(_PageBuff.NbEntries);
    SetEntry(Recno,Buffer,LowerPage);
    Result:=true;
  end else begin
    Result:=false;
  end;
end;


function  TIndexPage.LocalDelete:boolean;
var
  src,dst:pointer;
  siz:integer;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if _PageBuff.NbEntries >=0 then begin
    if EntryNo<_PageBuff.NbEntries then begin
      src:=GetPEntry(EntryNo+1);
      dst:=Entry;
      siz:=(_PageBuff.NbEntries - EntryNo - 1)
        * PNdxHdr(_IndexFile.Header).keyreclen + 8;
      Move(Src^, Dst^, Siz);
    end;
    dec(_PageBuff.NbEntries);
    if (EntryNo>LastEntryNo) then begin
      EntryNo:=LastEntryNo; // We just removed the last on this page.
      if UpperLevel<>nil then begin
        UpperLevel.SetEntry(0,Entry.CKey,_PageNo);
      end;
    end;
    if ((_PageBuff.NbEntries=0) and (not HasLowerlevel))
      or (_PageBuff.NbEntries<0) then begin
      if UpperLevel<>nil then begin
        UpperLevel.LocalDelete;
      end;
    end;
    modified:=true;
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TIndexPage.LocalFirst;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  EntryNo:=0;
end;

procedure TIndexPage.LocalLast;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  EntryNo:=LastEntryNo;
end;

procedure TIndexPage._setModified(v:boolean);
begin
  if v then begin
    _IndexFile.WriteRecord(_PageNo,@_PageBuff);
    v:=false;
  end;
  _modified:=v;
end;

function TIndexPage.LocalPrev:boolean;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if EntryNo>0 then begin
    EntryNo:=EntryNo-1;
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

function TIndexPage.LocalNext:boolean;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if (EntryNo<LastEntryNo) then begin
    EntryNo:=EntryNo+1;
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

function TIndexPage.LastEntryNo:integer;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if not HasLowerLevel then result:=_PageBuff.NbEntries - 1
  else result:=_PageBuff.NbEntries;
  if result<0 then result:=0;
end;

function TIndexPage.Prev:boolean;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if (HasLowerLevel) then begin
    if LowerLevel.Prev then begin
      result:=true;
      exit;
    end;
  end;
  Result:=LocalPrev;
  if Result and (Entry._LowerPage>0) then begin
    LowerLevel.Last;
  end;
end;

function TIndexPage.Next:boolean;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if (HasLowerLevel) then begin
    if LowerLevel.next then begin
      result:=true;
      exit;
    end;
  end;
  Result:=LocalNext;
  if Result and (Entry._LowerPage>0) then begin
    LowerLevel.First;
  end;
end;

procedure TIndexPage.First;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  LocalFirst;
  if HasLowerLevel then begin
    LowerLevel.First;
  end;
end;

procedure TIndexPage.Last;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if HasLowerLevel then begin
    assert(HasLowerLevel);
  end;
  LocalLast;
  if HasLowerLevel then begin
    LowerLevel.Last;
  end;
end;

function TIndexPage.FindNearest(Recno:integer; Key:pchar):integer;
var
  cmpres:integer;
  v1,v2:double;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  Result:=-1;
  if @Key=nil then begin
    Exit;
  end;
  EntryNo:=0;
  while EntryNo<_PageBuff.NbEntries do begin
    if PNdxHdr(_IndexFile.Header).keytype='C' then begin
//      if Assigned(TDbf(Self. OnCompareRecord) then begin
//      end else begin
        cmpres:=StrLIComp(PChar(Key),Entry.CKey,_IndexFile._FieldLen);
//      end;
    end else begin
      // Numeric field... to do
      v1:=PDouble(Key)^;
      v2:=Entry.NKey;
      if v1>v2 then cmpres:=1
      else if v1<v2 then cmpres:=-1
      else cmpres:=0;
    end;
    if cmpres=0 then begin
      if not HasLowerLevel then begin
        if (Entry.RecNo=Recno) then begin
          result:=0;
          Exit;
        end else if (Entry.Recno>Recno) then begin
          result:=-1;
          Exit;
        end;
      end else begin
{        p:=self;
        while p._HasLowerLevel do begin
          p:=p.LowerLevel;
          p.LocalLast;
        end;
        if (p.Entry.Recno>=Recno) then begin
          result:=-1;
          Exit;
        end;}
      end;
    end else if cmpres<0 then begin
      result:=-1;
      exit;
    end;
    EntryNo:=EntryNo+1;
  end;
  result:=1;
  Exit;
end;

procedure TIndexPage.SetEntry(Recno:Integer; key:PChar; LowerPage:integer);
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  assert((EntryNo>=0) and (EntryNo<=_PageBuff.NbEntries));
  if (EntryNo=self._PageBuff.NbEntries) then begin
    if (UpperLevel<>nil)  then begin
      UpperLevel.SetEntry(0,key,Self._PageNo);
    end;
  end else begin
    if PNdxHdr(_IndexFile.Header).keytype='C' then begin
      mymove(key,Entry.CKey,PNdxHdr(_IndexFile.Header).keylen);
    end else begin
      Entry.NKey:=PDouble(key)^;
    end;
  end;
  Entry.RecNo:=RecNo;
  Entry._LowerPage:=LowerPage;
  Modified:=true;
end;

function TIndexPage.HasLowerLevel:boolean;
begin
  result:=(_LowerLevel<>nil);
end;

function TIndexPage.LowerLevel:TIndexPage;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  assert(HasLowerLevel);
  assert(EntryNo>=0);
  assert(Entry<>nil);
  assert(Entry._LowerPage<>0);
  if (_LowerLevel._PageNo<>Entry._LowerPage) then begin
    _LowerLevel.SetPageNo(Entry._LowerPage);
  end;
  result:=_LowerLevel;
end;


function TIndexPage.Insert(Recno:Integer; Buffer:PChar; LowerPage:integer):boolean;
var
  src,dst:PNdxEntry;
  sizb:integer;
  split,old_entry:integer;
  siz1,siz2:integer;
  lSpare:TIndexPage;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));

  if LocalInsert(recno,buffer,lowerpage) then begin
    Write;
  end else begin
    // The entry is FULL so we will split this page
    // 1 - Check parent exist
    if UpperLevel=nil then begin
      _IndexFile.AddNewLevel;
      Upperlevel.EntryNo:=0;
      Upperlevel.SetEntry(0,nil,_PageNo);
    end;

    old_entry:=EntryNo;
    split:=EntryNo;
    if split < 2 then begin
      split:=2;
    end;
    if split > _PageBuff.NbEntries-2 then begin
      split:=_PageBuff.NbEntries-2;
    end;
    siz1:=split;
    siz2:=_PageBuff.NbEntries-split;

    lSpare:=TIndexPage.Create(_IndexFile);
    try
      // 2 - Create new page with first part
      inc(PNdxHdr(_IndexFile.Header).nbPage);
      lSpare._PageNo:=PNdxHdr(_IndexFile.Header).nbPage;
      _IndexFile.WriteHeader;
      sizb:=siz1*PNdxHdr(_IndexFile.Header).keyreclen;
      if Haslowerlevel then begin
        // size = split - 1 complete records
        //        + just 8 byte for last record
        dec(siz1);
      end;
      src:=@_PageBuff.Entries;
      dst:=@lSpare._PageBuff.Entries;
      Move(src^,dst^,sizb);
      lSpare._PageBuff.NbEntries:=siz1;

      // 3 - Keep only end-part in this page
      sizb:=siz2*PNdxHdr(_IndexFile.Header).keyreclen+8;
      if HasLowerLevel then begin
        // size = split - 1 complete records
        //        + just 8 byte for last record
        //dec(siz2);
      end;

      EntryNo:=split;
      src:=Entry;
      EntryNo:=0;
      dst:=Entry;
      Move(src^,dst^,sizb);
      _PageBuff.NbEntries:=siz2;

      Modified:=true;
      lSpare.Modified:=true;
      // Now insert the new node into its parent.
      if HasLowerLevel then lSpare.EntryNo:=lSpare._PageBuff.NbEntries
      else lSpare.EntryNo:=lSpare._PageBuff.NbEntries-1;
      UpperLevel.Insert(0,lSpare.Entry.CKey,lSpare._PageNo);
      // We need to insert the record now
      if old_entry>=split then begin
        UpperLevel.EntryNo:=UpperLevel.EntryNo+1;
        assert(Upperlevel.Entry._LowerPage=_PageNo);
        EntryNo:=old_entry - split;
        assert(entryno<>-1);
        LocalInsert(Recno,Buffer,LowerPage);
      end else begin
        UpperLevel.LowerLevel; //<-does the trick
        EntryNo:=old_entry;
        LocalInsert(Recno,Buffer,LowerPage);
      end;
    finally
      lspare.free;
    end;
  end;
  // And finally let's check we are on the inserted item.
  assert(Entry.Recno=Recno);
  assert(Entry._LowerPage=Lowerpage);
  Result:=true;
end;

function TIndexPage.Delete:boolean;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  Result:=LocalDelete;
end;

procedure TIndexPage.SetPageNo(page:Integer);
begin
  if (_PageNo<>page) then begin
    if (modified) then begin
      assert(_PageNo>0);
      _IndexFile.WriteRecord(_PageNo,@_PageBuff);
      Modified:=false;
    end;
    _PageNo:=page;
    EntryNo:=-1;
    if (page>0) then begin
      _IndexFile.ReadRecord(Page,@_PageBuff);
    end;
    modified:=false;
  end;
end;

procedure TIndexFile.AddNewLevel;
var
  lNewPage:TIndexPage;
begin
  lNewPage:=TIndexPage.Create(self);
  inc(PNdxHdr(Header).nbPage);
  lNewPage._PageNo:= PNdxHdr(Header).nbPage;
  PNdxHdr(Header).startpage:= PNdxHdr(Header).nbPage;
  WriteHeader;

  lNewPage._PageBuff.NbEntries:=0;
  lNewPage._UpperLevel:=nil;
  lNewPage._LowerLevel:=_Root;
  lNewPage._Weight :=_Root._Weight * (PNdxHdr(Header).nbkey+1);

  lNewPage.EntryNo:=-1;
  _Root._UpperLevel:=lNewPage;
  _Root:=lNewPage;
end;

procedure TIndexPage._SetEntryNo(value:Integer);
var
  off:integer;
begin
  assert((UpperLevel=nil) or ((UpperLevel.Entry<>nil) and (UpperLevel.Entry._LowerPage=_PageNo)));
  if ((value>=0) and (value<=_PageBuff.NbEntries)) then begin
    off:=PNdxHdr(_IndexFile.Header).keyreclen*value;
    if (off>=0) and (off<=_IndexFile.RecordSize) then begin
      _EntryNo:=value;
      Entry:=PNdxentry(@_PageBuff.Entries[off]);
    end else begin
      _EntryNo:=-1;
      Entry:=nil;
    end;
  end else begin
    _EntryNo:=-1;
    Entry:=nil;
  end;
end;

//==========================================================
//============ TIndexCursor
//==========================================================
constructor TIndexCursor.Create(dbfIndexFile:TIndexFile);
var
	lPos:TIndexPage;
	lChild:TIndexPage;
begin
  inherited Create(dbfIndexFile);
end;

destructor TIndexCursor.Destroy; {override;}
begin
	inherited Destroy;
end;


function TIndexCursor.Find(Recno:integer; Buffer:PChar; var pPos:TIndexPage):integer;
var
  res:integer;
begin
  pPos:=TIndexFile(PagedFile)._Root;
  repeat
    res:=pPos.FindNearest(Recno,Buffer);
    if res<>0 then begin
      if pPos.Entry._LowerPage<>0 then begin
        pPos:=pPos.LowerLevel;
        res:=2;
      end;
    end;
  until res<>2;
  Result:=res;
end;

procedure TIndexCursor.Update(Recno: integer; PrevBuffer,NewBuffer: PChar);
var
  lPos:TIndexPage;
begin
  if TIndexFile(PagedFile)._FieldLen=0 then exit;

  inc(PrevBuffer,TIndexFile(PagedFile)._FieldPos);
  inc(NewBuffer,TIndexFile(PagedFile)._FieldPos);

  if StrLComp(PrevBuffer,NewBuffer,TIndexFile(PagedFile)._FieldLen)<>0 then begin
    Delete;
    Find(Recno,NewBuffer,lPos);
    lPos.Insert(Recno,NewBuffer,0);
  end;
end;

procedure TIndexCursor.Insert(Recno:integer; Buffer:PChar);
var
  lPos:TIndexPage;
begin
  if TIndexFile(PagedFile)._FieldLen=0 then exit;

  inc(Buffer,TIndexFile(PagedFile)._FieldPos);

  Find(Recno,Buffer,lPos);
  lPos.Insert(Recno,Buffer,0);
end;

function TIndexCursor.Delete:boolean;
var
  lPos:TIndexPage;
begin
  lpos:=TIndexFile(PagedFile)._root;
  while lpos.HasLowerLevel do begin
    lPos:=lPos.LowerLevel;
  end;
  lPos.Delete;
  Result:=true;
end;


function TIndexCursor.GetCurrentPos:TIndexPage;
var
  p:TIndexPage;
begin
  p:=TIndexFile(PagedFile)._Root;
  while p<>nil do begin
    if (p.Entry=nil) then begin
      result:=nil;
      exit;
    end else if (not p.HasLowerLevel) then begin
      result:=p;
      exit;
    end;
    p:=p.LowerLevel;
  end;
  result:=p;
end;

procedure TIndexCursor.First;
begin
  TIndexFile(PagedFile)._Root.First;
  GetCurrentPos.EntryNo:=GetCurrentPos.EntryNo-1; // out of index - BOF
end;

procedure TIndexCursor.Last;
begin
  TIndexFile(PagedFile)._Root.Last;
  GetCurrentPos.EntryNo:=GetCurrentPos.EntryNo+1; // out of index - EOF
end;

function TIndexCursor.Prev:boolean;
begin
  result:=TIndexFile(PagedFile)._Root.Prev;
end;

function TIndexCursor.Next:boolean;
begin
  result:=TIndexFile(PagedFile)._Root.Next;
end;

function TIndexCursor.GuessRecordCount: Integer;
var
  lPos:TIndexPage;
  nbrecord:integer;
begin
  // I just read first level and Guess an approximate record count...
  nbrecord:=TIndexFile(PagedFile)._Root._PageBuff.NbEntries;

  lPos:=TIndexFile(PagedFile)._Root.LowerLevel;

  while lpos<>nil do begin
    nbrecord:=nbrecord*(PNdxHdr(PagedFile.Header).nbkey+1);
    lPos:=lPos.LowerLevel;
  end;
  result:=nbrecord;
end;


function TIndexCursor.GuessRecNo:Integer;
var
  pos:integer;
  p:TIndexPage;
begin
  p:=TIndexFile(PagedFile)._Root;
  pos:=p.EntryNo;
  while p.Entry._LowerPage>0 do begin
    p:=p.LowerLevel;
    pos:=pos*(PNdxHdr(PagedFile.Header).nbkey+1) + p.EntryNo;
  end;
  result:=pos;
end;

(*
procedure TIndexCursor.GotoKey(recno:integer; buffer:pchar);
begin
  // very temporary implementation
  // could definitely be a bit faster.
  TIndexFile(_File)._Root.First;
  repeat
    if self.Pos.Entry.RecNo=(recno) then begin
      exit;
    end;
  until Next=false;
end;
*)

(*
*)

//====================================================================
//=== TIndexCursor
//====================================================================

function TIndexCursor.PhysicalRecno:integer;
var
  lpos : TIndexPage;
begin
  lpos:=GetCurrentPos;
  if (lpos.EntryNo>=0) and (lpos.EntryNo<lpos._PageBuff.NbEntries) then Result:=lpos.Entry.RecNo
  else Result:=-1;
end;

function TIndexCursor.GetRecordCount:integer;
var
  f:TIndexFile;
begin
  f:=TIndexFile(PagedFile);
  result:=(f._Root._PageBuff.NbEntries + 1)* f._Root._Weight;
end;

function TIndexCursor.GetRecNo:integer;
begin
	result:=GetBookMark;
end;

procedure TIndexCursor.SetRecNo(Recno:integer);
{
var
	pos:integer;
	p:TIndexPage;
	i:integer;
	ldiv:integer;
}
begin
{
	p:=TIndexFile(_File)._Root;
	ldiv:=1;
	while p.Entry._LowerPage>0 do begin
		ldiv:=ldiv*(PNdxHdr(_File.Header).nbkey+1);
		p:=p._LowerLevel;
	end;
	pos:=Recno div ldiv;
	p:=_Root;
	while p.Entry._LowerPage>0 do begin
		p._EntryNo:=pos;
		value:=value - pos * (_NdxHdr.nbkey+1);
		ldiv:=ldiv div (_NdxHdr.nbkey+1);
		pos:=value div ldiv;
		p:=p._LowerLevel;
	end;
}
//  GotoBookmark(Recno);
end;

procedure TIndexCursor.GotoBookmark(Bookmark:rBookmarkData);
var
  lpos : TIndexPage;
  n:longint;
  r:longint;
begin
  lpos:=TIndexFile(PagedFile)._Root;
  n:=BookMark.CursorBookMark div lPos._Weight;
  r:=BookMark.CursorBookMark mod lPos._Weight;
  lPos.EntryNo:=n;
  while lpos.HasLowerLevel do begin
    lpos:=lpos.LowerLevel;
    if lpos=nil then break;
    n:=r div lPos._Weight;
    r:=r mod lPos._Weight;
    lPos.EntryNo:=n;
  end;
  if lpos=nil then begin
    // cannot go there...
  end;
end;

function TIndexCursor.GetBookMark:integer;
var
  lpos : TIndexPage;
  r:integer;
begin
  lpos:=TIndexFile(PagedFile)._Root;
  r:=lPos.EntryNo * lPos._Weight;
  while lpos.HasLowerLevel do begin
    lpos:=lpos.LowerLevel;
    inc(r,lPos.EntryNo * lPos._Weight);
  end;
  result:=r;
end;

end.


