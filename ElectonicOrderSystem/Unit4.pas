unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inifiles,  IBQuery, IBDatabase, ExtCtrls, DB, IBCustomDataSet;

type
  TForm4 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBQuery1TW_ID: TIntegerField;
    IBQuery1TW_OST: TFloatField;
    IBQuery1TW_ART: TIntegerField;
    IBQuery1TW_NAM: TIBStringField;
    IBQuery1ED_SHORT: TIBStringField;
    IBQuery1TWTREE_ID: TIntegerField;
    IBQuery1TW_KWM_ONE: TFloatField;
    IBQuery1TW_MROZ: TFloatField;
    IBQuery1TWTREE_FULL: TIBStringField;
    IBQuery1MONEY1: TFloatField;
    IBQuery1MONEY2: TFloatField;
    IBQuery1MONEY3: TFloatField;
    IBQuery1MONEY4: TFloatField;
    IBQuery1MONEY5: TFloatField;
    IBQuery1TW_BRAK: TIBStringField;
    IBQuery1MON_NAL: TFloatField;
    IBQuery1MON_BNAL: TFloatField;
    IBQuery1BNAL_SALE: TIntegerField;
    IBQuery1NAL_SALE: TIntegerField;
    IBQuery1KLN_FULL: TIBStringField;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure Log(msg: string);
var str: string;
  f: textfile;
begin
  str:=formatdatetime('yyyy-mm-dd hh:nn:ss', now);
  assignfile(f, 'seo.log');
  if FileExists('seo.log') then
    append(f)
  else
    rewrite(f);

  writeln(f, str+': '+msg);
  closefile(f);


end;

procedure TForm4.FormCreate(Sender: TObject);
var inifile: TIniFile;

begin
//aaa:c:\base\current\bsklad2005.fdb;Локальная CURRENT;;

 inifile := TIniFile.Create('.\seo.ini');
 ibdatabase1.DatabaseName:=iniFile.ReadString('SETTINGS', 'DATABASE_NAME', '');

 inifile.Destroy;


 IbDataBase1.Connected:=true;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  log('Запуск импорта заказов');
end;

end.
