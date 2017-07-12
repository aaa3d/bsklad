{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daQuery;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ExtCtrls,
  ppComm, ppClass, ppRelatv, ppDB, ppUtils, ppTypes,
  daDB, daDataVw, daQClass, ppForms, ppReport, ppRTTI,
  ppEndUsr, ppDsgnDB;

type

  { TdaQueryDataView - abstract ancestor for query based DataViews that use the
                       ReportBuilder Query Wizard. An example of a descendant
                       is TdaBDEQueryDataView which contains a BDE based TQuery component}

  { TdaQueryDataView }
  TdaQueryDataView = class(TdaCustomDataView)
    private
      FSQL: TdaSQL;
      FSession: TdaSession;
      FLinkedAutoSearchFields: TList;

      procedure AddAutoSearchFields;
      procedure AutoSearchFieldChangeEvent(Sender: TObject);
      procedure CreateAutoSearchFields(aReport: TppReport);
      procedure CreateCriteriaForAutoSearchField(aAutoSearchField: TppAutoSearchField);
      procedure CreateField(aField: TdaField);
      procedure FreeAutoSearchFields(aReport: TppReport);
      procedure RemoveAutoSearchFields;
      procedure SetSQL(aSQL: TdaSQL);
      procedure SQLToDataView;
      procedure ReportGetAutoSearchValuesEvent;
      procedure ReportCreateAutoSearchCriteriaEvent(aAutoSearchField: TObject);
      procedure UpdateAutoSearchFields;

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;
      procedure Loaded; override;

      procedure ReportBeforePrintEvent; override;
      procedure SetAutoSearchTabOrder(aValue: Integer); override;
      procedure SetReport(aReport: TppCustomReport); override;
      procedure SetUserName(const aUserName: TComponentName); override;
      procedure SQLChanged; virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      class function DataDesignerClass: TClass; override;

      procedure Init; override;

      {streaming routines for saving query def}
      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;
      function  daOperatorToppOperator(aOperator: TdaCriteriaOperatorType): TppSearchOperatorType;
      function  ppOperatorTodaOperator(aOperator: TppSearchOperatorType): TdaCriteriaOperatorType;

      {allow for the use of TdaSQL descendants}
      class function SQLClass: TdaSQLClass; virtual;

      property SQL: TdaSQL read FSQL write SetSQL;
      property Session: TdaSession read FSession;

      {retained for backward compatiblity}
      procedure BeforeGenerateSQL(aSQL: TdaSQL); virtual;
      procedure AfterGenerateSQL(aSQL: TdaSQL); virtual;

    published
      property AutoSearchTabOrder;

  end; {class, TdaQueryDataView}



implementation


{******************************************************************************
 *
 ** Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Create }

constructor TdaQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FSQL := SQLClass.Create(Self);
  FSession := TdaSessionClass(SessionClass).Create(Self);
  FSession.DataOwner := aOwner;
  FSQL.Session := FSession;

  FSQL.AddEventNotify(Self);

  EventNotifies := EventNotifies + [ciReportGetAutoSearchValues,
                                    ciBeforeGenerateSQL,
                                    ciAfterGenerateSQL,
                                    ciReportCreateAutoSearchCriteria];

  FLinkedAutoSearchFields := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Destroy }

destructor TdaQueryDataView.Destroy;
begin

  RemoveAutoSearchFields;

  FSQL.Free;
  FSession.Free;
  FLinkedAutoSearchFields.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SQLClass }

class function TdaQueryDataView.SQLClass: TdaSQLClass;
begin
  Result := TdaSQL;
end; {class function, SQLClass}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.DataDesignerClass }

class function TdaQueryDataView.DataDesignerClass: TClass;
begin
  Result := GetClass('TdaQueryDesigner');
end; {class function, DataDesignerClass}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.SetReport }

procedure TdaQueryDataView.SetReport(aReport: TppCustomReport);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    inherited SetReport(aReport)

  else
    begin
      RemoveAutoSearchFields;

      inherited SetReport(aReport);

      AddAutoSearchFields;
    end;

end; {procedure, SetReport}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.SetUserName }

procedure TdaQueryDataView.SetUserName(const aUserName: TComponentName);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    inherited SetUserName(aUserName)

  else
    begin
      RemoveAutoSearchFields;

      inherited SetUserName(aUserName);

      AddAutoSearchFields;
    end;

end; {procedure, SetUserName}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Notify }

procedure TdaQueryDataView.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator is TppAutoSearchField) and (FLinkedAutoSearchFields.IndexOf(aCommunicator) <> -1) then
    begin
      {remove corresponding criteria}
      TppAutoSearchField(aCommunicator).Criteria.Free;

      FLinkedAutoSearchFields.Remove(aCommunicator);
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.EventNotify }

procedure TdaQueryDataView.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
var
  lField: Integer;
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FSQL) then

    case aEventID of
      ciBeforeGenerateSQL:
        BeforeGenerateSQL(FSQL);

      ciAfterGenerateSQL:
        AfterGenerateSQL(FSQL);
    end

  else if (aCommunicator = Report) then

    case aEventID of
      ciReportGetAutoSearchValues:
        ReportGetAutoSearchValuesEvent;

      ciReportCreateAutoSearchCriteria:
        begin
          aParams.GetParamValue(0, lField);

          ReportCreateAutoSearchCriteriaEvent(TppAutoSearchField(lField));
        end;
    end;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Loaded }

procedure TdaQueryDataView.Loaded;
begin

  inherited Loaded;

  Description := FSQL.Description;

  if FSQL.EditSQLAsText then
    EnabledOptions := [ppemText, ppemPreview];

  FSQL.AddEventNotify(Self);

  FSQL.Session   := FSession;

  {re-assign this here - due to timing issues:
   setting the DataOwner enables the descendant classes to
   initialize a list of connection objects, such as TDatabase or TADOConnection, etc.}
  FSession.DataOwner := Owner;


  FSQL.Modified := False;

  {do this after modified is set to false}
  if (Report <> nil) and (Report.Converted) then
    FSQL.Convert;

  UpdateAutoSearchFields;

  if (Report <> nil) then
    Report.Modified := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportBeforePrintEvent }

procedure TdaQueryDataView.ReportBeforePrintEvent;
begin

  if SQL.Modified then
    begin
      SQLChanged;

      Report.Engine.Reset;
    end;

  inherited ReportBeforePrintEvent;

end; {procedure, ReportBeforePrintEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.BeforeGenerateSQL }

procedure TdaQueryDataView.BeforeGenerateSQL(aSQL: TdaSQL);
begin

end; {procedure, BeforeGenerateSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AfterGenerateSQL }

procedure TdaQueryDataView.AfterGenerateSQL(aSQL: TdaSQL);
begin

end; {procedure, AfterGenerateSQL}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.SetSQL }

procedure TdaQueryDataView.SetSQL(aSQL: TdaSQL);
begin

  FSQL.Assign(aSQL);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {allow descendants to make updates before sql is generated}
  SQLChanged;

  {transfer new info in SQL object to dataview}
  SQLToDataView;

end; {procedure, SetSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetAutoSearchTabOrder }

procedure TdaQueryDataView.SetAutoSearchTabOrder(aValue: Integer);
var
  lMainReport: TppReport;
begin

  inherited SetAutoSearchTabOrder(aValue);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (Report <> nil) then
    begin
      lMainReport := TppReport(Report.MainReport);

      if (lMainReport <> nil) then
        lMainReport.Modified := True;
    end;

end; {procedure, SetAutoSearchTabOrder}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.SQLToDataView }

procedure TdaQueryDataView.SQLToDataView;
var
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;

begin

  SetActive(False);

  if (DataPipelineCount = 0) then Exit;

  lDataPipeline := DataPipelines[0];

  {assign description}
  Description := FSQL.Description;

  {assign dataview user name}
  UserName := 'Query_' + ppTextToIdentifier(FSQL.Description);

  {validate the DataPipeline name - it must be unique,
    the TppCommunicator.SetUserName method will ensure uniqueness }
  lDataPipeline.UserName := FSQL.DataPipelineName;

  {assign the UserName as the Name}
  lDataPipeline.Name := lDataPipeline.UserName;



  if FSQL.EditSQLAsText then
    EnabledOptions := [ppemText, ppemPreview];

  DataPipelines[0].FreeFields;

  {create the fields}
  for liIndex := 0 to FSQL.SelectFieldCount - 1 do
    CreateField(FSQL.SelectFields[liIndex]);

  for liIndex := 0 to FSQL.CalcFieldCount - 1 do
    CreateField(FSQL.CalcFields[liIndex]);


  {free any previously created autosearch fields and create new ones}
  UpdateAutoSearchFields;


  {4.06 - DPTeeChart needs the pipe to be active}
  SetActive(True);

end; {procedure, SQLToDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Init }

procedure TdaQueryDataView.Init;
begin

  if (FSQL <> nil) then Exit;

  FSQL := SQLClass.Create(Self);

  {descendants should add code here to create a DataPipeline}

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SQLChanged }

procedure TdaQueryDataView.SQLChanged;
begin

  {descendants can add code here update implementation specific objects.
   For example update a TQuery object with SQL and DatabaseName }

end; {procedure, SQLChanged}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AddChild }

procedure TdaQueryDataView.AddChild(aChild: TppRelative);
begin

  if (aChild is TdaSQL) then
    begin
      FSQL.Free;

      FSQL := TdaSQL(aChild);
    end
  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.InsertChild }

procedure TdaQueryDataView.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  if (aChild is TdaSQL) then
    begin
      FSQL.Free;

      FSQL := TdaSQL(aChild);
    end
  else
    inherited InsertChild(aPosition, aChild);

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.RemoveChild }

function TdaQueryDataView.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := -1;

  if (aChild is TdaSQL) then
    FSQL := nil
  else
    Result := inherited RemoveChild(aChild);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SaveComponents }

procedure TdaQueryDataView.SaveComponents(Proc: TGetChildProc);
begin

  inherited SaveComponents(Proc);

  if (FSQL <> nil) then
    Proc(FSQL);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateField }

procedure TdaQueryDataView.CreateField(aField: TdaField);
var
  lField: TppField;
  lDataPipeline: TppDataPipeline;
begin

  lDataPipeline := DataPipelines[0];

  {create field from field map}
  lField := TppField.Create(nil);

  lField.DataType      := lDataPipeline.GetFieldDataType(aField.SQLFieldName);
  lField.FieldLength   := lDataPipeline.GetFieldSize(aField.SQLFieldName);
  lField.DisplayWidth  := lDataPipeline.GetFieldDisplayWidth(aField.SQLFieldName);

  lField.DisplayFormat := aField.DisplayFormat;
  lField.FieldAlias    := aField.Alias;
  lField.FieldName     := aField.SQLFieldName;
  lField.TableName     := aField.TableName;
  lField.Searchable    := aField.Searchable;
  lField.Selectable    := aField.Selectable;
  lField.Sortable      := aField.Sortable;

  lField.DataPipeline := lDataPipeline;

end; {procedure, CreateField}


{******************************************************************************
 *
 ** A U T O S E A R C H   F I E L D S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateAutoSearchFields }

procedure TdaQueryDataView.UpdateAutoSearchFields;
begin

  RemoveAutoSearchFields;

  AddAutoSearchFields;

end; {procedure, UpdateAutoSearchFields}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.AddAutoSearchFields }

procedure TdaQueryDataView.AddAutoSearchFields;
var
  lMainReport: TppReport;
begin

  if (Report <> nil) then
    begin
      lMainReport := TppReport(Report.MainReport);

      if (lMainReport <> nil) then
        begin
          CreateAutoSearchFields(lMainReport);

          if (lMainReport.AutoSearchFieldCount > 0) then
            lMainReport.ShowAutoSearchDialog := True;
        end;

    end;

end; {procedure, AddAutoSearchFields}

{-----------------------------------------------------------------------------}
{ TdaQueryDataView.RemoveAutoSearchFields }

procedure TdaQueryDataView.RemoveAutoSearchFields;
var
  lMainReport: TppReport;
begin

  if (Report = nil) or (csDestroying in Report.ComponentState) then Exit;

  lMainReport := TppReport(Report.MainReport);

  if (lMainReport <> nil) then
    begin
      FreeAutoSearchFields(lMainReport);

      if (lMainReport.AutoSearchFieldCount = 0) then
        lMainReport.ShowAutoSearchDialog := False;
    end;

end; {procedure, RemoveAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateAutoSearchFields }

procedure TdaQueryDataView.CreateAutoSearchFields(aReport: TppReport);
var
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TppAutoSearchField;
begin

  for liIndex := 0 to FSQL.CriteriaCount - 1 do
    begin
      lCriteria := FSQL.Criteria[liIndex];

      if (lCriteria.Field <> nil) and (lCriteria.Field.AutoSearch) then
        begin
          lField := TppAutoSearchField.Create(Self);

          lField.FieldAlias := lCriteria.Field.FieldAlias;
          lField.FieldName := lCriteria.Field.FieldName;
          lField.DataType := lCriteria.Field.DataType;
          lField.SearchExpression := lCriteria.Value;
          lField.SearchOperator := daOperatorToppOperator(lCriteria.Operator);
          lField.ShowAllValues := lCriteria.ShowAllValues;
          lField.Mandatory := lCriteria.Field.Mandatory;
          lField.TableAlias := lCriteria.Field.TableAlias;
          lField.TableName := lCriteria.Field.TableName;

          {save a pointer to the corresponding criteria and dataview}
          lField.Criteria := lCriteria;
          lField.DataView := Self;
          lField.OnChange := AutoSearchFieldChangeEvent;

          lField.Parent := aReport;
        end;

    end;

end; {procedure, CreateAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.FreeAutoSearchFields }

procedure TdaQueryDataView.FreeAutoSearchFields(aReport: TppReport);
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lFreeFields: TList;
begin

  lFreeFields := TList.Create;

  for liIndex := 0 to aReport.AutoSearchFieldCount - 1 do
    begin
      lField := aReport.AutoSearchFields[liIndex];

      if (lField.DataView = Self) then
        lFreeFields.Add(lField);
    end;

  for liIndex := 0 to lFreeFields.Count - 1 do
    TObject(lFreeFields[liIndex]).Free;

  lFreeFields.Free;

end; {procedure, FreeAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportGetAutoSearchValuesEvent }

procedure TdaQueryDataView.ReportGetAutoSearchValuesEvent;
var
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TppAutoSearchField;
  lMainReport: TppReport;
begin

  if (Report = nil) then Exit;

  lMainReport := TppReport(Report.MainReport);

  if (lMainReport = nil) then Exit;


  {if modal result is ok, then transfer auto search field values to auto search criteria}
  for liIndex := 0 to lMainReport.AutoSearchFieldCount - 1 do
    begin
      lField := lMainReport.AutoSearchFields[liIndex];

      if (lField.DataView = Self) then
        begin
          lCriteria := TdaCriteria(lField.Criteria);

          lCriteria.Value := lField.SearchExpression;
        end;
    end;

  SQLChanged;

end; {procedure, ReportGetAutoSearchValuesEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportCreateAutoSearchCriteriaEvent }

procedure TdaQueryDataView.ReportCreateAutoSearchCriteriaEvent(aAutoSearchField: TObject);
var
  lppField: TppAutoSearchField;
  lDesigner: TppDesigner;
  liIndex: Integer;
begin

  {get data dictionary from designer}
  if (SQL.DataDictionary = nil) then
    begin
      {find a designer component in owner}
      lDesigner := nil;
      liIndex := 0;

      while (liIndex < Owner.ComponentCount) and (lDesigner = nil) do
        begin
           if (Owner.Components[liIndex] is TppDesigner) then
             lDesigner := TppDesigner(Owner.Components[liIndex])
           else
             Inc(liIndex);
        end;

      if (lDesigner <> nil) and (lDesigner.Report = Report) and (lDesigner.DataSettings.UseDataDictionary) then
        SQL.DataDictionary := TppDataDictionary(lDesigner.DataSettings.DataDictionary)
      else
        SQL.DataDictionary := nil;
    end;

  lppField := TppAutoSearchField(aAutoSearchField);

  if (CompareText(lppField.DataPipelineName, DataPipelines[0].UserName) <> 0) then Exit;

  CreateCriteriaForAutoSearchField(lppField);

  FLinkedAutoSearchFields.Add(lppField);

  lppField.AddNotify(Self);

end; {procedure, ReportCreateAutoSearchCriteriaEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AutoSearchFieldChangeEvent }

procedure TdaQueryDataView.AutoSearchFieldChangeEvent(Sender: TObject);
var
  lField: TppAutoSearchField;
  lCriteria: TdaCriteria;
  lFieldOperator: TdaCriteriaOperatorType;
begin

  lField := TppAutoSearchField(Sender);
  lCriteria := TdaCriteria(lField.Criteria);

  if (lCriteria.Field.FieldName <> lField.FieldName) then
    begin
      CreateCriteriaForAutoSearchField(lField);

      SQL.Modification;

      Report.Reset;
    end

  else
    begin

      if (lCriteria.Value <> lField.SearchExpression) then
        begin
          lCriteria.Value := lField.SearchExpression;

          SQL.Modification;

          Report.Reset;
        end;

      lFieldOperator := ppOperatorTodaOperator(lField.SearchOperator);

      if (lCriteria.Operator <> lFieldOperator) then
        begin
          lCriteria.Operator := lFieldOperator;

          SQL.Modification;

          Report.Reset;
        end;

      if (lCriteria.ShowAllValues <> lField.ShowAllValues) then
        begin
          lCriteria.ShowAllValues := lField.ShowAllValues;

          SQL.Modification;

          Report.Reset;
        end;
        
    end;

end; {procedure, AutoSearchFieldChangeEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateCriteriaForAutoSearchField }

procedure TdaQueryDataView.CreateCriteriaForAutoSearchField(aAutoSearchField: TppAutoSearchField);
var
  lCriteria: TdaCriteria;
  lFields: TStrings;
  liIndex: Integer;
begin

  {get all available criteria fields}
  lFields := TStringList.Create;

  try
    if (SQL.AvailableCriteriaCount = 0) then
      SQL.Resync;

    SQL.AvailableCriteriaList(lFields);

    {set string list entries to field names}
    for liIndex := 0 to lFields.Count - 1 do
      lFields[liIndex] := TdaField(lFields.Objects[liIndex]).FieldName;

    {find corresponding field position}
    liIndex := lFields.IndexOf(aAutoSearchField.FieldName);

    if (liIndex <> -1) then
      begin
        lCriteria := SQL.SelectCriteria(liIndex);

        aAutoSearchField.DataView := Self;
        aAutoSearchField.Criteria := lCriteria;
        aAutoSearchField.OnChange := AutoSearchFieldChangeEvent;

        SQL.daFieldToppField(lCriteria.Field, aAutoSearchField);

        lCriteria.Value := aAutoSearchField.SearchExpression;
        lCriteria.Operator := ppOperatorTodaOperator(aAutoSearchField.SearchOperator);
        lCriteria.ShowAllValues := aAutoSearchField.ShowAllValues;

      end;
  finally
    lFields.Free;
  end;

end; {procedure, CreateCriteriaForAutoSearchField}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.daOperatorToppOperator }

function TdaQueryDataView.daOperatorToppOperator(aOperator: TdaCriteriaOperatorType): TppSearchOperatorType;
begin

  case aOperator of
    dacoEqual: Result := soEqual;
    dacoNotEqual: Result := soNotEqual;
    dacoLessThan: Result := soLessThan;
    dacoLessThanOrEqualTo: Result := soLessThanOrEqualTo;
    dacoGreaterThan: Result := soGreaterThan;
    dacoGreaterThanOrEqualTo: Result := soGreaterThanOrEqualTo;
    dacoLike: Result := soLike;
    dacoNotLike: Result := soNotLike;
    dacoBetween: Result := soBetween;
    dacoNotBetween: Result := soNotBetween;
    dacoInList: Result := soInList;
    dacoNotInList: Result := soNotInList;
    dacoBlank: Result := soBlank;
    dacoNotBlank: Result := soNotBlank;
  else
    Result := soEqual;
  end;

end; {procedure, daOperatorToppOperator}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ppOperatorTodaOperator }

function TdaQueryDataView.ppOperatorTodaOperator(aOperator: TppSearchOperatorType): TdaCriteriaOperatorType;
begin

  case aOperator of
    soEqual: Result := dacoEqual;
    soNotEqual: Result := dacoNotEqual;
    soLessThan: Result := dacoLessThan;
    soLessThanOrEqualTo: Result := dacoLessThanOrEqualTo;
    soGreaterThan: Result := dacoGreaterThan;
    soGreaterThanOrEqualTo: Result := dacoGreaterThanOrEqualTo;
    soLike: Result := dacoLike;
    soNotLike: Result := dacoNotLike;
    soBetween: Result := dacoBetween;
    soNotBetween: Result := dacoNotBetween;
    soInList: Result := dacoInList;
    soNotInList: Result := dacoNotInList;
    soBlank: Result := dacoBlank;
    soNotBlank: Result := dacoNotBlank;
  else
    Result := dacoEqual;
  end;

end; {procedure, ppOperatorTodaOperator}


end.
