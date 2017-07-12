
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{            Copyright (c) 2004            }
{          by Alexander Fediachov,         }
{             Fast Reports, Inc.           }
{                                          }
{******************************************}

unit frxrcExports;

interface

procedure frAddExportsRes;

implementation

uses frxRes;

procedure frAddExportsRes;
begin
  with frxResources do
  begin
    frxResources.Add('TfrxXLSExportDialog',
      'Caption=Экспорт в Excel' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опции ' + #13#10 +
      'StylesCB.Caption=Стили' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'MergeCB.Caption=Объединять ячейки' + #13#10 +
      'PageBreaksCB.Caption=Разрывы страниц' + #13#10 +
      'FastExpCB.Caption=Быстрый экспорт' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=Как текст' + #13#10 +
      'BackgrCB.Caption=Фон' + #13#10 +
      'OpenExcelCB.Caption=Открыть Excel после экспорта' + #13#10 +
      'SaveDialog1.Filter=Файл Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Экспорт в Excel' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опции ' + #13#10 +
      'StylesCB.Caption=Стили' + #13#10 +
      'PageBreaksCB.Caption=Разрывы страниц' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Фон' + #13#10 +
      'OpenExcelCB.Caption=Открыть Excel после экспорта' + #13#10 +
      'SaveDialog1.Filter=Файл Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Экспорт в HTML (табличный)' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опции ' + #13#10 +
      'OpenAfterCB.Caption=Открыть после экспорта' + #13#10 +
      'StylesCB.Caption=Стили' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'PicsSameCB.Caption=Все в одной папке' + #13#10 +
      'FixWidthCB.Caption=Фикс.ширина' + #13#10 +
      'NavigatorCB.Caption=Навигатор' + #13#10 +
      'MultipageCB.Caption=Многостраничный' + #13#10 +
      'MozillaCB.Caption=Браузер Mozilla' + #13#10 +
      'BackgrCB.Caption=Фон' + #13#10 +
      'SaveDialog1.Filter=Файл HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Экспорт в текст' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Отмена' + #13#10 +
      'BtnPreview.Hint=Просмотр результата' + #13#10 +
      'GroupCellProp.Caption= Опции  ' + #13#10 +
      'CB_PageBreaks.Caption=Разрывы страниц' + #13#10 +
      'CB_OEM.Caption=OEM-кодировка' + #13#10 +
      'CB_EmptyLines.Caption=Пустые строки' + #13#10 +
      'CB_LeadSpaces.Caption=Пробелы слева' + #13#10 +
      'GroupPageRange.Caption= Страницы  ' + #13#10 +
      'Pages.Caption=Номера' + #13#10 +
      'Descr.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Масштаб ' + #13#10 +
      'ScX.Caption=по оси X' + #13#10 +
      'ScY.Caption=по оси Y' + #13#10 +
      'GroupFramesSettings.Caption= Рамки ' + #13#10 +
      'RB_NoneFrames.Caption=Нет' + #13#10 +
      'RB_Simple.Caption=Текстовые' + #13#10 +
      'RB_Graph.Caption=Графические' + #13#10 +
      'CB_PrintAfter.Caption=Печать после экспорта' + #13#10 +
      'CB_Save.Caption=Сохранить настройки' + #13#10 +
      'GroupBox1.Caption= Просмотр ' + #13#10 +
      'Label1.Caption=Ширина:' + #13#10 +
      'Label3.Caption=Высота:' + #13#10 +
      'LBPage.Caption=Страница' + #13#10 +
      'ToolButton1.Hint=Увеличить' + #13#10 +
      'ToolButton2.Hint=Уменьшить' + #13#10 +
      'SaveDialog1.Filter=Текстовый файл (*.txt)|*.txt' + #13#10 +
      'SaveDialog1.DefaultExt=.txt' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Печать' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Отмена' + #13#10 +
      'GroupBox1.Caption=Принтер' + #13#10 +
      'Label4.Caption=Имя' + #13#10 +
      'PropButton.Caption=Настройки...' + #13#10 +
      'GroupBox3.Caption=Копии' + #13#10 +
      'Label2.Caption=Количество' + #13#10 +
      'GroupBox2.Caption= Опции ' + #13#10 +
      'Label1.Caption=Тип принтера' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Настройки принтера (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Настройки принтера (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Экспорт в RTF (табличный)' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опции ' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'PageBreaksCB.Caption=Разрывы страниц' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Открыть после экспорта' + #13#10 +
      'SaveDialog1.Filter=Файл RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Экспорт в рисунок' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Опции ' + #13#10 +
      'Label2.Caption=Качество JPEG' + #13#10 +
      'Label1.Caption=Разрешение (dpi)' + #13#10 +
      'SeparateCB.Caption=Раздельные файлы' + #13#10 +
      'CropPage.Caption=Обрезать страницу' + #13#10 +
      'Mono.Caption=Монохромный' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Экспорт в PDF' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GroupPageRange.Caption= Страницы ' + #13#10 +
      'AllRB.Caption=Все' + #13#10 +
      'CurPageRB.Caption=Текущая' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введите номера и/или диапазоны страниц, разделенные запятыми. Например, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опции ' + #13#10 +
      'CompressedCB.Caption=Компрессия' + #13#10 +
      'EmbeddedCB.Caption=Встроить шрифты' + #13#10 +
      'PrintOptCB.Caption=Высокое разрешение' + #13#10 +
      'OutlineCB.Caption=Оглавление' + #13#10 +
      'BackgrCB.Caption=Фон' + #13#10 +
      'OpenCB.Caption=Открыть после экспорта' + #13#10 +
      'SaveDialog1.Filter=Файл Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Документ Word (табличный)');
    Add('BMPexport', 'Рисунок BMP');
    Add('JPEGexport', 'Рисунок JPEG');
    Add('TIFFexport', 'Рисунок TIFF');
    Add('TextExport', 'Текстовый файл');
    Add('XlsOLEexport', 'Документ Excel (OLE)');
    Add('HTMLexport', 'Документ HTML (табличный)');
    Add('XlsXMLexport', 'Документ Excel (XML)');
    Add('PDFexport', 'Документ PDF');

    Add('ProgressWait', 'Подождите, пожалуйста');
    Add('ProgressRows', 'Настройка строк');
    Add('ProgressColumns', 'Настройка колонок');
    Add('ProgressStyles', 'Настройка стилей');
    Add('ProgressObjects', 'Экспорт объектов');

    Add('TIFFexportFilter', 'Рисунок TIFF (*.tif)|*.tif');
    Add('BMPexportFilter', 'Рисунок BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Рисунок JPEG (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'Начало');
    Add('HTMLNavPrev', 'Пред.');
    Add('HTMLNavNext', 'След.');
    Add('HTMLNavLast', 'Конец');
    Add('HTMLNavRefresh', 'Обновить');
    Add('HTMLNavPrint', 'Печать');
    Add('HTMLNavTotal', 'Всего страниц');
  end;
end;

initialization
  frAddExportsRes;

end.
