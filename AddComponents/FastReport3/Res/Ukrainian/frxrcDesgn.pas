
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
      'Caption=Інспектор' + #13#10 +
      '');
    Add('oiProp', 'Властивості');
    Add('oiEvent', 'Події');

    Add('TfrxDataTreeForm',
      'Caption=Дерево даних' + #13#10 +
      'DataTS.Caption=Поля БД' + #13#10 +
      'VariablesTS.Caption=Змінні' + #13#10 +
      'FunctionsTS.Caption=Функції' + #13#10 +
      'InsFieldCB.Caption=Вставляти поле' + #13#10 +
      'InsCaptionCB.Caption=Вставляти заголовок' + #13#10 +
      '');
    Add('dtNoData', 'Немає даних');
    Add('dtData', 'Дані');
    Add('dtSysVar', 'Системні');
    Add('dtVar', 'Змінні');
    Add('dtFunc', 'Функції');

    Add('TfrxReportTreeForm',
      'Caption=Дерево звіту' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Відкрити скрипт' + #13#10 +
      'SaveScriptB.Hint=Зберегти скрипт' + #13#10 +
      'RunScriptB.Hint=Запустити звіт' + #13#10 +
      'StepScriptB.Hint=Налагодження' + #13#10 +
      'StopScriptB.Hint=Зупинити' + #13#10 +
      'EvaluateB.Hint=Обчислити' + #13#10 +
      'LangL.Caption=Мова:' + #13#10 +
      'AlignTB.Caption=Вирівнювання' + #13#10 +
      'AlignLeftsB.Hint=Вирівняти ліві краї' + #13#10 +
      'AlignHorzCentersB.Hint=Центрувати по горизонталі' + #13#10 +
      'AlignRightsB.Hint=Вирівняти праві краї' + #13#10 +
      'AlignTopsB.Hint=Вирівняти верхні краї' + #13#10 +
      'AlignVertCentersB.Hint=Центрувати по горизонталі' + #13#10 +
      'AlignBottomsB.Hint=Вирівняти нижні краї' + #13#10 +
      'SpaceHorzB.Hint=Розташувати рівномірно по ширині' + #13#10 +
      'SpaceVertB.Hint=Розташувати рівномірно по висоті' + #13#10 +
      'CenterHorzB.Hint=Центрувати по горизонталі на бенді' + #13#10 +
      'CenterVertB.Hint=Центрувати по вертикалі на бенді' + #13#10 +
      'SameWidthB.Hint=Та ж ширина' + #13#10 +
      'SameHeightB.Hint=Та ж висота' + #13#10 +
      'TextTB.Caption=Текст' + #13#10 +
      'StyleCB.Hint=Стиль' + #13#10 +
      'FontNameCB.Hint=Ім''я шрифту' + #13#10 +
      'FontSizeCB.Hint=Розмір шрифту' + #13#10 +
      'BoldB.Hint=Стовщення' + #13#10 +
      'ItalicB.Hint=Курсив' + #13#10 +
      'UnderlineB.Hint=Підкреслення' + #13#10 +
      'FontColorB.Hint=Кольори шрифту' + #13#10 +
      'HighlightB.Hint=Умовне виділення' + #13#10 +
      'RotateB.Hint=Поворот тексту' + #13#10 +
      'TextAlignLeftB.Hint=Вирівняти текст вліво' + #13#10 +
      'TextAlignCenterB.Hint=Центрувати текст по горизонталі' + #13#10 +
      'TextAlignRightB.Hint=Вирівняти текст вправо' + #13#10 +
      'TextAlignBlockB.Hint=Вирівняти текст по ширині' + #13#10 +
      'TextAlignTopB.Hint=Вирівняти по верхньому краю' + #13#10 +
      'TextAlignMiddleB.Hint=Центрувати текст по вертикалі' + #13#10 +
      'TextAlignBottomB.Hint=Вирівняти по нижньому краю' + #13#10 +
      'FrameTB.Caption=Рамка' + #13#10 +
      'FrameTopB.Hint=Верхня лінія' + #13#10 +
      'FrameBottomB.Hint=Нижня лінія' + #13#10 +
      'FrameLeftB.Hint=Ліва лінія' + #13#10 +
      'FrameRightB.Hint=Права лінія' + #13#10 +
      'FrameAllB.Hint=Всі лінії рамки' + #13#10 +
      'FrameNoB.Hint=Забрати рамку' + #13#10 +
      'ShadowB.Hint=Тінь' + #13#10 +
      'FillColorB.Hint=Кольори заливання' + #13#10 +
      'FrameColorB.Hint=Кольори рамки' + #13#10 +
      'FrameStyleB.Hint=Стиль рамки' + #13#10 +
      'FrameWidthCB.Hint=Товщина рамки' + #13#10 +
      'StandardTB.Caption=Стандартна' + #13#10 +
      'NewB.Hint=Новий звіт' + #13#10 +
      'OpenB.Hint=Відкрити' + #13#10 +
      'SaveB.Hint=Зберегти' + #13#10 +
      'PreviewB.Hint=Попередній перегляд' + #13#10 +
      'NewPageB.Hint=Додати сторінку у звіт' + #13#10 +
      'NewDialogB.Hint=Додати форму у звіт' + #13#10 +
      'DeletePageB.Hint=Видалити сторінку' + #13#10 +
      'PageSettingsB.Hint=Налаштування сторінки' + #13#10 +
      'VariablesB.Hint=Змінні' + #13#10 +
      'CutB.Hint=Вирізати' + #13#10 +
      'CopyB.Hint=Копіювати' + #13#10 +
      'PasteB.Hint=Вставити' + #13#10 +
      'SampleFormatB.Hint=Копіювати формат' + #13#10 +
      'UndoB.Hint=Скасувати' + #13#10 +
      'RedoB.Hint=Повторити' + #13#10 +
      'GroupB.Hint=Групувати' + #13#10 +
      'UngroupB.Hint=Розгрупувати' + #13#10 +
      'ShowGridB.Hint=Показувати сітку' + #13#10 +
      'AlignToGridB.Hint=Вирівнювання по сітці' + #13#10 +
      'SetToGridB.Hint=Розташувати об''єкти у вузлах сітки' + #13#10 +
      'ScaleCB.Hint=Масштаб' + #13#10 +
      'ExtraToolsTB.Caption=Помічники' + #13#10 +
      'ObjectSelectB.Hint=Вибір об''єктів' + #13#10 +
      'HandToolB.Hint=Рука' + #13#10 +
      'ZoomToolB.Hint=Лупа' + #13#10 +
      'TextToolB.Hint=Редактор тексту' + #13#10 +
      'FormatToolB.Hint=Копіювання зовнішнього вигляду' + #13#10 +
      'ObjectBandB.Hint=Вставити бенд' + #13#10 +
      'FileMenu.Caption=&Файл' + #13#10 +
      'EditMenu.Caption=&Виправлення' + #13#10 +
      'FindMI.Caption=Знайти...' + #13#10 +
      'FindNextMI.Caption=Знайти далі' + #13#10 +
      'ReplaceMI.Caption=Замінити...' + #13#10 +
      'ReportMenu.Caption=&Звіт' + #13#10 +
      'ReportDataMI.Caption=Дані...' + #13#10 +
      'ReportSettingsMI.Caption=Налаштування...' + #13#10 +
      'ReportStylesMI.Caption=Стилі...' + #13#10 +
      'ViewMenu.Caption=&Вид' + #13#10 +
      'ToolbarsMI.Caption=Панелі інструментів' + #13#10 +
      'StandardMI.Caption=Стандартна' + #13#10 +
      'TextMI.Caption=Текст' + #13#10 +
      'FrameMI.Caption=Рамка' + #13#10 +
      'AlignmentMI.Caption=Вирівнювання' + #13#10 +
      'ToolsMI.Caption=Помічники' + #13#10 +
      'InspectorMI.Caption=Інспектор' + #13#10 +
      'DataTreeMI.Caption=Дерево даних' + #13#10 +
      'ReportTreeMI.Caption=Дерево звіту' + #13#10 +
      'ShowRulersMI.Caption=Лінійки' + #13#10 +
      'ShowGuidesMI.Caption=Виносні лінії' + #13#10 +
      'DeleteGuidesMI.Caption=Видалити виносні лінії' + #13#10 +
      'OptionsMI.Caption=Налаштування...' + #13#10 +
      'HelpMenu.Caption=&?' + #13#10 +
      'HelpContentsMI.Caption=Help Contents...' + #13#10 +
      'AboutMI.Caption=Про FastReport...' + #13#10 +
      'TabOrderMI.Caption=Редактор TabOrder...' + #13#10 +
      'UndoCmd.Caption=Скасувати' + #13#10 +
      'RedoCmd.Caption=Повторити' + #13#10 +
      'CutCmd.Caption=Вирізати' + #13#10 +
      'CopyCmd.Caption=Копіювати' + #13#10 +
      'PasteCmd.Caption=Вставити' + #13#10 +
      'GroupCmd.Caption=Групувати' + #13#10 +
      'UngroupCmd.Caption=Розгрупувати' + #13#10 +
      'DeleteCmd.Caption=Видалити' + #13#10 +
      'DeletePageCmd.Caption=Видалити сторінку' + #13#10 +
      'SelectAllCmd.Caption=Вибрати всі' + #13#10 +
      'EditCmd.Caption=Редагувати...' + #13#10 +
      'BringToFrontCmd.Caption=На передній план' + #13#10 +
      'SendToBackCmd.Caption=На задній план' + #13#10 +
      'NewItemCmd.Caption=Новий...' + #13#10 +
      'NewReportCmd.Caption=Новий звіт' + #13#10 +
      'NewPageCmd.Caption=Нова сторінка' + #13#10 +
      'NewDialogCmd.Caption=Нова форма' + #13#10 +
      'OpenCmd.Caption=Відкрити...' + #13#10 +
      'SaveCmd.Caption=Зберегти' + #13#10 +
      'SaveAsCmd.Caption=Зберегти як...' + #13#10 +
      'VariablesCmd.Caption=Змінні...' + #13#10 +
      'PageSettingsCmd.Caption=Настроювання сторінки...' + #13#10 +
      'PreviewCmd.Caption=Перегляд' + #13#10 +
      'ExitCmd.Caption=Вихід' + #13#10 +
      'ReportTitleMI.Caption=Заголовок звіту' + #13#10 +
      'ReportSummaryMI.Caption=Підвал звіту' + #13#10 +
      'PageHeaderMI.Caption=Заголовок сторінки' + #13#10 +
      'PageFooterMI.Caption=Підвал сторінки' + #13#10 +
      'HeaderMI.Caption=Заголовок даних' + #13#10 +
      'FooterMI.Caption=Підвал даних' + #13#10 +
      'MasterDataMI.Caption=Дані 1 рівня' + #13#10 +
      'DetailDataMI.Caption=Дані 2 рівня' + #13#10 +
      'SubdetailDataMI.Caption=Дані 3 рівня' + #13#10 +
      'Data4levelMI.Caption=Дані 4 рівня' + #13#10 +
      'Data5levelMI.Caption=Дані 5 рівня' + #13#10 +
      'Data6levelMI.Caption=Дані 6 рівня' + #13#10 +
      'GroupHeaderMI.Caption=Заголовок групи' + #13#10 +
      'GroupFooterMI.Caption=Підвал групи' + #13#10 +
      'ChildMI.Caption=Дочірній бенд' + #13#10 +
      'ColumnHeaderMI.Caption=Заголовок колонки' + #13#10 +
      'ColumnFooterMI.Caption=Підвал колонки' + #13#10 +
      'OverlayMI.Caption=Фоновий бенд' + #13#10 +
      'VerticalbandsMI.Caption=Вертикальні бенди' + #13#10 +
      'HeaderMI1.Caption=Заголовок даних' + #13#10 +
      'FooterMI1.Caption=Підвал даних' + #13#10 +
      'MasterDataMI1.Caption=Дані 1 рівня' + #13#10 +
      'DetailDataMI1.Caption=Дані 2 рівня' + #13#10 +
      'SubdetailDataMI1.Caption=Дані 3 рівня' + #13#10 +
      'GroupHeaderMI1.Caption=Заголовок групи' + #13#10 +
      'GroupFooterMI1.Caption=Підвал групи' + #13#10 +
      'ChildMI1.Caption=Дочірній бенд' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Параметри шрифту' + #13#10 +
      'BoldMI.Caption=Потовщений' + #13#10 +
      'ItalicMI.Caption=Похилий' + #13#10 +
      'UnderlineMI.Caption=Підкреслений' + #13#10 +
      'SuperScriptMI.Caption=Верхній індекс' + #13#10 +
      'SubScriptMI.Caption=Нижній індекс' + #13#10 +
      'CondensedMI.Caption=Стислий' + #13#10 +
      'WideMI.Caption=Широкий' + #13#10 +
      'N12cpiMI.Caption=12 символів/дюйм' + #13#10 +
      'N15cpiMI.Caption=15 символів/дюйм' + #13#10 +
      'OpenDialog.Filter=Звіт (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Файли Pascal (*.pas)|*.pas|файли C++ (*.cpp)|*.cpp|файли JavaScript (*.js)|*.js|файли Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Файли Pascal (*.pas)|*.pas|файли C++ (*.cpp)|*.cpp|файли JavaScript (*.js)|*.js|файли Basic (*.vb)|*.vb|All files|*.*' + #13#10 +
      '');
    Add('dsCm', 'Сантиметри');
    Add('dsInch', 'Дюйми');
    Add('dsPix', 'Крапки');
    Add('dsChars', 'Символи');
    Add('dsCode', 'Код');
    Add('dsPage', 'Стор.');
    Add('dsRepFilter', 'Звіт (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Стислий звіт (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Зберегти зміни?');
    Add('dsSaveChangesTo', 'Зберегти зміни в ');
    Add('dsCantLoad', 'Не вдалося відкрити файл');
    Add('dsStyleFile', 'Стиль');
    Add('dsCantFindProc', 'Не вдалося знайти головну процедуру');
    Add('dsClearScript', 'Це очистить весь код. Продовжити?');
    Add('dsNoStyle', 'Немає стилю');
    Add('dsStyleSample', 'Приклад стилю');
    Add('dsTextNotFound', 'Текст ''%s'' не знайдений');
    Add('dsReplace', 'Замінити ''%s''?');

    Add('TfrxAboutForm',
      'Caption=Про FastReport' + #13#10 +
      'Label4.Caption=Відвідайте нашу сторінку:' + #13#10 +
      'Label6.Caption=Продажі:' + #13#10 +
      'Label8.Caption=Підтримка:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Налаштування сторінки' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'TabSheet1.Caption=Сторінка' + #13#10 +
      'Label1.Caption=Ширина' + #13#10 +
      'Label2.Caption=Висота' + #13#10 +
      'Label11.Caption=Формат   ' + #13#10 +
      'Label12.Caption=Орієнтація   ' + #13#10 +
      'Label3.Caption=Ліве' + #13#10 +
      'Label4.Caption=Верхнє' + #13#10 +
      'Label5.Caption=Праве' + #13#10 +
      'Label6.Caption=Нижнє' + #13#10 +
      'Label13.Caption=Поля   ' + #13#10 +
      'Label14.Caption=Джерело паперу   ' + #13#10 +
      'Label9.Caption=Для першої сторінки' + #13#10 +
      'Label10.Caption=Для інших' + #13#10 +
      'PortraitRB.Caption=Портретна' + #13#10 +
      'LandscapeRB.Caption=Альбомна' + #13#10 +
      'TabSheet3.Caption=Інше' + #13#10 +
      'Label7.Caption=Колонки   ' + #13#10 +
      'Label8.Caption=Кількість' + #13#10 +
      'Label15.Caption=Ширина' + #13#10 +
      'Label16.Caption=Позиції' + #13#10 +
      'Label17.Caption=Інше   ' + #13#10 +
      'Label18.Caption=Дуплекс' + #13#10 +
      'PrintOnPrevCB.Caption=Друкувати на поперед.сторінці' + #13#10 +
      'MirrorMarginsCB.Caption=Дзеркальні поля' + #13#10 +
      'LargeHeightCB.Caption=Більша висота в дизайнері' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Дані звіту' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Список змінних' + #13#10 +
      'NewCategoryB.Caption=Категорія' + #13#10 +
      'NewVarB.Caption=Змінна' + #13#10 +
      'EditB.Caption=Змінити' + #13#10 +
      'DeleteB.Caption=Видалити' + #13#10 +
      'EditListB.Caption=Список' + #13#10 +
      'LoadB.Caption=Відкрити' + #13#10 +
      'SaveB.Caption=Зберегти' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'ExprPanel.Caption= Вираження:' + #13#10 +
      'OpenDialog1.Filter=Список змінних (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Список змінних (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(немає змінних)');
    Add('vaVar', 'Змінні');
    Add('vaDupName', 'Змінна з таким ім''ям уже існує');

    Add('TfrxOptionsEditor',
      'Caption=Налаштування дизайнера' + #13#10 +
      'Label1.Caption=Сітка   ' + #13#10 +
      'Label2.Caption=Тип' + #13#10 +
      'Label3.Caption=Розмір' + #13#10 +
      'Label4.Caption=Діалогова форма:' + #13#10 +
      'Label5.Caption=Інше   ' + #13#10 +
      'Label6.Caption=Шрифти   ' + #13#10 +
      'Label7.Caption=Редактор коду' + #13#10 +
      'Label8.Caption=Редактор тексту' + #13#10 +
      'Label9.Caption=Розмір' + #13#10 +
      'Label10.Caption=Розмір' + #13#10 +
      'Label11.Caption=Кольори   ' + #13#10 +
      'Label12.Caption=Проміжок між бендами:' + #13#10 +
      'Label13.Caption=см' + #13#10 +
      'Label14.Caption=in' + #13#10 +
      'Label15.Caption=pt' + #13#10 +
      'Label16.Caption=pt' + #13#10 +
      'Label17.Caption=pt' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'CMRB.Caption=Сантиметри:' + #13#10 +
      'InchesRB.Caption=Дюйми:' + #13#10 +
      'PixelsRB.Caption=Крапки:' + #13#10 +
      'ShowGridCB.Caption=Показувати сітку' + #13#10 +
      'AlignGridCB.Caption=Вирівнювати по сітці' + #13#10 +
      'EditAfterInsCB.Caption=Викликати редактор після вставки' + #13#10 +
      'ObjectFontCB.Caption=Використати шрифт об''єкта' + #13#10 +
      'WorkspaceB.Caption=Робоче поле' + #13#10 +
      'ToolB.Caption=Вікна' + #13#10 +
      'LCDCB.Caption=Кольори сітки для LCD-монітора' + #13#10 +
      'FreeBandsCB.Caption=Вільне розміщення бендів' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Відновити настроювання' + #13#10 +
      'BandsCaptionsCB.Caption=Показувати заголовки бендів' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Джерело даних' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');
    Add('dbNotAssigned', '[не призначений]');
    Add('dbSingleLine', 'Один рядок');

    Add('TfrxGroupEditorForm',
      'Caption=Група' + #13#10 +
      'BreakOnL.Caption=Умова   ' + #13#10 +
      'OptionsL.Caption=Властивості   ' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'DataFieldRB.Caption=Поле БД' + #13#10 +
      'ExpressionRB.Caption=Вираз' + #13#10 +
      'KeepGroupTogetherCB.Caption=Виводити групу на одній сторінці' + #13#10 +
      'StartNewPageCB.Caption=Формувати нову сторінку' + #13#10 +
      'OutlineCB.Caption=Показувати в дереві звіту' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Службовий текст' + #13#10 +
      'DataBandL.Caption=Дата-бенд' + #13#10 +
      'DataSetL.Caption=Набір даних' + #13#10 +
      'DataFieldL.Caption=Поле БД' + #13#10 +
      'FunctionL.Caption=Функція' + #13#10 +
      'ExpressionL.Caption=Вираз' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'AggregateRB.Caption=Агрегатна функція' + #13#10 +
      'SysVariableRB.Caption=Системна змінна' + #13#10 +
      'CountInvisibleCB.Caption=Враховувати невидимі бенди' + #13#10 +
      'TextRB.Caption=Текст' + #13#10 +
      'RunningTotalCB.Caption=Наростаючим підсумком' + #13#10 +
      '');
    Add('agAggregate', 'Вставити агрегатну функцію');
    Add('vt1', '[DATE]');
    Add('vt2', '[TIME]');
    Add('vt3', '[PAGE#]');
    Add('vt4', '[TOTALPAGES#]');
    Add('vt5', '[PAGE#] з [TOTALPAGES#]');
    Add('vt6', '[LINE#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE об''єкт' + #13#10 +
      'InsertB.Caption=Вставити...' + #13#10 +
      'EditB.Caption=Редактор...' + #13#10 +
      'CloseB.Caption=Закрити' + #13#10 +
      '');
    Add('olStretched', ' Розтягуваний');

    Add('TfrxBarcodeEditorForm',
      'Caption=Штрихкод' + #13#10 +
      'CodeLbl.Caption=Код' + #13#10 +
      'TypeLbl.Caption=Тип штрихкода' + #13#10 +
      'ZoomLbl.Caption=Масштаб:' + #13#10 +
      'OptionsLbl.Caption=Властивості   ' + #13#10 +
      'RotationLbl.Caption=Орієнтація   ' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CalcCheckSumCB.Caption=Контрольна сума' + #13#10 +
      'ViewTextCB.Caption=Показувати текст' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Контрольна сума');
    Add('bcShowText', 'Показувати текст');

    Add('TfrxAliasesEditorForm',
      'Caption=Псевдоніми' + #13#10 +
      'HintL.Caption=Натисніть Enter для редагування' + #13#10 +
      'DSAliasL.Caption=Псевдонім набору даних' + #13#10 +
      'FieldAliasesL.Caption=Псевдоніми полів' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'ResetB.Caption=Скидання' + #13#10 +
      'UpdateB.Caption=Поновити' + #13#10 +
      '');
    Add('alUserName', 'Псевдонім');
    Add('alOriginal', 'Оригінальне ім''я');

    Add('TfrxParamsEditorForm',
      'Caption=Параметри' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');
    Add('qpName', 'Ім''я');
    Add('qpDataType', 'Тип');
    Add('qpValue', 'Значення');

    Add('TfrxMDEditorForm',
      'Caption=Редактор Master-Detail' + #13#10 +
      'Label1.Caption=Поля Detail' + #13#10 +
      'Label2.Caption=Поля Master' + #13#10 +
      'Label3.Caption=Зв''язані поля' + #13#10 +
      'AddB.Caption=Додати' + #13#10 +
      'ClearB.Caption=Очистити' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Редактор тексту' + #13#10 +
      'ExprB.Hint=Вставити вираз' + #13#10 +
      'AggregateB.Hint=Вставити агрегатну функцію' + #13#10 +
      'LocalFormatB.Hint=Вставити формат' + #13#10 +
      'WordWrapB.Hint=Переносити слова' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Картинка' + #13#10 +
      'LoadB.Hint=Завантажити' + #13#10 +
      'CopyB.Hint=Копіювати' + #13#10 +
      'PasteB.Hint=Вставити' + #13#10 +
      'ClearB.Hint=Очистити' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');
    Add('piEmpty', 'Порожньо');

    Add('TfrxChartEditorForm',
      'Caption=Діаграма' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'AddB.Hint=Додати серію' + #13#10 +
      'DeleteB.Hint=Видалити серію' + #13#10 +
      'DBSourceRB.Caption=Дані із БД' + #13#10 +
      'BandSourceRB.Caption=Данные из бэнда' + #13#10 +
      'FixedDataRB.Caption=Фіксовані дані' + #13#10 +
      'DatasetLbl.Caption=Набір даних' + #13#10 +
      'BandLbl.Caption=Дата-бэнд' + #13#10 +
      'X1Lbl.Caption=Значення X' + #13#10 +
      'Y1Lbl.Caption=Значення Y' + #13#10 +
      'X2Lbl.Caption=Значення X' + #13#10 +
      'Y2Lbl.Caption=Значення Y' + #13#10 +
      'X3Lbl.Caption=Значення X (наприклад, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Значення Y (наприклад, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Властивості   ' + #13#10 +
      'ShowTopLbl.Caption=Показувати Top значень' + #13#10 +
      'CaptionLbl.Caption=Заголовок Top' + #13#10 +
      'SortLbl.Caption=Сортування' + #13#10 +
      'LineMI.Caption=Лінії' + #13#10 +
      'AreaMI.Caption=Область' + #13#10 +
      'PointMI.Caption=Крапки' + #13#10 +
      'BarMI.Caption=Прямокутники' + #13#10 +
      'HorizBarMI.Caption=Гориз.прямокутники' + #13#10 +
      'PieMI.Caption=Діаграма' + #13#10 +
      'GanttMI.Caption=Гант' + #13#10 +
      'FastLineMI.Caption=Швидкі лінії' + #13#10 +
      '');
    Add('ch3D', 'Тривимірна');
    Add('chAxis', 'Показувати осі');
    Add('chsoNone', 'Немає');
    Add('chsoAscending', 'По зростанню');
    Add('chsoDescending', 'По спаданню');

    Add('TfrxRichEditorForm',
      'Caption=RichEdit' + #13#10 +
      'OpenB.Hint=Відкрити' + #13#10 +
      'SaveB.Hint=Зберегти' + #13#10 +
      'UndoB.Hint=Скасувати' + #13#10 +
      'TTB.Hint=Шрифт' + #13#10 +
      'ExprB.Hint=Вставити вираз' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      'BoldB.Hint=Потовщення' + #13#10 +
      'ItalicB.Hint=Курсив' + #13#10 +
      'UnderlineB.Hint=Підкреслення' + #13#10 +
      'LeftAlignB.Hint=Вирівняти текст вліво' + #13#10 +
      'CenterAlignB.Hint=Вирівняти текст по центрі' + #13#10 +
      'RightAlignB.Hint=Вирівняти текст вправо' + #13#10 +
      'BlockAlignB.Hint=Вирівняти текст по ширині' + #13#10 +
      'BulletsB.Hint=Список' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Редактор Cross-tab' + #13#10 +
      'DatasetL.Caption=Дані   ' + #13#10 +
      'DimensionsL.Caption=Розмірність   ' + #13#10 +
      'RowsL.Caption=Рядка' + #13#10 +
      'ColumnsL.Caption=Колонки' + #13#10 +
      'CellsL.Caption=Чарунки' + #13#10 +
      'StructureL.Caption=Структура таблиці   ' + #13#10 +
      'RowHeaderCB.Caption=Заголовок рядка' + #13#10 +
      'ColumnHeaderCB.Caption=Заголовок колонки' + #13#10 +
      'RowTotalCB.Caption=Підсумок рядка' + #13#10 +
      'ColumnTotalCB.Caption=Підсумок колонки' + #13#10 +
      'SwapB.Hint=Поміняти рядка/колонки' + #13#10 +
      'StyleCB.Hint=Стиль' + #13#10 +
      'FontB.Hint=Шрифт' + #13#10 +
      'AlignLeftB.Hint=Вирівняти вліво' + #13#10 +
      'AlignCenterB.Hint=Вирівняти по центру' + #13#10 +
      'AlignRightB.Hint=Вирівняти вправо' + #13#10 +
      'RotationB.Hint=Поворот тексту' + #13#10 +
      'HighlightB.Hint=Умовне виділення' + #13#10 +
      'FormatB.Hint=Формат' + #13#10 +
      'FrameB.Hint=Рамка' + #13#10 +
      'FillColorB.Hint=Кольори тла' + #13#10 +
      'Func1MI.Caption=Немає' + #13#10 +
      'Func2MI.Caption=Sum' + #13#10 +
      'Func3MI.Caption=Min' + #13#10 +
      'Func4MI.Caption=Max' + #13#10 +
      'Func5MI.Caption=Average' + #13#10 +
      'Func6MI.Caption=Count' + #13#10 +
      'Sort1MI.Caption=По зростанню (A-Z)' + #13#10 +
      'Sort2MI.Caption=По спаданні (Z-A)' + #13#10 +
      'Sort3MI.Caption=Не сортувати' + #13#10 +
      'BoldMI.Caption=Потовщений' + #13#10 +
      'ItalicMI.Caption=Курсив' + #13#10 +
      'UnderlineMI.Caption=Підкреслений' + #13#10 +
      'SuperScriptMI.Caption=Надрядковий' + #13#10 +
      'SubScriptMI.Caption=Підрядковий' + #13#10 +
      'CondensedMI.Caption=Стислий' + #13#10 +
      'WideMI.Caption=Широкий' + #13#10 +
      'N12cpiMI.Caption=12 символів/дюйм' + #13#10 +
      'N15cpiMI.Caption=15 символів/дюйм' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');
    Add('crSubtotal', 'Підпідсумки');
    Add('crNone', 'немає');
    Add('crSum', 'Sum');
    Add('crMin', 'Min');
    Add('crMax', 'Max');
    Add('crAvg', 'Avg');
    Add('crCount', 'Count');
    Add('crAsc', 'А-Я');
    Add('crDesc', 'Я-А');
    Add('crBorder', 'Рамка навколо');
    Add('crDown', 'Вниз, потім убік');
    Add('crRepHdrs', 'Повторювати заголовки');

    Add('TfrxExprEditorForm',
      'Caption=Редактор виразів' + #13#10 +
      'ExprL.Caption=Вираз:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Форматування' + #13#10 +
      'CategoryL.Caption=Категорія' + #13#10 +
      'FormatL.Caption=Формат' + #13#10 +
      'FormatStrL.Caption=Рядок форматування:' + #13#10 +
      'SeparatorL.Caption=Роздільник дробу:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');
    Add('fkText', 'Текст');
    Add('fkNumber', 'Число');
    Add('fkDateTime', 'Дата/час');
    Add('fkBoolean', 'Логічне');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '1,234.50р;%2.2m');
    Add('fkDateTime1', '28.11.2002;dd.mm.yyyy');
    Add('fkDateTime2', '28 Ниючи 2002;dd mmm yyyy');
    Add('fkDateTime3', '28 Листопад 2002;dd mmmm yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14, 28 Листопада 2002;hh:mm dd mmmm yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Ні,Так;Ні,Так');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'False,True;False,True');

    Add('TfrxHighlightEditorForm',
      'Caption=Умовне виділення' + #13#10 +
      'FontColorB.Caption=Кольори...' + #13#10 +
      'BackColorB.Caption=Кольори...' + #13#10 +
      'ConditionL.Caption=Умова   ' + #13#10 +
      'FontL.Caption=Шрифт   ' + #13#10 +
      'BackgroundL.Caption=Тло   ' + #13#10 +
      'OKB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'BoldCB.Caption=Потовщений' + #13#10 +
      'ItalicCB.Caption=Курсив' + #13#10 +
      'UnderlineCB.Caption=Підкреслений' + #13#10 +
      'TransparentRB.Caption=Прозорий' + #13#10 +
      'OtherRB.Caption=Інше' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Налаштування звіту' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'GeneralTS.Caption=Основні' + #13#10 +
      'ReportSettingsL.Caption=Настроювання друку   ' + #13#10 +
      'CopiesL.Caption=Копії' + #13#10 +
      'GeneralL.Caption=Властивості   ' + #13#10 +
      'PasswordL.Caption=Пароль' + #13#10 +
      'CollateCB.Caption=Розібрати по копіях' + #13#10 +
      'DoublePassCB.Caption=Два проходи' + #13#10 +
      'PrintIfEmptyCB.Caption=Друкувати, якщо порожній' + #13#10 +
      'DescriptionTS.Caption=Опис' + #13#10 +
      'NameL.Caption=Ім''я' + #13#10 +
      'Description1L.Caption=Опис' + #13#10 +
      'PictureL.Caption=Картинка' + #13#10 +
      'AuthorL.Caption=Автор' + #13#10 +
      'MajorL.Caption=Major' + #13#10 +
      'MinorL.Caption=Minor' + #13#10 +
      'ReleaseL.Caption=Release' + #13#10 +
      'BuildL.Caption=Build' + #13#10 +
      'CreatedL.Caption=Створений' + #13#10 +
      'ModifiedL.Caption=Змінений' + #13#10 +
      'DescriptionL.Caption=Опис   ' + #13#10 +
      'VersionL.Caption=Версія   ' + #13#10 +
      'PictureB.Caption=Перегляд...' + #13#10 +
      '');
    Add('rePrnOnPort', 'на');

    Add('TfrxStringsEditorForm',
      'Caption=Редактор рядків' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=Редактор SQL' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Пароль' + #13#10 +
      'PasswordL.Caption=Введіть пароль:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Стилі' + #13#10 +
      'ColorB.Caption=Кольори...' + #13#10 +
      'FontB.Caption=Шрифт...' + #13#10 +
      'FrameB.Caption=Рамка...' + #13#10 +
      'AddB.Hint=Додати' + #13#10 +
      'DeleteB.Hint=Видалити' + #13#10 +
      'EditB.Hint=Виправлення' + #13#10 +
      'LoadB.Hint=Завантажити' + #13#10 +
      'SaveB.Hint=Зберегти' + #13#10 +
      'CancelB.Hint=Відмова' + #13#10 +
      'OkB.Hint=ОК' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Редактор рамки' + #13#10 +
      'FrameL.Caption=Рамка' + #13#10 +
      'LineL.Caption=Лінія' + #13#10 +
      'ShadowL.Caption=Тінь' + #13#10 +
      'FrameTopB.Hint=Верхня лінія' + #13#10 +
      'FrameBottomB.Hint=Нижня лінія' + #13#10 +
      'FrameLeftB.Hint=Ліва лінія' + #13#10 +
      'FrameRightB.Hint=Права лінія' + #13#10 +
      'FrameAllB.Hint=Всі лінії' + #13#10 +
      'FrameNoB.Hint=Виключити лінії' + #13#10 +
      'FrameColorB.Hint=Кольори рамки' + #13#10 +
      'FrameStyleB.Hint=Стиль рамки' + #13#10 +
      'FrameWidthCB.Hint=Товщина лінії' + #13#10 +
      'ShadowB.Hint=Тінь' + #13#10 +
      'ShadowColorB.Hint=Кольори тіні' + #13#10 +
      'ShadowWidthCB.Hint=Розмір тіні' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Створити новий...' + #13#10 +
      'ItemsTab.Caption=Список' + #13#10 +
      'TemplatesTab.Caption=Шаблони' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Редактор TabOrder' + #13#10 +
      'Label1.Caption=Елементи керування:' + #13#10 +
      'OkB.Caption=ОК' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'UpB.Caption=Нагору' + #13#10 +
      'DownB.Caption=Вниз' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Обчислити' + #13#10 +
      'Label1.Caption=Вираз' + #13#10 +
      'Label2.Caption=Результат' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Майстер звітів' + #13#10 +
      'DataTab.Caption=Дані' + #13#10 +
      'GroupsTab.Caption=Групи' + #13#10 +
      'LayoutTab.Caption=Розміщення' + #13#10 +
      'StyleTab.Caption=Стиль' + #13#10 +
      'Step1L.Caption=Крок 1. Виберіть дані для відображення у звіті.' + #13#10 +
      'Step2L.Caption=Крок 2. Створіть групи (не обов''язково).' + #13#10 +
      'Step3L.Caption=Крок 3. Виберіть орієнтацію аркуша й розміщення даних.' + #13#10 +
      'Step4L.Caption=Крок 4. Виберіть стиль звіту.' + #13#10 +
      'AddFieldB.Caption=Додати >' + #13#10 +
      'AddAllFieldsB.Caption=Додати всі >>' + #13#10 +
      'RemoveFieldB.Caption=< Видалити' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Видалити всі' + #13#10 +
      'AddGroupB.Caption=Додати >' + #13#10 +
      'RemoveGroupB.Caption=< Видалити' + #13#10 +
      'SelectedFieldsL.Caption=Обрані поля:' + #13#10 +
      'AvailableFieldsL.Caption=Доступні поля:' + #13#10 +
      'GroupsL.Caption=Групи:' + #13#10 +
      'OrientationL.Caption=Орієнтація   ' + #13#10 +
      'LayoutL.Caption=Розміщення   ' + #13#10 +
      'PortraitRB.Caption=Портретна' + #13#10 +
      'LandscapeRB.Caption=Альбомна' + #13#10 +
      'TabularRB.Caption=У вигляді таблиці' + #13#10 +
      'ColumnarRB.Caption=У вигляді колонок' + #13#10 +
      'FitWidthCB.Caption=Умістити всі поля по ширині' + #13#10 +
      'CancelB.Caption=Відмова' + #13#10 +
      'BackB.Caption=<< Назад' + #13#10 +
      'NextB.Caption=Далі >>' + #13#10 +
      'FinishB.Caption=Готово' + #13#10 +
      '');
    Add('wzStd', 'Помічник стандартного звіту');
    Add('wzDMP', 'Помічник матричного звіту');
    Add('wzStdEmpty', 'Порожній стандартний звіт');
    Add('wzDMPEmpty', 'Порожній матричний звіт');


    Add('ftAllFiles', 'Всі файли');
    Add('ftPictures', 'Картинки');
    Add('ftDB', 'Бази даних');
    Add('ftRichFile', 'Файл RichText');
    Add('ftTextFile', 'Текстовий файл');

    Add('prNotAssigned', '(Не визначений)');
    Add('prInvProp', 'Невірне значення властивості');
    Add('prDupl', 'Повторюване ім''я');
    Add('prPict', '(Картинка)');

    Add('mvExpr', 'Вираз в тексті');
    Add('mvStretch', ' Розтягуваний');
    Add('mvStretchToMax', 'Розтягування до макс.висоти');
    Add('mvShift', ' Зміщуваний');
    Add('mvShiftOver', 'Зміщуваний при перекритті');
    Add('mvVisible', 'Видимий');
    Add('mvPrintable', ' Друкований');
    Add('mvFont', 'Шрифт...');
    Add('mvFormat', 'Форматування...');
    Add('mvClear', 'Очистити текст');
    Add('mvAutoWidth', 'Автоширина');
    Add('mvWWrap', 'Переносити слова');
    Add('mvSuppress', 'Приховувати повторювані');
    Add('mvHideZ', 'Приховувати нулі');
    Add('mvHTML', 'HTML-теги в тексті');
    Add('lvDiagonal', 'Діагональна');
    Add('pvAutoSize', 'Авторозмір');
    Add('pvCenter', 'Центрувати');
    Add('pvAspect', 'Зберігати пропорції');
    Add('bvSplit', 'Дозволити розрив');
    Add('bvKeepChild', 'Тримати Child разом');
    Add('bvPrintChild', 'Друкувати Child якщо невидимий');
    Add('bvStartPage', 'Формувати нову сторінку');
    Add('bvPrintIfEmpty', 'Друкувати, якщо Detail порожній');
    Add('bvKeepDetail', 'Тримати Detail разом');
    Add('bvKeepFooter', 'Тримати підвал разом');
    Add('bvReprint', 'Виводити на новій сторінці');
    Add('bvOnFirst', 'Друкувати на першій сторінці');
    Add('bvOnLast', 'Друкувати на останній сторінці');
    Add('bvKeepGroup', 'Тримати разом');
    Add('bvFooterAfterEach', 'Footer після кожного запису');
    Add('srParent', 'Друкувати на бенді');
    Add('bvKeepHeader', 'Держать заголовок вместе');

    Add('obCatDraw', 'Малювання');
    Add('obCatOther', 'Інші об''єкти');
    Add('obCatOtherControls', 'Інші елементи');
    Add('obDiagLine', 'Діагональна лінія');
    Add('obRect', 'Прямокутник');
    Add('obRoundRect', 'Округлений прямокутник');
    Add('obEllipse', 'Еліпс');
    Add('obTrian', 'Трикутник');
    Add('obDiamond', 'Ромб');
    Add('obLabel', 'Елемент керування Label');
    Add('obEdit', 'Елемент керування Edit');
    Add('obMemoC', 'Елемент керування Memo');
    Add('obButton', 'Елемент керування Button');
    Add('obChBoxC', 'Елемент керування CheckBox');
    Add('obRButton', 'Елемент керування RadioButton');
    Add('obLBox', 'Елемент керування ListBox');
    Add('obCBox', 'Елемент керування ComboBox');
    Add('obDateEdit', 'Елемент керування DateEdit');
    Add('obImageC', 'Елемент керування Image');
    Add('obPanel', 'Елемент керування Panel');
    Add('obGrBox', 'Елемент керування GroupBox');
    Add('obBBtn', 'Елемент керування BitBtn');
    Add('obSBtn', 'Елемент керування SpeedButton');
    Add('obMEdit', 'Елемент керування MaskEdit');
    Add('obChLB', 'Елемент керування CheckListBox');
    Add('obDBLookup', 'Елемент керування DBLookupComboBox');
    Add('obBevel', 'Елемент керування Bevel');
    Add('obShape', 'Елемент керування Shape');
    Add('obText', 'Об''єкт "Текст"');
    Add('obSysText', 'Об''єкт "Службовий текст"');
    Add('obLine', 'Об''єкт "Лінія"');
    Add('obPicture', 'Об''єкт "Малюнок"');
    Add('obBand', 'Об''єкт "Бенд"');
    Add('obDataBand', 'Об''єкт "Дата-бенд"');
    Add('obSubRep', 'Об''єкт "Вкладений звіт"');
    Add('obDlgPage', 'Діалогова форма');
    Add('obRepPage', 'Сторінка звіту');
    Add('obReport', 'Об''єкт "Звіт"');
    Add('obRich', 'Об''єкт "RichText"');
    Add('obOLE', 'Об''єкт "OLE"');
    Add('obChBox', 'Об''єкт "CheckBox"');
    Add('obChart', 'Об''єкт "Діаграма"');
    Add('obBarC', 'Об''єкт "Штрихкод"');
    Add('obCross', 'Об''єкт "Cross-tab"');
    Add('obDBCross', 'Об''єкт "DB Cross-tab"');
    Add('obGrad', 'Об''єкт "Градієнт"');
    Add('obDMPText', 'Об''єкт "Матричний текст"');
    Add('obDMPLine', 'Об''єкт "Матрична лінія"');
    Add('obBDEDB', 'База даних BDE');
    Add('obBDETb', 'Таблиця BDE');
    Add('obBDEQ', 'Запит BDE');
    Add('obBDEComps', 'Компоненти BDE');
    Add('obIBXDB', 'База даних IBX');
    Add('obIBXTb', 'Таблиця IBX');
    Add('obIBXQ', 'Запит IBX');
    Add('obIBXComps', 'Компоненти IBX');
    Add('obADODB', 'База даних ADO');
    Add('obADOTb', 'Таблиця ADO');
    Add('obADOQ', 'Запит ADO');
    Add('obADOComps', 'Компоненти ADO');
    Add('obDBXDB', 'База даних DBX');
    Add('obDBXTb', 'Таблиця DBX');
    Add('obDBXQ', 'Запит DBX');
    Add('obDBXComps', 'Компоненти DBX');

    Add('ctString', 'Стрічки');
    Add('ctDate', 'Дата й час');
    Add('ctConv', 'Конвертування');
    Add('ctFormat', 'Форматування');
    Add('ctMath', 'Математичні');
    Add('ctOther', 'Інші');

    Add('IntToStr', 'Конвертує ціле число в рядок');
    Add('FloatToStr', 'Конвертує речовинне число в рядок');
    Add('DateToStr', 'Конвертує дату в рядок');
    Add('TimeToStr', 'Конвертує час у рядок');
    Add('DateTimeToStr', 'Конвертує дату й час у рядок');
    Add('VarToStr', 'Конвертує варіант у рядок');
    Add('StrToInt', 'Конвертує рядок у ціле число');
    Add('StrToFloat', 'Конвертує рядок у речовинне число');
    Add('StrToDate', 'Конвертує рядок у дату');
    Add('StrToTime', 'Конвертує рядок під час');
    Add('StrToDateTime', 'Конвертує рядок у дату й час');
    Add('Format', 'Повертає форматований рядок');
    Add('FormatFloat', 'Форматує дійсне число');
    Add('FormatDateTime', 'Форматує дату й час');
    Add('FormatMaskText', 'Форматує текст, використовуючи задану маску');
    Add('EncodeDate', 'Повертає значення TDateTime, що відповідає заданим значенням Year, Month, Day');
    Add('DecodeDate', 'Розбиває значення TDateTime на значення Year, Month, Day');
    Add('EncodeTime', 'Повертає значення TDateTime, що відповідає заданим значенням Hour, Min, Sec, MSec');
    Add('DecodeTime', 'Розбиває значення TDateTime на значення Hour, Min, Sec, MSec');
    Add('Date', 'Повертає поточну дату');
    Add('Time', 'Повертає поточний час');
    Add('Now', 'Повертає поточну дату й час');
    Add('DayOfWeek', 'Повертає номер дня тижня, що відповідає заданій даті');
    Add('IsLeapYear', 'Повертає True, якщо заданий рік - високосний');
    Add('DaysInMonth', 'Повертає число днів у заданому місяці');
    Add('Length', 'Повертає довжину рядка');
    Add('Copy', 'Повертає підстроку');
    Add('Pos', 'Повертає позицію підстроки в рядку');
    Add('Delete', 'Видаляє частину символів рядка');
    Add('Insert', 'Вставляє підстроку в рядок');
    Add('Uppercase', 'Конвертує всі символи рядка у верхній регістр');
    Add('Lowercase', 'Конвертує всі символи рядка в нижній регістр');
    Add('Trim', 'Видаляє пробіли на початку й кінці рядка');
    Add('NameCase', 'Конвертує перший символ слова у верхній регістр');
    Add('CompareText', 'Порівнює два рядки без врахування регістра');
    Add('Chr', 'Конвертує ціле число в символ');
    Add('Ord', 'Конвертує символ у ціле число');
    Add('SetLength', 'Встановлює довжину рядка');
    Add('Round', 'Округляє число до найближчого цілого значення');
    Add('Trunc', 'Відкидає дробову частину числа');
    Add('Int', 'Повертає цілу частину дійсного значення');
    Add('Frac', 'Повертає дробову частину дійсного значення');
    Add('Sqrt', 'Повертає корінь квадратний із числа');
    Add('Abs', 'Повертає модуль числа');
    Add('Sin', 'Повертає синус кута (у радіанах)');
    Add('Cos', 'Повертає косинус кута (у радіанах)');
    Add('ArcTan', 'Повертає арктангенс');
    Add('Tan', 'Повертає тангенс');
    Add('Exp', 'Повертає експоненту');
    Add('Ln', 'Повертає натуральний логарифм заданого числа');
    Add('Pi', 'Повертає число "пі"');
    Add('Inc', 'Збільшує ціле число на 1');
    Add('Dec', 'Зменшує ціле число на 1');
    Add('RaiseException', 'Викликає виключення');
    Add('ShowMessage', 'Показує вікно повідомлення');
    Add('Randomize', 'Запускає генератор випадкових чисел');
    Add('Random', 'Повертає випадкове число');
    Add('ValidInt', 'Повертає True якщо заданий рядок може бути перетворений в ціле число');
    Add('ValidFloat', 'Повертає True якщо заданий рядок може бути перетворений в дійсне число');
    Add('ValidDate', 'Повертає True якщо заданий рядок може бути перетворений в дату');
    Add('IIF', 'Повертає TrueValue якщо заданий вираз дорівнює True, інакше повертає FalseValue');
    Add('Get', 'Повертає значення змінної зі списку змінних');
    Add('Set', 'Встановлює значення змінної зі списку змінних');
    Add('InputBox', 'Показує діалог введення рядка');
    Add('InputQuery', 'Показує діалог введення рядка');
    Add('MessageDlg', 'Показує вікно повідомлення');
    Add('CreateOleObject', 'Створює OLE об''єкт');
    Add('VarArrayCreate', 'Створює масив варіантів');
    Add('VarType', 'Повертає тип варіанта');
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

