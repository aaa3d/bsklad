{******************************************}
{ }
{ FastReport v3.0 }
{ Barcode Add-in object }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxBarcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, frxBarcod, frxClass, ExtCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxBarCodeObject = class(TComponent); // fake component

  TfrxBarCodeView = class(TfrxView)
  private
    FBarCode:TfrxBarCode;
    FBarType:TfrxBarcodeType;
    FCalcCheckSum:Boolean;
    FExpression:String;
    FHAlign:TfrxHAlign;
    FRotation:Integer;
    FShowText:Boolean;
    FText:String;
    FZoom:Extended;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure GetData; override;
    class function GetDescription:String; override;
    property BarCode:TfrxBarCode read FBarCode;
  published
    property BarType:TfrxBarcodeType read FBarType write FBarType;
    property BrushStyle;
    property CalcCheckSum:Boolean read FCalcCheckSum write FCalcCheckSum default False;
    property Color;
    property DataField;
    property DataSet;
    property DataSetName;
    property Expression:String read FExpression write FExpression;
    property Frame;
    property HAlign:TfrxHAlign read FHAlign write FHAlign default haLeft;
    property Rotation:Integer read FRotation write FRotation;
    property ShowText:Boolean read FShowText write FShowText default True;
    property Text:String read FText write FText;
    property Zoom:Extended read FZoom write FZoom;
  end;

implementation

uses
{$IFNDEF NO_EDITORS}
  frxBarcodeEditor,
{$ENDIF}
  frxBarcodeRTTI, frxDsgnIntf, frxRes;

const
  cbDefaultText = '12345678';

{ TfrxBarCodeView }

constructor TfrxBarCodeView.Create(AOwner:TComponent);
begin
  inherited;

  FBarCode:= TfrxBarCode.Create(nil);
  FBarType:= bcCode39;
  FShowText:= True;
  FZoom:= 1;
  FText:= cbDefaultText;
end;

destructor TfrxBarCodeView.Destroy;
begin
  FBarCode.Free;
  inherited Destroy;
end;

class function TfrxBarCodeView.GetDescription:String;
begin
  Result:= frxResources.Get('obBarC');
end;

procedure TfrxBarCodeView.Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY:Extended);
var
  SaveWidth:Extended;
  ErrorText:String;
  DrawRect:TRect;
begin
  FBarCode.Angle:= FRotation;
  FBarCode.Checksum:= FCalcCheckSum;
  FBarCode.Typ:= FBarType;
  if Color = clNone then
    FBarCode.Color:= clWhite else
    FBarCode.Color:= Color;

  SaveWidth:= Width;

  FBarCode.Text:= FText;
  ErrorText:= '';
  if FZoom < 0.0001 then
    FZoom:= 1;

  try
    if (FRotation = 0) or (FRotation = 180) then
      Width:= FBarCode.Width * FZoom else
      Height:= FBarCode.Width * FZoom;
  except
    on e:Exception do
    begin
      FBarCode.Text:= '12345678';
      ErrorText:= e.Message;
    end;
  end;

  if FHAlign = haRight then
    Left:= Left+SaveWidth-Width
  else if FHAlign = haCenter then
    Left:= Left+(SaveWidth-Width) / 2;

  BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);

  DrawBackground;
  if ErrorText = '' then
    FBarCode.DrawBarcode(Canvas, Rect(FX, FY, FX1, FY1), FShowText)
  else
    with Canvas do
    begin
      Font.Name:= 'Arial';
      Font.Size:= Round(8 * ScaleY);
      Font.Color:= clRed;
      DrawRect:= Rect(FX+2, FY+2, FX1, FY1);
      DrawText(Handle, PChar(ErrorText), Length(ErrorText),
        DrawRect, DT_WORDBREAK);
    end;
  DrawFrame;
end;

procedure TfrxBarCodeView.GetData;
begin
  inherited;
  if IsDataField then
    FText:= DataSet.Value[DataField]
  else if FExpression<>'' then
    FText:= Report.Calc(FExpression);
end;

initialization
  frxObjects.RegisterObject1(TfrxBarCodeView, nil, '', 'Other', 0, 23);

end.
