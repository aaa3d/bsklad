{*****************************************************}
{                                                     }
{               FastReport v2.4                       }
{          FillRect plus Add-in object                }
{       (C) Konstantin Butov for FR 2.4               }
{     For question mail to : kos@sp.iae.nsk.su        }
{                ICQ: 48750138                        }
{*****************************************************}
{Histo :                                              }
{ 14/10/00 : Version 1.001 Create                     }
{*****************************************************}

unit FR_RDot;

{$I FR.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, StdCtrls, ExtCtrls {$IFDEF Delphi4}, ImgList {$ENDIF}
  {$IFDEF Delphi6}
, Variants
{$ENDIF};


type

  TfrFillStyle = (fsDot, fsLineVertical, fsLineHorizontal,fsLineVH,fsSquare,
                  fsFrame,fsEllipse,fsDiagonalR,fsDiagonalL,fsDiagonalRL);

  TfrFillRectObject = class(TComponent)
  end;

  TfrFillRect = packed record
    StepX  : Integer;   //
    StepY  : Integer;   //
    StartX : Integer;   //
    StartY : Integer;   //
    wStyle : TfrFillStyle;
    Color  : TColor;    // Color of Dot
    Size   : Integer;
    Thick  : Integer;
  end;

  TfrFillRectView = class(TfrMemoView)
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    FFillRect: TfrFillRect;
    constructor Create; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure ShowFrame; override;
    procedure DefineProperties; override;
  end;

procedure Register;


implementation

uses FR_Const, Fr_Utils;

procedure PaintFill(FlCanvas: TCanvas; X, Y, X1, Y1: Integer;
  fil: TfrFillRect; FillColor: TColor);
var
  bm: TBitMap;
  x0, y0, xMax, yMax: Integer;

  procedure doDot;
  begin
      while x0 <= xMax  do
      begin
        while y0 <= yMax do
        begin
          bm.Canvas.MoveTo(x0, y0);
          bm.Canvas.LineTo(x0+1,y0);
          INC(y0, fil.StepY );
        end;
        y0:=fil.StartY;
        INC(x0,fil.StepX);
      end;
  end;
  procedure DoLineVertical;
  begin
       while x0 <= xMax do
       begin
         bm.Canvas.MoveTo(x0, y0);
         bm.Canvas.LineTo(x0, yMax);
         INC(x0,fil.StepX);
       end;
  end;
  procedure DOLineHorizontal;
  begin
      while y0 <= yMax do
      begin
        bm.Canvas.MoveTo(x0, y0);
        bm.Canvas.LineTo(xMax, y0);
        INC(y0,fil.StepY);
      end;
  end;
  procedure doSquare;
  Var Delta :integer;
  begin
      Delta := fil.Size div 2;
      while x0 <= xMax  do
      begin
        while y0 <= yMax do
        begin
          bm.Canvas.FillRect(Rect(x0-Delta,y0-Delta, x0+Delta,y0+Delta));
          INC(y0, fil.StepY );
        end;
        y0:=fil.StartY;
        INC(x0,fil.StepX);
      end;
  end;
  procedure DoFrame;
  Var Delta :integer;
  begin
      Delta := fil.Size div 2;
      bm.Canvas.Pen.Width := fil.Thick;
      while x0 <= xMax  do
      begin
        while y0 <= yMax do
        begin
          bm.Canvas.FrameRect(Rect(x0-Delta,y0-Delta, x0+Delta,y0+Delta));
          INC(y0, fil.StepY );
        end;
        y0:=fil.StartY;
        INC(x0,fil.StepX);
      end;
  end;
  procedure DoEllipse;
  Var Delta :integer;
  begin
      Delta := fil.Size div 2;
      bm.Canvas.Pen.Width := fil.Thick;
      bm.Canvas.Brush.Style := bsDiagCross;
      while x0 <= xMax  do
      begin
        while y0 <= yMax do
        begin
          bm.Canvas.Ellipse(Rect(x0-Delta,y0-Delta, x0+Delta,y0+Delta));
          INC(y0, fil.StepY );
        end;
        y0:=fil.StartY;
        INC(x0,fil.StepX);
      end;
  end;
  procedure doDiagonalR;
  var xd1:Integer;
  begin
      xd1:= fil.StartX;
      INC(y0, fil.StepY );
      while y0 <= yMax do
      begin
        bm.Canvas.MoveTo(xd1, y0);
        bm.Canvas.LineTo(x0+fil.StepX, fil.StartY);
        INC(y0, fil.StepY );
        INC(x0,fil.StepX);
      end;
      xd1 :=  fil.StartY+fil.StepX;
      DEC(y0, fil.StepY );
      while xd1 <= xMax  do
      begin
        bm.Canvas.MoveTo(xd1, y0);
        bm.Canvas.LineTo(x0+fil.StepX, fil.StartY);
        INC(x0,fil.StepX);
        INC(xd1,fil.StepX);
      end;
  end;
  procedure doDiagonalL;
  var xd1,yd1:Integer;
  begin
      xd1:= fil.StartX;
      y0 := fil.StartY+ (yMax Div fil.StepY)* fil.StepY ;
      yd1 := y0;
      DEC(y0, fil.StepY );
      while y0 >= fil.StartY do
      begin
        bm.Canvas.MoveTo(xd1, y0);
        bm.Canvas.LineTo(x0+fil.StepX, yd1);
        DEC(y0, fil.StepY );
        INC(x0,fil.StepX);
      end;
      INC(y0, fil.StepY );
      DEC(x0,fil.StepX);
      while xd1 <= xMax  do
      begin
        bm.Canvas.MoveTo(xd1, fil.StartY);
        bm.Canvas.LineTo(x0+fil.StepX, yd1 );
        INC(x0,fil.StepX);
        INC(xd1,fil.StepX);
      end;
  end;
begin
  if FlCanvas = nil then Exit;
  try
    bm := TBitMap.Create;
    bm.Width := X1 - X;
    bm.Height :=Y1 - Y;
//---------------------------------------------------
   x0 := fil.StartX;
   y0 := fil.StartY;
   xMax := bm.Width  - fil.StartX;
   yMax := bm.Height - fil.StartY;

 // FillColor := clWhite; // clTransparent Not Work
 //  if FillColor <> clTransparent then
   if FillColor <> 536870911 then
   begin
     bm.Canvas.Brush.Color := FillColor;
     bm.Canvas.FillRect(Rect(0,0,bm.Width,bm.Height));
   end;

   bm.Canvas.Pen.Color := fil.Color;
   bm.Canvas.Pen.Width := fil.Thick;
    if fil.wStyle = fsDot then
      DoDot;
    if fil.wStyle= fsLineVertical then
      DoLineVertical;
   if fil.wStyle= fsLineHorizontal  then
      DOLineHorizontal;
   if fil.wStyle= fsLineVH  then
   begin
      DoLineVertical;
      x0 := fil.StartX; y0 := fil.StartY;
      DOLineHorizontal;
   end;
   if fil.wStyle = fsSquare then
      DoSquare;
   if fil.wStyle = fsFrame then
      DoFrame;
   if fil.wStyle = fsEllipse then
      DoEllipse;
   if fil.wStyle = fsDiagonalR then
      DoDiagonalR;
   if fil.wStyle = fsDiagonalL then
      DoDiagonalL;
   if fil.wStyle = fsDiagonalRL then
   begin
      DoDiagonalR;
      x0 := fil.StartX; y0 := fil.StartY;
      DoDiagonalL;
   end;


//---------------------------------------------------
    bm.Canvas.Brush.Style := bsClear;
    BitBlt(FlCanvas.Handle, X, Y, bm.Width, bm.Height, bm.Canvas.Handle, 0, 0, SRCCOPY);
  finally
    bm.Free;
  end;
end;

(********************************************************)
constructor TfrFillRectView.Create;
begin
  inherited Create;
  FrameTyp := $FF;
  BaseName := 'FillRect';

  //Default values
  FFillRect.StepX := 10;
  FFillRect.StepY := 10;
  FFillRect.StartX := 1;
  FFillRect.StartY := 1;
  FFillRect.Color  := clBlack;
  FFillRect.Thick  := 1;
  FFillRect.Size   := 5;

  frConsts['fsDot'] := fsDot;
  frConsts['fsLineVertical'] := fsLineVertical;
  frConsts['fsLineHorizontal'] := fsLineHorizontal;
  frConsts['fsLineVH']    := fsLineVH;
  frConsts['fsSquare']    := fsSquare;
  frConsts['fsFrame']     := fsFrame;
  frConsts['fsEllipse']   := fsEllipse;
  frConsts['fsDiagonalR'] := fsDiagonalR;
  frConsts['fsDiagonalL'] := fsDiagonalL;
  frConsts['fsDiagonalRL']:= fsDiagonalRL;
end;

procedure TfrFillRectView.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('InColor', [frdtColor], nil);
  AddProperty('InSize',  [frdtInteger], nil);
  AddProperty('InThick', [frdtInteger], nil);
  AddProperty('StepX',   [frdtInteger], nil);
  AddProperty('StepY',   [frdtInteger], nil);
  AddProperty('StartX',  [frdtInteger], nil);
  AddProperty('StartY',  [frdtInteger], nil);
  AddEnumProperty('Style',
    'fsDot;fsLineVertical;fsLineHorizontal;fsLineVH;fsSquare;fsFrame;fsEllipse;fsDiagonalR;fsDiagonalL;fsDiagonalRL;',
    [fsDot,fsLineVertical,fsLineHorizontal,fsLineVH,fsSquare,fsFrame,fsEllipse,fsDiagonalR,fsDiagonalL,fsDiagonalRL]);
end;

procedure TfrFillRectView.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  with FFillRect do
  if Index = 'STARTX' then
     StartX := Value
  else if Index = 'STARTY' then
     StartY := Value
  else if Index = 'INCOLOR' then
     Color := Value
  else if Index = 'INSIZE' then
  begin
    Size := Value ;
    if Size < 1 then
       Size := 1;
  end
  else if Index = 'INTHICK' then
  begin
    Thick := Value ;
    if Thick < 1 then
       Thick := 1;
  end
  else if Index = 'STEPX' then
  begin
    StepX := Value;
    if StepX < 1 then
       StepX := 1;
  end
  else if Index = 'STEPY' then
  begin
    StepY := Value ;
    if StepY < 1 then
       StepY := 1;
  end
  else if Index = 'STYLE' then
    wStyle := Value
end;

function TfrFillRectView.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  with FFillRect do
  if Index = 'STARTX' then
     Result := StartX
  else if Index = 'STARTY' then
     Result := StartY
  else if Index = 'INCOLOR' then
     Result := Color
  else if Index = 'INSIZE' then
     Result := Size
  else if Index = 'INTHICK' then
     Result := Thick
  else if Index = 'STEPX' then
    Result := StepX
  else if Index = 'STEPY' then
    Result := StepY
  else if Index = 'STYLE' then                        
    Result := wStyle
end;

procedure TfrFillRectView.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  Stream.Read(FFillRect, SizeOf(FFillRect));
end;

procedure TfrFillRectView.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  Stream.Write(FFillRect, SizeOf(FFillRect));
end;


procedure TfrFillRectView.ShowFrame;
  procedure Line(x, y, dx, dy: Integer);
  begin
    Canvas.MoveTo(x, y);
    Canvas.LineTo(x + dx, y + dy);
  end;

  procedure FrameLine(i: Integer);
  begin
    Canvas.Pen.Width := Round(FrameWidth);
    case i of
      0: Line(x + dx, y, 0, dy);
      1: Line(x, y, 0, dy);
      2: Line(x, y + dy, dx, 0);
      3: Line(x, y, dx, 0);
    end;
  end;

begin
  if DisableDrawing then Exit;
  with Canvas do
  begin
     PaintFill(Canvas, X, Y, X + DX, Y + DY, FFillRect,FillColor);
     Pen.Width := Round(FrameWidth);
     Pen.Color := FrameColor;
      if (FrameTyp and $1) <> 0 then FrameLine(0);
      if (FrameTyp and $4) <> 0 then FrameLine(1);
      if (FrameTyp and $2) <> 0 then FrameLine(2);
      if (FrameTyp and $8) <> 0 then FrameLine(3);
   end;
end;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrFillRectObject]);
end;


(****************************************************)
var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
//  Bmp.LoadFromResourceName(hInstance, 'FR_FILLRECTVIEW');
  frRegisterObject(TfrFillRectView, Bmp, 'Insert filled rectangle');

finalization
  frUnRegisterObject(TfrFillRectView);
  Bmp.Free;

end.

