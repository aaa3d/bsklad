{******************************************}
{ }
{ FastReport v3.0 }
{ DB dataset }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDBSet;

interface

{$I frx.inc}

uses
  SysUtils, Windows, Messages, Classes, frxClass, DB
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxDBDataset = class(TfrxCustomDBDataset)
  private
    FBookmark:TBookmark;
    FDataSet:TDataSet;
    FDataSource:TDataSource;
    FDS:TDataSet;
    FEof:Boolean;
    FSaveOpenEvent:TDatasetNotifyEvent;
    procedure CreateFields(Sender:TDataset);
    procedure SetDataSet(Value:TDataSet);
    procedure SetDataSource(Value:TDataSource);
    function DataSetActive:Boolean;
    function IsDataSetStored:Boolean;
  protected
    function GetDisplayText(Index:String):String; override;
    function GetDisplayWidth(Index:String):Integer; override;
    function GetFieldType(Index:String):TfrxFieldType; override;
    function GetValue(Index:String):Variant; override;
    procedure Notification(AComponent:TComponent; Operation:TOperation); override;
  public
    procedure Initialize; override;
    procedure Finalize; override;
    procedure First; override;
    procedure Next; override;
    procedure Prior; override;
    procedure Open; override;
    procedure Close; override;
    function Eof:Boolean; override;

    function GetDataSet:TDataSet;
    function IsBlobField(const fName:String):Boolean; override;
    function RecordCount:Integer; override;
    procedure AssignBlobTo(const fName:String; Obj:TObject); override;
    procedure GetFieldList(List:TStrings); override;
  published
    property DataSet:TDataSet read FDataSet write SetDataSet stored IsDataSetStored;
    property DataSource:TDataSource read FDataSource write SetDataSource stored IsDataSetStored;
  end;

implementation

uses frxUtils, frxRes;

type
  EDSError = class(Exception);

{ TfrxDBDataset }

procedure TfrxDBDataset.Notification(AComponent:TComponent; Operation:TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent = FDataSource then
      DataSource:= nil
    else if AComponent = FDataSet then
      DataSet:= nil
end;

procedure TfrxDBDataset.SetDataSet(Value:TDataSet);
begin
  FDataSet:= Value;
  if Value<>nil then
    FDataSource:= nil;
  FDS:= GetDataSet;
end;

procedure TfrxDBDataset.SetDataSource(Value:TDataSource);
begin
  FDataSource:= Value;
  if Value<>nil then
    FDataSet:= nil;
  FDS:= GetDataSet;
end;

function TfrxDBDataset.DataSetActive:Boolean;
begin
  Result:= (FDS<>nil) and FDS.Active;
end;

function TfrxDBDataset.GetDataset:TDataSet;
begin
  if FDataSet<>nil then
    Result:= FDataSet
  else if (FDataSource<>nil) and (FDataSource.DataSet<>nil) then
    Result:= FDataSource.DataSet
  else
    Result:= nil;
end;

function TfrxDBDataset.IsDataSetStored:Boolean;
begin
  Result:= Report = nil;
end;

procedure TfrxDBDataset.CreateFields(Sender:TDataset);
var
  i:Integer;
begin
  GetFieldList(Fields);
  for i:= 0 to Fields.Count-1 do
    Fields.Objects[i]:= FDS.FieldByName(ConvertAlias(Fields[i]));

  if Assigned(FSaveOpenEvent) then
    FSaveOpenEvent(Sender);
end;

procedure TfrxDBDataset.Initialize;
begin
  FDS:= GetDataSet;
  if FDS = nil then
    raise Exception.Create(Format(frxResources.Get('dbNotConn'), [Name]));

  FSaveOpenEvent:= FDS.AfterOpen;
  FDS.AfterOpen:= CreateFields;
  FEof:= False;
  FInitialized:= False;
end;

procedure TfrxDBDataset.Finalize;
begin
  if FDS = nil then Exit;
  if FBookMark<>nil then
  begin
    FDS.GotoBookmark(FBookmark);
    FDS.FreeBookmark(FBookmark);
  end;
  FBookMark:= nil;

  if CloseDataSource then
    Close;
  FDS.AfterOpen:= FSaveOpenEvent;
  FSaveOpenEvent:= nil;
  FInitialized:= False;
end;

procedure TfrxDBDataSet.Open;
var
  i:Integer;
begin
  if FInitialized then
    Exit;

  FInitialized:= True;
  FDS.Open;
  if (RangeBegin = rbCurrent) or (RangeEnd = reCurrent) then
    FBookmark:= FDS.GetBookmark else
    FBookmark:= nil;

  GetFieldList(Fields);
  for i:= 0 to Fields.Count-1 do
    Fields.Objects[i]:= FDS.FindField(ConvertAlias(Fields[i]));

  inherited;
end;

procedure TfrxDBDataSet.Close;
begin
  inherited;

  if FBookMark<>nil then
    FDS.FreeBookmark(FBookmark);
  FBookMark:= nil;

  FInitialized:= False;
  FDS.Close;
end;

procedure TfrxDBDataSet.First;
begin
  if not FInitialized then
    Open;
  if RangeBegin = rbFirst then
    FDS.First else
    FDS.GotoBookmark(FBookmark);
  FEof:= False;
  inherited First;
end;

procedure TfrxDBDataSet.Next;
var
  b:TBookmark;
begin
  if not FInitialized then
    Open;
  FEof:= False;
  if RangeEnd = reCurrent then
  begin
    b:= FDS.GetBookmark;
    if FDS.CompareBookmarks(b, FBookmark) = 0 then
      FEof:= True;
    FDS.FreeBookmark(b);
    Exit;
  end;
  FDS.Next;
  inherited Next;
end;

procedure TfrxDBDataSet.Prior;
begin
  if not FInitialized then
    Open;
  FDS.Prior;
  inherited Prior;
end;

function TfrxDBDataSet.Eof:Boolean;
begin
  if not FInitialized then
    Open;
  Result:= inherited Eof or FDS.Eof or FEof;
end;

function TfrxDBDataset.GetDisplayText(Index:String):String;
var
  i:Integer;
begin
  if not FInitialized then
    Open;
  if DataSetActive then
    if Fields.Count = 0 then
      Result:= FDS.FieldByName(Index).DisplayText
    else
    begin
      i:= Fields.IndexOf(Index);
      if i<>-1 then
        Result:= TField(Fields.Objects[i]).DisplayText
      else
      begin
        Result:= frxResources.Get('dbFldNotFound')+' '+UserName+'."'+
          Index+'"';
        ReportRef.Errors.Add(ReportRef.CurObject+':'+Result);
      end;
    end
  else
    Result:= UserName+'."'+Index+'"';
end;

function TfrxDBDataset.GetValue(Index:String):Variant;
var
  i:Integer;
begin
  if not FInitialized then
    Open;
  i:= Fields.IndexOf(Index);
  if i<>-1 then
    Result:= TField(Fields.Objects[i]).Value
  else
  begin
    Result:= Null;
    ReportRef.Errors.Add(ReportRef.CurObject+':'+
      frxResources.Get('dbFldNotFound')+' '+UserName+'."'+Index+'"');
  end;
end;

function TfrxDBDataset.GetDisplayWidth(Index:String):Integer;
var
  f:TField;
  fDef:TFieldDef;
begin
  Result:= 10;
  Index:= ConvertAlias(Index);
  f:= FDS.FindField(Index);
  if f<>nil then
    Result:= f.DisplayWidth
  else
  begin
    try
      if not FDS.FieldDefs.Updated then
        FDS.FieldDefs.Update;
    except
    end;
    fDef:= FDS.FieldDefs.Find(Index);
    if fDef<>nil then
      case fDef.DataType of
        ftString, ftWideString:Result:= fDef.Size;
        ftLargeInt:Result:= 15;
        ftDateTime:Result:= 20;
      end;
  end;
end;

function TfrxDBDataset.GetFieldType(Index:String):TfrxFieldType;
var
  f:TField;
begin
  Result:= fftNumeric;
  f:= FDS.FindField(ConvertAlias(Index));
  if f<>nil then
    case f.DataType of
      ftString, ftWideString, ftMemo:
        Result:= fftString;
      ftBoolean:
        Result:= fftBoolean;
     end;
end;

procedure TfrxDBDataset.AssignBlobTo(const fName:String; Obj:TObject);
var
  Field:TField;
begin
  if not FInitialized then
    Open;
  Field:= TField(Fields.Objects[Fields.IndexOf(fName)]);

  if Obj is TPersistent then
    TPersistent(Obj).Assign(Field) else
  if Obj is TStream then
  begin
    TBlobField(Field).SaveToStream(TStream(Obj));
    TStream(Obj).Position:= 0;
  end;
end;

procedure TfrxDBDataset.GetFieldList(List:TStrings);
var
  i:Integer;
begin
  List.Clear;
  if FieldAliases.Count = 0 then
  begin
    try
      if FDS<>nil then
        FDS.GetFieldNames(List);
    except
    end;
  end
  else
  begin
    for i:= 0 to FieldAliases.Count-1 do
      if Pos('-', FieldAliases.Names[i])<>1 then
        List.Add(FieldAliases.Values[FieldAliases.Names[i]]);
  end;
end;

function TfrxDBDataset.IsBlobField(const fName:String):Boolean;
var
  Field:TField;
  i:Integer;
begin
  if not FInitialized then
    Open;
  Result:= False;
  i:= Fields.IndexOf(fName);
  if i<>-1 then
  begin
    Field:= TField(Fields.Objects[i]);
    Result:= (Field<>nil) and Field.IsBlob;
  end;
end;

function TfrxDBDataset.RecordCount:Integer;
begin
  if not FInitialized then
    Open;
  Result:= FDS.RecordCount;
end;

end.
