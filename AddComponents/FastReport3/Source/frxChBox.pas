{******************************************}
{ }
{ FastReport v3.0 }
{ Checkbox Add-In Object }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxChBox;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Menus, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxCheckStyle = (csCross, csCheck, csLineCross);

  TfrxCheckBoxObject = class(TComponent) // fake component
  end;

  TfrxCheckBoxView = class(TfrxView)
  private
    FCheckColor:TColor;
    FChecked:Boolean;
    FCheckStyle:TfrxCheckStyle;
    FExpression:String;
    procedure DrawCheck(ARect:TRect);
  public
    constructor Create(AOwner:TComponent); override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure GetData; override;
    class function GetDescription:String; override;
  published
    property BrushStyle;
    property CheckColor:TColor read FCheckColor write FCheckColor;
    property Checked:Boolean read FChecked write FChecked default True;
    property CheckStyle:TfrxCheckStyle read FCheckStyle write FCheckStyle;
    property Color;
    property DataField;
    property DataSet;
    property DataSetName;
    property Expression:String read FExpression write FExpression;
    property Frame;
  end;

implementation

uses frxChBoxRTTI, frxDsgnIntf, frxRes;

constructor TfrxCheckBoxView.Create(AOwner:TComponent);
begin
  inherited;
  FChecked:= True;
  Height:= fr01cm * 5;
  Width:= fr01cm * 5;
end;

class function TfrxCheckBoxView.GetDescription:String;
begin
  Result:= frxResources.Get('obChBox');
end;

procedure TfrxCheckBoxView.DrawCheck(ARect:TRect);
var
  s:String;
begin
  if FChecked then
    with FCanvas, ARect do
    begin
      if FCheckStyle = csLineCross then
      begin
        Pen.Style:= psSolid;
        Pen.Color:= FCheckColor;
        DrawLine(Left, Top, Right, Bottom, FFrameWidth);
        DrawLine(Left, Bottom, Right, Top, FFrameWidth);
      end
      else
      begin
        Font.Name:= 'Wingdings';
        Font.Color:= FCheckColor;
        Font.Style:= [];
        Font.Height:=-(Bottom-Top);
        Font.CharSet:= SYMBOL_CHARSET;
        if FCheckStyle = csCross then
          s:= #251 else
          s:= #252;
        SetBkMode(Handle, Transparent);
        ExtTextOut(Handle, Left+(Right-Left-TextWidth(s)) div 2,
          Top, ETO_CLIPPED, @ARect, PChar(s), 1, nil);
      end;
    end;
end;

procedure TfrxCheckBoxView.Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY:Extended);
begin
  BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);

  DrawBackground;
  DrawCheck(Rect(FX, FY, FX1, FY1));
  DrawFrame;
end;

procedure TfrxCheckBoxView.GetData;
begin
  inherited;
  if IsDataField then
    FChecked:= DataSet.Value[DataField]
  else if FExpression<>'' then
    FChecked:= Report.Calc(FExpression);
end;

initialization
  frxObjects.RegisterObject1(TfrxCheckBoxView, nil, '', 'Other', 0, 24);

end.
