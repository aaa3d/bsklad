unit EditTwSkladMon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Mask, ToolEdit, CurrEdit, RxLookup,
  Db, IBCustomDataSet, IBDatabase, IBQuery;

type
  TEDIT_TWSKLADMON = class(TForm)
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    DicTransaction: TIBTransaction;
    DicShop: TIBQuery;
    DsShop: TDataSource;
    DsSKL: TDataSource;
    DicSKL: TIBQuery;
    DicShopSHOP_ID: TIntegerField;
    DicShopSHOP_NAME: TIBStringField;
    DicSKLSKL_ID: TIntegerField;
    DicSKLSKL_FULL: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SHOP_ID: TRxDBLookupCombo;
    SKL_ID: TRxDBLookupCombo;
    TW_MONEY: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    SHOP_ALL: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SHOP_ALLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_TWSKLADMON: TEDIT_TWSKLADMON;

implementation

{$R *.DFM}

procedure TEDIT_TWSKLADMON.Button1Click(Sender: TObject);
begin
    tag:=2;
    close;
end;

procedure TEDIT_TWSKLADMON.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TEDIT_TWSKLADMON.FormShow(Sender: TObject);
begin
   DicTransaction.Active:=False;
   DicSKL.Close;
   DicSKl.open;
   DicShop.Close;
   DicShop.open;
   if tag<0 then begin
     SKL_ID.value:=inttostr(default_sklad);
     SHOP_ID.value:=inttostr(default_shop);
   end else begin
      SHOP_ALL.Enabled:=False;
      workTransaction.Active:=False;
      ADD_SQL(QueryWork,'select skl_id,shop_id from twmonsklad where twmonsklad_id=:id');
      QueryWork.ParamByname('ID').asinteger:=tag;
      QueryWork.Open;
      if QueryWork.eof then begin
        SKL_ID.value:=inttostr(default_sklad);
        SHOP_ID.value:=inttostr(default_shop);
      end else begin
         SKL_ID.value:=inttostr(QueryWork.fieldByname('SKL_ID').asinteger);
         SHOP_ID.value:=inttostr(QueryWork.fieldByname('SHOP_ID').asinteger);
      end;

   end;
   tag:=0;

end;

procedure TEDIT_TWSKLADMON.SHOP_ALLClick(Sender: TObject);
begin
   SHOP_ID.Visible:=not SHOP_ALL.Checked;
end;

end.
