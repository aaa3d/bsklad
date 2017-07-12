
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
      'Caption=Object Inspector' + #13#10 +
      '');
    Add('oiProp', 'Особине');
    Add('oiEvent', 'Догађаји');

    Add('TfrxDataTreeForm',
      'Caption=Дрво података' + #13#10 +
      'DataTS.Caption=Подаци' + #13#10 +
      'VariablesTS.Caption=Променљиве' + #13#10 +
      'FunctionsTS.Caption=Функције' + #13#10 +
      'InsFieldCB.Caption=Направи поље' + #13#10 +
      'InsCaptionCB.Caption=Направи наслов' + #13#10 +
      '');
    Add('dtNoData', 'Нема доступних података');
    Add('dtData', 'Подаци');
    Add('dtSysVar', 'Системске променљиве');
    Add('dtVar', 'Променљиве');
    Add('dtFunc', 'Функције');

    Add('TfrxReportTreeForm',
      'Caption=Дрво репорта' + #13#10 +
      '');

    Add('TfrxDesignerForm',
      'OpenScriptB.Hint=Отвори скрипт фајл' + #13#10 +
      'SaveScriptB.Hint=Сачувај скрипт у фајл' + #13#10 +
      'RunScriptB.Hint=Покрени скрипт' + #13#10 +
      'StepScriptB.Hint=Прати у' + #13#10 +
      'StopScriptB.Hint=Прекини скрипт' + #13#10 +
      'EvaluateB.Hint=Евалуација' + #13#10 +
      'LangL.Caption=Јеѕик:' + #13#10 +
      'AlignTB.Caption=поравнање' + #13#10 +
      'AlignLeftsB.Hint=Поравнање Лево' + #13#10 +
      'AlignHorzCentersB.Hint=Поравнање у средини' + #13#10 +
      'AlignRightsB.Hint=Поравнање Десно' + #13#10 +
      'AlignTopsB.Hint=Поравнање Горе' + #13#10 +
      'AlignVertCentersB.Hint=Поравнање Центар' + #13#10 +
      'AlignBottomsB.Hint=Поравнање Доле' + #13#10 +
      'SpaceHorzB.Hint=Простор хоризонтално' + #13#10 +
      'SpaceVertB.Hint=Простор вертикално' + #13#10 +
      'CenterHorzB.Hint=Центрирај хоризонтално у бенду' + #13#10 +
      'CenterVertB.Hint=Центрирај вертикално у бенду' + #13#10 +
      'SameWidthB.Hint=Исте ширине' + #13#10 +
      'SameHeightB.Hint=Исте висине' + #13#10 +
      'TextTB.Caption=Текст' + #13#10 +
      'StyleCB.Hint=Стил' + #13#10 +
      'FontNameCB.Hint=Назив фонта' + #13#10 +
      'FontSizeCB.Hint=Величина фонта' + #13#10 +
      'BoldB.Hint=Bold-Подебљано' + #13#10 +
      'ItalicB.Hint=Италик' + #13#10 +
      'UnderlineB.Hint=подвучено' + #13#10 +
      'FontColorB.Hint=Боја слова' + #13#10 +
      'HighlightB.Hint=Обележавање' + #13#10 +
      'RotateB.Hint=Ротација текста' + #13#10 +
      'TextAlignLeftB.Hint=Поравнање Лево' + #13#10 +
      'TextAlignCenterB.Hint=Поравнање Центар' + #13#10 +
      'TextAlignRightB.Hint=Поравнање Десно' + #13#10 +
      'TextAlignBlockB.Hint=Поравнање Обе стране' + #13#10 +
      'TextAlignTopB.Hint=Поравнање Горе' + #13#10 +
      'TextAlignMiddleB.Hint=Поравнање Средње' + #13#10 +
      'TextAlignBottomB.Hint=Поравнање Доле' + #13#10 +
      'FrameTB.Caption=Оквир' + #13#10 +
      'FrameTopB.Hint=Горња линија' + #13#10 +
      'FrameBottomB.Hint=Доња линија' + #13#10 +
      'FrameLeftB.Hint=Лева Линија' + #13#10 +
      'FrameRightB.Hint=Десна Линија' + #13#10 +
      'FrameAllB.Hint=Све линије оквира' + #13#10 +
      'FrameNoB.Hint=Без оквира' + #13#10 +
      'ShadowB.Hint=Сенка' + #13#10 +
      'FillColorB.Hint=Боја позадине' + #13#10 +
      'FrameColorB.Hint=Боја оквира' + #13#10 +
      'FrameStyleB.Hint=Стил оквира' + #13#10 +
      'FrameWidthCB.Hint=Ширина оквира' + #13#10 +
      'StandardTB.Caption=Стандардно' + #13#10 +
      'NewB.Hint=Нови репорт' + #13#10 +
      'OpenB.Hint=Отвори репорт' + #13#10 +
      'SaveB.Hint=Сачувај репорт' + #13#10 +
      'PreviewB.Hint=реглед' + #13#10 +
      'NewPageB.Hint=Нова страна репорта' + #13#10 +
      'NewDialogB.Hint=Нова Дијалог страна' + #13#10 +
      'DeletePageB.Hint=Брисање стране' + #13#10 +
      'PageSettingsB.Hint=Подешавања стране' + #13#10 +
      'VariablesB.Hint=Променљиве' + #13#10 +
      'CutB.Hint=Исеци' + #13#10 +
      'CopyB.Hint=Копирај' + #13#10 +
      'PasteB.Hint=Уметни' + #13#10 +
      'SampleFormatB.Hint=Копирање форматирања' + #13#10 +
      'UndoB.Hint=Поништи' + #13#10 +
      'RedoB.Hint=Понови' + #13#10 +
      'ShowGridB.Hint=Прикажи мрежу' + #13#10 +
      'AlignToGridB.Hint=Поравњај на мрежу' + #13#10 +
      'SetToGridB.Hint=Уклопи на мрежу' + #13#10 +
      'ScaleCB.Hint=Зум' + #13#10 +
      'ExtraToolsTB.Caption=Додатни алати' + #13#10 +
      'ObjectSelectB.Hint=Одабери алат' + #13#10 +
      'HandToolB.Hint=Рука алат' + #13#10 +
      'ZoomToolB.Hint=Зум алат' + #13#10 +
      'TextToolB.Hint=Алат за изману текста' + #13#10 +
      'FormatToolB.Hint=Алат за копирање форматирања' + #13#10 +
      'ObjectBandB.Hint=Убаци бенд' + #13#10 +
      'FileMenu.Caption=&Фајл' + #13#10 +
      'EditMenu.Caption=&Измени' + #13#10 +
      'FindMI.Caption=Тражи...' + #13#10 +
      'FindNextMI.Caption=Тражи следећи' + #13#10 +
      'ReplaceMI.Caption=Замени...' + #13#10 +
      'ReportMenu.Caption=&Репорт' + #13#10 +
      'ReportDataMI.Caption=Подаци...' + #13#10 +
      'ReportSettingsMI.Caption=Опције...' + #13#10 +
      'ReportStylesMI.Caption=Стилови...' + #13#10 +
      'ViewMenu.Caption=&Поглед' + #13#10 +
      'ToolbarsMI.Caption=Алатне траке' + #13#10 +
      'StandardMI.Caption=Стандард' + #13#10 +
      'TextMI.Caption=Текст' + #13#10 +
      'FrameMI.Caption=Оквир' + #13#10 +
      'AlignmentMI.Caption=Палета за поравнање' + #13#10 +
      'ToolsMI.Caption=Додатни алати' + #13#10 +
      'InspectorMI.Caption=Инспектор објеката' + #13#10 +
      'DataTreeMI.Caption=Дрво података' + #13#10 +
      'ReportTreeMI.Caption=Дрво репорта' + #13#10 +
      'ShowRulersMI.Caption=Лењири' + #13#10 +
      'ShowGuidesMI.Caption=Вођице' + #13#10 +
      'DeleteGuidesMI.Caption=Бришете вођице' + #13#10 +
      'OptionsMI.Caption=Опције...' + #13#10 +
      'HelpMenu.Caption=&Помоћ' + #13#10 +
      'HelpContentsMI.Caption=Садржај помоћи...' + #13#10 +
      'AboutMI.Caption=О ФастРепорту...' + #13#10 +
      'TabOrderMI.Caption=Таб редослед...' + #13#10 +
      'UndoCmd.Caption=Врати' + #13#10 +
      'RedoCmd.Caption=Понови' + #13#10 +
      'CutCmd.Caption=Исеци' + #13#10 +
      'CopyCmd.Caption=Копирај' + #13#10 +
      'PasteCmd.Caption=Уметни' + #13#10 +
      'DeleteCmd.Caption=Обриши' + #13#10 +
      'DeletePageCmd.Caption=Обриши страну' + #13#10 +
      'SelectAllCmd.Caption=Обележи све' + #13#10 +
      'EditCmd.Caption=Измена...' + #13#10 +
      'BringToFrontCmd.Caption=Доведи на врх' + #13#10 +
      'SendToBackCmd.Caption=Пошаљи позади' + #13#10 +
      'NewItemCmd.Caption=Нови...' + #13#10 +
      'NewReportCmd.Caption=Нови Репорт' + #13#10 +
      'NewPageCmd.Caption=Нова страна' + #13#10 +
      'NewDialogCmd.Caption=Нови дијалог' + #13#10 +
      'OpenCmd.Caption=Отвори...' + #13#10 +
      'SaveCmd.Caption=Сачувај' + #13#10 +
      'SaveAsCmd.Caption=Сачувај као...' + #13#10 +
      'VariablesCmd.Caption=Променљиве...' + #13#10 +
      'PageSettingsCmd.Caption=Подешавања стране...' + #13#10 +
      'PreviewCmd.Caption=Преглед' + #13#10 +
      'ExitCmd.Caption=Излаз' + #13#10 +
      'ReportTitleMI.Caption=Наслов Репорта' + #13#10 +
      'ReportSummaryMI.Caption=Репорт Инфо' + #13#10 +
      'PageHeaderMI.Caption=Заглавље стране' + #13#10 +
      'PageFooterMI.Caption=Подножје стране' + #13#10 +
      'HeaderMI.Caption=Заглавље' + #13#10 +
      'FooterMI.Caption=Подножје' + #13#10 +
      'MasterDataMI.Caption=Мастер подаци' + #13#10 +
      'DetailDataMI.Caption=Детаљни подаци' + #13#10 +
      'SubdetailDataMI.Caption=Субдетаљни подаци' + #13#10 +
      'Data4levelMI.Caption=Подаци 4. нивоа' + #13#10 +
      'Data5levelMI.Caption=Подаци 5. нивоа' + #13#10 +
      'Data6levelMI.Caption=Подаци 6. нивоа' + #13#10 +
      'GroupHeaderMI.Caption=Заглавље групе' + #13#10 +
      'GroupFooterMI.Caption=Подножје групе' + #13#10 +
      'ChildMI.Caption=Дете' + #13#10 +
      'ColumnHeaderMI.Caption=Заглавље колоне' + #13#10 +
      'ColumnFooterMI.Caption=Подножје колоне' + #13#10 +
      'OverlayMI.Caption=Преклапање' + #13#10 +
      'VerticalbandsMI.Caption=Вертикални бендови' + #13#10 +
      'HeaderMI1.Caption=Заглавље' + #13#10 +
      'FooterMI1.Caption=Подножје' + #13#10 +
      'MasterDataMI1.Caption=Мастер подаци' + #13#10 +
      'DetailDataMI1.Caption=Детаљни подаци' + #13#10 +
      'SubdetailDataMI1.Caption=Подаци Субдетаља' + #13#10 +
      'GroupHeaderMI1.Caption=Заглавље групе' + #13#10 +
      'GroupFooterMI1.Caption=Подножје групе' + #13#10 +
      'ChildMI1.Caption=Дете' + #13#10 +
      'R0MI.Caption=0°' + #13#10 +
      'R45MI.Caption=45°' + #13#10 +
      'R90MI.Caption=90°' + #13#10 +
      'R180MI.Caption=180°' + #13#10 +
      'R270MI.Caption=270°' + #13#10 +
      'FontB.Hint=Подешавање фонта' + #13#10 +
      'BoldMI.Caption=Болд' + #13#10 +
      'ItalicMI.Caption=Италик' + #13#10 +
      'UnderlineMI.Caption=Подвучено' + #13#10 +
      'SuperScriptMI.Caption=СуперСкрипт' + #13#10 +
      'SubScriptMI.Caption=СубСкрипт' + #13#10 +
      'CondensedMI.Caption=Кондензовано' + #13#10 +
      'WideMI.Caption=Широко' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'OpenDialog.Filter=Репорт (*.fr3)|*.fr3' + #13#10 +
      'OpenScriptDialog.Filter=Паскал фајлови (*.pas)|*.pas|C++ фајлови (*.cpp)|*.cpp|JavaScript фајлови (*.js)|*.js|Basic фајлови (*.vb)|*.vb|Сви фајлови|*.*' + #13#10 +
      'SaveScriptDialog.Filter=Паскал фајлови (*.pas)|*.pas|C++ фајлови (*.cpp)|*.cpp|JavaScript фајлови (*.js)|*.js|Basic фајлови (*.vb)|*.vb|Сви фајлови|*.*' + #13#10 +
      'GroupB.Hint=Group' + #13#10 +
      'UngroupB.Hint=Ungroup' + #13#10 +
      'GroupCmd.Caption=Group' + #13#10 +
      'UngroupCmd.Caption=Ungroup' + #13#10 +
      '');
    Add('dsCm', 'Центиметри');
    Add('dsInch', 'Инчи');
    Add('dsPix', 'Пиксели');
    Add('dsChars', 'Карактери');
    Add('dsCode', 'Код');
    Add('dsPage', 'Страна');
    Add('dsRepFilter', 'Репорт (*.fr3)|*.fr3');
    Add('dsComprRepFilter', 'Компресовани репорт (*.fr3)|*.fr3');
    Add('dsSavePreviewChanges', 'Памтите промене за страницу прегледа?');
    Add('dsSaveChangesTo', 'Чувате промене у ');
    Add('dsCantLoad', 'Не могу да учитам фајл');
    Add('dsStyleFile', 'Стил');
    Add('dsCantFindProc', 'Не могу да лоцирам главну проц');
    Add('dsClearScript', 'Ово ће очистити сав код. Да ли желите да наставите?');
    Add('dsNoStyle', 'Без стила');
    Add('dsStyleSample', 'Пример стила');
    Add('dsTextNotFound', 'Текст ''%s'' није нађен');
    Add('dsReplace', 'Мењате овај део текста ''%s''?');

    Add('TfrxAboutForm',
      'Caption=О ФастРепорту' + #13#10 +
      'Label4.Caption=Посетите нашу Интернет страницу за више информација:' + #13#10 +
      'Label6.Caption=Продаја:' + #13#10 +
      'Label8.Caption=Подршка:' + #13#10 +
      '');

    Add('TfrxPageEditorForm',
      'Caption=Опције стране' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'TabSheet1.Caption=Папир' + #13#10 +
      'Label1.Caption=Ширина' + #13#10 +
      'Label2.Caption=Висина' + #13#10 +
      'Label11.Caption=Величина   ' + #13#10 +
      'Label12.Caption=Оријентација   ' + #13#10 +
      'Label3.Caption=Лево' + #13#10 +
      'Label4.Caption=Горе' + #13#10 +
      'Label5.Caption=Десно' + #13#10 +
      'Label6.Caption=Доле' + #13#10 +
      'Label13.Caption=Маргине   ' + #13#10 +
      'Label14.Caption=Извор папира   ' + #13#10 +
      'Label9.Caption=Прва страна' + #13#10 +
      'Label10.Caption=Остале стране' + #13#10 +
      'PortraitRB.Caption=Усправно' + #13#10 +
      'LandscapeRB.Caption=Хоризонтално' + #13#10 +
      'TabSheet3.Caption=Остале опције' + #13#10 +
      'Label7.Caption=Колоне   ' + #13#10 +
      'Label8.Caption=Број' + #13#10 +
      'Label15.Caption=Ширина' + #13#10 +
      'Label16.Caption=Позиције' + #13#10 +
      'Label17.Caption=Остало   ' + #13#10 +
      'Label18.Caption=Дуплекс' + #13#10 +
      'PrintOnPrevCB.Caption=Штампај на претходној страни' + #13#10 +
      'MirrorMarginsCB.Caption=Симетричне маргине' + #13#10 +
      'LargeHeightCB.Caption=Већа висина у дизајн моду' + #13#10 +
      '');

    Add('TfrxReportDataForm',
      'Caption=Одабери датасетове Репорта' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxVarEditorForm',
      'Caption=Измена променљивих' + #13#10 +
      'NewCategoryB.Caption=Категорија' + #13#10 +
      'NewVarB.Caption=Променљива' + #13#10 +
      'EditB.Caption=Измена' + #13#10 +
      'DeleteB.Caption=Обриши' + #13#10 +
      'EditListB.Caption=Листа' + #13#10 +
      'LoadB.Caption=Учитај' + #13#10 +
      'SaveB.Caption=Сачувај' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'ExprPanel.Caption= Израз:' + #13#10 +
      'OpenDialog1.Filter=Речник (*.fd3)|*.fd3' + #13#10 +
      'SaveDialog1.Filter=Речник (*.fd3)|*.fd3' + #13#10 +
      '');
    Add('vaNoVar', '(нема дефинисаних променљивих)');
    Add('vaVar', 'Променљиве');
    Add('vaDupName', 'Дупло име');

    Add('TfrxOptionsEditor',
      'Caption=Опције дизајнера' + #13#10 +
      'Label1.Caption=Мрежа   ' + #13#10 +
      'Label2.Caption=Тип' + #13#10 +
      'Label3.Caption=Величина' + #13#10 +
      'Label4.Caption=Дијалог Форма:' + #13#10 +
      'Label5.Caption=Остало   ' + #13#10 +
      'Label6.Caption=Фонт   ' + #13#10 +
      'Label7.Caption=Прозор кода' + #13#10 +
      'Label8.Caption=Мемо едитор' + #13#10 +
      'Label9.Caption=Величина' + #13#10 +
      'Label10.Caption=Величина' + #13#10 +
      'Label11.Caption=Боје   ' + #13#10 +
      'Label12.Caption=Простор између бандова:' + #13#10 +
      'Label13.Caption=цм' + #13#10 +
      'Label14.Caption=ин' + #13#10 +
      'Label15.Caption=пт' + #13#10 +
      'Label16.Caption=пт' + #13#10 +
      'Label17.Caption=пт' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'CMRB.Caption=Центиметри:' + #13#10 +
      'InchesRB.Caption=Инчи:' + #13#10 +
      'PixelsRB.Caption=Пиксели:' + #13#10 +
      'ShowGridCB.Caption=Прикажи мрежу' + #13#10 +
      'AlignGridCB.Caption=Поравњај на мрежу' + #13#10 +
      'EditAfterInsCB.Caption=Прикажи едитор после инсерта' + #13#10 +
      'ObjectFontCB.Caption=Користи подешавања фонта објекта' + #13#10 +
      'WorkspaceB.Caption=Радни простор' + #13#10 +
      'ToolB.Caption=Алатни прозори' + #13#10 +
      'LCDCB.Caption=LCD боја мреже' + #13#10 +
      'FreeBandsCB.Caption=Слободан положај бендова' + #13#10 +
      'DropFieldsCB.Caption=Show drop-down fields list' + #13#10 +
      'StartupCB.Caption=Show startup screen' + #13#10 +
      'RestoreDefaultsB.Caption=Врати стандардно' + #13#10 +
      'BandsCaptionsCB.Caption=Прикажи наслове бендова' + #13#10 +
      '');

    Add('TfrxDataBandEditorForm',
      'Caption=Одабери датасет' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');
    Add('dbNotAssigned', '[није додељен]');
    Add('dbSingleЛинија', 'Један ред');

    Add('TfrxGroupEditorForm',
      'Caption=Група' + #13#10 +
      'BreakOnL.Caption=Разломи на   ' + #13#10 +
      'OptionsL.Caption=Опције   ' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'DataFieldRB.Caption=Поље података' + #13#10 +
      'ExpressionRB.Caption=Израз' + #13#10 +
      'KeepGroupTogetherCB.Caption=Држи групе заједно' + #13#10 +
      'StartNewPageCB.Caption=Почни нову страну' + #13#10 +
      'OutlineCB.Caption=Прикажи у хијерархији' + #13#10 +
      '');

    Add('TfrxSysMemoEditorForm',
      'Caption=Системски мемо' + #13#10 +
      'DataBandL.Caption=Банд података' + #13#10 +
      'DataSetL.Caption=Датасет' + #13#10 +
      'DataFieldL.Caption=Датапоље' + #13#10 +
      'FunctionL.Caption=Функција' + #13#10 +
      'ExpressionL.Caption=Израз' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'AggregateRB.Caption=Агрегатна вредност' + #13#10 +
      'SysVariableRB.Caption=Системска променљива' + #13#10 +
      'CountInvisibleCB.Caption=Броји невидљиве бендове' + #13#10 +
      'TextRB.Caption=Текст' + #13#10 +
      'RunningTotalCB.Caption=Покренуто укупно' + #13#10 +
      '');
    Add('agAggregate', 'Убаци Агрегат');
    Add('vt1', '[ДАТУМ]');
    Add('vt2', '[ВРЕМЕ]');
    Add('vt3', '[СТРАНА#]');
    Add('vt4', '[УКУПНОСТРАНА#]');
    Add('vt5', '[СТРАНА#] од [УКУПНОСТРАНА#]');
    Add('vt6', '[ЛИНИЈА#]');

    Add('TfrxOleEditorForm',
      'Caption=OLE објекат' + #13#10 +
      'InsertB.Caption=Убаци...' + #13#10 +
      'EditB.Caption=Измени...' + #13#10 +
      'CloseB.Caption=Затвори' + #13#10 +
      '');
    Add('olStretched', 'Развучен');

    Add('TfrxBarcodeEditorForm',
      'Caption=Баркод едитор' + #13#10 +
      'CodeLbl.Caption=Код' + #13#10 +
      'TypeLbl.Caption=ТИп Бара' + #13#10 +
      'ZoomLbl.Caption=Зум:' + #13#10 +
      'OptionsLbl.Caption=Опције   ' + #13#10 +
      'RotationLbl.Caption=Ротација   ' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CalcCheckSumCB.Caption=Израчунај чексуму ' + #13#10 +
      'ViewTextCB.Caption=Текст' + #13#10 +
      'Rotation0RB.Caption=0°' + #13#10 +
      'Rotation90RB.Caption=90°' + #13#10 +
      'Rotation180RB.Caption=180°' + #13#10 +
      'Rotation270RB.Caption=270°' + #13#10 +
      '');
    Add('bcCalcChecksum', 'Калк ЧекСуму');
    Add('bcShowText', 'Прикажи текст');

    Add('TfrxAliasesEditorForm',
      'Caption=Измени алијасе' + #13#10 +
      'HintL.Caption=Притисните Ентер да измените ставку' + #13#10 +
      'DSAliasL.Caption=Алиас датасета' + #13#10 +
      'FieldAliasesL.Caption=Алиаси поља' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'ResetB.Caption=Ресет' + #13#10 +
      'UpdateB.Caption=Update' + #13#10 +
      '');
    Add('alUserName', 'Корисничко име');
    Add('alOriginal', 'Оригинално име');

    Add('TfrxParamsEditorForm',
      'Caption=Едитор параметара' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');
    Add('qpName', 'Име');
    Add('qpDataType', 'Тип података');
    Add('qpValue', 'Вредност');

    Add('TfrxMDEditorForm',
      'Caption=Мастер-Детаљи веза' + #13#10 +
      'Label1.Caption=Поља Детаља' + #13#10 +
      'Label2.Caption=Поља Мастера' + #13#10 +
      'Label3.Caption=Повезана поља' + #13#10 +
      'AddB.Caption=Додај' + #13#10 +
      'ClearB.Caption=Очисти' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxMemoEditorForm',
      'Caption=Мемо' + #13#10 +
      'ExprB.Hint=Убаци израз' + #13#10 +
      'AggregateB.Hint=Убаци Агрегат' + #13#10 +
      'LocalFormatB.Hint=Убаци форматирање' + #13#10 +
      'WordWrapB.Hint=Прелом линија' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');

    Add('TfrxPictureEditorForm',
      'Caption=Слика' + #13#10 +
      'LoadB.Hint=Учитај' + #13#10 +
      'CopyB.Hint=Копирај' + #13#10 +
      'PasteB.Hint=Уметни' + #13#10 +
      'ClearB.Hint=Очисти' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');
    Add('piEmpty', 'Празан');

    Add('TfrxChartEditorForm',
      'Caption=Едитор Графикона' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Cancel' + #13#10 +
      'AddB.Hint=Додај серије' + #13#10 +
      'DeleteB.Hint=Обриши серије' + #13#10 +
      'DBSourceRB.Caption=Подаци из ДБ' + #13#10 +
      'BandSourceRB.Caption=Band source' + #13#10 +
      'FixedDataRB.Caption=Фиксни подаци' + #13#10 +
      'DatasetLbl.Caption=Датасет' + #13#10 +
      'BandLbl.Caption=Data band' + #13#10 +
      'X1Lbl.Caption=X Вредности' + #13#10 +
      'Y1Lbl.Caption=Y Вредности' + #13#10 +
      'X2Lbl.Caption=X Вредности' + #13#10 +
      'Y2Lbl.Caption=Y Вредности' + #13#10 +
      'X3Lbl.Caption=X Вредности (на пример, a;b;c)' + #13#10 +
      'Y3Lbl.Caption=Y Вредности (на пример, 1;2;3.5;5)' + #13#10 +
      'OtherLbl.Caption=Остале опције   ' + #13#10 +
      'ShowTopLbl.Caption=TopN Вредности' + #13#10 +
      'CaptionLbl.Caption=TopN Наслов' + #13#10 +
      'SortLbl.Caption=Сортирање' + #13#10 +
      'LineMI.Caption=Линија' + #13#10 +
      'AreaMI.Caption=Област' + #13#10 +
      'PointMI.Caption=Тачка' + #13#10 +
      'BarMI.Caption=Бар' + #13#10 +
      'HorizBarMI.Caption=Хориз. бар' + #13#10 +
      'PieMI.Caption=Пита' + #13#10 +
      'GanttMI.Caption=Гант' + #13#10 +
      'FastLineMI.Caption=Брза линија' + #13#10 +
      '');
    Add('ch3D', '3Д поглед');
    Add('chAxis', 'Прикажи осе');
    Add('chsoNone', 'Ништа');
    Add('chsoAscending', 'Растуће');
    Add('chsoDescending', 'Опадајуће');

    Add('TfrxRichEditorForm',
      'Caption=Рич Едитор' + #13#10 +
      'OpenB.Hint=Отвори фајл' + #13#10 +
      'SaveB.Hint=Сачувај фајл' + #13#10 +
      'UndoB.Hint=Врати' + #13#10 +
      'TTB.Hint=Фонт' + #13#10 +
      'ExprB.Hint=Убаци израз' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      'BoldB.Hint=Болд' + #13#10 +
      'ItalicB.Hint=Искошено' + #13#10 +
      'UnderlineB.Hint=Подвучено' + #13#10 +
      'LeftAlignB.Hint=Лево поравнање' + #13#10 +
      'CenterAlignB.Hint=Центрирано' + #13#10 +
      'RightAlignB.Hint=Десно поравнање' + #13#10 +
      'BlockAlignB.Hint=Поравнање на обе ивице' + #13#10 +
      'BulletsB.Hint=Тачкице' + #13#10 +
      '');

    Add('TfrxCrossEditorForm',
      'Caption=Крос-Таб Едитор' + #13#10 +
      'DatasetL.Caption=Извор података   ' + #13#10 +
      'DimensionsL.Caption=Димензије   ' + #13#10 +
      'RowsL.Caption=Редови' + #13#10 +
      'ColumnsL.Caption=Колоне' + #13#10 +
      'CellsL.Caption=Ћелије' + #13#10 +
      'StructureL.Caption=Крос-Таб Структура   ' + #13#10 +
      'RowHeaderCB.Caption=Заглавље реда' + #13#10 +
      'ColumnHeaderCB.Caption=Заглавље колоне' + #13#10 +
      'RowTotalCB.Caption=Укупни тотал реда' + #13#10 +
      'ColumnTotalCB.Caption=Укупни тотал колоне' + #13#10 +
      'SwapB.Hint=Замени редове/колоне' + #13#10 +
      'StyleCB.Hint=Крос-Таб стил' + #13#10 +
      'FontB.Hint=Подешавања фонта' + #13#10 +
      'AlignLeftB.Hint=Поравнање Лево' + #13#10 +
      'AlignCenterB.Hint=Поравнање Центар' + #13#10 +
      'AlignRightB.Hint=Поравнање Десно' + #13#10 +
      'RotationB.Hint=Ротација текста' + #13#10 +
      'HighlightB.Hint=Обележавање' + #13#10 +
      'FormatB.Hint=Формат' + #13#10 +
      'FrameB.Hint=Подешавање оквира' + #13#10 +
      'FillColorB.Hint=Боја попуне' + #13#10 +
      'Func1MI.Caption=Ништа' + #13#10 +
      'Func2MI.Caption=Сума' + #13#10 +
      'Func3MI.Caption=Мин' + #13#10 +
      'Func4MI.Caption=Макс' + #13#10 +
      'Func5MI.Caption=Просек' + #13#10 +
      'Func6MI.Caption=Број' + #13#10 +
      'Sort1MI.Caption=Растуће (A-Ш)' + #13#10 +
      'Sort2MI.Caption=Опадајуће (Ш-A)' + #13#10 +
      'Sort3MI.Caption=Без сорта' + #13#10 +
      'BoldMI.Caption=Болд' + #13#10 +
      'ItalicMI.Caption=Италик' + #13#10 +
      'UnderlineMI.Caption=Подвучено' + #13#10 +
      'SuperScriptMI.Caption=СуперСкрипт' + #13#10 +
      'SubScriptMI.Caption=СубСкрипт' + #13#10 +
      'CondensedMI.Caption=Кондензовано' + #13#10 +
      'WideMI.Caption=Широко' + #13#10 +
      'N12cpiMI.Caption=12 cpi' + #13#10 +
      'N15cpiMI.Caption=15 cpi' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');
    Add('crSubtotal', 'СубТотал');
    Add('crNone', 'Ништа');
    Add('crSum', 'Сума');
    Add('crMin', 'Мин');
    Add('crMax', 'Макс');
    Add('crAvg', 'Прос');
    Add('crCount', 'Број');
    Add('crAsc', 'A-Ш');
    Add('crDesc', 'Ш-A');
    Add('crFillMx', 'Попуњавам Крос-таб...');
    Add('crBuildMx', 'Правим Крос-таб...');
    Add('crRepHdrs', 'Прештампавање заглавља');
    Add('crBorder', 'Оквир');
    Add('crDown', 'Доле онда преко');

    Add('TfrxExprEditorForm',
      'Caption=Едитор израза' + #13#10 +
      'ExprL.Caption=Израз:' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxFormatEditorForm',
      'Caption=Формат приказа' + #13#10 +
      'CategoryL.Caption=Категорија' + #13#10 +
      'FormatL.Caption=Формат' + #13#10 +
      'FormatStrL.Caption=Формат текста:' + #13#10 +
      'SeparatorL.Caption=Децимална тачка:' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');
    Add('fkText', 'Текст (неформатиран)');
    Add('fkNumber', 'Број');
    Add('fkDateTime', 'Датум/Time');
    Add('fkBoolean', 'Логичка');
    Add('fkNumber1', '1234.5;%g');
    Add('fkNumber2', '1234.50;%2.2f');
    Add('fkNumber3', '1,234.50;%2.2n');
    Add('fkNumber4', '$1,234.50;%2.2m');
    Add('fkDateTime1', '11.28.2002;mm.dd.yyyy');
    Add('fkDateTime2', '28 nov 2002;dd mmm yyyy');
    Add('fkDateTime3', 'Новембар 28, 2002;mmmm dd, yyyy');
    Add('fkDateTime4', '02:14;hh:mm');
    Add('fkDateTime5', '02:14am;hh:mm am/pm');
    Add('fkDateTime6', '02:14:00;hh:mm:ss');
    Add('fkDateTime7', '02:14am, Новембар 28, 2002;hh:mm am/pm, mmmm dd, yyyy');
    Add('fkBoolean1', '0,1;0,1');
    Add('fkBoolean2', 'Не,Да;Не,Да');
    Add('fkBoolean3', '_,x;_,x');
    Add('fkBoolean4', 'Нетачно,Тачно;Нетачно,Тачно');

    Add('TfrxHighlightEditorForm',
      'Caption=Highlight' + #13#10 +
      'FontColorB.Caption=Боја...' + #13#10 +
      'BackColorB.Caption=Боја...' + #13#10 +
      'ConditionL.Caption=Услов   ' + #13#10 +
      'FontL.Caption=Фонт   ' + #13#10 +
      'BackgroundL.Caption=Позадина   ' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'BoldCB.Caption=Курзив' + #13#10 +
      'ItalicCB.Caption=Искошено' + #13#10 +
      'UnderlineCB.Caption=Подвучено' + #13#10 +
      'TransparentRB.Caption=Провидност' + #13#10 +
      'OtherRB.Caption=Остало' + #13#10 +
      '');

    Add('TfrxReportEditorForm',
      'Caption=Подешавања Репорта' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GeneralTS.Caption=Уопштено' + #13#10 +
      'ReportSettingsL.Caption=Подешавања штампача   ' + #13#10 +
      'CopiesL.Caption=Копије' + #13#10 +
      'GeneralL.Caption=Уопштено   ' + #13#10 +
      'PasswordL.Caption=Лозинка' + #13#10 +
      'CollateCB.Caption=Поређај копије' + #13#10 +
      'DoublePassCB.Caption=Дупли пролаз' + #13#10 +
      'PrintIfEmptyCB.Caption=Штампај ако је празно' + #13#10 +
      'DescriptionTS.Caption=Опис' + #13#10 +
      'NameL.Caption=Назив' + #13#10 +
      'Description1L.Caption=Опис' + #13#10 +
      'PictureL.Caption=Слика' + #13#10 +
      'AuthorL.Caption=Аутор' + #13#10 +
      'MajorL.Caption=Главна' + #13#10 +
      'MinorL.Caption=Минор' + #13#10 +
      'ReleaseL.Caption=Издање' + #13#10 +
      'BuildL.Caption=Подиздање' + #13#10 +
      'CreatedL.Caption=Креиран' + #13#10 +
      'ModifiedL.Caption=Измењен' + #13#10 +
      'DescriptionL.Caption=Опис   ' + #13#10 +
      'VersionL.Caption=Верзија   ' + #13#10 +
      'PictureB.Caption=Одреди...' + #13#10 +
      '');
    Add('rePrnOnPort', 'на');

    Add('TfrxStringsEditorForm',
      'Caption=Линије' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');

    Add('TfrxSQLEditorForm',
      'Caption=SQL' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');

    Add('TfrxPasswordForm',
      'Caption=Лозинка' + #13#10 +
      'PasswordL.Caption=Униси лозинку:' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxStyleEditorForm',
      'Caption=Едитор стила' + #13#10 +
      'ColorB.Caption=Боја...' + #13#10 +
      'FontB.Caption=Фонт...' + #13#10 +
      'FrameB.Caption=Оквир...' + #13#10 +
      'AddB.Hint=Додај' + #13#10 +
      'DeleteB.Hint=Обриши' + #13#10 +
      'EditB.Hint=Измена' + #13#10 +
      'LoadB.Hint=Учитај' + #13#10 +
      'SaveB.Hint=Сачувај' + #13#10 +
      'CancelB.Hint=Одустани' + #13#10 +
      'OkB.Hint=У реду' + #13#10 +
      '');

    Add('TfrxFrameEditorForm',
      'Caption=Едитор оквира' + #13#10 +
      'FrameL.Caption=Оквир' + #13#10 +
      'LineL.Caption=Линија Оквира' + #13#10 +
      'ShadowL.Caption=Сенка' + #13#10 +
      'FrameTopB.Hint=Линија Горе' + #13#10 +
      'FrameBottomB.Hint=Линија Доле' + #13#10 +
      'FrameLeftB.Hint=Линија Лево' + #13#10 +
      'FrameRightB.Hint=Линија Десно' + #13#10 +
      'FrameAllB.Hint=Све линије оквира' + #13#10 +
      'FrameNoB.Hint=Без оквира' + #13#10 +
      'FrameColorB.Hint=Боја оквира' + #13#10 +
      'FrameStyleB.Hint=Стил оквира' + #13#10 +
      'FrameWidthCB.Hint=Ширина оквира' + #13#10 +
      'ShadowB.Hint=Сенка' + #13#10 +
      'ShadowColorB.Hint=Боја сенке' + #13#10 +
      'ShadowWidthCB.Hint=Ширина сенке' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxNewItemForm',
      'Caption=Нова ставка' + #13#10 +
      'ItemsTab.Caption=Ставке' + #13#10 +
      'TemplatesTab.Caption=Шаблони' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxTabOrderEditorForm',
      'Caption=Редослед' + #13#10 +
      'Label1.Caption=Контроле по редоследу:' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'UpB.Caption=Помери навише' + #13#10 +
      'DownB.Caption=Помери наниже' + #13#10 +
      '');

    Add('TfrxEvaluateForm',
      'Caption=Пробај' + #13#10 +
      'Label1.Caption=Израз' + #13#10 +
      'Label2.Caption=Резултат' + #13#10 +
      '');

    Add('TfrxStdWizardForm',
      'Caption=Чаробњак извештаја' + #13#10 +
      'DataTab.Caption=Подаци' + #13#10 +
      'GroupsTab.Caption=Групе' + #13#10 +
      'LayoutTab.Caption=Изглед' + #13#10 +
      'StyleTab.Caption=Стил' + #13#10 +
      'Step1L.Caption=Корак 1. Одабери датасет и поља за приказ.' + #13#10 +
      'Step2L.Caption=Корак 2. Креирај групе (опционо).' + #13#10 +
      'Step3L.Caption=Корак 3. Дефиниши оријентацију и изглед стране.' + #13#10 +
      'Step4L.Caption=Корак 4. Одабери стил Репорта.' + #13#10 +
      'AddFieldB.Caption=Додај >' + #13#10 +
      'AddAllFieldsB.Caption=Додај све >>' + #13#10 +
      'RemoveFieldB.Caption=< Уклони' + #13#10 +
      'RemoveAllFieldsB.Caption=<< Уклони све' + #13#10 +
      'AddGroupB.Caption=Додај >' + #13#10 +
      'RemoveGroupB.Caption=< Уклони' + #13#10 +
      'SelectedFieldsL.Caption=Одабрана поља:' + #13#10 +
      'AvailableFieldsL.Caption=Доступна поља:' + #13#10 +
      'GroupsL.Caption=Групе:' + #13#10 +
      'OrientationL.Caption=Оријентација   ' + #13#10 +
      'LayoutL.Caption=Изглед   ' + #13#10 +
      'PortraitRB.Caption=Усправно' + #13#10 +
      'LandscapeRB.Caption=Хоризонтално' + #13#10 +
      'TabularRB.Caption=Табулар' + #13#10 +
      'ColumnarRB.Caption=Колонски' + #13#10 +
      'FitWidthCB.Caption=Уклопи поља на ширину стране' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'BackB.Caption=<< Назад' + #13#10 +
      'NextB.Caption=Напред >>' + #13#10 +
      'FinishB.Caption=Крај' + #13#10 +
      '');
    Add('wzStd', 'Стандардни чаробњак');
    Add('wzDMP', 'Чаробњак за матрични');
    Add('wzStdEmpty', 'Стандардни Репорт');
    Add('wzDMPEmpty', 'Репорт за матриични');


    Add('ftAllFiles', 'Сви фајлови');
    Add('ftPictures', 'Слике');
    Add('ftDB', 'Базе података');
    Add('ftRichFile', 'RichText фајл');
    Add('ftTextFile', 'Текст фајл');

    Add('prNotAssigned', '(Није додељен)');
    Add('prInvProp', 'Неисправна вредност особине');
    Add('prDupl', 'Дупло име');
    Add('prPict', '(Слика)');

    Add('mvExpr', 'Дозволи изразе');
    Add('mvStretch', 'Развуци');
    Add('mvStretchToMax', 'Развуци на максималну висину');
    Add('mvShift', 'Помери');
    Add('mvShiftOver', 'Помери при преклапању');
    Add('mvVisible', 'Видљив');
    Add('mvPrintable', 'ШтампаСе');
    Add('mvFont', 'Фонт...');
    Add('mvFormat', 'Формат Приказа...');
    Add('mvClear', 'Обриши садржај');
    Add('mvAutoWidth', 'Ауто Ширина');
    Add('mvWWrap', 'Прелом речи');
    Add('mvSuppress', 'Не приказуј поновљене вредности');
    Add('mvHideZ', 'Сакриј нуле');
    Add('mvHTML', 'Дозволи HTML Тагове');
    Add('lvDiagonal', 'Дијагонално');
    Add('pvAutoВеличина', 'Ауто Величина');
    Add('pvCenter', 'Центар');
    Add('pvAspect', 'Држи пропорцију');
    Add('bvSplit', 'Дозволи поделу');
    Add('bvKeepChild', 'Држи децу заједно');
    Add('bvPrintChild', 'Штампај дете ако је невидљиво');
    Add('bvStartPage', 'Почни нову страну');
    Add('bvPrintIfEmpty', 'Штампај ако су детаљи празни');
    Add('bvKeepDetail', 'Држи детаље заједно');
    Add('bvKeepFooter', 'Држи подножје заједно');
    Add('bvReprint', 'Штампај и на новој страни');
    Add('bvOnFirst', 'Штампај на првој страни');
    Add('bvOnLast', 'Штампај на последњој страни');
    Add('bvKeepGroup', 'Држи заједно');
    Add('bvFooterAfterEach', 'Подножје после сваког реда');
    Add('srParent', 'Штампај на Родитељу');
    Add('bvKeepHeader', 'Keep Header Together');

    Add('obCatDraw', 'Цртање');
    Add('obCatOther', 'Остали објекти');
    Add('obCatOtherControls', 'Остале контроле');
    Add('obDiagЛинија', 'Дијаг. Линија');
    Add('obRect', 'Правоугаоник');
    Add('obRoundRect', 'Заокругљен Прав.');
    Add('obEllipse', 'Елипса');
    Add('obTrian', 'Троугао');
    Add('obDiamond', 'Дијамант');
    Add('obLabel', 'Лабел контрола');
    Add('obEdit', 'Едит контрола');
    Add('obMemoC', 'Мемо контрола');
    Add('obButton', 'Дугме контрола');
    Add('obChBoxC', 'ЧекБокс контрола');
    Add('obRButton', 'РадиоДугме контрола');
    Add('obLBox', 'Листа контрола');
    Add('obCBox', 'комбоБокс контрола');
    Add('obDateEdit', 'ДатумЕдит контрола');
    Add('obImageC', 'Слика контрола');
    Add('obPanel', 'Панел контрола');
    Add('obGrBox', 'ГрупБокс контрола');
    Add('obBBtn', 'БитДугме контрола');
    Add('obSBtn', 'СпидДугме контрола');
    Add('obMEdit', 'МаскЕдит контрола');
    Add('obChLB', 'ЧекЛист контрола');
    Add('obDBLookup', 'DBLookupComboBox контрола');
    Add('obBevel', 'Bevel објекат');
    Add('obShape', 'Облик објекат');
    Add('obText', 'Текст објекат');
    Add('obSysText', 'Систем text');
    Add('obЛинија', 'Линија објекат');
    Add('obPicture', 'Слика објекат');
    Add('obBand', 'Бенд објекат');
    Add('obDataBand', 'Бенд података');
    Add('obSubRep', 'Субрепорт објекат');
    Add('obDlgPage', 'Дијалог форма');
    Add('obRepPage', 'Страна репорта');
    Add('obReport', 'Репорт објекат');
    Add('obRich', 'RichText објекат');
    Add('obOLE', 'OLE објекат');
    Add('obChBox', 'ЧекБокс објекат');
    Add('obChart', 'График објекат');
    Add('obBarC', 'Баркод објекат');
    Add('obCross', 'Крос-Таб објекат');
    Add('obDBCross', 'ДБ Крос-Таб објекат');
    Add('obGrad', 'Градијент објекат');
    Add('obDMPText', 'Матрични текст објекат');
    Add('obDMPЛинија', 'Матрична линија објекат');
    Add('obBDEDB', 'BDE база података');
    Add('obBDETb', 'BDE Табела');
    Add('obBDEQ', 'BDE Query');
    Add('obBDEComps', 'BDE компоненте');
    Add('obIBXDB', 'IBX база');
    Add('obIBXTb', 'IBX Табела');
    Add('obIBXQ', 'IBX Query');
    Add('obIBXComps', 'IBX Компоненте');
    Add('obADODB', 'ADO База');
    Add('obADOTb', 'ADO Табела');
    Add('obADOQ', 'ADO Query');
    Add('obADOComps', 'ADO Компоненте');
    Add('obDBXDB', 'DBX База');
    Add('obDBXTb', 'DBX Табела');
    Add('obDBXQ', 'DBX Query');
    Add('obDBXComps', 'DBX Компоненте');

    Add('ctString', 'Текст');
    Add('ctDate', 'Датум и време');
    Add('ctConv', 'Конверзије');
    Add('ctFormat', 'Форматирање');
    Add('ctMath', 'Математичке');
    Add('ctOther', 'Остало');

    Add('IntToStr', 'Конвертује целобројну вредност у текст');
    Add('FloatToStr', 'Конверује број у текст');
    Add('DateToStr', 'Конверује датум у текст');
    Add('TimeToStr', 'Конверује време у текст');
    Add('DateTimeToStr', 'Конверује датум и време у текст');
    Add('VarToStr', 'Конверује варијант вредност у текст');
    Add('StrToInt', 'Конверује текст у целобројну вредност');
    Add('StrToFloat', 'Конверује текст у реалну бројчану вредност');
    Add('StrToDate', 'Конверује текст у датум');
    Add('StrToTime', 'Конверује текст у време');
    Add('StrToDateTime', 'Конверује текст у датум и време');
    Add('Format', 'Враћа formatted string assembled from a series of array arguments');
    Add('FormatFloat', 'Форматира реалну вредност');
    Add('FormatDateTime', 'Форматира датум и време');
    Add('FormatMaskText', 'Враћа текст орматиран преко едит маске');
    Add('EncodeDate', 'Враћа тип ДатумВреме за дату Годину, Месец, и Дан');
    Add('DecodeDate', 'Раздваја ДатумВреме у Годину, Месец, и Дан');
    Add('EncodeTime', 'Враћа тип ДатумВреме за дате Сате, Мин, Сек, и МСек');
    Add('DecodeTime', 'раздваја ДатумВреме у сате, минуте, секунде, и милисекунде');
    Add('Date', 'Враћа тренутни датум');
    Add('Time', 'Враћа тренутно време');
    Add('Now', 'Враћа тренутни датум и време');
    Add('DayOfWeek', 'Враћа дан у недељи за наведени датум');
    Add('IsLeapYear', 'Одређује да ли је одређена година преступна');
    Add('DaysInMonth', 'Враћа број дана у наведеном месецу');
    Add('Length', 'Враћа дужину текста');
    Add('Copy', 'Враћа део текста у тексту');
    Add('Pos', 'Враћа позицију дела текста у тексту');
    Add('Delete', 'Уклања део текста из текста');
    Add('Insert', 'Убацује део текста у текст');
    Add('Uppercase', 'Конвертује све карактере у тексту у велика слова');
    Add('Lowercase', 'Конвертује све карактере у тексту у мала слова');
    Add('Trim', 'Уклања водеће и пратеће празнине из текста');
    Add('NameCase', 'Конвертује прва слова у речима у велика слова');
    Add('CompareText', 'Упоређује два текста');
    Add('Chr', 'Конвертује целобројну вредност у знак');
    Add('Ord', 'Конвертује знак у целобројну вредност');
    Add('SetLength', 'Поставља дужину стринга');
    Add('Round', 'Заокружује вредност на најближи цео број');
    Add('Trunc', 'Одсеца број на целобројну вредност');
    Add('Int', 'Враћа целобројни део реалног броја');
    Add('Frac', 'Враћа разломљени део реалног броја');
    Add('Sqrt', 'Враћа квадратни корен одређеног броја');
    Add('Abs', 'Враћа апсолутну вредност');
    Add('Sin', 'Враћа синус угла (у радијанима)');
    Add('Cos', 'Враћа косинус угла (у радијанима)');
    Add('ArcTan', 'Враћа аркус тангенс');
    Add('Tan', 'Враћа тангенс');
    Add('Exp', 'Враћа експонент');
    Add('Ln', 'Враћа природни логаритам реалног израза');
    Add('Pi', 'Враћа 3.1415926... број');
    Add('Inc', 'Повећава вредност');
    Add('Dec', 'Смањује вредност');
    Add('RaiseException', 'Приказује грешку-изузетак');
    Add('ShowMessage', 'Приказује поруку');
    Add('Randomize', 'Стартује генератор случајних бројева');
    Add('Random', 'Враћа случајни број');
    Add('ValidInt', 'Враћа Тачно ако дати текст садржи исправну целобројну вредност');
    Add('ValidFloat', 'Враћа Тачно ако наведени стринг садржи децимални број');
    Add('ValidDate', 'Враћа Тачно ако наведени стринг садржи исправан датум');
    Add('IIF', 'Враћа ТачнуВедност ако је Expr Тачна, иначе враћа FalseValue');
    Add('Get', 'За интерну употребу');
    Add('Set', 'За интерну употребу');
    Add('InputBox', 'Приказује дијалог за унос који кориснику омогућава да унесе текст');
    Add('InputQuery', 'Приказује дијалог за унос који кориснику омогућава да унесе текст');
    Add('MessageDlg', 'Приказује поруку');
    Add('CreateOleObject', 'Креира OLE објекат');
    Add('VarArrayCreate', 'Креира варијант низ');
    Add('VarType', 'Враћа тип варијантне вредности');
    Add('DayOf', 'Returns day number (1..31) of given Date');
    Add('MonthOf', 'Returns month number (1..12) of given Date');
    Add('YearOf', 'Returns year of given Date');

    Add('ctAggregate', 'Aggregate');
    Add('Sum', 'Calculates the sum of the Expr for the Band datarow');
    Add('Avg', 'Calculates the average of the Expr for the Band datarow');
    Add('Min', 'Calculates the minimum of the Expr for the Band datarow');
    Add('Max', 'Calculates the maximum of the Expr for the Band datarow');
    Add('Count', 'Calculates the number of datarows');
  end;
end;


initialization
  frAddDesignerRes;

end.