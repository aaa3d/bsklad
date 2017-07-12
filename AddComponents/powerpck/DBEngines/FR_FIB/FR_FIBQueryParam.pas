
{******************************************}
{                                          }
{   FastReport v2.4 - FIBPlus components   }
{           Query params editor            }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{   Copyright (c) 2001 by Witaly Barmin    }
{                                          }
{******************************************}

unit FR_FIBQueryParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, pFIBDataSet, FR_FIBQuery;

type
  TfrFIBParamsForm = class(TForm)
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
    procedure ValueEButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Query: TpFIBDataset;
    QueryComp: TfrFIBQuery;
  end;

implementation

uses FR_Const, FR_Class, FR_DBUtils, FR_Utils;

{$R *.DFM}


procedure TfrFIBParamsForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with QueryComp do
  for i := 0 to pred(FParams.Count) do
    if ParamsLB.Items.IndexOf(FParams.Name[i]) = -1 then
      ParamsLB.Items.Add(FParams.Name[i]);
  ParamsLB.ItemIndex := 0;
  ParamsLBClick(nil);
end;

procedure TfrFIBParamsForm.FormHide(Sender: TObject);
begin
  ValueEExit(nil);
end;

procedure TfrFIBParamsForm.ParamsLBClick(Sender: TObject);
begin
  ValueE.Text := QueryComp.FParams[ParamsLB.Items[ParamsLB.ItemIndex]];
end;

procedure TfrFIBParamsForm.ValueEExit(Sender: TObject);
begin
  QueryComp.FParams[ParamsLB.Items[ParamsLB.ItemIndex]] := ValueE.Text;
end;

procedure TfrFIBParamsForm.FormCreate(Sender: TObject);
begin
  GroupBox1.Caption := LoadStr(frRes + 3110);
  Label1.Caption := LoadStr(frRes + 3112);
  Label2.Caption := LoadStr(frRes + 3113);
  ValueE.ButtonHint := LoadStr(frRes + 575);
  Button1.Caption := LoadStr(SOk);
  Button2.Caption := LoadStr(SCancel);
end;

procedure TfrFIBParamsForm.ValueEButtonClick(Sender: TObject);
begin
  ValueE.Text := frDesigner.InsertExpression;
end;

end.

