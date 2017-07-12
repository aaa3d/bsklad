{******************************************}
{                                          }
{ FastReport v2.4 - SQLDirect components   }
{        StoredProc component              }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{ Copyright (c) 1997-2001 by Yuri Sheino.  }
{ Copyright (c) 2001 by Stalker SoftWare   }
{                                          }
{******************************************}

unit FR_SD_SP;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms,
  Menus, Dialogs, FR_Class, FR_Pars, DB, FR_SDCommon, FR_DBUtils, SDEngine;


type
  TfrSDStoredProc = class(TfrSDDataSet)
  private
    FSDStoredProc: TSDStoredProc;
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
    property Query: TSDStoredProc read FSDStoredProc;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_DBSQLEdit, FR_SDQuery, FR_SDParam
{$IFDEF Delphi6}
, Variants
{$ENDIF};


{ TfrSDStoredProc }

constructor TfrSDStoredProc.Create;
begin

 inherited Create;

 FSDStoredProc := TSDStoredProc.Create(frDialogForm);
 FSDStoredProc.BeforeOpen := BeforeOpenQuery;
 FDataSet := FSDStoredProc;
 FDataSource.DataSet := FDataSet;

 FParams := TfrVariables.Create;

 Component := FSDStoredProc;
 BaseName := 'SDStoredProc';
 Bmp.LoadFromResourceName(hInstance, 'FR_SDSTOREDPROC');

end; { Create }

destructor TfrSDStoredProc.Destroy;
begin
 FParams.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrSDStoredProc.DefineProperties;
begin

 inherited DefineProperties;

 AddProperty('Overload', [frdtInteger], nil);
 AddProperty('Params', [frdtHasEditor], ParamsEditor);
 AddProperty('StoredProcName', [frdtString], nil);
 AddProperty('GetOutParam',[],nil);

end; { DefineProperties }

procedure TfrSDStoredProc.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'OVERLOAD' then
   FSDStoredProc.Overload := Value
 else
 if Index = 'AUTOCALCFIELD' then
   FSDStoredProc.AutoCalcFields := Value
 else
 if Index = 'STOREDPROCNAME' then begin
   FSDStoredProc.StoredProcName := UpperCase(Value);
   if Value <> '' then
     FSDStoredProc.Prepare;
 end;

end; { SetPropValue }

function TfrSDStoredProc.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'OVERLOAD' then
   Result := FSDStoredProc.Overload
 else
 if Index = 'AUTOCALCFIELD' then
   Result := FSDStoredProc.AutoCalcFields
 else
 if Index = 'STOREDPROCNAME' then
   Result := FSDStoredProc.StoredProcName

end; { GetPropValue }

function TfrSDStoredProc.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin

 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);

 if MethodName = 'EXECPROC' then begin
   BeforeOpenQuery(FSDStoredProc);
   FSDStoredProc.ExecProc;
 end
 else
 if MethodName = 'GETOUTPARAM' then
   Result := GetOutParam(frParser.Calc(Par1));

end; { DoMethod }

procedure TfrSDStoredProc.LoadFromStream(Stream: TStream);
begin

 FFixupList.Clear;
 inherited LoadFromStream(Stream);

 FSDStoredProc.DatabaseName := frReadString(Stream);
 FSDStoredProc.SessionName := frReadString(Stream);
 FSDStoredProc.AutoCalcFields := frReadBoolean(Stream);
 FSDStoredProc.DetachOnFetchAll := frReadBoolean(Stream);
 FSDStoredProc.Overload := frReadInteger(Stream);
 FSDStoredProc.Preservation := frReadBoolean(Stream);
 FSDStoredProc.StoredProcName := frReadString(Stream);

 FFixupList['Active'] := frReadBoolean(Stream);
 ReadFields(Stream);
 ReadParams(Stream);
 try
   FSDStoredProc.Active := FFixupList['Active'];
 except;
 end; { try }

end; { LoadFromStream }

procedure TfrSDStoredProc.SaveToStream(Stream: TStream);
begin

 LVersion := 1;
 inherited SaveToStream(Stream);

 frWriteString(Stream, FSDStoredProc.DatabaseName);
 frWriteString(Stream, FSDStoredProc.SessionName);
 frWriteBoolean(Stream,FSDStoredProc.AutoCalcFields);
 frWriteBoolean(Stream,FSDStoredProc.DetachOnFetchAll);
 frWriteInteger(Stream,FSDStoredProc.Overload);
 frWriteBoolean(Stream,FSDStoredProc.Preservation);
 frWriteString(Stream, FSDStoredProc.StoredProcName);
 frWriteBoolean(Stream, FSDStoredProc.Active);
 WriteFields(Stream);
 WriteParams(Stream);

end; { SaveToStream }

procedure TfrSDStoredProc.Loaded;
begin
 inherited Loaded;
end; { Loaded }

procedure TfrSDStoredProc.ParamsEditor(Sender: TObject);
var
 Params: TParams;
 ParamValues: TfrVariables;

begin

 if FSDStoredProc.Params.Count > 0 then begin
   Params := TParams.Create(nil);
   Params.Assign(FSDStoredProc.Params);
   ParamValues := TfrVariables.Create;
   ParamValues.Assign(FParams);
   with TfrSDParamsForm.Create(nil) do begin
     QueryComp := TfrSDQuery(Self);
     Query := FSDStoredProc;
     Caption := Self.Name + ' ' + LoadStr(SParams);
     if ShowModal = mrOk then
       frDesigner.Modified := True
     else begin
       FSDStoredProc.Params.Assign(Params);
       FParams.Assign(ParamValues);
     end; { if }
     Free;
   end; { with }
   Params.Free;
   ParamValues.Free;
 end; { if }

end; { ParamsEditor }

function TfrSDStoredProc.GetParamKind(Index: Integer): TfrParamKind;
begin

 Result := pkValue;
 if not FSDStoredProc.Params[Index].Bound then
   Result := pkAssignFromMaster;

end; { GetParamKind }

procedure TfrSDStoredProc.SetParamKind(Index: Integer; Value: TfrParamKind);
begin

 if Value = pkAssignFromMaster then begin
   FSDStoredProc.Params[Index].Bound := False;
   FParams.Delete(FParams.IndexOf(FSDStoredProc.Params[Index].Name));
 end else begin
   FSDStoredProc.Params[Index].Clear;
   FSDStoredProc.Params[Index].Bound := True;
   FParams[FSDStoredProc.Params[Index].Name] := '';
 end; { if }

end; { SetParamKind }

function TfrSDStoredProc.GetParamText(Index: Integer): String;
begin

 Result := '';
 if ParamKind[Index] = pkValue then
   Result := FParams[FSDStoredProc.Params[Index].Name];

end; { GetParamText }

procedure TfrSDStoredProc.SetParamText(Index: Integer; Value: String);
begin
 if ParamKind[Index] = pkValue then
   FParams[FSDStoredProc.Params[Index].Name] := Value;
end; { SetParamText }

procedure TfrSDStoredProc.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;

begin

 Stream.Read(n, 2);

 if (n > 0) and (FSDStoredProc.StoredProcName <> '') then
   FSDStoredProc.Prepare;

 for i := 0 to n - 1 do
   with FSDStoredProc.Params[i] do begin

     // Читаем тип данных параметра
     Stream.Read(w, 2);
     DataType := SDDataTypes[w];

     // Читаем вид параметра
     Stream.Read(w, 2);
     ParamType := SDParamTypes[w];

     Stream.Read(w, 2);
     ParamKind[i] := TfrParamKind(w);

     ParamText[i] := frReadString(Stream);

   end; { with }

end; { ReadParams }

procedure TfrSDStoredProc.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;

begin

 w := FSDStoredProc.Params.Count;
 Stream.Write(w, 2);

 for i := 0 to FSDStoredProc.Params.Count - 1 do
   with FSDStoredProc.Params[i] do begin

     // Сохраняем тип данных параметра
     for w := 0 to 10 do
       if DataType = SDDataTypes[w] then break;
     Stream.Write(w, 2);

     // Сохряняем вид параметра
     for w := 0 to 4 do
       if ParamType = SDParamTypes[w] then break;
     Stream.Write(w, 2);

     w := Word(ParamKind[i]);
     Stream.Write(w, 2);

     frWriteString(Stream, ParamText[i]);

   end; { with }

end; { WriteParams }

procedure TfrSDStoredProc.BeforeOpenQuery(DataSet: TDataSet);
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
   while i < FSDStoredProc.Params.Count do begin
     if (ParamKind[i] = pkValue) and (FSDStoredProc.Params[i].ParamType in [ptInput,ptInputOutput]) then
       if DocMode = dmPrinting then
         FSDStoredProc.Params[i].Text := frParser.Calc(ParamText[i]) else
         FSDStoredProc.Params[i].Text := DefParamValue(FSDStoredProc.Params[i]);
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

function TfrSDStoredProc.GetOutParam(vPar: Variant): Variant;

  function GetParam(vPar: Variant): TParam;
  begin

   Result := FSDStoredProc.Params.FindParam(vPar);
   if not Assigned(Result) then
     Result := FSDStoredProc.Params[vPar];

  end; { GetParam }

begin
 Result := GetParam(vPar).Value;
 if VarIsNull(Result) then Result := '';
end; { GetOutParam }

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_SDSTOREDPROCCONTROL');
  frRegisterControl(TfrSDStoredProc, Bmp, 'Insert component SDStoredProc');

finalization
  frUnRegisterObject(TfrSDStoredProc);
  Bmp.Free;

end.

