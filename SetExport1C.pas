unit SetExport1C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Db, RxMemDS,Data1,b_utils,b_Dbutils,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TSET_EXPORT_1C = class(TForm)
    Button1: TButton;
    Button2: TButton;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    MemFrmPATH: TStringField;
    MemFrmCFG_ID: TIntegerField;
    DsFrm: TDataSource;
    RxDBGrid1: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DsFrmDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_EXPORT_1C: TSET_EXPORT_1C;
  CanInsert:boolean;

implementation

{$R *.DFM}

procedure TSET_EXPORT_1C.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TSET_EXPORT_1C.Button1Click(Sender: TObject);
var
 ID:integer;
 r:double;
begin
   if DsFrm.state in [dsEdit,DsInsert] then MemFRM.post;
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   MemFRM.First;
   try
   while not MemFRM.eof do begin
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','$1C_FRM_EXPORT_FILE');
      IBSAVE_ADD('CFG_SET1',MemFRM.fieldByname('FRM_ID').asinteger);
      IBSAVE_ADD('CFG_VALUE',trim(MemFRM.fieldByname('PATH').asstring));
      ID:=IBSAVE_DOC('CFG',MemFRM.fieldByname('CFG_ID').asinteger);
      if ID<0 then r:=sqrt(-1) else begin
         MemFRM.edit;
         MemFRM.fieldByname('CFG_ID').asinteger:=ID;
         MemFRM.Post;
      end;
      MemFRM.next;
   end;
   Datamodule1.IBTransaction2.Commit;
   Datamodule1.IBTransaction2.Active:=False;
   close;
   except
      Datamodule1.IBTransaction2.Rollback;
      Messbox('Ошибка записи конфигурации! Повторите настройку!',MessError,16);
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TSET_EXPORT_1C.DsFrmDataChange(Sender: TObject; Field: TField);
begin
     if (MemFRM.State in [dsInsert]) and ( not CanInsert) then MemFRM.Cancel;
end;

procedure TSET_EXPORT_1C.FormShow(Sender: TObject);
begin
   MemFrm.emptyTable;
   CanInsert:=True;
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select * from pn_dic_frm(:FRM_ID)');
   QueryWork.ParamByname('FRM_ID').asinteger:=DEFAULT_FIRMA;
   QueryWork.open;
   while not QueryWork.eof do begin
     MemFRM.append;
     MemFRM.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
     MemFRM.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_FULL').asstring;
     MemFRM.Post;
     QueryWork.next;
   end;
   MemFRM.first;
   while not MemFRM.eof do begin
      ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="$1C_FRM_EXPORT_FILE" and cfg_set1=:cfg_set1');
      QueryWork.ParamByname('CFG_SET1').asinteger:=MemFrm.fieldByname('FRM_ID').asinteger;
      QueryWork.Open;
      MemFRM.edit;
      if QueryWork.eof then begin
        MemFRM.fieldByname('CFG_ID').asinteger:=-1;
        MemFRM.fieldByname('PATH').asstring:='';
      end else begin
        MemFRM.fieldByname('CFG_ID').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
        MemFRM.fieldByname('PATH').asstring:=QueryWork.fieldByname('CFG_VALUE').asstring
      end;
      MemFrm.post;
      MemFrm.next;
   end;
   MemFRM.first;
   CanInsert:=False;
end;

end.
