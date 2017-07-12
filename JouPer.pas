unit JouPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Db, IBCustomDataSet, IBQuery,B_Utils,B_DBUtils, IBDatabase,DocPer, Menus,
  ppDB, ppCtrls, ppBands, ppVar, ppMemo, ppStrtch, ppRegion, ppPrnabl,
  ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, StdCtrls,
  RxLookup, RxMemDS;

type
  TJou_PER = class(TDefault_Journal)
    IBQuery1: TIBQuery;
    QrPerList: TIBQuery;
    DsPerList: TDataSource;
    PerListTranSaction: TIBTransaction;
    QrPerListPER_ID: TIntegerField;
    QrPerListPER_NUM_FULL: TIBStringField;
    QrPerListPER_DATE: TDateTimeField;
    QrPerListSKL_FROM: TIBStringField;
    QrPerListSKL_TO: TIBStringField;
    QrPerListPER_SUMM: TFloatField;
    QrPerListPER_OTG: TSmallintField;
    QrPerListPER_POL: TSmallintField;
    QrPerListPER_COLOR: TIntegerField;
    QrPerListUS_FULL: TIBStringField;
    QrPerListPER_PROW: TIBStringField;
    QrPerListPER_OSN: TIBStringField;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnCopy: TMenuItem;
    MnDel: TMenuItem;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N11: TMenuItem;
    MnSubDoc: TMenuItem;
    N13: TMenuItem;
    MnInterval: TMenuItem;
    N14: TMenuItem;
    MnAdm: TMenuItem;
    QrPerListPER_NUM: TIntegerField;
    PipPerList: TppDBPipeline;
    PpPERLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppLabel1: TppLabel;
    PerListTitle1: TppLabel;
    ppRegion79: TppRegion;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel441: TppLabel;
    ppLabel443: TppLabel;
    ppLabel482: TppLabel;
    ppLabel483: TppLabel;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel450: TppLabel;
    ppLabel461: TppLabel;
    ppLabel465: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBText148: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
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
    PpPerListUser: TppLabel;
    PerListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpPerListVers: TppLabel;
    ppLabel462: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppDBMemo1: TppDBMemo;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    QrPerListPER_WEIGHT: TFloatField;
    PipPerListppField14: TppField;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ToolBar2: TToolBar;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label3: TLabel;
    FRM: TRxDBLookupCombo;
    Label2: TLabel;
    SKL_FROM: TComboBox;
    Label1: TLabel;
    SKL_TO: TComboBox;
    QrPerListMH_FORM_TYPE: TIntegerField;
    procedure FormShow(Sender: TObject);
    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure QrPerListAfterScroll(DataSet: TDataSet);
    procedure QrPerListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
    procedure BtnAdmClick(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure PpPERLISTPreviewFormCreate(Sender: TObject);
    procedure SKL_FROMChange(Sender: TObject);
    procedure SKL_TOChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CAN_NEW,CAN_ANALIZ,CAN_ADM:boolean;
  Jou_PER: TJou_PER;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  SKL_ids: array[0..100] of integer;
  Can_Refresh: boolean;

implementation

uses Data1, DateInterval, SetJouDate, FindDocNum, AdminPer, SelectPrint;

{$R *.DFM}

procedure TJou_PER.FormShow(Sender: TObject);
begin
  inherited;
  CAN_NEW:=Check_Dostup('$JOU.PER.NEW');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  GET_DEFAULT;
  DT1:=Date();
  DT2:=Date();


  SKL_FROM.Items.Clear;
  SKL_TO.Items.Clear;
  SKL_FROM.Items.Add('Все');
  SKL_TO.Items.Add('Все');
  SKL_IDS[0]:=0;

  datamodule1.MainDicSkl.First;
  while not datamodule1.MainDicSkl.Eof do
  begin
    SKL_IDS[SKL_FROM.Items.Count]:=datamodule1.MainDicSkl.fieldbyname('SKL_ID').asInteger;
  	SKL_FROM.Items.Add(datamodule1.MainDicSkl.fieldbyname('SKL_SHORT').asString);
    SKL_TO.Items.Add(datamodule1.MainDicSkl.fieldbyname('SKL_SHORT').asString);
  	datamodule1.MainDicSkl.Next;
  end;

  Can_Refresh:=false;
  SKL_FROM.ItemIndex:=0;
  SKL_TO.ItemIndex:=0;


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

  Can_Refresh:=true;

  Refresh_list;


end;

Procedure TJou_PER.refresh_Btn;
var
   EN:boolean;
begin
     if QrPerList.fieldbyname('PER_PROW').asstring='1' then EN:=false else EN:=true;
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     BtnCopy.enabled:=CAN_NEW and EnEof;
     MnCopy.enabled:=CAN_NEW and EnEof;
     BtnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnProw.Enabled:=EN and EnEof;
     MnDel.Enabled:=EN and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
end;

Procedure TJou_PER.refresh_list;
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
     QrPerList.close;
     QrPerList.ParamByname('DT1').asdatetime:=DT1;
     QrPerList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrPerList.ParamByname('SKL_FROM_ID').asInteger:=SKL_IDS[SKL_FROM.ItemIndex];
     QrPerList.ParamByname('SKL_TO_ID').asInteger:=SKL_IDS[SKL_TO.ItemIndex];
     QrPerList.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     PerListTransaction.Active:=False;
     QrPerList.Open;
end;


procedure TJou_PER.QrPerListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrPerList.fieldbyname('US_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_PER.QrPerListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Оформил: '+QrPerList.fieldbyname('US_FULL').asstring;
  if QrPerList.eof then EnEof:=false else EnEof:=true;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof;
  MnCopy.enabled:=EnEof;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnAdm.Enabled:=EnEof and CAN_ADM;
  MnAdm.Enabled:=EnEof and CAN_ADM;
  BtnSubDoc.Enabled:=EnEof;
  MnSubDoc.Enabled:=EnEof;
  Refresh_Btn;

end;

procedure TJou_PER.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>=0 then begin
           if Column.index=1 then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
     end;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>=0 then begin
              if Column.index=1 then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger>=0 then begin
        if Column.index=1 then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
      if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_PROW').Asstring='1'
      then begin
         DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         22,True);
      end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
         -1,True);
    end;
end;

procedure TJou_PER.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_PER.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJou_PER.BtnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrPerList.fieldByname('PER_ID').asinteger;
  if PROV_PER(ID,QrPerList.fieldbyname('PER_NUM_FULL').asstring+
  ' от '+date_sokr(QrPerList.fieldbyname('PER_DATE').asdatetime)+' ') then begin
     QrPerList.DisableControls;
     QrPerList.close;
     PerListTransaction.Active:=False;
     QrPerList.Open;
     QrPerList.Locate('PER_ID',ID,[]);
     QrPerList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PER.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrPerList.fieldByname('PER_ID').asinteger;
  if UNPROV_PER(ID,QrPerList.fieldbyname('PER_NUM_FULL').asstring+
  ' от '+date_sokr(QrPerList.fieldbyname('PER_DATE').asdatetime)+' ') then begin
     QrPerList.DisableControls;
     QrPerList.close;
     PerListTransaction.Active:=False;
     QrPerList.Open;
     QrPerList.Locate('PER_ID',ID,[]);
     QrPerList.EnableControls;
  end;
  RxDbgrid1.setfocus;
end;

procedure TJou_PER.BtnIntervalClick(Sender: TObject);
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

procedure TJou_PER.BtnPropertisClick(Sender: TObject);
begin
  SHOW_HISTORY_DOC('Накладная перемещение № '+QrPerList.fieldbyname('PER_NUM_FULL').asstring,'PER',QrPerList.fieldbyname('PER_ID').asinteger);
end;

procedure TJou_PER.BtnFindClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=5; {Метка, что искать в накладных перемещения}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(PER_DATE) AS PER_DATE FROM PER WHERE PER_ID=:PER_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('PER_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PER_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrPerList.locate('PER_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJou_PER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrPerList.Close;
     PerListTransaction.Active:=False;
end;

procedure TJou_PER.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  if IS_EDIT_PER then Messbox('Вы уже просматриваете или редактируете накладную перемещения!',MessSYstem,48) else begin
    Application.CreateForm(TDoc_PER,Doc_PER);
    ID:=QrPerList.fieldbyname('PER_ID').asinteger;
    Doc_PER.tag:=ID;
    Doc_PER.ToolBar1.Tag:=Jou_PER.tag;
    Doc_PER.showModal;
    Doc_PER.destroy;
    QrPerList.Close;
    PerListTransaction.Active:=False;
    QrPerList.Open;
    QrPerList.locate('PER_ID',ID,[]);
  end;
end;

procedure TJou_PER.BtnNewClick(Sender: TObject);
begin
  if IS_EDIT_PER then Messbox('Вы уже просматриваете или редактируете накладную перемещения!',MessSYstem,48) else begin
    Application.CreateForm(TDoc_PER,Doc_PER);
    Doc_PER.tag:=-1;
    Doc_PER.ToolBar1.Tag:=Jou_PER.tag;
    Doc_PER.showModal;
    if Doc_PER.tag>0 then begin
      DT1:=Doc_PER.PER_DATE.date;
      DT2:=Doc_PER.PER_DATE.date;
      refresh_list;
      QrPerList.locate('PER_ID',Doc_PER.tag,[]);
    end;
    Doc_PER.destroy;
    RxDbgrid1.setfocus;
  end;
end;

procedure TJou_PER.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

procedure TJou_PER.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию накладной перемещения № '+QrPerList.fieldbyname('PER_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_PER( :PER_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('PER_ID').asinteger:=QrPerList.fieldbyname('PER_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_PER_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QrPerList.locate('PER_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TJou_PER.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  {Проверяем, можно ли удалить}
  ID:=QrPerList.fieldByname('PER_ID').asinteger;
  if Messbox('Удалить Накладную перемещения '+QrPerList.fieldByname('PER_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_PER(:PER_ID,:US_ID)');
     DataModule1.IbSaveSQL.Parambyname('PER_ID').asinteger:=ID;
     DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
       Datamodule1.IBTransaction2.RollBAck;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrPerList.locate('PER_ID',ID,[]);
  end;
  RxDbGrid1.setfocus;
end;

procedure TJou_PER.BtnPrintClick(Sender: TObject);
begin
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_PER.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_PER.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать Накладную перемещения';
  Select_Print.Button2.caption:='Напечатать журнал в текущем отображении';
  Select_Print.Button3.caption:='Напечатать форму MX1/MX3';
  Select_Print.showModal;
  if Select_Print.tag>0 then begin
    case Select_Print.tag of
        1: PRINT_PER(QrPerList.fieldbyname('PER_ID').asinteger);
        2: begin
             PpPerList.reset;
             PerListTitle1.Caption:=date_sokr(DT1)+' по '+date_Sokr(DT2);
             PerListTitle2.Caption:='Журнал накладных перемещения за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2);
             PpPerList.Print;
           end;
        3:
          begin
            PRINT_MH1_MH3(3, QrPerList.fieldbyname('PER_ID').asinteger, QrPerList.fieldbyname('MH_FORM_TYPE').asinteger);
          end;
    end
  end;
  Select_Print.Destroy;
end;

procedure TJou_PER.BtnSubDocClick(Sender: TObject);
begin
  SUBDOC(5,QrPerList.fieldbyname('PER_ID').asinteger);
end;

procedure TJou_PER.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
  Application.createForm(TADMIN_PER,ADMIN_PER);
  ADMIN_PER.NUM.value:=QrPerList.fieldbyname('PER_NUM').asinteger;
  ADMIN_PER.showModal;
  if ADMIN_PER.tag>0 then begin
   {Изменяем данные накладной}
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     if ADMIN_PER.checkBox1.checked then begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('DOC','PER');
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','Накладная проведена административно!');
        IBSAVE_ADD('DOP1',2);
        IBSAVE_ADD('DOP2',QrPerList.fieldbyname('PER_ID').asinteger);
        if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
     end;
     IBSAVE_CLEAR;
     IBSAVE_ADD('PER_NUM',int(ADMIN_PER.NUM.value));
     if ADMIN_PER.checkBox1.checked then IBSAVE_ADD('PER_PROW','1');
     ID:=QrPerList.fieldbyname('PER_ID').asinteger;
     IF IBSAVE_DOC('PER',ID)<0 then r:=sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrPerList.locate('PER_ID',ID,[]);
   except
     Datamodule1.IBTransaction2.Rollback;
   End;
   Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_PER.destroy;
end;

procedure TJou_PER.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrPerList.fieldbyname('PER_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;

end;

procedure TJou_PER.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpPerListUser.Caption:=USERFIO_SHORT;
     PpPerListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_PER.PpPERLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
     PpPERLIST.PreviewForm.WindowState:=WsMaximized;

end;

procedure TJou_PER.SKL_FROMChange(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

procedure TJou_PER.SKL_TOChange(Sender: TObject);
begin
  inherited;
   Refresh_list;
end;

procedure TJou_PER.FRMChange(Sender: TObject);
begin
  inherited;
	refresh_list;
end;

end.
