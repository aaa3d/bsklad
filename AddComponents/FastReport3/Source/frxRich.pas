{******************************************}
{ }
{ FastReport v3.0 }
{ RichEdit Add-In Object }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxRich;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Menus, frxClass,
  RichEdit, frxRichEdit, frxPrinter
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxRichObject = class(TComponent) // fake component
  end;

  TfrxRichView = class(TfrxStretcheable)
  private
    FAllowExpressions:Boolean;
    FExpressionDelimiters:String;
    FFlowTo:TfrxRichView;
    FGapX:Extended;
    FGapY:Extended;
    FRichEdit:TrxRichEdit;
    FTempStream:TMemoryStream;
    FTempStream1:TMemoryStream;
    FUseMetafile:Boolean;
    function CreateMetafile:TMetafile;
    function IsExprDelimitersStored:Boolean;
    procedure DrawRich;
    procedure ReadData(Stream:TStream);
    procedure WriteData(Stream:TStream);
  protected
    procedure DefineProperties(Filer:TFiler); override;
    procedure Notification(AComponent:TComponent; Operation:TOperation); override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure AfterPrint; override;
    procedure BeforePrint; override;
    procedure GetData; override;
    procedure InitPart; override;
    function CalcHeight:Extended; override;
    function DrawPart:Extended; override;
    class function GetDescription:String; override;
    function GetComponentText:String; override;
    property RichEdit:TrxRichEdit read FRichEdit;
  published
    property AllowExpressions:Boolean read FAllowExpressions
      write FAllowExpressions default True;
    property BrushStyle;
    property Color;
    property DataField;
    property DataSet;
    property DataSetName;
    property ExpressionDelimiters:String read FExpressionDelimiters
      write FExpressionDelimiters stored IsExprDelimitersStored;
    property FlowTo:TfrxRichView read FFlowTo write FFlowTo;
    property Frame;
    property GapX:Extended read FGapX write FGapX;
    property GapY:Extended read FGapY write FGapY;
    property UseMetafile:Boolean read FUseMetafile write FUseMetafile default False;
  end;

procedure frxAssignRich(RichFrom, RichTo:TrxRichEdit);

implementation

uses
  frxRichRTTI,
{$IFNDEF NO_EDITORS}
  frxRichEditor,
{$ENDIF}
  frxUtils, frxDsgnIntf, frxRes;

procedure frxAssignRich(RichFrom, RichTo:TrxRichEdit);
var
  st:TMemoryStream;
begin
  st:= TMemoryStream.Create;
  try
    RichFrom.Lines.SaveToStream(st);
    st.Position:= 0;
    RichTo.Lines.LoadFromStream(st);
  finally
    st.Free;
  end;
end;

{ TfrxRichView }

constructor TfrxRichView.Create(AOwner:TComponent);
begin
  inherited;
  FRichEdit:= TrxRichEdit.Create(nil);
  FRichEdit.Parent:= frxParentForm;
  FRichEdit.AutoURLDetect:= False;
  FTempStream:= TMemoryStream.Create;
  FTempStream1:= TMemoryStream.Create;

  FAllowExpressions:= True;
  FExpressionDelimiters:= '[,]';
  FGapX:= 2;
  FGapY:= 1;
end;

destructor TfrxRichView.Destroy;
begin
  FRichEdit.Free;
  FTempStream.Free;
  FTempStream1.Free;
  inherited;
end;

class function TfrxRichView.GetDescription:String;
begin
  Result:= frxResources.Get('obRich');
end;

function TfrxRichView.IsExprDelimitersStored:Boolean;
begin
  Result:= FExpressionDelimiters<>'[,]';
end;

procedure TfrxRichView.DefineProperties(Filer:TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('RichEdit', ReadData, WriteData, True);
end;

procedure TfrxRichView.ReadData(Stream:TStream);
begin
  FRichEdit.Lines.LoadFromStream(Stream);
end;

procedure TfrxRichView.WriteData(Stream:TStream);
begin
  FRichEdit.Lines.SaveToStream(Stream);
end;

procedure TfrxRichView.Notification(AComponent:TComponent; Operation:TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFlowTo) then
    FFlowTo:= nil;
end;

function TfrxRichView.CreateMetafile:TMetafile;
var
  Range:TFormatRange;
  LogX, LogY:Integer;
  EMFCanvas:TMetafileCanvas;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);

  with Range do
  begin
    LogX:= 96;
    LogY:= 96;
    rc:= Rect(Round(GapX * 1440 / LogX), Round(GapY * 1440 / LogY),
      Round((Width-GapX) * 1440 / LogX),
      Round((Height-GapY) * 1440 / LogY));
    rcPage:= rc;

    Result:= TMetafile.Create;
    Result.Width:= Round(Width);
    Result.Height:= Round(Height);

    EMFCanvas:= TMetafileCanvas.Create(Result, 0);
    hdc:= EMFCanvas.Handle;
    hdcTarget:= hdc;
    if Color = clTransparent then
      FRichEdit.Color:= clWhite else
      FRichEdit.Color:= Color;

    chrg.cpMin:= 0;
    chrg.cpMax:=-1;
    FRichEdit.Perform(EM_FORMATRANGE, 1, Integer(@Range));
  end;

  FRichEdit.Perform(EM_FORMATRANGE, 0, 0);
  EMFCanvas.Free;
end;

procedure TfrxRichView.DrawRich;
var
  Range:TFormatRange;
  LogX, LogY, mm:Integer;
  EMFCanvas:TMetafileCanvas;
  EMF:TMetafile;
begin
  EMF:= nil;
  EMFCanvas:= nil;
  FillChar(Range, SizeOf(TFormatRange), 0);

  if Color = clTransparent then
    FRichEdit.Color:= clWhite else
    FRichEdit.Color:= Color;

  with Range do
  begin
    if IsPrinting then
    begin
      hdc:= FCanvas.Handle;
      LogX:= GetDeviceCaps(hdc, LOGPIXELSX);
      LogY:= GetDeviceCaps(hdc, LOGPIXELSY);
      rc:= Rect(Round((FX+GapX * FScaleX) * 1440 / LogX),
        Round((FY+GapY * FScaleY) * 1440 / LogY),
        Round((FX1-GapX * FScaleX) * 1440 / LogX),
        Round((FY1-GapY * FScaleY) * 1440 / LogY));
    end
    else
    begin
      LogX:= 96;
      LogY:= 96;
      EMF:= TMetafile.Create;
      EMF.Width:= Round(Width);
      EMF.Height:= Round(Height);
      EMFCanvas:= TMetafileCanvas.Create(EMF, 0);
      hdc:= EMFCanvas.Handle;
      rc:= Rect(Round(GapX * 1440 / LogX), Round(GapY * 1440 / LogY),
        Round((Width-GapX) * 1440 / LogX),
        Round((Height-GapY) * 1440 / LogY));
    end;

    rcPage:= rc;
    hdcTarget:= hdc;

    chrg.cpMin:= 0;
    chrg.cpMax:=-1;
    mm:= SetMapMode(hdc, MM_TEXT);
    FRichEdit.Perform(EM_FORMATRANGE, 1, Integer(@Range));
    SetMapMode(hdc, mm);
    FCanvas.Refresh;
  end;

  FRichEdit.Perform(EM_FORMATRANGE, 0, 0);

  if not IsPrinting then
  begin
    EMFCanvas.Free;
    FCanvas.StretchDraw(Rect(FX, FY, FX1, FY1), EMF);
    EMF.Free;
  end;
end;

procedure TfrxRichView.Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY:Extended);
var
  EMF:TMetafile;
begin
  BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
  DrawBackground;

  if FUseMetafile then
  begin
    EMF:= CreateMetafile;
    Canvas.StretchDraw(Rect(FX, FY, FX1, FY1), EMF);
    EMF.Free;
  end
  else
    DrawRich;

  DrawFrame;
end;

procedure TfrxRichView.BeforePrint;
begin
  inherited;
  FTempStream.Position:= 0;
  FRichEdit.Lines.SaveToStream(FTempStream);
end;

procedure TfrxRichView.AfterPrint;
begin
  FTempStream.Position:= 0;
  FRichEdit.Lines.LoadFromStream(FTempStream);
  inherited;
end;

procedure TfrxRichView.GetData;
var
  ms:TMemoryStream;
  i, j:Integer;
  s1, s2, dc1, dc2:String;

  function GetSpecial(const s:String; Pos:Integer):Integer;
  var
    i:Integer;
  begin
    Result:= 0;
    for i:= 1 to Pos do
      if s[i] in [#10, #13] then
        Inc(Result);
  end;

begin
  inherited;
  if IsDataField then
  begin
    ms:= TMemoryStream.Create;
    try
      DataSet.AssignBlobTo(DataField, ms);
      FRichEdit.Lines.LoadFromStream(ms);
    finally
      ms.Free;
    end;
  end
  else if FAllowExpressions then
  begin
    dc1:= FExpressionDelimiters;
    dc2:= Copy(dc1, Pos(',', dc1)+1, 255);
    dc1:= Copy(dc1, 1, Pos(',', dc1)-1);

    with FRichEdit do
    try
      Lines.BeginUpdate;

      i:= Pos(dc1, Text);
      while i > 0 do
      begin
        SelStart:= i-1-GetSpecial(Text, i) div 2;
        s1:= frxGetBrackedVariable(Text, dc1, dc2, i, j);
        s2:= VarToStr(Report.Calc(s1));

        SelLength:= j-i+1;
        SelText:= s2;
        SelAttributes.Charset:= frxCharset;
        i:= Pos(dc1, Text);
      end;
    finally
      Lines.EndUpdate;
    end;
  end;

  if FFlowTo<>nil then
  begin
    InitPart;
    DrawPart;
    FTempStream1.Position:= 0;
    FlowTo.RichEdit.Lines.LoadFromStream(FTempStream1);
    FFlowTo.AllowExpressions:= False;
  end;
end;

function TfrxRichView.CalcHeight:Extended;
var
  Range:TFormatRange;
  LogX, LogY:Integer;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);
  with Range do
  begin
    LogX:= 96;
    LogY:= 96;
    rc:= Rect(0, 0, Round((Width-GapX * 2) * 1440 / LogX), Round(1000000 * 1440.0 / LogY));
    rcPage:= rc;
    hdc:= GetDC(0);
    hdcTarget:= hdc;

    chrg.cpMin:= 0;
    chrg.cpMax:=-1;
    FRichEdit.Perform(EM_FORMATRANGE, 0, Integer(@Range));
    ReleaseDC(0, hdc);
    if RichEdit.GetTextLen = 0 then
      Result:= 0
    else
      Result:= Round(rc.Bottom / (1440.0 / LogY))+2 * GapY+2;
  end;

  FRichEdit.Perform(EM_FORMATRANGE, 0, 0);
end;

function TfrxRichView.DrawPart:Extended;
var
  Range:TFormatRange;
  LogX, LogY, LastChar:Integer;
begin
  { get remained part of text }
  FTempStream1.Position:= 0;
  FRichEdit.Lines.LoadFromStream(FTempStream1);

  { calculate the last visible char }
  FillChar(Range, SizeOf(TFormatRange), 0);
  with Range do
  begin
    LogX:= 96;
    LogY:= 96;
    rc:= Rect(0, 0, Round((Width-GapX * 2) * 1440 / LogX),
      Round((Height-GapY * 2) * 1440 / LogY));
    rcPage:= rc;
    hdc:= GetDC(0);
    hdcTarget:= hdc;

    chrg.cpMin:= 0;
    chrg.cpMax:=-1;
    LastChar:= FRichEdit.Perform(EM_FORMATRANGE, 0, Integer(@Range));
    ReleaseDC(0, hdc);
    Result:= Round((rcPage.Bottom-rc.Bottom) / (1440.0 / LogY))+2 * GapY;
  end;
  FRichEdit.Perform(EM_FORMATRANGE, 0, 0);

  { text can't fit }
  if Result < 0 then
  begin
    Result:= Height;
    Exit;
  end;

  { copy the outbounds text to the temp stream }
  try
    FRichEdit.SelStart:= LastChar;
    FRichEdit.SelLength:= FRichEdit.GetTextLen-LastChar+1;
    FTempStream1.Clear;
    FRichEdit.StreamMode:= [smSelection];
    FRichEdit.Lines.SaveToStream(FTempStream1);
    FRichEdit.SelText:= '';
  finally
    FRichEdit.StreamMode:= [];
  end;
end;

procedure TfrxRichView.InitPart;
begin
  FTempStream1.Clear;
  FRichEdit.Lines.SaveToStream(FTempStream1);
end;

function TfrxRichView.GetComponentText:String;
begin
  FTempStream.Clear;
  FRichEdit.Lines.SaveToStream(FTempStream);
  SetLength(Result, FTempStream.Size);
  FTempStream.Position:= 0;
  FTempStream.Read(Result[1], FTempStream.Size);
end;

initialization
  frxObjects.RegisterObject1(TfrxRichView, nil, '', 'Other', 0, 26);

end.
