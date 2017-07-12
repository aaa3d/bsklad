
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{           QueryDef / Params editor       }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOQueryDefParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, DB, DAOQueryDef, FR_DAOQueryDef;

type
  TfrDAODefParamsForm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ParamsLB: TListBox;
    TypeCB: TComboBox;
    ValueRB: TRadioButton;
    AssignRB: TRadioButton;
    Label1: TLabel;
    ValueE: TfrComboEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ParamsLBClick(Sender: TObject);
    procedure ValueEExit(Sender: TObject);
    procedure TypeCBChange(Sender: TObject);
    procedure ValueRBClick(Sender: TObject);
    procedure AssignRBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VarSBClick(Sender: TObject);
  private
    { Private declarations }
    FBusy: Boolean;
    function CurParam: Integer;
  public
    { Public declarations }
    QueryDef: TDAOQueryDef;
    QueryDefComp: TfrDAOQueryDef;
  end;

implementation

uses FR_Const, FR_Class, FR_DBUtils;

{$R *.DFM}

function TfrDAODefParamsForm.CurParam: Integer;
var
  i: Integer;
  s: String;
begin
  Result := 0;
  s := ParamsLB.Items[ParamsLB.ItemIndex];
  for i := 0 to QueryDef.Params.Count - 1 do
    if QueryDef.Params[i].Name = s then
    begin
      Result := i;
      break;
    end;
end;

procedure TfrDAODefParamsForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  with QueryDef.Params do
  for i := 0 to Count - 1 do
    if ParamsLB.Items.IndexOf(Items[i].Name) = -1 then
       ParamsLB.Items.Add(Items[i].Name);
  for i := 0 to 10 do
    TypeCB.Items.Add(LoadStr(SParamType1 + i));
  TypeCB.Enabled   := True;
  AssignRB.Enabled := True;

  ParamsLB.ItemIndex := 0;
  ParamsLBClick(nil);
end;

procedure TfrDAODefParamsForm.FormHide(Sender: TObject);
begin
  if ValueE.Enabled then ValueEExit(nil);
end;

procedure TfrDAODefParamsForm.ParamsLBClick(Sender: TObject);
var
  i: Integer;
begin
  TypeCB.ItemIndex := -1;
  for i := 0 to 10 do
    if QueryDef.Params[CurParam].DataType = ParamTypes[i] then
    begin
      TypeCB.ItemIndex := i;
      break;
    end;
  FBusy := True;
  ValueE.Text := '';
  ValueE.Enabled := False;
  if QueryDefComp.ParamKind[CurParam] = pkValue then
  begin
    ValueE.Text := QueryDefComp.ParamText[CurParam];
    ValueE.Enabled := True;
    ValueRB.Checked := True;
  end
  else
    AssignRB.Checked := True;
  FBusy := False;
end;

procedure TfrDAODefParamsForm.ValueEExit(Sender: TObject);
begin
  QueryDefComp.ParamText[CurParam] := ValueE.Text;
end;

procedure TfrDAODefParamsForm.TypeCBChange(Sender: TObject);
begin
  QueryDef.Params[CurParam].DataType := ParamTypes[TypeCB.ItemIndex];
  if ValueE.Enabled then ValueEExit(nil);
end;

procedure TfrDAODefParamsForm.ValueRBClick(Sender: TObject);
begin
  if FBusy then Exit;
  ValueE.Enabled := True;
  QueryDefComp.ParamKind[CurParam] := pkValue;
end;

procedure TfrDAODefParamsForm.AssignRBClick(Sender: TObject);
begin
  if FBusy then Exit;
  ValueE.Text := '';
  ValueE.Enabled := False;
  QueryDefComp.ParamKind[CurParam] := pkAssignFromMaster;
end;

procedure TfrDAODefParamsForm.FormCreate(Sender: TObject);
begin
  GroupBox1.Caption := LoadStr(frRes + 3110);
  Label2.Caption := LoadStr(frRes + 3111);
  Label1.Caption := LoadStr(frRes + 3112);
  ValueRB.Caption := LoadStr(frRes + 3113);
  AssignRB.Caption := LoadStr(frRes + 3115);
  ValueE.ButtonHint := LoadStr(frRes + 575);
  Button1.Caption := LoadStr(SOk);
  Button2.Caption := LoadStr(SCancel);
end;

procedure TfrDAODefParamsForm.VarSBClick(Sender: TObject);
begin
  ValueE.Text := frDesigner.InsertExpression;
end;

end.

