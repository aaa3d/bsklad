unit JouCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  StdCtrls;

type
  TJou_CARD = class(TDefault_Journal)
    ListCardTransaction: TIBTransaction;
    QrListCard: TIBQuery;
    DsListCard: TDataSource;
    Timer1: TTimer;
    PFilterInfo: TPanel;
    LFilterInfo: TLabel;
    CBFilterEnabled: TCheckBox;
    BtnFilter: TToolButton;
    ToolButton6: TToolButton;
    BtnDeliveryCARD: TToolButton;
    BtnExportToExcel: TToolButton;
    QrListCardCARD_ID: TIntegerField;
    QrListCardCARD_NUM: TIntegerField;
    QrListCardCARD_FULL_NUM: TIBStringField;
    QrListCardKLN_ID: TIntegerField;
    QrListCardUS_ID: TIntegerField;
    QrListCardCARD_DATE: TDateTimeField;
    QrListCardREG_DATE: TDateTimeField;
    QrListCardREG_USER_ID: TIntegerField;
    QrListCardCARD_COLOR: TIntegerField;
    QrListCardSHOP_ID: TIntegerField;
    QrListCardKLN_BIRTHDAY: TDateTimeField;
    QrListCardUS_FULL: TIBStringField;
    QrListCardREG_USER_FULL: TIBStringField;
    QrListCardCARD_OSN: TIBStringField;
    QrListCardRN_DATE: TDateTimeField;
    QrListCardCARD_SKID: TFloatField;
    QrListCardSUMM_SKID: TFloatField;
    QrListCardSUMM_SALES: TFloatField;
    QrListCardCOUNT_PURCHASE: TIntegerField;
    QrListCardKLN_FIO: TIBStringField;
    QrListCardCARD_NUM_SKID: TIBStringField;
    QrListCardKLN_ADDRESS: TIBStringField;
    QrListCardKLN_ADD_INFO: TIBStringField;
    Timer2: TTimer;
    chkShowblocked: TCheckBox;
    chkShowAnaliz: TCheckBox;
    QrListCardKLN_SEX: TIBStringField;
    QrListCardKLN_SMS: TIBStringField;
    QrListCardKLN_PERS: TIBStringField;
    QrListCardKLN_REKL: TIBStringField;
    QrListCardKLN_PHONE: TIBStringField;
    QrListCardKLN_VOZR: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure QrListCardAfterOpen(DataSet: TDataSet);
    procedure BtnNewClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBFilterEnabledClick(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure QrListCardAfterScroll(DataSet: TDataSet);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BtnDeliveryCARDClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure QrListCardBeforeOpen(DataSet: TDataSet);
    procedure chkShowblockedClick(Sender: TObject);
  private
    procedure ReopenFilterQuery;
    procedure AdjustSQLParameters;
    procedure ExportCARDSListToExcel;
    procedure SetListOrder(const OrderColumn: String; needToChangeOrder:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jou_CARD: TJou_CARD;
  NEW_DISKONT_NUM:ansistring='';
  SEARCH_DISKONT_NUM: ansistring='';

implementation

uses EditCard, FilterCards, CARDRegister, CardDelivery, VCLUtils, WaitForm,
     Request_Response, ReportCardsToExcel;

{$R *.DFM}
Const
 CNAsc = 'ASC'; //прямая сотрировка
 CNDesc = 'DESC'; //обратная сотрировка

Var
 isFullQuery : boolean = false; //признак, какой тект запроса требуется, полный или краткий
 curOrderColumn : String; //текущий столбец сортировки
 curOrderDirection : String; //текущее направление сортировки

procedure TJou_CARD.FormShow(Sender: TObject);
begin
  inherited;
  NEW_DISKONT_NUM:='';
  CBFilterEnabledClick(Self);
//  ReopenFilterQuery();
end;

//переоткрывает наш самый главный запрос
procedure TJou_CARD.ReopenFilterQuery;
begin
 //вставляем текст запроса в компонент
 listCardTransaction.Active:=False;
 QrListCard.Close;
 AdjustSQLParameters(); //настраиваем параметры запроса
 SetListOrder(curOrderColumn, False);
 QrListCard.Open;
 QrListCard.fetchAll;

 StatusBar2.Panels[0].Text:='Отбор: '+inttostr(QrListCard.RecordCount);
end;

//настраивает параметры запроса
procedure TJou_CARD.AdjustSQLParameters();
Var
 i:integer;
begin
 //очищаем все параметры в запросе
 for i:=0 to QrListCard.Params.Count - 1 do
  QrListCard.Params[i].Clear;

  if chkShowblocked.Checked then
    QrListCard.ParamByName('show_Blocked_changed').asinteger := 1
  else
    QrListCard.ParamByName('show_Blocked_changed').asinteger := 0;

  if chkShowAnaliz.Checked then
    QrListCard.ParamByName('in_show_analiz').asinteger := 1
  else
    QrListCard.ParamByName('in_show_analiz').asinteger := 0;

 //фильтрация вообще -то требуется?
 if not CBFilterEnabled.checked then Exit;
 if ffilter.CB1.Checked then //начало периода даты и времени регистрации карты
    QrListCard.ParamByName('REG_DATE_FROM').AsDateTime := Ffilter.DateEdit1.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit1.Value), Trunc(FFilter.RxSpinEdit2.Value),0,0);
 if ffilter.CB2.Checked then //окончание периода даты и времени регистрации карты
    QrListCard.ParamByName('REG_DATE_TO').AsDateTime := Ffilter.DateEdit2.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit3.Value), Trunc(FFilter.RxSpinEdit4.Value),0,0);
 if ffilter.CB3.Checked then //начало периода даты и времени выдачи карты
    QrListCard.ParamByName('CARD_DATE_FROM').AsDateTime := Ffilter.DateEdit3.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit5.Value), Trunc(FFilter.RxSpinEdit6.Value),0,0);
 if ffilter.CB4.Checked then //окончание периода даты и времени выдачи карты
    QrListCard.ParamByName('CARD_DATE_TO').AsDateTime := Ffilter.DateEdit4.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit7.Value), Trunc(FFilter.RxSpinEdit8.Value),0,0);
 if ffilter.CB5.Checked then //начало периода продаж по карте
    QrListCard.ParamByName('SALES_DATE_FROM').AsDateTime := Ffilter.DateEdit5.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit9.Value), Trunc(FFilter.RxSpinEdit10.Value),0,0);
 if ffilter.CB6.Checked then //окончание периода продаж по карте
    QrListCard.ParamByName('SALES_DATE_TO').AsDateTime := Ffilter.DateEdit6.Date +
        EncodeTime(Trunc(FFilter.RxSpinEdit11.Value), Trunc(FFilter.RxSpinEdit12.Value),0,0);
 if ffilter.CB7.Checked then //Интервал скидки (в процентах):
   begin
    QrListCard.ParamByName('CARD_SKID_FROM').AsFloat := FFilter.RxSpinEdit13.Value;
    if not (FFilter.RxSpinEdit14.Value < FFilter.RxSpinEdit13.Value) then
      QrListCard.ParamByName('CARD_SKID_TO').AsFloat := FFilter.RxSpinEdit14.Value;
   end;
 if ffilter.CB9.Checked then //Сумма скидок по карте в интервале
   begin
    QrListCard.ParamByName('SUMM_SKID_FROM').AsCurrency := FFilter.CurrencyEdit3.Value;
    if not (FFilter.CurrencyEdit1.Value < FFilter.CurrencyEdit3.Value) then
      QrListCard.ParamByName('SUMM_SKID_TO').AsCurrency := FFilter.CurrencyEdit1.Value;
   end;
 if ffilter.CB10.Checked then //Сумма продаж по карте в интервале
   begin
    QrListCard.ParamByName('SUMM_SALES_FROM').AsCurrency := FFilter.CurrencyEdit4.Value;
    if not (FFilter.CurrencyEdit2.Value < FFilter.CurrencyEdit4.Value) then
      QrListCard.ParamByName('SUMM_SALES_TO').AsCurrency := FFilter.CurrencyEdit2.Value;
   end;
 if ffilter.CB11.Checked then //Количество продаж по карте в интервале
   begin
    QrListCard.ParamByName('COUNT_PURCHASE_FROM').AsInteger := Trunc(FFilter.RxSpinEdit16.Value);
    if not (FFilter.RxSpinEdit15.Value < FFilter.RxSpinEdit16.Value) then
      QrListCard.ParamByName('COUNT_PURCHASE_TO').AsInteger := Trunc(FFilter.RxSpinEdit15.Value);
   end;

 if ffilter.CB8.Checked then //магазин, в котором осущ. операции по карте
    QrListCard.ParamByName('SALE_SHOP_ID').AsInteger := _save_ShopName_ID;
 if ffilter.CB12.Checked then //кем выдана карта
    QrListCard.ParamByName('IN_US_ID').AsInteger := _save_KLNName_ID;
 if ffilter.CB13.Checked then //период дня рождения клиента
   begin
    QrListCard.ParamByName('KLN_BIRTHDAY_FROM').AsDateTime := Ffilter.DateEdit7.Date;
    QrListCard.ParamByName('KLN_BIRTHDAY_TO').AsDateTime := Ffilter.DateEdit8.Date;
   end;
 if ffilter.CB16.Checked then //период дня рождения клиента
   begin
    try

    QrListCard.ParamByName('KLN_BIRTHDAY_OF_YEAR_FROM').AsDateTime := strtodate(Ffilter.KLN_BIRTHDAY_OF_YEAR_FROM.Text);
    QrListCard.ParamByName('KLN_BIRTHDAY_OF_YEAR_TO').AsDateTime := strtodate(Ffilter.KLN_BIRTHDAY_OF_YEAR_TO.Text);
    except
    msgbox('Ошибка преобразовании даты', 'Ошибка преобразовании даты введенной как день рождения клиента!', MB_OK);
    end;

   end;


 if ffilter.CB14.Checked then //ФИО клиента
   begin
    QrListCard.ParamByName('IN_KLN_FIO').asstring := Ffilter.KLN_FIO.Text;
   end;
 if ffilter.CB15.Checked then //Номер скидки
   begin
    QrListCard.ParamByName('IN_CARDSKID_ID').asinteger := _save_CARDSKID_ID;
   end;


 if ffilter.CB20.Checked then //SMS
   begin
    QrListCard.ParamByName('IN_SMS').asinteger := Ffilter.comboSMS.ItemIndex;
   end;
 if ffilter.CB21.Checked then //SMS
   begin
    QrListCard.ParamByName('IN_PERS').asinteger := Ffilter.comboPERS.ItemIndex;
   end;
 if ffilter.CB22.Checked then //SMS
   begin
    QrListCard.ParamByName('IN_SEX').asinteger := Ffilter.comboSEX.ItemIndex;
   end;
 if ffilter.CB23.Checked then //SMS
   begin
    QrListCard.ParamByName('IN_REKL').asinteger := Ffilter.comboREKL.ItemIndex;
   end;






end;

procedure TJou_CARD.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='CARD_FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CARD_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CARD_COLOR').Asinteger;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='CARD_FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CARD_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CARD_COLOR').Asinteger;
        end;
     end;
end;

procedure TJou_CARD.FormCreate(Sender: TObject);
begin
  //форма фильтрации создается один раз, если вызвали журнал и уже не удаляется
  Application.createForm(TFFilter, FFilter);
  Get_DEFAULT;
  Timer1.Interval:=TIME_GET_DISCONT;
  curOrderColumn := 'CARD_FULL_NUM';
end;

procedure TJou_CARD.Timer1Timer(Sender: TObject);
var
   NEW_DISKONT_ID:integer;
   DISKONT_PERCENT:double;
   NEW_KLN_ID:integer;
   NEW_KLN_FULL:ansistring;
begin
   Try
     Timer1.Enabled:=False;
     Statusbar1.panels[0].text:='';
     {Определяем ID дисконтной карты}
     NEW_DISKONT_ID:=GET_DISKONT(NEW_DISKONT_NUM,DISKONT_PERCENT,NEW_KLN_ID,NEW_KLN_FULL, TRUE);
     if NEW_DISKONT_ID>0 then begin
        {Карта найдена}
        listCardTransaction.Active:=False;
        QrListCard.Close;
        QrListCard.Open;
        // этот диалог (редактирование карты) теперь покажется в процедуре GET_DISCONT
        if QrListCard.locate('CARD_ID',NEW_DISKONT_ID,[]) then
          if BtnOpen.Enabled then //показать только диалог редактирования карты. И никакой другой
           RxDBGrid1DblClick(Sender);
     end;
     NEW_DISKONT_NUM:='';
     Statusbar1.panels[0].text:=NEW_DISKONT_NUM;
   Except
   End;
end;

procedure TJou_CARD.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key='%') or (key=';')) then begin
     NEW_DISKONT_NUM:='';
     Timer1.enabled:=False;
     timer2.enabled := false;
     Timer1.enabled:=True;
     Statusbar1.panels[0].text:=NEW_DISKONT_NUM;
  end
  else
  if not Timer1.enabled then
  begin
    if not Timer2.enabled then
     begin
     SEARCH_DISKONT_NUM:='';
     Timer2.enabled:=False;
     Timer2.enabled:=True;
     Statusbar1.panels[0].text:=SEARCH_DISKONT_NUM;
     end;
  end;

  if Timer1.enabled then begin
     if key=#13 then begin
        Timer1.Enabled:=False;
        Timer1.OnTimer(Sender);
     end;
     if key in ['0'..'9'] then begin
         NEW_DISKONT_NUM:=NEW_DISKONT_NUM+KEY;
     end;
     Statusbar1.panels[0].text:=NEW_DISKONT_NUM;
     key:=#0;
  end;

  if Timer2.enabled then begin
     if (key =#13) then
     begin
         Timer2.Enabled:=False;
         SEARCH_DISKONT_NUM := '';
         Statusbar1.panels[0].text:='';
     end;
     if (key =#8) then
     begin
         setstring(SEARCH_DISKONT_NUM, pchar(SEARCH_DISKONT_NUM), length(SEARCH_DISKONT_NUM) -1);
//         strlcopy(pchar(SEARCH_DISKONT_NUM), pchar(SEARCH_DISKONT_NUM), length(SEARCH_DISKONT_NUM) -1);
         Statusbar1.panels[0].text:=SEARCH_DISKONT_NUM;
     end;


     if key in ['0'..'9'] then begin
         SEARCH_DISKONT_NUM:=SEARCH_DISKONT_NUM+KEY;
     end;
     Statusbar1.panels[0].text:=SEARCH_DISKONT_NUM;
     key:=#0;

      QrListCard.Locate('CARD_FULL_NUM', SEARCH_DISKONT_NUM , [loPartialKey]);

  end;




end;

procedure TJou_CARD.BtnDelClick(Sender: TObject);
var
  ID:integer;
begin
  if Messbox('Удалить дисконтную карту № '+QrListCard.fieldByname('CARD_FULL_NUM').asstring+
  ' клиента '+QrListCard.fieldByname('KLN_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       ID:=QrListCard.fieldByname('CARD_ID').asinteger;
       IF IBDELETE_DOC('CARD',ID) then begin
          Datamodule1.IBTransaction2.Commit;
       end else Datamodule1.IBTransaction2.RollBack;
       Datamodule1.IBTransaction2.Active:=False;
       QrListCard.close;
       ListCardTransaction.Active:=False;
       QrListCard.Open;
       QrListCard.locate('CARD_ID',ID,[]);
  end;
end;

procedure TJou_CARD.BtnOpenClick(Sender: TObject);
begin
  Application.createForm(TEDIT_CARD,EDIT_CARD);
  EDIT_CARD.tag:=QrListCard.fieldByname('CARD_ID').asinteger;
  EDIT_CARD.ShowModal;
  if EDIT_CARD.ModalResult = mrOk then //надо перечитать запрос, потому что данные на форме были изменены
   begin
    QrListCard.disablecontrols;
    QrListCard.close;
    ListCardTransaction.Active:=False;
    QrListCard.Open;
    QrListCard.locate('CARD_ID',EDIT_CARD.tag,[]);
    QrListCard.Enablecontrols;
   end; 
  EDIT_CARD.Destroy;
end;

procedure TJou_CARD.RxDBGrid1DblClick(Sender: TObject);
begin
  //если карта зарег.но не выдана - то диалог выдачи  катры
  //если выдана - то диалог редактирования
  if BtnOpen.enabled then BtnOpen.click
  else
   if BtnDeliveryCARD.enabled then BtnDeliveryCARD.click;
end;

procedure TJou_CARD.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) then
   RxDBGrid1DblClick(Sender);
 if key=#27 then close;
end;

procedure TJou_CARD.QrListCardAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
  EN:=not QrListCard.eof;
  BtnOpen.enabled:=EN;
  BtnDel.enabled:=EN;
  BtnDeliveryCARD.enabled:=EN;
  Wait_Form.Hide;
end;

procedure TJou_CARD.BtnNewClick(Sender: TObject);
begin
{  Application.createForm(TFRegister, FRegister);
  FRegister.tag:=-1;
  FRegister.ShowModal;
  if FRegister.tag>0 then begin
    QrListCard.disablecontrols;
    QrListCard.close;
    ListCardTransaction.Active:=False;
    QrListCard.Open;
    QrListCard.locate('CARD_ID',FRegister.tag,[]);
    QrListCard.Enablecontrols;
  end;
  FRegister.Destroy;
}
 ShowMessage('Для регистрации новой карты просто проведите ей через ' +
   'считыватель, находясь в журнале регистрации карт');
end;

procedure TJou_CARD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=45) and (btnNew.enabled) then BtnNew.click;
  if (key=46) and (btnDel.enabled) then BtnDel.click;
end;

procedure TJou_CARD.CBFilterEnabledClick(Sender: TObject);
begin
 inherited;
// PFilterInfo.Visible := CBFilterEnabled.Checked;
 if (PFilterInfo.Visible) then
     LFilterInfo.Caption := 'Текущий фильтр: ' + FFilter.getFilterInfo();
 ReopenFilterQuery();
end;

procedure TJou_CARD.BtnFilterClick(Sender: TObject);
begin
  inherited;
  FFilter.ShowModal;
  if (FFilter.ModalResult = mrOk) and (CBFilterEnabled.Checked)
   then CBFilterEnabledClick(Self);
end;

procedure TJou_CARD.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  inherited;
  if (Field <> nil) and QrListCard.Active and
     (CompareText(Field.FieldName, curOrderColumn) = 0) then
     if curOrderDirection = CNDesc then //если обратная сортировка, то стрелка вверх
      SortMarker := smDown
     else SortMarker := smUp;
end;

procedure TJou_CARD.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  inherited;
  if (Field <> nil) then begin
    SetListOrder(Field.FieldName, True);
//    ComboBox2.ItemIndex := -1;
  end;
end;

//устанавливает у запроса нужную сортировку
//(приписывает к нему последнюю строку и переоткрывает его)
procedure TJou_CARD.SetListOrder(Const OrderColumn:String; needToChangeOrder:boolean);
Var
 needToOpen : boolean;
 OrderLine :String;
begin
 if needToChangeOrder then
  begin
   if (curOrderColumn <> OrderColumn) then
    curOrderDirection := CNAsc
   else
    if ((curOrderDirection = CNDesc) or (curOrderDirection = '')) then
     curOrderDirection := CNAsc
    else curOrderDirection := CNDesc;
  end;
 curOrderColumn := OrderColumn;
 OrderLine := 'ORDER BY ' + curOrderColumn + ' ' + curOrderDirection;
 //заменяем последнюю строку в запросе
 needToOpen := QrListcard.Active;
 QrListcard.Close;
 QrListcard.SQL[QrListcard.SQL.Count-1] := OrderLine;
 if needToOpen then QrListcard.Open;
end;

procedure TJou_CARD.QrListCardAfterScroll(DataSet: TDataSet);
begin
  inherited;
  try
   if Jou_CARD.Active then
    begin  //если запись (карта) не выдана - надо разрешить кнопку выдачи и запретить редактирование
     BtnOpen.enabled := not QrListCard.FieldByName('CARD_DATE').isNull;
     BtnDeliveryCARD.enabled := not BtnOpen.enabled;
    end;
  except
   ShowMEssage('Наложенное событие ввода-вывода');
  end;
end;

procedure TJou_CARD.BtnExportToExcelClick(Sender: TObject);
begin
  inherited;
  if ((not QrListCard.Active) or (QrListCard.RecordCount = 0)) then
   begin
    ShowMessage('Нет данных для выгрузки в MS Excel');
    Exit;
   end;
  ExportCARDSListToExcel();
end;

//выгружает все текущие данные по дисконтным картам в Excel в виде списка карт
procedure TJou_CARD.ExportCARDSListToExcel();
Var
  _tmpRequest : TParamRequest;
  ReportCardsToExcel : TReportCardsListToExcel;
begin
 try
  //формирование объекта запроса параметров для передачи в отчет
  _tmpRequest := TParamRequest.Create();
  Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  Application.Processmessages;
  _tmpRequest.AddParam('ReportName', 'Cписок дисконтных карт'); //название отчета
  _tmpRequest.AddParam('ProgressBarObject', Wait_Form.Gauge1); //объект прогресса
  _tmpRequest.AddParam('QMain', QrListCard); //основной запрос
  _tmpRequest.AddParam('ApplyFilterText', LFilterInfo.Caption); //словестное описание фильтра запроса
  try
     ReportCardsToExcel := TReportCardsListToExcel.Create(TParamRequest(_tmpRequest), nil);
     ReportCardsToExcel.createReport();
    // ShowMessage('Список карт успешно экспортирован в MS Excel');     
  finally
     if (ReportCardsToExcel <>nil) then ReportCardsToExcel.Free;
  end;
 finally
  Wait_Form.Hide;
  _tmpRequest.Free;
 end;
end;
        
procedure TJou_CARD.BtnDeliveryCARDClick(Sender: TObject);
begin
  inherited;
  Application.createForm(TFCARDDelivery, FCARDDelivery);
  FCARDDelivery.tag:=QrListCard.fieldByname('CARD_ID').asinteger;
  FCARDDelivery.ShowModal;
  if FCARDDelivery.tag>0 then begin
    QrListCard.disablecontrols;
    QrListCard.close;
    ListCardTransaction.Active:=False;
    QrListCard.Open;
    QrListCard.locate('CARD_ID',FCARDDelivery.tag,[]);
    QrListCard.Enablecontrols;
  end;
  FCARDDelivery.Destroy;
end;

procedure TJou_CARD.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  If (QrListCardCARD_DATE.IsNull) then //карта не выдана - надо ее подсветить серым цветом
   begin
    RxDBGrid1.Canvas.Brush.Color := clMoneyGreen;
    RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end

end;

procedure TJou_CARD.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  inherited;
  Enabled := (Field <> nil);
end;

procedure TJou_CARD.QrListCardBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  Wait_Form.StatusBar1.panels[0].text:='Получение списка дисконтных карт...';
  Wait_Form.Gauge1.Progress:=40;
  Wait_Form.Show;
  Application.ProcessMessages;
end;

procedure TJou_CARD.chkShowblockedClick(Sender: TObject);
begin
  inherited;
 ReopenFilterQuery();
end;

end.
