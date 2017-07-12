
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'Визначає, чи активний набір даних');
    Add('propActive.TfrxHighlight', 'Визначає, чи активно умовне виділення');
    Add('propAliasName', 'Ім''я аліаса BDE');
    Add('propAlign', 'Вирівнювання об''єкта щодо батька');
    Add('propAlignment', 'Вирівнювання тексту об''єкта');
    Add('propAllowAllUp', 'Визначає, чи можуть всі кнопки групи бути віджаті');
    Add('propAllowEdit', 'Визначає, чи може користувач редагувати готовий звіт');
    Add('propAllowExpressions', 'Визначає, чи можуть у тексті об''єкта перебувати вирази');
    Add('propAllowGrayed', 'Дозволяє третій стан чекбоксів');
    Add('propAllowHTMLTags', 'Визначає, чи можуть у тексті об''єкта перебувати HTML-теги');
    Add('propAllowSplit', 'Дозволяє розрив вмісту бенда');
    Add('propAuthor', 'Автор звіту');
    Add('propAutoSize', 'Авто-розмір картинки');
    Add('propAutoWidth', 'Авто-ширина тексту');
    Add('propBackPicture', 'Фонова картинка сторінки');
    Add('propBarType', 'Тип штрихкода');
    Add('propBevelInner', 'Тип внутрішньої рамки');
    Add('propBevelOuter', 'Тип зовнішньої рамки');
    Add('propBevelWidth', 'Товщина рамки');
    Add('propBorder', 'Визначає, чи треба показувати зовнішню рамку навколо об''єкта');
    Add('propBorderStyle', 'Стиль вікна');
    Add('propBottomMargin', 'Розмір нижнього поля сторінки');
    Add('propBrushStyle', 'Стиль кисті, використовуваний при малюванні заливки об''єкта');
    Add('propCalcCheckSum', 'Визначає, чи треба обчислювати контрольну суму автоматично');
    Add('propCancel', 'Визначає, чи повинна спрацьовувати кнопка при натисканні клавіші Esc');
    Add('propCaption', 'Заголовок елемента керування');
    Add('propCellFields', 'Імена полів БД, розташованих в чарунках таблиці');
    Add('propCellLevels', 'Кількість рівнів в чарунках таблиці');
    Add('propCenter', 'Визначає, чи треба центрувати картинку всередині об''єкта');
    Add('propCharset', 'Набір символів шрифту');
    Add('propCharSpacing', 'Проміжок між символами');
    Add('propCheckColor', 'Кольори галочки');
    Add('propChecked', 'Визначає, чи відзначений елемент керування');
    Add('propCheckStyle', 'Тип галочки');
    Add('propChild', 'Дочірній бенд, пов''язаний з даним бендом');
    Add('propCollate', 'Визначає, чи треба розбирати по копіях');
    Add('propColor.TFont', 'Кольори шрифту');
    Add('propColor', 'Кольори об''єкта');
    Add('propColor.TfrxFrame', 'Кольори рамки');
    Add('propColor.TfrxHighlight', 'Кольори об''єкта, якщо умовне виділення активне');
    Add('propColumnFields', 'Імена полів БД, розташованих у заголовку колонок таблиці');
    Add('propColumnGap', 'Проміжок між колонками бенда');
    Add('propColumnLevels', 'Кількість рівнів у заголовку колонок таблиці');
    Add('propColumns', 'Кількість колонок на бенді');
    Add('propColumnWidth', 'Ширина колонки бенда');
    Add('propCondition', 'Умова групування. При зміні значення цього виразу формується нова група');
    Add('propCondition', 'Вираз для умовного виділення. Якщо значення цього виразу дорівнює True, виділення буде активним');
    Add('propConnected', 'Визначає, чи активне підключення до БД');
    Add('propConvertNulls', 'Визначає, чи потрібно порожні значення полів БД конвертувати в 0, False або порожній рядок, залежно від типу поля');
    Add('propCopies', 'Кількість копій');
    Add('propCursor', 'Форма курсору об''єкта');
    Add('propDatabaseName', 'Ім''я бази даних');
    Add('propDataField', 'Ім''я поля БД, до якого прив''язаний об''єкт');
    Add('propDataSet', 'Набір даних, до якого прив''язаний об''єкт');
    Add('propDate', 'Дата');
    Add('propDateFormat', 'Формат дати');
    Add('propDecimalSeparator', 'Роздільник цілої й дробової частин числа');
    Add('propDefault', 'Визначає, чи спрацює кнопка при натисканні клавіші Enter');
    Add('propDefHeight', 'Висота рядка таблиці за замовчуванням');
    Add('propDescription', 'Опис звіту');
    Add('propDiagonal', 'Визначає, чи є лінія діагональною');
    Add('propDisplayFormat', 'Форматування виведених значень');
    Add('propDoublePass', 'Визначає, чи є звіт двухпрохідним');
    Add('propDown', 'Визначає, чи натиснута кнопка');
    Add('propDownThenAcross', 'Визначає, як буде розбита на сторінки більша таблиця');
    Add('propDriverName', 'Ім''я драйвера BDE');
    Add('propDropShadow', 'Визначає, чи показувати тінь');
    Add('propDuplex', 'Режим дуплексного друку');
    Add('propEditMask', 'Маска для редагування тексту');
    Add('propEnabled', 'Визначає, чи дозволений елемент керування');
    Add('propEngineOptions', 'Властивості движка звіту');
    Add('propExpression', 'Вираження, значення якого буде відображено в об''єкті');
    Add('propExpressionDelimiters', 'Символи, використовувані для позначення виразів у тексті');
    Add('propFieldAliases', 'Аліаси полів БД');
    Add('propFilter', 'Вирази фільтрації записів набору даних');
    Add('propFiltered', 'Визначає, чи треба використати фільтрацію, зазначену у властивості Filter');
    Add('propFlowTo', 'Об''єкт, що буде показувати текст, що не помістився в даному об''єкті');
    Add('propFont', 'Параметри шрифту');
    Add('propFooterAfterEach', 'Визначає, чи треба показувати підвал після кожного рядка даних');
    Add('propFormatStr', 'Рядок форматування');
    Add('propFrame', 'Параметри рамки');
    Add('propGapX', 'Відступ тексту ліворуч і праворуч від границь об''єкта');
    Add('propGapY', 'Відступ тексту зверху й знизу від границь об''єкта');
    Add('propGlyph', 'Картинка елемента керування');
    Add('propGroupIndex', 'Дозволяє поєднувати кнопки в групу');
    Add('propHAlign', 'Вирівнювання тексту по горизонталі');
    Add('propHeight', 'Висота об''єкта');
    Add('propHideZeros', 'Визначає, чи треба приховувати об''єкти з нульовими значеннями');
    Add('propHighlight', 'Параметри умовного виділення');
    Add('propIndexName', 'Ім''я індексу');
    Add('propInitString', 'Рядок ініціалізації принтера для друку матричних звітів');
    Add('propItems', 'Список рядків об''єкта');
    Add('propKeepAspectRatio', 'Зберігати пропорції зображення');
    Add('propKeepChild', 'Визначає, чи повиннен бенд виводитися на тій же сторінці, що і його child');
    Add('propKeepFooter', 'Визначає, чи повиннен бенд виводитися на тій же сторінці, що і його footer');
    Add('propKeepHeader', 'Определяет, должен ли бэнд выводиться на той же странице, что и его header');
    Add('propKeepTogether', 'Визначає, чи повинна група бендів виводитися на одній сторінці');
    Add('propKind.TfrxFormat', 'Тип форматування');
    Add('propKind', 'Тип кнопки');
    Add('propLargeDesignHeight', 'Визначає, чи буде сторінка мати більшу висоту в режимі дизайнера');
    Add('propLayout', 'Розміщення картинки');
    Add('propLeft', 'Координата Х об''єкта');
    Add('propLeftMargin', 'Розмір лівого поля сторінки');
    Add('propLines', 'Текст об''єкта');
    Add('propLineSpacing', 'Проміжок між рядками тексту');
    Add('propLoginPrompt', 'Визначає, чи треба показувати діалог з ім''ям/паролем при підключенні до БД');
    Add('propMargin', 'Відстань між картинкою й краєм елемента керування');
    Add('propMaster', 'Головний набір даних, для утворення зв''язків master-detail');
    Add('propMasterFields', 'Зв''язані поля головного й підлеглого набору даних');
    Add('propMaxLength', 'Максимальна довжина тексту');
    Add('propMaxWidth', 'Максимальна ширина колонки');
    Add('propMemo', 'Текст об''єкта');
    Add('propMinWidth', 'Мінімальна ширина колонки');
    Add('propMirrorMargins', 'Дзеркальні поля сторінки');
    Add('propModalResult', 'Визначає, з яким результатом кнопка закриває модальну форму');
    Add('propName.TFont', 'Ім''я шрифту');
    Add('propName.TfrxReportOptions', 'Ім''я звіту');
    Add('propName', 'Ім''я об''єкта');
    Add('propNumGlyphs', 'Кількість картинок, заданих у властивості Glyph');
    Add('propOpenDataSource', 'Визначає, чи треба автоматично відкривати набір даних');
    Add('propOrientation', 'Орієнтація сторінки');
    Add('propOutlineText', 'Текст, що буде відображений в "Дереві звіту" у вікні попередньому перегляді');
    Add('propOutlineVisible', 'Визначає, чи показувати "Дерево звіту" у вікні попереднього перегляду');
    Add('propOutlineWidth', 'Ширина "Дерева звіту"');
    Add('propPageNumbers.TfrxPrintOptions', 'Номера сторінок, які повинні бути надруковані');
    Add('propPaperHeight', 'Висота сторінки');
    Add('propPaperWidth', 'Ширина сторінки');
    Add('propParagraphGap', 'Відступ параграфа');
    Add('propParams.TfrxBDEDatabase', 'Параметри підключення до БД');
    Add('propParams', 'Параметри запиту');
    Add('propParentFont', 'Визначає, чи треба використати настроювання шрифту батька');
    Add('propPassword', 'Пароль звіту');
    Add('propPasswordChar', 'Визначає символ, використовуваний при відображенні пароля');
    Add('propPicture', 'Картинка');
    Add('propPicture.TfrxReportOptions', 'Картинка звіту');
    Add('propPosition', 'Позиція вікна за замовчуванням');
    Add('propPreviewOptions', 'Настроювання попереднього перегляду');
    Add('propPrintable', 'Визначає, чи треба друкувати об''єкт. У кожному разі об''єкт буде видний у вікні перегляду');
    Add('propPrintChildIfInvisible', 'Визначає, чи треба друкувати дочірній бенд, якщо основний бенд не бачимо');
    Add('propPrinter', 'Принтер, що буде обраний при друку звіту');
    Add('propPrintIfDetailEmpty', 'Визначає, чи треба друкувати бенд, якщо його підбенди не містять записів');
    Add('propPrintIfEmpty', 'Визначає, чи треба друкувати сторінку, якщо всі її дата-бенди не мають записів');
    Add('propPrintOnFirstPage', 'Визначає, чи треба друкувати бенд на першій сторінці');
    Add('propPrintOnLastPage', 'Визначає, чи треба друкувати бенд на останній сторінці');
    Add('propPrintOnParent', 'Визначає, чи виводити вміст вкладеного звіту на батьківському бенді');
    Add('propPrintOnPreviousPage', 'Визначає, чи починати друк чергової сторінки на вільному місці попередньої сторінки');
    Add('propPrintOptions', 'Настроювання печатки');
    Add('propPrintPages', 'Визначає, які сторінки друкувати - всі, непарні або парні');
    Add('propRangeBegin', 'Початкова точка навігації по набору даних');
    Add('propRangeEnd', 'Кінцева крапка навігації по набору даних');
    Add('propRangeEndCount', 'Кількість записів у наборі даних, якщо RangeEnd = reCount');
    Add('propReadOnly', 'Встановлює режим "тільки для читання"');
    Add('propRepeatHeaders', 'Визначає, чи треба повторювати вивід заголовків на всіх сторінках');
    Add('propReportOptions', 'Настроювання звіту');
    Add('propReprintOnNewPage', 'Визначає, чи треба повторювати вивід бенда на всіх сторінках');
    Add('propRestrictions', 'Набір прапорів, що забороняють ті або інші дії');
    Add('propRightMargin', 'Розмір правого поля сторінки');
    Add('propRotation.TfrxBarCodeView', 'Орієнтація штрихкода');
    Add('propRotation', 'Орієнтація тексту');
    Add('propRowCount', 'Кількість рядків у дата-бенді, якщо він не підключений до даних');
    Add('propRowFields', 'Імена полів БД, розташованих у заголовку рядків таблиці');
    Add('propRowLevels', 'Кількість рівнів у заголовку рядків таблиці');
    Add('propRTLReading', 'Визначає, чи треба використати напрямок тексту праворуч ліворуч');
    Add('propScaleFontWidth', 'Масштаб ширини шрифту');
    Add('propSessionName', 'Ім''я сесії BDE');
    Add('propShadowColor', 'Кольори тіні');
    Add('propShadowWidth', 'Розмір тіні');
    Add('propShape', 'Тип фігури');
    Add('propShiftMode', 'Режим зсуву об''єкта');
    Add('propShowColumnHeader', 'Визначає, чи показувати заголовки колонок');
    Add('propShowColumnTotal', 'Визначає, чи показувати підсумок по колонках');
    Add('propShowDialog', 'Визначає, чи показувати діалог друку у вікні попереднього перегляду');
    Add('propShowRowHeader', 'Визначає, чи показувати заголовки рядків');
    Add('propShowRowTotal', 'Визначає, чи показувати підсумок по рядках');
    Add('propShowText', 'Визначає, чи показувати текст під штрихкодом');
    Add('propSize', 'Розмір шрифту');
    Add('propSorted', 'Визначає, чи сортувати список');
    Add('propSpacing', 'Проміжок між картинкою й написом');
    Add('propSQL', 'Вираз SQL');
    Add('propStartNewPage', 'Визначає, чи формувати розрив сторінки перед друком бенда');
    Add('propStretch', 'Розтягувати картинку по розмірах об''єкта');
    Add('propStretched', 'Визначає, чи може об''єкт розтягуватися');
    Add('propStretchMode', 'Режим розтягування об''єкта');
    Add('propStyle.TFont', 'Стиль шрифту');
    Add('propStyle', 'Стиль елемента керування');
    Add('propStyle.TfrxFrame', 'Стиль рамки');
    Add('propSuppressRepeated', 'Визначає, чи приховувати повторювані значення');
    Add('propTableName', 'Ім''я таблиці');
    Add('propTag', 'Тег об''єкта, число');
    Add('propTagStr', 'Тег об''єкта, вираз');
    Add('propText', 'Текст об''єкта');
    Add('propTitleBeforeHeader', 'Визначає, чи треба показувати заголовок звіту перед заголовком сторінки');
    Add('propTop', 'Координата Y об''єкта');
    Add('propTopMargin', 'Розмір верхньої границі сторінки');
    Add('propTyp', 'Тип рамки');
    Add('propUnderlines', 'Визначає, чи підкреслювати кожен рядок тексту');
    Add('propURL', 'Вираження - URL об''єкта');
    Add('propUserName', 'Користувальницьке ім''я об''єкта');
    Add('propVAlign', 'Вирівнювання тексту по вертикалі');
    Add('propVersionBuild', 'Версія, build');
    Add('propVersionMajor', 'Версія, major version');
    Add('propVersionMinor', 'Версія, minor version');
    Add('propVersionRelease', 'Версія, release');
    Add('propVisible', 'Визначає, чи бачимо об''єкт');
    Add('propWidth', 'Ширина об''єкта');
    Add('propWidth.TfrxFrame', 'Товщина рамки');
    Add('propWindowState', 'Початковий стан вікна');
    Add('propWordBreak', 'Розбивати російські слова по складах');
    Add('propWordWrap', 'Визначає, чи треба переносити текст за словами');
    Add('propZoom.TfrxBarCodeView', 'Масштаб штрихкода');
  end;
end;


initialization
  frAddInspectorRes;

end.

