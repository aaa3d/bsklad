{******************************************}
{                                          }
{     FastReport v2.4 - ADS components     }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

{ 
  Master/detail definitions.
  
  Adapted by Dmitry Koudryavtsev
  http://juliasoft.chat.ru
  juliasoft@mail.ru

  for use with Advantage TDataSet descendant components
}

unit FR_ADSMd;

interface

{$I FR.inc}

uses
  SysUtils, Classes, FR_Class, StdCtrls, Controls, Graphics,
{$IFDEF DELPHI3}
  Windows,
{$ELSE}
  Types,
{$ENDIF}
  DB, ADSTable, ExtCtrls, FR_Const, Forms;

type
  TfrADSFieldsLinkForm = class(TForm)
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
    procedure Localize;
  public
    { Public declarations }
    MasterDS: TDataset;
    DetailDS: TADSTable;
  end;

implementation

uses FR_Utils;

{$R *.DFM}


procedure TfrADSFieldsLinkForm.FillLists;
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

procedure TfrADSFieldsLinkForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  Caption := DetailDS.Name + ' -> ' + MasterDS.Name;
  lm := TStringList.Create;
  ld := TStringList.Create;
  FMasterFields := DetailDS.MasterFields;
  FCurFields := FMasterFields;
  MasterDS.GetFieldNames(lm);
  DetailDS.Open;
  for i := 0 to DetailDS.IndexFieldCount - 1 do
    ld.Add(DetailDS.IndexFields[i].FieldName);
  DetailDS.Close;
  FillLists;
end;

procedure TfrADSFieldsLinkForm.FormHide(Sender: TObject);
begin
  if ModalResult = mrOk then
    DetailDS.MasterFields := FCurFields else
    DetailDS.MasterFields := FMasterFields;
  ld.Free;
  lm.Free;
end;

procedure TfrADSFieldsLinkForm.ClearBClick(Sender: TObject);
begin
  FCurFields := '';
  FillLists;
end;

procedure TfrADSFieldsLinkForm.DetailLDrawItem(Control: TWinControl;
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

procedure TfrADSFieldsLinkForm.DetailLClick(Sender: TObject);
begin
  if DetailL.ItemIndex > 0 then
    DetailL.ItemIndex := 0;
  if MasterL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrADSFieldsLinkForm.MasterLClick(Sender: TObject);
begin
  if DetailL.ItemIndex <> -1 then
    AddB.Enabled := True;
end;

procedure TfrADSFieldsLinkForm.AddBClick(Sender: TObject);
var s: String;
begin
  s := MasterL.Items[MasterL.ItemIndex];
  if FCurFields = '' then
    FCurFields := s else
    FCurFields := FCurFields + ';' + s;
  FillLists;
end;

procedure TfrADSFieldsLinkForm.Localize;
begin
  Label1.Caption := frLoadStr(frRes + 3130);
  Label2.Caption := frLoadStr(frRes + 3131);
  Label3.Caption := frLoadStr(frRes + 3132);
  AddB.Caption := frLoadStr(frRes + 3133);
  ClearB.Caption := frLoadStr(frRes + 3134);
  OkB.Caption := frLoadStr(SOk);
  CancelB.Caption := frLoadStr(SCancel);
end;

procedure TfrADSFieldsLinkForm.FormCreate(Sender: TObject);
begin
  Localize;
end;

end.

