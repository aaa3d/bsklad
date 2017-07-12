unit AnalizSPIS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Animate, GIFCtrl, Db, IBCustomDataSet,
  IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl, CurrEdit, Mask, ToolEdit,
  ExtCtrls;

type
  TAnaliz_SPIS = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SPIS_NUM: TEdit;
    SPIS_DATE: TDateEdit;
    SPIS_OSN: TMemo;
    SPIS_US: TEdit;
    SPIS_WHO: TEdit;
    SPISVID_NAM: TEdit;
    SPIS_SUMM: TRxCalcEdit;
    Panel2: TPanel;
    Label16: TLabel;
    RxDBGrid1: TRxDBGrid;
    AnalizTransaction: TIBTransaction;
    QrAnalizSPISS: TIBQuery;
    DsAnalizSPISS: TDataSource;
    DsAnalizSPIS: TDataSource;
    QrAnalizSPIS: TIBQuery;
    IBQuery1: TIBQuery;
    ToolButton3: TToolButton;
    QrAnalizSPISSPISS_ID: TIntegerField;
    QrAnalizSPISTW_ID: TIntegerField;
    QrAnalizSPISTW_ART: TIntegerField;
    QrAnalizSPISTW_NAM: TIBStringField;
    QrAnalizSPISED_SHORT: TIBStringField;
    QrAnalizSPISTW_KOL: TFloatField;
    QrAnalizSPISSEB: TFloatField;
    QrAnalizSPISSEB2: TFloatField;
    QrAnalizSPISNDS: TFloatField;
    QrAnalizSPISNDS2: TFloatField;
    QrAnalizSPISSEB_SUMM: TFloatField;
    QrAnalizSPISSEB_SUMM2: TFloatField;
    QrAnalizSPISNDS_SUMM: TFloatField;
    QrAnalizSPISNDS_SUMM2: TFloatField;
    QrAnalizSPISSPP_TYP: TIntegerField;
    QrAnalizSPISSPP_ID: TIntegerField;
    QrAnalizSPISSPP_IDS: TIntegerField;
    QrAnalizSPISSVID: TIBStringField;
    QrAnalizSPISSFULL_NUM: TIBStringField;
    QrAnalizSPISSKLN_ID: TIntegerField;
    QrAnalizSPISSKLN_FULL: TIBStringField;
    QrAnalizSPISSPP_MEN: TIntegerField;
    QrAnalizSPISSMEN_FULL: TIBStringField;
    QrAnalizSPISSCALC_KOL: TFloatField;
    QrAnalizSPISSSEB: TFloatField;
    QrAnalizSPISSSEB2: TFloatField;
    QrAnalizSPISSNDS: TFloatField;
    QrAnalizSPISSNDS2: TFloatField;
    QrAnalizSPISSSHOP_COLOR: TIntegerField;
    QrAnalizSPISSSKL_SHORT: TIBStringField;
    QrAnalizSPISSPP_DT: TDateTimeField;
    RxDBGrid2: TRxDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QrAnalizSPISAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton3Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Analiz_SPIS: TAnaliz_SPIS;
  SHOW_SPISS:boolean;

implementation

uses B_Utils,B_DButils,Data1;

{$R *.DFM}

procedure TAnaliz_SPIS.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

procedure TAnaliz_SPIS.QrAnalizSPISAfterScroll(DataSet: TDataSet);
begin
     if SHOW_SPISS then begin
        QrAnalizSPISS.Close;
        QrAnalizSPISS.ParamByname('SPISS_id').asinteger:=
          QrAnalizSPIS.FieldByname('SPISS_id').asinteger;
        QrAnalizSPISS.Open;
     end;
end;

procedure TAnaliz_SPIS.FormShow(Sender: TObject);
var
   S:ansistring;
begin
     IS_ANALIZ_SPIS:=True;
     {Выводим Анализ}
     SHOW_SPISS:=false;
     AnalizTransaction.Active:=False;
     ADD_SQL(IbQuery1,'select SPIS.*,SPISVID.SPISVID_NAM, '+
     'SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX,SKL.SKL_FULL, '+
     '(SELECT kln_full from kln_data(SPIS.US_ID)) AS US_FULL '+
     ' from SPIS,SHOP,SKL,SPISVID WHERE SPIS.SHOP_ID=SHOP.SHOP_ID AND SPIS.SKL_ID=SKL.SKL_ID '+
     ' AND SPIS.SPIS_ID=:SPIS_ID '+
     ' and SPIS.SPISVID_ID=SPISVID.SPISVID_ID');
     IbQuery1.ParamByname('SPIS_ID').asinteger:=Analiz_SPIS.tag;
     IbQuery1.Open;
     SPIS_DATE.date:=IbQuery1.FieldByname('SPIS_DATE').asdatetime;
     s:='СПИС'+IbQuery1.fieldByname('SHOP_PREFIX').asstring+inttostr(DATE_YEAR(IbQuery1.fieldByname('SPIS_DATE').asdatetime))+
     B_utils.right('000000'+IbQuery1.fieldByname('SPIS_NUM').asstring,6)+
     IbQuery1.fieldByname('SHOP_POSTFIX').asstring;
     SPIS_NUM.text:=s;
     SPIS_US.text:=IbQuery1.fieldByname('US_FULL').asstring;
     SPIS_OSN.lines.clear;
     SPIS_OSN.lines.add(IbQuery1.fieldByname('SPIS_OSN').asstring);
     SPIS_WHO.text:=IbQuery1.fieldByname('SPIS_WHO').asstring;
     SPISVID_NAM.text:=IbQuery1.fieldByname('SPISVID_NAM').asstring;
     SPIS_SUMM.value:=0;
     QrAnalizSPIS.close;
     QrAnalizSPIS.ParamByname('SPIS_ID').asinteger:=Analiz_SPIS.tag;
     QrAnalizSPIS.Open;
     QrAnalizSPIS.DisableControls;
     while not QrAnalizSPIS.eof do begin
        SPIS_SUMM.value:=SPIS_SUMM.value+QrAnalizSPIS.fieldByname('SEB_SUMM').asfloat;
        QrAnalizSPIS.next;
     end;
     IbQuery1.Close;
     QrAnalizSPIS.first;
     QrAnalizSPIS.EnableControls;
     SHOW_SPISS:=true;
     if not QrAnalizSPIS.eof then begin
       QrAnalizSPISS.Close;
       QrAnalizSPISS.ParamByname('SPISS_id').asinteger:=
       QrAnalizSPIS.FieldByname('SPISS_id').asinteger;
       QrAnalizSPISS.Open;
     end;
end;

procedure TAnaliz_SPIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_ANALIZ_SPIS:=False;
     QrAnalizSPIS.Close;
     QrAnalizSPISS.Close;
     AnalizTransaction.Active:=False;
end;

procedure TAnaliz_SPIS.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
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

procedure TAnaliz_SPIS.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TAnaliz_SPIS.RxDBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(QrAnalizspis.fieldbyname('TW_ID').asinteger);
end;

procedure TAnaliz_SPIS.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
    key:=#0;
    SHOW_ANALIZ_TW(QrAnalizspis.fieldbyname('TW_ID').asinteger);
  end;
end;

procedure TAnaliz_SPIS.RxDBGrid2DblClick(Sender: TObject);
begin
     SHOW_ANALIZ_PN(QrAnalizspisS.fieldbyname('PP_ID').asinteger);
end;

end.
