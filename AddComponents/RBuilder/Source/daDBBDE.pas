{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDBBDE;

interface

{$I ppIfDef.pas}

uses Classes, SysUtils, Forms, ExtCtrls, DB, DBTables,
     ppClass, ppDBPipe, ppDB, ppDBBDE, ppClasUt, ppUtils, ppTypes,
     daDB, daQuery, daDataVw, daDatPrv, daQClass, ppComm;



type

  {BDE Dependent DataView Classes:

     1.  BDE TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildBDEQuery - TQuery descendant that can be a child of a DataView
       b. TdaChildBDETable - TTable descendant that can be a child of a DataView
       c. TdaChildBDEStoredProc - TStoredProc descendant that can be a child of a DataView


     2.  TdaBDESession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     3.  TdaBDEDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     4.  TdaBDEQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the SQL built by the QueryWizard to assign
            SQL to the TQuery etc.

      }

  { TdaChildBDEQuery }
  TdaChildBDEQuery = class(TQuery)
    public
      function HasParent: Boolean; override;
  end;  {class, TdaChildBDEQuery}

  { TdaChildBDETable }
  TdaChildBDETable = class(TTable)
    public
      function HasParent: Boolean; override;
  end;  {class, TdaChildBDETable}

  { TdaChildBDEStoredProc }
  TdaChildBDEStoredProc = class(TStoredProc)
    public
      function HasParent: Boolean; override;
  end;  {class, TdaChildBDEStoredProc}


  { TdaBDESession }
  TdaBDESession = class(TdaSession)
    private
      function GetAliasDriverName(const aAlias: String): String;
      function IsInterBase(const aDriverName: String): Boolean;
      function IsMSAccess(const aDriverName: String): Boolean;
      function IsMSSQLServer(const aDriverName: String): Boolean;
      function IsOracle(const aDriverName: String): Boolean;
      function IsParadox(const aDriverName: String): Boolean;
      function IsSybaseASA(const aDriverName: String): Boolean;
      function IsSybaseASE(const aDriverName: String): Boolean;

      procedure AddDatabase(aDatabase: TComponent);

    protected
      procedure SetDataOwner(aDataOwner: TComponent); override;

    public
      class function ClassDescription: String; override;
      class function DataSetClass: TdaDataSetClass; override;
      class function DatabaseClass: TComponentClass; override;

      procedure GetDatabaseNames(aList: TStrings); override;
      function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; override;
      procedure GetTableNames(const aDatabaseName: String; aList: TStrings); override;
      function  ValidDatabaseTypes: TppDatabaseTypes; override;

  end; {class, TdaBDESession}


  { TdaBDEDataSet }
  TdaBDEDataSet = class(TdaDataSet)
    private
      FQuery: TQuery;

      function GetQuery: TQuery;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

      property Query: TQuery read GetQuery;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaBDEDataSet}


  { TdaBDEQueryDataView }
  TdaBDEQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildBDEQuery;

    protected
      procedure Loaded; override;
      procedure UpdateQueryObject;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function PreviewFormClass: TFormClass; override;
      class function SessionClass: TClass; override;

      procedure Init; override;
      procedure ConnectPipelinesToData; override;

      procedure SQLChanged; override;

    published
      property DataSource: TppChildDataSource read FDataSource;

  end; {class, TdaBDEQueryDataView}




  { TdaBDETemplateDataView }
  TdaBDETemplateDataView = class(TdaCustomDataView)
    private
      FDatabaseName: String;

    protected
      procedure SetDatabaseName(aDatabaseName: String); virtual;

    public
      {defines BDESession as the session class}
      class function SessionClass: TClass; override;

      {returns True}
      class function IsTemplate: Boolean; override;

      {descendants should call these to create data access objects}
      function CreateQuery: TQuery;
      function CreateTable(aTableName: String): TTable;
      function CreateStoredProc(aStoredProcName: String): TStoredProc;
      function CreateDataSource: TDataSource;
      function CreateDataPipeline: TppBDEPipeline;
      function CreatePipelineField(aTableName, aFieldName, aFieldAlias: String;
                             aDataPipeline: TppDataPipeline; aSearchable, aSortable: Boolean): TppField;

      property DatabaseName: String read FDatabaseName write SetDatabaseName;

    published

      property Report;

  end; {class, TdaBDETemplateDataView}



  { TdaBDEQueryTemplateDataView }
  TdaBDEQueryTemplateDataView = class(TdaBDETemplateDataView)
    private
      FQuery: TQuery;
      FDataSource: TDataSource;
      FDataPipeline: TppBDEPipeline;
      FSQL: TdaSQL;

    protected
      procedure Loaded; override;
      procedure SetDatabaseName(aDatabaseName: String); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure CreateDataPipelines; override;
      procedure CreatePipelineFields(aDataPipeline: TppDataPipeline); override;

      procedure ConnectPipelinesToData; override;
      procedure DefineDataSelection; override;

      procedure Init; override;

      function  AddSelectTable(aTableName: String): TdaTable;
      function  AddSelectField(aTable: TdaTable; aFieldName, aFieldAlias: String; aSearchable, aSortable: Boolean): TdaField;
      procedure DefineSelectedFields; virtual;
      procedure DefineCalculatedFields; virtual;
      procedure DefineSelectionCriteria; virtual;
      procedure DefineSortOrder; virtual;

      procedure BuildSQL;

      property SQL: TdaSQL read FSQL;

    published
      property DataPipeline: TppBDEPipeline read FDataPipeline write FDataPipeline;
      property Query: TQuery read FQuery;
      property DataSource: TDataSource read FDataSource;

  end; {class, TdaBDEQueryTemplateDataView}


  {global functions to access default BDE connection}
  function daGetDefaultBDEDatabase: TDatabase;

  {utility routines}
  procedure daGetBDEDatabaseNames(aList: TStrings);
  function daGetBDEDatabaseForName(aDatabaseName: String): TDatabase;
  function daGetBDESessionForDatabase(aDatabaseName: String): TSession;

  function daGetBDEDatabaseList: TppComponentList;


implementation

const
  cDefaultConnection = 'DefaultBDEDatabase';

var
  FBDEDatabase: TDatabase;
  FBDEDatabaseList: TppComponentList;



{******************************************************************************
 *
 ** C H I L D   B D E  D A T A   A C C E S S   C O M P O N E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildBDEQuery.HasParent }

function TdaChildBDEQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildBDETable.HasParent }

function TdaChildBDETable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{------------------------------------------------------------------------------}
{ TdaChildBDEStoredProc.HasParent }

function TdaChildBDEStoredProc.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}




{******************************************************************************
 *
 ** B D E   S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaBDESession.ClassDescription }

class function TdaBDESession.ClassDescription: String;
begin
  Result := 'BDESession';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaBDESession.DataSetClass }

class function TdaBDESession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaBDEDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaBDESession.DatabaseClass }

class function TdaBDESession.DatabaseClass: TComponentClass;
begin
  Result := TDatabase;
end; {class function, DatabaseClass}

{------------------------------------------------------------------------------}
{ TdaBDESession.GetTableNames }

procedure TdaBDESession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lSession: TSession;
  lDatabase: TDatabase;

begin
  lSession  := daGetBDESessionForDatabase(aDatabaseName);

  lDatabase := daGetBDEDatabaseForName(aDatabaseName);

  lSession.GetTableNames(lDatabase.DatabaseName, '*.*', True, False, aList);

end; {procedure, GetTableNames}


{------------------------------------------------------------------------------}
{ TdaBDESession.AddDatabase }

procedure TdaBDESession.AddDatabase(aDatabase: TComponent);
begin

  if daGetBDEDatabaseList.IndexOf(aDatabase) < 0 then
    FBDEDatabaseList.Add(aDatabase);

end; {procedure, AddDatabase}


{------------------------------------------------------------------------------}
{ TdaBDESession.GetDatabaseNames }

procedure TdaBDESession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;
  lDBList: TStrings;
  lDatabase: TDatabase;

begin
  {call utility routine to get list of database names}
  daGetBDEDatabaseNames(aList);

  lDBList := TStringList.Create;

  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), lDBList, DataOwner);

  for liIndex := 0 to lDBList.Count-1 do
    begin
      lDatabase := TDatabase(lDBList.Objects[liIndex]);

      if aList.IndexOf(lDatabase.Name) < 0 then
        aList.AddObject(lDatabase.Name, lDatabase);

      AddDatabase(lDatabase);

    end;

  lDBList.Free;

end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaBDESession.SetDataOwner }

procedure TdaBDESession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}


{------------------------------------------------------------------------------}
{ TdaBDESession.ValidDatabaseTypes }

function TdaBDESession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  Result := [dtParadox, dtInterBase, dtMSAccess, dtMSSQLServer, dtSybaseASA, dtSybaseASE, dtOracle, dtOther];
end; {procedure, ValidDatabaseTypes}

{------------------------------------------------------------------------------}
{ TdaBDESession.GetDatabaseType }

function TdaBDESession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
var
  lsDriverName: String;
begin

  lsDriverName := GetAliasDriverName(aDatabaseName);

  if IsParadox(lsDriverName) then
    Result := dtParadox

  else if IsInterBase(lsDriverName) then
    Result := dtInterBase

  else if IsMSAccess(lsDriverName) then
    Result := dtMSAccess

  else if IsMSSQLServer(lsDriverName) then
    Result := dtMSSQLServer

  else if IsSybaseASA(lsDriverName) then
    Result := dtSybaseASA

  else if IsSybaseASE(lsDriverName) then
    Result := dtSybaseASE

  else if IsOracle(lsDriverName) then
    Result := dtOracle

  else
    Result := dtOther;

end; {function, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsMSSQLServer }

function TdaBDESession.IsMSSQLServer(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('SQL', lsDriverName) > 0);

  if (Result) then
    Result := (Pos('SERVER', lsDriverName) > 0);

end; {procedure, IsMSSQLServer}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsSybaseASE }

function TdaBDESession.IsSybaseASE(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('SYBASE', lsDriverName) > 0);

  if (Result) then
    Result := not(IsSybaseASA(aDriverName));

end; {procedure, IsSybaseASE}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsSybaseASA}

function TdaBDESession.IsSybaseASA(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('SQL', lsDriverName) > 0) or (Pos('ADAPTIVE', lsDriverName) > 0);

  if (Result) then
    Result := (Pos('ANYWHERE', lsDriverName) > 0);

end; {procedure, IsSybaseASA}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsInterBase }

function TdaBDESession.IsInterBase(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('INTRBASE', lsDriverName) > 0);

  if not(Result) then
    Result := (Pos('INTERBASE', lsDriverName) > 0);

end; {procedure, IsInterBase}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsMSAccess }

function TdaBDESession.IsMSAccess(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('ACCESS', lsDriverName) > 0);

end; {procedure, IsMSAccess}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsParadox }

function TdaBDESession.IsParadox(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('STANDARD', lsDriverName) > 0);

end; {procedure, IsParadox}

{------------------------------------------------------------------------------}
{ TdaBDESession.IsOracle }

function TdaBDESession.IsOracle(const aDriverName: String): Boolean;
var
  lsDriverName: String;
begin

  lsDriverName := Uppercase(aDriverName);

  Result := (Pos('ORACLE', lsDriverName) > 0);

end; {procedure, IsOracle}

{------------------------------------------------------------------------------}
{ TdaBDESession.GetAliasDriverName }

function TdaBDESession.GetAliasDriverName(const aAlias: String): String;
var
  lDatabase: TDatabase;
  lSession: TSession;
  
begin

  Result := '';
  
  {try to get driver name from the session}
  if (aAlias <> '') and Session.IsAlias(aAlias) then
    Result := Session.GetAliasDriverName(aAlias)
  else
    begin

      {try to get the TDatabase object}
      lDatabase := daGetBDEDatabaseForName(aAlias);
      lSession  := daGetBDESessionForDatabase(aAlias);

      {return the drivername using Database.AliasName or Database.DriverName as appropriate}
      if lDatabase <> nil then
        if (lDatabase.AliasName <> '' ) and lSession.IsAlias(lDatabase.AliasName) then
          Result := lSession.GetAliasDriverName(lDatabase.AliasName)
        else
          Result := lDatabase.DriverName;

    end;


end; {function, GetAliasDriverName}


{******************************************************************************
 *
 ** B D E   D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.Create }

constructor TdaBDEDataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FQuery := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.Destroy }

destructor TdaBDEDataSet.Destroy;
begin

  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.ClassDescription }

class function TdaBDEDataSet.ClassDescription: String;
begin
  Result := 'BDEDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.GetActive }

function TdaBDEDataSet.GetActive: Boolean;
begin
  Result := GetQuery.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.SetActive }

procedure TdaBDEDataSet.SetActive(Value: Boolean);
begin
  GetQuery.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.GetQuery }

function TdaBDEDataSet.GetQuery: TQuery;
begin

  if (FQuery = nil) then
    FQuery := TQuery.Create(Self);

  Result := FQuery;

end; {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.SetDatabaseName }

procedure TdaBDEDataSet.SetDatabaseName(const aDatabaseName: String);
begin

  inherited SetDatabaseName(aDatabaseName);

  if GetQuery.Active then
    FQuery.Active := False;

  FQuery.DatabaseName := daGetBDEDatabaseForName(aDatabaseName).DatabaseName;
  FQuery.SessionName  := daGetBDESessionForDatabase(aDatabaseName).SessionName;


end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.SetDataName }

procedure TdaBDEDataSet.SetDataName(const aDataName: String);
begin

  inherited SetDataName(aDataName);

  {dataset cannot be active to set data name}
  if GetQuery.Active then
    FQuery.Active := False;

  {construct an SQL statment that returns an empty result set,
   this is used to get the field information }
  FQuery.SQL.Text := 'SELECT * FROM ' + aDataName +
                     ' WHERE ''c'' <> ''c'' ';

end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.BuildFieldList }

procedure TdaBDEDataSet.BuildFieldList;
var
  liIndex: Integer;
  lBDEField: TField;
  lField: TppField;
begin

  inherited BuildFieldList;

  if not(GetQuery.Active) then
    FQuery.Active := True;

  for liIndex := 0 to FQuery.FieldCount - 1 do
    begin
      lBDEField := FQuery.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.TableName    := DataName;
      lField.FieldName    := lBDEField.FieldName;
      lField.DataType     := ppConvertFieldType(lBDEField.DataType);

      AddField(lField);
    end;

end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.GetFieldNamesForSQL }

procedure TdaBDEDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TQuery;
begin
  aList.Clear;

  lQuery := TQuery.Create(Self);

  lQuery.DatabaseName := daGetBDEDatabaseForName(DatabaseName).DatabaseName;
  lQuery.SessionName  := daGetBDESessionForDatabase(DatabaseName).SessionName;
  lQuery.SQL := aSQL;

  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaBDEDataSet.GetFieldsForSQL }

procedure TdaBDEDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TQuery;
  lBDEField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  lQuery := TQuery.Create(Self);

  lQuery.DatabaseName := daGetBDEDatabaseForName(DatabaseName).DatabaseName;
  lQuery.SessionName  := daGetBDESessionForDatabase(DatabaseName).SessionName;

  lQuery.SQL := aSQL;

  lQuery.Active := True;

  for liIndex := 0 to lQuery.FieldCount - 1 do
    begin
      lBDEField := lQuery.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.FieldName    := lBDEField.FieldName;
      lField.DataType     := ppConvertFieldType(lBDEField.DataType);

      aList.Add(lField);
    end;

  lQuery.Free;

end; {procedure, GetFieldsForSQL}


{******************************************************************************
 *
 ** B D E  Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.Create }

constructor TdaBDEQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildBDEQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);

  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.Destroy }

destructor TdaBDEQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.SessionClass }

class function TdaBDEQueryDataView.SessionClass: TClass;
begin
  Result := TdaBDESession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.PreviewFormClass }

class function TdaBDEQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.Loaded }

procedure TdaBDEQueryDataView.Loaded;
begin

  inherited Loaded;

  UpdateQueryObject;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.ConnectPipelinesToData }

procedure TdaBDEQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}


{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.Init }

procedure TdaBDEQueryDataView.Init;
var
  lDataPipeline: TppChildBDEPipeline;

begin

  inherited Init;

  if DataPipelineCount > 0 then Exit;

  {note: DataView's owner must own the DataPipeline }
  lDataPipeline := TppChildBDEPipeline(ppComponentCreate(Self, TppChildBDEPipeline));
  lDataPipeline.DataSource := FDataSource;
 
  lDataPipeline.AutoCreateFields := False;

  {add DataPipeline to the dataview }
  lDataPipeline.DataView := Self;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.SQLChanged }

procedure TdaBDEQueryDataView.SQLChanged;
begin
  UpdateQueryObject;
end; {procedure, SQLChanged}

{------------------------------------------------------------------------------}
{ TdaBDEQueryDataView.UpdateQueryObject }

procedure TdaBDEQueryDataView.UpdateQueryObject;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.DatabaseName := daGetBDEDatabaseForName(SQL.DatabaseName).DatabaseName;
  FQuery.SessionName  := daGetBDESessionForDatabase(FQuery.DatabaseName).SessionName;
  FQuery.SQL := SQL.SQLText;

end; {procedure, UpdateQueryObject}



{******************************************************************************
 *
 ** B D E  T E M P L A T E  D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.IsTemplate }

class function TdaBDETemplateDataView.IsTemplate: Boolean;
begin
  Result := True;
end; {function, IsTemplate}



{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.SessionClass }

class function TdaBDETemplateDataView.SessionClass: TClass;
begin
  Result := TdaBDESession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.SetDatabaseName }

procedure TdaBDETemplateDataView.SetDatabaseName(aDatabaseName: String);
begin
  FDatabaseName := aDatabaseName;

end; {procedure, SetDatabaseName}


{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreateQuery }

function TdaBDETemplateDataView.CreateQuery: TQuery;
begin
  Result := TdaChildBDEQuery.Create(Self);
  Result.DatabaseName := daGetBDEDatabaseForName(DatabaseName).DatabaseName;
  Result.SessionName  := daGetBDESessionForDatabase(DatabaseName).SessionName;


end; {procedure, CreateQuery}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreateTable }

function TdaBDETemplateDataView.CreateTable(aTableName: String): TTable;
begin
  Result := TdaChildBDETable.Create(Self);
  Result.DatabaseName := daGetBDEDatabaseForName(DatabaseName).DatabaseName;
  Result.SessionName  := daGetBDESessionForDatabase(DatabaseName).SessionName;

  Result.TableName := aTableName;


end; {procedure, CreateTable}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreateStoredProc }

function TdaBDETemplateDataView.CreateStoredProc(aStoredProcName: String): TStoredProc;
begin
  Result := TdaChildBDEStoredProc.Create(Self);
  Result.DatabaseName := daGetBDEDatabaseForName(DatabaseName).DatabaseName;
  Result.SessionName  := daGetBDESessionForDatabase(DatabaseName).SessionName;

  Result.StoredProcName := aStoredProcName;


end; {procedure, CreateStoredProc}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreateDataSource }

function TdaBDETemplateDataView.CreateDataSource: TDataSource;
begin
  Result := TppChildDataSource.Create(Self);

end; {procedure, CreateDataSource}

{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreateDataPipeline }

function TdaBDETemplateDataView.CreateDataPipeline: TppBDEPipeline;
begin

  {note: DataView's owner must own the DataPipeline }
  Result := TppChildBDEPipeline(ppComponentCreate(Self, TppChildBDEPipeline));

  {add pipeline to the dataview's Pipelines[] array}
  Result.DataView := Self;

end; {procedure, CreateDataPipeline}



{------------------------------------------------------------------------------}
{ TdaBDETemplateDataView.CreatePipelineField }

function TdaBDETemplateDataView.CreatePipelineField(aTableName, aFieldName, aFieldAlias: String;
                             aDataPipeline: TppDataPipeline; aSearchable, aSortable: Boolean): TppField;
begin

  Result := TppField.Create(nil);

  {set field props}
  Result.TableName     := aTableName;
  Result.FieldName     := aFieldName;

  if (aFieldAlias <> '') then
    Result.FieldAlias    := aFieldAlias
  else
    Result.FieldAlias    := aFieldName;

  Result.DataType      := aDataPipeline.GetFieldDataType(aFieldName);
  Result.FieldLength   := aDataPipeline.GetFieldSize(aFieldName);
  Result.DisplayWidth  := aDataPipeline.GetFieldDisplayWidth(aFieldName);


  Result.Searchable    := aSearchable;
  Result.Sortable      := aSortable;

  {add field to the datapipeline's Fields[] array}
  Result.DataPipeline := aDataPipeline;

  {turn auto create fields off}
  if (aDataPipeline <> nil) and (aDataPipeline is TppDBPipeline) and
    TppDBPIpeline(aDataPipeline).AutoCreateFields then
    TppDBPIpeline(aDataPipeline).AutoCreateFields := False;


end; {procedure, CreatePipelineField}




{******************************************************************************
 *
 ** Query Template DataView
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.Create }

constructor TdaBDEQueryTemplateDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {call CreateQuery method defined in the ancestor }
  FQuery := CreateQuery;

  FSQL := TdaSQL.Create(Self);
  FSQL.Session := TdaSessionClass(SessionClass).Create(Self);

  {call CreateDataSource method defined in the ancestor }
  FDataSource := CreateDataSource;
  FDataSource.DataSet := FQuery;

  FDataPipeline := nil;

 { AskAtRuntime := True;}


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.Destroy }

destructor TdaBDEQueryTemplateDataView.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.Loaded }


procedure TdaBDEQueryTemplateDataView.Loaded;
begin

  inherited Loaded;

  DefineSelectedFields;
  DefineDataSelection;

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.SetDatabaseName }

procedure TdaBDEQueryTemplateDataView.SetDatabaseName(aDatabaseName: String);
begin
  inherited SetDatabaseName(aDatabaseName);

  FQuery.DatabaseName := daGetBDEDatabaseForName(aDatabaseName).DatabaseName;
  FQuery.SessionName  := daGetBDESessionForDatabase(aDatabaseName).SessionName;

  FSQL.DatabaseName   := FQuery.DatabaseName;

end; {procedure, SetDatabaseName}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.Init }


procedure TdaBDEQueryTemplateDataView.Init;
begin

  if (FDataPipeline <> nil) then Exit;

  DefineSelectedFields;
  DefineDataSelection;

  inherited Init;


end; {procedure, Init}



{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.CreateDataPipelines }

procedure TdaBDEQueryTemplateDataView.CreateDataPipelines;
begin

  {note: call CreateDataPipeline defined in ancestor }
  FDataPipeline := CreateDataPipeline;
  FDataPipeline.UserName := 'pl' + ppTextToIdentifier(ClassDescription);

end; {procedure, CreateDataPipelines}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.CreatePipelineFields }

procedure TdaBDEQueryTemplateDataView.CreatePipelineFields(aDataPipeline: TppDataPipeline);
var
  liIndex: Integer;

begin

  if (FDataPipeline = aDataPipeline) then
    begin

      TppDBPipeline(aDataPipeline).AutoCreateFields := False;

      for liIndex := 0 to FSQL.SelectFieldCount-1 do
        begin
          with FSQL.SelectFields[liIndex] do
            CreatePipelineField(TableAlias, FieldName, FieldAlias, aDataPipeline, Searchable, Sortable);

        end;

    end;

end; {procedure, CreatePipelineFields}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.ConnectPipelinesToData }

procedure TdaBDEQueryTemplateDataView.ConnectPipelinesToData;
begin

  if (FDatapipeline = nil) then Exit;

  {connect datapipeline to datasource here}
  FDatapipeline.DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.DefineSelectedFields }

procedure TdaBDEQueryTemplateDataView.DefineSelectedFields;
begin

  FSQL.Clear;

 {descendants add code here}

end; {procedure, DefineSelectedFields}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.DefineCalculatedFields }

procedure TdaBDEQueryTemplateDataView.DefineCalculatedFields;
begin

 {descendants add code here}

end; {procedure, DefineCalculatedFields}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.AddSelectTable }

function TdaBDEQueryTemplateDataView.AddSelectTable(aTableName: String): TdaTable;
begin
  Result := FSQL.AddTable(aTableName);

end; {function, AddSelectTable}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.AddSelectField }

function TdaBDEQueryTemplateDataView.AddSelectField(aTable: TdaTable; aFieldName, aFieldAlias: String; aSearchable, aSortable: Boolean): TdaField;
begin


  Result := FSQL.AddSelectField(aTable, aFieldName);

  if (aFieldAlias <> '')  then
    Result.FieldAlias := aFieldAlias;

  Result.Searchable := aSearchable;
  Result.Sortable   := aSortable;

end; {procedure, AddSelectField}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.DefineDataSelection }

procedure TdaBDEQueryTemplateDataView.DefineDataSelection;
begin

  SetActive(False);

  BuildSQL;

end; {procedure, DefineDataSelection}

{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.BuildSQL }

procedure TdaBDEQueryTemplateDataView.BuildSQL;
begin

  DefineSelectionCriteria;

  DefineSortOrder;

  FQuery.SQL := FSQL.SQLText;

end; {procedure, BuildSQL}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.DefineSelectionCriteria }

procedure TdaBDEQueryTemplateDataView.DefineSelectionCriteria;
var
  liIndex: Integer;
  lField: TppField;
  lTable: TdaTable;

begin

  if (FDataPipeline = nil) then Exit;


  {add code for selection criteria}
  FSQL.ClearCriteria;

  for liIndex := 0 to FDataPipeline.FieldCount-1 do
    if FDataPipeline.Fields[liIndex].Search then
      begin
        lField := FDataPipeline.Fields[liIndex];
        lTable := FSQL.GetTableForSQLAlias(lField.TableName);

        FSQL.AddCriteriaField(lTable, lField.FieldName, dacoLike, lField.SearchExpression);


      end;

end; {procedure, DefineSelectionCriteria}


{------------------------------------------------------------------------------}
{ TdaBDEQueryTemplateDataView.DefineSortOrder }

procedure TdaBDEQueryTemplateDataView.DefineSortOrder;

var
  liIndex: Integer;
  lField: TppField;
  ldaField: TdaField;
  lTable: TdaTable;
  lbAscending: Boolean;
  lFields: TStringList;
begin

  if (FDataPipeline = nil) then Exit;

  {add code for sort order}
  FSQL.ClearOrderByFields;


  {get list of sort fields}
  lFields := TStringList.Create;

  for liIndex := 0 to FDataPipeline.FieldCount - 1 do
    begin
      lField := FDataPipeline.Fields[liIndex];

      if lField.Sort then
        lFields.AddObject(Format('%8d', [lField.SortOrder]), lField);
    end;

  lFields.Sort;

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TppField(lFields.Objects[liIndex]);

      lTable := FSQL.GetTableForSQLAlias(lField.TableName);

      ldaField := FSQL.GetFieldForTable(lTable, lField.FieldName);

      lbAscending := (lField.SortType = soAscending);

      FSQL.AddOrderByField(ldaField, lbAscending);
     end;

  lFields.Free;

end; {procedure, DefineSortOrder}



{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultBDEDatabase }

function daGetDefaultBDEDatabase: TDatabase;
begin

  {create the default BDE Database, if needed}
  if (FBDEDatabase = nil) then
    begin
      {create default BDE Database}
      FBDEDatabase      := TDatabase.Create(nil);
      FBDEDatabase.Name := cDefaultConnection;

    end;

  Result := FBDEDatabase;

end; {function, daGetDefaultBDEDatabase}

{------------------------------------------------------------------------------}
{ daGetBDEDatabaseNames }

procedure daGetBDEDatabaseNames(aList: TStrings);
begin

  Session.GetAliasNames(aList);

end; {procedure, daGetBDEDatabaseNames}

{------------------------------------------------------------------------------}
{ daGetBDEDatabaseForName }

function daGetBDEDatabaseForName(aDatabaseName: String): TDatabase;
var
  liIndex: Integer;
  lDatabase: TDatabase;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetBDEDatabaseList.Count) do
    begin
      lDatabase := TDatabase(FBDEDatabaseList[liIndex]);

      if (CompareText(lDatabase.DatabaseName, aDatabaseName) = 0) or
         (CompareText(lDatabase.Name, aDatabaseName) = 0) or
         (CompareText(lDatabase.AliasName, aDatabaseName) = 0) then
        Result := lDatabase;

      Inc(liIndex);
    end;

  {if a database object was found then exit}
  if (Result <> nil) then Exit;

  {the default session may have created a default database}
  Result := Session.FindDatabase(aDatabaseName);

  {if a database object was found then exit}
  if (Result <> nil) then Exit;


  {use the default database object}
  Result := daGetDefaultBDEDatabase;

  {set DatabaseName property, if needed}
  if (Result.DatabaseName <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;

      Result.DatabaseName := aDatabaseName;

    end;

end; {function, daGetBDEDatabaseForName}

{------------------------------------------------------------------------------}
{ daGetBDESessionForDatabase }

function daGetBDESessionForDatabase(aDatabaseName: String): TSession;
var
  lDatabase: TDatabase;

begin

  Result := nil;

  lDatabase := daGetBDEDatabaseForName(aDatabaseName);

  {note: use Sessions.FindSession rather than reference TDatabase.Session because
         TDatabase.Session is unreliable when csLoading}
  if (lDatabase <> nil) then
    Result := Sessions.FindSession(lDatabase.SessionName);

  if (Result = nil) then
    Result := Session;

end; {function, daGetBDESessionForDatabase}


{------------------------------------------------------------------------------}
{ daGetBDEDatabaseList }

function daGetBDEDatabaseList: TppComponentList;
begin
  if (FBDEDatabaseList = nil) then
    FBDEDatabaseList := TppComponentList.Create(nil);

  Result := FBDEDatabaseList;

end; {function, daGetADOConnectionList}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TdaChildBDEQuery, TdaChildBDETable, TdaChildBDEStoredProc]);

  daRegisterSession(TdaBDESession);
  daRegisterDataSet(TdaBDEDataSet);

  daRegisterDataView(TdaBDEQueryDataView);

  {initialize internal reference variables}
  FBDEDatabase := nil;
  FBDEDatabaseList := nil;


finalization

  {free the default connection object}
  FBDEDatabase.Free;
  FBDEDatabaseList.Free;

  UnRegisterClasses([TdaChildBDEQuery, TdaChildBDETable, TdaChildBDEStoredProc]);

  daUnRegisterSession(TdaBDESession);
  daUnRegisterDataSet(TdaBDEDataSet);

  daUnRegisterDataView(TdaBDEQueryDataView);

end.
