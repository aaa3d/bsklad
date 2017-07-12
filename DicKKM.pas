unit DicKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_DButils, Db,
  IBCustomDataSet, IBQuery, IBDatabase, ActnList,EditKKM, StdCtrls, KKMINFO;

type
  TDIC_KKM = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    DsList: TDataSource;
    QueryListCFG_ID: TIntegerField;
    QueryListCOMP_NAME: TIBStringField;
    QueryListMODEL: TIntegerField;
    QueryListMODEL_NAME: TIBStringField;
    QueryListCOM: TIntegerField;
    QueryListMODEL_NUM: TIBStringField;
    QueryListCOM_NAME: TStringField;
    ActionList1: TActionList;
    ActNew: TAction;
    ActOpen: TAction;
    ActDel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    QueryListSHOP_NAME: TIBStringField;
    QueryListKKM_NAME: TIBStringField;
    QueryListSHOP_ID: TIntegerField;
    QueryListFRM_ID: TIntegerField;
    QueryListFRM_NAME: TIBStringField;
    RichEdit1: TRichEdit;
    ToolButton4: TToolButton;
    ActHeader: TAction;
    procedure QueryListCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Refresh;
    procedure ActNewExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure QueryListAfterOpen(DataSet: TDataSet);
    procedure QueryListAfterScroll(DataSet: TDataSet);
    procedure ActHeaderExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_KKM: TDIC_KKM;

implementation

{$R *.DFM}

procedure TDIC_KKM.QueryListCalcFields(DataSet: TDataSet);
begin
   if  NOT ( QueryList.Fieldbyname('COM').asstring='') THEN
   	QueryList.Fieldbyname('COM_NAME').asstring:='COM'+QueryList.Fieldbyname('COM').asstring;
end;

procedure TDIC_KKM.FormShow(Sender: TObject);
begin
   refresh;
end;

procedure TDIC_KKM.Refresh;
begin
   ListTransaction.Active:=False;
   QueryList.close;
   QueryList.Open;

end;

procedure TDIC_KKM.ActNewExecute(Sender: TObject);
begin
   // Новый
   Application.createForm(TEDIT_KKM,EDIT_KKM);
   EDIT_KKM.tag:=-1;
   EDIT_KKM.ShowModal;
   if EDIT_KKM.tag>0 then begin
      refresh;
      QueryList.Locate('cfg_id',EDIT_KKM.tag,[]);
   end;
   EDIT_KKM.destroy;
end;

procedure TDIC_KKM.ActOpenExecute(Sender: TObject);
begin
   // Изменить
   Application.createForm(TEDIT_KKM,EDIT_KKM);
   EDIT_KKM.tag:=QueryList.fieldByname('cfg_id').asinteger;
   EDIT_KKM.ShowModal;
   if EDIT_KKM.tag>0 then begin
      refresh;
      QueryList.Locate('cfg_id',EDIT_KKM.tag,[]);
   end;
   EDIT_KKM.destroy;
end;

procedure TDIC_KKM.ActDelExecute(Sender: TObject);
begin
   // Удалить
   if Messbox('Удалить кассовый аппарат "'+QueryList.fieldByname('MODEL_NAME').asstring+'", подключенный к компьютеру "'+
   QueryList.fieldByname('COMP_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('CFG',QueryList.FieldByname('CFG_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Refresh;
   end;
end;

procedure TDIC_KKM.QueryListAfterOpen(DataSet: TDataSet);
begin
   ActOpen.enabled:=not QueryList.eof;
   ActDel.enabled:=not QueryList.eof;
end;

procedure TDIC_KKM.QueryListAfterScroll(DataSet: TDataSet);
begin
	if DataSet.FieldByName('MODEL').asinteger=4 then
    	ActHeader.Enabled:=true
        else ActHeader.Enabled:=false;



end;

procedure TDIC_KKM.ActHeaderExecute(Sender: TObject);
begin
     Application.createForm(TKKM_INFO,KKM_INFO);
     KKM_INFO.CFG_ID := QueryList.fieldbyname('CFG_ID').asinteger;
     KKM_INFO.showModal;
     KKM_INFO.destroy;
end;

end.
