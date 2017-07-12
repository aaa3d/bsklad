{******************************************}
{ }
{ FastReport v3.0 }
{ Data Tree tool window }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDataTree;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frxClass, fs_xml, ComCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxDataTreeForm = class(TForm)
    Tabs:TPageControl;
    DataTS:TTabSheet;
    VariablesTS:TTabSheet;
    DataTree:TTreeView;
    VariablesTree:TTreeView;
    FunctionsTS:TTabSheet;
    FunctionsTree:TTreeView;
    HintPanel:TPanel;
    Splitter1:TSplitter;
    FunctionDescL:TLabel;
    FunctionNameL:TLabel;
    CBPanel:TPanel;
    InsFieldCB:TCheckBox;
    InsCaptionCB:TCheckBox;
    procedure FormResize(Sender:TObject);
    procedure DataTreeCustomDrawItem(Sender:TCustomTreeView;
      Node:TTreeNode; State:TCustomDrawState; var DefaultDraw:Boolean);
    procedure FunctionsTreeChange(Sender:TObject; Node:TTreeNode);
    procedure FormShow(Sender:TObject);
    procedure DataTreeDblClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
  private
    { Private declarations }
    FXML:TfsXMLDocument;
    FImages:TImageList;
    FReport:TfrxReport;
    FUpdating:Boolean;
    FFirstTime:Boolean;
    procedure FillDataTree;
    procedure FillFunctionsTree;
    procedure FillVariablesTree;
    function GetCollapsedNodes:String;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure SetColor(Color:TColor);
    procedure UpdateItems;
    function GetFieldName:String;
    function IsDataField:Boolean;
  end;

implementation

{$R *.DFM}

uses fs_iinterpreter, fs_itools, frxRes;

var
  CollapsedNodes:String;

procedure SetImageIndex(Node:TTreeNode; Index:Integer);
begin
  Node.ImageIndex:= Index;
  Node.StateIndex:= Index;
  Node.SelectedIndex:= Index;
end;

{ TfrxDataTreeForm }

constructor TfrxDataTreeForm.Create(AOwner:TComponent);
begin
  inherited;
  FImages:= frxResources.MainButtonImages;
  FReport:= TfrxCustomDesigner(AOwner).Report;
  DataTree.Images:= FImages;
  VariablesTree.Images:= FImages;
  FunctionsTree.Images:= FImages;
  FXML:= TfsXMLDocument.Create;
  FFirstTime:= True;
end;

destructor TfrxDataTreeForm.Destroy;
begin
  CollapsedNodes:= GetCollapsedNodes;
  FUpdating:= True;
  FXML.Free;
  inherited;
end;

procedure TfrxDataTreeForm.FillDataTree;
var
  ds:TfrxDataSet;
  DatasetsList, FieldsList:TStrings;
  i, j:Integer;
  Root, Node1, Node2:TTreeNode;
  s, Collapsed:String;
begin
  DatasetsList:= TStringList.Create;
  FieldsList:= TStringList.Create;
  FReport.GetDataSetList(DatasetsList);

  try
    if FFirstTime then
      Collapsed:= CollapsedNodes
    else
      Collapsed:= GetCollapsedNodes;

    DataTree.Items.BeginUpdate;
    DataTree.Items.Clear;
    if DatasetsList.Count = 0 then
      s:= frxResources.Get('dtNoData') else
      s:= frxResources.Get('dtData');
    Root:= DataTree.Items.AddChild(nil, s);
    SetImageIndex(Root, 53);

    for i:= 0 to DatasetsList.Count-1 do
    begin
      ds:= TfrxDataSet(DatasetsList.Objects[i]);
      if ds = nil then continue;
      ds.GetFieldList(FieldsList);

      Node1:= DataTree.Items.AddChild(Root, FReport.GetAlias(ds));
      Node1.Data:= ds;
      SetImageIndex(Node1, 53);

      for j:= 0 to FieldsList.Count-1 do
      begin
        Node2:= DataTree.Items.AddChild(Node1, FieldsList[j]);
        Node2.Data:= ds;
        SetImageIndex(Node2, 54);
      end;
    end;

    DataTree.Items[0].Expanded:= True;
    for i:= 0 to DataTree.Items[0].Count-1 do
    begin
      s:= DataTree.Items[0][i].Text;
      if Pos(s+',', Collapsed) = 0 then
        DataTree.Items[0][i].Expanded:= True;
    end;

  finally
    DataTree.Items.EndUpdate;
    DatasetsList.Free;
    FieldsList.Free;
  end;
end;

procedure TfrxDataTreeForm.FillVariablesTree;
var
  CategoriesList, VariablesList:TStrings;
  i:Integer;
  Root, Node:TTreeNode;

  procedure AddVariables(Node:TTreeNode);
  var
    i:Integer;
    Node1:TTreeNode;
  begin
    for i:= 0 to VariablesList.Count-1 do
    begin
      Node1:= VariablesTree.Items.AddChild(Node, VariablesList[i]);
      SetImageIndex(Node1, 80);
    end;
  end;

  procedure AddScriptVariables;
  var
    i:Integer;
    x:TfsXMLDocument;
    xi:TfsXMLItem;
    Node:TTreeNode;
    s:String;
  begin
    x:= TfsXMLDocument.Create;
    GenerateXMLContents(FReport.Script, x.Root);

    xi:= x.Root.FindItem('Variables');
    for i:= 0 to xi.Count-1 do
    begin
      s:= xi[i].Prop['text'];
      s:= Copy(s, 1, Pos(':', s)-1);
      Node:= VariablesTree.Items.AddChild(Root, s);
      Node.Data:= Pointer(1);
      SetImageIndex(Node, 80);
    end;

    x.Free;
  end;

  procedure AddSystemVariables;
  var
    SysNode:TTreeNode;

    procedure AddNode(const s:String);
    var
      Node:TTreeNode;
    begin
      Node:= VariablesTree.Items.AddChild(SysNode, s);
      SetImageIndex(Node, 80);
    end;

  begin
    SysNode:= VariablesTree.Items.AddChild(Root, frxResources.Get('dtSysVar'));
    SetImageIndex(SysNode, 66);

    AddNode('Date');
    AddNode('Time');
    AddNode('Page');
    AddNode('Page#');
    AddNode('TotalPages');
    AddNode('TotalPages#');
    AddNode('Line');
    AddNode('Line#');
  end;

begin
  CategoriesList:= TStringList.Create;
  VariablesList:= TStringList.Create;
  FReport.Variables.GetCategoriesList(CategoriesList);

  VariablesTree.Items.BeginUpdate;
  VariablesTree.Items.Clear;
  Root:= VariablesTree.Items.AddChild(nil, frxResources.Get('dtVar'));
  SetImageIndex(Root, 66);

  for i:= 0 to CategoriesList.Count-1 do
  begin
    FReport.Variables.GetVariablesList(CategoriesList[i], VariablesList);
    Node:= VariablesTree.Items.AddChild(Root, CategoriesList[i]);
    SetImageIndex(Node, 66);
    AddVariables(Node);
  end;

  if CategoriesList.Count = 0 then
  begin
    FReport.Variables.GetVariablesList('', VariablesList);
    AddVariables(Root);
  end;

  AddScriptVariables;
  AddSystemVariables;

  VariablesTree.FullExpand;
  VariablesTree.TopItem:= Root;
  VariablesTree.Items.EndUpdate;
  CategoriesList.Free;
  VariablesList.Free;
end;

procedure TfrxDataTreeForm.FillFunctionsTree;

  procedure AddFunctions(xi:TfsXMLItem; Root:TTreeNode);
  var
    i:Integer;
    Node:TTreeNode;
    s:String;
  begin
    s:= xi.Prop['text'];
    if xi.Count = 0 then
      s:= Copy(s, Pos(' ', s)+1, 255) else { function }
      s:= frxResources.Get(s); { category }

    if CompareText(s, 'hidden') = 0 then Exit;
    Node:= FunctionsTree.Items.AddChild(Root, s);
    if xi.Count = 0 then
      Node.Data:= xi;
    if Root = nil then
      Node.Text:= frxResources.Get('dtFunc');
    if xi.Count = 0 then
      SetImageIndex(Node, 80) else
      SetImageIndex(Node, 66);

    for i:= 0 to xi.Count-1 do
      AddFunctions(xi[i], Node);
  end;

begin
  FUpdating:= True;
  FXML.Root.Clear;
  GenerateXMLContents(fsGlobalUnit, FXML.Root, True);
  GenerateXMLContents(FReport.Script, FXML.Root, True);

  FunctionsTree.Items.BeginUpdate;
  FunctionsTree.Items.Clear;
  AddFunctions(FXML.Root.FindItem('Functions'), nil);

  FunctionsTree.FullExpand;
  FunctionsTree.TopItem:= FunctionsTree.Items[0];
  FunctionsTree.Items.EndUpdate;
  FUpdating:= False;
end;

function TfrxDataTreeForm.GetCollapsedNodes:String;
var
  i:Integer;
  s:String;
begin
  Result:= '';
  if DataTree.Items.Count > 0 then
    for i:= 0 to DataTree.Items[0].Count-1 do
    begin
      s:= DataTree.Items[0][i].Text;
      if not DataTree.Items[0][i].Expanded then
        Result:= Result+s+',';
    end;
end;

function TfrxDataTreeForm.GetFieldName:String;
var
  i, n:Integer;
  s:String;
  Node:TTreeNode;
begin
  Result:= '';
  if Tabs.ActivePage = DataTS then
  begin
    Node:= DataTree.Selected;
    if (Node<>nil) and (Node.Count = 0) and (Node.Data<>nil) then
      Result:= '<'+FReport.GetAlias(TfrxDataSet(Node.Data))+
        '."'+Node.Text+'"'+'>';
  end
  else if Tabs.ActivePage = VariablesTS then
  begin
    Node:= VariablesTree.Selected;
    if (Node<>nil) and (Node.Count = 0) then
      if Node.Data<>nil then
        Result:= Node.Text else
        Result:= '<'+Node.Text+'>';
  end
  else if (FunctionsTree.Selected<>nil) and (FunctionsTree.Selected.Count = 0) then
  begin
    s:= FunctionsTree.Selected.Text;
    if Pos('(', s)<>0 then
      n:= 1 else
      n:= 0;
    for i:= 1 to Length(s) do
      if s[i] in [',', ';'] then
        Inc(n);

    if n = 0 then
      s:= Copy(s, 1, Pos(':', s)-1)
    else
    begin
      s:= Copy(s, 1, Pos('(', s));
      for i:= 1 to n-1 do
        s:= s+',';
      s:= s+')';
    end;
    Result:= s;
  end;
end;

function TfrxDataTreeForm.IsDataField:Boolean;
begin
  Result:= Tabs.ActivePage = DataTS;
end;

procedure TfrxDataTreeForm.UpdateItems;
begin
  FillDataTree;
  FillVariablesTree;
  if FFirstTime then
    FillFunctionsTree;
  FFirstTime:= False;
end;

procedure TfrxDataTreeForm.SetColor(Color:TColor);
begin
  DataTree.Color:= Color;
  VariablesTree.Color:= Color;
  FunctionsTree.Color:= Color;
end;

procedure TfrxDataTreeForm.FormResize(Sender:TObject);
begin
  AutoScroll:= False;
  Tabs.SetBounds(-4, 0, ClientWidth+8, ClientHeight+4);
end;

procedure TfrxDataTreeForm.DataTreeCustomDrawItem(Sender:TCustomTreeView;
  Node:TTreeNode; State:TCustomDrawState; var DefaultDraw:Boolean);
begin
  if Node.Count<>0 then
    Sender.Canvas.Font.Style:= [fsBold];
end;

procedure TfrxDataTreeForm.FunctionsTreeChange(Sender:TObject;
  Node:TTreeNode);
var
  xi:TfsXMLItem;
begin
  if FUpdating then Exit;
  Node:= FunctionsTree.Selected;
  if (Node = nil) or (Node.Data = nil) then
  begin
    FunctionNameL.Caption:= '';
    FunctionDescL.Caption:= '';
    Exit;
  end
  else
  begin
    xi:= Node.Data;
    FunctionNameL.Caption:= xi.Prop['text'];
    FunctionDescL.Caption:= frxResources.Get(xi.Prop['description']);
  end;
end;

procedure TfrxDataTreeForm.FormShow(Sender:TObject);
begin
  DataTree.FullExpand;
  VariablesTree.FullExpand;
  FunctionsTree.FullExpand;
  FunctionsTree.TopItem:= FunctionsTree.Items[0];
end;

procedure TfrxDataTreeForm.DataTreeDblClick(Sender:TObject);
begin
  if Assigned(OnDblClick) then
    OnDblClick(Sender);
end;

procedure TfrxDataTreeForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
