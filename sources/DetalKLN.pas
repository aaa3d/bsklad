unit DetalKLN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, Db, IBCustomDataSet, IBQuery, IBDatabase, Mask, ToolEdit,
  CurrEdit, ExtCtrls,VclUtils, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppCtrls, ppPrnabl, ppBands, ppVar,DocSt,
  ppStrtch, ppMemo, RxLookup;

type
  TDetal_KLN = class(TForm)
    ToolBar1: TToolBar;
    Btn_Print: TToolButton;
    ToolButton2: TToolButton;
    KLN_NAME3: TEdit;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    KlnTransaction: TIBTransaction;
    QrKlnST: TIBQuery;
    QrKlnSTST_ID: TIntegerField;
    QrKlnSTST_NUM_FULL: TIBStringField;
    QrKlnSTST_DATE: TDateTimeField;
    QrKlnSTST_SUMM: TFloatField;
    QrKlnSTST_COLOR: TIntegerField;
    QrKlnSTUS_FULL: TIBStringField;
    QrKlnSTKLN_ORG: TIBStringField;
    QrKlnSTKLN_PREFIX: TIBStringField;
    QrKlnSTVALUTA_SHORT: TIBStringField;
    DsKlnST: TDataSource;
    QrKlnPN: TIBQuery;
    QrKlnRN: TIBQuery;
    DsKlnPN: TDataSource;
    DsKlnRN: TDataSource;
    QrKlnRNRN_ID: TIntegerField;
    QrKlnRNRN_PROW: TIBStringField;
    QrKlnRNRN_NUM_FULL: TIBStringField;
    QrKlnRNRN_DATE: TDateTimeField;
    QrKlnRNSKL_SHORT: TIBStringField;
    QrKlnRNRN_SUMM: TFloatField;
    QrKlnRNRN_OTG: TSmallintField;
    QrKlnRNRN_COLOR: TIntegerField;
    QrKlnRNUS_FULL: TIBStringField;
    QrKlnRNRNVID_NAM: TIBStringField;
    QrKlnRNKLN_ORG: TIBStringField;
    QrKlnRNRN_KURS: TFloatField;
    QrKlnRNVALUTA_SHORT: TIBStringField;
    QrKlnPNPN_ID: TIntegerField;
    QrKlnPNPN_PROW: TIBStringField;
    QrKlnPNPN_NUM_FULL: TIBStringField;
    QrKlnPNPN_DATE: TDateTimeField;
    QrKlnPNPN_DATE_OPL: TDateTimeField;
    QrKlnPNSKL_SHORT: TIBStringField;
    QrKlnPNPN_SUMM: TFloatField;
    QrKlnPNPN_SUMM_S: TFloatField;
    QrKlnPNPN_POL: TSmallintField;
    QrKlnPNPN_COLOR: TIntegerField;
    QrKlnPNUS_FULL: TIBStringField;
    QrKlnPNPNVID_NAM: TIBStringField;
    QrKlnPNOWNER_FULL: TIBStringField;
    QrKlnPNKLN_ORG: TIBStringField;
    QrKlnPNPN_KURS: TFloatField;
    QrKlnPNPN_NUM: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    Label1: TLabel;
    KLN_FAM: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    KLN_NAME: TEdit;
    KLN_NAME2: TEdit;
    Label4: TLabel;
    KLN_ORG: TEdit;
    KLN_BNK: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    KLN_BNK_ADR: TMemo;
    KLN_KB: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    KLN_RS: TEdit;
    KLN_BIK: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    KLN_KS: TEdit;
    IbQuery1: TIBQuery;
    TabSheet5: TTabSheet;
    Panel1: TPanel;
    RxDBGrid5: TRxDBGrid;
    Label5: TLabel;
    SUMMR: TRxCalcEdit;
    Label6: TLabel;
    SUMMZ: TRxCalcEdit;
    QrKlnOST: TIBQuery;
    DsKLNOst: TDataSource;
    QrKlnOSTTW_ID: TIntegerField;
    QrKlnOSTTW_ART: TIntegerField;
    QrKlnOSTTW_NAM: TIBStringField;
    QrKlnOSTED_SHORT: TIBStringField;
    QrKlnOSTTW_MROZ: TFloatField;
    QrKlnOSTTW_OST: TFloatField;
    QrKlnOSTOST_SUMMZ: TFloatField;
    QrKlnOSTOST_SUMMR: TFloatField;
    QrKlnSTST_DATE_FULL: TStringField;
    QrKlnPNPN_DATE_FULL: TStringField;
    QrKlnRNRN_DATE_FULL: TStringField;
    ToolButton1: TToolButton;
    PipKlnSt: TppDBPipeline;
    PpKlnSt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape2: TppShape;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel17: TppLabel;
    PnSt_Org: TppDBText;
    ppImage7: TppImage;
    ppImage6: TppImage;
    ppLabel142: TppLabel;
    PpStVers: TppLabel;
    ppLabel144: TppLabel;
    ppLabel18: TppLabel;
    PpStVers2: TppLabel;
    ppLabel20: TppLabel;
    ppLabel585: TppLabel;
    ppSystemVariable49: TppSystemVariable;
    ppLabel586: TppLabel;
    ppSystemVariable50: TppSystemVariable;
    ppLabel605: TppLabel;
    ppSystemVariable51: TppSystemVariable;
    PpStUser: TppLabel;
    ppLabel619: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel23: TppLabel;
    PpStUser2: TppLabel;
    ppLine2: TppLine;
    PipKlnPn: TppDBPipeline;
    PipKlnRn: TppDBPipeline;
    PipKlnOst: TppDBPipeline;
    BtnAnaliz: TToolButton;
    ToolButton5: TToolButton;
    PpKlnPn: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppTitleBand2: TppTitleBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText13: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppLine3: TppLine;
    ppShape3: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppImage2: TppImage;
    ppLabel36: TppLabel;
    PpPnVers: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel40: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel41: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    PpPnUser: TppLabel;
    ppLabel43: TppLabel;
    ppShape4: TppShape;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    PpPnVers2: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel58: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel59: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel60: TppLabel;
    PpPnUSer2: TppLabel;
    ppLine4: TppLine;
    ppLabel62: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    PpKlnRn: TppReport;
    ppTitleBand3: TppTitleBand;
    ppLabel37: TppLabel;
    ppLabel42: TppLabel;
    ppShape5: TppShape;
    ppImage5: TppImage;
    ppLabel68: TppLabel;
    PpRnVers: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel72: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel73: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    PpRnUser: TppLabel;
    ppLabel75: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppShape6: TppShape;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppImage9: TppImage;
    ppLabel83: TppLabel;
    PpRnVers2: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel87: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel88: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppLabel89: TppLabel;
    PpRnUser2: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppLine5: TppLine;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppLine6: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLabel91: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppDBText14: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    ppLabel76: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel55: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    PpRn_Org: TppLabel;
    Pn_Org: TppLabel;
    QrKlnOSTOST1: TFloatField;
    QrKlnOSTOST2: TFloatField;
    QrKlnOSTOST3: TFloatField;
    QrKlnOSTOST4: TFloatField;
    QrKlnOSTOST5: TFloatField;
    QrKlnOSTOST6: TFloatField;
    QrKlnOSTOST7: TFloatField;
    QrKlnOSTOST8: TFloatField;
    QrKlnOSTOST9: TFloatField;
    QrKlnOSTOST10: TFloatField;
    PpKlnOst: TppReport;
    ppTitleBand5: TppTitleBand;
    ppLabel90: TppLabel;
    ppLabel100: TppLabel;
    ppImage13: TppImage;
    ppLabel109: TppLabel;
    PpOstVers: TppLabel;
    ppLabel124: TppLabel;
    ppLabel127: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppLabel129: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppLabel130: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    PpOstUser: TppLabel;
    ppLabel132: TppLabel;
    ppShape9: TppShape;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    PpOst_Org: TppLabel;
    ppHeaderBand5: TppHeaderBand;
    ppShape10: TppShape;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppImage15: TppImage;
    ppLabel156: TppLabel;
    PpOstVers2: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppLabel160: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppLabel161: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppLabel162: TppLabel;
    PpOstUser2: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine10: TppLine;
    ppLabel164: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ppDBMemo16: TppDBMemo;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    S1: TppLabel;
    S2: TppLabel;
    S3: TppLabel;
    S4: TppLabel;
    S5: TppLabel;
    S6: TppLabel;
    S7: TppLabel;
    S8: TppLabel;
    S9: TppLabel;
    S10: TppLabel;
    S20: TppLabel;
    S19: TppLabel;
    S18: TppLabel;
    S17: TppLabel;
    S16: TppLabel;
    S15: TppLabel;
    S14: TppLabel;
    S13: TppLabel;
    S12: TppLabel;
    S11: TppLabel;
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
    ppLine9: TppLine;
    QrKlnRNRN_SUMM2: TFloatField;
    BtnPeriod: TToolButton;
    RNPeriod: TppLabel;
    PnPeriod: TppLabel;
    StatusBar3: TStatusBar;
    QrKlnOSTOST11: TFloatField;
    QrKlnOSTOST12: TFloatField;
    QrKlnOSTOST13: TFloatField;
    QrKlnOSTOST14: TFloatField;
    QrKlnOSTOST15: TFloatField;
    QrKlnOSTOST16: TFloatField;
    QrKlnOSTOST17: TFloatField;
    QrKlnOSTOST18: TFloatField;
    QrKlnOSTOST19: TFloatField;
    QrKlnOSTOST20: TFloatField;
    Panel2: TPanel;
    StatusBar2: TStatusBar;
    CB: TComboBox;
    Label7: TLabel;
    FRM: TRxDBLookupCombo;
    Label8: TLabel;
    QrKlnRNRN_NAC: TFloatField;
    QrKlnRNNAC_PERCENT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure Btn_PrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QrKlnSTCalcFields(DataSet: TDataSet);
    procedure QrKlnPNCalcFields(DataSet: TDataSet);
    procedure QrKlnRNCalcFields(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpKlnStPreviewFormCreate(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure PpKlnPnPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure PpKlnRnPreviewFormCreate(Sender: TObject);
    procedure PpKlnOstPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand5BeforeGenerate(Sender: TObject);
    procedure RxDBGrid5GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure BtnPeriodClick(Sender: TObject);
    procedure CBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DT1,DT2:Tdatetime;
  Detal_KLN: TDetal_KLN;
  MAIN_ST:integer;
  CanRefresh,R2,R3,R4,R5:Boolean;
  RDT1,RDT2,PDT1,PDT2:tdatetime;

implementation

uses DateInterval;

{$R *.DFM}

procedure TDetal_KLN.FormShow(Sender: TObject);
var
  c:integer;
begin
     RDT1:=encodedate(1997,1,1);
     RDT2:=date();
     PDT1:=encodedate(1997,1,1);
     PDT2:=date();
     DT1:=encodedate(1997,1,1);
     DT2:=date();
     CanRefresh:=False;
     BtnAnaliz.enabled:=False;
     {Выводим отображение}
     KLNtransaction.Active:=False;
     QrKLNST.close;
     QrKLNST.ParamByname('KLN_ID').asinteger:=Detal_KLN.tag;
     QrKLNPN.close;
     QrKLNPN.ParamByname('KLN_ID').asinteger:=Detal_KLN.tag;
     QrKLNPN.ParamByname('DT1').asdatetime:=PDT1;
     QrKLNPN.ParamByname('DT2').asdatetime:=PDT2+1-SEKOND1;
     QrKLNRN.close;
     QrKLNRN.ParamByname('KLN_ID').asinteger:=Detal_KLN.tag;
     QrKLNRN.ParamByname('DT1').asdatetime:=RDT1;
     QrKLNRN.ParamByname('DT2').asdatetime:=RDT2+1-SEKOND1;
     QrKLNRN.ParamByname('TYP').asstring:='%1%2%';
     QrKLNOST.close;
     QrKLNOST.ParamByname('KLN_ID').asinteger:=Detal_KLN.tag;
     IbQuery1.close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select * from KLN where KLN_ID=:KLN_ID');
     IbQuery1.PAramByname('KLN_ID').asinteger:=Detal_KLN.tag;
     IbQuery1.Open;
     MAIN_ST:=IbQuery1.fieldByname('MAIN_ST').asinteger;
     KLN_FAM.text:=IbQuery1.fieldByname('KLN_FAM').asstring;
     KLN_NAME.text:=IbQuery1.fieldByname('KLN_NAME').asstring;
     KLN_NAME2.text:=IbQuery1.fieldByname('KLN_NAME2').asstring;
     KLN_ORG.text:=IbQuery1.fieldByname('KLN_ORG').asstring;
     KLN_BNK.text:=IbQuery1.fieldByname('KLN_BNK').asstring;
     KLN_BNK_ADR.lines.clear;
     KLN_BNK_ADR.lines.add(IbQuery1.fieldByname('KLN_BNKADR').asstring);
     KLN_KB.text:=IbQuery1.fieldByname('KLN_KB').asstring;
     KLN_KS.text:=IbQuery1.fieldByname('KLN_KS').asstring;
     KLN_RS.text:=IbQuery1.fieldByname('KLN_RS').asstring;
     KLN_BIK.text:=IbQuery1.fieldByname('KLN_BIK').asstring;
     IbQuery1.close;
     R2:=False;
     R3:=False;
     R4:=False;
     R5:=False;
     Pagecontrol1.ActivePage:=Tabsheet1;


     FRM.EmptyValue:='0';
     FRM.DisplayEmpty:='<Все>';

     FRM.Value:=inttostr(GL_FRM_WORK_MODE);


     {Заполняем названия для быстрых остатков}
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select SKL_ID,SKL_SHORT FROM SKL WHERE SKL_SPEED>0 order by SKL_SPEED');
     c:=0;
     while not QueryWork.eof do begin
       inc(c);
       RxDbgrid5.Columns[6+c].Title.Caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
       case c of
         1: begin
              s1.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s11.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         2: begin
              s2.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s12.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         3: begin
              s3.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s13.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         4: begin
              s4.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s14.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         5: begin
              s5.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s15.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         6: begin
              s6.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s16.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         7: begin
              s7.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s17.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         8: begin
              s8.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s18.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         9: begin
              s9.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s19.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
         10: begin
              s10.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
              s20.caption:=QueryWork.fieldByname('SKL_SHORT').asstring;
            end;
       end;
       QueryWork.next;
     end;
     CanRefresh:=true;
end;

procedure TDetal_KLN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrKLNST.close;
     QrKLNPN.close;
     QrKLNRN.close;
     QrKLNOST.close;
     KLNtransaction.Active:=False;
end;

procedure TDetal_KLN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#49 then begin
        Pagecontrol1.ActivePage:=Tabsheet1;
        key:=#0;
     end;
     if key=#50 then begin
        key:=#0;
        Pagecontrol1.ActivePage:=Tabsheet2;
        PageControl1Change(Sender);
     end;
     if key=#51 then begin
        key:=#0;
        Pagecontrol1.ActivePage:=Tabsheet3;
        PageControl1Change(Sender);
     end;
     if key=#52 then begin
        key:=#0;
        Pagecontrol1.ActivePage:=Tabsheet4;
        PageControl1Change(Sender);
     end;
     if key=#53 then begin
        key:=#0;
        Pagecontrol1.ActivePage:=Tabsheet5;
        PageControl1Change(Sender);
     end;
end;

procedure TDetal_KLN.PageControl1Change(Sender: TObject);
begin
     BtnAnaliz.enabled:=False;
     Statusbar1.panels[0].text:='';
     BtnPeriod.enabled:=(PageControl1.ActivePage=Tabsheet4) or (PageControl1.ActivePage=Tabsheet3);
     if ((PageControl1.ActivePage=Tabsheet2)
        or (PageControl1.ActivePage=Tabsheet3)
        or (PageControl1.ActivePage=Tabsheet4)) then BtnAnaliz.enabled:=true
        else BtnAnaliz.enabled:=False;
     if ((PageControl1.ActivePage=Tabsheet2) and (not R2)) then begin
        R2:=True;
        QrKLNSt.open;
        RxDbgrid1.setfocus;
     end;
     if ((PageControl1.ActivePage=Tabsheet3) and (not R3)) then begin
        R3:=True;
        QrKLNPN.open;
        RxDbgrid2.setfocus;
     end;
     if ((PageControl1.ActivePage=Tabsheet4) and (not R4)) then begin
        R4:=True;
        QrKLNRN.ParamByname('FRM_ID').asstring:=FRM.Value;
        QrKLNRN.open;
        RxDbgrid3.setfocus;
     end;
     if ((PageControl1.ActivePage=Tabsheet5) and (not R5)) then begin
        R5:=True;
        QrKLNOSt.open;
        QrKLNOSt.DisableControls;
        SUMMZ.value:=0;
        SUMMR.value:=0;
        while not QrKLNOST.eof do begin
              SUMMZ.value:=SUMMZ.value+QrKLNOST.fieldByname('OST_SUMMZ').asfloat;
              SUMMR.value:=SUMMR.value+QrKLNOST.fieldByname('OST_SUMMR').asfloat;
              QrKLNOST.next;
        end;
        QrKLNOST.first;
        QrKLNOSt.EnableControls;
        RxDbgrid5.setfocus;
     end;
     Statusbar3.Panels[0].text:='За период с '+date_sokr(Pdt1)+' по '+date_sokr(PDT2);
     Statusbar2.Panels[0].text:='За период с '+date_sokr(Rdt1)+' по '+date_sokr(RDT2);
end;

procedure TDetal_KLN.Btn_PrintClick(Sender: TObject);
begin
     if Pagecontrol1.ActivePage=Tabsheet1 then begin
        {Общая информация}
        B_DButils.PRINT_DETALKLN(Detal_KLn.tag);
     end;
     if Pagecontrol1.ActivePage=Tabsheet2 then begin
        {Счета}
        PnSt_Org.caption:=KLN_NAME3.text;
        PpKlnSt.reset;
        PpKlnSt.Print;
     end;
     if Pagecontrol1.ActivePage=Tabsheet3 then begin
        {Приходы}
        PN_ORG.caption:=KLN_NAME3.text;
        PpKlnPn.reset;
        PpKlnPn.Print;
     end;
     if Pagecontrol1.ActivePage=Tabsheet4 then begin
        {Расходы}
        PpRn_ORG.caption:=KLN_NAME3.text;
        PpKlnRn.reset;
        PpKlnRn.Print;
     end;
     if Pagecontrol1.ActivePage=Tabsheet5 then begin
        {Остатки}
        PpOst_Org.caption:=KLN_NAME3.text;
        PpKlnOst.reset;
        PpKlnOst.Print;
     end;
end;

procedure TDetal_KLN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=120 then begin
        key:=0;
        Btn_Print.click;
     end;
end;

procedure TDetal_KLN.QrKlnSTCalcFields(DataSet: TDataSet);
begin
     QrKlnSt.fieldByname('ST_DATE_FULL').asstring:=
     date_sokr(QrKlnSt.fieldByname('ST_DATE').asdatetime)+' '+
     timetostr(QrKlnSt.fieldByname('ST_DATE').asdatetime);
end;

procedure TDetal_KLN.QrKlnPNCalcFields(DataSet: TDataSet);
begin
     QrKlnPN.fieldByname('PN_DATE_FULL').asstring:=
     date_sokr(QrKlnPN.fieldByname('PN_DATE').asdatetime)+' '+
     timetostr(QrKlnPN.fieldByname('PN_DATE').asdatetime);
end;

procedure TDetal_KLN.QrKlnRNCalcFields(DataSet: TDataSet);
begin
     QrKlnRN.fieldByname('RN_DATE_FULL').asstring:=
     date_sokr(QrKlnRN.fieldByname('RN_DATE').asdatetime)+' '+
     timetostr(QrKlnRN.fieldByname('RN_DATE').asdatetime);
end;

procedure TDetal_KLN.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDetal_KLN.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpStUser.Caption:=USERFIO_SHORT;
     PpStUser2.Caption:=USERFIO_SHORT;
     PpStVers.caption:=PROG_VERSION;
     PpStVers2.caption:=PROG_VERSION;
     try
       Ppimage7.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_KLN.PpKlnStPreviewFormCreate(Sender: TObject);
begin
     PpKlnSt.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_KLN.BtnAnalizClick(Sender: TObject);
begin
  if (PageControl1.ActivePage=Tabsheet2) then begin
     if Not QrKlnSt.eof then begin
        Application.CreateForm(TDoc_ST,Doc_ST);
        Doc_ST.tag:=QrKlnSt.fieldbyname('ST_ID').asinteger;
        Doc_ST.showModal;
        Doc_ST.destroy;
     end;
  end;
  if (PageControl1.ActivePage=Tabsheet3) then begin
     // Анализ приходной накладной
     if not QrKlnPn.eof then SHOW_ANALIZ_PN(QrKlnPn.Fieldbyname('PN_ID').asinteger);
  end;
  if (PageControl1.ActivePage=Tabsheet4) then begin
     // Анализ расходной накладной
     if not QrKlnRn.eof then SHOW_ANALIZ_RN(QrKlnRn.Fieldbyname('RN_ID').asinteger);
  end;
end;

procedure TDetal_KLN.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpPnUser.Caption:=USERFIO_SHORT;
     PpPnUser2.Caption:=USERFIO_SHORT;
     PpPnVers.caption:=PROG_VERSION;
     PpPnVers2.caption:=PROG_VERSION;
     PnPeriod.caption:='За период с '+date_sokr(Pdt1)+' по '+date_sokr(Pdt2);
     try
       Ppimage2.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_KLN.PpKlnPnPreviewFormCreate(Sender: TObject);
begin
     PpKlnPn.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_KLN.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
     PpRnUser.Caption:=USERFIO_SHORT;
     PpRnUser2.Caption:=USERFIO_SHORT;
     PpRnVers.caption:=PROG_VERSION;
     PpRnVers2.caption:=PROG_VERSION;
     RnPeriod.caption:='За период с '+date_sokr(Rdt1)+' по '+date_sokr(Rdt2);
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_KLN.PpKlnRnPreviewFormCreate(Sender: TObject);
begin
     PpKlnRn.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_KLN.PpKlnOstPreviewFormCreate(Sender: TObject);
begin
     PpKlnOst.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_KLN.ppTitleBand5BeforeGenerate(Sender: TObject);
begin
     PpOstUser.Caption:=USERFIO_SHORT;
     PpOstUser2.Caption:=USERFIO_SHORT;
     PpOstVers.caption:=PROG_VERSION;
     PpOstVers2.caption:=PROG_VERSION;
     try
       Ppimage13.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TDetal_KLN.RxDBGrid5GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  s:ansistring;
begin
     Afont.color:=clWindowText;
     Background:=clWindow;
     s:=Field.FieldName;
     if ((s='OST1') or (s='OST2') or (s='OST3') or (s='OST4')
        or (s='OST5') or (s='OST6') or (s='OST7') or (s='OST8')
         or (s='OST9') or (s='OST10')) then
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat<>0 then begin
        Afont.color:=clHighlighttext;
        Background:=clHighLight;
     end;

end;

procedure TDetal_KLN.ppDetailBand5BeforeGenerate(Sender: TObject);
begin
  if (QrKlnOst.fieldbyname('OST1').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST1').asfloat<0.0001) then PpShape11.visible:=False
                                    else PpShape11.visible:=True;
    if (QrKlnOst.fieldbyname('OST2').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST2').asfloat<0.0001) then PpShape12.visible:=False
                                    else PpShape12.visible:=True;
    if (QrKlnOst.fieldbyname('OST3').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST3').asfloat<0.0001) then PpShape13.visible:=False
                                    else PpShape13.visible:=True;
    if (QrKlnOst.fieldbyname('OST4').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST4').asfloat<0.0001) then PpShape14.visible:=False
                                    else PpShape14.visible:=True;
    if (QrKlnOst.fieldbyname('OST5').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST5').asfloat<0.0001) then PpShape15.visible:=False
                                    else PpShape15.visible:=True;
    if (QrKlnOst.fieldbyname('OST6').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST6').asfloat<0.0001) then PpShape16.visible:=False
                                    else PpShape16.visible:=True;
    if (QrKlnOst.fieldbyname('OST7').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST7').asfloat<0.0001) then PpShape17.visible:=False
                                    else PpShape17.visible:=True;
    if (QrKlnOst.fieldbyname('OST8').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST8').asfloat<0.0001) then PpShape18.visible:=False
                                    else PpShape18.visible:=True;
    if (QrKlnOst.fieldbyname('OST9').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST9').asfloat<0.0001) then PpShape19.visible:=False
                                    else PpShape19.visible:=True;
    if (QrKlnOst.fieldbyname('OST10').asfloat>-0.0001) and
     (QrKlnOst.fieldbyname('OST10').asfloat<0.0001) then PpShape20.visible:=False
                                    else PpShape20.visible:=True;
end;

procedure TDetal_KLN.RxDBGrid3DblClick(Sender: TObject);
begin
   //Анализ расходной клиента
   if not QrKlnRn.eof then begin
     SHOW_ANALIZ_RN(QrKlnRn.fieldbyname('RN_ID').asinteger);
   end;

end;

procedure TDetal_KLN.RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then begin
      key:=#0;
      //Анализ расходной клиента
      if not QrKlnRn.eof then begin
        SHOW_ANALIZ_RN(QrKlnRn.fieldbyname('RN_ID').asinteger);
      end;
    end;
end;

procedure TDetal_KLN.BtnPeriodClick(Sender: TObject);
begin
    if PageControl1.ActivePage=Tabsheet4 then begin
        // Расход
        Application.createForm(TDate_interval,Date_Interval);
        Date_interval.Dt1.date:=RDT1;
        Date_interval.Dt2.date:=RDT2;
        Date_interval.Showmodal;
        if Date_interval.tag=2 then begin
           RDT1:=Date_interval.Dt1.date;
           RDT2:=Date_interval.Dt2.date;
           Statusbar2.Panels[0].text:='За период с '+date_sokr(Rdt1)+' по '+date_sokr(Rdt2);
           QrKLNRN.close;
           QrKLNRN.ParamByname('DT1').asdatetime:=RDT1;
           QrKLNRN.ParamByname('DT2').asdatetime:=RDT2+1-sekond1;
           QrKLNRN.open;
           R4:=True;
           QrKLNRN.open;
        end;
        Date_interval.destroy;

    end;
    if PageControl1.ActivePage=Tabsheet3 then begin
        // Приход
        Application.createForm(TDate_interval,Date_Interval);
        Date_interval.Dt1.date:=PDT1;
        Date_interval.Dt2.date:=PDT2;
        Date_interval.Showmodal;
        if Date_interval.tag=2 then begin
           PDT1:=Date_interval.Dt1.date;
           PDT2:=Date_interval.Dt2.date;
           Statusbar3.Panels[0].text:='За период с '+date_sokr(Pdt1)+' по '+date_sokr(Pdt2);
           QrKLNPN.close;
           QrKLNPN.ParamByname('DT1').asdatetime:=PDT1;
           QrKLNPN.ParamByname('DT2').asdatetime:=PDT2+1-sekond1;
           QrKLNPN.open;
           R3:=True;
           QrKLNPN.open;
        end;
        Date_interval.destroy;

    end;
end;

procedure TDetal_KLN.CBChange(Sender: TObject);
begin
  QrKLNRN.DisableControls;
  QrKLNRN.close;
  case CB.ItemIndex of
    0:QrKLNRN.ParamByname('TYP').asstring:='%1%2%';
    1:QrKLNRN.ParamByname('TYP').asstring:='%2%';
    2:QrKLNRN.ParamByname('TYP').asstring:='%1%';
  end;
  QrKLNRN.ParamByname('FRM_ID').asstring:=FRM.Value;
  QrKLNRN.open;
  QrKLNRN.EnableControls;
  RxDbgrid3.setfocus;
end;

end.
