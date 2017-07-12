unit JouSale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, ToolWin, Mask,
  ToolEdit, RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase, B_DBUtils,B_Utils,
  RxMemDS, ActnList, Menus, DocSale, ppCtrls, ppBands, ppMemo, ppVar,
  ppStrtch, ppRegion, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe;

type
  TJOU_SALE = class(TForm)
    ToolBar1: TToolBar;
    Image1: TImage;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    BtnProw: TToolButton;
    BtnUnProw: TToolButton;
    ToolButton5: TToolButton;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    ToolButton8: TToolButton;
    BtnPrint: TToolButton;
    BtnPropertis: TToolButton;
    ToolButton16: TToolButton;
    BtnInterval: TToolButton;
    RxDBGrid1: TRxDBGrid;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    ToolBar3: TToolBar;
    Label6: TLabel;
    SHOP: TRxDBLookupCombo;
    Label8: TLabel;
    ToolBar4: TToolBar;
    DOST_DATE_CHECK: TCheckBox;
    DOST_DATE: TDateEdit;
    ToolBar5: TToolBar;
    Label11: TLabel;
    RVID: TRxDBLookupCombo;
    Label12: TLabel;
    RVIDKLN: TRxDBLookupCombo;
    SaleListTransaction: TIBTransaction;
    QrSaleList: TIBQuery;
    DsSaleList: TDataSource;
    Label7: TLabel;
    DOST: TCheckBox;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    SKL: TRxDBLookupCombo;
    DsSkl: TDataSource;
    MemSkl: TRxMemoryData;
    MemSklSHOP_ID: TIntegerField;
    MemSklSKL_SHORT: TStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemKassir: TRxMemoryData;
    MemKassa: TRxMemoryData;
    DsKassir: TDataSource;
    DsKassa: TDataSource;
    MemKassirKASSIR_ID: TIntegerField;
    MemKassirKASSIR_NAME: TStringField;
    MemKassaKASSA_ID: TIntegerField;
    MemKassaKASSA_NAME: TStringField;
    KASSA: TRxDBLookupCombo;
    KASSIR: TRxDBLookupCombo;
    MemRVID: TRxMemoryData;
    MemRVIDRVID_ID: TIntegerField;
    MemRVIDRVID_NAME: TStringField;
    MemRVIDRVID_SUBKLN: TIntegerField;
    DsRVID: TDataSource;
    MemRVIDKLN: TRxMemoryData;
    MemRVIDKLNKLN_ID: TIntegerField;
    MemRVIDKLNKLN_FULL: TStringField;
    DsRVIDKLN: TDataSource;
    QrSaleListSALE_ID: TIntegerField;
    QrSaleListSALE_PROW: TIBStringField;
    QrSaleListSALE_NUM_FULL: TIBStringField;
    QrSaleListSALE_DATE: TDateTimeField;
    QrSaleListSALE_SUMM: TFloatField;
    QrSaleListSALE_COLOR: TIntegerField;
    QrSaleListUS_FULL: TIBStringField;
    QrSaleListKLN_ORG: TIBStringField;
    QrSaleListSALE_KURS: TFloatField;
    QrSaleListVALUTA_SHORT: TIBStringField;
    QrSaleListSALE_DOST: TIBStringField;
    QrSaleListSALE_CARD: TIBStringField;
    QrSaleListSALE_NUM: TIntegerField;
    QrSaleListSALE_OSN: TIBStringField;
    QrSaleListDOST_DATE: TDateTimeField;
    QrSaleListNDS_SUMM: TFloatField;
    QrSaleListRVID_NAME: TIBStringField;
    QrSaleListRVID_KLN_FULL: TIBStringField;
    QrSaleListNDS: TFloatField;
    QrSaleListNP: TFloatField;
    QrSaleListSALE_WEIGHT: TFloatField;
    QrSaleListKASSIR_ID: TIntegerField;
    QrSaleListKASSA_ID: TIntegerField;
    QrSaleListKASSIR_FIO: TIBStringField;
    QrSaleListKASSA_NAME: TIBStringField;
    ActionList1: TActionList;
    ActCopyToPO: TAction;
    ActCopyToStorno: TAction;
    ActShowPO: TAction;
    actOpenDrawer: TAction;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N12: TMenuItem;
    MnInterval: TMenuItem;
    BtnFind: TToolButton;
    PipSaleList: TppDBPipeline;
    PpSaleLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel14: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    SaleListTitle1: TppMemo;
    ppRegion79: TppRegion;
    ppLabel440: TppLabel;
    ppLabel443: TppLabel;
    ppLabel483: TppLabel;
    ppLabel442: TppLabel;
    ppLabel10: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel441: TppLabel;
    ppLabel3: TppLabel;
    ppLabel16: TppLabel;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel449: TppLabel;
    ppLabel450: TppLabel;
    ppLabel465: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    ppLabel457: TppLabel;
    PpRnListUser: TppLabel;
    SaleListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpRnListVers: TppLabel;
    ppLabel462: TppLabel;
    ppLabel2: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBText148: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppImage2: TppImage;
    ppImage4: TppImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBCalc3: TppDBCalc;
    ToolButton2: TToolButton;
    btnOpenDrawer: TToolButton;
    DsShop: TDataSource;
    MemShop: TRxMemoryData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    QrSaleListSKL_SHORT: TIBStringField;
    PipSaleListppField27: TppField;
    procedure FormCreate(Sender: TObject);
    Procedure refresh_list;
    procedure FormShow(Sender: TObject);
    procedure RVIDChange(Sender: TObject);
    procedure Refresh_RVIDKLN;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure QrSaleListAfterScroll(DataSet: TDataSet);
    procedure QrSaleListAfterOpen(DataSet: TDataSet);
    Procedure refresh_Btn;
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure PpSaleLISTPreviewFormCreate(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure SHOPChange(Sender: TObject);
    procedure KASSAChange(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure KASSIRChange(Sender: TObject);
    procedure RVIDKLNChange(Sender: TObject);
    procedure DOSTClick(Sender: TObject);
    procedure DOST_DATE_CHECKClick(Sender: TObject);
    procedure DOST_DATEChange(Sender: TObject);
    procedure actOpenDrawerExecute(Sender: TObject);
  private
    { Private declarations }
  	Can_refresh, CAN_NEW:boolean;
  	DT1,DT2:Tdatetime;
  	EnEof:Boolean;
  	G_KEY:char;
  public
    { Public declarations }
  end;

var
  JOU_SALE: TJOU_SALE;

implementation

uses Mainform, WaitForm, Data1, SetJouDate, StfaktFast, SelectPrint,
  PrintDoc, DateInterval, FindDocNum, FR_Shtrih;

{$R *.DFM}

procedure TJOU_SALE.FormCreate(Sender: TObject);
begin
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
end;


Procedure TJOU_SALE.refresh_list;
begin
     if not Can_refresh then exit;

     Wait_Form.StatusBar1.panels[0].text:='Запрос видов рализации по банкам ..';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     Application.ProcessMessages;

     Wait_Form.StatusBar1.panels[0].text:='Запрос журнала..';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     Application.ProcessMessages;
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     SaleListTransaction.Active:=False;
     QrSaleList.close;
     QrSaleList.ParamByname('DT1').asdatetime:=DT1;
     QrSaleList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrSaleList.ParamByname('SHOP_ID').asinteger:=strtoint('0'+SHOP.value);
     QrSaleList.ParamByname('SKL_ID').asinteger:=strtoint('0'+SKL.value);
     QrSaleList.ParamByname('KASSIR_ID1').asstring:=KASSIR.Value;
     QrSaleList.ParamByname('KASSA_ID1').asstring:=KASSA.value;
     QrSaleList.ParamByname('RVID_ID').asstring:=RVID.value;
     if strtoint('0'+RVID.value)=0 then QrSaleList.ParamByname('RVID_SUBKLN').asinteger:=0
                                   else QrSaleList.ParamByname('RVID_SUBKLN').asinteger:=strtoint('0'+RVIDKLN.value);
     if DOST.checked then QrSaleList.ParamByname('DOST').asinteger:=1
       else QrSaleList.ParamByname('DOST').asinteger:=0;
     if DOST_DATE_CHECK.checked then QrSaleList.ParamByname('CHECK_DOST_DATE').asinteger:=1
       else QrSaleList.ParamByname('CHECK_DOST_DATE').asinteger:=0;
     QrSaleList.ParamByname('DOST_DATE2').asdatetime:=DOST_DATE.date;

     QrSaleList.Open;
     Wait_Form.Gauge1.Progress:=100;
     Application.ProcessMessages;
     Wait_Form.Hide;

end;

procedure TJOU_SALE.FormShow(Sender: TObject);
begin
  Can_refresh:=false;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Магазины...';
  Wait_Form.Gauge1.Progress:=2;
  Wait_Form.Show;

  WorkTransaction.Active:=False;
  MemShop.EmptyTable;
  MemShop.Append;
  MemShop.fieldByname('SHOP_ID').asinteger:=0;
  MemShop.fieldByname('SHOP_NAME').asstring:='<Все>';
  MemShop.Post;
  OPEN_SQL(QueryWork,'select SHOP_ID, SHOP_NAME from LIST_SHOP(0) order by SHOP_NAME');
  while not QueryWork.eof do begin
    MemShop.Append;
    MemShop.fieldByname('SHOP_ID').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
    MemShop.fieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('SHOP_NAME').asstring;
    MemShop.Post;
    QueryWork.next;
  end;
  Shop.dropdowncount := memshop.RecordCount+1;

  Application.ProcessMessages;

  WorkTransaction.Active:=False;
  MemSKl.EmptyTable;
  MemSKl.Append;
  MemSKl.fieldByname('SKL_ID').asinteger:=0;
  MemSKl.fieldByname('SKL_SHORT').asstring:='<Все>';
  MemSKl.Post;
  OPEN_SQL(QueryWork,'select SKL_ID, SKL_SHORT from SKL where SKL_SPEED > 0 order by SKL_SPEED');
  while not QueryWork.eof do begin
    MemSKl.Append;
    MemSKl.fieldByname('SKL_ID').asinteger:=QueryWork.fieldByname('SKL_ID').asinteger;
    MemSKl.fieldByname('SKL_SHORT').asstring:=QueryWork.fieldByname('SKL_SHORT').asstring;
    MemSKl.Post;
    QueryWork.next;
  end;
  Skl.dropdowncount := MemSKl.RecordCount+1;

  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Кассиры...';
  Wait_Form.Gauge1.Progress:=4;
    Application.ProcessMessages;
  MemKassir.EmptyTable;
  MemKassir.Append;
  MemKassir.fieldByname('KASSIR_ID').asinteger:=0;
  MemKassir.fieldByname('KASSIR_NAME').asstring:='<Все>';
  MemKassir.Post;
  OPEN_SQL(QueryWork,'select kln_id KASSIR_ID, kln_kkm_password KASSIR_NAME from kln '+
			'where bg_length(kln.kln_kkm_password) > 0 '+
			'order by kln_kkm_password');
  while not QueryWork.eof do begin
    if QueryWork.fieldByname('KASSIR_NAME').asstring<>'' then
    begin
     MemKassir.Append;
     MemKassir.fieldByname('KASSIR_ID').asinteger:=QueryWork.fieldByname('KASSIR_ID').asinteger;
     MemKassir.fieldByname('KASSIR_NAME').asstring:=QueryWork.fieldByname('KASSIR_NAME').asstring;
     MemKassir.Post;
    end;
    QueryWork.next;
  end;
  Kassir.dropdowncount := MemKassir.RecordCount+1;


  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Кассы...';
  Wait_Form.Gauge1.Progress:=6;
  Application.ProcessMessages;
  MemKassa.EmptyTable;
  MemKassa.Append;
  MemKassa.fieldByname('KASSA_ID').asinteger:=0;
  MemKassa.fieldByname('KASSA_NAME').asstring:='<Все>';
  MemKassa.Post;
  OPEN_SQL(QueryWork,'select CFG_ID KASSA_ID, KKM_NAME KASSA_NAME from LIST_KKM ORDER BY SHOP_NAME');
  while not QueryWork.eof do begin
    if QueryWork.fieldByname('KASSA_NAME').asstring<> '' then
    begin
     MemKassa.Append;
     MemKassa.fieldByname('KASSA_ID').asinteger:=QueryWork.fieldByname('KASSA_ID').asinteger;
     MemKassa.fieldByname('KASSA_NAME').asstring:=QueryWork.fieldByname('KASSA_NAME').asstring;
     MemKassa.Post;
    end;
    QueryWork.next;
  end;



  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Виды реализации...';
  Wait_Form.Gauge1.Progress:=8;
  Application.ProcessMessages;
  MemRVid.EmptyTable;
  MemRVid.Append;
  MemRVid.fieldByname('RVID_ID').asinteger:=0;
  MemRVid.fieldByname('RVID_NAME').asstring:='<Все>';
  MemRVid.Post;
  DataModule1.MainDicRVid.First;
  while not DataModule1.MainDicRVid.eof do begin
    MemRVid.Append;
    MemRVid.fieldByname('RVID_ID').asinteger:=DataModule1.MainDicRVid.fieldByname('RVID_ID').asinteger;
    MemRVid.fieldByname('RVID_NAME').asstring:=DataModule1.MainDicRVid.fieldByname('RVID_NAME').asstring;
    MemRVid.fieldByname('RVID_SUBKLN').asinteger:=DataModule1.MainDicRVid.fieldByname('RVID_SUBKLN').asinteger;
    MemRVid.Post;
    DataModule1.MainDicRVid.next;
  end;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Виды реализации. Банки...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  Application.ProcessMessages;


  CAN_NEW:=Check_Dostup('$JOU.SALE.NEW');
//  CAN_ADM:=CHECK_DOSTUP('$ADM');

  RVID.Value:='0';
  RVIDKLN.value:='0';
  Refresh_RVIDKLN;
  SHOP.Value:=IntToStr(SHOPID);
  SKL.Value:='0';
  KASSIR.Value:='0';
  KASSA.Value:='0';

  {Определяем название}
  DT1:=date();
  DT2:=date();
  Can_refresh := true;
  Refresh_list;



  Wait_Form.Hide;

end;

procedure TJOU_SALE.RVIDChange(Sender: TObject);
begin
  inherited;
  if MemRvid.fieldByname('rvid_subkln').asinteger=0 then RVIDKLN.enabled:=false
                    else RVIDKLN.enabled:=true;
  Refresh_list;
end;


procedure TJOU_SALE.Refresh_RVIDKLN;
var
  OLDID:integer;
begin
  OLDID:=strtoint('0'+RVIDKLN.value);
  MemRVidKLN.disablecontrols;
  MemRVidKLN.EmptyTable;
  MemRVidKLN.Append;
  MemRVidKLN.fieldByname('KLN_ID').asinteger:=0;
  MemRVidKLN.fieldByname('KLN_FULL').asstring:='<Все>';
  MemRVidKLN.Post;
  WorkTransaction.Active:=False;
  add_SQL(QueryWork,'select cfg_set1 as kln_id,(select kln_full from kln_data(cfg.cfg_set1)) as kln_full '+
  'from cfg where cfg_name="RVID_KLN_LIST" order by 2');
  QueryWork.Open;
  while not QueryWork.eof do begin
    MemRVidKLN.Append;
    MemRVidKLN.fieldByname('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
    MemRVidKLN.fieldByname('KLN_FULL').asstring:=QueryWork.fieldByname('KLN_FULL').asstring;
    MemRVidKLN.Post;
    QueryWork.next;
  end;
  MemRVidKLN.EnableControls;
  RVIDKLN.value:=inttostr(OLDID);
end;

procedure TJOU_SALE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
     DT1:=date();
     DT2:=date();
     Refresh_list;
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
        Refresh_list;
     end;
     SET_JOUDATE.Destroy;
  end;
end;

procedure TJOU_SALE.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     RxDbgrid1.Canvas.Font.color:=clWindowtext;

     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
     end;

     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALE_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='SALE_NUM_FULL' then begin
                RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALE_COLOR').Asinteger;
                RxDbgrid1.Canvas.Font.color:=clWindowtext;
        end;
     end;
     if Column.Field.FullName='SALE_PROW' then begin
     {Колонка проводки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALE_PROW').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           22,True);
        end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           -1,True);
     end else if Column.Field.FullName='SALE_DOST' then begin {Колонка доставки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALE_DOST').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           47,True);
        end;
     end else if Column.Field.FullName='SALE_CARD' then begin {Колонка карточки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALE_CARD').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           48,True);
        end;
     end else RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TJOU_SALE.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJOU_SALE.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJOU_SALE.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TJOU_SALE.QrSaleListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[1].text:='Оформил: '+QrSaleList.fieldbyname('US_FULL').asstring;
  Statusbar1.Panels[2].text:='Вид реализации: '+QrSaleList.fieldbyname('RVID_NAME').asstring;
  Statusbar1.Panels[3].text:='По банку: '+QrSaleList.fieldbyname('RVID_KLN_FULL').asstring;
  Refresh_Btn;
end;

procedure TJOU_SALE.QrSaleListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[1].text:='Оформил: '+QrSaleList.fieldbyname('US_FULL').asstring;
  Statusbar1.Panels[2].text:='Вид реализации: '+QrSaleList.fieldbyname('RVID_NAME').asstring;
  Statusbar1.Panels[3].text:='По банку: '+QrSaleList.fieldbyname('RVID_KLN_FULL').asstring;
  if QrSaleList.eof then begin
     EnEof:=false
  end else begin
     EnEof:=true;
  end;
  ActShowPO.enabled:=EnEof;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
//  BtnCopy.enabled:=EnEof and CAN_NEW;
//  MnCopy.enabled:=EnEof and CAN_NEW;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  Refresh_Btn;
end;


Procedure TJou_Sale.refresh_Btn;
var
   EN:boolean;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     ActShowPO.enabled:=EnEof;
     if QrSaleList.fieldbyname('SALE_PROW').asstring='1' then EN:=false else EN:=true;
     BtnProw.Enabled:=EN and EnEof;
     MnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof and CHECK_DOSTUP('$JOU.SALE.DELETE');



     MnDel.Enabled:=BtnDel.Enabled;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
end;

procedure TJOU_SALE.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  if IS_EDIT_SALE then Messbox('Вы уже просматриваете или редактируете продажу!',MessSYstem,48) else begin
    Application.CreateForm(TDoc_SALE,Doc_SALE);
    ID:=QrSALEList.fieldbyname('SALE_ID').asinteger;
    Doc_SALE.tag:=ID;
    Doc_SALE.showModal;
    Doc_SALE.destroy;
    QrSALEList.Close;
    SaleListTransaction.Active:=False;
    QrSALEList.Open;
    QrSALEList.locate('SALE_ID',ID,[]);
  end;
end;

procedure TJOU_SALE.BtnProwClick(Sender: TObject);
var
   ID:integer;
   can:boolean;
begin
  ID:=QrSaleList.fieldByname('SALE_ID').asinteger;
  CAN:=PROV_SALE(ID,QrSaleList.fieldbyname('SALE_NUM_FULL').asstring+
    ' от '+date_sokr(QrSaleList.fieldbyname('SALE_DATE').asdatetime)+' ');
  if CAN then begin
       QrSaleList.DisableControls;
       QrSaleList.close;
       SaleListTransaction.Active:=False;
       QrSaleList.Open;
       QrSaleList.Locate('SALE_ID',ID,[]);
       QrSaleList.EnableControls;
  end;
  RxDbgrid1.setfocus;

end;

procedure TJOU_SALE.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
   can:boolean;
begin
  ID:=QrSaleList.fieldByname('SALE_ID').asinteger;
  CAN:=UNPROV_SALE(ID,QrSaleList.fieldbyname('SALE_NUM_FULL').asstring+
    ' от '+date_sokr(QrSaleList.fieldbyname('SALE_DATE').asdatetime)+' ');
  if CAN then begin
       QrSaleList.DisableControls;
       QrSaleList.close;
       SaleListTransaction.Active:=False;
       QrSaleList.Open;
       QrSaleList.Locate('SALE_ID',ID,[]);
       QrSaleList.EnableControls;
  end;
  RxDbgrid1.setfocus;

end;

procedure TJOU_SALE.BtnNewClick(Sender: TObject);
var sale_id: integer;
begin
 sale_id:=0;
 if IS_EDIT_SALE then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48)
 else
 begin
{   if SHOPID=14 then
  begin
    Application.createForm(TDOC_SALE_LITE,DOC_SALE_LITE);
    DOC_SALE_LITE.Tag:=-1;
    DOC_SALE_LITE.showmodal;
    sale_id:=DOC_SALE_LITE.tag;
    DOC_SALE_LITE.destroy;

  end
  else
}  
  begin
    Application.createForm(TDOC_SALE,DOC_SALE);
    DOC_SALE.Tag:=-1;
    DOC_SALE.showmodal;
    sale_id:=DOC_SALE.tag;
    DOC_SALE.destroy;
  end;

  if SALE_ID>0 then begin
//           DT1:=DOC_SALE.SALe_DATE.date;
//           DT2:=DOC_SALE.SALe_DATE.date;
           refresh_list;
           Refresh_RVIDKLN;
           QrSaleList.locate('SALE_ID',SALE_ID,[]);
  end;
  RxDbgrid1.setfocus;
 end;
end;

procedure TJOU_SALE.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrSaleList.fieldByname('SALE_ID').asinteger;
  if Messbox('Удалить продажу '+QrSaleList.fieldByname('SALE_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_SALE(:SALE_ID,:US_ID)');
     DataModule1.IbSaveSQL.Parambyname('SALE_ID').asinteger:=ID;
     DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
      on e: EXception do
       begin
        messbox(e.message, messError, 0);
       Datamodule1.IBTransaction2.RollBAck;
       end;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrSaleList.locate('SALE_ID',ID,[]);
  end;
  RxDbGrid1.Setfocus;
end;

procedure TJOU_SALE.BtnPrintClick(Sender: TObject);
var
  s:ansistring;
begin
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_Sale.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_Sale.left+BtnPrint.left+4+BtnPrint.Width;


  Select_Print.Button1.caption:='1. Напечатать расходные накладные';
  Select_Print.Button2.caption:='2. Напечатать товарные чеки на основе расходных накладных';
  Select_Print.Button3.caption:='3. Напечатать журнал в текущем отображении';
  Select_Print.Button4.caption:='4. Напечатать оборот накладной с доставкой';
  if Check_Dostup('$JOU.RN.PRINT_OLD_RND') and (QrSaleList.fieldbyname('SALE_DOST').asstring='1') then
  	Select_Print.Button5.caption:='5. Напечатать расходную накладную для клиента';

  Select_Print.showModal;
  if Select_Print.tag>0 then begin
     if (Select_Print.tag=4) then   Print_DOC.LoadXltAndPrint('rnd_rear.xlt');
     if (Select_Print.tag=1) then   PRINT_SALE(QrSaleList.fieldbyname('SALE_ID').asinteger);
     if (Select_Print.tag=5) then   PRINT_SALE_OLD(QrSaleList.fieldbyname('SALE_ID').asinteger);
     if (Select_Print.tag=2) then   PRINT_SALE_CHECK1(QrSaleList.fieldbyname('SALE_ID').asinteger,Preview);
    if (Select_Print.tag=3) then begin
             PpSaleList.reset;
             SaleListTitle1.lines.clear;
             s:='Магазином: '+shop.text+', Со склада: '+SKL.text;
             if DOST.checked then s:=s+', только с доставкой ';
             if dost_date_check.checked then s:=s+'на '+date_sokr(dost_date.date);
             s:=s+', вид реализации: '+RVID.text+' по банку: '+RVIDKLN.text;
             SaleListTitle1.lines.add('продаж за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+s);
             SaleListTitle2.Caption:='Журнал продаж за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+s;
             PpSaleList.Print;
     end;


  end;
  Select_Print.Destroy;

end;

procedure TJOU_SALE.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Продажа №'+QrSaleList.fieldbyname('Sale_NUM_FULL').asstring,'SALE',QrSaleList.fieldbyname('SALE_ID').asinteger);
end;

procedure TJOU_SALE.BtnIntervalClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    Refresh_list;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJOU_SALE.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=23; {Метка, что искать в продажах}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(SALE_DATE) AS SALE_DATE FROM SALE WHERE SALE_ID=:SALE_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('SALE_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('SALE_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrSaleList.locate('SALE_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;

end;

procedure TJOU_SALE.PpSaleLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
   PpSaleLIST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TJOU_SALE.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrSaleList.fieldbyname('SALE_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;
  if QrSaleList.fieldbyname('SALE_DOST').asinteger=1
  then PpImage2.Visible:=true else PpImage2.Visible:=False;
  if QrSaleList.fieldbyname('SALE_CARD').asinteger=1
  then PpImage4.Visible:=true else PpImage4.Visible:=False;
end;

procedure TJOU_SALE.SHOPChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.KASSAChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.SKLChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.KASSIRChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.RVIDKLNChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.DOSTClick(Sender: TObject);
begin
  if not Dost.checked then DOST_DATE_CHECK.checked:=False;
  DOST_DATE_CHECK.visible:=Dost.checked;
  DOST_DATE.visible:=DOST_DATE_CHECK.Checked;
  Refresh_list;

end;

procedure TJOU_SALE.DOST_DATE_CHECKClick(Sender: TObject);
begin
  DOST_DATE.visible:=DOST_DATE_CHECK.Checked;
  Refresh_list;
end;

procedure TJOU_SALE.DOST_DATEChange(Sender: TObject);
begin
  Refresh_list;
end;

procedure TJOU_SALE.actOpenDrawerExecute(Sender: TObject);
begin
    if MODEL_KKM<>4 then Exit;

    FRShtrih.OpenDrawer;
end;

end.
