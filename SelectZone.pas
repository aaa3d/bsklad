unit SelectZone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  Db, IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl,B_utils,B_DButils;

type
  TSelect_zone = class(TForm)
    ShopTransaction: TIBTransaction;
    QueryShop: TIBQuery;
    DsShop: TDataSource;
    RxDBGrid1: TRxDBGrid;
    QueryShopSHOP_ID: TIntegerField;
    QueryShopSHOP_NAME: TIBStringField;
    procedure QueryShopAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_zone: TSelect_zone;

implementation

uses SelectShop;

{$R *.DFM}

procedure TSelect_zone.QueryShopAfterOpen(DataSet: TDataSet);
var
   n:integer;
begin
     n:=QueryShop.recordcount;
     Select_Shop.Height:=(n)*20;

end;

procedure TSelect_zone.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF KEY=#27 THEN CLOSE;
end;

procedure TSelect_zone.FormShow(Sender: TObject);
begin
     ShopTransaction.Active:=False;
     QueryShop.Close;
     QueryShop.Open;
     tag:=0;
end;

procedure TSelect_zone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryShop.Close;
     ShopTransaction.Active:=False;
end;

procedure TSelect_zone.RxDBGrid1DblClick(Sender: TObject);
begin
     tag:=QueryShop.fieldByname('SHOP_ID').asinteger;
     SHOP_TMP:=QueryShop.fieldByname('SHOP_NAME').asstring;
     close;
end;

procedure TSelect_zone.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       SHOP_TMP:=QueryShop.fieldByname('SHOP_NAME').asstring;
       tag:=QueryShop.fieldByname('SHOP_ID').asinteger;
       close;
     end;
     if key=#27 then close;
end;

end.
