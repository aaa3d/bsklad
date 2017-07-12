{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daIBExpress;

interface

{$I ppIfDef.pas}

uses Classes, SysUtils, Forms, ExtCtrls,  DB, Contnrs,
     ppClass, ppComm, ppDBPipe, ppDB, ppClasUt, ppTypes,
     daDB, daQuery, daDataVw, daDatPrv,
     IBDatabase, IBStoredProc, IBQuery, IBCustomDataSet, IBTable; 



type

  {Interbase Express (IBX) DataView Classes:

     1.  IB TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildIBXQuery - TIBQuery descendant that can be a child of a DataView
       b. TdaChildIBXTable - TIBTable descendant that can be a child of a DataView
       c. TdaChildIBXStoredProc - TIBStoredProc descendant that can be a child of a DataView

     2.  TdaIBXSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     3.  TdaIBXDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     4.  TdaIBXQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TIBQuery etc.

      }

  { TdaChildIBXQuery }
  TdaChildIBXQuery = class(TIBQuery)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildIBXQuery}

  { TdaChildIBXTable }
  TdaChildIBXTable = class(TIBTable)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildIBXTable}

  { TdaChildIBXStoredProc }
  TdaChildIBXStoredProc = class(TIBStoredProc)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildIBXStoredProc}


  { TdaIBXSession }
  TdaIBXSession = class(TdaSession)
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

  end; {class, TdaIBXSession}



  { TdaIBXDataSet }
  TdaIBXDataSet = class(TdaDataSet)
    private
      FQuery: TIBQuery;

      function GetQuery: TIBQuery;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

      property Query: TIBQuery read GetQuery;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaIBXDataSet}


  { TdaIBXQueryDataView }
  TdaIBXQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildIBXQuery;

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

  end; {class, TdaIBXQueryDataView}


  {global functions to access default IB session and database}
  function daGetDefaultIBXDatabase: TIBDatabase;

  {utility routines}
  procedure daGetIBXDatabaseNames(aList: TStrings);
  function daGetIBXDatabaseForName(aDatabaseName: String): TIBDatabase;

  function daGetIBXDatabaseList: TppComponentList;

  {Delphi design time registration}
  procedure Register;


implementation

const
  cDefaultDatabase = 'DefaultIBXDatabase';

var
  FIBDatabase: TIBDatabase;
  FIBTransaction: TIBTransaction;
  FIBDatabaseList: TppComponentList;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin

  {IBX DataAccess Components}
  RegisterNoIcon([TdaChildIBXQuery, TdaChildIBXTable, TdaChildIBXStoredProc]);

  {IBX DataViews}
  RegisterNoIcon([TdaIBXQueryDataView]);


end;


{******************************************************************************
 *
 ** C H I L D   I B  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildIBXQuery.HasParent }

function TdaChildIBXQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildIBXTable.HasParent }

function TdaChildIBXTable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{------------------------------------------------------------------------------}
{ TdaChildIBXStoredProc.HasParent }

function TdaChildIBXStoredProc.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** I B   S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaIBXSession.ClassDescription }

class function TdaIBXSession.ClassDescription: String;
begin
  Result := 'IBXSession';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaIBXSession.DataSetClass }

class function TdaIBXSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaIBXDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaIBXSession.DatabaseClass }

class function TdaIBXSession.DatabaseClass: TComponentClass;
begin
  Result := TIBDatabase;
end;

{------------------------------------------------------------------------------}
{ TdaIBXSession.GetTableNames }

procedure TdaIBXSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lDatabase: TIBDatabase;
  lTable: TIBTable;

begin
  {get the database}
  lDatabase := daGetIBXDatabaseForName(aDatabaseName);

  lTable := TIBTable.Create(nil);
  lTable.Database := lDatabase;

  {connection must be active to get table names}
  if not lDatabase.Connected then
    lDatabase.Connected := True;

  {get list of table names from a table object}
  if lDatabase.Connected then
    aList.Assign(lTable.TableNames);

  lTable.Free;

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaIBXSession.AddDatabase }

procedure TdaIBXSession.AddDatabase(aDatabase: TComponent);
begin

  if daGetIBXDatabaseList.IndexOf(aDatabase) < 0 then
    FIBDatabaseList.Add(aDatabase);

end; {procedure, AddDatabase}

{------------------------------------------------------------------------------}
{ TdaIBXSession.GetDatabaseNames }

procedure TdaIBXSession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;

begin
  {call utility routine to get list of database names}
  daGetIBXDatabaseNames(aList);

  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));

end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaIBXSession.SetDataOwner }

procedure TdaIBXSession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaIBXSession.ValidDatabaseTypes }

function TdaIBXSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  Result := [dtInterBase];
end; {procedure, ValidDatabaseTypes}

{------------------------------------------------------------------------------}
{ TdaIBXSession.GetDatabaseType }

function TdaIBXSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtInterBase;
end; {function, GetDatabaseType}


{******************************************************************************
 *
 ** I B  D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.Create }

constructor TdaIBXDataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FQuery := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.Destroy }

destructor TdaIBXDataSet.Destroy;
begin

  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.ClassDescription }

class function TdaIBXDataSet.ClassDescription: String;
begin
  Result := 'IBXDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.GetActive }

function TdaIBXDataSet.GetActive: Boolean;
begin
  Result := GetQuery.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.SetActive }

procedure TdaIBXDataSet.SetActive(Value: Boolean);
begin
  GetQuery.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.GetQuery }

function TdaIBXDataSet.GetQuery: TIBQuery;
begin

  {create IB table, if needed}
  if (FQuery = nil) then
    FQuery := TIBQuery.Create(Self);

  Result := FQuery;

end; {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.SetDatabaseName }

procedure TdaIBXDataSet.SetDatabaseName(const aDatabaseName: String);
begin

  inherited SetDatabaseName(aDatabaseName);

  {table cannot be active to set database property}
  if GetQuery.Active then
    FQuery.Active := False;

  {get IB database for name}
  FQuery.Database := daGetIBXDatabaseForName(aDatabaseName);

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.SetDataName }

procedure TdaIBXDataSet.SetDataName(const aDataName: String);
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
{ TdaIBXDataSet.BuildFieldList }

procedure TdaIBXDataSet.BuildFieldList;
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
{ TdaIBXDataSet.GetFieldNamesForSQL }

procedure TdaIBXDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TIBQuery;
begin
  aList.Clear;

  {create a temporary IB query}
  lQuery := TIBQuery.Create(Self);

  {set the database and SQL properties}
  lQuery.Database := daGetIBXDatabaseForName(DatabaseName);
  lQuery.SQL := aSQL;

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaIBXDataSet.GetFieldsForSQL }

procedure TdaIBXDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TIBQuery;
  lQueryField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  {create a temporary IB query}
  lQuery := TIBQuery.Create(Self);

  {assign databae and SQL properties}
  lQuery.Database := daGetIBXDatabaseForName(DatabaseName);
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
 ** I B  Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.Create }

constructor TdaIBXQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildIBXQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.Destroy }

destructor TdaIBXQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.SessionClass }

class function TdaIBXQueryDataView.SessionClass: TClass;
begin
  Result := TdaIBXSession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.PreviewFormClass }

class function TdaIBXQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.Loaded }

procedure TdaIBXQueryDataView.Loaded;
begin

  inherited Loaded;

  UpdateQueryObject;

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.ConnectPipelinesToData }

procedure TdaIBXQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;


end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.Init }

procedure TdaIBXQueryDataView.Init;
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
{ TdaIBXQueryDataView.SQLChanged }

procedure TdaIBXQueryDataView.SQLChanged;
begin
  UpdateQueryObject;
end; {procedure, WizardCompleted}

{------------------------------------------------------------------------------}
{ TdaIBXQueryDataView.UpdateQueryObject }

procedure TdaIBXQueryDataView.UpdateQueryObject;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.Database := daGetIBXDatabaseForName(SQL.DatabaseName);
  FQuery.SQL := SQL.SQLText;

end; {procedure, UpdateQueryObject}


{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultIBXDatabase }

function daGetDefaultIBXDatabase: TIBDatabase;
begin

  {create the default IB database, if needed}
  if (FIBDatabase = nil) then
    begin
      {create default IB database}
      FIBDatabase := TIBDatabase.Create(nil);
      FIBDatabase.Name := cDefaultDatabase;

      {create a default transaction for the IBDatabase}
      FIBTransaction := TIBTransaction.Create(nil);
      
      FIBDatabase.DefaultTransaction := FIBTransaction;

    end;

  Result := FIBDatabase;
  
end; {function, daGetDefaultIBXDatabase}



{------------------------------------------------------------------------------}
{ daGetIBXDatabaseNames }

procedure daGetIBXDatabaseNames(aList: TStrings);
begin

  {could add hard-coded connection strings here, or could
   read from an .ini file }

end; {procedure, daGetIBXDatabaseNames}

{------------------------------------------------------------------------------}
{ daGetIBXDatabaseForName }

function daGetIBXDatabaseForName(aDatabaseName: String): TIBDatabase;
var
  liIndex: Integer;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetIBXDatabaseList.Count) do
    begin
      if (AnsiCompareStr(FIBDatabaseList[liIndex].Name, aDatabaseName) = 0) or
         (AnsiCompareStr(TIBDatabase(FIBDatabaseList[liIndex]).DatabaseName, aDatabaseName) = 0) then
        Result :=  TIBDatabase(FIBDatabaseList[liIndex]);
      Inc(liIndex);
    end;

  if (Result <> nil) then Exit;

  
  {use the default database object}
  Result := daGetDefaultIBXDatabase;

  {set DatabaseName property, if needed}
  if (Result.DatabaseName <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;
      Result.DatabaseName := aDatabaseName;

    end;

end; {function, daGetIBXDatabaseForName}


{------------------------------------------------------------------------------}
{ daGetIBXDatabaseList }

function daGetIBXDatabaseList: TppComponentList;
begin
  if (FIBDatabaseList = nil) then
    FIBDatabaseList := TppComponentList.Create(nil);

  Result := FIBDatabaseList;

end; {function, daGetIBXDatabaseList}


initialization

  {register the IB descendant classes}
  RegisterClasses([TdaChildIBXQuery, TdaChildIBXTable, TdaChildIBXStoredProc]);

  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaIBXSession);
  daRegisterDataSet(TdaIBXDataSet);
  daRegisterDataView(TdaIBXQueryDataView);

  {initialize internal reference variables}
  FIBDatabase := nil;
  FIBTransaction := nil;
  FIBDatabaseList := nil;


finalization

  {free the default database object}
  FIBDatabase.Free;
  FIBTransaction.Free;

  FIBDatabaseList.Free;

  {unregister the IB descendant classes}
  UnRegisterClasses([TdaChildIBXQuery, TdaChildIBXTable, TdaChildIBXStoredProc]);

  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaIBXSession);
  daUnRegisterDataSet(TdaIBXDataSet);
  daUnRegisterDataView(TdaIBXQueryDataView);


end.
