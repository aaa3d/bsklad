unit EditRvid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, Db, RxMemDS, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_RVID = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    RVID_NAME: TEdit;
    RVID_SUBKLN: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    BtnAdd: TButton;
    BtnDel: TButton;
    BtnApply: TToolButton;
    BtnSave: TToolButton;
    MemKLN: TRxMemoryData;
    MemKLNkln_id: TIntegerField;
    MemKLNkln_full: TStringField;
    MemKLNcfg_id: TIntegerField;
    DsKln: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure MemKLNAfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RVID_SUBKLNClick(Sender: TObject);
    procedure RVID_NAMEChange(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_RVID: TEDIT_RVID;
  SAVE:boolean;
  cntDel:integer;
  ARRDEL:array[1..1000] of integer;

const
  cap='Справочник видов реализации. ';
  Cap_edit='Редактирование';
  Cap_insert='Новые значение';

implementation

uses DicKlient;

{$R *.DFM}

procedure TEDIT_RVID.MemKLNAfterDelete(DataSet: TDataSet);
begin
   if MemKLN.recordcount=0 then BtnDel.enabled:=False and RVID_SUBKLN.checked else BtnDel.enabled:=true and RVID_SUBKLN.checked;
end;

procedure TEDIT_RVID.FormShow(Sender: TObject);
begin
   MemKLN.emptyTable;
   if tag<=0 then begin
       RVID_NAME.text:='';
       RVID_SUBKLN.checked:=False;
       caption:=cap+cap_insert;

   end else begin
       caption:=cap+cap_edit;
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select * from rvid where rvid_id=:rvid_id');
      QueryWork.ParamByname('rvid_id').asinteger:=tag;
      QueryWork.Open;
      RVID_NAME.text:=QueryWork.fieldByname('RVID_NAME').asstring;
      if QueryWork.fieldByname('RVID_SUBKLN').asinteger=1 then RVID_SUBKLN.checked:=true
                                                          else RVID_SUBKLN.checked:=false;
      // запрашиваем справочники
      ADD_SQL(QueryWork,'select cfg_id,cfg.cfg_set1,(select kln_full from kln_data(cfg.cfg_set1)) as kln_full '+
      ' from cfg where cfg_name="RVID_KLN_LIST" and cfg_set2=:rvid_id order by 3');
      QueryWork.ParamByname('rvid_id').asinteger:=tag;
      QueryWork.Open;
      while not QueryWork.eof do begin
         MemKLN.append;
         MemKLN.fieldByname('cfg_id').asinteger:=QueryWork.fieldByname('cfg_id').asinteger;
         MemKLN.fieldByname('kln_id').asinteger:=QueryWork.fieldByname('cfg_set1').asinteger;
         MemKLN.fieldByname('kln_full').asstring:=QueryWork.fieldByname('kln_full').asstring;
         MemKLN.Post;
         QueryWork.next;
      end;
      MemKLN.first;
   end;
   cntDel:=0;
   RVID_SUBKLN.Onclick(Sender);
   SAVE:=true;
end;

procedure TEDIT_RVID.RVID_SUBKLNClick(Sender: TObject);
begin
   if MemKLN.recordcount=0 then BtnDel.enabled:=False and RVID_SUBKLN.checked else BtnDel.enabled:=true and RVID_SUBKLN.checked;
   SAVE:=false;
end;

procedure TEDIT_RVID.RVID_NAMEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEDIT_RVID.BtnDelClick(Sender: TObject);
begin
   if Messbox('Удалить из списка клиента "'+MemKLN.fieldByname('kln_full').asstring+'" ?"',MessSubmitDelete,4+48+256)=6 then begin
      if MemKLN.fieldByname('cfg_id').asinteger>0 then begin
         inc(CntDel);
         ArrDel[CntDel]:=MemKLN.fieldByname('cfg_id').asinteger;
      end;
      MemKLN.Delete;
   end;
end;

procedure TEDIT_RVID.BtnAddClick(Sender: TObject);
var
  oldid:integer;
  a,b:integer;
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=0;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>0 then begin
        // проверяем на совпадение
        MemKLN.DisableControls;
        if MemKLN.recordcount>0 then begin
           b:=0;
           MemKLN.first;
           while not MemKLN.eof do begin
             if MemKLN.fieldByname('KLN_ID').asinteger=DIC_KLIENT.tag then b:=1;
             MemKLN.next;
           end;
           oldid:=MemKLN.Recno;
        end else b:=0;
        if b>0 then begin
          messbox('Выбранный клиент уже присутствует в списке!',MessSystem,48);
          MemKLN.recno:=Oldid;
         end else begin
           WorkTransaction.Active:=False;
           ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
           QueryWork.ParamByname('kln_id').asinteger:=DIC_KLIENT.tag;
           QueryWork.Open;
           MemKLN.Append;
           MemKLN.fieldByname('cfg_id').asinteger:=-1;
           MemKLN.fieldByname('kln_id').asinteger:=DIC_KLIENT.tag;
           MemKLN.fieldByname('kln_full').asstring:=QueryWork.fieldByname('kln_full').asstring;
           MemKLN.post;
           QueryWork.close;
        end;
        MemKLN.EnableControls;
        SAVE:=False;
     end;
     DIC_KLIENT.Destroy;
     Try
     Except
     End;
end;

procedure TEDIT_RVID.BtnApplyClick(Sender: TObject);
var
  can:boolean;
  mess:string;
  r:double;
  a,id,id2:integer;
begin
   can:=true;
   mess:='';
   if trim(RVID_NAME.text)='' then begin
     can:=false;
     mess:=mess+'Наименование вида реализациии не может быть пустой строкой';
   end;
   if (RVID_SUBKLN.checked) and (Memkln.recordcount=0) then begin
      can:=false;
      mess:=mess+', необходимо указать хотя-бы одного клиента для выбора';
   end;
   if not can then messbox(mess,MessError,16) else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     try
       ibsave_clear;
       ibsave_add('rvid_name',Rvid_name.text);
       if rvid_subkln.checked then ibsave_add('rvid_subkln',1) else ibsave_add('rvid_subkln',0);
       ID:=ibsave_doc('rvid',edit_rvid.tag);
       if ID<0 then r:=sqrt(-1);
       for a:=1 to CntDel do ibdelete_doc('cfg',arrDel[cntDel]);
       MemKLN.first;
       while not MemKLN.eof do begin
         ibsave_clear;
         ibsave_add('cfg_name','RVID_KLN_LIST');
         ibsave_add('cfg_set2',ID);
         ibsave_add('cfg_set1',MemKLN.fieldByname('kln_id').asinteger);
         ID2:=ibsave_doc('cfg',MemKLN.fieldByname('cfg_id').asinteger);
         if ID2>0 then begin
            MemKLN.edit;
            MemKLN.fieldByname('cfg_id').asinteger:=ID2;
            MemKLN.post;
         end else r:=sqrt(-1);
         MemKLN.next;
       end;
       MemKLN.first;
       Datamodule1.IBTransaction2.Commit;
       edit_rvid.tag:=ID;
       CntDel:=0;
       SAVE:=true;
       caption:=cap+cap_edit;
     except
        Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TEDIT_RVID.BtnSaveClick(Sender: TObject);
begin
   SAVE:=false;
   BtnApply.click;
   if SAVE then close;
end;

procedure TEDIT_RVID.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save)  then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

end.
