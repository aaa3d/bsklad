{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppVar;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls, Menus,
  ppComm, ppDB, ppClass, ppTypes, ppUtils, ppDevice, ppDsgnCt, ppPrnabl, ppStrtch,
  ppDrwCmd, ppCtrls, ppClasUt, ppRTTI;

type

  { TppCustomVariable }
  TppCustomVariable = class(TppCustomText)
    protected
      function GetDataType: TppDataType; virtual; abstract;

      {popup menu event handlers}
      procedure FormatMenuClick(Sender: TObject);
      procedure LookAheadMenuClick(Sender: TObject); virtual;

      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

    public
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PopupMenuClick(Sender: TObject); override;

  end; {class, TppCustomVariable}

  { TppVariable }
  TppVariable = class(TppCustomVariable)
    private
      FBoolean: Boolean;
      FCalcOrder: TTabOrder;
      FCalcComponent: TppCommunicator;
      FCalcType: TppVarEventType;
      FCalcEventType: Integer;
      FChar: Char;
      FCurrency: Currency;
      FDataType: TppDataType;
      FDateTime: TDateTime;
      FDouble: Double;
      FExtended: Extended;
      FLookAhead: Boolean;
      FLookAheadList: TppLookAheadList;
      FInteger: Longint;
      FOldOnCalc: TNotifyEvent;
      FOnCalc: TppVarCalcEvent;
      FOnReset: TppVarCalcEvent;
      FResetComponent: TppCommunicator;
      FResetType: TppVarEventType;
      FResetEventType: Integer;
      FSingle: Single;
      FString: String;

      function  CanCalcLookAheads: Boolean;
      procedure DoOnCalc;
      procedure DoOnReset;
      function  GetCalcOrder: TTabOrder;
      function  GetCalcComponent: TppCommunicator;
      function  GetReportKey: String;
      function  GetResetComponent: TppCommunicator;
      procedure InitLookAhead;
      procedure SetCalcComponent(aCommunicator: TppCommunicator);
      procedure SetCalcOrder(aCalcOrder: TTabOrder);
      procedure SetCalcType(aVarEventType: TppVarEventType);
      procedure SetDataType(aDataType: TppDataType);
      procedure SetEventNotifies;
      procedure SetResetComponent(aCommunicator: TppCommunicator);
      procedure SetResetType(aVarEventType: TppVarEventType);

      procedure SetBoolean(Value: Boolean);
      procedure SetChar(Value: Char);
      procedure SetCurrency(Value: Currency);
      procedure SetDateTime(Value: TDateTime);
      procedure SetDouble(Value: Double);
      procedure SetExtended(Value: Extended);
      procedure SetInteger(Value: Longint);
      procedure SetSingle(Value: Single);
      procedure SetString(Value: String);
      function  ValidNotify(aSource, aTarget: TppCommunicator; aSourceEvent, aTargetEvent: Integer): Boolean;

      function  GetVariant: Variant;
      procedure SetVariant(Value: Variant);
      function  GetCustomValue: Variant;

      procedure SetLookAhead(aValue: Boolean);
      function  GetLookAheadKey: String;
      function  GetIDNo1: Integer;
      function  GetIDNo2: Integer;
      function  GetTraversalCount: Integer;

    protected
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

      function  GetDataType: TppDataType; override;
      function  GetDefaultPropHint: String; override;
      function  GetDescription: String; override;
      function  GetTheText: String; override;
      procedure SetDisplayFormat(const aFormat: String); override;
      procedure SetResetOnCompute(Value: Boolean); override;
      procedure SetUserName(const aUserName: TComponentName); override;

      {popup menu event handlers}
      procedure CalculationsMenuClick(Sender: TObject);
      procedure CalcTimingMenuClick(Sender: TObject);
      procedure LookAheadMenuClick(Sender: TObject); override;

     public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PopupMenuClick(Sender: TObject); override;

      function  EventOrder: String; override;

      procedure Clear; override;
      procedure Compute; override;
      procedure EndOfMainReport; override;
      procedure GetDefaultPropEnumNames(aList: TStrings); override;
      function  GetTheCalcOrder: TTabOrder;
      procedure Init; override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure SetText(Value: String); override;
      procedure StartOfMainReport; override;
      procedure UpdateCalcOrder(aCalcOrder: TTabOrder);

      property AsBoolean: Boolean read FBoolean write SetBoolean;
      property AsChar: Char read FChar write SetChar;
      property AsCurrency: Currency read FCurrency write SetCurrency;
      property AsDateTime: TDateTime read FDateTime write SetDateTime;
      property AsDate: TDateTime read FDateTime write SetDateTime;
      property AsDouble: Double read FDouble write SetDouble;
      property AsExtended: Extended read FExtended write SetExtended;
      property AsInteger: Longint read FInteger write SetInteger;
      property AsSingle: Single read FSingle write SetSingle;
      property AsString: String read FString write SetString;
      property AsTime: TDateTime read FDateTime write SetDateTime;

      {retained for backward compatibility}
      property AsFloat: Double read FDouble write SetDouble;

{$IFDEF WIN32}
      property Value: Variant read GetVariant write SetVariant;
{$ENDIF}

    published
      property Alignment;
      property AutoSize;
      property CalcOrder: TTabOrder read GetCalcOrder write SetCalcOrder default -1;
      property CalcComponent: TppCommunicator read GetCalcComponent  write SetCalcComponent;
      property CalcType: TppVarEventType read FCalcType write SetCalcType default veTraversal;
      property Color;
      property DataType: TppDataType read FDataType write SetDataType default dtString;
      property DisplayFormat;
      property Font;
      property Height stored False;
      property Left stored False;
      property LookAhead: Boolean read FLookAhead write SetLookAhead default False;
      property OldOnCalc: TNotifyEvent read FOldOnCalc write FOldOnCalc;
      property OnCalc: TppVarCalcEvent read FOnCalc write FOnCalc;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnFormat;
      property OnReset: TppVarCalcEvent read FOnReset write FOnReset;
      property ResetComponent: TppCommunicator read GetResetComponent  write SetResetComponent;
      property ResetType: TppVarEventType read FResetType write SetResetType default veReportEnd;
      property Top stored False;
      property Transparent;
      property UserName;
      property Visible;
      property Width stored False;
      property WordWrap;

  end; {class, TppVariable}

  { TppSystemVariable }
  TppSystemVariable = class(TppCustomVariable)
    private
      FVarType: TppVarType;

      procedure SetVarType(aVarType: TppVarType);

      function  GetStandardValue: Variant;

    protected
      function  GetDataType: TppDataType; override;
      function  GetDefaultPropHint: String; override;
      function  GetDescription: String; override;
      function  GetTheText: String; override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetDisplayFormat(const aFormat: String); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure GetDefaultPropEnumNames(aList: TStrings); override;

    published
      property Alignment;
      property AutoSize;
      property VarType: TppVarType read FVarType write SetVarType default vtDate;
      property Color;
      property DisplayFormat;
      property Font;
      property Height stored False;
      property Left stored False;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property Top stored False;
      property Transparent;
      property UserName;
      property Visible;
      property Width stored False;
      property WordWrap;

  end; {class, TppSystemVariable}

  { TppCalc }
  TppCalc = class(TppCustomText)
    private
      FCalcType: TppCalcType;
      FCustomType: TppDataType;
      FOnCalc: TNotifyEvent;

      {used to hold values for 'As' properties}
      FBoolean: Boolean;
      FDateTime: TDateTime;
      FInteger: Longint;
      FDouble: Double;
      FString: String;

      function  GetCustomValue: Variant;
      function  GetStandardValue: Variant;

      procedure SetCustomType(aDataType: TppDataType);
      procedure SetBoolean(Value: Boolean);
      procedure SetDateTime(Value: TDateTime);
      procedure SetDouble(Value: Double);
      procedure SetInteger(Value: Longint);
      procedure SetString(Value: String);

    protected
      {used for conversion to 3.0}
      procedure ReadDataType(Reader: TReader);
      procedure DefineProperties(Filer: TFiler); override;

      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDefaultPropHint: String; override;
      function  GetDescription: String; override;
      function  GetTheText: String; override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetCalcType(aCalcType: TppCalcType); virtual;
      procedure SetDisplayFormat(const aFormat: String); override;
      procedure SetTheDataType;

      {popup menu event handlers}
      procedure FormatMenuClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Clear; override;
      procedure Compute; override;
      procedure GetDefaultPropEnumNames(aList: TStrings); override;
      function  IsCalc: Boolean; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure SetText(Value: String); override;

      {used for conversion to 3.0}
      procedure Convert(aVersionNo: Integer); override;

      property AsBoolean: Boolean read FBoolean write SetBoolean;
      property AsDateTime: TDateTime read FDateTime write SetDateTime;
      property AsDate: TDateTime read FDateTime write SetDateTime;
      property AsTime: TDateTime read FDateTime write SetDateTime;
      property AsFloat: Double read FDouble write SetDouble;
      property AsInteger: Longint read FInteger write SetInteger;
      property AsString: String read FString write SetString;

    published
      property Alignment;
      property AutoSize;
      property CalcType: TppCalcType read FCalcType write SetCalcType default ctDate;
      property Color;
      property CustomType: TppDataType read FCustomType write SetCustomType;
      property DisplayFormat;
      property Font;
      property OnCalc: TNotifyEvent read FOnCalc write FOnCalc;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property Transparent;
      property UserName;
      property Visible;
      property WordWrap;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

      {events}
      property OnFormat;

  end; {class TppCalc}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppVariableRTTI }
  TraTppVariableRTTI = class(TraTppCustomTextRTTI)
    public
      class procedure GetEventList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppVariableRTTI}

  { TraTppSystemVariableRTTI }
  TraTppSystemVariableRTTI = class(TraTppCustomTextRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppSystemVariableRTTI}

implementation

uses
  ppBands, ppForms;

const
  cValidDataTypes = [dtBoolean, dtDate, dtTime, dtDateTime, dtInteger,
                     dtSingle, dtDouble, dtExtended, dtCurrency, dtChar, dtString];


{------------------------------------------------------------------------------}
{ ppCalcDialogRegistered.CalcDialogRegistered }

function ppCalcDialogRegistered: Boolean;
begin
  Result := (ppGetFormClass(TppCustomCalcDialog) <> nil);
end;



{******************************************************************************
 *
 ** C U S T O M   V A R I A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomVariable.PropertiesToDrawCommand }

procedure TppCustomVariable.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  {transfer properties to draw command}
  aDrawCommand.DataType := GetDataType;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomVariable.CreatePopupMenu }

procedure TppCustomVariable.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'DisplayFormat', '',  230); {'DisplayFormat'}
  aPopupMenu.AddItem(30, 'LookAhead', '', 1131); {'LookAhead'}

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppCustomVariable.PopupMenuClick }

procedure TppCustomVariable.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('DisplayFormat').OnClick := FormatMenuClick;
  TppPopupMenu(Sender).ItemByName('LookAhead').OnClick := LookAheadMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppCustomVariable.LookAheadMenuClick }

procedure TppCustomVariable.LookAheadMenuClick(Sender: TObject);
begin

end; {procedure, LookAheadMenuClick}

{------------------------------------------------------------------------------}
{ TppCustomVariable.FormatMenuClick }

procedure TppCustomVariable.FormatMenuClick(Sender: TObject);
var
  lFormatDlg: TppCustomFormatDialog;
  lFormClass: TFormClass;
  lFormats: TStrings;

begin
  if (Band = nil) or (Band.Report = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomFormatDialog);

  lFormatDlg := TppCustomFormatDialog(lFormClass.Create(Application));
  lFormatDlg.LanguageIndex := Band.LanguageIndex;
  lFormatDlg.DisplayFormat := DisplayFormat;

  lFormats := lFormatDlg.DisplayFormats;

  SendDesignMessage(PM_GETDISPLAYFORMATS, ppWCustomMsg, Longint(lFormats));

  {get standard display formats}
  if (lFormats.Count = 0) then
    ppGetDisplayFormats(GetDataType, lFormatDlg.DisplayFormats);

  {set format property}
  if (lFormatDlg.ShowModal = mrOK) then
    DisplayFormat := lFormatDlg.DisplayFormat;

  lFormatDlg.Release;

end; {procedure, FormatMenuClick}

{******************************************************************************
 *
 ** V A R I A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppVariable.Create }

constructor TppVariable.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppVariableSaveRec);
  DefaultPropName := 'DataType';
  DefaultPropEditType := etValueList;
  DrawCommandClass := TppDrawVariable;

  FCalcOrder := -1;
  FCalcComponent := nil;
  FCalcEventType := ciTraversal;
  FCalcType := veTraversal;
  FDataType := dtString;
  FLookAhead := False;
  FLookAheadList := nil;
  FResetComponent := nil;
  FResetEventType := ciEngineEnd;
  FResetType := veReportEnd;
  FOnCalc := nil;
  FOldOnCalc := nil;

  {values}
  FBoolean := False;
  FChar := #0;
  FCurrency := 0;
  FDateTime := Now;
  FDouble := 0;
  FExtended := 0;
  FInteger := 0;
  FSingle := 0;
  FString := '';

end; {function, Create}

{------------------------------------------------------------------------------}
{ TppVariable.Destroy }

destructor TppVariable.Destroy;
begin

  FLookAheadList.Free;

  inherited Destroy;

end; {function, Destroy}

{------------------------------------------------------------------------------}
{ TppVariable.Notify}

procedure TppVariable.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FCalcComponent) then
    FCalcComponent := nil
    
  else if(aCommunicator = FResetComponent) then
    FResetComponent := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppVariable.EventOrder }

function TppVariable.EventOrder: String;
begin
  Result := Band.Rank + Format('%8d',[GetCalcOrder]);
end; {function, EventOrder}

{------------------------------------------------------------------------------}
{ TppVariable.EventNotify }

procedure TppVariable.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  if ValidNotify(aCommunicator, FResetComponent, aEventID, FResetEventType) then
    Clear;

  if ValidNotify(aCommunicator, FCalcComponent, aEventID, FCalcEventType) then
    Compute;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TppVariable.ValidNotify }

function TppVariable.ValidNotify(aSource, aTarget: TppCommunicator; aSourceEvent, aTargetEvent: Integer): Boolean;
begin
  Result := (aSource = aTarget) and (aSourceEvent = aTargetEvent);
end; {procedure, ValidNotify}

{------------------------------------------------------------------------------}
{ TppVariable.PropertiesToDrawCommand }

procedure TppVariable.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawVariable: TppDrawVariable;
  lsLookAheadKey: String;
  lMainReport: TppCustomReport;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  lDrawVariable := TppDrawVariable(aDrawCommand);

  if (FLookAheadList <> nil) then
    begin
      lsLookAheadKey := GetLookAheadKey;

      lDrawVariable.Text := FLookAheadList.RetrieveTotal(lsLookAheadKey, GetTraversalCount, lDrawVariable.Text);

      {make draw command update on-the-fly}
      lMainReport := GetMainReport;

      if (lMainReport <> nil) and (lMainReport.FirstPass) then
        begin
          lDrawVariable.LookAhead := True;
          lDrawVariable.LookAheadKey := lsLookAheadKey;

          AddEventNotify(lDrawVariable.WalkieTalkie);
        end;
    end;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppVariable.LookAheadMenuClick }

procedure TppVariable.LookAheadMenuClick(Sender: TObject);
begin
  LookAhead := not(FLookAhead);
end; {procedure, LookAheadMenuClick}

{------------------------------------------------------------------------------}
{ TppVariable.Init }

procedure TppVariable.Init;
begin

  inherited Init;

  SetEventNotifies;

  if not(CalcType in [veDataPipelineTraversal, veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter]) then
    begin
    
      if (CalcType in [veTraversal, veReportStart, veReportEnd]) then
        SetCalcComponent(Band.Report.Engine)

      else
        SetCalcComponent(Band.Report);

    end;

  if not(ResetType in [veDataPipelineTraversal, veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter]) then
    begin

      if (ResetType in [veTraversal, veReportStart, veReportEnd]) then
        SetResetComponent(Band.Report.Engine)

      else
        SetResetComponent(Band.Report);

    end;

  FBoolean := False;
  FChar := #0;
  FCurrency := 0;
  FDateTime := Now;
  FDouble := 0;
  FExtended := 0;
  FInteger := 0;
  FSingle := 0;
  FString := '';

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppVariable.SetResetOnCompute }

procedure TppVariable.SetResetOnCompute(Value: Boolean);
begin
  inherited SetResetOnCompute(Value);
end; {procedure, SetResetOnCompute}

{------------------------------------------------------------------------------}
{ TppVariable.SetCalcType }

procedure TppVariable.SetCalcType(aVarEventType: TppVarEventType);
begin

  FCalcType := aVarEventType;

  SetEventNotifies;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetCalcType}

{------------------------------------------------------------------------------}
{ TppVariable.SetResetType }

procedure TppVariable.SetResetType(aVarEventType: TppVarEventType);
begin

  FResetType := aVarEventType;

  SetEventNotifies;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetResetType}

{------------------------------------------------------------------------------}
{ TppVariable.SetEventNotifies }

procedure TppVariable.SetEventNotifies;
var
  lEventNotifies: TppEvents;
begin

  FResetEventType := ppVarEventToEvent(FResetType);

  FCalcEventType := ppVarEventToEvent(FCalcType);

  lEventNotifies := [];

  Include(lEventNotifies, FCalcEventType);
  
  Include(lEventNotifies, FResetEventType);

  EventNotifies := lEventNotifies;
  
end; {procedure, SetEventNotifies}

{------------------------------------------------------------------------------}
{ TppVariable.GetCalcComponent }

function TppVariable.GetCalcComponent: TppCommunicator;
begin
  if (csWriting in ComponentState) and not(CalcType in [veDataPipelineTraversal, veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter]) then
    Result := nil
  else
    Result := FCalcComponent;
end; {procedure, GetCalcComponent}

{------------------------------------------------------------------------------}
{ TppVariable.GetResetComponent }

function TppVariable.GetResetComponent: TppCommunicator;
begin
  if (csWriting in ComponentState) and not(ResetType in [veDataPipelineTraversal, veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter]) then
    Result := nil
  else
    Result := FResetComponent;
end; {procedure, GetResetComponent}

{------------------------------------------------------------------------------}
{ TppVariable.SetCalcComponent }

procedure TppVariable.SetCalcComponent(aCommunicator: TppCommunicator);
begin

  if (FCalcComponent <> nil) then
    FCalcComponent.RemoveEventNotify(Self);

  FCalcComponent := aCommunicator;

  if (FCalcComponent <> nil) then
    FCalcComponent.AddEventNotify(Self);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetCalcComponent}

{------------------------------------------------------------------------------}
{ TppVariable.SetResetComponent }

procedure TppVariable.SetResetComponent(aCommunicator: TppCommunicator);
begin

  if (FResetComponent <> nil) then
    FResetComponent.RemoveEventNotify(Self);

  FResetComponent := aCommunicator;

  if (FResetComponent <> nil) then
    FResetComponent.AddEventNotify(Self);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetResetComponent}

{------------------------------------------------------------------------------}
{ TppVariable.GetTheCalcOrder }

function TppVariable.GetTheCalcOrder: TTabOrder;
begin
  Result := FCalcOrder;
end; {function, GetTheCalcOrder}

{------------------------------------------------------------------------------}
{ TppVariable.GetCalcOrder }

function TppVariable.GetCalcOrder: TTabOrder;
begin
  if (Band <> nil) then
    Result := Band.IndexOfVariable(Self)
  else
    Result := -1;
end; {function, GetCalcOrder}

{------------------------------------------------------------------------------}
{ TppVariable.SetCalcOrder }

procedure TppVariable.SetCalcOrder(aCalcOrder: TTabOrder);
begin

  if csReading in ComponentState then
    FCalcOrder := aCalcOrder
  else
    begin
      UpdateCalcOrder(aCalcOrder);

      PropertyChange;

      Reset;
    end;

end; {function, SetCalcOrder}

{------------------------------------------------------------------------------}
{ TppVariable.UpdateCalcOrder }

procedure TppVariable.UpdateCalcOrder(aCalcOrder: TTabOrder);
var
  liVarIndex: Integer;
  liVarCount: Integer;
begin

  liVarIndex := GetCalcOrder;
  liVarCount := Band.VariableCount;

  {doctor value until it is valid}
  if aCalcOrder < 0 then
    aCalcOrder := 0;

  if (liVarCount > 0) and (aCalcOrder >= liVarCount) then
    aCalcOrder := liVarCount - 1;

  if (aCalcOrder <> liVarIndex) then
    begin
      {remove from old position}
      if (liVarIndex >= 0) then
        Band.RemoveVariable(Self);

      {insert into new position}
      Band.InsertVariable(aCalcOrder, Self);
    end;

end; {procedure, UpdateCalcOrder}

{------------------------------------------------------------------------------}
{ TppVariable.GetDataType }

function TppVariable.GetDataType: TppDataType;
begin
  Result := FDataType;
end; {function, GetDataType}

{------------------------------------------------------------------------------}
{ TppVariable.SetDisplayFormat }

procedure TppVariable.SetDisplayFormat(const aFormat: String);
begin

  inherited SetDisplayFormat(aFormat);

  {set design time caption}
  if (pppcDesigning in DesignState) and not(Printing) then
    Caption := GetText;

end; {function, SetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppVariable.SetText }

procedure TppVariable.SetText(Value: String);
begin
  SetString(Value);

  inherited SetText(Value);
end; {procedure, SetText}

{------------------------------------------------------------------------------}
{ TppVariable.GetDescription }

function TppVariable.GetDescription: String;
begin
  Result := UserName;
end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TppVariable.DoOnCalc }

procedure TppVariable.DoOnCalc;
var
  lValue: Variant;
  lOldValue: Variant;
  lParams: TraParamList;
begin

  lValue := Value;

  if Assigned(FOnCalc) then
    begin
      lOldValue := lValue;

      FOnCalc(Self, lValue);

      if (VarType(lValue) <> VarType(lOldValue)) or (lValue <> lOldValue ) then
        SetVariant(lValue);
    end

  else if Assigned(FOldOnCalc) then
    FOldOnCalc(Self);

  lValue := Value;
  lOldValue := lValue;

  lParams := TraTppVariableRTTI.GetParams('OnCalc');
  lParams.CreateValuePointer(0, lValue);

  SendEventNotify(Self, ciComponentCalc, lParams);

  lParams.Free;

  {update value with modified variant}
  if (VarType(lValue) <> VarType(lOldValue)) or (lValue <> lOldValue ) then
    SetVariant(lValue);

  {these events fire after the cache has been written, so we must update it}
  if FCalcType in [vePageEnd, veColumnEnd] then
    SaveToCache(Band.Report.AbsolutePageNo);

  {update lookahead totals}
  if (FLookAheadList <> nil) and (GetMainReport.FirstPass) then
    FLookAheadList.UpdateTotal(GetLookAheadKey, GetTraversalCount, Text);

end; {procedure, DoOnCalc}

{------------------------------------------------------------------------------}
{ TppVariable.DoOnReset }

procedure TppVariable.DoOnReset;
var
  lValue: Variant;
  lOldValue: Variant;
  lParams: TraParamList;
begin

  lValue := Value;

  if Assigned(FOnReset) then
    begin
      lOldValue := lValue;

      FOnReset(Self, lValue);

      if (VarType(lValue) <> VarType(lOldValue)) or (lValue <> lOldValue ) then
        SetVariant(lValue);
    end;

  lValue := Value;
  lOldValue := lValue;

  lParams := TraTppVariableRTTI.GetParams('OnReset');
  lParams.CreateValuePointer(0, lValue);

  SendEventNotify(Self, ciComponentReset, lParams);

  lParams.Free;

  {update value with modified variant}
  if (VarType(lValue) <> VarType(lOldValue)) or (lValue <> lOldValue ) then
    SetVariant(lValue);

  {these events fire after the cache has been written, so we must update it}
  if FResetType in [vePageEnd, veColumnEnd] then
    SaveToCache(Band.Report.AbsolutePageNo);

end; {procedure, DoOnReset}
{------------------------------------------------------------------------------}
{ TppVariable.Compute }

procedure TppVariable.Compute;
begin

  if not(Printing) then Exit;

 { if ResetOnCompute then Clear;}

  DoOnCalc;

end; {procedure, Compute}

{------------------------------------------------------------------------------}
{ TppVariable.Clear }

procedure TppVariable.Clear;
begin
  inherited Clear;

  FBoolean := False;
  FChar := #0;
  FCurrency := 0;
  FDateTime := Now;
  FDouble := 0;
  FExtended := 0;
  FInteger := 0;
  FSingle := 0;
  FString := '';

  DoOnReset;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppVariable.GetDefaultPropHint }

function TppVariable.GetDefaultPropHint: String;
begin
  Result := ppLoadStr(379); {data type}
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TppVariable.GetDefaultPropEnumNames }

procedure TppVariable.GetDefaultPropEnumNames(aList: TStrings);
begin

  aList.Clear;

  aList.Add(ppLoadStr(363)); {boolean}
  aList.Add(ppLoadStr(303)); {date}
  aList.Add(ppLoadStr(311)); {time}
  aList.Add(ppLoadStr(304)); {datetime}
  aList.Add(ppLoadStr(334)); {integer}
  aList.Add(ppLoadStr(335)); {single}
  aList.Add(ppLoadStr(337)); {double}
  aList.Add(ppLoadStr(339)); {extended}
  aList.Add(ppLoadStr(341)); {currency}
  aList.Add(ppLoadStr(409)); {char}
  aList.Add(ppLoadStr(324)); {string}

end; {procedure, GetDefaultPropEnumNames}

{------------------------------------------------------------------------------}
{ TppVariable.SetLookAhead }

procedure TppVariable.SetLookAhead(aValue: Boolean);
var
  lMainReport: TppCustomReport;
begin

  if Printing then Exit;

  FLookAhead := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FLookAhead) then
    begin
      lMainReport := GetMainReport;

      if (lMainReport <> nil) then
        lMainReport.PassSetting := psTwoPass;
    end;

  PropertyChange;

  Reset;

end; {procedure, SetLookAhead}

{------------------------------------------------------------------------------}
{ TppVariable.CanCalcLookAheads }

function TppVariable.CanCalcLookAheads: Boolean;
var
  lMainReport: TppCustomReport;
begin

  lMainReport := GetMainReport;

  Result := (lMainReport <> nil) and (lMainReport.PassSetting = psTwoPass) and FLookAhead;

end; {procedure, CanCalcLookAheads}

{------------------------------------------------------------------------------}
{ TppVariable.StartOfMainReport }

procedure TppVariable.StartOfMainReport;
begin
  InitLookAhead;
end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppVariable.EndOfMainReport }

procedure TppVariable.EndOfMainReport;
begin
  FLookAheadList.SignOffTotals;
end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppVariable.InitLookAhead }

procedure TppVariable.InitLookAhead;
var
  lReport: TppCustomReport;
begin

  if (FLookAheadList <> nil) then
    begin
      FLookAheadList.Free;

      FLookAheadList := nil;
    end;

  if not(CanCalcLookAheads) then Exit;

  FLookAheadList := TppLookAheadList.CreateList(Self);

  lReport := GetReport;

  if (lReport <> nil) and (lReport.Engine <> nil) then
    lReport.Engine.AddEventNotify(Self);

end; {procedure, InitLookAhead}

{------------------------------------------------------------------------------}
{ TppVariable.GetTraversalCount }

function TppVariable.GetTraversalCount: Integer;
begin

  if (FCalcComponent is TppDataPipeline) then
    Result := TppDataPipeline(FCalcComponent).TraversalCount

  else if (Band is TppDetailBand) and (TppDetailBand(Band).DataPipeline <> nil) then
    Result := TppDetailBand(Band).DataPipeline.TraversalCount

  else if (Band.Report.DataPipeline <> nil) then
    Result := Band.Report.DataPipeline.TraversalCount

  else
    Result := 0;

end; {function, GetTraversalCount}

{------------------------------------------------------------------------------}
{ TppVariable.GetReportKey }

function TppVariable.GetReportKey: String;
var
  lsKey: String;
begin

  if (CanCalcLookAheads) and (Band.Report <> Band.Report.MainReport) then
    begin
      lsKey := '';

      Band.Report.GetReportKey(lsKey);

      Result := lsKey;
    end
  else
    Result := '';

end; {procedure, GetReportKey}

{------------------------------------------------------------------------------}
{ TppVariable.GetLookAheadKey }

function TppVariable.GetLookAheadKey: String;
begin
  Result := GetReportKey + Format('%8d', [GetIDNo1]) + '|' + Format('%8d', [GetIDNo2]);
end; {function, GetLookAheadKey}

{------------------------------------------------------------------------------}
{ TppVariable.GetIDNo1 }

function TppVariable.GetIDNo1: Integer;
begin

  Result := 0;

  case FResetType of

    vePageStart, vePageEnd, veColumnStart, veColumnEnd:
      Result := Band.Report.AbsolutePageNo;

    veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter:
      if (FResetComponent is TppGroup) then
        Result := TppGroup(FResetComponent).BreakNo;

    veDataPipelineTraversal:
      if (FResetComponent is TppDataPipeline) then
        Result := TppDataPipeline(FResetComponent).TraversalCount;

    veTraversal:
      Result := GetTraversalCount;

  end;

end; {function, GetIDNo1}

{------------------------------------------------------------------------------}
{ TppVariable.GetIDNo2 }

function TppVariable.GetIDNo2: Integer;
begin

  case FResetType of

    veColumnStart, veColumnEnd:
      Result := Band.Report.CurrentColumn;

    else
      Result := 0;

  end;

end; {function, GetIDNo2}

{------------------------------------------------------------------------------}
{ TppVariable.SetDataType }

procedure TppVariable.SetDataType(aDataType: TppDataType);
begin
  if (aDataType in cValidDataTypes) then
    FDataType := aDataType;

  PropertyChange;
  Reset;

end; {procedure, SetDataType}

{------------------------------------------------------------------------------}
{ TppVariable.SetBoolean }

procedure TppVariable.SetBoolean(Value: Boolean);
begin

  FBoolean := Value;

  FDataType := dtBoolean;

  PropertyChange;
  Reset;

end; {procedure, SetBoolean}

{------------------------------------------------------------------------------}
{ TppVariable.SetChar }

procedure TppVariable.SetChar(Value: Char);
begin
  FChar := Value;
  FDataType := dtChar;

  PropertyChange;
  Reset;

end; {procedure, SetChar}

{------------------------------------------------------------------------------}
{ TppVariable.SetCurrency }

procedure TppVariable.SetCurrency(Value: Currency);
begin
  FCurrency := Value;
  FDataType := dtCurrency;

  PropertyChange;
  Reset;
end; {procedure, SetCurrency}

{------------------------------------------------------------------------------}
{ TppVariable.SetDateTime }

procedure TppVariable.SetDateTime(Value: TDateTime);
begin
  FDateTime := Value;
  FDataType := dtDateTime;

  PropertyChange;
  Reset;
end; {procedure, SetDateTime}

{------------------------------------------------------------------------------}
{ TppVariable.SetDouble }

procedure TppVariable.SetDouble(Value: Double);
begin
  FDouble := Value;
  FDataType := dtDouble;

  PropertyChange;
  Reset;
end; {procedure, SetDouble}

{------------------------------------------------------------------------------}
{ TppVariable.SetExtended }

procedure TppVariable.SetExtended(Value: Extended);
begin
  FExtended := Value;
  FDataType := dtExtended;

  PropertyChange;
  Reset;
end; {procedure, SetExtended}

{------------------------------------------------------------------------------}
{ TppVariable.SetInteger }

procedure TppVariable.SetInteger(Value: Longint);
begin
  FInteger := Value;
  FDataType := dtInteger;

  if Printing then Exit;

  PropertyChange;

  Reset;
  
end; {procedure, SetInteger}

{------------------------------------------------------------------------------}
{ TppVariable.SetSingle }

procedure TppVariable.SetSingle(Value: Single);
begin
  FSingle := Value;
  FDataType := dtSingle;

  PropertyChange;
  Reset;
end; {procedure, SetSingle}

{------------------------------------------------------------------------------}
{ TppVariable.SetString }

procedure TppVariable.SetString(Value: String);
begin
  FString := Value;
  FDataType := dtString;

  PropertyChange;
  Reset;
end; {procedure, SetString}

{------------------------------------------------------------------------------}
{ TppVariable.RestoreFromCache }

procedure TppVariable.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppVariableSaveRec;
begin
  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent := lRec.FDrawComponent;
  ResetOnCompute := lRec.FResetOnCompute;

  FInteger := lRec.FInteger;
  FChar := lRec.FChar;
  FBoolean := lRec.FBoolean;
  FCurrency := lRec.FCurrency;
  FDateTime := lRec.FDateTime;
  FDouble := lRec.FDouble;
  FExtended := lRec.FExtended;
  FSingle := lRec.FSingle;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppVariable.SaveToCache }

procedure TppVariable.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppVariableSaveRec;
begin
  lRec.FDrawComponent := DrawComponent;
  lRec.FResetOnCompute := ResetOnCompute;

  lRec.FInteger := FInteger;
  lRec.FChar := FChar;
  lRec.FBoolean := FBoolean;
  lRec.FCurrency := FCurrency;
  lRec.FDateTime := FDateTime;
  lRec.FDouble := FDouble;
  lRec.FExtended := FExtended;
  lRec.FSingle := FSingle;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppVariable.GetVariant }

function TppVariable.GetVariant: Variant;
begin

  case FDataType of
    dtBoolean:   Result    := FBoolean;
    dtChar:      Result    := FChar;
    dtCurrency:  Result    := FCurrency;
    dtDouble:    Result    := FDouble;
    dtExtended:  Result    := FExtended;
    dtDate,
    dtTime,
    dtDateTime:  Result    := FDateTime;
    dtInteger:   Result    := FInteger;
    dtSingle:    Result    := FSingle;
    dtString:    Result    := FString;
  end;

end; {procedure, GetVariant}

{------------------------------------------------------------------------------}
{ TppVariable.SetVariant }

procedure TppVariable.SetVariant(Value: Variant);
begin

  {if Null or Empty, assignment will raise exception}
  if VarType(Value) in [varNull, varEmpty] then Exit;

  case FDataType of
    dtBoolean:   FBoolean  := Boolean(Value);
    dtChar:      FChar     := String(Value)[1];
    dtCurrency:  FCurrency := Currency(Value);
    dtDouble:    FDouble   := Double(Value);
    dtExtended:  FExtended := Extended(Value);
    dtDate,
    dtTime,
    dtDateTime:  FDateTime := TDateTime(Value);
    dtInteger:   FInteger  := Integer(Value);
    dtSingle:    FSingle   := Single(Value);
    dtString:    FString   := String(Value);
  end;

  PropertyChange;

  Reset;

end; {procedure, SetVariant}

{------------------------------------------------------------------------------}
{ TppVariable.GetTheText }

function TppVariable.GetTheText: String;
var
  lsText: String;
  lsFormat: String;
  lValue: Variant;
begin

  lValue := GetCustomValue;

  if (pppcDesigning in DesignState) and not(Printing) then
    lsText := lValue
    
  else
    begin
      if Assigned(OnFormat) then
        lsFormat := ''
      else
        lsFormat := DisplayFormat;

      lsText := ppFormat(lsFormat, FDataType, lValue);
    end;

  if Assigned(OnFormat) then
    OnFormat(Self, DisplayFormat, FDataType, lValue, lsText);

  Result := lsText;

end; {function, GetTheText}

{------------------------------------------------------------------------------}
{ TppVariable.GetCustomValue }

function TppVariable.GetCustomValue: Variant;
begin

  {show 'Custom' as caption}
  if (pppcDesigning in DesignState) and not(Printing) then
    Result :=  UserName

  else
      case FDataType of

        dtBoolean:     Result := FBoolean;

        dtChar:        Result := FChar;

        dtCurrency:    Result := FCurrency;

        dtDouble:      Result := FDouble;

        dtExtended:    Result := FExtended;

        dtDate,
        dtTime,
        dtDateTime:    Result := FDateTime;

        dtInteger:     Result := FInteger;

        dtSingle:      Result := FSingle;

        dtString:      Result := FString;

      else
        Result := '';

      end; {case}


end; {function, GetCustomValue}

{------------------------------------------------------------------------------}
{ TppVariable.CreatePopupMenu }

procedure TppVariable.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'Calculations', '', 228); {'Calculations...'}
  aPopupMenu.AddItem(30, 'Timing', '', 689); {'Timing...'}

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppVariable.PopupMenuClick }

procedure TppVariable.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;

begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  {set visibility based on whether CalcDialog is currently registered}
  lPopupMenu.ItemByName('Calculations').Visible := ppCalcDialogRegistered;

  lPopupMenu.ItemByName('Calculations').OnClick := CalculationsMenuClick;
  lPopupMenu.ItemByName('Timing').OnClick := CalcTimingMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppVariable.CalculationsMenuClick }

procedure TppVariable.CalculationsMenuClick(Sender: TObject);
var
  lDialog: TppCustomCalcDialog;
  lFormClass: TFormClass;
  lReport: TppCustomReport;

begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  lReport := Band.Report;

  {create the dialog and initialize}
  lFormClass := ppGetFormClass(TppCustomCalcDialog);

  if (lFormClass = nil) then Exit;

  lDialog := TppCustomCalcDialog(lFormClass.Create(Application));

  lDialog.LanguageIndex := lReport.LanguageIndex;

  lDialog.Report := GetReport;

  {display the dialog}
  lDialog.ShowModal;

  lDialog.Release;

end; {procedure, CalculationsMenuClick}

{------------------------------------------------------------------------------}
{ TppVariable.CalcTimingMenuClick }

procedure TppVariable.CalcTimingMenuClick(Sender: TObject);
var
  lDialog: TppCustomCalcTimingDialog;
  lFormClass: TFormClass;
  liGroup: Integer;
  liGroups: Integer;
  lGroup: TppGroup;
  lDescriptions: TStrings;
  lReport: TppCustomReport;
  lDataPipelines: TppDataPipelineList;
begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  lReport := Band.Report;

  {create the dialog and initialize}
  lFormClass := ppGetFormClass(TppCustomCalcTimingDialog);
  lDialog := TppCustomCalcTimingDialog(lFormClass.Create(Application));

  lDialog.LanguageIndex := lReport.LanguageIndex;

  lDialog.CalcComponent := CalcComponent;
  lDialog.CalcType := Ord(CalcType);
  lDialog.ResetComponent := ResetComponent;
  lDialog.ResetType := Ord(ResetType);

  {add list of group descriptions }
  lDescriptions := lDialog.Groups;
  liGroups := lReport.GroupCount - 1;

  for liGroup := 0 to liGroups do
    begin
      lGroup := lReport.Groups[liGroup];

      lDescriptions.AddObject(lGroup.Description, lGroup);
    end;

  lDataPipelines := TppDataPipelineList.Create(Band.Report);
  lDialog.DataPipelines := lDataPipelines;
  lDialog.Report := GetReport;

  {display the dialog}
  if (lDialog.ShowModal = mrOK) then
    begin
      SetCalcType(TppVarEventType(lDialog.CalcType));
      SetResetType(TppVarEventType(lDialog.ResetType));

      SetCalcComponent(TppCommunicator(lDialog.CalcComponent));
      SetResetComponent(TppCommunicator(lDialog.ResetComponent));
    end;

  lDataPipelines.Free;
  lDialog.Release;

end; {procedure, CalcTimingMenuClick}

{------------------------------------------------------------------------------}
{ TppVariable.SetUserName }

procedure TppVariable.SetUserName(const aUserName: TComponentName);
begin

  inherited SetUserName(aUserName);

  Caption := UserName;

end;  {procedure, SetUserName}


{******************************************************************************
 *
 ** S Y S T E M   V A R I A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSystemVariable.Create }

constructor TppSystemVariable.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DefaultPropName := 'VarType';
  DefaultPropEdittype := etValueList;
  DrawCommandClass := TppDrawVar;

  FVarType := vtDate;

end; {function, Create}

{------------------------------------------------------------------------------}
{ TppSystemVariable.Destroy }

destructor TppSystemVariable.Destroy;
begin

  inherited Destroy;

end; {function, Destroy}

{------------------------------------------------------------------------------}
{ TppSystemVariable.SetVarType }

procedure TppSystemVariable.SetVarType(aVarType: TppVarType);
var
  lMainReport: TppCustomReport;
begin

  FVarType := aVarType;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FVarType in [vtPageSet, vtPageSetDesc]) then
    begin
      lMainReport := GetMainReport;

      if (lMainReport <> nil) then
        lMainReport.PassSetting := psTwoPass;
    end;

  {set design time caption}
  if (pppcDesigning in DesignState) and not(Printing) then
    begin
      Caption := GetText;

      PropertyChange;

      Reset;
    end;

end; {function, SetVarType}

{------------------------------------------------------------------------------}
{ TppSystemVariable.SetDisplayFormat }

procedure TppSystemVariable.SetDisplayFormat(const aFormat: String);
begin

  inherited SetDisplayFormat(aFormat);

  {set design time caption}
  if (pppcDesigning in DesignState) and not (Printing) then
    Caption := GetText;

end; {function, SetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetDefaultPropEnumNames }

procedure TppSystemVariable.GetDefaultPropEnumNames(aList: TStrings);
begin

  aList.Clear;

  aList.Add(ppLoadStr(303));
  aList.Add(ppLoadStr(304));
  aList.Add(ppLoadStr(305));
  aList.Add(ppLoadStr(306));
  aList.Add(ppLoadStr(307));
  aList.Add(ppLoadStr(308));
  aList.Add(ppLoadStr(309));
  aList.Add(ppLoadStr(310));
  aList.Add(ppLoadStr(311));

end; {procedure, GetDefaultPropEnumNames}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetDefaultPropHint }

function TppSystemVariable.GetDefaultPropHint: String;
begin
  Result := ppLoadStr(378);
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetDescription }

function TppSystemVariable.GetDescription: String;
var
  lsCaption: String;

begin
  {format design time caption}
  case FVarType of

    vtDate          : lsCaption := ppLoadStr(303);
    vtDateTime      : lsCaption := ppLoadStr(304);
    vtPrintDateTime : lsCaption := ppLoadStr(305);
    vtPageCount     : lsCaption := ppLoadStr(306);
    vtPageSet       : lsCaption := ppLoadStr(307);
    vtPageSetDesc   : lsCaption := ppLoadStr(308);
    vtPageNo        : lsCaption := ppLoadStr(309);
    vtPageNoDesc    : lsCaption := ppLoadStr(310);
    vtTime          : lsCaption := ppLoadStr(311);

  end; {case, CalcType}


  Result := UserName + ': ' + lsCaption

end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetDataType }

function TppSystemVariable.GetDataType: TppDataType;
begin

  case FVarType of

    vtDate:           Result := dtDate;
    vtDateTime:       Result := dtDateTime;
    vtPageCount:      Result := dtInteger;
    vtPageSet:        Result := dtString;
    vtPageSetDesc:    Result := dtString;
    vtPageNo:         Result := dtInteger;
    vtPageNoDesc:     Result := dtString;
    vtPrintDateTime:  Result := dtDateTime;
    vtTime:           Result := dtTime;

    else              Result := dtNotKnown;

  end; {case, VarType}

end; {function, GetDataType}

{------------------------------------------------------------------------------}
{ TppSystemVariable.PropertiesToDrawCommand }

procedure TppSystemVariable.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawVar;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawVar) then Exit;

  lDrawCommand := TppDrawVar(aDrawCommand);

  {transfer properties to draw command}
  lDrawCommand.VarType  := FVarType;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetStandardValue }

function TppSystemVariable.GetStandardValue: Variant;
var
  liPageNo: Integer;
begin

  case FVarType of

    vtDate:
      Result := Date;

    vtDateTime:
      Result := Now;

    vtPageCount:
      if (Printing) then
        Result := Band.Report.PageCount
      else
        Result := 1;

    vtPageSet, vtPageSetDesc, vtPageNoDesc:
      begin
        liPageNo := Band.Report.PageNo;

        Result := ppFormatVarValue(FVarType, liPageNo, Band.Report.PageCount,
                                   Band.Report.PrintDateTime, Band.LanguageIndex, Printing);
      end;

   vtPageNo:
     if (Printing) then
       Result := Band.Report.PageNo
     else
       Result := 1;


    vtPrintDateTime:
      if (Printing) then
        Result := Band.Report.PrintDateTime
      else
        Result := Now;

    vtTime:
      Result := Time;

  end; {case, vartype}


end; {procedure, GetStandardValue}

{------------------------------------------------------------------------------}
{ TppSystemVariable.GetTheText }

function TppSystemVariable.GetTheText: String;
var
  lsText: String;
  lsFormat: String;
  lValue: Variant;
begin

  case FVarType of

    vtDate, vtTime, vtDateTime, vtPageCount, vtPageNo, vtPrintDateTime:
      begin
        if Assigned(OnFormat) then
          lsFormat := ''
        else
          lsFormat := DisplayFormat;

        lValue := GetStandardValue;
        lsText := ppFormat(lsFormat, GetDataType, lValue);
      end;

    vtPageSet, vtPageSetDesc, vtPageNoDesc:
      begin
        lValue := GetStandardValue;
        lsText := lValue;
      end;

  end; {case, vartype}

  if Assigned(OnFormat) then
    OnFormat(Self, DisplayFormat, GetDataType, lValue, lsText);

  Result := lsText;

end; {function, GetTheText}


{******************************************************************************
 *
 ** C A L C
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCalc.Create }

constructor TppCalc.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppCalcSaveRec);

  DrawCommandClass := TppDrawCalc;

  FCalcType   := ctDate;
  FCustomType := dtDateTime;
  FOnCalc     := nil;

  FBoolean  := False;
  FDateTime := Now;
  FInteger  := 0;
  FDouble   := 0;
  FString   := '';

  DefaultPropName     := 'CalcType';
  DefaultPropEdittype := etValueList;

end; {function, Create}

{------------------------------------------------------------------------------}
{ TppCalc.Destroy }

destructor TppCalc.Destroy;
begin

  inherited Destroy;

end; {function, Destroy}

{------------------------------------------------------------------------------}
{ TppCalc.Convert }

procedure TppCalc.Convert(aVersionNo: Integer);
begin

  inherited Convert(aVersionNo);

  if (aVersionNo < 3000) then
    SetTheDataType;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppCalc.IsCalc }

function TppCalc.IsCalc: Boolean;
begin
  Result := True;
end; {function, IsCalc}


{------------------------------------------------------------------------------}
{ TppCalc.GetDefaultPropHint }

function TppCalc.GetDefaultPropHint: String;
begin
  {do not convert, this is a deprecated component}
  Result := 'Calc Types';
end; {function, GetDefaultPropHint}


{------------------------------------------------------------------------------}
{ TppCalc.PropertiesToDrawCommand }

procedure TppCalc.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawCalc;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawCalc) then Exit;

  lDrawCommand := TppDrawCalc(aDrawCommand);

  {transfer properties to draw command}
  lDrawCommand.CalcType := FCalcType;
  lDrawCommand.DataType := FCustomType;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCalc.SetBoolean }

procedure TppCalc.SetBoolean(Value: Boolean);
begin
 FBoolean  := Value;
 FCustomType := dtBoolean;
end;

{------------------------------------------------------------------------------}
{ TppCalc.SetDateTime }

procedure TppCalc.SetDateTime(Value: TDateTime);
begin
  FDateTime := Value;
  FCustomType := dtDateTime;
end;

{------------------------------------------------------------------------------}
{ TppCalc.SetDouble }

procedure TppCalc.SetDouble(Value: Double);
begin
  FDouble   := Value;
  FCustomType := dtDouble;
end;

{------------------------------------------------------------------------------}
{ TppCalc.SetInteger }

procedure TppCalc.SetInteger(Value: Longint);
begin
  FInteger  := Value;
  FCustomType := dtInteger;
end;

{------------------------------------------------------------------------------}
{ TppCalc.SetString }

procedure TppCalc.SetString(Value: String);
begin
  FString   := Value;
  FCustomType := dtString;
end;


{------------------------------------------------------------------------------}
{ TppCalc.SetText }

procedure TppCalc.SetText(Value: String);
begin

  if (FCalcType = ctCustom) then
    begin
      SetString(Value);
      inherited SetText(Value);
    end;

end;

{------------------------------------------------------------------------------}
{ TppCalc.GetDescription }

function TppCalc.GetDescription: String;
var
  lsCaption: String;

begin
  {format design time caption}
  case FCalcType of

    ctDate          : lsCaption := ppLoadStr(303);
    ctDateTime      : lsCaption := ppLoadStr(304);
    ctPrintDateTime : lsCaption := ppLoadStr(305);
    ctPageCount     : lsCaption := ppLoadStr(306);
    ctPageSet       : lsCaption := ppLoadStr(307);
    ctPageSetDesc   : lsCaption := ppLoadStr(308);
    ctPageNo        : lsCaption := ppLoadStr(309);
    ctPageNoDesc    : lsCaption := ppLoadStr(310);
    ctTime          : lsCaption := ppLoadStr(311);
    ctCustom        : lsCaption := 'Custom';

  end; {case, CalcType}


  Result := Name + ': ' + lsCaption

end;


{------------------------------------------------------------------------------}
{ TppCalc.SetCalcType }

procedure TppCalc.SetCalcType(aCalcType: TppCalcType);
begin

  FCalcType := aCalcType;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  SetTheDataType;

  {set design time caption}
  if (pppcDesigning in DesignState) and not (Printing) then
    begin
      Caption := GetText;
      PropertyChange;
    end;

end; {function, SetCalcType}

{------------------------------------------------------------------------------}
{ TppCalc.GetTheText }

function TppCalc.GetTheText: String;
var
  lsText: String;
  lsStdFormat: String;
  lValue: Variant;

begin


  if Assigned(OnFormat) then
    lsStdFormat := ''
  else
    lsStdFormat := DisplayFormat;

  {format lsValue, if necessary}
  case FCalcType of

    ctDate, ctTime, ctDateTime, ctPageCount, ctPageNo, ctPrintDateTime:
      begin
        lValue := GetStandardValue;
        lsText := ppFormat(lsStdFormat, FCustomType, lValue);
      end;

    ctPageSet, ctPageSetDesc, ctPageNoDesc:
      begin
        lValue := GetStandardValue;
        lsText := lValue;
      end;

    ctCustom:
      begin
        lValue := GetCustomValue;

        if (pppcDesigning in DesignState) and not(Printing) then
          lsText := lValue
        else
          lsText := ppFormat(lsStdFormat, FCustomType, lValue);
      end;

    else
      begin
        lValue := '';
        lsText := '';
      end;

  end; {case, calctype}

  if Assigned(OnFormat) then
    OnFormat(Self, DisplayFormat, FCustomType, lValue, lsText);

  Result := lsText;

end; {function, GetTheText}

{------------------------------------------------------------------------------}
{ TppCalc.GetCustomValue }

function TppCalc.GetCustomValue: Variant;
begin

   { (end-user designing but not printing) then show 'Custom' as caption }
  if ((pppcDesigning in DesignState) and not (Printing)) then

    Result := 'Custom'

  else
      case FCustomType of

        dtDate, dtTime, dtDateTime:
          Result := FDateTime;

        dtInteger:
          Result := FInteger;

        dtDouble:
          Result := FDouble;

        dtString:
          Result := FString;

        dtBoolean:
          Result := FBoolean;

      else
        Result := '';

      end; {case}


end; {function, GetCustomValue}

{------------------------------------------------------------------------------}
{ TppCalc.GetStandardValue }

function TppCalc.GetStandardValue: Variant;
begin

  case FCalcType of

    ctDate:
      Result := Date;

    ctDateTime:
      Result := Now;

    ctPageCount:
      if (Printing) then
        Result := Band.Report.PageCount
      else
        Result := 1;

    ctPageSet, ctPageSetDesc, ctPageNoDesc:
      Result := ppFormatCalcValue(FCalcType, Band.Report.PageNo, Band.Report.PageCount,
                              Band.Report.PrintDateTime, Band.LanguageIndex, Printing);

   ctPageNo:
     if (Printing) then
       Result := Band.Report.PageNo
     else
       Result := 1;


    ctPrintDateTime:
      if (Printing) then
        Result := Band.Report.PrintDateTime
      else
        Result := Now;

    ctTime:
      Result := Time;


  end; {case, calctype}


end; {procedure, GetStandardValue}

{------------------------------------------------------------------------------}
{ TppCalc.SetTheDataType }

procedure TppCalc.SetTheDataType;
begin
  case FCalcType of

    ctDate:
      FCustomType := dtDate;

    ctDateTime:
      FCustomType := dtDateTime;

    ctPageCount:
      FCustomType := dtInteger;

    ctPageSet:
      FCustomType := dtString;

    ctPageSetDesc:
      FCustomType := dtString;

    ctPageNo:
      FCustomType := dtInteger;

    ctPageNoDesc:
      FCustomType := dtString;

    ctPrintDateTime:
      FCustomType := dtDateTime;

    ctTime:
      FCustomType := dtTime;

    ctCustom:
      FCustomType := dtString;

  end; {case, CalcType}

end; {procedure, SetTheDataType}

{------------------------------------------------------------------------------}
{ TppCalc.SetCustomType }

procedure TppCalc.SetCustomType(aDataType: TppDataType);
begin
  if (csReading in ComponentState) or (csLoading in ComponentState) then
    FCustomType := aDataType

  else if (FCalcType = ctCustom) then
    FCustomType := aDataType;

end;


{------------------------------------------------------------------------------}
{ TppCalc.SetDisplayFormat }

procedure TppCalc.SetDisplayFormat(const aFormat: String);
begin

  inherited SetDisplayFormat(aFormat);

  {set design time caption}
  if (pppcDesigning in DesignState) and not (Printing) then
    Caption := GetText;

end; {function, SetDisplayFormat}


{------------------------------------------------------------------------------}
{ TppCalc.Compute }

procedure TppCalc.Compute;
begin

  if (FCalcType = ctCustom) and (Printing) then
    begin
      if ResetOnCompute then Clear;

      if Assigned(FOnCalc) then FOnCalc(Self);

      {SendEventNotify(Self, ciComponentCalc);}
    end;

end; {procedure, Compute}

{------------------------------------------------------------------------------}
{ TppCalc.GetDefaultPropEnumNames }

procedure TppCalc.GetDefaultPropEnumNames(aList: TStrings);
begin

  aList.Clear;

   aList.Add(ppLoadStr(303));
   aList.Add(ppLoadStr(304));
   aList.Add(ppLoadStr(305));
   aList.Add(ppLoadStr(306));
   aList.Add(ppLoadStr(307));
   aList.Add(ppLoadStr(308));
   aList.Add(ppLoadStr(309));
   aList.Add(ppLoadStr(310));
   aList.Add(ppLoadStr(311));
   aList.Add('Custom');

end; {procedure, GetDefaultPropEnumNames}


{------------------------------------------------------------------------------}
{ TppCalc.Clear }

procedure TppCalc.Clear;
begin
  inherited Clear;

  FBoolean  := False;
  FInteger  := 0;
  FDouble   := 0;
  FString   := '';
  FDateTime := Now;
end;

{------------------------------------------------------------------------------}
{ TppCalc.RestoreFromCache }

procedure TppCalc.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCalcSaveRec;
begin
  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent := lRec.FDrawComponent;

  FBoolean  := lRec.FBoolean;
  FDateTime := lRec.FDateTime;
  FInteger  := lRec.FInteger;
  FDouble   := lRec.FDouble;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCalc.SaveToCache }

procedure TppCalc.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCalcSaveRec;
begin
  lRec.FDrawComponent := DrawComponent;

  lRec.FBoolean  := FBoolean;
  lRec.FDateTime := FDateTime;
  lRec.FInteger  := FInteger;
  lRec.FDouble   := FDouble;

  WriteRecordToCache(aCachePageNo, lRec);
  
end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCalc.CreatePopupMenu }

procedure TppCalc.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  aPopupMenu.AddItem(30, 'DisplayFormat', '', 230);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppCalc.PopupMenuClick }

procedure TppCalc.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('DisplayFormat').OnClick := FormatMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppCalc.FormatMenuClick }

procedure TppCalc.FormatMenuClick(Sender: TObject);
var
  lFormatDlg: TppCustomFormatDialog;
  lFormClass: TFormClass;
  lFormats: TStrings;

begin
  if (Band = nil) or (Band.Report = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomFormatDialog);

  lFormatDlg := TppCustomFormatDialog(lFormClass.Create(Application));
  lFormatDlg.LanguageIndex := Band.LanguageIndex;
  lFormatDlg.DisplayFormat := DisplayFormat;

  lFormats := lFormatDlg.DisplayFormats;

  SendDesignMessage(PM_GETDISPLAYFORMATS, ppWCustomMsg, Longint(lFormats));

  {get standard display formats}
  if (lFormats.Count = 0) then
    ppGetDisplayFormats(FCustomType, lFormatDlg.DisplayFormats);

  {set format property}
  if (lFormatDlg.ShowModal = mrOK) then
    DisplayFormat := lFormatDlg.DisplayFormat;

  lFormatDlg.Release;

end; {procedure, FormatMenuClick}

{------------------------------------------------------------------------------}
{ TppCalc.DefineProperties }

procedure TppCalc.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('DataType', ReadDataType, nil, False);

end;

{------------------------------------------------------------------------------}
{ TppCalc.ReadDataType }

procedure TppCalc.ReadDataType(Reader: TReader);
var
  lsDataType: String;
begin
  lsDataType := Reader.ReadIdent;

  if (lsDataType = 'ftString') then
    FCustomType := dtString

  else if (lsDataType = 'ftSmallint') or (lsDataType = 'ftInteger') or
          (lsDataType = 'ftWord') or (lsDataType = 'ftBytes') then
    FCustomType := dtInteger

  else if (lsDataType = 'ftFloat' ) or (lsDataType = 'ftCurrency') then
    FCustomType := dtDouble

  else if (lsDataType = 'ftBoolean') then
    FCustomType := dtBoolean

  else if (lsDataType = 'ftDate') then
    FCustomType := dtDate

  else if (lsDataType = 'ftTime') then
    FCustomType := dtTime

  else if (lsDataType = 'ftDateTime') then
    FCustomType := dtDateTime;

end; {procedure, ReadDataType}


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
 ** V A R I A B L E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.RefClass }

class function TraTppVariableRTTI.RefClass: TClass;
begin
  Result := TppVariable;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.GetEventList }

class procedure TraTppVariableRTTI.GetEventList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetEventList(aClass, aPropList);

  aPropList.RemoveProp('OldOnCalc');

end; {class function, GetEventList}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.GetPropList }

class procedure TraTppVariableRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('AsBoolean');
  aPropList.AddProp('AsChar');
  aPropList.AddProp('AsCurrency');
  aPropList.AddProp('AsDateTime');
  aPropList.AddProp('AsDate');
  aPropList.AddProp('AsDouble');
  aPropList.AddProp('AsExtended');
  aPropList.AddProp('AsInteger');
  aPropList.AddProp('AsSingle');
  aPropList.AddProp('AsString');
  aPropList.AddProp('AsTime');
  aPropList.AddProp('Value');

end; {class function, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.GetParams }

class function TraTppVariableRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'OnCalc') = 0) or (CompareText(aMethodName, 'OnReset') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Value', daVariant, nil, '', False, True);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.GetPropRec }

class function TraTppVariableRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if (CompareText(aPropName, 'OnCalc') = 0) then
    EventToRec(aPropName, ciComponentCalc, True, aPropRec)

  else if (CompareText(aPropName, 'OnReset') = 0) then
    EventToRec(aPropName, ciComponentReset, True, aPropRec)

    
  {properties & methods}
  else if (CompareText(aPropName, 'AsBoolean') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'AsChar') = 0) then
    PropToRec(aPropName, daChar, False, aPropRec)

  else if (CompareText(aPropName, 'AsCurrency') = 0) then
    PropToRec(aPropName, daCurrency, False, aPropRec)

  else if (CompareText(aPropName, 'AsDateTime') = 0) then
    PropToRec(aPropName, daDateTime, False, aPropRec)

  else if (CompareText(aPropName, 'AsDate') = 0) then
    PropToRec(aPropName, daDate, False, aPropRec)

  else if (CompareText(aPropName, 'AsDouble') = 0) then
    PropToRec(aPropName, daDouble, False, aPropRec)

  else if (CompareText(aPropName, 'AsExtended') = 0) then
    PropToRec(aPropName, daExtended, False, aPropRec)

  else if (CompareText(aPropName, 'AsInteger') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'AsSingle') = 0) then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if (CompareText(aPropName, 'AsString') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'AsTime') = 0) then
    PropToRec(aPropName, daTime, False, aPropRec)

  else if (CompareText(aPropName, 'CalcOrder') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'CalcComponent') = 0) then
    ClassPropToRec(aPropName, TppCommunicator, False, aPropRec)

  else if (CompareText(aPropName, 'CalcType') = 0) then
    EnumPropToRec(aPropName, 'TppVarEventType', False, aPropRec)

  else if (CompareText(aPropName, 'DataType') = 0) then
    EnumPropToRec(aPropName, 'TppDataType', False, aPropRec)

  else if (CompareText(aPropName, 'ResetComponent') = 0) then
    ClassPropToRec(aPropName, TppCommunicator, False, aPropRec)

  else if (CompareText(aPropName, 'ResetType') = 0) then
    EnumPropToRec(aPropName, 'TppVarEventType', False, aPropRec)

  else if (CompareText(aPropName, 'Value') = 0) then
    PropToRec(aPropName, daVariant, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.GetPropValue }

class function TraTppVariableRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AsBoolean') = 0) then
    Integer(aValue) := Ord(TppVariable(aObject).AsBoolean)

  else if (CompareText(aPropName, 'AsChar') = 0) then
    Char(aValue) := TppVariable(aObject).AsChar

  else if (CompareText(aPropName, 'AsCurrency') = 0) then
    Currency(aValue) := TppVariable(aObject).AsCurrency

  else if (CompareText(aPropName, 'AsDateTime') = 0) then
    TDateTime(aValue) := TppVariable(aObject).AsDateTime

  else if (CompareText(aPropName, 'AsDate') = 0) then
    TDateTime(aValue) := TppVariable(aObject).AsDate

  else if (CompareText(aPropName, 'AsDouble') = 0) then
    Double(aValue) := TppVariable(aObject).AsDouble

  else if (CompareText(aPropName, 'AsExtended') = 0) then
    Extended(aValue) := TppVariable(aObject).AsExtended

  else if (CompareText(aPropName, 'AsInteger') = 0) then
    Integer(aValue) := TppVariable(aObject).AsInteger

  else if (CompareText(aPropName, 'AsSingle') = 0) then
    Single(aValue) := TppVariable(aObject).AsSingle

  else if (CompareText(aPropName, 'AsString') = 0) then
    String(aValue) := TppVariable(aObject).AsString

  else if (CompareText(aPropName, 'AsTime') = 0) then
    TDateTime(aValue) := TppVariable(aObject).AsTime

  else if (CompareText(aPropName, 'CalcOrder') = 0) then
    Integer(aValue) := TppVariable(aObject).CalcOrder

  else if (CompareText(aPropName, 'CalcComponent') = 0) then
    Integer(aValue) := Integer(TppVariable(aObject).CalcComponent)

  else if (CompareText(aPropName, 'CalcType') = 0) then
    Integer(aValue) := Ord(TppVariable(aObject).CalcType)

  else if (CompareText(aPropName, 'DataType') = 0) then
    Integer(aValue) := Ord(TppVariable(aObject).DataType)

  else if (CompareText(aPropName, 'ResetComponent') = 0) then
    Integer(aValue) := Integer(TppVariable(aObject).ResetComponent)

  else if (CompareText(aPropName, 'ResetType') = 0) then
    Integer(aValue) := Ord(TppVariable(aObject).ResetType)

  else if (CompareText(aPropName, 'Value') = 0) then
    Variant(aValue) := TppVariable(aObject).Value

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppVariableRTTI.SetPropValue }

class function TraTppVariableRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AsBoolean') = 0) then
    TppVariable(aObject).AsBoolean := Boolean(aValue)

  else if (CompareText(aPropName, 'AsChar') = 0) then
    TppVariable(aObject).AsChar := Char(aValue)

  else if (CompareText(aPropName, 'AsCurrency') = 0) then
    TppVariable(aObject).AsCurrency := Currency(aValue)

  else if (CompareText(aPropName, 'AsDateTime') = 0) then
    TppVariable(aObject).AsDateTime := TDateTime(aValue)

  else if (CompareText(aPropName, 'AsDate') = 0) then
    TppVariable(aObject).AsDate := TDateTime(aValue)

  else if (CompareText(aPropName, 'AsDouble') = 0) then
    TppVariable(aObject).AsDouble := Double(aValue)

  else if (CompareText(aPropName, 'AsExtended') = 0) then
    TppVariable(aObject).AsExtended := Extended(aValue)

  else if (CompareText(aPropName, 'AsInteger') = 0) then
    TppVariable(aObject).AsInteger := Integer(aValue)

  else if (CompareText(aPropName, 'AsSingle') = 0) then
    TppVariable(aObject).AsSingle := Single(aValue)

  else if (CompareText(aPropName, 'AsString') = 0) then
    TppVariable(aObject).AsString := String(aValue)

  else if (CompareText(aPropName, 'AsTime') = 0) then
    TppVariable(aObject).AsTime := TDateTime(aValue)

  else if (CompareText(aPropName, 'CalcOrder') = 0) then
    TppVariable(aObject).CalcOrder := Integer(aValue)

  else if (CompareText(aPropName, 'CalcComponent') = 0) then
    TppVariable(aObject).CalcComponent := TppCommunicator(aValue)

  else if (CompareText(aPropName, 'CalcType') = 0) then
    TppVariable(aObject).CalcType := TppVarEventType(aValue)

  else if (CompareText(aPropName, 'DataType') = 0) then
    TppVariable(aObject).DataType := TppDataType(aValue)

  else if (CompareText(aPropName, 'ResetComponent') = 0) then
    TppVariable(aObject).ResetComponent := TppCommunicator(aValue)

  else if (CompareText(aPropName, 'ResetType') = 0) then
    TppVariable(aObject).ResetType := TppVarEventType(aValue)

  else if (CompareText(aPropName, 'Value') = 0) then
    TppVariable(aObject).Value := Variant(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** S Y S T E M   V A R I A B L E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppSystemVariableRTTI.RefClass }

class function TraTppSystemVariableRTTI.RefClass: TClass;
begin
  Result := TppSystemVariable;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppSystemVariableRTTI.GetPropList }

class procedure TraTppSystemVariableRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class function, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppSystemVariableRTTI.GetPropRec }

class function TraTppSystemVariableRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'VarType') = 0) then
    EnumPropToRec(aPropName, 'TppVarType', True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppSystemVariableRTTI.GetPropValue }

class function TraTppSystemVariableRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'VarType') = 0) then
    Integer(aValue) := Ord(TppSystemVariable(aObject).VarType) 

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppSystemVariableRTTI.SetPropValue }

class function TraTppSystemVariableRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'VarType') = 0) then
    TppSystemVariable(aObject).VarType := TppVarType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  raRegisterRTTI(TraTppVariableRTTI);
  raRegisterRTTI(TraTppSystemVariableRTTI);

finalization

  raUnRegisterRTTI(TraTppVariableRTTI);
  raUnRegisterRTTI(TraTppSystemVariableRTTI);

end.
