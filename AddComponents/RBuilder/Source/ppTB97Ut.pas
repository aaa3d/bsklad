{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit pptb97ut;

{$IFDEF WIN32}   {DIGIMETA}
{$ALIGN ON}
{$BOOLEVAL OFF}
{$LONGSTRINGS ON}
{$WRITEABLECONST ON}

{$ELSE}
  {$A+,B-}
{$ENDIF}




{x$DEFINE TB97DisableLock}
{ Remove the 'x' to enable the define. It will disable calls to
  LockWindowUpdate, which it calls to disable screen updates while dragging.
  You should temporarily enable that while debugging so you are able to see
  your code window if you have something like a breakpoint that's set inside
  the dragging routines }

{ Determine Delphi/C++Builder version }
{$IFNDEF VER80}
{$IFNDEF VER90}  { if it's not Delphi 2.0 }
  {$IFNDEF VER93}  { and it's not C++Builder 1.0 }
    {$DEFINE TB97Delphi3orHigher}  { then it must be Delphi 3 or higher
                                     (or a future version of C++Builder) }
  {$ENDIF}
{$ENDIF}
{$ENDIF}



interface

{$I ppIfDef.pas}

uses

{$IFDEF WIN32}     {DIGIMETA}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}

  Messages, Classes, Controls, Forms, Menus, Graphics, Buttons,
  StdCtrls, ExtCtrls;

const
   Toolbar97Version = '1.6';


{$IFDEF WIN32}    {DIGIMETA}
  WM_ppTB97DoneCreating       = WM_USER + 5038;       { used internally }
  WM_ppTB97DoneCreating_Magic = WM_USER + 5040;       { used internally }
  WM_ppTB97PaintDockedNCArea  = WM_USER + 5039;   { used internally }
{$ELSE}
  WM_ppTB97DoneCreating       = WM_USER + 5038;        { used internally }
  WM_ppTB97DoneCreating_Magic = WM_USER + 5040;  { used internally }
  WM_ppTB97PaintDockedNCArea  = WM_USER + 5039;   { used internally }

  CM_CONTROLLISTCHANGE = WM_USER + 5041;   {DIGIMETA}
  HTCLOSE = 20;

{$ENDIF}





{******************************************************************************
 *
 ** E n u m e r a t e d  T y p e s
 *
{******************************************************************************}


type
  { TppDock97}

  TppDockBoundLinesValues = (ppdbTop, ppdbBottom, ppdbLeft, ppdbRight);
  TppDockBoundLines = set of TppDockBoundLinesValues;
  TppDockPosition = (ppdpTop, ppdpBottom, ppdpLeft, ppdpRight);
  TppDockType = (ppdtNotDocked, ppdtTopBottom, ppdtLeftRight);
  TppDockableTo = set of TppDockPosition;


 
  TppToolWindowArrangeType = (ppatNone, ppatMoveControls, ppatMoveControlsAndResize);


  TppButtonDisplayMode = (ppdmBoth, ppdmGlyphOnly, ppdmTextOnly);
  TppButtonState97 = (ppbsUp, ppbsDisabled, ppbsDown, ppbsExclusive, ppbsMouseIn);
  TppNumGlyphs97 = 1..5;

{******************************************************************************
 *
 ** Procedure Types
 *
{******************************************************************************}

  TppPositionReadIntProc = function(const ToolbarName, Value: String; const Default: Longint;
    const ExtraData: Pointer): Longint;
  TppPositionReadStringProc = function(const ToolbarName, Value, Default: String;
    const ExtraData: Pointer): String;
  TppPositionWriteIntProc = procedure(const ToolbarName, Value: String; const Data: Longint;
    const ExtraData: Pointer);
  TppPositionWriteStringProc = procedure(const ToolbarName, Value, Data: String;
    const ExtraData: Pointer);

{******************************************************************************
 *
 ** Record Types
 *
{******************************************************************************}

  TppToolWindowResizeCaps = record
    EightCorner, ClipCursor: Boolean;
  end;

  { Used internally by the TToolbar97.Resize* procedures }
  PppToolbar97SizeData = ^TppToolbar97SizeData;
  TppToolbar97SizeData = record
    HitTest: Integer;
    NewSizes: TList;  { List of valid new sizes. Items are casted into TSmallPoints }
    CurRightX: Integer;
    DisableSensCheck, OpSide: Boolean;
    SizeSens: Integer;
  end;

  { Used in TToolbar97.GroupInfo lists }
  PppGroupInfo = ^TppGroupInfo;
  TppGroupInfo = record
    GroupWidth,           { Width in pixels of the group, if all controls were
                            lined up left-to-right }
    GroupHeight: Integer; { Heights in pixels of the group, if all controls were
                            lined up top-to-bottom }
    Members: TList;
  end;

  { Used in TToolbar97.SlaveInfo lists }
  PppSlaveInfo = ^TppSlaveInfo;
  TppSlaveInfo = record
    LeftRight,
    TopBottom: TControl;
  end;

  { Used in TToolbar97.LineSeps lists }
  TppLineSep = packed record
    Y: SmallInt;
    Blank: Boolean;
    Unused: Boolean;
  end;



  TppHookedFormID = (hkParentForm, hkChildForm);
  PppHookedFormInfo = ^TppHookedFormInfo;
  TppHookedFormInfo = record
    Form: TForm;
    ID: TppHookedFormID;
    InstalledMainHook: Boolean;
    SaveActiveControl: HWND;
    RefCount: Integer;
  end;
  PppMainHookedFormInfo = ^TppMainHookedFormInfo;
  TppMainHookedFormInfo = record
    Form: TForm;
    RefCount: Integer;
  end;


{$IFDEF WINDOWS}  {16-bit compatiblity}
  WPARAM  = Word;
  LPARAM  = Longint;
  LRESULT = Longint;
  UINT    = Word;


 { Message structure used by WH_CALLWNDPROC }

  PCWPStruct = ^TCWPStruct;
  TCWPStruct = packed record
    lParam: LPARAM;
    wParam: WPARAM;
    message: Word;
    hwnd: HWND;
  end;


{$ENDIF}


{******************************************************************************
 *
 ** procedures and functions
 *
{******************************************************************************}

  function ppGetBorderSize (const Resizable: Boolean): TPoint;
  function ppGetSmallCaptionHeight: Integer;
  function ppGetDesktopArea: TRect;
  function ppGetMDIParent (const Form: TForm): TForm;

 {$IFNDEF TB97Delphi3orHigher}

 function ppCopyPalette (Palette: HPALETTE): HPALETTE;
 {$ENDIF}

{******************************************************************************
 *
 ** classes
 *
{******************************************************************************}



type

{$IFDEF WINDOWS}  {DIGIMETA}  {note: code from TB97 1.47}
  { Delphi 1 doesn't provide a TBits class, so TD1Bits emulates it }

  TppBits = class
  private
    FSize: Integer;
    FBits: Pointer;
    procedure Error;
    procedure SetSize(Value: Integer);
    procedure SetBit(Index: Integer; Value: Boolean);
    function GetBit(Index: Integer): Boolean;
  public
    destructor Destroy; override;
    function OpenBit: Integer;
    property Bits[Index: Integer]: Boolean read GetBit write SetBit; default;
    property Size: Integer read FSize write SetSize;
  end;



{$ENDIF}



{$IFDEF WINDOWS}

  { Delphi 1 does have a TImageList class, but it's undocumented and doesn't
    work exactly like Delphi 2, 3, and BCB (specifically the Masks seem to be
    handled differently). This is my version of a TImageList for Delphi 1.
    But it doesn't have all the functionality of Delphi 2 TImageLists - it
    only contains the methods needed by TButtonGlyph }
  TppImageList = class
  private
    FImage, FMask: TBitmap;
  public
    Width, Height: Integer;
    constructor CreateSize (AWidth, AHeight: Integer);
    destructor Destroy; override;
    function Add (Image, Mask: TBitmap): Integer;
    function AddMasked (Image: TBitmap; MaskColor: TColor): Integer;
    procedure Draw (Canvas: TCanvas; X, Y, Index: Integer);
    procedure Replace (Index: Integer; Image, Mask: TBitmap);
    procedure ReplaceMasked (Index: Integer; Image: TBitmap; MaskColor: TColor);
  end;

{$ENDIF}


{$IFDEF WIN32}     {DIGIMETA}
  TppGlyphList = class(TImageList)
{$ELSE}
  TppGlyphList = class(TppImageList)
{$ENDIF}

  private
{$IFDEF WIN32}
    Used: TBits;
{$ELSE}
    Used: TppBits;
{$ENDIF}
    FCount: Integer;
    function AllocateIndex: Integer;
  public
    constructor CreateSize (AWidth, AHeight: Integer);
    destructor Destroy; override;
    function Add (Image, Mask: TBitmap): Integer;
    function AddMasked (Image: TBitmap; MaskColor: TColor): Integer;
    procedure Delete (Index: Integer);
    property Count: Integer read FCount;
  end;




  TppGlyphCache = class
  private
    GlyphLists: TList;
  public
    constructor Create;
    destructor Destroy; override;
    function GetList(AWidth, AHeight: Integer): TppGlyphList;
    procedure ReturnList(List: TppGlyphList);
    function Empty: Boolean;
  end;

  TppBoolInt = record
    B: Boolean;
    I: Integer;
  end;


 TppButtonGlyph = class
  private
    FOriginal, FOriginalMask: TBitmap;
    FGlyphList: array[Boolean] of TppGlyphList;
    FIndexs: array[Boolean, TppButtonState97] of Integer;
    FTransparentColor: TColor;
    FNumGlyphs: TppNumGlyphs97;
    FOnChange: TNotifyEvent;
    FOldDisabledStyle: Boolean;
    procedure GlyphChanged (Sender: TObject);
    procedure SetGlyph (Value: TBitmap);
    procedure SetGlyphMask (Value: TBitmap);
    procedure SetNumGlyphs (Value: TppNumGlyphs97);
    procedure Invalidate;
     procedure DrawButtonGlyph (Canvas: TCanvas; const GlyphPos: TPoint;
      State: TppButtonState97);
{$IFDEF WIN32}         {DIGIMETA}
    procedure DrawButtonText (Canvas: TCanvas;
      const Caption: string; TextBounds: TRect;
      WordWrap: Boolean; State: TppButtonState97);
{$ELSE}
    procedure DrawButtonText(Canvas: TCanvas; Caption: string; TextBounds: TRect;
                                       WordWrap: Boolean; State: TppButtonState97);
{$ENDIF}
    procedure CalcButtonLayout (Canvas: TCanvas; const Client: TRect;
      const Offset: TPoint; DrawGlyph, DrawCaption: Boolean;
      const Caption: string; WordWrap: Boolean;
      Layout: TButtonLayout; Margin, Spacing: Integer; DropArrow: Boolean;
      var GlyphPos, ArrowPos: TPoint; var TextBounds: TRect);
  public
    constructor Create;
    destructor Destroy; override;

    {DIGIMETA - moved from private}
    function CreateButtonGlyph (State: TppButtonState97): TppBoolInt;

    { returns the text rectangle }
    function Draw (Canvas: TCanvas; const Client: TRect; const Offset: TPoint;
      DrawGlyph, DrawCaption: Boolean; const Caption: string; WordWrap: Boolean;
      Layout: TButtonLayout; Margin, Spacing: Integer; DropArrow: Boolean;
      State: TppButtonState97): TRect;
    procedure DrawButtonDropArrow (Canvas: TCanvas;
      const X, Y: Integer; State: TppButtonState97);
    property Glyph: TBitmap read FOriginal write SetGlyph;
    property GlyphMask: TBitmap read FOriginalMask write SetGlyphMask;
    property NumGlyphs: TppNumGlyphs97 read FNumGlyphs write SetNumGlyphs;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;


implementation

uses
{$IFDEF WIN32}
  CommCtrl,
{$ENDIF}

  Consts, SysUtils, ppTB97;

{------------------------------------------------------------------------------}
{ ppGetSmallCaptionHeight }

function ppGetSmallCaptionHeight: Integer;
{ Returns height of the caption of a small window }
begin
{$IFDEF WIN32}  {DIGIMETA}
  if NewStyleControls then
    Result := GetSystemMetrics(SM_CYSMCAPTION)
  else
{$ENDIF}
    { Win 3.x doesn't support small captions, so, like Office 97, use the size
      of normal captions minus one }
    Result := GetSystemMetrics(SM_CYCAPTION) - 1;



end;

function ppGetBorderSize (const Resizable: Boolean): TPoint;
{ Returns size of a thick border. Note that, depending on the Windows version,
  this may not be the same as the actual window metrics since it draws its
  own border }
const
  XMetrics: array[Boolean] of Integer = (SM_CXDLGFRAME, SM_CXFRAME);
  YMetrics: array[Boolean] of Integer = (SM_CYDLGFRAME, SM_CYFRAME);
begin
  Result.X := GetSystemMetrics(XMetrics[Resizable]);
  Result.Y := GetSystemMetrics(YMetrics[Resizable]);
end;


{$IFDEF WIN32}
function ppGetDesktopArea: TRect;
{ Returns a rectangle of the screen. But, under Win95 and NT 4.0, it excludes
  the area taken up by the taskbar. }
begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0) then
    { SPI_GETWORKAREA is only supported by Win95 and NT 4.0. So it fails under
      Win 3.x. In that case, return a rectangle of the entire screen }
    Result := Rect(0, 0, GetSystemMetrics(SM_CXSCREEN),
      GetSystemMetrics(SM_CYSCREEN));
end;

{$ELSE}

function ppGetDesktopArea: TRect;
{ Returns a rectangle of the screen. But, under Win95 and NT 4.0, it excludes
  the area taken up by the taskbar.
  This is a very handy function that you could probably put to use in your
  own programs! }

const
  { Delphi 1 doesn't declare a constant for this }
  SPI_GETWORKAREA = 48;

begin
  { SPI_GETWORKAREA is only supported by Win95 and NT 4.0 (in both Win16 and
    Win32). The reason why it has to check the Windows version is to work
    around a bug in NT 3.51 that causes the program to crash if you try using
    SPI_GETWORKAREA. }
     { It has to use a different method in Win16 to detect if it's actually
       running Win 3.x since the 16-bit GetVersion under all versions of NT
       (including 4.0) returns 3.1, and the 16-bit GetVersion under Win95
       returns 3.95. }
    Result := Rect(0, 0, GetSystemMetrics(SM_CXSCREEN),
      GetSystemMetrics(SM_CYSCREEN));
    if not SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0) then
    Result := Rect(0, 0, GetSystemMetrics(SM_CXSCREEN),
      GetSystemMetrics(SM_CYSCREEN));
end;

{$ENDIF}

function ppGetMDIParent (const Form: TForm): TForm;
{ Returns the parent of the specified MDI child form. But, if Form isn't a
  MDI child, it simply returns Form. }
var
  I, J: Integer;
begin
  Result := Form;
  if Form = nil then Exit;
  if Form.FormStyle = fsMDIChild then
    for I := 0 to Screen.FormCount-1 do
      with Screen.Forms[I] do begin
        if FormStyle <> fsMDIForm then Continue;
        for J := 0 to MDIChildCount-1 do
          if MDIChildren[J] = Form then begin
            Result := Screen.Forms[I];
            Exit;
          end;
      end;
end;







{$IFNDEF TB97Delphi3orHigher}
type
  PMaxLogPalette = ^TMaxLogPalette;
  TMaxLogPalette = packed record
    palVersion: Word;
    palNumEntries: Word;
    palPalEntry: array[Byte] of TPaletteEntry;
  end;
function ppCopyPalette (Palette: HPALETTE): HPALETTE;
var
  PaletteSize: Integer;
  LogPal: TMaxLogPalette;
begin
  Result := 0;
  if Palette = 0 then Exit;
  PaletteSize := 0;
  if GetObject(Palette, SizeOf(PaletteSize), @PaletteSize) = 0 then Exit;
  if PaletteSize = 0 then Exit;
  with LogPal do begin
    palVersion := $0300;
    palNumEntries := PaletteSize;
    GetPaletteEntries (Palette, 0, PaletteSize, palPalEntry);
  end;
  Result := CreatePalette(PLogPalette(@LogPal)^);
end;
{$ENDIF}




{$IFDEF WINDOWS} {DIGIMETA} {note: code from TB97 1.47}

{ TppBits }

type
  EBitsError = class(Exception);
const
  SBitsIndexError = 'Bits index out of range';
  BitsPerInt = SizeOf(Integer) * 8;

type
  TBitEnum = 0..BitsPerInt-1;
  TppBitset = set of TBitEnum;
  PBitArray = ^TBitArray;
  TBitArray = array[0..4096] of TppBitset;

destructor TppBits.Destroy;
begin
  SetSize (0);
  inherited Destroy;
end;

procedure TppBits.Error;
begin
  raise EBitsError.Create (SBitsIndexError);
end;

procedure TppBits.SetSize (Value: Integer);
var
  NewMem: Pointer;
  NewMemSize: Integer;
  OldMemSize: Integer;

  function Min (X, Y: Integer): Integer;
  begin
    Result := X;
    if X > Y then Result := Y;
  end;
begin
  if Value <> Size then begin
    if Value < 0 then Error;
    NewMemSize := ((Value + BitsPerInt - 1) div BitsPerInt) * SizeOf(Integer);
    OldMemSize := ((Size + BitsPerInt - 1) div BitsPerInt) * SizeOf(Integer);
    if NewMemSize <> OldMemSize then begin
      NewMem := nil;
      if NewMemSize <> 0 then begin
        GetMem (NewMem, NewMemSize);
        FillChar (NewMem^, NewMemSize, 0);
      end;
      if OldMemSize <> 0 then begin
        if NewMem <> nil then
          Move (FBits^, NewMem^, Min(OldMemSize, NewMemSize));
        FreeMem (FBits, OldMemSize);
      end;
      FBits := NewMem;
    end;
    FSize := Value;
  end;
end;

procedure TppBits.SetBit (Index: Integer; Value: Boolean);
begin
  if (Index < 0) or (Index > Size-1) then
    Error;
  if Value then
    PBitArray(FBits)^[Index div BitsPerInt] :=
      PBitArray(FBits)^[Index div BitsPerInt] + [Index mod BitsPerInt]
  else
  if Value then
    PBitArray(FBits)^[Index div BitsPerInt] :=
      PBitArray(FBits)^[Index div BitsPerInt] - [Index mod BitsPerInt];
end;

function TppBits.GetBit (Index: Integer): Boolean;
begin
  if (Index < 0) or (Index > Size-1) then
    Error;
  Result := (Index mod BitsPerInt) in PBitArray(FBits)^[Index div BitsPerInt];
end;

function TppBits.OpenBit: Integer;
var
  I: Integer;
  B: TppBitset;
  J: TBitEnum;
  E: Integer;
begin
  E := (Size + BitsPerInt - 1) div BitsPerInt - 1;
  for I := 0 to E do
    if PBitArray(FBits)^[I] <> [0..BitsPerInt - 1] then begin
      B := PBitArray(FBits)^[I];
      for J := Low(J) to High(J) do begin
        if not (J in B) then begin
          Result := I * BitsPerInt + J;
          if Result >= Size then Result := Size;
          Exit;
        end;
      end;
    end;
  Result := Size;
end;


{ TppImageList }

constructor TppImageList.CreateSize (AWidth, AHeight: Integer);
begin
  inherited Create;
  Width := AWidth;
  Height := AHeight;
  FImage := TBitmap.Create;
  FImage.Height := Height;
  FMask := TBitmap.Create;
  FMask.Monochrome := True;
  FMask.Height := Height;
end;

destructor TppImageList.Destroy;
begin
  if Assigned(FMask) then FMask.Free;
  if Assigned(FImage) then FImage.Free;
  inherited Destroy;
end;

function TppImageList.Add (Image, Mask: TBitmap): Integer;
begin
  Result := FImage.Width div Width;
  FImage.Width := FImage.Width + Width;
  FMask.Width := FMask.Width + Width;
  Replace (Result, Image, Mask);
end;

function TppImageList.AddMasked (Image: TBitmap; MaskColor: TColor): Integer;
begin
  Result := FImage.Width div Width;
  FImage.Width := FImage.Width + Width;
  FMask.Width := FMask.Width + Width;
  ReplaceMasked (Result, Image, MaskColor);
end;

procedure TppImageList.Replace (Index: Integer; Image, Mask: TBitmap);
var
  R: TRect;
begin
  R := Rect(Index * Width, 0, Index * Width + Width, Height);

  if Mask = nil then
    PatBlt (FMask.Canvas.Handle, R.Left, R.Top, Width, Height, BLACKNESS)
  else
    BitBlt (FMask.Canvas.Handle, R.Left, R.Top, Width, Height,
      Mask.Canvas.Handle, 0, 0, SRCCOPY);

  if Image = nil then
    PatBlt (FImage.Canvas.Handle, R.Left, R.Top, Width, Height, WHITENESS)
  else begin
    BitBlt (FImage.Canvas.Handle, R.Left, R.Top, Width, Height,
      Image.Canvas.Handle, 0, 0, SRCCOPY);
    { Convert all transparent colors in FImage to black }
    InvertRect (FMask.Canvas.Handle, R);
    BitBlt (FImage.Canvas.Handle, R.Left, R.Top, Width, Height,
      FMask.Canvas.Handle, R.Left, R.Top, SRCAND);
    InvertRect (FMask.Canvas.Handle, R);
  end;
end;

procedure TppImageList.ReplaceMasked (Index: Integer; Image: TBitmap; MaskColor: TColor);
var
  TempMask: TBitmap;
  SaveBkColor: TColorRef;
begin
  { Generate a mask }
  TempMask := TBitmap.Create;
  try
    TempMask.Monochrome := True;
    TempMask.Width := Width;
    TempMask.Height := Height;
    SaveBkColor := SetBkColor(Image.Canvas.Handle, ColorToRGB(MaskColor));
    BitBlt (TempMask.Canvas.Handle, 0, 0, Width, Height,
      Image.Canvas.Handle, 0, 0, SRCCOPY);
    SetBkColor (Image.Canvas.Handle, SaveBkColor);

    Replace (Index, Image, TempMask);
  finally
    TempMask.Free;
  end;
end;

procedure TppImageList.Draw (Canvas: TCanvas; X, Y, Index: Integer);
var
  Temp: TBitmap;
begin
  { Use an offscreen bitmap to render the image. It's slightly slower than
    writing directly to the screen, but it prevents any flickering (which
    Delphi 2's TImageList doesn't have). }
  Temp := TBitmap.Create;
  try
    Temp.Width := Width;
    Temp.Height := Height;
    { Get current image off of Canvas }
    BitBlt (Temp.Canvas.Handle, 0, 0, Width, Height,
      Canvas.Handle, X, Y, SRCCOPY);
    { Draw the image }
    BitBlt (Temp.Canvas.Handle, 0, 0, Width, Height,
      FMask.Canvas.Handle, Index * Width, 0, SRCAND);
    BitBlt (Temp.Canvas.Handle, 0, 0, Width, Height,
      FImage.Canvas.Handle, Index * Width, 0, SRCPAINT);
    { Copy the new image back to Canvas }
    BitBlt (Canvas.Handle, X, Y, Width, Height,
      Temp.Canvas.Handle, 0, 0, SRCCOPY);
  finally
    Temp.Free;
  end;
end;

{$ENDIF}




{ TppGlyphList }

constructor TppGlyphList.CreateSize(AWidth, AHeight: Integer);
begin
  inherited CreateSize (AWidth, AHeight);
{$IFDEF WIN32}
  Used := TBits.Create;
{$ELSE}
   Used := TppBits.Create;
{$ENDIF}
end;

destructor TppGlyphList.Destroy;
begin
  Used.Free;
  inherited Destroy;
end;

function TppGlyphList.AllocateIndex: Integer;
begin
  Result := Used.OpenBit;
  if Result >= Used.Size then
  begin
    Result := inherited Add(nil, nil);
    Used.Size := Result + 1;
  end;
  Used[Result] := True;
end;

function TppGlyphList.Add (Image, Mask: TBitmap): Integer;
begin
  Result := AllocateIndex;
  Replace (Result, Image, Mask);
  Inc (FCount);
end;

function TppGlyphList.AddMasked (Image: TBitmap; MaskColor: TColor): Integer;

{$IFDEF WIN32}   {DIGIMETA}
  procedure BugfreeReplaceMasked (Index: Integer; NewImage: TBitmap; MaskColor: TColor);
    procedure CheckImage (Image: TGraphic);
    begin
      if Image = nil then Exit;
      if (Image.Height < Height) or (Image.Width < Width) then
        raise EInvalidOperation.Create({$IFNDEF TB97Delphi3orHigher}LoadStr{$ENDIF}(SInvalidImageSize));
    end;
  var
    TempIndex: Integer;
    Image, Mask: TBitmap;
  begin
    if HandleAllocated then begin
      CheckImage(NewImage);
      TempIndex := inherited AddMasked(NewImage, MaskColor);
      if TempIndex <> -1 then
        try
          Image := TBitmap.Create;
          Mask := TBitmap.Create;
          try
            Image.Height := Height;
            Image.Width := Width;
            Mask.Monochrome := True;
            { ^ Prevents the "invisible glyph" problem when used with certain
                color schemes. (Fixed in Delphi 3.01) }
            Mask.Height := Height;
            Mask.Width := Width;
            ImageList_Draw (Handle, TempIndex, Image.Canvas.Handle, 0, 0, ILD_NORMAL);
            ImageList_Draw (Handle, TempIndex, Mask.Canvas.Handle, 0, 0, ILD_MASK);
            if not ImageList_Replace(Handle, Index, Image.Handle, Mask.Handle) then
              raise EInvalidOperation.Create({$IFNDEF TB97Delphi3orHigher}LoadStr{$ENDIF}(SReplaceImage));
          finally
            Image.Free;
            Mask.Free;
          end;
        finally
          inherited Delete(TempIndex);
        end
      else
        raise EInvalidOperation.Create({$IFNDEF TB97Delphi3orHigher}LoadStr{$ENDIF}(SReplaceImage));
    end;
    Change;
  end;
{$ENDIF}

begin
  Result := AllocateIndex;
  { This works two very serious bugs in the Delphi 2/BCB and Delphi 3
    implementations of the ReplaceMasked method. In the Delphi 2 and BCB
    versions of the ReplaceMasked method, it incorrectly uses ILD_NORMAL as
    the last parameter for the second ImageList_Draw call, in effect causing
    all white colors to be considered transparent also. And in the Delphi 2/3
    and BCB versions it doesn't set Monochrome to True on the Mask bitmap,
    causing the bitmaps to be invisible on certain color schemes. }
{$IFDEF WIN32}    {DIGIMETA}
  BugfreeReplaceMasked (Result, Image, MaskColor);
{$ELSE}
  ReplaceMasked (Result, Image, MaskColor);
{$ENDIF}

  Inc (FCount);
end;

procedure TppGlyphList.Delete (Index: Integer);
begin
  if Used[Index] then begin
    Dec(FCount);
    Used[Index] := False;
  end;
end;

{ TppGlyphCache }

constructor TppGlyphCache.Create;
begin
  inherited Create;
  GlyphLists := TList.Create;
end;

destructor TppGlyphCache.Destroy;
begin
  GlyphLists.Free;
  inherited Destroy;
end;

function TppGlyphCache.GetList(AWidth, AHeight: Integer): TppGlyphList;
var
  I: Integer;
begin
  for I := GlyphLists.Count - 1 downto 0 do begin
    Result := GlyphLists[I];
    with Result do
      if (AWidth = Width) and (AHeight = Height) then Exit;
  end;
  Result := TppGlyphList.CreateSize(AWidth, AHeight);
  GlyphLists.Add(Result);
end;

procedure TppGlyphCache.ReturnList(List: TppGlyphList);
begin
  if List = nil then Exit;
  if List.Count = 0 then begin
    GlyphLists.Remove(List);
    List.Free;
  end;
end;

function TppGlyphCache.Empty: Boolean;
begin
  Result := GlyphLists.Count = 0;
end;


{ TppButtonGlyph }

var
  GlyphCache: TppGlyphCache {$IFDEF WIN32} = nil {$ENDIF};     {DIGIMETA}


constructor TppButtonGlyph.Create;
var
  B: Boolean;
  I: TppButtonState97;
begin
  inherited Create;
  FOriginal := TBitmap.Create;
  FOriginal.OnChange := GlyphChanged;
  FOriginalMask := TBitmap.Create;
  FOriginalMask.OnChange := GlyphChanged;
  FNumGlyphs := 1;
  for B := False to True do
    for I := Low(I) to High(I) do
      FIndexs[B, I] := -1;
  if GlyphCache = nil then
    GlyphCache := TppGlyphCache.Create;
end;

destructor TppButtonGlyph.Destroy;
begin
  FOriginalMask.Free;
  FOriginal.Free;
  Invalidate;
  if Assigned(GlyphCache) and GlyphCache.Empty then begin
    GlyphCache.Free;
    GlyphCache := nil;
  end;
  inherited Destroy;
end;

procedure TppButtonGlyph.Invalidate;
var
  B: Boolean;
  I: TppButtonState97;
begin
  for B := False to True do begin
    for I := Low(I) to High(I) do begin
      if FIndexs[B, I] <> -1 then FGlyphList[B].Delete (FIndexs[B, I]);
      FIndexs[B, I] := -1;
    end;
    GlyphCache.ReturnList (FGlyphList[B]);
    FGlyphList[B] := nil;
  end;
end;

procedure TppButtonGlyph.GlyphChanged (Sender: TObject);
begin
  if (Sender = FOriginal) or (Sender = FOriginalMask) then begin
    if (FOriginal.Width <> 0) and (FOriginal.Height <> 0) then
      FTransparentColor := FOriginal.Canvas.Pixels[0, FOriginal.Height-1] or $02000000;
    Invalidate;
    if Assigned(FOnChange) then FOnChange (Self);
  end;
end;

procedure TppButtonGlyph.SetGlyph (Value: TBitmap);
var
  Glyphs: Integer;
begin
  Invalidate;
  FOriginal.Assign (Value);
  if (Value <> nil) and (Value.Height <> 0) then begin
    if Value.Width mod Value.Height = 0 then begin
      Glyphs := Value.Width div Value.Height;
      if Glyphs > High(TppNumGlyphs97) then Glyphs := 1;
      SetNumGlyphs (Glyphs);
    end;
  end;
end;

procedure TppButtonGlyph.SetGlyphMask (Value: TBitmap);
begin
  Invalidate;
  FOriginalMask.Assign (Value);
end;

procedure TppButtonGlyph.SetNumGlyphs (Value: TppNumGlyphs97);
begin
  Invalidate;
  FNumGlyphs := Value;
  GlyphChanged (Glyph);
end;

function TppButtonGlyph.CreateButtonGlyph (State: TppButtonState97): TppBoolInt;
const
  ROP_DSPDxax = $00E20746;
  ROP_PSDPxax = $00B8074A;
  ROP_DSna = $00220326;  { D & ~S }

{$IFDEF WIN32}   {DIGIMETA}
  procedure GenerateMaskBitmapFromDIB (const MaskBitmap, SourceBitmap: TBitmap;
    const SourceOffset, SourceSize: TPoint; TransColors: array of TColor);
  { This a special procedure meant for generating monochrome masks from
    >4 bpp color DIB sections. Because each video driver seems to sport its own
    interpretation of how to handle DIB sections, a workaround procedure like
    this was necessary. }
  type
    TColorArray = array[0..536870910] of TColorRef;
  var
    Info: packed record
      Header: TBitmapInfoHeader;
      Colors: array[0..1] of TColorRef;
    end;
    W, H: Integer;
    I, Y, X: Integer;
    Pixels: ^TColorArray;
    Pixel: ^TColorRef;
    MonoPixels: Pointer;
    MonoPixel, StartMonoPixel: ^Byte;
    MonoScanLineSize, CurBit: Integer;
    DC: HDC;
    MaskBmp: HBITMAP;
  begin
    W := SourceBitmap.Width;
    H := SourceBitmap.Height;
    MonoScanLineSize := SourceSize.X div 8;
    if MonoScanLineSize mod 4 <> 0 then  { Compensate for scan line boundary }
      Inc (MonoScanLineSize, 4 - (MonoScanLineSize mod 4));
    MonoPixels := AllocMem(MonoScanLineSize * SourceSize.Y);  { AllocMem is used because it initializes to zero }
    try
      GetMem (Pixels, W * H * 4);
      try
        FillChar (Info, SizeOf(Info), 0);
        with Info do begin
          with Header do begin
            biSize := SizeOf(TBitmapInfoHeader);
            biWidth := W;
            biHeight := -H;  { negative number makes it a top-down DIB }
            biPlanes := 1;
            biBitCount := 32;
            {biCompression := BI_RGB;}  { implied due to the FillChar zeroing }
          end;
          {Colors[0] := clBlack;}  { implied due to the FillChar zeroing }
          Colors[1] := clWhite;
        end;
        DC := CreateCompatibleDC(0);
        GetDIBits (DC, SourceBitmap.Handle, 0, H, Pixels, PBitmapInfo(@Info)^,
          DIB_RGB_COLORS);
        DeleteDC (DC);

        for I := 0 to High(TransColors) do
          if TransColors[I] = -1 then
            TransColors[I] := Pixels[W * (H-1)] and $FFFFFF;
              { ^ 'and' operation is necessary because the high byte is undefined }

        MonoPixel := MonoPixels;
        for Y := SourceOffset.Y to SourceOffset.Y+SourceSize.Y-1 do begin
          StartMonoPixel := MonoPixel;
          CurBit := 7;
          Pixel := @Pixels[(Y * W) + SourceOffset.X];
          for X := 0 to SourceSize.X-1 do begin
            for I := 0 to High(TransColors) do
              if Boolean(Pixel^) and (Integer($FFFFFF) = TransColors[I]) then
                begin
                { ^ 'and' operation is necessary because the high byte is undefined }
                MonoPixel^ := MonoPixel^ or (1 shl CurBit);
                Break;
              end;
            Dec (CurBit);
            if CurBit < 0 then begin
              Inc (Integer(MonoPixel));
              CurBit := 7;
            end;
            Inc (Integer(Pixel), SizeOf(Longint));  { proceed to the next pixel }
          end;
          Integer(MonoPixel) := Integer(StartMonoPixel) + MonoScanLineSize;
        end;
      finally
        FreeMem (Pixels);
      end;

      { Write new bits into a new HBITMAP, and assign this handle to MaskBitmap }
      MaskBmp := CreateBitmap(SourceSize.X, SourceSize.Y, 1, 1, nil);
      with Info.Header do begin
        biWidth := SourceSize.X;
        biHeight := -SourceSize.Y;  { negative number makes it a top-down DIB }
        biPlanes := 1;
        biBitCount := 1;
      end;
      DC := CreateCompatibleDC(0);
      SetDIBits (DC, MaskBmp, 0, SourceSize.Y, MonoPixels, PBitmapInfo(@Info)^,
        DIB_RGB_COLORS);
      DeleteDC (DC);
    finally
      FreeMem (MonoPixels);
    end;

    MaskBitmap.Handle := MaskBmp;
  end;
{$ENDIF}

  procedure GenerateMaskBitmap (const MaskBitmap, SourceBitmap: TBitmap;
    const SourceOffset, SourceSize: TPoint; const TransColors: array of TColor);
  { Returns handle of a monochrome bitmap, with pixels in SourceBitmap of color
    TransColor set to white in the resulting bitmap. All other colors of
    SourceBitmap are set to black in the resulting bitmap. This uses the
    regular ROP_DSPDxax BitBlt method. }
  var
    CanvasHandle: HDC;
    SaveBkColor: TColorRef;
    DC: HDC;
    MaskBmp, SaveBmp: HBITMAP;
    I: Integer;
  const
{$IFDEF WIN32} {DIGIMETA}
    ROP: array[Boolean] of DWORD = (SRCPAINT, SRCCOPY);
{$ELSE}
      ROP: array[Boolean] of Longint = (SRCPAINT, SRCCOPY);
{$ENDIF}
  begin
    CanvasHandle := SourceBitmap.Canvas.Handle;

    MaskBmp := CreateBitmap(SourceSize.X, SourceSize.Y, 1, 1, nil);
    DC := CreateCompatibleDC(0);
    SaveBmp := SelectObject(DC, MaskBmp);
    SaveBkColor := GetBkColor(CanvasHandle);
    for I := 0 to High(TransColors) do begin
      SetBkColor (CanvasHandle, ColorToRGB(TransColors[I]));
      BitBlt (DC, 0, 0, SourceSize.X, SourceSize.Y, CanvasHandle,
        SourceOffset.X, SourceOffset.Y, ROP[I = 0]);
    end;
    SetBkColor (CanvasHandle, SaveBkColor);
    SelectObject (DC, SaveBmp);
    DeleteDC (DC);

    MaskBitmap.Handle := MaskBmp;
  end;
  procedure ReplaceBitmapColorsFromMask (const MaskBitmap, DestBitmap: TBitmap;
    const DestOffset, DestSize: TPoint; const ReplaceColor: TColor);
  var
    DestDC: HDC;
    SaveBrush: HBRUSH;
    SaveTextColor, SaveBkColor: TColorRef;
  begin
    DestDC := DestBitmap.Canvas.Handle;

    SaveBrush := SelectObject(DestDC, CreateSolidBrush(ColorToRGB(ReplaceColor)));
    SaveTextColor := SetTextColor(DestDC, clBlack);
    SaveBkColor := SetBkColor(DestDC, clWhite);
    BitBlt (DestDC, DestOffset.X, DestOffset.Y, DestSize.X, DestSize.Y,
      MaskBitmap.Canvas.Handle, 0, 0, ROP_DSPDxax);
    SetBkColor (DestDC, SaveBkColor);
    SetTextColor (DestDC, SaveTextColor);
    DeleteObject (SelectObject(DestDC, SaveBrush));
  end;
  function CopyBitmapToDDB (const SourceBitmap: TBitmap): TBitmap;
  { Makes a device-dependent duplicate of SourceBitmap. The color palette,
    if any, is preserved. }
  var
    SB: HBITMAP;
    SavePalette: HPALETTE;
    DC: HDC;
    BitmapInfo: packed record
      Header: TBitmapInfoHeader;
      Colors: array[0..255] of TColorRef;
    end;
    Bits: Pointer;
  begin
    Result := TBitmap.Create;
    try
  {$IFDEF Delphi3}
      Result.Palette := CopyPalette(SourceBitmap.Palette);
  {$ELSE}
      Result.Palette := ppCopyPalette(SourceBitmap.Palette);
  {$ENDIF}
      Result.Width := SourceBitmap.Width;
      Result.Height := SourceBitmap.Height;
      SB := SourceBitmap.Handle;
      if SB = 0 then Exit;  { it would have a null handle if its width or height was zero }
      SavePalette := 0;
      DC := CreateCompatibleDC(0);
      try
        if Result.Palette <> 0 then begin
          SavePalette := SelectPalette(DC, Result.Palette, False);
          RealizePalette (DC);
        end;
        BitmapInfo.Header.biSize := SizeOf(TBitmapInfoHeader);
        BitmapInfo.Header.biBitCount := 0;  { instructs GetDIBits not to fill in the color table }
        { First retrieve the BitmapInfo header only }
        if GetDIBits(DC, SB, 0, 0, nil, PBitmapInfo(@BitmapInfo)^, DIB_RGB_COLORS) <> 0 then begin
          GetMem (Bits, BitmapInfo.Header.biSizeImage);
          try
            { Then read the actual bits }
            if GetDIBits(DC, SB, 0, SourceBitmap.Height, Bits, PBitmapInfo(@BitmapInfo)^, DIB_RGB_COLORS) <> 0 then
              { And copy them to the resulting bitmap }
              SetDIBits (DC, Result.Handle, 0, SourceBitmap.Height, Bits, PBitmapInfo(@BitmapInfo)^, DIB_RGB_COLORS);
          finally
  {$IFDEF WIN32}
            FreeMem (Bits);
  {$ELSE}
            FreeMem(Bits, SizeOf(BitmapInfo.Header.biSizeImage));
  {$ENDIF}
          end;
        end;
      finally
        if SavePalette <> 0 then SelectPalette (DC, SavePalette, False);
        DeleteDC (DC);
      end;
    except
      Result.Free;
      raise;
    end;
  end;
const
{$IFDEF WIN32}     {DIGIMETA}
  ROPs: array[Boolean] of DWORD = (ROP_PSDPxax, ROP_DSPDxax);
{$ELSE}
  ROPs: array[Boolean] of Longint = (ROP_PSDPxax, ROP_DSPDxax);

{$ENDIF}
var
  TmpImage, DDB, MonoBmp: TBitmap;
  I: TppButtonState97;
  B: Boolean;
  AddPixels, IWidth, IHeight, IWidthA, IHeightA: Integer;
  IRect, IRectA, SourceRect, R: TRect;
  DC: HDC;
  UsesMask: Boolean;
{$IFDEF TB97Delphi3orHigher}
  IsHighColorDIB: Boolean;
{$ELSE}
const
  IsHighColorDIB = False;
{$ENDIF}
begin
  if (State <> ppbsDisabled) and (Ord(State) >= NumGlyphs) then
    State := ppbsUp;
  Result.B := True;
  Result.I := FIndexs[True, State];
  if Result.I = -1 then begin
    Result.B := False;
    Result.I := FIndexs[False, State];
  end;
  if Result.I <> -1 then Exit;
  if (FOriginal.Width or FOriginal.Height) = 0 then Exit;
  UsesMask := (FOriginalMask.Width <> 0) and (FOriginalMask.Height <> 0);
  B := State <> ppbsDisabled;
  { + AddPixels is to make sure the highlight color on generated disabled glyphs
    doesn't get cut off }
  AddPixels := Ord(State = ppbsDisabled);
  IWidth := FOriginal.Width div FNumGlyphs + AddPixels;
  IHeight := FOriginal.Height + AddPixels;
  IRect := Rect(0, 0, IWidth, IHeight);
  IWidthA := IWidth - AddPixels;
  IHeightA := IHeight - AddPixels;
  IRectA := Rect(0, 0, IWidthA, IHeightA);
  if FGlyphList[B] = nil then begin
    if GlyphCache = nil then
      GlyphCache := TppGlyphCache.Create;
    FGlyphList[B] := GlyphCache.GetList(IWidth, IHeight);
  end;
  {$IFDEF TB97Delphi3orHigher}
  IsHighColorDIB := FOriginal.PixelFormat > pf4bit;
  {$ENDIF}
  TmpImage := TBitmap.Create;
  try
    TmpImage.Width := IWidth;
    TmpImage.Height := IHeight;
    TmpImage.Canvas.Brush.Color := clBtnFace;
  {$IFDEF Delphi3}
    TmpImage.Palette := CopyPalette(FOriginal.Palette);
  {$ELSE}
    TmpImage.Palette := ppCopyPalette(FOriginal.Palette);

  {$ENDIF}
    I := State;
    if Ord(I) >= NumGlyphs then I := ppbsUp;
    SourceRect := Bounds(Ord(I) * IWidthA, 0, IWidthA, IHeightA);
    if State <> ppbsDisabled then begin
      TmpImage.Canvas.CopyRect (IRectA, FOriginal.Canvas, SourceRect);
      if not UsesMask then begin
        {$IFDEF TB97Delphi3orHigher}
        { Use clDefault instead of FTransparentColor whereever possible to
          ensure compatibility with all video drivers when using high-color
          (> 4 bpp) DIB glyphs }
        FIndexs[B, State] := FGlyphList[B].AddMasked(TmpImage, clDefault);
        {$ELSE}
        FIndexs[B, State] := FGlyphList[B].AddMasked(TmpImage, FTransparentColor);
        {$ENDIF}
      end
      else begin
        MonoBmp := TBitmap.Create;
        try
          MonoBmp.Monochrome := True;
          MonoBmp.Width := IWidth;
          MonoBmp.Height := IHeight;
          MonoBmp.Canvas.CopyRect (IRectA, FOriginalMask.Canvas, SourceRect);
          FIndexs[B, State] := FGlyphList[B].Add(TmpImage, MonoBmp);
        finally
          MonoBmp.Free;
        end;
      end;
    end
    else begin
      MonoBmp := TBitmap.Create;
      try
        { Uses the CopyBitmapToDDB to work around a Delphi 3 flaw. If you copy
          a DIB to a second bitmap via Assign, change the HandleType of the
          second bitmap to bmDDB, then try to read the Handle property, Delphi
          converts it back to a DIB. }
        DDB := CopyBitmapToDDB(FOriginal);
        try
          if NumGlyphs > 1 then
            with TmpImage.Canvas do begin
              CopyRect (IRectA, DDB.Canvas, SourceRect);

{$IFDEF WIN32} {DIGIMETA}
              { Convert white to clBtnHighlight }
              if not IsHighColorDIB then
                GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                  IRectA.BottomRight, [GetNearestColor(FOriginal.Canvas.Handle, clWhite)])
              else
                GenerateMaskBitmapFromDIB (MonoBmp, FOriginal, SourceRect.TopLeft,
                  IRectA.BottomRight, [clWhite]);
{$ELSE}
                GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                  IRectA.BottomRight, [GetNearestColor(FOriginal.Canvas.Handle, clWhite)]);
{$ENDIF}
              ReplaceBitmapColorsFromMask (MonoBmp, TmpImage, IRectA.TopLeft,
                IRectA.BottomRight, clBtnHighlight);

{$IFDEF WIN32} {DIGIMETA}
              { Convert gray to clBtnShadow }
              if not IsHighColorDIB then
                GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                  IRectA.BottomRight, [GetNearestColor(FOriginal.Canvas.Handle, clGray)])
              else
                GenerateMaskBitmapFromDIB (MonoBmp, FOriginal, SourceRect.TopLeft,
                  IRectA.BottomRight, [clGray]);
{$ELSE}
                GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                  IRectA.BottomRight, [GetNearestColor(FOriginal.Canvas.Handle, clGray)]);
{$ENDIF}

              ReplaceBitmapColorsFromMask (MonoBmp, TmpImage, IRectA.TopLeft,
                IRectA.BottomRight, clBtnShadow);

              if not UsesMask then begin
                { Generate the transparent mask in MonoBmp. The reason why
                  it doesn't just use a mask color is because the mask needs
                  to be of the glyph -before- the clBtnHighlight/Shadow were
                  translated }
{$IFDEF WIN32} {DIGIMETA}
                if not IsHighColorDIB then
                  GenerateMaskBitmap (MonoBmp, DDB,
                    SourceRect.TopLeft, IRectA.BottomRight, FTransparentColor)
                else
                  GenerateMaskBitmapFromDIB (MonoBmp, FOriginal,
                    SourceRect.TopLeft, IRectA.BottomRight, [-1]);
{$ELSE}
                  GenerateMaskBitmap (MonoBmp, DDB,
                    SourceRect.TopLeft, IRectA.BottomRight, FTransparentColor);
{$ENDIF}
              end
              else
                MonoBmp.Canvas.CopyRect (IRectA, FOriginalMask.Canvas, SourceRect);
              with MonoBmp do begin
                Width := Width + AddPixels;
                Height := Height + AddPixels;
                { Set the additional bottom and right row on disabled glyph
                  masks to white so that it always shines through, since the
                  bottom and right row on TmpImage was left uninitialized }
                Canvas.Pen.Color := clWhite;
                Canvas.PolyLine ([Point(0, Height-1), Point(Width-1, Height-1),
                  Point(Width-1, -1)]);
              end;

              FIndexs[B, State] := FGlyphList[B].Add(TmpImage, MonoBmp);
            end
          else begin
            { Create a disabled version }
            if FOldDisabledStyle then begin
              { "Old" TSpeedButton style }
              if not UsesMask then  begin
{$IFDEF WIN32} {DIGIMETA}

                if IsHighColorDIB then
                  GenerateMaskBitmapFromDIB (MonoBmp, FOriginal,
                    SourceRect.TopLeft, IRectA.BottomRight, [clBlack])
                else begin
{$ENDIF}
                  with MonoBmp do begin
                    Assign (DDB);  { must be a DDB for this to work right }
                    Canvas.Brush.Color := clBlack;
                    Monochrome := True;
                  end;
{$IFDEF WIN32}
                end;
{$ENDIF}
              end

              else begin
                MonoBmp.Assign (DDB);  { must be a DDB for this to work right }
                with TBitmap.Create do
                  try
                    Monochrome := True;
                    Width := FOriginalMask.Width;
                    Height := FOriginalMask.Height;
                    R := Rect(0, 0, Width, Height);
                    Canvas.CopyRect (R, FOriginalMask.Canvas, R);
                    DC := Canvas.Handle;
                    with MonoBmp.Canvas do begin
                      BitBlt (Handle, 0, 0, IWidthA, IHeightA, DC,
                        SourceRect.Left, SourceRect.Top, ROP_DSna);
                      BitBlt (Handle, 0, 0, IWidthA, IHeightA, DC,
                        SourceRect.Left, SourceRect.Top, SRCPAINT);
                    end;
                  finally
                    Free;
                  end;
                MonoBmp.Canvas.Brush.Color := clBlack;
                MonoBmp.Monochrome := True;
              end;
            end
            else begin
              { The new Office 97 / MFC look }
              if not UsesMask then begin
                with TmpImage.Canvas do begin
{$IFDEF WIN32} {DIGIMETA}
                  if not IsHighColorDIB then
                    GenerateMaskBitmap (MonoBmp, DDB, IRectA.TopLeft,
                      IRectA.BottomRight, [FTransparentColor, clWhite, clSilver])
                  else
                    GenerateMaskBitmapFromDIB (MonoBmp, FOriginal,
                      SourceRect.TopLeft, IRectA.BottomRight, [-1, clWhite, clSilver]);
{$ELSE}
                    GenerateMaskBitmap (MonoBmp, DDB, IRectA.TopLeft,
                      IRectA.BottomRight, [FTransparentColor, clWhite, clSilver]);
{$ENDIF}
                end;
              end
              else begin
                { Generate the mask in MonoBmp. Make clWhite and clSilver transparent. }

{$IFDEF WIN32} {DIGIMETA}

                if not IsHighColorDIB then
                  GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                    IRectA.BottomRight, [clWhite, clSilver])
                else
                  GenerateMaskBitmapFromDIB (MonoBmp, FOriginal, SourceRect.TopLeft,
                    IRectA.BottomRight, [clWhite, clSilver]);
{$ELSE}
                  GenerateMaskBitmap (MonoBmp, DDB, SourceRect.TopLeft,
                    IRectA.BottomRight, [clWhite, clSilver]);
{$ENDIF}
                { and all the white colors in FOriginalMask }
                with TBitmap.Create do
                  try
                    Monochrome := True;
                    Width := FOriginalMask.Width;
                    Height := FOriginalMask.Height;
                    R := Rect(0, 0, Width, Height);
                    Canvas.CopyRect (R, FOriginalMask.Canvas, R);
                    DC := Canvas.Handle;
                    with MonoBmp.Canvas do begin
                      BitBlt (Handle, 0, 0, IWidthA, IHeightA, DC,
                        SourceRect.Left, SourceRect.Top, ROP_DSna);
                      BitBlt (Handle, 0, 0, IWidthA, IHeightA, DC,
                        SourceRect.Left, SourceRect.Top, SRCPAINT);
                    end;
                  finally
                    Free;
                  end;
              end;
            end;

            with TmpImage.Canvas do begin
              Brush.Color := clBtnFace;
              FillRect (IRect);
              Brush.Color := clBtnHighlight;
              DC := Handle;
              SetTextColor (DC, clBlack);
              SetBkColor (DC, clWhite);
              BitBlt (DC, 1, 1, IWidthA, IHeightA,
                MonoBmp.Canvas.Handle, 0, 0, ROPs[FOldDisabledStyle]);
              Brush.Color := clBtnShadow;
              DC := Handle;
              SetTextColor (DC, clBlack);
              SetBkColor (DC, clWhite);
              BitBlt (DC, 0, 0, IWidthA, IHeightA,
                MonoBmp.Canvas.Handle, 0, 0, ROPs[FOldDisabledStyle]);
            end;

            FIndexs[B, State] := FGlyphList[B].AddMasked(TmpImage, clBtnFace);
          end;
        finally
          DDB.Free;
        end;
      finally
        MonoBmp.Free;
      end;
    end;
  finally
    TmpImage.Free;
  end;
  Result.B := B;
  Result.I := FIndexs[B, State];
  { Note: The Dormant call that was here in earlier versions has been removed
    because of a Delphi 3 flaw. After a call to Dormant, it converts the glyph
    to a DIB the next time the Handle property is read, regardless of the
    previous HandleType value. }
end;




procedure TppButtonGlyph.DrawButtonGlyph (Canvas: TCanvas; const GlyphPos: TPoint;
  State: TppButtonState97);
var
  Index: TppBoolInt;
begin
  if (FOriginal = nil) or (FOriginal.Width = 0) or (FOriginal.Height = 0) then
    Exit;

  Index := CreateButtonGlyph(State);

{$IFDEF WIN32}   {DIGIMETA}

  ImageList_DrawEx (FGlyphList[Index.B].Handle, {handle to imagelist}
                    Index.I,
                    Canvas.Handle, {handle to device}
                    GlyphPos.X, {X, horizontal postion}
                    GlyphPos.Y, {Y, vertical position}
                    0,          {dx, draw entire image}
                    0,          {dy, draw entire image}
                    TColorRef(CLR_NONE),   {background color}
                    TColorRef(CLR_NONE),   {foreground color}
                    ILD_TRANSPARENT);

{$ELSE}
  FGlyphList[Index.B].Draw (Canvas, GlyphPos.X, GlyphPos.Y, Index.I);
{$ENDIF}

end;


{$IFDEF WIN32}
procedure TppButtonGlyph.DrawButtonText (Canvas: TCanvas; const Caption: string;
  TextBounds: TRect; WordWrap: Boolean; State: TppButtonState97);
var
  Format: UINT;
begin
  Format := DT_CENTER or DT_VCENTER;
  if not WordWrap then
    Format := Format or DT_SINGLELINE
  else
    Format := Format or DT_WORDBREAK;
  with Canvas do begin
    Brush.Style := bsClear;
    if State = ppbsDisabled then begin
      OffsetRect (TextBounds, 1, 1);
      Font.Color := clBtnHighlight;
      DrawText (Handle, PChar(Caption), Length(Caption), TextBounds, Format);
      OffsetRect (TextBounds, -1, -1);
      Font.Color := clBtnShadow;
      DrawText (Handle, PChar(Caption), Length(Caption), TextBounds, Format);
    end
    else
      DrawText (Handle, PChar(Caption), Length(Caption), TextBounds, Format);
  end;
end;

{$ELSE}   {DIGIMETA} {ntoe: code from TB97 1.47}


function StringAsPChar (var S: OpenString): PChar;
{ Allows you to cast a short string directly into a PChar by adding a null
  after the last character. But, it does have one limitation: if the string's
  length equals its capacity, it has to delete the last character to make room
  for the null. This is usually not a problem since most strings are 256
  bytes }
begin
  if Length(S) = High(S) then Dec (S[0]);
  S[Length(S)+1] := #0;
  Result := @S[1];
end;


procedure TppButtonGlyph.DrawButtonText(Canvas: TCanvas; Caption: string; TextBounds: TRect;
                                      WordWrap: Boolean; State: TppButtonState97);
var
  Format: Word;
begin
  Format := DT_CENTER or DT_VCENTER;
  if not WordWrap then
    Format := Format or DT_SINGLELINE
  else
    Format := Format or DT_WORDBREAK;
  with Canvas do begin
    Brush.Style := bsClear;
    if State = ppbsDisabled then begin
      OffsetRect (TextBounds, 1, 1);
      Font.Color := clBtnHighlight;
      DrawText (Handle, StringAsPChar(Caption), Length(Caption), TextBounds, Format);
      OffsetRect (TextBounds, -1, -1);
      Font.Color := clBtnShadow;
      DrawText (Handle, StringAsPChar(Caption), Length(Caption), TextBounds, Format);
    end
    else
      DrawText (Handle, StringAsPChar(Caption), Length(Caption), TextBounds, Format);
  end;
end;

{$ENDIF}


procedure TppButtonGlyph.DrawButtonDropArrow (Canvas: TCanvas;
  const X, Y: Integer; State: TppButtonState97);
begin
  with Canvas do begin
    if State = ppbsDisabled then begin
      Pen.Color := clBtnHighlight;
      Brush.Color := clBtnHighlight;
      Polygon ([Point(X+5, Y+1), Point(X+9, Y+1), Point(X+7, Y+3)]);
      Pen.Color := clBtnShadow;
      Brush.Color := clBtnShadow;
      Polygon ([Point(X+4, Y), Point(X+8, Y), Point(X+6, Y+2)]);
    end
    else begin
      Pen.Color := Font.Color;
      Brush.Color := Font.Color;
      Polygon ([Point(X+4, Y), Point(X+8, Y), Point(X+6, Y+2)]);
    end;
  end;
end;

procedure TppButtonGlyph.CalcButtonLayout (Canvas: TCanvas; const Client: TRect;
  const Offset: TPoint; DrawGlyph, DrawCaption: Boolean; const Caption: string;
  WordWrap: Boolean; Layout: TButtonLayout; Margin, Spacing: Integer;
  DropArrow: Boolean; var GlyphPos, ArrowPos: TPoint; var TextBounds: TRect);
var
  TextPos: TPoint;
  ClientSize, GlyphSize, TextSize, ArrowSize: TPoint;
  TotalSize: TPoint;
  Format: UINT;
  Margin1, Spacing1: Integer;
  LayoutLeftOrRight: Boolean;
{$IFDEF WINDOWS}
  lpCaption: array[0..256] of char;
{$ENDIF}
begin
  { calculate the item sizes }
  ClientSize := Point(Client.Right-Client.Left, Client.Bottom-Client.Top);

  if DrawGlyph and (FOriginal <> nil) then
    GlyphSize := Point(FOriginal.Width div FNumGlyphs, FOriginal.Height)
  else
    GlyphSize := Point(0, 0);

  if DropArrow then
    ArrowSize := Point(9, 3)
  else
    ArrowSize := Point(0, 0);

  LayoutLeftOrRight := Layout in [blGlyphLeft, blGlyphRight];
  if not LayoutLeftOrRight and ((GlyphSize.X = 0) or (GlyphSize.Y = 0)) then begin
    Layout := blGlyphLeft;
    LayoutLeftOrRight := True;
  end;

  if DrawCaption and (Caption <> '') then begin
    TextBounds := Rect(0, 0, Client.Right-Client.Left, 0);
    if LayoutLeftOrRight then
      Dec (TextBounds.Right, ArrowSize.X);
    Format := DT_CALCRECT;
    if WordWrap then begin
      Format := Format or DT_WORDBREAK;
      Margin1 := 4;
      if LayoutLeftOrRight and (GlyphSize.X <> 0) and (GlyphSize.Y <> 0) then begin
        if Spacing = -1 then
          Spacing1 := 4
        else
          Spacing1 := Spacing;
        Dec (TextBounds.Right, GlyphSize.X + Spacing1);
        if Margin <> -1 then
          Margin1 := Margin
        else
        if Spacing <> -1 then
          Margin1 := Spacing;
      end;
      Dec (TextBounds.Right, Margin1 * 2);
    end;
  {$IFDEF WIN32}  {DIGIMETA}
    DrawText (Canvas.Handle, PChar(Caption), Length(Caption), TextBounds, Format);
  {$ELSE}
    StrPCopy(lpCaption, Caption);
    DrawText (Canvas.Handle, lpCaption, Length(Caption), TextBounds, Format);
  {$ENDIF}


    TextSize := Point(TextBounds.Right - TextBounds.Left, TextBounds.Bottom -
      TextBounds.Top);
  end
  else begin
    TextBounds := Rect(0, 0, 0, 0);
    TextSize := Point(0,0);
  end;

  { If the layout has the glyph on the right or the left, then both the
    text and the glyph are centered vertically.  If the glyph is on the top
    or the bottom, then both the text and the glyph are centered horizontally.}
  if LayoutLeftOrRight then begin
    GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
    TextPos.Y := (ClientSize.Y - TextSize.Y + 1) div 2;
  end
  else begin
    GlyphPos.X := (ClientSize.X - GlyphSize.X - ArrowSize.X + 1) div 2;
    TextPos.X := (ClientSize.X - TextSize.X + 1) div 2;
    if (GlyphSize.X = 0) or (GlyphSize.Y = 0) then
      ArrowPos.X := TextPos.X + TextSize.X
    else
      ArrowPos.X := GlyphPos.X + GlyphSize.X;
  end;

  { if there is no text or no bitmap, then Spacing is irrelevant }
  if (TextSize.X = 0) or (TextSize.Y = 0) or
     (GlyphSize.X = 0) or (GlyphSize.Y = 0) then
    Spacing := 0;

  { adjust Margin and Spacing }
  if Margin = -1 then begin
    if Spacing = -1 then begin
      TotalSize := Point(GlyphSize.X + TextSize.X + ArrowSize.X,
        GlyphSize.Y + TextSize.Y);
      if LayoutLeftOrRight then
        Margin := (ClientSize.X - TotalSize.X) div 3
      else
        Margin := (ClientSize.Y - TotalSize.Y) div 3;
      Spacing := Margin;
    end
    else begin
      TotalSize := Point(GlyphSize.X + Spacing + TextSize.X + ArrowSize.X,
        GlyphSize.Y + Spacing + TextSize.Y);
      if LayoutLeftOrRight then
        Margin := (ClientSize.X - TotalSize.X + 1) div 2
      else
        Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
    end;
  end
  else begin
    if Spacing = -1 then begin
      TotalSize := Point(ClientSize.X - (Margin + GlyphSize.X + ArrowSize.X),
        ClientSize.Y - (Margin + GlyphSize.Y));
      if LayoutLeftOrRight then
        Spacing := (TotalSize.X - TextSize.X) div 2
      else
        Spacing := (TotalSize.Y - TextSize.Y) div 2;
    end;
  end;

  case Layout of
    blGlyphLeft: begin
        GlyphPos.X := Margin;
        TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
        ArrowPos.X := TextPos.X + TextSize.X;
      end;
    blGlyphRight: begin
        ArrowPos.X := ClientSize.X - Margin - ArrowSize.X;
        GlyphPos.X := ArrowPos.X - GlyphSize.X;
        TextPos.X := GlyphPos.X - Spacing - TextSize.X;
      end;
    blGlyphTop: begin
        GlyphPos.Y := Margin;
        TextPos.Y := GlyphPos.Y + GlyphSize.Y + Spacing;
      end;
    blGlyphBottom: begin
        GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
        TextPos.Y := GlyphPos.Y - Spacing - TextSize.Y;
      end;
  end;
  if (GlyphSize.X = 0) or (GlyphSize.Y = 0) then
    ArrowPos.Y := TextPos.Y + (TextSize.Y - ArrowSize.Y) div 2
  else
    ArrowPos.Y := GlyphPos.Y + (GlyphSize.Y - ArrowSize.Y) div 2;

  { fixup the result variables }
  with GlyphPos do begin
    Inc (X, Client.Left + Offset.X);
    Inc (Y, Client.Top + Offset.Y);
  end;
  with ArrowPos do begin
    Inc (X, Client.Left + Offset.X);
    Inc (Y, Client.Top + Offset.Y);
  end;
  OffsetRect (TextBounds, TextPos.X + Client.Left + Offset.X,
    TextPos.Y + Client.Top + Offset.X);
end;

function TppButtonGlyph.Draw (Canvas: TCanvas; const Client: TRect;
  const Offset: TPoint; DrawGlyph, DrawCaption: Boolean; const Caption: string;
  WordWrap: Boolean; Layout: TButtonLayout; Margin, Spacing: Integer;
  DropArrow: Boolean; State: TppButtonState97): TRect;
var
  GlyphPos, ArrowPos: TPoint;
begin
  CalcButtonLayout (Canvas, Client, Offset, DrawGlyph, DrawCaption, Caption,
    WordWrap, Layout, Margin, Spacing, DropArrow, GlyphPos, ArrowPos, Result);
  if DrawGlyph then
    DrawButtonGlyph (Canvas, GlyphPos, State);
  if DrawCaption then
    DrawButtonText (Canvas, Caption, Result, WordWrap, State);
  if DropArrow then
    DrawButtonDropArrow (Canvas, ArrowPos.X, ArrowPos.Y, State);
end;



end.
