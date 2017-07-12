
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
      'Caption=Попередній перегляд' + #13#10 +
      'PrintB.Caption=Друк' + #13#10 +
      'PrintB.Hint=Друк' + #13#10 +
      'OpenB.Caption=Відкрити' + #13#10 +
      'OpenB.Hint=Відкрити' + #13#10 +
      'SaveB.Caption=Зберегти' + #13#10 +
      'SaveB.Hint=Зберегти' + #13#10 +
      'ExportB.Caption=Експорт' + #13#10 +
      'ExportB.Hint=Експорт' + #13#10 +
      'FindB.Caption=Знайти' + #13#10 +
      'FindB.Hint=Знайти' + #13#10 +
      'ZoomWholePageB.Caption=Цілком' + #13#10 +
      'ZoomWholePageB.Hint=Сторінка цілком' + #13#10 +
      'ZoomPageWidthB.Caption=По ширині' + #13#10 +
      'ZoomPageWidthB.Hint=По ширині' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Дві сторінки' + #13#10 +
      'Zoom50B.Hint=Дві сторінки' + #13#10 +
      'ZoomCB.Hint=Масштаб' + #13#10 +
      'PageSettingsB.Caption=Поля' + #13#10 +
      'PageSettingsB.Hint=Властивості сторінки' + #13#10 +
      'OutlineB.Caption=Дерево' + #13#10 +
      'OutlineB.Hint=Дерево звіту' + #13#10 +
      'HandToolB.Caption=Рука' + #13#10 +
      'HandToolB.Hint=Рука' + #13#10 +
      'ZoomToolB.Caption=Лупа' + #13#10 +
      'ZoomToolB.Hint=Лупа' + #13#10 +
      'NewPageB.Caption=Додати' + #13#10 +
      'NewPageB.Hint=Додати сторінку' + #13#10 +
      'DelPageB.Caption=Видалити' + #13#10 +
      'DelPageB.Hint=Видалити сторінку' + #13#10 +
      'DesignerB.Caption=Виправлення' + #13#10 +
      'DesignerB.Hint=Редагувати сторінку' + #13#10 +
      'FirstB.Caption=Перша' + #13#10 +
      'FirstB.Hint=На першу сторінку' + #13#10 +
      'PriorB.Caption=Попередня' + #13#10 +
      'PriorB.Hint=На попередню сторінку' + #13#10 +
      'NextB.Caption=Наступна' + #13#10 +
      'NextB.Hint=На наступну сторінку' + #13#10 +
      'LastB.Caption=Остання' + #13#10 +
      'LastB.Hint=На останню сторінку' + #13#10 +
      'CancelB.Caption=Закрити' + #13#10 +
      'PageE.Hint=Номер сторінки' + #13#10 +
      '');
    Add('zmPageWidth', 'По ширині');
    Add('zmWholePage', 'Сторінка цілком');

    Add('TfrxPrintDialog',
      'Caption=Друк' + #13#10 +
      'Label12.Caption=Принтер   ' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені кома-ми. Наприклад, 1,3,5-12' + #13#10 +
      'Label1.Caption=Сторінки   ' + #13#10 +
      'CopiesL.Caption=Кількість' + #13#10 +
      'CollateL.Caption=Розібрати по копіях' + #13#10 +
      'Label2.Caption=Копії   ' + #13#10 +
      'PrintL.Caption=Друкувати' + #13#10 +
      'TypeL.Caption=Тип:' + #13#10 +
      'WhereL.Caption=Де:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'PropButton.Caption=Властивості...' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'FileCB.Caption=Друк у файл' + #13#10 +
      'ReverseCB.Caption=У зворотному порядку' + #13#10 +
      'BinL.Caption=Джерело паперу:' + #13#10 +
      '');
    Add('ppAll', 'Всі сторінки');
    Add('ppOdd', 'Непарні сторінки');
    Add('ppEven', 'Парні сторінки');

    Add('TfrxSearchDialog',
      'Caption=Шукати текст' + #13#10 +
      'TextL.Caption=Текст:' + #13#10 +
      'SearchL.Caption=Налаштування пошуку   ' + #13#10 +
      'ReplaceL.Caption=Замінити на' + #13#10 +
      'TopCB.Caption=Шукати з початку' + #13#10 +
      'CaseCB.Caption=Розрізняти регістр' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Настроювання сторінки' + #13#10 +
      'WidthL.Caption=Ширина' + #13#10 +
      'HeightL.Caption=Висота' + #13#10 +
      'SizeL.Caption=Розмір   ' + #13#10 +
      'OrientationL.Caption=Орієнтація   ' + #13#10 +
      'LeftL.Caption=Ліве' + #13#10 +
      'TopL.Caption=Верхнє' + #13#10 +
      'RightL.Caption=Праве' + #13#10 +
      'BottomL.Caption=Нижнє' + #13#10 +
      'MarginsL.Caption=Поля   ' + #13#10 +
      'PortraitRB.Caption=Портретна' + #13#10 +
      'LandscapeRB.Caption=Альбомна' + #13#10 +
      'cmL1.Caption=см' + #13#10 +
      'cmL2.Caption=см' + #13#10 +
      'cmL3.Caption=см' + #13#10 +
      'cmL4.Caption=см' + #13#10 +
      'cmL5.Caption=см' + #13#10 +
      'cmL6.Caption=см' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'OtherL.Caption=Інше   ' + #13#10 +
      'ApplyToCurRB.Caption=Застосувати до поточної сторінки' + #13#10 +
      'ApplyToAllRB.Caption=Застосувати до всіх сторінок' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Друк' + #13#10 +
      'PrinterL.Caption=Принтер   ' + #13#10 +
      'PagesL.Caption=Сторінки   ' + #13#10 +
      'CopiesL.Caption=Копії   ' + #13#10 +
      'CopiesNL.Caption=Кількість' + #13#10 +
      'DescrL.Caption=Введіть номери й/або діапазони сторінок, розділені кома-ми. Наприклад, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Опції   ' + #13#10 +
      'EscL.Caption=ESC-команди   ' + #13#10 +
      'OK.Caption=ОК' + #13#10 +
      'Cancel.Caption=Відмова' + #13#10 +
      'SaveToFileCB.Caption=Друк у файл' + #13#10 +
      'AllRB.Caption=Всі' + #13#10 +
      'CurPageRB.Caption=Поточна' + #13#10 +
      'PageNumbersRB.Caption=Номери:' + #13#10 +
      'PageBreaksCB.Caption=Розриви сторінок' + #13#10 +
      'OemCB.Caption=OEM-кодування' + #13#10 +
      'PseudoCB.Caption=Псевдографіка' + #13#10 +
      'SaveDialog1.Filter=Файл друку (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('mbConfirm', 'Підтвердження');
    Add('mbError', 'Помилка');
    Add('mbInfo', 'Інформація');
    Add('xrCantFindClass', 'Не вдалося знайти клас');
    Add('prVirtual', 'Віртуальний');
    Add('prDefault', 'За замовчуванням');
    Add('prCustom', 'Користувацький');
    Add('enUnconnHeader', 'Не підключений header/footer');
    Add('enUnconnGroup', 'Немає дата-бенду для групи');
    Add('enUnconnGFooter', 'Немає заголовка групи');
    Add('enBandPos', 'Неправильно розташований бенд:');
    Add('dbNotConn', 'Компонент %s не підключений до даних');
    Add('dbFldNotFound', 'Поле не знайдене:');
    Add('clDSNotIncl', '(компонент не включений в Report.DataSets)');
    Add('clUnknownVar', 'Невідома змінна або поле БД:');
    Add('clScrError', 'Помилка в скрипті %s: %s');
    Add('clDSNotExist', 'Набір даних "%s" не знайдений');
    Add('clErrors', 'Були виявлені наступні помилки:');
    Add('clExprError', 'Помилка у вираженні');
    Add('clFP3files', 'Готовий звіт');
    Add('clSaving', 'Зберігається файл...');
    Add('clCancel', 'Відмова');
    Add('clClose', 'Закрити');
    Add('clPrinting', 'Друкується сторінка');
    Add('clLoading', 'Завантажується файл...');
    Add('clPageOf', 'Сторінка %d з %d');
    Add('clFirstPass', 'Перший прохід: сторінка ');
    Add('clNoPrinters', 'У вашій системі не встановлено принтерів');
    Add('clDecompressError', 'Помилка розпакування даних');
    Add('crFillMx', 'Заповнюється cross-tab...');
    Add('crBuildMx', 'Будується cross-tab...');

    Add('prRunningFirst', 'Перший прохід: сторінка %d');
    Add('prRunning', 'Готується сторінка %d');
    Add('prPrinting', 'Друкується сторінка %d');
    Add('prExporting', 'Експорт сторінки %d');
    Add('uCm', 'см');
    Add('uInch', 'in');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.

