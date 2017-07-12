
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxrcClass;

interface

procedure frAddClassesRes;


implementation

uses frxRes;


procedure frAddClassesRes;
begin
  with frxResources do
  begin
    Add('TfrxPreviewForm',
      'Caption=Предварительный просмотр' + #13#10 +
      'PrintB.Caption=Печать' + #13#10 +
      'PrintB.Hint=Печать' + #13#10 +
      'OpenB.Caption=Открыть' + #13#10 +
      'OpenB.Hint=Открыть' + #13#10 +
      'SaveB.Caption=Сохранить' + #13#10 +
      'SaveB.Hint=Сохранить' + #13#10 +
      'ExportB.Caption=Экспорт' + #13#10 +
      'ExportB.Hint=Экспорт' + #13#10 +
      'FindB.Caption=Найти' + #13#10 +
      'FindB.Hint=Найти' + #13#10 +
      'ZoomWholePageB.Caption=Целиком' + #13#10 +
      'ZoomWholePageB.Hint=Страница целиком' + #13#10 +
      'ZoomPageWidthB.Caption=По ширине' + #13#10 +
      'ZoomPageWidthB.Hint=По ширине' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Две страницы' + #13#10 +
      'Zoom50B.Hint=Две страницы' + #13#10 +
      'ZoomCB.Hint=Масштаб' + #13#10 +
      'PageSettingsB.Caption=Поля' + #13#10 +
      'PageSettingsB.Hint=Свойства страницы' + #13#10 +
      'OutlineB.Caption=Дерево' + #13#10 +
      'OutlineB.Hint=Дерево отчета' + #13#10 +
      'HandToolB.Caption=Рука' + #13#10 +
      'HandToolB.Hint=Рука' + #13#10 +
      'ZoomToolB.Caption=Лупа' + #13#10 +
      'ZoomToolB.Hint=Лупа' + #13#10 +
      'NewPageB.Caption=Добавить' + #13#10 +
      'NewPageB.Hint=Добавить страницу' + #13#10 +
      'DelPageB.Caption=Удалить' + #13#10 +
      'DelPageB.Hint=Удалить страницу' + #13#10 +
      'DesignerB.Caption=Правка' + #13#10 +
      'DesignerB.Hint=Редактировать страницу' + #13#10 +
      'FirstB.Caption=Первая' + #13#10 +
      'FirstB.Hint=На первую страницу' + #13#10 +
      'PriorB.Caption=Предыдущая' + #13#10 +
      'PriorB.Hint=На предыдущую страницу' + #13#10 +
      'NextB.Caption=Следующая' + #13#10 +
      'NextB.Hint=На следующую страницу' + #13#10 +
      'LastB.Caption=Последняя' + #13#10 +
      'LastB.Hint=На последнюю страницу' + #13#10 +
      'CancelB.Caption=Закрыть' + #13#10 +
      'PageE.Hint=Номер страницы' + #13#10 +
      '');
    Add('zmPageWidth', 'По ширине');
    Add('zmWholePage', 'Страница целиком');

    Add('TfrxPrintDialog',
      'Caption=Печать' + #13#10 +
      'Label12.Caption=Принтер   ' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'Label1.Caption=Страницы   ' + #13#10 +
      'CopiesL.Caption=Количество' + #13#10 +
      'CollateL.Caption=Разобрать по копиям' + #13#10 +
      'Label2.Caption=Копии   ' + #13#10 +
      'PrintL.Caption=Печатать' + #13#10 +
      'TypeL.Caption=Тип:' + #13#10 +
      'WhereL.Caption=Где:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'PropButton.Caption=Свойства...' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'FileCB.Caption=Печать в файл' + #13#10 +
      'ReverseCB.Caption=В обратном порядке' + #13#10 +
      '');
    Add('ppAll', 'Все страницы');
    Add('ppOdd', 'Нечетные страницы');
    Add('ppEven', 'Четные страницы');

    Add('TfrxSearchDialog',
      'Caption=Искать текст' + #13#10 +
      'TextL.Caption=Текст:' + #13#10 +
      'SearchL.Caption=Настройки поиска   ' + #13#10 +
      'ReplaceL.Caption=Заменить' + #13#10 +
      'TopCB.Caption=Искать с начала' + #13#10 +
      'CaseCB.Caption=Различать регистр' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Настройки страницы' + #13#10 +
      'WidthL.Caption=Ширина' + #13#10 +
      'HeightL.Caption=Высота' + #13#10 +
      'SizeL.Caption=Размер   ' + #13#10 +
      'OrientationL.Caption=Ориентация   ' + #13#10 +
      'LeftL.Caption=Левое' + #13#10 +
      'TopL.Caption=Верхнее' + #13#10 +
      'RightL.Caption=Правое' + #13#10 +
      'BottomL.Caption=Нижнее' + #13#10 +
      'MarginsL.Caption=Поля   ' + #13#10 +
      'PortraitRB.Caption=Портретная' + #13#10 +
      'LandscapeRB.Caption=Альбомная' + #13#10 +
      'cmL1.Caption=см' + #13#10 +
      'cmL2.Caption=см' + #13#10 +
      'cmL3.Caption=см' + #13#10 +
      'cmL4.Caption=см' + #13#10 +
      'cmL5.Caption=см' + #13#10 +
      'cmL6.Caption=см' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'OtherL.Caption=Прочее   ' + #13#10 +
      'ApplyToCurRB.Caption=Применить к текущей странице' + #13#10 +
      'ApplyToAllRB.Caption=Применить ко всем страницам' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Печать' + #13#10 +
      'PrinterL.Caption=Принтер   ' + #13#10 +
      'PagesL.Caption=Страницы   ' + #13#10 +
      'CopiesL.Caption=Копии   ' + #13#10 +
      'CopiesNL.Caption=Количество' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Опции   ' + #13#10 +
      'EscL.Caption=ESC-команды   ' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Отмена' + #13#10 +
      'SaveToFileCB.Caption=Печать в файл' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'PageBreaksCB.Caption=Разрывы страниц' + #13#10 +
      'OemCB.Caption=OEM-кодировка' + #13#10 +
      'PseudoCB.Caption=Псевдографика' + #13#10 +
      'SaveDialog1.Filter=Файл печати (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('mbConfirm', 'Подтверждение');
    Add('mbError', 'Ошибка');
    Add('mbInfo', 'Информация');
    Add('xrCantFindClass', 'Не удалось найти класс');
    Add('prVirtual', 'Виртуальный');
    Add('prDefault', 'По умолчанию');
    Add('prCustom', 'Пользовательский');
    Add('enUnconnHeader', 'Не подключенный header/footer');
    Add('enUnconnGroup', 'Нет дата-бэнда для группы');
    Add('enUnconnGFooter', 'Нет заголовка группы');
    Add('enBandPos', 'Неправильно расположен бэнд:');
    Add('dbNotConn', 'Компонент %s не подключен к данным');
    Add('dbFldNotFound', 'Поле не найдено:');
    Add('clDSNotIncl', '(компонент не включен в Report.DataSets)');
    Add('clUnknownVar', 'Неизвестная переменная или поле БД:');
    Add('clScrError', 'Ошибка в скрипте %s: %s');
    Add('clDSNotExist', 'Набор данных "%s" не найден');
    Add('clErrors', 'Были обнаружены следующие ошибки:');
    Add('clExprError', 'Ошибка в выражении');
    Add('clFP3files', 'Готовый отчет');
    Add('clSaving', 'Сохраняется файл...');
    Add('clCancel', 'Отмена');
    Add('clClose', 'Закрыть');
    Add('clPrinting', 'Печатается страница');
    Add('clLoading', 'Загружается файл...');
    Add('clPageOf', 'Страница %d из %d');
    Add('clFirstPass', 'Первый проход: страница ');
    Add('clNoPrinters', 'В вашей системе не установлено принтеров');
    Add('clDecompressError', 'Ошибка распаковки данных');
    Add('crFillMx', 'Заполняется cross-tab...');
    Add('crBuildMx', 'Строится cross-tab...');

    Add('prRunningFirst', 'Первый проход: страница %d');
    Add('prRunning', 'Готовится страница %d');
    Add('prPrinting', 'Печатается страница %d');
    Add('prExporting', 'Экспорт страницы %d');
    Add('uCm', 'см');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.