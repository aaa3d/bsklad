{*********************************************}
{                                             }
{ FastReport v2.4 - SQLDirect components      }
{             Query component                 }
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 1997-2001 by Yuri Sheino.     }
{ Copyright (c) 2001 by Stalker SoftWare      }
{                                             }
{*********************************************}

unit FR_SDQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, FR_SDCommon, FR_DBUtils, SDEngine;

type
  TfrSDQuery = class(TfrSDDataSet)
  private
    FSDQuery: TSDQuery;
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
    property Query: TSDQuery read FSDQuery;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_DBSQLEdit, FR_SDParam
{$IFDEF QBUILDER}
, FR_SDQB, QBuilder
{$ENDIF}
{$IFDEF Delphi6}
, Variants
{$ENDIF};

{ TfrSDQuery }

constructor TfrSDQuery.Create;
begin

 inherited Create;

 FSDQuery := TSDQuery.Create(frDialogForm);
 FSDQuery.BeforeOpen := BeforeOpenQuery;
 FDataSet := FSDQuery;
 FDataSource.DataSet := FDataSet;

 FParams := TfrVariables.Create;

 Component := FSDQuery;
 BaseName := 'SDQuery';
 Bmp.LoadFromResourceName(hInstance, 'FR_SDQUERY');

end; { Create }

destructor TfrSDQuery.Destroy;
begin
 FParams.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrSDQuery.DefineProperties;

 function GetMasterSource: String;
 var
   i: Integer;
   sl: TStringList;

 begin

   Result := '';
   sl := TStringList.Create;
   frGetComponents(FSDQuery.Owner, TDataSet, sl, FSDQuery);
   sl.Sort;
   for i := 0 to sl.Count - 1 do
     Result := Result + sl[i] + ';';
   sl.Free;

 end; { GetMasterSource }

begin

  inherited DefineProperties;

  AddEnumProperty('DataSource', GetMasterSource, [Null]);
  AddProperty('ParamCheck', [frdtBoolean], nil);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);

end; { DefineProperties }

procedure TfrSDQuery.SetPropValue(Index: String; Value: Variant);
var
  d: TDataSet;

begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'DATASOURCE' then begin
   d := frFindComponent(FSDQuery.Owner, Value) as TDataSet;
   FSDQuery.DataSource := frGetDataSource(FSDQuery.Owner, d);
 end
 else
 if Index = 'PARAMCHECK' then
   FSDQuery.ParamCheck := Value
 else
 if Index = 'SQL' then
   FSDQuery.SQL.Text := Value

end; { SetPropValue }

function TfrSDQuery.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'DATASOURCE' then
   Result := frGetDataSetName(FSDQuery.Owner, FSDQuery.DataSource)
 else
 if Index = 'PARAMCHECK' then
   Result := FSDQuery.ParamCheck
 else
 if Index = 'SQL' then
   Result := FSDQuery.SQL.Text
 else
 if Index = 'SQL.Count' then
   Result := FSDQuery.SQL.Count

end; { GetPropValue }

function TfrSDQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);

 if Result = Null then
   Result := LinesMethod(FSDQuery.SQL, MethodName, 'SQL', Par1, Par2, Par3);

 if MethodName = 'EXECSQL' then begin
   BeforeOpenQuery(FSDQuery);
   FSDQuery.ExecSQL
 end
 
end; { DoMethod }

procedure TfrSDQuery.LoadFromStream(Stream: TStream);
var
  s: String;

begin

 FFixupList.Clear;
 inherited LoadFromStream(Stream);

 FSDQuery.DatabaseName := frReadString(Stream);
 FSDQuery.SessionName := frReadString(Stream);
 FSDQuery.AutoCalcFields := frReadBoolean(Stream);

 s := frReadString(Stream);
 FFixupList['DataSource'] := s;
 Prop['DataSource'] := FFixupList['DataSource'];

 FSDQuery.DetachOnFetchAll := frReadBoolean(Stream);
 FSDQuery.ParamCheck := frReadBoolean(Stream);
 FSDQuery.Preservation := frReadBoolean(Stream);
 frReadMemo(Stream, FSDQuery.SQL);
 FFixupList['Active'] := frReadBoolean(Stream);

 ReadFields(Stream);
 ReadParams(Stream);
 try
   FSDQuery.Active := FFixupList['Active'];
 except;
 end; { try }

end; { LoadFromStream }

procedure TfrSDQuery.SaveToStream(Stream: TStream);
begin

 LVersion := 1;
 inherited SaveToStream(Stream);

 frWriteString(Stream, FSDQuery.DatabaseName);
 frWriteString(Stream, FSDQuery.SessionName);
 frWriteBoolean(Stream,FSDQuery.AutoCalcFields);
 frWriteString(Stream, Prop['DataSource']);

 frWriteBoolean(Stream,FSDQuery.DetachOnFetchAll);
 frWriteBoolean(Stream,FSDQuery.ParamCheck);
 frWriteBoolean(Stream,FSDQuery.Preservation);
 frWriteMemo(Stream, FSDQuery.SQL);
 frWriteBoolean(Stream, FSDQuery.Active);
 WriteFields(Stream);
 WriteParams(Stream);

end; { SaveToStream }

procedure TfrSDQuery.Loaded;
begin
 Prop['DataSource'] := FFixupList['DataSource'];
 inherited Loaded;
end; { Loaded }

procedure TfrSDQuery.SQLEditor(Sender: TObject);
begin
 with TfrDBSQLEditorForm.Create(nil) do begin
   Query := FSDQuery;
   M1.Lines.Assign(FSDQuery.SQL);
   if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
     FSDQuery.SQL := M1.Lines;
     frDesigner.Modified := True;
   end; { if }
   Free;
 end; { with }
end; { SQLEditor }

procedure TfrSDQuery.ParamsEditor(Sender: TObject);
var
 Params      :TParams;
 ParamValues :TfrVariables;

begin

 if FSDQuery.Params.Count > 0 then begin
   Params := TParams.Create(nil);
   Params.Assign(FSDQuery.Params);
   ParamValues := TfrVariables.Create;
   ParamValues.Assign(FParams);
   with TfrSDParamsForm.Create(nil) do begin
     QueryComp := Self;
     Query := FSDQuery;
     Caption := Self.Name + ' ' + frLoadStr(SParams);
     ParamTypeCB.Visible := False;
     ParamTypeLabel.Visible := False;
     if ShowModal = mrOk then
       frDesigner.Modified := True
     else begin
       FSDQuery.Params.Assign(Params);
       FParams.Assign(ParamValues);
     end; { if }
     Free;
   end; { with }
   Params.Free;
   ParamValues.Free;
 end; { if }

end; { ParamsEditor }

function TfrSDQuery.GetParamKind(Index: Integer): TfrParamKind;
begin

 Result := pkValue;
 if not FSDQuery.Params[Index].Bound then
   Result := pkAssignFromMaster;

end; { GetParamKind }

procedure TfrSDQuery.SetParamKind(Index: Integer; Value: TfrParamKind);
begin

 if Value = pkAssignFromMaster then begin
   FSDQuery.Params[Index].Bound := False;
   FParams.Delete(FParams.IndexOf(FSDQuery.Params[Index].Name));
 end else begin
   FSDQuery.Params[Index].Clear;
   FSDQuery.Params[Index].Bound := True;
   FParams[FSDQuery.Params[Index].Name] := '';
 end; { if }

end; { SetParamKind }

function TfrSDQuery.GetParamText(Index: Integer): String;
begin

 Result := '';
 if ParamKind[Index] = pkValue then
   Result := FParams[FSDQuery.Params[Index].Name];

end; { GetParamText }

procedure TfrSDQuery.SetParamText(Index: Integer; Value: String);
begin
 if ParamKind[Index] = pkValue then
   FParams[FSDQuery.Params[Index].Name] := Value;
end; { SetParamText }

procedure TfrSDQuery.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;

begin

 Stream.Read(n, 2);
 for i := 0 to n - 1 do
   with FSDQuery.Params[i] do begin
     Stream.Read(w, 2);
     DataType := SDDataTypes[w];
     Stream.Read(w, 2);
     ParamKind[i] := TfrParamKind(w);
     ParamText[i] := frReadString(Stream);
   end; { with }

end; { ReadParams }

procedure TfrSDQuery.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;

begin

 w := FSDQuery.Params.Count;
 Stream.Write(w, 2);

 for i := 0 to FSDQuery.Params.Count - 1 do
   with FSDQuery.Params[i] do begin
     for w := 0 to 10 do
       if DataType = SDDataTypes[w] then break;
     Stream.Write(w, 2);
     w := Word(ParamKind[i]);
     Stream.Write(w, 2);
     frWriteString(Stream, ParamText[i]);
   end; { with }

end; { WriteParams }

procedure TfrSDQuery.BeforeOpenQuery(DataSet: TDataSet);
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
 end; { DefParamValue }

begin

 SaveView := CurView;
 CurView := nil;
 SavePage := CurPage;
 CurPage := ParentPage;
 SaveBand := CurBand;
 CurBand := nil;

 i := 0;
 try
   while i < FSDQuery.Params.Count do begin
     if ParamKind[i] = pkValue then
       if DocMode = dmPrinting then
         FSDQuery.Params[i].Text := frParser.Calc(ParamText[i]) else
         FSDQuery.Params[i].Text := DefParamValue(FSDQuery.Params[i]);
     Inc(i);
   end; { with }
 except
   Memo.Clear;
   Memo.Add(ParamText[i]);
   CurView := Self;
   raise;
 end; { try }

 CurView := SaveView;
 CurPage := SavePage;
 CurBand := SaveBand;

end; { BeforeOpenQuery }

                      
var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_SDQUERYCONTROL');
  frRegisterControl(TfrSDQuery, Bmp, IntToStr(SInsertQuery));

finalization
  frUnRegisterObject(TfrSDQuery);
  Bmp.Free;

end.

