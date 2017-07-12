{*********************************************}
{                                             }
{ FastReport v2.4 - SQLDirect components      }
{            Database component               }    
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 2001 by Stalker SoftWare      }
{                                             }  
{*********************************************}

unit FR_SDDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, SDEngine;

type
  TfrSDComponents = class(TComponent) // fake component
  end;

  TfrSDDatabase = class(TfrNonVisualControl)
  private
    FSDDatabase: TSDDatabase;
    procedure ParamsEditor(Sender: TObject);
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
    property SDDatabase :TSDDatabase read FSDDatabase;
  end;

implementation

uses
  FR_Utils, FR_Const, FR_LEdit, FR_SDCommon, FR_SDQuery, FR_SD_SP
{$IFDEF Delphi6}
, Variants
{$ENDIF};

{$R FR_SD.RES}


{ TfrSDDatabase }

constructor TfrSDDatabase.Create;
begin

 inherited Create;

 FSDDatabase := TSDDatabase.Create(frDialogForm);
 Component := FSDDatabase;
 BaseName := 'SDDatabase';
 Bmp.LoadFromResourceName(hInstance, 'FR_SDDB');
 Flags := Flags or flDontUndo;

 frConsts['stDB2'] := stDB2;
 frConsts['stInformix'] := stInformix;
 frConsts['stInterbase'] := stInterbase;
 frConsts['stMySQL'] := stMySQL;
 frConsts['stODBC'] := stODBC;
 frConsts['stOracle'] := stOracle;
 frConsts['stSQLBase'] := stSQLBase;
 frConsts['stSQLServer'] := stSQLServer;
 frConsts['stSybase'] := stSybase;

 frConsts['tiDirtyRead'] := tiDirtyRead;
 frConsts['tiReadCommitted'] := tiReadCommitted;
 frConsts['tiRepeatableRead'] := tiRepeatableRead;

end; { Create }

destructor TfrSDDatabase.Destroy;
begin
 FSDDatabase.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrSDDatabase.DefineProperties;

  function GetSessionsNames: String;
  var
    i: Integer;
    sl: TStringList;

  begin

   Result := '';
   sl := TStringList.Create;
   try
     Sessions.GetSessionNames(sl);
     sl.Sort;
     for i := 0 to sl.Count - 1 do
       Result := Result + sl[i] + ';';
   finally
     sl.Free;
   end; { try }

  end; { GetSessionsNames }

begin

 inherited DefineProperties;

 AddProperty('Connected', [frdtBoolean], nil);
 AddProperty('DatabaseName', [frdtString], nil);
 AddProperty('KeepConnection', [frdtBoolean], nil);
 AddProperty('LoginPrompt', [frdtBoolean], nil);
 AddProperty('Params', [frdtHasEditor, frdtOneObject], ParamsEditor);
 AddProperty('RemoteDatabase', [frdtString], nil);
 AddEnumProperty('ServerType','stDB2;stInformix;stInterbase;stMySQL;stODBC;stOracle;stSQLBase;stSQLServer;stSybase',
                 [stDB2,stInformix,stInterbase,stMySQL,stODBC,stOracle,stSQLBase,stSQLServer,stSybase]);
 AddEnumProperty('SessionName', GetSessionsNames, [Null]);
 AddEnumProperty('TransIsolation','tiDirtyRead;tiReadCommitted;tiRepeatableRead',
                 [tiDirtyRead,tiReadCommitted,tiRepeatableRead]);

end; { DefineProperties }

procedure TfrSDDatabase.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'CONNECTED' then
   FSDDatabase.Connected := Value
 else
 if Index = 'DATABASENAME' then
   FSDDatabase.DatabaseName := Value
 else
 if Index = 'KEEPCONNECTION' then
   FSDDatabase.KeepConnection := Value
 else
 if Index = 'LOGINPROMPT' then
   FSDDatabase.LoginPrompt := Value
 else
 if Index = 'REMOTEDATABASE' then
   FSDDatabase.RemoteDatabase := Value
 else
 if Index = 'SERVERTYPE' then
   FSDDatabase.ServerType := Value
 else
 if Index = 'SESSIONNAME' then
   FSDDatabase.SessionName := Value
 else
 if Index = 'TRANSISOLATION' then
   FSDDatabase.TransIsolation := Value
 else
 if Index = 'PARAMS' then
   FSDDatabase.Params.Text := Value

end; { SetPropValue }

function TfrSDDatabase.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'CONNECTED' then
   Result := FSDDatabase.Connected
 else
 if Index = 'DATABASENAME' then
   Result := FSDDatabase.DatabaseName
 else
 if Index = 'KEEPCONNECTION' then
   Result := FSDDatabase.KeepConnection
 else
 if Index = 'LOGINPROMPT' then
   Result := FSDDatabase.LoginPrompt
 else
 if Index = 'REMOTEDATABASE' then
   Result := FSDDatabase.RemoteDatabase
 else
 if Index = 'SERVERTYPE' then
   Result := FSDDatabase.ServerType
 else
 if Index = 'SESSIONNAME' then
   Result := FSDDatabase.SessionName
 else
 if Index = 'TRANSISOLATION' then
   Result := FSDDatabase.TransIsolation
 else
 if Index = 'PARAMS' then
   Result := FSDDatabase.Params.Text

end; { GetPropValue }

function TfrSDDatabase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
end; { DoMethod }

procedure TfrSDDatabase.LoadFromStream(Stream: TStream);
var
  s: String;

begin

 inherited LoadFromStream(Stream);

 FSDDatabase.Connected := frReadBoolean(Stream);
 FSDDatabase.DatabaseName := frReadString(Stream);
 FSDDatabase.KeepConnection := frReadBoolean(Stream);
 FSDDatabase.LoginPrompt := frReadBoolean(Stream);
 frReadMemo(Stream, FSDDatabase.Params);
 FSDDatabase.RemoteDatabase := frReadString(Stream);
 FSDDatabase.ServerType := TSDServerType(frReadByte(Stream));
 s := frReadString(Stream);
 if s <> '' then
   FSDDatabase.SessionName := s;
 FSDDatabase.TransIsolation := TSDTransIsolation(frReadByte(Stream));

end; { LoadFromStream }

procedure TfrSDDatabase.SaveToStream(Stream: TStream);
begin

 LVersion := 1;

 inherited SaveToStream(Stream);

 frWriteBoolean(Stream,FSDDatabase.Connected);
 frWriteString(Stream,FSDDatabase.DatabaseName);
 frWriteBoolean(Stream,FSDDatabase.KeepConnection);
 frWriteBoolean(Stream,FSDDatabase.LoginPrompt);
 frWriteMemo(Stream, FSDDatabase.Params);
 frWriteString(Stream,FSDDatabase.RemoteDatabase);
 frWriteByte(Stream,Byte(FSDDatabase.ServerType));
 frWriteString(Stream,FSDDatabase.SessionName);
 frWriteByte(Stream,Byte(FSDDatabase.TransIsolation));

end; { SaveToStream }

procedure TfrSDDatabase.ParamsEditor(Sender: TObject);
var
  SaveConnected: Boolean;
begin

 with TfrLinesEditorForm.Create(nil) do begin
   M1.Text := FSDDatabase.Params.Text;
   if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
     M1.Modified then begin
     SaveConnected := FSDDatabase.Connected;
     FSDDatabase.Connected := False;
     FSDDatabase.Params.Text := M1.Text;
     FSDDatabase.Connected := SaveConnected;
     frDesigner.Modified := True;
   end; { if }
   Free;
 end; { if }

end; { ParamsEditor }

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_SDDBCONTROL');
  frRegisterControl(TfrSDDatabase, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrSDDatabase);
  Bmp.Free;

end.

