{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDsgnDB;

interface

{$I ppIfDef.pas}

uses
  SysUtils, Classes, IniFiles,
  ppComm, ppDB, ppTypes, ppForms, ppUtils;

type


  TppBasicDataSettings = class;
  TppFieldFieldNames = class;
  TppJoinFieldNames = class;
  TppTableFieldNames = class;

  { TppDataDictionary }
  TppDataDictionary = class(TppCommunicator)
    private
      FActive: Boolean;
      FAllowManualJoins: Boolean;
      FAutoJoin: Boolean;
      FBuilderSettings: TppBasicDataSettings;
      FErrorMessage: String;
      FFieldFieldNames: TppFieldFieldNames;
      FFieldList: TStringList;
      FFieldPipeline: TppDataPipeline;
      FTableAlias: String;
      FJoinFieldNames: TppJoinFieldNames;
      FJoinPipeline: TppDataPipeline;
      FTableFieldNames: TppTableFieldNames;
      FTableName: String;
      FTablePipeline: TppDataPipeline;
      FUseTableOwnerName: Boolean;
      FValidateFieldNames: Boolean;
      FValidateTableNames: Boolean;

      function  AddField(aField: TppField): Integer;
      procedure CreateFields;
      function  FieldsOpen: Boolean;
      procedure FreeFields;
      function  GetField(Index: Integer): TppField;
      function  GetFieldCount: Integer;
      function  JoinsOpen: Boolean;
      procedure SetBuilderSettings(aSettings: TppBasicDataSettings);
      procedure SetFieldFieldNames(aFieldFieldNames: TppFieldFieldNames);
      procedure SetActive(aValue: Boolean);
      procedure SetFieldPipeline(aDataPipeline: TppDataPipeline);
      procedure SetJoinFieldNames(aJoinFieldNames: TppJoinFieldNames);
      procedure SetJoinPipeline(aDataPipeline: TppDataPipeline);
      procedure SetTableFieldNames(aTableFieldNames: TppTableFieldNames);
      procedure SetTableName(const aName: String);
      procedure SetTablePipeline(aDataPipeline: TppDataPipeline);
      function  TablesOpen: Boolean;
      function  ValidDataPipelineFields(aDataPipeline: TppDataPipeline; const aPropertyName: String;
                                        aFieldProperties, aFieldNames: TStrings): Boolean;
      function  ValidDataPipeline(aDataPipeline: TppDataPipeline; const aPropertyName: String): Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure Assign(Source: TPersistent); override;

      procedure AppendFieldRecord(const aTableName, aFieldName, aFieldAlias,
                                  aSelectable, aSearchable, aSortable, aAutoSearch, aDataType: String);
      procedure AppendJoinRecord(const aTableName1, aTableName2, aJoinType: String;
                                 aFieldNames1, aFieldNames2, aOperators: TStrings);
      procedure AppendTableRecord(const aTableName, aTableAlias: String);
      procedure GetCompatibleJoinTables(const aSelectedTableName: String; aJoinTableNames: TStrings);
      function  GetFieldAlias(const aTableName, aFieldName: String): String;
      function  GetFirstJoinTable(const aSelectedTableName: String; aSelectedTableNames: TStrings): Integer;
      procedure GetJoinableTableNames(const aTableName: String; aTableNames: TStrings);
      function  GetJoinData(const aTableName1, aTableName2: String; var aJoinType: String; aFieldNames1, aFieldNames2, aOperators: TStrings): Boolean;
      procedure GetJoinTableNames(aSelectedTableNames, aJoinTableNames, aJoinTableAliases: TStrings);
      function  GetTableAlias(const aTableName: String): String;
      procedure GetTableNames(aTableNames, aTableAliases: TStrings);
      procedure Close;
      function  FieldForFieldName(const aFieldName: String): TppField;
      function  FindField(aField: TppField): Integer;
      procedure Open;
      procedure Reset;
      function  ValidSettings: Boolean;

      property Active: Boolean read FActive write SetActive;
      property ErrorMessage: String read FErrorMessage;
      property Fields[Index: Integer]: TppField read GetField;
      property FieldCount: Integer read GetFieldCount;
      property TableAlias: String read FTableAlias;
      property TableName: String read FTableName write SetTableName;

    published
      property AllowManualJoins: Boolean read FAllowManualJoins write FAllowManualJoins default False;
      property AutoJoin: Boolean read FAutoJoin write FAutoJoin default False;
      property BuilderSettings: TppBasicDataSettings read FBuilderSettings write SetBuilderSettings;
      property FieldFieldNames: TppFieldFieldNames read FFieldFieldNames write SetFieldFieldNames;
      property FieldPipeline: TppDataPipeline read FFieldPipeline write SetFieldPipeline;
      property JoinFieldNames: TppJoinFieldNames read FJoinFieldNames write SetJoinFieldNames;
      property JoinPipeline: TppDataPipeline read FJoinPipeline write SetJoinPipeline;
      property TableFieldNames: TppTableFieldNames read FTableFieldNames write SetTableFieldNames;
      property TablePipeline: TppDataPipeline read FTablePipeline write SetTablePipeline;
      property UserName;
      property UseTableOwnerName: Boolean read FUseTableOwnerName write FUseTableOwnerName default False;
      property ValidateFieldNames: Boolean read FValidateFieldNames write FValidateFieldNames default True;
      property ValidateTableNames: Boolean read FValidateTableNames write FValidateTableNames default True;

  end; {class, TppDataDictionary}

  { TppTableFieldNames }
  TppTableFieldNames = class(TPersistent)
    private
      FDataDictionary: TppDataDictionary;

      FTableName: String;
      FTableAlias: String;

    public
      constructor Create(aDataDictionary: TppDataDictionary);

      procedure Assign(Source: TPersistent); override;

      property DataDictionary: TppDataDictionary read FDataDictionary;

    published
      property TableName: String read FTableName write FTableName;
      property TableAlias: String read FTableAlias write FTableAlias;

  end; {class, TppTableFieldNames}

  { TppFieldFieldNames }
  TppFieldFieldNames = class(TPersistent)
    private
      FDataDictionary: TppDataDictionary;

      FAutoSearch: String;
      FDataType: String;
      FFieldAlias: String;
      FFieldName: String;
      FMandatory: String;
      FSearchable: String;
      FSelectable: String;
      FSortable: String;
      FTableName: String;

    public
      constructor Create(aDataDictionary: TppDataDictionary);

      procedure Assign(Source: TPersistent); override;

      property DataDictionary: TppDataDictionary read FDataDictionary;

    published
      property AutoSearch: String read FAutoSearch write FAutoSearch;
      property DataType: String read FDataType write FDataType;
      property FieldName: String read FFieldName write FFieldName;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property Mandatory: String read FMandatory write FMandatory;
      property Searchable: String read FSearchable write FSearchable;
      property Selectable: String read FSelectable write FSelectable;
      property Sortable: String read FSortable write FSortable;
      property TableName: String read FTableName write FTableName;

  end; {class, TppFieldFieldNames}

  { TppJoinFieldNames }
  TppJoinFieldNames = class(TPersistent)
    private
      FDataDictionary: TppDataDictionary;

      FTableName1: String;
      FTableName2: String;
      FJoinType: String;
      FFieldNames1: String;
      FFieldNames2: String;
      FOperators: String;

    public
      constructor Create(aDataDictionary: TppDataDictionary);

      procedure Assign(Source: TPersistent); override;

      property DataDictionary: TppDataDictionary read FDataDictionary;

    published
      property TableName1: String read FTableName1 write FTableName1;
      property TableName2: String read FTableName2 write FTableName2;
      property JoinType: String read FJoinType write FJoinType;
      property FieldNames1: String read FFieldNames1 write FFieldNames1;
      property FieldNames2: String read FFieldNames2 write FFieldNames2;
      property Operators: String read FOperators write FOperators;

  end; {class, TppJoinFieldNames}


  { TppBasicDataSettings}
  TppBasicDataSettings = class(TPersistent)
    private
      FActive: Boolean;
      FDatabaseName: TFilename;
      FOnChange: TNotifyEvent;
      FParent: TppCommunicator;
      FSessionType: String;
      
    protected
      function  IsActive: Boolean;
      procedure DoOnChange;
      procedure SetDatabaseName(aDatabaseName: TFilename); virtual;
      procedure SetSessionType(aSessionType: String); virtual;

    public
      constructor Create(aParent: TppCommunicator); virtual;

      procedure Assign(Source: TPersistent); override;
      procedure SaveStateInfo(aIniFile: TIniFile); virtual;
      procedure LoadStateInfo(aIniFile: TIniFile; aDataModule: TppCommunicator); virtual;

      property Active: Boolean read FActive write FActive;
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property Parent: TppCommunicator read FParent;

    published
      property DatabaseName: TFilename read FDatabaseName write SetDatabaseName;
      property SessionType: String read FSessionType write SetSessionType;

  end; {class, TppBasicDataSettings}

  { TppDataSettings}
  TppDataSettings = class(TppBasicDataSettings)
    private
      FAllowEditSQL: Boolean;
      FDataDictionary: TppDataDictionary;
      FDatabaseType: TppDatabaseType;
      FSQLType: TppSQLType;
      FUseDataDictionary: Boolean;

      procedure SetAllowEditSQL(aValue: Boolean);
      procedure SetDatabaseType(aDatabaseType: TppDatabaseType);
      procedure SetDataDictionary(aDataDictionary: TppDataDictionary);
      procedure SetSQLType(aSQLType: TppSQLType);
      procedure SetUseDataDictionary(aValue: Boolean);

    protected
      procedure SetSessionType(aSessionType: String); override;

    public
      constructor Create(aParent: TppCommunicator); override;

      procedure Assign(Source: TPersistent); override;
      procedure SaveStateInfo(aIniFile: TIniFile); override;
      procedure LoadStateInfo(aIniFile: TIniFile; aDataModule: TppCommunicator); override;

    published
      property AllowEditSQL: Boolean read FAllowEditSQL write SetAllowEditSQL;
      property DatabaseType: TppDatabaseType read FDatabaseType write SetDatabaseType default dtOther;
      property DataDictionary: TppDataDictionary read FDataDictionary write SetDataDictionary;
      property SQLType: TppSQLType read FSQLType write SetSQLType;
      property UseDataDictionary: Boolean read FUseDataDictionary write SetUseDataDictionary default False;

    end; {class, TppDataSettings}


  { TppCustomDataSettingsDialog }
  TppCustomDataSettingsDialog = class(TppForm)
    private
      FDataModule: TComponent;

    protected
      function  GetDataSettings: TPersistent; virtual; abstract;
      procedure SetDataSettings(aAccessConfig: TPersistent); virtual; abstract;

    public
      procedure Initialize; virtual; abstract;

      property DataModule: TComponent read FDataModule write FDataModule;
      property DataSettings: TPersistent read GetDataSettings write SetDataSettings;

    end; {class, TppCustomDataSettingsDialog}



implementation

{------------------------------------------------------------------------------}
{ ppStringFieldValueToBoolean }

function ppStringFieldValueToBoolean(aValue: Variant): Boolean;
var
  lsValue: String;
begin

  Result := False;

  if VarIsNull(aValue) or ((VarType(aValue) <> varString) and (VarType(aValue) <> varOleStr)) then Exit;

  lsValue := aValue;

  if (Length(lsValue) > 0) then
    Result := (CompareText(lsValue[1], 'T') = 0)
  else
    Result := False;
    
end; {function, ppStringFieldValueToBoolean}


{******************************************************************************
 *
 ** T A B L E   F I E L D   N A M E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTableFieldNames.Create }

constructor TppTableFieldNames.Create(aDataDictionary: TppDataDictionary);
begin

  inherited Create;

  FDataDictionary := aDataDictionary;

  FTableName := 'TableName';
  FTableAlias := 'TableAlias';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTableFieldNames.Assign }

procedure TppTableFieldNames.Assign(Source: TPersistent);
var
  lTableFields: TppTableFieldNames;
begin

  if not(Source is TppTableFieldNames) then Exit;

  lTableFields := TppTableFieldNames(Source);

  FTableName := lTableFields.TableName;
  FTableAlias := lTableFields.TableAlias;

end; {constructor, Assign}

{******************************************************************************
 *
 ** J O I N   F I E L D   N A M E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppJoinFieldNames.Create }

constructor TppJoinFieldNames.Create(aDataDictionary: TppDataDictionary);
begin

  inherited Create;

  FDataDictionary := aDataDictionary;

  FTableName1 := 'TableName1';
  FTableName2 := 'TableName2';
  FJoinType := 'JoinType';
  FFieldNames1 := 'FieldNames1';
  FFieldNames2 := 'FieldNames2';
  FOperators := 'Operators';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppJoinFieldNames.Assign }

procedure TppJoinFieldNames.Assign(Source: TPersistent);
var
  lJoinFields: TppJoinFieldNames;
begin

  if not(Source is TppJoinFieldNames) then Exit;

  lJoinFields := TppJoinFieldNames(Source);

  FTableName1 := lJoinFields.TableName1;
  FTableName2 := lJoinFields.TableName2;
  FJoinType := lJoinFields.JoinType;
  FFieldNames1 := lJoinFields.FieldNames1;
  FFieldNames2 := lJoinFields.FieldNames2;
  FOperators := lJoinFields.Operators;

end; {constructor, Assign}

{******************************************************************************
 *
 ** F I E L D   F I E L D   N A M E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFieldFieldNames.Create }

constructor TppFieldFieldNames.Create(aDataDictionary: TppDataDictionary);
begin

  inherited Create;

  FDataDictionary := aDataDictionary;

  FAutoSearch := 'AutoSearch';
  FDataType := 'DataType';
  FFieldAlias := 'FieldAlias';
  FFieldName := 'FieldName';
  FMandatory := 'Mandatory';
  FSearchable := 'Searchable';
  FSelectable := 'Selectable';
  FSortable := 'Sortable';
  FTableName := 'TableName';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppFieldFieldNames.Assign }

procedure TppFieldFieldNames.Assign(Source: TPersistent);
var
  lFieldFields: TppFieldFieldNames;
begin

  if not(Source is TppFieldFieldNames) then Exit;

  lFieldFields := TppFieldFieldNames(Source);

  FAutoSearch := lFieldFields.AutoSearch;
  FDataType := lFieldFields.DataType;
  FFieldAlias := lFieldFields.FieldAlias;
  FFieldName := lFieldFields.FieldName;
  FMandatory := lFieldFields.Mandatory;
  FSearchable := lFieldFields.Searchable;
  FSelectable := lFieldFields.Selectable;
  FSortable := lFieldFields.Sortable;
  FTableName := lFieldFields.TableName;

end; {constructor, Assign}

{******************************************************************************
 *
 ** D A T A   D I C T I O N A R Y
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Create }

constructor TppDataDictionary.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FActive := False;
  FAllowManualJoins := False;
  FAutoJoin := False;
  FBuilderSettings := TppBasicDataSettings.Create(Self);
  FErrorMessage := '';
  FFieldFieldNames := TppFieldFieldNames.Create(Self);
  FFieldList := TStringList.Create;
  FFieldPipeline := nil;
  FJoinFieldNames := TppJoinFieldNames.Create(Self);
  FTableFieldNames := TppTableFieldNames.Create(Self);
  FTableName := '';
  FTablePipeline := nil;
  FUseTableOwnerName := False;
  FValidateTableNames := True;
  FValidateFieldNames := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Destroy }

destructor TppDataDictionary.Destroy;
begin

  FreeFields;

  FBuilderSettings.Free;
  FFieldList.Free;
  FFieldFieldNames.Free;
  FJoinFieldNames.Free;
  FTableFieldNames.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Assign }

procedure TppDataDictionary.Assign(Source: TPersistent);
var
  lSource: TppDataDictionary;
begin

  if not(Source is TppDataDictionary) then Exit;

  lSource := TppDataDictionary(Source);

  FreeFields;

  FActive := False;
  FAllowManualJoins := lSource.AllowManualJoins;
  FAutoJoin := lSource.AutoJoin;
  FBuilderSettings.Assign(lSource.BuilderSettings);
  FErrorMessage := '';
  FFieldFieldNames.Assign(lSource.FieldFieldNames);
  SetFieldPipeline(lSource.FieldPipeline);
  FTableAlias := '';
  FJoinFieldNames.Assign(lSource.JoinFieldNames);
  SetJoinPipeline(lSource.JoinPipeline);
  FTableFieldNames.Assign(lSource.TableFieldNames);
  FTableName := '';
  SetTablePipeline(lSource.TablePipeline);
  FUseTableOwnerName := lSource.UseTableOwnerName;
  FValidateFieldNames := lSource.ValidateFieldNames;
  FValidateTableNames := lSource.ValidateTableNames;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Notify }

procedure TppDataDictionary.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if not(aOperation = ppopRemove) then Exit;

  if (aCommunicator = FTablePipeline) then
    FTablePipeline := nil

  else if (aCommunicator = FFieldPipeline) then
    FFieldPipeline := nil

  else if (aCommunicator = FJoinPipeline) then
    FJoinPipeline := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetFirstJoinTable }

function  TppDataDictionary.GetFirstJoinTable(const aSelectedTableName: String; aSelectedTableNames: TStrings): Integer;
var
  lJoinTables: TStrings;
  liIndex: Integer;
  lsTableName: String;
begin

  Result := -1;

  lJoinTables := TStringList.Create;

  liIndex := 0;

  while (liIndex < aSelectedTableNames.Count - 1) and (Result = -1) do
    begin
      lsTableName := aSelectedTableNames[liIndex];

      GetCompatibleJoinTables(lsTableName, lJoinTables);

      if (lJoinTables.IndexOf(aSelectedTableName) <> -1) then
        Result := liIndex
      else
        Inc(liIndex);
    end;

  lJoinTables.Free;
  
end; {procedure, GetFirstJoinTable}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetCompatibleJoinTables }

procedure TppDataDictionary.GetCompatibleJoinTables(const aSelectedTableName: String; aJoinTableNames: TStrings);
var
  lsTable1: String;
  lsTable2: String;
  
begin
  aJoinTableNames.Clear;

  if not(TablesOpen) or not(JoinsOpen) then Exit;

  FJoinPipeline.First;

  while not(FJoinPipeline.EOF) do
    begin
      lsTable1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1);
      lsTable2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2);

      if (CompareText(aSelectedTableName, lsTable1) = 0) then
        aJoinTableNames.Add(lsTable2)

      else if (CompareText(aSelectedTableName, lsTable2) = 0) then
        aJoinTableNames.Add(lsTable1);

      FJoinPipeline.Next;
    end;

end; {procedure, GetCompatibleJoinTables}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetJoinData }

function TppDataDictionary.GetJoinData(const aTableName1, aTableName2: String; var aJoinType: String; aFieldNames1, aFieldNames2, aOperators: TStrings): Boolean;
var
  lbFound: Boolean;
  lsTable1: String;
  lsTable2: String;
  lsFieldNames1: String;
  lsFieldNames2: String;
  lsOperators: String;
begin

  Result := False;

  if not(JoinsOpen) then Exit;

  FJoinPipeline.First;

  lbFound := False;

  while not(FJoinPipeline.EOF) and not(lbFound) do
    begin
      lsTable1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1);
      lsTable2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2);

      if (CompareText(aTableName1, lsTable1) = 0) and (CompareText(aTableName2, lsTable2) = 0) then
        begin
          lbFound := True;

          lsFieldNames1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.FieldNames1);
          lsFieldNames2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.FieldNames2);
          lsOperators := FJoinPipeline.GetFieldValue(FJoinFieldNames.Operators);
        end
      else
        FJoinPipeline.Next;

    end;

  if not(lbFound) then
    begin
      FJoinPipeline.First;

      while not(FJoinPipeline.EOF) and not(lbFound) do
        begin
          lsTable1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1);
          lsTable2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2);

          if (CompareText(aTableName2, lsTable1) = 0) and (CompareText(aTableName1, lsTable2) = 0) then
            begin
              lbFound := True;

              lsFieldNames1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.FieldNames2);
              lsFieldNames2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.FieldNames1);
              lsOperators := FJoinPipeline.GetFieldValue(FJoinFieldNames.Operators);
            end

          else
            FJoinPipeline.Next;
        end;
    end;

    
  if not(lbFound) then Exit;

  aJoinType := FJoinPipeline.GetFieldValue(FJoinFieldNames.JoinType);

  ppParseString(lsFieldNames1, aFieldNames1);
  ppParseString(lsFieldNames2, aFieldNames2);
  ppParseString(lsOperators, aOperators);

  Result := True;

end; {procedure, GetJoinData}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetJoinableTableNames }

procedure TppDataDictionary.GetJoinableTableNames(const aTableName: String; aTableNames: TStrings);
begin

  aTableNames.Clear;

  if (ppdaNoRecords in FJoinPipeline.State) then Exit;

  if not(JoinsOpen) then Exit;

  FJoinPipeline.First;
  FJoinPipeline.Locate(FJoinFieldNames.TableName1, aTableName, [pploCaseInsensitive]);

  while (CompareText(FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1), aTableName) = 0) and not(FJoinPipeline.EOF) do
    begin
      aTableNames.Add(FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2));

      FJoinPipeline.Next;
    end;

  FJoinPipeline.First;
  FJoinPipeline.Locate(FJoinFieldNames.TableName2, aTableName, [pploCaseInsensitive]);

  while (CompareText(FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2), aTableName) = 0) and not(FJoinPipeline.EOF) do
    begin
      aTableNames.Add(FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1));

      FJoinPipeline.Next;
    end;

end; {procedure, GetJoinableTableNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetJoinTableNames }

procedure TppDataDictionary.GetJoinTableNames(aSelectedTableNames, aJoinTableNames, aJoinTableAliases: TStrings);
var
  liIndex: Integer;
  lsTable1: String;
  lsTable2: String;
  lsSelectTable: String;
begin

  aJoinTableNames.Clear;
  aJoinTableAliases.Clear;

  if not(TablesOpen) or not(JoinsOpen) then Exit;

  for liIndex := 0 to aSelectedTableNames.Count - 1 do
    begin
      lsSelectTable := aSelectedTableNames[liIndex];

      FJoinPipeline.First;

      while not(FJoinPipeline.EOF) do
        begin
          lsTable1 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName1);
          lsTable2 := FJoinPipeline.GetFieldValue(FJoinFieldNames.TableName2);

          if (CompareText(lsSelectTable, lsTable1) = 0) and (aSelectedTableNames.IndexOf(lsTable2) = -1) then
            aJoinTableNames.Add(lsTable2)

          else if (CompareText(lsSelectTable, lsTable2) = 0) and (aSelectedTableNames.IndexOf(lsTable1) = -1) then
            aJoinTableNames.Add(lsTable1);

          FJoinPipeline.Next;
        end;
    end;

  for liIndex := 0 to aJoinTableNames.Count - 1 do
    aJoinTableAliases.Add(GetTableAlias(aJoinTableNames[liIndex]));

end; {procedure, GetJoinTableNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetTableNames }

procedure TppDataDictionary.GetTableNames(aTableNames, aTableAliases: TStrings);
begin

  aTableNames.Clear;

  if not(TablesOpen) then Exit;

  FTablePipeline.First;

  while not(FTablePipeline.EOF) do
    begin
      aTableNames.Add(FTablePipeline.GetFieldValue(FTableFieldNames.TableName));
      aTableAliases.Add(FTablePipeline.GetFieldValue(FTableFieldNames.TableAlias));

      FTablePipeline.Next;
    end;

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetTableAlias }

function TppDataDictionary.GetTableAlias(const aTableName: String): String;
begin

  Result := '';

  if not(TablesOpen) then Exit;

  if FTablePipeline.Locate(FTableFieldNames.TableName, aTableName, [pploCaseInsensitive]) then
    Result := FTablePipeline.GetFieldValue(FTableFieldNames.TableAlias);

end; {function, GetTableAlias}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetFieldAlias }

function TppDataDictionary.GetFieldAlias(const aTableName, aFieldName: String): String;
var
  lsFieldNames: String;
begin

  Result := '';

  if not(FieldsOpen) then Exit;

  lsFieldNames := FFieldFieldNames.TableName + ';' + FFieldFieldNames.FieldName;

  if FFieldPipeline.Locate(lsFieldNames, VarArrayOf([aTableName,aFieldName]), [pploCaseInsensitive]) then
    Result := FFieldPipeline.GetFieldValue(FFieldFieldNames.FieldAlias);

end; {function, GetFieldAlias}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetBuilderSettings }

procedure TppDataDictionary.SetBuilderSettings(aSettings: TppBasicDataSettings);
begin
  FBuilderSettings.Assign(aSettings);
end; {procedure, SetBuilderSettings}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetTableFieldNames }

procedure TppDataDictionary.SetTableFieldNames(aTableFieldNames: TppTableFieldNames);
begin
  FTableFieldNames.Assign(aTableFieldNames);
end; {procedure, SetTableFieldNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetJoinFieldNames }

procedure TppDataDictionary.SetJoinFieldNames(aJoinFieldNames: TppJoinFieldNames);
begin
  FJoinFieldNames.Assign(aJoinFieldNames);
end; {procedure, SetJoinFieldNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetFieldFieldNames }

procedure TppDataDictionary.SetFieldFieldNames(aFieldFieldNames: TppFieldFieldNames);
begin
  FFieldFieldNames.Assign(aFieldFieldNames);
end; {procedure, SetFieldFieldNames}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetJoinPipeline }

procedure TppDataDictionary.SetJoinPipeline(aDataPipeline: TppDataPipeline);
begin

  if (FJoinPipeline <> nil) then
    FJoinPipeline.RemoveNotify(Self);

  FJoinPipeline := aDataPipeline;

  if (FJoinPipeline <> nil) then
    FJoinPipeline.AddNotify(Self);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FAutoJoin := (FJoinPipeline <> nil);

end; {procedure, SetJoinPipeline}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetTablePipeline }

procedure TppDataDictionary.SetTablePipeline(aDataPipeline: TppDataPipeline);
begin

  if (FTablePipeline <> nil) then
    FTablePipeline.RemoveNotify(Self);

  FTablePipeline := aDataPipeline;

  if (FTablePipeline <> nil) then
    FTablePipeline.AddNotify(Self);

end; {procedure, SetTablePipeline}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetFieldPipeline }

procedure TppDataDictionary.SetFieldPipeline(aDataPipeline: TppDataPipeline);
begin

  if (FFieldPipeline <> nil) then
    FFieldPipeline.RemoveNotify(Self);

  FFieldPipeline := aDataPipeline;

  if (FFieldPipeline <> nil) then
    FFieldPipeline.AddNotify(Self);

end; {procedure, SetFieldPipeline}

{------------------------------------------------------------------------------}
{ TppDataDictionary.TablesOpen }

function TppDataDictionary.TablesOpen: Boolean;
begin

  Result := False;

  if (FTablePipeline = nil) then Exit;

  if not(FTablePipeline.Active) then
    try
      FTablePipeline.Open;
    except {on EDatabaseError do}
      Exit;
    end;

  Result := True;

end; {function, TablesOpen}

{------------------------------------------------------------------------------}
{ TppDataDictionary.FieldsOpen }

function TppDataDictionary.FieldsOpen: Boolean;
begin

  Result := False;

  if (FFieldPipeline = nil) then Exit;

  if not(FFieldPipeline.Active) then
    try
      FFieldPipeline.Open;
    except {on EDatabaseError do}
      Exit;
    end;

  Result := True;

end; {function, FieldsOpen}

{------------------------------------------------------------------------------}
{ TppDataDictionary.JoinsOpen }

function TppDataDictionary.JoinsOpen: Boolean;
begin

  Result := False;

  if (FJoinPipeline = nil) then Exit;

  if not(FJoinPipeline.Active) then
    try
      FJoinPipeline.Open;
    except {on EDatabaseError do}
      Exit;
    end;

  Result := True;

end; {function, JoinsOpen}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Open }

procedure TppDataDictionary.Open;
begin
  FActive := True;

  CreateFields;
end; {procedure, Open}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Close }

procedure TppDataDictionary.Close;
begin
  FreeFields;

  FActive := False;
end; {procedure, Close}

{------------------------------------------------------------------------------}
{ TppDataDictionary.Reset }

procedure TppDataDictionary.Reset;
begin
  Close;

  Open;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetActive }

procedure TppDataDictionary.SetActive(aValue: Boolean);
begin
  if (FActive = aValue) then Exit;

  if aValue then
    Open
  else
    Close;

end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TppDataDictionary.SetTableName }

procedure TppDataDictionary.SetTableName(const aName: String);
var
  lsName: String;
  lsTableName: String;
  lsExtension: String;
  lbFileBased: Boolean;
begin

  if (aName = FTableName) then Exit;

  if FActive then
    Close;

  lsName := aName;

  {remove owner name if necessary}
  if not(FUseTableOwnerName) then
    begin
      ppStripOffTableName(lsName, lsTableName, lsExtension, lbFileBased);

      if not(lbFileBased) then
        lsName := lsTableName;
    end;

  FTableName := lsName;

  FTableAlias := GetTableAlias(FTableName);

end; {procedure, SetTableName}

{------------------------------------------------------------------------------}
{ TppDataDictionary.FreeFields }

procedure TppDataDictionary.FreeFields;
var
  liIndex: Integer;
begin
  for liIndex := 0 to FFieldList.Count - 1 do
    TppField(FFieldList.Objects[liIndex]).Free;

  FFieldList.Clear;
end; {procedure, FreeFields}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetField }

function TppDataDictionary.GetField(Index: Integer): TppField;
begin
  if not(FActive) then Open;

  Result := TppField(FFieldList.Objects[Index]);
end; {function, GetField}

{------------------------------------------------------------------------------}
{ TppDataDictionary.GetFieldCount }

function TppDataDictionary.GetFieldCount: Integer;
begin
  if not(FActive) then Open;

  Result := FFieldList.Count;
end; {function, GetFieldCount}

{------------------------------------------------------------------------------}
{ TppDataDictionary.FieldForFieldName }

function TppDataDictionary.FieldForFieldName(const aFieldName: String): TppField;
var
  liField: Integer;
  lsKey: String;
begin
  if not(FActive) then Open;

  lsKey := Uppercase(FTableName) + Uppercase(aFieldName);

  liField := FFieldList.IndexOf(lsKey);

  if liField >= 0 then
    Result := Fields[liField]
  else
    Result := nil;

end; {function, FieldForFieldName}

{------------------------------------------------------------------------------}
{ TppDataDictionary.FindField }

function TppDataDictionary.FindField(aField: TppField): Integer;
begin
  if not(FActive) then Open;

  Result := FFieldList.IndexOfObject(aField);
end; {function, FindField}

{------------------------------------------------------------------------------}
{ TppDataDictionary.AddField }

function TppDataDictionary.AddField(aField: TppField): Integer;
var
  lsKey: String;
begin
  lsKey := Uppercase(FTableName) + Uppercase(aField.FieldName);

  Result := FFieldList.AddObject(lsKey, aField);
end; {function, AddField}

{------------------------------------------------------------------------------}
{ TppDataDictionary.CreateFields }

procedure TppDataDictionary.CreateFields;
var
  lField: TppField;
  lDataType: Variant;
begin

  if not(TablesOpen) then Exit;

  if not(FTablePipeline.Locate(FTableFieldNames.TableName, TableName, [pploCaseInsensitive])) then Exit;

  if not(FieldsOpen) then Exit;

  {must goto first record}
  FFieldPipeline.First;

  if not(FFieldPipeline.Locate(FFieldFieldNames.TableName, TableName, [pploCaseInsensitive])) then Exit;

  {create field maps}
  while (CompareText(FFieldPipeline.GetFieldValue(FFieldFieldNames.TableName), TableName) = 0) and not(FFieldPipeline.EOF) do
    begin
      lField := TppField.Create(nil);

      lField.TableAlias  := TableAlias;
      lField.TableName   := TableName;

      lField.FieldName   := FFieldPipeline.GetFieldValue(FFieldFieldNames.FieldName);
      lField.FieldAlias  := FFieldPipeline.GetFieldValue(FFieldFieldNames.FieldAlias);
      lField.Selectable  := ppStringFieldValueToBoolean(FFieldPipeline.GetFieldValue(FFieldFieldNames.Selectable));
      lField.Searchable  := ppStringFieldValueToBoolean(FFieldPipeline.GetFieldValue(FFieldFieldNames.Searchable));
      lField.Sortable    := ppStringFieldValueToBoolean(FFieldPipeline.GetFieldValue(FFieldFieldNames.Sortable));
      lField.AutoSearch  := ppStringFieldValueToBoolean(FFieldPipeline.GetFieldValue(FFieldFieldNames.AutoSearch));
      lField.Mandatory   := ppStringFieldValueToBoolean(FFieldPipeline.GetFieldValue(FFieldFieldNames.Mandatory));

      {convert the data type to an enumerated type}
      lDataType := FFieldPipeline.GetFieldValue(FFieldFieldNames.DataType);

      if not(VarIsNull(lDataType)) and (Length(lDataType) <> 0) then
        lField.DataType := TppDataType(ppGetEnumStringAsInteger(TypeInfo(TppDataType), lDataType));

      AddField(lField);

      FFieldPipeline.Next;
    end;

end; {function, CreateFields}

{------------------------------------------------------------------------------}
{ TppDataDictionary.AppendTableRecord }

procedure TppDataDictionary.AppendTableRecord(const aTableName, aTableAlias: String);
begin

  if not(TablesOpen) then Exit;

  FTablePipeline.Insert;

  FTablePipeline.SetFieldValue(FTableFieldNames.TableName, aTableName);
  FTablePipeline.SetFieldValue(FTableFieldNames.TableAlias, aTableAlias);

  FTablePipeline.Post;

end; {procedure, AppendTableRecord}

{------------------------------------------------------------------------------}
{ TppDataDictionary.AppendFieldRecord }

procedure TppDataDictionary.AppendFieldRecord(const aTableName, aFieldName, aFieldAlias,
                                              aSelectable, aSearchable, aSortable, aAutoSearch, aDataType: String);
begin

  if not(FieldsOpen) then Exit;

  FFieldPipeline.Insert;

  FFieldPipeline.SetFieldValue(FFieldFieldNames.TableName, aTableName);

  FFieldPipeline.SetFieldValue(FFieldFieldNames.FieldName, aFieldName);

  if (aFieldAlias = '') then
    FFieldPipeline.SetFieldValue(FFieldFieldNames.FieldAlias, aFieldName)
  else
    FFieldPipeline.SetFieldValue(FFieldFieldNames.FieldAlias, aFieldAlias);

  FFieldPipeline.SetFieldValue(FFieldFieldNames.Selectable, aSelectable);
  FFieldPipeline.SetFieldValue(FFieldFieldNames.Searchable, aSearchable);
  FFieldPipeline.SetFieldValue(FFieldFieldNames.Sortable, aSortable);

  FFieldPipeline.SetFieldValue(FFieldFieldNames.AutoSearch, aAutoSearch);
  FFieldPipeline.SetFieldValue(FFieldFieldNames.DataType, aDataType);

  FFieldPipeline.Post;

end; {procedure, AppendFieldRecord}

{------------------------------------------------------------------------------}
{ TppDataDictionary.AppendJoinRecord }

procedure TppDataDictionary.AppendJoinRecord(const aTableName1, aTableName2, aJoinType: String;
                                             aFieldNames1, aFieldNames2, aOperators: TStrings);
begin

  if not(JoinsOpen) then Exit;

  FJoinPipeline.Insert;

  FJoinPipeline.SetFieldValue(FJoinFieldNames.TableName1, aTableName1);
  FJoinPipeline.SetFieldValue(FJoinFieldNames.TableName2, aTableName2);
  FJoinPipeline.SetFieldValue(FJoinFieldNames.JoinType, aJoinType);
  FJoinPipeline.SetFieldValue(FJoinFieldNames.FieldNames1, ppCombineStrings(aFieldNames1));
  FJoinPipeline.SetFieldValue(FJoinFieldNames.FieldNames2, ppCombineStrings(aFieldNames2));
  FJoinPipeline.SetFieldValue(FJoinFieldNames.Operators, ppCombineStrings(aOperators));

  FJoinPipeline.Post;
  
end; {procedure, AppendJoinRecord}


{******************************************************************************
 *
 ** B A S I C   D A T A   S E T T I N G S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.Create }

constructor TppBasicDataSettings.Create(aParent: TppCommunicator);
begin

  inherited Create;

  FActive := True;
  FDatabaseName := '';
  FSessionType := 'BDESession';
  FOnChange := nil;
  FParent := aParent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.Assign }

procedure TppBasicDataSettings.Assign(Source: TPersistent);
var
  lSourceSettings: TppBasicDataSettings;
begin

  if (Source is TppBasicDataSettings) then
    begin
      FActive := False;

      lSourceSettings := TppBasicDataSettings(Source);

      FDatabaseName := lSourceSettings.DatabaseName;
      FSessionType := lSourceSettings.SessionType;

      FActive := True;
    end;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.IsActive }

function TppBasicDataSettings.IsActive: Boolean;
begin

  Result := False;

  if (Parent = nil) then Exit;

  if (csReading in Parent.ComponentState) or (csLoading in Parent.ComponentState) then Exit;

  if (csDestroying in Parent.ComponentState) then Exit;

  Result := FActive;

end;  {function, IsActive}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.DoOnChange }

procedure TppBasicDataSettings.DoOnChange;
begin

  if not(IsActive) then Exit;

  if Assigned(FOnChange) then FOnChange(Self);

end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.SetDatabaseName }

procedure TppBasicDataSettings.SetDatabaseName(aDatabaseName: TFileName);
begin

  FDatabaseName := aDatabaseName;

  DoOnChange;

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.SetSessionType }

procedure TppBasicDataSettings.SetSessionType(aSessionType: String);
begin

  FSessionType := aSessionType;

  if not(IsActive) then Exit;

  FDatabaseName := '';

  DoOnChange;

end; {procedure, SetSessionType}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.LoadStateInfo }

procedure TppBasicDataSettings.LoadStateInfo(aIniFile: TIniFile; aDataModule: TppCommunicator); 
begin
  FDatabaseName := aIniFile.ReadString('DataAccess', 'DatabaseName',  'DBDEMOS');
  FSessionType  := aIniFile.ReadString('DataAccess', 'SessionType',   'BDESession');

end; {procedure, LoadStateInfo}

{------------------------------------------------------------------------------}
{ TppBasicDataSettings.SaveStateInfo }

procedure TppBasicDataSettings.SaveStateInfo(aIniFile: TIniFile);
begin
  aIniFile.WriteString('DataAccess',  'DatabaseName',  FDatabaseName);
  aIniFile.WriteString('DataAccess',  'SessionType',   FSessionType);

end; {procedure, SaveStateInfo}

{******************************************************************************
 *
 ** D A T A   S E T T I N G S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataSettings.Create }

constructor TppDataSettings.Create(aParent: TppCommunicator);
begin

  inherited Create(aParent);

  FAllowEditSQL := False;
  FDatabaseType := dtOther;
  FDataDictionary := nil;
  FSQLType := sqBDELocal;
  FUseDataDictionary := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataSettings.Assign }

procedure TppDataSettings.Assign(Source: TPersistent);
var
  lSourceSettings: TppDataSettings;
begin

  if (Source is TppDataSettings) then
    begin
      FActive := False;

      lSourceSettings := TppDataSettings(Source);

      {copy basic settings props, since inherited is not called}
      FDatabaseName := lSourceSettings.DatabaseName;
      FDatabaseType := lSourceSettings.DatabaseType;
      FSessionType := lSourceSettings.SessionType;

      FAllowEditSQL := lSourceSettings.AllowEditSQL;
      SetDataDictionary(lSourceSettings.DataDictionary);
      FSQLType := lSourceSettings.SQLType;
      FUseDataDictionary := lSourceSettings.UseDataDictionary;

      FActive := True;
    end;

  DoOnChange;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetDataDictionary }

procedure TppDataSettings.SetDataDictionary(aDataDictionary: TppDataDictionary);
begin

  if (FDataDictionary <> nil) and (FParent <> nil) then
    FParent.RemoveNotify(FDataDictionary);

  FDataDictionary := aDataDictionary;

  if (FDataDictionary <> nil) and (FParent <> nil) then
    FParent.AddNotify(FDataDictionary);

end; {procedure, SetDataDictionary}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetAllowEditSQL }

procedure TppDataSettings.SetAllowEditSQL(aValue: Boolean);
begin

  FAllowEditSQL := aValue;

  DoOnChange;
  
end; {procedure, SetAllowEditSQL}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetDatabaseType }

procedure TppDataSettings.SetDatabaseType(aDatabaseType: TppDatabaseType);
begin

  FDatabaseType := aDatabaseType;

  DoOnChange;

end; {procedure, SetDatabaseType}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetSQLType }

procedure TppDataSettings.SetSQLType(aSQLType: TppSQLType);
begin

  FSQLType := aSQLType;

  DoOnChange;

end; {procedure, SetSQLType}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetUseDataDictionary }

procedure TppDataSettings.SetUseDataDictionary(aValue: Boolean);
begin

  FUseDataDictionary := aValue;

  DoOnChange;

end; {procedure, SetUseDataDictionary}

{------------------------------------------------------------------------------}
{ TppDataSettings.SetSessionType }

procedure TppDataSettings.SetSessionType(aSessionType: String);
begin

  {assign basic setting props, since inherited is not called}
  FSessionType := aSessionType;

  if not(IsActive) then Exit;

  FDatabaseName := '';

  {set default SQlType}
  if (FSessionType <> 'BDESession') and (FSQLType = sqBDELocal) then
    FSQLType := sqSQL1;

  DoOnChange;
  
end; {procedure, SetSessionType}

{------------------------------------------------------------------------------}
{ TppDataSettings.LoadStateInfo }

procedure TppDataSettings.LoadStateInfo(aIniFile: TIniFile; aDataModule: TppCommunicator);
var
  lsDataDictionary: String;
  lDataDictList: TppCommunicatorPickList;
  liIndex: Integer;
begin

  inherited LoadStateInfo(aIniFile, aDataModule);

  FDatabaseType := TppDatabaseType(aIniFile.ReadInteger('DataAccess', 'DatabaseType',  Ord(dtParadox)));
  FSQLType := TppSQLType(aIniFile.ReadInteger('DataAccess', 'SQLType', Ord(sqBDELocal)));
  FAllowEditSQL := aIniFile.ReadBool('DataAccess', 'AllowEditSQL', True);
  FUseDataDictionary := aIniFile.ReadBool('DataAccess', 'UseDataDictionary', False);

  lsDataDictionary := aIniFile.ReadString('DataAccess', 'DataDictionary',  '');

  if lsDataDictionary = '' then
    FDataDictionary := nil
  else
    begin
      lDataDictList := TppCommunicatorPickList.Create(aDataModule, TppDataDictionary);
      liIndex := lDataDictList.IndexOf(lsDataDictionary);
      if liIndex >= 0 then
        FDataDictionary := TppDataDictionary(lDataDictList.Objects[liIndex])
      else
        FDataDictionary := nil;

      lDataDictList.Free;  
    end;

end; {procedure, LoadStateInfo}

{------------------------------------------------------------------------------}
{ TppDataSettings.SaveStateInfo }

procedure TppDataSettings.SaveStateInfo(aIniFile: TIniFile);
begin

  inherited SaveStateInfo(aIniFile);

  aIniFile.WriteInteger('DataAccess', 'DatabaseType',      Ord(FDatabaseType));
  aIniFile.WriteInteger('DataAccess', 'SQLType',           Ord(FSQLType));
  aIniFile.WriteBool('DataAccess',    'AllowEditSQL',      FAllowEditSQL);
  aIniFile.WriteBool('DataAccess',    'UseDataDictionary', FUseDataDictionary);

  if FDataDictionary <> nil then
    aIniFile.WriteString('DataAccess', 'DataDictionary', FDataDictionary.UserName);

end; {procedure, SaveStateInfo}

{------------------------------------------------------------------------------}
{ TppDataDictionary.ValidSettings }

function TppDataDictionary.ValidSettings: Boolean;
var
  lFieldPropertyLists: TList;
  lFieldNameLists: TList;
  lPipelines: TStrings;
  lFieldNames: TStrings;
  lFieldProperties: TStrings;
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;
  lsPropertyName: String;
begin

  Result := True;

  lPipelines := TStringList.Create;
  lFieldPropertyLists := TList.Create;
  lFieldNameLists := TList.Create;


  lPipelines.AddObject('TablePipeline', FTablePipeline);

  lFieldProperties := TStringList.Create;
  lFieldProperties.Add('TableName');
  lFieldProperties.Add('TableAlias');
  lFieldPropertyLists.Add(lFieldProperties);

  lFieldNames := TStringList.Create;
  lFieldNames.Add(FTableFieldNames.TableName);
  lFieldNames.Add(FTableFieldNames.TableAlias);
  lFieldNameLists.Add(lFieldNames);


  lPipelines.AddObject('FieldPipeline', FFieldPipeline);

  lFieldProperties := TStringList.Create;
  lFieldProperties.Add('AutoSearch');
  lFieldProperties.Add('DataType');
  lFieldProperties.Add('FieldAlias');
  lFieldProperties.Add('FieldName');
  lFieldProperties.Add('Mandatory');
  lFieldProperties.Add('Searchable');
  lFieldProperties.Add('Selectable');
  lFieldProperties.Add('Sortable');
  lFieldProperties.Add('TableName');
  lFieldPropertyLists.Add(lFieldProperties);

  lFieldNames := TStringList.Create;
  lFieldNames.Add(FFieldFieldNames.AutoSearch);
  lFieldNames.Add(FFieldFieldNames.DataType);
  lFieldNames.Add(FFieldFieldNames.FieldAlias);
  lFieldNames.Add(FFieldFieldNames.FieldName);
  lFieldNames.Add(FFieldFieldNames.Mandatory);
  lFieldNames.Add(FFieldFieldNames.Searchable);
  lFieldNames.Add(FFieldFieldNames.Selectable);
  lFieldNames.Add(FFieldFieldNames.Sortable);
  lFieldNames.Add(FFieldFieldNames.TableName);
  lFieldNameLists.Add(lFieldNames);


  if (FAutoJoin) then
    begin
      lPipelines.AddObject('JoinPipeline', FJoinPipeline);

      lFieldProperties := TStringList.Create;
      lFieldProperties.Add('FieldNames1');
      lFieldProperties.Add('FieldNames2');
      lFieldProperties.Add('JoinType');
      lFieldProperties.Add('Operators');
      lFieldProperties.Add('TableName1');
      lFieldProperties.Add('TableName2');
      lFieldPropertyLists.Add(lFieldProperties);

      lFieldNames := TStringList.Create;
      lFieldNames.Add(FJoinFieldNames.FieldNames1);
      lFieldNames.Add(FJoinFieldNames.FieldNames2);
      lFieldNames.Add(FJoinFieldNames.JoinType);
      lFieldNames.Add(FJoinFieldNames.Operators);
      lFieldNames.Add(FJoinFieldNames.TableName1);
      lFieldNames.Add(FJoinFieldNames.TableName2);
      lFieldNameLists.Add(lFieldNames);
    end;

  liIndex := 0;

  while (Result) and (liIndex < lPipelines.Count) do
    begin
      lDataPipeline := TppDataPipeline(lPipelines.Objects[liIndex]);
      lsPropertyName := lPipelines[liIndex];

      lFieldProperties := TStringList(lFieldPropertyLists[liIndex]);
      lFieldNames := TStringList(lFieldNameLists[liIndex]);

      if not(ValidDataPipeline(lDataPipeline, lsPropertyName)) or
         not(ValidDataPipelineFields(lDataPipeline, lsPropertyName, lFieldProperties, lFieldNames)) then
        Result := False
      else
        Inc(liIndex);
    end;

  for liIndex := 0 to lFieldPropertyLists.Count - 1 do
    TStringList(lFieldPropertyLists[liIndex]).Free;

  for liIndex := 0 to lFieldNameLists.Count - 1 do
    TStringList(lFieldNameLists[liIndex]).Free;

  lFieldPropertyLists.Free;
  lFieldNameLists.Free;
  lPipelines.Free;

end; {function, ValidSettings}

{------------------------------------------------------------------------------}
{ TppDataDictionary.ValidDataPipeline }

function TppDataDictionary.ValidDataPipeline(aDataPipeline: TppDataPipeline; const aPropertyName: String): Boolean;
begin

  Result := True;

  if (aDataPipeline <> nil) then
    begin

      try
        aDataPipeline.Open;
      except
        FErrorMessage := ppLoadStr(682); {'DataDictionary.<name> ''<name>'' could not be opened.'}
        FErrorMessage := ppSetMessageParameters(FErrorMessage);
        FErrorMessage := Format(FErrorMessage, [aPropertyName, aDataPipeline.Name]);

        Result := False;
      end;

      if Result and not(aDataPipeline.Active) then
        begin
          FErrorMessage := ppLoadStr(682); {'DataDictionary.<name> ''<name>'' could not be opened.'}
          FErrorMessage := ppSetMessageParameters(FErrorMessage);
          FErrorMessage := Format(FErrorMessage, [aPropertyName, aDataPipeline.Name]);

          Result := False;
        end;
    end

  else
    begin
      FErrorMessage := ppLoadStr(683); {'DataDictionary.<name> property is not assigned.'};
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, [aPropertyName]);

      Result := False;
    end;

end; {function, ValidDataPipeline}

{------------------------------------------------------------------------------}
{ TppDataDictionary.ValidDataPipelineFields }

function TppDataDictionary.ValidDataPipelineFields(aDataPipeline: TppDataPipeline; const aPropertyName: String;
                                                   aFieldProperties, aFieldNames: TStrings): Boolean;
var
  lFieldNames: TStringList;
  liIndex: Integer;
  lsFieldName: String;
  lsFieldPropertyName: String;
begin

  Result := True;

  lFieldNames := TStringList.Create;

  aDataPipeline.GetFieldNames(lFieldNames);

  liIndex := 0;

  while Result and (liIndex < aFieldNames.Count) do
    begin
      lsFieldName := aFieldNames[liIndex];
      lsFieldPropertyName := aFieldProperties[liIndex];

      if (lFieldNames.IndexOf(lsFieldName) = -1) then
        begin
          FErrorMessage := ppLoadStr(684); {'<name>.<name> field: ''<name>'' could not be found.'}
          FErrorMessage := ppSetMessageParameters(FErrorMessage);
          FErrorMessage := Format(FErrorMessage, [aPropertyName, lsFieldPropertyName, lsFieldName]);

          Result := False;
        end
      else
        Inc(liIndex);
    end;

  lFieldNames.Free;

end; {function, ValidDataPipelineFields}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDataDictionary]);

finalization

  UnRegisterClasses([TppDataDictionary]);

end.
