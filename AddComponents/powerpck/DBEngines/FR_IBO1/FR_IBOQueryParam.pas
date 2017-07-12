{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{           Query params editor            }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{    Copyright (c) 2001 by Chugunov A.     }
{                                          }
{******************************************}

unit FR_IBOQueryParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, FR_IB_Query, IB_Components;

type
  TfrIBOParamsForm = class(TForm)
    GroupBox1: TGroupBox;
    ParamsLB: TListBox;
    Label1: TLabel;
    ValueE: TfrComboEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ParamsLBClick(Sender: TObject);
    procedure ValueEExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VarSBClick(Sender: TObject);
  private
    { Private declarations }
    FBusy: Boolean;
    function CurParam: Integer;
    procedure Localize;
  public
    { Public declarations }
    Query: TIB_Query;
    QueryComp: TfrIB_Query;
  end;

implementation

uses FR_Const, FR_Class, FR_DBUtils, FR_Utils;

{$R *.DFM}


function TfrIBOParamsForm.CurParam: Integer;
var
  i: Integer;
  s: String;
begin
  Result := 0;
  s := ParamsLB.Items[ParamsLB.ItemIndex];
  for i := 0 to Query.Params.ColumnCount - 1 do
    if Query.Params.Columns[i].BestFieldName = s then
    begin
      Result := i;
      break;
    end;
end;

procedure TfrIBOParamsForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with Query.Params do
  for i := 0 to ColumnCount - 1 do
    if (ParamsLB.Items.IndexOf(Columns[i].BestFieldName) = -1) and (Copy(Columns[i].BestFieldName, 1, 5) <> 'MLNK_') then
      ParamsLB.Items.Add(Columns[i].BestFieldName);
  ParamsLB.ItemIndex := 0;
  ParamsLBClick(nil);
end;

procedure TfrIBOParamsForm.FormHide(Sender: TObject);
begin
  if ValueE.Enabled then ValueEExit(nil);
end;

procedure TfrIBOParamsForm.ParamsLBClick(Sender: TObject);
begin
  FBusy := True;
  ValueE.Text := '';
  ValueE.Enabled := False;
  ValueE.Text := Query.ParamValueLinks.LinkValues[ParamsLB.Items.Strings[CurParam] + ' ::'];
  ValueE.Enabled := True;
  FBusy := False;
end;

procedure TfrIBOParamsForm.ValueEExit(Sender: TObject);
begin
  Query.ParamValueLinks.LinkValues[ParamsLB.Items.Strings[CurParam] + ' ::'] := ValueE.Text;
end;

procedure TfrIBOParamsForm.Localize;
begin
  GroupBox1.Caption := frLoadStr(frRes + 3110);
  Label1.Caption := frLoadStr(frRes + 3112);
  Label2.Caption := frLoadStr(frRes + 3113);
  ValueE.ButtonHint := frLoadStr(frRes + 575);
  Button1.Caption := frLoadStr(SOk);
  Button2.Caption := frLoadStr(SCancel);
end;

procedure TfrIBOParamsForm.FormCreate(Sender: TObject);
begin
  Localize;
end;

procedure TfrIBOParamsForm.VarSBClick(Sender: TObject);
begin
  ValueE.Text := frDesigner.InsertExpression;
end;

end.

