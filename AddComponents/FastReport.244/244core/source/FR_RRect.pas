{*****************************************************}
{                                                     }
{               FastReport v2.4                       }
{          RoundRect plus Add-in object               }
{       (C) Guilbaud Olivier for FR 2.4               }
{    Some corrections by Alexander Tzyganenko         }
{     For question mail to : golivier@free.fr         }
{*****************************************************}
{Histo :                                              }
{ 29/04/99 : Création                                 }
{ 30/04/99 : Corrections minueurs                     }
{            Changer le TButton en TImage             }
{            pour le choix de la couleur              }
{            de l'ombre.                              }
{            Initialisé avec mots entiers             }
{            par defaut                               }
{ 22/06/99 : Ajouté la possibilité de dégradé         }
{            mais dans ce cas, c'est un rectangle     }
{ 10/11/99 : Update for the FR 2.31 version           }
{*****************************************************}

unit FR_RRect;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, StdCtrls, ExtCtrls {$IFDEF Delphi4}, ImgList {$ENDIF};

type
  {There are six different gradient styles available.}
  TfrGradientStyle = (gsHorizontal, gsVertical, gsElliptic, gsRectangle,
                      gsVertCenter, gsHorizCenter);

  TfrRoundRectObject = class(TComponent)  // fake component
  end;

  TfrRoundRect = packed record
    SdColor: TColor;    // Color of Shadow
    wShadow: Integer;   // Width of shadow
    Cadre  : Boolean;   // Frame On/Off - not used /TZ/
    sCurve : Boolean;   // RoundRect On/Off
    wCurve : Integer;   // Curve size
  end;

  TfrRoundRectView = class(TfrMemoView)
  private
    Oldgapx, Oldgapy: Integer;
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    Cadre: TfrRoundRect;
    constructor Create; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure CalcGaps; override;
    procedure RestoreCoord; override;
    procedure ShowFrame; override;
    procedure ShowBackGround; override;
    procedure DefineProperties; override;
    procedure ShowEditor; override;
  end;

  TfrRoundRectForm = class(TForm)
    M1: TMemo;
    Button5: TButton;
    Button6: TButton;
    lblSample: TLabel;
    colorDlg: TColorDialog;
    bOk: TButton;
    bCancel: TButton;
    Image1: TImage;
    imgSample: TImage;
    cbGradian: TCheckBox;
    panCurve: TPanel;
    cmShadow: TCheckBox;
    sCurve: TEdit;
    lblSWidth: TLabel;
    ShWidth: TEdit;
    lblSColor: TLabel;
    bcolor: TImage;
    panGrad: TPanel;
    Label1: TLabel;
    bcolor3: TImage;
    Label2: TLabel;
    bColor2: TImage;
    cbStyle: TComboBox;
    Label3: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bColorClick(Sender: TObject);
    procedure ShWidthChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbCadreClick(Sender: TObject);
    procedure cmShadowClick(Sender: TObject);
    procedure M1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGradianClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FView: TfrRoundRectView;
    ShadowColor: TColor;
    NormalColor: TColor;
    procedure ChgColorButton(S: TObject; C: TColor);
    procedure UpdateSample;
    procedure Localize;
  public
  end;


implementation

uses FR_Const, Fr_Utils
{$IFDEF Delphi6}
, Variants
{$ENDIF};

{$R *.DFM}
{$R *.RES}

procedure PaintGrad(Cv: TCanvas; X, Y, X1, Y1: Integer;
  FBeginClr, FEndClr: TColor; FGradientStyle: TfrGradientStyle);
var
  FromR, FromG, FromB: Integer; //These are the separate color values for RGB
  DiffR, DiffG, DiffB: Integer; // of color values.
  rct: TRect;                   //Rectangle used to draw frame around button
  bm: TBitMap;

{To speed things up and reduce flicker, I use a Bitmap to draw the button in
 its entirety, ten BitBlt it to the canvas of the control.}
procedure DoHorizontal(fr, fg, fb, dr, dg, db: Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B: Byte;
begin
  ColorRect.Top := 0;                        //Set rectangle top
  ColorRect.Bottom := bm.Height;
  for I := 0 to 255 do
  begin         //Make lines (rectangles) of color
    ColorRect.Left := MulDiv (I, bm.Width, 256);    //Find left for this color
    ColorRect.Right := MulDiv (I + 1, bm.Width, 256);   //Find Right
    R := fr + MulDiv(I, dr, 255);            //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    bm.Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    bm.Canvas.FillRect(ColorRect);           //Draw on Bitmap
  end;
end;

procedure DoVertical(fr, fg, fb, dr, dg, db: Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B: Byte;
begin
  ColorRect.Left := 0;                //Set rectangle left&right
  ColorRect.Right := bm.Width;
  for I := 0 to 255 do
  begin                               //Make lines (rectangles) of color
    ColorRect.Top := MulDiv (I, bm.Height, 256);    //Find top for this color
    ColorRect.Bottom := MulDiv (I + 1, bm.Height, 256);   //Find Bottom
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    bm.Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    bm.Canvas.FillRect(ColorRect);           //Draw on Bitmap
  end;
end;

procedure DoElliptic(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B: Byte;
  Pw, Ph: Double;
  x1, y1, x2, y2: Double;
{The elliptic is a bit different, since I had to use real numbers. I cut down
 on the number (to 155 instead of 255) of iterations in an attempt to speed
 things up, to no avail.  I think it just takes longer for windows to draw an
 ellipse as opposed to a rectangle.}
begin
  bm.Canvas.Pen.Style := psClear;
  bm.Canvas.Pen.Mode := pmCopy;
  x1 := 0 - (bm.Width / 4);
  x2 := bm.Width + (bm.Width / 4);
  y1 := 0 - (bm.Height / 4);
  y2 := bm.Height + (bm.Height / 4);
  Pw := ((bm.Width / 4) + (bm.Width / 2)) / 155;
  Ph := ((bm.Height / 4) + (bm.Height / 2)) / 155;
  for I := 0 to 155 do
  begin                              //Make ellipses of color
    x1 := x1 + Pw;
    x2 := X2 - Pw;
    y1 := y1 + Ph;
    y2 := y2 - Ph;
    R := fr + MulDiv(I, dr, 155);    //Find the RGB values
    G := fg + MulDiv(I, dg, 155);
    B := fb + MulDiv(I, db, 155);
    bm.Canvas.Brush.Color := R or (G shl 8) or (b shl 16);   //Plug colors into brush
    bm.Canvas.Ellipse(Trunc(x1), Trunc(y1), Trunc(x2), Trunc(y2));
  end;
  bm.Canvas.Pen.Style := psSolid;
end;

procedure DoRectangle(fr, fg, fb, dr, dg, db: Integer);
var
  I: Integer;
  R, G, B: Byte;
  Pw, Ph: Real;
  x1, y1, x2, y2: Double;
begin
  bm.Canvas.Pen.Style := psClear;
  bm.Canvas.Pen.Mode := pmCopy;
  x1 := 0;
  x2 := bm.Width;
  y1 := 0;
  y2 := bm.Height;
  Pw := (bm.Width / 2) / 255;
  Ph := (bm.Height / 2) / 255;
  for I := 0 to 255 do
  begin                              //Make rectangles of color
    x1 := x1 + Pw;
    x2 := X2 - Pw;
    y1 := y1 + Ph;
    y2 := y2 - Ph;
    R := fr + MulDiv(I, dr, 255);    //Find the RGB values
    G := fg + MulDiv(I, dg, 255);
    B := fb + MulDiv(I, db, 255);
    bm.Canvas.Brush.Color := RGB(R, G, B);   //Plug colors into brush
    bm.Canvas.FillRect(Rect(Trunc(x1), Trunc(y1), Trunc(x2), Trunc(y2)));
  end;
  bm.Canvas.Pen.Style := psSolid;
end;

procedure DoVertCenter(fr, fg, fb, dr, dg, db: Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B: Byte;
  Haf: Integer;
begin
  Haf := bm.Height Div 2;
  ColorRect.Left := 0;
  ColorRect.Right := bm.Width;
  for I := 0 to Haf do
  begin
    ColorRect.Top := MulDiv(I, Haf, Haf);
    ColorRect.Bottom := MulDiv(I + 1, Haf, Haf);
    R := fr + MulDiv(I, dr, Haf);
    G := fg + MulDiv(I, dg, Haf);
    B := fb + MulDiv(I, db, Haf);
    bm.Canvas.Brush.Color := RGB(R, G, B);
    bm.Canvas.FillRect(ColorRect);
    ColorRect.Top := bm.Height - (MulDiv (I, Haf, Haf));
    ColorRect.Bottom := bm.Height - (MulDiv (I + 1, Haf, Haf));
    bm.Canvas.FillRect(ColorRect);
  end;
end;

procedure DoHorizCenter(fr, fg, fb, dr, dg, db: Integer);
var
  ColorRect: TRect;
  I: Integer;
  R, G, B: Byte;
  Haf: Integer;
begin
  Haf := bm.Width Div 2;
  ColorRect.Top := 0;
  ColorRect.Bottom := bm.Height;
  for I := 0 to Haf do
  begin
    ColorRect.Left := MulDiv(I, Haf, Haf);
    ColorRect.Right := MulDiv(I + 1, Haf, Haf);
    R := fr + MulDiv(I, dr, Haf);
    G := fg + MulDiv(I, dg, Haf);
    B := fb + MulDiv(I, db, Haf);
    bm.Canvas.Brush.Color := RGB(R, G, B);
    bm.Canvas.FillRect(ColorRect);
    ColorRect.Left := bm.Width - (MulDiv (I, Haf, Haf));
    ColorRect.Right := bm.Width - (MulDiv (I + 1, Haf, Haf));
    bm.Canvas.FillRect(ColorRect);
  end;
end;

begin
  if Cv = nil then Exit;
  try
    bm := TBitMap.Create;
    bm.Width := X1 - X;          //Set BMP dimensions to match control's
    bm.Height :=Y1 - Y;
    rct := Rect(0, 0, bm.Width, bm.Height);  //Set rectangle size for later use
    FromR := FBeginClr and $000000ff;  //Strip out separate RGB values
    FromG := (FBeginClr shr 8) and $000000ff;
    FromB := (FBeginClr shr 16) and $000000ff;
    DiffR := (FEndClr and $000000ff) - FromR;   //Find the difference
    DiffG := ((FEndClr shr 8) and $000000ff) - FromG;
    DiffB := ((FEndClr shr 16) and $000000ff) - FromB;
    //Depending on gradient style selected, go draw it on the Bitmap canvas.
    if FGradientStyle = gsHorizontal then
      DoHorizontal(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    if FGradientStyle = gsVertical then
      DoVertical(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    if FGradientStyle = gsElliptic then
      DoElliptic(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    if FGradientStyle = gsRectangle then
      DoRectangle(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    if FGradientStyle = gsVertCenter then
      DoVertCenter(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    if FGradientStyle = gsHorizCenter then
      DoHorizCenter(FromR, FromG, FromB, DiffR, DiffG, DiffB);
    //By setting the Brush style to Clear, it will draw without overlaying bkgrnd
    bm.Canvas.Brush.Style := bsClear;  //Gradient is done, time for Hilite-Shadow
    {Finally, the button is all painted on the bitmap canvas. Now we just need
     to copy it to the canvas of our control.  BitBlt is one method; there are
     several others.}
    BitBlt(Cv.Handle, X, Y, bm.Width, bm.Height, bm.Canvas.Handle, 0, 0, SRCCOPY);
  finally
    bm.Free;
  end;
end;

(********************************************************)
constructor TfrRoundRectView.Create;
begin
  inherited Create;

  //Initialization
  FrameTyp := $FF;
  BaseName := 'RoundRect';

  //Default values
  Cadre.SdColor := clGray;
  Cadre.wShadow := 6;
  Cadre.Cadre := True;
  Cadre.sCurve := True;
  Cadre.wCurve := 10;

  frConsts['gsVertical'] := gsVertical;
  frConsts['gsHorizontal'] := gsHorizontal;
  frConsts['gsElliptic'] := gsElliptic;
  frConsts['gsRectangle'] := gsRectangle;
  frConsts['gsHorizCenter'] := gsHorizCenter;
  frConsts['gsVertCenter'] := gsVertCenter;
end;

procedure TfrRoundRectView.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('ShadowColor', [frdtColor], nil);
  AddProperty('ShadowWidth', [frdtInteger], nil);
  AddProperty('RoundRect', [frdtBoolean], nil);
  AddProperty('RoundSize', [frdtInteger], nil);
  AddProperty('Gradient', [frdtBoolean], nil);
  AddEnumProperty('Style',
    'gsVertical;gsHorizontal;gsElliptic;gsRectangle;gsHorizCenter;gsVertCenter',
    [gsVertical,gsHorizontal,gsElliptic,gsRectangle,gsHorizCenter,gsVertCenter]);
  AddProperty('BeginColor', [frdtColor], nil);
  AddProperty('EndColor', [frdtColor], nil);
end;

procedure TfrRoundRectView.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  with Cadre do
  if Index = 'SHADOWCOLOR' then
    SdColor := Value
  else if Index = 'SHADOWWIDTH' then
    wShadow := Value
  else if Index = 'ROUNDRECT' then
    sCurve := Value
  else if Index = 'ROUNDSIZE' then
    wCurve := Value
  else if Index = 'GRADIENT' then
    if Boolean(Value) then
    begin
      wShadow := -99;
      wCurve := 0;
    end
    else
      wShadow := 10
  else if Index = 'STYLE' then
    wCurve := Value
  else if Index = 'BEGINCOLOR' then
    SdColor := Value
  else if Index = 'ENDCOLOR' then
    FillColor := Value
end;

function TfrRoundRectView.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  with Cadre do
  if Index = 'SHADOWCOLOR' then
    Result := SdColor
  else if Index = 'SHADOWWIDTH' then
    Result := wShadow
  else if Index = 'ROUNDRECT' then
    Result := sCurve
  else if Index = 'ROUNDSIZE' then
    Result := wCurve
  else if Index = 'GRADIENT' then
    Result := wShadow = -99
  else if Index = 'STYLE' then
    if wShadow = -99 then
      Result := wCurve else
      Result := 0
  else if Index = 'BEGINCOLOR' then
    Result := SdColor
  else if Index = 'ENDCOLOR' then
    Result := FillColor
end;

procedure TfrRoundRectView.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  Stream.Read(Cadre, SizeOf(Cadre));
end;

procedure TfrRoundRectView.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  Stream.Write(Cadre, SizeOf(Cadre));
end;

procedure TfrRoundRectView.CalcGaps;
begin
  Oldgapx := gapx;
  Oldgapy := gapy;
  inherited CalcGaps;

  if Cadre.wShadow <> -99 then
  begin
    DRect.Right := DRect.Right - Cadre.wShadow;
    DRect.Bottom := DRect.Bottom - Cadre.wShadow;
  end;
  gapx := gapx + (Cadre.wCurve div 4);
  gapy := gapy + (Cadre.wCurve div 4);
end;

procedure TfrRoundRectView.RestoreCoord;
begin
  inherited RestoreCoord;
  gapx := Oldgapx;
  gapy := Oldgapy;
end;

procedure TfrRoundRectView.ShowBackGround;
var
  OldDRect: TRect;
  OldFill: TColor;
begin
  // prevent screen garbage in designer
  if (DocMode <> dmDesigning) or (Cadre.wShadow = -99) then Exit;
  OldDRect := DRect;
  OldFill := FillColor;
  DRect := Rect(x, y, x + dx + 1, y + dy + 1);
  FillColor := clWhite;
  inherited;
  DRect := OldDRect;
  FillColor := OldFill;
end;

procedure TfrRoundRectView.ShowFrame;
var
  FSW, FCU: Integer;

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
    if Cadre.wShadow = -99 then
    begin
      if Cadre.wCurve < 0 then
        Cadre.wCurve := 0;
      PaintGrad(Canvas, X, Y, X + DX, Y + DY, FillColor, Cadre.SdColor,
        TfrGradientStyle(Cadre.wCurve));
      Pen.Width := Round(FrameWidth);
      Pen.Color := FrameColor;

      if (FrameTyp and $1) <> 0 then FrameLine(0);
      if (FrameTyp and $4) <> 0 then FrameLine(1);
      if (FrameTyp and $2) <> 0 then FrameLine(2);
      if (FrameTyp and $8) <> 0 then FrameLine(3);

      Exit;
    end;

    // Trace l'ombre
    Pen.Style := psSolid;
    Brush.Style := bsClear;
    Pen.Color := Cadre.SdColor;
    Pen.Width := Round(FrameWidth);
    Brush.Color := Cadre.SdColor;

    FSW := Round(Cadre.wShadow * ScaleY);
    FCU := Round(Cadre.wCurve * ScaleY);

    if Cadre.sCurve then
      RoundRect(x + FSW, y + FSW, x + dx + 1, y + dy + 1, FCu, Fcu) else
      Rectangle(x + FSW, y + FSW, x + dx + 1, y + dy + 1);

    // Trace la zone de texte
    Pen.Width := Round(FrameWidth);
    Cadre.Cadre := ((FrameTyp and $F) = $F); // Si zone de cadre désactivée

    if not Cadre.Cadre then
      Pen.Color := FillColor else
      Pen.Color := FrameColor; // Trace le cadre

    Brush.Color := FillColor;
    if Cadre.sCurve then
      RoundRect(x, y, x + dx + 1 - FSW, y + dy + 1 - FSW, FCu, Fcu) else
      Rectangle(x, y, x + dx + 1 - FSW, y + dy + 1 - FSW);
  end;
end;

procedure TfrRoundRectView.ShowEditor;
begin
  with TfrRoundRectForm.Create(nil) do
  begin
    FView := Self;
    M1.Lines.Assign(Memo);
    shWidth.Text := IntToStr(Cadre.wShadow);
    if Cadre.wShadow <> -99 then
    begin // RoundRect
      cbGradian.Checked := False;
      ShadowColor := Cadre.sdColor;
      NormalColor := FillColor;
      cmShadow.Checked := Cadre.sCurve;
      sCurve.Text := IntToStr(Cadre.wCurve);
    end
    else
    begin //Gradian
      cbGradian.Checked := True;
      ShadowColor := Cadre.sdColor;
      NormalColor := FillColor;
      if Cadre.wCurve > cbStyle.Items.Count - 1 then
        Cadre.wCurve := 0;
      cbStyle.ItemIndex := Cadre.wCurve;
    end;

    if ShowModal = mrOk then
    begin
      frDesigner.BeforeChange;
      Memo.Assign(M1.Lines);
      Cadre.sdColor := ShadowColor;
      FillColor := NormalColor;
      Cadre.sCurve := cmShadow.Checked;
      try
        Cadre.wShadow := StrToInt(shWidth.Text);
      except
        Cadre.wShadow := 6;
      end;

      try
        Cadre.wCurve := StrToInt(sCurve.Text);
        if Cadre.wShadow = -99 then
          Cadre.wCurve := cbStyle.ItemIndex;
      except
        Cadre.wCurve := 10;
      end;
    end;
    Free;
  end;
end;


(****************************************************)
procedure TfrRoundRectForm.Localize;
var
  i: Integer;
  s: String;
begin
  Caption := frLoadStr(frRes + 670);
  LblSample.Caption := frLoadStr(frRes + 671);
  Button5.Caption   := frLoadStr(frRes + 672);
  Button6.Caption   := frLoadStr(frRes + 673);
  cbGradian.Caption := frLoadStr(frRes + 674);
  lblSWidth.Caption := frLoadStr(frRes + 675);
  LblSColor.Caption := frLoadStr(frRes + 676);
  cmShadow.Caption  := frLoadStr(frRes + 677);
  Label1.Caption    := frLoadStr(frRes + 679);
  Label2.Caption    := frLoadStr(frRes + 680);
  Label3.Caption    := frLoadStr(frRes + 681);
  bColor.Hint       := frLoadStr(frRes + 683);
  bColor2.Hint      := bColor.Hint;
  bColor3.Hint      := bColor3.Hint;
  BOk.Caption       := frLoadStr(SOk);
  bCancel.Caption   := frLoadStr(SCancel);

  cbStyle.Items.CommaText := frLoadStr(frRes + 682);
  for i := 0 to cbStyle.Items.Count - 1 do
  begin
    s := cbStyle.Items.Strings[i];
    if Pos('_', s) <> 0 then
    begin
      s[Pos('_', s)] := ' ';
      cbStyle.Items.Strings[i] := s;
    end;
  end;
end;

procedure TfrRoundRectForm.FormCreate(Sender: TObject);
begin
  Localize;
  panGrad.Left := panCurve.Left;
  panGrad.Top := panCurve.Top;
  panGrad.Visible := False;
end;

procedure TfrRoundRectForm.Button5Click(Sender: TObject);
var
  s: String;
begin
  s := frDesigner.InsertExpression;
  if s <> '' then
    M1.SelText := s;
  M1.SetFocus;
end;

procedure TfrRoundRectForm.Button6Click(Sender: TObject);
var
  s: String;
begin
  s := frDesigner.InsertExpression;
  if s <> '' then
    M1.SelText := s;
  M1.SetFocus;
end;

procedure TfrRoundRectForm.ChgColorButton(S: TObject; C: TColor);
var
  BM: TBitmap;
  Bc: TImage;
begin
  BM := TBitmap.Create;
  Bc := S as TImage;
  BM.Height := bC.Height;
  BM.Width := bC.Width;

  with BM.Canvas do
  begin
    Pen.Color := clBlack;
    Brush.Color := C;
    Rectangle(0, 0, bC.Width, bC.Height);
  end;
  if Bc.Tag = 0 then
    ShadowColor := C else
    NormalColor := C;

  bC.Picture.Assign(BM);
  BM.Free;
end;

procedure TfrRoundRectForm.UpdateSample;
var
  CC: TCanvas;
  FsW: Integer;
  FCu: Integer;
  BM: TBitmap;
begin
  try
    FsW := StrToInt(ShWidth.Text);
  except
    FsW := 10;
  end;

  try
    FCu := StrToInt(SCurve.Text);
  except
    FCu := 10;
  end;

  BM := TBitmap.Create;
  BM.Height := imgSample.Height;
  BM.Width := imgSample.Width;

  CC := BM.Canvas;

  if cbGradian.Checked then
  begin
    FsW := cbStyle.ItemIndex;
    if FsW < 0 then FsW:=0;
    PaintGrad(CC, 0, 0, bm.Width, bm.Height, NormalColor, ShadowColor,
      TfrGradientStyle(FsW));
  end
  else
  begin
    // Réinitialise le panel
    CC.Pen.Color := clBtnFace;
    CC.Brush.Color := clBtnFace;
    CC.Rectangle(0, 0, imgSample.Width, imgSample.Height);

    // Trace l'ombre
    CC.Pen.Color := ShadowColor;
    CC.Brush.Color := ShadowColor;

    if cmShadow.Checked then
      CC.RoundRect(0 + FSW, 0 + FSW, imgSample.Width, imgSample.Height,
        FCu, FCu)
    else
      CC.Rectangle(0 + FSW, 0 + FSW, imgSample.Width, imgSample.Height);

    // Trace la zone de texte
    if FView.FrameTyp = 0 then
      CC.Pen.Color := NormalColor else
      CC.Pen.Color := FView.FrameColor; // Trace le cadre

    CC.Brush.Color := NormalColor;
    if cmShadow.Checked then
      CC.RoundRect(0, 0, imgSample.Width - FSW, imgSample.Height - FSW,
        FCu, FCu)
    else
      CC.Rectangle(0, 0, imgSample.Width - FSW, imgSample.Height - FSW);
  end;

  imgSample.Picture.Assign(BM);
  BM.Free;
end;

procedure TfrRoundRectForm.bColorClick(Sender: TObject);
begin
  ColorDlg.Color := ShadowColor;
  if ColorDlg.Execute then
  begin
    ChgColorButton(Sender, ColorDlg.Color);
    UpdateSample;
  end;
end;

procedure TfrRoundRectForm.ShWidthChange(Sender: TObject);
begin
  if Sender is TEdit then
    if TEdit(Sender).Text = '' then Exit;
  UpdateSample;
end;

procedure TfrRoundRectForm.cbCadreClick(Sender: TObject);
begin
  UpdateSample;
end;

procedure TfrRoundRectForm.cmShadowClick(Sender: TObject);
begin
  UpdateSample;
end;

procedure TfrRoundRectForm.cbGradianClick(Sender: TObject);
begin
  panGrad.Visible := cbGradian.Checked;
  panCurve.Visible := not panGrad.Visible;
  if panGrad.Visible then
  begin
    shWidth.Text := '-99';
    sCurve.Text := '0';
    cbStyle.ItemIndex := 0;
  end
  else
  begin
    shWidth.Text := '10';
    sCurve.Text := '10';
  end;
end;

procedure TfrRoundRectForm.M1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Insert) and (Shift = []) then Button5Click(Self);
  if Key = vk_Escape then ModalResult := mrCancel;
end;

procedure TfrRoundRectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Return) and (ssCtrl in Shift) then
  begin
    ModalResult := mrOk;
    Key := 0;
  end;
end;

procedure TfrRoundRectForm.FormShow(Sender: TObject);
begin
  M1.SetFocus;
  UpdateSample;
  ChgColorButton(bColor, ShadowColor);
  ChgColorButton(bColor2, NormalColor);
  ChgColorButton(bColor3, ShadowColor);
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_ROUNDRECTVIEW');
  frRegisterObject(TfrRoundRectView, Bmp, IntToStr(SInsRoundRect));

finalization
  Bmp.Free;

end.
