unit DocKKM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid,VclUtils,
  DBCtrls, FR_Class, FR_DSet, FR_DBSet;

type
  TDoc_KKM = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    PRIM: TMemo;
    Label11: TLabel;
    KKM_DATE: TDateEdit;
    Btn_DelTow: TToolButton;
    ToolButton4: TToolButton;
    Btn_Propertis: TToolButton;
    Btn_Print: TToolButton;
    ToolButton8: TToolButton;
    Btn_Prow: TToolButton;
    Btn_Unprow: TToolButton;
    ToolButton11: TToolButton;
    Btn_SAVE: TToolButton;
    Btn_Apply: TToolButton;
    IBQuery1: TIBQuery;
    MemKKMS: TRxMemoryData;
    DsKKMS: TDataSource;
    DocTransaction: TIBTransaction;
    Query1Transaction: TIBTransaction;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    Timer1: TTimer;
    IBQuery3: TIBQuery;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    SHOP: TRxDBLookupCombo;
    MemKKMSKKM_ID: TIntegerField;
    MemKKMSSALDO1: TFloatField;
    MemKKMSSALDO2: TFloatField;
    MemKKMSPROBITO: TFloatField;
    MemKKMSINKASS: TFloatField;
    MemKKMSRN_SUMM: TFloatField;
    MemKKMSPO_SUMM: TFloatField;
    MemKKMSTERMINAL_SUMM: TFloatField;
    MemKKMSinfo: TStringField;
    MemKKMSlocal_rn_summ: TFloatField;
    MemKKMSerror: TStringField;
    MemKKMSFRM_NAME: TStringField;
    MemKKMSFRM_ID: TIntegerField;
    Button1: TButton;
    MemKKMSkkms_id: TIntegerField;
    Btn_AddFrm: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    MemKKMSTERMINAL_SUMM_1: TFloatField;
    MemKKMSTERMINAL_SUMM_2: TFloatField;
    MemKKMSPO_SUMM_1: TFloatField;
    Button2: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    MemKKMScontrol: TFloatField;
    GroupBox3: TGroupBox;
    useR_name: TEdit;
    BTN_USER: TBitBtn;
    cbUserAll: TCheckBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    procedure Btn_ApplyClick(Sender: TObject);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsKKMSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_PrintClick(Sender: TObject);
    procedure Btn_PropertisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton6Click(Sender: TObject);
    function Get_napr_kln(TW_ID:integer): integer;
    procedure Button1Click(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure Btn_AddFrmClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure MemKKMSCalcFields(DataSet: TDataSet);
    procedure BTN_USERClick(Sender: TObject);
    procedure cbUserAllClick(Sender: TObject);
  private
    { Private declarations }
    REAL_TYP: integer;
    pers_skid: integer;
    kln_ktg_id: integer;
    initComplete: boolean;
    KKMEmpty: boolean;
    KKM_PROW:boolean;
  public
    { Public declarations }
  end;



var
  CanTimer:boolean;
  CanInsert:Boolean=False;
  KKMS_DEL:array[1..10000] of integer;
  KKM_DEL_MESS:array[1..10000] of string;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_KKM: TDoc_KKM;

  KLN_ID:integer;
  SHOP_ID:integer;
  STR:ansistring='';
  otkr:integer=0;


implementation

uses Mainform, PrintDoc, DicKlient;

{$R *.DFM}



procedure TDoc_KKM.Show_sost;
var
   s:ansistring;
//   KKMEmpty:boolean;
   c:integer;
   SHOW_COLUMN:ansistring;
   i: integer;
begin

     if Doc_KKM.Tag<0 then
       Doc_KKM.caption:='Кассовый отчет. Новый'
     else Doc_KKM.caption:='Кассовый отчет. Редактирование';
     if MemKKMS.RecordCount=0 then KKMEmpty:=true else KKMEmpty:=false;
      s:='Ожидание...';
      Panel2.Color:=clBtnFace;
      Panel2.Font.color:=ClWindowText;





     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
     Btn_SAVE.enabled:=(not KKM_PROW) and (not KKMEmpty);
     Btn_Apply.enabled:=(not KKM_PROW) and (not KKMEmpty);
     Btn_Print.enabled:=(not KKMEmpty);
     Btn_Propertis.enabled:=true;
     KKM_DATE.enabled:=(not KKM_PROW);
     SHOP.Enabled:=(not KKM_PROW);
     PRIM.enabled:=(not KKM_PROW);
     Button1.Visible:=(not KKM_PROW);
     Button2.Visible:=(not KKM_PROW);

     RxDBGrid2.ReadOnly:= KKM_PROW;


     btn_prow.Enabled:= not KKM_PROW and (not KKMEmpty);
     btn_unprow.Enabled:= KKM_PROW and (not KKMEmpty);

     Btn_DelTow.Enabled:=not KKM_PROW and (not KKMEmpty);
     Btn_AddFrm.Enabled:=not KKM_PROW;



     
end;

procedure TDoc_KKM.FormShow(Sender: TObject);
begin
     real_typ:=1;
     initComplete:=false;
     Timer1.enabled:=False;
     CanTimer:=False;
     DocTransaction.Active:=False;



     SHOP.Value := inttostr(SHOPID);






     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;

     KKM_PROW:=false;

     {Определяем название}
     if Doc_KKM.tag<0 then begin


       Get_default;
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       PRIM.lines.clear;
       KKM_DATE.date:=Date();

     end else begin
          {Читаем счёт}
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select * from KKM where KKM_ID=:KKM_ID');
          IbQuery1.Parambyname('KKM_ID').asinteger:=Doc_KKM.tag;
          IbQuery1.Open;
          SHOP.value:=IbQuery1.fieldbyname('SHOP_ID').asString;

          prim.Lines.Text:=IbQuery1.fieldbyname('PRIM').asstring;
          KKM_DATE.date:=IbQuery1.fieldbyname('KKM_DATE').asdatetime;
          KKM_PROW:=(IbQuery1.fieldbyname('KKM_PROV').AsInteger = 1);
          {Читаем содержимое отчета}
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select * from LIST_KKMS_REPORT(:KKM_ID) order by KKMS_ID');
          IbQuery1.Parambyname('KKM_ID').asinteger:=Doc_KKM.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemKKMS.Append;

                MemKKMS.Fieldbyname('KKMS_ID').asinteger:=IbQuery1.Fieldbyname('KKMS_ID').asinteger;
                MemKKMS.Fieldbyname('SALDO1').asfloat:=IbQuery1.Fieldbyname('SALDO1').asfloat;
                MemKKMS.Fieldbyname('SALDO2').asfloat:=IbQuery1.Fieldbyname('SALDO2').asfloat;
                MemKKMS.Fieldbyname('probito').asfloat:=IbQuery1.Fieldbyname('probito').asfloat;
                MemKKMS.Fieldbyname('inkass').asfloat:=IbQuery1.Fieldbyname('inkass').asfloat;
                MemKKMS.Fieldbyname('rn_summ').asfloat:=IbQuery1.Fieldbyname('rn_summ').asfloat;
                MemKKMS.Fieldbyname('local_rn_summ').asfloat:=IbQuery1.Fieldbyname('local_rn_summ').asfloat;
                MemKKMS.Fieldbyname('po_summ').asfloat:=IbQuery1.Fieldbyname('po_summ').asfloat;
                MemKKMS.Fieldbyname('po_summ_1').asfloat:=IbQuery1.Fieldbyname('po_summ_1').asfloat;                
                MemKKMS.Fieldbyname('terminal_summ').asfloat:=IbQuery1.Fieldbyname('terminal_summ').asfloat;
                MemKKMS.Fieldbyname('terminal_summ_1').asfloat:=IbQuery1.Fieldbyname('terminal_summ_1').asfloat;
                MemKKMS.Fieldbyname('terminal_summ_2').asfloat:=IbQuery1.Fieldbyname('terminal_summ_2').asfloat;
                MemKKMS.Fieldbyname('info').asString:=IbQuery1.Fieldbyname('info').asString;
                MemKKMS.Fieldbyname('error').asString:=IbQuery1.Fieldbyname('error').asString;
                MemKKMS.Fieldbyname('frm_name').asString:=IbQuery1.Fieldbyname('frm_name').asString;
                MemKKMS.Fieldbyname('frm_ID').asString:=IbQuery1.Fieldbyname('frm_id').asString;
                MemKKMS.Post;
                CanInsert:=False;
                IbQuery1.next;

          end;
     end;



     Show_Sost;
     SAVE:=true;
     Timer1.enabled:=True;
     CanTimer:=True;
     initComplete:=true;
end;

procedure TDoc_KKM.Btn_ApplyClick(Sender: TObject);
var
   A,KKM_ID,ID,OLDID:integer;
   r,IDR:double;
begin
     if (MemKKMS.State in [dsInsert,DsEdit]) then MemKKMS.Post;



     CanTimer:=False;;
     Timer1.enabled:=False;

     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemKKMS.recno;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('KKM_DATE',strtodatetime(datetostr(KKM_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('SHOP_ID',strtoint(shop.value));
        IBSAVE_ADD('PRIM',Memotostr(PRIM.lines));
        IBSAVE_ADD('US_ID',USERID);
        KKM_ID:=IBSAVE_DOC('KKM',DOC_KKM.tag);
        if KKM_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','KKM');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',KKM_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',KKM_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if KKMS_DEL[A]>0 then if not IBDELETE_DOC('KKMS',KKMS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemKKMS.DisableControls;
             MemKKMS.First;
             while not MemKKMS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('KKM_ID',KKM_ID);
                   IBSAVE_ADD('FRM_ID',MemKKMS.fieldbyname('FRM_ID').asinteger);
                   IBSAVE_ADD('SALDO1',MemKKMS.fieldbyname('SALDO1').asfloat);
                   IBSAVE_ADD('SALDO2',MemKKMS.fieldbyname('SALDO2').asfloat);
                   IBSAVE_ADD('probito',MemKKMS.fieldbyname('probito').asfloat);
                   IBSAVE_ADD('inkass',MemKKMS.fieldbyname('inkass').asfloat);
                   IBSAVE_ADD('rn_summ',MemKKMS.fieldbyname('rn_summ').asfloat);
                   IBSAVE_ADD('po_summ',MemKKMS.fieldbyname('po_summ').asfloat);
                   IBSAVE_ADD('po_summ_1',MemKKMS.fieldbyname('po_summ_1').asfloat);                   
                   IBSAVE_ADD('terminal_summ',MemKKMS.fieldbyname('terminal_summ').asfloat);
                   IBSAVE_ADD('terminal_summ_1',MemKKMS.fieldbyname('terminal_summ_1').asfloat);
                   IBSAVE_ADD('terminal_summ_2',MemKKMS.fieldbyname('terminal_summ_2').asfloat);
                   IBSAVE_ADD('info',MemKKMS.fieldbyname('info').asstring);




                   ID:=IBSAVE_DOC('KKMS',MemKKMS.fieldbyname('KKMS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_KKM.tag>0) and (MemKKMS.fieldbyname('KKMS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','KKM');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлеа строка по фирме: '+MemKKMS.Fieldbyname('FRM_NAME').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',KKM_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemKKMS.Edit;
                      MemKKMS.fieldbyname('KKM_ID').asinteger:=ID;
                      MemKKMS.Post;
                   end;
                   MemKKMS.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_KKM.tag:=KKM_ID;
        MemKKMS.First;
        while not MemKKMS.eof do begin
              if MemKKMS.fieldbyname('KKMS_ID').asinteger<0 then begin
                 MemKKMS.Edit;
                 MemKKMS.fieldbyname('KKMS_ID').asinteger:=-MemKKMS.fieldbyname('KKMS_ID').asinteger;
                 MemKKMS.Post;
              end;
              MemKKMS.next;
        end;
        MemKKMS.First;
        for a:=1 to OLDID-1 do MemKKMS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemKKMS.EnableControls;
        Datamodule1.IBTransaction2.Commit;


     Except
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     CanTimer:=True;
     Timer1.enabled:=True;
end;

procedure TDoc_KKM.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        Close;
     end;
end;

procedure TDoc_KKM.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Счёт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_KKM.DsKKMSDataChange(Sender: TObject; Field: TField);
begin
     if (MemKKMS.State in [dsInsert]) and ( not CanInsert) then MemKKMS.Cancel;
end;

procedure TDoc_KKM.Btn_DelTowClick(Sender: TObject);
begin
     if Messbox('Удалить из отчета строку "'+MemKKMS.Fieldbyname('FRM_NAME').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemKKMS.Fieldbyname('KKMS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          KKMS_DEL[CNT_DEL]:=MemKKMS.Fieldbyname('KKMS_ID').asinteger;
          KKM_DEL_MESS[CNT_DEL]:='Удалена строка : '+MemKKMS.Fieldbyname('FRM_NAME').asstring
        end;
        MemKKMS.delete;

        Show_Sost;
     end;
end;

procedure TDoc_KKM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if (key=13) and (ssCtrl in Shift) and (Btn_Save.enabled) then begin
        key:=0;
        Btn_SAve.click;
     end;
end;

//*****
function TDoc_KKM.Get_napr_kln(TW_ID:integer): integer;

begin

end;
//*****

procedure TDoc_KKM.Btn_PrintClick(Sender: TObject);
begin
  if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
//     SAVE:=false;
//     Btn_Apply.Click;
     //if (SAVE) then begin
        {Печатаем}
        FrReport1.ShowReport;
//        PRINT_KKM(Doc_KKM.tag);
//     end;
end;

procedure TDoc_KKM.Btn_PropertisClick(Sender: TObject);
begin
        {Отображаем "историю" приходной накладной}
        SHOW_HISTORY_DOC('Кассовый отчет от '+KKM_DATE.Text,'KKM',DOC_KKM.tag);
end;

procedure TDoc_KKM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CanTimer:=False;
     Timer1.enabled:=False;

end;

procedure TDoc_KKM.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
{
     Afont.color:=clWindowText;
     Background:=clWindow;
     Afont.Style:=[];
     if HighLight then  begin

      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;

      if (Field.FieldName='TW_SKID')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_NOSKID').asinteger>0)
         then Afont.color:=$009F9FFF;

      if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
     Afont.Style:=[];
     end;
     }
end;

procedure TDoc_KKM.ToolButton6Click(Sender: TObject);
begin
     My_lock;

end;



procedure TDoc_KKM.Button1Click(Sender: TObject);
var kkm_id: array[0..100] of integer;
begin



  IBQuery3.SQL.Text:=' SELECT distinct frm_name, frm_id FROM LIST_KKM WHERE SHOP_ID=:SHOP_ID and COMP_NAME=:COMPUTERNAME ORDER BY FRM_id';
  IBQuery3.ParamByName('SHOP_ID').asString :=SHOP.Value;
  IBQuery3.ParamByName('COMPUTERNAME').asString :=COMPUTERNAME;  
  ibquery3.Open;

  memkkms.DisableControls;

  while not ibquery3.Eof do
  begin

    if not memkkms.Locate('frm_id', ibquery3.FieldByName('frm_id').asInteger, []) then
    begin
      memkkms.Append;
      memkkms.FieldByName('FRM_ID').asinteger:=ibquery3.FieldByName('frm_id').asInteger;
      memkkms.FieldByName('FRM_NAME').asString:=ibquery3.FieldByName('FRM_NAME').asString;
      memkkms.FieldByName('KKMS_ID').asinteger:=-1;
      memkkms.Post;
    end;
    ibquery3.next;
  end;

  ibquery3.close;
  ibquery3.Transaction.Commit;




  memkkms.First;
  while not memkkms.Eof do
  begin

     memkkms.Edit;
{
241 – наличность в кассе за смену;
242 – внесенные суммы за смену;
243 – выплаченные суммы за смену;
244 – необнуляемая сумма до фискализации;
245 – сумма продаж в смене из ЭКЛЗ;
246 – сумма покупок в смене из ЭКЛЗ;
247 – сумма возвратов продаж в смене из ЭКЛЗ;
248 – сумма возвратов покупок в смене из ЭКЛЗ.
}

     memkkms.FieldByName('saldo2').asfloat:=FR_SHTRIH_GET_REG_VALUE(memkkms.FieldByName('FRM_ID').asinteger, 241);

     memkkms.FieldByName('inkass').asfloat:=FR_SHTRIH_GET_REG_VALUE(memkkms.FieldByName('FRM_ID').asinteger, 243);

     memkkms.FieldByName('probito').asfloat:=FR_SHTRIH_GET_REG_VALUE(memkkms.FieldByName('FRM_ID').asinteger, 193) -
        FR_SHTRIH_GET_REG_VALUE(memkkms.FieldByName('FRM_ID').asinteger, 195);

     memkkms.FieldByName('saldo1').asfloat:= memkkms.FieldByName('saldo2').asfloat -
          memkkms.FieldByName('probito').asfloat +memkkms.FieldByName('inkass').asfloat;

     //241
     memkkms.Post;
     memkkms.Next;


  end;





  memkkms.EnableControls;


  self.Show_Sost;

end;

procedure TDoc_KKM.Btn_ProwClick(Sender: TObject);
begin
  Btn_Apply.Click;

  try

  IBSAVE_CLEAR;
  IBSAVE_ADD('KKM_PROV', 1);
  IBSAVE_ADD('US_ID', USERID);
  IBSAVE_DOC('KKM', self.Tag);
  DataModule1.IbSaveSQL.Transaction.Commit;
  KKM_PROW:=true;
  except
  on e: Exception do
    begin
      DataModule1.IbSaveSQL.Transaction.Rollback;
    raise Exception.Create('ошибка проведения' + e.Message);
//      queryWork.Transaction.Rollback;


    end;
  end;

  Show_Sost;
end;

procedure TDoc_KKM.Btn_UnprowClick(Sender: TObject);
begin
  try

  IBSAVE_CLEAR;
  IBSAVE_ADD('KKM_PROV', 0);
  IBSAVE_ADD('US_ID', USERID);
  IBSAVE_DOC('KKM', self.Tag);
  DataModule1.IbSaveSQL.Transaction.Commit;
  KKM_PROW:=false;
  except
    on e: Exception do
    begin
    DataModule1.IbSaveSQL.Transaction.Rollback;
    raise Exception.Create('ошибка снятия с проводки' + e.Message);
//      queryWork.Transaction.Rollback;
    end;
  end;

  Show_Sost;
end;

procedure TDoc_KKM.Btn_AddFrmClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=0;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>0 then begin
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select kln_full from kln_data(:FRM_ID)');

        IbQuery1.Parambyname('FRM_ID').asinteger:=DIC_KLIENT.tag;
        IbQuery1.Open;

        CanInsert:=true;
        memKKMS.Append;
        memkkms.FieldByName('KKMS_ID').asinteger:=-1;
        memKKMS.FieldByName('FRM_ID').asInteger:=DIC_KLIENT.tag;
        memKKMS.FieldByName('FRM_NAME').asString:=IbQuery1.FieldByName('KLN_FULL').asString;
        memKKMS.Post;
        CanInsert:=false;
        Ibquery1.Close;
     end;
     DIC_KLIENT.Destroy;

     Show_Sost;
end;

procedure TDoc_KKM.Button2Click(Sender: TObject);

var kkm_id: array[0..100] of integer;
begin
  prim.Text := 'По кассиру: '+USER_NAME.Text + '. '+prim.text;  
  memkkms.DisableControls;

  memkkms.First;
  while not memkkms.Eof do
  begin
     IBQuery3.SQL.Text:='select * from kkm_report_fill_2(:dt, :shop_id, :frm_id, :user_id)';
     IBQuery3.ParamByName('FRM_ID').asInteger :=memkkms.FieldByName('FRM_ID').asinteger;
     IBQuery3.ParamByName('SHOP_ID').asString :=SHOP.Value;
     IBQuery3.ParamByName('dt').asDateTime :=int(KKM_DATE.Date);
     IBQuery3.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
     ibquery3.Open;

     memkkms.Edit;
     memkkms.FieldByName('RN_SUMM').asfloat:=ibquery3.FieldByName('rn_summ').asfloat;
     memkkms.FieldByName('po_summ').asfloat:=ibquery3.FieldByName('po_summ').asfloat;
     memkkms.FieldByName('po_summ_1').asfloat:=ibquery3.FieldByName('po_summ_1').asfloat;
     memkkms.FieldByName('terminal_summ').asfloat:=ibquery3.FieldByName('terminal_summ').asfloat;
     memkkms.FieldByName('terminal_summ_1').asfloat:=ibquery3.FieldByName('terminal_summ_1').asfloat;
     memkkms.FieldByName('terminal_summ_2').asfloat:=ibquery3.FieldByName('terminal_summ_2').asfloat;

     memkkms.Post;
     ibquery3.Close;
     ibquery3.Transaction.Commit;
     ibquery3.Transaction.Active:=false;

     memkkms.Next;

  end;


  memkkms.EnableControls;


  self.Show_Sost;

end;

procedure TDoc_KKM.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='SHOP_NAME' then
    parValue:=SHOP.Text;

  if ParName='REPORT_DATE' then
    parValue:=KKM_DATE.Text;

  if ParName='REPORT_PRIM' then
    parValue:=PRIM.Text;

end;

procedure TDoc_KKM.MemKKMSCalcFields(DataSet: TDataSet);
begin
  memKKMS.FieldByName('CONTROL').asFloat := memKKMS.FieldByName('PROBITO').asFloat -( memKKMS.FieldByName('RN_SUMM').asFloat + memKKMS.FieldByName('PO_SUMM').asFloat - memKKMS.FieldByName('PO_SUMM_1').asFloat -
    memKKMS.FieldByName('TERMINAL_SUMM').asFloat - memKKMS.FieldByName('TERMINAL_SUMM_1').asFloat - memKKMS.FieldByName('TERMINAL_SUMM_2').asFloat);
end;

procedure TDoc_KKM.BTN_USERClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= USER_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> USER_NAME.tag then
       begin
        USER_NAME.tag:=DIC_KLIENT.tag;
        cbUserAll.checked:=false;
        cbUserAll.Enabled:=true;

         IbQuery1.Close;
    	 IbQuery1.SQL.clear;
   	  	 IbQuery1.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
    	 IbQuery1.Parambyname('KLN_ID').asinteger:=USER_NAME.tag;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         USER_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;


       end;

     DIC_KLIENT.Destroy;
end;

procedure TDoc_KKM.cbUserAllClick(Sender: TObject);
begin
	if cbUserAll.Checked then
    begin
    USER_NAME.Tag:=0;
    USER_NAME.Text:='Все';
    end;
end;

end.
