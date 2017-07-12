unit DicShopSkl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  ActnList, Db, RxMemDS, IBCustomDataSet, IBQuery, IBDatabase, Menus,
  StdCtrls;

type
  TDIC_SHOPSKL = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    DsDost: TDataSource;
    DicTransaction: TIBTransaction;
    QueryDic: TIBQuery;
    DsDic: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DostTransaction: TIBTransaction;
    QueryDost: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnDostOn: TMenuItem;
    MnDostOff: TMenuItem;
    Timer1: TTimer;
    QueryDicSHOP_NAME: TIBStringField;
    QueryDicFRM_NAME: TIBStringField;
    QueryDostSKL_ID: TIntegerField;
    QueryDostSKL_SHORT: TIBStringField;
    QueryDostCFG_ID: TIntegerField;
    QueryDostCFG_VALUE: TIntegerField;
    QueryDostDOSTUP_NAME: TIBStringField;
    QueryDicSHOP_ID: TIntegerField;
    RxDBGrid3: TRxDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    TYP: TComboBox;
    procedure QueryDicAfterOpen(DataSet: TDataSet);
    procedure QueryDicAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure MnDostOnClick(Sender: TObject);
    procedure MnDostOffClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TYPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_SHOPSKL: TDIC_SHOPSKL;

implementation


{$R *.DFM}

procedure TDIC_SHOPSKL.QueryDicAfterOpen(DataSet: TDataSet);
begin

   QueryDost.close;
   Timer1.enabled:=False;
   Timer1.enabled:=True;
end;

procedure TDIC_SHOPSKL.QueryDicAfterScroll(DataSet: TDataSet);
begin
   QueryDost.close;
   Timer1.enabled:=False;
   Timer1.enabled:=True;
end;

procedure TDIC_SHOPSKL.Timer1Timer(Sender: TObject);
begin
   timer1.enabled:=false;
   QueryDost.Disablecontrols;
   DostTransaction.Active:=False;
   QueryDost.close;
   if not QueryDic.eof then begin
     QueryDost.ParamByName('shop_id').asinteger:=QueryDic.FieldByName('SHOP_ID').asinteger;
     QueryDost.ParamByName('typ').asinteger:=  TYP.ItemIndex +1;
     QueryDost.Open;
   end;
   MnDostOn.enabled:=not QueryDic.eof;
   MnDostOff.enabled:=not QueryDic.eof;
   QueryDost.Enablecontrols;

end;

procedure TDIC_SHOPSKL.MnDostOnClick(Sender: TObject);
var
   oldid:integer;
   ID:integer;
   r:double;
begin
   if QueryDost.fieldByname('cfg_value').asinteger=0 then begin
      oldid:=QueryDost.fieldByname('skl_ID').asinteger;
      // Разрешаем доступ
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      try
        ibsave_clear;
        ibsave_add('cfg_name','SHOP_SKL_DOSTUP');
        ibsave_add('cfg_set1',QueryDic.fieldByname('SHOP_ID').asinteger);
        ibsave_add('cfg_set2',QueryDost.fieldByname('SKL_ID').asinteger);
        ibsave_add('cfg_set3',typ.itemindex+1);
        ibsave_add('cfg_value',1);
        ID:=ibsave_doc('CFG',-1);
        if ID<0 then r:=sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        Timer1.OnTimer(Sender);
        QueryDost.Locate('SKL_ID',oldid,[]);
      except
        Datamodule1.IBTransaction2.Rollback
      end;
      Datamodule1.IBTransaction2.Active:=False;
   end;
end;

procedure TDIC_SHOPSKL.MnDostOffClick(Sender: TObject);
var
  oldid:integer;
begin
   if QueryDost.fieldByname('cfg_value').asinteger=1 then begin
      oldid:=QueryDost.fieldByname('skl_ID').asinteger;
      // Разрешаем доступ
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      try
         ADD_SQL(Datamodule1.IbSaveSQL,'delete from cfg where cfg_name="SHOP_SKL_DOSTUP" and cfg_set3=:TYP and cfg_set1=:shop_id and cfg_set2=:skl_id');
         Datamodule1.IbSaveSQL.ParamByname('shop_id').asinteger:=QueryDic.fieldByname('shop_id').asinteger;
         Datamodule1.IbSaveSQL.ParamByname('skl_id').asinteger:=QueryDost.fieldByname('skl_id').asinteger;
         Datamodule1.IbSaveSQL.ParamByname('TYP').asinteger:=TYP.ItemIndex+1;
         Datamodule1.IbSaveSQL.ExecSQL;
      except
      end;
      Datamodule1.IBTransaction2.Commit;
      Datamodule1.IBTransaction2.Active:=False;
      Timer1.OnTimer(Sender);
      QueryDost.Locate('SKL_ID',oldid,[]);
   end;
end;

procedure TDIC_SHOPSKL.FormShow(Sender: TObject);
begin
       TYP.ItemIndex:=0;
       DicTransaction.Active:=False;
       QueryDic.close;
       QueryDic.Open;
       RxDbGrid1.Setfocus;
end;

procedure TDIC_SHOPSKL.TYPChange(Sender: TObject);
begin
   QueryDost.close;
   Timer1.enabled:=False;
   Timer1.enabled:=True;
end;

end.
