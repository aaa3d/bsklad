unit DelOtgSPis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1, ComCtrls, StdCtrls, Mask, ToolEdit, ToolWin, Db, IBCustomDataSet,
  IBQuery, IBDatabase,b_utils,B_DButils, Grids, DBGrids, RXDBCtrl, RxMemDS,
  VclUtils;

type
  TDEL_OTG_SPIS = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    ToolButton1: TToolButton;
    BtnRefresh: TToolButton;
    ToolButton3: TToolButton;
    BtnHistory: TToolButton;
    BtnFind: TToolButton;
    RxDBGrid1: TRxDBGrid;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemRep: TRxMemoryData;
    MemRepMET: TStringField;
    MemRepDOC_FULL_NUM: TStringField;
    MemRepDT: TDateField;
    MemRepUS_FULL: TStringField;
    DsRep2: TDataSource;
    WorkTransaction2: TIBTransaction;
    QueryWork2: TIBQuery;
    QueryWork3: TIBQuery;
    QueryWork4: TIBQuery;
    MemRepID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnHistoryClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DEL_OTG_SPIS: TDEL_OTG_SPIS;

implementation

uses WaitForm, Mainform;

{$R *.DFM}

procedure TDEL_OTG_SPIS.FormShow(Sender: TObject);
begin
    Top:=Main_Form.Top+22;
    Left:=Screen.DesktopLeft;
    Width:=Screen.DesktopWidth;
    Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
    datamodule1.ibdatabase2.OPEN;

    DT1.date:=date();
    DT2.date:=date();
    BtnRefresh.click();
end;

procedure TDEL_OTG_SPIS.BtnRefreshClick(Sender: TObject);
var
  all,cnt:integer;

begin
  // ����������� ��������� ���������
  Wait_Form.StatusBar1.panels[0].text:='������� ����� ��������� ����������...';
  Wait_Form.Gauge1.Progress:=1;
  Wait_Form.Show;
  delay(1);
  MemRep.EmptyTable;
  WorkTransaction.Active:=False;
  WorkTransaction2.Active:=False;
  // ���������� ���-��
  ADD_SQL(QueryWork,'select count(distinct tabname_id) as cc from del where tabname="SPIS" '+
  'and tm between :dt1 and :dt2');
  QueryWork.ParamByname('DT1').asdatetime:=DT1.date;
  QueryWork.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
  QueryWork.Open;
  if QueryWork.eof then all:=0 else all:=QueryWork.fieldByname('cc').asinteger;
  cnt:=0;
  if all>0 then begin
    ADD_SQL(QueryWork,'select tabname_id,min(tm) as tm from del where tabname="SPIS" '+
    'group by tabname_id having min(tm) between :dt1 and :dt2 order by 2');
    QueryWork.ParamByname('DT1').asdatetime:=DT1.date;
    QueryWork.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
    QueryWork.Open;
    While not QueryWork.eof do begin
       inc(cnt);
       if cnt mod 10=0 then begin
         Wait_Form.StatusBar1.panels[0].text:='����� ��������� ����������...';
         Wait_Form.Gauge1.Progress:=round(1+(99*(cnt/all)));
         Wait_Form.Show;
         delay(1);
       end;
       // ����������� ����������� �� ��������
       // ������ ����
       ADD_SQL(QueryWork2,'select mess from arcupdate where doc="TWSPIS" and dop1=:spis_id order by tm');
       QueryWork2.paramByname('spis_id').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
       QueryWork2.open;
       if not QueryWork2.eof then begin
          MemRep.append;
          MemRep.fieldByname('MET').asstring:='�';
          MemRep.fieldByname('ID').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
          MemRep.fieldByname('DOC_FULL_NUM').asstring:=QueryWork2.fieldByname('mess').asstring;
          MemRep.fieldByname('DT').asdatetime:=QueryWork.fieldByname('TM').asdatetime;
          ADD_SQL(QueryWork4,'select (select kln_full from kln_data(arcdel.us_id)) as kln_full from arcdel '+
          ' where tabname="SPIS" and tabname_id=:SPIS_ID');
          QueryWork4.paramByname('SPIS_ID').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
          QueryWork4.open;
          if QueryWork4.eof then MemRep.fieldByname('US_FULL').asstring:='����������'
          else MemRep.fieldByname('US_FULL').asstring:=QueryWork4.fieldByname('kln_full').asstring;
          QueryWork4.close;
          MemRep.post;
          Delay(1);
       end;
       // ����� ����
       ADD_SQL(QueryWork3,'select mess from arcupdate where doc="TWSPIS" and dop1=:spis_id order by tm');
       QueryWork3.paramByname('spis_id').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
       QueryWork3.open;
       if not QueryWork3.eof then begin
          MemRep.append;
          MemRep.fieldByname('MET').asstring:=' ';
          MemRep.fieldByname('ID').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
          MemRep.fieldByname('DOC_FULL_NUM').asstring:=QueryWork3.fieldByname('mess').asstring;
          MemRep.fieldByname('DT').asdatetime:=QueryWork.fieldByname('TM').asdatetime;
          ADD_SQL(QueryWork4,'select (select kln_full from kln_data(arcdel.us_id)) as kln_full from arcdel '+
          ' where tabname="SPIS" and tabname_id=:SPIS_ID');
          QueryWork4.paramByname('SPIS_ID').asinteger:=QueryWork.fieldByname('tabname_id').asinteger;
          QueryWork4.open;
          if QueryWork4.eof then MemRep.fieldByname('US_FULL').asstring:='����������'
          else MemRep.fieldByname('US_FULL').asstring:=QueryWork4.fieldByname('kln_full').asstring;
          QueryWork4.close;
          MemRep.post;
          delay(1);
       end;
       QueryWork.next;
    end;
    QueryWork.close;
    Wait_Form.Gauge1.Progress:=100;
    Wait_Form.StatusBar1.panels[0].text:='��� ����� ������...';
    Wait_Form.Show;
    delay(100);
  end;
  Wait_Form.Hide;
end;

procedure TDEL_OTG_SPIS.BtnHistoryClick(Sender: TObject);
begin
    {���������� "�������" ��������� �����������}
    SHOW_HISTORY_DOC(MemRep.fieldByname('DOC_FULL_NUM').asstring,'SPIS',MemRep.fieldbyname('ID').asinteger);
end;

procedure TDEL_OTG_SPIS.BtnFindClick(Sender: TObject);
var
   sw,s:ansistring;
   US:integer;
begin
     s:='SPIS';
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select str,us_id,tm from arcdel where tabname="'+S+'" and tabname_id=:id_doc');
     QueryWork.parambyname('ID_DOC').asinteger:=MemRep.fieldByname('ID').asinteger;
     QueryWork.open;
     if QueryWork.eof then Messbox('�� ������� ������ �� �������� ���������!',Messsystem,48)
     else begin
       sw:='��������� ������� '+datetimetostr(QueryWork.fieldbyname('TM').asdatetime);
       US:=QueryWork.fieldbyname('US_ID').asinteger;
       ADD_SQL(QueryWork,'select kln_fam||" "||bg_toupper(BG_left(kln_name,1))||". "||bg_toupper(BG_left(kln_name2,1))||"." as US_FIO from kln where kln_id=:us_id');
       QueryWork.parambyname('US_ID').asinteger:=US;
       QueryWork.open;
       if QueryWork.eof then
       sw:=sw+' ����������� �������������!' else sw:=sw+' �������������: '+QueryWork.fieldbyname('US_FIO').asstring;
       Messbox(sw,Messsystem,48);
       QueryWork.Close;
     end;

end;

procedure TDEL_OTG_SPIS.FormDestroy(Sender: TObject);
begin
  datamodule1.ibdatabase2.close;
end;

end.