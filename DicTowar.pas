unit DicTowar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Mainform,
  Grids, DBGrids, RXDBCtrl, RXSplit, ComCtrls, ExtCtrls, ToolWin,Data1,
  ImgList, Db, IBCustomDataSet, IBDatabase, IBQuery,B_DButils,B_utils,edittw,
  FindTowar123,DetalTW, Menus,VclUtils, StdCtrls, Mask, ToolEdit, CurrEdit,WaitForm,
  RxLookup, ppVar;

type
  TDIC_TOWAR = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxSplitter2: TRxSplitter;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    BtnHistory: TToolButton;
    BtnCopy: TToolButton;
    ToolButton7: TToolButton;
    BtnNewGroup: TToolButton;
    Btn_Find123: TToolButton;
    Btn_FindABC: TToolButton;
    ToolButton4: TToolButton;
    BtnMove: TToolButton;
    Btn_PRINT: TToolButton;
    ToolButton13: TToolButton;
    Btn_MARKETING: TToolButton;
    Btn_DETAL: TToolButton;
    Btn_ANALIZ: TToolButton;
    ToolButton17: TToolButton;
    BtnMode: TToolButton;
    ToolButton19: TToolButton;
    IbQrTwtree: TIBQuery;
    IbTrTWTREE: TIBTransaction;
    ImageList1: TImageList;
    IbQrDicTowar: TIBQuery;
    IbQrDicTowarID: TIntegerField;
    IbQrDicTowarTREE: TIBStringField;
    IbQrDicTowarTW_ART: TIntegerField;
    IbQrDicTowarNAME: TIBStringField;
    IbQrDicTowarED_SHORT: TIBStringField;
    IbQrDicTowarTW_MROZ_NOW: TFloatField;
    IbQrDicTowarOST1_SKLAD: TFloatField;
    IbQrDicTowarOST2_SKLAD: TFloatField;
    IbQrDicTowarOST1_ALL: TFloatField;
    IbQrDicTowarOST2_ALL: TFloatField;
    DsQrDicTowar: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    RxDBGrid2: TRxDBGrid;
    BtnUP: TToolButton;
    ToolButton21: TToolButton;
    BtnSelectBrak: TToolButton;
    BtnSelect: TToolButton;
    IBQuery1: TIBQuery;
    IbQrDicTowarMET_NO_SKID: TIBStringField;
    IbQrDicTowarMET_SERT: TIBStringField;
    IbQrDicTowarMET_PRICE_PRINT: TIBStringField;
    IbQrDicTowarTWKTG_COLOR: TIntegerField;
    FastInfoTransaction: TIBTransaction;
    QrFastInfo: TIBQuery;
    DsFastInfo: TDataSource;
    QrFastInfoVID: TIBStringField;
    QrFastInfoF1: TFloatField;
    QrFastInfoF2: TFloatField;
    QrFastInfoF3: TFloatField;
    QrFastInfoF4: TFloatField;
    QrFastInfoF5: TFloatField;
    QrFastInfoF6: TFloatField;
    QrFastInfoF7: TFloatField;
    QrFastInfoF8: TFloatField;
    QrFastInfoF9: TFloatField;
    QrFastInfoF10: TFloatField;
    QrFastInfoF11: TFloatField;
    QrFastInfoF12: TFloatField;
    QrFastInfoF13: TFloatField;
    QrFastInfoF14: TFloatField;
    QrFastInfoF15: TFloatField;
    QrFastInfoF16: TFloatField;
    QrFastInfoF17: TFloatField;
    QrFastInfoF18: TFloatField;
    QrFastInfoF19: TFloatField;
    QrFastInfoF20: TFloatField;
    Timer1: TTimer;
    IBQuery2: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnCopy: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    MnNewGroup: TMenuItem;
    MnMove: TMenuItem;
    N2: TMenuItem;
    MnUp: TMenuItem;
    N4: TMenuItem;
    MnFind123: TMenuItem;
    MnFindABC: TMenuItem;
    N7: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    N9: TMenuItem;
    MnDetal: TMenuItem;
    MnAnaliz: TMenuItem;
    MnMarket: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OST1: TRxCalcEdit;
    OST2: TRxCalcEdit;
    OST3: TRxCalcEdit;
    QrFastInfoVID_ID: TIntegerField;
    N1: TMenuItem;
    N3: TMenuItem;
    IbQrTwtreeTWTREE_ID: TIntegerField;
    IbQrTwtreeTWTREE_FULL: TIBStringField;
    IbQrTwtreePARENT_ID: TIntegerField;
    IbQrTwtreeTWKAT_ID: TIntegerField;
    ToolButton3: TToolButton;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SKL: TRxDBLookupCombo;
    BtnAdm: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    IbQrDicTowarTW_KOMPL: TIBStringField;
    ToolBar2: TToolBar;
    BtnFormat1: TToolButton;
    BtnFormat2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    IbQrDicTowarMET_MONEY_SHOP: TIBStringField;
    DsShopFastInfo: TDataSource;
    btnPrice: TToolButton;
    IbQrDicTowarVIRTUAL: TIntegerField;
    DISABLE_HINT_TIMER: TTimer;
    ToolButton8: TToolButton;
    N5: TMenuItem;
    IbQrDicTowarMET_INTERNET: TIntegerField;
    N6: TMenuItem;
    IbQrDicTowarMET_OPT: TIntegerField;
    chkRozn: TCheckBox;
    chkOpt: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure refreshTree;
    procedure refresh_button;
    procedure IbQrDicTowarAfterOpen(DataSet: TDataSet);
    procedure IbQrDicTowarAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure BtnUPClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure TreeView1Enter(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure BtnNewGroupClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_Find123Click(Sender: TObject);
    procedure Btn_FindABCClick(Sender: TObject);
    procedure Btn_DETALClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_ANALIZClick(Sender: TObject);
    procedure Btn_MARKETINGClick(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnSelectBrakClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Btn_PRINTClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure BtnModeClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure BtnAdmClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure BtnFormat1Click(Sender: TObject);
    procedure BtnFormat2Click(Sender: TObject);
    procedure btnPriceClick(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure DISABLE_HINT_TIMERTimer(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkRoznClick(Sender: TObject);
    procedure chkOptClick(Sender: TObject);

  private
    { Private declarations }
    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;
  public
    { Public declarations }
   SELECT_ART: integer;    
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
   FORMAT_ID:integer;
   FORMAT_VID1,FORMAT_VID2:integer;
   FORMAT_VALUE1,FORMAT_VALUE2:double;
   CAN_COPYFORMAT2,CAN_COPYFORMAT,CAN_COPY,CAN_DETAL,CAN_ANALIZ,CAN_MARKETING:boolean;
   DICTW_MODE:integer;
   SHOW_COLUMN:ansistring='';
   DIC_TOWAR: TDIC_TOWAR;
   CanTreeRefresh:boolean=FALSe;
   TwTree:array[1..10000] of TWTREETYP;
   Root,OptRoot, intRoot, TREE2,TREE3, roznNewTree:TtreeNode;
   CntTWTREE:integer;

   Select:integer;

implementation

uses EditTwTree, MoveTree, FindTowarAbc, ANALIZTW, SetKolvo, AdminTw,
  EditKomplekt, CopyProp, PrintPrice, PrintDoc, InternetTwData;

{$R *.DFM}



procedure TDIC_TOWAR.READY_COM_DATAMessage(var AMessage: TMessage);
var tW_id: integer;
  tw_art: string;
  tw_art_int: integer;
  brak: string;
  tw_kol: double;
  ID, IDTREE: integer;
  a: integer;

begin
   try
   tw_kol:=1;
   tw_id:=AMessage.WParam;
        {Начинаем искать}
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select TW_ID,TWTREE_ID FROM TW WHERE TW_ID=:TW_ID');
        IbQuery1.ParamByname('TW_ID').asinteger:=TW_ID;
        IbQuery1.Open;
        if IbQuery1.eof then Messbox('В базе данных нет товара с кодом "'+inttostr(tW_id)+'"!',MessSystem,48)
        else begin
             ID:=IbQuery1.fieldbyname('TW_ID').asinteger;
             IDTREE:=IbQuery1.fieldbyname('TWTREE_ID').asinteger;
             {Позиционируемся на дерево}
             Tree3:=Root;
             for a:=1 to CntTWTREE do if TWTree[a].ID=IDTREE then Tree3:=TWTree[a].TREE;
             CanTreeRefresh:=False;
             Treeview1.Selected:=Tree3;
             CanTreeRefresh:=True;
             RefreshTree;
             IbQrDicTowar.locate('ID',tw_id,[]);
             RxDbGrid2.setFocus;
        end;
        IbQuery1.Close;




   except
    on e: Exception do
      messbox(e.message, e.message, 0);
   end;



  statusBar1.Panels[0].Text:='Ввод со сканера штрих кода: '+gl_LAST_BAR_CODE;
end;


procedure TDIC_TOWAR.FormShow(Sender: TObject);
var
   InTree:integer;
   a,b,c:integer;
   cntRepeet:integer;
   r:double;
begin


     FORMAT_ID:=-1;
     Label5.caption:='';
     CAN_COPYFORMAT2:=False;
     BtnFormat2.enabled:=False;
     CAN_COPYFORMAT:=CHECK_DOSTUP('$DICTW.CAN_COPYFORMAT');
     CAN_COPY:=CHECK_DOSTUP('$DICTW.CAN_COPY');
     CAN_DETAL:=CHECK_DOSTUP('$DICTW.DETAL_TW');
     CAN_ANALIZ:=CHECK_DOSTUP('$DICTW.ANALIZ_TW');
     CAN_MARKETING:=CHECK_DOSTUP('$DICTW.MARKETING_TW');
     btnPrice.Enabled:=(CHECK_USER_DOSTUP('PRICE_PRINT')<>-1); // Печать прайс-листа

     if SELECT_SKLAD<>0 then
       SKL.value:=inttostr(SELECT_SKLAD)
     else
     SKL.Value := inttostr(SKL.DataSource.DataSet.FieldByName('SKL_ID').asinteger);


     DICTW_MODE:=1;
     BtnMode.ImageIndex:=60+DICTW_MODE;
     Wait_Form.StatusBar1.panels[0].text:='Загрузка каталога товаров...';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);


     FastInfoTransaction.Active:=False;

     IbQuery2.close;
     IbQuery2.SQL.clear;
     IbQuery2.SQL.add('select count(*) as cc from cfg where cfg_set1=1 and (cfg_name="SPEED") and (cfg_value=1)');
     IbQuery2.Open;
     if IbQuery2.eof then begin
        RxDbgrid1.Height:=20*2
     end else begin
         RxDbgrid1.Height:=20*(IbQuery2.fieldbyname('cc').asinteger+2)+6;
     end;
     IbQuery2.close;
     {Определяем величину нижней таблицы}
     {Заполняем названия для быстрых остатков}
     IbQuery2.close;
     IbQuery2.SQL.clear;
     IbQuery2.SQL.add('select SKL_ID,SKL_SHORT FROM SKL WHERE SKL_SPEED>0 order by SKL_SPEED');
     IbQuery2.Open;
     Wait_Form.Gauge1.Progress:=20;
     delay(1);
     c:=0;
     SHOW_COLUMN:='';
	 RxDBgrid1.Columns[0].title.Caption:='Вид';
     while not IbQuery2.eof do begin
       inc(c);
       if IbQuery2.fieldByname('SKL_ID').asinteger=Treeview1.tag then SHOW_COLUMN:=RxDbgrid1.Columns[c].FieldName;
       RxDbgrid1.Columns[c].Title.Caption:=IbQuery2.fieldByname('SKL_SHORT').asstring;
       RxDbgrid1.Columns[c].Field.Tag:=IbQuery2.fieldByname('SKL_ID').asinteger;
       IbQuery2.next;
     end;
     IbQuery2.close;





     Wait_Form.Gauge1.Progress:=30;
     delay(1);
     case DicTowarSet of
          0: DIC_TOWAR.caption:='Справочник товаров';
          1: DIC_TOWAR.caption:='Справочник товаров. Набор списка товаров';
          2: DIC_TOWAR.caption:='Справочник товаров. Выбор товара или группы';
          3: DIC_TOWAR.caption:='Справочник товаров. Выбор группы товаров';
          4: DIC_TOWAR.caption:='Справочник товаров. Выбор одного товара';
     end;
     Wait_Form.Gauge1.Progress:=40;
     delay(1);
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     CanTreeRefresh:=false;
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
     {Загружаем каталог}
     IbTrTwTree.Active:=False;
     IbQrTwTree.Close;
     Wait_Form.Gauge1.Progress:=60;
     delay(1);
     IbQrTwTree.Open;
     CntTWTREE:=0;
     while not IbQrTwTree.eof do begin
           inc(CntTWTREE);
           TwTree[CntTWTREE].ID:=IbQrTwTree.fieldbyname('TWTREE_ID').asinteger;
           TwTree[CntTWTREE].PAR:=IbQrTwTree.fieldbyname('PARENT_ID').asinteger;
           TwTree[CntTWTREE].NAME:=IbQrTwTree.fieldbyname('TWTREE_FULL').asstring;
           TwTree[CntTWTREE].USE:=false;
           IbQrTwTree.next;
     end;
     {Наполняем каталог}
     Wait_Form.Gauge1.Progress:=70;
     delay(1);
     // Читаем последнюю дату
     OPEN_SQL(IbQuery1,'select date_value from cfg where cfg_name="UPDATE_TWTREE"');
     if IbQuery1.eof then begin
       NEWUPDATE_TWTREE:=my_now();
     end else NEWUPDATE_TWTREE:=IbQuery1.fieldbyname('DATE_VALUE').asdatetime;
     if NEWUPDATE_TWTREE>UPDATE_TWTREE then begin
       UPDATE_TWTREE:=NEWUPDATE_TWTREE;
       Treeview1.Items.BeginUpdate;
       Treeview1.items.clear;

       Root:=Treeview1.items.add(NIL,'<<Товары>>');
       Root.stateindex:=0;
       Root.imageindex:=26;
       Root.selectedindex:=26;

       roznNewTree:=Treeview1.items.AddChild(Root,'<<Новые>>');
       roznNewTree.stateindex:=1000;
       roznNewTree.imageindex:=26;
       roznNewTree.selectedindex:=26;

       OptRoot:=Treeview1.items.add(NIL,'<Оптовые Товары>');
       OptRoot.stateindex:=-1;
       OptRoot.imageindex:=211;
       OptRoot.selectedindex:=211;


       Tree2:=Treeview1.items.AddChild(OptRoot,'<Новые>');
       Tree2.stateindex:=1001;
       Tree2.imageindex:=211;
       Tree2.selectedindex:=211;


       intRoot:=Treeview1.items.add(NIL,'<Интернет каталог>');
       intRoot.stateindex:=-2;
       intRoot.imageindex:=211;
       intRoot.selectedindex:=211;


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
                     if IBSAVE_DOC('TWTREE',TwTree[a].ID)<0 then r:=sqrt(-1);
                     Datamodule1.IBTransaction2.Commit;
                     Messbox('Раздел каталога "'+TwTree[a].NAME+'" вызывал зацикливание каталога товаров. Перемещен в "корень" списка!',MessSystem,48);
                     TwTree[a].PAR:=0;
                  Except
                     Datamodule1.IBTransaction2.Rollback;
                     Messbox('Раздел каталога "'+TwTree[a].NAME+'" вызывал зацикливание каталога товаров. Произошла ошибка при перемещении в "корень" списка!',MessSystem,16);
                  end;
                  Datamodule1.IBTransaction2.Active:=False;
                  CntRepeet:=0;
               end;
               {Раздел ещё не внесён в каталог
               Проверяем, существует ли родитель, и если существует - вставляем}
               if TwTree[a].PAR=0 then
               begin
                 {Папка в корне}
                 TREE2:=Treeview1.items.addChild(Root,TwTree[a].NAME);
                 TREE2.stateindex:=TwTree[a].ID;
                 TREE2.imageindex:=27;
                 TREE2.selectedindex:=28;
                 TwTree[a].USE:=true;
                 TwTree[a].TREE:=TREE2;
                 inc(Intree);
                 cntRepeet:=0;
               end
               else
               if TwTree[a].PAR=-1 then
               begin
                 {Папка в виртуальном корне}
                 TREE2:=Treeview1.items.addChild(OptRoot,TwTree[a].NAME);
                 TREE2.stateindex:=TwTree[a].ID;
                 TREE2.imageindex:=212;
                 TREE2.selectedindex:=213;
                 TwTree[a].USE:=true;
                 TwTree[a].TREE:=TREE2;
                 inc(Intree);
                 cntRepeet:=0;
               end
               else
               if TwTree[a].PAR=-2 then
               begin
                 {Папка интернет каталога}
                 TREE2:=Treeview1.items.addChild(IntRoot,TwTree[a].NAME);
                 TREE2.stateindex:=TwTree[a].ID;
                 TREE2.imageindex:=212;
                 TREE2.selectedindex:=213;
                 TwTree[a].USE:=true;
                 TwTree[a].TREE:=TREE2;
                 inc(Intree);
                 cntRepeet:=0;
               end
               else
               begin

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

                    if TREE3.imageindex=212 then
                    begin
                      TREE2.imageindex:=212;
                      TREE2.selectedindex:=213;
                    end
                    else
                    begin
                      TREE2.imageindex:=27;
                      TREE2.selectedindex:=28;
                    end;

                    TwTree[a].USE:=true;
                    TwTree[a].TREE:=TREE2;
                    cntRepeet:=0;
                    inc(Intree);
                 end;
               end;
           end;
       end;
       Treeview1.Items.EndUpdate;
     end;
     Wait_Form.Gauge1.Progress:=80;
     delay(1);
     if DicTowarSet=0 then begin
        {Просмотр каталога}
        BtnSelect.Visible:=False;
        BtnSelectBrak.Visible:=False;
     end;
     if DicTowarSet=1 then begin
        {Добавляем товары в массив}
        BtnSelect.Visible:=True;
        BtnSelectBrak.Visible:=True;
     end;
     Treeview1.AlphaSort;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
     Root.Expand(False);
     Wait_Form.Gauge1.Progress:=91;
     delay(1);
     Treeview1.Selected:=Root;
     Wait_Form.Gauge1.Progress:=92;
     delay(1);
     if DicTowarSet=3 then begin
     Wait_Form.Gauge1.Progress:=93;
     delay(1);
        {Выбор одной группы}
        BtnSelect.Visible:=True;
        BtnSelectBrak.Visible:=false;
        Wait_Form.Gauge1.Progress:=94;
        delay(1);
        if DIC_TOWAR.tag>0 then begin
           {Позиционируемся на установленную группу}
           Wait_Form.Gauge1.Progress:=95;
           delay(1);
           CanTreeRefresh:=False;
           Wait_Form.Gauge1.Progress:=96;
           delay(1);
           Tree3:=Root;
           Wait_Form.Gauge1.Progress:=97;
           delay(1);
           for a:=1 to CntTWTREE do if TWTree[a].ID=DIC_TOWAR.tag then Tree3:=TWTree[a].TREE;
           Wait_Form.Gauge1.Progress:=98;
           delay(1);
           Treeview1.Selected:=Tree3;
         end;
     end;
     Wait_Form.Gauge1.Progress:=99;
     delay(1);
     CanTreeRefresh:=true;
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     RefreshTree;
     Wait_Form.Hide;


     self.AdjustSize;
end;

procedure TDIC_TOWAR.RefreshTree;
begin
   {Обновляем правый список}
   if Treeview1.items.count>0 then begin
     if CanTreeRefresh then begin
        IbTrTwTree.Active:=False;
        IbQrDicTowar.Close;
        IbQrDicTowar.Parambyname('TWTREE_ID').asinteger:=Treeview1.Selected.StateIndex;
        if SKL.value='' then IbQrDicTowar.Parambyname('SKL_ID').asinteger:=0
        else IbQrDicTowar.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
        IbQrDicTowar.Parambyname('MODE').asinteger:=DICTW_MODE;
        if Checkbox1.checked then IbQrDicTowar.Parambyname('SET_OST').asinteger:=1
        else IbQrDicTowar.Parambyname('SET_OST').asinteger:=0;
        IbQrDicTowar.ParamByname('SHOP_ID').asinteger:=SHOPID;
        IbQrDicTowar.ParamByname('frm_ID').asinteger:=gl_FRM_WORK_MODE;;
        IbQrDicTowar.ParamByname('show_rozn').asInteger:=0;
        if (chkRozn.checked) then IbQrDicTowar.ParamByname('show_rozn').asInteger:=1;
        IbQrDicTowar.ParamByname('show_opt').asInteger:=0;
        if (chkOpt.checked) then IbQrDicTowar.ParamByname('show_opt').asInteger:=1;
        IbQrDicTowar.open;
     end;
   end;
end;

procedure TDIC_TOWAR.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
     RefreshTree;
     if Treeview1.Focused then begin
        if (DicTowarSet=3) then BtnSelect.enabled:=true;
     end;
end;

procedure TDIC_TOWAR.IbQrDicTowarAfterOpen(DataSet: TDataSet);
begin
     OST1.value:=0; OST2.value:=0; OST3.value:=0;
     Timer1.enabled:=False;
     QrFastInfo.close;
     if IbQrDicTowar.eof then begin
        Statusbar1.Panels[0].text:='';
        BtnOpen.Enabled:=False;
        QrFastInfo.ParamByname('TW_ID').asinteger:=-1;
     end else begin
        Statusbar1.Panels[0].text:=IbQrDicTowar.fieldbyname('NAME').asstring;
        Statusbar1.Panels[1].text:=IbQrDicTowar.fieldbyname('ID').asstring;
        BtnOpen.Enabled:=True and TW_CAN_EDIT;
        QrFastInfo.ParamByname('TW_ID').asinteger:=IbQrDicTowar.fieldByname('ID').asinteger;
        if Checkbox2.checked then Timer1.enabled:=True;
     end;
     Refresh_Button;
end;

procedure TDIC_TOWAR.IbQrDicTowarAfterScroll(DataSet: TDataSet);
begin
     OST1.value:=0; OST2.value:=0; OST3.value:=0;
     Timer1.enabled:=False;
     Statusbar1.Panels[0].text:=IbQrDicTowar.fieldbyname('NAME').asstring;
     Statusbar1.Panels[1].text:=IbQrDicTowar.fieldbyname('ID').asstring;
     Refresh_Button;
     QrFastInfo.close;
     QrFastInfo.ParamByname('TW_ID').asinteger:=IbQrDicTowar.fieldByname('ID').asinteger;
     if Checkbox2.checked then Timer1.enabled:=True;
end;

procedure TDIC_TOWAR.RxDBGrid2DblClick(Sender: TObject);
var
   a:integer;
   ID:integer;
begin
     if (ibQrDicTowar.fieldByname('ID').asstring<>'') then begin
        if IbQrDicTowar.fieldbyname('TREE').asinteger=1 then begin
           {Определяем TREE}
           ID:=IbQrDicTowar.fieldbyname('ID').asinteger;
           TREE3:=Treeview1.selected;
           for a:=1 to CntTWTREE do if TwTree[a].ID=ID then Tree3:=TwTree[a].TREE;
           Treeview1.selected:=Tree3;
        end else begin
            if Dictowarset=0 then begin
              if BtnOpen.enabled then BtnOpen.click;
            end else if BtnSelect.enabled then BtnSelect.Click;
        end;
     end;
end;

procedure TDIC_TOWAR.BtnUPClick(Sender: TObject);
var
   ID:integer;
begin
     If Treeview1.Selected.stateindex=0 then messbox('Текущий уровень является самым верхним!','Внимание!',48) else begin
       ID:=Treeview1.Selected.stateindex;
       Treeview1.Selected:=Treeview1.Selected.Parent;
       IbQrDicTowar.Locate('ID',ID,[]);
     end;
end;

procedure TDIC_TOWAR.BtnNewClick(Sender: TObject);
begin
 if BtnNew.enabled then begin
   if Dic_Towar.Treeview1.selected.stateindex=0 then
   Messbox('Вы не можете создать товар в корневом каталоге. Пожалуйства выберите какой-нибудь раздел каталога!',MessSystem,48)
   else begin
     application.CreateForm(TEdit_tw,Edit_tw);
     Edit_tw.tag:=-1;
     Edit_tw.Label2.caption:=Treeview1.Selected.Text;
     Edit_tw.showmodal;
     if Edit_tw.tag>0 then begin
        RefreshTree;
        IbQrDicTowar.locate('ID',Edit_tw.tag,[]);
        RxDbgrid2.setfocus;
     end;
     Edit_tw.destroy;
   end;
 end;
end;

procedure TDIC_TOWAR.BtnOpenClick(Sender: TObject);
var
   a,ID:integer;
begin
  if BtnOpen.enabled then begin
    if Select=1 then begin
        {Правим группу товаров из дерева}
          application.createForm(TEdit_TWTree,Edit_TWTree);
          Edit_TWTree.Label3.Caption:=Treeview1.selected.text;
          Edit_TWTree.tag:=Treeview1.Selected.stateindex;
          Edit_TWTree.BtnApply.tag:=Treeview1.Selected.parent.stateindex;
          Edit_TWTree.showmodal;
          if Edit_TWTree.tag>0 then begin
             Treeview1.Selected.Text:=Edit_TWTree.Edit1.text;
             RefreshTree;
          end;
          Edit_TWTree.destroy;
     end else begin
        {Правим из списка - определяем, что правим}
        if IbQrDicTowar.FieldByName('TREE').asstring='1' then begin
           {Правим раздел каталога}
           application.createForm(TEdit_TWTree,Edit_TWTree);
           Edit_TWTree.Label3.Caption:=Treeview1.selected.text;
           ID:=IbQrDicTowar.fieldbyname('ID').asinteger;
           Edit_TWTree.tag:=ID;
           Edit_TWTree.BtnApply.tag:=Treeview1.Selected.stateindex;
           Edit_TWTree.showmodal;
           if Edit_TWTree.tag>0 then begin
              {Необходимо изменить название в дереве}
              TREE3:=Treeview1.selected;
              for a:=1 to CntTWTREE do if TWTree[a].ID=ID then Tree3:=TWTree[a].TREE;
              TREE3.Text:=Edit_TWTree.Edit1.text;
           end;
           Edit_TWTree.destroy;
           RefreshTree;
           IbQrDicTowar.Locate('ID',ID,[]);
           RxDbGrid1.setfocus;
        end else begin
            {Правим товар или комплект}
            if IbQrDicTowar.FieldByName('TW_KOMPL').asstring='1' then begin
               // Комплект
              application.CreateForm(TEdit_komplekt,Edit_komplekt);
              ID:=IbQrDicTowar.FieldByName('ID').asinteger;
              Edit_komplekt.tag:=ID;
              Edit_komplekt.showmodal;
              RefreshTree;
              IbQrDicTowar.locate('ID',Edit_komplekt.tag,[]);
              Edit_komplekt.destroy;
              RxDbgrid2.setfocus;
            end else begin
               // Товар
              application.CreateForm(TEdit_tw,Edit_tw);
              ID:=IbQrDicTowar.FieldByName('ID').asinteger;
              Edit_tw.tag:=ID;
              Edit_tw.Label2.caption:=Treeview1.Selected.Text;
              Edit_tw.showmodal;
              RefreshTree;
              IbQrDicTowar.locate('ID',Edit_tw.tag,[]);
              Edit_tw.destroy;
              RxDbgrid2.setfocus;
            end;
        end;
     end;
    end;
end;

procedure TDIC_TOWAR.TreeView1Enter(Sender: TObject);
begin
     BtnCopy.enabled:=False;
     BtnOpen.enabled:=False;
     if (DicTowarSet=3) then BtnSelect.enabled:=true;
     if (DicTowarSet=4) then BtnSelect.enabled:=False;
     if (DicTowarSet=1) then begin
        BtnSelect.enabled:=False;
        BtnSelectBrak.enabled:=False;
     end;
     Select:=1;
end;

procedure TDIC_TOWAR.RxDBGrid2Enter(Sender: TObject);
begin
     Refresh_button;
     Select:=2;
     if (ibQrDicTowar.fieldByname('ID').asstring<>'')
     and (ibQrDicTowar.fieldByname('TREE').asstring<>'1') then begin
       BtnCopy.enabled:=(True and CHECK_DOSTUP('$DICTW.CAN_COPY'));
       MnCopy.enabled:=BtnCopy.enabled;
       BtnFormat1.enabled:=CAN_COPYFORMAT;
       BtnFormat2.enabled:=CAN_COPYFORMAT and CAN_COPYFORMAT2 and (IbQrDicTowar.fieldByname('ID').asinteger<>FORMAT_ID);
     end else begin
       BtnFormat1.enabled:=False;
       BtnCopy.enabled:=False;
     end;
     if (ibQrDicTowar.fieldByname('ID').asstring<>'')
     then BtnOpen.enabled:=True and TW_CAN_EDIT else BtnOpen.enabled:=False;
end;

procedure TDIC_TOWAR.BtnNewGroupClick(Sender: TObject);
begin
  if BtnNewGroup.enabled then begin
     application.createForm(TEdit_TWTree,Edit_TWTree);
     Edit_TWTree.Label3.Caption:=Treeview1.selected.text;
     Edit_TWTree.BtnApply.tag:=Treeview1.selected.stateindex;
     Edit_TWTree.tag:=-1;
     Edit_TWTree.showmodal;
     if Edit_TWTree.tag>0 then begin
           CanTreeRefresh:=false;
           inc(CntTWTREE);
           TWTree[CntTWTREE].ID:=Edit_TWTree.tag;
           TWTree[CntTWTREE].PAR:=Treeview1.Selected.StateIndex;
           TWTree[CntTWTREE].NAME:=Edit_TWTree.Edit1.text;
           TREE2:=Treeview1.items.addChild(Treeview1.Selected,TWTree[CntTWTREE].NAME);
           TREE2.stateindex:=Edit_TWTree.tag;

           if Treeview1.Selected.ImageIndex in [212, 211] then
           begin
             TREE2.imageindex:=212;
             TREE2.selectedindex:=213;
           end
           else
           begin
             TREE2.imageindex:=27;
             TREE2.selectedindex:=28;
           end;

           TWTree[CntTWTREE].USE:=true;
           TWTree[CntTWTREE].TREE:=TREE2;
           Treeview1.AlphaSort;
           Treeview1.Selected:=TREE2;
           TREE2.Expand(False);
           CanTreeRefresh:=true;
           RefreshTree;
     end;
     Edit_TWTree.destroy;
  end;
end;

procedure TDIC_TOWAR.BtnDelClick(Sender: TObject);
var
   TREE3,TREE4:TtreeNode;
   ss,NM:ansistring;
   a,ID,IDBRAK:integer;
begin
  if BtnDel.enabled then begin
     if Select=1 then begin
        {Удаление из корня Treeview1}
        if ((Treeview1.selected.stateindex=0) or (Treeview1.selected.stateindex=-1))  then Messbox('Эту группу товаров удалить нельзя!','Сообщение системы!',48) else
        if Messbox('Удалить группу товаров "'+Treeview1.selected.text+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
           if IbDelete_doc('TWTREE',Treeview1.selected.stateindex) then begin
              CanTreeRefresh:=false;
              Tree4:=Treeview1.Selected.Parent;
              Treeview1.Items.Delete(Treeview1.selected);
              TREE4.Expand(False);
              Treeview1.selected:=Tree4;
              CanTreeRefresh:=true;
              RefreshTree;
           end;
        end;
     end;
     if Select=2 then begin
        if not IbQrDicTowar.Eof then
        if IbQrDicTowar.fieldbyname('TREE').asstring='1' then begin
           {Удаление группы}
           if Messbox('Удалить подгруппу товаров "'+IbQrDicTOWAR.fieldbyname('NAME').asstring+'" вместе с подгруппами, в неё входящими?',MessSubmitDelete,4+48+256)=6 then begin
              Tree4:=Treeview1.Selected;
              ID:=IbQrDicTowar.fieldbyname('ID').asinteger;
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              if IbDelete_doc('TWTREE',ID) then begin
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
            {Удаление товара}
            if IbQrDicTowar.fieldbyname('TW_KOMPL').asinteger=1 then ss:='комплект' else ss:='товар';
            if Messbox('Удалить '+ss+' "'+IbQrDicTowar.fieldbyname('NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
              {Определяем код брака}
              IbQuery1.Close;
              IbQuery1.SQL.clear;
              IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
              IbQuery1.ParamByname('TW_ART').asinteger:=IbQrDicTowar.fieldByname('TW_ART').asinteger;
              IbQuery1.Open;
              IDBRAK:=-1;
              if not IbQuery1.eof then IDBRAK:=IbQuery1.fieldByname('TW_ID').asinteger;
              Datamodule1.IBTransaction2.Active:=False;
              Datamodule1.IBTransaction2.StartTransaction;
              IBSAVE_CLEAR;


                if IbQrDicTowar.fieldbyname('VIRTUAL').asinteger=0 then
                begin
                  IBSAVE_ADD('US_ID',USERID);
                  IBSAVE_ADD('SHOP_ID',SHOPID);
                  IBSAVE_ADD('MESS','Был запрос на удаление');
                  IBSAVE_ADD('DOP1',3); // Метка удалени
                  IBSAVE_ADD('DOP2',IbQrDicTowar.fieldbyname('ID').asinteger);
                  IBSAVE_ADD('DOC','TW'); // Название таблицы
                  IBSAVE_DOC('ARCUPDATE',-1);
                  if IbDelete_doc('TW',IbQrDicTowar.fieldbyname('ID').asinteger) then begin
                     if IDBRAK>0 then IbDelete_doc('TW',IDBRAK);

                     Datamodule1.IBTransaction2.Commit;
                     Datamodule1.IBTransaction2.Active:=False;
                     RefreshTree;
                     RxDbGrid1.setFocus;
                  end else Datamodule1.IBTransaction2.Rollback;
                Datamodule1.IBTransaction2.Active:=False;
                end;

                  if IbQrDicTowar.fieldbyname('VIRTUAL').asinteger=1 then
                  begin


                  IBSAVE_ADD('US_ID',USERID);
                  IBSAVE_ADD('SHOP_ID',SHOPID);
                  IBSAVE_ADD('MESS','Был запрос на удаление');
                  IBSAVE_ADD('DOP1',3); // Метка удалени
                  IBSAVE_ADD('DOP2',IbQrDicTowar.fieldbyname('ID').asinteger);
                  IBSAVE_ADD('DOC','TW'); // Название таблицы
                  IBSAVE_DOC('ARCUPDATE',-1);

                  try

                  IBSAVE_CLEAR;
                  Datamodule1.IbSaveSQL.SQL.Text:='DELETE FROM RELATION WHERE CHILD_ID=:CHILD_ID and RELATION_TYP=4 and parent_id=:parent_id';
                  Datamodule1.IbSaveSQL.ParamByName('CHILD_ID').asInteger:=IDBRAK;
                  Datamodule1.IbSaveSQL.ParamByName('parent_id').asInteger:= Treeview1.Selected.StateIndex;//parent_id;
                  Datamodule1.IbSaveSQL.ExecSQL;

                  Datamodule1.IbSaveSQL.ParamByName('CHILD_ID').asInteger:=IbQrDicTowar.fieldbyname('ID').asinteger;
                  Datamodule1.IbSaveSQL.ParamByName('parent_id').asInteger:= Treeview1.Selected.StateIndex;//parent_id;                  
                  Datamodule1.IbSaveSQL.ExecSQL;
                  Datamodule1.IBTransaction2.Commit;
                  Datamodule1.IBTransaction2.Active:=False;
                  RefreshTree;
                  RxDbGrid1.setFocus;
                  except
                   Datamodule1.IBTransaction2.Rollback;
                  end;
                  Datamodule1.IBTransaction2.Active:=False;
                  end;

             end;
        end;
       end;
//     end;
  end;
end;

procedure TDIC_TOWAR.BtnMoveClick(Sender: TObject);
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
     //курсор в дереве, перемещение папки
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
                  if (((Tree1.ImageIndex=27) and (tree2.ImageIndex=212)) or
                  ((Tree1.ImageIndex=212) and (tree2.ImageIndex=27)))
                   then  //перемещение постоянной папки в виртуальную. запрет.
                   begin
                    //Создание массовых ссылок
                    try
                    DataModule1.IbSaveSQL.Close;
                    DataModule1.IbSaveSQL.SQL.Text:='SELECT RES FROM COPY_TW_TO_VIRTUAL(:FROM_TWTREE_ID, :TO_TWTREE_ID)';
                    DataModule1.IbSaveSQL.ParamByName('FROM_TWTREE_ID').asinteger:=Tree1.stateindex;
                    DataModule1.IbSaveSQL.ParamByName('TO_TWTREE_ID').asinteger:=Tree2.stateindex;

                    DataModule1.IbSaveSQL.open;
                    a:=DataModule1.IbSaveSQL.fieldbyname('res').asinteger;
                    DataModule1.IbSaveSQL.Transaction.Commit;

                    Messbox('В виртуальный каталог скопировано '+inttostr(round(a/2))+'товаров' ,MessSystem,0);


                    except
                    on e: Exception do
                    begin
                      messbox(e.message, 'Exception', 0);
                    DataModule1.IbSaveSQL.Transaction.Rollback;
                    end;
                    end;                    
                   end

//                    Messbox('Нельзя перемещать папки из обычного каталога в виртуальный и наоборот.',MessError,48)
                    else begin

                     {Осуществляем перемешение}
                     Datamodule1.IBTransaction2.Active:=False;
                     Datamodule1.IBTransaction2.StartTransaction;
                     try
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                        ID:=IBSAVE_DOC('TWTREE',Tree1.stateindex);
                        Datamodule1.IBTransaction2.Commit;
                        if ID>0 then begin
                           {Осуществляем перемещение в дереве}
                           if Tree2.StateIndex=0 then Tree3:=Root else
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
             end;
             RefreshTree;
          end;
       end;
       //Курсор в таблице, перемещение товара или папки, в зависимости от TAG..
       If Select=2 then
          if not IbQrDicTowar.Eof then begin
          MOVE_TREE.showmodal;
          if MOVE_TREE.tag>-1 then begin
           if IbQrDicTOWAR.fieldbyname('TREE').asstring='1' then begin
             for a:=1 to CntTWTREE do if TWTree[a].ID=IbQrDicTowar.fieldbyname('ID').asinteger then Tree1:=TWTree[a].TREE;
             Tree2:=MOVE_TREE.Treeview1.Selected;
             if Tree1.stateindex=0 then Messbox('Корневую папку переместить нельзя!',MessError,48) else begin
                if IsParent(Tree1,Tree2) then Messbox('Выбранное перемещение осуществлено быть не может, т.к. вызовет "зацикливание"',MessError,48) else begin
                  if (((Tree1.ImageIndex=27) and (tree2.ImageIndex=212)) or
                  ((Tree1.ImageIndex=212) and (tree2.ImageIndex=27)))
                   then
                   BEGIN
                    //Создание массовых ссылок  \
                    try
                    DataModule1.IbSaveSQL.Close;
                    DataModule1.IbSaveSQL.SQL.Text:='SELECT RES FROM COPY_TW_TO_VIRTUAL(:FROM_TWTREE_ID, :TO_TWTREE_ID)';
                    DataModule1.IbSaveSQL.ParamByName('FROM_TWTREE_ID').asinteger:=Tree1.stateindex;
                    DataModule1.IbSaveSQL.ParamByName('TO_TWTREE_ID').asinteger:=Tree2.stateindex;

                    DataModule1.IbSaveSQL.Open;
                    a:=DataModule1.IbSaveSQL.fieldbyname('res').asinteger;
                    DataModule1.IbSaveSQL.Transaction.Commit;

                    Messbox('В виртуальный каталог скопировано '+inttostr(round(a/2))+'товаров' ,MessSystem,0);


                    except
                    on e: Exception do
                    begin
                      messbox(e.message, 'Exception', 0);
                    DataModule1.IbSaveSQL.Transaction.Rollback;
                    end;
                    end;

                   END//перемещение постоянной папки в виртуальную. запрет.
//                    Messbox('Нельзя перемещать папки из обычного каталога в виртуальный и наоборот.',MessError,48)
                    else begin

                     {Осуществляем перемешение}
                     Datamodule1.IBTransaction2.Active:=False;
                     Datamodule1.IBTransaction2.StartTransaction;
                     try
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('PARENT_ID',Tree2.stateindex);
                        ID:=IBSAVE_DOC('TWTREE',Tree1.stateindex);
                        if ID>0 then begin
                           {Осуществляем перемещение в дереве}
                           if Tree2.StateIndex=0 then Tree3:=Root else
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
             end;
             RefreshTree;
{Перемещение товара.
если из стат каталога в стат каталог - делать по старому

если из стат каталога в виртуальны - делать ссылку
если из вирт каталога в стат - заругаться и ничего не делать
если из вирт каталога в вирт каталог - сделать изменение ссылки

удаление из стат каталога - сделать также  удаление из ссылок
удаление из ссылок - удалить ссылку.

}

           end else begin
             if MOVE_TREE.tag=0 then messbox('Нельзя поместить товар в корневой каталог. Выберите какой-нибудь раздел!',MessSystem,48)
              else
              if ((MOVE_TREE.Treeview1.Selected.ImageIndex=27) and (IbQrDictowar.FieldByName('VIRTUAL').asInteger=1)) then
                  messbox('Нельзя поместить товар в из виртуального каталога в статический.',MessSystem,48) else
                begin
                   {Перемещяем Товар}
                   {Определяем код брака}
                   IbQuery1.Close;
                   IbQuery1.SQL.clear;
                   IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
                   IbQuery1.ParamByname('TW_ART').asinteger:=IbQrDicTowar.fieldByname('TW_ART').asinteger;
                   IbQuery1.Open;
                   IDBRAK:=IbQuery1.fieldByname('TW_ID').asinteger;
                   Tree2:=MOVE_TREE.Treeview1.Selected;
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   {Перемещение внутри стат. каталога}
                   if ((Tree2.ImageIndex=27) and (IbQrDictowar.FieldByName('VIRTUAL').asInteger=0)) then
                   begin
                     try
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('TWTREE_ID',Tree2.stateindex);
                        ID:=IBSAVE_DOC('TW',IDBRAK);
                        IBSAVE_ADD('TWTREE_ID',Tree2.stateindex);
                        ID:=IBSAVE_DOC('TW',IbQrDicTowar.fieldbyname('ID').asinteger);
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('US_ID',USERID);
                        IBSAVE_ADD('SHOP_ID',SHOPID);
                        IBSAVE_ADD('MESS','Перемещен в группу "'+Tree2.text+'"');
                        IBSAVE_ADD('DOP1',2); // Метка изменени
                        IBSAVE_ADD('DOP2',IbQrDicTowar.fieldbyname('ID').asinteger);
                        IBSAVE_ADD('DOC','TW'); // Название таблицы
                        IBSAVE_DOC('ARCUPDATE',-1);
                        Datamodule1.IBTransaction2.Commit;
                        Datamodule1.IBTransaction2.Active:=False;
                        if ID>0 then begin
                           {Осуществляем перемещение в дереве}
                           if Tree2.StateIndex=0 then Tree3:=Root else
                           for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
                           Treeview1.Selected:=Tree3;
                           RefreshTree;
                           IbQrDicTowar.locate('ID',ID,[]);
                           RxDbGrid1.setFocus;
                        end;
                     except
                           Datamodule1.IBTransaction2.Rollback;
                     end;
                     Datamodule1.IBTransaction2.Active:=False;
                   end;

                   {Перемещение внутри виртуального каталога}
                   if ((Tree2.ImageIndex=212) and (IbQrDictowar.FieldByName('VIRTUAL').asInteger=1)) then
                   begin
                     try

                        DataModule1.IbSaveSQL.Close;
                        DataModule1.IbSaveSQL.SQL.Text:='UPDATE RELATION SET PARENT_ID=:PARENT_ID where CHILD_ID=:CHILD_ID AND RELATION_TYP=4 and parent_id=:parent_old_id';
                        DataModule1.IbSaveSQL.ParamByName('PARENT_ID').asinteger:=Tree2.stateindex;
                        DataModule1.IbSaveSQL.ParamByName('PARENT_old_ID').asinteger:=Treeview1.Selected.StateIndex;//parent_id;;
                        DataModule1.IbSaveSQL.ParamByName('CHILD_ID').asinteger:=IDBRAK;
                        DataModule1.IbSaveSQL.ExecSQL;


                        DataModule1.IbSaveSQL.ParamByName('PARENT_ID').asinteger:=Tree2.stateindex;
                        DataModule1.IbSaveSQL.ParamByName('CHILD_ID').asinteger:=IbQrDicTowar.fieldbyname('ID').asinteger;
                        DataModule1.IbSaveSQL.ParamByName('PARENT_old_ID').asinteger:=Treeview1.Selected.StateIndex;//parent_id;;                        
                        DataModule1.IbSaveSQL.ExecSQL;

                        IBSAVE_CLEAR;
                        IBSAVE_ADD('US_ID',USERID);
                        IBSAVE_ADD('SHOP_ID',SHOPID);
                        IBSAVE_ADD('MESS','Перемещен в виртуальную "'+Tree2.text+'"');
                        IBSAVE_ADD('DOP1',2); // Метка изменени
                        IBSAVE_ADD('DOP2',IbQrDicTowar.fieldbyname('ID').asinteger);
                        IBSAVE_ADD('DOC','TW'); // Название таблицы
                        ID:=IBSAVE_DOC('ARCUPDATE',-1);
                        Datamodule1.IBTransaction2.Commit;
                        Datamodule1.IBTransaction2.Active:=False;
                        if ID>0 then begin
                           {Осуществляем перемещение в дереве}
                           if Tree2.StateIndex=0 then Tree3:=Root else
                           for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
                           Treeview1.Selected:=Tree3;
                           RefreshTree;
                           IbQrDicTowar.locate('ID',ID,[]);
                           RxDbGrid1.setFocus;
                        end;
                     except
                           Datamodule1.IBTransaction2.Rollback;
                     end;
                     Datamodule1.IBTransaction2.Active:=False;
                   end;

                   {Перемещение из статического каталога в виртуальный. НЕОБХОДИМ КОНТРОЛЬ ДУБЛИРОВАНИЯ!!!!! будет на уровне изключения из базы!}
                   if ((Tree2.ImageIndex=212) and (IbQrDictowar.FieldByName('VIRTUAL').asInteger=0)) then
                   begin
                     IbQuery1.Close;
                     IbQuery1.SQL.clear;
                     IbQuery1.SQL.add('select relation_id from relation where relation_typ=4 and child_id=:child_id and parent_id=:parent_id');
                     IbQuery1.ParamByname('child_id').asinteger:=IbQrDicTowar.fieldbyname('ID').asinteger;
                     IbQuery1.ParamByname('parent_id').asinteger:=Treeview1.Selected.StateIndex;//parent_id;;
                     IbQuery1.Open;

                     if not IbQuery1.Eof then
                      ID:=1
                     else
                      ID:=0;

                     IbQuery1.Close;



                     if ID > 0 then //товар уже Есть в RELATION с типом 4
                        messbox('Такой товар уже есть в виртуальном каталоге',MessSystem,48) else
                      begin


                       try
                          IBSAVE_CLEAR;

                          IBSAVE_ADD('PARENT_ID', Tree2.stateindex);
                          IBSAVE_ADD('CHILD_ID', IDBRAK);
                          IBSAVE_ADD('RELATION_TYP', 4);
                          ID:=IBSAVE_DOC('RELATION', -1);

                          IBSAVE_CLEAR;
                          IBSAVE_ADD('PARENT_ID', Tree2.stateindex);
                          IBSAVE_ADD('CHILD_ID', IbQrDicTowar.fieldbyname('ID').asinteger);
                          IBSAVE_ADD('RELATION_TYP', 4);
                          ID:=IBSAVE_DOC('RELATION', -1);



                          IBSAVE_CLEAR;
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Перемещен в виртуальную группу "'+Tree2.text+'"');
                          IBSAVE_ADD('DOP1',2); // Метка изменени
                          IBSAVE_ADD('DOP2',IbQrDicTowar.fieldbyname('ID').asinteger);
                          IBSAVE_ADD('DOC','TW'); // Название таблицы
                          ID:=IBSAVE_DOC('ARCUPDATE',-1);
                          Datamodule1.IBTransaction2.Commit;
                          Datamodule1.IBTransaction2.Active:=False;
                          if ID>0 then begin
                             {Осуществляем перемещение в дереве}
                             if Tree2.StateIndex=0 then Tree3:=Root else
                             for a:=1 to CntTWTREE do if TWTree[a].ID=Tree2.StateIndex then Tree3:=TWTree[a].TREE;
                             Treeview1.Selected:=Tree3;
                             RefreshTree;
                             IbQrDicTowar.locate('ID',ID,[]);
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
          end;
       end;
       MOVE_TREE.Destroy;
     end;
  end;
end;

procedure TDIC_TOWAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IbTrTWTREE.Active:=false;
     FastInfoTransaction.Active:=false;

     Treeview1.tag:=0;
end;

procedure TDIC_TOWAR.FormKeyPress(Sender: TObject; var Key: Char);
var
   s:ansistring;
   Key2:Char;
begin
     if (key=#8) and (btnUp.enabled) then begin
        key:=#0;
        BtnUp.click;
     end;
     if ((key=' ') or (key='+')) then begin
        key:=#0;
        Timer1.enabled:=True;
     end;
     if (key>='0') and (key<='9') then begin
        FIND_TOWAR_123.MaskEdit1.text:=Key;
        Btn_Find123.click;
        Key:=#0;
     end;
     s:=AnsiUpperCase(Key);
     Key2:=s[1];
     if ((key2>='А') and (key2<='Я')) or ((key2>='A') and (key2<='Z')) then begin
        FIND_TOWAR_ABC.Edit1.text:=Key;
        Btn_FindABC.click;
        Key:=#0;
     end;
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_TOWAR.Btn_Find123Click(Sender: TObject);
var
   ID,IDTREE:integer;
   a,b:integer;
begin
     Find_Towar_123.showmodal;
     if Find_Towar_123.tag>0 then begin
        {Начинаем искать}
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select TW_ID,TWTREE_ID FROM TW WHERE TW_ART=:TW_ART and TW_BRAK="1"');
        IbQuery1.ParamByname('TW_ART').asinteger:=strtoint(trim(Find_Towar_123.MaskEdit1.text));
        IbQuery1.Open;
        if IbQuery1.eof then Messbox('В базе данных нет товара с кодом "'+inttostr(IbQuery1.ParamByname('TW_ART').asinteger)+'"!',MessSystem,48)
        else begin
             ID:=IbQuery1.fieldbyname('TW_ID').asinteger;
             IDTREE:=IbQuery1.fieldbyname('TWTREE_ID').asinteger;
             {Позиционируемся на дерево}
             Tree3:=Root;

             if IDTREE=1000 then
              Tree3:=roznNewTree
             else
              for a:=1 to CntTWTREE do if TWTree[a].ID=IDTREE then Tree3:=TWTree[a].TREE;
             CanTreeRefresh:=False;
             Treeview1.Selected:=Tree3;
             CanTreeRefresh:=True;
             RefreshTree;
             IbQrDicTowar.locate('TW_ART',IbQuery1.ParamByname('TW_ART').asinteger,[]);
             RxDbGrid2.setFocus;
        end;
        IbQuery1.Close;
     end;
end;

procedure TDIC_TOWAR.Btn_FindABCClick(Sender: TObject);
var
   ART,ID,IDTREE:integer;
   a,b:integer;
begin
     Find_Towar_ABC.showmodal;
     if Find_Towar_ABC.tag>0 then begin
        {Начинаем искать}
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select TW_ID,TW_ART,TWTREE_ID FROM TW WHERE TW_ID=:TW_ID');
        IbQuery1.ParamByname('TW_ID').asinteger:=Find_Towar_ABC.tag;
        IbQuery1.Open;
        if IbQuery1.eof then Messbox('В базе товар не обнаружен!',MessSystem,48)
        else begin
             ID:=IbQuery1.fieldbyname('TW_ID').asinteger;
             IDTREE:=IbQuery1.fieldbyname('TWTREE_ID').asinteger;
             ART:=IbQuery1.fieldbyname('TW_ART').asinteger;
             {Позиционируемся на дерево}
             CanTreeRefresh:=False;
             Tree3:=Root;
             for a:=1 to CntTWTREE do if TWTree[a].ID=IDTREE then Tree3:=TWTree[a].TREE;
             Treeview1.Selected:=Tree3;
             CanTreeRefresh:=True;
             RefreshTree;
             IbQrDicTowar.locate('TW_ART',ART,[]);
             RxDbGrid2.setFocus;
        end;
        IbQuery1.Close;
     end;
end;

procedure TDIC_TOWAR.Refresh_button;
var
   TREE:integer;
   CAN:boolean;
begin
  if IbQrDicTowar.fieldbyname('TREE').asstring='' then begin
        CAN:=false;
        Btn_Print.enabled:=CAN;
        MnPrint.enabled:=CAN;
        BtnCopy.enabled:=CAN and CAN_COPY;
        BtnFormat1.enabled:=CAN and CAN_COPYFORMAT;
        BtnFormat2.enabled:=False;
        MnCopy.enabled:=CAN and CAN_COPY;
        Btn_DETAL.enabled:=CAN and CAN_DETAL;
        MnDETAL.enabled:=CAN and CAN_DETAL;
        Btn_Analiz.enabled:=CAN and CAN_ANALIZ;
        MnAnaliz.enabled:=CAN and CAN_ANALIZ;
        Btn_Marketing.enabled:=CAN and CAN_MARKETING;
        MnMarket.enabled:=CAN and CAN_MARKETING;
        BtnADM.enabled:=CAN and ADM_TW;
        BtnNew.enabled:=TW_CAN_CREATE;
        BtnNewGROUP.enabled:=CAN and TW_CAN_CREATE;
        BtnOPEN.enabled:=CAN and TW_CAN_EDIT;
        BtnMOVE.enabled:=CAN and TW_CAN_EDIT;
        BtnDEL.enabled:=CAN and TW_CAN_DELETE;
  end else begin
    if ibQrDicTowar.fieldByname('ID').asstring<>'' then begin
        TREE:=IbQrDicTowar.fieldbyname('TREE').asinteger;
        if TREE=1 then CAN:=false else CAN:=true;
        BtnNew.enabled:=TW_CAN_CREATE;
        BtnNewGROUP.enabled:=TW_CAN_CREATE;
        BtnOPEN.enabled:=TW_CAN_EDIT;
        BtnMOVE.enabled:=TW_CAN_EDIT;
        BtnDEL.enabled:=TW_CAN_DELETE;
        Btn_Print.enabled:=CAN;
        MnPrint.enabled:=CAN;
        BtnCopy.enabled:=CAN and CAN_COPY;
        BtnFormat1.enabled:=CAN and CAN_COPYFORMAT;
        BtnFormat2.enabled:=CAN and CAN_COPYFORMAT and CAN_COPYFORMAT2 and (IbQrDicTowar.fieldByname('ID').asinteger<>FORMAT_ID);
        MnCopy.enabled:=CAN and CAN_COPY;
        Btn_DETAL.enabled:=CAN and CAN_DETAL;
        MnDETAL.enabled:=CAN and CAN_DETAL;
        Btn_Analiz.enabled:=CAN and CAN_ANALIZ;
        MnAnaliz.enabled:=CAN and CAN_ANALIZ;
        Btn_Marketing.enabled:=CAN and CAN_MARKETING;
        MnMarket.enabled:=CAN and CAN_MARKETING;
        if (DicTowarSet=1) then begin
           if (TREE=1) then BtnSelect.enabled:=False
                       else BtnSelect.enabled:=True;
           if (TREE=1) then BtnSelectBrak.enabled:=False
                       else BtnSelectBrak.enabled:=True;
        end;
        if (DicTowarSet=3) then begin
           if (TREE=1) then BtnSelect.enabled:=True
                       else BtnSelect.enabled:=False;
           BtnSelectBrak.enabled:=False;
        end;
        if (DicTowarSet=4) then begin
           if (ibQrDicTowar.fieldByname('ID').asstring<>'')
           and (ibQrDicTowar.fieldByname('TREE').asstring<>'1') then BtnSelect.enabled:=True
           else BtnSelect.enabled:=False;
        end;
        if (DicTowarSet=3) then begin
         if ((ibQrDicTowar.fieldByname('ID').asstring<>'')
         and (ibQrDicTowar.fieldByname('TREE').asstring='1')) then BtnSelect.enabled:=True
                                                            else BtnSelect.enabled:=False;
        end;
        BtnADM.enabled:=CAN and ADM_TW;
     end
     else begin
         BtnSelect.enabled:=False;
         BtnSelectBrak.enabled:=False;
     end;
  end;
  if Treeview1.Items.count=1 then BtnNewGROUP.enabled:=TW_CAN_CREATE;
end;

procedure TDIC_TOWAR.Btn_DETALClick(Sender: TObject);
begin
  show_detal_tw(IbQrDicTowar.fieldbyname('ID').asinteger);
end;

procedure TDIC_TOWAR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=192 then begin
        key:=0;
        BtnMode.click;
     end;
     if (key=113) and (Btn_DETAL.enabled) then Btn_DETAL.click; {F2}
     if (key=114) and (Btn_ANALIZ.enabled) then Btn_ANALIZ.click; {F3}
     if (key=115) and (Ssshift in Shift) and (Btn_MARKETING.enabled) then Btn_MARKETING.click; {F4}
end;

procedure TDIC_TOWAR.Btn_ANALIZClick(Sender: TObject);
begin
     SHOW_ANALIZ_TW(IbQrDicTowar.fieldbyname('ID').asinteger);
end;

procedure TDIC_TOWAR.Btn_MARKETINGClick(Sender: TObject);
begin
     Show_MARKETING_TW(IbQrDicTowar.fieldbyname('ID').asinteger);
end;

procedure TDIC_TOWAR.BtnSelectClick(Sender: TObject);
begin
     if DicTowarSet=1 then begin
       Application.createForm(TSET_KOLVO,SET_KOLVO);
       SET_KOLVO.NAME.text:=IbQrDicTowar.fieldByname('TW_ART').asstring+'-'+
                            IbQrDicTowar.fieldByname('NAME').asstring;
       SET_KOLVO.showModal;
       if SET_KOLVO.tag>0 then begin
          if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
          inc(CNT_TW);
          ARR_TW[CNT_TW].ID:=IbQrDicTowar.fieldByname('ID').asinteger;
          ARR_TW[CNT_TW].KOL:=SET_KOLVO.KOL.value;
          DIC_TOWAR.caption:='Справочник товаров. Набор списка товаров. Отобрано '+
          inttostr(CNT_TW)+
          OKON_CHAR(' наименование товара',' наименования товаов',' наименований товаров',CNT_TW);
       end;
       SET_KOLVO.Destroy;
     end;

     if DicTowarSet=5 then
     begin  //Выбор группы товаров без указания количества
          inc(CNT_TW);
          ARR_TW[CNT_TW].ID:=IbQrDicTowar.fieldByname('ID').asinteger;
          ARR_TW[CNT_TW].KOL:=1;
          DIC_TOWAR.caption:='Справочник товаров. Набор списка товаров. Отобрано '+
          inttostr(CNT_TW)+
          OKON_CHAR(' наименование товара',' наименования товаов',' наименований товаров',CNT_TW);

     end;


     if DictowarSet=4 then begin
            {Выбор одного товара}
            tag:=IbQrDicTowar.fieldbyname('ID').asinteger;
            SELECT_ART:=IbQrDicTowar.fieldbyname('TW_ART').asinteger;
            close;
     end;
     if DicTowarSet=3 then begin
        {Выбор группы};
        if Select=1 then begin
           tag:=Treeview1.selected.stateindex;
           close;
        end else begin
          if IbQrDicTowar.FieldByName('TREE').asstring='1' then begin
             tag:=IbQrDicTowar.fieldbyname('ID').asinteger;
             close;
          end;
        end;
     end;
end;

procedure TDIC_TOWAR.BtnSelectBrakClick(Sender: TObject);
begin
     if DicTowarSet=1 then begin
       {Определяем код брака}
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
       IbQuery1.ParamByname('TW_ART').asinteger:=IbQrDicTowar.fieldByname('TW_ART').asinteger;
       IbQuery1.Open;
       if not IbQuery1.eof then begin
          Application.createForm(TSET_KOLVO,SET_KOLVO);
          SET_KOLVO.NAME.text:=IbQrDicTowar.fieldByname('TW_ART').asstring+'-Брак.'+
                            IbQrDicTowar.fieldByname('NAME').asstring;
          SET_KOLVO.showModal;
          if SET_KOLVO.tag>0 then begin
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             inc(CNT_TW);
             ARR_TW[CNT_TW].ID:=IbQuery1.fieldByname('TW_ID').asinteger;
             ARR_TW[CNT_TW].KOL:=SET_KOLVO.KOL.value;
             DIC_TOWAR.caption:='Справочник товаров. Набор списка товаров. Отобрано '+
             inttostr(CNT_TW)+
             OKON_CHAR(' наименование товара',' наименования товаов',' наименований товаров',CNT_TW);
          end;
          SET_KOLVO.Destroy;
       end else Messbox('Бракованный товар в каталоге не обнаружен!',MessAdm,48);
       IbQuery1.Close;
     end;

     if DicTowarSet=5 then
     begin  //Выбор группы товаров без указания количества
          {Определяем код брака}
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
       IbQuery1.ParamByname('TW_ART').asinteger:=IbQrDicTowar.fieldByname('TW_ART').asinteger;
       IbQuery1.Open;
       if not IbQuery1.eof then
       begin
          inc(CNT_TW);
          ARR_TW[CNT_TW].ID:=IbQuery1.fieldByname('TW_ID').asinteger;
          ARR_TW[CNT_TW].KOL:=1;
          DIC_TOWAR.caption:='Справочник товаров. Набор списка товаров. Отобрано '+
          inttostr(CNT_TW)+
          OKON_CHAR(' наименование товара',' наименования товаов',' наименований товаров',CNT_TW);
       end;

     end;


end;

procedure TDIC_TOWAR.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
var
   a:integer;
   ID:integer;
begin
     if (key=#13) then begin
        RxDBGrid2DblClick(Sender);
     end;
     if (key=#10) then begin
      if not IbQrDicTowar.Eof then begin
        if IbQrDicTowar.fieldbyname('TREE').asinteger=1 then begin
        end else begin
            if BtnSelectBrak.enabled then BtnSelectBrak.Click;
        end;
      end;
     end;
end;

procedure TDIC_TOWAR.RxDBGrid2DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid2.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDIC_TOWAR.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   RxDbGrid2.Canvas.Brush.color:=clWindow;
   RxDbGrid2.Canvas.Font.color:=clWindowText;
   if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TREE').Asstring<>'' then begin

     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOMPL').Asstring='1' then
       RxDbGrid2.Canvas.Font.Style:=[FsBold]
       else RxDbGrid2.Canvas.Font.Style:=[];

     // Выделяем товар с особенными ценами
     RxDbGrid2.Canvas.Font.Color:=clWindowText;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
     (Column.Field.FullName='TW_MROZ_NOW') then begin
        RxDbGrid2.Canvas.Brush.color:=$009FFF9F;
        RxDbGrid2.Canvas.Font.Style:=[FsBold];
        RxDbGrid2.Canvas.Font.Color:=ClGreen;
     end;

     if (Column.Field.FullName='OST2_ALL') then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST2_ALL').asFloat>0   then
                RxDbGrid2.Canvas.Brush.color:=$006060FF;
     end;

     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TREE').Asstring='1' then begin
        RxDbGrid2.Canvas.Brush.color:=clBtnFace;
     end else begin
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
             if Column.Field.FullName='TW_ART' then RxDbGrid2.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
       end;
     end;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='TW_ART' then RxDbGrid2.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
     end;
     if (GdSelected in State ) and (RxDbgrid2.focused) then begin
           RxDbGrid2.Canvas.Brush.color:=clHighlight;
           RxDbGrid2.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='TW_ART' then RxDbGrid2.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
           end;
           RxDbGrid2.Canvas.Brush.color:=clHighlight;
           // Выделяем товар с особенными ценами
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
                (Column.Field.FullName='TW_MROZ_NOW') then begin
                RxDbGrid2.Canvas.Brush.color:=ClGreen;
                RxDbGrid2.Canvas.Font.Style:=[FsBold];
                RxDbGrid2.Canvas.Font.Color:=$009FFF9F;
           end;
     end;
     if Column.Index>4 then
        RxDbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin



     if Column.Field.FullName='MET_SERT'then begin {Сертификат}
           RxDbGrid2.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_SERT').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbGrid2.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           214,True);
        end;
     end;
{
  Добавить индикаторы: печать в прайс листе, скидки не действуют
}


     if Column.Field.FullName='MET_NO_SKID' then begin {скидки}
           RxDbGrid2.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_NO_SKID').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbGrid2.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           210,True);
        end;
     end;
     if Column.Field.FullName='MET_PRICE_PRINT' then  begin {прайс}
           RxDbGrid2.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_PRICE_PRINT').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbGrid2.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           26,True);
        end;
     end;

     if Column.Field.FullName='MET_INTERNET' then  begin {интернет}
           RxDbGrid2.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_INTERNET').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbGrid2.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           32,True);
        end;
     end;

     if Column.Field.FullName='MET_OPT' then  begin {интернет}
           RxDbGrid2.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_OPT').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbGrid2.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           75,True);
        end;
     end;

    end;
   end else RxDbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TDIC_TOWAR.Timer1Timer(Sender: TObject);
begin
  Try



     Timer1.enabled:=False;

//     begin


     QrFastInfo.close;
     FastInfoTransaction.Active:=False;
     QrFastInfo.Open;

     {Определяем кол-во}

     QrFastInfo.disablecontrols;
     QrFastInfo.locate('VID_ID',1,[]);
     OST2.value:=QrFastInfo.fieldByname('F1').asfloat+
     QrFastInfo.fieldByname('F2').asfloat+QrFastInfo.fieldByname('F3').asfloat+
     QrFastInfo.fieldByname('F4').asfloat+QrFastInfo.fieldByname('F5').asfloat+
     QrFastInfo.fieldByname('F6').asfloat+QrFastInfo.fieldByname('F7').asfloat+
     QrFastInfo.fieldByname('F8').asfloat+QrFastInfo.fieldByname('F9').asfloat+
     QrFastInfo.fieldByname('F10').asfloat+QrFastInfo.fieldByname('F11').asfloat+
     QrFastInfo.fieldByname('F12').asfloat+QrFastInfo.fieldByname('F13').asfloat+
     QrFastInfo.fieldByname('F14').asfloat+QrFastInfo.fieldByname('F15').asfloat+
     QrFastInfo.fieldByname('F16').asfloat+QrFastInfo.fieldByname('F17').asfloat+
     QrFastInfo.fieldByname('F18').asfloat+QrFastInfo.fieldByname('F19').asfloat+
     QrFastInfo.fieldByname('F20').asfloat;
     QrFastInfo.locate('VID_ID',2,[]);
     OST3.value:=QrFastInfo.fieldByname('F1').asfloat+
     QrFastInfo.fieldByname('F2').asfloat+QrFastInfo.fieldByname('F3').asfloat+
     QrFastInfo.fieldByname('F4').asfloat+QrFastInfo.fieldByname('F5').asfloat+
     QrFastInfo.fieldByname('F6').asfloat+QrFastInfo.fieldByname('F7').asfloat+
     QrFastInfo.fieldByname('F8').asfloat+QrFastInfo.fieldByname('F9').asfloat+
     QrFastInfo.fieldByname('F10').asfloat+QrFastInfo.fieldByname('F11').asfloat+
     QrFastInfo.fieldByname('F12').asfloat+QrFastInfo.fieldByname('F13').asfloat+
     QrFastInfo.fieldByname('F14').asfloat+QrFastInfo.fieldByname('F15').asfloat+
     QrFastInfo.fieldByname('F16').asfloat+QrFastInfo.fieldByname('F17').asfloat+
     QrFastInfo.fieldByname('F18').asfloat+QrFastInfo.fieldByname('F19').asfloat+
     QrFastInfo.fieldByname('F20').asfloat;
     OST1.value:=OST2.value+OST3.value;

     QrFastInfo.first;
     QrFastInfo.Enablecontrols;
//     end;


  {   if CheckBox1.Checked then
     	begin
         RXDbGrid3.Visible:=true;
	     QrShopFastInfo.close;
         QrShopFastInfo.ParamByName('TW_ID').asinteger:= IbQrDicTowar.FieldByName('ID').asinteger;
         QrShopFastInfo.ParamByName('SHOP_ID').asinteger:= strtoint(Shop.Value);


    	 FastInfoTransaction.Active:=False;
         QrShopFastInfo.Active:=true;
	     QrShopFastInfo.Open;

        end;
   }

  Except
  	on e: Exception do
    	msgbox('Exception', e.message, 0);
  End;
end;

procedure TDIC_TOWAR.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname=SHOW_COLUMN then begin
       Afont.color:=clHighlighttext;
       Background:=clHighlight;
     end;
end;

procedure TDIC_TOWAR.Btn_PRINTClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(IbQrDicTowar.fieldbyname('ID').asinteger,DEFAULT_SKLAD);
     PRINT_CENNIK;
     if Messbox('Напечатать ценник на бракованный товар?',MessSystem,4+48+256)=6 then begin
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
       IbQuery1.ParamByname('TW_ART').asinteger:=IbQrDicTowar.fieldByname('TW_ART').asinteger;
       IbQuery1.Open;
       if not IbQuery1.eof then begin
          CLEAR_CENNIK;
          ADD_CENNIK(IbQuery1.fieldbyname('TW_ID').asinteger,DEFAULT_SKLAD);
          PRINT_CENNIK;
       end;
       IbQuery1.Close;
     end;
end;

procedure TDIC_TOWAR.BtnCopyClick(Sender: TObject);
var
   NEW_ART:integer;
begin
     if Messbox('Создать копию товара "'+IbQrDictowar.fieldByname('TW_ART').asstring+': '+
     IbQrDictowar.fieldByname('NAME').asstring+'" ?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_tw( :TW_ART )');
           DataModule1.IbSaveSQL.ParamByname('TW_ART').asinteger:=IbQrDictowar.fieldByname('TW_ART').asinteger;
           try
              DataModule1.IbSaveSQL.open;
              NEW_ART:=DataModule1.IbSaveSQL.fieldByname('NEW_TW_ART').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              RefreshTree;
              IbQrDictowar.locate('TW_ART',NEW_ART,[]);
              RxDbgrid2.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
     end;
end;

procedure TDIC_TOWAR.BtnHistoryClick(Sender: TObject);
begin
     SHOW_HISTORY_DOC('Товар '+IbQrDictowar.fieldByname('TW_ART').asstring+' '+IbQrDictowar.fieldByname('NAME').ASSTRING,'TW',IbQrDictowar.fieldByname('ID').asinteger);
end;

procedure TDIC_TOWAR.BtnModeClick(Sender: TObject);
var
   OLDID:integer;
begin
     inc(DICTW_MODE);
     if DICTW_MODE>2 then DICTW_MODE:=1;
     BtnMode.ImageIndex:=60+DICTW_MODE;
     delay(10);
     CanTreeRefresh:=True;
     OLDID:=IbQrDictowar.fieldByname('ID').asinteger;
     RefreshTree;
     IbQrDictowar.locate('ID',OLDID,[]);
     RxDbgrid2.setfocus;
end;

procedure TDIC_TOWAR.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDIC_TOWAR.CheckBox1Click(Sender: TObject);
begin
     SKL.enabled:=CheckBox1.checked;
     RefreshTree;
end;

procedure TDIC_TOWAR.SKLChange(Sender: TObject);
begin
     RefreshTree;
end;

procedure TDIC_TOWAR.BtnAdmClick(Sender: TObject);
var
   a,ID,IDBRAK:integer;
   r:double;
begin
  Application.createForm(TADMIN_TW,ADMIN_TW);
  ADMIN_TW.NUM.value:=IbQrDicTowar.fieldbyname('TW_ART').asinteger;
  ADMIN_TW.showModal;
  if ADMIN_TW.tag>0 then begin
     {Изменяем данные}
     // Проверить, нет ли такого товара
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select tw_id from tw where tw_art=:tw_art');
     QueryWork.ParamByname('TW_ART').asinteger:=trunc(ADMIN_TW.NUM.value);
     QueryWork.Open;
     if not QueryWork.eof then Messbox('Невозможно изменить артикул на '+inttostr(trunc(ADMIN_TW.NUM.value))+'. Такой артикул уже используется!',MessSystem,48)
     else begin
       ID:=IbQrDicTowar.fieldbyname('ID').asinteger;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
          Datamodule1.IbSaveSQL.SQL.clear;
          Datamodule1.IbSaveSQL.SQL.add('UPDATE TW set TW_ART=:NEW_ART where TW_ART=:TW_ART');
          Datamodule1.IbSaveSQL.Parambyname('NEW_ART').asinteger:=Round(ADMIN_TW.NUM.value);
          Datamodule1.IbSaveSQL.Parambyname('TW_ART').asinteger:=IbQrDicTowar.fieldbyname('TW_ART').asinteger;
          Datamodule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Messbox('Ошибка при изменении артикула!',MessSystem,48);
         Datamodule1.IBTransaction2.Rollback;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       // Обновляем
       RefreshTree;
       IbQrDicTowar.locate('ID',ID,[]);
     end;
  end;
  ADMIN_TW.destroy;
end;

procedure TDIC_TOWAR.ToolButton6Click(Sender: TObject);
begin
   // Создать комплект товаров
   Application.createForm(TEDIT_KOMPLEKT,EDIT_KOMPLEKT);
   EDIT_KOMPLEKT.tag:=-1;
   EDIT_KOMPLEKT.showModal;
   if  EDIT_KOMPLEKT.tag>0 then begin
      RefreshTree;
      IbQrDicTowar.locate('ID',EDIT_KOMPLEKT.tag,[]);
   end;
   EDIT_KOMPLEKT.destroy;
end;

procedure TDIC_TOWAR.BtnFormat1Click(Sender: TObject);
begin
    // Копируем формат
    Application.createForm(TCOPY_PROP,COPY_PROP);
    COPY_PROP.showModal;
    if COPY_PROP.tag=2 then begin
      if COPY_PROP.RadioButton1.checked then begin
        FORMAT_VID1:=1;
        FORMAT_VALUE1:=0;
      end;
      if COPY_PROP.RadioButton2.checked then begin
        FORMAT_VID1:=2;
        FORMAT_VALUE1:=COPY_PROP.MON1.value;
      end;
      if COPY_PROP.RadioButton3.checked then begin
        FORMAT_VID1:=3;
        FORMAT_VALUE1:=COPY_PROP.PERCENT1.value;
      end;
      if COPY_PROP.RadioButton4.checked then begin
        FORMAT_VID2:=1;
        FORMAT_VALUE2:=0;
      end;
      if COPY_PROP.RadioButton5.checked then begin
        FORMAT_VID2:=2;
        FORMAT_VALUE2:=COPY_PROP.MON2.value;
      end;
      if COPY_PROP.RadioButton6.checked then begin
        FORMAT_VID2:=3;
        FORMAT_VALUE2:=COPY_PROP.PERCENT2.value;
      end;
      if COPY_PROP.RadioButton7.checked then begin
        FORMAT_VID2:=4;
        FORMAT_VALUE2:=0;
      end;
      FORMAT_ID:=IbQrDicTowar.fieldByname('ID').asinteger;
      CAN_COPYFORMAT2:=True;
      Label5.caption:=IbQrDicTowar.fieldByname('TW_ART').asstring+' '+IbQrDicTowar.fieldByname('NAME').asstring;
      BtnFormat2.enabled:=CAN_COPYFORMAT and CAN_COPYFORMAT2 and (IbQrDicTowar.fieldByname('ID').asinteger<>FORMAT_ID);
    end;
    COPY_PROP.destroy;
end;

procedure TDIC_TOWAR.BtnFormat2Click(Sender: TObject);
var
   OK:boolean;
begin
   // Применяем формат
   if Messbox('Применить к товару "'+IbQrDicTowar.fieldByname('TW_ART').asstring+' '+IbQrDicTowar.fieldByname('NAME').asstring+'" свойства и скидки товара "'+
   Label5.caption+'" ?',MessSubmit,4+48+256)=6 then begin
      // Применяем свойства
      WorkTransaction.Active:=False;
      WorkTransaction.StartTransaction;
      ADD_SQL(QueryWork,'select * from COPY_FORMAT( :TW_ID, :TW_ID2, :VID1, :VAL1, :VID2, :VAL2, :US_ID)');
      QueryWork.paramByname('TW_ID').asinteger:=FORMAT_ID;
      QueryWork.paramByname('US_ID').asinteger:=USERID;
      QueryWork.paramByname('TW_ID2').asinteger:=IbQrDicTowar.fieldByname('ID').asinteger;
      QueryWork.paramByname('VID1').asinteger:=FORMAT_VID1;
      QueryWork.paramByname('VID2').asinteger:=FORMAT_VID2;
      QueryWork.paramByname('VAL1').asfloat:=FORMAT_VALUE1;
      QueryWork.paramByname('VAL2').asfloat:=FORMAT_VALUE2;
      OK:=False;

      try
        QueryWork.Open;
        if not QueryWork.eof then begin
           if QueryWork.fieldByname('OK').asinteger=1 then OK:=true;
        end
      except
      end;
      if OK then begin
        WorkTransaction.Commit;
        WorkTransaction.Active:=False;
        Wait_Form.StatusBar1.panels[0].text:='Свойства и скдики скопированы...';
        Wait_Form.Gauge1.Progress:=100;
        Wait_Form.Show;
        delay(1000);
        Wait_Form.Hide;
      end else begin
        Messbox('Ошибка при копировании свойств и скидок. Данные не скопировались!',MessSystem,48);
        WorkTransaction.Rollback;
      end;
      WorkTransaction.Active:=False;
   end;
end;

procedure TDIC_TOWAR.btnPriceClick(Sender: TObject);
begin
   Application.CreateForm(TPrint_PRICE,PRINT_PRICE);
   with PRINT_PRICE do
   begin

       tw_group_id:=Treeview1.Selected.stateindex;
       tw_group_typ:=3;

       tw2.Checked:=true;
       btnTW.Enabled:=false;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
       QueryWork.Close;
   end;

   PRINT_PRICE.showModal;
   PRINT_PRICE.destroy;
end;

procedure TDIC_TOWAR.RxDBGrid1CellClick(Column: TColumn);
var tw_id: integer;
    skl_id: integer;
    h: string;

begin
  skl_id:=RxDBGrid1.datasource.dataset.Fields[Column.Index].Tag;
  tW_id:=IbQrDicTowar.fieldbyname('ID').asinteger;

  QueryWork.close;
  QueryWork.SQL.clear;
  QueryWork.SQL.add('select kln_prefix, tW_kol from skl, ost, kln where skl.skl_id=ost.skl_id and kln.kln_id=ost.frm_id and ost.tw_id=:tw_id and skl_id=:skl_id and bg_abs(tw_kol) > 0.001');
  QueryWork.ParamByname('TW_ID').asinteger:=tw_id;
  QueryWork.ParamByname('SKL_ID').asinteger:=skl_id;
  QueryWork.Open;

  while not QueryWork.eof do
    begin
      h:=h+QueryWork.fieldbyname('KLN_PREFIX').asstring+': '+QueryWork.fieldbyname('TW_KOL').asstring+chr(13);
      QueryWork.Next;
    end;
  QueryWork.Close;
  QueryWork.Transaction.Commit;



  RxDBGrid1.hint:=h;
  RxDBGrid1.ShowHint:=true;

  DISABLE_HINT_TIMER.Enabled:=true;
end;

procedure TDIC_TOWAR.DISABLE_HINT_TIMERTimer(Sender: TObject);
begin
  DISABLE_HINT_TIMER.Enabled:=false;
  RxDBGrid1.ShowHint:=false;

end;

procedure TDIC_TOWAR.ToolButton8Click(Sender: TObject);
var band, index: integer;
begin
     CLEAR_CENNIK;
     ADD_CENNIK(IbQrDicTowar.fieldbyname('ID').asinteger,DEFAULT_SKLAD);

     DataModule1.MemCENNIK.Edit;
     DataModule1.memCENNIK.fieldByName('TITLE').AsString:='';

     DataModule1.memCENNIK.fieldByName('TW_MROZ').asFloat:= b_dbutils.GetTWKtgPrice(IbQrDicTowar.fieldbyname('ID').asinteger, 1);
     DataModule1.MemCENNIK.Post;


     with Print_doc do
     begin


     ppSystemVariable72.Visible:=false;
     ppSystemVariable73.Visible:=false;
     ppSystemVariable74.Visible:=false;
     ppSystemVariable75.Visible:=false;
     ppLabel875.Visible:=false;
     ppLabel884.Visible:=false;
     ppLabel885.Visible:=false;
     ppLabel886.Visible:=false;

     pp_cennik_large.GroupFooter[4].Visible:=true;
     pp_cennik_big.GroupFooter[4].Visible:=true;
     pp_cennik_medium.GroupFooter[4].Visible:=true;
     pp_cennik_small.GroupFooter[4].Visible:=true;
     pp_cennik_large.GroupFooter[3].Visible:=true;
     pp_cennik_big.GroupFooter[3].Visible:=true;
     pp_cennik_medium.GroupFooter[3].Visible:=true;
     pp_cennik_small.GroupFooter[3].Visible:=true;


     end;


//     findComponent('ppLabel875');
//     .Visible:=false;
//     TPPSystemVariable(.);

     PRINT_CENNIK;
     with Print_doc do
     begin


     ppSystemVariable72.Visible:=true;
     ppSystemVariable73.Visible:=true;
     ppSystemVariable74.Visible:=true;
     ppSystemVariable75.Visible:=true;
     ppLabel875.Visible:=true;
     ppLabel884.Visible:=true;
     ppLabel885.Visible:=true;
     ppLabel886.Visible:=true;
     pp_cennik_large.GroupFooter[4].Visible:=false;
     pp_cennik_big.GroupFooter[4].Visible:=false;
     pp_cennik_medium.GroupFooter[4].Visible:=false;
     pp_cennik_small.GroupFooter[4].Visible:=false;
     pp_cennik_large.GroupFooter[3].Visible:=false;
     pp_cennik_big.GroupFooter[3].Visible:=false;
     pp_cennik_medium.GroupFooter[3].Visible:=false;
     pp_cennik_small.GroupFooter[3].Visible:=false;
     end;

end;

procedure TDIC_TOWAR.N5Click(Sender: TObject);
var INTERNET_TW_DATA: TINTERNET_TW_DATA;
id: integer;
begin
     application.createForm(TINTERNET_TW_DATA,INTERNET_TW_DATA);
     INTERNET_TW_DATA.tw_id := IbQrDictowar.fieldByname('ID').asinteger;
     id :=IbQrDictowar.fieldByname('ID').asinteger;
     INTERNET_TW_DATA.ShowModal;

     INTERNET_TW_DATA.Destroy;

     RefreshTree;

     IbQrDictowar.Locate('id' , id, []);

end;

procedure TDIC_TOWAR.N6Click(Sender: TObject);
var
   ID,IDTREE:integer;
   a,b:integer;
begin
        {Начинаем искать}
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select parent_id from relation where child_id=:tw_id and relation_typ=4');
        IbQuery1.ParamByname('TW_ID').asinteger:=IbQrDicTowar.fieldByName('id').AsInteger;
        IbQuery1.Open;
        begin
             ID:=IbQrDicTowar.fieldByName('id').AsInteger;
             IDTREE:=IbQuery1.fieldbyname('parent_id').asinteger;
             {Позиционируемся на дерево}
             Tree3:=Root;

             if IDTREE=1000 then
              Tree3:=roznNewTree
             else
              for a:=1 to CntTWTREE do if TWTree[a].ID=IDTREE then Tree3:=TWTree[a].TREE;
             CanTreeRefresh:=False;
             Treeview1.Selected:=Tree3;
             CanTreeRefresh:=True;
             RefreshTree;
             IbQrDicTowar.locate('ID',ID,[]);
             RxDbGrid2.setFocus;
        end;
        IbQuery1.Close;

end;

procedure TDIC_TOWAR.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   RxDbGrid2.Canvas.Brush.color:=clWindow;
   RxDbGrid2.Canvas.Font.color:=clWindowText;

        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('VID').asString='Плохих'   then
                IF (Column.FieldName <> 'VID') then
                        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Column.FieldName).asFloat>0   then
                                RxDBGrid1.Canvas.Brush.color:=$006060FF;


        RxDbGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TDIC_TOWAR.chkRoznClick(Sender: TObject);
begin
RefreshTree;
end;

procedure TDIC_TOWAR.chkOptClick(Sender: TObject);
begin
RefreshTree;
end;

end.
