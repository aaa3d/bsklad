unit EditCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, CurrEdit, Mask, ToolEdit, Db, IBCustomDataSet,
  IBQuery, IBDatabase, RxRichEd, FR_RRect, FR_Class, FR_DSet, FR_DBSet,
  DBTables, RxMemDS, FR_ChBox, FR_Rich;

type
  TEdit_CARD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    BtnSAVE: TToolButton;
    BtnApply: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    CARD_NUM: TEdit;
    CARD_DATE: TDateEdit;
    Label3: TLabel;
    KLN_FULL: TEdit;
    Button1: TButton;
    Label4: TLabel;
    US_FULL: TEdit;
    Label5: TLabel;
    CARD_ADDSUMM: TRxCalcEdit;
    Bevel1: TBevel;
    Label6: TLabel;
    CARD_SUMM: TRxCalcEdit;
    Label7: TLabel;
    SKID_SUMM: TRxCalcEdit;
    Label8: TLabel;
    CARD_SKID: TEdit;
    Label9: TLabel;
    SKID_OPIS: TMemo;
    RxDBGrid1: TRxDBGrid;
    CardsTransaction: TIBTransaction;
    QrCards: TIBQuery;
    QrCardsRN_ID: TIntegerField;
    QrCardsRN_NUM_FULL: TIBStringField;
    QrCardsRN_DATE: TDateTimeField;
    QrCardsRN_COLOR: TIntegerField;
    QrCardsKLN_FULL: TIBStringField;
    QrCardsRN_SUMM: TFloatField;
    QrCardsSKID_SUMM: TFloatField;
    QrCardsUS_FULL: TIBStringField;
    DsCards: TDataSource;
    IBQuery1: TIBQuery;
    WorkTransaction: TIBTransaction;
    ToolButton5: TToolButton;
    BtnDel: TToolButton;
    Label10: TLabel;
    SKID_PERCENT: TRxCalcEdit;
    Timer1: TTimer;
    Label11: TLabel;
    CARD_OSN: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    QrCardsRN_TYP: TIntegerField;
    REG_DATE: TDateEdit;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    KLN_FIO: TEdit;
    KLN_BIRTHDAY: TDateEdit;
    KLN_ADDRESS: TMemo;
    REG_USER_FULL: TEdit;
    Label17: TLabel;
    BtnExportToExcel: TToolButton;
    KLN_ADDINFO: TRxRichEdit;
    Label13: TLabel;
    KLN_PHONE: TEdit;
    Label19: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox3: TGroupBox;
    Label20: TLabel;
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
    frReport1: TfrReport;
    frRoundRectObject1: TfrRoundRectObject;
    frDBDataSet1: TfrDBDataSet;
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
    frCheckBoxObject1: TfrCheckBoxObject;
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
    check_pers_dann: TCheckBox;
    RxMemoryData1check_pers_dann: TIntegerField;
    RxMemoryData1KLN_BIRTHDAY: TStringField;
    CheckBox10: TCheckBox;
    RxMemoryData1reklama_info10: TIntegerField;
    Label21: TLabel;
    PASSPORT_SER: TEdit;
    Label22: TLabel;
    PASSPORT_NUMBER: TEdit;
    Label23: TLabel;
    PASSPORT_VIDAN: TEdit;
    RxMemoryData1PASSPORT_SER: TStringField;
    RxMemoryData1PASSPORT_NUMBER: TStringField;
    RxMemoryData1PASSPORT_VIDAN: TStringField;
    frRichObject1: TfrRichObject;
    procedure Change_FrmKln;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CARD_ADDSUMMChange(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CARD_SKIDChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSAVEClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure QrCardsAfterOpen(DataSet: TDataSet);
    procedure QrCardsAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure print_anketaClick(Sender: TObject);
  private
    procedure ExportCARDINFOToExcel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CARD_SHOP:integer;
  SAVE:boolean;
  CAN_SHOW:boolean=FALSE;
  Edit_CARD: TEdit_CARD;
  CARD_SUMM2:double=0;
  NEW_DISKONT_NUM:ansistring='';

implementation

uses DicKlient, DocRn, CardSkid, WaitForm, Request_Response,
     ReportCardInfoToExcel;

{$R *.DFM}

Var
//поле для хранения дополнительной информации о клиенте - на случай, если ее надо будет дополнить
 _save_KLN_ADDINFO :string;
 _save_REG_DATE : TDateTime; //хранит время регистрации карты - для экспорта в ексель...
 _save_CARD_DATE : TDateTime; //хранит время выдачи карты - для экспорта в ексель...
 isDataChanged: boolean = False; //признак, что данные на форме изменились и надо перечитать внешний запрос.

procedure TEdit_CARD.FormShow(Sender: TObject);
var reklama_info: string;
begin
    NEW_DISKONT_NUM:='';
    CardsTransaction.Active:=False;
    QrCARDS.close;
    QrCARDS.ParamByname('CARD_ID').asinteger:=Edit_CARD.tag;
    QrCARDS.Open;
    CAN_SHOW:=False;
    if Edit_CARD.tag>0 then begin
       {Правим карту}
       WorkTransaction.Active:=False;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select card.*,BG_left(kln.kln_fam||" "||Bg_TOUPPER(BG_LEFT('+
          'KLN.KLN_NAME,1))||". "||Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME2,1))||".",254) as us_full '+
          ' from card left join kln on card.us_id=kln.kln_id where card_id=:card_id');
       IbQuery1.ParamByname('CARD_ID').asinteger:=Edit_card.tag;
       IbQuery1.Open;
       CARD_NUM.text:=IbQuery1.fieldByname('CARD_NUM').asstring;
       CARD_DATE.date:=IbQuery1.fieldByname('CARD_DATE').asdatetime;
       _save_CARD_DATE:=IbQuery1.fieldByname('CARD_DATE').asDateTime;
       CARD_ADDSUMM.value:=IbQuery1.fieldByname('CARD_ADDSUMM').asfloat;
       KLN_FULL.tag:=IbQuery1.fieldByname('KLN_ID').asinteger;
       US_FULL.text:=IbQuery1.fieldByname('US_FULL').asstring;
       if (IbQuery1.fieldByname('US_ID').isNull) then
         US_FULL.tag := -1; //признак, что надо будет сохранить пользователя, кто выдал карту 
       REG_DATE.date:=IbQuery1.fieldByname('REG_DATE').asDateTime;
       _save_REG_DATE:=IbQuery1.fieldByname('REG_DATE').asDateTime;
       REG_USER_FULL.tag:=IbQuery1.fieldByname('REG_USER_ID').asInteger;
       KLN_FIO.Text:=IbQuery1.fieldByname('KLN_FIO').asstring;
       KLN_BIRTHDAY.Date:=IbQuery1.fieldByname('KLN_BIRTHDAY').asdatetime;
       KLN_ADDRESS.text:=IbQuery1.fieldByname('KLN_ADDRESS').asstring;
       PASSPORT_SER.text:=IbQuery1.fieldByname('PASSPORT_SER').asstring;
       PASSPORT_NUMBER.text:=IbQuery1.fieldByname('PASSPORT_NUMBER').asstring;
       PASSPORT_VIDAN.text:=IbQuery1.fieldByname('PASSPORT_VIDAN').asstring;



       check_sms.Checked := (IbQuery1.fieldByname('CHECK_SMS').asstring='1');
       check_pers_dann.Checked := (IbQuery1.fieldByname('check_pers_dann').asstring='1');
        KLN_PHONE.Text := IbQuery1.fieldByname('KLN_PHONE').asstring;
       KLN_REKLAMA_DOP.Text := IbQuery1.fieldByname('KLN_REKLAMA_DOP').asstring;
       reklama_info := IbQuery1.fieldByname('KLN_REKLAMA_INFO').asstring;
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
         if (reklama_info[10] = '1') then checkbox10.Checked := true;
       end;




       CARD_ADDSUMM.enabled:=CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM'); // Разрешение добавления скидок на дисконт
//       if (CARD_ADDSUMM.enabled) then
       KLN_ADDINFO.text:=IbQuery1.fieldByname('KLN_ADDINFO').asstring;
//       else KLN_ADDINFO.text:='';
       _save_KLN_ADDINFO := IbQuery1.fieldByname('KLN_ADDINFO').asstring;
       CARD_OSN.text:=IbQuery1.fieldByname('CARD_OSN').asstring;
       CARD_SHOP:=IbQuery1.fieldByname('SHOP_ID').asinteger;
       CARD_SKID.text:='';
       SKID_OPIS.Lines.clear;
       //показываем ФИО зарегистрировавшего карту              
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select BG_left(kln.kln_fam||" "||'+
         'Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME,1))||". "||Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME2,1))'+
         '||".",254) as reg_user_full from kln where kln.kln_id  = :KLN_ID');
       IbQuery1.ParamByname('KLN_ID').asinteger:=REG_USER_FULL.tag;
       IbQuery1.Open;
       REG_USER_FULL.Text:=IbQuery1.fieldByname('REG_USER_FULL').asString;

       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select skid_percent from get_cardskid( :card_id, 0)');
       IbQuery1.ParamByname('CARD_ID').asinteger:=Edit_card.tag;
       IbQuery1.Open;
       SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select cardskid_num from cardskid,cardskidlink where cardskid.cardskid_id=cardskidlink.cardskid_id and cardskidlink.card_id= :card_id');
       IbQuery1.ParamByname('CARD_ID').asinteger:=Edit_card.tag;
       IbQuery1.Open;
       while not IbQuery1.eof do begin
          CARD_SKID.text:=CARD_SKID.text+' '+IbQuery1.fieldByname('CARDSKID_NUM').asstring;
          IbQuery1.next;
       end;
    end else begin
       {Новая карта}
       CARD_NUM.text:='';
       CARD_DATE.date:=date();
       CARD_ADDSUMM.value:=0;
       KLN_FULL.tag:=DEFAULT_KLIENT;
       US_FULL.text:=USERFIO;
       US_FULL.tag :=-1;
       CARD_OSN.text:='';
       CARD_SHOP:=SHOPID;
       CARD_SKID.text:='';
       SKID_OPIS.lines.clear;
       SKID_PERCENT.value:=0;
    end;
    Change_FRMKLN;
    QrCARDS.DisableControls;
    QrCARDS.First;
    CARD_SUMM2:=0;
    SKID_SUMM.value:=0;
    while not QrCARDS.eof do begin
          CARD_SUMM2:=CARD_SUMM2+QrCARDS.fieldByname('RN_SUMM').asfloat;
          SKID_SUMM.value:=SKID_SUMM.value+QrCARDS.fieldByname('SKID_SUMM').asfloat;
          QrCARDS.next;
    end;
    CARD_SUMM.value:=CARD_SUMM2+CARD_ADDSUMM.value;
    QrCARDS.First;
    QrCARDS.EnableControls;
    CAN_SHOW:=true;
    TImer1.OnTimer(Sender);
//    CARD_ADDSUMM.enabled:=CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM'); // Разрешение добавления скидок на дисконт
    CARD_SKID.enabled:=CHECK_DOSTUP('$SERVIS.CARD.SKID_NUM'); // Разрешение правки номерных скидок
    CARD_OSN.Enabled := card_addsumm.enabled;

    KLN_ADDINFO.text := KLN_ADDINFO.text + ' ';
    kln_addinfo.SetSelection(0, length(KLN_ADDINFO.text)-1, false);
    kln_addinfo.SelAttributes.Protected := true;

end;

procedure TEdit_CARD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QrCARDS.close;
    IbQuery1.close;
    CardsTransaction.Active:=False;
    WorkTransaction.Active:=False;
    if isDataChanged  then ModalResult:= mrOk else
     ModalResult:= mrCancel; 
end;

procedure TEdit_CARD.Button1Click(Sender: TObject);
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

procedure TEdit_CARD.Change_FrmKln;
var
   s1:ansistring;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID )');
     IbQuery1.Parambyname('KLN_ID').asinteger:=KLN_FULL.tag;
     IbQuery1.Open;
     s1:='';
     if IbQuery1.eof then begin
     end else begin
         s1:=IbQuery1.fieldbyname('KLN_FULL').asstring;
     end;
     KLN_FULL.text:=s1;
     IbQuery1.Close;
end;

procedure TEdit_CARD.CARD_ADDSUMMChange(Sender: TObject);
begin
    CARD_SUMM.value:=CARD_SUMM2+CARD_ADDSUMM.value;
end;

procedure TEdit_CARD.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='RN_NUM_FULL' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='RN_NUM_FULL' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger;
        end;
     end;

end;

procedure TEdit_CARD.CARD_SKIDChange(Sender: TObject);
begin
     timer1.Enabled:=False;
     timer1.Enabled:=True;
end;

procedure TEdit_CARD.Timer1Timer(Sender: TObject);
var
   s2,s:ansistring;
   a:integer;
begin
   Try
     Timer1.enabled:=False;
     if CAN_SHOW then begin
        {Отображаем скидки}
        s:='';
        for a:=1 to ARGV(CARD_SKID.text) do s:=s+'"'+ARGC(CARD_SKID.text,a)+'",';
        if length(s)>0 then s:=B_utils.left(s,length(s)-1) else s:='""';
        WorkTransaction.Active:=False;
        IbQuery1.close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select CARDSKID_NAME FROM CARDSKID WHERE CARDSKID_NUM IN ('+S+')');
        IbQuery1.Open;
        SKID_OPIS.lines.clear;
        s2:='';
        while not IbQuery1.eof do begin
          s2:=s2+IbQuery1.fieldByname('CARDSKID_NAME').asstring+', ';
          IbQuery1.next;
        end;
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-2) else s2:='Только скидка по накопительной сумме!';
        SKID_OPIS.lines.add(s2);
        IbQuery1.close;
     end;
   Except
   ENd;
end;

procedure TEdit_CARD.BtnApplyClick(Sender: TObject);
var
   r:double;
   NEWID:integer;
   a:integer;
   s:ansistring;
   EN:boolean;
   reklama_info: string;
begin
 SAVE:=False;
 if CARD_NUM.text='' then Messbox('Номер диконтной карты не определён! Проведите ей через считыватель!',MessSystem,48) else begin
   // Прверяем наличие такой карты
   if Edit_CARD.tag<0 then begin
      WorkTransaction.Active:=False;
      ADD_SQL(IbQuery1,'select card_id from card where card_num=:card_num');
      IbQuery1.parambyname('CARD_NUM').asstring:=CARD_NUM.text;
      IbQuery1.Open;
      if IbQuery1.eof then EN:=true else EN:=False;
   end else EN:=true;
   if not EN then begin
     Messbox('Карта с таким номером уже зарегистрирована!',MessSystem,48);
   end else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
       IBSAVE_CLEAR;
//       IBSAVE_ADD('CARD_NUM',CARD_NUM.text);
       IBSAVE_ADD('KLN_ID',KLN_FULL.tag);
//       if (US_FULL.tag = -1) then //только в этом случае надо сохранить этот параметр
//         IBSAVE_ADD('US_ID',USERID);
//       IBSAVE_ADD('CARD_DATE',CARD_DATE.date); - это не тут должно схраняться
//       IBSAVE_ADD('SHOP_ID',CARD_SHOP);
       IBSAVE_ADD('CARD_OSN',CARD_OSN.text);
       IBSAVE_ADD('KLN_FIO',KLN_FIO.Text);
       if (KLN_BIRTHDAY.Date <> date()) then //если поле - это не сегодняшняя дата, то пишем
         IBSAVE_ADD('KLN_BIRTHDAY',KLN_BIRTHDAY.Date);
       IBSAVE_ADD('KLN_ADDRESS',KLN_ADDRESS.Text);
//       if (CARD_ADDSUMM.enabled) then //у этого пользователя есть право на перезапись данного поля
        IBSAVE_ADD('KLN_ADDINFO',KLN_ADDINFO.Text);
        IBSAVE_ADD('PASSPORT_SER',PASSPORT_SER.Text);
        IBSAVE_ADD('PASSPORT_NUMBER',PASSPORT_NUMBER.Text);
        IBSAVE_ADD('PASSPORT_VIDAN',PASSPORT_VIDAN.Text);

       IBSAVE_ADD('KLN_PHONE',KLN_PHONE.Text);
       IBSAVE_ADD('KLN_REKLAMA_DOP',KLN_REKLAMA_DOP.Text);

       if (RadioButton1.Checked) then
               IBSAVE_ADD('KLN_SEX',1)
       else
       if (RadioButton2.Checked) then
               IBSAVE_ADD('KLN_SEX',2)
       else
               IBSAVE_ADD('KLN_SEX',0);

       reklama_info := '00000000000';
       if (checkbox1.Checked) then reklama_info[1] := '1';
       if (checkbox2.Checked) then reklama_info[2] := '1';
       if (checkbox3.Checked) then reklama_info[3] := '1';
       if (checkbox4.Checked) then reklama_info[4] := '1';
       if (checkbox5.Checked) then reklama_info[5] := '1';
       if (checkbox6.Checked) then reklama_info[6] := '1';
       if (checkbox7.Checked) then reklama_info[7] := '1';
       if (checkbox8.Checked) then reklama_info[8] := '1';
       if (checkbox9.Checked) then reklama_info[9] := '1';
       if (checkbox10.Checked) then reklama_info[10] := '1';

       IBSAVE_ADD('KLN_REKLAMA_INFO',reklama_info);
       if (check_sms.Checked) then
               IBSAVE_ADD('CHECK_SMS',1)
       else IBSAVE_ADD('CHECK_SMS',0);
       if (check_pers_dann.Checked) then
               IBSAVE_ADD('check_pers_dann',1)
       else IBSAVE_ADD('check_pers_dann',0);       

//       else //есть право только дописывать информацию
//        IBSAVE_ADD('KLN_ADDINFO',
//         '--дополнение от ' + DateTimeToStr(now()) + '--' + #13#10 +
 //           KLN_ADDINFO.Text + '---' +  #13#10 +
//            _save_KLN_ADDINFO);
       IBSAVE_ADD('CARD_ADDSUMM',CARD_ADDSUMM.value);
       Edit_CARD.tag:=IBSAVE_DOC('CARD',Edit_CARD.tag);
       if Edit_CARD.tag<0 then r:=Sqrt(-1);
       {Удаляем старую политику скидок}
       DataModule1.IbSaveSQL.close;
       DataModule1.IbSaveSQL.SQL.clear;
       DataModule1.IbSaveSQL.SQL.add('delete from cardskidlink where card_id= :card_id');
       DataModule1.IbSaveSQL.ParamByname('CARD_id').asinteger:=Edit_CARD.tag;
       DataModule1.IbSaveSQL.ExecSQL;
       {Сохраняем новую подлитику скидок}
           s:='';
           for a:=1 to ARGV(CARD_SKID.text) do s:=s+'"'+ARGC(CARD_SKID.text,a)+'",';
           if length(s)>0 then s:=B_utils.left(s,length(s)-1) else s:='""';
           WorkTransaction.Active:=False;
           IbQuery1.close;
           IbQuery1.SQL.clear;
           IbQuery1.SQL.add('select CARDSKID_ID FROM CARDSKID WHERE CARDSKID_NUM IN ('+S+')');
           IbQuery1.Open;
           while not IbQuery1.eof do begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('CARD_ID',Edit_CARD.tag);
                 IBSAVE_ADD('CARDSKID_ID',IbQuery1.fieldByname('CARDSKID_ID').asinteger);
                 NEWID:=IBSAVE_DOC('CARDSKIDLINK',-1);
                 if NEWID<0 then r:=sqrt(-1);
                 IbQuery1.next;
           end;
       Datamodule1.IBTransaction2.Commit;
       SAVE:=True;
       WorkTranSaction.Active:=False;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select skid_percent from get_cardskid( :card_id, 0)');
       IbQuery1.ParamByname('CARD_ID').asinteger:=Edit_card.tag;
       IbQuery1.Open;
       SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
       Timer1.OnTimer(Sender);
     except
       Datamodule1.IBTransaction2.RollBAck;
       Messbox('Ошибка при сохранении пластиковой карты!',MessSystem,16);
     end;
     Datamodule1.IBTransaction2.Active:=False;
     isDataChanged:= True;
   end;
end;
end;

procedure TEdit_CARD.BtnSAVEClick(Sender: TObject);
begin
     BtnApply.click;
     if SAVE then ModalResult := mrOk; //выходим с признаком, что надо перечитать запрос
end;

procedure TEdit_CARD.BtnDelClick(Sender: TObject);
var
   r:double;
begin
     if Messbox('Удалить с дисконтной карты выбранные покупки?',MessSubmitDelete,4+48+256)=6 then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       Try
         IBSAVE_CLEAR;
         IBSAVE_ADD('CARD_ID',0);
         if IBSAVE_DOC('RN',QrCards.fieldByname('RN_ID').asinteger)<0 then r:=Sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         CardsTransaction.Active:=False;
         QrCARDS.close;
         QrCARDS.ParamByname('CARD_ID').asinteger:=Edit_CARD.tag;
         QrCARDS.Open;
         WorkTranSaction.Active:=False;
         IbQuery1.Close;
         IbQuery1.SQL.clear;
         IbQuery1.SQL.Add('select skid_percent from get_cardskid( :card_id, 0)');
         IbQuery1.ParamByname('CARD_ID').asinteger:=Edit_card.tag;
         IbQuery1.Open;
         SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
         QrCARDS.DisableControls;
         QrCARDS.First;
         CARD_SUMM2:=0;
         SKID_SUMM.value:=0;
         while not QrCARDS.eof do begin
               CARD_SUMM2:=CARD_SUMM2+QrCARDS.fieldByname('RN_SUMM').asfloat;
               SKID_SUMM.value:=SKID_SUMM.value+QrCARDS.fieldByname('SKID_SUMM').asfloat;
               QrCARDS.next;
         end;
         CARD_SUMM.value:=CARD_SUMM2+CARD_ADDSUMM.value;
         QrCARDS.First;
         QrCARDS.EnableControls;
       Except
         Datamodule1.IBTransaction2.RollBack;
       End;
       Datamodule1.IBTransaction2.Active:=False;
     end;
end;

procedure TEdit_CARD.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#10 then begin
        try
           key:=#0;
           CARD_SKID.setfocus;
           CARD_ADDSUMM.setfocus;
           if BtnSave.Enabled then BtnSave.click;
        except
        end;
     end;
end;

procedure TEdit_CARD.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=46) and (btnDel.enabled) then BtnDel.click;
end;

procedure TEdit_CARD.FormCreate(Sender: TObject);
begin
  Get_DEFAULT;
  isDataChanged:= False;
end;

procedure TEdit_CARD.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TEdit_CARD.QrCardsAfterOpen(DataSet: TDataSet);
begin
        if QrCards.eof then BtnDel.enabled:=false else BtnDel.enabled:=true;
end;

procedure TEdit_CARD.QrCardsAfterScroll(DataSet: TDataSet);
begin
        BtnDel.enabled:=true;
end;

procedure TEdit_CARD.RxDBGrid1DblClick(Sender: TObject);
var
   ID:integer;
begin
 if IS_EDIT_RN then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48) else begin
   Application.CreateForm(TDoc_RN,Doc_RN);
   ID:=QrCardsRN_ID.Value;
   Doc_RN.tag:=ID;
   Doc_RN.ToolBar1.Tag:=QrCardsRN_TYP.Value;
   Doc_RN.StatusBar1.Tag:=1;//только наличный расчет. Где взять эту информацию-я не знаю
   Doc_RN.showModal;
   Doc_RN.destroy;
   QrCards.Close;
   CardsTransaction.Active:=False;
   QrCards.Open;
   QrCARDS.DisableControls;
   QrCARDS.First;
   CARD_SUMM2:=0;
   SKID_SUMM.value:=0;
   while not QrCARDS.eof do begin
        CARD_SUMM2:=CARD_SUMM2+QrCARDS.fieldByname('RN_SUMM').asfloat;
        SKID_SUMM.value:=SKID_SUMM.value+QrCARDS.fieldByname('SKID_SUMM').asfloat;
        QrCARDS.next;
   end;
   CARD_SUMM.value:=CARD_SUMM2+CARD_ADDSUMM.value;
   QrCARDS.First;
   QrCARDS.EnableControls;
   QrCards.locate('RN_ID',ID,[]);
end;
end;

procedure TEdit_CARD.BtnExportToExcelClick(Sender: TObject);
begin
  ExportCARDINFOToExcel();
end;

//выгружает все текущие данные по дисконтной карте в Excel
procedure TEdit_CARD.ExportCARDINFOToExcel();
Var
  _tmpRequest : TParamRequest;
  ReportCardInfoToExcel : TReportCardInfoToExcel;
begin
 try
  //формирование объекта запроса параметров для передачи в отчет
  _tmpRequest := TParamRequest.Create();
  Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  Application.ProcessMessages;
//  _tmpRequest.AddParam('ReportName', 'Детальная информация по дисконтной пластиковой карте'); //название отчета
  _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
  _tmpRequest.AddParam('QMain', QrCards); //запрос по расх.накладным по карте
  _tmpRequest.AddParam('CARD_NUM', CARD_NUM.Text); //
  _tmpRequest.AddParam('REG_DATE', _save_REG_DATE); //
  _tmpRequest.AddParam('CARD_DATE', _save_CARD_DATE); //
  _tmpRequest.AddParam('CARD_ADDSUMM', CARD_ADDSUMM.Value); //
  _tmpRequest.AddParam('CARD_OSN', CARD_OSN.Text); //
  _tmpRequest.AddParam('CARD_SKID', CARD_SKID.Text); //
  _tmpRequest.AddParam('SKID_OPIS', SKID_OPIS.Lines.Text); //
  _tmpRequest.AddParam('REG_USER_FULL', Trim(REG_USER_FULL.Text)); //
  _tmpRequest.AddParam('US_FULL', Trim(US_FULL.Text)); //
  _tmpRequest.AddParam('KLN_FULL', Trim(KLN_FULL.Text)); //
  _tmpRequest.AddParam('KLN_FIO', KLN_FIO.Text); //
  _tmpRequest.AddParam('KLN_BIRTHDAY', KLN_BIRTHDAY.Date); //
  _tmpRequest.AddParam('KLN_ADDRESS', KLN_ADDRESS.Lines.Text); //
  _tmpRequest.AddParam('KLN_ADDINFO', KLN_ADDINFO.Lines.Text); //
  _tmpRequest.AddParam('CARD_SUMM', CARD_SUMM.Value); //
  _tmpRequest.AddParam('SKID_SUMM', SKID_SUMM.Value); //
  _tmpRequest.AddParam('SKID_PERCENT', SKID_PERCENT.Value); //
  try
     ReportCardInfoToExcel := TReportCardInfoToExcel.Create(TParamRequest(_tmpRequest), nil);
     ReportCardInfoToExcel.createReport();
    // ShowMessage('Список карт успешно экспортирован в MS Excel');
  finally
     if (ReportCardInfoToExcel <>nil) then ReportCardInfoToExcel.Free;
  end;
 finally
  Wait_Form.Hide;
  _tmpRequest.Free;
 end;
end;

procedure TEdit_CARD.print_anketaClick(Sender: TObject);
begin

        btnApply.Click;

        RxMemoryData1.EmptyTable;
        RxMemoryData1.Insert;

        RxMemoryData1.FieldByName('CARD_NUM').asString:=CARD_NUM.Text;
        RxMemoryData1.FieldByName('CARD_DATE').asString:=CARD_DATE.Text;
        RxMemoryData1.FieldByName('KLN_FIO').asString:=KLN_FIO.Text;
        RxMemoryData1.FieldByName('KLN_BIRTHDAY').asString:=KLN_BIRTHDAY.Text;
        RxMemoryData1.FieldByName('KLN_ADDRESS').asString:=KLN_ADDRESS.Text;
        RxMemoryData1.FieldByName('KLN_ADDINFO').asString:=KLN_ADDINFO.Text;
        RxMemoryData1.FieldByName('KLN_PHONE').asString:=KLN_PHONE.Text;
        RxMemoryData1.FieldByName('PASSPORT_SER').asString:=PASSPORT_SER.Text;
        RxMemoryData1.FieldByName('PASSPORT_NUMBER').asString:=PASSPORT_NUMBER.Text;
        RxMemoryData1.FieldByName('PASSPORT_VIDAN').asString:=PASSPORT_VIDAN.Text;





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
        RxMemoryData1.FieldByName('reklama_info10').asInteger:=0;
        if (checkbox10.Checked) then RxMemoryData1.FieldByName('reklama_info10').asInteger:=1;




        RxMemoryData1.FieldByName('CHECK_SMS').asInteger:=0;
        if ( check_sms.checked)then RxMemoryData1.FieldByName('CHECK_SMS').asInteger:= 1;
        RxMemoryData1.FieldByName('check_pers_dann').asInteger:=0;
        if ( check_pers_dann.checked)then RxMemoryData1.FieldByName('check_pers_dann').asInteger:= 1;


        rxMemoryData1.Post;


        frReport1.ShowReport;
end;

end.
