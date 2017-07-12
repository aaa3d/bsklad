{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppMemo;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Graphics, Menus, Forms, Controls,
  ppClass, ppDB, ppDevice, ppStrtch, ppTypes, ppPrintr,
  ppUtils, ppPrnabl, ppDrwCmd, ppComm, ppDsgnCt, ppRTTI;

type


  { TppCustomMemo }
  TppCustomMemo = class(TppStretchable)
    private
      FAncestor: TppCustomMemo;
      FCharPos: Longint;
      FCharWrap: Boolean;
      FGetTabStopPositions: TStrings;
      FLeading: Longint;
      FLines: TStrings;
      FMemoStream: TMemoryStream;
      FPrintLines: TStrings;
      FTabStopPositions: TStrings;

      {read/write private 'fake' properties}
      procedure ReadLeading(Reader: TReader);
      procedure WriteLeading(Writer: TWriter);

      function  GetLeading: Single;
      function  GetScreenPixelLeading: Integer;
      function  GetTabStopPositions: TStrings;
      procedure SetCharWrap(Value: Boolean);
      procedure SetLeading(Value: Single);
      procedure SetTabStopPositions(Value: TStrings);

      {used for conversion to 3.0}
      procedure ReadPosition(Reader: TReader);

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure DefineProperties(Filer: TFiler); override;
      procedure FontChanged(Sender: TObject); override;
      function  GetLines: TStrings;
      function  GetMemo: TStrings; virtual;
      function  GetMemoStream: TMemoryStream; virtual;
      function  GetPrintLines: TStrings; virtual;
      procedure LoadMemo; virtual;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetMemo(Value: TStrings); virtual;
      procedure WriteState(Writer: TWriter); override;


    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure CalcSpaceUsed; override;
      function  GetText: String; override;
      procedure SetText(Value: String); override;
      function  GetTextBuf: PChar; virtual;
      procedure Init; override;
      procedure LinesChanged;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      procedure Convert(aVersionNo: Integer); override;

      property Alignment;
      property CharPos: Integer read FCharPos;
      property CharWrap: Boolean read FCharWrap write SetCharWrap;
      property Color;
      property Font;
      property Leading: Single read GetLeading write SetLeading stored False;
      property Lines: TStrings read GetMemo write SetMemo;
      property MemoStream: TMemoryStream read GetMemoStream;
      property mmLeading: Longint read FLeading;
      property PrintLines: TStrings read GetPrintLines;
      property spLeading: Integer read GetScreenPixelLeading;
      property TabStopPositions: TStrings read GetTabStopPositions write SetTabStopPositions;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property Text;
      property Transparent;
      property UserName;
      property Visible;

  end; {class, TppCustomMemo}


{******************************************************************************
 *
 ** C U S T O M    M E M O   C L A S S E S
 *
{******************************************************************************}

  { TppMemo }
  TppMemo = class(TppCustomMemo)
    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure LinesMenuClick(Sender: TObject);
      procedure SetMemo(Value: TStrings); override;

    public
      constructor Create(AOwner: TComponent); override;

      procedure InstantiateDesignControl; override;
      procedure PopupMenuClick(Sender: TObject); override;

    published
      property Alignment;
      property Caption;
      property CharWrap;
      property Color;
      property Font;
      property Leading;
      property Lines;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property TabStopPositions;
      property Transparent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property BottomOffset stored False;
      property Height stored False;
      property Left stored False;
      property OverFlowOffset stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppMemo}


  { TppDBMemo }
  TppDBMemo = class(TppCustomMemo)
    private
      FAutoDisplay: Boolean;
      FOnGetMemo: TppMemoEvent;

    protected
      procedure SetDataField(const Value: String); override;

   public
      constructor Create(AOwner: TComponent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  IsDataAware: Boolean; override;
      procedure LoadMemo; override;

    published
      property Alignment;
      property AutoDisplay: Boolean read FAutoDisplay write FAutoDisplay default True;
      property CharWrap;
      property Color;
      property DataField;
      property DataPipeline;
      property Font;
      property Leading;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnGetMemo: TppMemoEvent read FOnGetMemo write FOnGetMemo;
      property ParentDataPipeline;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property TabStopPositions;
      property Transparent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property BottomOffset stored False;
      property Height stored False;
      property Left stored False;
      property OverFlowOffset stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppDBMemo}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomMemoRTTI }
  TraTppCustomMemoRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomMemoRTTI}

  { TraTppDBMemoRTTI }
  TraTppDBMemoRTTI = class(TraTppCustomMemoRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBMemoRTTI}

  
implementation

uses  ppForms, ppRegion;



{******************************************************************************
 *
 ** C U S T O M M E M O
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomMemo.Create }

constructor TppCustomMemo.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {init inherited properties}
  CacheRecordSize := SizeOf(TppCustomMemoSaveRec);
  DrawCommandClass := TppDrawText;

  FAncestor := nil;
  FCharPos           := 0;
  FCharWrap          := False;
  FLeading           := 0;
  FLines             := TStringList.Create;
  FMemoStream        := TMemoryStream.Create;
  FPrintLines        := TStringList.Create;
  FTabStopPositions  := TStringList.Create;
  FGetTabStopPositions := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomMemo.Destroy }

destructor TppCustomMemo.Destroy;
begin

  FLines.Free;
  FMemoStream.Free;
  FPrintLines.Free;
  FTabStopPositions.Free;
  FGetTabStopPositions.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomMemo.Convert }

procedure TppCustomMemo.Convert(aVersionNo: Integer);
begin

  inherited Convert(aVersionNo);

  if (aVersionNo < 3000) then
    FLeading := ppToMMThousandths(FLeading, utScreenPixels, pprtHorizontal, nil);

end; {procedure, ConvertComponent}


{------------------------------------------------------------------------------}
{ TppCustomMemo.LinesChanged }

procedure TppCustomMemo.LinesChanged;
begin

  InvalidateDesignControl;

end; {procedure, LinesChanged}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetPrintLines }

function TppCustomMemo.GetPrintLines: TStrings;
begin

  Result := FPrintLines;

end; {function, GetPrintLines

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetTextBuf }

function TppCustomMemo.GetTextBuf: PChar;
begin

  GetMemoStream;

  if FMemoStream.Size = 0 then
    Result := nil

  else
    begin
      FMemoStream.Position := 0;

      Result := StrAlloc(FMemoStream.Size + 1);

      FMemoStream.Read(Result^, FMemoStream.Size);

      Result[FMemoStream.Size] := #0;
    end;

end; {function, GetTextBuf}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetLines }

function TppCustomMemo.GetLines: TStrings;
begin
  {enable descendants to get access to FLines }
  Result := FLines;
end; {function, GetLines}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetMemoStream }

function TppCustomMemo.GetMemoStream: TMemoryStream;
begin
  LoadMemo;
  Result := FMemoStream;
end; {function, GetMemoStream}

{------------------------------------------------------------------------------}
{ TppCustomMemo.LoadMemo }

procedure TppCustomMemo.LoadMemo;
begin

  {descendants can override this routine,
   call GetLines to access FLines, then call inherited to
   load FLines to FMemoStream}
  FMemoStream.Clear;

  ppStringsToStream(FLines, FMemoStream);
  LinesChanged;

end; {function, LoadMemo}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetMemo }

function TppCustomMemo.GetMemo: TStrings;
begin
  LoadMemo;
  Result := FLines;
end; {function, GetMemo}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetText }

function TppCustomMemo.GetText: String;
begin
  Result := GetMemo.Text;

end; {function, GetText}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SetText }

procedure TppCustomMemo.SetText(Value: String);
begin

  FLines.Text := Value;
  LoadMemo;

end; {function, SetText}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SetMemo }

procedure TppCustomMemo.SetMemo(Value: TStrings);
begin

 FLines.Assign(Value);

 LoadMemo;

end; {procedure, SetMemo}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetTabStopPositions }

function TppCustomMemo.GetTabStopPositions: TStrings;
var
  lPrinter: TObject;
begin

  Result := FTabStopPositions;

  if (csLoading in ComponentState) then Exit;

  {note: when writing return FTabStopPositions, unless we have an ancestor who's
  tab stop position values are equivalent, then return FGetTabStopPositions
  to properly support form inheritance }
  if (csWriting in ComponentState) then
    if ((FAncestor = nil) or
          not FTabStopPositions.Equals(FAncestor.FTabStopPositions)) then Exit;


  FGetTabStopPositions.Assign(FTabStopPositions);

  if (Band <> nil) and (Band.Report <> nil) then
    lPrinter := Band.Report.Printer
  else
    lPrinter := nil;

  ppStringsFromMMThousandths(FGetTabStopPositions, Units, pprtHorizontal, lPrinter);

  Result := FGetTabStopPositions;

end; {procedure, GetTabStopPositions}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SetTabStopPositions }

procedure TppCustomMemo.SetTabStopPositions(Value: TStrings);
var
  lPrinter: TObject;
begin

  FTabStopPositions.Assign(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;


  {set the value}
  if (Band <> nil) and (Band.Report <> nil) then
    lPrinter := Band.Report.Printer
  else
    lPrinter := nil;

  ppStringsToMMThousandths(FTabStopPositions, Units, pprtHorizontal, lPrinter);


  {repaint design control}
  InvalidateDesignControl;

  {notify report engine}
  Reset;

end; {procedure, SetTabStopPositions}


{------------------------------------------------------------------------------}
{ TppCustomMemo.PaintDesignControl }

procedure TppCustomMemo.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lRect: TRect;
  lsLine: String;
  liLine: Integer;
  liLines: Integer;
  liLineSpaceUsed: Integer;
  liLineHeight: Integer;
  liLeading: Integer;
  lLineBuf: PChar;
  lTextMetric: TTextMetric;
  liTabStopCount : Integer;
  lTabStopArray : TppTabStopPos;
  liLeft: Integer;
  liTop: Integer;
  lDrawLines: TStrings;
  lSaveColor: TColor;
  lTextBuf: PChar;
  lmmRect: TppRect;
  liWidth: Integer;
  liTextWidth: Integer;
  liRowOffset: Integer;
  llCharPos: Longint;

  function FitLinesToHeight(aLines: TStrings; aLineHeight: Integer; aHeight: Integer): Integer;
    var
      liMaxLines: Integer;
    begin
      liMaxLines := Trunc(aHeight/aLineHeight);

      if (aLines.Count > liMaxLines) then
        Result := Round(((aLines.Count * liLineHeight) - aHeight) / aLines.Count)
      else
        Result := 0;

    end; {procedure, FitLinesToHeight}

begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  lClientRect := spClientRect;

  lDrawLines := TStringList.Create;


  {fill rectangle with background color, do this after calcrect has been calculated}
  if not(Transparent) then
    begin
      aCanvas.Brush.Color := Color;
      aCanvas.Brush.Style := bsSolid;
      aCanvas.FillRect(lClientRect);
    end;

  aCanvas.Brush.Style := bsClear;
  aCanvas.Font := Font;


  {draw text}
  if (FMemoStream.Size = 0) then
    aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, Caption)

  else
    begin

      {get the text}
      lTextBuf := StrAlloc(FMemoStream.Size + 1);
      FMemoStream.Position := 0;
      FMemoStream.Read(lTextBuf^, FMemoStream.Size);
      lTextBuf[FMemoStream.Size] := #0;

      {word wrap the text}
      lmmRect.Left := mmLeft;
      lmmRect.Top := mmTop;
      lmmRect.Right := mmLeft + mmWidth;
      lmmRect.Bottom := mmTop + mmHeight;

      llCharPos := 0;

      ppWordWrap(lTextBuf, lmmRect, Font, FLeading, True, lDrawLines, FTabStopPositions, Units,
                 True, Band.Report.Printer, llCharPos, FCharWrap);

      StrDispose(lTextBuf);

      liTabStopCount := TabStopPositions.Count;

      {convert memo tab stop positions to screen units, if needed }
      if (TabStopPositions.Count > 0) then
        ppConvertTabStopPos(utScreenPixels, TabStopPositions, lTabStopArray, liTabStopCount, nil);


      GetTextMetrics(aCanvas.Handle, lTextMetric);

      {use default leading for this font}
      liLeading := Trunc(ppFromMMThousandths(FLeading, utScreenPixels, pprtVertical, nil));

      liLineHeight := lTextMetric.tmHeight + liLeading;

      liRowOffset := FitLinesToHeight(lDrawLines, liLineHeight, spHeight);

      liWidth := spWidth;
      liLineSpaceUsed := 0;
      liLines := lDrawLines.Count - 1;

      for liLine := 0 to liLines do
        begin
          lsLine := lDrawLines[liLine];

          {calculate width of text}
          liTextWidth := aCanvas.TextWidth(lsLine);

          {reset rectangle to original value}
          lRect := lClientRect;

          lRect.Top := lRect.Top + liLineSpaceUsed;

          {justify text}
          if Alignment = taLeftJustify then
            liLeft := lRect.Left

          else if Alignment = taRightJustify then
            liLeft := lRect.Right - liTextWidth

          else if Alignment = taCenter then
            liLeft := lRect.Left + Round((liWidth - liTextWidth) / 2)

          else
            liLeft := 0;

          liTop := lRect.Top;

          if not(ppLineTooLong(lsLine, mmWidth, aCanvas, liTabStopCount, lTabStopArray)) then
            begin
              lLineBuf := StrAlloc(Length(lsLine) + 1);
              StrPCopy(lLineBuf, lsLine);
              TabbedTextOut(aCanvas.Handle, liLeft, liTop, lLineBuf, StrLen(lLineBuf), liTabStopCount, lTabStopArray, liLeft);
              StrDispose(lLineBuf);
            end

          else
            aCanvas.TextRect(lRect, liLeft, liTop, lsLine);

          {goto next line}
          Inc(liLineSpaceUsed, liLineHeight - liRowOffset);

        end; {for, each line of text}


    end;

  lDrawLines.Free;


  {draw a framerect}
  lSaveColor := aCanvas.Brush.Color;
  aCanvas.Brush.Style := bsSolid;
  aCanvas.Brush.Color := clBlack;
  aCanvas.FrameRect(lClientRect);
  aCanvas.Brush.Color := lSaveColor;

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppCustomMemo.FontChanged }

procedure TppCustomMemo.FontChanged(Sender: TObject);
begin
  inherited FontChanged(Sender);

  {notify report engine}
  if Stretch then
    Reset;

end; {procedure, FontChanged}

{------------------------------------------------------------------------------}
{ TppCustomMemo.RestoreFromCache }

procedure TppCustomMemo.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCustomMemoSaveRec;

begin
  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

  FCharPos := lRec.FCharPos;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SaveToCache }

procedure TppCustomMemo.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCustomMemoSaveRec;
begin

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FCharPos := FCharPos;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomMemo.Init }

procedure TppCustomMemo.Init;
begin

  inherited Init;

  FCharPos := 0;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppCustomMemo.PropertiesToDrawCommand }

procedure TppCustomMemo.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawText;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawText) then Exit;

  lDrawCommand := TppDrawText(aDrawCommand);

  {create print command}
  lDrawCommand.Alignment    := Alignment;
  lDrawCommand.Color        := Color;
  lDrawCommand.DataType     := dtMemo;
  lDrawCommand.Left         := PrintPosRect.Left;
  lDrawCommand.Top          := PrintPosRect.Top;
  lDrawCommand.Height       := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width        := PrintPosRect.Right - PrintPosRect.Left;
  lDrawCommand.Font         := Font;
  lDrawCommand.IsMemo       := True;
  lDrawCommand.Leading      := FLeading;
  lDrawCommand.Transparent  := Transparent;
  lDrawCommand.WordWrap     := True;
  lDrawCommand.TabStopPositions := FTabStopPositions;
  lDrawCommand.WrappedText := FPrintLines;
  lDrawCommand.TabStopPositions := FTabStopPositions;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomMemo.CalcSpaceUsed }

procedure TppCustomMemo.CalcSpaceUsed;
var
  llSpaceUsed: Longint;
  llSpaceAvailable: Longint;
  lTextBuf: PChar;
  lPrinter: TppPrinter;
  llLineHeight: Longint;
  llTextLength: Longint;
begin

  lPrinter := GetPrinter;

  if Stretch and ParentStretch then
    begin
      lTextBuf := GetTextBuf;

      if (lTextBuf = nil) then
        llTextLength := 0
      else
        llTextLength := StrLen(lTextBuf);

      ppWordWrap(lTextBuf, PrintPosRect, Font, FLeading, True, FPrintLines, FTabStopPositions,
                 Band.Report.Units, True, lPrinter, FCharPos, FCharWrap);

      StrDispose(lTextBuf);

      {calculate the currently available space}
      llSpaceAvailable := PrintPosRect.Bottom - PrintPosRect.Top;

      ppMaxLinesFit(Font, FLeading, llSpaceAvailable, lPrinter, llLineHeight);

      llSpaceUsed := FPrintLines.Count * llLineHeight;

      if (FCharPos < llTextLength) and (FCharPos <> -1) then
        begin
          if (FPrintLines.Count = 0) then
            FCharPos := 0;

          OverFlow := True;
          SpaceUsed := llSpaceUsed;
        end
      else
        begin
          {memo is done printing, turn overflow off}
          OverFlow := False;

          if (FPrintLines.Count > 0) then
            SpaceUsed := llSpaceUsed;

          FCharPos := 0;

        end; {if, need to calc startline, endline}

    end
  else {static memo }
    begin

      {wrap the text}
      lTextBuf := GetTextBuf;

      FCharPos := 0;

      ppWordWrap(lTextBuf, PrintPosRect, Font, FLeading, True, FPrintLines, FTabStopPositions,
                 Band.Report.Units, True, lPrinter, FCharPos, FCharWrap);

      StrDispose(lTextBuf);

      SpaceUsed := mmHeight;
      OverFlow := False;
    end;

end; {function, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetLeading }

function TppCustomMemo.GetLeading: Single;
var
  lPrinter: TObject;
begin

  {get the value}
  if (Band <> nil) and (Band.Report <> nil) then
    lPrinter := Band.Report.Printer
  else
    lPrinter := nil;

  Result := ppFromMMThousandths(FLeading, Units, pprtVertical, lPrinter);

end; {function, GetLeading}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SetLeading }

procedure TppCustomMemo.SetLeading(Value: Single);
var
  lPrinter: TObject;
begin

  {used for conversion to 3.0}
  if (csReading in ComponentState) then
    begin
      FLeading := Trunc(Value);
      Exit;
    end;

  {set the value}
  if (Band <> nil) and (Band.Report <> nil) then
    lPrinter := Band.Report.Printer
  else
    lPrinter := nil;

  FLeading := ppToMMThousandths(Value, Units, pprtVertical, lPrinter);

  {repaint design control}
  InvalidateDesignControl;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetLeading}

{------------------------------------------------------------------------------}
{ TppCustomMemo.SetCharWrap }

procedure TppCustomMemo.SetCharWrap(Value: Boolean);
begin

  if Printing then Exit;

  FCharWrap := Value;

  {repaint design control}
  InvalidateDesignControl;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetCharWrap}

{------------------------------------------------------------------------------}
{ TppCustomMemo.GetScreenPixelLeading }

function TppCustomMemo.GetScreenPixelLeading: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FLeading, utScreenPixels, pprtHorizontal, nil));

end; {procedure, GetScreenPixelLeading}

{------------------------------------------------------------------------------}
{ TppCustomMemo.DefineProperties - read/write private 'fake' properties }

procedure TppCustomMemo.WriteState(Writer: TWriter);
begin

  if (Writer.Ancestor is TppCustomMemo) then
    FAncestor := TppCustomMemo(Writer.Ancestor)
  else
    FAncestor := nil;

  inherited WriteState(Writer);

end; {procedure, WriteState}

{------------------------------------------------------------------------------}
{ TppCustomMemo.DefineProperties - read/write private 'fake' properties }

procedure TppCustomMemo.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  if (Filer.Ancestor is TppCustomMemo) then
    FAncestor := TppCustomMemo(Filer.Ancestor)
  else
    FAncestor := nil;

  if (FAncestor <> nil) then
    Filer.DefineProperty('mmLeading', ReadLeading, WriteLeading, FLeading <> FAncestor.FLeading)
  else
    Filer.DefineProperty('mmLeading', ReadLeading, WriteLeading, True);

   {used for conversion to 3.0}
  Filer.DefineProperty('Position', ReadPosition, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppCustomMemo.ReadLeading }

procedure TppCustomMemo.ReadLeading(Reader: TReader);
begin
  FLeading := ppReadIntegerPropValue(Reader);
end; {procedure, ReadLeading}

{------------------------------------------------------------------------------}
{ TppCustomMemo.WriteLeading }

procedure TppCustomMemo.WriteLeading(Writer: TWriter);
begin
  Writer.WriteInteger(FLeading);

end; {procedure, WriteLeading}

{------------------------------------------------------------------------------}
{ TppCustomMemo.ReadPosition }

procedure TppCustomMemo.ReadPosition(Reader: TReader);
begin
  {eat the value}
  Reader.ReadInteger;
end; {procedure, ReadPosition}



{------------------------------------------------------------------------------}
{ TppCustomMemo.CreatePopupMenu }

procedure TppCustomMemo.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'CharWrap', '',  157); {'CharWrap'}

end; {procedure, CreatePopupMenu}



{******************************************************************************
 *
 ** M E M O
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppMemo.Create }

constructor TppMemo.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end;

{------------------------------------------------------------------------------}
{ TppMemo.InstantiateDesignControl }

procedure TppMemo.InstantiateDesignControl;
begin

  inherited InstantiateDesignControl;

  LoadMemo;

end; {procedure, InstantiateDesignControl}

{------------------------------------------------------------------------------}
{ TppMemo.SetMemo }

procedure TppMemo.SetMemo(Value: TStrings);

begin

  inherited SetMemo(Value);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetMemo}

{------------------------------------------------------------------------------}
{ TppMemo.CreatePopupMenu }

procedure TppMemo.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'Lines', '',  233);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppMemo.PopupMenuClick }

procedure TppMemo.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('Lines').OnClick := LinesMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppMemo.LinesMenuClick }

procedure TppMemo.LinesMenuClick(Sender: TObject);
var
  lMemoDlg : TppCustomMemoDialog;
  lFormClass: TFormClass;

begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  {display memo property dialog}
  lFormClass := ppGetFormClass(TppCustomMemoDialog);

  lMemoDlg := TppCustomMemoDialog(lFormClass.Create(Application));
  lMemoDlg.LanguageIndex := Band.LanguageIndex;
  lMemoDlg.Lines := Lines;

  if (lMemoDlg.ShowModal = mrOK) then
    begin
      Lines := lMemoDlg.Lines;
      PropertyChange;   {ok to call this here}
    end;

  lMemoDlg.Release;

end; {procedure, LinesMenuClick}



{******************************************************************************
 *
 ** D B M E M O
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBMemo.Create }

constructor TppDBMemo.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAutoDisplay            := True;
  FOnGetMemo              := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppDBMemo.LoadMemo }

procedure TppDBMemo.LoadMemo;
var
  lLines: TStrings;

begin

  if not(FAutoDisplay) then Exit;

  lLines := GetLines;
  lLines.Clear;

  if Assigned(FOnGetMemo) then
    begin
      FOnGetMemo(Self, lLines);
    end

  else if (CheckForPipelineData) then
    try
      lLines.Text := DataPipeline.GetFieldAsString(DataField);

    except
      lLines.Text := ppLoadStr(399);

    end; {try, except}



  inherited LoadMemo;


end; {procedure, LoadMemo}


{------------------------------------------------------------------------------}
{ TppDBMemo.Notify }

procedure TppDBMemo.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (csDestroying in ComponentState) then Exit;

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    LoadMemo;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBMemo.IsDataAware }

function TppDBMemo.IsDataAware: Boolean;
begin
  Result := True;
end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppDBMemo.SetDataField }

procedure TppDBMemo.SetDataField(const Value: string);
begin
  inherited SetDataField(Value);

  {display the text}
  LoadMemo;

end; {procedure, SetDataField}


{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** C U S T O M   M E M O   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomMemoRTTI.RefClass }

class function TraTppCustomMemoRTTI.RefClass: TClass;
begin
  Result := TppCustomMemo;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomMemoRTTI.GetPropList }

class procedure TraTppCustomMemoRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Text');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomMemoRTTI.GetPropRec }

class function TraTppCustomMemoRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CharWrap') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Color') = 0) then
    EnumPropToRec(aPropName, 'TColor', False, aPropRec)

  else if (CompareText(aPropName, 'Leading') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'Lines') = 0) then
    ClassPropToRec(aPropName, TStrings, False, aPropRec)

  else if (CompareText(aPropName, 'MemoStream') = 0) then
    ClassPropToRec(aPropName, TMemoryStream, True, aPropRec)

  else if (CompareText(aPropName, 'mmLeading') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'PrintLines') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else if (CompareText(aPropName, 'spLeading') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'TabStopPositions') = 0) then
    ClassPropToRec(aPropName, TStrings, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomMemoRTTI.GetPropValue }

class function TraTppCustomMemoRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CharWrap') = 0) then
    Boolean(aValue) := TppCustomMemo(aObject).CharWrap

  else if (CompareText(aPropName, 'Color') = 0) then
    Integer(aValue) := Ord(TppCustomMemo(aObject).Color)

  else if (CompareText(aPropName, 'Leading') = 0) then
    Single(aValue) := TppCustomMemo(aObject).Leading

  else if (CompareText(aPropName, 'Lines') = 0) then
    Integer(aValue) := Integer(TppCustomMemo(aObject).Lines)

  else if (CompareText(aPropName, 'MemoStream') = 0) then
    Integer(aValue) := Integer(TppCustomMemo(aObject).MemoStream)

  else if (CompareText(aPropName, 'mmLeading') = 0) then
    Integer(aValue) := TppCustomMemo(aObject).mmLeading

  else if (CompareText(aPropName, 'PrintLines') = 0) then
    Integer(aValue) := Integer(TppCustomMemo(aObject).PrintLines)

  else if (CompareText(aPropName, 'spLeading') = 0) then
    Integer(aValue) := TppCustomMemo(aObject).spLeading

  else if (CompareText(aPropName, 'TabStopPositions') = 0) then
     Integer(aValue) := Integer(TppCustomMemo(aObject).TabStopPositions)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomMemoRTTI.SetPropValue }

class function TraTppCustomMemoRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CharWrap') = 0) then
    TppCustomMemo(aObject).CharWrap := Boolean(aValue)

  else if (CompareText(aPropName, 'Color') = 0) then
    TppCustomMemo(aObject).Color := TColor(aValue)

  else if (CompareText(aPropName, 'Leading') = 0) then
    TppCustomMemo(aObject).Leading := Single(aValue)

  else if (CompareText(aPropName, 'Lines') = 0) then
    TppCustomMemo(aObject).Lines := TStrings(aValue)

  else if (CompareText(aPropName, 'TabStopPositions') = 0) then
    TppCustomMemo(aObject).TabStopPositions := TStrings(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** D B   M E M O   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBMemoRTTI.RefClass }

class function TraTppDBMemoRTTI.RefClass: TClass;
begin
  Result := TppDBMemo;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBMemoRTTI.GetPropList }

class procedure TraTppDBMemoRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBMemoRTTI.GetPropRec }

class function TraTppDBMemoRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBMemoRTTI.GetPropValue }

class function TraTppDBMemoRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    Boolean(aValue) := TppDBMemo(aObject).AutoDisplay

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBMemoRTTI.SetPropValue }

class function TraTppDBMemoRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'AutoDisplay') = 0 then
    TppDBMemo(aObject).AutoDisplay := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppCustomMemoRTTI);
  raRegisterRTTI(TraTppDBMemoRTTI);

finalization

  raUnRegisterRTTI(TraTppCustomMemoRTTI);
  raUnRegisterRTTI(TraTppDBMemoRTTI);

end.
