unit DefaultShopPn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,
  RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase, RxMemDS;

type
  TDEFAULT_SHOPPN = class(TForm)
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
  DEFAULT_SHOPPN: TDEFAULT_SHOPPN;

implementation

uses EditDefaultShop, EditDefaultShopPN;

{$R *.DFM}

procedure TDEFAULT_SHOPPN.SHOPChange(Sender: TObject);
begin
     {Загружаем данные}
     WorkTransaction.Active:=False;
     RxMemTyp.EmptyTable;
     ADD_SQL(QueryWork,'select pntyp.pntyp_id,pntyp.pntyp_full, '+
     '(select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_PNTYP" '+
     ' and (cfg.cfg_set1=pntyp.pntyp_id) '+
     ' and (cfg.cfg_set2=1) '+
     ' and (cfg.cfg_set3=:SHOP_ID1)) as cfg_id, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_PNTYP" '+
     ' and (cfg.cfg_set1=pntyp.pntyp_id) '+
     ' and (cfg.cfg_set2=1) '+
     ' and (cfg.cfg_set3=:SHOP_ID2)) as kln_id, '+
     ' (select max(cfg_id) from cfg where cfg_name="DEFAULT_SHOP_PNTYP" '+
     ' and (cfg.cfg_set1=pntyp.pntyp_id) '+
     ' and (cfg.cfg_set2=2) '+
     ' and (cfg.cfg_set3=:SHOP_ID3)) as cfg_id2, '+
     ' (select max(cfg.cfg_value) from cfg where cfg_name="DEFAULT_SHOP_PNTYP" '+
     ' and (cfg.cfg_set1=pntyp.pntyp_id) '+
     ' and (cfg.cfg_set2=2) '+
     ' and (cfg.cfg_set3=:SHOP_ID4)) as frm_id '+
     ' from pntyp order by pntyp_id ');
     QueryWork.Parambyname('SHOP_ID1').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID2').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID3').asinteger:=strtoint(SHOP.value);
     QueryWork.Parambyname('SHOP_ID4').asinteger:=strtoint(SHOP.value);
     QueryWork.open;
     if QueryWork.eof then BtnOpen.enabled:=False else BtnOpen.enabled:=true;
     while not QueryWork.eof do begin
           RxMemTyp.append;
           RxMemTyp.fieldByname('RNTYP_ID').asinteger:=QueryWork.fieldByname('PNTYP_ID').asinteger;
           RxMemTyp.fieldByname('RNTYP_FULL').asstring:=QueryWork.fieldByname('PNTYP_FULL').asstring;
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
           QueryWork.next;
     end;
     RxMemTyp.First;
end;

procedure TDEFAULT_SHOPPN.FormShow(Sender: TObject);
begin
     SHopTransaction.Active:=false;
     QueryShop.close;
     QueryShop.Open;
     SHOP.value:=inttostr(SHOPID);
     RxDbgrid1.setfocus;
end;

procedure TDEFAULT_SHOPPN.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
     Application.CreateForm(TEDIT_DEFAULT_SHOPPN,EDIT_DEFAULT_SHOPPN);
     EDIT_DEFAULT_SHOPPN.caption:='Магазин: '+SHOP.text;
     if RxMemTyp.fieldByname('KLN_ID').asinteger<=0 then
       EDIT_DEFAULT_SHOPPN.KLN.tag:=DEFAULT_KLIENT
     else EDIT_DEFAULT_SHOPPN.KLN.tag:=RxMemTyp.fieldByname('KLN_ID').asinteger;
     if RxMemTyp.fieldByname('FRM_ID').asinteger<=0 then
       EDIT_DEFAULT_SHOPPN.FRM.tag:=DEFAULT_FIRMA
     else EDIT_DEFAULT_SHOPPN.FRM.tag:=RxMemTyp.fieldByname('FRM_ID').asinteger;
     EDIT_DEFAULT_SHOPPN.TYP.text:=RxMemTyp.fieldByname('RNTYP_FULL').asstring;
     EDIT_DEFAULT_SHOPPN.ShowModal;
     if EDIT_DEFAULT_SHOPPN.tag=2 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',2);
           IBSAVE_ADD('CFG_SET3',STRTOINT(SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_PNTYP');
           IBSAVE_ADD('CFG_VALUE',EDIT_DEFAULT_SHOPPN.FRM.tag);
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID').asinteger:=Id;
              RxMemTyp.fieldByname('FRM_ID').asinteger:=EDIT_DEFAULT_SHOPPN.FRM.tag;
              RxMemTyp.fieldByname('FRM_FULL').asstring:=EDIT_DEFAULT_SHOPPN.FRM.text;
              RxMemTyp.Post;
           end;
           IBSAVE_ADD('CFG_SET1',RxMemTyp.fieldByname('RNTYP_ID').asinteger);
           IBSAVE_ADD('CFG_SET2',1);
           IBSAVE_ADD('CFG_SET3',STRTOINT(SHOP.value));
           IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP_PNTYP');
           IBSAVE_ADD('CFG_VALUE',EDIT_DEFAULT_SHOPPN.KLN.tag);
           ID:=IBSAVE_DOC('CFG',RxMemTyp.fieldByname('CFG_ID2').asinteger);
           if ID>0 then begin
              RxMemTyp.edit;
              RxMemTyp.fieldByname('CFG_ID2').asinteger:=Id;
              RxMemTyp.fieldByname('KLN_ID').asinteger:=EDIT_DEFAULT_SHOPPN.KLN.tag;
              RxMemTyp.fieldByname('KLN_FULL').asstring:=EDIT_DEFAULT_SHOPPN.KLN.text;
              RxMemTyp.Post;
           end;
           Datamodule1.IBTransaction2.commit;
        Except
           Datamodule1.IBTransaction2.rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     EDIT_DEFAULT_SHOPPN.destroy;
end;

procedure TDEFAULT_SHOPPN.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDEFAULT_SHOPPN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

end.
