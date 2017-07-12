{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 1999 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daQClass;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Dialogs, Controls, Forms,
  ppComm, ppRelatv, ppUtils, ppTypes, ppDB, ppDsgnDB, daDB, ppRTTI;

type

  {enumerated types}
  TdaCalcType = (dacaAvg, dacaCount, dacaMax, dacaMin, dacaSum, dacaExpression, dacaUnknown);

  TdaCopyFilterType = (daftAll, daftSelectable, daftSortable, daftSearchable);

  TdaChildType = (dactSelectField, dactGroupByField, dactOrderByField, dactLocalField,
                  dactForeignField, dactSelectTable, dactTableJoin, dactCriteria, dactCalcField);

  TdaCriteriaOperatorType = (dacoEqual, dacoNotEqual,
                             dacoLessThan, dacoLessThanOrEqualTo,
                             dacoGreaterThan, dacoGreaterThanOrEqualTo,
                             dacoLike, dacoNotLike,
                             dacoBetween, dacoNotBetween,
                             dacoInList, dacoNotInList,
                             dacoBlank, dacoNotBlank);

  TdaCriteriaType = (dacrField, dacrOR, dacrNOT, dacrBegin, dacrEnd);

  TdaJoinOperatorType = (dajoEqual, dajoNotEqual,
                         dajoGreaterThan, dajoGreaterThanOrEqualTo,
                         dajoLessThan, dajoLessThanOrEqualTo);

  TdaJoinType = (dajtNone, dajtInner, dajtOuter, dajtLeftOuter, dajtRightOuter);

  {exceptions}
  EQueryWizardError = class(Exception);

  {forward declarations}
  TdaChild = class;
  TdaTable = class;
  TdaTableJoin = class;
  TdaField = class;
  TdaCalculation = class;
  TdaCriteria = class;

  { TdaSQL }
  TdaSQL = class(TppRelative)
    private
      FAllowSelfJoin: Boolean;
      FAssigning: Boolean;
      FAssigningSQLText: Boolean;
      FAvailableCriteriaFields: TList;
      FAvailableTables: TList;
      FAvailableSelectTables: TList;
      FAvailableSelectFields: TList;
      FAvailableOrderByFields: TList;
      FAvailableGroupByFields: TList;
      FAvailableFields: TList;
      FCalcFields: TList;
      FCalcFieldsOutOfSync: Boolean;
      FCriteria: TList;
      FCriteriaOutOfSync: Boolean;
      FDatabaseName: String;
      FDatabaseType: TppDatabaseType;
      FDataDictionary: TppDataDictionary;
      FDataPipelineName: String;
      FDataSetClass: TdaDataSetClass;
      FDescription: String;
      FDistinct: Boolean;
      FDriverName: String;
      FEditSQLAsText: Boolean;
      FFieldsOutOfSync: Boolean;
      FFieldSortMode: Integer;
      FGroupByFields: TList;
      FGroupByFieldsOutOfSync: Boolean;
      FGroupByFieldsSynced: Boolean;
      FLanguageIndex: Longint;
      FLineLength: Integer;
      FModified: Boolean;
      FOrderByFields: TList;
      FOrderByFieldsOutOfSync: Boolean;
      FSavedAvailableFields: TList;
      FSQLOutOfSync: Boolean;
      FSQLText: TStrings;
      FSQLType: TppSQLType;
      FSelectFields: TList;
      FSelectFieldsOutOfSync: Boolean;
      FSelectTables: TList;
      FSelectTablesOutOfSync: Boolean;
      FSession: TdaSession;
      FSyncingGroups: Boolean;
      FTablesOutOfSync: Boolean;

      procedure AddAllSelectFields(aTable: TdaTable);
      function  AutoJoin: Boolean;
      procedure AvailableFieldsOutOfSync;
      procedure CalcTypeChangeEvent(Sender: TObject);
      procedure CreateAllFields(aTable: TdaTable; aList: TList);
      procedure CreateAvailableFieldList;
      procedure CreateAvailableTableList;
      procedure CreateFieldsFromSQL;
      procedure CreateJoin(aTable1, aTable2: TdaTable);
      procedure CreateSQL;
      function  CreateAlias(const aTableName: String): String;
      function  CreateTableAlias(aTable: TdaTable): String;
      function  CreateTableSQLAlias(aTable: TdaTable): String;
      procedure FreeMatchingFields(aTable: TdaTable; aList: TList; var aOutOfSync: Boolean);
      procedure FreeRelatedFields(aTable: TdaTable);
      function  FreeTable(aTable: TdaTable): Boolean;
      function  GetAvailableCalcField(aIndex: Integer): TdaField;
      function  GetAvailableCalcFieldCount: Integer;
      function  GetAvailableCriteria(aIndex: Integer): TdaField;
      function  GetAvailableCriteriaCount: Integer;
      function  GetAvailableField(aIndex: Integer): TdaField;
      function  GetAvailableFieldCount: Integer;
      function  GetAvailableSelectField(aIndex: Integer): TdaField;
      function  GetAvailableSelectFieldCount: Integer;
      function  GetAvailableSelectTable(aIndex: Integer): TdaTable;
      function  GetAvailableSelectTableCount: Integer;
      function  GetAvailableOrderByField(aIndex: Integer): TdaField;
      function  GetAvailableOrderByFieldCount: Integer;
      function  GetAvailableGroupByField(aIndex: Integer): TdaField;
      function  GetAvailableGroupByFieldCount: Integer;
      function  GetAvailableTable(aIndex: Integer): TdaTable;
      function  GetAvailableTableCount: Integer;
      function  GetCalcField(aIndex: Integer): TdaCalculation;
      function  GetCalcFieldCount: Integer;
      function  GetCriteria(aIndex: Integer): TdaCriteria;
      function  GetCriteriaCount: Integer;
      function  GetSelectField(aIndex: Integer): TdaField;
      function  GetSelectFieldCount: Integer;
      function  GetFieldsForSQL(aSQL: TStrings; aList: TList): Boolean;
      function  GetGroupByField(aIndex: Integer): TdaField;
      function  GetGroupByFieldCount: Integer;
      function  GetOrderByField(aIndex: Integer): TdaField;
      function  GetOrderByFieldCount: Integer;
      function  GetSQLText: TStrings;
      function  GetSelectTable(aIndex: Integer): TdaTable;
      function  GetSelectTableCount: Integer;
      procedure GetTablesFromDataDictionary(aAvailableTables: TStrings);
      procedure GetTablesFromSession(aAvailableTables: TStrings);
      procedure MatchJoinFieldsViaDictionary(aTable1, aTable2: TdaTable);
      function  OpenDataSet(aDataSet: TdaDataSet): Boolean;
      function  ResolveCriteria(aCriteria: TdaCriteria; aLastCriteriaType: TdaCriteriaType; var aExpression: String): Boolean;
      procedure SetDataDictionary(aDataDictionary: TppDataDictionary);
      procedure SetEditSQLAsText(Value: Boolean);
      procedure SetSession(aSession: TdaSession);
      procedure SetSQLText(aSQLText: TStrings);
      procedure SetSQLType(aSQLType: TppSQLType);
      procedure SyncCalcFields;
      procedure SyncCriteria;
      procedure SyncFieldList(aAvailableList, aCurrentList: TList);
      procedure SyncFields;
      procedure SyncGroupByFields;
      procedure SyncOrderByFields;
      procedure SyncSelectFields;
      {procedure SyncSelectFieldsWithGroupByFields;}
      procedure SyncSelectTables;
      procedure SyncTableList(aAvailableList, aCurrentList: TList);
      procedure SyncTables;
      procedure UpdateJoinableTables;
      procedure CreateJoinableTableLists;

    protected
      procedure Loaded; override;

      {overriden from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      {used to convert pre-4.12 SQL objects}
      procedure Convert;

      {overridden from relative}
      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      procedure MoveChild(aChild: TdaChild; aCurrentIndex, aNewIndex: Integer);

      function  AddAvailableTable(aAvailableIndex: Integer): TdaTable;
      function  AddParentheses(aSelectedList: TList): Boolean;
      function  AddCriteria(aType: TdaCriteriaType): TdaCriteria;
      function  AddCriteriaField(aTable: TdaTable; const aFieldName: String; aOperator: TdaCriteriaOperatorType; const aValue: String): TdaCriteria;
      function  AddSelectField(aTable: TdaTable; const aFieldName: String): TdaField;
      function  AddGroupByField(aField: TdaField): TdaField;
      function  AddOrderByField(aField: TdaField; Ascending: Boolean): TdaField;
      function  AddTable(const aTableName: String): TdaTable;
      function  AllowManualJoins: Boolean;
      procedure AvailableCalcFieldList(aList: TStrings);
      procedure AvailableCriteriaList(aList: TStrings);
      procedure Clear;
      procedure ClearCalcFields;
      procedure ClearCriteria;
      procedure ClearGroupByFields;
      procedure ClearOrderByFields;
      procedure ClearSelectTables;
      procedure ClearSelectFields;
      function  CreateField(aDataSetField: TppField): TdaField;
      procedure CreateFieldAliasesForTable(aTable: TdaTable; aList: TStrings);
      procedure CreateFieldsForTable(aTable: TdaTable; aList: TStrings);
      procedure CreateJoinObjects(const aTableName1, aTableName2, aJoinType, aFieldNames1, aOperators, aFieldNames2: String);
      procedure daFieldToppField(aSourceField: TdaField; aTargetField: TppField);
      function  DeselectCalcField(aSelectedIndex: Integer): TdaField;
      function  DeselectCriteria(aSelectedIndex: Integer): Boolean;
      function  DeselectField(aSelectedIndex: Integer): TdaField;
      function  DeselectGroupByField(aSelectedIndex: Integer): TdaField;
      function  DeselectOrderByField(aSelectedIndex: Integer): TdaField;
      function  EditTableJoin(const aTable1, aTable2: String): Boolean;
      function  GetFieldForTable(aTable: TdaTable; const aFieldName: String): TdaField;
      function  GetTableForSQLAlias(const aSQLAlias: String): TdaTable;
      function  HasAggregates: Boolean;
      function  IndexOfSelectTableName(const aTableName: String): Integer;
      function  IndexOfTableAlias(const aTableAlias: String): Integer;
      function  IndexOfTableName(const aTableName: String): Integer;
      function  InsertCriteria(aPosition: Integer; aType: TdaCriteriaType): TdaCriteria;
      function  IsAdvantage: Boolean;
      function  IsDBISAM: Boolean;
      function  IsMSSQLServer: Boolean;
      function  IsSybaseASA: Boolean;
      function  IsSybaseASE: Boolean;
      function  IsInterBase: Boolean;
      function  IsMSAccess: Boolean;
      function  IsParadox: Boolean;
      function  IsOracle: Boolean;
      function  IsSQLReservedWord(const aString: String): Boolean;
      procedure MatchJoinFieldsByName(aTable1, aTable2: TdaTable);
      procedure Modification;
      procedure NameToSQLString(var aName: String);
      procedure ppFieldTodaField(aSourceField: TppField; aTargetField: TdaField);
      function  RemoveCriteria(aSelectedIndex: Integer): Boolean;
      function  RemoveParentheses(aSelectedList: TList): Boolean;
      function  RemoveTable(const aTableSQLAlias: String): Boolean;
      procedure ResetCriteriaLevels;
      procedure Resync;
      function  SelectCalcField(aAvailableIndex: Integer): TdaField;
      function  SelectCriteria(aAvailableIndex: Integer): TdaCriteria;
      function  SelectField(aAvailableIndex: Integer): TdaField;
      function  SelectGroupByField(aAvailableIndex: Integer): TdaField;
      function  SelectOrderByField(aAvailableIndex: Integer): TdaField;
      function  SelectTable(aAvailableIndex, aJoinIndex: Integer): TdaTable;
      procedure SetAvailableFieldOrder(aSortMode: Integer);
      procedure SyncGroupByFieldsWithSelectFields;
      procedure SyncOrderByFieldsWithCalcFields;
      function  DeselectTable(aSelectedIndex: Integer): TdaTable;
      function  Valid: Boolean;
      function  ValidateFieldAlias(aField: TdaField; aFixAlias: Boolean): Boolean;

      property AllowSelfJoin: Boolean read FAllowSelfJoin write FAllowSelfJoin default False;
      property AssigningSQLText: Boolean read FAssigningSQLText write FAssigningSQLText;
      property AvailableCalcFields[Index: Integer]: TdaField read GetAvailableCalcField;
      property AvailableCalcFieldCount: Integer read GetAvailableCalcFieldCount;
      property AvailableCriteria[Index: Integer]: TdaField read GetAvailableCriteria;
      property AvailableCriteriaCount: Integer read GetAvailableCriteriaCount;
      property AvailableFields[Index: Integer]: TdaField read GetAvailableField;
      property AvailableFieldCount: Integer read GetAvailableFieldCount;
      property AvailableSelectFields[Index: Integer]: TdaField read GetAvailableSelectField;
      property AvailableSelectFieldCount: Integer read GetAvailableSelectFieldCount;
      property AvailableSelectTables[Index: Integer]: TdaTable read GetAvailableSelectTable;
      property AvailableSelectTableCount: Integer read GetAvailableSelectTableCount;
      property AvailableOrderByFields[Index: Integer]: TdaField read GetAvailableOrderByField;
      property AvailableOrderByFieldCount: Integer read GetAvailableOrderByFieldCount;
      property AvailableGroupByFields[Index: Integer]: TdaField read GetAvailableGroupByField;
      property AvailableGroupByFieldCount: Integer read GetAvailableGroupByFieldCount;
      property AvailableTables[Index: Integer]: TdaTable read GetAvailableTable;
      property AvailableTableCount: Integer read GetAvailableTableCount;
      property CalcFieldCount: Integer read GetCalcFieldCount;
      property CalcFields[Index: Integer]: TdaCalculation read GetCalcField;
      property Criteria[Index: Integer]: TdaCriteria read GetCriteria;
      property CriteriaCount: Integer read GetCriteriaCount;
      property DataDictionary: TppDataDictionary read FDataDictionary write SetDataDictionary;
      property DriverName: String read FDriverName;
      property GroupByFieldCount: Integer read GetGroupByFieldCount;
      property GroupByFields[Index: Integer]: TdaField read GetGroupByField;
      property LanguageIndex: Longint read FLanguageIndex write FLanguageIndex;
      property LineLength: Integer read FLineLength write FLineLength;
      property Modified: Boolean read FModified write FModified;
      property SelectFieldCount: Integer read GetSelectFieldCount;
      property SelectFields[Index: Integer]: TdaField read GetSelectField;
      property SelectTableCount: Integer read GetSelectTableCount;
      property SelectTables[Index: Integer]: TdaTable read GetSelectTable;
      property Session: TdaSession read FSession write SetSession;
      property OrderByFieldCount: Integer read GetOrderByFieldCount;
      property OrderByFields[Index: Integer]: TdaField read GetOrderByField;

      property CalcFieldsOutOfSync: Boolean read FCalcFieldsOutOfSync;
      property CriteriaOutOfSync: Boolean read FCriteriaOutOfSync;
      property FieldsOutOfSync: Boolean read FFieldsOutOfSync;
      property GroupByFieldsOutOfSync: Boolean read FGroupByFieldsOutOfSync;
      property OrderByFieldsOutOfSync: Boolean read FOrderByFieldsOutOfSync;
      property SelectFieldsOutOfSync: Boolean read FSelectFieldsOutOfSync;
      property SelectTablesOutOfSync: Boolean read FSelectTablesOutOfSync;
      property SQLOutOfSync: Boolean read FSQLOutOfSync;
      property TablesOutOfSync: Boolean read FTablesOutOfSync;

    published
      property ChildType;
      property DatabaseName: String read FDatabaseName write FDatabaseName;
      property DatabaseType: TppDatabaseType read FDatabaseType write FDatabaseType default dtOther;
      property DataPipelineName: String read FDataPipelineName write FDataPipelineName;
      property Description: String read FDescription write FDescription;
      property Distinct: Boolean read FDistinct write FDistinct default False;
      property EditSQLAsText: Boolean read FEditSQLAsText write SetEditSQLAsText default False;
      property GroupByFieldsSynced: Boolean read FGroupByFieldsSynced write FGroupByFieldsSynced default False;
      property SQLText: TStrings read GetSQLText write SetSQLText;
      property SQLType: TppSQLType read FSQLType write SetSQLType default sqBDELocal;

    end; {class, TdaSQL}

  { TdaChild }
  TdaChild = class(TppRelative)
    public
      procedure Assign(Source: TPersistent); override;
      function  HasParent: Boolean; override;
      function  Index: Integer;
      function  GetSQL: TdaSQL;

    published
      property ChildType;

  end; {class, TdaChild}

  TdaChildClass = class of TdaChild;
  
  { TdaTable }
  TdaTable = class(TdaChild)
    private
      FJoinTable: String;
      FAlias: String;
      FTableAlias: String;
      FTableJoins: TList;
      FTableName: String;
      FOwnerName: String;
      FSQLAlias: String;
      FJoinable: Boolean;
      FJoinableTableNames: TStrings;
      FJoinType: TdaJoinType;

      function  GetTableJoin(aIndex: Integer): TdaTableJoin;
      function  GetTableJoinCount: Integer;
      function  GetRawTableName: String;
      procedure SetRawTableName(const aTableName: String);

    protected
      {overriden from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Loaded; override;

      procedure AddChild(aChild: TppRelative); override;
      function  AddTableJoin(aTable: TdaTable; const aFieldName1, aFieldName2: String; aType: TdaJoinOperatorType): TdaTableJoin;
      procedure Clear;
      function  DataName: String;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  IndexOfFirstJoinTable(aSQL: TdaSQL): Integer;
      function  JoinOperators: String;
      function  JoinFieldNames2: String;
      function  JoinFieldNames1: String;
      function  JoinTypeString: String;
      function  JoinTableSQLAlias: String;
      function  JoinTypeDesc: String;
      function  RemoveChild(aChild: TppRelative): Integer; override;
      function  SQLJoinTypeDesc: String;
      function  SQLText: String;
      procedure UpdateJoinable(aSelectedTables: TStrings);

      property Joinable: Boolean read FJoinable;
      property JoinableTableNames: TStrings read FJoinableTableNames;
      property RawTableName: String read GetRawTableName write SetRawTableName;
      property TableJoinCount: Integer read GetTableJoinCount;
      property TableJoins[Index: Integer]: TdaTableJoin read GetTableJoin;

    published
      property Alias: String read FAlias write FAlias;
      property OwnerName: String read FOwnerName write FOwnerName;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;
      property SQLAlias: String read FSQLAlias write FSQLAlias;
      property JoinType: TdaJoinType read FJoinType write FJoinType default dajtInner;
      property JoinTable: String read FJoinTable write FJoinTable;

  end; {class, TdaTable}

  { TdaField }
  TdaField = class(TdaChild)
    private
      FAlias: String;
      FAscending: Boolean;
      FAutoSearch: Boolean;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FFieldAlias: String;
      FFieldName: String;
      FMandatory: Boolean;
      FSearchable: Boolean;
      FSelectable: Boolean;
      FSelectAll: Boolean;
      FSortable: Boolean;
      FSQLFieldName: String;
      FTableAlias: String;
      FTableName: String;
      FTableSQLAlias: String;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Clear; virtual;
      function  GetDescription: String; virtual;
      function  SQLString: String; virtual;
      function  OrderByDesc: String;

      property Description: String read GetDescription;

    published
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch default False;
      property Alias: String read FAlias write FAlias;
      property Ascending: Boolean read FAscending write FAscending default True;
      property DataType: TppDataType read FDataType write FDataType default dtString;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write FFieldName;
      property TableName: String read FTableName write FTableName;
      property Mandatory: Boolean read FMandatory write FMandatory default False;
      property Searchable: Boolean read FSearchable write FSearchable default True;
      property Selectable: Boolean read FSelectable write FSelectable default True;
      property SelectAll: Boolean read FSelectAll write FSelectAll default False;
      property Sortable: Boolean read FSortable write FSortable default True;
      property SQLFieldName: String read FSQLFieldName write FSQLFieldName;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableSQLAlias: String read FTableSQLAlias write FTableSQLAlias;

  end; {class, TdaField}

  { TdaCalculation }
  TdaCalculation = class(TdaField)
    private
      FCalcType: TdaCalcType;
      FExpression: String;
      FOnCalcTypeChange: TNotifyEvent;

      function  GetCalcFieldAlias: String;
      procedure SetCalcType(aCalcType: TdaCalcType);

    public
      constructor Create(aOwner: TComponent); override;

      procedure Assign(Source: TPersistent); override;

      procedure Clear; override;
      function  FunctionDesc: String;
      function  GetDescription: String; override;
      function  SQLString: String; override;

      property CalcFieldAlias: String read GetCalcFieldAlias;
      property OnCalcTypeChange: TNotifyEvent read FOnCalcTypeChange write FOnCalcTypeChange;

    published
      property CalcType: TdaCalcType read FCalcType write SetCalcType default dacaUnknown;
      property Expression: String read FExpression write FExpression;

  end; {class, TdaCalculation}

  { TdaTableJoin }
  TdaTableJoin = class(TdaChild)
    private
      FForeignField: TdaField;
      FLocalField: TdaField;
      FOperator: TdaJoinOperatorType;

    protected
      {overriden from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddChild(aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;
      
      property ForeignField: TdaField read FForeignField;
      property LocalField: TdaField read FLocalField;

    published
      property Operator: TdaJoinOperatorType read FOperator write FOperator default dajoEqual;

  end; {class, TdaTableJoin}

  { TdaCriteria }
  TdaCriteria = class(TdaChild)
    private
      FCaseSensitive: Boolean;
      FCriteriaType: TdaCriteriaType;
      FField: TdaField;
      FLevel: Integer;
      FNumericValues: TList;
      FNumericValuesOutOfSync: Boolean;
      FOperator: TdaCriteriaOperatorType;
      FShowAllValues: Boolean;
      FValue: String;

      procedure AddNumericValue(const aValue: String);
      procedure FreeNumericValues;
      function  GetValue: String;
      procedure SetValue(const aValue: String);
      procedure UpdateNumericValues;

    protected
      {overriden from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

      procedure Loaded; override;
      
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddChild(aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      function AutoSearchDesc: String;
      function Description: String;
      function OperatorDesc: String;
      function MandatoryDesc: String;
      function IsNumeric: Boolean;
      function ShowAllDesc: String;

      property Field: TdaField read FField;

    published
      property CaseSensitive: Boolean read FCaseSensitive write FCaseSensitive default True;
      property CriteriaType: TdaCriteriaType read FCriteriaType write FCriteriaType default dacrField;
      property Level: Integer read FLevel write FLevel;
      property Operator: TdaCriteriaOperatorType read FOperator write FOperator default dacoEqual;
      property ShowAllValues: Boolean read FShowAllValues write FShowAllValues default False;
      property Value: String read GetValue write SetValue;

  end; {class, TdaCriteria}

  { TdaNumericValue }
  TdaNumericValue = class(TppRelative)
    private
      FValue: Double;

    published
      property Value: Double read FValue write FValue;
      
  end; {class, TdaNumericValue}

  TdaSQLClass = class of TdaSQL;

  {general procedures}
  function  daDataTypeToString(aDataType: TppDataType): String;
  function  daDaysInMonth(aMonth, aYear: Word): Word;
  function  daContainsInvalidChars(const aFieldName: String): Boolean;
  function  daGetCalcDesc(aCalcType: TdaCalcType): String;
  function  daGetJoinDesc(aType: TdaJoinType): String;
  function  daGetOperatorDesc(aOperator: TdaCriteriaOperatorType): String;
  function  daInsertString(aList: TStrings; aPosition: Integer; const aString: String): Integer;
  function  daInvalidChar(const aName: String): Integer;
  function  daJoinOperatorToString(aType: TdaJoinOperatorType): String;
  function  daJoinTypeToString(const aJoinType: TdaJoinType): String;
  function  daNextDay(aDateTime : TDateTime) : TDateTime;
  function  daPreviousDay(aDateTime : TDateTime) : TDateTime;
  function  daReplicate(Count: Integer; S: String): String;
  function  daStringToJoinOperator(const aOperator: String): TdaJoinOperatorType;
  function  daStringToJoinType(const aJoinType: String): TdaJoinType;
  procedure daWeekStartEnd(aCurrentDateTime: TDateTime; var aStartDateTime, aEndDateTime : TDateTime);

  procedure daAssignChildren(aList: TList; aOwner: TComponent; aParent: TppRelative);
  procedure daCopyList(aSourceList, aTargetList: TList; aCopyFilter: TdaCopyFilterType);
  function  daFindField(aField: TdaField; aList: TList): Integer;
  function  daFindFieldForName(const aTableName, aFieldName: String; aList: TList): Integer;
  function  daFindFieldInStrings(aField: TdaField; aList: TStrings): Integer;
  function  daFindTable(aTable: TdaTable; aList: TList): Integer;
  procedure daFreeChildren(aList: TList);
  procedure daFreeChildrenInStrings(aList: TStrings);
  function  daRestoreAvailableField(aField: TdaField; aAvailableFields, aAvailableFieldList: TList): TdaField;
  function  daRestoreAvailableTable(aTable: TdaTable; aAvailableTables, aAvailableTableList: TList): TdaTable;

const
  dacaNumerics = [dtInteger, dtLongint, dtSingle, dtDouble, dtExtended, dtCurrency];
  dacaBLOBs = [dtBLOB, dtGraphic];

implementation

uses
  daJonDlg;

{******************************************************************************
 *
 ** S Q L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.Create }
                                                                                                                       
constructor TdaSQL.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAllowSelfJoin := False;
  FAssigning := False;
  FAssigningSQLText := False;
  FAvailableCriteriaFields := TList.Create;
  FAvailableTables := TList.Create;
  FAvailableSelectTables := TList.Create;
  FAvailableSelectFields := TList.Create;
  FAvailableOrderByFields := TList.Create;
  FAvailableGroupByFields := TList.Create;
  FAvailableFields := TList.Create;
  FCalcFields := TList.Create;
  FCalcFieldsOutOfSync := True;
  FCriteria := TList.Create;
  FCriteriaOutOfSync := True;
  FDataBaseName := '';
  FDataDictionary := nil;
  FDataPipelineName := '';
  FDatabaseType := dtOther;
  FDataSetClass := nil;
  FDescription := '';
  FDistinct := False;
  FEditSQLAsText := False;
  FFieldsOutOfSync := True;
  FFieldSortMode := 1;
  FGroupByFields := TList.Create;
  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := False;
  FLineLength := 50;
  FModified := False;
  FOrderByFields := TList.Create;
  FOrderByFieldsOutOfSync := True;
  FSQLOutOfSync := True;
  FSQLText := TStringList.Create;
  FSQLType := sqBDELocal;
  FSavedAvailableFields := TList.Create;
  FSelectFields := TList.Create;
  FSelectFieldsOutOfSync := True;
  FSelectTables := TList.Create;
  FSelectTablesOutOfSync := True;
  FSession := nil;
  FSyncingGroups := False;
  FTablesOutOfSync := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSQL.Destroy }

destructor TdaSQL.Destroy;
begin

  Clear;

  FAvailableTables.Free;
  FAvailableFields.Free;
  FAvailableSelectFields.Free;
  FAvailableSelectTables.Free;
  FAvailableCriteriaFields.Free;
  FAvailableOrderByFields.Free;
  FAvailableGroupByFields.Free;
  FCalcFields.Free;
  FCriteria.Free;
  FSavedAvailableFields.Free;
  FSelectFields.Free;
  FSelectTables.Free;
  FGroupByFields.Free;
  FOrderByFields.Free;
  FSQLText.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaSQL.Loaded }

procedure TdaSQL.Loaded;
begin

  inherited Loaded;

  FModified := False;

  FSQLOutOfSync := False;
  FTablesOutOfSync := False;
  FFieldsOutOfSync := False;
  FCalcFieldsOutOfSync := False;
  FCriteriaOutOfSync := False;
  FSelectFieldsOutOfSync := False;
  FGroupByFieldsOutOfSync := False;
  FOrderByFieldsOutOfSync := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaSQL.Resync }

procedure TdaSQL.Resync;
begin

  FSQLOutOfSync := True;
  FTablesOutOfSync := True;
  FFieldsOutOfSync := True;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;

end; {procedure, Resync}

{------------------------------------------------------------------------------}
{ TdaSQL.Convert }

procedure TdaSQL.Convert;
var
  lDatabaseType: TppDatabaseType;
begin

  if (FSession = nil) or (FDatabaseType <> dtOther) then Exit;

  lDatabaseType := FSession.GetDatabaseType(FDatabaseName);

  if (lDatabaseType <> FDatabaseType) then
    begin
      FDatabaseType := lDatabaseType;

      FModified := True;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TdaSQL.Notify }

procedure TdaSQL.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FDataDictionary) then
    FDataDictionary := nil

  else if (aCommunicator = FSession) then
    FSession := nil

  else if (aCommunicator is TppRelative) and (IndexOfChild(TppRelative(aCommunicator)) <> -1) then
    begin
      if (aCommunicator is TdaTable) then
        FreeRelatedFields(TdaTable(aCommunicator));
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaSQL.Assign }

procedure TdaSQL.Assign(Source: TPersistent);
var
  lSQL: TdaSQL;
begin

  if not(Source is TdaSQL) then Exit;

  FAssigning := True;

  {free all child objects}
  Clear;

  lSQL := TdaSQL(Source);

  FAllowSelfJoin := lSQL.AllowSelfJoin;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FDatabaseName := lSQL.FDatabaseName;
  FDatabaseType := lSQL.FDatabaseType;
  SetDataDictionary(lSQL.DataDictionary);
  FDataPipelineName := lSQL.DataPipelineName;
  FDataSetClass := lSQL.FDataSetClass;
  FDescription := lSQL.FDescription;
  FDistinct := lSQL.FDistinct;
  FEditSQLAsText := lSQL.FEditSQLAsText;
  FFieldsOutOfSync := True;
  FFieldSortMode := lSQL.FFieldSortMode;
  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := lSQL.FGroupByFieldsSynced;
  FLineLength := lSQL.FLineLength;
  FModified := lSQL.FModified;
  FOrderByFieldsOutOfSync := True;
  FSQLOutOfSync := True;
  FSQLText.Assign(lSQL.FSQLText);
  FSQLType := lSQL.FSQLType;
  FSelectFieldsOutOfSync := True;
  FSelectTablesOutOfSync := True;
  SetSession(lSQL.FSession);
  FTablesOutOfSync := True;

  daAssignChildren(lSQL.FCalcFields, Self, Self);
  daAssignChildren(lSQL.FCriteria, Self, Self);
  daAssignChildren(lSQL.FSelectFields, Self, Self);
  daAssignChildren(lSQL.FGroupByFields, Self, Self);
  daAssignChildren(lSQL.FOrderByFields, Self, Self);
  daAssignChildren(lSQL.FSelectTables, Self, Self);

  FAssigning := False;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaSQL.Modification }

procedure TdaSQL.Modification;
begin

  if (csReading in ComponentState) or (csWriting in ComponentState) or
     (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  if (FAssigning) then Exit;

  FModified := True;
  
  FSQLOutOfSync := True;

end; {procedure, Modification}

{------------------------------------------------------------------------------}
{ TdaSQL.SaveComponents }

procedure TdaSQL.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  for liIndex := 0 to (FCalcFields.Count - 1) do
    Proc(FCalcFields[liIndex]);

  for liIndex := 0 to (FCriteria.Count - 1) do
    Proc(FCriteria[liIndex]);

  for liIndex := 0 to (FSelectFields.Count - 1) do
    Proc(FSelectFields[liIndex]);

  for liIndex := 0 to (FGroupByFields.Count - 1) do
    Proc(FGroupByFields[liIndex]);

  for liIndex := 0 to (FOrderByFields.Count - 1) do
    Proc(FOrderByFields[liIndex]);

  for liIndex := 0 to (FSelectTables.Count - 1) do
    Proc(FSelectTables[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaSQL.FreeRelatedFields }

procedure TdaSQL.FreeRelatedFields(aTable: TdaTable);
begin

  FreeMatchingFields(aTable, FCalcFields, FCalcFieldsOutOfSync);
  FreeMatchingFields(aTable, FCriteria, FCriteriaOutOfSync);
  FreeMatchingFields(aTable, FSelectFields, FSelectFieldsOutOfSync);
  FreeMatchingFields(aTable, FGroupByFields, FGroupByFieldsOutOfSync);
  FreeMatchingFields(aTable, FOrderByFields, FOrderByFieldsOutOfSync);

end; {procedure, FreeRelatedFields}

{------------------------------------------------------------------------------}
{ TdaSQL.FreeMatchingFields }

procedure TdaSQL.FreeMatchingFields(aTable: TdaTable; aList: TList; var aOutOfSync: Boolean);
var
  lObject: TObject;
  lField: TdaField;
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    begin

      lObject := aList[liIndex];

      if (lObject is TdaField) then
        lField := TdaField(lObject)

      else if (lObject is TdaCriteria) then
        lField := TdaCriteria(lObject).Field

      else
        lField :=  nil;

      if (lField <> nil) and (CompareText(lField.TableSQLAlias, aTable.SQLAlias) = 0) then
        begin
          lObject.Free;

          aOutOfSync := True;
        end;

    end;

end; {procedure, FreeMatchingFields}

{------------------------------------------------------------------------------}
{ TdaSQL.IsAdvantage }

function TdaSQL.IsAdvantage: Boolean;
begin
  Result := (FDatabaseType = dtAdvantage);
end; {function, IsAdvantage}

{------------------------------------------------------------------------------}
{ TdaSQL.IsDBISAM }

function TdaSQL.IsDBISAM: Boolean;
begin
  Result := (FDatabaseType = dtDBISAM);
end; {function, IsDBISAM}

{------------------------------------------------------------------------------}
{ TdaSQL.IsMSSQLServer }

function TdaSQL.IsMSSQLServer: Boolean;
begin
  Result := (FDatabaseType = dtMSSQLServer);
end; {function, IsMSSQLServer}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSybaseASA }

function TdaSQL.IsSybaseASA: Boolean;
begin
  Result := (FDatabaseType = dtSybaseASA);
end; {function, IsSybaseASA}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSybaseASE }

function TdaSQL.IsSybaseASE: Boolean;
begin
  Result := (FDatabaseType = dtSybaseASE);
end; {function, IsSybaseASE}

{------------------------------------------------------------------------------}
{ TdaSQL.IsInterBase }

function TdaSQL.IsInterBase: Boolean;
begin
  Result := (FDatabaseType = dtInterBase);
end; {function, IsInterBase}

{------------------------------------------------------------------------------}
{ TdaSQL.IsMSAccess }

function TdaSQL.IsMSAccess: Boolean;
begin
  Result := (FDatabaseType = dtMSAccess);
end; {function, IsMSAccess}

{------------------------------------------------------------------------------}
{ TdaSQL.IsParadox }

function TdaSQL.IsParadox: Boolean;
begin
  Result := (FDatabaseType = dtParadox);
end; {function, IsParadox}

{------------------------------------------------------------------------------}
{ TdaSQL.IsOracle }

function TdaSQL.IsOracle: Boolean;
begin
  Result := (FDatabaseType = dtOracle);
end; {function, IsOracle}

{------------------------------------------------------------------------------}
{ TdaSQL.GetTableForSQLAlias }

function TdaSQL.GetTableForSQLAlias(const aSQLAlias: String): TdaTable;
var
  liIndex: Integer;
  lbFound: Boolean;
begin

  liIndex := 0;
  lbFound := False;

  while not(lbFound) and (liIndex < FSelectTables.Count) do
    begin
      if (CompareText(aSQLAlias, SelectTables[liIndex].SQLAlias) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if (lbFound) then
    Result := SelectTables[liIndex]
  else
    Result := nil;

end; {procedure, GetTableForSQLAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.SetEditSQLAsText }

procedure TdaSQL.SetEditSQLAsText(Value: Boolean);
var
  lSQL: TStrings;
begin

  FEditSQLAsText := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FEditSQLAsText) then
    begin
      lSQL := TStringList.Create;

      lSQL.Assign(FSQLText);

      Clear;

      FSQLText.Assign(lSQL);

      lSQL.Free;
    end;

end; {procedure, SetEditSQLAsText}

{------------------------------------------------------------------------------}
{ TdaSQL.Clear }

procedure TdaSQL.Clear;
begin

  FSQLText.Clear;

  {these clear calls are in optimized order}
  ClearSelectTables;
  ClearSelectFields;
  ClearGroupByFields;
  ClearOrderByFields;
  ClearCalcFields;
  ClearCriteria;

  {the other available lists need not be freed, since they contain references
   to the fields in the available fields list}
  FSavedAvailableFields.Clear;
  FAvailableSelectFields.Clear;
  FAvailableOrderByFields.Clear;
  FAvailableGroupByFields.Clear;
  FAvailableCriteriaFields.Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaSQL.AvailableFieldsOutOfSync }

procedure TdaSQL.AvailableFieldsOutOfSync;
begin

  FFieldsOutOfSync := True;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;

end; {procedure, AvailableFieldsOutOfSync}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearSelectTables }

procedure TdaSQL.ClearSelectTables;
begin

  daFreeChildren(FAvailableTables);
  daFreeChildren(FAvailableFields);

  daFreeChildren(FSelectTables);

  FTablesOutOfSync := True;
  FSelectTablesOutOfSync := True;

  AvailableFieldsOutOfSync;

end; {procedure, ClearSelectTables}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearSelectFields }

procedure TdaSQL.ClearSelectFields;
begin
  daFreeChildren(FSelectFields);

  FSelectFieldsOutOfSync := True;
end; {procedure, ClearSelectFields}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearGroupByFields }

procedure TdaSQL.ClearGroupByFields;
begin
  daFreeChildren(FGroupByFields);

  FGroupByFieldsSynced := False;
  FGroupByFieldsOutOfSync := True;
end; {procedure, ClearGroupByFields}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearCalcFields }

procedure TdaSQL.ClearCalcFields;
begin
  daFreeChildren(FCalcFields);
end; {procedure, ClearCalcFields}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearCriteria }

procedure TdaSQL.ClearCriteria;
begin
  daFreeChildren(FCriteria);
end; {procedure, ClearCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearOrderByFields }

procedure TdaSQL.ClearOrderByFields;
begin
  daFreeChildren(FOrderByFields);

  FOrderByFieldsOutOfSync := True;
end; {procedure, ClearOrderByFields}

{------------------------------------------------------------------------------}
{ TdaSQL.AddChild }

procedure TdaSQL.AddChild(aChild: TppRelative);
begin

  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Add(aChild);
     dactSelectField:  FSelectFields.Add(aChild);
     dactOrderByField: FOrderByFields.Add(aChild);
     dactCriteria:     FCriteria.Add(aChild);
     dactCalcField:    FCalcFields.Add(aChild);
     dactGroupByField: FGroupByFields.Add(aChild);
     else
       inherited AddChild(aChild);
  end;

  Modification;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaSQL.MoveChild }

procedure TdaSQL.MoveChild(aChild: TdaChild; aCurrentIndex, aNewIndex: Integer);
begin

  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Move(aCurrentIndex, aNewIndex);
     dactSelectField:  FSelectFields.Move(aCurrentIndex, aNewIndex);
     dactOrderByField: FOrderByFields.Move(aCurrentIndex, aNewIndex);
     dactCriteria:     FCriteria.Move(aCurrentIndex, aNewIndex);
     dactCalcField:    FCalcFields.Move(aCurrentIndex, aNewIndex);
     dactGroupByField: FGroupByFields.Move(aCurrentIndex, aNewIndex);
  end;

  Modification;

end; {procedure, MoveChild}

{------------------------------------------------------------------------------}
{ TdaSQL.InsertChild }

procedure TdaSQL.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Insert(aPosition, aChild);
     dactSelectField:  FSelectFields.Insert(aPosition, aChild);
     dactOrderByField: FOrderByFields.Insert(aPosition, aChild);
     dactCriteria:     FCriteria.Insert(aPosition, aChild);
     dactCalcField:    FCalcFields.Insert(aPosition, aChild);
     dactGroupByField: FGroupByFields.Insert(aPosition, aChild);
     else
       inherited InsertChild(aPosition, aChild);
  end;

  Modification;

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfChild }

function TdaSQL.IndexOfChild(aChild: TppRelative): Integer;
begin

  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  Result := FSelectTables.IndexOf(aChild);
     dactSelectField:  Result := FSelectFields.IndexOf(aChild);
     dactOrderByField: Result := FOrderByFields.IndexOf(aChild);
     dactCriteria:     Result := FCriteria.IndexOf(aChild);
     dactCalcField:    Result := FCalcFields.IndexOf(aChild);
     dactGroupByField: Result := FGroupByFields.IndexOf(aChild);
     else
       Result := inherited IndexOfChild(aChild);
  end;

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveChild }

function TdaSQL.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Delete(liIndex);
     dactSelectField:  FSelectFields.Delete(liIndex);
     dactOrderByField: FOrderByFields.Delete(liIndex);
     dactCriteria:     FCriteria.Delete(liIndex);
     dactCalcField:    FCalcFields.Delete(liIndex);
     dactGroupByField: FGroupByFields.Delete(liIndex);
     else
       Result := inherited RemoveChild(aChild);
  end;

  Modification;

  if (SelectTableCount = 0) then
    FModified := False;

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaSQL.SetDataDictionary }

procedure TdaSQL.SetDataDictionary(aDataDictionary: TppDataDictionary);
begin

  if (FDataDictionary <> nil) then
    FDataDictionary.RemoveNotify(Self);

  FDataDictionary := aDataDictionary;

  if (FDataDictionary <> nil) then
    FDataDictionary.AddNotify(Self);

  Modification;

end; {procedure, SetDataDictionary}

{------------------------------------------------------------------------------}
{ TdaSQL.SetSession }

procedure TdaSQL.SetSession(aSession: TdaSession);
begin


  if (FSession <> nil) then
    FSession.RemoveNotify(Self);

  FSession := aSession;

  if (FSession <> nil) then
    begin
      FSession.AddNotify(Self);
      FDataSetClass := FSession.DataSetClass;
    end
  else
    FDataSetClass := nil;

  Modification;

end; {procedure, SetSession}

{------------------------------------------------------------------------------}
{ TdaSQL.GetSQLText }

function TdaSQL.GetSQLText: TStrings;
begin

  Result := FSQLText;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FSQLOutOfSync) then
    if FEditSQLAsText then
      CreateFieldsFromSQL
    else
      CreateSQL;

  Result := FSQLText;

end; {function, GetSQLText}

{------------------------------------------------------------------------------}
{ TdaSQL.SetSQLText }

procedure TdaSQL.SetSQLText(aSQLText: TStrings);
begin

  FSQLText.Assign(aSQLText);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FEditSQLAsText := True;

  Clear;

  FSQLText.Assign(aSQLText);

  if (FAssigningSQLText) then Exit;

  FSQLText.Assign(aSQLText);

  CreateFieldsFromSQL;

  FSQLOutOfSync := False;

  Modification;

end; {function, SetSQLText}

{------------------------------------------------------------------------------}
{ TdaSQL.SetSQLType }

procedure TdaSQL.SetSQLType(aSQLType: TppSQLType);
begin

  FSQLType := aSQLType;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  Modification;

end; {procedure, SetSQLType}

{******************************************************************************
 *
 ** S Q L   -   A R R A Y   P R O P E R T I E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.GetCriteria }

function TdaSQL.GetCriteria(aIndex: Integer): TdaCriteria;
begin
  Result := TdaCriteria(FCriteria[aIndex]);
end; {function, GetCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.GetCriteriaCount }

function TdaSQL.GetCriteriaCount: Integer;
begin
  Result := FCriteria.Count;
end; {function, GetCriteriaCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCriteria }

function TdaSQL.GetAvailableCriteria(aIndex: Integer): TdaField;
begin

  SyncCriteria;

  Result := TdaField(FAvailableCriteriaFields[aIndex]);

end; {function, GetAvailableCriteria

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCriteriaCount }

function TdaSQL.GetAvailableCriteriaCount: Integer;
begin

  SyncCriteria;

  Result := FAvailableCriteriaFields.Count;

end; {function, GetAvailableCriteriaCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectTable }

function TdaSQL.GetAvailableSelectTable(aIndex: Integer): TdaTable;
begin

  SyncSelectTables;

  Result := TdaTable(FAvailableSelectTables[aIndex]);

end; {function, GetAvailableSelectTable}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectTableCount }

function TdaSQL.GetAvailableSelectTableCount: Integer;
begin

  SyncSelectTables;

  Result := FAvailableSelectTables.Count;

end; {function, GetAvailableSelectTableCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectTable }

function TdaSQL.GetSelectTable(aIndex: Integer): TdaTable;
begin
  Result := TdaTable(FSelectTables[aIndex]);
end; {function, GetSelectTable}

{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectTableCount }

function TdaSQL.GetSelectTableCount: Integer;
begin
  Result := FSelectTables.Count;
end; {function, GetSelectTableCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableTable }

function TdaSQL.GetAvailableTable(aIndex: Integer): TdaTable;
begin

  SyncTables;

  Result := TdaTable(FAvailableTables[aIndex]);

end; {function, GetAvailableTable}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableTableCount }

function TdaSQL.GetAvailableTableCount: Integer;
begin

  SyncTables;

  Result := FAvailableTables.Count

end; {function, GetAvailableTableCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableField }

function TdaSQL.GetAvailableField(aIndex: Integer): TdaField;
begin

  SyncFields;

  Result := TdaField(FAvailableFields[aIndex]);

end; {function, GetAvailableField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableFieldCount }

function TdaSQL.GetAvailableFieldCount: Integer;
begin

  SyncFields;

  Result := FAvailableFields.Count

end; {function, GetAvailableFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectField }

function TdaSQL.GetSelectField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FSelectFields[aIndex]);
end; {function, GetSelectField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectFieldCount }

function TdaSQL.GetSelectFieldCount: Integer;
begin
  Result := FSelectFields.Count;
end; {function, GetSelectFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectField }

function TdaSQL.GetAvailableSelectField(aIndex: Integer): TdaField;
begin

  SyncSelectFields;

  Result := TdaField(FAvailableSelectFields[aIndex]);

end; {function, GetAvailableSelectField

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectFieldCount }

function TdaSQL.GetAvailableSelectFieldCount: Integer;
begin

  SyncSelectFields;

  Result := FAvailableSelectFields.Count;

end; {function, GetAvailableSelectFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetCalcField }

function TdaSQL.GetCalcField(aIndex: Integer): TdaCalculation;
begin
  Result := TdaCalculation(FCalcFields[aIndex]);
end; {function, GetCalcField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetCalcFieldCount }

function TdaSQL.GetCalcFieldCount: Integer;
begin
  Result := FCalcFields.Count;
end; {function, GetCalcFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.AvailableCalcFieldList }

procedure TdaSQL.AvailableCalcFieldList(aList: TStrings);
var
  liIndex: Integer;
  lField: TdaField;
begin

  aList.Clear;

  for liIndex := 0 to AvailableCalcFieldCount - 1 do
    begin
      lField := AvailableCalcFields[liIndex];

      lField.Tag := liIndex;

      if lField.DataType in dacaNumerics then
        aList.AddObject(lField.Description, lField);
    end;

end; {function, AvailableCalcFieldList}

{------------------------------------------------------------------------------}
{ TdaSQL.AvailableCriteriaList }

procedure TdaSQL.AvailableCriteriaList(aList: TStrings);
var
  liIndex: Integer;
  lField: TdaField;
begin

  aList.Clear;

  for liIndex := 0 to AvailableCriteriaCount - 1 do
    begin
      lField := AvailableCriteria[liIndex];

      lField.Tag := liIndex;

      if not(lField.DataType in dacaBLOBs) then
        aList.AddObject(lField.Description, lField);
    end;

end; {function, AvailableCriteriaList}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCalcField }

function TdaSQL.GetAvailableCalcField(aIndex: Integer): TdaField;
begin

  SyncCalcFields;

  Result := TdaField(FAvailableFields[aIndex]);

end; {function, GetAvailableCalcField

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCalcFieldCount }

function TdaSQL.GetAvailableCalcFieldCount: Integer;
begin

  SyncCalcFields;

  Result := FAvailableFields.Count;

end; {function, GetAvailableCalcFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetOrderByField }

function TdaSQL.GetOrderByField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FOrderByFields[aIndex]);
end; {function, GetOrderByField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetOrderByFieldCount }

function TdaSQL.GetOrderByFieldCount: Integer;
begin
  Result := FOrderByFields.Count;
end; {function, GetOrderByFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableOrderByField }

function TdaSQL.GetAvailableOrderByField(aIndex: Integer): TdaField;
begin

  SyncOrderByFields;

  Result := TdaField(FAvailableOrderByFields[aIndex]);

end; {function, GetAvailableOrderByField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableOrderByFieldCount }

function TdaSQL.GetAvailableOrderByFieldCount: Integer;
begin

  SyncOrderByFields;

  Result := FAvailableOrderByFields.Count;

end; {function, GetAvailableOrderByFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetGroupByField }

function TdaSQL.GetGroupByField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FGroupByFields[aIndex]);
end; {function, GetGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetGroupByFieldCount }

function TdaSQL.GetGroupByFieldCount: Integer;
begin
  Result := FGroupByFields.Count;
end; {function, GetGroupByFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableGroupByField }

function TdaSQL.GetAvailableGroupByField(aIndex: Integer): TdaField;
begin

  SyncGroupByFields;

  Result := TdaField(FAvailableGroupByFields[aIndex]);

end; {function, GetAvailableGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableGroupByFieldCount }

function TdaSQL.GetAvailableGroupByFieldCount: Integer;
begin

  SyncGroupByFields;

  Result := FAvailableGroupByFields.Count;

end; {function, GetAvailableGroupByFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncTables }

procedure TdaSQL.SyncTables;
begin

  if not(FTablesOutOfSync) then Exit;

  CreateAvailableTableList;

  FTablesOutOfSync := False;

end; {procedure, SyncTables}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncFields }

procedure TdaSQL.SyncFields;
begin

  if not(FFieldsOutOfSync) then Exit;

  CreateAvailableFieldList;

  FFieldsOutOfSync := False;

end; {procedure, SyncFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncSelectTables }

procedure TdaSQL.SyncSelectTables;
begin

  SyncTables;

  if not(FSelectTablesOutOfSync) then Exit;

  FAvailableSelectTables.Clear;

  daCopyList(FAvailableTables, FAvailableSelectTables, daftAll);

  SyncTableList(FAvailableSelectTables, FSelectTables);

  FSelectTablesOutOfSync := False;

end; {procedure, SyncSelectTables}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncSelectFields }

procedure TdaSQL.SyncSelectFields;
begin

  SyncFields;

  if not(FSelectFieldsOutOfSync) then Exit;

  FAvailableSelectFields.Clear;

  daCopyList(FAvailableFields, FAvailableSelectFields, daftSelectable);

  SyncFieldList(FAvailableSelectFields, FSelectFields);

  FSelectFieldsOutOfSync := False;

end; {procedure, SyncSelectFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncCalcFields }

procedure TdaSQL.SyncCalcFields;
begin

  SyncFields;

  if not(FCalcFieldsOutOfSync) then Exit;

  FCalcFieldsOutOfSync := False;

end; {procedure, SyncCalcFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncCriteria }

procedure TdaSQL.SyncCriteria;
begin

  SyncFields;

  if not(FCriteriaOutOfSync) then Exit;

  FCriteriaOutOfSync := False;

  FAvailableCriteriaFields.Clear;

  daCopyList(FAvailableFields, FAvailableCriteriaFields, daftSearchable);

end; {procedure, SyncCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncGroupByFields }

procedure TdaSQL.SyncGroupByFields;
begin

  SyncFields;

  if not(FGroupByFieldsOutOfSync) then Exit;

  FAvailableGroupByFields.Clear;

  daCopyList(FAvailableFields, FAvailableGroupByFields, daftSelectable);

  SyncFieldList(FAvailableGroupByFields, FGroupByFields);

  FGroupByFieldsOutOfSync := False;

end; {procedure, SyncGroupByFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncOrderByFields }

procedure TdaSQL.SyncOrderByFields;
begin

  SyncFields;

  if not(FOrderByFieldsOutOfSync) then Exit;

  FAvailableOrderByFields.Clear;

  daCopyList(FAvailableFields, FAvailableOrderByFields, daftSortable);

  {Advantage cannot sort on calculated fields}
  if not(IsAdvantage) then
    daCopyList(FCalcFields, FAvailableOrderByFields, daftAll);

  SyncFieldList(FAvailableOrderByFields, FOrderByFields);

  FOrderByFieldsOutOfSync := False;

end; {procedure, SyncOrderByFields}

{******************************************************************************
 *
 ** S Q L   -   V I S U A L   E D I T O R   I N T E R F A C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectTable }

function TdaSQL.SelectTable(aAvailableIndex, aJoinIndex: Integer): TdaTable;
var
  lAvailableTable: TdaTable;
  lNewTable: TdaTable;
  lTable1: TdaTable;
begin

  {get selected table}
  lAvailableTable := AvailableSelectTables[aAvailableIndex];

  if not(FAllowSelfJoin) then
    FAvailableSelectTables.Delete(aAvailableIndex);

  lNewTable := TdaTable.Create(Self);
  lNewTable.Assign(lAvailableTable);

  lNewTable.JoinType := dajtNone;
  lNewTable.Alias := CreateAlias(lAvailableTable.TableName);
  lNewTable.TableAlias := CreateTableAlias(lAvailableTable);
  lNewTable.SQLAlias := CreateTableSQLAlias(lAvailableTable);
  lNewTable.ChildType := Ord(dactSelectTable);
  lNewTable.Parent := Self;

  if (SelectTableCount > 1) then
    begin
      {get first table}
      if (aJoinIndex <> -1) then
        lTable1 := SelectTables[aJoinIndex]
      else
        lTable1 := nil;

      if (lTable1 <> nil) then
        begin
          CreateJoin(lTable1, lNewTable);

          if (lNewTable.TableJoinCount = 0) then
            begin
              lNewTable.Free;
              lNewTable := nil;
              
              if not(FAllowSelfJoin) then
                FAvailableSelectTables.Insert(aAvailableIndex, lAvailableTable);
            end;
        end;

    end;

  Result := lNewTable;

  if (Result <> nil) then
    begin
      AvailableFieldsOutOfSync;

      UpdateJoinableTables;
    end;

  if (Result <> nil) and (FDescription = '') then
    begin
      FDescription := lNewTable.TableAlias;
      FDataPipelineName := 'pl' + ppTextToIdentifier(FDescription);
    end;

end; {procedure, SelectTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoin }

procedure TdaSQL.CreateJoin(aTable1, aTable2: TdaTable);
var
  lbShowDialog: Boolean;
begin

  if (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) then
    begin
      lbShowDialog := False;

      MatchJoinFieldsViaDictionary(aTable1, aTable2);

      if (aTable2.TableJoinCount = 0) and (FDataDictionary.AllowManualJoins) then
        begin
          MatchJoinFieldsByName(aTable1, aTable2);

          lbShowDialog := True;
        end;
    end
  else
    begin
      MatchJoinFieldsByName(aTable1, aTable2);

      lbShowDialog := True;
    end;

  if lbShowDialog then
    EditTableJoin(aTable1.SQLAlias, aTable2.SQLAlias);

end; {procedure, CreateJoin}

{------------------------------------------------------------------------------}
{ TdaSQL.MatchJoinFieldsViaDictionary }

procedure TdaSQL.MatchJoinFieldsViaDictionary(aTable1, aTable2: TdaTable);
var
  liIndex: Integer;
  lsJoinType: String;
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lOperators: TStrings;
  lsFieldName1: String;
  lsFieldName2: String;
  lOperator: TdaJoinOperatorType;
begin

  lFieldNames1 := TStringList.Create;
  lFieldNames2 := TStringList.Create;
  lOperators := TStringList.Create;
  lsJoinType := '';

  if FDataDictionary.GetJoinData(aTable1.RawTableName, aTable2.RawTableName, lsJoinType, lFieldNames1, lFieldNames2, lOperators) then
    begin
      aTable2.JoinType := TdaJoinType(ppGetEnumStringAsInteger(TypeInfo(TdaJoinType), lsJoinType));

      for liIndex := 0 to lFieldNames1.Count - 1 do
        begin
          lsFieldName1 := lFieldNames1[liIndex];
          lsFieldName2 := lFieldNames2[liIndex];
          lOperator := daStringToJoinOperator(lOperators[liIndex]);

          aTable2.AddTableJoin(aTable1, lsFieldName1, lsFieldName2, lOperator);
        end;
    end;

  lFieldNames1.Free;
  lFieldNames2.Free;
  lOperators.Free;

end; {procedure, MatchJoinFieldsViaDictionary}

{------------------------------------------------------------------------------}
{ TdaSQL.MatchJoinFieldsByName }

procedure TdaSQL.MatchJoinFieldsByName(aTable1, aTable2: TdaTable);
var
  liIndex: Integer;
  liPosition: Integer;
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lsFieldName1: String;
  lsFieldName2: String;
begin

  if (aTable1 = nil) or (aTable2 = nil) then Exit;
  
  {default join type}
  aTable2.JoinType := dajtInner;

  lFieldNames1 := TStringList.Create;
  lFieldNames2 := TStringList.Create;

  CreateFieldsForTable(aTable1, lFieldNames1);
  CreateFieldsForTable(aTable2, lFieldNames2);

  liIndex := 0;

  {locate field in join fields, with same name as field in fields}
  while (liIndex < lFieldNames1.Count) do
    begin
      liPosition := lFieldNames2.IndexOf(lFieldNames1[liIndex]);

      if (liPosition <> -1) then
        begin
          lsFieldName1 := lFieldNames1[liIndex];
          lsFieldName2 := lFieldNames2[liPosition];

          aTable2.AddTableJoin(aTable1, lsFieldName1, lsFieldName2, dajoEqual);
        end;

      Inc(liIndex);
    end;

  for liIndex := 0 to lFieldNames1.Count - 1 do
    TdaField(lFieldNames1.Objects[liIndex]).Free;

  for liIndex := 0 to lFieldNames2.Count - 1 do
    TdaField(lFieldNames2.Objects[liIndex]).Free;

  lFieldNames1.Free;
  lFieldNames2.Free;

end; {procedure, MatchJoinFieldsByName}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectTable }

function TdaSQL.DeselectTable(aSelectedIndex: Integer): TdaTable;
var
  lTable: TdaTable;
  liPosition: Integer;
begin

  Result := nil;

  lTable := SelectTables[aSelectedIndex];

  if (aSelectedIndex = 0) and (FDescription = lTable.Alias) then
    begin
      FDescription := '';
      FDataPipelineName := '';
    end;


  if not(AllowSelfJoin) then
    Result := daRestoreAvailableTable(lTable, FAvailableTables, FAvailableSelectTables)
  else
    begin
      liPosition := daFindTable(lTable, FAvailableTables);

      if (liPosition <> -1) then
        Result := TdaTable(FAvailableTables[liPosition])
    end;

  if FreeTable(lTable) then
    FSelectTablesOutOfSync := True;

  AvailableFieldsOutOfSync;

  UpdateJoinableTables;

end; {procedure, DeselectTable}

{------------------------------------------------------------------------------}
{ TdaSQL.AddAvailableTable }

function TdaSQL.AddAvailableTable(aAvailableIndex: Integer): TdaTable;
var
  lAvailableTable: TdaTable;
  lTable: TdaTable;
begin

  {this function can be used for manually building tables, callers
   must take full responsibility for creating valid join conditions
   between the tables}

  lAvailableTable := AvailableSelectTables[aAvailableIndex];

  lTable := TdaTable.Create(Self);
  lTable.Assign(lAvailableTable);

  lTable.Alias := CreateAlias(lTable.TableName);
  lTable.TableAlias := CreateTableAlias(lTable);
  lTable.SQLAlias := CreateTableSQLAlias(lTable);

  if (SelectTableCount = 0) then
    lTable.JoinType := dajtNone
  else
    lTable.JoinType := dajtInner;

  lTable.ChildType := Ord(dactSelectTable);
  lTable.Parent := Self;

  Result := lTable;

end; {function, AddAvailableTable}

{------------------------------------------------------------------------------}
{ TdaSQL.AddTable }

function TdaSQL.AddTable(const aTableName: String): TdaTable;
var
  lTable: TdaTable;
begin

  {this function can be used for manually building tables, callers
   must take full responsibility for creating valid join conditions
   between the tables}
  lTable := TdaTable.Create(Self);
  lTable.TableName := aTableName;
  lTable.Alias := CreateAlias(aTableName);
  lTable.TableAlias := CreateTableAlias(lTable);
  lTable.SQLAlias := CreateTableSQLAlias(lTable);

  if (SelectTableCount = 0) then
    lTable.JoinType := dajtNone
  else
    lTable.JoinType := dajtInner;

  lTable.ChildType := Ord(dactSelectTable);
  lTable.Parent := Self;

  Result := lTable;

end; {function, AddTable}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveTable }

function TdaSQL.RemoveTable(const aTableSQLAlias: String): Boolean;
var
  lTable: TdaTable;
begin

  {this routine will remove the named table and any tables joined to
   the named table (via the FreeTable procedure)}
  Result := False;

  lTable := GetTableForSQLAlias(aTableSQLAlias);

  if (lTable = nil) then Exit;

  Result := FreeTable(lTable);

end; {function, RemoveTable}

{------------------------------------------------------------------------------}
{ TdaSQL.FreeTable }

function TdaSQL.FreeTable(aTable: TdaTable): Boolean;
var
  lJoinTable: TdaTable;
  liIndex: Integer;
begin

  Result := False;

  {search for tables joined to this table}
  liIndex := 0;

  while (liIndex < FSelectTables.Count) do
    begin
      lJoinTable := SelectTables[liIndex];

      if (lJoinTable <> aTable) and (lJoinTable.JoinTableSQLAlias = aTable.SQLAlias) then
        begin
          Result := True;

          FreeTable(lJoinTable);
        end;

      Inc(liIndex);
    end;

  FreeRelatedFields(aTable);

  aTable.Free;

end; {function, FreeTable}

{------------------------------------------------------------------------------}
{ TdaSQL.EditTableJoin }

function TdaSQL.EditTableJoin(const aTable1, aTable2: String): Boolean;
var
  lTable1: TdaTable;
  lTable2: TdaTable;
  lDialog: TdaJoinTableDialog;
begin

  lTable1 := GetTableForSQLAlias(aTable1);
  lTable2 := GetTableForSQLAlias(aTable2);

  lDialog := TdaJoinTableDialog.Create(Self);

  lDialog.Table1 := lTable1;
  lDialog.Table2 := lTable2;
  lDialog.SQL := Self;

  lDialog.Initialize;

  if (lDialog.ShowModal = mrOK) then
    Result := True
  else
    Result := False;

  lDialog.Free;

end; {function, EditTableJoin}

{------------------------------------------------------------------------------}
{ TdaSQL.AddSelectField }

function TdaSQL.AddSelectField(aTable: TdaTable; const aFieldName: String): TdaField;
var
  lField: TdaField;
begin

  if (aFieldName = '*') then
    begin
      AddAllSelectFields(aTable);

      Result := nil;
    end
  else
    begin
      lField := GetFieldForTable(aTable, aFieldName);
      lField.ChildType := Ord(dactSelectField);
      lField.Parent := Self;

      Result := lField;
    end;

end; {function, AddSelectField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectField }

function TdaSQL.SelectField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin

  lField := AvailableSelectFields[aAvailableIndex];

  FAvailableSelectFields.Delete(aAvailableIndex);

  lNewField := TdaField.Create(Self);
  lNewField.Assign(lField);

  ValidateFieldAlias(lNewField, True);

  lNewField.ChildType := Ord(dactSelectField);
  lNewField.Parent := Self;

  Result := lNewField;

  if (HasAggregates) then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;

  FGroupByFieldsOutOfSync := True;

end; {procedure, SelectField}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectField }

function TdaSQL.DeselectField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin

  lField := SelectFields[aSelectedIndex];

  Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableSelectFields);

  lField.Free;

  if (HasAggregates) then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;

  FGroupByFieldsOutOfSync := True;

end; {procedure, DeselectField}

{------------------------------------------------------------------------------}
{ TdaSQL.HasAggregates }

function TdaSQL.HasAggregates: Boolean;
var
  liIndex: Integer;
begin

  Result := False;

  liIndex := 0;

  while not(Result) and (liIndex < CalcFieldCount) do
    begin

      if CalcFields[liIndex].CalcType in [dacaCount, dacaAvg, dacaMax, dacaMin, dacaSum] then
        Result := True
      else
        Inc(liIndex);

    end;

end; {procedure, HasAggregates}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectCalcField }

function TdaSQL.SelectCalcField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lCalc: TdaCalculation;
begin

  lField := AvailableCalcFields[aAvailableIndex];

  lCalc := TdaCalculation.Create(Self);
  lCalc.Assign(lField);
  lCalc.Parent := Self;
  lCalc.OnCalcTypeChange := CalcTypeChangeEvent;

  ValidateFieldAlias(lCalc, True);

  Result := lCalc;

  FOrderByFieldsOutOfSync := True;

  SyncGroupByFieldsWithSelectFields;

end; {function, SelectCalcField}

{------------------------------------------------------------------------------}
{ TdaSQL.CalcTypeChangeEvent }

procedure TdaSQL.CalcTypeChangeEvent(Sender: TObject);
begin

  if HasAggregates then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;

end; {procedure, CalcTypeChangeEvent}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectCalcField }

function TdaSQL.DeselectCalcField(aSelectedIndex: Integer): TdaField;
var
  liPosition: Integer;
  lField: TdaField;
begin

  lField := CalcFields[aSelectedIndex];

  liPosition := daFindField(lField, FAvailableFields);

  lField.Free;

  if (liPosition <> -1) then
    lField := TdaField(FAvailableFields[liPosition])
  else
    lField := nil;

  Result := lField;

  FOrderByFieldsOutOfSync := True;

  SyncOrderByFieldsWithCalcFields;

  if (FCalcFields.Count = 0) and FGroupByFieldsSynced then
    ClearGroupByFields;

end; {function, DeselectCalcField}

{------------------------------------------------------------------------------}
{ TdaSQL.AddGroupByField }

function TdaSQL.AddGroupByField(aField: TdaField): TdaField;
var
  lField: TdaField;
begin
  lField := TdaField.Create(Self);
  lField.Assign(aField);
  lField.ChildType := Ord(dactGroupByField);
  lField.Parent := Self;

  Result := lField;

end; {function, AddGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectGroupByField }

function TdaSQL.SelectGroupByField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin
  lField := AvailableGroupByFields[aAvailableIndex];

  FAvailableGroupByFields.Delete(aAvailableIndex);

  lNewField := TdaField.Create(Self);
  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactGroupByField);
  lNewField.Parent := Self;

  Result := lNewField;
end; {procedure, SelectGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectGroupByField }

function TdaSQL.DeselectGroupByField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin

  Result := nil;

  lField := GroupByFields[aSelectedIndex];

  if (daFindField(lField, FSelectFields) <> -1) and (HasAggregates) then Exit;

  Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableGroupByFields);

  lField.Free;

end; {procedure, DeselectGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.ResetCriteriaLevels }

procedure TdaSQL.ResetCriteriaLevels;
var
  lCriteria: TdaCriteria;
  liLevel: Integer;
  liIndex: Integer;
begin

  liLevel := 0;

  for liIndex := 0 to FCriteria.Count - 1 do
    begin
      lCriteria := Criteria[liIndex];

      lCriteria.Level := liLevel;

      if (lCriteria.CriteriaType = dacrBegin) then
        begin
          lCriteria.Level := liLevel;

          Inc(liLevel);
        end

      else if (lCriteria.CriteriaType = dacrEnd) then
        begin
          Dec(liLevel);

          lCriteria.Level := liLevel;
        end

      else
        lCriteria.Level := liLevel;

    end;

end; {function, ResetCriteriaLevels}

{------------------------------------------------------------------------------}
{ TdaSQL.AddCriteria }

function TdaSQL.AddCriteria(aType: TdaCriteriaType): TdaCriteria;
var
  lCriteria: TdaCriteria;
begin

  lCriteria := TdaCriteria.Create(Self);
  lCriteria.CriteriaType := aType;
  lCriteria.Parent := Self;

  ResetCriteriaLevels;

  Result := lCriteria;

end; {function, AddCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.AddCriteriaField }

function TdaSQL.AddCriteriaField(aTable: TdaTable; const aFieldName: String; aOperator: TdaCriteriaOperatorType; const aValue: String): TdaCriteria;
var
  lCriteria: TdaCriteria;
  lField: TdaField;
begin

  lCriteria := TdaCriteria.Create(Self);

  lField := GetFieldForTable(aTable, aFieldName);
  lField.Parent := lCriteria;
  
  lCriteria.Operator := aOperator;
  lCriteria.Value := aValue;
  lCriteria.Parent := Self;

  ResetCriteriaLevels;

  Result := lCriteria;

end; {function, AddCriteriaField}

{------------------------------------------------------------------------------}
{ TdaSQL.InsertCriteria }

function TdaSQL.InsertCriteria(aPosition: Integer; aType: TdaCriteriaType): TdaCriteria;
var
  lCriteria: TdaCriteria;
begin

  lCriteria := TdaCriteria.Create(Self);
  lCriteria.CriteriaType := aType;
  lCriteria.Parent := Self;
  lCriteria.Position := aPosition;

  ResetCriteriaLevels;

  Result := lCriteria;

end; {function, InsertCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveCriteria }

function TdaSQL.RemoveCriteria(aSelectedIndex: Integer): Boolean;
begin
  Criteria[aSelectedIndex].Free;

  Result := True;
end; {function, RemoveCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.AddParentheses }

function TdaSQL.AddParentheses(aSelectedList: TList): Boolean;
var
  liItem: Integer;
begin

  Result := False;

  if (aSelectedList = nil) or (aSelectedList.Count = 0) then Exit;

  liItem := Integer(aSelectedList[0]);

  InsertCriteria(liItem, dacrBegin);

  liItem := Integer(aSelectedList[aSelectedList.Count - 1]);

  InsertCriteria(liItem + 2, dacrEnd);

  Result := True;

end; {function, AddParentheses}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveParentheses }

function TdaSQL.RemoveParentheses(aSelectedList: TList): Boolean;
var
  liItem: Integer;
  lCriteria1: TdaCriteria;
  lCriteria2: TdaCriteria;
  liIndex: Integer;
  liIncrement: Integer;
  lCriteria: TdaCriteria;
begin

  Result := False;

  if (aSelectedList = nil) or (aSelectedList.Count = 0) then Exit;

  lCriteria1 := nil;
  liIndex := 0;
  liItem := -1;

  if (aSelectedList.Count = 1) then
    begin
      liItem := Integer(aSelectedList[0]);

      lCriteria := Criteria[liItem];

      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
        lCriteria1 := lCriteria

      else if (liItem > 0) then
        begin
          liItem := liItem - 1;

          lCriteria := Criteria[liItem];

          if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
            lCriteria1 := lCriteria;

        end;

    end;


  while (lCriteria1 = nil) and (liIndex < aSelectedList.Count) do
    begin
      liItem := Integer(aSelectedList[liIndex]);

      lCriteria := Criteria[liItem];

      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
        lCriteria1 := lCriteria
      else
        Inc(liIndex);

    end;

  if (lCriteria1 = nil) then Exit;

  {count begins to the begin in the selection}
  lCriteria2 := nil;

  if (lCriteria1.CriteriaType = dacrBegin) then
    liIncrement := 1
  else
    liIncrement := -1;

  liIndex := liItem + liIncrement;

  while (lCriteria2 = nil) and (liIndex < CriteriaCount) and (liIndex > -1) do
    begin
      lCriteria := Criteria[liIndex];

      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) and
         (lCriteria.Level = lCriteria1.Level) then
        lCriteria2 := lCriteria
      else
        liIndex := liIndex + liIncrement;

    end;

  if (lCriteria2 = nil) then Exit;

  Result := True;

  lCriteria1.Free;
  lCriteria2.Free;

  ResetCriteriaLevels;

end; {function, RemoveParentheses}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectCriteria }

function TdaSQL.SelectCriteria(aAvailableIndex: Integer): TdaCriteria;
var
  lCriteria: TdaCriteria;
  lField: TdaField;
  lField2: TdaField;
begin

  lCriteria := TdaCriteria.Create(Self);
  lCriteria.Parent := Self;

  lField := AvailableCriteria[aAvailableIndex];

  lField2 := TdaField.Create(Self);
  lField2.Assign(lField);
  lField2.Parent := lCriteria;
  
  Result := lCriteria;

  ResetCriteriaLevels;

end; {function, SelectCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectCriteria }

function TdaSQL.DeselectCriteria(aSelectedIndex: Integer): Boolean;
begin

  if not(Criteria[aSelectedIndex].CriteriaType in [dacrBegin, dacrEnd]) then
    begin
      Criteria[aSelectedIndex].Free;

      Result := True;
    end
  else
    Result := False;


end; {function, DeselectCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.AddOrderByField }

function TdaSQL.AddOrderByField(aField: TdaField; Ascending: Boolean): TdaField;
var
  lField: TdaField;
begin

  lField := TdaField.Create(Self);
  lField.Assign(aField);
  lField.ChildType := Ord(dactOrderByField);
  lField.Ascending := Ascending;
  lField.Parent := Self;

  Result := lField;

end; {function, AddOrderByField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectOrderByField }

function TdaSQL.SelectOrderByField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin

  lField := AvailableOrderByFields[aAvailableIndex];

  FAvailableOrderByFields.Delete(aAvailableIndex);

  if lField is TdaCalculation then
   lNewField := TdaCalculation.Create(Self)
  else
   lNewField := TdaField.Create(Self);

  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactOrderByField);
  lNewField.Parent := Self;

  Result := lNewField;

end; {procedure, SelectOrderByField}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectOrderByField }

function TdaSQL.DeselectOrderByField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin

  lField := OrderByFields[aSelectedIndex];

  Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableOrderByFields);

  if (Result = nil) then
    Result := daRestoreAvailableField(lField, FCalcFields, FAvailableOrderByFields);

  lField.Free;

end; {procedure, DeselectOrderByField}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncOrderByFieldsWithCalcFields }

procedure TdaSQL.SyncOrderByFieldsWithCalcFields;
var
  liPosition: Integer;
  liIndex: Integer;
  lField: TdaField;
begin

  if (OrderByFieldCount = 0) then Exit;

  for liIndex := 0 to FOrderByFields.Count - 1 do
    begin
      lField := OrderByFields[liIndex];

      if lField is TdaCalculation then
        begin
          liPosition := daFindField(lField, FCalcFields);

          if (liPosition = -1) then
            DeselectOrderByField(liIndex)
          else
            lField.Assign(TdaCalculation(FCalcFields[liPosition]));

          FOrderByFieldsOutOfSync := True;
        end;
    end;

end; {procedure, SyncOrderByFieldsWithCalcFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncGroupByFieldsWithSelectFields }

procedure TdaSQL.SyncGroupByFieldsWithSelectFields;
var
  liPosition: Integer;
  liIndex: Integer;
begin

  {if (FSelectFields.Count = 0) and (HasAggregates) then Exit;}

  if (FSyncingGroups) then Exit;

  FSyncingGroups := True;

  ClearGroupByFields;

  SyncGroupByFields;

  for liIndex := 0 to FSelectFields.Count - 1 do
    begin
      liPosition := daFindField(SelectFields[liIndex], FAvailableGroupByFields);

      if (liPosition <> -1) then
        SelectGroupByField(liPosition);
    end;

  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := True;

  FSyncingGroups := False;

end; {procedure, SyncGroupByFieldsWithSelectFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncSelectFieldsWithGroupByFields }

{procedure TdaSQL.SyncSelectFieldsWithGroupByFields;
var
  liPosition: Integer;
  liIndex: Integer;
begin

  if (FSyncingGroups) then Exit;

  FSyncingGroups := True;

  ClearSelectFields;
  
  SyncSelectFields;

  for liIndex := 0 to FGroupByFields.Count - 1 do
    begin
      liPosition := daFindField(GroupByFields[liIndex], FAvailableSelectFields);

      if (liPosition <> -1) then
        SelectField(liPosition);
    end;

  FGroupByFieldsSynced := True;
  FSelectFieldsOutOfSync := True;

  FSyncingGroups := False;

end; {procedure, SyncSelectFieldsWithGroupByFields}

{------------------------------------------------------------------------------}
{ TdaSQL.SetAvailableFieldOrder }

procedure TdaSQL.SetAvailableFieldOrder(aSortMode: Integer);
var
  liIndex: Integer;
  lFields: TStringList;
  lField: TdaField;
begin

  if (FFieldSortMode = aSortMode) then Exit;

  FFieldSortMode := aSortMode;

  FAvailableFields.Clear;

  {create field list in logical order}
  if (FFieldSortMode = 1) then
    begin
      for liIndex := 0 to FSavedAvailableFields.Count - 1 do
        FAvailableFields.Add(TdaField(FSavedAvailableFields[liIndex]));
    end

  {create field list in alpha order}
  else
    begin

      lFields := TStringList.Create;

      {build list of field aliases}
      for liIndex := 0 to FSavedAvailableFields.Count - 1 do
        begin
          lField := TdaField(FSavedAvailableFields[liIndex]);

          lFields.AddObject(lField.FieldAlias, lField);
        end;

      {sort by field alias}
      lFields.Sort;

      {add fields in alpha order}
      for liIndex := 0 to lFields.Count - 1 do
        FAvailableFields.Add(TdaField(lFields.Objects[liIndex]));

      lFields.Free;
    end;

  {indicate that fields are out of sync}
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;

end; {procedure, SetAvailableFieldOrder}

{******************************************************************************
 *
 ** S Q L   -   S U P P O R T I N G   R O U T I N E S  
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSQLReservedWord }

function TdaSQL.IsSQLReservedWord(const aString: String): Boolean;
begin
  Result := False;

  if (FSession <> nil) then
    Result := FSession.IsSQLReservedWord(aString, FDatabaseType);

end; {procedure, IsSQLReservedWord}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateTableSQLAlias }

function TdaSQL.CreateTableSQLAlias(aTable: TdaTable): String;
var
  liInstance: Integer;
  lSQLAliases: TStrings;
  liIndex: Integer;
  lsTableName: String;
  liPosition: Integer;
  lsOwner: String;
  lbFileBased: Boolean;
begin

  {get table name}
  if (FDataDictionary <> nil) and (FDataDictionary.UseTableOwnerName) then
    lsTableName := aTable.RawTableName
  else
    ppStripOffTableName(aTable.TableName, lsTableName, lsOwner, lbFileBased);

  {replace spaces in table name with underlines}
  liPosition := daInvalidChar(lsTableName);

  while (liPosition <> 0) do
    begin
      lsTableName[liPosition] := '_';

      liPosition := daInvalidChar(lsTableName);
    end;

  {if table name is reserved word, add _TABLE}
  while IsSQLReservedWord(lsTableName) do
    lsTableName := lsTableName + '_TABLE';

  Result := lsTableName;

  {make sure alias is unique}
  lSQLAliases := TStringList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    lSQLAliases.Add(SelectTables[liIndex].SQLAlias);

  if (lSQLAliases.IndexOf(lsTableName) = -1) then
    begin
      lSQLAliases.Free;

      Exit;
    end;

  liInstance := 2;

  Result := lsTableName + '_' + IntToStr(liInstance);

  while (lSQLAliases.IndexOf(Result) <> -1) do
    begin
      Result := lsTableName + '_' + IntToStr(liInstance);

      Inc(liInstance);
    end;

  lSQLAliases.Free;

end; {function, CreateTableSQLAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAlias }

function TdaSQL.CreateAlias(const aTableName: String): String;
var
  lTable: TdaTable;
  liIndex: Integer;
  lsTableName: String;
  lsTableAlias: String;
  lsOwner: String;
  lbFileBased: Boolean;
begin

  Result := '';

  liIndex := IndexOfTableName(aTableName);

  if (liIndex = -1) then Exit;

  lTable := AvailableTables[liIndex];

  {get table alias}
  if (FDataDictionary <> nil) then
    begin
      FDataDictionary.TableName := lTable.RawTableName;

      lsTableAlias := FDataDictionary.TableAlias;
    end
  else
    begin
      ppStripOffTableName(lTable.TableName, lsTableName, lsOwner, lbFileBased);

      lsTableAlias := ppCapitalize(lsTableName);
    end;

  Result := lsTableAlias;

end; {function, CreateAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateTableAlias }

function TdaSQL.CreateTableAlias(aTable: TdaTable): String;
var
  lsTableName: String;
  liIndex: Integer;
  liInstance: Integer;
  lTableAliases: TStrings;
  lsTableAlias: String;
  lsOwner: String;
  lbFileBased: Boolean;
begin

  {get table alias}
  if (FDataDictionary <> nil) then
    begin
      FDataDictionary.TableName := aTable.RawTableName;

      lsTableAlias := FDataDictionary.TableAlias;
    end
  else
    begin
      ppStripOffTableName(aTable.TableName, lsTableName, lsOwner, lbFileBased);

      lsTableAlias := ppCapitalize(lsTableName);
    end;

  Result := lsTableAlias;

  {check to see if alias is duplicate of another table in the selection}
  lTableAliases := TStringList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    lTableAliases.Add(Uppercase(SelectTables[liIndex].TableAlias));

  if (lTableAliases.IndexOf(Uppercase(lsTableAlias)) = -1) then
    begin
      lTableAliases.Free;

      Exit;
    end;

  liInstance := 2;

  Result := lsTableAlias + ' (' + IntToStr(liInstance) + ')';

  while (lTableAliases.IndexOf(Result) <> -1) do
    begin
      Result := lsTableAlias + ' (' + IntToStr(liInstance) + ')';

      Inc(liInstance);
    end;

  lTableAliases.Free;

end; {function, CreateTableAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.Valid }

function TdaSQL.Valid: Boolean;
var
  lDataSet: TdaDataSet;
  lFields: TList;
  liIndex: Integer;
  liCount: Integer;
  lsCaption: String;
  lsMessage: String;
begin

  Result := True;

  if (FDescription = '') then
    begin
      {Please enter a description of your query.'}
      lsMessage := ppLoadStr(805);

      MessageDlg(lsMessage, mtError, [mbOK], 0);

      Result := False;

      Exit;
    end

  else if not(IsValidIdent(FDataPipelineName)) then
    begin
      {<name> is not a valid Data Pipeline name.}
      lsMessage := ppLoadStr(712);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [FDataPipelineName]);

      MessageDlg(lsMessage, mtError, [mbOK], 0);

      Result := False;

      Exit;
    end;


  lDataSet := FDataSetClass.Create(Self);
  lDataSet.DatabaseName := FDatabaseName;

  lFields := TList.Create;

  try

    try
      if (FEditSQLAsText) then
        lDataSet.GetFieldsForSQL(lFields, FSQLText)
      else
        lDataSet.GetFieldsForSQL(lFields, SQLText);
    except
      on E: Exception do
        begin
          lsCaption := ppLoadStr(829); {SQL}
          lsMessage := ppLoadStr(777)+ #13#10 + #13#10 + E.Message; {Invalid SQL statement.}
          ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

          Result := False;
        end;
    end; {try, except}

  finally

    {update sql field names}
    if (Result) and not(FEditSQLAsText) then
      begin

        liCount := SelectFieldCount;

        for liIndex := 0 to liCount - 1 do
          SelectFields[liIndex].SQLFieldName := TppField(lFields[liIndex]).FieldName;

        for liIndex := liCount to lFields.Count - 1 do
          CalcFields[liIndex - liCount].SQLFieldName := TppField(lFields[liIndex]).FieldName;

      end;

    {free field objects}
    for liIndex := lFields.Count - 1 downto 0 do
      TObject(lFields[liIndex]).Free;

    lDataSet.Free;
    lFields.Free;

  end; {try, finally}

end; {function, Valid}

{------------------------------------------------------------------------------}
{ TdaSQL.OpenDataSet }

function TdaSQL.OpenDataSet(aDataSet: TdaDataSet): Boolean;
var
  lsMessage: String;
  lsMessage1: String;
  lsMessage2: String;
begin

  Result := False;

  try
    aDataSet.Active := True;
  except
    on E: Exception do
      begin
        {message: Unable to open table: <name>.}
        lsMessage1 := ppLoadStr(839);
        lsMessage1 := ppSetMessageParameters(lsMessage1);
        lsMessage1 := Format(lsMessage1, [aDataSet.DataName]);

        {message: Error: <errormessage>}
        lsMessage2 := ppLoadStr(840);
        lsMessage2 := ppSetMessageParameters(lsMessage2);
        lsMessage2 := Format(lsMessage2, [E.Message]);

        lsMessage := lsMessage1 + #13#10 + #13#10 + lsMessage2;

        MessageDlg(lsMessage, mtError, [mbOK], 0);

        aDataSet.Free;

        Exit;
      end;
  end; {try, except}

  Result := True;

end; {function, OpenDataSet}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldForTable }

function TdaSQL.GetFieldForTable(aTable: TdaTable; const aFieldName: String): TdaField;
var
  lDataSet: TdaDataSet;
  lDataSetField: TppField;
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := nil;

  if (aTable = nil) then Exit;

  if (FDataDictionary <> nil) and not(FDataDictionary.ValidateFieldNames) then
    begin
      FDataDictionary.TableName := aTable.RawTableName;

      lDataSetField := FDataDictionary.FieldForFieldName(aFieldName);

      if (lDataSetField <> nil) then
        begin
          lField := TdaField.Create(Self);

          ppFieldTodaField(lDataSetField, lField);

          lField.TableAlias := aTable.TableAlias;
          lField.TableSQLAlias := aTable.SQLAlias;

          Result := lField;
        end;

      Exit;
    end;

  lDataSet := FDataSetClass.Create(Self);
  lDataSet.DatabaseName := FDatabaseName;
  lDataSet.DataName := aTable.DataName;

  if not(OpenDataSet(lDataSet)) then Exit;

  lbFound := False;
  liIndex := 0;
  lField := nil;

  while not(lbFound) and (liIndex < lDataSet.FieldCount) do
    begin
      lDataSetField := lDataSet.Fields[liIndex];

      if (CompareText(lDataSetField.FieldName, aFieldName) = 0) then
        begin
          lbFound := True;

          lField := CreateField(lDataSetField);

          if (lField <> nil) then
            begin
              lField.TableAlias := aTable.TableAlias;
              lField.TableSQLAlias := aTable.SQLAlias;
            end;
        end
      else
        Inc(liIndex);

    end;

  lDataSet.Active := False;

  lDataSet.Free;

  Result := lField;

end; {function, GetFieldForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.AddAllSelectFields }

procedure TdaSQL.AddAllSelectFields(aTable: TdaTable);
var
  lFields: TList;
  lField: TdaField;
  liIndex: Integer;
begin

  lFields := TList.Create;

  CreateAllFields(aTable, lFields);

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TdaField(lFields[liIndex]);

      ValidateFieldAlias(lField, True);

      lField.ChildType := Ord(dactSelectField);
      lField.Parent := Self;
    end;

  lFields.Free;

end; {procedure, AddAllSelectFields}

{------------------------------------------------------------------------------}
{ TdaSQL.ValidateFieldAlias }

function TdaSQL.ValidateFieldAlias(aField: TdaField; aFixAlias: Boolean): Boolean;
var
  lField: TdaField;
  lFields: TStringList;
  liIndex: Integer;
  lsAlias: String;
  liIncrement: Integer;
begin

  {these should be maintained dynamically in FFieldAliases}
  lFields := TStringList.Create;

  for liIndex := 0 to SelectFieldCount - 1 do
    begin
      lField := SelectFields[liIndex];

      if (aField <> lField) then
        lFields.Add(lField.Alias);
    end;

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lField := CalcFields[liIndex];

      if (aField <> lField) then
        lFields.Add(lField.Alias);
    end;

  lsAlias := aField.Alias;
  liIndex := lFields.IndexOf(lsAlias);

  Result := (liIndex = -1);

  {assign new, non-conflicting alias}
  if not(Result) and (aFixAlias) then
    begin

      liIncrement := 2;

      while (liIndex <> -1) do
        begin
          lsAlias := aField.Alias + ' (' + IntToStr(liIncrement) + ')';

          liIndex := lFields.IndexOf(lsAlias);

          Inc(liIncrement);
        end;

      aField.Alias := lsAlias;
    end;

  lFields.Free;

end; {procedure, ValidateFieldAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldsForTable }

procedure TdaSQL.CreateFieldsForTable(aTable: TdaTable; aList: TStrings);
var
  lList: TList;
  liIndex: Integer;
  lField: TdaField;
begin

  lList := TList.Create;

  CreateAllFields(aTable, lList);

  for liIndex := 0 to lList.Count - 1 do
    begin
      lField := TdaField(lList[liIndex]);

      aList.AddObject(lField.FieldName, lField);
    end;

  lList.Free;

end; {procedure, CreateFieldsForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldAliasesForTable }

procedure TdaSQL.CreateFieldAliasesForTable(aTable: TdaTable; aList: TStrings);
var
  lList: TList;
  liIndex: Integer;
  lField: TdaField;
begin

  lList := TList.Create;

  CreateAllFields(aTable, lList);

  for liIndex := 0 to lList.Count - 1 do
    begin
      lField := TdaField(lList[liIndex]);

      aList.AddObject(lField.FieldAlias, lField);
    end;

  lList.Free;

end; {procedure, CreateFieldAliasesForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAllFields }

procedure TdaSQL.CreateAllFields(aTable: TdaTable; aList: TList);
var
  lDataSet: TdaDataSet;
  lDataSetField: TppField;
  liIndex: Integer;
  lField: TdaField;
begin

  if (aTable = nil) or (aList = nil) then Exit;

  if (FDataDictionary <> nil) then
    FDataDictionary.TableName := aTable.RawTableName;

  {create fields from data dictionary entries}
  if (FDataDictionary <> nil) and not(FDataDictionary.ValidateFieldNames) then
    begin
      for liIndex := 0 to FDataDictionary.FieldCount - 1 do
        begin
          lDataSetField := FDataDictionary.Fields[liIndex];

          lField := TdaField.Create(Self);

          ppFieldTodaField(lDataSetField, lField);

          lField.TableAlias := aTable.TableAlias;
          lField.TableSQLAlias := aTable.SQLAlias;

          aList.Add(lField);
        end;
    end

  {create fields from dataset}
  else
    begin
      if (aTable.TableName = '') then Exit;

      lDataSet := FDataSetClass.Create(Self);
      lDataSet.DatabaseName := FDatabaseName;
      lDataSet.DataName := aTable.DataName;

      if not(OpenDataSet(lDataSet)) then Exit;

      for liIndex := 0 to lDataSet.FieldCount - 1 do
        begin
          lDataSetField := lDataSet.Fields[liIndex];

          if (FDataDictionary <> nil) and (FDataDictionary.ValidateFieldNames) and (FDataDictionary.FieldForFieldName(lDataSetField.FieldName) = nil) then
            Continue;

          lField := CreateField(lDataSetField);

          if (lField <> nil) then
            begin
              lField.TableAlias := aTable.TableAlias;
              lField.TableSQLAlias := aTable.SQLAlias;

              aList.Add(lField);
            end;

        end;

      lDataSet.Active := False;

      lDataSet.Free;
    end;

end; {function, CreateAllFields}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateField }

function TdaSQL.CreateField(aDataSetField: TppField): TdaField;
var
  lField: TdaField;
  lDataDictField: TppField;
begin

  Result := nil;
  
  if (aDataSetField = nil) then Exit;

  if (FDataDictionary <> nil) then
    lDataDictField := FDataDictionary.FieldForFieldName(aDataSetField.FieldName)
  else
    lDataDictField := nil;

  if (lDataDictField <> nil) then
    begin
      lField := TdaField.Create(Self);

      ppFieldTodaField(aDataSetField, lField);

      {use values from data dictionary field}
      lField.FieldAlias    := lDataDictField.FieldAlias;
      lField.Alias         := lDataDictField.FieldAlias;

      lField.Selectable    := lDataDictField.Selectable;
      lField.Searchable    := lDataDictField.Searchable;
      lField.Sortable      := lDataDictField.Sortable;

      lField.AutoSearch    := lDataDictField.AutoSearch;
      lField.Mandatory     := lDataDictField.Mandatory;
    end
  else
    begin
      lField := TdaField.Create(Self);

      ppFieldTodaField(aDataSetField, lField);

      lField.FieldAlias := ppCapitalize(aDataSetField.FieldName);
      lField.Alias      := ppCapitalize(aDataSetField.FieldName);

    end;

  Result := lField;

end; {function, CreateField}

{------------------------------------------------------------------------------}
{ TdaSQL.ppFieldTodaField }

procedure TdaSQL.ppFieldTodaField(aSourceField: TppField; aTargetField: TdaField);
begin

  if (aSourceField = nil) or (aTargetField = nil) then Exit;

  aTargetField.DataType      := aSourceField.DataType;
  aTargetField.DisplayFormat := aSourceField.DisplayFormat;
  aTargetField.FieldName     := aSourceField.FieldName;
  aTargetField.TableName     := aSourceField.TableName;

  aTargetField.FieldAlias    := aSourceField.FieldAlias;
  aTargetField.Alias         := aSourceField.FieldAlias;

  aTargetField.Selectable    := aSourceField.Selectable;
  aTargetField.Searchable    := aSourceField.Searchable;
  aTargetField.Sortable      := aSourceField.Sortable;

  aTargetField.AutoSearch    := aSourceField.AutoSearch;
  aTargetField.Mandatory     := aSourceField.Mandatory;

end; {function, ppFieldTodaField}

{------------------------------------------------------------------------------}
{ TdaSQL.daFieldToppField }

procedure TdaSQL.daFieldToppField(aSourceField: TdaField; aTargetField: TppField);
begin

  if (aSourceField = nil) or (aTargetField = nil) then Exit;

  aTargetField.DataType      := aSourceField.DataType;
  aTargetField.DisplayFormat := aSourceField.DisplayFormat;
  aTargetField.FieldName     := aSourceField.FieldName;
  aTargetField.TableName     := aSourceField.TableName;

  aTargetField.FieldAlias    := aSourceField.FieldAlias;

  aTargetField.Selectable    := aSourceField.Selectable;
  aTargetField.Searchable    := aSourceField.Searchable;
  aTargetField.Sortable      := aSourceField.Sortable;

  aTargetField.AutoSearch    := aSourceField.AutoSearch;
  aTargetField.Mandatory     := aSourceField.Mandatory;

end; {function, daFieldToppField}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldsFromSQL }

procedure TdaSQL.CreateFieldsFromSQL;
var
  lFields: TList;
  lSQL: TStrings;
  liIndex: Integer;
  lField: TdaField;
  lppField: TppField;
begin

  lSQL := TStringList.Create;

  lSQL.Assign(FSQLText);

  Clear;

  FSQLText.Assign(lSQL);

  lSQL.Free;

  lFields := TList.Create;

  if (GetFieldsForSQL(FSQLText, lFields)) then
    begin

      for liIndex := 0 to lFields.Count - 1 do
        begin
          lppField := TppField(lFields[liIndex]);

          lField := TdaField.Create(Self);

          lField.FieldName    := lppField.FieldName;
          lField.SQLFieldName := lppField.FieldName;
          lField.Alias        := lppField.FieldName;
          lField.FieldAlias   := lppField.FieldName;
          lField.DataType     := lppField.DataType;

          lField.Selectable := True;
          lField.Searchable := True;
          lField.Sortable := True;

          lField.Parent := Self;

          {free the TppField object here, we no longer need it}
          lppField.Free;

        end; {for, each field}

    end; {if, fields retrieved}

  lFields.Free;

end; {procedure, CreateFieldsFromSQL}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAvailableTableList }

procedure TdaSQL.CreateAvailableTableList;
var
  lAvailableTables: TStringList;
  liIndex: Integer;
begin

  daFreeChildren(FAvailableTables);

  lAvailableTables := TStringList.Create;

  if (FDataDictionary <> nil) and not(FDataDictionary.ValidateTableNames) then
    GetTablesFromDataDictionary(lAvailableTables)
  else
    GetTablesFromSession(lAvailableTables);

  {sort by table alias}
  lAvailableTables.Sort;

  {transfer to TList}
  for liIndex := 0 to lAvailableTables.Count - 1 do
    FAvailableTables.Add(lAvailableTables.Objects[liIndex]);

  CreateJoinableTableLists;

  lAvailableTables.Free;

end; {procedure, CreateAvailableTableList}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoinableTableLists }

procedure TdaSQL.CreateJoinableTableLists;
var
  liIndex: Integer;
  lTable: TdaTable;
begin

  if not(AutoJoin) then Exit;

  for liIndex := 0 to FAvailableTables.Count - 1 do
    begin
      lTable := TdaTable(FAvailableTables[liIndex]);

      FDataDictionary.GetJoinableTableNames(lTable.RawTableName, lTable.JoinableTableNames);
    end;

  UpdateJoinableTables;

end; {procedure, CreateJoinableTableLists}

{------------------------------------------------------------------------------}
{ TdaSQL.AllowManualJoins }

function TdaSQL.AllowManualJoins: Boolean;
begin

  if (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) and not(FDataDictionary.AllowManualJoins) then
    Result := False
  else
    Result := True;

end; {procedure, AllowManualJoins}

{------------------------------------------------------------------------------}
{ TdaSQL.AutoJoin }

function TdaSQL.AutoJoin: Boolean;
begin
  Result := (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) and not(FDataDictionary.AllowManualJoins);
end; {procedure, AutoJoin}

{------------------------------------------------------------------------------}
{ TdaSQL.UpdateJoinableTables }

procedure TdaSQL.UpdateJoinableTables;
var
  liIndex: Integer;
  lTable: TdaTable;
  lTables: TStrings;
begin

  if not(AutoJoin) then Exit;

  {get list of selected tables}
  lTables := TStringList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    begin
      lTable := TdaTable(SelectTables[liIndex]);

      lTables.Add(lTable.RawTableName);
    end;

  {pass list of selected tables to each available table}
  for liIndex := 0 to FAvailableTables.Count - 1 do
    begin
      lTable := TdaTable(FAvailableTables[liIndex]);

      lTable.UpdateJoinable(lTables);
    end;

  lTables.Free;
  
end; {procedure, UpdateJoinableTables}

{------------------------------------------------------------------------------}
{ TdaSQL.GetTablesFromDataDictionary }

procedure TdaSQL.GetTablesFromDataDictionary(aAvailableTables: TStrings);
var
  lTableAliases: TStrings;
  lTableNames: TStrings;
  liIndex: Integer;
  lTable: TdaTable;
begin

  aAvailableTables.Clear;

  lTableNames := TStringList.Create;
  lTableAliases := TStringList.Create;

  FDataDictionary.GetTableNames(lTableNames, lTableAliases);

  liIndex := 0;

  while (liIndex < lTableNames.Count) do
    begin
      lTable := TdaTable.Create(Self);

      lTable.RawTableName := lTableNames[liIndex];
      lTable.Alias := lTableAliases[liIndex];
      lTable.TableAlias := lTableAliases[liIndex];

      aAvailableTables.AddObject(lTable.TableAlias, lTable);

      Inc(liIndex);
    end;

  lTableAliases.Free;
  lTableNames.Free;

end; {procedure, GetTablesFromDataDictionary}

{------------------------------------------------------------------------------}
{ TdaSQL.GetTablesFromSession }

procedure TdaSQL.GetTablesFromSession(aAvailableTables: TStrings);
var
  lTables: TStrings;
  liIndex: Integer;
  lsTableName: String;
  lsRawTableName: String;
  lsTableAlias: String;
  lsExtension: String;
  lTable: TdaTable;
  lbFileBased: Boolean;
begin

  lTables := TStringList.Create;

  FSession.GetTableNames(FDatabaseName, lTables);

  liIndex := 0;

  while (liIndex < lTables.Count) do
    begin
      lsTableAlias := '';
      lsRawTableName := lTables[liIndex];

      {remove owner name or extension from table name}
      ppStripOffTableName(lsRawTableName, lsTableName, lsExtension, lbFileBased);

      {get table alias from data dictionary}
      if (FDataDictionary <> nil) then
        begin
          if (lbFileBased or FDataDictionary.UseTableOwnerName) then
            lsTableAlias := FDataDictionary.GetTableAlias(lsRawTableName)
          else
            lsTableAlias := FDataDictionary.GetTableAlias(lsTableName);

          if (lsTableAlias = '') then
            begin
              Inc(liIndex);

              Continue;
            end;
        end;

      if (lsTableAlias = '') then
        lsTableAlias := ppCapitalize(lsTableName);


      if (lsTableAlias <> '') then
        begin
          lTable := TdaTable.Create(Self);

          lTable.RawTableName := lsRawTableName;
          lTable.Alias := lsTableAlias;
          lTable.TableAlias := lsTableAlias;

          aAvailableTables.AddObject(lsTableAlias, lTable);
        end;

      Inc(liIndex);

    end; {for, each table}

  lTables.Free;

end; {procedure, GetTablesFromSession}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAvailableFieldList }

procedure TdaSQL.CreateAvailableFieldList;
var
  lFields: TList;
  liIndex: Integer;
begin

  daFreeChildren(FAvailableFields);

  FSavedAvailableFields.Clear;

  lFields := TList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    begin
      CreateAllFields(SelectTables[liIndex], lFields);

      daCopyList(lFields, FAvailableFields, daftAll);
      daCopyList(lFields, FSavedAvailableFields, daftAll);

      lFields.Clear;
    end;

  lFields.Free;

end; {procedure, CreateAvailableFieldList}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncTableList }

procedure TdaSQL.SyncTableList(aAvailableList, aCurrentList: TList);
var
  liIndex: Integer;
  liPosition: Integer;
  lTable: TdaTable;
begin

  for liIndex := 0 to aCurrentList.Count - 1 do
    begin

      lTable := TdaTable(aCurrentList[liIndex]);

      liPosition := daFindTable(lTable, aAvailableList);

      if (liPosition <> -1) and not(FAllowSelfJoin) then
        aAvailableList.Delete(liPosition);
    end;

end; {procedure, SyncTableList}

{------------------------------------------------------------------------------}
{ TdaSQL.SyncFieldList }

procedure TdaSQL.SyncFieldList(aAvailableList, aCurrentList: TList);
var
  liIndex: Integer;
  liPosition: Integer;
  lField: TdaField;
begin

  for liIndex := 0 to aCurrentList.Count - 1 do
    begin

      lField := TdaField(aCurrentList[liIndex]);

      liPosition := daFindField(lField, aAvailableList);

      if (liPosition <> -1) then
        aAvailableList.Delete(liPosition);
    end;

end; {procedure, SyncFieldList}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateSQL }

procedure TdaSQL.CreateSQL;
var
  liIndent: Integer;
  lsText: String;

  { AddToSQL }

  procedure AddToSQL(const aSQLText: String);
  var
    lsCurrentLine: String;
    lsNewText: String;
    lsIndentation: String;
  begin
    lsCurrentLine := FSQLText[FSQLText.Count - 1];

    if (Length(lsCurrentLine) + Length(aSQLText) > FLineLength) then
      begin
        lsIndentation := daReplicate(liIndent, ' ');

        lsNewText := lsIndentation + aSQLText;

        FSQLText.Add(lsNewText);
      end
    else
      FSQLText[FSQLText.Count - 1] := lsCurrentLine + aSQLText;

  end; {procedure, AddToSQL}


  { BuildSelectClause }

  procedure BuildSelectClause;
  var
    liIndex: Integer;
  begin

    if (FSelectFields.Count = 0) and (FCalcFields.Count = 0) then Exit;

    if FDistinct then
      begin
        FSQLText.Add('SELECT DISTINCT ');
        liIndent := 16;
      end
    else
      begin
        FSQLText.Add('SELECT ');
        liIndent := 7;
      end;

    {add select fields}
    for liIndex := 0 to SelectFieldCount - 1 do
      begin
        lsText := SelectFields[liIndex].SQLString;

        if (liIndex < SelectFieldCount - 1) or (CalcFieldCount > 0) then
          lsText := lsText + ', ';

        AddToSQL(lsText);
      end;

    {add calc fields}
    for liIndex := 0 to CalcFieldCount - 1 do
      begin
        lsText := CalcFields[liIndex].SQLString;

        if (liIndex < CalcFieldCount - 1) then
          lsText := lsText + ', ';

        AddToSQL(lsText);
      end;

  end; {procedure, BuildSelectClause}


  { BuildSQL92JoinExpression }

  procedure BuildSQL92JoinExpression(aJoins: TList);
  var
    lTable: TdaTable;
    liIndex: Integer;
    liIndex2: Integer;
    lTableJoin: TdaTableJoin;
    lsLocalField: String;
    lsForeignField: String;
    lsOperator: String;
  begin

    if IsMSAccess then
      AddToSQL(daReplicate(aJoins.Count, '('));

    lTable := SelectTables[0];

    AddToSQL(lTable.SQLText);

    for liIndex := 0 to aJoins.Count - 1 do
      begin
        {add first table to from clause}
        lTable := TdaTable(aJoins[liIndex]);
        lsText := ' ' + lTable.SQLJoinTypeDesc + ' ' + lTable.SQLText + ' ON ';
        AddToSQL(lsText);

        {add join conditions to remainder of from clause}
        for liIndex2 := 0 to lTable.TableJoinCount - 1 do
          begin
            lTableJoin := lTable.TableJoins[liIndex2];

            lsLocalField := lTableJoin.LocalField.SQLString;
            lsForeignField := lTableJoin.ForeignField.SQLString;
            lsOperator := daJoinOperatorToString(lTableJoin.Operator);

            lsText := '(' + lsLocalField + ' ' + lsOperator + ' ' + lsForeignField + ')';

            {add closing paren on last field expression}
            if IsMSAccess and (liIndex2 = lTable.TableJoinCount - 1) then
              lsText := lsText + ' )';

            if (liIndex2 > 0) then
              lsText := ' AND ' + lsText;

            AddToSQL(lsText);
          end; {for, each field expression}

      end; {for, each join}

  end; {procedure, BuildSQL92JoinExpression}
  

  { BuildFromClause }

  procedure BuildFromClause;
  var
    liIndex: Integer;
    lJoins: TList;
    lTable: TdaTable;
  begin

    if (FSelectTables.Count = 0) then Exit;

    FSQLText.Add('FROM ');
    liIndent := 5;

    lJoins := TList.Create;

    for liIndex := 1 to SelectTableCount - 1 do
      begin
        lTable := SelectTables[liIndex];

        if (not(IsAdvantage) and (FSQLType in [sqSQL2, sqBDELocal])) or (IsAdvantage and (lTable.JoinType <> dajtInner)) then
          lJoins.Add(lTable);
      end;

    if (lJoins.Count > 0) then
      BuildSQL92JoinExpression(lJoins)
      
    else
      begin
        for liIndex := 0 to SelectTableCount - 1 do
          begin
            lsText := SelectTables[liIndex].SQLText;

            if (liIndex > 0) then
              lsText := ', ' + lsText;

            AddToSQL(lsText)
          end;
      end;

    lJoins.Free;

  end; {procedure, BuildFromClause}


  { BuildSQL89JoinExpression }

  procedure BuildSQL89JoinExpression(aJoins: TList);
  var
    lTable: TdaTable;
    liIndex: Integer;
    liIndex2: Integer;
    lTableJoin: TdaTableJoin;
    lsLocalField: String;
    lsForeignField: String;
    lsOperator: String;
  begin

    for liIndex := 0 to aJoins.Count - 1 do
      begin
        lTable := TdaTable(aJoins[liIndex]);

        for liIndex2 := 0 to lTable.TableJoinCount - 1 do
          begin
            lTableJoin := lTable.TableJoins[liIndex2];

            lsLocalField := lTableJoin.LocalField.SQLString;
            lsForeignField := lTableJoin.ForeignField.SQLString;
            lsOperator := daJoinOperatorToString(lTableJoin.Operator);

            if IsOracle then
              begin
                case lTable.JoinType of
                  dajtLeftOuter:  lsLocalField := lsLocalField + ' (+)';
                  dajtRightOuter: lsForeignField := lsForeignField + ' (+)';
                end;
              end

            else if IsSybaseASE then
              begin
                case lTable.JoinType of
                  dajtOuter:      lsOperator := '*' + lsOperator + '*';
                  dajtLeftOuter:  lsOperator := '*' + lsOperator;
                  dajtRightOuter: lsOperator := lsOperator + '*';
                end;
              end;

            lsText := '(' + lsLocalField + ' ' + lsOperator + ' ' + lsForeignField + ')';

            if (liIndex2 > 0) then
              lsText := ' AND ' + lsText;

            AddToSQL(lsText);

          end; {for, each field expression}


        if (liIndex < aJoins.Count - 1) then
          AddToSQL(' AND ');

      end; {for, each joined table}

  end; {procedure, BuildSQL89JoinExpression}

  
  { BuildWhereClause }

  procedure BuildWhereClause;
  var
    lbJoinClause: Boolean;
    lbWhereAdded: Boolean;
    lJoins: TList;
    lTable: TdaTable;
    liIndex: Integer;
    lbFirstCriteria: Boolean;
    lCriterium: TdaCriteria;
    lLastCriteriaType: TdaCriteriaType;
  begin
    lbJoinClause := (SelectTableCount > 1) and ((FSQLType = sqSQL1) or IsAdvantage);

    if (CriteriaCount = 0) and not(lbJoinClause) then Exit;


    liIndent := 6;
    lbWhereAdded := False;

    if lbJoinClause then
      begin
        if (IsAdvantage) then
          lbJoinClause := False;

        lJoins := TList.Create;

        for liIndex := 1 to SelectTableCount - 1 do
          begin
            lTable := SelectTables[liIndex];

            if not(IsAdvantage) or (IsAdvantage and (lTable.JoinType = dajtInner)) then
              begin
                lJoins.Add(lTable);

                if (IsAdvantage) then
                  lbJoinClause := True;
              end;

          end;

        if (lJoins.Count > 0) then
          begin
            FSQLText.Add('WHERE ');
            lbWhereAdded := True;

            BuildSQL89JoinExpression(lJoins);
          end;

        lJoins.Free;
      end;

    lLastCriteriaType := dacrBegin;
    lbFirstCriteria := True;

    for liIndex := 0 to CriteriaCount - 1 do
      begin
        lCriterium := Criteria[liIndex];

        if not(lCriterium.ShowAllValues) and ResolveCriteria(lCriterium, lLastCriteriaType, lsText) then
          begin
            lLastCriteriaType := lCriterium.CriteriaType;

            if lbJoinClause and (lbFirstCriteria) then
              begin
                AddToSQL(' AND ');

                lbFirstCriteria := False;
              end;

            if not(lbWhereAdded) then
              begin
                FSQLText.Add('WHERE ');

                lbWhereAdded := True;
              end;

            AddToSQL(lsText);
          end;
      end;

  end; {procedure, BuildWhereClause}


  { BuildGroupByClause }

  procedure BuildGroupByClause;
  var
    liIndex: Integer;
  begin

    if GroupByFieldCount = 0 then Exit;

    FSQLText.Add('GROUP BY ');
    liIndent := 9;

    for liIndex := 0 to GroupByFieldCount - 1 do
      begin
        lsText := GroupByFields[liIndex].SQLString;

        if (liIndex < GroupByFieldCount - 1) then
          lsText := lsText + ', ';

        AddToSQL(lsText);
      end; {for, each group field}

  end; {procedure, BuildGroupByClause}



  { BuildOrderByClause }

  procedure BuildOrderByClause;
  var
    liIndex: Integer;
    lField: TdaField;
  begin

    if OrderByFieldCount = 0 then Exit;

    FSQLText.Add('ORDER BY ');
    liIndent := 9;

    for liIndex := 0 to OrderByFieldCount - 1 do
      begin
        lField := OrderByFields[liIndex];

        {Advantage cannot order by an calculated field}
        if lField is TdaCalculation and IsAdvantage then Exit;

        if lField is TdaCalculation then
          lsText := IntToStr(SelectFieldCount + lField.Index + 1)
        else
          lsText := lField.SQLString;

        if not(lField.Ascending) then
          lsText := lsText + ' DESC';

        if (liIndex < OrderByFieldCount - 1) then
          lsText := lsText + ', ';

        AddToSQL(lsText);
      end;

  end;{procedure, BuildOrderByClause}


begin

  FSQLText.Clear;

  SendEventNotify(Self, ciBeforeGenerateSQL, nil);

  BuildSelectClause;

  BuildFromClause;

  BuildWhereClause;

  BuildGroupByClause;

  BuildOrderByClause;

  SendEventNotify(Self, ciAfterGenerateSQL, nil);

end; {procedure, CreateSQL}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfTableName }

function TdaSQL.IndexOfTableName(const aTableName: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;

  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;

  while not(lbFound) and (liIndex < AvailableTableCount) do
    begin
      lbFound := (CompareText(AvailableTables[liIndex].RawTableName, aTableName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, IndexOfTableName}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfSelectTableName }

function TdaSQL.IndexOfSelectTableName(const aTableName: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;

  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;

  while not(lbFound) and (liIndex < SelectTableCount) do
    begin
      lbFound := (CompareText(SelectTables[liIndex].RawTableName, aTableName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, IndexOfSelectTableName}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfTableAlias }

function TdaSQL.IndexOfTableAlias(const aTableAlias: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;

  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;

  while not(lbFound) and (liIndex < SelectTableCount) do
    begin
      lbFound := (CompareText(SelectTables[liIndex].TableAlias, aTableAlias) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, IndexOfTableAlias}

{******************************************************************************
 *
 ** G E N E R A L   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.ResolveCriteria }

function TdaSQL.ResolveCriteria(aCriteria: TdaCriteria; aLastCriteriaType: TdaCriteriaType; var aExpression: String): Boolean;
const
  SearchConditions: array[0..13] of String[11] = ('=','<>','<','<=','>','>=','LIKE','NOT LIKE',
                                                 'BETWEEN','NOT BETWEEN','IN','NOT IN','IS NULL','IS NOT NULL');
var
  lsText: String;
  lsField: String;
  lsWildCard: String;
  
  { FormatValue }
  function FormatValue(const aValue: String): String;
    var
     lDateTime: TDateTime;
     lcDateSeparator: Char;
    begin
      Result := ppTrimLeft(aValue);

      if not(aCriteria.CaseSensitive) then
        Result := Uppercase(Result);

      if (aCriteria.Field.DataType in [dtDate, dtDateTime]) then
        begin

          try
            lDateTime := ppStrToDateTime(aValue);
          except on EConvertError do
            begin
              Result := '';

              Exit;
            end;
          end;

          lcDateSeparator := DateSeparator;

          try
          DateSeparator := '/';

          {contains time component}
          if IsOracle then
            begin
              if (Pos(#32, Result) <> 0) then
                Result := FormatDateTime('DD-MMM-YYYY HH:MM:SS', lDateTime)
              else
                Result := FormatDateTime('DD-MMM-YYYY', lDateTime);
            end

          else if IsSybaseASA or IsSybaseASE or IsMSSQLServer then
            begin
              if (Pos(#32, Result) <> 0) then
                Result := FormatDateTime('YYYY/MM/DD HH:MM:SS', lDateTime)
              else
                Result := FormatDateTime('YYYY/MM/DD', lDateTime);
            end
          else if IsAdvantage then
            begin
              if (Pos(#32, Result) <> 0) or (aCriteria.Field.DataType = dtDateTime) then
                Result := FormatDateTime('YYYY-MM-DD HH:MM:SS', lDateTime)
              else
                Result := FormatDateTime('YYYY-MM-DD', lDateTime);
            end
          else if IsMSAccess then
            begin
              if (Pos(#32, Result) <> 0) or (aCriteria.Field.DataType = dtDateTime) then
                Result := FormatDateTime('YYYY-MM-DD HH::MM::SS', lDateTime)
              else
                Result := FormatDateTime('YYYY-MM-DD', lDateTime);
            end
          else
            begin
              if (Pos(#32, Result) <> 0) or (aCriteria.Field.DataType = dtDateTime) then
                Result := FormatDateTime('MM/DD/YYYY HH:MM:SS', lDateTime)
              else
                Result := FormatDateTime('MM/DD/YYYY', lDateTime);
            end;

          finally
            DateSeparator := lcDateSeparator;
          end; {try, finally}


          if IsMSAccess then
            Result := '#' + Result + '#'
          else
            Result := '''' + Result + '''';
        end

      else if (aCriteria.Field.DataType in [dtBoolean]) and
              (IsAdvantage or IsMSSQLServer or IsOracle or IsSybaseASE or IsSybaseASA) then
        begin
          if (Length(aValue) > 0) and (UpperCase(aValue[1])[1] in ['T', 'Y', '1']) then
            Result := '1'
          else
            Result := '0';
        end

      else if (aCriteria.Field.DataType in [dtBoolean]) then
        begin
          if (Length(aValue) > 0) and (UpperCase(aValue[1])[1] in ['T', 'Y', '1']) then
            Result := 'TRUE'
          else
            Result := 'FALSE';
        end

      else if (aCriteria.Field.DataType in dacaNumerics) then
        Result := ppFixUpFloatString(aValue, '')

      else if not(aCriteria.Operator in [dacoBlank, dacoNotBlank]) then
        begin

          if IsMSAccess and (CompareText(FSession.ClassName, 'TdaBDESession') = 0) then
            lsWildCard := '*'
          else
            lsWildCard := '%';

          if (aCriteria.Operator in [dacoLike, dacoNotLike]) and (Pos('_', Result) = 0) and (Pos(lsWildCard, Result) = 0) then
            Result := Result + lsWildCard;

          if (FSQLType = sqBDELocal) then
            Result := '"' + Result + '"'
          else
            Result := '''' + Result + '''';

        end;

    end;

  { ResolveOperand }
  function ResolveOperand: String;
  var
    lsValue: String;
    lsOperator: String;
    liIndex: Integer;
    lValues: TStrings;
  begin

    lsOperator := SearchConditions[Ord(aCriteria.Operator)];

    case aCriteria.Operator of

      dacoEqual, dacoNotEqual, dacoLessThan, dacoLessThanOrEqualTo,
      dacoGreaterThan, dacoGreaterThanOrEqualTo, dacoLike, dacoNotLike:
        lsValue := FormatValue(aCriteria.Value);

      dacoBlank, dacoNotBlank:
        lsValue := '';

      dacoBetween, dacoNotBetween:
        begin
          lValues := TStringList.Create;

          ppParseString(aCriteria.Value, lValues);

          if (lValues.Count = 2) then
            lsValue := FormatValue(lValues[0]) + ' AND ' + FormatValue(lValues[1])
          else
            lsValue := '';

          lValues.Free;
        end;

      dacoInList, dacoNotInList:
        begin
          lValues := TStringList.Create;

          ppParseString(aCriteria.Value, lValues);

          lsValue := '';

          for liIndex := 0 to lValues.Count - 1 do
            begin
              lsValue := lsValue + FormatValue(lValues[liIndex]);

              if (liIndex < lValues.Count - 1) then
                lsValue := lsValue + ',';
            end;

          lsValue := '(' + lsValue + ')';

          lValues.Free;
        end; {inlist}

    end; {case, operator type}


    Result := lsOperator + ' ' + lsValue;

  end; {procedure, ResolveOperand}


begin

  Result := False;

  aExpression := '';

  if (aCriteria.Field <> nil) and (aCriteria.Field.AutoSearch) and
     (aCriteria.Value = '') and not(aCriteria.Operator in [dacoBlank, dacoNotBlank]) then Exit;

  case aCriteria.CriteriaType of

    dacrBegin:
      begin
        lsText := '(';

        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND ' + lsText;
      end;

    dacrEnd:
      lsText := ')';

    dacrOR:
      lsText := ' OR ';

    dacrNOT:
      begin
        lsText := ' NOT ';

        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND' + lsText;
      end;

    dacrField:
      begin

        lsField := aCriteria.Field.SQLString;

        if (FSQLType = sqBDELocal) and not(aCriteria.CaseSensitive) then
          lsField := 'UPPER('+ lsField + ')'

        else if IsAdvantage and not(aCriteria.CaseSensitive) then
          lsField := 'UCASE('+ lsField + ')';

        lsText := '( ' + lsField + ' ' + ResolveOperand + ' )';

        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND ' + lsText;
      end;

  end; {case, Criteria type}

  aExpression := lsText;

  Result := True;
  
end; {function, ResolveCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldsForSQL }

function TdaSQL.GetFieldsForSQL(aSQL: TStrings; aList: TList): Boolean;
var
  lDataSet: TdaDataSet;
  lsMessage: String;
  lsCaption: String;
begin

  Result := True;

  lDataSet := FDataSetClass.Create(Self);

  lDataSet.DatabaseName := FDatabaseName;

  try
    lDataSet.GetFieldsForSQL(aList, aSQL);
  except
    on E: Exception do
      begin
        lsCaption := ppLoadStr(829); {SQL}
        lsMessage := ppLoadStr(777)+ #13#10 + #13#10 + E.Message; {Invalid SQL statement.}
        ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

        aList.Clear;

        Result := False;
      end;
  end; {try, except}

  lDataSet.Free;

end; {function, GetFieldsForSQL}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoinObjects }

procedure TdaSQL.CreateJoinObjects(const aTableName1, aTableName2, aJoinType, aFieldNames1, aOperators, aFieldNames2: String);
var
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lOperators: TStrings;
  lTable1: TdaTable;
  lTable2: TdaTable;
  lsFieldName1: String;
  lsFieldName2: String;
  lOperator: TdaJoinOperatorType;
  liIndex: Integer;
begin

  Clear;

  if (aTableName1 = '') or (aTableName2 = '') then Exit;
  
  lTable1 := AddTable(aTableName1);
  lTable2 := AddTable(aTableName2);

  lTable1.JoinType := daStringToJoinType(aJoinType);

  lFieldNames1 := TStringList.Create;
  ppParseString(aFieldNames1, lFieldNames1);

  lFieldNames2 := TStringList.Create;
  ppParseString(aFieldNames2, lFieldNames2);

  lOperators := TStringList.Create;
  ppParseString(aOperators, lOperators);

  for liIndex := 0 to lFieldNames1.Count - 1 do
    begin
      lsFieldName1 := lFieldNames1[liIndex];
      lsFieldName2 := lFieldNames2[liIndex];
      lOperator := daStringToJoinOperator(lOperators[liIndex]);

      lTable2.AddTableJoin(lTable1, lsFieldName1, lsFieldName2, lOperator);
    end;

  lFieldNames1.Free;
  lFieldNames2.Free;
  lOperators.Free;

end; {function, CreateJoinObjects}

{------------------------------------------------------------------------------}
{ TdaSQL.NameToSQLString }

procedure TdaSQL.NameToSQLString(var aName: String);
begin
  if (Length(Trim(aName)) = 0) then Exit;

  if daContainsInvalidChars(aName) or IsSQLReservedWord(aName) then
    begin
      if IsMSAccess then
        aName := '[' + aName + ']'
      else
        aName := '"' + aName + '"';
    end;

end; {function, NameToSQLString}

{******************************************************************************
 *
 ** C H I L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChild.Assign }

procedure TdaChild.Assign(Source: TPersistent);
begin

  if not(Source is TdaChild) then Exit;

  {do call direct 'set' routine here, calling routine should set the Parent after
   calling assign}
  {SetTheChildType(TdaChild(Source).ChildType);}

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaChild.HasParent - tells the form not to save this component to the .DFM
                       because it is a sub-component of another component}

function TdaChild.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChild.Index }

function TdaChild.Index: Integer;
begin
  if (Parent <> nil) then
    Result := Parent.IndexOfChild(Self)
  else
    Result := -1;
end; {function, Index}

{------------------------------------------------------------------------------}
{ TdaChild.GetSQL }

function TdaChild.GetSQL: TdaSQL;
begin
  if (Parent is TdaSQL) then
    Result := TdaSQL(Parent)

  else if (Owner is TdaSQL) then
    Result := TdaSQL(Owner)

  else if (Parent is TdaChild) then
    Result := TdaChild(Parent).GetSQL

  else
    Result := nil;
end; {procedure, GetSQL}

{******************************************************************************
 *
 ** T A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaTable.Create }

constructor TdaTable.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactSelectTable);

  FJoinable := True;
  FJoinableTableNames := TStringList.Create;
  FTableJoins := TList.Create;

  Clear;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaTable.Destroy }

destructor TdaTable.Destroy;
begin

  daFreeChildren(FTableJoins);

  FJoinableTableNames.Free;
  FTableJoins.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaTable.IndexOfFirstJoinTable }

function TdaTable.IndexOfFirstJoinTable(aSQL: TdaSQL): Integer;
var
  liIndex: Integer;
  lsTableName: String;
begin

  if (aSQL.SelectTableCount > 0) and (aSQL.DataDictionary <> nil) and (aSQL.DataDictionary.AutoJoin) and not(aSQL.DataDictionary.AllowManualJoins) then
    begin
      Result := -1;

      if not(FJoinable) then Exit;
      
      liIndex := aSQL.SelectTableCount - 1;

      while (Result = -1) and (liIndex <> -1) do
        begin
          lsTableName := aSQL.SelectTables[liIndex].RawTableName;

          if (FJoinableTableNames.IndexOf(lsTableName) <> -1) then
            Result := liIndex
          else
            Dec(liIndex);
        end;
    end
  else
    begin
      if (aSQL.SelectTableCount > 0) then
        Result := aSQL.SelectTableCount - 1
      else
        Result := -1;
    end;

end; {function, IndexOfFirstJoinTable}

{------------------------------------------------------------------------------}
{ TdaTable.UpdateJoinable }

procedure TdaTable.UpdateJoinable(aSelectedTables: TStrings);
var
  lbFound: Boolean;
  liIndex: Integer;
  lsTableName: String;
begin

  if (aSelectedTables.Count = 0) then
    FJoinable := True

  else if (FJoinableTableNames.Count = 0) then
    FJoinable := False

  else if (aSelectedTables.IndexOf(RawTableName) <> -1) then
    begin
      if (FJoinableTableNames.IndexOf(RawTableName) = -1) then
        FJoinable := False
      else
        FJoinable := True;
    end

  else
    begin
      lbFound := False;
      liIndex := 0;

      while not(lbFound) and (liIndex < aSelectedTables.Count) do
        begin
          lsTableName := aSelectedTables[liIndex];

          if (FJoinableTableNames.IndexOf(lsTableName) <> -1) then
            lbFound := True
          else
            Inc(liIndex);

        end;
        
      FJoinable := lbFound;
    end;


end; {procedure, UpdateJoinable}

{------------------------------------------------------------------------------}
{ TdaTable.Loaded }

procedure TdaTable.Loaded;
begin

  inherited Loaded;

  if (FAlias = '') then
    FAlias := FTableAlias;

end; {destructor, Loaded}

{------------------------------------------------------------------------------}
{ TdaTable.Assign }

procedure TdaTable.Assign(Source: TPersistent);
var
  lSourceTable: TdaTable;
begin

  inherited Assign(Source);

  if not(Source is TdaTable) then Exit;

  Clear;
  
  lSourceTable := TdaTable(Source);

  FAlias  := lSourceTable.Alias;
  FTableAlias  := lSourceTable.TableAlias;
  FOwnerName := lSourceTable.OwnerName;
  FTableName := lSourceTable.TableName;
  FSQLAlias := lSourceTable.SQLAlias;
  FJoinType := lSourceTable.JoinType;
  FJoinTable := lSourceTable.JoinTable;

  daAssignChildren(lSourceTable.FTableJoins, Owner, Self);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaTable.SaveComponents }

procedure TdaTable.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  for liIndex := 0 to (FTableJoins.Count - 1) do
    Proc(FTableJoins[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaTable.Clear }

procedure TdaTable.Clear;
begin

  FAlias := '';
  FOwnerName := '';
  FTableAlias := '';
  FTableName := '';
  FSQLAlias := '';
  FJoinType := dajtInner;
  FJoinTable := '';

  daFreeChildren(FTableJoins);

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaTable.AddTableJoin }

function TdaTable.AddTableJoin(aTable: TdaTable; const aFieldName1, aFieldName2: String; aType: TdaJoinOperatorType): TdaTableJoin;
var
  lTableJoin: TdaTableJoin;
  lField1: TdaField;
  lField2: TdaField;
  lSQL: TdaSQL;
begin

  Result := nil;

  lSQL := GetSQL;

  if (lSQL = nil) then Exit;

  lTableJoin := TdaTableJoin.Create(Self);

  lTableJoin.Operator := aType;

  lField1 := lSQL.GetFieldForTable(aTable, aFieldName1);
  lField2 := lSQL.GetFieldForTable(Self, aFieldName2);

  if (lField1 <> nil) then
    begin
      lField1.ChildType := Ord(dactForeignField);
      lField1.Parent := lTableJoin;
    end;

  if (lField2 <> nil) then
    begin
      lField2.ChildType := Ord(dactLocalField);
      lField2.Parent := lTableJoin;
    end;

  lTableJoin.Parent := Self;

  Result := lTableJoin;
  
end; {function, AddTableJoin}

{------------------------------------------------------------------------------}
{ TdaTable.AddChild }

procedure TdaTable.AddChild(aChild: TppRelative);
begin

  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Add(aChild)
  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaTable.InsertChild }

procedure TdaTable.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Insert(aPosition, aChild)
  else
    inherited InsertChild(aPosition, aChild);

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaTable.IndexOfChild }

function TdaTable.IndexOfChild(aChild: TppRelative): Integer;
begin

  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    Result := FTableJoins.IndexOf(aChild)
  else
    Result := inherited IndexOfChild(aChild);

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TdaTable.RemoveChild }

function TdaTable.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Delete(liIndex)
  else
    Result := inherited RemoveChild(aChild);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaTable.GetRawTableName }

function TdaTable.GetRawTableName: String;
begin
  if (Length(FOwnerName) > 0) then
    Result := FOwnerName + '.' + FTableName
  else
    Result := FTableName;
end; {function, GetRawTableName}

{------------------------------------------------------------------------------}
{ TdaTable.SetRawTableName }

procedure TdaTable.SetRawTableName(const aTableName: String);
var
  lsTable: String;
  lsOwner: String;
  lbFileBased: Boolean;
begin

  ppStripOffTableName(aTableName, lsTable, lsOwner, lbFileBased);

  if (lbFileBased) then
    begin
      FOwnerName := '';
      FTableName := lsTable + '.' + lsOwner;
    end
  else
    begin
      FOwnerName := lsOwner;
      FTableName := lsTable;
    end;

end; {procedure, SetRawTableName}

{------------------------------------------------------------------------------}
{ TdaTable.DataName }

function TdaTable.DataName: String;
var
  lSQL: TdaSQL;
  lsOwnerName: String;
  lsTableName: String;
begin

  lSQL := GetSQL;

  if (lSQL <> nil) and (Length(FOwnerName) > 0) then
    begin
      lsOwnerName := FOwnerName;
      lsTableName := FTableName;

      lSQL.NameToSQLString(lsOwnerName);
      lSQL.NameToSQLString(lsTableName);

      Result := lsOwnerName + '.' + lsTableName;
    end
  else
    begin
      lsTableName := GetRawTableName;

      lSQL.NameToSQLString(lsTableName);

      Result := lsTableName;
    end;
    
end; {function, DataName}

{------------------------------------------------------------------------------}
{ TdaTable.SQLText }

function TdaTable.SQLText: String;
var
  lsTableName: String;
  lsOwnerName: String;
  lsSQLAlias: String;
  lSQL: TdaSQL;
begin

  lSQL := GetSQL;

  lsOwnerName := FOwnerName;
  lsTableName := FTableName;
  lsSQLAlias := FSQLAlias;

  if (lSQL <> nil) and (lSQL.SQLType = sqBDELocal) then
    begin
      lSQL.NameToSQLString(lsSQLAlias);

      Result := '"' + lsTableName + '"' + ' ' + lsSQLAlias
    end

  else
    begin
      lSQL.NameToSQLString(lsOwnerName);
      lSQL.NameToSQLString(lsTableName);
      lSQL.NameToSQLString(lsSQLAlias);

      if (Length(lsOwnerName) > 0) then
        Result := lsOwnerName + '.' + lsTableName + ' ' + lsSQLAlias
      else
        Result := lsTableName + ' ' + lsSQLAlias;
    end;

end; {procedure, SQLText}

{------------------------------------------------------------------------------}
{ TdaTable.SQLJoinTypeDesc }

function TdaTable.SQLJoinTypeDesc: String;
var
  lSQL: TdaSQL;
begin

  lSQL := GetSQL;

  if (lSQL <> nil) and (lSQL.SQLType = sqSQL1) then
    begin
      case FJoinType of
        dajtNone:       Result := '';
        dajtInner:      Result := '';
        dajtOuter:      Result := '*=*';
        dajtLeftOuter:  Result := '*=';
        dajtRightOuter: Result := '=*';
      end;
    end
  else
    begin
      case FJoinType of
        dajtNone:       Result := '';
        dajtInner:      Result := 'INNER JOIN';
        dajtOuter:      Result := 'FULL OUTER JOIN';
        dajtLeftOuter:  Result := 'LEFT OUTER JOIN';
        dajtRightOuter: Result := 'RIGHT OUTER JOIN';
      end;
    end;

end; {procedure, SQLJoinTypeDesc}

{------------------------------------------------------------------------------}
{ TdaTable.JoinTableSQLAlias }

function TdaTable.JoinTableSQLAlias: String;
begin
  if (TableJoinCount > 0) then
    Result := TableJoins[0].ForeignField.TableSQLAlias
  else
    Result := '';
end; {function, JoinTableSQLAlias}

{------------------------------------------------------------------------------}
{ TdaTable.JoinTypeDesc }

function TdaTable.JoinTypeDesc: String;
begin
  Result := daGetJoinDesc(FJoinType);
end; {procedure, JoinTypeDesc}

{------------------------------------------------------------------------------}
{ TdaTable.GetTableJoin }

function TdaTable.GetTableJoin(aIndex: Integer): TdaTableJoin;
begin
  Result := TdaTableJoin(FTableJoins[aIndex]);
end; {function, GetTableJoin}

{------------------------------------------------------------------------------}
{ TdaTable.GetTableJoinCount }

function TdaTable.GetTableJoinCount: Integer;
begin
  Result := FTableJoins.Count;
end; {function, GetTableJoinCount}

{------------------------------------------------------------------------------}
{ TdaTable.JoinTypeString }

function TdaTable.JoinTypeString: String;
begin
  Result := daJoinTypeToString(FJoinType);
end; {function, JoinTypeString}

{------------------------------------------------------------------------------}
{ TdaTable.JoinFieldNames1 }

function TdaTable.JoinFieldNames1: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin

  Result := '';

  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);

      Result := Result + lJoin.LocalField.FieldName;

      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;

end; {function, JoinFieldNames1}

{------------------------------------------------------------------------------}
{ TdaTable.JoinFieldNames2 }

function TdaTable.JoinFieldNames2: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin

  Result := '';

  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);

      Result := Result + lJoin.ForeignField.FieldName;

      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;

end; {function, JoinFieldNames2}

{------------------------------------------------------------------------------}
{ TdaTable.JoinOperators }

function TdaTable.JoinOperators: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin

  Result := '';

  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);

      Result := Result + daJoinOperatorToString(lJoin.Operator);

      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;

end; {function, JoinOperators}

{******************************************************************************
 *
 ** F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaField.Create }

constructor TdaField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactSelectField);

  Clear;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaField.Destroy }

destructor TdaField.Destroy;
begin

  {if ChildType = Ord(dactLocalField) then
    ShowMessage('TdaField.Destroy: LocalField')
  else if ChildType = Ord(dactForeignField) then
    ShowMessage('TdaField.Destroy: ForeignField');  }

  inherited Destroy;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaField.Assign }

procedure TdaField.Assign(Source: TPersistent);
var
  lSourceField: TdaField;
begin

  inherited Assign(Source);

  if not(Source is TdaField) then Exit;

  lSourceField := TdaField(Source);

  FAlias         := lSourceField.Alias;
  FAscending     := lSourceField.Ascending;
  FAutoSearch    := lSourceField.AutoSearch;
  FDataType      := lSourceField.DataType;
  FDisplayFormat := lSourceField.DisplayFormat;
  FFieldAlias    := lSourceField.FieldAlias;
  FFieldName     := lSourceField.FieldName;
  FMandatory     := lSourceField.Mandatory;
  FSelectable    := lSourceField.Selectable;
  FSearchable    := lSourceField.Searchable;
  FSortable      := lSourceField.Sortable;
  FSQLFieldName  := lSourceField.SQLFieldName;
  FTableAlias    := lSourceField.TableAlias;
  FTableName     := lSourceField.TableName;
  FTablesQLAlias := lSourceField.TableSQLAlias;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaField.Clear }

procedure TdaField.Clear;
begin

  FAlias := '';
  FAscending := True;
  FAutoSearch := False;
  FDataType := dtString;
  FDisplayFormat := '';
  FFieldAlias := '';
  FFieldName := '';
  FMandatory := False;
  FSearchable := True;
  FSelectable := True;
  FSelectAll := False;
  FSortable := True;
  FSQLFieldName := '';
  FTableAlias := '';
  FTableName := '';
  FTablesQLAlias := '';

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaField.GetDescription }

function TdaField.GetDescription: String;
begin
  Result := TableAlias + '.' + FieldAlias + ' ' + OrderByDesc;
end; {procedure, GetDescription}

{------------------------------------------------------------------------------}
{ TdaField.OrderByDesc }

function TdaField.OrderByDesc: String;
begin

  Result := '';

  if (ChildType <> Ord(dactOrderByField)) then Exit;

  if not(Ascending) then
    Result := '(' + ppLoadStr(752) + ')'; {Descending}

end; {procedure, OrderByDesc}

{------------------------------------------------------------------------------}
{ TdaField.SQLString }

function TdaField.SQLString: String;
var
  lsTable: String;
  lsField: String;
  lSQL: TdaSQL;
begin

  if (FTableSQLAlias = '') or (FFieldName = '') then Exit;

  lSQL := GetSQL;

  lsTable := FTableSQLAlias;
  lsField := FFieldName;

  lSQL.NameToSQLString(lsTable);
  lSQL.NameToSQLString(lsField);

  Result := lsTable + '.' + lsField;

end; {function, SQLString}

{******************************************************************************
 *
 ** C A L C U L A T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCalculation.Create }

constructor TdaCalculation.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactCalcField);

  Clear;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCalculation.Assign }

procedure TdaCalculation.Assign(Source: TPersistent);
var
  lSource: TdaCalculation;
begin

  inherited Assign(Source);

  if not(Source is TdaCalculation) then Exit;

  lSource := TdaCalculation(Source);

  FCalcType := lSource.CalcType;
  FExpression := lSource.Expression;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaCalculation.Clear }

procedure TdaCalculation.Clear;
begin

  inherited Clear;

  FCalcType := dacaSum;
  FExpression := '';

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaCalculation.GetDescription }

function TdaCalculation.GetDescription: String;
begin

  {build text description of field}
  if (CalcType = dacaCount) then
    Result := ppLoadStr(740) + '(*)' {Count(*)}
  else if (CalcType = dacaExpression) then
    Result := FExpression
  else
    Result := daGetCalcDesc(CalcType) + '(' + TableAlias + '.' + FieldAlias + ')';

  Result := Result + ' ' + OrderByDesc;

end; {procedure, GetDescription}

{------------------------------------------------------------------------------}
{ TdaCalculation.SetCalcType }

procedure TdaCalculation.SetCalcType(aCalcType: TdaCalcType);
begin

  FCalcType := aCalcType;

  if (csLoading in ComponentState) or (csReading in ComponentState) then Exit;
  
  if Assigned(FOnCalcTypeChange) then FOnCalcTypeChange(Self);

end; {procedure, SetCalcType}

{------------------------------------------------------------------------------}
{ TdaCalculation.GetCalcFieldAlias }

function TdaCalculation.GetCalcFieldAlias: String;
begin

  Result := '';

  if (CalcType = dacaCount) then
    Result := ppLoadStr(740) + '(*)' {Count(*)}

  else if (CalcType = dacaExpression) then
    Result := FExpression

  else
    Result := daGetCalcDesc(CalcType) + '(' + FieldAlias + ')';

end; {procedure, GetCalcFieldAlias}

{------------------------------------------------------------------------------}
{ TdaCalculation.FunctionDesc }

function TdaCalculation.FunctionDesc: String;
begin
  Result := daGetCalcDesc(FCalcType);
end; {function, FunctionDesc}

{------------------------------------------------------------------------------}
{ TdaCalculation.SQLString }

function TdaCalculation.SQLString: String;
begin

  Result := inherited SQLString;

  case FCalcType of
    dacaCount: Result := 'COUNT(*)';
    dacaAvg:   Result := 'AVG(' + Result + ')';
    dacaSum:   Result := 'SUM(' + Result + ')';
    dacaMin:   Result := 'MIN(' + Result + ')';
    dacaMax:   Result := 'MAX(' + Result + ')';
    dacaExpression: Result := FExpression;
  end;

end; {function, SQLString}

{******************************************************************************
 *
 ** C R I T E R I A
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCriteria.Create }

constructor TdaCriteria.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactCriteria);

  FCaseSensitive := True;
  FCriteriaType := dacrField;
  FField := nil;
  FOperator := dacoEqual;
  FShowAllValues := False;
  FValue := '';
  FLevel := 0;
  FNumericValues := TList.Create;
  FNumericValuesOutOfSync := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCriteria.Destroy }

destructor TdaCriteria.Destroy;
begin

  FreeNumericValues;

  FNumericValues.Free;
  FField.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaCriteria.Assign }

procedure TdaCriteria.Assign(Source: TPersistent);
var
  lSourceCriteria: TdaCriteria;
  lField: TdaField;
begin

  inherited Assign(Source);

  if not(Source is TdaCriteria) then Exit;

  lSourceCriteria := TdaCriteria(Source);

  FCaseSensitive := lSourceCriteria.CaseSensitive;
  FCriteriaType := lSourceCriteria.CriteriaType;
  FOperator := lSourceCriteria.Operator;
  FValue := lSourceCriteria.Value;
  FShowAllValues := lSourceCriteria.ShowAllValues;

  if (FField <> nil) then
    FField.Free;

  if (lSourceCriteria.Field <> nil) then
    begin
      lField := TdaField.Create(Self);
      lField.Assign(lSourceCriteria.Field);
      lField.ChildType := lSourceCriteria.Field.ChildType;
      lField.Parent := Self;
    end;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaCriteria.Loaded }

procedure TdaCriteria.Loaded;
var
  liIndex: Integer;
  ldValue: Double;
begin

  inherited Loaded;

  if not(IsNumeric) then Exit;


  if (Length(FValue) > 0) and (FNumericValues.Count = 0) then
    begin
      FNumericValuesOutOfSync := True;

      UpdateNumericValues;
    end;

  {update string version of criteria}
  FValue := '';

  for liIndex := 0 to FNumericValues.Count - 1 do
    begin
      if (Length(FValue) > 0) then
        FValue := FValue + ',';

      ldValue := TdaNumericValue(FNumericValues[liIndex]).Value;

      if (FField.DataType in [dtDate, dtDateTime]) then
        FValue := FValue + DateTimeToStr(ldValue)

      else if (FField.DataType = dtInteger) then
        FValue := FValue + IntToStr(Trunc(ldValue))

      else if (FField.DataType in dacaNumerics) then
        FValue := FValue + FloatToStr(ldValue);
    end;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaCriteria.GetValue }

function TdaCriteria.GetValue: String;
begin

  Result := FValue;

  if (csWriting in ComponentState) or (csDestroying in ComponentState) then Exit;

  UpdateNumericValues;

end; {procedure, GetValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.SetValue }

procedure TdaCriteria.SetValue(const aValue: String);
begin

  FValue := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) or not(IsNumeric) then Exit;

  FNumericValuesOutOfSync := True;

end; {procedure, SetValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.FreeNumericValues }

procedure TdaCriteria.FreeNumericValues;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FNumericValues.Count - 1 do
    TObject(FNumericValues[0]).Free;

  FNumericValues.Clear;

end; {procedure, FreeNumericValues}

{------------------------------------------------------------------------------}
{ TdaCriteria.AddNumericValue }

procedure TdaCriteria.AddNumericValue(const aValue: String);
var
  lNumericValue: TdaNumericValue;
  ldValue: Double;
begin

  if (FField = nil) or not(IsNumeric) then Exit;

  if (FField.DataType in [dtDate, dtDateTime]) then
      try
        ldValue := ppStrToDateTime(aValue)
      except on EConvertError do
        ldValue := Now;
      end

  else if (FField.DataType in [dtInteger]) then
      try
        ldValue := StrToInt(aValue)
      except on EConvertError do
        ldValue := 0;
      end

  else if (FField.DataType in dacaNumerics) then
      try
        ldValue := StrToFloat(aValue)
      except on EConvertError do
        ldValue := 0;
      end

  else
    ldValue := 0;

  lNumericValue := TdaNumericValue.Create(Self);
  lNumericValue.Value := ldValue;
  lNumericValue.Parent := Self;

end; {procedure, AddNumericValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.IsNumeric }

function TdaCriteria.IsNumeric: Boolean;
begin
  Result := (FField <> nil) and ((FField.DataType in dacaNumerics) or (FField.DataType in [dtDate, dtDateTime]));
end; {procedure, IsNumeric}

{------------------------------------------------------------------------------}
{ TdaCriteria.UpdateNumericValues }

procedure TdaCriteria.UpdateNumericValues;
var
  liIndex: Integer;
  lsValue: String;
  lValues: TStrings;
begin

  if not(FNumericValuesOutOfSync) then Exit;

  FNumericValuesOutOfSync := False;

  FreeNumericValues;

  if not(IsNumeric) then Exit;

  lValues := TStringList.Create;

  ppParseString(FValue, lValues);

  for liIndex := 0 to lValues.Count - 1 do
    begin
      lsValue := lValues[liIndex];

      AddNumericValue(lsValue);
    end;

  lValues.Free;

end; {procedure, UpdateNumericValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.SaveComponents }

procedure TdaCriteria.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  if (FField <> nil) then
    Proc(FField);

  for liIndex := 0 to FNumericValues.Count - 1 do
    Proc(FNumericValues[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaCriteria.AddChild }

procedure TdaCriteria.AddChild(aChild: TppRelative);
begin

  if (aChild is TdaField) then
    begin
      FField.Free;

      FField := TdaField(aChild);
    end

  else if (aChild is TdaNumericValue) then
    FNumericValues.Add(aChild)

  else
    inherited AddChild(aChild);

end; {function, AddChild}

{------------------------------------------------------------------------------}
{ TdaCriteria.RemoveChild }

function TdaCriteria.RemoveChild(aChild: TppRelative): Integer;
begin

  if (FField = aChild) then
    begin
      FField := nil;

      Result := 0;
    end

  else if (aChild is TdaNumericValue) then
    Result := FNumericValues.Remove(aChild)

  else
    Result := inherited RemoveChild(aChild);

end; {function, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaCriteria.Description }

function TdaCriteria.Description: String;
begin

  case FCriteriaType of
    dacrField:  Result := FField.Description + ' ' + OperatorDesc + ' ' + FValue;
    dacrBegin:  Result := ppLoadStr(731); {begin}
    dacrEnd:    Result := ppLoadStr(758); {end}
    dacrOR:     Result := ppLoadStr(803); {OR}
    dacrNOT:    Result := ppLoadStr(794); {NOT}
  end;

end; {function, Description}

{------------------------------------------------------------------------------}
{ TdaCriteria.AutoSearchDesc }

function TdaCriteria.AutoSearchDesc: String;
begin
  if (FField <> nil) and (FField.AutoSearch) then
    Result := 'Yes'
  else
    Result := '';
end; {procedure, AutoSearchDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.MandatoryDesc }

function TdaCriteria.MandatoryDesc: String;
begin
  if (FField <> nil) and (FField.Mandatory) then
    Result := 'Yes'
  else
    Result := '';
end; {procedure, MandatoryDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.ShowAllDesc }

function TdaCriteria.ShowAllDesc: String;
begin
  if (FField <> nil) and (ShowAllValues) then
    Result := 'Yes'
  else
    Result := '';
end; {procedure, ShowAllDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.OperatorDesc }

function TdaCriteria.OperatorDesc: String;
begin
  Result := daGetOperatorDesc(FOperator);
end; {procedure, OperatorDesc}

{******************************************************************************
 *
 ** T A B L E  J O I N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaTableJoin.Create }

constructor TdaTableJoin.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactTableJoin);

  FForeignField := nil;
  FLocalField := nil;

  FOperator := dajoEqual;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaTableJoin.Destroy }

destructor TdaTableJoin.Destroy;
begin

  FForeignField.Free;
  FLocalField.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaTableJoin.Assign }

procedure TdaTableJoin.Assign(Source: TPersistent);
var
  lSourceTableJoin: TdaTableJoin;
  lField: TdaField;
begin

  inherited Assign(Source);

  if not(Source is TdaTableJoin) then Exit;

  lSourceTableJoin := TdaTableJoin(Source);

  FOperator := lSourceTableJoin.Operator;

  FForeignField.Free;
  FLocalField.Free;

  lField := TdaField.Create(Owner);
  lField.Assign(lSourceTableJoin.ForeignField);
  lField.ChildType := Ord(dactForeignField);
  lField.Parent := Self;

  lField := TdaField.Create(Owner);
  lField.Assign(lSourceTableJoin.LocalField);
  lField.ChildType := Ord(dactLocalField);
  lField.Parent := Self;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaTableJoin.SaveComponents }

procedure TdaTableJoin.SaveComponents(Proc: TGetChildProc);
begin

  inherited SaveComponents(Proc);

  if (FLocalField <> nil) then
    Proc(FLocalField);

  if (FForeignField <> nil) then
    Proc(FForeignField);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaTableJoin.AddChild }

procedure TdaTableJoin.AddChild(aChild: TppRelative);
begin

  case TdaChildType(aChild.ChildType) of

    dactLocalField:
      begin
        FLocalField.Free;

        FLocalField := TdaField(aChild);
      end;

    dactForeignField:
      begin
        FForeignField.Free;

        FForeignField := TdaField(aChild);
      end;

  end;

end; {function, AddChild}

{------------------------------------------------------------------------------}
{ TdaTableJoin.RemoveChild }

function TdaTableJoin.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := 0;

  if (FLocalField = aChild) then
    FLocalField := nil

  else if (FForeignField = aChild) then
    FForeignField := nil

  else
    Result := inherited RemoveChild(aChild);

end; {function, RemoveChild}

{******************************************************************************
 *
 ** G E N E R A L   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daInvalidChar }

function daInvalidChar(const aName: String): Integer;
begin

  Result := 0;

  if (Length(aName) > 0) and (StrToIntDef(aName[1], -1) in [0..9]) then
    Result := 1

  else
    begin
      if (Result = 0) then Result := Pos(' ', aName);
      if (Result = 0) then Result := Pos('/', aName);
      if (Result = 0) then Result := Pos('.', aName);
      if (Result = 0) then Result := Pos(',', aName);
      if (Result = 0) then Result := Pos('-', aName);
    end;
end; {function, daInvalidChar}

{------------------------------------------------------------------------------}
{ daContainsInvalidChars }

function daContainsInvalidChars(const aFieldName: String): Boolean;
begin

  Result := (daInvalidChar(aFieldName) <> 0);

  if not(Result) and (Length(aFieldName) > 0) then Result := (aFieldName[1] = '_');

end; {function, daContainsInvalidChars}

{------------------------------------------------------------------------------}
{ daRestoreAvailableTable }

function daRestoreAvailableTable(aTable: TdaTable; aAvailableTables, aAvailableTableList: TList): TdaTable;
var
  liPosition: Integer;
  liPosition2: Integer;
  lTable: TdaTable;
  lTable2: TdaTable;
  liIndex: Integer;
  lbFound: Boolean;
begin

  Result := nil;

  liPosition := daFindTable(aTable, aAvailableTables);

  if (liPosition = -1) then Exit;

  lTable := TdaTable(aAvailableTables[liPosition]);

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aAvailableTableList.Count) do
    begin
      lTable2 := TdaTable(aAvailableTableList[liIndex]);

      liPosition2 := daFindTable(lTable2, aAvailableTables);

      if (liPosition2 > liPosition) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  lTable.Tag := liIndex;

  aAvailableTableList.Insert(liIndex, lTable);

  Result := lTable;

end; {procedure, daRestoreAvailableTable}

{------------------------------------------------------------------------------}
{ daRestoreAvailableField }

function daRestoreAvailableField(aField: TdaField; aAvailableFields, aAvailableFieldList: TList): TdaField;
var
  liPosition: Integer;
  liPosition2: Integer;
  lField: TdaField;
  lField2: TdaField;
  liIndex: Integer;
  lbFound: Boolean;
begin

  Result := nil;

  liPosition := daFindField(aField, aAvailableFields);

  if (liPosition = -1) then Exit;

  lField := TdaField(aAvailableFields[liPosition]);

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aAvailableFieldList.Count) do
    begin
      lField2 := TdaField(aAvailableFieldList[liIndex]);

      liPosition2 := daFindField(lField2, aAvailableFields);

      if (liPosition2 > liPosition) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  lField.Tag := liIndex;

  aAvailableFieldList.Insert(liIndex, lField);

  Result := lField;

end; {procedure, daRestoreAvailableField}

{------------------------------------------------------------------------------}
{ daInsertString }

function daInsertString(aList: TStrings; aPosition: Integer; const aString: String): Integer;
begin

  if (aList.Count = 0) then
    aPosition := 0

  else if (aPosition > aList.Count - 1) then
    aPosition := aList.Count;

  aList.Insert(aPosition, aString);

  Result := aPosition;
  
end; {function, daInsertString}

{------------------------------------------------------------------------------}
{ daStringToJoinOperator }

function daStringToJoinOperator(const aOperator: String): TdaJoinOperatorType;
begin

  if (aOperator = '=') then
    Result := dajoEqual

  else if (aOperator = '<>') then
    Result := dajoNotEqual

  else if (aOperator = '<') then
    Result := dajoLessThan

  else if (aOperator = '<=') then
    Result := dajoLessThanOrEqualTo

  else if (aOperator = '>') then
    Result := dajoGreaterThan

  else if (aOperator = '>=') then
    Result := dajoGreaterThanOrEqualTo

  else
    Result := dajoEqual;

end; {function, daStringToJoinOperator}

{------------------------------------------------------------------------------}
{ daJoinOperatorToString }

function daJoinOperatorToString(aType: TdaJoinOperatorType): String;
begin
  case aType of
    dajoEqual:                Result := '=';
    dajoNotEqual:             Result := '<>';
    dajoLessThan:             Result := '<';
    dajoLessThanOrEqualTo:    Result := '<=';
    dajoGreaterThan:          Result := '>';
    dajoGreaterThanOrEqualTo: Result := '>=';
  end;
end; {function, daJoinOperatorToString}

{------------------------------------------------------------------------------}
{ daDataTypeToString }

function daDataTypeToString(aDataType: TppDataType): String;
begin
  Result := ppGetEnumName(TypeInfo(TppDataType), Ord(aDataType));
end; {function, daDataTypeToString}

{------------------------------------------------------------------------------}
{ daJoinTypeToString }

function daJoinTypeToString(const aJoinType: TdaJoinType): String;
begin
  Result := ppGetEnumName(TypeInfo(TdaJoinType), Ord(aJoinType));
end; {function, daJoinTypeToString}

{------------------------------------------------------------------------------}
{ daStringToJoinType }

function daStringToJoinType(const aJoinType: String): TdaJoinType;
begin
  Result := TdaJoinType(ppGetEnumStringAsInteger(TypeInfo(TdaJoinType), aJoinType));
end; {function, daStringToJoinType}

{------------------------------------------------------------------------------}
{ daGetJoinDesc }

function daGetJoinDesc(aType: TdaJoinType): String;
begin
  case aType of
    dajtNone:       Result := '';
    dajtInner:      Result := ppLoadStr(773); {Inner}
    dajtOuter:      Result := ppLoadStr(765); {Full Outer}
    dajtLeftOuter:  Result := ppLoadStr(784); {Left Outer}
    dajtRightOuter: Result := ppLoadStr(815); {Right Outer}
  end;
end; {procedure, daGetJoinDesc}

{------------------------------------------------------------------------------}
{ daFindFieldForName }

function daFindFieldForName(const aTableName, aFieldName: String; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList[liIndex]);

      lbFound := (CompareText(aTableName, lField.TableName) = 0) and
                 (CompareText(aFieldName, lField.FieldName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindFieldForName}

{------------------------------------------------------------------------------}
{ daFindField }

function daFindField(aField: TdaField; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  if (aField = nil) then Exit;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList[liIndex]);

      lbFound := (CompareText(aField.TableName, lField.TableName) = 0) and
                 (CompareText(aField.FieldName, lField.FieldName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindField}

{------------------------------------------------------------------------------}
{ daFindFieldInStrings }

function daFindFieldInStrings(aField: TdaField; aList: TStrings): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;
  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList.Objects[liIndex]);

      if (CompareText(aField.TableName, lField.TableName) = 0) and
         (CompareText(aField.FieldName, lField.FieldName) = 0) then
         lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindFieldInStrings}

{------------------------------------------------------------------------------}
{ daFindTable }

function daFindTable(aTable: TdaTable; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lTable: TdaTable;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lTable := TdaTable(aList[liIndex]);

      if (CompareText(aTable.TableName, lTable.TableName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindTable}

{------------------------------------------------------------------------------}
{ daCopyList }

procedure daCopyList(aSourceList, aTargetList: TList; aCopyFilter: TdaCopyFilterType);
var
  liIndex: Integer;
  lField: TdaField;
  lbAdd: Boolean;
begin

  if (aCopyFilter = daftAll) then
    begin
      for liIndex := 0 to aSourceList.Count - 1 do
        aTargetList.Add(aSourceList[liIndex]);
    end
  else
    begin

      for liIndex := 0 to aSourceList.Count - 1 do
        begin
          lField := TdaField(aSourceList[liIndex]);

          case aCopyFilter of
            daftSelectable:  lbAdd := lField.Selectable;
            daftSearchable:  lbAdd := lField.Searchable;
            daftSortable:    lbAdd := lField.Sortable;
          else
            lbAdd := False;
          end;

          if lbAdd then
            aTargetList.Add(aSourceList[liIndex]);

        end;

    end;

end; {procedure, daCopyList}

{------------------------------------------------------------------------------}
{ daAssignChildren }

procedure daAssignChildren(aList: TList; aOwner: TComponent; aParent: TppRelative);
var
  liIndex: Integer;
  lChild: TdaChild;
  lNewChild: TdaChild;
  lClass: TdaChildClass;
begin

  for liIndex := 0 to aList.Count - 1 do
    begin
      lChild := TdaChild(aList[liIndex]);

      {get an instance of the class}
      lClass := TdaChildClass(lChild.ClassType);

      {instantiate a data view of the selected type}
      if (lClass <> nil) then
        begin
          lNewChild := lClass.Create(aOwner);
          lNewChild.Assign(lChild);
          lNewChild.ChildType := lChild.ChildType;
          lNewChild.Parent := aParent;
        end;

  end; {each draw command}

end; {procedure, daAssignChildren}

{------------------------------------------------------------------------------}
{ daFreeChildren }

procedure daFreeChildren(aList: TList);
var
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    TdaChild(aList[liIndex]).Free;

  aList.Clear;

end; {procedure, daFreeChildren}

{------------------------------------------------------------------------------}
{ daFreeChildrenInStrings }

procedure daFreeChildrenInStrings(aList: TStrings);
var
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    TdaChild(aList.Objects[liIndex]).Free;

  aList.Clear;

end; {procedure, daFreeChildrenInStrings}

{------------------------------------------------------------------------------}
{ daGetOperatorDesc }

function daGetOperatorDesc(aOperator: TdaCriteriaOperatorType): String;
begin

  case aOperator of
    dacoEqual:                Result := '=';
    dacoNotEqual:             Result := '<>';
    dacoLessThan:             Result := '<';
    dacoLessThanOrEqualTo:    Result := '<=';
    dacoGreaterThan:          Result := '>';
    dacoGreaterThanOrEqualTo: Result := '>=';
    dacoLike:                 Result := ppLoadStr(785); {Like}
    dacoNotLike:              Result := ppLoadStr(798); {Not Like}
    dacoBetween:              Result := ppLoadStr(732); {Between}
    dacoNotBetween:           Result := ppLoadStr(795); {Not Between}
    dacoInList:               Result := ppLoadStr(772); {In List}
    dacoNotInList:            Result := ppLoadStr(797); {Not In List}
    dacoBlank:                Result := ppLoadStr(733); {Blank}
    dacoNotBlank:             Result := ppLoadStr(796); {Not Blank}
  end;

end; {procedure, daGetOperatorDesc}

{------------------------------------------------------------------------------}
{ daGetCalcDesc }

function daGetCalcDesc(aCalcType: TdaCalcType): String;
begin

  case aCalcType of
    dacaCount:      Result := ppLoadStr(740); {Count}
    dacaAvg:        Result := ppLoadStr(729); {Avg}
    dacaSum:        Result := ppLoadStr(832); {Sum}
    dacaMin:        Result := ppLoadStr(788); {Min}
    dacaMax:        Result := ppLoadStr(787); {Max}
    dacaExpression: Result := ppLoadStr(759); {Expression}
    else
      Result := '';
  end;

end; {function, daGetCalcDesc}

{------------------------------------------------------------------------------}
{ daReplicate }

function daReplicate(Count: Integer; S: String): String;
var
  R: Integer;
begin

  Result := '';

  for R := 1 to Count do
    Result := Result + S;

end; {function, daReplicate}

{------------------------------------------------------------------------------}
{ daNextDay }

function daNextDay(aDateTime: TDateTime): TDateTime;
var
  lwYear: Word;
  lwMonth: Word;
  lwDay: Word;
begin

  DecodeDate(aDateTime, lwYear, lwMonth, lwDay);

  Inc(lwDay);

  if (lwDay > daDaysInMonth(lwMonth, lwYear)) then
    begin
      lwDay := 1;

      Inc(lwMonth);

      if lwMonth > 12 then
        begin
          lwMonth := 1;

          Inc(lwYear);
        end;

    end;

  Result := EncodeDate(lwYear, lwMonth, lwDay);

end; {function, daNextDay}

{------------------------------------------------------------------------------}
{ daPreviousDay }

function daPreviousDay(aDateTime: TDateTime): TDateTime;
var
  lwYear: Word;
  lwMonth: Word;
  lwDay: Word;
begin

  DecodeDate(aDateTime, lwYear, lwMonth, lwDay);

  Dec(lwDay);

  if (lwDay = 0) then
    begin
      Dec(lwMonth);

      if lwMonth = 0 then
        begin
          Dec(lwYear);

          lwMonth := 12;
        end;

    lwDay := daDaysInMonth(lwMonth, lwYear);
  end;

  Result := EncodeDate(lwYear, lwMonth, lwDay);

end; {function, daPreviousDay}

{------------------------------------------------------------------------------}
{ daWeekStartEnd }

procedure daWeekStartEnd(aCurrentDateTime: TDateTime; var aStartDateTime, aEndDateTime: TDateTime);
var
  liDOW: Integer;
  liDay: Integer;
begin
  liDOW := DayOfWeek(aCurrentDateTime);

  liDay := liDOW;

  aStartDateTime := aCurrentDateTime;

  while liDay > 1 do
    begin
      aStartDateTime := daPreviousDay(aStartDateTime);

      Dec(liDay);
    end;

  liDay := liDOW;

  aEndDateTime := aCurrentDateTime;

  while liDay < 7 do
    begin
      aEndDateTime := daNextDay(aEndDateTime);

      Inc(liDay);
    end;

end; {function, daWeekStartEnd}

{------------------------------------------------------------------------------}
{ daDaysInMonth }

function daDaysInMonth(aMonth, aYear: Word): Word;
const
  Days: array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
begin

  if ((aYear mod 4) = 0) then {leap year}
    begin
      {Century years not divisible by 400 are not leap years}
      if ((aYear mod 100) = 0) then
        begin
          if ((aYear mod 400) = 0) then
            Days[2] := 29
          else
            Days[2] := 28;
        end
      else
        Days[2] := 29
    end
  else
    Days[2] := 28;

  Result := Days[aMonth];

end; {function, daDaysInMonth}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TdaTable, TdaField, TdaCalculation, TdaTableJoin, TdaCriteria, TdaNumericValue, TdaSQL]);

finalization

  UnRegisterClasses([TdaTable, TdaField, TdaCalculation, TdaTableJoin, TdaCriteria, TdaNumericValue, TdaSQL]);

end.








