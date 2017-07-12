unit SetDostup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, Db, RxMemDS,
  B_utils,B_DButils,Data1, IBCustomDataSet, IBQuery, IBDatabase, Menus,
  RXSplit, StdCtrls;

type
  TSET_DOSTUP = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    MemDost: TRxMemoryData;
    MemSubdost: TRxMemoryData;
    MemDostSHORT: TStringField;
    MemDostFULL: TStringField;
    DsDost: TDataSource;
    DsSubDost: TDataSource;
    MemSubdostUSDOSTUP_ID: TIntegerField;
    MemSubdostUSGROUP_ID: TIntegerField;
    MemSubdostIS: TIntegerField;
    MemSubdostIS_FULL: TStringField;
    MemSubdostUSGROUP_NAME: TStringField;
    GroupTransaction: TIBTransaction;
    QueryUsgroup: TIBQuery;
    QueryUsgroupUSGROUP_ID: TIntegerField;
    QueryUsgroupUSGROUP_NAME: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnOn: TMenuItem;
    MnOff: TMenuItem;
    RxSplitter1: TRxSplitter;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure DsDostDataChange(Sender: TObject; Field: TField);
    procedure DsSubDostDataChange(Sender: TObject; Field: TField);
    procedure MemSubdostCalcFields(DataSet: TDataSet);
    procedure MemDostAfterScroll(DataSet: TDataSet);
    procedure MnOnClick(Sender: TObject);
    procedure MnOffClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;                                                       

var
  SET_DOSTUP: TSET_DOSTUP;
  CANSCROLL:boolean;
  CANINSERT:boolean;
  CANSubINSERT:boolean;

implementation

uses Mainform;

{$R *.DFM}

procedure TSET_DOSTUP.FormShow(Sender: TObject);
begin
  // Определяем размеры
  Top:=Main_Form.Top+22;
  Left:=Screen.DesktopLeft;
  Width:=Screen.Width;
  Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
  GroupTransaction.Active:=False;
  QueryUsgroup.Close;
  QueryUsgroup.Open;
  MemDost.Disablecontrols;
  MemDost.EmptyTable;
  CANSCROLL:=false;
  CANINSERT:=True;
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$PRINT.NOPROW';
   MemDost.fieldbyname('FULL').asstring:='Печать непроведенных документов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_IS_FRM';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Установка признака "фирмы"';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_TABEL';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Изменение табельного номера';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_PASSWORD';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Смена данных пользователей системы (кроме пароля)';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_DATA';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Принудительная смена пароля';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CHANGE_DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Смена категории доступа, пароля ККМ и закрытие доступа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.EDIT_KLN_SETTINGS';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Редактирование свойств клиента';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.EDIT_KLN_KTG';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Изменение категории клиента, персональной скидки, направления';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_CHANGE_INN';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Изменение ИНН';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.KLN_CHANGE_MANAGER_TABEL';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Изменение табельного номера менеджера';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.CAN_DELETE';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Удаление контакта';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICKLN.DETAL_KLN';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Подробно о контакте';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN.SHOW_BALANCE';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Просмотр баланса клиентов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN.CHANGE_CREDIT';
   MemDost.fieldbyname('FULL').asstring:='Справочник клиентов. Изменение кредита клиента/менеджера';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_CREATE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Создание товара и группы товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_COPY';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Создание копии товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_COPYFORMAT';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Копирование формата товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_EDIT';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Изменение и перемещение товара и группы товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.CAN_DELETE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Удаление товара и группы товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.DETAL_TW';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Подробно о товаре';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.ANALIZ_TW';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Анализ товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.MARKETING_TW';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Маркетинговые данные товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.SALER_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Смена продавца товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWMONSHOP_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Редактирование цен в магазинах';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWPRICE_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Редактирование цен прайс-листа';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.EDIT_SKLAD_PARAMS';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Редактирование складских параметров товара';




{  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT';
   MemDost.fieldbyname('FULL').asstring:='Печать прайс-листа';
}

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.TWPRICE_PRINT_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Изменения свойства "Печать в прайс листе"';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICTW.INTERNET_CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Справочник товаров. Изменения свойств интернет';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.VIEW$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.VIEW_ANY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Просмотр чужих наборов товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.NEW$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Создание нового набора';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DEL$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Удаление';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.EDIT_DEL_ANY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Редактирование/Удаление чужих наборов товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DISABLE_TEMPORARY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Снятие признака ВРЕМЕННЫЙ';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_TW_SET.DISABLE_PRIVATE$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических наборов товаров. Снятие признака ЛИЧНЫЙ';

//*************************
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.VIEW$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.VIEW_ANY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Просмотр чужих групп клиентов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.NEW$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Создание новой группы';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DEL$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Удаление';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.EDIT_DEL_ANY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Редактирование/Удаление чужих групп клиентов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DISABLE_TEMPORARY$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Снятие признака ВРЕМЕННЫЙ';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC_KLN_SET.DISABLE_PRIVATE$';
   MemDost.fieldbyname('FULL').asstring:='Справочник динамических групп клиентов. Снятие признака ЛИЧНЫЙ';
//*************************

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_KLN';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Справочник контактов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_NDS';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Ставка НДС';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DICPROPKTG';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Категорий скидок';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_SHOP';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Магазины и офис';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_SKL';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Справочник складов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_TW';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Товары. Список товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_TWKTG';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Товары. Категории товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DIC.DIC_USLUGI.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Справочники. Услуги. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Документы. Доступ в меню';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.AKT_WOZW_POST.NEW';
   MemDost.fieldbyname('FULL').asstring:='Документы. Новый акт возврата поставщику';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$DOC.AKT_WOZW.NEW';
   MemDost.fieldbyname('FULL').asstring:='Документы. Новый акт возврата от покупателя';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Доступ в меню';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.NEW';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Новое сообщение';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.COMMENT';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Добавление комментариев';




  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID1';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех списков товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID2';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех заявок на перемещение';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID3';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех заявок на закупку';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID4';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех кассовых отчетов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID5';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех Internet-сообщений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID6';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех приказов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID7';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр распоряжений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID7.UNACTIVE';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр неактивных распоряжений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.VID8';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех заявок на доставку';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.READ_ALL';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Просмотр Всех сообщений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID2';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание заявок на перемещение';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY_PER.ANY_FRM';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на перемещение от любой фирмы';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID3';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание заявок на закупку';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID4';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание кассовых отчетов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID5';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание Internet-сообщений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID6';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание приказов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID7';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание распоряжений';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.CREATE.VID8';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Создание заявок на доставку';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW1';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Утверждение менеджером по рознице';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW2';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Утверждение менеджером по опту';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.PODP';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Подпись';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.UTW';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Утверждение';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.OPL';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Оплата';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.ZAY.WYP';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Заявка на закупку. Выполнение';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$EMAIL.ZAY_PREV_SOST';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Возврат утвержденной заявки на закупку в предыдущее состояние';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$MAIL.MET1';
   MemDost.fieldbyname('FULL').asstring:='Электронная почта. Установка и сброс отметки № 1';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Доступ в меню';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.1S';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Связь с 1С-Бухгалтерией';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_MONEY';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Курсы валют. Смена курса ценообразования';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_RN';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Курсы валют. Смена курса расходных накладных';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KURS_PN';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Курсы валют. Смена курса приходных накладных';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CLOSEDIR';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Закрытие периода. Закрытие периода директором';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CLOSEWORK';
   MemDost.fieldbyname('FULL').asstring:='Сервис.Закрытие периода. Закрытие периода дифференцированное';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.SUMM';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Скидки по дисконтным картам. Скидки по накопительной сумме';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.NUM';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Скидки по дисконтным картам. Номерные скидки';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.ADD_SUMM';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Дисконтные карты. Добавление суммы на дисконт';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.CARD.SKID_NUM';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Дисконтные карты. Назначение номерных скидок';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.KLN.MERGE';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Объединение контактов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SERVIS.MAKE_COMPLEX_RN';
   MemDost.fieldbyname('FULL').asstring:='Сервис. Создание сводной расходной накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Доступ в меню';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.TIME';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Изменение даты-времени документа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.TW';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Изменение артикула у товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.JOU';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Администрирование журналов';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.KONTAKT';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Администрирование контакта';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.LINKNOTABLE';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Таблицы, исключенные из синхронизации';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ADM.LINKNOFIELD';
   MemDost.fieldbyname('FULL').asstring:='Администрирование. Поля, исключенные из синхронизации';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Журналы. Доступ в меню';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DOSTUP.SHOW_DELETED';
   MemDost.fieldbyname('FULL').asstring:='Журналы. Просмотр удаленных документов';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.GARANT_TALON.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал гарантийных талонов. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.GARANT_TALON.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал гарантийных талонов. Создание гарантийного талона';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.DISKONT.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал дисконтных карт. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал кассовых отчетов. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.EDIT_MYSHOP';
   MemDost.fieldbyname('FULL').asstring:='Журнал кассовых отчетов. Редактирование в своем магазине';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.KKM.EDIT_REMOTESHOP';
   MemDost.fieldbyname('FULL').asstring:='Журнал кассовых отчетов. Редактирование в "чужом" магазине';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на переоценку. Создание и изменение документа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.UTW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на переоценку. Утверждение';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZREMON.SUBDOC';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на переоценку. Создание акта на переоценку';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на перевод в брак. Создание и изменение документа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.UTW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на перевод в брак. Утверждение';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.DEL';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на перевод в брак. Удаление';

  queryWork.SQL.Text:='SELECT * FROM CFG where CFG_NAME=''TRINDEF_STAT'' order by cfg_set2';
  queryWork.Open;

  while not queryWork.Eof do
  begin
    MemDost.Append;
    MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.'+queryWork.fieldByName('cfg_set1').asString;
    MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на перевод в брак. Утверждение по уровню доступа: '+queryWork.fieldByName('cfg_Value').asString;

    queryWork.next;
  end;
  querywork.Close;


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZTRINDEF.SUBDOC';
   MemDost.fieldbyname('FULL').asstring:='Журнал Заявок на перевод в брак. Создание акта переоценки и пересортицы';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PO.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал предоплат. Создание и изменение документа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PO.VIEW_REMOTESHOP';
   MemDost.fieldbyname('FULL').asstring:='Журнал предоплат. Просмотр предоплат чужого магазина';



  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.PRINT';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Печать документа';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Создание накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.KOMM.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Создание накладной в журнале комиссии';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PN.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Анализ накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PN';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Проводка накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PN.KOMM';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Проводка накладной в журнале комиссии';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW_PN';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Проводка Акта возврата поставщику';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PN';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Снятие с проводки накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PN.KOMM';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Снятие с проводки накладной в журнале комиссии';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU$.PN.ADMIN_DOC_PN';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Указание первичных документов и примечания';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_WOZW_PN';
   MemDost.fieldbyname('FULL').asstring:='Журнал приходных накладных. Снятие с проводки Акта возврата поставщику';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал продаж. Создание продажи';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал продаж. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SALE.DELETE';
   MemDost.fieldbyname('FULL').asstring:='Журнал продаж. Удаление продажи';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Создание накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.REZ.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Создание резервной накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.CHANGE_TABEL';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Смена табеля';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU$.RN.ADMIN_DOC_RN';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Указание первичных документов и примечания';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.NEW_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Создание Акта возврата';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RNKKM.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Создание и правка накладной со своего склада';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Анализ накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_REZ';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка резервной накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_1';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка накладной при нехватке товара';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_50000';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка накладной по платежке до 30 000';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_RN_100000';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка накладной по платежке до 100 000';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка Акта возврата';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_WOZW_BNAL';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка Акта возврата БНАЛ, БНАЛ2';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_RN';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Снятие с проводки накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_RN_REZ';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Снятие с проводки резервной накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$EDIT.SAVEDISCONT';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Редактирование товаров в накладной без потери дисконта';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Снятие с проводки Акта возврата';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Проводка и снятие в магазине, не создавшем накладную';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.DELETE';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Удаление расходной накладной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.RN.PRINT_OLD_RND';
   MemDost.fieldbyname('FULL').asstring:='Журнал расходных накладных. Печать РН с доставкой старого образца (до 20.03.2005)';


  MemDost.Append;
  MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал выписок. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.CREATE';
   MemDost.fieldbyname('FULL').asstring:='Журнал выписок. Создание новой выписки';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.PROV';
   MemDost.fieldbyname('FULL').asstring:='Журнал выписок. Проводка выписки';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.VIPISKA.UNPROW';
   MemDost.fieldbyname('FULL').asstring:='Журнал выписок. Снятие с проводки выписки';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='JOU.VIPISKA.DELETE';
   MemDost.fieldbyname('FULL').asstring:='Журнал выписок. Удаление выписки';






  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PSORT.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов пересортицы. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PSORT.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов пересортицы. Создание акта';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PSORT';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов пересортицы. Проводка';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PSORT';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов пересортицы. Снятие с проводки';
  MemDost.Append;

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Создание акта';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.SPIS.ANALIZ';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Анализ акта';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_SPIS';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Проводка акта списания';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_SPIS';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Снятие с проводки акта списания';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_SPIS_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Проводка сторно акта списания';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_SPIS_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов списания. Снятие с проводки сторно акта списания';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PER.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.PER.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Создание накладной';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PER_LIMITED';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Проводка в своем магазине';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PER_LIMITED';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Снятие с проводки в своем магазине';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_PER';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Проводка';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UNPROVODKA_PER';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения. Снятие с проводки';

 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ZONE_PER.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения между зонами. Создание накладной';
 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_ZONE_PER';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения между зонами. Проведение накладной';
 MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='UN_PROVODKA_ZONE_PER';
   MemDost.fieldbyname('FULL').asstring:='Журнал Накладных перемещения между зонами. Снятие с проводки накладной';








  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ST.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал счетов. Просмотр';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.ST.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал счетов. Создание нового';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.STF.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал счетов-фактур. Просмотр';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.REMON.SHOW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов переоценки. Просмотр';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$JOU.REMON.NEW';
   MemDost.fieldbyname('FULL').asstring:='Журнал Актов переоценки. Создание нового';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PROVODKA_REMON';
   MemDost.fieldbyname('FULL').asstring:='Проводка актов переоценки';


  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='REMIND.NEW';
   MemDost.fieldbyname('FULL').asstring:='Напоминания. Создание и использование напоминаний';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='REMIND.SHOW_ALL';
   MemDost.fieldbyname('FULL').asstring:='Напоминания. Просмотр напоминаний всех пользователей';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.DOSTUP';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Доступ в меню';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ANALITIKA';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Аналитика...';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OST';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Расширенный отчет об остатках';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OSTNUL';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Отчет об отрицательных остатках';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о продажах. Доступность';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS_ZAKUP';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о продажах. Создание расходной с закупочными ценами';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.SHOP';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о продажах. Выбор не "своего" магазина';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.DOGOVOR_AGENTA';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о продажах. Договор Агента';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TORG.PERS.TABEL_NACENKA';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о продажах. Наценка по табельным номерам';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ITOG.REPORT_NAC_TABLE_GROUP';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Итоговые отчеты. Построение отчета по наценке по табелям';



  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MONEY';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Отчет о ценах на товары';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.PERS';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Персональный отчет о наценке';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ITOG';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Итоговые отчеты';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.VEDOM_NALOG';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Ведомости движения товаров по себестоимости';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.WIDE';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Расширенный отчет о наценке';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.PRIBYL.WIDE.ALL_TWTREE';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Расширенный отчет о наценке.Построение по всем группам товаров';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MINOST';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Отчет о минимальных остатках и рекомендации к закупке';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.INN';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Работа с клиентами. Наличие ИНН';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.CARD';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Работа с клиентами. Испоьзование пластиковых карт';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.CARD_ONE_SHOP';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Работа с клиентами. '+CAP_REPORT_CARD_ONE_SHOP;
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.POST';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Работа с клиентами. Работа с поставщиками';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OSNSKID';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Обоснование скидок пользователями';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.STAT';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Текущая статистика';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.POL';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Получение и отгрузка. Неполученные товары';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.OTG';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Получение и отгрузка. Неотгруженные товары';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MARKET.KONK';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Маркетинговые исследования. Ценовая конкуренция';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.MARKET.OLD';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Маркетинговые исследования. Отчет об устаревших данных';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.TW.CHANGE';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Перечень товаров, измененных за период';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.KORR';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Отчет-справка по коррекции НДС';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$REPORT.ONE_STFAKT';
   MemDost.fieldbyname('FULL').asstring:='Отчеты. Единый счет-фактура на список расходных накладных';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.ALL_SKL';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара во всех складах';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=25';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара в складе Олимп7С';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322019';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара в складе Олимп7СБ';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322004';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара в складе Олимп7М';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$OTGRUZ.SKL_ID=1322017';
   MemDost.fieldbyname('FULL').asstring:='Отгрузка товара в складе СтройДвор';




  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL';
   MemDost.fieldbyname('FULL').asstring:='Получение товара';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.ALL_SKL';
   MemDost.fieldbyname('FULL').asstring:='Получение товара во всех складах';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=25';
   MemDost.fieldbyname('FULL').asstring:='Получение товара в складе Олимп7С';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322019';
   MemDost.fieldbyname('FULL').asstring:='Получение товара в складе Олимп7СБ';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322004';
   MemDost.fieldbyname('FULL').asstring:='Получение товара в складе Олимп7М';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$POL.SKL_ID=1322017';
   MemDost.fieldbyname('FULL').asstring:='Получение товара в складе СтройДвор';





  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$ZP.ON';
   MemDost.fieldbyname('FULL').asstring:='Расчет зарплаты';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$KKM.ON';
   MemDost.fieldbyname('FULL').asstring:='Работа с Контрольно-кассовой машиной';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$SHOW.ZAKUP';
   MemDost.fieldbyname('FULL').asstring:='Просмотр закупочных цен';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='$FIND.PN';
   MemDost.fieldbyname('FULL').asstring:='Просмотр информации о поставщике товара';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='EDIT_MONEY_DOPUSK';
   MemDost.fieldbyname('FULL').asstring:='Настройка доступа к прайсовым ценам';

  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='MAKE_VN_REAL_WOZW';
   MemDost.fieldbyname('FULL').asstring:='Формирование внутренних возвратов и реализаций';


{
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT';
   MemDost.fieldbyname('FULL').asstring:='Печать прайс-листа';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY1';
   MemDost.fieldbyname('FULL').asstring:='Цены прайс листа. Просмотр оптовых цен';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY2';
   MemDost.fieldbyname('FULL').asstring:='Цены прайс листа. Просмотр крупно-оптовых цен';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY3';
   MemDost.fieldbyname('FULL').asstring:='Цены прайс листа. Просмотр спец цен';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY4';
   MemDost.fieldbyname('FULL').asstring:='Цены прайс листа. Просмотр цены акции';
  MemDost.Append;
   MemDost.fieldbyname('SHORT').asstring:='PRICE_LIST_PRINT_MONEY5';
   MemDost.fieldbyname('FULL').asstring:='Цены прайс листа. Просмотр закупочных цен';
}



  CANINSERT:=False;
  CANSCROLL:=True;

  MemDost.Post;
  MemDost.First;
  MemDost.Enablecontrols;
end;

procedure TSET_DOSTUP.DsDostDataChange(Sender: TObject; Field: TField);
begin
     if (MemDOST.State in [dsInsert]) and ( not CanInsert) then MemDOST.Cancel;
end;

procedure TSET_DOSTUP.DsSubDostDataChange(Sender: TObject;
  Field: TField);
begin
     if (MemSUBDOST.State in [dsInsert]) and ( not CanSubInsert) then MemSUBDOST.Cancel;
end;

procedure TSET_DOSTUP.MemSubdostCalcFields(DataSet: TDataSet);
begin
     if MemSubdost.fieldbyname('IS').asinteger>0
     then MemSubdost.fieldbyname('IS_FULL').asstring:='Доступно'
     else MemSubdost.fieldbyname('IS_FULL').asstring:='Нет';
end;

procedure TSET_DOSTUP.MemDostAfterScroll(DataSet: TDataSet);
begin
  if Canscroll then begin
    MemSubdost.Disablecontrols;
    MemSubdost.emptyTable;
    CanSubInsert:=true;
    QueryUsgroup.First;
    while not QueryUsgroup.eof do begin
      MemSubdost.Append;
      MemSubdost.fieldbyname('USGROUP_ID').asinteger:=QueryUsgroup.fieldbyname('USGROUP_ID').asinteger;
      MemSubdost.fieldbyname('USGROUP_NAME').asstring:=QueryUsgroup.fieldbyname('USGROUP_NAME').asstring;
      Worktransaction.active:=False;
      ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
      QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
      QueryWork.parambyname('USGROUP_ID').asinteger:=QueryUsgroup.fieldbyname('USGROUP_ID').asinteger;
      QueryWork.Open;
      if QueryWork.eof then begin
        MemSubdost.fieldbyname('USDOSTUP_ID').asinteger:=-1;
        MemSubdost.fieldbyname('IS').asinteger:=0;
      end else begin
        MemSubdost.fieldbyname('USDOSTUP_ID').asinteger:=QueryWork.fieldbyname('USDOSTUP_ID').asinteger;
        MemSubdost.fieldbyname('IS').asinteger:=1;
      end;
      MemSubdost.Post;
      QueryUsgroup.next;
    end;
    CanSubInsert:=False;
    MemSubdost.First;
    MemSubdost.Enablecontrols;
  end;

end;

procedure TSET_DOSTUP.MnOnClick(Sender: TObject);
var
   r:double;
begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.parambyname('USGROUP_ID').asinteger:=MemSubDOST.fieldbyname('USGROUP_ID').asinteger;
     QueryWork.Open;
     if QueryWork.eof then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;
         IBSAVE_ADD('USGROUP_ID',MemSubdost.fieldbyname('USGROUP_ID').asinteger);
         IBSAVE_ADD('USDOSTUP_NAME',MemDOST.fieldbyname('SHORT').asstring);
         if IBSAVE_DOC('USDOSTUP',-1)<0 then r:=Sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         MemSubdost.edit;
         MemSubdost.Fieldbyname('IS').asinteger:=1;
         MemSubdost.Post;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.StartTransaction;
     end;
end;

procedure TSET_DOSTUP.MnOffClick(Sender: TObject);
var
   r:double;
begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select USDOSTUP_ID from USDOSTUP where USDOSTUP_NAME=:USDOSTUP_NAME and USGROUP_ID=:USGROUP_ID');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.parambyname('USGROUP_ID').asinteger:=MemSubDOST.fieldbyname('USGROUP_ID').asinteger;
     QueryWork.Open;
     if not QueryWork.eof then begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         if NOT IBDELETE_DOC('USDOSTUP',QueryWork.fieldbyname('USDOSTUP_ID').asinteger) then r:=Sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         MemSubdost.edit;
         MemSubdost.Fieldbyname('IS').asinteger:=0;
         MemSubdost.Post;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.StartTransaction;
     end;
end;

procedure TSET_DOSTUP.Button1Click(Sender: TObject);
var f: textfile;
    s1, s2: string;
begin
 assignfile(f, 'dostup.csv');
 rewrite(f);

 memdost.First;
 while not memdost.Eof do
 begin

     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from usgroup, usdostup where usgroup.usgroup_id=usdostup.usgroup_id and usdostup.usdostup_name=:USDOSTUP_NAME');
     QueryWork.parambyname('USDOSTUP_NAME').asstring:=MemDOST.fieldbyname('SHORT').asstring;
     QueryWork.Open;
     while not QueryWork.Eof do
     begin
      s1:= QueryWork.FieldbyName('USGROUP_NAME').asstring;
	  s2:= MemDost.fieldbyname('FULL').asstring;
	  writeln(f, s1+';'+s2);
      QueryWOrk.Next;
     end;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;


  	 memdost.Next;

 end;
 closefile(f);
end;

end.
