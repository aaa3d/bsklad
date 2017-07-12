{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDBJIT;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Graphics,
  ppTypes, ppDB, ppUtils;

type

  {event types}
  TppBooleanEvent = function: Boolean of object;
  TppFreeBookmarkEvent = procedure (aBookmark: Longint) of object;
  TppGetBookmarkEvent = function: Longint of object;
  TppGetDataSetNameEvent = function: String of object;
  TppGetFieldAsDoubleEvent = function (aFieldName: String): Double of object;
  TppGetFieldAsPictureEvent = function (aFieldName: String): TPicture of object;
  TppGetFieldAsStringEvent = function (aFieldName: String): String of object;
  TppGetFieldValueEvent = function (aFieldName: String): Variant of object;

  TppGotoBookmarkEvent = procedure (aBookmark: Longint) of object;
  TppTraverseByEvent = procedure (aIncrement: Longint) of object;



  { TppJITPipeline }
  TppJITPipeline = class(TppCustomDataPipeline)
    private
      FOnCloseDataSet: TNotifyEvent;
      FOnCheckBOF: TppBooleanEvent;
      FOnCheckEOF: TppBooleanEvent;
      FOnFreeBookmark: TppFreeBookmarkEvent;
      FOnGetActive: TppBooleanEvent;
      FOnGetBookmark: TppGetBookmarkEvent;
      FOnGetDataSetName: TppGetDataSetNameEvent;
      FOnGetFieldAsDouble: TppGetFieldAsDoubleEvent;
      FOnGetFieldAsPicture: TppGetFieldAsPictureEvent;
      FOnGetFieldAsString: TppGetFieldAsStringEvent;
      FOnGetFieldValue: TppGetFieldValueEvent;
      FOnGotoBookmark: TppGotoBookmarkEvent;
      FOnGotoFirstRecord: TNotifyEvent;
      FOnGotoLastRecord: TNotifyEvent;
      FOnOpenDataSet: TNotifyEvent;
      FOnTraverseBy: TppTraverseByEvent;
      FInitialIndex: Integer;
      FRecordCount: Integer;
      FRecordIndex: Integer;
      FActive: Boolean;
      FBOF: Boolean;
      FEOF: Boolean;

    protected
      {overriden from TppDataPipeline}
      procedure CloseDataSet; override;
      function  GetActive: Boolean; override;
      function  CheckBOF: Boolean; override;
      function  CheckEOF: Boolean; override;
      procedure GotoFirstRecord; override;
      procedure GotoLastRecord; override;
      procedure OpenDataSet; override;
      procedure TraverseBy(aIncrement: Integer); override;

      procedure SetRecordIndex(aValue: Integer);

      {field support}
      property AutoCreateFields default False;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      {overriden from TppCacheable}
      procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
      procedure SaveToCache(aAbsolutePageNo: Longint); override;

      {overriden from TppDataPipeline}
      procedure FreeBookmark(aBookmark: Longint); override;
      function  GetBookmark: Longint; override;
      function  GetDataSetName: String; override;
      function  GetFieldAsDouble(aFieldName: String): Double; override;
      function  GetFieldAsPicture(aFieldName: String): TPicture; override;
      function  GetFieldAsString(aFieldName: String): String; override;
      function  GetFieldIsCalculated(aFieldName: String): Boolean; override;
      function  GetFieldValue(aFieldName: string): Variant; override;

      procedure GotoBookmark(aBookmark: Longint); override;

      function GetLastRecordIndex: Integer;

      property RecordCount: Integer read FRecordCount write FRecordCount;
      property RecordIndex: Integer read FRecordIndex write FRecordIndex;
      property InitialIndex: Integer read FInitialIndex write FInitialIndex;

    published
      { TppDataPipeline properties}
      property MasterDataPipeline;
      property MasterFieldLinks;
      property MoveBy;
      property RangeEnd;
      property RangeEndCount;
      property RangeBegin;
      property SkipWhenNoRecords;
      property UserName;
      property Visible;
  
      property OnCloseDataSet: TNotifyEvent read FOnCloseDataSet write FOnCloseDataSet;
      property OnCheckBOF: TppBooleanEvent read FOnCheckBOF write FOnCheckBOF;
      property OnCheckEOF: TppBooleanEvent read FOnCheckEOF write FOnCheckEOF;
      property OnFreeBookmark: TppFreeBookmarkEvent read FOnFreeBookmark write FOnFreeBookmark;
      property OnGetActive: TppBooleanEvent read FOnGetActive write FOnGetActive;
      property OnGetBookmark: TppGetBookmarkEvent read FOnGetBookmark write FOnGetBookmark;
      property OnGetDataSetName: TppGetDataSetNameEvent read FOnGetDataSetName write FOnGetDataSetName;
      property OnGetFieldAsDouble: TppGetFieldAsDoubleEvent read FOnGetFieldAsDouble write FOnGetFieldAsDouble;
      property OnGetFieldAsPicture: TppGetFieldAsPictureEvent read FOnGetFieldAsPicture write FOnGetFieldAsPicture;
      property OnGetFieldAsString: TppGetFieldAsStringEvent read FOnGetFieldAsString write FOnGetFieldAsString;
      property OnGetFieldValue: TppGetFieldValueEvent read FOnGetFieldValue write FOnGetFieldValue;

      property OnGotoBookmark: TppGotoBookmarkEvent read FOnGotoBookmark write FOnGotoBookmark;
      property OnGotoFirstRecord: TNotifyEvent read FOnGotoFirstRecord write FOnGotoFirstRecord;
      property OnGotoLastRecord: TNotifyEvent read FOnGotoLastRecord write FOnGotoLastRecord;
      property OnMasterRecordPositionChange;
      property OnOpenDataSet: TNotifyEvent read FOnOpenDataSet write FOnOpenDataSet;
      property OnRecordPositionChange;
      property OnTraverseBy: TppTraverseByEvent read FOnTraverseBy write FOnTraverseBy;

  end; {class, TppJITPipeline}


  { TppChildJITPipeline }
  TppChildJITPipeline = class(TppJITPipeline)
    public
      function HasParent: Boolean; override;

    end; {class, TppChildJITPipeline}



implementation

{******************************************************************************
 *
 ** C H I L D   J I T  P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppChildJITPipeline.HasParent }

function TppChildJITPipeline.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}



{******************************************************************************
 *
 ** J I T   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppJITPipeline.Create }

constructor TppJITPipeline.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  AutoCreateFields := False;

  FOnCloseDataSet := nil;
  FOnCheckBOF := nil;
  FOnCheckEOF := nil;
  FOnFreeBookmark := nil;
  FOnGetActive := nil;
  FOnGetBookmark := nil;
  FOnGetDataSetName := nil;
  FOnGetFieldAsDouble := nil;
  FOnGetFieldAsPicture := nil;
  FOnGetFieldAsString := nil;
  FOnGetFieldValue := nil;
  FOnGotoBookmark := nil;
  FOnGotoFirstRecord := nil;
  FOnGotoLastRecord := nil;
  FOnOpenDataSet := nil;
  FOnTraverseBy := nil;

  FActive       := False;
  FInitialIndex := 0;
  FRecordCount  := 99999999;
  FRecordIndex  := -1;
  FEOF := False;
  FBOF := False;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppJITPipeline.Destroy }

destructor TppJITPipeline.Destroy;
begin

  Close;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetActive }

function TppJITPipeline.GetActive: Boolean;
begin

  Result := FActive;

  if Assigned(FOnGetActive) then Result := FOnGetActive;

end; {procedure, GetActive}

{------------------------------------------------------------------------------}
{ TppJITPipeline.SaveToCache }

procedure TppJITPipeline.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  inherited SaveToCache(aAbsolutePageNo);

  {save record states}
  lRec.FNoRecords   := (ppdaNoRecords in State);
  lRec.FLastRecord  := (ppdaLastRecord in State);
  lRec.FFirstRecord := (ppdaFirstRecord in State);

  lRec.FTraversalCount := TraversalCount;

  {bookmark record position}
  if not(ppdaNoRecords in State) and GetActive and
     not(CheckBOF) and not(CheckEOF) then
    begin
      lRec.FBookmarked := True;

      lRec.FBookmark := GetBookmark;
    end
  else
    begin
      lRec.FBookmarked := False;

      lRec.FBookmark := 0;
    end;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppJITPipeline.RestoreFromCache }

procedure TppJITPipeline.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  ExcludeState([ppdaNoRecords, ppdaLastRecord, ppdaFirstRecord]);

  if lRec.FNoRecords   then IncludeState([ppdaNoRecords]);
  if lRec.FLastRecord  then IncludeState([ppdaLastRecord]);
  if lRec.FFirstRecord then IncludeState([ppdaFirstRecord]);

  TraversalCount := lRec.FTraversalCount;

  {restore record position}
  if (ppdaFirstRecord in State) then
    First

  else if (ppdaLastRecord in State) then
    Last

  else if lRec.FBookmarked then
    GotoBookmark(lRec.FBookmark);

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetDataSetName }

function TppJITPipeline.GetDataSetName: String;
begin

  Result := Name;

  if Assigned(FOnGetDataSetName) then Result := FOnGetDataSetName;

end; {function, GetDataSetName}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetFieldAsDouble }

function TppJITPipeline.GetFieldAsDouble(aFieldName: String): Double;
begin

  Result := 0;

  if Assigned(FOnGetFieldAsDouble) then Result := FOnGetFieldAsDouble(aFieldName);

end; {function, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetFieldAsPicture }

function TppJITPipeline.GetFieldAsPicture(aFieldName: String): TPicture;
begin

  Result := nil;

  if Assigned(FOnGetFieldAsPicture) then Result := FOnGetFieldAsPicture(aFieldName);

end; {function, GetFieldAsPicture}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetFieldAsString }

function TppJITPipeline.GetFieldAsString(aFieldName: String): String;
var
  lField: TppField;
  
begin

  Result := '';

  if Assigned(FOnGetFieldAsString) then
    Result := FOnGetFieldAsString(aFieldName)
  else
    begin
      lField := GetFieldForName(aFieldName);
      if lField <> nil then
        Result := ppFormat('', lField.DataType , lField.Value);

    end;

end; {function, GetFieldAsString}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetFieldIsCalculated }

function TppJITPipeline.GetFieldIsCalculated(aFieldName: String): Boolean;
begin
  Result := True;
end; {function, GetFieldIsCalculated}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetFieldValue }

function TppJITPipeline.GetFieldValue(aFieldName: String): Variant;
begin
  if not Active then
    Open;

  Result := Null;

  if (ppdaNoRecords in State) then Exit;

  if Assigned(FOnGetFieldValue) then Result := FOnGetFieldValue(aFieldName);

end; {function, GetFieldValue}

{------------------------------------------------------------------------------}
{ TppJITPipeline.FreeBookmark }

procedure TppJITPipeline.FreeBookmark(aBookmark: Longint);
begin

  if Assigned(FOnFreeBookmark) then FOnFreeBookmark(aBookmark);

end; {procedure, FreeBookmark}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetBookmark }

function  TppJITPipeline.GetBookmark: Longint;
begin

  Result := FRecordIndex;

  if Assigned(FOnGetBookmark) then Result := FOnGetBookmark;

end; {procedure, GetBookmark}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GotoBookmark }

procedure TppJITPipeline.GotoBookmark(aBookmark: Longint);
begin

  inherited GotoBookmark(aBookmark);

  SetRecordIndex(aBookmark);

  if Assigned(FOnGotoBookmark) then FOnGotoBookmark(aBookmark);

end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppJITPipeline.CheckBOF }

function TppJITPipeline.CheckBOF: Boolean;
begin

  Result := (FRecordCount = 0) or FBOF;

  if Assigned(FOnCheckBOF) then Result := FOnCheckBOF;

end; {procedure, CheckBOF}

{------------------------------------------------------------------------------}
{ TppJITPipeline.CheckEOF }

function TppJITPipeline.CheckEOF: Boolean;
begin

  Result := (FRecordCount = 0) or FEOF;

  if Assigned(FOnCheckEOF) then Result := FOnCheckEOF;

end; {procedure, CheckEOF}

{------------------------------------------------------------------------------}
{ TppJITPipeline.OpenDataSet }

procedure TppJITPipeline.OpenDataSet;
begin

  if Assigned(FOnOpenDataSet) then FOnOpenDataSet(Self);

  FActive := True;

  GotoFirstRecord;

end; {procedure, OpenDataSet}

{------------------------------------------------------------------------------}
{ TppJITPipeline.CloseDataSet }

procedure TppJITPipeline.CloseDataSet;
begin

  if Assigned(FOnCloseDataSet) then FOnCloseDataSet(Self);

  SetRecordIndex(FInitialIndex);

  FActive := False;


end; {procedure, CloseDataSet}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GotoFirstRecord }

procedure TppJITPipeline.GotoFirstRecord;
begin

  SetRecordIndex(FInitialIndex);

  if Assigned(FOnGotoFirstRecord) then FOnGotoFirstRecord(Self);

end; {procedure, GotoFirstRecord}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GotoLastRecord }

procedure TppJITPipeline.GotoLastRecord;
begin

  SetRecordIndex(GetLastRecordIndex);

  if Assigned(FOnGotoLastRecord) then FOnGotoLastRecord(Self);

end; {procedure, GotoLastRecord}

{------------------------------------------------------------------------------}
{ TppJITPipeline.TraverseBy }

procedure TppJITPipeline.TraverseBy(aIncrement: Integer);
begin

  if FBOF and (aIncrement = 1) then
    GotoFirstRecord

  else if FEOF and (aIncrement = -1) then
    GotoLastRecord

  else
    begin

     SetRecordIndex(FRecordIndex + aIncrement);

     if Assigned(FOnTraverseBy) then FOnTraverseBy(aIncrement);

    end;

end; {procedure, TraverseBy}


{------------------------------------------------------------------------------}
{ TppJITPipeline.SetRecordIndex }

procedure TppJITPipeline.SetRecordIndex(aValue: Integer);
begin

  FRecordIndex := aValue;

  FEOF := FRecordIndex > GetLastRecordIndex;

  if FEOF then
    FRecordIndex := GetLastRecordIndex;

  FBOF := FRecordIndex < FInitialIndex;

  if FBOF then
    FRecordIndex := FInitialIndex;

end; {procedure, SetRecordIndex}

{------------------------------------------------------------------------------}
{ TppJITPipeline.GetLastRecordIndex }

function TppJITPipeline.GetLastRecordIndex: Integer;
begin

  Result := FRecordCount + (FInitialIndex - 1);

end; {procedure, GetLastRecordIndex}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppJITPipeline, TppChildJITPipeline]);

finalization

  UnRegisterClasses([TppJITPipeline, TppChildJITPipeline]);

end.
