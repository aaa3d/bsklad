
{******************************************}
{                                          }
{     FastReport v2.4 - DBI components     }
{            Database component            }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DBIDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, DBISAMtb, dbisamut;

type
  TfrDBIComponents = class(TComponent) // fake component
  end;

  TfrDBIDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TDBISAMDatabase;
    FDirector: String;
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
    procedure ShowEditor; override;
    property Database: TDBISAMDatabase read FDatabase;
  end;


implementation

uses
{$IFDEF Delphi6}
  Variants,
{$ENDIF}
  FR_Utils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_DBITable, FR_DBIQuery;

{$R FR_DBI.RES}


{ TfrDBIDatabase }

constructor TfrDBIDatabase.Create;
begin
  inherited Create;
  FDatabase := TDBISAMDatabase.Create(frDialogForm);
  FDirector := '';
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_DBIDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrDBIDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrDBIDatabase.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('DatabaseName', [frdtString], nil);
  AddProperty('Directory', [frdtString], DBNameEditor);
end;

procedure TfrDBIDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FDatabase.DatabaseName := Value
  else if Index = 'DIRECTORY' then
    FDatabase.Directory := Value
  else if Index = 'CONNECTED' then
    FDatabase.Connected := Value
end;

function TfrDBIDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDatabase.DatabaseName
  else if Index = 'DIRECTORY' then
    Result := FDatabase.Directory
  else if Index = 'CONNECTED' then
    Result := FDatabase.Connected
end;

procedure TfrDBIDatabase.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FDatabase.DatabaseName := frReadString(Stream);
  FDatabase.Directory := frReadString(Stream);
  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrDBIDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.DatabaseName);
  frWriteString(Stream, FDatabase.Directory);
  frWriteBoolean(Stream, FDatabase.Connected);
end;

procedure TfrDBIDatabase.ShowEditor;
begin
  DBNameEditor(nil);
end;

procedure TfrDBIDatabase.DBNameEditor(Sender: TObject);
var
  SaveConnected, dSel: Bool;
begin
  SaveConnected := FDatabase.Connected;
  FDatabase.Connected := False;
  dSel := GetDirectory(FDirector);
  if dSel then
   begin
      if AnsiLastChar(FDirector)^ <> '\' then FDirector := FDirector + '\';
      if FDatabase.DatabaseName = '' then FDatabase.DatabaseName := 'frDatabase';
      FDatabase.Directory := FDirector;
   end;
  FDatabase.Connected := SaveConnected;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DBIDBCONTROL');
  frRegisterControl(TfrDBIDatabase, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrDBIDatabase);
  Bmp.Free;

end.

