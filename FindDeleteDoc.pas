unit FindDeleteDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit,Data1,b_utils,b_dbutils, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TFIND_DELETE_DOC = class(TForm)
    Label1: TLabel;
    DOC: TComboBox;
    Label2: TLabel;
    ID: TRxCalcEdit;
    Button1: TButton;
    Memo1: TMemo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DOCChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIND_DELETE_DOC: TFIND_DELETE_DOC;

implementation

{$R *.DFM}

procedure TFIND_DELETE_DOC.FormShow(Sender: TObject);
begin
  Memo1.lines.clear;
  DOC.itemindex:=0;
end;

procedure TFIND_DELETE_DOC.Button1Click(Sender: TObject);
var
  s:ansistring;
  US:integer;
begin
     case DOC.itemindex of
       0: s:='PN';
       1: s:='RN';
       2: s:='SPIS';
       3: s:='PER';
       4: s:='ST';
       5: s:='MAIL';
     end;
     Memo1.lines.clear;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select str,us_id,tm from arcdel where tabname="'+S+'" and tabname_id=:id_doc');
     QueryWork.parambyname('ID_DOC').asinteger:=trunc(ID.value);
     QueryWork.open;
     if QueryWork.eof then Memo1.lines.add('Ќе найдено записи об удалении документа!')
     else begin
       Memo1.lines.add(DOC.text+' "'+QueryWork.fieldbyname('STR').asstring+' удалена '+
       datetimetostr(QueryWork.fieldbyname('TM').asdatetime));
       US:=QueryWork.fieldbyname('US_ID').asinteger;
       ADD_SQL(QueryWork,'select kln_fam||" "||bg_toupper(BG_left(kln_name,1))||". "||bg_toupper(BG_left(kln_name2,1))||"." as US_FIO from kln where kln_id=:us_id');
       QueryWork.parambyname('US_ID').asinteger:=US;
       QueryWork.open;
       if QueryWork.eof then Memo1.lines.add('неизвестным пользователем!')
       else Memo1.lines.add('пользователем: '+QueryWork.fieldbyname('US_FIO').asstring);
       QueryWork.Close;
     end;
end;

procedure TFIND_DELETE_DOC.DOCChange(Sender: TObject);
begin
  Memo1.lines.clear;
end;

end.