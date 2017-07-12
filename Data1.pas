unit Data1;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  Модуль данных и глобальных объектов программы BSKLAD      ****
  ********************************************************************}



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, Db, ImgList, IBCustomDataSet, IBQuery, IBSQL, RxMemDS,B_utils,
  IBSQLMonitor, ExtCtrls;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ImageList1: TImageList;
    IbGetGen: TIBQuery;
    IbSaveSQL: TIBQuery;
    IBTransaction2: TIBTransaction;
    IbSaveUSWORK: TIBQuery;
    TransactionUsWork: TIBTransaction;
    QueryPrepare: TIBQuery;
    IbGetDefault: TIBQuery;
    NumTransaction: TIBTransaction;
    QueryNUM: TIBQuery;
    OstTransaction: TIBTransaction;
    QueryOSt: TIBQuery;
    ReportTransaction: TIBTransaction;
    ReportOst: TIBQuery;
    ReportOstTW_ID: TIntegerField;
    ReportOstTW_ART: TIntegerField;
    ReportOstTW_NAM: TIBStringField;
    ReportOstED_SHORT: TIBStringField;
    ReportOstTW_MROZ: TFloatField;
    ReportOstOST: TFloatField;
    ReportOstTW_SUMMR: TFloatField;
    ReportOstTW_SUMMZ: TFloatField;
    ReportOstTWTREE_ID: TIntegerField;
    ReportOstTWTREE_FULL: TIBStringField;
    DiskontTransaction: TIBTransaction;
    QueryDiskont: TIBQuery;
    MemCENNIK: TRxMemoryData;
    DsCENNIK: TDataSource;
    MemCENNIKTW_ID: TIntegerField;
    MemCENNIKTW_ART: TIntegerField;
    MemCENNIKTW_NAM: TStringField;
    MemCENNIKTW_RAZM: TMemoField;
    MemCENNIKTW_UP: TMemoField;
    MemCENNIKTW_MADE: TMemoField;
    MemCENNIKTW_PRIM: TMemoField;
    MemCENNIKTW_MROZ: TFloatField;
    MemCENNIKED_SHORT: TStringField;
    MemCENNIKTITLE: TStringField;
    CennikTransaction: TIBTransaction;
    QueryCennik: TIBQuery;
    ShopDefaultTransaction: TIBTransaction;
    QueryShopDefault: TIBQuery;
    CheckDostTransaction: TIBTransaction;
    QueryCheckDost: TIBQuery;
    QueryCheckDostUSDOSTUP_ID: TIntegerField;
    EditTransaction: TIBTransaction;
    QueryEdit: TIBQuery;
    KKMTransaction: TIBTransaction;
    QrKKM: TIBQuery;
    LogTransaction: TIBTransaction;
    QrLog: TIBQuery;
    MemCENNIKTWKTG_PRIM: TStringField;
    MainDicTransaction: TIBTransaction;
    MainDicSkl1: TIBQuery;
    MainDicMen1: TIBQuery;
    MainDicMen1KLN_ID: TIntegerField;
    MainDicMen1KLN_FIO: TIBStringField;
    MainDsMen: TDataSource;
    MainDsSkl: TDataSource;
    MainDicPnVid1: TIBQuery;
    MainDicPnVid1PNVID_ID: TIntegerField;
    MainDicPnVid1PNVID_NAM: TIBStringField;
    MainDsPnvid: TDataSource;
    MainDsRnVid: TDataSource;
    MainDicRnVid1: TIBQuery;
    MainDicRnVid1RNVID_ID: TIntegerField;
    MainDicRnVid1RNVID_NAM: TIBStringField;
    MainDicPnTyp1: TIBQuery;
    MainDicPnTyp1PNTYP_ID: TIntegerField;
    MainDicPnTyp1PNTYP_SHORT: TIBStringField;
    MainDicPnTyp1PNTYP_FULL: TIBStringField;
    MainDsPntyp: TDataSource;
    MainDsRnTyp: TDataSource;
    MainDicRnTyp1: TIBQuery;
    MainDicRnTyp1RNTYP_ID: TIntegerField;
    MainDicRnTyp1RNTYP_SHORT: TIBStringField;
    MainDicRnTyp1RNTYP_FULL: TIBStringField;
    MainDicRnTyp1RNTYP_NDS: TIntegerField;
    MainDicSpisVid1: TIBQuery;
    MainDicSpisVid1SPISVID_ID: TIntegerField;
    MainDicSpisVid1SPISVID_NAM: TIBStringField;
    MainDicSpisVid1SPISVID_ACTIV: TIntegerField;
    MainDicSpisVid1TM: TDateTimeField;
    MainDicSpisVid1SPISVID_2002: TIBStringField;
    MainDicSpisVid1SPISVID_US: TIBStringField;
    MainDsSpisVid: TDataSource;
    IbSaveSQL2: TIBQuery;
    QueryStorno: TIBQuery;
    QueryStornoSTORNO_ID: TIntegerField;
    QueryStornoWOZW_ID: TIntegerField;
    QueryStornoRN_DATE: TDateTimeField;
    QueryStornoSTORNO_DATE: TDateTimeField;
    QueryStornoSTORNO_FULLNUM: TIBStringField;
    QueryStornoMESS: TIBStringField;
    DsStorno: TDataSource;
    StornoTransaction: TIBTransaction;
    MainDicShop1: TIBQuery;
    MainDsShop: TDataSource;
    ReTransaction: TIBTransaction;
    QueryRe: TIBQuery;
    IBDatabase2: TIBDatabase;
    ArcTransaction: TIBTransaction;
    QueryArc: TIBQuery;
    QueryArc2: TIBQuery;
    WorkDiskont: TIBQuery;
    IbSaveSQL3: TIBQuery;
    ZPTransacation: TIBTransaction;
    QueryZP1: TIBQuery;
    QueryZP2: TIBQuery;
    QueryZP3: TIBQuery;
    MainDicRvid1: TIBQuery;
    MainDsRvid: TDataSource;
    MainDicRvid1RVID_ID: TIntegerField;
    MainDicRvid1RVID_NAME: TIBStringField;
    MainDicRvid1RVID_SUBKLN: TIBStringField;
    MainDicRvid1TM: TDateTimeField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    CanPrintTransaction: TIBTransaction;
    QueryCanPrint: TIBQuery;
    NdsNpTransaction: TIBTransaction;
    QrNdsNp: TIBQuery;
    MainDicRnTyp1REAL_TYP: TIntegerField;
    MainDicRnTyp1TEMP: TIBStringField;
    MemCENNIKFRM_NAME: TStringField;
    MemCENNIKTW_LENGTH: TFloatField;
    MemCENNIKTW_WIDTH: TFloatField;
    MemCENNIKTW_KWM_UCHET: TIntegerField;
    MemCENNIKTW_KWM_PRICE: TFloatField;
    MainDicMen: TRxMemoryData;
    MainDicSkl: TRxMemoryData;
    MainDicPnVid: TRxMemoryData;
    MainDicRnVid: TRxMemoryData;
    MainDicPnTyp: TRxMemoryData;
    MainDicRnTyp: TRxMemoryData;
    MainDicSpisVid: TRxMemoryData;
    MainDicShop: TRxMemoryData;
    MainDicRVid: TRxMemoryData;
    MainDicRnVidRNVID_ID: TIntegerField;
    MainDicRnVidNRVID_NAM: TStringField;
    MainDicDopFrm1: TIBQuery;
    MainDsDopFrm: TDataSource;
    MainDicDopFrm: TRxMemoryData;
    MainDicDopFrm1KLN_ID: TIntegerField;
    MainDicDopFrm1KLN_FULL: TIBStringField;
    MainDicDopFrmKLN_ID: TIntegerField;
    MainDicDopFrmKLN_FULL: TIBStringField;
    MainDicOsnFrm1: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    MainDsOsnFrm: TDataSource;
    MainDicOsnFrm: TRxMemoryData;
    IntegerField2: TIntegerField;
    IBStringField2: TIBStringField;
    MainDicSkl1SKL_ID: TIntegerField;
    MainDicSkl1SKL_SHORT: TIBStringField;
    MainDicSkl1SKL_FULL: TIBStringField;
    MainDicSkl1SKL_ADR: TIBStringField;
    MainDicSkl1SKL_TEL: TIBStringField;
    MainDicSkl1SKL_TIME: TIBStringField;
    MainDicSkl1SKL_SPEED: TIntegerField;
    MainDicSkl1SKL_FRM: TIntegerField;
    MainDicSklSKL_ID: TIntegerField;
    MainDicSklSKL_SHORT: TIBStringField;
    MainDicSklSKL_FULL: TIBStringField;
    MainDicSklSKL_ADR: TIBStringField;
    MainDicSklSKL_TEL: TIBStringField;
    MainDicSklSKL_TIME: TIBStringField;
    MainDicSklSKL_SPEED: TIntegerField;
    MainDicSklSKL_FRM: TIntegerField;
    MainDicDopFrm1KLN_REKW: TIBStringField;
    MainDicDopFrmKLN_REKW: TIBStringField;
    MainDicOsnFrm1KLN_REKW: TIBStringField;
    MainDicOsnFrmKLN_REKW: TIBStringField;
    MainDicValuta1: TIBQuery;
    MainDsValuta: TDataSource;
    MainDicValuta: TRxMemoryData;
    MainDicValuta1VALUTA_ID: TIntegerField;
    MainDicValuta1VALUTA_FULL: TIBStringField;
    MainDicValutaVALUTA_ID: TIntegerField;
    MainDicValutaVALUTA_FULL: TIBStringField;
    MaindicAllFrm1: TIBQuery;
    IntegerField3: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    MainDsAllFrm: TDataSource;
    MainDicAllFrm: TRxMemoryData;
    IntegerField4: TIntegerField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    MainDicShop1SHOP_ID: TIntegerField;
    MainDicShop1SHOP_NAME: TIBStringField;
    MainDicShop1SHOP_LAST: TDateTimeField;
    MainDicShop1SHOP_OFFICE: TIBStringField;
    MainDicShop1SHOP_PREFIX: TIBStringField;
    MainDicShop1SHOP_POSTFIX: TIBStringField;
    MainDicShop1SHOP_COLOR: TIntegerField;
    MainDicShop1SHOP_TM: TDateTimeField;
    MainDicShop1SHOP_VISIBLE: TIBStringField;
    MainDicShopSHOP_ID: TIntegerField;
    MainDicShopSHOP_NAME: TIBStringField;
    MainDicShopSHOP_LAST: TDateTimeField;
    MainDicShopSHOP_OFFICE: TIBStringField;
    MainDicShopSHOP_PREFIX: TIBStringField;
    MainDicShopSHOP_POSTFIX: TIBStringField;
    MainDicShopSHOP_COLOR: TIntegerField;
    MainDicShopSHOP_TM: TDateTimeField;
    MainDicShopSHOP_VISIBLE: TIBStringField;
    MainDicTwSaler1: TIBQuery;
    MainDsTwSaler: TDataSource;
    MainDicTwSaler: TRxMemoryData;
    MainDicTwSaler1SALER_ID: TIntegerField;
    MainDicTwSaler1SALER_NAME: TIBStringField;
    MainDicTwSaler1SALER_REKW: TIBStringField;
    MainDicTwSalerSALER_ID: TIntegerField;
    MainDicTwSalerSALER_NAME: TIBStringField;
    MainDicTwSalerSALER_REKW: TIBStringField;
    MemCENNIKMET_MONEY_SHOP: TIntegerField;
    MaindicTwKtg1: TIBQuery;
    MainDsTwKtg: TDataSource;
    MaindicTwKtg: TRxMemoryData;
    MaindicTwKtg1TWKTG_ID: TIntegerField;
    MaindicTwKtg1TWKTG_NAM: TIBStringField;
    MaindicTwKtgTWKTG_ID: TIntegerField;
    MaindicTwKtgTWKTG_NAM: TIBStringField;
    MainDicSkl1FRM_NAME: TIBStringField;
    MainDicSklFRM_NAME: TIBStringField;
    QueryCheckUserDostup: TIBQuery;
    MemCENNIKTW_NOSKID: TIntegerField;
    MemCENNIKMET_MONEY_SHOP1: TIntegerField;
    MemCENNIKBAR_CODE: TStringField;
    MemCENNIKtw_brak: TStringField;
    MaindicAllFrm1KLN_USE_NDS: TIBStringField;
    MainDicAllFrmKLN_USE_NDS: TIBStringField;
    MemCENNIKtw_mroz_2: TFloatField;
    MemCENNIKtw_prim_2: TStringField;
    MainDSZone: TDataSource;
    MainDicZone: TRxMemoryData;
    MainDicZone1: TIBQuery;
    MainDicZone1ZONE_ID: TIntegerField;
    MainDicZone1SKL_ID: TIntegerField;
    MainDicZone1ZONE_NAME: TIBStringField;
    MainDicZone1ZONE_DESCR: TIBStringField;
    MainDicZone1TM: TDateTimeField;
    MainDicZoneZONE_ID: TIntegerField;
    MainDicZoneSKL_ID: TIntegerField;
    MainDicZoneZONE_NAME: TIBStringField;
    MainDicZoneZONE_DESCR: TIBStringField;
    MainDicZoneTM: TDateTimeField;
    MainDicMenKLN_ID: TIntegerField;
    MainDicMenKLN_FIO: TIBStringField;
    MemCENNIKold_money: TFloatField;
    procedure MemCENNIKCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  logfile: textfile;

implementation




{$R *.DFM}

procedure TDataModule1.MemCENNIKCalcFields(DataSet: TDataSet);
begin
if MemCENNIK.fieldbyname('TW_LENGTH').asfloat*MemCENNIK.fieldbyname('TW_WIDTH').asfloat <> 0 then
  MemCENNIK.fieldbyname('TW_KWM_PRICE').asfloat:=MemCENNIK.fieldbyname('TW_MROZ').asfloat / ( MemCENNIK.fieldbyname('TW_LENGTH').asfloat*MemCENNIK.fieldbyname('TW_WIDTH').asfloat)
  else
MemCENNIK.fieldbyname('TW_KWM_PRICE').asfloat:=0;

{
Групповой тип:
---00  - бракованый товар
---01 - хороший товар, на ценнике, кол-во - 1 шт.
---02 - товар с весов, количество - в штрих коде
[20,21,22]
000000 - 6 символов - АРТИКУЛ из склада
0000 4 символа - вес с весов,
Если ноль - выводится запрос на количество товара
вес вида 0.435 кг.
}


if MemCENNIK.fieldbyname('TW_BRAK').asstring='1'
  then
    MemCENNIK.fieldbyname('BAR_CODE').asstring:='20'+right('000000'+MemCENNIK.fieldbyname('TW_ART').asstring, 6)
  ELSE
    MemCENNIK.fieldbyname('BAR_CODE').asstring:='21'+right('000000'+MemCENNIK.fieldbyname('TW_ART').asstring, 6);


MemCENNIK.fieldbyname('BAR_CODE').asstring:=MemCENNIK.fieldbyname('BAR_CODE').asstring+'1000';



end;

end.
