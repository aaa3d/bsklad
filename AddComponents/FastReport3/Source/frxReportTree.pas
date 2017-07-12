{******************************************}
{ }
{ FastReport v3.0 }
{ Report Tree }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxReportTree;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxReportTreeForm = class(TForm)
    Tree:TTreeView;
    procedure FormShow(Sender:TObject);
    procedure TreeChange(Sender:TObject; Node:TTreeNode);
    procedure FormCreate(Sender:TObject);
  private
    FComponents:TList;
    FDesigner:TfrxCustomDesigner;
    FNodes:TList;
    FReport:TfrxReport;
    FUpdating:Boolean;
    FOnSelectionChanged:TNotifyEvent;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure SetColor(Value:TColor);
    procedure UpdateItems;
    procedure UpdateSelection;
    property OnSelectionChanged:TNotifyEvent read FOnSelectionChanged
      write FOnSelectionChanged;
  end;

implementation

{$R *.DFM}

uses frxRes;

{ TfrxReportTreeForm }

constructor TfrxReportTreeForm.Create(AOwner:TComponent);
begin
  inherited;
  FComponents:= TList.Create;
  FNodes:= TList.Create;
end;

destructor TfrxReportTreeForm.Destroy;
begin
  FComponents.Free;
  FNodes.Free;
  inherited;
end;

procedure TfrxReportTreeForm.FormShow(Sender:TObject);
begin
  UpdateItems;
end;

procedure TfrxReportTreeForm.UpdateItems;

  procedure SetImageIndex(Node:TTreeNode; Index:Integer);
  begin
    Node.ImageIndex:= Index;
    Node.StateIndex:= Index;
    Node.SelectedIndex:= Index;
  end;

  procedure EnumItems(c:TfrxComponent; RootNode:TTreeNode);
  var
    i:Integer;
    Node:TTreeNode;
  begin
    Node:= Tree.Items.AddChild(RootNode, c.Name);
    FComponents.Add(c);
    FNodes.Add(Node);
    Node.Data:= c;
    if c is TfrxReport then
    begin
      Node.Text:= 'Report';
      SetImageIndex(Node, 76);
    end
    else if c is TfrxReportPage then
      SetImageIndex(Node, 77)
    else if c is TfrxDialogPage then
      SetImageIndex(Node, 78)
    else if c is TfrxBand then
      SetImageIndex(Node, 79)
    else
      SetImageIndex(Node, 75);

    for i:= 0 to c.Objects.Count-1 do
      EnumItems(c.Objects[i], Node);
  end;

begin
  Tree.Items.BeginUpdate;
  Tree.Items.Clear;
  FComponents.Clear;
  FNodes.Clear;
  EnumItems(FReport, nil);

  Tree.FullExpand;
  UpdateSelection;
  Tree.Items.EndUpdate;
end;

procedure TfrxReportTreeForm.TreeChange(Sender:TObject; Node:TTreeNode);
begin
  if FUpdating then Exit;
  FDesigner.SelectedObjects.Clear;
  FDesigner.SelectedObjects.Add(Tree.Selected.Data);
  if Assigned(FOnSelectionChanged) then
    FOnSelectionChanged(Self);
end;

procedure TfrxReportTreeForm.SetColor(Value:TColor);
begin
  Tree.Color:= Value;
  UpdateItems;
end;

procedure TfrxReportTreeForm.FormCreate(Sender:TObject);
begin
  FDesigner:= TfrxCustomDesigner(Owner);
  FReport:= FDesigner.Report;
  Tree.Images:= frxResources.MainButtonImages;
  frxResources.LocalizeForm(Self);
end;

procedure TfrxReportTreeForm.UpdateSelection;
var
  c:TComponent;
  i:Integer;
begin
  if FDesigner.SelectedObjects.Count = 0 then Exit;
  c:= FDesigner.SelectedObjects[0];
  FUpdating:= True;

  i:= FComponents.IndexOf(c);
  if i<>-1 then
  begin
    TTreeNode(FNodes[i]).Selected:= True;
    Tree.TopItem:= TTreeNode(FNodes[i]);
  end;

  FUpdating:= False;
end;

end.
