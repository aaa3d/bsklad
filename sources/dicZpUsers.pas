unit dicZpUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, IBCustomDataSet, IBQuery, IBDatabase, ComCtrls,
  ToolWin, StdCtrls, Mask, ToolEdit, FR_DSet, FR_DBSet, FR_Class, excel2000, OleServer, VclUtils;

type
  TDIC_ZP_USERS = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    IBQuery1TABEL: TIntegerField;
    IBQuery1ZP_USER_FIO: TIBStringField;
    IBQuery1ZP_SELF_TWTREE_NAM: TIBStringField;
    IBQuery1ZP_SELF_JOU_NAM: TIBStringField;
    IBQuery1ZP_ANOTHER_TWTREE_NAM: TIBStringField;
    IBQuery1ZP_ANOTHER_JOU_NAM: TIBStringField;
    IBQuery1KLN_ID: TIntegerField;
    DT1: TDateEdit;
    DT2: TDateEdit;
    ToolButton1: TToolButton;
    Button1: TButton;
    IBQuery1NAC_SUMM: TFloatField;
    IBQuery1ZP_USER_ROLE_STR: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    IBQuery1ZP_SELF_SHOPS_STR: TIBStringField;
    IBQuery1ZP_ANOTHER_SHOPS_STR: TIBStringField;
    Button2: TButton;
    ToolButton3: TToolButton;
    IBQuery1NAC_VOZV_SUMM: TFloatField;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure BtnNewClick(Sender: TObject);
    procedure RefreshDic;
    procedure BtnDelClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure Button2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ExpExcel;
  private
    { Private declarations }

    ReportTitle: string;
  public
    { Public declarations }
  end;

var
  DIC_ZP_USERS: TDIC_ZP_USERS;
  Title:string;
  Title2:string;

const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

uses data1, DicKlient, EditZpUser, b_dbUtils,WaitForm;

{$R *.DFM}


procedure TDIC_ZP_USERS.RefreshDic;
var kln_id: integer;
begin

Cursor:=crHourglass;

Application.ProcessMessages;

Show_Wait('Обновление журнала',2);

kln_id:=dbGrid1.DataSource.Dataset.FieldByName('kln_id').asInteger;


ibQuery1.DisableControls;

ibquery1.Close;
ibquery1.Transaction.Active:=false;


ibquery1.ParamByName('ONLY_USER_LIST').asinteger:=button2.Tag;

ibquery1.ParamByName('dt1').asDateTime:=dt1.Date;
ibquery1.ParamByName('dt2').asDateTime:=dt2.Date;

ibQuery1.Open;

ibquery1.Locate('kln_id', kln_id, []);


ibQuery1.EnableControls;
Wait_form.hide;

Cursor:=crDefault;


ReportTitle:='Зарплатный отчет. Период с '+dt1.Text+' по '+ dt2.Text;

end;


procedure TDIC_ZP_USERS.BtnNewClick(Sender: TObject);
begin

     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=0;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>0 then
     begin
      begin
       Application.createForm(TEDIT_ZP_USER,EDIT_ZP_USER);
       EDIT_ZP_USER.tag:=DIC_KLIENT.tag;
       EDIT_ZP_USER.ShowModal;

       RefreshDic;
      end;



     end;
end;

procedure TDIC_ZP_USERS.BtnDelClick(Sender: TObject);
var kln_id: integer;

begin
      kln_id:=dbGrid1.DataSource.Dataset.FieldByName('kln_id').asInteger;

      if kln_id > 0 then
      begin

        IBSAVE_CLEAR;
        IBSAVE_ADD('ZP_USER_ROLE', 0);
        IBSAVE_DOC('KLN', kln_id);
        DataModule1.IbSaveSQL.Transaction.Commit;

        RefreshDic;
      end;
end;

procedure TDIC_ZP_USERS.BtnOpenClick(Sender: TObject);
var kln_id: integer;

begin
      kln_id:=dbGrid1.DataSource.Dataset.FieldByName('kln_id').asInteger;


      if kln_id > 0 then
      begin
       Application.createForm(TEDIT_ZP_USER,EDIT_ZP_USER);
       EDIT_ZP_USER.tag:=kln_id;
       EDIT_ZP_USER.ShowModal;

       RefreshDic;
      end;
end;

procedure TDIC_ZP_USERS.DBGrid1DblClick(Sender: TObject);
begin
  BtnOpenClick(nil);
end;

procedure TDIC_ZP_USERS.FormShow(Sender: TObject);
var  yy,mm,dd: word;
begin
   decodedate(date(),yy,mm,dd);
   dt1.date:=encodedate(yy,mm,1);
   dt2.date:=incmonth(dt1.date,1)-1;

   RefreshDic;

end;

procedure TDIC_ZP_USERS.Button1Click(Sender: TObject);
begin
  frReport1.ShowReport;
end;

procedure TDIC_ZP_USERS.frReport1BeforePrint(Memo: TStringList;
  View: TfrView);
var o: TfrView;

begin
  o:=frReport1.FindObject('Memo1');
  if o <> nil then
    o.Memo.Text:=ReportTitle;

end;

procedure TDIC_ZP_USERS.Button2Click(Sender: TObject);
begin

 button2.tag:=0;
 RefreshDic;
 button2.tag:=1;
end;

procedure TDIC_ZP_USERS.ToolButton4Click(Sender: TObject);
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


procedure TDIC_ZP_USERS.ExpExcel;
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


//    OpenQuery;
    if not (ibquery1.State in [dsBrowse]) then
      exit;





    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;

    ibquery1.last;
    ibquery1.First;



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\зарплатный отчет.xlt', 0);


    v := VarArrayCreate([0, ibquery1.RecordCount+1, 0, 10], varVariant);

    for iRow:=0 to ibquery1.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := ibquery1.fieldbyname('TABEL').asVariant;
            v[iRow, 1] := ibquery1.fieldbyname('ZP_USER_FIO').asVariant;
            v[iRow, 2] := ibquery1.fieldbyname('NAC_SUMM').asVariant;
            v[iRow, 3] := ibquery1.fieldbyname('NAC_VOZV_SUMM').asVariant;
            v[iRow, 4] := ibquery1.fieldbyname('NAC_SUMM').asVariant + ibquery1.fieldbyname('NAC_VOZV_SUMM').asVariant;
            v[iRow, 5] := ibquery1.fieldbyname('ZP_USER_ROLE_STR').asVariant;
            v[iRow, 6] := ibquery1.fieldbyname('ZP_SELF_TWTREE_NAM').asVariant;
            v[iRow, 7] := ibquery1.fieldbyname('ZP_SELF_SHOPS_STR').asVariant;
            v[iRow, 8] := ibquery1.fieldbyname('ZP_ANOTHER_TWTREE_NAM').asVariant;
            v[iRow, 9] := ibquery1.fieldbyname('ZP_ANOTHER_SHOPS_STR').asVariant;

        end;
        ibquery1.Next;
    end;



    r:= excel.Range['A1', 'A1'];

    Title := 'Отчет по наценке для расчета зарплаты';
    r.Value := Title;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Дата построения: '+ datetimetostr(now);
    r:= excel.Range['A4', 'A4'];
    r.Value := Title2;



//    v[QueryReport.RecordCount, 0] := 'Итого: ';


    r := excel.Range[excel.Cells.Item[6, 1],
        excel.Cells.Item[ibquery1.RecordCount + 6- 1,11 ]];
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
    end;


    except
    on e: Exception do
      begin
        MsgBox('Ошибка выгрузки в Excel', e.message, MB_OK);
        freeandnil(excel);
      end;
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);

end;

end.
