{******************************************}
{                                          }
{     FastReport v2.4 - ADS components     }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

{ 
  Database component.
  
  Adapted by Dmitry Koudryavtsev
  http://juliasoft.chat.ru
  juliasoft@mail.ru

  for use with Advantage TDataSet descendant components
}

unit FR_ADSDB;

interface

{$I FR.inc}

uses
  SysUtils, Classes, FR_Class, StdCtrls, Controls,
{$IFNDEF DELPHI3}
  Types,
{$ENDIF}  
  adsfunc, adstable, adsset, adsdata, adscnnct, Graphics;

type
  TfrADSComponents = class(TComponent) // fake component
  end;

  TfrADSDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TAdsConnection;
//    procedure LinesEditor(Sender: TObject);
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
    property Database: TAdsConnection read FDatabase;
  end;


implementation

uses FR_Utils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_ADSTable, FR_ADSQuery
{$IFDEF Delphi6}
, Variants
{$ENDIF};

{$R FR_ADS.RES}

{ TfrADSDatabase }

constructor TfrADSDatabase.Create;
begin
  inherited Create;
  FDatabase := TADSConnection.Create(frDialogForm);
  FDatabase.AdsServerTypes := [stADS_LOCAL];
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_ADSDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrADSDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrADSDatabase.DefineProperties;
  {
  function GetAliasNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TAdsConnection, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetDriverNames: String;
  var
    i, j: Integer;
    sl: TStringList;
    s: String;
  begin
    Result := '';
    sl := TStringList.Create;
    Session.GetDriverNames(sl);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
    begin
      s := sl[i];
      for j := 1 to Length(s) do
        if s[j] = ';' then
          s[j] := ',';
      Result := Result + s + ';';
    end;
    sl.Free;
  end;
  }

begin
  inherited DefineProperties;
  AddProperty('IsConnected', [frdtBoolean], nil);
  AddProperty('MiddleTierConnection', [frdtBoolean], nil);
  AddProperty('ConnectPath', [frdtString], nil);
  AddProperty('LoginPrompt', [frdtBoolean], nil);
  AddProperty('ReadOnly', [frdtBoolean], nil);
end;

procedure TfrADSDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'CONNECTPATH' then
    FDatabase.ConnectPath := Value
  else if Index = 'LOGINPROMPT' then
    FDatabase.LoginPrompt := Value
  else if Index = 'ISCONNECTED' then
    FDatabase.IsConnected := Value
  else if Index = 'MIDDLETIERCONNECTION' then
    FDatabase.MiddleTierConnection := Value
  else if Index = 'READONLY' then
    FDatabase.ReadOnly := Value
end;

function TfrADSDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'CONNECTPATH' then
    Result := FDatabase.ConnectPath
  else if Index = 'LOGINPROMPT' then
    Result := FDatabase.LoginPrompt
  else if Index = 'ISCONNECTED' then
    Result := FDatabase.IsConnected
  else if Index = 'MIDDLETIERCONNECTION' then
    Result := FDatabase.MiddleTierConnection
  else if Index = 'READONLY' then
    Result := FDatabase.ReadOnly
end;

function TfrADSDataBase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  {
  if Result = Null then
    Result := LinesMethod(FDataBase.AdsServerType, MethodName, 'AdsServerType', Par1, Par2, Par3);
  }
end;

procedure TfrADSDatabase.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FDatabase.ConnectPath := frReadString(Stream);
  FDatabase.LoginPrompt := frReadBoolean(Stream);
  FDatabase.IsConnected := frReadBoolean(Stream);
  FDatabase.MiddleTierConnection := frReadBoolean(Stream);
  FDatabase.ReadOnly := frReadBoolean(Stream);
end;

procedure TfrADSDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.ConnectPath);
  frWriteBoolean(Stream, FDatabase.LoginPrompt);
  frWriteBoolean(Stream, FDatabase.IsConnected);
  frWriteBoolean(Stream, FDatabase.MiddleTierConnection);
  frWriteBoolean(Stream, FDatabase.ReadOnly);
end;
(*
procedure TfrADSDatabase.LinesEditor(Sender: TObject);
var
  sl: TStringList;
  SaveIsConnected: Boolean;
begin
  sl := TStringList.Create;
  try
    frGetComponents(frDialogForm, TAdsConnection, sl, nil);
  except;
  end;
  with TfrLinesEditorForm.Create(nil) do
  begin
    {
    if FDatabase.AdsServerType.Text = '' then
      M1.Text := sl.Text else
      M1.Text := FDatabase.AdsServerType.Text;
    }
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveIsConnected := FDatabase.IsConnected;
      FDatabase.IsConnected := False;
//      FDatabase.AdsServerType.Text := M1.Text;
      FDatabase.IsConnected := SaveIsConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
  sl.Free;
end;
*)

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_ADSDBCONTROL');
  frRegisterControl(TfrADSDatabase, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrADSDatabase);
  Bmp.Free;

end.

