{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDsgnCt;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Controls, Graphics, ExtCtrls, Menus, TypInfo,
  StdCtrls, Dialogs, IniFiles, ppTypes, ppUtils;

type

  {TppDesignBand - design control for ppBands}
  TppDesignBand = class(TPanel)
    private
      FOnPaint: TNotifyEvent;
 
    protected
      procedure Paint; override;

    public
      constructor Create(aOwner: TComponent); override;

      property Color;
      property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;

  end; {class, TppDesignBand}


  { TppDesignControl }

  TppBoundsLockStateType = (ppblLeft, ppblTop, ppblWidth, ppblHeight);

  TppBoundsLockStates = set of TppBoundsLockStateType;

  TppDesignControl = class(TGraphicControl)
  private
    FFrameStyle: TppFrameStyleType;
    FOnPaint: TppPaintEvent;
    FBoundsLocks: TppBoundsLockStates;
    FMouseClickPos: TPoint;

  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

  public
    constructor Create(AOwner: TComponent); override;
    property BoundsLocks: TppBoundsLockStates read FBoundsLocks write FBoundsLocks;
    property Canvas;
    property FrameStyle: TppFrameStyleType read FFrameStyle write FFrameStyle;

    property MouseClickPos: TPoint read FMouseClickPos write FMouseClickPos;

    property PopupMenu;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPaint: TppPaintEvent read FOnPaint write FOnPaint;
{$IFDEF WIN32}
    property OnStartDrag;
{$ENDIF}

  end; {class, TppDesignControl}


   { TppPopupMenu }
  TppPopupMenu = class(TPopupMenu)
    private
      FLanguageIndex: Longint;
      FItemOrder: TStringList;
      FCurrentObject: TComponent;

      
       procedure BooleanPropMenuItemClick(Sender: TObject);
      function IsBoolProp(aObject: TObject; aMenuItem: TMenuItem): Boolean;
      function GetBoolPropValue(aObject: TObject; aMenuItem: TMenuItem): Boolean;
      procedure ToggleBoolPropValue(aObject: TObject; aMenuItem: TMenuItem);

    protected

      procedure SetLanguageIndex(aLanguageIndex: Integer); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function AddItem(aGroupIndex: Integer; const aItemName, aCaption: String; aStringId: Longint): TMenuItem;
      function ItemByName(const aItemName: String): TMenuItem;

      procedure SetMenuItemState(aComponent: TComponent);

      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;

  end; {class, TppPopupMenu}

  {TppBandPopupMenu}
  TppBandPopupMenu = class(TppPopupMenu)

  end; {class, TppBandPopupMenu}

  {TppBoundsRect}
  TppBoundsRect = class(TShape)
  private
    FBoundsLocks: TppBoundsLockStates;
    FObjectLeft: Longint;
    FObjectTop: Longint;
    FObjectWidth: Longint;
    FObjectHeight: Longint;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetObjectBounds(aLeft, aTop, aWidth, aHeight: Longint);

    property BoundsLocks: TppBoundsLockStates read FBoundsLocks write FBoundsLocks;
    property ObjectLeft: Longint read FObjectLeft write FObjectLeft;
    property ObjectTop: Longint read FObjectTop write FObjectTop;
    property ObjectWidth: Longint read FObjectWidth write FObjectWidth;
    property ObjectHeight: Longint read FObjectHeight write FObjectHeight;


  end;  {class, TppBoundsRect}

  {enumerated type to track selection handles}
  TppSelectionHandleType = (slTopLeft, slTopRight, slBottomLeft, slBottomRight);

  {TppSelectionHandles}
  TppSelectionHandles = class(TComponent)
  private
    FaHandles: array [slTopLeft..slBottomRight] of TShape;
    FParent: TWinControl;

  protected
    procedure SetParent(aParent: TWinControl); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Show(aBoundsRect: TppBoundsRect);
    procedure Hide;

    property Parent: TWinControl read FParent write SetParent;

  published
  end;  {class, TppSelectionHandles}


  {enumerated type to track sizing handles}
  TppSizingHandleType = (shTopLeft, shTopMiddle, shTopRight,
                       shLeftMiddle, shRightMiddle,
                       shBottomLeft, shBottomMiddle, shBottomRight);

  {TppSizingHandles}
  TppSizingHandles = class(TComponent)
  private
    FColor: TColor;
    FOnDragOver: TDragOverEvent;
    FOnEndDrag: TEndDragEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    FParent: TWinControl;
    FaHandles: array [shTopLeft..shBottomRight] of TShape;

    procedure SetColor(aColor: TColor);
    procedure SetDragOver(aDragOverEvent: TDragOverEvent);
    procedure SetEndDrag(aEndDragEvent: TEndDragEvent);
    procedure SetMouseDown(aMouseEvent: TMouseEvent);
    procedure SetMouseUp(aMouseEvent: TMouseEvent);

  protected
    procedure SetParent(aParent: TWinControl); virtual;

  public
    constructor Create(aOwner: TComponent); override;     
    destructor Destroy; override;

    procedure Show(aBoundsRect: TppBoundsRect);
    procedure Hide;

    property Color: TColor read FColor write SetColor;
    property OnDragOver: TDragOverEvent read FOnDragOver write SetDragOver;
    property OnEndDrag: TEndDragEvent read FOnEndDrag write SetEndDrag;
    property OnMouseDown: TMouseEvent read FOnMouseDown write SetMouseDown;
    property OnMouseUp: TMouseEvent read FOnMouseUp write SetMouseUp;
    property Parent: TWinControl read FParent write SetParent;

  end;  {class, SizingHandles}


  {TppSelectionObject}
  TppSelectionObject = class(TComponent)
  private
    FActive: Boolean;
    FBoundsRect: TppBoundsRect;
    FbrDragOver: TDragOverEvent;
    FbrEndDrag: TEndDragEvent;
    FbrMouseUp: TMouseEvent;
    FSizingHandles : TppSizingHandles;
    FSelectionHandles: TppSelectionHandles;
    FParent: TWinControl;
    FppComponent : TComponent;
    FDesignControl: TppDesignControl;

    function GetBoundsLocks:TppBoundsLockStates;

    procedure SetppComponent(appComponent: TComponent);
    procedure SetSizingHandles(aSizingHandles: TppSizingHandles);
    procedure SetbrDragOver(aDragOverEvent: TDragOverEvent);
    procedure SetbrEndDrag(aEndDragEvent: TEndDragEvent);
    procedure SetbrMouseUp(aMouseEvent: TMouseEvent);
    procedure SetSizingHandlesColor;

  protected
    procedure SetParent(aParent: TWinControl); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property Active: Boolean read FActive write FActive;
    property BoundsLocks: TppBoundsLockStates read GetBoundsLocks;
    property  DesignControl: TppDesignControl read FDesignControl;
    property  ppComponent: TComponent read FppComponent write SetppComponent;
    property  BoundsRect: TppBoundsRect read FBoundsRect;
    property  Parent: TWinControl read FParent write SetParent;
    property  brDragOver: TDragOverEvent read FbrDragOver write SetbrDragOver;
    property  brEndDrag: TEndDragEvent read FbrEndDrag write SetbrEndDrag;
    property  brMouseUp: TMouseEvent read FbrMouseUp write SetbrMouseUp;
    property  SizingHandles: TppSizingHandles read FSizingHandles write SetSizingHandles;
    procedure ShowSelection(Value: Boolean);
    procedure ShowBoundsRect(Value: Boolean);
    procedure SetComponentBounds;
    procedure SetBoundsRectBounds;

  published
  end;  {class, SelectionObject}



  {TppWorkspace}
  TppWorkspace = class(TPanel)
    private
      FBandHeights: TStringList;
      FDisplayGrid: Boolean;
      FOnPaint: TNotifyEvent;
      FColumnBackground: Boolean;
      FColumnBackgroundRect: TRect;
      FFooterBackground: Boolean;
      FXGridSpace: Integer;
      FYGridSpace: Integer;

      procedure SetDisplayGrid(Value: Boolean);
      procedure SetXGridSpace(Value: Integer);
      procedure SetYGridSpace(Value: Integer);

    protected
      procedure Paint; override;
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure PaintGrid;

      property BandHeights: TStringList read FBandHeights;
      property Canvas;
      property ColumnBackground: Boolean read FColumnBackground write FColumnBackground;
      property ColumnBackgroundRect: TRect read FColumnBackgroundRect write FColumnBackgroundRect;
      property DisplayGrid: Boolean read FDisplayGrid write SetDisplayGrid;
      property FooterBackground: Boolean read FFooterBackground write FFooterBackground;
      property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
      property XGridSpace: Integer read FXGridSpace write SetXGridSpace;
      property YGridSpace: Integer read FYGridSpace write SetYGridSpace;


  end; {class, TWorkspace}




 { TppDocHistory }

  TppDocHistory = class(TPersistent)
    private
      FIniFile: TIniFile;
      FHistory: TStringList;
      FHistoryData: TStringList;
      FSeparatorMenuItem: TMenuItem;
      FOwner: TComponent;
      FParentMenu: TMenuItem;
      FHistoryMax: Integer;
      FOnMenuItemClick: TNotifyEvent;

      procedure AddItem(aName: String; aData: TStrings);
      procedure DeleteItem(aIndex: Integer);
      procedure LoadFromIniFile;
      procedure SaveToIniFile;
      procedure SetMenuItemCaptions;
      procedure SetMenuItemClick(aNotifyEvent: TNotifyEvent);

      function ItemDataFromString(aString: String): TStrings;
      function ItemDataToString(aData: TStrings): String;

      function GetDataForItemName(aName: String): TStrings;

    public
      constructor Create(aOwner: TComponent; aParentMenu: TMenuItem; aIniFileName: String);
      destructor Destroy; override;

      function GetItemName(aMenuItem: TMenuItem): String;
      function GetItemData(aMenuItem: TMenuItem): TStrings;
      procedure UpdateItem(aName: String; aData: TStrings);

      property OnMenuItemClick: TNotifyEvent read FOnMenuItemClick write SetMenuItemClick;

  end; {class TppDocHistory }

 
implementation

uses Forms, ppClass;

{******************************************************************************
 *
 ** T pp D E S I G N  B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDesignBand.Create}

constructor TppDesignBand.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnPaint := nil;
  Cursor      := crSizeNS;
  DragCursor  := crSizeNS;
  Left        := 0;
  Height      := 16;

  Alignment   := taLeftJustify;
  BorderStyle := bsSingle;
  Font.Name   := 'Arial';
  Font.Size   := 8;

  BevelOuter  := bvNone;
  BorderStyle := bsNone;

end;

{------------------------------------------------------------------------------}
{ TppDesignBand.Paint - used to trigger ruler scrolling}

procedure TppDesignBand.Paint;
begin

  inherited Paint;

  if Assigned(FOnPaint) then FOnPaint(Self);
end;




{******************************************************************************
 *
 ** T p p D e s i g n C o n t r o l
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDesignControl.Create }

constructor TppDesignControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFrameStyle  := fsSolid;
{$IFDEF WIN32}
  ControlStyle := ControlStyle + [csReplicatable];
{$ENDIF}
  FBoundsLocks := [];
end;


{------------------------------------------------------------------------------}
{ TppDesignControl.Paint }

procedure TppDesignControl.Paint;
begin
  if Assigned(FOnPaint) then FOnPaint(Canvas);

end;

{------------------------------------------------------------------------------}
{ TppDesignControl.MouseDown }

procedure TppDesignControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FMouseClickPos := Point(X,Y);
  
  inherited MouseDown(Button, Shift, X, Y);

end;


 
{******************************************************************************
 *
 ** P O P U P  M E N U
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPopupMenu.Create }

constructor TppPopupMenu.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FItemOrder := TStringList.Create;
  FItemOrder.Sorted := True;

  FCurrentObject := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppPopupMenu.Destroy }

destructor TppPopupMenu.Destroy;
begin

  FItemOrder.Free;

  inherited Destroy;


end; {destructor, Create}


{------------------------------------------------------------------------------}
{ TppPopupMenu.SetLanguageIndex }

procedure TppPopupMenu.SetLanguageIndex(aLanguageIndex: Integer);
begin
  FLanguageIndex := aLanguageIndex;
end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppPopupMenu.AddItem }

function TppPopupMenu.AddItem(aGroupIndex: Integer; const aItemName, aCaption: String; aStringId: Longint): TMenuItem;
var
  liIndex: Integer;
  lsSortID: String;

begin

  Result := nil;

  if (FindComponent(aItemName) <> nil) then Exit;

  lsSortID := Format('%8d',[aGroupIndex]) + aItemName;

  liIndex := FItemOrder.Add(lsSortID);

  Result          := TMenuItem.Create(Self);
  Result.Name     := aItemName;
  Result.Tag      := aStringId;

  if (aCaption = '') and (aStringId <> 0) then
    Result.Caption := ppLoadStr(aStringId)
  else
    Result.Caption  := aCaption;

  Items.Insert(liIndex, Result);

end; {function, AddItem}

{------------------------------------------------------------------------------}
{ TppPopupMenu.ItemByName }

function TppPopupMenu.ItemByName(const aItemName: String): TMenuItem;
begin
  Result := TMenuItem(FindComponent(aItemName));

end; {function, ItemByName}

{------------------------------------------------------------------------------}
{ TppPopupMenu.SetMenuItemState }

procedure TppPopupMenu.SetMenuItemState(aComponent: TComponent);
var
  lMenuItem: TMenuItem;
  liIndex: Integer;

begin

  FCurrentObject := aComponent;

  for liIndex := 0 to Items.Count-1 do
    begin
      lMenuItem := Items[liIndex];

      if IsBoolProp(FCurrentObject, lMenuItem) then
        begin
          {set checked state}
          lMenuItem.Checked := GetBoolPropValue(FCurrentObject, Items[liIndex]);

          {attach event handler}
          lMenuItem.OnClick := BooleanPropMenuItemClick
        end;

    end;


end; {function, SetMenuItemState}

{------------------------------------------------------------------------------}
{ TppPopupMenu.BooleanPropMenuItemClick }

procedure TppPopupMenu.BooleanPropMenuItemClick(Sender: TObject);
begin

  ToggleBoolPropValue(FCurrentObject, TMenuItem(Sender));

end;  {procedure, BooleanPropMenuItemClick}


{------------------------------------------------------------------------------}
{ TppPopupMenu.IsBoolProp }

function TppPopupMenu.IsBoolProp(aObject: TObject; aMenuItem: TMenuItem): Boolean;
var
  lPPropInfo: PPropInfo;

begin

  lPPropInfo := GetPropInfo(aObject.ClassInfo, aMenuItem.Name);

  Result := (lPPropInfo <> nil) and (lPPropInfo.PropType^.Kind = tkEnumeration) and
                                    (lPPropInfo.PropType^.Name = 'Boolean');

end; {function, IsBoolProp}


{------------------------------------------------------------------------------}
{ TppPopupMenu.GetBoolPropValue }

function TppPopupMenu.GetBoolPropValue(aObject: TObject; aMenuItem: TMenuItem): Boolean;
begin
  {note: menu item name must be property name}
  Result := Boolean(ppGetOrdPropValue(aObject, aMenuItem.Name));

end; {function, GetBoolPropValue}


{------------------------------------------------------------------------------}
{ TppPopupMenu.ToggleBoolPropValue }

procedure TppPopupMenu.ToggleBoolPropValue(aObject: TObject; aMenuItem: TMenuItem);
var
  lbNewValue: Boolean;

begin

  lbNewValue := not GetBoolPropValue(aObject, aMenuItem);

  {note: menu item name must be property name}
  ppSetOrdPropValue(aObject, aMenuItem.Name, Ord(lbNewValue));

end; {function, ToggleBoolPropValue}


{******************************************************************************
 *
 **  B O U N D S  R E C T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppBoundsRect.Create}

constructor TppBoundsRect.Create(aOwner: TComponent);

begin

  inherited Create(aOwner);

  FObjectLeft   := 0;
  FObjectTop    := 0;
  FObjectWidth  := 0;
  FObjectHeight := 0;

  Pen.Width   := 2;
  Pen.Color   := clBtnShadow;
  Pen.Mode    := pmXor;
  Brush.Style := bsClear;
  DragCursor  := crArrow;
  Visible     := False;

  FBoundsLocks := [];

end;

{------------------------------------------------------------------------------}
{ TppBoundsRect.Destroy}

destructor TppBoundsRect.Destroy;
begin

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppBoundsRect.SetObjectBounds}

procedure TppBoundsRect.SetObjectBounds(aLeft, aTop, aWidth, aHeight: Longint);
var
  liSpLeft,
  liSpTop,
  liSpWidth,
  liSpHeight : Integer;

begin
  FObjectLeft   := aLeft;
  FObjectTop    := aTop;
  FObjectWidth  := aWidth;
  FObjectHeight := aHeight;

  {set in screen pixels also}
  liSpLeft   := Trunc(ppFromMMThousandths(aLeft,   utScreenPixels, pprtHorizontal, nil));
  liSpTop    := Trunc(ppFromMMThousandths(aTop,    utScreenPixels, pprtVertical,   nil));
  liSpWidth  := Trunc(ppFromMMThousandths(aWidth,  utScreenPixels, pprtHorizontal, nil));
  liSpHeight := Trunc(ppFromMMThousandths(aHeight, utScreenPixels, pprtVertical,   nil));

   SetBounds(liSpLeft, liSpTop, liSpWidth, liSpHeight);


end; {procedure, SetObjectBounds}

{******************************************************************************
 *
 **  S I Z I N G   H A N D L E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSizingHandles.Create}

constructor TppSizingHandles.Create(aOwner: TComponent);
var
  lshHandle : TppSizingHandleType;

begin

  inherited Create(aOwner);

  FColor := clBlack;
  FParent:= nil;

  FOnDragOver  := nil;
  FOnEndDrag   := nil;
  FOnMouseDown := nil;
  FOnMouseUp   := nil;

  {create sizing handles}
  for lshHandle := shTopLeft to shBottomRight do
    begin
      FaHandles[lshHandle]             := TShape.Create(Self);
      FaHandles[lshHandle].Tag         := Integer(lshHandle);
      FaHandles[lshHandle].Height      := 5;
      FaHandles[lshHandle].Width       := 5;
      FaHandles[lshHandle].Brush.Color := clBlack;
      FaHandles[lshHandle].Visible     := False;

    end;

  {assign appropriate cursors for each handle}

  FaHandles[shTopLeft].Cursor          := crSizeNWSE;
  FaHandles[shTopMiddle].Cursor        := crSizeNS;
  FaHandles[shTopRight].Cursor         := crSizeNESW;
  FaHandles[shLeftMiddle].Cursor       := crSizeWE;
  FaHandles[shRightMiddle].Cursor      := crSizeWE;
  FaHandles[shBottomLeft].Cursor       := crSizeNESW;
  FaHandles[shBottomMiddle].Cursor     := crSizeNS;
  FaHandles[shBottomRight].Cursor      := crSizeNWSE;

  FaHandles[shTopLeft].DragCursor      := crSizeNWSE;
  FaHandles[shTopMiddle].DragCursor    := crSizeNS;
  FaHandles[shTopRight].DragCursor     := crSizeNESW;
  FaHandles[shLeftMiddle].DragCursor   := crSizeWE;
  FaHandles[shRightMiddle].DragCursor  := crSizeWE;
  FaHandles[shBottomLeft].DragCursor   := crSizeNESW;
  FaHandles[shBottomMiddle].DragCursor := crSizeNS;
  FaHandles[shBottomRight].DragCursor  := crSizeNWSE;

end;



{------------------------------------------------------------------------------}
{ TppSizingHandles.Destroy}

destructor TppSizingHandles.Destroy;
var
  lshHandle: TppSizingHandleType;

begin

  {free sizing handles}
  for lshHandle := shTopLeft to shBottomRight do
    FaHandles[lshHandle].Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppSizingHandles.SetColor}

procedure TppSizingHandles.SetColor(aColor: TColor);
var
  lshHandle : TppSizingHandleType;

begin
  FColor := aColor;

  for lshHandle := shTopLeft to shBottomRight do
    begin
      FaHandles[lshHandle].Brush.Color := FColor;
      FaHandles[lshHandle].Pen.Color   := FColor;
    end;

end;

{------------------------------------------------------------------------------}
{ TppSizingHandles.SetParent}

procedure TppSizingHandles.SetParent(aParent: TWinControl);
var
  lshHandle : TppSizingHandleType;

begin

  FParent := aParent;

  if FParent <> nil then
    for lshHandle := shTopLeft to shBottomRight do
      FParent.InsertControl(FaHandles[lshHandle]);
      

end;

{------------------------------------------------------------------------------}
{ TppSizingHandles.SetDragOver}

procedure TppSizingHandles.SetDragOver(aDragOverEvent: TDragOverEvent);
var
  lshHandle : TppSizingHandleType;

begin

  FOnDragOver := aDragOverEvent;

  for lshHandle := shTopLeft to shBottomRight do
    FaHandles[lshHandle].OnDragOver := FOnDragOver;

end;

{------------------------------------------------------------------------------}
{ TppSizingHandles.SetEndDrag}

procedure TppSizingHandles.SetEndDrag(aEndDragEvent: TEndDragEvent);
var
  lshHandle : TppSizingHandleType;

begin

  FOnEndDrag := aEndDragEvent;

  for lshHandle := shTopLeft to shBottomRight do
    FaHandles[lshHandle].OnEndDrag := FOnEndDrag;

end;


{------------------------------------------------------------------------------}
{ TppSizingHandles.SetMouseDown}

procedure TppSizingHandles.SetMouseDown(aMouseEvent: TMouseEvent);
var
  lshHandle : TppSizingHandleType;

begin

  FOnMouseDown := aMouseEvent;

  for lshHandle := shTopLeft to shBottomRight do
    FaHandles[lshHandle].OnMouseDown := FOnMouseDown;

end;

{------------------------------------------------------------------------------}
{ TppSizingHandles.SetMouseUp}

procedure TppSizingHandles.SetMouseUp(aMouseEvent: TMouseEvent);
var
  lshHandle : TppSizingHandleType;

begin

  FOnMouseUp := aMouseEvent;

  for lshHandle := shTopLeft to shBottomRight do
    FaHandles[lshHandle].OnMouseUp := FOnMouseUp;

end;


{------------------------------------------------------------------------------}
{ TppSizingHandles.Show}

procedure TppSizingHandles.Show(aBoundsRect: TppBoundsRect);

var
  lshHandle:    TppSizingHandleType;
  liLeft,
  liTop: Integer;

begin
  liLeft := 0;
  liTop  := 0;

  if (aBoundsRect <> nil) then
    for lshHandle := shTopLeft to shBottomRight do
      begin
          case lshHandle of
            shTopLeft:
              begin
                liLeft   := aBoundsRect.Left - 2;
                liTop    := aBoundsRect.Top  - 2;
              end;

            shTopMiddle:
              begin
                liLeft   := aBoundsRect.Left + (aBoundsRect.Width div 2) - 2 ;
                liTop    := aBoundsRect.Top - 2;
              end;

            shTopRight:
              begin
                liLeft   := aBoundsRect.Left + aBoundsRect.Width - 2 ;
                liTop    := aBoundsRect.Top - 2;
              end;

            shLeftMiddle:
              begin
                liLeft   := aBoundsRect.Left - 2;
                liTop    := aBoundsRect.Top + (aBoundsRect.Height div 2) - 2 ;
              end;

            shRightMiddle:
              begin
                liLeft   := aBoundsRect.Left - 2 + aBoundsRect.Width;
                liTop    := aBoundsRect.Top + (aBoundsRect.Height div 2) - 2 ;
              end;

           shBottomLeft:
              begin
                liLeft   := aBoundsRect.Left - 2;
                liTop    := aBoundsRect.Top  - 2 + aBoundsRect.Height;
              end;

            shBottomMiddle:
              begin
                liLeft   := aBoundsRect.Left + (aBoundsRect.Width div 2) - 2 ;
                liTop    := aBoundsRect.Top - 2 + aBoundsRect.Height;
              end;

            shBottomRight:
              begin
                liLeft   := aBoundsRect.Left + aBoundsRect.Width - 2 ;
                liTop    := aBoundsRect.Top - 2 + aBoundsRect.Height;
              end;

          end; {case, sizing handle type}


          {calculate sizing handle coordinates within object}
          FaHandles[lshHandle].Left         := liLeft;
          FaHandles[lshHandle].Top          := liTop;
          FaHandles[lshHandle].BringToFront;
          FaHandles[lshHandle].Visible      := True;


      end; {for, each handle}

end; {procedure, Show}

{------------------------------------------------------------------------------}
{ TppSizingHandles.Hide}

procedure TppSizingHandles.Hide;

var
  lshHandle:    TppSizingHandleType;

begin
  for lshHandle := shTopLeft to shBottomRight do
    if FaHandles[lshHandle].Visible then
      FaHandles[lshHandle].Visible  := False;

end; {procedure, Hide}

{******************************************************************************
 *
 **  S E L E C T I O N  H A N D L E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSelectionHandles.Create}

constructor TppSelectionHandles.Create(aOwner: TComponent);
var
  lslHandle: TppSelectionHandleType;

begin

  inherited Create(aOwner);

  FParent:= nil;

  {create selection handles}
  for lslHandle := slTopLeft to slBottomRight do
    begin
      FaHandles[lslHandle]             := TShape.Create(AOwner);

      FaHandles[lslHandle].Tag         := Integer(lslHandle);
      FaHandles[lslHandle].Height      := 5;
      FaHandles[lslHandle].Width       := 5;
      FaHandles[lslHandle].Pen.Color   := clSilver;
      FaHandles[lslHandle].Brush.Color := clSilver;
      FaHandles[lslHandle].Visible     := False;
    end;

end;

{------------------------------------------------------------------------------}
{ TppSelectionHandles.Destroy}

destructor TppSelectionHandles.Destroy;
var
  lslHandle: TppSelectionHandleType;

begin
  {free sizing handles}
  for lslHandle := slTopLeft to slBottomRight do
    FaHandles[lslHandle].Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppSelectionHandles.SetParent}

procedure TppSelectionHandles.SetParent(aParent: TWinControl);
var
  lslHandle: TppSelectionHandleType;

begin
  if FParent = aParent then Exit;

  FParent := aParent;

  {create selection handles}
  if (FParent <> nil) then
    for lslHandle := slTopLeft to slBottomRight do
      FParent.InsertControl(FaHandles[lslHandle]);

end;

{------------------------------------------------------------------------------}
{ TppSelectionHandles.Show}

procedure TppSelectionHandles.Show(aBoundsRect: TppBoundsRect);

var
  lslHandle:    TppSelectionHandleType;
  liLeft,
  liTop: Integer;

begin
  liLeft := 0;
  liTop  := 0;

  if (aBoundsRect <> nil) then
    for lslHandle := slTopLeft to slBottomRight do
      begin

          case lslHandle of
            slTopLeft:
              begin
                liLeft   := aBoundsRect.Left;
                liTop    := aBoundsRect.Top;
              end;

            slTopRight:
              begin
                liLeft   := aBoundsRect.Left + aBoundsRect.Width - FaHandles[slTopRight].Width;
                liTop    := aBoundsRect.Top;
              end;

            slBottomLeft:
              begin
                liLeft   := aBoundsRect.Left;
                liTop    := aBoundsRect.Top + aBoundsRect.Height - FaHandles[slBottomLeft].Height;
              end;

            slBottomRight:
              begin
                liLeft   := aBoundsRect.Left + aBoundsRect.Width - FaHandles[slBottomRight].Width ;
                liTop    := aBoundsRect.Top  + aBoundsRect.Height - FaHandles[slBottomRight].Height;
              end;

          end; {case, sizing handle type}

          {calculate sizing handle coordinates within object}
          FaHandles[lslHandle].Left         := liLeft;
          FaHandles[lslHandle].Top          := liTop;
          FaHandles[lslHandle].BringToFront;
          FaHandles[lslHandle].Visible      := True;

      end; {for, selection handles}

end; {procedure, Show}

{------------------------------------------------------------------------------}
{ TppSelectionHandles.Hide}

procedure TppSelectionHandles.Hide;

var
  lslHandle:    TppSelectionHandleType;

begin

  for lslHandle := slTopLeft to slBottomRight do
    FaHandles[lslHandle].Visible  := False;

end; {procedure, Hide}

{******************************************************************************
 *
 **  S E L E C T I O N   O B J E C T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSelectionObject.Create}

constructor TppSelectionObject.Create(aOwner: TComponent);

begin

  inherited Create(aOwner);

  FActive     := True;
  FBoundsRect := TppBoundsRect.Create(aOwner);

  {pointers to event handlers }
  FbrDragOver := nil;
  FbrEndDrag  := nil;
  FbrMouseUp  := nil;

  FSelectionHandles := TppSelectionHandles.Create(aOwner);

  {these are used as object references (i.e. not created/destroyed by this object}
  FParent         := nil;
  FppComponent    := nil;
  FDesignControl  := nil;
  FSizingHandles  := nil;


end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.Destroy}

destructor TppSelectionObject.Destroy;
begin

  {2.0}
  if Assigned(FSizingHandles) and (Owner as TWinControl).Visible then
    FSizingHandles.Hide;

  FppComponent := nil;

  FSelectionHandles.Free;

  FBoundsRect.Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.Notification }

procedure TppSelectionObject.Notification(AComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(AComponent, Operation);

  if  (aComponent is TppSizingHandles) then

    if (aComponent = FSizingHandles) and (Operation = opRemove) then
      FSizingHandles := nil;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.GetBoundsLocks}

function TppSelectionObject.GetBoundsLocks: TppBoundsLockStates;
begin

  if DesignControl <> nil then
    Result := DesignControl.BoundsLocks
  else
    Result := [];
end;


{------------------------------------------------------------------------------}
{ TppSelectionObject.SetParent}

procedure TppSelectionObject.SetParent(aParent: TWinControl);
begin

  FParent := aParent;
  FBoundsRect.Parent := FParent;
  FSelectionHandles.Parent := FParent;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetbrDragOver - set property routine}
procedure TppSelectionObject.SetbrDragOver(aDragOverEvent: TDragOverEvent);
begin
  FbrDragOver := aDragOverEvent;
  FBoundsRect.OnDragOver := FbrDragOver;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetbrEndDrag - set property routine}
procedure TppSelectionObject.SetbrEndDrag(aEndDragEvent: TEndDragEvent);
begin
  FbrEndDrag := aEndDragEvent;

{$IFDEF WIN32}
  FBoundsRect.OnEndDrag := FbrEndDrag;
{$ENDIF}

end;
{------------------------------------------------------------------------------}
{ TppSelectionObject.SetbrMouseUp - set property routine}
procedure TppSelectionObject.SetbrMouseUp(aMouseEvent: TMouseEvent);
begin
  FbrMouseUp := aMouseEvent;
  FBoundsRect.OnMouseUp := FbrMouseUp;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetppComponent - set property routine}

procedure TppSelectionObject.SetppComponent(appComponent: TComponent);
begin

  FppComponent := appComponent;

  if (FppComponent <> nil) then
    FDesignControl := TppComponent(FppComponent).DesignControl;

  if (FDesignControl <> nil) then
    FBoundsRect.SetBounds(FDesignControl.Left, FDesignControl.Top, TppComponent(FppComponent).spWidth,
                            TppComponent(FppComponent).spHeight);


end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetSizingHandles - set property routine}

procedure TppSelectionObject.SetSizingHandles(aSizingHandles: TppSizingHandles);
begin

  if not Assigned(aSizingHandles) and Assigned(FSizingHandles) then
    {hide sizing handles and show selection handles}
    begin
      FSizingHandles.Hide;
      FSizinghandles := nil;
      ShowSelection(True);
    end
  else if Assigned(aSizingHandles) and not Assigned(FSizingHandles) then
    {hide selection handles and show sizing handles}
    begin
      FSelectionHandles.Hide;
      FSizingHandles := aSizingHandles;
      SetSizingHandlesColor;
      FSizingHandles.Show(FBoundsRect);
    end;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.ShowSelection}

procedure TppSelectionObject.ShowSelection(Value: Boolean);

begin

 if Assigned(FppComponent) then
   if Value then
     begin
       FBoundsRect.Visible := False;

       {show sizing/selection handles}
       if Assigned(FSizingHandles) then
         begin
           SetSizingHandlesColor;
           FSizingHandles.Show(FBoundsRect);

         end
       else
         FSelectionHandles.Show(FBoundsRect);

     end

   else
     {hide sizing/selection handles}
     if Assigned(FSizingHandles) then
       FSizingHandles.Hide
     else
       FSelectionHandles.Hide;

end; {procedure, ShowSelection}


{------------------------------------------------------------------------------}
{ TppSelectionObject.SetSizingHandlesColor}

procedure TppSelectionObject.SetSizingHandlesColor;
var
  lColor: TColor;

begin

  if Assigned(FSizingHandles) then
    begin

      {default to black}
      lColor := clBlack;

      if (FDesignControl <> nil) and
         ( (FDesignControl.Color = clBlack) or (FDesignControl.Color = clNavy) ) then
            lColor := clWhite;

      if FSizingHandles.Color <> lColor then
        FSizingHandles.Color := lColor;

    end;

end; {procedure, SetSizingHandlesColor}

{------------------------------------------------------------------------------}
{ TppSelectionObject.ShowBoundsRect}

procedure TppSelectionObject.ShowBoundsRect(Value: Boolean);
begin

 if Assigned(FppComponent) then
   if Value then
     begin
       if Assigned(FSizingHandles) then
         FSizingHandles.Hide
       else
         FSelectionHandles.Hide;

       FBoundsRect.Visible := True;

     end
   else
       FBoundsRect.Visible := False;

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetComponentBounds}

procedure TppSelectionObject.SetComponentBounds;
var
  lComponent: TppComponent;

begin

  if not(FActive) or (FppComponent = nil) then Exit;

  lComponent := TppComponent(FppComponent);

  {set component size based upon size of bounds rect}
  lComponent.spSetBounds(FBoundsRect.Left, FBoundsRect.Top - lComponent.Band.spTop,
                FBoundsRect.Width, FBoundsRect.Height);

end;

{------------------------------------------------------------------------------}
{ TppSelectionObject.SetBoundsRectBounds}

procedure TppSelectionObject.SetBoundsRectBounds;
var
  lComponent: TppComponent;

begin

  if not(FActive) or (FppComponent = nil) then Exit;

  lComponent := TppComponent(FppComponent);

  {set bounds rect size based upone size of component's design control}

  if (FDesignControl <> nil) then
    FBoundsRect.SetBounds(FDesignControl.Left,  FDesignControl.Top,
                              lComponent.spWidth, lComponent.spHeight);

end;

{******************************************************************************
 *
 ** W O R K S P A C E  S T U F F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppWorkspace.Create }

constructor TppWorkspace.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  Color      := clWindow;
  BevelOuter := bvNone;
  Caption    := '';
  Ctl3D      := False;
  Left       := 16;
  Top        := 16;


  FColumnBackground := False;
  FFooterBackground := False;
  FOnPaint := nil;

  FBandHeights := TStringList.Create;
  FDisplayGrid := True;
  FXGridSpace := 8;
  FYGridSpace := 8;


end;

{------------------------------------------------------------------------------}
{ TppWorkspace.Destroy }

destructor TppWorkspace.Destroy;
begin

  FBandHeights.Free;

  inherited Destroy;
end;

{------------------------------------------------------------------------------}
{ TppWorkspace.Paint - used to trigger ruler scrolling}

procedure TppWorkspace.Paint;
begin


  inherited Paint;


  if FColumnBackground then
    begin

      {draw gray rectangle for column background }
      Canvas.Brush.Color := clBtnShadow;
      Canvas.FillRect(FColumnBackgroundRect);
      
    end;

  {paint the grid}
  if FDisplayGrid then
    PaintGrid;

  if Assigned(FOnPaint) then FOnPaint(Self);

end;


{------------------------------------------------------------------------------}
{ TppWorkspace.SetDisplayGrid }

procedure TppWorkspace.SetDisplayGrid(Value: Boolean);
begin
  FDisplayGrid := Value;

  Invalidate;
end;

{------------------------------------------------------------------------------}
{ TppWorkspace.SetXGridSpace }

procedure TppWorkspace.SetXGridSpace(Value: Integer);
begin
  FXGridSpace := Value;

  Invalidate;
end;

{------------------------------------------------------------------------------}
{ TppWorkspace.SetYGridSpace }

procedure TppWorkspace.SetYGridSpace(Value: Integer);
begin
  FYGridSpace := Value;

  Invalidate;
end;

{------------------------------------------------------------------------------}
{ TppWorkspace.PaintGrid - paints the dots of the grid}

procedure TppWorkspace.PaintGrid;
var
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  lBitmap: TBitmap;
  liBand: Integer;
  liHeight: Integer;
begin

  lBitmap := TBitmap.Create;
  lBitmap.Height := Height;
  lBitmap.Width := Width;

  liTop := 0;
  liHeight := 0;

  for liBand := 0 to FBandHeights.Count - 1 do
    begin

      liHeight := liHeight + StrToInt(FBandHeights[liBand]);

      while (liTop <= liHeight) do
        begin

          liLeft := 0;

          if FColumnBackground and
             (liTop >= FColumnBackgroundRect.Top) and
             (liTop <= FColumnBackgroundRect.Bottom) then

            liWidth := Width - (FColumnBackgroundRect.Right - FColumnBackgroundRect.Left) - 1

          else
            liWidth := Width;

          while (liLeft <= liWidth) do
            begin
              lBitmap.Canvas.MoveTo(liLeft, liTop);
              lBitmap.Canvas.LineTo(liLeft, liTop + 1);

              Inc(liLeft, FXGridSpace);
            end; {draw dots left to right}

          Inc(liTop, FYGridSpace);

        end; {draw dots top to bottom}

      {move height beyond band control}
      liHeight := liHeight + 19;

      {set to top of next band}
      liTop := liHeight;

    end; {for each band}


  {blast the grid to the workspace canvas}
 { Canvas.CopyRect(Rect(0,0,Width,Height), lBitmap.Canvas, Rect(0,0,lBitmap.Width, lBitmap.Height));}

  Canvas.CopyRect(Canvas.ClipRect, lBitmap.Canvas, Canvas.ClipRect);


  lBitmap.Free;

end; {procedure, PaintGrid}




{******************************************************************************
*
*  TppDocHistory
*
******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDocHistory.Create }

constructor TppDocHistory.Create(aOwner: TComponent; aParentMenu: TMenuItem; aIniFileName: String);
begin

  FHistory     := TStringList.Create;
  FHistoryData := TStringList.Create;

  FIniFile     := TIniFile.Create(aIniFileName);
  FOwner       := aOwner;
  FParentMenu  := aParentMenu;

  FSeparatorMenuItem := nil;
  FOnMenuItemClick   := nil;

  LoadFromIniFile;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.Destroy }

destructor TppDocHistory.Destroy;
var
  liData: Integer;

begin

  SaveToIniFile;

  FHistory.Free;

  {free the TStringlist objects store in FHistoryData}
  for liData := 0 to FHistoryData.Count-1 do
    FHistoryData.Objects[liData].Free;

  FHistoryData.Free;
  FIniFile.Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.SetMenuItemClick }

procedure TppDocHistory.SetMenuItemClick(aNotifyEvent: TNotifyEvent);
var
  liMenuItem: Integer;

begin
  FOnMenuItemClick := aNotifyEvent;

  for liMenuItem := 0 to FHistory.Count-1 do
    TMenuItem(FHistory.Objects[liMenuItem]).OnClick := FOnMenuItemClick;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.LoadFromIniFile }

procedure TppDocHistory.LoadFromIniFile;
var
  liItem: Integer;
  lsItemData: String;
  lItemData: TStrings;
  lHistory: TStringList;

begin
  lHistory := TStringList.Create;

  FHistory.Clear;

  FHistoryMax := FIniFile.ReadInteger('Last Reports Accessed', 'Max', 5);

  for liItem := 0 to FHistoryMax do
    begin

      lsItemData := FIniFile.ReadString('Last Reports Accessed','R'+IntToStr(liItem),'');

      if (lsItemData <> '') then
        begin
          lItemData := ItemDataFromString(lsItemData);
          lHistory.AddObject(lItemData[0], lItemData);
        end;

    end;

  {note: items get added to the front of the list }
  for liItem := lHistory.Count-1 downto 0 do
    AddItem(lHistory[liItem], TStrings(lHistory.Objects[liItem]));

  SetMenuItemCaptions;

  lHistory.Free;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.SaveToIniFile }

procedure TppDocHistory.SaveToIniFile;
var
  liReport: Integer;
  lsItemData: String;

begin

  FIniFile.EraseSection('Last Reports Accessed');

  FIniFile.WriteInteger('Last Reports Accessed', 'Max', FHistoryMax);

  for liReport := 0 to (FHistory.Count-1) do
    begin
      lsItemData := ItemDataToString(GetDataForItemName(FHistory[liReport]));

      FIniFile.WriteString('Last Reports Accessed','R'+IntToStr(liReport),lsItemData);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.GetItemData}

function TppDocHistory.GetItemData(aMenuItem: TMenuItem): TStrings;
var
  lsName: String;

begin

  lsName := GetItemName(aMenuItem);

  Result := GetDataForItemName(lsName);

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.GetDataForItemName}

function TppDocHistory.GetDataForItemName(aName: String): TStrings;
var
  liItemData: Integer;

begin
  liItemData := FHistoryData.IndexOf(aName);
  Result := TStrings(FHistoryData.Objects[liItemData]);
end;

{------------------------------------------------------------------------------}
{ TppDocHistory.GetItemName}

function TppDocHistory.GetItemName(aMenuItem: TMenuItem): String;
begin
  Result := FHistory[FHistory.IndexOfObject(aMenuItem)];

end;


{------------------------------------------------------------------------------}
{ TppDocHistory.ItemDataFromString}

function TppDocHistory.ItemDataFromString(aString: String): TStrings;
var
  liComma: Integer;
  liCount: Integer;
  lsString: String;
  
begin
  Result := TStringList.Create;

  lsString := aString;

  while Length(lsString) > 0 do
    begin

      liComma := Pos( ',', lsString);

      if liComma = 0 then
        liCount := Length(lsString)
      else
        liCount := liComma-1;

      Result.Add(Copy(lsString,0, liCount));

      lsString := Copy(lsString, liCount+2,Length(lsString));

    end;

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.ItemDataToString}

function TppDocHistory.ItemDataToString(aData: TStrings): String;
var
  liItem: Integer;

begin

  Result := '';

  for liItem := 0 to aData.Count-1 do
    if liItem = 0 then
      Result := aData[liItem]
    else
      Result := Result + ',' + aData[liItem];

end;

{------------------------------------------------------------------------------}
{ TppDocHistory.UpdateItem}

procedure TppDocHistory.UpdateItem(aName: String; aData: TStrings);
var
  liHistory: Integer;
  lItemData: TStrings;

begin

  {determine whether this item already in history}
  liHistory := FHistory.IndexOf(aName);

  if liHistory = 0 then Exit;

  {delete item from history, if needed}
  if liHistory > 0 then
    DeleteItem(liHistory);

  {add item to front of history}
  lItemData := TStringList.Create;
  lItemData.Assign(aData);
  AddItem(aName, lItemData);

  {delete last item in history list, if too many items }
  if (FHistory.Count > FHistoryMax) then
    DeleteItem(FHistory.Count-1);

  {update menu item captions}
  SetMenuItemCaptions;


end;


{------------------------------------------------------------------------------}
{ TppDocHistory.AddItem}

procedure TppDocHistory.AddItem(aName: String; aData: TStrings);
var
  liMenuIndex: Integer;
  lMenuItem: TMenuItem;

begin

  {create new menu item}
  lMenuItem := TMenuItem.Create(FOwner);
  lMenuItem.OnClick := FOnMenuItemClick;

  {add new item to menu}
  if (FSeparatorMenuItem = nil) then
    begin
      {add separator menu item, this is the line on the menu}
      FSeparatorMenuItem := TMenuItem.Create(FOwner);
      FSeparatorMenuItem.Caption := '-';
      FParentMenu.Add(FSeparatorMenuItem);

      FParentMenu.Add(lMenuItem)
    end
  else
    begin
      liMenuIndex := FParentMenu.IndexOf(TMenuItem(FHistory.Objects[0]));
      FParentMenu.Insert(liMenuIndex, lMenuItem);
    end;

  {add item to front of history list }
  FHistory.InsertObject(0, aName, lMenuItem);
  FHistoryData.InsertObject(0, aName, aData);

end;


{------------------------------------------------------------------------------}
{ TppDocHistory.DeleteItem}

procedure TppDocHistory.DeleteItem(aIndex: Integer);
var
  liMenuIndex: Integer;
  liDataIndex: Integer;

begin

  liMenuIndex := FParentMenu.IndexOf(TMenuItem(FHistory.Objects[aIndex]));

  if liMenuIndex >= 0 then
    FParentMenu.Delete(liMenuIndex);

  {delete item data}
  liDataIndex := FHistoryData.IndexOf(FHistory[aIndex]);
  if liDataIndex >= 0 then
    begin
      FHistoryData.Objects[liDataIndex].Free;
      FHistoryData.Delete(liDataIndex);
    end;

  FHistory.Delete(aIndex);

end;


{------------------------------------------------------------------------------}
{ TppDocHistory.SetMenuItemCaptions}

procedure TppDocHistory.SetMenuItemCaptions;
var
  liHistory: Integer;

begin
  for liHistory := 0 to FHistory.Count-1 do
    TMenuItem(FHistory.Objects[liHistory]).Caption := '&' + IntToStr(liHistory+1) +
                                                      ' ' + FHistory[liHistory];
end;


end.
