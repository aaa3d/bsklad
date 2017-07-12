unit UDbfCursor;
interface

uses
  classes,db,UDbfPagedFile;

type
//====================================================================
  PBookMarkData = ^rBookMarkData;
	rBookmarkData = record
    CursorBookMark:longint;
  end;
//====================================================================
  TVirtualCursor = class
  private
    _file:TPagedFile;
  protected
  public
    property PagedFile:TPagedFile read _file;
    constructor Create(pFile:TPagedFile);
    destructor destroy; override;

    function RecordSize : Integer;
    function Next:boolean; virtual; abstract;
    function Prev:boolean; virtual; abstract;
    procedure First; virtual; abstract;
    procedure Last; virtual; abstract;
    function PhysicalRecno:integer; virtual; abstract;
    function GetRecordCount:integer; virtual; abstract;
    function GetRecNo:integer; virtual; abstract;
    procedure SetRecNo(Recno:integer); virtual; abstract;
    function GetBookMark:integer; virtual; abstract;
    procedure GotoBookmark(Bookmark:rBookmarkData); virtual; abstract;
		procedure Insert(Recno:integer; Buffer:PChar); virtual; abstract;
		procedure Update(Recno: integer; PrevBuffer,NewBuffer: PChar); virtual; abstract;
  end;

implementation

function TVirtualCursor.RecordSize : Integer;
begin
  if _file = nil then result:=0 else result:=_file.recordsize;
end;

constructor TVirtualCursor.Create(pFile:TPagedFile);
begin
  _File:=pFile;
  pFile.AddRef;
end;

destructor TVirtualCursor.destroy; {override;}
begin
  _File.Release;
end;

end.


