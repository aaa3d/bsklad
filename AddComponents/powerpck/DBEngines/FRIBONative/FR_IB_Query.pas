
{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{             Query component              }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_IB_Query;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, IB_Components, FR_IB_Dataset, FR_DBUtils;

type
  TfrIB_Query = class(TfrIB_BDataset)
  private
    FQuery: TIB_Query;
    FParams: TfrVariables;
//    procedure ParamsEditor(Sender: TObject);
//    procedure ReadParams(Stream: TStream);
//    procedure WriteParams(Stream: TStream);
//    function GetParamKind(Index: Integer): TfrParamKind;
//    procedure SetParamKind(Index: Integer; Value: TfrParamKind);
//    function GetParamText(Index: Integer): String;
//    procedure SetParamText(Index: Integer; Value: String);
    procedure BeforeOpenQuery(DataSet: TIB_DataSet);
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
    procedure LinesEditor(Sender: TObject);
    property Query: TIB_Query read FQuery;
//    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
//    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;

implementation

uses
  FR_Utils, FR_Const, FR_LEdit;


{ TfrIB_Query }

constructor TfrIB_Query.Create;
begin
  inherited Create;
  FQuery := TIB_Query.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FDataSet := FQuery;
  FDataSource.DataSet := FDataSet;

  FParams := TfrVariables.Create;

  Component := FQuery;
  BaseName := 'IB_Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_IB_QUERY');
end;

destructor TfrIB_Query.Destroy;
begin
  FParams.Free;
  FDataSet := nil;
  FQuery.Free;
  inherited Destroy;
end;

procedure TfrIB_Query.DefineProperties;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FQuery.Owner, TIB_DataSet, sl, FQuery);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
//  AddProperty('Params', [frdtHasEditor, frdtOneObject], LinesEditor);
//  AddProperty('Params.Count', [], nil);
  AddProperty('SQL', [frdtHasEditor], QueryEditor);
  AddProperty('SQL.Count', [], nil);
end;

procedure TfrIB_Query.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
//  if Index = 'PARAMS' then
//    FQuery.Params.Text := Value
//  else
    if Index = 'SQL' then
    FQuery.SQL.Text := Value
end;

function TfrIB_Query.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
//  if Index = 'PARAMS.COUNT' then
//    Result := FQuery.Params.Count
//  else if Index = 'PARAMS' then
//    Result := FQuery.Params.Text
//  else
  if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SQL.Count;
end;

function TfrIB_Query.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
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
  FFixupList['Active'] := frReadBoolean(Stream);
//  ReadParams(Stream);
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrIB_Query.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FQuery.Filter);
  frWriteMemo(Stream, FQuery.SQL);
  frWriteBoolean(Stream, FQuery.Active);
//  WriteParams(Stream);
end;

procedure TfrIB_Query.Loaded;
begin
//  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

procedure TfrIB_Query.LinesEditor(Sender: TObject);
var
  sl: TStringList;
//  SaveConnected: Boolean;
begin
  sl := TStringList.Create;
  with TfrLinesEditorForm.Create(nil) do
  begin
{    if FQuery.Params.Text = '' then
      M1.Text := sl.Text else
      M1.Text := FQuery.Params.Text;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FQuery.Connected;
      FQuery.Connected := False;
      FQuery.Params.Text := M1.Text;
      FQuery.Connected := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
}
  end;
  sl.Free;
end;

{
procedure TfrIB_Query.ParamsEditor(Sender: TObject);
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
    with TfrIBOParamsForm.Create(nil) do
    begin
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' ' + frLoadStr(SParams);
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

function TfrIB_Query.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
  if not FQuery.Params[Index].Bound then
    Result := pkAssignFromMaster;
end;

procedure TfrIB_Query.SetParamKind(Index: Integer; Value: TfrParamKind);
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

function TfrIB_Query.GetParamText(Index: Integer): String;
begin
  Result := '';
  if ParamKind[Index] = pkValue then
    Result := FParams[FQuery.Params[Index].Name];
end;

procedure TfrIB_Query.SetParamText(Index: Integer; Value: String);
begin
  if ParamKind[Index] = pkValue then
    FParams[FQuery.Params[Index].Name] := Value;
end;

procedure TfrIB_Query.ReadParams(Stream: TStream);
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

procedure TfrIB_Query.WriteParams(Stream: TStream);
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
}
procedure TfrIB_Query.BeforeOpenQuery(DataSet: TIB_DataSet);
var
//  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

{  function DefParamValue(Param: TIB_Row): String;
  begin
    if Param.DataType in [ftDate, ftDateTime] then
      Result := '01.01.00'
    else if Param.DataType = ftTime then
      Result := '00:00'
    else
      Result := '0';
  end;
}
begin
  SaveView := CurView;
  CurView := nil;
  SavePage := CurPage;
  CurPage := ParentPage;
  SaveBand := CurBand;
  CurBand := nil;
{  i := 0;
  try
    while i < FQuery.Params.ColumnCount do
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
}
  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
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

