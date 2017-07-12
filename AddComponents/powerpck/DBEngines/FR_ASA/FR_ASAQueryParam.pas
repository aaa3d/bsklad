
{*********************************************}
{                                             }
{ FastReport v2.4 - NativeDB components       }
{           Query params editor               }
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 2000-2001 by Stalker SoftWare }
{                                             }  
{*********************************************}

unit FR_ASAQueryParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, DB, FR_ASAQuery, NdbAsaDS, NdbAsa, NdbBase,
  NdbBasDS;

type
  TfrASAParamsForm = class(TForm)
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
    Query: TNativeDataSet;
    QueryComp: TfrAsaDataSet;
  end;


const
  AsaDataTypes: Array[0..10] of TNativeFieldTypes =
    (ntFloat, ntBoolean, ntCurrency, ntDate, ntDateTime, ntInteger,
     ntFloat, ntInteger, ntString, ntTime, ntInteger);

 AsaParamTypes: Array[0..4] of TNativeParamType =
    (nptUnknown, nptInput, nptInputOutput, nptOutput, nptResult);

implementation

uses
  FR_Const, FR_Class, FR_DBUtils, FR_Utils;

{$R *.DFM}


function TfrASAParamsForm.CurParam: Integer;
var
  i: Integer;
  s: String;

begin

 Result := 0;
 s := ParamsLB.Items[ParamsLB.ItemIndex];
 for i := 0 to Query.Params.Count - 1 do
   if Query.Params[i].Name = s then begin
     Result := i;
     Break;
   end; { if }

end; { CurParam }

procedure TfrASAParamsForm.FormShow(Sender: TObject);
var
  i: Integer;

begin

 with Query.Params do
   for i := 0 to Count - 1 do
     if ParamsLB.Items.IndexOf(Items[i].Name) = -1 then
       ParamsLB.Items.Add(Items[i].Name);

 for i := 0 to 10 do
   DataTypeCB.Items.Add(frLoadStr(SParamType1 + i));

 ParamsLB.ItemIndex := 0;
 ParamsLBClick(nil);

end; { FormShow }

procedure TfrASAParamsForm.FormHide(Sender: TObject);
begin
 if ValueE.Enabled then ValueEExit(nil);
end; { FormHide }

procedure TfrASAParamsForm.ParamsLBClick(Sender: TObject);
var
  i: Integer;

begin

 DataTypeCB.ItemIndex := -1;
 for i := 0 to 10 do
   if Query.Params[CurParam].DataType = AsaDataTypes[i] then begin
     DataTypeCB.ItemIndex := i;
     break;
   end; { if }

 ParamTypeCB.ItemIndex := -1;
 for i := 0 to 4 do
   if Query.Params[CurParam].ParamType = AsaParamTypes[i] then begin
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

procedure TfrASAParamsForm.ValueEExit(Sender: TObject);
begin
 QueryComp.ParamText[CurParam] := ValueE.Text;
end; { ValueEExit }

procedure TfrASAParamsForm.DataTypeCBChange(Sender: TObject);
begin
 Query.Params[CurParam].DataType := AsaDataTypes[DataTypeCB.ItemIndex];
 if ValueE.Enabled then ValueEExit(nil);
end; { DataTypeCBChange }

procedure TfrASAParamsForm.ParamTypeCBChange(Sender: TObject);
begin
 Query.Params[CurParam].ParamType := AsaParamTypes[ParamTypeCB.ItemIndex];
 if ValueE.Enabled then ValueEExit(nil);
end; { ParamTypeCBChange }

procedure TfrASAParamsForm.ValueRBClick(Sender: TObject);
begin
 if FBusy then Exit;
 ValueE.Enabled := True;
 QueryComp.ParamKind[CurParam] := pkValue;
end; { ValueRBClick }

procedure TfrASAParamsForm.AssignRBClick(Sender: TObject);
begin
 if FBusy then Exit;
 ValueE.Text := '';
 ValueE.Enabled := False;
 QueryComp.ParamKind[CurParam] := pkAssignFromMaster;
end; { AssignRBClick }

procedure TfrASAParamsForm.Localize;
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

procedure TfrASAParamsForm.FormCreate(Sender: TObject);
begin
 Localize;
end; { FormCreate }

procedure TfrASAParamsForm.VarSBClick(Sender: TObject);
begin
 ValueE.Text := frDesigner.InsertExpression;
end; { VarSBClick }

end.

