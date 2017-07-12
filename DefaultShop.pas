unit DefaultShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,
  RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase, RxMemDS;

type
  TDEFAULT_SHOP = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    BtnOpen: TToolButton;
    ToolButton2: TToolButton;
    SHOP: TRxDBLookupCombo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ShopTransaction: TIBTransaction;
    QuerySHOP: TIBQuery;
    QuerySHOPSHOP_ID: TIntegerField;
    QuerySHOPSHOP_NAME: TIBStringField;
    DsShop: TDataSource;
    RxMemTYP: TRxMemoryData;
    RxMemTYPRNTYP_ID: TIntegerField;
    RxMemTYPRNTYP_FULL: TStringField;
    RxMemTYPFRM_ID: TIntegerField;
    RxMemTYPFRM_FULL: TStringField;
    RxMemTYPKLN_ID: TIntegerField;
    RxMemTYPKLN_FULL: TStringField;
    DsMemTyp: TDataSource;
    RxMemTYPCFG_ID: TIntegerField;
    QueryWork2: TIBQuery;
    RxMemTYPCFG_ID2: TIntegerField;
    RxMemTYPCFG_ID3: TIntegerField;
    RxMemTYPCFG_ID4: TIntegerField;
    RxMemTYPRVID_ID: TIntegerField;
    RxMemTYPRVID_NAME: TStringField;
    RxMemTYPRVIDKLN_ID: TIntegerField;
    RxMemTYPRVIDKLN_FULL: TStringField;
    procedure SHOPChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DEFAULT_SHOP: TDEFAULT_SHOP;

implementation

uses EditDefaultShop;

{$R *.DFM}

procedure TDEFAULT_SHOP.SHOPChange(Sender: TObject);
var
  RVID_SUBKLN:integer;
begin
     {Загружаем данные}
     WorkTransaction.Active:=False;
     RxMemTyp.EmptyTable;
     RxMemTyp.Append;
     RxMemTyp.fieldByname('RNTYP_ID').asinteger:=-1;
     RxMemTyp.fieldByname('RNTYP_FULL').asstring:='[ККМ] Расходная накладная со своего склада (ККМ)';
//   Клиент по умолчанию
     ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and cfg.cfg_set1=-1 and cfg.cfg_set2=1 and cfg.cfg_set3=:SHOP_ID');
     QueryWork.Parambyname('SHOP_ID').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then begin
        RxMemTyp.fieldByname('CFG_ID').asinteger:=-1;
     end else begin
        RxMemTyp.fieldByname('CFG_ID').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
        RxMemTyp.fieldByname('KLN_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        ADD_SQL(QueryWork2,'select kln_full from kln_data(:KLN_ID)');
        QueryWork2.ParamByname('KLN_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        QueryWork2.Open;
        RxMemTyp.fieldByname('KLN_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
     end;
//   Фирма по умолчанию
     ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and cfg.cfg_set1=-1 and cfg.cfg_set2=2 and cfg.cfg_set3=:SHOP_ID');
     QueryWork.Parambyname('SHOP_ID').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then begin
        RxMemTyp.fieldByname('CFG_ID2').asinteger:=-1;
     end else begin
        RxMemTyp.fieldByname('CFG_ID2').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
        RxMemTyp.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        ADD_SQL(QueryWork2,'select kln_full from kln_data(:KLN_ID)');
        QueryWork2.ParamByname('KLN_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        QueryWork2.Open;
        RxMemTyp.fieldByname('FRM_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
     end;
//   Вид реализации по умолчанию
     ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and cfg.cfg_set1=-1 and cfg.cfg_set2=3 and cfg.cfg_set3=:SHOP_ID');
     QueryWork.Parambyname('SHOP_ID').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then begin
        RxMemTyp.fieldByname('CFG_ID3').asinteger:=-1;
     end else begin
        RxMemTyp.fieldByname('CFG_ID3').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
        RxMemTyp.fieldByname('RVID_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        ADD_SQL(QueryWork2,'select * from rvid where rvid_id=:rvid_id');
        QueryWork2.ParamByname('RVID_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        QueryWork2.Open;
        RVID_SUBKLN:=QueryWork2.fieldByname('RVID_SUBKLN').asinteger;
        RxMemTyp.fieldByname('RVID_NAME').asstring:=QueryWork2.fieldByname('RVID_NAME').asstring;
     end;
     // Опредяляем банк по умолчанию
     ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and cfg.cfg_set1=-1 and cfg.cfg_set2=4 and cfg.cfg_set3=:SHOP_ID');
     QueryWork.Parambyname('SHOP_ID').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then begin
        RxMemTyp.fieldByname('CFG_ID4').asinteger:=-1;
        RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=-1;
        RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:='';
     end else begin
        RxMemTyp.fieldByname('CFG_ID4').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
        RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=QueryWork.fieldByname('CFG_VALUE').asinteger;
        ADD_SQL(QueryWork2,'select kln_full from kln_data(:kln_id)');
        QueryWork2.ParamByname('KLN_ID').asinteger:=RxMemTyp.fieldByname('RVIDKLN_ID').asinteger;
        QueryWork2.Open;
        RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
     end;
     if RVID_SUBKLN=0 then begin
        RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=-1;
        RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:='';
     end;
     RxMemTyp.Post;
     ADD_SQL(QueryWork,'select rntyp.rntyp_id,rntyp.rntyp_short,rntyp.rntyp_full, '+
     '(select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=1) '+
     ' and (cfg.cfg_set3=:SHOP_ID1)) as cfg_id, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=1) '+
     ' and (cfg.cfg_set3=:SHOP_ID2)) as kln_id, '+
     ' (select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=2) '+
     ' and (cfg.cfg_set3=:SHOP_ID3)) as cfg_id2, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=2) '+
     ' and (cfg.cfg_set3=:SHOP_ID4)) as frm_id, '+
     ' (select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=3) '+
     ' and (cfg.cfg_set3=:SHOP_ID5)) as cfg_id3, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=3) '+
     ' and (cfg.cfg_set3=:SHOP_ID6)) as rvid_id, '+
     ' (select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=4) '+
     ' and (cfg.cfg_set3=:SHOP_ID7)) as cfg_id4, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_RNTYP" '+
     ' and (cfg.cfg_set1=rntyp.rntyp_id) '+
     ' and (cfg.cfg_set2=4) '+
     ' and (cfg.cfg_set3=:SHOP_ID8)) as rvid_kln '+
     ' from rntyp order by rntyp_id ');
     QueryWork.Parambyname('SHOP_ID1').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID2').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID3').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID4').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID5').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID6').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID7').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID8').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then BtnOpen.enabled:=False else BtnOpen.enabled:=true;
     while not QueryWork.eof do begin
           RxMemTyp.append;
           RxMemTyp.fieldByname('RNTYP_ID').asinteger:=QueryWork.fieldByname('RNTYP_ID').asinteger;
           RxMemTyp.fieldByname('RNTYP_FULL').asstring:='['+QueryWork.fieldByname('RNTYP_SHORT').asstring+'] '+QueryWork.fieldByname('RNTYP_FULL').asstring;
           if QueryWork.fieldByname('CFG_ID').asinteger=0 then RxMemTyp.fieldByname('CFG_ID').asinteger:=-1
            else begin
                 RxMemTyp.fieldByname('CFG_ID').asinteger:=QueryWork.fieldByname('CFG_ID').asinteger;
                 RxMemTyp.fieldByname('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
                 ADD_SQL(QueryWork2,'select kln_full from kln_data(:KLN_ID)');
                 QueryWork2.ParamByname('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
                 QueryWork2.Open;
                 RxMemTyp.fieldByname('KLN_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
            end;
           if QueryWork.fieldByname('CFG_ID2').asinteger=0 then RxMemTyp.fieldByname('CFG_ID2').asinteger:=-1
            else begin
                 RxMemTyp.fieldByname('CFG_ID2').asinteger:=QueryWork.fieldByname('CFG_ID2').asinteger;
                 RxMemTyp.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
                 ADD_SQL(QueryWork2,'select kln_full from kln_data(:KLN_ID)');
                 QueryWork2.ParamByname('KLN_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
                 QueryWork2.Open;
                 RxMemTyp.fieldByname('FRM_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
            end;
           if QueryWork.fieldByname('CFG_ID3').asinteger=0 then RxMemTyp.fieldByname('CFG_ID3').asinteger:=-1
            else begin
                 RxMemTyp.fieldByname('CFG_ID3').asinteger:=QueryWork.fieldByname('CFG_ID3').asinteger;
                 RxMemTyp.fieldByname('RVID_ID').asinteger:=QueryWork.fieldByname('RVID_ID').asinteger;
                 ADD_SQL(QueryWork2,'select * from rvid where rvid_id=:rvid_id');
                 QueryWork2.ParamByname('RVID_ID').asinteger:=QueryWork.fieldByname('RVID_ID').asinteger;
                 QueryWork2.Open;
                 RVID_SUBKLN:=QueryWork2.fieldByname('RVID_SUBKLN').asinteger;
                 RxMemTyp.fieldByname('RVID_NAME').asstring:=QueryWork2.fieldByname('RVID_NAME').asstring;
            end;
           if QueryWork.fieldByname('CFG_ID4').asinteger=0 then begin
               RxMemTyp.fieldByname('CFG_ID4').asinteger:=-1;
               RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=-1;
               RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:='';
            end else begin
                 RxMemTyp.fieldByname('CFG_ID4').asinteger:=QueryWork.fieldByname('CFG_ID4').asinteger;
                 RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=QueryWork.fieldByname('RVID_KLN').asinteger;
                 ADD_SQL(QueryWork2,'select kln_full from kln_data(:kln_id)');
                 QueryWork2.ParamByname('KLN_ID').asinteger:=RxMemTyp.fieldByname('RVIDKLN_ID').asinteger;
                 QueryWork2.Open;
                 RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:=QueryWork2.fieldByname('KLN_FULL').asstring;
            end;
            if RVID_SUBKLN=0 then begin
               RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=-1;
               RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:='';
            end;
           QueryWork.next;
     end;
     RxMemTyp.First;
end;

procedure TDEFAULT_SHOP.FormShow(Sender: TObject);
begin
     SHopTransaction.Active:=false;
     QueryShop.close;
     QueryShop.Open;
     SHOP.value:=inttostr(SHOPID);
     RxDbgrid1.setfocus;
end;

procedure TDEFAULT_SHOP.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
     Application.CreateForm(TEDIT_DEFAULT_SHOP,EDIT_DEFAULT_SHOP);
     EDIT_DEFAULT_SHOP.caption:='Магазин: '+SHOP.text;
     if RxMemTyp.fieldByname('KLN_ID').asinteger<=0 then
       EDIT_DEFAULT_SHOP.KLN.tag:=DEFAULT_KLIENT
     else EDIT_DEFAULT_SHOP.KLN.tag:=RxMemTyp.fieldByname('KLN_ID').asinteger;
     if RxMemTyp.fieldByname('FRM_ID').asinteger<=0 then
       EDIT_DEFAULT_SHOP.FRM.tag:=DEFAULT_FIRMA
     else EDIT_DEFAULT_SHOP.FRM.tag:=RxMemTyp.fieldByname('FRM_ID').asinteger;
     EDIT_DEFAULT_SHOP.TYP.text:=RxMemTyp.fieldByname('RNTYP_FULL').asstring;
     if RxMemTyp.fieldByname('RVID_ID').asinteger<=0 then begin
        DataModule1.MainDicRvid.first;
        EDIT_DEFAULT_SHOP.RVID.value:=DataModule1.MainDicRvid.fieldByname('RVID_ID').asstring;
     end else begin
         EDIT_DEFAULT_SHOP.RVID.value:=RxMemTyp.fieldByname('RVID_ID').asstring;
         DataModule1.MainDicRvid.locate('RVID_ID',EDIT_DEFAULT_SHOP.RVID.value,[]);
         // Запрашиваем список контрагентов уже в форме
         EDIT_DEFAULT_SHOP.RVIDKLN.tag:=RxMemTyp.fieldByname('RVIDKLN_ID').asinteger;
     end;
     EDIT_DEFAULT_SHOP.ShowModal;
     if EDIT_DEFAULT_SHOP.tag=2 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',2);
           IBSAVE_ADD('CFG_SET3',STRTOINT('0'+SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_RNTYP');
           IBSAVE_ADD('CFG_VALUE',EDIT_DEFAULT_SHOP.FRM.tag);
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID').asinteger:=Id;
              RxMemTyp.fieldByname('FRM_ID').asinteger:=EDIT_DEFAULT_SHOP.FRM.tag;
              RxMemTyp.fieldByname('FRM_FULL').asstring:=EDIT_DEFAULT_SHOP.FRM.text;
              RxMemTyp.Post;
           end;
           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',1);
           IBSAVE_ADD('CFG_SET3',STRTOINT('0'+SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_RNTYP');
           IBSAVE_ADD('CFG_VALUE',EDIT_DEFAULT_SHOP.KLN.tag);
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID2').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID2').asinteger:=Id;
              RxMemTyp.fieldByname('KLN_ID').asinteger:=EDIT_DEFAULT_SHOP.KLN.tag;
              RxMemTyp.fieldByname('KLN_FULL').asstring:=EDIT_DEFAULT_SHOP.KLN.text;
              RxMemTyp.Post;
           end;

           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',3);
           IBSAVE_ADD('CFG_SET3',STRTOINT('0'+SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_RNTYP');
           IBSAVE_ADD('CFG_VALUE',strtoint('0'+EDIT_DEFAULT_SHOP.RVID.value));
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID3').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID3').asinteger:=Id;
              RxMemTyp.fieldByname('RVID_ID').asinteger:=strtoint('0'+EDIT_DEFAULT_SHOP.RVID.value);
              RxMemTyp.fieldByname('RVID_NAME').asstring:=EDIT_DEFAULT_SHOP.RVID.text;
              RxMemTyp.Post;
           end;
           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',4);
           IBSAVE_ADD('CFG_SET3',STRTOINT(SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_RNTYP');
           IBSAVE_ADD('CFG_VALUE',EDIT_DEFAULT_SHOP.RVIDKLN.tag);
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID4').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID4').asinteger:=Id;
              RxMemTyp.fieldByname('RVIDKLN_ID').asinteger:=EDIT_DEFAULT_SHOP.RVIDKLN.tag;
              RxMemTyp.fieldByname('RVIDKLN_FULL').asstring:=EDIT_DEFAULT_SHOP.RVIDKLN.text;
              RxMemTyp.Post;
           end;
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     EDIT_DEFAULT_SHOP.destroy;

end;

procedure TDEFAULT_SHOP.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDEFAULT_SHOP.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

end.
