unit JouPO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ActnList,DocPO,AdminST, Menus, StdCtrls, RxMemDS, RxLookup, Mask,
  ToolEdit, CurrEdit, FR_DSet, FR_DBSet, FR_Class;

type
  TJOU_PO = class(TDefault_Journal)
    PoListTranSaction: TIBTransaction;
    QrPoList: TIBQuery;
    DsPoList: TDataSource;
    QrPoListPO_ID: TIntegerField;
    QrPoListPO_NUM_FULL: TIBStringField;
    QrPoListPO_DATE: TDateTimeField;
    QrPoListPO_SUMM: TFloatField;
    QrPoListPO_OST: TFloatField;
    QrPoListPO_COLOR: TIntegerField;
    QrPoListKLN_FULL: TIBStringField;
    QrPoListUS_FULL: TIBStringField;
    QrPoListPO_OSN: TIBStringField;
    QrPoListPO_NUM: TIntegerField;
    ActionList1: TActionList;
    ActOpen: TAction;
    ActNew: TAction;
    ActInterval: TAction;
    ActHistory: TAction;
    ActDel: TAction;
    ActPrint: TAction;
    ActAdmin: TAction;
    ActFind: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    I1: TMenuItem;
    N9: TMenuItem;
    ActCopy: TAction;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemShop: TRxMemoryData;
    MemShopSHOP_ID: TIntegerField;
    MemShopSHOP_NAME: TStringField;
    DsShop: TDataSource;
    ToolButton4: TToolButton;
    ToolBar2: TToolBar;
    Label6: TLabel;
    ToolButton6: TToolButton;
    SHOP: TRxDBLookupCombo;
    Label1: TLabel;
    ToolButton7: TToolButton;
    STAT: TComboBox;
    QrPoListWOZW_ID: TIntegerField;
    ActSelect: TAction;
    ToolButton9: TToolButton;
    ToolBar3: TToolBar;
    Label9: TLabel;
    cmbKassa: TComboBox;
    Label7: TLabel;
    cmbKassir: TComboBox;
    QrPoListKASSIR_FIO: TIBStringField;
    QrPoListKASSA_NAME: TIBStringField;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    PoSumm: TRxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    PoOst: TRxCalcEdit;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure FormShow(Sender: TObject);
    procedure refresh_list;
    procedure refresh_Btn;
    procedure QrPoListAfterScroll(DataSet: TDataSet);
    procedure QrPoListAfterOpen(DataSet: TDataSet);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActNewExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActIntervalExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure ActAdminExecute(Sender: TObject);
    procedure ActFindExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ActCopyExecute(Sender: TObject);
    procedure STATChange(Sender: TObject);
    procedure SHOPChange(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure cmbKassaChange(Sender: TObject);
    procedure cmbKassirChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
    arr_kassir: array [0..1000] of integer;
    arr_kassa: array [0..1000] of integer;
  public
    { Public declarations }
  end;

var
  JOU_PO: TJOU_PO;
  DT1,DT2:Tdatetime;
  EnEof:boolean;
  G_KEY:char;
  CanRefresh:boolean;

implementation

uses SetJouDate, DateInterval, FindDocNum, DocPoWozw, SelectNew;

{$R *.DFM}


procedure TJOU_PO.FormShow(Sender: TObject);
var
  close_date:tdatetime;

begin
  inherited;
  CanRefresh:=false;
  WorkTransaction.Active:=False;


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

  if FRM.Tag > 0 then
  begin
  	FRM.Value := inttostR(FRM.tag);
    FRM.Enabled:=false;
  end
  else FRM.value:='0';



  arr_kassir[0] := 0;
  cmbKassir.Items.Add('Все');
  arr_kassa[0] := 0;
  cmbKassa.Items.Add('Все');

  OPEN_SQL(QueryWork,'select kln_id, kln_kkm_password from kln '+
			'where bg_length(kln.kln_kkm_password) > 0 '+
			'order by kln_kkm_password');
  while not QueryWork.eof do begin
    arr_kassir[cmbKassir.Items.Count]:=QueryWork.FieldByName('KLN_ID').asinteger;
    cmbKassir.Items.Add(QueryWork.FieldByName('KLN_KKM_PASSWORD').asstring);
    QueryWork.next;
  end;


  OPEN_SQL(QueryWork,'select CFG_ID, KKM_NAME from LIST_KKM ORDER BY SHOP_NAME');
  while not QueryWork.eof do begin
    arr_kassa[cmbKassa.Items.Count]:=QueryWork.FieldByName('CFG_ID').asinteger;
    cmbKassa.Items.Add(QueryWork.FieldByName('KKM_NAME').asstring);
    QueryWork.next;
  end;




  cmbKassir.ItemIndex:=0;
  cmbKassa.ItemIndex:=0;



  ADD_SQL(QueryWork,' select cast((select period2.period_close from period period2 where '+
  'period2.usgroup_id=usgroup.usgroup_id and period2.period_change=(select max(period.period_change) from '+
  'period where period.usgroup_id=usgroup.usgroup_id)) as date) as dt '+
  'from kln,usgroup where kln.usgroup_id=usgroup.usgroup_id and (kln.kln_id=:kln_id) ');
  QueryWork.PAramByname('kln_id').asinteger:=userid;
  QueryWork.Open;
  if QueryWork.eof then close_date:=date()
  else close_date:=QueryWork.fieldByname('dt').asdatetime;
  Statusbar2.panels[1].text:='До '+date_sokr(close_date)+' редактирование документов запрещено!';
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
  SHOP.value:=IntToStr(SHOPID);

  shop.Enabled := Check_Dostup('$JOU.PO.VIEW_REMOTESHOP');

  STAT.itemindex:=0;
  DT1:=Date();
  DT2:=Date();
  if tag<0 then begin
     caption:=caption+'. Выбор';
     // ставим режим выбора не отошедших только в этом магазине за последний месяц
     DT1:=DT2-31;
     STAT.itemindex:=2;
     SHOP.value:=inttostr(SHOPID);
  end;
  CanRefresh:=true;
  Refresh_list;
end;

Procedure TJou_PO.refresh_Btn;
var
   EN:boolean;
begin
//     MnNew.enabled:=CAN_NEW;
end;


Procedure TJou_PO.refresh_list;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     QrPoList.close;
     QrPoList.ParamByname('SHOP_ID2').asinteger:=strtoint('0'+SHOP.value);
     QrPoList.ParamByname('STAT').asinteger:=stat.itemindex;
     QrPoList.ParamByname('DT1').asdatetime:=DT1;
     QrPoList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;

     QrPoList.ParamByname('KASSIR_ID').asinteger:=arr_kassir[cmbKassir.ItemIndex];
     QrPoList.ParamByname('KASSA_ID').asinteger:=arr_kassa[cmbKassa.ItemIndex];
     QrPoList.ParamByName('FRM_ID').asinteger:=strtoint('0'+FRM.value);
     PoListTransaction.Active:=False;
     QrPoList.Open;

     QrPoList.DisableControls;
     Posumm.Value:=0;
     PoOst.Value:=0;
     while not QrPoList.Eof do
     begin
       Posumm.value := Posumm.value + QrPoList.FieldByName('PO_SUMM').asfloat;
       PoOst.value := PoOst.value + QrPoList.FieldByName('PO_OST').asfloat;
       QrPoList.Next;
     end;

     QrPoList.First;


     QrPoList.EnableControls;

end;

procedure TJOU_PO.QrPoListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Statusbar1.Panels[0].text:='Оформил: '+QrPoList.fieldbyname('US_FULL').asstring;
  ActSelect.enabled:=(tag<0) and (QrPoList.fieldbyname('WOZW_ID').asinteger=0);
  Refresh_Btn;
end;

procedure TJOU_PO.QrPoListAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Statusbar1.Panels[0].text:='Оформил: '+QrPoList.fieldbyname('US_FULL').asstring;
  if QrPoList.eof then begin
     EnEof:=false;
     ActSelect.enabled:=false;
  end else begin
     ActSelect.enabled:=(tag<0) and (QrPoList.fieldbyname('WOZW_ID').asinteger=0);
     EnEof:=true;
  end;
  ActAdmin.enabled:=EnEof and not (tag<0);
  ActCopy.enabled:=EnEof and not (tag<0);
  ActDel.enabled:=EnEof and not (tag<0);
  ActPrint.enabled:=EnEof;
  ActHistory.enabled:=EnEof;
  ActNew.Enabled:=not (tag<0);
  ActOpen.Enabled:=not (tag<0);
  Refresh_Btn;
end;

procedure TJOU_PO.ActOpenExecute(Sender: TObject);
begin
  inherited;
  // Изменяем
  if QrPoList.fieldByname('WOZW_ID').asinteger=0 then begin
    Application.createForm(TDOC_PO,DOC_PO);
    DOC_PO.tag:=QrPoList.fieldByname('PO_ID').asinteger;
    DOC_PO.ShowModal;
    if DOC_PO.tag>0 then begin
       Refresh_list;
       QrPoList.locate('PO_ID',DOC_PO.tag,[]);
    end;
    DOC_PO.Destroy;
  end else begin
    Application.createForm(TDOC_PO_WOZW,DOC_PO_WOZW);
    DOC_PO_WOZW.tag:=QrPoList.fieldByname('PO_ID').asinteger;
    DOC_PO_WOZW.ShowModal;
    if DOC_PO_WOZW.tag>0 then begin
       Refresh_list;
       QrPoList.locate('PO_ID',DOC_PO_WOZW.tag,[]);
    end;
    DOC_PO_WOZW.Destroy;
  end;
end;

procedure TJOU_PO.ActNewExecute(Sender: TObject);
begin
  inherited;
  // новый
  Application.createForm(TSelect_NEW,Select_NEW);
  Select_NEW.Position:=PoDesigned;
  Select_NEW.top:=top+BtnNew.top+4+BtnNew.Height;
  Select_NEW.left:=left+BtnNew.left+4+BtnNew.Width;
  Select_NEW.Button1.caption:='Новая предоплата';
  Select_NEW.Button2.caption:='Новый возврат предоплаты';
  Select_NEW.showModal;
  if Select_NEW.tag>0 then begin
    if (Select_NEW.tag=1) THEN BEGIN
       Application.createForm(TDOC_PO,DOC_PO);
       DOC_PO.tag:=-1;
       DOC_PO.FRM.Tag := FRM.Tag;
       DOC_PO.ShowModal;
       if DOC_PO.tag>0 then begin
          Refresh_list;
          QrPoList.locate('PO_ID',DOC_PO.tag,[]);
       end;
       DOC_PO.Destroy;
    end;
    if (Select_NEW.tag=2) THEN BEGIN
       Application.createForm(TDOC_PO_WOZW,DOC_PO_WOZW);
       DOC_PO_WOZW.tag:=-1;
       DOC_PO_WOZW.ShowModal;
       if DOC_PO_WOZW.tag>0 then begin
          Refresh_list;
          QrPoList.locate('PO_ID',DOC_PO_WOZW.tag,[]);
       end;
       DOC_PO_WOZW.Destroy;
    end;
  end;
  Select_NEW.destroy;
end;

procedure TJOU_PO.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_SUMM').asfloat<0 then
        RxDbgrid1.Canvas.Font.color:=clRed else RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger>=0 then begin
           if ansiuppercase(Column.Field.FullName)='PO_NUM_FULL' then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger>=0 then begin
              if ansiuppercase(Column.Field.FullName)='PO_NUM_FULL' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger>=0 then begin
        if ansiuppercase(Column.Field.FullName)='PO_NUM_FULL' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     // выделяем цветом неотошедшие предоплаты
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_OST').asfloat<>0)
        and (ansiuppercase(Column.Field.FullName)='PO_OST') then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_OST').asfloat>0 then begin
             RxDbgrid1.Canvas.Brush.color:=$0095FFA5;
           RxDbgrid1.Canvas.Font.color:=clBlack;
        end else begin
           // выделяем переплатой только не сторно
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PO_SUMM').asfloat>0 then begin
             RxDbgrid1.Canvas.Brush.color:=clRed;
             RxDbgrid1.Canvas.Font.color:=clwhite;
           end;
        end;
     end;
     RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TJOU_PO.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  inherited;
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJOU_PO.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
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
     ActInterval.Execute;
  end;
  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     ActFind.Execute;
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

procedure TJOU_PO.ActIntervalExecute(Sender: TObject);
begin
  inherited;
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

procedure TJOU_PO.ActHistoryExecute(Sender: TObject);
begin
  inherited;
  SHOW_HISTORY_DOC('Предоплата № '+QrPoList.fieldbyname('PO_NUM_FULL').asstring,'PO',QrPoList.fieldbyname('PO_ID').asinteger);
end;

procedure TJOU_PO.ActDelExecute(Sender: TObject);
var
   ID:integer;
   close_date:tdatetime;
begin
   // проверяем, чтобы дата не была меньше закрытого периода
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,' select cast((select period2.period_close from period period2 where '+
   'period2.usgroup_id=usgroup.usgroup_id and period2.period_change=(select max(period.period_change) from '+
   'period where period.usgroup_id=usgroup.usgroup_id)) as date) as dt '+
   'from kln,usgroup where kln.usgroup_id=usgroup.usgroup_id and (kln.kln_id=:kln_id) ');
   QueryWork.PAramByname('kln_id').asinteger:=userid;
   QueryWork.Open;
   if QueryWork.eof then close_date:=date()
   else close_date:=QueryWork.fieldByname('dt').asdatetime;
  {Проверяем, можно ли удалить}
  ID:=QrPoList.fieldByname('PO_ID').asinteger;
  if QrPoList.fieldByname('PO_DATE').asdatetime<close_date then messbox('Дата документа меньше даты закрытия периода! Удаление невозможно!',MessSystem,48) else begin
    if Messbox('Удалить предоплату '+QrPoList.fieldByname('PO_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
    begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_PO(:PO_ID,:US_ID)');
       DataModule1.IbSaveSQL.Parambyname('PO_ID').asinteger:=ID;
       DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
       try
          DataModule1.IbSaveSQL.ExecSQL;
          Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBAck;
       End;
       Datamodule1.IBTransaction2.Active:=False;
       Refresh_List;
       QrPoList.locate('PO_ID',ID,[]);
    end;
    RxDbGrid1.setfocus;
  end;
end;

procedure TJOU_PO.ActPrintExecute(Sender: TObject);
begin
  inherited;
  {Печатаем}

  FrReport1.ShowReport;
{
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_PER.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_PER.left+BtnPrint.left+4+BtnPrint.Width;
  Select_Print.Button1.caption:='Напечатать журнал в текущем отображении';
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
  }
end;

procedure TJOU_PO.ActAdminExecute(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
  Application.createForm(TADMIN_ST,ADMIN_ST);
  ADMIN_ST.caption:='Администрирование предоплаты.';
  ADMIN_ST.NUM.value:=QrPoList.fieldbyname('PO_NUM').asinteger;
  ADMIN_ST.showModal;
  if ADMIN_ST.tag>0 then begin
   {Изменяем данные накладной}
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     IBSAVE_CLEAR;
     IBSAVE_ADD('PO_NUM',int(ADMIN_ST.NUM.value));
     ID:=QrPoList.fieldbyname('PO_ID').asinteger;
     IF IBSAVE_DOC('PO',ID)<0 then r:=sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrPoList.locate('PO_ID',ID,[]);
   except
     Datamodule1.IBTransaction2.Rollback;
   End;
   Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_ST.destroy;
end;

procedure TJOU_PO.ActFindExecute(Sender: TObject);
begin
  inherited;
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=21; {Метка, что искать в предоплатах}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(PO_DATE) AS PO_DATE FROM PO WHERE PO_ID=:PO_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('PO_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('PO_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrPoList.locate('PO_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
end;

procedure TJOU_PO.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if ActOpen.Enabled then ActOpen.Execute;
  if ActSelect.Enabled then ActSelect.Execute;
end;

procedure TJOU_PO.ActCopyExecute(Sender: TObject);
var
   NEWID:integer;
begin
  if Messbox('Создать копию предоплаты № '+QrPoList.fieldbyname('PO_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_PO( :PO_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('PO_ID').asinteger:=QrPoList.fieldbyname('PO_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_PO_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Datamodule1.IBTransaction2.Active:=False;
              Refresh_List;
              QrPoList.locate('PO_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TJOU_PO.STATChange(Sender: TObject);
begin
  inherited;
  if STAT.itemindex<0 then STAT.itemindex:=0;
  if CanRefresh then refresh_list;
end;

procedure TJOU_PO.SHOPChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_PO.ActSelectExecute(Sender: TObject);
begin
  inherited;
  tag:=QrPoList.fieldByname('PO_ID').asinteger;
  close;
end;

procedure TJOU_PO.cmbKassaChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_PO.cmbKassirChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_PO.FRMChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

end.
