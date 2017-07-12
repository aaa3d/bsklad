
{******************************************}
{                                          }
{             FastReport v3.0              }
{             PDF file library             }
{                                          }
{         Copyright (c) 1998-2005          }
{          by Alexander Fediachov,         }
{             Fast Reports Inc.            }
{                                          }
{******************************************}

unit frxPDFFile;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms,
  ComObj, ComCtrls, frxClass, JPEG
{$IFDEF Delphi6}, Variants {$ENDIF};

type
  TfrxPDFPage = class;
  TfrxPDFFont = class;

  TfrxPDFElement = class(TObject)
  private
    FXrefPosition: Cardinal;
    FIndex: Integer;
  public
    constructor Create;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure WriteLn(Stream: TStream; S: String);
    procedure Write(Stream: TStream; S: String);
  published
    property XrefPosition: Cardinal read FXrefPosition;
    property Index: Integer read FIndex write FIndex;
  end;

  TfrxPDFToolkit = class(TObject)
  public
    Locale: String;
    Prefix: String;
    LineHeight: Extended;
    constructor Create;
    function GetLocaleInformation(Flag: Integer): String;
    function UnicodePrefix: String;
    function GetHTextPos(Left: Extended; Width: Extended; const Text: String;
      Align: TfrxHAlign): Extended;
    function GetVTextPos(Top: Extended; Height: Extended; const Text: String;
      Align: TfrxVAlign; Line: Integer = 0; Count: Integer = 1): Extended;
    function GetLineWidth(const Text: String): Extended;
    function TruncReturns(Str: string): string;
    function PrepareString(const Text: String): String;
    function GetPDFColor(Color: TColor): String;
    function CheckOEM(const Value: string): boolean;
    function StrToOct(const Value: String): String;
    function StrToOctUTF16(const Value: String): String;
    function Dec2Oct(i: Longint): String;
    procedure SetMemo(Memo: TfrxCustomMemoView);
    function Str2RTL(const Str: String): String;
  end;

  TfrxPDFFile = class(TfrxPDFElement)
  private
    FPages: TList;
    FFonts: TList;
    FXRef: TStringList;
    FCounter: Integer;
    FTitle: String;
    FStartXRef: Cardinal;
    FStartFonts: Integer;
    FStartPages: Integer;
    FPagesRoot: Integer;
    FCompressed: Boolean;
    FPrintOpt: Boolean;
    FOutline: Boolean;
    FPreviewOutline: TfrxCustomOutline;
    FSubject: String;
    FAuthor: String;
    FBackground: Boolean;
    FCreator: String;
    FHTMLTags: Boolean;
  public
    FEmbedded: Boolean;
    FFontDCnt: Integer;
    PTool: TfrxPDFToolkit;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure XRefAdd(Stream: TStream);
    procedure SaveToStream(Stream: TStream); override;
    function AddPage(Page: TfrxReportPage): TfrxPDFPage;
    function AddFont(Font: TFont): Integer;
  published
    property Pages: TList read FPages;
    property Fonts: TList read FFonts;
    property Counter: Integer read FCounter write FCounter;
    property Title: String read FTitle write FTitle;
    property Compressed: Boolean read FCompressed write FCompressed;
    property EmbeddedFonts: Boolean read FEmbedded write FEmbedded default True;
    property PrintOptimized: Boolean read FPrintOpt write FPrintOpt;
    property Outline: Boolean read FOutline write FOutline;
    property PreviewOutline: TfrxCustomOutline read FPreviewOutline write FPreviewOutline;
    property Author: String read FAuthor write FAuthor;
    property Subject: String read FSubject write FSubject;
    property Background: Boolean read FBackground write FBackground;
    property Creator: String read FCreator write FCreator;
    property HTMLTags: Boolean read FHTMLTags write FHTMLTags;
  end;

  TfrxPDFPage = class(TfrxPDFElement)
  private
    FParent: TfrxPDFFile;
    FStreamObjects: TMemoryStream;
    FWidth: Extended;
    FHeight: Extended;
    FMarginLeft: Extended;
    FMarginTop: Extended;
    function GetLeft(Left: Extended): Extended;
    function GetTop(Top: Extended): Extended;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure SaveToStream(Stream: TStream); override;
    procedure AddObject(Obj: TfrxView);
  published
    property Parent: TfrxPDFFile read FParent write FParent;
    property Width: Extended read FWidth write FWidth;
    property Height: Extended read FHeight write FHeight;
    property MarginLeft: Extended read FMarginLeft write FMarginLeft;
    property MarginTop: Extended read FMarginTop write FMarginTop;
  end;

  TfrxPDFFont = class(TfrxPDFElement)
  private
    FFont: TFont;
    FParent: TfrxPDFFile;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SaveToStream(Stream: TStream); override;
  published
    property Parent: TfrxPDFFile read FParent write FParent;
    property Font: TFont read FFont;
  end;

  TfrxPDFOutlineNode = class(TObject)
  public
    Title: String;
    Dest: Integer;
    Top: Integer;
    Number: Integer;
    CountTree: Integer;
    Count: Integer;
    First: TfrxPDFOutlineNode;
    Last: TfrxPDFOutlineNode;
    Parent: TfrxPDFOutlineNode;
    Prev: TfrxPDFOutlineNode;
    Next: TfrxPDFOutlineNode;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses frxGraphicUtils, frxGzip;

const
  PDF_VER = '1.3';
  PDF_DIVIDER = 0.75;
  PDF_MARG_DIVIDER = 0.5;
  PDF_PRINTOPT = 4;

type
  PABC = ^ABCarray;
  ABCarray = array [0..255] of ABC;

function ReverseString(const AText: string): string;
var
  I: Integer;
  P: PChar;
begin
  SetLength(Result, Length(AText));
  P := PChar(Result);
  for I := Length(AText) downto 1 do
  begin
    P^ := AText[I];
    Inc(P);
  end;
end;

{ TfrxPDFFile }

constructor TfrxPDFFile.Create;
begin
  PTool := TfrxPDFToolkit.Create;
  FPages := TList.Create;
  FFonts := TList.Create;
  FXRef := TStringList.Create;
  FCounter := 4;
  FStartPages := 0;
  FStartXRef := 0;
  FStartFonts := 0;
  FCompressed := True;
  FPrintOpt := False;
  FOutline := False;
  FPreviewOutline := nil;
  FHTMLTags := False;
end;

destructor TfrxPDFFile.Destroy;
begin
  Clear;
  FXRef.Free;
  FPages.Free;
  FFonts.Free;
  PTool.Free;
  inherited;
end;

procedure TfrxPDFFile.Clear;
var
  i: Integer;
begin
  for i := 0 to FPages.Count - 1 do
  begin
    TfrxPDFPage(FPages[i]).Free;
  end;
  FPages.Clear;
  for i := 0 to FFonts.Count - 1 do
    TfrxPDFFont(FFonts[i]).Free;
  FFonts.Clear;
  FXRef.Clear;
end;

procedure TfrxPDFFile.SaveToStream(Stream: TStream);
var
  i: Integer;
  s, s1: String;
  Page, Top: Integer;
  Text: String;
  Parent: Integer;
  OutlineCount: Integer;
  NodeNumber: Integer;
  OutlineTree: TfrxPDFOutlineNode;

  function DoCalcOutlineCount: Integer;
  var
    i: Integer;
  begin
    Result := FPreviewOutline.Count;
    for i := 0 to FPreviewOutline.Count - 1 do
    begin
      FPreviewOutline.LevelDown(i);
      Result := Result + DoCalcOutlineCount;
      FPreviewOutline.LevelUp;
    end;
  end;

  procedure DoPrepareOutline(Node: TfrxPDFOutlineNode);
  var
    i: Integer;
    cnt: Integer;
    p: TfrxPDFOutlineNode;
    prev: TfrxPDFOutlineNode;
  begin
    cnt := FPreviewOutline.Count;
    Node.Count := cnt;
    Node.CountTree := cnt;
    Inc(NodeNumber);
    prev := nil;
    p := nil;
    for i := 0 to cnt - 1 do
    begin
      p := TfrxPDFOutlineNode.Create;
      FPreviewOutline.GetItem(i, Text, Page, Top);
      p.Title := Text;
      p.Dest := Page;
      p.Top := Top;
      p.Prev := prev;
      if prev <> nil then
        prev.Next := p
      else
        Node.First := p;
      prev := p;
      p.Parent := Node;
      FPreviewOutline.LevelDown(i);
      DoPrepareOutline(p);
      FPreviewOutline.LevelUp;
      Node.CountTree := Node.CountTree + p.CountTree;
    end;
    Node.Last := p;
  end;

  procedure DoWriteOutline(Node: TfrxPDFOutlineNode; Parent: Integer);
  var
    p: TfrxPDFOutlineNode;
  begin
    p := Node;
    if p.Dest = -1 then
    begin
      p.Number := Parent;
    end
    else begin
      p.Number := FCounter;
      XRefAdd(Stream);
      WriteLn(Stream, IntToStr(FCounter) + ' 0 obj');
      Inc(FCounter);
      WriteLn(Stream, '<<');
      WriteLn(Stream, '/Title (' + PTool.PrepareString(p.Title) + ')');
      WriteLn(Stream, '/Parent ' + IntToStr(Parent) + ' 0 R');
      if p.Prev <> nil then
        WriteLn(Stream, '/Prev ' + IntToStr(p.Prev.Number) + ' 0 R');
      if p.First <> nil then
      begin
        WriteLn(Stream, '/First ' + IntToStr(p.Number + 1) + ' 0 R');
        WriteLn(Stream, '/Last ' + IntToStr(p.Number + p.CountTree - p.Last.CountTree ) + ' 0 R');
        WriteLn(Stream, '/Count ' + IntToStr(p.Count));
      end;
      if p.Next <> nil then
        WriteLn(Stream, '/Next ' + IntToStr(p.Number + p.CountTree + 1) + ' 0 R');
      WriteLn(Stream, '/Dest [' + IntToStr(FpagesRoot + FFonts.Count * FFontDCnt + p.Dest * 2 + 1) + ' 0 R /XYZ 0 ' + IntToStr(Round(TfrxPDFPage(FPages[Page]).Height - p.Top * PDF_DIVIDER)) + ' 0]');
      WriteLn(Stream, '>>');
      WriteLn(Stream, 'endobj');
    end;
    if p.First <> nil then
      DoWriteOutline(p.First, p.Number);
    if p.Next <> nil then
      DoWriteOutline(p.Next, Parent);
  end;

begin
  inherited SaveToStream(Stream);
  OutlineCount := 0;
  OutlineTree := nil;
  if FOutline then
    if not Assigned(FPreviewOutline) then
      FOutline := False
    else
      FPreviewOutline.LevelRoot;
  FCounter := 1;
  s := FormatDateTime('yyyy', Now) + FormatDateTime('mm', Now) +
    FormatDateTime('dd', Now) + FormatDateTime('hh', Now) +
    FormatDateTime('nn', Now) + FormatDateTime('ss', Now);
  WriteLn(Stream, '%PDF-' + PDF_VER);
  WriteLn(Stream, '%'#226#227#207#211);
  XRefAdd(Stream);
  WriteLn(Stream, IntToStr(FCounter) + ' 0 obj');
  Inc(FCounter);
  WriteLn(Stream, '<<');
  WriteLn(Stream, '/Type /Catalog');
  i := 0;

  if FOutline then
  begin
    OutlineTree := TfrxPDFOutlineNode.Create;
    NodeNumber := 0;
    DoPrepareOutline(OutlineTree);
    OutlineCount := OutlineTree.CountTree - OutlineTree.Last.CountTree;
    i := OutlineTree.CountTree + 1;
  end;

  FPagesRoot := 3 + i;
  WriteLn(Stream, '/Pages ' + IntToStr(FPagesRoot) + ' 0 R');
  if FOutline then s1 := '/UseOutlines'
  else s1 := '/UseNone';
  WriteLn(Stream, '/PageMode ' + s1);
  if FOutline then
    WriteLn(Stream, '/Outlines ' + IntToStr(FCounter + 1) + ' 0 R');
  if Length(Title) > 0 then
    WriteLn(Stream, '/ViewerPreferences << /DisplayDocTitle true >>');
  WriteLn(Stream, '>>');
  WriteLn(Stream, 'endobj');
  XRefAdd(Stream);
  WriteLn(Stream, IntToStr(FCounter) + ' 0 obj');
  Inc(FCounter);
  WriteLn(Stream, '<<');
  WriteLn(Stream, '/Producer (' + PTool.PrepareString(FCreator) + ')');
  WriteLn(Stream, '/Author (' + PTool.PrepareString(FAuthor) + ')');
  WriteLn(Stream, '/Subject (' + PTool.PrepareString(FSubject) + ')');
  WriteLn(Stream, '/Creator (' + PTool.PrepareString(Application.Name) + ')');
  WriteLn(Stream, '/Title (' + PTool.PrepareString(FTitle) + ')');
  WriteLn(Stream, '/CreationDate (D:' + s + ')');
  WriteLn(Stream, '/ModDate (D:' + s + ')');
  WriteLn(Stream, '>>');
  WriteLn(Stream, 'endobj');
  if FOutline then
  begin
    XRefAdd(Stream);
    WriteLn(Stream, IntToStr(FCounter) + ' 0 obj');
    Parent := FCounter;
    Inc(FCounter);
    FPreviewOutline.LevelRoot;
    WriteLn(Stream, '<<');
    WriteLn(Stream, '/Count ' + IntToStr(FPreviewOutline.Count));
    WriteLn(Stream, '/First ' + IntToStr(FCounter) + ' 0 R');
    WriteLn(Stream, '/Last ' + IntToStr(FCounter + OutlineCount - 1) + ' 0 R');
    WriteLn(Stream, '>>');
    WriteLn(Stream, 'endobj');
    DoWriteOutline(OutlineTree, Parent);
    OutlineTree.Free;
  end;
  XRefAdd(Stream);
  WriteLn(Stream, IntToStr(FCounter) + ' 0 obj');
  Inc(FCounter);
  WriteLn(Stream, '<<');
  WriteLn(Stream, '/Type /Pages');
  FStartFonts := FCounter - 1;
  FStartPages := FCounter + FFonts.Count * FFontDCnt - 1;
  Write(Stream, '/Kids [');
  for i := 0 to FPages.Count - 1 do
    Write(Stream, IntToStr(FStartPages + i * 2 + 1) + ' 0 R ');
  WriteLn(Stream, ']');
  WriteLn(Stream, '/Count ' + IntToStr(FPages.Count));
  WriteLn(Stream, '>>');
  WriteLn(Stream, 'endobj');
  for i := 0 to FFonts.Count - 1 do
    TfrxPDFFont(FFonts[i]).SaveToStream(Stream);
  for i := 0 to FPages.Count - 1 do
    TfrxPDFPage(FPages[i]).SaveToStream(Stream);
  FStartXRef := Stream.Position;
  WriteLn(Stream, 'xref');
  WriteLn(Stream, '0 ' + IntToStr(FXRef.Count + 1));
  WriteLn(Stream, '0000000000 65535 f');
  for i := 0 to FXRef.Count - 1 do
    WriteLn(Stream, FXRef[i] + ' 00000 n');
  WriteLn(Stream, 'trailer');
  WriteLn(Stream, '<<');
  WriteLn(Stream, '/Size ' + IntToStr(FXref.Count + 1));
  WriteLn(Stream, '/Root 1 0 R');
  WriteLn(Stream, '/Info 2 0 R');
  WriteLn(Stream, '>>');
  WriteLn(Stream, 'startxref');
  WriteLn(Stream, IntToStr(FStartXRef));
  WriteLn(Stream, '%%EOF');
end;

procedure TfrxPDFFile.XRefAdd(Stream: TStream);
begin
  FXRef.Add(StringOfChar('0',  10 - Length(IntToStr(Stream.Position))) + IntToStr(Stream.Position));
end;

function TfrxPDFFile.AddFont(Font: TFont): Integer;
var
  Font2: TfrxPDFFont;
  i, j: Integer;
begin
  j := -1;
  for i := 0 to FFonts.Count - 1 do
  begin
    Font2 := TfrxPDFFont(FFonts[i]);
    if (Font2.Font.Name = Font.Name) and
       (Font2.Font.Style = Font.Style) and
       (Font2.Font.Charset = Font.Charset) then
    begin
      j := i;
      break;
    end;
  end;
  if j = -1 then
  begin
    Font2 := TfrxPDFFont.Create;
    Font2.Parent := Self;
    Font2.Font.Assign(Font);
    FFonts.Add(Font2);
    j := FFonts.Count - 1;
    Font2.Index := j * FFontDCnt + 1
  end;
  Result := j;
end;

function TfrxPDFFile.AddPage(Page: TfrxReportPage): TfrxPDFPage;
var
  PDFPage: TfrxPDFPage;
begin
  PDFPage := TfrxPDFPage.Create;
  PDFPage.Width := Page.Width * PDF_DIVIDER;
  PDFPage.Height := Page.Height * PDF_DIVIDER;
  PDFPage.MarginLeft := Page.LeftMargin * PDF_MARG_DIVIDER;
  PDFPAge.MarginTop := Page.TopMargin * PDF_MARG_DIVIDER;
  PDFPage.Parent := Self;
  FPages.Add(PDFPage);
  PDFPage.Index := FPages.Count;
  Result := PDFPage;
  if FEmbedded then
    FFontDCnt := 3
  else FFontDCnt := 2;
end;

{ TfrxPDFPage }

constructor TfrxPDFPage.Create;
begin
  FStreamObjects := TMemoryStream.Create;
  FMarginLeft := 0;
  FMarginTop := 0;
end;

destructor TfrxPDFPage.Destroy;
begin
  FStreamObjects.Free;
  inherited;
end;

procedure TfrxPDFPage.Clear;
begin
  FStreamObjects.Clear;
end;

procedure TfrxPDFPage.SaveToStream(Stream: TStream);
var
  i: Integer;
  OldSep: Char;
  s: String;
  TmpPageStream: TMemoryStream;
begin
  inherited SaveToStream(Stream);
  Parent.XRefAdd(Stream);
  OldSep := DecimalSeparator;
  DecimalSeparator := '.';
  WriteLn(Stream, IntToStr((Index * 2) - 1 + Parent.FStartPages) + ' 0 obj');
  WriteLn(Stream, '<<');
  WriteLn(Stream, '/Type /Page');
  WriteLn(Stream, '/Parent ' + IntToStr(Parent.FPagesRoot) + ' 0 R');
  WriteLn(Stream, '/MediaBox [0 0 ' + Format('%.4f', [FWidth]) + ' ' + Format('%.4f', [FHeight]) + ' ]');
  WriteLn(Stream, '/Resources <<');
  WriteLn(Stream, '/Font <<');
  for i := 0 to Parent.FFonts.Count - 1 do
    WriteLn(Stream, '/F' + IntToStr(TfrxPDFFont(Parent.FFonts[i]).Index - 1) + ' ' + IntToStr(i * Parent.FFontDCnt + 1 + Parent.FStartFonts) + ' 0 R');
  WriteLn(Stream, '>>');
  WriteLn(Stream, '/XObject <<');
  WriteLn(Stream, '>>');
  WriteLn(Stream, '/ProcSet [/PDF /Text /ImageC ]');
  WriteLn(Stream, '>>');
  WriteLn(Stream, '/Contents ' + IntToStr((Index * 2) - 1 + Parent.FStartPages + 1) + ' 0 R');
  WriteLn(Stream, '>>');
  WriteLn(Stream, 'endobj');
  Parent.XRefAdd(Stream);
  WriteLn(Stream, IntToStr((Index * 2) - 1 + Parent.FStartPages + 1) + ' 0 obj');
  Write(Stream, '<< ');
  TmpPageStream := TMemoryStream.Create;
  try
    if Parent.FCompressed then
    begin
      frxDeflateStream(FStreamObjects, TmpPageStream, gzMax);
      s := '/Filter /FlateDecode /Length ' + IntToStr(TmpPageStream.Size) + ' /Length1 ' + IntToStr(FStreamObjects.Size)
    end
    else s := '/Length ' + IntToStr(FStreamObjects.Size);
    WriteLn(Stream, s + ' >>');
    WriteLn(Stream, 'stream');
    if Parent.FCompressed then
    begin
      Stream.CopyFrom(TmpPageStream, 0);
      WriteLn(Stream, '');
    end
    else
      Stream.CopyFrom(FStreamObjects, 0);
  finally
    TmpPageStream.Free;
  end;
  WriteLn(Stream, 'endstream');
  WriteLn(Stream, 'endobj');
  DecimalSeparator := OldSep;
end;

procedure TfrxPDFPage.AddObject(Obj: TfrxView);
var
  FontIndex: Integer;
  x, y: Extended;
  i: Integer;

  Jpg: TJPEGImage;

  s: String;
  Lines: TStrings;
  OldSep: Char;
  TempBitmap: TBitmap;
  OldFrameWidth: Extended;

  procedure MakeUpFrames;
  begin
    if (Obj.Frame.Typ <> []) and (Obj.Frame.Color <> clNone) then
    begin
      WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Frame.Color) + ' RG');
      WriteLn(FStreamObjects, Format('%.4f', [Obj.Frame.Width * PDF_DIVIDER]) + ' w');
      if ftTop in Obj.Frame.Typ then
      begin
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop)]) + ' m');
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop)]) + ' l');
        WriteLn(FStreamObjects, 'S')
      end;
      if ftLeft in Obj.Frame.Typ then
      begin
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop)]) + ' m');
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' l');
        WriteLn(FStreamObjects, 'S')
      end;
      if ftBottom in Obj.Frame.Typ then
      begin
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' m');
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' l');
        WriteLn(FStreamObjects, 'S')
      end;
      if ftRight in Obj.Frame.Typ then
      begin
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop)]) + ' m');
        WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' l');
        WriteLn(FStreamObjects, 'S')
      end;
    end;
  end;

  function HTMLTags(View: TfrxCustomMemoView): Boolean;
  var
    f: Boolean;
  begin
    f := View.AllowHTMLTags;
    View.AllowHTMLTags := True;
    Result := FParent.HTMLTags and
      (Pos('<' ,View.Memo.Text) > 0) and
      (Pos('>' ,View.Memo.Text) > 0);
    View.AllowHTMLTags := f;
  end;

begin
  OldSep := DecimalSeparator;
  OldFrameWidth := 0;
  DecimalSeparator := '.';
  // Text
  if (Obj is TfrxCustomMemoView) and (TfrxCustomMemoView(Obj).Rotation = 0) and
     (TfrxCustomMemoView(Obj).BrushStyle in [bsSolid, bsClear]) and
     (not HTMLTags(TfrxCustomMemoView(Obj))) then
  begin
    if Obj.Frame.DropShadow then
    begin
      Obj.Width := Obj.Width - Obj.Frame.ShadowWidth;
      Obj.Height := Obj.Height - Obj.Frame.ShadowWidth;
      WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Frame.ShadowColor) + ' rg');
      WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Frame.ShadowColor) + ' RG');
      Write(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height + Obj.Frame.ShadowWidth)]) + ' ');
      WriteLn(FStreamObjects, Format('%.4f', [Obj.Frame.ShadowWidth * PDF_DIVIDER]) + ' ' + Format('%.4f', [Obj.Height * PDF_DIVIDER]) + ' re');
      WriteLn(FStreamObjects, 'B');
      Write(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Frame.ShadowWidth)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height + Obj.Frame.ShadowWidth)]) + ' ');
      WriteLn(FStreamObjects, Format('%.4f', [Obj.Width * PDF_DIVIDER]) + ' ' + Format('%.4f', [Obj.Frame.ShadowWidth * PDF_DIVIDER]) + ' re');
      WriteLn(FStreamObjects, 'B');
    end;
    if TfrxCustomMemoView(Obj).Highlight.Active and
       Assigned(TfrxCustomMemoView(Obj).Highlight.Font) then
    begin
      Obj.Font.Assign(TfrxCustomMemoView(Obj).Highlight.Font);
      Obj.Color := TfrxCustomMemoView(Obj).Highlight.Color;
    end;
    if Obj.Color <> clNone then
    begin
      WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Color) + ' rg');
      Write(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' ');
      WriteLn(FStreamObjects, Format('%.4f', [Obj.Width * PDF_DIVIDER]) + ' ' + Format('%.4f', [Obj.Height * PDF_DIVIDER]) + ' re');
      WriteLn(FStreamObjects, 'f');
    end;
    MakeUpFrames;
    Lines := TStringList.Create;
    Lines.Text := TfrxCustomMemoView(Obj).WrapText(True);
    if Lines.Count > 0 then
    begin
      FontIndex := Parent.AddFont(Obj.Font);
      WriteLn(FStreamObjects, '/F' + IntToStr(TfrxPDFFont(Parent.FFonts[FontIndex]).Index - 1) + ' ' + IntToStr(Obj.Font.Size) + ' Tf');
      WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Font.Color) + ' rg');
      Parent.PTool.SetMemo(TfrxCustomMemoView(Obj));
      for i := 0 to Lines.Count - 1 do
      begin
        if TfrxCustomMemoView(Obj).RTLReading then
          s := Parent.PTool.Str2RTL(Parent.PTool.TruncReturns(Lines[i]))
        else
          s := Parent.PTool.TruncReturns(Lines[i]);
        if Length(Trim(s)) > 0 then
        begin
          WriteLn(FStreamObjects, 'BT');
          x := GetLeft(Parent.PTool.GetHTextPos(Obj.AbsLeft + TfrxCustomMemoView(Obj).GapX, Obj.Width - TfrxCustomMemoView(Obj).GapX * 2, Lines[i], TfrxCustomMemoView(Obj).HAlign));
          y := GetTop(Parent.PTool.GetVTextPos(Obj.AbsTop + TfrxCustomMemoView(Obj).GapY - 2, Obj.Height - TfrxCustomMemoView(Obj).GapY * 2, Lines[i], TfrxCustomMemoView(Obj).VAlign, i, Lines.Count));
          WriteLn(FStreamObjects, Format('%.4f', [x]) + ' ' + Format('%.4f', [y]) + ' Td');
          WriteLn(FStreamObjects, '(' + s + ') Tj');
          WriteLn(FStreamObjects, 'ET');
          if fsUnderline in (TfrxCustomMemoView(Obj).Font.Style) then
          begin
            WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Font.Color) + ' RG');
            WriteLn(FStreamObjects, Format('%.4f', [Obj.Font.Size * 0.08]) + ' w');
            WriteLn(FStreamObjects, Format('%.4f', [x]) + ' ' + Format('%.4f', [y - Obj.Font.Size * 0.12]) + ' m');
            WriteLn(FStreamObjects, Format('%.4f', [x + Parent.PTool.GetLineWidth(Lines[i]) * PDF_DIVIDER]) + ' ' + Format('%.4f', [y - Obj.Font.Size * 0.12]) + ' l');
            WriteLn(FStreamObjects, 'S')
          end;
        end;
      end;
    end;
    Lines.Free;
  end
  // Lines
  else if Obj is TfrxCustomLineView then
  begin
    WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Frame.Color) + ' RG');
    WriteLn(FStreamObjects, Format('%.4f', [Obj.Frame.Width * PDF_DIVIDER]) + ' w');
    WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop)]) + ' m');
    WriteLn(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft + Obj.Width)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' l');
    WriteLn(FStreamObjects, 'S')
  end
  // Rects
  else if (Obj is TfrxShapeView) and (TfrxShapeView(Obj).Shape = skRectangle) then
  begin
    WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Frame.Color) + ' RG');
    WriteLn(FStreamObjects, Format('%.4f', [Obj.Frame.Width * PDF_DIVIDER]) + ' w');
    WriteLn(FStreamObjects, Parent.PTool.GetPDFColor(Obj.Color) + ' rg');
    Write(FStreamObjects, Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' + Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' ');
    WriteLn(FStreamObjects, Format('%.4f', [Obj.Width * PDF_DIVIDER]) + ' ' + Format('%.4f', [Obj.Height * PDF_DIVIDER]) + ' re');
    WriteLn(FStreamObjects, 'B');
  end
  else
  // Bitmaps
  if not (((Obj.Name = '_pagebackground'){ or (Obj.Name = '')}) and (not Parent.Background)) then
  begin
    if Obj.Frame.Width > 0 then
    begin
      OldFrameWidth := Obj.Frame.Width;
      Obj.Frame.Width := 0;
    end;
    TempBitmap := TBitmap.Create;
    TempBitmap.PixelFormat := pf24bit;
    if Parent.PrintOptimized or (Obj is TfrxCustomMemoView) then
      i := PDF_PRINTOPT
    else i := 1;
    TempBitmap.Width := Round(Obj.Width * i) + 1;
    TempBitmap.Height := Round(Obj.Height * i) + 1;
    Obj.Draw(TempBitmap.Canvas, i, i, -Obj.AbsLeft * i, -Obj.AbsTop * i);
    WriteLn(FStreamObjects, 'q');
    WriteLn(FStreamObjects, Format('%.4f', [Obj.Width * PDF_DIVIDER]) +
      ' 0 0 ' + Format('%.4f', [Obj.Height * PDF_DIVIDER]) + ' ' +
      Format('%.4f', [GetLeft(Obj.AbsLeft)]) + ' ' +
      Format('%.4f', [GetTop(Obj.AbsTop + Obj.Height)]) + ' cm');
    WriteLn(FStreamObjects, 'BI');
    WriteLn(FStreamObjects, '/W ' + IntToStr(TempBitmap.Width));
    WriteLn(FStreamObjects, '/H ' + IntToStr(TempBitmap.Height));
    WriteLn(FStreamObjects, '/CS /RGB');
    WriteLn(FStreamObjects, '/BPC 8');
    WriteLn(FStreamObjects, '/I true');
    WriteLn(FStreamObjects, '/F [/DCT]');
    WriteLn(FStreamObjects, 'ID');

    Jpg := TJPEGImage.Create;
    Jpg.CompressionQuality := 100;
    Jpg.PixelFormat := jf24Bit;
    Jpg.Assign(TempBitmap);
    Jpg.SaveToStream(FStreamObjects);
    Jpg.Free;

    WriteLn(FStreamObjects, '');
    WriteLn(FStreamObjects, 'EI');
    WriteLn(FStreamObjects, 'Q');
    TempBitmap.Free;
    if OldFrameWidth > 0 then
      Obj.Frame.Width := OldFrameWidth;
    MakeUpFrames;
  end;
  DecimalSeparator := OldSep;
end;

function TfrxPDFPage.GetLeft(Left: Extended): Extended;
begin
  Result := MarginLeft + Left * PDF_DIVIDER
end;

function TfrxPDFPage.GetTop(Top: Extended): Extended;
begin
  Result := FHeight - (MarginTop + Top * PDF_DIVIDER)
end;


{ TfrxPDFFont }

constructor TfrxPDFFont.Create;
begin
  FFont := TFont.Create;
end;

destructor TfrxPDFFont.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TfrxPDFFont.SaveToStream(Stream: TStream);
var
  s: String;
  b: TBitmap;
  pm: ^OUTLINETEXTMETRIC;
  FontName: String;
  i: Cardinal;
  pfont: PChar;
  FirstChar, LastChar : Integer;
  MemStream: TMemoryStream;
  MemStream1: TMemoryStream;
  pwidths: PABC;
  Charset: TFontCharSet;

  // support DBCS font name encoding
  function EncodeFontName(AFontName: String): string;
  var
    s: string;
    Index, Len: Integer;
  begin
    s := '';
    Len := Length(AFontName);
    Index := 0;
    while Index < Len do
    begin
      Index := Index + 1;
      if Byte(AFontName[Index]) > $7F then
        s := s + '#' + IntToHex(Byte(AFontName[Index]), 2)
      else
        s := s + AFontname[Index];
    end;
    Result := s;
  end;

begin
  inherited SaveToStream(Stream);
  b := TBitmap.Create;
  b.Canvas.Font.Assign(Font);
  b.Canvas.Font.PixelsPerInch := 96;
  b.Canvas.Font.Size := 750;
  i := GetOutlineTextMetrics(b.Canvas.Handle, 0, nil);
  GetMem(pm, i);
  try
    try
      GetOutlineTextMetrics(b.Canvas.Handle, i, pm);
      FirstChar := Ord(pm.otmTextMetrics.tmFirstChar);
      LastChar := Ord(pm.otmTextMetrics.tmLastChar);
      FontName := StringReplace(Font.Name, ' ', '#20', [rfReplaceAll]);
      s := '';
      if fsBold in Font.Style then
        s := s + 'Bold';
      if fsItalic in Font.Style then
        s := s + 'Italic';
      if s <> '' then
        FontName := FontName + ',' + s;

      Charset := pm.otmTextMetrics.tmCharSet;
      FontName := EncodeFontName(FontName);

      Parent.XRefAdd(Stream);
      WriteLn(Stream, IntToStr(Index + Parent.FStartFonts) + ' 0 obj');
      WriteLn(Stream, '<<');
      WriteLn(Stream, '/Type /Font');
      WriteLn(Stream, '/Name /F' + IntToStr(Index - 1));
      WriteLn(Stream, '/BaseFont /' + FontName);

      if Charset <> CHINESEBIG5_CHARSET then
        WriteLn(Stream, '/Subtype /TrueType')
      else
        WriteLn(Stream, '/Subtype /Type0');

      case Charset of
        SYMBOL_CHARSET, ANSI_CHARSET:
          WriteLn(Stream, '/Encoding /WinAnsiEncoding');

        RUSSIAN_CHARSET: {1251}
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [129 /afii10052');
          Write(Stream, '/quotesinglbase/afii10100/quotedblbase/ellipsis/dagger/daggerdbl/Euro/perthousand/afii10058/guilsinglleft/afii10059/afii10061/afii10060/afii10145/afii10099/quoteleft');
          Write(Stream, '/quoteright/quotedblleft/quotedblright/bullet/endash/emdash/space/trademark/afii10106/guilsinglright/afii10107/afii10109/afii10108/afii10193/space/afii10062');
          Write(Stream, '/afii10110/afii10057/currency/afii10050/brokenbar/section/afii10023/copyright/afii10053/guillemotleft/logicalnot/hyphen/registered/afii10056/degree/plusminus');
          Write(Stream, '/afii10055/afii10103/afii10098/mu/paragraph/periodcentered/afii10071/afii61352/afii10101/guillemotright/afii10105/afii10054/afii10102/afii10104/afii10017/afii10018');
          Write(Stream, '/afii10019/afii10020/afii10021/afii10022/afii10024/afii10025/afii10026/afii10027/afii10028/afii10029/afii10030/afii10031/afii10032/afii10033/afii10034/afii10035');
          Write(Stream, '/afii10036/afii10037/afii10038/afii10039/afii10040/afii10041/afii10042/afii10043/afii10044/afii10045/afii10046/afii10047/afii10048/afii10049/afii10065/afii10066');
          Write(Stream, '/afii10067/afii10068/afii10069/afii10070/afii10072/afii10073/afii10074/afii10075/afii10076/afii10077/afii10078/afii10079/afii10080/afii10081/afii10082/afii10083');
          WriteLn(Stream, '/afii10084/afii10085/afii10086/afii10087/afii10088/afii10089/afii10090/afii10091/afii10092/afii10093/afii10094/afii10095/afii10096/afii10097/space]');
          WriteLn(Stream, '>>');
        end;

        EASTEUROPE_CHARSET: {1250}
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [128 /Euro 140 /Sacute /Tcaron /Zcaron /Zacute');
          Write(Stream, ' 156 /sacute /tcaron /zcaron /zacute 161 /caron /breve /Lslash');
          Write(Stream, ' 165 /Aogonek 170 /Scedilla 175 /Zdotaccent 178 /ogonek /lslash');
          Write(Stream, ' 185 /aogonek /scedilla 188 /Lcaron /hungarumlaut /lcaron /zdotaccent /Racute');
          Write(Stream, ' 195 /Abreve 197 /Lacute /Cacute 200 /Ccaron 202 /Eogonek 204 /Ecaron 207 /Dcaron /Dslash');
          Write(Stream, ' 209 /Nacute /Ncaron /Oacute 213 /Ohungarumlaut 216 /Rcaron /Uring 219 /Uhungarumlaut');
          Write(Stream, ' 222 /Tcedilla 224 /racute 227 /abreve 229 /lacute /cacute /ccedilla /ccaron');
          Write(Stream, ' 234 /eogonek 236 /ecaron 239 /dcaron /dmacron /nacute /ncaron 245 /ohungarumlaut');
          Write(Stream, ' 248 /rcaron /uring 251 /uhungarumlaut 254 /tcedilla /dotaccent]');
          WriteLn(Stream, '>>');
        end;

        GREEK_CHARSET: {1253}
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [ 128 /Euro 160 /quoteleft/quoteright 175 /afii00208');
          Write(Stream, ' 180 /tonos/dieresistonos/Alphatonos');
          Write(Stream, ' 184 /Epsilontonos/Etatonos/Iotatonos');
          Write(Stream, ' 188 /Omicrontonos 190 /Upsilontonos');
          Write(Stream, '/Omegatonos/iotadieresistonos/Alpha/Beta/Gamma/Delta/Epsilon/Zeta');
          Write(Stream, '/Eta/Theta/Iota/Kappa/Lambda/Mu/Nu/Xi/Omicron/Pi/Rho');
          Write(Stream, ' 211 /Sigma/Tau/Upsilon/Phi');
          Write(Stream, '/Chi/Psi/Omega/Iotadieresis/Upsilondieresis/alphatonos/epsilontonos');
          Write(Stream, '/etatonos/iotatonos/upsilondieresistonos/alpha/beta/gamma/delta/epsilon');
          Write(Stream, '/zeta/eta/theta/iota/kappa/lambda/mu/nu/xi/omicron/pi/rho/sigma1/sigma');
          Write(Stream, '/tau/upsilon/phi/chi/psi/omega/iotadieresis/upsilondieresis/omicrontonos');
          Write(Stream, '/upsilontonos/omegatonos ]');
          WriteLn(Stream, '>>');
        end;

        TURKISH_CHARSET: {1254}
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [ 128 /Euro');
          Write(Stream, ' 130 /quotesinglbase/florin/quotedblbase/ellipsis/dagger');
          Write(Stream, ' /daggerdbl/circumflex/perthousand/Scaron/guilsinglleft/OE');
          Write(Stream, ' 145 /quoteleft/quoteright/quotedblleft/quotedblright');
          Write(Stream, ' /bullet/endash/emdash/tilde/trademark/scaron/guilsinglright/oe');
          Write(Stream, ' 159 /Ydieresis 208 /Gbreve 221 /Idotaccent/Scedilla');
          Write(Stream, ' 240 /gbreve 253 /dotlessi/scedilla]');
          WriteLn(Stream, '>>');
        end;

        HEBREW_CHARSET: {1255}
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [ 128 /Euro 130 /quotesinglbase/florin/quotedblbase/ellipsis');
          Write(Stream, ' /dagger/daggerdbl/circumflex/perthousand 139 /guilsinglleft');
          Write(Stream, ' 145 /quoteleft/quoteright/quotedblleft/quotedblright');
          Write(Stream, ' /bullet/endash/emdash/tilde/trademark 155 /perthousand');
          Write(Stream, ' 164 /afii57636 170 /multiply 186 /divide');
          Write(Stream, ' 192 /afii57799/afii57801/afii57800/afii57802/afii57793');
          Write(Stream, ' /afii57794/afii57795/afii57798/afii57797/afii57806');
          Write(Stream, ' 203 /afii57796/afii57807/afii57839/afii57645/afii57841/afii57842');
          Write(Stream, ' /afii57804/afii57803/afii57658/afii57716/afii57717/afii57718');
          Write(Stream, ' 224 /afii57664/afii57665/afii57666/afii57667/afii57668/afii57669');
          Write(Stream, ' /afii57670/afii57671/afii57672/afii57673/afii57674/afii57675');
          Write(Stream, ' /afii57676/afii57677/afii57678/afii57679/afii57680/afii57681');
          Write(Stream, ' /afii57682/afii57683/afii57684/afii57685/afii57686/afii57687');
          Write(Stream, ' /afii57688/afii57689/afii57690 253 /afii299/afii300]');
          WriteLn(Stream, '>>');
        end;

        ARABIC_CHARSET:
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [ 128 /Euro/afii57506/quotesinglbase/florin/quotedblbase');
          Write(Stream, '/ellipsis/dagger/daggerdbl/circumflex/perthousand/afii57511');
          Write(Stream, '/guilsinglleft/OE/afii57507/afii57508');
          Write(Stream, ' 144 /afii57509/quoteleft/quoteright/quotedblleft');
          Write(Stream, '/quotedblright/bullet/endash/emdash');
          Write(Stream, ' 153 /trademark/afii57513/guilsinglright/oe/afii61664');
          Write(Stream, '/afii301/afii57514 161 /afii57388');
          Write(Stream, ' 186 /afii57403 191 /afii57407');
          Write(Stream, ' 193 /afii57409/afii57410/afii57411/afii57412/afii57413');
          Write(Stream, '/afii57414/afii57415/afii57416/afii57417/afii57418/afii57419');
          Write(Stream, '/afii57420/afii57421/afii57422/afii57423/afii57424/afii57425');
          Write(Stream, '/afii57426/afii57427/afii57428/afii57429/afii57430');
          Write(Stream, ' 216 /afii57431/afii57432/afii57433/afii57434/afii57440');
          Write(Stream, '/afii57441/afii57442/afii57443/afii57444');
          Write(Stream, ' 227 /afii57445/afii57446/afii57470/afii57448/afii57449');
          Write(Stream, '/afii57450 240 /afii57451/afii57452/afii57453/afii57454');
          Write(Stream, '/afii57455/afii57456 248 /afii57457 250 /afii57458');
          Write(Stream, ' 253 /afii299/afii300/afii57519]');
          WriteLn(Stream, '>>');
        end;

        VIETNAMESE_CHARSET:
        begin
          WriteLn(Stream, '/Encoding <</Type/Encoding /BaseEncoding /WinAnsiEncoding');
          Write(Stream, '/Differences [128 /Euro 142 /Zcaron 158 /zcaron]');
          WriteLn(Stream, '>>');
        end;

        CHINESEBIG5_CHARSET: {136}
        begin
          WriteLn(Stream, '/DescendantFonts [' + IntToStr(Index + 1 + Parent.FStartFonts) + ' 0 R]');
          WriteLn(Stream, '/Encoding /ETenms-B5-H');
          WriteLn(Stream, '>>');
          WriteLn(Stream, 'endobj');
          WriteLn(Stream, IntToStr(Index + 1 + Parent.FStartFonts) + ' 0 obj');
          WriteLn(Stream, '<<');
          WriteLn(Stream, '/Type /Font');
          WriteLn(Stream, '/Subtype');
          WriteLn(Stream, '/CIDFontType2');
          WriteLn(Stream, '/BaseFont /'+ EncodeFontName(FontName));
          WriteLn(Stream, '/WinCharSet 136');
          Write(Stream, '/FontDescriptor ');
          WriteLn(Stream, '<<');
          WriteLn(Stream, '/Type /FontDescriptor');
          if Parent.FEmbedded then
             WriteLn(Stream, '/FontFile2 ' + IntToStr(Index + 2 + Parent.FStartFonts) + ' 0 R');
          WriteLn(Stream, '/FontName /' + EncodeFontName(FontName));
          WriteLn(Stream, '/Flags 7');
          WriteLn(Stream, '/FontBBox [' + IntToStr(pm^.otmrcFontBox.Left) + ' '+ IntToStr(pm^.otmrcFontBox.Bottom) + ' '+ IntToStr(pm^.otmrcFontBox.Right) + ' '+ IntToStr(pm^.otmrcFontBox.Top) + ' ]');
          WriteLn(Stream, '/Style << /Panose <010502020300000000000000> >>');
          WriteLn(Stream, '/Ascent ' + IntToStr(pm^.otmAscent));
          WriteLn(Stream, '/Descent ' + IntToStr(pm^.otmDescent));
          WriteLn(Stream, '/CapHeight ' + IntToStr(pm^.otmTextMetrics.tmHeight));
          WriteLn(Stream, '/StemV ' + IntToStr(50 + Round(sqr(pm^.otmTextMetrics.tmWeight / 65))));
          WriteLn(Stream, '/ItalicAngle ' + IntToStr(pm^.otmItalicAngle));
          WriteLn(Stream, '>>');
          WriteLn(Stream, '/CIDSystemInfo');
          WriteLn(Stream, '<<');
          WriteLn(Stream, '/Registry(Adobe)');
          WriteLn(Stream, '/Ordering(CNS1)');
          WriteLn(Stream, '/Supplement 0');
          WriteLn(Stream, '>>');
          WriteLn(Stream, '/DW 1000');
          WriteLn(Stream, '/W [1 95 500]');
          WriteLn(Stream, '>>');
          WriteLn(Stream, 'endobj');
        end;
      end;

      if Charset <> CHINESEBIG5_CHARSET then
      begin
        WriteLn(Stream, '/FontDescriptor ' + IntToStr(Index + 1 + Parent.FStartFonts) + ' 0 R');
        WriteLn(Stream, '/FirstChar ' + IntToStr(FirstChar));
        WriteLn(Stream, '/LastChar ' + IntToStr(LastChar));
        GetMem(pwidths, SizeOf(ABCArray));
        Write(Stream, '/Widths [');
        GetCharABCWidths(b.Canvas.Handle, FirstChar, LastChar, pwidths^);
        for i := 0 to (LastChar - FirstChar) do
          Write(Stream, IntToStr(pwidths^[i].abcA + Integer(pwidths^[i].abcB) + pwidths^[i].abcC) + ' ');
        WriteLn(Stream, ']');
        FreeMem(pwidths);
        WriteLn(Stream, '>>');
        WriteLn(Stream, 'endobj');
        Parent.XRefAdd(Stream);
        WriteLn(Stream, IntToStr(Index + 1 + Parent.FStartFonts) + ' 0 obj');
        WriteLn(Stream, '<<');
        WriteLn(Stream, '/Type /FontDescriptor');
        WriteLn(Stream, '/FontName /' + FontName);
        WriteLn(Stream, '/Flags 32');
        WriteLn(Stream, '/FontBBox [' + IntToStr(pm^.otmrcFontBox.Left) + ' '+ IntToStr(pm^.otmrcFontBox.Bottom) + ' '+ IntToStr(pm^.otmrcFontBox.Right) + ' '+ IntToStr(pm^.otmrcFontBox.Top) + ' ]');
        WriteLn(Stream, '/ItalicAngle ' + IntToStr(pm^.otmItalicAngle));
        WriteLn(Stream, '/Ascent ' + IntToStr(pm^.otmAscent));
        WriteLn(Stream, '/Descent ' + IntToStr(pm^.otmDescent));
        WriteLn(Stream, '/Leading ' + IntToStr(pm^.otmTextMetrics.tmInternalLeading)); //NEW
        WriteLn(Stream, '/CapHeight ' + IntToStr(pm^.otmTextMetrics.tmHeight));
        WriteLn(Stream, '/XHeight ' + IntToStr(pm^.otmsXHeight)); //NEW
        WriteLn(Stream, '/StemV ' + IntToStr(50 + Round(sqr(pm^.otmTextMetrics.tmWeight / 65))));
        WriteLn(Stream, '/AvgWidth ' + IntToStr(pm^.otmTextMetrics.tmAveCharWidth)); //NEW
        WriteLn(Stream, '/MaxWidth ' + IntToStr(pm^.otmTextMetrics.tmMaxCharWidth)); //NEW
        WriteLn(Stream, '/MissingWidth ' + IntToStr(pm^.otmTextMetrics.tmAveCharWidth)); //NEW
        if Parent.FEmbedded then
          WriteLn(Stream, '/FontFile2 ' + IntToStr(Index + 2 + Parent.FStartFonts) + ' 0 R');

        WriteLn(Stream, '>>');
        WriteLn(Stream, 'endobj');
      end;

      if Parent.FEmbedded then
      begin
        Parent.XRefAdd(Stream);
        WriteLn(Stream, IntToStr(Index + 2 + Parent.FStartFonts) + ' 0 obj');
        i := GetFontData(b.Canvas.Handle, 0, 0, nil, 1);
        GetMem(pfont, i);
        i := GetFontData(b.Canvas.Handle, 0, 0, pfont, i);
        MemStream := TMemoryStream.Create;
        MemStream.Write(pfont^, i);
        MemStream1 := TMemoryStream.Create;
        frxDeflateStream(MemStream, MemStream1, gzMax);
        WriteLn(Stream, '<< /Length ' + IntToStr(MemStream1.Size) + ' /Filter /FlateDecode /Length1 ' + IntToStr(MemStream.Size) + ' >>');
        WriteLn(Stream, 'stream');
        Stream.CopyFrom(MemStream1, 0);
        MemStream1.Free;
        MemStream.Free;
        FreeMem(pfont);
        WriteLn(Stream, '');
        WriteLn(Stream, 'endstream');
        WriteLn(Stream, 'endobj');
      end;
    except
    end;
  finally
    FreeMem(pm);
    b.Free;
  end;
end;

{ TfrxPDFElement }

constructor TfrxPDFElement.Create;
begin
  FIndex := 0;
  FXrefPosition := 0;
end;

procedure TfrxPDFElement.SaveToStream(Stream: TStream);
begin
  FXrefPosition := Stream.Position;
end;

procedure TfrxPDFElement.Write(Stream: TStream; S: String);
begin
  Stream.Write(S[1], Length(S));
end;

procedure TfrxPDFElement.WriteLn(Stream: TStream; S: String);
begin
  Stream.Write(S[1], Length(S));
  Stream.Write(#13#10, 2);
end;


{ TfrxPDFToolkit }

constructor TfrxPDFToolkit.Create;
begin
  Locale := GetLocaleInformation(LOCALE_SISO639LANGNAME);
  Prefix := UnicodePrefix;
end;

function TfrxPDFToolkit.GetLocaleInformation(Flag: Integer): String;
var
  pcLCA: array[0..20] of Char;
begin
  if (GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA,19) <= 0 ) then
    pcLCA[0] := #0;
  Result := pcLCA;
end;

function TfrxPDFToolkit.PrepareString(const Text: String): String;
begin
  if CheckOEM(Text) then
    Result := StrToOct(Prefix) + StrToOctUTF16(Text)
  else
    Result := Text;
end;

function TfrxPDFToolkit.GetHTextPos(Left: Extended; Width: Extended; const Text: String;
  Align: TfrxHAlign): Extended;
var
  FWidth: Extended;
begin
  if (Align = haLeft) or (Align = haBlock) then
    Result := Left
  else begin
    FWidth := GetLineWidth(Text);
    if Align = haCenter then
      Result := Left + Width / 2 - FWidth / 2
    else
      Result := Left + Width - FWidth;
  end;
end;

function TfrxPDFToolkit.GetLineWidth(const Text: String): Extended;
var
  FWidth: Extended;
begin
  frxDrawText.Lock;
  try
    FWidth := frxDrawText.Canvas.TextWidth(Text) / (frxDrawText.DefPPI / frxDrawText.ScrPPI);
  finally
    frxDrawText.UnLock;
  end;
  Result := FWidth;
end;

function TfrxPDFToolkit.GetVTextPos(Top: Extended; Height: Extended; const Text: String;
  Align: TfrxVAlign; Line: Integer = 0; Count: Integer = 1): Extended;
var
  i: Integer;
begin
  if Line <= Count then
    i := Line
  else
    i := 0;
  if Align = vaBottom then
    Result := Top + Height - LineHeight * (Count - i - 1)
  else if Align = vaCenter then
    Result := Top + Height / 2 - (LineHeight * Count) / 2 + LineHeight * (i + 1)
  else
    Result := Top + LineHeight * (i + 1);
end;

function TfrxPDFToolkit.TruncReturns(Str: string): string;
begin
  Str := StringReplace(Str, '\', '\\', [rfReplaceAll]);
  Str := StringReplace(Str, '(', '\(', [rfReplaceAll]);
  Str := StringReplace(Str, ')', '\)', [rfReplaceAll]);
  Str := StringReplace(Str, #1, '', [rfReplaceAll]);
  if Copy(Str, Length(Str) - 1, 2) = #13#10 then
    Delete(Str, Length(Str) - 1, 2);
  Result := Str;
end;

function TfrxPDFToolkit.UnicodePrefix: String;
begin
  Result := #254#255#0#27 + Locale + #0#27;
end;

function TfrxPDFToolkit.GetPDFColor(Color: TColor): String;
var
  TheRgbValue : TColorRef;
  OldSep: Char;
begin
  TheRgbValue := ColorToRGB(Color);
  OldSep := DecimalSeparator;
  DecimalSeparator := '.';
  Result := Format('%.2g %.2g %.2g', [GetRValue(TheRGBValue) / 255, GetGValue(TheRGBValue) / 255, GetBValue(TheRGBValue) / 255]);
  DecimalSeparator := OldSep;
end;

function TfrxPDFToolkit.CheckOEM(const Value: String): boolean;
var
  i: integer;
begin
  result := false;
  for i := 1 to Length(Value) do
    if (ByteType(Value, i) <> mbSingleByte) or
       (Ord(Value[i]) > 122) or
       (Ord(Value[i]) < 32) then
    begin
      result := true;
      Break;
    end;
end;

function TfrxPDFToolkit.StrToOctUTF16(const Value: String): String;
var
  PW: Pointer;
  PByte: ^Byte;
  HiByte, LoByte: Byte;
  Len: integer;
  i: integer;
begin
  result := '';
  Len := MultiByteToWideChar(0, CP_ACP, PChar(Value), Length(Value), nil, 0);
  GetMem(PW, Len * 2);
  Len := MultiByteToWideChar(0, CP_ACP, PChar(Value), Length(Value), PW, Len * 2);
  PByte := Pw;
  i := 0;
  while i < Len do
  begin
    LoByte := PByte^;
    inc(PByte);
    HiByte := PByte^;
    inc(PByte);
    result := result + '\' + Dec2Oct(HiByte) + '\' + Dec2Oct(LoByte);
    inc(i);
  end;
  FreeMem(PW);
end;

function TfrxPDFToolkit.Dec2Oct(i: Longint): string;
var
  m: Longint;
Begin
  Result := '';
  while i > 0 Do
  begin
    m := i mod 8;
    Result := Char(m + Ord('0')) + Result;
    i := i div 8;
  end;
  Result := StringOfChar('0',  3 - Length(Result)) + Result;
end;

function TfrxPDFToolkit.StrToOct(const Value: String): String;
var
  i: Integer;
begin
  for i := 1 to Length(Value) do
    Result := Result + '\' + Dec2Oct(Ord(Value[i]));
end;

procedure TfrxPDFToolkit.SetMemo(Memo: TfrxCustomMemoView);
begin
  frxDrawText.Lock;
  try
    frxDrawText.SetFont(Memo.Font);
    frxDrawText.SetGaps(0, 0, Memo.LineSpacing);
    LineHeight := frxDrawText.LineHeight;
  finally
    frxDrawText.UnLock;
  end;
end;

function TfrxPDFToolkit.Str2RTL(const Str: String): String;
var
  b, i, l: Integer;
  s: String;
  t, f: Boolean;
begin
  Result := ReverseString(Str);
  l := Length(Result);
  i := 1;
  b := 1;
  f := False;
  while i <= l do
  begin
    t := not ((Ord(Result[i]) > 32) and (Ord(Result[i]) < 122));
    if (t and f) then
    begin
      s := Copy(Result, b, i - b);
      Delete(Result, b, i - b);
      s := ReverseString(s);
      Insert(s, Result, b);
      f := False;
    end;
    if not (t or f) then
    begin
      b := i;
      f := True;
    end;
    i := i + 1;
  end;
end;

{ TfrxPDFOutlineNode }

constructor TfrxPDFOutlineNode.Create;
begin
  Title := '';
  Dest := -1;
  Number := 0;
  Count := 0;
  CountTree :=0;
  Parent := nil;
  First := nil;
  Prev := nil;
  Next := nil;
  Last := nil;
end;

destructor TfrxPDFOutlineNode.Destroy;
begin
  if Next <> nil then
    Next.Free;
  if First <> nil then
    First.Free;
  inherited;
end;

end.

