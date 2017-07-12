unit PrepareForm;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  ����� � ��������� BSKLAD, ���������� ��������� ��������   ****
  ********************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,B_DButils,B_Utils, ExtCtrls,Data1, RxLookup, Db,
  IBCustomDataSet, IBQuery, IBDatabase,VclUtils, Animate, GIFCtrl, SakSMTP,
  SakMsg,FileCtrl,Elves_unit, unit_amc100f, unit_amc200f, jpeg;

type
  TPrepare_form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PrepareTransaction: TIBTransaction;
    QrUsers: TIBQuery;
    QrUsersKLN_FIO: TIBStringField;
    QrUsersKLN_PASSWORD: TIBStringField;
    QrUsersKLN_ID: TIntegerField;
    DsUsers: TDataSource;
    KLN: TRxDBLookupCombo;
    Password: TEdit;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    IBQuery1: TIBQuery;
    QrUsersUSGROUP_ID: TIntegerField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Timer3: TTimer;
    SakMsg1: TSakMsg;
    SakSMTP1: TSakSMTP;
    QueryWork2: TIBQuery;
    QueryWork3: TIBQuery;
    QueryWork4: TIBQuery;
    QueryWork5: TIBQuery;
    QrUsersKLN_DOL: TIBStringField;
    QueryWork6: TIBQuery;
    RxGIFAnimator1: TRxGIFAnimator;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    QrUsersKLN_KKM_PASSWORD: TIBStringField;
    Image1: TImage;
    IBQuery2: TIBQuery;
    QrUsersKLN_TABEL: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure Timer3Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure LoadUsers;
    procedure CreateZayFile;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
   debugdbf=False; // ����� ������� �������� DBF
var
  Prepare_form: TPrepare_form;

function DATE_TO_STR2(DT:tdatetime):ansistring;

implementation

uses Mainform, DicTowar, CalcPnOst, DataQr, FR_Shtrih, SelectKKM;

{$R *.DFM}

function DATE_TO_STR2(DT:tdatetime):ansistring;
var
  yy,mm,dd:word;
begin
  decodedate(DT,yy,mm,dd);
  result:=b_utils.right('00'+inttostr(dd),2)+'.'+
     b_utils.right('00'+inttostr(mm),2)+'.'+
     b_utils.right('00'+inttostr(yy),2);
end;

procedure TPrepare_form.CreateZayFile;
var  zayFile: TextFile;
 path: string;
begin
try
 path := ExtractFilePath(Application.EXEName);
 
            Datamodule1.IBTransaction2.Active:=False;
	        Datamodule1.IBTransaction2.StartTransaction;
	        DataModule1.IbSaveSQL.close;
	        DataModule1.IbSaveSQL.SQL.clear;
	        DataModule1.IbSaveSQL.SQL.add(
            ' select ''<a href="''||cast(mail.mail_id as varchar(10))||''.htm">''||cast(mail.mail_num as varchar(8))||''  ''||cast(mail.CREATE_DATE as varchar(12))||''</a><br>''||bg_crlf()'+
				'from mail where mail.mailvid_id=3 /* and bg_pos(mail.mail_subsost, ''1'') > 0 */ and bg_left(mail.mail_subsost, 1) <>''0'' and not mail_subsost is null and mail.create_date > ''now''-90 '+
				'order by mail.mail_num desc');


	        DataModule1.IbSaveSQL.Open;
            if not DataModule1.IbSaveSQL.Eof then
            begin
	            assignfile(zayfile, ExtractFilePath(Application.EXEName)+PathForHtmlZay+'������.htm');
                rewrite(zayfile);
            end;
            while not DataModule1.IbSaveSQL.Eof do
              begin
                write(zayFile, DataModule1.ibsaveSQL.Fields[0].asstring);
                DataModule1.IbSaveSQL.next;
              end;

            closefile(zayFile);
            IBSAVE_CLEAR;

           except
           	on e: Exception do
              begin
              	MsgBox('������ �������� ����� ������.htm!', e.message, 0);
//                writeln(logfile,datetimetostr(mynow())+' �������� ����� ������.htm. ������ ��� �������� E-mail ���������!'+e.message);;
              end;

           end;
end;

procedure TPrepare_form.Button1Click(Sender: TObject);
var
   KLN_DOL,s:ansistring;
   r:double;
   NEWID:integer;
begin
     UPDATE_TWTREE:=date()-1000;
     if trim(ansiupperCase(Password.text))=trim(ansiupperCase(QrUsers.fieldByname('KLN_PASSWORD').asstring)) then begin
        // ��������� ����
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBSAVE_CLEAR;
        IBSAVE_ADD('US_ID',0);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','������� ������� ����� � ���������� '+b_utils.SystemComputerName+' ��� ������ '+KLN.text);
        IBSAVE_ADD('DOC','LOGIN');
        IBSAVE_ADD('DOP1','1');
        IBSAVE_ADD('DOP2','0');
        try
           ibsave_doc('arcupdate',-1);
           Datamodule1.IBTransaction2.commit;
        except
           Datamodule1.IBTransaction2.rollback;
        end;
        Datamodule1.IBTransaction2.Active:=False;

        KLN_DOL:=QrUsers.fieldByname('KLN_DOL').asstring;
        {������ ������}
        SELECT_SKLAD:=DEFAULT_SKLAD;
        USER_USGROUP:=QrUsers.fieldByname('USGROUP_ID').asinteger;
        USERID:=QrUsers.fieldByname('KLN_ID').asinteger;
        USER_TABEL:=QrUsers.fieldByname('KLN_TABEL').asinteger;
        USERFIO:=QrUsers.fieldByname('KLN_FIO').asstring;
        USERFIO_SHORT:=argc(USERFIO,1)+' '+B_utils.left(argc(USERFIO,2),1)+'. '+B_utils.left(argc(USERFIO,3),1)+'.';
        //��������� ����� ������� 14.04.2004 �� ������� �2 - ��������� ������ ������� ����
        CASHIER_NAME := QrUsers.fieldByname('KLN_KKM_PASSWORD').asString;
        // ��������� ���������� ������������
        WorkTransaction.Active:=False;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('delete from cfg where cfg_name="LAST_USER_COMP" and '+
        ' CFG_VALUE="'+Computername+'"');
        Try
          DataModule1.IbSaveSQL.ExecSQL;
          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_NAME','LAST_USER_COMP');
          IBSAVE_ADD('CFG_SET1',USERID);
          IBSAVE_ADD('CFG_VALUE',COMPUTERNAME);
          if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
          Datamodule1.IBTransaction2.Commit;
        Except
          Messbox('������ ��� �������� ������������!',MessSystem,48);
          Datamodule1.IBTransaction2.Rollback;
        End;
        Datamodule1.IBTransaction2.Active:=False;
        {��������� ������ ���������� ������������ ��� ������� �������}
        {��������� ���� ������������}
        CFG_MAIN_FORM:=-1;
        Add_SQL(IbQuery1,'select * from CFG WHERE CFG_NAME="MAIN_FORM_CFG" and CFG_SET1=:USERID order by tm desc');
        IbQuery1.ParamByname('USERID').asinteger:=USERID;
        IbQuery1.Open;
        if not IbQuery1.eof then begin
           CFG_MAIN_FORM:=IbQuery1.fieldByname('CFG_ID').asinteger;
           s:=IbQuery1.fieldByname('CFG_BIG').asstring;
           {��������� ����}
           Deletefile(ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg');
           Assignfile(output,ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg');
           Rewrite(output);
           Write(output,s);
           closefile(Output);
        end;
        IbQuery1.Close;
        // �������� ������������ �� ����
        if (SHOPID=1) and (trim(ansiuppercase(DEFAULT_SERVER_NAME))<>trim(ansiuppercase(COMPUTERNAME))) then begin
          // ��������� ������ � ����� � ����� �� �� �������
        end;

//���������� �� bsklad2001.dpr ����� ����� �������� ��������� �������
      // �����������, ����� �� ������ ��������� �������� � ���
      ADD_SQL(Datamodule1.QueryPrepare,'select * from list_kkm where COMP_NAME=:COMP_NAME AND SHOP_ID=:SHOP_ID');
      Datamodule1.QueryPrepare.paramByname('COMP_NAME').asstring:=trim(ansiuppercase(b_utils.SystemComputerName));
      Datamodule1.QueryPrepare.ParambyName('SHOP_ID').asinteger:=SHOPID;
      Datamodule1.QueryPrepare.Open;
      KKM_ON:=False;
      if Datamodule1.QueryPrepare.eof then begin
         // ��������� �� � ������
         IS_KKM:=false;
      end else begin
         // ��������� � ������
         IS_KKM:=true;
         MODEL_KKM:=Datamodule1.QueryPrepare.fieldByname('MODEL').asinteger;
         if MODEL_KKM=1 then begin
            // ���-100�
            KKM_COM:=Datamodule1.QueryPrepare.fieldByname('COM').asinteger;
            KKM_ONLINE_CODE:=trim(Datamodule1.QueryPrepare.fieldByname('MODEL_NUM').asstring);
            KKM_ON:=PREP_KKM1;
            DisconnectKKM;
         end;
         if MODEL_KKM=3 then begin
            // ���-200�
            KKM_COM:=Datamodule1.QueryPrepare.fieldByname('COM').asinteger;
            KKM_ONLINE_CODE:=trim(Datamodule1.QueryPrepare.fieldByname('MODEL_NUM').asstring);
            KKM_ON:=PREP_KKM2;
//            ResetPort;
         end;

         if Datamodule1.QueryPrepare.fieldByname('MODEL').asinteger=2 then begin
            // �����-��
            try
              Elves_unit.Elves_init;
              KKM_ON:=true;
            except
            end;
         end;

         if Datamodule1.QueryPrepare.fieldByname('MODEL').asinteger=4 then begin
            // �����-��-�
              try
              Application.CreateForm(TFRShtrih, FRShtrih);
              KKM_ON:=PREP_KKM3;

              except
              	on e: Exception do
                BEGIN
              	if MsgBox('������ �������� ��', e.Message+chr(13)+chr(10)+'������� ����������?', MB_YESNO)=IDYES then
                	Application.Terminate;
                END;
              end;
              

         end;

      end;

        Datamodule1.IBTransaction1.Active:=false;
        MainMenuSet;
        CANTW_DETAL:=CHECK_DOSTUP('$DICTW.DETAL_TW');
        CANTW_ANALIZ:=CHECK_DOSTUP('$DICTW.ANALIZ_TW');
        CANTW_MARKETING:=CHECK_DOSTUP('$DICTW.MARKETING_TW');
        tag:=2;
        PrepareTransaction.Active:=False;
        Prepare_form.Hide;
        Main_form.MnKKM.visible:=IS_KKM;



        if tag>0 then begin
           MAIN_FORM.tag:=0;
           try
                if Main_form.visible then Main_form.close;
           except
           end;
           if (MODEL_KKM=2) and IS_KKM then begin
               // ���������� �������� ������� � ������������ � ������� �������
               Elves_unit.Elves_init;
               // ������ ��������� �������
               USER_PASSWORD:=trim(Password.text);
               NUM_KASSIR:=0;
               try
                 NUM_KASSIR:=strtoint(argc(KLN_DOL,1));
                 // ������ ������ �������
                if NUM_KASSIR<29 then Auto_rezim(1,user_password); // �������
                if NUM_KASSIR=29 then Auto_rezim(2,user_password); // �������������
                if NUM_KASSIR=30 then Auto_rezim(3,user_password); // ��������� �������������
                // ������� ���������� �� ��������� ��������
                 delay(100);
               except
               end;
               QrUsers.close;
               Main_Form.getstatusKKM;

           end;
           Prepare_form.hide;
           Main_form.show;



           if IS_KKM and CHECK_DOSTUP('$KKM.ON') then
           begin
//              Select_KKM.ShowModal;
 			{���������� KKM_ID ( SHOP_ID, COMP_NAME, $KKM_LIST$}
           PrepareTransaction.Active:=False;
           ibquery1.SQL.Text := 'SELECT * FROM LIST_KKM WHERE SHOP_ID=:SHOP_ID AND COMP_NAME=:COMP_NAME';
           ibquery1.ParamByName('SHOP_ID').asinteger := SHOPID;
           ibquery1.ParamByName('COMP_NAME').asstring := COMPUTERNAME;
           ibquery1.Open;
           KKM_ID := 0;
           if not ibquery1.Eof then
           	KKM_ID := ibquery1.fieldbyname('CFG_ID').asinteger;
           ibquery1.Close;
           PrepareTransaction.Active:=False;
           end;

           tag:=0;
        end;
     end else begin
        {������ ��������}
        // ��������� ��������� �������
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBSAVE_CLEAR;
        IBSAVE_ADD('US_ID',0);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','��������� ������� ����� � ���������� '+b_utils.SystemComputerName+' ��� ������ '+KLN.text+' � ������� '+password.text);
        IBSAVE_ADD('DOC','LOGIN');
        IBSAVE_ADD('DOP1','0');
        IBSAVE_ADD('DOP2','0');
        try
           ibsave_doc('arcupdate',-1);
           Datamodule1.IBTransaction2.commit;
        except
           Datamodule1.IBTransaction2.rollback;
        end;
        Datamodule1.IBTransaction2.Active:=False;
        Messbox('�������� ������!',MessSystem,48);
        Button1.setfocus;
        Password.setfocus;
     end
end;

procedure TPrepare_form.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TPrepare_form.Timer1Timer(Sender: TObject);
type
  recmen=record
    men_id:integer;
    men_full:ansistring;
    list:tstringlist;
  end;
var
  HTMLFILE:TextFile;
  Rdt1,Rdt2:tdatetime;
  tw_all,tw_cnt:integer;
  pdt1,pdt2:tdatetime;
  cntmens:integer;
  arrmen:array[1..100] of recmen;
  rub_color,dollar_color:string;
  tmpcnt,tmpcnt2:integer;
  tmps:ansistring;
  S_SUBSOST:ansistring;
  SMON:ansistring;
  SCOLOR:ansistring;
  SMON1, SMON2, SMON3, SMON0, SMON6, SMON7, SMON8 :ansistring;
  SCOLOR1, SCOLOR2, SCOLOR3, SCOLOR0, SCOLOR6, SCOLOR7, SCOLOR8:ansistring;
  ZAK,ZAKD:double;
  a_tmp:integer;
  TMP_ID:array[1..50000] of integer;
  SEEK_ID:array[1..50000] of integer;
  cnt_Id:integer;
  LAST_EMAIL_EXPORT_DT,DT1,DT2:tdatetime;
  LAST_EMAIL_EXPORT_DT_ID:integer;
  idcfg,b:integer;
  logfile,OkFile:textFile;
  r:double;
  CNT_ERR:integer;
  RESIVE_ID:integer;
  RESIVE_EMAIL:ansistring;
  EMAIL_HOST:ansistring;
  NO_EMAIL:ansistring;
  TITLE_EMAIL,UTW_EMAIL,OK_EMAIL,NOOK_EMAIL,HOME_EMAIL:ansistring;
  s:ansistring;
  st,sf:ansistring;
  stw:ansistring;
  small_date:Tdatetime;
  TMP_STRING,ZAY_SUBJECT:ANSISTRING;
  TMP_STRING2:ansistring;
  ZAY_MES:integer;
  ZAY_PERCENT_WARNING:integer;
  TMP_DT1,TMP_DT2:Tdatetime;
  WT,WP,PT,PP,Srok:double;
  RT,OT,SROKT:double;
  REPORT_TXT:ansistring;
  list1,list2,list3:tstringlist;
  tm1,tm2:tdatetime;
  T_OST:double;
  T_OST_SUMM:double;
  T_OST_SUMMD:double;
  T_PRIBYL:double;
  T_PRIBYLD:double;
  T_REAL_SUMM:double;
  T_LAST_REALIZ:tdatetime;
  T_POST_SUMM:double;
  ZAY_TYP_STR: string;



function no_space(s:ansistring):ansistring;
var a:integer;
begin
  for a:=1 to length(s) do if s[a]=' ' then s[a]:='_';
  result:=s;
end;


begin
   list1:=Tstringlist.Create;
   list2:=Tstringlist.Create;
   list3:=Tstringlist.Create;
   {**********************************************************************
    **********************************************************************
    ****                    �������� ���!                             ****
    **********************************************************************
    **********************************************************************}
   if IsRefreshRe then begin
     timer3.enabled:=False;
     timer1.Enabled:=False;

      //18-02-2015 - ������� �������� ��� ������, �� ���������� ��������
      OPEN_SQL(QueryWork,'select min(close_period_min) as close_period_min from main'); //
      Rdt1:=QueryWork.fieldByname('close_period_min').asdatetime;  //����� -1 ����.
      Querywork.Close;
      QueryWork.Transaction.Commit;


      OPEN_SQL(QueryWork,'execute procedure close_per');   //����������� ������ � �����. ����� �� ������������� ������� �� ���������
                                                          // ������ MAIN
      Querywork.Close;
      QueryWork.Transaction.Commit;


      QueryWork.SQL.Text:='SELECT COUNT(*) FROM A2_POPOLN_OST_PERIOD';       //�������-������� ��������� � �����  - �������� �� �������
                                                                            //������ ����  � main ���� ������ 1 ����� - � ����� ����
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;




      tm1:=time();

     //repeat
//      WorkTransaction.Active:=False;
//      ADD_SQL(QueryWork,'select * from A0_REFRESH_LIST_PREP1(:dt1,:dt2) order by dt,typ,ids');
//      QueryWork.ParamByname('dt1').asdatetime:=Rdt1;
//      QueryWork.ParamByname('dt2').asdatetime:=Rdt1+1-sekond1;
//      Prepare_Form.caption:='������ '+date_sokr(rdt1);
//      Application.Title:=Prepare_Form.caption;
//      QueryWork.Open;
//      while not QueryWork.eof do begin
//         Prepare_Form.caption:='������ '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
//         ' IDS='+QueryWork.fieldByname('ids').asstring;
//         delay(1);
//         Application.Title:=Prepare_Form.caption;
//         DataModule3.ReTransaction.Active:=False;
//         try
//           ADD_SQL(DataModule3.QueryRe1,'select * from a0_analiz_rashod(:typ,:ids)');
//           DataModule3.QueryRe1.ParamByname('typ').asinteger:=QueryWork.fieldByname('typ').asinteger;
//           DataModule3.QueryRe1.ParamByname('ids').asinteger:=QueryWork.fieldByname('ids').asinteger;
//           DataModule3.QueryRe1.Open;
//           DataModule3.ReTransaction.Commit;
//         except
//           DataModule3.ReTransaction.Rollback;
//         end;
//         DataModule3.ReTransaction.Active:=False;
//         QueryWork.next;
//      end;
//      // ��������� ����
//      DataModule3.ReTransaction.Active:=False;
//      WorkTransaction.Commit;
//      try
//         ADD_SQL(DataModule3.QueryRe1,'select * from a0_set_close_period_min(:dt)');
//         DataModule3.QueryRe1.ParamByname('dt').asdatetime:=Rdt1+1-sekond1;
//         DataModule3.QueryRe1.Open;
//         DataModule3.ReTransaction.Commit;
//      except
//            DataModule3.ReTransaction.Rollback;
//      end;
//
//
//
//      Rdt1:=Rdt1+1;
//     until Rdt1>date();

      QueryWork.SQL.Text:='SELECT COUNT(*) FROM A2_RECALC_RNS(:dt)';       //�������� ��������� ������ ��� ������� 3% � �����  - �������� �� �������
      Querywork.ParamByName('DT').asdatetime := rdt1;
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;



      QueryWork.SQL.Text:='DELETE FROM RE WHERE DT > :dt';
      Querywork.ParamByName('DT').asdatetime := rdt1;
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;


      QueryWork.SQL.Text:='DELETE FROM TWDYNGROUP WHERE IS_TEMPORARY=1 and tm < "now"-7';
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;

      QueryWork.SQL.Text:='DELETE FROM KLIENTDYNGROUP WHERE IS_TEMPORARY=1 and tm < "now"-7';
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;



      repeat

      // ������������� ���� ������� ������ ���� ������
//      WorkTransaction.Active:=False;
//      try
//         ADD_SQL(QueryWork,'select * from CALC_RN_PN_MONEY');
//         QueryWork.Open;
//         WorkTransaction.Commit;
//      except
//            WorkTransaction.Rollback;
//      end;
//      WorkTransaction.Active:=False;


      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select * from A0_REFRESH_LIST_PREP1(:dt1,:dt2) order by dt,typ,ids');
      QueryWork.ParamByname('dt1').asdatetime:=Rdt1;
      QueryWork.ParamByname('dt2').asdatetime:=Rdt1+1-sekond1;
      main_form.caption:='������ '+date_sokr(rdt1);
      Application.Title:=main_form.caption;
      QueryWork.Open;

      try
        DataModule3.ReTransaction.Active:=False;
        while not QueryWork.eof do begin

           main_form.caption:='������ '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
           ' IDS='+QueryWork.fieldByname('ids').asstring;
           Application.Title:=main_form.caption;
           Application.ProcessMessages;


           ADD_SQL(DataModule3.QueryRe1,'select * from a0_analiz_rashod(:typ,:ids)');
           DataModule3.QueryRe1.ParamByname('typ').asinteger:=QueryWork.fieldByname('typ').asinteger;
           DataModule3.QueryRe1.ParamByname('ids').asinteger:=QueryWork.fieldByname('ids').asinteger;
           DataModule3.QueryRe1.Open;



           QueryWork.next;
        end;

        if datamodule3.ReTransaction.InTransaction then
          DataModule3.ReTransaction.Commit;
      except
        on e: exception do
        begin
          messbox('������ �������� ���!!! Date/TYP/IDS= '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
           ' IDS='+QueryWork.fieldByname('ids').asstring+ chr(10) + e.message, 'FATAL ERROR', 0);
          DataModule3.ReTransaction.Rollback;
        end;
      end;

      WorkTransaction.Commit; //������������ ��������/������ � �������� ������� ���� ����
      // ��������� ����
      DataModule3.ReTransaction.Active:=False;
      try
         ADD_SQL(DataModule3.QueryRe1,'select * from a0_set_close_period_min(:dt)');
         DataModule3.QueryRe1.ParamByname('dt').asdatetime:=Rdt1+1-sekond1;
         DataModule3.QueryRe1.Open;
         DataModule3.ReTransaction.Commit;
      except
            DataModule3.ReTransaction.Rollback;
      end;
      DataModule3.ReTransaction.Active:=False;
      Rdt1:=Rdt1+1;
      until Rdt1>date();

    {  // ������������� ���� ������� ������ ���� ������
      WorkTransaction.Active:=False;
      try
         ADD_SQL(QueryWork,'select * from CALC_RN_PN_MONEY');
         QueryWork.Open;
         WorkTransaction.Commit;
      except
            WorkTransaction.Rollback;
      end;
      ��������� ����������������}


      QueryWork.SQL.Text:='SELECT COUNT(*) FROM A2_RECALC_RNS(:dt)';       //�������� ��������� ������ ��� ������� 3% � �����  - �������� �� �������
      Querywork.ParamByName('DT').asdatetime := rdt1;
      QueryWork.Open;
      Querywork.Close;
      QueryWork.Transaction.Commit;


      WorkTransaction.Active:=False;

     tm2:=time();
     WinExec(PChar('net send * �������� ��� � ��� ����� ���������. ����� ������� '+timetostr(tm2-tm1)),SW_ShowNormal);
     timer3.enabled:=true;
   end;
   {**********************************************************************
    **********************************************************************
    ****                    �������� ������!                          ****
    **********************************************************************
    **********************************************************************}
   if IsEmailExport then begin
     timer3.enabled:=False;
     timer1.Enabled:=False;
     try
        assignfile(logfile,'replicat.log');
       try
         Append(logfile);
       except
         Rewrite(logfile);
       end;
       // ������ ���� �������� ��������
       WorkTransaction.Active:=False;
       DT2:=my_now();
       OPEN_SQL(QueryWork,'select * from cfg where cfg_name="LAST_EMAIL_EXPORT"');
       if QueryWork.eof then begin
           // ������ ������ ������ ��������
           // ������������� ���� ���������� �������� �� ����� �����
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           IBSAVE_clear;
           IBSAVE_ADD('CFG_NAME','LAST_EMAIL_EXPORT');
           IBSAVE_ADD('DATE_VALUE',datetimetostr(my_now()-1));
           if IBSAVE_DOC('CFG',-1)>0 then begin
                Datamodule1.IBTransaction2.commit;
                writeln(logfile,datetimetostr(mynow())+' E-mail. ������ ������ �������� E-mail. ���� ���������� �������� ����������� �� '+datetimetostr(my_now()-1)+' !');;
           end else begin
              Datamodule1.IBTransaction2.Rollback;
              Datamodule1.IBTransaction2.Active:=False;
           end;
           Datamodule1.IBTransaction2.Active:=False;
       end else begin
         // ������������ ����������� �����
         REPORT_TXT:='';
         //*******************************************************************************
         //*******************************************************************************
         //*******************************************************************************
         //*******************************************************************************
         //*******************************************************************************
         //*******************************************************************************
         LAST_EMAIL_EXPORT_DT:=QueryWork.fieldByname('DATE_VALUE').asdatetime-30;
         LAST_EMAIL_EXPORT_DT_ID:=QueryWork.fieldByname('CFG_ID').asinteger;
         QueryWork.close;
         writeln(logfile,datetimetostr(mynow())+' E-mail. ������ �������� E-mail ���������!');
         // ������ ��� ����� ��� ��������
         WorkTransaction.Active:=False;
         OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ZAY_PRIBYL_MES"');
         ZAY_MES:=3;
         if not Querywork.eof then ZAY_MES:=strtoint(QueryWork.fieldByname('CFG_VALUE').asstring);
         OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ZAY_PERCENT_WARNING"');
         ZAY_PERCENT_WARNING:=0;
         if not Querywork.eof then ZAY_PERCENT_WARNING:=strtoint(QueryWork.fieldByname('CFG_VALUE').asstring);
         // ������ ��������� ��� �������� ������ � ������� ����-������
         OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EMAIL_HOST"');
         if QueryWork.eof then begin
           EMAIL_HOST:='beep.ru';
         end else begin
          EMAIL_HOST:=QueryWork.fieldByname('CFG_VALUE').asstring;
         end;
         writeln(logfile,datetimetostr(mynow())+' E-mail. ��������� ��� �����!');
         writeln(logfile,datetimetostr(mynow())+' E-mail. ������� '+inttostr(ZAY_MES)+' ������� '+inttostr(ZAY_PERCENT_WARNING));
         // ������ ����� ��� ����������� �����
         OPEN_SQL(QueryWork,'select CFG_NAME,CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME in ("NO_EMAIL","HOME_EMAIL","OK_EMAIL","NOOK_EMAIL","TITLE_EMAIL", "UTW_EMAIL") and CFG_SET1='+inttostR(GL_FRM_WORK_MODE));
         if QueryWork.eof then begin
           NO_EMAIL:='beginnerspam@beep.ru';
           HOME_EMAIL:='��������� ����';
           OK_EMAIL:='beginnerspam@beep.ru';
           NOOK_EMAIL:='beginnerspam@beep.ru';
           UTW_EMAIL:='beginnerspam@beep.ru';
           TITLE_EMAIL:='��� "�����"';
         end else begin
          if QueryWork.locate('CFG_NAME','TITLE_EMAIL',[]) then TITLE_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
          if QueryWork.locate('CFG_NAME','NO_EMAIL',[]) then NO_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
          if QueryWork.locate('CFG_NAME','HOME_EMAIL',[]) then HOME_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
          if QueryWork.locate('CFG_NAME','OK_EMAIL',[]) then OK_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
          if QueryWork.locate('CFG_NAME','NOOK_EMAIL',[]) then NOOK_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
          if QueryWork.locate('CFG_NAME','UTW_EMAIL',[]) then UTW_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
         end;
         if pos('@',NO_EMAIL)<1 then NO_EMAIL:='aaa@olimpiya.yaroslavl.ru';
         if pos('@',HOME_EMAIL)<1 then HOME_EMAIL:='aaa@olimpiya.yaroslavl.ru';
         if pos('@',OK_EMAIL)<1 then OK_EMAIL:='aaa@olimpiya.yaroslavl.ru';
         if pos('@',NOOK_EMAIL)<1 then NOOK_EMAIL:='aaa@olimpiya.yaroslavl.ru';
         if pos('@',UTW_EMAIL)<1 then UTW_EMAIL:='aaa@olimpiya.yaroslavl.ru';
         writeln(logfile,datetimetostr(mynow())+' E-mail. ����������� '+TITLE_EMAIL);
         writeln(logfile,datetimetostr(mynow())+' E-mail. ��: '+HOME_EMAIL);
         writeln(logfile,datetimetostr(mynow())+' E-mail. ����: '+UTW_EMAIL);
         writeln(logfile,datetimetostr(mynow())+' E-mail. ��� �����������: '+OK_EMAIL);
         writeln(logfile,datetimetostr(mynow())+' E-mail. ��� ������: '+NOOK_EMAIL);
         writeln(logfile,datetimetostr(mynow())+' E-mail. ��� ���������: '+NO_EMAIL);

         WorkTransaction.Active:=False;
{         OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="UTW_EMAIL"');
         Cnt_ERR:=0;
         if QueryWork.eof then begin
            inc(Cnt_ERR);
            writeln(logfile,datetimetostr(mynow())+' E-mail. !!!!! �� ����� ����� ��� ������������ ������ !');;
         end else
}
         begin
//            UTW_EMAIL:=QueryWork.fieldByname('CFG_VALUE').asstring;
            writeln(logfile,datetimetostr(mynow())+' E-mail. �������� E-mail ��� ������������ ������!');
            if pos('@',UTW_EMAIL)<1 then begin
              inc(Cnt_ERR);
              writeln(logfile,datetimetostr(mynow())+' E-mail. !!!!! �������� ����� ��� ������������ ������!');;
            end else begin
                begin
                  // ��������� ������ ��� �����������
                  WorkTransaction.Active:=False;
                  small_date:=EnCodeDate(1900,1,1);
                  ADD_SQL(QueryWork,'select MAIL_ZAY_EMAIL.*,SKL.SKL_FULL,MAIL.OPLDO_DATE,PNTYP.PNTYP_SHORT as MAILOPL_NAM from MAIL_ZAY_EMAIL(:DT1,:DT2, :FRM_ID),MAIL,SKL,PNTYP where MAIL.MAILOPL_ID=PNTYP.PNTYP_ID and MAIL_ZAY_EMAIL.MAIL_ID=MAIL.MAIL_ID and MAIL.SKL_ID=SKL.SKL_ID');
                  QueryWork.ParamByname('DT1').asdatetime:=LAST_EMAIL_EXPORT_DT;
                  QueryWork.ParamByname('DT2').asdatetime:=DT2;
                  QueryWork.ParamByname('FRM_ID').asInteger:=GL_FRM_WORK_MODE;
                  
                  QueryWork.Open;
                  writeln(logfile,datetimetostr(mynow())+' E-mail. �������� ������ ������!');
                  while not QueryWork.eof do begin
                    tmps:=QueryWork.fieldByname('MAIL_SUBSOST').asstring+space(10);
                    if (tmps[1]=' ') or (tmps[1]='0') then begin
                       if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                         rub_color:=' bgcolor=#FCFC81';
                         dollar_color:='';
                       end else begin
                         rub_color:='';
                         dollar_color:=' bgcolor=#FCFC81';
                       end;
                       tmpcnt:=0;
                       prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring;
                       OPEN_SQL(QueryWork2,'select * from LIST_MAILS('+inttostr(QueryWork.fieldByname('MAIL_ID').asinteger)+')');
                       st:=''; sf:=''; stw:='';
                       list1.Clear; // �������� ������
                       list2.Clear; // ���� ��� �����������
                       list3.Clear; // ���������� ������
                       list1.add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
                       list1.add('<HTML><HEAD><TITLE></TITLE>');
                       list1.add('<META http-equiv=Content-Type content="text/html; charset=windows-1251">');
                       list1.add('<META content="MSHTML 5.50.4522.1800" name=GENERATOR></HEAD>');
                       list1.add('<body background="Bsklad_Html_Pic1.jpg" bgcolor="#FFFFFF">');
                       list1.add('<FONT face=Arial');
                       list1.add('size=2>&nbsp;</FONT>');
                       list1.add('<TABLE border=0>');
                       list1.add('  <TBODY>');
                       list1.add('  <TR>');
{                       if GL_FRM_WORK_MODE > 0 then
                        ZAY_TYP_STR := '�������-���'
                       else
                        ZAY_TYP_STR := '�������-����';
}
                       ZAY_TYP_STR := QueryWork.fieldByname('ZAY_TYP_STR').asstring;
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>'+'������ � '+ZAY_TYP_STR+QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                       date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                       ' �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+' '+
                       QueryWork.fieldByname('VALUTA_SHORT').asstring+
                       '<BR>'+
                       ' ������� ������: '+floattostrf(QueryWork.fieldByname('PRIBYL').asfloat,fffixed,19,2)+' '+ QueryWork.fieldByname('VALUTA_SHORT').asstring+
                       ', '+
                       ' ������� ���: '+floattostrf(QueryWork.fieldByname('PRIBYL_OPT').asfloat,fffixed,19,2)+' '+ QueryWork.fieldByname('VALUTA_SHORT').asstring+
                       ', '+
                       ' ������� ����: '+floattostrf(QueryWork.fieldByname('PRIBYL_ROZN').asfloat,fffixed,19,2)+' '+ QueryWork.fieldByname('VALUTA_SHORT').asstring+
                       ', '+
                       ' ������� �����������: '+floattostrf(QueryWork.fieldByname('PRIBYL_PP').asfloat,fffixed,19,2)+' '+ QueryWork.fieldByname('VALUTA_SHORT').asstring);


                       list1.add('    </STRONG></FONT></TD></TR>');
                       list1.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>'+'���������: '+QueryWork.fieldByname('POST_NAM').asstring+'</STRONG></FONT></TD></TR>');
                       list1.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>����� ���������: '+QueryWork.fieldByname('SKL_FULL').asstring+',');
                       list1.add('      ��� ������: '+QueryWork.fieldByname('MAILOPL_NAM').asstring+', �������� ��: ');
                       if QueryWork.fieldByname('OPLDO_DATE').asdatetime<small_date then
                       list1.add('<�� �������>') else list1.add(date_sokr(QueryWork.fieldByname('OPLDO_DATE').asdatetime));
                       list1.add('</STRONG></FONT></TD></TR>');
                       list1.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>���������:');
                       list1.add('      '+QueryWork.fieldByname('MAIL_OSN').asstring+'</STRONG></FONT></TD></TR>');
                       list1.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>����������: '+QueryWork.fieldByname('PRIM1').asstring+'</STRONG></FONT></TD></TR>');
                       list1.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>���������� ���������: '+QueryWork.fieldByname('PRIM2').asstring+'</STRONG></FONT></TD></TR>');



                       list2.add('  <TR>');
                       list2.add('    <TD colSpan=2>&nbsp;</TD></TR>');
                       list2.add('  <TR>');


                       list2.add('  <TR>');
                       list1.add('    <TD colSpan=2><FONT face=Arial size=2><STRONG>����������� ����������: </STRONG></FONT></TD></TR>');
                       list2.add('  <TR>');

                       ibquery2.SQL.Text:='SELECT * FROM MAIL_COMMENT WHERE MAIL_ID=:MAIL_ID order by tm';
                       ibquery2.ParamByName('MAIL_ID').asInteger:=QueryWork.FieldByName('MAIL_ID').asInteger;
                       ibquery2.open;

                       while not ibquery2.Eof do
                       begin
                            list2.add('  <TR>');
                            list1.add('    <TD colSpan=2><FONT face=Arial size=2>'+
                            ibquery2.FieldByName('US_FIO').asString+': '+
                            ibquery2.FieldByName('SOGL_TXT').asString+': '+
                            ibquery2.FieldByName('COMMENT').asString+
                            '</STRONG></FONT></TD></TR>');
                            list2.add('  <TR>');

                            
                            ibquery2.Next;
                       end;

                       ibquery2.Close;







                       list2.add('    <TD><img src="Bsklad_HTML_Ok.gif" width="13" height="13"></TD>');
                       REPORT_TXT:=REPORT_TXT+QueryWork.fieldByname('MAILOPL_NAM').asstring+QueryWork.fieldByname('MAIL_NUM').asstring+', ';
                       TMP_STRING:='������ '+QueryWork.fieldByname('MAILOPL_NAM').asstring+QueryWork.fieldByname('MAIL_NUM').asstring+', ';
                       if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                          // �����
                          TMP_STRING:=TMP_STRING+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,0)+'�.';
                          TMP_STRING2:=' '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,0)+'�.';
                       end else begin
                          // �������
                          TMP_STRING:=TMP_STRING+floattostrf(QueryWork.fieldByname('SUMM').asfloat*QueryWork.fieldByname('MAIL_KURS').asfloat,fffixed,19,0)+'�.('+
                            floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,1)+'$,�� '+floattostrf(QueryWork.fieldByname('MAIL_KURS').asfloat,fffixed,19,1)+'�/$)';
                          TMP_STRING2:=' '+floattostrf(QueryWork.fieldByname('SUMM').asfloat*QueryWork.fieldByname('MAIL_KURS').asfloat,fffixed,19,0)+'�.';
                       end;
                       TMP_STRING:=TMP_STRING+' �� '+date_short(QueryWork.fieldByname('CREATE_DATE').asdatetime);
                       TMP_STRING2:=TMP_STRING2+' �� '+date_short(QueryWork.fieldByname('CREATE_DATE').asdatetime);
                       list2.add('    <TD><a href="'+
                       no_space('mailto:'+OK_EMAIL+'?Subject=$1 '+QueryWork.fieldByname('MAIL_NUM').asstring+' '+QueryWork.fieldByname('MAIL_ID').asstring+' '+inttostr(BSKLAD_CONTROLSUMM(trim(QueryWork.fieldByname('MAIL_ID').asstring)+'&1'))+TMP_STRING2+'"><FONT size=2><STRONG>��������� ������</STRONG></FONT></a></TD></TR>'));
                       list2.add('  <TR>');
                       list2.add('    <TD><FONT size=2><STRONG><img src="Bsklad_HTML_nook.gif" width="33" height="14"></TD>');
                       list2.add('    <TD><a href="'+
                       no_space('mailto:'+OK_EMAIL+'?Subject=$0 '+QueryWork.fieldByname('MAIL_NUM').asstring+' '+QueryWork.fieldByname('MAIL_ID').asstring+' '+inttostr(BSKLAD_CONTROLSUMM(trim(QueryWork.fieldByname('MAIL_ID').asstring)+'&0'))+TMP_STRING2+'"><FONT size=2><STRONG>�� ���������� ������</STRONG></FONT></a></TD></TR>'));
                       list2.add('  <TR>');
                       list2.add('    <TD><FONT face=Arial size=2><img src="Bsklad_html_mail.gif" width="14" height="15"></TD>');
                       list2.add('    <TD><a href="'+no_space('mailto:'+QueryWork.fieldByname('US_EMAIL').asstring+'?Subject=����������� � '+
                       '������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                       date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                       ' �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+' '+
                       QueryWork.fieldByname('VALUTA_SHORT').asstring)+'"><FONT size=2><STRONG>������� ����������� ��������� �� �������');
                       list2.add('      ������</STRONG></FONT></a></TD></TR>');
                       list3.add('      </TBODY></TABLE>');
//                       list3.add('<TABLE cellSpacing=1 border=1>');
//                       list3.add('<P><FONT face=Arial size=2></FONT>&nbsp;</P></BODY></HTML>');
                       list3.add('������� ��������� = (���� ���� - ���. ���� �����������)*���-��	<BR>'+
                                 '������� ����������� ���������� ����� ����� ������� ����������� ����������. ������� �������� �� ���������� ��������.<BR>'+
                                 '���� � ������� - � ������');

//                       , �� - ������������� ������, �� - ������������� ������, ���� - ���� �� 100% ��������������� ������');
                       try
                          TMP_STRING:='������ �� ������� � '+QueryWork.fieldByname('MAIL_NUM').asstring+' '+
                          QueryWork.fieldByname('MAILOPL_NAM').asstring+' �����: ';
                          if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                             // �����
                             TMP_STRING:=TMP_STRING+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+' ���.';
                          end else begin
                             // �������
                             TMP_STRING:=TMP_STRING+floattostrf(QueryWork.fieldByname('SUMM').asfloat*QueryWork.fieldByname('MAIL_KURS').asfloat,fffixed,19,2)+' ���. ('+
                               floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,3)+'$, ����: '+floattostrf(QueryWork.fieldByname('MAIL_KURS').asfloat,fffixed,19,2)+')';
                          end;
                          TMP_STRING:=TMP_STRING+' �� '+date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime);
                          ZAY_SUBJECT:=TMP_STRING;
                          if not QueryWork2.eof then  begin
                             prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt);
                             list3.add('<TABLE cellSpacing=1 border=1>');
                             list3.add('  <TBODY>');
                          list3.add('<TR>'+
                            '<TD bgColor=#D0C0C0 ColSpan=6 align=middle><FONT face="Arial CYR" size=1><STRONG>�������, �������</STRONG></FONT></TD>'+
                            '<TD bgColor=#D0C0C0 ColSpan=6 align=middle><FONT face="Arial CYR" size=1><STRONG>����� ����</STRONG></FONT></TD>'+
                            '<TD bgColor=#D0C0C0 ColSpan=9 align=middle><FONT face="Arial CYR" size=1><STRONG>��������������</STRONG></FONT></TD>'+
                            '</TR>');

{������������ ��������� ������� }
                             list3.add('  <TR>');
                             list3.add('    <TD bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             list3.add('      size=1><STRONG>���</STRONG></FONT></TD>');
                             list3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             list3.add('      size=1><STRONG>������������ ������</STRONG></FONT></TD>');
                             list3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             list3.add('      size=1><STRONG>���-��:<BR>�����<BR>�� �����<BR>�� �������</STRONG></FONT></TD>');
                             list3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>�������:<BR>�����<br>�� ������<br>� �������</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>�������</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>�����</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>�������<BR> ����. ����</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>����� ����. ����<br>(�������, %)</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ���. ����<br>(�������, %)</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ��.���. ����<br>(�������, %)</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ����. ����<BR>(�������, %)</STRONG></FONT></TD>');
//19-05-2015 -
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ����. ���� 2<BR>(�������, %)</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ���� 7<BR>(�������, %)</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ���� 8<BR>(�������, %)</STRONG></FONT></TD>');

                             List3.add('    <TD align=middle bgColor=#c0c0c0 rowSpan=2><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>���. ���� ��<BR>(�������, %)</STRONG></FONT></TD>');

                             List3.add('    <TD align=middle bgColor=#c0c0c0 ColSpan=4><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>�������</STRONG></FONT></TD>');
                             List3.add('    <TD align=middle bgColor=#c0c0c0 colSpan=5><FONT face="Arial CYR"');
                             List3.add('      size=1><STRONG>��������</STRONG></FONT></TD></TR>');
                             List3.add(' </TR> <TR>');

                              List3.add('<TD align=middle bgColor=#c0c0c0 rowSpan=1><FONT face="Arial CYR"');
                              List3.add('      size=1><STRONG>������� �������:<BR>����<BR>����</STRONG></FONT></TD>');
                              List3.add(' <TD align=middle bgColor=#c0c0c0 rowSpan=1><FONT face="Arial CYR"');
                              List3.add('      size=1><STRONG>������� ���:<BR>����<BR>����</STRONG></FONT></TD>');
                              List3.add(' <TD align=middle bgColor=#c0c0c0 rowSpan=1><FONT face="Arial CYR"');
                              List3.add('      size=1><STRONG>������� ��:<BR>����<BR>����</STRONG></FONT></TD>');
                              List3.add(' <TD align=middle bgColor=#c0c0c0 rowSpan=1><FONT face="Arial CYR"');
                              List3.add('      size=1><STRONG>������� ������:<BR>����<BR>����</STRONG></FONT></TD>');
                              List3.add(' <TD align=middle bgColor=#c0c0c0 rowSpan=1><FONT face="Arial CYR"');
                              List3.add('      size=1><STRONG>����, ����� <BR>�������<BR></STRONG></FONT></TD>');


                              List3.add('    <TD align=middle bgColor=#c0c0c0><FONT');
                              List3.add('    size=2><STRONG>�����<BR>���<BR>����</STRONG></FONT></TD>');
                              List3.add('    <TD align=middle bgColor=#c0c0c0><FONT');
                              List3.add('      size=2><STRONG>�����1</STRONG></FONT></TD>');
                              List3.add('    <TD align=middle bgColor=#c0c0c0><FONT');
                              List3.add('      size=2><STRONG>�����2</STRONG></FONT></TD>');
                              List3.add('    <TD align=middle bgColor=#c0c0c0><FONT');
                              List3.add('      size=2><STRONG>�����3</STRONG></FONT></TD></TR>');



{������������ ������� �������}


                             while not QueryWork2.eof do begin
                               inc(tmpcnt);
                               prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt)+' �������...';
                               delay(1);
                               // ���������� ��������� ���������� ����
                               ADD_SQL(QueryWork4,'select * from last_zak_frm(:tw_id, :frm_id)');
                               QueryWork4.ParamByname('tw_id').asinteger:=QueryWork2.fieldByname('TW_ID').asinteger;
                               QueryWork4.ParamByname('frm_id').asinteger:=gl_FRM_WORK_MODE;
                               QueryWork4.Open;
                               writeln(logfile,datetimetostr(mynow())+' E-mail. �������� ������� �������... ������ '+inttostr(tmpcnt) );
                               // ����������� ������� ������� ��� �������� �� ��������� �����
                               ADD_SQL(QueryWork5,'select * from sred_pribyl(:tw_id,:DT1,:DT2, '+inttostr(GL_FRM_WORK_MODE)+')');
                               QueryWork5.ParamByname('tw_id').asinteger:=QueryWork2.fieldByname('TW_ID').asinteger;

                               TMP_DT2:=date();
                               TMP_DT1:=TMP_DT2-ZAY_MES*30;
                               QueryWork5.ParamByname('DT1').asdatetime:=TMP_DT1;
                               QueryWork5.ParamByname('DT2').asdatetime:=TMP_Dt2;
                               writeln(logfile,datetimetostr(mynow())+' E-mail. ���� '+date_sokr(tmp_dt1)+' '+date_sokr(tmp_dt2) );
                               QueryWork5.Open;
                               writeln(logfile,datetimetostr(mynow())+' E-mail. ������� �������� ������� �������...');
                               if QueryWork4.eof then begin
                                  ZAK:=0;
                               end else begin
                                 if QueryWork.fieldByname('VALUTA_ID').asinteger=0
                                 then ZAK:=QueryWork4.fieldByname('TW_MONEY').asfloat
                                 else ZAK:=QueryWork4.fieldByname('TW_MONEYD').asfloat;
                               end;
                               if ZAK<QueryWork2.fieldByname('MONEY_ZAK').asfloat then begin
                                  SMON:='�';
                                  SCOLOR:='#ff0000'; // �������
                               end else if ZAK>QueryWork2.fieldByname('MONEY_ZAK').asfloat then begin
                                  SMON:='�';
                                  SCOLOR:='#0000FF' // �����
                               end else begin
                                  SMON:='=';
                                  SCOLOR:='#C0C0C0'; // �����
                               end;

                               if QueryWork2.fieldByname('NEW_MONEY1').asfloat>QueryWork2.fieldByname('OLD_MONEY1').asfloat then begin
                                  SMON1:='�';
                                  SCOLOR1:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY1').asfloat<QueryWork2.fieldByname('OLD_MONEY1').asfloat then begin
                                  SMON1:='�';
                                  SCOLOR1:='#0000FF' // �����
                               end else begin
                                  SMON1:='=';
                                  SCOLOR1:='#C0C0C0'; // �����
                               end;

                               if QueryWork2.fieldByname('NEW_MONEY2').asfloat>QueryWork2.fieldByname('OLD_MONEY2').asfloat then begin
                                  SMON2:='�';
                                  SCOLOR2:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY2').asfloat<QueryWork2.fieldByname('OLD_MONEY2').asfloat then begin
                                  SMON2:='�';
                                  SCOLOR2:='#0000FF' // �����
                               end else begin
                                  SMON2:='=';
                                  SCOLOR2:='#C0C0C0'; // �����
                               end;

                               if QueryWork2.fieldByname('NEW_MONEY3').asfloat>QueryWork2.fieldByname('OLD_MONEY3').asfloat then begin
                                  SMON3:='�';
                                  SCOLOR3:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY3').asfloat<QueryWork2.fieldByname('OLD_MONEY3').asfloat then begin
                                  SMON3:='�';
                                  SCOLOR3:='#0000FF' // �����
                               end else begin
                                  SMON3:='=';
                                  SCOLOR3:='#C0C0C0'; // �����
                               end;

///19-05-2015

                               if QueryWork2.fieldByname('NEW_MONEY6').asfloat>QueryWork2.fieldByname('OLD_MONEY6').asfloat then begin
                                  SMON6:='�';
                                  SCOLOR6:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY6').asfloat<QueryWork2.fieldByname('OLD_MONEY6').asfloat then begin
                                  SMON6:='�';
                                  SCOLOR6:='#0000FF' // �����
                               end else begin
                                  SMON6:='=';
                                  SCOLOR6:='#C0C0C0'; // �����
                               end;

                               if QueryWork2.fieldByname('NEW_MONEY7').asfloat>QueryWork2.fieldByname('OLD_MONEY7').asfloat then begin
                                  SMON7:='�';
                                  SCOLOR7:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY7').asfloat<QueryWork2.fieldByname('OLD_MONEY7').asfloat then begin
                                  SMON7:='�';
                                  SCOLOR7:='#0000FF' // �����
                               end else begin
                                  SMON7:='=';
                                  SCOLOR7:='#C0C0C0'; // �����
                               end;

                               if QueryWork2.fieldByname('NEW_MONEY8').asfloat>QueryWork2.fieldByname('OLD_MONEY8').asfloat then begin
                                  SMON8:='�';
                                  SCOLOR8:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MONEY8').asfloat<QueryWork2.fieldByname('OLD_MONEY8').asfloat then begin
                                  SMON8:='�';
                                  SCOLOR8:='#0000FF' // �����
                               end else begin
                                  SMON8:='=';
                                  SCOLOR8:='#C0C0C0'; // �����
                               end;





                               if QueryWork2.fieldByname('NEW_MROZ').asfloat>QueryWork2.fieldByname('TW_MROZ').asfloat then begin
                                  SMON0:='�';
                                  SCOLOR0:='#ff0000'; // �������
                               end else if QueryWork2.fieldByname('NEW_MROZ').asfloat<QueryWork2.fieldByname('TW_MROZ').asfloat then begin
                                  SMON0:='�';
                                  SCOLOR0:='#0000FF' // �����
                               end else begin
                                  SMON0:='=';
                                  SCOLOR0:='#C0C0C0'; // �����
                               end;



                               prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt)+' ��������...';
                               delay(1);
                               // ����������� �������� ������ �� ��������� 3 ������
                               writeln(logfile,datetimetostr(mynow())+' E-mail. ����������� �������� ������...');
                               OPEN_SQL(QueryWork3,'select * from info_speed('+inttostr(QueryWork2.fieldByname('TW_ID').asinteger)+', '+ inttostr(GL_FRM_WORK_MODE)+')');
                               List3.add('  <TR>');
                               List3.add('    <TD><a name="#�������� �������� '+QueryWork2.fieldByname('TW_ART').asstring+'"><FONT face="Arial CYR" size=1>'+QueryWork2.fieldByname('TW_ART').asstring+'</FONT></a></TD>');
                               List3.add('    <TD><a href="#�������� '+QueryWork2.fieldByname('TW_ART').asstring+'"><FONT size=2>'+b_utils.quot(QueryWork2.fieldByname('TW_NAM').asstring)+'</FONT></a></TD>');
                               List3.add('    <TD vAlign=top>');

{����������}
                               if QueryWork2.fieldByname('TW_KOL').asfloat+QueryWork2.fieldByname('OST').asfloat>QueryWork3.fieldByname('SPEED_ALL').asfloat then
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1 color=#ff0000>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2))
                               else
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2));
                               List3.add(QueryWork2.fieldByname('ED_SHORT').asstring);
                               List3.add('<BR>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat*(1-QueryWork3.fieldByname('K').asfloat),fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat*QueryWork3.fieldByname('K').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD>');


{�������}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('OST').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('OST_OPT').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('OST_ROZN').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD>');
{�������}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('MONEY_ZAK').asfloat,fffixed,19,2)+'</FONT><FONT face=Symbol');
                               List3.add('      color='+SCOLOR+' size=1><STRONG>'+SMON+'</STRONG></FONT></P></TD>');
{�����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat*
                               QueryWork2.fieldByname('MONEY_ZAK').asfloat,fffixed,19,2)
                               +'</FONT></P></TD>');


//��������� �������� ������� � ������������� ������
//��������, 05.03.2007
{������� ��������� ����}
                               if QueryWork2.FieldByName('MET_MONEY_SHOP').asinteger=1 then
                                 List3.add('    <TD vAlign=top bgColor=#9FFF9F>')
                               else
                                 List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('TW_MROZ').asfloat,fffixed,19,2)
                               +'</FONT></P></TD>');

{����� ����}

{��������� ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('NEW_MROZ').asfloat,fffixed,19,2)
                               +'<BR><FONT face=Symbol color='+SCOLOR0+' size=1><STRONG>'+SMON0+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('NEW_MROZ').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%'+
                               '<BR>'+floattostrf((QueryWork2.fieldbyname('NEW_MROZ').asfloat-QueryWork2.fieldbyname('NEW_MONEY4').asfloat)/(QueryWork2.fieldbyname('NEW_MONEY4').asfloat/100), fffixed,19,2)+'%'+
                               '<BR>'+floattostrf((QueryWork2.fieldbyname('NEW_MONEY4').asfloat-QueryWork2.fieldbyname('MONEY_ZAK').asfloat)/(QueryWork2.fieldbyname('MONEY_ZAK').asfloat/100), fffixed,19,2)+'%'+
                               '</FONT></P></TD>');

                               if QueryWork2.fieldByname('tw_price_print').asinteger=1 then
                               begin
{������� ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money1').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR1+' size=1><STRONG>'+SMON1+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money1').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');
{��. ������� ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money2').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR2+' size=1><STRONG>'+SMON2+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money2').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');
{����. ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money3').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR3+' size=1><STRONG>'+SMON3+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money3').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');

///19-05-2015
{����. ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money6').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR6+' size=1><STRONG>'+SMON6+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money6').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');

                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money7').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR7+' size=1><STRONG>'+SMON7+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money7').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');

{����. ����}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money8').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR8+' size=1><STRONG>'+SMON8+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money8').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');



{���� �.�.}
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldbyname('new_money4').asfloat,fffixed,19,2)+
                               '<BR><FONT face=Symbol color='+SCOLOR3+' size=1><STRONG>'+SMON3+'</STRONG></FONT>'+floattostrf((QueryWork2.fieldbyname('new_money4').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%');
                               List3.add('</FONT></P></TD>');

                               end
                               else
                               begin
                                 List3.add('    <TD vAlign=top></TD>');
                                 List3.add('    <TD vAlign=top></TD>');
                                 List3.add('    <TD vAlign=top></TD>');
                                 List3.add('    <TD vAlign=top></TD>');
                               end;

{����� �������. �� ������� ��� ������� � ��������� �����. ��� ������� ����� ��� ����� ������ �������}
                               if GL_FRM_WORK_MODE=0 then
                               begin
{������� ������� ����-����}
                               List3.add('<TD></TD>');
{������� ��� ����-����}
                               List3.add('<TD></TD>');
{������� �� ����-����}
                               List3.add('<TD></TD>');
{������� ������ ����-����}
{����� �������. �� ������� ��� ������� � ��������� �����. ��� �������}

                                 if QueryWork5.fieldByname('PROC').asfloat<ZAY_PERCENT_WARNING
                                  then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                 List3.add('    <TD vAlign=top>');
                                 List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+
                                 floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat*
  {����}                         (QueryWork2.fieldByname('NEW_MROZ').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat)


                                 ,fffixed,19,2)


                                 +'<BR>'+floattostrf((

                                 (QueryWork2.fieldByname('NEW_MROZ').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat)
                                 /(QueryWork2.fieldbyname('MONEY_ZAK').asfloat/100)), fffixed,19,2)+'%'+
                                 '</FONT> <FONT face="Arial CYR" '+TMP_STRING+' size=1>'+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PRIBYL').asfloat*QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2)+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PROC').asfloat,fffixed,19,2)+'%'+
                                 '</FONT></P></TD>');
                               end;

{������� ������ ����-����}
{����� �������. ��� ��������� �����}
                               if GL_FRM_WORK_MODE>0 then
                               begin
                                 List3.add('<TD></TD>');

  {������� ��� ����-����}
                                 if QueryWork5.fieldByname('PROC_OPT').asfloat<ZAY_PERCENT_WARNING
                                  then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                 List3.add('    <TD vAlign=top>');
                                 List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf((1-QueryWork3.fieldByname('K').asfloat)*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                 QueryWork2.fieldByname('NEW_MONEY1').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat),fffixed,19,2)+
                                 '<BR>'+floattostrf((QueryWork2.fieldbyname('NEW_MONEY1').asfloat-QueryWork2.fieldbyname('MONEY_ZAK').asfloat)/(QueryWork2.fieldbyname('MONEY_ZAK').asfloat/100), fffixed,19,2)+'%'+
                                 '</FONT> <FONT face="Arial CYR" '+TMP_STRING+' size=1>'+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PRIBYL_OPT').asfloat*(1-QueryWork3.fieldByname('K').asfloat)*QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2)+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PROC_OPT').asfloat,fffixed,19,2)+'%'+
                                 '</FONT></P></TD>');
  {������� �� ����-����}
                                 if QueryWork5.fieldByname('PROC_PP').asfloat<ZAY_PERCENT_WARNING
                                  then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                 List3.add('    <TD vAlign=top>');
                                 List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf((QueryWork3.fieldByname('K').asfloat)*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                 QueryWork2.fieldByname('NEW_MONEY4').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat),fffixed,19,2)+
                                 '<BR>'+floattostrf((QueryWork2.fieldbyname('NEW_MONEY4').asfloat-QueryWork2.fieldbyname('MONEY_ZAK').asfloat)/(QueryWork2.fieldbyname('MONEY_ZAK').asfloat/100), fffixed,19,2)+'%'+
                                 '</FONT> <FONT face="Arial CYR" '+TMP_STRING+' size=1>'+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PRIBYL_PP').asfloat*QueryWork3.fieldByname('K').asfloat*QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2)+
                                 '<BR>'+floattostrf(QueryWork5.fieldByname('PROC_PP').asfloat,fffixed,19,2)+'%'+
                                 '</FONT></P></TD>');

                                   if QueryWork5.fieldByname('PROC').asfloat<ZAY_PERCENT_WARNING
                                    then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   List3.add('    <TD vAlign=top>');
                                   List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+
                                   floattostrf(
    {��}                           QueryWork3.fieldByname('K').asfloat*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MONEY4').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat) +

    {���}                          (1-QueryWork3.fieldByname('K').asfloat)*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MONEY1').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat) +

    {����}                         QueryWork3.fieldByname('K').asfloat*QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MROZ').asfloat-QueryWork2.fieldByname('NEW_MONEY4').asfloat)


                                   ,fffixed,19,2)


                                   +'<BR>'+floattostrf((

                                   (QueryWork3.fieldByname('K').asfloat*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MONEY4').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat) +

    {���}                          (1-QueryWork3.fieldByname('K').asfloat)*0.8474 *QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MONEY1').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat) +

    {����}                         QueryWork3.fieldByname('K').asfloat*QueryWork2.fieldByname('TW_KOL').asfloat*(
                                   QueryWork2.fieldByname('NEW_MROZ').asfloat-QueryWork2.fieldByname('NEW_MONEY4').asfloat))
                                   /QueryWork2.fieldByname('TW_KOL').asfloat/(QueryWork2.fieldbyname('MONEY_ZAK').asfloat/100)), fffixed,19,2)+'%'+
                                   '</FONT> <FONT face="Arial CYR" '+TMP_STRING+' size=1>'+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PRIBYL').asfloat*QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2)+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROC').asfloat,fffixed,19,2)+'%'+
                                   '</FONT></P></TD>');
                               end;


{
                              List3.add('    <TD vAlign=top>');
                               if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                                   if QueryWork5.fieldByname('PROC').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else

                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYL').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROC').asfloat,fffixed,19,2)+'%</FONT></P></TD>')
                               end else begin
                                   if QueryWork5.fieldByname('PROCD').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else
                                   begin
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYLD').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROCD').asfloat,fffixed,19,2)+'%</FONT></P></TD>')

                                   end;
                               end;
}
{������� ��� ����-����}
{                               List3.add('    <TD vAlign=top>');
                               if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                                   if QueryWork5.fieldByname('PROC').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else

                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYL').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROC').asfloat,fffixed,19,2)+'%</FONT></P></TD>')
                               end else begin
                                   if QueryWork5.fieldByname('PROCD').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else
                                   begin
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYLD').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROCD').asfloat,fffixed,19,2)+'%</FONT></P></TD>')

                                   end;
                               end;
}
{������� ������ ����-����}
{
                               List3.add('    <TD vAlign=top>');
                               if QueryWork.fieldByname('VALUTA_ID').asinteger=0 then begin
                                   if QueryWork5.fieldByname('PROC').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else

                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYL').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROC').asfloat,fffixed,19,2)+'%</FONT></P></TD>')
                               end else begin
                                   if QueryWork5.fieldByname('PROCD').asfloat<ZAY_PERCENT_WARNING then TMP_STRING:='color=#ff0000' else TMP_STRING:='';
                                   if QueryWork5.fieldByname('TW_KOL').asfloat=0 then
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>���!</FONT></P></TD>')
                                        else
                                   begin
                                   List3.add('      <P align=right><FONT face="Arial CYR" '+TMP_STRING+' size=1>'+floattostrf(QueryWork5.fieldByname('PRIBYLD').asfloat,fffixed,19,2)+' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                                   '<BR>'+floattostrf(QueryWork5.fieldByname('PROCD').asfloat,fffixed,19,2)+'%</FONT></P></TD>')

                                   end;
                               end;
}
{����������� ������� �� ������� - ������������ ������}
{
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat*(
                               QueryWork2.fieldByname('NEW_MROZ').asfloat-QueryWork2.fieldByname('MONEY_ZAK').asfloat),fffixed,19,2)+
                               ' '+QueryWork2.fieldByname('VALUTA_SHORT').asstring+
                               '<BR>'+floattostrf((QueryWork2.fieldbyname('NEW_MROZ').asfloat-QueryWork2.fieldbyname('money_zak').asfloat)/(QueryWork2.fieldbyname('money_zak').asfloat/100), fffixed,19,2)+'%'+
                               '</FONT></P></TD>');
}


{����}
                               if QueryWork3.fieldByname('SPEED_ALL').asfloat>0 then
                                srok := 91.5 * (QueryWork2.fieldByname('TW_KOL').asfloat+QueryWork2.fieldByname('OST').asfloat)/ QueryWork3.fieldByname('SPEED_ALL').asfloat
                               else
                                srok := 999;

                               List3.add('    <TD vAlign=top>'); // ����
                               List3.add('      <P align=right><FONT face="Arial CYR" size=1>'+inttostr(trunc(srok)));
                               if QueryWork3.fieldByname('SPEED_ALL').asfloat>0 then
                                srok := 91.5 * (QueryWork2.fieldByname('TW_KOL').asfloat)/ QueryWork3.fieldByname('SPEED_ALL').asfloat
                               else
                                srok := 999;
                               List3.add('<BR>'+inttostr(trunc(srok)));


                               List3.add('</FONT></P></TD>');


                               prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt)+' ��������������...';
                               delay(1);
                               writeln(logfile,datetimetostr(mynow())+' E-mail. ����������� ��������������...');
                               writeln(logfile,datetimetostr(mynow())+' E-mail. �������������� ���������');



                               List3.add('    <TD vAlign=top noWrap>');
                               List3.add('      <P align=right><FONT size=2>'+floattostrf(QueryWork3.fieldByname('SPEED_ALL').asfloat,fffixed,19,2)+
                               ' '+QueryWork2.fieldByname('ED_SHORT').asstring);
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_OPT').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_ROZN').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD>');


                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT size=2>'+floattostrf(QueryWork3.fieldByname('SPEED3').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_OPT3').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_ROZN3').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD>');
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT size=2>'+floattostrf(QueryWork3.fieldByname('SPEED2').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_OPT2').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_ROZN2').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD>');
                               List3.add('    <TD vAlign=top>');
                               List3.add('      <P align=right><FONT size=2>'+floattostrf(QueryWork3.fieldByname('SPEED1').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_OPT1').asfloat,fffixed,19,2));
                               List3.add('<BR>'+floattostrf(QueryWork3.fieldByname('SPEED_ROZN1').asfloat,fffixed,19,2));
                               List3.add('</FONT></P></TD></TR>');
                               QueryWork2.next;
                             end;
                             List3.add('</TR></TBODY></TABLE>');


                             // �������� ��������� ���������� �� �������
                             // �����

{
10,04,2007
���������������� ��������� ������ ������� - �� ����������� ��������
}
                             {

                             List3.add('<p>�������������� ���������� � �������:</p>');
                             QueryWork2.first;
                             tmpcnt:=0;
                             while not QueryWork2.eof do begin
                               inc(tmpcnt);
                               List3.add('<table border="1" cellspacing="1">');
                               List3.add('    <tr>');
                               List3.add('        <td bgcolor="#FCC9FA"><a href="#�������� �������� '+QueryWork2.fieldByname('TW_ART').asstring+'"><font');
                               List3.add('        color="#FF0000" size="2"><strong>�����...</strong></font></a></td>');
                               List3.add('        <td colspan="19" bgcolor="#FCC9FA"><a name="#�������� '+QueryWork2.fieldByname('TW_ART').asstring+'"><strong>'+QueryWork2.fieldByname('TW_ART').asstring);
                               List3.add('        </strong><font size="3"><strong>'+b_utils.quot(QueryWork2.fieldByname('TW_NAM').asstring)+'</strong></font></a></td>');
                               List3.add('    </tr>');
                               List3.add('    <tr>');
                               List3.add('        <td align="center" colspan="3" bgcolor="#FCC9FA"><font');
                               List3.add('        size="1" face="Arial CYR"><strong>���������</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>����</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>����</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>���������</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>���-��</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>����</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>����,$</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�����, ���</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�����, $</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�������, ���</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�������, $</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>��</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>��</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>����</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>��� �������</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�������</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�� ����� � ���</strong></font></td>');
                               List3.add('        <td align="center" bgcolor="#FCC9FA"><font size="1"');
                               List3.add('        face="Arial CYR"><strong>�� ����� � $</strong></font></td>');
                               List3.add('    </tr>');
                               // ��������� ���������
                               prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt)+' ������ �������...';
                               ADD_SQL(QueryWork4,'select * from analiz_tw_new2(:TW_ID) order by doc_date desc');
                               QueryWork4.ParamByname('TW_ID').asinteger:=QueryWork2.fieldByname('TW_ID').asinteger;
                               QueryWork4.Open;
                               a_tmp:=0;
                               tmpcnt2:=0;
                               while ((not QueryWork4.eof) and (a_tmp<3)) do begin
                                  // ������������ �������� � ���������
                                  if (QueryWork4.fieldByname('TYP').asinteger=11) and
                                  (QueryWork4.fieldByname('TW_KOL').asinteger>0) then begin
                                     inc(tmpcnt2);
                                     // �������� ���� �������
                                     ADD_SQL(QueryWork6,'select pn$_KURS from pn$ where pn$_id=:pn$_id');
                                     QueryWork6.paramByname('pn$_id').asinteger:=QueryWork4.fieldByname('ID').asinteger; //+++++++++++++++++++++++
                                     QueryWork6.open;

                                     prepare_form.caption:='�������� ������ � '+QueryWork.fieldByname('MAIL_NUM').asstring+' ID='+QueryWork.fieldByname('MAIL_ID').asstring+' ������ '+inttostr(tmpcnt)+' �������� '+inttostr(tmpcnt2);


                                     // ����������� ���-�� �������������� ������
                                       T_OST:=QueryWork4.fieldByname('OST_KOL').asfloat; // ������� � ��������    //++++++++++++++++++++++++++++++++
                                        T_OST_SUMM:=T_OST*(QueryWork4.fieldByname('SEb').asfloat+QueryWork4.fieldByname('NDS').asfloat);  // ������� � ������ //++++++++++++++++++
                                        T_OST_SUMMD:=T_OST*(QueryWork4.fieldByname('SEB$').asfloat+QueryWork4.fieldByname('NDS$').asfloat); // ������� � $ //++++++++++++++++



                                     // ����������� �������
                                        T_REAL_SUMM:=QueryWork4.fieldByname('REAL_SUMM').asfloat; // ������� � ������

                                      if abs(T_REAL_SUMM) < 0.00000001 then
                                      T_REAL_SUMM:=0;

                                     // ����������� �������
                                        T_PRIBYL:=QueryWork4.fieldByname('PRIBYL').asfloat; // ������� �� ��������� � ������
                                        T_PRIBYLD:=QueryWork4.fieldByname('PRIBYLD').asfloat; // ������� �� ��������� � $
                                        T_LAST_REALIZ:=QueryWork4.fieldByname('LAST_REALIZ').asdatetime; //
                                     // ���������� �����:
                                     //++++++++++++++++++++++++++++
                                     T_POST_SUMM:=QueryWork4.fieldByname('TW_KOL').asfloat*(QueryWork4.fieldByname('SEB').asfloat+QueryWork4.fieldByname('NDS').asfloat); // ����� � �������
                                     List3.add('    <tr>');
                                     List3.add('        <td colspan="3"><font size="1" face="Arial CYR">'+b_utils.quot(QueryWork4.fieldByname('DOC_FULL_NUM').asstring)+'</font></td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+b_utils.quot(datetostr(QueryWork4.fieldByname('DOC_DATE').asdatetime))+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+floattostrf(QueryWork6.fieldByname('PN$_KURS').asfloat,fffixed,19,2)+'�/$'+'</font></p>');// ����
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     //+++++++++++++++++++++++
                                     List3.add('        face="Arial CYR">'+b_utils.quot(QueryWork4.fieldByname('POST_FULL').asstring)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     //++++++++++++++++++++++++
                                     List3.add('        face="Arial CYR">'+Floattostrf(QueryWork4.fieldByname('TW_KOL').asfloat,fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+rub_color+'><p align="right"><font size="1"');
                                     //++++++++++++++++++++++++
                                     List3.add('        face="Arial CYR">'+Floattostrf(QueryWork4.fieldByname('SEB').asfloat+QueryWork4.fieldByname('NDS').asfloat,fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+dollar_color+'><p align="right"><font size="1"');
                                     //++++++++++++++++++++++++
                                     List3.add('        face="Arial CYR">'+Floattostrf(QueryWork4.fieldByname('SEB$').asfloat+QueryWork4.fieldByname('NDS$').asfloat,fffixed,19,3)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+rub_color+'><p align="right"'+rub_color+'><font size="1"');
                                     //+++++++++++++++++++++++++
                                     List3.add('        face="Arial CYR">'+Floattostrf(QueryWork4.fieldByname('TW_KOL').asfloat*(QueryWork4.fieldByname('SEB').asfloat+QueryWork4.fieldByname('NDS').asfloat),fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+dollar_color+'><p align="right"'+dollar_color+'><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(QueryWork4.fieldByname('TW_KOL').asfloat*(QueryWork4.fieldByname('SEB$').asfloat+QueryWork4.fieldByname('NDS$').asfloat),fffixed,19,3)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+rub_color+'><p align="right"'+rub_color+'><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(T_PRIBYL,fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+dollar_color+'><p align="right"'+dollar_color+'><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(T_PRIBYLD,fffixed,19,3)+'</font></p>');
                                     List3.add('        </td>');
                                     // ���������� ��������
                                     if T_POST_SUMM=0 then begin
                                        RT:=0;
                                        OT:=0;
                                     end else begin
                                        RT:=(T_PRIBYL/T_POST_SUMM)*100;
                                        OT:=(T_REAL_SUMM/T_POST_SUMM)*100;
                                     end;
                                     if OT=0 then SROKT:=999 else begin
                                        IF T_LAST_REALIZ<encodedate(1950,1,1) then SROKT:=999 //+++++++++++++++++++++
                                        else SROKT:=((T_LAST_REALIZ-QueryWork4.fieldByname('DOC_DATE').asdatetime)*100)/OT;
                                     end;
                                     // ��������������
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+floattostrf(RT,fffixed,19,2)+'%</font></p>');
                                     List3.add('        </td>');
                                     // �������������
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+floattostrf(OT,fffixed,19,2)+'%</font></p>');
                                     List3.add('        </td>');
                                     // ���������������
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+inttostr(trunc(SROKT))+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     //++++++++++++++++
                                     List3.add('        face="Arial CYR">'+b_utils.quot(QueryWork4.fieldByname('VID_NAM').asstring)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"><p align="right"><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(T_OST,fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+rub_color+'><p align="right"'+rub_color+'><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(T_OST_SUMM,fffixed,19,2)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('        <td valign="top"'+dollar_color+'><p align="right"'+dollar_color+'><font size="1"');
                                     List3.add('        face="Arial CYR">'+Floattostrf(T_OST_SUMMD,fffixed,19,3)+'</font></p>');
                                     List3.add('        </td>');
                                     List3.add('    </tr>');
                                  end;
                                  QueryWork4.next;
                                  inc(a_tmp);
                               end;
                               QueryWork2.next;
                               List3.add('</table>');

                             end;
                             }

                          end;
                          // ���������� ��������
                          // ����� ��������� ��� ������
                          // ���� - �� ������, ���������� � �������� ��� �����������
                          // ������ - ���������, ����������� ������
                          // ��������� ������ ������

                          SakMsg1.Subject := ZAY_SUBJECT;
                          SakMsg1.MessageType:=MtHtml;
                          SakMsg1.Text.Clear;
                          SakMsg1.Text.add(list1.text);
                          SakMsg1.Text.add(list2.text);
                          SakMsg1.Text.add(list3.text);
                          SakMsg1.AttachedFiles.Clear;
                          SakMsg1.AttachedFiles.add('Bsklad_HTML_Pic1.jpg');
                          SakMsg1.AttachedFiles.add('Bsklad_HTML_OK.gif');
                          SakMsg1.AttachedFiles.add('Bsklad_HTML_NOOK.gif');
                          SakMsg1.AttachedFiles.add('Bsklad_HTML_MAIL.gif');
                          SakMsg1.CharSet := 'windows-1251';
                          SakMsg1.TextEncoding := te8Bit;
                          SakMsg1.UserName :=TITLE_EMAIL;
                          SakMsg1.From := HOME_EMAIL;
                          SakMsg1.SendTo := UTW_EMAIL;
                          SakSMTP1.host := EMAIL_HOST;
                          writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� � �������� �������� '+EMAIL_HOST);
                          SakSMTP1.connect;
                          writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� � �������� �������� �����������' );
                          if not SakSMTP1.SMTPError then begin
                             SakSMTP1.SendTheMessage( SakMsg1);
                             SakMsg1.ParseMsg;
                             writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� ������ � '+
                             QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                             date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                             ' �� �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+
                             ' '+QueryWork.fieldByname('VALUTA_SHORT').asstring+' �����������: '+
                             QueryWork.fieldByname('US_FULL').asstring+', E-mail: '+
                             SakMsg1.From+' �� ����: '+EMAIL_HOST);
                             // ���������� ������ ���������
                             SakSMTP1.Disconnect;
                             SakSMTP1.connect;
                             SakMsg1.ParseMsg;
                             SakMsg1.Subject := ZAY_SUBJECT;
                             SakMsg1.MessageType:=MtHtml;
                             SakMsg1.Text.Clear;
                             SakMsg1.Text.add(list1.text);
                             SakMsg1.Text.add(list3.text);
                             SakMsg1.AttachedFiles.Clear;
                             SakMsg1.AttachedFiles.add('Bsklad_HTML_Pic1.jpg');
                             SakMsg1.CharSet := 'windows-1251';
                             SakMsg1.TextEncoding := te8Bit;
                             SakMsg1.UserName :=TITLE_EMAIL;
                             SakMsg1.From := HOME_EMAIL;
                             SakMsg1.SendTo := QueryWork.fieldByname('US_EMAIL').asstring;
                             SakSMTP1.host := EMAIL_HOST;
                             SakSMTP1.SendTheMessage( SakMsg1);
                             writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� ������ ��������� � '+
                             QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                             date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                             ' �� �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+
                             ' '+QueryWork.fieldByname('VALUTA_SHORT').asstring+' �����������: '+
                             QueryWork.fieldByname('US_FULL').asstring+', E-mail: '+
                             SakMsg1.From+' �� ����: '+EMAIL_HOST);
                             // ��������� ���� �������� ������ �� �-����
                             Datamodule1.IBTransaction2.Active:=False;
                             Datamodule1.IBTransaction2.StartTransaction;
                             S_SUBSOST:=QueryWork.fieldByname('MAIL_SUBSOST').asstring+space(10);
                             for a_tmp:=1 to 10 do if S_SUBSOST[a_tmp]=' ' then S_SUBSOST[a_tmp]:='0';
                             S_SUBSOST[1]:='1';
                             try


                                IBSAVE_CLEAR;
                                IBSAVE_ADD('MAIL_SUBSOST',b_utils.left(S_SUBSOST,10));
                                if IBSAVE_DOC('MAIL',QueryWork.fieldByname('MAIL_ID').asinteger)<0 then r:=sqrt(-1);
                                Datamodule1.IBTransaction2.Commit;
                                
                             Except
                                on e: Exception do
                                begin
                                 Datamodule1.IBTransaction2.Rollback;
                                 writeln(logfile,datetimetostr(mynow())+' !!!!! E-mail. ������ ��� �������� �������� ������ � '+
                                 QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                                 date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                                 ' �� �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+
                                 QueryWork.fieldByname('VALUTA_SHORT').asstring+' �����������: '+
                                 QueryWork.fieldByname('US_FULL').asstring+', E-mail: '+
                                 SakMsg1.From+'## '+e.message);
                                end;
                             End;
                             Datamodule1.IBTransaction2.Active:=False;
                             // ��������� ������������ ������ � ���� �����
                             try
                             assignfile(HTMLFILE,ExtractFilePath(Application.EXEName)+PathForHtmlZay+inttostr(QueryWork.fieldByname('MAIL_ID').asinteger)+'.htm');
                             rewrite(HTMLFILE);
                             writeln(HTMLFILE,list1.text);
                             writeln(HTMLFILE,list3.text);
                             closefile(HTMLFILE);
                             Except
                             end;
                          end else begin
                            inc(Cnt_err);
                            writeln(logfile,datetimetostr(mynow())+' !!!!! E-mail. ������ �1 ��� �������� ������ � '+
                            QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                            date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                            ' �� �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+
                            QueryWork.fieldByname('VALUTA_SHORT').asstring+' �����������: '+
                            QueryWork.fieldByname('US_FULL').asstring+', E-mail: '+
                            SakMsg1.From);
                          end;
                          SakMsg1.ParseMsg;
                          SakSMTP1.Disconnect;
                       except
                          on E: Exception do
                          begin
                          inc(Cnt_err);
                          writeln(logfile,datetimetostr(mynow())+' !!!!! E-mail. ������ �2 ��� �������� ������ � '+
                          QueryWork.fieldByname('MAIL_NUM').asstring+' �� '+
                          date_sokr(QueryWork.fieldByname('CREATE_DATE').asdatetime)+
                          ' �� �����: '+floattostrf(QueryWork.fieldByname('SUMM').asfloat,fffixed,19,2)+
                          QueryWork.fieldByname('VALUTA_SHORT').asstring+' �����������: '+
                          QueryWork.fieldByname('US_FULL').asstring+', E-mail: '+
                          QueryWork.fieldByname('US_EMAIL').asstring+'## '+e.message);
                          end;
                       end;
                    end;
                    QueryWork.next;
                  end;
                end;
            end;
         end;
         // ������� �������� - ��������� ���� ���������� ��������
         if cnt_ERR=0 then begin
           // �������� ����������� ������!
           if REPORT_TXT<>'' then begin
              REPORT_TXT:=trim(REPORT_TXT);
              SakSMTP1.host := EMAIL_HOST;
              writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� � �������� �������� '+EMAIL_HOST);
              SakSMTP1.connect;
              writeln(logfile,datetimetostr(mynow())+' E-mail. ���������� � �������� �������� �����������' );
              if not SakSMTP1.SMTPError then begin
                 SakMsg1.ParseMsg;
                 SakMsg1.AttachedFiles.Clear;
                 SakMsg1.AttachedFiles.add('Bsklad_HTML_Pic1.jpg');
                 SakMsg1.CharSet := 'windows-1251';
                 SakMsg1.TextEncoding := te8Bit;
                 SakMsg1.UserName :=TITLE_EMAIL;
                 SakMsg1.From := HOME_EMAIL;
                 SakMsg1.SendTo := UTW_EMAIL;
                 SakMsg1.MessageType:=MtHtml;
                 SakMsg1.Text.Clear;
                 SakMsg1.Text.add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
                 SakMsg1.Text.add('<HTML><HEAD><TITLE></TITLE>');
                 SakMsg1.Text.add('<META http-equiv=Content-Type content="text/html; charset=windows-1251">');
                 SakMsg1.Text.add('<META content="MSHTML 5.50.4522.1800" name=GENERATOR></HEAD>');
                 SakMsg1.Text.add('<body background="Bsklad_Html_Pic1.jpg" bgcolor="#FFFFFF">');
                 SakMsg1.Text.add('<FONT face=Arial');
                 SakMsg1.Text.add('size=2>&nbsp;</FONT>');
                 SakMsg1.Text.add('�������� ���������� ����� '+date_sokr(date())+' '+timetostr(time())+
                 ' ���������� ������: '+b_utils.left(REPORT_TXT,length(REPORT_TXT)-1)+'.');
                 SakMsg1.Subject := datetostr(date())+' ����������� ������ �� �������������� �������� ������.';;
                 SakSMTP1.SendTheMessage( SakMsg1);
                 SakMsg1.ParseMsg;
                 SakSMTP1.Disconnect;
              end;
           end;
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           IBSAVE_clear;
           IBSAVE_ADD('CFG_NAME','LAST_EMAIL_EXPORT');
           IBSAVE_ADD('DATE_VALUE',dt2);
           if IBSAVE_DOC('CFG',LAST_EMAIL_EXPORT_DT_ID)>0 then begin
                Datamodule1.IBTransaction2.commit;
                writeln(logfile,datetimetostr(mynow())+' E-mail. ������� E-mail ��������� ��������. ���� ���������� �������� ����������� �� '+datetimetostr(DT2)+' !');;
           end else begin
              Datamodule1.IBTransaction2.Rollback;
              Datamodule1.IBTransaction2.Active:=False;
           end;
           Datamodule1.IBTransaction2.Active:=False;
           {�������� ����� ������.htm}

           CreateZayFile;



         end else begin
                writeln(logfile,datetimetostr(mynow())+' E-mail. ������� E-mail ��������� �������� ��������!');;
         end;
       end;
     except
         try
           writeln(logfile,datetimetostr(mynow())+' E-mail. ������ ��� �������� E-mail ���������!');;
         except
         end;
     end;
     try
       closefile(logfile);
     Except
     End;
     timer3.enabled:=true;
   end;
   if IsPnOst then begin
     timer3.enabled:=False;
     timer1.Enabled:=False;
     Application.createForm(TCALC_PNOST,CALC_PNOST);
     CALC_PNOST.showmodal;
     CALC_PNOST.destroy;
     timer3.enabled:=true;
   end;
   if (not IsPnOst) and
      (not IsEmailExport) and (not isRefreshRe) then begin
     timer3.enabled:=False;
     timer1.enabled:=False;
     Prepare_form.Password.text:=':lkj3bn5����';
     tag:=0;
     COMPUTERNAME:=SystemComputerName;
     label2.Visible:=True;
     label3.Visible:=True;
     Button1.Visible:=True;
     Button2.Visible:=True;
     KLN.visible:=True;
     Password.visible:=TRUE;
     LoadUsers;
     Label1.Caption:='�� ������!';
     KLN.setfocus;
   end;
   List1.Destroy;
   List2.Destroy;
   List3.Destroy;
end;

Procedure TPrepare_form.LoadUsers;
begin
    Prepare_FORm.QrUsers.close;
    try
    Prepare_FORm.PrepareTransaction.active :=false;
    except
    end;
    Prepare_FORm.QrUsers.open;
    // ��������� �� ���������� ������������
    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select cfg_set1 from cfg where cfg_name="LAST_USER_COMP" '+
    ' and CFG_VALUE="'+ComputerName+'" and tm=( '+
    ' select max(cfg2.tm) from cfg cfg2 where cfg2.cfg_name="LAST_USER_COMP" '+
    'and cfg2.CFG_VALUE="'+ComputerName+'")');
    QueryWork.Open;
    if QueryWork.eof then KLN.value:=Prepare_FORm.QrUsers.fieldByname('KLN_ID').asstring
    else KLN.value:=QueryWork.fieldbyname('CFG_SET1').asstring;
    QueryWork.Close;
    WorkTransaction.Commit;
end;

procedure TPrepare_form.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       Button1.click;
     end;
     if key=#27 then Button2.click;
end;

procedure TPrepare_form.Timer3Timer(Sender: TObject);
begin
     timer3.enabled:=false;
     close;
end;

procedure TPrepare_form.FormShow(Sender: TObject);
begin
  try
  image1.Picture.LoadFromFile('bsklad.bmp');
  except
  end;

    Prepare_form.caption:='��� �����. '+BASE_NAME_GLOBAL;
    Prepare_form.Password.text:=':lkj3bn5����';
    Delay(10);
end;

end.
