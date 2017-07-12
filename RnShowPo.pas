unit RnShowPo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  ActnList, IBDatabase, Db, IBCustomDataSet, IBQuery, StdCtrls, Mask,
  ToolEdit, CurrEdit,DocPo;

type
  TRN_SHOW_PO = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Panel3: TPanel;
    ShowTransaction: TIBTransaction;
    QrListRN: TIBQuery;
    QrListRns: TIBQuery;
    QrListPO: TIBQuery;
    QrListRNRNS_ID: TIntegerField;
    QrListRNTW_ID: TIntegerField;
    QrListRNTW_ART: TIntegerField;
    QrListRNTW_NAM: TIBStringField;
    QrListRNED_SHORT: TIBStringField;
    QrListRNTW_KOL: TFloatField;
    QrListRNTW_STORNO: TFloatField;
    QrListRNTW_MONEY: TFloatField;
    QrListRnsSTORNO_ID: TIntegerField;
    QrListRnsSTORNOS_ID: TIntegerField;
    QrListRnsDOC_DATE: TDateTimeField;
    QrListRnsDOC_FULLNUM: TIBStringField;
    QrListRnsSHOP_COLOR: TIntegerField;
    QrListRnsUS_FULL: TIBStringField;
    QrListRnsSKL_FULL: TIBStringField;
    QrListPOPO_ID: TIntegerField;
    QrListPOPO_DATE: TDateTimeField;
    QrListPOPO_FULL_NUM: TIBStringField;
    QrListPOPO_SUMM: TFloatField;
    QrListPOSTORNO_SUMM: TFloatField;
    QrListPOPO_OSN: TIBStringField;
    QrListPOKLN_FULL: TIBStringField;
    QrListPOUS_FULL: TIBStringField;
    QrListPOSHOP_COLOR: TIntegerField;
    DsListRN: TDataSource;
    DsListRNS: TDataSource;
    DsListPO: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel_Storno: TPanel;
    Panel6: TPanel;
    RxDBGrid3: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid1: TRxDBGrid;
    QrListRnsTW_KOL: TFloatField;
    QrListRnsRN_OSN: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RN_SUMM: TRxCalcEdit;
    STORNO_SUMM: TRxCalcEdit;
    PO_SUMM: TRxCalcEdit;
    RN_NUM: TEdit;
    Label4: TLabel;
    KLN_FULL: TEdit;
    Label5: TLabel;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label6: TLabel;
    RN_OSN: TEdit;
    RN_DATE: TEdit;
    Label7: TLabel;
    procedure QrListRNAfterOpen(DataSet: TDataSet);
    procedure QrListRNAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QrListPOAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RN_SHOW_PO: TRN_SHOW_PO;
  CanRefresh:boolean;

implementation

{$R *.DFM}

procedure TRN_SHOW_PO.QrListRNAfterOpen(DataSet: TDataSet);
var
  CR:boolean;
  RNS:double;
  STS:double;
begin
  CR:=CanRefresh;
  CanRefresh:=False;
  CanRefresh:=CR;
  RNS:=0;
  STS:=0;
  QrListRn.disablecontrols;
  while not QrListRn.eof do begin
     RNS:=RNS+QrListRn.fieldByname('TW_KOL').asfloat*QrListRn.fieldByname('TW_MONEY').asfloat;
     STS:=STS+QrListRn.fieldByname('TW_STORNO').asfloat*QrListRn.fieldByname('TW_MONEY').asfloat;
     QrListRn.next;
  end;
  QrListRn.first;
  QrListRn.Enablecontrols;
  if not QrListRn.Eof then begin
      if CanRefresh then begin
        QrListRns.DisableControls;
        QrListRns.close;
        QrListRns.ParamByname('rns_id').asinteger:=QrListRn.fieldByname('rns_id').asinteger;
        QrListRns.open;
        QrListRns.EnableControls;
      end;
   end;
   RN_SUMM.value:=RNS;
   STORNO_SUMM.value:=STS;
end;

procedure TRN_SHOW_PO.QrListRNAfterScroll(DataSet: TDataSet);
begin
      if CanRefresh then begin
        QrListRns.DisableControls;
        QrListRns.close;
        QrListRns.ParamByname('rns_id').asinteger:=QrListRn.fieldByname('rns_id').asinteger;
        QrListRns.open;
        QrListRns.EnableControls;
      end;
end;

procedure TRN_SHOW_PO.FormShow(Sender: TObject);
begin
   CanRefresh:=False;
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select rntyp.rntyp_short,shop.shop_prefix,shop.shop_postfix, '+
   'kln.kln_prefix,rn.rn_num,rn.rn_date,rn.rn_osn, '+
   '(select kln_full from kln_data(rn.kln_id)) as kln_full '+
   'from rn,shop,rntyp,kln where rn.shop_id=shop.shop_id '+
   'and rn.rntyp_id=rntyp.rntyp_id and rn.frm_id=kln.kln_id '+
   'and rn.rn_id=:rn_id');
   QueryWork.paramByname('rn_id').asinteger:=RN_SHOW_PO.tag;
   QueryWork.open;
   RN_NUM.text:=QueryWork.fieldByname('kln_prefix').asstring+' '+
   QueryWork.fieldByname('shop_prefix').asstring+b_utils.right('0000000000'+QueryWork.fieldByname('rn_num').asstring,10)+
   QueryWork.fieldByname('shop_postfix').asstring;
   RN_DATE.text:=datetostr(QueryWork.fieldByname('rn_date').asdatetime)+' '+
   timetostr(QueryWork.fieldByname('rn_date').asdatetime);
   KLN_FULL.text:=QueryWork.fieldByname('kln_full').asstring;
   RN_OSN.text:=QueryWork.fieldByname('rn_osn').asstring;
   ShowTransaction.Active:=False;
   QrListRN.close;
   QrListRN.paramByname('RN_ID').asinteger:=tag;
   QrListRN.open;
   QrListPO.close;
   QrListPO.paramByname('RN_ID').asinteger:=tag;
   QrListPO.open;
   CanRefresh:=True;
   if not QrListRn.Eof then begin
      if CanRefresh then begin
        QrListRns.DisableControls;
        QrListRns.close;
        QrListRns.ParamByname('rns_id').asinteger:=QrListRn.fieldByname('rns_id').asinteger;
        QrListRns.open;
        QrListRns.EnableControls;
      end;
   end;
end;

procedure TRN_SHOW_PO.QrListPOAfterOpen(DataSet: TDataSet);
var
  POS:double;
begin
    // просчитываем сумму
    POS:=0;
    QrListPo.DisableControls;
    while not QrListPo.eof do begin
       POS:=POS+QrListPo.fieldByname('PO_SUMM').asfloat-QrListPo.fieldByname('STORNO_SUMM').asfloat;
       QrListPo.next;
    end;
    QrListPo.First;
    QrListPo.EnableControls;
    PO_SUMM.value:=POS;

end;

procedure TRN_SHOW_PO.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then begin
      key:=#0;
      close;
   end;
end;

procedure TRN_SHOW_PO.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if Field.FullName='TW_STORNO' then begin
     if Field.AsFloat>0 then begin
           Afont.Color:=clYellow;
           BackGround:=clRed;
     end;
   end;
end;

procedure TRN_SHOW_PO.RxDBGrid1DblClick(Sender: TObject);
begin
    if not QrListPO.eof then begin
      Application.createForm(TDOC_PO,DOC_PO);
      DOC_PO.tag:=QrListPO.fieldByname('PO_ID').asinteger;
      DOC_PO.ShowModal;
      if DOC_PO.tag>0 then begin
         QrListPO.locate('PO_ID',DOC_PO.tag,[]);
      end;
      DOC_PO.Destroy;
    end;
end;

procedure TRN_SHOW_PO.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePage:=Tabsheet1;
end;

end.
