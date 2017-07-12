unit Import_1C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ToolEdit, Db, IBCustomDataSet, IBQuery,
  IBDatabase,VCLUtils,KlnWarn, B_DButils,B_Utils, RXCtrls, RxMemDS, Grids,
  DBGrids, RXDBCtrl;

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
    FIRMS: TRxCheckListBox;
    Label1: TLabel;
    mem: TRxMemoryData;
    memID: TIntegerField;
    memSALDO: TCurrencyField;
    memMONEY: TCurrencyField;
    DataSource1: TDataSource;
    meminn: TStringField;
    memname: TStringField;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FIRMSClickCheck(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    arrFRM: array[0..20] of integer;  //массив основных фирм, которые могут быть использованы бля загрузки
    arrFRMFile: array[0..20] of string; //массив имен файлов доступных для загрузки
    arrFRMName: array[0..20] of string; //массив имен фирм доступных для загрузки
    arrFRMCount: integer;
    STOP_IMPORT: boolean;
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
   arrFRMCount:=0;
   WorkTransaction.Active:=False;
   QueryWork.SQL.Clear;
   QueryWork.SQL.Text:='select cfg.cfg_set1 FRM_ID, cfg.cfg_value FRM_FILE, (select kln_data.kln_full from kln_data(cfg.cfg_set1))||", ИНН "||kln.kln_inn FRM_NAME '+
   ' from cfg, kln  where cfg_name="$1C_FRM_EXPORT_FILE"  and kln.kln_id=cfg.cfg_set1  and kln.kln_frm>0';
   QueryWork.Open;
   while not QueryWork.eof do
   begin
    arrFRM[arrFRMCount]:=QueryWork.FieldByName('FRM_ID').asinteger;
    arrFRMName[arrFRMCount]:=QueryWork.FieldByName('FRM_NAME').asstring;
    arrFRMFile[arrFRMCount]:=QueryWork.FieldByName('FRM_FILE').asstring+'.balance';
    FIRMS.Items.Add(arrFRMName[arrFRMCount]);

    if QueryWork.FieldByName('FRM_ID').asinteger = 2669809 then
      FIRMS.Checked[arrFRMCount]:=true;
    if QueryWork.FieldByName('FRM_ID').asinteger = 2646742 then
      FIRMS.Checked[arrFRMCount]:=true;
    if QueryWork.FieldByName('FRM_ID').asinteger = 2702542 then
      FIRMS.Checked[arrFRMCount]:=true;
    if QueryWork.FieldByName('FRM_ID').asinteger = 2696633 then
      FIRMS.Checked[arrFRMCount]:=true;
    if QueryWork.FieldByName('FRM_ID').asinteger = 2697090 then
      FIRMS.Checked[arrFRMCount]:=true;
    if QueryWork.FieldByName('FRM_ID').asinteger = 2696877 then
      FIRMS.Checked[arrFRMCount]:=true;

    if QueryWork.FieldByName('FRM_ID').asinteger = 2705194 then
      FIRMS.Checked[arrFRMCount]:=true;



    inc(arrFRMCount);
    QueryWork.Next;
   end;
   queryWork.Close;
   WorkTransaction.Active:=False;



   if QueryWork.eof then begin
        PathFile.text:='';
   end else begin
        PathFile.text:=QueryWork.fieldByname('CFG_VALUE').asstring
   end;
   QueryWork.Close;



   FIRMS.Enabled:=false;

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
    i: integer;
    filename: string;
    FRM_ID: integer;
begin
    mem.EmptyTable;
    num:=0;
    Application.CreateForm(TKLN_WARN, KLN_WARN);
    KLN_WARN.chhApplyToAll.Checked:=false;
    STOP_IMPORT:=false;
	 try

      for i := 0 to FIRMS.Items.Count-1 do
      begin

          if not FIRMS.Checked[i] then continue;


          assignfile(f, arrFRMFile[i]);
          FRM_ID:=arrFRM[i];

          if FRM_ID = 2669809 then
            FRM_ID:=2702542;
          if FRM_ID = 2697090 then
            FRM_ID:=2702542;
          if FRM_ID = 2646742 then
            FRM_ID:=2702542;
          if FRM_ID = 2696633 then
            FRM_ID:=2702542;
          if FRM_ID = 2696877 then
            FRM_ID:=2702542;
          if FRM_ID = 2705194 then
            FRM_ID:=2702542;


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

          if dt_saldo>0 then
          if round(dt_saldo) <> round(strtodate(buf)+1) then
          raise Exception.Create('В указанных фирмах разная дата закрытия периода. Загрузка невозможна');


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

          if dt_money>0 then
          if round(dt_money) <> round(strtodate(buf)+1) then
          raise Exception.Create('В указанных фирмах разная дата выгрузки. Загрузка невозможна');


          dt_money:=strtodate(buf);
          ShortDateFormat:=oldDateFormat;


          dt_saldo := dt_saldo + 1 - SEKOND1;
          dt_money := dt_money + 1 - SEKOND1;


          //читаем файлы
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


            {
              1 ищем такой же ID. суммируем цифры
              2 - если ID не найден, делаем новую запись
            }
            mem.DisableControls;
            mem.First;


            if (id = 160164953) then
            begin
                Sleep(1);
            end;


            if mem.Locate('ID', id, []) then
            begin
              mem.Edit;
              mem.fieldbyname('saldo').asfloat:=mem.fieldbyname('saldo').asfloat+saldo;
              mem.fieldbyname('money').asfloat:=mem.fieldbyname('money').asfloat+money;
              mem.fieldbyname('inn').asstring:=inn;
              mem.fieldbyname('name').asstring:=name;
              mem.post;
            end
            else
            begin
              mem.Append;
              mem.fieldbyname('id').asinteger:=id;
              mem.fieldbyname('saldo').asfloat:=saldo;
              mem.fieldbyname('money').asfloat:=money;
              mem.fieldbyname('inn').asstring:=inn;
              mem.fieldbyname('name').asstring:=name;
              mem.post;
            end;
            mem.EnableControls;

            Application.ProcessMessages;
          end;

          closefile(f);

      end;


      mem.First;

      num:=0;
      while not mem.Eof and not STOP_IMPORT do
      begin
            inc(num);
            statusbar1.Panels[0].Text:=inttostr(num);
            Application.ProcessMessages;

            id := mem.fieldbyname('id').asinteger;
            inn:=mem.fieldbyname('inn').asstring;
            name:=mem.fieldbyname('name').asstring;
            saldo:= mem.fieldbyname('saldo').asfloat;
            money:= mem.fieldbyname('money').asfloat;

            balance_id:=-1;
            QueryWork.Close;
            WorkTransaction.Active:=False;

            QueryWork.SQL.Clear;
            QueryWork.SQL.Text:='SELECT KLN_INN, KLN_ORG, KLN_CREDIT2, KLN_DR, klnbalance_id FROM KLN left join klnbalance on klnbalance.kln_id = kln.kln_id and klnbalance.FRM_ID=:FRM_ID WHERE kln.KLN_ID=:KLN_ID ';
            QueryWork.ParamByName('KLN_ID').AsInteger:=id;
            QueryWork.ParamByName('FRM_ID').AsInteger:=FRM_ID;
            QueryWork.Open;

              if queryWork.Eof then //не найден клиент с таким id! значит он и не нужен
              begin
                QueryWork.Close;
                WorkTransaction.Active:=False;
                MsgBox('Предупреждение!', 'В базе АРМ Склад не найден клиент с ID='+inttostr(id)+chr(13)+'ИНН '+inn+chr(13)+'Наименование: '+name, 0);
              end else

               begin
                balance_id:=QueryWork.FieldByName('KLNBALANCE_ID').asinteger;
                if ((trim(QueryWork.FieldByName('KLN_INN').asstring) <> trim(inn))
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
                     if KLN_WARN.STOP_IMPORT.tag>0 then
                       STOP_IMPORT:=true;
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
                      IBSAVE_ADD('FRM_ID', FRM_ID);


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
               mem.Next;
      end;

//      end;

//      closefile(f);

   except
       on e: Exception do
        begin
            if worktransaction.InTransaction then
		           	worktransaction.Rollback;
            if ibtransaction1.InTransaction then
            		ibtransaction1.Rollback;

           try
            closefile(f);
           except
           end;


         	MsgBox('Ошибка загрузки баланса клиентов!', e.message, 0);
//          writeln(logfile,datetimetostr(mynow())+' Выгрузка файла заявки.htm. Ошибка при экспорте E-mail сообщений!'+e.message);;
        end;
   end;

   KLN_WARN.Destroy;

end;

procedure TIMP_1C.Button2Click(Sender: TObject);
begin
	close;
end;

procedure TIMP_1C.FIRMSClickCheck(Sender: TObject);
var i: integer;
  files: string;
begin
  for i := 0 to FIRMS.Items.Count-1 do
  begin
    if FIRMS.Checked[i] then
      files:= files+' '+arrFRMFile[i];
  end;

  pathfile.Text:=files;

end;

procedure TIMP_1C.Button3Click(Sender: TObject);
begin
  STOP_IMPORT:=true;
end;

end.
