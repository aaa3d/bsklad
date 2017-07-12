unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OutLookTools,data1, Db, IBCustomDataSet, IBQuery,
  IBDatabase,VclUtils, ExtCtrls, LZRW1, RxMemDS,FileCtrl, Mask, ToolEdit,
  SakSMTP, SakMsg, b_utils, tlhelp32, NMMSG, Psock, ShellApi; // !!! важно;

const
   EmptyString='@#$@';
   CanLog=True;
   CanUpdate=True;
   Subject_prefix='Bsklad data Transfer';

   PathForHtmlZay='ZAYs\'; // Путь для посчитанных HTML заявок
type
  TMAIN_FORM = class(TForm)
    ButtonDefault: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OutlookConnect1: TOutlookConnect;
    Memo1: TMemo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    BtnResiveEmail: TButton;
    ComPressor: Tlzrw1;
    Mem1: TRxMemoryData;
    Mem1DATA: TMemoField;
    BtnRepeat: TButton;
    AutoTimer: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SakSMTP1: TSakSMTP;
    IBQuery1: TIBQuery;
    Button1: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure ButtonDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function MakeData():integer;
    procedure BtnResiveEmailClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure AUTO_GET_TIME;
    function ExportData:integer;
    procedure BtnRepeatClick(Sender: TObject);
    procedure AutoTimerTimer(Sender: TObject);
    procedure add_log(s:ansistring);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure LoadDataFromfile(filename: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SendErrorMail(msg: string);
    function LookForPreviousInstance: boolean;
    procedure FormDestroy(Sender: TObject);
    procedure SakSMTP1Error(Sender: TObject; Error: Integer; Msg: String);
    procedure ExportZTrindefs;
    procedure Button6Click(Sender: TObject);

  private
    { Private declarations }
    ArrDelMail:array[1..1000] of string;
    cntDelMail:integer;
    MailIndex: integer;
    MailSubject: string;

    ReFileName, FileName: ansistring;

  public
    { Public declarations }
  end;
type
   No_Field=record
     TABLENAME:string[64];
     FIELDNAME:string[64];
   end;

function Notilda(s:ansistring):ansistring;
function IntToFixedString(n:longint):ansistring;
function FixedStringToInt(s:ansistring):longint;
function DoubleToFixedString(n:double):ansistring;
function FixedStringToDouble(s:ansistring):Double;
function trim_file(Path,FileName1,FileName2:ansistring;Size:longint):integer;
function CONTROLSUMM(s:ansistring):int64;

function NetSend(const MsgName,SendMsg: string): Boolean;

function NetMessageBufferSend(ServerName, MsgName, FromName: PWideChar;  Buf: Pointer; BufLen: Word): word; stdcall;
    external 'netapi32.dll' name 'NetMessageBufferSend';

function IsRunning( sName : string ) : boolean;

type
        SHOP_REC=record
                ID:integer;
                name:ansistring;
                Addres:ansistring;
        end;
var
  LogFile:textfile;
  Cnt_Nofield,Cnt_AllTable:integer;
  ARR_ALLTABLE:array[1..1000] of ansistring;
  ARR_NOFIELD:array[1..1000] of NO_FIELD;
  IDCFG:integer;
  MAIN_FORM: TMAIN_FORM;
  POCKET_PATH:ansistring;
  CODE_SHOP:integer;
  MAIN_DESCR:ansistring;
  CntShops:integer;
  ArrShops:array[1..100] of Shop_rec;
  DataBase_path:ansistring;
  MainPeriod1,MainPeriod2:Tdatetime;
  TMP_PATH:ansistring;
  Ts,TmpTs,TmpTs2:TtimeStamp;

  CanInsertLog:Boolean;
  EMAIL_HOST:ansistring;
  REPEAT_EMAIL:ansistring;
  TITLE_EMAIL,UTW_EMAIL,OK_EMAIL,NOOK_EMAIL,HOME_EMAIL:ansistring;
  PostRE: boolean;
  CntREShops: integer;
  ArrREShops: array[1..100] of Shop_rec;
  GetRE: boolean;
  CustomTable: boolean;
  SaveSyncDate: boolean;
  PacketNum :longint;
  IncomingPacketNum: longint;
  SyncShopNum: integer;
  SyncDate: TtimeStamp;
  CustomTableName: string;
  DataFileEmpty, ReDataFileEmpty : boolean;

  MAX_LINES_COUNT: integer=10000; // Максимальный размер вложения    (максимальное количество строк)
  ADD_TIME: integer=15;          //Запас по времени, минут - сколько дополнительно данных захватится в пакете от начального времени
  CommitInterval: integer=1;
  AdminEmail: ansistring='aaa@olimpiya.yaroslavl.ru';
  DISABLE_MULTIPLE_INSTANCES: boolean=true;
  FromEmailAddress: string;
  FROM_SHOP: integer;
  NetSendUsersTimeStart: TDateTime;
  NetSendUsersTimeEnd: TDateTime;
  NetSendUsers: TStringList;

  USE_OUTLOOK_FOR_SEND_MAIL: boolean;
  SMTP_SERVER: string;
  SMTP_FROM: string;
  SENDED_MAIL_DIRECTORY: string;



var AtomText: string='aaaaaa';





function my_dat(dt:tdatetime):ansistring;




implementation

uses SetPeriod, SelectTo, LastSyncFormUnit, pass;

{$R *.DFM}



function NetSend(const MsgName,SendMsg: string): Boolean;
var
  PWCMsgName, PWCSendMsg: PWideChar;
  Error: Word;
begin
  try
    Error := 1;
    GetMem(PWCMsgName, 2*Length(MsgName)+2);
    GetMem(PWCSendMsg, 2*Length(SendMsg)+2);
    StringToWideChar(MsgName, PWCMsgName, Length(MsgName)+2);
    StringToWideChar(SendMsg, PWCSendMsg, Length(SendMsg)+2);
    Error :=
      NetMessageBufferSend(nil, PWCMsgName, nil, PWCSendMsg,
      Length(SendMsg)*2);
  finally
    FreeMem(PWCMsgName);
    FreeMem(PWCSendMsg);
    Result := Error = 0;
  end;
end;

function IsRunning( sName : string ) : boolean;
var
  han : THandle;
  ProcStruct : PROCESSENTRY32; // from "tlhelp32" in uses clause
  sID : string;
  cnt: integer;
begin
  cnt:=0;
  Result := false;
  // Get a snapshot of the system  
  han := CreateToolhelp32Snapshot( TH32CS_SNAPALL, 0 );  
  if han = 0 then  
    exit;  
  // Loop thru the processes until we find it or hit the end  
  ProcStruct.dwSize := sizeof( PROCESSENTRY32 );  
  if Process32First( han, ProcStruct ) then  
    begin  
      repeat  
        sID := ExtractFileName( ProcStruct.szExeFile );  
        // Check only against the portion of the name supplied, ignoring case  
        if uppercase( copy( sId, 1, length( sName ) ) ) = uppercase( sName ) then  
          begin  
            // Report we found it
            inc(cnt);

          end;
      until not Process32Next( han, ProcStruct );  
    end;  
  // clean-up
  CloseHandle( han );

  if cnt>1 then
    result:=true;

end; 


procedure TMAIN_FORM.SendErrorMail(msg: string);
var SakMSG1: TSakMSG;

begin
   try
   SakMSG1:=TSakMSG.Create(nil);

   SakMsg1.Subject := 'уведомление об ошибке системы репликации АРМ Склад.';
   SakMsg1.MessageType:=mtPlain;

   SakMsg1.Text.Clear;
   SakMsg1.Text.Add(msg);

   SakMsg1.AttachedFiles.Clear;
   SakMsg1.CharSet := 'windows-1251';
   SakMsg1.TextEncoding := te8Bit;
   SakMsg1.UserName :=TITLE_EMAIL;
   SakMsg1.From := FromEmailAddress;



   SakMsg1.SendTo := AdminEmail;
   SakSMTP1.host := EMAIL_HOST;

   SakSMTP1.connect;
   if not SakSMTP1.SMTPError then
   begin
      SakSMTP1.SendTheMessage( SakMsg1);
   end;
   SakSMTP1.Disconnect;
   except
    on e: Exception do
     begin
      add_log('!!! Ошибка отправки почты администратору'+chr(13)+e.message);
     end;


   end;

   SakMSG1.Destroy;
end;


function TMAIN_FORM.LookForPreviousInstance: boolean;
var
  Atom: THandle;
begin
  result:=false;
  if DISABLE_MULTIPLE_INSTANCES then
  begin
    Atom := GlobalFindAtom(pchar(AtomText));
    Result := Atom <> 0;
    if not Result then
      GlobalAddAtom(pchar(AtomText))
    else
    begin
      //атом есть, но возможно, процесса нет.
      //
      if not IsRunning('RplEmail.exe') then
        Result:=false
      else
        AtomText:='';
    end
  end;

end;


procedure TMAIN_FORM.LoadDataFromfile(filename:string);
type
   RecField=record
     name:ansistring;
     typ:integer;
   end;

var    FileWork:textFile;
       AllLines,CntLines:integer;
       WorkMet,WorkString:ansistring;
       WorkA,WorkB,WorkC:integer;
       WorkChar:Ansichar;
       CurrentTable:Ansistring;
       ArrField:array[1..100] of RecField; // Массив полей таблицы
       CntField:integer;
       CurrentError:integer;
       TABNAME:ansistring;
       IDSAVE,TABNAME_ID:integer;
       s,s1,s2,s3,s4:ansistring;                                                 
       b,c,d,e,cnt,cnt2:integer;
       CurrentField:integer;
       TmpString:ansistring;
       REC_ID:integer;
       REC_TMS:ansistring;
       REC_TM:tdatetime;
       ID:integer;
       TmpC,TmpD:integer;
       r:double;
       ERRDel,ERRUpdate:integer;
       DataFileName: ansistring;
begin
delay(1);
  try
    DataFileName:='BSKLAD_DATA_'+floattostr(now)+'.tmp';
    Compressor.InputFile:=filename;
    Compressor.OutputFile:=TMP_PATH+DataFileName;
    Compressor.Decompress;
    DeleteF(filename);
    if CanLog then Memo1.lines.add('Вложенный файл выгружен и распакован. Начинаем обработку...');
    delay(1);
    ERRDel:=0;
    ErrUpdate:=0;
    try
      Assignfile(FileWork,TMP_PATH+DataFileName);
      reset(FileWork);
      // Считаем число строк в файле
      AllLines:=0;
      while not eof(FileWork) do begin
        readln(FileWork,WorkString);
        inc(AllLines);
      end;
      CloseFile(FileWork);
      reset(FileWork);
      CntLines:=0;
      WorkMet:='';
      CurrentTable:='';
      while not eof(FileWork) do begin

        readln(FileWork,WorkString);
        inc(CntLines);
        if CntLines mod 20=0 then begin
           Label4.caption:=inttostr(CntLines)+' из '+inttostr(AllLines);
           delay(1);
        end;
        WorkA:=1;
        while WorkA<=Length(WorkString) do begin
           WorkChar:=WorkString[WorkA];
           WorkMet:=WorkMet+WorkChar;
           if length(WorkMet)=7 then WorkMet:=b_utils.right(WorkMet,6);
           if WorkMet='~~##D ' then begin
             // Начало Блока удаленных данных
             if CanLog then Memo1.lines.add('Начало блока удаленных данных...');
             delay(1);
             CurrentTable:='';
           end;
           if WorkMet='~~~~1 ' then begin
             // Строка удаляемых данных
             if CanLog and CanInsertLog then Memo1.lines.add('Удаление данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
             //delay(1);
             if CanUpdate then begin
                 // Проводим явное удаление
                CurrentError:=0;
                try
                  TABNAME:=ansiuppercase(trim(argc(WorkString,2)));
                  TABNAME_ID:=strtoint(trim(argc(WorkString,3)));
                except
                  CurrentError:=1;
                  inc(ERRDel);
                  if CanLog then Memo1.lines.add('Ошибка определения идентификаторов удаления!');
                  delay(1);
                  add_log('!!! Ошибка определения идентификаторов удаления!');
                  SendErrorMail('Ошибка определения идентификаторов удаления!');
                end;

                if CurrentError=0 then begin
//                  Datamodule1.IBTransaction2.Active:=False;
//                  Datamodule1.IBTransaction2.StartTransaction;
                  CurrentError:=0;
                  try
                     ADD_SQL(datamodule1.ibsavesql, 'SELECT DATA_CHANGED FROM PROC_DEL(:TABNAME, :TABNAME_ID)');
                     datamodule1.IbSaveSQL.ParamByName('TABNAME').asstring:=tabname;
                     datamodule1.IbSaveSQL.ParamByName('TABNAME_ID').asinteger:=tabname_id;
                     datamodule1.IbSaveSQL.Open;
//                     IBDELETE_DOC(TABNAME,TABNAME_ID);
                     if datamodule1.IbSaveSQL.FieldByName('DATA_CHANGED').asinteger=1 then
                       Datamodule1.IBTransaction2.Commit; //Коммит ТОЛЬКО если данные были изменены (удалены, вставлены строки в DEL)
                  except
                     inc(ERRDel);
                     Datamodule1.IBTransaction2.Rollback;
                     add_log('!!! Ошибка удаления данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                     if CanLog then begin
                        Memo1.lines.add('Ошибка удаления данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                        delay(1);
                     end;
                     CurrentError:=1;
                     SendErrorMail('Ошибка удаления данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                  end;

                  {Datamodule1.IBTransaction2.Active:=False;
                  WorkTransaction.Active:=False;
                  if CurrentError=0 then begin// Не  ошибок при удалении
                    ADD_SQL(QueryWork,'select DEL_ID from DEL where TABNAME=:TABNAME and TABNAME_ID=:TABNAME_ID');
                    QueryWork.ParamByname('TABNAME').asstring:=TABNAME;
                    QueryWork.ParamByname('TABNAME_ID').asinteger:=TABNAME_ID;
                    QueryWork.Open;
                    if QueryWork.eof then begin
                       // Фиксируем факт удаления для будущих вставок
                       Datamodule1.IBTransaction2.Active:=False;
                       Datamodule1.IBTransaction2.StartTransaction;
                       try
                          ibsave_clear;
                          ibsave_add('TABNAME',TABNAME);
                          ibsave_add('TABNAME_ID',TABNAME_ID);
                          IDSAVE:=ibsave_doc('DEL',-1);
                          Datamodule1.IBTransaction2.Commit;
                       except
                          Datamodule1.IBTransaction2.Rollback;
                          inc(ErrDel);
                          if CanLog then Memo1.lines.add('Ошибка фиксации удаления данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                          delay(1);
                          add_log('!!! Ошибка фиксации удаления данных таблицы '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                       end;
                       Datamodule1.IBTransaction2.Active:=False;
                    end;
                  end;

                  }
                end;
             end;
             CurrentTable:='';
           end;
           if WorkMet='~##DX ' then begin
             //сперва коммит изменений
             if DataModule1.IBTransaction2.InTransaction then
                Datamodule1.IBTransaction2.Commit;
             // Конец Блока удаленных данных
             if CanLog then Memo1.lines.add('Конец блока удаленных данных...');
             delay(1);
             if CanLog then begin
               if ERRDEL=0 then Memo1.lines.add('Удаление прошло успешно!')
               else Memo1.lines.add('Было '+inttostr(ErrDel)+' ошибок при удалении данных!');
                delay(1);
             end;
             CurrentTable:='';
           end;
           if WorkMet='~~### ' then begin
             // Начало или конец блока изменений таблицы
             //сперва коммит изменений
             if DataModule1.IBTransaction2.InTransaction then
                Datamodule1.IBTransaction2.Commit;


             if CanLog then Memo1.lines.add('Начало изменений таблицы '+argc(WorkString,2));
             delay(1);
             CurrentTable:=ansiuppercase(trim(argc(WorkString,2)));
             CntField:=0;
             // Необходимо прочесть перечень полей и их типы
             // Приводим строку к виду, когда в ней только описания полей и их типы
             s1:=trim(WorkString);
             s2:=argc(s1,1);
             s1:=trim(b_utils.right(s1,length(s1)-length(s2)));
             s2:=argc(s1,1);
             s1:=trim(b_utils.right(s1,length(s1)-length(s2)));
             // проверям, чтобы в конце строки было ~~~~.
             if b_utils.right(s1,5)<>'~~~~.' then begin
                // строка имеет плохой конец
                if CanLog then Memo1.lines.add('Неверный формат строки с описанием таблицы...');
                delay(1);
                inc(ERRUPDATE);
             end else begin
                s1:=trim(b_utils.left(s1,length(s1)-5));
                d:=argv(s1); // Число данных
                if (d mod 2) <>0 then begin
                  add_log('!!! Неверный формат строки с описанием таблицы. Нечетное описание полей!');
                  if CanLog then Memo1.lines.add('Неверный формат строки с описанием таблицы. Нечетное описание полей!');
                  delay(1);
                  inc(ERRUPDATE);
                end else begin
                  cntField:=d div 2;
                  for e:=1 to cntField do begin
                      ArrField[e].name:=trim(ansiuppercase(argc(s1,(e*2)-1)));
                      try
                        ArrField[e].typ:=strtoint(trim(argc(s1,(e*2))));
                      except
                            add_log('!!! Неверный формат строки с описанием таблицы. Ошибка при определении типа поля!');
                            if CanLog then Memo1.lines.add('Неверный формат строки с описанием таблицы. Ошибка при определении типа поля!');
                            delay(1);
                            inc(ERRUPDATE);
                            SendErrorMail('Неверный формат строки с описанием таблицы. Ошибка при определении типа поля!');
                      end;
                  end;
                end;
             end;
           end;
           if WorkMet='~~~~2 ' then begin



             Mem1.EmptyTable;
             // Начало строки с измененными данными
             // Читаем значения и разносим по полям
             if ERRUPDATE=0 then begin       //ERR_UPDATE - если не равно нулю, значит в этой таблице были ошибки, ее пока обрабатывать не будем
                //читаем данные до тех пор, пока не будет шесть знаков тильда
                currentField:=1;
                TmpString:='';
                //WorkA<=Length(WorkString)
                inc(WorkA); // Пропускаем пробел
                repeat
                  while WorkA<=Length(WorkString) do begin
                      WorkChar:=WorkString[WorkA];
                      WorkMet:=WorkMet+WorkChar;
                      if length(WorkMet)=7 then WorkMet:=b_utils.right(WorkMet,6);
                      if WorkChar='~' then begin
                        // Поля значений кончились
                        if CurrentField<=CntField then begin
                          Mem1.Append;
                          if TmpString=EmpTyString then TmpString:='';
                          Mem1.fieldByname('DATA').asstring:=TmpString;
                          Mem1.Post;
                          TmpString:='';
                        end;
                        inc(CurrentField);
                      end else begin
                         TmpString:=TmpString+WorkChar;
                      end;
                      if WorkMet='~~~~~~'+#13+#10 then begin
                         // Строка кончилась
                         WorkA:=length(WorkString)+1;
                      end;
                      inc(WorkA);
                  end;
                  if WorkMet<>'~~~~~~' then begin
                    TmpString:=TmpsTring+#13+#10;
                    // Следующая строка
                    if not eof(FileWork) then begin
                       readln(FileWork,WorkString);
                       inc(CntLines);
                       if CntLines mod 20=0 then begin
                         Label4.caption:=inttostr(CntLines)+' из '+inttostr(AllLines);
                         delay(1);
                       end;
                       WorkA:=1;
                    end else WorkMet:='~~~~~~';
                  end;
                until (WorkMet='~~~~~~') ;


                // *************************************
                // Поля занесены

                if Mem1.RecordCount<>CntField then begin
                  add_log('!!! Возникла ошибка при декодировании данных! Письмо '+ s + ', строка '+ inttostr(CntLines));
                  if CanLog then Memo1.lines.add('Возникла ошибка при декодировании данных! Строка '+ inttostr(CntLines));
                  delay(1);
                  inc(ERRUPDATE);
                end else begin
                  // Все поля верные - выделяем ID и TM
                  REC_ID:=0;
                  REC_TMS:='';
                  for d:=1 to CntField do begin
                    if Arrfield[d].name='TM'  then begin
                      Mem1.RecNo:=d;
                      REC_TMS:=Mem1.fieldByname('DATA').asstring;
                      TmpTs.Date:=strtoint(trim(argc(rec_tms,1)));
                      TmpTs.time:=strtoint(trim(argc(rec_tms,2)));
                      REC_TM:=timeStamptoDatetime(TmpTs);
                    end;
                    if Arrfield[d].name=CurrentTable+'_ID'  then begin
                       try
                         Mem1.RecNo:=d;
                         REC_ID:=strtoint(Mem1.fieldByname('DATA').asstring);
                       except
                       end;
                    end;
                  end;

                  if (REC_TMS='') then begin
                     // Из строки не выделилась время
                    add_log('!!! Из строки не выделилось время!');
                    if CanLog then Memo1.lines.add('Из строки не выделилось время!');
                    delay(1);
                    inc(ERRUPDATE);
                  end else begin
                     // Проверяем, не было ли удаления данной таблицы

//                     WorkTransaction.Active:=False;
                     ADD_SQL(QueryWork,'select 1 from DEL where TABNAME=:TABNAME and TABNAME_ID=:TABNAME_ID');
                     QueryWork.ParamByname('TABNAME').asstring:=CurrentTable;
                     QueryWork.ParamByname('TABNAME_ID').asinteger:=REC_ID;
                     QueryWork.Open;

                     if QueryWork.eof then begin
                        // Пометки удаления не найдено!
                        // Ищем, есть ли указанная запись

                        ADD_SQL(QueryWork,'select TM from '+CurrentTable+' where '+CurrentTable+'_ID=:ID');
                        QueryWork.ParamByname('ID').asinteger:=REC_ID;
                        QueryWork.Open;

                        if QueryWork.eof then begin
                          // Вставляем запись

//                          Datamodule1.IBTransaction2.Active:=False;
//                          Datamodule1.IBTransaction2.StartTransaction;
                          try
                             ibsave_clear;
                             for d:=1 to CntField do begin
                               // Необходимо игнорировать поля, исключенные из обработки
                               TmpD:=0;
                               for TmpC:=1 to Cnt_Nofield do
                                 if (Arr_Nofield[TmpC].TABLENAME=CurrentTable)
                                     and (Arr_Nofield[TmpC].FIELDNAME=Arrfield[d].name) then inc(TmpD);
                               if TmpD=0 then begin
                                 Mem1.RecNo:=d;
                                 case Arrfield[d].typ of
                                  7,8: // Smallint,integer
                                    begin
                                         ibsave_add(Arrfield[d].name,strtoint(Mem1.Fields.fieldByNumber(1).asstring));
                                    end;
                                  10,27: // float,DoublePrec
                                    begin
                                         ibsave_add(Arrfield[d].name,FixedStringToDouble(Mem1.Fields.fieldByNumber(1).asstring));
                                    end;
                                  14,37,261: // char,string;
                                    begin
                                         ibsave_add(Arrfield[d].name,Mem1.Fields.fieldByNumber(1).asstring);
                                    end;
                                  35: // Datetime
                                    begin
                                         REC_TMS:=Mem1.Fields.fieldByNumber(1).asstring;
                                         TmpTs.Date:=strtoint(trim(argc(rec_tms,1)));
                                         TmpTs.time:=strtoint(trim(argc(rec_tms,2)));
                                         ibsave_add(Arrfield[d].name,timeStamptoDatetime(TmpTs));
                                    end;
                                  end;
                               end;
                             end;
                             ibsave_add(CurrentTable+'_ID',-REC_ID);
                             ID:=ibsave_doc(CurrentTable,-1);
                             if ID<0 then r:=sqrt(-1);
//////////////////////////////// попробую делать коммит каждые 20 записей или при смене таблицы
//                             Datamodule1.IBTransaction2.Commit;

                              if CntLines mod CommitInterval=0 then
                                  Datamodule1.IBTransaction2.Commit;

                              
                             if CanLog and CanInsertLog then begin
                                Memo1.lines.add('Строка '+CurrentTable+' добавлена. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                                delay(1);
                             end;
                          except
                             add_log('!!! Ошибка при вставе строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             if CanLog then Memo1.lines.add('Ошибка при вставе строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             delay(1);
                             Datamodule1.IBTransaction2.Rollback;
                             inc(ERRUPDATE);
                             SendErrorMail( 'Ошибка при вставе строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                          end;
//                          Datamodule1.IBTransaction2.Active:=False;
                        end else begin
                          // Запись есть - сверяеем время

                          if QueryWork.fieldByname('TM').asdatetime<REC_TM then begin
                             // Новые данные важнее - изменяем запись
//                             Datamodule1.IBTransaction2.Active:=False;
//                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                                ibsave_clear;
                                for d:=1 to CntField do if Arrfield[d].name<>CurrentTable+'_ID' then begin
                                 // Необходимо игнорировать поля, исключенные из обработки
                                 TmpD:=0;
                                 for TmpC:=1 to Cnt_Nofield do
                                   if (Arr_Nofield[TmpC].TABLENAME=CurrentTable)
                                       and (Arr_Nofield[TmpC].FIELDNAME=Arrfield[d].name) then inc(TmpD);
                                 if TmpD=0 then begin
                                  Mem1.RecNo:=d;
                                  case Arrfield[d].typ of
                                     7,8: // Smallint,integer
                                       begin
                                           ibsave_add(Arrfield[d].name,strtoint(Mem1.Fields.fieldByNumber(1).asstring));
                                       end;
                                     10,27: // float,DoublePrec
                                       begin
                                            ibsave_add(Arrfield[d].name,FixedStringToDouble(Mem1.Fields.fieldByNumber(1).asstring));
                                       end;
                                     14,37,261: // char,string;
                                       begin
                                            ibsave_add(Arrfield[d].name,Mem1.Fields.fieldByNumber(1).asstring);
                                       end;
                                     35: // Datetime
                                       begin
                                            REC_TMS:=Mem1.Fields.fieldByNumber(1).asstring;
                                            TmpTs.Date:=strtoint(trim(argc(rec_tms,1)));
                                            TmpTs.time:=strtoint(trim(argc(rec_tms,2)));
                                            ibsave_add(Arrfield[d].name,timeStamptoDatetime(TmpTs));
                                       end;
                                  end;
                                 end;
                                end;


                                ibsave_add(CurrentTable+'_ID',-REC_ID);
                                ID:=ibsave_doc(CurrentTable,REC_ID);
                                if ID<0 then r:=sqrt(-1);
///////////                                Datamodule1.IBTransaction2.Commit;
                              if CntLines mod CommitInterval=0 then
                                  Datamodule1.IBTransaction2.Commit;



                                if CanLog and CanInsertLog then begin
                                        Memo1.lines.add('Изменение строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                                        delay(1);
                                end;
                             except
                               add_log('!!! Ошибка при изменении строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                               if CanLog then Memo1.lines.add('Ошибка при изменении строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                               delay(1);
                               Datamodule1.IBTransaction2.Rollback;
                               inc(ERRUPDATE);
                               SendErrorMail('Ошибка при изменении строки '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             end;
//                             Datamodule1.IBTransaction2.Active:=False;


                          end else begin
                             if CanLog and CanInsertLog then Memo1.lines.add('Не актуальная строка '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
//                             delay(1);
                          end;
                        end;
                     end;
                     QueryWork.Close;
//                     WorkTransaction.Active:=False;
                  end;
                end;
             end;
           end;
           inc(WorkA);
        end;

      end;

      if DataModule1.IBTransaction2.InTransaction then
        Datamodule1.IBTransaction2.Commit;


      closefile(FileWork);
      if ((ERRUPDATE=0) and (errdel=0)) then begin
        // Фиксируем оработку данных
{                                        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
           ibsave_clear;
           ibsave_add('CFG_NAME','RPLEMAIL');
           ibsave_add('CFG_SET1',inttostr(CODE_SHOP)); // Код настоящего магазина
           ibsave_add('CFG_SET2',inttostr(FROM_SHOP)); // Код магазина, от которого получен пакет
           ibsave_add('CFG_VALUE',MAIL_DT1+' '+MAIL_TM1+' '+MAIL_DT2+' '+MAIL_TM2); // дата-время данных, имеющихся в пакете
           if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
           Datamodule1.IBTransaction2.Commit;}
           if CanLog then Memo1.lines.add('Вложенный файл обработан успешно');

           IBSAVE_CLEAR;
           IBSAVE_ADD('SHOP_ID', CODE_SHOP);
           IBSAVE_ADD('PACKET_NUM', IncomingPacketNum);
           IBSAVE_ADD('SHOP_FROM', FROM_SHOP);
           if IBSAVE_DOC('REPLICAT_LOG', -1)<0 then
            raise Exception.Create('Не удается зафиксировать обработку пакета');

           datamodule1.IBTransaction2.commit;


           delay(1);
           // Если фиксация удалась - удаляем временный файл и сообщение в Outlook
           DeleteF(TMP_PATH+DataFileName);
           inc(cntDelMail);
           ArrDelMail[cntDelMail]:=MailSubject;
{                                       except
           add_log('!!! Не удалось зафиксировать успешную обработку');
           Datamodule1.IBTransaction2.Rollback;
           if CanLog then Memo1.lines.add('Не удалось зафиксировать успешную обработку');
           delay(1);
        end;
        Datamodule1.IBTransaction2.Active:=False;}



      end;
    except
     on e: Exception do
      begin
       add_log('!!! Возникла ошибка при обработке!'+#13 + e.Message);
       SendErrorMail('Возникла ошибка при обработке!'+#13 + e.Message);
       if not AUTOMODE then Messbox('Возникла ошибка при обработке! '+#13+ e.message,'Ошибка!',16);
       inc(ERRUPDATE);
      end;
    end;
  except
    add_log('!!! Вложенный файл поврежден!');
    if CanLog then Memo1.lines.add('Вложенный файл поврежден!');
    delay(1);
    SendErrorMail('Вложенный файл поврежден!');
  end;
end;


procedure TMAIN_FORM.add_log(s:ansistring);
begin
  try
     writeln(logfile,datetimetostr(my_now())+' '+s);
  except
  end;
end;

procedure TMAIN_FORM.ButtonDefaultClick(Sender: TObject);
var i: integer;
begin
  // Плановая связь
  CustomTable := false;
  SaveSyncDate := true;
  CustomTable := false;
  DataFileEmpty:=true;
  REDataFileEmpty:=true;
  SyncshopNum := -1;

  AUTO_GET_TIME;

  ExportZTrindefs;


  if ExportData=0 then begin
              // Письма выложены в исходящие
              add_log('Письма выложены в папку "Исходящие"');
              if not AutoMode then Messbox('Письма помещены в папку "Исходящие". Сделайте доставку электронной почты и нажмите [OK]!','Сообщение!',48);
              // Вызываем проверку почты
              BtnResiveEmail.click;
  end;


  //проверяем что время синхронизации магазинов в норме
  if (Frac(NETSENDUSERSTIMESTART) < frac(now))  and (Frac(NETSENDUSERSTIMEEND) > frac(now)) then
  begin

    try
    querywork.SQL.Text:='SELECT case when max(tm) - min(tm)> 1/24 then 1 else 0 end DELTA,(select first 1 shop_name from last_dial('+inttostr(CODE_SHOP)+') order by tm) shop_name, min(tm) tm  from last_dial('+inttostr(CODE_SHOP)+')';


    querywork.Open;

      if QueryWork.FieldByName('DELTA').asinteger=1 then
      begin
        SendErrorMail('Проблемы в синхронизации. '+chr(13)+' Нет данных от '+QueryWork.FieldByName('SHOP_NAME').asstring+'(последние данные на '+QueryWork.FieldByName('TM').asstring+').');
        for i := 0 to NetSendUsers.Count-1 do
          NetSend( NetSendUsers[i], 'Проблемы в синхронизации. Сообщите администратору'+chr(13)+'Нет данных от '+QueryWork.FieldByName('SHOP_NAME').asstring+'(последние данные на '+QueryWork.FieldByName('TM').asstring+') .');
      end

    except
    end;


  end;


  close;
end;






function WindowsCopyFile(FromFile, ToDir : string) : boolean;
var F : TShFileOpStruct;
begin
F.Wnd := 0; F.wFunc := FO_COPY;
FromFile:=FromFile+#0; F.pFrom:=pchar(FromFile);
ToDir:=ToDir+#0; F.pTo:=pchar(ToDir);
F.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
result:=ShFileOperation(F) = 0;
end;


procedure TMAIN_FORM.ExportZTrindefs;
var  SakMSG1:TSakMSG;
mailSended: boolean;
begin
//
   OPEN_SQL(QueryWork,'select trindef_id, dostup, ee.emails, ee.mail_subject, ee.mail_body from exp_trindefs_to_mail ee');
   Cnt_Nofield:=0;
   while not QueryWork.eof do begin
     try
       SakMSG1:=TSakMSG.Create(nil);
       SakMsg1.SendTo:=queryWork.fieldbyname('emails').asString;
       SakMsg1.Subject := queryWork.fieldbyname('mail_subject').asString;
///////////////////добавляю номер отсылаемого пакета

       SakMsg1.MessageType:=mtHtml;
       SakMsg1.Text.Clear;
       SakMsg1.Text.Add(queryWork.fieldbyname('mail_body').asString);


       SakMsg1.CharSet := 'windows-1251';
       SakMsg1.TextEncoding := te8Bit;
       SakMsg1.UserName :=FromEmailAddress;//TITLE_EMAIL;
       SakMsg1.From := FromEmailAddress;

       SakSMTP1.host := EMAIL_HOST;
//                       filename1:=SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject;
//                       filename1:=stringreplace(filename1, '/', ' ', [rfReplaceAll]);
//                       filename1:=stringreplace(filename1, '*', ' ', [rfReplaceAll]);
//                       WindowsCopyFile(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3), filename1);

        add_log('Отправка пакета: '+SakMsg1.Subject);
        add_log('Отправка пакета: '+SakMsg1.SendTo);

       SakSMTP1.connect;
       if not SakSMTP1.SMTPError then
       begin
          SakSMTP1.SendTheMessage( SakMsg1);
          add_log('Отправлен пакет: '+SakMsg1.Subject);

//                          renamefile(SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject, SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject+formatdatetime('yyyy-mm-dd-hh-nn-ss', date));
       end
       else
        mailSended:=false;
       SakSMTP1.Disconnect;
     except
      on e: Exception do
       begin
        mailSended:=false;
        add_log('!!! Ошибка отправки почты - синхронизации'+chr(13)+e.message);
       end;
     end;

     SakMSG1.Destroy;
     QueryWork.next;
  end;

  if mailSended then
    querywork.Transaction.Commit;
end;


function TMAIN_FORM.ExportData:integer;
var
  MyMail:Variant;
  ERR:integer;
  TmpA,CntFiles, cntREFiles:integer;
  TmpS:ansistring;
  r:double;
  ts:ttimestamp;
  ID:integer;
  myfile: file;

  filename1: string;


  mailSended: boolean;

  SakMSG1:TSakMSG;
//  fsize: longint;
//  reFSize: longint;
begin
  tag:=0;
  if IDCFG>0 then begin
    begin
      //Формируем пакет с изменениями;

      REFileName:='RE_RplData_'+floattostr(now)+'.tmp';
      FileName:='RplData_'+floattostr(now)+'.tmp';

      if MakeData()=0 then
      begin
           // Данные подготовлены успешно

           if (ERR=0)    then
           begin
              add_log('Делим на пакеты...');
              if CanLog then Memo1.lines.add('Разделение данных на пакеты...');
              delay(1);

              if FileExists(TMP_PATH+FileName) then
              begin
              // Дробим
              CntFiles:=Trim_File(TMP_PATH,FileName,FileName,MAX_LINES_COUNT);
              if CntFiles<0 then begin
                // Ошибка бри разбивке файла на части
                add_log('!!! Ошибка при разбивке файла на части!');
                inc(ERR);
              end else
              begin
                 // Формируем письма
                 add_log('Сжимаем и формируем письма...');
                 if CanLog then Memo1.lines.add('Формирование писем...');
                 if CanLog then Memo1.lines.add('Сжатие данных...');
                 delay(1);
                 for Tmpa:=1 to CntFiles Do
                 Begin
                 Compressor.CompressMode := Good;  //Fast or Good
                 Compressor.InputFile := TMP_PATH+FileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3);
                 Compressor.OutputFile := TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3);
                 Try
                    Compressor.Compress;
                 Except
                   on e: Exception do
                   begin
                   inc(ERR);
                   if not AUTOMODE then messbox('Ошибка сжатия данных!'+ e.Message,'Ошибка',16);
                   end;
                 End;
                 end;
                 delay(1);
                 // Формируем составной адрес по магазинам
                 TmpS:='';
                 for TmpA:=1 to CntShops do if ArrShops[TmpA].ID<>CODE_SHOP then TmpS:=TmpS+ArrSHops[TmpA].Addres+', ';
                 TmpS:=trim(TmpS);
                 if B_utils.right(TmpS,1)=',' then TmpS:=b_utils.left(TmpS,Length(TmpS)-1);
                 add_log('Отправляем письма...');
                 if CanLog then Memo1.lines.add('Отправка писем...');
                 delay(1);
                 TmpTs:=DatetimeTotimeStamp(MainPeriod1);
                 TmpTs2:=DatetimeTotimeStamp(MainPeriod2);


                 mailSended:=true;  //если true - записать в базе время последней синхронизации, иначе повторять пока не отправится.

                 for Tmpa:=1 to CntFiles Do
                 Begin
                   if USE_OUTLOOK_FOR_SEND_MAIL then
                   begin

                     MyMail:=OutlookConnect1.Outbox.Items.Add;
                     // MyMail.Display; // Показать на экран
                      MyMail.To:=TmpS; // Кому
                     MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // Тема без дат
  ///////////////////добавляю номер отсылаемого пакета
                     MyMail.Subject:=MyMail.Subject+'-'+inttostr(PacketNum)+'';
                     MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+' '+
                     formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                     formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                     ' Part '+inttostr(TmpA)+'/'+inttostr(CntFiles);
                     MyMail.Attachments.add(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                     MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
                     MyMail.Body := 'Последний пакет '+ inttostr(PacketNum);
                     MyMail.Save; // Сохраняем
                     MyMail.Send; // Отправяем
                   end
                   else
                   begin
                     try
                       SakMSG1:=TSakMSG.Create(nil);
                       SakMsg1.SendTo:=TmpS; // Кому
                       SakMsg1.Subject := Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // Тема без дат
    ///////////////////добавляю номер отсылаемого пакета
                       SakMsg1.Subject :=SakMsg1.Subject+'-'+inttostr(PacketNum)+'';
                       SakMsg1.Subject :=SakMsg1.Subject+'-'+My_dat(date()-1)+' '+
                       formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                       formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                       ' Part '+inttostr(TmpA)+'/'+inttostr(CntFiles);
                       SakMsg1.Subject :=SakMsg1.Subject+' '+inttostr(CONTROLSUMM(SakMsg1.Subject));

                       SakMsg1.AttachedFiles.Add(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));

                       SakMsg1.MessageType:=mtPlain;
                       SakMsg1.Text.Clear;
                       SakMsg1.Text.Add('Последний пакет '+ inttostr(PacketNum));


                       SakMsg1.CharSet := 'windows-1251';
                       SakMsg1.TextEncoding := te8Bit;
                       SakMsg1.UserName :=FromEmailAddress;//TITLE_EMAIL;
                       SakMsg1.From := FromEmailAddress;

                       SakSMTP1.host := EMAIL_HOST;
//                       filename1:=SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject;
//                       filename1:=stringreplace(filename1, '/', ' ', [rfReplaceAll]);
//                       filename1:=stringreplace(filename1, '*', ' ', [rfReplaceAll]);
//                       WindowsCopyFile(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3), filename1);

                        add_log('Отправка пакета: '+SakMsg1.Subject);
                        add_log('Отправка пакета: '+SakMsg1.SendTo);

                       SakSMTP1.connect;
                       if not SakSMTP1.SMTPError then
                       begin
                          SakSMTP1.SendTheMessage( SakMsg1);
                          add_log('Отправлен пакет: '+SakMsg1.Subject);

//                          renamefile(SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject, SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject+formatdatetime('yyyy-mm-dd-hh-nn-ss', date));
                       end
                       else
                        mailSended:=false;
                       SakSMTP1.Disconnect;
                     except
                      on e: Exception do
                       begin
                        mailSended:=false;
                        add_log('!!! Ошибка отправки почты - синхронизации'+chr(13)+e.message);
                       end;
                     end;

                     SakMSG1.Destroy;

                   end;
                 end;
              end;
           end;
           end;
//для RE

            if postRE and FileExists(TMP_PATH+REFileName) then
             begin
                // Дробим

              CntREFiles:=Trim_File(TMP_PATH,REFileName,REFileName,MAX_LINES_COUNT);
              if (CntREFiles<0 ) then
              begin
                // Ошибка бри разбивке файла на части
                add_log('!!! Ошибка при разбивке файла на части!');
                inc(ERR);
              end else
              begin
                 // Формируем письма
                 add_log('Формируем письма...');
                 if CanLog then Memo1.lines.add('Формирование писем...');
                 delay(1);
                 for Tmpa:=1 to CntREFiles Do
                 Begin
                 Compressor.CompressMode := Good;  //Fast or Good
                 Compressor.InputFile := TMP_PATH+REFileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3);
                 Compressor.OutputFile := TMP_PATH+REFileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3);
                 Try
                    Compressor.Compress;
                 Except
                   on e: Exception do
                   begin
                   inc(ERR);
                   if not AUTOMODE then messbox('Ошибка сжатия данных!'+ e.Message,'Ошибка',16);
                   end;
                 End;
                 end;
                 // Формируем составной адрес по магазинам
                 TmpS:='';

                 for TmpA:=1 to CntREShops do if ArrREShops[TmpA].ID<>CODE_SHOP then TmpS:=TmpS+ArrRESHops[TmpA].Addres+'; ';
                 TmpS:=trim(TmpS);
                 if B_utils.right(TmpS,1)=';' then TmpS:=b_utils.left(TmpS,Length(TmpS)-1);
                 add_log('Отправляем письма...');
                 if CanLog then Memo1.lines.add('Отправка писем...');
                 delay(1);
                 TmpTs:=DatetimeTotimeStamp(MainPeriod1);
                 TmpTs2:=DatetimeTotimeStamp(MainPeriod2);
//                 inc(PacketNum);
                 for Tmpa:=1 to CntREFiles Do
                 Begin
                   MyMail:=OutlookConnect1.Outbox.Items.Add;
                   // MyMail.Display; // Показать на экран
                    MyMail.To:=TmpS; // Кому
                   MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // Тема без дат
///////////////////добавляю номер отсылаемого пакета
                   MyMail.Subject:=MyMail.Subject+'-'+inttostr(PacketNum)+'';
                   MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+' '+
                   formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                   formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                   ' Part '+inttostr(TmpA)+'/'+inttostr(CntREFiles);
                   MyMail.Attachments.add(TMP_PATH+REFileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
                   MyMail.Body := 'Последний пакетреестра'+ inttostr(PacketNum);
                   MyMail.Save; // Сохраняем
                   MyMail.Send; // Отправяем
                 end;
              end;
             end;



                 if not SaveSyncDate then
                  begin
                     add_log('Дата синхронизации не сохранена исходя из натроек программы');
                     main_form.Memo1.lines.add('Дата синхронизации не сохранена исходя из натроек программы');
                  end
                 else
                 if CustomTable then
                 begin
                 add_log('Выгрузилась только таблица '+CustomTableName+', время последней синхронизации не меняется');
                 main_form.Memo1.lines.add('Выгрузилась только таблица RE, время последней синхронизации не меняется');

                 end  else
                 if mailSended then     //пиьсма были оправлены в OUTLOOK или успешно напрямую
                 begin
                 // Фиксируем время отправки последнийх изменений
                 add_log('Письма отправлены. Фиксируем время отправки...');
                 Datamodule1.IBTransaction2.Active:=False;
                 Datamodule1.IBTransaction2.StartTransaction;
                 try
                   ibsave_clear;
                   ibsave_add('cfg_name','RPLEMAIL_LAST_TIME_SEND');
                   ibsave_add('cfg_set1',CODE_SHOP);
                   ts:=DateTimeToTimeStamp(MainPeriod2);
                   ibsave_add('cfg_value',inttostr(ts.date)+' '+inttostr(ts.time));
                   IDCFG:=ibsave_doc('CFG',IDCFG);
                   if IDCFG<0 then r:=sqrt(-1);
                   Datamodule1.IBTransaction2.Commit;



                   main_form.Memo1.lines.add('Время отправки сохранено!');
                   add_log('Время отправки сохранено!');
                 except
                    add_log('!!! Ошибка при сохранении времени отправки!');
                    inc(ERR);
                    Datamodule1.IBTransaction2.Rollback;
                 end;
                 Datamodule1.IBTransaction2.Active:=False;

                 end;
                 add_log('Удаляем временные файлы...');
                 // Удаляем файлы
                 for TmpA:=1 to CntFiles do DELETEF(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                 for TmpA:=1 to CntFiles do DELETEF(TMP_PATH+FileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3));
                 DeleteFile(TMP_PATH+FileName);
                 DeleteFile(TMP_PATH+FileName);

                 if PostRE then
                   begin
                   // Удаляем файлы
                   for TmpA:=1 to CntREFiles do DELETEF(TMP_PATH+REFileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   for TmpA:=1 to CntREFiles do DELETEF(TMP_PATH+REFileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   DeleteFile(TMP_PATH+REFileName);
                   DeleteFile(TMP_PATH+REFileName);
                   end;

           end
//      end
      else
      begin
         add_log('!!!! Ощибка при подготовке данных!');
         if not AUTOMODE then Messbox('Ошибка при подготовке данных!','',48);
         // Была ошибка при подготовке данных
      end;
    end;
  end;
  result:=ERR;
end;

procedure TMAIN_FORM.FormShow(Sender: TObject);
var
  t:textfile;
  ERR:integer;
  s:ansistring;
  s1,s2,s3,s4:ansistring;
  tmps:ansistring;
  f: string;
begin

  NetSendUsers:=TStringList.Create;
//  NETSENDUSERSTIMESTART:=StrtoDatetime('01/01/2000 08:00');
//  NETSENDUSERSTIMESTART:=StrtoDatetime('01/01/2000 17:00');
  SaveSyncDate := true;
  DataFileEmpty:=true;
  REDataFileEmpty:=true;
  SyncShopNum := -1;
  try
    assignfile(LogFile,'RplEmail.log');
    if fileexists('RplEmail.log') then Append(Logfile)
    else rewrite(Logfile);
  except
  end;
  AUTOMODE:=False;
  Memo1.lines.clear;
  MAIN_DESCR:='';
  CODE_SHOP:=0; // Код магазина
  POCKET_PATH:=''; // Путь к пакетам
  DataBase_Path:='';
  IF not directoryExists('c:\temp\') then begin
            add_log('!!! Не найден временный файл!');
  end;
  TMP_PATH:='C:\TEMP\';
  add_log('Читаем файл конфигурации...');
  // Читаем файл конфигурации
  CntShops:=0;
  CntREShops:=0;
  ERR:=0;
  PostRE := false;
  try
    assignfile(t,'RplEmail.set');
    reset(t);
    while not eof(t) do begin
       readln(t,s);
       s1:=ansiuppercase(trim(Argc(s,1)));
       if s1='TITLE' then begin
          // Выделяем параметры
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // Первый параметр
          end;
          Main_form.caption:='Система складского учета Bsklad. (R) Beginner 2001. '+s3;
       end;
       if s1='DATABASEPATH' then begin
          // Выделяем параметры
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // Первый параметр
          end;
          DataBase_path:=s3;
          Memo1.lines.add('Путь к базе: "'+Database_path+'"');
       end;
       if s1='POCKETPATH' then begin
          // Выделяем параметры
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // Первый параметр
          end;
          POCKET_PATH:=S3; // Путь к пакетам
          Memo1.lines.add('Путь пакетов: "'+s3+'"');
       end;
       if s1='CODESHOP' then begin
          try
           CODE_SHOP:=strtoint(Argc(s,2));
           Memo1.lines.add('Код базы: "'+inttostr(CODE_SHOP)+'"');
          except
            add_log('Неверный код магазина "CODESHOP"  в файле конфигурации RplEmail.set!');
            messbox('Неверный код магазина "CODESHOP"  в файле конфигурации RplEmail.set!','Ошибка!',16);
            inc(ERR);
          end;
       end;
       if s1='MAINDESCR' then begin
         MAIN_DESCR:=trim(argc(s,2));
         Memo1.lines.add('Дескриптор: "'+MAIN_DESCR+'"');
       end;


       if s1='EMAILADDRES' then begin
          //Читаем перечень адресов
          inc(CntShops);
          ArrShops[CntShops].ID:=strtoint(trim(Argc(s,2)));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=b_utils.right(s,length(s)-pos('"',s));
          s3:=b_utils.left(s,pos('"',s)-1); // Первый параметр
          s:=b_utils.right(s,length(s)-pos('"',s));
          s4:=trim(s); // Второй параметр
          ArrShops[CntShops].name:=s3;
          ArrShops[CntShops].Addres:=s4;
          tmps:='Адресная книга: '+s3+', Email: '+s4;
          if ArrShops[CntShops].ID=CODE_SHOP then
          begin tmps:=tmps+' - Собственный адрес!';
          FromEmailAddress:=ArrShops[CntShops].Addres;
          end;
          Memo1.lines.add(tmps);

       end;
       if s1='REEMAILADDRES' then begin
          //Читаем перечень адресов
          inc(CntREShops);
          ArrREShops[CntREShops].ID:=strtoint(trim(Argc(s,2)));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=b_utils.right(s,length(s)-pos('"',s));
          s3:=b_utils.left(s,pos('"',s)-1); // Первый параметр
          s:=b_utils.right(s,length(s)-pos('"',s));
          s4:=trim(s); // Второй параметр
          ArrREShops[CntREShops].name:=s3;
          ArrREShops[CntREShops].Addres:=s4;
          tmps:='Адресная книга RE: '+s3+', Email: '+s4;
          if ArrREShops[CntREShops].ID=CODE_SHOP then tmps:=tmps+' - Собственный адрес!';
          Memo1.lines.add(tmps);
          PostRE := true;
       end;
       if s1='GETRE' then begin
         if trim(argc(s,2))='1' then  GetRE:=true
         else GetRE := false;
       end;

       if s1='USE_OUTLOOK_FOR_SEND_MAIL' then begin
         if trim(argc(s,2))='1' then  USE_OUTLOOK_FOR_SEND_MAIL:=true
         else USE_OUTLOOK_FOR_SEND_MAIL := false;
       end;

       if s1='SENDED_MAIL_DIRECTORY' then begin
         SENDED_MAIL_DIRECTORY:=trim(argc(s,2));
       end;




       if s1='ADD_TIME' then begin
          try
           ADD_TIME:=strtoint(Argc(s,2));
           Memo1.lines.add('Выгружается дополнительно : '+inttostr(ADD_TIME)+' минут');
          except
          end;
       end;
       if s1='MAX_LINES_COUNT' then begin
          try
           MAX_LINES_COUNT:=strtoint(Argc(s,2));
           Memo1.lines.add('Макс размер письма '+inttostr(MAX_LINES_COUNT)+' строк');
          except
          end;
       end;

       if s1='COMMIT_INTERVAL' then begin
          try
           CommitInterval:=strtoint(Argc(s,2));
           Memo1.lines.add('Коммит каждые '+inttostr(CommitInterval)+' строк');
          except
          end;
       end;
       if s1='ADMIN_EMAIL' then begin
         AdminEmail:=trim(argc(s,2));
         Memo1.lines.add('Адрес администратора: "'+AdminEmail+'"');
       end;

       if s1='EMAIL_HOST' then begin
         EMAIL_HOST:=trim(argc(s,2));
         Memo1.lines.add('Адрес сервера эл. почты: "'+EMAIL_HOST+'"');
       end;


       if s1='DISABLE_MULTIPLE_INSTANCES' then begin
          EMAIL_HOST:=trim(argc(s,2));
         if trim(argc(s,2))='1' then  DISABLE_MULTIPLE_INSTANCES:=true
         else DISABLE_MULTIPLE_INSTANCES := false;
       end;

       if s1='NETSENDUSERSTIMESTART' then begin
         NETSENDUSERSTIMESTART:=strtodatetime(trim(argc(s,2)));
       end;

       if s1='NETSENDUSERSTIMEEND' then begin
         NETSENDUSERSTIMEEND:=strtodatetime(trim(argc(s,2)));
       end;

       if s1='NETSENDUSER' then begin
         NetSendUsers.Add(trim(argc(s,2)));
         Memo1.lines.add('посылка предупреждений WinPopup : '+NetSendUsers[NetSendUsers.count-1]);
       end;


    end;
  except
    inc(Err);
    add_log('!!! Ошибка чтения файла конфигурации!');
  end;
  try
    closefile(t);
  except
  end;



  begin

      if OutlookConnect1.Connected then begin
        ButtonDefault.enabled:=True;
        BtnResiveEmail.enabled:=True;
        BtnRepeat.enabled:=True;
        Button1.Enabled:=false;
        if paramcount=1 then begin
         if trim(ansiuppercase(ParamStr(1)))='-AUTO' then begin
            add_log('');
            add_log('Запущен АВТОрежим!');
            caption:='Авторежим. '+caption;
            AutoTimer.enabled:=True;
            AutoMode:=True;
         end;

         if trim(ansiuppercase(ParamStr(1)))='-GETRE' then begin
            add_log('');
            add_log('Запущена загрузка реестра!');
            caption:='Загрузка реестра.'+caption;
    //        AutoTimer.enabled:=True;
    //        AutoMode:=True;
              ButtonDefault.enabled:=false;
              BtnRepeat.enabled:=false;
              BtnResiveEmail.enabled:=true;
              CheckBox1.Enabled:=False
         end;


        end else begin
           // интеррактивный режим
          if  (HiWord(GetKeyState(VK_MENU)) <> 0) and (HiWord(GetKeyState(VK_CONTROL)) <> 0) then
           begin
              // нажаты ALT и CTRL
              ButtonDefault.enabled:=true;
              BtnRepeat.enabled:=true;
              BtnResiveEmail.enabled:=true;
              CheckBox1.Enabled:=true;
              button1.Enabled:=true;
           end
         else
           begin
              // простой режим
              ButtonDefault.enabled:=true;
              BtnRepeat.enabled:=false;
              BtnResiveEmail.enabled:=false;
              CheckBox1.Enabled:=False;
           end;
        end;
      end else begin
        // Не удалось подключиться к Outlook
        add_log('!!! Нет соединения с Microsoft Outlook!');
        if not AUTOMODE then Messbox('Нет соединения с Microsoft Outlook!','Ошибка конфигурации!',16);
      end;

  end;


  AtomText:='ATOM_'+MAIN_DESCR;

  if LookForPreviousInstance=true then
  begin
    Close;
    SendErrorMail('Программа не запущена, т.к. не закрыта другая копия программы');
  end


end;

procedure TMAIN_FORM.Button2Click(Sender: TObject);
var
  MyMail:Variant;
begin
  // Формируем письмо c запросом суммы прошлого дня
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('Нельзя послать письмо самому себе!','Ошибка!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // Показать на экран
      MyMail.To:=Select_to.statusbar1.panels[0].text; // Кому
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-03-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // Тема без дат
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
      MyMail.Save; // Сохраняем
      MyMail.Send; // Отправяем
      add_log('Запрос суммы прошлого дня отправлен в "'+Select_to.combobox1.text+'"!');
      Messbox('Запрос суммы прошлого дня отправлен в "'+Select_to.combobox1.text+'"!','Сообщение!',48);
    end;
  end;
  Select_to.destroy;
end;

function my_dat(dt:tdatetime):ansistring;
var
   dd,mm,yy:word;
begin
   decodedate(dt,yy,mm,dd);
   result:=b_utils.right('0000'+inttostr(yy),4)+'/'+
      b_utils.right('0000'+inttostr(mm),2)+'/'+
      b_utils.right('0000'+inttostr(dd),2);
end;

procedure TMAIN_FORM.Button3Click(Sender: TObject);
var
  MyMail:Variant;
begin
  // Формируем письмо c запросом всех данных прошлого дня
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('Нельзя послать письмо самому себе!','Ошибка!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // Показать на экран
      MyMail.To:=Select_to.statusbar1.panels[0].text; // Кому
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-04-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // Тема без дат
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
      MyMail.Save; // Сохраняем
      MyMail.Send; // Отправяем
      add_log('Запрос суммы прошлого дня отправлен в "'+Select_to.combobox1.text+'"!');
      Messbox('Запрос суммы прошлого дня отправлен в "'+Select_to.combobox1.text+'"!','Сообщение!',48);
    end;
  end;
  Select_to.destroy;
end;

procedure TMAIN_FORM.Button4Click(Sender: TObject);
var
  MyMail:Variant;
begin
  // Формируем письмо c запросом отгрузки и получения
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('Нельзя послать письмо самому себе!','Ошибка!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // Показать на экран
      MyMail.To:=Select_to.statusbar1.panels[0].text; // Кому
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-06-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // Тема без дат
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));

      MyMail.Save; // Сохраняем
      MyMail.Send; // Отправяем
      OutlookConnect1.Outbox.Items.
      add_log('Запрос отгрузки и получения прошлого дня отправлен в "'+Select_to.combobox1.text+'"!');
      Messbox('Запрос отгрузки и получения прошлого дня отправлен в "'+Select_to.combobox1.text+'"!','Сообщение!',48);
    end;
  end;
  Select_to.destroy;
end;

function TMAIN_FORM.MakeData:integer;
var
   CntTable:integer;
   ArrTable:array[1..500] of ansistring;
   ERR:integer;
   TmpFile:textfile;
   TmpREFile: textfile;
   TmpA,TmpB,TmpC,TmpD:integer;
   TmpS,Float_Separator:ansistring;
   r:double;
   tmpStr: ansistring;



   tableName: ansistring;
   fieldName: ansistring;
   fieldType: integer;
   fieldNum: integer;
   f: file;
   f_size: longint;

begin
  result:=-1;
  DataFileEmpty:=true;
  REDataFileEmpty:=true;

  ERR:=0;

  // Процедура формирует пакет с даными
  // База уже должна быть подключена

  //Создаем в базе запись с номером нового пакета.
  //Здесь надо явно указать время создания пакета чтобы он попал в синхронизацию.


  IBSAVE_CLEAR;
  IBSAVE_ADD('SHOP_FROM', CODE_SHOP);
  IBSAVE_ADD('SHOP_ID', CODE_SHOP);
  IBSAVE_ADD('PACKET_NUM', PacketNum );
  IBSAVE_ADD('TM', MainPeriod2);
  if IBSAVE_DOC('REPLICAT_LOG', -1)<0 then
    Raise Exception.Create('Ошибка записи номера посылаемого пакета');
  DataModule1.IBTransaction2.Commit;



  if CanLog then main_form.Memo1.lines.add('Подготовка данных к выгрузке за период с '+
    datetimetostr(MainPeriod1)+' по '+datetimetostr(MainPeriod2));
   main_form.Memo1.lines.add('Загружаем список полей, исключенных из обработки...');
   OPEN_SQL(QueryWork,'select cfg_value from cfg where cfg_name="LINK_NOFIELD"');
   Cnt_Nofield:=0;
   while not QueryWork.eof do begin
     inc(Cnt_Nofield);
     Arr_Nofield[Cnt_Nofield].Tablename:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),1)));
     Arr_Nofield[Cnt_Nofield].fieldName:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),2)));
     QueryWork.next;
  end;
  CntTable:=0;
  // Загружаем список таблиц, которые участвуют в пересылке данных
  try
    if not CustomTable then
    begin
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select TABLE_NAME from LIST_TABLE_REPLICAT');
    while not QueryWork.eof do begin
      inc(CntTable);
      ArrTable[CntTable]:=QueryWork.fieldByname('TABLE_NAME').asstring;
      QueryWork.next;
    end;
    QueryWork.close;

    if PostRE  then
      begin
        inc(CntTable);
        ArrTable[CntTable]:='RE';
      end;
    end
    else
     begin
        inc(CntTable);
        ArrTable[CntTable]:=customTableName;
     end;



    if SyncshopNum <> -1 then
    begin
    CntTable := 0;
    inc(CntTable);
    ArrTable[CntTable] := 'CFG';
    end;


    if CanLog then Memo1.lines.add('Всего '+inttostr(CntTable)+' таблиц для пересылки.');
    try
      
      Assignfile(TmpFile,TMP_PATH+FileName);
      Rewrite(TmpFile);
      if PostRE  then
       begin
              Assignfile(TmpREFile,TMP_PATH+REFileName);
              Rewrite(TmpREFile);
       end;
    except
      inc(Err);
      add_log('Ошибка при открытии временного файла данных!');
      if not AUTOMODE then Messbox('Ошибка при открытии временного файла данных!',MessError,16);
    end;




    if Err=0 then begin
     // Выгружаем данные
     try
    if SyncShopNum = -1 then
    begin
      // Выгружаем удаленные данные
      if CanLog then Memo1.lines.add('Запрос удаленных данных...');
      delay(1);
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select tabname,tabname_id from del where tm between :DT1 and :DT2');
      QueryWork.paramByname('DT1').asdatetime:=MainPeriod1;
      QueryWork.paramByname('DT2').asdatetime:=MainPeriod2+1/24;
      QueryWork.open;
      if QueryWork.eof then begin
        if CanLog then Memo1.lines.add('Удаленных данных нет!');
        delay(1);
        add_log('Удаленных данных нет!');
      end else begin
        add_log('Выгрузка удаленных данных...');
        if CanLog then Memo1.lines.add('Выгрузка удаленных данных...');
        delay(1);
        writeln(TmpFile,'~~~~##D Блок удаленных данных');
        if PostRE then writeln(TmpREFile,'~~~~##D Блок удаленных данных');
        while not QueryWork.eof do begin

          if (not CustomTable) and (PostRE) and(trim(ansiuppercase(QueryWork.fieldByname('TABNAME').asstring)) = 'RE')  then
            begin
                writeln(TmpREFile,'~~~~1 '+trim(ansiuppercase(QueryWork.fieldByname('TABNAME').asstring))+' '+
                inttostr(QueryWork.fieldByname('TABNAME_ID').asinteger));
                REDataFileEmpty := false;
            end  else
            begin
              if (CustomTable and  (trim(ansiuppercase(QueryWork.fieldByname('TABNAME').asstring)) = CustomTableName))or ( (not CustomTable) and( trim(ansiuppercase(QueryWork.fieldByname('TABNAME').asstring)) <> 'RE')) then
              begin
                writeln(TmpFile,'~~~~1 '+trim(ansiuppercase(QueryWork.fieldByname('TABNAME').asstring))+' '+
                inttostr(QueryWork.fieldByname('TABNAME_ID').asinteger));
                DataFileEmpty := false;
              end;

            end;
          QueryWork.next;
        end;
        writeln(TmpFile,'~~~~##DX Конец блока удаленных данных');
        if PostRE then writeln(TmpREFile,'~~~~##DX Конец блока удаленных данных');
      end;

   end;

      for TmpA:=1 to CntTable do
      begin

           if CanLog then Memo1.lines.add('Запрос полей таблицы "'+ArrTable[TmpA]+'" '+inttostr(TmpA)+' из '+inttostr(CntTable)+'...');
           // Выгружаем в файл структура таблицы
           WorkTransaction.Active:=False;
           // Запрашиваем измененные данные
           ADD_SQL(QueryWork2,'select * from '+ArrTable[TmpA]+' where TM between :DT1 and :DT2');
           QueryWork2.paramByname('DT1').asdatetime:=MainPeriod1;
           if SyncShopNum <> -1 then
                      QueryWork2.paramByname('DT2').asdatetime:=MainPeriod2+1
           else       QueryWork2.paramByname('DT2').asdatetime:=MainPeriod2+1/24;
           if CanLog then Memo1.lines.add('Запрос изменений таблицы "'+ArrTable[TmpA]+'" '+inttostr(TmpA)+' из '+inttostr(CntTable)+'...');
           delay(1);
           QueryWork2.open;


           if not QueryWork2.eof then
           begin // Есть данные
              ADD_SQL(QueryWork,'select R.RDB$RELATION_NAME, R.RDB$FIELD_POSITION, R.RDB$FIELD_NAME, '+
              'F.RDB$FIELD_LENGTH, F.RDB$FIELD_TYPE, F.RDB$FIELD_SCALE, F.RDB$FIELD_SUB_TYPE '+
              'from RDB$FIELDS F, RDB$RELATION_FIELDS R '+
              'where F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE and R.RDB$SYSTEM_FLAG = 0 '+
              'and RDB$RELATION_NAME = :TABLENAME '+
              'order by R.RDB$RELATION_NAME, R.RDB$FIELD_POSITION');
              QueryWork.ParamByname('TABLENAME').asstring:=ArrTable[TmpA];
              QueryWork.Open;
              if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then
              begin
                write(TmpREFile,'~~~~### '+ArrTable[TmpA]+' ');
                REDataFileEmpty := false;
              end else
              begin
              write(TmpFile,'~~~~### '+ArrTable[TmpA]+' ');
              DataFileEmpty := false;
              end;

              while not QueryWork.eof do begin
                // Необходимо пропустить поля, которые нельзя выгружать
{                TmpD:=0;
                for TmpC:=1 to Cnt_Nofield do
                  if (ansiuppercase(trim(QueryWork.fieldByname('RDB$FIELD_NAME').asstring))=Arr_nofield[TMPC].FieldName)
                     and (ArrTable[TmpA]=Arr_nofield[TMPC].TableName) then inc(TmpD);
                if TmpD=0 then
}
//                 begin
                  if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then write(TmpREFile,trim(QueryWork.fieldByname('RDB$FIELD_NAME').asstring)+' '+trim(QueryWork.fieldByname('RDB$FIELD_TYPE').asstring)+' ')
                    else write(TmpFile,trim(QueryWork.fieldByname('RDB$FIELD_NAME').asstring)+' '+trim(QueryWork.fieldByname('RDB$FIELD_TYPE').asstring)+' ');
//                 end;
                QueryWork.next;
              end;
              if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then writeln(TmpREFile,'~~~~.')
                else writeln(TmpFile,'~~~~.');
           end;


           QueryWork2.Last;
           QueryWork2.First;
           while not QueryWork2.eof do
           begin
             // Выгрузка полей
             QueryWork.first;
             if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then write(TmpREFile,'~~~~2 ')
             else write(TmpFile,'~~~~2 ');

             while not QueryWork.eof do
             begin
             TmpD := 0;
             fieldName := ansiuppercase(trim(QueryWork.fieldByname('RDB$FIELD_NAME').asstring));


               case QueryWork.fieldByname('RDB$FIELD_TYPE').asinteger of
                 7,8: // Smallint,integer
                   begin
                     if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then write(tmpREFile,inttostr(QueryWork2.fieldByname(fieldName).asinteger)+'~')
                        else write(tmpFile,inttostr(QueryWork2.fieldByname(fieldName).asinteger)+'~');
                   end;
                 10,27: // float,DoublePrec
                   begin
                     if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then write(tmpREFile,DoubleToFixedString(QueryWork2.fieldByname(fieldName).asfloat)+'~')
                     else write(tmpFile,DoubleToFixedString(QueryWork2.fieldByname(fieldName).asfloat)+'~');
                   end;
                 14,37,261: // char,string;
                   begin
                     tmpstr := '';
                     tmpstr := trim(notilda(QueryWork2.fieldByname(fieldName).asstring));

                     if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then
                        write(tmpREFile,tmpstr+'~')
                     else
                        write(tmpFile,tmpstr+'~');
                     Flush(tmpFile);

                   end;
                 35: // Datetime
                   begin
                     TmpTs:=DatetimeTotimeStamp(QueryWork2.fieldByname(fieldName).asdatetime);
                     if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then write(tmpREFile,inttostr(TmpTs.Date)+' '+inttostr(TmpTs.Time)+'~')
                       else write(tmpFile,inttostr(TmpTs.Date)+' '+inttostr(TmpTs.Time)+'~');
                   end;
                 else begin
                    if not AUTOMODE then messbox('Сообщите разработчику! Обнаружено поле с неизвестным типом '+QueryWork.fieldByname('RDB$FIELD_TYPE').asstring,'Фатальная ошибка!',16);
                    halt;
                 end;
               end;
               QueryWork.next;
             end;
             if not CustomTable and PostRE and (ArrTable[TmpA] = 'RE') then writeln(TmpREFile,'~~~~~')
             else writeln(TmpFile,'~~~~~');
             QueryWork2.next;
           end;

           QueryWork.close;
      end;
//      end;
      add_log('Данные выгружены успешно!');
     except
        inc(Err);
        add_log('Ошибка при выгрузке данных!');
        if not AUTOMODE then Messbox('Ошибка при выгрузке данных!',MessError,16);
     end;
    end;
    try
      closefile(TmpFile);
      if postRE then  closefile(TmpREFile);

      add_log('Временный файл закрыт!');
      if CanLog then Memo1.lines.add('Временный файл закрыт!');
      delay(1);

      assignfile(f, TMP_PATH+FileName);
      reset(f);
      f_size := filesize(f);
      closefile(f);
      if (f_size = 0) or DataFileEmpty then DELETEFILE(TMP_PATH+FileName);

      if PostRE then
      begin
      assignfile(f, TMP_PATH+REFileName);
      reset(f);
      f_size := filesize(f);
      closefile(f);
      if (f_size = 0) or REDataFileEmpty then DELETEFILE(TMP_PATH+REFileName);
      end;

    except
      inc(Err);
      add_log('!!! Ошибка при закрытии временного файла данных!');
      if not AUTOMODE then Messbox('Ошибка при закрытии временного файла данных!',MessError,16);
    end;
  except
    inc(Err);
    add_log('!!! Ошибка при запросе таблиц!');
    if not AUTOMODE then Messbox('Ошибка при запросе таблиц',MessError,16);
  end;
  if Err=0 then begin
    Result:=0;
    if CanLog then Memo1.lines.add('Формирование пакета закончено!');
    add_log('Формирование пакета закончено!');
  end else begin
     Result:=-1;
    if CanLog then Memo1.lines.add('Неудачная отправка данных!');
    add_log('!!! Неудачная отправка данных!');
  end;
end;

function IntToFixedString(n:longint):ansistring;
type
  bb=string[4];
var
  p:^bb;
  c:array[1..4] of char;
  a:integer;
begin
    getMem(P,4);
    if ((n>=0) and (n<1000)) then result:=inttostr(n) else begin
      p:=@n;
      result:='';
      for a:=1 to 4 do c[a]:=p^[a-1];
      for a:=1 to 4 do result:=result+b_utils.right('000'+inttostr(ord(c[a])),3);
    end;
end;


function FixedStringToInt(s:ansistring):longint;
type
  bb=string[4];
var
  p:^bb;
  c:array[1..4] of char;
  a:integer;
  n:longint;
  p2:^integer;
begin
    getMem(P,4);
    n:=0;
    if length(s)<4 then result:=strtoint(s) else begin
      p:=@n;
      for a:=1 to 4 do begin
         p^[a-1]:=chr(strtoint(copy(s,(a-1)*3+1,3)));
      end;
      result:=n;
    end;
end;


function DoubleToFixedString(n:double):ansistring;
type
  bb=string[8];
var
  p:^bb;
  c:array[1..8] of char;
  a:integer;
begin
    getMem(P,8);
    if n=0 then result:='0' else begin
      p:=@n;
      for a:=1 to 8 do c[a]:=p^[a-1];
      result:='';
      for a:=1 to 8 do result:=result+b_utils.right('000'+inttostr(ord(c[a])),3);
    end;
end;

function FixedStringToDouble(s:ansistring):Double;
type
  bb=string[8];
var
  p:^bb;
  c:array[1..8] of char;
  a:integer;
  n:double;
  p2:^integer;
begin
    getMem(P,8);
    n:=0;
    if s='0'then result:=0 else begin
      p:=@n;
      for a:=1 to 8 do begin
         p^[a-1]:=chr(strtoint(copy(s,(a-1)*3+1,3)));
      end;
      result:=n;
    end;
end;


function trim_file(Path,FileName1,FileName2:ansistring;Size:longint):integer;
// Функция разделяет файл на части не более Size байт
// Возвращает число файлов, если -1 - ошибка!!!
var
  FromF, ToF: textfile;
//  NumRead, NumWritten: Integer;
//  Buf: array[1..2048] of Char;
  cnt:integer;
//  FSize:LongInt;
//  AllSize,GetSize,LoadSize:integer;
  BlockHeader:  string;
  TmpS: string;
  nString: longint;
begin
  result:=-1;
  try
    cnt:=1;
    Assignfile(FromF,Path+FileName1);
    AssignFile(ToF,Path+FileName2+'.part_'+b_utils.right('000'+inttostr(Cnt),3));
    Reset(FromF);
    ReWrite(ToF);

    nString := 1;
//    LoadSize:=0;
    while not eof(FromF) do
    begin
       if (nString>=Size) and ((Right(tmpS, 6)='~~~~~~') or (left(tmpS, 6)='~~~~1 '))then
       begin
       // Открываем новый файл
         inc(Cnt);
         CloseFile(Tof);
         AssignFile(ToF,Path+FileName2+'.part_'+b_utils.right('000'+inttostr(Cnt),3));
         ReWrite(ToF);
         writeln(toF, BlockHeader);
         nString:=1;
       end;

       Readln(FromF,TmpS);
       Writeln(Tof,TmpS);
       if left(tmpS, 6)='~~~~##' then BlockHeader := tmpS;
       inc(nString);

    end;
    CloseFile(FromF);
    CloseFile(ToF);
    result:=Cnt;
  except
  end;
end;


Function UnTrim_File(Path,FileName1,FileName2:Ansistring):longint;
begin
end;


procedure TMAIN_FORM.BtnResiveEmailClick(Sender: TObject);

var

   MyMail:Variant;
   b,c,d,e,cnt,cnt2:integer;

   Mess_type:integer;
   TO_SHOPS:ansistring;
   CntFileIn,TO_SHOP:integer;
   r:double;
   MAIL_DATE,MAIL_DT1,MAIL_DT2,MAIL_TM1,MAIL_TM2:ansistring;






   FileIn:ansistring;
   PackedDataFileName: ansistring;

   CurrentError:integer;
   s,s1,s2:ansistring;
   TmpString:ansistring;
   tmp_s1,tmp_s2,tmp_s3,tmp_s4,tmp_s5,tmp_s6:ansistring;
   MAIL_NUM:integer;
   ERR_ZAY: integer;

   _MailIndex:integer;
   mail_frm_id: integer;
   SakMSG1:TSakMSG;
begin
    CanInsertLog:=CheckBox1.checked;
    cntDelMail:=0;
    DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
    main_form.Memo1.lines.add('Подключение к базе...');
    delay(10);
    DataModule1.IBDatabase1.Connected:=True;
    main_form.Memo1.lines.add('Подключение к базе произошло...');
    // Читаем почтовые настройки
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EMAIL_HOST"');
    if QueryWork.eof then begin
        EMAIL_HOST:='beep.ru';
    end else begin
        EMAIL_HOST:=QueryWork.fieldByname('CFG_VALUE').asstring;
    end;

    // Определяем число сообщений в папке входящие
//    MyMail.OutlookConnect1.ItemSend; // Доставка почты
    // Подключаемся к базе данных и загружаем список таблиц для репликации, исключая те,
    // которые исключены из репликации
    WorkTransaction.Active:=False;
    // Загружаем перечень таблиц, которые разрешены к репликации
    main_form.Memo1.lines.add('Загружаем список таблиц, разрешенных к обработке...');
    Cnt_Alltable:=0;
    OPEN_SQL(QueryWork,'select table_name from list_table_replicat');
    while not QueryWork.eof do begin
       inc(Cnt_Alltable);
       Arr_alltable[Cnt_alltable]:=QueryWork.fieldByname('table_name').asstring;
       QueryWork.next;
    end;

    if GetRE then
      begin
        inc(Cnt_Alltable);
        Arr_alltable[Cnt_alltable]:='RE';
      end;

    main_form.Memo1.lines.add('Загружаем список полей, исключенных из обработки...');
    OPEN_SQL(QueryWork,'select cfg_value from cfg where cfg_name="LINK_NOFIELD"');
    Cnt_Nofield:=0;
     while not QueryWork.eof do begin
       inc(Cnt_Nofield);
       TmpString:=QueryWork.fieldByname('cfg_value').asstring;
       Arr_Nofield[Cnt_Nofield].Tablename:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),1)));
       Arr_Nofield[Cnt_Nofield].fieldName:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),2)));
       QueryWork.next;
    end;
    MyMail:=OutlookConnect1.Inbox;
    cnt:=MyMail.Items.Count;
    cnt2:=0;
    add_log('Обработка почты. В папке "Входящие" '+inttostr(cnt)+' сообщений');
    if CanLog then Memo1.lines.add('В папке "Входящие" '+inttostr(cnt)+' сообщений');

  TRY
    for _MailIndex:=1 to cnt do begin
       MailIndex:=_MailIndex;
       label3.caption:=inttostr(MailIndex)+' из '+inttostr(cnt);
       s:=trim(MyMail.Items[MailIndex].SubJect);
       MailSubject:=trim(MyMail.Items[MailIndex].SubJect);
       // Проверяем сообщения,
       // Отлавливаем письма "утверждаю оплату" или "отказываю в оплате"
       tmp_s1:=s;
       // заменяем знаки подчеркивания на пробелы
       for b:=1 to length(tmp_s1) do if tmp_s1[b]='_' then tmp_s1[b]:=' ';
       // выделяем четыре первых параметра

       if argv(tmp_s1)>3 then begin
          tmp_s2:=trim(argc(tmp_s1,1));
          tmp_s3:=trim(argc(tmp_s1,2));
          tmp_s4:=trim(argc(tmp_s1,3));
          tmp_s5:=trim(argc(tmp_s1,4));
          tmp_s6:=trim(argc(tmp_s1,5)); // сумма


          // параметры выделены - определяем правильнось
          // s2 - &1 иои &0
          // s3 - номер заявки
          // s4 - ID сообщения
          // s5 - контрольная сумма ID+ответ
          if CanInsertLog then Memo1.lines.add(tmp_s2+' Обнаружено письмо-ответ. '+inttostr(CONTROLSUMM(tmp_s4+tmp_s2)));
          try
             MAIL_NUM:=strtoint(tmp_s3); // выделили номер сообщения
             if (tmp_s2='$0') or (tmp_s2='$1') then if CanInsertLog then Memo1.lines.add('Обнаружено письмо-ответ. '+inttostr(CONTROLSUMM(tmp_s4+tmp_s2)));
             if ((tmp_s2='$0') or (tmp_s2='$1')) and (strtoint(tmp_s5)=CONTROLSUMM(tmp_s4+tmp_s2)) then begin
                if CanInsertLog then Memo1.lines.add('Обнаружено письмо-ответ. '+tmp_s1);
                delay(1);
                // проверяем соответствие номера ID
                worktransaction.Active:=False;
                OPEN_SQL(QueryWork,'select * from MAIL where MAIL_ID='+tmp_s4);
                mail_frm_id:=Querywork.fieldbyname('frm_id').asinteger;




                IF not QueryWork.eof then begin
                   if QueryWork.fieldByname('MAIL_NUM').asinteger=MAIL_NUM then begin
                      // сообщение опознано!
                      if CanInsertLog then Memo1.lines.add('Письмо опознано! SOST='+QueryWork.fieldByname('MAIL_SOST').asstring+', Subsost='+QueryWork.fieldByname('MAIL_SUBSOST').asstring);
                      delay(1);
                      if (QueryWork.fieldByname('MAIL_SOST').asinteger=6)
                          and (b_utils.left(QueryWork.fieldByname('MAIL_SUBSOST').asstring,1)='1') then begin
                          // сообщение было подписано и отослано!
                          if CanLog then Memo1.lines.add('Получен ответ ДА на сообщение № '+tmp_s3);
                          delay(1);
                          if tmp_s2='$1' then begin
                             // Переводим заявку в состояние "утверждена"
                             Datamodule1.IBTransaction2.Active:=False;
                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                               IBSAVE_CLEAR;
                               IBSAVE_ADD('MAIL_SOST',3);
                               IBSAVE_ADD('UTW_DATE',my_now);
                               IBSAVE_ADD('UTW_US',0);
                               if CanLog then Memo1.lines.add('Пытаемся зафиксировать утверждение заявки с ID='+tmp_s4);
                               if IBSAVE_DOC('MAIL',strtoint(tmp_s4))<0 then r:=sqrt(-1);
                               Datamodule1.IBTransaction2.Commit;
                               if CanLog then Memo1.lines.add('Изменения зафиксированы!. Отсылаем письмо...');
                               add_log('Заявка № '+tmp_s3+' переведена в утвержденные!');
                               //получить адреса получателей для конкретной фирмы



                               if mail_frm_id<>2696877 then
                                mail_frm_id:=0;

                               OPEN_SQL(QueryWork2,'select CFG_NAME,CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME in ("HOME_EMAIL","TITLE_EMAIL","REPEAT_EMAIL") and CFG_SET1='+inttostR(mail_frm_id));
                               if QueryWork2.eof then begin
                                       HOME_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                                       TITLE_EMAIL:='Арм "Склад"';
                                       REPEAT_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               end else begin
                                      if QueryWork2.locate('CFG_NAME','TITLE_EMAIL',[]) then TITLE_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                                      if QueryWork2.locate('CFG_NAME','HOME_EMAIL',[]) then HOME_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                                      if QueryWork2.locate('CFG_NAME','REPEAT_EMAIL',[]) then REPEAT_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                               end;
                               if pos('@',HOME_EMAIL)<1 then HOME_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               if pos('@',REPEAT_EMAIL)<1 then REPEAT_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               // Почтовые настройки прочтены

                               // посылаем кому надо письмо с рассчитанной заявкой, которая отложена
                               // в каталоге ZAYs

                               SakMSG1:=TSakMSG.Create(nil);
                               SakMsg1.ParseMsg;
                               SakMsg1.Subject := 'Утверждена # '+QueryWork.fieldByname('MAIL_NUM').asstring+' на сумму '+b_utils.right(b_utils.space(10)+tmp_s6,10)+' от '+date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime);
                               SakMsg1.MessageType:=MtHtml;
                               if CanLog then Memo1.lines.add('Загружаем файл '+ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm');
                               if SysUtils.Fileexists(ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm') then begin
                                  SakMsg1.Text.LoadFromFile(ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm');
                               end else begin
                                  SakMsg1.Text.Add('В рассчитанном виде заявка не обнаружена!');
                               end;
                               if CanLog then Memo1.lines.add('Файл загружен...');
                               SakMsg1.AttachedFiles.Clear;
                               SakMsg1.AttachedFiles.add('Bsklad_HTML_Pic1.jpg');
                               SakMsg1.CharSet := 'windows-1251';
                               SakMsg1.TextEncoding := te8Bit;
                               SakMsg1.UserName :=TITLE_EMAIL;
                               SakMsg1.From := HOME_EMAIL;
                               SakMsg1.SendTo := REPEAT_EMAIL;
                               SakSMTP1.host := EMAIL_HOST;
                               if CanLog then Memo1.lines.add('Письмо подготовлено...');
                               SakSMTP1.connect;
                               if not SakSMTP1.SMTPError then begin
                                  SakSMTP1.SendTheMessage( SakMsg1);
                                  // помечаем заявку на удаление
                                  inc(cntDelMail);
                                  ArrDelMail[cntDelMail]:=MailSubject;
                               end;
                               SakMsg1.ParseMsg;
                               SakSMTP1.Disconnect;
                             except
                                   CurrentError:=1;
                                   inc(ERR_ZAY);
                                   if CanLog then Memo1.lines.add('Ошибка при переводе заявки № '+tmp_s3+' в утвержденные!');
                                   delay(1);
                                   add_log('Ошибка при переводе заявки № '+tmp_s3+' в утвержденные!');
                               Datamodule1.IBTransaction2.Rollback;
                             end;
                             Datamodule1.IBTransaction2.Active:=False;
                             SakMSG1.Destroy;
                          end;
                      end;
                      if (tmp_s2='$0')
                         and (b_utils.left(QueryWork.fieldByname('MAIL_SUBSOST').asstring,1)='1') then begin
                            if CanLog then Memo1.lines.add('Получен ответ НЕТ на сообщение № '+tmp_s3);
                            delay(1);
                             // Заявка отказана - наивысший приоритет!!
                             // получен ответ, что заявка отказана!
                             // Переводим заявку в состояние "отказана"
                             Datamodule1.IBTransaction2.Active:=False;
                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                               IBSAVE_CLEAR;
                               IBSAVE_ADD('MAIL_SOST',7);
                               if IBSAVE_DOC('MAIL',strtoint(tmp_s4))<0 then r:=sqrt(-1);
                               Datamodule1.IBTransaction2.Commit;
                               add_log('Заявка № '+tmp_s3+' переведена в отказанные!');
                               // помечаем заявку на удаление
                               inc(cntDelMail);
                               ArrDelMail[cntDelMail]:=MailSubject;
                             except
                                   CurrentError:=1;
                                   inc(ERR_ZAY);
                                   if CanLog then Memo1.lines.add('Ошибка при переводе заявки № '+tmp_s3+' в отказанные!');
                                   delay(1);
                                   add_log('Ошибка при переводе заявки № '+tmp_s3+' в отказанные!');
                                   Datamodule1.IBTransaction2.Rollback;
                             end;
                             Datamodule1.IBTransaction2.Active:=False;
                      end;
                   end;
                end;
             end;
          except
          end;
       end;









       // Отлавливаем письма склада
       if pos(ansiuppercase(Subject_prefix),ansiuppercase(s))=1 then begin
          // находим сообщения с изменениями этому магазину или все и их корректность
          e:=argv(s);
          s1:=argc(s,e); // в строке S1 - контрольная сумма
          s2:=trim(b_utils.left(s,length(s)-length(s1))); // строка без контрольной суммы
          d:=0;
          try
            b:=CONTROLSUMM(s2);
            c:=strtoint(s1);
            if c=b then d:=1; // Контрольная сумма верна
          except
            d:=-1;
          end;
          if d=1 then begin
            inc(Cnt2);
            // Обнаружено письмо с верной контрольной суммой
            // Отсекаем лишнюю фразу от начала сообщения
            s2:=trim(b_utils.right(s2,length(s2)-length(Subject_prefix)));
            // Убираем тире
            for b:=1 to length(s2) do if s2[b]='-' then s2[b]:=' ';
            // проверяем MAIN_DESCR
            if argc(s2,1)=MAIN_DESCR then begin
              // Дескриптор соответствует. Определяем тип сообщения
              try
                Mess_type:=strtoint(Argc(s2,2));
                if ((Mess_type<1) or (Mess_type>09)) then r:=sqrt(-1); // Неверный тип сообщения
                case Mess_type of
                  1: begin // Текущие изменения
                        // Определяем, от кого пришли изменения
                        try
                          FROM_SHOP:=strtoint(trim(argc(s2,3)));
                          // Проверяем, есть ли отправитель в базе магазинов
                          c:=0;
                          for b:=1 to CntShops do if FROM_SHOP=ArrShops[b].ID then c:=b;
                          if c=0 then begin
                             add_log('!!! Неизвестный отправитель "'+inttostr(FROM_SHOP)+'"!');
                             if CanLog then Memo1.lines.add('Неизвестный отправитель "'+inttostr(FROM_SHOP)+'"!');
                             delay(1);
                          end else begin
                            // Отправитель определен
                            if CanLog then Memo1.lines.add('Анализ письма с текущими изменениями от "'+ArrShops[c].name+'"...');
                            delay(1);
                            // Определяем получателя
                            TO_SHOPS:=trim(Argc(s2,4));
                            if To_shops='***' then TO_SHOP:=-1
                            else try
                              to_shop:=strtoint(to_shops);
                            except
                               to_shop:=-2;
                               add_log('!!! Ошибка при определении получателя "'+TO_SHOPS+'"!');
                               if CanLog then Memo1.lines.add('Ошибка при определении получателя "'+TO_SHOPS+'"!');
                               delay(1);
                            end;
                            if ((to_shop=CODE_SHOP) or (to_shop=-1)) then begin
                                // Письмо пришло по адресу - определяем дату отправку и временной перод
///////////////////////////////  добавляю в заголовок номер пакета


                                IncomingPacketNum:=strtoint(trim(argc(s2,5)));
                                MAIL_DATE:=trim(argc(s2,6));
                                if CanLog then Memo1.lines.add('Письмо отправлено '+MAIL_DATE+' !');
                                delay(1);
                                // Определяем временной диапазон
                                MAIL_DT1:=trim(argc(s2,7));
                                MAIL_TM1:=trim(argc(s2,8));
                                MAIL_DT2:=trim(argc(s2,9));
                                MAIL_TM2:=trim(argc(s2,10));


                                // Определяем число вложенных файлов
                                CntFileIn:=MyMail.Items[MailIndex].Attachments.count;
                                if CanLog then Memo1.lines.add('Вложено '+inttostr(CntFileIn)+' файлов');
                                delay(1);
                                for b:=1 to CntFileIn do begin
                                  // Определяем имя вложженного файла
                                  FileIn:=MyMail.Items[MailIndex].Attachments[b].FileName;
                                  if CanLog then Memo1.lines.add('Вложен файл "'+FileIn+'"');
                                  delay(1);


                                 if ((strpos(pchar(FileIn), 'RE')=nil)  or ( (strpos(pchar(FileIn), 'RE')<> nil) and (GetRE=true))) then
                                 begin


                                  // Выгружаем вложенный файл
                                  if CanLog then Memo1.lines.add('Выгружаем файл "'+FileIn+'"...');
                                  delay(1);
                                  PackedDataFileName:='BSKLAD_PACKED_DATA_'+floattostr(now)+'.tmp';

                                  MyMail.Items[MailIndex].Attachments[b].SaveAsfile(TMP_PATH+PackedDataFileName);
//////////////////////////////////
                                  if CanLog then Memo1.lines.add('Файл "'+FileIn+'" выгружен. Распаковываем...');



                                  LoadDataFromfile(TMP_PATH+PackedDataFileName);


                                 end;     //if RE
                                end;    //for
                            end else begin
                                 add_log('!!! Письмо с текущими изменениями пришло не по адресу!');
                                 if CanLog then Memo1.lines.add('Письмо с текущими изменениями пришло не по адресу!');
                                 delay(1);
                            end;
                          end;
                        except
                          // Ошибка при определении отправителя
                        end;
                     end;
                  2: begin // Контрольная сумма продаж за прошедший день
                     end;
                  3: begin // Запрос контрольной суммы продаж за период
                     end;
                  4: begin // Запрос всех данных за указанный период
                     end;
                  5: begin // Запрос продаж за указанный период
                     end;
                  6: begin // Запрос отгрузки и получения за указанный период
                     end;
                  7: begin // Письмо с SQL скриптами
                     end;
                  8: begin // Ответ о выполнеии SQL скрипта
                     end;
                  9: begin // Команда на повторную обработку уже полученных данных
                     end;
                end;
              except
                // Ошибка при определении типа сообщения
                add_log('!!! Неверный тип сообщения!');
                if not AUTOMODE then messbox('Неверный тип сообщения!','Ошибка!',48);
              end;
            end else begin
              // MAIN_DESCR не соответствует
              add_log('!!! Дескриптор не соответствует настройкам!');
              if not AUTOMODE then messbox('Дескриптор не соответствует настройкам!','Ошибка!',48);
            end;
            // Определяем получателя сообщения
          end else begin
             // Получено письмо без контрольной сумы или с ложной контрольной суммой
             add_log('!!! Письмо "'+s+'" без контрольной суммы или сумма не верна!');
             if CanLog then Memo1.lines.add('Письмо "'+s+'" без контрольной суммы или сумма не верна!');
             delay(1);
          end;
       end;
    end;
  EXCEPT
  END;
    label3.caption:='Обработка завершена.';
    label4.caption:='Обработка завершена.';
    main_form.Memo1.lines.add('Отключение от базы...');
    delay(10);
    DataModule1.IBDatabase1.Connected:=False;
    main_form.Memo1.lines.add('Отключение от базы произошло...');
    // Удаляем письма

    cnt:=MyMail.Items.Count;
    for _MailIndex:=cnt downto 1 do
    begin
      try
      for b := 1 to CntDelMail do
        if MyMail.Items[_MailIndex].Subject=ArrDelMail[b] then
        begin
          MyMail.Items[_MailIndex].delete;
          if CanLog then Memo1.lines.add('Письмо удалено из Outlook!');
           delay(1);
           break;
        end;

      except
        on e: Exception do
        begin
              add_log('!!! Не удалось удалить письмо из Outlook!'+e.Message);
              if CanLog then Memo1.lines.add('Не удалось удалить письмо из Outlook!');
              delay(1);
        end;
      end;

    end;



   // for _MailIndex:=CntDelMail downto 1 do begin
//        try
//           if MyMail.Items[_MailIndex].Subject then
//           ArrDelMail[_MailIndex]
//
//           MyMail.Items[ArrDelMail[_MailIndex]].delete;
//           if CanLog then Memo1.lines.add('Письмо удалено из Outlook!');
//           delay(1);
//        except
//              add_log('!!! Не удалось удалить письмо из Outlook!');
//              if CanLog then Memo1.lines.add('Не удалось удалить письмо из Outlook!');
//              delay(1);
//        end;
//    end;

    add_log('ОК! Обработка завершена!');
    if not AUTOMODE then Messbox('Обработка завершена!','Сообщение!',48);
end;

function CONTROLSUMM(s:ansistring):int64;
var
 a,P1,P2,P3,P4,P5,P6,P7,P8:integer;
 s2:ansistring;
begin
  // Функция возвращает контрольную сумму строки;

  s:=stringreplace(s, '$', '&', [rfReplaceAll]);

  s:=trim(ansiuppercase(s));
  P1:=length(s); // Длина строки
  P2:=0;
  for a:=1 to length(s) do P2:=P2+ord(s[a]); // Контрольная сумма знаков
  P3:=0;
  for a:=1 to length(s) do if IsAlpha(s[a]) then P3:=P3+ord(s[a]); // Контрольная сумма букв
  P4:=0;
  for a:=1 to length(s) do if IsDigit(s[a]) then P4:=P4+ord(s[a]); // Контрольная сумма цифр
  P5:=P2 mod 13; // Остаток от деления на 13
  s2:=b_utils.right(inttostr(P1),1)+ // последнее число длины строки
     b_utils.right('00'+inttostr(P2),2)+ // Два последних числа контрольной суммы знаков
     b_utils.right(inttostr(P3),1)+ // последнее число контрольной суммы букв
     b_utils.right(inttostr(P4),1)+ // последнее число контрольной суммы цифр
     b_utils.right(inttostr(P5),1); // Остаток от деления на 13
  P6:=(ord(s2[1])-48)+(ord(s2[2])-48)+(ord(s2[3])-48)+(ord(s2[4])-48)+(ord(s2[5])-48);
  P6:=P6 mod 2;
  s2:=s2+inttostr(P6);
  result:=strtoint64(s2);
end;

procedure TMAIN_FORM.Memo1Change(Sender: TObject);
begin
   if Memo1.lines.Count>1000 then Memo1.lines.clear;
end;



procedure TMAIN_FORM.AUTO_GET_TIME;
var
  tm:tdatetime;
begin
 IDCFG:=-1;
 // читаем данные последней связь
 try
    DataModule1.IBDatabase1.Connected:=False;
 except
 end;
 try
      DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
      main_form.Memo1.lines.add('Подключение к базе...');
      delay(10);
      DataModule1.IBDatabase1.Connected:=True;
      main_form.Memo1.lines.add('Подключение к базе произошло...');
      Worktransaction.Active:=False;
      Add_sql(QueryWork,'select * from cfg where cfg_name="RPLEMAIL_LAST_TIME_SEND" and CFG_SET1=:CFG_SET1');
      QueryWork.ParamByname('CFG_SET1').asinteger:=CODE_SHOP;
      QueryWork.Open;

      if QueryWork.eof then begin
         PacketNum := 0;
         add_log('Первый запуск программы репликации!');
         main_form.Memo1.lines.add('Первый запуск программы репликации!');
         // Первый запуск - фиксируем время на 1 час назад
         tm:=my_now()-(1/24);
         ts:=DateTimeToTimeStamp(tm);
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         try
           ibsave_clear;
           ibsave_add('cfg_name','RPLEMAIL_LAST_TIME_SEND');
           ibsave_add('cfg_set1',CODE_SHOP);
           ibsave_add('cfg_set2',PacketNum);
           ibsave_add('cfg_value',inttostr(ts.date)+' '+inttostr(ts.time));
           IDCFG:=ibsave_doc('CFG',-1);
           Datamodule1.IBTransaction2.Commit;
           main_form.Memo1.lines.add('Начальная конфигурация задана успешно!. Последнее время: '+datetimetostr(tm));
           add_log('Начальная конфигурация задана успешно!. Последнее время: '+datetimetostr(tm));
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         if IDCFG<0 then begin
            add_log('!!! Не удается задать начальную конфигурацию!');
            Messbox('Не удается задать начальную конфигурацию!',MessError,16);
         end;
      end else begin
         IDCFG:=QueryWork.fieldByname('CFG_ID').asinteger;
         ts.Date:=strtoint(trim(argc(QueryWork.fieldByname('CFG_value').asstring,1)));
         ts.time:=strtoint(trim(argc(QueryWork.fieldByname('CFG_value').asstring,2)));
         tm:=TimeStampToDateTime(ts);

         // ****************************************************************************
         // ****************************************************************************
         // ****************************************************************************
         // ****************************************************************************
         // ****************************************************************************
         // ****************************************************************************
         // ****************************************************************************

         //получим номер последнего отосланного пакета
         OPEN_SQL(querywork, 'SELECT MAX(PACKET_NUM) max_packet_num FROM REPLICAT_LOG WHERE SHOP_FROM='+inttostr(CODE_SHOP));
         PacketNum:=QueryWork.fieldbyname('max_packet_num').asinteger;
         inc(PacketNum);

         tm:=tm-ADD_TIME*1/24/60; // Откатываемся на час назад
         main_form.Memo1.lines.add('Очередной запуск программы репликации. Последнее время: '+datetimetostr(tm));
      end;
      QueryWork.Close;
      MainPeriod1:=tm;
      MainPeriod2:=my_now();
  except
      add_log('!!! Не удалось подключиться к базе данных!');
      if not AUTOMODE then Messbox('Не удалось подключиться к базе данных!','Ошибка!',16);
  end;
end;
procedure TMAIN_FORM.BtnRepeatClick(Sender: TObject);
begin
    CustomTable := false;
    DataFileEmpty:=true;
    REDataFileEmpty:=true;
    SyncshopNum := -1;

    Application.createForm(Tset_period,Set_period);
    Set_period.caption:='Повторная или ручная отправка данных';
    Set_period.showModal;
    if Set_period.tag=2 then begin
      if ExportData=0 then if not AUTOMODE then Messbox('Письма помещены в папку "Исходящие". Сделайте доставку электронной почты!','Сообщение!',48);
    end;
    Set_period.close;
end;

procedure TMAIN_FORM.AutoTimerTimer(Sender: TObject);
begin
   AutoTimer.enabled:=False;
   ButtonDefault.enabled:=False;
   BtnResiveEmail.enabled:=False;
   BtnRepeat.enabled:=False;
   ButtonDefault.click;
end;

function Notilda(s:ansistring):ansistring;
var
  a:integer;
begin
   result:=s;
   for a:=1 to length(s) do if s[a]='~' then s[a]:=' ';
end;

procedure TMAIN_FORM.Button1Click(Sender: TObject);
var tm: TDateTime;
cfgid : longint;
begin
   Auto_Get_Time;
   Application.CreateForm(TLastSyncForm, LastSyncForm);
   LastSyncForm.ShowModal;

   if LastSyncForm.Tag <> 2 then exit;




 // читаем данные последней связь
 try
    DataModule1.IBDatabase1.Connected:=False;
 except
 end;

 try
      DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
      main_form.Memo1.lines.add('Подключение к базе...');
      delay(10);
      DataModule1.IBDatabase1.Connected:=True;
      main_form.Memo1.lines.add('Подключение к базе произошло...');
      Worktransaction.Active:=False;
      Add_sql(QueryWork,'select * from cfg where cfg_name="RPLEMAIL_LAST_TIME_SEND" and CFG_SET1=:CFG_SET1');
      QueryWork.ParamByname('CFG_SET1').asinteger:=SyncShopNum;
      QueryWork.Open;
      if QueryWork.eof then cfgID := -1
        else cfgID :=  QueryWork.fieldByname('CFG_ID').asinteger;

        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
           ibsave_clear;
           ibsave_add('cfg_name','RPLEMAIL_LAST_TIME_SEND');
           if cfgid <> -1
                   then ibsave_add('cfg_id',-cfgid );
           ibsave_add('cfg_set1',SyncShopNum );
           MainPeriod2:= MainPeriod2 + 1.0;
           ibsave_add('tm', MainPeriod2);
           MainPeriod2:= MainPeriod2 - 1.0;

           ibsave_add('cfg_value',inttostr(SyncDate.date)+' '+inttostr(SyncDate.time));
           cfgid:=ibsave_doc('CFG',cfgid);
           Datamodule1.IBTransaction2.Commit;
        except
           Datamodule1.IBTransaction2.Rollback;
        end;
         Datamodule1.IBTransaction2.Active:=False;
        if cfgid<0 then begin
            add_log('!!! Не удается задать начальную конфигурацию!');
            Messbox('Не удается задать начальную конфигурацию!',MessError,16);
        end;

      QueryWork.Close;

      ExportData;
  except
      add_log('!!! Не удалось подключиться к базе данных!');
      if not AUTOMODE then Messbox('Не удалось подключиться к базе данных!','Ошибка!',16);
  end;

end;

procedure TMAIN_FORM.Button5Click(Sender: TObject);
begin
        Auto_Get_Time;
        PassForm.ShowModal;
        if PassForm.Tag = 2 then
        begin
        BtnResiveEmail.enabled := true;
        BtnRepeat.enabled := true;
        Button1.enabled := true;
        end;
end;

procedure TMAIN_FORM.FormClose(Sender: TObject; var Action: TCloseAction);

begin



    try
       closefile(Logfile);
      // не забудьте удалить глобальный атом

    except
    end;

end;

procedure TMAIN_FORM.FormDestroy(Sender: TObject);
var
  FoundAtom : TAtom;
  ValueReturned : word;
begin
//      FoundAtom := GlobalFindAtom(AtomText);
  if AtomText<>'' then
      GlobalDeleteAtom(GlobalFindAtom(pchar(AtomText)));
//      if FoundAtom <> 0 then ValueReturned := GlobalDeleteAtom(FoundAtom);
//      inherited Destroy;



end;

procedure TMAIN_FORM.SakSMTP1Error(Sender: TObject; Error: Integer;
  Msg: String);
begin
  add_log(msg);
end;

procedure TMAIN_FORM.Button6Click(Sender: TObject);
begin
  AUTO_GET_TIME;
  ExportZTrindefs;
end;

end.
