unit DicEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, RXSplit, ComCtrls, ImgList, ExtCtrls, ToolWin,
  StdCtrls, Db, RxMemDS,Data1,B_utils,B_DButils, IBDatabase,
  IBCustomDataSet, IBQuery, Menus, DBCtrls,SetData, Mask, ToolEdit,
  RxLookup;

type
  TDic_Email = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    ImageList1: TImageList;
    BtnNew: TToolButton;
    ToolButton2: TToolButton;
    TreeView1: TTreeView;
    Panel2: TPanel;
    RxSplitter1: TRxSplitter;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    RxSplitter2: TRxSplitter;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    RxDBGrid3: TRxDBGrid;
    MailTransaction: TIBTransaction;
    QueryMail: TIBQuery;
    QueryMailMAIL_ID: TIntegerField;
    QueryMailCREATE_DATE: TDateTimeField;
    QueryMailUS_ID: TIntegerField;
    QueryMailUS_FULL: TIBStringField;
    QueryMailTO_ID: TIntegerField;
    QueryMailTO_TXT: TIBStringField;
    QueryMailMAIL_TEM: TIBStringField;
    QueryMailMAILVID_ID: TIntegerField;
    QueryMailMAILVID_NAM: TIBStringField;
    DsMail: TDataSource;
    BtnMerge: TToolButton;
    PopupMenu1: TPopupMenu;
    MnMerge: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MnReply: TMenuItem;
    N5: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    ToolButton1: TToolButton;
    BtnPrint: TToolButton;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    QueryMailMAIL_NUM: TIntegerField;
    Timer1: TTimer;
    TimerTransaction: TIBTransaction;
    QueryTimer1: TIBQuery;
    QueryTimer2: TIBQuery;
    QueryTimer3: TIBQuery;
    DsTimer1: TDataSource;
    DsTimer2: TDataSource;
    DsTImer3: TDataSource;
    QueryTimer2MAIL_REPLY: TIBStringField;
    QueryTimer2MAIL_CONF: TIBStringField;
    QueryTimer2MAIL_TXT: TIBStringField;
    QueryTimer1SHOP_NAME: TIBStringField;
    QueryTimer1MAILDOST_DATE: TDateTimeField;
    QueryTimer3SHOP_NAME: TIBStringField;
    QueryTimer3MAILREAD_DATE: TDateTimeField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    BtnUndo: TToolButton;
    ToolButton6: TToolButton;
    N1: TMenuItem;
    MnUndo: TMenuItem;
    QueryMailMAIL_SOST: TIntegerField;
    ToolButton5: TToolButton;
    BtnPer: TToolButton;
    BtnCopy: TToolButton;      
    MnCopy: TMenuItem;
    Memo1: TMemo;
    Timer3Transaction: TIBTransaction;
    BtnTo: TToolButton;
    QueryMailSUMM: TFloatField;
    QueryMailPRIBYL: TFloatField;
    QueryMailVALUTA_SHORT: TIBStringField;
    ToolButton7: TToolButton;
    StatusBar2: TStatusBar;
    BtnInterval: TToolButton;
    BtnFind: TToolButton;
    QueryMailMAIL_SUBSOST: TIBStringField;
    ToolButton8: TToolButton;
    BtnMet1: TToolButton;
    QueryTimer3US_FIO: TIBStringField;
    QueryMailMAIL_DEL: TIBStringField;
    QueryMailZAY_WEIGHT: TFloatField;
    Label1: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    QueryTimer3UTV: TIBStringField;
    mnuConfirm: TMenuItem;
    N4: TMenuItem;
    mnuNotConfirm: TMenuItem;
    btnHistory: TToolButton;
    ToolButton9: TToolButton;
    Label2: TLabel;
    MAN_ID: TRxDBLookupCombo;
    Label3: TLabel;
    SKL_ID: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure ChangeTree;
    procedure GetMail;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BtnMergeClick(Sender: TObject);
    procedure BtnReplyClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure QueryMailAfterOpen(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure QueryMailAfterScroll(DataSet: TDataSet);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnPerClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnToClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure RxDBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnMet1Click(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure mnuconfirmClick(Sender: TObject);
    procedure mnuNotConfirmClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure MAN_IDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  FieldSkip=2;

var
  Dic_Email: TDic_Email;
  ROOT:TtreeNode;
  CanRefresh:boolean;
  ShowTimer:boolean;
  DT1,DT2:tdatetime;
  DAT1,DAT2:tdatetime;
  G_KEY:ansistring;
  CAN_MET1:boolean;

implementation

uses Mainform, DocEmail, SelectPrint, MailSubdoc, SetJouDate, DateInterval,
  FindDocNum, ReportMergeMail;

{$R *.DFM}

procedure TDic_Email.FormShow(Sender: TObject);
begin
      MemFrm.EmptyTable;
      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=-1;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;

      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Розница>';
      MemFrm.Post;
      
      ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(-1) order by 2');
      QueryWork.open;
      while not QueryWork.eof do begin
        MemFrm.Append;
        MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
        MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
        MemFrm.Post;
        QueryWork.next;
      end;


     FRM.Value:=inttostr(GL_FRM_WORK_MODE);


     DT1:=date()-1;
     DT2:=date();
     CanRefresh:=false;
     Caption:='Почта пользователя '+UserFio;
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
     GetMail;
     CanRefresh:=True;
     Treeview1.selected:=ROOT;
     ShowTimer:=False;
     Timer1.enabled:=False;
     CAN_MET1:=check_dostup('$MAIL.MET1');
     BtnNew.Enabled := CHECK_DOSTUP('$MAIL.NEW');
end;

procedure TDic_Email.GetMail;
var
   TREE4,TREE,TREE2,TREE3,TREE5:TtreeNode;
begin
     Treeview1.Items.Clear;

     ROOT:=Treeview1.items.add(NIL,'Папка пользователя');
     ROOT.stateindex:=0;
     ROOT.imageindex:=7;
     ROOT.selectedindex:=7;
     if CHECK_DOSTUP('$MAIL.READ_ALL') then begin
       TREE:=Treeview1.items.addChild(ROOT,'Вся переписка');
       TREE.stateindex:=30;
       TREE.imageindex:=2;
       TREE.selectedindex:=2;
     end;
     TREE:=Treeview1.items.addChild(ROOT,'Входящие');
     TREE.stateindex:=1;
     TREE.imageindex:=2;
     TREE.selectedindex:=2;
     TREE4:=TREE;
     TREE:=Treeview1.items.addChild(ROOT,'Отправленные');
     TREE.stateindex:=3;
     TREE.imageindex:=8;
     TREE.selectedindex:=8;
     TREE:=Treeview1.items.addChild(ROOT,'Удалённые');
     TREE.stateindex:=4;
     TREE.imageindex:=5;
     TREE.selectedindex:=5;
     TREE:=Treeview1.items.addChild(ROOT,'Черновики');
     TREE.stateindex:=5;
     TREE.imageindex:=6;
     TREE.selectedindex:=6;
     ROOT.Expand(True);

     TREE:=Treeview1.items.add(NIL,'Документооборот');
     TREE.stateindex:=-1;
     TREE.imageindex:=7;

     TREE.selectedindex:=7;
     if Check_Dostup('$MAIL.VID3') then begin
       TREE2:=Treeview1.items.addChild(TREE,'Заявки на закупку');
       TREE2.stateindex:=6;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
         TREE3:=Treeview1.items.addChild(TREE2,'В работе');
         TREE3.stateindex:=8;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
                TREE5:=Treeview1.items.addChild(TREE3,'Менеджеру по розничным продажам');
                TREE5.stateindex:=31;
                TREE5.imageindex:=3;
                TREE5.selectedindex:=3;
                TREE5:=Treeview1.items.addChild(TREE3,'Менеджеру по оптовым продажам');
                TREE5.stateindex:=32;
                TREE5.imageindex:=3;
                TREE5.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'На подпись');
         TREE3.stateindex:=22;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Для утверждения');
         TREE3.stateindex:=9;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Утверждённые');
         TREE3.stateindex:=10;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Оплаченные');
         TREE3.stateindex:=11;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Выполненные');
         TREE3.stateindex:=12;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Отказанные');
         TREE3.stateindex:=23;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
     end;
     if Check_Dostup('$MAIL.VID6') then begin // Доступ на просмотр приказов
       TREE2:=Treeview1.items.addChild(TREE,'Приказы');
       TREE2.stateindex:=13;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
     end;
     if Check_Dostup('$MAIL.VID7') then begin // Доступ на просмотр распоряжений
       TREE2:=Treeview1.items.addChild(TREE,'Распоряжения');
       TREE2.stateindex:=14;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
     end;
     if Check_Dostup('$MAIL.VID4') then begin // Доступ на просмотр ККМ отчетов
       TREE2:=Treeview1.items.addChild(TREE,'Отчёты о ККМ');
       TREE2.stateindex:=15;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
     end;
     if Check_Dostup('$MAIL.VID8') then begin // Доступ на просмотр Заявок на доставку
       TREE2:=Treeview1.items.addChild(TREE,'Заявки на доставку');
       TREE2.stateindex:=16;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
     end;
     if Check_Dostup('$MAIL.VID2') then begin // Доступ на просмотр Заявок на перемещение
       TREE2:=Treeview1.items.addChild(TREE,'Заявки на перемещение');
       TREE2.stateindex:=17;
       TREE2.imageindex:=9;
       TREE2.selectedindex:=9;
         TREE3:=Treeview1.items.addChild(TREE2,'Не одобренные');
         TREE3.stateindex:=21;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'В работе');
         TREE3.stateindex:=18;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Выполненные');
         TREE3.stateindex:=19;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
         TREE3:=Treeview1.items.addChild(TREE2,'Старые');
         TREE3.stateindex:=20;
         TREE3.imageindex:=3;
         TREE3.selectedindex:=3;
     end;
     TREE.expand(True);
     Treeview1.Selected:=Tree4;
end;

procedure TDic_Email.ChangeTree;
var
   typ,Subtyp:integer;
   cnt:integer;
   s:ansistring;
   N:integer;
begin
  if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
  end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
  end;
  StatusBar2.Panels[1].text:=Treeview1.selected.Text;
  DAT1:=DT1;
  DAT2:=DT2+1-Sekond1;
  Memo1.lines.clear;
  ShowTimer:=False;
  Timer1.enabled:=False;

  mnuConfirm.Visible:=false;
  mnunotconfirm.Visible:=mnuConfirm.Visible;

  if CanRefresh then begin
     typ:=Treeview1.selected.stateindex;
     MailTransaction.Active:=False;
     QueryMail.close;
     if typ in [6,8,9,10,11,12,22,23,31,32] then begin // Заявки на закупку
       RxDbgrid3.Columns[7+FieldSkip].visible:=true;
       RxDbgrid3.Columns[8+FieldSkip].visible:=true;
       RxDbgrid3.Columns[9+FieldSkip].visible:=true;
       RxDbgrid3.Columns[11+FieldSkip].visible:=true;
       RxDbgrid3.Columns[5+FieldSkip].visible:=true;
       RxDbgrid3.Columns[6+FieldSkip].visible:=false;
     end else if typ in [18,19,21] then begin
       RxDbgrid3.Columns[7+FieldSkip].visible:=true;
       RxDbgrid3.Columns[8+FieldSkip].visible:=false;
       RxDbgrid3.Columns[9+FieldSkip].visible:=true;
       RxDbgrid3.Columns[11+FieldSkip].visible:=true;
       RxDbgrid3.Columns[5+FieldSkip].visible:=true;
       RxDbgrid3.Columns[6+FieldSkip].visible:=true;
     end else begin
       RxDbgrid3.Columns[7+FieldSkip].visible:=False;
       RxDbgrid3.Columns[8+FieldSkip].visible:=False;
       RxDbgrid3.Columns[9+FieldSkip].visible:=False;
       RxDbgrid3.Columns[11+FieldSkip].visible:=False;
       RxDbgrid3.Columns[5+FieldSkip].visible:=true;
       RxDbgrid3.Columns[6+FieldSkip].visible:=true;
     end;
     QueryMail.SQL.clear;
     RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Вид';
     RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Кому';
     RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Тема';
     case typ of
       0: {Папка пользователя};
       1: {Входящие} begin
          {Читаем входящую почту для всех, текущего магазина и текущего пользователя}
            {Читаем электронную почту от указанного пользователя, кроме заявок на
             перемещение}
            QueryMail.SQL.add('select * from mail_inbox(:US_ID,:SHOP_ID,:dt1,:DT2)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('US_ID').asinteger:=USERID;
            QueryMail.ParamByname('SHOP_ID').asinteger:=SHOPID;
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Входящие ('+inttostr(Cnt)+')';
       end;
       3: {Отправленные} begin
            {Читаем электронную почту от указанного пользователя, кроме заявок на
             перемещение}
            QueryMail.SQL.add('select * from mail_sent(:US_ID,:dt1,:dt2) ');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('US_ID').asinteger:=USERID;
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Отправленные ('+inttostr(Cnt)+')';
         end;
       4: {Удалённые} begin
            QueryMail.SQL.add('select * from mail_del(:US_ID,:DT1,:DT2)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('US_ID').asinteger:=USERID;
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Удаленные ('+inttostr(Cnt)+')';
         end;
       5: {Черновики} begin
            {Читаем электронную почту от указанного пользователя, кроме заявок на
             перемещение}
            QueryMail.SQL.add('select * from mail_draft(:US_ID,:SHOP_ID)');
            QueryMail.ParamByname('US_ID').asinteger:=USERID;
            QueryMail.ParamByname('SHOP_ID').asinteger:=SHOPID;
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Черновики ('+inttostr(Cnt)+')';
          end;
       6: {Все заявки на закупку} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_ALL(:DT1,:DT2, :FRM_ID) order by MAIL_NUM desc');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Заявки на закупку ('+inttostr(Cnt)+')';
       end;
       8: {В работе} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_WORK(:US_ID, :FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('US_ID').asinteger:=USERID;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='В работе ('+inttostr(Cnt)+')';
       end;
       31: {На утверждение менеджеру по рознице} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_PODP_ROZN(:FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Менеджеру по розничным продажам ('+inttostr(Cnt)+')';
       end;
       32: {На утверждение менеджеру по опту} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_PODP_OPT(:FRM_ID) order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Менеджеру по оптовым продажам ('+inttostr(Cnt)+')';
       end;




       22: {На подпись} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_PODP_NEW(:FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='На подпись ('+inttostr(Cnt)+')';

            mnuConfirm.Visible:=true;
            mnunotconfirm.Visible:=mnuConfirm.Visible;
       end;
       9: {Для утверждения} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_UTW(:FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Для утверждения ('+inttostr(Cnt)+')';
            mnuConfirm.Visible:=true;
            mnunotconfirm.Visible:=mnuConfirm.Visible;            
       end;
       10: {Утверждённые} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_OPL(:FRM_ID, :dt1, :dt2)  order by CREATE_DATE desc');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;

            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Утвержденные ('+inttostr(Cnt)+')';
       end;
       11: {Оплаченные} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_WYP(:FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Оплаченные ('+inttostr(Cnt)+')';
       end;
       12: {Выполненные} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_OLD(:DT1,:DT2,:FRM_ID) order by MAIL_NUM desc');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Выполненные ('+inttostr(Cnt)+')';
       end;
       23: {Отказанные} begin
            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
//            RxDbgrid3.Columns[5+FieldSkip].Title.caption:='Сумма';
            RxDbgrid3.Columns[6+FieldSkip].Title.caption:='Прибыль';
            QueryMail.SQL.add('select * from mail_ZAY_ZAK_OTKAZ(:FRM_ID)  order by MAIL_NUM desc');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Отказанные ('+inttostr(Cnt)+')';
       end;
       13: {Приказы} begin
            QueryMail.SQL.add('select * from mail_PRIKAZ(:DT1,:DT2,:FRM_ID)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Приказы ('+inttostr(Cnt)+')';
       end;
       14: {Распоряжения} begin

            RxDbgrid3.Columns[3+FieldSkip].Title.caption:='Поставщик';
            QueryMail.SQL.add('select * from mail_RASP(:DT1,:DT2,:FRM_ID, :MAN_ID, :skl_id) ');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.ParamByname('MAN_ID').asinteger:=strtoint('0'+MAN_ID.Value);
            QueryMail.ParamByname('SKL_ID').asinteger:=strtoint('0'+SKL_ID.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Распоряжения ('+inttostr(Cnt)+')';
       end;
       15: {Отчёты о ККМ} begin
            QueryMail.SQL.add('select * from mail_KKM(:DT1,:DT2,:FRM_ID) ');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Отчёты о ККМ ('+inttostr(Cnt)+')';
       end;
       16: {Заявки на доставку} begin
            QueryMail.SQL.add('select * from mail_DOST(:DT1,:DT2,:FRM_ID)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Заявки на доставку ('+inttostr(Cnt)+')';
       end;
       18: begin // Перемещения в работе
            RxDbgrid3.Columns[1].Title.caption:='Со склада на склад';
            QueryMail.SQL.add('select * from mail_zay_per_work(:FRM_ID)');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='В работе '+inttostr(Cnt)+')';
       end;
       19: begin // Перемещения выполненные
            RxDbgrid3.Columns[1].Title.caption:='Со склада на склад';
            QueryMail.SQL.add('select * from mail_zay_per_wyp(:DT1,:DT2,:FRM_ID)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Выполненные ('+inttostr(Cnt)+')';
       end;
       20: begin // Перемещения старые
            RxDbgrid3.Columns[1].Title.caption:='Со склада на склад';
            QueryMail.SQL.add('select * from mail_zay_per_old(:dt1,:dt2,:FRM_ID)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Старые ('+inttostr(Cnt)+')';
       end;
       21: begin // Неодобренные
            RxDbgrid3.Columns[1].Title.caption:='Со склада на склад';
            QueryMail.SQL.add('select * from mail_zay_per_neodobr(:FRM_ID)');
            QueryMail.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Не одобренные ('+inttostr(Cnt)+')';
       end;
       30: begin // Вся переписка
            QueryMail.SQL.add('select * from mail_all(:DT1,:DT2)');
            QueryMail.ParamByname('DT1').asdatetime:=DAT1;
            QueryMail.ParamByname('DT2').asdatetime:=DAT2;
            QueryMail.Open;
            QueryMail.Disablecontrols;
            cnt:=0;
            while not QueryMail.eof do begin
               inc(Cnt);
               QueryMail.next;
            end;
            QueryMail.First;
            QueryMail.Enablecontrols;
            Treeview1.selected.text:='Вся переписка ('+inttostr(Cnt)+')';
       end;
     end;
     ShowTimer:=True;
     Timer1.enabled:=True;
  end;
end;



procedure TDic_Email.BtnNewClick(Sender: TObject);
var
   ID:integer;
begin
     Application.createForm(TDOC_EMAIL,DOC_EMAIL);
     DOC_EMAIL.tag:=-1;
     DOC_EMAIL.showModal;
     if DOC_EMAIL.tag>0 then begin
        ID:=DOC_EMAIL.tag;
        {Перевыводим список}
        ShowTimer:=False;
        Timer1.enabled:=False;
        QueryMail.Disablecontrols;
        Try
          ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
          MailTransaction.Active:=False;
          QueryMail.close;
          QueryMail.Open;
          QueryMail.locate('MAIL_ID',ID,[]);
        Except
        End;
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
     end;
     DOC_EMAIL.Destroy;
end;

procedure TDic_Email.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
     ChangeTree;
end;

procedure TDic_Email.BtnMergeClick(Sender: TObject);
var
   ID:integer;
begin
     if Messbox('Объединить одобренные заявки на перемещение?',MessSubmit,4+48+256)=6 then begin
        ShowTimer:=False;
        Timer1.enabled:=False;
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           Open_SQL(DataModule1.IbSaveSQL,'select * from mail_merge');
           Application.createForm(TREPORT_MERGE_MAIL,REPORT_MERGE_MAIL);
           REPORT_MERGE_MAIL.memo1.lines.clear;
           while not DataModule1.IbSaveSQL.eof do begin
              if DataModule1.IbSaveSQL.fieldbyname('MESS').asstring<>'' then
              REPORT_MERGE_MAIL.memo1.lines.add(DataModule1.IbSaveSQL.fieldbyname('TW_ART').asstring+' '+
              DataModule1.IbSaveSQL.fieldbyname('TW_NAM').asstring+' '+DataModule1.IbSaveSQL.fieldbyname('MESS').asstring);
              DataModule1.IbSaveSQL.next;
           end;
           REPORT_MERGE_MAIL.memo1.lines.add(powt_sym('-',50));
           REPORT_MERGE_MAIL.memo1.lines.add('Все попутные заявки объединены!');
           Datamodule1.IBTransaction2.commit;
           REPORT_MERGE_MAIL.showModal;
           REPORT_MERGE_MAIL.Destroy;
        Except
              Datamodule1.IBTransaction2.rollback;
              Messbox('Ошибка при объединении заявок на перемещение!',MessSYstem,48);
        End;
        QueryMail.Disablecontrols;
        Datamodule1.IBTransaction2.Active:=False;
        MailTransaction.Active:=False;
        QueryMail.close;
        QueryMail.Open;
        QueryMail.locate('MAIL_ID',ID,[]);
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
     end;
end;

procedure TDic_Email.BtnReplyClick(Sender: TObject);
begin
     {}
end;

procedure TDic_Email.BtnDelClick(Sender: TObject);
var
   ID:integer;
   r:double;
   US,TT:integer;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select US_ID,TO_ID from mail where mail_id=:mail_id');
  QueryWork.Parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
  QueryWork.Open;
  TT:=-2000;
  if QueryWork.eof then US:=-1000
    else begin
    US:=QueryWork.fieldbyname('US_ID').asinteger;
    TT:=QueryWork.fieldbyname('TO_ID').asinteger;
  end;
  QueryWork.Close;
  WorkTransaction.Active:=False;
  if ((US<>USERID) and (TT<>USERID)) then begin
     Messbox('Вы не являетесь автором или получателем данного сообщения и поэтому не можете его удалить!',MessSystem,48);
  end else begin
     ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
     if Treeview1.selected.stateindex=4 then begin
        if Messbox('Удалить сообщение без возможности восстановления?',MessSUbmitDelete,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
              if not IBDELETE_DOC('MAIL',QueryMail.fieldByname('MAIL_ID').asinteger) then r:=sqrt(-1);
              Datamodule1.IBTransaction2.Commit;
           Except
              Datamodule1.IBTransaction2.Rollback;
           End;
           Datamodule1.IBTransaction2.Active:=False;
           {Обновляем}
           QueryMail.disablecontrols;
           MailTransaction.Active:=False;
           QueryMail.close;
           QueryMail.Open;
           QueryMail.locate('MAIL_ID',ID,[]);
           QueryMail.Enablecontrols;
        end;
     end else begin
        if Messbox('Переместить сообщение в папку удалённые?',MessSUbmitDelete,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           Try
             IBSAVE_CLEAR;
             IBSAVE_ADD('MAIL_DEL','1');
             if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
             Datamodule1.IBTransaction2.Commit;
           Except
             Datamodule1.IBTransaction2.Rollback
           End;
           Datamodule1.IBTransaction2.Active:=False;
           {Обновляем}
           QueryMail.disablecontrols;
           MailTransaction.Active:=False;
           QueryMail.close;
           QueryMail.Open;
           QueryMail.locate('MAIL_ID',ID,[]);
           QueryMail.Enablecontrols;
        end;
     end;
  end;
end;

procedure TDic_Email.BtnOpenClick(Sender: TObject);
var
   r:double;
   ID:integer;
var
        CANread:boolean;
begin
  // Проверяем доступ
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then CANread:=FALSE
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             CANread:=TRUE;
          end else CANread:=FALSE;
  if CHECK_DOSTUP('$MAIL.READ_ALL') then CANREAD:=true;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
     {Зафиксировать факт прочтения}
     if Treeview1.selected.stateindex in [1,8,9,10,11,12,13,14,15,16,18,19,20,31,32] then begin
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'select *  from mailread where us_id=:us_id order by mailread_date');
        QueryWork.ParamByname('US_ID').asinteger:=USERID;
        QueryWork.Open;
        if QueryWork.eof then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           Try
              IBSAVE_CLEAR;
              IBSAVE_ADD('US_ID',USERID);
              IBSAVE_ADD('SHOP_ID',SHOPID);
              IBSAVE_ADD('MAIL_ID',QueryMail.fieldByname('MAIL_ID').asinteger);
              IBSAVE_ADD('MAILREAD_DATE',My_now);
              if IBSAVE_DOC('MAILREAD',-1)<0 then r:=sqrt(-1);
              Datamodule1.IBTransaction2.commit;
           Except
                 Datamodule1.IBTransaction2.rollback
           End;
           Datamodule1.IBTransaction2.Active:=False;
        end else begin
            {Уже читали}
            if my_now>QueryWork.fieldByname('MAILREAD_DATE').asdatetime then begin
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              Try
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('US_ID',USERID);
                 IBSAVE_ADD('SHOP_ID',SHOPID);
                 IBSAVE_ADD('MAILREAD_DATE',My_now);
                 if IBSAVE_DOC('MAILREAD',QueryWork.fieldByname('MAILREAD_ID').asinteger)<0 then r:=sqrt(-1);
                 Datamodule1.IBTransaction2.commit;
              Except
                 Datamodule1.IBTransaction2.rollback;
              End;
             Datamodule1.IBTransaction2.Active:=False;
            end;
        end;
     end;
     Application.createForm(TDOC_EMAIL,DOC_EMAIL);
     DOC_EMAIL.tag:=QueryMail.fieldByname('MAIL_ID').asinteger;
     DOC_EMAIL.showModal;
     DOC_EMAIL.Destroy;
     {Перевыводим список}
     ShowTimer:=False;
     Timer1.enabled:=False;
     ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
     QueryMail.Disablecontrols;
     MailTransaction.Active:=False;
     QueryMail.close;
     QueryMail.Open;
     QueryMail.locate('MAIL_ID',ID,[]);
     QueryMail.Enablecontrols;
     ShowTimer:=True;
     Timer1.enabled:=True;
  end;
end;

procedure TDic_Email.RxDBGrid3DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDic_Email.BtnPrintClick(Sender: TObject);
var
        CANread:boolean;
begin
  // Проверяем доступ
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then CANread:=FALSE
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             CANread:=TRUE;
          end else CANread:=FALSE;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
    case QueryMail.fieldByname('MAILVID_ID').asinteger of
     3:
     begin
        Application.createForm(TSelect_Print,Select_Print);
        Select_Print.Position:=PoDesigned;
        Select_Print.top:=Dic_Email.top+BtnPrint.top+4+BtnPrint.Height;
        Select_Print.left:=Dic_Email.left+BtnPrint.left+4+BtnPrint.Width;
        Select_Print.Button1.caption:='Напечатать Заявку на закупку';
        Select_Print.Button8.caption:='';
        Select_Print.Button2.caption:='Напечатать Факс заявки на закупку';
        Select_Print.Button3.caption:='Напечатать Задание экспедитору';
        Select_Print.Button4.caption:='Напечатать Товарно-транспортную накладную';
        Select_Print.Button5.caption:='Напечатать Транспортную накладную';


        Select_Print.showModal;
        if Select_Print.tag in [1,2,3] then begin
              PRINT_MAILS2(QueryMail.FieldByname('MAIL_ID').asinteger,Select_Print.tag);
        end;
        if Select_Print.tag = 4 then begin
              PRINT_MAILS2RN(QueryMail.FieldByname('MAIL_ID').asinteger);
        end;
        if Select_Print.tag = 5 then begin
                 PRINT_trans_nakl(QueryMail.FieldByname('MAIL_ID').asinteger, 2);
        end;



        Select_Print.destroy;
     end;
     7:
     begin
        Application.createForm(TSelect_Print,Select_Print);
        Select_Print.Position:=PoDesigned;
        Select_Print.top:=Dic_Email.top+BtnPrint.top+4+BtnPrint.Height;
        Select_Print.left:=Dic_Email.left+BtnPrint.left+4+BtnPrint.Width;
        Select_Print.Button1.caption:='Напечатать Распоряжение';
//        Select_Print.Button8.caption:='';
        Select_Print.Button2.caption:='Напечатать Товарную накладную';
        //23-10-2013 - добавлена печать формы МХ-1 для распоряжений

        Select_Print.Button6.caption:='Напечатать форму МХ-1';
        Select_Print.Button7.caption:='Напечатать форму МХ-1.1';

        Select_Print.showModal;
        if Select_Print.tag = 1 then begin
          Print_MailS(QueryMail.FieldByname('MAIL_ID').asinteger);
        end;
        if Select_Print.tag = 2 then begin
          PRINT_MAILS2RN(QueryMail.FieldByname('MAIL_ID').asinteger);
        end;
         if (Select_Print.tag=6) then
        begin
         PRINT_MH1_MH3(4, QueryMail.fieldbyname('MAIL_ID').asinteger, 1);
        end;

        if (Select_Print.tag=7) then
        begin
         PRINT_MH1_MH3(4, QueryMail.fieldbyname('MAIL_ID').asinteger, 11);
        end;

        Select_Print.destroy;
     end;
     else
     begin {Простая печать}
         Print_MailS(QueryMail.FieldByname('MAIL_ID').asinteger);
     end;
    end;
  end;
end;

procedure TDic_Email.ToolButton4Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDic_Email.QueryMailAfterOpen(DataSet: TDataSet);
var
   TYP:integer;
   EN:boolean;
   ss:ansistring;
begin
     QueryTimer1.close;
     QueryTimer2.close;
     QueryTimer3.close;
     Timer1.enabled:=False;
     Timer1.enabled:=True;
     {Определяем доступность кнопок}
     EN:=not QueryMail.eof;
     TYP:=Treeview1.selected.stateindex;
     BtnOpen.enabled:=En;
     MnOpen.enabled:=En;
     BtnCopy.enabled:=En;
     MnCopy.enabled:=En;
     BtnDel.enabled:=En;
     MnDel.enabled:=En;
     BtnPrint.enabled:=En;
     MnPrint.enabled:=En;
     BtnMet1.enabled:=En and Can_Met1;
     BtnMerge.enabled:=((En) and (TYP=18));
     MnMerge.enabled:=((En) and (TYP=18));
     BtnPer.enabled:=((En) and (TYP=18));
     ss:=QueryMail.fieldByname('MAIL_SUBSOST').asstring+space(10);
     if EN then begin
        BtnUndo.enabled:=(((TYP in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger>1))
        or (TYP in [19,20])) and (ss[1]in [' ','0']);
        MnUndo.enabled:=((TYP in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger>1))
        or (TYP in [19,20]);
        BtnTo.enabled:=((TYP in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger in [2,3,4,6]))
                        or (TYP in [21,18]);
        if (btnTo.Enabled = false) then
        begin
        if (QueryMail.fieldByname('MAILVID_ID').asinteger = 7)  then
                BtnTo.enabled:=QueryMail.fieldByname('MAIL_SOST').asinteger in [1];
        end;
     end;
end;

procedure TDic_Email.Timer1Timer(Sender: TObject);
begin
  Try
     QueryTimer1.close;
     QueryTimer2.close;
     QueryTimer3.close;
     Timer1.enabled:=False;



     if ShowTimer then begin {Показываем информацию о доставке и прочтении}
        if QueryMail.fieldByname('MAIL_ID').asstring<>'' then begin
          TimerTransaction.Active:=False;
          QueryTimer1.ParamByName('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryTimer3.ParamByName('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryTimer1.Open;
          // Проверяем доступность просмотра
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then Memo1.lines.add('Просмотр сообщения запрещен!')
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             QueryTimer2.ParamByName('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
             QueryTimer2.Open;
             Memo1.lines.add(QueryTimer2.fieldbyname('MAIL_TXT').asstring);
             Memo1.SelStart:=1;
             Memo1.SelLength:=0;
             // Фиксируем факт прочтени
             WorkTransaction.Active:=False;
             ADD_SQL(QueryWork,'select * from mailread where mail_id=:mail_id and us_id=:us_id');
             QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
             QueryWork.parambyname('US_ID').asinteger:=USERID;
             QueryWork.open;
             if QueryWork.eof then begin
                Datamodule1.IBTransaction2.Active:=False;
                Datamodule1.IBTransaction2.StartTransaction;
                IBSAVE_CLEAR;
                IBSAVE_ADD('SHOP_ID',SHOPID);
                IBSAVE_ADD('MAIL_ID',QueryMail.fieldByname('MAIL_ID').asinteger);
                IBSAVE_ADD('MAILREAD_DATE',MY_NOW());
                IBSAVE_ADD('US_ID',USERID);
                if IBSAVE_DOC('MAILREAD',-1)>0 then Datamodule1.IBTransaction2.commit
                else Datamodule1.IBTransaction2.Rollback;
                Datamodule1.IBTransaction2.Active:=False;
             end;
          end else Memo1.lines.add('Просмотр сообщения запрещен!');
          Timer3Transaction.Active:=False;
          QueryTimer3.Open;
        end;
     end;
  Except
  End;
end;

procedure TDic_Email.QueryMailAfterScroll(DataSet: TDataSet);
var
 ss:ansistring;
begin
     ss:=QueryMail.fieldByname('MAIL_SUBSOST').asstring+space(10);
     BtnUndo.enabled:=(((Treeview1.selected.stateindex in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger>1))
        or (Treeview1.selected.stateindex in [19,20])) and (ss[1]in [' ','0']);
     MnUndo.enabled:=((Treeview1.selected.stateindex in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger>1)) or (Treeview1.selected.stateindex in [19,20]);
     BtnTo.enabled:=((Treeview1.selected.stateindex in [6,8,9,10,11,12,22,31,32]) and (QueryMail.fieldByname('MAIL_SOST').asinteger in [2,3,4,6]))
                        or (Treeview1.selected.stateindex in [21,18]);

    if (btnTo.Enabled = false) then
    begin
    if (QueryMail.fieldByname('MAILVID_ID').asinteger = 7)  then
            BtnTo.enabled:=QueryMail.fieldByname('MAIL_SOST').asinteger in [1];
    end;

     QueryTimer1.close;
     QueryTimer2.close;
     QueryTimer3.close;
     Timer1.enabled:=False;
     Timer1.enabled:=True;
end;

procedure TDic_Email.BtnUndoClick(Sender: TObject);
var
   ID:integer;
   r:double;
   CANread:boolean;
   ss:ansistring;
begin




 ss:=QueryMail.fieldByname('MAIL_SUBSOST').asstring+space(10);
 //для заявок убрал контроль - для возможности возврата в предыдущее состояние
 if ((ss[1] in ['1'..'9'])
 and (not check_dostup('$EMAIL.ZAY_PREV_SOST')))
  then Messbox('Сообщение отправлено на утверждение по E-mail. Заявка закрыта от изменений!',MessSystem,48) else
 begin
  // Проверяем доступ
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then CANread:=FALSE
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             CANread:=TRUE;
          end else CANread:=FALSE;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
   if Treeview1.Selected.StateIndex in [19,20] then begin
      // Заявка на перемещение
      if Messbox('Вернуть заявку на перемещение в состояние "В работе" ?',MessSubmit,4+48+256)=6 then begin
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('MAIL_OLD',0);
           IBSAVE_ADD('MAIL_WYP',0);
           IBSAVE_ADD('MAIL_SOST',1);
           if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
        {Перевыводим список}
        ShowTimer:=False;
        Timer1.enabled:=False;
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        QueryMail.Disablecontrols;
        MailTransaction.Active:=False;
        QueryMail.close;
        QueryMail.Open;
        QueryMail.locate('MAIL_ID',ID,[]);
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
      end;
   end else
     if Messbox('Вернуть состояние заявки на закупку в предыдущее?',MessSubmit,4+48+256)=6 then begin
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           if QueryMail.fieldByname('MAIL_SOST').asinteger=2 then IBSAVE_ADD('MAIL_SOST',0);
           if QueryMail.fieldByname('MAIL_SOST').asinteger=6 then IBSAVE_ADD('MAIL_SOST',2);
           if QueryMail.fieldByname('MAIL_SOST').asinteger=3 then IBSAVE_ADD('MAIL_SOST',6);
           if QueryMail.fieldByname('MAIL_SOST').asinteger=4 then IBSAVE_ADD('MAIL_SOST',3);
           if QueryMail.fieldByname('MAIL_SOST').asinteger=5 then IBSAVE_ADD('MAIL_SOST',4);
           if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
        {Перевыводим список}
        ShowTimer:=False;
        Timer1.enabled:=False;
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        QueryMail.Disablecontrols;
        MailTransaction.Active:=False;
        QueryMail.close;
        QueryMail.Open;
        QueryMail.locate('MAIL_ID',ID,[]);
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
     end;
  end;
 end;
end;

procedure TDic_Email.BtnPerClick(Sender: TObject);
var
   ID:integer;
   r:double;
var
        CANread:boolean;
    docs: string;
begin
  // Проверяем доступ
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then CANread:=FALSE
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             CANread:=TRUE;
          end else CANread:=FALSE;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
     if Messbox('Оформить на основании указанной заявки на перемещения накладную перемещения?',MessSubmit,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           ADD_SQL(DataModule1.IbSaveSQL,'select * from SUBDOC_MAIL_TO_PER1(:MAIL_ID,:SHOP_ID,:US_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.Open;
           if  Datamodule1.IbSaveSQL.Eof then
           	Messbox('Документы не оформлены',MessSystem,48)
            else
            begin

           		while not Datamodule1.IbSaveSQL.Eof do
           		begin
           			docs := docs + chr(13) +  DataModule1.IbSaveSQL.fieldByname('DOC_NUM_FULL').asstring;
            		Datamodule1.IbSaveSQL.Next;
           		end;
           		Messbox('Оформлены документы :' + docs+chr(13)+'от '+date_sokr(date()),MessSystem,48);
           end;
		   Datamodule1.IbSaveSQL.Close;
           Datamodule1.IBTransaction2.Commit;
        Except
              Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     if Messbox('Отметить заявку, как выполненную?',MessSubmit,4+48+256)=6 then begin
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('MAIL_WYP','1');
           if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
        {Перевыводим список}
        ShowTimer:=False;
        Timer1.enabled:=False;
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        QueryMail.Disablecontrols;
        MailTransaction.Active:=False;
        QueryMail.close;
        QueryMail.Open;
        QueryMail.locate('MAIL_ID',ID,[]);
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
     end;
  end;
end;

procedure TDic_Email.BtnCopyClick(Sender: TObject);
var
        CANread:boolean;
        NEWID:integer;
begin
  // Проверяем доступ
          WorkTransaction.active:=False;
          ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
          QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
          QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
          QueryWork.parambyname('US_ID').asinteger:=USERID;
          QueryWork.Open;
          Memo1.lines.clear;
          if QueryWork.eof then CANread:=FALSE
          else if QueryWork.fieldbyname('RET').asinteger=1 then begin
             CANread:=TRUE;
          end else CANread:=FALSE;
  if CHECK_DOSTUP('$MAIL.READ_ALL') then CANREAD:=true;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
       if Messbox('Создать копию сообщения электронной почты?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_MAIL( :MAIL_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_MAIL_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              ChangeTree;
              QueryMail.locate('MAIL_ID',NEWID,[]);
              RxDbgrid3.setfocus;
              Messbox('Сообщение электронной почты создано в группе "Черновики" или "Заявка на закупку в работе"!',MessSystem,48);
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
       end;
  end;
end;

procedure TDic_Email.BtnToClick(Sender: TObject);
var
  ID,SOST:integer;
  CANread:boolean;
  r:double;
begin
  // Проверяем доступ
  WorkTransaction.active:=False;
  ADD_SQL(QueryWork,'select ret from check_read_mail(:mail_id,:shop_id,:us_id)');
  QueryWork.parambyname('MAIL_ID').asinteger:=QueryMail.fieldByname('MAIL_ID').asinteger;
  QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
  QueryWork.parambyname('US_ID').asinteger:=USERID;
  QueryWork.Open;
  Memo1.lines.clear;
  if QueryWork.eof then CANread:=FALSE
  else if QueryWork.fieldbyname('RET').asinteger=1 then begin
    CANread:=TRUE;
  end else CANread:=FALSE;
  if not CANREAD then messbox('Вы не имеете прав на просмотр или редактирование данного сообщения!','Ограничение доступа!',48)
  else begin
  if (QueryMail.fieldByname('MAILVID_ID').asinteger = 7)  then
  begin

        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('MAIL_SOST','2');
           if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
           ChangeTree;
        Except
           Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;

  end
  else
  if Treeview1.Selected.stateindex in [18,21] then begin
     // Заявки на перемещение
     if Messbox('Отметить заявку, как выполненную?',MessSubmit,4+48+256)=6 then begin
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('MAIL_WYP','1');
           IBSAVE_ADD('MAIL_ODOBR','1');
           if IBSAVE_DOC('MAIL',ID)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
        {Перевыводим список}
        ShowTimer:=False;
        Timer1.enabled:=False;
        ID:=QueryMail.fieldByname('MAIL_ID').asinteger;
        QueryMail.Disablecontrols;
        MailTransaction.Active:=False;
        QueryMail.close;
        QueryMail.Open;
        QueryMail.locate('MAIL_ID',ID,[]);
        QueryMail.Enablecontrols;
        ShowTimer:=True;
        Timer1.enabled:=True;
     end;
  end else begin
   SOST:=QueryMail.fieldByname('MAIL_SOST').asinteger;
   case SOST of
    2: // подпись
       if not CHECK_DOSTUP('$MAIL.ZAY.PODP') then Messbox('Вы не имеете права на подпись заявки!','Ограничение доступа!',48) else begin
           messbox('Нельзя таким способом подписать заявку! Откройте ее для просмотра!','Внимание!',48);
       end;

    10: // утверждение по согласованиям
       Messbox('Недостаточно согласований для подписи заявки!','Внимание!',48);

    6: // утверждение
       if not CHECK_DOSTUP('$MAIL.ZAY.UTW') then Messbox('Вы не имеете права на утверждение заявки!','Ограничение доступа!',48) else begin
         Application.createForm(TSET_DATA,SET_DATA);
         SET_DATA.dt.date:=date();
         SET_DATA.Label1.caption:='Дата утверждения :';
         SET_DATA.Caption:='Быстрое утверждение заявки';
         SET_DATA.ShowModal;
         if SET_DATA.tag=2 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
             IBSAVE_CLEAR;
             IBSAVE_ADD('UTW_DATE',SET_DATA.dt.date);
             IBSAVE_ADD('UTW_US',USERID);
             IBSAVE_ADD('MAIL_SOST',3);
             if IBSAVE_DOC('MAIL',QueryMail.fieldByname('MAIL_ID').asinteger)<0 then r:=sqrt(-1);
             Datamodule1.IBTransaction2.Commit;
             ChangeTree;
           Except
              Datamodule1.IBTransaction2.rollback;
           End;
           Datamodule1.IBTransaction2.Active:=False;
         end;
         SET_DATA.destroy;
       end;
    3: // Оплата
      if not CHECK_DOSTUP('$MAIL.ZAY.OPL') then Messbox('Вы не имеете права на оплату заявки!','Ограничение доступа!',48) else begin
         Application.createForm(TSET_DATA,SET_DATA);
         SET_DATA.dt.date:=date();
         SET_DATA.Label1.caption:='Дата оплаты :';
         SET_DATA.Caption:='Быстрая оплата заявки';
         SET_DATA.ShowModal;
         if SET_DATA.tag=2 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
             IBSAVE_CLEAR;
             IBSAVE_ADD('OPL_DATE',SET_DATA.dt.date);
             IBSAVE_ADD('OPL_US',USERID);
             IBSAVE_ADD('MAIL_SOST',4);
             if IBSAVE_DOC('MAIL',QueryMail.fieldByname('MAIL_ID').asinteger)<0 then r:=sqrt(-1);
             Datamodule1.IBTransaction2.Commit;
             ChangeTree;
           Except
              Datamodule1.IBTransaction2.rollback;
           End;
           Datamodule1.IBTransaction2.Active:=False;
         end;
         SET_DATA.destroy;
       end;
    4: // Выполнение
       if not CHECK_DOSTUP('$MAIL.ZAY.WYP') then Messbox('Вы не имеете права на выполение заявки!','Ограничение доступа!',48) else begin
         Application.createForm(TSET_DATA,SET_DATA);
         SET_DATA.dt.date:=date();
         SET_DATA.Label1.caption:='Дата выполнения :';
         SET_DATA.Caption:='Быстрое выполенение заявки';
         SET_DATA.ShowModal;
         if SET_DATA.tag=2 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
             IBSAVE_CLEAR;
             IBSAVE_ADD('WYP_DATE',SET_DATA.dt.date);
             IBSAVE_ADD('WYP_US',USERID);
             IBSAVE_ADD('MAIL_SOST',5);
             if IBSAVE_DOC('MAIL',QueryMail.fieldByname('MAIL_ID').asinteger)<0 then r:=sqrt(-1);
             Datamodule1.IBTransaction2.Commit;
             if Messbox('Выполнить оформление первичных документов?',MessSubmit,4+48)=6 then begin
                {Запустить процедуру оформления документов}
                Application.createForm(TMAIL_SUBDOC,MAIL_SUBDOC);
                MAIL_SUBDOC.tag:=QueryMail.fieldByname('MAIL_ID').asinteger;
                MAIL_SUBDOC.ShowModal;
                MAIL_SUBDOC.Destroy;
             end;
             ChangeTree;
           Except
              Datamodule1.IBTransaction2.rollback;
           End;
           Datamodule1.IBTransaction2.Active:=False;
         end;
         SET_DATA.destroy;
       end;
    end;
   end;
  end;
end;

procedure TDic_Email.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     Key:=#0;
     DT1:=DT1-1;
     DT2:=DT2-1;
     ChangeTree;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     Key:=#0;
     DT1:=DT1+1;
     DT2:=DT2+1;
     ChangeTree;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
     Key:=#0;
     DT1:=date();
     DT2:=date();
     ChangeTree;
  end;
  if (KEY in ['i','I','ш','Ш']) and (BtnInterval.enabled) then begin
     Key:=#0;
     BtnInterval.click;
  end;
  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     BtnFind.click;
  end;
  if key=#27 then Close;
  if key='/' then begin
     key:=#0;
     Application.createForm(TSET_JOUDATE,SET_JOUDATE);
     SET_JOUDATE.showModal;
     if SET_JOUDATE.tag>0 then begin
        DT1:=SET_JOUDATE.DateEdit1.date;
        DT2:=SET_JOUDATE.DateEdit1.date;
        ChangeTree;
     end;
     SET_JOUDATE.Destroy;
  end;
end;

procedure TDic_Email.BtnIntervalClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    ChangeTree;
  end;
  Date_interval.destroy;
end;

procedure TDic_Email.BtnFindClick(Sender: TObject);
var
  TYP:integer;
  VID:integer;
  a:integer;
  T:Ttreenode;
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=18; {Метка, что искать в приходных}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  TYP:=0;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(CREATE_DATE) AS CREATE_DATE,MAIL_SOST,MAILVID_ID,US_ID,MAIL_ODOBR,MAIL_DEL,MAIL_OLD,MAIL_WYP,MAIL_AUTO,TO_ID FROM MAIL WHERE MAIL_ID=:MAIL_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('MAIL_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('CREATE_DATE').asdatetIme;
     DT2:=DT1;
     VID:=FIND_DOCNUM.IbQuery1.fieldByname('MAILVID_ID').asinteger;
     if VID=3 then begin // Заявка на закупку
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=0 then TYP:=6; // В работе
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=2 then TYP:=22; // На подпись
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=3 then TYP:=10; // утвержденные
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=4 then TYP:=11; // оплаченные
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=5 then TYP:=12; // выполненные
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=6 then TYP:=9; // Для утверждение
        if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=7 then TYP:=23; // Отказанные
     end;
     if VID=4 then TYP:=15; // ККМ
     if VID=2 then begin // Заявка на перемещение
       if (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_ODOBR').asinteger=0) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_DEL').asinteger=0)
        then TYP:=21; // Не одобренные
       if (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_ODOBR').asinteger=1) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_OLD').asinteger=0) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_WYP').asinteger=0) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_SOST').asinteger=1)
        then TYP:=18; // в работе
       if (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_OLD').asinteger=0) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_WYP').asinteger=1) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_SOST').asinteger=1)
        then TYP:=19; // Выполненные
       if (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_OLD').asinteger=1) and
       (FIND_DOCNUM.IbQuery1.Fieldbyname('MAIL_SOST').asinteger=1)
        then TYP:=20; // Старые
     end;
     if VID=6 then TYP:=13; // Приказы
     if VID=7 then TYP:=14; // Распоряжени
     if VID=8 then TYP:=16; // Заявки на доставку
     if VID in [1,5] then begin
        if FIND_DOCNUM.IbQuery1.Fieldbyname('US_ID').asinteger=USERID then begin
          if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_DEL').asinteger=1 then TYP:=4
          else begin
            if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=0 then
              TYP:=5 // Черновики
            else TYP:=3; // Отправленные
          end;
        end else if (FIND_DOCNUM.IbQuery1.Fieldbyname('TO_ID').asinteger=-1)
         or (FIND_DOCNUM.IbQuery1.Fieldbyname('TO_ID').asinteger=USERID) or
         (-FIND_DOCNUM.IbQuery1.Fieldbyname('TO_ID').asinteger-2=SHOPID) then begin
            if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_DEL').asinteger=1 then TYP:=4 else
            if FIND_DOCNUM.IbQuery1.fieldByname('MAIL_SOST').asinteger=0 then
              TYP:=5 // Черновики
            else TYP:=1; // Входящие
        end;
     end;
     T:=ROOT;
     CanRefresh:=False;
     for a:=1 to Treeview1.items.count do begin
       if Treeview1.items[a-1].stateindex=TYP
       then t:=Treeview1.items[a-1];
     end;
     Treeview1.selected:=t;
     CanRefresh:=True;
     ChangeTree;
     if Querymail.Active then
     Querymail.locate('MAIL_ID',FIND_DOCNUM.tag,[]);
     RxDbgrid3.setfocus;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     //
  end;
  FIND_DOCNUM.destroy;
end;

procedure TDic_Email.RxDBGrid3DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDic_Email.RxDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  TYP:integer;
  s:ansistring;
begin
   RxDbGrid3.Canvas.Brush.color:=clWindow;
   RxDbGrid3.Canvas.Font.color:=clWindowText;
   if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_ID').asstring<>'' then begin
     if (Column.Field.FullName='MAIL_NUM') then begin
        TYP:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_SOST').asinteger;
        case TYP of
           2: if ZAY_COLOR2>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR2;
           3: if ZAY_COLOR3>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR3;
           4: if ZAY_COLOR4>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR4;
           5: if ZAY_COLOR5>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR5;
           6: if ZAY_COLOR6>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR6;
           7: if ZAY_COLOR7>-1 then RxDbGrid3.Canvas.Brush.color:=ZAY_COLOR7;
        end;
     end;
     if (GdSelected in State ) and (RxDbgrid3.focused) then begin
      RxDbGrid3.Canvas.Font.color:=clHighlighttext;
      RxDbGrid3.Canvas.Brush.color:=clHighlight;
       if (Column.Field.FullName='MAIL_NUM') then begin
          TYP:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_SOST').asinteger;
          case TYP of
             2: if ZAY_COLOR2>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR2;
             3: if ZAY_COLOR3>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR3;
             4: if ZAY_COLOR4>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR4;
             5: if ZAY_COLOR5>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR5;
             6: if ZAY_COLOR6>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR6;
             7: if ZAY_COLOR7>-1 then RxDbGrid3.Canvas.Font.color:=ZAY_COLOR7;
          end;
       end;
     end;
     if (Column.Field.FullName='MAIL_SUBSOST') or (Column.Field.FullName='MAIL_ID')
        or (Column.Field.FullName='MAIL_DEL') or (Column.Field.FullName='MAIL_SOST') then
     begin
        RxDbGrid3.Canvas.FillRect(Rect);
        if Column.Field.FullName='MAIL_ID' then begin
           //Первая колонка - отметка почты
           s:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_SUBSOST').asstring+space(10);
           case s[1] of
            ' ','0': begin
                 end;
            '1': begin // Отправлено почтой
                    DataModule1.ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    132,True);
                 end;
            '2': begin // Утверждено по почте
                    DataModule1.ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    133,True);
                 end;
            '3': begin  // Отказано почтой
                    DataModule1.ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    134,True);
                 end;
           end;
        end;
        if Column.Field.FullName='MAIL_DEL' then begin
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_DEL').asinteger=1 then
             ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    22,True)
        end;
        if Column.Field.FullName='MAIL_SOST' then begin
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_SOST').asinteger=0 then
             ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    6,True)
        end;
        if Column.Field.FullName='MAIL_SUBSOST' then begin
           //Вторая колонка - отметка крыжа
           //Первая колонка - отметка почты
           s:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAIL_SUBSOST').asstring+space(10);
           case s[2] of
            ' ','0': begin
                 end;
            '1': begin // Отправлено почтой
                    DataModule1.ImageList1.Draw(RxDbGrid3.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
                    ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
                    135,True);
                 end;
           end;
        end;
        //Выводим картинки
     end else RxDbGrid3.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end else RxDbGrid3.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TDic_Email.BtnMet1Click(Sender: TObject);
var
 ss:ansistring;
 ID:integer;
 r:double;
 a:integer;
begin
   // Делаем пометку
   ss:=QueryMail.FieldByName('MAIL_SUBSOST').asstring+space(10);
   for a:=1 to 10 do if ss[a]=' ' then ss[a]:='0';
   if ss[2]='0' then ss[2]:='1' ELSE ss[2]:='0';
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   Try
      ibsave_clear;
      ibsave_add('MAIL_SUBSOST',b_utils.left(ss,10));
      ID:=ibsave_doc('MAIL',QueryMail.FieldByName('MAIL_ID').asinteger);
      if ID<0 then r:=sqrt(-1);
      Datamodule1.IBTransaction2.Commit;
      Datamodule1.IBTransaction2.Active:=False;
      // Перевыводим
      MailTransaction.Active:=False;
      QueryMail.close;
      QueryMail.Open;
      QueryMail.locate('MAIL_ID',ID,[]);
   except
      Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TDic_Email.FRMChange(Sender: TObject);
begin
  if Treeview1.Selected<>nil then
    ChangeTree;
end;

procedure TDic_Email.mnuconfirmClick(Sender: TObject);

var mail_id: integer;
begin
   mail_id:=QueryMail.FieldByName('MAIL_ID').asinteger;
   if mail_id >0 then
   begin

   DataModule1.IbSaveSQL.SQL.Text:='UPDATE MAILREAD set mailread_date=''now'',  utv_met=1 where US_ID=:US_ID and MAIL_ID=:MAIL_ID';
   DataModule1.IbSaveSQL.ParamByName('US_ID').asinteger:=USERID;
   DataModule1.IbSaveSQL.ParamByName('MAIL_ID').asinteger:=MAIL_ID;
   DataModule1.IbSaveSQL.ExecSQL;
   DataModule1.IbSaveSQL.Transaction.Commit;


     Timer1.enabled:=False;
     Timer1.enabled:=True;
   end;

end;

procedure TDic_Email.mnuNotConfirmClick(Sender: TObject);
var mail_id: integer;
begin
   mail_id:=QueryMail.FieldByName('MAIL_ID').asinteger;
   if mail_id >0 then
   begin

   DataModule1.IbSaveSQL.SQL.Text:='UPDATE MAILREAD set mailread_date=''now'',  utv_met=2 where US_ID=:US_ID and MAIL_ID=:MAIL_ID';
   DataModule1.IbSaveSQL.ParamByName('US_ID').asinteger:=USERID;
   DataModule1.IbSaveSQL.ParamByName('MAIL_ID').asinteger:=MAIL_ID;
   DataModule1.IbSaveSQL.ExecSQL;
   DataModule1.IbSaveSQL.Transaction.Commit;


     Timer1.enabled:=False;
     Timer1.enabled:=True;
   end;

end;

procedure TDic_Email.btnHistoryClick(Sender: TObject);
begin
     SHOW_HISTORY_DOC('Почта: '+QueryMail.fieldByname('MAIL_NUM').asstring,'TW',QueryMail.fieldByname('MAIL_ID').asInteger);
end;

procedure TDic_Email.MAN_IDChange(Sender: TObject);
begin
  if Treeview1.Selected<>nil then
    ChangeTree;
end;

end.
