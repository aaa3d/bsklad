unit CardReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl, Db,
  RxMemDS, ActnList, IBCustomDataSet, IBQuery, IBDatabase;

type
  TCARD_REG = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    RxDBGrid1: TRxDBGrid;
    MemCard: TRxMemoryData;
    MemCardcfg_id: TIntegerField;
    MemCardcard_name: TStringField;
    MemCardcard_diap: TStringField;
    MemCardcard_usl: TStringField;
    MemCardkln_full: TStringField;
    MemCardcard_uch: TStringField;
    DsCard: TDataSource;
    ActionList1: TActionList;
    ActNewCard: TAction;
    ActOpenCard: TAction;
    ActDelCard: TAction;
    MemCardcard_activ: TStringField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    procedure ActNewCardExecute(Sender: TObject);
    procedure ActOpenCardExecute(Sender: TObject);
    procedure ActDelCardExecute(Sender: TObject);
    procedure Refresh_list;
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CARD_REG: TCARD_REG;

implementation

uses EditCardReg;

{$R *.DFM}

procedure TCARD_REG.ActNewCardExecute(Sender: TObject);
begin
   // Новые пластиковые карты
   Application.createForm(TEDIT_CARD_REG,EDIT_CARD_REG);
   EDIT_CARD_REG.tag:=-1;
   EDIT_CARD_REG.ShowModal;
   if EDIT_CARD_REG.tag>0 then begin
      Refresh_list;
      MemCard.Locate('cfg_id',EDIT_CARD_REG.tag,[]);
   end;
   EDIT_CARD_REG.destroy;

end;

procedure TCARD_REG.ActOpenCardExecute(Sender: TObject);
begin
   // Изменение пластиковых карт
   Application.createForm(TEDIT_CARD_REG,EDIT_CARD_REG);
   EDIT_CARD_REG.tag:=MemCard.FieldByname('cfg_id').asinteger;
   EDIT_CARD_REG.ShowModal;
   if EDIT_CARD_REG.tag>0 then begin
      Refresh_list;
      MemCard.Locate('cfg_id',EDIT_CARD_REG.tag,[]);
   end;
   EDIT_CARD_REG.destroy;
end;

procedure TCARD_REG.ActDelCardExecute(Sender: TObject);
begin
   // Удаление пластиковых карт
   if messbox('Настоятельно рекомендуется не удалять пластиковые карты, а отключать активность. Вы уверену, что надо удалить пластиковые карты "'+
   MemCard.fieldByname('CARD_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      if IBDELETE_DOC('CFG',MemCard.FieldByname('cfg_id').asinteger) then begin
         Datamodule1.IBTransaction2.commit;
         Datamodule1.IBTransaction2.Active:=False;
         Refresh_list;
         MemCard.first;
      end else begin
         Datamodule1.IBTransaction2.Rollback;
      end;
      Datamodule1.IBTransaction2.Active:=False;
   end;
end;

Procedure TCARD_REG.Refresh_list;
var
  s:string;
begin
   WorkTransaction.ACtive:=False;
   OPEN_SQL(QueryWork,'select * from cfg where CFG_NAME="CARD_REG" order by CFG_VALUE');
   MemCard.Disablecontrols;
   MemCard.EmptyTable;
   while not QueryWork.eof do begin
      MemCard.Append;
      MemCard.FieldByname('cfg_id').asinteger:=QueryWork.FieldByname('cfg_id').asinteger;
      MemCard.FieldByname('card_name').asstring:=QueryWork.FieldByname('cfg_big').asstring;
      if QueryWork.FieldByname('cfg_set2').asinteger=1 then MemCard.FieldByname('card_activ').asstring:='ДА'
                                                       else MemCard.FieldByname('card_activ').asstring:='НЕТ';
      s:=QueryWork.FieldByname('cfg_value').asstring;
      MemCard.FieldByname('card_diap').asstring:='с '+argc(s,3)+' по '+argc(s,4);
      if argc(s,1)='1' then begin
         ADD_SQL(QueryWork2,'select cardskid_percent from cardskid where cardskid_id=:id');
         QueryWork2.ParamByname('ID').asinteger:=strtoint(argc(s,6));
         QueryWork2.Open;
         MemCard.FieldByname('card_usl').asstring:='фиксированно '+floattostrf(QueryWork2.fieldByname('cardskid_percent').asfloat,fffixed,19,2)+'%';
      end else begin
         MemCard.FieldByname('card_usl').asstring:='накопительные скидки';
      end;
      // Определяем клтента
      add_sql(QueryWork2,'select kln_full from kln_data(:kln_id)');
      QueryWork2.ParamByname('kln_id').asinteger:=QueryWork.fieldByname('CFG_SET1').asinteger;
      QueryWork2.Open;
      MemCard.FieldByname('kln_full').asstring:=QueryWork2.fieldByname('kln_full').asstring;
      if argc(s,2)='1' then MemCard.FieldByname('card_uch').asstring:='по отдельности'
                       else MemCard.FieldByname('card_uch').asstring:='все разом';

      MemCard.Post;
      QueryWork.next;
   end;
   MemCard.EnableControls;
   QueryWork.close;
   WorkTransaction.ACtive:=False;
   if MemCard.RecordCount=0 then begin
     ActOpenCard.enabled:=False;
     ActDelCard.enabled:=False;
   end else begin
     ActOpenCard.enabled:=True;
     ActDelCard.enabled:=True;
   end;
end;

procedure TCARD_REG.FormShow(Sender: TObject);
begin
   refresh_list;
   MemCard.first;
end;

procedure TCARD_REG.RxDBGrid1DblClick(Sender: TObject);
begin
   if ActOpenCard.enabled then ActOpenCard.Execute;
end;

procedure TCARD_REG.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then begin
        key:=#0;
        if ActOpenCard.enabled then ActOpenCard.Execute;
    end;
end;

end.
