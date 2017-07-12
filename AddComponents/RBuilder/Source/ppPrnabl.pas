{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppPrnabl;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, SysUtils, Forms, Graphics, Menus,
  ppDB, ppComm, ppCache,  ppDsgnCt, ppDevice, ppTypes, ppUtils, ppPrintr,
  ppRTTI;

type

  { TppPrintable }
  TppPrintable = class(TppCacheable)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FCaption: String;
    FColor: TColor;
    FCheckOutOfSpace: Boolean;
    FDataField: String;
    FDataPipeline: TppDataPipeline;
    FDefaultPropEditType: TppPropEditType;
    FDefaultPropName: String;
    FDesignImage: TBitmap;
    FDesignControl: TppDesignControl;
    FDrawCommandClass: TppDrawCommandClass;
    FDrawComponent: Boolean;
    FFont: TFont;
    FGenerationComplete: Boolean;
    FHeight: Longint;
    FLeft: Longint;
    FLookupPipeline: Boolean;
    FOnDrawCommandCreate: TppDrawCommandEvent;
    FOnDrawCommandClick: TppDrawCommandEvent;
    FOnPrint: TNotifyEvent;
    FOutOfSpace: Boolean;
    FOverFlow: Boolean;
    FParentHeight: Boolean;
    FParentWidth: Boolean;
    FPrintPosRect: TppRect;
    FReprintOnOverFlow: Boolean;
    FResetOnCompute: Boolean;
    FSaveHeight: Longint;
    FSaveWidth: Longint;
    FSelectionObject: TComponent;
    FShiftWithParent: Boolean;
    FSpaceUsed: Longint;
    FStretchWithParent: Boolean;
    FText: String;
    FTop: Longint;
    FTransparent: Boolean;
    FUnits: TppUnitType;
    FValidImage: Boolean;
    FVisible: Boolean;
    FWidth: Longint;
    FWordWrap: Boolean;
    FZOrder: Integer;

    {used for conversion to 3.0}
    FDataSource: String;
    FReportField: String;

    function  GetHeight: Single;
    function  GetLeft: Single;
    function  GetScreenPixelLeft: Integer;
    function  GetScreenPixelTop: Integer;
    function  GetScreenPixelWidth: Integer;
    function  GetScreenPixelHeight: Integer;
    function  GetTop: Single;
    function  GetWidth: Single;
    procedure PaintDesignImage(aCanvas: TCanvas);
    procedure SetHeight(Value: Single); 
    procedure SetLeft(Value: Single);
    procedure SetScreenPixelLeft(Value: Integer);
    procedure SetScreenPixelTop(Value: Integer);
    procedure SetScreenPixelWidth(Value: Integer);
    procedure SetScreenPixelHeight(Value: Integer);
    procedure SetTop(Value: Single);
    procedure SetVisible(Value: Boolean);
    procedure SetWidth(Value: Single);

    function  spGetBoundsRect: TRect;
    function  spGetClientRect: TRect;


    {read/write private properties}
    procedure ReadHeight(Reader: TReader);
    procedure ReadLeft(Reader: TReader);
    procedure ReadTop(Reader: TReader);
    procedure ReadWidth(Reader: TReader);
    procedure WriteHeight(Writer: TWriter);
    procedure WriteLeft(Writer: TWriter);
    procedure WriteTop(Writer: TWriter);
    procedure WriteWidth(Writer: TWriter);

    {used for conversion to 3.0}
    procedure ReadDataSource(Reader: TReader);
    procedure ReadRegion(Reader: TReader);
    procedure ReadReportField(Reader: TReader);
    procedure ReadParentDataSource(Reader: TReader);
    procedure ReadOnFormatText(Reader: TReader);

  protected
    {override from TComponent}
    procedure DefineProperties(Filer: TFiler); override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetUserName(const aUserName: TComponentName); override;
    procedure Loaded; override;

    procedure AdjustBounds; virtual;
    procedure BoundsChange; virtual;
    function  CanOptimizeDesignPainting: Boolean; virtual;
    function  CheckForPipelineData: Boolean; virtual;
    procedure CreateDrawCommand(aPage: TppPage); virtual;
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); virtual;
    procedure DrawCommandClickEvent(Sender: TObject); virtual;
    procedure DSChanged(aDesignStateSet: TppDesignStates); override;
    procedure FontChanged(Sender: TObject); virtual;
    function  GetCaption: String; virtual;
    function  GetDefaultPropHint: String; virtual;
    function  GetDescription: String; virtual;
    function  GetDesignCanvas: TCanvas;
    function  GetDesigner: TForm; virtual; abstract;
    function  GetLanguageIndex: Longint; virtual; abstract;
    function  GetPrinter: TppPrinter; virtual;
    procedure InvalidateDesignControl; virtual;
    procedure PaintDesignControl(aCanvas: TCanvas); virtual;
    procedure PageStart; virtual;
    procedure PropertyChange; override;
    procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); virtual;
    procedure RedrawOnOverFlow; virtual;
    procedure SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    procedure PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    procedure SetAlignment(Value: TAlignment); virtual;
    procedure SetAutoSize(Value: Boolean); virtual;
    procedure SetColor(aColor: TColor); virtual;
    procedure SetCaption(Value: String); virtual;
    procedure SetDataField(const Value: String); virtual;
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline); virtual;
    procedure SetFont(Value: TFont); virtual;
    procedure SetMMHeight(Value: Longint); virtual;
    procedure SetMMLeft(Value: Longint); virtual;
    procedure SetMMTop(Value: Longint); virtual;
    procedure SetMMWidth(Value: Longint); virtual;
    procedure SetParentHeight(Value: Boolean); virtual;
    procedure SetParentWidth(Value: Boolean);  virtual;
    procedure SetReprintOnOverFlow(Value: Boolean); virtual;
    procedure SetResetOnCompute(Value: Boolean); virtual;
    procedure SetShiftWithParent(Value: Boolean); virtual;
    procedure SetSpaceUsed(Value: Longint); virtual;
    procedure SetStretchWithParent(Value: Boolean); virtual;
    procedure SetTransparent(Value: Boolean); virtual;
    procedure SetWordWrap(Value: Boolean); virtual;
    procedure SetUnits(aUnits: TppUnitType); virtual;
    function  spGetClipRect: TRect; virtual;
    procedure UpdateDesignControlBounds; virtual;

    property CheckOutOfSpace: Boolean read FCheckOutOfSpace write FCheckOutOfSpace;
    property Color: TColor read FColor write SetColor default clWhite;
    property Designer: TForm read GetDesigner;
    property DrawCommandClass: TppDrawCommandClass read FDrawCommandClass write FDrawCommandClass;
    property LanguageIndex: Longint read GetLanguageIndex;
    property Transparent: Boolean read FTransparent write SetTransparent default False;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    class function DefaultHint: String; virtual;

    procedure AfterDesignerCreate; virtual;
    procedure AfterPrint; virtual;
    procedure BeforePrint; virtual;
    procedure Clear; virtual;
    procedure Compute; virtual;
    procedure DoOnPrint;
    procedure EndOfMainReport; virtual;
    procedure FreeDesignControl; virtual;
    procedure Generate; virtual; abstract;
    procedure GetBackGroundColor(var aColor: TColor; var aIsClear: Boolean); virtual;
    procedure GetForeGroundColor(var aColor: TColor; var aIsClear: Boolean); virtual;
    function  GetText: String; virtual;
    procedure GetDefaultPropEnumNames(aList: TStrings); virtual;
    procedure GetDisplayFormats(aList: TStrings); virtual;
    function  HasColor: Boolean; virtual;
    function  HasFont: Boolean; virtual;
    procedure Init; virtual;
    procedure InstantiateDesignControl; virtual;
    function  IsCalc: Boolean; virtual;
    function  IsClickable: Boolean; virtual;
    function  IsDataAware: Boolean; virtual;
    procedure LanguageChanged; virtual;
    procedure PopupMenuClick(Sender: TObject); virtual;
    function  Printing: Boolean; virtual;
    procedure Print(aPage: TppPage); virtual;
    procedure Reset; virtual;
    procedure SetBounds(aLeft, aTop, aWidth, aHeight: Single);
    procedure spSetBounds(aLeft, aTop, aWidth, aHeight: Integer);
    procedure mmSetBounds(aLeft, aTop, aWidth, aHeight: LongInt); virtual;
    procedure SetText(Value: String); virtual;
    procedure SetBackgroundColor(aColor: TColor; aIsClear: Boolean); virtual;
    procedure SetForeGroundColor(aColor: TColor; aIsClear: Boolean); virtual;
    procedure SetPenWidth(aWidth: Integer); virtual;
    procedure StartOfMainReport; virtual;
    procedure StartOfParentReport; virtual;

    {used to convert to 3.0}
    procedure Convert(aVersionNo: Integer); virtual;

    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property Caption: String read GetCaption write SetCaption;
    property DataField: String read FDataField write SetDataField;
    property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;
    property DefaultPropHint: String read GetDefaultPropHint;
    property DefaultPropName: String read FDefaultPropName write FDefaultPropName;
    property DefaultPropEditType: TppPropEditType read FDefaultPropEditType write FDefaultPropEditType;
    property Description: String read GetDescription;
    property DesignControl: TppDesignControl read FDesignControl write FDesignControl stored False;
    property DrawComponent: Boolean read FDrawComponent write FDrawComponent;
    property Font: TFont read FFont write SetFont;
    property GenerationComplete: Boolean read FGenerationComplete write FGenerationComplete;
    property Height: Single read GetHeight write SetHeight stored False;
    property Left: Single read GetLeft write SetLeft stored False;
    property LookupPipeline: Boolean read FLookupPipeline write FLookupPipeline;
    property mmLeft: Longint read FLeft;
    property mmHeight: Longint read FHeight;
    property mmTop: Longint read FTop;
    property mmWidth: Longint read FWidth;
    property OnDrawCommandClick: TppDrawCommandEvent read FOnDrawCommandClick write FOnDrawCommandClick;
    property OnDrawCommandCreate: TppDrawCommandEvent read FOnDrawCommandCreate write FOnDrawCommandCreate;
    property OutOfSpace: Boolean read FOutOfSpace write FOutOfSpace;
    property OverFlow: Boolean read FOverFlow write FOverFlow;
    property ParentHeight: Boolean read FParentHeight write SetParentHeight default False;
    property ParentWidth: Boolean read FParentWidth write SetParentWidth default False;
    property PrintPosRect: TppRect read FPrintPosRect write FPrintPosRect;
    property ReprintOnOverFlow: Boolean read FReprintOnOverFlow write SetReprintOnOverFlow default False;
    property ResetOnCompute: Boolean read FResetOnCompute  write SetResetOnCompute;
    property SelectionObject: TComponent read FSelectionObject write FSelectionObject;
    property ShiftWithParent: Boolean read FShiftWithParent write SetShiftWithParent default False;
    property SpaceUsed: Longint read FSpaceUsed write SetSpaceUsed;
    property spClientRect: TRect read spGetClientRect;
    property spClipRect: TRect read spGetClipRect;
    property spBoundsRect: TRect read spGetBoundsRect;
    property spLeft: Integer read GetScreenPixelLeft write SetScreenPixelLeft;
    property spHeight: Integer read GetScreenPixelHeight write SetScreenPixelHeight;
    property spTop: Integer read GetScreenPixelTop write SetScreenPixelTop;
    property spWidth: Integer read GetScreenPixelWidth write SetScreenPixelWidth;
    property StretchWithParent: Boolean read FStretchWithParent write SetStretchWithParent default False;
    property Text: String read GetText write SetText;
    property Top: Single read GetTop write SetTop stored False;
    property Units: TppUnitType read FUnits write SetUnits;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Width: Single read GetWidth write SetWidth stored False;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property ZOrder: Integer read FZOrder write FZOrder;

    {used for conversion to 3.0}
    property DataSource: String read FDataSource;
    property ReportField: String read FReportField;

  published
    property OnPrint: TNotifyEvent read FOnPrint write FOnPrint;
    
  end; {class, TppPrintable}


  { TraTppPrintableRTTI }
  TraTppPrintableRTTI = class(TraTppCacheableRTTI)
    public
      class procedure GetEventList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppPrintableRTTI}


implementation

uses ppForms;


{******************************************************************************
 *
 ** P R I N T A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrintable.Create }

constructor TppPrintable.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAlignment          := taLeftJustify;
  FAutoSize           := False;
  FCaption            := '';
  FCheckOutOfSpace    := True;
  FColor              := clWhite;
  FDataField          := '';
  FDataPipeline       := nil;
  FDesignControl      := nil;
  FDesignImage        := nil;
  FDefaultPropEditType := etEdit;
  FDefaultPropName    := '';
  FDrawCommandClass   := nil;
  FDrawComponent      := False;
  FFont               := TppFont.Create;
  FFont.OnChange      := FontChanged;
  FGenerationComplete := False;
  FHeight             := ppToMMThousandths(17, utScreenPixels, pprtVertical, nil);
  FLeft               := 0;
  FLookupPipeline     := False;
  FOnDrawCommandClick := nil;
  FOnDrawCommandCreate := nil;
  FOnPrint            := nil;
  FOutOfSpace         := False;
  FOverFlow           := False;
  FParentWidth        := False;
  FParentHeight       := False;
  FPrintPosRect       := ppRect(0,0,0,0);
  FReprintOnOverFlow  := False;
  FResetOnCompute     := False;
  FSaveWidth          := 0;
  FSaveHeight         := 0;
  FSelectionObject    := nil;
  FShiftWithParent    := False;
  FSpaceUsed          := 0;
  FStretchWithParent  := False;
  FText               := '';
  FTop                := 0;
  FTransparent        := False;
  FUnits              := utInches;
  FValidImage         := False;
  FVisible            := True;
  FWidth              := ppToMMThousandths(65, utScreenPixels, pprtHorizontal, nil);
  FWordWrap           := False;

  if IsDataAware then
    begin
      FDefaultPropName     := 'DataField';
      FDefaultPropEditType := etFieldList;
    end;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrintable.Destroy }

destructor TppPrintable.Destroy;
begin

  {tell data pipeline that we no longer exist}
  if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);

 { showMessage('TppPrintable.Destroy, free disign control');}
 { if Assigned(FDesignControl) then
    begin
      FDesignControl.Free;
      FDesignControl := nil;
    end;  }

  FDesignImage.Free;

  {if Assigned(FSelectionObject) then
    begin
     FSelectionObject.Free;
     FSelectionObject := nil;
    end;   }

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPrintable.Notify }

procedure TppPrintable.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) and (aCommunicator = FDataPipeline) then
    begin
      FDataPipeline := nil;

      Reset;
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppPrintable.Loaded }

procedure TppPrintable.Loaded;
begin

  if (pppcPasting in DesignState) then
    DSExclude([pppcPasting]);

  inherited Loaded;

end; {function, Loaded }

{------------------------------------------------------------------------------}
{ TppPrintable.GetDescription }

function TppPrintable.GetDescription: String;
begin
  Result := UserName;
end; {function, GetDescription }

{------------------------------------------------------------------------------}
{ TppPrintable.SendDesignMessage }

procedure TppPrintable.SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
var
  lDesigner: TForm;

begin

   lDesigner := GetDesigner;

  if (lDesigner <> nil)  then
    lDesigner.Perform(aMsg, aWParam, aLParam);

end;  {procedure, SendDesignMessage}

{------------------------------------------------------------------------------}
{ TppPrintable.PostDesignMessage }

procedure TppPrintable.PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
var
  lDesigner: TForm;

begin

   lDesigner := GetDesigner;

  if (lDesigner <> nil)  then
    PostMessage(lDesigner.Handle, aMsg, aWParam, aLParam);

end;  {procedure, PostDesignMessage}


{------------------------------------------------------------------------------}
{ TppPrintable.GetDesignCanvas }

function  TppPrintable.GetDesignCanvas: TCanvas;
begin

  if (FDesignImage = nil) then
    FDesignImage := TBitmap.Create;
 
  if (FDesignImage.Width <> spWidth) then
    FDesignImage.Width := spWidth;

  if (FDesignImage.Height <> spHeight) then
    FDesignImage.Height := spHeight;


  Result := FDesignImage.Canvas;

end; {function, GetDesignCanvas}

{------------------------------------------------------------------------------}
{ TppPrintable.Printing }

function TppPrintable.Printing: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.IsCalc }

function TppPrintable.IsCalc: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.IsClickable }

function TppPrintable.IsClickable: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.Compute }

procedure TppPrintable.Compute;
begin

end;

{------------------------------------------------------------------------------}
{ TppPrintable.Clear }

procedure TppPrintable.Clear;
begin
  FResetOnCompute := False;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.StartOfMainReport }

procedure TppPrintable.StartOfMainReport;
begin

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppPrintable.StartOfParentReport }

procedure TppPrintable.StartOfParentReport;
begin

end; {procedure, StartOfParentReport}

{------------------------------------------------------------------------------}
{ TppPrintable.EndOfMainReport }

procedure TppPrintable.EndOfMainReport;
begin

end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppPrintable.Init }

procedure TppPrintable.Init;
begin

  FOverFlow := False;

  if IsCalc then
    Clear;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppPrintable.BeforePrint }

procedure TppPrintable.BeforePrint;
begin

  FGenerationComplete := False;
  FSpaceUsed := 0;
  FOutOfSpace := False;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppPrintable.RedrawOnOverFlow }

procedure TppPrintable.RedrawOnOverFlow;
begin
  if FVisible then
    FDrawComponent := True;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.Print }

procedure TppPrintable.Print(aPage: TppPage);
begin

  if FDrawComponent and FVisible then
    CreateDrawCommand(aPage);

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppPrintable.CreateDrawCommand }

procedure TppPrintable.CreateDrawCommand(aPage: TppPage);
var
  lDrawCommand: TppDrawCommand;
begin

  if (FDrawCommandClass = nil) then Exit;

  {create the draw command}
  lDrawCommand := FDrawCommandClass.Create(nil);

  {transfer properties to draw command}
  PropertiesToDrawCommand(lDrawCommand);

  {assign click event handler if clickable, do this after create}
  if Assigned(FOnDrawCommandClick) then
    lDrawCommand.OnClick := DrawCommandClickEvent;

  {assign the page rect - used for clipping}
  lDrawCommand.ClipRect := aPage.PageDef.PageRect;

  {trigger event}
  if Assigned(FOnDrawCommandCreate) then
    FOnDrawCommandCreate(Self, lDrawCommand);

  {assign draw command to page, do this last, so drawcommand is properly classified}
  lDrawCommand.Page := aPage;

end; {procedure, CreateDrawCommand}

{------------------------------------------------------------------------------}
{ TppPrintable.PropertiesToDrawCommand}

procedure TppPrintable.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
begin
  aDrawCommand.Tag := Tag;

  {for DataAware components, assign DataType from the datapipeline field info}
  if IsDataAware and (FDataPipeline <> nil) and (FDataField <> '') then
    aDrawCommand.DataType := FDataPipeline.GetFieldDataType(FDataField);

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppPrintable.DrawCommandClickEvent}

procedure TppPrintable.DrawCommandClickEvent(Sender: TObject);
begin

  if not(Sender is TppDrawCommand) then Exit;

  {trigger event}
  if Assigned(FOnDrawCommandClick) then FOnDrawCommandClick(Self, TppDrawCommand(Sender));

end; {procedure, DrawCommandClickEvent}

{------------------------------------------------------------------------------}
{ TppPrintable.AfterPrint }

procedure TppPrintable.AfterPrint;
begin

  if FGenerationComplete then
    FDrawComponent := False;

end; {procedure, AfterPrint}


{------------------------------------------------------------------------------}
{ TppPrintable.AfterDesignerCreate }

procedure TppPrintable.AfterDesignerCreate;
begin
 {this method is called by the report designer}
end; {procedure, AfterDesignerCreate}


{------------------------------------------------------------------------------}
{ TppPrintable.PropertyChange }

procedure TppPrintable.PropertyChange;
begin

  if Printing then Exit;

  if (pppcLoading in DesignState) or (pppcTemplateLoading in DesignState) then Exit;

  {notify report designer }
  SendDesignMessage(PM_COMPONENTCHANGE, ppWCustomMsg, LongInt(Self));

end;

{------------------------------------------------------------------------------}
{ TppPrintable.InstantiateDesignControl }

procedure TppPrintable.InstantiateDesignControl;
begin

  if (Printing) or (FDesignControl <> nil) then Exit;

  DSInclude([pppcDesigning]);

  {notify report designer }
  SendDesignMessage(PM_INSTANTIATECOMPONENTDC, ppWCustomMsg, LongInt(Self));

  FDesignControl.Tag := LongInt(Self);

  FDesignControl.OnPaint := PaintDesignImage;

  {load data, if needed}
  if IsDataAware then
    Notify(FDataPipeline, ppopDataChange);

  BoundsChange;

  Reset;

  InvalidateDesignControl;

end; {procedure, InstantiateDesignControl}

{------------------------------------------------------------------------------}
{ TppPrintable.FreeDesignControl }

procedure TppPrintable.FreeDesignControl;
begin

  DSExclude([pppcDesigning, pppcDisplayData]);

  if Assigned(FSelectionObject) then
    begin
      FSelectionObject.Free;
      FSelectionObject := nil;
    end;

  FDesignImage.Free;
  FDesignImage := nil;
  FDesignControl.Free;
  FDesignControl := nil;

end; {procedure, FreeDesignControl}

{------------------------------------------------------------------------------}
{ TppPrintable.CanOptimizeDesignPainting}

function TppPrintable.CanOptimizeDesignPainting: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.PaintDesignImage }

procedure TppPrintable.PaintDesignImage(aCanvas: TCanvas);
var
  lCanvas: TCanvas;

begin

  {check whether design painting can be optimized}
  if not CanOptimizeDesignPainting then
    begin
      PaintDesignControl(aCanvas);
      Exit;
    end;

  {get the offscreen canvas}
  lCanvas := GetDesignCanvas;

  {update, if needed}
  if not FValidImage then
    begin
      PatBlt(lCanvas.Handle, 0, 0, spWidth, spHeight, WHITENESS);
      PaintDesignControl(lCanvas);
      FValidImage := True;
    end;

  {render to the real canvas}
  if FTransparent then
    aCanvas.CopyMode := cmSrcAnd
  else
    aCanvas.CopyMode := cmSrcCopy;

   aCanvas.CopyRect(aCanvas.ClipRect, lCanvas, aCanvas.ClipRect);

end; {procedure, PaintDesignImage}

{------------------------------------------------------------------------------}
{ TppPrintable.InvalidateDesignControl }

procedure TppPrintable.InvalidateDesignControl;
begin

  if (FDesignControl = nil) or not (pppcDesigning in DesignState) or (Printing) then Exit;

  FValidImage := False;

  FDesignControl.Invalidate;

end; {procedure, InvalidateDesignControl}

{------------------------------------------------------------------------------}
{ TppPrintable.PaintDesignControl }

procedure TppPrintable.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lSaveColor: TColor;

begin

  lClientRect := spClientRect;

  {draw the background}
  if not(FTransparent) then
    begin
      aCanvas.Brush.Color := FColor;
      aCanvas.Brush.Style := bsSolid;
      aCanvas.FillRect(lClientRect);
    end;

  aCanvas.Font := Font;

  {draw the caption}
  aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, Caption);

  {draw a framerect}
  lSaveColor := aCanvas.Brush.Color;
  aCanvas.Brush.Color := clBlack;
  aCanvas.FrameRect(lClientRect);
  aCanvas.Brush.Color := lSaveColor;

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppPrintable.SetAlignment }

 procedure TppPrintable.SetAlignment(Value: TAlignment);
begin

  if FAlignment <> Value then
    begin
      FAlignment := Value;
      InvalidateDesignControl;
      PropertyChange;
    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetAutoSize }

procedure TppPrintable.SetAutoSize(Value: Boolean);
begin

  if FAutoSize <> Value then
    begin
      FAutoSize := Value;

      AdjustBounds;
      PropertyChange;
    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetParentHeight }

procedure TppPrintable.SetParentHeight(Value: Boolean);
begin
  FParentHeight := Value;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetParentWidth }

procedure TppPrintable.SetParentWidth(Value: Boolean);
begin
  FParentWidth := Value;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetSpaceUsed }

procedure TppPrintable.SetSpaceUsed(Value: Longint);
begin
  FSpaceUsed := Value;
end; {procedure, SetSpaceUsed}

{------------------------------------------------------------------------------}
{ TppPrintable.SetResetOnCompute }

procedure TppPrintable.SetResetOnCompute(Value: Boolean);
begin
  FResetOnCompute := Value;
end; {procedure, SetResetOnCompute}

{------------------------------------------------------------------------------}
{ TppPrintable.SetReprintOnOverFlow }

procedure TppPrintable.SetReprintOnOverFlow(Value: Boolean);
begin

  if FReprintOnOverFlow <> Value then
    begin

      FReprintOnOverFlow := Value;

      PropertyChange;

      Reset;

    end;

end; {procedure, SetReprintOnOverFlow}

{------------------------------------------------------------------------------}
{ TppPrintable.SetShiftWithParent }

procedure TppPrintable.SetShiftWithParent(Value: Boolean);
begin

  if FShiftWithParent <> Value then
    begin

      FShiftWithParent := Value;

      PropertyChange;

      Reset;

      if FShiftWithParent and FStretchWithParent then
        FStretchWithParent := False;

    end;

end; {procedure, ShiftWithParent}

{------------------------------------------------------------------------------}
{ TppPrintable.SetStretchWithParent }

procedure TppPrintable.SetStretchWithParent(Value: Boolean);
begin
  if FStretchWithParent <> Value then
    begin

      FStretchWithParent := Value;

      PropertyChange;

      Reset;

     if FStretchWithParent and FShiftWithParent then
       FShiftWithParent := False;

    end;
end; {procedure, ShiftWithParent}

{------------------------------------------------------------------------------}
{ TppPrintable.SetColor }

procedure TppPrintable.SetColor(aColor: TColor);
begin

  if HasColor and (FColor <> aColor) then
    begin
      FColor := aColor;
      InvalidateDesignControl;
      PropertyChange;

    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetTransparent }

procedure TppPrintable.SetTransparent(Value: Boolean);
begin

  if FTransparent <> Value then
    begin
      FTransparent := Value;
      InvalidateDesignControl;
      PropertyChange;

    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetVisible }

 procedure TppPrintable.SetVisible(Value: Boolean);
begin

  if FVisible <> Value then
    begin
      FVisible := Value;

      PropertyChange;
      Reset;

    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetWordWrap }

 procedure TppPrintable.SetWordWrap(Value: Boolean);
begin

  if FWordWrap <> Value then
    begin
      FWordWrap := Value;

      AdjustBounds;
      PropertyChange;
      Reset;

    end;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetName }

procedure TppPrintable.SetName(const Value: TComponentName);
begin

  inherited SetName(Value);

  InvalidateDesignControl;

  {use Post here to avoid access violations in IDE}
  PostDesignMessage(PM_COMPONENTNAMECHANGE, ppWCustomMsg, Longint(Self));

end; {procedure, SetName}

{------------------------------------------------------------------------------}
{ TppPrintable.SetUserName }

procedure TppPrintable.SetUserName(const aUserName: TComponentName);
begin

  inherited SetUserName(aUserName);

  InvalidateDesignControl;

  {use Post here to avoid access violations in IDE}
  PostDesignMessage(PM_COMPONENTNAMECHANGE, ppWCustomMsg, Longint(Self));

end; {procedure, SetUserName}




{------------------------------------------------------------------------------}
{ TppPrintable.GetCaption }

function TppPrintable.GetCaption: String;
begin

  {if caption is empty, try to get a caption }
  if (FCaption = '') and (pppcDesigning in DesignState) and not(Printing) then
    begin
      {try getting the text }
      FCaption := GetText;

     if IsDataAware and not(CheckForPipelineData) then
       FCaption := DataField;

    end;

  Result := FCaption;

end; {function, GetCaption}

{------------------------------------------------------------------------------}
{ TppPrintable.DefaultHint }

class function TppPrintable.DefaultHint: String;
begin
  Result := ClassName;
end; {function, DefaultHint}

{------------------------------------------------------------------------------}
{ TppPrintable.GetDefaultPropHint }

function TppPrintable.GetDefaultPropHint: String;
begin

  if IsDataAware then
    Result := ppLoadStr(203) {Data Field}

  else if FDefaultPropName = 'Caption' then
    Result := ppLoadStr(154);

end; {function, GetDefaultPropHint}


{------------------------------------------------------------------------------}
{ TppPrintable.SetFont }

procedure TppPrintable.SetFont(Value: TFont);
begin

  FFont.Assign(Value);

  PropertyChange;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetBackgroundColor }

procedure TppPrintable.SetBackgroundColor(aColor: TColor; aIsClear: Boolean);
begin

  SetTransparent(aIsClear);

  if not aIsClear then
    SetColor(aColor);
    
end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetForegroundColor }

procedure TppPrintable.SetForegroundColor(aColor: TColor; aIsClear: Boolean);
begin

  if HasFont then
    FFont.Color := aColor;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetPenWidth }

procedure TppPrintable.SetPenWidth(aWidth: Integer);
begin
end;

{------------------------------------------------------------------------------}
{ TppPrintable.FontChanged }

procedure TppPrintable.FontChanged(Sender: TObject);
begin

  AdjustBounds;
  InvalidateDesignControl;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetText }

function TppPrintable.GetText: String;
begin
  Result := FText;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetBackGroundColor }

procedure TppPrintable.GetBackGroundColor(var aColor: TColor; var aIsClear: Boolean);
begin

  if HasColor then
    begin
      aColor   := FColor;
      aIsClear := FTransparent;
    end
  else
    aIsClear := True;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetForeGroundColor }

procedure TppPrintable.GetForeGroundColor(var aColor: TColor; var aIsClear: Boolean);
begin

  if HasFont then
    begin
      aColor   := FFont.Color;
      aIsClear := FTransparent;
    end
  else
    aIsClear := True;

end;


{------------------------------------------------------------------------------}
{ TppPrintable.GetDefaultPropEnumNames }

procedure TppPrintable.GetDefaultPropEnumNames(aList: TStrings);
begin
end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetDisplayFormats }

procedure TppPrintable.GetDisplayFormats(aList: TStrings);
begin
end;

{------------------------------------------------------------------------------}
{ TppPrintable.spGetBoundsRect }

function TppPrintable.spGetBoundsRect: TRect;
begin
  Result := Rect( Trunc(ppFromMMThousandths(FLeft,  utScreenPixels, pprtHorizontal, nil)),
                    Trunc(ppFromMMThousandths(FTop,  utScreenPixels, pprtVertical, nil)),
                    Trunc(ppFromMMThousandths(FLeft+FWidth,  utScreenPixels, pprtHorizontal, nil)),
                    Trunc(ppFromMMThousandths(FTop+FHeight, utScreenPixels, pprtVertical, nil)) );
end;

{------------------------------------------------------------------------------}
{ TppPrintable.spGetClientRect }

function TppPrintable.spGetClientRect: TRect;
begin
  Result := Rect(0, 0, Trunc(ppFromMMThousandths(FWidth,  utScreenPixels, pprtHorizontal, nil)),
                       Trunc(ppFromMMThousandths(FHeight, utScreenPixels, pprtVertical, nil)) );
end;

{------------------------------------------------------------------------------}
{ TppPrintable.spGetClipRect }

function TppPrintable.spGetClipRect: TRect;
begin

  Result := spClientRect

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetText }

procedure TppPrintable.SetText(Value: String);
begin
  FText := Value;

  if not IsDataAware then
    PropertyChange;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.HasColor }

function TppPrintable.HasColor: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.HasFont }

function TppPrintable.HasFont: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetDataPipeline }

procedure TppPrintable.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin

  if FDataPipeline <> nil then
    FDataPipeline.RemoveNotify(Self);

  FDataPipeline := aDataPipeline;

  if FDataPipeline <> nil then
    FDataPipeline.AddNotify(Self);

  {this causes the caption to change}
  Notify(FDataPipeline, ppopDataChange);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  SendDesignMessage(PM_COMPONENTDATAPIPELINECHANGE, ppWCustomMsg, 0);

  Reset;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppPrintable.SetDataField}

procedure TppPrintable.SetDataField(const Value: String);
begin

  if not(IsDataAware) then Exit;

  FDataField := Value;

  {set caption}
  if Value = '' then
    Caption := Name

  else if not(CheckForPipelineData) then
    begin
      if (DataPipeline <> nil) then
        Caption := FDataPipeline.FieldAliasForFieldName(FDataField)
      else
        Caption := FDataField;
    end;

  PropertyChange;

  Reset;

end; {procedure, SetDataField}

{------------------------------------------------------------------------------}
{ TppPrintable.DSChanged}

procedure TppPrintable.DSChanged(aDesignStateSet: TppDesignStates);
begin

  inherited DSChanged(aDesignStateSet);

  if IsDataAware and (pppcDisplayData in aDesignStateSet) then
    Notify(FDataPipeline, ppopDataChange);

end; {procedure, DSChanged}

{------------------------------------------------------------------------------}
{ TppPrintable.IsDataAware}

function TppPrintable.IsDataAware: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.CheckForPipelineData}

function TppPrintable.CheckForPipelineData: Boolean;
begin

  Result := IsDataAware;

  if not(IsDataAware) then Exit;

  try

    if (FDataField = '') then
      Result := False

    else if (FDataPipeline = nil) then
      Result := False

    else if not(FDataPipeline.Active) then
      Result := False

    {else if not(DataPipeline.BOF and DataPipeline.EOF) then
      Result := False}

    else if ((csDesigning in ComponentState) and FDataPipeline.GetFieldIsCalculated(FDataField)) then
      Result := False

    else if (pppcDesigning in DesignState) and not(pppcDisplayData in DesignState) and
            not(Printing) then
      Result := False;

  except
    Result := False;

  end;

end; {function, CheckForPipelineData}

{------------------------------------------------------------------------------}
{ TppPrintable.LanguageChanged}

procedure TppPrintable.LanguageChanged;
begin

end;

{------------------------------------------------------------------------------}
{ TppPrintable.SetCaption }

procedure TppPrintable.SetCaption(Value: String);
begin
  FCaption := Value;
  FText    := FCaption;    {used for printing}

  if AutoSize then
    AdjustBounds;

  InvalidateDesignControl;

  if not IsDataAware then
    PropertyChange;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.DoOnPrint }

procedure TppPrintable.DoOnPrint;
begin

  if Assigned(FOnPrint) then FOnPrint(Self);

  SendEventNotify(Self, ciComponentPrint, nil);

end; {function, DoOnPrint}

{------------------------------------------------------------------------------}
{ TppPrintable.CreatePopupMenu }

procedure TppPrintable.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin
end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppPrintable.PopupMenuClick }

procedure TppPrintable.PopupMenuClick(Sender: TObject);
begin
end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppPrintable.Reset }

procedure TppPrintable.Reset;
begin
end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetPrinter }

function TppPrintable.GetPrinter: TppPrinter;
begin

  Result := nil;

end;

{------------------------------------------------------------------------------}
{ TppPrintable.AdjustBounds }

procedure TppPrintable.AdjustBounds;
begin
  InvalidateDesignControl;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.BoundsChange }

procedure TppPrintable.BoundsChange;
begin

  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  if (FDesignControl = nil) then Exit;

  {note: if reading or loading and not pasting}
  if ((csReading in ComponentState) or (csLoading in ComponentState)) and (FDesignControl = nil) then Exit;


  {update design control bounds }
  UpdateDesignControlBounds;


  {notify selection object that design control has moved}
  if Assigned(FSelectionObject) then
    begin
      (FSelectionObject as TppSelectionObject).SetBoundsRectBounds;
      (FSelectionObject as TppSelectionObject).ShowSelection(True);
    end;

  PropertyChange;


  {redraw design control if size changed }
  if ((FSaveHeight <> FHeight) or (FSaveWidth <> FWidth)) then
    begin
      FSaveHeight := FHeight;
      FSaveWidth  := FWidth;

      InvalidateDesignControl;
    end;


end; {procedure, BoundsChange}

{------------------------------------------------------------------------------}
{ TppPrintable.UpdateDesignControlBounds }

procedure TppPrintable.UpdateDesignControlBounds;
begin

end; {procedure, UpdateDesignControlBounds}

{------------------------------------------------------------------------------}
{ TppPrintable.SetBounds }

procedure TppPrintable.SetBounds(aLeft, aTop, aWidth, aHeight: Single);
var
  lPrinter: TObject;

begin
  lPrinter := GetPrinter;

  mmSetBounds( ppToMMThousandths(aLeft,   FUnits, pprtHorizontal, lPrinter),
               ppToMMThousandths(aTop,    FUnits, pprtVertical,   lPrinter),
               ppToMMThousandths(aWidth,  FUnits, pprtHorizontal, lPrinter),
               ppToMMThousandths(aHeight, FUnits, pprtVertical,   lPrinter) );

end;

{------------------------------------------------------------------------------}
{ TppPrintable.spSetBounds }

procedure TppPrintable.spSetBounds(aLeft, aTop, aWidth, aHeight: Integer);
begin

  mmSetBounds( ppToMMThousandths(aLeft,   utScreenPixels, pprtHorizontal, nil),
               ppToMMThousandths(aTop,    utScreenPixels, pprtVertical,   nil),
               ppToMMThousandths(aWidth,  utScreenPixels, pprtHorizontal, nil),
               ppToMMThousandths(aHeight, utScreenPixels, pprtVertical,   nil) );

end;

{------------------------------------------------------------------------------}
{ TppPrintable.mmSetBounds }

procedure TppPrintable.mmSetBounds(aLeft, aTop, aWidth, aHeight: LongInt);
begin

  FLeft   := aLeft;
  FTop    := aTop;
  FWidth  := aWidth;
  FHeight := aHeight;

  {notify report designer}
  BoundsChange;

  {notify report engine}
  Reset;

end; {procedure, SetBounds}

{------------------------------------------------------------------------------}
{ TppPrintable.Convert }

procedure TppPrintable.Convert(aVersionNo: Integer);
begin

  if (aVersionNo < 1270) then
    FDataField := FReportField;

  {convert properties from screen pixels to mmthousandths}
  if (aVersionNo < 2097) then
    begin
      FLeft   := ppToMMThousandths(FLeft,   utScreenPixels, pprtHorizontal, nil);
      FTop    := ppToMMThousandths(FTop,    utScreenPixels, pprtVertical,   nil);
      FWidth  := ppToMMThousandths(FWidth,  utScreenPixels, pprtHorizontal, nil);
      FHeight := ppToMMThousandths(FHeight, utScreenPixels, pprtVertical,   nil);
    end;

  if (aVersionNo < 3530) then
    UserName := Name;


end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppPrintable.SetUnits }

procedure TppPrintable.SetUnits(aUnits: TppUnitType);
begin
  FUnits := aUnits;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.GetLeft }

function TppPrintable.GetLeft: Single;

begin

  Result := ppFromMMThousandths(FLeft, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetLeft}

{------------------------------------------------------------------------------}
{ TppPrintable.SetLeft }

procedure TppPrintable.SetLeft(Value: Single);
begin

  {used for conversion to 3.0}
  if (csReading in ComponentState) then
    FLeft := Trunc(Value)
  else
    SetMMLeft( ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter) );

end;  {procedure, SetLeft}

{------------------------------------------------------------------------------}
{ TppPrintable.SetMMLeft }

procedure TppPrintable.SetMMLeft(Value: LongInt);
begin

  FLeft := Value;

  {notify report designer}
  BoundsChange;

  {notify report engine}
  Reset;

end; {procedure, SetMMLeft}

{------------------------------------------------------------------------------}
{ TppPrintable.GetTop }

function TppPrintable.GetTop: Single;
begin

  Result := ppFromMMThousandths(FTop, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetTop}

{------------------------------------------------------------------------------}
{ TppPrintable.SetTop }

procedure TppPrintable.SetTop(Value: Single);
begin

  {used for conversion to 3.0}
  if (csReading in ComponentState) then
    FTop := Trunc(Value)
  else
    SetMMTop(ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter));

end; {procedure, SetTop}

{------------------------------------------------------------------------------}
{ TppPrintable.SetMMTop }

procedure TppPrintable.SetMMTop(Value: Longint);
begin

  FTop := Value;

  {notify report designer}
  BoundsChange;

  {notify report engine}
  Reset;

end; {procedure, SetMMTop}

{------------------------------------------------------------------------------}
{ TppPrintable.GetWidth }

function TppPrintable.GetWidth: Single;
begin

  Result := ppFromMMThousandths(FWidth, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetWidth}

{------------------------------------------------------------------------------}
{ TppPrintable.SetWidth }

procedure TppPrintable.SetWidth(Value: Single);
begin

  {used for conversion to 3.0}
  if (csReading in ComponentState) then
    FWidth := Trunc(Value)
  else
    SetMMWidth(ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter));

end; {procedure, SetWidth}

{------------------------------------------------------------------------------}
{ TppPrintable.SetMMWidth }

procedure TppPrintable.SetMMWidth(Value: Longint);
begin

  FWidth := Value;

  BoundsChange;

  {notify report engine}
  Reset;

end; {procedure, SetMMWidth}

{------------------------------------------------------------------------------}
{ TppPrintable.GetHeight }

function TppPrintable.GetHeight: Single;
begin

  Result := ppFromMMThousandths(FHeight, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetHeight}

{------------------------------------------------------------------------------}
{ TppPrintable.SetHeight }

procedure TppPrintable.SetHeight(Value: Single);
begin

 {used for conversion to 3.0}
  if (csReading in ComponentState) then
    FHeight := Trunc(Value)
  else
    SetMMHeight(ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter));

end; {procedure, SetHeight}

{------------------------------------------------------------------------------}
{ TppPrintable.SetMMHeight }

procedure TppPrintable.SetMMHeight(Value: Longint);
begin

  FHeight := Value;

  {notify report designer}
  BoundsChange;

  {notify report engine}
  Reset;

end; {procedure, SetMMHeight}

{------------------------------------------------------------------------------}
{ TppPrintable.GetScreenPixelLeft }

function TppPrintable.GetScreenPixelLeft: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FLeft, utScreenPixels, pprtHorizontal, nil));

end; {procedure, GetScreenPixelLeft}

{------------------------------------------------------------------------------}
{ TppPrintable.GetScreenPixelTop }

function TppPrintable.GetScreenPixelTop: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FTop, utScreenPixels, pprtVertical, nil));

end; {procedure, GetScreenPixelTop}

{------------------------------------------------------------------------------}
{ TppPrintable.GetScreenPixelWidth }

function TppPrintable.GetScreenPixelWidth: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FWidth, utScreenPixels, pprtHorizontal, nil));

end; {procedure, GetScreenPixelWidth}

{------------------------------------------------------------------------------}
{ TppPrintable.GetScreenPixelHeight }

function TppPrintable.GetScreenPixelHeight: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FHeight, utScreenPixels, pprtVertical, nil));

end; {procedure, GetScreenPixelHeight}

{------------------------------------------------------------------------------}
{ TppPrintable.SetScreenPixelLeft }

procedure TppPrintable.SetScreenPixelLeft(Value: Integer);
begin
  SetMMLeft( ppToMMThousandths(Value, utScreenPixels, pprtHorizontal, nil) );
end; {procedure, SetScreenPixelLeft}

{------------------------------------------------------------------------------}
{ TppPrintable.SetScreenPixelTop }

procedure TppPrintable.SetScreenPixelTop(Value: Integer);
begin
  SetMMTop( ppToMMThousandths(Value, utScreenPixels, pprtVertical, nil) );
end; {procedure, SetScreenPixelTop}

{------------------------------------------------------------------------------}
{ TppPrintable.SetScreenPixelWidth }

procedure TppPrintable.SetScreenPixelWidth(Value: Integer);
begin
  SetMMWidth( ppToMMThousandths(Value, utScreenPixels, pprtHorizontal, nil) );
end; {procedure, SetScreenPixelWidth}

{------------------------------------------------------------------------------}
{ TppPrintable.SetScreenPixelHeight }

procedure TppPrintable.SetScreenPixelHeight(Value: Integer);
begin
  SetMMHeight( ppToMMThousandths(Value, utScreenPixels, pprtVertical, nil) );
end; {procedure, SetScreenPixelHeight}

{------------------------------------------------------------------------------}
{ TppPrintable.DefineProperties}

procedure TppPrintable.DefineProperties(Filer: TFiler);
var
  lAncestor: TppPrintable;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}
  if (Filer.Ancestor is TppPrintable) then
    lAncestor := TppPrintable(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}
  lAncestor := nil;
{$ENDIF}

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmHeight', ReadHeight, WriteHeight, FHeight <> lAncestor.FHeight);
      Filer.DefineProperty('mmLeft', ReadLeft, WriteLeft, FLeft <> lAncestor.FLeft);
      Filer.DefineProperty('mmTop', ReadTop, WriteTop, FTop <> lAncestor.FTop);
      Filer.DefineProperty('mmWidth', ReadWidth, WriteWidth, FWidth <> lAncestor.FWidth);
    end
  else
    begin
      Filer.DefineProperty('mmHeight', ReadHeight, WriteHeight, True);
      Filer.DefineProperty('mmLeft', ReadLeft, WriteLeft, True);
      Filer.DefineProperty('mmTop', ReadTop, WriteTop, True);
      Filer.DefineProperty('mmWidth', ReadWidth, WriteWidth, True);
    end;


  {used for conversion to 3.0}
  Filer.DefineProperty('DataSource', ReadDataSource, nil, False);
  Filer.DefineProperty('OnFormatText', ReadOnFormatText, nil, False);
  Filer.DefineProperty('Region', ReadRegion, nil, False);
  Filer.DefineProperty('ReportField', ReadReportField, nil, False);
  Filer.DefineProperty('ParentDataSource', ReadParentDataSource, nil, False);

end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadLeft }

procedure TppPrintable.ReadLeft(Reader: TReader);
begin
  FLeft := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadHeight }

procedure TppPrintable.ReadHeight(Reader: TReader);
begin
  FHeight := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadRegion }

procedure TppPrintable.ReadRegion(Reader: TReader);
begin
  Reader.ReadIdent;
end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadTop }

procedure TppPrintable.ReadTop(Reader: TReader);
begin
  FTop := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadWidth }

procedure TppPrintable.ReadWidth(Reader: TReader);
begin
  FWidth := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.WriteLeft }

procedure TppPrintable.WriteLeft(Writer: TWriter);
begin
  Writer.WriteInteger(FLeft);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.WriteHeight}

procedure TppPrintable.WriteHeight(Writer: TWriter);
begin
  Writer.WriteInteger(FHeight);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.WriteTop}

procedure TppPrintable.WriteTop(Writer: TWriter);
begin
  Writer.WriteInteger(FTop);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.WriteWidth}

procedure TppPrintable.WriteWidth(Writer: TWriter);
begin
  Writer.WriteInteger(FWidth);
end;

{------------------------------------------------------------------------------}
{ TppPrintable.ReadOnFormatText }

procedure TppPrintable.ReadOnFormatText(Reader: TReader);
begin

  Reader.ReadIdent;

end; {procedure, ReadOnFormatText}

{------------------------------------------------------------------------------}
{ TppPrintable.ReadReportField }

procedure TppPrintable.ReadReportField(Reader: TReader);
begin

  FReportField := Reader.ReadString;

end; {procedure, ReadReportField}

{------------------------------------------------------------------------------}
{ TppPrintable.ReadParentDataSource }

procedure TppPrintable.ReadParentDataSource(Reader: TReader);
begin

  {eat the value}
  Reader.ReadBoolean;

end; {procedure, ReadParentDataSource}

{------------------------------------------------------------------------------}
{ TppPrintable.ReadDataSource }

procedure TppPrintable.ReadDataSource(Reader: TReader);
begin

  {eat the value}
  FDataSource := Reader.ReadIdent;

end; {procedure, ReadDataSource}

{------------------------------------------------------------------------------}
{ TppPrintable.PageStart }

procedure TppPrintable.PageStart;
begin

end; {procedure, PageStart}


{******************************************************************************
 *
 ** P R I N T A B L E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppPrintableRTTI.RefClass }

class function TraTppPrintableRTTI.RefClass: TClass;
begin
  Result := TppPrintable;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppPrintableRTTI.GetEventList }

class procedure TraTppPrintableRTTI.GetEventList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetEventList(aClass, aPropList);

  aPropList.RemoveProp('OnDrawCommandClick');
  aPropList.RemoveProp('OnDrawCommandCreate');

end; {class procedure, GetEventList}

{------------------------------------------------------------------------------}
{ TraTppPrintableRTTI.GetPropRec }

class function TraTppPrintableRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if (CompareText(aPropName, 'OnPrint') = 0) then
    EventToRec(aPropName, ciComponentPrint, False, aPropRec)

    
  {properties & methods}
  else if (CompareText(aPropName, 'Alignment') = 0) then
    EnumPropToRec(aPropName, 'TAlignment', False, aPropRec)

  else if (CompareText(aPropName, 'AutoSize') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Caption') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'DataField') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'DataPipeline') = 0) then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if (CompareText(aPropName, 'DefaultPropHint') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'DefaultPropName') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'DefaultPropEditType') = 0) then
    EnumPropToRec(aPropName, 'TppPropEditType', True, aPropRec)

  else if (CompareText(aPropName, 'Description') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'DesignControl') = 0) then
    ClassPropToRec(aPropName, TppDesignControl, False, aPropRec)

  else if (CompareText(aPropName, 'DrawComponent') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'Font') = 0) then
    ClassPropToRec(aPropName, TFont, False, aPropRec)

  else if (CompareText(aPropName, 'GenerationComplete') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'Height') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'Left') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'LookupPipeline') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'mmLeft') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'mmHeight') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'mmTop') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'mmWidth') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'OutOfSpace') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'OverFlow') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'ParentHeight') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'ParentWidth') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'ReprintOnOverFlow') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'ResetOnCompute') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'SelectionObject') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if (CompareText(aPropName, 'ShiftWithParent') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'SpaceUsed') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'spLeft') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'spHeight') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'spTop') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'spWidth') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'StretchWithParent') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Text') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Top') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'Units') = 0) then
    EnumPropToRec(aPropName, 'TppUnitType', False, aPropRec)

  else if (CompareText(aPropName, 'Visible') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Width') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'WordWrap') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'ZOrder') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppPrintableRTTI.GetPropValue }

class function TraTppPrintableRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Alignment') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).Alignment)

  else if (CompareText(aPropName, 'AutoSize') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).AutoSize)

  else if (CompareText(aPropName, 'Caption') = 0) then
    String(aValue) := TppPrintable(aObject).Caption

  else if (CompareText(aPropName, 'DataField') = 0) then
    String(aValue) := TppPrintable(aObject).DataField

  else if (CompareText(aPropName, 'DataPipeline') = 0) then
    Integer(aValue) := Integer(TppPrintable(aObject).DataPipeline)

  else if (CompareText(aPropName, 'DefaultPropHint') = 0) then
    String(aValue) := TppPrintable(aObject).DefaultPropHint

  else if (CompareText(aPropName, 'DefaultPropName') = 0) then
    String(aValue) := TppPrintable(aObject).DefaultPropName

  else if (CompareText(aPropName, 'DefaultPropEditType') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).DefaultPropEditType)

  else if (CompareText(aPropName, 'Description') = 0) then
    String(aValue) := TppPrintable(aObject).Description

  else if (CompareText(aPropName, 'DesignControl') = 0) then
    Integer(aValue) := Integer(TppPrintable(aObject).DesignControl)

  else if (CompareText(aPropName, 'DrawComponent') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).DrawComponent)

  else if (CompareText(aPropName, 'Font') = 0) then
    Integer(aValue) := Integer(TppPrintable(aObject).Font)

  else if (CompareText(aPropName, 'GenerationComplete') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).GenerationComplete)

  else if (CompareText(aPropName, 'Height') = 0) then
    Single(aValue) := TppPrintable(aObject).Height

  else if (CompareText(aPropName, 'Left') = 0) then
    Single(aValue) := TppPrintable(aObject).Left

  else if (CompareText(aPropName, 'LookupPipeline') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).LookupPipeline)

  else if (CompareText(aPropName, 'mmLeft') = 0) then
    Integer(aValue) := TppPrintable(aObject).mmLeft

  else if (CompareText(aPropName, 'mmHeight') = 0) then
    Integer(aValue) := TppPrintable(aObject).mmHeight

  else if (CompareText(aPropName, 'mmTop') = 0) then
     Integer(aValue) := TppPrintable(aObject).mmTop

  else if (CompareText(aPropName, 'mmWidth') = 0) then
    Integer(aValue) := TppPrintable(aObject).mmWidth

  else if (CompareText(aPropName, 'OutOfSpace') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).OutOfSpace)

  else if (CompareText(aPropName, 'OverFlow') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).OverFlow)

  else if (CompareText(aPropName, 'ParentHeight') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).ParentHeight)

  else if (CompareText(aPropName, 'ParentWidth') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).ParentWidth)

  else if (CompareText(aPropName, 'ReprintOnOverFlow') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).ReprintOnOverFlow)

  else if (CompareText(aPropName, 'ResetOnCompute') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).ResetOnCompute)

  else if (CompareText(aPropName, 'SelectionObject') = 0) then
    Integer(aValue) := Integer(TppPrintable(aObject).SelectionObject)

  else if (CompareText(aPropName, 'ShiftWithParent') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).ShiftWithParent)

  else if (CompareText(aPropName, 'SpaceUsed') = 0) then
    Integer(aValue) := TppPrintable(aObject).SpaceUsed

  else if (CompareText(aPropName, 'spLeft') = 0) then
    Integer(aValue) := TppPrintable(aObject).spLeft

  else if (CompareText(aPropName, 'spHeight') = 0) then
    Integer(aValue) := TppPrintable(aObject).spHeight

  else if (CompareText(aPropName, 'spTop') = 0) then
    Integer(aValue) := TppPrintable(aObject).spTop

  else if (CompareText(aPropName, 'spWidth') = 0) then
    Integer(aValue) := TppPrintable(aObject).spWidth

  else if (CompareText(aPropName, 'StretchWithParent') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).StretchWithParent)

  else if (CompareText(aPropName, 'Text') = 0) then
    String(aValue) := TppPrintable(aObject).Text

  else if (CompareText(aPropName, 'Top') = 0) then
    Single(aValue) := TppPrintable(aObject).Top

  else if (CompareText(aPropName, 'Units') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).Units)

  else if (CompareText(aPropName, 'Visible') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).Visible)

  else if (CompareText(aPropName, 'Width') = 0) then
    Single(aValue) := TppPrintable(aObject).Width

  else if (CompareText(aPropName, 'WordWrap') = 0) then
    Integer(aValue) := Ord(TppPrintable(aObject).WordWrap)

  else if (CompareText(aPropName, 'ZOrder') = 0) then
    Integer(aValue) := TppPrintable(aObject).ZOrder

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppPrintableRTTI.SetPropValue }

class function TraTppPrintableRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Alignment') = 0) then
    TppPrintable(aObject).Alignment := TAlignment(aValue)

  else if (CompareText(aPropName, 'AutoSize') = 0) then
    TppPrintable(aObject).AutoSize := Boolean(aValue)

  else if (CompareText(aPropName, 'Caption') = 0) then
    TppPrintable(aObject).Caption := String(aValue)

  else if (CompareText(aPropName, 'DataField') = 0) then
    TppPrintable(aObject).DataField := String(aValue)

  else if (CompareText(aPropName, 'DataPipeline') = 0) then
    TppPrintable(aObject).DataPipeline := TppDataPipeline(aValue)

  else if (CompareText(aPropName, 'Font') = 0) then
    TppPrintable(aObject).Font := TFont(aValue)

  else if (CompareText(aPropName, 'Height') = 0) then
    TppPrintable(aObject).Height := Single(aValue)

  else if (CompareText(aPropName, 'Left') = 0) then
    TppPrintable(aObject).Left := Single(aValue)

  else if (CompareText(aPropName, 'ParentHeight') = 0) then
    TppPrintable(aObject).ParentHeight := Boolean(aValue)

  else if (CompareText(aPropName, 'ParentWidth') = 0) then
    TppPrintable(aObject).ParentWidth := Boolean(aValue)

  else if (CompareText(aPropName, 'ReprintOnOverFlow') = 0) then
    TppPrintable(aObject).ReprintOnOverFlow := Boolean(aValue)

  else if (CompareText(aPropName, 'ShiftWithParent') = 0) then
    TppPrintable(aObject).ShiftWithParent := Boolean(aValue)

  else if (CompareText(aPropName, 'spLeft') = 0) then
    TppPrintable(aObject).spLeft := Integer(aValue)

  else if (CompareText(aPropName, 'spHeight') = 0) then
    TppPrintable(aObject).spHeight := Integer(aValue)

  else if (CompareText(aPropName, 'spTop') = 0) then
    TppPrintable(aObject).spTop := Integer(aValue)

  else if (CompareText(aPropName, 'spWidth') = 0) then
    TppPrintable(aObject).spWidth := Integer(aValue)

  else if (CompareText(aPropName, 'StretchWithParent') = 0) then
    TppPrintable(aObject).StretchWithParent := Boolean(aValue)

  else if (CompareText(aPropName, 'Text') = 0) then
    TppPrintable(aObject).Text := String(aValue)

  else if (CompareText(aPropName, 'Top') = 0) then
    TppPrintable(aObject).Top := Single(aValue)

  else if (CompareText(aPropName, 'Units') = 0) then
    TppPrintable(aObject).Units := TppUnitType(aValue)

  else if (CompareText(aPropName, 'Visible') = 0) then
    TppPrintable(aObject).Visible := Boolean(aValue)

  else if (CompareText(aPropName, 'Width') = 0) then
    TppPrintable(aObject).Width := Single(aValue)

  else if (CompareText(aPropName, 'WordWrap') = 0) then
    TppPrintable(aObject).WordWrap := Boolean(aValue)
    
  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}



initialization

  raRegisterRTTI(TraTppPrintableRTTI);

finalization

  raUnRegisterRTTI(TraTppPrintableRTTI);

end.
