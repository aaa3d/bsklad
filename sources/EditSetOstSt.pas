unit EditSetOstSt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_DButils, ToolWin, ComCtrls, ActnList, StdCtrls, Grids,
  DBGrids, RXDBCtrl, Db, RxMemDS, IBCustomDataSet, IBQuery, IBDatabase,
  ExtCtrls;

type
  TEdit_SET_OST_ST = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ActSave: TAction;
    ActApply: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    RxDBGrid1: TRxDBGrid;
    ToolButton3: TToolButton;
    Label1: TLabel;
    MemSKL: TRxMemoryData;
    MemSKLSKL_ID: TIntegerField;
    MemSKLSKL_FULL: TStringField;
    MemSKLMET: TStringField;
    DsSKL: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Panel1: TPanel;
    Label2: TLabel;
    NAME: TEdit;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NAMEChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_SET_OST_ST: TEdit_SET_OST_ST;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEdit_SET_OST_ST.ActSaveExecute(Sender: TObject);
begin
    ActApply.Execute;
    if SAVE then close;
end;

procedure TEdit_SET_OST_ST.ActApplyExecute(Sender: TObject);
var
  N:integer;
  ID:integer;
  r:double;
  s,s1:string;
begin
   Save:=False;
   s:='';
   s1:='';
   n:=-1;
   if MemSkl.recordcount>0 then n:=MemSkl.recno;
   MemSkl.Disablecontrols;
   MemSkl.first;
   while not MemSkl.eof do begin
      if MemSkl.fieldByname('MET').asstring<>'' then s:=s+' '+trim(MemSkl.fieldByname('skl_id').asstring);
      MemSkl.next;
   end;
   s:=s+' ';
   if N>0 then MemSkl.recno:=N;
   MemSkl.Enablecontrols;
   // пишем
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   Try
      IBSAVE_CLEAR;
      IBSAVE_ADD('cfg_set1',USERID);
      IBSAVE_ADD('cfg_name','SET_OST_ST');
      IBSAVE_ADD('cfg_value',NAME.text);
      IBSAVE_ADD('cfg_big',s);
      ID:=ibsave_doc('CFG',tag);
      if ID<0 then r:=sqrt(-1);
      tag:=ID;
      Datamodule1.IBTransaction2.Commit;
      SAVE:=true;
   except
      Datamodule1.IBTransaction2.rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEdit_SET_OST_ST.RxDBGrid1DblClick(Sender: TObject);
begin
   if MemSkl.recordcount>0 then begin
      SAVE:=False;
      MemSkl.edit;
      if MemSkl.fieldByname('MET').asstring='' then MemSkl.fieldByname('MET').asstring:='Да' else MemSkl.fieldByname('MET').asstring:='';
      MemSkl.Post;
   end;
end;

procedure TEdit_SET_OST_ST.FormShow(Sender: TObject);
var
   s1,s2:ansistring;
   a,n:integer;
begin
   MemSkl.Disablecontrols;
   WorkTransaction.Active:=False;
   OPEN_SQL(QueryWork,'select skl_id,skl_full from skl order by skl_full');
   MemSkl.EmptyTable;
   while not QueryWork.eof do begin
      MemSkl.append;
      MemSkl.fieldByname('skl_id').asinteger:=QueryWork.fieldByname('skl_id').asinteger;
      MemSkl.fieldByname('skl_full').asstring:=QueryWork.fieldByname('skl_full').asstring;
      MemSkl.fieldByname('met').asstring:='';
      QueryWork.next;
   end;
   if tag<=0 then begin
      NAME.text:='';
   end else begin
      ADD_SQL(QueryWork,'select * from cfg where cfg_id=:cfg_id');
      QueryWork.ParamByname('cfg_id').asinteger:=tag;
      QueryWork.Open;
      NAME.text:=QueryWork.fieldByname('cfg_value').asstring;
      s1:=QueryWork.fieldByname('cfg_big').asstring;
      for a:=1 to argv(s1) do begin
         try
            n:=strtoint(trim(argc(s1,a)));
         except
            n:=0;
         end;
         if n>0 then begin
             MemSkl.first;
             while not MemSkl.eof do begin
                if MemSkl.fieldByname('skl_id').asinteger=n then begin
                   MemSkl.edit;
                   MemSkl.fieldByname('met').asstring:='Да';
                   MemSkl.post;
                end;
                MemSkl.next;
             end;
         end;
      end;
   end;
   MemSkl.enablecontrols;
   MemSkl.first;
   SAVE:=true;
end;

procedure TEdit_SET_OST_ST.NAMEChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TEdit_SET_OST_ST.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then begin
       key:=#0;
       close;
    end;
end;

procedure TEdit_SET_OST_ST.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

end.
