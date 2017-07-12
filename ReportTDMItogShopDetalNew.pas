unit ReportTDMItogShopDetalNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, RxLookup, ComCtrls, excel2000, OleServer, ComObj,
  ExtCtrls;

type
  TREPORT_TDM_ITOG_SHOP_DETAL_NEW = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    Label3: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    BtnPrint: TButton;
    frReport2: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Label1: TLabel;
    DT: TDateEdit;
    Label4: TLabel;
    SKL: TRxDBLookupCombo;
    DicTransaction: TIBTransaction;
    DicSKL: TIBQuery;
    DsSKL: TDataSource;
    DicSKLSKL_ID: TIntegerField;
    DicSKLSKL_FULL: TIBStringField;
    DsReport: TDataSource;
    StatusBar1: TStatusBar;
    btnExcel: TButton;
    DBGrid1: TDBGrid;
    frReport1: TfrReport;
    BtnDynDic: TSpeedButton;
    Label9: TLabel;
    Panel3: TPanel;
    post1: TRadioButton;
    post2: TRadioButton;
    POST_NAME: TEdit;
    DYNPOST: TBitBtn;
    BTN_POST: TBitBtn;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label2: TLabel;
    Mes1: TRxSpinEdit;
    Label_Mes1: TLabel;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1SKL_ID: TIntegerField;
    QueryRep1TW_KOL: TFloatField;
    QueryRep1OST: TFloatField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1TREE_ID: TIntegerField;
    QueryRep1TWTREE_FULL: TIBStringField;
    QueryRep1TW_KWM_ONE: TFloatField;
    QueryRep1TW_KWM: TFloatField;
    Label5: TLabel;
    mes2: TRxSpinEdit;
    Label6: TLabel;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure QueryRep1CalcFields(DataSet: TDataSet);
    procedure QueryRep1AfterScroll(DataSet: TDataSet);
    procedure ExpExcel;
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure DBGrid1DblClick(Sender: TObject);
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
  REPORT_TDM_ITOG_SHOP_DETAL_NEW: TREPORT_TDM_ITOG_SHOP_DETAL_NEW;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicTwDynGroup, DicKlientDynGroup, DicKlient;

{$R *.DFM}

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.BtnOkClick(Sender: TObject);
var
  dt1,dt2:tdatetime;
  pp_typs: string;
begin
   REPORT_TITLE:='Новый подробный отчет об остатках товаров на складе "'+skl.text+'", на конец '+
   date_sokr(dt.date)+' по группе товаров: "'+tw.text+'"';
   REPORT_TITLE:=REPORT_TITLE+', закупленные более '+
   floattostrf(MES1.value,fffixed,12,0)+
   OKON_CHAR(' месяца ',' месяцев ',' месяцев ',trunc(MES1.value))+' назад ';
   DT2:=incmonth(dt.date+1-sekond1,-trunc(mes1.value))-sekond1;
   DT1:=incmonth(dt.date+1-sekond1,-trunc(mes2.value))-sekond1;
//   DT1:=encodedate(1900,1,1);
   REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1)+' - '+date_sokr(dt2)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;

   ADD_SQL(QueryRep1,'select * from REPORT_ITOG_TDM_SHOP_DETAL_NEW '+
   '(:DT1,:DT2,:DTREP,:TWTREE_ID,:SKL_ID2, :pp_typs, :TWTREE_TYP, :post_group_id, :post_group_typ, :frm_id) ');
   QueryRep1.SQL.Add(' order by twtree_full,tw_nam');
   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('post_group_id').asinteger:=post_group_id;
   QueryRep1.ParamByname('post_group_typ').asinteger:=post_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
   QueryRep1.ParamByname('skl_id2').asinteger:=strtoint('0'+skl.value);
   QueryRep1.ParamByname('FRM_ID').asstring:=FRM.Value;
   pp_typs:='';


   QueryRep1.Open;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Ок!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   DicTransaction.Active:=False;
   DicSKL.close;
   DicSKL.open;
   SKL.value:=inttostr(default_sklad);
   dt.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   post_group_id:=0;
   post_group_typ:=4; //все клиенты
   TW.text:='Все товары';
   mes1.value:=6;
   mesChange(sender);
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
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.MesChange(Sender: TObject);
begin
     label_mes1.caption:='месяц/месяца/месяцев назад';

end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.QueryRep1AfterOpen(
  DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:='Группа товаров: '+QueryRep1.fieldByname('twtree_full').asstring;
   BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.QueryRep1CalcFields(
  DataSet: TDataSet);
begin
   QueryRep1.fieldByname('tw_kwm').asfloat:=QueryRep1.fieldByname('tw_kwm_one').asfloat*QueryRep1.fieldByname('tw_kol').asfloat;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.QueryRep1AfterScroll(
  DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:='Группа товаров: '+QueryRep1.fieldByname('twtree_full').asstring;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.ExpExcel;
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
    QueryRep1.last;
    queryrep1.First;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет об остатках одного склада.xlt', 0);
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
    r.Value := 'Новый подробный отчет об остатках товаров на одном складе на конец ' + dt.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    tmpstring := 'Закуплены более' + mes1.text +' '+ label_mes1.caption;
    r.Value := tmpstring;
    r:= excel.Range['A4', 'A4'];
    r.Value := 'По складу: '+ skl.Text;





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
    format := QueryRep1Ost.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    except
    end;


    except
    freeandnil(excel);
    end;

    Excel.Visible[0]:=true;
    freeandnil(excel);



end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.frReport1GetValue(
  const ParName: String; var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.BtnDynDicClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.ExpCalc;
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
// Открытие CALC

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет об остатках одного склада.xlt');
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
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString('Новый подробный отчет об остатках товаров на одном складе на конец ' + dt.Text);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Группа товаров: '+ TW.Text);

    cel := Sheet.GetCellByPosition(0,2);
    tmpstring := 'Закуплены более' + mes1.text +' '+ label_mes1.caption;
    cel.setString(tmpstring);

    cel := Sheet.GetCellByPosition(0,3);
    cel.setString('По складу: '+ skl.Text);

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

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.btnExcelClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.DYNPOSTClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL_NEW.BTN_POSTClick(Sender: TObject);
var fr:integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
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

