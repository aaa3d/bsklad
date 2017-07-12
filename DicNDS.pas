unit DicNDS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,b_utils,b_DButils,Data1,
  ActnList, Db, IBCustomDataSet, IBQuery, IBDatabase,EditNDS;

type
  TDIC_NDS = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    ActIns: TAction;
    ActOpen: TAction;
    ActDel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DicTransaction: TIBTransaction;
    DicNDS: TIBQuery;
    DicNDSNDS_ID: TIntegerField;
    DicNDSNDS: TFloatField;
    DicNDSNDS_DATE: TDateTimeField;
    DicNDSUS_FULL: TIBStringField;
    DsNDS: TDataSource;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure ActInsExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Refresh;
    procedure DicNDSAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton5Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_NDS: TDIC_NDS;

implementation

{$R *.DFM}

procedure TDIC_NDS.ActInsExecute(Sender: TObject);
begin
   // Новое значение
   Application.createForm(TEDIT_NDS,EDIT_NDS);
   EDIT_NDS.tag:=-1;
   EDIT_NDS.ShowModal;
   if EDIT_NDS.tag>0 then begin
      Refresh;
      DicNDS.locate('NDS_ID',EDIT_NDS.tag,[]);
   end;
   EDIT_NDS.destroy;

end;

procedure TDIC_NDS.ActOpenExecute(Sender: TObject);
begin
   // Изменить значение
   Application.createForm(TEDIT_NDS,EDIT_NDS);
   EDIT_NDS.tag:=DicNDS.fieldByname('NDS_ID').asinteger;
   EDIT_NDS.ShowModal;
   if EDIT_NDS.tag>0 then begin
      Refresh;
      DicNDS.locate('NDS_ID',EDIT_NDS.tag,[]);
   end;
   EDIT_NDS.destroy;
end;

procedure TDIC_NDS.ActDelExecute(Sender: TObject);
begin
   // Удалить значение
   if Messbox('Удалить значение ставки НДС '+floattostrf(DicNDS.fieldByname('NDS').asfloat,fffixed,19,2)+'% от '+
      date_sokr(DicNDS.fieldByname('NDS_DATE').asdatetime)+' ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('NDS',DicNDS.FieldByname('NDS_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        refresh;
        RxDbGrid1.setfocus;
   end;
end;


procedure TDIC_NDS.Refresh;
begin
  DicTransaction.Active:=False;
  DicNDS.close;
  DicNDS.open;
end;

procedure TDIC_NDS.FormShow(Sender: TObject);
begin
   Refresh;

end;



procedure TDIC_NDS.DicNDSAfterOpen(DataSet: TDataSet);
begin
   ActDel.enabled:=DicNDS.FieldByName('NDS_ID').asinteger>0;
   ActOpen.enabled:=DicNDS.FieldByName('NDS_ID').asinteger>0;
end;

procedure TDIC_NDS.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TDIC_NDS.ToolButton5Click(Sender: TObject);
begin
   my_lock;
end;

procedure TDIC_NDS.RxDBGrid1DblClick(Sender: TObject);
begin
    if ActOpen.enabled then ActOpen.Execute;
end;

end.
