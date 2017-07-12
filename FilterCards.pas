unit FilterCards;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RXSpin, Mask, ToolEdit, CurrEdit, DBCtrls, Db,
  IBCustomDataSet, IBQuery;

type
  TFFilter = class(TForm)
    BitBtn1: TBitBtn;
    BtnSetFilter: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CB1: TCheckBox;
    CB2: TCheckBox;
    DateEdit1: TDateEdit;
    RxSpinEdit1: TRxSpinEdit;
    Label4: TLabel;
    RxSpinEdit2: TRxSpinEdit;
    DateEdit2: TDateEdit;
    RxSpinEdit3: TRxSpinEdit;
    RxSpinEdit4: TRxSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CB3: TCheckBox;
    CB4: TCheckBox;
    DateEdit3: TDateEdit;
    RxSpinEdit5: TRxSpinEdit;
    Label11: TLabel;
    RxSpinEdit6: TRxSpinEdit;
    DateEdit4: TDateEdit;
    RxSpinEdit7: TRxSpinEdit;
    RxSpinEdit8: TRxSpinEdit;
    Label16: TLabel;
    Label17: TLabel;
    CB5: TCheckBox;
    CB6: TCheckBox;
    DateEdit5: TDateEdit;
    RxSpinEdit9: TRxSpinEdit;
    Label18: TLabel;
    RxSpinEdit10: TRxSpinEdit;
    DateEdit6: TDateEdit;
    RxSpinEdit11: TRxSpinEdit;
    RxSpinEdit12: TRxSpinEdit;
    Label23: TLabel;
    CB7: TCheckBox;
    Label24: TLabel;
    RxSpinEdit13: TRxSpinEdit;
    Label25: TLabel;
    RxSpinEdit14: TRxSpinEdit;
    Label26: TLabel;
    CB8: TCheckBox;
    CB9: TCheckBox;
    Label27: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CB10: TCheckBox;
    Label28: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label29: TLabel;
    CB11: TCheckBox;
    RxSpinEdit15: TRxSpinEdit;
    Label30: TLabel;
    CB12: TCheckBox;
    Label31: TLabel;
    CB13: TCheckBox;
    Label32: TLabel;
    DateEdit7: TDateEdit;
    Label33: TLabel;
    DateEdit8: TDateEdit;
    QListShops: TIBQuery;
    DsListShops: TDataSource;
    QRegUsersList: TIBQuery;
    DSRegUsersList: TDataSource;
    QRegUsersListKLN_ID: TIntegerField;
    QRegUsersListKLN_FULL: TIBStringField;
    QListShopsSHOP_ID: TIntegerField;
    QListShopsSHOP_NAME: TIBStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label34: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    RxSpinEdit16: TRxSpinEdit;
    Label5: TLabel;
    CB14: TCheckBox;
    KLN_FIO: TEdit;
    Label35: TLabel;
    CB15: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    QSkid: TIBQuery;
    DSSkid: TDataSource;
    QSkidCARDSKID_ID: TIntegerField;
    QSkidNAME: TIBStringField;
    cb16: TCheckBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    KLN_BIRTHDAY_OF_YEAR_FROM: TMaskEdit;
    KLN_BIRTHDAY_OF_YEAR_TO: TMaskEdit;
    Label39: TLabel;
    Label40: TLabel;
    cb20: TCheckBox;
    cb21: TCheckBox;
    Label41: TLabel;
    cb22: TCheckBox;
    Label42: TLabel;
    cb23: TCheckBox;
    comboRekl: TComboBox;
    comboSMS: TComboBox;
    comboPers: TComboBox;
    comboSex: TComboBox;
    procedure CB1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSetFilterClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getFilterInfo: String;
    function getFilterSQL: String;
  end;

var
  FFilter: TFFilter;
  _save_ShopName_ID : Longint = -1;
  _save_KLNName_ID : LongInt = -1; //ID ��� �������������� �������� ������� � ����. ���
  _save_CARDSKID_ID : LongInt = -1;

implementation

uses Data1, JouCard;

{$R *.DFM}
Const

Filter1 = '(�������. ����� �: %s) ';
Filter2 = '(�������. ����� ��: %s) ';
Filter3 = '(������ ����� �: %s) ';
Filter4 = '(������ ����� ��: %s) ';
Filter5 = '(������� �� ����� �: %s) ';
Filter6 = '(������� �� ����� ��: %s) ';
Filter7 = '(����. ������: �� %s �� %s) ';
Filter8 = '(������� ������: %s) ';
Filter9 = '(����� ������: �� %s �� %s) ';
Filter10 = '(����� ������: �� %s �� %s) ';
Filter11 = '(���-�� ������: �� %s �� %s) ';
Filter12 = '(����� �����: %s) ';
Filter13 = '(�� �������: � %s �� %s) ';
Filter16 = '(�� �������: � %s �� %s) ';
Filter14 = '(��� �������: %s) ';
Filter15 = '(����� ������: %s) ';
Filter20 = '(�������� �� ��� ��������: %s) ';
Filter21 = '(�������� �� ��������� ������: %s) ';
Filter22 = '(���: %s) ';
Filter23 = '(�������: %s) ';

Var
 _save_ShopName, _save_KLNName, _save_CARDSKIDName : String; //�������� �������� ��� ����������� �������� �������

procedure TFFilter.CB1Click(Sender: TObject);
Var
 i: integer;
begin
 for i:= 0 to Self.ComponentCount - 1 do
  if ((not (Self.Components[i] is TCheckBox)) and
   (Self.Components[i].Tag = TComponent(Sender).Tag) and (Self.Components[i] is TControl)) then
     TControl(Self.Components[i]).Visible := TCheckBox(Sender).Checked;
// DBLookUpComboBox1.KeyValue := _save_ShopName_ID;
// DBLookUpComboBox2.KeyValue := _save_KLNName_ID;
end;

//���������� ������� �������� ���������� �������
function TFFilter.getFilterInfo():String;
begin
 result := '';
 if CB1.Checked then result := Format(Filter1, [DateTimeToStr(DateEdit1.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit1.Value), Trunc(FFilter.RxSpinEdit2.Value),0,0))]);
 if CB2.Checked then result := Result + '� ' + Format(Filter2, [DateTimeToStr(DateEdit2.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit3.Value), Trunc(FFilter.RxSpinEdit4.Value),0,0))]);
 if CB3.Checked then result := Result + '� ' + Format(Filter3, [DateTimeToStr(DateEdit3.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit5.Value), Trunc(FFilter.RxSpinEdit6.Value),0,0))]);
 if CB4.Checked then result := Result + '� ' + Format(Filter4, [DateTimeToStr(DateEdit4.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit7.Value), Trunc(FFilter.RxSpinEdit8.Value),0,0))]);
 if CB5.Checked then result := Result + '� ' + Format(Filter5, [DateTimeToStr(DateEdit5.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit9.Value), Trunc(FFilter.RxSpinEdit10.Value),0,0))]);
 if CB6.Checked then result := Result + '� ' + Format(Filter6, [DateTimeToStr(DateEdit6.Date +
      EncodeTime(Trunc(FFilter.RxSpinEdit11.Value), Trunc(FFilter.RxSpinEdit12.Value),0,0))]);
 if CB7.Checked then result := Result + '� ' + Format(Filter7, [RxSpinEdit13.Text, RxSpinEdit14.Text]);
 if CB15.Checked then result := Result + '� ' + Format(Filter15, [_save_CARDSKIDName]);
 if CB9.Checked then result := Result + '� ' + Format(Filter9, [CurrencyEdit3.Text, CurrencyEdit1.Text]);
 if CB10.Checked then result := Result + '� ' + Format(Filter10, [CurrencyEdit4.Text, CurrencyEdit2.Text]);
 if CB11.Checked then result := Result + '� ' + Format(Filter11, [RxSpinEdit16.Text, RxSpinEdit15.Text]);
 if CB13.Checked then result := Result + '� ' + Format(Filter13, [DateToStr(DateEdit7.Date),
    DateToStr(DateEdit8.Date)]);
 if CB16.Checked then result := Result + '� ' + Format(Filter16, [KLN_BIRTHDAY_OF_YEAR_FROM.text,
    KLN_BIRTHDAY_OF_YEAR_TO.text]);

 if CB14.Checked then result := Result + '� ' + Format(Filter14, [KLN_FIO.Text]);
 if CB12.Checked then result := Result + '� ' + Format(Filter12, [_save_KLNName]);
 if CB8.Checked then result := Result + '� ' + Format(Filter8, [_save_ShopName]);


 if CB20.Checked then result := Result + '� ' + Format(Filter20, [comboSMS.Text]);
 if CB21.Checked then result := Result + '� ' + Format(Filter21, [comboPers.Text]);
 if CB22.Checked then result := Result + '� ' + Format(Filter22, [comboSex.Text]);
 if CB23.Checked then result := Result + '� ' + Format(Filter23, [comboRekl.Text]);


 If result = '' then result := '��� ����������'
        else
 If (result[1] = '�') then delete(result,1,2);

end;

//���������� ����� ������� � ����� ������� ������� - ��� ������� ������ ���������� ����
function TFFilter.getFilterSQL():String;
begin
 result := '';
end;

procedure TFFilter.FormActivate(Sender: TObject);
begin
 KLN_BIRTHDAY_OF_YEAR_FROM.EditMask := '##'+dateseparator+'##';
  KLN_BIRTHDAY_OF_YEAR_TO.EditMask := '##'+dateseparator+'##';

 QListShops.Open;
 QListShops.MoveBy(10); //����� �������� ��������� �������� ���, � �� ����� ������� � ������
 QListShops.First;
 if (_save_ShopName_ID < 0) then //� ������ ��� ���� ������ �������� ������� � ������
  begin
   DBLookUpComboBox1.KeyValue := QListShopsShop_ID.Value;
   _save_ShopName_ID := QListShopsShop_ID.Value;
  end
 else
  DBLookUpComboBox1.KeyValue := _save_ShopName_ID;


 QRegUsersList.Open;
 QRegUsersList.MoveBy(10);
 QRegUsersList.First;
 if (_save_KLNName_ID < 0) then //� ������ ��� ���� ������ �������� ������� � ������
  begin
   DBLookUpComboBox2.KeyValue := QRegUsersListKLN_ID.Value;
   _save_KLNName_ID := QRegUsersListKLN_ID.Value;
  end
 else
  DBLookUpComboBox2.KeyValue := _save_KLNName_ID;

 QSkid.Open;
 QSkid.MoveBy(10);
 QRegUsersList.First;
 if (_save_KLNName_ID < 0) then //� ������ ��� ���� ������ �������� ������� � ������
  begin
   DBLookUpComboBox3.KeyValue := QSkidCARDSKID_ID.Value;
   _save_CARDSKID_ID := QSkidCARDSKID_ID.Value;
  end
 else
  DBLookUpComboBox3.KeyValue := _save_CARDSKID_ID;


end;

procedure TFFilter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 QListShops.Close;
 QRegUsersList.Close;
 QSkid.Close;
end;

procedure TFFilter.BtnSetFilterClick(Sender: TObject);
begin
 if CB12.Checked then //klient
  begin
   _save_KLNName:= Trim(DBLookUpComboBox2.Text);
   _save_KLNName_ID := DBLookUpComboBox2.KeyValue;
  end;
 if CB8.Checked then
  begin
   _save_ShopName:= Trim(DBLookUpComboBox1.Text);
   _save_ShopName_ID := DBLookUpComboBox1.KeyValue;
  end;

 if CB15.Checked then
  begin
   _save_CARDSKIDName:= Trim(DBLookUpComboBox3.Text);
   _save_CARDSKID_ID := DBLookUpComboBox3.KeyValue;
  end;
end;

procedure TFFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
// if (key=#13) then
//   RxDBGrid1DblClick(Sender);
 if key=#27 then close;
end;

procedure TFFilter.DBLookupComboBox2Click(Sender: TObject);
begin
// _save_KLNName_ID := DBLookUpComboBox2.KeyValue;
end;

procedure TFFilter.DBLookupComboBox1Click(Sender: TObject);
begin
// _save_ShopName_ID := DBLookUpComboBox1.KeyValue;
end;

end.
