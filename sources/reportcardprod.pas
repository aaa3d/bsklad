unit reportcardprod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, IBDatabase, Db,VclUtils,
  IBCustomDataSet, IBQuery, b_utils, b_dbutils, WaitForm, DualList, Excel97,
  OleServer, ComObj;

type
  Treport_card_prod = class(TForm)
    Button1: TButton;
    RDT2: TDateEdit;
    Label3: TLabel;
    RDT1: TDateEdit;
    Label4: TLabel;
    QueryReport: TIBQuery;
    ReportTransaction: TIBTransaction;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure ExpExcel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  report_card_prod: Treport_card_prod;
  Title:string;

const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

{$R *.DFM}

procedure Treport_card_prod.Button1Click(Sender: TObject);
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

procedure Treport_card_prod.ExpExcel;
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


    QueryReport.ParamByName('rdt1').AsDate:=rdt1.date;
    QueryReport.ParamByName('rdt2').AsDate:=rdt2.date;

    if (checkbox1.checked) then
        QueryReport.ParamByName('do_group').AsInteger:=1
    else
        QueryReport.ParamByName('do_group').AsInteger:=0;



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



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Отчет по продажам по картам.XLT', 0);


    v := VarArrayCreate([0, QueryReport.RecordCount+1, 0, 6], varVariant);

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := QueryReport.fieldbyname('KLN_NAME').asstring;
            v[iRow, 1] := QueryReport.fieldbyname('CARD_NUM').asVariant;
            v[iRow, 2] := QueryReport.fieldbyname('SALES_SUMM').asVariant;
            v[iRow, 3] := QueryReport.fieldbyname('SKID_SUMM').asVariant;
            v[iRow, 4] := QueryReport.fieldbyname('SKID_PERCENT').asVariant;
        end;
        QueryReport.Next;
    end;



    r:= excel.Range['A1', 'A1'];
    r.Value := 'Отчет по продажам по дисконтам за период c '+date_sokr(RDT1.Date)+' по '+date_sokr(RDT2.Date);
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

procedure Treport_card_prod.FormShow(Sender: TObject);

begin



     RDT1.Date:=date();
     RDT2.Date:=date();



     
end;

end.
