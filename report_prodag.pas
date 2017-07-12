unit report_prodag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, IBDatabase, Db,VclUtils,
  IBCustomDataSet, IBQuery, b_utils, b_dbutils, WaitForm, DualList, Excel97,
  OleServer, ComObj;

type
  Treport_prod = class(TForm)
    Label10: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    PDT1: TDateEdit;
    PDT2: TDateEdit;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Button1: TButton;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    RDT2: TDateEdit;
    Label3: TLabel;
    RDT1: TDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    DualListDialog1: TDualListDialog;
    DualListDialog2: TDualListDialog;
    QueryReport: TIBQuery;
    ReportTransaction: TIBTransaction;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExpExcel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  report_prod: Treport_prod;
  Title:string;
  PNTYP_S:ansistring;
  RNTYP_S:ansistring;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

{$R *.DFM}

procedure Treport_prod.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
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
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        PNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure Treport_prod.Button1Click(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel;
  except
//    ExpCalc;
  end;

end;

procedure Treport_prod.ExpExcel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    izoneIndex: integer;
    zoneCnt: integer;
    ost: double;
    ostLong: longint;
    i: integer;
    s: string;

begin

    Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
    Wait_Form.Gauge1.Progress:=10;
    Wait_Form.Show;
    delay(1);

    QueryReport.ParamByName('frm').asinteger:=frm.KeyValue;
    QueryReport.ParamByName('pdt1').AsDate:=pdt1.date;
    QueryReport.ParamByName('pdt2').AsDate:=pdt2.date;
    QueryReport.ParamByName('rdt1').AsDate:=rdt1.date;
    QueryReport.ParamByName('rdt2').AsDate:=rdt2.date;
    QueryReport.ParamByName('typ_pn').asstring:=PNTYP_S;
    QueryReport.ParamByName('typ_rn').asstring:=RNTYP_S;

    Wait_Form.Gauge1.Progress:=20;
    delay(1);

    QueryReport.Open;

    Wait_Form.Gauge1.Progress:=80;
    delay(1);

    if not (QueryReport.State in [dsBrowse]) then
      exit;





    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;

    QueryReport.last;
    QueryReport.First;



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Отчет по продажам.XLT', 0);


    v := VarArrayCreate([0, QueryReport.RecordCount+1, 0, 5], varVariant);

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := QueryReport.fieldbyname('PN_TYP').asstring +' №'+ QueryReport.fieldbyname('PN_NUM').asstring +' от '+QueryReport.fieldbyname('PN_DATE').asstring;
            v[iRow, 1] := QueryReport.fieldbyname('POST').asVariant;
            v[iRow, 2] := QueryReport.fieldbyname('SUM_NAKL').asVariant;
            v[iRow, 3] := QueryReport.fieldbyname('SUM_REAL').asVariant;
        end;
        QueryReport.Next;
    end;



    r:= excel.Range['A1', 'A1'];
    r.Value := 'Отчет по продажам по фирме '+frm.Text+', приходные накладные по типам '+Edit1.Text+
    ' за период c '+date_sokr(PDT1.Date)+' по '+date_sokr(PDT2.Date)+' расходные накладные по типам '+Edit2.Text+' за период c '+
    date_sokr(RDT1.Date)+' по '
    +date_sokr(RDT2.Date);
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Дата построения: '+ datetimetostr(now);



//    v[QueryReport.RecordCount, 0] := 'Итого: ';


    r := excel.Range[excel.Cells.Item[6, 1],
        excel.Cells.Item[QueryReport.RecordCount + 6- 1,5 ]];
    r.Value := v;

    r.Borders[xlEdgeTop].LineStyle := xlContinuous;
    r.Borders[xlEdgeTop].Weight := xlThin;
    r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


    r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    r.Borders[xlEdgeBottom].Weight := xlThin;
    r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
    try
    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;
    except
      Wait_Form.Close;
    end;


    except
    on e: Exception do
      begin
        MsgBox('Ошибка выгрузки в Excel', e.message, MB_OK);
        freeandnil(excel);
        Wait_Form.Close;
      end;
    end;

    Wait_Form.Gauge1.Progress:=95;
    delay(1);
    excel.Visible[0]:=true;
    freeandnil(excel);
    QueryReport.Close;
    Wait_Form.Gauge1.Progress:=100;
    delay(1);
    Wait_Form.Close;
end;

procedure Treport_prod.FormShow(Sender: TObject);
var
  s3,s4:ansistring;
  a:integer;
begin
     Edit1.text:='';
     Edit2.text:='';
     FRM.KeyValue:=2696214;
     RDT1.Date:=date();
     RDT2.Date:=date();
     PDT1.Date:=date();
     PDT2.Date:=date();

   {Заполняем DualListDialog1}
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog1.List2.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('PNTYP_ID').asstring;
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
     s3:=s3+'%';
     PNTYP_S := s3;

   {Заполняем DualListDialog2}
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog2.Title:='Список типов расходных накладных';
     DualListDialog2.List1.Clear;
     DualListDialog2.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog2.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit2.text:=s4;
     s3:=s3+'%';
     RNTYP_S := s3;
     
end;

procedure Treport_prod.BitBtn2Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog2.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog2.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog2.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit2.text:=s2;
     end;
end;

procedure Treport_prod.Button2Click(Sender: TObject);
begin
  Close();
end;

end.
