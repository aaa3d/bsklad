unit ShopFastInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl;

type
  TTW_SHOW_OST_PRIH = class(TForm)
    RxDBGrid1: TRxDBGrid;
    QrTWPost: TIBQuery;
    DsTWPost: TDataSource;
    TWPostTransaction: TIBTransaction;
    QrTWPostID: TIntegerField;
    QrTWPostIDS: TIntegerField;
    QrTWPostTYP: TIntegerField;
    QrTWPostPNTYP_ID: TIntegerField;
    QrTWPostSHOP_ID: TIntegerField;
    QrTWPostSKL_ID: TIntegerField;
    QrTWPostDT: TDateTimeField;
    QrTWPostMEN: TIntegerField;
    QrTWPostPOST: TIntegerField;
    QrTWPostTW_ID2: TIntegerField;
    QrTWPostPOST_KOL: TFloatField;
    QrTWPostBASE_MEN: TIntegerField;
    QrTWPostBASE_POST: TIntegerField;
    QrTWPostBASE_DT: TDateTimeField;
    QrTWPostSEB: TFloatField;
    QrTWPostSEB2: TFloatField;
    QrTWPostNDS: TFloatField;
    QrTWPostNDS2: TFloatField;
    QrTWPostBASE_SEB: TFloatField;
    QrTWPostBASE_SEB2: TFloatField;
    QrTWPostBASE_NDS: TFloatField;
    QrTWPostBASE_NDS2: TFloatField;
    QrTWPostBASE_TYP: TIntegerField;
    QrTWPostBASE_ID: TIntegerField;
    QrTWPostBASE_IDS: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TW_SHOW_OST_PRIH: TTW_SHOW_OST_PRIH;

implementation

uses Data1;

{$R *.DFM}

procedure TTW_SHOW_OST_PRIH.FormShow(Sender: TObject);
var tw_name, shop_name: ansistring;
begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from TW WHERE TW_ID=:TW_ID');
        DataModule1.IbSaveSQL.Parambyname('TW_ID').asinteger:=rxDBGrid1.Tag;
        DataModule1.IbSaveSQL.Open;
        if not DataModule1.IbSaveSQL.Eof then
        begin

        	tw_name:='['+DataModule1.IbSaveSQL.fieldbyname('TW_ART').asstring;
            tw_name:=tw_name+'] '+DataModule1.IbSaveSQL.fieldbyname('TW_NAM').asstring;
        end;

		DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from SHOP WHERE SHOP_ID=:SHOP_ID');
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=Shop_Fastinfo.Tag;
        DataModule1.IbSaveSQL.Open;
        if not DataModule1.IbSaveSQL.Eof then
        	shop_name:=DataModule1.IbSaveSQL.fieldbyname('SHOP_NAME').asstring;

   		DataModule1.IBTransaction2.Active:=False;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;

        self.Caption:=SHOP_name+': '+tw_name;
	     QrShopFastInfo.close;
         QrShopFastInfo.ParamByName('TW_ID').asinteger:= rxDBGrid1.Tag;
         QrShopFastInfo.ParamByName('SHOP_ID').asinteger:= Shop_Fastinfo.Tag;
    	 FastInfoTransaction.Active:=False;
         QrShopFastInfo.Active:=true;
	     QrShopFastInfo.Open;
end;

procedure TTW_SHOW_OST_PRIH.FormDeactivate(Sender: TObject);
begin
	self.Close;
end;

procedure TTW_SHOW_OST_PRIH.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=27) then self.Close;
end;

end.
