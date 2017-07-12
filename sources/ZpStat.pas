unit ZpStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_dbutils,
  ActnList, Db, IBCustomDataSet, IBQuery, IBDatabase, Menus,EditZP,EditDol;

type
  TZP_STAT = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter2: TSplitter;
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    ActNewUser: TAction;
    ActOpenUser: TAction;
    ActDelUser: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActNewOtdel: TAction;
    ActOpenOtdel: TAction;
    ActDelOtdel: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    PopupTree: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    UsTransaction: TIBTransaction;
    QueryUS: TIBQuery;
    DsUS: TDataSource;
    ToolButton9: TToolButton;
    ActNewRulez: TAction;
    ToolButton10: TToolButton;
    QueryUSDOL_ID: TIntegerField;
    QueryUSDOL_NAME: TIBStringField;
    QueryUSZPPR_ID: TIntegerField;
    QueryUSZPPR_TYP: TIntegerField;
    QueryUSZPPR_DATE: TDateTimeField;
    QueryUSZPPR_OSN: TIBStringField;
    QueryUSUS_ID: TIntegerField;
    QueryUSUS_FULL: TIBStringField;
    QueryUSZPPR_FULLNUM: TIBStringField;
    procedure ActOpenUserExecute(Sender: TObject);
    procedure ActNewUserExecute(Sender: TObject);
    procedure ActDelOtdelExecute(Sender: TObject);
    procedure ActOpenOtdelExecute(Sender: TObject);
    procedure ActNewOtdelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function load_otdel(n:integer):TtreeNode;
    procedure TreeView1DblClick(Sender: TObject);
    procedure refresh_tree;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ActDelDolExecute(Sender: TObject);
    procedure ActNewRulezExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_STAT: TZP_STAT;
  ROOT,TREE,TREE2,TREE3:TtreeNode;
  CanRefresh:boolean;

implementation

uses Mainform, EditOtdel, DicKlient, KlnToOtdel, ZpRlUser, MoveTree,
  EditZpRulez;

{$R *.DFM}


procedure TZP_STAT.refresh_tree;
begin
   // перезапрашиваем данные отдела
   UsTransaction.Active:=false;
   QueryUS.close;
   QueryUS.ParamByname('otdel_id').asinteger:=Treeview1.selected.stateindex;
   QueryUS.open;
end;


procedure TZP_STAT.ActOpenUserExecute(Sender: TObject);
begin
   // Изменить должность
   Application.createForm(TEDIT_DOL,EDIT_DOL);
   EDIT_DOL.DOL_NAME.tag:=Treeview1.selected.StateIndex;
   EDIT_DOL.tag:=QueryUS.fieldByname('DOL_ID').asinteger;
   EDIT_DOL.ShowModal;
   if EDIT_DOL.tag>0 then begin
      Refresh_tree;
      QueryUS.locate('dol_id',EDIT_DOL.tag,[]);
   end;
   EDIT_DOL.destroy;
end;

procedure TZP_STAT.ActNewUserExecute(Sender: TObject);
var
  stat_id:integer;
  r:double;
begin
   // Новая должность
   Application.createForm(TEDIT_DOL,EDIT_DOL);
   EDIT_DOL.DOL_NAME.tag:=Treeview1.selected.StateIndex;
   EDIT_DOL.tag:=-1;
   EDIT_DOL.ShowModal;
   if EDIT_DOL.tag>0 then begin
      Refresh_tree;
      QueryUS.locate('dol_id',EDIT_DOL.tag,[]);
   end;
   EDIT_DOL.destroy;
end;

procedure TZP_STAT.ActDelOtdelExecute(Sender: TObject);
var
  t:ttreenode;
begin
   // Удалить отдел...
  if Treeview1.selected.stateindex>0 then begin
     if messbox('Удалить отдел "'+Treeview1.selected.Text+'" ?',messsubmitdelete,4+48+256)=6 then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       if IBDELETE_DOC('OTDEL',Treeview1.selected.stateindex) then begin
          Datamodule1.IBTransaction2.commit;
          Datamodule1.IBTransaction2.Active:=False;
          load_otdel(0);
          Treeview1.Selected:=ROOT;
          root.Expand(True);
       end else begin
          Datamodule1.IBTransaction2.Rollback;
          Datamodule1.IBTransaction2.Active:=False;
          t:=load_otdel(Treeview1.selected.stateindex);
          Treeview1.selected:=t;
       end;
     end;
  end;
end;

procedure TZP_STAT.ActOpenOtdelExecute(Sender: TObject);
var
  t:ttreenode;
begin
  // Изменить отдел
  if Treeview1.selected.stateindex>0 then begin
    Application.CreateForm(TEDIT_OTDEL,EDIT_OTDEL);
    EDIT_OTDEL.tag:=Treeview1.selected.stateindex;
    EDIT_OTDEL.showmodal;
    if EDIT_OTDEL.tag>0 then begin
       t:=load_otdel(EDIT_OTDEL.tag);
       Treeview1.selected:=t;
    end;
    EDIT_OTDEL.destroy;
  end;
end;

procedure TZP_STAT.ActNewOtdelExecute(Sender: TObject);
var
  t:ttreenode;
begin
    // Новый отдел
    Application.CreateForm(TEDIT_OTDEL,EDIT_OTDEL);
    EDIT_OTDEL.tag:=-1;
    EDIT_OTDEL.showmodal;
    if EDIT_OTDEL.tag>0 then begin
       t:=load_otdel(EDIT_OTDEL.tag);
       Treeview1.selected:=t;
    end;
    EDIT_OTDEL.destroy;
end;

function TZP_STAT.load_otdel(n:integer):TtreeNode;
begin
    Treeview1.items.BeginUpdate;
    Treeview1.items.clear;
    ROOT:=Treeview1.items.add(NIL,'Отделы');
    ROOT.stateindex:=0;
    ROOT.imageindex:=142;
    ROOT.selectedindex:=142;
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select * from otdel order by otdel_name');
    while not QueryWork.eof do begin
       TREE2:=Treeview1.items.addChild(ROOT,QueryWork.fieldByname('OTDEL_NAME').asstring);
       TREE2.stateindex:=QueryWork.fieldByname('OTDEL_ID').asinteger;
       TREE2.imageindex:=160;
       TREE2.selectedindex:=161;
       if n=TREE2.stateindex then result:=TREE2;
       QueryWork.next;
    end;
    Treeview1.items.EndUpdate;
end;

procedure TZP_STAT.FormShow(Sender: TObject);
begin
    CanRefresh:=False;
    Top:=Main_Form.Top+22;
    Left:=Screen.DesktopLeft;
    Width:=Screen.Width;
    Height:=Screen.Height-Main_Form.Top-22-28;
    load_otdel(0);
    CanRefresh:=True;
    Treeview1.Selected:=ROOT;
    root.Expand(True);
    refresh_tree;
end;

procedure TZP_STAT.TreeView1DblClick(Sender: TObject);
begin
   if ActOpenOtdel.Enabled then ActOpenOtdel.Execute; 
end;

procedure TZP_STAT.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   if CanRefresh then refresh_tree;
end;

procedure TZP_STAT.RxDBGrid1DblClick(Sender: TObject);
begin
   if ActOpenUser.enabled then ActOpenUser.Execute;
end;

procedure TZP_STAT.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#13;
      if ActOpenUser.enabled then ActOpenUser.Execute;
   end
end;

procedure TZP_STAT.ActDelDolExecute(Sender: TObject);
begin
   // Удалить должность
end;

procedure TZP_STAT.ActNewRulezExecute(Sender: TObject);
begin
   // Правила расчета зарплаты по должности
   Application.CreateForm(TEDIT_ZP_RULEZ,EDIT_ZP_RULEZ);
   EDIT_ZP_RULEZ.showModal;
   EDIT_ZP_RULEZ.Destroy;
end;

end.
