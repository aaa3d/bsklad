{******************************************}
{ }
{ FastReport v3.0 }
{ New item dialog }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxNewItem;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ImgList;

type
  TfrxNewItemForm = class(TForm)
    Pages:TPageControl;
    ItemsTab:TTabSheet;
    TemplatesTab:TTabSheet;
    OkB:TButton;
    CancelB:TButton;
    ItemsLV:TListView;
    TemplatesLV:TListView;
    Images:TImageList;
    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure ItemsLVDblClick(Sender:TObject);
    procedure FormDestroy(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses frxClass, frxDsgnIntf, frxUtils, frxRes;

procedure TfrxNewItemForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxNewItemForm.FormShow(Sender:TObject);
var
  i:Integer;
  Item:TfrxWizardItem;
begin
  for i:= 0 to frxWizards.Count-1 do
  begin
    Item:= frxWizards[i];
    with ItemsLV.Items.Add do
    begin
      Caption:= Item.ClassRef.GetDescription;
      frxAssignImages(Item.ButtonBmp, 22, 22, Images);
      ImageIndex:= Images.Count-1;
      Data:= Item;
    end;
  end;
end;

procedure TfrxNewItemForm.ItemsLVDblClick(Sender:TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrxNewItemForm.FormDestroy(Sender:TObject);
var
  w:TfrxCustomWizard;
begin
  if ModalResult = mrOk then
  begin
    if (Pages.ActivePage = ItemsTab) and (ItemsLV.Selected<>nil) then
    begin
      w:= TfrxCustomWizard(TfrxWizardItem(ItemsLV.Selected.Data).ClassRef.NewInstance);
      w.Create(Owner);
      if w.Execute then
        w.Designer.Modified:= True;
      w.Free;
    end
    else if (Pages.ActivePage = TemplatesTab) and (TemplatesLV.Selected<>nil) then
    begin
    end;
  end;
end;

end.
