
{******************************************}
{                                          }
{ FastReport v2.4 - NativeDB components    }
{        StoredProc component              }
{                                          }
{ Copyright (c) 2001 by Stalker SoftWare   }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_ASA_SP;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, FR_ASATable, FR_DBUtils,
  NdbBasDS, NdbBase, NdbAsa, NdbAsaDS;

type
  TfrAsaStoredProc = class(TfrNativeDataSet)
  private
    FAsaStoredProc: TAsaStoredProc;
    FParams: TfrVariables;
    procedure ParamsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    function GetParamKind(Index: Integer): TfrParamKind;
    procedure SetParamKind(Index: Integer; Value: TfrParamKind);
    function GetParamText(Index: Integer): String;
    procedure SetParamText(Index: Integer; Value: String);
    procedure BeforeOpenQuery(DataSet: TDataSet);
    function GetOutParam(vPar: Variant): Variant;
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
    property Query: TAsaStoredProc read FAsaStoredProc;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_DBSQLEdit, FR_AsaQuery, FR_AsaQueryParam
{$IFDEF Delphi6}
, Variants
{$ENDIF};


{ TfrAsaStoredProc }

constructor TfrAsaStoredProc.Create;
begin

 inherited Create;

 FAsaStoredProc := TAsaStoredProc.Create(frDialogForm);
 FAsaStoredProc.BeforeOpen := BeforeOpenQuery;
 FDataSet := FAsaStoredProc;
 FDataSource.DataSet := FDataSet;

 FParams := TfrVariables.Create;

 Component := FAsaStoredProc;
 BaseName := 'AsaStoredProc';
 Bmp.LoadFromResourceName(hInstance, 'FR_ASASTOREDPROC');

end; { Create }

destructor TfrAsaStoredProc.Destroy;
begin
 FParams.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrAsaStoredProc.DefineProperties;
begin

 inherited DefineProperties;

 AddProperty('AutoCalcField', [frdtBoolean], nil);
 AddProperty('Params', [frdtHasEditor], ParamsEditor);
 AddProperty('StoredProcName', [frdtString], nil);
 AddProperty('GetOutParam',[],nil);

end; { DefineProperties }

procedure TfrAsaStoredProc.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'AUTOCALCFIELD' then
   FAsaStoredProc.AutoCalcFields := Value
 else
 if Index = 'STOREDPROCNAME' then begin
   FAsaStoredProc.StoredProcName := Value;
   if Value <> '' then
     FAsaStoredProc.Prepare;
 end;

end; { SetPropValue }

function TfrAsaStoredProc.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'AUTOCALCFIELD' then
   Result := FAsaStoredProc.AutoCalcFields
 else
 if Index = 'STOREDPROCNAME' then
   Result := FAsaStoredProc.StoredProcName

end; { GetPropValue }

function TfrAsaStoredProc.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);

 if MethodName = 'EXECPROC' then begin
   BeforeOpenQuery(FAsaStoredProc);
   FAsaStoredProc.ExecProc;
 end
 else
 if MethodName = 'GETOUTPARAM' then
   Result := GetOutParam(frParser.Calc(Par1));

end; { DoMethod }

procedure TfrAsaStoredProc.LoadFromStream(Stream: TStream);
begin

 FFixupList.Clear;
 inherited LoadFromStream(Stream);

 FFixupList['Session'] := frReadString(Stream);
 Prop['Session'] := FFixupList['Session'];

 FAsaStoredProc.StoredProcName := frReadString(Stream);
 FAsaStoredProc.AutoCalcFields := frReadBoolean(Stream);

 FFixupList['Active'] := frReadBoolean(Stream);
 ReadFields(Stream);
 ReadParams(Stream);
 try
   FAsaStoredProc.Active := FFixupList['Active'];
 except;
 end; { try }

end; { LoadFromStream }

procedure TfrAsaStoredProc.SaveToStream(Stream: TStream);
begin

 LVersion := 1;
 inherited SaveToStream(Stream);

 frWriteString(Stream, Prop['Session']);
 frWriteString(Stream, FAsaStoredProc.StoredProcName);
 frWriteBoolean(Stream,FAsaStoredProc.AutoCalcFields);
 frWriteBoolean(Stream, FAsaStoredProc.Active);
 WriteFields(Stream);
 WriteParams(Stream);

end; { SaveToStream }

procedure TfrAsaStoredProc.Loaded;
begin
 inherited Loaded;
end; { Loaded }

procedure TfrAsaStoredProc.ParamsEditor(Sender: TObject);
var
 Params: TNativeParams;
 ParamValues: TfrVariables;

begin

 if FAsaStoredProc.Params.Count > 0 then begin
   Params := TNativeParams.Create(nil);
   Params.Assign(FAsaStoredProc.Params);
   ParamValues := TfrVariables.Create;
   ParamValues.Assign(FParams);
   with TfrASAParamsForm.Create(nil) do begin
     QueryComp := TfrAsaDataSet(Self);
     Query := FAsaStoredProc;
     Caption := Self.Name + ' ' + LoadStr(SParams);
     if ShowModal = mrOk then
       frDesigner.Modified := True
     else begin
       FAsaStoredProc.Params.Assign(Params);
       FParams.Assign(ParamValues);
     end; { if }
     Free;
   end; { with }
   Params.Free;
   ParamValues.Free;
 end; { if }

end; { ParamsEditor }

function TfrAsaStoredProc.GetParamKind(Index: Integer): TfrParamKind;
begin

 Result := pkValue;
 if not FAsaStoredProc.Params[Index].Bound then
   Result := pkAssignFromMaster;

end; { GetParamKind }

procedure TfrAsaStoredProc.SetParamKind(Index: Integer; Value: TfrParamKind);
begin

 if Value = pkAssignFromMaster then begin
   FAsaStoredProc.Params[Index].Bound := False;
   FParams.Delete(FParams.IndexOf(FAsaStoredProc.Params[Index].Name));
 end else begin
   FAsaStoredProc.Params[Index].Clear;
   FAsaStoredProc.Params[Index].Bound := True;
   FParams[FAsaStoredProc.Params[Index].Name] := '';
 end; { if }

end; { SetParamKind }

function TfrAsaStoredProc.GetParamText(Index: Integer): String;
begin

 Result := '';
 if ParamKind[Index] = pkValue then
   Result := FParams[FAsaStoredProc.Params[Index].Name];

end; { GetParamText }

procedure TfrAsaStoredProc.SetParamText(Index: Integer; Value: String);
begin
 if ParamKind[Index] = pkValue then
   FParams[FAsaStoredProc.Params[Index].Name] := Value;
end; { SetParamText }

procedure TfrAsaStoredProc.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;

begin

 Stream.Read(n, 2);

 if (n > 0) and (FAsaStoredProc.StoredProcName <> '') then
   FAsaStoredProc.Prepare;

 for i := 0 to n - 1 do
   with FAsaStoredProc.Params[i] do begin

     // Читаем тип данных параметра
     Stream.Read(w, 2);
     DataType := AsaDataTypes[w];

     // Читаем вид параметра
     Stream.Read(w, 2);
     ParamType := AsaParamTypes[w];

     Stream.Read(w, 2);
     ParamKind[i] := TfrParamKind(w);

     ParamText[i] := frReadString(Stream);

   end; { with }

end; { ReadParams }

procedure TfrAsaStoredProc.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;

begin

 w := FAsaStoredProc.Params.Count;
 Stream.Write(w, 2);

 for i := 0 to FAsaStoredProc.Params.Count - 1 do
   with FAsaStoredProc.Params[i] do begin

     // Сохраняем тип данных параметра
     for w := 0 to 10 do
       if DataType = AsaDataTypes[w] then break;
     Stream.Write(w, 2);

     // Сохряняем вид параметра
     for w := 0 to 4 do
       if ParamType = AsaParamTypes[w] then break;
     Stream.Write(w, 2);

     w := Word(ParamKind[i]);
     Stream.Write(w, 2);

     frWriteString(Stream, ParamText[i]);

   end; { with }

end; { WriteParams }

procedure TfrAsaStoredProc.BeforeOpenQuery(DataSet: TDataSet);
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
   while i < FAsaStoredProc.Params.Count do begin
     if (ParamKind[i] = pkValue) and (FAsaStoredProc.Params[i].ParamType in [nptInput,nptInputOutput]) then
       if DocMode = dmPrinting then
         FAsaStoredProc.Params[i].Text := frParser.Calc(ParamText[i]) else
         FAsaStoredProc.Params[i].Text := DefParamValue(FAsaStoredProc.Params[i]);
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

function TfrAsaStoredProc.GetOutParam(vPar: Variant): Variant;

  function GetParam(vPar: Variant): TNativeParam;
  begin

   Result := FAsaStoredProc.Params.FindParam(vPar);
   if not Assigned(Result) then
     Result := FAsaStoredProc.Params[vPar];

  end; { GetParam }

begin
 Result := GetParam(vPar).Value;
 if VarIsNull(Result) then Result := '';
end; { GetOutParam }

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_ASASTOREDPROCCONTROL');
  frRegisterControl(TfrAsaStoredProc, Bmp, 'Insert component AsaStoredProc');

finalization
  frUnRegisterObject(TfrAsaStoredProc);
  Bmp.Free;

end.

