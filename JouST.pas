unit JouST;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,
  Db, IBCustomDataSet, IBQuery,B_DButils,B_Utils,IBDatabase,
  Menus,DocST,AdminSt, ppDB, ppCtrls, ppBands, ppVar, ppMemo, ppStrtch,
  ppRegion, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
  ppDBPipe, RxLookup, StdCtrls, RxMemDS;

type
  TJou_ST = class(TDefault_Journal)
    QrStList: TIBQuery;
    DsStList: TDataSource;
    StListTranSaction: TIBTransaction;
    IBQuery1: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnNEW: TMenuItem;
    MnOPEN: TMenuItem;
    MnCopy: TMenuItem;
    MnDEL: TMenuItem;
    N8: TMenuItem;
    MnPRINT: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnSubDoc: TMenuItem;
    N14: TMenuItem;
    MnInterval: TMenuItem;
    QrStListST_SUMM: TFloatField;
    QrStListST_ID: TIntegerField;
    QrStListST_NUM_FULL: TIBStringField;
    QrStListST_DATE: TDateTimeField;
    QrStListST_COLOR: TIntegerField;
    QrStListUS_FULL: TIBStringField;
    QrStListKLN_ORG: TIBStringField;
    QrStListKLN_PREFIX: TIBStringField;
    QrStListVALUTA_SHORT: TIBStringField;
    N1: TMenuItem;
    MnAdm: TMenuItem;
    PipStList: TppDBPipeline;
    PpSTLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppLabel1: TppLabel;
    StListTitle1: TppLabel;
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
    ppDBText148: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLine1: TppLine;
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
    PpStListUser: TppLabel;
    StListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpStListVers: TppLabel;
    ppLabel462: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppImage2: TppImage;
    ppRegion1: TppRegion;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppRegion2: TppRegion;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    ppImage3: TppImage;
    ppLine2: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel19: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel20: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppImage4: TppImage;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel28: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel29: TppLabel;
    ppDBCalc2: TppDBCalc;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrStListAfterScroll(DataSet: TDataSet);
    procedure QrStListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnAdmClick(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure PpSTLISTPreviewFormCreate(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jou_ST: TJou_ST;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  CAN_NEW,CAN_ANALIZ,CAN_ADM:boolean;
  CAN_REFRESH: boolean;

implementation

uses DateInterval, FindDocNum, SetJouDate, SelectPrint;

{$R *.DFM}

procedure TJou_ST.FormShow(Sender: TObject);
begin
  inherited;
  CAN_NEW:=Check_Dostup('$JOU.ST.NEW');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  G_KEY:=#0;
  DT1:=Date();
  DT2:=Date();

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


  Refresh_list;
end;

Procedure TJou_ST.refresh_Btn;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     BtnCopy.enabled:=CAN_NEW and EnEof;
     MnCopy.enabled:=CAN_NEW and EnEof;
     BtnDel.Enabled:=EnEof;
     MnDel.Enabled:=EnEof;
     BtnAdm.Enabled:=EnEof and CAN_ADM;
     MnAdm.Enabled:=EnEof and CAN_ADM;
end;

Procedure TJou_ST.refresh_list;
begin
     if not Can_Refresh then
     	exit;

     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrStList.close;
     QrStList.ParamByname('DT1').asdatetime:=DT1;
     QrStList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrStList.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     StListTransaction.Active:=False;
     QrStList.Open;
end;

procedure TJou_ST.QrStListAfterScroll(DataSet: TDataSet);
begin
  Refresh_Btn;
end;

procedure TJou_ST.QrStListAfterOpen(DataSet: TDataSet);
begin
  if QrStList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof;
  MnCopy.enabled:=EnEof;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnSubDoc.Enabled:=EnEof;
  MnSubDoc.Enabled:=EnEof;
  Refresh_Btn;
end;

procedure TJou_ST.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='ST_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='ST_NUM_FULL' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='ST_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ST_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TJou_ST.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_ST.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJou_ST.BtnIntervalClick(Sender: TObject);
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

procedure TJou_ST.BtnOpenClick(Sender: TObject);
var
   ID:integer;
   S:ansistring;
begin
  S:=Jou_ST.caption;
  Jou_ST.caption:=Jou_ST.caption+'. Открытие счёта...';
  Application.CreateForm(TDoc_ST,Doc_ST);
  ID:=QrStList.fieldbyname('ST_ID').asinteger;
  Doc_ST.tag:=ID;
  Doc_ST.showModal;
  Doc_ST.destroy;
  QrStList.Close;
  StListTransaction.Active:=False;
  QrStList.Open;
  QrStList.locate('ST_ID',ID,[]);
  Jou_ST.caption:=S;
end;

procedure TJou_ST.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJou_ST.BtnNewClick(Sender: TObject);
var
   S:ansistring;
begin
  S:=Jou_ST.caption;
  Jou_ST.caption:=Jou_ST.caption+'. Создание счёта...';
  Application.CreateForm(TDoc_ST,Doc_ST);
  Doc_ST.tag:=-1;
  Doc_ST.showModal;
  if Doc_ST.tag>0 then begin
    DT1:=Doc_ST.ST_DATE.date;
    DT2:=Doc_ST.ST_DATE.date;
    refresh_list;
    QrStList.locate('ST_ID',Doc_ST.tag,[]);
  end;
  Doc_ST.destroy;
  RxDbgrid1.setfocus;
  Jou_ST.caption:=S;

end;

procedure TJou_ST.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrStList.fieldByname('ST_ID').asinteger;
  if Messbox('Удалить счёт '+QrStList.fieldByname('ST_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       QrStList.DisableControls;
       QrStList.Close;
       StListTransaction.Active:=False;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_ST(:ST_ID,:US_ID)');
       DataModule1.IbSaveSQL.Parambyname('ST_ID').asinteger:=ID;
       DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
       try
          DataModule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBAck;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       StListTransaction.Active:=False;
       QrStList.Open;
       QrStList.locate('ST_ID',ID,[]);
       QrStList.EnableControls;
  end;

end;

procedure TJou_ST.BtnPrintClick(Sender: TObject);
begin
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_ST.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_ST.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Счет';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
    case Select_Print.tag of
        1: PRINT_ST(QrStList.fieldbyname('ST_ID').asinteger);
        2: begin
             PpStList.reset;
             StListTitle1.Caption:=date_sokr(DT1)+' по '+date_Sokr(DT2);
             StListTitle2.Caption:='Журнал счетов за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2);
             PpStList.Print;
           end;
    end
  end;
  Select_Print.Destroy;
end;

procedure TJou_ST.BtnSubDocClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrStList.fieldbyname('ST_ID').asinteger;
  SUBDOC(2,ID);
  Refresh_List;
  QrStList.Locate('ST_ID',ID,[]);
  RxDbgrid1.setfocus;
end;

procedure TJou_ST.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Счет № '+QrStList.fieldbyname('ST_NUM_FULL').asstring,'ST',QrStList.fieldbyname('ST_ID').asinteger);
end;

procedure TJou_ST.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=2; {Метка, что искать в счетах}
  FIND_DOCNUM.Edit1.tag:=0; {Не анализируется}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     FIND_DOCNUM.IbQuery1.close;
     FIND_DOCNUM.IbQuery1.SQL.clear;
     FIND_DOCNUM.IbQuery1.SQL.add('SELECT BG_STRIPTIME(ST_DATE) AS ST_DATE FROM ST WHERE ST_ID=:ST_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('ST_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('ST_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrStList.locate('ST_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_ST.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию счёта № '+QrStList.fieldbyname('ST_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_ST( :ST_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('ST_ID').asinteger:=QrSTList.fieldbyname('ST_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_ST_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QrSTList.locate('ST_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;
procedure TJou_ST.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TJou_ST.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
begin
  ADD_SQL(IbQuery1,'select ST_NUM from st where st_id=:st_id');
  IbQuery1.paramByname('ST_ID').asinteger:=QrStList.fieldbyname('ST_ID').asinteger;
  IbQuery1.Open;
  Application.createForm(TADMIN_ST,ADMIN_ST);
  ADMIN_ST.NUM.value:=IbQuery1.fieldbyname('ST_NUM').asinteger;
  ADMIN_ST.showModal;
  if ADMIN_ST.tag>0 then begin
     {Изменяем данные накладной}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('ST_NUM',int(ADMIN_ST.NUM.value));
     ID:=QrStList.fieldbyname('ST_ID').asinteger;
     IF IBSAVE_DOC('ST',ID)>0 then begin
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Refresh_List;
        QrStList.locate('ST_ID',ID,[]);
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_ST.destroy;
end;

procedure TJou_ST.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpStListUser.Caption:=USERFIO_SHORT;
     PpStListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_ST.PpSTLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
  PpSTLIST.PreviewForm.WindowState:=WsMaximized;

end;

procedure TJou_ST.FRMChange(Sender: TObject);
begin
  inherited;
	refresh_list;
end;

end.
