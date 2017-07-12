unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ToolEdit,b_utils,Data1, Db, IBCustomDataSet,
  IBQuery, IBDatabase, ComCtrls,vclutils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MainPath: TEdit;
    BtnBase: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    TmpPath: TDirectoryEdit;
    BtnClose: TButton;
    BtnRun: TButton;
    Label4: TLabel;
    DT: TDateEdit;
    Label5: TLabel;
    Memo1: TMemo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    StatusBar1: TStatusBar;
    QueryWork3: TIBQuery;
    WorkTransaction2: TIBTransaction;
    QueryWork4: TIBQuery;
    WorkTransaction3: TIBTransaction;
    QueryWork5: TIBQuery;
    BtnStop: TButton;
    BtnRun2: TButton;
    BtnRun3: TButton;
    procedure BtnBaseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure BtnRun2Click(Sender: TObject);
    procedure BtnRun3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
    per=record
      per_id:integer;
      sklfrom:integer;
      sklto:integer;
    end;
    ost=record
      tw_id:integer;
      skl_id:integer;
      ost:real;
    end;

var
  CAN:boolean;
  Form1: TForm1;
  cntost:integer;
  cntskl,cntper:integer;
  arrskl:array[1..100] of integer;
  arrost:array[1..50000] of ost;
  arrper:array[1..500] of per;
  arrost2,arrost3:array[1..100] of double;
  tw_id,tw_id2,skl_id:integer;
  ost2:real;
  DELTA,DELTASAVE:double;

Procedure MemoAdd(s:string);

implementation

{$R *.DFM}



Procedure MemoAdd(s:string);
var
   s1:string;
   hh,mm,ss,s100:word;
begin
     decodetime(time(),hh,mm,ss,s100);
     s1:=b_utils.right('00'+inttostr(hh),2)+':'+
     b_utils.right('00'+inttostr(mm),2)+':'+
     b_utils.right('00'+inttostr(ss),2)+'.'+
     b_utils.right('000'+inttostr(s100),3)+' ';
     Form1.Memo1.lines.add(s1+s);
end;

procedure TForm1.BtnBaseClick(Sender: TObject);
begin
   OpenDialog1.FileName:=MainPath.Text;
   if OpenDialog1.Execute() then begin
    MainPath.Text:=OpenDialog1.FileName;
   end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//    MainPath.Text:='';
    DT.date:=encodedate(2015,1,1);
end;

procedure TForm1.BtnRunClick(Sender: TObject);
var
   t:textfile;
   a,b,c,d,e,f,g,rn_id,spis_id:integer;
   tmnow:tdatetime;
   PP_TYP,PP_ID,PP_IDS:integer;
   CALC_KOL:real;
   KOEFF_NAKL:real;
   NEW_KOL,NEW_SUMM,NEW_NDS,SUM1,SUM2:real;
   nakl:integer;
   OST1,OST2:double;
begin
   rn_id:=-1;
   tmnow:=mynow();
   delay(1000);
   BtnRun.enabled:=False;
   BtnRun2.enabled:=False;
   BtnRun3.enabled:=False;
   BtnClose.enabled:=False;
   TmpPath.enabled:=False;
   BtnBase.enabled:=False;
   DT.enabled:=False;
   // �������� ������.
   MemoAdd('��������...');
   DataModule1.IBDatabase1.DatabaseName:=trim(MainPath.Text);
   MemoAdd('������������ � ���� ������...');
   Try
      DataModule1.IBDatabase1.Connected:=True;
      MemoAdd('������������.');
      MemoAdd('������ ������� ��������...');
      Worktransaction.Active:=False;
      OPEN_SQL(QueryWork,'select sum(tw_kol) as ost,tw_id,skl_id '+
      'from reg group by tw_id,skl_id having sum(tw_kol)<-0.00001 or sum(tw_kol)>0.00001 '+
      'order by tw_id,skl_id');
      MemoAdd('���������� ������� �������� � '+tmpPath.Text+'ost.txt');
      assignfile(t,tmpPath.Text+'ost.txt');
      rewrite(t);
      while not QueryWork.eof do begin
         writeln(t,QueryWork.fieldbyname('tw_id').asinteger,#9,
         QueryWork.fieldbyname('skl_id').asinteger,#9,
         QueryWork.fieldbyname('ost').asfloat:15:4);
         QueryWork.next;
      end;
      QueryWork.close;
      closefile(t);

      Worktransaction.Active:=False;
      ADD_SQL(QueryWork,'select pn$_id, '+
      '(select sum(tw_summ) from pns$ where pns$.pn$_id=pn$.pn$_id) as sum1, '+
      '(select sum(pns2$_summ) from pns2$ where pns2$.pn$_id=pn$.pn$_id) as sum2 '+
      'from pn$ where pn$_date<:dt order by pn$_id desc');
      QueryWork.paramByname('dt').asdatetime:=dt.date;
      QueryWork.open;
      MemoAdd('���������� ���� ������� � '+tmpPath.Text+'pn$.txt');
      assignfile(t,tmpPath.Text+'pn$.txt');
      rewrite(t);
      while not QueryWork.eof do begin
         writeln(t,QueryWork.fieldbyname('pn$_id').asinteger,#9,
         QueryWork.fieldbyname('sum1').asfloat:15:4,#9,
         QueryWork.fieldbyname('sum2').asfloat:15:4);
         QueryWork.next;
      end;
      QueryWork.close;
      closefile(t);
      MemoAdd('������� ����������� ������� (GARANT)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from GARANT where garant_dt<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� �������� ������� (KKM,KKMS) ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from KKM where KKM_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ������ (KURS)...');
      // ������� ����� ��������������� �����
      OPEN_SQL(QueryWork,'select * from kurs where kurs_typ=0 and valuta_id=0 order by tm desc');
      a:=0;
      while not QueryWork.eof do begin
        inc(a);
        if (a>1) and (QueryWork.fieldByname('tm').asdatetime<dt.date) then begin
           // ������� ����
           DataModule1.IBTransaction2.Active:=False;
           DataModule1.IBTransaction2.StartTransaction;
           IBDELETE_DOC('KURS',QueryWork.fieldbyname('kurs_id').asinteger);
           DataModule1.IBTransaction2.Commit;
           DataModule1.IBTransaction2.Active:=False;
        end;
        QueryWork.next;
      end;


      MemoAdd('������� ��������� ����������� ����� (MAIL,MAILS,MAILSS,MAILDOST,MAILREAD)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from MAIL where CREATE_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������������� ������ (MARKET)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from MARKET where MARKET_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������ � �������� ������� (PERIOD)...');
      // ������� ���� �������� �������
      OPEN_SQL(QueryWork2,'select * from usgroup');
      while not QueryWork2.eof do begin
            ADD_SQL(QueryWork,'select * from period where usgroup_id=:usgroup_id  order by period_change desc');
            QueryWork.paramByname('usgroup_id').asinteger:=QueryWork2.fieldByname('usgroup_id').asinteger;
            QueryWork.open;
            a:=0;
            while not QueryWork.eof do begin
                  inc(a);
                  if (a>1) then begin
                     // ������� ����
                     DataModule1.IBTransaction2.Active:=False;
                     DataModule1.IBTransaction2.StartTransaction;
                     IBDELETE_DOC('PERIOD',QueryWork.fieldbyname('period_id').asinteger);
                     DataModule1.IBTransaction2.Commit;
                     DataModule1.IBTransaction2.Active:=False;
                  end;
                  QueryWork.next;
            end;
            QueryWork2.next;
      end;
      MemoAdd('������� ����� ���������� (REMON)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from REMON where REMON_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������������ (SERT)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from SERT where SERT_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������ (ST)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from ST where ST_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������ �� ���������� (ZREMON)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from ZREMON where ZREMON_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;

      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ��������� ������ (TMPAN, TMPKORR, TMPPOST, TMPPOST2)...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from TMPAN');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ��������� ������ (TMPKORR...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from TMPKORR');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('TMPPOST...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from TMPPOST');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('TMPPOST2...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from TMPPOST2');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ARCUPDATE ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from ARCUPDATE');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ARCDEL ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from arcdel where tm<:tm');
      QueryWork.paramByname('tm').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from ARCDEL where tm>:tm');
      QueryWork.paramByname('tm').asdatetime:=tmnow;
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� DEL ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from DEL');
      try
         QueryWork.ExecSQL;
      except
      end;
  {

      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ����������� ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from PER where PER_DATE<:dt');
      QueryWork.paramByname('DT').asdatetime:=dt.date;
      try
         QueryWork.ExecSQL;
      except
      end;
   }

      Worktransaction.Commit; Worktransaction.Active:=False;


      DataModule1.IBDatabase1.Connected:=False;
      MemoAdd('�����������.');
      MemoAdd('������!');
   Except
         MemoAdd('�� ������� ������������ � ���� ������!');
   End;
   BtnClose.enabled:=True;
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
    close;
end;

procedure TForm1.BtnStopClick(Sender: TObject);
begin
    CAN:=False;
    BtnStop.enabled:=False;
end;

procedure TForm1.BtnRun2Click(Sender: TObject);
type
  tPR=record
    pp_typ:byte; // ��� �������: 11 - ������, 12- ������ �������
    pp_id:integer;  // ���������
    pp_kol1:double; // ���-�� � ���������
    pp_kol2:double; // ���-�� �������������
  end;
  tRN=record
    typ:byte; // ��� ������� 1 - ������, 2- ��������, 4 - ������ �������
    id:integer;  // ���������
    kol1:double; // ���-�� � ���������
    kol2:double; // ���-�� �������������
  end;
  tRE=record
    typ:byte; // ��������� �� ������
    pp_typ:byte; // ��������� �� ������
    calc_kol:double; // ���-��
    id:integer;  // ��� �������
    pp_id:integer; // ��� �������
  end;
var
  all,cnt:integer;
  a,b,c,d,e:integer;
  cntRN,cntPR,cntRE:integer;
  arrRN:array[1..20000] of tRN;
  arrPR:array[1..1000] of tPR;
  arrRE:array[1..20000] of tRE;
  s:string;
  dd,mm,yy:word;
  r1,r2,r3:double;
  cntDelP,cntDelR,cntUpdP,cntUpdR:integer;
  met:integer;
begin
   CAN:=TRUE;
   BtnRun.enabled:=False;
   BtnRun2.enabled:=False;
   BtnRun3.enabled:=False;
   BtnClose.enabled:=False;
   TmpPath.enabled:=False;
   BtnBase.enabled:=False;
   DT.enabled:=False;
   // �������� ������.
   MemoAdd('�������� ��� 2');
   DataModule1.IBDatabase1.DatabaseName:=trim(MainPath.Text);
   MemoAdd('������������ � ���� ������...');
   decodedate(dt.date,yy,mm,dd);
   s:='"'+b_utils.right('00'+inttostr(mm),2)+'/'+
   b_utils.right('00'+inttostr(dd),2)+'/'+
   b_utils.right('0000'+inttostr(yy),4)+'"';
   Try
      DataModule1.IBDatabase1.Connected:=True;
      MemoAdd('������������.');
      WorkTransaction3.Active:=FALSE;
      OPEN_SQL(QueryWork5,'select sum(tw_kol) as c from reg');
      MemoAdd(' ���� '+floattostrf(QueryWork5.fieldByname('c').asfloat,fffixed,19,4));
      // ����� ����� ��������� ����� ��������� �������� �� ��������� ���������
      MemoAdd('������ ���-�� ���������');
      Worktransaction.Active:=False;
      ADD_SQL(QueryWork,'select count(*) as c from tw where tw_id in ( '+
       ' select distinct tw_id from re where pp_dt<:DT) ');
      QueryWork.parambyname('dt').asdatetime:=dt.date;
      QueryWork.open;
      if QueryWork.eof then all:=0 else all:=QueryWork.fieldByname('c').asinteger;
      MemoAdd('������ ���������');
      ADD_SQL(QueryWork,'select tw_id,tw_art,tw_brak from tw where tw_id in ( '+
       ' select distinct tw_id from re where pp_dt<:dt) '+
        'order by tw_art');
      QueryWork.parambyname('dt').asdatetime:=dt.date;
      QueryWork.open;
      cnt:=0;
      while not QueryWork.eof and CAN do begin
        inc(cnt);
        WorkTransaction2.Active:=False;
        cntPR:=0; cntRN:=0; cntRE:=0;
        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ��������� �������...';
        delay(1);
        ADD_SQL(QueryWork3,'select pns$_id,tw_kol,wozw_id '+
        'from pn$,pns$ where not pn$_prow=0 and tw_id=:tw_id and pn$.pn$_id=pns$.pn$_id '+
        'and (select n from sign( '+s+' - pn$.pn$_date))=1 ');
        QueryWork3.paramByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
        QueryWork3.open;
        while not QueryWork3.eof do begin
          if QueryWork3.fieldByname('wozw_id').asinteger=0 then begin
            // ������
            inc(cntPR);
            arrPR[cntPR].pp_typ:=11;
            arrPR[cntPR].pp_id:=QueryWork3.fieldByname('pns$_id').asinteger;
            arrPR[cntPR].pp_kol1:=QueryWork3.fieldByname('tw_kol').asfloat;
            arrPR[cntPR].pp_kol2:=0;
          end else begin
            // ������ �������
            inc(cntRN);
            arrRN[cntRN].typ:=4;
            arrRN[cntRN].id:=QueryWork3.fieldByname('pns$_id').asinteger;
            arrRN[cntRN].kol1:=-QueryWork3.fieldByname('tw_kol').asfloat;
            arrRN[cntRN].kol2:=0;
          end;
          QueryWork3.next;
        end;

        // ��������� �������
        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ��������� �������...';
        delay(1);
        ADD_SQL(QueryWork3,'select rns_id,tw_kol,wozw_id '+
        'from rn,rns where not rn_prow=0 and tw_id=:tw_id and rn.rn_id=rns.rn_id '+
        'and (select n from sign( '+s+' -rn.rn_date))=1');
        QueryWork3.paramByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
        QueryWork3.open;
        while not QueryWork3.eof do begin
          if QueryWork3.fieldByname('wozw_id').asinteger=0 then begin
            // ������
            inc(cntRN);
            arrRN[cntRN].typ:=1;
            arrRN[cntRN].id:=QueryWork3.fieldByname('rns_id').asinteger;
            arrRN[cntRN].kol1:=QueryWork3.fieldByname('tw_kol').asfloat;
            arrRN[cntRN].kol2:=0;
          end else begin
            // ������ �������
            inc(cntPR);
            arrPR[cntPR].pp_typ:=12;
            arrPR[cntPR].pp_id:=QueryWork3.fieldByname('rns_id').asinteger;
            arrPR[cntPR].pp_kol1:=-QueryWork3.fieldByname('tw_kol').asfloat;
            arrPR[cntPR].pp_kol2:=0;
          end;
          QueryWork3.next;
        end;

        // ��������� ��������
        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ��������� ��������...';
        delay(1);
        ADD_SQL(QueryWork3,'select spiss_id,tw_kol '+
        'from spis,spiss where not spis_prow=0 '+
        'and tw_id=:tw_id and spis.spis_id=spiss.spis_id '+
        'and (select n from sign( '+s+' - spis.spis_date))=1 ');
        QueryWork3.paramByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
        QueryWork3.open;
        while not QueryWork3.eof do begin
            // ������
            inc(cntRN);
            arrRN[cntRN].typ:=2;
            arrRN[cntRN].id:=QueryWork3.fieldByname('spiss_id').asinteger;
            arrRN[cntRN].kol1:=QueryWork3.fieldByname('tw_kol').asfloat;
            arrRN[cntRN].kol2:=0;
            QueryWork3.next;
        end;

        // ��������� ������
        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ��������� ������...';
        delay(1);
        ADD_SQL(QueryWork3,'select pp_typ,pp_ids,typ,ids,calc_kol '+
        'from re where tw_id=:tw_id and not pp_typ=13 and '+
        '(select n from sign( '+s+' - re.dt))=1 '+
        'and (select n from sign( '+s+' - re.pp_dt))=1 ');
        QueryWork3.paramByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
        QueryWork3.open;
        while not QueryWork3.eof do begin
          if QueryWork3.fieldByname('calc_kol').asfloat>0 then begin
            // ������
            inc(cntRE);
            arrRE[cntRE].typ:=QueryWork3.fieldByname('typ').asinteger;
            arrRE[cntRE].id:=QueryWork3.fieldByname('ids').asinteger;
            arrRE[cntRE].pp_typ:=QueryWork3.fieldByname('pp_typ').asinteger;
            arrRE[cntRE].pp_id:=QueryWork3.fieldByname('pp_ids').asinteger;
            arrRE[cntRE].calc_kol:=QueryWork3.fieldByname('calc_kol').asfloat;
          end;
          QueryWork3.next;
        end;
        // ����� 1
        for a:=1 to cntRE do begin
            statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ������. '+inttostr(a)+' �� '+inttostr(cntRE);
            delay(1);
            if ((arrRE[a].typ=2) or (arrRE[a].typ=4) or (arrRE[a].typ=1)) then begin // �������� � ������ �������
               // ������� � ������� ��������
               c:=0;
               while c<cntPR do begin
                 inc(c);
                 if ((arrRE[a].pp_typ=arrPR[c].pp_typ) and (arrRE[a].pp_id=arrPR[c].pp_id)) then begin
                   // ������ ����� - ���� ������
                   b:=0;
                   while b<cntRN do begin
                      inc(b);
                      if ((arrRE[a].id=arrRN[b].id) and (arrRN[b].typ=arrRE[a].typ)) then begin
                        // ������ ����� - ������� ��������� ������
                        arrRN[b].kol2:=arrRN[b].kol2+arrRE[a].calc_kol;
                        // ������� ��������� ������
                        arrPR[c].pp_kol2:=arrPR[c].pp_kol2+arrRE[a].calc_kol;
                        b:=cntRN+1;
                      end
                   end;
                   c:=cntPR+1;
                 end;
               end;
            end;
        end;


        met:=1;

        while met=1 do begin
        met:=0;
        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ����� ������ ...';
        delay(1);
        // ���������� �� ��������� ������  �������
        for a:=1 to cntPR do if ((arrPR[a].pp_typ=12) and (abs(arrPR[a].pp_kol1-arrPR[a].pp_kol2)>0.0001) and (arrPR[a].pp_kol2>0)) then begin
            // ������� ������
            for b:=1 to cntRE do if ((arrRE[b].pp_typ=12) and (arrRE[b].pp_id=arrPR[a].pp_id)) then begin
               // ������� ������
               e:=0;
               for d:=1 to cntRN do if ((arrRE[b].typ=arrRN[d].typ) and (arrRE[b].id=arrRN[d].id)) then begin
                  // ��������
                  inc(e);
                  arrRN[d].kol2:=arrRN[d].kol2-arrRE[b].calc_kol;
                  arrPR[a].pp_kol2:=arrPR[a].pp_kol2-arrRE[b].calc_kol;
                  met:=1;
               end;
            end;
            arrPR[a].pp_kol2:=0;
        end;

        statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ����� ��������...';
        delay(1);
        // ���������� �� ��������� �������
        for a:=1 to cntRN do if ((abs(arrRN[a].kol1-arrRN[a].kol2)>0.0001) and (arrRN[a].kol2>0)) then begin
            // �� ��������� ������� ����� "��������"
            for b:=1 to cntRE do if ((arrRE[b].typ=arrRN[a].typ) and (arrRE[b].id=arrRN[a].id)) then begin
               // ����� ������ - ���� ������ �� ������������ �������
               for d:=1 to cntPR do if ((arrRE[b].pp_typ=arrPR[d].pp_typ) and (arrRE[b].pp_id=arrPR[d].pp_id)) then begin
                  // �������� ���-�� � �������� � ��������
                  arrRN[a].kol2:=arrRN[a].kol2-arrRE[b].calc_kol;
                  arrPR[d].pp_kol2:=arrPR[d].pp_kol2-arrRE[b].calc_kol;
                  met:=1;
               end;
            end;
            arrRN[a].kol2:=0;
        end;
        end;

        // ���������, ������� ������ � ������� � �������
        r1:=0;
        for a:=1 to cntPR do r1:=r1+arrPR[a].pp_kol2;
        r2:=0;
        for a:=1 to cntRN do r2:=r2+arrRN[a].kol2;
        // �������, ����� ������� �� ������
        c:=0;
        // �������

        cntDelP:=0;
        cntDelR:=0;
        cntUpdP:=0;

        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;

       for a:=1 to cntRN do begin
          statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ������� ������� '+inttostr(a)+' �� '+inttostr(cntRN);
          delay(1);
          if ((abs(arrRN[a].kol1-arrRN[a].kol2)<0.0001) and (arrRN[a].kol2>0.00009)) then begin
               inc(cntDelR);
             if arrRN[a].typ=1 then
                ADD_SQL(DataModule1.IbSaveSQl,'delete from rns where rns_id=:id');
             if arrRN[a].typ=2 then
                ADD_SQL(DataModule1.IbSaveSQl,'delete from spiss where spiss_id=:id');
             if arrRN[a].typ=4 then
                ADD_SQL(DataModule1.IbSaveSQl,'delete from pns$ where pns$_id=:id');
             DataModule1.IbSaveSQl.paramByname('id').asinteger:=arrRN[a].id;
             try
                DataModule1.IbSaveSQl.ExecSQL;
             except
             end;
          end;
        end;
        for a:=1 to cntPR do begin
          statusbar1.panels[0].text:=inttostr(cnt)+' �� '+inttostr(all)+' ���:'+QueryWork.fieldByname('tw_art').asstring+' ������� ������� '+inttostr(a)+' �� '+inttostr(cntPR);
          delay(1);
          // ���������, ������ ������, ��� ������.
          if arrPR[a].pp_kol2>0.0001 then begin
             if abs(arrPR[a].pp_kol1-arrPR[a].pp_kol2)<0.0001 then begin
               // ������� ������
             if arrPR[a].pp_typ=11 then begin
                ADD_SQL(DataModule1.IbSaveSQl,'delete from pns$ where pns$_id=:id');
                DataModule1.IbSaveSQl.paramByname('id').asinteger:=arrPR[a].pp_id;
                try
                   DataModule1.IbSaveSQl.ExecSQL;
                except
                end;
             end;
             if arrPR[a].pp_typ=12 then begin
                ADD_SQL(DataModule1.IbSaveSQl,'delete from rns where rns_id=:id');
                DataModule1.IbSaveSQl.paramByname('id').asinteger:=arrPR[a].pp_id;
                try
                   DataModule1.IbSaveSQl.ExecSQL;
                except
                end;
             end;
               inc(cntDelP);
             end else begin
               // �������� ������
               if ((arrPR[a].pp_typ=11) and (arrPR[a].pp_kol1>0)) then begin
                  inc(cntUpdP);
                  ADD_SQL(DataModule1.IbSaveSQl,'update PNS$ set pns$_id=-pns$_id, tw_kol=:tw_kol, tw_summ=tw_summ*:k1, '+
                  'pns$_nds_summ=pns$_nds_summ*:k2 where PNS$_id=:id');
                  DataModule1.IbSaveSQl.paramByname('tw_kol').asfloat:=arrPR[a].pp_kol1-arrPR[a].pp_kol2;
                  DataModule1.IbSaveSQl.paramByname('id').asinteger:=arrPR[a].pp_id;
                  DataModule1.IbSaveSQl.paramByname('k1').asfloat:=(arrPR[a].pp_kol1-arrPR[a].pp_kol2)/arrPR[a].pp_kol1;
                  DataModule1.IbSaveSQl.paramByname('k2').asfloat:=(arrPR[a].pp_kol1-arrPR[a].pp_kol2)/arrPR[a].pp_kol1;
                  DataModule1.IbSaveSQl.ExecSQL;
                  ADD_SQL(DataModule1.IbSaveSQl,'update POL set pol_kol=:pol_kol where doc_typ=1 and doc_id=:id');
                  DataModule1.IbSaveSQl.paramByname('id').asinteger:=arrPR[a].pp_id;
                  DataModule1.IbSaveSQl.paramByname('pol_kol').asfloat:=arrPR[a].pp_kol1-arrPR[a].pp_kol2;
                  DataModule1.IbSaveSQl.ExecSQL;
               end;
             end;
          end;
        end;
        DataModule1.IBTransaction2.Commit;
        DataModule1.IBTransaction2.Active:=False;

        for a:=1 to cntRN do if ((abs(arrRN[a].kol1-arrRN[a].kol2)>0.0001) and (arrRN[a].kol2>0.0001)) then
            inc(c);

        MemoAdd(QueryWork.fieldByname('tw_art').asstring+': '+floattostrf(r1,fffixed,19,1)+'-'+
        floattostrf(r2,fffixed,19,1)+' cntDelR='+inttostr(cntDelR)+
        ', cntDelP='+inttostr(cntDelP)+', cntUpdP='+inttostr(cntUpdP));
        if c>0 then MemoAdd(QueryWork.fieldByname('tw_art').asstring+': '+inttostr(c)+' !!!!!!!!!!! �� ������ �������');


        if (cnt mod 50) =0 then begin
          WorkTransaction3.Active:=FALSE;
          OPEN_SQL(QueryWork5,'select sum(tw_kol) as c from reg');
          MemoAdd('����� '+QueryWork.fieldByname('tw_art').asstring+'-'+QueryWork.fieldByname('tw_brak').asstring+' ����� '+floattostrf(QueryWork5.fieldByname('c').asfloat,fffixed,19,4));
        end;
        QueryWork.next;
      end;
      WorkTransaction3.Active:=FALSE;
      OPEN_SQL(QueryWork5,'select sum(tw_kol) as c from reg');
      MemoAdd('����� ����� ����� '+floattostrf(QueryWork5.fieldByname('c').asfloat,fffixed,19,4));
      MemoAdd('������� ���������!');
      messbox('��������! ������ ����� ������� ������� DEL � ���������� �� ����. ���� �������� �� ����������, ���������� ������ InterBase!',MessSystem,48);
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ����� �������� ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from pn$ where (select count(*) from pns$ where pns$.pn$_id=pn$.pn$_id)=0');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ����� ��������');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from rn where (select count(*) from rns where rns.rn_id=rn.rn_id)=0');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ����� �������� ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from spis where (select count(*) from spiss where spiss.spis_id=spis.spis_id)=0');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� DEL ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from DEL');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('�����������...');
      DataModule1.IBDatabase1.Connected:=False;
      MemoAdd('�����������.');
      MemoAdd('������!');
   Except
         MemoAdd('�� ������� ������������ � ���� ������!');
   End;
   BtnClose.enabled:=True;

end;

procedure TForm1.BtnRun3Click(Sender: TObject);
type
  tPN=record
    pn_id:integer;
    sum1:double;
    sum2:double;
  end;
  tOST=record
    tw_id:integer;
    skl_id:integer;
    ost:double;
  end;
  tPER=record
    PER_ID:integer;
    SKL_FROM:integer;
    SKL_TO:integer;
  end;
var
  cntSKL:integer;
  arrSKL:array[1..100] of integer;
  cntPER:integer;
  arrPER:array[1..2500] of tPER;
  arrOST1:array[1..25000] of tOST;
  arrOST2:array[1..15000] of tOST;
  aOST1,aOST2:array[1..100] of double;
  cntOST1,cntOST2:integer;
  cOST1,cOST2:integer;
  t:textfile;
  arrPN:array[1..10000] of tPN;
  all,cnt:integer;
  a,b,c,d,e:integer;
  s:string;
  met,cntPN,id,tw_id,skl_id:integer;
  k,sum1,sum2,ost:double;
  delta,delta2,deltaREC:double;
begin
   CAN:=TRUE;
   BtnRun.enabled:=False;
   BtnRun2.enabled:=False;
   BtnRun3.enabled:=False;
   BtnClose.enabled:=False;
   TmpPath.enabled:=False;
   BtnBase.enabled:=False;
   DT.enabled:=False;
   // �������� ������.
   MemoAdd('�������� ��� 3');
   DataModule1.IBDatabase1.DatabaseName:=trim(MainPath.Text);
   MemoAdd('������������ � ���� ������...');
   Try
      DataModule1.IBDatabase1.Connected:=True;
      MemoAdd('������������.');
      MemoAdd('��������� ������� �������');
      WorkTransaction.Active:=False;
      OPEN_SQL(QueryWork,'select tw_id,skl_id,sum(tw_kol) as ost from reg '+
      'group by tw_id,skl_id having sum(tw_kol)<>0 order by tw_id');
      cntOST1:=0;
      while not QueryWork.eof do begin
         inc(cntOST1);
         arrOST1[cntOST1].tw_id:=QueryWork.fieldByname('tw_id').asinteger;
         arrOST1[cntOST1].skl_id:=QueryWork.fieldByname('skl_id').asinteger;
         arrOST1[cntOST1].ost:=QueryWork.fieldByname('ost').asfloat;
         QueryWork.next;
      end;
      MemoAdd('��������� ����������� �������');
      cntOST2:=0;
      assignfile(t,tmpPath.Text+'ost.txt');
      reset(t);
      while not eof(t) do begin
         readln(t,tw_id,skl_id,ost);
         inc(cntOST2);
         arrOST2[cntOST2].tw_id:=tw_id;
         arrOST2[cntOST2].skl_id:=skl_id;
         arrOST2[cntOST2].ost:=ost;
      end;
      closefile(t);

      // ��������� ����� ��������� �����������
      MemoAdd('��������� ����� �������');
      cntPER:=0; cntSKL:=0;
      OPEN_SQL(QueryWork,'select skl_id from skl');
      while not QueryWork.eof do begin
         inc(cntSKL);
         ARRSKL[cntSKL]:=QueryWork.fieldByname('skl_id').asinteger;
         QueryWork.Next;
      end;
      MemoAdd('��������� ����� �����������...');
      for a:=1 to cntSKL do
        for b:=1 to cntSKL do begin
           if arrSKL[a]<>arrSKL[b] then begin
              inc(cntPER);
              arrPER[cntPER].skl_from:=arrskl[a];
              arrPER[cntPER].skl_to:=arrskl[b];
              DataModule1.IBTransaction2.Active:=False;
              DataModule1.IBTransaction2.StartTransaction;
              IBSAVE_CLEAR;
              IBSAVE_ADD('PER_NUM',cntPER);
              IBSAVE_ADD('PER_DATE',dt.date);
              IBSAVE_ADD('SKL_FROM',arrskl[a]);
              IBSAVE_ADD('SKL_TO',arrskl[b]);
              IBSAVE_ADD('SHOP_ID',1);
              IBSAVE_ADD('PER_PROW',1);
              IBSAVE_ADD('PER_WHO','');
              IBSAVE_ADD('PER_OSN','��������� �������� ����� ������� �� '+date_sokr(dt.date));
              IBSAVE_ADD('US_ID',0);
              IBSAVE_ADD('FRM_ID',4);
              ID:=IBSAVE_DOC('PER',-1);
              arrPER[cntPER].per_id:=ID;
              DataModule1.IBTransaction2.COMMIT;
              DataModule1.IBTransaction2.Active:=False;
           end;
      end;
      MemoAdd('����� ����������� �������...');
      MemoAdd('��������� �������...');
      WorkTransaction.Active:=False;
      OPEN_SQL(QueryWork,'select count(distinct tw_id) as c from reg');
      if QueryWork.eof then all:=0 else all:=QueryWork.fieldByname('c').asinteger;
      OPEN_SQL(QueryWork,'select distinct tw_id from reg');
      cnt:=0;
      while not QueryWork.eof do begin
        inc(cnt);
//      MemoAdd('��������� tw_id='+QueryWork.fieldByname('tw_id').asstring);
        if cnt mod 50 = 0 then begin
          Statusbar1.panels[0].text:='������ '+inttostr(cnt)+' �� '+inttostr(all)+'...';
          delay(1);
        end;
        // �������� ������� �� �������� � ������ �������
        for a:=1 to cntSKL do aOST1[a]:=0;
        for a:=1 to cntSKL do aOST2[a]:=0;
        // �������
        for a:=1 to cntOST1 do if arrOST1[a].tw_id=QueryWork.fieldByname('tw_id').asinteger then begin
          for b:=1 to cntSKL do if arrOST1[a].skl_id=arrSKL[b] then aOST1[b]:=arrOST1[a].ost;
        end;
        // ��� ������ ����
        for a:=1 to cntOST2 do if arrOST2[a].tw_id=QueryWork.fieldByname('tw_id').asinteger then begin
          for b:=1 to cntSKL do if arrOST2[a].skl_id=arrSKL[b] then aOST2[b]:=arrOST2[a].ost;
        end;
        // �������, ��� ������ ����:
//      for a:=1 to cntSKL do MemoAdd('������ SKL_ID='+inttostr(arrSKL[a])+' '+floattostrf(aOST2[a],fffixed,19,4));
//      for a:=1 to cntSKL do MemoAdd('���� SKL_ID='+inttostr(arrSKL[a])+' '+floattostrf(aOST1[a],fffixed,19,4));
        // ������� ������� ������������
        // �������� ��������� �� ������� � ����������� �����������
        for a:=1 to cntSKL do begin
           if abs(aOST1[a]-aOST2[a])>0.00005 then begin
              // ������� �� ���������
              delta:=aOST1[a]-aOST2[a];
              if delta>0 then begin
                 // �������
//               Memoadd('�� ������ '+inttostr(arrSKL[a])+' ������� � '+floattostrf(delta,fffixed,19,4));
                 // �������� ��������� �� ������� � �������� ������
                 for b:=1 to cntSKL do if a<>b then begin
                    if ((abs(aOST1[b]-aOST2[b])>0.00005) and (aOST1[b]<aOST2[b]) and (delta>0) ) then begin
                          delta2:=aOST2[b]-aOST1[b];
//                        Memoadd('�� ������ '+inttostr(arrSKL[b])+' ����� ���������  � '+floattostrf(delta2,fffixed,19,4));
                          // ����������, ������� ����� ���� �����������
                          if delta>delta2 then begin
                             deltaREC:=delta2;
                             delta:=delta-delta2;
                          end else begin
                              deltaREC:=delta;
                              delta:=0;
                          end;
//                        Memoadd('deltaRec ��������� '+floattostrf(deltaREC,fffixed,19,4));
                          // ��������� ����������� - ������ ������
                          // ���� ������ ��� �����
                          for c:=1 to cntPER do if ((arrPER[c].SKL_FROM=arrSKL[a]) and (arrPER[c].SKL_TO=arrSKL[b])) then begin
                             // ������ ������
                             DataModule1.IBTransaction2.Active:=False;
                             DataModule1.IBTransaction2.StartTransaction;
                             IBSAVE_CLEAR;
                             IBSAVE_ADD('PER_ID',arrPER[c].PER_ID);
                             IBSAVE_ADD('TW_ID',QueryWork.fieldByname('tw_id').asinteger);
                             IBSAVE_ADD('TW_KOL',deltaREC);
                             IBSAVE_ADD('OTG_KOL',deltaREC);
                             IBSAVE_ADD('OTG_DATE',dt.date);
                             IBSAVE_ADD('OTG_US',0);
                             IBSAVE_ADD('POL_KOL',deltaREC);
                             IBSAVE_ADD('POL_DATE',dt.date);
                             IBSAVE_ADD('POL_US',0);
                             IBSAVE_DOC('PERS',-1);
                             DataModule1.IBTransaction2.Commit;
                             DataModule1.IBTransaction2.Active:=False;
                          end;
                          aOST1[a]:=aOST1[a]-deltaRec;
                          aOST1[b]:=aOST1[b]+deltaRec;
//                        Memoadd('������� �� ������� ����� '+floattostrf(aOST1[a],fffixed,19,4)+' � '+floattostrf(aOST2[a],fffixed,19,4));

                    end;
                 end;
              end else begin
                 // ���������
                 delta:=-delta;
//               Memoadd('�� ������ '+inttostr(arrSKL[a])+' ��������� � '+floattostrf(delta,fffixed,19,4));
                 // �������� ��������� �� ������� � �������� ������
                 for b:=1 to cntSKL do if a<>b then begin
                    if ((abs(aOST1[b]-aOST2[b])>0.00005) and (aOST1[b]>aOST2[b]) and (aOST1[b]>0)  and (delta>0)) then begin
                          delta2:=aOST1[b]-aOST2[b];
//                        Memoadd('�� ������ '+inttostr(arrSKL[b])+' ����� ������� � '+floattostrf(delta2,fffixed,19,4));
                          // ����������, ������� ����� ���� �����������
                          if delta>delta2 then begin
                             deltaREC:=delta2;
                             delta:=delta-delta2;
                          end else begin
                              deltaREC:=delta;
                              delta:=0;
                          end;
//                        Memoadd('deltaRec ��������� '+floattostrf(deltaREC,fffixed,19,4));
                          // ��������� ����������� - ������ ������
                          // ���� ������ ��� �����
                          for c:=1 to cntPER do if ((arrPER[c].SKL_FROM=arrSKL[b]) and (arrPER[c].SKL_TO=arrSKL[a])) then begin
                             // ������ ������
                             DataModule1.IBTransaction2.Active:=False;
                             DataModule1.IBTransaction2.StartTransaction;
                             IBSAVE_CLEAR;
                             IBSAVE_ADD('PER_ID',arrPER[c].PER_ID);
                             IBSAVE_ADD('TW_ID',QueryWork.fieldByname('tw_id').asinteger);
                             IBSAVE_ADD('TW_KOL',deltaREC);
                             IBSAVE_ADD('OTG_KOL',deltaREC);
                             IBSAVE_ADD('OTG_DATE',dt.date);
                             IBSAVE_ADD('OTG_US',0);
                             IBSAVE_ADD('POL_KOL',deltaREC);
                             IBSAVE_ADD('POL_DATE',dt.date);
                             IBSAVE_ADD('POL_US',0);
                             IBSAVE_DOC('PERS',-1);
                             DataModule1.IBTransaction2.Commit;
                             DataModule1.IBTransaction2.Active:=False;
                          end;
                          aOST1[a]:=aOST1[a]+deltaRec;
                          aOST1[b]:=aOST1[b]-deltaRec;
//                        Memoadd('������� �� ������� ����� '+floattostrf(aOST1[a],fffixed,19,4)+' � '+floattostrf(aOST2[a],fffixed,19,4));
                    end;
                 end;
              end;

              // �������� ��������� �� ������� � �������������
           end;
        end;

        QueryWork.next;
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� ����� �����������...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from per where (select count(*) from pers where pers.per_id=per.per_id)=0');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;

      MemoAdd('��������� ����������� ������ ������� �� '+tmpPath.Text+'pn$.txt...');
      assignfile(t,tmpPath.Text+'pn$.txt');
      reset(t);
      cntPN:=0;
      while not eof(t) do begin
         readln(t,id,sum1,sum2);
         if ((sum1>0.00001) and (sum2>0.00001)) then begin
            inc(cntPN);
            arrPN[cntPN].pn_id:=ID;
            arrPN[cntPN].sum1:=sum1;
            arrPN[cntPN].sum2:=sum2;
         end;
      end;
      MemoAdd('��������� '+inttostr(cntPN)+' ��������. ������������ ������...');
      // ���������� ���-�� ��������
      Worktransaction.Active:=False;
      ADD_SQL(QueryWork,'select count(*) as c from pn$ where pn$_date<:dt');
      QueryWork.paramByname('dt').asdatetime:=dt.date;
      QueryWork.open;
      if QueryWork.eof then all:=0 else all:=QueryWork.fieldByname('c').asinteger;
      cnt:=0;

      ADD_SQL(QueryWork,'select pn$_id, '+
      '(select sum(tw_summ) from pns$ where pns$.pn$_id=pn$.pn$_id) as sum1, '+
      '(select sum(pns2$_summ) from pns2$ where pns2$.pn$_id=pn$.pn$_id) as sum2 '+
      'from pn$ where pn$_date<:dt order by pn$_id desc');
      QueryWork.paramByname('dt').asdatetime:=dt.date;
      QueryWork.open;
      a:=0;
      while not QueryWork.eof do begin
        inc(cnt);
        Statusbar1.panels[0].text:='������ '+inttostr(cnt)+' �� '+inttostr(all)+'...';
        delay(1);

        if ((QueryWork.fieldByname('sum2').asfloat>0.001) and (QueryWork.fieldByname('sum1').asfloat>0.001)) then begin
           // ����� ��������� � �������� ���� ��������� ��������
           // ����, ����� ���� �����
           b:=0;
           while b<cntPN do begin
              inc(b);
              if arrPN[b].pn_id=QueryWork.fieldByname('pn$_id').asinteger then begin
                 // ��������� ����� -������� �����
                 if abs(QueryWork.fieldByname('sum1').asfloat-arrPN[b].sum1)>0.001 then begin
                    inc(a);
                    // ������������ ��������� �������
                    k:=QueryWork.fieldByname('sum1').asfloat/arrPN[b].sum1;
                    WorkTransaction2.Active:=False;
                    WorkTransaction2.StartTransaction;
                    ADD_SQL(QueryWork3,'update pns2$ set pns2$_id=-pns2$_id, pns2$_nds_summ=pns2$_nds_summ*:k1, '+
                    'pns2$_summ=pns2$_summ*:k2 where pn$_id=:id');
                    QueryWork3.paramByname('k1').asfloat:=k;
                    QueryWork3.paramByname('k2').asfloat:=k;
                    QueryWork3.paramByname('id').asinteger:=arrPN[b].pn_id;
                    QueryWork3.ExecSQL;
                    WorkTransaction2.Commit; WorkTransaction2.Active:=False;
                 end;
                 b:=cntPN+100;
              end;
           end;
        end;
        QueryWork.next;

      end;
      MemoAdd('��������������� '+inttostr(a)+' ��������');
      Worktransaction.Active:=False;
      MemoAdd('������� ������� ARCUPDATE ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from ARCUPDATE');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;
      MemoAdd('������� ������� DEL ...');
      Worktransaction.Active:=False;
      Worktransaction.StartTransaction;
      ADD_SQL(QueryWork,'delete from DEL');
      try
         QueryWork.ExecSQL;
      except
      end;
      Worktransaction.Commit; Worktransaction.Active:=False;



      MemoAdd('�����������...');
      DataModule1.IBDatabase1.Connected:=False;
      MemoAdd('�����������.');
      MemoAdd('������!');
   Except
         MemoAdd('�� ������� ������������ � ���� ������!');
   End;
   BtnClose.enabled:=True;

end;

end.



