unit DicRvid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  ActnList, Db, RxMemDS, IBCustomDataSet, IBQuery, IBDatabase, Menus;

type
  TDIC_RVID = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    ActNew: TAction;
    ActOpen: TAction;
    ActDel: TAction;
    DsDost: TDataSource;
    DicTransaction: TIBTransaction;
    QueryDic: TIBQuery;
    QueryDicRVID_ID: TIntegerField;
    QueryDicRVID_NAME: TIBStringField;
    QueryDicRVID_KLN: TIBStringField;
    DsDic: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DostTransaction: TIBTransaction;
    QueryDost: TIBQuery;
    QueryDostSHOP_ID: TIntegerField;
    QueryDostSHOP_NAME: TIBStringField;
    QueryDostCFG_ID: TIntegerField;
    QueryDostCFG_VALUE: TIntegerField;
    QueryDostDOSTUP_NAME: TIBStringField;
    PopupMenu1: TPopupMenu;
    MnDostOn: TMenuItem;
    MnDostOff: TMenuItem;
    Timer1: TTimer;
    procedure ActNewExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure QueryDicAfterOpen(DataSet: TDataSet);
    procedure QueryDicAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure MnDostOnClick(Sender: TObject);
    procedure MnDostOffClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_RVID: TDIC_RVID;

implementation

uses EditRvid;

{$R *.DFM}

procedure TDIC_RVID.ActNewExecute(Sender: TObject);
begin
   // Новое значение справочника
   Application.createForm(TEDIT_RVID,EDIT_RVID);
   EDIT_RVID.tag:=-1;
   EDIT_RVID.showModal;
   if EDIT_RVID.tag>0 then begin
       DicTransaction.Active:=False;
       QueryDic.close;
       QueryDic.Open;
       QueryDic.locate('rvid_id',EDIT_RVID.tag,[]);
       RxDbGrid1.Setfocus;
   end;
   EDIT_RVID.destroy;

end;

procedure TDIC_RVID.ActOpenExecute(Sender: TObject);
begin
   // Изменяем значение справочника
   Application.createForm(TEDIT_RVID,EDIT_RVID);
   EDIT_RVID.tag:=QueryDic.fieldByname('RVID_ID').asinteger;
   EDIT_RVID.showModal;
   if EDIT_RVID.tag>0 then begin
       DicTransaction.Active:=False;
       QueryDic.close;
       QueryDic.Open;
       QueryDic.locate('rvid_id',EDIT_RVID.tag,[]);
       RxDbGrid1.Setfocus;
   end;
   EDIT_RVID.destroy;
end;

procedure TDIC_RVID.ActDelExecute(Sender: TObject);
begin
    // Удаляем значение справочника
    if Messbox('Удалить значение "'+QueryDic.fieldByname('RVID_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
          ibDelete_doc('rvid',QueryDic.fieldByname('RVID_ID').asinteger);
       except
       end;
       Datamodule1.IBTransaction2.Commit;
       Datamodule1.IBTransaction2.Active:=False;
       DicTransaction.Active:=False;
       QueryDic.close;
       QueryDic.Open;
       RxDbGrid1.Setfocus;
    end;
end;

procedure TDIC_RVID.QueryDicAfterOpen(DataSet: TDataSet);
begin
   ActDel.enabled:=not QueryDic.eof;
   ActOpen.enabled:=not QueryDic.eof;
   QueryDost.close;
   Timer1.enabled:=False;
   Timer1.enabled:=True;
end;

procedure TDIC_RVID.QueryDicAfterScroll(DataSet: TDataSet);
begin
   QueryDost.close;
   Timer1.enabled:=False;
   Timer1.enabled:=True;
end;

procedure TDIC_RVID.Timer1Timer(Sender: TObject);
begin
   timer1.enabled:=false;
   QueryDost.Disablecontrols;
   DostTransaction.Active:=False;
   QueryDost.close;
   if not QueryDic.eof then begin
     QueryDost.ParamByName('RVID_ID').asinteger:=QueryDic.FieldByName('RVID_ID').asinteger;
     QueryDost.Open;
   end;
   MnDostOn.enabled:=not QueryDic.eof;
   MnDostOff.enabled:=not QueryDic.eof;
   QueryDost.Enablecontrols;
end;

procedure TDIC_RVID.MnDostOnClick(Sender: TObject);
var
   oldid:integer;
   ID:integer;
   r:double;
begin
   if QueryDost.fieldByname('cfg_value').asinteger=0 then begin
      oldid:=QueryDost.fieldByname('SHOP_ID').asinteger;
      // Разрешаем доступ
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      try
        ibsave_clear;
        ibsave_add('cfg_name','RVID_DOSTUP');
        ibsave_add('cfg_set2',QueryDic.fieldByname('RVID_ID').asinteger);
        ibsave_add('cfg_set1',QueryDost.fieldByname('SHOP_ID').asinteger);
        ibsave_add('cfg_value',1);
        ID:=ibsave_doc('CFG',-1);
        if ID<0 then r:=sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Timer1.OnTimer(Sender);
        QueryDost.Locate('SHOP_ID',oldid,[]);
      except
        Datamodule1.IBTransaction2.Rollback
      end;
      Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TDIC_RVID.MnDostOffClick(Sender: TObject);
var
  oldid:integer;
begin
   if QueryDost.fieldByname('cfg_value').asinteger=1 then begin
      oldid:=QueryDost.fieldByname('SHOP_ID').asinteger;
      // Разрешаем доступ
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      try
         ADD_SQL(Datamodule1.IbSaveSQL,'delete from cfg where cfg_name="RVID_DOSTUP" and cfg_set1=:shop_id and cfg_set2=:rvid_id');
         Datamodule1.IbSaveSQL.ParamByname('rvid_id').asinteger:=QueryDic.fieldByname('rvid_id').asinteger;
         Datamodule1.IbSaveSQL.ParamByname('shop_id').asinteger:=QueryDost.fieldByname('shop_id').asinteger;
         Datamodule1.IbSaveSQL.ExecSQL;
      except
      end;
      Datamodule1.IBTransaction2.Commit;
      Datamodule1.IBTransaction2.Active:=False;
      Timer1.OnTimer(Sender);
      QueryDost.Locate('SHOP_ID',oldid,[]);
   end;
end;

procedure TDIC_RVID.FormShow(Sender: TObject);
begin
       DicTransaction.Active:=False;
       QueryDic.close;
       QueryDic.Open;
       RxDbGrid1.Setfocus;
end;

procedure TDIC_RVID.RxDBGrid1DblClick(Sender: TObject);
begin
  if ActOpen.enabled then ActOpen.Execute; 
end;

end.
