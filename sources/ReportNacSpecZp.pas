unit ReportNacSpecZp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, StdCtrls, Mask, ToolEdit,Data1,b_utils,b_dbutils, Db,
  IBCustomDataSet, IBQuery, IBDatabase,WaitForm, FR_Class, FR_DSet,
  FR_DBSet,VclUtils, RxLookup, Buttons, DualList, Excel97, OleServer, ComObj,
  ExtCtrls, RxMemDS;

type
  TReport_nac_spec_zp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    DsReport: TDataSource;
    DbFr1: TfrDBDataSet;
    Rep: TfrReport;
    DualListDialog1: TDualListDialog;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    btnExcel: TButton;
    DualListDialog3: TDualListDialog;
    FRM: TRxDBLookupCombo;
    Label10: TLabel;
    QueryReportSHOP_ID: TIntegerField;
    QueryReportSHOP_NAME: TIBStringField;
    QueryReportRNTYP_ID: TIntegerField;
    QueryReportRNTYP_SHORT: TIBStringField;
    QueryReportDELTA1: TFloatField;
    QueryReportDELTA2: TFloatField;
    QueryReportDELTA3: TFloatField;
    QueryReportSEB_SUMM: TFloatField;
    QueryReportSPEC_SUMM: TFloatField;
    QueryReportREAL_SUMM: TFloatField;
    QueryReportNAC_SUMM: TFloatField;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    QueryReportSPEC_NDS_SUMM: TFloatField;
    QueryReportREAL_NDS_SUMM: TFloatField;
    chkShowTabel: TCheckBox;
    QueryReportSPEC2_SUMM: TFloatField;
    QueryReportSPEC2_NDS_SUMM: TFloatField;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnTW: TSpeedButton;
    BtnDynDic: TSpeedButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    TW: TEdit;
    Panel1: TPanel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure RepGetValue(const ParName: String; var ParValue: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure Save;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExpCalc;
    procedure OpenQuery;
    procedure Button1Click(Sender: TObject);
    procedure TW1Click(Sender: TObject);
    procedure BtnTWClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ExpExcel;
    procedure btnExcelClick(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
    kln_group_id: integer;
    kln_group_typ:integer;
    post_group_id, post_group_typ: integer;
  public
    { Public declarations }
  end;

var
  Report_nac_spec_zp: TReport_nac_spec_zp;
  Title:string;
  Title2:string;
  SHOP_S:ansistring;
  RNTYP_S:ansistring;
  PT_RNTYP:integer;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов  

implementation

uses DicTowar, DicTwDynGroup, DicKlientDynGroup, DicKlient;

{$R *.DFM}

procedure TReport_nac_spec_zp.Save;
begin
     {Сохраняем установки}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','REPORT_POST_FIN');
        IBSAVE_ADD('CFG_SET2',USERID);
        IBSAVE_ADD('CFG_SET1',3);
        IBSAVE_ADD('CFG_VALUE',RNTYP_S);
        IBSAVE_DOC('CFG',PT_RNTYP);
        Datamodule1.IBTransaction2.Commit;
     Except
           Datamodule1.IBTransaction2.RollBack;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TReport_nac_spec_zp.FormShow(Sender: TObject);
var
  dd,mm,yy:word;
  s3,s4:ansistring;
  a:integer;
begin
   decodedate(date(),yy,mm,dd);
   dt1.date:=encodedate(yy,mm,1);
   dt2.date:=incmonth(dt1.date,1)-1;



{   SHOP.value:=inttostr(shopid);
   SHOP1.checked:=true;
   SHOP2.Onclick(Sender);
}
   PT_RNTYP:=-1;
   ADD_SQL(QueryWork,'select * from cfg where cfg_name="REPORT_POST_FIN" and CFG_SET2=:US_ID');
   QueryWork.ParamByname('US_ID').asinteger:=USERID;
   QueryWork.open;
     if not QueryWork.eof then begin
        if QueryWork.Locate('CFG_SET1',3,[]) then begin
           RNTYP_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
           PT_RNTYP:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
     end;



   {Заполняем DualListDialog}
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
     s3:=s3+'%';
     RNTYP_S := s3;
//***********

     {Заполняем DualListDialog3, список магазинов}
     s4:='';
     s3:='%';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     DualListDialog3.Title:='Список магазинов';
     DualListDialog3.List1.Clear;
     DualListDialog3.List2.Clear;
     OPEN_SQL(QueryWork,'select SHOP_NAME,SHOP_ID,VISIBLE from SHOP where visible=1 order by SHOP_ID');
     while not QueryWork.eof do begin
       DualListDialog3.List2.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
       s4:=s4+QueryWork.fieldByname('SHOP_NAME').asstring+',';
       s3:=s3+'%'+QueryWork.fieldByname('SHOP_ID').asstring+'%';
       QueryWork.next;
     end;


     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit2.text:=s4;
     SHOP_S:=s3;

//***********




      MemFrm.EmptyTable;
      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=-1;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;

      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Розница>';
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

  tw_group_id:=0;
  tw_group_typ:=3;  //просто все товары


end;

procedure TReport_nac_spec_zp.Button2Click(Sender: TObject);
begin
    close;
end;
procedure TReport_nac_spec_zp.OpenQuery;
//procedure TReport_Post_fin.Button1Click(Sender: TObject);
var
  SQL:string;
  s,s2:string;
begin
{
select shop_id,  shop_name, rntyp_id, rntyp_short,
    sum(delta1), sum(delta2), sum(delta3),
    sum(seb_summ), sum(spec_summ), sum(real_summ), sum(nac_summ)
    from report_nac_spec_detail(:dt1, :dt2)
    group by 1,2
}
   if (frm.DisplayValue = '')then
   begin
     ShowMessage('Укажите фирму.');
     exit;
   end;
   // строим отчет


   Title:='Комплексный отчет о наценке по фирме '+frm.Text+' за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
   title:=title+', по магазинам: '+Edit2.text;
   title:=title+', Группа товаров: '+TW.text;

   title := title + ', виды реализации: '+Edit1.Text;




   QueryReport.parambyname('FRM_id').asstring:=frm.Value;
   QueryReport.parambyname('shops').asstring:=SHOP_S;
   QueryReport.parambyname('dt1').asdatetime:=dt1.Date;
   QueryReport.parambyname('dt2').asdatetime:=dt2.Date+1-sekond1;
   QueryReport.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
   if TW1.checked then QueryReport.ParamByname('TWTREE_ID').asinteger:=0
                        else QueryReport.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
   if chkShowTabel.checked then QueryReport.ParamByname('SHOW_TABEL').asinteger:=1
                        else QueryReport.ParamByname('SHOW_TABEL').asinteger:=0;

   QueryReport.parambyname('RNTYPS').asstring := RNTYP_S;
   if CheckBox1.Checked then
     QueryReport.ParamByname('price_met').asinteger:=1
   else
     QueryReport.ParamByname('price_met').asinteger:=0;




   Wait_form.StatusBar1.panels[0].text:='Запрос данных.Ждите...';
   Wait_form.Gauge1.Progress:=10;
   Wait_form.Show;
   delay(1);
   QueryReport.Open;
   Wait_form.Gauge1.Progress:=100;
   Wait_form.Show;
   delay(100);
   Wait_form.Hide;
   if QueryReport.eof then
   begin
   messbox('Отчет пуст!',MessSystem,48);
   QueryReport.close;
   end;
//    else begin
//      REP.showReport;
//   end;
//   QueryReport.close;
end;

procedure TReport_nac_spec_zp.RepGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='USERFIO' then ParValue:=USERFIO;
    if ParName='REPORT_TITLE' then ParValue:=TITLE;
    if ParName='TITLE2' then ParValue:=TITLE2;
    if ParName='price_name' then
    begin
      ParValue:='спеццены';
      if CheckBox1.checked then
       ParValue:='крупнооптовой';
    end
end;

procedure TReport_nac_spec_zp.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TReport_nac_spec_zp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Save();
end;

procedure TReport_nac_spec_zp.ExpExcel;
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


    OpenQuery;
    if not (QueryReport.State in [dsBrowse]) then
      exit;





    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;

    QueryReport.last;
    QueryReport.First;



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\комплексный отчет.XLT', 0);


    v := VarArrayCreate([0, QueryReport.RecordCount+1, 0, 9], varVariant);

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := QueryReport.fieldbyname('SHOP_NAME').asVariant;
            v[iRow, 1] := QueryReport.fieldbyname('RNTYP_SHORT').asVariant;
            v[iRow, 2] := QueryReport.fieldbyname('DELTA1').asVariant;
            v[iRow, 3] := QueryReport.fieldbyname('DELTA2').asVariant;
            v[iRow, 4] := QueryReport.fieldbyname('DELTA3').asVariant;
            v[iRow, 5] := QueryReport.fieldbyname('SEB_SUMM').asVariant;
            v[iRow, 6] := QueryReport.fieldbyname('SPEC_SUMM').asVariant;
            v[iRow, 7] := QueryReport.fieldbyname('SPEC_NDS_SUMM').asVariant;
            v[iRow, 8] := QueryReport.fieldbyname('REAL_SUMM').asVariant;
            v[iRow, 9] := QueryReport.fieldbyname('REAL_NDS_SUMM').asVariant;

        end;
        QueryReport.Next;
    end;



    r:= excel.Range['A1', 'A1'];
    r.Value := Title;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Дата построения: '+ datetimetostr(now);
//    r:= excel.Range['A4', 'A4'];
//    r.Value := Title2;



//    v[QueryReport.RecordCount, 0] := 'Итого: ';


    r := excel.Range[excel.Cells.Item[6, 1],
        excel.Cells.Item[QueryReport.RecordCount + 6- 1,10 ]];
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
    QueryReport.Close;
end;

procedure TReport_nac_spec_zp.Button1Click(Sender: TObject);
begin
 OpenQuery;
 if not (QueryReport.State in [dsBrowse]) then
        exit;

  REP.showReport;
  QueryReport.close;
end;

procedure TReport_nac_spec_zp.TW1Click(Sender: TObject);
begin
//        TW.enabled:=TW2.checked;
//        BtnTW.Enabled:=TW2.checked;
//        BtnDynDic.Enabled:=TW2.checked;
        if TW1.Checked=true
        then
        begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
        end;

end;

procedure TReport_nac_spec_zp.BtnTWClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw2.Checked:=true;
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TReport_nac_spec_zp.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw2.Checked:=true;
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TReport_nac_spec_zp.BitBtn3Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select SHOP_NAME,SHOP_ID from SHOP order by SHOP_ID');
     s:='';
     s2:='';
     if DualListDialog3.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog3.list2.Count do begin
            if QueryWork.Locate('SHOP_NAME',DualListDialog3.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('SHOP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('SHOP_NAME').asstring+',';
            end;
        end;
        s:=s+'%%';
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        SHOP_S:=s;
        Edit2.text:=s2;
     end;


end;

procedure TReport_nac_spec_zp.ExpCalc;
var ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
    bounds: array[0..1] of integer;
    dataArrayBounds: array [0..1,0..1] of integer;
//    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    dbl: variant;
    cel: variant;
    ddd: variant;
    d: double;
    i,j: integer;
    MyStruct: variant;
begin
// Открытие CALC
   OpenQuery;
   if not (QueryReport.State in [dsBrowse]) then
     exit;

   QueryReport.Last;
   QueryReport.First;

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\комплексный отчет.xlt');
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


//Загрузка шаблона, пока работает криво
  Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);

////////////////////////////////////////////


   try

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=9;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=QueryReport.RecordCount+1000;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[0,iRow] := QueryReport.fieldbyname('SHOP_NAME').asVariant;
            v[1,iRow] := QueryReport.fieldbyname('RNTYP_SHORT').asVariant;
            v[2,iRow] := QueryReport.fieldbyname('DELTA1').asVariant;
            v[3,iRow] := QueryReport.fieldbyname('DELTA2').asVariant;
            v[4,iRow] := QueryReport.fieldbyname('DELTA3').asVariant;
            v[5,iRow] := QueryReport.fieldbyname('SEB_SUMM').asVariant;
            v[6,iRow] := QueryReport.fieldbyname('SPEC_SUMM').asVariant;
            v[7,iRow] := QueryReport.fieldbyname('SPEC_NDS_SUMM').asVariant;
            v[8,iRow] := QueryReport.fieldbyname('REAL_SUMM').asVariant;
            v[9,iRow] := QueryReport.fieldbyname('REAL_NDS_SUMM').asVariant;

        end;
        QueryReport.Next;
    end;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString(Title);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Дата построения: '+ datetimetostr(now));
    cel := Sheet.GetCellByPosition(0,3);
    cel.setString(Title2);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+5,dataArrayBounds[1,0], dataArrayBounds[1,1]+5);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;

end;

procedure TReport_nac_spec_zp.btnExcelClick(Sender: TObject);
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

procedure TReport_nac_spec_zp.BTN_KLNClick(Sender: TObject);
var fr:integer;
begin
end;

end.
