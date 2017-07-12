{******************************************************************************}
{                                                                              }
{           ReportBuilder Data Access Developement Environment (DADE)          }
{                                                                              }
{             Copyright (c) 1996-1999 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}
{      Originally modified to be used with dbIsam by:                          }
{                          Wes Petersen, LexCraft                              }
{                          Jon Lloyd Duerdoth, Welsh Dragon Computing          }
{      We give no guarantees as to the functionality of the modifications.     }
{      You should be prepared to validate any application using this code.     }
{                                                                              }
{       Modified 1999.07.21 by Jon Lloyd Duerdoth to be consistent with the    }
{                        Version 4.11 release of RBuilder.  This version       }
{                        implemented GetQuery instead of GetTable to match     }
{                        the modules written by Digital Metaphors              }
{                                                                              }
{       Modified 1999.10.15 by Jon Lloyd Duerdoth to be consistent with the    }
{                        Version 4.2 release of Report Builder. This version   }
{                        reinstates GetTable instead of GetQuery since         }
{                        David Johnson indicated a much better performance     }
{                        for databases with large numbers of tables. I've      }
{                        left the old code in if you wish to change back.      }
{                                                                              }
{       This version has not been checked with any earlier version of          }
{       Report Builder.  This version has only been checked with Delphi 5      }
{      (Professional) and Report Builder 4.2.                                  }
{                                                                              }
{                                                                              }
{******************************************************************************}


unit daDbIsam;

interface

uses Classes, SysUtils, Forms, ExtCtrls,  DB,
     ppClass,
     ppDBPipe,
     ppDB,
     ppClasUt,
     daDB,
     daQuery,
     daDataVw,
     DBISAMTb,  {this is the unit containing the DBISAM objects}
     ppTypes;

type
  {DBISAM DataView Classes:
     1.  DBISAM TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon
             procedure
       a. TdaChildDBISAMQuery - TDbIsamQuery descendant that can be a child
                                of a DataView
       b. TdaChildDBISAMTable - TDbIsamTable descendant that can be a child
                                of a DataView
       c. TdaChildDBISAMStoredProc - TDbIsamStoredProc descendant that can
                                     be a child of a DataView. Not applicable
                                     to dbIsam at this time.
     2.  TdaDBISAMSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.
     3.  TdaDBISAMDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL
     4.  TdaDBISAMQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TDbIsamQuery etc.
      }

  { TdaChildDBISAMQuery }
  TdaChildDBISAMQuery = class(TDBISAMQuery)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildDBISAMQuery}

  { TdaChildDBISMTable }
  TdaChildDBISAMTable = class(TDBISAMTable)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildDBISAMTable}

  { TdaChildDbIsamStoredProc -- Not applicable to DBISAM at this time
  TdaChildDbIsamStoredProc = class(TDbIsamStoredProc)
    public
      function HasParent: Boolean; override;
    end;  class, TdaChildDbIsamStoredProc}


  { TdaDBISAMSession }
  TdaDBISAMSession = class(TdaSession)
    private

    public
      class function ClassDescription: String; override;
      class function DataSetClass: TdaDataSetClass; override;
      function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; override;

      procedure GetDatabaseNames(aList: TStrings); override;
      procedure GetTableNames(const aDatabaseName: String; aList: TStrings); override;
      function ValidDatabaseTypes: TppDatabaseTypes; override;
  end; {class, TdaDBISAMSession}



  { TdaDBISAMDataSet }
  TdaDBISAMDataSet = class(TdaDataSet)
    private
//    FQuery: TDBISAMQuery;              // daDbIsam 4.11
      FTable: TDBISAMTable;
//    function GetQuery: TDBISAMQuery;   // daDbIsam 4.11
      function GetTable : TDBISAMTable;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

//    property Query: TDBISAMQuery read GetQuery;    // daDbIsam 4.11
      property Table: TDBISAMTable read GetTable;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaDBISAMDataSet}


  { TdaDBISAMQueryDataView }
  TdaDBISAMQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildDBISAMQuery;
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

  end; {class, TdaDBISAMQueryDataView}


  {global functions to access default DBISAM session and database}
  function daGetDefaultDBISAMSession: TDBISAMSession;
  function daGetDefaultDBISAMDatabase: TDBISAMDatabase;

  {utility routines}
  procedure daGetDBISAMDatabaseNames(aList: TStrings);
  function daGetDBISAMDatabaseForName(aDatabaseName: String): TDBISAMDatabase;

  {Delphi design time registration}
  procedure Register;


implementation

const
  cDefaultDatabase = 'DefaultDBISAMDatabase';

var
  FDBISAMDatabase: TDBISAMDatabase;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin
  {DBISAM DataAccess Components}
  RegisterNoIcon([{TdaChildDBISAMQuery,} TdaChildDBISAMTable{, TdaChildDBISAMStoredProc}]);

  {DbIsam DataViews}
  RegisterNoIcon([TdaDBISAMQueryDataView]);
end;

{******************************************************************************
 *
 ** C H I L D   dbIsam  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildDBISAMQuery.HasParent }
function TdaChildDBISAMQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildDBISAMTable.HasParent }
function TdaChildDBISAMTable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{------------------------------------------------------------------------------}
{ TdaChildDBISAMStoredProc.HasParent }
{ not applicable to dbIsam at this time }
{
function TdaChildDBISAMStoredProc.HasParent: Boolean;
begin
  Result := True;
end;} {function, HasParent}


{******************************************************************************
 *
 ** dbIsam   S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.ClassDescription }
class function TdaDBISAMSession.ClassDescription: String;
begin
  Result := 'DBISAMSession';
end; {class function, ClassDescription}


{------------------------------------------------------------------------------}
{ TdaDBISAMSession.DataSetClass }
class function TdaDBISAMSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaDBISAMDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetTableNames }
procedure TdaDBISAMSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lDatabase: TDBISAMDatabase;
begin
  {get the database}
  lDatabase := daGetDBISAMDatabaseForName(aDatabaseName);

  {connection must be active to get table names}
  if not lDatabase.Connected then
    lDatabase.Connected := True;

  if lDatabase.Connected then
    lDatabase.Session.GetTableNames(aDatabaseName, aList);
    {First param changed from lDatabase to aDatabaseName for DBISAM}
end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetDatabaseType }
function TdaDBISAMSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtDbIsam;             //JLD 1999.10.15
end; {function, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaDBISAM8Session.GetDatabaseNames }
procedure TdaDBISAMSession.GetDatabaseNames(aList: TStrings);
begin
  {call utility routine to get list of database names}
  daGetDBISAMDatabaseNames(aList);
end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaDbIsamSession.ValidDatabaseTypes }
function TdaDBISAMSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
   Result := [dtDbISAM];         //JLD 1999.10.15
end; {function, ValidDatabaseTypes }


{******************************************************************************
 *
 ** dbIsam   D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.Create }
constructor TdaDBISAMDataSet.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
//FQuery := nil;        // daDbIsam 4.11
  FTable := nil;
end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.Destroy }
destructor TdaDBISAMDataSet.Destroy;
begin
//FQuery.Free;         // daDbIsam 4.11
  FTable.free;
  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.ClassDescription }
class function TdaDBISAMDataSet.ClassDescription: String;
begin
  Result := 'DBISAMDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetActive }
function TdaDBISAMDataSet.GetActive: Boolean;
begin
//Result := GetQuery.Active        // daDbIsam 4.11
  Result := FTable.active;
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetActive }
procedure TdaDBISAMDataSet.SetActive(Value: Boolean);
begin
//GetQuery.Active := Value;        // daDbIsam 4.11
  FTable.active := value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetQuery }      // daDbIsam 4.11
//function TdaDBISAMDataSet.GetQuery: TDBISAMQuery;
//begin
  {create DBISAM table, if needed}
//  if (FQuery = nil) then
//    FQuery := TDBISAMQuery.Create(Self);
//  Result := FQuery;
//end;} {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetDatabaseName }
procedure TdaDBISAMDataSet.SetDatabaseName(const aDatabaseName: String);
begin
  inherited SetDatabaseName(aDatabaseName);
  {table cannot be active to set database property}
//~~~~~~~~~~~~~~~~~        // daDbIsam 4.11
//  if GetQuery.Active then
//    FQuery.Active := False;
  {get DBISAM database for name}
//  Table.Database := daGetDBISAMDatabaseForName(aDatabaseName);
//  FQuery.DatabaseName := aDatabaseName;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   if GetTable.Active then
     FTable.Active:=False;
   FTable.DatabaseName:=aDatabaseName;
end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetDataName }
procedure TdaDBISAMDataSet.SetDataName(const aDataName: String);
begin
  inherited SetDataName(aDataName);
  {table cannot be active to set table name property}

//~~~~~~~~~~~~~~~~~        // daDbIsam 4.11
//  if GetQuery.Active then
//    FQuery.Active := False;
//  {construct an SQL statment that returns an empty result set,
//   this is used to get the field information }
//  FQuery.SQL.Text := 'SELECT * FROM ' + aDataName +
//                     ' WHERE ''c'' <> ''c'' ';}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 if GetTable.Active then
   FTable.Active:=False;
  FTable.TableName:=aDataname;

end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.BuildFieldList }

procedure TdaDBISAMDataSet.BuildFieldList;
var
  liIndex: Integer;
  lDBISAMField: TField;
  lField: TppField;
begin
  inherited BuildFieldList;
  {set table to active}
//~~~~~~~~~~~~~~~~~        // daDbIsam 4.11
// if not(GetQuery.Active) then
//    try
//      FQuery.Active := True;
//    except
//      on E:Exception do
//        Exit;
//    end;

  {create TppField objects for each field in the table}
// for liIndex := 0 to FQuery.FieldCount - 1 do
//    begin
//      lDBISAMField := FQuery.Fields[liIndex];
//
//      lField := TppField.Create(nil);
//
//     lField.TableName    := DataName;
//      lField.FieldName    := lDBISAMField.FieldName;
//      lField.DataType     := ppConvertFieldType(lDBISAMField.DataType);
//
//      AddField(lField);
//    end;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   if not GetTable.Active then
   try
     FTable.Active:=True;
   except
     on E:Exception do
       Exit;
   end;
    for liIndex:=0 to FTable.Fieldcount -1 do
    begin
      lDBISAMField:=FTable.Fields[liIndex];
      lField:=TppField.Create(nil);
      lField.TableName:=Dataname;
      lField.FieldName    := lDBISAMField.FieldName;
      lField.DataType     := ppConvertFieldType(lDBISAMField.DataType);

      AddField(lField);
    end;
end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetFieldNamesForSQL }
procedure TdaDBISAMDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TDBISAMQuery;
begin
  aList.Clear;

  {create a temporary DBISAM query}
  lQuery := TDBISAMQuery.Create(Self);

  {set the database and SQL properties}
  //lQuery.Database := daGetDBISAMDatabaseForName(DatabaseName);
  lQuery.DatabaseName := DatabaseName;
  lQuery.SQL := aSQL;

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetFieldsForSQL }
procedure TdaDBISAMDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TDBISAMQuery;
  lDBISAMField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;
  {create a temporary DbIsam query}
  lQuery := TDBISAMQuery.Create(Self);

  {assign database and SQL properties}
  //lQuery.Database := daGetDBISAMDatabaseForName(DatabaseName);
  lQuery.DatabaseName := DatabaseName;
  lQuery.SQL := aSQL;

  {set query to active}
  try
    lQuery.Active := True;
  except
    on E:Exception do begin
       Exit;
       end;
  end; {try, except}

  {create a TppField object for each field in the query}
  for liIndex := 0 to lQuery.FieldCount - 1 do
    begin
      lDBISAMField := lQuery.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.FieldName    := lDBISAMField.FieldName;
      lField.DataType     := ppConvertFieldType(lDBISAMField.DataType);

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
{ TdaDBISAMQueryDataView.Create }
constructor TdaDBISAMQueryDataView.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildDBISAMQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Destroy }
destructor TdaDBISAMQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Loaded }
procedure TdaDBISAMQueryDataView.Loaded;
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
{ TdaDBISAMQueryDataView.AfterLoadededEvent }
procedure TdaDBISAMQueryDataView.AfterLoadededEvent(Sender: TObject);
begin
  SetActive(True);

  FTimer.Free;
  FTimer := nil;
end; {procedure, AfterLoadededEvent}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.PreviewFormClass }
class function TdaDBISAMQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.SessionClass }
class function TdaDBISAMQueryDataView.SessionClass: TClass;
begin
  Result := TdaDBISAMSession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Init }
procedure TdaDBISAMQueryDataView.Init;
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
{ TdaDBISAMQueryDataView.SetReport }
procedure TdaDBISAMQueryDataView.SetReport(aReport: TppCustomReport);
begin
  inherited SetReport(aReport);

  if (Report = nil) or (DataPipelineCount = 0) then Exit;

  Report.DataPipeline := DataPipelines[0];
end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.SetActive }
procedure TdaDBISAMQueryDataView.SetActive(Value: Boolean);
begin
  inherited SetActive(Value);

  if (DataPipelineCount = 0) then Exit;

  if DataPipelines[0].Active <> Value then
    DataPipelines[0].Open;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.SQLChanged }
procedure TdaDBISAMQueryDataView.SQLChanged;
begin
  UpdateQueryObject;
  inherited SQLChanged;
end; {procedure, WizardCompleted}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.UpdateQueryObject }
procedure TdaDBISAMQueryDataView.UpdateQueryObject;
begin
  if FQuery.Active then
    FQuery.Close;

  //FQuery.Database := daGetDBISAMDatabaseForName(SQL.DatabaseName);
  FQuery.DatabaseName := SQL.DatabaseName;
  FQuery.SQL := SQL.SQLText;
end; {procedure, UpdateQueryObject}


{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultDBISAMSession }
function daGetDefaultDBISAMSession: TDBISAMSession;
begin
  {get the default database, when it is created DBISAM automatically
   creates a default session}
  Result := daGetDefaultDBISAMDatabase.Session;
end; {function, daGetDefaultDBISAMSession}

{------------------------------------------------------------------------------}
{ daGetDefaultDBISAMDatabase }
function daGetDefaultDBISAMDatabase: TDBISAMDatabase;
begin
  {create the default DBISAM database, if needed}
  if (FDBISAMDatabase = nil) then
    begin
      {create default DBISAM database}
      FDBISAMDatabase := TDBISAMDatabase.Create(nil);
      FDBISAMDatabase.Name := cDefaultDatabase;

      {set default session props}
//JLD      if FDBISAMDatabase.Session.Active then
//JLD        FDBISAMDatabase.Session.Active := False;

//JLD      FDBISAMDatabase.Session.SQLHourGlass := False;
//JLD      FDBISAMDatabase.Session.Active := True;
    end;
  Result := FDBISAMDatabase;
end; {function, daGetDefaultDBISAMDatabase}

{------------------------------------------------------------------------------}
{ daGetDBISAMDatabaseNames }
procedure daGetDBISAMDatabaseNames(aList: TStrings);
var
  lSession: TDBISAMSession;
  liIndex: Integer;
begin
  lSession := daGetDefaultDBISAMSession;

  {get DbIsam DSN Names }
  //lSession.GetDSNNames(aList);

  {add any names of Database objects other than the default database}
  for liIndex := 0 to  lSession.DatabaseCount-1 do
    if (lSession.Databases[liIndex].Name <> cDefaultDatabase) then
      aList.Insert(0, lSession.Databases[liIndex].Name);
end; {procedure, daGetDBISAMDatabaseNames}

{------------------------------------------------------------------------------}
{ daGetDBISAMDatabaseForName }
function daGetDBISAMDatabaseForName(aDatabaseName: String): TDBISAMDatabase;
var
  liIndex: Integer;
  lSession: TDBISAMSession;
begin
  Result := nil;

  lSession := daGetDefaultDBISAMSession;

  liIndex := 0;

  {check for a database object with this name}
  while (Result = nil) and (liIndex < lSession.DatabaseCount) do
    if (lSession.Databases[liIndex].Name = aDatabaseName) then
      Result := lSession.Databases[liIndex]
    else
      Inc(liIndex);

  if (Result <> nil) then Exit;

  {use the default database object}
  Result := daGetDefaultDBISAMDatabase;

  {set DataSourceName property}
  { Not applicable to DBISAM
  if (Result.DataSourceName <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;
      Result.DataSourceName := aDatabaseName;

    end;
   }
end; {function, daGetDBISAMDatabaseForName}

function TdaDBISAMDataSet.GetTable: TDBISAMTable;
begin

  if (FTable = nil) then
    FTable:= TDBISAMTable.Create(Self);

  Result := FTable;

end; {procedure, GetTable}

initialization
  {register the DBISAM descendant classes}
  RegisterClasses([TdaChildDBISAMQuery, TdaChildDBISAMTable{, TdaChildDBISAMStoredProc}]);
  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaDBISAMSession);
  daRegisterDataSet(TdaDBISAMDataSet);
  daRegisterDataView(TdaDBISAMQueryDataView);
  {initialize internal reference variables}
  FDBISAMDatabase := nil;
finalization
  {free the default database object}
  FDBISAMDatabase.Free;
  {unregister the DbIsam descendant classes}
  UnRegisterClasses([TdaChildDBISAMQuery, TdaChildDBISAMTable{, TdaChildDBISAMStoredProc}]);
  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaDBISAMSession);
  daUnRegisterDataSet(TdaDBISAMDataSet);
  daUnRegisterDataView(TdaDBISAMQueryDataView);
end.
