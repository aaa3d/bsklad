unit AnalizRN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Animate, GIFCtrl, Db, IBCustomDataSet,
  IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl, CurrEdit, Mask, ToolEdit,
  ExtCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppCtrls, ppSubRpt, ppMemo, ppRegion, ppStrtch, ppPrnabl,
  ppBands, ppVar;

type
  TAnaliz_RN = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    KLN_NAME: TEdit;
    RN_OSN: TMemo;
    RN_US: TEdit;
    RN_WHO: TEdit;
    RNVID_NAM: TEdit;
    RN_SUMM: TRxCalcEdit;
    NAC_BEF_1: TRxCalcEdit;
    RN_PRIBYL: TRxCalcEdit;
    NAC_AFT_1: TRxCalcEdit;
    Panel2: TPanel;
    Label16: TLabel;
    RxDBGrid2: TRxDBGrid;
    Label3: TLabel;
    CARD_NUM: TEdit;
    Label8: TLabel;
    RN_SKID: TRxCalcEdit;
    RxDBGrid1: TRxDBGrid;
    AnalizTransaction: TIBTransaction;
    QrAnalizRNS: TIBQuery;
    DsAnalizRNS: TDataSource;
    DsAnalizRN: TDataSource;
    QrAnalizRN: TIBQuery;
    IBQuery1: TIBQuery;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label1: TLabel;
    RN_NUM: TEdit;
    Label2: TLabel;
    RN_DATE: TDateEdit;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label5: TLabel;
    RN_KURS: TRxCalcEdit;
    Label9: TLabel;
    SKL_NAME: TEdit;
    Label14: TLabel;
    RN_NDS_SUMM: TRxCalcEdit;
    DOST: TCheckBox;
    DOST_DATE: TDateEdit;
    DOST_DATE_MET: TLabel;
    QrAnalizRNRNS_ID: TIntegerField;
    QrAnalizRNTW_ID: TIntegerField;
    QrAnalizRNTW_ART: TIntegerField;
    QrAnalizRNTW_NAM: TIBStringField;
    QrAnalizRNED_SHORT: TIBStringField;
    QrAnalizRNTW_KOL: TFloatField;
    QrAnalizRNTW_MONEY: TFloatField;
    QrAnalizRNTW_SKID: TFloatField;
    QrAnalizRNTW_SKIDDOLL: TFloatField;
    QrAnalizRNTW_SKIDCARD: TFloatField;
    QrAnalizRNTW_OKMONEY: TFloatField;
    QrAnalizRNTW_OKMONEY2: TFloatField;
    QrAnalizRNTW_OKSUMM: TFloatField;
    QrAnalizRNTW_OKSUMM2: TFloatField;
    QrAnalizRNNAC_SUMM: TFloatField;
    QrAnalizRNNAC_SUMM2: TFloatField;
    QrAnalizRNPERCENT: TFloatField;
    QrAnalizRNPERCENT2: TFloatField;
    QrAnalizRNSKID_TXT: TIBStringField;
    QrAnalizRNTW_NDS: TFloatField;
    QrAnalizRNTW_NSP: TFloatField;
    QrAnalizRNSPP_TYP: TIntegerField;
    QrAnalizRNSPP_ID: TIntegerField;
    QrAnalizRNSPP_IDS: TIntegerField;
    QrAnalizRNSVID: TIBStringField;
    QrAnalizRNSFULL_NUM: TIBStringField;
    QrAnalizRNSKLN_ID: TIntegerField;
    QrAnalizRNSKLN_FULL: TIBStringField;
    QrAnalizRNSPP_MEN: TIntegerField;
    QrAnalizRNSMEN_FULL: TIBStringField;
    QrAnalizRNSCALC_KOL: TFloatField;
    QrAnalizRNSSEB: TFloatField;
    QrAnalizRNSSEB2: TFloatField;
    QrAnalizRNSNDS: TFloatField;
    QrAnalizRNSNDS2: TFloatField;
    QrAnalizRNSNAC: TFloatField;
    QrAnalizRNSNAC2: TFloatField;
    QrAnalizRNSPERCENT: TFloatField;
    QrAnalizRNSPERCENT2: TFloatField;
    QrAnalizRNSSHOP_COLOR: TIntegerField;
    QrAnalizRNSSKL_SHORT: TIBStringField;
    QrAnalizRNSPP_DT: TDateTimeField;
    Label17: TLabel;
    NDS2: TRxCalcEdit;
    Label15: TLabel;
    Label18: TLabel;
    QrAnalizRNNAC_SUMM_BEF: TFloatField;
    QrAnalizRNNAC_SUMM_AFT: TFloatField;
    QrAnalizRNTW_MONEY_SPEC: TFloatField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QrAnalizRNAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton3Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Myrefresh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Analiz_RN: TAnaliz_RN;
  SHOW_RNS:boolean;

implementation

uses B_Utils,B_DButils,Data1;

{$R *.DFM}

procedure TAnaliz_RN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TAnaliz_RN.QrAnalizRNAfterScroll(DataSet: TDataSet);
begin
     if SHOW_RNS then begin
        QrAnalizRNS.Close;
        QrAnalizRNS.ParamByname('RNS_id').asinteger:=
          QrAnalizRN.FieldByname('RNS_ID').asinteger;
        QrAnalizRNS.Open;
     end;
end;

procedure TAnaliz_RN.MyRefresh;
var
   S:ansistring;
   SUM,SUMD,NAC,NACD,NDS,NSP:real;
   NAC_BEF, NAC_AFT: real;
begin
     IS_ANALIZ_RN:=True;
     {Выводим Анализ}
     SHOW_RNS:=False;
     AnalizTransaction.Active:=False;
     ADD_SQL(IbQuery1,'select RN.*,RNTYP.RNTYP_SHORT,RNTYP.RNTYP_FULL,RNVID.RNVID_NAM, '+
     'SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX,SKL.SKL_FULL, '+
     '(SELECT KLN2.KLN_PREFIX FROM KLN KLN2 WHERE KLN2.KLN_ID=RN.FRM_ID) as KLN_PREFIX, '+
     ' KLN.KLN_FAM,KLN.KLN_NAME,KLN.KLN_NAME2,KLN.KLN_ORG, '+
     '(SELECT cast(kln3.kln_fam|| " "||bg_left(kln3.kln_name,1)||". "|| '+
     'bg_left(kln3.kln_name2,1)||"." as varchar(100)) FROM KLN KLN3 WHERE KLN3.KLN_ID=RN.US_ID) AS US_FULL, '+
     ' (select card_num from card where card.card_id=rn.card_id) as card_num '+
     ' from RN,SHOP,SKL,KLN,RNTYP,RNVID WHERE RN.SHOP_ID=SHOP.SHOP_ID AND RN.SKL_ID=SKL.SKL_ID '+
     ' and RN.KLN_ID=KLN.KLN_ID AND RN.RN_ID=:RN_ID and RN.RNTYP_ID=RNTYP.RNTYP_ID'+
     ' and RN.RNVID_ID=RNVID.RNVID_ID');
     IbQuery1.ParamByname('RN_ID').asinteger:=Analiz_RN.tag;
     IbQuery1.Open;
     if IbQuery1.fieldbyname('RN_DOST').asinteger=0 then begin
       DOST.checked:=false;
       DOST_DATE.visible:=false;
       DOST_DATE_MET.visible:=false;
     end else begin
       DOST.checked:=true;
       DOST_DATE.visible:=true;
       DOST_DATE.date:=IbQuery1.fieldbyname('DOST_DATE').asdatetime;
       DOST_DATE_MET.visible:=true;
     end;
     RN_DATE.date:=IbQuery1.FieldByname('RN_DATE').asdatetime;
     NDS2.value:=IbQuery1.fieldByname('NDS').asfloat;
     RN_KURS.value:=IbQuery1.fieldByname('RN_KURS').asfloat;
     if IbQuery1.fieldByname('KLN_ORG').asstring='' then begin
        s:=IbQuery1.fieldByname('KLN_FAM').asstring;
        if IbQuery1.fieldByname('KLN_NAME').asstring<>''
        then s:=s+' '+B_utils.left(ansiuppercase(IbQuery1.fieldByname('KLN_NAME').asstring),1)+'.';
        if IbQuery1.fieldByname('KLN_NAME2').asstring<>''
        then s:=s+' '+B_utils.left(ansiuppercase(IbQuery1.fieldByname('KLN_NAME2').asstring),1)+'.';
     end else s:=IbQuery1.fieldByname('KLN_ORG').asstring;
     KLN_NAME.text:=s;
     SKL_NAME.text:=IbQuery1.fieldByname('SKL_FULL').asstring;
     s:=IbQuery1.fieldByname('KLN_PREFIX').asstring+' '+
     IbQuery1.fieldByname('RNTYP_SHORT').asstring+
     IbQuery1.fieldByname('SHOP_PREFIX').asstring+inttostr(DATE_YEAR(IbQuery1.fieldByname('RN_DATE').asdatetime))+
     B_utils.right('000000'+IbQuery1.fieldByname('RN_NUM').asstring,6)+
     IbQuery1.fieldByname('SHOP_POSTFIX').asstring;
     RN_NUM.text:=s;
     RN_SKID.value:=IbQuery1.fieldByname('RN_SKID').asfloat;
     RN_US.text:=IbQuery1.fieldByname('US_FULL').asstring;
     CARD_NUM.text:=IbQuery1.fieldByname('CARD_NUM').asstring;
     RN_OSN.lines.clear;
     RN_OSN.lines.add(IbQuery1.fieldByname('RN_OSN').asstring);
     RN_WHO.text:=IbQuery1.fieldByname('RN_WHO').asstring;
     RNVID_NAM.text:=IbQuery1.fieldByname('RNVID_NAM').asstring;
     RN_SUMM.value:=0;
//     RN_SUMMD.value:=0;
     RN_PRIBYL.value:=0;
//     RN_PRIBYLD.value:=0;
     QrAnalizRN.Close;
     QrAnalizRN.ParamByname('RN_ID').asinteger:=Analiz_RN.tag;
     QrAnalizRN.Open;
     SUM:=0;  NAC:=0; NACD:=0; NDS:=0; NSP:=0;

     NAC_BEF:=0;
     NAC_AFT:=0;
     QrAnalizRN.Disablecontrols;
     while not QrAnalizRN.eof do begin
        SUM:=SUM+QrAnalizRN.fieldByname('TW_OKSUMM').asfloat;
        NAC_BEF:=NAC_BEF+QrAnalizRN.fieldByname('NAC_SUMM_BEF').asfloat;
        NAC_AFT:=NAC_AFT+QrAnalizRN.fieldByname('NAC_SUMM_AFT').asfloat;
        NAC:=NAC+QrAnalizRN.fieldByname('NAC_SUMM').asfloat;
        NACD:=NACD+QrAnalizRN.fieldByname('NAC_SUMM$').asfloat;
        NDS:=NDS+QrAnalizRN.fieldByname('TW_NDS').asfloat;
        NSP:=NSP+QrAnalizRN.fieldByname('TW_NSP').asfloat;
        QrAnalizRN.next;
     end;
     QrAnalizRN.First;
     QrAnalizRN.EnableControls;
     RN_SUMM.value:=SUM;
//     RN_SUMMD.value:=SUM/RN_KURS.value;
//     RN_NSP_SUMM.value:=NSP;
     RN_NDS_SUMM.value:=NDS;
     RN_PRIBYL.value:=NAC;
     NAC_BEF_1.value:=NAC_BEF;
     NAC_AFT_1.value:=NAC_AFT;
//     RN_PRIBYLD.value:=NACD;
     SHOW_RNS:=true;
     QrAnalizRNS.Close;
     QrAnalizRNS.ParamByname('RNS_id').asinteger:=
       QrAnalizRN.FieldByname('RNS_ID').asinteger;
     QrAnalizRNS.Open;
     IbQuery1.Close;
     if Not Check_dostup('$FIND.PN') then begin
       RxDbgrid2.Columns[10].visible:=False; // Закрываем просмотр поставщика в анализе расхода
     end;
end;

procedure TAnaliz_RN.FormShow(Sender: TObject);
begin
  SHOW_RNS:=False;
  MyRefresh;
end;

procedure TAnaliz_RN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_ANALIZ_RN:=False;
     QrAnalizRN.Close;
     QrAnalizRNS.Close;
     AnalizTransaction.Active:=False;

end;

procedure TAnaliz_RN.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
        end;
     end;
end;

procedure TAnaliz_RN.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TAnaliz_RN.RxDBGrid2DblClick(Sender: TObject);
begin
     SHOW_ANALIZ_PN(QrAnalizRNS.fieldbyname('PP_ID').asinteger);
end;

procedure TAnaliz_RN.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     key:=#0;
     SHOW_ANALIZ_PN(QrAnalizRNS.fieldbyname('PP_ID').asinteger);
  end;
end;

procedure TAnaliz_RN.RxDBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(QrAnalizRn.fieldbyname('TW_ID').asinteger);
end;

procedure TAnaliz_RN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    key:=#0;
    SHOW_ANALIZ_TW(QrAnalizRn.fieldbyname('TW_ID').asinteger);
  end;
end;

end.
