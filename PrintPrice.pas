unit PrintPrice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils,VclUtils, FR_DSet, FR_DBSet, FR_Class, Db,
  IBCustomDataSet, IBQuery, IBDatabase, Buttons, StdCtrls, FR_E_TXT,
  FR_E_RTF, RxMemDS,ShellAPI, CheckLst, Grids, DBGrids, RXDBCtrl, excel2000, OleServer, ComObj,
  RxLookup;



type
  TPRINT_PRICE = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    PriceTransaction: TIBTransaction;
    DsPrice: TfrDBDataSet;
    reportPrice: TfrReport;
    GroupBox2: TGroupBox;
    BtnTW: TSpeedButton;
    BtnDynDic: TSpeedButton;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TW: TEdit;
    CheckListBox1: TCheckListBox;
    QueryWork: TIBQuery;
    queryPrice: TIBQuery;
    queryPriceTW_ID: TIntegerField;
    queryPriceTW_OST: TFloatField;
    queryPriceTW_ART: TIntegerField;
    queryPriceTW_NAM: TIBStringField;
    queryPriceED_SHORT: TIBStringField;
    queryPriceTWTREE_ID: TIntegerField;
    queryPriceTW_KWM_ONE: TFloatField;
    queryPriceTW_MROZ: TFloatField;
    queryPriceTWTREE_FULL: TIBStringField;
    queryPriceMONEY1: TFloatField;
    queryPriceMONEY2: TFloatField;
    queryPriceMONEY3: TFloatField;
    queryPriceMONEY5: TFloatField;
    queryPriceTW_BRAK: TIBStringField;
    queryPriceMONEY4: TFloatField;
    GroupBox1: TGroupBox;
    KLN_NAME: TEdit;
    BTN_KLN: TBitBtn;
    kln2: TRadioButton;
    kln1: TRadioButton;
    klnPrice: TfrReport;
    queryPriceMON_NAL: TFloatField;
    queryPriceMON_BNAL: TFloatField;
    queryPriceBNAL_SALE: TIntegerField;
    queryPriceNAL_SALE: TIntegerField;
    queryPriceKLN_FULL: TIBStringField;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    FRM: TRxDBLookupCombo;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    SKL1: TRadioButton;
    SKL2: TRadioButton;
    DicSKL: TRxDBLookupCombo;
    QrSKLAD: TIBQuery;
    QrSKLADSKL_ID: TIntegerField;
    QrSKLADSKL_SHORT: TIBStringField;
    QrSKLADSKL_FULL: TIBStringField;
    QrSKLADSKL_ADR: TIBStringField;
    QrSKLADSKL_TEL: TIBStringField;
    QrSKLADSKL_TIME: TIBStringField;
    QrSKLADSKL_SPEED: TIntegerField;
    DsSKL: TDataSource;
    queryPriceMONEY6: TFloatField;
    queryPriceMONEY7: TFloatField;
    queryPriceMONEY8: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure TW1Click(Sender: TObject);
    procedure TW2Click(Sender: TObject);
    procedure BtnTWClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure reportPriceBeginDoc;
//    procedure BitBtn1Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
procedure ExpCalc;
procedure ExpExel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure kln1Click(Sender: TObject);
    procedure kln2Click(Sender: TObject);
    procedure klnPriceBeginDoc;
    procedure FormShow(Sender: TObject);
//    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }

    print_money1, print_money2, print_money3, print_money4, print_money5,
    print_money6, print_money7, print_money8: boolean;

  public
    tw_group_id, tw_group_typ: integer;
    { Public declarations }
  end;

var
  PRINT_PRICE: TPRINT_PRICE;

const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

uses DicTowar, DicTwDynGroup, DicKlient;

{$R *.DFM}

procedure TPRINT_PRICE.Button1Click(Sender: TObject);
begin



   caption:='Запрос данных по товарам...';
   // Заполняем таблицу с ценами
   QueryPrice.Close;
   QueryPrice.paramByname('TWDYNGROUP_ID').asinteger:=tw_group_id;
   QueryPrice.paramByname('TWDYNGROUP_TYP').asinteger:=tw_group_typ;
   if CheckListBox1.State[0]=cbChecked
        then QueryPrice.paramByname('ON_STORE').asinteger:=1
   else QueryPrice.paramByname('ON_STORE').asinteger:=0;
   if CheckListBox1.State[1]=cbChecked then
     QueryPrice.paramByname('SHOW_OST').asinteger:=1
   else QueryPrice.paramByname('SHOW_OST').asinteger:=0;
   if CheckListBox1.State[2]=cbChecked then
     QueryPrice.paramByname('SHOW_BRAK').asinteger:=1
   else QueryPrice.paramByname('SHOW_BRAK').asinteger:=0;

   QueryPrice.paramByname('US_ID').asinteger:=USERID;
   QueryPrice.paramByname('kln_id').asinteger:=kln_name.Tag;

   QueryPrice.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
   if SKL1.Checked then QueryPrice.ParamByname('SKL_ID').asinteger:=0
        else QueryPrice.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);


   QueryPrice.Open;
{   caption:='Заполнение данных по товарам...';
   MemPrice.EmptyTable;
   While not QueryWork.eof do begin
     MemPrice.Append;
     MemPrice.fieldByname('TWTREE_ID').asinteger:=QueryWork.fieldByname('TWTREE_ID').asinteger;
     MemPrice.fieldByname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
     MemPrice.fieldByname('TW_ART').asinteger:=QueryWork.fieldByname('TW_ART').asinteger;
     MemPrice.fieldByname('TW_NAM').asstring:=QueryWork.fieldByname('TW_NAM').asstring;
     MemPrice.fieldByname('TWTREE_FULL').asstring:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     MemPrice.fieldByname('KTG').asstring:='Категория';
     MemPrice.fieldByname('MONEY').asstring:='деньги';
     MemPrice.fieldByname('USL').asstring:='Условие';
     MemPrice.Post;
     QueryWork.next;
   end;
}
     caption:='Вывод отчета...';




  if kln1.Checked=true then
    reportPrice.ShowReport
  else
    if (kln_name.Tag<>0) then
      klnPrice.ShowReport
    else
      reportPrice.ShowReport;

   caption:='Печать прайс-листа';
//     FrReport1.ShowReport;
end;


procedure TPRINT_PRICE.TW1Click(Sender: TObject);
begin
   if TW1.Checked=true
     then
     begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
     end;
end;

procedure TPRINT_PRICE.TW2Click(Sender: TObject);
begin
   if TW1.Checked=true
     then
     begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
     end;
end;

procedure TPRINT_PRICE.BtnTWClick(Sender: TObject);
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

procedure TPRINT_PRICE.BtnDynDicClick(Sender: TObject);
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

procedure TPRINT_PRICE.FormCreate(Sender: TObject);
var i: integer;
    n: integer;
begin
  tw_group_id:=0;
  tw_group_typ:=3;


  CheckListBox1.State[0]:=cbChecked;
  CheckListBox1.State[1]:=cbChecked;
  CheckListBox1.State[2]:=cbChecked;



  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY1')<>-1) then
    CheckListBox1.State[4]:=cbChecked;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY2')<>-1) then
    CheckListBox1.State[5]:=cbChecked;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')<>-1) then
  begin
    CheckListBox1.State[6]:=cbChecked;
    CheckListBox1.State[9]:=cbChecked;
    CheckListBox1.State[10]:=cbChecked;
    CheckListBox1.State[11]:=cbChecked;
  end;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY4')<>-1) then
    CheckListBox1.State[7]:=cbChecked;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY5')<>-1) then
    CheckListBox1.State[8]:=cbChecked;

  for i := CheckListBox1.items.Count-1 downto 0 do
  begin
    if CheckListBox1.State[i]<>cbChecked then
    begin

      CheckListBox1.Items.Delete(i);
    end

  end;




    print_money1:=false;
    print_money2:=false;
    print_money3:=false;
    print_money4:=false;
    print_money5:=false;
    print_money6:=false;
    print_money7:=false;
    print_money8:=false;
    for i := 3 to CheckListBox1.Items.Count-1 do
    begin
      n:= strtoint( copy( CheckListBox1.Items[i], length(CheckListBox1.Items[i])-1, 2));
      if CheckListBox1.State[i]=cbChecked then
      case n of
        4: print_money1:=true;
        5: print_money2:=true;
        6: print_money3:=true;
        7: print_money4:=true;
        8: print_money5:=true;
        9: print_money6:=true;
        10: print_money7:=true;
        11: print_money8:=true;
      end;
    end;



    {Загрузка списка доступных фирм}
  MemFrm.EmptyTable;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from rn_dic_frm(:FRM_ID) order by 2');
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
  FRM.Value:='2702542';


  

end;

procedure TPRINT_PRICE.reportPriceBeginDoc;
var frO: TfrView;
    frP: TfrPictureView;
begin
    if CheckListBox1.State[1]<>cbChecked then
    begin
      frO := reportPrice.FindObject('capt_ost');
      frO.visible:=false;
    end;
    if CheckListBox1.State[2]<>cbChecked then
    begin
      frO := reportPrice.FindObject('capt_rozn');
      frO.visible:=false;
    end;
    if not print_money1 then
    begin
      frO := reportPrice.FindObject('capt_opt');
      frO.visible:=false;
    end;
    if not print_money2 then
    begin
      frO := reportPrice.FindObject('capt_kropt');
      frO.visible:=false;
    end;
    if not print_money3 then
    begin
      frO := reportPrice.FindObject('capt_spec');
      frO.visible:=false;
    end;
    if not print_money4 then
    begin
      frO := reportPrice.FindObject('capt_akz');
      frO.visible:=false;
    end;
    if not print_money5 then
    begin
      frO := reportPrice.FindObject('capt_zak');
      frO.visible:=false;
    end;
    if not print_money6 then
    begin
      frO := reportPrice.FindObject('capt_money6');
      frO.visible:=false;
    end;
    if not print_money7 then
    begin
      frO := reportPrice.FindObject('capt_money7');
      frO.visible:=false;
    end;
    if not print_money8 then
    begin
      frO := reportPrice.FindObject('capt_money8');
      frO.visible:=false;
    end;
end;

procedure TPRINT_PRICE.ExpExel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: string;
    fq: FastQuery;

    rekw: string;

begin
   QueryPrice.Close;
   QueryPrice.paramByname('TWDYNGROUP_ID').asinteger:=tw_group_id;
   QueryPrice.paramByname('TWDYNGROUP_TYP').asinteger:=tw_group_typ;
   if CheckListBox1.State[0]=cbChecked
        then QueryPrice.paramByname('ON_STORE').asinteger:=1
   else QueryPrice.paramByname('ON_STORE').asinteger:=0;

   if CheckListBox1.State[1]=cbChecked then
        QueryPrice.paramByname('SHOW_OST').asinteger:=1
   else QueryPrice.paramByname('SHOW_OST').asinteger:=0;
   QueryPrice.paramByname('US_ID').asinteger:=USERID;
   QueryPrice.paramByname('kln_id').asinteger:=kln_name.Tag;

   QueryPrice.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;


   QueryPrice.Open;

    QueryPrice.Last;
    QueryPrice.First;


    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
//    excel.Visible[0]:=true;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\прайс лист.xlt', 0);
    v := VarArrayCreate([0, QueryPrice.RecordCount+1000, 0, 15], varVariant);

    add_row:=0;
    old_tw_tree_id:='';
    for iRow:=0 to QueryPrice.RecordCount-1 do
    begin
        add_col:=0;

        if old_tw_tree_id<>QueryPrice.FieldByName('TWTREE_FULL').asString then
        begin
          v[iRow+add_row, 0] := QueryPrice.FieldByName('TWTREE_FULL').asvariant;
          inc(add_row);
          old_tw_tree_id:=QueryPrice.FieldByName('TWTREE_FULL').asString;

          r := excel.Range[excel.Cells.Item[iRow +4+add_row, 1], excel.Cells.Item[iRow +4+add_row - 1,1 ]];
          r.Font.Bold:=true;
          r.Font.Size:=10;
//          r.Interior.ColorIndex:=34;
//          r.Interior.Pattern:=xlsolid;
        end;

        v[iRow+add_row, 1] := iRow+1;
        v[iRow+add_row, 2] := QueryPrice.FieldByName('TW_ART').asvariant;
        v[iRow+add_row, 3] := QueryPrice.FieldByName('TW_NAM').asvariant;
        v[iRow+add_row, 4] := QueryPrice.FieldByName('ED_SHORT').asvariant;
        if CheckListBox1.State[1]=cbChecked then
        begin
        v[iRow+add_row, 5] := QueryPrice.FieldByName('TW_ost').asvariant;
        inc(add_col);
        end;

      if kln1.Checked=true then
      begin
        if gl_FRM_WORK_MODE=0 then
        if CheckListBox1.State[2]=cbChecked then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('TW_MROZ').asvariant;
        inc(add_col);
        end;
        if print_money1 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money1').asvariant;
        inc(add_col);
        end;
        if print_money2 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money2').asvariant;
        inc(add_col);
        end;
        if print_money3 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money3').asvariant;
        inc(add_col);
        end;
        if print_money4 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money4').asvariant;
        inc(add_col);
        end;
        if print_money5 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money5').asvariant;
        inc(add_col);
        end;
        if print_money6 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money6').asvariant;
        inc(add_col);
        end;
        if print_money7 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money7').asvariant;
        inc(add_col);
        end;
        if print_money8 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('money8').asvariant;
        inc(add_col);
        end;
      end
      else
      begin
        if gl_FRM_WORK_MODE=0 then
        begin
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('TW_MROZ').asvariant;
        inc(add_col);
        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('MON_NAL').asvariant;
        inc(add_col);
        end;

        v[iRow+add_row, 5+add_col] := QueryPrice.FieldByName('MON_BNAL').asvariant;
        inc(add_col);
      end;

        QueryPrice.Next;
    end;

     r := excel.Range[excel.Cells.Item[4, 1],
       excel.Cells.Item[QueryPrice.RecordCount +4+add_row - 1,5+add_col ]];

      r.Value := v;


//      cel := Sheet.GetCellByPosition(1,0);
//      cel.setString('Прайс-лист от '+formatdatetime('dd/mm/yyyy', now)+chr(13)+rekw);


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
     except

     end;


      fq:=FastQuery.Create('');
//     if gl_FRM_WORK_MODE=0 then
        fq.SQL.Text:='select kln_full ||bg_crlf()|| kln_adr ||bg_crlf()|| kln_rekw ||bg_crlf()|| kln_tel rekw from kln_data('+FRM.Value+')';
//      else
//        fq.SQL.Text:='select kln_full ||bg_crlf()|| kln_adr ||bg_crlf()|| kln_rekw ||bg_crlf()|| kln_tel rekw from kln_data(2696877)';
      fq.Open;
      rekw:=fq.fieldbyname('rekw').asstring;
      fq.Close;
      fq.Destroy;
      r := excel.Range[excel.Cells.Item[1, 2],
       excel.Cells.Item[1,2]];
      r.Value := 'Прайс-лист от '+formatdatetime('dd/mm/yyyy', now)+chr(13)+rekw;




        add_col:=1;
        if CheckListBox1.State[1]=cbChecked then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Остаток'; inc(add_col);
        end;

      if kln1.Checked=true then
      begin
        if gl_FRM_WORK_MODE=0 then
        if CheckListBox1.State[2]=cbChecked then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Розничная цена'; inc(add_col);
        end;
        if print_money1 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Оптовая цена'; inc(add_col);
        end;
        if print_money2 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Кр. опт. цена'; inc(add_col);
        end;
        if print_money3 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Спец цена'; inc(add_col);
        end;
        if print_money4 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Цена перепродажи'; inc(add_col);
        end;
        if print_money5 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Закуп. цена'; inc(add_col);
        end;
        if print_money6 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Спец2'; inc(add_col);
        end;
        if print_money7 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Цена7'; inc(add_col);
        end;
        if print_money8 then
        begin
          r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
          r.Value := 'Цена0'; inc(add_col);
        end;
      end
      else
      begin
        if gl_FRM_WORK_MODE=0 then
        begin

        r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
        r.Value := 'Розничная цена';
        inc(add_col);

        r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
        r.Value := 'Цена за НАЛ';
        inc(add_col);
        end;


        r := excel.Range[excel.Cells.Item[3, 5+add_col],  excel.Cells.Item[3, 5+add_col ]];
        r.Value := 'Цена за БНАЛ';
        inc(add_col);
      end;







    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
    caption:='Печать прайс-листа';
end;

procedure TPRINT_PRICE.CheckListBox1Click(Sender: TObject);
var i: integer;
   n: integer;
begin
    print_money1:=false;
    print_money2:=false;
    print_money3:=false;
    print_money4:=false;
    print_money5:=false;
    print_money6:=false;
    print_money7:=false;
    print_money8:=false;
    for i := 3 to CheckListBox1.Items.Count-1 do
    begin
      n:= strtoint( copy( CheckListBox1.Items[i], length(CheckListBox1.Items[i])-1, 2));
      if CheckListBox1.State[i]=cbChecked then
      case n of
        4: print_money1:=true;
        5: print_money2:=true;
        6: print_money3:=true;
        7: print_money4:=true;
        8: print_money5:=true;
        9: print_money6:=true;
        10: print_money7:=true;
        11: print_money8:=true;
      end;
    end;

end;

procedure TPRINT_PRICE.ExpCalc();
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

    fq: FastQuery;

    rekw: string;

begin
// Открытие CALC
   try

        ServiceManager := CreateOleObject('com.sun.star.ServiceManager');

   except
    exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\прайс лист.xlt');
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








   QueryPrice.Close;
   QueryPrice.paramByname('TWDYNGROUP_ID').asinteger:=tw_group_id;
   QueryPrice.paramByname('TWDYNGROUP_TYP').asinteger:=tw_group_typ;
   if CheckListBox1.State[0]=cbChecked
        then QueryPrice.paramByname('ON_STORE').asinteger:=1
   else QueryPrice.paramByname('ON_STORE').asinteger:=0;

   if CheckListBox1.State[1]=cbChecked then
        QueryPrice.paramByname('SHOW_OST').asinteger:=1
   else QueryPrice.paramByname('SHOW_OST').asinteger:=0;
   QueryPrice.paramByname('US_ID').asinteger:=USERID;
   QueryPrice.paramByname('kln_id').asinteger:=kln_name.tag;

   QueryPrice.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;

   QueryPrice.Open;

    QueryPrice.Last;
    QueryPrice.First;


    try

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=12;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=QueryPrice.RecordCount+1000;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';



    add_row:=0;
    old_tw_tree_id:=0;
    for iRow:=0 to QueryPrice.RecordCount-1 do
    begin
       add_col:=0;

        if old_tw_tree_id<>QueryPrice.FieldByName('TWTREE_ID').asinteger then
        begin
          v[0,iRow+add_row] := QueryPrice.FieldByName('TWTREE_FULL').asstring;
          inc(add_row);
          old_tw_tree_id:=QueryPrice.FieldByName('TWTREE_ID').asinteger;

          Sheets := Document.GetSheets;
          Sheet := Sheets.GetByName('Лист1');
          cel := Sheet.GetCellByPosition(0,iRow+add_row+2);
          cel.charWeight:=150;
          cel.charHeight:=10;

 //         r := excel.Range[excel.Cells.Item[iRow +4+add_row, 1], excel.Cells.Item[iRow +4+add_row - 1,1 ]];
 //         r.Font.Bold:=true;
 //         r.Font.Size:=10;

        end;


        v[1, iRow+add_row] := iRow+1;
        v[2, iRow+add_row] := QueryPrice.FieldByName('TW_ART').asstring;
        v[3, iRow+add_row] := QueryPrice.FieldByName('TW_NAM').asstring;
        v[4, iRow+add_row] := QueryPrice.FieldByName('ED_SHORT').asstring;
        if CheckListBox1.State[1]=cbChecked then
        begin
        v[5, iRow+add_row] := QueryPrice.FieldByName('TW_ost').asfloat;
        inc(add_col);
        end;

      if kln1.Checked=true then
      begin

        if gl_FRM_WORK_MODE=0 then
        if CheckListBox1.State[2]=cbChecked then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('TW_MROZ').asvariant;
        inc(add_col);
        end;

        if print_money1 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money1').asvariant;
        inc(add_col);
        end;
        if print_money2 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money2').asvariant;
        inc(add_col);
        end;
        if print_money3 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money3').asvariant;
        inc(add_col);
        end;
        if print_money4 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money4').asvariant;
        inc(add_col);
        end;
        if print_money5 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money5').asvariant;
        inc(add_col);
        end;
        if print_money6 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money6').asvariant;
        inc(add_col);
        end;
        if print_money7 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money7').asvariant;
        inc(add_col);
        end;
        if print_money8 then
        begin
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('money8').asvariant;
        inc(add_col);
        end;
      end
      else
      begin
        if gl_FRM_WORK_MODE=0 then
        begin
          v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('TW_MROZ').asvariant;
          inc(add_col);
          v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('MON_NAL').asvariant;
          inc(add_col);
        end;
        v[5+add_col, iRow+add_row] := QueryPrice.FieldByName('MON_BNAL').asvariant;
        inc(add_col);
      end;

        QueryPrice.Next;
    end;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
//    Cell := Sheet.GetCellByPosition(0, 1);

//    r := excel.Range[excel.Cells.Item[4, 1],
//      excel.Cells.Item[QueryPrice.RecordCount +4+add_row - 1,5+add_col ]];


    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+3,dataArrayBounds[1,0], dataArrayBounds[1,1]+3);

    Cell.SetDataArray(v);

    fq:=FastQuery.Create('');

    if gl_FRM_WORK_MODE=0 then
      fq.SQL.Text:='select kln_full ||bg_crlf()|| kln_adr ||bg_crlf()|| kln_rekw ||bg_crlf()|| kln_tel rekw from kln_data(2702542)'
    else
      fq.SQL.Text:='select kln_full ||bg_crlf()|| kln_adr ||bg_crlf()|| kln_rekw ||bg_crlf()|| kln_tel rekw from kln_data(2696877)';
    fq.Open;

    rekw:=fq.fieldbyname('rekw').asstring;

    fq.Close;
    fq.Destroy;



    cel := Sheet.GetCellByPosition(1,0);
    cel.setString('Прайс-лист от '+formatdatetime('dd/mm/yyyy', now)+chr(13)+rekw);

    //**********
        add_col:=1;
        if CheckListBox1.State[1]=cbChecked then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Остаток');
          inc(add_col);
        end;

      if kln1.Checked=true then
      begin
        if gl_FRM_WORK_MODE=0 then
        if CheckListBox1.State[2]=cbChecked then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Розничная цена');
          inc(add_col);
        end;
        if print_money1 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Оптовая цена');
          inc(add_col);
        end;
        if print_money2 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Кр. опт. цена');
          inc(add_col);
        end;
        if print_money3 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Спец цена');
          inc(add_col);
        end;
        if print_money4 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Цена перепродажи');
          inc(add_col);
        end;
        if print_money5 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Закуп. цена');
          inc(add_col);
        end;
        if print_money6 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Спец2');
          inc(add_col);
        end;
        if print_money6 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Цена7');
          inc(add_col);
        end;
        if print_money8 then
        begin
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Цена0');
          inc(add_col);
        end;
      end
      else
      begin
          if gl_FRM_WORK_MODE=0 then
          begin
            cel := Sheet.GetCellByPosition(4+add_col,2);
            cel.setString('Розничная цена');
            inc(add_col);
            cel := Sheet.GetCellByPosition(4+add_col,2);
            cel.setString('Цена за НАЛ');
            inc(add_col);
          end;
          cel := Sheet.GetCellByPosition(4+add_col,2);
          cel.setString('Цена за БНАЛ');
          inc(add_col);
      end;
    //**********
   except
   on e: Exception
   do begin
    messbox(e.message, 'Error', 0);
   end;
   end;

end;

procedure TPRINT_PRICE.BitBtn1Click(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExel;
  except
    ExpCalc;
  end;
end;

procedure TPRINT_PRICE.BTN_KLNClick(Sender: TObject);
begin
     kln2.Checked:=true;
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_NAME.tag then
     begin
       KLN_NAME.tag:=DIC_KLIENT.tag;
       ADD_SQL(QueryWork,'SELECT KLN_FULL FROM KLN_DATA(:KLN_ID)');
       QueryWork.Parambyname('KLN_ID').AsInteger := KLN_NAME.tag;
       QueryWork.Open;
       KLN_NAME.text := QueryWork.fieldbyname('KLN_FULL').asstring;
     End;
     DIC_KLIENT.Destroy;
end;

procedure TPRINT_PRICE.kln1Click(Sender: TObject);
var i:integer;
begin
  if kln1.Checked=true then
  begin
    KLN_NAME.text:= 'Все клиенты';
    KLN_NAME.Tag:=0;
  end;
    for  i:=2  to CheckListBox1.Items.Count-1 do
      CheckListBox1.ItemEnabled[i]:=true;
end;

procedure TPRINT_PRICE.kln2Click(Sender: TObject);
var i:integer;
begin
    for  i:=2  to CheckListBox1.Items.Count-1 do
      CheckListBox1.ItemEnabled[i]:=false;

end;

procedure TPRINT_PRICE.klnPriceBeginDoc;
var frO: TfrView;
begin
    if CheckListBox1.State[1]<>cbChecked then
    begin
      frO := klnPrice.FindObject('capt_ost');
      frO.visible:=false;
    end;

end;

procedure TPRINT_PRICE.FormShow(Sender: TObject);
begin
     QrSklad.close;
     QrSklad.Open;
end;

end.
