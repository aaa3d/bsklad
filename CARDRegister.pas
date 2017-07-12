unit CARDRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CurrEdit, Mask, ToolEdit, ExtCtrls, ComCtrls,
  IBDatabase, Db, IBCustomDataSet, IBQuery, ActnList, ToolWin;

type
  TFRegister = class(TForm)
    CARD_NUM: TEdit;
    Label1: TLabel;
    Label13: TLabel;
    REG_USER_FULL: TEdit;
    Label12: TLabel;
    REG_DATE: TDateEdit;
    Label9: TLabel;
    SKID_OPIS: TMemo;
    CARD_SKID: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    SKID_PERCENT: TRxCalcEdit;
    CARD_ADDSUMM: TRxCalcEdit;
    Label5: TLabel;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    ActRegAndDelivery: TAction;
    ActRegisterCard: TAction;
    ToolButton4: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CARD_SKIDChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ActRegisterCardExecute(Sender: TObject);
    procedure ActRegAndDeliveryExecute(Sender: TObject);
  private
    procedure SaveRegistrationInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  FRegister: TFRegister;

implementation

uses Data1, B_Utils, B_DButils, CardSumm, CardDelivery;

{$R *.DFM}

var
  SAVE:boolean;
  CAN_SHOW:boolean=FALSE;
  CARD_SHOP, KLN_ID : longint;
  _saveREG_DATE : TDateTime;
  NEW_DISKONT_NUM:ansistring='';
  isDataChanged: boolean = False; //признак, что данные на форме изменились и надо перечитать внешний запрос.
  
procedure TFRegister.FormActivate(Sender: TObject);
begin
  if CARD_ADDSUMM.Enabled then
   CARD_ADDSUMM.SetFocus;
end;

procedure TFRegister.Timer1Timer(Sender: TObject);
var
   s2,s:ansistring;
   a:integer;
begin
   Try
     Timer1.enabled:=False;
     if CAN_SHOW then begin
        {ќтображаем скидки}
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
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-2) else s2:='“олько скидка по накопительной сумме!';
        SKID_OPIS.lines.add(s2);
        IbQuery1.close;
     end;
   Except
   End;
end;

//сохран€ет информацию о новой карте в базе данных
procedure TFRegister.SaveRegistrationInfo;
var
   r:double;
   NEWID:integer;
   a:integer;
   s:ansistring;
begin
 SAVE:=False;
 if CARD_NUM.text='' then Messbox('Ќомер диконтной карты не определЄн! '+
     '«акройте окно регистрации и повторно проведите ей через считыватель!',MessSystem,48)
 else
  begin //номер карты не пустой
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   Try
       IBSAVE_CLEAR;
       IBSAVE_ADD('CARD_NUM',CARD_NUM.text);
       if (REG_USER_FULL.tag = -1) then //признак, что надо сохранить пользовател€ из текущего
        IBSAVE_ADD('REG_USER_ID',USERID)
       else  IBSAVE_ADD('REG_USER_ID',REG_USER_FULL.Tag);
       IBSAVE_ADD('SHOP_ID',CARD_SHOP);
       IBSAVE_ADD('KLN_ID',KLN_ID);
       if (REG_DATE.date = date()) then
         IBSAVE_ADD('REG_DATE',Now())
       else  IBSAVE_ADD('REG_DATE',_saveREG_DATE);
       IBSAVE_ADD('CARD_ADDSUMM',CARD_ADDSUMM.value);
       FRegister.tag:=IBSAVE_DOC('CARD',FRegister.tag);
       if FRegister.tag<0 then r:=Sqrt(-1);
       {”дал€ем старую политику скидок}
       DataModule1.IbSaveSQL.close;
       DataModule1.IbSaveSQL.SQL.clear;
       DataModule1.IbSaveSQL.SQL.add('delete from cardskidlink where card_id= :card_id');
       DataModule1.IbSaveSQL.ParamByname('CARD_id').asinteger:=FRegister.tag;
       DataModule1.IbSaveSQL.ExecSQL;
       {—охран€ем новую политику скидок}
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
                 IBSAVE_ADD('CARD_ID',FRegister.tag);
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
       IbQuery1.ParamByname('CARD_ID').asinteger:=FRegister.tag;
       IbQuery1.Open;
       SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
       Timer1.OnTimer(Self);
     except
       Datamodule1.IBTransaction2.RollBAck;
       Messbox('ќшибка при сохранении пластиковой карты!',MessSystem,16);
     end;
     Datamodule1.IBTransaction2.Active:=False;
     isDataChanged:= True;     
   end; //номер карты не пустой
end;

procedure TFRegister.FormCreate(Sender: TObject);
begin
  Get_DEFAULT;
  isDataChanged:= False;  
end;

procedure TFRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IbQuery1.close;
  WorkTransaction.Active:=False;
  if isDataChanged  then ModalResult:= mrOk
  else  ModalResult:= mrCancel;
end;

procedure TFRegister.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#10 then begin
        try
           key:=#0;
           if CARD_SKID.Enabled then
            CARD_SKID.setfocus;
        except
        end;
     end;
end;

procedure TFRegister.FormShow(Sender: TObject);
begin
//эта форма может показатьс€ только дл€ уже зарегистрированной (автоматически) карты.
//если это выданна€ карта -то измен€тс€ только пол€ регистрации. Ќо такого вызова не должно быть в принципе
 NEW_DISKONT_NUM:='';
 CAN_SHOW:=False;
 if FRegister.tag>0 then //существующа€ карта. Ќадо показать информацию о ней
    begin
       {ѕравим карту}
       WorkTransaction.Active:=False;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       //выбираем данные по карте + ‘»ќ зарегистрировавшего карту
       IbQuery1.SQL.Add('select card.*,BG_left(kln.kln_fam||" "||Bg_TOUPPER(BG_LEFT('+
          'KLN.KLN_NAME,1))||". "||Bg_TOUPPER(BG_LEFT(KLN.KLN_NAME2,1))||".",254) as reg_user_full '+
          ' from card left join kln on card.reg_user_id=kln.kln_id where card_id=:card_id');
       IbQuery1.ParamByname('CARD_ID').asinteger:=FRegister.tag;
       IbQuery1.Open;
       CARD_NUM.text:=IbQuery1.fieldByname('CARD_NUM').asstring;
       REG_DATE.date:=IbQuery1.fieldByname('REG_DATE').asdatetime;
       _saveREG_DATE:=IbQuery1.fieldByname('REG_DATE').asdatetime; //чтобы и врем€ запомнить
       CARD_ADDSUMM.value:=IbQuery1.fieldByname('CARD_ADDSUMM').asfloat;
       REG_USER_FULL.tag:=IbQuery1.fieldByname('REG_USER_ID').asInteger;
       REG_USER_FULL.text:=Trim(IbQuery1.fieldByname('REG_USER_FULL').asstring);
       if (IbQuery1.fieldByname('REG_USER_ID').isNull) then
         REG_USER_FULL.tag := -1; //признак, что надо будет сохранить пользовател€, кто зарегистрировал карту в этом диалоге
       CARD_SHOP := IbQuery1.fieldByname('SHOP_ID').asinteger;
       KLN_ID := IbQuery1.fieldByname('KLN_ID').asinteger;
       CARD_SKID.text:='';
       SKID_OPIS.Lines.clear;
       //вы€сн€ем процент текущей скидки
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select skid_percent from get_cardskid( :card_id, 0)');
       IbQuery1.ParamByname('CARD_ID').asinteger:=FRegister.tag;
       IbQuery1.Open;
       SKID_PERCENT.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
       IbQuery1.Close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.Add('select cardskid_num from cardskid,cardskidlink where ' +
          'cardskid.cardskid_id=cardskidlink.cardskid_id and cardskidlink.card_id= :card_id');
       IbQuery1.ParamByname('CARD_ID').asinteger:=FRegister.tag;
       IbQuery1.Open;
       while not IbQuery1.eof do
        begin
          CARD_SKID.text:=CARD_SKID.text+' '+IbQuery1.fieldByname('CARDSKID_NUM').asstring;
          IbQuery1.next;
        end;
    end
   else
    begin //нова€ карта. Ќадо установить пол€ по умолчанию
      CARD_NUM.text:='';
      REG_DATE.date:=date();
      CARD_ADDSUMM.value:=0;
      REG_USER_FULL.text:=USERFIO;
      CARD_SHOP:=SHOPID;
      KLN_ID := DEFAULT_KLIENT;
      CARD_SKID.text:='';
      SKID_OPIS.lines.clear;
      SKID_PERCENT.value:=0;
    end; //нова€ карта. Ќадо установить пол€ по умолчанию
   CAN_SHOW:=true;
   TImer1.OnTimer(Sender);
   CARD_ADDSUMM.enabled:=CHECK_DOSTUP('$SERVIS.CARD.ADD_SUMM'); // –азрешение добавлени€ скидок на дисконт
   CARD_SKID.enabled:=CHECK_DOSTUP('$SERVIS.CARD.SKID_NUM'); // –азрешение правки номерных скидок
end;

procedure TFRegister.CARD_SKIDChange(Sender: TObject);
begin
  timer1.Enabled:=False;
  timer1.Enabled:=True;
end;

procedure TFRegister.ToolButton1Click(Sender: TObject);
begin
 My_Lock;
end;

procedure TFRegister.ActRegisterCardExecute(Sender: TObject);
begin
 SaveRegistrationInfo; //сохран€ем информацию в базе
 if SAVE then close;
end;

procedure TFRegister.ActRegAndDeliveryExecute(Sender: TObject);
begin
 SaveRegistrationInfo; //сохран€ем информацию в базе
 if SAVE then
  begin
    Close; //закрываем форму
    Application.createForm(TFCARDDelivery, FCARDDelivery);
    FCARDDelivery.tag:=FRegister.Tag;
    FCARDDelivery.ShowModal;
    FCARDDelivery.Destroy;
  end;
end;

end.
