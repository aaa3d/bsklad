unit Import_1C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ToolEdit, Db, IBCustomDataSet, IBQuery,
  IBDatabase,VCLUtils,KlnWarn, B_DButils,B_Utils;

type
  TIMP_1C = class(TForm)
    Label3: TLabel;
    PathFile: TEdit;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IMP_1C: TIMP_1C;

implementation

uses Data1;

{$R *.DFM}

procedure TIMP_1C.FormShow(Sender: TObject);
begin
   WorkTransaction.Active:=False;
   QueryWork.SQL.Clear;
   QueryWork.SQL.Text:='select cfg_id,cfg_value from cfg '+
	'where cfg_name="$1C_FRM_EXPORT_FILE" '+
	'and cfg_set1=(select cfg_value from cfg where cfg_set1=1 and cfg_name="DEFAULT_FIRMA")';
   QueryWork.Open;
   if QueryWork.eof then begin
        PathFile.text:='';
   end else begin
        PathFile.text:=QueryWork.fieldByname('CFG_VALUE').asstring
   end;
   QueryWork.Close;
end;

procedure TIMP_1C.Button1Click(Sender: TObject);
var f: textfile;
	id, balance_id: longint;
    inn: string;
    money, saldo: extended;
    name: string;
    buf: string;
    n: integer;
    s: string;
    dt_saldo, dt_money: TDateTime;
    num: longint;
    oldDateFormat: string;
    r: double;
begin

    num:=0;
    KLN_WARN.chhApplyToAll.Checked:=false;

	try
      assignfile(f, pathfile.text);
      reset(f);
      readln(f, buf);
      if (buf <> '$ BALANCE $') then
      begin
        closefile(f);
      	raise Exception.Create('Неправильный файл!');
      end;

      readln(f, buf);	//дата сальдо
      if (copy(buf, 0, 12) <> '$DATE-SALDO$') then
      begin
        closefile(f);
      	raise Exception.Create('Неправильный файл!');
      end;
      buf := copy(buf, 13, 100);
      buf:=stringreplace(buf, '/', DateSeparator, [rfReplaceAll]);
      buf:=stringreplace(buf, '.', DateSeparator, [rfReplaceAll]);
      oldDateFormat := ShortDateFormat;
      ShortDateFormat:='dd'+DateSeparator+'mm'+dateseparator+'yyyy';
	    dt_saldo:=strtodate(buf);
      ShortDateFormat:=oldDateFormat;


      readln(f, buf);	//дата выгрузки баланса
      if (copy(buf, 0, 10) <> '$DATE-ACT$') then
      begin
        closefile(f);
      	raise Exception.Create('Неправильный файл!');
      end;
      buf := copy(buf, 11, 100);
      buf:=stringreplace(buf, '/', DateSeparator, [rfReplaceAll]);
      buf:=stringreplace(buf, '.', DateSeparator, [rfReplaceAll]);
      oldDateFormat := ShortDateFormat;
      ShortDateFormat:='dd'+DateSeparator+'mm'+dateseparator+'yyyy';
	    dt_money:=strtodate(buf);
      ShortDateFormat:=oldDateFormat;


      dt_saldo := dt_saldo + 1 - SEKOND1;
      dt_money := dt_money + 1 - SEKOND1;



      while not eof(f) do
      begin
        inc(num);
        statusbar1.Panels[0].Text:=inttostr(num);
        readln(f, buf);
        n := pos(';', buf);
        s:=copy(buf, 0, n-1);

        id:=strtoint(s);
        buf := copy(buf, n+1, length(buf));

        n := pos(';', buf);
        s:=copy(buf, 0, n-1);
        statusbar1.Panels[1].Text:='ИНН: '+s;
        inn:=s;
        buf := copy(buf, n+1, length(buf));

        n := pos(';', buf);
        s:=copy(buf, 0, n-1);
        s:= stringreplace(s, '.', DECIMALSEPARATOR, [rfreplaceall]);
        s:= stringreplace(s, ',', DECIMALSEPARATOR, [rfreplaceall]);
        saldo:=strtofloat(s);

        buf := copy(buf, n+1, length(buf));
        n := pos(';', buf);
        s:=copy(buf, 0, n-1);
        s:= stringreplace(s, '.', DECIMALSEPARATOR, [rfreplaceall]);
        s:= stringreplace(s, ',', DECIMALSEPARATOR, [rfreplaceall]);
        money:=strtofloat(s);



        name := copy(buf, n+1, length(buf));
        statusbar1.Panels[2].Text:=name;

        Application.ProcessMessages;




        balance_id:=-1;
        QueryWork.Close;
        WorkTransaction.Active:=False;

   		QueryWork.SQL.Clear;
   		QueryWork.SQL.Text:='SELECT KLN_INN, KLN_ORG, KLN_CREDIT2, KLN_DR, klnbalance_id FROM KLN left join klnbalance on klnbalance.kln_id = kln.kln_id WHERE kln.KLN_ID=:KLN_ID';
      QueryWork.ParamByName('KLN_ID').AsInteger:=id;
   		QueryWork.Open;

        if queryWork.Eof then //не найден клиент с таким id! значит он и не нужен
        begin
          QueryWork.Close;
          WorkTransaction.Active:=False;
          MsgBox('Предупреждение!', 'В базе АРМ Склад не найден клиент с ID='+inttostr(id)+chr(13)+'ИНН '+inn+chr(13)+'Наименование: '+name, 0);
        end else

         begin
          balance_id:=QueryWork.FieldByName('KLNBALANCE_ID').asinteger;
          if ((trim(QueryWork.FieldByName('KLN_INN').asstring) <> trim(INN))
             or (trim(QueryWork.FieldByName('KLN_ORG').asstring) <> trim(name)))
            then 	//клиент найден, реквизиты разные, значит надо спросить про его обновление
	        begin

              if (not KLN_WARN.chhApplyToAll.Checked)   then
              begin

             	 KLN_WARN.kln_id.Text:=inttostr(id);
            	 KLN_WARN.ARM_INN.Text:=QueryWork.FieldByName('KLN_INN').asstring;
           		 KLN_WARN.ARM_NAME.Text:=QueryWork.FieldByName('KLN_ORG').asstring;
           		 KLN_WARN.C_INN.Text:=inn;
              	 KLN_WARN.C_NAME.Text:=name;
     		     KLN_WARN.ShowModal;
              end;
//     		  KLN_WARN.Destroy;


              if kln_warn.Tag=2 then
               begin
              	ibquery1.Close;
              	ibtransaction1.Active:=false;
              	ibquery1.SQL.Text:='UPDATE KLN SET KLN_INN=:KLN_INN, KLN_ORG=:KLN_ORG WHERE KLN_ID=:KLN_ID';
                if (inn = '') then
                	inn := QueryWork.FieldByName('KLN_INN').asstring;

              	ibquery1.parambyname('KLN_INN').asstring:=inn;
                ibquery1.parambyname('KLN_ORG').asstring:=name;
              	ibquery1.ParamByName('KLN_ID').asinteger:=id;
              	ibquery1.ExecSQL;
              	ibtransaction1.Commit;
               end;


	        end;
            //Обновить баланс клиента, всегда.
//            if abs(QueryWork.FieldByName('KLN_CREDIT2').asfloat - balance) > 0.01 then
			        begin
              try
                IBSAVE_CLEAR();
                IBSAVE_ADD('SALDO', saldo);
                IBSAVE_ADD('SALDO_DATE', dt_saldo);
                IBSAVE_ADD('MONEY', money);
                IBSAVE_ADD('MONEY_DATE', dt_money);
                IBSAVE_ADD('KLN_ID', id);

                if balance_id=0 then balance_id:=-1;
                balance_id:=IBSAVE_DOC('KLNBALANCE',balance_id);
                if balance_id<0 then r:=sqrt(-1);
                IBSAVE_CLEAR;
                Datamodule1.IBTransaction2.Commit;

//                ibquery1.Close;
//              	ibtransaction1.Active:=false;
//              	ibquery1.SQL.Text:='UPDATE KLN SET KLN_CREDIT2=:KLN_CREDIT2, KLN_DR=:KLN_DR WHERE KLN_ID=:KLN_ID';
//              	ibquery1.parambyname('KLN_CREDIT2').asfloat:=balance;
//                ibquery1.parambyname('KLN_DR').asdatetime:=dt_saldo;
//              	ibquery1.ParamByName('KLN_ID').asinteger:=id;
//              	ibquery1.ExecSQL;
//              	ibtransaction1.Commit;

              except
                Datamodule1.IBTransaction2.Rollback;
              end;

             end;

         end;

      end;

      closefile(f);

    except
       on e: Exception do
        begin
            if worktransaction.InTransaction then
		           	worktransaction.Rollback;
            if ibtransaction1.InTransaction then
            		ibtransaction1.Rollback;
         	MsgBox('Ошибка загрузки баланса клиентов!', e.message, 0);
//          writeln(logfile,datetimetostr(mynow())+' Выгрузка файла заявки.htm. Ошибка при экспорте E-mail сообщений!'+e.message);;
        end;
    end;

end;

procedure TIMP_1C.Button2Click(Sender: TObject);
begin
	close;
end;

end.
