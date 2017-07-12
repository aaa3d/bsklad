
{*********************************************}
{                                             }
{ FastReport v2.4 - NativeDB components       }
{             Query component                 }
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 2000-2001 by Stalker SoftWare }
{                                             }
{*********************************************}

unit FR_ASAQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, FR_ASATable, FR_DBUtils,
  NdbBasDS, NdbBase, NdbAsa, NdbAsaDS;

type
  TfrAsaDataSet = class(TfrNativeDataSet)
  private
    FAsaDataSet: TAsaDataSet;
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
    property Query: TAsaDataSet read FAsaDataSet;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_DBSQLEdit, FR_AsaQueryParam
{$IFDEF QBUILDER}
, FR_ASAQB, QBuilder
{$ENDIF}
{$IFDEF Delphi6}
, Variants
{$ENDIF};


{ TfrAsaDataSet }

constructor TfrAsaDataSet.Create;
begin

 inherited Create;

 FAsaDataSet := TAsaDataSet.Create(frDialogForm);
 FAsaDataSet.BeforeOpen := BeforeOpenQuery;
 FDataSet := FAsaDataSet;
 FDataSource.DataSet := FDataSet;

 FParams := TfrVariables.Create;

 Component := FAsaDataSet;
 BaseName := 'AsaDataSet';
 Bmp.LoadFromResourceName(hInstance, 'FR_ASAQUERY');

 // CursorType: TAsaCursorType
 frConsts['actDefault'] := actDefault;
 frConsts['actFixedScroll'] := actFixedScroll;
 frConsts['actInsensitive'] := actInsensitive;
 frConsts['actUnique'] := actUnique;

end; { Create }

destructor TfrAsaDataSet.Destroy;
begin
 FParams.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrAsaDataSet.DefineProperties;

 function GetMasterSource: String;
 var
   i: Integer;
   sl: TStringList;

 begin

   Result := '';
   sl := TStringList.Create;
   frGetComponents(FAsaDataSet.Owner, TDataSet, sl, FAsaDataSet);
   sl.Sort;
   for i := 0 to sl.Count - 1 do
     Result := Result + sl[i] + ';';
   sl.Free;

 end; { GetMasterSource }

begin

  inherited DefineProperties;

  AddProperty('AutoCalcField', [frdtBoolean], nil);
  AddEnumProperty('CursorType','actDefault;actFixedScroll;actInsensitive;actUnique',[actDefault,actFixedScroll,actInsensitive,actUnique]);
  AddProperty('ParamCheck', [frdtBoolean], nil);
  AddProperty('ReadOnly', [frdtBoolean], nil);
  AddEnumProperty('DataSource', GetMasterSource, [Null]);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);

end; { DefineProperties }

procedure TfrAsaDataSet.SetPropValue(Index: String; Value: Variant);
var
  d: TDataSet;

begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'AUTOCALCFIELD' then
   FAsaDataSet.AutoCalcFields := Value
 else
 if Index = 'CURSORTYPE' then
   FAsaDataSet.CursorType := Value
 else
 if Index = 'PARAMCHECK' then
   FAsaDataSet.ParamCheck := Value
 else
 if Index = 'READONLY' then
   FAsaDataSet.ReadOnly := Value
 else
 if Index = 'DATASOURCE' then begin
   d := frFindComponent(FAsaDataSet.Owner, Value) as TDataSet;
   FAsaDataSet.DataSource := frGetDataSource(FAsaDataSet.Owner, d);
 end
 else
 if Index = 'SQL' then
   FAsaDataSet.SQL.Text := Value

end; { SetPropValue }

function TfrAsaDataSet.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'AUTOCALCFIELD' then
   Result := FAsaDataSet.AutoCalcFields
 else
 if Index = 'CURSORTYPE' then
   Result := FAsaDataSet.CursorType
 else
 if Index = 'PARAMCHECK' then
   Result := FAsaDataSet.ParamCheck
 else
 if Index = 'READONLY' then
   Result := FAsaDataSet.ReadOnly
 else
 if Index = 'DATASOURCE' then
   Result := frGetDataSetName(FAsaDataSet.Owner, FAsaDataSet.DataSource)
 else
 if Index = 'SQL' then
   Result := FAsaDataSet.SQL.Text
 else
 if Index = 'SQL.Count' then
   Result := FAsaDataSet.SQL.Count

end; { GetPropValue }

function TfrAsaDataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);

 if Result = Null then
   Result := LinesMethod(FAsaDataSet.SQL, MethodName, 'SQL', Par1, Par2, Par3);

 if MethodName = 'EXECSQL' then begin
   BeforeOpenQuery(FAsaDataSet);
   FAsaDataSet.ExecSQL
 end
 
end; { DoMethod }

procedure TfrAsaDataSet.LoadFromStream(Stream: TStream);
var
  s: String;

begin

 FFixupList.Clear;
 inherited LoadFromStream(Stream);

 FFixupList['Session'] := frReadString(Stream);
 Prop['Session'] := FFixupList['Session'];

 FAsaDataSet.AutoCalcFields := frReadBoolean(Stream);
 FAsaDataSet.CursorType := TAsaCursorType(frReadByte(Stream));
 FAsaDataSet.ParamCheck := frReadBoolean(Stream);
 FAsaDataSet.ReadOnly := frReadBoolean(Stream);

 s := frReadString(Stream);
 FFixupList['DataSource'] := s;
 Prop['DataSource'] := FFixupList['DataSource'];
 frReadMemo(Stream, FAsaDataSet.SQL);

 FFixupList['Active'] := frReadBoolean(Stream);
 ReadFields(Stream);
 ReadParams(Stream);
 try
   FAsaDataSet.Active := FFixupList['Active'];
 except;
 end; { try }

end; { LoadFromStream }

procedure TfrAsaDataSet.SaveToStream(Stream: TStream);
begin

 LVersion := 1;
 inherited SaveToStream(Stream);

 frWriteString(Stream, Prop['Session']);
 frWriteBoolean(Stream,FAsaDataSet.AutoCalcFields);
 frWriteByte(Stream,Byte(FAsaDataSet.CursorType));
 frWriteBoolean(Stream,FAsaDataSet.ParamCheck);
 frWriteBoolean(Stream,FAsaDataSet.ReadOnly);
 frWriteString(Stream, Prop['DataSource']);
 frWriteMemo(Stream, FAsaDataSet.SQL);
 frWriteBoolean(Stream, FAsaDataSet.Active);
 WriteFields(Stream);
 WriteParams(Stream);

end; { SaveToStream }

procedure TfrAsaDataSet.Loaded;
begin
 Prop['DataSource'] := FFixupList['DataSource'];
 inherited Loaded;
end; { Loaded }

procedure TfrAsaDataSet.SQLEditor(Sender: TObject);
begin
 with TfrDBSQLEditorForm.Create(nil) do begin
   Query := FAsaDataSet;
   M1.Lines.Assign(FAsaDataSet.SQL);
{$IFDEF QBUILDER}
   QBEngine := TfrQBASAEngine.Create(nil);
   TfrQBASAEngine(QBEngine).Query := FAsaDataSet;
   QBEngine.DatabaseName := FAsaDataSet.Session.Name;
{$ENDIF}
   if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then begin
     FAsaDataSet.SQL := M1.Lines;
     frDesigner.Modified := True;
   end; { if }
{$IFDEF QBUILDER}
   QBEngine.Free;
{$ENDIF}
   Free;
 end; { with }
end; { SQLEditor }

procedure TfrAsaDataSet.ParamsEditor(Sender: TObject);
var
 Params: TNativeParams;
 ParamValues: TfrVariables;

begin

 if FAsaDataSet.Params.Count > 0 then begin
   Params := TNativeParams.Create(nil);
   Params.Assign(FAsaDataSet.Params);
   ParamValues := TfrVariables.Create;
   ParamValues.Assign(FParams);
   with TfrASAParamsForm.Create(nil) do begin
     QueryComp := Self;
     Query := FAsaDataSet;
     Caption := Self.Name + ' ' + frLoadStr(SParams);
     ParamTypeCB.Visible := False;
     ParamTypeLabel.Visible := False;
     if ShowModal = mrOk then
       frDesigner.Modified := True
     else begin
       FAsaDataSet.Params.Assign(Params);
       FParams.Assign(ParamValues);
     end; { if }
     Free;
   end; { with }
   Params.Free;
   ParamValues.Free;
 end; { if }

end; { ParamsEditor }

function TfrAsaDataSet.GetParamKind(Index: Integer): TfrParamKind;
begin

 Result := pkValue;
 if not FAsaDataSet.Params[Index].Bound then
   Result := pkAssignFromMaster;

end; { GetParamKind }

procedure TfrAsaDataSet.SetParamKind(Index: Integer; Value: TfrParamKind);
begin

 if Value = pkAssignFromMaster then begin
   FAsaDataSet.Params[Index].Bound := False;
   FParams.Delete(FParams.IndexOf(FAsaDataSet.Params[Index].Name));
 end else begin
   FAsaDataSet.Params[Index].Clear;
   FAsaDataSet.Params[Index].Bound := True;
   FParams[FAsaDataSet.Params[Index].Name] := '';
 end; { if }

end; { SetParamKind }

function TfrAsaDataSet.GetParamText(Index: Integer): String;
begin

 Result := '';
 if ParamKind[Index] = pkValue then
   Result := FParams[FAsaDataSet.Params[Index].Name];

end; { GetParamText }

procedure TfrAsaDataSet.SetParamText(Index: Integer; Value: String);
begin
 if ParamKind[Index] = pkValue then
   FParams[FAsaDataSet.Params[Index].Name] := Value;
end; { SetParamText }

procedure TfrAsaDataSet.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;

begin

 Stream.Read(n, 2);
 for i := 0 to n - 1 do
   with FAsaDataSet.Params[i] do begin
     Stream.Read(w, 2);
     DataType := AsaDataTypes[w];
     Stream.Read(w, 2);
     ParamKind[i] := TfrParamKind(w);
     ParamText[i] := frReadString(Stream);
   end; { with }

end; { ReadParams }

procedure TfrAsaDataSet.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;

begin

 w := FAsaDataSet.Params.Count;
 Stream.Write(w, 2);

 for i := 0 to FAsaDataSet.Params.Count - 1 do
   with FAsaDataSet.Params[i] do begin
     for w := 0 to 10 do
       if DataType = AsaDataTypes[w] then break;
     Stream.Write(w, 2);
     w := Word(ParamKind[i]);
     Stream.Write(w, 2);
     frWriteString(Stream, ParamText[i]);
   end; { with }

end; { WriteParams }

procedure TfrAsaDataSet.BeforeOpenQuery(DataSet: TDataSet);
var
  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

 function DefParamValue(Param: TNativeParam): String;
 begin
   if Param.DataType in [ntDate, ntDateTime] then
     Result := '01.01.00'
   else if Param.DataType = ntTime then
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
   while i < FAsaDataSet.Params.Count do begin
     if ParamKind[i] = pkValue then
       if DocMode = dmPrinting then
         FAsaDataSet.Params[i].Text := frParser.Calc(ParamText[i]) else
         FAsaDataSet.Params[i].Text := DefParamValue(FAsaDataSet.Params[i]);
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
  Bmp.LoadFromResourceName(hInstance, 'FR_ASAQUERYCONTROL');
  frRegisterControl(TfrAsaDataSet, Bmp, IntToStr(SInsertQuery));

finalization
  frUnRegisterObject(TfrAsaDataSet);
  Bmp.Free;

end.

