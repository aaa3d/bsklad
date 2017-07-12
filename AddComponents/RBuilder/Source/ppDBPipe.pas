{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDBPipe;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Graphics, DB, DBCtrls,
  ppTypes, ppDB, ppComm, ppRTTI;


type

  { The TppDBPipeline component can be assigned to the DataPipeline property
    of the TppReport and TppDetailBand classes. This component allows the developer
    to assign a standard Delphi TDataSource component via the DataSource property.
    It implements two additional properties which control how the DataSource is
    handled:

    OpenDataSource: Boolean

      if true the DataSource will be opened when the report starts
      if false nothing is done with the DataSource when the report starts.

    CloseDataSource: Boolean

      if true the DataSource will be closed when the report IS DESTROYED.
      if false nothing is done with the DataSource when the report is destroyed. }

  { TppDBDataLink }
  TppDBDataLink = class(TDataLink)
    private
      FOnActiveChanged: TNotifyEvent;
      FOnDataSetChanged: TNotifyEvent;
      FOnLayoutChanged: TNotifyEvent;

    protected
      procedure ActiveChanged; override;
      procedure CheckBrowseMode; override;
      procedure DataSetChanged; override;
      procedure LayoutChanged; override;

    public
      constructor Create;

      property OnActiveChanged: TNotifyEvent read FOnActiveChanged write FOnActiveChanged;
      property OnDataSetChanged: TNotifyEvent read FOnDataSetChanged write FOnDataSetChanged;
      property OnLayoutChanged: TNotifyEvent read FOnLayoutChanged write FOnLayoutChanged;

  end; {class, TppDBDataLink}

  { TppDBPipeline }
  TppDBPipeline = class(TppCustomDataPipeline)
    private
      FDataLink: TppDBDataLink;
      FDataSource: TDataSource;
      FDataSet: TDataSet;
      FFieldDataLink: TFieldDataLink;
      FOpenDataSource: Boolean;
      FBookmarksExist: Boolean;
      FCacheBookmarks: TList;
      FCloseDataSource: Boolean;
      FRefreshAfterPost: Boolean;

      procedure ActiveChangedEvent(Sender: TObject);
      procedure DataSetChangedEvent(Sender: TObject);
      procedure FreeAllBookmarks;
      procedure FreePageBookmarks(aStartPageNo: Longint);
      function  GetDataSource: TDataSource;
      procedure SetDataSource(aDataSource: TDataSource);
      function  SetCurrentField(aFieldName: String): Boolean;

    protected
      procedure CloseDataSet; override;
      function  GetActive: Boolean; override;
      function  CheckBOF: Boolean; override;
      function  CheckEOF: Boolean; override;
      procedure GotoFirstRecord; override;
      procedure GotoLastRecord; override;
      procedure OpenDataSet; override;
      procedure TraverseBy(aIncrement: Integer); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure Notification(aComponent: TComponent; Operation: TOperation); override;

      procedure FreeCache(aCachePageNo: Longint); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      procedure FreeBookmark(aBookmark: Longint); override;
      function  GetBookmark: Longint; override;
      function  GetDataSetName: String; override;
      function  GetFieldNames(aFieldNameList: TStrings): Boolean; override;
      function  GetFieldAlignment(aFieldName: String): TAlignment; override;
      function  GetFieldAsDouble(aFieldName: String): Double; override;
      function  GetFieldAsPicture(aFieldName: String): TPicture; override;
      procedure GetFieldAsStream(aFieldName: String; aStream: TStream); override;
      function  GetFieldAsString(aFieldName: String): String; override;
      function  GetFieldDataType(aFieldName: String): TppDataType; override;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; override;
      function  GetFieldIsCalculated(aFieldName: String): Boolean; override;
      function  GetFieldSize(aFieldName: string): Integer; override;
      function  GetFieldValue(aFieldName: string): Variant; override;

      procedure GotoBookmark(aBookmark: Longint); override;

    {optional section

     These search/edit/insert routines are required if you want to load and
     save Report templates to database blob fields as in the End-User demo}

      procedure Delete; override;
      procedure Edit;  override;
      procedure Insert; override;
      function  Locate(const aFieldName: string; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean; override;
      procedure Post; override;
      procedure SetFieldFromStream(aFieldName: String; aStream: TStream); override;
      procedure SetFieldValue(aFieldName: String; aValue: Variant); override;

    {end of optional section}

    published
      property DataSource: TDataSource read GetDataSource  write SetDataSource;
      property CloseDataSource: Boolean read FCloseDataSource write FCloseDataSource default False;
      property OpenDataSource: Boolean read FOpenDataSource write FOpenDataSource default True;
      property RefreshAfterPost: Boolean read FRefreshAfterPost write FRefreshAfterPost default False;

      {TppDataPipeline properties}
      property AutoCreateFields;
      property MasterDataPipeline;
      property MoveBy;
      property RangeEnd;
      property RangeEndCount;
      property RangeBegin;
      property SkipWhenNoRecords;
      property UserName;
      property Visible;

      {TppDataPipeline events}
      property OnClose;
      property OnDataChange;
      property OnFirst;
      property OnGotoBookmark;
      property OnLast;
      property OnMasterRecordPositionChange;
      property OnNext;
      property OnOpen;
      property OnPrior;
      property OnRecordPositionChange;
      property OnTraversal;

  end; {class, TppDBPipeline}


 { TppChildDBPipeline }
  TppChildDBPipeline = class(TppDBPipeline)
    public
      function HasParent: Boolean; override;

    published
      property DataSource stored False;

    end; {class, TppChildDBPipeline}


  { TppChildDataSource }
  TppChildDataSource = class(TDataSource)
    public
      function HasParent: Boolean; override;
    end; {class, TppChildDataSource}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppDBPipelineRTTI }
  TraTppDBPipelineRTTI = class(TraTppDataPipelineRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBPipelineRTTI}

  function ppConvertFieldType(aFieldType: TFieldType): TppDataType;

implementation

{******************************************************************************
 *
 ** C H I L D   D B  P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildDBPipeline.HasParent }

function TppChildDBPipeline.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** C H I L D   D A T A S O U R C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildDataSource.HasParent }

function TppChildDataSource.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}



{******************************************************************************
 *
 ** D B  D A T A L I N K
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBDataLink.Create }

constructor TppDBDataLink.Create;
begin
  inherited Create;

  FOnActiveChanged := nil;
  FOnDataSetChanged := nil;
  FOnLayoutChanged := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBDataLink.ActiveChanged }

procedure TppDBDataLink.ActiveChanged;
begin
  if Assigned(FOnActiveChanged) then FOnActiveChanged(Self);
end; {procedure, ActiveChanged}

{------------------------------------------------------------------------------}
{ TppDBDataLink.LayoutChanged }

procedure TppDBDataLink.LayoutChanged;
begin
  if Assigned(FOnLayoutChanged) then FOnLayoutChanged(Self);
end; {procedure, LayoutChanged}

{------------------------------------------------------------------------------}
{ TppDBDataLink.DataSetChanged }

procedure TppDBDataLink.DataSetChanged;
begin
  if Assigned(FOnDataSetChanged) then FOnDataSetChanged(Self);
end; {procedure, DataSetChanged}

{------------------------------------------------------------------------------}
{ TppDBDataLink.CheckBrowseMode }

procedure TppDBDataLink.CheckBrowseMode;
begin
  if Assigned(FOnDataSetChanged) then FOnDataSetChanged(Self);
end; {procedure, CheckBrowseMode}

{******************************************************************************
 *
 ** D B   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Create }

constructor TppDBPipeline.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCacheBookmarks := TList.Create;

  FBookmarksExist := False;
  FOpenDataSource := True;
  FCloseDataSource := False;
  FRefreshAfterPost := False;

  FDataSource := nil;
  FDataSet := nil;

  FDataLink := TppDBDataLink.Create;

  FDataLink.OnActiveChanged := ActiveChangedEvent;
  FDataLink.OnDataSetChanged := DataSetChangedEvent;

  FFieldDataLink := TFieldDataLink.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Destroy }

destructor TppDBPipeline.Destroy;
begin
  Destroying;
  
  Close;

  FDataLink.Free;
  FFieldDataLink.Free;
  FCacheBookmarks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Notify }

procedure TppDBPipeline.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aCommunicator = Self) and (aOperation = ppopDataChange) then
     CreateDefaultFields;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Notification }

procedure TppDBPipeline.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (Operation = opRemove) then
    begin

      if (aComponent = FDataSource) then
        begin
          Close;

          FDataSource := nil;
          FDataSet := nil;
        end

      else if (aComponent = FDataSet) then
        begin
          Close;

          FDataSet := nil;
        end;

    end;

end; {procedure, Notification}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetDataSource }

function TppDBPipeline.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end; {procedure, GetDataSource}

{------------------------------------------------------------------------------}
{ TppDBPipeline.SetDataSource }

procedure TppDBPipeline.SetDataSource(aDataSource: TDataSource);
begin

  FDataSource := aDataSource;
  FDataLink.DataSource := aDataSource;

  if (FDataSource <> nil) then
    FDataSource.FreeNotification(Self);

  SyncFields;

end; {procedure, SetDataSource}

{------------------------------------------------------------------------------}
{ TppDBPipeline.ActiveChangedEvent }

procedure TppDBPipeline.ActiveChangedEvent(Sender: TObject);
begin

  {free bookmarks, if DataSource or DataSet is being destroyed}
   if (FDataSource <> nil) and (csDestroying in FDataSource.ComponentState) then
     Close

   else if (FDataSet <> nil) and (csDestroying in FDataSet.ComponentState) then
     Close

   {free bookmarks, if DataSet is being closed}
   else if not (csDestroying in ComponentState) and
           (FDataSet <> nil) and not (FDataSet.Active) then
     Close
   else
     DoOnDataChange;


  if (csDestroying in ComponentState) then Exit;


  {clear any residual field setting}
  FFieldDataLink.FieldName := '';


  if AutoCreateFields then
    if Active then
      SyncFields
    else
      FreeFields;


  DoOnActiveChange;


end; {procedure, ActiveChangedEvent}

{------------------------------------------------------------------------------}
{ TppDBPipeline.DataSetChangedEvent }

procedure TppDBPipeline.DataSetChangedEvent(Sender: TObject);
begin
  DoOnDataChange;
end; {procedure, DataSetChangedEvent}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetActive }

function TppDBPipeline.GetActive: Boolean;
begin
  Result := FDataLink.Active

end; {procedure, GetActive}

{------------------------------------------------------------------------------}
{ TppDBPipeline.SaveToCache }

procedure TppDBPipeline.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  {save record states}
  lRec.FNoRecords   := (ppdaNoRecords in State);
  lRec.FLastRecord  := (ppdaLastRecord in State);
  lRec.FFirstRecord := (ppdaFirstRecord in State);

  lRec.FTraversalCount := TraversalCount;

  {bookmark record position}
  if not(ppdaNoRecords in State) and (FDataLink.DataSet <> nil) and
     not(FDataLink.DataSet.BOF) and not(FDataLink.DataSet.EOF) and
     FDataLink.Active then
    begin
      lRec.FBookmarked := True;

      lRec.FBookmark := Longint(FDataLink.DataSet.GetBookmark);

      FCacheBookmarks.Add(TObject(lRec.FBookmark));
    end
  else
    begin
      lRec.FBookmarked := False;
      
      lRec.FBookmark := 0;
    end;

  WriteRecordToCache(aCachePageNo, lRec);

  FBookmarksExist := True;

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppDBPipeline.RestoreFromCache }

procedure TppDBPipeline.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  ExcludeState([ppdaNoRecords, ppdaLastRecord, ppdaFirstRecord]);

  if lRec.FNoRecords then IncludeState([ppdaNoRecords]);
  if lRec.FLastRecord then IncludeState([ppdaLastRecord]);
  if lRec.FFirstRecord then IncludeState([ppdaFirstRecord]);

  TraversalCount := lRec.FTraversalCount;

  {restore record position}
  if (ppdaFirstRecord in State) then
    First

  else if (ppdaLastRecord in State) then
    Last

  else if lRec.FBookmarked and (FDataLink.DataSet <> nil) then
    GotoBookmark(lRec.FBookmark);

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppDBPipeline.FreeCache }

procedure TppDBPipeline.FreeCache(aCachePageNo: Longint);
begin

  {if (aCachePageNo <> 0) then
    FreeCurrentBookmark;}

  {free any bookmark resources before cache is cleared}
  FreePageBookmarks(aCachePageNo);

end; {procedure, FreeCache}

{------------------------------------------------------------------------------}
{ TppDBPipeline.FreeAllBookmarks }

procedure TppDBPipeline.FreeAllBookmarks;
var
  liIndex: Integer;
begin
  for liIndex := 0 to FCacheBookmarks.Count -1 do
    FreeBookmark(Integer(FCacheBookmarks[liIndex]));

  FCacheBookmarks.Clear;
end; {procedure, FreeAllBookmarks}

{------------------------------------------------------------------------------}
{ TppDBPipeline.FreePageBookmarks }

procedure TppDBPipeline.FreePageBookmarks(aStartPageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
  llPage: Longint;
  liPosition: Integer;
begin

  {if not FBookmarksExist then Exit;}

  llPage := aStartPageNo;

  while (llPage <= CachePageCount) do
    begin
      ReadRecordFromCache(llPage, lRec);

      if lRec.FBookmarked then
        begin
          liPosition := FCacheBookmarks.IndexOf(TObject(lRec.FBookmark));

          if (liPosition <> -1) then
            begin
              FreeBookmark(lRec.FBookmark);

              FCacheBookmarks.Delete(liPosition);
            end;
        end;

      Inc(llPage);
    end;

 { if (aStartPageNo = 0) then
    FBookmarksExist := False;}

end; {procedure, FreePageBookmarks}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldNames }

function TppDBPipeline.GetFieldNames(aFieldNameList: TStrings): Boolean;
var
  liFieldCount: Integer;
begin

  Result := True;

  liFieldCount := inherited GetFieldCount;

  if (liFieldCount = 0) then
    begin

      if (FDataLink.DataSet <> nil) then
        try

          FDataLink.DataSet.GetFieldNames(aFieldNameList);

        except on EDatabaseError do
          begin
            aFieldNameList.Clear;
            Result := False;
          end

        end {try, except}

      else
        begin
          aFieldNameList.Clear;
          Result := False;
        end;

    end; {if, FieldCount = 0}

  {pull list from saved field objects}
  if not(CreatingDefaultFields) then
    Result := inherited GetFieldNames(aFieldNameList);

end; {function, GetFieldNames}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetDataSetName }

function TppDBPipeline.GetDataSetName: String;
begin

  if FDataLink.DataSet <> nil then
    Result := FDataLink.DataSet.Name
  else
    Result := '';

end; {function, GetDataSetName}


{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldAsDouble }

function TppDBPipeline.GetFieldAsDouble(aFieldName: String): Double;
begin

  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.AsFloat
  else
    Result := 0;

end; {function, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldAsPicture }

function TppDBPipeline.GetFieldAsPicture(aFieldName: String): TPicture;
begin

  Result := nil;

  if SetCurrentField(aFieldName) then
    if FFieldDataLink.Field is TBlobField then
      Result := TPicture(FFieldDataLink.Field);

end; {function, GetFieldAsPicture}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldAsString }

function TppDBPipeline.GetFieldAsString(aFieldName: String): String;
begin

  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.AsString
  else
    Result := '';

end; {function, GetFieldAsString}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldAlignment }

function TppDBPipeline.GetFieldAlignment(aFieldName: String): TAlignment;
begin

  {try to use TField info}
  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.Alignment
  else
    Result := inherited GetFieldAlignment(aFieldName);

end; {function, GetFieldAlignment}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldDataType }

function TppDBPipeline.GetFieldDataType(aFieldName: String): TppDataType;
begin

  {try using TppField info, if not auto create fields}
  if not AutoCreateFields then
    Result := inherited GetFieldDataType(aFieldName)
  else
    Result := dtNotKnown;

  if (Result <> dtNotKnown) then Exit;

  {try to use TField info}
  if not(Active) then
    try
      OpenDataSet;
    except

    end;

  if SetCurrentField(aFieldName) then
    Result := ppConvertFieldType(FFieldDataLink.Field.DataType);

end; {function, GetFieldDataType}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldDisplayWidth }

function TppDBPipeline.GetFieldDisplayWidth(aFieldName: String): Integer;
begin

  {try using TppField info, if not auto create fields}
  if not AutoCreateFields then
    Result := inherited GetFieldDisplayWidth(aFieldName)
  else
    Result := 0;

  if (Result <> 0) then Exit;

  {try to use TField info, if auto create fields true}
  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.DisplayWidth;

end; {function, GetFieldDisplayWidth}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldIsCalculated }

function TppDBPipeline.GetFieldIsCalculated(aFieldName: String): Boolean;
begin
  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.Calculated
  else
    Result := False;

end; {function, GetFieldIsCalculated}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldSize }

function TppDBPipeline.GetFieldSize(aFieldName: string): Integer;
begin

  {try using TppField info, if not auto create fields}
  if not AutoCreateFields then
    Result := inherited GetFieldSize(aFieldName)
  else
    Result := 0;

  if (Result <> 0) then Exit;

  {try to use TField info, if AutoCreateFields true}
  if SetCurrentField(aFieldName) then
    Result := FFieldDataLink.Field.Size;

end; {function, GetFieldSize}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldValue }

function TppDBPipeline.GetFieldValue(aFieldName: string): Variant;
begin

  Result := Null;

  if not(SetCurrentField(aFieldName)) or (FFieldDataLink.Field.IsNull) then Exit;

  case GetFieldDataType(aFieldName) of
    dtString, dtChar:
      Result := FFieldDataLink.Field.AsString;

    dtDouble, dtSingle, dtExtended:
      Result := FFieldDataLink.Field.AsFloat;

    dtInteger, dtLongint:
      Result := FFieldDataLink.Field.AsInteger;

    dtCurrency:
      Result := FFieldDataLink.Field.AsCurrency;

    dtDate, dtTime, dtDateTime:
      Result := FFieldDataLink.Field.AsDateTime;

    dtBoolean:
      if (FFieldDataLink.Field is TBooleanField) and
         (TBooleanField(FFieldDataLink.Field).DisplayValues <> '') then
        Result := FFieldDataLink.Field.AsString
      else
        Result := FFieldDataLink.Field.AsBoolean;
  end;

end; {function, GetFieldValue}

{------------------------------------------------------------------------------}
{ TppDBPipeline.SetCurrentField }

function TppDBPipeline.SetCurrentField(aFieldName: String): Boolean;
begin

  try
    if (FFieldDataLink.DataSource <> FDataLink.DataSource) then
      FFieldDataLink.DataSource := FDataLink.DataSource;

    if (CompareText(FFieldDataLink.FieldName, aFieldName) <> 0) then
      FFieldDataLink.FieldName := aFieldName;

    if (FFieldDataLink.Field <> nil) then
      Result := True
    else
      Result := False;

  except on EDatabaseError do

    Result := False;

  end;

end; {function, SetCurrentField}

{------------------------------------------------------------------------------}
{ TppDBPipeline.FreeBookmark }

procedure TppDBPipeline.FreeBookmark(aBookmark: Longint);
begin
  {note: use FDataSet here because FDataLink.DataSet returns nil
         when the TDataSource or TDataSet objects are csDestroying}
  if (FDataSet <> nil) then
    FDataSet.FreeBookmark(TBookmark(aBookmark));
end; {procedure, FreeBookmark}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetBookmark }

function  TppDBPipeline.GetBookmark: Longint;
var
  lBookmark: TBookmark;

begin
  Result := 0;

  if (FDataLink.DataSet = nil) then Exit;

  lBookmark := FDataLink.DataSet.GetBookmark;
  
  if (lBookmark <> nil) then
    Result := Longint(lBookmark);
    
end; {procedure, GetBookmark}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GotoBookmark }

procedure TppDBPipeline.GotoBookmark(aBookmark: Longint);
var
  liIndex: Integer;
  lBookmark: TBookmark;
begin

  lBookmark := TBookmark(aBookmark);

  if (FDataLink.DataSet <> nil) and (lBookmark <> nil) and (FDataLink.DataSet.BookmarkValid(lBookmark)) then
    FDataLink.DataSet.GotoBookmark(lBookmark)

  else
    begin
      {goto last record in detail dataset, handles SQL Server 7 BDE bug}
      if (TraversalCount <> 0) then
        begin
          FDataLink.DataSet.First;

          for liIndex := 0 to TraversalCount - 1 do
            FDataLink.DataSet.Next;
        end;
    end;

  inherited GotoBookmark(aBookmark);

  DoOnTraversal;

end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Edit }

procedure TppDBPipeline.Edit;
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.Edit;
end; {procedure, Edit}
 
{------------------------------------------------------------------------------}
{ TppDBPipeline.Insert }

procedure TppDBPipeline.Insert;
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.Insert;
end; {procedure, Insert}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Delete }

procedure TppDBPipeline.Delete;
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.Delete;
end; {procedure, Delete}

{------------------------------------------------------------------------------}
{ TppDBPipeline.Post }

procedure TppDBPipeline.Post;
begin
  if (FDataLink.DataSet <> nil) then
    begin
      FDataLink.DataSet.Post;

      if RefreshAfterPost then
        FDataLink.DataSet.Refresh;
    end;
end; {procedure, Post}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GetFieldAsStream }

procedure TppDBPipeline.GetFieldAsStream(aFieldName: String; aStream: TStream);
var
  lsValue: String;
  lValue: PChar;
  liSize: Integer;
begin

  if not(SetCurrentField(aFieldName)) then Exit;

  if (FFieldDataLink.Field is TBlobField) then
    TBlobField(FFieldDataLink.Field).SaveToStream(aStream)

  else
    begin
      lsValue := FFieldDataLink.Field.AsString;
      liSize := Length(lsValue) + 1;
      GetMem(lValue, liSize);
      lValue := PChar(lsValue);
      aStream.WriteBuffer(lValue, liSize);
      FreeMem(lValue, liSize);
    end;

end; {procedure, GetFieldAsStream}

{------------------------------------------------------------------------------}
{ TppDBPipeline.SetFieldFromStream}

procedure TppDBPipeline.SetFieldFromStream(aFieldName: String; aStream: TStream);
begin

  if SetCurrentField(aFieldName) and (FFieldDataLink.Field is TBlobField) then
    TBlobField(FFieldDataLink.Field).LoadFromStream(aStream);

end; {procedure, SetFieldFromStream}

{------------------------------------------------------------------------------}
{ TppDBPipeline.SetFieldValue }

procedure TppDBPipeline.SetFieldValue(aFieldName: String; aValue: Variant);
begin

  if SetCurrentField(aFieldName) then
    FFieldDataLink.Field.Value := aValue;

end; {procedure, SetFieldValue}


{------------------------------------------------------------------------------}
{ TppDBPipeline.Locate }

function TppDBPipeline.Locate(const aFieldName: string; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean;
var
  lLocateOptions: TLocateOptions;
  lField: TField;

begin

  Result := False;

  if (FDataLink.DataSet = nil) then Exit;

  {make sure dataset is open}
  if not FDataLink.DataSet.Active then
    FDataLink.DataSet.Open;

  if VarType(aKeyValue) = varString then
    begin
      if not SetCurrentField(aFieldName) then Exit;

      lField := FFieldDataLink.Field;

      {truncate KeyValue if too long - otherwise get BDE error }
      if VarType(aKeyValue) = varString then

        if Length(aKeyValue) > lField.Size then
          aKeyValue := Copy(aKeyValue, 1, lField.Size)
        else
          aKeyValue := aKeyValue;

    end;
    
  if pploCaseInsensitive in aOptions then
    Include(lLocateOptions, loCaseInsensitive);

  if pploPartialKey in aOptions then
    Include(lLocateOptions,  loPartialKey);

  {go to beginning of data set}
  FDataLink.DataSet.First;

  Result := FDataLink.DataSet.Locate(aFieldName, aKeyValue, lLocateOptions);

end; {procedure, Locate}

{------------------------------------------------------------------------------}
{ TppDBPipeline.CheckBOF }

function TppDBPipeline.CheckBOF: Boolean;
begin
  if FDataLink.DataSet = nil then
    Result := True
  else
    Result := FDataLink.DataSet.BOF;
end; {procedure, CheckBOF}

{------------------------------------------------------------------------------}
{ TppDBPipeline.CheckEOF }

function TppDBPipeline.CheckEOF: Boolean;
begin
  if FDataLink.DataSet = nil then
    Result := True
  else
    Result := FDataLink.DataSet.EOF;
end; {procedure, CheckEOF}

{------------------------------------------------------------------------------}
{ TppDBPipeline.OpenDataSet }

procedure TppDBPipeline.OpenDataSet;
begin

  if (FDataSet <> nil) and (csDestroying in FDataSet.ComponentState) then Exit;

  FDataSet := FDataLink.DataSet;

  if (FDataSet <> nil) then
    FDataSet.FreeNotification(Self);

  if FOpenDataSource and (FDataLink.DataSet <> nil) then
    try
      FDataLink.DataSet.Open;
    except on E: Exception do
      raise EDataError.Create(E.Message);
    end;

end; {procedure, OpenTheDataPipeline}

{------------------------------------------------------------------------------}
{ TppDBPipeline.CloseDataSet }

procedure TppDBPipeline.CloseDataSet;
begin

  FreeAllBookmarks;
  
  if FCloseDataSource and (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.Close;

end; {procedure, CloseDataSet}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GotoFirstRecord }

procedure TppDBPipeline.GotoFirstRecord;
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.First;
end; {procedure, GotoFirstRecord}

{------------------------------------------------------------------------------}
{ TppDBPipeline.TraverseBy }

procedure TppDBPipeline.TraverseBy(aIncrement: Integer);
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.MoveBy(aIncrement);
end; {procedure, MoveBy}

{------------------------------------------------------------------------------}
{ TppDBPipeline.GotoLastRecord }

procedure TppDBPipeline.GotoLastRecord;
begin
  if (FDataLink.DataSet <> nil) then
    FDataLink.DataSet.Last;
end; {procedure, GotoLastRecord}

{------------------------------------------------------------------------------}
{ ppConvertFieldType }

function ppConvertFieldType(aFieldType: TFieldType): TppDataType;
begin

  case aFieldType of

        ftString:       Result := dtString;
        ftDate:         Result := dtDate;
        ftTime:         Result := dtTime;
        ftDateTime:     Result := dtDateTime;

        ftInteger,
        ftSmallInt:     Result := dtInteger;

        ftLargeInt:     Result := dtLongint;

        ftCurrency:     Result := dtCurrency;

        ftFloat,
        ftBCD:          Result := dtDouble;

        ftWord:         Result := dtLongint;
        ftBoolean:      Result := dtBoolean;
        ftMemo:         Result := dtMemo;
        ftGraphic:      Result := dtGraphic;
        ftBLOB,
        ftBytes,
        ftVarBytes:     Result := dtBLOB;

        ftFmtMemo,
        ftParadoxOle,
        ftDBaseOle,
        ftTypedBinary:  Result := dtBLOB;

        ftAutoInc:      Result := dtLongint

        else
          Result := dtString;

      end; {case, datatype}

end; {function, ConvertFieldType}

{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** D B   P I P E L I N E  R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBPipelineRTTI.RefClass }

class function TraTppDBPipelineRTTI.RefClass: TClass;
begin
  Result := TppDBPipeline;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBPipelineRTTI.GetPropList }

class procedure TraTppDBPipelineRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBPipelineRTTI.GetPropRec }

class function TraTppDBPipelineRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if(CompareText(aPropRec.Name, 'AutoCreateFields') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'MoveBy') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'RangeEnd') = 0) then
    EnumPropToRec(aPropName, 'TppRangeEndType', False, aPropRec)

  else if (CompareText(aPropName, 'RangeEndCount') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'RangeBegin') = 0) then
    EnumPropToRec(aPropName, 'TppRangeBeginType', False, aPropRec)

  else if (CompareText(aPropName, 'DataSource') = 0) then
    ClassPropToRec(aPropName, TDataSource, False, aPropRec)

  else if (CompareText(aPropName, 'CloseDataSource') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'OpenDataSource') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'RefreshAfterPost') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBPipelineRTTI.GetPropValue }

class function TraTppDBPipelineRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if(CompareText(aPropName, 'AutoCreateFields') = 0) then
    Boolean(aValue) := TppDBPipeline(aObject).AutoCreateFields

  else if (CompareText(aPropName, 'MoveBy') = 0) then
    Integer(aValue) := TppDBPipeline(aObject).MoveBy

  else if (CompareText(aPropName, 'RangeBegin') = 0) then
    Integer(aValue) := Ord(TppDBPipeline(aObject).RangeBegin)

  else if (CompareText(aPropName, 'RangeEndCount') = 0) then
    Integer(aValue) := TppDBPipeline(aObject).RangeEndCount

  else if (CompareText(aPropName, 'RangeEnd') = 0) then
    Integer(aValue) := Ord(TppDBPipeline(aObject).RangeEnd)

  else if (CompareText(aPropName, 'DataSource') = 0) then
    Integer(aValue) := Integer(TppDBPipeline(aObject).DataSource)

  else if (CompareText(aPropName, 'CloseDataSource') = 0) then
    Boolean(aValue) := TppDBPipeline(aObject).CloseDataSource

  else if (CompareText(aPropName, 'OpenDataSource') = 0) then
    Boolean(aValue) := TppDBPipeline(aObject).OpenDataSource

  else if (CompareText(aPropName, 'RefreshAfterPost') = 0) then
    Boolean(aValue) := TppDBPipeline(aObject).RefreshAfterPost

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBPipelineRTTI.SetPropValue }

class function TraTppDBPipelineRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if(CompareText(aPropName, 'AutoCreateFields') = 0) then
    TppDBPipeline(aObject).AutoCreateFields := Boolean(aValue)

  else if (CompareText(aPropName, 'MoveBy') = 0) then
    TppDBPipeline(aObject).MoveBy := Integer(aValue)

  else if (CompareText(aPropName, 'RangeBegin') = 0) then
    TppDBPipeline(aObject).RangeBegin := TppRangeBeginType(aValue)

  else if (CompareText(aPropName, 'RangeEndCount') = 0) then
    TppDBPipeline(aObject).RangeEndCount := Integer(aValue)

  else if (CompareText(aPropName, 'RangeEnd') = 0) then
    TppDBPipeline(aObject).RangeEnd := TppRangeEndType(aValue)

  else if (CompareText(aPropName, 'DataSource') = 0) then
    TppDBPipeline(aObject).DataSource := TDataSource(aValue)

  else if (CompareText(aPropName, 'CloseDataSource') = 0) then
    TppDBPipeline(aObject).CloseDataSource := Boolean(aValue)

  else if (CompareText(aPropName, 'OpenDataSource') = 0) then
    TppDBPipeline(aObject).OpenDataSource := Boolean(aValue)

  else if (CompareText(aPropName, 'RefreshAfterPost') = 0) then
    TppDBPipeline(aObject).RefreshAfterPost := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDBPipeline, TppChildDBPipeline, TppChildDataSource]);

  raRegisterRTTI(TraTppDBPipelineRTTI);

finalization

  UnRegisterClasses([TppDBPipeline, TppChildDBPipeline, TppChildDataSource]);

  raUnRegisterRTTI(TraTppDBPipelineRTTI);

end.
