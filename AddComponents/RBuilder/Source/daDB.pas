{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDB;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Forms,
  ppComm, ppClass, ppDB, ppTypes, daRsvWrd;

type

  TdaSessionClass = class of TdaSession;
  TdaDataSetClass = class of TdaDataSet;

  { TdaSession }
  TdaSession = class(TppCommunicator)
    private
      FDataOwner: TComponent;

    protected
      procedure SetDataOwner(aDataOwner: TComponent); virtual;

    public
      constructor Create(aComponent: TComponent); override;
      
      class function ClassDescription: String; virtual; abstract;
      class function DataSetClass: TdaDataSetClass; virtual; abstract;
      class function DatabaseClass: TComponentClass; virtual;

      function  DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType; virtual;
      procedure GetDatabaseNames(aList: TStrings); virtual; abstract;
      function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; virtual; abstract;
      procedure GetTableNames(const aDatabaseName: String; aList: TStrings); virtual; abstract;
      function  IsSQLReservedWord(const aString: String; aDatabaseType: TppDatabaseType): Boolean; virtual;
      function  ValidDatabaseTypes: TppDatabaseTypes; virtual; abstract;

      property DataOwner: TComponent read FDataOwner write SetDataOwner;

  end; {class, TdaSession}


  { TdaDataSet }
  TdaDataSet = class(TppCommunicator)
    private
      FDatabaseName: String;
      FDataName: String;
      FFields: TList;

      procedure FreeFields;
      function  GetFieldCount: Integer;
      function  GetFieldForIndex(aIndex: Integer): TppField;

    protected
      function  AddField(aField: TppField): Integer;
      procedure BuildFieldList; virtual;
      function  GetActive: Boolean; virtual; abstract;
      procedure SetActive(Value: Boolean); virtual; abstract;
      procedure SetDatabaseName(const aDatabaseName: String); virtual;
      procedure SetDataName(const aDataName: String); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; virtual; abstract;

      procedure Close;
      function  FieldForFieldName(const aFieldName: String): TppField;
      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); virtual; abstract;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); virtual; abstract;
      procedure Open;

      property Active: Boolean read GetActive write SetActive;
      property DatabaseName: String read FDatabaseName write SetDatabaseName;
      property DataName: String read FDataName write SetDataName;
      property FieldCount: Integer read GetFieldCount;
      property Fields[Index: Integer]: TppField read GetFieldForIndex;

  end; {class, TdaDataSet}


  procedure daRegisterSession(aSessionClass: TdaSessionClass);
  procedure daUnRegisterSession(aSessionClass: TdaSessionClass);
  procedure daGetSessionClasses(aList: TStrings);
  function  daGetSessionClass(aClassDescription: String): TdaSessionClass;

  procedure daRegisterDataSet(aDataSetClass: TdaDataSetClass);
  procedure daUnRegisterDataSet(aDataSetClass: TdaDataSetClass);
  procedure daGetDataSetClasses(aList: TStrings);
  function  daGetDataSetClass(aClassDescription: String): TdaDataSetClass;

  procedure daGetDatabaseNames(aSessionClass: TdaSessionClass; aList: TStrings; aOwner: TComponent);

  procedure daGetDatabaseObjectsFromOwner(aSessionClass: TdaSessionClass; aList: TStrings; aOwner: TComponent);


implementation

var
  FSessionClassList: TStringList = nil;
  FDataSetClassList: TStringList = nil;


{******************************************************************************
 *
 ** S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSession.Create }

constructor TdaSession.Create(aComponent: TComponent);
begin

  inherited Create(aComponent);

  FDataOwner := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSession.DatabaseClass }

class function TdaSession.DatabaseClass: TComponentClass;
begin
  {descendants can override this with TDatabase, TIBDatabase, etc.}
  Result := nil;
end; {class function, DatabaseClass}

{------------------------------------------------------------------------------}
{ TdaSession.SetDataOwner }

procedure TdaSession.SetDataOwner(aDataOwner: TComponent);
begin
  FDataOwner := aDataOwner;
end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaSession.DefaultSQLType }

function TdaSession.DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType;
begin

  case aDatabaseType of
    dtParadox:     Result := sqBDELocal;
    dtInterBase:   Result := sqSQL2;
    dtMSAccess:    Result := sqSQL2;
    dtMSSQLServer: Result := sqSQL2;
    dtSybaseASA:   Result := sqSQL2;
    dtSybaseASE:   Result := sqSQL1;
    dtOracle:      Result := sqSQL1;
    else
      Result := sqSQL1;
  end;

end; {function, DefaultSQLType}

{------------------------------------------------------------------------------}
{ TdaSession.IsSQLReservedWord }

function TdaSession.IsSQLReservedWord(const aString: String; aDatabaseType: TppDatabaseType): Boolean;
begin
  Result := daIsSQLReservedWord(aString, aDatabaseType)
end; {function, IsSQLReservedWord}

{******************************************************************************
 *
 ** D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataSet.Create }

constructor TdaDataSet.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataName := '';
  FDatabaseName := '';
  FFields := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataSet.Destroy }

destructor TdaDataSet.Destroy;
begin

  FreeFields;

  FFields.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataSet.FreeFields }

procedure TdaDataSet.FreeFields;
var
  liField: Integer;
  
begin

  {free fields}
  for liField := (FFields.Count-1) downto 0 do
    TObject(FFields[liField]).Free;

  FFields.Clear;

end; {procedure, FreeFields}

{------------------------------------------------------------------------------}
{ TdaDataSet.SetDatabaseName }

procedure TdaDataSet.SetDatabaseName(const aDatabaseName: String);
begin
  FDatabaseName := aDatabaseName;
end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaDataSet.SetDataName }

procedure TdaDataSet.SetDataName(const aDataName: String);
begin
  FDataName := aDataName;
end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaDataSet.Open }

procedure TdaDataSet.Open;
begin
  SetActive(True);
end; {procedure, Open}

{------------------------------------------------------------------------------}
{ TdaDataSet.Close }

procedure TdaDataSet.Close;
begin
  SetActive(False);
end; {procedure, Close}

{------------------------------------------------------------------------------}
{ TdaDataSet.GetFieldCount }

function TdaDataSet.GetFieldCount: Integer;
begin

  if (FFields.Count = 0) then
    BuildFieldList;

  Result := FFields.Count;

end; {function, GetFieldCount}

{------------------------------------------------------------------------------}
{ TdaDataSet.GetFieldForIndex }

function TdaDataSet.GetFieldForIndex(aIndex: Integer): TppField;
begin
  
  if (FFields.Count = 0) then
    BuildFieldList;

  Result := TppField(FFields[aIndex]);

end; {function, GetFieldForIndex}

{------------------------------------------------------------------------------}
{ TdaDataSet.AddField }

function TdaDataSet.AddField(aField: TppField): Integer;
begin
  Result := FFields.Add(aField);
end; {function, AddField}

{------------------------------------------------------------------------------}
{ TdaDataSet.BuildFieldList }

procedure TdaDataSet.BuildFieldList;
begin
  FreeFields;
end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaDataSet.FieldForFieldName }

function TdaDataSet.FieldForFieldName(const aFieldName: String): TppField;
var
  lbFound: Boolean;
  liIndex: Integer;
  lField: TppField;
begin

  liIndex := 0;
  lbFound := False;
  lField := nil;

  while (liIndex < FFields.Count) and not(lbFound) do
    begin
      lField := TppField(FFields[liIndex]);

      if (CompareText(lField.FieldName, aFieldName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := lField
  else
    Result := nil;

end; {function, FieldForFieldName}

{******************************************************************************
 *
 ** S E S S I O N   R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetSessionClassList }

function daGetSessionClassList: TStrings;
begin

  if (FSessionClassList = nil) then
    FSessionClassList := TStringList.Create;

  Result := FSessionClassList;

end; {function, daGetSessionClassList}

{------------------------------------------------------------------------------}
{ daGetSessionClasses }

procedure daGetSessionClasses(aList: TStrings);
begin

  aList.Assign(daGetSessionClassList);

end; {procedure, GetSessionClasses}


{------------------------------------------------------------------------------}
{ daGetSessionClass }

function daGetSessionClass(aClassDescription: String): TdaSessionClass;
var
  liIndex: Integer;
  lClassList: TStrings;
begin
  lClassList := daGetSessionClassList;

  liIndex := lClassList.IndexOf(aClassDescription);

  if liIndex >= 0 then
    Result := TdaSessionClass(lClassList.Objects[liIndex])
  else
    Result := nil;


end; {procedure, daGetSessionClass}

{------------------------------------------------------------------------------}
{ daRegisterSession }

procedure daRegisterSession(aSessionClass: TdaSessionClass);
var
  lClassList: TStrings;
  liIndex: Integer;
begin

  if (aSessionClass = nil) then Exit;

  lClassList := daGetSessionClassList;

  liIndex :=  lClassList.IndexOf(aSessionClass.ClassDescription);

  if (liIndex = -1) then
    begin
      RegisterClass(aSessionClass);

      lClassList.AddObject(aSessionClass.ClassDescription, TObject(aSessionClass));
    end;

end; {procedure, daRegisterSession}

{------------------------------------------------------------------------------}
{ daUnRegisterSession }

procedure daUnRegisterSession(aSessionClass: TdaSessionClass);
var
  lClassList: TStrings;
  liIndex: Integer;
begin

  if (aSessionClass = nil) then Exit;

  if (FSessionClassList = nil) then Exit;

  lClassList := daGetSessionClassList;

  liIndex := lClassList.IndexOf(aSessionClass.ClassDescription);

  if (liIndex >= 0) then
    begin
      UnRegisterClass(aSessionClass);

      lClassList.Delete(liIndex);

    end;

end; {procedure, daUnRegisterSession}

{******************************************************************************
 *
 ** D A T A S E T   R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDataSetClassList }

function daGetDataSetClassList: TStrings;
begin

  if (FDataSetClassList = nil) then
    FDataSetClassList := TStringList.Create;

  Result := FDataSetClassList;

end; {function, daGetDataSetClassList}

{------------------------------------------------------------------------------}
{ daGetDataSetClasses }

procedure daGetDataSetClasses(aList: TStrings);
begin

  aList.Assign(daGetDataSetClassList);

end; {procedure, GetDataSetClasses}

{------------------------------------------------------------------------------}
{ daGetDataSetClass }

function daGetDataSetClass(aClassDescription: String): TdaDataSetClass;
var
  liIndex: Integer;
  lClassList: TStrings;
begin
  lClassList := daGetDataSetClassList;

  liIndex := lClassList.IndexOf(aClassDescription);

  if liIndex >= 0 then
    Result := TdaDataSetClass(lClassList.Objects[liIndex])
  else
    Result := nil;


end; {procedure, daGetSessionClass}

{------------------------------------------------------------------------------}
{ daRegisterDataSet }

procedure daRegisterDataSet(aDataSetClass: TdaDataSetClass);
var
  lClassList: TStrings;
  liIndex: Integer;
begin

  if (aDataSetClass = nil) then Exit;

  if (FDataSetClassList = nil) then Exit;

  lClassList := daGetDataSetClassList;

  liIndex :=  lClassList.IndexOf(aDataSetClass.ClassDescription);

  if (liIndex = -1) then
    begin
      RegisterClass(aDataSetClass);

      lClassList.AddObject(aDataSetClass.ClassDescription, TObject(aDataSetClass));
    end;

end; {procedure, daRegisterDataSet}

{------------------------------------------------------------------------------}
{ daUnRegisterDataSet }

procedure daUnRegisterDataSet(aDataSetClass: TdaDataSetClass);
var
  lClassList: TStrings;
  liIndex: Integer;
begin

  if (aDataSetClass = nil) then Exit;

  lClassList := daGetDataSetClassList;

  liIndex := lClassList.IndexOf(aDataSetClass.ClassDescription);

  if (liIndex >= 0) then
    begin
      UnRegisterClass(aDataSetClass);

      lClassList.Delete(liIndex);

    end;

end; {procedure, daUnRegisterDataSet}

{------------------------------------------------------------------------------}
{ daGetDatabaseNames }

procedure daGetDatabaseNames(aSessionClass: TdaSessionClass; aList: TStrings; aOwner: TComponent);
var
  lSession: TdaSession;

begin

  aList.Clear;

  if (aSessionClass = nil) then Exit;

  lSession := aSessionClass.Create(nil);
  lSession.DataOwner := aOwner;
  lSession.GetDatabaseNames(aList);

  lSession.Free;

end; {procedure, daGetDatabaseNames}


{------------------------------------------------------------------------------}
{ daGetDatabaseObjectsFromOwner }

procedure daGetDatabaseObjectsFromOwner(aSessionClass: TdaSessionClass; aList: TStrings; aOwner: TComponent);
var
  liComponent: Integer;
  liDataModule: Integer;
  lComponent: TComponent;

begin

  if (aOwner = nil) then Exit;

  {add database objects residing in owner}
  for liComponent := 0 to aOwner.ComponentCount-1 do
    if aOwner.Components[liComponent] is aSessionClass.DatabaseClass then
      begin
        lComponent := aOwner.Components[liComponent];
        aList.AddObject(lComponent.Name, lComponent);
      end;

  {add database objects residing in data modules }
  if not (aOwner is TDataModule) then
    for liDataModule := 0 to Screen.DataModuleCount-1 do
      daGetDatabaseObjectsFromOwner(aSessionClass, aList, Screen.DataModules[liDataModule]);

end; {procedure, daGetDatabaseObjectsFromOwner}



{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FSessionClassList.Free;
  FSessionClassList := nil;

  FDataSetClassList.Free;
  FDataSetClassList := nil;

end.
