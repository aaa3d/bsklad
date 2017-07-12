unit TestBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,data1, Db, IBCustomDataSet, IBQuery,b_DButils,b_utils,
  IBDatabase;

type
  TTEST_BASE = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Repar: TCheckBox;
    Memo1: TMemo;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TEST_BASE: TTEST_BASE;

implementation

{$R *.DFM}

procedure TTEST_BASE.Button1Click(Sender: TObject);
begin
     Checkbox1.Enabled:=False;
     Checkbox2.Enabled:=False;
     Checkbox3.Enabled:=False;
     Checkbox4.Enabled:=False;
     Checkbox5.Enabled:=False;
     Checkbox6.Enabled:=False;
     Repar.Enabled:=False;
     Button1.Enabled:=False;
     Memo1.lines.clear;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     try
       if Checkbox1.checked then begin
          // ѕроверка на потер€нный родительский каталог
          ADD_SQL(DataModule1.IbSaveSQL,'select * from find_delete_twtree(:repar)');
          if REPAR.checked then DataModule1.IbSaveSQL.parambyname('repar').asinteger:=1
                           else DataModule1.IbSaveSQL.parambyname('repar').asinteger:=0;
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('ѕотер€нных "родительских" каталогов товаров не обнаружено!')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add('Ѕез "родител€" раздел товаров : "'+DataModule1.IbSaveSQL.fieldbyname('TWTREE_FULL').asstring+'"!');
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Checkbox2.checked then begin
          // ѕроверка на потер€нный родительский каталог контактов
          ADD_SQL(DataModule1.IbSaveSQL,'select * from find_delete_klntree(:repar)');
          if REPAR.checked then DataModule1.IbSaveSQL.parambyname('repar').asinteger:=1
                           else DataModule1.IbSaveSQL.parambyname('repar').asinteger:=0;
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('ѕотер€нных "родительских" каталогов контактов не обнаружено!')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add('Ѕез "родител€" раздел контактов : "'+DataModule1.IbSaveSQL.fieldbyname('KLNTREE_FULL').asstring+'"!');
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Checkbox3.checked then begin
          // ѕроверка на потер€нный родительский каталог у товаров
          ADD_SQL(DataModule1.IbSaveSQL,'select * from find_delete_tw(:repar)');
          if REPAR.checked then DataModule1.IbSaveSQL.parambyname('repar').asinteger:=1
                           else DataModule1.IbSaveSQL.parambyname('repar').asinteger:=0;
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('ѕотер€нных "родительских" каталогов у товаров не обнаружено!')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add('Ѕез "родител€" товар : '+DataModule1.IbSaveSQL.fieldbyname('TW_ART').asstring+' - "'+DataModule1.IbSaveSQL.fieldbyname('TW_NAM').asstring+'"!');
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Checkbox4.checked then begin
          // ѕроверка на потер€нный родительский каталог у товаров
          ADD_SQL(DataModule1.IbSaveSQL,'select * from find_delete_kln(:repar)');
          if REPAR.checked then DataModule1.IbSaveSQL.parambyname('repar').asinteger:=1
                           else DataModule1.IbSaveSQL.parambyname('repar').asinteger:=0;
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('ѕотер€нных "родительских" каталогов у контактов не обнаружено!')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add('Ѕез "родител€" контакт : '+DataModule1.IbSaveSQL.fieldbyname('kln_full').asstring+' !');
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Checkbox5.checked then begin
          // ѕроверка на потер€нный родительский каталог у товаров
          ADD_SQL(DataModule1.IbSaveSQL,'select distinct tw_id from check_delete_tw');
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('Ќе обнаружено удаленных товаров, используемых в документах')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add('”дален товар с кодом '+DataModule1.IbSaveSQL.fieldbyname('TW_ID').asstring+'. »справить невозможно!');
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Checkbox6.checked then begin
          // ѕроверка на несоответствие брак-хороший
          ADD_SQL(DataModule1.IbSaveSQL,'select * from check_brak(:r)');
          if REPAR.checked then DataModule1.IbSaveSQL.paramByname('R').asinteger:=1
          else DataModule1.IbSaveSQL.paramByname('R').asinteger:=0;
          DataModule1.IbSaveSQL.Open;
          if DataModule1.IbSaveSQL.eof then
           Memo1.lines.Add('Ќе обнаружено товаров с несоответствием брак-хороший')
          else begin
             while not DataModule1.IbSaveSQL.eof do begin
               Memo1.lines.add(DataModule1.IbSaveSQL.fieldbyname('Mess').asstring);
               DataModule1.IbSaveSQL.next;
             end;
          end;
       end;
       if Repar.checked then
       Memo1.lines.Add('¬се обнаруженные ошибки по возможности исправлены!');
       Datamodule1.IBTransaction2.Commit;
     Except
       Memo1.lines.Add('ќшибка при выполнении операции !!!!');
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     Checkbox1.Enabled:=True;
     Checkbox2.Enabled:=True;
     Checkbox3.Enabled:=True;
     Checkbox4.Enabled:=True;
     Checkbox5.Enabled:=True;
     Checkbox6.Enabled:=True;
     Repar.Enabled:=True;
     Button1.Enabled:=True;
end;

end.
