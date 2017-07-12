unit JouSpis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Db, IBCustomDataSet, IBQuery,B_Utils,B_DBUtils,DocSpis, IBDatabase, Menus,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppVar, ppCtrls,
  ppMemo, ppStrtch, ppRegion, ppPrnabl, ppClass, ppProd, ppReport,
  RxLookup, StdCtrls, RxMemDS;

type
  TJou_SPIS = class(TDefault_Journal)
    IBQuery1: TIBQuery;
    DsSpisList: TDataSource;
    SpisListTranSaction: TIBTransaction;
    QrSpisList: TIBQuery;
    QrSpisListSPIS_ID: TIntegerField;
    QrSpisListSPIS_PROW: TIBStringField;
    QrSpisListSPIS_NUM_FULL: TIBStringField;
    QrSpisListSPIS_DATE: TDateTimeField;
    QrSpisListSKL_FULL: TIBStringField;
    QrSpisListSPIS_SUMM: TFloatField;
    QrSpisListSPIS_PTG: TSmallintField;
    QrSpisListSPIS_COLOR: TIntegerField;
    QrSpisListUS_FULL: TIBStringField;
    QrSpisListSPISVID_NAM: TIBStringField;
    QrSpisListSPIS_OSNSHORT: TIBStringField;
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
    QrSpisListSPIS_NUM: TIntegerField;
    PipSpisList: TppDBPipeline;
    PpSPISLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
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
    PpSpisListUser: TppLabel;
    SpisListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpSpisListVers: TppLabel;
    ppLabel462: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppLabel1: TppLabel;
    SpisListTitle1: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    QrSpisListWOZW_MET: TIntegerField;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    SPIS_SPISVID: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrSpisListAfterScroll(DataSet: TDataSet);
    procedure QrSpisListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdmClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure PpSPISLISTPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure SetListOrder(const OrderColumn: String; needToChangeOrder:boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure SPIS_SPISVIDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ANALIZ,CAN_ADM, CAN_REFRESH:boolean;
  Jou_SPIS: TJou_SPIS;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  curOrderColumn : String; //текущий столбец сортировки
  curOrderDirection : String; //текущее направление сортировки

implementation

uses Data1, DateInterval, SetJouDate, FindDocNum, AdminSpis, SelectPrint,
  SelectNew, DocSpisWozw;

{$R *.DFM}

procedure TJou_SPIS.FormShow(Sender: TObject);
begin
  inherited;
  CAN_NEW:=Check_Dostup('$JOU.SPIS.NEW');
  CAN_ANALIZ:=Check_dostup('$JOU.SPIS.ANALIZ');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  Get_DEFAULT;
  DT1:=date();
  DT2:=date();

  CAN_REFRESH:=false;

  curOrderColumn:='SPIS_DATE';

  SPIS_SPISVID.EmptyValue:='0';
  SPIS_SPISVID.DisplayEmpty:='Любой';


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

Procedure TJou_Spis.refresh_Btn;
var
   EN:boolean;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     if QrSpisList.fieldbyname('SPIS_PROW').asstring='1' then EN:=false else EN:=true;
     BtnProw.Enabled:=EN and EnEof;
     MnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof;
     MnDel.Enabled:=EN and EnEof;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
     BtnAnaliz.Enabled:=(not En) and EnEof and check_dostup('$JOU.SPIS.ANALIZ');
     MnAnaliz.Enabled:=(not En) and EnEof and check_dostup('$JOU.SPIS.ANALIZ');
end;

Procedure TJou_SPIS.refresh_list;
begin
	if not Can_refresh
     then exit;

     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     SpisListTransaction.Active:=False;
     QrSpisList.close;
     QrSpisList.ParamByname('DT1').asdatetime:=DT1;
     QrSpisList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrSpisList.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QrSpisList.ParamByname('SPISVID_ID').asinteger:=strtoint(SPIS_SPISVID.value);

     QrSpisList.Open;
end;


procedure TJou_SPIS.QrSpisListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrSpisList.fieldbyname('US_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_SPIS.QrSpisListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrSpisList.fieldbyname('US_FULL').asstring;
  if QrSpisList.eof then EnEof:=false else EnEof:=true;
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

procedure TJou_SPIS.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;



     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger>=0 then begin
           if Column.index=1 then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger>=0 then begin
              if Column.index=1 then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger>=0 then begin
        if Column.index=1 then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SPIS_PROW').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
      end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
    end;

     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
        RxDbgrid1.Canvas.Font.color:=clRed else RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
                RxDbgrid1.Canvas.Brush.color:=clRed;
     end;
end;

procedure TJou_SPIS.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_SPIS.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJou_SPIS.BtnProwClick(Sender: TObject);
var
   ID:integer;
   CAN:boolean;
begin
  ID:=QrSpisList.fieldByname('SPIS_ID').asinteger;

  if QrSpisList.FieldByName('WOZW_MET').Asinteger=1 then
   can :=  PROV_SPIS_WOZW(ID,' '+QrSpisList.fieldbyname('SPIS_NUM_FULL').asstring+
  ' от '+date_sokr(QrSpisList.fieldbyname('SPIS_DATE').asdatetime)+' ')
  else
  can :=  PROV_SPIS(ID,' '+QrSpisList.fieldbyname('SPIS_NUM_FULL').asstring+
  ' от '+date_sokr(QrSpisList.fieldbyname('SPIS_DATE').asdatetime)+' ');




  if ( can )then
  begin
     QrSpisList.DisableControls;
     QrSpisList.close;
     SpisListTransaction.Active:=False;
     QrSpisList.Open;
     QrSpisList.Locate('SPIS_ID',ID,[]);
     QrSpisList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_SPIS.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
   CAN:boolean;
begin
  ID:=QrSpisList.fieldByname('SPIS_ID').asinteger;
  if QrSpisList.FieldByName('WOZW_MET').Asinteger=1 then
  can := UNPROV_SPIS_WOZW(ID,' '+QrSpisList.fieldbyname('SPIS_NUM_FULL').asstring+
  ' от '+date_sokr(QrSpisList.fieldbyname('SPIS_DATE').asdatetime)+' ')
  else
  can := UNPROV_SPIS_WOZW(ID,' '+QrSpisList.fieldbyname('SPIS_NUM_FULL').asstring+
  ' от '+date_sokr(QrSpisList.fieldbyname('SPIS_DATE').asdatetime)+' ');

  if can then begin
     QrSpisList.DisableControls;
     QrSpisList.close;
     SpisListTransaction.Active:=False;
     QrSpisList.Open;
     QrSpisList.Locate('SPIS_ID',ID,[]);
     QrSpisList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_SPIS.BtnIntervalClick(Sender: TObject);
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

procedure TJou_SPIS.BtnAnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_SPIS(QrSpisList.fieldbyname('SPIS_ID').asinteger);
end;

procedure TJou_SPIS.BtnNewClick(Sender: TObject);
begin
//  TIMER_REFRESH.Enabled:=False;
  Application.createForm(TSelect_NEW,Select_NEW);
  Select_NEW.Position:=PoDesigned;
  Select_NEW.top:=Jou_spis.top+BtnNew.top+4+BtnNew.Height;
  Select_NEW.left:=Jou_spis.left+BtnNew.left+4+BtnNew.Width;
  Select_NEW.Button1.caption:='Новый акт списания';
  Select_NEW.Button2.caption:='Новый возврат акта списания';
  Select_NEW.showModal;
  if Select_NEW.tag>0 then
  begin
     if (Select_NEW.tag=1) and CAN_NEW then
     begin
       if IS_EDIT_SPIS then Messbox('Вы уже просматриваете или редактируете акт списания!',MessSYstem,48) else
       begin
           Application.CreateForm(TDoc_SPIS,Doc_SPIS);
           Doc_SPIS.tag:=-1;
           Doc_SPIS.ToolBar1.Tag:=Jou_SPIS.tag;
           Doc_SPIS.showModal;
           if Doc_SPIS.tag>0 then
           begin
               DT1:=Doc_SPIS.SPIS_DATE.date;
               DT2:=Doc_SPIS.SPIS_DATE.date;
               refresh_list;
               QrSpisList.locate('SPIS_ID',Doc_SPIS.tag,[]);
           end;
           Doc_SPIS.destroy;
           RxDbgrid1.setfocus;

       end;
     end;

    if (Select_NEW.tag=2) and CAN_NEW then
     begin
       if IS_EDIT_SPIS then Messbox('Вы уже просматриваете или редактируете возврат акта списания!',MessSYstem,48) else
       begin
           Application.CreateForm(TDoc_SPIS_wozw,Doc_SPIS_wozw);
           Doc_SPIS_wozw.tag:=-1;
           Doc_SPIS_wozw.ToolBar1.Tag:=Jou_SPIS.tag;
           Doc_SPIS_wozw.showModal;
           if Doc_SPIS_wozw.tag>0 then
           begin
               DT1:=Doc_SPIS_wozw.SPIS_DATE.date;
               DT2:=Doc_SPIS_wozw.SPIS_DATE.date;
               refresh_list;
               QrSpisList.locate('SPIS_ID',Doc_SPIS_wozw.tag,[]);
           end;
           Doc_SPIS_wozw.destroy;
           RxDbgrid1.setfocus;

       end;
     end;

  end;
end;

procedure TJou_SPIS.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию акта списания № '+QrSpisList.fieldbyname('SPIS_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_SPIS( :SPIS_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('SPIS_ID').asinteger:=QrSpisList.fieldbyname('SPIS_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_SPIS_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QrSpisList.locate('SPIS_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TJou_SPIS.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrSpisList.fieldByname('SPIS_ID').asinteger;
  if Messbox('Удалить Акт списания '+QrSpisList.fieldByname('SPIS_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       QrSpisList.DisableControls;
       QrSpisList.Close;
       SpisListTransaction.Active:=False;
       SpisListTransaction.StartTransaction;
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_SPIS(:SPIS_ID,:US_ID)');
       DataModule1.IbSaveSQL.Parambyname('SPIS_ID').asinteger:=ID;
       DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
       try
          DataModule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBAck;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       SpisListTransaction.Active:=False;
       QrSPISList.Open;
       QrSPISList.locate('SPIS_ID',ID,[]);
       QrSpisList.EnableControls;
  end;
end;

procedure TJou_SPIS.BtnPrintClick(Sender: TObject);
begin
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_SPIS.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_SPIS.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Акт списания';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
    case Select_Print.tag of
        1: PRINT_SPIS(QrSpisList.fieldbyname('SPIS_ID').asinteger);
        2: begin
             PpSpisList.reset;
             SpisListTitle1.Caption:=date_sokr(DT1)+' по '+date_Sokr(DT2);
             SpisListTitle2.Caption:='Журнал актов списания за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2);
             PpSpisList.Print;
           end;
    end
  end;
  Select_Print.Destroy;
end;

procedure TJou_SPIS.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Акт спиания № '+QrSPisList.fieldbyname('SPIS_NUM_FULL').asstring,'SPIS',QrSpisList.fieldbyname('SPIS_ID').asinteger);
end;

procedure TJou_SPIS.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=4; {Метка, что искать в актах списания}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(SPIS_DATE) AS SPIS_DATE FROM SPIS WHERE SPIS_ID=:SPIS_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('SPIS_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('SPIS_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrSpisList.locate('SPIS_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_SPIS.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  if QrSpisList.FieldByName('WOZW_MET').Asinteger=1 then
  begin
  if IS_EDIT_SPIS then Messbox('Вы уже просматриваете или редактируете акт списания!',MessSYstem,48) else
   begin
    Application.CreateForm(TDoc_SPIS_wozw,Doc_SPIS_wozw);
    ID:=QrSpisList.fieldbyname('SPIS_ID').asinteger;
    Doc_SPIS_wozw.tag:=ID;
    Doc_SPIS_wozw.ToolBar1.Tag:=Jou_SPIS.tag;
    Doc_SPIS_wozw.showModal;
    Doc_SPIS_wozw.destroy;
    QrSpisList.Close;
    SpisListTransaction.Active:=False;
    QrSPISList.Open;
    QrSpisList.locate('SPIS_ID',ID,[]);
  end;
  end else
  begin
  if IS_EDIT_SPIS then Messbox('Вы уже просматриваете или редактируете акт списания!',MessSYstem,48) else
   begin
    Application.CreateForm(TDoc_SPIS,Doc_SPIS);
    ID:=QrSpisList.fieldbyname('SPIS_ID').asinteger;
    Doc_SPIS.tag:=ID;
    Doc_SPIS.ToolBar1.Tag:=Jou_SPIS.tag;
    Doc_SPIS.showModal;
    Doc_SPIS.destroy;
    QrSpisList.Close;
    SpisListTransaction.Active:=False;
    QrSPISList.Open;
    QrSpisList.locate('SPIS_ID',ID,[]);
  end;
  end;
end;

procedure TJou_SPIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QrSpisLIST.Close;
  SpisListTransaction.Active:=False;
end;

procedure TJou_SPIS.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
  Application.createForm(TADMIN_SPIS,ADMIN_SPIS);
  ADMIN_SPIS.NUM.value:=QrSpisList.fieldbyname('SPIS_NUM').asinteger;
  ADMIN_SPIS.showModal;
  if ADMIN_SPIS.tag>0 then begin
   {Изменяем данные накладной}
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     {Изменяем данные накладной}
     if ADMIN_SPIS.checkBox1.checked then begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('DOC','SPIS');
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','Акт проведен административно!');
        IBSAVE_ADD('DOP1',2);
        IBSAVE_ADD('DOP2',QrSpisList.fieldbyname('SPIS_ID').asinteger);
        if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
     end;
     IBSAVE_CLEAR;
     IBSAVE_ADD('SPIS_NUM',int(ADMIN_SPIS.NUM.value));
     if ADMIN_SPIS.checkBox1.checked then IBSAVE_ADD('SPIS_PROW','1');
     ID:=QrSpisList.fieldbyname('SPIS_ID').asinteger;
     if IBSAVE_DOC('SPIS',ID)<0 then r:=sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrSpisList.locate('SPIS_ID',ID,[]);
   except
     Datamodule1.IBTransaction2.rollback;
   End;
   Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_SPIS.destroy;
end;

procedure TJou_SPIS.BtnSubDocClick(Sender: TObject);
begin
  SUBDOC(4,QrSpisList.fieldbyname('SPIS_ID').asinteger);
end;

procedure TJou_SPIS.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

procedure TJou_SPIS.PpSPISLISTPreviewFormCreate(Sender: TObject);
begin
     PpSPISLIST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TJou_SPIS.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpSpisListUser.Caption:=USERFIO_SHORT;
     PpSpisListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_SPIS.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrSpisList.fieldbyname('SPIS_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;
end;

procedure TJou_SPIS.FRMChange(Sender: TObject);
begin
  inherited;
    Refresh_list;
end;

procedure TJou_SPIS.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  inherited;
if (Field <> nil) then begin
    SetListOrder(Field.FieldName, True);
    self.refresh_list;
//    ComboBox2.ItemIndex := -1;
  end;
end;

//устанавливает у запроса нужную сортировку
//(приписывает к нему последнюю строку и переоткрывает его)
procedure TJou_SPIS.SetListOrder(Const OrderColumn:String; needToChangeOrder:boolean);
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
 QrSpisList.SQL[QrSpisList.SQL.Count-1] := OrderLine;
// if needToOpen then QrListcard.Open;
end;

procedure TJou_SPIS.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  inherited;
if (Field <> nil) and QrSpisList.Active and
     (CompareText(Field.FieldName, curOrderColumn) = 0) then
     if curOrderDirection = 'DESC' then //если обратная сортировка, то стрелка вверх
      SortMarker := smDown
     else SortMarker := smUp;
end;

procedure TJou_SPIS.SPIS_SPISVIDChange(Sender: TObject);
begin
  inherited;
  Refresh_List;
end;

end.
