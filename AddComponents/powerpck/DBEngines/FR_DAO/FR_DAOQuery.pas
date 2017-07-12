
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{             Query component              }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, DAOQuery, FR_DAOTable, FR_DBUtils;

type
  TfrDAOQuery = class(TfrDAODataSet)
  private
    FQuery: TDAOQuery;
    FParams: TfrVariables;
    FMacros: TfrVariables;
    procedure SQLEditor(Sender: TObject);
    procedure MacrosEditor(Sender: TObject);
    procedure ParamsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    function GetParamKind(Index: Integer): TfrParamKind;
    procedure SetParamKind(Index: Integer; Value: TfrParamKind);
    function GetParamText(Index: Integer): String;
    procedure SetParamText(Index: Integer; Value: String);
    function GetMacroText(Index: Integer): String;
    procedure SetMacroText(Index: Integer; Value: String);
    procedure ReadMacros(Stream: TStream);
    procedure WriteMacros(Stream: TStream);

    procedure BeforeOpenQuery(DataSet: TDataSet);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    property Query: TDAOQuery read FQuery;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
    property MacroText[Index: Integer]: String read GetMacroText write SetMacroText;
  end;


implementation

uses FR_Utils, FR_Const, FR_DBSQLEdit, FR_DAOQueryParam;


{ TfrDAOQuery }

constructor TfrDAOQuery.Create;
begin
  inherited Create;
  FQuery := TDAOQuery.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FDataSet := FQuery;
  FDataSource.DataSet := FDataSet;
  FParams := TfrVariables.Create;
  FMacros := TfrVariables.Create;

  Component := FQuery;
  BaseName := 'Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOQUERY');
end;

destructor TfrDAOQuery.Destroy;
begin
  FParams.Free;
  FMacros.Free;
  FDataSet := nil;
  FQuery.Free;
  inherited Destroy;
end;

procedure TfrDAOQuery.DefineProperties;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FQuery.Owner, TDataSet, sl, FQuery);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('DataSource', GetMasterSource, [Null]);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('Macros', [frdtHasEditor], MacrosEditor);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);
end;

procedure TfrDAOQuery.SetPropValue(Index: String; Value: Variant);
var
  d: TDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATASOURCE' then
  begin
    d := frFindComponent(FQuery.Owner, Value) as TDataSet;
    FQuery.DataSource := frGetDataSource(FQuery.Owner, d);
  end
  else if Index = 'SQL' then
    FQuery.SQL.Text := Value
  else if Index = 'FILTER' then
  begin
    FQuery.Filter := Value;
    FQuery.Filtered := Trim(Value) <> '';
  end;
end;

function TfrDAOQuery.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATASOURCE' then
    Result := frGetDataSetName(FQuery.Owner, FQuery.DataSource)
  else if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SQL.Count
  else if Index = 'FILTER' then
    Result := FQuery.Filter
end;

function TfrDAOQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FQuery.SQL, MethodName, 'SQL', Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then
    FQuery.Open;
end;

procedure TfrDAOQuery.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FFixupList['DataBase'] := frReadString(Stream);
  Prop['DataBase'] := FFixupList['DataBase'];
  FQuery.Filter := frReadString(Stream);
  FQuery.Filtered := Trim(FQuery.Filter) <> '';
  s := frReadString(Stream);
  FFixupList['DataSource'] := s;
  Prop['DataSource'] := FFixupList['DataSource'];
  frReadMemo(Stream, FQuery.SQL);

  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  ReadParams(Stream);
  ReadMacros(Stream);
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrDAOQuery.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FQuery.Filter);
  frWriteString(Stream, Prop['DataSource']);
  frWriteMemo(Stream, FQuery.SQL);
  frWriteBoolean(Stream, FQuery.Active);
  WriteFields(Stream);
  WriteParams(Stream);
  WriteMacros(Stream);
end;

procedure TfrDAOQuery.Loaded;
begin
  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

procedure TfrDAOQuery.SQLEditor(Sender: TObject);
begin
  with TfrDBSQLEditorForm.Create(nil) do
  begin
    Query := FQuery;
    M1.Lines := FQuery.SQL;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then
    begin
      FQuery.SQL := M1.Lines;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;

procedure TfrDAOQuery.MacrosEditor(Sender: TObject);
var
  Macros: TParams;
  MacroValues: TfrVariables;
begin
  if FQuery.MacroCount > 0 then
  begin
    Macros := TParams.Create;
    Macros.Assign(FQuery.Macros);
    MacroValues := TfrVariables.Create;
    MacroValues.Assign(FMacros);
    with TfrDAOParamsForm.Create(nil) do
    begin
      M := True;
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' Macros';
      if ShowModal = mrOk then
        frDesigner.Modified := True
      else
      begin
        FQuery.Macros.Assign(Macros);
        FMacros.Assign(MacroValues);
      end;
      Free;
    end;
    Macros.Free;
    MacroValues.Free;
  end;
end;

procedure TfrDAOQuery.ParamsEditor(Sender: TObject);
var
  Params: TParams;
  ParamValues: TfrVariables;
begin
  if FQuery.Params.Count > 0 then
  begin
    Params := TParams.Create;
    Params.Assign(FQuery.Params);
    ParamValues := TfrVariables.Create;
    ParamValues.Assign(FParams);
    with TfrDAOParamsForm.Create(nil) do
    begin
      M := False;
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' ' + LoadStr(SParams);
      if ShowModal = mrOk then
        frDesigner.Modified := True
      else
      begin
        FQuery.Params.Assign(Params);
        FParams.Assign(ParamValues);
      end;
      Free;
    end;
    Params.Free;
    ParamValues.Free;
  end;
end;

function TfrDAOQuery.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
  if not FQuery.Params[Index].Bound then
    Result := pkAssignFromMaster;
end;

procedure TfrDAOQuery.SetParamKind(Index: Integer; Value: TfrParamKind);
begin
  if Value = pkAssignFromMaster then
  begin
    FQuery.Params[Index].Bound := False;
    FParams.Delete(FParams.IndexOf(FQuery.Params[Index].Name));
  end
  else
  begin
    FQuery.Params[Index].Clear;
    FQuery.Params[Index].Bound := True;
    FParams[FQuery.Params[Index].Name] := '';
  end;
end;

function TfrDAOQuery.GetParamText(Index: Integer): String;
begin
  Result := '';
  if ParamKind[Index] = pkValue then
    Result := FParams[FQuery.Params[Index].Name];
end;

procedure TfrDAOQuery.SetParamText(Index: Integer; Value: String);
begin
  if ParamKind[Index] = pkValue then
    FParams[FQuery.Params[Index].Name] := Value;
end;

function TfrDAOQuery.GetMacroText(Index: Integer): String;
begin
  Result := FMacros[FQuery.Macros.Items[Index].Name];
end;

procedure TfrDAOQuery.SetMacroText(Index: Integer; Value: String);
begin
  FMacros[FQuery.Macros.Items[Index].Name] := Value;
end;

procedure TfrDAOQuery.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;
begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQuery.Params[i] do
  begin
    Stream.Read(w, 2);
    DataType := ParamTypes[w];
    Stream.Read(w, 2);
    ParamKind[i] := TfrParamKind(w);
    ParamText[i] := frReadString(Stream);
  end;
end;

procedure TfrDAOQuery.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  w := FQuery.Params.Count;
  Stream.Write(w, 2);
  for i := 0 to FQuery.Params.Count - 1 do
  with FQuery.Params[i] do
  begin
    for w := 0 to 10 do
      if DataType = ParamTypes[w] then
        break;
    Stream.Write(w, 2);
    w := Word(ParamKind[i]);
    Stream.Write(w, 2);
    frWriteString(Stream, ParamText[i]);
  end;
end;

procedure TfrDAOQuery.ReadMacros(Stream: TStream);
var
  i: Integer;
  w, n: Word;
begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQuery.Macros.Items[i] do
  begin
    Stream.Read(w, 2);
    DataType := ParamTypes[w];
    Stream.Read(w, 2);
//    ParamKind[i] := TfrParamKind(w);
    MacroText[i] := frReadString(Stream);
  end;
end;

procedure TfrDAOQuery.WriteMacros(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  w := FQuery.MacroCount;
  Stream.Write(w, 2);
  for i := 0 to FQuery.MacroCount - 1 do
  with FQuery.Macros.Items[i] do
  begin
    for w := 0 to 10 do
      if DataType = ParamTypes[w] then
        break;
    Stream.Write(w, 2);
    w := Word({ParamKind[i]}1);
    Stream.Write(w, 2);
    frWriteString(Stream, MacroText[i]);
  end;
end;

procedure TfrDAOQuery.BeforeOpenQuery(DataSet: TDataSet);
var
  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

  function DefParamValue(Param: TParam): String;
  begin
    if Param.DataType in [ftDate, ftDateTime] then
      Result := '01.01.00'
    else if Param.DataType = ftTime then
      Result := '00:00'
    else
      Result := '0';
  end;

begin
  SaveView := CurView;
  CurView := nil;
  SavePage := CurPage;
  CurPage := ParentPage;
  SaveBand := CurBand;
  CurBand := nil;

  i := 0;
  try
    while i < FQuery.Params.Count do
    begin
      if ParamKind[i] = pkValue then
        if DocMode = dmPrinting then
          FQuery.Params[i].Text := frParser.Calc(ParamText[i]) else
          FQuery.Params[i].Text := DefParamValue(FQuery.Params[i]);
      Inc(i);
    end;
  except
    Memo.Clear;
    Memo.Add(ParamText[i]);
    CurView := Self;
    raise;
  end;

  for i := 0 to FQuery.MacroCount - 1 do
    if DocMode = dmPrinting then
      FQuery.Macros.Items[i].Text := MacroText[i] else
      FQuery.Macros.Items[i].Text := '';

  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOQUERYCONTROL');
  frRegisterControl(TfrDAOQuery, Bmp, LoadStr(SInsertQuery));

finalization
  frUnRegisterObject(TfrDAOQuery);
  Bmp.Free;

end.

