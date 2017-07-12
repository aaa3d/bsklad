
{******************************************}
{                                          }
{    FastReport v2.4 - FIB components      }
{           Database component             }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{   Copyright (c) 2001 by Witaly Barmin    }
{                                          }
{******************************************}

unit FR_FIBDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, pFIBDatabase
  {$IFDEF VER140},Variants{$ENDIF};

type
  TfrFIBComponents = class(TComponent) // fake component
  end;

  TfrFIBDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TpFIBDatabase;
    FTransaction: TpFIBTransaction;
    procedure LinesEditor(Sender: TObject);
    procedure DBNameEditor(Sender: TObject);
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
    procedure ShowEditor; override;
  end;


implementation

uses
  FR_Utils, FR_DBUtils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_FIBQuery;

{$R FR_FIB.RES}


{ TfrIBXDatabase }

constructor TfrFIBDatabase.Create;
begin
  inherited Create;
  FDatabase := TpFIBDataBase.Create(frDialogForm);
  FTransaction := TpFIBTransaction.Create(frDialogForm);
  FDatabase.DefaultTransaction := FTransaction;
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_FIBDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrFIBDatabase.Destroy;
begin
  FTransaction.Free;
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrFIBDatabase.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('DatabaseName', [frdtString], DBNameEditor);
  AddProperty('LoginPrompt', [frdtBoolean], nil);
  AddProperty('Params', [frdtHasEditor, frdtOneObject], LinesEditor);
  AddProperty('Params.Count', [], nil);
  AddProperty('SQLDialect', [frdtInteger], nil);
end;

procedure TfrFIBDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FDatabase.DBName := Value
  else if Index = 'LOGINPROMPT' then
    FDatabase.UseLoginPrompt := Value
  else if Index = 'CONNECTED' then begin
    FDatabase.Connected := Value;
    if Assigned(FDataBase.DefaultTransaction) then
      FDataBase.DefaultTransaction.Active := Value;
  end
  else if Index = 'PARAMS' then
    FDataBase.DBParams.Text := Value
  else if Index = 'SQLDIALECT' then
    FDataBase.SQLDialect := Value
end;

function TfrFIBDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDataBase.DBName
  else if Index = 'LOGINPROMPT' then
    Result := FDataBase.UseLoginPrompt
  else if Index = 'CONNECTED' then
    Result := FDataBase.Connected
  else if Index = 'PARAMS.COUNT' then
    Result := FDatabase.DBParams.Count
  else if Index = 'PARAMS' then
    Result := FDataBase.DBParams.Text
  else if Index = 'SQLDIALECT' then
    Result := FDataBase.SQLDialect
end;

function TfrFIBDataBase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FDataBase.DBParams, MethodName, 'PARAMS', Par1, Par2, Par3);
end;

procedure TfrFIBDatabase.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FDatabase.DBName := frReadString(Stream);
  FDatabase.UseLoginPrompt := frReadBoolean(Stream);
  if HVersion * 10 + LVersion > 20 then
    FDataBase.SQLDialect := frReadInteger(Stream);
  frReadMemo(Stream, FDatabase.DBParams);
  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrFIBDatabase.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.DBName);
  frWriteBoolean(Stream, FDatabase.UseLoginPrompt);
  frWriteInteger(Stream, FDataBase.SQLDialect);
  frWriteMemo(Stream, FDatabase.DBParams);
  frWriteBoolean(Stream, FDatabase.Connected);
end;

procedure TfrFIBDatabase.LinesEditor(Sender: TObject);
var
  sl: TStringList;
  SaveConnected: Boolean;
begin
  sl := TStringList.Create;
  with TfrLinesEditorForm.Create(nil) do
  begin
    if FDatabase.DBParams.Text = '' then
      M1.Text := sl.Text else
      M1.Text := FDatabase.DBParams.Text;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FDatabase.Connected;
      if FDatabase.Connected then
        FDatabase.Connected := False;
      FDatabase.DBParams.Text := M1.Text;
      if SaveConnected then
        FDatabase.Connected := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
  sl.Free;
end;

procedure TfrFIBDatabase.ShowEditor;
begin
  DBNameEditor(nil);
end;

procedure TfrFIBDatabase.DBNameEditor(Sender: TObject);
var
  SaveConnected: Bool;
begin
  SaveConnected := FDatabase.Connected;
  FDatabase.Connected := False;
  with TOpenDialog.Create(nil) do
  begin
    InitialDir := GetCurrentDir();
    Filter := {LoadStr(SIBXDataBases); //}'Databases (*.gdb)|*.gdb|All files (*.*)|*.*';
    if Execute then
      FDatabase.DBName := FileName;
    Free;
  end;
  FDatabase.Connected := SaveConnected;
  frDesigner.Modified := True;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_FIBDBCONTROL');
  frRegisterControl(TfrFIBDatabase, Bmp, LoadStr(SInsertDB));

finalization
  frUnregisterObject(TfrFIBDatabase);
  Bmp.Free;

end.

