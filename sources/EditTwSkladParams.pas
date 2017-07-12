unit EditTwSkladParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit, IBDatabase, Db,
  IBCustomDataSet, IBQuery,VclUtils,Data1,B_DButils, b_utils, RxMemDS,
  RXSpin;

type
  Tedit_tw_sklad_params = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label41: TLabel;
    Label56: TLabel;
    TW_PALET_KOL: TRxCalcEdit;
    TW_PALET_UCHET: TCheckBox;
    Button2: TButton;
    TW_PALET_KUBATORA: TRxCalcEdit;
    TW_LENGTH: TRxCalcEdit;
    TW_WIDTH: TRxCalcEdit;
    TW_HEIGHT: TRxCalcEdit;
    chk_stored_in_up: TCheckBox;
    tw_kol_in_up: TRxCalcEdit;
    up_length: TRxCalcEdit;
    up_width: TRxCalcEdit;
    up_height: TRxCalcEdit;
    chk_typical_palet: TCheckBox;
    palet_length: TRxCalcEdit;
    palet_width: TRxCalcEdit;
    palet_height: TRxCalcEdit;
    up_kol_in_pal: TRxCalcEdit;
    checkNegabarit: TCheckBox;
    up_kubatura: TRxCalcEdit;
    ed_kubatura: TRxCalcEdit;
    GroupBox2: TGroupBox;
    btnSave1: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1tw_kol: TFloatField;
    RxMemoryData1zone_name: TStringField;
    RxMemoryData1zone_id: TIntegerField;
    RxMemoryData1id: TIntegerField;
    DataSource1: TDataSource;
    Button4: TButton;
    Label3: TLabel;
    RxMemoryData1skl_id: TIntegerField;
    RxMemoryData1skl_short: TStringField;
    IBQuery2: TIBQuery;
    RxMemoryData1save: TBooleanField;
    Label5: TLabel;
    tw_srok: TRxSpinEdit;
    tw_date_proizv00: TStringField;
    Label22: TLabel;
    TW_WEIGHT: TRxCalcEdit;
    RxMemoryData1tw_srok_ost: TIntegerField;
    RxMemoryData1ZONE_OST_TW_SROK_ID: TIntegerField;
    RxMemoryData1tw_date_proizv1: TDateField;
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure TW_LENGTHChange(Sender: TObject);
    procedure doCalcSkladPaletParams();
    procedure TW_LENGTHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chk_stored_in_upClick(Sender: TObject);
    procedure tw_kol_in_upChange(Sender: TObject);
    procedure up_lengthChange(Sender: TObject);
    procedure up_lengthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure palet_lengthChange(Sender: TObject);
    procedure palet_lengthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chk_typical_paletClick(Sender: TObject);
    procedure btnSave1Click(Sender: TObject);
    procedure loadzoneDistrib();
    procedure savezoneDistrib();
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
        form_loading: boolean;
        tw_id: integer;
  public
    { Public declarations }
  end;

var
  edit_tw_sklad_params: Tedit_tw_sklad_params;

implementation

uses WaitForm;

{$R *.DFM}

procedure Tedit_tw_sklad_params.FormShow(Sender: TObject);
begin
        self.MaskEdit1.SetFocus;
        self.MaskEdit1.SelectAll;

        self.btnSave1.Enabled:=check_dostup('$DICTW.EDIT_SKLAD_PARAMS');
end;

procedure tedit_tw_sklad_params.savezoneDistrib();
begin
//
end;


procedure tedit_tw_sklad_params.loadzoneDistrib();
begin
     tag:=0;


     ///загрузить распределение из ZONE_REG
     ibquery1.sql.Text:='SELECT zone_id, tw_kol, skl_id, skl_short, zone_name, ZONE_OST_TW_SROK.tw_datE_proizv, '+
     ' case when ZONE_OST_TW_SROK.tw_datE_proizv =''30.12.1899'' then NULL else tw.tw_srok - (cast(''now''-ZONE_OST_TW_SROK.tw_datE_proizv  as integer))/30    end srok_ost, '+
     ' ZONE_OST_TW_SROK.ZONE_OST_TW_SROK_ID '+
     ' FROM ZONE_OST left join zone on zone.zone_id = zone_ost.zone_id LEFT JOIN SKL ON SKL.SKL_ID=ZONE_OST.SKL_ID left join tw on tw.tw_id = zone_ost.tw_id '+
     ' left join ZONE_OST_TW_SROK on ZONE_OST_TW_SROK.zone_id = zone_ost.zone_id and ZONE_OST_TW_SROK.tw_id = zone_ost.tw_id '+
     ' WHERE zone_ost.tw_id=:tw_id and bg_abs(zone_ost.tw_kol)>0.001';
     ibquery1.ParamByName('tw_id').asInteger := tw_id;

     ibquery1.Open;

     rxMemoryData1.EmptyTable;

     while not ibquery1.Eof do
     begin
        rxMemoryData1.Append;
        rxmemoryData1.FieldByName('tw_kol').asFloat:=ibquery1.fieldbyname('tw_kol').asfloat;
//        rxmemoryData1.FieldByName('tw_id').asFloat:=tw_id;
        rxmemoryData1.FieldByName('zone_id').asinteger:=ibquery1.fieldbyname('zone_id').asinteger;
        rxmemoryData1.FieldByName('skl_id').asinteger:=ibquery1.fieldbyname('skl_id').asinteger;
        rxmemoryData1.FieldByName('skl_short').asstring:=ibquery1.fieldbyname('skl_short').asstring;
        rxmemoryData1.FieldByName('zone_name').asString:=ibquery1.fieldbyname('ZONE_NAME').asstring;
        RxMemoryData1.FieldByName('tw_date_proizv').asString:=ibquery1.fieldbyname('tw_datE_proizv').asString;

        RxMemoryData1.FieldByName('tw_srok_ost').asFloat:=ibquery1.fieldbyname('srok_ost').asFloat;
        RxMemoryData1.FieldByName('ZONE_OST_TW_SROK_ID').asinteger:=ibquery1.fieldbyname('ZONE_OST_TW_SROK_ID').asinteger;
        if (RxMemoryData1.FieldByName('ZONE_OST_TW_SROK_ID').asinteger=0) then
                RxMemoryData1.FieldByName('ZONE_OST_TW_SROK_ID').asinteger:=-1;



        RxMemoryData1.FieldByName('save').asBoolean := true;
        ibquery1.next;
     end;

     ibquery1.close;
end;

procedure Tedit_tw_sklad_params.MaskEdit1Change(Sender: TObject);
begin

        self.label2.Caption:='';

        tw_id:=0;

        TW_WEIGHT.value:=0;
        tw_length.value:=0;
        tw_width.value:=0;
        tw_height.value:=0;
        up_length.value:=0;
        up_width.value:=0;
        up_height.value:=0;
        palet_length.value:=0;
        palet_width.value:=0;
        palet_height.value:=0;

        ed_kubatura.value:=0;
        up_kubatura.value:=0;
        TW_PALET_KUBATORA.value:=0;

        tw_kol_in_up.value:=0;
        tw_palet_kol.value:=0;
        up_kol_in_pal.value:=0;

        tw_srok.Value:=12;



        chk_stored_in_up.Checked:= false;
        chk_typical_palet.Checked:= false;
        TW_PALET_UCHET.Checked:= false;
        checkNegabarit.Checked:= false;




        if (length(self.MaskEdit1.Text)>0) then
        begin
                ibquery1.SQL.Text:='select * from tw where tw_art = :tw_art and tw_brak=0';

                ibquery1.ParamByName('tw_art').asString:=self.MaskEdit1.Text;
                ibquery1.open;
                if (not ibquery1.eof) then
                begin
                        self.label2.Caption:=ibquery1.fieldByName('tw_nam').asString;

                        form_loading:=true;

                        tw_id:=ibquery1.fieldbyname('tw_id').asInteger;

                        TW_WEIGHT.value:=ibquery1.fieldbyname('TW_WEIGHT').asFloat;

                        tw_length.value:=ibquery1.fieldbyname('tw_length').asFloat;
                        tw_width.value:=ibquery1.fieldbyname('tw_width').asFloat;
                        tw_height.value:=ibquery1.fieldbyname('tw_height').asFloat;
                        up_length.value:=ibquery1.fieldbyname('up_length').asFloat;
                        up_width.value:=ibquery1.fieldbyname('up_width').asFloat;
                        up_height.value:=ibquery1.fieldbyname('up_height').asFloat;
                        palet_length.value:=ibquery1.fieldbyname('up_length').asFloat;
                        palet_width.value:=ibquery1.fieldbyname('up_width').asFloat;
                        palet_height.value:=ibquery1.fieldbyname('up_height').asFloat;

                        ed_kubatura.value:=ibquery1.fieldbyname('tw_ed_kubatura').asFloat;
                        up_kubatura.value:=ibquery1.fieldbyname('tw_up_kubatura').asFloat;
                        TW_PALET_KUBATORA.value:=ibquery1.fieldbyname('tw_palet_kubatora').asFloat;

                        tw_kol_in_up.value:=ibquery1.fieldbyname('tw_kol_in_up').asFloat;
                        tw_palet_kol.value:=ibquery1.fieldbyname('tw_palet_kol').asFloat;
                        up_kol_in_pal.value:=ibquery1.fieldbyname('up_kol_in_pal').asFloat;


                        chk_stored_in_up.Checked:= (ibquery1.fieldbyname('chk_stored_in_up').asInteger=1);
                        chk_typical_palet.Checked:= (ibquery1.fieldbyname('chk_typical_palet').asInteger=1);
                        TW_PALET_UCHET.Checked:= (ibquery1.fieldbyname('TW_PALET_UCHET').asInteger=1);
                        checkNegabarit.Checked:= (ibquery1.fieldbyname('TW_NEGABARIT').asInteger=1);

                        tw_srok.Value:=ibquery1.fieldbyname('tw_srok').asInteger;





                        form_loading:=false;




                        
                end;

                LoadZoneDistrib();

        end;

//        ibquery1.Close;
//        ibquery1.Transaction.Commit;
end;

procedure Tedit_tw_sklad_params.doCalcSkladPaletParams();
begin

//28-07-2014
//расчет объема единицы по приоритетам начиная от палеты
//проверить, то не введено значение вручную или ноль





if ((tw_kol_in_up.Value>0) and (up_kubatura.Value > 0))then
        ed_kubatura.Value:= up_kubatura.Value / tw_kol_in_up.Value
else

if ((TW_PALET_KOL.Value> 0) and (TW_PALET_KUBATORA.Value>0)) then
        ed_kubatura.Value:= TW_PALET_KUBATORA.Value / TW_PALET_KOL.Value
else
        ed_kubatura.Value:= tw_width.Value * tw_length.Value * tw_height.Value;







//

if (chk_stored_in_up.Checked) and (chk_typical_palet.Checked) then
//типовая палета в упаковках (плитка)
//можно посчитать кол-во товара на палете, указав колво товара в упаковке и посчитав/указав количество упаковок на палете
begin


end;

if (chk_typical_palet.Checked) then
//типовая палета - можно посчитать количество товара/упаковок на такой палете
//в том случае если указываются габаритные размеры товара/упаковок
begin
end;




end;

procedure Tedit_tw_sklad_params.TW_LENGTHChange(Sender: TObject);
begin

if (form_loading) then
        exit;
    //изменился размер товара:
    //1. менять кубатуру палеты      ??????????
    //2. менять количество упаковок в палете   ???????????????
    //1. менять размер упаковки?
    //2. менять количество товаров в упаковке  ???????????????


    if (ed_kubatura.Value = 0) then
        ed_kubatura.Value:= tw_width.Value * tw_length.Value * tw_height.Value;


//28-07-2014
    doCalcSkladPaletParams();
    exit;

end;

procedure Tedit_tw_sklad_params.TW_LENGTHKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        ed_kubatura.Value:=0;
        application.ProcessMessages;
end;

procedure Tedit_tw_sklad_params.chk_stored_in_upClick(Sender: TObject);
begin
  up_length.Enabled := chk_stored_in_up.Checked;
  up_width.Enabled := chk_stored_in_up.Checked;
  up_height.Enabled := chk_stored_in_up.Checked;
  tw_kol_in_up.Enabled := chk_stored_in_up.Checked;
  up_kol_in_pal.Enabled := chk_stored_in_up.Checked;
end;

procedure Tedit_tw_sklad_params.tw_kol_in_upChange(Sender: TObject);
begin
if (form_loading) then
        exit;
        doCalcSkladPaletParams();
end;

procedure Tedit_tw_sklad_params.up_lengthChange(Sender: TObject);
begin
    //изменился размер упаковки:
    //1. менять кубатуру палеты      ??????????
    //2. менять количество упаковок в палете   ???????????????

if (form_loading) then
        exit;


    //28-07-2014
    if (up_kubatura.value=0) then
            up_kubatura.Value:=up_width.Value*up_length.Value*up_height.Value;
    doCalcSkladPaletParams();




end;

procedure Tedit_tw_sklad_params.up_lengthKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        up_kubatura.Value:=0;
        application.ProcessMessages;
end;

procedure Tedit_tw_sklad_params.palet_lengthChange(Sender: TObject);
begin
//    if (TW_PALET_KUBATORA.tag = 'calc_from_palet_razm') then

if (form_loading) then
        exit;


      if (TW_PALET_KUBATORA.Value = 0) then
      if (palet_width.Value*palet_length.Value*palet_height.Value > 1) then
      begin
            //  self.chk_typical_palet.Checked:=false;
              TW_PALET_KUBATORA.Value :=palet_width.Value*palet_length.Value*palet_height.Value;
      end
      else
              TW_PALET_KUBATORA.Value := 1;

end;

procedure Tedit_tw_sklad_params.palet_lengthKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        TW_PALET_KUBATORA.Value := 0;
        application.ProcessMessages;
end;

procedure Tedit_tw_sklad_params.chk_typical_paletClick(Sender: TObject);
begin
if (form_loading) then
        exit;

if (chk_typical_palet.Checked) then
begin
        self.palet_width.Value:=1.0;
        self.palet_length.Value:=1.0;
        self.palet_height.Value:=1.0;
        self.TW_PALET_KUBATORA.Value:=1.0;
        self.palet_width.Enabled:=false;
        self.palet_length.Enabled:=false;
        self.palet_height.Enabled:=false;
        TW_PALET_KUBATORA.Enabled:=false;
end
else
begin
        self.palet_width.Enabled:=true;
        self.palet_length.Enabled:=true;
        self.palet_height.Enabled:=true;
        TW_PALET_KUBATORA.Enabled:=true;
end;

        doCalcSkladPaletParams();
end;

procedure Tedit_tw_sklad_params.btnSave1Click(Sender: TObject);
var i_value: integer;
N: integer;
r: double;
begin

        {Сохраняем}
       Wait_Form.StatusBar1.panels[0].text:='Запись карточки товара';
       Wait_Form.Gauge1.Progress:=2;
       Wait_Form.Show;
       Delay(1);
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;

         IBSAVE_ADD('TW_NEGABARIT',checkNEGABARIT.checked);

         IBSAVE_ADD('TW_WEIGHT',TW_WEIGHT.value);

         IBSAVE_ADD('TW_LENGTH',TW_LENGTH.value);
         IBSAVE_ADD('TW_WIDTH',TW_WIDTH.value);
         IBSAVE_ADD('TW_HEIGHT',TW_HEIGHT.value);

         IBSAVE_ADD('TW_PALET_UCHET', TW_PALET_UCHET.checked);
         i_value:=round(TW_PALET_KOL.value+0.499999);
         IBSAVE_ADD('TW_PALET_KOL',i_value);
         IBSAVE_ADD('TW_PALET_KUBATORA',TW_PALET_KUBATORA.value);


         IBSAVE_ADD('CHK_STORED_IN_UP',CHK_STORED_IN_UP.checked);
         IBSAVE_ADD('CHK_TYPICAL_PALET',CHK_TYPICAL_PALET.checked);
         i_value:=round(0.49999+UP_KOL_IN_PAL.value);
         IBSAVE_ADD('UP_KOL_IN_PAL',i_value);
         i_value:=round(0.49999+TW_KOL_IN_UP.value);
         IBSAVE_ADD('TW_KOL_IN_UP',i_value);
         IBSAVE_ADD('UP_LENGTH',UP_LENGTH.value);
         IBSAVE_ADD('UP_WIDTH',UP_WIDTH.value);
         IBSAVE_ADD('UP_HEIGHT',UP_HEIGHT.value);

         IBSAVE_ADD('PALET_LENGTH',PALET_LENGTH.value);
         IBSAVE_ADD('PALET_WIDTH',PALET_WIDTH.value);
         IBSAVE_ADD('PALET_HEIGHT',PALET_HEIGHT.value);



         IBSAVE_ADD('TW_ED_KUBATURA',ed_kubatura.value);
         IBSAVE_ADD('TW_UP_KUBATURA',up_kubatura.value);

         IBSAVE_ADD('TW_SROK',TW_SROK.value);

         
         N:=IBSAVE_DOC('TW',tw_id);

         if n<0 then r:=sqrt(-1) else
         begin

         Wait_Form.Gauge1.Progress:=100;
               Delay(100);
               Datamodule1.IBTransaction2.Commit;

               Datamodule1.IBTransaction2.Active:=False;

         end;

          except
          Messbox('Ошибка при сохранении!',MessError,48);
          Datamodule1.IBTransaction2.RollBack;
       end;
       Datamodule1.IBTransaction2.Active:=False;

       Wait_Form.Hide;

end;

procedure Tedit_tw_sklad_params.Button4Click(Sender: TObject);
begin
        RxMemoryData1.Append;
end;

procedure Tedit_tw_sklad_params.Button3Click(Sender: TObject);
var id: integer;
i: integer;
var zone_id: integer;
ZONE_OST_TW_SROK_ID : integer;
begin
//сохранение распределения
//1. сохранить зоны которые без кода
//2. сохранить движение товара в эти зоны
        ID:=RxMemoryData1.RecNo;
         RxMemoryData1.DisableControls;
         RxMemoryData1.First;
//         ost:=full_tw_kol;

         while not RxMemoryData1.eof do begin
              ibquery2.SQL.Text:='SELECT ZONE_ID FROM ZONE WHERE ZONE_NAME=:zone_name and skl_id=:skl_id';
              ibquery2.ParamByName('ZONE_NAME').asString := RxMemoryData1.FieldByName('ZONE_NAME').ASString;
              ibquery2.ParamByName('skl_id').asInteger := 25;

              ibquery2.Open;

              if (not ibquery2.Eof) then
              begin
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('ZONE_ID').asInteger := ibquery2.fieldByName('ZONE_ID').asInteger;
                RxMemoryData1.Post;

//--                IBSAVE_CLEAR;
//--                zone_id:=IBSAVE_DOC('ZONE', ibquery2.fieldByName('ZONE_ID').asInteger);

              end

              else
//              if (RxMemoryData1.FieldByName('ZONE_ID').asstring = '') then
              begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('ZONE_NAME', RxMemoryData1.FieldByName('ZONE_NAME').ASString);

                IBSAVE_ADD('SKL_ID', 25);
                zone_id:=IBSAVE_DOC('ZONE', -1);
                Datamodule1.IBTransaction2.Commit;
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('ZONE_ID').asInteger := zone_id;
                RxMemoryData1.Post;
              end;

              ibquery2.Close;



              if (RxMemoryData1.FieldByName('save').asBoolean=false) then         //вставка
              begin
                ibquery2.SQL.Text:='insert into zone_ost (tw_id, zone_id, tw_kol, skl_id, date_proizv) values(:tw_id, :zone_id, :tw_kol, :skl_id, :date_proizv)';
              end
              else
              begin                     //обновление
                ibquery2.sql.Text:='update zone_ost set tw_kol = :tw_kol, date_proizv=:date_proizv where tw_id=:tw_id and zone_id=:zone_id and skl_id = :skl_id';
              end;

              ibquery2.ParamByName('tw_id').asInteger:=tw_id;
              ibquery2.ParamByName('zone_id').asInteger:=RxMemoryData1.FieldByName('zone_id').asInteger;
              ibquery2.ParamByName('skl_id').asInteger:=25;
              ibquery2.ParamByName('tw_kol').asFloat:=RxMemoryData1.FieldByName('tw_kol').asFloat;
              ibquery2.ParamByName('date_proizv').asString:=RxMemoryData1.FieldByName('tw_date_proizv').ASString;


              ibquery2.ExecSQL;



              Datamodule1.IBTransaction2.Commit;
             // if (rxMemoryData1.FieldByName('zone_reg_id').asInteger < 1) then
              begin
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('save').asBoolean := true;
                RxMemoryData1.Post;
              end;




              IBSAVE_CLEAR;
              IBSAVE_ADD('tw_id', tw_id);
              IBSAVE_ADD('zone_id', RxMemoryData1.FieldByName('ZONE_ID').asInteger);
              IBSAVE_ADD('tw_datE_proizv', RxMemoryData1.FieldByName('tw_datE_proizv').ASDATETIME);
              ZONE_OST_TW_SROK_ID := RxMemoryData1.FieldByName('ZONE_OST_TW_SROK_ID').asInteger;
              if (ZONE_OST_TW_SROK_ID =0) then
                ZONE_OST_TW_SROK_ID:=-1;
              ZONE_OST_TW_SROK_ID:=IBSAVE_DOC('ZONE_OST_TW_SROK', ZONE_OST_TW_SROK_ID);

              Datamodule1.IBTransaction2.Commit;
              RxMemoryData1.Edit;
              RxMemoryData1.FieldByName('ZONE_OST_TW_SROK_ID').asInteger := ZONE_OST_TW_SROK_ID;
              RxMemoryData1.Post;




             // if (rxMemoryData1.FieldByName('zone_reg_id').asInteger < 1) then
              begin
                RxMemoryData1.Edit;
                RxMemoryData1.FieldByName('save').asBoolean := true;
                RxMemoryData1.Post;
              end;

              RxMemoryData1.next;
         end;
         RxMemoryData1.First;
         for i:=1 to ID-1 do RxMemoryData1.next;
         RxMemoryData1.EnableControls;
         rxmemoryData1.Edit;

         loadZoneDistrib();
end;

procedure Tedit_tw_sklad_params.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
      if rxMemoryData1.FieldByName('tw_srok_ost').asFloat<1 then
  DBGrid1.Canvas.Font.Color:=clred;

  DBGrid1.DefaultDrawColumnCell  (Rect, DataCol, Column, State);
end;

end.
