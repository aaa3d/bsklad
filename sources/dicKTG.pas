unit dicKTG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin,Data1,b_utils,b_dbutils, Grids, DBGrids,
  RXDBCtrl, Db, IBCustomDataSet, IBQuery, IBDatabase,VclUtils;

type
  TDIC_KTG = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    BtnNewGroup: TToolButton;
    BtnMove: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    BtnSelect: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton1: TToolButton;
    RxDBGrid1: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    DsList: TDataSource;
    QueryListID: TIntegerField;
    QueryListTREE: TIBStringField;
    QueryListNAME: TIBStringField;
    QueryListOPIS: TIBStringField;
    QueryListVID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure TreeView1Enter(Sender: TObject);
    procedure TreeView1Exit(Sender: TObject);
    procedure BtnNewGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure RefreshTree;
    procedure BtnMoveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure QueryListAfterOpen(DataSet: TDataSet);
    procedure BtnSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
    TWTREETYP=record
       ID:integer;
       PAR:integer;
       NAME:ansistring;
       USE:boolean;
       TREE:TtreeNode;
    end;

var
  Select:integer;
  DIC_KTG: TDIC_KTG;
  KTGROOT,TREE2,TREE3:TtreeNode;
  CanTreeRefresh:boolean=FALSe;
  TwTree:array[1..10000] of TWTREETYP;
  CntTWTREE:integer;

implementation

uses WaitForm, EditPropTWKTGTREE, Mainform, MoveTree, EditPropTWKTG;

{$R *.DFM}

procedure TDIC_KTG.FormShow(Sender: TObject);
var
   InTree:integer;
   a,b,c:integer;
   cntRepeet:integer;
   r:double;
begin
    tag:=-1;
    if GLOBAL_PROPTWKTG_SELECT=1 then BtnSelect.visible:=False else BtnSelect.visible:=True; 
    // Загружаем справочник категорий
    CanTreeRefresh:=False;
     Wait_Form.StatusBar1.panels[0].text:='Загрузка каталога скидок...';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
     Treeview1.Items.BeginUpdate;
     Treeview1.items.clear;
     KTGRoot:=Treeview1.items.add(NIL,'Категории скидок');
     KTGRoot.stateindex:=0;
     KTGRoot.imageindex:=138;
     KTGRoot.selectedindex:=139;
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select * from proptwktgtree');
     CntTWTREE:=0;
     while not QueryWork.eof do begin
           inc(CntTWTREE);
           TwTree[CntTWTREE].ID:=QueryWork.fieldbyname('PROPTWKTGTREE_ID').asinteger;
           TwTree[CntTWTREE].PAR:=QueryWork.fieldbyname('PARENT_ID').asinteger;
           TwTree[CntTWTREE].NAME:=QueryWork.fieldbyname('PROPTWKTGTREE_NAME').asstring;
           TwTree[CntTWTREE].USE:=false;
           QueryWork.next;
     end;
     // Формируем дерево
     {Не забыть здесь защититься от зацикливания}
     Intree:=0;
     cntRepeet:=0;
     while Intree<CntTWTree do begin
           for a:=1 to CntTWTree do if TwTree[a].USE=false then begin
               inc(CntRepeet);
               if CntRepeet>10000 then begin // Повтор
                  // Перемещаем группу в корень
                  Datamodule1.IBTransaction2.Active:=False;
                  Datamodule1.IBTransaction2.StartTransaction;
                  try
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('PARENT_ID',0);
                     if IBSAVE_DOC('PROPTWKTGTREE',TwTree[a].ID)<0 then r:=sqrt(-1);
                     Datamodule1.IBTransaction2.Commit;
                     Messbox('Раздел каталога "'+TwTree[a].NAME+'" вызывал зацикливание каталога скидок. Перемещен в "корень" списка!',MessSystem,48);
                     TwTree[a].PAR:=0;
                  Except
                     Datamodule1.IBTransaction2.Rollback;
                     Messbox('Раздел каталога "'+TwTree[a].NAME+'" вызывал зацикливание каталога скидок. Произошла ошибка при перемещении в "корень" списка!',MessSystem,16);
                  end;
                  Datamodule1.IBTransaction2.Active:=False;
                  CntRepeet:=0;
               end;
               {Раздел ещё не внесён в каталог
               Проверяем, существует ли родитель, и если существует - вставляем}
               if TwTree[a].PAR=0 then begin
                 {Папка в корне}
                 TREE2:=Treeview1.items.addChild(KTGRoot,TwTree[a].NAME);
                 TREE2.stateindex:=TwTree[a].ID;
                 TREE2.imageindex:=138;
                 TREE2.selectedindex:=139;
                 TwTree[a].USE:=true;
                 TwTree[a].TREE:=TREE2;
                 inc(Intree);
                 cntRepeet:=0;
               end else begin
                 {Папка не в корне}
                 b:=0;
                 c:=1;
                 while (c<=CntTWTREE) and (b=0) do begin
                    if (TwTree[a].PAR=TwTree[c].ID) and (TwTree[c].USE) then begin
                      b:=TwTree[c].ID;
                      TREE3:=TwTree[c].TREE;
                   end;
                   inc(c);
                 end;
                 if b>0 then begin
                    TREE2:=Treeview1.items.addChild(TREE3,TwTree[a].NAME);
                    TREE2.stateindex:=TwTree[a].ID;
                    TREE2.imageindex:=138;
                    TREE2.selectedindex:=139;
                    TwTree[a].USE:=true;
                    TwTree[a].TREE:=TREE2;
                    cntRepeet:=0;
                    inc(Intree);
                 end;
               end;
           end;
     end;
     Treeview1.Selected:=KTGRoot;
     Treeview1.Selected.Expand(True);
     Treeview1.Items.EndUpdate;
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     CanTreeRefresh:=True;
     RefreshTree;
     Wait_Form.Hide;
end;

procedure TDIC_KTG.TreeView1Enter(Sender: TObject);
begin
  BtnNewGroup.enabled:=True;
  BtnSelect.enabled:=False;
  Select:=1;
end;

procedure TDIC_KTG.TreeView1Exit(Sender: TObject);
begin
  BtnNewGroup.enabled:=False;
  Select:=1;
  BtnSelect.enabled:=False;
end;

procedure TDIC_KTG.BtnNewGroupClick(Sender: TObject);
begin
    Application.createForm(TEDIT_PROPTWKTGTREE,EDIT_PROPTWKTGTREE);
    EDIT_PROPTWKTGTREE.tag:=-1;
    EDIT_PROPTWKTGTREE.BtnSave.tag:=Treeview1.selected.stateindex;
    EDIT_PROPTWKTGTREE.ShowModal;
    if EDIT_PROPTWKTGTREE.tag>0 then begin
           CanTreeRefresh:=false;
           inc(CntTWTREE);
           TWTree[CntTWTREE].ID:=EDIT_PROPTWKTGTREE.tag;
           TWTree[CntTWTREE].PAR:=Treeview1.Selected.StateIndex;
           TWTree[CntTWTREE].NAME:=EDIT_PROPTWKTGTREE.Edit1.text;
           TREE2:=Treeview1.items.addChild(Treeview1.Selected,TWTree[CntTWTREE].NAME);
           TREE2.stateindex:=EDIT_PROPTWKTGTREE.tag;
           TREE2.imageindex:=138;
           TREE2.selectedindex:=139;
           TWTree[CntTWTREE].USE:=true;
           TWTree[CntTWTREE].TREE:=TREE2;
           Treeview1.AlphaSort;
           Treeview1.Selected:=TREE2;
           TREE2.Expand(False);
           CanTreeRefresh:=true;
           RefreshTree;
    end;
    EDIT_PROPTWKTGTREE.Destroy;

end;

procedure TDIC_KTG.FormCreate(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-48;
end;

procedure TDIC_KTG.BtnOpenClick(Sender: TObject);
begin
  if Select=1 then begin
    Application.createForm(TEDIT_PROPTWKTGTREE,EDIT_PROPTWKTGTREE);
    EDIT_PROPTWKTGTREE.tag:=Treeview1.Selected.Stateindex;
    EDIT_PROPTWKTGTREE.Edit1.text:=Treeview1.Selected.text;
    EDIT_PROPTWKTGTREE.BtnSave.tag:=Treeview1.Selected.parent.stateindex;
    EDIT_PROPTWKTGTREE.ShowModal;
    if EDIT_PROPTWKTGTREE.tag>0 then begin
      Treeview1.Selected.Text:=EDIT_PROPTWKTGTREE.Edit1.text;
      RefreshTree;
    end;
    EDIT_PROPTWKTGTREE.destroy;
  end else begin
     if not QueryList.eof then
     if QueryList.fieldByname('TREE').asinteger=1 then begin
        Application.createForm(TEDIT_PROPTWKTGTREE,EDIT_PROPTWKTGTREE);
        EDIT_PROPTWKTGTREE.tag:=QueryList.fieldByname('ID').asinteger;
        EDIT_PROPTWKTGTREE.Edit1.text:=QueryList.fieldByname('NAME').asstring;
        EDIT_PROPTWKTGTREE.BtnSave.tag:=Treeview1.Selected.stateindex;
        EDIT_PROPTWKTGTREE.ShowModal;
        if EDIT_PROPTWKTGTREE.tag>0 then begin
          Treeview1.Selected.Text:=EDIT_PROPTWKTGTREE.Edit1.text;
          RefreshTree;
          QueryList.locate('ID',EDIT_PROPTWKTGTREE.tag,[]);
        end;
        EDIT_PROPTWKTGTREE.destroy;
     end else begin
       Application.CreateForm(TEDIT_PROPTWKTG,EDIT_PROPTWKTG);
       EDIT_PROPTWKTG.tag:=QueryList.fieldByname('ID').asinteger;
       EDIT_PROPTWKTG.BtnSave.tag:=Treeview1.Selected.stateindex;
       EDIT_PROPTWKTG.ShowModal;
       if EDIT_PROPTWKTG.tag>0 then begin
          RefreshTree;
          QueryList.locate('ID',EDIT_PROPTWKTG.tag,[]);
       end;
       EDIT_PROPTWKTG.destroy;
     end;
  end;
end;

procedure TDIC_KTG.Refreshtree;
begin
  if CanTreeRefresh then begin
    ListTransaction.Active:=False;
    QueryList.Disablecontrols;
    QueryList.Close;
    QueryList.ParamByname('PARENT_ID').asinteger:=Treeview1.selected.stateindex;
    QueryList.Open;
    QueryList.EnableControls;
  end;
end;

procedure TDIC_KTG.RxDBGrid1Enter(Sender: TObject);
var
  EN:boolean;
begin
   Select:=2;
   if QueryList.eof then EN:=False else
   begin
     if QueryList.fieldByname('TREE').asinteger=1 then EN:=False else EN:=True;
   end;
   BtnSelect.enabled:=EN;
end;

procedure TDIC_KTG.RxDBGrid1Exit(Sender: TObject);
begin
  Select:=2;
end;

procedure TDIC_KTG.BtnMoveClick(Sender: TObject);
var
   TREE1,TREE2,Tree3:TTreeNode;
   a,ID,ID2:integer;
   IDBRAK:integer;
function IsParent(T1,T2:TtreeNode):boolean;
var
   c:boolean;
begin
     result:=false;
     c:=true;
     if T2.stateindex=0 then result:=false {Корень у всех-родитель}
     {Проверяем, не сама ли эта папка}
     else if T1.stateindex=T2.stateindex then result:=true
     else begin
       if T2.parent.stateindex=T1.stateindex then result:=true else
       while (not result) and (c) do begin
             try
               T2:=T2.Parent;
               if T2.StateIndex=T1.StateIndex then result:=true;
            except
               c:=false;
             end;
       end;
     end;
end;
begin
  if BtnMove.enabled then begin
     if (Select=1) and (Treeview1.selected.stateindex=0) then Messbox('Корневую папку переместить нельзя!',MessError,48) else begin
       Application.CreateForm(TMOVE_TREE,MOVE_TREE);
       MOVE_TREE.Treeview1.Items.BeginUpdate;
       MOVE_TREE.Treeview1.Items:=Treeview1.Items;
       MOVE_TREE.Treeview1.Items.EndUpdate;
       MOVE_TREE.Treeview1.Selected:=MOVE_TREE.Treeview1.Items[0];
       MOVE_TREE.Treeview1.Selected.Expand(False);
       if Select=1 then begin
          MOVE_TREE.showmodal;
          if MOVE_TREE.tag>-1 then begin
             {Перед перемещением необходимо проверить, чтобы не произошло зацикливания}
             Tree1:=Treeview1.selected;
             Tree2:=MOVE_TREE.Treeview1.Selected;
             if Tree1.stateindex=0 then Messbox('Корневую папку переместить нельзя!',MessError,48) else begin
                if IsParent(Tree1,Tree2) then Messbox('Выбранное перемещение осуществлено быть не может, т.к. вызовет "зацикливание"',MessError,48) else begin
                   {Осуществляем перемешение}
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                      ID:=IBSAVE_DOC('PROPTWKTGTREE',Tree1.stateindex);
                      Datamodule1.IBTransaction2.Commit;
                      if ID>0 then begin
                         {Осуществляем перемещение в дереве}
                         if Tree2.StateIndex=0 then Tree3:=KTGRoot else
                         for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
                         Treeview1.AlphaSort;
                         Treeview1.Selected.MoveTo(Tree3,NaAddChild);
                      end;
                   except
                         Datamodule1.IBTransaction2.Rollback;
                   end;
                   Datamodule1.IBTransaction2.Active:=False;
                end;
             end;
             RefreshTree;
          end;
       end;
       If Select=2 then
          if not QueryList.Eof then begin
          MOVE_TREE.showmodal;
          if MOVE_TREE.tag>-1 then begin
           if QueryList.fieldbyname('TREE').asstring='1' then begin
             for a:=1 to CntTWTREE do if TWTree[a].ID=QueryList.fieldbyname('ID').asinteger then Tree1:=TWTree[a].TREE;
             Tree2:=MOVE_TREE.Treeview1.Selected;
             if Tree1.stateindex=0 then Messbox('Корневую папку переместить нельзя!',MessError,48) else begin
                if IsParent(Tree1,Tree2) then Messbox('Выбранное перемещение осуществлено быть не может, т.к. вызовет "зацикливание"',MessError,48) else begin
                   {Осуществляем перемешение}
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                      ID:=IBSAVE_DOC('PROPTWKTGTREE',Tree1.stateindex);
                      if ID>0 then begin
                         {Осуществляем перемещение в дереве}
                         if Tree2.StateIndex=0 then Tree3:=KTGRoot else
                         for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
                         Tree1.MoveTo(Tree3,NaAddChild);
                         Treeview1.AlphaSort;
                         Treeview1.Selected:=Tree1;
                         Treeview1.SetFocus;
                      end;
                      Datamodule1.IBTransaction2.Commit;
                   except
                         Datamodule1.IBTransaction2.Rollback;
                   end;
                   Datamodule1.IBTransaction2.Active:=False;
                end;
             end;
             RefreshTree;
           end else begin
             if MOVE_TREE.tag=0 then messbox('Нельзя поместить скидку в корневой каталог. Выберите какой-нибудь раздел!',MessSystem,48)
             else begin
               {Перемещяем Товар}
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('PROPTWKTGTREE_ID',MOVE_TREE.tag);
                      ID:=IBSAVE_DOC('PROPTWKTG',QueryList.fieldByname('ID').asinteger);
                      if ID>0 then begin
                         Datamodule1.IBTransaction2.Commit;
                         Datamodule1.IBTransaction2.Active:=False;
                         {Осуществляем перемещение в дереве}
//                         if Tree2.StateIndex=0 then Tree3:=KTGRoot else
//                         for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
//                         Treeview1.Selected:=Tree3;
                         RefreshTree;
                         QueryList.locate('ID',ID,[]);
                         RxDbGrid1.setFocus;
                      end;
                   except
                         Datamodule1.IBTransaction2.Rollback;
                         Messbox('Ошикбка при перемещении скидки!',MessSystem,48);
                   end;
                   Datamodule1.IBTransaction2.Active:=False;
             end;
           end;
          end;
       end;
       MOVE_TREE.Destroy;
     end;
  end;
end;

procedure TDIC_KTG.BtnDelClick(Sender: TObject);
var
   TREE3,TREE4:TtreeNode;
   ss,NM:ansistring;
   a,ID:integer;
begin
  if BtnDel.enabled then begin
     if Select=1 then begin
        {Удаление из корня Treeview1}
        if Treeview1.selected.stateindex=0 then Messbox('Эту группу удалить нельзя!','Сообщение системы!',48) else
        if Messbox('Удалить группу "'+Treeview1.selected.text+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           if IbDelete_doc('PROPTWKTGTREE',Treeview1.selected.stateindex) then begin
              Datamodule1.IBTransaction2.Commit;
              Datamodule1.IBTransaction2.Active:=False;
              CanTreeRefresh:=false;
              Tree4:=Treeview1.Selected.Parent;
              Treeview1.Items.Delete(Treeview1.selected);
              TREE4.Expand(False);
              Treeview1.selected:=Tree4;
              CanTreeRefresh:=true;
              RefreshTree;
           end else Datamodule1.IBTransaction2.Rollback;
           Datamodule1.IBTransaction2.Active:=False;
        end;
     end;
     if Select=2 then begin
        if not QueryList.Eof then
        if QueryList.fieldbyname('TREE').asstring='1' then begin
           {Удаление группы}
           if Messbox('Удалить подгруппу"'+QueryList.fieldbyname('NAME').asstring+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
              Tree4:=Treeview1.Selected;
              ID:=QueryList.fieldbyname('ID').asinteger;
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              if IbDelete_doc('PROPTWKTGTREE',ID) then begin
                Datamodule1.IBTransaction2.Commit;
                Datamodule1.IBTransaction2.Active:=False;
                CanTreeRefresh:=False;
                {Удаляем удалённую группу
                 Сначала её найдём}
                TREE3:=Treeview1.selected;
                for a:=1 to CntTWTREE do if TWTree[a].ID=ID then Tree3:=TWTree[a].TREE;
                Treeview1.Items.Delete(Tree3);
                Treeview1.selected:=Tree4;
                CanTreeRefresh:=true;
                RefreshTree;
             end else Datamodule1.IBTransaction2.rollback;
             Datamodule1.IBTransaction2.Active:=False;
          end;
        end else begin
            {Удаление контакта}
            if Messbox('Удалить скидку "'+Querylist.fieldbyname('NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              IBSAVE_CLEAR;
              IBSAVE_ADD('US_ID',USERID);
              IBSAVE_ADD('SHOP_ID',SHOPID);
              IBSAVE_ADD('MESS','Был запрос на удаление');
              IBSAVE_ADD('DOP1',3); // Метка удалени
              IBSAVE_ADD('DOP2',Querylist.fieldbyname('ID').asinteger);
              IBSAVE_ADD('DOC','PROPTWKTGTREE'); // Название таблицы
              IBSAVE_DOC('ARCUPDATE',-1);
              if IbDelete_doc('PROPTWKTG',Querylist.fieldbyname('ID').asinteger) then begin
                 Datamodule1.IBTransaction2.Commit;
                 Datamodule1.IBTransaction2.Active:=False;
                 RefreshTree;
                 RxDbGrid1.setFocus;
              end else begin
                 Messbox('Не удалось удалить скидку. С ней связаны один или несколько товаров!',MessSystem,48);
                 Datamodule1.IBTransaction2.Rollback;
              end;
              Datamodule1.IBTransaction2.Active:=False;
        end;
       end;
     end;
  end;
end;

procedure TDIC_KTG.ToolButton1Click(Sender: TObject);
begin
   Application.CreateForm(TEDIT_PROPTWKTG,EDIT_PROPTWKTG);
   EDIT_PROPTWKTG.tag:=-1;
   EDIT_PROPTWKTG.BtnSave.tag:=Treeview1.selected.stateindex;
   EDIT_PROPTWKTG.ShowModal;
   if EDIT_PROPTWKTG.tag>0 then begin
      RefreshTree;
   end;
   EDIT_PROPTWKTG.destroy;
end;

procedure TDIC_KTG.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   RefreshTree;
end;

procedure TDIC_KTG.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   RxDbGrid1.Canvas.Brush.color:=clWindow;
   RxDbGrid1.Canvas.Font.color:=clWindowText;
   if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TREE').Asstring<>'' then begin
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TREE').Asstring='1' then begin
        RxDbGrid1.Canvas.Brush.color:=clBtnFace;
     end;
     if (GdSelected in State ) and (RxDbgrid1.focused) then begin
           RxDbGrid1.Canvas.Brush.color:=clHighlight;
           RxDbGrid1.Canvas.Font.color:=clHighlighttext;
     end;
     if Column.Index>0 then
        RxDbGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
        RxDbGrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TREE').Asstring='0' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('VID').Asinteger=0 then
           DataModule1.ImageList1.Draw(RxDbGrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           141,True)
          else DataModule1.ImageList1.Draw(RxDbGrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           140,True);
        end;
     end;
   end else RxDbGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TDIC_KTG.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDIC_KTG.RxDBGrid1DblClick(Sender: TObject);
var
  Id,a:integer;
begin
   if QueryList.fieldByname('TREE').asinteger=1 then begin
           ID:=QueryList.fieldbyname('ID').asinteger;
           TREE3:=Treeview1.selected;
           for a:=1 to CntTWTREE do if TwTree[a].ID=ID then Tree3:=TwTree[a].TREE;
           Treeview1.selected:=Tree3;
   end else begin
     if GLOBAL_PROPTWKTG_SELECT=2 then begin
        if BtnSelect.enabled then BtnSelect.click;
     end else if BtnOpen.enabled then BtnOpen.click;
   end;
end;

procedure TDIC_KTG.ToolButton8Click(Sender: TObject);
var
   ID:integer;
begin
     If Treeview1.Selected.stateindex=0 then messbox('Текущий уровень является самым верхним!','Внимание!',48) else begin
       ID:=Treeview1.Selected.stateindex;
       Treeview1.Selected:=Treeview1.Selected.Parent;
       QueryList.Locate('ID',ID,[]);
     end;

end;

procedure TDIC_KTG.QueryListAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
   Select:=2;
   if QueryList.eof then EN:=False else
   begin
     if QueryList.fieldByname('TREE').asinteger=1 then EN:=False else EN:=True;
   end;
   BtnSelect.enabled:=EN and (RxDbGrid1.Focused);
end;

procedure TDIC_KTG.BtnSelectClick(Sender: TObject);
begin
   if GLOBAL_PROPTWKTG_SELECT=2 then begin
     Dic_ktg.tag:=QueryList.fieldByname('ID').asinteger;
     close;
   end;
end;

end.
