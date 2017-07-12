{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daADO;

interface

{$I ppIfDef.pas}

uses Classes, SysUtils, Forms, ExtCtrls,  DB, Contnrs,
     ppClass, ppComm, ppDBPipe, ppDB, ppClasUt, ppTypes,
     daDB, daQuery, daDataVw, daDatPrv,
     ADODB; 



type

  {ADO DataView Classes:

     1.  ADO TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildADOQuery - TADOQuery descendant that can be a child of a DataView
       b. TdaChildADOTable - TADOTable descendant that can be a child of a DataView
       c. TdaChildADOStoredProc - TADOStoredProc descendant that can be a child of a DataView

     3.  TdaADOSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     4.  TdaADODataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     5.  TdaADOQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TADOQuery etc.

      }

  { TdaChildADOQuery }
  TdaChildADOQuery = class(TADOQuery)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildADOQuery}

  { TdaChildADOTable }
  TdaChildADOTable = class(TADOTable)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildADOTable}

  { TdaChildADOStoredProc }
  TdaChildADOStoredProc = class(TADOStoredProc)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildADOStoredProc}


  { TdaADOSession }
  TdaADOSession = class(TdaSession)
    private

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

  end; {class, TdaADOSession}



  { TdaADODataSet }
  TdaADODataSet = class(TdaDataSet)
    private
      FQuery: TADOQuery;

      function GetQuery: TADOQuery;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

      property Query: TADOQuery read GetQuery;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaADODataSet}


  { TdaADOQueryDataView }
  TdaADOQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildADOQuery;

    protected
      procedure Loaded; override;
      procedure UpdateQueryObject;

      procedure SQLChanged; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function PreviewFormClass: TFormClass; override;
      class function SessionClass: TClass; override;

      procedure Init; override;
      procedure ConnectPipelinesToData; override;

    published
      property DataSource: TppChildDataSource read FDataSource;

  end; {class, TdaADOQueryDataView}


  {global functions to access default ADO connection}
  function daGetDefaultADOConnection: TADOConnection;

  {utility routines}
  procedure daGetADOConnectionNames(aList: TStrings);
  function daGetADOConnectionForName(aDatabaseName: String): TADOConnection;

  function daGetADOConnectionList: TppComponentList;

  {Delphi design time registration}
  procedure Register;


implementation

const
  cDefaultConnection = 'DefaultADOConnection';

var
  FADOConnection: TADOConnection;
  FADOConnectionList: TppComponentList;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin

  {ADO DataAccess Components}
  RegisterNoIcon([TdaChildADOQuery, TdaChildADOTable, TdaChildADOStoredProc]);

  {ADO DataViews}
  RegisterNoIcon([TdaADOQueryDataView]);


end;


{******************************************************************************
 *
 ** C H I L D   ADO  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildADOQuery.HasParent }

function TdaChildADOQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildADOTable.HasParent }

function TdaChildADOTable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{------------------------------------------------------------------------------}
{ TdaChildADOStoredProc.HasParent }

function TdaChildADOStoredProc.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** A D O  S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADOSession.ClassDescription }

class function TdaADOSession.ClassDescription: String;
begin
  Result := 'ADOSession';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaADOSession.DataSetClass }

class function TdaADOSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaADODataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaADOSession.DatabaseClass }

class function TdaADOSession.DatabaseClass: TComponentClass;
begin
  Result := TADOConnection;
end;

{------------------------------------------------------------------------------}
{ TdaADOSession.GetTableNames }

procedure TdaADOSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lConnection: TADOConnection;

begin
  {get the database}
  lConnection := daGetADOConnectionForName(aDatabaseName);

  {connection must be active to get table names}
  if not lConnection.Connected then
    lConnection.Connected := True;

  {get list of table names from a table object}
  if lConnection.Connected then
    lConnection.GetTableNames(aList, False);

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaADOSession.AddDatabase }

procedure TdaADOSession.AddDatabase(aDatabase: TComponent);
begin

  if daGetADOConnectionList.IndexOf(aDatabase) < 0 then
    FADOConnectionList.Add(aDatabase);

end; {procedure, AddDatabase}

{------------------------------------------------------------------------------}
{ TdaADOSession.GetDatabaseNames }

procedure TdaADOSession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;

begin
  {call utility routine to get list of database names}
  daGetADOConnectionNames(aList);

  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));

end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaADOSession.SetDataOwner }

procedure TdaADOSession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaADOSession.ValidDatabaseTypes }

function TdaADOSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  {although Sybase and Oracle ran into trouble during testing of ADO, perhaps future ADO drivers will work}
  Result := [dtMSAccess, dtMSSQLServer, dtSybaseASA, dtSybaseASE, dtOracle, dtOther];
end; {procedure, ValidDatabaseTypes}

{------------------------------------------------------------------------------}
{ TdaADOSession.GetDatabaseType }

function TdaADOSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  {we're guessing here until we can figure out how to convert an ADO string to a database type}
  Result := dtMSAccess;
end; {function, GetDatabaseType}


{******************************************************************************
 *
 ** ADO D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADODataSet.Create }

constructor TdaADODataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FQuery := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaADODataSet.Destroy }

destructor TdaADODataSet.Destroy;
begin

  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaADODataSet.ClassDescription }

class function TdaADODataSet.ClassDescription: String;
begin
  Result := 'ADODataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaADODataSet.GetActive }

function TdaADODataSet.GetActive: Boolean;
begin
  Result := GetQuery.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaADODataSet.SetActive }

procedure TdaADODataSet.SetActive(Value: Boolean);
begin
  GetQuery.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaADODataSet.GetQuery }

function TdaADODataSet.GetQuery: TADOQuery;
begin

  {create ADO table, if needed}
  if (FQuery = nil) then
    FQuery := TADOQuery.Create(Self);

  Result := FQuery;

end; {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaADODataSet.SetDatabaseName }

procedure TdaADODataSet.SetDatabaseName(const aDatabaseName: String);
begin

  inherited SetDatabaseName(aDatabaseName);

  {table cannot be active to set database property}
  if GetQuery.Active then
    FQuery.Active := False;

  {get ADO Connection for name}
  FQuery.Connection := daGetADOConnectionForName(aDatabaseName);

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaADODataSet.SetDataName }

procedure TdaADODataSet.SetDataName(const aDataName: String);
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
{ TdaADODataSet.BuildFieldList }

procedure TdaADODataSet.BuildFieldList;
var
  liIndex: Integer;
  lQueryField: TField;
  lField: TppField;
begin

  inherited BuildFieldList;

  {set table to active}
  if not(GetQuery.Active) then
    FQuery.Active := True;

  {create TppField objects for each field in the table}
  for liIndex := 0 to FQuery.FieldCount - 1 do
    begin
      lQueryField := FQuery.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.TableName    := DataName;
      lField.FieldName    := lQueryField.FieldName;
      lField.DataType     := ppConvertFieldType(lQueryField.DataType);

      AddField(lField);
    end;

end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaADODataSet.GetFieldNamesForSQL }

procedure TdaADODataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TADOQuery;
begin
  aList.Clear;

  {create a temporary ADO query}
  lQuery := TADOQuery.Create(Self);

  {set the database and SQL properties}
  lQuery.Connection := daGetADOConnectionForName(DatabaseName);
  lQuery.SQL := aSQL;

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaADODataSet.GetFieldsForSQL }

procedure TdaADODataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TADOQuery;
  lQueryField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  {create a temporary ADO query}
  lQuery := TADOQuery.Create(Self);

  {assign databae and SQL properties}
  lQuery.Connection := daGetADOConnectionForName(DatabaseName);
  lQuery.SQL := aSQL;

  {set query to active}
  lQuery.Active := True;

  {create a TppField object for each field in the query}
  for liIndex := 0 to lQuery.FieldCount - 1 do
    begin
      lQueryField := lQuery.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.FieldName    := lQueryField.FieldName;
      lField.DataType     := ppConvertFieldType(lQueryField.DataType);

      aList.Add(lField);
    end;

  lQuery.Free;

end; {procedure, GetFieldsForSQL}


{******************************************************************************
 *
 ** ADO  Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.Create }

constructor TdaADOQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildADOQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.Destroy }

destructor TdaADOQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}
{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.SessionClass }

class function TdaADOQueryDataView.SessionClass: TClass;
begin
  Result := TdaADOSession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.PreviewFormClass }

class function TdaADOQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.Loaded }

procedure TdaADOQueryDataView.Loaded;
begin

  inherited Loaded;

  UpdateQueryObject;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.ConnectPipelinesToData }

procedure TdaADOQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.Init }

procedure TdaADOQueryDataView.Init;
var
  lDataPipeline: TppChildDBPipeline;

begin

  inherited Init;

  if DataPipelineCount > 0 then Exit;

  {note: DataView's owner must own the DataPipeline }
  lDataPipeline := TppChildDBPipeline(ppComponentCreate(Self, TppChildDBPipeline));
  lDataPipeline.DataSource := FDataSource;
 
  lDataPipeline.AutoCreateFields := False;

  {add DataPipeline to the dataview }
  lDataPipeline.DataView := Self;

end; {procedure, Init}


{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.SQLChanged }

procedure TdaADOQueryDataView.SQLChanged;
begin

  UpdateQueryObject;

end; {procedure, WizardCompleted}

{------------------------------------------------------------------------------}
{ TdaADOQueryDataView.UpdateQueryObject }

procedure TdaADOQueryDataView.UpdateQueryObject;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.Connection := daGetADOConnectionForName(SQL.DatabaseName);
  FQuery.SQL := SQL.SQLText;

end; {procedure, UpdateQueryObject}



{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultADOConnection }

function daGetDefaultADOConnection: TADOConnection;
begin

  {create the default ADO Connection, if needed}
  if (FADOConnection = nil) then
    begin
      {create default ADO Connection}
      FADOConnection := TADOConnection.Create(nil);
      FADOConnection.Name := cDefaultConnection;

    end;

  Result := FADOConnection;

end; {function, daGetDefaultADOConnection}



{------------------------------------------------------------------------------}
{ daGetADOConnectionNames }

procedure daGetADOConnectionNames(aList: TStrings);
begin

  {could add hard-coded connection strings here, or could
   read from an .ini file }

end; {procedure, daGetADOConnectionNames}

{------------------------------------------------------------------------------}
{ daGetADOConnectionForName }

function daGetADOConnectionForName(aDatabaseName: String): TADOConnection;
var
  liIndex: Integer;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetADOConnectionList.Count) do
    begin
      if (AnsiCompareStr(FADOConnectionList[liIndex].Name, aDatabaseName) = 0) or
         (AnsiCompareStr(TADOConnection(FADOConnectionList[liIndex]).ConnectionString, aDatabaseName) = 0) then
        Result :=  TADOConnection(FADOConnectionList[liIndex]);
      Inc(liIndex);
    end;

  if (Result <> nil) then Exit;


  {use the default database object}
  Result := daGetDefaultADOConnection;

  {set DatabaseName property, if needed}
  if (Result.ConnectionString <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;
      Result.ConnectionString := aDatabaseName;

    end;

end; {function, daGetADOConnectionForName}


{------------------------------------------------------------------------------}
{ daGetADOConnectionList }

function daGetADOConnectionList: TppComponentList;
begin
  if (FADOConnectionList = nil) then
    FADOConnectionList := TppComponentList.Create(nil);

  Result := FADOConnectionList;

end; {function, daGetADOConnectionList}


initialization

  {register the ADO descendant classes}
  RegisterClasses([TdaChildADOQuery, TdaChildADOTable, TdaChildADOStoredProc]);

  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaADOSession);
  daRegisterDataSet(TdaADODataSet);
  daRegisterDataView(TdaADOQueryDataView);

  {initialize internal reference variables}
  FADOConnection := nil;
  FADOConnectionList := nil;


finalization

  {free the default connection object}
  FADOConnection.Free;
  FADOConnectionList.Free;

  {unregister the ADO descendant classes}
  UnRegisterClasses([TdaChildADOQuery, TdaChildADOTable, TdaChildADOStoredProc]);

  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaADOSession);
  daUnRegisterDataSet(TdaADODataSet);
  daUnRegisterDataView(TdaADOQueryDataView);


end.
