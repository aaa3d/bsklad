unit ReportSkladWork;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer, ComObj,
  ExtCtrls, RxLookup;

type
  TREPORT_SKLAD_WORK = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    Label3: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    DualListDialog1: TDualListDialog;
    DualListDialog2: TDualListDialog;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DBGrid1: TDBGrid;
    BtnPrint: TButton;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Label1: TLabel;
    DT1: TDateEdit;
    DsRep1: TDataSource;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    Label4: TLabel;
    DT2: TDateEdit;
    QueryRep1TWTREE_NAM: TIBStringField;
    QueryRep1WEIGHT1: TFloatField;
    QueryRep1SUM1: TFloatField;
    QueryRep1WEIGHT2: TFloatField;
    QueryRep1SUM2: TFloatField;
    QueryRep1RASH_SUM: TFloatField;
    QueryRep1RASH_WEIGHT: TFloatField;
    QueryRep1POST_SUM: TFloatField;
    QueryRep1POST_WEIGHT: TFloatField;
    Label5: TLabel;
    SKL: TEdit;
    BitBtn3: TBitBtn;
    DualListDialog3: TDualListDialog;
    chkUseZak: TCheckBox;
    QueryRep1PER_SUM: TFloatField;
    QueryRep1PER_WEIGHT: TFloatField;
    QueryRep1PERIOD_WEIGHT: TFloatField;
    QueryRep1PALET1: TIntegerField;
    QueryRep1PALET2: TIntegerField;
    QueryRep1RASH_PALET: TIntegerField;
    QueryRep1POST_PALET: TIntegerField;
    QueryRep1PER_PALET: TIntegerField;
    QueryRep1PERIOD_PALET: TIntegerField;
    chkUsePalet: TCheckBox;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure QueryRep1CalcFields(DataSet: TDataSet);
    procedure ExpExcel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc;
    procedure btnExcelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }

    tw_group_id: integer;
    tW_group_typ:integer;
    SKL_S: string;

  public
    { Public declarations }
  end;

var
  REPORT_SKLAD_WORK: TREPORT_SKLAD_WORK;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_�������'; //����� �������
implementation

uses DicTowar, WaitForm, DicKlient, TwShowOstPrih, DicTwDynGroup,
  DicKlientDynGroup;

{$R *.DFM}

procedure TREPORT_SKLAD_WORK.BtnOkClick(Sender: TObject);

begin

   REPORT_TITLE:='����� � ������ ������ ('+date_sokr(dt1.Date)+' - '+date_sokr(dt2.date)+')';

   REPORT_TITLE:=REPORT_TITLE+ ', �� ������ �������: "'+tw.text+'"';
   REPORT_TITLE:=REPORT_TITLE+ ', �� �������: "'+SKl.text+'"';


 //  REPORT_TITLE:=REPORT_TITLE+', ����������� ����� '+
//   floattostrf(MES1.value,fffixed,12,0)+

//   DT2:=incmonth(dt.date+1-sekond1,-trunc(mes1.value))-sekond1;
//   DT1:=encodedate(1900,1,1);



//   REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1.Date)+' - '+date_sokr(dt2.date)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='������ ������...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
{   ADD_SQL(QueryRep1,'select tw_id,tw_art,tw_nam,sum(ost_kol) as ost_kol, '+
   'sum(ost_kol*seb) as seb,'+
   'twtree_id,twtree_full, max(tw_kwm_one) tw_kwm_one '+
   'from REPORT_ITOG_TDM_DETAL_NEW(:dt1,:dt2,:dtrep,:twtree_id, 1, :PP_TYPS, :twtree_typ, :post_group_id, :post_group_typ, :frm_id) '+
   wh+
   ' group by tw_id,tw_art,tw_nam, twtree_id,twtree_full, tw_kwm_one'+
   ' order by twtree_full,tw_nam ');
}
      QueryRep1.Active:=false;



   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1.date;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryRep1.ParamByname('skl_ids').asstring:=SKL_S;
   QueryRep1.ParamByname('PRICE_TYP').asinteger:=0;
   if chkUseZak.Checked then
   begin
     QueryRep1.ParamByname('PRICE_TYP').asinteger:=5;
     REPORT_TITLE:=REPORT_TITLE+', �� ���������� �����';
   end;

   if chkUsePalet.Checked then
   begin
     QueryRep1.ParamByname('USE_PALET').asinteger:=1;
     REPORT_TITLE:=REPORT_TITLE+', ������� �� �������';
   end;








   QueryRep1.Open;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='��� ����� ������...';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   BtnOk.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='��!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   btnExcel.Enabled:=true;
   if QueryRep1.eof then messbox('����� ����!',messSystem,48) else begin
   end;

end;

procedure TREPORT_SKLAD_WORK.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
  yy,mm,dd: word;
begin
   decodedate(date(),yy,mm,dd);
   dt1.date:=encodedate(yy,mm,1);
   dt2.date:=incmonth(dt1.date,1)-1;

   tw_group_id:=0;
   tw_group_typ:=3;  //������ ��� ������

  
   
   TW.text:='��� ������';


   s4:='';
   s3:='~';
   for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
   WorkTransaction.Active:=False;
   DualListDialog3.Title:='������ �������';
   DualListDialog3.List1.Clear;
   DualListDialog3.List2.Clear;
   OPEN_SQL(QueryWork,'select SKL_SHORT,SKL_ID from SKL order by SKL_SPEED');
   while not QueryWork.eof do begin
     DualListDialog3.List2.Add(QueryWork.fieldByname('SKL_SHORT').asstring);
     s4:=s4+QueryWork.fieldByname('SKL_SHORT').asstring+',';
     s3:=s3+'~'+QueryWork.fieldByname('SKL_ID').asstring+'~';
     QueryWork.next;
   end;


   if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
   SKL.text:=s4;
   SKL_S:=s3;




end;

procedure TREPORT_SKLAD_WORK.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {���� ����� ������ �������}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {���������� ��������}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TREPORT_SKLAD_WORK.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
  if ParName='USER_NAME' then
    ParValue:=USERFIO;
end;

procedure TREPORT_SKLAD_WORK.BtnPrintClick(Sender: TObject);
begin
     QueryRep1.DisableControls;
     FrReport1.ShowReport;
     QueryRep1.EnableControls;
end;

procedure TREPORT_SKLAD_WORK.QueryRep1AfterOpen(DataSet: TDataSet);
begin
  BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_SKLAD_WORK.QueryRep1CalcFields(DataSet: TDataSet);
begin
    QueryRep1.fieldByname('tw_kwm').asfloat:=QueryRep1.fieldByname('tw_kwm_one').asfloat*QueryRep1.fieldByname('ost_kol').asfloat;
end;

procedure TREPORT_SKLAD_WORK.ExpExcel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
begin


    QueryRep1.First;


    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
//    excel.Visible[0]:=true;
    queryrep1.Last;
    QueryRep1.First;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\����� � ������ ������.xlt', 0);
    v := VarArrayCreate([0, QueryRep1.RecordCount, 0, QueryRep1.FieldCount], varVariant);

    for iRow:=0 to QueryRep1.RecordCount-1 do
    begin
        for iCol:=0 to dbgrid1.FieldCount - 1 do
        begin
        v[iRow, icol] := dbgrid1.Fields[iCol].AsVariant;
        end;
        QueryRep1.Next;
    end;
    QueryRep1.First;

    r:= excel.Range['A1', 'A1'];
    r.Value := REPORT_TITLE;
    r:= excel.Range['A2', 'A2'];
//    r.Value := '������ �������: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
//    tmpstring := '��������� �����' + mes1.text +' '+ label_mes1.caption;
    r.Value := tmpstring;
    r:= excel.Range['A4', 'A4'];

    r:= excel.Range['A5', 'A5'];
    r.value := tmpstring;



    r := excel.Range[excel.Cells.Item[8, 1],
      excel.Cells.Item[QueryRep1.RecordCount +8 - 1,dbgrid1.fieldcount ]];

    r.Value := v;




    try

    r.Borders[xlEdgeTop].LineStyle := xlContinuous;
    r.Borders[xlEdgeTop].Weight := xlThin;
    r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


    r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    r.Borders[xlEdgeBottom].Weight := xlThin;
    r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;

    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;



    r := excel.Range[excel.Cells.Item[emptyParam, 6],
    excel.Cells.Item[emptyParam, 6]].EntireColumn;
    format := QueryRep1WEIGHT1.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 7],
    excel.Cells.Item[emptyParam, 7]].EntireColumn;

    except
    end;


    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_SKLAD_WORK.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_SKLAD_WORK.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TREPORT_SKLAD_WORK.ExpCalc;
var ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
    bounds: array[0..1] of integer;
    dataArrayBounds: array [0..1,0..1] of integer;
//    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    tmpstring: string;
    format: string;
    cel: variant;
    i,j: integer;
begin
// �������� CALC

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\����� � ������ ������.xlt');
     if (VarType(ServiceManager) = varDispatch) then
       Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

  Bounds[0] := 0;
  Bounds[1] := 0;

  ooParams := VarArrayCreate([0, 0], varVariant);
  ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
  ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
  ooValue.Name := 'AsTemplate';
  ooValue.Value := True;
  ooParams[0] := ooValue;


//�������� �������, ���� �������� �����
  Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);

////////////////////////////////////////////


   try
    queryrep1.Last;
    QueryRep1.First;

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=dbgrid1.FieldCount;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=QueryRep1.RecordCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    QueryRep1.First;
    for iRow:=0 to QueryRep1.RecordCount-1 do
    begin
      for iCol:=0 to dbgrid1.FieldCount - 1 do
        v[iCol, iRow] := dbgrid1.Fields[iCol].AsVariant;
      QueryRep1.Next;
    end;
    QueryRep1.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('����1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString(REPORT_TITLE);
    cel := Sheet.GetCellByPosition(0,1);
//    cel.setString('������ �������: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);

//    tmpstring := '��������� ����� ' + mes1.text +' '+ label_mes1.caption;


    cel.setString(tmpstring);
    cel := Sheet.GetCellByPosition(0,3);

    cel := Sheet.GetCellByPosition(0,4);
    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_SKLAD_WORK.btnExcelClick(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel;
  except
    ExpCalc;
  end;
end;

procedure TREPORT_SKLAD_WORK.BitBtn3Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select SKL_SHORT,SKL_ID from SKL order by SKL_SPEED');
     s:='';
     s2:='';
     if DualListDialog3.Execute then begin
        {��������� ������ ��� �������}
        for a:=1 to DualListDialog3.list2.Count do begin
            if QueryWork.Locate('SKL_SHORT',DualListDialog3.List2.Strings[a-1],[])
            then begin
                 s:=s+'~'+QueryWork.fieldByname('SKL_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('SKL_SHORT').asstring+',';
            end;
        end;
        s:=s+'~~';
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        SKL_S:=s;
        skl.text:=s2;
     end;
end;

end.

