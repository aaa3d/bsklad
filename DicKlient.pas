unit DicKlient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  ComCtrls, Grids, DBGrids, RXDBCtrl, RXSplit, ExtCtrls, ToolWin, Db,
  IBCustomDataSet, IBDatabase, IBQuery,B_utils,B_DButils, StdCtrls, Menus,
  FR_RRect, FR_Class;

type
  TDic_Klient = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    RxDBGrid1: TRxDBGrid;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    ToolButton4: TToolButton;
    BtnUp: TToolButton;
    ToolButton6: TToolButton;
    BtnCopy: TToolButton;
    BtnNewGroup: TToolButton;
    BtnFind: TToolButton;
    BtnMove: TToolButton;
    ToolButton8: TToolButton;
    BtnHistory: TToolButton;
    BtnPrint: TToolButton;
    IbQrKlntree: TIBQuery;
    IbTrKLNTREE: TIBTransaction;
    IbQrKlntreeKLNTREE_ID: TIntegerField;
    IbQrKlntreeKLNTREE_FULL: TIBStringField;
    IbQrKlntreePARENT_ID: TIntegerField;
    IbQrDicKLN: TIBQuery;
    DsQrDicKLN: TDataSource;
    IbQrDicKLNKLN_ID: TIntegerField;
    IbQrDicKLNKLN_FULL: TIBStringField;
    IbQrDicKLNKLN_TEL: TIBStringField;
    IbQrDicKLNKLN_BNK: TIBStringField;
    IbQrDicKLNTREE: TIBStringField;
    ToolButton14: TToolButton;
    BtnSelect: TToolButton;
    IbQrDicKLNISMAN: TIntegerField;
    KLNTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    BtnDetal: TToolButton;
    PopupMenu1: TPopupMenu;
    MnDetal: TMenuItem;
    MnHistory: TMenuItem;
    MnNew: TMenuItem;
    MnCopy: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    MnInsGroup: TMenuItem;
    MnMove: TMenuItem;
    N8: TMenuItem;
    MnUp: TMenuItem;
    N10: TMenuItem;
    MnFind: TMenuItem;
    N12: TMenuItem;
    MnPrint: TMenuItem;
    N14: TMenuItem;
    MnSelect: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    IbQrDicKLNKLN_TABEL: TIBStringField;
    frReport1: TfrReport;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    frRoundRectObject1: TfrRoundRectObject;
    IbQrDicKLNUS_FIO: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RefreshTree;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BtnUpClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnNewGroupClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure TreeView1Exit(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure TreeView1Enter(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnFindClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IbQrDicKLNAfterOpen(DataSet: TDataSet);
    procedure IbQrDicKLNAfterClose(DataSet: TDataSet);
    procedure BtnDetalClick(Sender: TObject);
    procedure IbQrDicKLNAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure frReport1BeginDoc;
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
    KLNTREETYP=record
       ID:integer;
       PAR:integer;
       NAME:ansistring;
       USE:boolean;
       TREE:TtreeNode;
    end;
var
   CAN_DETAL:boolean;
   DIC_KLIENT: TDIC_KLIENT;
   CanTreeRefresh:boolean=FALSe;
   KlnTree:array[1..10000] of KLNTREETYP;
   ROOT,TREE,TREE2,TREE3:TtreeNode;
   CntKLNTREE:integer;
   Activ:integer=0;
   EnSelect:boolean=False;

implementation

uses Mainform, EditKontakt, EditKlnTree, MoveTree, FindKontakt, DetalKLN;

{$R *.DFM}

procedure TDic_Klient.RefreshTree;
begin
     {Обновляем правый список}
     if CanTreeRefresh then begin
        KLNTransaction.Active:=False;
        IbQrDicKLN.close;
        IbQrDicKLN.Parambyname('KLNTREE_ID').asinteger:=Treeview1.Selected.StateIndex;
        IbQrDicKLN.open;
     end;
end;

procedure TDic_Klient.FormShow(Sender: TObject);
const
     MaxRet=10000; {Максимальное кол-во пустых циклов для определения зацикливания}
var
   InTree:integer;
   a,b,c:integer;
   ID,IDTREE:integer;
   Ret:integer;
begin
     CAN_DETAL:=Check_dostup('$DICKLN.DETAL_KLN');
     Application.createForm(TFIND_Kontakt,Find_Kontakt);
     CanTreeRefresh:=false;
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
     {Загружаем каталог}
     IbTrKLNTree.Active:=False;
     IbQrKLNTree.Close;
     IbQrKLNTree.Open;
     CntKLNTREE:=0;
     while not IbQrKLNTree.eof do begin
           inc(CntKLNTREE);
           KLNTree[CntKLNTREE].ID:=IbQrKLNTree.fieldbyname('KLNTREE_ID').asinteger;
           KLNTree[CntKLNTREE].PAR:=IbQrKLNTree.fieldbyname('PARENT_ID').asinteger;
           KLNTree[CntKLNTREE].NAME:=IbQrKLNTree.fieldbyname('KLNTREE_FULL').asstring;
           KLNTree[CntKLNTREE].USE:=false;
           IbQrKLNTree.next;
     end;
     {Наполняем каталог}
     Treeview1.items.BeginUpdate;
     Treeview1.items.clear;
     ROOT:=Treeview1.items.add(NIL,'Контакты');
     ROOT.stateindex:=0;
     ROOT.imageindex:=26;
     ROOT.selectedindex:=26;
     {Не забыть здесь защититься от зацикливания}
     Intree:=0;
     RET:=0;
     while Intree<CntKLNTree do begin
           for a:=1 to CntKLNTree do if KLNTree[a].USE=false then begin
               if RET>MaxRet then begin
                  {Зацикливание}
                  Datamodule1.IBTransaction2.Active:=False;
                  Datamodule1.IBTransaction2.StartTransaction;
                  Ibsave_Clear;
                  IbSave_ADD('PARENT_ID',0);
                  Try
                   IBSAVE_DOC('KLNTREE',KLNTree[a].ID);
                   Datamodule1.IBTransaction2.Commit;
                   Messbox('Группа контактов "'+KLNTree[a].NAME+'" перемещена в корень дерева для предотвращения зацикливания!',MessSystem,48);
                  Except
                   Datamodule1.IBTransaction2.RollBack;
                  ENd;
                  Datamodule1.IBTransaction2.Active:=False;
                  Ret:=0;
                  KLNTree[a].PAR:=0;
                end;
               {Раздел ещё не внесён в каталог
                Проверяем, существует ли родитель, и если существует - вставляем}
               if KLNTree[a].PAR=0 then begin
                 {Папка в корне}
                 RET:=0;
                 TREE2:=Treeview1.items.addChild(ROOT,KLNTree[a].NAME);
                 TREE2.stateindex:=KLNTree[a].ID;
                 TREE2.imageindex:=27;
                 TREE2.selectedindex:=28;
                 KLNTree[a].USE:=true;
                 KLNTree[a].TREE:=TREE2;
                 inc(Intree);
               end else begin
                 {Папка не в корне}
                 b:=0;
                 for c:=1 to CntKLNTree do
                 if (KLNTree[a].PAR=KLNTree[c].ID) and (KLNTree[c].USE) then begin
                    b:=KLNTree[c].ID;
                    TREE3:=KLNTree[c].TREE;
                 end;
                 if b>0 then begin
                    RET:=0;
                    TREE2:=Treeview1.items.addChild(TREE3,KLNTree[a].NAME);
                    TREE2.stateindex:=KLNTree[a].ID;
                    TREE2.imageindex:=27;
                    TREE2.selectedindex:=28;
                    KLNTree[a].USE:=true;
                    KLNTree[a].TREE:=TREE2;
                    inc(Intree);
                 end;
               end;
           end;
           inc(Ret);
     end;
     Treeview1.AlphaSort;
     Treeview1.items.EndUpdate;
     if tag>=0 then begin
        ID:=tag;
        {Пытаемся найти клиента и спозиционироваться на него}
        IbQuery1.Close;
        IbQuery1.SQL.Clear;
        IbQuery1.SQL.add('select KLNTREE_ID FROM KLN WHERE KLN_ID=:KLN_ID');
        IbQuery1.ParamByname('KLN_ID').asinteger:=tag;
        IbQuery1.Open;
        if IbQuery1.eof then begin
           ROOT.Expand(False);
           Treeview1.Selected:=ROOT;
        end else begin
             IDTREE:=IbQuery1.fieldbyname('KLNTREE_ID').asinteger;
             {Позиционируемся на дерево}
             Tree3:=Root;
             for a:=1 to CntKLNTREE do if KLNTree[a].ID=IDTREE then Tree3:=KLNTree[a].TREE;
             CanTreeRefresh:=True;
             Treeview1.Selected:=Tree3;
             RefreshTree;
             IbQrDicKLN.locate('KLN_ID',ID,[]);
             RxDbGrid1.setFocus;
        end;
        IbQuery1.Close;
     end else begin
         ROOT.Expand(False);
         Treeview1.Selected:=ROOT;
     end;



     if DicKlnSet=2 then BtnSelect.visible:=True
                    else BtnSelect.visible:=False;
     if DicKlnSet=3 then BtnSelect.visible:=True
     else if DicKlnSet=4 then BtnSelect.visible:=True
     else if DicKlnSet=5 then BtnSelect.visible:=True;

     CanTreeRefresh:=true;
     RefreshTree;
end;

procedure TDic_Klient.BtnNewClick(Sender: TObject);
begin
   if Dic_Klient.Treeview1.selected.stateindex in [0,3] then
   Messbox('Вы не можете создать контакт в корневом каталоге или в группе удаленные. Пожалуйства выберите какой-нибудь раздел каталога!',MessSystem,48)
   else begin
     Application.CreateForm(TEdit_Kontakt,Edit_Kontakt);
     Edit_kontakt.Tag:=-1;
     Edit_kontakt.showmodal;
     if Edit_kontakt.tag>0 then begin
        {Создан новый контакт}
        RefreshTree;
        RxDbgrid1.setfocus;
        IbQrDicKln.Locate('KLN_ID',Edit_kontakt.tag,[]);

     end;
     Edit_kontakt.Destroy;
   end;
end;

procedure TDic_Klient.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
     RefreshTree;
     if (DicKlnSet=3) or (DicKlnSet=5) then
       BtnSelect.enabled:=True;

end;

procedure TDic_Klient.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName
     ('TREE').Asstring='1' then begin
        if (Field.Fieldname='KLN_FULL') then begin
           Afont.color:=clBlack;
           Background:=clBtnFace;
           if HighLight then begin
              Afont.color:=clHighlighttext;
              Background:=clHighlight;
           end;
        end else begin
           Afont.color:=clBtnFace;
           Background:=clBtnFace;
           if HighLight then begin
              Afont.color:=clHighlight;
              Background:=clHighlight;
           end;
        end;
     end else begin
        Afont.color:=clWindowText;
        Background:=clWindow;
        if HighLight then begin
           Afont.color:=clHighlighttext;
           Background:=clHighlight;
        end;
     end;}
end;

procedure TDic_Klient.BtnUpClick(Sender: TObject);
var
   ID:integer;
begin
     If Treeview1.Selected.stateindex=0 then messbox('Текущий уровень является самым верхним!','Внимание!',48) else begin
       ID:=Treeview1.Selected.stateindex;
       Treeview1.Selected:=Treeview1.Selected.Parent;
       IbQrDicKln.Locate('KLN_ID',ID,[]);
     end;
end;

procedure TDic_Klient.RxDBGrid1DblClick(Sender: TObject);
var
   a:integer;
   ID:integer;
begin
     if not IbQrDicKLN.Eof then begin
        if IbQrDicKLN.fieldbyname('TREE').asinteger=1 then begin
           {Определяем TREE}
           ID:=IbQrDicKLN.fieldbyname('KLN_ID').asinteger;
           TREE3:=Treeview1.selected;
           for a:=1 to CntKLNTREE do if KLNTree[a].ID=ID then Tree3:=KLNTree[a].TREE;
           Treeview1.selected:=Tree3;
        end else begin
            if BtnSelect.visible then begin
               if BtnSelect.Enabled then BtnSelect.click;
            end  else if BtnOpen.Enabled then BtnOpen.click;
        end;
     end;
end;

procedure TDic_Klient.BtnNewGroupClick(Sender: TObject);
begin
     application.createForm(TEdit_KlnTree,Edit_KlnTree);
     Edit_KlnTree.Label3.Caption:=Treeview1.selected.text;
     Edit_KlnTree.tag:=-1;
     Edit_KlnTree.showmodal;
     if Edit_KlnTree.tag>0 then begin
           CanTreeRefresh:=false;
           inc(CntKLNTREE);
           KLNTree[CntKLNTREE].ID:=Edit_KlnTree.tag;
           KLNTree[CntKLNTREE].PAR:=Treeview1.Selected.StateIndex;
           KLNTree[CntKLNTREE].NAME:=Edit_KlnTree.Edit1.text;
           TREE2:=Treeview1.items.addChild(Treeview1.Selected,KLNTree[CntKLNTREE].NAME);
           TREE2.stateindex:=Edit_KlnTree.tag;
           TREE2.imageindex:=27;
           TREE2.selectedindex:=28;
           KLNTree[CntKLNTREE].USE:=true;
           KLNTree[CntKLNTREE].TREE:=TREE2;
           Treeview1.AlphaSort;
           Treeview1.Selected:=TREE2;
           TREE2.Expand(False);
           CanTreeRefresh:=true;
           RefreshTree;
     end;
     Edit_KlnTree.destroy;
end;

procedure TDic_Klient.BtnDelClick(Sender: TObject);
var
   TREE3,TREE4:TtreeNode;
   NM:ansistring;
   a,ID:integer;
   EN:boolean;
begin
  if BtnDel.enabled then begin
     if Activ=1 then begin
        {Удаление из корня Treeview1}
        if Treeview1.selected.stateindex in [0,3] then Messbox('Эту группу удалить нельзя!','Сообщение системы!',48) else
        if Messbox('Удалить подгруппу Контактов "'+Treeview1.selected.text+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           if IbDelete_doc('KLNTREE',Treeview1.selected.stateindex) then begin
              Datamodule1.IBTransaction2.Commit;
              Datamodule1.IBTransaction2.Active:=False;
              CanTreeRefresh:=false;
              Tree4:=Treeview1.Selected.Parent;
              Treeview1.Items.Delete(Treeview1.selected);
              TREE4.Expand(False);
              Treeview1.selected:=Tree4;
              CanTreeRefresh:=true;
              RefreshTree;
           end else begin
              Datamodule1.IBTransaction2.Rollback;
              Datamodule1.IBTransaction2.Active:=False;
           end;
        end;
     end;
     if Activ=2 then begin
        if not IbQrDicKln.Eof then
        if IbQrDicKln.fieldbyname('TREE').asinteger=1 then begin
           {Удаление группы}
           if IbQrDicKln.fieldbyname('KLN_ID').asinteger=3 then Messbox('Эту группу удалить нельзя!',MessSystem,48) else
           if Messbox('Удалить подгруппу Контактов "'+IbQrDicKln.fieldbyname('KLN_FULL').asstring+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
              Tree4:=Treeview1.Selected;
              ID:=IbQrDicKln.fieldbyname('KLN_ID').asinteger;
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              if IbDelete_doc('KLNTREE',ID) then begin
                Datamodule1.IBTransaction2.Commit;
                Datamodule1.IBTransaction2.Active:=False;
                CanTreeRefresh:=False;
                {Удаляем удалённую группу
                 Сначала её найдём}
                TREE3:=Treeview1.selected;
                for a:=1 to CntKLNTREE do if KLNTree[a].ID=ID then Tree3:=KLNTree[a].TREE;
                Treeview1.Items.Delete(Tree3);
                Treeview1.selected:=Tree4;
                CanTreeRefresh:=true;
                RefreshTree;
              end else begin
                Datamodule1.IBTransaction2.Rollback;
                Datamodule1.IBTransaction2.Active:=False;
              end;
          end;
        end else begin
            {Удаление контакта}
            // Проверяем возможность удалени
            if Treeview1.selected.stateindex=3 then begin
                WorkTransaction.Active:=False;
                ADD_SQL(QueryWork,'select TM from kln where kln_id=:kln_id');
                QueryWork.ParamByName('KLN_ID').asinteger:=IbQrDicKln.fieldbyname('KLN_ID').asinteger;
                QueryWork.Open;
                EN:=False;
                if QueryWork.fieldbyname('TM').asdatetime+1<MYNOW() then EN:=true else
                Messbox('Указанный контакт можно удалить после '+datetimetostr(QueryWork.fieldbyname('TM').asdatetime+1),MessSystem,48)
            end else EN:=true;
            if EN then begin
              if Messbox('Удалить Контакт "'+IbQrDicKln.fieldbyname('KLN_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
                Datamodule1.IBTransaction2.Active:=False;
                Datamodule1.IBTransaction2.StartTransaction;
                IBSAVE_CLEAR;
                IBSAVE_ADD('US_ID',USERID);
                IBSAVE_ADD('SHOP_ID',SHOPID);
                IBSAVE_ADD('MESS','Был запрос на удаление');
                IBSAVE_ADD('DOP1',3); // Метка удалени
                IBSAVE_ADD('DOP2',IbQrDicKln.fieldbyname('KLN_ID').asinteger);
                IBSAVE_ADD('DOC','KLN'); // Название таблицы
                IBSAVE_DOC('ARCUPDATE',-1);
                Datamodule1.IBTransaction2.Commit;
                Datamodule1.IBTransaction2.Active:=False;
                Datamodule1.IBTransaction2.StartTransaction;
                if IbDelete_doc('KLN',IbQrDicKln.fieldbyname('KLN_ID').asinteger) then begin
                   Datamodule1.IBTransaction2.Commit;
                   Datamodule1.IBTransaction2.Active:=False;
                   RefreshTree;
                   RxDbGrid1.setFocus;
                end else begin
                   Datamodule1.IBTransaction2.Rollback;
                   Datamodule1.IBTransaction2.Active:=False;
                end;
              end;
            end else messbox('Контакт "'+IbQrDicKln.fieldbyname('KLN_FULL').asstring+'" удалить нельзя!',MessSystem,48);
        end;
     end;
  end;
end;

procedure TDic_Klient.TreeView1Exit(Sender: TObject);
begin
     BtnDel.enabled:=CHECK_DOSTUP('$DICKLN.CAN_DELETE');
     Activ:=1;
end;

procedure TDic_Klient.RxDBGrid1Exit(Sender: TObject);
begin
     Activ:=2;
end;

procedure TDic_Klient.RxDBGrid1Enter(Sender: TObject);
begin
     BtnDel.enabled:=CHECK_DOSTUP('$DICKLN.CAN_DELETE');
     Activ:=2;
     if IbQrDicKLN.fieldByname('TREE').asstring='1' then
        EnSelect:=false else EnSelect:=True;
     BtnSelect.Enabled:=EnSelect;
     if (IbQrDicKLN.fieldbyname('TREE').asstring<>'1')
     and (IbQrDicKLN.fieldbyname('KLN_ID').asstring<>'') then BtnCopy.enabled:=True
     else BtnCopy.enabled:=False;
end;

procedure TDic_Klient.TreeView1Enter(Sender: TObject);
begin
     if (DicKlnSet=3)  or (DicKlnSet=5) then
       BtnSelect.enabled:=True
     else
       BtnSelect.enabled:=False;
     BtnCopy.enabled:=False;
     Activ:=1;
     BtnDel.enabled:=CHECK_DOSTUP('$DICKLN.CAN_DELETE');
end;

procedure TDic_Klient.BtnOpenClick(Sender: TObject);
var
   a,ID:integer;
begin
     if Activ=1 then begin
        if Treeview1.selected.stateindex in [0,3] then Messbox('Эту группу изменить нельзя!',MessSystem,48) else begin
          {Правка Дерева}
          application.createForm(TEdit_KlnTree,Edit_KlnTree);
          Edit_KlnTree.Label3.Caption:=Treeview1.selected.text;
          Edit_KlnTree.tag:=Treeview1.Selected.stateindex;
          Edit_KlnTree.showmodal;
          if Edit_KlnTree.tag>0 then begin
             Treeview1.Selected.Text:=Edit_KlnTree.Edit1.text;
             RefreshTree;
          end;
          Edit_KlnTree.destroy;
        end;
     end;
     if Activ=2 then begin
        {Правка из списка}
        if not IbQrDicKln.Eof then
        if IbQrDicKln.fieldbyname('TREE').asinteger=1 then begin
           {Правка Дерева}
           if ibQrDicKln.fieldbyname('KLN_ID').asinteger=3 then Messbox('Эту группу изменить нельзя!',MessSystem,48) else begin
             application.createForm(TEdit_KlnTree,Edit_KlnTree);
             Edit_KlnTree.Label3.Caption:=Treeview1.selected.text;
             ID:=IbQrDicKLN.fieldbyname('KLN_ID').asinteger;
             Edit_KlnTree.tag:=ID;
             Edit_KlnTree.showmodal;
             if Edit_KlnTree.tag>0 then begin
                {Необходимо изменить название в дереве}
                TREE3:=Treeview1.selected;
                for a:=1 to CntKLNTREE do if KLNTree[a].ID=ID then Tree3:=KLNTree[a].TREE;
                TREE3.Text:=Edit_KlnTree.Edit1.text;
             end;
             Edit_KlnTree.destroy;
             RefreshTree;
             IbQrDicKln.Locate('KLN_ID',ID,[]);
             RxDbGrid1.setfocus;
           end;
        end else begin
           {Редактирование контакта}
           Application.CreateForm(TEdit_Kontakt,Edit_Kontakt);
           ID:=IbQrDicKLN.fieldbyname('KLN_ID').asinteger;
           Edit_kontakt.Tag:=ID;
           Edit_kontakt.showmodal;
           RefreshTree;
           IbQrDicKln.Locate('KLN_ID',ID,[]);
           Edit_kontakt.Destroy;
        end;
     end;
end;

procedure TDic_Klient.BtnMoveClick(Sender: TObject);
var
   TREE1,TREE2,Tree3:TTreeNode;
   a,ID,ID2:integer;

function IsParent(T1,T2:TtreeNode):boolean;
var
   c:boolean;
begin
     result:=false;
     c:=true;
     if T2.stateindex=0 then result:=false {Корень у всех-родитель}
     {Проверяем, не сама ли эта папка}
     else if T1.stateindex=T2.stateindex then result:=false
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
     if (Activ=1) and (Treeview1.selected.stateindex in [0,3]) then Messbox('Эту папку переместить нельзя!',MessError,48) else begin
       Application.CreateForm(TMOVE_TREE,MOVE_TREE);
       MOVE_TREE.Treeview1.Items.BeginUpdate;
       MOVE_TREE.Treeview1.Items.Clear;
       MOVE_TREE.Treeview1.Items:=Treeview1.Items;
       MOVE_TREE.Treeview1.Items.EndUpdate;
       MOVE_TREE.Treeview1.Selected:=MOVE_TREE.Treeview1.Items[0];
       MOVE_TREE.Treeview1.Selected.Expand(False);
       if Activ=1 then begin
          MOVE_TREE.showmodal;
          if MOVE_TREE.tag>-1 then begin
             {Перед перемещением необходимо проверить, чтобы не произошло зацикливания}
             Tree1:=Treeview1.selected;
             Tree2:=MOVE_TREE.Treeview1.Selected;
             if Tree1.stateindex in [0,3] then Messbox('Эту папку переместить нельзя!',MessError,48) else begin
                if IsParent(Tree1,Tree2) then Messbox('Выбранное перемещение осуществлено быть не может, т.к. вызовет "зацикливание"',MessError,48) else begin
                   {Осуществляем перемешение}
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                      ID:=IBSAVE_DOC('KLNTREE',Tree1.stateindex);
                      Datamodule1.IBTransaction2.Commit;
                      if ID>0 then begin
                         {Осуществляем перемещение в дереве}
                         if Tree2.StateIndex=0 then Tree3:=Root else
                         for a:=1 to CntKLNTREE do if KLNTree[a].ID=Tree2.StateIndex then Tree3:=KLNTree[a].TREE;
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
       If Activ=2 then
          if not IbQrDicKln.Eof then begin
          MOVE_TREE.showmodal;
          if MOVE_TREE.tag>-1 then begin
           if IbQrDicKln.fieldbyname('TREE').asinteger=1 then begin
             for a:=1 to CntKLNTREE do if KLNTree[a].ID=IbQrDicKln.fieldbyname('KLN_ID').asinteger then Tree1:=KLNTree[a].TREE;
             Tree2:=MOVE_TREE.Treeview1.Selected;
             if Tree1.stateindex in [0,3] then Messbox('Эту папку переместить нельзя!',MessError,48) else begin
                if IsParent(Tree1,Tree2) then Messbox('Выбранное перемещение осуществлено быть не может, т.к. вызовет "зацикливание"',MessError,48) else begin
                   {Осуществляем перемешение}
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                      ID:=IBSAVE_DOC('KLNTREE',Tree1.stateindex);
                      Datamodule1.IBTransaction2.Commit;
                      if ID>0 then begin
                         {Осуществляем перемещение в дереве}
                         if Tree2.StateIndex=0 then Tree3:=Root else
                         for a:=1 to CntKLNTREE do if KLNTree[a].ID=Tree2.StateIndex then Tree3:=KLNTree[a].TREE;
                         Tree1.MoveTo(Tree3,NaAddChild);
                         Treeview1.AlphaSort;
                         Treeview1.Selected:=Tree1;
                         Treeview1.SetFocus;
                      end;
                   except
                         Datamodule1.IBTransaction2.Rollback;
                   end;
                   Datamodule1.IBTransaction2.Active:=False;
                end;
             end;
             RefreshTree;
           end else begin
             if MOVE_TREE.tag in [0,3] then messbox('Нельзя поместить контакт в корневой каталог или каталог для удаления. Выберите какой-нибудь раздел!',MessSystem,48)
             else begin
               {Перемещяем контакт}
                   Tree2:=MOVE_TREE.Treeview1.Selected;
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   try
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('KLNTREE_ID',Tree2.stateindex);
                      ID:=IBSAVE_DOC('KLN',IbQrDicKln.fieldbyname('KLN_ID').asinteger);
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('US_ID',USERID);
                      IBSAVE_ADD('SHOP_ID',SHOPID);
                      IBSAVE_ADD('MESS','Перемещен в группу "'+Tree2.text+'"');
                      IBSAVE_ADD('DOP1',2); // Метка изменени
                      IBSAVE_ADD('DOP2',IbQrDicKln.fieldbyname('KLN_ID').asinteger);
                      IBSAVE_ADD('DOC','KLN'); // Название таблицы
                      IBSAVE_DOC('ARCUPDATE',-1);
                      Datamodule1.IBTransaction2.Commit;
                      if ID>0 then begin
                         {Осуществляем перемещение в дереве}
                         if Tree2.StateIndex=0 then Tree3:=Root else
                         for a:=1 to CntKLNTREE do if KLNTree[a].ID=Tree2.StateIndex then Tree3:=KLNTree[a].TREE;
                         Treeview1.Selected:=Tree3;
                         RefreshTree;
                         IbQrDicKln.locate('KLN_ID',ID,[]);
                         RxDbGrid1.setFocus;
                      end;
                   except
                         Datamodule1.IBTransaction2.Rollback;
                   end;
                   Datamodule1.IBTransaction2.Active:=False;
               end;
           end;
          end;
       end;
       MOVE_TREE.Destroy;
   end;
end;

procedure TDic_Klient.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDic_Klient.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  Var
    IsMan:integer;
    Pic:INteger;
begin
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName
     ('TREE').Asstring='1' then begin
        if (Column.Field.FullName='KLN_FULL') then begin
           RxDbgrid1.Canvas.Font.color:=clBlack;
           RxDbgrid1.Canvas.Brush.Color:=clBtnFace;
           if (GdSelected in State ) then begin
              RxDbgrid1.Canvas.Font.color:=clHighlighttext;
              RxDbgrid1.Canvas.Brush.Color:=clHighlight;
           end;
        end else begin
           RxDbgrid1.Canvas.Font.color:=clBtnFace;
           RxDbgrid1.Canvas.Brush.Color:=clBtnFace;
           if (GdSelected in State ) then begin
              RxDbgrid1.Canvas.Font.color:=clHighlight;
              RxDbgrid1.Canvas.Brush.Color:=clHighlight;
           end;
        end
     end else begin
        RxDbgrid1.Canvas.Font.color:=clWindowText;
        RxDbgrid1.Canvas.Brush.color:=clWindow;
        if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
        end;
     end;








  if Column.Index>0 then
  RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
  else begin
      Isman:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('IsMan').Asinteger;
      if Isman>0 then begin
         RxDbgrid1.Canvas.FillRect(Rect);
         Case Isman of
           1: Pic:=30; {ЧП}
           2: Pic:=14; {Организация}
           3: Pic:=27;
           4: Pic:=31; {ЧП c закрытым входом}
         end;
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         Pic,True);
      end else RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
  end;

end;

procedure TDic_Klient.BtnFindClick(Sender: TObject);
var
   ART,ID,IDTREE:integer;
   a,b:integer;
begin
     Find_Kontakt.showmodal;
     if Find_Kontakt.tag>0 then begin
        {Начинаем искать}
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_ID,KLNTREE_ID FROM KLN WHERE KLN_ID=:KLN_ID');
        IbQuery1.ParamByname('KLN_ID').asinteger:=Find_Kontakt.tag;
        IbQuery1.Open;
        if IbQuery1.eof then Messbox('В базе контакт не обнаружен!',MessSystem,48)
        else begin
             ID:=IbQuery1.fieldbyname('KLN_ID').asinteger;
             IDTREE:=IbQuery1.fieldbyname('KLNTREE_ID').asinteger;
             {Позиционируемся на дерево}
             CanTreeRefresh:=False;
             Tree3:=Root;
             for a:=1 to CntKLNTREE do if KLNTree[a].ID=IDTREE then Tree3:=KLNTree[a].TREE;
             Treeview1.Selected:=Tree3;
             CanTreeRefresh:=True;
             RefreshTree;
             IbQrDicKLN.locate('KLN_ID',ID,[]);
             RxDbGrid1.setFocus;
        end;
        IbQuery1.Close;
     end;
end;

procedure TDic_Klient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Find_Kontakt.destroy;
end;

procedure TDic_Klient.FormKeyPress(Sender: TObject; var Key: Char);
var
   s:ansistring;
   Key2:Char;
begin
     if (key=#8) and (btnUp.enabled) then begin
        key:=#0;
        BtnUp.click;
     end;
     s:=AnsiUpperCase(Key);
     Key2:=s[1];
     if ((key2>='А') and (key2<='Я')) or ((key2>='A') and (key2<='Z')) then begin
        FIND_Kontakt.Edit1.text:=Key;
        BtnFind.click;
        Key:=#0;
     end;
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDic_Klient.IbQrDicKLNAfterOpen(DataSet: TDataSet);
begin
     if not IbQrDicKLN.eof then begin
        BtnDel.enabled:=CHECK_DOSTUP('$DICKLN.CAN_DELETE');
        if IbQrDicKLN.fieldByname('TREE').asstring='1' then begin
          BtnDetal.enabled:=false;
          EnSelect:=false;
        end else begin
           BtnDetal.enabled:=True and CAN_DETAL;
           EnSelect:=True;
        end;
     end else begin
         BtnDel.enabled:=False;
     end;
     if Activ=1 then BtnSelect.enabled:=False
     else BtnSelect.enabled:=EnSelect;
     if (IbQrDicKLN.fieldbyname('TREE').asstring<>'1')
     and (IbQrDicKLN.fieldbyname('KLN_ID').asstring<>'')
     and (Activ=2) then BtnCopy.enabled:=True
     else BtnCopy.enabled:=False;
end;

procedure TDic_Klient.IbQrDicKLNAfterClose(DataSet: TDataSet);
begin
     EnSelect:=False;
     BtnDetal.Enabled:=False;
end;

procedure TDic_Klient.BtnDetalClick(Sender: TObject);
begin
     application.createForm(TDetal_kln,detal_Kln);
     Detal_kln.KLN_NAME3.text:=IbQrDicKLN.fieldbyname('KLN_FULL').asstring;
     Detal_kln.tag:=IbQrDicKLN.fieldbyname('KLN_ID').asinteger;
     detal_Kln.showModal;
     detal_Kln.Destroy;
end;

procedure TDic_Klient.IbQrDicKLNAfterScroll(DataSet: TDataSet);
begin
     if IbQrDicKLN.fieldByname('TREE').asstring='1' then begin
          BtnDetal.enabled:=false;
          EnSelect:=false;
     end else begin
        BtnDetal.enabled:=True and CAN_DETAL;
        EnSelect:=True;
     end;
     if Activ=1 then BtnSelect.enabled:=False
     else BtnSelect.enabled:=EnSelect;
     if DicKlnSet=5 then
       BtnSelect.enabled:=true;
     if (IbQrDicKLN.fieldbyname('TREE').asstring<>'1')
     and (IbQrDicKLN.fieldbyname('KLN_ID').asstring<>'')
     and (Activ=2) then BtnCopy.enabled:=True
     else BtnCopy.enabled:=False;
end;

procedure TDic_Klient.FormActivate(Sender: TObject);
begin
     if tag>=0 then begin
             IbQrDicKLN.locate('KLN_ID',tag,[]);
             RxDbGrid1.setFocus;
     end;
end;

procedure TDic_Klient.BtnSelectClick(Sender: TObject);
begin
     if DicKlnSet=4 then
     begin  //Выбор нескольких клиентов
          inc(CNT_KLN);
          ARR_KLN[CNT_KLN].ID:=IbQrDicKln.fieldByname('KLN_ID').asinteger;
          DIC_Klient.caption:='Справочник товаров. Набор списка товаров. Отобрано '+
          inttostr(CNT_KLN)+
          OKON_CHAR(' наименование клиента',' наименования клиентов',' наименований Клиентов',CNT_KLN);

     end
     else if DicKlnSet=3 then
     begin
                        //Выбор группы
        if Activ=1 then
        begin
           tag:=Treeview1.selected.stateindex;
           close;
        end
        else
        begin
          if IbQrDicKln.FieldByName('TREE').asstring='1' then
          begin
             tag:=IbQrDicKln.fieldbyname('KLN_ID').asinteger;
             close;
          end
          else
            ShowMessage('Это не группа!');
        end;
     end
     else if DicKlnSet=5 then
     begin
        if Activ=1 then   //из дерева
        begin
           tag:=Treeview1.selected.stateindex;
           close;
        end
        else              //из списка текущего элемента дерева
        begin
          if IbQrDicKln.FieldByName('TREE').asstring='1' then
          begin
             tag:=IbQrDicKln.fieldbyname('KLN_ID').asinteger;
             close;
          end
          else
          begin
             tag:=IbQrDicKln.fieldbyname('KLN_ID').asinteger;
             close;
          end;
        end;
     end
     else
     begin
       tag:=IbQrDicKLN.fieldByname('KLN_ID').asinteger;
       close;
     end;
end;

procedure TDic_Klient.BtnCopyClick(Sender: TObject);
var
   NEW_ID:integer;
begin
     if Messbox('Создать копию контакта "'+IbQrDicKLN.fieldByname('KLN_FULL').asstring+'" ?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_KLN( :KLN_ID )');
           DataModule1.IbSaveSQL.ParamByname('KLN_ID').asinteger:=IbQrDicKLN.fieldByname('KLN_ID').asinteger;
           try
              DataModule1.IbSaveSQL.open;
              NEW_ID:=DataModule1.IbSaveSQL.fieldByname('NEW_KLN_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              RefreshTree;
              IbQrDicKLN.locate('KLN_ID',NEW_ID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
     end;
end;

procedure TDic_Klient.BtnHistoryClick(Sender: TObject);
begin
     SHOW_HISTORY_DOC('Карточка клиента '+IbQrDicKLN.fieldByname('KLN_FULL').asstring,'KLN',IbQrDicKLN.fieldByname('KLN_ID').asinteger);
end;

procedure TDic_Klient.BtnPrintClick(Sender: TObject);
begin
     if Activ=2 then begin
      if IbQrDicKLN.fieldbyname('KLN_ID').asstring<>'' then
      PRINT_DETALKLN(IbQrDicKLN.fieldbyname('KLN_ID').asinteger);
     end;
end;

procedure TDic_Klient.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (DicKlnSet=2) and (BtnSelect.enabled) then begin
       {Режим выбора клиентов}
        key:=#0;
        BtnSelect.click;
     end;
     if (key=#13) and (DicKlnSet=1) and (BtnOpen.enabled)then begin
       {Режим просмотра справочника}
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDic_Klient.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDic_Klient.frReport1BeginDoc;
var barcode: String;
begin


barcode := IbQrDicKLN.FieldByName('KLN_ID').asString;
barcode := '24'+right('0000000000'+barcode, 10);
//IbQrDicKLN.FieldByName('KLN_ID').
frReport1.Dictionary.Variables['USER_ID']:=barcode;
frReport1.Dictionary.Variables['USER_FIO']:=''''+IbQrDicKLN.FieldByName('US_FIO').asString+'''';
end;

procedure TDic_Klient.ToolButton3Click(Sender: TObject);
begin
frReport1.PrepareReport;
frReport1.ShowPreparedReport;
end;

end.

