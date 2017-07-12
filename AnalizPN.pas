unit AnalizPN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Animate, GIFCtrl, CurrEdit, Mask, ToolEdit,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls, Db, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TAnaliz_PN = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    PN_NUM: TEdit;
    Label2: TLabel;
    PN_DATE: TDateEdit;
    Label3: TLabel;
    PN_DATE_OPL: TDateEdit;
    Label4: TLabel;
    POST_NAME: TEdit;
    Label5: TLabel;
    PN_KURS: TRxCalcEdit;
    Label6: TLabel;
    PN_OSN: TMemo;
    Label7: TLabel;
    PN_US: TEdit;
    Label8: TLabel;
    PN_OWNER: TEdit;
    Label10: TLabel;
    PN_WHO: TEdit;
    Label11: TLabel;
    PNVID_NAM: TEdit;
    Label12: TLabel;
    PN_SUMM: TRxCalcEdit;
    PN_SUMMD: TRxCalcEdit;
    Label13: TLabel;
    PN_PRIBYL: TRxCalcEdit;
    PN_PRIBYLD: TRxCalcEdit;
    Label14: TLabel;
    PN_OST: TRxCalcEdit;
    PN_OSTD: TRxCalcEdit;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    AnalizTransaction: TIBTransaction;
    QrAnalizPNS: TIBQuery;
    DsAnalizPNS: TDataSource;
    Label16: TLabel;
    QrAnalizPN: TIBQuery;
    DsAnalizPN: TDataSource;
    IBQuery1: TIBQuery;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    QrAnalizPNPNS_ID: TIntegerField;
    QrAnalizPNTW_ID: TIntegerField;
    QrAnalizPNTW_ART: TIntegerField;
    QrAnalizPNTW_NAM: TIBStringField;
    QrAnalizPNED_SHORT: TIBStringField;
    QrAnalizPNTW_KOL: TFloatField;
    QrAnalizPNTW_MONEY: TFloatField;
    QrAnalizPNSEB: TFloatField;
    QrAnalizPNNDS: TFloatField;
    QrAnalizPNTW_SUMM: TFloatField;
    QrAnalizPNTW_MONEY2: TFloatField;
    QrAnalizPNSEB2: TFloatField;
    QrAnalizPNNDS2: TFloatField;
    QrAnalizPNTW_SUMM2: TFloatField;
    QrAnalizPNOST: TFloatField;
    QrAnalizPNNAC_SUMM: TFloatField;
    QrAnalizPNNAC_SUMM2: TFloatField;
    QrAnalizPNPERCENT: TFloatField;
    QrAnalizPNPERCENT2: TFloatField;
    QrAnalizPNRASHOD: TFloatField;
    QrAnalizPNSID: TIntegerField;
    QrAnalizPNSIDS: TIntegerField;
    QrAnalizPNSTYP: TIntegerField;
    QrAnalizPNSVID: TIBStringField;
    QrAnalizPNSFULL_NUM: TIBStringField;
    QrAnalizPNSKLN_ID: TIntegerField;
    QrAnalizPNSKLN_FULL: TIBStringField;
    QrAnalizPNSTW_KOL: TFloatField;
    QrAnalizPNSTW_MONEY: TFloatField;
    QrAnalizPNSTW_SKID: TFloatField;
    QrAnalizPNSTW_SKIDDOLL: TFloatField;
    QrAnalizPNSTW_SKIDCARD: TFloatField;
    QrAnalizPNSTW_OKMONEY: TFloatField;
    QrAnalizPNSTW_OKMONEY2: TFloatField;
    QrAnalizPNSTW_OKSUMM: TFloatField;
    QrAnalizPNSTW_OKSUMM2: TFloatField;
    QrAnalizPNSNAC_SUMM: TFloatField;
    QrAnalizPNSNAC_SUMM2: TFloatField;
    QrAnalizPNSPERCENT: TFloatField;
    QrAnalizPNSPERCENT2: TFloatField;
    QrAnalizPNSSKID_TXT: TIBStringField;
    QrAnalizPNSTW_NDS: TFloatField;
    QrAnalizPNSTW_NSP: TFloatField;
    QrAnalizPNSSHOP_COLOR: TIntegerField;
    QrAnalizPNSOSN: TIBStringField;
    QrAnalizPNSSKL_SHORT: TIBStringField;
    QrAnalizPNSSEB: TFloatField;
    QrAnalizPNSSEB2: TFloatField;
    QrAnalizPNSNDS: TFloatField;
    QrAnalizPNSNDS2: TFloatField;
    QrAnalizPNSDT: TDateTimeField;
    chDeepAnaliz: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QrAnalizPNAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton3Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure Analiz;
    procedure chDeepAnalizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Analiz_PN: TAnaliz_PN;
  SHOW_PNS:boolean;

implementation

uses B_Utils,B_DButils,Data1;

{$R *.DFM}

procedure TAnaliz_PN.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TAnaliz_PN.QrAnalizPNAfterOpen(DataSet: TDataSet);
begin
     if SHOW_PNS then begin
        QrAnalizPNS.Close;
        QrAnalizPNS.ParamByname('PNS$_id').asinteger:=
          QrAnalizPN.FieldByname('PNS$_id').asinteger;
        QrAnalizPNS.Open;
     end;
end;

procedure TAnaliz_PN.Analiz;
begin



     SHOW_PNS:=False;


     PN_SUMM.value:=0;
     PN_SUMMD.value:=0;
     PN_PRIBYL.value:=0;
     PN_PRIBYLD.value:=0;
     PN_OST.value:=0;
     PN_OSTD.value:=0;


     QrAnalizPN.Close;

     if chDeepAnaliz.Checked=false then
        QrAnalizPN.SQL.Text:=' select * from analiz_prihod_fast(:pn_id) order by pns$_id '
     else
        QrAnalizPN.SQL.Text:=' select * from analiz_prihod_deep_fast(:pn_id) order by pns$_id ';


     QrAnalizPN.ParamByname('PN_ID').asinteger:=Analiz_PN.tag;
     QrAnalizPN.Open;


     QrAnalizPN.DisableControls;
     while not QrAnalizPN.eof do begin
        PN_SUMM.value:=PN_SUMM.value+QrAnalizPN.fieldByname('TW_SUMM').asfloat;
        PN_SUMMD.value:=PN_SUMMD.value+QrAnalizPN.fieldByname('TW_SUMM$').asfloat;
        PN_PRIBYL.value:=PN_PRIBYL.value+QrAnalizPN.fieldByname('NAC_SUMM').asfloat;
        PN_PRIBYLD.value:=PN_PRIBYLD.value+QrAnalizPN.fieldByname('NAC_SUMM$').asfloat;
        PN_OST.value:=PN_OST.value+QrAnalizPN.fieldByname('OST').asfloat*QrAnalizPN.fieldByname('TW_MONEY').asfloat;
        PN_OSTD.value:=PN_OSTD.value+QrAnalizPN.fieldByname('OST').asfloat*QrAnalizPN.fieldByname('SEB$').asfloat;
        QrAnalizPN.next;
     end;
     QrAnalizPN.first;
     QrAnalizPN.EnableControls;
     SHOW_PNS:=true;
     QrAnalizPNS.Close;

     if chDeepAnaliz.Checked=false then
        QrAnalizPNS.SQL.Text:=' select * from analiz_prihods_fast(:pns$_id) order by dt '
     else
        QrAnalizPNS.SQL.Text:=' select * from analiz_prihods_deep_fast(:pns$_id) order by dt ';


     QrAnalizPNS.ParamByname('PNS$_id').asinteger:=  QrAnalizPN.FieldByname('PNS$_id').asinteger;
     QrAnalizPNS.Open;

end;


procedure TAnaliz_PN.FormShow(Sender: TObject);
var
   S:ansistring;
begin
     IS_ANALIZ_PN:=True;
     {Выводим Анализ}

     AnalizTransaction.Active:=False;
     ADD_SQL(IbQuery1,'select PN$.*,PNTYP.PNTYP_SHORT,PNTYP.PNTYP_FULL,PNVID.PNVID_NAM, '+
     'SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX,SKL.SKL_FULL, '+
     '(SELECT KLN2.KLN_PREFIX FROM KLN KLN2 WHERE KLN2.KLN_ID=PN$.FRM_ID) as KLN_PREFIX, '+
     ' KLN.KLN_FAM,KLN.KLN_NAME,KLN.KLN_NAME2,KLN.KLN_ORG, '+
     '(SELECT cast(kln3.kln_fam|| " "||BG_left(kln3.kln_name,1)||". "|| '+
     'BG_left(kln3.kln_name2,1)||"." as varchar(100)) FROM KLN KLN3 WHERE KLN3.KLN_ID=PN$.US_ID) AS US_FULL, '+
     '(SELECT cast(kln4.kln_fam|| " "||BG_left(kln4.kln_name,1)||". "|| '+
     'BG_left(kln4.kln_name2,1)||"." as varchar(100)) FROM KLN KLN4 WHERE KLN4.KLN_ID=PN$.PN$_OWNER) AS OWNER_FULL'+
     ' from PN$,SHOP,SKL,KLN,PNTYP,PNVID WHERE PN$.SHOP_ID=SHOP.SHOP_ID AND PN$.SKL_ID=SKL.SKL_ID '+
     ' and PN$.KLN_ID=KLN.KLN_ID AND PN$.PN$_ID=:PN_ID and PN$.PNTYP_ID=PNTYP.PNTYP_ID'+
     ' and PN$.PNVID_ID=PNVID.PNVID_ID');
     IbQuery1.ParamByname('PN_ID').asinteger:=Analiz_PN.tag;
     IbQuery1.Open;
     PN_DATE.date:=IbQuery1.FieldByname('PN$_DATE').asdatetime;
     PN_DATE_OPL.date:=IbQuery1.fieldByname('PN$_DATE_OPL').asdatetime;
     PN_KURS.value:=IbQuery1.fieldByname('PN$_KURS').asfloat;
     if IbQuery1.fieldByname('KLN_ORG').asstring='' then begin
        s:=IbQuery1.fieldByname('KLN_FAM').asstring;
        if IbQuery1.fieldByname('KLN_NAME').asstring<>''
        then s:=s+' '+B_utils.left(ansiuppercase(IbQuery1.fieldByname('KLN_NAME').asstring),1)+'.';
        if IbQuery1.fieldByname('KLN_NAME2').asstring<>''
        then s:=s+' '+B_utils.left(ansiuppercase(IbQuery1.fieldByname('KLN_NAME2').asstring),1)+'.';
     end else s:=IbQuery1.fieldByname('KLN_ORG').asstring;
     if CHECK_DOSTUP('$FIND.PN') then begin
          POST_NAME.text:=s;
     end else begin
          POST_NAME.text:='Данные недоступны! Ограничение доступа!';
     end;
     s:=IbQuery1.fieldByname('KLN_PREFIX').asstring+' '+
     IbQuery1.fieldByname('PNTYP_SHORT').asstring+
     IbQuery1.fieldByname('SHOP_PREFIX').asstring+inttostr(DATE_YEAR(IbQuery1.fieldByname('PN$_DATE').asdatetime))+
     B_utils.right('000000'+IbQuery1.fieldByname('PN$_NUM').asstring,6)+
     IbQuery1.fieldByname('SHOP_POSTFIX').asstring;


     PN_NUM.text:=s;
     PN_US.text:=IbQuery1.fieldByname('US_FULL').asstring;
     PN_OWNER.text:=IbQuery1.fieldByname('OWNER_FULL').asstring;
     PN_OSN.lines.clear;
     PN_OSN.lines.add(IbQuery1.fieldByname('PN$_OSN').asstring);
     PN_WHO.text:=IbQuery1.fieldByname('PN$_WHO').asstring;
     PNVID_NAM.text:=IbQuery1.fieldByname('PNVID_NAM').asstring;
     IbQuery1.Close;


     analiz;
end;





procedure TAnaliz_PN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_ANALIZ_PN:=False;
     QrAnalizPN.Close;
     QrAnalizPNS.Close;
     AnalizTransaction.Active:=False;
end;

procedure TAnaliz_PN.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
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

procedure TAnaliz_PN.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TAnaliz_PN.RxDBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(QrAnalizPn.fieldbyname('TW_ID').asinteger);
end;

procedure TAnaliz_PN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    key:=#0;
    SHOW_ANALIZ_TW(QrAnalizPn.fieldbyname('TW_ID').asinteger);
  end;
end;

procedure TAnaliz_PN.RxDBGrid2DblClick(Sender: TObject);
begin
       if QranalizPNS.fieldbyname('TYP').asinteger in [1,3] then
       SHOW_ANALIZ_RN(QranalizPNS.fieldbyname('ID').asinteger);
       if QranalizPNS.fieldbyname('TYP').asinteger=2 then
       else SHOW_ANALIZ_SPIS(QranalizPNS.fieldbyname('ID').asinteger);
end;

procedure TAnaliz_PN.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
       key:=#0;
       if QranalizPNS.fieldbyname('TYP').asinteger in [1,3] then
       SHOW_ANALIZ_RN(QranalizPNS.fieldbyname('ID').asinteger);
       if QranalizPNS.fieldbyname('TYP').asinteger=2 then
       else SHOW_ANALIZ_SPIS(QranalizPNS.fieldbyname('ID').asinteger);
  end;
end;

procedure TAnaliz_PN.chDeepAnalizClick(Sender: TObject);
begin
  analiz;
end;

end.
