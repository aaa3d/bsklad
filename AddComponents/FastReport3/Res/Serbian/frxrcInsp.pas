
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
    Add('propActive', 'Одређује да ли је датасет отворен или није');
    Add('propActive.TfrxHighlight', 'Одређује да ли је наглашавање активно или није');
    Add('propAliasName', 'Назив BDE алиаса');
    Add('propAlign', 'Одређује поравнање објекта релативно у односу на бенд или страну');
    Add('propAlignment', 'Поравнање текста објекта');
    Add('propAllowAllUp', 'Одређује када сви дугмићи у групи могу бити деселектовани истовремено');
    Add('propAllowEdit', 'Одређује када корисник може да мења припремљене стране извештаја');
    Add('propAllowExpressions', 'Одређује када текст објекат може да садржи изразе у тексту');
    Add('propAllowGrayed', 'Дозвољава посивљено стање чекбоксова');
    Add('propAllowHTMLTags', 'Одређује да ли текст објекат може да садржи HTML тагове унутар текста');
    Add('propAllowSplit', 'Одређује да ли банд може да дели свој садржај на више страна');
    Add('propAuthor', 'Аутор репорта');
    Add('propAutoSize', 'Одређује да ли слика треба да одређује своју величину аутоматски');
    Add('propAutoWidth', 'Одређује да ли текст објекат треба да одређује своју ширину аутоматски');
    Add('propBackPicture', 'Позадинска слика стране');
    Add('propBarType', 'Тип баркода');
    Add('propBevelInner', 'Тип унутрашњег бевела');
    Add('propBevelOuter', 'Тип спољашњег бевела');
    Add('propBevelWidth', 'Ширина бевела');
    Add('propBorder', 'Одређује да ли да се оквир приказује или не');
    Add('propBorderStyle', 'Стил прозора');
    Add('propBottomMargin', 'Величина доње маргине стране');
    Add('propBrushStyle', 'Стил четке за исцртавање позадине објекта');
    Add('propButtons', 'Комплет дугмића видљивих у прозору прегледа');
    Add('propCacheSize', 'Максимална количина меморије коју користи машина репорта. Ако конзумирање меморије премаши ову вредност, припремљене стране ће бити кеширане на хард диск');
    Add('propCalcCheckSum', 'Одређује да ли баркод треба да калкулише контролну цифру аутоматски');
    Add('propCancel', 'Одређује да ли дугме може бити активирано када се притисне Esc тастер');
    Add('propCaption', 'Наслов (текст) контроле');
    Add('propCellFields', 'Називи DB поља који представљају ћелије крос репорта');
    Add('propCellLevels', 'Број нивоа ћелија');
    Add('propCenter', 'Одређује да ли слика треба да буде центрирана унутар објекта');
    Add('propCharset', 'Карактер сет Фонтова');
    Add('propCharSpacing', 'Количина пиксела између два карактера');
    Add('propCheckColor', 'Боја чек ознаке');
    Add('propChecked', 'Одређује да ли је контрола чекирана');
    Add('propCheckStyle', 'Стил чек ознаке');
    Add('propChild', 'Дете бенд конектован на овај бенд');
    Add('propCollate', 'Подразумевано подешавање колације (штамања копија)');
    Add('propColor.TFont', 'Боја текста');
    Add('propColor', 'Боја објекта');
    Add('propColor.TfrxFrame', 'Боја оквира');
    Add('propColor.TfrxHighlight', 'Одређује боју објекта ако је наглашавање активно');
    Add('propColumnFields', 'Називи DB поља која представљају крос колоне');
    Add('propColumnGap', 'Простор између бенд колона');
    Add('propColumnLevels', 'Број нивоа колона');
    Add('propColumns', 'Број колона у бенду');
    Add('propColumnWidth', 'Ширина бенд колоне');
    Add('propCondition', 'Услов груписања. Група ће се сломити ако се вредност овог израза промени');
    Add('propCondition.TfrxHighlight', 'Текст израза. Ако је овај Израз Тачан, Наглашавање (обележавање) ће се активирати');
    Add('propConnected', 'Показује да ли је конекција базе података активна');
    Add('propConvertNulls', 'Одређује да ли ће неунешене (null) DB вредности бити конвертоване у 0, Не или празан стринг');
    Add('propCopies', 'Подразумевани број копија');
    Add('propCursor', 'Курсор објекта');
    Add('propDatabaseName', 'Назив базе података');
    Add('propDataField', 'Наводи поље из којег објекат узима податке');
    Add('propDataSet', 'Повезује објекат на датасет који садржи поље које представља');
    Add('propDate', 'Датумска вредност контроле');
    Add('propDateFormat', 'Одређује формат приказа датума');
    Add('propDecimalSeparator', 'Децимални сепаратор');
    Add('propDefault', 'Одређује да ли је дугме подразумевано дугме');
    Add('propDefHeight', 'Подразумевана висина реда');
    Add('propDescription', 'Опис Репорта');
    Add('propDiagonal', 'Показује да је линија дијагонална');
    Add('propDisplayFormat', 'Формат приказане вредности');
    Add('propDoubleBuffered', 'Одређује да ли прозор прегледа користи дупло баферовање. Омогућавање дуплог баферовања спречава трептање, али је спорије');
    Add('propDoublePass', 'Одређује да ли машина репорта треба да уради други пролаз');
    Add('propDown', 'Одређује да ли је спид дугме притиснуто или не');
    Add('propDownThenAcross', 'Одређује како ће велика крос табела бити подељена на странице');
    Add('propDriverName', 'Назив BDE драјвера');
    Add('propDropShadow', 'Одређује да ли објекти имају сенку');
    Add('propDuplex', 'Одређује дуплекс мод за страну');
    Add('propEditMask', 'Представља маску која одређује који текст је исправан за маскирану едит контролу');
    Add('propEnabled', 'Одређује да ли је контрола оспособљена');
    Add('propEngineOptions', 'Опције машине репорта');
    Add('propExpression', 'Вредност овог израза ће бити приказан у објекту');
    Add('propExpressionDelimiters', 'Карактери који ће бити употребљени за завршавање израза који су садржани у тексту');
    Add('propFieldAliases', 'Алиаси поља датасета');
    Add('propFilter', 'Услов филтрирања датасета');
    Add('propFiltered', 'Одређује да ли датасет треба да исфилтрира записе коришћењем услова у Филтер особини');
    Add('propFlowTo', 'Текст објекат који ће приказивати текст који не стаје у објекат');
    Add('propFont', 'Атрибути фонта објекта');
    Add('propFooterAfterEach', 'Одређује да ли ће бенд подножја бити приказан после сваког реда података');
    Add('propFormatStr', 'Стринг форматирања');
    Add('propFrame', 'Атрибути оквира објекта');
    Add('propGapX', 'Лево одстојање текста');
    Add('propGapY', 'Горње одстојање текста');
    Add('propGlyph', 'Слика контроле');
    Add('propGroupIndex', 'Дозвољава спид дугмићи да раде заједно као група');
    Add('propHAlign', 'Хоризонтално поравнање текста');
    Add('propHeight', 'Висина објекта');
    Add('propHGuides', 'Хоризонталне линије вођице стране');
    Add('propHideZeros', 'Одређује да ли ће текст објекат да сакрива нулте вредности');
    Add('propHighlight', 'Атрибути условног наглашавања');
    Add('propIndexName', 'Назив индекса');
    Add('propInitString', 'Инит стринг штампача за матричне извештаје');
    Add('propItems', 'Лист ставке објекта');
    Add('propKeepAspectRatio', 'Задржи оригиналне пропорције слике');
    Add('propKeepChild', 'Одређује да ли ће бенд бити штампан заједно са својим дететом');
    Add('propKeepFooter', 'Одређује да ли ће бенд бити штампан заједно са својим подножјем (футером)');
    Add('propKeepHeader', 'Determines whether the band will be printed together with its header');
    Add('propKeepTogether', 'Одређује да ли ће бенд бити штампан заједно са свим својим суббендовима');
    Add('propKind.TfrxFormat', 'Врста форматирања');
    Add('propKind', 'Врста дугмета');
    Add('propLargeDesignHeight', 'Одређује да ли ће страна имати већу висину у дизајн моду');
    Add('propLayout', 'Положај сличице дугмића');
    Add('propLeft', 'Лева координата објекта');
    Add('propLeftMargin', 'Величина леве маргине');
    Add('propLines', 'Текст објекта');
    Add('propLineSpacing', 'Број пиксела између две линије текста');
    Add('propLoginPrompt', 'Одређује да ли да се прикаже логин дијалог');
    Add('propMargin', 'Одређује број пиксела измежу ивице слике и ивице дугмета');
    Add('propMaster', 'Мастер датасет');
    Add('propMasterFields', 'Поља повезана преко мастер-детаљи везе');
    Add('propMaximized', 'Одређује да ли ће прозор прегледа бити максимизован');
    Add('propMaxLength', 'Максимална дужина текста');
    Add('propMaxPages', 'Максималан број страна у припремљеном репорту');
    Add('propMaxWidth', 'Максимална ширина колоне');
    Add('propMDIChild', 'Одређује да ли ће прозор прегледа да буде MDI дете');
    Add('propMemo', 'Текст објекта');
    Add('propMinWidth', 'Минимална ширина колоне');
    Add('propMirrorMargins', 'Маргине стране као у огледалу на парним странама');
    Add('propModal', 'Одређује да ли ће прозор прегледа бити приказан модално');
    Add('propModalResult', 'Одређује да ли и како дугме затвара модалну форму');
    Add('propName.TFont', 'Назив фонта');
    Add('propName.TfrxReportOptions', 'Назив репорта');
    Add('propName', 'Назив објекта');
    Add('propNumGlyphs', 'Одређује број слика које су у Glyph особини');
    Add('propOpenDataSource', 'Одређује да ли да отвори датасет аутоматски ил не');
    Add('propOrientation', 'Оријантација стране');
    Add('propOutlineText', 'Текст који ће бити приказан у дрвцету са стране');
    Add('propOutlineVisible', 'Видљивост контроле хијерархије у прегледу');
    Add('propOutlineWidth', 'Ширина контроле хијерархије у прегледу');
    Add('propPageNumbers.TfrxPrintOptions', 'Број страна за штампу');
    Add('propPaperHeight', 'Висина стране');
    Add('propPaperWidth', 'Ширина стране');
    Add('propParagraphGap', 'Увлачење прве линије пасуса');
    Add('propParams.TfrxBDEDatabase', 'параметри конекције');
    Add('propParams', 'Параметри query-ја');
    Add('propParentFont', 'Одређује да ли ће објекат користити родитељски фонт');
    Add('propPassword', 'Лозинка репорта');
    Add('propPasswordChar', 'Одређује карактер, ако их има, за приказ на месту стварних карактера укуцаних у контроли');
    Add('propPicture', 'Слика');
    Add('propPicture.TfrxReportOptions', 'Описна слика извештаја');
    Add('propPosition', 'Иницијална позиција прозора');
    Add('propPreviewOptions', 'Опције прегледа извештаја');
    Add('propPrintable', 'могућност штампе објекта. Објекат са Printable=False ће се појавити у Прегледу, али неће бити штампан');
    Add('propPrintChildIfInvisible', 'Одређује да ли ће дете бенд бити штампан ако је његов родитељски бенд невидљив');
    Add('propPrinter', 'Назив штампача који ће бити одабран када се отвори или покрене овај репорт');
    Add('propPrintIfDetailEmpty', 'Одређује да ли ће бенд података бити одштампан ако је његов суббенд празан');
    Add('propPrintIfEmpty', 'Одређује да ли ће се страница штампати ако су сви њени датасетови празни');
    Add('propPrintOnFirstPage', 'Одређује да ли ће бенд бити штампан на првој страни');
    Add('propPrintOnLastPage', 'Одређује да ли ће бенд бити штампан на последњој страни');
    Add('propPrintOnParent', 'Одређује да ли субрепорт може да одштампа себе на родитељском банду');
    Add('propPrintOnPreviousPage', 'Одређује да ли страница може бити генерисана на слободном простору претходно генерисане стране');
    Add('propPrintOptions', 'Опције штампе за репорт');
    Add('propPrintPages', 'Одређује да ли да се штампа све, непарне или парне стране');
    Add('propRangeBegin', 'Одређује стартну тачку навигације кроз датасет');
    Add('propRangeEnd', 'Одређује крајњу тачку навигације кроз датасет');
    Add('propRangeEndCount', 'Одређује број записа у датасету ако је RangeEnd reCount');
    Add('propReadOnly', 'Одређује да ли је текст објекат само за читање');
    Add('propRepeatHeaders', 'Одређује да ли ће заглавља колона и редова бити поново штампани на новој страни');
    Add('propReportOptions', 'Опције репорта');
    Add('propReprintOnNewPage', 'Одређује да ли ће бенд  бити поново штампан на новој страни');
    Add('propRestrictions', 'Комплет рестрикционих маркера');
    Add('propRightMargin', 'Величина десне маргине стране');
    Add('propRotation.TfrxBarCodeView', 'Оријентација баркода');
    Add('propRotation', 'Ротација текста');
    Add('propRowCount', 'Број виртуелних записа у банду података');
    Add('propRowFields', 'Називи DB поља која представљају крос редове');
    Add('propRowLevels', 'Број нивоа редова');
    Add('propRTLReading', 'Одређује да ли текст објекат треба да приказује текст са десна на лево');
    Add('propScriptLanguage', 'Назив скрипт језика који је употребљен у репорту');
    Add('propSessionName', 'Назив BDE сесије');
    Add('propShadowColor', 'Боја сенке');
    Add('propShadowWidth', 'Ширина сенке');
    Add('propShape', 'Тип сенке');
    Add('propShiftMode', 'Шифт понашање објекта');
    Add('propShowCaptions', 'Одређује да ли ће дугмићи прегледа имати своје наслове');
    Add('propShowColumnHeader', 'Одређује да ли ће крос приказивати заглавља колона');
    Add('propShowColumnTotal', 'Одређује да ли ће крос приказивати гранд тотал колона');
    Add('propShowRowHeader', 'Одређује да ли ће крос приказивати заглавља редова');
    Add('propShowRowTotal', 'Одређује да ли ће крос приказивати гранд тотал редова');
    Add('propShowDialog', 'Одређује да ли ће дијалог за штампу бити приказан у прозору прегледа');
    Add('propShowText', 'Одређује да ли ће баркод објекат приказивати читак текст');
    Add('propSize', 'Величина слова');
    Add('propSorted', 'Одређује да ли су ставке сортиране');
    Add('propSpacing', 'Одређује број пиксела од слике до текста');
    Add('propSQL', 'SQL израз');
    Add('propStartNewPage', 'Почиње нову страну пре штампања бенда');
    Add('propStretch', 'Развлачи слику да се уклопи у објекат');
    Add('propStretched', 'Одређује да ли објекат може бити развлачен');
    Add('propStretchMode', 'Понашање објекта при развлачењу');
    Add('propStyle.TFont', 'Стил фонта');
    Add('propStyle', 'Стил контроле');
    Add('propStyle.TfrxFrame', 'Стил оквира објекта');
    Add('propSuppressRepeated', 'Уклањање (сакривање) поновљених вредности');
    Add('propTableName', 'Назив табеле података');
    Add('propTag', 'Таг број објекта');
    Add('propTagStr', 'Таг стринг објекта');
    Add('propText', 'Текст објекта');
    Add('propTitleBeforeHeader', 'Одређује да ли да прикаже наслов репорта пре заглавља стране');
    Add('propTop', 'Горња координата објекта');
    Add('propTopMargin', 'Величина горње маргине стране');
    Add('propTyp', 'Тип оквира');
    Add('propUnderlines', 'Одређује да ли ће текст објект да приказује линије мреже после сваке линије текста');
    Add('propURL', 'URL објекта');
    Add('propUserName', 'Корисничко име објекта података. Ово име ће бити приказано у дрвету података');
    Add('propVAlign', 'Вериткално поравнање текста');
    Add('propVersionBuild', 'Верзија Инфо, Билд');
    Add('propVersionMajor', 'Верзија Инфо, Главна верзија');
    Add('propVersionMinor', 'Верзија Инфо, Споредна верзија');
    Add('propVersionRelease', 'Верзија Инфо, Издање');
    Add('propVGuides', 'Вертикалне линије вођице стране');
    Add('propVisible', 'Видљивост објекта');
    Add('propWidth', 'Ширина објекта');
    Add('propWidth.TfrxFrame', 'Ширина Оквира');
    Add('propWindowState', 'Почетно стање прозора');
    Add('propWordBreak', 'Разломи руске речи');
    Add('propWordWrap', 'Одређује да ли ће текст објекат убацивати soft carriage returns тако да се текст слама на десној маргини');
    Add('propZoom.TfrxBarCodeView', 'Зумирање баркода');
    Add('propZoom', 'Почетни зум фактор прозора прегледа');
    Add('propZoomMode', 'Почетни зум мод прозора прегледа');
  end;
end;


initialization
  frAddInspectorRes;

end.
