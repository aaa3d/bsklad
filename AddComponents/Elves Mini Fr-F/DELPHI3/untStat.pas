unit untStat;
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, untObj;

type
  TfrmStatus = class(TForm)
    Report: TMemo;
    Caption1: TLabel;
    edtResultCode: TEdit;
    Caption2: TLabel;
    edtBadParam: TEdit;
    btnGetStatus: TButton;
    btnClose: TButton;
    Shape1: TShape;
    Bevel1: TBevel;
    btnGetLastError: TButton;
    btnGetSumm: TButton;
    btnGetDeviceMetrics: TButton;
    btnGetSupportedMode: TButton;
    btnGetLastSummary: TButton;
    btnGetCurrentMode: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnGetStatusClick(Sender: TObject);
    procedure btnGetLastErrorClick(Sender: TObject);
    procedure btnGetSummClick(Sender: TObject);
    procedure btnGetDeviceMetricsClick(Sender: TObject);
    procedure btnGetSupportedModeClick(Sender: TObject);
    procedure btnGetLastSummaryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetCurrentModeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnableButtons;
    procedure DisableButtons;
    procedure LoadProperties;
  end;

var
  frmStatus: TfrmStatus;

implementation
{$R *.DFM}

procedure TfrmStatus.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmStatus.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmStatus.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
end;

procedure TfrmStatus.FormShow(Sender: TObject);
begin
  Report.Lines.Clear;
  btnClose.SetFocus;
  LoadProperties;
end;

procedure TfrmStatus.btnGetStatusClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetStatus=0 then
      begin
      Report.Lines.Add('Кассир: '+IntToStr(AX.Operator));
      Report.Lines.Add('Номер ККМ в зале: '+IntToStr(AX.LogicalNumber));
      if AX.Fiscal then
        Report.Lines.Add('Касса фискализирована') else
        Report.Lines.Add('Касса не фискализирована');
      Report.Lines.Add('Текущее время: '+IntToStr(AX.Hour)+':'+IntToStr(AX.Minute)+':'+IntToStr(AX.Second));
      Report.Lines.Add('Текущая дата: '+IntToStr(AX.Day)+'/'+IntToStr(AX.Month)+'/'+IntToStr(AX.Year));
      Report.Lines.Add('Заводской номер: '+AX.SerialNumber);
      Report.Lines.Add('Версия ПЗУ: '+AX.ROMVersion);
      case AX.Mode of
        0: Report.Lines.Add('Текущий режим: Выбор режима');
        1: Report.Lines.Add('Текущий режим: Режим регистрации');
        2: Report.Lines.Add('Текущий режим: Режим отчётов без гашения');
        3: Report.Lines.Add('Текущий режим: Режим отчётов с гашением');
        4: Report.Lines.Add('Текущий режим: Режим программирования');
        5: Report.Lines.Add('Текущий режим: Режим налогового инспектора');
        7: Report.Lines.Add('Текущий режим: Дополнительный');
        else Report.Lines.Add('Текущий режим: Код '+IntToStr(AX.Mode));
      end;
      if string(AX.ROMVersion)[1]='2' then
        begin
        case (10*(AX.Mode)+AX.AdvancedMode) of
          0: Report.Lines.Add('Расширенный режим: Выбор');
          10: Report.Lines.Add('Расширенный режим: Ожидание команды');
          11: Report.Lines.Add('Расширенный режим: Ввод пароля');
          12: Report.Lines.Add('Расширенный режим: Ожидание ввода номера секции');
          20: Report.Lines.Add('Расширенный режим: Ожидание команды');
          21: Report.Lines.Add('Расширенный режим: Ввод пароля');
          22: Report.Lines.Add('Расширенный режим: Идет печать X-отчета');
          30: Report.Lines.Add('Расширенный режим: Ожидание команды');
          31: Report.Lines.Add('Расширенный режим: Ввод пароля');
          32: Report.Lines.Add('Расширенный режим: Идет печать Z-отчета');
          33: Report.Lines.Add('Расширенный режим: Ожидание подтверждения гашения');
          34: Report.Lines.Add('Расширенный режим: Ввод даты с клавиатуры');
          35: Report.Lines.Add('Расширенный режим: Ожидание подтверждения общего гашения');
          36: Report.Lines.Add('Расширенный режим: Идет общее гашение');
          37: Report.Lines.Add('Расширенный режим: Ввод положения точки с клавиатуры');
          40: Report.Lines.Add('Расширенный режим: Ожидание команды');
          41: Report.Lines.Add('Расширенный режим: Ввод пароля');
          50: Report.Lines.Add('Расширенный режим: Ожидание команды');
          51: Report.Lines.Add('Расширенный режим: Ввод пароля');
          52: Report.Lines.Add('Расширенный режим: Печать отчета');
          53: Report.Lines.Add('Расширенный режим: Ожидание ввода данных');
          54: Report.Lines.Add('Расширенный режим: Подтверждение входа в режим налогового инспектора');
          71: Report.Lines.Add('Расширенный режим: Идет обнуление таблиц');
          72: Report.Lines.Add('Расширенный режим: Выполняется прогон');
          73: Report.Lines.Add('Расширенный режим: Режим ввода времени с клавиатуры');
          74: Report.Lines.Add('Расширенный режим: Режим тестов');
          75: Report.Lines.Add('Расширенный режим: Ввод даты после замены ядра');
          76: Report.Lines.Add('Расширенный режим: Ввод времени после замены ядра');
          77: Report.Lines.Add('Расширенный режим: Начальная инициализация ККМ');
          78: Report.Lines.Add('Расширенный режим: Ожидание подтверждения обнуления таблиц');
          else Report.Lines.Add('Расширенный режим: Код '+IntToStr(AX.AdvancedMode));
          end;
        Report.Lines.Add('Соединение по порту: '+IntToStr(AX.SlotNumber));
        if AX.DrawerOpened then
          Report.Lines.Add('Ящик открыт')
        else
          Report.Lines.Add('Ящик закрыт');
        if AX.SessionOpened then
          Report.Lines.Add('Смена открыта')
        else
          Report.Lines.Add('Смена закрыта');
        end;
      case AX.Model of
        0: Report.Lines.Add('Модель: ЭЛВЕС-МИКРО-Ф');
        1: Report.Lines.Add('Модель: ШТРИХ-МИКРО-Ф');
        2: Report.Lines.Add('Модель: ЭЛВЕС-МИНИ-ФР-Ф');
        3: Report.Lines.Add('Модель: Штрих-POS-Ф');
        4: Report.Lines.Add('Модель: ТВЕС-МИНИ-Ф');
        5: Report.Lines.Add('Модель: ШТРИХ-АВТО-Ф');
        else Report.Lines.Add('Модель: '+IntToStr(AX.Model));
      end;
      if AX.PasswordEntered then
        Report.Lines.Add('Пароль введён') else
        Report.Lines.Add('Пароль не введён');
      Report.Lines.Add('Номер чека: '+IntToStr(AX.CheckNumber));
      Report.Lines.Add('Номер последней закрытой смены: '+IntToStr(AX.Session));
      Report.Lines.Add('Десятичная точка отделяет символов после запятой: '+IntToStr(AX.PointPosition));
      case AX.CheckState of
        0: Report.Lines.Add('Чек закрыт');
        1: Report.Lines.Add('Открыт чек продажи');
        2: Report.Lines.Add('Открыт чек возврата');
        3: Report.Lines.Add('Открыт чек аннулирования');
      else Report.Lines.Add('Состояние чека: '+IntToStr(AX.CheckState));
      end;
      Report.Lines.Add('Текущая сумма чека: '+FloatToStr(AX.Summ));
      if string(AX.ROMVersion)[1]='1' then
        begin
        Report.Lines.Add('Код последней ошибки на ККМ: '+IntToStr(AX.ECRError));
        Report.Lines.Add('Описание последнего кода ошибки: '+AX.ECRErrorDescription);
        end;
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetLastErrorClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetLastError=0 then
      begin
      Report.Lines.Add('Код последней ошибки на ККМ: '+IntToStr(AX.ECRError));
      Report.Lines.Add('Описание кода: '+AX.ECRErrorDescription);
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetSummClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetSumm=0 then
      Report.Lines.Add('Сумма наличных в ККМ: '+FloatToStr(AX.Summ));
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetDeviceMetricsClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetDeviceMetrics=0 then
      begin
      case AX.UCodePage of
        0: Report.Lines.Add('Русская языковая таблица');
        1: Report.Lines.Add('Армянская языковая таблица');
        2: Report.Lines.Add('Молдавская языковая таблица');
        3: Report.Lines.Add('Украинская языковая таблица');
        4: Report.Lines.Add('Литовская языковая таблица');
        5: Report.Lines.Add('Туркменская языковая таблица');
        6: Report.Lines.Add('Монгольская языковая таблица');
        7: Report.Lines.Add('Белорусская языковая таблица');
        8: Report.Lines.Add('Латвийская языковая таблица');
        9: Report.Lines.Add('Грузинская языковая таблица');
        10: Report.Lines.Add('Казахская языковая таблица');
        11: Report.Lines.Add('Эстонская языковая таблица');
        12: Report.Lines.Add('Азербайджанская языковая таблица');
        13: Report.Lines.Add('Киргизская языковая таблица');
        14: Report.Lines.Add('Таджикская языковая таблица');
        15: Report.Lines.Add('Узбекская языковая таблица');
        16: Report.Lines.Add('Польская языковая таблица');
        17: Report.Lines.Add('Румынская языковая таблица');
        18: Report.Lines.Add('Болгарская языковая таблица');
        19: Report.Lines.Add('Английская языковая таблица');
        else Report.Lines.Add('Языковая таблица: '+IntToStr(AX.UCodePage));
      end;
      case AX.UType of
        1: Report.Lines.Add('Тип устройства: ККМ');
        2: Report.Lines.Add('Тип устройства: Весы');
        3: Report.Lines.Add('Тип устройства: Блок MemoPlus');
        4: Report.Lines.Add('Тип устройства: Принтер этикеток');
        5: Report.Lines.Add('Тип устройства: Терминал сбора данных');
        6: Report.Lines.Add('Тип устройства: Дисплей покупателя');
        7: Report.Lines.Add('Тип устройства: Сканер штрих-кода, PIN-клавиатура, ресторанная клавиатура');
        else Report.Lines.Add('Тип устройства: '+IntToStr(AX.UType));
      end;
      Report.Lines.Add('Версия прошивки: '+IntToStr(AX.UMajorVersion)+'.'+
        IntToStr(AX.UMinorVersion)+' , сборка: '+IntToStr(AX.UBuild));
      Report.Lines.Add('Версия протокола: '+IntToStr(AX.UProtocolVersion));
      if AX.UType=1 then
        begin
          case AX.UModel of
            0: Report.Lines.Add('Модель: ЭЛВЕС-МИКРО-Ф');
            1: Report.Lines.Add('Модель: ШТРИХ-МИКРО-Ф');
            2: Report.Lines.Add('Модель: ЭЛВЕС-МИНИ-ФР-Ф');
            3: Report.Lines.Add('Модель: Штрих-POS-Ф');
            4: Report.Lines.Add('Модель: ТВЕС-МИНИ-Ф');
            5: Report.Lines.Add('Модель: ШТРИХ-АВТО-Ф');
            6: Report.Lines.Add('Модель: ШТРИХ-2000Ф');
            7: Report.Lines.Add('Модель: ЭЛВЕС-01-01Ф');
            8: Report.Lines.Add('Модель: ЭЛВЕС-01-02Ф');
            9: Report.Lines.Add('Модель: ЭЛВЕС-01-03Ф');
            else Report.Lines.Add('Модель: '+IntToStr(AX.UModel));
          end;
        end
      else
        Report.Lines.Add('Модель: для данного типа устройств в тесте не определена.');
      Report.Lines.Add('Описание устройства: '+AX.UDescription);
      Report.Lines.Add('Поддерживаемые режимы: '+IntToSTr(AX.UMode));
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetSupportedModeClick(Sender: TObject);
var
  fResult: integer;
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    AX.UMode:= 32768;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('Режим "OffLine" поддерживается устройством');
      -3860:
        Report.Lines.Add('Режим "OffLine" не поддерживается устройством');
      else
        Report.Lines.Add('Не удалось получить данные о поддержке режима "OffLine"');
      end;
    AX.UMode:= 16384;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('Режим "OnLine" поддерживается устройством');
      -3860:
        Report.Lines.Add('Режим "OnLine" не поддерживается устройством');
      else
        Report.Lines.Add('Не удалось получить данные о поддержке режима "OnLine"');
      end;
    AX.UMode:= 8192;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('Режим "Пассивный OnLine" поддерживается устройством');
      -3860:
        Report.Lines.Add('Режим "Пассивный OnLine" не поддерживается устройством');
      else
        Report.Lines.Add('Не удалось получить данные о поддержке режима "Пассивный OnLine"');
      end;
    AX.UMode:= 4096;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('Режим "Фискальный регистратор" поддерживается устройством');
      -3860:
        Report.Lines.Add('Режим "Фискальный регистратор" не поддерживается устройством');
      else
        Report.Lines.Add('Не удалось получить данные о поддержке режима "Фискальный регистратор"');
      end;
    AX.UMode:= 2048;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('Режим "Фискальная плата" поддерживается устройством');
      -3860:
        Report.Lines.Add('Режим "Фискальная плата" не поддерживается устройством');
      else
        Report.Lines.Add('Не удалось получить данные о поддержке режима "Фискальная плата"');
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetLastSummaryClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if (AX.GetLastSummary=0) then
      Report.Lines.Add('Сумма последнего сменного итога: '+FloatToStr(AX.Summ));
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStatus.btnGetCurrentModeClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetCurrentMode=0 then
      begin
        case AX.Mode of
          0: Report.Lines.Add('Текущий режим: Выбор режима');
          1: Report.Lines.Add('Текущий режим: Режим регистрации');
          2: Report.Lines.Add('Текущий режим: Режим отчётов без гашения');
          3: Report.Lines.Add('Текущий режим: Режим отчётов с гашением');
          4: Report.Lines.Add('Текущий режим: Режим программирования');
          5: Report.Lines.Add('Текущий режим: Режим налогового инспектора');
          7: Report.Lines.Add('Текущий режим: Дополнительный');
          else Report.Lines.Add('Текущий режим: Код '+IntToStr(AX.Mode));
        end;
        case (10*(AX.Mode)+AX.AdvancedMode) of
          0: Report.Lines.Add('Расширенный режим: Выбор');
          10: Report.Lines.Add('Расширенный режим: Ожидание команды');
          11: Report.Lines.Add('Расширенный режим: Ввод пароля');
          12: Report.Lines.Add('Расширенный режим: Ожидание ввода номера секции');
          20: Report.Lines.Add('Расширенный режим: Ожидание команды');
          21: Report.Lines.Add('Расширенный режим: Ввод пароля');
          22: Report.Lines.Add('Расширенный режим: Идет печать X-отчета');
          30: Report.Lines.Add('Расширенный режим: Ожидание команды');
          31: Report.Lines.Add('Расширенный режим: Ввод пароля');
          32: Report.Lines.Add('Расширенный режим: Идет печать Z-отчета');
          33: Report.Lines.Add('Расширенный режим: Ожидание подтверждения гашения');
          34: Report.Lines.Add('Расширенный режим: Ввод даты с клавиатуры');
          35: Report.Lines.Add('Расширенный режим: Ожидание подтверждения общего гашения');
          36: Report.Lines.Add('Расширенный режим: Идет общее гашение');
          37: Report.Lines.Add('Расширенный режим: Ввод положения точки с клавиатуры');
          40: Report.Lines.Add('Расширенный режим: Ожидание команды');
          41: Report.Lines.Add('Расширенный режим: Ввод пароля');
          50: Report.Lines.Add('Расширенный режим: Ожидание команды');
          51: Report.Lines.Add('Расширенный режим: Ввод пароля');
          52: Report.Lines.Add('Расширенный режим: Печать отчета');
          53: Report.Lines.Add('Расширенный режим: Ожидание ввода данных');
          54: Report.Lines.Add('Расширенный режим: Подтверждение входа в режим налогового инспектора');
          71: Report.Lines.Add('Расширенный режим: Идет обнуление таблиц');
          72: Report.Lines.Add('Расширенный режим: Выполняется прогон');
          73: Report.Lines.Add('Расширенный режим: Режим ввода времени с клавиатуры');
          74: Report.Lines.Add('Расширенный режим: Режим тестов');
          75: Report.Lines.Add('Расширенный режим: Ввод даты после замены ядра');
          76: Report.Lines.Add('Расширенный режим: Ввод времени после замены ядра');
          77: Report.Lines.Add('Расширенный режим: Начальная инициализация ККМ');
          78: Report.Lines.Add('Расширенный режим: Ожидание подтверждения обнуления таблиц');
          else Report.Lines.Add('Расширенный режим: Код '+IntToStr(AX.AdvancedMode));
        end;
        if AX.OutOfPaper then
          Report.Lines.Add('Нет бумаги')
        else
          Report.Lines.Add('Бумага есть');
        if AX.PrinterConnectionFailed then
          Report.Lines.Add('Связи с принтером чеков нет')
        else
          Report.Lines.Add('Связь с принтером чеков есть');
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
end;

end.
