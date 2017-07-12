{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{             Query component              }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{    Copyright (c) 2001 by Chugunov A.     }
{                                          }
{******************************************}

unit FR_IB_Query;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, IB_Components, FR_DBUtils, FR_DBSet;

type
  TfrIB_Query = class(TfrNonVisualControl)
  private
    FQuery: TIB_Query;
    FDataSource: TIB_DataSource;
    FDBDataSet: TfrDBDataset;
    FParams: TIB_StringList;
    procedure ParamsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    procedure BeforeOpenQuery(DataSet: TIB_DataSet);
  protected
    procedure SQLEditor(Sender: TObject);
    procedure MasterLinksEditor(Sender: TObject);
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure ShowEditor; override;
    property Query: TIB_Query read FQuery;
  end;

implementation

uses
  FR_Utils, FR_Const, FR_LEdit, FR_DSet, FR_IBOQueryParam, Variants;

{ TfrIB_Query }

constructor TfrIB_Query.Create;
begin
  inherited Create;
  FDataSource := TIB_DataSource.Create(frDialogForm);

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;

  FParams := TIB_StringList.Create;

  FQuery := TIB_Query.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FQuery.ReadOnly := True;
  FDataSource.DataSet := FQuery;

  Component := FQuery;
  BaseName := 'IB_Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_IB_QUERY');
end;

destructor TfrIB_Query.Destroy;
begin
  FDataSet := nil;
  FQuery.Free;
  FParams.Free;
  FDBDataset.Free;
  FDataSource.Free;
  inherited Destroy;
end;

procedure TfrIB_Query.DefineProperties;

  function GetConnections: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TIB_Connection, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetTransactions: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TIB_Transaction, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TIB_DataSource, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Active', [frdtBoolean], nil);
  AddEnumProperty('IB_Connection', GetConnections, [Null]);
  AddEnumProperty('IB_Transaction', GetTransactions, [Null]);
  AddEnumProperty('MasterSource', GetMasterSource, [Null]);
  AddProperty('MasterLinks', [frdtHasEditor], MasterLinksEditor);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('EOF', [], nil);
  AddProperty('RecordCount', [], nil);
  AddProperty('IsEmpty', [], nil);
  AddProperty('Params', [frdtHasEditor, frdtOneObject], ParamsEditor);
  AddProperty('Params.Count', [], nil);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);
  AddProperty('DS_CloseDataSource', [frdtBoolean], nil);
  AddProperty('DS_OpenDataSource', [frdtBoolean], nil);
  AddEnumProperty('DS_RangeBegin', 'rbFirst;rbCurrent', [rbFirst, rbCurrent]);
  AddEnumProperty('DS_RangeEnd', 'reLast;reCurrent;reCount', [reLast, reCurrent, reCount]);
  AddProperty('DS_RangeEndCount', [frdtInteger], nil);
end;

procedure TfrIB_Query.SetPropValue(Index: String; Value: Variant);
var
  d : TIB_Connection;
  d2: TIB_DataSource;
  dt: TIB_Transaction;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'NAME' then
  begin
    FDataSource.Name := 'S' + FQuery.Name;
    FDBDataSet.Name := '_' + FQuery.Name;
  end
  else if Index = 'ACTIVE' then
    FQuery.Active := Value
  else if Index = 'IB_CONNECTION' then
  begin
    d := frFindComponent(FQuery.Owner, Value) as TIB_Connection;
    FQuery.IB_Connection := d;
  end
  else if Index = 'IB_TRANSACTION' then
  begin
    dt := frFindComponent(FQuery.Owner, Value) as TIB_Transaction;
    FQuery.IB_Transaction := dt;
  end
  else if Index = 'MASTERSOURCE' then
  begin
    d2 := frFindComponent(FQuery.Owner, Value) as TIB_DataSource;
    FQuery.MasterSource := d2;
  end
  else if Index = 'MASTERLINKS' then
  begin
    FQuery.MasterLinks.Text := Value;
  end
  else if Index = 'FILTER' then
  begin
    FQuery.Filter := Value;
    FQuery.Filtered := Trim(Value) <> '';
  end
  else if Index = 'SQL' then
  begin
    FQuery.SQL.Text := Value;
  end
  else if Index = 'DS_CLOSEDATASOURCE' then
  begin
    FDBDataSet.CloseDataSource := Value;
  end
  else if Index = 'DS_OPENDATASOURCE' then
  begin
    FDBDataSet.OpenDataSource := Value;
  end
  else if Index = 'DS_RANGEBEGIN' then
  begin
    FDBDataSet.RangeBegin := Value;
  end
  else if Index = 'DS_RANGEEND' then
  begin
    FDBDataSet.RangeEnd := Value;
  end
  else if Index = 'DS_RANGEENDCOUNT' then
  begin
    FDBDataSet.RangeEndCount := Value;
  end
end;


function TfrIB_Query.GetPropValue(Index: String): Variant;

  function frGetConnectionName(Owner: TComponent; d: TIB_Connection): String;
  begin
    Result := '';
    if d <> nil then begin
      Result := d.Name;
      if d.Owner <> Owner then
        Result := d.Owner.Name + '.' + Result;
    end;
  end;

  function frGetTransactionName(Owner: TComponent; d: TIB_Transaction): String;
  begin
    Result := '';
    if (d <> nil) and (d.Owner <> FQuery) then begin
      Result := d.Name;
      if d.Owner <> Owner then
        Result := d.Owner.Name + '.' + Result;
    end;
  end;

  function frGetMasterSourceName(Owner: TComponent; d: TIB_DataSource): String;
  begin
    Result := '';
    if d <> nil then begin
      Result := d.Name;
      if d.Owner <> Owner then
        Result := d.Owner.Name + '.' + Result;
    end;
  end;

begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'ACTIVE' then
    Result := FQuery.Active
  else if Index = 'IB_CONNECTION' then
    Result := frGetConnectionName(FQuery.Owner, FQuery.IB_Connection)
  else if Index = 'IB_TRANSACTION' then
    Result := frGetTransactionName(FQuery.Owner, FQuery.IB_Transaction)
  else if Index = 'MASTERSOURCE' then
    Result := frGetMasterSourceName(FQuery.Owner, FQuery.MasterSource)
  else if Index = 'MASTERLINKS' then
    Result := FQuery.MasterLinks.Text
  else if Index = 'FILTER' then
    Result := FQuery.Filter
  else if Index = 'EOF' then
    Result := FQuery.Eof
  else if Index = 'RECORDCOUNT' then
    Result := FQuery.RecordCount
  else if Index = 'ISEMPTY' then
    Result := FQuery.IsEmpty
  else if Index = 'PARAMS.COUNT' then
    Result := FQuery.Params.ColumnCount
  else if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.COUNT' then
    Result := FQuery.SQL.Count
  else if Index = 'DS_CLOSEDATASOURCE' then
    Result := FDBDataSet.CloseDataSource
  else if Index = 'DS_OPENDATASOURCE' then
    Result := FDBDataSet.OpenDataSource
  else if Index = 'DS_RANGEBEGIN' then
    Result := FDBDataSet.RangeBegin
  else if Index = 'DS_RANGEEND' then
    Result := FDBDataSet.RangeEnd
  else if Index = 'DS_RANGEENDCOUNT' then
    Result := FDBDataSet.RangeEndCount;
end;

function TfrIB_Query.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if MethodName = 'GETINDEXPROPERTY' then
  begin
    if Par1 = 'FIELDS' then
      Result := FQuery.FieldByName(Par2).AsVariant;
  end
  else if MethodName = 'OPEN' then
    FQuery.Open
  else if MethodName = 'CLOSE' then
    FQuery.Close
  else if MethodName = 'NEXT' then
    FQuery.Next
  else if MethodName = 'PRIOR' then
    FQuery.Prior
  else if MethodName = 'FIRST' then
    FQuery.First
  else if MethodName = 'LAST' then
    FQuery.Last
  else if MethodName = 'FETCHALL' then
    FQuery.FetchAll;
  if Result = Null then
    Result := LinesMethod(FQuery.SQL, MethodName, 'SQL', Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then
    FQuery.ExecSQL
end;

procedure TfrIB_Query.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FQuery.Filter := frReadString(Stream);
  FQuery.Filtered := Trim(FQuery.Filter) <> '';
  frReadMemo(Stream, FQuery.SQL);
  s := frReadString(Stream);
  FFixupList['IB_Connection'] := s;
  Prop['IB_Connection'] := FFixupList['IB_Connection'];
  s := frReadString(Stream);
  FFixupList['IB_Transaction'] := s;
  Prop['IB_Transaction'] := FFixupList['IB_Transaction'];
  s := frReadString(Stream);
  FFixupList['MasterSource'] := s;
  Prop['MasterSource'] := FFixupList['MasterSource'];
  FQuery.MasterLinks.Text := frReadString(Stream);
  FDBDataSet.CloseDataSource := frReadBoolean(Stream);
  FDBDataSet.OpenDataSource := frReadBoolean(Stream);
  s := frReadString(Stream);
  FFixupList['DS_RangeBegin'] := s;
  Prop['DS_RangeBegin'] := FFixupList['DS_RangeBegin'];
  s := frReadString(Stream);
  FFixupList['DS_RangeEnd'] := s;
  Prop['DS_RangeEnd'] := FFixupList['DS_RangeEnd'];
  FDBDataSet.RangeEndCount := frReadInteger(Stream);
  FFixupList['Active'] := frReadBoolean(Stream);
  ReadParams(Stream);
  FParams.Assign(FQuery.ParamValueLinks);
  try
    FQuery.Active := FFixupList['Active'];
    FQuery.ParamValueLinks.Assign(FParams);
  except;
  end;
end;

procedure TfrIB_Query.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FQuery.Filter);
  frWriteMemo(Stream, FQuery.SQL);
  frWriteString(Stream, Prop['IB_Connection']);
  frWriteString(Stream, Prop['IB_Transaction']);
  frWriteString(Stream, Prop['MasterSource']);
  frWriteString(Stream, FQuery.MasterLinks.Text);
  frWriteBoolean(Stream, FDBDataSet.CloseDataSource);
  frWriteBoolean(Stream, FDBDataSet.OpenDataSource);
  frWriteString(Stream, Prop['DS_RangeBegin']);
  frWriteString(Stream, Prop['DS_RangeEnd']);
  frWriteInteger(Stream, FDBDataSet.RangeEndCount);
  frWriteBoolean(Stream, FQuery.Active);
  WriteParams(Stream);
end;

procedure TfrIB_Query.ParamsEditor(Sender: TObject);
begin
  if FQuery.Params.ColumnCount > 0 then
  begin
    with TfrIBOParamsForm.Create(nil) do
    begin
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' ' + frLoadStr(SParams);
      if ShowModal = mrOk then begin
        FParams.Assign(FQuery.ParamValueLinks);
        frDesigner.Modified := True;
      end else begin
        FQuery.ParamValueLinks.Assign(FParams);
      end;
      Free;
    end;
  end;
end;

procedure TfrIB_Query.ReadParams(Stream: TStream);
var
  i: Integer;
  n: Word;
  s: string;
begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQuery.Params[i] do
  begin
    s := frReadString(Stream);
    Query.ParamValueLinks.LinkValues[s + ' ::'] := frReadString(Stream);
  end;
end;

procedure TfrIB_Query.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  if Query.Active then begin
    w := Query.Params.ColumnCount;
    Stream.Write(w, 2);
    for i := 0 to Query.Params.ColumnCount - 1 do begin
      frWriteString(Stream, Query.Params[i].BestFieldName);
      frWriteString(Stream, Query.ParamValueLinks.LinkValues[Query.Params[i].BestFieldName + ' ::']);
    end;
  end else begin
    w := Query.ParamValueLinks.Count;
    Stream.Write(w, 2);
    for i := 0 to Query.ParamValueLinks.Count - 1 do begin
      frWriteString(Stream, Copy(Query.ParamValueLinks.IndexNames[i], 1, Length(Query.ParamValueLinks.IndexNames[i])-3));
      frWriteString(Stream, Query.ParamValueLinks.IndexValues[i]);
    end;
  end;
end;

procedure TfrIB_Query.BeforeOpenQuery(DataSet: TIB_DataSet);
var
  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

begin
  SaveView := CurView;
  CurView := nil;
  SavePage := CurPage;
  CurPage := ParentPage;
  SaveBand := CurBand;
  CurBand := nil;

  i := 0;
  try
    if FQuery.ParamValueLinks.Count <> FParams.Count then
      FQuery.ParamValueLinks.Assign(FParams);
    while i < FQuery.Params.ColumnCount do
    begin
      if (Copy(FQuery.Params.Columns[i].BestFieldName, 1, 5) <> 'MLNK_') then
        FQuery.Params[i].Value := frParser.Calc(Query.ParamValueLinks.LinkValues[FQuery.Params[i].BestFieldName + ' ::']);
      Inc(i);
    end;
  except
    Memo.Clear;
    Memo.Add(FQuery.Params[i].Value);
    CurView := Self;
    raise;
  end;

  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;

procedure TfrIB_Query.ShowEditor;
begin
  SQLEditor(nil);
end;

procedure TfrIB_Query.SQLEditor(Sender: TObject);
var
  SaveConnected: Boolean;
begin
  with TfrLinesEditorForm.Create(nil) do
  begin
    M1.Lines.Assign(FQuery.SQL);
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FQuery.Active;
      FQuery.Active := False;
      FQuery.SQL.Assign(M1.Lines);
      FQuery.Active := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;

procedure TfrIB_Query.MasterLinksEditor(Sender: TObject);
var
  SaveConnected: Boolean;
begin
  with TfrLinesEditorForm.Create(nil) do
  begin
    M1.Text := FQuery.MasterLinks.Text;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FQuery.Active;
      FQuery.Active := False;
      FQuery.MasterLinks.Text := M1.Text;
      FQuery.Active := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_IB_QUERYCONTROL');
  frRegisterControl(TfrIB_Query, Bmp, IntToStr(SInsertQuery));

finalization
  frUnRegisterObject(TfrIB_Query);
  Bmp.Free;

end.

