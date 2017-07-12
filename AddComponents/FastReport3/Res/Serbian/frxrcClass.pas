
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
      'Caption=Преглед' + #13#10 +
      'PrintB.Caption=Штампа' + #13#10 +
      'PrintB.Hint=Штампа' + #13#10 +
      'OpenB.Caption=Отвори' + #13#10 +
      'OpenB.Hint=Отвори' + #13#10 +
      'SaveB.Caption=Сачувај' + #13#10 +
      'SaveB.Hint=Сачувај' + #13#10 +
      'ExportB.Caption=Експорт' + #13#10 +
      'ExportB.Hint=Експорт података' + #13#10 +
      'FindB.Caption=Тражи' + #13#10 +
      'FindB.Hint=Претраживање података' + #13#10 +
      'ZoomWholePageB.Caption=Цела страна' + #13#10 +
      'ZoomWholePageB.Hint=Цела страна' + #13#10 +
      'ZoomPageWidthB.Caption=Ширина стране' + #13#10 +
      'ZoomPageWidthB.Hint=Зум на ширину стране' + #13#10 +
      'Zoom100B.Caption=100%' + #13#10 +
      'Zoom100B.Hint=100%' + #13#10 +
      'Zoom50B.Caption=Две стране' + #13#10 +
      'Zoom50B.Hint=Две стране' + #13#10 +
      'ZoomCB.Hint=Зум' + #13#10 +
      'PageSettingsB.Caption=Маргине' + #13#10 +
      'PageSettingsB.Hint=Маргине' + #13#10 +
      'OutlineB.Caption=Дрвце' + #13#10 +
      'OutlineB.Hint=Дрвце' + #13#10 +
      'HandToolB.Caption=Повлачење' + #13#10 +
      'HandToolB.Hint=Алат за повлачење' + #13#10 +
      'ZoomToolB.Caption=Зум' + #13#10 +
      'ZoomToolB.Hint=Зум алат' + #13#10 +
      'NewPageB.Caption=Додај страну' + #13#10 +
      'NewPageB.Hint=Додај страну' + #13#10 +
      'DelPageB.Caption=Обриши' + #13#10 +
      'DelPageB.Hint=Обриши страну' + #13#10 +
      'DesignerB.Caption=Измена' + #13#10 +
      'DesignerB.Hint=Измена стране' + #13#10 +
      'FirstB.Caption=Прва' + #13#10 +
      'FirstB.Hint=Прва страна' + #13#10 +
      'PriorB.Caption=Претходна' + #13#10 +
      'PriorB.Hint=Претходна страна' + #13#10 +
      'NextB.Caption=Следећа' + #13#10 +
      'NextB.Hint=Следећа страна' + #13#10 +
      'LastB.Caption=Последња' + #13#10 +
      'LastB.Hint=Последња страна' + #13#10 +
      'CancelB.Caption=Затвори' + #13#10 +
      'PageE.Hint=Број стране' + #13#10 +
      '');
    Add('zmPageWidth', 'Ширина стране');
    Add('zmWholePage', 'Цела страна');

    Add('TfrxPrintDialog',
      'Caption=Print' + #13#10 +
      'Label12.Caption=Штампач   ' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна и/или опсег страна, одвојених зарезима. На пример, 1,3,5-12' + #13#10 +
      'Label1.Caption=Стране   ' + #13#10 +
      'CopiesL.Caption=Број копија' + #13#10 +
      'CollateL.Caption=Поређај' + #13#10 +
      'Label2.Caption=Копије   ' + #13#10 +
      'PrintL.Caption=Штампај' + #13#10 +
      'TypeL.Caption=Тип:' + #13#10 +
      'WhereL.Caption=Где:' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'PropButton.Caption=Особине...' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутну страну' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'FileCB.Caption=Штампај у фајл' + #13#10 +
      'ReverseCB.Caption=Обрни стране' + #13#10 +
      '');
    Add('ppAll', 'Све стране');
    Add('ppOdd', 'Непарне стране');
    Add('ppEven', 'Парне стране');

    Add('TfrxSearchDialog',
      'Caption=Нађи текст' + #13#10 +
      'TextL.Caption=Текст:' + #13#10 +
      'SearchL.Caption=Опције тражења   ' + #13#10 +
      'ReplaceL.Caption=Replace with' + #13#10 +
      'TopCB.Caption=Тражи од почетка' + #13#10 +
      'CaseCB.Caption=Величина слова' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('TfrxPageSettingsForm',
      'Caption=Подешавање стране' + #13#10 +
      'WidthL.Caption=Ширина' + #13#10 +
      'HeightL.Caption=Висина' + #13#10 +
      'SizeL.Caption=Величина   ' + #13#10 +
      'OrientationL.Caption=Оријентација   ' + #13#10 +
      'LeftL.Caption=Лево' + #13#10 +
      'TopL.Caption=Горе' + #13#10 +
      'RightL.Caption=Десно' + #13#10 +
      'BottomL.Caption=Доле' + #13#10 +
      'MarginsL.Caption=Маргине   ' + #13#10 +
      'PortraitRB.Caption=Усправно' + #13#10 +
      'LandscapeRB.Caption=Положено' + #13#10 +
      'cmL1.Caption=цм' + #13#10 +
      'cmL2.Caption=цм' + #13#10 +
      'cmL3.Caption=цм' + #13#10 +
      'cmL4.Caption=цм' + #13#10 +
      'cmL5.Caption=цм' + #13#10 +
      'cmL6.Caption=цм' + #13#10 +
      'OKB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'OtherL.Caption=Остале   ' + #13#10 +
      'ApplyToCurRB.Caption=Примени на тренутну страну' + #13#10 +
      'ApplyToAllRB.Caption=Примени на све стране' + #13#10 +
      '');

    Add('TfrxDMPExportDialog',
      'Caption=Print' + #13#10 +
      'PrinterL.Caption=Штампач   ' + #13#10 +
      'PagesL.Caption=Стране   ' + #13#10 +
      'CopiesL.Caption=Копије   ' + #13#10 +
      'CopiesNL.Caption=Број копија' + #13#10 +
      'DescrL.Caption=Enter page numbers and/or page ranges, separated by commas. For example, 1,3,5-12' + #13#10 +
      'OptionsL.Caption=Опције   ' + #13#10 +
      'EscL.Caption=Ескејп команде   ' + #13#10 +
      'OK.Caption=У реду' + #13#10 +
      'Cancel.Caption=Одустани' + #13#10 +
      'SaveToFileCB.Caption=Штампај у фајл' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутну страну' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'PageBreaksCB.Caption=Преломи страна' + #13#10 +
      'OemCB.Caption=OEM кодна страна' + #13#10 +
      'PseudoCB.Caption=Псеудографика' + #13#10 +
      'SaveDialog1.Filter=Принтер фајл (*.prn)|*.prn' + #13#10 +
      '');

    Add('TfrxProgress',
      'CancelB.Caption=Одустани' + #13#10 +
      '');

    Add('mbConfirm', 'Потврди');
    Add('mbError', 'Грешка');
    Add('mbInfo', 'Информација');
    Add('xrCantFindClass', 'Не могу да нађем класу');
    Add('prVirtual', 'Виртуал');
    Add('prDefault', 'Стандардно');
    Add('prCustom', 'Кориснички');
    Add('enUnconnHeader', 'Неповезано заглавље/подножје');
    Add('enUnconnGroup', 'Нема бенда података за групу');
    Add('enUnconnGFooter', 'Нема заглавља групе за');
    Add('enBandPos', 'Неисправна позиција бенда:');
    Add('dbNotConn', 'Датасет %s није повезан са подацима');
    Add('dbFldNotFound', 'Поље није нађено:');
    Add('clDSNotIncl', '(Датасет није укључен у Report.DataSets)');
    Add('clUnknownVar', 'Непозната променљива или поље података:');
    Add('clScrError', 'Скрипт грешка на %s: %s');
    Add('clDSNotExist', 'Датасет "%s" не постоји');
    Add('clErrors', 'Следећа грешка(е) се појавила:');
    Add('clExprError', 'Грешка у изразу');
    Add('clFP3files', 'Припремљен репорт');
    Add('clSaving', 'Памтим фајл...');
    Add('clCancel', 'Одустани');
    Add('clClose', 'Затвори');
    Add('clPrinting', 'Штампам страну');
    Add('clLoading', 'Учитавам фајл...');
    Add('clPageOf', 'Страна %d од %d');
    Add('clFirstPass', 'Први пролаз: страна ');
    Add('clNoPrinters', 'Нема инсталираних штампача на вашем систему');
    Add('clDecompressError', 'Грешка у декомпресовању стрима');

    Add('prRunningFirst', 'First pass: page %d');
    Add('prRunning', 'Preparing page %d');
    Add('prPrinting', 'Printing page %d');
    Add('prExporting', 'Exporting page %d');
    Add('uCm', 'цм');
    Add('uInch', 'ин');
    Add('uPix', 'px');
    Add('uChar', 'chr');
  end;
end;


initialization
  frAddClassesRes;

end.