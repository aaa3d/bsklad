unit BarScanerEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,b_utils,b_dbutils,Unit_AMC100F, Db, IBCustomDataSet,
  IBQuery;

type
  TBAR_SCANER_EDIT = class(TForm)
    SaveButton: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Memo1: TMemo;
    IBQuery1: TIBQuery;
    Label5: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label6: TLabel;
    procedure SaveButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    
  private
    { Private declarations }
    CFG_ID, CFG2_ID, CFG3_ID: integer;

    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;


  public
    { Public declarations }
  end;

var
  BAR_SCANER_EDIT: TBAR_SCANER_EDIT;

implementation

uses DATA1, MAINFORM;

{$R *.DFM}

procedure TBAR_SCANER_EDIT.READY_COM_DATAMessage(var AMessage: TMessage);
begin
  if gl_LAST_BAR_CODE<>'' then
    memo1.Text:=gl_LAST_BAR_CODE;
end;


procedure TBAR_SCANER_EDIT.SaveButtonClick(Sender: TObject);
begin
//  Save;
  try
    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'POS_SCANER_COM_PORT');
    IBSAVE_ADD('CFG_BIG', COMPUTERNAME);
    IBSAVE_ADD('CFG_SET1', SHOPID);
    IBSAVE_ADD('CFG_SET2', Combobox1.itemindex);
    IBSAVE_DOC('CFG', CFG_ID);


    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'POS_SCANER_COM_PORT2');
    IBSAVE_ADD('CFG_BIG', COMPUTERNAME);
    IBSAVE_ADD('CFG_SET1', SHOPID);
    IBSAVE_ADD('CFG_SET2', Combobox2.itemindex);
    IBSAVE_DOC('CFG', CFG2_ID);

    IBSAVE_CLEAR;
    IBSAVE_ADD('CFG_NAME', 'DISPLAY_COM_PORT');
    IBSAVE_ADD('CFG_BIG', COMPUTERNAME);
    IBSAVE_ADD('CFG_SET1', SHOPID);
    IBSAVE_ADD('CFG_SET2', Combobox3.itemindex);
    IBSAVE_DOC('CFG', CFG3_ID);


    Datamodule1.IBTransaction2.Commit;
  except
    Datamodule1.IBTransaction2.Rollback;
  end;





  

  Close;
end;

procedure TBAR_SCANER_EDIT.FormActivate(Sender: TObject);
begin

 Edit1.Text:=COMPUTERNAME;

 ibquery1.SQL.Text:='select SHOP.SHOP_NAME  from SHOP WHERE SHOP_ID=:SHOP_ID';
 ibquery1.pARAMbYnAME('SHOP_ID').AsInteger:=SHOPID;
 ibquery1.Open;
 Edit2.Text:=ibquery1.FieldByName('SHOP_NAME').asstring;
 ibquery1.close;


 //
 CFG_ID:=-1;
 CFG2_ID:=-1;
 CFG3_ID:=-1;
 ibquery1.SQL.Text:='SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID';
 ibquery1.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
 ibquery1.ParamByName('SHOP_ID').asinteger:=SHOPID;
 ibquery1.Open;
 if not ibquery1.Eof then
 begin
  CFG_ID:=ibquery1.fieldbyname('CFG_ID').asinteger;
  Combobox1.ItemIndex:=ibquery1.fieldbyname('CFG_SET2').asinteger;
 end;
 ibquery1.close;

  ibquery1.SQL.Text:='SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT2'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID';
 ibquery1.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
 ibquery1.ParamByName('SHOP_ID').asinteger:=SHOPID;
 ibquery1.Open;
 if not ibquery1.Eof then
 begin
  CFG2_ID:=ibquery1.fieldbyname('CFG_ID').asinteger;
  Combobox2.ItemIndex:=ibquery1.fieldbyname('CFG_SET2').asinteger;
 end;
 ibquery1.close;

   ibquery1.SQL.Text:='SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''DISPLAY_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID';
 ibquery1.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
 ibquery1.ParamByName('SHOP_ID').asinteger:=SHOPID;
 ibquery1.Open;
 if not ibquery1.Eof then
 begin
  CFG3_ID:=ibquery1.fieldbyname('CFG_ID').asinteger;
  Combobox3.ItemIndex:=ibquery1.fieldbyname('CFG_SET2').asinteger;
 end;
 ibquery1.close;

end;

procedure TBAR_SCANER_EDIT.ComboBox1Change(Sender: TObject);
begin
  try
  MAIN_FORM.Comm1.Close;
  except
  end;

  try
  MAIN_FORM.Comm1.DeviceName:=Combobox1.Text;
  MAIN_FORM.Comm1.Open;
  except
  end;

end;

procedure TBAR_SCANER_EDIT.ComboBox2Change(Sender: TObject);
begin
  try
  MAIN_FORM.Comm2.Close;
  except
  end;

  try
  MAIN_FORM.Comm2.DeviceName:=Combobox2.Text;
  MAIN_FORM.Comm2.Open;
  except
  end;
end;

procedure TBAR_SCANER_EDIT.ComboBox3Change(Sender: TObject);
begin
  try
  MAIN_FORM.Comm3.Close;
  except
  end;

  try
  MAIN_FORM.Comm3.DeviceName:=Combobox3.Text;
  MAIN_FORM.Comm3.Open;
  MAIN_FORM.DISPLAY_SHOW('Проверка первая строка', 'Проверка вторая строка', 'Проверка: Цена', 'Проверка: Итог');

  except
  end;
end;

end.
