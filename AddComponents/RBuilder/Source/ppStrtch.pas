{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppStrtch;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Controls, Forms, Menus,
  ppComm, ppClass, ppDevice, ppForms, ppTypes, ppUtils, ppDsgnCt,
  ppRTTI;

type

  { TppStretchable }
  TppStretchable = class(TppComponent)
    private
      {property variables}
      FBottomOffset: Longint;
      FKeepTogether: Boolean;
      FKeptTogether: Boolean;
      FOverFlowOffset: Longint;
      FShifters: TList;
      FShiftRelativeTo: TppStretchable;
      FStopPosition: Longint;
      FStretch: Boolean;

      {report generation variables}
      FAllObjectsPrinted: Boolean;
      FCurrentPosition: Longint;
      FDrawShifter: Boolean;
      FObjectListIndex: Integer;
      FObjectListSaved: Boolean;
      FObjectIndex: Integer;
      FObjectOverFlow: Boolean;
      FObjectSaved: Boolean;
      FPageBottom: Longint;
      FPartialAdjustment: Longint;
      FPartialGeneration: Boolean;
      FPrintQueue: TStrings;

      function  CalcPrintHeight(aTop: Longint): Longint;
      function  CalcPrintLeft: Longint;
      function  CalcPrintTop: Longint;
      procedure CalcPrintPosition;
      function  DisplayShiftDialog(aCurrentComponent: TppComponent; var aNewComponent: TppComponent): Boolean;
      procedure GenerateObjects(aListIndex, aObjectIndex: Integer);
      function  GetBottomOffset: Single;
      function  GetOverFlowOffset: Single;
      function  GetShiftRelativeTo: TppStretchable;
      function  GetShifterCount: Integer;
      function  GetStopPosition: Single;
      function  ParentOverFlow: Boolean;
      procedure ProcessQueue(aQueue: TList; aObjectIndex: Integer);
      procedure SetBottomOffset(Value: Single);
      procedure SetKeepTogether(Value: Boolean);
      procedure SetOverFlowOffset(Value: Single);
      procedure SetShiftRelativeTo(aStretchable: TppStretchable);
      procedure SetStopPosition(Value: Single);
      procedure SetStretch(Value: Boolean);

      {read/write private 'fake' properties}
      procedure ReadBottomOffset(Reader: TReader);
      procedure ReadOverFlowOffset(Reader: TReader);
      procedure ReadStopPosition(Reader: TReader);
      procedure WriteBottomOffset(Writer: TWriter);
      procedure WriteOverFlowOffset(Writer: TWriter);
      procedure WriteStopPosition(Writer: TWriter);

    protected
      {overriden from TComponent}
      procedure DefineProperties(Filer: TFiler); override;

      procedure BoundsChange; override;
      procedure CalcSpaceUsed; virtual;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDescription: String; override;
      function  ParentStretch: Boolean;
      function  PrintStretch: Boolean;
      procedure SetUserName(const Value: TComponentName); override;
      procedure SetRegion(aRegion: TppComponent); override;
      procedure SetReprintOnOverFlow(Value: Boolean); override;
      procedure SetShiftWithParent(Value: Boolean); override;
      procedure SetStretchWithParent(Value: Boolean); override;

      {popup menu event handlers}
      function  CreatePositionDialog: TppCustomPositionDialog; override;
      procedure PositionChange(Sender: TObject); override;
      procedure ReprintOnOverFlowMenuClick(Sender: TObject);
      procedure ShiftWithParentMenuClick(Sender: TObject);
      procedure ShiftRelativeToMenuClick(Sender: TObject);
      procedure StretchMenuClick(Sender: TObject);
      procedure StretchWithParentMenuClick(Sender: TObject);
      procedure TransparentMenuClick(Sender: TObject);
      procedure VisibleMenuClick(Sender: TObject);

      property BottomOffset: Single read GetBottomOffset write SetBottomOffset stored False;
      property OverFlowOffset: Single read GetOverFlowOffset write SetOverFlowOffset stored False;
      property StopPosition: Single read GetStopPosition write SetStopPosition stored False;

      {report generation properties}
      property AllObjectsPrinted: Boolean read FAllObjectsPrinted write FAllObjectsPrinted;
      property DrawShifter: Boolean read FDrawShifter write FDrawShifter;
      property ObjectIndex: Integer read FObjectIndex write FObjectIndex;
      property ObjectListIndex: Integer read FObjectListIndex write FObjectListIndex;
      property ObjectListSaved: Boolean read FObjectListSaved write FObjectListSaved;
      property ObjectOverFlow: Boolean read FObjectOverFlow write FObjectOverFlow;
      property ObjectSaved: Boolean read FObjectSaved write FObjectSaved;
      property PrintQueue: TStrings read FPrintQueue write FPrintQueue;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure AddShifter(aStretchable: TppStretchable); virtual;
      procedure AfterPrint; override;
      procedure BeforePrint; override;
      procedure Generate; override;
      function  GetChainTop: Longint;
      procedure Init; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure Print(aPage: TppPage); override;
      procedure RemoveShifter(aStretchable: TppStretchable); virtual;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      property CurrentPosition: Longint read FCurrentPosition write FCurrentPosition;
      property mmOverFlowOffset: Longint read FOverFlowOffset;
      property mmBottomOffset: Longint read FBottomOffset;
      property KeepTogether: Boolean read FKeepTogether write SetKeepTogether default False;
      property KeptTogether: Boolean read FKeptTogether write FKeptTogether;
      property PageBottom: Longint read FPageBottom write FPageBottom;
      property PartialAdjustment: Longint read FPartialAdjustment write FPartialAdjustment;
      property PartialGeneration: Boolean read FPartialGeneration write FPartialGeneration;
      property ShifterCount: Integer read GetShifterCount;
      property ShiftRelativeTo: TppStretchable read GetShiftRelativeTo write SetShiftRelativeTo;
      property mmStopPosition: Longint read FStopPosition;
      property Stretch: Boolean read FStretch write SetStretch default False;

    published

  end; {class, TppStretchable }


  { TraTppStretchableRTTI }
  TraTppStretchableRTTI = class(TraTppComponentRTTI)
    public
      {class procedure GetPropList(aPropList: TraPropList); override;}
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      {class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList): Boolean; override;}
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppStretchableRTTI}


implementation

uses ppBands, ppCtrls, ppRegion, ppClasUt, ppSubRpt;



{******************************************************************************
 *
 ** S T R E T C H A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppStretchable.Create }

constructor TppStretchable.Create(aOwner: TComponent);
begin

  inherited Create(AOwner);

  CacheRecordSize  := SizeOf(TppCustomComponentSaveRec);

  {properties}
  FBottomOffset := 0;
  FKeepTogether := False;
  FKeptTogether := False;
  FOverFlowOffset := 0;
  FShiftRelativeTo := nil;
  FShifters := TList.Create;
  FStopPosition := 0;
  FStretch := False;

  {print processing}
  FAllObjectsPrinted := False;
  FCurrentPosition := 0;
  FDrawShifter := False;
  FObjectListIndex := 0;
  FObjectListSaved := False;
  FObjectIndex := 0;
  FObjectOverFlow := False;
  FObjectSaved := False;
  FPageBottom := 0;
  FPartialAdjustment := 0;
  FPartialGeneration := False;
  FPrintQueue := TStringList.Create;

  {init inherited properties}
  AutoSize    := False;
  spHeight    := 89;
  spWidth     := 185;
  WordWrap    := False;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppStretchable.Destroy }

destructor TppStretchable.Destroy;
begin

  FPrintQueue.Free;
  FShifters.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppStretchable.ParentStretch }

function TppStretchable.ParentStretch: Boolean;
begin
  if (Parent is TppBand) then
    Result := (Band.PrintHeight = phDynamic)
  else
    Result := TppCustomRegion(Parent).Stretch and (Band.PrintHeight = phDynamic);
end; {function, ParentStretch}

{------------------------------------------------------------------------------}
{ TppStretchable.PrintStretch }

function TppStretchable.PrintStretch: Boolean;
begin
  Result := (ParentStretch and Stretch) or (StopPosition <> 0);
end; {function, PrintStretch}

{------------------------------------------------------------------------------}
{ TppStretchable.CalcSpaceUsed }

procedure TppStretchable.CalcSpaceUsed;
begin

end; {procedure, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppStretchable.SetUserName }

procedure TppStretchable.SetUserName(const Value: TComponentName);
var
  lsOldName : String;

begin

  lsOldName := UserName;

  inherited SetUserName(Value);

  {the Value may be invalid }
  if (lsOldName = UserName) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) and
     not (pppcPasting in DesignState) then Exit;

  {on name change, also change caption if it is the same as the name}
  if (Caption = '') or (Caption = lsOldName) then
    Caption := Value;

end; {procedure, SetUserName}

{------------------------------------------------------------------------------}
{ TppStretchable.SetRegion }

procedure TppStretchable.SetRegion(aRegion: TppComponent);
begin

  if (aRegion <> nil) and not (aRegion is TppRegion) then Exit;


  inherited SetRegion(aRegion);

  if (FShiftRelativeTo <> nil) then
    SetShiftRelativeTo(nil);

  {do not allow region to be set to ShiftRelativeTo self}
  if (aRegion <> nil) and (TppRegion(aRegion).ShiftRelativeTo = Self) then
    TppRegion(aRegion).ShiftRelativeTo := nil;

end; {procedure, SetRegion}

{------------------------------------------------------------------------------}
{ TppStretchable.Notify}

procedure TppStretchable.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) then
    if (aCommunicator = FShiftRelativeTo) then
      FShiftRelativeTo := nil

    else if (FShifters.IndexOf(aCommunicator) <> -1) then
      FShifters.Remove(aCommunicator);

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppStretchable.BoundsChange }

procedure TppStretchable.BoundsChange;
begin
  inherited BoundsChange;

  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  if (Band = nil) or (DesignControl = nil) then Exit;

  {note: if reading or loading and not pasting}
  if ((csReading in ComponentState) or (csLoading in ComponentState)) and (DesignControl = nil) then Exit;

  {notify report designer}
  if (Stretch) then
    Reset;

end; {procedure, BoundsChange}

{------------------------------------------------------------------------------}
{ TppStretchable.GetDescription }

function TppStretchable.GetDescription: String;
begin
  Result := UserName;
end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TppStretchable.ShiftRelativeToMenuClick }

procedure TppStretchable.ShiftRelativeToMenuClick(Sender: TObject);
var
  lSelectedComponent: TppComponent;
begin

  if DisplayShiftDialog(GetShiftRelativeTo, lSelectedComponent) then
    SetShiftRelativeTo(TppStretchable(lSelectedComponent));

end; {procedure, ShiftRelativeToMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.DisplayShiftDialog }

function TppStretchable.DisplayShiftDialog(aCurrentComponent: TppComponent; var aNewComponent: TppComponent): Boolean;
var
  lShiftDlg: TppCustomShiftDialog;
  lFormClass: TFormClass;
  llIndex: Longint;
  lbFullDesc: Boolean;
  lList: TStrings;
begin
  Result := False;

  llIndex := LanguageIndex;

  lFormClass := ppGetFormClass(TppCustomShiftDialog);
  lShiftDlg := TppCustomShiftDialog(lFormClass.Create(Application));
  lShiftDlg.LanguageIndex := llIndex;

  {get list of stretchable components}
  lbFullDesc := True;
  lList := lShiftDlg.SelectionList;

  ppGetStretchableComponents(Self, lList, lbFullDesc);

  {add '<None>' as first choice}
  lList.Insert(0, ppLoadStr(343));

  if (aCurrentComponent <> nil) then
    lShiftDlg.SelectedComponent := aCurrentComponent.UserName
  else
    lShiftDlg.SelectedComponent := ppLoadStr(343);


  {set property}
  if (lShiftDlg.ShowModal = mrOK) then
    begin
      aNewComponent := TppComponent(Band.Report.FindUserObject(lShiftDlg.SelectedComponent));

      Result := True;
    end;

  lShiftDlg.Release;

end; {procedure, DisplayShiftDialog}

{------------------------------------------------------------------------------}
{ TppStretchable.DefineProperties }

procedure TppStretchable.DefineProperties(Filer: TFiler);
var
  lAncestor: TppStretchable;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}
  if (Filer.Ancestor is TppStretchable) then
    lAncestor := TppStretchable(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}
  lAncestor := nil;
{$ENDIF}

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmBottomOffset', ReadBottomOffset, WriteBottomOffset, FBottomOffset <> lAncestor.FBottomOffset);
      Filer.DefineProperty('mmOverFlowOffset', ReadOverFlowOffset, WriteOverFlowOffset,
                                      FOverFlowOffset <> lAncestor.FOverFlowOffset);
      Filer.DefineProperty('mmStopPosition', ReadStopPosition, WriteStopPosition,
                                      FStopPosition <> lAncestor.FStopPosition);
    end
  else
    begin
      Filer.DefineProperty('mmBottomOffset', ReadBottomOffset, WriteBottomOffset, True);
      Filer.DefineProperty('mmOverFlowOffset', ReadOverFlowOffset, WriteOverFlowOffset, True);
      Filer.DefineProperty('mmStopPosition', ReadStopPosition, WriteStopPosition, True);
    end;

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppStretchable.ReadBottomOffset }

procedure TppStretchable.ReadBottomOffset(Reader: TReader);
begin
  FBottomOffset := ppReadIntegerPropValue(Reader);
end; {procedure, ReadBottomOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.WriteBottomOffset }

procedure TppStretchable.WriteBottomOffset(Writer: TWriter);
begin
  Writer.WriteInteger(FBottomOffset);
end; {procedure, WriteBottomOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.ReadOverFlowOffset }

procedure TppStretchable.ReadOverFlowOffset(Reader: TReader);
begin
  FOverFlowOffset := ppReadIntegerPropValue(Reader);
end; {procedure, ReadOverFlowOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.WriteOverFlowOffset }

procedure TppStretchable.WriteOverFlowOffset(Writer: TWriter);
begin
  Writer.WriteInteger(FOverFlowOffset);
end; {procedure, WriteOverFlowOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.ReadStopPosition }

procedure TppStretchable.ReadStopPosition(Reader: TReader);
begin
  FStopPosition := ppReadIntegerPropValue(Reader);
end; {procedure, ReadStopPosition}

{------------------------------------------------------------------------------}
{ TppStretchable.WriteStopPosition }

procedure TppStretchable.WriteStopPosition(Writer: TWriter);
begin
  Writer.WriteInteger(FStopPosition);
end; {procedure, WriteStopPosition}

{------------------------------------------------------------------------------}
{ TppStretchable.GetBottomOffset }

function TppStretchable.GetBottomOffset: Single;
begin
  Result := ppFromMMThousandths(FBottomOffset, Units, pprtVertical, GetPrinter)
end; {procedure, GetBottomOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.SetBottomOffset }

procedure TppStretchable.SetBottomOffset(Value: Single);
begin

  FBottomOffset := ppToMMThousandths(Value, Units, pprtVertical, GetPrinter);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetBottomOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.GetOverFlowOffset }

function TppStretchable.GetOverFlowOffset: Single;
begin
  Result := ppFromMMThousandths(FOverFlowOffset, Units, pprtVertical, GetPrinter)
end; {procedure, GetOverFlowOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.SetOverFlowOffset }

procedure TppStretchable.SetOverFlowOffset(Value: Single);
begin

  FOverFlowOffset := ppToMMThousandths(Value, Units, pprtVertical, GetPrinter);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetOverFlowOffset}

{------------------------------------------------------------------------------}
{ TppStretchable.GetStopPosition }

function TppStretchable.GetStopPosition: Single;
begin
  Result := ppFromMMThousandths(FStopPosition, Units, pprtVertical, GetPrinter)
end; {procedure, GetStopPosition}

{------------------------------------------------------------------------------}
{ TppStretchable.SetStopPosition }

procedure TppStretchable.SetStopPosition(Value: Single);
begin

  FStopPosition := ppToMMThousandths(Value, Units, pprtVertical, GetPrinter);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetStopPosition}

{------------------------------------------------------------------------------}
{ TppStretchable.SetKeepTogether }

procedure TppStretchable.SetKeepTogether(Value: Boolean);
begin

  FKeepTogether := Value;

  Reset;

  PropertyChange;

end; {procedure, SetKeepTogether}

{------------------------------------------------------------------------------}
{ TppStretchable.SetReprintOnOverFlow }

procedure TppStretchable.SetReprintOnOverFlow(Value: Boolean);
begin

  inherited SetReprintOnOverFlow(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (ReprintOnOverFlow) then
    begin
      SetShiftRelativeTo(nil);
      SetStretch(False);
    end;

end; {procedure, SetReprintOnOverFlow}

{------------------------------------------------------------------------------}
{ TppStretchable.SetShiftWithParent }

procedure TppStretchable.SetShiftWithParent(Value: Boolean);
begin

  inherited SetShiftWithParent(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (ShiftWithParent) then
    begin
      SetShiftRelativeTo(nil);
      SetStretch(False);
    end;

end; {procedure, SetShiftWithParent}


{------------------------------------------------------------------------------}
{ TppStretchable.SetStretchWithParent }

procedure TppStretchable.SetStretchWithParent(Value: Boolean);
begin

  inherited SetStretchWithParent(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (StretchWithParent) then
    begin
      SetShiftRelativeTo(nil);
      SetStretch(False);
    end;

end; {procedure, SetStretchWithParent}

{------------------------------------------------------------------------------}
{ TppStretchable.SetStretch }

procedure TppStretchable.SetStretch(Value: Boolean);
begin
  FStretch := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if FStretch then
    begin
      SetReprintOnOverFlow(False);
      SetShiftWithParent(False);
      SetStretchWithParent(False);

      {tell parent to stretch also}
      if (Region <> nil) and not TppRegion(Region).Stretch then
        TppRegion(Region).Stretch := True

      else if (Band <> nil) and (Band.PrintHeight = phStatic) then
        Band.PrintHeight := phDynamic;
    end
    
  else if (FShifters.Count > 0) then
    begin
      {if Shifter, then must also stretch}
      FStretch := True;
      Exit;
    end;

  Reset;

  PropertyChange;

end; {procedure, SetStretch}

{------------------------------------------------------------------------------}
{ TppStretchable.SetShiftRelativeTo }

procedure TppStretchable.SetShiftRelativeTo(aStretchable: TppStretchable);
begin

  if (FShiftRelativeTo <> aStretchable) then
    begin

     {make sure stretchable does not form cyclic chain}
     if not(ppIsValidStretchable(Self, aStretchable)) then
       raise EInvalidPropertyError.Create(ppLoadStr(342));

     if FShiftRelativeTo <> nil then
       FShiftRelativeTo.RemoveShifter(Self);

      FShiftRelativeTo := aStretchable;

      {notify designer}
      PropertyChange;

      {notify report engine}
      Reset;

      if FShiftRelativeTo <> nil then
        begin
          FShiftRelativeTo.AddShifter(Self);

          SetReprintOnOverFlow(False);
          SetShiftWithParent(False);
          SetStretchWithParent(False);

        end;

    end;

end; {procedure, SetShiftRelativeTo}

{------------------------------------------------------------------------------}
{ TppStretchable.AddShifter }

procedure TppStretchable.AddShifter(aStretchable: TppStretchable);
begin

  FShifters.Add(aStretchable);

  {if Shifter, then must also stretch}
  if not Stretch then
    SetStretch(True);

  {add component to notify list}
  AddNotify(aStretchable);

end; {procedure, AddShifter}

{------------------------------------------------------------------------------}
{ TppStretchable.RemoveShifter }

procedure TppStretchable.RemoveShifter(aStretchable: TppStretchable);
begin
  FShifters.Remove(aStretchable);

  {remove component from notify list}
  RemoveNotify(aStretchable);

end; {procedure, RemoveShifter}

{------------------------------------------------------------------------------}
{ TppStretchable.GetShifterCount }

function TppStretchable.GetShifterCount: Integer;
begin
  Result := FShifters.Count;
end; {function, GetShifterCount}

{------------------------------------------------------------------------------}
{ TppStretchable.GetShiftRelativeTo }

function TppStretchable.GetShiftRelativeTo: TppStretchable;
begin
  Result := FShiftRelativeTo;

  if csWriting in ComponentState then Exit;

  {make sure ShiftRelativeTo exists in this band}
  if (FShiftRelativeTo <> nil) and (Band.FindObject(FShiftRelativeTo) = -1) then
    SetShiftRelativeTo(nil);

  Result := FShiftRelativeTo;

end; {function, GetShiftRelativeTo}

{------------------------------------------------------------------------------}
{ TppStretchable.ParentOverFlow }

function TppStretchable.ParentOverFlow: Boolean;
begin
  if (Parent is TppBand) then
    Result := TppCustomBand(Parent).OverFlow
  else
    Result := TppCustomRegion(Parent).OverFlow;
end; {function, ParentOverFlow}

{------------------------------------------------------------------------------}
{ TppStretchable.RestoreFromCache }

procedure TppStretchable.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppStretchableSaveRec;

begin
  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppStretchable.SaveToCache }

procedure TppStretchable.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppStretchableSaveRec;
begin

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppStretchable.Init }

procedure TppStretchable.Init;
begin

  inherited Init;

  FDrawShifter       := False;
  FKeptTogether      := (ShiftRelativeTo = nil);
  FObjectListIndex   := 0;
  FObjectIndex       := 0;
  FPartialAdjustment := 0;
  FPartialGeneration := False;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppStretchable.BeforePrint }

procedure TppStretchable.BeforePrint;
begin
  inherited BeforePrint;

  {init printing properties}
  FAllObjectsPrinted := True;
  FCurrentPosition := 0;
  FObjectListSaved := False;
  FObjectSaved := False;
  FObjectOverFlow := False;
  FPageBottom := 0;
  FPrintQueue.Clear;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppStretchable.AfterPrint }

procedure TppStretchable.AfterPrint;
begin

  inherited AfterPrint;

  {turn drawcomponent off if reached shifters}
  if (DrawComponent) and (FDrawShifter) then
    DrawComponent := False;

  {reset draw shifter}
  if (FDrawShifter) and not(OverFlow) and not(FPartialGeneration) then
    FDrawShifter := False;

  {reset object index}
  if (FAllObjectsPrinted) then
    FObjectIndex := 0;

end; {procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppStretchable.Generate }

procedure TppStretchable.Generate;
var
  liIndex: Integer;
begin

  {reset draw component, for reprintonoverflow}
  if ReprintOnOverFlow and (ParentOverFlow) then
    RedrawOnOverFlow;

  {fire OnPrint event}
  DoOnPrint;

  {calc the print position}
  CalcPrintPosition;

  if (OutOfSpace) then Exit;

  if (DrawComponent) and not(OverFlow) and not(FDrawShifter) then
    begin
      FDrawShifter := True;

      for liIndex := 0 to FShifters.Count - 1 do
        TppStretchable(FShifters[liIndex]).DrawComponent := True;
    end;

  {allow stretchable shiftrelativeto's to generate}
  if (FDrawShifter) then
    GenerateObjects(0, FObjectIndex);

  if not(OverFlow) and not(FPartialGeneration) then
    GenerationComplete := True;

end; {procedure, Generate}

{------------------------------------------------------------------------------}
{ TppStretchable.CalcPrintPosition }

procedure TppStretchable.CalcPrintPosition;
var
  llNewLeft: Longint;
  llNewTop: Longint;
  llNewHeight: Longint;
  lRect: TppRect;
begin

  llNewLeft := CalcPrintLeft;
  llNewTop := CalcPrintTop;
  llNewHeight := CalcPrintHeight(llNewTop);

  {set the initial print position}
  if PrintStretch then
    begin
      lRect.Left   := llNewLeft;
      lRect.Top    := llNewTop;
      lRect.Right  := lRect.Left + mmWidth;
      lRect.Bottom := FPageBottom;
    end
  else
    begin
      lRect.Left   := llNewLeft;
      lRect.Top    := llNewTop;
      lRect.Right  := lRect.Left + mmWidth;
      lRect.Bottom := lRect.Top + llNewHeight;
    end;

  PrintPosRect := lRect;

  {if potential new height doesn't fit, we're outta here}
  if DrawComponent and Visible then
    begin

      if ((llNewTop + llNewHeight) > (FPageBottom + 1)) then
        begin
          OutOfSpace := True;

          Exit;
        end;
        
    end;

  {calc space used}
  if DrawComponent and Visible then
    begin

      {calc default space used}
      if not(PrintStretch) then
        SpaceUsed := llNewHeight;

      {allow component to calculate space used}
      CalcSpaceUsed;
    end;

  {update print position based on space used}
  lRect.Left   := PrintPosRect.Left;
  lRect.Top    := PrintPosRect.Top;
  lRect.Right  := PrintPosRect.Right;
  lRect.Bottom := PrintPosRect.Top + SpaceUsed;

  PrintPosRect := lRect;

  {increment space used for bottom offset}
  if DrawComponent and Visible then
    begin
      if (SpaceUsed > 0) then
        SpaceUsed := SpaceUsed + mmBottomOffset;
    end;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppStretchable.CalcPrintLeft }

function TppStretchable.CalcPrintLeft: Longint;
var
  lBand: TppCustomBand;
begin

  lBand := TppCustomBand(Band);

  if DrawComponent and Visible then
    Result := lBand.PrintPosRect.Left + mmLeft

  else
    Result := lBand.PrintPosRect.Left;

end; {procedure, CalcPrintLeft}

{------------------------------------------------------------------------------}
{ TppStretchable.CalcPrintHeight }

function TppStretchable.CalcPrintHeight(aTop: Longint): Longint;
var
  llNewHeight: Longint;
  llCurrentPosition: Longint;
begin

  llNewHeight := 0;

  Result := llNewHeight;

  if not(DrawComponent and Visible) then Exit;

  {calculate potential new height}
  if (PrintStretch) then
    llNewHeight := 0
  else
    llNewHeight := mmHeight;

  {adjust height if stretching with parent}
  if (StretchWithParent) then
    begin

      {get current position}
      if Parent is TppBand then
        llCurrentPosition := TppCustomBand(Parent).CurrentPosition
      else
        llCurrentPosition := TppCustomRegion(Parent).CurrentPosition;

      if (aTop < llCurrentPosition) then
        llNewHeight := llCurrentPosition - aTop;

      {if stretched beyond page, adjust stretch}
      if (aTop < FPageBottom) and ((aTop + llNewHeight) > FPageBottom) then
        llNewHeight := FPageBottom - aTop;

    end;

  Result := llNewHeight;

end; {procedure, CalcPrintHeight}

{------------------------------------------------------------------------------}
{ TppStretchable.CalcPrintTop }

function TppStretchable.CalcPrintTop: Longint;
var
  lBand: TppCustomBand;
  lRegion: TppCustomRegion;
  llNewTop: Longint;
  llRelativeTop: Longint;
  lMaxStretchable: TppStretchable;
  llChange: Longint;
  lbPartialGeneration: Boolean;
  llPartialAdjustment: Longint;
  llPageBottom: Longint;
  llCurrentPosition: Longint;
  lShiftRelativeTo: TppStretchable;
begin

  lBand := TppCustomBand(Band);

  {calc max stretchable and change in parent height}
  llChange := 0;
  lMaxStretchable := nil;

  lShiftRelativeTo := GetShiftRelativeTo;

  {determine parent's position and state}
  if (lShiftRelativeTo <> nil) then
    begin
      llCurrentPosition := lShiftRelativeTo.CurrentPosition;
      llPageBottom := lShiftRelativeTo.PageBottom;
      lbPartialGeneration := False;
      llPartialAdjustment := 0;

      llNewTop := llCurrentPosition;
    end

  else if Parent is TppBand then
    begin
      {llCurrentPosition := lBand.PrintPosRect.Top;}
      llCurrentPosition := lBand.CurrentPosition;
      llPageBottom := lBand.PageBottom;
      lbPartialGeneration := lBand.PartialGeneration;
      llPartialAdjustment := lBand.PartialAdjustment;

      llNewTop := lBand.PrintPosRect.Top + mmTop;

      if (lBand.SpaceUsed > 0) then
        begin
          lMaxStretchable := lBand.MaxStretchable;
          llChange := lBand.SpaceUsed - lBand.mmHeight;
        end;

    end

  else
    begin
      lRegion := TppCustomRegion(Parent);

      llCurrentPosition := lRegion.CurrentPosition;
      {llCurrentPosition := lRegion.PrintPosRect.Top;}
      llPageBottom := lRegion.PageBottom;
      lbPartialGeneration := lRegion.PartialGeneration;
      llPartialAdjustment := lRegion.PartialAdjustment;

      llNewTop := lRegion.PrintPosRect.Top + (mmTop - lRegion.mmTop);

      if (lRegion.SpaceUsed > 0) then
        begin
          lMaxStretchable := lRegion.MaxStretchable;
          llChange := lRegion.SpaceUsed - lRegion.mmHeight;
        end;

    end;

  {adjust top for special conditions}
  if lbPartialGeneration then
    llNewTop := llNewTop - llPartialAdjustment

  else if OverFlow and (FStopPosition = 0) then
    begin
      llNewTop := llCurrentPosition;

      {increment the top for the overflow offset}
      if (lShiftRelativeTo = nil) then
         llNewTop := llNewTop + FOverFlowOffset;
    end

  else if (ShiftWithParent) and (ShiftRelativeTo = nil) then
    begin

      {adjust top if shifting with parent}
      if (lMaxStretchable <> nil) then
        begin
          llRelativeTop := mmTop - (lMaxStretchable.mmTop + lMaxStretchable.mmHeight);

          llNewTop := lMaxStretchable.PrintPosRect.Top + lMaxStretchable.SpaceUsed + llRelativeTop;
        end

      else
        llNewTop := llNewTop + llChange;

    end;

  Result := llNewTop;

  {update current position and page bottom}
  FCurrentPosition := llNewTop;

  if (FStopPosition <> 0) and (FStopPosition < llPageBottom) then
    FPageBottom := FStopPosition - mmBottomOffset
  else
    FPageBottom := llPageBottom - mmBottomOffset;

end; {procedure, CalcPrintTop}

{------------------------------------------------------------------------------}
{ TppStretchable.GenerateObjects }

procedure TppStretchable.GenerateObjects(aListIndex, aObjectIndex: Integer);
begin

  {update current position}
  FCurrentPosition := PrintPosRect.Top + SpaceUsed;
  FPageBottom := FPageBottom + mmBottomOffset;

  {loop thru objects, processing each one}
  ProcessQueue(FShifters, aObjectIndex);

  {set overflow status}
  OverFlow := FObjectOverFlow;

  {set partial generation status}
  FPartialGeneration := not(FAllObjectsPrinted) and not(OverFlow);

end; {procedure, GenerateObjects}

{------------------------------------------------------------------------------}
{ TppStretchable.ProcessQueue }

procedure TppStretchable.ProcessQueue(aQueue: TList; aObjectIndex: Integer);
var
  liComponent: Integer;
  liComponents: Integer;
  lComponent: TppComponent;
  llCurrentPosition: Longint;
  llCheckPosition: Longint;
begin

  llCurrentPosition := CurrentPosition;

  liComponents := aQueue.Count;

  liComponent := aObjectIndex;

  while liComponent < liComponents do
    begin
      lComponent := TppComponent(aQueue[liComponent]);

      lComponent.Generate;

      {add the object to the print queue}
      if (lComponent.SpaceUsed > 0) then
        FPrintQueue.AddObject(Format('%8d', [lComponent.ZOrder]), lComponent);

      {indicate that object did not print completely}
      if not(lComponent.GenerationComplete) then
        begin

          {if this component was the first not to print, save it's position in the list}
          if not(FObjectSaved) then
            begin
              FObjectSaved := True;
              FObjectIndex := liComponent;

              if (lComponent is TppStretchable) and TppStretchable(lComponent).Stretch then
                FObjectOverFlow := True
              else
                FObjectOverFlow := False;
            end;

          if (lComponent.mmTop < FPartialAdjustment) then
            FPartialAdjustment := lComponent.mmTop;

          FAllObjectsPrinted := False;
        end;

      if (lComponent.SpaceUsed > 0) then
        begin
          llCheckPosition := lComponent.PrintPosRect.Top + lComponent.SpaceUsed;

          {update the band's spaceused and currentposition}
          if (llCheckPosition > llCurrentPosition) then
            llCurrentPosition := llCheckPosition;

        end;

      Inc(liComponent);

      {let the app catch up}
      ProcessMessages;

    end; {while, each object}

  if (llCurrentPosition > CurrentPosition) then
    begin
      CurrentPosition := llCurrentPosition;

      SpaceUsed := FCurrentPosition - PrintPosRect.Top;
    end;

end; {procedure, ProcessQueue}

{------------------------------------------------------------------------------}
{ TppStretchable.Print }

procedure TppStretchable.Print(aPage: TppPage);
var
  liComponent: Integer;
  liComponents: Integer;
  lComponent: TppComponent;
begin

  inherited Print(aPage);

  liComponents := FPrintQueue.Count;

  {sort objects by z-order}
  TStringList(FPrintQueue).Sort;

  for liComponent := 0 to liComponents - 1 do
    begin
      lComponent := TppComponent(FPrintQueue.Objects[liComponent]);

      lComponent.Print(aPage);

      {let the app catch up}
      ProcessMessages;
    end;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppStretchable.GetChainTop }

function TppStretchable.GetChainTop: Longint;
var
  lShiftRelativeTo: TppStretchable;
begin
  lShiftRelativeTo := GetShiftRelativeTo;

  if (lShiftRelativeTo = nil) then
    Result := mmTop
  else
    Result := lShiftRelativeTo.GetChainTop;

end; {function, GetChainTop}

{------------------------------------------------------------------------------}
{ TppStretchable.CreatePopupMenu}

procedure TppStretchable.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '',  238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '',  240);
  aPopupMenu.AddItem(30, 'ShiftRelativeTo', '',  336);
  aPopupMenu.AddItem(30, 'Stretch', '',  243);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppStretchable.PopupMenuClick }

procedure TppStretchable.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;
begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  {set checked state for ShiftRelativeTo}
  lPopupMenu.ItemByName('ShiftRelativeTo').Checked := (ShiftRelativeTo <> nil);

  {enabled/disable options, as needed}
  lPopupMenu.ItemByName('ReprintOnOverflow').Enabled := (ShiftRelativeTo = nil) and not(Stretch);
  lPopupMenu.ItemByName('ShiftWithParent').Enabled   := (ShiftRelativeTo = nil) and not(Stretch);
  lPopupMenu.ItemByName('ShiftRelativeTo').Enabled   := (Region = nil);

  {assign dialog event handler}
  lPopupMenu.ItemByName('ShiftRelativeTo').OnClick := ShiftRelativeToMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.CreatePositionDialog }

function TppStretchable.CreatePositionDialog: TppCustomPositionDialog;
begin

  Result := inherited CreatePositionDialog;

  if Result <> nil then
    begin
      Result.PropBottomOffset := BottomOffset;
      Result.PropOverflowOffset := OverFlowOffset;
      Result.PropStopPosition := StopPosition;
    end;

end; {function, CreatePositionDialog}

{------------------------------------------------------------------------------}
{ TppStretchable.PositionChange }

procedure TppStretchable.PositionChange(Sender: TObject);
begin

  inherited PositionChange(Sender);

  if Sender is TppCustomPositionDialog then
    begin
      BottomOffset   := TppCustomPositionDialog(Sender).PropBottomOffset;
      OverFlowOffset := TppCustomPositionDialog(Sender).PropOverFlowOffset;
      StopPosition := TppCustomPositionDialog(Sender).PropStopPosition;
    end;

end;  {procedure, PositionChange}

{------------------------------------------------------------------------------}
{ TppStretchable.VisibleMenuClick }

procedure TppStretchable.VisibleMenuClick(Sender: TObject);
begin
  Visible := not Visible;

end; {procedure, VisibleMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.TransparentMenuClick }

procedure TppStretchable.TransparentMenuClick(Sender: TObject);
begin
  Transparent := not Transparent;
end; {procedure, TransparentMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.StretchMenuClick }

procedure TppStretchable.StretchMenuClick(Sender: TObject);
begin
  Stretch := not Stretch;
end; {procedure, StretchMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.ReprintOnOverFlowMenuClick }

procedure TppStretchable.ReprintOnOverFlowMenuClick(Sender: TObject);
begin
  ReprintOnOverFlow := not ReprintOnOverFlow;
end; {procedure, ReprintOnOverFlowMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.ShiftWithParentMenuClick }

procedure TppStretchable.ShiftWithParentMenuClick(Sender: TObject);
begin
  ShiftWithParent := not ShiftWithParent;
end; {procedure, ShiftWithParentMenuClick}

{------------------------------------------------------------------------------}
{ TppStretchable.StretchWithParentMenuClick }

procedure TppStretchable.StretchWithParentMenuClick(Sender: TObject);
begin
  StretchWithParent := not StretchWithParent;
end; {procedure, StretchWithParentMenuClick}

{******************************************************************************
 *
 ** S T R E T C H A B L E  R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppStretchableRTTI.RefClass }

class function TraTppStretchableRTTI.RefClass: TClass;
begin
  Result := TppStretchable;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppStretchableRTTI.GetPropRec }

class function TraTppStretchableRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CurrentPosition') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'mmBottomOffset') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'mmOverFlowOffset') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'KeepTogether') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'KeptTogether') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'PageBottom') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'PartialAdjustment') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'PartialGeneration') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'ShifterCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'ShiftRelativeTo') = 0) then
    ClassPropToRec(aPropName, TppStretchable, False, aPropRec)

  else if (CompareText(aPropName, 'mmStopPosition') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Stretch') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppStretchableRTTI.GetPropValue }

class function TraTppStretchableRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CurrentPosition') = 0) then
    Integer(aValue) := TppStretchable(aObject).CurrentPosition

  else if (CompareText(aPropName, 'mmBottomOffset') = 0) then
    Integer(aValue) := TppStretchable(aObject).mmBottomOffset

  else if (CompareText(aPropName, 'mmOverFlowOffset') = 0) then
    Integer(aValue) := TppStretchable(aObject).mmOverFlowOffset

  else if (CompareText(aPropName, 'KeepTogether') = 0) then
    Integer(aValue) := Ord(TppStretchable(aObject).KeepTogether)

  else if (CompareText(aPropName, 'KeptTogether') = 0) then
    Integer(aValue) := Ord(TppStretchable(aObject).KeptTogether)

  else if (CompareText(aPropName, 'PageBottom') = 0) then
    Integer(aValue) := TppStretchable(aObject).PageBottom

  else if (CompareText(aPropName, 'PartialAdjustment') = 0) then
    Integer(aValue) := TppStretchable(aObject).PartialAdjustment

  else if (CompareText(aPropName, 'PartialGeneration') = 0) then
    Integer(aValue) := Ord(TppStretchable(aObject).PartialGeneration)

  else if (CompareText(aPropName, 'ShifterCount') = 0) then
    Integer(aValue) := TppStretchable(aObject).ShifterCount

  else if (CompareText(aPropName, 'ShiftRelativeTo') = 0) then
    Integer(aValue) := Integer(TppStretchable(aObject).ShiftRelativeTo)

  else if (CompareText(aPropName, 'mmStopPosition') = 0) then
    Integer(aValue) := TppStretchable(aObject).mmStopPosition

  else if (CompareText(aPropName, 'Stretch') = 0) then
    Integer(aValue) := Ord(TppStretchable(aObject).Stretch)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppStretchableRTTI.SetPropValue }

class function TraTppStretchableRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'KeepTogether') = 0) then
    TppStretchable(aObject).KeepTogether := Boolean(aValue)

  else if (CompareText(aPropName, 'ShiftRelativeTo') = 0) then
    TppStretchable(aObject).ShiftRelativeTo := TppStretchable(aValue)

  else if (CompareText(aPropName, 'Stretch') = 0) then
    TppStretchable(aObject).Stretch := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


initialization

  raRegisterRTTI(TraTppStretchableRTTI);

finalization

  raUnRegisterRTTI(TraTppStretchableRTTI);


end.
