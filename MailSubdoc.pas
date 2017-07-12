unit MailSubdoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, RxLookup, Db, IBCustomDataSet, IBQuery,
  IBDatabase;

type
  TMAIL_SUBDOC = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Memo1: TMemo;
    PNTYP: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIL_SUBDOC: TMAIL_SUBDOC;

implementation

{$R *.DFM}

procedure TMAIL_SUBDOC.FormShow(Sender: TObject);
begin
     GET_DEFAULT;
     Memo1.lines.clear;
     PNTYP.value:=DataModule1.MainDicPnTyp.fieldByname('PNTYP_ID').asstring;
end;

procedure TMAIL_SUBDOC.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TMAIL_SUBDOC.Button1Click(Sender: TObject);
begin
     CheckBox1.Enabled:=False;
     CheckBox2.Enabled:=False;
     CheckBox3.Enabled:=False;
     CheckBox4.Enabled:=False;
     memo1.lines.clear;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        if Checkbox1.checked then begin
           ADD_SQL(DataModule1.IbSaveSQL,'select * from subdoc_mail_to_pn1(:MAIL_ID,:SHOP_ID,:US_ID,:PNTYP_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=MAIL_SUBDOC.tag;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('PNTYP_ID').asinteger:=strtoint(PNTYP.value);
           DataModule1.IbSaveSQL.Open;
           if DataModule1.IbSaveSQL.eof then Memo1.lines.add('Приходная накладная НЕ ОФОРМЛЕНА!') else
           Memo1.lines.add('Создана приходная накладная № '+DataModule1.IbSaveSQL.fieldByname('PN_NUM_FULL').asstring+' от '+date_sokr(date()));
        end;
        if Checkbox2.checked then begin
           ADD_SQL(DataModule1.IbSaveSQL,'select * from subdoc_mail_to_per2(:MAIL_ID,:SHOP_ID,:US_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=MAIL_SUBDOC.tag;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.Open;
           if DataModule1.IbSaveSQL.eof then Memo1.lines.add('Накладные перемещения НЕ ОФОРМЛЕНЫ!') else begin
             while not DataModule1.IbSaveSQL.eof do begin
                Memo1.lines.add('Создана '+DataModule1.IbSaveSQL.fieldByname('DOC_NUM_FULL').asstring+' от '+date_sokr(date()));
                DataModule1.IbSaveSQL.next;
             end;
           end;
        end;
        if Checkbox3.checked then begin
           ADD_SQL(DataModule1.IbSaveSQL,'select * from subdoc_mail_to_remon1(:MAIL_ID,:SHOP_ID,:US_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=MAIL_SUBDOC.tag;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.Open;
           if DataModule1.IbSaveSQL.eof then Memo1.lines.add('Акт переоценки НЕ ОФОРМЛЕН!') else
           Memo1.lines.add(DataModule1.IbSaveSQL.fieldByname('REMON_NUM_FULL').asstring);
        end;
        if Checkbox4.checked then begin
           ADD_SQL(DataModule1.IbSaveSQL,'select * from subdoc_mail_to_TWMON(:MAIL_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=MAIL_SUBDOC.tag;
           DataModule1.IbSaveSQL.Open;
           if DataModule1.IbSaveSQL.eof then Memo1.lines.add('Дополнительные цены оставлены без изменений!') else begin
             while not DataModule1.IbSaveSQL.eof do begin
                Memo1.lines.add('Именены доп цены у товара: '+DataModule1.IbSaveSQL.fieldByname('TW_ART').asstring+' '+DataModule1.IbSaveSQL.fieldByname('TW_NAM').asstring);
                DataModule1.IbSaveSQL.next;
             end;
           end;
        end;
        Datamodule1.IBTransaction2.commit;
     Except
     	on e: Exception do
        begin
        	Messbox('Ошибка!'+chr(13)+e.message,'',48);
        	Datamodule1.IBTransaction2.Rollback;
        end;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

end.
