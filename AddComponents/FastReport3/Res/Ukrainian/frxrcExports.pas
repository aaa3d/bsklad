

{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Translated by Sergiy Sekela      }
{         Ternopil, Ukraine                }
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
      'Caption=Експорт в Excel' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опції ' + #13#10 +
      'StylesCB.Caption=Стилі' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'MergeCB.Caption=Поєднувати чарунки' + #13#10 +
      'PageBreaksCB.Caption=Розриви сторінок' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Відкрити Excel після експорту' + #13#10 +
      'SaveDialog1.Filter=Файл Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Експорт в Excel' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номера:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опції ' + #13#10 +
      'StylesCB.Caption=Стилі' + #13#10 +
      'PageBreaksCB.Caption=Розриви сторінок' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenExcelCB.Caption=Відкрити Excel після експорту' + #13#10 +
      'SaveDialog1.Filter=Файл Excel (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Експорт в HTML (табличний)' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опції ' + #13#10 +
      'OpenAfterCB.Caption=Відкрити після експорту' + #13#10 +
      'StylesCB.Caption=Стилі' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'PicsSameCB.Caption=Все в одній папці' + #13#10 +
      'FixWidthCB.Caption=Фікс.ширина' + #13#10 +
      'NavigatorCB.Caption=Навігатор' + #13#10 +
      'MultipageCB.Caption=Багатосторінковий' + #13#10 +
      'MozillaCB.Caption=Браузер Mozilla' + #13#10 +
      'SaveDialog1.Filter=Файл HTML (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Експорт в текст' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Відмова' + #13#10 +
      'BtnPreview.Hint=Перегляд результату' + #13#10 +
      'GroupCellProp.Caption= Опції  ' + #13#10 +
      'CB_PageBreaks.Caption=Розриви сторінок' + #13#10 +
      'CB_OEM.Caption=OEM-кодування' + #13#10 +
      'CB_EmptyLines.Caption=Порожні рядки' + #13#10 +
      'CB_LeadSpaces.Caption=Пробіли ліворуч' + #13#10 +
      'GroupPageRange.Caption= Сторінки  ' + #13#10 +
      'Pages.Caption=Номера' + #13#10 +
      'Descr.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Масштаб ' + #13#10 +
      'ScX.Caption=по осі X' + #13#10 +
      'ScY.Caption=по осі Y' + #13#10 +
      'GroupFramesSettings.Caption= Рамки ' + #13#10 +
      'RB_NoneFrames.Caption=Немає' + #13#10 +
      'RB_Simple.Caption=Текстові' + #13#10 +
      'RB_Graph.Caption=Графічні' + #13#10 +
      'CB_PrintAfter.Caption=Друк після експорту' + #13#10 +
      'CB_Save.Caption=Зберегти налаштування' + #13#10 +
      'GroupBox1.Caption= Перегляд ' + #13#10 +
      'Label1.Caption=Ширина:' + #13#10 +
      'Label3.Caption=Висота:' + #13#10 +
      'LBPage.Caption=Сторінка' + #13#10 +
      'ToolButton1.Hint=Збільшити' + #13#10 +
      'ToolButton2.Hint=Зменшити' + #13#10 +
      'SaveDialog1.Filter=Текстовий файл (*.txt)|*.txt' + #13#10 +
      'SaveDialog1.DefaultExt=.txt' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Друк' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Відмова' + #13#10 +
      'GroupBox1.Caption=Принтер' + #13#10 +
      'Label4.Caption=Ім''я' + #13#10 +
      'PropButton.Caption=Налаштування...' + #13#10 +
      'GroupBox3.Caption=Копії' + #13#10 +
      'Label2.Caption=Кількість' + #13#10 +
      'GroupBox2.Caption= Опції ' + #13#10 +
      'Label1.Caption=Тип принтера' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Настроювання принтера (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Настроювання принтера (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Експорт в RTF (табличний)' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опції ' + #13#10 +
      'PicturesCB.Caption=Картинки' + #13#10 +
      'PageBreaksCB.Caption=Розриви сторінок' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Відкрити після експорту' + #13#10 +
      'SaveDialog1.Filter=Файл RTF (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Експорт в малюнок' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Опції ' + #13#10 +
      'Label2.Caption=Якість JPEG' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Обрізати сторінку' + #13#10 +
      'Mono.Caption=Монохромний' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Експорт в PDF' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GroupPageRange.Caption= Сторінки ' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені комами. Наприклад, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Опції ' + #13#10 +
      'CompressedCB.Caption=Компресія' + #13#10 +
      'EmbeddedCB.Caption=Вмонтувати шрифти' + #13#10 +
      'PrintOptCB.Caption=Висока якість' + #13#10 +
      'BackgrCB.Caption=Фон' + #13#10 +
      'OutlineCB.Caption=Оглавление' + #13#10 +
      'OpenCB.Caption=Відкрити після експорту' + #13#10 +
      'SaveDialog1.Filter=Файл Adobe PDF (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'Документ Word (табличний)');
    Add('BMPexport', 'Малюнок BMP');
    Add('JPEGexport', 'Малюнок JPEG');
    Add('TIFFexport', 'Малюнок TIFF');
    Add('TextExport', 'Текстовий файл');
    Add('XlsOLEexport', 'Документ Excel (OLE)');
    Add('HTMLexport', 'Документ HTML (табличний)');
    Add('XlsXMLexport', 'Документ Excel (XML)');
    Add('PDFexport', 'Документ PDF');

    Add('ProgressWait', 'Почекайте, будь ласка');
    Add('ProgressRows', 'Настроювання рядків');
    Add('ProgressColumns', 'Настроювання колонок');
    Add('ProgressStyles', 'Настроювання стилів');
    Add('ProgressObjects', 'Експорт об''єктів');

    Add('TIFFexportFilter', 'Малюнок TIFF (*.tif)|*.tif');
    Add('BMPexportFilter', 'Малюнок BMP (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Малюнок JPEG (*.jpg)|*.jpg');

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

