{******************************************************************************}
{                                                                              }
{           ReportBuilder Data Access Developement Environment (DADE)          }
{                                                                              }
{             Copyright (c) 1996-1999 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit daADS;

interface

{$I ppIfDef.pas}

uses Windows, Classes, SysUtils, Forms, ExtCtrls, DB,IniFiles,
     ppComm, ppClass, ppDBPipe, ppDB, ppClasUt, ppTypes,
     daDB, daQuery, daDataVw, daDatPrv,
     AdsData, AdsTable, AdsCNNCT, AdsSET, AdsFunc;

type



  {ADS DataView Classes:

     1.  ADS TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildADSQuery - TADSQuery descendant that can be a child of a DataView
       b. TdaChildADSTable - TADSTable descendant that can be a child of a DataView

     2.  TdaADSSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     3.  TdaADSDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     4.  TdaADSQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TADSQuery etc.

      }

  { TdaChildADSQuery }
  TdaChildADSQuery = class(TADSQuery)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildADSQuery}

  { TdaChildADSTable }
  TdaChildADSTable = class(TADSTable)
    public
      function HasParent: Boolean; override;
    end;  {class, TdaChildADSTable}


  { TdaADSSession }
  TdaADSSession = class(TdaSession)
    private
      FReservedWords: TStringList;

      procedure AddDatabase(aDatabase: TComponent);
      procedure BuildReservedWordList;

    protected
      procedure SetDataOwner(aDataOwner: TComponent); override;

    public
      constructor Create(aComponent: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;
      class function DataSetClass: TdaDataSetClass; override;
      class function DatabaseClass: TComponentClass; override;

      function  DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType; override;
      procedure GetDatabaseNames(aList: TStrings); override;
      function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; override;
      procedure GetTableNames(const aDatabaseName: String; aList: TStrings); override;
      function  IsSQLReservedWord(const aString: String; aDatabaseType: TppDatabaseType): Boolean; override;
      function  ValidDatabaseTypes: TppDatabaseTypes; override;

  end; {class, TdaADSSession}

  { TdaADSDataSet }
  TdaADSDataSet = class(TdaDataSet)
    private
      FTable: TADSTable;
      function GetTable: TADSTable;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;
      property Table: TADSTable read GetTable;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      class function ClassDescription: String; override;
      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaADSDataSet}


  { TdaADSQueryDataView }
  TdaADSQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildADSQuery;

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

  end; {class, TdaADSQueryDataView}


  {global functions to access default ADS connection}
  function daGetDefaultADSConnection: TADSConnection;

  {utility routines}
  procedure daGetADSConnectionNames(aList: TStrings);
  function daGetADSConnectionForName(aDatabaseName: String): TADSConnection;
  function daGetADSAliasForDatabaseName(aDatabaseName: String): String;

  function daGetADSConnectionList: TppComponentList;


  {Delphi design time registration}
  procedure Register;


implementation



const
  cADSIniFile = 'ads.ini';
  cADSIniDBSection = 'Databases';
  cDefaultConnection = 'DefaultADSConnection';


var
  FADSConnection: TADSConnection;
  FADSConnectionList: TppComponentList;


{******************************************************************************
 ** P R O C E D U R E S   A N D   F U N C T I O N S
{******************************************************************************}


{------------------------------------------------------------------------------}
{ daAddBackSlash }

function daAddBackSlash(aSource: string): string;
var
  lChar: string[1];

begin

  Result := aSource;

  lChar := copy(aSource, Length(aSource), 1);

  if (lChar <> ':') and (lChar <> '\') then
    Result := Result + '\';

end; {function, daAddBackSlash}


{------------------------------------------------------------------------------}
{ daGetWindowsDir }

function daGetWindowsDir: string;
var
  lBuffer: array[0..255] of char;
begin

  GetWindowsDirectory(lBuffer, SizeOf(lBuffer));

  Result := StrPas(lBuffer)+'\';

end; {function, daGetWindowsDir}


{------------------------------------------------------------------------------}
{ daGetADSDatabaseInfo }

function daGetADSDatabaseInfo(const aDatabaseName: string; var aPath: string;
                              var TType: TAdsTableTypes): boolean;
var
  lADSIni: TIniFile;
  lStr: string;
  liIndex: Integer;

begin

  Result := False;

  lADSIni := TIniFile.Create(daGetWindowsDir + cADSIniFile);

  try

    {read database alias information from INI file}
    lStr := lADSIni.ReadString(cADSIniDBSection, aDatabaseName, '~');

    if lStr<>'~' then
      begin
        liIndex := pos(';',lStr);

        if liIndex > 0 then
          begin

            {get path}
            aPath := Copy(lStr, 1, liIndex-1);

            {get table type}
            if UpperCase(Copy(lStr,liIndex+1,1)) = 'A' then
              TType := ttAdsADT
            else if UpperCase(Copy(lStr,liIndex+1,1)) = 'C' then
              TType := ttAdsCDX
            else
              TType := ttAdsNTX;
          end;

        Result := True;

      end;

  finally
    lADSIni.Free;

  end;

end; {function, daGetWindowsDir}

{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}


procedure Register;
begin

  {ADS DataAccess Components}
  RegisterNoIcon([TdaChildADSQuery,TdaChildADSTable]);

  {ADS DataViews}
  RegisterNoIcon([TdaADSQueryDataView]);

end;


{******************************************************************************
 *
 ** C H I L D   ADS  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildADSQuery.HasParent }

function TdaChildADSQuery.HasParent: Boolean;
begin
  Result := True;

end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildADSTable.HasParent }

function TdaChildADSTable.HasParent: Boolean;
begin
  Result := True;

end; {function, HasParent}


{******************************************************************************
 *
 ** A D S  S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADSSession.ClassDescription }

constructor TdaADSSession.Create(aComponent: TComponent);
begin
  inherited Create(aComponent);

  FReservedWords := TStringList.Create;
end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaADSSession.ClassDescription }

destructor TdaADSSession.Destroy;
begin

  FReservedWords.Free;
  
  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TdaADSSession.ClassDescription }

class function TdaADSSession.ClassDescription: String;
begin
  Result := 'ADSSession';
end; {class function, ClassDescription}


{------------------------------------------------------------------------------}
{ TdaADSSession.DataSetClass }

class function TdaADSSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaADSDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaADSSession.DatabaseClass }

class function TdaADSSession.DatabaseClass: TComponentClass;
begin
  Result := TADSConnection;
end; {class function, DatabaseClass}


{------------------------------------------------------------------------------}
{ TdaADSSession.GetTableNames }

procedure TdaADSSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lsPath: string;
  lType: TAdsTableTypes;
  liFind: Integer;
  liIndex: integer;
  lSearchRec: TSearchRec;
  lsAlias: String;

begin
  aList.Clear;

  {get the Alias for this database name}
  lsAlias := daGetADSAliasForDatabaseName(aDatabaseName);

  {get the path information for the database}
  if not daGetADSDatabaseInfo(lsAlias, lsPath, lType) then
    begin
      lsPath:= aDatabaseName;
      lType:= ttADSAdt;
    end;

  lsPath:= daAddBackSlash(lsPath);

  if lType = ttAdsADT then
    lsPath := lsPath+'*.ADT'
  else
    lsPath := lsPath+'*.DBF';

  {build list of the files in the directory}
  liFind := FindFirst(lsPath, 0, lSearchRec);

  while (liFind = 0) do
    begin
      liIndex := pos('.', lSearchRec.name);
      
      if liIndex >0 then
        aList.Append(Copy(lSearchRec.name, 1, liIndex-1) )
      else
        aList.Append(lSearchRec.name);

     liFind := FindNext(lSearchRec);
    end;

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaADSSession.SetDataOwner }

procedure TdaADSSession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  {refresh database names}
  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}


{------------------------------------------------------------------------------}
{ TdaADSSession.GetDatabaseNames }

procedure TdaADSSession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;

begin

  {call utility routine to get list of database names}
  daGetADSConnectionNames(aList);

  {get additional names from Database objects residing on Owner}
  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  {build list of connection objects}
  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));

end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaADSSession.AddDatabase }

procedure TdaADSSession.AddDatabase(aDatabase: TComponent);
begin

  if daGetADSConnectionList.IndexOf(aDatabase) < 0 then
    FADSConnectionList.Add(aDatabase);

end; {procedure, AddDatabase}

{------------------------------------------------------------------------------}
{ TdaADSSession.ValidDatabaseTypes }

function TdaADSSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  Result := [dtAdvantage];
end; {procedure, ValidDatabaseTypes}

{------------------------------------------------------------------------------}
{ TdaADSSession.GetDatabaseType }

function TdaADSSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtAdvantage;
end; {procedure, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaADSSession.DefaultSQLType }

function TdaADSSession.DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType;
begin
  Result := sqSQL2;
end; {function, DefaultSQLType}

{------------------------------------------------------------------------------}
{ TdaADSSession.IsSQLReservedWord }

function TdaADSSession.IsSQLReservedWord(const aString: String; aDatabaseType: TppDatabaseType): Boolean;
begin

  if (FReservedWords.Count = 0) then
    BuildReservedWordList;

  Result := (FReservedWords.IndexOf(aString) <> -1);

end; {procedure, IsSQLReservedWord}

{------------------------------------------------------------------------------}
{ TdaADSSession.BuildReservedWordList }

procedure TdaADSSession.BuildReservedWordList;
begin
  FReservedWords.Add('ACTIVE');
  FReservedWords.Add('ADD');
  FReservedWords.Add('ALL');
  FReservedWords.Add('AFTER');
  FReservedWords.Add('ALTER');
  FReservedWords.Add('AND');
  FReservedWords.Add('ANY');
  FReservedWords.Add('AS');
  FReservedWords.Add('ASC');
  FReservedWords.Add('ASCENDING');
  FReservedWords.Add('AT');
  FReservedWords.Add('AUTO');
  FReservedWords.Add('AUTOINC');
  FReservedWords.Add('AVG');
  FReservedWords.Add('BASE_NAME');
  FReservedWords.Add('BEFORE');
  FReservedWords.Add('BEGIN');
  FReservedWords.Add('BETWEEN');
  FReservedWords.Add('BLOB');
  FReservedWords.Add('BOOLEAN');
  FReservedWords.Add('BOTH');
  FReservedWords.Add('BY');
  FReservedWords.Add('BYTES');
  FReservedWords.Add('CACHE');
  FReservedWords.Add('CAST');
  FReservedWords.Add('CHAR');
  FReservedWords.Add('CHARACTER');
  FReservedWords.Add('CHECK');
  FReservedWords.Add('CHECK_POINT_LENGTH');
  FReservedWords.Add('COLLATE');
  FReservedWords.Add('COLUMN');
  FReservedWords.Add('COMMIT');
  FReservedWords.Add('COMMITTED');
  FReservedWords.Add('COMPUTED');
  FReservedWords.Add('CONDITIONAL');
  FReservedWords.Add('CONSTRAINT');
  FReservedWords.Add('CONTAINING');
  FReservedWords.Add('COUNT');
  FReservedWords.Add('CREATE');
  FReservedWords.Add('CSTRING');
  FReservedWords.Add('CURRENT');
  FReservedWords.Add('CURSOR');
  FReservedWords.Add('DATABASE');
  FReservedWords.Add('DATE');
  FReservedWords.Add('DAY');
  FReservedWords.Add('DEBUG');
  FReservedWords.Add('DEC');
  FReservedWords.Add('DECIMAL');
  FReservedWords.Add('DECLARE');
  FReservedWords.Add('DEFAULT');
  FReservedWords.Add('DELETE');
  FReservedWords.Add('DESC');
  FReservedWords.Add('DESCENDING');
  FReservedWords.Add('DISTINCT');
  FReservedWords.Add('DO');
  FReservedWords.Add('DOMAIN');
  FReservedWords.Add('DOUBLE');
  FReservedWords.Add('DROP');
  FReservedWords.Add('ELSE');
  FReservedWords.Add('END');
  FReservedWords.Add('ENTRY_POINT');
  FReservedWords.Add('ESCAPE');
  FReservedWords.Add('EXCEPTION');
  FReservedWords.Add('EXECUTE');
  FReservedWords.Add('EXISTS');
  FReservedWords.Add('EXIT');
  FReservedWords.Add('EXTERNAL');
  FReservedWords.Add('EXTRACT');
  FReservedWords.Add('FILE');
  FReservedWords.Add('FILTER');
  FReservedWords.Add('FLOAT');
  FReservedWords.Add('FOR');
  FReservedWords.Add('FOREIGN');
  FReservedWords.Add('FROM');
  FReservedWords.Add('FULL');
  FReservedWords.Add('FUNCTION');
  FReservedWords.Add('GDSCODE');
  FReservedWords.Add('GENERATOR');
  FReservedWords.Add('GEN_ID');
  FReservedWords.Add('GRANT');
  FReservedWords.Add('GROUP');
  FReservedWords.Add('GROUP_COMMIT_WAIT_TIME');
  FReservedWords.Add('HAVING');
  FReservedWords.Add('HOUR');
  FReservedWords.Add('IF');
  FReservedWords.Add('IN');
  FReservedWords.Add('INT');
  FReservedWords.Add('INACTIVE');
  FReservedWords.Add('INDEX');
  FReservedWords.Add('INNER');
  FReservedWords.Add('INPUT_TYPE');
  FReservedWords.Add('INSERT');
  FReservedWords.Add('INTEGER');
  FReservedWords.Add('INTO');
  FReservedWords.Add('IS');
  FReservedWords.Add('ISOLATION');
  FReservedWords.Add('JOIN');
  FReservedWords.Add('KEY');
  FReservedWords.Add('LONG');
  FReservedWords.Add('LENGTH');
  FReservedWords.Add('LOGFILE');
  FReservedWords.Add('LOWER');
  FReservedWords.Add('LEADING');
  FReservedWords.Add('LEFT');
  FReservedWords.Add('LEVEL');
  FReservedWords.Add('LIKE');
  FReservedWords.Add('LOG_BUFFER_SIZE');
  FReservedWords.Add('MANUAL');
  FReservedWords.Add('MAX');
  FReservedWords.Add('MAXIMUM_SEGMENT');
  FReservedWords.Add('MERGE');
  FReservedWords.Add('MESSAGE');
  FReservedWords.Add('MIN');
  FReservedWords.Add('MINUTE');
  FReservedWords.Add('MODULE_NAME');
  FReservedWords.Add('MONEY');
  FReservedWords.Add('MONTH');
  FReservedWords.Add('NAMES');
  FReservedWords.Add('NATIONAL');
  FReservedWords.Add('NATURAL');
  FReservedWords.Add('NCHAR');
  FReservedWords.Add('NO');
  FReservedWords.Add('NOT');
  FReservedWords.Add('NULL');
  FReservedWords.Add('NUM_LOG_BUFFERS');
  FReservedWords.Add('NUMERIC');
  FReservedWords.Add('OF');
  FReservedWords.Add('ON');
  FReservedWords.Add('ONLY');
  FReservedWords.Add('OPTION');
  FReservedWords.Add('OR');
  FReservedWords.Add('ORDER');
  FReservedWords.Add('OUTER');
  FReservedWords.Add('OUTPUT_TYPE');
  FReservedWords.Add('OVERFLOW');
  FReservedWords.Add('PAGE_SIZE');
  FReservedWords.Add('PAGE');
  FReservedWords.Add('PAGES');
  FReservedWords.Add('PARAMETER');
  FReservedWords.Add('PASSWORD');
  FReservedWords.Add('PLAN');
  FReservedWords.Add('POSITION');
  FReservedWords.Add('POST_EVENT');
  FReservedWords.Add('PRECISION');
  FReservedWords.Add('PROCEDURE');
  FReservedWords.Add('PROTECTED');
  FReservedWords.Add('PRIMARY');
  FReservedWords.Add('PRIVILEGES');
  FReservedWords.Add('RAW_PARTITIONS');
  FReservedWords.Add('RDB$DB_KEY');
  FReservedWords.Add('READ');
  FReservedWords.Add('REAL');
  FReservedWords.Add('RECORD_VERSION');
  FReservedWords.Add('REFERENCES');
  FReservedWords.Add('RESERV');
  FReservedWords.Add('RESERVING');
  FReservedWords.Add('RETAIN');
  FReservedWords.Add('RETURNING_VALUES');
  FReservedWords.Add('RETURNS');
  FReservedWords.Add('REVOKE');
  FReservedWords.Add('RIGHT');
  FReservedWords.Add('ROLLBACK');
  FReservedWords.Add('SECOND');
  FReservedWords.Add('SEGMENT');
  FReservedWords.Add('SELECT');
  FReservedWords.Add('SET');
  FReservedWords.Add('SHARED');
  FReservedWords.Add('SHADOW');
  FReservedWords.Add('SCHEMA');
  FReservedWords.Add('SINGULAR');
  FReservedWords.Add('SIZE');
  FReservedWords.Add('SMALLINT');
  FReservedWords.Add('SNAPSHOT');
  FReservedWords.Add('SOME');
  FReservedWords.Add('SORT');
  FReservedWords.Add('SQLCODE');
  FReservedWords.Add('STABILITY');
  FReservedWords.Add('STARTING');
  FReservedWords.Add('STARTS');
  FReservedWords.Add('STATISTICS');
  FReservedWords.Add('SUB_TYPE');
  FReservedWords.Add('SUBSTRING');
  FReservedWords.Add('SUM');
  FReservedWords.Add('SUSPEND');
  FReservedWords.Add('TABLE');
  FReservedWords.Add('THEN');
  FReservedWords.Add('TIME');
  FReservedWords.Add('TIMESTAMP');
  FReservedWords.Add('TIMEZONE_HOUR');
  FReservedWords.Add('TIMEZONE_MINUTE');
  FReservedWords.Add('TO');
  FReservedWords.Add('TRAILING');
  FReservedWords.Add('TRANSACTION');
  FReservedWords.Add('TRIGGER');
  FReservedWords.Add('TRIM');
  FReservedWords.Add('UNCOMMITTED');
  FReservedWords.Add('UNION');
  FReservedWords.Add('UNIQUE');
  FReservedWords.Add('UPDATE');
  FReservedWords.Add('UPPER');
  FReservedWords.Add('USER');
  FReservedWords.Add('VALUE');
  FReservedWords.Add('VALUES');
  FReservedWords.Add('VARCHAR');
  FReservedWords.Add('VARIABLE');
  FReservedWords.Add('VARYING');
  FReservedWords.Add('VIEW');
  FReservedWords.Add('WAIT');
  FReservedWords.Add('WHEN');
  FReservedWords.Add('WHERE');
  FReservedWords.Add('WHILE');
  FReservedWords.Add('WITH');
  FReservedWords.Add('WORK');
  FReservedWords.Add('WRITE');
  FReservedWords.Add('YEAR');
end; {procedure, BuildReservedWordList}

{******************************************************************************
 *
 ** ADS D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.Create }

constructor TdaADSDataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FTable := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.Destroy }

destructor TdaADSDataSet.Destroy;
begin

  FTable.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.ClassDescription }

class function TdaADSDataSet.ClassDescription: String;
begin
  Result := 'ADSDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.GetActive }

function TdaADSDataSet.GetActive: Boolean;
begin
  Result := Table.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.SetActive }

procedure TdaADSDataSet.SetActive(Value: Boolean);
begin
  Table.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.GetTable }

function TdaADSDataSet.GetTable: TADSTable;
begin

  {create ADS table, if needed}
  if (FTable = nil) then
    FTable:= TADSTable.Create(Self);

  Result := FTable;

end; {procedure, GetTable}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.SetDatabaseName }
procedure TdaADSDataSet.SetDatabaseName(const aDatabaseName: String);
begin

  inherited SetDatabaseName(aDatabaseName);

  {table cannot be active to set database property}
  if Table.Active then
    Table.Active:= False;

  {get ADS database for name}
  Table.DatabaseName := aDatabaseName;

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.SetDataName }
procedure TdaADSDataSet.SetDataName(const aDataName: String);
begin

  inherited SetDataName(aDataName);

  {table cannot be active to set table name property}
  if Table.Active then
    Table.Active := False;

  Table.TableName := aDataName;
end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.BuildFieldList }
procedure TdaADSDataSet.BuildFieldList;
var
  liIndex: Integer;
  lADSField: TField;
  lField: TppField;
begin

  inherited BuildFieldList;

  {set table to active}
  Table.Active:= True;

  {create TppField objects for each field in the table}
  for liIndex := 0 to Table.FieldCount - 1 do
    begin
      lADSField := Table.Fields[liIndex];
      lField := TppField.Create(nil);
      lField.TableName    := Table.TableName;
      lField.FieldName    := lADSField.FieldName;
      lField.DataType     := ppConvertFieldType(lADSField.DataType);
      AddField(lField);
    end;
end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.GetFieldNamesForSQL }

procedure TdaADSDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TADSQuery;
begin
  aList.Clear;

  {create a temporary ADS query}
  lQuery := TADSQuery.Create(Self);

  try
    {set the database and SQL properties}
    lQuery.DatabaseName:= DatabaseName;
    lQuery.SQL:= aSQL;
    {get the field names}
    lQuery.GetFieldNames(aList);
    
  finally
    lQuery.Free;
  end;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaADSDataSet.GetFieldsForSQL }

procedure TdaADSDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TADSQuery;
  lADSField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  {create a temporary ADS query}
  lQuery := TADSQuery.Create(Self);

  try
    {assign database and SQL properties}
    lQuery.DatabaseName:= DatabaseName;
    lQuery.SQL:= aSQL;

    {set query to active}
    lQuery.Active := True;

    {create a TppField object for each field in the query}
    for liIndex := 0 to lQuery.FieldCount - 1 do
      begin
        lADSField := lQuery.Fields[liIndex];
        lField := TppField.Create(nil);
        lField.FieldName:= lADSField.FieldName;
        lField.DataType:= ppConvertFieldType(lADSField.DataType);
        aList.Add(lField);
      end;
  finally
    lQuery.Free;
  end;

end; {procedure, GetFieldsForSQL}


{******************************************************************************
 ** A D S  Q U E R Y   D A T A V I E W
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.Create }

constructor TdaADSQueryDataView.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }
  FQuery := TdaChildADSQuery.Create(Self);
  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.Destroy }

destructor TdaADSQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.SessionClass }

class function TdaADSQueryDataView.SessionClass: TClass;
begin
  Result := TdaADSSession;

end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.PreviewFormClass }

class function TdaADSQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));

end; {class function, PreviewFormClass}


{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.Loaded }

procedure TdaADSQueryDataView.Loaded;
begin

  inherited Loaded;

  UpdateQueryObject;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.ConnectPipelinesToData }

procedure TdaADSQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}


{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.Init }

procedure TdaADSQueryDataView.Init;
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
{ TdaADSQueryDataView.SQLChanged }

procedure TdaADSQueryDataView.SQLChanged;
begin
  UpdateQueryObject;

end; {procedure, SQLChanged}

{------------------------------------------------------------------------------}
{ TdaADSQueryDataView.UpdateQueryObject }

procedure TdaADSQueryDataView.UpdateQueryObject;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.DatabaseName:= SQL.DatabaseName;
  FQuery.SQL:= SQL.SQLText;

end; {procedure, UpdateQueryObject}



{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultADSConnection }

function daGetDefaultADSConnection: TADSConnection;
begin

  {create the default ADS Connection, if needed}
  if (FADSConnection = nil) then
    begin
      {create default ADS Connection}
      FADSConnection := TADSConnection.Create(Application);
      FADSConnection.Name := cDefaultConnection;

    end;

  Result := FADSConnection;

end; {function, daGetDefaultADSConnection}


{------------------------------------------------------------------------------}
{ daGetADSConnectionNames }

procedure daGetADSConnectionNames(aList: TStrings);
var
  lADSIni: TIniFile;
  lList: TStringList;
  liIndex: integer;

begin

  {get AliasNames from ADS.ini file }
   
  aList.Clear;
  lList:= TStringList.Create;
  lADSIni:= TIniFile.Create(daGetWindowsDir + cADSIniFile);

  try
    lADSIni.ReadSection(cADSIniDBSection,lList);
    for liIndex := 0 to lList.Count-1 do
      aList.Append(lList.Strings[liIndex]);

  finally
    lList.Free;
    lADSIni.Free;

  end;

end; {procedure, daGetADSConnectionNames}


{------------------------------------------------------------------------------}
{ daGetADSConnectionForName }

function daGetADSConnectionForName(aDatabaseName: String): TADSConnection;
var
  liIndex: Integer;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetADSConnectionList.Count) do
    begin
      if (AnsiCompareStr(FADSConnectionList[liIndex].Name, aDatabaseName) = 0) then
        Result :=  TADSConnection(FADSConnectionList[liIndex]);
      Inc(liIndex);
    end;

  if (Result <> nil) then Exit;

  {use the default database object}
  Result := daGetDefaultADSConnection;

  {set DatabaseName property, if needed}
  if (Result.AliasName <> aDatabaseName) then
    begin
      if Result.IsConnected then
        Result.IsConnected := False;
      Result.AliasName := aDatabaseName;

    end;

end; {function, daGetADSConnectionForName}


{------------------------------------------------------------------------------}
{ daGetADSAliasForDatabaseName }

function daGetADSAliasForDatabaseName(aDatabaseName: String): String;
var
  lADSConnection: TADSConnection;

begin
  lADSConnection :=  daGetADSConnectionForName(aDatabaseName);

  if lADSConnection <> nil then
    Result := lADSConnection.AliasName
  else
    Result := aDatabaseName;

end; {function, daGetADSConnectionForName}



{------------------------------------------------------------------------------}
{ daGetADSConnectionList }

function daGetADSConnectionList: TppComponentList;
begin
  if (FADSConnectionList = nil) then
    FADSConnectionList := TppComponentList.Create(nil);

  Result := FADSConnectionList;

end; {function, daGetADSConnectionList}


initialization

  {register the ADS descendant classes}
  RegisterClasses([TdaChildADSQuery,TdaChildADSTable]);
  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaADSSession);
  daRegisterDataSet(TdaADSDataSet);
  daRegisterDataView(TdaADSQueryDataView);

  {initialize internal reference variables}
  FADSConnection     := nil;
  FADSConnectionList := nil;


finalization

  {free the default connection object}
  {note: do not free the ADSConnection - the Application is
         the owner and will free it}
{ FADSConnection.Free;}
  FADSConnectionList.Free;

  {unregister the ADS descendant classes}
  UnRegisterClasses([TdaChildADSQuery,TdaChildADSTable]);
  
  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaADSSession);
  daUnRegisterDataSet(TdaADSDataSet);
  daUnRegisterDataView(TdaADSQueryDataView);

end.

