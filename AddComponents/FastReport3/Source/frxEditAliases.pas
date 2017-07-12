{******************************************}
{ }
{ FastReport v3.0 }
{ Aliases editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditAliases;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxAliasesEditorForm = class(TForm)
    AliasesLV:TListView;
    OkB:TButton;
    CancelB:TButton;
    ResetB:TButton;
    HintL:TLabel;
    DSAliasL:TLabel;
    DSAliasE:TEdit;
    FieldAliasesL:TLabel;
    UpdateB:TButton;
    procedure FormHide(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure ResetBClick(Sender:TObject);
    procedure AliasesLVKeyPress(Sender:TObject; var Key:Char);
    procedure FormCreate(Sender:TObject);
    procedure UpdateBClick(Sender:TObject);
  private
    FDataSet:TfrxCustomDBDataset;
    procedure BuildAliasList(List:TStrings);
  public
    property DataSet:TfrxCustomDBDataset read FDataSet write FDataSet;
  end;

implementation

{$R *.DFM}

uses frxRes;

procedure TfrxAliasesEditorForm.BuildAliasList(List:TStrings);
var
  i:Integer;
  Item:TListItem;
  s:String;
begin
  AliasesLV.Items.Clear;
  for i:= 0 to List.Count-1 do
  begin
    s:= List.Names[i];
    Item:= AliasesLV.Items.Add;
    Item.Caption:= List.Values[s];
    if s[1] = '-' then { field is disabled }
      s:= Copy(s, 2, 255) else
      Item.Checked:= True;
    Item.SubItems.Add(s);
  end;
  if AliasesLV.Items.Count<>0 then
    AliasesLV.Selected:= AliasesLV.Items[0];
end;

procedure TfrxAliasesEditorForm.FormShow(Sender:TObject);
begin
  DSAliasE.Text:= FDataSet.UserName;
  BuildAliasList(FDataSet.FieldAliases);
  if FDataSet.FieldAliases.Count = 0 then
    ResetBClick(nil);
end;

procedure TfrxAliasesEditorForm.FormHide(Sender:TObject);
var
  i:Integer;
  s:String;
begin
  if ModalResult = mrOk then
  begin
    FDataSet.UserName:= DSAliasE.Text;
    FDataSet.FieldAliases.Clear;
    for i:= 0 to AliasesLV.Items.Count-1 do
    begin
      s:= AliasesLV.Items[i].SubItems[0];
      if not AliasesLV.Items[i].Checked then { disable the field }
        s:= '-'+s;
      FDataSet.FieldAliases.Add(s+'='+AliasesLV.Items[i].Caption);
    end;
  end;
end;

procedure TfrxAliasesEditorForm.ResetBClick(Sender:TObject);
var
  i:Integer;
  l1, l2:TStrings;
begin
  l1:= TStringList.Create;
  l2:= TStringList.Create;
  l1.Assign(FDataSet.FieldAliases);
  { clear aliases to get real field names }
  FDataSet.FieldAliases.Clear;
  FDataSet.GetFieldList(l2);
  { set aliases back }
  FDataSet.FieldAliases.Assign(l1);
  l1.Free;

  for i:= 0 to l2.Count-1 do
    l2[i]:= l2[i]+'='+l2[i];

  BuildAliasList(l2);
  l2.Free;
end;

procedure TfrxAliasesEditorForm.UpdateBClick(Sender:TObject);
var
  i:Integer;
  l1, l2:TStrings;
begin
  l1:= TStringList.Create;
  l2:= TStringList.Create;
  l1.Assign(FDataSet.FieldAliases);
  try
    { clear aliases to get real field names }
    FDataSet.FieldAliases.Clear;
    FDataSet.GetFieldList(l2);
  finally
    { set aliases back }
    FDataSet.FieldAliases.Assign(l1);
  end;

  for i:= 0 to l2.Count-1 do
    if l1.IndexOfName(l2[i]) =-1 then
      l2[i]:= l2[i]+'='+l2[i]
    else
      l2[i]:= l2[i]+'='+l1.Values[l2[i]];

  BuildAliasList(l2);
  l1.Free;
  l2.Free;
end;

procedure TfrxAliasesEditorForm.AliasesLVKeyPress(Sender:TObject;
  var Key:Char);
begin
  if (Key = #13) and (AliasesLV.Selected<>nil) then
    AliasesLV.Selected.EditCaption;
end;

procedure TfrxAliasesEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  AliasesLV.Columns[0].Caption:= frxResources.Get('alUserName');
  AliasesLV.Columns[1].Caption:= frxResources.Get('alOriginal');
end;

end.
