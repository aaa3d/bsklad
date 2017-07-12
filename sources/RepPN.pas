unit RepPN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RxLookup, Mask, ToolEdit, IBDatabase, Db,
  IBCustomDataSet, IBQuery, DualList, Grids, DBGrids, RXDBCtrl, RxMemDS,
  FR_DSet, FR_DBSet, FR_Class;

type
  TREP_PN = class(TForm)
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    GroupBox3: TGroupBox;
    BtnPntyp: TSpeedButton;
    Edit1: TEdit;
    BtnStart: TButton;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    DualListDialog1: TDualListDialog;
    RxDBGrid1: TRxDBGrid;
    DataSource2: TDataSource;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    DsFrm: TDataSource;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery1PNTYP_SHORT: TIBStringField;
    IBQuery1SUMM: TFloatField;
    IBQuery1NDS: TFloatField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    BtnPrint: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnPntypClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    PNTYP_S: string;
    REPORT_TITLE: string;
  public
    { Public declarations }
  end;

var
  REP_PN: TREP_PN;

implementation

uses Data1, b_utils, WaitForm, vclUtils;

{$R *.DFM}

procedure TREP_PN.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
  ddd: TDateTime;
  dd, yy, mm: word;
begin


   decodedate(date(),yy,mm,dd);  

   ddd:=encodedate(yy,mm,1);
   dt1.date:= incmonth(ddd,-1);
   dt2.date:=incmonth(dt1.Date,1)-1;

   


// Заполняем перечень приходных
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog1.List2.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('PNTYP_ID').asstring;
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     s3 := s3+'%';
     Edit1.text:=s4;
     PNTYP_S:=s3;



      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;
      
      ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(-1) order by 2');
      QueryWork.open;
      while not QueryWork.eof do begin
        MemFrm.Append;
        MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
        MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
        MemFrm.Post;
        QueryWork.next;
      end;


     FRM.Value:=inttostr(0);

end;

procedure TREP_PN.BtnPntypClick(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('PNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('PNTYP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        s := s+'%';
        PNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TREP_PN.BtnStartClick(Sender: TObject);
begin
 REPORT_TITLE:='Отчет оп приходным накладным за период: '+
   date_sokr(dt1.date) + '....'+date_sokr(dt2.date);
   REPORT_TITLE:=REPORT_TITLE+', по фирме:  '+ FRM.Text +', по накладным: '+ Edit1.Text;


   //REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1.date)+' - '+date_sokr(dt2)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);

 //querywork.SQL.Text:='select pntyp_short, summ, nds from rep_pn(:dt1, :dt2, :frm_id, :pntyp_s)';
// ibquery1.Close;
 ibquery1.Transaction.Active:=false;

  ibquery1.ParamByName('pntyp_s').asString:=PNTYP_S;
  ibquery1.ParamByName('dt1').asDateTime:=dt1.Date;
  ibquery1.ParamByName('dt2').asDateTime:=dt2.date+1-sekond1;
  ibquery1.ParamByName('FRM_ID').asInteger:=strtoint(FRM.Value);
  ibquery1.Open;


  if ibquery1.recordcount>0 then BtnPrint.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Ок!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;



end;

procedure TREP_PN.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREP_PN.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

end.
