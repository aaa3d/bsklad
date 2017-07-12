unit ReportTDMItogPostNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer, ComObj,
  ExtCtrls, RxLookup;

type
  TREPORT_TDM_ITOG_POST_NEW = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    MemReport: TRxMemoryData;
    DsReport: TDataSource;
    QueryRep2: TIBQuery;
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
    DT: TDateEdit;
    MemReportost: TFloatField;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    Label9: TLabel;
    POST_NAME: TEdit;
    DYNPOST: TBitBtn;
    BTN_POST: TBitBtn;
    Panel3: TPanel;
    post1: TRadioButton;
    post2: TRadioButton;
    MemReportTW_SALER_NAME: TStringField;
    MemReportTW_SALER_ID: TIntegerField;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label2: TLabel;
    Mes1: TRxSpinEdit;
    Label_Mes1: TLabel;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure ExpExcel;
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc;
    procedure btnExcelClick(Sender: TObject);
    procedure DYNPOSTClick(Sender: TObject);
    procedure BTN_POSTClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
    post_group_id: integer;
    post_group_typ: integer;
  public
    { Public declarations }
  end;

var
  REPORT_TDM_ITOG_POST_NEW: TREPORT_TDM_ITOG_POST_NEW;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_�������'; //����� �������
implementation

uses DicTowar, WaitForm, DicTwDynGroup, DicKlientDynGroup, DicKlient;

{$R *.DFM}

procedure TREPORT_TDM_ITOG_POST_NEW.BtnOkClick(Sender: TObject);
var
  dt1,dt2:tdatetime;
  pp_typs: string;
begin
   REPORT_TITLE:='����� �������� ����� �� �������� ������� �� ����������� �� ����� '+
   date_sokr(dt.date)+' �� ������ �������: "'+tw.text+'"';
   REPORT_TITLE:=REPORT_TITLE+', ����������� ����� '+
   floattostrf(MES1.value,fffixed,12,0)+
   OKON_CHAR(' ������ ',' ������� ',' ������� ',trunc(MES1.value))+' ����� ';
   DT2:=incmonth(dt.date+1-sekond1,-trunc(mes1.value))-sekond1;
   DT1:=encodedate(1900,1,1);

   REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1)+' - '+date_sokr(dt2)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='������ ������...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;
   ADD_SQL(QueryRep1,'select base_post tw_saler_id, sum(ost_kol*seb) as ost '+
   'from report_itog_tdm_detal_new(:dt1,:dt2,:dtrep,:twtree_id,1,  :pp_typs, :twtree_typ, :post_group_id, :post_group_typ, :frm_id) '+
   ' group by 1 ' +
   ' ');
   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('post_group_id').asinteger:=post_group_id;
   QueryRep1.ParamByname('post_group_typ').asinteger:=post_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
   QueryRep1.ParamByname('FRM_ID').asstring:=FRM.Value;
   pp_typs:='';



   QueryRep1.Open;
   MemReport.EmptyTable;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='��� ����� ������...';
   Wait_Form.Show;
   delay(100);
   while not QueryRep1.eof do begin
     MemReport.Append;
     MemReport.fieldByname('TW_SALER_ID').asinteger:=QueryRep1.fieldByname('TW_SALER_ID').asinteger;
     ADD_SQL(QueryRep2,'select kln_full from kln_data(:kln_id)');
     QueryRep2.ParamByname('kln_id').asinteger:=QueryRep1.fieldByname('TW_SALER_ID').asinteger;
     QueryRep2.Open;
     MemReport.fieldByname('TW_SALER_NAME').asstring:=QueryRep2.fieldByname('kln_full').asstring;
     MemReport.FieldByname('ost').asfloat:=QueryRep1.fieldByname('ost').asfloat;

     MemReport.Post;
     QueryRep1.next;
   end;
   MemReport.first;
   BtnOk.enabled:=true;
   if MemReport.recordcount>0 then BtnPrint.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='��!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
end;

procedure TREPORT_TDM_ITOG_POST_NEW.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //������ ��� ������
   TW.text:='��� ������';
  post_group_id:=0;
  post_group_typ:=4; //��� �������   
   mes1.value:=3;

   mesChange(sender);
   MemFrm.EmptyTable;
   MemFrm.Append;
   MemFrm.fieldByname('FRM_ID').asinteger:=-1;
   MemFrm.fieldByname('FRM_NAME').asstring:='<��� �����>';
   MemFrm.Post;

   MemFrm.Append;
   MemFrm.fieldByname('FRM_ID').asinteger:=0;
   MemFrm.fieldByname('FRM_NAME').asstring:='<�������>';
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


   FRM.Value:=inttostr(GL_FRM_WORK_MODE);
end;

procedure TREPORT_TDM_ITOG_POST_NEW.BtnDicClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_POST_NEW.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_POST_NEW.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_TDM_ITOG_POST_NEW.MesChange(Sender: TObject);
begin
    label_mes1.caption:='�����/������/������� �����';

end;

procedure TREPORT_TDM_ITOG_POST_NEW.ExpExcel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
begin


    memreport.First;


    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
//    excel.Visible[0]:=true;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\����� �� �������� �� ������.xlt', 0);
    v := VarArrayCreate([0, memreport.RecordCount, 0, memreport.FieldCount], varVariant);
    memreport.First;
    for iRow:=0 to memreport.RecordCount-1 do
    begin
        for iCol:=0 to dbgrid1.FieldCount - 1 do
        begin
        v[iRow, icol] := dbgrid1.Fields[iCol].AsVariant;
        end;
        memreport.Next;
    end;
    memreport.First;

    r:= excel.Range['A1', 'A1'];
    r.Value := '����� �������� ����� �� �������� �� ������ �� ����� ' + dt.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := '������ �������: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    tmpstring := '��������� �����'+mes1.text +' '+ label_mes1.caption;

    r.Value := tmpstring;


    r := excel.Range[excel.Cells.Item[5, 1],
      excel.Cells.Item[memreport.RecordCount +5 - 1,dbgrid1.fieldcount ]];

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



    r := excel.Range[excel.Cells.Item[emptyParam, 3],
    excel.Cells.Item[emptyParam, 3]].EntireColumn;
    format := MemReportost.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;



    except
    end;

    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_TDM_ITOG_POST_NEW.BtnDynDicClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_POST_NEW.ExpCalc;
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
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\����� �� �������� �� ������.xlt');
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

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=dbgrid1.FieldCount;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=memreport.RecordCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    memreport.First;
    for iRow:=0 to memreport.RecordCount-1 do
    begin
      for iCol:=0 to dbgrid1.FieldCount - 1 do
        v[iCol, iRow] := dbgrid1.Fields[iCol].AsVariant;
      memreport.Next;
    end;
    memreport.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('����1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString('����� �������� ����� �� �������� �� ������ �� ����� ' + dt.Text);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('������ �������: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);

    tmpstring := '��������� �����' + mes1.text +' '+ label_mes1.caption;

    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+4,dataArrayBounds[1,0], dataArrayBounds[1,1]+4);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_TDM_ITOG_POST_NEW.btnExcelClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_POST_NEW.DYNPOSTClick(Sender: TObject);
begin
     try
       Application.createForm(TDIC_KLIENT_DYN_GROUP,DIC_KLIENT_DYN_GROUP);
     except
       DIC_KLIENT_DYN_GROUP.Visible:=true;
     end;
     DIC_KLIENT_DYN_GROUP.btnSelect.visible:=true;
     if post_group_typ<3 then
      DIC_KLIENT_DYN_GROUP.btnSelect.tag := post_group_id;

     DIC_KLIENT_DYN_GROUP.showmodal;
     if DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      post2.Checked:=true;
      post_name.Text:='* '+ DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      post_group_id:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID;
      post_group_typ:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_KLIENT_DYN_GROUP.Destroy;
end;

procedure TREPORT_TDM_ITOG_POST_NEW.BTN_POSTClick(Sender: TObject);
var fr:integer;
begin
//     DicKlnSet:=2; {����� �������}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= POST_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> POST_NAME.tag then
       begin
//        KLN_NAME.tag:=DIC_KLIENT.tag;
        post_group_id:=DIC_KLIENT.tag;
        if Activ=1 then
          fr:=1
        else
          fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);
        post2.checked:=true;

         QueryWork.Close;
    	 QueryWork.SQL.clear;
         if fr=0 then
         begin
           QueryWork.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
           post_group_typ:=4;
         end
         else
         begin
           QueryWork.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
           post_group_typ:=3;
         end;
    	 QueryWork.Parambyname('KLN_ID').asinteger:=post_group_id;
     	 QueryWork.Open;

         if not QueryWork.eof then
         POST_NAME.text := QueryWork.fieldbyname('KLN_FULL').asstring;
   //      KLN_NAME.text:=inttostr(KLN_NAME.tag);
         QueryWork.Close;
         WorkTransaction.Active:=false;

       end;

     DIC_KLIENT.Destroy;
end;

end.

