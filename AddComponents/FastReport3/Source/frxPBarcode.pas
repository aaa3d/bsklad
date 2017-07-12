{******************************************}
{ }
{ FastReport v3.0 }
{ PSOFT Barcode Add-in object }
{ http://www.psoft.sk }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPBarcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, EanKod, EanSpecs, frxClass, ExtCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxPBarCodeObject = class(TComponent); // fake component

  TfrxPBarCodeView = class(TfrxView)
  private
    FBarCode:TEan;
    FExpression:String;
    FText:String;
    FLinesColor:TColor;
    FBarType:TTypBarCode;
    FRotation:Integer;
    FFontAutoSize:Boolean;
    FCalcCheckSum:Boolean;
    FShowText:Boolean;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure GetData; override;
    class function GetDescription:String; override;
    property BarCode:TEan read FBarCode;
  published
    property LinesColor:TColor read FLinesColor write FLinesColor default clBlack;
    property BarType:TTypBarCode read FBarType write FBarType;
    property Rotation:Integer read FRotation write FRotation;
    property Font;
    property FontAutoSize:Boolean read FFontAutoSize write FFontAutoSize default True;
    property CalcCheckSum:Boolean read FCalcCheckSum write FCalcCheckSum default False;
    property ShowText:Boolean read FShowText write FShowText default True;
    property Color;
    property DataField;
    property DataSet;
    property DataSetName;
    property Expression:String read FExpression write FExpression;
    property Frame;
    property Text:String read FText write FText;
  end;

implementation

uses
{$IFNDEF NO_EDITORS}
  frxPBarcodeEditor,
{$ENDIF}
  frxPBarcodeRTTI, frxDsgnIntf, frxRes;

{ TfrxPBarCodeView }

constructor TfrxPBarCodeView.Create(AOwner:TComponent);
begin
  inherited;
  FBarCode:= TEan.Create(nil);
  FLinesColor:= clBlack;
  FFontAutoSize:= True;
  FShowText:= True;
end;

destructor TfrxPBarCodeView.Destroy;
begin
  FBarCode.Free;
  inherited Destroy;
end;

class function TfrxPBarCodeView.GetDescription:String;
begin
  Result:= 'PSOFT Barcode object';
end;

procedure TfrxPBarCodeView.Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY:Extended);
begin
  FBarCode.LinesColor:= FLinesColor;
  FBarCode.BackgroundColor:= Color;
  FBarCode.Transparent:= Color = clNone;

  FBarCode.Angle:= FRotation;
  FBarCode.Font.Assign(Font);
  FBarCode.FontAutoSize:= FFontAutoSize;

  FBarCode.AutoCheckDigit:= FCalcCheckSum;
  FBarCode.TypBarCode:= FBarType;
  if FText<>'' then
    FBarCode.BarCode:= FText;
  FBarcode.ShowLabels:= FShowText;

  BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
  PaintBarCode(Canvas, Rect(FX, FY, FX1, FY1), FBarCode);
  DrawFrame;
end;

procedure TfrxPBarCodeView.GetData;
begin
  inherited;
  if IsDataField then
    FText:= DataSet.Value[DataField]
  else if FExpression<>'' then
    FText:= Report.Calc(FExpression);
end;

initialization
  frxObjects.RegisterObject1(TfrxPBarCodeView, nil, '', 'Other', 0, 23);

end.
