
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

unit frxrcDesgn;

interface

procedure frAddDesignerRes;


implementation

uses frxRes;


procedure frAddDesignerRes;
begin
  with frxResources do
  begin
    Add('TfrxObjectInspector',
      'Caption=Инспектор' + #13#10 +
      '');
    Add('oiProp', 'Свойства');
    Add('oiEvent', 'События');

    Add('TfrxDataTreeForm',
      'Caption=Дерево данных' + #13#10 +
      'DataTS.Caption=Поля БД' + #13#10 +
      'VariablesTS.Caption=Переменные' + #13#10 +
      'FunctionsTS.Caption=Функции' + #13#10 +
      'InsFieldCB.Caption=Вставлять поле' + #13#10 +
      'InsCaptionCB.Caption=Вставлять заголовок' + #13#10 +
      '');
    Add('dtNoData', 'Нет данных');
    Add('dtData', 'Данные');
    Add('dtSysVar', 'Системные');
    Add('dtVar', 'Переменные');
    Add('dtFunc', 'Функции');

    Add('TfrxReportTreeForm',
      'Caption=Дерево отчета' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Открыть скрипт' + #13#10 +
      'SaveScriptB.Hint=Сохранить скрипт' + #13#10 +
      'RunScriptB.Hint=Запустить отчет' + #13#10 +
      'StepScriptB.Hint=Отладка' + #13#10 +
      'StopScriptB.Hint=Остановить' + #13#10 +
      'EvaluateB.Hint=Вычислить' + #13#10 +
      'LangL.Caption=Язык:' + #13#10 +
      'AlignTB.Caption=Выравнивание' + #13#10 +
      'AlignLeftsB.Hint=Выровнять левые края' + #13#10 +
      'AlignHorzCentersB.Hint=Центрировать по горизонтали' + #13#10 +
      'AlignRightsB.Hint=Выровнять правые края' + #13#10 +
      'AlignTopsB.Hint=Выровнять верхние края' + #13#10 +
      'AlignVertCentersB.Hint=Центрировать по горизонтали' + #13#10 +
      'AlignBottomsB.Hint=Выровнять нижние края' + #13#10 +
      'SpaceHorzB.Hint=Расположить равномерно по ширине' + #13#10 +
      'SpaceVertB.Hint=Расположить равномерно по высоте' + #13#10 +
      'CenterHorzB.Hint=Центрировать по горизонтали на бэнде' + #13#10 +
      'CenterVertB.Hint=Центрировать по вертикали на бэнде' + #13#10 +
      'SameWidthB.Hint=Та же ширина' + #13#10 +
      'SameHeightB.Hint=Та же высота' + #13#10 +
      'TextTB.Caption=Текст' + #13#10 +
      'StyleCB.Hint=Стиль' + #13#10 +
      'FontNameCB.Hint=Имя шрифта' + #13#10 +
      'FontSizeCB.Hint=Размер шрифта' + #13#10 +
      'BoldB.Hint=Утолщение' + #13#10 +
      'ItalicB.Hint=Курсив' + #13#10 +
      'UnderlineB.Hint=Подчеркивание' + #13#10 +
      'FontColorB.Hint=Цвет шрифта' + #13#10 +
      'HighlightB.Hint=Условное выделение' + #13#10 +
      'RotateB.Hint=Поворот текста' + #13#10 +
      'TextAlignLeftB.Hint=Выровнять текст влево' + #13#10 +
      'TextAlignCenterB.Hint=Центрировать текст по горизонтали' + #13#10 +
      'TextAlignRightB.Hint=Выровнять текст вправо' + #13#10 +
      'TextAlignBlockB.Hint=Выровнять текст по ширине' + #13#10 +
      'TextAlignTopB.Hint=Выровнять по верхнему краю' + #13#10 +
      'TextAlignMiddleB.Hint=Центрировать текст по вертикали' + #13#10 +
      'TextAlignBottomB.Hint=Выровнять по нижнему краю' + #13#10 +
      'FrameTB.Caption=Рамка' + #13#10 +
      'FrameTopB.Hint=Верхняя линия' + #13#10 +
      'FrameBottomB.Hint=Нижняя линия' + #13#10 +
      'FrameLeftB.Hint=Левая линия' + #13#10 +
      'FrameRightB.Hint=Правая линия' + #13#10 +
      'FrameAllB.Hint=Все линии рамки' + #13#10 +
      'FrameNoB.Hint=Убрать рамку' + #13#10 +
      'ShadowB.Hint=Тень' + #13#10 +
      'FillColorB.Hint=Цвет заливки' + #13#10 +
      'FrameColorB.Hint=Цвет рамки' + #13#10 +
      'FrameStyleB.Hint=Стиль рамки' + #13#10 +
      'FrameWidthCB.Hint=Толщина рамки' + #13#10 +
      'StandardTB.Caption=Стандартная' + #13#10 +
      'NewB.Hint=Новый отчет' + #13#10 +
      'OpenB.Hint=Открыть' + #13#10 +
      'SaveB.Hint=Сохранить' + #13#10 +
      'PreviewB.Hint=Предварительный просмотр' + #13#10 +
      'NewPageB.Hint=Добавить страницу в отчет' + #13#10 +
      'NewDialogB.Hint=Добавить форму в отчет' + #13#10 +
      'DeletePageB.Hint=Удалить страницу' + #13#10 +
      'PageSettingsB.Hint=Настройки страницы' + #13#10 +
      'VariablesB.Hint=Переменные' + #13#10 +
      'CutB.Hint=Вырезать' + #13#10 +
      'CopyB.Hint=Копировать' + #13#10 +
      'PasteB.Hint=Вставить' + #13#10 +
      'SampleFormatB.Hint=Копировать формат' + #13#10 +
      'UndoB.Hint=Отменить' + #13#10 +
      'RedoB.Hint=Повторить' + #13#10 +
      'ShowGridB.Hint=Показывать сетку' + #13#10 +
      'AlignToGridB.Hint=Выравнивание по сетке' + #13#10 +
      'SetToGridB.Hint=Расположить объекты в узлах сетки' + #13#10 +
      'ScaleCB.Hint=Масштаб' + #13#10 +
      'ExtraToolsTB.Caption=Мастера' + #13#10 +
      'ObjectSelectB.Hint=Выбор объектов' + #13#10 +
      'HandToolB.Hint=Рука' + #13#10 +
      'ZoomToolB.Hint=Лупа' + #13#10 +
      'TextToolB.Hint=Редактор текста' + #13#10 +
      'FormatToolB.Hint=Копирование внешнего вида' + #13#10 +
      'ObjectBandB.Hint=Вставить бэнд' + #13#10 +
      'FileMenu.Caption=&Файл' + #13#10 +
      'EditMenu.Caption=&Правка' + #13#10 +
      'FindMI.Caption=Найти...' + #13#10 +
      'FindNextMI.Caption=Найти далее' + #13#10 +
      'ReplaceMI.Caption=Заменить...' + #13#10 +
      'ReportMenu.Caption=&Отчет' + #13#10 +
      'ReportDataMI.Caption=Данные...' + #13#10 +
      'ReportSettingsMI.Caption=Настройки...' + #13#10 +
      'ReportStylesMI.Caption=Стили...' + #13#10 +
      'ViewMenu.Caption=&Вид' + #13#10 +
      'ToolbarsMI.Caption=Панели инструментов' + #13#10 +
      'StandardMI.Caption=Стандартная' + #13#10 +
      'TextMI.Caption=Текст' + #13#10 +
      'FrameMI.Caption=Рамка' + #13#10 +
      'AlignmentMI.Caption=Выравнивание' + #13#10 +
      'ToolsMI.Caption=Мастера' + #13#10 +
      'InspectorMI.Caption=Инспектор' + #13#10 +
      'DataTreeMI.Caption=Дерево данных' + #13#10 +
      'ReportTreeMI.Caption=Дерево отчета' + #13#10 +
      'ShowRulersMI.Caption=Линейки' + #13#10 +
      'ShowGuidesMI.Caption=Выносные линии' + #13#10 +
      'DeleteGuidesMI.Caption=Удалить выносные линии' + #13#10 +
      'OptionsMI.Caption=Настройки...' + #13#10 +
      'HelpMenu.Caption=&?' + #13#10 +
      'HelpContentsMI.Caption=Help Contents...' + #13#10 +
      'AboutMI.Caption=О FastReport...' + #13#10 +
      'TabOrderMI.Caption=Редактор TabOrder...' + #13#10 +
      'UndoCmd.Caption=Отменить' + #13#10 +
      'RedoCmd.Caption=Повторить' + #13#10 +
      'CutCmd.Caption=Вырезать' + #13#10 +
      'CopyCmd.Caption=Копировать' + #13#10 +
      'PasteCmd.Caption=Вставить' + #13#10 +
      'DeleteCmd.Caption=Удалить' + #13#10 +
      'DeletePageCmd.Caption=Удалить страницу' + #13#10 +
      'SelectAllCmd.Caption=Выбрать все' + #13#10 +
      'EditCmd.Caption=Редактировать...' + #13#10 +
      'BringToFrontCmd.Caption=На передний план' + #13#10 +
      'SendToBackCmd.Caption=На задний план' + #13#10 +
      'NewItemCmd.Caption=Новый...' + #13#10 +
      'NewReportCmd.Caption=Новый отчет' + #13#10 +
      'NewPageCmd.Caption=Новая страница' + #13#10 +
      'NewDialogCmd.Caption=Новая форма' + #13#10 +
      'OpenCmd.Caption=Открыть...' + #13#10 +
      'SaveCmd.Caption=Сохранить' + #13#10 +
      'SaveAsCmd.Caption=Сохранить как...' + #13#10 +
      'VariablesCmd.Caption=Переменные...' + #13#10 +
      'PageSettingsCmd.Caption=Настройки страницы...' + #13#10 +
      'PreviewCmd.Caption=Просмотр' + #13#10 +
      'ExitCmd.Caption=Выход' + #13#10 +
      'ReportTitleMI.Caption=Заголовок отчета' + #13#10 +
      'ReportSummaryMI.Caption=Подвал отчета' + #13#10 +
      'PageHeaderMI.Caption=Заголовок страницы' + #13#10 +
      'PageFooterMI.Caption=Подвал страницы' + #13#10 +
      'HeaderMI.Caption=Заголовок данных' + #13#10 +
      'FooterMI.Caption=Подвал данных' + #13#10 +
      'MasterDataMI.Caption=Данные 1 уровня' + #13#10 +
      'DetailDataMI.Caption=Данные 2 уровня' + #13#10 +
      'SubdetailDataMI.Caption=Данные 3 уровня' + #13#10 +
      'Data4levelMI.Caption=Данные 4 уровня' + #13#10 +
      'Data5levelMI.Caption=Данные 5 уровня' + #13#10 +
      'Data6levelMI.Caption=Данные 6 уровня' + #13#10 +
      'GroupHeaderMI.Caption=Заголовок группы' + #13#10 +
      'GroupFooterMI.Caption=Подвал группы' + #13#10 +
      'ChildMI.Caption=Дочерний бэнд' + #13#10 +
      'ColumnHeaderMI.Caption=Заголовок колонки' + #13#10 +
      'ColumnFooterMI.Caption=Подвал колонки' + #13#10 +
      'OverlayMI.Caption=Фоновый бэнд' + #13#10 +
      'VerticalbandsMI.Caption=Вертикальные бэнды' + #13#10 +
      'HeaderMI1.Caption=Заголовок данных' + #13#10 +
      'FooterMI1.Caption=Подвал данных' + #13#10 +
      'MasterDataMI1.Caption=Данные 1 уровня' + #13#10 +
      'DetailDataMI1.Caption=Данные 2 уровня' + #13#10 +
      'SubdetailDataMI1.Caption=Данные 3 уровня' + #13#10 +
      'GroupHeaderMI1.Caption=Заголовок группы' + #13#10 +
      'GroupFooterMI1.Caption=Подвал группы' + #13#10 +
      'ChildMI1.Caption=Дочерний бэнд' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Параметры шрифта' + #13#10 +
      'BoldMI.Caption=Утолщенный' + #13#10 +
      'ItalicMI.Caption=Наклонный' + #13#10 +
      'UnderlineMI.Caption=Подчеркнутый' + #13#10 +
      'SuperScriptMI.Caption=Верхний индекс' + #13#10 +
      'SubScriptMI.Caption=Нижний индекс' + #13#10 +
      'CondensedMI.Caption=Сжатый' + #13#10 +
      'WideMI.Caption=Широкий' + #13#10 +
      'N12cpiMI.Caption=12 символов/дюйм' + #13#10 +
      'N15cpiMI.Caption=15 символов/дюйм' + #13#10 +
      'OpenDialog.Filter=Отчет (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Файлы Pascal (*.pas)|*.pas|Файлы C++ (*.cpp)|*.cpp|Файлы JavaScript (*.js)|*.js|Файлы Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Файлы Pascal (*.pas)|*.pas|Файлы C++ (*.cpp)|*.cpp|Файлы JavaScript (*.js)|*.js|Файлы Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      'GroupB.Hint=Группировать' + #13#10 +
      'UngroupB.Hint=Разгруппировать' + #13#10 +
      'GroupCmd.Caption=Группировать' + #13#10 +
      'UngroupCmd.Caption=Разгруппировать' + #13#10 +
      '');
    Add('dsCm', 'Сантиметры');
    Add('dsInch', 'Дюймы');
    Add('dsPix', 'Точки');
    Add('dsChars', 'Символы');
    Add('dsCode', 'Код');
    Add('dsPage', 'Стр.');
    Add('dsRepFilter', 'Отчет (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Сжатый отчет (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Сохранить изменения?');
    Add('dsSaveChangesTo', 'Сохранить изменения в ');
    Add('dsCantLoad', 'Не удалось открыть файл');
    Add('dsStyleFile', 'Стиль');
    Add('dsCantFindProc', 'Не удалось найти главную процедуру');
    Add('dsClearScript', 'Это очистит весь код. Продолжить?');
    Add('dsNoStyle', 'Нет стиля');
    Add('dsStyleSample', 'Пример стиля');
    Add('dsTextNotFound', 'Текст ''%s'' не найден');
    Add('dsReplace', 'Заменить ''%s''?');

    Add('TfrxAboutForm',
      'Caption=О FastReport' + #13#10 +
      'Label4.Caption=Посетите нашу страницу:' + #13#10 +
      'Label6.Caption=Продажи:' + #13#10 +
      'Label8.Caption=Поддержка:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Настройки страницы' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'TabSheet1.Caption=Страница' + #13#10 +
      'Label1.Caption=Ширина' + #13#10 +
      'Label2.Caption=Высота' + #13#10 +
      'Label11.Caption=Формат   ' + #13#10 +
      'Label12.Caption=Ориентация   ' + #13#10 +
      'Label3.Caption=Левое' + #13#10 +
      'Label4.Caption=Верхнее' + #13#10 +
      'Label5.Caption=Правое' + #13#10 +
      'Label6.Caption=Нижнее' + #13#10 +
      'Label13.Caption=Поля   ' + #13#10 +
      'Label14.Caption=Источник бумаги   ' + #13#10 +
      'Label9.Caption=Для первой страницы' + #13#10 +
      'Label10.Caption=Для остальных' + #13#10 +
      'PortraitRB.Caption=Портретная' + #13#10 +
      'LandscapeRB.Caption=Альбомная' + #13#10 +
      'TabSheet3.Caption=Прочее' + #13#10 +
      'Label7.Caption=Колонки   ' + #13#10 +
      'Label8.Caption=Количество' + #13#10 +
      'Label15.Caption=Ширина' + #13#10 +
      'Label16.Caption=Позиции' + #13#10 +
      'Label17.Caption=Прочее   ' + #13#10 +
      'Label18.Caption=Дуплекс' + #13#10 +
      'PrintOnPrevCB.Caption=Печатать на пред.странице' + #13#10 +
      'MirrorMarginsCB.Caption=Зеркальные поля' + #13#10 +
      'LargeHeightCB.Caption=Большая высота в дизайнере' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Данные отчета' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Список переменных' + #13#10 +
      'NewCategoryB.Caption=Категория' + #13#10 +
      'NewVarB.Caption=Переменная' + #13#10 +
      'EditB.Caption=Изменить' + #13#10 +
      'DeleteB.Caption=Удалить' + #13#10 +
      'EditListB.Caption=Список' + #13#10 +
      'LoadB.Caption=Открыть' + #13#10 +
      'SaveB.Caption=Сохранить' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'ExprPanel.Caption= Выражение:' + #13#10 +
      'OpenDialog1.Filter=Список переменных (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Список переменных (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(нет переменных)');
    Add('vaVar', 'Переменные');
    Add('vaDupName', 'Переменная с таким именем уже существует');

    Add('TfrxOptionsEditor',
      'Caption=Настройки дизайнера' + #13#10 +
      'Label1.Caption=Сетка   ' + #13#10 +
      'Label2.Caption=Тип' + #13#10 +
      'Label3.Caption=Размер' + #13#10 +
      'Label4.Caption=Диалоговая форма:' + #13#10 +
      'Label5.Caption=Прочее   ' + #13#10 +
      'Label6.Caption=Шрифты   ' + #13#10 +
      'Label7.Caption=Редактор кода' + #13#10 +
      'Label8.Caption=Редактор текста' + #13#10 +
      'Label9.Caption=Размер' + #13#10 +
      'Label10.Caption=Размер' + #13#10 +
      'Label11.Caption=Цвета   ' + #13#10 +
      'Label12.Caption=Промежуток между бэндами:' + #13#10 +
      'Label13.Caption=см' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'CMRB.Caption=Сантиметры:' + #13#10 +
      'InchesRB.Caption=Дюймы:' + #13#10 +
      'PixelsRB.Caption=Точки:' + #13#10 +
      'ShowGridCB.Caption=Показывать сетку' + #13#10 +
      'AlignGridCB.Caption=Выравнивать по сетке' + #13#10 +
      'EditAfterInsCB.Caption=Вызывать редактор после вставки' + #13#10 +
      'ObjectFontCB.Caption=Использовать шрифт объекта' + #13#10 +
      'WorkspaceB.Caption=Рабочее поле' + #13#10 +
      'ToolB.Caption=Окна' + #13#10 +
      'LCDCB.Caption=Цвет сетки для LCD-монитора' + #13#10 +
      'FreeBandsCB.Caption=Свободное размещение бэндов' + #13#10 +
      'DropFieldsCB.Caption=Показывать выпадающий список полей' + #13#10 +
      'StartupCB.Caption=Показывать окно приветствия' + #13#10 +
      'RestoreDefaultsB.Caption=Восстановить настройки' + #13#10 +
      'BandsCaptionsCB.Caption=Показывать заголовки бэндов' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Источник данных' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');
    Add('dbNotAssigned', '[не назначен]');
    Add('dbSingleLine', 'Одна строка');

    Add('TfrxGroupEditorForm',
      'Caption=Группа' + #13#10 +
      'BreakOnL.Caption=Условие   ' + #13#10 +
      'OptionsL.Caption=Свойства   ' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'DataFieldRB.Caption=Поле БД' + #13#10 +
      'ExpressionRB.Caption=Выражение' + #13#10 +
      'KeepGroupTogetherCB.Caption=Выводить группу на одной странице' + #13#10 +
      'StartNewPageCB.Caption=Формировать новую страницу' + #13#10 +
      'OutlineCB.Caption=Показывать в дереве отчета' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Служебный текст' + #13#10 +
      'DataBandL.Caption=Дата-бэнд' + #13#10 +
      'DataSetL.Caption=Набор данных' + #13#10 +
      'DataFieldL.Caption=Поле БД' + #13#10 +
      'FunctionL.Caption=Функция' + #13#10 +
      'ExpressionL.Caption=Выражение' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'AggregateRB.Caption=Агрегатная функция' + #13#10 +
      'SysVariableRB.Caption=Системная переменная' + #13#10 +
      'CountInvisibleCB.Caption=Учитывать невидимые бэнды' + #13#10 +
      'TextRB.Caption=Текст' + #13#10 +
      'RunningTotalCB.Caption=Нарастающим итогом' + #13#10 +
      '');
    Add('agAggregate', 'Вставить агрегатную функцию');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] из [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE объект' + #13#10 +
      'InsertB.Caption=Вставить...' + #13#10 +
      'EditB.Caption=Редактор...' + #13#10 +
      'CloseB.Caption=Закрыть' + #13#10 +
      '');
    Add('olStretched', 'Растягиваемый');

    Add('TfrxBarcodeEditorForm',
      'Caption=Штрихкод' + #13#10 +
      'CodeLbl.Caption=Код' + #13#10 +
      'TypeLbl.Caption=Тип штрихкода' + #13#10 +
      'ZoomLbl.Caption=Масштаб:' + #13#10 +
      'OptionsLbl.Caption=Свойства   ' + #13#10 +
      'RotationLbl.Caption=Ориентация   ' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CalcCheckSumCB.Caption=Контрольная сумма' + #13#10 +
      'ViewTextCB.Caption=Показывать текст' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Контрольная сумма');
    Add('bcShowText', 'Показывать текст');

    Add('TfrxAliasesEditorForm',
      'Caption=Псевдонимы' + #13#10 +
      'HintL.Caption=Нажмите Enter для редактирования' + #13#10 +
      'DSAliasL.Caption=Псевдоним набора данных' + #13#10 +
      'FieldAliasesL.Caption=Псевдонимы полей' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'ResetB.Caption=Сброс' + #13#10 +
      'UpdateB.Caption=Обновить' + #13#10 +
      '');
    Add('alUserName', 'Псевдоним');
    Add('alOriginal', 'Оригинальное имя');

    Add('TfrxParamsEditorForm',
      'Caption=Параметры' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');
    Add('qpName', 'Имя');
    Add('qpDataType', 'Тип');
    Add('qpValue', 'Значение');

    Add('TfrxMDEditorForm',
      'Caption=Редактор Master-Detail' + #13#10 +
      'Label1.Caption=Поля Detail' + #13#10 +
      'Label2.Caption=Поля Master' + #13#10 +
      'Label3.Caption=Связанные поля' + #13#10 +
      'AddB.Caption=Добавить' + #13#10 +
      'ClearB.Caption=Очистить' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Редактор текста' + #13#10 +
      'ExprB.Hint=Вставить выражение' + #13#10 +
      'AggregateB.Hint=Вставить агрегатную функцию' + #13#10 +
      'LocalFormatB.Hint=Вставить формат' + #13#10 +
      'WordWrapB.Hint=Переносить слова' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Картинка' + #13#10 +
      'LoadB.Hint=Загрузить' + #13#10 +
      'CopyB.Hint=Копировать' + #13#10 +
      'PasteB.Hint=Вставить' + #13#10 +
      'ClearB.Hint=Очистить' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');
    Add('piEmpty', 'Пусто');

    Add('TfrxChartEditorForm',
      'Caption=Диаграмма' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'AddB.Hint=Добавить серию' + #13#10 +
      'DeleteB.Hint=Удалить серию' + #13#10 +
      'DBSourceRB.Caption=Данные из БД' + #13#10 +
      'BandSourceRB.Caption=Данные из бэнда' + #13#10 +
      'FixedDataRB.Caption=Фиксированные данные' + #13#10 +
      'DatasetLbl.Caption=Набор данных' + #13#10 +
      'BandLbl.Caption=Дата-бэнд' + #13#10 +
      'X1Lbl.Caption=Значения X' + #13#10 +
      'Y1Lbl.Caption=Значения Y' + #13#10 +
      'X2Lbl.Caption=Значения X' + #13#10 +
      'Y2Lbl.Caption=Значения Y' + #13#10 +
      'X3Lbl.Caption=Значения X (например, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Значения Y (например, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Свойства   ' + #13#10 +
      'ShowTopLbl.Caption=Показывать TopN значений' + #13#10 +
      'CaptionLbl.Caption=Заголовок TopN' + #13#10 +
      'SortLbl.Caption=Сортировка' + #13#10 +
      'LineMI.Caption=Линии' + #13#10 +
      'AreaMI.Caption=Область' + #13#10 +
      'PointMI.Caption=Точки' + #13#10 +
      'BarMI.Caption=Прямоугольники' + #13#10 +
      'HorizBarMI.Caption=Гориз.прямоугольники' + #13#10 +
      'PieMI.Caption=Диаграмма' + #13#10 +
      'GanttMI.Caption=Gantt' + #13#10 +
      'FastLineMI.Caption=Быстрые линии' + #13#10 +
      '');
    Add('ch3D', 'Трехмерная');
    Add('chAxis', 'Показывать оси');
    Add('chsoNone', 'Нет');
    Add('chsoAscending', 'По возрастанию');
    Add('chsoDescending', 'По убыванию');

    Add('TfrxRichEditorForm',
      'Caption=RichEdit' + #13#10 +
      'OpenB.Hint=Открыть' + #13#10 +
      'SaveB.Hint=Сохранить' + #13#10 +
      'UndoB.Hint=Отменить' + #13#10 +
      'TTB.Hint=Шрифт' + #13#10 +
      'ExprB.Hint=Вставить выражение' + #13#10 +
      'CancelB.Hint=Отменить' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      'BoldB.Hint=Утолщение' + #13#10 +
      'ItalicB.Hint=Курсив' + #13#10 +
      'UnderlineB.Hint=Подчеркивание' + #13#10 +
      'LeftAlignB.Hint=Выровнять текст влево' + #13#10 +
      'CenterAlignB.Hint=Выровнять текст по центру' + #13#10 +
      'RightAlignB.Hint=Выровнять текст вправо' + #13#10 +
      'BlockAlignB.Hint=Выровнять текст по ширине' + #13#10 +
      'BulletsB.Hint=Список' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Редактор Cross-tab' + #13#10 +
      'DatasetL.Caption=Данные   ' + #13#10 +
      'DimensionsL.Caption=Размерность   ' + #13#10 +
      'RowsL.Caption=Строки' + #13#10 +
      'ColumnsL.Caption=Колонки' + #13#10 +
      'CellsL.Caption=Ячейки' + #13#10 +
      'StructureL.Caption=Структура таблицы   ' + #13#10 +
      'RowHeaderCB.Caption=Заголовок строки' + #13#10 +
      'ColumnHeaderCB.Caption=Заголовок колонки' + #13#10 +
      'RowTotalCB.Caption=Итог строки' + #13#10 +
      'ColumnTotalCB.Caption=Итог колонки' + #13#10 +
      'SwapB.Hint=Поменять строки/колонки' + #13#10 +
      'StyleCB.Hint=Стиль' + #13#10 +
      'FontB.Hint=Шрифт' + #13#10 +
      'AlignLeftB.Hint=Выровнять влево' + #13#10 +
      'AlignCenterB.Hint=Выровнять по центру' + #13#10 +
      'AlignRightB.Hint=Выровнять вправо' + #13#10 +
      'RotationB.Hint=Поворот текста' + #13#10 +
      'HighlightB.Hint=Условное выделение' + #13#10 +
      'FormatB.Hint=Формат' + #13#10 +
      'FrameB.Hint=Рамка' + #13#10 +
      'FillColorB.Hint=Цвет фона' + #13#10 +
      'Func1MI.Caption=Нет' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=По возрастанию (A-Z)' + #13#10 +
      'Sort2MI.Caption=По убыванию (Z-A)' + #13#10 +
      'Sort3MI.Caption=Не сортировать' + #13#10 +
      'BoldMI.Caption=Утолщенный' + #13#10 +
      'ItalicMI.Caption=Курсив' + #13#10 +
      'UnderlineMI.Caption=Подчеркнутый' + #13#10 +
      'SuperScriptMI.Caption=Надстрочный' + #13#10 +
      'SubScriptMI.Caption=Подстрочный' + #13#10 +
      'CondensedMI.Caption=Сжатый' + #13#10 +
      'WideMI.Caption=Широкий' + #13#10 +
      'N12cpiMI.Caption=12 символов/дюйм' + #13#10 +
      'N15cpiMI.Caption=15 символов/дюйм' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');
    Add('crSubtotal', 'Подитоги');
    Add('crNone', 'нет');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'А-Я');
    Add('crDesc', 'Я-А');
    Add('crBorder', 'Рамка вокруг');
    Add('crDown', 'Вниз, потом вбок');
    Add('crRepHdrs', 'Повторять заголовки');

    Add('TfrxExprEditorForm',
      'Caption=Редактор выражений' + #13#10 +
      'ExprL.Caption=Выражение:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Форматирование' + #13#10 +
      'CategoryL.Caption=Категория' + #13#10 +
      'FormatL.Caption=Формат' + #13#10 +
      'FormatStrL.Caption=Строка форматирования:' + #13#10 +
      'SeparatorL.Caption=Разделитель дроби:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');
    Add('fkText', 'Текст');
    Add('fkNumber', 'Число');
    Add('fkDateTime', 'Дата/время');
    Add('fkBoolean', 'Логическое');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '1,234.50р;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 Ноя 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 Ноябрь 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14, 28 Ноября 2002;hh:mm dd mmmm yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Нет,Да;Нет,Да');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Условное выделение' + #13#10 +
      'FontColorB.Caption=Цвет...' + #13#10 +
      'BackColorB.Caption=Цвет...' + #13#10 +
      'ConditionL.Caption=Условие   ' + #13#10 +
      'FontL.Caption=Шрифт   ' + #13#10 +
      'BackgroundL.Caption=Фон   ' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'BoldCB.Caption=Утолщенный' + #13#10 +
      'ItalicCB.Caption=Курсив' + #13#10 +
      'UnderlineCB.Caption=Подчеркнутый' + #13#10 +
      'TransparentRB.Caption=Прозрачный' + #13#10 +
      'OtherRB.Caption=Прочее' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Настройки отчета' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'GeneralTS.Caption=Основные' + #13#10 +
      'ReportSettingsL.Caption=Настройки печати   ' + #13#10 +
      'CopiesL.Caption=Копии' + #13#10 +
      'GeneralL.Caption=Свойства   ' + #13#10 +
      'PasswordL.Caption=Пароль' + #13#10 +
      'CollateCB.Caption=Разобрать по копиям' + #13#10 +
      'DoublePassCB.Caption=Два прохода' + #13#10 +
      'PrintIfEmptyCB.Caption=Печатать, если пустой' + #13#10 +
      'DescriptionTS.Caption=Описание' + #13#10 +
      'NameL.Caption=Имя' + #13#10 +
      'Description1L.Caption=Описание' + #13#10 +
      'PictureL.Caption=Картинка' + #13#10 +
      'AuthorL.Caption=Автор' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Создан' + #13#10 +
      'ModifiedL.Caption=Изменен' + #13#10 +
      'DescriptionL.Caption=Описание   ' + #13#10 +
      'VersionL.Caption=Версия   ' + #13#10 +
      'PictureB.Caption=Просмотр...' + #13#10 +
      '');
    Add('rePrnOnPort', 'на');

    Add('TfrxStringsEditorForm',
      'Caption=Редактор строк' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=Редактор SQL' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Пароль' + #13#10 +
      'PasswordL.Caption=Введите пароль:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Стили' + #13#10 +
      'ColorB.Caption=Цвет...' + #13#10 +
      'FontB.Caption=Шрифт...' + #13#10 +
      'FrameB.Caption=Рамка...' + #13#10 +
      'AddB.Hint=Добавить' + #13#10 +
      'DeleteB.Hint=Удалить' + #13#10 +
      'EditB.Hint=Правка' + #13#10 +
      'LoadB.Hint=Загрузить' + #13#10 +
      'SaveB.Hint=Сохранить' + #13#10 +
      'CancelB.Hint=Отмена' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Редактор рамки' + #13#10 +
      'FrameL.Caption=Рамка' + #13#10 +
      'LineL.Caption=Линия' + #13#10 +
      'ShadowL.Caption=Тень' + #13#10 +
      'FrameTopB.Hint=Верхняя линия' + #13#10 +
      'FrameBottomB.Hint=Нижняя линия' + #13#10 +
      'FrameLeftB.Hint=Левая линия' + #13#10 +
      'FrameRightB.Hint=Правая линия' + #13#10 +
      'FrameAllB.Hint=Все линии' + #13#10 +
      'FrameNoB.Hint=Выключить линии' + #13#10 +
      'FrameColorB.Hint=Цвет рамки' + #13#10 +
      'FrameStyleB.Hint=Стиль рамки' + #13#10 +
      'FrameWidthCB.Hint=Толщина линии' + #13#10 +
      'ShadowB.Hint=Тень' + #13#10 +
      'ShadowColorB.Hint=Цвет тени' + #13#10 +
      'ShadowWidthCB.Hint=Размер тени' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Создать новый...' + #13#10 +
      'ItemsTab.Caption=Список' + #13#10 +
      'TemplatesTab.Caption=Шаблоны' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Редактор TabOrder' + #13#10 +
      'Label1.Caption=Элементы управления:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'UpB.Caption=Вверх' + #13#10 +
      'DownB.Caption=Вниз' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Вычислить' + #13#10 +
      'Label1.Caption=Выражение' + #13#10 +
      'Label2.Caption=Результат' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Мастер отчетов' + #13#10 +
      'DataTab.Caption=Данные' + #13#10 +
      'GroupsTab.Caption=Группы' + #13#10 +
      'LayoutTab.Caption=Размещение' + #13#10 +
      'StyleTab.Caption=Стиль' + #13#10 +
      'Step1L.Caption=Шаг 1. Выберите данные для отображения в отчете.' + #13#10 +
      'Step2L.Caption=Шаг 2. Создайте группы (не обязательно).' + #13#10 +
      'Step3L.Caption=Шаг 3. Выберите ориентацию листа и размещение данных.' + #13#10 +
      'Step4L.Caption=Шаг 4. Выберите стиль отчета.' + #13#10 +
      'AddFieldB.Caption=Добавить >' + #13#10 +
      'AddAllFieldsB.Caption=Добавить все >>' + #13#10 +
      'RemoveFieldB.Caption=< Удалить' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Удалить все' + #13#10 +
      'AddGroupB.Caption=Добавить >' + #13#10 +
      'RemoveGroupB.Caption=< Удалить' + #13#10 +
      'SelectedFieldsL.Caption=Выбранные поля:' + #13#10 +
      'AvailableFieldsL.Caption=Доступные поля:' + #13#10 +
      'GroupsL.Caption=Группы:' + #13#10 +
      'OrientationL.Caption=Ориентация   ' + #13#10 +
      'LayoutL.Caption=Размещение   ' + #13#10 +
      'PortraitRB.Caption=Портретная' + #13#10 +
      'LandscapeRB.Caption=Альбомная' + #13#10 +
      'TabularRB.Caption=В виде таблицы' + #13#10 +
      'ColumnarRB.Caption=В виде колонок' + #13#10 +
      'FitWidthCB.Caption=Уместить все поля по ширине' + #13#10 +
      'CancelB.Caption=Отмена' + #13#10 +
      'BackB.Caption=<< Назад' + #13#10 +
      'NextB.Caption=Далее >>' + #13#10 +
      'FinishB.Caption=Готово' + #13#10 +
      '');
    Add('wzStd', 'Мастер стандартного отчета');
    Add('wzDMP', 'Мастер матричного отчета');
    Add('wzStdEmpty', 'Пустой стандартный отчет');
    Add('wzDMPEmpty', 'Пустой матричный отчет');


    Add('ftAllFiles', 'Все файлы');
    Add('ftPictures', 'Картинки');
    Add('ftDB', 'Базы данных');
    Add('ftRichFile', 'Файл RichText');
    Add('ftTextFile', 'Текстовый файл');

    Add('prNotAssigned', '(Не определен)');
    Add('prInvProp', 'Неверное значение свойства');
    Add('prDupl', 'Повторяющееся имя');
    Add('prPict', '(Картинка)');

    Add('mvExpr', 'Выражения в тексте');
    Add('mvStretch', 'Растягиваемый');
    Add('mvStretchToMax', 'Растягивание до макс.высоты');
    Add('mvShift', 'Смещаемый');
    Add('mvShiftOver', 'Смещаемый при перекрытии');
    Add('mvVisible', 'Видимый');
    Add('mvPrintable', 'Печатаемый');
    Add('mvFont', 'Шрифт...');
    Add('mvFormat', 'Форматирование...');
    Add('mvClear', 'Очистить текст');
    Add('mvAutoWidth', 'Автоширина');
    Add('mvWWrap', 'Переносить слова');
    Add('mvSuppress', 'Скрывать повторяющиеся');
    Add('mvHideZ', 'Скрывать нули');
    Add('mvHTML', 'HTML-тэги в тексте');
    Add('lvDiagonal', 'Диагональная');
    Add('pvAutoSize', 'Авторазмер');
    Add('pvCenter', 'Центрировать');
    Add('pvAspect', 'Сохранять пропорции');
    Add('bvSplit', 'Разрешить разрыв');
    Add('bvKeepChild', 'Держать Child вместе');
    Add('bvPrintChild', 'Печатать Child если невидимый');
    Add('bvStartPage', 'Формировать новую страницу');
    Add('bvPrintIfEmpty', 'Печатать, если Detail пуст');
    Add('bvKeepDetail', 'Держать Detail вместе');
    Add('bvKeepFooter', 'Держать подвал вместе');
    Add('bvReprint', 'Выводить на новой странице');
    Add('bvOnFirst', 'Печатать на первой странице');
    Add('bvOnLast', 'Печатать на последней странице');
    Add('bvKeepGroup', 'Держать вместе');
    Add('bvFooterAfterEach', 'Footer после каждой записи');
    Add('srParent', 'Печатать на бэнде');
    Add('bvKeepHeader', 'Держать заголовок вместе');

    Add('obCatDraw', 'Рисование');
    Add('obCatOther', 'Другие объекты');
    Add('obCatOtherControls', 'Другие элементы');
    Add('obDiagLine', 'Диагональная линия');
    Add('obRect', 'Прямоугольник');
    Add('obRoundRect', 'Скругленный прямоугольник');
    Add('obEllipse', 'Эллипс');
    Add('obTrian', 'Треугольник');
    Add('obDiamond', 'Ромб');
    Add('obLabel', 'Элемент управления Label');
    Add('obEdit', 'Элемент управления Edit');
    Add('obMemoC', 'Элемент управления Memo');
    Add('obButton', 'Элемент управления Button');
    Add('obChBoxC', 'Элемент управления CheckBox');
    Add('obRButton', 'Элемент управления RadioButton');
    Add('obLBox', 'Элемент управления ListBox');
    Add('obCBox', 'Элемент управления ComboBox');
    Add('obDateEdit', 'Элемент управления DateEdit');
    Add('obImageC', 'Элемент управления Image');
    Add('obPanel', 'Элемент управления Panel');
    Add('obGrBox', 'Элемент управления GroupBox');
    Add('obBBtn', 'Элемент управления BitBtn');
    Add('obSBtn', 'Элемент управления SpeedButton');
    Add('obMEdit', 'Элемент управления MaskEdit');
    Add('obChLB', 'Элемент управления CheckListBox');
    Add('obDBLookup', 'Элемент управления DBLookupComboBox');
    Add('obBevel', 'Элемент управления Bevel');
    Add('obShape', 'Элемент управления Shape');
    Add('obText', 'Объект "Текст"');
    Add('obSysText', 'Объект "Служебный текст"');
    Add('obLine', 'Объект "Линия"');
    Add('obPicture', 'Объект "Рисунок"');
    Add('obBand', 'Объект "Бэнд"');
    Add('obDataBand', 'Объект "Дата-бэнд"');
    Add('obSubRep', 'Объект "Вложенный отчет"');
    Add('obDlgPage', 'Диалоговая форма');
    Add('obRepPage', 'Страница отчета');
    Add('obReport', 'Объект "Отчет"');
    Add('obRich', 'Объект "RichText"');
    Add('obOLE', 'Объект "OLE"');
    Add('obChBox', 'Объект "CheckBox"');
    Add('obChart', 'Объект "Диаграмма"');
    Add('obBarC', 'Объект "Штрихкод"');
    Add('obCross', 'Объект "Cross-tab"');
    Add('obDBCross', 'Объект "DB Cross-tab"');
    Add('obGrad', 'Объект "Градиент"');
    Add('obDMPText', 'Объект "Матричный текст"');
    Add('obDMPLine', 'Объект "Матричная линия"');
    Add('obBDEDB', 'База данных BDE');
    Add('obBDETb', 'Таблица BDE');
    Add('obBDEQ', 'Запрос BDE');
    Add('obBDEComps', 'Компоненты BDE');
    Add('obIBXDB', 'База данных IBX');
    Add('obIBXTb', 'Таблица IBX');
    Add('obIBXQ', 'Запрос IBX');
    Add('obIBXComps', 'Компоненты IBX');
    Add('obADODB', 'База данных ADO');
    Add('obADOTb', 'Таблица ADO');
    Add('obADOQ', 'Запрос ADO');
    Add('obADOComps', 'Компоненты ADO');
    Add('obDBXDB', 'База данных DBX');
    Add('obDBXTb', 'Таблица DBX');
    Add('obDBXQ', 'Запрос DBX');
    Add('obDBXComps', 'Компоненты DBX');

    Add('ctString', 'Строки');
    Add('ctDate', 'Дата и время');
    Add('ctConv', 'Конвертирование');
    Add('ctFormat', 'Форматирование');
    Add('ctMath', 'Математические');
    Add('ctOther', 'Прочие');

    Add('IntToStr', 'Конвертирует целое число в строку');
    Add('FloatToStr', 'Конвертирует вещественное число в строку');
    Add('DateToStr', 'Конвертирует дату в строку');
    Add('TimeToStr', 'Конвертирует время в строку');
    Add('DateTimeToStr', 'Конвертирует дату и время в строку');
    Add('VarToStr', 'Конвертирует вариант в строку');
    Add('StrToInt', 'Конвертирует строку в целое число');
    Add('StrToFloat', 'Конвертирует строку в вещественное число');
    Add('StrToDate', 'Конвертирует строку в дату');
    Add('StrToTime', 'Конвертирует строку во время');
    Add('StrToDateTime', 'Конвертирует строку в дату и время');
    Add('Format', 'Возвращает форматированную строку');
    Add('FormatFloat', 'Форматирует вещественное число');
    Add('FormatDateTime', 'Форматирует дату и время');
    Add('FormatMaskText', 'Форматирует текст, используя заданную маску');
    Add('EncodeDate', 'Возвращает значение TDateTime, соответствующее заданным значениям Year, Month, Day');
    Add('DecodeDate', 'Разбивает значение TDateTime на значения Year, Month, Day');
    Add('EncodeTime', 'Возвращает значение TDateTime, соответствующее заданным значениям Hour, Min, Sec, MSec');
    Add('DecodeTime', 'Разбивает значение TDateTime на значения Hour, Min, Sec, MSec');
    Add('Date', 'Возвращает текущую дату');
    Add('Time', 'Возвращает текущее время');
    Add('Now', 'Возвращает текущую дату и время');
    Add('DayOfWeek', 'Возвращает номер дня недели, соответствующий заданной дате');
    Add('IsLeapYear', 'Возвращает True, если заданный год - високосный');
    Add('DaysInMonth', 'Возвращает число дней в заданном месяце');
    Add('Length', 'Возвращает длину строки');
    Add('Copy', 'Возвращает подстроку');
    Add('Pos', 'Возвращает позицию подстроки в строке');
    Add('Delete', 'Удаляет часть символов строки');
    Add('Insert', 'Вставляет подстроку в строку');
    Add('Uppercase', 'Конвертирует все символы строки в верхний регистр');
    Add('Lowercase', 'Конвертирует все символы строки в нижний регистр');
    Add('Trim', 'Удаляет пробелы в начале и конце строки');
    Add('NameCase', 'Конвертирует первый символ слова в верхний регистр');
    Add('CompareText', 'Сравнивает две строки без учета регистра');
    Add('Chr', 'Конвертирует целое число в символ');
    Add('Ord', 'Конвертирует символ в целое число');
    Add('SetLength', 'Устанавливает длину строки');
    Add('Round', 'Округляет число до ближайшего целого значения');
    Add('Trunc', 'Отбрасывает дробную часть числа');
    Add('Int', 'Возвращает целую часть вещественного значения');
    Add('Frac', 'Возвращает дробную часть вещественного значения');
    Add('Sqrt', 'Возвращает корень квадратный из числа');
    Add('Abs', 'Возвращает модуль числа');
    Add('Sin', 'Возвращает синус угла (в радианах)');
    Add('Cos', 'Возвращает косинус угла (в радианах)');
    Add('ArcTan', 'Возвращает арктангенс');
    Add('Tan', 'Возвращает тангенс');
    Add('Exp', 'Возвращает экспоненту');
    Add('Ln', 'Возращает натуральный логарифм заданного числа');
    Add('Pi', 'Возвращает число "пи"');
    Add('Inc', 'Увеличивает целое число на 1');
    Add('Dec', 'Уменьшает целое число на 1');
    Add('RaiseException', 'Вызывает исключение');
    Add('ShowMessage', 'Показывает окно сообщения');
    Add('Randomize', 'Запускает генератор случайных чисел');
    Add('Random', 'Возвращает случайное число');
    Add('ValidInt', 'Возвращает True если заданная строка может быть преобразована в целое число');
    Add('ValidFloat', 'Возвращает True если заданная строка может быть преобразована в вещественное число');
    Add('ValidDate', 'Возвращает True если заданная строка может быть преобразована в дату');
    Add('IIF', 'Возвращает TrueValue если заданное выражение равно True, иначе возвращает FalseValue');
    Add('Get', 'Возвращает значение переменной из списка переменных');
    Add('Set', 'Устанавливает значение переменной из списка переменных');
    Add('InputBox', 'Показывает диалог ввода строки');
    Add('InputQuery', 'Показывает диалог ввода строки');
    Add('MessageDlg', 'Показывает окно сообщения');
    Add('CreateOleObject', 'Создает OLE объект');
    Add('VarArrayCreate', 'Создает массив вариантов');
    Add('VarType', 'Возвращает тип варианта');
    Add('DayOf', 'Возвращает день (1..31) даты Date');
    Add('MonthOf', 'Возвращает месяц (1..12) даты Date');
    Add('YearOf', 'Возвращает год даты Date');

    Add('ctAggregate', 'Агрегатные');
    Add('Sum', 'Возвращает сумму выражения Expr для бэнда Band');
    Add('Avg', 'Возвращает среднее значение выражения Expr для бэнда Band');
    Add('Min', 'Возвращает минимальное значение выражения Expr для бэнда Band');
    Add('Max', 'Возвращает максимальное значение выражения Expr для бэнда Band');
    Add('Count', 'Возвращает количество строк в бэнде Band');
  end;
end;


initialization
  frAddDesignerRes;

end.