unit JouPsort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Db, IBCustomDataSet, IBQuery,B_Utils,B_DBUtils,IBDatabase, Menus,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppVar, ppCtrls,
  ppMemo, ppStrtch, ppRegion, ppPrnabl, ppClass, ppProd, ppReport,
  RxLookup, StdCtrls, RxMemDS;

type
  TJou_PSORT = class(TDefault_Journal)
    IBQuery1: TIBQuery;
    DsPsortList: TDataSource;
    PsortListTransaction: TIBTransaction;
    QrPsortList: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNEw: TMenuItem;
    MnOpen: TMenuItem;
    MnCopy: TMenuItem;
    MnDel: TMenuItem;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnAnaliz: TMenuItem;
    MnSubDoc: TMenuItem;
    N14: TMenuItem;
    MnPeriod: TMenuItem;
    N16: TMenuItem;
    MnAdm: TMenuItem;
    PipPsortList: TppDBPipeline;
    PpPsortLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppRegion79: TppRegion;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel441: TppLabel;
    ppLabel443: TppLabel;
    ppLabel482: TppLabel;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel450: TppLabel;
    ppLabel461: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppFooterBand14: TppFooterBand;
    ppLine59: TppLine;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    ppLabel457: TppLabel;
    PpPsortListUser: TppLabel;
    PsortListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpSpisListVers: TppLabel;
    PpPsortListVers: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppLabel1: TppLabel;
    PsortListTitle1: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    QrPsortListPSORT_ID: TIntegerField;
    QrPsortListPSORT_COLOR: TIntegerField;
    QrPsortListPSORT_FULL_NUM: TIBStringField;
    QrPsortListPSORT_DATE: TDateTimeField;
    QrPsortListSKL_NAME: TIBStringField;
    QrPsortListPSORT_OSN: TIBStringField;
    QrPsortListUS_FULL: TIBStringField;
    QrPsortListPSORT_PROW: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QrPsortListPSORT_MEN: TIBStringField;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrPsortListAfterScroll(DataSet: TDataSet);
    procedure QrPsortListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdmClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure PpPsortLISTPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ANALIZ,CAN_ADM, CAN_REFRESH:boolean;
  Jou_PSORT: TJou_PSORT;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;

implementation

uses Data1, DateInterval, SetJouDate, FindDocNum, SelectPrint,
  DocPsort, AdminPsort;

{$R *.DFM}

procedure TJou_PSORT.FormShow(Sender: TObject);
begin
  inherited;
  CAN_REFRESH:=false;
{Загрузка списка доступных фирм}
  MemFrm.EmptyTable;
  MemFrm.Append;
  MemFrm.fieldByname('FRM_ID').asinteger:=0;
  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
  MemFrm.Post;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from rn_dic_frm(:FRM_ID) order by 2');
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
  FRM.value:='0';

  CAN_REFRESH:=true;


  CAN_NEW:=Check_Dostup('$JOU.PSORT.NEW');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  Get_DEFAULT;
  DT1:=date();
  DT2:=date();
  Refresh_list;
//  btnNew.Enabled := check_dostup('$JOU.PSORT.NEW'); //акт пересортицы
end;

Procedure TJou_PSORT.refresh_Btn;
var
   EN:boolean;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     if QrPsortList.fieldbyname('PSORT_PROW').asstring='1' then EN:=false else EN:=true;
     BtnProw.Enabled:=EN and EnEof;
     MnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof;
     MnDel.Enabled:=EN and EnEof;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
end;

Procedure TJou_PSORT.refresh_list;
begin
     if Can_Refresh=false then
     	exit;

     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     PsortListTransaction.Active:=False;
     QrPsortList.close;
     QrPsortList.ParamByname('DT1').asdatetime:=DT1;
     QrPsortList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrPsortList.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);

     QrPsortList.Open;
end;


procedure TJou_PSORT.QrPsortListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrPsortList.fieldbyname('US_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_PSORT.QrPsortListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrPsortList.fieldbyname('US_FULL').asstring;
  if QrPsortList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  MnAdm.Enabled:=EnEof and CAN_ADM_JOU;
  Refresh_Btn;

end;

procedure TJou_PSORT.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger>=0 then begin
           if Column.index=1 then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger>=0 then begin
              if Column.index=1 then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger>=0 then begin
        if Column.index=1 then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PSORT_PROW').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
      end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
    end;
end;

procedure TJou_PSORT.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_PSORT.FormKeyPress(Sender: TObject; var Key: Char);
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
  if KEY in ['c','C','с','С'] then begin
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

procedure TJou_PSORT.BtnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrPsortList.fieldByname('PSORT_ID').asinteger;
  if PROV_PSORT(ID,' '+QrPsortList.fieldbyname('PSORT_FULL_NUM').asstring+
  ' от '+date_sokr(QrPsortList.fieldbyname('PSORT_DATE').asdatetime)+' ') then begin
     QrPsortList.DisableControls;
     QrPsortList.close;
     PsortListTransaction.Active:=False;
     QrPsortList.Open;
     QrPsortList.Locate('PSORT_ID',ID,[]);
     QrPsortList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PSORT.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrpsortList.fieldByname('PSORT_ID').asinteger;
  if UNPROV_PSORT(ID,' '+QrPsortList.fieldbyname('PSORT_FULL_NUM').asstring+
  ' от '+date_sokr(QrPsortList.fieldbyname('PSORT_DATE').asdatetime)+' ') then begin
     QrPsortList.DisableControls;
     QrPsortList.close;
     PsortListTransaction.Active:=False;
     QrPsortList.Open;
     QrPsortList.Locate('PSORT_ID',ID,[]);
     QrPsortList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PSORT.BtnIntervalClick(Sender: TObject);
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

procedure TJou_PSORT.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TDoc_PSORT,Doc_PSORT);
    Doc_PSORT.tag:=-1;
    Doc_PSORT.showModal;
    if Doc_PSORT.tag>0 then begin
      DT1:=Doc_PSORT.PSORT_DATE.date;
      DT2:=Doc_PSORT.PSORT_DATE.date;
      refresh_list;
      QrPsortList.locate('PSORT_ID',Doc_PSORT.tag,[]);
    end;
    Doc_PSORT.destroy;
    RxDbgrid1.setfocus;
end;

procedure TJou_PSORT.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrPsortList.fieldByname('PSORT_ID').asinteger;
  if Messbox('Удалить Акт пересортицы '+QrPsortList.fieldByname('PSORT_FULL_NUM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       QrPsortList.DisableControls;
       QrPsortList.Close;
       PsortListTransaction.Active:=False;
       PsortListTransaction.StartTransaction;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_PSORT(:PSORT_ID,:US_ID)');
       DataModule1.IbSaveSQL.Parambyname('PSORT_ID').asinteger:=ID;
       DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
       try
          DataModule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBAck;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       PsortListTransaction.Active:=False;
       QrPsortList.Open;
       QrPsortList.locate('PSORT_ID',ID,[]);
       QrPsortList.EnableControls;
  end;
end;

procedure TJou_PSORT.BtnPrintClick(Sender: TObject);
begin
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_PSORT.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_PSORT.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Акт пересортицы';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
    case Select_Print.tag of
        1: PRINT_PSORT(QrPsortList.fieldbyname('PSORT_ID').asinteger);
        2: begin
             PpPsortList.reset;
             PsortListTitle1.Caption:=date_sokr(DT1)+' по '+date_Sokr(DT2);
             PsortListTitle2.Caption:='Журнал актов пересортицы за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2);
             PpPsortList.Print;
           end;
    end
  end;
  Select_Print.Destroy;
end;

procedure TJou_PSORT.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Акт пересортицы № '+QrPsortList.fieldbyname('PSORT_FULL_NUM').asstring,'PSORT',QrPsortList.fieldbyname('SPIS_ID').asinteger);
end;

procedure TJou_PSORT.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=20;
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(PSORT_DATE) AS PSORT_DATE FROM PSORT WHERE PSORT_ID=:PSORT_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('PSORT_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PSORT_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrPsortList.locate('PSORT_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_PSORT.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
    Application.CreateForm(TDoc_PSORT,Doc_PSORT);
    ID:=QrPsortList.fieldbyname('PSORT_ID').asinteger;
    Doc_PSORT.tag:=ID;
    Doc_PSORT.showModal;
    Doc_PSORT.destroy;
    QrPsortList.Close;
    PsortListTransaction.Active:=False;
    QrPsortList.Open;
    QrPsortList.locate('PSORT_ID',ID,[]);
end;

procedure TJou_PSORT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QrPsortList.Close;
  PsortListTransaction.Active:=False;
end;

procedure TJou_PSORT.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
  Application.createForm(TADMIN_PSORT,ADMIN_PSORT);
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select psort_num from psort where psort_id=:psort_id');
  QueryWork.ParamByname('PSORT_ID').asinteger:=QrPSORTList.fieldbyname('PSORT_ID').asinteger;
  QueryWork.Open;
  ADMIN_PSORT.NUM.value:=QueryWork.fieldbyname('PSORT_NUM').asinteger;
  QueryWork.Close;
  ADMIN_PSORT.showModal;
  if ADMIN_PSORT.tag>0 then begin
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     if ADMIN_PSORT.checkBox1.checked then begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('DOC','PSORT');
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','Акт проведен административно!');
        IBSAVE_ADD('DOP1',2);
        IBSAVE_ADD('DOP2',QrPSORTList.fieldbyname('PSORT_ID').asinteger);
        if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
     end;
     IBSAVE_CLEAR;
     IBSAVE_ADD('PSORT_NUM',int(ADMIN_PSORT.NUM.value));
     if ADMIN_PSORT.checkBox1.checked then IBSAVE_ADD('PSORT_PROW','1');
     ID:=QrPSORTList.fieldbyname('PSORT_ID').asinteger;
     if IBSAVE_DOC('PSORT',ID)<0 then r:=sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrPSORTList.locate('PSORT_ID',ID,[]);
   except
     Datamodule1.IBTransaction2.rollback;
   End;
   Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_PSORT.destroy;
end;

procedure TJou_PSORT.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

procedure TJou_PSORT.PpPsortLISTPreviewFormCreate(Sender: TObject);
begin
     PpPsortLIST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TJou_PSORT.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpPsortListUser.Caption:=USERFIO_SHORT;
     PpPsortListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_PSORT.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrPsortList.fieldbyname('PSORT_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;
end;

procedure TJou_PSORT.FRMChange(Sender: TObject);
begin
  inherited;
    Refresh_list;
end;

end.
