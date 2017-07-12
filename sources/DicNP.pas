unit DicNP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,b_utils,b_DButils,Data1,
  ActnList, Db, IBCustomDataSet, IBQuery, IBDatabase,EditNP;

type
  TDIC_NP = class(TForm)
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
    DicNP: TIBQuery;
    DsNP: TDataSource;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DicNPNP_ID: TIntegerField;
    DicNPNP: TFloatField;
    DicNPNP_DATE: TDateTimeField;
    DicNPUS_FULL: TIBStringField;
    procedure ActInsExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Refresh;
    procedure DicNPAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton5Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_NP: TDIC_NP;

implementation

{$R *.DFM}

procedure TDIC_NP.ActInsExecute(Sender: TObject);
begin
   // Новое значение
   Application.createForm(TEDIT_NP,EDIT_NP);
   EDIT_NP.tag:=-1;
   EDIT_NP.Toolbar1.tag:=DIC_NP.tag; // Через Toolbar передаем код тпа расходных накладных
   EDIT_NP.ShowModal;
   if EDIT_NP.tag>0 then begin
      Refresh;
      DicNP.locate('NP_ID',EDIT_NP.tag,[]);
   end;
   EDIT_NP.destroy;

end;

procedure TDIC_NP.ActOpenExecute(Sender: TObject);
begin
   // Изменить значение
   Application.createForm(TEDIT_NP,EDIT_NP);
   EDIT_NP.tag:=DicNP.fieldByname('NP_ID').asinteger;
   EDIT_NP.Toolbar1.tag:=DIC_NP.tag; // Через Toolbar передаем код тпа расходных накладных
   EDIT_NP.ShowModal;
   if EDIT_NP.tag>0 then begin
      Refresh;
      DicNP.locate('NP_ID',EDIT_NP.tag,[]);
   end;
   EDIT_NP.destroy;
end;

procedure TDIC_NP.ActDelExecute(Sender: TObject);
begin
   // Удалить значение
   if Messbox('Удалить значение ставки НП '+floattostrf(DicNP.fieldByname('NP').asfloat,fffixed,19,2)+'% от '+
      date_sokr(DicNP.fieldByname('NP_DATE').asdatetime)+' ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('NP',DicNP.FieldByname('NP_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        refresh;
        RxDbGrid1.setfocus;
   end;
end;


procedure TDIC_NP.Refresh;
begin
  DicTransaction.Active:=False;
  DicNP.close;
  DicNP.paramByname('rntyp_id').asinteger:=DIC_NP.tag;
  DicNP.open;
end;

procedure TDIC_NP.FormShow(Sender: TObject);
begin
   Refresh;

end;



procedure TDIC_NP.DicNPAfterOpen(DataSet: TDataSet);
begin
   ActDel.enabled:=DicNP.FieldByName('NP_ID').asinteger>0;
   ActOpen.enabled:=DicNP.FieldByName('NP_ID').asinteger>0;
end;

procedure TDIC_NP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TDIC_NP.ToolButton5Click(Sender: TObject);
begin
   my_lock;
end;

procedure TDIC_NP.RxDBGrid1DblClick(Sender: TObject);
begin
    if ActOpen.enabled then ActOpen.Execute;
end;

end.

