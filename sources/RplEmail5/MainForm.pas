unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OutLookTools,data1, Db, IBCustomDataSet, IBQuery,
  IBDatabase,VclUtils, ExtCtrls, LZRW1, RxMemDS,FileCtrl, Mask, ToolEdit,
  SakSMTP, SakMsg, b_utils, tlhelp32, NMMSG, Psock, ShellApi; // !!! �����;

const
   EmptyString='@#$@';
   CanLog=True;
   CanUpdate=True;
   Subject_prefix='Bsklad data Transfer';

   PathForHtmlZay='ZAYs\'; // ���� ��� ����������� HTML ������
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

  MAX_LINES_COUNT: integer=10000; // ������������ ������ ��������    (������������ ���������� �����)
  ADD_TIME: integer=15;          //����� �� �������, ����� - ������� ������������� ������ ���������� � ������ �� ���������� �������
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

   SakMsg1.Subject := '����������� �� ������ ������� ���������� ��� �����.';
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
      add_log('!!! ������ �������� ����� ��������������'+chr(13)+e.message);
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
      //���� ����, �� ��������, �������� ���.
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
       ArrField:array[1..100] of RecField; // ������ ����� �������
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
    if CanLog then Memo1.lines.add('��������� ���� �������� � ����������. �������� ���������...');
    delay(1);
    ERRDel:=0;
    ErrUpdate:=0;
    try
      Assignfile(FileWork,TMP_PATH+DataFileName);
      reset(FileWork);
      // ������� ����� ����� � �����
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
           Label4.caption:=inttostr(CntLines)+' �� '+inttostr(AllLines);
           delay(1);
        end;
        WorkA:=1;
        while WorkA<=Length(WorkString) do begin
           WorkChar:=WorkString[WorkA];
           WorkMet:=WorkMet+WorkChar;
           if length(WorkMet)=7 then WorkMet:=b_utils.right(WorkMet,6);
           if WorkMet='~~##D ' then begin
             // ������ ����� ��������� ������
             if CanLog then Memo1.lines.add('������ ����� ��������� ������...');
             delay(1);
             CurrentTable:='';
           end;
           if WorkMet='~~~~1 ' then begin
             // ������ ��������� ������
             if CanLog and CanInsertLog then Memo1.lines.add('�������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
             //delay(1);
             if CanUpdate then begin
                 // �������� ����� ��������
                CurrentError:=0;
                try
                  TABNAME:=ansiuppercase(trim(argc(WorkString,2)));
                  TABNAME_ID:=strtoint(trim(argc(WorkString,3)));
                except
                  CurrentError:=1;
                  inc(ERRDel);
                  if CanLog then Memo1.lines.add('������ ����������� ��������������� ��������!');
                  delay(1);
                  add_log('!!! ������ ����������� ��������������� ��������!');
                  SendErrorMail('������ ����������� ��������������� ��������!');
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
                       Datamodule1.IBTransaction2.Commit; //������ ������ ���� ������ ���� �������� (�������, ��������� ������ � DEL)
                  except
                     inc(ERRDel);
                     Datamodule1.IBTransaction2.Rollback;
                     add_log('!!! ������ �������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                     if CanLog then begin
                        Memo1.lines.add('������ �������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                        delay(1);
                     end;
                     CurrentError:=1;
                     SendErrorMail('������ �������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                  end;

                  {Datamodule1.IBTransaction2.Active:=False;
                  WorkTransaction.Active:=False;
                  if CurrentError=0 then begin// ��  ������ ��� ��������
                    ADD_SQL(QueryWork,'select DEL_ID from DEL where TABNAME=:TABNAME and TABNAME_ID=:TABNAME_ID');
                    QueryWork.ParamByname('TABNAME').asstring:=TABNAME;
                    QueryWork.ParamByname('TABNAME_ID').asinteger:=TABNAME_ID;
                    QueryWork.Open;
                    if QueryWork.eof then begin
                       // ��������� ���� �������� ��� ������� �������
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
                          if CanLog then Memo1.lines.add('������ �������� �������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
                          delay(1);
                          add_log('!!! ������ �������� �������� ������ ������� '+argc(WorkString,2)+' ID='+argc(WorkString,3));
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
             //������ ������ ���������
             if DataModule1.IBTransaction2.InTransaction then
                Datamodule1.IBTransaction2.Commit;
             // ����� ����� ��������� ������
             if CanLog then Memo1.lines.add('����� ����� ��������� ������...');
             delay(1);
             if CanLog then begin
               if ERRDEL=0 then Memo1.lines.add('�������� ������ �������!')
               else Memo1.lines.add('���� '+inttostr(ErrDel)+' ������ ��� �������� ������!');
                delay(1);
             end;
             CurrentTable:='';
           end;
           if WorkMet='~~### ' then begin
             // ������ ��� ����� ����� ��������� �������
             //������ ������ ���������
             if DataModule1.IBTransaction2.InTransaction then
                Datamodule1.IBTransaction2.Commit;


             if CanLog then Memo1.lines.add('������ ��������� ������� '+argc(WorkString,2));
             delay(1);
             CurrentTable:=ansiuppercase(trim(argc(WorkString,2)));
             CntField:=0;
             // ���������� �������� �������� ����� � �� ����
             // �������� ������ � ����, ����� � ��� ������ �������� ����� � �� ����
             s1:=trim(WorkString);
             s2:=argc(s1,1);
             s1:=trim(b_utils.right(s1,length(s1)-length(s2)));
             s2:=argc(s1,1);
             s1:=trim(b_utils.right(s1,length(s1)-length(s2)));
             // ��������, ����� � ����� ������ ���� ~~~~.
             if b_utils.right(s1,5)<>'~~~~.' then begin
                // ������ ����� ������ �����
                if CanLog then Memo1.lines.add('�������� ������ ������ � ��������� �������...');
                delay(1);
                inc(ERRUPDATE);
             end else begin
                s1:=trim(b_utils.left(s1,length(s1)-5));
                d:=argv(s1); // ����� ������
                if (d mod 2) <>0 then begin
                  add_log('!!! �������� ������ ������ � ��������� �������. �������� �������� �����!');
                  if CanLog then Memo1.lines.add('�������� ������ ������ � ��������� �������. �������� �������� �����!');
                  delay(1);
                  inc(ERRUPDATE);
                end else begin
                  cntField:=d div 2;
                  for e:=1 to cntField do begin
                      ArrField[e].name:=trim(ansiuppercase(argc(s1,(e*2)-1)));
                      try
                        ArrField[e].typ:=strtoint(trim(argc(s1,(e*2))));
                      except
                            add_log('!!! �������� ������ ������ � ��������� �������. ������ ��� ����������� ���� ����!');
                            if CanLog then Memo1.lines.add('�������� ������ ������ � ��������� �������. ������ ��� ����������� ���� ����!');
                            delay(1);
                            inc(ERRUPDATE);
                            SendErrorMail('�������� ������ ������ � ��������� �������. ������ ��� ����������� ���� ����!');
                      end;
                  end;
                end;
             end;
           end;
           if WorkMet='~~~~2 ' then begin



             Mem1.EmptyTable;
             // ������ ������ � ����������� �������
             // ������ �������� � �������� �� �����
             if ERRUPDATE=0 then begin       //ERR_UPDATE - ���� �� ����� ����, ������ � ���� ������� ���� ������, �� ���� ������������ �� �����
                //������ ������ �� ��� ���, ���� �� ����� ����� ������ ������
                currentField:=1;
                TmpString:='';
                //WorkA<=Length(WorkString)
                inc(WorkA); // ���������� ������
                repeat
                  while WorkA<=Length(WorkString) do begin
                      WorkChar:=WorkString[WorkA];
                      WorkMet:=WorkMet+WorkChar;
                      if length(WorkMet)=7 then WorkMet:=b_utils.right(WorkMet,6);
                      if WorkChar='~' then begin
                        // ���� �������� ���������
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
                         // ������ ���������
                         WorkA:=length(WorkString)+1;
                      end;
                      inc(WorkA);
                  end;
                  if WorkMet<>'~~~~~~' then begin
                    TmpString:=TmpsTring+#13+#10;
                    // ��������� ������
                    if not eof(FileWork) then begin
                       readln(FileWork,WorkString);
                       inc(CntLines);
                       if CntLines mod 20=0 then begin
                         Label4.caption:=inttostr(CntLines)+' �� '+inttostr(AllLines);
                         delay(1);
                       end;
                       WorkA:=1;
                    end else WorkMet:='~~~~~~';
                  end;
                until (WorkMet='~~~~~~') ;


                // *************************************
                // ���� ��������

                if Mem1.RecordCount<>CntField then begin
                  add_log('!!! �������� ������ ��� ������������� ������! ������ '+ s + ', ������ '+ inttostr(CntLines));
                  if CanLog then Memo1.lines.add('�������� ������ ��� ������������� ������! ������ '+ inttostr(CntLines));
                  delay(1);
                  inc(ERRUPDATE);
                end else begin
                  // ��� ���� ������ - �������� ID � TM
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
                     // �� ������ �� ���������� �����
                    add_log('!!! �� ������ �� ���������� �����!');
                    if CanLog then Memo1.lines.add('�� ������ �� ���������� �����!');
                    delay(1);
                    inc(ERRUPDATE);
                  end else begin
                     // ���������, �� ���� �� �������� ������ �������

//                     WorkTransaction.Active:=False;
                     ADD_SQL(QueryWork,'select 1 from DEL where TABNAME=:TABNAME and TABNAME_ID=:TABNAME_ID');
                     QueryWork.ParamByname('TABNAME').asstring:=CurrentTable;
                     QueryWork.ParamByname('TABNAME_ID').asinteger:=REC_ID;
                     QueryWork.Open;

                     if QueryWork.eof then begin
                        // ������� �������� �� �������!
                        // ����, ���� �� ��������� ������

                        ADD_SQL(QueryWork,'select TM from '+CurrentTable+' where '+CurrentTable+'_ID=:ID');
                        QueryWork.ParamByname('ID').asinteger:=REC_ID;
                        QueryWork.Open;

                        if QueryWork.eof then begin
                          // ��������� ������

//                          Datamodule1.IBTransaction2.Active:=False;
//                          Datamodule1.IBTransaction2.StartTransaction;
                          try
                             ibsave_clear;
                             for d:=1 to CntField do begin
                               // ���������� ������������ ����, ����������� �� ���������
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
//////////////////////////////// �������� ������ ������ ������ 20 ������� ��� ��� ����� �������
//                             Datamodule1.IBTransaction2.Commit;

                              if CntLines mod CommitInterval=0 then
                                  Datamodule1.IBTransaction2.Commit;

                              
                             if CanLog and CanInsertLog then begin
                                Memo1.lines.add('������ '+CurrentTable+' ���������. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                                delay(1);
                             end;
                          except
                             add_log('!!! ������ ��� ������ ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             if CanLog then Memo1.lines.add('������ ��� ������ ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             delay(1);
                             Datamodule1.IBTransaction2.Rollback;
                             inc(ERRUPDATE);
                             SendErrorMail( '������ ��� ������ ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                          end;
//                          Datamodule1.IBTransaction2.Active:=False;
                        end else begin
                          // ������ ���� - �������� �����

                          if QueryWork.fieldByname('TM').asdatetime<REC_TM then begin
                             // ����� ������ ������ - �������� ������
//                             Datamodule1.IBTransaction2.Active:=False;
//                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                                ibsave_clear;
                                for d:=1 to CntField do if Arrfield[d].name<>CurrentTable+'_ID' then begin
                                 // ���������� ������������ ����, ����������� �� ���������
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
                                        Memo1.lines.add('��������� ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                                        delay(1);
                                end;
                             except
                               add_log('!!! ������ ��� ��������� ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                               if CanLog then Memo1.lines.add('������ ��� ��������� ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                               delay(1);
                               Datamodule1.IBTransaction2.Rollback;
                               inc(ERRUPDATE);
                               SendErrorMail('������ ��� ��������� ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
                             end;
//                             Datamodule1.IBTransaction2.Active:=False;


                          end else begin
                             if CanLog and CanInsertLog then Memo1.lines.add('�� ���������� ������ '+CurrentTable+'. ID='+inttostr(REC_ID)+' TM='+datetimetostr(REC_TM));
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
        // ��������� �������� ������
{                                        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
           ibsave_clear;
           ibsave_add('CFG_NAME','RPLEMAIL');
           ibsave_add('CFG_SET1',inttostr(CODE_SHOP)); // ��� ���������� ��������
           ibsave_add('CFG_SET2',inttostr(FROM_SHOP)); // ��� ��������, �� �������� ������� �����
           ibsave_add('CFG_VALUE',MAIL_DT1+' '+MAIL_TM1+' '+MAIL_DT2+' '+MAIL_TM2); // ����-����� ������, ��������� � ������
           if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
           Datamodule1.IBTransaction2.Commit;}
           if CanLog then Memo1.lines.add('��������� ���� ��������� �������');

           IBSAVE_CLEAR;
           IBSAVE_ADD('SHOP_ID', CODE_SHOP);
           IBSAVE_ADD('PACKET_NUM', IncomingPacketNum);
           IBSAVE_ADD('SHOP_FROM', FROM_SHOP);
           if IBSAVE_DOC('REPLICAT_LOG', -1)<0 then
            raise Exception.Create('�� ������� ������������� ��������� ������');

           datamodule1.IBTransaction2.commit;


           delay(1);
           // ���� �������� ������� - ������� ��������� ���� � ��������� � Outlook
           DeleteF(TMP_PATH+DataFileName);
           inc(cntDelMail);
           ArrDelMail[cntDelMail]:=MailSubject;
{                                       except
           add_log('!!! �� ������� ������������� �������� ���������');
           Datamodule1.IBTransaction2.Rollback;
           if CanLog then Memo1.lines.add('�� ������� ������������� �������� ���������');
           delay(1);
        end;
        Datamodule1.IBTransaction2.Active:=False;}



      end;
    except
     on e: Exception do
      begin
       add_log('!!! �������� ������ ��� ���������!'+#13 + e.Message);
       SendErrorMail('�������� ������ ��� ���������!'+#13 + e.Message);
       if not AUTOMODE then Messbox('�������� ������ ��� ���������! '+#13+ e.message,'������!',16);
       inc(ERRUPDATE);
      end;
    end;
  except
    add_log('!!! ��������� ���� ���������!');
    if CanLog then Memo1.lines.add('��������� ���� ���������!');
    delay(1);
    SendErrorMail('��������� ���� ���������!');
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
  // �������� �����
  CustomTable := false;
  SaveSyncDate := true;
  CustomTable := false;
  DataFileEmpty:=true;
  REDataFileEmpty:=true;
  SyncshopNum := -1;

  AUTO_GET_TIME;

  ExportZTrindefs;


  if ExportData=0 then begin
              // ������ �������� � ���������
              add_log('������ �������� � ����� "���������"');
              if not AutoMode then Messbox('������ �������� � ����� "���������". �������� �������� ����������� ����� � ������� [OK]!','���������!',48);
              // �������� �������� �����
              BtnResiveEmail.click;
  end;


  //��������� ��� ����� ������������� ��������� � �����
  if (Frac(NETSENDUSERSTIMESTART) < frac(now))  and (Frac(NETSENDUSERSTIMEEND) > frac(now)) then
  begin

    try
    querywork.SQL.Text:='SELECT case when max(tm) - min(tm)> 1/24 then 1 else 0 end DELTA,(select first 1 shop_name from last_dial('+inttostr(CODE_SHOP)+') order by tm) shop_name, min(tm) tm  from last_dial('+inttostr(CODE_SHOP)+')';


    querywork.Open;

      if QueryWork.FieldByName('DELTA').asinteger=1 then
      begin
        SendErrorMail('�������� � �������������. '+chr(13)+' ��� ������ �� '+QueryWork.FieldByName('SHOP_NAME').asstring+'(��������� ������ �� '+QueryWork.FieldByName('TM').asstring+').');
        for i := 0 to NetSendUsers.Count-1 do
          NetSend( NetSendUsers[i], '�������� � �������������. �������� ��������������'+chr(13)+'��� ������ �� '+QueryWork.FieldByName('SHOP_NAME').asstring+'(��������� ������ �� '+QueryWork.FieldByName('TM').asstring+') .');
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
///////////////////�������� ����� ����������� ������

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

        add_log('�������� ������: '+SakMsg1.Subject);
        add_log('�������� ������: '+SakMsg1.SendTo);

       SakSMTP1.connect;
       if not SakSMTP1.SMTPError then
       begin
          SakSMTP1.SendTheMessage( SakMsg1);
          add_log('��������� �����: '+SakMsg1.Subject);

//                          renamefile(SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject, SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject+formatdatetime('yyyy-mm-dd-hh-nn-ss', date));
       end
       else
        mailSended:=false;
       SakSMTP1.Disconnect;
     except
      on e: Exception do
       begin
        mailSended:=false;
        add_log('!!! ������ �������� ����� - �������������'+chr(13)+e.message);
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
      //��������� ����� � �����������;

      REFileName:='RE_RplData_'+floattostr(now)+'.tmp';
      FileName:='RplData_'+floattostr(now)+'.tmp';

      if MakeData()=0 then
      begin
           // ������ ������������ �������

           if (ERR=0)    then
           begin
              add_log('����� �� ������...');
              if CanLog then Memo1.lines.add('���������� ������ �� ������...');
              delay(1);

              if FileExists(TMP_PATH+FileName) then
              begin
              // ������
              CntFiles:=Trim_File(TMP_PATH,FileName,FileName,MAX_LINES_COUNT);
              if CntFiles<0 then begin
                // ������ ��� �������� ����� �� �����
                add_log('!!! ������ ��� �������� ����� �� �����!');
                inc(ERR);
              end else
              begin
                 // ��������� ������
                 add_log('������� � ��������� ������...');
                 if CanLog then Memo1.lines.add('������������ �����...');
                 if CanLog then Memo1.lines.add('������ ������...');
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
                   if not AUTOMODE then messbox('������ ������ ������!'+ e.Message,'������',16);
                   end;
                 End;
                 end;
                 delay(1);
                 // ��������� ��������� ����� �� ���������
                 TmpS:='';
                 for TmpA:=1 to CntShops do if ArrShops[TmpA].ID<>CODE_SHOP then TmpS:=TmpS+ArrSHops[TmpA].Addres+', ';
                 TmpS:=trim(TmpS);
                 if B_utils.right(TmpS,1)=',' then TmpS:=b_utils.left(TmpS,Length(TmpS)-1);
                 add_log('���������� ������...');
                 if CanLog then Memo1.lines.add('�������� �����...');
                 delay(1);
                 TmpTs:=DatetimeTotimeStamp(MainPeriod1);
                 TmpTs2:=DatetimeTotimeStamp(MainPeriod2);


                 mailSended:=true;  //���� true - �������� � ���� ����� ��������� �������������, ����� ��������� ���� �� ����������.

                 for Tmpa:=1 to CntFiles Do
                 Begin
                   if USE_OUTLOOK_FOR_SEND_MAIL then
                   begin

                     MyMail:=OutlookConnect1.Outbox.Items.Add;
                     // MyMail.Display; // �������� �� �����
                      MyMail.To:=TmpS; // ����
                     MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // ���� ��� ���
  ///////////////////�������� ����� ����������� ������
                     MyMail.Subject:=MyMail.Subject+'-'+inttostr(PacketNum)+'';
                     MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+' '+
                     formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                     formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                     ' Part '+inttostr(TmpA)+'/'+inttostr(CntFiles);
                     MyMail.Attachments.add(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                     MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
                     MyMail.Body := '��������� ����� '+ inttostr(PacketNum);
                     MyMail.Save; // ���������
                     MyMail.Send; // ���������
                   end
                   else
                   begin
                     try
                       SakMSG1:=TSakMSG.Create(nil);
                       SakMsg1.SendTo:=TmpS; // ����
                       SakMsg1.Subject := Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // ���� ��� ���
    ///////////////////�������� ����� ����������� ������
                       SakMsg1.Subject :=SakMsg1.Subject+'-'+inttostr(PacketNum)+'';
                       SakMsg1.Subject :=SakMsg1.Subject+'-'+My_dat(date()-1)+' '+
                       formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                       formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                       ' Part '+inttostr(TmpA)+'/'+inttostr(CntFiles);
                       SakMsg1.Subject :=SakMsg1.Subject+' '+inttostr(CONTROLSUMM(SakMsg1.Subject));

                       SakMsg1.AttachedFiles.Add(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));

                       SakMsg1.MessageType:=mtPlain;
                       SakMsg1.Text.Clear;
                       SakMsg1.Text.Add('��������� ����� '+ inttostr(PacketNum));


                       SakMsg1.CharSet := 'windows-1251';
                       SakMsg1.TextEncoding := te8Bit;
                       SakMsg1.UserName :=FromEmailAddress;//TITLE_EMAIL;
                       SakMsg1.From := FromEmailAddress;

                       SakSMTP1.host := EMAIL_HOST;
//                       filename1:=SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject;
//                       filename1:=stringreplace(filename1, '/', ' ', [rfReplaceAll]);
//                       filename1:=stringreplace(filename1, '*', ' ', [rfReplaceAll]);
//                       WindowsCopyFile(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3), filename1);

                        add_log('�������� ������: '+SakMsg1.Subject);
                        add_log('�������� ������: '+SakMsg1.SendTo);

                       SakSMTP1.connect;
                       if not SakSMTP1.SMTPError then
                       begin
                          SakSMTP1.SendTheMessage( SakMsg1);
                          add_log('��������� �����: '+SakMsg1.Subject);

//                          renamefile(SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject, SENDED_MAIL_DIRECTORY+'\'+SakMsg1.Subject+formatdatetime('yyyy-mm-dd-hh-nn-ss', date));
                       end
                       else
                        mailSended:=false;
                       SakSMTP1.Disconnect;
                     except
                      on e: Exception do
                       begin
                        mailSended:=false;
                        add_log('!!! ������ �������� ����� - �������������'+chr(13)+e.message);
                       end;
                     end;

                     SakMSG1.Destroy;

                   end;
                 end;
              end;
           end;
           end;
//��� RE

            if postRE and FileExists(TMP_PATH+REFileName) then
             begin
                // ������

              CntREFiles:=Trim_File(TMP_PATH,REFileName,REFileName,MAX_LINES_COUNT);
              if (CntREFiles<0 ) then
              begin
                // ������ ��� �������� ����� �� �����
                add_log('!!! ������ ��� �������� ����� �� �����!');
                inc(ERR);
              end else
              begin
                 // ��������� ������
                 add_log('��������� ������...');
                 if CanLog then Memo1.lines.add('������������ �����...');
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
                   if not AUTOMODE then messbox('������ ������ ������!'+ e.Message,'������',16);
                   end;
                 End;
                 end;
                 // ��������� ��������� ����� �� ���������
                 TmpS:='';

                 for TmpA:=1 to CntREShops do if ArrREShops[TmpA].ID<>CODE_SHOP then TmpS:=TmpS+ArrRESHops[TmpA].Addres+'; ';
                 TmpS:=trim(TmpS);
                 if B_utils.right(TmpS,1)=';' then TmpS:=b_utils.left(TmpS,Length(TmpS)-1);
                 add_log('���������� ������...');
                 if CanLog then Memo1.lines.add('�������� �����...');
                 delay(1);
                 TmpTs:=DatetimeTotimeStamp(MainPeriod1);
                 TmpTs2:=DatetimeTotimeStamp(MainPeriod2);
//                 inc(PacketNum);
                 for Tmpa:=1 to CntREFiles Do
                 Begin
                   MyMail:=OutlookConnect1.Outbox.Items.Add;
                   // MyMail.Display; // �������� �� �����
                    MyMail.To:=TmpS; // ����
                   MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-01-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-***'; // ���� ��� ���
///////////////////�������� ����� ����������� ������
                   MyMail.Subject:=MyMail.Subject+'-'+inttostr(PacketNum)+'';
                   MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+' '+
                   formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod1)+ '-' +
                   formatdatetime('dd/mm/yy-hh:mm:ss', MainPeriod2)+
                   ' Part '+inttostr(TmpA)+'/'+inttostr(CntREFiles);
                   MyMail.Attachments.add(TMP_PATH+REFileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
                   MyMail.Body := '��������� ������������'+ inttostr(PacketNum);
                   MyMail.Save; // ���������
                   MyMail.Send; // ���������
                 end;
              end;
             end;



                 if not SaveSyncDate then
                  begin
                     add_log('���� ������������� �� ��������� ������ �� ������� ���������');
                     main_form.Memo1.lines.add('���� ������������� �� ��������� ������ �� ������� ���������');
                  end
                 else
                 if CustomTable then
                 begin
                 add_log('����������� ������ ������� '+CustomTableName+', ����� ��������� ������������� �� ��������');
                 main_form.Memo1.lines.add('����������� ������ ������� RE, ����� ��������� ������������� �� ��������');

                 end  else
                 if mailSended then     //������ ���� ��������� � OUTLOOK ��� ������� ��������
                 begin
                 // ��������� ����� �������� ���������� ���������
                 add_log('������ ����������. ��������� ����� ��������...');
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



                   main_form.Memo1.lines.add('����� �������� ���������!');
                   add_log('����� �������� ���������!');
                 except
                    add_log('!!! ������ ��� ���������� ������� ��������!');
                    inc(ERR);
                    Datamodule1.IBTransaction2.Rollback;
                 end;
                 Datamodule1.IBTransaction2.Active:=False;

                 end;
                 add_log('������� ��������� �����...');
                 // ������� �����
                 for TmpA:=1 to CntFiles do DELETEF(TMP_PATH+FileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                 for TmpA:=1 to CntFiles do DELETEF(TMP_PATH+FileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3));
                 DeleteFile(TMP_PATH+FileName);
                 DeleteFile(TMP_PATH+FileName);

                 if PostRE then
                   begin
                   // ������� �����
                   for TmpA:=1 to CntREFiles do DELETEF(TMP_PATH+REFileName+'.Pak.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   for TmpA:=1 to CntREFiles do DELETEF(TMP_PATH+REFileName+'.part_'+b_utils.right('000'+inttostr(TmpA),3));
                   DeleteFile(TMP_PATH+REFileName);
                   DeleteFile(TMP_PATH+REFileName);
                   end;

           end
//      end
      else
      begin
         add_log('!!!! ������ ��� ���������� ������!');
         if not AUTOMODE then Messbox('������ ��� ���������� ������!','',48);
         // ���� ������ ��� ���������� ������
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
  CODE_SHOP:=0; // ��� ��������
  POCKET_PATH:=''; // ���� � �������
  DataBase_Path:='';
  IF not directoryExists('c:\temp\') then begin
            add_log('!!! �� ������ ��������� ����!');
  end;
  TMP_PATH:='C:\TEMP\';
  add_log('������ ���� ������������...');
  // ������ ���� ������������
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
          // �������� ���������
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // ������ ��������
          end;
          Main_form.caption:='������� ���������� ����� Bsklad. (R) Beginner 2001. '+s3;
       end;
       if s1='DATABASEPATH' then begin
          // �������� ���������
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // ������ ��������
          end;
          DataBase_path:=s3;
          Memo1.lines.add('���� � ����: "'+Database_path+'"');
       end;
       if s1='POCKETPATH' then begin
          // �������� ���������
          s2:=trim(b_utils.right(s,length(s)-length(s1)));
          if pos('"',s)<1 then begin
            s3:=argc(s2,1);
          end else begin
            s:=trim(b_utils.right(s,length(s)-length(s1)));
            s:=b_utils.right(s,length(s)-pos('"',s));
            s3:=b_utils.left(s,pos('"',s)-1); // ������ ��������
          end;
          POCKET_PATH:=S3; // ���� � �������
          Memo1.lines.add('���� �������: "'+s3+'"');
       end;
       if s1='CODESHOP' then begin
          try
           CODE_SHOP:=strtoint(Argc(s,2));
           Memo1.lines.add('��� ����: "'+inttostr(CODE_SHOP)+'"');
          except
            add_log('�������� ��� �������� "CODESHOP"  � ����� ������������ RplEmail.set!');
            messbox('�������� ��� �������� "CODESHOP"  � ����� ������������ RplEmail.set!','������!',16);
            inc(ERR);
          end;
       end;
       if s1='MAINDESCR' then begin
         MAIN_DESCR:=trim(argc(s,2));
         Memo1.lines.add('����������: "'+MAIN_DESCR+'"');
       end;


       if s1='EMAILADDRES' then begin
          //������ �������� �������
          inc(CntShops);
          ArrShops[CntShops].ID:=strtoint(trim(Argc(s,2)));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=b_utils.right(s,length(s)-pos('"',s));
          s3:=b_utils.left(s,pos('"',s)-1); // ������ ��������
          s:=b_utils.right(s,length(s)-pos('"',s));
          s4:=trim(s); // ������ ��������
          ArrShops[CntShops].name:=s3;
          ArrShops[CntShops].Addres:=s4;
          tmps:='�������� �����: '+s3+', Email: '+s4;
          if ArrShops[CntShops].ID=CODE_SHOP then
          begin tmps:=tmps+' - ����������� �����!';
          FromEmailAddress:=ArrShops[CntShops].Addres;
          end;
          Memo1.lines.add(tmps);

       end;
       if s1='REEMAILADDRES' then begin
          //������ �������� �������
          inc(CntREShops);
          ArrREShops[CntREShops].ID:=strtoint(trim(Argc(s,2)));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=trim(b_utils.right(s,length(s)-length(argc(s,1))));
          s:=b_utils.right(s,length(s)-pos('"',s));
          s3:=b_utils.left(s,pos('"',s)-1); // ������ ��������
          s:=b_utils.right(s,length(s)-pos('"',s));
          s4:=trim(s); // ������ ��������
          ArrREShops[CntREShops].name:=s3;
          ArrREShops[CntREShops].Addres:=s4;
          tmps:='�������� ����� RE: '+s3+', Email: '+s4;
          if ArrREShops[CntREShops].ID=CODE_SHOP then tmps:=tmps+' - ����������� �����!';
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
           Memo1.lines.add('����������� ������������� : '+inttostr(ADD_TIME)+' �����');
          except
          end;
       end;
       if s1='MAX_LINES_COUNT' then begin
          try
           MAX_LINES_COUNT:=strtoint(Argc(s,2));
           Memo1.lines.add('���� ������ ������ '+inttostr(MAX_LINES_COUNT)+' �����');
          except
          end;
       end;

       if s1='COMMIT_INTERVAL' then begin
          try
           CommitInterval:=strtoint(Argc(s,2));
           Memo1.lines.add('������ ������ '+inttostr(CommitInterval)+' �����');
          except
          end;
       end;
       if s1='ADMIN_EMAIL' then begin
         AdminEmail:=trim(argc(s,2));
         Memo1.lines.add('����� ��������������: "'+AdminEmail+'"');
       end;

       if s1='EMAIL_HOST' then begin
         EMAIL_HOST:=trim(argc(s,2));
         Memo1.lines.add('����� ������� ��. �����: "'+EMAIL_HOST+'"');
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
         Memo1.lines.add('������� �������������� WinPopup : '+NetSendUsers[NetSendUsers.count-1]);
       end;


    end;
  except
    inc(Err);
    add_log('!!! ������ ������ ����� ������������!');
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
            add_log('������� ���������!');
            caption:='���������. '+caption;
            AutoTimer.enabled:=True;
            AutoMode:=True;
         end;

         if trim(ansiuppercase(ParamStr(1)))='-GETRE' then begin
            add_log('');
            add_log('�������� �������� �������!');
            caption:='�������� �������.'+caption;
    //        AutoTimer.enabled:=True;
    //        AutoMode:=True;
              ButtonDefault.enabled:=false;
              BtnRepeat.enabled:=false;
              BtnResiveEmail.enabled:=true;
              CheckBox1.Enabled:=False
         end;


        end else begin
           // �������������� �����
          if  (HiWord(GetKeyState(VK_MENU)) <> 0) and (HiWord(GetKeyState(VK_CONTROL)) <> 0) then
           begin
              // ������ ALT � CTRL
              ButtonDefault.enabled:=true;
              BtnRepeat.enabled:=true;
              BtnResiveEmail.enabled:=true;
              CheckBox1.Enabled:=true;
              button1.Enabled:=true;
           end
         else
           begin
              // ������� �����
              ButtonDefault.enabled:=true;
              BtnRepeat.enabled:=false;
              BtnResiveEmail.enabled:=false;
              CheckBox1.Enabled:=False;
           end;
        end;
      end else begin
        // �� ������� ������������ � Outlook
        add_log('!!! ��� ���������� � Microsoft Outlook!');
        if not AUTOMODE then Messbox('��� ���������� � Microsoft Outlook!','������ ������������!',16);
      end;

  end;


  AtomText:='ATOM_'+MAIN_DESCR;

  if LookForPreviousInstance=true then
  begin
    Close;
    SendErrorMail('��������� �� ��������, �.�. �� ������� ������ ����� ���������');
  end


end;

procedure TMAIN_FORM.Button2Click(Sender: TObject);
var
  MyMail:Variant;
begin
  // ��������� ������ c �������� ����� �������� ���
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('������ ������� ������ ������ ����!','������!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // �������� �� �����
      MyMail.To:=Select_to.statusbar1.panels[0].text; // ����
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-03-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // ���� ��� ���
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
      MyMail.Save; // ���������
      MyMail.Send; // ���������
      add_log('������ ����� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!');
      Messbox('������ ����� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!','���������!',48);
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
  // ��������� ������ c �������� ���� ������ �������� ���
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('������ ������� ������ ������ ����!','������!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // �������� �� �����
      MyMail.To:=Select_to.statusbar1.panels[0].text; // ����
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-04-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // ���� ��� ���
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));
      MyMail.Save; // ���������
      MyMail.Send; // ���������
      add_log('������ ����� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!');
      Messbox('������ ����� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!','���������!',48);
    end;
  end;
  Select_to.destroy;
end;

procedure TMAIN_FORM.Button4Click(Sender: TObject);
var
  MyMail:Variant;
begin
  // ��������� ������ c �������� �������� � ���������
  Application.createForm(TSelect_to,select_to);
  Select_to.showModal;
  if  Select_to.tag>0 then begin
    if CODE_SHOP=ArrShops[Select_to.ComboBox1.itemindex+1].ID then Messbox('������ ������� ������ ������ ����!','������!',16) else begin
      MyMail:=OutlookConnect1.Outbox.Items.Add;
      // MyMail.Display; // �������� �� �����
      MyMail.To:=Select_to.statusbar1.panels[0].text; // ����
      MyMail.Subject:=Subject_prefix+' '+MAIN_DESCR+'-06-'+b_utils.right('000'+inttostr(CODE_SHOP),3)+'-'+
         b_utils.right('000'+inttostr(ArrShops[Select_to.ComboBox1.itemindex+1].ID),3); // ���� ��� ���
      MyMail.Subject:=MyMail.Subject+'-'+My_dat(date()-1)+'-'+My_dat(date()-1);
      MyMail.Subject:=MyMail.Subject+' '+inttostr(CONTROLSUMM(MyMail.Subject));

      MyMail.Save; // ���������
      MyMail.Send; // ���������
      OutlookConnect1.Outbox.Items.
      add_log('������ �������� � ��������� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!');
      Messbox('������ �������� � ��������� �������� ��� ��������� � "'+Select_to.combobox1.text+'"!','���������!',48);
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

  // ��������� ��������� ����� � ������
  // ���� ��� ������ ���� ����������

  //������� � ���� ������ � ������� ������ ������.
  //����� ���� ���� ������� ����� �������� ������ ����� �� ����� � �������������.


  IBSAVE_CLEAR;
  IBSAVE_ADD('SHOP_FROM', CODE_SHOP);
  IBSAVE_ADD('SHOP_ID', CODE_SHOP);
  IBSAVE_ADD('PACKET_NUM', PacketNum );
  IBSAVE_ADD('TM', MainPeriod2);
  if IBSAVE_DOC('REPLICAT_LOG', -1)<0 then
    Raise Exception.Create('������ ������ ������ ����������� ������');
  DataModule1.IBTransaction2.Commit;



  if CanLog then main_form.Memo1.lines.add('���������� ������ � �������� �� ������ � '+
    datetimetostr(MainPeriod1)+' �� '+datetimetostr(MainPeriod2));
   main_form.Memo1.lines.add('��������� ������ �����, ����������� �� ���������...');
   OPEN_SQL(QueryWork,'select cfg_value from cfg where cfg_name="LINK_NOFIELD"');
   Cnt_Nofield:=0;
   while not QueryWork.eof do begin
     inc(Cnt_Nofield);
     Arr_Nofield[Cnt_Nofield].Tablename:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),1)));
     Arr_Nofield[Cnt_Nofield].fieldName:=ansiuppercase(trim(argc(ansistring(QueryWork.fieldByname('cfg_value').asstring),2)));
     QueryWork.next;
  end;
  CntTable:=0;
  // ��������� ������ ������, ������� ��������� � ��������� ������
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


    if CanLog then Memo1.lines.add('����� '+inttostr(CntTable)+' ������ ��� ���������.');
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
      add_log('������ ��� �������� ���������� ����� ������!');
      if not AUTOMODE then Messbox('������ ��� �������� ���������� ����� ������!',MessError,16);
    end;




    if Err=0 then begin
     // ��������� ������
     try
    if SyncShopNum = -1 then
    begin
      // ��������� ��������� ������
      if CanLog then Memo1.lines.add('������ ��������� ������...');
      delay(1);
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select tabname,tabname_id from del where tm between :DT1 and :DT2');
      QueryWork.paramByname('DT1').asdatetime:=MainPeriod1;
      QueryWork.paramByname('DT2').asdatetime:=MainPeriod2+1/24;
      QueryWork.open;
      if QueryWork.eof then begin
        if CanLog then Memo1.lines.add('��������� ������ ���!');
        delay(1);
        add_log('��������� ������ ���!');
      end else begin
        add_log('�������� ��������� ������...');
        if CanLog then Memo1.lines.add('�������� ��������� ������...');
        delay(1);
        writeln(TmpFile,'~~~~##D ���� ��������� ������');
        if PostRE then writeln(TmpREFile,'~~~~##D ���� ��������� ������');
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
        writeln(TmpFile,'~~~~##DX ����� ����� ��������� ������');
        if PostRE then writeln(TmpREFile,'~~~~##DX ����� ����� ��������� ������');
      end;

   end;

      for TmpA:=1 to CntTable do
      begin

           if CanLog then Memo1.lines.add('������ ����� ������� "'+ArrTable[TmpA]+'" '+inttostr(TmpA)+' �� '+inttostr(CntTable)+'...');
           // ��������� � ���� ��������� �������
           WorkTransaction.Active:=False;
           // ����������� ���������� ������
           ADD_SQL(QueryWork2,'select * from '+ArrTable[TmpA]+' where TM between :DT1 and :DT2');
           QueryWork2.paramByname('DT1').asdatetime:=MainPeriod1;
           if SyncShopNum <> -1 then
                      QueryWork2.paramByname('DT2').asdatetime:=MainPeriod2+1
           else       QueryWork2.paramByname('DT2').asdatetime:=MainPeriod2+1/24;
           if CanLog then Memo1.lines.add('������ ��������� ������� "'+ArrTable[TmpA]+'" '+inttostr(TmpA)+' �� '+inttostr(CntTable)+'...');
           delay(1);
           QueryWork2.open;


           if not QueryWork2.eof then
           begin // ���� ������
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
                // ���������� ���������� ����, ������� ������ ���������
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
             // �������� �����
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
                    if not AUTOMODE then messbox('�������� ������������! ���������� ���� � ����������� ����� '+QueryWork.fieldByname('RDB$FIELD_TYPE').asstring,'��������� ������!',16);
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
      add_log('������ ��������� �������!');
     except
        inc(Err);
        add_log('������ ��� �������� ������!');
        if not AUTOMODE then Messbox('������ ��� �������� ������!',MessError,16);
     end;
    end;
    try
      closefile(TmpFile);
      if postRE then  closefile(TmpREFile);

      add_log('��������� ���� ������!');
      if CanLog then Memo1.lines.add('��������� ���� ������!');
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
      add_log('!!! ������ ��� �������� ���������� ����� ������!');
      if not AUTOMODE then Messbox('������ ��� �������� ���������� ����� ������!',MessError,16);
    end;
  except
    inc(Err);
    add_log('!!! ������ ��� ������� ������!');
    if not AUTOMODE then Messbox('������ ��� ������� ������',MessError,16);
  end;
  if Err=0 then begin
    Result:=0;
    if CanLog then Memo1.lines.add('������������ ������ ���������!');
    add_log('������������ ������ ���������!');
  end else begin
     Result:=-1;
    if CanLog then Memo1.lines.add('��������� �������� ������!');
    add_log('!!! ��������� �������� ������!');
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
// ������� ��������� ���� �� ����� �� ����� Size ����
// ���������� ����� ������, ���� -1 - ������!!!
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
       // ��������� ����� ����
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
    main_form.Memo1.lines.add('����������� � ����...');
    delay(10);
    DataModule1.IBDatabase1.Connected:=True;
    main_form.Memo1.lines.add('����������� � ���� ���������...');
    // ������ �������� ���������
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EMAIL_HOST"');
    if QueryWork.eof then begin
        EMAIL_HOST:='beep.ru';
    end else begin
        EMAIL_HOST:=QueryWork.fieldByname('CFG_VALUE').asstring;
    end;

    // ���������� ����� ��������� � ����� ��������
//    MyMail.OutlookConnect1.ItemSend; // �������� �����
    // ������������ � ���� ������ � ��������� ������ ������ ��� ����������, �������� ��,
    // ������� ��������� �� ����������
    WorkTransaction.Active:=False;
    // ��������� �������� ������, ������� ��������� � ����������
    main_form.Memo1.lines.add('��������� ������ ������, ����������� � ���������...');
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

    main_form.Memo1.lines.add('��������� ������ �����, ����������� �� ���������...');
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
    add_log('��������� �����. � ����� "��������" '+inttostr(cnt)+' ���������');
    if CanLog then Memo1.lines.add('� ����� "��������" '+inttostr(cnt)+' ���������');

  TRY
    for _MailIndex:=1 to cnt do begin
       MailIndex:=_MailIndex;
       label3.caption:=inttostr(MailIndex)+' �� '+inttostr(cnt);
       s:=trim(MyMail.Items[MailIndex].SubJect);
       MailSubject:=trim(MyMail.Items[MailIndex].SubJect);
       // ��������� ���������,
       // ����������� ������ "��������� ������" ��� "��������� � ������"
       tmp_s1:=s;
       // �������� ����� ������������� �� �������
       for b:=1 to length(tmp_s1) do if tmp_s1[b]='_' then tmp_s1[b]:=' ';
       // �������� ������ ������ ���������

       if argv(tmp_s1)>3 then begin
          tmp_s2:=trim(argc(tmp_s1,1));
          tmp_s3:=trim(argc(tmp_s1,2));
          tmp_s4:=trim(argc(tmp_s1,3));
          tmp_s5:=trim(argc(tmp_s1,4));
          tmp_s6:=trim(argc(tmp_s1,5)); // �����


          // ��������� �������� - ���������� �����������
          // s2 - &1 ��� &0
          // s3 - ����� ������
          // s4 - ID ���������
          // s5 - ����������� ����� ID+�����
          if CanInsertLog then Memo1.lines.add(tmp_s2+' ���������� ������-�����. '+inttostr(CONTROLSUMM(tmp_s4+tmp_s2)));
          try
             MAIL_NUM:=strtoint(tmp_s3); // �������� ����� ���������
             if (tmp_s2='$0') or (tmp_s2='$1') then if CanInsertLog then Memo1.lines.add('���������� ������-�����. '+inttostr(CONTROLSUMM(tmp_s4+tmp_s2)));
             if ((tmp_s2='$0') or (tmp_s2='$1')) and (strtoint(tmp_s5)=CONTROLSUMM(tmp_s4+tmp_s2)) then begin
                if CanInsertLog then Memo1.lines.add('���������� ������-�����. '+tmp_s1);
                delay(1);
                // ��������� ������������ ������ ID
                worktransaction.Active:=False;
                OPEN_SQL(QueryWork,'select * from MAIL where MAIL_ID='+tmp_s4);
                mail_frm_id:=Querywork.fieldbyname('frm_id').asinteger;




                IF not QueryWork.eof then begin
                   if QueryWork.fieldByname('MAIL_NUM').asinteger=MAIL_NUM then begin
                      // ��������� ��������!
                      if CanInsertLog then Memo1.lines.add('������ ��������! SOST='+QueryWork.fieldByname('MAIL_SOST').asstring+', Subsost='+QueryWork.fieldByname('MAIL_SUBSOST').asstring);
                      delay(1);
                      if (QueryWork.fieldByname('MAIL_SOST').asinteger=6)
                          and (b_utils.left(QueryWork.fieldByname('MAIL_SUBSOST').asstring,1)='1') then begin
                          // ��������� ���� ��������� � ��������!
                          if CanLog then Memo1.lines.add('������� ����� �� �� ��������� � '+tmp_s3);
                          delay(1);
                          if tmp_s2='$1' then begin
                             // ��������� ������ � ��������� "����������"
                             Datamodule1.IBTransaction2.Active:=False;
                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                               IBSAVE_CLEAR;
                               IBSAVE_ADD('MAIL_SOST',3);
                               IBSAVE_ADD('UTW_DATE',my_now);
                               IBSAVE_ADD('UTW_US',0);
                               if CanLog then Memo1.lines.add('�������� ������������� ����������� ������ � ID='+tmp_s4);
                               if IBSAVE_DOC('MAIL',strtoint(tmp_s4))<0 then r:=sqrt(-1);
                               Datamodule1.IBTransaction2.Commit;
                               if CanLog then Memo1.lines.add('��������� �������������!. �������� ������...');
                               add_log('������ � '+tmp_s3+' ���������� � ������������!');
                               //�������� ������ ����������� ��� ���������� �����



                               if mail_frm_id<>2696877 then
                                mail_frm_id:=0;

                               OPEN_SQL(QueryWork2,'select CFG_NAME,CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME in ("HOME_EMAIL","TITLE_EMAIL","REPEAT_EMAIL") and CFG_SET1='+inttostR(mail_frm_id));
                               if QueryWork2.eof then begin
                                       HOME_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                                       TITLE_EMAIL:='��� "�����"';
                                       REPEAT_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               end else begin
                                      if QueryWork2.locate('CFG_NAME','TITLE_EMAIL',[]) then TITLE_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                                      if QueryWork2.locate('CFG_NAME','HOME_EMAIL',[]) then HOME_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                                      if QueryWork2.locate('CFG_NAME','REPEAT_EMAIL',[]) then REPEAT_EMAIL:=QueryWork2.fieldByname('CFG_VALUE').asstring;
                               end;
                               if pos('@',HOME_EMAIL)<1 then HOME_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               if pos('@',REPEAT_EMAIL)<1 then REPEAT_EMAIL:='aaa@olimpiya.yaroslavl.ru';
                               // �������� ��������� ��������

                               // �������� ���� ���� ������ � ������������ �������, ������� ��������
                               // � �������� ZAYs

                               SakMSG1:=TSakMSG.Create(nil);
                               SakMsg1.ParseMsg;
                               SakMsg1.Subject := '���������� # '+QueryWork.fieldByname('MAIL_NUM').asstring+' �� ����� '+b_utils.right(b_utils.space(10)+tmp_s6,10)+' �� '+date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime);
                               SakMsg1.MessageType:=MtHtml;
                               if CanLog then Memo1.lines.add('��������� ���� '+ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm');
                               if SysUtils.Fileexists(ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm') then begin
                                  SakMsg1.Text.LoadFromFile(ExtractFilePath(Application.EXEName)+PathForHtmlZay+tmp_s4+'.htm');
                               end else begin
                                  SakMsg1.Text.Add('� ������������ ���� ������ �� ����������!');
                               end;
                               if CanLog then Memo1.lines.add('���� ��������...');
                               SakMsg1.AttachedFiles.Clear;
                               SakMsg1.AttachedFiles.add('Bsklad_HTML_Pic1.jpg');
                               SakMsg1.CharSet := 'windows-1251';
                               SakMsg1.TextEncoding := te8Bit;
                               SakMsg1.UserName :=TITLE_EMAIL;
                               SakMsg1.From := HOME_EMAIL;
                               SakMsg1.SendTo := REPEAT_EMAIL;
                               SakSMTP1.host := EMAIL_HOST;
                               if CanLog then Memo1.lines.add('������ ������������...');
                               SakSMTP1.connect;
                               if not SakSMTP1.SMTPError then begin
                                  SakSMTP1.SendTheMessage( SakMsg1);
                                  // �������� ������ �� ��������
                                  inc(cntDelMail);
                                  ArrDelMail[cntDelMail]:=MailSubject;
                               end;
                               SakMsg1.ParseMsg;
                               SakSMTP1.Disconnect;
                             except
                                   CurrentError:=1;
                                   inc(ERR_ZAY);
                                   if CanLog then Memo1.lines.add('������ ��� �������� ������ � '+tmp_s3+' � ������������!');
                                   delay(1);
                                   add_log('������ ��� �������� ������ � '+tmp_s3+' � ������������!');
                               Datamodule1.IBTransaction2.Rollback;
                             end;
                             Datamodule1.IBTransaction2.Active:=False;
                             SakMSG1.Destroy;
                          end;
                      end;
                      if (tmp_s2='$0')
                         and (b_utils.left(QueryWork.fieldByname('MAIL_SUBSOST').asstring,1)='1') then begin
                            if CanLog then Memo1.lines.add('������� ����� ��� �� ��������� � '+tmp_s3);
                            delay(1);
                             // ������ �������� - ��������� ���������!!
                             // ������� �����, ��� ������ ��������!
                             // ��������� ������ � ��������� "��������"
                             Datamodule1.IBTransaction2.Active:=False;
                             Datamodule1.IBTransaction2.StartTransaction;
                             try
                               IBSAVE_CLEAR;
                               IBSAVE_ADD('MAIL_SOST',7);
                               if IBSAVE_DOC('MAIL',strtoint(tmp_s4))<0 then r:=sqrt(-1);
                               Datamodule1.IBTransaction2.Commit;
                               add_log('������ � '+tmp_s3+' ���������� � ����������!');
                               // �������� ������ �� ��������
                               inc(cntDelMail);
                               ArrDelMail[cntDelMail]:=MailSubject;
                             except
                                   CurrentError:=1;
                                   inc(ERR_ZAY);
                                   if CanLog then Memo1.lines.add('������ ��� �������� ������ � '+tmp_s3+' � ����������!');
                                   delay(1);
                                   add_log('������ ��� �������� ������ � '+tmp_s3+' � ����������!');
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









       // ����������� ������ ������
       if pos(ansiuppercase(Subject_prefix),ansiuppercase(s))=1 then begin
          // ������� ��������� � ����������� ����� �������� ��� ��� � �� ������������
          e:=argv(s);
          s1:=argc(s,e); // � ������ S1 - ����������� �����
          s2:=trim(b_utils.left(s,length(s)-length(s1))); // ������ ��� ����������� �����
          d:=0;
          try
            b:=CONTROLSUMM(s2);
            c:=strtoint(s1);
            if c=b then d:=1; // ����������� ����� �����
          except
            d:=-1;
          end;
          if d=1 then begin
            inc(Cnt2);
            // ���������� ������ � ������ ����������� ������
            // �������� ������ ����� �� ������ ���������
            s2:=trim(b_utils.right(s2,length(s2)-length(Subject_prefix)));
            // ������� ����
            for b:=1 to length(s2) do if s2[b]='-' then s2[b]:=' ';
            // ��������� MAIN_DESCR
            if argc(s2,1)=MAIN_DESCR then begin
              // ���������� �������������. ���������� ��� ���������
              try
                Mess_type:=strtoint(Argc(s2,2));
                if ((Mess_type<1) or (Mess_type>09)) then r:=sqrt(-1); // �������� ��� ���������
                case Mess_type of
                  1: begin // ������� ���������
                        // ����������, �� ���� ������ ���������
                        try
                          FROM_SHOP:=strtoint(trim(argc(s2,3)));
                          // ���������, ���� �� ����������� � ���� ���������
                          c:=0;
                          for b:=1 to CntShops do if FROM_SHOP=ArrShops[b].ID then c:=b;
                          if c=0 then begin
                             add_log('!!! ����������� ����������� "'+inttostr(FROM_SHOP)+'"!');
                             if CanLog then Memo1.lines.add('����������� ����������� "'+inttostr(FROM_SHOP)+'"!');
                             delay(1);
                          end else begin
                            // ����������� ���������
                            if CanLog then Memo1.lines.add('������ ������ � �������� ����������� �� "'+ArrShops[c].name+'"...');
                            delay(1);
                            // ���������� ����������
                            TO_SHOPS:=trim(Argc(s2,4));
                            if To_shops='***' then TO_SHOP:=-1
                            else try
                              to_shop:=strtoint(to_shops);
                            except
                               to_shop:=-2;
                               add_log('!!! ������ ��� ����������� ���������� "'+TO_SHOPS+'"!');
                               if CanLog then Memo1.lines.add('������ ��� ����������� ���������� "'+TO_SHOPS+'"!');
                               delay(1);
                            end;
                            if ((to_shop=CODE_SHOP) or (to_shop=-1)) then begin
                                // ������ ������ �� ������ - ���������� ���� �������� � ��������� �����
///////////////////////////////  �������� � ��������� ����� ������


                                IncomingPacketNum:=strtoint(trim(argc(s2,5)));
                                MAIL_DATE:=trim(argc(s2,6));
                                if CanLog then Memo1.lines.add('������ ���������� '+MAIL_DATE+' !');
                                delay(1);
                                // ���������� ��������� ��������
                                MAIL_DT1:=trim(argc(s2,7));
                                MAIL_TM1:=trim(argc(s2,8));
                                MAIL_DT2:=trim(argc(s2,9));
                                MAIL_TM2:=trim(argc(s2,10));


                                // ���������� ����� ��������� ������
                                CntFileIn:=MyMail.Items[MailIndex].Attachments.count;
                                if CanLog then Memo1.lines.add('������� '+inttostr(CntFileIn)+' ������');
                                delay(1);
                                for b:=1 to CntFileIn do begin
                                  // ���������� ��� ����������� �����
                                  FileIn:=MyMail.Items[MailIndex].Attachments[b].FileName;
                                  if CanLog then Memo1.lines.add('������ ���� "'+FileIn+'"');
                                  delay(1);


                                 if ((strpos(pchar(FileIn), 'RE')=nil)  or ( (strpos(pchar(FileIn), 'RE')<> nil) and (GetRE=true))) then
                                 begin


                                  // ��������� ��������� ����
                                  if CanLog then Memo1.lines.add('��������� ���� "'+FileIn+'"...');
                                  delay(1);
                                  PackedDataFileName:='BSKLAD_PACKED_DATA_'+floattostr(now)+'.tmp';

                                  MyMail.Items[MailIndex].Attachments[b].SaveAsfile(TMP_PATH+PackedDataFileName);
//////////////////////////////////
                                  if CanLog then Memo1.lines.add('���� "'+FileIn+'" ��������. �������������...');



                                  LoadDataFromfile(TMP_PATH+PackedDataFileName);


                                 end;     //if RE
                                end;    //for
                            end else begin
                                 add_log('!!! ������ � �������� ����������� ������ �� �� ������!');
                                 if CanLog then Memo1.lines.add('������ � �������� ����������� ������ �� �� ������!');
                                 delay(1);
                            end;
                          end;
                        except
                          // ������ ��� ����������� �����������
                        end;
                     end;
                  2: begin // ����������� ����� ������ �� ��������� ����
                     end;
                  3: begin // ������ ����������� ����� ������ �� ������
                     end;
                  4: begin // ������ ���� ������ �� ��������� ������
                     end;
                  5: begin // ������ ������ �� ��������� ������
                     end;
                  6: begin // ������ �������� � ��������� �� ��������� ������
                     end;
                  7: begin // ������ � SQL ���������
                     end;
                  8: begin // ����� � ��������� SQL �������
                     end;
                  9: begin // ������� �� ��������� ��������� ��� ���������� ������
                     end;
                end;
              except
                // ������ ��� ����������� ���� ���������
                add_log('!!! �������� ��� ���������!');
                if not AUTOMODE then messbox('�������� ��� ���������!','������!',48);
              end;
            end else begin
              // MAIN_DESCR �� �������������
              add_log('!!! ���������� �� ������������� ����������!');
              if not AUTOMODE then messbox('���������� �� ������������� ����������!','������!',48);
            end;
            // ���������� ���������� ���������
          end else begin
             // �������� ������ ��� ����������� ���� ��� � ������ ����������� ������
             add_log('!!! ������ "'+s+'" ��� ����������� ����� ��� ����� �� �����!');
             if CanLog then Memo1.lines.add('������ "'+s+'" ��� ����������� ����� ��� ����� �� �����!');
             delay(1);
          end;
       end;
    end;
  EXCEPT
  END;
    label3.caption:='��������� ���������.';
    label4.caption:='��������� ���������.';
    main_form.Memo1.lines.add('���������� �� ����...');
    delay(10);
    DataModule1.IBDatabase1.Connected:=False;
    main_form.Memo1.lines.add('���������� �� ���� ���������...');
    // ������� ������

    cnt:=MyMail.Items.Count;
    for _MailIndex:=cnt downto 1 do
    begin
      try
      for b := 1 to CntDelMail do
        if MyMail.Items[_MailIndex].Subject=ArrDelMail[b] then
        begin
          MyMail.Items[_MailIndex].delete;
          if CanLog then Memo1.lines.add('������ ������� �� Outlook!');
           delay(1);
           break;
        end;

      except
        on e: Exception do
        begin
              add_log('!!! �� ������� ������� ������ �� Outlook!'+e.Message);
              if CanLog then Memo1.lines.add('�� ������� ������� ������ �� Outlook!');
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
//           if CanLog then Memo1.lines.add('������ ������� �� Outlook!');
//           delay(1);
//        except
//              add_log('!!! �� ������� ������� ������ �� Outlook!');
//              if CanLog then Memo1.lines.add('�� ������� ������� ������ �� Outlook!');
//              delay(1);
//        end;
//    end;

    add_log('��! ��������� ���������!');
    if not AUTOMODE then Messbox('��������� ���������!','���������!',48);
end;

function CONTROLSUMM(s:ansistring):int64;
var
 a,P1,P2,P3,P4,P5,P6,P7,P8:integer;
 s2:ansistring;
begin
  // ������� ���������� ����������� ����� ������;

  s:=stringreplace(s, '$', '&', [rfReplaceAll]);

  s:=trim(ansiuppercase(s));
  P1:=length(s); // ����� ������
  P2:=0;
  for a:=1 to length(s) do P2:=P2+ord(s[a]); // ����������� ����� ������
  P3:=0;
  for a:=1 to length(s) do if IsAlpha(s[a]) then P3:=P3+ord(s[a]); // ����������� ����� ����
  P4:=0;
  for a:=1 to length(s) do if IsDigit(s[a]) then P4:=P4+ord(s[a]); // ����������� ����� ����
  P5:=P2 mod 13; // ������� �� ������� �� 13
  s2:=b_utils.right(inttostr(P1),1)+ // ��������� ����� ����� ������
     b_utils.right('00'+inttostr(P2),2)+ // ��� ��������� ����� ����������� ����� ������
     b_utils.right(inttostr(P3),1)+ // ��������� ����� ����������� ����� ����
     b_utils.right(inttostr(P4),1)+ // ��������� ����� ����������� ����� ����
     b_utils.right(inttostr(P5),1); // ������� �� ������� �� 13
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
 // ������ ������ ��������� �����
 try
    DataModule1.IBDatabase1.Connected:=False;
 except
 end;
 try
      DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
      main_form.Memo1.lines.add('����������� � ����...');
      delay(10);
      DataModule1.IBDatabase1.Connected:=True;
      main_form.Memo1.lines.add('����������� � ���� ���������...');
      Worktransaction.Active:=False;
      Add_sql(QueryWork,'select * from cfg where cfg_name="RPLEMAIL_LAST_TIME_SEND" and CFG_SET1=:CFG_SET1');
      QueryWork.ParamByname('CFG_SET1').asinteger:=CODE_SHOP;
      QueryWork.Open;

      if QueryWork.eof then begin
         PacketNum := 0;
         add_log('������ ������ ��������� ����������!');
         main_form.Memo1.lines.add('������ ������ ��������� ����������!');
         // ������ ������ - ��������� ����� �� 1 ��� �����
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
           main_form.Memo1.lines.add('��������� ������������ ������ �������!. ��������� �����: '+datetimetostr(tm));
           add_log('��������� ������������ ������ �������!. ��������� �����: '+datetimetostr(tm));
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         if IDCFG<0 then begin
            add_log('!!! �� ������� ������ ��������� ������������!');
            Messbox('�� ������� ������ ��������� ������������!',MessError,16);
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

         //������� ����� ���������� ����������� ������
         OPEN_SQL(querywork, 'SELECT MAX(PACKET_NUM) max_packet_num FROM REPLICAT_LOG WHERE SHOP_FROM='+inttostr(CODE_SHOP));
         PacketNum:=QueryWork.fieldbyname('max_packet_num').asinteger;
         inc(PacketNum);

         tm:=tm-ADD_TIME*1/24/60; // ������������ �� ��� �����
         main_form.Memo1.lines.add('��������� ������ ��������� ����������. ��������� �����: '+datetimetostr(tm));
      end;
      QueryWork.Close;
      MainPeriod1:=tm;
      MainPeriod2:=my_now();
  except
      add_log('!!! �� ������� ������������ � ���� ������!');
      if not AUTOMODE then Messbox('�� ������� ������������ � ���� ������!','������!',16);
  end;
end;
procedure TMAIN_FORM.BtnRepeatClick(Sender: TObject);
begin
    CustomTable := false;
    DataFileEmpty:=true;
    REDataFileEmpty:=true;
    SyncshopNum := -1;

    Application.createForm(Tset_period,Set_period);
    Set_period.caption:='��������� ��� ������ �������� ������';
    Set_period.showModal;
    if Set_period.tag=2 then begin
      if ExportData=0 then if not AUTOMODE then Messbox('������ �������� � ����� "���������". �������� �������� ����������� �����!','���������!',48);
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




 // ������ ������ ��������� �����
 try
    DataModule1.IBDatabase1.Connected:=False;
 except
 end;

 try
      DataModule1.IBDatabase1.DatabaseName:=DataBase_path;
      main_form.Memo1.lines.add('����������� � ����...');
      delay(10);
      DataModule1.IBDatabase1.Connected:=True;
      main_form.Memo1.lines.add('����������� � ���� ���������...');
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
            add_log('!!! �� ������� ������ ��������� ������������!');
            Messbox('�� ������� ������ ��������� ������������!',MessError,16);
        end;

      QueryWork.Close;

      ExportData;
  except
      add_log('!!! �� ������� ������������ � ���� ������!');
      if not AUTOMODE then Messbox('�� ������� ������������ � ���� ������!','������!',16);
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
      // �� �������� ������� ���������� ����

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
