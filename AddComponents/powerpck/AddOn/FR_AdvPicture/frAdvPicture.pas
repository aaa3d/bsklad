{******************************************}
{                                          }
{             FastReport v2.4              }
{         AdvPicture Add-In Object         }
{                                          }
{ Copyright (c) 2001 by Stalker SoftWare   }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit frAdvPicture;

interface

{$I FR.inc}

uses
  Windows, Messages, Classes, Graphics, Controls, SysUtils, Menus,
  FR_Class, FR_Const, FR_DBRel, FR_Utils, AdvPicture
{$IFDEF Delphi6}
, Variants
{$ENDIF};



type
  TfrAdvPictureObject = class(TComponent)  // fake component
  end;

  { TfrAdvPictureView }
  TfrAdvPictureView = class(TfrView)
  private
    procedure P1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure P3Click(Sender: TObject);
    procedure PictureEditor(Sender :TObject);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
    procedure GetBlob(b: TfrTField); override;
  public
    FIPicture: TIPicture;
    constructor Create; override;
    destructor Destroy; override;
    procedure Draw(Canvas: TCanvas); override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefinePopupMenu(Popup: TPopupMenu); override;
    procedure DefineProperties; override;
    procedure ShowEditor; override;
  end;

 procedure Register;

implementation

uses
  FR_G2Edit;

{$R *.RES}

 { TfrAdvPictureView }

constructor TfrAdvPictureView.Create;
begin
 inherited Create;
 Typ := gtAddIn;
 FIPicture := TIPicture.Create;
 Flags := flStretched + flPictRatio;;
 BaseName := 'AdvPicture';
end; { Create }

destructor TfrAdvPictureView.Destroy;
begin
 FIPicture.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrAdvPictureView.DefineProperties;
begin
 inherited DefineProperties;
 AddProperty('Picture', [frdtHasEditor], PictureEditor);
 AddProperty('Stretched', [frdtBoolean], nil);
 AddProperty('Center', [frdtBoolean], nil);
 AddProperty('KeepAspect', [frdtBoolean], nil);
 AddProperty('DataField', [frdtOneObject, frdtHasEditor, frdtString], frFieldEditor);
end; { DefineProperties }

procedure TfrAdvPictureView.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'CENTER' then
   Flags := (Flags and not flPictCenter) or Word(Boolean(Value)) * flPictCenter
 else if Index = 'KEEPASPECT' then
   Flags := (Flags and not flPictRatio) or Word(Boolean(Value)) * flPictRatio

end; { SetPropValue }

function TfrAdvPictureView.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'CENTER' then
   Result := (Flags and flPictCenter) <> 0
 else if Index = 'KEEPASPECT' then
   Result := (Flags and flPictRatio) <> 0


end; { GetPropValue }

function TfrAdvPictureView.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
 
 if MethodName = 'LOADFROMFILE' then
   FIPicture.LoadFromFile(frParser.Calc(Par1));

end; { DoMethod }

procedure TfrAdvPictureView.Draw(Canvas: TCanvas);
var
  r: TRect;
  kx, ky: Double;
  w, h, w1, h1: Integer;
  Bmp: TBitmap;

  procedure PrintGraphic(Canvas: TCanvas; DestRect: TRect; aGraph: TGraphic);
  var
    BitmapHeader :pBitmapInfo;
    BitmapImage  :Pointer;
    HeaderSize   :DWORD;     // D3/D4 compatibility
    ImageSize    :DWORD;
    Bitmap       :TBitmap;

  begin

    Bitmap := TBitmap.Create;
    Bitmap.Width := aGraph.Width;
    Bitmap.Height := aGraph.Height;
{$IFNDEF Delphi2}
    Bitmap.PixelFormat := pf24Bit;
{$ENDIF}
    Bitmap.Canvas.Draw(0, 0, aGraph);

    try
      GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
      GetMem(BitmapHeader, HeaderSize);
      GetMem(BitmapImage,  ImageSize);
      try
        SetStretchBltMode(Canvas.Handle, STRETCH_DELETESCANS);
        GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
        StretchDIBits(Canvas.Handle,
                    DestRect.Left, DestRect.Top,     {Destination Origin}
                    DestRect.Right  - DestRect.Left, {Destination Width}
                    DestRect.Bottom - DestRect.Top,  {Destination Height}
                    0, 0,                            {Source Origin}
                    Bitmap.Width, Bitmap.Height,     {Source Width & Height}
                    BitmapImage,
                    TBitmapInfo(BitmapHeader^),
                    DIB_RGB_COLORS,
                    SRCCOPY)
      finally
        FreeMem(BitmapImage);
        FreeMem(BitmapHeader);
      end; { try }
    finally
      if not (aGraph is TBitmap) then Bitmap.Free
    end; { try }

  end; { PrintGraphic }

begin

  BeginDraw(Canvas);
  CalcGaps;

  with Canvas do begin

    ShowBackground;

    if (FIPicture.Empty) and (DocMode = dmDesigning) then begin
      Font.Name := 'Arial';
      Font.Size := 8;
      Font.Style := [];
      Font.Color := clBlack;
      Font.Charset := frCharset;
      TextRect(DRect, x + 20, y + 3, frLoadStr(SPicture));
      Bmp := TBitmap.Create;
      Bmp.Handle := LoadBitmap(hInstance, 'FR_ADVEMPTY');
      Draw(x + 1, y + 2, Bmp);
      Bmp.Free;
    end
    else
    if not FIPicture.Empty then begin
      if (Flags and flStretched) <> 0 then begin
        r := DRect;

        if (Flags and flPictRatio) <> 0 then begin

          kx := dx / FIPicture.Width;
          ky := dy / FIPicture.Height;

          if kx < ky then
            r := Rect(DRect.Left, DRect.Top,
              DRect.Right, DRect.Top + Round(FIPicture.Height * kx))
          else
            r := Rect(DRect.Left, DRect.Top,

              DRect.Left + Round(FIPicture.Width * ky), DRect.Bottom);
          w := DRect.Right - DRect.Left;
          h := DRect.Bottom - DRect.Top;
          w1 := r.Right - r.Left;
          h1 := r.Bottom - r.Top;

          if (Flags and flPictCenter) <> 0 then
            OffsetRect(r, (w - w1) div 2, (h - h1) div 2);

        end; { if }

        PrintGraphic(Canvas, r, FIPicture);

      end else begin

        r := DRect;

        if (Flags and flPictCenter) <> 0 then begin
          w := DRect.Right - DRect.Left;
          h := DRect.Bottom - DRect.Top;
          OffsetRect(r, (w - Round(ScaleX * FIPicture.Width)) div 2,
            (h - Round(ScaleY * FIPicture.Height)) div 2);
        end; { if }

        r.Right := r.Left + Round(FIPicture.Width * ScaleX);
        r.Bottom := r.Top + Round(FIPicture.Height * ScaleY);
        PrintGraphic(Canvas, r, FIPicture);

      end; { if }
      
    end; { if }

    ShowFrame;

  end; { with }

  RestoreCoord;

end; { Draw }

procedure TfrAdvPictureView.LoadFromStream(Stream: TStream);
var
  b:Byte;
  n: Integer;
  TempStream: TMemoryStream;

begin

  inherited LoadFromStream(Stream);

  Stream.Read(b, 1);
  Stream.Read(n, 4);
  TempStream := TMemoryStream.Create;
  TempStream.CopyFrom(Stream, n - Stream.Position);
  TempStream.Position := 0;

  if b <> 0 then FIPicture.LoadFromStream(TempStream);

  TempStream.Free;
  Stream.Seek(n, soFromBeginning);

end; { LoadFromStream }

procedure TfrAdvPictureView.SaveToStream(Stream: TStream);
var
  b :Byte;
  n, o: Integer;

begin

  inherited SaveToStream(Stream);

  if FIPicture.Empty then
    b := 0
  else
    b := 1;

  Stream.Write(b, 1);
  n := Stream.Position;
  Stream.Write(n, 4);

  if b <> 0 then FIPicture.SaveToStream(Stream);

  o := Stream.Position;
  Stream.Seek(n, soFromBeginning);
  Stream.Write(o, 4);
  Stream.Seek(0, soFromEnd);

end; { SaveToStream }

procedure TfrAdvPictureView.GetBlob(b: TfrTField);
var
  bs: TMemoryStream;

begin

 if b.IsNull then
   FIPicture.Assign(nil)
 else begin
   bs := TMemoryStream.Create;
   frAssignBlobTo(b, bs);
   FIPicture.LoadFromStream(bs);
   bs.Free;
 end { if }

end; { GetBlob }

procedure TfrAdvPictureView.ShowEditor;
begin
 PictureEditor(nil);
end; { ShowEditor }

procedure TfrAdvPictureView.PictureEditor(Sender :TObject);
begin
 frAdvPictureEditorForm := TfrAdvPictureEditorForm.Create(nil);
 frAdvPictureEditorForm.ShowEditor(FIPicture);
 frAdvPictureEditorForm.Free;
end; { PictureEditor }

procedure TfrAdvPictureView.DefinePopupMenu(Popup: TPopupMenu);
var
  m: TMenuItem;

begin

  inherited DefinePopupMenu(Popup);

  m := TMenuItem.Create(Popup);
  m.Caption := frLoadStr(SPictureCenter);
  m.OnClick := P1Click;
  m.Checked := (Flags and flPictCenter) <> 0;
  Popup.Items.Add(m);

  m := TMenuItem.Create(Popup);
  m.Caption := frLoadStr(SKeepAspectRatio);
  m.OnClick := P2Click;
  m.Enabled := (Flags and flStretched) <> 0;
  if m.Enabled then
    m.Checked := (Flags and flPictRatio) <> 0;
  Popup.Items.Add(m);

  m := TMenuItem.Create(Popup);
  m.Caption := frLoadStr(53463);
  m.OnClick := P3Click;
  Popup.Items.Add(m);

end; { DefinePopupMenu }

procedure TfrAdvPictureView.P1Click(Sender: TObject);
var
  i: Integer;
  t: TfrView;
  
begin

 frDesigner.BeforeChange;

 with Sender as TMenuItem do begin

   Checked := not Checked;

   for i := 0 to frDesigner.Page.Objects.Count - 1 do begin
     t := frDesigner.Page.Objects[i];
     if t.Selected and ((t.Restrictions and frrfDontModify) = 0) then
       t.Flags := (t.Flags and not flPictCenter) + Word(Checked) * flPictCenter;
   end; { for }
   
 end; { with }

 frDesigner.AfterChange;

end; { P1Click }

procedure TfrAdvPictureView.P2Click(Sender: TObject);
var
  i: Integer;
  t: TfrView;
begin

 frDesigner.BeforeChange;

 with Sender as TMenuItem do begin

   Checked := not Checked;
   
   for i := 0 to frDesigner.Page.Objects.Count - 1 do begin
     t := frDesigner.Page.Objects[i];
     if t.Selected and ((t.Restrictions and frrfDontModify) = 0) then
       t.Flags := (t.Flags and not flPictRatio) + Word(Checked) * flPictRatio;
   end; { for }

 end; { with }

 frDesigner.AfterChange;

end; { P2Click }

procedure TfrAdvPictureView.P3Click(Sender: TObject);
begin
 frDesigner.BeforeChange;
 FIPicture.Assign(nil);
 frDesigner.AfterChange;
end; { P3Click }

procedure Register;
begin
 RegisterComponents('FastReport', [TfrAdvPictureObject]);
end; { Register }

var
  Bmp2: TBitmap;

initialization
  Bmp2 := TBitmap.Create;
  Bmp2.LoadFromResourceName(hInstance, 'FR_ADVPICTURE');
  frRegisterObject(TfrAdvPictureView, Bmp2, IntToStr(53135));

finalization
  frUnRegisterObject(TfrAdvPictureView);
  Bmp2.Free;

end.

