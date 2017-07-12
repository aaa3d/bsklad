unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ComObj,b_utils, RXSpin, Mask, ToolEdit, CurrEdit,Elves_Unit,
  ExtCtrls, Buttons, ComCtrls, ActnList,AddSumm,DecSumm,ChangeKassir;



type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    FastAddSumm: TAction;
    FastDecSumm: TAction;
    FastChangeKassir: TAction;
    LABEL_MONEY: TLabel;
    LABEL_KOLVO: TLabel;
    LABEL_SEK: TLabel;
    NAME: TEdit;
    MONEY: TRxCalcEdit;
    KOLVO: TRxCalcEdit;
    SEK: TRxSpinEdit;
    NAL: TRxCalcEdit;
    LABEL_NAL: TLabel;
    Button10: TButton;
    FastCancelCheck: TAction;
    FastRegCheck: TAction;
    FastCloseCheck: TAction;
    LAbel_check: TLabel;
    Timer1: TTimer;
    LABEL_NAME: TLabel;
    Timer_name: TTimer;
    Timer_money: TTimer;
    Timer_kolvo: TTimer;
    Timer_sek: TTimer;
    Timer_nal: TTimer;
    Label1: TLabel;
    FastWozwCheck: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure getStatus;
    procedure FastAddSummExecute(Sender: TObject);
    procedure FastDecSummExecute(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FastChangeKassirExecute(Sender: TObject);
    procedure FastCancelCheckExecute(Sender: TObject);
    procedure FastRegCheckExecute(Sender: TObject);
    procedure NAMEKeyPress(Sender: TObject; var Key: Char);
    procedure MONEYKeyPress(Sender: TObject; var Key: Char);
    procedure KOLVOKeyPress(Sender: TObject; var Key: Char);
    procedure SEKKeyPress(Sender: TObject; var Key: Char);
    procedure NALKeyPress(Sender: TObject; var Key: Char);
    procedure FastCloseCheckExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer_nameTimer(Sender: TObject);
    procedure Timer_moneyTimer(Sender: TObject);
    procedure Timer_kolvoTimer(Sender: TObject);
    procedure Timer_sekTimer(Sender: TObject);
    procedure Timer_nalTimer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FastWozwCheckExecute(Sender: TObject);
  private
    { Private declarations }
    fProcessing: boolean;
  public
    { Public declarations }
  end;




var
  Form1: TForm1;
  KASSIR_NUM:integer;
  KASSIR_PASSWORD:string;
  CHECK_MODE:integer;

implementation

{$R *.DFM}



procedure TForm1.FormCreate(Sender: TObject);
begin


  KASSIR_NUM:=1;
  KASSIR_PASSWORD:='1';
  Elves_init;


  Elves_Mode:=1; // Режим регистрации
  Elves_Report:=10; // Почасовой отчет

  Elves_Get_title;    // Читаем заголовок чека
  Elves_Get_Footer;   // Читаем подвал чека

  AX.DeviceEnabled:=True; // Включаем  кассу
end;

procedure Elves_LoadProperties;
begin
//  if not(fProcessing) then
//    begin
//    fProcessing:= TRUE;
//    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
//    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
//    edtName.Text:= AX.Name;
//    edtCaption.Text:= AX.Caption;
//    edtRouteCode.Text:= IntToStr(AX.RouteCode);
//    edtSumm.Text:= FloatToStr(AX.Summ);
//    edtPercents.Text:= FloatToStr(AX.Percents);
//    cbDepartment.ItemIndex:= AX.Department;
//    edtPrice.Text:= FloatToStr(AX.Price);
//    edtQuantity.Text:= FloatToStr(AX.Quantity);
//    cbTypeClose.ItemIndex:= AX.TypeClose;
//    cbDestination.ItemIndex:= AX.Destination;
//    if (AX.Mode=7) then
//      AX.Mode:= 0;
//    cbMode.ItemIndex:= AX.Mode;
//    edtPassword.Text:= AX.Password;
//    chkDisableParamWindow.Checked:= AX.DisableParamWindow;
//    cbReportType.ItemIndex:= AX.ReportType;
 //   chkLockDevices.Checked:= AX.LockDevices;
  //  chkDeviceEnabled.Checked:= AX.DeviceEnabled;
//    case AX.ReportType of
//      0..2:
//        cbReportType.ItemIndex:= AX.ReportType;
//      7..11:
//        cbReportType.ItemIndex:= AX.ReportType-4;
//      else
//        begin
//        cbReportType.ItemIndex:= 1;
//        AX.ReportType:= 1;
//        end;
//    end;
//    if AX.TestMode then
//      cbTestMode.ItemIndex:= 1
//    else
//      cbTestMode.ItemIndex:= 0;
//    if AX.EnableCheckSumm then
//      cbEnableCheckSumm.ItemIndex:=0
//    else
//      cbEnableCheckSumm.ItemIndex:=1;
//    fProcessing:= FALSE;
//    end;
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
   Elves_Print_Title;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   // Почасовой отчет
   FastChangeKassirExecute(Sender);
   Elves_report_print(10);
   GetStatus;
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
  FastChangeKassirExecute(Sender);
  Auto_rezim(Kassir_num,Kassir_password);
  GetStatus;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   // Суточный отчет
   FastChangeKassirExecute(Sender);
   Elves_report_print(2);
   GetStatus;
end;


procedure TForm1.Button7Click(Sender: TObject);
begin
   // Гашение контрольной ленты
   FastChangeKassirExecute(Sender);
   Elves_report_print(0);
   GetStatus;
end;

procedure TForm1.getStatus;
begin
//    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
//    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
    Statusbar2.panels[0].text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
    Statusbar1.panels[0].text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
end;


procedure TForm1.FastAddSummExecute(Sender: TObject);
begin
   application.createForm(TADD_SUMM,ADD_SUMM);
   ADD_SUMM.showModal;
   if ADD_SUMM.tag=2 then begin
      // Переходим в режим регистрации
      Auto_rezim(Kassir_num,kassir_password);
      // Вызываем режим внесения суммы
      ELVES_ADD_SUMM(ADD_SUMM.SUMM.value);
   end;
   ADD_SUMM.close;
   GetStatus;
end;

procedure TForm1.FastDecSummExecute(Sender: TObject);
begin
   application.createForm(TDEC_SUMM,DEC_SUMM);
   DEC_SUMM.showModal;
   if DEC_SUMM.tag=2 then begin
      // Переходим в режим регистрации
      Auto_rezim(Kassir_num,kassir_password);
      // Вызываем режим снятия выручки
      ELVES_DEC_SUMM(DEC_SUMM.SUMM.value);
   end;
   DEC_SUMM.close;
   GetStatus;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Auto_rezim(0,Kassir_password);
  ELVES_test_print;
  Auto_rezim(Kassir_num,Kassir_password);
  GetStatus;
end;

procedure TForm1.FastChangeKassirExecute(Sender: TObject);
begin
   // Выводим операцию смены кассира
   Application.createForm(TChange_kassir,change_kassir);
   Change_kassir.showmodal;
   kassir_num:=-1;
   kassir_password:='fff';
   if Change_kassir.tag=2 then begin
      kassir_num:=trunc(Change_kassir.num.value);
      kassir_password:=Change_kassir.password.text;
      // Производим операцию смены кассира;
      if kassir_num<29 then Auto_rezim(1,kassir_password); // Кассиры
      if kassir_num=29 then Auto_rezim(2,kassir_password); // Администратор
      if kassir_num=30 then Auto_rezim(3,kassir_password); // Системный администратор
   end;
   Change_kassir.close;
   GetStatus;
end;

procedure TForm1.FastCancelCheckExecute(Sender: TObject);
begin
   // Аннулируе чек
   Timer_name.enabled:=False;
   Timer_money.enabled:=False;
   Timer_kolvo.enabled:=False;
   Timer_sek.enabled:=False;
   Timer_nal.enabled:=False;
   label_money.visible:=true;
   label_kolvo.visible:=true;
   label_sek.visible:=true;
   label_nal.visible:=true;
   label_name.visible:=true;
   FastRegCheck.enabled:=True;
   FastWozwCheck.enabled:=True;
   Timer1.enabled:=False;
   Label_check.visible:=False;
   NAME.text:='';
   money.value:=1;
   kolvo.value:=1;
   sek.value:=1;
   nal.value:=0;
   NAME.enabled:=False;
   money.Enabled:=False;
   kolvo.enabled:=False;
   sek.enabled:=false;
   nal.enabled:=False;
   Elves_Cancel_check;
   GetStatus;
end;

procedure TForm1.FastRegCheckExecute(Sender: TObject);
begin
  // Начало операции печати чека
  CHECK_MODE:=1; // Режим печати чека
  Label_check.caption:='Идет формирование чека!';
  Timer1.enabled:=True;
  FastRegCheck.enabled:=False;
  FastWozwCheck.enabled:=False;
  NAME.enabled:=True;
  NAME.setfocus;
  Timer_name.enabled:=True;
end;

procedure TForm1.NAMEKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      Timer_name.enabled:=False;
      label_name.visible:=True;
      key:=#9;
      Money.enabled:=True;
      Money.setfocus;
      NAME.enabled:=False;
      Timer_money.enabled:=True;
   end;
   if key=#27 then begin
    FastCancelCheckExecute(Sender);
   end;
end;

procedure TForm1.MONEYKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      Timer_money.enabled:=False;
      label_money.visible:=True;
      key:=#9;
      KolVo.enabled:=True;
      Kolvo.setfocus;
      MONEY.enabled:=False;
      Timer_kolvo.enabled:=True;
   end;
   if key=#27 then begin
      FastCancelCheckExecute(Sender);
   end;
end;

procedure TForm1.KOLVOKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      Timer_kolvo.enabled:=False;
      label_kolvo.visible:=True;
      key:=#9;
      Sek.enabled:=True;
      Sek.setfocus;
      Kolvo.enabled:=False;
      Timer_sek.enabled:=True;
   end;
   if key=#27 then begin
      FastCancelCheckExecute(Sender);
   end;
end;

procedure TForm1.SEKKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      timer_sek.enabled:=False;
      label_sek.visible:=True;
      // Печатаем строку
      if CHECK_MODE=1 then // Регистрация
        ELVES_Reg_towar(name.text,trunc(sek.value),b_utils.okrug(money.value,2),
        b_utils.okrug(Kolvo.value,3),0)
      else // Возврат товара
        ELVES_wozw_towar(name.text,trunc(sek.value),b_utils.okrug(money.value,2),
        b_utils.okrug(Kolvo.value,3));
      // Строка напечатана! Обнуляем и все заново!
      key:=#9;
      NAME.text:='';
      MONEY.value:=0;
      KolVo.value:=1;
      Sek.value:=1;
      NAME.enabled:=True;
      NAME.setfocus;
      Sek.enabled:=False;
      timer_name.enabled:=False;
   end;
   if key=#27 then begin
      FastCancelCheckExecute(Sender);
   end;
end;

procedure TForm1.NALKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
      Timer_nal.enabled:=False;
      label_nal.visible:=True;
      // Закрываем чек
      key:=#9;
      try
        Elves_close_check(b_utils.okrug(NAL.value,2),0);
      except
      end;
      NAME.text:='';
      MONEY.value:=0;
      KolVo.value:=1;
      Sek.value:=1;
      NAME.enabled:=True;
      NAME.setfocus;
      NAL.value:=0;
      Sek.enabled:=False;
  end;
  if key=#27 then begin
     try
     FastCancelCheckExecute(Sender);
     except
     end;
     // Аннулируем чек
  end;
  GetStatus

end;

procedure TForm1.FastCloseCheckExecute(Sender: TObject);
begin
   NAL.Enabled:=true;
   NAL.setfocus;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label_check.Visible:=not Label_check.Visible;
end;

procedure TForm1.Timer_nameTimer(Sender: TObject);
begin
  label_name.visible:=not label_name.visible;
end;

procedure TForm1.Timer_moneyTimer(Sender: TObject);
begin
  label_money.visible:=not label_money.visible;
end;

procedure TForm1.Timer_kolvoTimer(Sender: TObject);
begin
  label_kolvo.visible:=not label_kolvo.visible;

end;

procedure TForm1.Timer_sekTimer(Sender: TObject);
begin
  label_sek.visible:=not label_sek.visible;

end;

procedure TForm1.Timer_nalTimer(Sender: TObject);
begin
  label_nal.visible:=not label_nal.visible;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   // Отчет по кассирам
   FastChangeKassirExecute(Sender);
   Elves_report_print(8);
   GetStatus;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   // Отчет по секциям
   FastChangeKassirExecute(Sender);
   Elves_report_print(7);
   GetStatus;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   // Z - отчет
   FastChangeKassirExecute(Sender);
   // Меняем режим
   Elves_report_print(1);
   GetStatus;
   FastChangeKassirExecute(Sender)


end;

procedure TForm1.FastWozwCheckExecute(Sender: TObject);
begin
  // Начало операции печати чека
  Label_check.caption:='Идет возврат товара!';
  CHECK_MODE:=2; // Режим возврата товара
  Timer1.enabled:=True;
  FastRegCheck.enabled:=False;
  FastWozwCheck.enabled:=False;
  NAME.enabled:=True;
  NAME.setfocus;
  Timer_name.enabled:=True;
end;

end.

