unit DicUsl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,VclUtils,
  Db, IBCustomDataSet, IBQuery, IBDatabase, ActnList,EditUsl;

type
  TDIC_USL = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    DicTransaction: TIBTransaction;
    DicUsl: TIBQuery;
    DsUsl: TDataSource;
    DicUslUSL_ID: TIntegerField;
    DicUslUSL_NAME: TIBStringField;
    DicUslDEB: TIBStringField;
    DicUslCRED: TIBStringField;
    ActionList1: TActionList;
    BtnNew: TAction;
    BtnOpen: TAction;
    BtnDel: TAction;
    BtnSelect: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure BtnNewExecute(Sender: TObject);
    procedure BtnSelectExecute(Sender: TObject);
    procedure BtnDelExecute(Sender: TObject);
    procedure BtnOpenExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DicUslAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_USL: TDIC_USL;

implementation

{$R *.DFM}

procedure TDIC_USL.BtnNewExecute(Sender: TObject);
begin
    // Новая Услуга
    Application.createForm(TEDIT_USL,EDIT_USL);
    EDIT_USL.tag:=-1;
    EDIT_USL.showModal;
    if Edit_Usl.tag>0 then begin
        DicUsl.Disablecontrols;
        DicTransaction.Active:=False;
        DicUsl.close;
        DicUsl.Open;
        DicUsl.locate('USL_ID',Edit_usl.tag,[]);
        DicUsl.Enablecontrols;
    end;
    EDIT_USL.Destroy;
end;

procedure TDIC_USL.BtnSelectExecute(Sender: TObject);
begin
   // Выбрать
   tag:=DicUsl.fieldByname('USL_ID').asinteger;
   close;
end;

procedure TDIC_USL.BtnDelExecute(Sender: TObject);
begin
   // Удалить
   if Messbox('Удалить услугу '+DicUsl.fieldByname('USL_NAME').asstring+' ?',MessSubmitDelete,4+48+256)=6 THEN BEGIN
       DataModule1.IBTransaction2.Active:=False;
       DataModule1.IBTransaction2.StartTransaction;
       if IBDELETE_DOC('USL',DicUsl.FieldByname('USL_ID').asinteger)
       then DataModule1.IBTransaction2.Commit else DataModule1.IBTransaction2.RollBack;
       DataModule1.IBTransaction2.Active:=False;
       tag:=-1;
   END;
end;

procedure TDIC_USL.BtnOpenExecute(Sender: TObject);
begin
   // Править
    // Новая Услуга
    Application.createForm(TEDIT_USL,EDIT_USL);
    EDIT_USL.tag:=DicUsl.fieldByname('USL_ID').asinteger;
    EDIT_USL.showModal;
    if Edit_Usl.tag>0 then begin
        DicUsl.Disablecontrols;
        DicTransaction.Active:=False;
        DicUsl.close;
        DicUsl.Open;
        DicUsl.locate('USL_ID',Edit_usl.tag,[]);
        DicUsl.Enablecontrols;
    end;
    EDIT_USL.Destroy;
end;

procedure TDIC_USL.FormShow(Sender: TObject);
begin
  if DicUslSet=2 then begin
        BtnSelect.visible:=True;
        caption:=Caption+'. Выбор';
  end else BtnSelect.visible:=False;
  DicUsl.Disablecontrols;
  DicTransaction.Active:=False;
  DicUsl.close;
  DicUsl.Open;
  if tag>0 then DicUsl.locate('USL_ID',tag,[]);
  DicUsl.Enablecontrols;

end;

procedure TDIC_USL.DicUslAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
  EN:=not DicUsl.eof;
  BtnOpen.enabled:=EN;
  BtnDel.enabled:=EN;
  if DicUslSet=2 then BtnSelect.enabled:=En else BtnSelect.enabled:=False;
end;

procedure TDIC_USL.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) and (not DicUsl.eof) then begin
     if (DicUslSet=2) and BtnSelect.enabled then BtnSelect.Execute;
     if (DicUslSet<>2) and BtnOpen.enabled then BtnOpen.Execute;
   end;
end;

end.

