unit ANALIZTW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls,
  Buttons, Mask, ToolEdit, ComCtrls, TeEngine, Series, TeeProcs, Chart,
  ToolWin,Db, IBCustomDataSet, IBQuery, IBDatabase,
  RxMemDS, DBChart, CurrEdit, Animate, GIFCtrl, RxLookup, DBCtrls,VclUtils
  ;

type
  TANALIZ_TW = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    Panel8: TPanel;
    Panel9: TPanel;
    AnalizTransaction: TIBTransaction;
    QrAnaliz_TW: TIBQuery;
    QrAnaliz_PNS: TIBQuery;
    DsAnaliz_TW: TDataSource;
    ToolButton2: TToolButton;
    RxDBGrid2: TRxDBGrid;
    Panel1: TPanel;
    RxDBGrid3: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label1: TLabel;
    KOL: TRxCalcEdit;
    QrAnaliz_TWPP_ID: TIntegerField;
    QrAnaliz_TWPP_IDS: TIntegerField;
    QrAnaliz_TWPP_TYP: TIntegerField;
    QrAnaliz_TWPP_TYP_FULL: TIBStringField;
    QrAnaliz_TWPP_PNTYP_ID: TIntegerField;
    QrAnaliz_TWPP_SHOP_ID: TIntegerField;
    QrAnaliz_TWPP_SKL_ID: TIntegerField;
    QrAnaliz_TWPP_DT: TDateTimeField;
    QrAnaliz_TWTW_KOL: TFloatField;
    QrAnaliz_TWMEN_ID: TIntegerField;
    QrAnaliz_TWPP_POST: TIntegerField;
    QrAnaliz_TWPP_FULLNUM: TIBStringField;
    QrAnaliz_TWPP_POST_FULL: TIBStringField;
    QrAnaliz_TWPP_SKL_FULL: TIBStringField;
    QrAnaliz_TWPP_MEN_FULL: TIBStringField;
    QrAnaliz_TWPP_OST: TFloatField;
    Timer1: TTimer;
    QrAnaliz_TWSHOP_COLOR: TIntegerField;
    QrAnaliz_PNSID: TIntegerField;
    QrAnaliz_PNSIDS: TIntegerField;
    QrAnaliz_PNSTYP: TIntegerField;
    QrAnaliz_PNSTYP_FULL: TIBStringField;
    QrAnaliz_PNSRNTYP_ID: TIntegerField;
    QrAnaliz_PNSSHOP_ID: TIntegerField;
    QrAnaliz_PNSSKL_ID: TIntegerField;
    QrAnaliz_PNSDT: TDateTimeField;
    QrAnaliz_PNSTW_KOL: TFloatField;
    QrAnaliz_PNSKLN_ID: TIntegerField;
    QrAnaliz_PNSFULLNUM: TIBStringField;
    QrAnaliz_PNSKLN_FULL: TIBStringField;
    QrAnaliz_PNSSKL_FULL: TIBStringField;
    QrAnaliz_PNSSHOP_COLOR: TIntegerField;
    DsAnaliz: TDataSource;
    QrAnaliz_PNSNAC: TFloatField;
    QrAnaliz_PNSNAC2: TFloatField;
    QrAnaliz_PNSPERCENT: TFloatField;
    QrAnaliz_PNSPERCENT2: TFloatField;
    QrAnaliz_PNSMONEY: TFloatField;
    QrAnaliz_PNSMONEY2: TFloatField;
    QrAnaliz_PNStw_summ: TFloatField;
    QrAnaliz_TWMONEY: TFloatField;
    QrAnaliz_TWMONEY2: TFloatField;
    QrAnaliz_TWSEB: TFloatField;
    QrAnaliz_TWSEB2: TFloatField;
    QrAnaliz_TWNDS: TFloatField;
    QrAnaliz_TWNDS2: TFloatField;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrAnaliz_TWAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure QrAnaliz_PNSCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ANALIZ_TW: TANALIZ_TW;
  PROD_DT1,PROD_DT2:Tdatetime;
  Refresh_PN:boolean;

implementation

uses WaitForm;

{$R *.DFM}

var
  FTR:boolean;
  CanRefresh:boolean;

procedure TANALIZ_TW.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TANALIZ_TW.FormShow(Sender: TObject);
begin
     FTR:=True;


      MemFrm.EmptyTable;
      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=-1;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;

      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Розница>';
      MemFrm.Post;

      ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(-1) order by 2');
      QueryWork.open;
      while not QueryWork.eof do begin
        MemFrm.Append;
        MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
        MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
        MemFrm.Post;
        QueryWork.next;
      end;


     FRM.Value:=inttostr(-1);






     Wait_Form.StatusBar1.panels[0].text:='Анализ товара. Запрос карточки...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     Refresh_PN:=false;
     workTransaction.Active:=False;
     ADD_SQL(QueryWork,'select tw_art,tw_nam from tw where tw_id=:tw_id');
     QueryWork.ParamByname('TW_ID').asinteger:=Analiz_tw.tag;
     QueryWork.Open;
     ANALIZ_TW.caption:='Анализ товара: '+QueryWork.fieldbyname('TW_ART').asstring+' '+
     QueryWork.fieldbyname('TW_NAM').asstring;
     QueryWork.close;
     AnalizTransaction.Active:=False;
     IS_ANALIZ_TW:=True;
     {Выводим основные данные}
     PageControl1.ActivePage:=Tabsheet1;
     {Читаем информацию}
     Refresh_PN:=True;
     Wait_Form.StatusBar1.panels[0].text:='Анализ товара. Запрос приходов...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(100);
     QrAnaliz_TW.close;
     QrAnaliz_TW.ParamByname('TW_ID').asinteger:=Analiz_tw.tag;
     QrAnaliz_TW.ParamByName('FRM_ID').asInteger:=strtoint(frm.Value);
     QrAnaliz_TW.Open;
     Wait_Form.StatusBar1.panels[0].text:='Анализ товара. Запрос остатка...';
     Wait_Form.Gauge1.Progress:=90;
     Wait_Form.Show;
     delay(100);
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select ost from ost_now_all(:tw_id)');
     QueryWork.ParamByname('TW_ID').asinteger:=Analiz_tw.tag;
     QueryWork.Open;
     KOL.value:=QueryWork.fieldByname('OST').asfloat;
     QueryWork.close;
     Wait_Form.StatusBar1.panels[0].text:='Анализ товара. Готово...';
     Wait_Form.Gauge1.Progress:=100;
     Wait_Form.Show;
     delay(100);
     Wait_Form.Hide;
     CanRefresh:=True;
     Timer1.enabled:=true;
end;

procedure TANALIZ_TW.PageControl1Change(Sender: TObject);
begin
  {123}
end;

procedure TANALIZ_TW.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_ANALIZ_TW:=False;
     QrAnaliz_TW.close;
     AnalizTransaction.Active:=False;
end;

procedure TANALIZ_TW.QrAnaliz_TWAfterOpen(DataSet: TDataSet);
begin
  timer1.enabled:=false;
  timer1.enabled:=true;
end;

procedure TANALIZ_TW.RxDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ID').Asinteger>0 then begin
     RxDbGrid3.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='FULLNUM' then RxDbGrid3.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     end;
     RxDbGrid3.Canvas.Font.color:=clWindowText;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NAC$').Asinteger<0)
       and (Column.Field.FullName='NAC$') then begin
         RxDbGrid3.Canvas.Brush.color:=ClRed;
         RxDbGrid3.Canvas.Font.color:=ClWhite;
     end;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NAC').Asinteger<0)
       and (Column.Field.FullName='NAC') then begin
         RxDbGrid3.Canvas.Brush.color:=ClRed;
         RxDbGrid3.Canvas.Font.color:=ClWhite;
     end;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('percent$').Asinteger<0)
       and (Column.Field.FullName='PERCENT$') then begin
         RxDbGrid3.Canvas.Brush.color:=ClRed;
         RxDbGrid3.Canvas.Font.color:=ClWhite;
     end;
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PERCENT').Asinteger<0)
       and (Column.Field.FullName='PERCENT') then begin
         RxDbGrid3.Canvas.Brush.color:=ClRed;
         RxDbGrid3.Canvas.Font.color:=ClWhite;
     end;
     if (GdSelected in State ) then begin
           RxDbGrid3.Canvas.Brush.color:=clHighlight;
           RxDbGrid3.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='FULLNUM' then RxDbGrid3.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
           end;
           RxDbGrid3.Canvas.Brush.color:=clHighlight;
     end;
     RxDbGrid3.DefaultDrawColumnCell(Rect,DataCol,Column,State)
 end else RxDbGrid3.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TANALIZ_TW.RxDBGrid3DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid3.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TANALIZ_TW.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asinteger<0 then begin
        Afont.color:=clRed;
     end;
     if Field.Fieldname='PP_FULLNUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then begin
           Afont.color:=clWindowText;
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
        end;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asinteger<0 then begin
           Background:=ClRed;
           Afont.color:=ClWhite;
        end;
        if Field.Fieldname='PP_FULLNUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then begin
           Background:=clHighlight;
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
          end;
        end;
     end;
end;

procedure TANALIZ_TW.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

procedure TANALIZ_TW.RxDBGrid2DblClick(Sender: TObject);
begin
   if Qranaliz_TW.fieldbyname('PP_TYP').asinteger=11 then begin
     SHOW_ANALIZ_PN(Qranaliz_TW.fieldbyname('PP_ID').asinteger);
   end;
end;

procedure TANALIZ_TW.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
     key:=#0;
     if Qranaliz_TW.fieldbyname('PP_TYP').asinteger=11 then begin
       SHOW_ANALIZ_PN(Qranaliz_TW.fieldbyname('PP_ID').asinteger);
     end;
   end;
end;

procedure TANALIZ_TW.RxDBGrid3DblClick(Sender: TObject);
begin
       if Qranaliz_PNS.fieldbyname('TYP').asinteger in [1,3] then
       SHOW_ANALIZ_RN(Qranaliz_PNS.fieldbyname('ID').asinteger);
       if Qranaliz_PNS.fieldbyname('TYP').asinteger=2 then
       SHOW_ANALIZ_SPIS(Qranaliz_PNS.fieldbyname('ID').asinteger);
end;

procedure TANALIZ_TW.RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
        key:=#0;
        if Qranaliz_PNS.fieldbyname('TYP').asinteger in [1,3] then
        SHOW_ANALIZ_RN(Qranaliz_PNS.fieldbyname('ID').asinteger);
        if Qranaliz_PNS.fieldbyname('TYP').asinteger=2 then
        SHOW_ANALIZ_SPIS(Qranaliz_PNS.fieldbyname('ID').asinteger);
     end;
end;

procedure TANALIZ_TW.QrAnaliz_PNSCalcFields(DataSet: TDataSet);
begin
  QrAnaliz_PNS.fieldByname('TW_SUMM').asfloat:=
  QrAnaliz_PNS.fieldByname('TW_kol').asfloat*
  QrAnaliz_PNS.fieldByname('money').asfloat;

end;

procedure TANALIZ_TW.Timer1Timer(Sender: TObject);
begin
  Timer1.enabled:=False;
  if CanRefresh then begin
     QrAnAliz_pns.close;
     QrAnAliz_pns.paramByname('PP_TYP').asinteger:=QrAnaliz_tw.fieldByname('PP_TYP').asinteger;
     QrAnAliz_pns.paramByname('PP_IDS').asinteger:=QrAnaliz_tw.fieldByname('PP_IDS').asinteger;
     QrAnAliz_pns.Open;
  end;
end;

procedure TANALIZ_TW.FRMChange(Sender: TObject);
begin
     QrAnaliz_TW.close;
     QrAnaliz_TW.ParamByname('TW_ID').asinteger:=Analiz_tw.tag;
     QrAnaliz_TW.ParamByName('FRM_ID').asInteger:=strtoint(frm.Value);
     QrAnaliz_TW.Open;
end;

end.
