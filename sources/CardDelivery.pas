unit CardDelivery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CurrEdit, Mask, ToolEdit, ComCtrls, Db,
  IBCustomDataSet, IBQuery, IBDatabase, ToolWin, ActnList, RxRichEd,
  RxMemDS, FR_Class, FR_DSet, FR_DBSet, FR_ChBox;

type
  TFCardDelivery = class(TForm)
    CARD_NUM: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    REG_DATE: TDateEdit;
    Label10: TLabel;
    SKID_PERCENT: TRxCalcEdit;
    Label4: TLabel;
    CARD_DATE: TDateEdit;
    REG_USER_FULL: TEdit;
    Label5: TLabel;
    Label11: TLabel;
    CARD_OSN: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    KLN_FULL: TEdit;
    Label14: TLabel;
    KLN_FIO: TEdit;
    Label15: TLabel;
    KLN_BIRTHDAY: TDateEdit;
    Label16: TLabel;
    KLN_ADDRESS: TMemo;
    Label18: TLabel;
    Button1: TButton;
    Bevel1: TBevel;
    StatusBar1: TStatusBar;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    CARD_TOTALSUM: TRxCalcEdit;
    Label2: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BtnSAVE: TToolButton;
    ActionList1: TActionList;
    ActDelivery: TAction;
    KLN_ADDINFO: TRxRichEdit;
    btnChangeCard: TToolButton;
    ToolButton4: TToolButton;
    Timer1: TTimer;
    Label3: TLabel;
    KLN_PHONE: TEdit;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    KLN_REKLAMA_DOP: TEdit;
    check_sms: TCheckBox;
    print_anketa: TButton;
    frCheckBoxObject1: TfrCheckBoxObject;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1CARD_NUM: TIntegerField;
    RxMemoryData1KLN_FIO: TStringField;
    RxMemoryData1REG_DATE: TDateField;
    RxMemoryData1KLN_ADDRESS: TStringField;
    RxMemoryData1KLN_ADDINFO: TStringField;
    RxMemoryData1KLN_PHONE: TStringField;
    RxMemoryData1KLN_SEX: TStringField;
    RxMemoryData1KLN_REKLAMA_DOP: TStringField;
    RxMemoryData1KLN_REKLAMA_INFO: TStringField;
    RxMemoryData1CHECK_SMS: TIntegerField;
    RxMemoryData1reklama_info1: TIntegerField;
    RxMemoryData1reklama_info2: TIntegerField;
    RxMemoryData1reklama_info3: TIntegerField;
    RxMemoryData1reklama_info4: TIntegerField;
    RxMemoryData1reklama_info5: TIntegerField;
    RxMemoryData1reklama_info6: TIntegerField;
    RxMemoryData1reklama_info7: TIntegerField;
    RxMemoryData1reklama_info8: TIntegerField;
    RxMemoryData1reklama_info9: TIntegerField;
    RxMemoryData1KLN_SEX1: TIntegerField;
    RxMemoryData1KLN_SEX2: TIntegerField;
    RxMemoryData1CARD_DATE: TStringField;
    RxMemoryData1check_pers_dann: TIntegerField;
    check_pers_dann: TCheckBox;
    RxMemoryData1KLN_BIRTHDAY: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ActDeliveryExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnChangeCardClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure print_anketaClick(Sender: TObject);
  private
    NEW_DISKONT_NUM:ansistring;
    procedure SaveRegistrationInfo;
    procedure Change_FrmKln;

    { Private declarations }
  public
    { Public declarations }
    function ConfirmModeShowModal: Integer; virtual;
  end;

var
  FCardDelivery: TFCardDelivery;

implementation

uses Data1, CardSkid, B_Utils, B_DBUtils, DicKlient;

{$R *.DFM}

var
  SAVE:boolean;
  isConfirmMode : boolean = false; //по умолчанию - обычный режим выдачи карты (не подтверждения данных)
  //поле для хранения дополнительной информации о клиенте - на случай, если ее надо будет дополнить
  _save_KLN_ADDINFO :string;
  CARD_SHOP, _saveUS_ID: longint;

procedure TFCardDelivery.FormActivate(Sender: TObject);
begin
KLN_FIO.SetFocus;
end;

//сохраняет информацию о выдачи карты в базу данных
procedure TFCardDelivery.SaveRegistrationInfo;
var
   r:double;


   reklama_info: string;
begin
 SAVE:=False;
 if (FCardDelivery.tag<0) then
  begin
   //этой ветки быть не может, ПОТОМУ ЧТО НЕ МОЖЕТ БЫТЬ никогда
   Messbox('Номер диконтной карты не определён! Проведите ей через считыватель!',MessSystem,48);
   SAVE := True;
   exit;
  end
 else
  begin
   //Прверяем наличие регистрации нашей карты
   WorkTransaction.Active:=False;
   ADD_SQL(IbQuery1,'select card_date from card where card_num=:card_num');
   IbQuery1.parambyname('CARD_NUM').asstring:=CARD_NUM.text;
   IbQuery1.Open;
   if IbQuery1.eof then  //этого не может быть
      Messbox('Карта с таким номером не зарегистрирована!',MessSystem,48)
   else
    if (IBQuery1.FieldByName('CARD_DATE').isNull) or (isConfirmMode) then
    begin //карта зарег,но не выдана. Или мы в режиме подтверждения данных
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
       IBSAVE_CLEAR;
       if (IBQuery1.FieldByName('CARD_DATE').isNull) then
        IBSAVE_ADD('CARD_DATE',Now()); //иначе это подтверждение - не надо сохранять этолт момент
       IBSAVE_ADD('CARD_OSN',CARD_OSN.Text);
       if CARD_SHOP = -1 then
        IBSAVE_ADD('SHOP_ID',SHOPID)
       else
        IBSAVE_ADD('US_ID',CARD_SHOP);
       if _saveUS_ID = -1 then
        IBSAVE_ADD('US_ID',USERID)
       else
        IBSAVE_ADD('US_ID',_saveUS_ID); 
       if KLN_FULL.tag = -1 then
         IBSAVE_ADD('KLN_ID',DEFAULT_KLIENT)
       else
        IBSAVE_ADD('KLN_ID',KLN_FULL.Tag);
       IBSAVE_ADD('KLN_FIO',KLN_FIO.Text);
       if kln_birthday.Date < 0 then raise Exception.Create('Неправильно введен день рождения клиента');
       if (KLN_BIRTHDAY.Date <> date()) then //если поле - это не сегодняшняя дата, то пишем
         IBSAVE_ADD('KLN_BIRTHDAY',KLN_BIRTHDAY.Date);
       IBSAVE_ADD('KLN_ADDRESS',KLN_ADDRESS.Text);
//       if (CARD_ADDSUMM.enabled) then //у этого пользователя есть право на перезапись данного поля
       IBSAVE_ADD('KLN_ADDINFO',KLN_ADDINFO.Text);
//       else //есть право только дописывать информацию
//        IBSAVE_ADD('KLN_ADDINFO',
//          '--дополнение от ' + DateTimeToStr(now()) + '--' + #13#10 +
//            KLN_ADDINFO.Text + '---' +  #13#10 +
//            _save_KLN_ADDINFO);
//       IBSAVE_ADD('CARD_ADDSUMM',CARD_ADDSUMM.value);



       IBSAVE_ADD('KLN_PHONE',KLN_PHONE.Text);
       IBSAVE_ADD('KLN_REKLAMA_DOP',KLN_REKLAMA_DOP.Text);

       if (RadioButton1.Checked) then
               IBSAVE_ADD('KLN_SEX',1)
       else
       if (RadioButton2.Checked) then
               IBSAVE_ADD('KLN_SEX',2)
       else
               IBSAVE_ADD('KLN_SEX',0);

       reklama_info := '0000000000';
       if (checkbox1.Checked) then reklama_info[1] := '1';
       if (checkbox2.Checked) then reklama_info[2] := '1';
       if (checkbox3.Checked) then reklama_info[3] := '1';
       if (checkbox4.Checked) then reklama_info[4] := '1';
       if (checkbox5.Checked) then reklama_info[5] := '1';
       if (checkbox6.Checked) then reklama_info[6] := '1';
       if (checkbox7.Checked) then reklama_info[7] := '1';
       if (checkbox8.Checked) then reklama_info[8] := '1';
       if (checkbox9.Checked) then reklama_info[9] := '1';

       IBSAVE_ADD('KLN_REKLAMA_INFO',reklama_info);

       if (check_sms.Checked) then
               IBSAVE_ADD('CHECK_SMS',1)
       else IBSAVE_ADD('CHECK_SMS',0);

       if (check_pers_dann.Checked) then
               IBSAVE_ADD('check_pers_dann',1)
       else IBSAVE_ADD('check_pers_dann',0);

       FCardDelivery.tag:=IBSAVE_DOC('CARD',FCardDelivery.tag);
       if FCardDelivery.tag<0 then r:=Sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SAVE:=True;
       WorkTranSaction.Active:=False;
     except
       on e: Exception do
       begin
       Datamodule1.IBTransaction2.RollBAck;
       Messbox('Ошибка при сохранении дисконтной карты!'+chr(13)+chr(10)+e.message,MessSystem,16);
       end;
     end;
     Datamodule1.IBTransaction2.Active:=False;
   end;
end;
end;

//диалог в режиме подтверждения данных карты по клиенту
function TFCARDDelivery.ConfirmModeShowModal: Integer;
begin
 try
  isConfirmMode := true;
  ActDelivery.Caption := 'ОК. Данные о клиенте верны';
  ActDelivery.Hint := 'ОК. Данные о клиенте верны';
  FCardDelivery.Caption := 'Подтверждение персональных данных клиента';
  result := ShowModal;
 finally
  isConfirmMode := false;
 end;
end;

procedure TFCardDelivery.FormShow(Sender: TObject);
var reklama_info: string;
begin
    if FCardDelivery.tag>0 then begin
       {Правим (выдаем) зарегистрированную карту}
       WorkTransaction.Active:=False;
       IbQuery1.Close;
       IbQuery1.SQL.Text :='select  sum(rns.tw_kol*(cast(((rns.tw_money*(1-(rns.tw_skiddoll)/100))*'+
       '(1-(rns.tw_skid+RN.rn_skid)/100))*100 as integer))/100), '+
       'sum(rns.tw_kol*(rns.tw_money*RN.rn_skid/100)) '+
       'from RN, rns '+
       'where (RN.RN_ID = rns.rn_id) '+
       'and rn.card_id = :CARD_ID '+
       'AND (not (rn.rn_prow="0")) ';
       IbQuery1.ParamByname('CARD_ID').asinteger:=FCardDelivery.tag;
       IbQuery1.Open;
       CARD_TOTALSUM.value := IbQuery1.fieldByname('SUM').asfloat;
       ibquery1.Close;

       WorkTransaction.Active:=False;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select card.*,BG_left(kln.kln_fam||" "||'+
         'Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME,1))||". "||Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME2,1))'+
         '||".",254) as reg_user_full from card left join kln on card.reg_user_id=kln.kln_id '+
         'where card_id=:card_id');
       IbQuery1.ParamByname('CARD_ID').asinteger:=FCardDelivery.tag;
       IbQuery1.Open;
       CARD_NUM.text:=IbQuery1.fieldByname('CARD_NUM').asstring;
       REG_DATE.date:=IbQuery1.fieldByname('REG_DATE').asdatetime;
       CARD_TOTALSUM.value:=CARD_TOTALSUM.value+IbQuery1.fieldByname('CARD_ADDSUMM').asfloat;
       if IbQuery1.fieldByname('KLN_ID').isNull then
         KLN_FULL.tag:= -1
       else
        KLN_FULL.tag:=IbQuery1.fieldByname('KLN_ID').asinteger;
       if IbQuery1.fieldByname('SHOP_ID').isNull then
         CARD_SHOP:= -1
       else
         CARD_SHOP:=IbQuery1.fieldByname('SHOP_ID').asinteger;
       if IbQuery1.fieldByname('SHOP_ID').isNull then
         CARD_SHOP:= -1
       else
         CARD_SHOP:=IbQuery1.fieldByname('SHOP_ID').asinteger;
       if IbQuery1.fieldByname('US_ID').isNull then
         _saveUS_ID:= -1
       else
         _saveUS_ID:=IbQuery1.fieldByname('US_ID').asinteger;
       REG_USER_FULL.text:=IbQuery1.fieldByname('REG_USER_FULL').asstring;
       if IbQuery1.fieldByname('CARD_DATE').isNull then
        CARD_DATE.date:=date()
       else  CARD_DATE.date:= IbQuery1.fieldByname('CARD_DATE').asdatetime;
       CARD_OSN.text:=IbQuery1.fieldByname('CARD_OSN').asstring;
       KLN_FIO.Text:=IbQuery1.fieldByname('KLN_FIO').asstring;
       KLN_BIRTHDAY.Date:=IbQuery1.fieldByname('KLN_BIRTHDAY').asdatetime;
       KLN_ADDRESS.text:=IbQuery1.fieldByname('KLN_ADDRESS').asstring;


       KLN_PHONE.Text := IbQuery1.fieldByname('KLN_PHONE').asstring;
       KLN_REKLAMA_DOP.Text := IbQuery1.fieldByname('KLN_REKLAMA_DOP').asstring;
       reklama_info := IbQuery1.fieldByname('KLN_REKLAMA_INFO').asstring;

       check_sms.Checked := (IbQuery1.fieldByname('CHECK_SMS').asstring='1');
       check_pers_dann.Checked := (IbQuery1.fieldByname('check_pers_dann').asstring='1');



       if(IbQuery1.fieldByname('KLN_SEX').asstring='1') then RadioButton1.Checked:=true;
       if(IbQuery1.fieldByname('KLN_SEX').asstring='2') then RadioButton2.Checked:=true;

       if (length(reklama_info) > 9) then
       begin
         if (reklama_info[1] = '1') then checkbox1.Checked := true;
         if (reklama_info[2] = '1') then checkbox2.Checked := true;
         if (reklama_info[3] = '1') then checkbox3.Checked := true;
         if (reklama_info[4] = '1') then checkbox4.Checked := true;
         if (reklama_info[5] = '1') then checkbox5.Checked := true;
         if (reklama_info[6] = '1') then checkbox6.Checked := true;
         if (reklama_info[7] = '1') then checkbox7.Checked := true;
         if (reklama_info[8] = '1') then checkbox8.Checked := true;
         if (reklama_info[9] = '1') then checkbox9.Checked := true;
       end;

{

 IBSAVE_ADD('KLN_PHONE',KLN_PHONE.Text);
       IBSAVE_ADD('KLN_REKLAMA_DOP',KLN_REKLAMA_DOP.Text);

       if (RadioButton1.Checked) then
               IBSAVE_ADD('KLN_SEX',1)
       else
       if (RadioButton2.Checked) then
               IBSAVE_ADD('KLN_SEX',2)
       else
               IBSAVE_ADD('KLN_SEX',0);

       reklama_info := '0000000000';
       if (checkbox1.Checked) then reklama_info[1] := '1';
       if (checkbox2.Checked) then reklama_info[2] := '1';
       if (checkbox3.Checked) then reklama_info[3] := '1';
       if (checkbox4.Checked) then reklama_info[4] := '1';
       if (checkbox5.Checked) then reklama_info[5] := '1';
       if (checkbox6.Checked) then reklama_info[6] := '1';
       if (checkbox7.Checked) then reklama_info[7] := '1';
       if (checkbox8.Checked) then reklama_info[8] := '1';
       if (checkbox9.Checked) then reklama_info[9] := '1';

       IBSAVE_ADD('KLN_REKLAMA_INFO',reklama_info);

}




//       CARD_ADDSUMM.enabled:=CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM'); // Разрешение добавления скидок на дисконт
       if (CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM')) then
         KLN_ADDINFO.text:=IbQuery1.fieldByname('KLN_ADDINFO').asstring
       else KLN_ADDINFO.text:='';
       _save_KLN_ADDINFO := IbQuery1.fieldByname('KLN_ADDINFO').asstring;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select skid_percent from get_cardskid( :card_id, 0)');
       IbQuery1.ParamByname('CARD_ID').asinteger:=FCardDelivery.tag;
       IbQuery1.Open;
       SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
    end else begin
       {Новая  - незарегистрированная карта. Такого быть не может, поэтому так и пишем.}
        Messbox('Карта с номером '+CARD_NUM.Text+' не зарегистрирована! '+
          'Провести операцию невозможно',MessSystem,48);
        Close;  //закрываемся
    end;
  Change_FrmKln;
    CARD_OSN.Enabled := CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM');;

    KLN_ADDINFO.text := KLN_ADDINFO.text + ' ';
    kln_addinfo.SetSelection(0, length(KLN_ADDINFO.text)-1, false);
    kln_addinfo.SelAttributes.Protected := true;

end;

procedure TFCardDelivery.FormCreate(Sender: TObject);
begin
  Get_DEFAULT;
end;

procedure TFCardDelivery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IbQuery1.close;
  WorkTransaction.Active:=False;
end;

procedure TFCardDelivery.Button1Click(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN_FULL.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_FULL.tag then begin
        KLN_FULL.tag:=DIC_KLIENT.tag;
        Change_FrmKln;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TFCardDelivery.Change_FrmKln;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID )');
     IbQuery1.Parambyname('KLN_ID').asinteger:=KLN_FULL.tag;
     IbQuery1.Open;
     if IbQuery1.eof then
       KLN_FULL.text:=''
     else
       KLN_FULL.text:=IbQuery1.fieldbyname('KLN_FULL').asstring;
     IbQuery1.Close;
end;
procedure TFCardDelivery.ToolButton1Click(Sender: TObject);
begin
 My_Lock;
end;

procedure TFCardDelivery.ActDeliveryExecute(Sender: TObject);
begin
 SaveRegistrationInfo; //сохраняем информацию в базе
 if SAVE then close;
end;

procedure TFCardDelivery.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ((key='%') or (key=';') )  then begin
     NEW_DISKONT_NUM:='';
     Timer1.enabled:=True;
  end;

  if Timer1.enabled then begin
     if key=#13 then begin
        key:=#0;
        Timer1.Enabled:=False;
        Timer1.OnTimer(Sender);
     end;
     if key in ['0'..'9'] then begin
         NEW_DISKONT_NUM:=NEW_DISKONT_NUM+KEY;
         key:=#0;
     end;
     Statusbar1.panels[0].text:=NEW_DISKONT_NUM;
     key:=#0;
  end
end;

procedure TFCardDelivery.btnChangeCardClick(Sender: TObject);
begin
  if  self.Color = clBtnFace then
  begin
    StatusBar1.Panels[0].Text:='Ввод нового дисконта';
    self.Color := clGreen;


  end
//  else




//GET_DISKONT(NEW_DISKONT_NUM,DISKONT_PERCENT,NEW_KLN_ID,NEW_KLN_FULL, false, true, summ);
end;

procedure TFCardDelivery.Timer1Timer(Sender: TObject);
var NEW_DISKONT_ID: integer;
  kln_id: integer;
  KLN_FULL_1: string;
  skid: double;
  summ: double;

begin
   NEW_DISKONT_ID:=0;
   skid:=skid_percent.Value;
   summ := card_totalSum.Value;
   Try
     Timer1.Enabled:=False;
     Statusbar1.panels[0].text:='';
     {Определяем ID дисконтной карты}

     //result := AutoRegister_CARD();
{     IBSAVE_CLEAR;
     IBSAVE_ADD('CARD_DATE',Now());
     IBSAVE_ADD('US_ID', USERID);
     IBSAVE_DOC('CARD',result);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
}

//     Application.createForm(TFCARDDelivery, FCARDDelivery);
//     FCARDDelivery.tag:=result;
//               FCARDDelivery.ShowModal; //диалог в режиме выдачи карты
///     FCARDDelivery.ConfirmModeShowModal; //диалог в режиме выдачи карты
//     FCARDDelivery.Destroy;



     NEW_DISKONT_ID:=GET_DISKONT(NEW_DISKONT_NUM,skid,KLN_ID,KLN_FULL_1, true, true, summ, true);
     StatusBar1.Panels[0].Text:='';
     self.Color := clBtnFace;

     if ((new_diskont_id>0)  and (new_diskont_id <>FCardDelivery.tag)) then //авто регистрация прошла или такая карта уже была зарегистрирована.
     //, подменяем коды в карточке. старую карту надо заблокировать
     begin

        IBSAVE_CLEAR;
        IBSAVE_ADD('CARD_ADDSUMM', card_totalsum.value); //сумма +
        IBSAVE_DOC('CARD',NEW_DISKONT_ID);



        //записать для новой карты те же скидки что и для старой

        DataModule1.IbSaveSQL.SQL.Text:='insert into cardskidlink (card_id, cardskid_id) select :new_card_id, cardskid_id from cardskidlink where carD_id=:old_card_id ';
        DataModule1.IbSaveSQL.ParamByName('old_card_id').asinteger:=FCardDelivery.tag;
        DataModule1.IbSaveSQL.ParamByName('new_card_id').asinteger:=NEW_DISKONT_ID;
        DataModule1.IbSaveSQL.ExecSQL;








        IBSAVE_CLEAR;
        IBSAVE_ADD('CARD_ID',FCardDelivery.tag);
        IBSAVE_ADD('CARDSKID_ID',102007); //7 - блокировка
        IBSAVE_DOC('CARDSKIDLINK',-1);

        IBSAVE_CLEAR;
        IBSAVE_ADD('CARD_ID',FCardDelivery.tag);
        IBSAVE_ADD('CARDSKID_ID',1202022); //12 - замена
        IBSAVE_DOC('CARDSKIDLINK',-1);
        Datamodule1.IBTransaction2.Commit;



        CARD_NUM.Text:=NEW_DISKONT_NUM;
        FCardDelivery.tag:=NEW_DISKONT_ID;
        SaveRegistrationInfo;
     end;




  Except
  end;
end;

procedure TFCardDelivery.print_anketaClick(Sender: TObject);
begin
        SaveRegistrationInfo;

        RxMemoryData1.EmptyTable;
        RxMemoryData1.Insert;

        RxMemoryData1.FieldByName('CARD_NUM').asString:=CARD_NUM.Text;
        RxMemoryData1.FieldByName('CARD_DATE').asString:=CARD_DATE.Text;
        RxMemoryData1.FieldByName('KLN_FIO').asString:=KLN_FIO.Text;
        RxMemoryData1.FieldByName('KLN_BIRTHDAY').asString:=KLN_BIRTHDAY.Text;
        RxMemoryData1.FieldByName('KLN_ADDRESS').asString:=KLN_ADDRESS.Text;
        RxMemoryData1.FieldByName('KLN_ADDINFO').asString:=KLN_ADDINFO.Text;
        RxMemoryData1.FieldByName('KLN_PHONE').asString:=KLN_PHONE.Text;

        RxMemoryData1.FieldByName('KLN_SEX1').asInteger:= 0;
        RxMemoryData1.FieldByName('KLN_SEX2').asInteger:= 0;
        if ( RadioButton1.checked)then RxMemoryData1.FieldByName('KLN_SEX1').asInteger:= 1;
        if ( RadioButton2.checked)then RxMemoryData1.FieldByName('KLN_SEX2').asInteger:= 1;

        RxMemoryData1.FieldByName('KLN_REKLAMA_DOP').asString:=KLN_REKLAMA_DOP.Text;

        RxMemoryData1.FieldByName('reklama_info1').asInteger:=0;
        if (checkbox1.Checked) then RxMemoryData1.FieldByName('reklama_info1').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info2').asInteger:=0;
        if (checkbox2.Checked) then RxMemoryData1.FieldByName('reklama_info2').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info3').asInteger:=0;
        if (checkbox3.Checked) then RxMemoryData1.FieldByName('reklama_info3').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info4').asInteger:=0;
        if (checkbox4.Checked) then RxMemoryData1.FieldByName('reklama_info4').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info5').asInteger:=0;
        if (checkbox5.Checked) then RxMemoryData1.FieldByName('reklama_info5').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info6').asInteger:=0;
        if (checkbox6.Checked) then RxMemoryData1.FieldByName('reklama_info6').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info7').asInteger:=0;
        if (checkbox7.Checked) then RxMemoryData1.FieldByName('reklama_info7').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info8').asInteger:=0;
        if (checkbox8.Checked) then RxMemoryData1.FieldByName('reklama_info8').asInteger:=1;
        RxMemoryData1.FieldByName('reklama_info9').asInteger:=0;
        if (checkbox9.Checked) then RxMemoryData1.FieldByName('reklama_info9').asInteger:=1;




        RxMemoryData1.FieldByName('CHECK_SMS').asInteger:=0;
        if ( check_sms.checked)then RxMemoryData1.FieldByName('CHECK_SMS').asInteger:= 1;
        RxMemoryData1.FieldByName('check_pers_dann').asInteger:=0;
        if ( check_pers_dann.checked)then RxMemoryData1.FieldByName('check_pers_dann').asInteger:= 1;


        rxMemoryData1.Post;


        frReport1.ShowReport;
end;

end.
