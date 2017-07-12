{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDrwCmd;

interface

{$I ppIfDef.pas}

uses
  Windows, ComCtrls, RichEdit, Classes, Graphics, ExtCtrls, SysUtils, Forms,
  Controls, Dialogs, Messages, ppComm, ppForms, ppTypes, ppUtils, ppPrintr,
  ppDevice, ppRTTI;


type

                                          
  { TppDrawText }
  TppDrawText = class(TppDrawCommand)
    private
      FAlignment: TAlignment;
      FAutoSize: Boolean;
      FColor: TColor;
      FFont: TFont;
      FIsMemo: Boolean;
      FLeading: Integer;
      FText: String;
      FTransparent: Boolean;
      FWordWrap: Boolean;
      FWrappedText: TStrings;
      FTabStopPositions: TStrings;

      {print to file properties}
      FBandSave: Boolean;
      FBandSaveNo: Longint;
      FComponent: TComponent;
      FComponentSave: Boolean;
      FComponentSaveNo: Integer;
      FSaveLength: Integer;

      function  GetOrder: String;
      procedure SetFont(aFont: TFont);
      procedure SetWrappedText(Value: TStrings);
      procedure SetTabStopPositions(Value: TStrings);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      property Component: TComponent read FComponent write FComponent;
      property Order: String read GetOrder;


    published

      property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property AutoSize: Boolean read FAutoSize write FAutoSize default False;
      property Color: TColor read FColor write FColor default clWhite;
      property Font: TFont read FFont write SetFont;
      property IsMemo: Boolean read FIsMemo write FIsMemo default False;
      property Leading: Integer read FLeading write FLeading default 0;
      property TabStopPositions: TStrings read FTabStopPositions write SetTabStopPositions;
      property Text: String read FText write FText;
      property Transparent: Boolean read FTransparent write FTransparent default False;
      property WordWrap: Boolean read FWordWrap write FWordWrap default False;
      property WrappedText: TStrings read FWrappedText write SetWrappedText;

      {print to file properties}
      property BandSave: Boolean read FBandSave write FBandSave default False;
      property BandSaveNo: Longint read FBandSaveNo write FBandSaveNo default 0;
      property ComponentSave: Boolean read FComponentSave write FComponentSave default False;
      property ComponentSaveNo: Integer read FComponentSaveNo write FComponentSaveNo default 0;
      property SaveLength: Integer read FSaveLength write FSaveLength default 0;

  end; {class, TppDrawText}


  { TppDrawVariable }
  TppDrawVariable = class(TppDrawText)
    private
      FLookAhead: Boolean;
      FLookAheadKey: String;
      FTraversalCount: Integer;
      FWalkieTalkie: TppCommunicator;

      procedure WalkieTalkieEventNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
      procedure SetLookAhead(aValue: Boolean);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      function  IsUpdateable: Boolean; override;
      function  Update: Boolean; override;

      property LookAhead: Boolean read FLookAhead write SetLookAhead;
      property LookAheadKey: String read FLookAheadKey write FLookAheadKey;
      property TraversalCount: Integer read FTraversalCount write FTraversalCount;
      property WalkieTalkie: TppCommunicator read FWalkieTalkie write FWalkieTalkie;

  end; {class, TppDrawVariable}


  { TppDrawVar }
  TppDrawVar = class(TppDrawText)
    private
      FVarType: TppVarType;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Assign(Source: TPersistent); override;
      function  IsUpdateable: Boolean; override;
      function  Update: Boolean; override;

    published
      property VarType: TppVarType read FVarType write FVarType default vtDate;

  end; {class, TppDrawVar}


  { TppDrawCalc }
  TppDrawCalc = class(TppDrawText)
    private
      FCalcType: TppCalcType;

    public
      constructor Create(aOwner: TComponent); override;

      function  IsUpdateable: Boolean; override;
      procedure Assign(Source: TPersistent); override;
      function  Update: Boolean; override;

    published
      property CalcType: TppCalcType read FCalcType write FCalcType default ctDate;

  end; {class, TppDrawCalc}


 { TppDrawShape }
  TppDrawShape = class(TppDrawCommand)
    private
      FBrush        : TBrush;
      FPen          : TPen;
      FShapeType    : TShapeType;
      FXCornerRound : Integer;
      FYCornerRound : Integer;

      procedure SetBrush(aBrush: TBrush);
      procedure SetPen(aPen: TPen);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

    published

      property DataType default dtGraphic;
      property Brush: TBrush read FBrush write SetBrush;
      property Pen: TPen read FPen write SetPen;
      property ShapeType: TShapeType read FShapeType write FShapeType default stRectangle;
      property XCornerRound: Integer read FXCornerRound write FXCornerRound default 0;
      property YCornerRound: Integer read FYCornerRound write FYCornerRound default 0;

  end; {class, TppDrawShape}

  { TppDrawLine }
  TppDrawLine = class(TppDrawCommand)
    private
      FLinePosition: TppLinePositionType;
      FLineStyle: TppLineStyleType;
      FPen: TPen;
      FWeight: Single;

      procedure SetPen(aPen: TPen);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

    published

      property DataType default dtGraphic;
      property LinePosition : TppLinePositionType read FLinePosition write FLinePosition default lpTop;
      property LineStyle : TppLineStyleType read FLineStyle write FLineStyle default lsSingle;
      property Pen: TPen read FPen write SetPen;
      property Weight: Single read FWeight write FWeight;

  end; {class, TppDrawLine}



  { TppDrawImage }
  TppDrawImage = class(TppDrawCommand)
    private
      FCenter: Boolean;
      FMaintainAspectRatio: Boolean;
      FPicture: TPicture;
      FScale: Boolean;
      FStretch: Boolean;
      FTransparent: Boolean;
      FDirectDraw: Boolean;
      FBitmap: TBitmap;

      procedure SetPicture(aPicture: TPicture);
      function GetGraphicAsBitmap: TBitmap;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      
      procedure Assign(Source: TPersistent); override;

      function AsBitmap: TBitmap;

    published
      property DataType default dtGraphic;
      property Center: Boolean read FCenter write FCenter default False;
      property MaintainAspectRatio: Boolean read FMaintainAspectRatio write FMaintainAspectRatio default False;
      property Picture: TPicture read FPicture write SetPicture;
      property Scale: Boolean read FScale write FScale default False;
      property Stretch: Boolean read FStretch write FStretch default False;
      property Transparent: Boolean read FTransparent write FTransparent default False;
      property DirectDraw: Boolean read FDirectDraw write FDirectDraw default False;

  end; {class, TppDrawImage}

   { TppDrawBarCode }
  TppDrawBarCode = class(TppDrawCommand)
  private
    FAddOnCode         : string;
    FAutoEncode        : boolean;
    FAutoSize          : Boolean;
    FAutoSizeFont      : Boolean;
    FBarCodeType       : TppBarCodeType;
    FBarColor          : TColor;
    FBarWidth          : Longint;
    FBearerBars        : Boolean;
    FCalcCheckDigit    : Boolean;
    FColor             : TColor;
    FData              : string;
    FFont              : TFont;
    FAlignment         : TAlignment;
    FOrientation       : TppBarCodeOrientation;
    FPrintHumanReadable: Boolean;
    FPrinting          : Boolean;
    FTransparent       : Boolean;
    FWideBar           : Single;

    FPortraitWidth     : Integer;
    FPortraitHeight    : Integer;
    HOffset            : Integer;
    FCodeOk            : Boolean;

    FAddOnDataBits: TppAddOnDataBits;
    FDataBits  : TppDataBits;
 
    procedure AutoEncode128(var sData : string);
    procedure DisplayMessage(aMessage: String);
    function  GetEANChar(aCharSet, aDigit: Char): string;
    function  GetSpWidth: Integer;
    function  GetSpHeight: Integer;

    function  StrippedData: string;
    procedure SetFont(aFont: TFont);


  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Assign(Source: TPersistent); override;
    procedure CalcBarCodeSize(aCanvas: TCanvas);
    function Draw(aDevice: TppDevice): Boolean; override;
    procedure DrawBarCode(aCanvas: TCanvas; aX, aY: Integer; aPixelsPerInch: TPoint; aRender: Boolean); virtual;
    function CreateAddOnDatabits(PPI: Integer): TppAddOnDataBits;
    function CreateDataBits(PPI: Integer): TppDataBits;

    property DataBits: TppDataBits read FDataBits write FDataBits;
    property AddOnDataBits: TppAddOnDataBits read FAddOnDataBits write FAddOnDataBits;
    property spWidth: Integer read GetSpWidth;
    property spHeight: Integer read GetSpHeight;
    property PortraitWidth: Integer read FPortraitWidth write FPortraitWidth;
    property PortraitHeight: Integer read FPortraitHeight write FPortraitHeight;

  published
    property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
    property AddOnCode: string read FAddOnCode write FAddOnCode;
    property AutoEncode : boolean read FAutoEncode write FAutoEncode default False;
    property AutoSize: Boolean read FAutoSize write FAutoSize default True;
    property AutoSizeFont: Boolean read FAutoSizeFont write FAutoSizeFont default True;
    property BarCodeType: TppBarCodeType read FBarCodeType write FBarCodeType;
    property BarColor: TColor read FBarColor write FBarColor;
    property BarWidth: Longint read FBarWidth write FBarWidth;
    property BearerBars: Boolean read FBearerBars write FBearerBars default False;
    property CalcCheckDigit: Boolean read FCalcCheckDigit write FCalcCheckDigit default True;
    property CodeOK: Boolean read FCodeOK write FCodeOK default True;
    property Color: TColor read FColor write FColor;
    property Data: string read FData write FData;
    property Font: TFont read FFont write SetFont;
    property Orientation: TppBarCodeOrientation read FOrientation write FOrientation default orLeftToRight;
    property PrintHumanReadable: Boolean read FPrintHumanReadable write FPrintHumanReadable default True;
    property Transparent: Boolean read FTransparent write FTransparent default False;
    property WideBarRatio: Single read FWideBar write FWideBar;

  end; {class, TppDrawBarCode}


  TppCustomRichEditClass = class of TCustomRichEdit;

   { TppDrawRichText }
  TppDrawRichText = class(TppDrawCommand)
    private
      FColor: TColor;
      FEndCharPos: Integer;
      FRichTextStream: TMemoryStream;
      FStartCharPos: Integer;
      FTransparent: Boolean;

      procedure ReadRTFStream(Stream: TStream);
      procedure WriteRTFStream(Stream: TStream);

    protected
      procedure DefineProperties(Filer: TFiler); override;

    public

      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Assign(Source: TPersistent); override;
      function Draw(aDevice: TppDevice): Boolean; override;

    published
      property DataType default dtBlob;
      property Color: TColor read FColor write FColor;
      property EndCharPos: Integer read FEndCharPos write FEndCharPos;
      property RichTextStream: TMemoryStream read FRichTextStream write FRichTextStream stored False;
      property StartCharPos: Integer read FStartCharPos write FStartCharPos;
      property Transparent: Boolean read FTransparent write FTransparent default False;

  end; {class, TppDrawRichText}


  { TppRTFEngine - used to render rich text }
  TppRTFEngine = class
    private
      FRichEdit: TCustomRichEdit;

    public

      procedure DrawRichText(aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange);
      function FormatRange(aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange; aRender: Boolean): Integer;
      function CheckRangeFit(aDC: HDC; aCharRange: TCharRange; aDestRect: TRect;
                     var aLastFittedChar: Longint; var aHeightUsed: Longint): Boolean;
      function CalcRangeHeight(aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;


      property RichEdit: TCustomRichEdit read FRichEdit write FRichEdit;
  end; {class TppRTFEngine}


  {class TppRichEdit}
  TppRichEdit = class(TRichEdit)
    private

    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure WndProc(var Message: TMessage); override;

    published

    end;  {class, TppRichEdit}

  function ppParentWnd: TForm;
  procedure ppParentWndFree;

  function ppMetaFile: TMetaFile;

  {rich text routines }
  function ppGetRTFEngine(aRichEdit: TCustomRichEdit): TppRTFEngine;
  function ppGetRichEditClass: TppCustomRichEditClass;
  function ppGetRichEditLines(aRichEdit: TCustomRichEdit): TStrings;

  procedure ppRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
  procedure ppUnRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);


 {general procedures}
  procedure ppTextOutRotate(aCanvas: TCanvas; aFont: TFont; aX, aY: Integer; aAngle: longint; aText: string);
  function ppInInches(aValue: Longint): Single;


implementation

uses
  ppViewr, ppPrnDev;

var
   FParentWnd: TForm = nil;
   FMetaFile: TMetaFile = nil;
   FRTFEngine: TppRTFEngine = nil;
   FRichEditClass: TppCustomRichEditClass = nil;
   FRichEditModule: THandle;

{******************************************************************************
 *
 ** D R A W   T E X T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawText.Create }

constructor TppDrawText.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FAlignment := taLeftJustify;
  FAutoSize  := False ;
  FColor := clWhite;
  FFont := TppFont.Create;
  FIsMemo := False;
  FLeading := 0;
  FSaveLength := 0;
  FText := '';
  FTransparent := False;
  FTabStopPositions := TStringList.Create;
  FWordWrap := False;
  FWrappedText := TStringList.Create;

  {print to file properties}
  FBandSave := False;
  FBandSaveNo := 0;
  FComponent := nil;
  FComponentSave  := False;
  FComponentSaveNo := 0;
  FSaveLength := 0;

end; {constructor, TppDrawText}

{------------------------------------------------------------------------------}
{ TppDrawText.Destroy }

destructor TppDrawText.Destroy;
begin
  FFont.Free;
  FTabStopPositions.Free;
  FWrappedText.Free;

  inherited Destroy;
end; {destructor, TppDrawText}

{------------------------------------------------------------------------------}
{ TppDrawText.Assign }

procedure TppDrawText.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawText;
begin

  inherited Assign(Source);

  if not(Source is TppDrawText) then Exit;

  lDrawCommand := TppDrawText(Source);

  FAlignment    := lDrawCommand.Alignment;
  FAutoSize     := lDrawCommand.AutoSize;
  FColor        := lDrawCommand.Color;
  FIsMemo       := lDrawCommand.IsMemo;
  FLeading      := lDrawCommand.Leading;
  FText         := lDrawCommand.Text;
  FTransparent  := lDrawCommand.Transparent;
  FWordWrap     := lDrawCommand.WordWrap;

  {object assigns}
  FFont.Assign(lDrawCommand.Font);
  FTabStopPositions.Assign(lDrawCommand.TabStopPositions);
  FWrappedText.Assign(lDrawCommand.WrappedText);

  {print to file properties}
  FBandSave        := lDrawCommand.BandSave;
  FBandSaveNo      := lDrawCommand.BandSaveNo;
  FComponent       := lDrawCommand.Component;
  FComponentSave   := lDrawCommand.ComponentSave;
  FComponentSaveNo := lDrawCommand.ComponentSaveNo;
  FSaveLength      := lDrawCommand.SaveLength;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawText.GetOrder }

function TppDrawText.GetOrder: String;
begin
  Result := Format('%8d',[FBandSaveNo]) + Format('%8d',[FComponentSaveNo]);
end; {function, GetOrder}

{------------------------------------------------------------------------------}
{ TppDrawText.SetFont }

procedure TppDrawText.SetFont(aFont: TFont);
begin
  FFont.Assign(aFont);
end; {function, SetFont}

{------------------------------------------------------------------------------}
{ TppDrawText.SetWrappedText }

procedure TppDrawText.SetWrappedText(Value: TStrings);
begin
  FWrappedText.Assign(Value);
end; {function, SetWrappedText}

{------------------------------------------------------------------------------}
{ TppDrawText.SetTabStopPositions }

procedure TppDrawText.SetTabStopPositions(Value: TStrings);
begin
  FTabStopPositions.Assign(Value);
end; {function, SetTabStopPositions}

{******************************************************************************
 *
 ** D R A W   L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawLine.Create }

constructor TppDrawLine.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FLinePosition := lpTop;
  FLineStyle    := lsSingle;
  FPen          := TPen.Create;

  DataType      := dtGraphic;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawLine.Destroy }

destructor TppDrawLine.Destroy;
begin

  FPen.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawLine.Assign }

procedure TppDrawLine.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawLine;
begin

  inherited Assign(Source);

  if not(Source is TppDrawLine) then Exit;

  lDrawCommand := TppDrawLine(Source);

  FLinePosition := lDrawCommand.LinePosition;
  FLineStyle    := lDrawCommand.LineStyle;

  {object assigns}
  FPen.Assign(lDrawCommand.Pen);

  FWeight := lDrawCommand.Weight;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawLine.SetPen }

procedure TppDrawLine.SetPen(aPen: TPen);
begin
  FPen.Assign(aPen);
end; {procedure, SetPen}

{******************************************************************************
 *
 ** D R A W   S H A P E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawShape.Create }

constructor TppDrawShape.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FBrush        := TBrush.Create;
  FPen          := TPen.Create;
  FShapeType    := stRectangle;
  FXCornerRound := 0;
  FYCornerRound := 0;

  DataType     := dtGraphic;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawShape.Destroy }

destructor TppDrawShape.Destroy;
begin
  FBrush.Free;
  FPen.Free;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawShape.Assign }

procedure TppDrawShape.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawShape;
begin

  inherited Assign(Source);

  if not(Source is TppDrawShape) then Exit;

  lDrawCommand := TppDrawShape(Source);

  FShapeType    := lDrawCommand.ShapeType;
  FXCornerRound := lDrawCommand.XCornerRound;
  FYCornerRound := lDrawCommand.YCornerRound;

  {object assigns}
  FBrush.Assign(lDrawCommand.Brush);
  FPen.Assign(lDrawCommand.Pen);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawShape.SetBrush }

procedure TppDrawShape.SetBrush(aBrush: TBrush);
begin
  FBrush.Assign(aBrush);
end; {procedure, SetBrush}

{------------------------------------------------------------------------------}
{ TppDrawShape.SetPen }

procedure TppDrawShape.SetPen(aPen: TPen);
begin
  FPen.Assign(aPen);
end; {procedure, SetPen}

{******************************************************************************
 *
 ** D R A W   I M A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawImage.Create }

constructor TppDrawImage.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FBitmap := nil;

  FCenter      := False;
  FPicture     := TPicture.Create;
  FScale       := False;
  FStretch     := False;
  FTransparent := False;
  FDirectDraw  := False;
  FMaintainAspectRatio := False;

  DataType := dtGraphic;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawImage.Destroy }

destructor TppDrawImage.Destroy;
begin

  FBitmap.Free;

  FPicture.Assign(nil);

  {if FPicture.Graphic <> nil then
    begin
      FPicture.Graphic.Free;
      FPicture.Graphic := nil;
    end;}

  FPicture.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawImage.Assign }

procedure TppDrawImage.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawImage;
begin

  inherited Assign(Source);

  if not(Source is TppDrawImage) then Exit;

  lDrawCommand := TppDrawImage(Source);

  FCenter       := lDrawCommand.Center;
  FDirectDraw   := lDrawCommand.DirectDraw;
  FMaintainAspectRatio := lDrawCommand.MaintainAspectRatio;
  FScale        := lDrawCommand.Scale;
  FStretch      := lDrawCommand.Stretch;
  FTransparent  := lDrawCommand.Transparent;

  {object assigns}
 { FPicture.Assign(lDrawCommand.Picture);}
 SetPicture(lDrawCommand.Picture);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawImage.SetPicture }

procedure TppDrawImage.SetPicture(aPicture: TPicture);
begin
  FPicture.Assign(aPicture);

  if (FPicture.Graphic is TBitmap) then
    FPicture.Bitmap.HandleType := bmDIB;

end; {procedure, SetPicture}

{------------------------------------------------------------------------------}
{ TppDrawImage.AsBitmap }

function TppDrawImage.AsBitmap: TBitmap;
begin

  if (FPicture.Graphic is TMetaFile) or
     (FPicture.Graphic is TIcon) then
     Result := nil

  else if (FPicture.Graphic is TBitmap) then
    Result := FPicture.Bitmap

  else
    Result := GetGraphicAsBitmap;


end; {procedure, AsBitmap}


{------------------------------------------------------------------------------}
{ TppDrawImage.GetGraphicAsBitmap }

function TppDrawImage.GetGraphicAsBitmap: TBitmap;
begin

  if (FBitmap = nil) then
    begin

      {create bmp}
      FBitmap := TBitmap.Create;

      try

        FBitmap.Width   := FPicture.Graphic.Width;
        FBitmap.Height  := FPicture.Graphic.Height;
        FBitmap.Palette := FPicture.Graphic.Palette;
        FBitmap.HandleType := bmDIB;

        {draw graphic to bmp}
        FBitmap.Canvas.Draw(0, 0, FPicture.Graphic);

      except
        try
          FBitmap.Width   := Trunc(FPicture.Graphic.Width  * 0.25);
          FBitmap.Height  := Trunc(FPicture.Graphic.Height * 0.25);
          FBitmap.Palette := FPicture.Graphic.Palette;
          FBitmap.HandleType := bmDIB;

          {draw graphic to bmp}
          FBitmap.Canvas.StretchDraw(Rect(0, 0,FBitmap.Width,FBitmap.Height), FPicture.Graphic);

        except

          FBitmap.Free;
          FBitmap := nil
        end;

      end;

   end;

  Result := FBitmap;

end; {function, GetGraphicAsBitmap}


{******************************************************************************
 *
 ** D R A W   V A R I A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawVariable.Create }

constructor TppDrawVariable.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FLookAhead := False;
  FLookAheadKey := '';
  FTraversalCount := 0;
  FWalkieTalkie := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawVariable.Destroy }

destructor TppDrawVariable.Destroy;
begin

  FWalkieTalkie.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawVariable.Assign }

procedure TppDrawVariable.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawVariable;
  liIndex: Integer;
  lWalkieTalkie: TppCommunicator;
  lCommunicator: TppCommunicator;
begin

  inherited Assign(Source);

  if not(Source is TppDrawVariable) then Exit;

  lDrawCommand := TppDrawVariable(Source);

  FLookAheadKey := lDrawCommand.LookAheadKey;

  SetLookAhead(lDrawCommand.LookAhead);

  {copy event notifications from one walkie talkie to the other}
  if (FLookAhead) then
    begin
      lWalkieTalkie := lDrawCommand.WalkieTalkie;

      for liIndex := 0 to lWalkieTalkie.NotifyCommunicatorCount - 1 do
        begin
          lCommunicator := lWalkieTalkie.NotifyCommunicators[liIndex];

          lCommunicator.AddEventNotify(FWalkieTalkie);
        end;
    end;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawVariable.SetLookAhead }

procedure TppDrawVariable.SetLookAhead(aValue: Boolean);
begin

  FLookAhead := aValue;

  if (FLookAhead) then
    begin
      if (FWalkieTalkie = nil) then
        FWalkieTalkie := TppCommunicator.Create(Self);

      FWalkieTalkie.EventNotifies := [ciComponentCalcLookAhead];
      FWalkieTalkie.OnEventNotify := WalkieTalkieEventNotifyEvent;
    end
  else
    begin
      FWalkieTalkie.Free;
      FWalkieTalkie := nil;
    end

end; {procedure, SetLookAhead}

{------------------------------------------------------------------------------}
{ TppDrawVariable.IsUpdateable }

function TppDrawVariable.IsUpdateable;
begin
  Result := FLookAhead;
end; {function, IsUpdateable}

{------------------------------------------------------------------------------}
{ TppDrawVariable.WalkieTalkieEventNotifyEvent }

procedure TppDrawVariable.WalkieTalkieEventNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
var
  lsLookAheadKey: String;
  liTraversalCount: Integer;
  lsText: String;
begin

  aParams.GetParamValue(0, lsLookAheadKey);
  aParams.GetParamValue(1, liTraversalCount);
  aParams.GetParamValue(2, lsText);

  if (lsLookAheadKey = FLookAheadKey)  then
    begin

      if (liTraversalCount > FTraversalCount) then
        begin
          Text := lsText;

          FTraversalCount := liTraversalCount;
        end;

    end

   else 
    FWalkieTalkie.EventNotifies := [];

end; {procedure, WalkieTalkieEventNotifyEvent}

{------------------------------------------------------------------------------}
{ TppDrawVariable.Update }

function TppDrawVariable.Update: Boolean;
begin
  Result := FLookAhead and (FWalkieTalkie.EventNotifies <> []);
end; {procedure, Update}

{******************************************************************************
 *
 ** D R A W   V A R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawVar.Create }

constructor TppDrawVar.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FVarType := vtDate;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawVar.Assign }

procedure TppDrawVar.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawVar;
begin

  inherited Assign(Source);

  if not(Source is TppDrawVar) then Exit;

  lDrawCommand := TppDrawVar(Source);

  FVarType := lDrawCommand.VarType;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawVar.IsUpdateable }

function TppDrawVar.IsUpdateable;
begin
  Result := FVarType in [vtPageNo, vtPageNoDesc, vtPageCount, vtPageSet, vtPageSetDesc];
end; {function, IsUpdateable}

{------------------------------------------------------------------------------}
{ TppDrawVar.Update }

function TppDrawVar.Update: Boolean;
begin

  Result := False;

  case FVarType of

    vtPageNo, vtPageNoDesc, vtPageCount, vtPageSet, vtPageSetDesc:
      begin
        Text := ppFormatVarValue(FVarType, Page.PageNo, Page.PageCount,
                                 Page.PrintDateTime, Page.LanguageIndex, True);

        Result := True;
      end;

  end; {case, calctype}

end; {procedure, Update}

{******************************************************************************
 *
 ** D R A W   C A L C
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawCalc.Create }

constructor TppDrawCalc.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCalcType := ctDate;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawCalc.Assign }

procedure TppDrawCalc.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawCalc;
begin

  inherited Assign(Source);

  if not(Source is TppDrawCalc) then Exit;

  lDrawCommand := TppDrawCalc(Source);

  FCalcType := lDrawCommand.CalcType;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawCalc.IsUpdateable }

function TppDrawCalc.IsUpdateable;
begin
  Result := True;
end; {function, IsUpdateable}

{------------------------------------------------------------------------------}
{ TppDrawCalc.Update }

function TppDrawCalc.Update: Boolean;
begin

  Result := False;

  case FCalcType of

    ctPageCount, ctPageSet, ctPageSetDesc:
      begin
        Text := ppFormatCalcValue(FCalcType, Page.PageNo, Page.PageCount,
                                  Page.PrintDateTime, Page.LanguageIndex, True);

        Result := True;
      end;

  end; {case, calctype}

end; {procedure, Update}



{******************************************************************************
 *
 ** T p p D r a w R i c h T e x t
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawRichText.Create }

constructor TppDrawRichText.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FRichTextStream := TMemoryStream.Create;
  FStartCharPos := -1;
  FEndCharPos   := -1;
  FTransparent  := False;

  DataType := dtBlob;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawRichText.Destroy }

destructor TppDrawRichText.Destroy;
begin
  FRichTextStream.Free;

  inherited Destroy;
  
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawRichText.Assign }

procedure TppDrawRichText.Assign(Source: TPersistent);
var
  lDrawCommand: TppDrawRichText;

begin

  inherited Assign(Source);

  if not(Source is TppDrawRichText) then Exit;

  lDrawCommand := TppDrawRichText(Source);

  FColor        := lDrawCommand.Color;
  FEndCharPos   := lDrawCommand.EndCharPos;
  FColor        := lDrawCommand.Color;
  FStartCharPos := lDrawCommand.StartCharPos;
  FTransparent  := lDrawCommand.Transparent;

  lDrawCommand.RichTextStream.SaveToStream(FRichTextStream);


end; {procedure, Assign}


{------------------------------------------------------------------------------}
{ TppDrawRichText.Draw }

function TppDrawRichText.Draw(aDevice: TppDevice): Boolean;
var
  lMetaFile: TMetaFile;
  lMetaFileCanvas: TMetaFileCanvas;
  lCanvasRect: TRect;
  liControlWidth, liControlHeight: Integer;
  lCharRange: TCharRange;
  lPrinterDevice: TppPrinterDevice;
  lScreenDevice: TppScreenDevice;
  lPrinter: TppPrinter;
  lDC: HDC;
  lBitmap: TBitmap;
  lRichEdit: TCustomRichEdit;
  lSaveFont: TFont;


begin

  Result := True;

  lRichEdit := ppGetRichEditClass.Create(ppParentWnd);
  lRichEdit.Parent := ppParentWnd;

  {transfer the RTF data to the global ppRichEdit object }
  FRichTextStream.Position := 0;
  ppGetRichEditLines(lRichEdit).LoadFromStream(FRichTextStream);

  lCharRange.cpMin := FStartCharPos;
  lCharRange.cpMax := FEndCharPos;

  if (aDevice is TppPrinterDevice) then
    begin

      lPrinterDevice := TppPrinterDevice(aDevice);
      lPrinter := lPrinterDevice.Printer;

      lSaveFont := TFont.Create;
      lSaveFont.Assign(lPrinter.Canvas.Font);

      lPrinterDevice.CalcDrawPosition(Self);

      if Transparent then
         lPrinter.Canvas.CopyMode := cmSrcAnd
      else

      {draw background color}
      if not Transparent then
        begin

          lPrinter.Canvas.CopyMode := cmSrcCopy;
          lPrinter.Canvas.Brush.Style := bsSolid;
          lPrinter.Canvas.Brush.Color := FColor;
          lPrinter.Canvas.FillRect(DrawRect);
        end;

      lPrinter.Canvas.Brush.Style := bsClear;

      ppGetRTFEngine(lRichEdit).DrawRichText(lPrinter.DC, lPrinter.DC, DrawRect, lCharRange);

      lPrinter.Canvas.Font.Assign(lSaveFont);

      lSaveFont.Free;

    end

  else if (aDevice is TppScreenDevice) then
    begin

      lScreenDevice := TppScreenDevice(aDevice);

      lScreenDevice.ScaleVertices(Self);

      lPrinter := ppPrinter;

      if lPrinter <> nil then
        lPrinter.PrinterSetup := Page.PrinterSetup;

      if (lPrinter <> nil) and (lPrinter.DC <> 0) then
        lDC := lPrinter.DC
      else
        lDC := GetDC(0);

      liControlWidth  := Trunc(ppFromMMThousandths(Width, utPrinterPixels, pprtHorizontal, lPrinter));
      liControlHeight := Trunc(ppFromMMThousandths(Height, utPrinterPixels, pprtVertical, lPrinter));

      {create a metafile}
      lMetaFile := ppMetaFile;
      lMetaFile.Width  := liControlWidth;
      lMetaFile.Height := liControlHeight;

      lCanvasRect := Rect(0, 0, liControlWidth, liControlHeight);

      {note following this line, lMetaFile.Width & lMetaFile.Height will return 0}
      lMetaFileCanvas := TMetaFileCanvas.Create(lMetaFile, lDC);

      if Transparent then
        lScreenDevice.Canvas.CopyMode := cmSrcAnd
      else
        begin
          lScreenDevice.Canvas.CopyMode := cmSrcCopy;

          {draw background color}
          lMetaFileCanvas.Brush.Style := bsSolid;
          lMetaFileCanvas.Brush.Color := FColor;
          lMetaFileCanvas.FillRect(lCanvasRect);

        end;

      {draw the RichText to the metafile}
       ppGetRTFEngine(lRichEdit).DrawRichText(lMetaFileCanvas.Handle, lDC, lCanvasRect, lCharRange);

      lMetaFileCanvas.Free;

      if (lPrinter = nil) or (lPrinter.DC = 0) then
        ReleaseDC(0,lDC);

      if Transparent then
        begin
          lBitmap := TBitmap.Create;
          lBitmap.Width  := liControlWidth;
          lBitmap.Height := liControlHeight;
          lBitmap.Canvas.StretchDraw(Rect(0,0,liControlWidth, liControlHeight), lMetaFile);

          {draw the metafile to the screen canvas}
          lScreenDevice.Canvas.StretchDraw(DrawRect, lBitmap);

          lBitmap.Free;
        end
      else
        {draw the metafile to the screen canvas}
        lScreenDevice.Canvas.StretchDraw(DrawRect, lMetaFile);

    end
  else
    Result := False;


  lRichEdit.Free;
  
end; {function, Draw}



{------------------------------------------------------------------------------}
{ TppDrawRichText.DefineProperties }

procedure TppDrawRichText.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineBinaryProperty('RTFStream', ReadRTFStream, WriteRTFStream, True)

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppDrawRichText.ReadRTFStream }

procedure TppDrawRichText.ReadRTFStream(Stream: TStream);
var
  llSize: Longint;
begin

  Stream.Read(llSize, SizeOf(Longint));
  FRichTextStream.CopyFrom(Stream, llSize);

end; {procedure, ReadRTFStream}

{------------------------------------------------------------------------------}
{ TppDrawRichText.WriteRTFStream }

procedure TppDrawRichText.WriteRTFStream(Stream: TStream);
var
  llSize: Longint;
begin

  llSize := FRichTextStream.Size;

  Stream.Write(llSize, SizeOf(Longint));

  {note: specify 0 as second parameter to copy the entire stream}
  Stream.CopyFrom(FRichTextStream, 0);

end; {procedure, WriteRTFStream}


{******************************************************************************
 *
 ** R T F  E n g i n e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRTFEngine.DrawRichText}

procedure TppRTFEngine.DrawRichText(aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange);
begin

  FormatRange(aDC, aFormatDC, aRect, aCharRange, True);

end; {procedure, DrawRichText}


{------------------------------------------------------------------------------}
{ TppRTFEngine.FormatRange}

function TppRTFEngine.FormatRange(aDC: HDC; aFormatDC: HDC; const aRect: TRect; aCharRange: TCharRange;
                                 aRender: Boolean): Integer;
var
  lFormatRange: TFormatRange;
  liSaveMapMode: Integer;
  liPixelsPerInchX: Integer;
  liPixelsPerInchY: Integer;
  liRender: Integer;

begin

    {initialize the FormatRange structure}
    FillChar(lFormatRange, SizeOf(TFormatRange), 0);

    lFormatRange.hdc       := aDC;
    lFormatRange.hdcTarget := aFormatDC;

    {convert destination rect to TWIPS}
    liPixelsPerInchX := GetDeviceCaps(aDC, LOGPIXELSX);
    liPixelsPerInchY := GetDeviceCaps(aDC, LOGPIXELSY);

    {add a 1/32 inch left margin (1440 / 32 = 45)}
    lFormatRange.rc.left   := (aRect.Left * 1440 div liPixelsPerInchX) + 45;

    lFormatRange.rc.right  := aRect.Right  * 1440 div liPixelsPerInchX;
    lFormatRange.rc.top    := aRect.Top    * 1440 div liPixelsPerInchY;
    lFormatRange.rc.bottom := aRect.Bottom * 1440 div liPixelsPerInchY;

    lFormatRange.rcPage := lFormatRange.rc;

    lFormatRange.chrg.cpMin := aCharRange.cpMin;
    lFormatRange.chrg.cpMax := aCharRange.cpMax;

    if aRender then
      liRender := 1
    else
      liRender := 0;

    liSaveMapMode := SetMapMode(lFormatRange.hdc, MM_TEXT);

    FRichEdit.Perform(EM_FORMATRANGE, 0, 0);   { flush buffer}

    try
      Result := FRichEdit.Perform(EM_FORMATRANGE, liRender, Longint(@lFormatRange));
    finally
      FRichEdit.Perform(EM_FORMATRANGE, 0, 0);

      SetMapMode(lFormatRange.hdc, liSaveMapMode);   { restore previous map mode}

    end;


end; {procedure, FormatRange}


{------------------------------------------------------------------------------}
{ TppRTFEngine.CheckRangeFit}

function TppRTFEngine.CheckRangeFit(aDC: HDC; aCharRange: TCharRange; aDestRect: TRect;
                                    var aLastFittedChar: Longint; var aHeightUsed: Longint): Boolean;
begin


  {calc whether the range fits into the destination rectangle }
  aLastFittedChar := FormatRange(aDC, aDC, aDestRect, aCharRange, False);

  {range fits if the LastFitted char includes the last char in the range }
  Result := (aLastFittedChar >= aCharRange.cpMax);

  if Result then

      {range fits, so calc height used by the range}
      aHeightUsed := CalcRangeHeight(aDC, aCharRange, aDestRect)
  else
    begin
      {format range returns the last char that fits plus one}
      Dec(aLastFittedChar);

      {range does not fit, so height used is the height of the rectangle}
      aHeightUsed := aDestRect.Bottom - aDestRect.Top;
    end;


  {if range does not fit, check whether the text is just a carriage return + line feed
      note: for some reason CheckRangeFit will always return a false result}
  if not Result then
    begin

      FRichEdit.SelStart  := aLastFittedChar;
      FRichEdit.SelLength := aCharRange.cpMax;

{$IFDEF Delphi3}
      if (FRichEdit.SelText =#13#10) or (FRichEdit.SelText = #10) or
         (FRichEdit.SelText = #13)  then
        Result := True;
{$ELSE}
      {note: for Delphi 2, add a heuristic 'cause the rtf control is buggy}
      if (FRichEdit.SelText = #13#10) or
        ((FRichEdit.SelLength <= 4) and (Copy(FRichEdit.SelText,1,2) = #13#10)) then

        Result := True;
{$ENDIF}

    end;


end; {function, CheckRangeFit}


{------------------------------------------------------------------------------}
{ TppRTFEngine.CalcRangeHeight}

function TppRTFEngine.CalcRangeHeight(aDC: HDC; aCharRange: TCharRange; aDestRect: TRect): Integer;
var
  lPrintRect: TRect;
  liMinHeight: Integer;
  liMaxHeight: Integer;
  liRangeHeight: Integer;
  lbRangeFits: Boolean;
  lbCalcDone: Boolean;
  liPixelsPerInchY: Integer;
  liTolerance: Integer;
  { liCount: Integer;}
  lFont: TFont;
  lTextMetric: TTextMetric;

begin

  {intitialize}
  lPrintRect.Left   := aDestRect.Left;
  lPrintRect.Top    := aDestRect.Top;
  lPrintRect.Right  := aDestRect.Right;

  liPixelsPerInchY := GetDeviceCaps(aDC, LOGPIXELSY);

  {calculate the sizing tolerance based upon the font height of the last character in the range}
  FRichEdit.SelStart    := aCharRange.cpMax;
  FRichEdit.SelLength   := 1;

  if ppPrinter <> nil then
    begin
      lFont := TFont.Create;
      lFont.Assign(FRichEdit.SelAttributes);
      ppPrinter.Canvas.Font := lFont;
      GetTextMetrics(ppPrinter.DC, lTextMetric);
      lFont.Free;
   end
  else
    lTextMetric.tmDescent := 0;

  liTolerance := Round(Abs(FRichEdit.SelAttributes.Size) * liPixelsPerInchY / 72);


  FRichEdit.ClearSelection;

  liMinHeight   := 0;
  liMaxHeight   := aDestRect.Bottom - aDestRect.Top;
  liRangeHeight := liMaxHeight;          
  lbRangeFits   := True;
  lbCalcDone    := False;

  {liCount := 0;}

  while not lbCalcDone do
    begin

      {try the halfway point }
      liRangeHeight := liMinHeight + ((liMaxHeight - liMinHeight) div 2);

      lPrintRect.Bottom := lPrintRect.Top + liRangeHeight;

      lbRangeFits := (FormatRange(aDC, aDC, lPrintRect, aCharRange, False) >= aCharRange.cpMax);

      {calc a new Max or Min based on whether the range fits}
      if ((liMaxHeight - liMinHeight) <= liTolerance) then

        lbCalcDone := True

      else if lbRangeFits then
        liMaxHeight := liRangeHeight
      else
        liMinHeight := liRangeHeight;

    {  inc(liCount);
      if liCount > 50 then
        ShowMessage('CalcRangeHeight: stuck in loop'); }
    end;

    {showMessage('FormatRange calls: ' + IntToStr(liCount));}
   if lbRangeFits then
     Result := liRangeHeight
   else
     Result := liMaxHeight;

   {make sure the text is at least one line high
     note: this is because of a bug in the rich edit control }
   if Result < liTolerance then
     Result := liTolerance;

   Result := Result + lTextMetric.tmDescent;

end; {function, CalcRangeHeight}

{******************************************************************************
 *
 ** R I C H E D I T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRichEdit.CreateParams }

procedure TppRichEdit.CreateParams(var Params: TCreateParams);
const
  cHideScrollBars: array[Boolean] of DWORD = (ES_DISABLENOSCROLL, 0);
  cHideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
begin

  {try to load the RichEdit 2 dll}
  if FRichEditModule = 0 then
    begin
      FRichEditModule := LoadLibrary('RICHED20.DLL');
      if FRichEditModule <= HINSTANCE_ERROR then
        FRichEditModule := 0;
    end;

  {call inherited - which will load the RichEdit version 1 libary (RichED32.DLL)}
  inherited CreateParams(Params);

  {create the appropriate windows subclass for the rich edit library}
  if FRichEditModule <> 0 then
    CreateSubClass(Params, 'RICHEDIT20A')
  else
    CreateSubClass(Params, 'RICHEDIT');

  Params.Style := Params.Style or cHideScrollBars[HideScrollBars] or cHideSelections[HideSelection];
  Params.WindowClass.style := Params.WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);

end; {procedure, CreateParams}


{------------------------------------------------------------------------------}
{ TppRichEdit.WndProc }

procedure TppRichEdit.WndProc(var Message: TMessage);
const FR_DOWN = $00000001;

begin
  {RichEdit 2.0 support additional search options not available in RichEdit 1.0,
   FR_DOWN indicates to search from current selection to bottom of document}
  if (Message.Msg = EM_FINDTEXT) then
     Message.wParam:= Message.wParam or FR_DOWN;

  inherited WndProc(Message);

end; {procedure, WndProc}


{******************************************************************************
 *
 ** T p p D r a w B a r C o d e
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.Create }

constructor TppDrawBarCode.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FFont := TppFont.Create;
  FPrinting := False;

  {note: these need to correspond to default prop values in declarations}
  FAlignment      := taLeftJustify;
  FAutoEncode     := False;
  FAutoSize       := True;
  FAutoSizeFont   := True;
  FBearerBars     := False;
  FCalcCheckDigit := True;
  FCodeOK         := True;
  FOrientation    := orLeftToRight;
  FPrintHumanReadable := True;
  FTransparent    := False;



end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDrawBarCode.Destroy }

destructor TppDrawBarCode.Destroy;
begin

  FFont.Free;
  
  inherited Destroy;
  
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDrawBarCode.Assign }

procedure TppDrawBarCode.Assign(Source: TPersistent);
var
  lDrawBarCode: TppDrawBarCode;

begin

  inherited Assign(Source);

  if not(Source is TppDrawBarCode) then Exit;

  lDrawBarCode := TppDrawBarCode(Source);

  {create print object}
  FAlignment      := lDrawBarCode.Alignment;
  FAutoEncode     := lDrawBarCode.AutoEncode;
  FAddOnCode      := lDrawBarCode.AddOnCode;
  FAutoSize       := lDrawBarCode.AutoSize;
  FAutoSizeFont   := lDrawBarCode.AutoSizeFont;
  FBarCodeType    := lDrawBarCode.BarCodeType;
  FBarColor       := lDrawBarCode.BarColor;
  FBarWidth       := lDrawBarCode.BarWidth;
  FBearerBars     := lDrawBarCode.BearerBars;
  FCalcCheckDigit := lDrawBarCode.CalcCheckDigit;
  FCodeOK         := lDrawBarCode.CodeOK;
  FColor          := lDrawBarCode.Color;
  FData           := lDrawBarCode.Data;
  Font            := lDrawBarCode.Font;
  FOrientation    := lDrawBarCode.Orientation;
  FPrintHumanReadable  := lDrawBarCode.PrintHumanReadable;
  FTransparent    := lDrawBarCode.Transparent;
  FWideBar        := lDrawBarCode.WideBarRatio;


end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDrawBarCode.DisplayMessage }

procedure TppDrawBarCode.DisplayMessage(aMessage: String);
begin

  if FPrinting then Exit;

  MessageDlg(aMessage, mtInformation, [mbOK], 0);

end; {procedure, DisplayMessage}



{------------------------------------------------------------------------------}
{ TppDrawBarCode.Draw }

function TppDrawBarCode.Draw(aDevice: TppDevice): Boolean;
var
  lPrinterDevice: TppPrinterDevice;
  lScreenDevice: TppScreenDevice;
  lPrinter: TppPrinter;
  lPixelsPerInch: TPoint;
  lCalcUnits: TppUnitType;
  lCanvas: TCanvas;
{$IFDEF Old}
  lMemCanvas: TppDeviceCompatibleCanvas;
  lMetaFile: TMetaFile;
  lMetaFileCanvas: TMetaFileCanvas;
{$ELSE}
  lBitmap: TBitmap;

{$ENDIF}


begin

  Result := True;

  if (aDevice is TppPrinterDevice) then
    begin

      FPrinting := True;
      
      try
        lPrinterDevice := TppPrinterDevice(aDevice);
        lPrinter := lPrinterDevice.Printer;

        lPixelsPerInch := lPrinter.PixelsPerInch;


      {adjust size}
      if FOrientation in [orLeftToRight, orRightToLeft] then
        begin

          FDataBits      := CreateDataBits(lPixelsPerInch.X);
          FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.X);

          {calc size required for printer}
          DrawBarCode(lPrinter.Canvas, 0, 0, lPixelsPerInch, False);

          Width := ppToMMThousandths(FPortraitWidth,
                                      utPrinterPixels, pprtHorizontal, lPrinter);

          Height := ppToMMThousandths(FPortraitHeight,
                                      utPrinterPixels, pprtVertical, lPrinter);

          DrawRight  := FPortraitWidth;
          DrawBottom := FPortraitHeight;

        end
      else
        begin
          FDataBits      := CreateDataBits(lPixelsPerInch.Y);
          FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.Y);

          {calc size required for printer}
          DrawBarCode(lPrinter.Canvas, 0, 0, lPixelsPerInch, False);

          Width := ppToMMThousandths(FPortraitHeight,
                                      utPrinterPixels, pprtHorizontal, lPrinter);

          Height := ppToMMThousandths(FPortraitWidth,
                                      utPrinterPixels, pprtVertical, lPrinter);

          DrawRight   := FPortraitHeight;
          DrawBottom  := FPortraitWidth;


        end;

{$IFDEF Old}
        {create a device compatible canvas}
        lMemCanvas := TppDeviceCompatibleCanvas.Create(lPrinter.Canvas.Handle, DrawRight, DrawBottom,0{ SystemPalette16});

        {draw barcode to mem canvas}
        DrawBarCode(lMemCanvas, 0, 0, lPixelsPerInch, True);

        {calc draw position}
        lPrinterDevice.CalcDrawPosition(Self);

        {BitBlt to the printer}
        lMemCanvas.RenderToDevice(Rect(DrawLeft, DrawTop, DrawRight, DrawBottom), 0{ SystemPalette16}, cmSrcCopy);

        lMemCanvas.Free;
{$ENDIF}

        lPrinterDevice.CalcDrawPosition(Self);

        DrawBarCode(lPrinter.Canvas, DrawLeft, DrawTop, lPixelsPerInch, True);



      finally
        FPrinting := False;

      end;

    end

  else if (aDevice is TppScreenDevice) then
    begin

      lScreenDevice := TppScreenDevice(aDevice);


      {calc required barcode size for the printer}
      lPrinter := ppPrinter;

      if (lPrinter = nil) then
        begin
          lCanvas := lScreenDevice.Canvas;
          lCalcUnits := utScreenPixels;
          lPixelsPerInch := Point(Screen.PixelsPerInch, Screen.PixelsPerInch);
        end
      else
        begin
          lCanvas := lPrinter.Canvas;
          lCalcUnits := utPrinterPixels;
          lPixelsPerInch := lPrinter.PixelsPerInch;
        end;


      {adjust size}
      if FOrientation in [orLeftToRight, orRightToLeft] then
        begin
          FDataBits      := CreateDataBits(lPixelsPerInch.X);
          FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.X);

          DrawBarcode(lCanvas, 0, 0, lPixelsPerInch, False);

          Width := ppToMMThousandths(FPortraitWidth,
                                      lCalcUnits, pprtHorizontal, lPrinter);

          Height := ppToMMThousandths(FPortraitHeight,
                                      lCalcUnits, pprtVertical, lPrinter);
        end
      else
        begin
          FDataBits      := CreateDataBits(lPixelsPerInch.Y);
          FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.Y);

          DrawBarcode(lCanvas, 0, 0, lPixelsPerInch, False);

          Width := ppToMMThousandths(FPortraitHeight,
                                      lCalcUnits, pprtHorizontal, lPrinter);

          Height := ppToMMThousandths(FPortraitWidth,
                                      lCalcUnits, pprtVertical, lPrinter);
        end;



      if lCalcUnits <> utScreenPixels then
        begin
          {calc barcode size for screen}
          lPixelsPerInch := Point(Screen.PixelsPerInch, Screen.PixelsPerInch);

          FDataBits      := CreateDataBits(lPixelsPerInch.X);
          FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.X);

          DrawBarcode(lScreenDevice.Canvas, 0, 0, lPixelsPerInch, False);

        end;

      {set drawing coordinates for the image}
      DrawLeft   := 0;
      DrawTop    := 0;

      if FOrientation in [orLeftToRight, orRightToLeft] then
        begin
         DrawRight  := FPortraitWidth;
         DrawBottom := FPortraitHeight;
        end
      else
        begin
         DrawRight   := FPortraitHeight;
         DrawBottom  := FPortraitWidth;
        end;


  {$IFDEF Old}
      lMetaFile := ppMetaFile;
      lMetaFile.Width  := DrawRight-DrawLeft;
      lMetaFile.Height := DrawBottom-DrawTop;

      {note following this line, lMetaFile.Width & lMetaFile.Height will return 0}
      lMetaFileCanvas := TMetaFileCanvas.Create(lMetaFile, 0);

  {$ELSE}    {note: use Bitmap for D1 because scaling for Win3.1 metafiles does not work}

      lBitmap := TBitmap.Create;
      lBitmap.Width  := DrawRight-DrawLeft;
      lBitmap.Height := DrawBottom-DrawTop;

{$ENDIF}


{$IFDEF Old}
      DrawBarCode(lMetaFileCanvas, 0, 0, lPixelsPerInch, True);
      lMetaFileCanvas.Free;
{$ELSE}
      DrawBarCode(lBitmap.Canvas, 0, 0, lPixelsPerInch, True);
{$ENDIF}


      lScreenDevice.ScaleVertices(Self);

      if FTransparent then
        lScreenDevice.Canvas.CopyMode := cmSrcAnd
      else
        lScreenDevice.Canvas.CopyMode := cmSrcCopy;

{$IFDEF Old}
      lScreenDevice.Canvas.StretchDraw(DrawRect, lMetaFile);
{$ELSE}
      lScreenDevice.Canvas.StretchDraw(DrawRect, lBitmap);
      lBitmap.Free;
{$ENDIF}

    end

  else
    Result := False;


end; {function, Draw}

{------------------------------------------------------------------------------}
{ TppDrawBarCode.CalcBarCodeSize }

procedure TppDrawBarCode.CalcBarCodeSize(aCanvas: TCanvas);
var
  lPixelsPerInch: TPoint;
  
begin

  lPixelsPerInch.X := GetDeviceCaps(aCanvas.Handle, LOGPIXELSX);
  lPixelsPerInch.Y := GetDeviceCaps(aCanvas.Handle, LOGPIXELSY);

  FDataBits      := CreateDataBits(lPixelsPerInch.X);
  FAddOnDataBits := CreateAddOnDatabits(lPixelsPerInch.X);

  DrawBarcode(aCanvas, 0, 0, lPixelsPerInch, False);


end; {procedure, CalcBarCodeSize}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.SetFont}

procedure TppDrawBarCode.SetFont(aFont: TFont);
begin
  FFont.Assign(aFont);
end; {procedure, SetFont}



{------------------------------------------------------------------------------}
{ TppDrawBarCode.DrawBarCode}

procedure TppDrawBarCode.DrawBarCode(aCanvas: TCanvas; aX, aY: Integer; aPixelsPerInch: TPoint; aRender: Boolean);
var
  liX: Cardinal;
  liBottom, liTop: Integer;
  lRect: TRect;
  lAbsX: Integer;
  lCompBarWidth: Integer;
  lChar: Char;
  liWidth: Integer;
  liHeight: Integer;
  liDataBits: Cardinal;


  function AdjustSize(Value: Single): Integer;
  begin
    Result := Round(Screen.PixelsPerInch / aPixelsPerInch.Y * Value);
  end;

  function DetermineWidth(var BWidth: Integer): Boolean;

  var
    Test: Integer;

    procedure DetermineOffset;

    begin
      case FBarCodeType of
        bcCode128, bcCode39: HOffset := 0;
        bcPostNet, bcFIM: HOffset := 0;
        bcInt2of5: HOffset := Round(0.03 * Test);

        {offset should be 9 times the barwidth}
        bcEAN_13, bcUPC_A,
        bcEAN_8, bcUPC_E: HOffset := {Round(0.10 * Test);}
           Round(aPixelsPerInch.X * (9 * ppInInches(FBarWidth)));
        bcCodabar : HOffset := 0;
      end;
    end;

  begin
    Test := liDataBits;
    DetermineOffset;
    if FBarCodeType <> bcPostNet then
      Test := Test + (HOffset * 2);
    if (StrLen(FAddOnDataBits) > 0) then
    begin
      Test := Test + (9 * lCompBarWidth) + Integer(StrLen(FAddOnDataBits)); (**)
    end;
    Result := BWidth <> Test;
    BWidth := Test;
  end;

  function DetermineHeight(BWidth: Integer; var BHeight: Integer): Boolean;

  var
    liTest: Integer;
    
  begin

    case FBarCodeType of

      bcCode128, bcCode39:
        liTest := Round(BWidth * 0.25);

      bcEAN_13, bcEAN_8:
        liTest := Round(liDataBits * 0.85);

      bcInt2of5:
        liTest := Round(BWidth * 0.60);

      bcPostNet:
        liTest := Round(lCompBarWidth * 6.25) + 1;

      bcFIM:
        liTest := Round(lCompBarWidth * 20); { should always be 5/8" if the user leaves the default barwidth }

      bcCodabar :
        liTest := Round(BWidth * 0.25);

    else {bcUPC_A, bcUPC_E: }

      liTest := {Round(StrLen(FDataBits) * 0.75);}
                Round(aPixelsPerInch.X * ppInInches(Round(73.85 * FBarWidth)));

    end; {case, FBarCodeType}
    
    if liTest < 5 then
      liTest:= 5;

    Result := liTest <> BHeight;

    BHeight := liTest;

  end;

  procedure DetermineFontSize(AWidth, AHeight: Integer);
  begin

    with aCanvas do
    begin
      aCanvas.Font := Self.Font;


      case FBarCodeType of

        bcCode128, bcCode39, bcCodabar:
          begin
            Font.Size := Round(AdjustSize(AHeight) * 0.25);
            while (Font.Size > 1) and ((aCanvas.TextWidth('0') * Length(FData)) > AWidth) do
              Font.Size := Font.Size - 1;
          end;

        bcEAN_13:
          begin
            Font.Size := Round(AdjustSize(AHeight) * 0.20);
            while (Font.Size > 1) and ((aCanvas.TextWidth('000000')) > (42 * lCompBarWidth)) do
              Font.Size := Font.Size - 1;
          end;

        bcEAN_8:
          begin
            Font.Size := Round(AdjustSize(AHeight) * 0.20);
            while (Font.Size > 1) and ((aCanvas.TextWidth('0000')) > (28 * lCompBarWidth)) do
              Font.Size := Font.Size - 1;
          end;


        bcInt2of5:
          begin
            Font.Size := Round(AdjustSize(AHeight) * 0.15);
            while (Font.Size > 1) and ((aCanvas.TextWidth('0') * Length(FData)) > AWidth) do
              Font.Size := Font.Size - 1;
          end;

        bcPostNet:
          begin
            Font.Size := AdjustSize(AHeight) div 2;
          end;

        bcUPC_A:
          begin
            Font.Size := Round(AdjustSize(AHeight) * 0.20);
            while (Font.Size > 1) and ((aCanvas.TextWidth('0') * 5) > (36 * lCompBarWidth)) do
              Font.Size := Font.Size - 1;
          end;

        bcUPC_E :
        begin
          Font.Size := Round(AdjustSize(AHeight) * 0.20);
          while (Font.Size > 1) and ((aCanvas.TextWidth('0') * 6) > (42 * lCompBarWidth)) do
            Font.Size := Font.Size - 1;
        end;

      // Notice there is no calculation for FIM.  There is absolutely no reason to ever
      // print the human readable.

      end;

    end;
    Font := aCanvas.Font;
  end;

  function or_CalcRect(aRect: TRect): TRect;
  begin
    case FOrientation of
      orLeftToRight:
        begin
          Result.Top    := aY + aRect.Top;
          Result.Bottom := aY + aRect.Bottom;
          Result.Left   := aX + aRect.Left;
          Result.Right  := aX + aRect.Right;
        end;

      orRightToLeft :
        begin
          Result.Top    := aY + lRect.Bottom - aRect.Bottom;
          Result.Bottom := aY + lRect.Bottom - aRect.Top;
          Result.Left   := aX + lRect.Right  - aRect.Left - (aRect.Right - aRect.Left);
          Result.Right  := aX + lRect.Right  - aRect.Left;
         end;

      orTopToBottom :
        begin
          Result.Top    := aY + aRect.Left;
          Result.Bottom := aY + aRect.Right;
          Result.Left   := aX + lRect.Right - aRect.Top;
          Result.Right  := aX + lRect.Right - aRect.Bottom;
        end;
      orBottomToTop:
        begin
          Result.Top    := aY + lRect.Bottom-aRect.Left-1;
          Result.Bottom := aY + lRect.Bottom-aRect.Right-1;
          Result.Left   := aX + aRect.Top;
          Result.Right  := aX + aRect.Bottom;
        end;

    end;

  end;

  procedure or_FillRect(aRect: TRect);
  begin
    aCanvas.FillRect(or_CalcRect(aRect));
  end;

  procedure Or_MoveTo(X,Y: Integer);

  begin
    case FOrientation of
      orLeftToRight: aCanvas.MoveTo(aX + X, aY + Y);
      orRightToLeft: aCanvas.MoveTo(aX + lRect.Right-1-X, aY + lRect.Bottom-Y);
      orTopToBottom: aCanvas.MoveTo(aX + lRect.Right-Y, aY + X);
      orBottomToTop: aCanvas.MoveTo(aX + Y, aY + lRect.Bottom-X-1);
    end;
    lAbsX := X;
  end;

  procedure Or_LineTo(X,Y: Integer; aPenWidth: Integer);
  begin
    aCanvas.Pen.Width := aPenWidth;
    case FOrientation of
      orLeftToRight: aCanvas.LineTo(aX + X, aY + Y);
      orRightToLeft: aCanvas.LineTo(aX + lRect.Right-1-X, aY + lRect.Bottom-Y);
      orTopToBottom: aCanvas.LineTo(aX + lRect.Right-Y, aY + X);
      orBottomToTop: aCanvas.LineTo(aX + Y, aY + lRect.Bottom-X-1);
    end;
  end;


  procedure Or_TextOut(X,Y: Integer; F: TFont; TheText: string);

    begin
      case FOrientation of
        orLeftToRight: ppTextOutRotate(aCanvas, F, aX + X,aY + Y,0,TheText);
        orRightToLeft: ppTextOutRotate(aCanvas, F, aX + lRect.Right-X, aY + lRect.Bottom-Y, 180, TheText);
        orTopToBottom: ppTextOutRotate(aCanvas, F, aX + lRect.Right-Y, aY + X, 270, TheText);
        orBottomToTop: ppTextOutRotate(aCanvas, F, aX + Y,aY + lRect.Bottom-X, 90, TheText);
      end;
    end;

  procedure PrintHumanReadable;

  var
    Human: TRect;

  begin
    with aCanvas do
    begin
      aCanvas.Brush.Color := Color;
      aCanvas.Brush.Style := bsSolid;

      case FBarCodeType of

        bcCode128,bcCode39,bcInt2of5, bcPostNet, bcCodabar :
        begin
          case FAlignment of
            taLeftJustify : Or_TextOut(0,liBottom,aCanvas.Font, StrippedData);
            taCenter      : Or_TextOut((FPortraitWidth - TextWidth(StrippedData)) div 2,liBottom, Font, StrippedData);
            taRightJustify: Or_TextOut((FPortraitWidth - TextWidth(StrippedData)), liBottom, Font, StrippedData);
          end;
        end;

        bcEAN_13 :
        begin
          Human.Top := liBottom;
          Human.Bottom := Human.Top + aCanvas.TextHeight('5');

          Human.Left  := HOffSet + 3  * lCompBarWidth;
          Human.Right := HOffSet + 45 * lCompBarWidth;

          or_FillRect(Human);
          or_TextOut(Human.Left,Human.Top,Font,Copy(FData,2,6));

          Human.Left := HOffSet + 50 * lCompBarWidth;
          Human.Right := HOffSet + 92 * lCompBarWidth;

          or_FillRect(Human);
          Or_TextOut(Human.Left,Human.Top,Font,Copy(FData,8,6));
          Human.Left := 1;
          Human.Top := Human.Bottom - aCanvas.TextHeight('5');
          Human.Right := Human.Left + aCanvas.TextWidth('5');
          Or_TextOut(Human.Left,Human.Top,Font,FData[1]);
        end;

        bcEAN_8 :
        begin
          Human.Top := liBottom;
          Human.Bottom := Human.Top + aCanvas.TextHeight('5');

          Human.Left := HOffSet + 3 * lCompBarWidth;
          Human.Right := HOffSet + (28 + 3) * lCompBarWidth;

          or_FillRect(Human);
          or_TextOut(Human.Left,Human.Top,Font,Copy(FData,1,4));

          Human.Left := HOffSet + 36 * lCompBarWidth;
          Human.Right := HOffSet + (36 + 28) * lCompBarWidth;

          or_FillRect(Human);
          Or_TextOut(Human.Left,Human.Top,Font,Copy(FData,5,4));
        end;


        bcUPC_A :
        begin
          Human.Left   := HOffSet + 10 * lCompBarWidth;
          Human.Top    := liBottom;
          Human.Right  := HOffSet + 45 * lCompBarWidth;
          Human.Bottom := Human.Top + aCanvas.TextHeight('5');

          or_FillRect(Human);
          or_TextOut(Human.Left, (Human.Top + lCompBarWidth) ,Font,Copy(FData,2,5));

          Human.Left  := HOffSet + 50 * lCompBarWidth;
          Human.Right := HOffSet + 85 * lCompBarWidth;

          or_FillRect(Human);
          or_TextOut(Human.Left,(Human.Top + lCompBarWidth),Font,Copy(FData,7,5));

          Font.Size := Font.Size - 2;

          Human.Left  := 1;
          Human.Top   := Human.Top + (Abs(Font.Height) div 2);
          Human.Right := Human.Left + aCanvas.TextWidth('0');
          Or_TextOut(Human.Left,Human.Top,Font,FData[1]);

          // This is actually a bug fix on drawing the check digit when there is an addon code
          Human.Right := HOffset + (95 * lCompBarWidth) + (aCanvas.TextWidth('0') * 2);

          Human.Left  := Human.Right - aCanvas.TextWidth('0');
          Or_TextOut(Human.Left,Human.Top,Font,FData[Length(FData)]);

          Font.Size := Font.Size + 2;

        end;

        bcUPC_E :
        begin
          Human.Left   := HOffSet + 3 * lCompBarWidth;
          Human.Top    := liBottom;
          Human.Right  := HOffSet + 3 + 42 * lCompBarWidth;
          Human.Bottom := Human.Top + aCanvas.TextHeight('5');

          or_FillRect(Human);
          or_TextOut(Human.Left, (Human.Top + lCompBarWidth),Font,Copy(FData,1,6));

          Font.Size := Font.Size - 2;

          Human.Left  := 1;
          Human.Top   := Human.Top + (Abs(Font.Height) div 2);
          Human.Right := Human.Left + aCanvas.TextWidth('0');
          Or_TextOut(Human.Left,Human.Top,Font,'0');

          Human.Right := HOffset + (51 * lCompBarWidth) + (aCanvas.TextWidth('0') * 2);
          Human.Left  := Human.Right - aCanvas.TextWidth('0');
          Or_TextOut(Human.Left,Human.Top,Font,FData[Length(FData)]);

          Font.Size := Font.Size + 2;

        end;
        
     { as above, no code for FIM.}

      end;
    end;
   end;

  procedure DrawAddOnCode;

  var
    D: Integer;
  begin
    with aCanvas do
    begin
      liTop := liTop + aCanvas.TextHeight('0');
      Or_MoveTo(HOffSet + Integer(liDataBits) + (9 * lCompBarWidth), liTop);
      for D := 0 to StrLen(FAddOnDataBits) do
      begin
        if FAddOnDataBits[D] = '1' then
          Or_LineTo(lAbsX, liBottom, 1);
        Or_MoveTo(lAbsX+1, liTop);
      end;
      if FPrintHumanReadable then
        Or_TextOut(HOffset + Integer(liDataBits) +
                     (9 * lCompBarWidth) + Integer(StrLen(FAddOnDataBits)) - aCanvas.TextWidth(FAddOnCode),
                     liTop-aCanvas.TextHeight('0'), Font,FAddOnCode);
    end;
  end;

begin

    if (aCanvas = nil) then Exit;

    liDataBits := StrLen(FDataBits);
    
    with aCanvas do
    begin

      {calc bar width in pixels}
      if FOrientation in [orLeftToRight, orRightToLeft] then
        lCompBarWidth := Round(aPixelsPerInch.X * ppInInches(FBarWidth))
      else
        lCompBarWidth := Round(aPixelsPerInch.Y * ppInInches(FBarWidth));

      {calc width and height required to render the barcode data}
      DetermineWidth(FPortraitWidth);

      if AutoSize then
        DetermineHeight(FPortraitWidth, FPortraitHeight)
      else if FOrientation in [orLeftToRight, orRightToLeft] then
        FPortraitHeight := Round(aPixelsPerInch.Y * ppInInches(Height))
      else
        FPortraitHeight := Round(aPixelsPerInch.Y * ppInInches(Width));

      {calc the font size}
      if FAutoSizeFont and FCodeOk then
        DetermineFontSize(FPortraitWidth, FPortraitHeight)
      else
        aCanvas.Font := Self.Font;

      liTop := 0;

      {adjust the height to accommodate the text}
      if (FPrintHumanReadable) then
        begin
          if AutoSize then
            begin
              liBottom := FPortraitHeight;
              FPortraitHeight := FPortraitHeight + aCanvas.TextHeight('0');
            end
          else
            liBottom := FPortraitHeight - aCanvas.TextHeight('0');
        end
      else
        liBottom := FPortraitHeight;

      if not aRender then Exit;

     {draw background}
     if not Transparent then
       begin

         aCanvas.Brush.Color := Self.Color;
         aCanvas.Brush.Style := bsSolid;
         if FOrientation in [orLeftToRight, orRightToLeft] then
           FillRect(Rect(aX, aY, aX + FPortraitWidth, aY + FPortraitHeight))
         else
           FillRect(Rect(aX, aY, aX + FPortraitHeight, aY + FPortraitWidth));
       end;

      if not FCodeOK then Exit;

      lRect.Top  := 0;
      lRect.Left := 0;

      if FOrientation in [orLeftToRight, orRightToLeft] then
      begin
        lRect.Right  := lRect.Left + FPortraitWidth;
        lRect.Bottom := lRect.Top  + FPortraitHeight;
      end
      else
      begin
        lRect.Right  := lRect.Left + FPortraitHeight;
        lRect.Bottom := lRect.Top  + FPortraitWidth;
      end;

      Pen.Width := 1;
      Pen.Style := psSolid;

      Pen.Color  := FBarColor;
      Font.Color := FBarColor;

      if FBarCodeType = bcPostNet then
      begin
        Or_MoveTo(0+HOffset, liTop);
        for liX := 0 to liDataBits do
        begin
            Or_MoveTo(lAbsX, liTop);
            case FDataBits[liX] of
              '2' :
              begin
                Or_LineTo(lAbsX, liBottom,1 );
                Or_MoveTo(lAbsX + 1, liTop);
              end;
              '1' :
              begin
                Or_MoveTo(lAbsX, Round((liBottom - liTop) * 0.60));
                Or_LineTo(lAbsX, liBottom,1 );
                Or_MoveTo(lAbsX + 1, liTop);
              end;
              '0' :
              begin
                Or_MoveTo(lAbsX + 1, liTop);
              end;
            end;

        end;
      end
      else
      begin
        lAbsX := HOffset;
        aCanvas.Brush.Color := FBarColor;

        {calc bar height}
        if FBarCodeType in cPOSBarCodes then
          liHeight := (liBottom - lCompBarWidth + ((FPortraitHeight - liBottom) div 2)-liTop)
        else
          liHeight := liBottom-liTop;


        liX := 0;

        {draw the bars}
        while (liX <= liDataBits) do
          begin
            lChar := FDataBits[liX];
            liWidth := 0;

            {calc bar width}
            while (lChar = FDataBits[liX]) and (liX <= liDataBits) do
              begin
                Inc(liX);
                Inc(liWidth);
              end;

            {draw a bar}
            if (lAbsX <= FPortraitWidth) and (lChar = '1') then
              or_FillRect(Rect(lAbsX, liTop, lAbsX+liWidth, liTop+liHeight));

            Inc(lAbsX, liWidth);

          end;

          aCanvas.Brush.Color := Self.Color;

      end;


      {draw bearer bars}
      if FBearerBars then
      begin
        aCanvas.Brush.Color := BarColor;
        or_FillRect(Rect(0, 0, FPortraitWidth, 3 * lCompBarWidth));
        or_FillRect(Rect(0,liBottom - (3 * lCompBarWidth), FPortraitWidth, liBottom));
        aCanvas.Brush.Color := Self.Color;
      end;

      { draw human readable }
      if FPrintHumanReadable then
        PrintHumanReadable;

      {draw add on codes}
      if StrLen(FAddOnDataBits) > 0 then
        DrawAddOnCode;


    end;

end; {procedure, DrawBarCode}



{------------------------------------------------------------------------------}
{ TppDrawBarCode.StrippedData }

function TppDrawBarCode.StrippedData: string;
var
  I: Integer;
begin
  { Currently, Code 128 is the only symbology that needs its Data stripped }
  Result := '';
  case FBarCodeType of
    bcCode128 :
    begin
      for I := 1 to Length(FData) do
      begin
        if (FData[I] in [' '..'~']) then
          Result := Result + FData[I];
      end;
    end;
  else
    Result := FData;
  end;
end; {procedure, StrippedData}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.GetSpWidth }

function  TppDrawBarCode.GetSpWidth: Integer;
begin
  Result := Round(ppFromMMThousandths(Width, utScreenPixels, pprtHorizontal, nil));
end; {procedure, GetSpWidth}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.GetSpHeight }

function  TppDrawBarCode.GetSpHeight: Integer;
begin
  Result := Round(ppFromMMThousandths(Height, utScreenPixels, pprtHorizontal, nil));
end; {procedure, GetSpHeight}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.AutoEncode128 }

type
  TSets =   record
    A, B, C : boolean;
  end;

procedure TppDrawBarCode.AutoEncode128(var sData : string);
const
  CharSetA : set of char = [' '..'_', #201, #202, #206, #207, #211..#242];
  CharSetB : set of char = [' '..'_', '`'..#127, #201, #202, #205, #207];
  CharSetC : set of char = ['0'..'9', #207];

  SwitchA = #206;
  SwitchB = #205;
  SwitchC = #204;

  StartA = #208;
  StartB = #209;
  StartC = #210;

  TempShift = #203;

  ControlChars : set of char = [SwitchA, SwitchB, SwitchC, StartA, StartB, StartC, TempShift];
var
  aSets : array[1..255] of TSets;
  i    : integer;
  bPrevC : boolean;
  PotentialSet : TSets;
  S : string;
  CurSet : char;

  procedure StripData(var S : string);
  var
    X : integer;
    tmpS : string;
  begin
    tmpS := '';
    for X := 1 to Length(S) do
    begin
      if not (S[X] in ControlChars) then
        tmpS := tmpS + S[X];
    end;
    S := tmpS;
  end;

  function NumberSets(theSet : TSets) : integer;
  begin
    Result := 0;
    if theSet.A then Inc(Result);
    if theSet.B then Inc(Result);
    if theSet.C then Inc(Result);
  end;

  procedure Output(C : char);
  begin
    {case C of
      StartA : ListBox1.Items.Add('Start A');
      StartB : ListBox1.Items.Add('Start B');
      StartC : ListBox1.Items.Add('Start C');
      SwitchA : ListBox1.Items.Add('Switch to A');
      SwitchB : ListBox1.Items.Add('Switch to B');
      SwitchC : ListBox1.Items.Add('Switch to C');
      TempShift : ListBox1.Items.Add('Temp Shift');
    else
      ListBox1.Items.Add(C);
    end;}
  end;

  procedure DetermineNextSet(iStart : integer; bStart : boolean);
  var
    j : integer;
  begin
    PotentialSet.A := TRUE; PotentialSet.B := TRUE; PotentialSet.C := TRUE;
    j := iStart;
    repeat
      if not ((PotentialSet.A) and (aSets[j].A)) then PotentialSet.A := FALSE;
      if not ((PotentialSet.B) and (aSets[j].B)) then PotentialSet.B := FALSE;
      if not ((PotentialSet.C) and (aSets[j].C)) then PotentialSet.C := FALSE;
      Inc(j);
    until (NumberSets(PotentialSet) = 1) or (j > Length(sData)) or
      { if we're at more than 2 characters and C is still a possibility, use it!}
      ((j >= 2) and (PotentialSet.C));

    if (j > Length(sData)) and (NumberSets(PotentialSet) > 1) then // doesn't matter which start code
      PotentialSet := aSets[iStart];

    // Give precendence to C if there since it's double the density
    if PotentialSet.C then
    begin
      if bStart then
        S := S + StartC
      else
        S := S + SwitchC;
      CurSet := 'C';
    end
    else
    if PotentialSet.A then
    begin
      if bStart then
        S := S + StartA
      else
        S := S + SwitchA;
      CurSet := 'A';
    end
    else
    begin
      if bStart then
        S := S + StartB
      else
        S := S + SwitchB;

      CurSet := 'B';
    end;
  end;

begin
  { The first step is to strip any control codes from the data }
  StripData(sData);
  { The next step is to iterate through each character of data to find out which
    sets apply to that character }
  bPrevC := FALSE;
  for i := 1 to Length(sData) do
  begin
    aSets[i].A := sData[i] in CharSetA;
    aSets[i].B := sData[i] in CharSetB;
    aSets[i].C := FALSE; // default it to false
    if bPrevC then // the previous character was in C, so this one must be too
    begin
      aSets[i].C := TRUE;
      bPrevC := FALSE;
    end
    else // check if this char and next one are in C
    begin
      if i <= Length(sData) - 1 then
      begin
        if (sData[i] in CharSetC) and (sData[i+1] in CharSetC) then
        begin
          aSets[i].C := TRUE;
          bPrevC := TRUE;
        end;
      end;
    end;
    { debug code }
    {ListBox1.Items.Add(sData[i] + ' -- A: ' + B(aSets[i].A) + ' -- B: ' + B(aSets[i].B) +
                            ' -- C: ' + B(aSets[i].C));}

  end;

  S := '';
  { Next step: figure out which start character to use }
  DetermineNextSet(1, TRUE);
  { Here's the real work...  Iterating through the data, figuring out when to switch
    to other sets.  Usually give set C precendence }
  i := 1;
  while (i <= Length(sData)) do
  begin
    if (aSets[i].C) then
    begin
      if (CurSet <> 'C') then
      begin
        { the only time not to switch to C is in the middle of a code when only
          2 numbers are encoded.  We will check for that here. }
        if (i+2 > Length(sData)) or (aSets[i+2].C) then
        begin
          S := S + SwitchC;
          CurSet := 'C';
        end;
      end;
      S := S + sData[i];
      S := S + sData[i+1];
      Inc(i,2);
    end
    else
    begin
      if CurSet = 'C' then
        DetermineNextSet(i, FALSE);
      if CurSet = 'A' then
      begin
        if not aSets[i].A then // it's gotta be B
        begin
          { determine if it's better to temp shift instead of switching }
          if (i < Length(sData)) and (not aSets[i+1].B) then
            S := S + TempShift
          else
          begin
            S := S + SwitchB;
            CurSet := 'B';
          end;
        end;
        S := S + sData[i];
        Inc(i);
      end
      else // CurSet = 'B'
      begin
        if not aSets[i].B then // it's gotta be B
        begin
          { determine if it's better to temp shift instead of switching }
          if (i < Length(sData)) and (not aSets[i+1].A) then
            S := S + TempShift
          else
          begin
            S := S + SwitchA;
            CurSet := 'A';
          end;
        end;
        S := S + sData[i];
        Inc(i);
      end;
    end;
  end;
  { debug }
  for I := 1 to Length(S) do
    Output(S[i]);
  sData := S;
  
end; {procedure, AutoEncode128}


{------------------------------------------------------------------------------}
{ TppDrawBarCode.CreateDataBits }

function TppDrawBarCode.CreateDataBits(PPI: Integer): TppDataBits;
var
  lDataBits: TppDataBits;
  lsMessage: String;

  procedure Add(Kind: Char; Dat: string);

  var
    Rep: Integer;
    R: Single;
    PC: array[0..10] of char;
  begin
    R := PPI * ppInInches(FBarWidth);
    if Kind = 'W' then
      R := R * FWideBar;
    StrPCopy(PC,Dat);
    for Rep := 1 to Round(R) do
      StrCat(lDataBits,  PC);
  end;


  procedure CalcMOD10Check(var theData : string);
  var
    Sum1, Sum2, CheckDigit : Integer;
    I: Integer;

  Begin
    Sum1 := 0;
    Sum2 := 0;
    I:=1;
    While I<= Length(theData) do
    Begin
      Sum1 := Sum1 + StrtoInt(theData[I]);
      Inc(I,2);
    End;
    Sum1 := Sum1 * 3;
    I:=2;
    While I<= Length(theData) - 1 do
    Begin
      Sum2 := Sum2 + StrtoInt(theData[I]);
      Inc(I,2);
    End;
    Sum2:=Sum1 + Sum2;
    CheckDigit := 10 - (Sum2 mod 10);
    If CheckDigit=10 then CheckDigit:=0;

    theData := theData+IntToStr(CheckDigit);
  end;


  procedure CalcUPC_A;

  Var
    LeftDigits, RightDigits: String;
    St: string;
    I,R: Integer;


  begin
    if FCalcCheckDigit then
    begin
      if Length(FData) = 12 then
        FData := Copy(FData,1,11);
      CalcMOD10Check(FData);
    end;
    { build left }
    LeftDigits:='';
    For I:=1 to 6 do
    Begin
      LeftDigits:=LeftDigits+GetEANChar('A', FData[I]);
    End;
    { build right }
    RightDigits:='';
    For I:=7 to 12 do
    Begin
      RightDigits:=RightDigits+GetEANChar('C', FData[I]);
    End;
    St := '101'+LeftDigits+'01010'+RightDigits+'101';
    FillChar(lDataBits, SizeOf(lDataBits), #0);
    for R := 1 to Length(St) do
      Add('N',St[R]);
  End;


  procedure CalcUPC_E;
  var
    sData, sParity, St : string;
    I : integer;
  begin
    if FCalcCheckDigit then
    begin
      if Length(FData) = 7 then
        sData := Copy(FData, 1, 6)
      else
        sData := FData;
      // Here we need to expand the zero-suppressed UPC-E to a full 11 digits
      case sData[6] of
        '0' : Insert('00000', sData, 3);
        '1' : Insert('10000', sData, 3);
        '2' : Insert('20000', sData, 3);
        '3' : Insert('00000', sData, 4);
        '4' : Insert('00000', sData, 5);
        '5'..'9' : Insert('0000', sData, 6);
      end;
      sData := '0' + sData;
      if Length(sData) > 11 then
        sData := Copy(sData,1,11);
      // Calculate the check digit on the full 11 digit code
      CalcMOD10Check(sData);
      // Append the check digit onto the original Data
      FData := FData + sData[12];
    end;
    // set the parity pattern based on the check digit
    case FData[7] of
      '0' : sParity := 'BBBAAA';
      '1' : sParity := 'BBABAA';
      '2' : sParity := 'BBAABA';
      '3' : sParity := 'BBAAAB';
      '4' : sParity := 'BABBAA';
      '5' : sParity := 'BAABBA';
      '6' : sParity := 'BAAABB';
      '7' : sParity := 'BABABA';
      '8' : sParity := 'BABAAB';
      '9' : sParity := 'BAABAB';
    end;
    St := '';
    for I := 1 to 6 do
      St := St + GetEANChar(sParity[I], FData[I]);

    St := '101' + St + '010101';
    for I := 1 to Length(St) do
      Add('N', St[I]);
  end;


  procedure CalcEAN_13;

  Var
    LeftDigits, RightDigits: String;
    Sum1, Sum2, CheckDigit : Integer;
    I: Integer;
    St: string;
    R: Integer;
    SetPattern: string[7];

    Procedure CalcCheck;


    Begin
      Sum1 := 0;
      Sum2 := 0;
      I:=2;
      While I<=12 do
      Begin
        Sum1 := Sum1 + StrtoInt(FData[I]);
        Inc(I,2);
      End;
      Sum1 := Sum1 * 3;
      I:=1;
      While I<=11 do
      Begin
        Sum2 := Sum2 + StrtoInt(FData[I]);
        Inc(I,2);
      End;
      Sum2:=Sum1 + Sum2;
      CheckDigit := 10 - (Sum2 mod 10);
      If CheckDigit=10 then CheckDigit:=0;

      FData := FData+IntToStr(CheckDigit);
    End;

  begin
    if FCalcCheckDigit then
    begin
      if Length(FData) = 13 then
        FData := Copy(FData,1,12);
      CalcCheck;
    end;
    case FData[1] of
      '0': SetPattern := 'AAAAAA';
      '1': SetPattern := 'AABABB';
      '2': SetPattern := 'AABBAB';
      '3': SetPattern := 'AABBBA';
      '4': SetPattern := 'ABAABB';
      '5': SetPattern := 'ABBAAB';
      '6': SetPattern := 'ABBBAA';
      '7': SetPattern := 'ABABAB';
      '8': SetPattern := 'ABABBA';
      '9': SetPattern := 'ABBABA';
    end;

    { build left }
    LeftDigits:='';
    For I:=2 to 7 do
    Begin
      LeftDigits:=LeftDigits+GetEANChar(SetPattern[I-1], FData[I]);
    End;
    { build right }
    RightDigits:='';
    For I:=8 to 13 do
    Begin
      RightDigits:=RightDigits+GetEANChar('C', FData[I]);
    End;
    St := '101'+LeftDigits+'01010'+RightDigits+'101';
    FillChar(lDataBits, SizeOf(lDataBits), #0);
    for R := 1 to Length(St) do
      Add('N',St[R]);
  End;

  procedure CalcEAN_8;
  var
    LeftDigits, RightDigits, St : string;
    I,R : integer;

  begin
    if FCalcCheckDigit then
    begin
      if Length(FData) = 8 then
        FData := Copy(FData,1,7);
      CalcMOD10Check(FData);
    end;
    { build left }
    LeftDigits:='';
    For I:=1 to 4 do
    Begin
      LeftDigits:=LeftDigits+GetEANChar('A', FData[I]);
    End;
    { build right }
    RightDigits:='';
    For I:=5 to 8 do
    Begin
      RightDigits:=RightDigits+GetEANChar('C', FData[I]);
    End;
    St := '101'+LeftDigits+'01010'+RightDigits+'101';
    FillChar(lDataBits, SizeOf(lDataBits), #0);
    for R := 1 to Length(St) do
      Add('N',St[R]);
  end;

  procedure CalcCode39;

  const
    InterGap = 2;

  var
    X,Y: Integer;
    Digit: string;
    TempData: string;
    Rep: Integer;

  begin
    FillChar(lDataBits, SizeOf(lDataBits), #0);
    TempData := FData;
    if TempData[1] <> '*' then
      TempData := '*' + TempData;
    if TempData[Length(TempData)] <> '*' then
      TempData := TempData + '*';
    for X := 1 to Length(TempData) do
    begin
      case Uppercase(TempData[X])[1] of
        ' ': Digit := '011000100';
        '$': Digit := '010101000';
        '%': Digit := '000101010';
        '*': Digit := '010010100';
        '+': Digit := '010001010';
        '-': Digit := '010000101';
        '.': Digit := '110000100';
        '/': Digit := '010100010';
        '0': Digit := '000110100';
        '1': Digit := '100100001';
        '2': Digit := '001100001';
        '3': Digit := '101100000';
        '4': Digit := '000110001';
        '5': Digit := '100110000';
        '6': Digit := '001110000';
        '7': Digit := '000100101';
        '8': Digit := '100100100';
        '9': Digit := '001100100';
        'A': Digit := '100001001';
        'B': Digit := '001001001';
        'C': Digit := '101001000';
        'D': Digit := '000011001';
        'E': Digit := '100011000';
        'F': Digit := '001011000';
        'G': Digit := '000001101';
        'H': Digit := '100001100';
        'I': Digit := '001001100';
        'J': Digit := '000011100';
        'K': Digit := '100000011';
        'L': Digit := '001000011';
        'M': Digit := '101000010';
        'N': Digit := '000010011';
        'O': Digit := '100010010';
        'P': Digit := '001010010';
        'Q': Digit := '000000111';
        'R': Digit := '100000110';
        'S': Digit := '001000110';
        'T': Digit := '000010110';
        'U': Digit := '110000001';
        'V': Digit := '011000001';
        'W': Digit := '111000000';
        'X': Digit := '010010001';
        'Y': Digit := '110010000';
        'Z': Digit := '011010000';
      end;
      for Y := 1 to 9 do
      begin
        if Odd(Y) then {it's a bar}
        begin
          if Digit[Y] = '1' then
            Add('W','1')
          else
            Add('N','1');
        end
        else {it's a space}
        begin
          if Digit[Y] = '1' then
            Add('W','0')
          else
            Add('N','0');
        end;
      end;
      for Rep := 1 to Round(2 * PPI * ppInInches(FBarWidth)) do
        StrCat(lDataBits,'0');
    end;
  end;

  procedure CalcInt2of5;

  var
    Digits: array[0..1] of string;
    X,Y: Integer;


    procedure CalcCheckDigit;
    var
      liIndex: Integer;
      liSum: Integer;
      liCheckDigit: Integer;
      liWeight: Integer;


    begin

      liSum := 0;

      for liIndex := 1 to Length(FData) do
        begin
          {assign weight: 3, 1, 3, 1, ....}
          if Odd(liIndex) then
            liWeight := 3
          else
            liWeight := 1;

          {calculate sum}
          liSum := liSum + (StrToInt(FData[liIndex]) * liWeight);
        end;

      {calc check check digit}
      liCheckDigit := 10 - (liSum mod 10);

      {append check digit}
      FData := FData + IntToStr(liCheckDigit);

    end;

  begin

    if FCalcCheckDigit and Odd(Length(FData)) then
      CalcCheckDigit;

    FillChar(lDataBits,SizeOf(lDataBits),#0);
    Add('N','1'); Add('N','0'); Add('N','1'); Add('N','0');
    X := 1;
    while (X <= Length(FData)) do
    begin
      for Y := 0 to 1 do
      begin
        case FData[X+Y] of
          '0': Digits[Y] := '00110';
          '1': Digits[Y] := '10001';
          '2': Digits[Y] := '01001';
          '3': Digits[Y] := '11000';
          '4': Digits[Y] := '00101';
          '5': Digits[Y] := '10100';
          '6': Digits[Y] := '01100';
          '7': Digits[Y] := '00011';
          '8': Digits[Y] := '10010';
          '9': Digits[Y] := '01010';
        end;
      end;
      for Y := 1 to 5 do
      begin
        if Digits[0][Y] = '1' then
          Add('W','1')
        else
          Add('N','1');
        if Digits[1][Y] = '1' then
          Add('W','0')
        else
          Add('N','0');
      end;
      Inc(X,2);
    end;
    Add('W','1');
    Add('N','0');
    Add('N','1');
  end;

  procedure CalcPostNet;

  var
    Sum: Integer;
    X  : Integer;
    Check: Integer;
    St: string;
    Idx: Integer;
    Rep: Integer;

    function MakeData(C: Char): string;

    var
      S: string;

    begin
      case C of
        '0': S := '22111';
        '1': S := '11122';
        '2': S := '11212';
        '3': S := '11221';
        '4': S := '12112';
        '5': S := '12121';
        '6': S := '12211';
        '7': S := '21112';
        '8': S := '21121';
        '9': S := '21211';
      end;
      Result := S;
    end;

  begin
    FillChar(lDataBits,SizeOf(lDataBits),#0);
    for Rep := 1 to Round(PPI * ppInInches(FBarWidth)) do
      StrCat(lDataBits,'2');
    for Rep := 1 to Round(PPI * ppInInches(FBarWidth) * 1.375) do
      StrCat(lDataBits,'0');
    Sum := 0;
    for X := 1 to Length(FData) do
    begin
      if FData[X] <> '-' then
      begin
        St := MakeData(FData[X]);
        for Idx := 1 to Length(St) do
        begin
          for Rep := 1 to Round(PPI * ppInInches(FBarWidth)) do
          begin
            if St[Idx] = '2' then
              StrCat(lDataBits,'2');
            if St[Idx] = '1' then
              StrCat(lDataBits,'1');
          end;
          for Rep := 1 to Round(PPI * ppInInches(FBarWidth) * 1.375) do
            StrCat(lDataBits,'0');
        end;
        Sum := Sum + StrToInt(FData[X]);
      end;
    end;
    Check := 0;
    while ((Check + Sum) mod 10) <> 0 do
      inc(Check);
    St := MakeData(IntToStr(Check)[1]);
    for Idx := 1 to Length(St) do
    begin
      for Rep := 1 to Round(PPI * ppInInches(FBarWidth)) do
      begin
        if St[Idx] = '2' then
          StrCat(lDataBits,'2');
        if St[Idx] = '1' then
          StrCat(lDataBits,'1');
      end;
      for Rep := 1 to Round(PPI * ppInInches(FBarWidth) * 1.375) do
        StrCat(lDataBits,'0');
    end;
    for Rep := 1 to Round(PPI * ppInInches(FBarWidth)) do
      StrCat(lDataBits,'2');
  end;

  procedure CalcCode128;

  var
    CurCode: char;
    St: string;
    tmpShift: Boolean;
    X: Integer;
    Check, NumChars: longint;

    procedure Encode(St: string);

    var
      C  : Integer;
    begin
      for C := 1 to Length(St) do
        Add('N', St[C]);
    end;

    function GetChar(Value: longint): string;

    begin
      case Value of
        0: Result := '11011001100';   1: Result := '11001101100';   2: Result := '11001100110';
        3: Result := '10010011000';   4: Result := '10010001100';   5: Result := '10001001100';
        6: Result := '10011001000';   7: Result := '10011000100';   8: Result := '10001100100';
        9: Result := '11001001000';   10: Result := '11001000100';  11: Result := '11000100100';
        12: Result := '10110011100';  13: Result := '10011011100';  14: Result := '10011001110';
        15: Result := '10111001100';  16: Result := '10011101100';  17: Result := '10011100110';
        18: Result := '11001110010';  19: Result := '11001011100';  20: Result := '11001001110';
        21: Result := '11011100100';  22: Result := '11001110100';  23: Result := '11101101110';
        24: Result := '11101001100';  25: Result := '11100101100';  26: Result := '11100100110';
        27: Result := '11101100100';  28: Result := '11100110100';  29: Result := '11100110010';
        30: Result := '11011011000';  31: Result := '11011000110';  32: Result := '11000110110';
        33: Result := '10100011000';  34: Result := '10001011000';  35: Result := '10001000110';
        36: Result := '10110001000';  37: Result := '10001101000';  38: Result := '10001100010';
        39: Result := '11010001000';  40: Result := '11000101000';  41: Result := '11000100010';
        42: Result := '10110111000';  43: Result := '10110001110';  44: Result := '10001101110';
        45: Result := '10111011000';  46: Result := '10111000110';  47: Result := '10001110110';
        48: Result := '11101110110';  49: Result := '11010001110';  50: Result := '11000101110';
        51: Result := '11011101000';  52: Result := '11011100010';  53: Result := '11011101110';
        54: Result := '11101011000';  55: Result := '11101000110';  56: Result := '11100010110';
        57: Result := '11101101000';  58: Result := '11101100010';  59: Result := '11100011010';
        60: Result := '11101111010';  61: Result := '11001000010';  62: Result := '11110001010';
        63: Result := '10100110000';  64: Result := '10100001100';  65: Result := '10010110000';
        66: Result := '10010000110';  67: Result := '10000101100';  68: Result := '10000100110';
        69: Result := '10110010000';  70: Result := '10110000100';  71: Result := '10011010000';
        72: Result := '10011000010';  73: Result := '10000110100';  74: Result := '10000110010';
        75: Result := '11000010010';  76: Result := '11001010000';  77: Result := '11110111010';
        78: Result := '11000010100';  79: Result := '10001111010';  80: Result := '10100111100';
        81: Result := '10010111100';  82: Result := '10010011110';  83: Result := '10111100100';
        84: Result := '10011110100';  85: Result := '10011110010';  86: Result := '11110100100';
        87: Result := '11110010100';  88: Result := '11110010010';  89: Result := '11011011110';
        90: Result := '11011110110';  91: Result := '11110110110';  92: Result := '10101111000';
        93: Result := '10100011110';  94: Result := '10001011110';  95: Result := '10111101000';
        96: Result := '10111100010';  97: Result := '11110101000';  98: Result := '11110100010';
        99: Result := '10111011110';  100: Result := '10111101110';  101: Result := '11101011110';
        102: Result := '11110101110';  103: Result := '11010000100';  104: Result := '11010010000';
        105: Result := '11010011100';
      end;
      Check := Check + NumChars * Value;
      inc(NumChars);
    end;

  begin

     if FAutoEncode then
       AutoEncode128(FData);


    case FData[1] of
      #208: begin; CurCode := 'A'; Encode(GetChar(103)); Check := 103; end;
      #209: begin; CurCode := 'B'; Encode(GetChar(104)); Check := 104; end;
      #210: begin; CurCode := 'C'; Encode(GetChar(105)); Check := 105; end;
    else
      begin
        {message: 'Code 128 must begin with a start code (#208, #209 or #210)'}
        DisplayMessage(ppLoadStr(451));
        FCodeOK := False;
        Exit;
      end;
    end;
    NumChars := 1;
    X := 2;
    tmpShift := False;
    while (X <= Length(FData)) do
    begin
      if (FData[X] in [#208,#209,#210]) then
        begin
          {message: 'A start code can only be placed at the beginning of the symbol'}
          DisplayMessage(ppLoadStr(452));
          FCodeOK := False;
          Exit;
        end;

      if (CurCode in ['A','B']) and (FData[X] in [' '..'_']) then
      begin
        Encode(GetChar(Ord(FData[X])-32));
      end;
      if (FData[X] in ['`'..#127]) then
      begin
        if CurCode = 'B' then
          Encode(GetChar(Ord(FData[X])-32))
        else
          begin
            {message: 'Only CODE B can contain the character "' + FData[X] + '"'}
            lsMessage := ppLoadStr(453);
            lsMessage := ppSetMessageParameters(lsMessage);
            lsMessage := Format(lsMessage, [FData[X]]);
            DisplayMessage(lsMessage);
            FCodeOK := False;
            Exit;
          end;
      end;
      if (FData[X] in [#211..#242]) then
      begin
        if CurCode = 'A' then
          Encode(GetChar(Ord(FData[X])-147))
        else
          begin
            {message: 'Only CODE A can contain characters #211 through #242'}
            DisplayMessage(ppLoadStr(454));
            FCodeOK := False;
            Exit;
          end;
      end;
      if (CurCode = 'C') and (not (FData[X] in [#201..#207])) then
      begin
        if (X+1) > Length(FData) then
          begin
            {message: 'The CODE C portion must contain an even number of digits'}
            DisplayMessage(ppLoadStr(455));
            Exit;
          end;
        if (not (FData[X] in ['0'..'9'])) or (not (FData[X+1] in ['0'..'9'])) then
          begin
            {message: 'The CODE C portion must be numeric'}
            DisplayMessage(ppLoadStr(456));
            FCodeOK := False;
            Exit;
          end;

        St := Copy(FData,X,2);
        if St[1] = '0' then St := St[2];
        Encode(GetChar(StrToInt(St)));
        inc(X);

      end
      else
      begin
      if (FData[X] in [#201..#207]) then
      begin
        if (CurCode = 'C') and (FData[X] in [#201..#204]) then
          begin
            {message: 'CODE C does not utilize characters #201 through #204'}
            DisplayMessage(ppLoadStr(457));
            FCodeOK := False;
            Exit;
          end;

        case FData[X] of
          #201: Encode(GetChar(96));
          #202: Encode(GetChar(97));
          #203: {temp shift}
          begin
            if TmpShift then {already shifted}
              begin
                {message: 'You cannot have two shift codes in a row'}
                DisplayMessage(ppLoadStr(458));
                FCodeOK := False;
                Exit;
              end;

            Encode(GetChar(98));
            if CurCode = 'A' then
              CurCode := 'B'
            else
              CurCode := 'A';
            tmpShift := True;
          end;
          #204 :
          begin
            Encode(GetChar(99));
            CurCode := 'C';
          end;
          #205 :
          begin
            Encode(GetChar(100));
            if (CurCode in ['A','C']) then
              CurCode := 'B';
          end;
          #206 :
          begin
            Encode(GetChar(101));
            if (CurCode in ['B','C']) then
              CurCode := 'A';
          end;
          #207: Encode(GetChar(102));
        end;
      end;
      end;
      if FData[X] <> #203 then
      begin
        if tmpShift then
        begin
          if CurCode = 'A' then
            CurCode := 'B'
          else
            CurCode := 'A';
          tmpShift := False;
        end;
      end;
      inc(X);
    end;
    Check := (Check mod 103);
    Encode(GetChar(Check));
    Encode('1100011101011');
  end;


  procedure CalcFIM;
  var
    St : string;
    I : integer;
  begin
    case Uppercase(FData)[1] of
      'A' : St := '110010011';
      'B' : St := '101101101';
      'C' : St := '110101011';
    end;
    for I := 1 to Length(St) do
    begin
      Add('N', St[I]);
      // every bar or space has a space following it equal to the barwidth
      Add('N', '0');
    end;
  end;

  procedure CalcCodabar;

  var
    X,Y: Integer;
    Digit: string;
    TempData: string;
    Rep : integer;
    
  begin
    FillChar(lDataBits, SizeOf(lDataBits), #0);
    TempData := FData;
    for X := 1 to Length(TempData) do
    begin
      case Uppercase(TempData[X])[1] of
        '0': Digit := '0000011';
        '1': Digit := '0000110';
        '2': Digit := '0001001';
        '3': Digit := '1100000';
        '4': Digit := '0010010';
        '5': Digit := '1000010';
        '6': Digit := '0100001';
        '7': Digit := '0100100';
        '8': Digit := '0110000';
        '9': Digit := '1001000';
        '-': Digit := '0001100';
        '$': Digit := '0011000';
        ':': Digit := '1000101';
        '/': Digit := '1010001';
        '.': Digit := '1010100';
        '+': Digit := '0010101';
        'A': Digit := '0011010';
        'B': Digit := '0101001';
        'C': Digit := '0001011';
        'D': Digit := '0001110';
      end;
      for Y := 1 to 7 do
      begin
        if Odd(Y) then {it's a bar}
        begin
          if Digit[Y] = '1' then
            Add('W','1')
          else
            Add('N','1');
        end
        else {it's a space}
        begin
          if Digit[Y] = '1' then
            Add('W','0')
          else
            Add('N','0');
        end;
      end;
      for Rep := 1 to Round(1 * PPI * ppInInches(FBarWidth)) do
        StrCat(lDataBits,'0');

    end;
  end;

begin
  FillChar(lDataBits, SizeOf(lDataBits),#0);

  Result := lDataBits;

  if (FData = '') or not FCodeOK then Exit;

  case FBarCodeType of
    bcCode128: CalcCode128;
    bcCode39: CalcCode39;
    bcEAN_13: CalcEAN_13;
    bcEAN_8 : CalcEAN_8;
    bcInt2of5: CalcInt2of5;
    bcPostNet: CalcPostNet;
    bcUPC_A: CalcUPC_A;
    bcUPC_E : CalcUPC_E;
    bcFIM : CalcFIM;
    bcCodabar : CalcCodabar;
  end;

  if FCodeOK then
    Result := lDataBits;

end; {procedure, CreateDatabits}

{------------------------------------------------------------------------------}
{ TppDrawBarCode.CreateAddOnDatabits }

function TppDrawBarCode.CreateAddOnDatabits(PPI: Integer): TppAddOnDataBits;
var
  lAddOnBits: TppAddOnDataBits;

  procedure Encode(St: string);

  var
    Rep: Integer;
    C  : Integer;
    PC: array[0..9] of char;
    R: Single;
  begin
    R := PPI * ppInInches(FBarWidth);
    for C := 1 to Length(St) do
    begin
      StrPCopy(PC,St[C]);
      for Rep := 1 to Round(R) do
        StrCat(lAddOnBits, PC);
    end;
  end;

  procedure CreateEAN2;

  var
    SetMask: string[2];

  begin
    case (StrToInt(FAddOnCode) mod 4) of
      0: SetMask := 'AA';
      1: SetMask := 'AB';
      2: SetMask := 'BA';
      3: SetMask := 'BB';
    end;
    Encode('1011');
    Encode(GetEANChar(SetMask[1],FAddOnCode[1]));
    Encode('01');
    Encode(GetEANChar(SetMask[2],FAddOnCode[2]));
  end;

  procedure CreateEAN5;

  var
    SetMask: string[5];
    C: Integer;

    procedure CalcSetMask;

    var
      Sum,Sum2: Integer;
      St: string;

    begin
      Sum := StrToInt(FAddOnCode[1]) + StrToInt(FAddOnCode[3]) +StrToInt(FAddOnCode[5]);
      Sum := Sum * 3;
      Sum2 := StrToInt(FAddOnCode[2]) + StrToInt(FAddOnCode[4]);
      Sum2 := Sum2 * 9;
      Sum := Sum + Sum2;
      St := IntToStr(Sum);
      case St[Length(St)] of
        '0': SetMask := 'BBAAA';
        '1': SetMask := 'BABAA';
        '2': SetMask := 'BAABA';
        '3': SetMask := 'BAAAB';
        '4': SetMask := 'ABBAA';
        '5': SetMask := 'AABBA';
        '6': SetMask := 'AAABB';
        '7': SetMask := 'ABABA';
        '8': SetMask := 'ABAAB';
        '9': SetMask := 'AABAB';
      end;
    end;
  begin
    CalcSetMask;
    Encode('1011');
    for C := 1 to 5 do
    begin
      Encode(GetEANChar(SetMask[C],FAddOnCode[C]));
      if C < 5 then
        Encode('01');
    end;
  end;

begin
  FillChar(lAddOnBits,SizeOf(lAddOnBits),#0);

  Result := lAddOnBits;

  if FAddOnCode = '' then Exit;

  if (FBarCodeType in cPOSBarCodes) and (Length(FAddOnCode) = 2) then
    CreateEAN2;

  if (FBarCodeType in cPOSBarCodes) and (Length(FAddOnCode) = 5) then
    CreateEAN5;

  Result := lAddOnBits;

end; {function, CreateAddOnDatabits}



{------------------------------------------------------------------------------}
{ TppDrawBarCode.GetEANChar }

function TppDrawBarCode.GetEANChar(aCharSet, aDigit: Char): string;
begin
    case aCharSet of
      'A' :
      begin
        Case aDigit of
          '0': Result :='0001101';
          '1': Result :='0011001';
          '2': Result :='0010011';
          '3': Result :='0111101';
          '4': Result :='0100011';
          '5': Result :='0110001';
          '6': Result :='0101111';
          '7': Result :='0111011';
          '8': Result :='0110111';
          '9': Result :='0001011';
        end;
      end;
      'B' :
      begin
        Case aDigit of
          '0': Result :='0100111';
          '1': Result :='0110011';
          '2': Result :='0011011';
          '3': Result :='0100001';
          '4': Result :='0011101';
          '5': Result :='0111001';
          '6': Result :='0000101';
          '7': Result :='0010001';
          '8': Result :='0001001';
          '9': Result :='0010111';
        End;
      end;
      'C' :
      begin
        Case aDigit of
          '0': Result:='1110010';
          '1': Result:='1100110';
          '2': Result:='1101100';
          '3': Result:='1000010';
          '4': Result:='1011100';
          '5': Result:='1001110';
          '6': Result:='1010000';
          '7': Result:='1000100';
          '8': Result:='1001000';
          '9': Result:='1110100';
        end;
      end;
    end;
end;




{******************************************************************************
 *
 **  G E N E R A L  R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppInInches }

function ppInInches(aValue: Longint): Single;
begin
 Result := ppFromMMThousandths(aValue, utInches, pprtHorizontal, nil);
end; {function, ppInInches}

{------------------------------------------------------------------------------}
{ ppCreateRotatedFont }

function ppCreateRotatedFont(aFont: TFont; aAngle: Integer): HFont;
{-create a rotated font based on the font object F}
var
  lLogFont: TLogFont;
begin
  FillChar(lLogFont, SizeOf(lLogFont), #0);

  with lLogFont do
  begin
    lfHeight := -Round(aFont.Size * aFont.PixelsPerInch / 72);
    lfWidth := 0;
    lfEscapement := aAngle *10;
    lfOrientation := aAngle * 10;
    lfCharSet := DEFAULT_CHARSET;
    StrPCopy(lfFaceName, aFont.Name);
    lfQuality := DEFAULT_QUALITY;
    lfOutPrecision := OUT_DEFAULT_PRECIS;
    lfClipPrecision := CLIP_DEFAULT_PRECIS;
    if (fsBold in aFont.Style) then
      lfWeight := FW_BOLD;
    lfItalic := Byte(fsItalic in aFont.Style);
    lfUnderline := Byte(fsUnderline in aFont.Style);
    lfStrikeOut := Byte(fsStrikeout in aFont.Style);
  end;
  Result := CreateFontIndirect(lLogFont);

end; {function, ppCreateRotatedFont}

{------------------------------------------------------------------------------}
{ ppTextOutRotate }

procedure ppTextOutRotate(aCanvas: TCanvas; aFont: TFont; aX, aY: Integer; aAngle: longint; aText: string);
var
  hSaveFont, hNewFont: hFont;
  lBrushStyle: TBrushStyle;

begin
  lBrushStyle := aCanvas.Brush.Style;
  aCanvas.Brush.Style := bsClear;

  hNewFont  := 0;
  hSaveFont := 0;
  try
    hNewFont  := ppCreateRotatedFont(aFont, aAngle);
    hSaveFont := SelectObject(aCanvas.Handle, hNewFont);
    aCanvas.TextOut(aX, aY, aText);
  finally
    SelectObject(aCanvas.Handle, hSaveFont);
    DeleteObject(hNewFont);
    aCanvas.Brush.Style := lBrushStyle;

  end;

end; {function, ppTextOutRotate}


{******************************************************************************
 *
 ** F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppParentWnd }

function ppParentWnd: TForm;
begin

  {create global ParentWnd object, if needed}
  if (FParentWnd = nil) then
    begin
       {perform this check in case a .dll is sharing the application global}
       FParentWnd := TForm(Application.FindComponent('TppParentWnd4x0'));

       if (FParentWnd = nil) then
         begin
           {owner is the application, therefore owner will free the form automatically}
           FParentWnd := TForm.Create(Application);
           FParentWnd.Name := 'TppParentWnd4x0';
         end;

    end;

  {return global ParentWnd object }
  Result := FParentWnd;

end;

{------------------------------------------------------------------------------}
{ ppParentWndFree }

procedure ppParentWndFree;
begin
  FParentWnd.Free;
  FParentWnd := nil;
end;


{------------------------------------------------------------------------------}
{ ppMetaFile }

function ppMetaFile: TMetaFile;
begin

  {create global MetaFile object, if needed}
  if FMetaFile = nil then
    FMetaFile := TMetaFile.Create;

  {return global MetaFile object }
  Result := FMetaFile;

end;


{------------------------------------------------------------------------------}
{ ppGetRTFEngine }

function ppGetRTFEngine(aRichEdit: TCustomRichEdit): TppRTFEngine;
begin

  {create global object, if needed}
  if FRTFEngine = nil then
    FRTFEngine := TppRTFEngine.Create;

  FRTFEngine.RichEdit := aRichEdit;

  Result := FRTFEngine;

end; {function, ppGetRTFEngine}

{------------------------------------------------------------------------------}
{ ppRegisterRichEditClass }


procedure ppRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
begin

  FRichEditClass := aRichEditClass;

end; {function, ppRegisterRichEditClass}


{------------------------------------------------------------------------------}
{ ppUnRegisterRichEditClass }

procedure ppUnRegisterRichEditClass(aRichEditClass: TppCustomRichEditClass);
begin
  if (FRichEditClass = aRichEditClass) then
    FRichEditClass := TRichEdit;

end; {function, ppRegisterRichEditClass}


{------------------------------------------------------------------------------}
{ ppRegisterRichEditClass }

function ppGetRichEditClass: TppCustomRichEditClass;
begin

  if FRichEditClass = nil then
    FRichEditClass := TRichEdit;

  Result := FRichEditClass;

end; {function, ppRegisterRichEditClass}


{------------------------------------------------------------------------------}
{ ppGetRichEditLines }

function ppGetRichEditLines(aRichEdit: TCustomRichEdit): TStrings;
begin
   Result := TStrings(ppGetOrdPropValue(aRichEdit, 'Lines'));
end; {function, ppGetRichEditLines}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDrawText, TppDrawVar, TppDrawCalc, TppDrawShape, TppDrawLine,
                   TppDrawImage, TppDrawBarCode, TppDrawRichText, TppDrawVariable]);

  FMetaFile := nil;
  FRTFEngine := nil;

  ppRegisterRichEditClass(TppRichEdit);

finalization

  FMetaFile.Free;
  FRTFEngine.Free;
  if FRichEditModule <> 0 then
    FreeLibrary(FRichEditModule);

  FMetaFile := nil;
  FRTFEngine := nil;

  UnRegisterClasses([TppDrawText, TppDrawVar, TppDrawCalc, TppDrawShape, TppDrawLine,
                     TppDrawImage, TppDrawBarCode, TppDrawRichText, TppDrawVariable]);

end.

