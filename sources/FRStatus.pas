unit FRStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFR_STATUS = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FR_STATUS: TFR_STATUS;

implementation

uses FR_Shtrih;

{$R *.DFM}

procedure TFR_STATUS.FormShow(Sender: TObject);
begin
  try
    Memo1.Clear;
    FRShtrih.connect(true);


    begin
      with Memo1 do
      begin
        Lines.Add('ПО ФР:');
        Lines.Add(#9'Версия: '+FRShtrih.FR.ECRSoftVersion);
        Lines.Add(#9'Сборка: '+IntToStr(FRShtrih.FR.ECRBuild));
        Lines.Add(#9'Дата: '+DateToStr(FRShtrih.FR.ECRSoftDate));
        Lines.Add('ПО ФП:');
        Lines.Add(#9'Версия: '+FRShtrih.FR.FMSoftVersion);
        Lines.Add(#9'Сборка: '+IntToStr(FRShtrih.FR.FMBuild));
        Lines.Add(#9'Дата: '+DateToStr(FRShtrih.FR.FMSoftDate));
        Lines.Add('Флаги ФР:<'+IntToStr(FRShtrih.FR.ECRFlags)+'>');
        Lines.Add(#9'Рулон операционного журнала '+FRShtrih.ECRFlagsToStr(0));
        Lines.Add(#9'Рулон чековой ленты '+FRShtrih.ECRFlagsToStr(1));
        Lines.Add(#9'Верхний датчик подкладного документа '+FRShtrih.ECRFlagsToStr(2));
        Lines.Add(#9'Нижний датчик подкаладного документа '+FRShtrih.ECRFlagsToStr(3));
        Lines.Add(#9'Положение десятичной точки '+FRShtrih.ECRFlagsToStr(4));
        Lines.Add(#9'ЭКЛЗ '+FRShtrih.ECRFlagsToStr(5));
        Lines.Add(#9'Оптический датчик операционного журнала '+FRShtrih.ECRFlagsToStr(6));
        Lines.Add(#9'Оптический датчик чек. ленты '+FRShtrih.ECRFlagsToStr(7));
        Lines.Add(#9'Рычаг термоголовки операционного журнала '+FRShtrih.ECRFlagsToStr(8));
        Lines.Add(#9'Рычаг термоголовки чек. ленты '+FRShtrih.ECRFlagsToStr(9));
        Lines.Add(#9'Крышка корпуса ФР '+FRShtrih.ECRFlagsToStr(10));
        Lines.Add(#9'Денежный ящик '+FRShtrih.ECRFlagsToStr(11));
        Lines.Add(#9'Отказ правого датчика принтера '+FRShtrih.ECRFlagsToStr(12));
        Lines.Add(#9'Отказ левого датчика принтера '+FRShtrih.ECRFlagsToStr(13));
        Lines.Add(#9'ЭКЛЗ почти заполнена '+FRShtrih.ECRFlagsToStr(14));
        Lines.Add(#9'Положение точки в количестве '+FRShtrih.ECRFlagsToStr(15));
        Lines.Add('Флаги ФП:<'+IntToStr(FRShtrih.FR.FMFlags)+'>');
        Lines.Add(#9'ФП1 '+FRShtrih.FMFlagsToStr(0));
        Lines.Add(#9'ФП2 '+FRShtrih.FMFlagsToStr(1));
        Lines.Add(#9'Лицензия '+FRShtrih.FMFlagsToStr(2));
        Lines.Add(#9'Переполнение ФП '+FRShtrih.FMFlagsToStr(3));
        Lines.Add(#9'Батарея ФП '+FRShtrih.FMFlagsToStr(4));
        Lines.Add(#9'Последняя запись в ФП'+FRShtrih.FMFlagsToStr(5));
        Lines.Add(#9'Смена в ФП '+FRShtrih.FMFlagsToStr(6));
        Lines.Add(#9'24 часа в ФП '+FRShtrih.FMFlagsToStr(7));
        Lines.Add('Номер ККМ в зале: '+IntToStr(FRShtrih.FR.LogicalNumber));
        Lines.Add('Номер документа: '+IntToStr(FRShtrih.FR.OpendocumentNumber));
        Lines.Add('Порт ФР: '+IntToStr(FRShtrih.FR.PortNumber));
        Lines.Add('Режим ФР: '+IntToStr(FRShtrih.FR.ECRMode)+ ' '+FRShtrih.FR.ECRModeDescription);
        Lines.Add('Статус режима: '+IntToStr(FRShtrih.FR.ECRModeStatus));
        Lines.Add('Подрежим ФР: '+IntToStr(FRShtrih.FR.ECRAdvancedMode)+ ' '+FRShtrih.FR.ECRAdvancedModeDescription);
        Lines.Add('Кол-во фискализаций: '+IntToStr(FRShtrih.FR.RegistrationNumber));
        Lines.Add('Кол-во оставшихся фискализаций: '+IntToStr(FRShtrih.FR.FreeRegistration));
        Lines.Add('Последняя закрытая смена: '+IntToStr(FRShtrih.FR.SessionNumber));
        Lines.Add('Свободных записей в ФП: '+IntToStr(FRShtrih.FR.FreeRecordInFM));
        Lines.Add('Дата: '+DateToStr(FRShtrih.FR.Date));
        Lines.Add('Время: '+TimeToStr(FRShtrih.FR.Time));
        Lines.Add('Заводской номер: '+FRShtrih.FR.SerialNumber);
        Lines.Add('ИНН: '+FRShtrih.FR.INN);
      end;
    end;
  finally
      FRShtrih.Disconnect;
  end;
end;

end.
