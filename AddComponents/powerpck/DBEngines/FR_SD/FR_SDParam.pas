{*********************************************}
{                                             }
{ FastReport v2.4 - SQLDirect components      }
{           Query params editor               }
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 1997-2001 by Yuri Sheino.     }
{ Copyright (c) 2001 by Stalker SoftWare      }
{                                             }  
{*********************************************}

unit FR_SDParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, DB, FR_SDQuery, SDEngine;

type
  TfrSDParamsForm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ParamsLB: TListBox;
    ValueRB: TRadioButton;
    AssignRB: TRadioButton;
    Label1: TLabel;
    ValueE: TfrComboEdit;
    Button1: TButton;
    Button2: TButton;
    ParamTypeLabel: TLabel;
    ParamTypeCB: TComboBox;
    DataTypeCB: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ParamsLBClick(Sender: TObject);
    procedure ValueEExit(Sender: TObject);
    procedure DataTypeCBChange(Sender: TObject);
    procedure ValueRBClick(Sender: TObject);
    procedure AssignRBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VarSBClick(Sender: TObject);
    procedure ParamTypeCBChange(Sender: TObject);
  private
    { Private declarations }
    FBusy: Boolean;
    function CurParam: Integer;
    procedure Localize;
  public
    { Public declarations }
    Query: TSDDataSet;
    QueryComp: TfrSDQuery;
  end;


const
  SDDataTypes: Array[0..10] of TFieldType =
    (ftBCD, ftBoolean, ftCurrency, ftDate, ftDateTime, ftInteger,
     ftFloat, ftSmallint, ftString, ftTime, ftWord);

  SDParamTypes: Array[0..4] of TParamType =
     (ptUnknown, ptInput, ptInputOutput, ptOutput, ptResult);

implementation

uses
  FR_Const, FR_Class, FR_DBUtils, FR_Utils;

{$R *.DFM}


function TfrSDParamsForm.CurParam: Integer;
var
  i: Integer;
  s: String;

begin

 Result := 0;
 s := ParamsLB.Items[ParamsLB.ItemIndex];
 for i := 0 to TSDQuery(Query).Params.Count - 1 do
   if TSDQuery(Query).Params[i].Name = s then begin
     Result := i;
     Break;
   end; { if }

end; { CurParam }

procedure TfrSDParamsForm.FormShow(Sender: TObject);
var
  i: Integer;

begin

 with TSDQuery(Query).Params do
   for i := 0 to Count - 1 do
     if ParamsLB.Items.IndexOf(Items[i].Name) = -1 then
       ParamsLB.Items.Add(Items[i].Name);

 for i := 0 to 10 do
   DataTypeCB.Items.Add(frLoadStr(SParamType1 + i));

 ParamsLB.ItemIndex := 0;
 ParamsLBClick(nil);

end; { FormShow }

procedure TfrSDParamsForm.FormHide(Sender: TObject);
begin
 if ValueE.Enabled then ValueEExit(nil);
end; { FormHide }

procedure TfrSDParamsForm.ParamsLBClick(Sender: TObject);
var
  i: Integer;

begin

 DataTypeCB.ItemIndex := -1;
 for i := 0 to 10 do
   if TSDQuery(Query).Params[CurParam].DataType = SDDataTypes[i] then begin
     DataTypeCB.ItemIndex := i;
     break;
   end; { if }

 ParamTypeCB.ItemIndex := -1;
 for i := 0 to 4 do
   if TSDQuery(Query).Params[CurParam].ParamType = SDParamTypes[i] then begin
     ParamTypeCB.ItemIndex := i;
     break;
   end; { if }

 FBusy := True;
 ValueE.Text := '';
 ValueE.Enabled := False;

 if QueryComp.ParamKind[CurParam] = pkValue then begin
   ValueE.Text := QueryComp.ParamText[CurParam];
   ValueE.Enabled := True;
   ValueRB.Checked := True;
 end else
   AssignRB.Checked := True;

 FBusy := False;

end; { ParamsLBClick }

procedure TfrSDParamsForm.ValueEExit(Sender: TObject);
begin
 QueryComp.ParamText[CurParam] := ValueE.Text;
end; { ValueEExit }

procedure TfrSDParamsForm.DataTypeCBChange(Sender: TObject);
begin
 TSDQuery(Query).Params[CurParam].DataType := SDDataTypes[DataTypeCB.ItemIndex];
 if ValueE.Enabled then ValueEExit(nil);
end; { DataTypeCBChange }

procedure TfrSDParamsForm.ParamTypeCBChange(Sender: TObject);
begin
 TSDQuery(Query).Params[CurParam].ParamType := SDParamTypes[ParamTypeCB.ItemIndex];
 if ValueE.Enabled then ValueEExit(nil);
end; { ParamTypeCBChange }

procedure TfrSDParamsForm.ValueRBClick(Sender: TObject);
begin
 if FBusy then Exit;
 ValueE.Enabled := True;
 QueryComp.ParamKind[CurParam] := pkValue;
end; { ValueRBClick }

procedure TfrSDParamsForm.AssignRBClick(Sender: TObject);
begin
 if FBusy then Exit;
 ValueE.Text := '';
 ValueE.Enabled := False;
 QueryComp.ParamKind[CurParam] := pkAssignFromMaster;
end; { AssignRBClick }

procedure TfrSDParamsForm.Localize;
begin
 GroupBox1.Caption := frLoadStr(frRes + 3110);
 Label2.Caption := frLoadStr(frRes + 3111);
 Label1.Caption := frLoadStr(frRes + 3112);
 ValueRB.Caption := frLoadStr(frRes + 3113);
 AssignRB.Caption := frLoadStr(frRes + 3115);
 ValueE.ButtonHint := frLoadStr(frRes + 575);
 Button1.Caption := frLoadStr(SOk);
 Button2.Caption := frLoadStr(SCancel);
end;

procedure TfrSDParamsForm.FormCreate(Sender: TObject);
begin
 Localize;
end; { FormCreate }

procedure TfrSDParamsForm.VarSBClick(Sender: TObject);
begin
 ValueE.Text := frDesigner.InsertExpression;
end; { VarSBClick }

end.

