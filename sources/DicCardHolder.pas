unit DicCardHolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,b_utils,b_DButils,Data1,
  ActnList, Db, IBCustomDataSet, IBQuery, IBDatabase,EditKlnworktype;

type
  TDIC_CARD_HOLDER = class(TForm)
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
    DicKLNWORKTYPE: TIBQuery;
    Dsklnworktype: TDataSource;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DicKLNWORKTYPEKLN_WORKTYPE_ID: TIntegerField;
    DicKLNWORKTYPEKLN_WORKTYPE_NAME: TIBStringField;
    DicKLNWORKTYPETM: TDateTimeField;
    procedure ActInsExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Refresh;
    procedure DicKLNWORKTYPEAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton5Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_CARD_HOLDER: TDIC_CARD_HOLDER;

implementation

{$R *.DFM}

procedure TDIC_CARD_HOLDER.ActInsExecute(Sender: TObject);
begin
   // ����� ��������
   Application.createForm(TEDIT_KLNWORKTYPE,EDIT_KLNWORKTYPE);
   EDIT_KLNWORKTYPE.tag:=-1;
   EDIT_KLNWORKTYPE.ShowModal;
   if EDIT_KLNWORKTYPE.tag>0 then begin
      Refresh;
      DicKLNWORKTYPE.locate('KLN_WORKTYPE_ID',EDIT_KLNWORKTYPE.tag,[]);
   end;
   EDIT_KLNWORKTYPE.destroy;

end;

procedure TDIC_CARD_HOLDER.ActOpenExecute(Sender: TObject);
begin
   // �������� ��������
   Application.createForm(TEDIT_KLNWORKTYPE,EDIT_KLNWORKTYPE);
   EDIT_KLNWORKTYPE.tag:=DicKLNWORKTYPE.fieldByname('KLN_WORKTYPE_ID').asinteger;
   EDIT_KLNWORKTYPE.ShowModal;
   if EDIT_KLNWORKTYPE.tag>0 then begin
      Refresh;
      DicKLNWORKTYPE.locate('KLN_WORKTYPE_ID',EDIT_KLNWORKTYPE.tag,[]);
   end;
   EDIT_KLNWORKTYPE.destroy;
end;

procedure TDIC_CARD_HOLDER.ActDelExecute(Sender: TObject);
begin
   // ������� ��������
   if Messbox('������� ��� ������������ '+DicKLNWORKTYPE.FieldByname('KLN_WORKTYPE_NAME').asstring+' ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('KLN_WORKTYPE',DicKLNWORKTYPE.FieldByname('KLN_WORKTYPE_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        refresh;
        RxDbGrid1.setfocus;
   end;
end;


procedure TDIC_CARD_HOLDER.Refresh;
begin
  DicTransaction.Active:=False;
  DicKLNWORKTYPE.close;
  DicKLNWORKTYPE.open;
end;

procedure TDIC_CARD_HOLDER.FormShow(Sender: TObject);
begin
   Refresh;

end;



procedure TDIC_CARD_HOLDER.DicKLNWORKTYPEAfterOpen(DataSet: TDataSet);
begin
   ActDel.enabled:=DicKLNWORKTYPE.FieldByName('KLN_WORKTYPE_ID').asinteger>0;
   ActOpen.enabled:=DicKLNWORKTYPE.FieldByName('KLN_WORKTYPE_ID').asinteger>0;
end;

procedure TDIC_CARD_HOLDER.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TDIC_CARD_HOLDER.ToolButton5Click(Sender: TObject);
begin
   my_lock;
end;

procedure TDIC_CARD_HOLDER.RxDBGrid1DblClick(Sender: TObject);
begin
    if ActOpen.enabled then ActOpen.Execute;
end;

end.
