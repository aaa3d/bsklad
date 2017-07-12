unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase, IniFiles, Grids,
  DBGrids, ExtCtrls;

type
  TForm4 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Button1: TButton;
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
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    IBQuery2: TIBQuery;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  managers: TStringList;

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

procedure TForm4.Button1Click(Sender: TObject);
var f: textfile;
var dbname: string;
  str: string;
  f1: TextFile;
  i: integer;
begin

  log('Запуск выгрузки прайс-листов');


  try



  ibquery2.Open;

  Application.ProcessMessages;

  if not DirectoryExists('PRICE') then
    CreateDir('PRICE');

  while not ibquery2.Eof do
  begin

      log('Выгрузка прайс-листа для '+IbQuery2.fieldByName('kln_name').asstring);


      if not DirectoryExists('PRICE/'+Ibquery2.FieldByName('KLN_ID').AsString) then
         createDir('PRICE/'+Ibquery2.FieldByName('KLN_ID').AsString);

      assignfile(f, 'PRICE/'+ Ibquery2.FieldByName('KLN_ID').AsString+'/price.txt');
      rewrite(f);


      writeln(f, formatdatetime('dd.mm.yy', now));
      writeln(f, '@Менеджер');
      for I := 0 to managers.Count - 1 do
      begin
        writeln(f, managers.ValueFromIndex[i]);
      end;

      writeln(f, '@@Менеджер');
      writeln(f, '@товар');



      IbQuery1.ParamByName('twdyngroup_id').AsInteger:=16372;
      IbQuery1.ParamByName('twdyngroup_typ').AsInteger:=1;
      IbQuery1.ParamByName('kln_id').AsInteger:=Ibquery2.FieldByName('KLN_ID').AsInteger;
      IbQuery1.ParamByName('frm_id').AsInteger:=2696877;

      ibquery1.Open;

      while not ibquery1.Eof do
      begin

        writeln(f, Ibquery1.FieldByName('twtree_id').AsString+'~'+
        trim(Ibquery1.FieldByName('twtree_full').AsString)+'~'+
        Ibquery1.FieldByName('tw_id').AsString+'~'+
        Ibquery1.FieldByName('tw_art').AsString+'~'+
        trim(Ibquery1.FieldByName('tw_nam').AsString)+'~'+
        trim(Ibquery1.FieldByName('ed_short').AsString)+'~'+
        inttostr(round(Ibquery1.FieldByName('tw_ost').AsFloat*1000))+'~'+
        inttostr(round(Ibquery1.FieldByName('mon_bnal').AsFloat*100))+'~');

        ibquery1.Next;
      end;


      log('Выгружено '+inttostr(IbQuery1.RecordCount)+' позиций');
      ibquery1.Close;

      writeln(f, '@@товар');
      closefile(f);



      ibquery2.Next;
      Application.ProcessMessages;
  end;
  except
  on e: Exception do
  begin
    log(e.Message);
//    Application.ShowException(e);
  end;
  end;


  Close;


end;

procedure TForm4.FormCreate(Sender: TObject);
var inifile: TIniFile;

begin
//aaa:c:\base\current\bsklad2005.fdb;Локальная CURRENT;;

 inifile := TIniFile.Create('.\seo.ini');
 ibdatabase1.DatabaseName:=iniFile.ReadString('SETTINGS', 'DATABASE_NAME', '');

 managers:=TStringList.Create;
 inifile.ReadSectionValues('MANAGERS', managers);




 //managers.Text:=stringreplace(managers.Text, 'MANAGER=', '', [rfReplaceAll]);


 inifile.Destroy;


 IbDataBase1.Connected:=true;





end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  Button1Click(nil);



end;

end.
