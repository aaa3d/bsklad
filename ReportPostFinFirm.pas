unit ReportPostFinFirm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, StdCtrls, Mask, ToolEdit,Data1,b_utils,b_dbutils, Db,
  IBCustomDataSet, IBQuery, IBDatabase,WaitForm, FR_Class, FR_DSet,
  FR_DBSet,VclUtils, RxLookup, Buttons, DualList, Excel97, OleServer, ComObj,
  ExtCtrls;

type
  TReport_Post_fin_firm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    USL1: TCheckBox;
    USL2: TCheckBox;
    US1: TComboBox;
    SEL1: TComboBox;
    VAL1: TRxCalcEdit;
    Lab1: TLabel;
    US2: TComboBox;
    SEL2: TComboBox;
    VAL2: TRxCalcEdit;
    Lab2: TLabel;
    Label5: TLabel;
    SEL3: TComboBox;
    Button1: TButton;
    Button2: TButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    DsReport: TDataSource;
    QueryReportKLN_ID: TIntegerField;
    QueryReportKLN_FULL: TIBStringField;
    QueryReportOB_SUM: TFloatField;
    QueryReportOB_PERC: TFloatField;
    QueryReportOB_NDS: TFloatField;
    QueryReportOB_NSP: TFloatField;
    QueryReportSEB: TFloatField;
    QueryReportNDS: TFloatField;
    QueryReportNAC: TFloatField;
    QueryReportNAC_PERC: TFloatField;
    QueryReportRENT1: TFloatField;
    QueryReportRENT2: TFloatField;
    QueryReportNAC1: TFloatField;
    DbFr1: TfrDBDataSet;
    Rep: TfrReport;
    Label3: TLabel;
    VID: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DualListDialog1: TDualListDialog;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    btnExcel: TButton;
    TW: TEdit;
    Label7: TLabel;
    BtnTW: TSpeedButton;
    Panel1: TPanel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    BtnDynDic: TSpeedButton;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    DualListDialog3: TDualListDialog;
    KLN_NAME: TEdit;
    DynKLN: TBitBtn;
    BTN_KLN: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    POST_NAME: TEdit;
    DYNPOST: TBitBtn;
    BTN_POST: TBitBtn;
    Panel2: TPanel;
    kln1: TRadioButton;
    kln2: TRadioButton;
    Panel3: TPanel;
    post1: TRadioButton;
    post2: TRadioButton;
    FRM: TRxDBLookupCombo;
    Label10: TLabel;
    procedure SEL1Change(Sender: TObject);
    procedure SEL2Change(Sender: TObject);
    procedure SEL3Change(Sender: TObject);
    procedure USL1Click(Sender: TObject);
    procedure USL2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure RepGetValue(const ParName: String; var ParValue: Variant);
    procedure VIDChange(Sender: TObject);
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
    procedure kln1Click(Sender: TObject);
    procedure DynKLNClick(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure post1Click(Sender: TObject);
    procedure DYNPOSTClick(Sender: TObject);
    procedure BTN_POSTClick(Sender: TObject);
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
  Report_Post_fin_firm: TReport_Post_fin_firm;
  Title:string;
  Title2:string;
  SHOP_S:ansistring;
  RNTYP_S:ansistring;
  PT_RNTYP:integer;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов  

implementation

uses DicTowar, DicTwDynGroup, DicKlientDynGroup, DicKlient;

{$R *.DFM}

procedure TReport_Post_fin_firm.Save;
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

procedure TReport_Post_fin_firm.SEL1Change(Sender: TObject);
begin
   if SEL1.itemindex<0 then SEL1.itemindex:=0;
   if SEL1.itemindex in [1,7,8,9,10] then lab1.Caption:='%'
                                     else lab1.Caption:='Руб.';
end;

procedure TReport_Post_fin_firm.SEL2Change(Sender: TObject);
begin
   if SEL2.itemindex<0 then SEL2.itemindex:=0;
   if SEL2.itemindex in [1,7,8,9,10] then lab2.Caption:='%'
                                     else lab2.Caption:='Руб.';
end;

procedure TReport_Post_fin_firm.SEL3Change(Sender: TObject);
begin
   if SEL3.itemindex<0 then SEL3.itemindex:=0;
end;

procedure TReport_Post_fin_firm.USL1Click(Sender: TObject);
begin
    SEL1.enabled:=USL1.checked;
    US1.enabled:=USL1.checked;
    VAL1.enabled:=USL1.checked;
    LAB1.Enabled:=USL1.checked;
    if not USL1.checked then begin
       USL2.checked:=false;
       USL2.enabled:=false;
    end else USL2.enabled:=true;
    USL2.onClick(Sender);
end;

procedure TReport_Post_fin_firm.USL2Click(Sender: TObject);
begin
    SEL2.enabled:=USL2.checked;
    US2.enabled:=USL2.checked;
    VAL2.enabled:=USL2.checked;
    LAB2.Enabled:=USL2.checked;
end;

procedure TReport_Post_fin_firm.FormShow(Sender: TObject);
var
  dd,mm,yy:word;
  s3,s4:ansistring;
  a:integer;
begin
   decodedate(date(),yy,mm,dd);
   dt1.date:=encodedate(yy,mm,1);
   dt2.date:=incmonth(dt1.date,1)-1;
   VID.itemindex:=0;
   USL1.checked:=False;
   USL2.checked:=False;
   SEL1.itemindex:=0;
   SEL2.itemindex:=1;
   SEL3.itemindex:=0;
   US1.itemindex:=0;
   US2.itemindex:=0;
   VAL1.value:=0;
   VAL2.value:=0;
   SEL1.onchange(Sender);
   SEL2.onchange(Sender);
   Usl2.onclick(Sender);
   Usl1.onclick(Sender);

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


  tw_group_id:=0;
  tw_group_typ:=3;  //просто все товары
  kln_group_id:=0;
  kln_group_typ:=4; //все клиенты
  post_group_id:=0;
  post_group_typ:=4; //все клиенты

end;

procedure TReport_Post_fin_firm.Button2Click(Sender: TObject);
begin
    close;
end;
procedure TReport_Post_fin_firm.OpenQuery;
//procedure TReport_Post_fin.Button1Click(Sender: TObject);
var
  SQL:string;
  s,s2:string;
begin
   if (frm.DisplayValue = '')then
   begin
     ShowMessage('Укажите фирму.');
     exit;
   end;
   // строим отчет
   case vid.itemindex of
     0: begin
           SQL:='select * from report_new_post_2(:FRM,:dt1,:dt2,:shop, :RNTYPS, :TWTREE_ID, :TYP, :KLNID, :TYP_KLN, :POSTID, :POST_TYP) ';
           Title:='Финансовые показатели продаж по фирме '+frm.Text+', по поставщикам за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
           TITLE2:='Поставщик';
        end;
     1: begin
           SQL:='select * from report_new_klient_2(:FRM,:dt1,:dt2,:shop, :RNTYPS, :TWTREE_ID, :TYP, :KLNID, :TYP_KLN, :POSTID, :POST_TYP) ';
           Title:='Финансовые показатели продаж по фирме '+frm.Text+', по покупателям за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
           TITLE2:='Покупатель';
        end;
     2: begin
           SQL:='select * from report_new_shop_2(:FRM,:dt1,:dt2,:shop, :RNTYPS, :TWTREE_ID, :TYP, :KLNID, :TYP_KLN, :POSTID, :POST_TYP) ';
           Title:='Финансовые показатели продаж по фирме '+frm.Text+', по магазинам за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
           TITLE2:='магазин';
        end;
     3: begin
           SQL:='select * from report_new_rntyp_2(:FRM,:dt1,:dt2,:shop, :RNTYPS, :TWTREE_ID, :TYP, :KLNID, :TYP_KLN, :POSTID, :POST_TYP) ';
           Title:='Финансовые показатели продаж по фирме '+frm.Text+', по типам расходных накладных за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
           TITLE2:='Тип накладной';
        end;
   end;
//   if shop2.checked then title:=title+', только по магазину '+shop.text;
   title:=title+', по магазинам: '+Edit2.text;

   title := title + ', виды реализации: '+Edit1.Text;
   title := title + ', клиенты: '+kln_name.Text;
   title := title + ', поставщики: '+post_name.Text;
   if USL1.checked then begin
      if US1.Itemindex=0 then s:='>' else s:='<';
      if US1.Itemindex=0 then s2:='более ' else s2:='менее ';
      case SEL1.ItemIndex of
         0: begin // Обороты продаж
               sql:=sql+' where ob_sum'+s+':val1';
               title:=title+' с оборотами '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         1: begin // Доля оборота
               sql:=sql+' where ob_perc'+s+':val1';
               title:=title+' с долей товарооборота в общей сумме  '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         2: begin // Сумма НДС продаж
               sql:=sql+' where ob_nds'+s+':val1';
               title:=title+' с суммой НДС продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         3: begin // Сумма НП продаж
               sql:=sql+' where ob_nsp'+s+':val1';
               title:=title+' с суммой НП '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         4: begin // Себестоимость продаж
               sql:=sql+' where seb'+s+':val1';
               title:=title+' с себестоимостью проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         5: begin // НДС закупки проданных товаров
               sql:=sql+' where nds'+s+':val1';
               title:=title+' с НДС закупки проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         6: begin // Сумма наценки
               sql:=sql+' where nac'+s+':val1';
               title:=title+' с наценкой '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         7: begin // Доля наценки
               sql:=sql+' where nac_perc'+s+':val1';
               title:=title+' с долей наценки в общей сумме наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         8: begin // Рентабельность продаж
               sql:=sql+' where rent1'+s+':val1';
               title:=title+' с рентабельностью продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         9: begin // Рентабельность продукции
               sql:=sql+' where nac1'+s+':val1';
               title:=title+' с рентабельностью продукции '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
      end;
   end;
   if USL2.checked then begin
      if US2.Itemindex=0 then s:='>' else s:='<';
      if US2.Itemindex=0 then s2:='более ' else s:='менее ';
      case SEL2.ItemIndex of
         0: begin // Обороты продаж
               sql:=sql+' and ob_sum'+s+':val1';
               title:=title+' с оборотами '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         1: begin // Доля оборота
               sql:=sql+' and ob_perc'+s+':val1';
               title:=title+' и долей товарооборота в общей сумме  '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         2: begin // Сумма НДС продаж
               sql:=sql+' and ob_nds'+s+':val1';
               title:=title+' и суммой НДС продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         3: begin // Сумма НП продаж
               sql:=sql+' and ob_nsp'+s+':val1';
               title:=title+' и суммой НП '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         4: begin // Себестоимость продаж
               sql:=sql+' and seb'+s+':val1';
               title:=title+' и себестоимостью проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         5: begin // НДС закупки проданных товаров
               sql:=sql+' and nds'+s+':val1';
               title:=title+' и НДС закупки проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         6: begin // Сумма наценки
               sql:=sql+' and nac'+s+':val1';
               title:=title+' и наценкой '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         7: begin // Доля наценки
               sql:=sql+' and nac_perc'+s+':val1';
               title:=title+' и долей наценки в общей сумме наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         8: begin // Рентабельность продаж
               sql:=sql+' and rent1'+s+':val1';
               title:=title+' и рентабельностью продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         9: begin // Рентабельность продукции
               sql:=sql+' and nac1'+s+':val1';
               title:=title+' и рентабельностью продукции '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
      end;
   end;
   sql:=sql+' order by ';
   case SEL3.ItemIndex of
         0: begin
                title:=title+', Отчет упорядочен по сумме оборотов'; // Обороты продаж
                sql:=sql+'ob_sum';
            end;
         1: begin
                title:=title+', Отчет упорядочен по доле оборотов';// Доля оборота
                sql:=sql+'ob_perc';
            end;
         2: begin
                title:=title+', Отчет упорядочен по сумме НДС продаж';// Сумма НДС продаж
                sql:=sql+'ob_nds';
            end;
         3: begin
                title:=title+', Отчет упорядочен по сумме НП продаж';// Сумма НП продаж
                sql:=sql+'ob_nsp';
            end;
         4: begin
                title:=title+', Отчет упорядочен по сумме себестоимости продаж';// Себестоимость продаж
                sql:=sql+'seb';
            end;
         5: begin
                title:=title+', Отчет упорядочен по НДС закупки проданного товара';// НДС закупки проданных товаров
                sql:=sql+'nds';
            end;
         6: begin
                title:=title+', Отчет упорядочен по сумме наценки в рублях';// Сумма наценки
                sql:=sql+'nac';
            end;
         7: begin
                title:=title+', Отчет упорядочен по доле наценки';// Доля наценки
                sql:=sql+'nac_perc';
            end;
         8: begin
                title:=title+', Отчет упорядочен по % рентабельности продаж';// Рентабельность продаж
                sql:=sql+'rent1';
            end;
         9: begin
                title:=title+', Отчет упорядочен по % рентабельности продукции';// Рентабельность продукции
                sql:=sql+'nac1';
            end;
         10: begin
                title:=title+', Отчет упорядочен по Наименованию'; //Наименование
                sql:=sql+'kln_full';
            end;
      end;
   sql:=sql+' desc';
   ADD_SQL(QueryReport,SQL);
//   if SHOP1.checked then QueryReport.parambyname('shop').asinteger:=0
  // else QueryReport.parambyname('shop').asinteger:=strtoint('0'+shop.value);
   QueryReport.parambyname('FRM').asstring:=frm.Value;
   QueryReport.parambyname('shop').asstring:=SHOP_S;
   QueryReport.parambyname('dt1').asdatetime:=dt1.Date;
   QueryReport.parambyname('dt2').asdatetime:=dt2.Date+1-sekond1;
   if USL1.checked then QueryReport.parambyname('val1').asfloat:=val1.value;
   if USL2.checked then QueryReport.parambyname('val2').asfloat:=val2.value;
   QueryReport.ParamByname('TYP').asinteger:=tw_group_typ;
   if TW1.checked then QueryReport.ParamByname('TWTREE_ID').asinteger:=0
                        else QueryReport.ParamByname('TWTREE_ID').asinteger:=tw_group_id;

   QueryReport.parambyname('RNTYPS').asstring := RNTYP_S;
   QueryReport.ParamByname('KLNID').asinteger:=kln_group_id;
   QueryReport.ParamByname('TYP_KLN').asinteger:=kln_group_typ;
   QueryReport.ParamByname('POSTID').asinteger:=post_group_id;
   QueryReport.ParamByname('POST_TYP').asinteger:=post_group_typ;
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

procedure TReport_Post_fin_firm.RepGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='USERFIO' then ParValue:=USERFIO;
    if ParName='REPORT_TITLE' then ParValue:=TITLE;
    if ParName='TITLE2' then ParValue:=TITLE2;
end;

procedure TReport_Post_fin_firm.VIDChange(Sender: TObject);
begin
   if VID.itemindex<0 then VID.itemindex:=0;
end;

procedure TReport_Post_fin_firm.BitBtn1Click(Sender: TObject);
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

procedure TReport_Post_fin_firm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Save();
end;

procedure TReport_Post_fin_firm.ExpExcel;
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



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\финансовые показатели продаж.XLT', 0);


    v := VarArrayCreate([0, QueryReport.RecordCount+1, 0, 11], varVariant);

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := QueryReport.fieldbyname('KLN_FULL').asVariant;
            v[iRow, 1] := QueryReport.fieldbyname('OB_SUM').asVariant;
            v[iRow, 2] := QueryReport.fieldbyname('OB_PERC').asVariant;
            v[iRow, 3] := QueryReport.fieldbyname('OB_NDS').asVariant;
            v[iRow, 4] := QueryReport.fieldbyname('OB_NSP').asVariant;
            v[iRow, 5] := QueryReport.fieldbyname('SEB').asVariant;
            v[iRow, 6] := QueryReport.fieldbyname('NDS').asVariant;
            v[iRow, 7] := QueryReport.fieldbyname('NAC').asVariant;
            v[iRow, 8] := QueryReport.fieldbyname('NAC_PERC').asVariant;
            v[iRow, 9] := QueryReport.fieldbyname('NAC1').asVariant;
            v[iRow, 10] := QueryReport.fieldbyname('RENT1').asVariant;
        end;
        QueryReport.Next;
    end;



    r:= excel.Range['A1', 'A1'];
    r.Value := Title;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Дата построения: '+ datetimetostr(now);
    r:= excel.Range['A4', 'A4'];
    r.Value := Title2;



//    v[QueryReport.RecordCount, 0] := 'Итого: ';


    r := excel.Range[excel.Cells.Item[6, 1],
        excel.Cells.Item[QueryReport.RecordCount + 6- 1,11 ]];
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

procedure TReport_Post_fin_firm.Button1Click(Sender: TObject);
begin
 OpenQuery;
 if not (QueryReport.State in [dsBrowse]) then
        exit;

  REP.showReport;
  QueryReport.close;
end;

procedure TReport_Post_fin_firm.TW1Click(Sender: TObject);
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

procedure TReport_Post_fin_firm.BtnTWClick(Sender: TObject);
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

procedure TReport_Post_fin_firm.BtnDynDicClick(Sender: TObject);
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

procedure TReport_Post_fin_firm.BitBtn3Click(Sender: TObject);
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

procedure TReport_Post_fin_firm.ExpCalc;
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
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\финансовые показатели продаж.xlt');
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
    dataArrayBounds[1,0]:=11;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=QueryReport.RecordCount+1000;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    for iRow:=0 to QueryReport.RecordCount-1 do
    begin


        begin
            v[0,iRow] := QueryReport.fieldbyname('KLN_FULL').asVariant;
            v[1,iRow] := QueryReport.fieldbyname('OB_SUM').asVariant;
            v[2,iRow] := QueryReport.fieldbyname('OB_PERC').asVariant;
            v[3,iRow] := QueryReport.fieldbyname('OB_NDS').asVariant;
            v[4,iRow] := QueryReport.fieldbyname('OB_NSP').asVariant;
            v[5,iRow] := QueryReport.fieldbyname('SEB').asVariant;
            v[6,iRow] := QueryReport.fieldbyname('NDS').asVariant;
            v[7,iRow] := QueryReport.fieldbyname('NAC').asVariant;
            v[8,iRow] := QueryReport.fieldbyname('NAC_PERC').asVariant;
            v[9,iRow] := QueryReport.fieldbyname('NAC1').asVariant;
            v[10,iRow] := QueryReport.fieldbyname('RENT1').asVariant;
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

procedure TReport_Post_fin_firm.btnExcelClick(Sender: TObject);
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

procedure TReport_Post_fin_firm.kln1Click(Sender: TObject);
begin
   if kln1.Checked=true
     then
     begin
          KLN_NAME.text:= 'Все клиенты';
          kln_group_id:=0;
          kln_group_typ:=4;
     end;

end;

procedure TReport_Post_fin_firm.DynKLNClick(Sender: TObject);
begin
     try
       Application.createForm(TDIC_KLIENT_DYN_GROUP,DIC_KLIENT_DYN_GROUP);
     except
       DIC_KLIENT_DYN_GROUP.Visible:=true;
     end;
     DIC_KLIENT_DYN_GROUP.btnSelect.visible:=true;
     if kln_group_typ<3 then
      DIC_KLIENT_DYN_GROUP.btnSelect.tag := kln_group_id;

     DIC_KLIENT_DYN_GROUP.showmodal;
     if DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      kln2.Checked:=true;
      kln_name.Text:='* '+ DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      kln_group_id:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID;
      kln_group_typ:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_KLIENT_DYN_GROUP.Destroy;

end;

procedure TReport_Post_fin_firm.BTN_KLNClick(Sender: TObject);
var fr:integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= KLN_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> KLN_NAME.tag then
       begin
//        KLN_NAME.tag:=DIC_KLIENT.tag;
        kln_group_id:=DIC_KLIENT.tag;
        if Activ=1 then
          fr:=1
        else
          fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);
        kln2.checked:=true;

         QueryWork.Close;
    	 QueryWork.SQL.clear;
         if fr=0 then
         begin
           QueryWork.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
           kln_group_typ:=4;
         end
         else
         begin
           QueryWork.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
           kln_group_typ:=3;
         end;
    	 QueryWork.Parambyname('KLN_ID').asinteger:=kln_group_id;
     	 QueryWork.Open;

         if not QueryWork.eof then
         KLN_NAME.text := QueryWork.fieldbyname('KLN_FULL').asstring;
   //      KLN_NAME.text:=inttostr(KLN_NAME.tag);
         QueryWork.Close;
         WorkTransaction.Active:=false;

       end;

     DIC_KLIENT.Destroy;

end;

procedure TReport_Post_fin_firm.post1Click(Sender: TObject);
begin
   if post1.Checked=true
     then
     begin
          POST_NAME.text:= 'Все поставщики';
          post_group_id:=0;
          post_group_typ:=4;
     end;
end;

procedure TReport_Post_fin_firm.DYNPOSTClick(Sender: TObject);
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

procedure TReport_Post_fin_firm.BTN_POSTClick(Sender: TObject);
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
