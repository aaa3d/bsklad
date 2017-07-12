unit ExpCas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, IBDatabase, Db, IBCustomDataSet, IBQuery;

type
  TEXP_CAS = class(TForm)
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    Button1: TButton;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EXP_CAS: TEXP_CAS;

implementation

uses Data1;

{$R *.DFM}

procedure TEXP_CAS.Button1Click(Sender: TObject);
var f: textfile;
line: string;

begin
  assignfile(f, filenameEdit1.filename);
  rewrite(f);
  writeln(f,'Товары;;;;;;;;;;;;;');
  writeln(f,'Товар №;Наименование 1;Наименование 2;Цена;Срок хранения;Вес тары;Код;Код группы;Сообщение №;Логотип;Начало продаж;Количество;Сумма;Вес');


  ibquery1.SQL.text:='select tw_number, tw_nam, (select money from tw_mroz(tw.tw_id, :shop_id)) tw_mroz, tw_art '+
   '  from tw where tw_number>0 and not tw_brak=1';
  ibquery1.Open;

  line:='';
  while not ibquery1.Eof do
  begin
    line:=ibquery1.fieldbyname('TW_NUMBER').asstring+';';
    line:=line+ copy(ibquery1.fieldbyname('TW_NAM').asstring, 1, 24)+';';
    line:=line+ copy(ibquery1.fieldbyname('TW_NAM').asstring, 25, 24)+';';
    line:=line+ibquery1.fieldbyname('TW_MROZ').asstring+';0;0;';
    line:=line+ibquery1.fieldbyname('TW_ART').asstring+';22;0;;;;;;';
    writeln(f, line);
    ibquery1.Next;
  end;

  closefile(f);






end;

end.
