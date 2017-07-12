{*********************************************************}
{                                                         }
{       Delphi Visual Component Library                   }
{ QBuilder is  Copyright (c) 1996-99 Sergey Orlik         }
{       www.geocities.com/SiliconValley/Way/9006/         }
{                                                         }
{---------------------------------------------------------}
{ Interface with QBuilder and FastReport 2.4              }
{ Idea : Use QB for define the SQL property               }
{ Olivier GUILBAUD                                        }
{ 18/11/1999 : Create                                     }
{*********************************************************}

(*  Adapted by A-D-E.net for use with ADONIS ado components.

    tested with ADONIS 4.1 and ADO 2.6

    date : 6 feb. 2001


*)

{$I ADN.inc}




unit FR_ADNQB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, ADODS,adoxcs, ADO, ADOX, QBuilder
  {$IFDEF STATEINFORMATION}
  ,oqbestate
  {$ENDIF}
  ;


type
  {$IFDEF STATEINFORMATION}
  TfrQBADNEngine = class(TOQBStateEngine)
  {$ELSE}
  TfrQBADNEngine = class(TOQBEngine)
  {$ENDIF}
  private
    FResultQuery: TADOQuery;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadTableList; override;
    procedure ReadFieldList(ATableName: string); override;
    procedure ClearQuerySQL; override;
    procedure SetQuerySQL(Value: string); override;
    function ResultQuery: TDataSet; override;
    procedure OpenResultQuery; override;
    procedure CloseResultQuery; override;
    procedure SaveResultQueryData; override;
    function SelectDatabase: Boolean; override;
    procedure UpdateTableList;
  published
    property Query: TADOQuery read FResultQuery write FResultQuery;
  end;


implementation

uses FR_Utils, FR_Class;


{ TfrQBADOEngine }

constructor TfrQBADNEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FResultQuery := nil;
end;

destructor TfrQBADNEngine.Destroy;
begin
  CloseResultQuery;
  inherited Destroy;
end;

procedure TfrQBADNEngine.UpdateTableList;
begin
  ReadTableList;
end;

function TfrQBADNEngine.SelectDatabase: Boolean;
begin
  Result := False;
end;

procedure TfrQBADNEngine.ReadTableList;
var
  fDb: TADODatabase;

  procedure  GetTableNames(db: TADODatabase; List: TStrings; SystemTables: Boolean = False);
  var
    i : integer;
    b : boolean;
    x : TADOXCatalog;
  begin
    x := nil;
    try
      x := TADOXCatalog.Create( nil );
      x.OpenExisting( db.handle );
      with x.ADOXTables do begin
        for i := 0 to Count - 1 do begin
          if not SystemTables then
            b := ( Item[i].Type_ = 'TABLE' ) or ( Item[i].Type_ = 'VIEW' )
          else
            b := true;
          if b then
            List.Add( x.ADOXTables.Item[i].Name );
        end;
      end;
    finally
      x.Free;
    end;
  end;

begin
  TableList.Clear;
  fDb := TADODatabase(frFindComponent(frDialogForm, DatabaseName));
  if fDB <> nil then
    GetTableNames( fDB, TableList);

  {$IFDEF STATEINFORMATION}
  RestoreFromState;
  {$ENDIF}
end;

procedure TfrQBADNEngine.ReadFieldList(ATableName: String);
var
  i: Integer;
  Temp: TADOTable;
begin
  Temp := nil;
  try
    Temp := TADOTable.Create(frDialogForm);
    Temp.DataBase := FResultQuery.Database;
    Temp.TableName := aTableName;

    FieldList.Clear;
    FieldList.Add('*');
    Temp.FieldDefs.Update;
    for i := 0 to Temp.FieldDefs.Count - 1 do
      FieldList.Add(Temp.FieldDefs.Items[i].Name);
  finally
    Temp.Close;
    Temp.Free;
  end;
end;

procedure TfrQBADNEngine.ClearQuerySQL;
begin
  FResultQuery.SQL.Clear;
end;

procedure TfrQBADNEngine.SetQuerySQL(Value: String);
begin
  FResultQuery.SQL.Text := Value;
end;

function TfrQBADNEngine.ResultQuery: TDataSet;
begin
  Result := FResultQuery;
end;

procedure TfrQBADNEngine.OpenResultQuery;
begin
  FResultQuery.Prepare;
  FResultQuery.Active := True;
end;

procedure TfrQBADNEngine.CloseResultQuery;
begin
  FResultQuery.Active := False;
end;

procedure TfrQBADNEngine.SaveResultQueryData;
begin
  ShowMessage('Operation not supported.');
end;


end.

