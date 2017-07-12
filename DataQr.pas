unit DataQr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils, Db, IBCustomDataSet, IBQuery, IBDatabase, RxMemDS;

type
  TDataModule3 = class(TDataModule)
    PersTorgTransaction: TIBTransaction;
    QrPersTorg: TIBQuery;
    QrPers3: TIBQuery;
    QrPers3SUMM: TFloatField;
    QrPers3SHOP_NAME: TIBStringField;
    QrPers2: TIBQuery;
    QrPers2TW_ART: TIntegerField;
    QrPers2TW_NAM: TIBStringField;
    QrPers2TW_KOL: TFloatField;
    QrPers2TW_SUMM: TFloatField;
    DsPersTorg: TDataSource;
    DsPers3: TDataSource;
    DsPers2: TDataSource;
    QrPers4: TIBQuery;
    QrPers4TWTREE_ID: TIntegerField;
    QrPers4TWTREE_FULL: TIBStringField;
    QrPers4TW_SUMM: TFloatField;
    DsPers4: TDataSource;
    QrPers2TW_ID: TIntegerField;
    QrPers3TW_NDS: TFloatField;
    QrPers3TW_NSP: TFloatField;
    QrPers4TW_NDS: TFloatField;
    QrPers4TW_NSP: TFloatField;
    QrPers2TW_NDS: TFloatField;
    QrPers2TW_NSP: TFloatField;
    ReTransaction: TIBTransaction;
    QueryRe1: TIBQuery;
    QueryRe2: TIBQuery;
    QueryRe3: TIBQuery;
    QueryRe4: TIBQuery;
    MemPost: TRxMemoryData;
    MemPostid: TIntegerField;
    MemPostids: TIntegerField;
    MemPosttyp: TIntegerField;
    MemPostpntyp_id: TIntegerField;
    MemPostshop_id: TIntegerField;
    MemPostskl_id: TIntegerField;
    MemPostdt: TDateField;
    MemPosttw_kol: TFloatField;
    MemPostmen: TIntegerField;
    MemPostpost: TIntegerField;
    MemPosttw_id2: TIntegerField;
    MemPost2: TRxMemoryData;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    QrPersTorgRN_ID: TIntegerField;
    QrPersTorgRN_DATE: TDateTimeField;
    QrPersTorgSKL_ID2: TIntegerField;
    QrPersTorgRN_NUM_FULL: TIBStringField;
    QrPersTorgRNTYP_ID: TIntegerField;
    QrPersTorgSKL_FULL: TIBStringField;
    QrPersTorgTW_ID: TIntegerField;
    QrPersTorgTW_BRAK: TIBStringField;
    QrPersTorgTW_ART: TIntegerField;
    QrPersTorgTW_NAM: TIBStringField;
    QrPersTorgED_SHORT: TIBStringField;
    QrPersTorgTW_KOL: TFloatField;
    QrPersTorgTW_MONEY: TFloatField;
    QrPersTorgTW_SKID: TFloatField;
    QrPersTorgTW_SKIDDOLL: TFloatField;
    QrPersTorgTW_SKIDCARD: TFloatField;
    QrPersTorgTW_MONEY0: TFloatField;
    QrPersTorgSHOP_NAME: TIBStringField;
    QrPersTorgRNS_ID: TIntegerField;
    QrPersTorgNDS: TFloatField;
    QrPersTorgNSP: TFloatField;
    QrPersTorgRVID_ID: TIntegerField;
    QrPersTorgRVID_NAME: TIBStringField;
    QrPersTorgTW_SUMM: TFloatField;
    QrPersTorgTW_NSP: TFloatField;
    QrPersTorgTW_NDS: TFloatField;
    QrPers5: TIBQuery;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DsPers5: TDataSource;
    QrPers5RVID_NAME: TIBStringField;
    QrPers6: TIBQuery;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DsPers6: TDataSource;
    QrPers6RNS_TABEL: TIntegerField;
    QrPers6US_FIO: TStringField;
    QrTabel: TIBQuery;
    QrTabelKLN_ID: TIntegerField;
    QrTabelKLN_FULL: TIBStringField;
    QrTabelKLN_TABEL: TIntegerField;
    QrPers6CNT: TIntegerField;
    QrPers7: TIBQuery;
    DsPers7: TDataSource;
    QrPers7ART: TIntegerField;
    QrPers7ED: TIBStringField;
    QrPers7KOL: TFloatField;
    QrPers7TW_NAM: TIBStringField;
    QrPers8: TIBQuery;
    DsPers8: TDataSource;
    QrPers8CNT: TIntegerField;
    QrPers8SUMM: TFloatField;
    QrPers8TW_NSP: TFloatField;
    QrPers8TW_NDS: TFloatField;
    QrPers8KLN_ID: TIntegerField;
    QrPers8KLN_KKM_PASSWORD: TIBStringField;
    QrPers9: TIBQuery;
    DsPers9: TDataSource;
    QrPers9CNT: TIntegerField;
    QrPers9SUMM: TFloatField;
    QrPers9TW_NSP: TFloatField;
    QrPers9TW_NDS: TFloatField;
    QrPers9KASSA_ID: TIntegerField;
    QrPers9KKM_NAME: TIBStringField;
    QrPers3PO_SUMM: TFloatField;
    QrPersTorgPO_SUMM: TFloatField;
    QrPersTorgTW_SEB: TFloatField;
    QrPersTorgTW_SEB_SUMM: TFloatField;
    QrPersTorgKLN_NAME: TIBStringField;
    QrPers6NAC: TFloatField;
    QrPers2TW_SEB: TFloatField;
    QrPers2TW_MONEY: TFloatField;
    QrPers4tw_weight: TFloatField;
    QrPers2tw_weight: TFloatField;
    procedure QrPers6CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{$R *.DFM}

procedure TDataModule3.QrPers6CalcFields(DataSet: TDataSet);
begin
   if DataModule3.QrTABEL.locate('KLN_TABEL',DataModule3.QrPers6.fieldByname('RNS_TABEL').asinteger,[]) then
   DataModule3.QrPers6.fieldByname('US_FIO').asstring:=DataModule3.QrTABEL.fieldByname('KLN_FULL').asstring
   else DataModule3.QrPers6.fieldByname('US_FIO').asstring:='<в списке отсутствует>';
end;

end.
