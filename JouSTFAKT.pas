unit JouSTFAKT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,
  Db, IBCustomDataSet, IBQuery,B_DButils,B_Utils,IBDatabase,
  Menus, StdCtrls, RxLookup, RxMemDS, ppDB, ppCtrls, ppBands, ppMemo,
  ppVar, ppStrtch, ppRegion, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDBPipe;

type
  TJou_STFAKT = class(TDefault_Journal)
    QrSTFAKTList: TIBQuery;
    DsSTFAKTList: TDataSource;
    STFAKTListTranSaction: TIBTransaction;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnNEW: TMenuItem;
    MnDEL: TMenuItem;
    N8: TMenuItem;
    MnPRINT: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnInterval: TMenuItem;
    N15: TMenuItem;
    MnAdm: TMenuItem;
    QrSTFAKTListKLN_PREFIX: TIBStringField;
    QrSTFAKTListSTFAKT_ID: TIntegerField;
    QrSTFAKTListSTFAKT_DATE: TDateTimeField;
    QrSTFAKTListSTFAKT_NUM_FULL: TIBStringField;
    QrSTFAKTListSTFAKT_ERR: TIBStringField;
    QrSTFAKTListSTFAKT_SUMM: TFloatField;
    QrSTFAKTListSTFAKT_COLOR: TIntegerField;
    QrSTFAKTListUS_FULL: TIBStringField;
    QrSTFAKTListKLN_FULL: TIBStringField;
    BtnError: TToolButton;
    MnERR: TMenuItem;
    MemShop: TRxMemoryData;
    MemShopSHOP_ID: TIntegerField;
    MemShopSHOP_NAME: TStringField;
    DsShop: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QrSTFAKTListSTFAKT_NUM: TIntegerField;
    QrSTFAKTListSTFAKT_DOW: TIBStringField;
    ToolBar2: TToolBar;
    Label1: TLabel;
    SHOP: TRxDBLookupCombo;
    PipStFaktList: TppDBPipeline;
    PpStFaktLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel14: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    StFaktListTitle1: TppMemo;
    ppRegion79: TppRegion;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel443: TppLabel;
    ppLabel483: TppLabel;
    ppLabel442: TppLabel;
    ppLabel8: TppLabel;
    ppLabel441: TppLabel;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel449: TppLabel;
    ppLabel450: TppLabel;
    ppLabel465: TppLabel;
    ppLabel9: TppLabel;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    PpStUser: TppLabel;
    ppLabel460: TppLabel;
    ST_VERS: TppLabel;
    ppLabel462: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBText148: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppDBMemo3: TppDBMemo;
    ppFooterBand14: TppFooterBand;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc1: TppDBCalc;
    QrSTFAKTListSTFAKT_NP: TFloatField;
    QrSTFAKTListSTFAKT_NDS: TFloatField;
    QrSTFAKTListGP_FULL: TIBStringField;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrSTFAKTListAfterScroll(DataSet: TDataSet);
    procedure QrSTFAKTListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIntervalClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnErrorClick(Sender: TObject);
    procedure BtnAdmClick(Sender: TObject);
    procedure SHOPChange(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure PpStFaktLISTPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jou_STFAKT: TJou_STFAKT;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;

implementation

uses DateInterval, FindDocNum, SetJouDate, StfaktError,
  AdminStFakt, EditStFakt, WaitForm, SelectPrint;

{$R *.DFM}

procedure TJou_STFAKT.FormShow(Sender: TObject);
begin
  inherited;
  {Определяем название}
  Show_Wait('Инициализация. Магазины...',2);
  WorkTransaction.Active:=False;
  MemSHOP.EmptyTable;
  MemSHOP.Append;
  MemSHOP.fieldByname('SHOP_ID').asinteger:=0;
  MemSHOP.fieldByname('SHOP_NAME').asstring:='<Все>';
  MemSHOP.Post;
  OPEN_SQL(QueryWork,'select shop_id,shop_name from shop order by shop_name');
  while not QueryWork.eof do begin
    MemShop.Append;
    MemShop.fieldByname('SHOP_ID').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
    MemShop.fieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('SHOP_NAME').asstring;
    MemShop.Post;
    QueryWork.next;
  end;


  MemFrm.EmptyTable;
  MemFrm.Append;
  MemFrm.fieldByname('FRM_ID').asinteger:=0;
  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
  MemFrm.Post;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from rn_dic_frm(:FRM_ID) order by 2');
  QueryWork.ParamByname('FRM_ID').asinteger:=DEFAULT_FIRMA;
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;


  Show_Wait('Все почти готово...',95);
  G_KEY:=#0;
  DT1:=Date();
  DT2:=Date();
   SHOP.value:='0';
//   Refresh_list;
  Wait_Form.hide;
end;

Procedure TJou_STFAKT.refresh_Btn;
var
   EN:boolean;
begin
     BtnDel.Enabled:=EnEof;
     MnDel.Enabled:=EnEof;
     BtnError.enabled:=(EnEof) and (QrSTFAKTList.fieldByname('STFAKT_ERR').asinteger=1);
     BtnPrint.enabled:=(EnEof) and (QrSTFAKTList.fieldByname('STFAKT_ERR').asinteger=0);
     MnErr.enabled:=(EnEof) and (QrSTFAKTList.fieldByname('STFAKT_ERR').asinteger=1);
     BtnOpen.enabled:=(EnEof) and (QrSTFAKTList.fieldByname('STFAKT_ERR').asinteger=0);
end;

Procedure TJou_STFAKT.refresh_list;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrSTFAKTList.close;
     QrSTFAKTList.ParamByname('SHOP_ID').asinteger:=strtoint('0'+SHOP.value);
     QrSTFAKTList.ParamByname('DT1').asdatetime:=DT1;
     QrSTFAKTList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrSTFAKTList.ParamByname('FRM_ID').asinteger:=strtoint('0'+FRM.value);
     STFAKTListTransaction.Active:=False;
     QrSTFAKTList.Open;
end;

procedure TJou_STFAKT.QrSTFAKTListAfterScroll(DataSet: TDataSet);
begin
  Refresh_Btn;
end;

procedure TJou_STFAKT.QrSTFAKTListAfterOpen(DataSet: TDataSet);
begin
  if QrSTFAKTList.eof then EnEof:=false else EnEof:=true;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  MnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  Refresh_Btn;
end;

procedure TJou_STFAKT.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='STFAKT_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='STFAKT_NUM_FULL' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='STFAKT_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('STFAKT_ERR').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         49,True);
      end;
    end;
end;

procedure TJou_STFAKT.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_STFAKT.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJou_STFAKT.BtnIntervalClick(Sender: TObject);
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

procedure TJou_STFAKT.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnPrint.Enabled then BtnPrint.click;
end;

procedure TJou_STFAKT.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrSTFAKTList.fieldByname('STFAKT_ID').asinteger;
  if Messbox('Удалить счёт-фактуру '+QrSTFAKTList.fieldByname('STFAKT_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       IF IBDELETE_DOC('STFAKT',ID) then begin
          Datamodule1.IBTransaction2.Commit;
          Datamodule1.IBTransaction2.Active:=False;
          Refresh_List;
       end else Datamodule1.IBTransaction2.RollBack;
       Datamodule1.IBTransaction2.Active:=False;
  end;
  QrSTFAKTList.locate('STFAKT_ID',ID,[]);
end;

procedure TJou_STFAKT.BtnPrintClick(Sender: TObject);
var
  s:string;
begin
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_STFAKT.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_STFAKT.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Счет-фактуру';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.Button3.caption:='Напечатать Счет-фактуру 2011';
  Select_Print.Button4.caption:='';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
    if Select_Print.tag=3 then PRINT_STFAKTDOC_NEW(QrSTFAKTList.fieldbyname('STFAKT_ID').asinteger);
    if Select_Print.tag=1 then PRINT_STFAKTDOC_2012(QrSTFAKTList.fieldbyname('STFAKT_ID').asinteger, 0);
    if Select_Print.tag=2 then begin
       // Печать журнала
       s:='Журнал счетов фактур за период с '+date_sokr(dt1)+' по '+date_sokr(dt2);
       if SHOP.value='0' then s:=s+', выписанных во всех магазинах'
       else s:=s+', выписанных в магазине: '+shop.text;
             PpStFaktList.reset;
             StFaktListTitle1.lines.clear;
             StFaktListTitle1.lines.add(s);
             PpStFaktList.Print;
    end;
  end;
  Select_Print.destroy;
end;

procedure TJou_STFAKT.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=6; {Метка, что искать в счетах-фактурах}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     FIND_DOCNUM.IbQuery1.close;
     FIND_DOCNUM.IbQuery1.SQL.clear;
     FIND_DOCNUM.IbQuery1.SQL.add('SELECT bg_STRIPTIME(STFAKT_DATE) AS STFAKT_DATE FROM STFAKT WHERE STFAKT_ID=:STFAKT_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('STFAKT_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('STFAKT_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrSTFAKTList.locate('STFAKT_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_STFAKT.BtnErrorClick(Sender: TObject);
begin
  Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
  STFAKT_ERROR.tag:=QrSTFAKTList.fieldbyname('STFAKT_ID').asinteger;
   STFAKT_ERROR.FormCreate(Sender);
  STFAKT_ERROR.ShowModal;
  STFAKT_ERROR.Destroy;
end;

procedure TJou_STFAKT.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
begin
  ADD_SQL(IbQuery1,'select STFAKT_NUM from stFAKT where stFAKT_id=:stfakt_id');
  IbQuery1.paramByname('STFAKT_ID').asinteger:=QrStfaktList.fieldbyname('STFAKT_ID').asinteger;
  IbQuery1.Open;
  Application.createForm(TADMIN_STFAKT,ADMIN_STFAKT);
  ADMIN_STFAKT.NUM.value:=IbQuery1.fieldbyname('STFAKT_NUM').asinteger;
  ADMIN_STFAKT.showModal;
  if ADMIN_STFAKT.tag>0 then begin
     {Изменяем данные накладной}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('STFAKT_NUM',int(ADMIN_STFAKT.NUM.value));
     ID:=QrStFaktList.fieldbyname('STFAKT_ID').asinteger;
     IF IBSAVE_DOC('STFAKT',ID)>0 then begin
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Refresh_List;
        QrStFaktList.locate('STFAKT_ID',ID,[]);
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_STFAKT.destroy;
end;

procedure TJou_STFAKT.SHOPChange(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

procedure TJou_STFAKT.BtnOpenClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
  inherited;
  ID:=QrStFaktList.fieldbyname('STFAKT_ID').asinteger;
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select * from stfakt where stfakt_id=:stfakt_id');
  QueryWork.ParamByname('stfakt_id').asinteger:=Id;
  QueryWork.Open;
  Application.createForm(TEDIT_STFAKT,EDIT_STFAKT);
  EDIT_STFAKT.STFAKT_DOW.text:=QueryWork.fieldByname('STFAKT_DOW').asstring;
  if QueryWork.fieldByname('STFAKT_GP').asinteger<1 then begin
     EDIT_STFAKT.GP1.checked:=true;
     EDIT_STFAKT.STFAKT_GP.tag:=-1;
  end else begin
     EDIT_STFAKT.GP2.checked:=true;
     EDIT_STFAKT.STFAKT_GP.tag:=QueryWork.fieldByname('STFAKT_GP').asinteger;
  end;
  EDIT_STFAKT.ShowModal;
  if EDIT_STFAKT.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
       IBSAVE_CLEAR;
       IBSAVE_ADD('STFAKT_DOW',trim(EDIT_STFAKT.STFAKT_DOW.text));
       if EDIT_STFAKT.GP1.checked then IBSAVE_ADD('STFAKT_GP',-1)
                                  else IBSAVE_ADD('STFAKT_GP',EDIT_STFAKT.STFAKT_GP.tag);
       IBSAVE_ADD('US_ID',USERID);
       if IBSAVE_DOC('STFAKT',ID)<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.commit;
     except
       Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_list;
     QrStFaktList.locate('STFAKT_ID',ID,[]);
     RXDBGrid1.setfocus;
  end;
  EDIT_STFAKT.destroy;

end;

procedure TJou_STFAKT.PpStFaktLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
   PpStFaktLIST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TJou_STFAKT.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PPSTUSER.Caption:=USERFIO_SHORT;
     ST_VERS.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_STFAKT.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrStFaktList.fieldbyname('STFAKT_ERR').asstring='1'
  then PpImage1.Visible:=true else PpImage1.Visible:=False;

end;

procedure TJou_STFAKT.FRMChange(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

end.

