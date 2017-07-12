unit JouKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ActnList,DocPO,AdminST, Menus, StdCtrls, RxMemDS, RxLookup, Mask,
  ToolEdit, CurrEdit;

type
  TJOU_KKM = class(TDefault_Journal)
    ListTranSaction: TIBTransaction;
    QrKKMList: TIBQuery;
    DsKKMList: TDataSource;
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
    ToolButton6: TToolButton;
    SHOP: TRxDBLookupCombo;
    Label1: TLabel;
    ToolButton7: TToolButton;
    ActSelect: TAction;
    ToolBar3: TToolBar;
    Label9: TLabel;
    cmbKassa: TComboBox;
    Label7: TLabel;
    cmbKassir: TComboBox;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label2: TLabel;
    FRM: TRxDBLookupCombo;
    QrKKMListKKM_ID: TIntegerField;
    QrKKMListKKM_DATE: TDateTimeField;
    QrKKMListSHOP_NAME: TIBStringField;
    QrKKMListSALDO1: TFloatField;
    QrKKMListSALDO2: TFloatField;
    QrKKMListPROBITO: TFloatField;
    QrKKMListINKASS: TFloatField;
    ToolButton9: TToolButton;
    QrKKMListRN_SUMM: TFloatField;
    QrKKMListTERMINAL_SUMM: TFloatField;
    QrKKMListTERMINAL_SUMM_1: TFloatField;
    QrKKMListTERMINAL_SUMM_2: TFloatField;
    QrKKMListPO_SUMM: TFloatField;
    QrKKMListPO_SUMM_1: TFloatField;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure refresh_list;
    procedure refresh_Btn;
    procedure QrKKMListAfterScroll(DataSet: TDataSet);
    procedure QrKKMListAfterOpen(DataSet: TDataSet);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActNewExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActIntervalExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure ActAdminExecute(Sender: TObject);
    procedure ActFindExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ActCopyExecute(Sender: TObject);
    procedure SHOPChange(Sender: TObject);
    procedure cmbKassaChange(Sender: TObject);
    procedure cmbKassirChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    arr_kassir: array [0..1000] of integer;
    arr_kassa: array [0..1000] of integer;
  public
    { Public declarations }
  end;

var
  JOU_KKM: TJOU_KKM;
  DT1,DT2:Tdatetime;
  EnEof:boolean;
  G_KEY:char;
  CanRefresh:boolean;

implementation

uses SetJouDate, DateInterval,DocKKm;

{$R *.DFM}


procedure TJOU_KKM.FormShow(Sender: TObject);
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

  shop.Enabled := Check_Dostup('$REPORT.TORG.PERS.SHOP');



  WorkTransaction.Active:=False;



  DT1:=Date();
  DT2:=Date();

  CanRefresh:=true;
  Refresh_list;
end;

Procedure TJOU_KKM.refresh_Btn;
var
   EN:boolean;
begin
//     MnNew.enabled:=CAN_NEW;
end;


Procedure TJOU_KKM.refresh_list;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;

     QrKKMList.close;
     QrKKMList.ParamByname('SHOP_ID').asinteger:=strtoint('0'+SHOP.value);
     QrKKMList.ParamByname('DT1').asdatetime:=DT1;
     QrKKMList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrKKMList.ParamByName('FRM_ID').asinteger:=strtoint('0'+FRM.value);

     if checkbox1.Checked then
       QrKKMList.ParamByName('SHOW_ALL').asinteger:=1
     else
       QrKKMList.ParamByName('SHOW_ALL').asinteger:=0;


     ListTransaction.Active:=False;
     QrKKMList.Open;


end;

procedure TJOU_KKM.QrKKMListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Refresh_Btn;
end;

procedure TJOU_KKM.QrKKMListAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if QrKKMList.eof then EnEof:=false else EnEof:=true;

//  ActAdmin.enabled:=EnEof;
//  ActCopy.enabled:=EnEof ;
  ActDel.enabled:=EnEof ;
//  ActPrint.enabled:=EnEof;
  ActHistory.enabled:=EnEof;
  ActNew.Enabled:=true;
  ActOpen.Enabled:=true;
  Refresh_Btn;
end;

procedure TJOU_KKM.ActOpenExecute(Sender: TObject);
begin
  inherited;
  // Изменяем
    Application.createForm(TDOC_KKM,DOC_KKM);
    DOC_KKM.tag:=QrKKMList.fieldByname('KKM_ID').asinteger;
    DOC_KKM.ShowModal;
    if DOC_KKM.tag>0 then begin
       Refresh_list;
       QrKKMList.locate('KKM_ID',DOC_KKM.tag,[]);
    end;


end;

procedure TJOU_KKM.ActNewExecute(Sender: TObject);
begin
  inherited;
  // новый

       Application.createForm(TDOC_KKM,DOC_KKM);
       DOC_KKM.tag:=-1;
       DOC_KKM.ShowModal;
       if DOC_KKM.tag>0 then begin
          Refresh_list;
          QrKKMList.locate('KKM_ID',DOC_KKM.tag,[]);
       end;
       DOC_KKM.Destroy;

end;

procedure TJOU_KKM.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TJOU_KKM.ActIntervalExecute(Sender: TObject);
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

procedure TJOU_KKM.ActHistoryExecute(Sender: TObject);
begin
  inherited;
  SHOW_HISTORY_DOC('Кассовый отчет от '+QrKKMList.fieldbyname('KKM_DATE').asstring,'KKM',QrKKMList.fieldbyname('KKM_ID').asinteger);
end;

procedure TJOU_KKM.ActDelExecute(Sender: TObject);
var
   ID:integer;
begin
  ID:=QrKKMList.fieldByname('KKM_ID').asinteger;
  if Messbox('Удалить отчет?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'UPDATE KKM SET DOC_DEL=1 WHERE KKM_ID=:KKM_ID');
     DataModule1.IbSaveSQL.Parambyname('KKM_ID').asinteger:=ID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
     on e: Exception do
       begin
         messbox(e.message, messError, 0);
         Datamodule1.IBTransaction2.RollBAck;
       end;
     End;

     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrKKMList.locate('KKM_ID',ID,[]);
  end;
  RxDbGrid1.Setfocus;

end;

procedure TJOU_KKM.ActPrintExecute(Sender: TObject);
begin
  inherited;
  // печать
end;

procedure TJOU_KKM.ActAdminExecute(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
{
  Application.createForm(TADMIN_ST,ADMIN_ST);
  ADMIN_ST.caption:='Администрирование предоплаты.';
  ADMIN_ST.NUM.value:=QrPoList.fieldbyname('PO_NUM').asinteger;
  ADMIN_ST.showModal;
  if ADMIN_ST.tag>0 then begin
   {Изменяем данные накладной
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
  }
end;

procedure TJOU_KKM.ActFindExecute(Sender: TObject);
begin
  inherited;
{
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=21; {Метка, что искать в предоплатах
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
  }
end;

procedure TJOU_KKM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if ActOpen.Enabled then ActOpen.Execute;
  if ActSelect.Enabled then ActSelect.Execute;
end;

procedure TJOU_KKM.ActCopyExecute(Sender: TObject);
var
   NEWID:integer;
begin

  if Messbox('Создать копию отчета?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_kkm( :KKM_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('KKM_ID').asinteger:=QrKKMList.fieldByname('KKM_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_KKM_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Datamodule1.IBTransaction2.Active:=False;
              Refresh_List;
              QrKKMList.locate('KKM_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
//           Datamodule1.IBTransaction2.Active:=False;
  end;
  
end;

procedure TJOU_KKM.SHOPChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_KKM.cmbKassaChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_KKM.cmbKassirChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_KKM.FRMChange(Sender: TObject);
begin
  inherited;
  if CanRefresh then refresh_list;
end;

procedure TJOU_KKM.ToolButton9Click(Sender: TObject);
begin
  inherited;

  if Messbox('Сгруппировать отчеты за ' + datetostr(dt1)+'?',MessSubmit,4+48+256)=6 then
  begin



    try
      queryWork.Transaction.StartTransaction;
      QueryWork.SQL.Text:='SELECT RES FROM KKM_MERGE(:dt1, :dt2, :shop_id, :us_id)';

      queryWork.ParamByName('dt1').asDateTime:=DT1;
      queryWork.ParamByName('dt2').asDateTime:=DT1+1;
      queryWork.ParamByName('SHOP_ID').asInteger:=SHOPID;
      queryWork.ParamByName('US_ID').asInteger:=USERID;

      queryWork.Open;
      QueryWork.FetchAll;
      Querywork.Next;
      queryWork.Transaction.Commit;
      queryWork.Transaction.Active:=false;


      Messbox('Отчеты объединены, проверьте данные', 'сообщение', 0);



      Refresh_list;

    except
    on e: Exception do
      begin
        raise Exception.Create('ошибка объединения отчетов' + e.Message);
        queryWork.Transaction.Rollback;
      end
    end;
  end;




end;

procedure TJOU_KKM.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Refresh_list;
end;

end.
