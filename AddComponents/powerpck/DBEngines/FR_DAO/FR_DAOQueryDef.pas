
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{             QueryDef component           }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOQueryDef;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, DAOQueryDef, FR_DAOTable, FR_DBUtils;

type
  TfrDAOQueryDef = class(TfrDAODataSet)
  private
    FQueryDef: TDAOQueryDef;
    FParams: TfrVariables;
    procedure ParamsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    function GetParamKind(Index: Integer): TfrParamKind;
    procedure SetParamKind(Index: Integer; Value: TfrParamKind);
    function GetParamText(Index: Integer): String;
    procedure SetParamText(Index: Integer; Value: String);

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
    property QueryDef: TDAOQueryDef read FQueryDef;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses FR_Utils, FR_Const, FR_DAOQueryDefParam, DAOQuery;


{ TfrDAOQueryDef }

constructor TfrDAOQueryDef.Create;
begin
  inherited Create;
  FQueryDef := TDAOQueryDef.Create(frDialogForm);
  FQueryDef.BeforeOpen := BeforeOpenQuery;
  FDataSet := FQueryDef;
  FDataSource.DataSet := FDataSet;
  FParams := TfrVariables.Create;

  Component := FQueryDef;
  BaseName := 'QueryDef';
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOQUERYDEF');
end;

destructor TfrDAOQueryDef.Destroy;
begin
  FParams.Free;
  FDataSet := nil;
  FQueryDef.Free;
  inherited Destroy;
end;

procedure TfrDAOQueryDef.DefineProperties;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FQueryDef.Owner, TDataSet, sl, FQueryDef);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetQueryDefNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    if FQueryDef.Database <> nil then
    begin
      sl := TStringList.Create;
      FQueryDef.DataBase.GetQueryDefNames(sl);
      sl.Sort;
      for i := 0 to sl.Count - 1 do
        Result := Result + sl[i] + ';';
      sl.Free;
    end;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('DataSource', GetMasterSource, [Null]);
  AddEnumProperty('QueryDefName', GetQueryDefNames, [Null]);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('Filter', [frdtString], nil);
end;

procedure TfrDAOQueryDef.SetPropValue(Index: String; Value: Variant);
var
  d: TDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATASOURCE' then
  begin
    d := frFindComponent(FQueryDef.Owner, Value) as TDataSet;
    FQueryDef.DataSource := frGetDataSource(FQueryDef.Owner, d);
  end
  else if Index = 'QUERYDEFNAME' then
   FQueryDef.QueryDefName := Value
  else if Index = 'FILTER' then
  begin
    FQueryDef.Filter := Value;
    FQueryDef.Filtered := Trim(Value) <> '';
  end;
end;

function TfrDAOQueryDef.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATASOURCE' then
    Result := frGetDataSetName(FQueryDef.Owner, FQueryDef.DataSource)
  else if Index = 'QUERYDEFNAME' then
   Result := FQueryDef.QueryDefName
  else if Index = 'FILTER' then
    Result := FQueryDef.Filter
end;

function TfrDAOQueryDef.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then FQueryDef.Open;
end;

procedure TfrDAOQueryDef.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FFixupList['DataBase'] := frReadString(Stream);
  Prop['DataBase'] := FFixupList['DataBase'];
  FQueryDef.QueryDefName := frReadString(Stream);
  FQueryDef.Filter := frReadString(Stream);
  FQueryDef.Filtered := Trim(FQueryDef.Filter) <> '';
  s := frReadString(Stream);
  FFixupList['DataSource'] := s;
  Prop['DataSource'] := FFixupList['DataSource'];

  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  ReadParams(Stream);
  try
    FQueryDef.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrDAOQueryDef.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FQueryDef.QueryDefName);
  frWriteString(Stream, FQueryDef.Filter);
  frWriteString(Stream, Prop['DataSource']);
  frWriteBoolean(Stream, FQueryDef.Active);
  WriteFields(Stream);
  WriteParams(Stream);
end;

procedure TfrDAOQueryDef.Loaded;
begin
  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

procedure TfrDAOQueryDef.ParamsEditor(Sender: TObject);
var
  Params: TParams;
  ParamValues: TfrVariables;
begin
  if FQueryDef.Params.Count > 0 then
  begin
    Params := TParams.Create;
    Params.Assign(FQueryDef.Params);
    ParamValues := TfrVariables.Create;
    ParamValues.Assign(FParams);
    with TfrDAODefParamsForm.Create(nil) do
    begin
      QueryDefComp := Self;
      QueryDef := FQueryDef;
      Caption := Self.Name + ' ' + LoadStr(SParams);
      if ShowModal = mrOk then
        frDesigner.Modified := True
      else
      begin
        FQueryDef.Params.Assign(Params);
        FParams.Assign(ParamValues);
      end;
      Free;
    end;
    Params.Free;
    ParamValues.Free;
  end;
end;

function TfrDAOQueryDef.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
  if not FQueryDef.Params[Index].Bound then
    Result := pkAssignFromMaster;
end;

procedure TfrDAOQueryDef.SetParamKind(Index: Integer; Value: TfrParamKind);
begin
  if Value = pkAssignFromMaster then
  begin
    FQueryDef.Params[Index].Bound := False;
    FParams.Delete(FParams.IndexOf(FQueryDef.Params[Index].Name));
  end
  else
  begin
    FQueryDef.Params[Index].Clear;
    FQueryDef.Params[Index].Bound := True;
    FParams[FQueryDef.Params[Index].Name] := '';
  end;
end;

function TfrDAOQueryDef.GetParamText(Index: Integer): String;
begin
  Result := '';
  if ParamKind[Index] = pkValue then
    Result := FParams[FQueryDef.Params[Index].Name];
end;

procedure TfrDAOQueryDef.SetParamText(Index: Integer; Value: String);
begin
  if ParamKind[Index] = pkValue then
    FParams[FQueryDef.Params[Index].Name] := Value;
end;

procedure TfrDAOQueryDef.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;
begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQueryDef.Params[i] do
  begin
    Stream.Read(w, 2);
    DataType := ParamTypes[w];
    Stream.Read(w, 2);
    ParamKind[i] := TfrParamKind(w);
    ParamText[i] := frReadString(Stream);
  end;
end;

procedure TfrDAOQueryDef.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  w := FQueryDef.Params.Count;
  Stream.Write(w, 2);
  for i := 0 to FQueryDef.Params.Count - 1 do
  with FQueryDef.Params[i] do
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

procedure TfrDAOQueryDef.BeforeOpenQuery(DataSet: TDataSet);
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
    while i < FQueryDef.Params.Count do
    begin
      if ParamKind[i] = pkValue then
        if DocMode = dmPrinting then
          FQueryDef.Params[i].Text := frParser.Calc(ParamText[i]) else
          FQueryDef.Params[i].Text := DefParamValue(FQueryDef.Params[i]);
      Inc(i);
    end;
  except
    Memo.Clear;
    Memo.Add(ParamText[i]);
    CurView := Self;
    raise;
  end;

  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOQUERYDEFCONTROL');
  frRegisterControl(TfrDAOQueryDef, Bmp, 'Insert QueryDef');

finalization
  frUnRegisterObject(TfrDAOQueryDef);
  Bmp.Free;

end.

