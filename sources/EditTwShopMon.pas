unit EditTwShopMon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Mask, ToolEdit, CurrEdit, Db, RxMemDS,
  RxLookup, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_TWSHOPMON = class(TForm)
    WorkTransction: TIBTransaction;
    QueryWork: TIBQuery;
    Label1: TLabel;
    SHOP_NAME: TEdit;
    SHOP_COMBO: TRxDBLookupCombo;
    MemShop: TRxMemoryData;
    MemShopSHOP_ID: TIntegerField;
    MemShopSHOP_NAME: TStringField;
    DsShop: TDataSource;
    Label2: TLabel;
    TW_MONEY: TRxCalcEdit;
    Button1: TButton;
    BtnClose: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_TWSHOPMON: TEDIT_TWSHOPMON;

implementation

{$R *.DFM}

procedure TEDIT_TWSHOPMON.BtnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TEDIT_TWSHOPMON.FormShow(Sender: TObject);
begin
   BtnClose.tag:=0;
end;

procedure TEDIT_TWSHOPMON.Button1Click(Sender: TObject);
begin
   BtnClose.tag:=2;
   close;
end;

end.
