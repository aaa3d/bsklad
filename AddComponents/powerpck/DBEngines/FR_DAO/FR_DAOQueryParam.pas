
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{           Params / Macros editor         }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOQueryParam;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FR_Ctrls, ExtCtrls, DB, DAOQuery, FR_DAOQuery;

type
  TfrDAOParamsForm = class(TForm)
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
    Query: TDAOQuery;
    QueryComp: TfrDAOQuery;
    M:  Boolean;
  end;

implementation

uses FR_Const, FR_Class, FR_DBUtils;

{$R *.DFM}

function TfrDAOParamsForm.CurParam: Integer;
var
  i: Integer;
  s: String;
begin
  Result := 0;
  s := ParamsLB.Items[ParamsLB.ItemIndex];
  if M then
    for i := 0 to Query.MacroCount - 1 do
      if Query.Macros.Items[i].Name = s then
      begin
        Result := i;
        break;
      end
  else
    for i := 0 to Query.Params.Count - 1 do
      if Query.Params[i].Name = s then
      begin
        Result := i;
        break;
      end;
end;

procedure TfrDAOParamsForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if M then
  begin
    with Query.Macros do
    for i := 0 to Query.MacroCount - 1 do
      if ParamsLB.Items.IndexOf(Items[i].Name) = -1 then
        ParamsLB.Items.Add(Items[i].Name);
    TypeCB.Items.Add(LoadStr(SParamType9));
    TypeCB.ItemIndex := 0;
    TypeCB.Enabled   := False;
    AssignRB.Enabled := False;
  end
  else
  begin
    with Query.Params do
    for i := 0 to Count - 1 do
      if ParamsLB.Items.IndexOf(Items[i].Name) = -1 then
        ParamsLB.Items.Add(Items[i].Name);
    for i := 0 to 10 do
      TypeCB.Items.Add(LoadStr(SParamType1 + i));
    TypeCB.Enabled   := True;
    AssignRB.Enabled := True;
  end;

  ParamsLB.ItemIndex := 0;
  ParamsLBClick(nil);
end;

procedure TfrDAOParamsForm.FormHide(Sender: TObject);
begin
  if ValueE.Enabled then ValueEExit(nil);
end;

procedure TfrDAOParamsForm.ParamsLBClick(Sender: TObject);
var
  i: Integer;
begin
  if M then
  begin
    try
      ValueE.Text := QueryComp.MacroText[CurParam]
    except
      ValueE.Text := '';
    end; 
    ValueE.Enabled := True;
    ValueRB.Checked := True;
    Exit;
  end;

  TypeCB.ItemIndex := -1;
  for i := 0 to 10 do
    if Query.Params[CurParam].DataType = ParamTypes[i] then
    begin
      TypeCB.ItemIndex := i;
      break;
    end;
  FBusy := True;
  ValueE.Text := '';
  ValueE.Enabled := False;
  if QueryComp.ParamKind[CurParam] = pkValue then
  begin
    ValueE.Text := QueryComp.ParamText[CurParam];
    ValueE.Enabled := True;
    ValueRB.Checked := True;
  end
  else
    AssignRB.Checked := True;
  FBusy := False;
end;

procedure TfrDAOParamsForm.ValueEExit(Sender: TObject);
begin
  if M then
    QueryComp.MacroText[CurParam] := ValueE.Text else
    QueryComp.ParamText[CurParam] := ValueE.Text;
end;

procedure TfrDAOParamsForm.TypeCBChange(Sender: TObject);
begin
  if M then
    Query.Macros[CurParam].DataType := ParamTypes[TypeCB.ItemIndex] else
    Query.Params[CurParam].DataType := ParamTypes[TypeCB.ItemIndex];
  if ValueE.Enabled then ValueEExit(nil);
end;

procedure TfrDAOParamsForm.ValueRBClick(Sender: TObject);
begin
  if FBusy then Exit;
  ValueE.Enabled := True;
  QueryComp.ParamKind[CurParam] := pkValue;
end;

procedure TfrDAOParamsForm.AssignRBClick(Sender: TObject);
begin
  if FBusy then Exit;
  ValueE.Text := '';
  ValueE.Enabled := False;
  QueryComp.ParamKind[CurParam] := pkAssignFromMaster;
end;

procedure TfrDAOParamsForm.FormCreate(Sender: TObject);
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

procedure TfrDAOParamsForm.VarSBClick(Sender: TObject);
begin
  ValueE.Text := frDesigner.InsertExpression;
end;

end.

