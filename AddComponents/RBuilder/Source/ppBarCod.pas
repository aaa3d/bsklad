{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppBarCod;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ppClass, ppCtrls, ppTypes, ppUtils, ppDevice, ppDrwCmd, ppDB, ppPrnabl, ppComm,
  ppDsgnCt, ppRTTI;

type
  EBarCodeError = class(Exception);

  { TppCustomBarCode }
  TppCustomBarCode = class(TppCustomComponent)
  private
    FAddOnCode         : string;
    FAutoEncode        : boolean;
    FAutoSizeFont      : Boolean;
    FAutoWidth         : Longint;
    FAutoHeight        : Longint;
    FBarCodeType       : TppBarCodeType;
    FBarColor          : TColor;
    FBarWidth          : Longint;
    FBearerBars        : Boolean;
    FCalcCheckDigit    : Boolean;
    FData              : string;
    FDrawCommand       : TppDrawBarCode;
    FOrientation       : TppBarCodeOrientation;
    FBarCodeImage      : TBitmap;
    FPrintHumanReadable: Boolean;
    FWideBarRatio      : Longint;

    FCodeOk            : Boolean;

    FPainting: Boolean;

    procedure BarCodeChangeEvent(Sender: TObject);
    procedure CalcSize(aDeviceClass: TppDeviceClass);
    function  IsValidData(aData: String): Boolean;

    function  GetBarWidth: Single;
    function  GetWideBarRatio: Single;
    procedure SetAddOnCode(Value: string);
    procedure SetAutoEncode(Value : boolean);
    procedure SetAutoSizeFont(Value: Boolean);
    procedure SetBarColor(Value: TColor);
    procedure SetBarWidth(Value: Single);
    procedure SetBearerBars(Value: Boolean);
    procedure SetCalcCheckDigit(Value: Boolean);
    procedure SetData(Value: string);
    procedure SetOrientation(Value: TppBarCodeOrientation);
    procedure SetPrintHumanReadable(Value: Boolean);
    procedure SetWideBarRatio(Value: Single);

    {read/write private properties}
    procedure ReadBarWidth(Reader: TReader);
    procedure WriteBarWidth(Writer: TWriter);
    procedure ReadWideBarRatio(Reader: TReader);
    procedure WriteWideBarRatio(Writer: TWriter);

  protected

    {override from TComponent}
    procedure DefineProperties(Filer: TFiler); override;

    procedure AdjustBounds; override;
    procedure BoundsChange; override;
    function  CanOptimizeDesignPainting: Boolean; override;
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    procedure DisplayMessage(aMessage: String); virtual;
    procedure DrawBarCode;
    procedure FontChanged(Sender: TObject); override;
    function  GetCaption: String; override;
    function  GetData: String; virtual;
    function  GetDefaultData: string;
    function  GetDefaultPropHint: String; override;
    procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
    procedure SetAutoSize(Value: Boolean); override;
    procedure SetBarCodeType(Value: TppBarCodeType); virtual;
    procedure SetCaption(Value: String); override;
    procedure SetFont(Value: TFont); override;

    {popup menu event handlers}
    procedure ConfigureMenuClick(Sender: TObject);

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure PaintDesignControl(aCanvas: TCanvas); override;
    procedure PopupMenuClick(Sender: TObject); override;

    property AddOnCode: string read FAddOnCode write SetAddOnCode;
    property AutoEncode: boolean read FAutoEncode write SetAutoEncode default False;
    property AutoSizeFont: Boolean read FAutoSizeFont write SetAutoSizeFont default True;
    property BarCodeType: TppBarCodeType read FBarCodeType write SetBarCodeType;
    property BarColor: TColor read FBarColor write SetBarColor;
    property BarWidth: Single read GetBarWidth write SetBarWidth stored False;
    property BearerBars: Boolean read FBearerBars write SetBearerBars default False;
    property CalcCheckDigit: Boolean read FCalcCheckDigit write SetCalcCheckDigit default True;
    property Data: string read GetData write SetData;
    property Orientation: TppBarCodeOrientation read FOrientation write SetOrientation default orLeftToRight;
    property PrintHumanReadable: Boolean read FPrintHumanReadable write SetPrintHumanReadable default True;
    property WideBarRatio: Single read GetWideBarRatio write SetWideBarRatio;

    property Color;
    property Font;
    property Visible;
  end; {class, TppCustomBarCode}


  { TppBarCode }
  TppBarCode = class(TppCustomBarCode)
    protected
    {  procedure SetBarCodeType(Value: TppBarCodeType); override;}
    public
      constructor Create(AOwner: TComponent); override;

    published
      property AddOnCode;
      property AutoEncode;
      property AutoSizeFont;
      property BarCodeType;
      property BarColor;
      property BarWidth stored False;
      property BearerBars;
      property CalcCheckDigit;
      property Data;
      property Orientation;
      property PrintHumanReadable;
      property WideBarRatio stored False;

      property Alignment;
      property AutoSize default True;
      property Color;
      property Font;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property Transparent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

    end; {class, TppBarCode}


  { TppDBBarCode }
  TppDBBarCode = class(TppCustomBarCode)
    protected
      function  GetData: String; override;
      procedure SetCaption(Value: String); override;
      procedure SetDataField(const Value: String); override;

    public
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  IsDataAware: Boolean; override;

    published
      property AddOnCode;
      property AutoEncode;
      property AutoSizeFont;
      property BarCodeType;
      property BarColor;
      property BarWidth stored False;
      property BearerBars;
      property CalcCheckDigit;
      property DataField;
      property DataPipeline;
      property Orientation;
      property PrintHumanReadable;
      property WideBarRatio stored False;

      property Alignment;
      property AutoSize default True;
      property Color;
      property Font;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property Transparent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

    end; {class, TppDBBarCode}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppBarCodeRTTI }
  TraTppBarCodeRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppBarCodeRTTI}


implementation

uses
  ppForms, ppPrintr, ppPrnDev, ppViewr;


{******************************************************************************
 *
 **  C U S T O M   B A R C O D E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.Create}

constructor TppCustomBarCode.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FAutoEncode := False;
  FAutoSizeFont := True;
  FAddOnCode := '';
  FBarCodeType := bcCode39;
  FBarCodeImage := nil;
  FData := '';
  FDrawCommand := nil;
  FBarColor := clBlack;
  FBarWidth := ppToMMThousandths(0.010, utInches, pprtHorizontal, nil);
  FBearerBars := False;
  FCalcCheckDigit := True;
  Color := clWhite;
  FOrientation := orLeftToRight;
  FPrintHumanReadable := True;
  FWideBarRatio := ppToMMThousandths(3, utInches, pprtHorizontal, nil);

  {assign default properties}
  Font.Name := 'Courier New';
  FData := 'Barcode';

  SetMMWidth(ppToMMThousandths(1.53,  utInches, pprtHorizontal, nil));
  SetMMHeight(ppToMMThousandths(0.5083, utInches, pprtVertical, nil));

  AutoSize := True;

  {need to set this last}
  FCodeOK := True;
  
  DrawCommandClass := TppDrawBarCode;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.Destroy}

destructor TppCustomBarCode.Destroy;
begin

  FDrawCommand.Free;

  FBarCodeImage.Free;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetDefaultPropHint }

function TppCustomBarCode.GetDefaultPropHint: String;
begin
  Result := ppLoadStr(694); {'Data to be encoded'}
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.PropertiesToDrawCommand }

procedure TppCustomBarCode.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawBarCode: TppDrawBarCode;


begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawBarCode) then Exit;

  lDrawBarCode := TppDrawBarCode(aDrawCommand);

  {create print object}
  lDrawBarCode.Left   := PrintPosRect.Left;
  lDrawBarCode.Top    := PrintPosRect.Top;
  lDrawBarCode.Height := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawBarCode.Width  := PrintPosRect.Right  - PrintPosRect.Left;

  lDrawBarCode.Alignment         := Alignment;
  lDrawBarCode.AddOnCode         := FAddOnCode;
  lDrawBarCode.AutoEncode        := FAutoEncode;
  lDrawBarCode.AutoSize          := AutoSize;
  lDrawBarCode.AutoSizeFont      := AutoSizeFont;
  lDrawBarCode.BarCodeType       := FBarCodeType;
  lDrawBarCode.BarColor          := FBarColor;
  lDrawBarCode.BarWidth          := FBarWidth;
  lDrawBarCode.BearerBars        := FBearerBars;
  lDrawBarCode.CalcCheckDigit    := FCalcCheckDigit;
  lDrawBarCode.CodeOK            := FCodeOK;
  lDrawBarCode.Color             := Color;
  lDrawBarCode.Data              := GetData;
  lDrawBarCode.Font              := Font;
  lDrawBarCode.Orientation       := FOrientation;
  lDrawBarCode.PrintHumanReadable:= FPrintHumanReadable;
  lDrawBarCode.Transparent       := Transparent;
  lDrawBarCode.WideBarRatio      := WideBarRatio;


end; {procedure, PropertiesToDrawCommand}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.PaintDesignControl }

procedure TppCustomBarCode.PaintDesignControl(aCanvas: TCanvas);
begin

  FPainting    := True;

  try

    DrawBarCode;

    if (pppcDesigning in DesignState) and not FCodeOk  then
      begin
        aCanvas.Pen.Style   := psDash;
        aCanvas.Brush.Style := bsClear;
        aCanvas.Rectangle(0, 0, spWidth, spHeight);

      end;


  finally

    FPainting := False;

  end;

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.DrawBarCode }

procedure TppCustomBarCode.DrawBarCode;
var
  lPixelsPerInch: TPoint;
  lCanvas: TCanvas;
  lClientRect: TRect;
  lPrinter: TppPrinter;

begin

  {calc size of a screen based barcode}
  CalcSize(TppPrinterDevice);

  lClientRect.TopLeft := Point(0,0);

  lPrinter := GetPrinter;

      {adjust size}
      if FOrientation in [orLeftToRight, orRightToLeft] then
        begin

          lClientRect.Right := ppToScreenPixels(FDrawCommand.PortraitWidth,
                                      utPrinterPixels, pprtHorizontal, lPrinter);

          lClientRect.Bottom := spHeight;
        end
      else
        begin

          lClientRect.Right := spWidth;

          lClientRect.Bottom := ppToScreenPixels(FDrawCommand.PortraitWidth,
                                      utPrinterPixels, pprtVertical, lPrinter);
        end;


  {calc size of a screen based barcode}
  CalcSize(TppScreenDevice);

  if FBarCodeImage = nil then
    FBarCodeImage := TBitmap.Create;

  {size the offscreen bitmap}
  if FOrientation in [orLeftToRight, orRightToLeft] then
    begin
      FBarCodeImage.Width  := FDrawCommand.PortraitWidth;
      FBarCodeImage.Height := FDrawCommand.PortraitHeight;
    end
  else
     begin
      FBarCodeImage.Width  := FDrawCommand.PortraitHeight;
      FBarCodeImage.Height := FDrawCommand.PortraitWidth;
    end;

  {stretchdraw the offscreen image to the design canvas}
  lCanvas := GetDesignCanvas;
  lPixelsPerInch.X := Screen.PixelsPerInch;
  lPixelsPerInch.Y := Screen.PixelsPerInch;

  PatBlt(FBarCodeImage.Canvas.Handle, 0, 0, FBarCodeImage.Width, FBarCodeImage.Height, WHITENESS);
  FDrawCommand.DrawBarcode(FBarCodeImage.Canvas, 0, 0, lPixelsPerInch, True);

  lCanvas.StretchDraw(lClientRect, FBarCodeImage);


end; {procedure, DrawBarCode}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.CalcSize }

procedure TppCustomBarCode.CalcSize(aDeviceClass: TppDeviceClass);
var
  lPosRect: TppRect;
  lCanvas: TCanvas;
  lPrinter: TppPrinter;

begin

  if FDrawCommand = nil then
    FDrawCommand := TppDrawBarCode.Create(nil);

  {set print position}
  lPosRect.Left   := 0;
  lPosRect.Top    := 0;
  lPosRect.Bottom := mmHeight;
  lPosRect.Right  := mmWidth;

  PrintPosRect := lPosRect;

  {assign draw command properties}
  PropertiesToDrawCommand(FDrawCommand);

  FDrawCommand.DrawLeft   := 0;
  FDrawCommand.DrawTop    := 0;
  FDrawCommand.DrawRight  := spWidth;
  FDrawCommand.DrawBottom := spHeight;

  if (aDeviceClass.InheritsFrom(TppScreenDevice)) then
    lPrinter := nil
  else
    lPrinter := GetPrinter;

  {calc size for either the screen or printer}
  if lPrinter = nil then
    lCanvas := GetDesignCanvas
  else
    lCanvas := lPrinter.Canvas;

  {calc barcode size}
  FDrawCommand.CalcBarCodeSize(lCanvas);

end;

{------------------------------------------------------------------------------}
{ TppCustomBarCode.AdjustBounds }

procedure TppCustomBarCode.AdjustBounds;
var
  lPrinter: TppPrinter;
  llPortraitWidth: Longint;
  llPortraitHeight: Longint;
  
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if AutoSize then
    begin

      {calc actual size required for the printer}
      CalcSize(TppPrinterDevice);


      {adjust control size}
     if FDrawCommand.CodeOk then
        begin

          {convert size from printer to screen}
          lPrinter := GetPrinter;
          llPortraitWidth  := ppToMMThousandths(FDrawCommand.PortraitWidth, utPrinterPixels, pprtHorizontal, lPrinter);
          llPortraitHeight := ppToMMThousandths(FDrawCommand.PortraitHeight, utPrinterPixels, pprtVertical, lPrinter);

          if FOrientation in [orLeftToRight, orRightToLeft] then
            begin
              FAutoWidth  :=  llPortraitWidth;
              FAutoHeight :=  llPortraitHeight;
            end
          else
            begin
              FAutoWidth  :=  llPortraitHeight;
              FAutoHeight :=  llPortraitWidth;
            end;

          mmSetBounds(mmLeft, mmTop, FAutoWidth, FAutoHeight);

        end;

  end;
  
  InvalidateDesignControl;

end; {procedure, AdjustBounds}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.BoundsChange}

procedure TppCustomBarCode.BoundsChange;
begin


{  if AutoSize and ((FAutoWidth <> mmWidth) or (FAutoHeight <> mmHeight)) and
     not (pppcPasting in DesignState) then
    AdjustBounds
  else }
    inherited BoundsChange;
    
end; {procedure, BoundsChange}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.CanOptimizeDesignPainting}

function TppCustomBarCode.CanOptimizeDesignPainting: Boolean;
begin
  {when transparent and font color is white, cannot optimize design control painting}
  Result := not (Transparent and (Font.Color = clWhite));
end; {function, CanOptimizeDesignPainting}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.FontChanged }

procedure TppCustomBarCode.FontChanged(Sender: TObject);
begin
  if BarColor <> Font.Color then
    SetBarColor(Font.Color);

  inherited FontChanged(Sender);

end; {FontChanged}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.DisplayMessage }

procedure TppCustomBarCode.DisplayMessage(aMessage: String);
begin
  if (csLoading in ComponentState) or (csReading in ComponentState) then Exit;

  if Printing then Exit;

  MessageDlg(aMessage, mtInformation, [mbOK], 0);


end; {procedure, DisplayMessage}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetData }

function TppCustomBarCode.GetData: string;
begin
  Result := FData;
end; {function, GetData}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetDefaultData }

function TppCustomBarCode.GetDefaultData: string;
begin

  case FBarCodeType of

      bcCode39 :

        if IsDataAware then
          Result := 'DBBarCode'
        else
          Result := 'BarCode';

      bcCode128 : Result := #210 + '1234' + #205 + ' abcd';

      bcEAN_13  : Result := '0012345678905';

      bcEAN_8 : Result := '20123451';

      bcInt2of5 : 
        if FCalcCheckDigit then
          Result := '0123456789'
        else
          Result := '012345678';

      bcPostNet : Result := '012345678';

      bcUPC_A :

        if FCalcCheckDigit then
          Result := '01234567890'
        else
          Result := '012345678905';

      bcUPC_E :
        if FCalcCheckDigit then
          Result := '0123456'
        else
          Result := '01234565';

      bcFIM :
        Result := 'A';

      bcCodabar :
        Result := 'A01234B';

      else
        Result := ''

    end; {case }

end; {function, GetDefaultData}



{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetAddOnCode }

procedure TppCustomBarCode.SetAddOnCode(Value: string);
begin

  if (FAddOnCode = Value) then Exit;

  {message: 'Only UPC and EAN barcodes can have add-on codes'}
  if (Value <> '') and (not (FBarCodeType in cPOSBarCodes)) then
    DisplayMessage(ppLoadStr(423))

  {message: 'Add-on codes must be either 2 or 5 digits'}
  else if not (Length(Value) in [0,2,5]) then
    DisplayMessage(ppLoadStr(424))

  else
    begin
      FAddOnCode := Value;
      AdjustBounds;
      PropertyChange;
    end;

end; {procedure, SetAddOnCode}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetAutoEncode }
procedure TppCustomBarCode.SetAutoEncode(Value : boolean);
begin
  if Value = FAutoEncode then Exit;
{ this condition needs to be here, because AutoEncode is by default FALSE, but we need
  it to be TRUE if the code being loaded is Code 128 without control characters }
  if (csReading in ComponentState)  or (csLoading in ComponentState) then
  begin
    FAutoEncode := Value;
    Exit;
  end;
  if (Value = TRUE) and (FBarCodeType <> bcCode128) then
  begin
    // NOTE:  Create message here!
    // Only Code 128 can be auto-encoded.
  end
  else
  begin
    FAutoEncode := Value;
    AdjustBounds;
    PropertyChange;
  end;
end; {procedure, SetAutoEncode}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetAutoSize }

procedure TppCustomBarCode.SetAutoSize(Value: Boolean);
begin
  // GF!
  // Change message to:  Postnet and FIM barcodes...
  {message: 'PostNet barcodes must have AutoSize = True'}
  if (Value = False) and (FBarCodeType in [bcPostNet, bcFIM]) then
    DisplayMessage(ppLoadStr(425))
  else
    inherited SetAutoSize(Value);

end; {procedure, SetAutoSize}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetAutoSizeFont }

procedure TppCustomBarCode.SetAutoSizeFont(Value: Boolean);
begin
  if Value = FAutoSizeFont then Exit;

  // GF!
// Note:  The following message should now read "EAN and UPC..."

  {message: 'EAN-13 and UPC-A barcodes must have AutoSizeFont = True'}
  if (Value = False) and (FBarCodeType in cPOSBarCodes) then
    DisplayMessage(ppLoadStr(426))

  else
    begin
      FAutoSizeFont := Value;
      AdjustBounds;
      PropertyChange;
    end;

end; {procedure, SetAutoSizeFont}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetBarCodeType }

procedure TppCustomBarCode.SetBarCodeType(Value: TppBarCodeType);
begin

  if (Value = FBarCodeType) then Exit;

  FBarCodeType := Value;

  if (csReading in ComponentState)  or (csLoading in ComponentState) then Exit;

  FData   := GetDefaultData;

  FCodeOk := True;

  if FBarCodeType in [bcPostNet, bcFIM] then
    begin

      AutoSize := True;
      PrintHumanReadable := False;

    end

  else if FBarCodeType in cPOSBarCodes then
    FAutoSizeFont := True

  else if FBarCodeType = bcCode128 then
    AutoEncode := True;



  case FBarCodeType of
    bcCode128         : FBarWidth := ppToMMThousandths(0.010, utInches, pprtHorizontal, nil);
    bcCode39          : FBarWidth := ppToMMThousandths(0.010, utInches, pprtHorizontal, nil);
    bcEAN_13, bcUPC_A,
    bcEAN_8, bcUPC_E : FBarWidth := ppToMMThousandths(0.013, utInches, pprtHorizontal, nil);
    bcInt2of5         : FBarWidth := ppToMMThousandths(0.015, utInches, pprtHorizontal, nil);
    bcPostnet         : FBarWidth := ppToMMThousandths(0.020, utInches, pprtHorizontal, nil);
    bcFIM             : FBarWidth := ppToMMThousandths(0.031 {1/32"}, utInches, pprtHorizontal, nil);
    bcCodabar         : FBarWidth := ppToMMThousandths(0.010, utInches, pprtHorizontal, nil);
  end;

  AdjustBounds;

  PropertyChange;

end; {procedure, SetBarCodeType}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetBarColor }

procedure TppCustomBarCode.SetBarColor(Value: TColor);

begin

  FBarColor := Value;

  if Font.Color <> FBarColor then
    Font.Color := FBarColor;
    
  InvalidateDesignControl;
  PropertyChange;


end; {procedure, SetBarColor}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetBarWidth }

function TppCustomBarCode.GetBarWidth: Single;
begin
   Result := ppFromMMThousandths(FBarWidth, Units, pprtHorizontal, GetPrinter);
end; {function, GetBarWidth}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetCaption }

function TppCustomBarCode.GetCaption: String;
begin

  Result := GetData;

end; {function GetCaption}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetBarWidth }

procedure TppCustomBarCode.SetBarWidth(Value: Single);
var
  llValue: Longint;
  llMin, llMax: Longint;
  lfMin, lfMax: Single;
  lsMessage: String;

begin


  lsMessage := '';
  llValue :=  ppToMMThousandths(Value, Units, pprtHorizontal, GetPrinter);

  if (llValue = FBarWidth) then Exit;

  if not (csLoading in ComponentState) then
    begin

      if ppInInches(llValue) < 0.004 then
        begin
          {message: 'BarWidth must be at least 0.004'}
          llMin     := ppToMMThousandths(0.004, utInches, pprtHorizontal, nil);
          lfMin     := ppFromMMThousandths(llMin, Units, pprtHorizontal, GetPrinter);
          lsMessage := ppLoadStr(427);
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [FloatToStr(lfMin)]);
        end

      else if ppInInches(llValue) > 0.10 then
        begin
          {message: 'BarWidth cannot exceeed 0.10'}
          llMax     := ppToMMThousandths(0.10, utInches, pprtHorizontal, nil);
          lfMax     := ppFromMMThousandths(llMax, Units, pprtHorizontal, GetPrinter);
          lsMessage := ppLoadStr(428);
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [FloatToStr(lfMax)]);
        end

    end;

  if lsMessage <> '' then
    DisplayMessage(lsMessage)
  else
    begin
      FBarWidth := llValue;
      AdjustBounds;
      PropertyChange;

    end;

end; {procedure, SetBarWidth}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetBearerBars }

procedure TppCustomBarCode.SetBearerBars(Value: Boolean);
begin

  if (FBearerBars = Value)  then Exit;

  {message: 'Only Interleaved 2 of 5 barcodes can have bearer bars'}
  if (Value = True) and (FBarCodeType <> bcInt2of5) then
    DisplayMessage(ppLoadStr(429))
  else
    begin
      FBearerBars := Value;
      AdjustBounds;
      PropertyChange;

    end;

end; {procedure, SetBearerBars}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetCalcCheckDigit }

procedure TppCustomBarCode.SetCalcCheckDigit(Value: Boolean);
begin

  if (Value = FCalcCheckDigit) then Exit;

  FCalcCheckDigit := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FCodeOk := IsValidData(FData);

  AdjustBounds;
  PropertyChange;

end; {procedure, SetCalcCheckDigit}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetCaption }

procedure TppCustomBarCode.SetCaption(Value: string);
begin
  SetData(Value);
end;  {procedure, SetCaption}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetData }

procedure TppCustomBarCode.SetData(Value: string);
begin

  if (FData = Value) then Exit;

  FData := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FCodeOk := IsValidData(Value);

  AdjustBounds;

  if not IsDataAware then
    PropertyChange;

end; {procedure, SetData}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetFont }

procedure TppCustomBarCode.SetFont(Value: TFont);
begin

  if (pppcCreating in DesignState) then Exit;

  inherited SetFont(Value);

end; {procedure, SetFont}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetOrientation }

procedure TppCustomBarCode.SetOrientation(Value: TppBarCodeOrientation);
begin

  FOrientation := Value;

  PropertyChange;

  AdjustBounds;

end; {procedure, SetOrientation}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetPrintHumanReadable }

procedure TppCustomBarCode.SetPrintHumanReadable(Value: Boolean);
begin
  FPrintHumanReadable := Value;

  PropertyChange;

  AdjustBounds;

end; {procedure, SetPrintHumanReadable}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.GetWideBarRatio }

function TppCustomBarCode.GetWideBarRatio: Single;
begin
  {hard-code to inches, since this is not a physical measurement, we're just
   storing it in thousandths of mm  so that it can be successfully streamed in D1}
  Result := ppFromMMThousandths(FWideBarRatio, utInches, pprtHorizontal, nil);
end; {function, GetWideBarRatio}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.SetWideBarRatio }

procedure TppCustomBarCode.SetWideBarRatio(Value: Single);
begin

  if (WideBarRatio = Value) or (Value <= 0) then Exit;

  FWideBarRatio := ppToMMThousandths(Value, Units, pprtHorizontal, GetPrinter);

  AdjustBounds;

  PropertyChange;

end; {procedure, SetWideBarRatio}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.IsValidData }

function TppCustomBarCode.IsValidData(aData: String): Boolean;
  const
    AlphaNumeric: set of char = ['A'..'Z','a'..'z','0'..'9',' ','$','%','+','-','.','/'];
    CodabarSet : set of char = ['A'..'D', 'a'..'d','0'..'9', '-', '$', ':', '/', '.', '+'];

  type
    SetOfChar = set of char;

  var
    RealLen: Integer;
    lsMessage: String;
    liChar: Integer;

    function IsNumeric(aString: string; aDashOk: Boolean): Boolean;

    var
      liChar  : Integer;
      AcceptSet: set of char;

    begin
      Result := True;
      AcceptSet := ['0'..'9'];
      if aDashOk then
        AcceptSet := AcceptSet + ['-'];
      for liChar := 1 to Length(aString) do
        if not (aString[liChar] in AcceptSet) then
          Result := False;
    end;

    function CountDashes(aString: string): Integer;

    var
      liChar: Integer;

    begin
      Result := 0;
      for liChar := 1 to Length(aString) do
        if aString[liChar] = '-' then
          Inc(Result);
    end;

  function MatchesSet(aString: string; aSet: SetOfChar): Boolean;
  var
    liChar  : Integer;

  begin
    Result := True;
    liChar := 1;
    while (liChar <= Length(aString)) and (Result) do
    begin
      if not (aString[liChar] in aSet) then
        Result := False;
      Inc(liChar);
    end;

  end;


  begin

    Result := False;

    lsMessage := '';

    if aData = '' then Exit;


    case FBarCodeType of
      bcCode39 :
        {message: 'Code 39 barcodes can only contain "A"-"Z", "0"-"9", "$", "%", "+", "-", ".", "/" or " "'}
        if not MatchesSet(aData, AlphaNumeric) then
          lsMessage := ppLoadStr(430);

      bcEAN_13 :
        begin
          {message: 'EAN-13 barcodes must be 12 digits (13 with check digit)'}
          if (Length(aData) < 12) or (Length(aData) > 13) then
            lsMessage := ppLoadStr(431)

          {message: 'EAN-13 barcodes must be 13 digits including the check digit'}
          else if (Length(aData) = 12) and (FCalcCheckDigit = False) then
            lsMessage := ppLoadStr(432)

          {message: 'EAN-13 barcodes must be numeric'}
          else if not IsNumeric(aData, False) then
            lsMessage := ppLoadStr(433)
        end;

      bcEAN_8 :
        begin
          {message: 'EAN-8 barcodes must be 7 digits (8 with check digit)'}
          if (Length(aData) < 7) or (Length(aData) > 8) then
            lsMessage := ppLoadStr(645)

          {message: 'EAN-8 barcodes must be 8 digits including the check digit'}
          else if (Length(aData) = 7) and (FCalcCheckDigit = False) then
            lsMessage := ppLoadStr(646)

          {message: 'EAN-8 barcodes must be numeric'}
          else if not IsNumeric(aData, False) then
            lsMessage := ppLoadStr(647);

        end;

      bcInt2of5 :
        begin
          {message: 'Interleaved 2 of 5 barcodes must be numeric'}
          if not IsNumeric(aData,False) then
            lsMessage := ppLoadStr(434)

          else if Odd(Length(aData)) and not FCalcCheckDigit then
            lsMessage := ppLoadStr(435);
        end;

      bcPostNet :
      begin
        RealLen := Length(aData) - CountDashes(aData);

        {message: 'PostNet barcodes must be numeric'}
        if not IsNumeric(aData,True) then
          lsMessage := ppLoadStr(436)

        {message: 'PostNet barcodes must be 5, 9, or 11 digits long'}
        else if (RealLen <> 5) and (RealLen <> 9) and (RealLen <> 11) then
          lsMessage := ppLoadStr(437);

      end;

      bcUPC_A :
        begin
          {message: 'UPC-A barcodes must be 11 digits (12 with check digit)'}
          if (Length(aData) < 11) or (Length(aData) > 12) then
            lsMessage := ppLoadStr(438)

          {message: 'UPC-A barcodes must be 12 digits including the check digit'}
          else if (Length(aData) = 11) and (FCalcCheckDigit = False) then
            lsMessage := ppLoadStr(439)

          {message: 'UPC-A barcodes must be numeric'}
          else if not IsNumeric(aData,False) then
            lsMessage := ppLoadStr(440);

        end;

      bcUPC_E :
        begin
          {message: 'UPC-E barcodes must be 6 digits (7 with check digit)'}
          if (Length(aData) < 6) or (Length(aData) > 7) then
            lsMessage := ppLoadStr(648)


          {message: 'UPC-E barcodes must be 7 digits including the check digit'}
          else if (Length(aData) = 6) and (FCalcCheckDigit = False) then
            lsMessage := ppLoadStr(649)

          {message: 'UPC-E barcodes must be numeric'}
          else if not IsNumeric(aData,False) then
            lsMessage := ppLoadStr(650);

        end;

      bcFIM :
        begin
          {message: 'The only valid choices for FIM codes are A, B, or C'}
          if (Length(aData) <> 1) or (not (Uppercase(aData)[1] in ['A','B','C']))  then
            lsMessage := ppLoadStr(651);
        end;

      bcCodabar :
        begin
          {message: 'Codabar can only encode 0-9, A, B, C, D, -, $, :, /, ., and +'}
          if not MatchesSet(aData, CodabarSet) then
            lsMessage := ppLoadStr(652)

          {message: 'A Codabar symbol must start and end with A, B, C, or D.'}
          else if not ((aData[1] in ['A'..'D','a'..'d']) and (aData[Length(aData)] in ['A'..'D','a'..'d'])) then
            lsMessage := ppLoadStr(653)

          else
            begin
              liChar := 2;

              while (liChar <= Length(aData) - 1) and (lsMessage = '') do
                begin
                  {message: 'Codabar can only encode 0-9, A, B, C, D, -, $, :, /, ., and +'
                            'They cannot appear anywhere in the middle of the data.'}
                  if aData[liChar] in ['A'..'D','a'..'d'] then
                    lsMessage := ppLoadStr(654) + ' '+ ppLoadStr(655)
                  else
                    Inc(liChar);
                end;
            end;

        end;
        
    end;

    Result := (lsMessage = '');

    if not Result then
      DisplayMessage(lsMessage);


end; {procedure, IsValidData}


{------------------------------------------------------------------------------}
{ TppCustomBarCode.CreatePopupMenu }

procedure TppCustomBarCode.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'AutoSize', '', 226); {'AutoSize'}
  aPopupMenu.AddItem(30, 'AutoSizeFont', '', 441); {'AutoSizeFont'}
  aPopupMenu.AddItem(30, 'Configure', '',  443);
  aPopupMenu.AddItem(30, 'PrintHumanReadable', '',  442);
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '',  238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '',  240);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.PopupMenuClick }

procedure TppCustomBarCode.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  {assign dialog event handler}
  TppPopupMenu(Sender).ItemByName('Configure').OnClick := ConfigureMenuClick;


end; {procedure, PopupMenuClick}



{------------------------------------------------------------------------------}
{ TppCustomBarCode.ConfigureMenuClick }

procedure TppCustomBarCode.ConfigureMenuClick(Sender: TObject);
var
  lBarCodeDlg: TppCustomBarCodeDialog;
  lFormClass: TFormClass;

begin
  if (Band = nil) or (Band.Report = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomBarCodeDialog);

  lBarCodeDlg := TppCustomBarCodeDialog(lFormClass.Create(Application));
  lBarCodeDlg.LanguageIndex := Band.LanguageIndex;
  lBarCodeDlg.Report        := Band.Report;
  lBarCodeDlg.Units         := Band.Report.Units;
  lBarCodeDlg.OnChange      := BarCodeChangeEvent;

  lBarCodeDlg.BarCodeType    := BarCodeType;
  lBarCodeDlg.Orientation    := Orientation;
  lBarCodeDlg.BarWidth       := BarWidth;
  lBarCodeDlg.WideBarRatio   := WideBarRatio;
  lBarCodeDlg.AddOnCode      := AddOnCode;
  lBarCodeDlg.BearerBars     := BearerBars;
  lBarCodeDlg.CalcCheckDigit := CalcCheckDigit;
  lBarCodeDlg.AutoEncode     := AutoEncode;

  {set format property}
  if (lBarCodeDlg.ShowModal = mrOK) then
    BarCodeChangeEvent(lBarCodeDlg);

  lBarCodeDlg.Release;

end; {procedure, ConfigureMenuClick}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.BarCodeChangeEvent }

procedure TppCustomBarCode.BarCodeChangeEvent(Sender: TObject);
var
  lBarCodeDlg: TppCustomBarCodeDialog;

begin
  if Sender is TppCustomBarCodeDialog then
    begin
      lBarCodeDlg    := TppCustomBarCodeDialog(Sender);

      BarCodeType    := lBarCodeDlg.BarCodeType;
      Orientation    := lBarCodeDlg.Orientation;
      BarWidth       := lBarCodeDlg.BarWidth;
      WideBarRatio   := lBarCodeDlg.WideBarRatio;
      AddOnCode      := lBarCodeDlg.AddOnCode;
      BearerBars     := lBarCodeDlg.BearerBars;
      CalcCheckDigit := lBarCodeDlg.CalcCheckDigit;
      AutoEncode     := lBarCodeDlg.AutoEncode;
    end;

end;  {procedure, BarCodeChangeEvent}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.DefineProperties}

procedure TppCustomBarCode.DefineProperties(Filer: TFiler);
var
  lAncestor: TppCustomBarCode;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}
  if (Filer.Ancestor is TppCustomBarCode) then
    lAncestor := TppCustomBarCode(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}

  lAncestor := nil;

{$ENDIF}

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmBarWidth', ReadBarWidth, WriteBarWidth, FBarWidth <> lAncestor.FBarWidth);
      Filer.DefineProperty('mmWideBarRatio', ReadWideBarRatio, WriteWideBarRatio, FWideBarRatio <> lAncestor.FWideBarRatio);
    end
  else
    begin
      Filer.DefineProperty('mmBarWidth', ReadBarWidth, WriteBarWidth, True);
      Filer.DefineProperty('mmWideBarRatio', ReadWideBarRatio, WriteWideBarRatio, True);
    end;

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppCustomBarCode.ReadBarWidth }

procedure TppCustomBarCode.ReadBarWidth(Reader: TReader);
begin
  FBarWidth := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppCustomBarCode.WriteBarWidth}

procedure TppCustomBarCode.WriteBarWidth(Writer: TWriter);
begin
  Writer.WriteInteger(FBarWidth);
end;

{------------------------------------------------------------------------------}
{ TppCustomBarCode.ReadWideBarRatio }

procedure TppCustomBarCode.ReadWideBarRatio(Reader: TReader);
begin
  FWideBarRatio := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppCustomBarCode.WriteWideBarRatio}

procedure TppCustomBarCode.WriteWideBarRatio(Writer: TWriter);
begin
  Writer.WriteInteger(FWideBarRatio);
end;

{******************************************************************************
 *
 **  B A R C O D E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBarCode.Create }

constructor TppBarCode.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DefaultPropName := 'Data';
  DefaultPropEditType := etEdit;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppBarCode.SetBarCodeType }

{procedure TppBarCode.SetBarCodeType(Value: TppBarCodeType);
begin

  inherited SetBarCodeType(Value);

  if (FBarCodeType = bcFIM) then
    DefaultPropEditType := etValueList
  else
    DefaultPropEditType := etEdit;

end; {procedure, SetBarCodeType}


{------------------------------------------------------------------------------}
{ TppBarCode.GetDefaultPropEnumNames }

{procedure TppBarCode.GetDefaultPropEnumNames(aList: TStrings);
begin




end; {procedure, GetDefaultPropEnumNames}



{******************************************************************************
 *
 **  D B   B A R C O D E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBBarCode.Notify }

procedure TppDBBarCode.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    Data := GetData;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBBarCode.IsDataAware }

function TppDBBarCode.IsDataAware: Boolean;
begin
  Result := True;
end; {function, IsDataAware}


{------------------------------------------------------------------------------}
{ TppDBBarCode.SetCaption }

procedure TppDBBarCode.SetCaption(Value: String);
begin

  {this will take of adjust bounds etc.}
  SetData(GetData);

end; {procedure, SetCaption}


{------------------------------------------------------------------------------}
{ TppDBBarCode.SetDataField }

procedure TppDBBarCode.SetDataField(const Value: String);
begin

  inherited SetDataField(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {this will set caption}
  Notify(DataPipeline, ppopDataChange);

end; {procedure, SetDataField}


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppDBBarCode.GetData }

function TppDBBarCode.GetData: string;
var
  lsText: String;
  lDataType: TppDataType;
  lValue: Variant;

begin

  if CheckForPipelineData then
    begin

      try
        lDataType := DataPipeline.GetFieldDataType(DataField);
      except
        lDataType := dtString;
      end;

      try

        lValue := DataPipeline.GetFieldValue(DataField);

        if (lValue <> Null) then
          lsText := ppFormat('', lDataType, lValue)
        else
          lsText := '';

      except on EDataError    do
        lsText := '';
             on EConvertError do
        lsText := '';
             on EVariantError do
        lsText := '';

      end; {try, except }

    end {get data }


  else if (Printing) then
    lsText := ''

  else {must be designing}

    begin

      {display default data}
      lsText := GetDefaultData;

    end;

  Result := lsText;

end; {function, GetData}

{$ELSE}

{------------------------------------------------------------------------------}
{ TppDBBarCode.GetData }

function TppDBBarCode.GetData: String;
var
  lsText: String;
  lDataType: TppDataType;
  lStringValue: String;
  lBooleanValue: Boolean;
  lIntegerValue: LongInt;
  lFloatValue: Double;
  lDateTimeValue: TDateTime;
  lbIsNull: Boolean;
  lPValue: Pointer;

begin

  if CheckForPipelineData then
    begin

     try
        lDataType := DataPipeline.GetFieldDataType(DataField);
      except
        lDataType := dtString;
      end;

      lsText := '';

      try

        case lDataType of
           dtBoolean:
             lPValue := @lBooleanValue;

           dtDate, dtTime, dtDateTime:
             lPValue := @lDateTimeValue;

           dtInteger, dtLongint:
             lPValue := @lIntegerValue;

           dtDouble:
             lPValue := @lFloatValue;

           dtString:
             lPValue := @lStringValue;

           else
             lPValue := nil;
        end;

        if lPValue <> nil then
          begin

            lbIsNull := False;
            DataPipeline.GetFieldValue(DataField, lPValue^, lbIsNull);

            if not lbIsNull then
             lsText := ppFormat('', lDataType, lPValue^);

          end;

      except on EDataError    do
        lsText := '';
             on EConvertError do
        lsText := '';
      end; {try, except }

    end {get data }


  else if (Printing) then
    lsText := ''

  else {must be designing}

    begin
      {display default data}
      lsText := GetDefaultData;
    end;

  Result := lsText;

end; {function, GetData}


{$ENDIF}

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
 ** B A R C O D E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppBarCodeRTTI.RefClass }

class function TraTppBarCodeRTTI.RefClass: TClass;
begin
  Result := TppBarCode;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppBarCodeRTTI.GetPropList }

class procedure TraTppBarCodeRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppBarCodeRTTI.GetPropRec }

class function TraTppBarCodeRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AddOnCode') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'AutoEncode') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'AutoSizeFont') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'BarCodeType') = 0) then
    EnumPropToRec(aPropName, 'TppBarCodeType', False, aPropRec)

  else if (CompareText(aPropName, 'BarColor') = 0) then
    EnumPropToRec(aPropName, 'TColor', False, aPropRec)

  else if (CompareText(aPropName, 'BarWidth') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'BearerBars') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'CalcCheckDigit') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Data') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Orientation') = 0) then
    EnumPropToRec(aPropName, 'TppBarCodeOrientation', False, aPropRec)

  else if (CompareText(aPropName, 'PrintHumanReadable') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'WideBarRatio') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppBarCodeRTTI.GetPropValue }

class function TraTppBarCodeRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AddOnCode') = 0) then
    String(aValue) := TppBarCode(aObject).AddOnCode

  else if (CompareText(aPropName, 'AutoEncode') = 0) then
    Boolean(aValue) := TppBarCode(aObject).AutoEncode

  else if (CompareText(aPropName, 'AutoSizeFont') = 0) then
    Boolean(aValue) := TppBarCode(aObject).AutoSizeFont

  else if (CompareText(aPropName, 'BarCodeType') = 0) then
    Integer(aValue) := Ord(TppBarCode(aObject).BarCodeType)

  else if (CompareText(aPropName, 'BarColor') = 0) then
    Integer(aValue) := Ord(TppBarCode(aObject).BarColor)

  else if (CompareText(aPropName, 'BarWidth') = 0) then
    Single(aValue) := TppBarCode(aObject).BarWidth

  else if (CompareText(aPropName, 'BearerBars') = 0) then
    Boolean(aValue) := TppBarCode(aObject).BearerBars

  else if (CompareText(aPropName, 'CalcCheckDigit') = 0) then
    Boolean(aValue) := TppBarCode(aObject).CalcCheckDigit

  else if (CompareText(aPropName, 'Data') = 0) then
    String(aValue) := TppBarCode(aObject).Data

  else if (CompareText(aPropName, 'PrintHumanReadable') = 0) then
    Boolean(aValue) := TppBarCode(aObject).PrintHumanReadable

  else if (CompareText(aPropName, 'WideBarRatio') = 0) then
    Single(aValue) := TppBarCode(aObject).WideBarRatio

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppBarCodeRTTI.SetPropValue }

class function TraTppBarCodeRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AddOnCode') = 0) then
    TppBarCode(aObject).AddOnCode := String(aValue)

  else if (CompareText(aPropName, 'AutoEncode') = 0) then
    TppBarCode(aObject).AutoEncode := Boolean(aValue)

  else if (CompareText(aPropName, 'AutoSizeFont') = 0) then
    TppBarCode(aObject).AutoSizeFont := Boolean(aValue)

  else if (CompareText(aPropName, 'BarCodeType') = 0) then
    TppBarCode(aObject).BarCodeType := TppBarCodeType(aValue)

  else if (CompareText(aPropName, 'BarColor') = 0) then
    TppBarCode(aObject).BarColor := TColor(aValue)

  else if (CompareText(aPropName, 'BarWidth') = 0) then
    TppBarCode(aObject).BarWidth := Single(aValue)

  else if (CompareText(aPropName, 'BearerBars') = 0) then
    TppBarCode(aObject).BearerBars := Boolean(aValue)

  else if (CompareText(aPropName, 'CalcCheckDigit') = 0) then
    TppBarCode(aObject).CalcCheckDigit := Boolean(aValue)

  else if (CompareText(aPropName, 'Data') = 0) then
    TppBarCode(aObject).Data := String(aValue)

  else if (CompareText(aPropName, 'PrintHumanReadable') = 0) then
    TppBarCode(aObject).PrintHumanReadable := Boolean(aValue)

  else if (CompareText(aPropName, 'WideBarRatio') = 0) then
    TppBarCode(aObject).WideBarRatio := Single(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppBarCodeRTTI);

finalization

  raUnRegisterRTTI(TraTppBarCodeRTTI);

end.
