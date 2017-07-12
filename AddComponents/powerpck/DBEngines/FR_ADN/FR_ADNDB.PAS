
{******************************************}
{                                          }
{     FastReport v2.4 - ADO components     }
{            Database component            }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

(*  Adapted by A-D-E.net for use with ADONIS ado components.

    tested with ADONIS 4.1 and ADO 2.6

    date : 6 feb. 2001

*)



unit FR_ADNDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, ADODS;

type
  TfrADNComponents = class(TComponent) // fake component
  end;

  TfrADNDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TADODatabase;
    procedure DBNameEditor(Sender: TObject);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
  end;


implementation

uses FR_Utils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_ADNTable, FR_ADNQuery;

{$R FR_ADN.RES}


{ TfrADNDatabase }

constructor TfrADNDatabase.Create;
begin
  inherited Create;
  FDatabase := TADODatabase.Create(frDialogForm);
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_ADODB');
  Flags := Flags or flDontUndo;
end;

destructor TfrADNDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrADNDatabase.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('DatabaseName', [frdtString, frdtHasEditor], DBNameEditor);
//  AddProperty('LoginPrompt', [frdtBoolean], nil);
end;

procedure TfrADNDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FDatabase.DatabaseConnect := Value
//  else if Index = 'LOGINPROMPT' then
//    FDatabase.LoginPrompt := Value
  else if Index = 'CONNECTED' then
    try
      FDatabase.Connected := Value;
    except
    end;
end;

function TfrADNDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDatabase.DatabaseConnect
//  else if Index = 'LOGINPROMPT' then
//    Result := FDatabase.LoginPrompt
  else if Index = 'CONNECTED' then
    Result := FDatabase.Connected
end;

procedure TfrADNDatabase.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FDatabase.DatabaseConnect := frReadString(Stream);
//  FDatabase.LoginPrompt := frReadBoolean(Stream);
  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrADNDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.DatabaseConnect);
//  frWriteBoolean(Stream, FDatabase.LoginPrompt);
  frWriteBoolean(Stream, FDatabase.Connected);
end;

procedure TfrADNDatabase.DBNameEditor(Sender: TObject);
var
  SaveConnected: Bool;
begin
  SaveConnected := FDatabase.Connected;
  FDatabase.Connected := False;
  FDatabase.SelectConnection;
  FDatabase.Connected := SaveConnected;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_ADODBCONTROL');
  frRegisterControl(TfrADNDatabase, Bmp, LoadStr(SInsertDB));

finalization
  frUnRegisterObject(TfrADNDatabase);
  Bmp.Free;

end.

