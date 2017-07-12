unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery,
  JvExStdCtrls, JvCombobox, JvColorCombo;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBQuery1INFORMER_DATA_ID: TIntegerField;
    IBQuery1DOC_TEXT: TIBStringField;
    IBQuery1TM0: TDateTimeField;
    IBQuery1TM1: TDateTimeField;
    IBQuery1TM2: TDateTimeField;
    IBQuery1DOC_STATUS: TIntegerField;
    IBQuery1DOC_STATUS_DESC: TIBStringField;
    IBQuery1SKL_SHORT: TIBStringField;
    IBQuery1SHOP_COLOR: TIntegerField;
    IBQuery1STATUS_COLOR: TIntegerField;
    IBTransaction1: TIBTransaction;
    Button2: TButton;
    Button1: TButton;
    JvFontComboBox1: TJvFontComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
