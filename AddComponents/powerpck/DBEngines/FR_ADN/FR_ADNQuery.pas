{******************************************}
{                                          }
{     FastReport v2.4 - ADO components     }
{             Query component              }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

(*  Adapted by A-D-E.net for use with ADONIS ado components.

    tested with ADONIS 4.1 and ADO 2.6

    date : 6 feb. 2001


*)

(* note : international date and time for sql server 7.0
   (from the online help files)
   
   ADO, OLE DB, and ODBC applications should use the ODBC timestamp, date, and time escape clauses of:
   { ts 'yyyy-mm-dd hh:mm:ss[.fff] '} such as: { ts '1998-09-24 10:02:20' }
   { d 'yyyy-mm-dd'} such as: { d '1998-09-24' }
   { t 'hh:mm:ss'} such as: { t '10:02:20'}


*)


{$I ADN.inc}



unit FR_ADNQuery;

interface

{$I ..\FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, ADODS, FR_ADNTable, FR_DBUtils
  {$IFDEF STATEINFORMATION}
  , oqbestate
  {$ENDIF}
  ;

type


  TfrADNQuery = class(TfrADNDataSet)
  private
    FQuery: TADOQuery;
    FParams: TfrVariables;
    procedure SQLEditor(Sender: TObject);
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
    property Query: TADOQuery read FQuery;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_DBSQLEdit, FR_ADNQueryParam
  {$IFDEF QBUILDER}
  , FR_ADNQB, QBuilder
  {$ENDIF};


{ TfrADNQuery }

constructor TfrADNQuery.Create;
begin
  inherited Create;
  FQuery := TADOQuery.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FDataSet := TADODataSet(FQuery);
  FDataSource.DataSet := FDataSet;

  FParams := TfrVariables.Create;

  Component := FQuery;
  BaseName := 'Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_ADOQUERY');
end;

destructor TfrADNQuery.Destroy;
begin
  FParams.Free;
  inherited Destroy;
end;

procedure TfrADNQuery.DefineProperties;

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
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);
end;

procedure TfrADNQuery.SetPropValue(Index: String; Value: Variant);
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
end;

function TfrADNQuery.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATASOURCE' then
    Result := frGetDataSetName(FQuery.Owner, FQuery.DataSource)
  else if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SQL.Count;
end;

function TfrADNQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FQuery.SQL, MethodName, 'SQL', Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then
    FQuery.ExecSQL
end;

procedure TfrADNQuery.LoadFromStream(Stream: TStream);
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
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrADNQuery.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FQuery.Filter);
  frWriteString(Stream, Prop['DataSource']);
  frWriteMemo(Stream, FQuery.SQL);
  frWriteBoolean(Stream, FQuery.Active);
  WriteFields(Stream);
  WriteParams(Stream);
end;

procedure TfrADNQuery.Loaded;
begin
  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

{$IFNDEF QBUILDER}
procedure TfrADNQuery.SQLEditor(Sender: TObject);
begin
  with TfrDBSQLEditorForm.Create(nil) do
  begin
    Query := FQuery;
    M1.Lines.Assign(FQuery.SQL);
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then
    begin
      FQuery.SQL := M1.Lines;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;
{$ENDIF}



{$IFDEF QBUILDER}

  {$IFDEF NORMALVERSION}
  procedure TfrADNQuery.SQLEditor(Sender: TObject);
  begin
    with TfrDBSQLEditorForm.Create(nil) do begin
      Query := FQuery;
      M1.Lines.Assign(FQuery.SQL);
      QBEngine := TfrQBADNEngine.Create(nil);
      TfrQBADNEngine(QBEngine).Query := FQuery;
      QBEngine.DatabaseName := Prop['Database'];
      if ( frm.ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
        FQuery.SQL := M1.Lines;
        frDesigner.Modified := True;
      end;
      QBEngine.Free;
      Free;
    end;
  end;
  {$ENDIF}


  { A-D-E.net
    Save QBE state information in frVariables
        Names : <query name>._QBE_

  }
  {$IFNDEF NORMALVERSION}
  procedure TfrADNQuery.SQLEditor(Sender: TObject);
  var
    sName : string;
    {$IFDEF STATEINFORMATION}
    sState : string;
    {$ENDIF}
    frm : TfrDBSQLEditorForm;
  begin
    frm := nil;
    try
      frm := TfrDBSQLEditorForm.Create(nil);
      frm.Query := FQuery;
      frm.M1.Lines.Assign(FQuery.SQL);
      frm.QBEngine := TfrQBADNEngine.Create(nil);
      TfrQBADNEngine(frm.QBEngine).Query := FQuery;
      frm.QBEngine.DatabaseName := Prop['Database'];
      sName := Query.Name + '.' + '_QBE_';
      if frVariables.IndexOf( sName ) = -1 then begin
        frVariables.Insert( frVariables.Count , sName );
        frVariables.Variable[ sName ] := '';
      end;
      {$IFDEF STATEINFORMATION}
      // restore CRLF
      sState := frVariables.Variable[ sName ];
      TOQBStateEngine( frm.QBEngine ).State.Text     := StringReplace( sState, '&@',#13#10, [rfReplaceAll] );
      {$ENDIF}
      if ( frm.ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
        FQuery.SQL := frm.M1.Lines;
        frDesigner.Modified := True;
        {$IFDEF STATEINFORMATION}
        // replace CRLF
        sState     := TOQBStateEngine( frm.QBEngine ).State.Text;
        frVariables.Variable[ sName ] := StringReplace( sState , #13#10 , '&@', [rfReplaceAll] );
       {$ENDIF}
      end;
      frm.QBEngine.Free;
    finally
      frm.Free;
    end;
  end;
  {$ENDIF}

{$ENDIF}






procedure TfrADNQuery.ParamsEditor(Sender: TObject);
var
  Params: TParams;
  ParamValues: TfrVariables;
begin
  if FQuery.Params.Count > 0 then
  begin
    Params := TParams.Create(FQuery);
    Params.AssignValues(FQuery.Params);
    ParamValues := TfrVariables.Create;
    ParamValues.Assign(FParams);
    with TfrADNParamsForm.Create(nil) do
    begin
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' ' + LoadStr(SParams);
      if ShowModal = mrOk then
        frDesigner.Modified := True
      else
      begin
        FQuery.Params.AssignValues(Params);
        FParams.Assign(ParamValues);
      end;
      Free;
    end;
    Params.Free;
    ParamValues.Free;
  end;
end;

function TfrADNQuery.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
  if not (paNullable in FQuery.Params[Index].ParamAttributes ) then
    Result := pkAssignFromMaster;
end;

procedure TfrADNQuery.SetParamKind(Index: Integer; Value: TfrParamKind);
begin
  if Value = pkAssignFromMaster then
  begin
    FQuery.Params[Index].ParamAttributes := [];
    FParams.Delete(FParams.IndexOf(FQuery.Params[Index].Name));
  end
  else
  begin
    FQuery.Params[Index].ParamAttributes := [paNullable];
    FParams[FQuery.Params[Index].Name] := '';
  end;
end;

function TfrADNQuery.GetParamText(Index: Integer): String;
var
  v: Variant;
begin
  v := '';
  if ParamKind[Index] = pkValue then
    v := FParams[FQuery.Params[Index].Name];
  if v = Null then
    v := '';
  Result := v;
end;

procedure TfrADNQuery.SetParamText(Index: Integer; Value: String);
begin
  if ParamKind[Index] = pkValue then
    FParams[FQuery.Params[Index].Name] := Value;
end;

procedure TfrADNQuery.ReadParams(Stream: TStream);
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

procedure TfrADNQuery.WriteParams(Stream: TStream);
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

procedure TfrADNQuery.BeforeOpenQuery(DataSet: TDataSet);
var
  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;


  function DefParamValue(Param: TParam ): String;
  begin
    if Param.DataType in [ftDate, ftDateTime] then
      Result := '2001/01/01'
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
      FQuery.Params[i].ParamType := ptInput;  { Adonis needs this }
      if ParamKind[i] = pkValue then
        if DocMode = dmPrinting then
          FQuery.Params[i].Value := frParser.Calc(ParamText[i])
        else
          FQuery.Params[i].Value := DefParamValue(FQuery.Params[i]);
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
  Bmp.LoadFromResourceName(hInstance, 'FR_ADOQUERYCONTROL');
  frRegisterControl(TfrADNQuery, Bmp, LoadStr(SInsertQuery));

finalization
  frUnRegisterObject(TfrADNQuery);
  Bmp.Free;

end.


