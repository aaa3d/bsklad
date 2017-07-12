{******************************************}
{ }
{ FastReport v3.0 }
{ Tab order editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditTabOrder;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, frxClass;

type
  TfrxTabOrderEditorForm = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    Label1:TLabel;
    UpB:TButton;
    DownB:TButton;
    ControlsLB:TListBox;
    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure UpBClick(Sender:TObject);
    procedure DownBClick(Sender:TObject);
  private
    FOldOrder:TList;
    FParent:TfrxComponent;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.DFM}

uses frxRes;

constructor TfrxTabOrderEditorForm.Create(AOwner:TComponent);
begin
  inherited;
  FOldOrder:= TList.Create;
end;

destructor TfrxTabOrderEditorForm.Destroy;
begin
  FOldOrder.Free;
  inherited;
end;

procedure TfrxTabOrderEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxTabOrderEditorForm.FormShow(Sender:TObject);
var
  i:Integer;
  l:TList;
begin
  if TfrxCustomDesigner(Owner).SelectedObjects.Count = 0 then
    FParent:= TfrxCustomDesigner(Owner).Page
  else
    FParent:= TfrxCustomDesigner(Owner).SelectedObjects[0];
  l:= FParent.Objects;
  for i:= 0 to l.Count-1 do
  begin
    FOldOrder.Add(l[i]);
    if (TObject(l[i]) is TfrxDialogControl) and
      (TfrxDialogControl(l[i]).Control is TWinControl) then
      ControlsLB.Items.AddObject(TfrxDialogControl(l[i]).Name+':'+
        TfrxDialogControl(l[i]).GetDescription, l[i]);
  end;
end;

procedure TfrxTabOrderEditorForm.FormHide(Sender:TObject);
var
  i:Integer;
begin
  if ModalResult<>mrOk then
    for i:= 0 to FOldOrder.Count-1 do
      FParent.Objects[i]:= FOldOrder[i];
end;

procedure TfrxTabOrderEditorForm.UpBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= ControlsLB.ItemIndex;
  if (i =-1) or (i = 0) then Exit;

  FParent.Objects.Exchange(FParent.Objects.IndexOf(ControlsLB.Items.Objects[i]),
    FParent.Objects.IndexOf(ControlsLB.Items.Objects[i-1]));
  ControlsLB.Items.Exchange(i, i-1);
  ControlsLB.ItemIndex:= i-1;
end;

procedure TfrxTabOrderEditorForm.DownBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= ControlsLB.ItemIndex;
  if (i =-1) or (i = ControlsLB.Items.Count-1) then Exit;

  FParent.Objects.Exchange(FParent.Objects.IndexOf(ControlsLB.Items.Objects[i]),
    FParent.Objects.IndexOf(ControlsLB.Items.Objects[i+1]));
  ControlsLB.Items.Exchange(i, i+1);
  ControlsLB.ItemIndex:= i+1;
end;

end.
