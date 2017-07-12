{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppSubRpt;

interface

{$I ppIfDef.pas}

uses
   Windows, SysUtils, Classes, Forms, Menus, Printers, ExtCtrls, Graphics, Controls, Dialogs,
   ppComm, ppClass, ppCache, ppDevice, ppStrtch, ppTypes, ppUtils, ppCtrls,
   ppReport, ppPrnabl, ppPrintr, ppPrnDev, ppTmplat, ppDrwCmd, ppForms, ppDsgnCt,
   ppRTTI;

type

  { TppSubReport }
  TppSubReport = class(TppStretchable)
    private
      FAlreadyPageBreak: Boolean;
      FCacheManager: TppCacheManager;
      FExpandAll: Boolean;
      FFirstPassCompleted: Boolean;
      FCount: Longint;
      FDrillDownComponent: TppComponent;
      FExpansions: TStrings;
      FLastPageCached: Longint;
      FMainSection: Boolean;
      FNewPage: Boolean;
      FNewPrintJob: Boolean;
      FPageGenerated: Boolean;
      FParentPrinterSetup: Boolean;
      FPrintBehavior: TppPrintBehaviorType;
      FPrinterDevice: TppPrinterDevice;
      FReport: TppCustomReport;
      FReportAbsolutePageCount: Longint;
      FReportCompleted: Boolean;
      FReportGenerated: Boolean;
      FReportPageNo: Longint;
      FResetPageNo: Boolean;
      FRetainExpansions: Boolean;
      FSaveStopPosition: Longint;
      FStartReport: Boolean;
      FTraverseAllData: Boolean;

{$IFDEF CacheTrack}
      FCaches: TStringList;
{$ENDIF}

      procedure GenerateReport;
      function  GetReportKey: String;
      function  GetExpansionKey: String;
      function  GetExpansion(aIndex: Integer): String;
      function  GetExpansionCount: Integer;
      function  GetChildReport: TppCustomReport;
      function  GetDrillDownComponent: TppComponent;
      procedure SetDrillDownComponent(aComponent: TppComponent);
      procedure SetExpandAll(Value: Boolean);
      procedure SetNewPage(Value: Boolean);
      procedure SetNewPrintJob(Value: Boolean);
      procedure SetParentPrinterSetup(Value: Boolean);
      procedure SetPrintBehavior(aPrintBehavior: TppPrintBehaviorType);
      procedure SetResetPageNo(Value: Boolean);
      procedure SetTraverseAllData(Value: Boolean);
      procedure UpdateCache;
      procedure UpdateDefaultBands;

      {child/fixed related}
      procedure GenerateChild;
      procedure GenerateFixed;
      procedure GetLastPageCachedEvent(Sender: TObject; var aPageNo: Longint);
      procedure InitChild;

      {drill down related}
      function  DrillDownExpanded: Boolean;
      procedure DrillDownDrawCommandClickEvent(Sender: TObject; aDrawCommand: TObject);
      procedure DrillDownDrawCommandCreateEvent(Sender: TObject; aDrawCommand: TObject);
      function  FindExpansion(const aExpansionKey: String): Integer;
      procedure FreeExpansions;
      function  IsDrillDown: Boolean;

      {section related}
      procedure CreatePrinterDevice;
      procedure FreePrinterDevice;
      procedure GenerateSection;
      procedure InitSection;
      procedure SectionAfterSendPageEvent(Sender: TObject);

    protected
      procedure CalcSpaceUsed; override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure CreateDrawCommand(aPage: TppPage); override;
      procedure SetBand(aBand: TppBand); override;
      procedure SetCaption(aCaption: String); override;
      procedure SetParentWidth(Value: Boolean); override;
      procedure SetRegion(aComponent: TppComponent); override;
      procedure SetUnits(aUnits: TppUnitType); override;

      {popup menu event handlers}
      procedure ChildMenuClick(Sender: TObject);
      procedure DrillDownMenuClick(Sender: TObject);
      procedure FixedMenuClick(Sender: TObject);
      procedure NewPageMenuClick(Sender: TObject);
      procedure NewPrintJobMenuClick(Sender: TObject);
      procedure ParentPrinterSetupMenuClick(Sender: TObject);
      procedure ParentWidthMenuClick(Sender: TObject);
      procedure ResetPageNoMenuClick(Sender: TObject);
      procedure SectionMenuClick(Sender: TObject);

{$IFDEF WIN32}
  {$IFDEF Delphi3}
      procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
      procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
      procedure WriteComponents(Writer: TWriter); override;
{$ENDIF}

      property NewPage: Boolean read FNewPage write SetNewPage default False;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure AddExpansion(const aExpansionKey: String);
      procedure RemoveExpansion(const aExpansionKey: String);
      procedure AfterDesignerCreate; override;
      procedure AfterPrint; override;
      procedure BeforePrint; override;
      procedure ChangeOwner(aNewOwner: TComponent); override;
      procedure CreateReport(aMainReport: TppReport);
      procedure FreeCache(aCachePageNo: Longint); override;
      function  HasColor: Boolean; override;
      function  HasFont: Boolean; override;
      procedure Init; override;
      function  IsClickable: Boolean; override;
      procedure LanguageChanged; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure SetReportProperty(aReport: TppCustomReport);
      procedure StartOfMainReport; override;
      procedure StartOfParentReport; override;

      property Count: Integer read FCount;
      property CurrentReportKey: String read GetReportKey;
      property CurrentExpansionKey: String read GetExpansionKey;
      property Expansions[Index: Integer]: String read GetExpansion;
      property ExpansionCount: Integer read GetExpansionCount;
      property Report: TppCustomReport read GetChildReport;

    published
      property BottomOffset;
      property Caption;
      property DrillDownComponent: TppComponent read GetDrillDownComponent write SetDrillDownComponent;
      property ExpandAll: Boolean read FExpandAll write SetExpandAll;
      property Height;
      property Left;
      property NewPrintJob: Boolean read FNewPrintJob write SetNewPrintJob;
      property OverFlowOffset;
      property ParentPrinterSetup: Boolean read FParentPrinterSetup write SetParentPrinterSetup default True;
      property ParentWidth default True;
      property PrintBehavior: TppPrintBehaviorType read FPrintBehavior write SetPrintBehavior default pbChild;
      property ResetPageNo: Boolean read FResetPageNo write SetResetPageNo default True;
      property ShiftRelativeTo;
      property StopPosition;
      property TraverseAllData: Boolean read FTraverseAllData write SetTraverseAllData;
      property Top;
      property Visible;
      property Width;

  end; {class, TppSubReport}

  { TppDrillDownExpansion }
  TppDrillDownExpansion = class
    private
      FCount: Longint;

    public
      property Count: Longint read FCount write FCount;

  end; {class, TppDrillDownExpansion}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppSubReportRTTI }
  TraTppSubReportRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppSubReportRTTI}


implementation

uses
  ppClasUt, ppBands;

{******************************************************************************
 *
 ** S U B  R E P O R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSubReport.Create }

constructor TppSubReport.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAlreadyPageBreak     := False;
  FCacheManager         := nil;
  FCount                := 0;
  FDrillDownComponent   := nil;
  FExpansions           := TStringList.Create;
  FExpandAll            := False;
  FFirstPassCompleted   := False;
  FLastPageCached       := 0;
  FMainSection          := False;
  FNewPage              := False;
  FNewPrintJob          := False;                         
  FPageGenerated        := False;
  FParentPrinterSetup   := True;
  FPrintBehavior        := pbChild;
  FReport               := nil;
  FReportAbsolutePageCount := 0;
  FReportPageNo         := 0;
  FReportCompleted      := False;
  FResetPageNo          := True;
  FRetainExpansions     := False;
  FSaveStopPosition     := 0;
  FStartReport          := False;
  FTraverseAllData      := False;

{$IFDEF CacheTrack}
  FCaches := TStringList.Create;
{$ENDIF}

  {set inherited properties}
  CacheRecordSize := SizeOf(TppSubReportSaveRec);
  ParentWidth := True;
  spHeight := 19;
  Stretch := True;

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppSubReport.Destroy }

destructor TppSubReport.Destroy;
begin

{$IFDEF CacheTrack}
  FCaches.Free;
{$ENDIF}

  FreeExpansions;

  FExpansions.Free;

  FPrinterDevice.Free;

  FReport.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppSubReport.Notify}

procedure TppSubReport.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aCommunicator = FDrillDownComponent) and (aOperation = ppopRemove) then
    FDrillDownComponent := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppSubReport.AfterDesignerCreate }

procedure TppSubReport.AfterDesignerCreate;
begin

  {this method is called by the report designer}
  if (Band = nil) or (Band.Report = nil) then
    CreateReport(nil)
  else
    CreateReport(TppReport(Band.Report.MainReport));

end; {procedure, AfterDesignerCreate}


{------------------------------------------------------------------------------}
{ TppSubReport.CreateReport }

procedure  TppSubReport.CreateReport(aMainReport: TppReport);
begin

  if (aMainReport = nil) or (FReport <> nil) then Exit;

  FReport := TppChildReport(ppComponentCreate(aMainReport, TppChildReport));

  TppChildReport(FReport).Parent := Self;
  FReport.PrinterSetup.Assign(aMainReport.PrinterSetup);
  FReport.ReportDesigner := aMainReport.ReportDesigner;
  FReport.Units := Units;

  UpdateDefaultBands;

end;

{------------------------------------------------------------------------------}
{ TppSubReport.ChangeOwner }

procedure TppSubReport.ChangeOwner(aNewOwner: TComponent);
begin

  if (aNewOwner = Owner) then Exit;

  {update the child report's owner, if it is the same}
  if (FReport <> nil) and (FReport.Owner = Owner) then
    FReport.ChangeOwner(aNewOwner);

  inherited ChangeOwner(aNewOwner);

end;

{------------------------------------------------------------------------------}
{ TppSubReport.UpdateDefaultBands }

procedure TppSubReport.UpdateDefaultBands;
begin
 if (FReport = nil) then Exit;

 if FPrintBehavior = pbChild then
   FReport.DefaultBands := cChildReportBands
 else
   FReport.DefaultBands := cReportBands;

end;

{------------------------------------------------------------------------------}
{ TppSubReport.SetBand }

procedure TppSubReport.SetBand(aBand: TppBand);
var
  lMainReport: TppCustomReport;

begin

  inherited SetBand(aBand);

  if (FReport = nil) then  Exit;

  lMainReport := FReport.MainReport;

  if (lMainReport <> nil) then
    FReport.ReportDesigner := lMainReport.ReportDesigner
  else
    FReport.ReportDesigner := nil;

end;

{------------------------------------------------------------------------------}
{ TppSubReport.SetCaption }

procedure TppSubReport.SetCaption(aCaption: String);
begin

  inherited SetCaption(aCaption);

  {notify report designer, so it can change the tab caption}
  SendDesignMessage(PM_CAPTIONCHANGE, ppWCustomMsg, LongInt(Self));

end;

{------------------------------------------------------------------------------}
{ TppSubReport.GetChildReport }

function  TppSubReport.GetChildReport: TppCustomReport;
begin
  Result := FReport;
end;

{------------------------------------------------------------------------------}
{ TppSubReport.HasColor }

function  TppSubReport.HasColor: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppSubReport.HasFont }

function  TppSubReport.HasFont: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppSubReport.LanguageChanged}

procedure TppSubReport.LanguageChanged;
begin
   if (Band = nil) or (Band.Report = nil) or (FReport = nil) then Exit;

   FReport.Language := Band.Report.Language;

   FReport.LanguageChanged;
end;

{------------------------------------------------------------------------------}
{ TppSubReport.IsClickable}

function TppSubReport.IsClickable: Boolean;
begin
  Result := False;
end; {procedure, IsClickable}

{------------------------------------------------------------------------------}
{ TppSubReport.SetReportProperty }

procedure TppSubReport.SetReportProperty(aReport: TppCustomReport);
begin

  if (FReport <> nil) then
    FReport.ParentReport := nil;

  FReport := aReport;

  if (FReport <> nil) and (Band <> nil) then
    FReport.ParentReport := Band.Report;

  LanguageChanged;

end; {procedure, SetReportProperty}

{------------------------------------------------------------------------------}
{ TppSubReport.SetParentPrinterSetup }

procedure TppSubReport.SetParentPrinterSetup(Value: Boolean);
var
  lParentReport: TppCustomReport;
begin

  FParentPrinterSetup := Value;

  PropertyChange;

  if not Value then Exit;

  lParentReport := GetReport;

  if (FReport <> nil) and (lParentReport <> nil) then
    FReport.PrinterSetup.Assign(lParentReport.PrinterSetup);

end; {procedure, SetParentPrinterSetup}

{------------------------------------------------------------------------------}
{ TppSubReport.GetDrillDownComponent }

function TppSubReport.GetDrillDownComponent: TppComponent;
begin

  Result := FDrillDownComponent;

  if (csWriting in ComponentState) then Exit;

  {make sure DrillDownComponent exists in this band}
  if (FDrillDownComponent <> nil) and (Band.FindObject(FDrillDownComponent) = -1) then
    SetDrillDownComponent(nil);

  Result := FDrillDownComponent;

end; {function, GetDrillDownComponent}

{------------------------------------------------------------------------------}
{ TppSubReport.SetDrillDownComponent }

procedure TppSubReport.SetDrillDownComponent(aComponent: TppComponent);
var
  lbFound: Boolean;
  liIndex: Integer;
  lComponent: TppComponent;
begin

  if (aComponent <> nil) and (FPrintBehavior <> pbChild) then Exit;

  {remove component from notify list}
  if (FDrillDownComponent <> nil) then
    RemoveNotify(FDrillDownComponent);

  FDrillDownComponent := aComponent;

  {add component to notify list}
  if (FDrillDownComponent <> nil) then
    begin
      AddNotify(FDrillDownComponent);

      {make sure component is assigned only to this subreport}
      lbFound := False;
      liIndex := 0;

      while (liIndex < Band.ObjectCount) and not(lbFound) do
        begin
          lComponent := Band.Objects[liIndex];

          if (lComponent <> Self) and (lComponent is TppSubReport) and
             (FDrillDownComponent = TppSubReport(lComponent).FDrillDownComponent) then
              TppSubReport(lComponent).DrillDownComponent := nil;

          Inc(liIndex);
        end;

    end;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetDrillDownComponent}

{------------------------------------------------------------------------------}
{ TppSubReport.SetExpandAll }

procedure TppSubReport.SetExpandAll(Value: Boolean);
begin

  FExpandAll := Value;


  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FreeExpansions;

  if FExpandAll then
    begin
      if (FDrillDownComponent <> nil) then
        begin
          FDrillDownComponent.OnDrawCommandCreate := nil;
          FDrillDownComponent.OnDrawCommandClick := nil;
        end;
    end
  else
    begin
      if (FDrillDownComponent <> nil) then
        begin
          FDrillDownComponent.OnDrawCommandCreate := DrillDownDrawCommandCreateEvent;
          FDrillDownComponent.OnDrawCommandClick := DrillDownDrawCommandClickEvent;
        end;
    end;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetExpandAll}

{------------------------------------------------------------------------------}
{ TppSubReport.SetNewPage }

procedure TppSubReport.SetNewPage(Value: Boolean);
begin

  FNewPage := Value;

  {if not NewPage then NewPrintJob must also be False}
  if not FNewPage and FNewPrintJob then
    FNewPrintJob := False;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetNewPage}

{------------------------------------------------------------------------------}
{ TppSubReport.SetRegion }

procedure TppSubReport.SetRegion(aComponent: TppComponent);
begin
  inherited SetRegion(aComponent);

  if (Region <> nil) and (FPrintBehavior = pbSection) then
    SetPrintBehavior(pbFixed);

end; {procedure, SetRegion}

{------------------------------------------------------------------------------}
{ TppSubReport.SetParentWidth }

procedure TppSubReport.SetParentWidth(Value: Boolean);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    begin
      inherited SetParentWidth(Value);

      Exit;
    end;

  if (FPrintBehavior = pbSection) and not(Value) then Exit;

  inherited SetParentWidth(Value);

end; {procedure, SetParentWidth}

{------------------------------------------------------------------------------}
{ TppSubReport.SetNewPrintJob }

procedure TppSubReport.SetNewPrintJob(Value: Boolean);
begin

  FNewPrintJob := Value;

  {if NewPrintJob then NewPage must also be True}
  if FNewPrintJob and not(FPrintBehavior = pbSection) then
    FPrintBehavior := pbSection;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetNewPrintJob}

{------------------------------------------------------------------------------}
{ TppSubReport.SetPrintBehavior }

procedure TppSubReport.SetPrintBehavior(aPrintBehavior: TppPrintBehaviorType);
begin
  if (Region <> nil) and (aPrintBehavior = pbSection) then Exit;

  FPrintBehavior := aPrintBehavior;

  {set stretch property based upon PrintBehavior}
  if (FPrintBehavior = pbChild) then
    Stretch := True
  else
    Stretch := False;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FPrintBehavior = pbFixed) then
    StopPosition := 0;

  if (GetDrillDownComponent <> nil) and (FPrintBehavior = pbSection) then
    SetDrillDownComponent(nil);
    
  if FNewPrintJob and not(FPrintBehavior = pbSection) then
    FNewPrintJob := False;

  if (FResetPageNo) and not(FPrintBehavior = pbSection) then
    FResetPageNo := False;

  if (FPrintBehavior = pbSection) and not(ParentWidth) then
    ParentWidth := True;

  {clear ShiftRelativeTo for sections}
  if (ShiftRelativeTo <> nil) and (FPrintBehavior = pbSection) then
    ShiftRelativeTo := nil;

  UpdateDefaultBands;
  
  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetPrintBehavior}

{------------------------------------------------------------------------------}
{ TppSubReport.SetResetPageNo }

procedure TppSubReport.SetResetPageNo(Value: Boolean);
begin
  if (FPrintBehavior <> pbSection) then Exit;

  FResetPageNo := Value;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetResetPageNo}

{------------------------------------------------------------------------------}
{ TppSubReport.SetUnits }

procedure TppSubReport.SetUnits(aUnits: TppUnitType);

begin
  inherited SetUnits(aUnits);

end; {procedure, SetUnits}

{------------------------------------------------------------------------------}
{ TppSubReport.CreatePopupMenu}

procedure TppSubReport.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(25, 'Child', '',  380); {'Child'}
  aPopupMenu.AddItem(25, 'Section', '',  381);
  aPopupMenu.AddItem(25, 'Fixed', '',  382);
  aPopupMenu.AddItem(26, 'PrintBehaviorLine1', '-',  0);

  aPopupMenu.AddItem(30, 'DrillDown', '',  498);
  aPopupMenu.AddItem(30, 'ExpandAll', '',  643);
  aPopupMenu.AddItem(30, 'NewPrintJob', '',  373);
  aPopupMenu.AddItem(30, 'ParentPrinterSetup', '',  413);
  aPopupMenu.AddItem(30, 'ParentWidth', '',  371);
  aPopupMenu.AddItem(30, 'ResetPageNo', '',  410);
  aPopupMenu.AddItem(30, 'TraverseAllData', '',  644);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppSubReport.PopupMenuClick }

procedure TppSubReport.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;

begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  {set menu item.checked for PrintBehavior}
  lPopupMenu.ItemByName('Child').Checked := (PrintBehavior = pbChild);
  lPopupMenu.ItemByName('Section').Checked := (PrintBehavior = pbSection);
  lPopupMenu.ItemByName('Fixed').Checked := (PrintBehavior = pbFixed);
  lPopupMenu.ItemByName('DrillDown').Checked := (DrillDownComponent <> nil);
  lPopupMenu.ItemByName('ExpandAll').Checked := FExpandAll;
  lPopupMenu.ItemByName('TraverseAllData').Checked := FTraverseAllData;

  {assign menu item event handlers}
  lPopupMenu.ItemByName('Child').OnClick   := ChildMenuClick;
  lPopupMenu.ItemByName('Section').OnClick := SectionMenuClick;
  lPopupMenu.ItemByName('Fixed').OnClick   := FixedMenuClick;
  lPopupMenu.ItemByName('DrillDown').OnClick   := DrillDownMenuClick;

  {the following options are enabled for Sections only}
  lPopupMenu.ItemByName('NewPrintJob').Enabled := (PrintBehavior = pbSection);
  lPopupMenu.ItemByName('ParentPrinterSetup').Enabled := (PrintBehavior = pbSection);
  lPopupMenu.ItemByName('ResetPageNo').Enabled := (PrintBehavior = pbSection);

  {the following options are enabled when NOT a Section }
  lPopupMenu.ItemByName('ParentWidth').Enabled := not(PrintBehavior = pbSection);

  {disable shift relative to if in region}
  lPopupMenu.ItemByName('ShiftRelativeTo').Enabled := (Region = nil) and not(PrintBehavior = pbSection);

  lPopupMenu.ItemByName('DrillDown').Enabled := (PrintBehavior = pbChild);
  lPopupMenu.ItemByName('ExpandAll').Enabled := (DrillDownComponent <> nil);
  lPopupMenu.ItemByName('TraverseAllData').Enabled := (PrintBehavior = pbFixed);

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.ChildMenuClick }

procedure TppSubReport.ChildMenuClick(Sender: TObject);
begin
  PrintBehavior := pbChild;
end; {procedure, ChildMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.SectionMenuClick }

procedure TppSubReport.SectionMenuClick(Sender: TObject);
begin
  PrintBehavior := pbSection;
end; {procedure, SectionMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.FixedMenuClick }

procedure TppSubReport.FixedMenuClick(Sender: TObject);
begin
  PrintBehavior := pbFixed;
end; {procedure, FixedMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.ParentPrinterSetupMenuClick }

procedure TppSubReport.ParentPrinterSetupMenuClick(Sender: TObject);
begin
  ParentPrinterSetup := not ParentPrinterSetup;
end; {procedure, ParentPrinterSetupMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.ParentWidthMenuClick }

procedure TppSubReport.ParentWidthMenuClick(Sender: TObject);
begin
  ParentWidth := not ParentWidth;
end; {procedure, ParentWidthMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.NewPageMenuClick }

procedure TppSubReport.NewPageMenuClick(Sender: TObject);
begin
  NewPage := not NewPage;
end; {procedure, NewPageMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.DrillDownMenuClick }

procedure TppSubReport.DrillDownMenuClick(Sender: TObject);
var
  lDialog: TppCustomDrillDownDialog;
  lFormClass: TFormClass;
  lbFullDesc: Boolean;
  lList: TStrings;
  lDrillDownComponent: TppComponent;
  lComponent: TppCommunicator;
begin

  lFormClass := ppGetFormClass(TppCustomDrillDownDialog);

  lDialog := TppCustomDrillDownDialog(lFormClass.Create(Application));
  lDialog.LanguageIndex     := LanguageIndex;
  lDialog.Report            := FReport;

  {get list of stretchable components}
  lbFullDesc := True;
  lList := lDialog.SelectionList;

  ppGetClickableComponents(Self, lList, lbFullDesc);

  {add '<None>' as first choice}
  lList.Insert(0, ppLoadStr(343));

  lDrillDownComponent := GetDrillDownComponent;

  if (lDrillDownComponent <> nil) then
    lDialog.SelectedComponent := lDrillDownComponent.UserName
  else
    lDialog.SelectedComponent := ppLoadStr(343);

  {set property}
  if (lDialog.ShowModal = mrOK) then
    begin
      lComponent := Band.Report.FindUserObject(lDialog.SelectedComponent);

      SetDrillDownComponent(TppComponent(lComponent));
    end;

  lDialog.Free;

end; {procedure, DrillDownMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.NewPrintJobMenuClick }

procedure TppSubReport.NewPrintJobMenuClick(Sender: TObject);
begin
  NewPrintJob := not NewPrintJob;
end; {procedure, NewPrintJobMenuClick}

{------------------------------------------------------------------------------}
{ TppSubReport.ResetPageNoMenuClick }

procedure TppSubReport.ResetPageNoMenuClick(Sender: TObject);
begin
  ResetPageNo := not ResetPageNo;
end; {procedure, ResetPageNoMenuClick}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppSubReport.GetChildren - write report bands as subcomponents to .DFM }

{$IFDEF Delphi3}
   procedure TppSubReport.GetChildren(Proc: TGetChildProc;Root: TComponent);
{$ELSE}
   procedure TppSubReport.GetChildren(Proc: TGetChildProc);
{$ENDIF}

begin

  {write report}
  if (FReport <> nil) then
    Proc(FReport);

end;



{$ELSE}

{------------------------------------------------------------------------------}
{ TppSubReport.WriteComponents - write report bands as subcomponents to .DFM }

procedure TppSubReport.WriteComponents(Writer: TWriter);
begin

  if (FReport <> nil) then
    Writer.WriteComponent(FReport);

end; {procedure, WriteComponents}


{$ENDIF}

{------------------------------------------------------------------------------}
{ TppSubReport.CalcSpaceUsed }

procedure TppSubReport.CalcSpaceUsed;
var
 lReport: TppCustomReport;
begin

  {indicate that report had opportunity to print}
  FReportGenerated := True;

  {save active report}
  lReport := TppReport(FReport.MainReport).ActiveReport;

  {set active report}
  TppReport(FReport.MainReport).ActiveReport := FReport;

  {generate report}
  case FPrintBehavior of

    pbChild:
      GenerateChild;

    pbFixed:
      begin
        if FTraverseAllData then
          GenerateChild
        else
          GenerateFixed;
      end;

    pbSection:
      GenerateSection;

  end; {case, print behavior type}

  {clear active report}
  TppReport(FReport.MainReport).ActiveReport := lReport;

end; {function, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppSubReport.FreeCache }

procedure TppSubReport.FreeCache(aCachePageNo: Longint);
begin

  {this routine is called when drill downs are expanded or collapsed}
  if (csDestroying in ComponentState) then Exit;

  if FCacheManager <> nil then
    FCacheManager.DumpCache(aCachePageNo);

end; {function, FreeCache}

{------------------------------------------------------------------------------}
{ TppSubReport.RestoreFromCache }

procedure TppSubReport.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppSubReportSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

  FAlreadyPageBreak        := lRec.FAlreadyPageBreak;
  FCount                   := lRec.FCount;
  FStartReport             := lRec.FStartReport;
  FLastPageCached          := lRec.FLastPageCached;
  FReportCompleted         := lRec.FReportCompleted;
  FReportPageNo            := lRec.FReportPageNo;
  FFirstPassCompleted      := lRec.FFirstPassCompleted;
  FReportAbsolutePageCount := lRec.FReportAbsolutePageCount;

  FCacheManager.ReadCache(aCachePageNo);
  
end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppSubReport.SaveToCache }

procedure TppSubReport.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppSubReportSaveRec;
begin

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FAlreadyPageBreak     := FAlreadyPageBreak;
  lRec.FCount                := FCount;
  lRec.FStartReport          := FStartReport;
  lRec.FLastPageCached       := FLastPageCached;
  lRec.FReportCompleted      := FReportCompleted;
  lRec.FReportPageNo         := FReportPageNo;
  lRec.FFirstPassCompleted   := FFirstPassCompleted;
  lRec.FReportAbsolutePageCount := FReportAbsolutePageCount;

  WriteRecordToCache(aCachePageNo, lRec);

  FCacheManager.WriteCache(aCachePageNo);

{$IFDEF CacheTrack}
  FCaches.Add('--------' + Format('%4d', [aCachePageNo]) + '   ---------');
  FCaches.Add('FCount: ' + Format('%4d', [FCount]) );
  FCaches.Add('CacheRecordSize: ' + Format('%4d', [CacheRecordSize]) );
  FCaches.Add('CacheStream.Size: ' + Format('%4d', [CacheStream.Size]) );

  if FStartReport then
    FCaches.Add('FStartReport: True')
  else
    FCaches.Add('FStartReport: False');


  if FFirstPassCompleted then
    FCaches.Add('FFirstPassCompleted: True')
  else
    FCaches.Add('FFirstPassCompleted: False');

  FCaches.Add('');

  FCaches.SaveToFile('c:\' + Name + '.txt');
{$ENDIF}

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppSubReport.UpdateCache }

procedure TppSubReport.UpdateCache;
var
  llCachePage: Longint;
  lRec: TppSubReportSaveRec;
begin

  if not(FReportGenerated) then Exit;

  {we've already cached the page, there's no need to update}
  if (FReport.MainReport.AbsolutePageNo < FReport.MainReport.AbsolutePageCount) then Exit;

  {determine starting search page}
  if (CacheRecordSize > 0) and (CacheCount > 0) then
    llCachePage := Round(Round(CacheStream.Size / CacheRecordSize) / CacheCount) - 1
  else
    llCachePage := -1;

  {look at any prior cache pages with same first cache page, update last page cached}
  if (llCachePage > -1) then
    begin

      repeat

        ReadRecordFromCache(llCachePage, lRec);

        if (FCount = lRec.FCount) then
          begin
            lRec.FStartReport := FStartReport;
            lRec.FFirstPassCompleted := FFirstPassCompleted;
            lRec.FLastPageCached := FLastPageCached;
            lRec.FReportAbsolutePageCount := FReport.AbsolutePageCount;

            WriteRecordToCache(llCachePage, lRec);
          end;

        Dec(llCachePage);

      until (FCount <> lRec.FCount) or (llCachePage < 0);

    end; {if, their are any previous pages to search}

end; {procedure, UpdateCache}

{------------------------------------------------------------------------------}
{ TppSubReport.StartOfMainReport }

procedure TppSubReport.StartOfMainReport;
begin

  inherited StartOfMainReport;

{$IFDEF CacheTrack}
  FCaches.Clear;
  FCaches.SaveToFile('c:\' + Name + '.txt');
{$ENDIF}

  {create the cache manager}
  if (FCacheManager = nil) then
    FCacheManager := TppCacheManager.Create(FReport);

  {clear any previously created bookmarks, this also clears the streams}
  FCacheManager.ResetCache;

  {initialize counter}
  FLastPageCached := 0;

  FReport.PrintingAsSubReport := True;

  if (FReport.PassSetting = psTwoPass) then
    FReport.PassSetting := psOnePass;

  {set up communication with engine}
  FReport.Engine.OnGetLastPageCached := GetLastPageCachedEvent;

  FReport.PrintingAsSubReport  := True;
  {clear any other event handlers}
  FReport.Engine.OnResetCache := nil;
  FReport.Engine.OnReadCache := nil;
  FReport.Engine.OnWriteCache := nil;

  case FPrintBehavior of

    pbSection:
      FMainSection := (Band.Report = Band.Report.MainReport);

    pbChild, pbFixed:
      begin

        {header and footer bands not valid in child subreports}
        if (PrintBehavior = pbChild) then
          begin
            if (FReport.GetBand(btHeader, 0) <> nil) then
              FReport.GetBand(btHeader, 0).Visible := False;

            if (FReport.GetBand(btFooter, 0) <> nil) then
              FReport.GetBand(btFooter, 0).Visible := False;
          end;

        if (IsDrillDown) then
          begin
            FRetainExpansions := False;
            {FreeExpansions;}

            if not(FExpandAll) then
              begin
                FDrillDownComponent.OnDrawCommandCreate := DrillDownDrawCommandCreateEvent;
                FDrillDownComponent.OnDrawCommandClick := DrillDownDrawCommandClickEvent;
              end;
          end;

        if (FPrintBehavior = pbFixed) and (FTraverseAllData) then
          begin
            Stretch := True;

            {setting stretch to True hammers the band.printheight, we need to restore it}
            Band.PrintHeight := phStatic;
          end;
          
      end;

  end; {case, print behavior type}

  {initialize report - 4.2}
  FReport.Engine.State := []; 
  FReport.Engine.Init;

  {this initializes any nested subreports}
  FReport.StartOfMainReport;

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppSubReport.StartOfParentReport }

procedure TppSubReport.StartOfParentReport;
begin

  {initialize counter}
  FCount := 0;

end; {procedure, StartOfParentReport}

{------------------------------------------------------------------------------}
{ TppSubReport.Init }

procedure TppSubReport.Init;
begin

  inherited Init;

  case FPrintBehavior of

    pbChild, pbFixed:
      InitChild;

    pbSection:
      InitSection;

  end; {case, print behavior type}

  {init all subreports}
  FReport.Engine.Init;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppSubReport.GenerateReport }

procedure TppSubReport.GenerateReport;
var
  lPageRequest: TppPageRequest;
begin

  lPageRequest := TppPageRequest.Create;
  lPageRequest.PageSetting := psSinglePage;
  lPageRequest.PageRequested := FReportPageNo;

  try

    try
      FReport.Engine.Printing := False;
      FReport.Engine.SilentExceptions := True;

      FReport.Engine.RequestPage(lPageRequest);

    except
      on EAccessViolation do
        if not(FReport.Engine.StopPrinting) then raise;

      on EPrinter do
        if not(FReport.Engine.StopPrinting) then raise;

      on EPrintError do
        begin
          {do nothing}
        end;

      on ECodeError do
        begin
          {do nothing}
        end;

      on EDataError do
        begin
          {do nothing}
        end;

    end; {try, except}

  finally

    {if report cancelled or exception raised, reset generator}
    if FReport.Engine.StopPrinting then
      FReport.Engine.Reset
    else
      begin
        lPageRequest.Free;
        
        FReport.Engine.Printing := True;
        FReport.Engine.SilentExceptions := False;
      end;

  end; {try, finally}


end; {procedure, GenerateReport}

{------------------------------------------------------------------------------}
{ TppSubReport.CreateDrawCommand}

procedure TppSubReport.CreateDrawCommand(aPage: TppPage);
var
  lSourcePage: TppPage;
  lTargetPage: TppPage;
  llLeftOffset: Longint;
  llTopOffset: Longint;
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;
  lPageDef: TppPageDef;
  lClipRect: TppRect;

  procedure TransferDrawCommands;
    var
      liDrawCommand: Integer;
      liDrawCommands: Integer;
      lDrawCommand: TppDrawCommand;
    begin

      liDrawCommands := lSourcePage.DrawCommandCount;

      {transfer draw commands from child page to parent report}
      for liDrawCommand := 0 to liDrawCommands - 1 do
        begin
          lDrawCommand := lSourcePage[0];

          {adjust commands for sub-report position}
          lDrawCommand.Left := lDrawCommand.Left + llLeftOffset;
          lDrawCommand.Top := lDrawCommand.Top + llTopOffset;

          lDrawCommand.ClipRect := lClipRect;

          lDrawCommand.Page := lTargetPage;
        end;
    end;

begin

  {draw drill down shape}
  if IsDrillDown and not(DrillDownExpanded) then Exit;

  {get target page}
  lTargetPage := aPage;

  {get sub-reports page}
  lSourcePage := FReport.Engine.Page;

  lPageDef := FReport.Engine.Page.PageDef;

  llLeftOffset := 0;
  llTopOffset := 0;

  case FPrintBehavior of

    pbChild:
      begin
        llLeftOffset := PrintPosRect.Left;
        llTopOffset := PrintPosRect.Top;

        llLeft := PrintPosRect.Left + lPageDef.mmMarginLeft;
        llTop := PrintPosRect.Top + lPageDef.mmMarginTop;
        llRight := PrintPosRect.Right - lPageDef.mmMarginRight;
        llBottom := PrintPosRect.Bottom - lPageDef.mmMarginBottom;

        lClipRect := ppRect(llLeft, llTop, llRight, llBottom);

        TransferDrawCommands;
      end;

    pbFixed:
      begin
        llLeftOffset := PrintPosRect.Left;
        llTopOffset := PrintPosRect.Top;

        llLeft := PrintPosRect.Left + lPageDef.mmMarginLeft;
        llTop := PrintPosRect.Top + lPageDef.mmMarginTop;
        llRight := mmWidth - lPageDef.mmMarginRight;
        llBottom := mmHeight - lPageDef.mmMarginBottom;

        lClipRect := ppRect(llLeft, llTop, llRight, llBottom);

        TransferDrawCommands;
      end;

  end; {case, print behavior type}

end; {procedure, CreateDrawCommand}

{******************************************************************************
 *
 ** S U B  R E P O R T  -  C H I L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSubReport.InitChild}

procedure TppSubReport.InitChild;
begin

  FAlreadyPageBreak    := False;
  FFirstPassCompleted  := False;
  FPageGenerated       := False;
  FReportCompleted     := False;
  FReportPageNo        := 1;
  FReportAbsolutePageCount := 0;
  FStartReport         := False;

end; {procedure, InitChild}

{------------------------------------------------------------------------------}
{ TppSubReport.BeforePrint}

procedure TppSubReport.BeforePrint;
begin

  inherited BeforePrint;

  FReportGenerated := False;

  if (FPrintBehavior = pbFixed) and (FTraverseAllData) then
    begin
      FSaveStopPosition := mmStopPosition;

      StopPosition := Top + Height + Band.Report.PrinterSetup.MarginTop;
    end;

{$IFDEF CacheTrack}
  FCaches.LoadFromFile('c:\' + Name + '.txt');
{$ENDIF}

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppSubReport.AfterPrint}

procedure TppSubReport.AfterPrint;
begin

  inherited AfterPrint;

  {after band has completed printing, increment counter, must increment here, otherwise
   drill-down create event can assign wrong counter value to draw command}
  if (FPrintBehavior <> pbSection) and (FReportGenerated) and (FReportCompleted) then
    Inc(FCount);

  if (FPrintBehavior = pbFixed) and (FTraverseAllData) then
    StopPosition := ppFromMMThousandths(FSaveStopPosition, Band.Report.Units, pprtVertical, GetPrinter);

end; {procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppSubReport.GenerateChild}

procedure TppSubReport.GenerateChild;
begin

  {child report linked to shiftrelativeto chain,
   skip generation and goto next stretchable in chain}
  if not(FStartReport) and OverFlow then Exit;

  {update drilldown expansion}
  if (IsDrillDown) then
    begin

      if not(DrillDownExpanded) then
        begin
          FReport.Engine.Reset;

          FReportCompleted := True;
          OverFlow := False;
          SpaceUsed := 0;

          Exit;
        end;

    end;

  {set page size}
  FReport.PrinterSetup := Band.Report.PrinterSetup;
  FReport.Engine.Page.PrinterSetup := Band.Report.PrinterSetup;

  FReport.Engine.Page.PageDef.mmHeight := PrintPosRect.Bottom - PrintPosRect.Top;
  FReport.Engine.Page.PageDef.mmWidth := PrintPosRect.Right - PrintPosRect.Left;

  FReport.Engine.Page.PageDef.mmMarginLeft := 0;
  FReport.Engine.Page.PageDef.mmMarginTop := 0;
  FReport.Engine.Page.PageDef.mmMarginRight := 0;
  FReport.Engine.Page.PageDef.mmMarginBottom := 0;

  {reset the report for the next run}
  if not(FStartReport) then
    begin
      FStartReport := True;

      FFirstPassCompleted  := False;
      FReportCompleted := False;
      FReportPageNo := 1;
      FReportAbsolutePageCount := 1;
      FLastPageCached := 0;

      FReport.Engine.Printing := False;
      FReport.Engine.Reset;
    end
  else
    begin
      FReport.Engine.FirstPassCompleted := FFirstPassCompleted;
      FReport.Engine.AbsolutePageCount := FReportAbsolutePageCount;
    end;


  {generate the report}
  GenerateReport;


  {set overflow and space used}
  if PrintStretch then
    begin
      FReportCompleted := FReport.Engine.LastBandGenerated;

      OverFlow := not(FReportCompleted);

      SpaceUsed := FReport.Engine.SpaceUsed;
    end
  else
    begin
      FReportCompleted := True;

      OverFlow := False;

      SpaceUsed := mmHeight;
    end;

  if (SpaceUsed > 0) then
    begin
      if OverFlow then
        begin
          Inc(FReportPageNo);

          FLastPageCached := FReport.AbsolutePageNo;
        end;

      FReportAbsolutePageCount := FReport.AbsolutePageCount;
    end
  else
    FLastPageCached := 0;

  FFirstPassCompleted := (FReport.Engine.AllDataTraversed) and (FReport.Engine.LastBandGenerated);

  {reset for next report}
  if FReportCompleted then
    FStartReport := False;

end; {procedure, GenerateChild}

{------------------------------------------------------------------------------}
{ TppSubReport.GenerateFixed}

procedure TppSubReport.GenerateFixed;
var
  llSpaceAvailable: Longint;
begin

  {set page size}
  FReport.Engine.Page.PrinterSetup := Band.Report.PrinterSetup;

  llSpaceAvailable := PrintPosRect.Bottom - PrintPosRect.Top;

  if (llSpaceAvailable < mmHeight) then
    begin
      OverFlow := True;

      Exit;
    end;

  FReport.Engine.Page.PageDef.mmHeight := mmHeight;
  FReport.Engine.Page.PageDef.mmWidth := mmWidth;

  FReport.Engine.Page.PageDef.mmMarginLeft := 0;
  FReport.Engine.Page.PageDef.mmMarginTop := 0;
  FReport.Engine.Page.PageDef.mmMarginRight := 0;
  FReport.Engine.Page.PageDef.mmMarginBottom := 0;


  {reset the report for a new run}
  FReportPageNo := 1;
  FLastPageCached := 0;
  FReportAbsolutePageCount := 1;

  FReport.Engine.Printing := False;
  FReport.Engine.Reset;

  {generate the report}
  GenerateReport;

  {set overflow and space used}
  FReportCompleted := True;
  OverFlow := False;
  SpaceUsed := mmHeight;

  FFirstPassCompleted := (FReport.Engine.AllDataTraversed) and (FReport.Engine.LastBandGenerated);

end; {procedure, GenerateFixed}

{------------------------------------------------------------------------------}
{ TppSubReport.SetTraverseAllData }

procedure TppSubReport.SetTraverseAllData(Value: Boolean);
begin

  FTraverseAllData := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetTraverseAllData}

{------------------------------------------------------------------------------}
{ TppSubReport.GetLastPageCachedEvent }

procedure TppSubReport.GetLastPageCachedEvent(Sender: TObject; var aPageNo: Longint);
begin
  aPageNo := FLastPageCached;
end;

{******************************************************************************
 *
 ** S U B  R E P O R T  -  D R I L L  D O W N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSubReport.GetReportKey }

function TppSubReport.GetReportKey: String;
var
  lsKey: String;
begin

  if (Band.Report <> Band.Report.MainReport) then
    begin
      lsKey := '';

      Band.Report.GetReportKey(lsKey);

      Result := lsKey;
    end
  else
    Result := '';

end; {procedure, GetReportKey}

{------------------------------------------------------------------------------}
{ TppSubReport.GetExpansionKey }

function TppSubReport.GetExpansionKey: String;
begin
  Result := GetReportKey + Format('%8d', [FCount]);
end; {function, GetExpansionKey}

{------------------------------------------------------------------------------}
{ TppSubReport.GetExpansion }

function TppSubReport.GetExpansion(aIndex: Integer): String;
begin
  Result := FExpansions[aIndex];
end; {function, GetExpansion

{------------------------------------------------------------------------------}
{ TppSubReport.GetExpansionCount }

function TppSubReport.GetExpansionCount: Integer;
begin
  Result := FExpansions.Count;
end; {function, GetExpansionCount

{------------------------------------------------------------------------------}
{ TppSubReport.IsDrillDown }

function TppSubReport.IsDrillDown: Boolean;
begin
  Result := (GetDrillDownComponent <> nil) and (FPrintBehavior <> pbSection);
end; {function, IsDrillDown}

{------------------------------------------------------------------------------}
{ TppSubReport.FindExpansion}

function TppSubReport.FindExpansion(const aExpansionKey: String): Integer;
begin
  Result := FExpansions.IndexOf(aExpansionKey);
end; {function, FindExpansion}

{------------------------------------------------------------------------------}
{ TppSubReport.AddExpansion}

procedure TppSubReport.AddExpansion(const aExpansionKey: String);
begin
  FExpansions.Add(aExpansionKey);
end; {procedure, AddExpansion}

{------------------------------------------------------------------------------}
{ TppSubReport.RemoveExpansion}

procedure TppSubReport.RemoveExpansion(const aExpansionKey: String);
var
  liPosition: Integer;
begin

  liPosition := FExpansions.IndexOf(aExpansionKey);

  if (liPosition <> -1) then
    FExpansions.Delete(liPosition);

end; {procedure, RemoveExpansion}

{------------------------------------------------------------------------------}
{ TppSubReport.FreeExpansions}

procedure TppSubReport.FreeExpansions;
begin
  FExpansions.Clear;
end; {procedure, FreeExpansions}

{------------------------------------------------------------------------------}
{ TppSubReport.DrillDownExpanded }

function TppSubReport.DrillDownExpanded: Boolean;
begin

  Result := False;

  if not(IsDrillDown) then Exit;

  {determine whether subreport should expand}
  if (FExpandAll) then
    Result := True

  else if (FindExpansion(GetExpansionKey) <> -1) then
    Result := True;

end; {function, DrillDownExpanded}

{------------------------------------------------------------------------------}
{ TppSubReport.DrillDownDrawCommandCreateEvent }

procedure TppSubReport.DrillDownDrawCommandCreateEvent(Sender: TObject; aDrawCommand: TObject);
begin

  {assign tag to track subreport associated with command}
  TppDrawCommand(aDrawCommand).ExpansionKey := GetExpansionKey;

end; {procedure, DrillDownDrawCommandCreateEvent}

{------------------------------------------------------------------------------}
{ TppSubReport.DrillDownDrawCommandClickEvent}

procedure TppSubReport.DrillDownDrawCommandClickEvent(Sender: TObject; aDrawCommand: TObject);
var
  lsExpansionKey: String;
  liPosition: Integer;
  lDrawCommand: TppDrawCommand;
begin

  lDrawCommand := TppDrawCommand(aDrawCommand);

  lsExpansionKey := lDrawCommand.ExpansionKey;

  liPosition := FindExpansion(lsExpansionKey);

  if (liPosition = -1) then
    AddExpansion(lsExpansionKey)
  else
    RemoveExpansion(lsExpansionKey);

  {force report to regenerate}
  lDrawCommand.RedrawPage := True;

  {dump main cache}
  TppReport(FReport.MainReport).ResetFromPageNo(lDrawCommand.Page.AbsolutePageNo);

  FRetainExpansions := True;

end; {procedure, DrillDownDrawCommandClickEvent}

{******************************************************************************
 *
 ** S U B  R E P O R T  -  S E C T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSubReport.InitSection }

procedure TppSubReport.InitSection;
begin

  FAlreadyPageBreak    := False;
  FFirstPassCompleted  := False;
  FPageGenerated       := False;
  FReportCompleted     := False;
  FReportPageNo        := 1;
  FReportAbsolutePageCount := 0;
  FStartReport         := False;

end; {procedure, InitSection}

{------------------------------------------------------------------------------}
{ TppSubReport.GenerateSection}

procedure TppSubReport.GenerateSection;
var
  lMainEngine: TppCustomEngine;
begin

  SpaceUsed := 0;

  if not(FAlreadyPageBreak) then
    begin
      FAlreadyPageBreak := True;

      OverFlow := True;

      {force next generate to start report}
      lMainEngine := FReport.MainReport.Engine;

      if (lMainEngine.AbsolutePageNo = 0) or (lMainEngine.AbsolutePageNo > lMainEngine.LastPageCached) then
        FStartReport := True;

      FReportCompleted := False;

      {indicate to master that we're starting a section}
      Band.Report.ESInclude([esStartSection]);

      TppCustomBand(Band).PrintingSection := True;

      {if the report has already printed something, goto next page}
      if (TppCustomBand(Band).SpaceUsed > 0) or (Band.Report.Engine.SpaceUsed > 0) then
        Exit;

      {special case, section appears on first page}
      if (FReport.MainReport.AbsolutePageNo = 1) and ((FReport.MainReport.AbsolutePageCount > 1)) then
        FStartReport := False;
    end;

  {start report}
  if FStartReport then
    begin
      FStartReport := False;

      {reset report}
      FReportPageNo := 1;
      FReportAbsolutePageCount := 0;
      FLastPageCached := 0;
      FFirstPassCompleted := False;
      FReportCompleted  := False;
      FReport.Engine.Printing := False;
      FReport.Engine.Reset;
    end
  else
    begin
      FReport.Engine.FirstPassCompleted := FFirstPassCompleted;
      FReport.Engine.AbsolutePageCount := FReportAbsolutePageCount;
    end;

  {remove start section from state}
  if (esStartSection in Band.Report.Engine.State) then
    begin
      if FMainSection then
        Band.Report.ESExclude([esStartSection])
      else
        Band.Report.Engine.ESExclude([esStartSection]);
    end;

  {add generate section to state}
  if not(esGenerateSection in Band.Report.Engine.State) then
    begin
      if FMainSection then
        Band.Report.ESInclude([esGenerateSection])
      else
        Band.Report.Engine.ESInclude([esGenerateSection]);
    end;


  TppCustomBand(Band).PrintingSection := True;

  {set page size}
  if not(FReport.Engine.Page.PrinterSetup.IsEqual(FReport.PrinterSetup)) then
    FReport.Engine.Page.PrinterSetup := FReport.PrinterSetup;

  {generate the report}
  GenerateReport;

  FPageGenerated := (FReport.Engine.Page.DrawCommandCount > 0);


  {set overflow indicator}
  OverFlow := not(FReport.Engine.LastBandGenerated);

  SpaceUsed := FReport.Engine.SpaceUsed;

  FReportCompleted := not(OverFlow);


  {check for end of section}
  if not(OverFlow) then
    begin

       if (FMainSection) then
          begin
            Band.Report.ESExclude([esGenerateSection]);
            Band.Report.ESInclude([esEndSection]);
          end
        else
          begin
            Band.Report.Engine.ESExclude([esGenerateSection]);
            Band.Report.Engine.ESInclude([esEndSection]);
          end;

      end;

  {update requested page no, last page cached & page count}
  if (SpaceUsed > 0) then
    begin
      if OverFlow then
        Inc(FReportPageNo);

      FLastPageCached := FReport.AbsolutePageNo;
      FReportAbsolutePageCount := FReport.AbsolutePageCount;
    end
  else
    FLastPageCached := 0;

  FFirstPassCompleted := (FReport.Engine.AllDataTraversed) and (FReport.Engine.LastBandGenerated);

  {update cache with absolutepagecount, lastpagecached and firstpasscompleted}
  UpdateCache;

  {transfer completed page to parent report}
  if FPageGenerated then
    begin
      {set up communication with parent engine}
      Band.Report.Engine.AfterSendPage := SectionAfterSendPageEvent;

      Band.Report.Engine.Page.Assign(FReport.Engine.Page);

      {restore parent page numbers on completed page}
      if not(FResetPageNo) then
        begin
          Band.Report.Engine.Page.PageNo := Band.Report.Engine.PageNo;
          Band.Report.Engine.Page.PageCount := Band.Report.Engine.PageCount;

          Band.Report.Engine.Page.Update(nil);
        end;

      {create a printer device}
      if (FNewPrintJob) and (TppReport(FReport.MainReport).DeviceType = dtPrinter) and FReport.MainReport.Engine.DrawPage then
        CreatePrinterDevice;
        
    end;


  {goto next report}
  if (FReportCompleted) then
    begin
      Inc(FCount);

      FAlreadyPageBreak := False;

      {reset report}
      FReportPageNo := 1;
      FReportAbsolutePageCount := 0;
      FLastPageCached := 0;
      FFirstPassCompleted := False;
      FReport.Engine.Printing := False;
      FReport.Engine.Reset;
      FReport.Engine.Init;
    end;

end; {procedure, GenerateSection}

{------------------------------------------------------------------------------}
{ TppSubReport.SectionAfterSendPageEvent }

procedure TppSubReport.SectionAfterSendPageEvent(Sender: TObject);
begin

  if not(FPageGenerated) then Exit;

  FPageGenerated := False;

  {section printing complete}
  if FReportCompleted then
    begin
      if (FMainSection) then
        Band.Report.ESExclude([esEndSection])
      else
        Band.Report.Engine.ESExclude([esEndSection]);

    end;

  {free printer device}
  if ((FReportCompleted or FReport.MainReport.Engine.GenerateCompleted)) and (FPrinterDevice <> nil) then
    FreePrinterDevice;

  {restore for subsequent pages of parent report}
  if (FMainSection) then
    Band.Report.Engine.Page.PrinterSetup := Band.Report.PrinterSetup;

end; {procedure, SectionAfterSendPageEvent}

{------------------------------------------------------------------------------}
{ TppSubReport.CreatePrinterDevice}

procedure TppSubReport.CreatePrinterDevice;
var
  lMasterReport: TppReport;
begin

  if (FPrinterDevice <> nil) then Exit;

  if (FReport = nil) then Exit;

  lMasterReport := TppReport(FReport.MainReport);

  if (lMasterReport = nil) then Exit;

  {create a printer device}
  FPrinterDevice := TppPrinterDevice.Create(Self);
  FPrinterDevice.Stackable := True;
  FPrinterDevice.Printer.PrinterSetup := FReport.PrinterSetup;

  FPrinterDevice.Publisher := lMasterReport.Publisher;

  FPrinterDevice.StartJob;

end; {procedure, CreatePrinterDevice}

{------------------------------------------------------------------------------}
{ TppSubReport.FreePrinterDevice}

procedure TppSubReport.FreePrinterDevice;
begin

  if (FPrinterDevice <> nil) then
    FPrinterDevice.EndJob;

  FPrinterDevice.Free;

  FPrinterDevice := nil;

end; {procedure, FreePrinterDevice}


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
 ** S U B R E P O R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.RefClass }

class function TraTppSubReportRTTI.RefClass: TClass;
begin
  Result := TppSubReport;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.GetPropList }

class procedure TraTppSubReportRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Report');
  aPropList.AddProp('CreateReport');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.GetPropRec }

class function TraTppSubReportRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Count') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'CreateReport') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'DrillDownComponent') = 0) then
    ClassPropToRec(aPropName, TppComponent, False, aPropRec)

  else if (CompareText(aPropName, 'ExpandAll') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Expansions') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'ExpansionCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'NewPrintJob') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'ParentPrinterSetup') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'PrintBehavior') = 0) then
    EnumPropToRec(aPropName, 'TppPrintBehaviorType', False, aPropRec)

  else if (CompareText(aPropName, 'Report') = 0) then
    ClassPropToRec(aPropName, TppCustomReport, True, aPropRec)

  else if (CompareText(aPropName, 'ResetPageNo') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'TraverseAllData') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.GetParams }

class function TraTppSubReportRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'Expansions') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daString, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'CreateReport') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('MasterReport', daClass, TppReport, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.CallMethod }

class function TraTppSubReportRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lSubReport: TppSubReport;
  liIndex: Integer;
  lsExpansionKey: String;
  lReport: Integer;
begin

  Result := True;
  
  lSubReport := TppSubReport(aObject);

  if (CompareText(aMethodName, 'Expansions') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lsExpansionKey := lSubReport.Expansions[liIndex];

      aParams.SetParamValue(1, lsExpansionKey);
    end

  else if (CompareText(aMethodName, 'CreateReport') = 0) then
    begin
      aParams.GetParamValue(0, lReport);

      lSubReport.CreateReport(TppReport(lReport));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.GetPropValue }

class function TraTppSubReportRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Count') = 0) then
    Integer(aValue) := TppSubReport(aObject).Count

  else if (CompareText(aPropName, 'DrillDownComponent') = 0) then
    Integer(aValue) := Integer(TppSubReport(aObject).DrillDownComponent)

  else if (CompareText(aPropName, 'ExpandAll') = 0) then
    Boolean(aValue) := TppSubReport(aObject).ExpandAll

  else if (CompareText(aPropName, 'ExpansionCount') = 0) then
    Integer(aValue) := TppSubReport(aObject).ExpansionCount

  else if (CompareText(aPropName, 'NewPrintJob') = 0) then
    Boolean(aValue) := TppSubReport(aObject).NewPrintJob

  else if (CompareText(aPropName, 'ParentPrinterSetup') = 0) then
    Boolean(aValue) := TppSubReport(aObject).ParentPrinterSetup

  else if (CompareText(aPropName, 'PrintBehavior') = 0) then
    Integer(aValue) := Ord(TppSubReport(aObject).PrintBehavior)

  else if (CompareText(aPropName, 'Report') = 0) then
    Integer(aValue) := Integer(TppSubReport(aObject).Report)

  else if (CompareText(aPropName, 'ResetPageNo') = 0) then
    Boolean(aValue) := TppSubReport(aObject).ResetPageNo

  else if (CompareText(aPropName, 'TraverseAllData') = 0) then
    Boolean(aValue) := TppSubReport(aObject).TraverseAllData

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppSubReportRTTI.SetPropValue }

class function TraTppSubReportRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'DrillDownComponent') = 0) then
    TppSubReport(aObject).DrillDownComponent := TppComponent(aValue)

  else if (CompareText(aPropName, 'ExpandAll') = 0) then
    TppSubReport(aObject).ExpandAll := Boolean(aValue)

  else if (CompareText(aPropName, 'NewPrintJob') = 0) then
    TppSubReport(aObject).NewPrintJob := Boolean(aValue)

  else if (CompareText(aPropName, 'ParentPrinterSetup') = 0) then
    TppSubReport(aObject).ParentPrinterSetup := Boolean(aValue)

  else if (CompareText(aPropName, 'PrintBehavior') = 0) then
    TppSubReport(aObject).PrintBehavior := TppPrintBehaviorType(aValue)

  else if (CompareText(aPropName, 'ResetPageNo') = 0) then
    TppSubReport(aObject).ResetPageNo := Boolean(aValue)

  else if (CompareText(aPropName, 'TraverseAllData') = 0) then
    TppSubReport(aObject).TraverseAllData := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppSubReportRTTI);

finalization

  raUnRegisterRTTI(TraTppSubReportRTTI);

end.
