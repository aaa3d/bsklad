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
{ Interface unit for FR, FF and QBuilder                  }
{ All FlashFiler related changes are                      }
{ Copyright (c) Eivind Bakkestuen.                        }

unit FR_FFQB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, FFQuery, QBuilder;


type
  TfrQBFFEngine = class(TOQBEngine)
  private
    FResultQuery: TFFQuery;
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
    property Query: TFFQuery read FResultQuery write FResultQuery;
  end;


implementation

uses FR_Utils, FR_Class;


{ TfrQBFFEngine }

constructor TfrQBFFEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FResultQuery := nil;
end;

destructor TfrQBFFEngine.Destroy;
begin
  CloseResultQuery;
  inherited Destroy;
end;

procedure TfrQBFFEngine.UpdateTableList;
begin
  ReadTableList;
end;

function TfrQBFFEngine.SelectDatabase: Boolean;
begin
  Result := False;
end;

procedure TfrQBFFEngine.ReadTableList;
begin
  Session.GetTableNames(DatabaseName, '', True, ShowSystemTables, TableList);
end;

procedure TfrQBFFEngine.ReadFieldList(ATableName: String);
var
  i: Integer;
  Temp: TFFTable;
begin
  Temp := nil;
  try
    Temp := TFFTable.Create(frDialogForm);
    Temp.DataBaseName := FResultQuery.DatabaseName;
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

procedure TfrQBFFEngine.ClearQuerySQL;
begin
  FResultQuery.SQL.Clear;
end;

procedure TfrQBFFEngine.SetQuerySQL(Value: String);
begin
  FResultQuery.SQL.Text := Value;
end;

function TfrQBFFEngine.ResultQuery: TDataSet;
begin
  Result := FResultQuery;
end;

procedure TfrQBFFEngine.OpenResultQuery;
begin
  if not FResultQuery.Prepared then
    FResultQuery.Prepare;
  FResultQuery.Active := True;
end;

procedure TfrQBFFEngine.CloseResultQuery;
begin
  FResultQuery.Active := False;
end;

procedure TfrQBFFEngine.SaveResultQueryData;
begin
  ShowMessage('Operation non supported.');
end;


end.

