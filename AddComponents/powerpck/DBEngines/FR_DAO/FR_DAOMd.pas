
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{        Master/detail definition          }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOMd;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ExtCtrls, StdCtrls, FR_Const, DAOMDTable;

type
  TfrDAOFieldsLinkForm = class(TForm)
    DetailL: TListBox;
    MasterL: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    AddB: TButton;
    JoinL: TListBox;
    Label3: TLabel;
    ClearB: TButton;
    Bevel1: TBevel;
    OkB: TButton;
    CancelB: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ClearBClick(Sender: TObject);
    procedure DetailLDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure DetailLClick(Sender: TObject);
    procedure MasterLClick(Sender: TObject);
    procedure AddBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMasterFields, FCurFields: String;
    lm, ld: TStringList;
    procedure FillLists;
  public
    { Public declarations }
    MasterDS: TDataset;
    MasterDetailTable: TDAOMasterDetailTable;
  end;

implementation

{$R *.DFM}

procedure TfrDAOFieldsLinkForm.FillLists;
var
  i: Integer;
  s: String;
begin
  MasterL.Items.Assign(lm);
  DetailL.Items.Assign(ld);
  JoinL.Items.Clear;
  i := 1;
  while i <= Length(FCurFields) do
  begin
    s := ExtractFieldName(FCurFields, i);
    JoinL.Items.Add(DetailL.Items[0] + ' -> ' + s);
    DetailL.Items.Delete(0);
    MasterL.Items.Delete(MasterL.Items.IndexOf(s));
  end;
  AddB.Enabled := False;
end;

procedure TfrDAOFieldsLinkForm.FormShow(Sender: TObject);
var i: Integer;
begin
  Caption := MasterDetailTable.Name + ' -> ' + MasterDS.Name;
  lm := TStringList.Create;
  ld := TStringList.Create;
  FMasterFields := MasterDetailTable.MasterFields;
  FCurFields := FMasterFields;
  MasterDS.GetFieldNames(lm);
  MasterDetailTable.Open;
  for i := 0 to MasterDetailTable.FieldCount - 1 do
    ld.Add(MasterDetailTable.Fields[i].FieldName);
  MasterDetailTable.Close;
  FillLists;
end;

procedure TfrDAOFieldsLinkForm.FormHide(Sender: TObject);
begin
  if ModalResult = mrOk then
    MasterDetailTable.MasterFields := FCurFields else
    MasterDetailTable.MasterFields := FMasterFields;
  ld.Free;
  lm.Free;
end;

procedure TfrDAOFieldsLinkForm.ClearBClick(Sender: TObject);
begin
  FCurFields := '';
  FillLists;
end;

procedure TfrDAOFieldsLinkForm.DetailLDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with DetailL.Canvas do
  begin
    if Index > 0 then
      Font.Color := clBtnShadow;
    FillRect(Rect);
    TextOut(Rect.Left + 2, Rect.Top, DetailL.Items[Index]);
  end;
end;

procedure TfrDAOFieldsLinkForm.DetailLClick(Sender: TObject);
begin
  if DetailL.ItemIndex > 0 then
    DetailL.ItemIndex := 0;
  if MasterL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrDAOFieldsLinkForm.MasterLClick(Sender: TObject);
begin
  if DetailL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrDAOFieldsLinkForm.AddBClick(Sender: TObject);
var s: String;
begin
  s := MasterL.Items[MasterL.ItemIndex];
  if FCurFields = '' then
    FCurFields := s else
    FCurFields := FCurFields + ';' + s;
  FillLists;
end;

procedure TfrDAOFieldsLinkForm.FormCreate(Sender: TObject);
begin
  Label1.Caption := LoadStr(frRes + 3130);
  Label2.Caption := LoadStr(frRes + 3131);
  Label3.Caption := LoadStr(frRes + 3132);
  AddB.Caption := LoadStr(frRes + 3133);
  ClearB.Caption := LoadStr(frRes + 3134);
  OkB.Caption := LoadStr(SOk);
  CancelB.Caption := LoadStr(SCancel);
end;

end.

