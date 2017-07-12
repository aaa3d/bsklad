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

unit FR_ASAQB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, QBuilder, NdbAsaDS;


type
  TfrQBASAEngine = class(TOQBEngine)
  private
    FResultQuery: TAsaDataSet;
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
    property Query: TAsaDataSet read FResultQuery write FResultQuery;
  end;


implementation

uses
  FR_Utils, FR_Class;


{ TfrQBASAEngine }

constructor TfrQBASAEngine.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 FResultQuery := nil;
end; { Create }

destructor TfrQBASAEngine.Destroy;
begin
 CloseResultQuery;
 inherited Destroy;
end; { Destroy }

procedure TfrQBASAEngine.UpdateTableList;
begin
 ReadTableList;
end; { UpdateTableList }

function TfrQBASAEngine.SelectDatabase: Boolean;
begin
 Result := False;
end; { SelectDatabase }

procedure TfrQBASAEngine.ReadTableList;
var
 oDataSet :TAsaDataSet;

begin

 TableList.Clear;

 oDataSet := TAsaDataSet.Create(frDialogForm);
 with oDataSet do begin
   try
     Session := FResultQuery.Session;
     SQL.Add('select creator, tname ' +
                       'from syscatalog ' +
                       'where creator not in' +
                       ' (''SYS'', ''dbo'', ''rs_systabgroup'')');
     Open;

     while not EOF do begin
       TableList.Add(Fields[0].AsString+'.'+Fields[1].AsString);
       Next;
     end; { while }

   finally
     Close;
     Free;
   end; { try }

 end; { with }

end; { ReadTableList }

procedure TfrQBASAEngine.ReadFieldList(ATableName: String);
var
  i: Integer;
  oDataSet: TAsaDataSet;

begin

 oDataSet := TAsaDataSet.Create(frDialogForm);
 try
   oDataSet.Session := FResultQuery.Session;
   oDataSet.SQL.Add('select * from '+aTableName+' where 1=2');
   oDataSet.Open;

   FieldList.Clear;
   FieldList.Add('*');
   oDataSet.FieldDefs.Update;
   for i := 0 to oDataSet.FieldDefs.Count - 1 do
     FieldList.Add(oDataSet.FieldDefs.Items[i].Name);
 finally
   oDataSet.Close;
   oDataSet.Free;
 end; { try }

end; { ReadFieldList }

procedure TfrQBASAEngine.ClearQuerySQL;
begin
 FResultQuery.SQL.Clear;
end; { ClearQuerySQL }

procedure TfrQBASAEngine.SetQuerySQL(Value: String);
begin
 FResultQuery.SQL.Text := Value;
end; { SetQuerySQL }

function TfrQBASAEngine.ResultQuery: TDataSet;
begin
 Result := FResultQuery;
end; { ResultQuery }

procedure TfrQBASAEngine.OpenResultQuery;
begin
 if not FResultQuery.Prepared then
   FResultQuery.Prepare;
 FResultQuery.Active := True;
end; { OpenResultQuery }

procedure TfrQBASAEngine.CloseResultQuery;
begin
 FResultQuery.Active := False;
end; { CloseResultQuery }

procedure TfrQBASAEngine.SaveResultQueryData;
begin
 ShowMessage('Operation non supported.');
end; { SaveResultQueryData }

end.

