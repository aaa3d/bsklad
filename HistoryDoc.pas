unit HistoryDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ComCtrls, ToolWin, IBDatabase, Db,
  IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl, RxMemDS, FR_DSet,
  FR_DBSet, FR_Class, ActnList;

type
  THISTORY_DOC = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemHistory: TRxMemoryData;
    DsHistory: TDataSource;
    MemHistorySHOP_NAME: TStringField;
    MemHistoryUS_FULL: TStringField;
    MemHistoryMESS: TStringField;
    HWorkTransaction: TIBTransaction;
    HQueryWork: TIBQuery;
    MemHistoryDT: TDateTimeField;
    ActionList1: TActionList;
    ActPrint: TAction;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ToolButton1: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HISTORY_DOC: THISTORY_DOC;

implementation

uses Mainform;

{$R *.DFM}

procedure THISTORY_DOC.FormShow(Sender: TObject);
begin
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
     MemHistory.EmptyTable;

  datamodule1.IBDatabase2.Open;     


     if (History_doc_name<>'TW') and (History_doc_name<>'KLN') then begin
       ADD_SQL(QueryWork,'select shop.shop_name,'+History_doc_name+'.tm, '+
       '(select kln_full from kln_data('+History_doc_name+'.us_id)) as us_full '+
       'from '+History_doc_name+',shop where '+History_doc_name+'.shop_id=shop.shop_id and '+History_doc_name
       +'.'+History_doc_name+'_ID=:ID');
       QueryWork.ParamByname('ID').asinteger:=History_doc_ID;
       QueryWork.Open;
       if not QueryWork.eof then begin
          MemHistory.Append;
          MemHistory.FieldByname('DT').asdatetime:=QueryWork.fieldByname('TM').asdatetime;
          MemHistory.FieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('shop_name').asstring;
          MemHistory.FieldByname('US_FULL').asstring:=QueryWork.fieldByname('US_FULL').asstring;
          MemHistory.FieldByname('MESS').asstring:='Последнее изменение документа';
          MemHistory.Post;
       end;
     end;
     // Запрашиваем саму историю
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select arcupdate.mess,arcupdate.tm, '+
     '(select kln_full from kln_data(arcupdate.us_id)) as us_full, '+
     '(select shop.shop_name from shop where shop_id=arcupdate.shop_id) as shop_name '+
     ' from arcupdate '+
     'where arcupdate.doc="'+History_doc_name+'" '+
     'and arcupdate.dop2=:ID order by arcupdate.tm desc, arcupdate_id desc');
     QueryWork.ParamByname('ID').asinteger:=History_doc_ID;
     QueryWork.Open;
     while not QueryWork.eof do begin
        MemHistory.append;
        MemHistory.FieldByname('DT').asdatetime:=QueryWork.fieldByname('TM').asdatetime;
        MemHistory.FieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('shop_name').asstring;
        MemHistory.FieldByname('US_FULL').asstring:=QueryWork.fieldByname('US_FULL').asstring;
        if QueryWork.FieldByname('MESS').asstring='$0' then MemHistory.FieldByname('MESS').asstring:='Документ создан'
        else if QueryWork.FieldByname('MESS').asstring='$1' then MemHistory.FieldByname('MESS').asstring:='Документ проведен'
        else if QueryWork.FieldByname('MESS').asstring='$2' then MemHistory.FieldByname('MESS').asstring:='Документ снят с проводки'
        else if QueryWork.FieldByname('MESS').asstring='$3' then MemHistory.FieldByname('MESS').asstring:='Шапка документа сохранена без изменения'
        else if QueryWork.FieldByname('MESS').asstring='$4' then MemHistory.FieldByname('MESS').asstring:='Документ пересохранен без изменения'
        else if QueryWork.FieldByname('MESS').asstring='$6' then MemHistory.FieldByname('MESS').asstring:='Документ открыт для коррекции'
        else MemHistory.FieldByname('MESS').asstring:=QueryWork.fieldByname('mess').asstring;
        MemHistory.Post;
        QueryWork.next;
     end;
     // Запрашиваем данные из базы "историй"
     HWorkTransaction.Active:=False;
     ADD_SQL(HQueryWork,'select arcupdate.mess,arcupdate.tm, '+
     'kln.kln_full as US_FULL ,(select shop.shop_name from shop where arcupdate.shop_id=shop.shop_id) as shop_name '+
     'from kln,arcupdate '+
     'where arcupdate.doc="'+History_doc_name+'" and arcupdate.us_id=kln.kln_id and arcupdate.dop2=:id '+
     'order by arcupdate.tm desc');
     HQueryWork.ParamByname('ID').asinteger:=History_doc_ID;
     HQueryWork.Open;
     while not HQueryWork.eof do begin
        MemHistory.append;
        MemHistory.FieldByname('DT').asdatetime:=HQueryWork.fieldByname('TM').asdatetime;
        MemHistory.FieldByname('SHOP_NAME').asstring:=HQueryWork.fieldByname('shop_name').asstring;
        MemHistory.FieldByname('US_FULL').asstring:=HQueryWork.fieldByname('US_FULL').asstring;
        if HQueryWork.FieldByname('MESS').asstring='$0' then MemHistory.FieldByname('MESS').asstring:='Документ создан'
        else if HQueryWork.FieldByname('MESS').asstring='$1' then MemHistory.FieldByname('MESS').asstring:='Документ проведен'
        else if HQueryWork.FieldByname('MESS').asstring='$2' then MemHistory.FieldByname('MESS').asstring:='Документ снят с проводки'
        else if HQueryWork.FieldByname('MESS').asstring='$3' then MemHistory.FieldByname('MESS').asstring:='Шапка документа сохранена без изменения'
        else if HQueryWork.FieldByname('MESS').asstring='$4' then MemHistory.FieldByname('MESS').asstring:='Документ пересохранен без изменения'
        else if HQueryWork.FieldByname('MESS').asstring='$6' then MemHistory.FieldByname('MESS').asstring:='Документ открыт для коррекции'
        else MemHistory.FieldByname('MESS').asstring:=HQueryWork.fieldByname('mess').asstring;
        MemHistory.Post;
        HQueryWork.next;
     end;

     MemHistory.First;
end;

procedure THISTORY_DOC.ActPrintExecute(Sender: TObject);
begin
   // Печать истории документов
   FrReport1.ShowReport;
end;

procedure THISTORY_DOC.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then ParValue:=HISTORY_DOC.caption+', состояние на '+datetostr(date())+' '+timetostr(time())+', Распечатал: '+userfio;
end;

procedure THISTORY_DOC.FormDestroy(Sender: TObject);
begin
  datamodule1.IBDatabase2.Close;
end;

end.
