{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppRegion;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, SysUtils, Forms, ExtCtrls, Menus,
  ppClass, ppComm, ppTypes, ppStrtch, ppDevice, ppPrnabl, ppDrwCmd,
  ppDsgnCt, ppRTTI;

type

  { TppCustomRegion }
  TppCustomRegion = class(TppStretchable)
    private
      FBrush: TBrush;
      FMaxStretchable: TppStretchable;
      FObjectLists: TStringList;
      FObjects: TList;
      FPen: TPen;
      FSaveLeft: Longint;
      FSaveTop: Longint;
      FSaveWidth: Longint;
      FSaveHeight: Longint;
      FShapeType: TShapeType;
      FShifters: TList;
      FStatics: TList;
      FStretchables: TList;
      FStretchers: TList;

      function  GetObject(aIndex: Integer): TppComponent;
      function  GetObjectCount: Integer;
      procedure FreeObjects;
      procedure SetBrush(aBrush: TBrush); virtual;
      procedure SetPen(aPen: TPen); virtual;

      {print routines}
      procedure CategorizeObjects;
      procedure FreeLists;
      procedure GenerateObjects(aListIndex, aObjectIndex: Integer);
      function  PrintingSection: Boolean;
      procedure ProcessQueue(aQueue: TList; aObjectIndex: Integer);

    protected
      procedure CalcSpaceUsed; override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure BoundsChange; override;
      function  GetNextSibling: TppComponent; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure RedrawOnOverFlow; override;
      procedure SetBand(aBand: TppBand); override;
      procedure SetRegion(aRegion: TppComponent); override;
      procedure SetTransparent(Value: Boolean); override;
      procedure StyleChanged(Sender: TObject); virtual;
      procedure UpdateDesignControlBounds; override;
      procedure UpdateChildControlBounds;
      procedure Loaded; override;

{$IFDEF WIN32}

  {$IFDEF Delphi3}
     procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
     procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
    procedure WriteComponents(Writer: TWriter); override;
{$ENDIF}


    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddObject(aObject: TObject);
      procedure BringObjectToFront(aObject: TppComponent);
      procedure BringToFront; override;
      function  FindObject(appComponent: TppComponent): Integer;
      function  HasFont: Boolean; override;
      procedure Init; override;
      procedure RemoveObject(aObject: TObject);
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure SendObjectToBack(aObject: TppComponent);
      procedure SendToBack; override;
      procedure SetBackgroundColor(aColor: TColor; aIsClear: Boolean); override;
      procedure SetForegroundColor(aColor: TColor; aIsClear: Boolean); override;
      procedure SetPenWidth(aWidth: Integer); override;

      property Brush: TBrush read FBrush write SetBrush;
      property CurrentPosition;
      property ObjectCount: Integer read GetObjectCount;
      property Objects[Index: Integer]: TppComponent read GetObject;
      property MaxStretchable: TppStretchable read FMaxStretchable;
      property PageBottom;
      property ParentWidth default True;
      property Pen: TPen read FPen write SetPen;

  end; {class, TppCustomRegion}

  { TppRegion }
  TppRegion = class(TppCustomRegion)
    public
     constructor Create(aOwner: TComponent); override;

    published
      property Brush;
      property Caption;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ParentHeight;
      property ParentWidth;
      property Pen;
      property ReprintOnOverFlow;
      property ShiftRelativeTo;
      property ShiftWithParent;
      property Stretch;
      property StretchWithParent;
      property Transparent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property BottomOffset stored False;
      property Height stored False;
      property Left stored False;
      property OverFlowOffset stored False;
      property Top stored False;
      property Width stored False;

   end; {class, TppRegion}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomRegionRTTI }
  TraTppCustomRegionRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomRegionRTTI}


implementation

uses
  ppCtrls;

{******************************************************************************
 *
 **  C U S T O M    R E G I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomRegion.Create }

constructor TppCustomRegion.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppRegionSaveRec);

  DrawCommandClass := TppDrawShape;

  FBrush             := TBrush.Create;
  FPen               := TPen.Create;
  FShapeType         := stRectangle;
  FObjectLists       := TStringList.Create;
  FObjects           := TList.Create;
  FSaveLeft          := 0;
  FSaveTop           := 0;
  FSaveWidth         := 0;
  FSaveHeight        := 0;
  FStretchables      := nil;
  FShifters          := nil;
  FStretchers        := nil;
  FStatics           := nil;


  {if pen or brush changed - notify design control}
  FPen.OnChange   := StyleChanged;
  FBrush.OnChange := StyleChanged;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomRegion.Destroy }

destructor TppCustomRegion.Destroy;
begin

  {free print processing lists}
  FreeLists;

  FObjectLists.Free;

  FreeObjects;

  FBrush.Free;
  FPen.Free;

  FObjects.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomRegion.FreeObjects }

procedure TppCustomRegion.FreeObjects;
var
  liObject: Integer;
  lObject: TObject;

begin

  {ppDebugMessage('TppBand', 'Destroy', 'free each report component associated with this band', True);}
  for liObject := 0 to FObjects.Count - 1 do
    begin
      lObject := FObjects.Last;
      lObject.Free;
    end;

  FObjects.Clear;

end; {procedure, FreeObjects}

{------------------------------------------------------------------------------}
{ TppCustomRegion.Loaded }

procedure TppCustomRegion.Loaded;
begin

  inherited Loaded;

  FSaveLeft := mmLeft;
  FSaveTop  := mmTop;

  FSaveWidth  := mmWidth;
  FSaveHeight := mmHeight;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppCustomRegion.BoundsChange }

procedure TppCustomRegion.BoundsChange;
begin

  inherited BoundsChange;

  {if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;}
  if not (pppcDesigning in DesignState) or (Printing) then
    UpdateChildControlBounds;

  FSaveLeft := mmLeft;
  FSaveTop  := mmTop;

  FSaveWidth  := mmWidth;
  FSaveHeight := mmHeight;


end; {procedure, BoundsChange}

{------------------------------------------------------------------------------}
{ TppCustomRegion.UpdateDesignControlBounds }

procedure TppCustomRegion.UpdateDesignControlBounds;
begin
  inherited UpdateDesignControlBounds;

  UpdateChildControlBounds;

end; {procedure, UpdateDesignControlBounds }



{------------------------------------------------------------------------------}
{ TppCustomRegion.UpdateChildControlBounds }

procedure TppCustomRegion.UpdateChildControlBounds;
var
  liObject: Integer;
  llMoveLeft, llMoveTop: Longint;
  lComponent: TppComponent;

begin

  if (FObjects = nil) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FSaveWidth = 0) or (FSaveHeight = 0) then Exit;

  if (FSaveLeft <> mmLeft)   or (FSaveTop <> mmTop) or
     (FSaveWidth <> mmWidth) or (FSaveHeight <> mmHeight) then
    begin

      llMoveLeft := mmLeft - FSaveLeft;
      llMovetop  := mmTop  - FSaveTop;

      {move objects in region }
      for liObject := 0 to FObjects.Count - 1 do
        begin

          lComponent := Objects[liObject];

          lComponent.mmSetBounds( (lComponent.mmLeft + llMoveLeft) ,
                                  (lComponent.mmTop + llMovetop), lComponent.mmWidth, lComponent.mmHeight);

          {notify components of the change in size - this is to support ParentHeight, ParentWidth}
          if (FSaveWidth <> mmWidth) or (FSaveHeight <> mmHeight) then
            lComponent.ParentBoundsChange

        end;

    end;

end; {procedure, UpdateChildControlBounds }



{------------------------------------------------------------------------------}
{ TppCustomRegion.SetPen }

procedure TppCustomRegion.SetPen(aPen: TPen);
begin

  FPen.Assign(aPen);

  StyleChanged(Self);

end; {procedure, SetPen }

{------------------------------------------------------------------------------}
{ TppCustomRegion.SetBrush }

procedure TppCustomRegion.SetBrush(aBrush: TBrush);
begin

  FBrush.Assign(aBrush);

  StyleChanged(Self);

end; {procedure, SetBrush }

{------------------------------------------------------------------------------}
{ TppCustomRegion.SetBackgroundColor }

procedure TppCustomRegion.SetBackgroundColor(aColor: TColor; aIsClear: Boolean);
begin

  if aIsClear then
    begin
      if (FBrush.Style <> bsClear) then
        FBrush.Style := bsClear;
    end
  else
    begin
      FBrush.Color := aColor;
      if (FBrush.Style = bsClear) then
        FBrush.Style := bsSolid;
    end;

end; {procedure, SetBackgroundColor }

{------------------------------------------------------------------------------}
{ TppCustomRegion.SetForegroundColor }

procedure TppCustomRegion.SetForegroundColor(aColor: TColor; aIsClear: Boolean);
begin

  if aIsClear then
    FPen.Style := psClear
  else
    begin
      FPen.Color := aColor;
      if FPen.Style = psClear then
        FPen.Style := psSolid;
    end;


end; {procedure, SetForegroundColor }

{------------------------------------------------------------------------------}
{ TppCustomRegion.SetPenWidth }

procedure TppCustomRegion.SetPenWidth(aWidth: Integer);
begin
  FPen.Width := aWidth;
end; {procedure, SetPenWidth }

{------------------------------------------------------------------------------}
{ TppCustomRegion.StyleChanged }

procedure TppCustomRegion.StyleChanged(Sender: TObject);
begin

  InvalidateDesignControl;

  PropertyChange;
  
end; {procedure, StyleChanged }

{------------------------------------------------------------------------------}
{ TppCustomRegion.AddObject }

procedure TppCustomRegion.AddObject(aObject: TObject);
var
  lComponent: TppComponent;

begin

  if aObject is TppComponent then
    lComponent := TppComponent(aObject)
  else
    Exit;

  if (lComponent.Band <> Band) then
    lComponent.Band := Band;

  FObjects.Add(lComponent);

  AddNotify(lComponent);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  BringObjectToFront(lComponent);


  {if object needs to stretch, then set Stretch property to true
    note: call SetPrintHeight to allow descendants to determine what to do}
  if (lComponent is TppStretchable) and TppStretchable(lComponent).Stretch and
                                        not Stretch then
    Stretch := True;

end; {procedure, AddObject}

{------------------------------------------------------------------------------}
{ TppCustomRegion.RemoveObject }

procedure TppCustomRegion.RemoveObject(aObject: TObject);
var
  lComponent: TppComponent;

begin

  if aObject is TppComponent then
    lComponent := TppComponent(aObject)
  else
    Exit;

  {remove object from list by setting its position to nil}
  FObjects.Remove(lComponent);

  {this will trigger a lComponent.RemoveNotify}
  lComponent.Notify(Self, ppopRemove);

  RemoveNotify(lComponent);

  Reset;

  if not (csDestroying in lComponent.ComponentState) then
    PostDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg, LongInt(lComponent));

end; {procedure, RemoveObject}

{------------------------------------------------------------------------------}
{ TppCustomRegion.GetObject }

function  TppCustomRegion.GetObject(aIndex: Integer): TppComponent;
begin
  Result := FObjects[aIndex];
end; {function, GetObject}

{------------------------------------------------------------------------------}
{ TppCustomRegion.FindObject }

function TppCustomRegion.FindObject(appComponent: TppComponent): Integer;
begin
  Result := FObjects.IndexOf(appComponent);

end; {function, FindObject}

{------------------------------------------------------------------------------}
{ TppCustomRegion.GetObjectCount }

function  TppCustomRegion.GetObjectCount: Integer;
begin
  Result := FObjects.Count;
end; {function, GetObject}


{------------------------------------------------------------------------------}
{ TppCustomRegion.GetNextSibling }

function  TppCustomRegion.GetNextSibling: TppComponent;
var
  liIndex: Integer;
  lComponent: TppComponent;
begin
  Result := nil;

  liIndex := Index + 1;

  while (Result = nil) and (liIndex < Band.ObjectCount) do
    begin
      lComponent := Band.Objects[liIndex];

      if FindObject(lComponent) < 0 then
        Result := lComponent;

      Inc(liIndex);

    end;

end; {function, GetNextSibling}


{------------------------------------------------------------------------------}
{ TppCustomRegion.HasFont }

function  TppCustomRegion.HasFont: Boolean;
begin
  Result := False;
end; {function, HasFont}

{------------------------------------------------------------------------------}
{ TppCustomRegion.BringObjectToFront }

procedure TppCustomRegion.BringObjectToFront(aObject: TppComponent);
var
  liCurrIndex: Integer;
  liNewIndex: Integer;

begin

  if Band = nil then Exit;

  {make sure object assigned to band}
  if (aObject.Band = nil) then
    aObject.Band := Band;

  {reposition object to end of list}
  FObjects.Remove(aObject);
  FObjects.Add(aObject);

  {find object in the band}
  liCurrIndex := Band.FindObject(aObject);

  {find location of region in band list}
  liNewIndex := Index + FObjects.Count;

  {move the object to proper position in band}
  Band.MoveObject(liCurrIndex, liNewIndex);

end; {procedure, BringObjectToFront}

{------------------------------------------------------------------------------}
{ TppCustomRegion.SendObjectToBack }

procedure TppCustomRegion.SendObjectToBack(aObject: TppComponent);
var
  liCurrIndex, liNewIndex: Integer;

begin

  if Band = nil then Exit;

  {make sure object assigned to band}
  if (aObject.Band = nil) then
    aObject.Band := Band;

  {reposition object to front of list}
  FObjects.Remove(aObject);
  FObjects.Insert(0, aObject);

  {find object in the band}
  liCurrIndex := Band.FindObject(aObject);

  {find location of region in band list}
  liNewIndex := Band.FindObject(Self) + 1;

  {move the object to proper position in band}
  Band.MoveObject(liCurrIndex, liNewIndex);


end; {procedure, SendObjectToBack}

{------------------------------------------------------------------------------}
{ TppCustomRegion.BringToFront }

procedure TppCustomRegion.BringToFront;
var
  liObject: Integer;
  lObjects: TList;
  lObject: TppComponent;
begin

  if Band = nil then Exit;

  {bring self to front}
  Band.BringObjectToFront(Self);

  lObjects := TList.Create;

  {make local copy of objects - since they are change position during the process}
  for liObject := 0 to FObjects.Count-1  do
    lObjects.Add(FObjects[liObject]);

  {bring children to front}
  for liObject := 0 to lObjects.Count-1 do
    begin
      lObject :=  TppComponent(lObjects[liObject]);
      BringObjectToFront(lObject);
    end;


  PropertyChange;
  
  lObjects.Free;


end; {procedure, BringToFront}

{------------------------------------------------------------------------------}
{ TppCustomRegion.SendToBack }

procedure TppCustomRegion.SendToBack;
var
  liObject: Integer;
  lObjects: TList;
  lObject: TppComponent;

begin

  if Band = nil then Exit;

  {send self to back}
  Band.SendObjectToBack(Self);

  lObjects := TList.Create;

  {make local copy of objects - since they are change position during the process}
  for liObject := 0 to FObjects.Count-1  do
    lObjects.Add(FObjects[liObject]);

   {send children to back}
  for liObject := lObjects.Count-1 downto 0  do
    begin
      lObject :=  TppComponent(lObjects[liObject]);
      SendObjectToBack(lObject);
    end;

  PropertyChange;

  lObjects.Free;

end; {procedure, SendToBack}

{------------------------------------------------------------------------------}
{ TppCustomRegion.PaintDesignControl }

procedure TppCustomRegion.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  liCount: Integer;

begin

  if (DesignControl = nil) then Exit;

  lClientRect := DesignControl.ClientRect;

  {assign pen and brush}
  aCanvas.Pen   := FPen;
  aCanvas.Brush := FBrush;


  {aCanvas.FillRect(lClientRect);}

  {aCanvas.Font := Font;}


 { aCanvas.FrameRect(lClientRect);}
  aCanvas.Rectangle(lClientRect.Left, lClientRect.Top, lClientRect.Right, lClientRect.Bottom);


  aCanvas.Pen.Style := psSolid;


  for liCount := 0 to 1 do
    begin

      InflateRect(lClientRect, -1, -1);

      aCanvas.Pen.Color := clGray;
      aCanvas.MoveTo(lClientRect.Left, lClientRect.Bottom-2);
      aCanvas.LineTo(lClientRect.Left, lClientRect.Top);
      aCanvas.LineTo(lClientRect.Right-1, lClientRect.Top);

      aCanvas.Pen.Color := clSilver;
      aCanvas.LineTo(lClientRect.Right-1, lClientRect.Bottom-1);
      aCanvas.LineTo(lClientRect.Left-1, lClientRect.Bottom-1);

   end;

  {draw the caption}
  InflateRect(lClientRect, -1, -1);
  aCanvas.TextRect(lClientRect, lClientRect.Left, lClientRect.Top, Caption);

end; {procedure, PaintDesignControl}


{------------------------------------------------------------------------------}
{ TppCustomRegion.SetBand }

procedure TppCustomRegion.SetBand(aBand: TppBand);
var
  liObject: Integer;

begin

  inherited SetBand(aBand);

  if csDestroying in ComponentState then Exit;

  {  if csReading in ComponentState then Exit;}
  
  for liObject := 0 to FObjects.Count - 1 do
    Objects[liObject].Band := aBand;

end; {function, SetBand}


{------------------------------------------------------------------------------}
{ TppCustomRegion.SetRegion }

procedure TppCustomRegion.SetRegion(aRegion: TppComponent);
begin
 {do nothing: regions cannot be assigned to regions }
end; {function, SetRegion}


{------------------------------------------------------------------------------}
{ TppCustomRegion.SetTransparent }

procedure TppCustomRegion.SetTransparent(Value: Boolean);
begin

  if Value and (FBrush.Style <> bsClear) then
    FBrush.Style := bsClear

  else if not Value and (FBrush.Style = bsClear) then
    FBrush.Style := bsSolid;

  inherited SetTransparent(Value);

end;


{------------------------------------------------------------------------------}
{ TppCustomRegion.CreatePopupMenu}

procedure TppCustomRegion.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'ParentWidth', '',  371);
  aPopupMenu.AddItem(30, 'ParentHeight', '',  370);
  aPopupMenu.AddItem(30, 'StretchWithParent', '',  244);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, TppCustomRegion}

{------------------------------------------------------------------------------}
{ TppCustomRegion.FreeLists }

procedure TppCustomRegion.FreeLists;
var
  liList: Integer;
begin

  for liList := 0 to FObjectLists.Count - 1 do
    TList(FObjectLists.Objects[liList]).Free;

  FStretchables := nil;
  FStretchers := nil;
  FShifters := nil;
  FStatics := nil;

  FObjectLists.Clear;

end; {procedure, FreeLists}

{------------------------------------------------------------------------------}
{ TppCustomRegion.RestoreFromCache }

procedure TppCustomRegion.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppRegionSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  OverFlow          := lRec.FOverFlow;
  ObjectIndex       := lRec.FObjectIndex;
  PartialGeneration := lRec.FPartialGeneration;

  ObjectListIndex   := lRec.FObjectListIndex;
  PartialAdjustment := lRec.FPartialAdjustment;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomRegion.SaveToCache }

procedure TppCustomRegion.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppRegionSaveRec;
begin

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FOverFlow          := OverFlow;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FObjectListIndex   := ObjectListIndex;
  lRec.FPartialAdjustment := PartialAdjustment;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomRegion.CategorizeObjects }

procedure TppCustomRegion.CategorizeObjects;
var
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;

  procedure AddObjectToList(var aList: TList; aObject: TObject; aListRank: Integer);
  begin

    if (aList = nil) then
      begin
        aList := TList.Create;

        FObjectLists.AddObject(IntToStr(aListRank), aList);
      end;

    aList.Add(lObject);

  end; {procedure, AddObjectToList}


begin

  {get number of objects}
  liObjects := ObjectCount;

  {categorize objects}
  for liObject := 0 to liObjects - 1 do
    begin
      lObject := Objects[liObject];

      {save object's z-order}
      lObject.ZOrder := liObject;

      if (lObject is TppStretchable) and (TppStretchable(lObject).ShiftRelativeTo = nil) then
        begin
          if TppStretchable(lObject).Stretch then
            AddObjectToList(FStretchables, lObject, 2)

          else if lObject.StretchWithParent then
            AddObjectToList(FStretchers, lObject, 3)

          else if lObject.ShiftWithParent then
            AddObjectToList(FShifters, lObject, 4)

          else
            AddObjectToList(FStatics, lObject, 1);
            
        end

      else if (lObject is TppCustomComponent) then
        begin

          if lObject.StretchWithParent then
            AddObjectToList(FStretchers, lObject, 3)

          else if lObject.ShiftWithParent then
            AddObjectToList(FShifters, lObject, 4)

          else
            AddObjectToList(FStatics, lObject, 1);

      end; {if, object is stretchable}
      
    end; {for, each object}

  FObjectLists.Sort;

end; {procedure, CategorizeObjects}

{------------------------------------------------------------------------------}
{ TppCustomRegion.Init }

procedure TppCustomRegion.Init;
var
  liIndex: Integer;
begin

  inherited Init;

  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].Init;
    
  {region dictates total print height}
  PartialAdjustment := mmHeight;

  FreeLists;

  CategorizeObjects;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppCustomRegion.RedrawOnOverFlow }

procedure TppCustomRegion.RedrawOnOverFlow;
var
  liObject: Integer;
begin
  inherited RedrawOnOverFlow;

  for liObject := 0 to FObjects.Count - 1 do
    Objects[liObject].DrawComponent := True;

end; {procedure, RedrawOnOverFlow}

{------------------------------------------------------------------------------}
{ TppCustomRegion.CalcSpaceUsed }

procedure TppCustomRegion.CalcSpaceUsed;
begin

  GenerateObjects(ObjectListIndex, ObjectIndex);

end; {procedure, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCustomRegion.PrintingSection }

function TppCustomRegion.PrintingSection: Boolean;
begin
  Result := (([esStartSection, esGenerateSection, esEndSection] * Band.Report.Engine.State) <> []);
end; {function, PrintingSection}

{------------------------------------------------------------------------------}
{ TppCustomRegion.GenerateObjects }

procedure TppCustomRegion.GenerateObjects(aListIndex, aObjectIndex: Integer);
var
  liListIndex: Integer;
  liLists: Integer;
  lList: TList;
  liObjectIndex: Integer;
begin

  {init printing properties}
  FMaxStretchable := nil;

  {generate any reprintonoverflow statics first}
  if OverFlow and not(PartialGeneration) and (FStatics <> nil) and (aListIndex <> 0) then
    ProcessQueue(FStatics, 0);

  {loop thru object lists, processing each one}
  liListIndex := aListIndex;
  liObjectIndex := aObjectIndex;

  liLists := FObjectLists.Count;

  while (liListIndex < liLists) do
    begin
      lList := TList(FObjectLists.Objects[liListIndex]);

      ProcessQueue(lList, liObjectIndex);

      if not(AllObjectsPrinted) and not(ObjectListSaved) then
        begin
          ObjectListSaved := True;
          ObjectListIndex := liListIndex;
        end;

      {go to next list}
      if not(PrintingSection) then
        begin
          Inc(liListIndex);

          liObjectIndex := 0;

          {if stretchables don't fit, we're done}
          if (FStretchables <> nil) and (lList = FStretchables) and (SpaceUsed = 0) then
            liListIndex := liLists;
        end
      else
        liListIndex := liLists;

      {let the app catch up}
      ProcessMessages;

    end; {while, each object list}

  {set overflow status}
  OverFlow := ObjectOverFlow;

  {set partial generation status}
  PartialGeneration := not(AllObjectsPrinted) and not(OverFlow);

  if (PartialGeneration) and (PrintQueue.Count = 0) then
    PartialAdjustment := 0

  else if not(PartialGeneration) then
    PartialAdjustment := mmHeight;

  {reset object indexes}
  if (AllObjectsPrinted) then
    begin
      ObjectListIndex := 0;
      ObjectIndex := 0;
    end;

  {set out of space status}
  if (PartialGeneration) then
    OverFlow := True;

end; {procedure, GenerateObjects}

{------------------------------------------------------------------------------}
{ TppCustomRegion.ProcessQueue }

procedure TppCustomRegion.ProcessQueue(aQueue: TList; aObjectIndex: Integer);
var
  liComponent: Integer;
  liComponents: Integer;
  lComponent: TppComponent;
  llCurrentPosition: Longint;
  llCheckPosition: Longint;
  llMaxStretchablePosition: Longint;
begin

  llCurrentPosition := CurrentPosition;

  llMaxStretchablePosition := 0;

  liComponents := aQueue.Count;

  liComponent := aObjectIndex;

  while liComponent < liComponents do
    begin
      lComponent := TppComponent(aQueue[liComponent]);

      lComponent.Generate;

      {add the object to the print queue}
      if (lComponent.SpaceUsed > 0) then
        PrintQueue.AddObject(Format('%8d', [lComponent.ZOrder]), lComponent);

      {indicate that object did not print completely}
      if not(lComponent.GenerationComplete) then
        begin

          {if this component was the first not to print, save it's position in the list}
          if not(ObjectSaved) then
            begin
              ObjectSaved := True;
              ObjectIndex := liComponent;

              if (lComponent is TppStretchable) and TppStretchable(lComponent).Stretch then
                ObjectOverFlow := True
              else
                ObjectOverFlow := False;
            end;

          if ((lComponent.mmTop - mmTop) < PartialAdjustment) then
            PartialAdjustment := lComponent.mmTop - mmTop;

          AllObjectsPrinted := False;
        end;

      {default max stretchable, whenever possible}
      if (lComponent is TppStretchable) and (FMaxStretchable = nil) then
        FMaxStretchable := TppStretchable(lComponent);

      if (ParentStretch and Stretch) and (lComponent.SpaceUsed > 0) then
        begin
          llCheckPosition := lComponent.PrintPosRect.Top + lComponent.SpaceUsed;

          {update the band's spaceused and currentposition}
          if (llCheckPosition > llCurrentPosition) then
            begin
              llCurrentPosition := llCheckPosition;

              {assign new max stretchable, based on max stretchable position}
              if (lComponent is TppStretchable) and (llCheckPosition > llMaxStretchablePosition) then
                begin
                  FMaxStretchable := TppStretchable(lComponent);
                  llMaxStretchablePosition := llCheckPosition;
                end;
            end;
        end;

      {go to next component}
      if not(PrintingSection) then
        Inc(liComponent)
      else
        begin
          if not(lComponent.GenerationComplete) and (liComponent <> (liComponents - 1)) then
            begin
              liComponent := liComponents;

              GenerationComplete := True;
            end
          else
            Inc(liComponent);
        end;

      {let the app catch up}
      ProcessMessages;

    end; {while, each object}

  if (llCurrentPosition > CurrentPosition) then
    begin
      CurrentPosition := llCurrentPosition;
      SpaceUsed := CurrentPosition - PrintPosRect.Top;
    end;

end; {procedure, ProcessQueue}

{------------------------------------------------------------------------------}
{ TppCustomRegion.PropertiesToDrawCommand }

procedure TppCustomRegion.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawShape;
  llSide: Longint;
  llXCornerRound: Longint;
  llYCornerRound: Longint;
  llHeight: Longint;
  llWidth: Longint;
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawShape) then Exit;

  lDrawCommand := TppDrawShape(aDrawCommand);

  llLeft   := PrintPosRect.Left;
  llTop    := PrintPosRect.Top;
  llHeight := PrintPosRect.Bottom - PrintPosRect.Top;
  llWidth  := PrintPosRect.Right - PrintPosRect.Left;

  {calculate position of shape on canvas}
  llLeft   := llLeft + (FPen.Width div 2);
  llTop    := llTop + (FPen.Width div 2);
  llRight  := (llLeft + llWidth) - ((FPen.Width div 2) * 2);
  llBottom := (llTop + llHeight) - ((FPen.Width div 2) * 2);

  {determine length of the shortest side, use for circles, squares and corner rounding}
  if (llWidth < llHeight) then
    llSide := llWidth
  else
    llSide := llHeight;

  {if shape is square or circle, make 'sides' of shape equal}
  if FShapeType in [stSquare, stRoundSquare, stCircle] then
    begin

      {recalc top & left drawing positions based on centered side}
      Inc(llLeft, (llWidth  - llSide) div 2);
      Inc(llTop,  (llHeight - llSide) div 2);

      {set width and height to side}
      Dec(llRight, (llWidth  - llSide) div 2);
      Dec(llBottom,  (llHeight - llSide) div 2);
    end; {if shape has equal 'sides'}

  {use integer division to calc corner rounding}
  llXCornerRound := llSide div 4;
  llYCornerRound := llSide div 4;

  {transfer properties to draw command}
  lDrawCommand.Brush        := FBrush;
  lDrawCommand.Pen          := FPen;
  lDrawCommand.Left         := llLeft;
  lDrawCommand.Top          := llTop;
  lDrawCommand.Height       := llBottom - llTop;
  lDrawCommand.Width        := llRight - llLeft;
  lDrawCommand.ShapeType    := FShapeType;
  lDrawCommand.XCornerRound := llXCornerRound;
  lDrawCommand.YCornerRound := llYCornerRound;

  {set draw command type}
  if (FShapeType = stSquare) then
    lDrawCommand.ShapeType := stRectangle

  else if (FShapeType = stCircle) then
    lDrawCommand.ShapeType := stEllipse

  else if (FShapeType = stRoundSquare) then
    lDrawCommand.ShapeType := stRoundRect;

end; {procedure, PropertiesToDrawCommand}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppCustomRegion.GetChildren - write report controls as subcomponents to .DFM }

{$IFDEF Delphi3}
   procedure TppCustomRegion.GetChildren(Proc: TGetChildProc; Root: TComponent);
{$ELSE}
   procedure TppCustomRegion.GetChildren(Proc: TGetChildProc);
{$ENDIF}

var
  liObject: Integer;

begin

  for liObject := 0 to FObjects.Count - 1 do
     Proc(Objects[liObject]);

end;

{$ELSE}


{------------------------------------------------------------------------------}
{ TppCustomRegion.WriteComponents}

procedure TppCustomRegion.WriteComponents(Writer: TWriter);
var
  liObject: Integer;
  lComponent: TppComponent;

begin

  for liObject := 0 to FObjects.Count - 1 do
    begin

      lComponent := FObjects.Items[liObject];

      if lComponent.Owner = Writer.Root then
        Writer.WriteComponent(lComponent);

    end;

end; {procedure, WriteComponents}


{$ENDIF}

{******************************************************************************
 *
 **  R E G I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRegion.Create }

constructor TppRegion.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end;


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
 ** C U S T O M   R E G I O N   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.RefClass }

class function TraTppCustomRegionRTTI.RefClass: TClass;
begin
  Result := TppCustomRegion;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.GetPropList }

class procedure TraTppCustomRegionRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.GetPropRec }

class function TraTppCustomRegionRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    ClassPropToRec(aPropName, TBrush, False, aPropRec)

  else if (CompareText(aPropName, 'ObjectCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Objects') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'MaxStretchable') = 0) then
    ClassPropToRec(aPropName, TppStretchable, True, aPropRec)

  else if (CompareText(aPropName, 'ParentWidth') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Pen') = 0) then
    ClassPropToRec(aPropName, TPen, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.GetParams }

class function TraTppCustomRegionRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'Objects') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppComponent, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.CallMethod }

class function TraTppCustomRegionRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lRegion: TppCustomRegion;
  liIndex: Integer;
  lComponent: TppComponent;
begin

  Result := True;
  
  lRegion := TppCustomRegion(aObject);

  if (CompareText(aMethodName, 'Objects') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lComponent := lRegion.Objects[liIndex];

      aParams.SetParamValue(1, Integer(lComponent));
    end
    
  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.GetPropValue }

class function TraTppCustomRegionRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    Integer(aValue) := Integer(TppCustomRegion(aObject).Brush)

  else if (CompareText(aPropName, 'ObjectCount') = 0) then
    Integer(aValue) := TppCustomRegion(aObject).ObjectCount

  else if (CompareText(aPropName, 'MaxStretchable') = 0) then
    Integer(aValue) := Integer(TppCustomRegion(aObject).MaxStretchable)

  else if (CompareText(aPropName, 'ParentWidth') = 0) then
    Boolean(aValue) := TppCustomRegion(aObject).ParentWidth

  else if (CompareText(aPropName, 'Pen') = 0) then
    Integer(aValue) := Integer(TppCustomRegion(aObject).Pen)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomRegionRTTI.SetPropValue }

class function TraTppCustomRegionRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    TppCustomRegion(aObject).Brush := TBrush(aValue)

  else if (CompareText(aPropName, 'Pen') = 0) then
    TppCustomRegion(aObject).Pen := TPen(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppCustomRegionRTTI);

finalization

  raUnRegisterRTTI(TraTppCustomRegionRTTI);

end.
