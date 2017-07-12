
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

unit frxrcInsp;

interface

procedure frAddInspectorRes;


implementation

uses frxRes;


procedure frAddInspectorRes;
begin
  with frxResources do
  begin
    Add('propActive', 'Определяет, активен ли набор данных');
    Add('propActive.TfrxHighlight', 'Определяет, активно ли условное выделение');
    Add('propAliasName', 'Имя алиаса BDE');
    Add('propAlign', 'Выравнивание объекта относительно родителя');
    Add('propAlignment', 'Выравнивание текста объекта');
    Add('propAllowAllUp', 'Определяет, могут ли все кнопки группы быть отжаты');
    Add('propAllowEdit', 'Определяет, может ли пользователь редактировать готовый отчет');
    Add('propAllowExpressions', 'Определяет, могут ли в тексте объекта находиться выражения');
    Add('propAllowGrayed', 'Разрешает третье состояние чекбоксов');
    Add('propAllowHTMLTags', 'Определяет, могут ли в тексте объекта находиться HTML-тэги');
    Add('propAllowSplit', 'Разрешает разрыв содержимого бэнда');
    Add('propAuthor', 'Автор отчета');
    Add('propAutoSize', 'Авто-размер картинки');
    Add('propAutoWidth', 'Авто-ширина текста');
    Add('propBackPicture', 'Фоновая картинка страницы');
    Add('propBarType', 'Тип штрихкода');
    Add('propBevelInner', 'Тип внутренней рамки');
    Add('propBevelOuter', 'Тип внешней рамки');
    Add('propBevelWidth', 'Толщина рамки');
    Add('propBorder', 'Определяет, надо ли показывать внешнюю рамку вокруг объекта');
    Add('propBorderStyle', 'Стиль окна');
    Add('propBottomMargin', 'Размер нижнего поля страницы');
    Add('propBrushStyle', 'Стиль кисти, используемый при рисовании заливки объекта');
    Add('propCalcCheckSum', 'Определяет, надо ли вычислять контрольную сумму автоматически');
    Add('propCancel', 'Определяет, должна ли срабатывать кнопка при нажатии клавиши Esc');
    Add('propCaption', 'Заголовок элемента управления');
    Add('propCellFields', 'Имена полей БД, расположенных в ячейках таблицы');
    Add('propCellLevels', 'Количество уровней в ячейках таблицы');
    Add('propCenter', 'Определяет, надо ли центрировать картинку внутри объекта');
    Add('propCharset', 'Набор символов шрифта');
    Add('propCharSpacing', 'Промежуток между символами');
    Add('propCheckColor', 'Цвет галочки');
    Add('propChecked', 'Определяет, отмечен ли элемент управления');
    Add('propCheckStyle', 'Тип галочки');
    Add('propChild', 'Дочерний бэнд, связанный с данным бэндом');
    Add('propCollate', 'Определяет, надо ли разбирать по копиям');
    Add('propColor.TFont', 'Цвет шрифта');
    Add('propColor', 'Цвет объекта');
    Add('propColor.TfrxFrame', 'Цвет рамки');
    Add('propColor.TfrxHighlight', 'Цвет объекта, если условное выделение активно');
    Add('propColumnFields', 'Имена полей БД, расположенных в заголовке колонок таблицы');
    Add('propColumnGap', 'Промежуток между колонками бэнда');
    Add('propColumnLevels', 'Количество уровней в заголовке колонок таблицы');
    Add('propColumns', 'Количество колонок на бэнде');
    Add('propColumnWidth', 'Ширина колонки бэнда');
    Add('propCondition', 'Условие группировки. При изменении значения этого выражения формируется новая группа');
    Add('propCondition.TfrxHighlight', 'Выражение для условного выделения. Если значение этого выражения равно True, выделение будет активно');
    Add('propConnected', 'Определяет, активно ли подключение к БД');
    Add('propConvertNulls', 'Определяет, должны ли пустые значения полей БД быть конвертированы в 0, False или пустую строку, в зависимости от типа поля');
    Add('propCopies', 'Количество копий');
    Add('propCursor', 'Форма курсора объекта');
    Add('propDatabaseName', 'Имя базы данных');
    Add('propDataField', 'Имя поля БД, к которому привязан объект');
    Add('propDataSet', 'Набор данных, к которому привязан объект');
    Add('propDate', 'Дата');
    Add('propDateFormat', 'Формат даты');
    Add('propDecimalSeparator', 'Разделитель целой и дробной частей числа');
    Add('propDefault', 'Определяет, сработает ли кнопка при нажатии клавиши Enter');
    Add('propDefHeight', 'Высота строки таблицы по умолчанию');
    Add('propDescription', 'Описание отчета');
    Add('propDiagonal', 'Определяет, является ли линия диагональной');
    Add('propDisplayFormat', 'Форматирование выводимых значений');
    Add('propDoublePass', 'Определяет, является ли отчет двухпроходным');
    Add('propDown', 'Определяет, нажата ли кнопка');
    Add('propDownThenAcross', 'Определяет, как будет разбита на страницы большая таблица');
    Add('propDriverName', 'Имя драйвера BDE');
    Add('propDropShadow', 'Определяет, показывать ли тень');
    Add('propDuplex', 'Режим дуплексной печати');
    Add('propEditMask', 'Маска для редактирования текста');
    Add('propEnabled', 'Определяет, разрешен ли элемент управления');
    Add('propEngineOptions', 'Свойства движка отчета');
    Add('propExpression', 'Выражение, значение которого будет отображено в объекте');
    Add('propExpressionDelimiters', 'Символы, используемые для обозначения выражений в тексте');
    Add('propFieldAliases', 'Алиасы полей БД');
    Add('propFilter', 'Выражение фильтрации записей набора данных');
    Add('propFiltered', 'Определяет, надо ли использовать фильтрацию, указанную в свойстве Filter');
    Add('propFlowTo', 'Объект, который будет показывать текст, не поместившийся в данном объекте');
    Add('propFont', 'Параметры шрифта');
    Add('propFooterAfterEach', 'Определяет, надо ли показывать подвал после каждой строки данных');
    Add('propFormatStr', 'Строка форматирования');
    Add('propFrame', 'Параметры рамки');
    Add('propGapX', 'Отступ текста слева и справа от границ объекта');
    Add('propGapY', 'Отступ текста сверху и снизу от границ объекта');
    Add('propGlyph', 'Картинка элемента управления');
    Add('propGroupIndex', 'Позволяет объединять кнопки в группу');
    Add('propHAlign', 'Выравнивание текста по горизонтали');
    Add('propHeight', 'Высота объекта');
    Add('propHideZeros', 'Определяет, надо ли скрывать объекты с нулевыми значениями');
    Add('propHighlight', 'Параметры условного выделения');
    Add('propIndexName', 'Имя индекса');
    Add('propInitString', 'Строка инициализации принтера для печати матричных отчетов');
    Add('propItems', 'Список строк объекта');
    Add('propKeepAspectRatio', 'Сохранять пропорции изображения');
    Add('propKeepChild', 'Определяет, должен ли бэнд выводиться на той же странице, что и его child');
    Add('propKeepFooter', 'Определяет, должен ли бэнд выводиться на той же странице, что и его footer');
    Add('propKeepHeader', 'Определяет, должен ли бэнд выводиться на той же странице, что и его header');
    Add('propKeepTogether', 'Определяет, должна ли группа бэндов выводиться на одной странице');
    Add('propKind.TfrxFormat', 'Тип форматирования');
    Add('propKind', 'Тип кнопки');
    Add('propLargeDesignHeight', 'Определяет, будет ли страница иметь большую высоту в режиме дизайнера');
    Add('propLayout', 'Размещение картинки');
    Add('propLeft', 'Координата Х объекта');
    Add('propLeftMargin', 'Размер левого поля страницы');
    Add('propLines', 'Текст объекта');
    Add('propLineSpacing', 'Промежуток между строками текста');
    Add('propLoginPrompt', 'Определяет, надо ли показывать диалог с именем/паролем при подключении к БД');
    Add('propMargin', 'Расстояние между картинкой и краем элемента управления');
    Add('propMaster', 'Главный набор данных, для образования связей master-detail');
    Add('propMasterFields', 'Связанные поля главного и подчиненного набора данных');
    Add('propMaxLength', 'Максимальная длина текста');
    Add('propMaxWidth', 'Максимальная ширина колонки');
    Add('propMemo', 'Текст объекта');
    Add('propMinWidth', 'Минимальная ширина колонки');
    Add('propMirrorMargins', 'Зеркальные поля страницы');
    Add('propModalResult', 'Определяет, с каким результатом кнопка закрывает модальную форму');
    Add('propName.TFont', 'Имя шрифта');
    Add('propName.TfrxReportOptions', 'Имя отчета');
    Add('propName', 'Имя объекта');
    Add('propNumGlyphs', 'Количество картинок, заданных в свойстве Glyph');
    Add('propOpenDataSource', 'Определяет, надо ли автоматически открывать набор данных');
    Add('propOrientation', 'Ориентация страницы');
    Add('propOutlineText', 'Текст, который будет отображен в "Дереве отчета" в окне предварительном просмотре');
    Add('propOutlineVisible', 'Определяет, показывать ли "Дерево отчета" в окне предварительного просмотра');
    Add('propOutlineWidth', 'Ширина "Дерева отчета"');
    Add('propPageNumbers.TfrxPrintOptions', 'Номера страниц, которые должны быть напечатаны');
    Add('propPaperHeight', 'Высота страницы');
    Add('propPaperWidth', 'Ширина страницы');
    Add('propParagraphGap', 'Отступ параграфа');
    Add('propParams.TfrxBDEDatabase', 'Параметры подключения к БД');
    Add('propParams', 'Параметры запроса');
    Add('propParentFont', 'Определяет, надо ли использовать настройки шрифта родителя');
    Add('propPassword', 'Пароль отчета');
    Add('propPasswordChar', 'Определяет символ, используемый при отображении пароля');
    Add('propPicture', 'Картинка');
    Add('propPicture.TfrxReportOptions', 'Картинка отчета');
    Add('propPosition', 'Позиция окна по умолчанию');
    Add('propPreviewOptions', 'Настройки предварительного просмотра');
    Add('propPrintable', 'Определяет, надо ли печатать объект. В любом случае объект будет виден в окне просмотра');
    Add('propPrintChildIfInvisible', 'Определяет, надо ли печатать дочерний бэнд, если основной бэнд невидим');
    Add('propPrinter', 'Принтер, который будет выбран при печати отчета');
    Add('propPrintIfDetailEmpty', 'Определяет, надо ли печатать бэнд, если его подбэнды не содержат записей');
    Add('propPrintIfEmpty', 'Определяет, надо ли печатать страницу, если все ее дата-бэнды не имеют записей');
    Add('propPrintOnFirstPage', 'Определяет, надо ли печатать бэнд на первой странице');
    Add('propPrintOnLastPage', 'Определяет, надо ли печатать бэнд на последней странице');
    Add('propPrintOnParent', 'Определяет, выводить ли содержимое вложенного отчета на родительском бэнде');
    Add('propPrintOnPreviousPage', 'Определяет, начинать ли печать очередной страницы на свободном месте предыдущей страницы');
    Add('propPrintOptions', 'Настройки печати');
    Add('propPrintPages', 'Определяет, какие страницы печатать - все, нечетные или четные');
    Add('propRangeBegin', 'Начальная точка навигации по набору данных');
    Add('propRangeEnd', 'Конечная точка навигации по набору данных');
    Add('propRangeEndCount', 'Количество записей в наборе данных, если RangeEnd = reCount');
    Add('propReadOnly', 'Устанавливает режим "только для чтения"');
    Add('propRepeatHeaders', 'Определяет, надо ли повторять вывод заголовков на всех страницах');
    Add('propReportOptions', 'Настройки отчета');
    Add('propReprintOnNewPage', 'Определяет, надо ли повторять вывод бэнда на всех страницах');
    Add('propRestrictions', 'Набор флагов, запрещающих те или иные действия');
    Add('propRightMargin', 'Размер правого поля страницы');
    Add('propRotation.TfrxBarCodeView', 'Ориентация штрихкода');
    Add('propRotation', 'Ориентация текста');
    Add('propRowCount', 'Количество строк в дата-бэнде, если он не подключен к данным');
    Add('propRowFields', 'Имена полей БД, расположенных в заголовке строк таблицы');
    Add('propRowLevels', 'Количество уровней в заголовке строк таблицы');
    Add('propRTLReading', 'Определяет, надо ли использовать направление текста справа налево');
    Add('propSessionName', 'Имя сессии BDE');
    Add('propShadowColor', 'Цвет тени');
    Add('propShadowWidth', 'Размер тени');
    Add('propShape', 'Тип фигуры');
    Add('propShiftMode', 'Режим смещения объекта');
    Add('propShowColumnHeader', 'Определяет, показывать ли заголовки колонок');
    Add('propShowColumnTotal', 'Определяет, показывать ли итог по колонкам');
    Add('propShowDialog', 'Определяет, показывать ли диалог печати в окне предварительного просмотра');
    Add('propShowRowHeader', 'Определяет, показывать ли заголовки строк');
    Add('propShowRowTotal', 'Определяет, показывать ли итог по строкам');
    Add('propShowText', 'Определяет, показывать ли текст под штрихкодом');
    Add('propSize', 'Размер шрифта');
    Add('propSorted', 'Определяет, сортировать ли список');
    Add('propSpacing', 'Промежуток между картинкой и надписью');
    Add('propSQL', 'Выражение SQL');
    Add('propStartNewPage', 'Определяет, формировать ли разрыв страницы перед печатью бэнда');
    Add('propStretch', 'Растягивать картинку по размерам объекта');
    Add('propStretched', 'Определяет, может ли объект растягиваться');
    Add('propStretchMode', 'Режим растягивания объекта');
    Add('propStyle.TFont', 'Стиль шрифта');
    Add('propStyle', 'Стиль элемента управления');
    Add('propStyle.TfrxFrame', 'Стиль рамки');
    Add('propSuppressRepeated', 'Определяет, скрывать ли повторяющиеся значения');
    Add('propTableName', 'Имя таблицы');
    Add('propTag', 'Тэг объекта, число');
    Add('propTagStr', 'Тэг объекта, выражение');
    Add('propText', 'Текст объекта');
    Add('propTitleBeforeHeader', 'Определяет, надо ли показывать заголовок отчета перед заголовком страницы');
    Add('propTop', 'Координата Y объекта');
    Add('propTopMargin', 'Размер верхней границы страницы');
    Add('propTyp', 'Тип рамки');
    Add('propUnderlines', 'Определяет, подчеркивать ли каждую строку текста');
    Add('propURL', 'Выражение - URL объекта');
    Add('propUserName', 'Пользовательское имя объекта');
    Add('propVAlign', 'Выравнивание текста по вертикали');
    Add('propVersionBuild', 'Версия, build');
    Add('propVersionMajor', 'Версия, major version');
    Add('propVersionMinor', 'Версия, minor version');
    Add('propVersionRelease', 'Версия, release');
    Add('propVisible', 'Определяет, видим ли объект');
    Add('propWidth', 'Ширина объекта');
    Add('propWidth.TfrxFrame', 'Толщина рамки');
    Add('propWindowState', 'Начальное состояние окна');
    Add('propWordBreak', 'Разбивать русские слова по слогам');
    Add('propWordWrap', 'Определяет, надо ли переносить текст по словам');
    Add('propZoom.TfrxBarCodeView', 'Масштаб штрихкода');
  end;
end;


initialization
  frAddInspectorRes;

end.
