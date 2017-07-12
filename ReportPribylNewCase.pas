unit ReportPribylNewCase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1, Db, IBCustomDataSet, IBQuery, IBDatabase, RxLookup,
  ExtCtrls;

type
  TReport_pribyl_new_case = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    CaseTransaction: TIBTransaction;
    QueryShop: TIBQuery;
    QueryShopSHOP_ID: TIntegerField;
    QueryShopSHOP_NAME: TIBStringField;
    DsShop: TDataSource;
    SHOP: TRxDBLookupCombo;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    QueryOwner: TIBQuery;
    DsOwner: TDataSource;
    OW: TRxDBLookupCombo;
    RadioButton12: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Bevel9: TBevel;
    Bevel10: TBevel;
    QueryOwnerOW_ID: TIntegerField;
    QueryOwnerOW_FULL: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_pribyl_new_case: TReport_pribyl_new_case;

implementation

{$R *.DFM}

procedure TReport_pribyl_new_case.Button1Click(Sender: TObject);
begin
    if Radiobutton1.checked then tag:=1;
    if Radiobutton2.checked then tag:=2;
    if Radiobutton3.checked then tag:=3;
    if Radiobutton4.checked then tag:=4;
    if Radiobutton5.checked then tag:=5;
    if Radiobutton6.checked then tag:=6;
    if Radiobutton7.checked then tag:=7;
    if Radiobutton8.checked then tag:=8;
    if Radiobutton9.checked then tag:=9;
    if Radiobutton10.checked then tag:=10;
    if Radiobutton11.checked then tag:=11;
    if Radiobutton12.checked then tag:=12;
    if Radiobutton13.checked then tag:=13;
    if Radiobutton14.checked then tag:=14;
    close;
end;

procedure TReport_pribyl_new_case.FormShow(Sender: TObject);
begin
  caseTransaction.Active:=false;
  QueryShop.close;
  QueryShop.open;
  QueryOwner.close;
  QueryOwner.ParamByname('REPPRIB_ID').asinteger:=QueryOwner.Tag;
  QueryOwner.Open;
  if QueryOwner.eof then begin
     Radiobutton11.enabled:=False;
     Radiobutton12.enabled:=False;
     Radiobutton13.enabled:=False;
     Radiobutton14.enabled:=False;
  end else begin
     Ow.value:=QueryOwner.fieldByname('OW_ID').asstring;
  end;
  if QueryShop.eof then begin
     Radiobutton7.enabled:=False;
     Radiobutton8.enabled:=False;
  end else begin
     shop.value:=QueryShop.fieldByname('SHOP_ID').asstring;
  end;
  RadioButton1.Onclick(Sender);
  tag:=0;
end;

procedure TReport_pribyl_new_case.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TReport_pribyl_new_case.RadioButton1Click(Sender: TObject);
begin
    OW.enabled:=Radiobutton11.checked or Radiobutton12.checked or Radiobutton13.checked or Radiobutton14.checked;
    SHOP.enabled:=Radiobutton7.checked or Radiobutton8.checked;
end;

end.
