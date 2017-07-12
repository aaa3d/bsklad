unit JouPN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,
  Db, IBCustomDataSet, IBQuery,B_DButils,B_Utils,IBDatabase,AdminPn,
  Menus,VclUtils, ppDB, ppCtrls, ppBands, ppVar, ppMemo, ppStrtch,
  ppRegion, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
  ppDBPipe, RxLookup, StdCtrls, RxMemDS,DocPn2, ActnList, FR_DSet,
  FR_DBSet, FR_Class, FR_E_TXT, FR_E_RTF, FR_E_HTM, FR_E_CSV, Buttons;

type
  TJou_PN = class(TDefault_Journal)
    QrPnList: TIBQuery;
    DsPnList: TDataSource;
    PnListTranSaction: TIBTransaction;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNEW: TMenuItem;
    MnOPEN: TMenuItem;
    MnCopy: TMenuItem;
    MnDEL: TMenuItem;
    N8: TMenuItem;
    MnPRINT: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnAnaliz: TMenuItem;
    MnSubDoc: TMenuItem;
    N14: TMenuItem;
    MnInterval: TMenuItem;
    N15: TMenuItem;
    MnAdm: TMenuItem;
    PipPnList: TppDBPipeline;
    PpPNLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppLabel1: TppLabel;
    ppRegion79: TppRegion;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel441: TppLabel;
    ppLabel442: TppLabel;
    ppLabel443: TppLabel;
    ppLabel482: TppLabel;
    ppLabel483: TppLabel;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel449: TppLabel;
    ppLabel450: TppLabel;
    ppLabel461: TppLabel;
    ppLabel465: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    PpSumm1: TppDBText;
    ppDBMemo91: TppDBMemo;
    PpKln_Org: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppFooterBand14: TppFooterBand;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    ppLabel457: TppLabel;
    PpPnListUser: TppLabel;
    PnListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpPnListVers: TppLabel;
    ppLabel462: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBText1: TppDBText;
    PpSumm2: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel14: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    PnListTitle1: TppMemo;
    ToolBar2: TToolBar;
    Label1: TLabel;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    FRM: TRxDBLookupCombo;
    ToolButton10: TToolButton;
    Label2: TLabel;
    ToolButton11: TToolButton;
    VID: TRxDBLookupCombo;
    ToolButton12: TToolButton;
    Label3: TLabel;
    ToolButton13: TToolButton;
    OWN: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemPnVid: TRxMemoryData;
    MemOwner: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    MemPnVidPNVID_ID: TIntegerField;
    MemPnVidPNVID_NAME: TStringField;
    MemOwnerOWNER_ID: TIntegerField;
    MemOwnerOWNER_NAME: TStringField;
    DsFrm: TDataSource;
    DsPnVid: TDataSource;
    DsOwner: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QrPnListPN_ID: TIntegerField;
    QrPnListPN_PROW: TIBStringField;
    QrPnListPN_NUM_FULL: TIBStringField;
    QrPnListPN_DATE: TDateTimeField;
    QrPnListPN_DATE_OPL: TDateTimeField;
    QrPnListSKL_SHORT: TIBStringField;
    QrPnListPN_SUMM: TFloatField;
    QrPnListPN_SUMM2: TFloatField;
    QrPnListPN_COLOR: TIntegerField;
    QrPnListUS_FULL: TIBStringField;
    QrPnListPNVID_NAM: TIBStringField;
    QrPnListOWNER_FULL: TIBStringField;
    QrPnListKLN_ORG: TIBStringField;
    QrPnListPN_KURS: TFloatField;
    QrPnListKLN_PREFIX: TIBStringField;
    QrPnListPN_NUM: TIBStringField;
    QrPnListPN_OST: TFloatField;
    QrPnListPN_OSN: TIBStringField;
    QrPnListPN_NAKL_MET: TIntegerField;
    ActionList1: TActionList;
    MnPnNakl: TAction;
    ToolButton15: TToolButton;
    N4: TMenuItem;
    Label4: TLabel;
    MemSkl: TRxMemoryData;
    MemSklSKL_ID: TIntegerField;
    MemSklSKL_FULL: TStringField;
    DsSKL: TDataSource;
    SKL: TRxDBLookupCombo;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    QrPnListWOZW_MET: TIntegerField;
    QrPnListPN_SUMM2_ALL: TFloatField;
    QrPnListNDS_SUMM_ALL: TFloatField;
    QrPnListPN_STFAKT: TIBStringField;
    QrPnListPN_PRIM: TIBStringField;
    QrPnListPN_DOCS: TStringField;
    mnu_pn_docs: TMenuItem;
    mnuSFAKT: TMenuItem;
    mnuTTN: TMenuItem;
    mnuPrim: TMenuItem;
    mnuAllDocs: TMenuItem;
    N6: TMenuItem;
    QrPnList2: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IBStringField3: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField2: TIntegerField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    FloatField3: TFloatField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    FloatField4: TFloatField;
    IBStringField10: TIBStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    StringField1: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    QrPnListpn_weight: TFloatField;
    PN_WEIGHT: TppField;
    ppDBCalc2: TppDBCalc;
    ppLabel15: TppLabel;
    KLN_NAME: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrPnListAfterScroll(DataSet: TDataSet);
    procedure QrPnListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnAdmClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure PpPNLISTPreviewFormCreate(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure VIDChange(Sender: TObject);
    procedure OWNChange(Sender: TObject);
    procedure MnPnNaklExecute(Sender: TObject);
    procedure RxDBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure mnuSFAKTClick(Sender: TObject);
    procedure mnuTTNClick(Sender: TObject);
    procedure mnuPrimClick(Sender: TObject);
    procedure mnuAllDocsClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure SetListOrder(const OrderColumn: String; needToChangeOrder:boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ANALIZ,CAN_ADM:boolean;
  Jou_PN: TJou_PN;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  CAN_REFRESH:boolean;
  curOrderColumn : String; //текущий столбец сортировки
  curOrderDirection : String; //текущее направление сортировки
  kln_group_id: integer;

implementation

uses DateInterval, FindDocNum, SetJouDate, SelectPrint, PnNaklDoc,
  DocPnWozw, SelectNew , EditText, DicKlient;

{$R *.DFM}

procedure TJou_PN.FormShow(Sender: TObject);
begin
  inherited;
  // Наполняем таблицы фильтров
  CAN_REFRESH:=False;

  kln_group_id:=0;

  WorkTransaction.Active:=False;
  MemSKL.EmptyTable;
  MemSkl.Append;
  MemSkl.fieldByname('SKL_ID').asinteger:=0;
  MemSkl.fieldByname('SKL_FULL').asstring:='<Все>';
  MemSkl.Post;
  OPEN_SQL(QueryWork,'select skl_id,skl_full from skl order by skl_full');
  while not QueryWork.eof do begin
    MemSkl.Append;
    MemSkl.fieldByname('SKL_ID').asinteger:=QueryWork.fieldByname('SKL_ID').asinteger;
    MemSkl.fieldByname('SKL_FULL').asstring:=QueryWork.fieldByname('SKL_FULL').asstring;
    MemSkl.Post;
    QueryWork.next;
  end;
  MemFrm.EmptyTable;
  MemFrm.Append;
  MemFrm.fieldByname('FRM_ID').asinteger:=0;
  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
  MemFrm.Post;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(:FRM_ID) order by 2');
  QueryWork.ParamByname('FRM_ID').asinteger:=DEFAULT_FIRMA;
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
  MemPnVid.EmptyTable;
  MemPnVid.Append;
  MemPnVid.fieldByname('PNVID_ID').asinteger:=0;
  MemPnVid.fieldByname('PNVID_NAME').asstring:='<Все>';
  MemPnVid.Post;
  DataModule1.MainDicPnVid.First;
  while not DataModule1.MainDicPnVid.eof do begin
    MemPnVid.Append;
    MemPnVid.fieldByname('PNVID_ID').asinteger:=DataModule1.MainDicPnVid.fieldByname('PNVID_ID').asinteger;
    MemPnVid.fieldByname('PNVID_NAME').asstring:=DataModule1.MainDicPnVid.fieldByname('PNVID_NAM').asstring;
    MemPnVid.Post;
    DataModule1.MainDicPnVid.next;
  end;
  MemOwner.EmptyTable;
  MemOwner.Append;
  MemOwner.fieldByname('OWNER_ID').asinteger:=0;
  MemOwner.fieldByname('OWNER_NAME').asstring:='<Все>';
  MemOwner.Post;



  SKL.value:='0';
  OPEN_SQL(QueryWork,'select kln_id,kln_fam||" "||kln_name||" "||kln_name2 as kln_name from kln where kln_men="1" order by 2');
  while not QueryWork.eof do begin
    MemOwner.Append;
    MemOwner.fieldByname('OWNER_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
    MemOwner.fieldByname('OWNER_NAME').asstring:=QueryWork.fieldByname('KLN_NAME').asstring;
    MemOwner.Post;
    QueryWork.next;
  end;
  QueryWork.close;
  WorkTransaction.Active:=False;

  FRM.Value:=inttostr(GL_FRM_WORK_MODE);

  VID.value:='0';
  OWN.value:='0';
  if not SHOW_ZAKUP then begin
        // Запрещаем просмотр закупочных цен
        Rxdbgrid1.columns[7].visible:=False;
        Rxdbgrid1.columns[8].visible:=False;
        Rxdbgrid1.columns[9].visible:=False;
        Rxdbgrid1.columns[11].visible:=False;
  end;
  if not SHOW_POST then begin
          // Запрещаем просмотр закупочных цен
        Rxdbgrid1.columns[4].visible:=False;
        Rxdbgrid1.columns[6].visible:=False;
        Rxdbgrid1.columns[14].visible:=False;
  end;
  CAN_NEW:=(Check_Dostup('$JOU.PN.NEW') or (Check_Dostup('$JOU.PN.KOMM.NEW') and (PNTYP[Jou_PN.StatusBar1.tag].ID=6)));
  CAN_ANALIZ:=Check_dostup('$JOU.PN.ANALIZ');
  CAN_ADM:=CHECK_DOSTUP('$ADM');

  mnu_pn_docs.Enabled:=CHECK_DOSTUP( 'JOU$.PN.ADMIN_DOC_PN');

  {Определяем название}
  G_KEY:=#0;
  DT1:=Date();
  DT2:=Date();
  Jou_PN.caption:='Журнал. '+PNTYP[Jou_PN.StatusBar1.tag].FULL;
  CAN_REFRESH:=True;
  Refresh_list;
end;

Procedure TJou_PN.refresh_Btn;
var
   EN:boolean;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     if QrPnList.fieldbyname('PN$_PROW').asstring='1' then EN:=false else EN:=true;
     BtnProw.Enabled:=EN and EnEof;
     MnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof;
     MnDel.Enabled:=EN and EnEof;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
     BtnAnaliz.Enabled:=(not En) and EnEof and CAN_ANALIZ;
     MnAnaliz.Enabled:=(not En) and EnEof and CAN_ANALIZ;
     BtnAdm.Enabled:=EnEof and CAN_ADM_JOU;
     MnAdm.Enabled:=EnEof and CAN_ADM_JOU;
     if QrPnList.fieldbyname('PN$_NAKL_MET').asstring='2' then MnPnNakl.enabled:=EnEof else MnPnNakl.enabled:=False;
end;

Procedure TJou_PN.refresh_list;
begin
  if CAN_REFRESH then begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrPnList.close;
     QrPnList.ParamByname('DT1').asdatetime:=DT1;
     QrPnList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrPnList.ParamByname('PNTYP_ID').asinteger:=Jou_PN.tag;
     QrPnList.ParamByname('PNVID_ID').asinteger:=strtoint(VID.value);
     QrPnList.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QrPnList.ParamByname('PN_OWNER').asinteger:=strtoint(OWN.value);
     QrPnList.ParamByname('SKL').asinteger:=strtoint(SKL.value);
     QrPnList.ParamByname('KLN_ID').asinteger:=kln_group_id;



     QrPnList2.close;
     QrPnList2.ParamByname('DT1').asdatetime:=DT1;
     QrPnList2.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrPnList2.ParamByname('PNTYP_ID').asinteger:=Jou_PN.tag;
     QrPnList2.ParamByname('PNVID_ID').asinteger:=strtoint(VID.value);
     QrPnList2.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QrPnList2.ParamByname('PN_OWNER').asinteger:=strtoint(OWN.value);
     QrPnList2.ParamByname('SKL').asinteger:=strtoint(SKL.value);
     QrPnList2.ParamByname('KLN_ID').asinteger:=kln_group_id;


     PnListTransaction.Active:=False;
     QrPnList.Open;
  end;
end;

procedure TJou_PN.QrPnListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Вид: '+QrPnList.fieldbyname('PNVID_NAM').asstring;
  Statusbar1.Panels[1].text:='Оформил: '+QrPnList.fieldbyname('US_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_PN.QrPnListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Вид: '+QrPnList.fieldbyname('PNVID_NAM').asstring;
  Statusbar1.Panels[1].text:='Оформил: '+QrPnList.fieldbyname('US_FULL').asstring;
  if QrPnList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof and CAN_NEW;
  MnCopy.enabled:=EnEof and CAN_NEW;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  MnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  BtnSubDoc.Enabled:=EnEof;
  MnSubDoc.Enabled:=EnEof;
  Refresh_Btn;
end;

procedure TJou_PN.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   ImgIndex:integer;
   PN_OST:double;
   NDS1,NDS2:double;
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     RxDbgrid1.Canvas.Font.color:=clWindowtext;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
        RxDbgrid1.Canvas.Font.color:=clRed;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
                RxDbgrid1.Canvas.Brush.color:=clRed;
     end;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='PN$_NUM_FULL' then begin
                  RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger;
                  RxDbgrid1.Canvas.Font.color:=clWindowtext;
              end;
     end;
{     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='PN$_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_COLOR').Asinteger;
     end;}
     if Column.Field.FullName='NDS_SUMM_ALL' then begin
        NDS1:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NDS_SUMM_ALL').asfloat;
        NDS2:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_SUMM').asfloat/6;
        if abs(NDS1-NDS2)>abs(NDS1/100) then begin
                RxDbgrid1.Canvas.Brush.color:=clBlue;
                RxDbgrid1.Canvas.Font.color:=ClWhite;
        end;
     end;
     if (Column.Field.FullName<>'PN$_PROW') and (Column.Field.FullName<>'PN$_OST')
       and (Column.Field.FullName<>'PN$_NAKL_MET') then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
     RxDbgrid1.Canvas.FillRect(Rect);
     if Column.Field.FullName='PN$_PROW' then begin // Стобец проводки//
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_PROW').Asstring='1'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
       end else DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
     end;
     if Column.Field.FullName='PN$_NAKL_MET' then begin // Стобец подчиненных сумм в накладных//
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_NAKL_MET').Asstring='2'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         143,True);
       end else
       if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_NAKL_MET').Asstring='3'
       then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         144,True);
       end else DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
     end;
     if (Column.Field.FullName='PN$_OST') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_ID').asinteger>0) then begin
         {Колонка картинки}
         {если PN_OST>=0, значит сумма расчитана}
         ImgIndex:=0;
         if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_OST').asfloat>=0 then begin
           PN_OST:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_OST').asfloat;
           if (PN_OST>0) and (PN_OST<(100/7)) then ImgIndex:=54;
           if (PN_OST>=(100/7)*1) and (PN_OST<(100/7)*2) then ImgIndex:=54;
           if (PN_OST>=(100/7)*2) and (PN_OST<(100/7)*3) then ImgIndex:=55;
           if (PN_OST>=(100/7)*3) and (PN_OST<(100/7)*4) then ImgIndex:=56;
           if (PN_OST>=(100/7)*4) and (PN_OST<(100/7)*5) then ImgIndex:=57;
           if (PN_OST>=(100/7)*5) and (PN_OST<(100/7)*6) then ImgIndex:=58;
           if (PN_OST>=(100/7)*6) and (PN_OST<(100/7)*7) then ImgIndex:=59;
           if PN_OST>99.999 then ImgIndex:=60; //100%
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN$_PROW').asinteger=0 then ImgIndex:=0;
           if ImgIndex>0 then begin
             DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
             ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
             ImgIndex,True);
           end;
         end;
     end;
    end;
end;

procedure TJou_PN.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_PN.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJou_PN.BtnProwClick(Sender: TObject);
var
   ID:integer;
   can:boolean;
begin
  ID:=QrPnList.fieldByname('PN$_ID').asinteger;
  if QrPnList.FieldByName('WOZW_MET').Asinteger=1 then
    CAN:=PROV_WOZW_PN(ID,' '+PNTYP[Jou_PN.StatusBar1.tag].SHORT+QrPnList.fieldbyname('PN$_NUM_FULL').asstring+
    ' от '+date_sokr(QrPnList.fieldbyname('PN$_DATE').asdatetime)+' ')
  else CAN:=PROV_PN(ID,' '+PNTYP[Jou_PN.StatusBar1.tag].SHORT+QrPnList.fieldbyname('PN$_NUM_FULL').asstring+
    ' от '+date_sokr(QrPnList.fieldbyname('PN$_DATE').asdatetime)+' ');
  if CAN then begin
       QrPnList.DisableControls;
       QrPnList.close;
       PnListTransaction.Active:=False;
       QrPnList.Open;
       QrPnList.Locate('PN$_ID',ID,[]);
       QrPnList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PN.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
   CAN:boolean;
begin
  ID:=QrPnList.fieldByname('PN$_ID').asinteger;
  if QrPnList.FieldByName('WOZW_MET').Asinteger=1 then
  CAN:=UNPROV_WOZW_PN(ID,' '+PNTYP[Jou_PN.StatusBar1.tag].SHORT+QrPnList.fieldbyname('PN$_NUM_FULL').asstring+
    ' от '+date_sokr(QrPnList.fieldbyname('PN$_DATE').asdatetime)+' ')
  ELSE CAN:=UNPROV_PN(ID,' '+PNTYP[Jou_PN.StatusBar1.tag].SHORT+QrPnList.fieldbyname('PN$_NUM_FULL').asstring+
    ' от '+date_sokr(QrPnList.fieldbyname('PN$_DATE').asdatetime)+' ');
  if CAN then begin
       QrPnList.DisableControls;
       QrPnList.close;
       PnListTransaction.Active:=False;
       QrPnList.Open;
       QrPnList.Locate('PN$_ID',ID,[]);
       QrPnList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PN.BtnIntervalClick(Sender: TObject);
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

procedure TJou_PN.BtnOpenClick(Sender: TObject);
var
   a,b,c,ID:integer;
begin
  if QrpnList.FieldByName('WOZW_MET').Asinteger=1 then begin
    b:=-1;
    for a:=1 to CntPntyp do if PNTYP[a].ID=Jou_PN.tag then begin
       c:=a;
    end;
    if IS_EDIT_WOZW_PN then Messbox('Вы уже просматриваете или редактируете Акт возврата!',MessSYstem,48) else begin
      Application.CreateForm(TDoc_PN_WOZW,Doc_PN_WOZW);
      ID:=QrPnList.fieldbyname('PN$_ID').asinteger;
      Doc_PN_WOZW.tag:=ID;
      Doc_PN_WOZW.Panel1.tag:=Jou_PN.tag;
      Doc_PN_WOZW.Toolbar1.tag:=c;
      Doc_PN_WOZW.showModal;
      Doc_PN_WOZW.destroy;
      QrpnList.Close;
      PnListTransaction.Active:=False;
      QrPnList.Open;
      QrPnList.locate('PN$_ID',ID,[]);
    end;
  end else begin
    if IS_EDIT_PN then Messbox('Вы уже просматриваете или редактируете приходную накладную!',MessSYstem,48) else begin
      Application.CreateForm(TDoc_PN2,Doc_PN2);
      ID:=QrPnList.fieldbyname('PN$_ID').asinteger;
      Doc_PN2.tag:=ID;
      Doc_PN2.StatusBar1.Tag:=Jou_PN.tag;
      Doc_PN2.showModal;
      Doc_PN2.destroy;
      QrPnList.Close;
      PnListTransaction.Active:=False;
      QrPnList.Open;
      QrPnList.locate('PN$_ID',ID,[]);
    end;
  end;
end;

procedure TJou_PN.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJou_PN.BtnNewClick(Sender: TObject);
var
  a,b,c:integer;

begin
  Application.createForm(TSelect_NEW,Select_NEW);
  Select_NEW.Position:=PoDesigned;
  Select_NEW.top:=Jou_PN.top+BtnNew.top+4+BtnNew.Height;
  Select_NEW.left:=Jou_PN.left+BtnNew.left+4+BtnNew.Width;
  Select_NEW.Button1.caption:='Новая Приходная накладная';
  Select_NEW.Button2.caption:='Новый Акт возврата товара поставщику';
  Select_NEW.showModal;
  if Select_NEW.tag>0 then begin
    if (Select_NEW.tag=1) then begin
       if IS_EDIT_PN then Messbox('Вы уже просматриваете или редактируете приходную накладную!',MessSYstem,48) else begin
          Application.CreateForm(TDoc_PN2,Doc_PN2);
          Doc_PN2.tag:=-1;
          Doc_PN2.StatusBar1.Tag:=Jou_PN.tag;
          Doc_PN2.showModal;
          if Doc_PN2.tag>0 then begin
            DT1:=Doc_PN2.PN_DATE.date;
            DT2:=Doc_PN2.PN_DATE.date;
            refresh_list;
            QrPnList.locate('PN$_ID',Doc_PN2.tag,[]);
          end;
          Doc_PN2.destroy;
       end;
    end else begin
      if IS_EDIT_WOZW_PN then Messbox('Вы уже просматриваете или редактируете Акт возврата!',MessSYstem,48) else begin
        b:=-1;
        for a:=1 to CntPntyp do if PNTYP[a].ID=Jou_PN.tag then begin
           c:=a;
        end;
        Application.CreateForm(TDoc_PN_WOZW,Doc_PN_WOZW);
        Doc_PN_WOZW.tag:=-1;
        DOC_PN_WOZW.panel1.tag:=Jou_PN.tag;; // Сам тип возврата
        DOC_PN_WOZW.Toolbar1.tag:=c; // По порядку - возврат
        DOC_PN_WOZW.showModal;
        if Doc_PN_WOZW.tag>0 then begin
          DT1:=Doc_PN_WOZW.PN_DATE.date;
          DT2:=Doc_PN_WOZW.PN_DATE.date;
          refresh_list;
          QrPnList.locate('PN$_ID',Doc_PN_WOZW.tag,[]);
        end;
        Doc_PN_WOZW.destroy;
      end;
    end;
    RxDbgrid1.setfocus;
  end;
end;

procedure TJou_PN.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrPnList.fieldByname('PN$_ID').asinteger;
  if Messbox('Удалить приходную накладную '+QrPnList.fieldByname('PN$_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_PN(:PN_ID,:US_ID)');
     DataModule1.IbSaveSQL.Parambyname('PN_ID').asinteger:=ID;
     DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
        on e: Exception do
        begin
            messbox(e.message, messError, 0);
            Datamodule1.IBTransaction2.RollBAck;
        end;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrPnList.locate('PN$_ID',ID,[]);
  end;
  RxDbGrid1.Setfocus;
end;

procedure TJou_PN.BtnPrintClick(Sender: TObject);
begin
     if not check_dostup('$JOU.PN.PRINT') then
      exit;

  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_PN.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_PN.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Приходную накладную';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.Button3.caption:='Напечатать накладную ТОРГ-12';
  Select_Print.Button4.caption:='Напечатать счет-фактуру';
  Select_Print.Button5.caption:='Напечатать журнал с комментариями';
  Select_Print.Button6.caption:='Напечатать форму MX1';
  Select_Print.Button7.caption:='Напечатать транспортную накладную';
  Select_Print.Button8.caption:='Напечатать форму MX1_1';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
     if (Select_Print.tag=1) then   PRINT_PN(QrPnList.fieldbyname('PN$_ID').asinteger,Jou_PN.top+BtnPrint.top+4+BtnPrint.Height,Jou_PN.left+BtnPrint.left+4+BtnPrint.Width);
     if (Select_Print.tag=3) then
     begin
       if(QrPnList.fieldbyname('PN$_summ').asinteger>0) then
         PRINT_PN_T12(QrPnList.fieldbyname('PN$_ID').asinteger,3)
       else
         PRINT_PN_T12(QrPnList.fieldbyname('PN$_ID').asinteger,4);
     end;


     if (Select_Print.tag=6) then
     begin
         PRINT_MH1_MH3(1, QrPnList.fieldbyname('PN$_ID').asinteger, 1);
     end;

     if (Select_Print.tag=8) then
     begin
         PRINT_MH1_MH3(1, QrPnList.fieldbyname('PN$_ID').asinteger, 11);
     end;

     if (Select_Print.tag=7) then
     begin
         PRINT_trans_nakl(QrPnList.fieldbyname('PN$_ID').asinteger, 1);
     end;

     if (Select_Print.tag=4) then
     begin
         PRINT_PN_ST_FAKT(QrPnList.fieldbyname('PN$_ID').asinteger)
     end;

     if (Select_Print.tag=5) then
     begin
      QrPnList2.Open;
      FrReport1.ShowReport;
      QrPnList2.Close;
     end;

     if (Select_Print.tag=2) then begin
             if not CHECK_DOSTUP('$SHOW.ZAKUP') then begin  // Ограничение на просмотр цен
                PpSumm1.Visible:=False;
                PpSumm2.Visible:=False;
             end;
             if not CHECK_DOSTUP('$FIND.PN') then begin  // Ограничение на просмотр информации о поставщике
                PpKln_Org.Visible:=False;
             end;
             PpPnList.reset;
             PnListTitle1.lines.clear;
             PnListTitle1.lines.add(PNTYP[Jou_PN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+
             ' Фирма: '+FRM.Text+', Вид: '+VID.text+', Владелец: '+OWN.text+', Склад: '+SKL.text);
             PnListTitle2.Caption:='Журнал. '+PNTYP[Jou_PN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+
             ' Фирма: '+FRM.Text+', Вид: '+VID.text+', Владелец: '+OWN.text+', Склад: '+SKL.text;
             PpPnList.Print;
     end;
  end;
  Select_Print.Destroy;
end;

procedure TJou_PN.BtnSubDocClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrPnList.fieldbyname('PN$_ID').asinteger;
  SUBDOC(1,ID);
  Refresh_List;
  QrPNList.Locate('PN$_ID',ID,[]);
  RxDbgrid1.setfocus;
end;

procedure TJou_PN.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC(PNTYP[Statusbar1.Tag].FULL+'№ '+QrPnList.fieldbyname('PN$_NUM_FULL').asstring,'PN$',QrPnList.fieldbyname('PN$_ID').asinteger);
end;

procedure TJou_PN.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=1; {Метка, что искать в приходных}
  FIND_DOCNUM.Edit1.tag:=Jou_PN.tag; {Тип приходной накладной}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT BG_STRIPTIME(PN$_DATE) AS PN$_DATE FROM PN$ WHERE PN$_ID=:PN$_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('PN$_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PN$_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrPnList.locate('PN$_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_PN.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
begin
  Application.createForm(TADMIN_PN,ADMIN_PN);
  {Наполняем типы накладных}
  ADMIN_PN.TYP.items.Clear;
  for a:=1 to CNTPNTYP do ADMIN_PN.TYP.items.add(PNTYP[a].SHORT);
  ADMIN_PN.TYP.itemIndex:=Jou_PN.StatusBar1.tag-1;
  ADMIN_PN.NUM.value:=QrPnList.fieldbyname('PN$_NUM').asinteger;
  ADMIN_PN.showModal;
  if ADMIN_PN.tag>0 then begin
     {Изменяем данные накладной}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('PN$_NUM',int(ADMIN_PN.NUM.value));
     IBSAVE_ADD('PNTYP_ID',PNTYP[ADMIN_PN.TYP.itemIndex+1].ID);
     ID:=QrPnList.fieldbyname('PN$_ID').asinteger;
     IF IBSAVE_DOC('PN$',ID)>0 then begin
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Refresh_List;
        QrPnList.locate('PN$_ID',ID,[]);
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_PN.destroy;
end;

procedure TJou_PN.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию приходной накладной № '+QrPnList.fieldbyname('PN$_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_PN( :PN_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('PN_ID').asinteger:=QrPnList.fieldbyname('PN$_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_PN_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QrPnList.locate('PN$_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TJou_PN.BtnAnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_PN(QrPnList.fieldbyname('PN$_ID').asinteger);
end;

procedure TJou_PN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TJou_PN.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrPnList.fieldbyname('PN$_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;
end;

procedure TJou_PN.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpPnListUser.Caption:=USERFIO_SHORT;
     PpPnListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_PN.PpPNLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
   PpPnLIST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TJou_PN.ToolButton6Click(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrPnList.fieldbyname('PN$_ID').asinteger;
  Datamodule1.IBTransaction2.Active:=False;
  Datamodule1.IBTransaction2.StartTransaction;
  ADD_SQL(DataModule1.IbSaveSQL,'select * from check_torg_pn(:pn_id)');
  DataModule1.IbSaveSQL.parambyname('pn_id').asinteger:=ID;
  try
    DataModule1.IbSaveSQL.open;
    Datamodule1.IBTransaction2.Commit;
  Except
    Datamodule1.IBTransaction2.Rollback;
    Messbox('Ошибка при анализе продаж!',MessError,16);
  End;
  Datamodule1.IBTransaction2.Active:=False;
  QrPnList.DisableControls;
  QrPnList.close;
  PnListTransaction.Active:=False;
  QrPnList.Open;
  QrPnList.Locate('PN$_ID',ID,[]);
  QrPnList.EnableControls;
end;

procedure TJou_PN.N2Click(Sender: TObject);
begin
  inherited;
  Application.HelpJump('JouPN');
end;

procedure TJou_PN.FRMChange(Sender: TObject);
begin
  inherited;
  refresh_list;
end;

procedure TJou_PN.VIDChange(Sender: TObject);
begin
  inherited;
  refresh_list;
end;

procedure TJou_PN.OWNChange(Sender: TObject);
begin
  inherited;
  refresh_list;
end;

procedure TJou_PN.MnPnNaklExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TPN_NAKL_DOC,PN_NAKL_DOC);
  PN_NAKL_DOC.tag:=QrPnList.fieldbyname('PN$_ID').asinteger;
  PN_NAKL_DOC.showModal;
  PN_NAKL_DOC.destroy;
end;

procedure TJou_PN.RxDBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;

  mnuSFAKT.Checked:= (pos('Сч.фактура', QrPnList.FieldByName('PN$_DOCS').asString)>0);
  mnuTTN.Checked:= (pos('ТТН', QrPnList.FieldByName('PN$_DOCS').asString)>0);


end;

procedure TJou_PN.mnuSFAKTClick(Sender: TObject);
var str: string;
id: integer;
begin
  inherited;


  id:=QrPnList.FieldByName('PN$_ID').asInteger;
  if not id>0 then
    exit;


  if mnuTTN.Checked then
    str:='ТТН';

  mnuSFAKT.Checked:=not  mnuSFAKT.Checked;

  if mnuSFAKT.Checked then
  begin
    str := str + ' Сч.фактура';
  end;


  IBSAVE_CLEAR;
  IBSAVE_ADD('PN$_DOCS', str);

  IBSAVE_DOC('PN$', QrPnList.FieldByName('PN$_ID').asInteger);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;


  QrPnList.Locate('PN$_ID',  id, []);


end;

procedure TJou_PN.mnuTTNClick(Sender: TObject);
var str: string;
  id: integer;
begin
  inherited;
  id:=QrPnList.FieldByName('PN$_ID').asInteger;
  if not id>0 then
    exit;

  str := '';
  mnuTTN.Checked:=not  mnuTTN.Checked;

  if mnuTTN.Checked then
    str:='ТТН';

  if mnuSFAKT.Checked then
  begin
    str := str + ' Сч.фактура';
  end;


  IBSAVE_CLEAR;
  IBSAVE_ADD('PN$_DOCS', str);

  IBSAVE_DOC('PN$', QrPnList.FieldByName('PN$_ID').asInteger);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;

  QrPnList.Locate('PN$_ID',  id, []);
end;

procedure TJou_PN.mnuPrimClick(Sender: TObject);
var form: TEDIT_TEXT;
  id: integer;
begin
  inherited;
  id:=QrPnList.FieldByName('PN$_ID').asInteger;
  if not id>0 then
    exit;


  form := TEDIT_TEXT.Create(self);
  form.Caption:='Редактирование примечания к приходной накладной';
  form.Memo1.Text:=QrPnList.FieldByName('PN$_PRIM').asString;
  if (form.ShowModal = mrOK) then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('PN$_PRIM', form.Memo1.Text);

    IBSAVE_DOC('PN$', QrPnList.FieldByName('PN$_ID').asInteger);
    Datamodule1.IBTransaction2.Commit;

    refresh_list;

    QrPnList.Locate('PN$_ID',  id, []);


  end;

  form.Destroy;


end;

procedure TJou_PN.mnuAllDocsClick(Sender: TObject);
var str: string;
  id: integer;
begin
  inherited;
  id:=QrPnList.FieldByName('PN$_ID').asInteger;
  if not id>0 then
    exit;

  str := '';
//  mnuTTN.Checked:=not  mnuTTN.Checked;

    str := 'ТТН' + ' Сч.фактура';


  IBSAVE_CLEAR;
  IBSAVE_ADD('PN$_DOCS', str);

  IBSAVE_DOC('PN$', QrPnList.FieldByName('PN$_ID').asInteger);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;

  QrPnList.Locate('PN$_ID',  id, []);
end;

procedure TJou_PN.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;

    if ParName='REPORT_TITLE' then ParValue:=PNTYP[Jou_PN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+
             ' Фирма: '+FRM.Text+', Вид: '+VID.text+', Владелец: '+OWN.text+', Склад: '+SKL.text;
    if ParName='USERFIO' then ParValue:=USERFIO;

end;

procedure TJou_PN.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  inherited;
if (Field <> nil) and QrPnList.Active and
     (CompareText(Field.FieldName, curOrderColumn) = 0) then
     if curOrderDirection = 'DESC' then //если обратная сортировка, то стрелка вверх
      SortMarker := smDown
     else SortMarker := smUp;
end;

//устанавливает у запроса нужную сортировку
//(приписывает к нему последнюю строку и переоткрывает его)
procedure TJou_PN.SetListOrder(Const OrderColumn:String; needToChangeOrder:boolean);
Var
 needToOpen : boolean;
 OrderLine :String;
begin
 if needToChangeOrder then
  begin
   if (curOrderColumn <> OrderColumn) then
    curOrderDirection := 'ASC'
   else
    if ((curOrderDirection = 'DESC') or (curOrderDirection = '')) then
     curOrderDirection := 'ASC'
    else curOrderDirection := 'DESC';
  end;
 curOrderColumn := OrderColumn;
 OrderLine := 'ORDER BY ' + curOrderColumn + ' ' + curOrderDirection;
 //заменяем последнюю строку в запросе
// needToOpen := QrListcard.Active;
// QrListcard.Close;
 QrPnList.SQL[QrPnList.SQL.Count-1] := OrderLine;
// if needToOpen then QrListcard.Open;
end;

procedure TJou_PN.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  inherited;
if (Field <> nil) then begin
    SetListOrder(Field.FieldName, True);
    self.refresh_list;
//    ComboBox2.ItemIndex := -1;
  end;
end;

procedure TJou_PN.BitBtn1Click(Sender: TObject);
var fr: integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= kln_group_id;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> kln_group_id then
       begin

//        KLN_NAME.tag:=DIC_KLIENT.tag;
        kln_group_id:=DIC_KLIENT.tag;
//        fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);


       IbQuery1.Close;
    	 IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
//       kln_group_typ:=3;


    	 IbQuery1.Parambyname('KLN_ID').asinteger:=kln_group_id;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         KLN_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;
//         ibtransaction1.Active:=false;

       end;

     DIC_KLIENT.Destroy;

     refresh_list;
end;

procedure TJou_PN.BitBtn2Click(Sender: TObject);
begin
  inherited;
   kln_group_id:=0;
   KLN_NAME.text := 'Все клиенты';
     refresh_list;
end;

end.

