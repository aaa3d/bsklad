unit ReportCardOneShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  b_utils,b_dbutils,Data1, StdCtrls, ComCtrls, Mask, ToolEdit, ToolWin, Db,
  IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl, RXSpin,
  FR_Class, FR_DSet, FR_DBSet;

type
  TREPORT_CARD_ONE_SHOP = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    DT2: TDateEdit;
    Label2: TLabel;
    DT1: TDateEdit;
    ToolButton1: TToolButton;
    Button1: TButton;
    BtnPrint: TToolButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    QueryReportCARD_ID: TIntegerField;
    QueryReportCARD_NUM: TIntegerField;
    QueryReportCN: TIntegerField;
    QueryReportSUMM: TFloatField;
    QueryReportSUMM2: TFloatField;
    QueryReportSUMM3: TFloatField;
    QueryReportSHOP_ID: TIntegerField;
    QueryReportSHOP_NAME: TIBStringField;
    QueryReportUS_ID: TIntegerField;
    QueryReportUS_NAME: TIBStringField;
    DsReport: TDataSource;
    RxDBGrid1: TRxDBGrid;
    QueryReportCARD_DATE: TDateTimeField;
    MX: TRxSpinEdit;
    Label3: TLabel;
    BtnOpen: TToolButton;
    FrDbSet: TfrDBDataSet;
    frReport1: TfrReport;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QueryReportAfterOpen(DataSet: TDataSet);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_CARD_ONE_SHOP: TREPORT_CARD_ONE_SHOP;
  REPORT_TITLE:string;

implementation

uses EditCard;

{$R *.DFM}

procedure TREPORT_CARD_ONE_SHOP.FormShow(Sender: TObject);
begin
   caption:=CAP_REPORT_CARD_ONE_SHOP;
   DT1.date:=date();
   DT2.date:=date();
end;

procedure TREPORT_CARD_ONE_SHOP.Button1Click(Sender: TObject);
begin
  BtnPrint.enabled:=False;
  BtnOpen.enabled:=False;
  Dt1.enabled:=False;
  Dt2.enabled:=False;
  Mx.enabled:=False;
  ReportTransaction.Active:=False;
  QueryReport.close;
  QueryReport.paramByname('DT1').asdatetime:=dt1.date;
  QueryReport.paramByname('MX').asinteger:=trunc(mx.value);
  QueryReport.paramByname('DT2').asdatetime:=dt2.date+1-sekond1;
  QueryReport.open;
  Dt1.enabled:=True;
  Dt2.enabled:=True;
  Mx.enabled:=True;
end;

procedure TREPORT_CARD_ONE_SHOP.QueryReportAfterOpen(DataSet: TDataSet);
begin
   BtnPrint.enabled:=not QueryReport.eof;
   BtnOpen.enabled:=not QueryReport.eof;
end;

procedure TREPORT_CARD_ONE_SHOP.BtnOpenClick(Sender: TObject);
begin
  Application.createForm(TEDIT_CARD,EDIT_CARD);
  EDIT_CARD.tag:=QueryReport.fieldByname('CARD_ID').asinteger;
  EDIT_CARD.ShowModal;
  EDIT_CARD.Destroy;
end;

procedure TREPORT_CARD_ONE_SHOP.RxDBGrid1DblClick(Sender: TObject);
begin
   if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TREPORT_CARD_ONE_SHOP.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then begin
     key:=#0;
     if BtnOpen.Enabled then BtnOpen.click;
   end;
end;

procedure TREPORT_CARD_ONE_SHOP.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_CARD_ONE_SHOP.BtnPrintClick(Sender: TObject);
begin
    REPORT_TITLE:=CAP_REPORT_CARD_ONE_SHOP+' за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date)+
    ', с числом покупок более '+inttostr(trunc(MX.value));
   FrReport1.ShowReport;
end;

end.
