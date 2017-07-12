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

unit FR_CTLQB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, CTQuery, CTTable, QBuilder, CTLibDatabase;


type
  TfrQBCTLEngine = class(TOQBEngine)
  private
    FResultQuery: TCTQuery;
    FDatabase  : TCTLibDatabase;
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
    property Query: TCTQuery read FResultQuery write FResultQuery;
  end;


implementation

uses FR_Utils, FR_Class;


{ TfrQBCTLEngine }

constructor TfrQBCTLEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FResultQuery := nil;
end;

destructor TfrQBCTLEngine.Destroy;
begin
  CloseResultQuery;
  inherited Destroy;
end;

procedure TfrQBCTLEngine.UpdateTableList;
begin
  ReadTableList;
end;

function TfrQBCTLEngine.SelectDatabase: Boolean;
begin
  Result := False;
end;

procedure TfrQBCTLEngine.ReadTableList;
var
  TempDataSet : TCTTable;
begin
  TableList.Clear;
  TempDataSet:=TCTTable.Create(Self);
  try
    if not FDatabase.Connected then
      FDatabase.Connected:=true;
    TempDataSet.Database:=FDatabase;
    TableList.AddStrings(TempDataSet.TableNames);
  finally
    TempDataSet.Close;
    TempDataSet.Free;
  end;
end;

procedure TfrQBCTLEngine.ReadFieldList(ATableName: String);
var
  TempDataSet : TCTQuery;
  TempTableName : string;
  TFL: TStrings;
  S:String;
begin
  FieldList.Clear;
  TFL:=TStringList.Create;
  TempTableName:=UpperCase(ATableName);
  TempDataSet:=TCTQuery.Create(Self);
  TempDataSet.SQL.Text:='SELECT * FROM '+TempTableName;
//  TempDataSet.SQLOptions:=[soUseTransaction,soUseTransactionOnCache];
  TempDataSet.FetchRows:=1;
  try
    if not FDatabase.Connected then
      FDatabase.Connected:=true;
    TempDataSet.Database:=FDatabase;
//    TempDataSet.TableName:=TempTableName;
    TempDataSet.Active:=True;
    TFL.Clear;
    TFL.AddStrings(TempDataSet.FieldList);
    FieldList.Add('*');
    TempDataSet.GetFieldNames(TFL);
    FieldList.AddStrings(TFL);
    S:=TFL.Text;
  finally
    TempDataSet.Active:=False;
    TempDataSet.Free;
    TFL.Free;
  end;
end;

procedure TfrQBCTLEngine.ClearQuerySQL;
begin
  FResultQuery.SQL.Clear;
end;

procedure TfrQBCTLEngine.SetQuerySQL(Value: String);
begin
  FResultQuery.SQL.Text := Value;
end;

function TfrQBCTLEngine.ResultQuery: TDataSet;
begin
  Result := FResultQuery;
end;

procedure TfrQBCTLEngine.OpenResultQuery;
begin
  if not FResultQuery.Prepared then
    FResultQuery.Prepare;
  FResultQuery.Active := True;
end;

procedure TfrQBCTLEngine.CloseResultQuery;
begin
  FResultQuery.Active := False;
end;

procedure TfrQBCTLEngine.SaveResultQueryData;
begin
  ShowMessage('Operation non supported.');
end;


end.

