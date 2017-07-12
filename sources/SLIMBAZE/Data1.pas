unit Data1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery, IBDatabase,b_utils;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTransaction2: TIBTransaction;
    IbGetGen: TIBQuery;
    IbSaveSQL: TIBQuery;
    IbSaveSQL2: TIBQuery;
    IbSaveUSWORK: TIBQuery;
    IbGetDefault: TIBQuery;
    IbSaveSQL3: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
   Isblob=1;
   MessCritical='Критическая ошибка!';
   MessSystem='Сообщение системы!';
   MessError='Ошибка!';


type
    IbRec=record
        NAME:ansistring;
        VALUE:variant;
        BLOB:boolean;
    end;

var
  DataModule1: TDataModule1;
   IbRecCnt:integer=0;
   IbArrREC:array[1..200] of IbRec;

PROCEDURE IBSAVE_CLEAR;
PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant); Overload;
PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant;OnBlob:integer); Overload;
FUNCTION IBSAVE_DOC(TABLENAME:ansistring;TABLEID:integer):integer;
FUNCTION IBDELETE_DOC(TABLENAME:ansistring;TABLEID:integer):boolean;



implementation

uses FormDebug;

{$R *.DFM}

PROCEDURE IBSAVE_CLEAR;
{Процедура очищает список полей для записи или изменения в базу}
begin
        IbRecCnt:=0;
end;

PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant); Overload;
{Процедура добавляет в список переменных значения для последующей записи или изменения
 в таблице}
var
        a:integer;
        c:integer;
begin
        NAME:=trim(AnsiupperCase(NAME));
        c:=0;
        for a:=1 to IbRecCnt do if IbArrREC[a].NAME=NAME then c:=a;
        if c=0 then begin
                inc(IbRecCnt);
                IbArrREC[IbRecCnt].NAME:=NAME;
                IbArrREC[IbRecCnt].VALUE:=VALUE;
                IbArrREC[IbRecCnt].Blob:=False;
        end else begin
                IbArrREC[c].VALUE:=VALUE;
                IbArrREC[c].Blob:=False;
        end;
end;

PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant;OnBlob:integer); Overload;
{Процедура добавляет в список переменных значения для последующей записи или изменения
 в таблице принудительно указывая, что поле - BLOB}
var
        a:integer;
        c:integer;
begin
        NAME:=trim(AnsiupperCase(NAME));
        c:=0;
        for a:=1 to IbRecCnt do if IbArrREC[a].NAME=NAME then c:=a;
        if c=0 then begin
                inc(IbRecCnt);
                IbArrREC[IbRecCnt].NAME:=NAME;
                IbArrREC[IbRecCnt].VALUE:=VALUE;
                if OnBlob=IsbLob then IbArrREC[IbRecCnt].Blob:=True
                                 else IbArrREC[IbRecCnt].Blob:=False;
        end else begin
                IbArrREC[c].VALUE:=VALUE;
                if OnBlob=IsbLob then IbArrREC[IbRecCnt].Blob:=True
                                 else IbArrREC[IbRecCnt].Blob:=False;
        end;
end;

Function GetGEN(TABLENAME:ansistring):integer;
{Функция возвращает текущее значение генератора для указанной таблицы
 возвращает 0, если таблица или генератор не найдены и выдаёт сообщение об ошибке}
begin
        TABLENAME:=trim(AnsiupperCase(TABLENAME));
        DataModule1.IbGetGen.Close;
        DataModule1.IbGetGen.SQL.Clear;
        DataModule1.IbGetGen.SQL.add('select GEN_ID(GEN_'+TABLENAME+',0) FROM RDB$GENERATORS '+
                                      'WHERE RDB$GENERATOR_NAME="GEN_'+TABLENAME+'"');
        DataModule1.IbGetGen.Open;
        if DataModule1.IbGetGen.eof then result:=-1
                                    else result:=DataModule1.IbGetGen.fieldByname('GEN_ID').asinteger;
        DataModule1.IbGetGen.Close;
        if result=-1 then Messbox('Таблица "'+TABLENAME+'" или её генератор в базе не обнаружены!'+CR+
        'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!',MessCritical,16);
end;


Function GetGENNEXT(TABLENAME:ansistring):integer;
{Функция возвращает СЛЕДУЮЩЕЕ! значение генератора для указанной таблицы
 возвращает 0, если таблица или генератор не найдены и выдаёт сообщение об ошибке}
begin
        TABLENAME:=trim(AnsiupperCase(TABLENAME));
        DataModule1.IbGetGen.Close;
        DataModule1.IbGetGen.SQL.Clear;
        DataModule1.IbGetGen.SQL.add('select GEN_ID(GEN_'+TABLENAME+',1) FROM RDB$GENERATORS '+
                                      'WHERE RDB$GENERATOR_NAME="GEN_'+TABLENAME+'"');
        DataModule1.IbGetGen.Open;
        if DataModule1.IbGetGen.eof then result:=1
                                    else result:=DataModule1.IbGetGen.fieldByname('GEN_ID').asinteger;
        DataModule1.IbGetGen.Close;
        if result=-1 then Messbox('Таблица "'+TABLENAME+'" или её генератор в базе не обнаружены!'+CR+
        'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!',MessCritical,16);
end;

FUNCTION IBSAVE_DOC(TABLENAME:ansistring;TABLEID:integer):integer;
{Функция пытается вставить в базу сообщение (если TABLEID<0),
 или заменить существующее, если оно отсутствует}
var
        a,b,c:integer;
        sss,s,sw1,sw2:ansistring;
        NEWTABLEID:integer;
begin
        {Шаг первый - формируем SQL скрипт}
        result:=-1;
        TABLENAME:=trim(AnsiUpperCase(TABLENAME));
        IF TABLEID<0 then begin
                // Заранее определили новый ID
                NEWTABLEID:=GetGENNEXT(TABLENAME);
                DataModule1.IbSaveSQL.Close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add('INSERT INTO '+TABLENAME+' ('+TABLENAME+'_ID,');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(') VALUES (:BEG$ID,');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+':'+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(')');
                DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=NEWTABLEID;
                for a:=1 to IbRecCnt do begin
                   if IbArrREC[a].BLOB then
                        DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asBlob:=IbArrREC[a].VALUE
                   else begin
                        b:=typVAR(IbArrREC[a].Value);
                        case b of
                            1: {Float}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asFloat:=IbArrREC[a].VALUE;
                            2: {INteger}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asInteger:=IbArrREC[a].VALUE;
                            3: {ansistring} // Не забыть убрать ~~
                                begin
                                    sw1:=trim(IbArrREC[a].VALUE);
                                    for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                    DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asstring:=sw1;
                                end;
                            4: {Boolean} if IbArrREC[a].VALUE=TRUE then
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=1
                                  else
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=0;
                            5: {Date}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asdatetime:=IbArrREC[a].VALUE;
                            ELSE Messbox('Внимание! Обнаружен неопределённый тип данных "'+inttostr(b)+'"'+CR+
                                'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!','Критическая ошибка!',16);
                        end;
                   end;
                end;
        end else begin
                {Исправляем текущую запись}
                DataModule1.IbSaveSQL.Close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add('UPDATE '+TABLENAME+' SET ');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+IbArrREC[a].NAME+'=:'+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(' WHERE '+TABLENAME+'_ID=:BEG$ID');
                DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=TABLEID;
                for a:=1 to IbRecCnt do begin
                   if IbArrREC[a].BLOB then
                        DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asBlob:=IbArrREC[a].VALUE
                   else begin
                        b:=typVAR(IbArrREC[a].Value);
                        case b of
                            1: {Float}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asFloat:=IbArrREC[a].VALUE;
                            2: {INteger}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asInteger:=IbArrREC[a].VALUE;
                            3: {ansistring} // Не забыть убрать ~~
                                begin
                                    sw1:=trim(IbArrREC[a].VALUE);
                                    for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                    DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asstring:=sw1;
                                end;
                            4: {Boolean} if IbArrREC[a].VALUE=TRUE then
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=1
                                  else
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=0;
                            5: {Date}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asdatetime:=IbArrREC[a].VALUE;
                            ELSE Messbox('Внимание! Обнаружен неопределённый тип данных "'+inttostr(b)+'"'+CR+
                                'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!','Критическая ошибка!',16);
                        end;
                   end;
                end;
        end;
        Try
                DataModule1.IbSaveSQL.ExecSQL;
                {Шаг второй - если запись прошла успешно - определяем ID записи}
                if TABLEID<0 then result:=NEWTABLEID else result:=TABLEID;
        Except
                Application.createform(TFORM_DEBUG,FORM_DEBUG);
                FORM_DEBUG.Memo1.lines:=DataModule1.IbSaveSQL.SQL;
                {Шаг третий - если запись не произошла, определяем, в чём ошибка:
                1) отсутсвует таблица
                2) отсутствует поле
                3) ...}
                {Превый тест - проверяем присутствие таблицы}
                DataModule1.IbSaveSQL.close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add(' select distinct R.RDB$RELATION_NAME '+
                ' from RDB$RELATION_FIELDS R '+
                ' where R.RDB$SYSTEM_FLAG = 0 and R.RDB$RELATION_NAME=:TABLENAME ');
                DataModule1.IbSaveSQL.Parambyname('TABLENAME').asstring:=TABLENAME;
                DataModule1.IbSaveSQL.open;
                if DataModule1.IbSaveSQL.eof then begin
                   {Таблицы в списке нет}
                   Messbox('Таблица "'+TABLENAME+'" не найдена в базе данных!'+CR+
                   'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!',MessCritical,16);
                end else begin
                   {Таблица есть в списке - поочереди проверяем наличие всех
                    полей в таблице, и если они все есть, значит ошибка
                    в формате данных поля}
                   b:=0;
                   s:='';
                   for a:=1 to IbRecCnt do begin
                       DataModule1.IbSaveSQL.close;
                       DataModule1.IbSaveSQL.SQL.clear;
                       DataModule1.IbSaveSQL.SQL.add('select R.RDB$FIELD_NAME, '+
                       ' F.RDB$FIELD_LENGTH, F.RDB$FIELD_TYPE, F.RDB$FIELD_SCALE, F.RDB$FIELD_SUB_TYPE '+
                       ' from RDB$FIELDS F, RDB$RELATION_FIELDS R '+
                       ' where F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE and R.RDB$SYSTEM_FLAG = 0 '+
                       'and RDB$RELATION_NAME=:TABLENAME and  R.RDB$FIELD_NAME=:FIELDNAME');
                       DataModule1.IbSaveSQL.Parambyname('TABLENAME').asstring:=TABLENAME;
                       DataModule1.IbSaveSQL.Parambyname('FIELDNAME').asstring:=IbArrREC[a].NAME;
                       DataModule1.IbSaveSQL.open;
                       if DataModule1.IbSaveSQL.eof then begin
                          inc(b);
                          s:=s+IbArrREC[a].NAME+' ';
                       end;
                       DataModule1.IbSaveSQL.close;
                   end;
                   if b=0 then begin
                      if messbox('Некорректный формат данных при попытки записи в таблицу "'+TABLENAME+'"!'+CR+
                      'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!'+CR+
                      'Вывести отладочную информацию?',MessCritical,4+16+256)=6 then begin
                         FORM_DEBUG.RxMem.emptyTable;
                         for a:=1 to IbRecCnt do begin
                            FORM_DEBUG.RxMem.Append;
                            FORM_DEBUG.RxMem.FieldByname('NAME').asstring:=IbArrREC[a].NAME;
                            if IbArrREC[a].BLOB then begin
                              FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='BLOB';
                              FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=IbArrREC[a].VALUE;
                            end else begin
                                b:=typVAR(IbArrREC[a].Value);
                                case b of
                                1: {Float} begin
                                    FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='FLOAT';
                                    FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=floattostrf(IbArrREC[a].VALUE,fffixed,19,8);
                                    end;
                                2: {INteger} begin
                                      FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='INTEGER';
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=inttostr(IbArrREC[a].VALUE);
                                      end;
                                3: {ansistring} // Не забыть убрать ~~
                                    begin
                                        sw1:=trim(IbArrREC[a].VALUE);
                                        for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                        FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='ansistring';
                                        FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=sw1;
                                    end;
                                4: {Boolean} begin
                                     FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='BOOLEAN';
                                     if IbArrREC[a].VALUE=TRUE then
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:='1'
                                      else
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:='0';
                                     end;
                                5: {Date} begin
                                     FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='DATE';
                                     FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=datetimetostr(IbArrREC[a].VALUE);
                                     end;
                                end;
                            end;
                            FORM_DEBUG.RxMem.post;
                         end;
                         FORM_DEBUG.showmodal;
                      end;
                   end else messbox('В таблице "'+TABLENAME+'" не найдены поля "'+trim(s)+'"!'+CR+
                   'Необходимо сообщить разработчику содержимое данного сообщения, а также события, ему предшествующие!',MessCritical,16);
                end;
                FORM_DEBUG.destroy;
                DataModule1.IbSaveSQL.close;
        End;
end;

FUNCTION IBDELETE_DOC(TABLENAME:ansistring;TABLEID:integer):boolean;
var s:ansistring;
begin
        TABLENAME:=trim(AnsiUpperCase(TABLENAME));
        result:=false;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('DELETE FROM '+TABLENAME+' WHERE '+TABLENAME+'_ID=:BEG$ID');
        DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=TABLEID;
        Try
                DataModule1.IbSaveSQL.ExecSQL;
                result:=true;
        Except
                Messbox('Ошибка удаления! Данные используются в других документах!'+CR+'Код удаления: '+TABLENAME+inttostr(TABLEID),MessSystem,16);
                {Выясняем ошибки: Возможные :
                 1.нет таблицы
                 2.неверное ключевое поле
                 3.нет записи в таблице
                 4.удалений не произошло - сработали триггера защиты}
        End;
end;



end.
