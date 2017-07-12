unit ReportOstNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Animate, GIFCtrl,Data1,B_utils,b_dbutils, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Buttons, StdCtrls, RxLookup, RXSpin, ExtCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, ppStrtch, ppMemo, ppBands, ppVar,VclUtils, ppModule, daDatMod,
  Mask, ToolEdit, Grids, DBGrids, Placemnt, RxMemDS,
  excel2000, OleServer, ComObj, DualList;

type
  TREPORT_OST_NEW = class(TForm)
    RxGIFAnimator1: TRxGIFAnimator;
    Label1: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label2: TLabel;
    SKL1: TRadioButton;
    SKL2: TRadioButton;
    SklTransaction: TIBTransaction;
    QrSKL: TIBQuery;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_FULL: TIBStringField;
    DsSKL: TDataSource;
    SKL: TRxDBLookupCombo;
    BRAK1: TCheckBox;
    BRAK2: TCheckBox;
    Label3: TLabel;
    USL: TComboBox;
    VALUE: TRxSpinEdit;
    BtnCreateReport: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    ReportTransaction: TIBTransaction;
    Report_New1: TIBQuery;
    DsNew1: TDataSource;
    PipNew1: TppDBPipeline;
    PpNew1_full: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppShape1: TppShape;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpOstNew1FullUser: TppLabel;
    PpOstNew1FullUser2: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape2: TppShape;
    ppLine3: TppLine;
    ppImage2: TppImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    PpOstNew1FullVers: TppLabel;
    FULL_TITLE1: TppMemo;
    FULL_TITLE2: TppMemo;
    Label4: TLabel;
    ppLabel1: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel22: TppLabel;
    ppDBCalc3: TppDBCalc;
    PpNew1_Short: TppReport;
    ppTitleBand2: TppTitleBand;
    ppShape3: TppShape;
    ppImage3: TppImage;
    ppLabel23: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel24: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    PpOstNew1ShortUser: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    SHORT_TITLE1: TppMemo;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    PpOstNew1ShortUser2: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel38: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel39: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    SHORT_TITLE2: TppMemo;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppLine2: TppLine;
    ppDBCalc4: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppImage4: TppImage;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    PpOstNew1ShortVers: TppLabel;
    ppLabel50: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel51: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBMemo4: TppDBMemo;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel27: TppLabel;
    ppDBText7: TppDBText;
    CheckBox2: TCheckBox;
    PpNew1_ShortWide: TppReport;
    ppTitleBand3: TppTitleBand;
    ppShape5: TppShape;
    ppImage5: TppImage;
    ppLabel28: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel29: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel35: TppLabel;
    PpOstNew1ShortWideUser: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel49: TppLabel;
    ShortWide_Title1: TppMemo;
    ppHeaderBand3: TppHeaderBand;
    ppShape6: TppShape;
    PpOstNew1ShortWideUser2: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel55: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel56: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ShortWide_title2: TppMemo;
    ppLabel60: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppLine5: TppLine;
    ppDBCalc6: TppDBCalc;
    ppDBText9: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppImage6: TppImage;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    PpOstNew1ShortWideVers: TppLabel;
    ppLabel64: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppLabel65: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBMemo6: TppDBMemo;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine6: TppLine;
    PpNew1_FullWide: TppReport;
    ppTitleBand4: TppTitleBand;
    ppShape7: TppShape;
    ppImage7: TppImage;
    ppLabel43: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppSystemVariable17: TppSystemVariable;
    ppLabel52: TppLabel;
    ppSystemVariable18: TppSystemVariable;
    ppLabel63: TppLabel;
    ppLabel66: TppLabel;
    PpOstNew1FullWideUser: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    FullWide_Title1: TppMemo;
    ppHeaderBand4: TppHeaderBand;
    ppShape8: TppShape;
    PpOstNew1FullWideUser2: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel78: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppLabel79: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    FullWide_Title2: TppMemo;
    ppDetailBand4: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLine7: TppLine;
    ppDBCalc8: TppDBCalc;
    ppSummaryBand4: TppSummaryBand;
    ppImage8: TppImage;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    PpOstNew1FullWideVers: TppLabel;
    ppLabel90: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppLabel91: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBMemo8: TppDBMemo;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine8: TppLine;
    ppLabel67: TppLabel;
    ppLabel75: TppLabel;
    ppLabel89: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    IBQuery1: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IBStringField4: TIBStringField;
    DsRepSklad: TDataSource;
    PipSklad: TppDBPipeline;
    PpRepSklad: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppTitleBand5: TppTitleBand;
    ppSummaryBand5: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBMemo9: TppDBMemo;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBCalc11: TppDBCalc;
    ppDBText29: TppDBText;
    ppDBMemo10: TppDBMemo;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel99: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppLabel100: TppLabel;
    ppImage9: TppImage;
    ppLabel101: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppLabel102: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    PpShopUser: TppLabel;
    ppLabel106: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppLabel107: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppLabel108: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    PpShopUser2: TppLabel;
    ppLabel110: TppLabel;
    ppImage10: TppImage;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    PpShopVers: TppLabel;
    ppShape9: TppShape;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel120: TppLabel;
    SHOP1: TppLabel;
    SHOP2: TppLabel;
    SHOP3: TppLabel;
    Shop4: TppLabel;
    Shop5: TppLabel;
    Shop6: TppLabel;
    Shop7: TppLabel;
    Shop8: TppLabel;
    Shop9: TppLabel;
    Shop10: TppLabel;
    ppShape10: TppShape;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    SHOP1_1: TppLabel;
    SHOP2_1: TppLabel;
    SHOP3_1: TppLabel;
    SHOP4_1: TppLabel;
    SHOP5_1: TppLabel;
    SHOP6_1: TppLabel;
    SHOP7_1: TppLabel;
    SHOP8_1: TppLabel;
    SHOP9_1: TppLabel;
    SHOP10_1: TppLabel;
    SKL_TITLE1: TppMemo;
    SKL_TITLE2: TppMemo;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    Report_New1TWTREE_ID: TIntegerField;
    Report_New1TWTREE_FULL: TIBStringField;
    Report_New1TW_ID: TIntegerField;
    Report_New1TW_ART: TIntegerField;
    Report_New1TW_NAM: TIBStringField;
    Report_New1ED_SHORT: TIBStringField;
    Report_New1TW_MROZ: TFloatField;
    Report_New1TW_OST: TFloatField;
    Report_New1TW_SUMM: TFloatField;
    Report_New1TW_BRAK: TIBStringField;
    VID: TComboBox;
    GroupBox1: TGroupBox;
    LExportFileName: TLabel;
    ExportFilename: TFilenameEdit;
    CBShowAfterCreating: TCheckBox;
    BtnExportReport: TButton;
    Label6: TLabel;
    CBExportFileType: TComboBox;
    Report_Sklad: TIBQuery;
    IntegerField4: TIntegerField;
    IBStringField5: TIBStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FormStorage1: TFormStorage;
    ppLabel105: TppLabel;
    ppLabel109: TppLabel;
    ppDBText15: TppDBText;
    Report_New1TW_KWM_ONE: TFloatField;
    Report_New1TW_KWM: TFloatField;
    ppLabel113: TppLabel;
    ppLabel127: TppLabel;
    ppDBText30: TppDBText;
    Label7: TLabel;
    FRM: TRxDBLookupCombo;
    BtnDynDic: TSpeedButton;
    Label5: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    DualListDialog3: TDualListDialog;
    Report_New1TW_WEIGHT: TFloatField;
    procedure BtnDicClick(Sender: TObject);
    procedure SKL2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnCreateReportClick(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpNew1_fullPreviewFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PpNew1_ShortPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PpNew1_ShortWidePreviewFormCreate(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure PpNew1_FullWidePreviewFormCreate(Sender: TObject);
    procedure ppTitleBand4BeforeGenerate(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ppTitleBand5BeforeGenerate(Sender: TObject);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);
    procedure PpRepSkladPreviewFormCreate(Sender: TObject);
    procedure VIDChange(Sender: TObject);
    procedure BtnExportReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBExportFileTypeChange(Sender: TObject);
    procedure Report_New1CalcFields(DataSet: TDataSet);
    procedure BtnDynDicClick(Sender: TObject);
    procedure OpenReport1(ShowPrintForm: boolean=false);
    procedure OpenReport2(ShowPrintForm: boolean=false);
    procedure ExpCalc;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
    reporttitle: string;
    SKL_S:ansistring;
  public
    { Public declarations }
  end;

var
  REPORT_OST_NEW: TREPORT_OST_NEW;

implementation

uses DicTowar, WaitForm, Request_Response, ReportRemainingGoods,
  DicTwDynGroup;

{$R *.DFM}
        procedure TREPORT_OST_NEW.OpenReport1(ShowPrintForm: boolean);
var s_brak: string;
begin

    // Без разбивки по складам
    ReportTransaction.Active:=False;
    Report_NEW1.Close;
    Report_NEW1.Parambyname('PAR_ID').asinteger:=tw_group_id;
    Report_NEW1.Parambyname('TYP').asinteger:=tw_group_typ;
    reporttitle:='Отчет об остатках товаров группы: '+TW.text;
    Report_NEW1.Parambyname('FRM_ID').asstring:=FRM.value;
//    if SKL1.checked then Report_NEW1.Parambyname('SKL_ID').asinteger:=0
//    else
    Report_NEW1.Parambyname('SKL_IDS').asString:=SKL_S;
//    if SKL1.checked then reporttitle:=reporttitle+' на всех складах'
  //                  else
    reporttitle:=reporttitle+' на складах: '+Edit2.text;
    case USL.itemindex of
      0: reporttitle:=reporttitle+', остаток товара больше ';
      1: reporttitle:=reporttitle+', остаток товара меньше ';
      2: reporttitle:=reporttitle+', остаток товара равен ';
    end;
    reporttitle:=reporttitle+floattostrf(value.value,fffixed,19,4);
    Report_NEW1.Parambyname('USL').asinteger:=USL.itemindex+1;
    Report_NEW1.Parambyname('USL_VALUE').asfloat:=VALUE.value;
    s_brak:='';
    if brak1.Checked then
      s_brak:='%0%';
    if brak2.Checked then
      s_brak:=s_brak+'%1%';
    Report_NEW1.Parambyname('IN_TW_BRAK').asstring:=s_brak;


    Report_NEW1.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);
    if Report_NEW1.eof then begin
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       Wait_Form.Hide;

       Messbox('Отчет пуст!',MessSystem,48)
    end
    else
    begin
       // Полный
       if Checkbox2.checked then begin
         FULLWide_TITLE1.lines.clear;
         FULLWide_TITLE1.lines.add(reporttitle);
         FULLWide_TITLE2.lines.clear;
         FULLWide_TITLE2.lines.add(reporttitle);
         Wait_Form.Gauge1.Progress:=100;
         delay(100);
         Wait_Form.Hide;
         if ShowPrintForm then
         begin
         PpNew1_FullWide.reset;
         PpNew1_FullWide.Print;
         end;
         if Checkbox1.checked then
         begin
            // Для ревизии
           SHORTWIDE_TITLE1.lines.clear;
           SHORTWIDE_TITLE1.lines.add(reporttitle);
           SHORTWIDE_TITLE2.lines.clear;
           SHORTWIDE_TITLE2.lines.add(reporttitle);
           if ShowPrintForm then
           begin
             PpNew1_ShortWide.reset;
             PpNew1_ShortWide.Print;
           end;
         end
       end
       else
       begin
         FULL_TITLE1.lines.clear;
         FULL_TITLE1.lines.add(reporttitle);
         FULL_TITLE2.lines.clear;
         FULL_TITLE2.lines.add(reporttitle);
         Wait_Form.Gauge1.Progress:=100;
         delay(100);
         Wait_Form.Hide;
         if ShowPrintForm then
         begin
           PpNew1_Full.reset;
           PpNew1_Full.Print;
         end;
         if Checkbox1.checked then
         begin
            // Для ревизии
           SHORT_TITLE1.lines.clear;
           SHORT_TITLE1.lines.add(reporttitle);
           SHORT_TITLE2.lines.clear;
           SHORT_TITLE2.lines.add(reporttitle);
           Wait_Form.Gauge1.Progress:=100;
           delay(100);
           Wait_Form.Hide;
           if ShowPrintForm then
           begin
           PpNew1_Short.reset;
           PpNew1_Short.Print;
           end;
         end;
       end;
    end;

end;


procedure TREPORT_OST_NEW.OpenReport2(ShowPrintForm: boolean);
var s_brak: string;
    c: integer;
begin
  // С разбивкой по складам
    reporttitle:='Отчет об остатках товара на всех складах. Группа: '+TW.text;
    SKL_TITLE1.Lines.clear;
    SKL_TITLE1.lines.add(reporttitle);
    SKL_TITLE2.Lines.clear;
    SKL_TITLE2.lines.add(reporttitle);
    ReportTransaction.Active:=False;
    Report_SKLAD.Close;
    Report_SKLAD.Parambyname('PAR_ID').asinteger:=tw_group_id;
    Report_SKLAD.Parambyname('TYP').asinteger:=tw_group_typ;
    Report_SKLAD.Parambyname('FRM_ID').asstring:=FRM.value;
    s_brak:='';
    if brak1.Checked then
      s_brak:='%0%';
    if brak2.Checked then
      s_brak:=s_brak+'%1%';
    Report_SKLAD.Parambyname('IN_TW_BRAK').asstring:=s_brak;

    Report_SKLAD.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);
    if Report_SKLAD.eof then
    begin
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       Wait_Form.Hide;
       ReportTitle:='';
       Messbox('Отчет пуст!',MessSystem,48)
    end
    else
    begin
       SHOP1.Caption:=''; SHOP2.Caption:=''; SHOP3.Caption:=''; SHOP4.Caption:='';
       SHOP5.Caption:=''; SHOP6.Caption:=''; SHOP7.Caption:=''; SHOP8.Caption:='';
       SHOP9.Caption:=''; SHOP10.Caption:='';
       SHOP1_1.Caption:=''; SHOP2_1.Caption:=''; SHOP3_1.Caption:=''; SHOP4_1.Caption:='';
       SHOP5_1.Caption:=''; SHOP6_1.Caption:=''; SHOP7_1.Caption:=''; SHOP8_1.Caption:='';
       SHOP9_1.Caption:=''; SHOP10_1.Caption:='';
       WorkTransaction.Active:=False;
       OPEN_SQL(QueryWork,'select skl_short from skl where not skl_speed=0 '+
       'order by skl_speed');
       c:=0;
       while not QueryWork.eof do begin
         inc(c);
         case c of
           1: begin
              SHOP1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP1_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           2: begin
              SHOP2.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP2_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           3: begin
              SHOP3.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP3_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           4: begin
              SHOP4.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP4_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           5: begin
              SHOP5.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP5_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           6: begin
              SHOP6.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP6_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           7: begin
              SHOP7.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP7_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           8: begin
              SHOP8.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP8_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           9: begin
              SHOP9.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP9_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
           10: begin
              SHOP10.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
              SHOP10_1.caption:=QueryWork.fieldbyname('SKL_SHORT').asstring;
             end;
         end;
         QueryWork.Next;
       end;
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       Wait_Form.Hide;
       if ShowPrintForm then
       begin
       PpRepSklad.reset;
       PpRepSklad.Print;
       end;
    end;
end;

procedure TREPORT_OST_NEW.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
end;

procedure TREPORT_OST_NEW.SKL2Click(Sender: TObject);
begin
  SKL.enabled:=SKL2.checked;
  Checkbox3.enabled:=SKL1.checked and not Checkbox1.checked;
  if SKL2.checked then Checkbox3.checked:=False;
end;

procedure TREPORT_OST_NEW.FormShow(Sender: TObject);
var   s3,s4:ansistring;
  a: integer;
begin
  VID.itemindex:=0;
  VID.Enabled:=False;
  TW.tag:=0;
  TW.text:='Все товары';
  SklTransaction.Active:=False;
  QrSKL.close;
  QrSKL.open;
  SKL.value:=inttostr(DEFAULT_SKLAD);
  USL.itemindex:=0;

  tw_group_id:=0;
  tw_group_typ:=3;  //просто все товары

  {Загрузка списка доступных фирм}
{
  //  MemFrm.EmptyTable;
//  MemFrm.Append;
//  MemFrm.fieldByname('FRM_ID').asinteger:=0;
//  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
//  MemFrm.Post;
  ADD_SQL(QueryWork,'select kln_id, (select kln_full from kln_data(kln.kln_id)) as frm_name from kln where kln_frm = 2 order by 2');
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
}
  FRM.EmptyValue:='0';
  FRM.DisplayEmpty:='<Все фирмы>';
  
  FRM.value:='0';





   s4:='';
   s3:='%';
   for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
   WorkTransaction.Active:=False;
   DualListDialog3.Title:='Список складов';
   DualListDialog3.List1.Clear;
   DualListDialog3.List2.Clear;
   OPEN_SQL(QueryWork,'select SKL_SHORT,SKL_ID from SKL order by SKL_SPEED');
   while not QueryWork.eof do begin
     DualListDialog3.List2.Add(QueryWork.fieldByname('SKL_SHORT').asstring);
     s4:=s4+QueryWork.fieldByname('SKL_SHORT').asstring+',';
     s3:=s3+'%'+QueryWork.fieldByname('SKL_ID').asstring+'%';
     QueryWork.next;
   end;


   if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
   Edit2.text:=s4;
   SKL_S:=s3;









end;

procedure TREPORT_OST_NEW.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TREPORT_OST_NEW.CheckBox1Click(Sender: TObject);
begin
   Checkbox3.enabled:=SKL1.checked and not Checkbox1.checked;
   if checkbox1.checked then Checkbox3.Checked:=False;
end;

procedure TREPORT_OST_NEW.BtnCreateReportClick(Sender: TObject);
var
  s:ansistring;
  c:integer;
  s_brak: string;
begin
  Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  delay(1);
  Button3.enabled:=False;
  BtnCreateReport.enabled:=False;
  ReportTransaction.Active:=False;
  if CheckBox3.checked then
    OpenReport2(true)
  else
    OpenReport1(true);
  Button3.enabled:=True;
  BtnCreateReport.enabled:=True;
end;

procedure TREPORT_OST_NEW.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpOstNew1FullUser.caption:=USERFIO_SHORT;
     PpOstNew1FullUser2.caption:=USERFIO_SHORT;
     PpOstNew1FullVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_OST_NEW.PpNew1_fullPreviewFormCreate(Sender: TObject);
begin
     PpNew1_full.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_OST_NEW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Report_NEW1.Close;
    ReportTransaction.Active:=False;
    QrSKL.close;
    SklTransaction.Active:=False;
    QueryWork.close;
    WorkTransaction.Active:=False;

end;

procedure TREPORT_OST_NEW.PpNew1_ShortPreviewFormCreate(Sender: TObject);
begin
     PpNew1_Short.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_OST_NEW.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpOstNew1ShortUser.caption:=USERFIO_SHORT;
     PpOstNew1ShortUser2.caption:=USERFIO_SHORT;
     PpOstNew1ShortVers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TREPORT_OST_NEW.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then begin
    key:=#0;
    close;
  end;
end;

procedure TREPORT_OST_NEW.PpNew1_ShortWidePreviewFormCreate(
  Sender: TObject);
begin
     PpNew1_ShortWide.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_OST_NEW.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
     PpOstNew1ShortWideUser.caption:=USERFIO_SHORT;
     PpOstNew1ShortWideUser2.caption:=USERFIO_SHORT;
     PpOstNew1ShortWideVers.caption:=PROG_VERSION;
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_OST_NEW.PpNew1_FullWidePreviewFormCreate(
  Sender: TObject);
begin
     PpNew1_fullWide.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_OST_NEW.ppTitleBand4BeforeGenerate(Sender: TObject);
begin
     PpOstNew1FullWideUser.caption:=USERFIO_SHORT;
     PpOstNew1FullWideUser2.caption:=USERFIO_SHORT;
     PpOstNew1FullWideVers.caption:=PROG_VERSION;
     try
       Ppimage7.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_OST_NEW.CheckBox3Click(Sender: TObject);
begin
   USL.Enabled:=not Checkbox3.checked;
   VALUE.Enabled:=not Checkbox3.checked;
   Checkbox2.enabled:=not Checkbox3.checked;
   Checkbox1.enabled:=not Checkbox3.checked;

   if Checkbox3.checked then begin
     Checkbox1.checked:=False;
     Checkbox2.checked:=true;
     USL.itemindex:=0;
     VALUE.value:=-100000000;
   end;
end;

procedure TREPORT_OST_NEW.ppTitleBand5BeforeGenerate(Sender: TObject);
begin
     PpShopUser.caption:=USERFIO_SHORT;
     PpShopUser2.caption:=USERFIO_SHORT;
     PpShopVers.caption:=PROG_VERSION;
     try
       Ppimage9.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_OST_NEW.ppDetailBand5BeforeGenerate(Sender: TObject);
begin
  if Report_SKLAD.fieldbyname('OST1').asfloat<>0 then PpShape11.Visible:=true
                                                else PpShape11.Visible:=false;
  if Report_SKLAD.fieldbyname('OST1').asfloat<0 then PpShape11.Brush.color:=$005151FF
                                            else PpShape11.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST2').asfloat<>0 then PpShape12.Visible:=true
                                                else PpShape12.Visible:=false;
  if Report_SKLAD.fieldbyname('OST2').asfloat<0 then PpShape12.Brush.color:=$005151FF
                                            else PpShape12.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST3').asfloat<>0 then PpShape13.Visible:=true
                                                else PpShape13.Visible:=false;
  if Report_SKLAD.fieldbyname('OST3').asfloat<0 then PpShape13.Brush.color:=$005151FF
                                            else PpShape13.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST4').asfloat<>0 then PpShape14.Visible:=true
                                                else PpShape14.Visible:=false;
  if Report_SKLAD.fieldbyname('OST4').asfloat<0 then PpShape14.Brush.color:=$005151FF
                                            else PpShape14.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST5').asfloat<>0 then PpShape15.Visible:=true
                                                else PpShape15.Visible:=false;
  if Report_SKLAD.fieldbyname('OST5').asfloat<0 then PpShape15.Brush.color:=$005151FF
                                            else PpShape15.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST6').asfloat<>0 then PpShape16.Visible:=true
                                                else PpShape16.Visible:=false;
  if Report_SKLAD.fieldbyname('OST6').asfloat<0 then PpShape16.Brush.color:=$005151FF
                                            else PpShape16.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST7').asfloat<>0 then PpShape17.Visible:=true
                                                else PpShape17.Visible:=false;
  if Report_SKLAD.fieldbyname('OST7').asfloat<0 then PpShape17.Brush.color:=$005151FF
                                            else PpShape17.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST8').asfloat<>0 then PpShape18.Visible:=true
                                                else PpShape18.Visible:=false;
  if Report_SKLAD.fieldbyname('OST8').asfloat<0 then PpShape18.Brush.color:=$005151FF
                                            else PpShape18.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST9').asfloat<>0 then PpShape19.Visible:=true
                                                else PpShape19.Visible:=false;
  if Report_SKLAD.fieldbyname('OST9').asfloat<0 then PpShape19.Brush.color:=$005151FF
                                            else PpShape19.Brush.color:=$00FFB9B9;
  if Report_SKLAD.fieldbyname('OST10').asfloat<>0 then PpShape20.Visible:=true
                                                else PpShape20.Visible:=false;
  if Report_SKLAD.fieldbyname('OST10').asfloat<0 then PpShape20.Brush.color:=$005151FF
                                            else PpShape20.Brush.color:=$00FFB9B9;
end;

procedure TREPORT_OST_NEW.PpRepSkladPreviewFormCreate(Sender: TObject);
begin
     PpRepSklad.PreviewForm.WindowState:=WsMaximized;
end;

procedure TREPORT_OST_NEW.VIDChange(Sender: TObject);
begin
   if VID.itemindex<0 then VID.itemindex:=0;
end;

procedure TREPORT_OST_NEW.BtnExportReportClick(Sender: TObject);
var
  _tmpRequest : TParamRequest;
  ReportRemainingGoods : TReportRemainingGoods;
  TXTReportRemainingGoods : TTXTReportRemainingGoods;

  excel: TExcelApplication ;
begin
 try
  //Отчет об остатках товара на всех складах. Группа:
  //формирование объекта запроса параметров для передачи в отчет
  _tmpRequest := TParamRequest.Create();
  Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  delay(1);
  Button3.enabled:=False;
  BtnExportReport.enabled:=False;
  BtnCreateReport.enabled:=False;
  ReportTransaction.Active:=False;
  if (CBExportFileType.ItemIndex = 1) then //надо выгрузить отчет в текстовый файл
  begin //при этом настройки "отчет для ревизии, с разбивкой по складам и широкий - игнорируются

    OpenReport1;
    {
    ReportTransaction.Active:=False;
    Report_NEW1.Close;
    Report_NEW1.Parambyname('PAR_ID').asinteger:=TW.tag;
    Report_NEW1.Parambyname('FRM_ID').asstring:=FRM.value;
    if SKL1.checked then Report_NEW1.Parambyname('SKL_ID').asinteger:=0
    else Report_NEW1.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
    if SKL1.checked then Report_NEW1.Parambyname('SKL_ID').asinteger:=0
    else Report_NEW1.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
//    s:=s+floattostrf(value.value,fffixed,19,4);
    _tmpRequest.AddParam('ReportName', reporttitle);
    Report_NEW1.Parambyname('USL').asinteger:=USL.itemindex+1;
    Report_NEW1.Parambyname('USL_VALUE').asfloat:=VALUE.value;
    Report_NEW1.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);
    }
    if not Report_NEW1.eof then
    begin
        Wait_Form.Gauge1.Progress:=100;
         delay(100);
         Wait_Form.Hide;
         _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
         _tmpRequest.AddParam('QMain', Report_NEW1); //основной запрос
         _tmpRequest.AddParam('FileName', ExportFilename.FileName); //название файла отчета
         //показать файл после создания или нет
         _tmpRequest.AddParam('isShowReportAfterCreating', CBShowAfterCreating.Checked);
    end;
  Wait_Form.Gauge1.Progress:=100;
  delay(80);
  Wait_Form.Hide;
  //строим сам отчет
   try
     TXTReportRemainingGoods := TTXTReportRemainingGoods.Create();
     TXTReportRemainingGoods.createReport(TParamRequest(_tmpRequest));
   finally
     if (TXTReportRemainingGoods <>nil) then TXTReportRemainingGoods.Free;
   end;
  Exit; //дальше идти не надо
  end;

  try     //если есть Excel выгружаем в него
    excel:=TExcelApplication.Create(nil);

    excel.Destroy;
  except  //если нет, то в Calc - дальше идти не надо
    ExpCalc;
    Exit;
  end;

  if CheckBox3.checked then begin
    // С разбивкой по складам
    OpenReport2;
{
    s:='Отчет об остатках товара на всех складах. Группа: '+TW.text;
    _tmpRequest.AddParam('ReportName', s);
    ReportTransaction.Active:=False;
    Report_SKLAD.Close;
    Report_SKLAD.Parambyname('PAR_ID').asinteger:=TW.tag;
    Report_SKLAD.Parambyname('FRM_ID').asstring:=FRM.value;
    Report_SKLAD.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);

 }
    if not Report_SKLAD.eof then
    begin
       WorkTransaction.Active:=False;
       OPEN_SQL(QueryWork,'select skl_short from skl where not skl_speed=0 '+
       'order by skl_speed');
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       //открываем отчет по всем складам
       _tmpRequest.AddParam('ReportName', ReportTitle);
       _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
       _tmpRequest.AddParam('QMain', Report_SKLAD); //основной запрос
       _tmpRequest.AddParam('isWideReport', Checkbox2.checked); //широкий отчет или нет
       _tmpRequest.AddParam('isAuditReportRequired', Checkbox1.checked); //нужен ли второй отчет для ревизии
       _tmpRequest.AddParam('isLayoutByDepots', Checkbox3.checked); //это отчет с разбивкой по складам или нет
       if (Checkbox3.checked) then //если отчет по складам, то надо передать вспомогательный запрос
          _tmpRequest.AddParam('QDepotNames', QueryWork); //запрос с именами складов
    end;
  end
  else
  begin
    // Без разбивки по складам
    OpenReport1;
    {
    ReportTransaction.Active:=False;
    Report_NEW1.Close;
    Report_NEW1.Parambyname('PAR_ID').asinteger:=TW.tag;
    Report_NEW1.Parambyname('FRM_ID').asstring:=FRM.value;
    s:='Отчет об остатках товаров группы: '+TW.text;
    if SKL1.checked then Report_NEW1.Parambyname('SKL_ID').asinteger:=0
    else Report_NEW1.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
    if SKL1.checked then s:=s+' на всех складах'
                    else s:=s+' на складе: '+SKL.text;
    case USL.itemindex of
      0: s:=s+', остаток товара больше ';
      1: s:=s+', остаток товара меньше ';
      2: s:=s+', остаток товара равен ';
    end;
    s:=s+floattostrf(value.value,fffixed,19,4);
    _tmpRequest.AddParam('ReportName', s);
    Report_NEW1.Parambyname('USL').asinteger:=USL.itemindex+1;
    Report_NEW1.Parambyname('USL_VALUE').asfloat:=VALUE.value;
    Report_NEW1.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);
    }
    if not Report_NEW1.eof then
    begin
          // Полный
         Wait_Form.Gauge1.Progress:=100;
         delay(100);
         Wait_Form.Hide;
         _tmpRequest.AddParam('ReportName', ReportTitle);
         _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
         _tmpRequest.AddParam('QMain', Report_NEW1); //основной запрос
         _tmpRequest.AddParam('isWideReport', Checkbox2.checked); //широкий отчет или нет
         _tmpRequest.AddParam('isAuditReportRequired', Checkbox1.checked); //нужен ли второй отчет для ревизии
         _tmpRequest.AddParam('isLayoutByDepots', Checkbox3.checked); //это отчет с разбивкой по складам или нет
    end
  end;

  Wait_Form.Gauge1.Progress:=100;
  delay(80);
  Wait_Form.Hide;
  if ReportTitle<>'' then
  //строим сам отчет
  try
     ReportRemainingGoods := TReportRemainingGoods.Create(TParamRequest(_tmpRequest), nil);
     ReportRemainingGoods.createReport();
  finally
     if (ReportRemainingGoods <>nil) then ReportRemainingGoods.Free;
  end;
 finally
  Wait_Form.Hide;
  Button3.enabled:=True;
  BtnExportReport.enabled:=True;
  BtnCreateReport.enabled:=True;
 end;
end;


{
//открывает все запросы и подготавливаает все данные для отчетов без их формирования
function PrepareReportParams: TParamRequest;
begin

end;

}
procedure TREPORT_OST_NEW.FormCreate(Sender: TObject);
begin
 CBExportFileType.ItemIndex:=0; //всегда по умолчанию сохраняем в Excel
 CBExportFileTypeChange(Self);
end;

procedure TREPORT_OST_NEW.CBExportFileTypeChange(Sender: TObject);
begin
 LExportFileName.Visible := not (CBExportFileType.ItemIndex = 0);
 ExportFilename.Visible := not (CBExportFileType.ItemIndex = 0);
 if (CBExportFileType.ItemIndex = 0) then
  BtnExportReport.Caption := 'Выгрузить отчет в файл MS Excel'
 else
  BtnExportReport.Caption := 'Выгрузить отчет в текстовый файл'
end;

procedure TREPORT_OST_NEW.Report_New1CalcFields(DataSet: TDataSet);
begin
  Report_New1.FieldByName('TW_KWM').asfloat := Report_New1.FieldByName('TW_KWM_ONE').asfloat*Report_New1.FieldByName('TW_OST').asfloat; 
end;

procedure TREPORT_OST_NEW.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TREPORT_OST_NEW.ExpCalc;
var
  ServiceManager: Olevariant;
  bounds: array[0..1] of integer;
  Desktop: Olevariant;
  Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
  dataArrayBounds: array [0..1,0..1] of integer;
  v : olevariant;
  FilePath: String;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    dbl: variant;
    cel: variant;
    i,j: integer;

  _tmpRequest : TParamRequest;
  ReportRemainingGoods : TReportRemainingGoods;
  TXTReportRemainingGoods : TTXTReportRemainingGoods;
begin
   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;
   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Отчет об остатках товаров.xlt');
     if (VarType(ServiceManager) = varDispatch) then
       Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

  Bounds[0] := 0;
  Bounds[1] := 0;

  ooParams := VarArrayCreate([0, 0], varVariant);
  ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
  ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
  ooValue.Name := 'AsTemplate';
  ooValue.Value := True;
  ooParams[0] := ooValue;
//Загрузка шаблона, пока работает криво
  Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
////////////////////////////////////////////
  try


  if CheckBox3.checked then begin
    // С разбивкой по складам  'Отчет об остатках товаров с разбивкой по складам.xlt'
    OpenReport2;
    if not Report_SKLAD.eof then
    begin
       WorkTransaction.Active:=False;
       OPEN_SQL(QueryWork,'select skl_short from skl where not skl_speed=0 '+
       'order by skl_speed');
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       //открываем отчет по всем складам
       _tmpRequest.AddParam('ReportName', ReportTitle);
       _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
       _tmpRequest.AddParam('QMain', Report_SKLAD); //основной запрос
       _tmpRequest.AddParam('isWideReport', Checkbox2.checked); //широкий отчет или нет
       _tmpRequest.AddParam('isAuditReportRequired', Checkbox1.checked); //нужен ли второй отчет для ревизии
       _tmpRequest.AddParam('isLayoutByDepots', Checkbox3.checked); //это отчет с разбивкой по складам или нет
       if (Checkbox3.checked) then //если отчет по складам, то надо передать вспомогательный запрос
          _tmpRequest.AddParam('QDepotNames', QueryWork); //запрос с именами складов
    end;
  end
  else
  begin
    // Без разбивки по складам
    OpenReport1;
    if not Report_NEW1.eof then
    begin
         Report_NEW1.Last;
         Report_NEW1.First;

         dataArrayBounds[0,0]:=0;
         dataArrayBounds[1,0]:=8;
         dataArrayBounds[0,1]:=0;
         dataArrayBounds[1,1]:=Report_New1.RecordCount+1000;
         v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);

         for i := 0 to dataArrayBounds[1,0] do
           for j := 0 to  dataArrayBounds[1,1] do
               v[i,j]:='';


        Report_NEW1.First;
        add_row:=0;
        for iRow:=0 to Report_NEW1.RecordCount-1 do
        begin
//          for iCol:=0 to dbgrid1.FieldCount - 1 do




            if old_tw_tree_id<>Report_NEW1.FieldByName('TWTREE_ID').asinteger then
            begin
              v[0,iRow+add_row] := Report_NEW1.FieldByName('TWTREE_FULL').asstring;
              inc(add_row);
              old_tw_tree_id:=Report_NEW1.FieldByName('TWTREE_ID').asinteger;

              Sheets := Document.GetSheets;
              Sheet := Sheets.GetByName('Лист1');
              cel := Sheet.GetCellByPosition(0,iRow+add_row+2);
              cel.charWeight:=150;
              cel.charHeight:=10;

     //         r := excel.Range[excel.Cells.Item[iRow +4+add_row, 1], excel.Cells.Item[iRow +4+add_row - 1,1 ]];
     //         r.Font.Bold:=true;
     //         r.Font.Size:=10;

            end;


            v[0, iRow+add_row] := iRow+1;
            v[1, iRow+add_row] := Report_NEW1.FieldByName('TW_ART').asVariant;
            v[2, iRow+add_row] := Report_NEW1.FieldByName('TW_NAM').asVariant;
            v[3, iRow+add_row] := Report_NEW1.FieldByName('ED_SHORT').asVariant;
            v[4, iRow+add_row] := Report_NEW1.FieldByName('TW_MROZ').asVariant;
            v[5, iRow+add_row] := Report_NEW1.FieldByName('TW_OST').asVariant;
            v[6, iRow+add_row] := Report_NEW1.FieldByName('TW_KWM').asVariant;
            v[7, iRow+add_row] := Report_NEW1.FieldByName('TW_SUMM').asVariant;
          Report_NEW1.Next;
        end;
        Report_NEW1.First;

        Sheets := Document.GetSheets;
        Sheet := Sheets.GetByName('Лист1');
        cel := Sheet.GetCellByPosition(0,0);
//        cel.setString('Новый итоговый отчет об остатках по фирмам на конец ' + dt.Text);
        cel := Sheet.GetCellByPosition(0,1);
        cel.setString('Группа товаров: '+ TW.Text);
        cel := Sheet.GetCellByPosition(0,2);



        cel.setString(tmpstring);

        Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+3,dataArrayBounds[1,0], dataArrayBounds[1,1]+3);
        Cell.SetDataArray(v);
    end
  end;

 finally
 end;
end;

procedure TREPORT_OST_NEW.BitBtn3Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select SKL_SHORT,SKL_ID from SKL order by SKL_SPEED');
     s:='';
     s2:='';
     if DualListDialog3.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog3.list2.Count do begin
            if QueryWork.Locate('SKL_SHORT',DualListDialog3.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('SKL_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('SKL_SHORT').asstring+',';
            end;
        end;
        s:=s+'%%';
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        SKL_S:=s;
        Edit2.text:=s2;
     end;
end;

end.
