{******************************************}
{ }
{ FastReport v3.0 }
{ Preview Pages }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPreviewPages;

interface

{$I frx.inc}

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  frxClass, frxXML
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxOutline = class(TfrxCustomOutline)
  private
    function Root:TfrxXMLItem;
  protected
    function GetCount:Integer; override;
  public
    procedure AddItem(const Text:String; Top:Integer); override;
    procedure LevelDown(Index:Integer); override;
    procedure LevelRoot; override;
    procedure LevelUp; override;
    procedure GetItem(Index:Integer; var Text:String;
      var Page, Top:Integer); override;
    procedure ShiftItems(From:TfrxXMLItem; NewTop:Integer); override;
    function GetCurPosition:TfrxXMLItem; override;
  end;

  TfrxDictionary = class(TObject)
  private
    FNames:TStringList;
    FSourceNames:TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Name, SourceName:String; Obj:TObject);
    procedure Clear;
    function AddUnique(const Base, SourceName:String; Obj:TObject):String;
    function CreateUniqueName(const Base:String):String;
    function GetSourceName(const Name:String):String;
    function GetObject(const Name:String):TObject;
    property Names:TStringList read FNames;
    property SourceNames:TStringList read FSourceNames;
  end;

  TfrxPreviewPages = class(TfrxCustomPreviewPages)
  private
    FDictionary:TfrxDictionary; { list of all objects }
    FFirstObjectIndex:Integer; { used in the ClearFirstPassPages }
    FFirstPageIndex:Integer; { used in the ClearFirstPassPages }
    FPageCache:TStringList; { last 20 TfrxPreviewPage }
    FPagesItem:TfrxXMLItem; { shortcut to XMLDoc.Root.FindName('previewpages') }
    FSourcePages:TList; { list of source pages }
    FXMLDoc:TfrxXMLDocument; { parsed FP3 document }
    FXMLSize:Integer;
    FTempStream:TStream;
    FAllowPartialLoading:Boolean;
    procedure AfterLoad;
    procedure BeforeSave;
    procedure ClearPageCache;
    procedure ClearSourcePages;
    function CurXMLPage:TfrxXMLItem;
    function GetObject(const Name:String):TfrxComponent;
    procedure DoLoadFromStream;
    procedure DoSaveToStream;
  protected
    function GetCount:Integer; override;
    function GetPage(Index:Integer):TfrxReportPage; override;
    function GetPageSize(Index:Integer):TPoint; override;
  public
    constructor Create(AReport:TfrxReport); override;
    destructor Destroy; override;
    procedure Clear; override;
    procedure Initialize; override;

    { engine commands }
    procedure AddAnchor(const Text:String);
    procedure AddObject(Obj:TfrxComponent); override;
    procedure AddPage(Page:TfrxReportPage); override;
    procedure AddSourcePage(Page:TfrxReportPage); override;
    procedure AddToSourcePage(Obj:TfrxComponent); override;
    procedure BeginPass; override;
    procedure ClearFirstPassPages; override;
    procedure CutObjects(APosition:Integer); override;
    procedure Finish; override;
    procedure PasteObjects(X, Y:Extended); override;
    function BandExists(Band:TfrxBand):Boolean; override;
    function FindAnchor(const Text:String):TfrxXMLItem;
    function GetAnchorPage(const Text:String):Integer;
    function GetCurPosition:Integer; override;
    function GetLastY:Extended; override;

    { preview commands }
    procedure DrawPage(Index:Integer; Canvas:TCanvas; ScaleX, ScaleY,
      OffsetX, OffsetY:Extended); override;
    procedure AddEmptyPage(Index:Integer); override;
    procedure DeletePage(Index:Integer); override;
    procedure ModifyPage(Index:Integer; Page:TfrxReportPage); override;
    procedure LoadFromStream(Stream:TStream;
      AllowPartialLoading:Boolean = False); override;
    procedure SaveToStream(Stream:TStream); override;
    function LoadFromFile(const FileName:String;
      ExceptionIfNotFound:Boolean = False):Boolean; override;
    procedure SaveToFile(const FileName:String); override;
    function Print:Boolean; override;
    function Export(Filter:TfrxCustomExportFilter):Boolean; override;
    procedure ObjectOver(Index:Integer; X, Y:Integer; Button:TMouseButton;
      Shift:TShiftState; Scale, OffsetX, OffsetY:Extended;
      Click:Boolean; var Cursor:TCursor); override;
    property SourcePages:TList read FSourcePages;
  end;

implementation

uses
  frxPreview, Printers, frxPrinter, frxPrintDialog, frxXMLSerializer, frxUtils,
  ShellApi, frxDMPClass, frxRes;

type
  THackComponent = class(TfrxComponent);
  THackMemoView = class(TfrxCustomMemoView);
  THackThread = class(TThread);

{ TfrxOutline }

procedure TfrxOutline.AddItem(const Text:String; Top:Integer);
begin
  CurItem:= CurItem.Add;
  CurItem.Name:= 'item';
  CurItem.Text:= 'text="'+frxStrToXML(Text)+
    '" page="'+IntToStr(PreviewPages.CurPage)+
    '" top="'+IntToStr(Top)+'"';
end;

procedure TfrxOutline.GetItem(Index:Integer; var Text:String; var Page,
  Top:Integer);
var
  Item:TfrxXMLItem;
  s:String;
begin
  Item:= CurItem[Index];
  Text:= Item.Prop['text'];

  s:= Item.Prop['page'];
  if s<>'' then
    Page:= StrToInt(s);

  s:= Item.Prop['top'];
  if s<>'' then
    Top:= StrToInt(s);
end;

procedure TfrxOutline.LevelDown(Index:Integer);
begin
  CurItem:= CurItem[Index];
end;

procedure TfrxOutline.LevelRoot;
begin
  CurItem:= Root;
end;

procedure TfrxOutline.LevelUp;
begin
  if CurItem<>Root then
    CurItem:= CurItem.Parent;
end;

function TfrxOutline.Root:TfrxXMLItem;
begin
  Result:= TfrxPreviewPages(PreviewPages).FXMLDoc.Root.FindItem('outline');
end;

function TfrxOutline.GetCount:Integer;
begin
  Result:= CurItem.Count;
end;

procedure TfrxOutline.ShiftItems(From:TfrxXMLItem; NewTop:Integer);
var
  i, TopY, CorrY:Integer;

  procedure EnumItems(Item:TfrxXMLItem);
  var
    i:Integer;
  begin
    Item.Prop['page']:= IntToStr(StrToInt(Item.Prop['page'])+1);
    Item.Prop['top']:= IntToStr(StrToInt(Item.Prop['top'])+CorrY);
    for i:= 0 to Item.Count-1 do
      EnumItems(Item[i]);
  end;

begin
  i:= From.Parent.IndexOf(From);
  if i+1 >= From.Parent.Count then Exit;
  From:= From.Parent[i+1];

  TopY:= StrToInt(From.Prop['top']);
  CorrY:= NewTop-TopY;
  EnumItems(From);
end;

function TfrxOutline.GetCurPosition:TfrxXMLItem;
begin
  if Count = 0 then
    Result:= CurItem else
    Result:= CurItem[Count-1];
end;

{ TfrxDictionary }

constructor TfrxDictionary.Create;
begin
  FNames:= TStringList.Create;
  FNames.Sorted:= True;
  FSourceNames:= TStringList.Create;
end;

destructor TfrxDictionary.Destroy;
begin
  FNames.Free;
  FSourceNames.Free;
  inherited;
end;

procedure TfrxDictionary.Clear;
begin
  FNames.Clear;
  FSourceNames.Clear;
end;

procedure TfrxDictionary.Add(const Name, SourceName:String; Obj:TObject);
var
  i:Integer;
begin
  i:= FSourceNames.AddObject(SourceName, Obj);
  FNames.AddObject(Name, TObject(i));
end;

function TfrxDictionary.AddUnique(const Base, SourceName:String; Obj:TObject):String;
begin
  Result:= CreateUniqueName(Base);
  Add(Result, SourceName, Obj);
end;

function TfrxDictionary.CreateUniqueName(const Base:String):String;
var
  i:Integer;
begin
  i:= 10000;
  while (i > 1) and (FNames.IndexOf(Base+IntToStr(i)) =-1) do
    i:= i div 2;
  while FNames.IndexOf(Base+IntToStr(i))<>-1 do
    Inc(i);
  Result:= Base+IntToStr(i);
end;

function TfrxDictionary.GetObject(const Name:String):TObject;
var
  i:Integer;
begin
  Result:= nil;
  i:= FNames.IndexOf(Name);
  if i<>-1 then
    Result:= FSourceNames.Objects[Integer(FNames.Objects[i])];
end;

function TfrxDictionary.GetSourceName(const Name:String):String;
var
  i:Integer;
begin
  Result:= '';
  i:= FNames.IndexOf(Name);
  if i<>-1 then
    Result:= FSourceNames[Integer(FNames.Objects[i])];
end;

{ TfrxPreviewPages }

constructor TfrxPreviewPages.Create(AReport:TfrxReport);
begin
  inherited;
  FDictionary:= TfrxDictionary.Create;
  FSourcePages:= TList.Create;
  FXMLDoc:= TfrxXMLDocument.Create;
  FXMLDoc.Root.Name:= 'preparedreport';
// FXMLDoc.AutoIndent:= True;
  FPageCache:= TStringList.Create;
end;

destructor TfrxPreviewPages.Destroy;
begin
  ClearPageCache;
  FPageCache.Free;
  FDictionary.Free;
  ClearSourcePages;
  FSourcePages.Free;
  FXMLDoc.Free;
  inherited;
end;

procedure TfrxPreviewPages.Clear;
begin
  ClearPageCache;
  ClearSourcePages;
  FXMLDoc.Clear;
  FDictionary.Clear;
  CurPage:=-1;
  FXMLSize:= 0;
end;

procedure TfrxPreviewPages.Initialize;
begin
  FXMLDoc.TempDir:= Report.EngineOptions.TempDir;
  Report.InternalOnProgressStart(ptRunning);
end;

procedure TfrxPreviewPages.ClearPageCache;
begin
  while FPageCache.Count > 0 do
  begin
    TfrxReportPage(FPageCache.Objects[0]).Free;
    FPageCache.Delete(0);
  end;
end;

procedure TfrxPreviewPages.ClearSourcePages;
begin
  while FSourcePages.Count > 0 do
  begin
    TfrxReportPage(FSourcePages[0]).Free;
    FSourcePages.Delete(0);
  end;
end;

procedure TfrxPreviewPages.BeginPass;
begin
  FFirstPageIndex:= Count-1;
  if FFirstPageIndex<>-1 then
    FFirstObjectIndex:= FXMLDoc.Root.FindItem('previewpages')[FFirstPageIndex].Count;
end;

procedure TfrxPreviewPages.ClearFirstPassPages;
var
  PagesRoot:TfrxXMLItem;
  p:TfrxXMLItem;
  i:Integer;
begin
  if FFirstPageIndex =-1 then
  begin
    for i:= 0 to FXMLDoc.Root.Count-1 do
      if CompareText(FXMLDoc.Root[i].Name, 'anchors')<>0 then
        FXMLDoc.Root[i].Clear;
  end
  else
  begin
    PagesRoot:= FXMLDoc.Root.FindItem('previewpages');
    p:= PagesRoot[FFirstPageIndex];
    { clear some objects on first page }
    while p.Count > FFirstObjectIndex do
      p[FFirstObjectIndex].Free;
    { clear remained pages }
    while Count > FFirstPageIndex+1 do
      PagesRoot[FFirstPageIndex+1].Free;
  end;

  CurPage:= FFirstPageIndex;
  FXMLSize:= 0;
end;

function TfrxPreviewPages.CurXMLPage:TfrxXMLItem;
begin
  Result:= FXMLDoc.Root.FindItem('previewpages');
  Result:= Result[CurPage];
end;

function TfrxPreviewPages.GetCount:Integer;
begin
  Result:= FXMLDoc.Root.FindItem('previewpages').Count;
end;

function TfrxPreviewPages.GetCurPosition:Integer;
begin
  Result:= CurXMLPage.Count;
end;

procedure TfrxPreviewPages.AddAnchor(const Text:String);
var
  AnchorRoot, Item:TfrxXMLItem;
begin
  AnchorRoot:= FXMLDoc.Root.FindItem('anchors');
  Item:= AnchorRoot.Add;
  Item.Name:= 'item';
  Item.Text:= 'text="'+frxStrToXML(Text)+
    '" page="'+IntToStr(CurPage)+
    '" top="'+IntToStr(Round(Engine.CurY))+'"';
end;

function TfrxPreviewPages.FindAnchor(const Text:String):TfrxXMLItem;
var
  AnchorRoot, Item:TfrxXMLItem;
  i:Integer;
begin
  Result:= nil;
  AnchorRoot:= FXMLDoc.Root.FindItem('anchors');
  for i:= AnchorRoot.Count-1 downto 0 do
  begin
    Item:= AnchorRoot[i];
    if AnsiCompareText(Item.Prop['text'], Text) = 0 then
    begin
      Result:= Item;
      Exit;
    end;
  end;
end;

function TfrxPreviewPages.GetAnchorPage(const Text:String):Integer;
var
  Item:TfrxXMLItem;
begin
  Item:= FindAnchor(Text);
  if Item<>nil then
    Result:= StrToInt(Item.Prop['page'])+1 else
    Result:= 1;
end;

procedure TfrxPreviewPages.AddObject(Obj:TfrxComponent);

  procedure DoAdd(c:TfrxComponent; Item:TfrxXMLItem);
  var
    i:Integer;
  begin
    if not c.Visible then Exit;

    { do not put out subreports, cross-tabs and dialog components }
    if not ((c is TfrxSubReport) or (CompareText(c.ClassName, 'TfrxCrossView') = 0) or
      (CompareText(c.ClassName, 'TfrxDBCrossView') = 0) or (c is TfrxDialogComponent)) then
      with THackComponent(c) do
      begin
        Item:= Item.Add;
        { the component that was created after report has been started }
        if FOriginalComponent = nil then
        begin
          Item.Name:= ClassName;
          Item.Text:= AllDiff(nil);
        end
        else
        begin
          { the component that exists in the report template }
          Item.Name:= FAliasName;
          if Engine.FinalPass then
          begin
            if DefaultDiff then
              Item.Text:= AllDiff(FOriginalComponent) else
              Item.Text:= Diff(FOriginalComponent);
          end
          else
            { we don't need to output all info on the first pass, only coordinates }
            Item.Text:= InternalDiff(FOriginalComponent);
        end;
        Inc(FXMLSize, Length(Item.Name)+Length(Item.Text)+Item.InstanceSize+16);
      end;

    for i:= 0 to c.Objects.Count-1 do
      DoAdd(c.Objects[i], Item);
  end;

begin
  DoAdd(Obj, CurXMLPage);
end;

procedure TfrxPreviewPages.AddPage(Page:TfrxReportPage);
var
  xi:TfrxXMLItem;

  procedure UnloadPages;
  var
    i:Integer;
  begin
    if Report.EngineOptions.UseFileCache then
      if FXMLSize > Report.EngineOptions.MaxMemSize * 1024 * 1024 then
      begin
        for i:= xi.Count-2 downto 0 do
          if xi[i].Loaded then
            FXMLDoc.UnloadItem(xi[i]) else
            break;
        FXMLSize:= 0;
      end;
  end;

  function GetSourceNo(Page:TfrxReportPage):Integer;
  var
    i:Integer;
  begin
    Result:=-1;
    for i:= 0 to FSourcePages.Count-1 do
      if THackComponent(FSourcePages[i]).FOriginalComponent = Page then
      begin
        Result:= i;
        break;
      end;
  end;

begin
  FPagesItem:= FXMLDoc.Root.FindItem('previewpages');
  xi:= FPagesItem;
  UnloadPages;

  CurPage:= CurPage+1;
  if (CurPage >= Count) or (AddPageAction = apAdd) then
  begin
    xi:= xi.Add;
    xi.Name:= 'page'+IntToStr(GetSourceNo(Page));
    if Count > 2 then
      xi.Unloadable:= True;
    Report.InternalOnProgress(ptRunning, CurPage+1);
    AddPageAction:= apWriteOver;
    CurPage:= Count-1;
  end;
end;

procedure TfrxPreviewPages.AddSourcePage(Page:TfrxReportPage);
var
  p:TfrxReportPage;
  xs:TfrxXMLSerializer;
  i:Integer;
  originals, copies:TList;
  c1, c2:TfrxComponent;
  s:String;

  function EnumObjects(Parent, Parent1:TfrxComponent):TfrxComponent;
  var
    i:Integer;
    c:TfrxComponent;
  begin
    Result:= nil;
    if (CompareText(Parent.ClassName, 'TfrxCrossView') = 0) or
      (CompareText(Parent.ClassName, 'TfrxDBCrossView') = 0) or
      (Parent is TfrxDialogComponent) then Exit;

    c:= TfrxComponent(Parent.NewInstance);
    c.Create(Parent1);
    c.Assign(Parent);
    c.Name:= Parent.Name;
    originals.Add(Parent);
    copies.Add(c);

    for i:= 0 to Parent.Objects.Count-1 do
      EnumObjects(Parent.Objects[i], c);
    Result:= c;
  end;

begin
  xs:= TfrxXMLSerializer.Create(nil);
  originals:= TList.Create;
  copies:= TList.Create;

  try
    p:= TfrxReportPage(EnumObjects(Page, nil));
    THackComponent(p).FOriginalComponent:= Page;
    FSourcePages.Add(p);

    for i:= 1 to copies.Count-1 do
    begin
      c1:= copies[i];
      c2:= originals[i];

      THackComponent(c2).FOriginalComponent:= c1;
      THackComponent(c1).FOriginalComponent:= c2;

      if c1 is TfrxBand then
        s:= 'b' else
        s:= LowerCase(c1.BaseName[1]);
      s:= FDictionary.AddUnique(s, 'Page'+IntToStr(FSourcePages.Count-1)+
        '.'+c1.Name, c1);
      if c1.DefaultDiff then
        THackComponent(c1).FBaseName:= c1.ClassName else
        THackComponent(c1).FBaseName:= xs.WriteComponentStr(c1);

      THackComponent(c1).FAliasName:= s;
      THackComponent(c2).FAliasName:= s;
    end;

  finally
    originals.Free;
    copies.Free;
    xs.Free;
  end;
end;

procedure TfrxPreviewPages.AddToSourcePage(Obj:TfrxComponent);
var
  NewObj:TfrxComponent;
  Page:TfrxReportPage;
  s:String;
  xs:TfrxXMLSerializer;
begin
  xs:= TfrxXMLSerializer.Create(nil);
  Page:= FSourcePages[FSourcePages.Count-1];
  NewObj:= TfrxComponent(Obj.NewInstance);
  NewObj.Create(Page);
  NewObj.Assign(Obj);
  NewObj.CreateUniqueName;

  s:= FDictionary.AddUnique(LowerCase(NewObj.BaseName[1]),
    'Page'+IntToStr(FSourcePages.Count-1)+'.'+NewObj.Name, NewObj);
  if NewObj.DefaultDiff then
    THackComponent(NewObj).FBaseName:= NewObj.ClassName else
    THackComponent(NewObj).FBaseName:= xs.WriteComponentStr(NewObj);

  THackComponent(Obj).FOriginalComponent:= NewObj;
  THackComponent(Obj).FAliasName:= s;
  THackComponent(NewObj).FAliasName:= s;
  xs.Free;
end;

procedure TfrxPreviewPages.Finish;
var
  i:Integer;
begin
  ClearPageCache;
  { avoid bug with multiple PrepareReport(False) }
  for i:= 0 to FSourcePages.Count-1 do
    THackComponent(FSourcePages[i]).FOriginalComponent:= nil;
  Report.InternalOnProgressStop(ptRunning);
end;

function TfrxPreviewPages.BandExists(Band:TfrxBand):Boolean;
var
  i:Integer;
  c:TfrxComponent;
begin
  Result:= False;
  for i:= 0 to CurXMLPage.Count-1 do
  begin
    c:= GetObject(CurXMLPage[i].Name);
    if c<>nil then
      if (THackComponent(c).FOriginalComponent = Band) or
         ((Band is TfrxPageFooter) and (c is TfrxPageFooter)) or
         ((Band is TfrxColumnFooter) and (c is TfrxColumnFooter)) then
      begin
        Result:= True;
        break;
      end;
  end;
end;

function TfrxPreviewPages.GetLastY:Extended;
var
  i:Integer;
  c:TfrxComponent;
  s:String;
  y:Extended;
begin
  Result:= 0;
  for i:= 0 to CurXMLPage.Count-1 do
  begin
    c:= GetObject(CurXMLPage[i].Name);
    if c is TfrxBand then
      if not (c is TfrxPageFooter) then
      begin
        s:= CurXMLPage[i].Prop['t'];
        if s<>'' then
          y:= frxStrToFloat(s) else
          y:= c.Top;
        s:= CurXMLPage[i].Prop['h'];
        if s<>'' then
          y:= y+frxStrToFloat(s) else
          y:= y+c.Height;
        if y > Result then
          Result:= y;
      end;
  end;
end;

procedure TfrxPreviewPages.CutObjects(APosition:Integer);
var
  xi:TfrxXMLItem;
begin
  xi:= FXMLDoc.Root.FindItem('cutted');
  while APosition < CurXMLPage.Count do
    xi.AddItem(CurXMLPage[APosition]);
end;

procedure TfrxPreviewPages.PasteObjects(X, Y:Extended);
var
  xi:TfrxXMLItem;
  LeftX, TopY, CorrX, CorrY:Extended;

  procedure CorrectX(xi:TfrxXMLItem);
  var
    X:Extended;
  begin
    if xi.Prop['l']<>'' then
      X:= frxStrToFloat(xi.Prop['l']) else
      X:= 0;
    X:= X+CorrX;
    xi.Prop['l']:= FloatToStr(X);
  end;

  procedure CorrectY(xi:TfrxXMLItem);
  var
    Y:Extended;
  begin
    if xi.Prop['t']<>'' then
      Y:= frxStrToFloat(xi.Prop['t']) else
      Y:= 0;
    Y:= Y+CorrY;
    xi.Prop['t']:= FloatToStr(Y);
  end;

begin
  xi:= FXMLDoc.Root.FindItem('cutted');

  if xi.Count > 0 then
  begin
    if xi[0].Prop['l']<>'' then
      LeftX:= frxStrToFloat(xi[0].Prop['l']) else
      LeftX:= 0;
    CorrX:= X-LeftX;

    if xi[0].Prop['t']<>'' then
      TopY:= frxStrToFloat(xi[0].Prop['t']) else
      TopY:= 0;
    CorrY:= Y-TopY;

    while xi.Count > 0 do
    begin
      CorrectX(xi[0]);
      CorrectY(xi[0]);
      CurXMLPage.AddItem(xi[0]);
    end;
  end;

  xi.Free;
end;

procedure TfrxPreviewPages.DoLoadFromStream;
var
  Compressor:TfrxCustomCompressor;
begin
  Compressor:= nil;
  if frxCompressorClass<>nil then
  begin
    FAllowPartialLoading:= False;
    Compressor:= TfrxCustomCompressor(frxCompressorClass.NewInstance);
    Compressor.Create(nil);
    Compressor.Report:= Report;
    Compressor.IsFR3File:= False;
    try
      Compressor.CreateStream;
      Compressor.Decompress(FTempStream);
      FTempStream:= Compressor.Stream;
    except
      Compressor.Free;
      Report.Errors.Add(frxResources.Get('clDecompressError'));
      if not Report.EngineOptions.SilentMode then
        frxErrorMsg(frxResources.Get('clErrors')+#13#10+Report.Errors.Text);
      Exit;
    end;
  end;
  FXMLDoc.LoadFromStream(FTempStream, FAllowPartialLoading);
  AfterLoad;
  if Compressor<>nil then
    Compressor.Free;
end;

procedure TfrxPreviewPages.DoSaveToStream;
var
  Compressor:TfrxCustomCompressor;
  StreamTo:TStream;
begin
  StreamTo:= FTempStream;
  Compressor:= nil;
  if frxCompressorClass<>nil then
  begin
    Compressor:= TfrxCustomCompressor(frxCompressorClass.NewInstance);
    Compressor.Create(nil);
    Compressor.Report:= Report;
    Compressor.IsFR3File:= False;
    Compressor.CreateStream;
    StreamTo:= Compressor.Stream;
  end;
  try
    BeforeSave;
    FXMLDoc.SaveToStream(StreamTo);
  finally
    if Compressor<>nil then
    begin
      try
        Compressor.Compress(FTempStream);
      finally
        Compressor.Free;
      end;
    end;
  end;
end;

procedure TfrxPreviewPages.LoadFromStream(Stream:TStream;
  AllowPartialLoading:Boolean = False);
begin
  Clear;
  FTempStream:= Stream;
  FAllowPartialLoading:= AllowPartialLoading;
  if Report.EngineOptions.ReportThread<>nil then
    THackThread(Report.EngineOptions.ReportThread).Synchronize(DoLoadFromStream)
  else
    DoLoadFromStream;
end;

procedure TfrxPreviewPages.SaveToStream(Stream:TStream);
begin
  FTempStream:= Stream;
  if Report.EngineOptions.ReportThread<>nil then
    THackThread(Report.EngineOptions.ReportThread).Synchronize(DoSaveToStream)
  else
    DoSaveToStream;
end;

function TfrxPreviewPages.LoadFromFile(const FileName:String;
  ExceptionIfNotFound:Boolean):Boolean;
var
  Stream:TFileStream;
begin
  Result:= FileExists(FileName);
  if Result or ExceptionIfNotFound then
  begin
    Stream:= TFileStream.Create(FileName, fmOpenRead+fmShareDenyWrite);
    try
      LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
{ Clear;
    FXMLDoc.LoadFromFile(FileName);
    AfterLoad;}
  end;
end;

procedure TfrxPreviewPages.SaveToFile(const FileName:String);
var
  Stream:TFileStream;
begin
  Stream:= TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
{ BeforeSave;
  FXMLDoc.SaveToFile(FileName);
  ClearPageCache;
  AfterLoad;}
end;

procedure TfrxPreviewPages.AfterLoad;
var
  i:Integer;
  xs:TfrxXMLSerializer;
  xi:TfrxXMLItem;
  p:TfrxReportPage;

{ store source objects' properties in the FBaseName to get it later in the GetPage }
  procedure DoProps(p:TfrxReportPage);
  var
    i:Integer;
    l:TList;
    c:THackComponent;
  begin
    l:= p.AllObjects;
    for i:= 0 to l.Count-1 do
    begin
      c:= l[i];
      c.FBaseName:= xs.WriteComponentStr(c);
    end;
  end;

{ fill FDictionary.Objects }
  procedure FillDictionary;
  var
    i:Integer;
    Name, PageName, ObjName:String;
    PageN:Integer;
  begin
    xi:= FXMLDoc.Root.FindItem('dictionary');
    FDictionary.Clear;
    for i:= 0 to xi.Count-1 do
    begin
      Name:= Copy(xi[i].Text, 7, Length(xi[i].Text)-7);
      PageName:= Copy(Name, 1, Pos('.', Name)-1);
      ObjName:= Copy(Name, Pos('.', Name)+1, 255);

      PageN:= StrToInt(Copy(PageName, 5, 255));
      FDictionary.Add(xi[i].Name, Name,
        TfrxReportPage(FSourcePages[PageN]).FindObject(ObjName));
    end;
  end;

begin
  FPagesItem:= FXMLDoc.Root.FindItem('previewpages');
  xs:= TfrxXMLSerializer.Create(nil);

{ load the report settings }
  xi:= FXMLDoc.Root.FindItem('report');
  if xi.Count > 0 then
    xs.ReadRootComponent(Report, xi[0]);

{ build sourcepages }
  try
    xi:= FXMLDoc.Root.FindItem('sourcepages');
    ClearSourcePages;

    for i:= 0 to xi.Count-1 do
    begin
      if CompareText(xi[i].Name, 'TfrxDMPPage') = 0 then
        p:= TfrxDMPPage.Create(nil) else
        p:= TfrxReportPage.Create(nil);
      xs.ReadRootComponent(p, xi[i]);
      DoProps(p);
      FSourcePages.Add(p);
    end;
    xi.Clear;

  finally
    xs.Free;
  end;

{ build the dictionary }
  FillDictionary;
end;

procedure TfrxPreviewPages.BeforeSave;
var
  i:Integer;
  xs:TfrxXMLSerializer;
  xi:TfrxXMLItem;
begin
  FPagesItem:= FXMLDoc.Root.FindItem('previewpages');
  xs:= TfrxXMLSerializer.Create(nil);

{ upload the report settings }
  xi:= FXMLDoc.Root.FindItem('report');
  xi.Clear;
  xi:= xi.Add;
  xi.Name:= Report.ClassName;
  xi.Text:= 'DotMatrixReport="'+frxValueToXML(Report.DotMatrixReport)+
    '" PreviewOptions.OutlineVisible="'+frxValueToXML(Report.PreviewOptions.OutlineVisible)+
    '" PreviewOptions.OutlineWidth="'+frxValueToXML(Report.PreviewOptions.OutlineWidth)+'"';

{ upload the sourcepages }
  try
    xi:= FXMLDoc.Root.FindItem('sourcepages');
    xi.Clear;
    for i:= 0 to FSourcePages.Count-1 do
      xs.WriteRootComponent(FSourcePages[i], True, xi.Add);

  finally
    xs.Free;
  end;

{ upload the dictionary }
  xi:= FXMLDoc.Root.FindItem('dictionary');
  xi.Clear;
  for i:= 0 to FDictionary.Names.Count-1 do
    with xi.Add do
    begin
      Name:= FDictionary.Names[i];
      Text:= 'name="'+FDictionary.GetSourceName(Name)+'"';
    end;
end;

function TfrxPreviewPages.GetObject(const Name:String):TfrxComponent;
begin
  Result:= TfrxComponent(FDictionary.GetObject(Name));
end;

function TfrxPreviewPages.GetPage(Index:Integer):TfrxReportPage;
var
  xi:TfrxXMLItem;
  xs:TfrxXMLSerializer;
  i:Integer;
  Source:TfrxReportPage;

  procedure DoObjects(Item:TfrxXMLItem; Owner:TfrxComponent);
  var
    i:Integer;
    c, c0:TfrxComponent;
  begin
    for i:= 0 to Item.Count-1 do
    begin
      c0:= GetObject(Item[i].Name);
      { object not found in the dictionary }
      if c0 = nil then
        c:= xs.ReadComponentStr(Owner, Item[i].Name+' '+Item[i].Text)
      else
      begin
        c:= xs.ReadComponentStr(Owner, THackComponent(c0).FBaseName+' '+Item[i].Text);
        c.Name:= c0.Name;
      end;
      c.Parent:= Owner;

      DoObjects(Item[i], c);
    end;
  end;

begin
  Result:= nil;
  if Count = 0 then Exit;

  { check pagecache first }
  if not Engine.Running then
  begin
    i:= FPageCache.IndexOf(IntToStr(Index));
    if i<>-1 then
    begin
      Result:= TfrxReportPage(FPageCache.Objects[i]);
      FPageCache.Exchange(i, 0);
      Exit;
    end;
  end;

  xs:= TfrxXMLSerializer.Create(nil);
  try
    { load the page item }
    xi:= FPagesItem[Index];
    FXMLDoc.LoadItem(xi);

    if CompareText(xi.Name, 'TfrxReportPage') = 0 then
    begin
      { page item do not refer to the originalpages }
      Result:= TfrxReportPage.Create(nil);
      xs.ReadRootComponent(Result, xi);
    end
    else if CompareText(xi.Name, 'TfrxDMPPage') = 0 then
    begin
      { page item do not refer to the originalpages }
      Result:= TfrxDMPPage.Create(nil);
      xs.ReadRootComponent(Result, xi);
    end
    else
    begin
      Source:= FSourcePages[StrToInt(Copy(xi.Name, 5, 5))];
      { create reportpage and assign properties from original page }
      if Source is TfrxDMPPage then
        Result:= TfrxDMPPage.Create(nil) else
        Result:= TfrxReportPage.Create(nil);
      Result.Assign(Source);

      { create objects }
      DoObjects(xi, Result);
    end;
  finally
    xs.Free;
  end;

  { update aligned objects }
  Result.AlignChildren;

  { add this page to the pagecache }
  FPageCache.InsertObject(0, IntToStr(Index), Result);
  i:= FPageCache.Count;

  { remove the least used item from the pagecache }
  if i > 50 then
  begin
    xi:= FPagesItem[StrToInt(FPageCache[i-1])];
    if Report.EngineOptions.UseFileCache and xi.Unloadable then
    begin
      FXMLDoc.UnloadItem(xi);
      xi.Clear;
    end;

    TfrxReportPage(FPageCache.Objects[i-1]).Free;
    FPageCache.Delete(i-1);
  end;
end;

function TfrxPreviewPages.GetPageSize(Index:Integer):TPoint;
var
  xi:TfrxXMLItem;
  p:TfrxReportPage;
begin
  if (Count = 0) or (Index < 0) or (Index >= Count) then
  begin
    Result:= Point(0, 0);
    Exit;
  end;

  xi:= FPagesItem[Index];
  if (CompareText(xi.Name, 'TfrxReportPage') = 0) or
    (CompareText(xi.Name, 'TfrxDMPPage') = 0) then
    p:= GetPage(Index) else
    p:= FSourcePages[StrToInt(Copy(xi.Name, 5, 256))];
  Result.X:= Round(p.Width);
  Result.Y:= Round(p.Height);
end;

procedure TfrxPreviewPages.AddEmptyPage(Index:Integer);
var
  xi:TfrxXMLItem;
begin
  if Count = 0 then Exit;

  xi:= TfrxXMLItem.Create;
  xi.Name:= FPagesItem[Index].Name;
  FPagesItem.InsertItem(Index, xi);
  ClearPageCache;
end;

procedure TfrxPreviewPages.DeletePage(Index:Integer);
begin
  if Count < 2 then Exit;

  FPagesItem[Index].Free;
  ClearPageCache;
end;

procedure TfrxPreviewPages.ModifyPage(Index:Integer; Page:TfrxReportPage);
var
  xs:TfrxXMLSerializer;
begin
  xs:= TfrxXMLSerializer.Create(nil);
  try
    FPagesItem[Index].Clear;
    xs.WriteRootComponent(Page, True, FPagesItem[Index]);
    FPagesItem[Index].Unloadable:= False;
    ClearPageCache;
  finally
    xs.Free;
  end;
end;

procedure TfrxPreviewPages.DrawPage(Index:Integer; Canvas:TCanvas;
  ScaleX, ScaleY, OffsetX, OffsetY:Extended);
var
  i:Integer;
  Page:TfrxReportPage;
  l:TList;
  c:TfrxComponent;
  IsPrinting:Boolean;
  SaveLeftMargin, SaveRightMargin:Extended;

  function ViewVisible(c:TfrxComponent):Boolean;
  var
    r:TRect;
  begin
    with c do
      r:= Rect(Round(AbsLeft * ScaleX)-20, Round(AbsTop * ScaleY)-20,
                Round((AbsLeft+Width) * ScaleX+20),
                Round((AbsTop+Height) * ScaleY+20));
    OffsetRect(r, Round(OffsetX), Round(OffsetY));
    Result:= RectVisible(Canvas.Handle, r) or (Canvas is TMetafileCanvas);
  end;

begin
  Page:= GetPage(Index);
  if Page = nil then Exit;

  SaveLeftMargin:= Page.LeftMargin;
  SaveRightMargin:= Page.RightMargin;
  if Page.MirrorMargins and (Index mod 2 = 1) then
  begin
    Page.LeftMargin:= SaveRightMargin;
    Page.RightMargin:= SaveLeftMargin;
  end;

  Page.Draw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
  OffsetX:= OffsetX+Page.LeftMargin * fr01cm * ScaleX;
  OffsetY:= OffsetY+Page.TopMargin * fr01cm * ScaleY;

  l:= Page.AllObjects;
  IsPrinting:= Canvas is TfrxPrinterCanvas;

  for i:= 0 to l.Count-1 do
  begin
    c:= l[i];
    if (c is TfrxView) and ViewVisible(c) then
      if not IsPrinting or TfrxView(c).Printable then
      begin
        c.IsPrinting:= IsPrinting;
        { needed for TOTALPAGES macro }
        if c is TfrxCustomMemoView then
          THackMemoView(c).FTotalPages:= Count;
        { draw the object }
        TfrxView(c).Draw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
        c.IsPrinting:= False;
      end;
  end;

  Page.LeftMargin:= SaveLeftMargin;
  Page.RightMargin:= SaveRightMargin;
end;

function TfrxPreviewPages.Print:Boolean;
var
  Copies:Integer;
  Collate:Boolean;
  PageNumbers:String;
  PrintPages:TfrxPrintPages;
  Reverse:Boolean;
  pgList:TStringList;

  procedure DoPrint;
  var
    i, c:Integer;
    Printer:TfrxCustomPrinter;
    PagePrinted:Boolean;
    Page:TfrxReportPage;

    function PrintPage(Index:Integer):Boolean;
    var
      Bin:Integer;
    begin
      Result:= True;
      if Index >= Count then Exit;

      if (pgList.Count<>0) and (pgList.IndexOf(IntToStr(Index+1)) =-1) then Exit;
      if ((PrintPages = ppOdd) and ((Index+1) mod 2 = 0)) or
         ((PrintPages = ppEven) and ((Index+1) mod 2 = 1)) then Exit;
      if Report.Terminated then
      begin
        Printer.Abort;
        Result:= False;
        Exit;
      end;

      Page:= GetPage(Index);

      if not PagePrinted then
        Printer.BeginDoc;
      if Index = 0 then
        Bin:= Page.Bin else
        Bin:= Page.BinOtherPages;
      Printer.SetPrintParams(Page.PaperSize, Page.PaperWidth, Page.PaperHeight,
        Page.Orientation, Bin, c, Integer(Page.Duplex)+1);

      Printer.BeginPage;
      DrawPage(Index, Printer.Canvas, Printer.DPI.X / 96, Printer.DPI.Y / 96,
       -Printer.LeftMargin * Printer.DPI.X / 25.4,
       -Printer.TopMargin * Printer.DPI.Y / 25.4);

      Report.InternalOnProgress(ptPrinting, Index+1);

{$IFDEF TRIAL}
      with Printer.Canvas do
      begin
        Font.Size:= 12;
        Font.Color:= clBlack;
        TextOut(0, 0, 'FastReport-Unregistered version');
      end;
{$ENDIF}
      Printer.EndPage;
      Application.ProcessMessages;
      PagePrinted:= True;
      ClearPageCache;
    end;

    procedure PrintPages;
    var
      i:Integer;
    begin
      if Reverse then
      begin
{$IFNDEF TRIAL}
        for i:= Count-1 downto 0 do
{$ELSE}
        for i:= 4 downto 0 do
{$ENDIF}
          if not PrintPage(i) then
            break;
      end
      else
{$IFNDEF TRIAL}
        for i:= 0 to Count-1 do
{$ELSE}
        for i:= 0 to 4 do
{$ENDIF}
          if not PrintPage(i) then
            break;
    end;

  begin
    Printer:= frxPrinters.Printer;
    Report.Terminated:= False;
    Report.InternalOnProgressStart(ptPrinting);

    if Report.ReportOptions.Name<>'' then
      Printer.Title:= Report.ReportOptions.Name else
      Printer.Title:= Report.FileName;
    if Copies <= 0 then
      Copies:= 1;
    if Collate then
      c:= 1 else
      c:= Copies;

    PagePrinted:= False;
    if Collate then
      for i:= 0 to Copies-1 do
      begin
        PrintPages;
        if Report.Terminated then break;
      end
    else
      PrintPages;

    if PagePrinted then
      Printer.EndDoc;
    Report.InternalOnProgressStop(ptPrinting);
  end;

begin
  Result:= True;

  if Report.DotMatrixReport and (frxDotMatrixExport<>nil) then
  begin
    Report.SelectPrinter;
    frxDotMatrixExport.ShowDialog:= Report.PrintOptions.ShowDialog;
    Result:= Export(frxDotMatrixExport);
    Exit;
  end;

  Copies:= Report.PrintOptions.Copies;
  Collate:= Report.PrintOptions.Collate;
  PageNumbers:= Report.PrintOptions.PageNumbers;
  PrintPages:= Report.PrintOptions.PrintPages;
  Reverse:= Report.PrintOptions.Reverse;
  Report.SelectPrinter;

  if Report.PrintOptions.ShowDialog then
    with TfrxPrintDialog.Create(Application) do
    begin
      UpDown1.Position:= Copies;
      CollateCB.Checked:= Collate;
      PageNumbersE.Text:= PageNumbers;
      PrintPagesCB.ItemIndex:= Integer(PrintPages);
      ReverseCB.Checked:= Reverse;

      ShowModal;
      if ModalResult = mrOk then
      begin
        Copies:= StrToInt(CopiesE.Text);
        Collate:= CollateCB.Checked;
        if AllRB.Checked then
          PageNumbers:= ''
        else if CurPageRB.Checked then
          PageNumbers:= IntToStr(CurPreviewPage) else
          PageNumbers:= PageNumbersE.Text;
        PrintPages:= TfrxPrintPages(PrintPagesCB.ItemIndex);
        Reverse:= ReverseCB.Checked;
        Free;
      end
      else
      begin
        Free;
        Result:= False;
        Exit;
      end;
    end;

  if Assigned(Report.OnPrintReport) then
    Report.OnPrintReport(Report);

  if Report.Preview<>nil then
    Report.Preview.Lock;
  pgList:= TStringList.Create;
  try
    frxParsePageNumbers(PageNumbers, pgList, Count);
    DoPrint;
  finally
    if Assigned(Report.OnAfterPrintReport) then
      Report.OnAfterPrintReport(Report);
    pgList.Free;
  end;
end;

function TfrxPreviewPages.Export(Filter:TfrxCustomExportFilter):Boolean;
var
  pgList:TStringList;
  tempBMP:TBitmap;

  procedure ExportPage(Index:Integer);
  var
    i:Integer;
    Page:TfrxReportPage;
    l:TList;
    c:TfrxComponent;
    p:TfrxPictureView;
  begin
    if Index >= Count then Exit;
    if (pgList.Count<>0) and (pgList.IndexOf(IntToStr(Index+1)) =-1) then Exit;
    Page:= GetPage(Index);
    if Page = nil then Exit;

    Report.InternalOnProgress(ptExporting, Index+1);

    Filter.StartPage(Page, Index);
    try
      { set the offset of the page objects }
      if Page.MirrorMargins and (Index mod 2 = 1) then
        Page.Left:= Page.RightMargin * fr01cm else
        Page.Left:= Page.LeftMargin * fr01cm;
      Page.Top:= Page.TopMargin * fr01cm;

      { export the page background picture and frame }
      p:= TfrxPictureView.Create(nil);
      p.Name:= '_pagebackground';
      p.Color:= Page.Color;
      p.Frame.Assign(Page.Frame);
      p.Picture.Assign(Page.BackPicture);
      p.Stretched:= True;
      p.KeepAspectRatio:= False;
      try
        p.SetBounds(Page.Left, Page.Top,
          Page.Width-(Page.LeftMargin+Page.RightMargin) * fr01cm,
          Page.Height-(Page.TopMargin+Page.BottomMargin) * fr01cm);
        Filter.ExportObject(p);
      finally
        p.Free;
      end;

      { enum objects }
      l:= Page.AllObjects;
      { prepare text objects }
      for i:= 0 to l.Count-1 do
      begin
        c:= l[i];
        if c is TfrxCustomMemoView then
        begin
          { set up font if Highlight is active }
          if TfrxCustomMemoView(c).Highlight.Active then
            TfrxCustomMemoView(c).Font.Assign(TfrxCustomMemoView(c).Highlight.Font);
          { needed for TOTALPAGES macro }
          THackMemoView(c).FTotalPages:= Count;
          THackMemoView(c).ExtractTotalPages;
          { needed if memo has AutoWidth and Align properties }
          if THackMemoView(c).AutoWidth then
            THackMemoView(c).Draw(tempBMP.Canvas, 1, 1, 0, 0);
        end;
      end;

      { export objects }
      for i:= 0 to l.Count-1 do
      begin
        c:= l[i];
        Filter.ExportObject(c);
      end;

    finally
      Filter.FinishPage(Page, Index);
    end;

    if Report.Preview = nil then
      ClearPageCache
    else
    begin
      Page.Left:= 0;
      Page.Top:= 0;
    end;
  end;

  procedure DoExport;
  var
    i:Integer;
  begin
    if Filter.Start then
      try
        if Report.Preview<>nil then
        begin
          Report.Preview.Refresh;
          Report.Preview.Lock;
        end;

        Report.InternalOnProgressStart(ptExporting);

{$IFNDEF TRIAL}
        for i:= 0 to Count-1 do
{$ELSE}
        for i:= 0 to 4 do
{$ENDIF}
        begin
          ExportPage(i);
          if Report.Terminated then break;
          Application.ProcessMessages;
        end;

      finally
        if Report.Preview<>nil then
        begin
          TfrxPreview(Report.Preview).HideMessage;
          Report.Preview.Refresh;
        end;

        Report.InternalOnProgressStop(ptExporting);
        Filter.Finish;
      end;
  end;

begin
  Result:= False;
  if Filter = nil then Exit;

  Filter.Report:= Report;
  if (Filter.ShowDialog and (Filter.ShowModal<>mrOk)) then
    Exit;
  if Filter.CurPage then
    if Report.Preview<>nil then
      Filter.PageNumbers:= IntToStr(CurPreviewPage) else
      Filter.PageNumbers:= '1';

  Result:= True;
  Report.Terminated:= False;

  pgList:= TStringList.Create;
  tempBMP:= TBitmap.Create;
  frxParsePageNumbers(Filter.PageNumbers, pgList, Count);
  try
    DoExport;
  except
    on e:Exception do
    begin
      Result:= False;
      Report.Errors.Text:= e.Message;
      if not Report.EngineOptions.SilentMode then
        frxErrorMsg(frxResources.Get('clErrors')+#13#10+Report.Errors.Text);
    end;
  end;

  pgList.Free;
  tempBMP.Free;
end;

procedure TfrxPreviewPages.ObjectOver(Index:Integer; X, Y:Integer;
  Button:TMouseButton; Shift:TShiftState; Scale, OffsetX, OffsetY:Extended;
  Click:Boolean; var Cursor:TCursor);
var
  Page:TfrxReportPage;
  c:TfrxComponent;
  l:TList;
  i:Integer;
  Flag:Boolean;
  v:TfrxView;

  function MouseInView(c:TfrxComponent):Boolean;
  var
    r:TRect;
  begin
    with c do
      r:= Rect(Round(AbsLeft * Scale), Round(AbsTop * Scale),
                Round((AbsLeft+Width) * Scale),
                Round((AbsTop+Height) * Scale));
    OffsetRect(r, Round(OffsetX), Round(OffsetY));
    Result:= PtInRect(r, Point(X, Y));
  end;

  procedure SetToAnchor(const Text:String);
  var
    Item:TfrxXMLItem;
    PageN, Top:Integer;
  begin
    Item:= FindAnchor(Text);
    if Item<>nil then
    begin
      PageN:= StrToInt(Item.Prop['page']);
      Top:= StrToInt(Item.Prop['top']);
      TfrxPreview(Report.Preview).SetPosition(PageN+1, Top);
    end;
  end;

begin
  if (Index < 0) or (Index >= Count) or Engine.Running then Exit;
  Page:= GetPage(Index);
  if Page = nil then Exit;

  if Page.MirrorMargins and (Index mod 2 = 1) then
    OffsetX:= OffsetX+Page.RightMargin * fr01cm * Scale else
    OffsetX:= OffsetX+Page.LeftMargin * fr01cm * Scale;
  OffsetY:= OffsetY+Page.TopMargin * fr01cm * Scale;

  Report.SetProgressMessage('');
  Page:= GetPage(Index); // get page again to ensure it was not cleared during export
  l:= Page.AllObjects;

  for i:= l.Count-1 downto 0 do
  begin
    c:= l[i];
    if (c is TfrxView) and MouseInView(c) then
    begin
      v:= TfrxView(c);
      if v.Cursor<>crDefault then
        Cursor:= v.Cursor;
      if v.URL<>'' then
      begin
        Report.SetProgressMessage(v.URL);
        if v.Cursor = crDefault then
          Cursor:= crHandPoint;
      end;

      if Click then
      begin
        if v.URL<>'' then
          if Pos('@', v.URL) = 1 then
            TfrxPreview(Report.Preview).PageNo:= StrToInt(Copy(v.URL, 2, 255))
          else if Pos('#', v.URL) = 1 then
            SetToAnchor(Copy(v.URL, 2, 255))
          else
            ShellExecute(GetDesktopWindow, nil, PChar(v.URL), nil, nil, sw_ShowNormal);

        Flag:= False;
        Report.DoPreviewClick(v, Button, Shift, Flag);
        if Flag then
        begin
          ModifyPage(Index, Page);
          Report.Preview.Invalidate;
        end;
      end
      else if Assigned(Report.OnMouseOverObject) then
        Report.OnMouseOverObject(v);
      break;
    end;
  end;
end;

end.
