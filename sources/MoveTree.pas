unit MoveTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1,B_Utils;

type
  TMove_tree = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    BtnSelect: TButton;
    BtnClose: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Move_tree: TMove_tree;

implementation

{$R *.DFM}

procedure TMove_tree.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TMove_tree.BtnSelectClick(Sender: TObject);
begin
     tag:=Treeview1.Selected.StateIndex;
     close;
end;

procedure TMove_tree.TreeView1DblClick(Sender: TObject);
begin
     if BtnSelect.enabled then BtnSelect.click;
end;

procedure TMove_tree.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then BtnClose.click;
end;

procedure TMove_tree.FormShow(Sender: TObject);
begin
     tag:=-1;
end;

end.
