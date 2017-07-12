
{******************************************}
{                                          }
{     FastReport v2.4 - ADO components     }
{        Master/detail definition          }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

(*  Adapted by A-D-E.net for use with ADONIS ado components.

    tested with ADONIS 4.1 and ADO 2.6

    date : 6 feb. 2001

*)

unit FR_ADNMd;

interface

{$I ..\FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODS, ExtCtrls, StdCtrls, FR_Const;

type
  TfrADNFieldsLinkForm = class(TForm)
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
    DetailDS: TADOTable;
  end;

implementation

{$R *.DFM}

procedure TfrADNFieldsLinkForm.FillLists;
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

procedure TfrADNFieldsLinkForm.FormShow(Sender: TObject);
//var
//  i: Integer;
begin
  Caption := DetailDS.Name + ' -> ' + MasterDS.Name;
  lm := TStringList.Create;
  ld := TStringList.Create;
  FMasterFields := DetailDS.MasterFields;
  FCurFields := FMasterFields;
  MasterDS.GetFieldNames(lm);
  DetailDS.Open;
{ TODO : ADONIS : kent geen indexen  -> misschien alle velden gebruiken ?? }
//  for i := 0 to DetailDS.IndexFieldCount - 1 do
//    ld.Add(DetailDS.IndexFields[i].FieldName);
  DetailDS.Close;
  FillLists;
end;

procedure TfrADNFieldsLinkForm.FormHide(Sender: TObject);
begin
  if ModalResult = mrOk then
    DetailDS.MasterFields := FCurFields else
    DetailDS.MasterFields := FMasterFields;
  ld.Free;
  lm.Free;
end;

procedure TfrADNFieldsLinkForm.ClearBClick(Sender: TObject);
begin
  FCurFields := '';
  FillLists;
end;

procedure TfrADNFieldsLinkForm.DetailLDrawItem(Control: TWinControl;
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

procedure TfrADNFieldsLinkForm.DetailLClick(Sender: TObject);
begin
  if DetailL.ItemIndex > 0 then
    DetailL.ItemIndex := 0;
  if MasterL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrADNFieldsLinkForm.MasterLClick(Sender: TObject);
begin
  if DetailL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrADNFieldsLinkForm.AddBClick(Sender: TObject);
var s: String;
begin
  s := MasterL.Items[MasterL.ItemIndex];
  if FCurFields = '' then
    FCurFields := s else
    FCurFields := FCurFields + ';' + s;
  FillLists;
end;

procedure TfrADNFieldsLinkForm.FormCreate(Sender: TObject);
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

