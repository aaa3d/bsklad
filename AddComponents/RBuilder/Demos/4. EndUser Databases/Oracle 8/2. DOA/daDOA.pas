{******************************************************************************}
{                                                                              }
{           ReportBuilder Data Access Developement Environment (DADE)          }
{                                                                              }
{             Copyright (c) 1996-1999 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit daDOA;

interface

uses Classes, SysUtils, Forms, ExtCtrls,  DB, 
     ppClass, ppComm, ppDBPipe, ppDB, ppClasUt, ppTypes,
     daDB, daQuery, daDataVw, daDatPrv,
     Oracle, OracleData, OracleCI;



type

  {Direct Oracle Access (DOA) DataView Classes:

     1.  DOA TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildDOAQuery        - TOracleDataSet descendant that can be a child of a DataView
       b. TdaChildDOATable        - TOracleDataSet descendant that can be a child of a DataView
       c. TdaChildDOAPackage      - TOraclePackage descendant that can be a child of a DataView

     3.  TdaDOASession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     4.  TdaDOADataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     5.  TdaDOAQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TDOAQuery etc.

      }

  { TdaChildDOAQuery }
  TdaChildDOAQuery = class(TOracleDataSet)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildDOAQuery}

  { TdaChildDOATable }
  TdaChildDOATable = class(TOracleDataSet)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildDOATable}

  { TdaChildDOAPackage }
  TdaChildDOAPackage = class(TOraclePackage)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildDOAPackage}


  { TdaDOASession }
  TdaDOASession = class(TdaSession)
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

  end; {class, TdaDOASession}



  { TdaDOADataSet }
  TdaDOADataSet = class(TdaDataSet)
    private
      FQuery: TOracleDataSet;

      function GetQuery: TOracleDataSet;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

      property Query: TOracleDataSet read GetQuery;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaDOADataSet}


  { TdaDOAQueryDataView }
  TdaDOAQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildDOAQuery;
      FTimer: TTimer;

      procedure AfterLoadededEvent(Sender: TObject);

    protected
      procedure Loaded; override;
      procedure UpdateQueryObject;

      procedure SetReport(aReport: TppCustomReport); override;
      procedure SetActive(Value: Boolean); override;

      procedure SQLChanged; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function PreviewFormClass: TFormClass; override;
      class function SessionClass: TClass; override;

      procedure Init; override;

    published
      property DataSource: TppChildDataSource read FDataSource;

  end; {class, TdaDOAQueryDataView}


  {global functions to access default DOA connection}
  function daGetDefaultDOAConnection: TOracleSession;

  {utility routines}
  procedure daGetDOAConnectionNames(aList: TStrings);
  function daGetDOAConnectionForName(aDatabaseName: String): TOracleSession;
  function daDOAConnectToDatabase(aDatabaseName: String): Boolean;

  function daGetDOAConnectionList: TppComponentList;

  {Delphi design time registration}
  procedure Register;


implementation

const
  cDefaultConnection = 'DefaultDOAConnection';

var
  FDOAConnection: TOracleSession;
  FDOALogon: TOracleLogon;
  FDOAConnectionList: TppComponentList;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin

  {DOA DataAccess Components}
  RegisterNoIcon([TdaChildDOAQuery, TdaChildDOATable, TdaChildDOAPackage]);

  {DOA DataViews}
  RegisterNoIcon([TdaDOAQueryDataView]);


end;


{******************************************************************************
 *
 ** C H I L D   DOA  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildDOAQuery.HasParent }

function TdaChildDOAQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildDOATable.HasParent }

function TdaChildDOATable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{------------------------------------------------------------------------------}
{ TdaChildDOAPackage.HasParent }

function TdaChildDOAPackage.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** D O A  S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDOASession.ClassDescription }

class function TdaDOASession.ClassDescription: String;
begin
  Result := 'DOASession';
end; {class function, ClassDescription}


{------------------------------------------------------------------------------}
{ TdaDOASession.DataSetClass }

class function TdaDOASession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaDOADataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaDOASession.DatabaseClass }

class function TdaDOASession.DatabaseClass: TComponentClass;
begin
  Result := TOracleSession;
end;

{------------------------------------------------------------------------------}
{ TdaDOASession.GetDatabaseType }

function TdaDOASession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtOracle;
end; {procedure, GetDatabaseType}



{------------------------------------------------------------------------------}
{ TdaDOASession.GetTableNames }

procedure TdaDOASession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lsTableName: String;
  lQuery: TOracleDataSet;

begin
  aList.Clear;

  {get list of table names from a table object}
  if not daDOAConnectToDatabase(aDatabaseName) then Exit;

  lQuery := TOracleDataSet.Create(nil);
  lQuery.Session := daGetDOAConnectionForName(aDatabaseName);

  lQuery.SQL.Text :=   'select owner, object_name ' +
                       'from all_objects ' +
                       'where object_type = ''TABLE''   ' +
                       'and owner not in (''SYS'', ''SYSTEM'')';

  lQuery.Open;

  if lQuery.Active then
    begin

      lQuery.First;

      while not lQuery.EOF do
        begin
          lsTableName := lQuery.Fields[0].AsString + '.' + lQuery.Fields[1].AsString;
          aList.Add(lsTableName);

          lQuery.Next;

        end;

    end;


  lQuery.Free;

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaDOASession.AddDatabase }

procedure TdaDOASession.AddDatabase(aDatabase: TComponent);
begin

  if daGetDOAConnectionList.IndexOf(aDatabase) < 0 then
    FDOAConnectionList.Add(aDatabase);

end; {procedure, AddDatabase}


{------------------------------------------------------------------------------}
{ TdaDOASession.GetDatabaseNames }

procedure TdaDOASession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;

begin
  {call utility routine to get list of database names}
  daGetDOAConnectionNames(aList);

  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));

end; {procedure, GetDatabaseNames}


{------------------------------------------------------------------------------}
{ TdaDOASession.SetDataOwner }

procedure TdaDOASession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaDOASession.ValidDatabaseTypes }

function TdaDOASession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  Result := [dtOracle];

end; {function, ValidDatabaseTypes}


{******************************************************************************
 *
 ** DOA D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.Create }

constructor TdaDOADataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FQuery := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.Destroy }

destructor TdaDOADataSet.Destroy;
begin

  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.ClassDescription }

class function TdaDOADataSet.ClassDescription: String;
begin
  Result := 'DOADataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.GetActive }

function TdaDOADataSet.GetActive: Boolean;
begin
  Result := GetQuery.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.SetActive }

procedure TdaDOADataSet.SetActive(Value: Boolean);
begin
  GetQuery.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.GetQuery }

function TdaDOADataSet.GetQuery: TOracleDataSet;
begin

  {create DOA DataSet, if needed}
  if (FQuery = nil) then
    FQuery := TOracleDataSet.Create(Self);

  Result := FQuery;

end; {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.SetDatabaseName }

procedure TdaDOADataSet.SetDatabaseName(const aDatabaseName: String);
begin

  inherited SetDatabaseName(aDatabaseName);

  {table cannot be active to set database property}
  if GetQuery.Active then
    FQuery.Active := False;

  {get DOA Connection for name}
  FQuery.Session := daGetDOAConnectionForName(aDatabaseName);

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.SetDataName }

procedure TdaDOADataSet.SetDataName(const aDataName: String);
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
{ TdaDOADataSet.BuildFieldList }

procedure TdaDOADataSet.BuildFieldList;
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
{ TdaDOADataSet.GetFieldNamesForSQL }

procedure TdaDOADataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TOracleDataSet;
begin
  aList.Clear;

  {create a temporary query}
  lQuery := TOracleDataSet.Create(Self);

  {set the database and SQL properties}
  lQuery.Session := daGetDOAConnectionForName(DatabaseName);
  lQuery.SQL := aSQL;

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaDOADataSet.GetFieldsForSQL }

procedure TdaDOADataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TOracleDataSet;
  lQueryField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  {create a temporary query}
  lQuery := TOracleDataSet.Create(Self);

  {assign databae and SQL properties}
  lQuery.Session := daGetDOAConnectionForName(DatabaseName);
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
 ** DOA  Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.Create }

constructor TdaDOAQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildDOAQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.Destroy }

destructor TdaDOAQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.Loaded }

procedure TdaDOAQueryDataView.Loaded;
begin

  inherited Loaded;

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

  UpdateQueryObject;

  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := AfterLoadededEvent;

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.AfterLoadededEvent }

procedure TdaDOAQueryDataView.AfterLoadededEvent(Sender: TObject);
begin

  FTimer.Free;
  FTimer := nil;

  SetActive(True);


end; {procedure, AfterLoadededEvent}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.PreviewFormClass }

class function TdaDOAQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.SessionClass }

class function TdaDOAQueryDataView.SessionClass: TClass;
begin
  Result := TdaDOASession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.Init }

procedure TdaDOAQueryDataView.Init;
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
{ TdaDOAQueryDataView.SetReport }

procedure TdaDOAQueryDataView.SetReport(aReport: TppCustomReport);
begin

  inherited SetReport(aReport);

  if (Report = nil) or (DataPipelineCount = 0) then Exit;

  Report.DataPipeline := DataPipelines[0];


end; {procedure, SetReport}



{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.SetActive }

procedure TdaDOAQueryDataView.SetActive(Value: Boolean);
begin

  inherited SetActive(Value);

  if (DataPipelineCount = 0) then Exit;

  if DataPipelines[0].Active <> Value then
    DataPipelines[0].Open;

end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.SQLChanged }

procedure TdaDOAQueryDataView.SQLChanged;
begin

  UpdateQueryObject;

end; {procedure, WizardCompleted}

{------------------------------------------------------------------------------}
{ TdaDOAQueryDataView.UpdateQueryObject }

procedure TdaDOAQueryDataView.UpdateQueryObject;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.Session := daGetDOAConnectionForName(SQL.DatabaseName);
  FQuery.SQL := SQL.SQLText;

end; {procedure, UpdateQueryObject}



{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultDOAConnection }

function daGetDefaultDOAConnection: TOracleSession;
begin

  {create the default Connection, if needed}
  if (FDOAConnection = nil) then
    begin
      {create default DOA Connection}
      FDOAConnection := TOracleSession.Create(nil);
      FDOAConnection.Name := cDefaultConnection;

      FDOALogon := TOracleLogon.Create(nil);
      FDOALogon.Session := FDOAConnection;

    end;

  Result := FDOAConnection;

end; {function, daGetDefaultDOAConnection}


{------------------------------------------------------------------------------}
{ daGetDOAConnectionNames }

procedure daGetDOAConnectionNames(aList: TStrings);
begin

  {call utility routine in OracleCI unit}
  BuildOracleAliasList;

  aList.Assign(OracleAliasList);


end; {procedure, daGetDOAConnectionNames}

{------------------------------------------------------------------------------}
{ daGetDOAConnectionForName }

function daGetDOAConnectionForName(aDatabaseName: String): TOracleSession;
var
  liIndex: Integer;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetDOAConnectionList.Count) do
    begin
      if (AnsiCompareStr(FDOAConnectionList[liIndex].Name, aDatabaseName) = 0) or
         (AnsiCompareStr(TOracleSession(FDOAConnectionList[liIndex]).LogonDatabase, aDatabaseName) = 0) then
        Result :=  TOracleSession(FDOAConnectionList[liIndex]);
      Inc(liIndex);
    end;

  if (Result <> nil) then Exit;


  {use the default database object}
  Result := daGetDefaultDOAConnection;

  {set DatabaseName property, if needed}
  if (Result.LogonDatabase <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;
      Result.LogonDatabase := aDatabaseName;

    end;

end; {function, daGetDOAConnectionForName}

{------------------------------------------------------------------------------}
{ daDOAConnectToDatabase }

function daDOAConnectToDatabase(aDatabaseName: String): Boolean;
var
  lConnection: TOracleSession;

begin
  Result := False;

  lConnection := daGetDOAConnectionForName(aDatabaseName);

  if (lConnection = nil) then Exit;

  if not lConnection.Connected then
    begin
      if (lConnection = daGetDefaultDOAConnection) then
        FDOALogon.Execute
      else
        lConnection.Connected := True;

    end;

  Result := lConnection.Connected;


end; {function, daDOAConnectToDatabase}


{------------------------------------------------------------------------------}
{ daGetDOAConnectionList }

function daGetDOAConnectionList: TppComponentList;
begin
  if (FDOAConnectionList = nil) then
    FDOAConnectionList := TppComponentList.Create(nil);

  Result := FDOAConnectionList;

end; {function, daGetDOAConnectionList}


initialization

  {register the DOA descendant classes}
  RegisterClasses([TdaChildDOAQuery, TdaChildDOATable]);

  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaDOASession);
  daRegisterDataSet(TdaDOADataSet);
  daRegisterDataView(TdaDOAQueryDataView);

  {initialize internal reference variables}
  FDOAConnection     := nil;
  FDOALogon          := nil;
  FDOAConnectionList := nil;


finalization

  {free the default connection object}
  FDOAConnection.Free;
  FDOALogon.Free;
  FDOAConnectionList.Free;

  {unregister the DOA descendant classes}
  UnRegisterClasses([TdaChildDOAQuery, TdaChildDOATable]);

  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaDOASession);
  daUnRegisterDataSet(TdaDOADataSet);
  daUnRegisterDataView(TdaDOAQueryDataView);


end.
