
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource фајл           }
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
      'Caption=Извоз у Excel' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Подешавања извоза ' + #13#10 +
      'StylesCB.Caption=Стилови' + #13#10 +
      'PicturesCB.Caption=Слике' + #13#10 +
      'MergeCB.Caption=Споји ћелије' + #13#10 +
      'PageBreaksCB.Caption=Преломи страна' + #13#10 +
      'FastExpCB.Caption=Fast export' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'AsTextCB.Caption=As text' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Отвори Excel после извоза' + #13#10 +
      'SaveDialog1.Filter=Excel фајл (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxXMLExportDialog',
      'Caption=Извоз у Excel' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Подешавања извоза ' + #13#10 +
      'StylesCB.Caption=Стилови' + #13#10 +
      'PageBreaksCB.Caption=Преломи страна' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'OpenExcelCB.Caption=Отвори Excel после извоза' + #13#10 +
      'SaveDialog1.Filter=XML Excel фајл (*.xls)|*.xls' + #13#10 +
      'SaveDialog1.DefaultExt=.xls' + #13#10 +
      '');

    frxResources.Add('TfrxHTMLExportDialog',
      'Caption=Извоз у HTML табелу' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Подешавања извоза ' + #13#10 +
      'OpenAfterCB.Caption=Open после извоза' + #13#10 +
      'StylesCB.Caption=Стилови' + #13#10 +
      'PicturesCB.Caption=Слике' + #13#10 +
      'PicsSameCB.Caption=Све у једном фолдеру' + #13#10 +
      'FixWidthCB.Caption=Фиксна ширина' + #13#10 +
      'NavigatorCB.Caption=Навигатор страна' + #13#10 +
      'MultipageCB.Caption=Вишестрано' + #13#10 +
      'MozillaCB.Caption=Mozilla browser' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=HTML фајл (*.html)|*.html' + #13#10 +
      'SaveDialog1.DefaultExt=.html' + #13#10 +
      '');

    frxResources.Add('TfrxTXTExportDialog',
      'Caption=Извоз у текст (матрични штампач)' + #13#10 +
      'OK.Caption=У реду' + #13#10 +
      'Cancel.Caption=Одустани' + #13#10 +
      'BtnPreview.Hint=Преглед укљ/искљ' + #13#10 +
      'GroupCellProp.Caption= Особине извоза  ' + #13#10 +
      'CB_PageBreaks.Caption=Преломи страна' + #13#10 +
      'CB_OEM.Caption=OEM кодна страна' + #13#10 +
      'CB_EmptyLines.Caption=Празне линије' + #13#10 +
      'CB_LeadSpaces.Caption=Водеће празнине' + #13#10 +
      'GroupPageRange.Caption= Опсег страна  ' + #13#10 +
      'Pages.Caption=Бројеви страна' + #13#10 +
      'Descr.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример: 1,3,5-12' + #13#10 +
      'GroupScaleSettings.Caption= Скалирање ' + #13#10 +
      'ScX.Caption=X Скала' + #13#10 +
      'ScY.Caption=Y Скала' + #13#10 +
      'GroupFramesSettings.Caption= Оквири ' + #13#10 +
      'RB_NoneFrames.Caption=Ништа' + #13#10 +
      'RB_Simple.Caption=Прости' + #13#10 +
      'RB_Graph.Caption=Графика' + #13#10 +
      'RB_Graph.Hint=Само са OEM кодном страном' + #13#10 +
      'CB_PrintAfter.Caption=Штампа после извоза' + #13#10 +
      'CB_Save.Caption=Сачувај подешавања' + #13#10 +
      'GroupBox1.Caption= Преглед ' + #13#10 +
      'Label1.Caption=Ширина:' + #13#10 +
      'Label3.Caption=Висина:' + #13#10 +
      'LBPage.Caption=Страна' + #13#10 +
      'ToolButton1.Hint=Приближи' + #13#10 +
      'ToolButton2.Hint=Удаљи' + #13#10 +
      'SaveDialog1.Filter=Text фајл (матрични штампач)(*.prn)|*.prn' + #13#10 +
      'SaveDialog1.DefaultExt=.prn' + #13#10 +
      '');

    frxResources.Add('TfrxPrnInit',
      'Caption=Штампа' + #13#10 +
      'OK.Caption=У реду' + #13#10 +
      'Cancel.Caption=Одустани' + #13#10 +
      'GroupBox1.Caption=Штампач' + #13#10 +
      'Label4.Caption=Назив' + #13#10 +
      'PropButton.Caption=Подешавање...' + #13#10 +
      'GroupBox3.Caption=Копије' + #13#10 +
      'Label2.Caption=Број копија' + #13#10 +
      'GroupBox2.Caption= Принтер инит подешавање ' + #13#10 +
      'Label1.Caption=Тип штампача' + #13#10 +
      'OpenDialog1.DefaultExt=.fpi' + #13#10 +
      'OpenDialog1.Filter=Принтер инит шаблон (*.fpi)|*.fpi' + #13#10 +
      'SaveDialog1.DefaultExt=.fpi' + #13#10 +
      'SaveDialog1.Filter=Принтер инит шаблон (*.fpi)|*.fpi' + #13#10 +
      '');

    frxResources.Add('TfrxRTFExportDialog',
      'Caption=Извоз у RTF' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Подешавања извоза ' + #13#10 +
      'PicturesCB.Caption=Слике' + #13#10 +
      'PageBreaksCB.Caption=Преломи страна' + #13#10 +
      'WCB.Caption=WYSIWYG' + #13#10 +
      'OpenCB.Caption=Отвори после Извоза' + #13#10 +
      'SaveDialog1.Filter=RTF фајл (*.rtf)|*.rtf' + #13#10 +
      'SaveDialog1.DefaultExt=.rtf' + #13#10 +
      '');

    frxResources.Add('TfrxIMGExportDialog',
      'Caption=Подешавања извоза' + #13#10 +
      'OK.Caption=У реду' + #13#10 +
      'Cancel.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна  ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupBox1.Caption= Подешавања слике ' + #13#10 +
      'Label2.Caption=JPEG квалитет' + #13#10 +
      'Label1.Caption=Resolution (dpi)' + #13#10 +
      'SeparateCB.Caption=Separate files' + #13#10 +
      'CropPage.Caption=Укроји стране' + #13#10 +
      'Mono.Caption=Монохроматски' + #13#10 +
      '');

    frxResources.Add('TfrxPDFExportDialog',
      'Caption=Извоз у PDF' + #13#10 +
      'OkB.Caption=У реду' + #13#10 +
      'CancelB.Caption=Одустани' + #13#10 +
      'GroupPageRange.Caption= Опсег страна ' + #13#10 +
      'AllRB.Caption=Све' + #13#10 +
      'CurPageRB.Caption=Тренутна страна' + #13#10 +
      'PageNumbersRB.Caption=Стране:' + #13#10 +
      'DescrL.Caption=Унесите бројеве страна/или опсехе страна, одвојене зарезима. На пример, 1,3,5-12' + #13#10 +
      'GroupQuality.Caption= Подешавања извоза ' + #13#10 +
      'CompressedCB.Caption=Компресовано' + #13#10 +
      'EmbeddedCB.Caption=Угражени фонтови' + #13#10 +
      'PrintOptCB.Caption=Print optimized' + #13#10 +
      'OpenCB.Caption=Отвори после извоза' + #13#10 +
      'OutlineCB.Caption=Outline' + #13#10 +
      'BackgrCB.Caption=Background' + #13#10 +
      'SaveDialog1.Filter=Adobe PDF фајл (*.pdf)|*.pdf' + #13#10 +
      'SaveDialog1.DefaultExt=.pdf' + #13#10 +
      '');

    Add('RTFexport', 'RTF фајл');
    Add('BMPexport', 'BMP слика');
    Add('JPEGexport', 'JPEG слика');
    Add('TIFFexport', 'TIFF слика');
    Add('TextExport', 'Текст (матрични штампач)');
    Add('XlsOLEexport', 'Excel табела (OLE)');
    Add('HTMLexport', 'HTML фајл');
    Add('XlsXMLexport', 'Excel табела (XML)');
    Add('PDFexport', 'PDF фајл');

    Add('ProgressWait', 'Молим сачекајте');
    Add('ProgressRows', 'Подешавам редове');
    Add('ProgressColumns', 'Подешавам колоне');
    Add('ProgressStyles', 'Подешавам стилове');
    Add('ProgressObjects', 'Извозим објекте');


    Add('TIFFexportFilter', 'Tiff слика (*.tif)|*.tif');
    Add('BMPexportFilter', 'BMP слика (*.bmp)|*.bmp');
    Add('JPEGexportFilter', 'Jpeg слика (*.jpg)|*.jpg');

    Add('HTMLNavFirst', 'First');
    Add('HTMLNavPrev', 'Prev');
    Add('HTMLNavNext', 'Next');
    Add('HTMLNavLast', 'Last');
    Add('HTMLNavRefresh', 'Refresh');
    Add('HTMLNavPrint', 'Print');
    Add('HTMLNavTotal', 'Total pages');
  end;
end;

initialization
  frAddExportsRes;

end.
