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
    Add('propActive', 'Nosaka, vai datu ievadisana ir aktiva');
    Add('propActive.TfrxHighlight', 'Nosaka, vai ir aktiva noteikta izdalisana');
    Add('propAliasName', 'Aliasa vards BDE');
    Add('propAlign', 'Objekta izlidzinasana pec pirmsakuma');
    Add('propAlignment', 'Teksta objekta izlidzinasana');
    Add('propAllowAllUp', 'Nosaka, vai visas grupu komandas var tikt aktivizetas');
    Add('propAllowEdit', 'Nosaka, nosaka vai lietotajs drikst rediget gatavu atskaiti');
    Add('propAllowExpressions', 'Nosaka, vai teksta objekta var atrasties izteiksmes');
    Add('propAllowGrayed', 'Pielauj treso parbaudes boksu stavokli ');
    Add('propAllowHTMLTags', 'Nosaka, vai teksta objekta var atrasties HTML-atzimes');
    Add('propAllowSplit', 'Pielauj satura dalisanu');
    Add('propAuthor', 'Atskaites autors');
    Add('propAutoSize', 'Attela auto-izmers');
    Add('propAutoWidth', 'Teksta auto-platums');
    Add('propBackPicture', 'Lappuses fona attels');
    Add('propBarType', 'Svitru koda veids');
    Add('propBevelInner', 'Iekseja ramja veids');
    Add('propBevelOuter', 'Iekseja ramja veids');
    Add('propBevelWidth', 'Ramja biezums');
    Add('propBorder', 'Nosaka, vai janorada ieksejo rami ap objektu');
    Add('propBorderStyle', 'Loga veids');
    Add('propBottomMargin', 'Lappuses apakseja laukuma aplukosana');
    Add('propBrushStyle', 'Otas veids, tiek izmantots pie zimesanas un objekta aizpildisanas');
    Add('propCalcCheckSum', 'Nosaka, vai automatiski jaizskaitlo kontroles summu');
    Add('propCancel', 'Nosaka, vai janostrada komandai Esc pie taustina nospiesanas');
    Add('propCaption', 'Vadosa elementa virsraksts');
    Add('propCellFields', 'Laukuma izmainas, kuras izvietotas tabulas sunas');
    Add('propCellLevels', 'Tabulu sunu limenu daudzums');
    Add('propCenter', 'Nosaka, vai iekseja objekta attels ir jacentre');
    Add('propCharset', 'Fonta simbolu ievadisana');
    Add('propCharSpacing', 'Atstarpe starp simboliem');
    Add('propCheckColor', 'Atzimes krasa');
    Add('propChecked', 'Nosaka, vai ir noteikts vadosais elements');
    Add('propCheckStyle', 'Atzimes veids');
    Add('propChild', 'Meitas uzstadijumi, saistiti ar datu uzstadijumiem');
    Add('propCollate', 'Nosaka, vai nepieciesama sortesana pec kopijam');
    Add('propColor.TFont', 'Fonta krasa');
    Add('propColor', 'Objekta krasa');
    Add('propColor.TfrxFrame', 'Ramja krasa');
    Add('propColor.TfrxHighlight', 'Objekta krasa, ja noteikta izvelne ir aktiva');
    Add('propColumnFields', 'Laukumu nosaukumi, izvietoti tabulas kolonnu virsraksta');
    Add('propColumnGap', 'Atstarpe starp kolonnam');
    Add('propColumnLevels', 'Limenu daudzums tabulas kolonnu virsraksta');
    Add('propColumns', 'Kolonnu daudzums');
    Add('propColumnWidth', 'Kolonnu platums');
    Add('propCondition', 'Grupesanas noteikumi. Pie izteiksmes izmanas tiek izveidota jauna grupa');
    Add('propCondition', 'Izteiksme pielautajai izdalisanai. Ja izteiksme vienada ar True, izdalisana bus aktiva');
    Add('propConnected', 'Nosaka, vai ir aktivs pieslegums pie BD');
    Add('propConvertNulls', 'Nosaka, vai tuksie BD laukumi jakonverte uz 0, False vai tuksu rindu, atkariba no laukuma veida');
    Add('propCopies', 'Kopiju daudzums');
    Add('propCursor', 'Objekta kursora forma');
    Add('propDatabaseName', 'Datu bazes nosaukums');
    Add('propDataField', 'BD laukuma nosaukums, kuram piesaistiti objekti');
    Add('propDataSet', 'Datu ievadisana, kuram piesaistiti objekti');
    Add('propDate', 'Datums');
    Add('propDateFormat', 'Datuma formats');
    Add('propDecimalSeparator', 'Vesela skaitla vai dalskaitla dalitajs');
    Add('propDefault', 'Nosaka, vai nostrada komanda pie taustina Enter nospiesanas');
    Add('propDefHeight', 'Rindas augstums tabula pec noklusejuma');
    Add('propDescription', 'Atskaites apraksts');
    Add('propDiagonal', 'Nosaka, vai linija ir diagonala');
    Add('propDisplayFormat', 'Izcelto nozimju formatesana');
    Add('propDoublePass', 'Nosaka, vai atskaite ir dubulta');
    Add('propDown', 'Nosaka, vai komanda ir aktivizeta');
    Add('propDownThenAcross', 'Nosaka, ka liela tabula tiks sadalita pa lappusem');
    Add('propDriverName', 'BDE draiveru nosaukums');
    Add('propDropShadow', 'Nosaka, vai tiek radita ena');
    Add('propDuplex', 'Dubultas drukas rezims');
    Add('propEditMask', 'Maska teksta redigesanai');
    Add('propEnabled', 'Nosaka, vai ir atlauts vadosais elements');
    Add('propEngineOptions', 'Atskaites ipasibas');
    Add('propExpression', 'Izteikums, kura nozime tiks izmantota objekta');
    Add('propExpressionDelimiters', 'Simboli, kurus izmanto izteiksmju atspogulosanai teksta');
    Add('propFieldAliases', 'Laukuma BD aliasi');
    Add('propFilter', 'Ierakstu filtracijas izteiksme datu ievadisanai');
    Add('propFiltered', 'Nosaka, vai jaizmanto filtracija, kuras noraditas Filter ipasibas');
    Add('propFlowTo', 'Objekts, kurs radis tekstu, kuram pietrukst vietas dotaja objekta');
    Add('propFont', 'Fonta parametri');
    Add('propFooterAfterEach', 'Nosaka, vai janorada atstarpe pec katras datu rindas');
    Add('propFormatStr', 'Formatesanas linija');
    Add('propFrame', 'Ramja parametri');
    Add('propGapX', 'Teksta atkape no kreisas un labas puses no objekta laukuma robezam');
    Add('propGapY', 'Teksta atkape no augsa un apaksas no objekta laukuma robezam');
    Add('propGlyph', 'Vadosa elementa attels');
    Add('propGroupIndex', 'Lauj apvienot komandas grupa');
    Add('propHAlign', 'Teksta izlidzinasana horizontali');
    Add('propHeight', 'Objekta augstums');
    Add('propHideZeros', 'Nosaka, vai japaslepj objekti ar nulles nozimi');
    Add('propHighlight', 'Noteiktas izcelsanas parametri');
    Add('propIndexName', 'Indeksa nosaukums');
    Add('propInitString', 'Printera inicializacijas linija matricas atskaisu printesanai');
    Add('propItems', 'Objekta liniju saraksts');
    Add('propKeepAspectRatio', 'Saglabat attelu proporcijas');
    Add('propKeepChild', 'Nosaka, vai joslai japaradas taja pasa lappuse, ka ari tas pirmsakums');
    Add('propKeepFooter', 'Nosaka, vai joslai japaradas taja pasa lappuse, ka ari tas footer');
    Add('propKeepHeader', 'Nosaka, vai joslai japaradas taja pasa lappuse, ka ari tas header');
    Add('propKeepTogether', 'Nosaka, vai joslai japaradas uz vienas lappuses');
    Add('propKind.TfrxFormat', 'Formatesanas veids');
    Add('propKind', 'Komandas veids');
    Add('propLargeDesignHeight', 'Nosaka, vai lappusei bus liels augstums dizainera rezima');
    Add('propLayout', 'Attela izvietojums');
    Add('propLeft', 'X objekta koordinates');
    Add('propLeftMargin', 'Lappuses kreisa laukuma izmers');
    Add('propLines', 'Objekta teksts');
    Add('propLineSpacing', 'Atstarpes starp teksta rindam');
    Add('propLoginPrompt', 'Nosaka, vai jauzrada dialogs ar vardu/paroli pie pieslegsanas pie BD');
    Add('propMargin', 'Atstarpe starp attelu un vadosa elementa malu');
    Add('propMaster', 'Galvena datu ievade, lai izveidotu sakarus ar master-detail');
    Add('propMasterFields', 'Saistitie laukumi galvenaja un paklautaja datu ievade');
    Add('propMaxLength', 'Maksimalais teksta garums');
    Add('propMaxWidth', 'Kolonnas maksimalais platums');
    Add('propMemo', 'Objekta teksts');
    Add('propMinWidth', 'Kolonnas minimalais platums');
    Add('propMirrorMargins', 'Lappuses spogullaukums');
    Add('propModalResult', 'Nosaka, ar kadu rezultatu komanda aizver modela formu');
    Add('propName.TFont', 'Fonta nosaukums');
    Add('propName.TfrxReportOptions', 'Atskaites nosaukums');
    Add('propName', 'Objekta nosaukums');
    Add('propNumGlyphs', 'Attelu daudzums, ar uzraditam ipasibam Glyph');
    Add('propOpenDataSource', 'Nosaka, vai automatiski jaatver datu ievade');
    Add('propOrientation', 'Lappuses orientacija');
    Add('propOutlineText', 'Teksts, kurs tiks atspogulots "Atskaites koka" parlukprogrammas loga');
    Add('propOutlineVisible', 'Nosaka, vai paradit "Atskaites koku" parlukprogrammas loga');
    Add('propOutlineWidth', '"Atskaites koka" platums ');
    Add('propPageNumbers.TfrxPrintOptions', 'Lappuses numuri, kuriem jabut uzdrukatiem');
    Add('propPaperHeight', 'Lappuses augstums');
    Add('propPaperWidth', 'Lappuses platums');
    Add('propParagraphGap', 'Paragrafa atkape');
    Add('propParams.TfrxBDEDatabase', 'Parametri pieslegti pie BD');
    Add('propParams', 'Pieprasijuma parametri');
    Add('propParentFont', 'Nosaka, vai ir jaizmanto fonta uzstadijumi');
    Add('propPassword', 'Atskaites parole');
    Add('propPasswordChar', 'Nosaka simbolu, kurs tiek izmantots pie paroles atspogulosanas');
    Add('propPicture', 'Attels');
    Add('propPicture.TfrxReportOptions', 'Atskaites attels');
    Add('propPosition', 'Loga pozicija pec noklusejuma');
    Add('propPreviewOptions', 'Parlukosanas uzstadijumi');
    Add('propPrintable', 'Nosaka, vai objekts ir jadruka. Jebkura gadijuma objekts bus redzams parlukprogramma');
    Add('propPrintChildIfInvisible', 'Nosaka, vai ir jadruka pamatbaze, ja pamatjosla ir neredzama');
    Add('propPrinter', 'Printeris, kurs tiks izvelets pie atskaites drukasanas');
    Add('propPrintIfDetailEmpty', 'Nosaka, vai ir jadruka josla, ja to apaksjoslas nesatur ierakstus');
    Add('propPrintIfEmpty', 'Nosaka, vai ir jadruka lappuse, ja visas tas apaksjoslas nesatur ierakstus');
    Add('propPrintOnFirstPage', 'Nosaka, vai ir jadruka apaksjoslas pirmaja lappusei');
    Add('propPrintOnLastPage', 'Nosaka, vai ir jadruka apaksjoslas pedeja lappuse');
    Add('propPrintOnParent', 'Nosaka, vai paradit atskaites saturu galvenaja josla');
    Add('propPrintOnPreviousPage', 'Nosaka, vai uzsakt tekosas lappuses driskasanu ieprieksejas lappuses brivaja vieta');
    Add('propPrintOptions', 'Drukas uzstadijumi');
    Add('propPrintPages', 'Nosaka, kuras lappuses jadruka - visas, nepara vai para');
    Add('propRangeBegin', 'Navigacijas sakuma punkts datu ievadisana');
    Add('propRangeEnd', 'Navigacijas beigu punkts datu ievadisana');
    Add('propRangeEndCount', 'Datu ievadisanas ierakstu daudzums, ja RangeEnd = reCount');
    Add('propReadOnly', 'Uzstada rezimu "tikai lasisanai"');
    Add('propRepeatHeaders', 'Nosaka, vai nepieciesams paradit virsrakstus katra lappuse');
    Add('propReportOptions', 'Atskaites uzstadijumi');
    Add('propReprintOnNewPage', 'Nosaka, vai nepieciesams paradit joslas katra lappuse');
    Add('propRestrictions', 'Karogu ievadisana, kuri aizliedz dazadas darbibas');
    Add('propRightMargin', 'Lappuses laba laukuma izmers');
    Add('propRotation.TfrxBarCodeView', 'Svitru koda orientacija');
    Add('propRotation', 'Teksta orientacija');
    Add('propRowCount', 'Rindu skaits datu josla, ja tas nav pievienots pie datiem');
    Add('propRowFields', 'BD laukumu nosaukumi, izvietoti tabulas rindu virsraksta');
    Add('propRowLevels', 'Limenu daudzums tabulas rindu virsraksta');
    Add('propRTLReading', 'Nosaka, vai nepieciesams izmantot teksta formesanu no labas puses uz kreiso');
    Add('propSessionName', 'BDE sesijas nosaukums');
    Add('propShadowColor', 'Enas krasa');
    Add('propShadowWidth', 'Enas izmers');
    Add('propShape', 'Figuras veids');
    Add('propShiftMode', 'Objektu savienosanas rezims');
    Add('propShowColumnHeader', 'Nosaka, vai noradit kolonnu virsrakstus');
    Add('propShowColumnTotal', 'Nosaka, vai uzradit kopsummu kolonnas');
    Add('propShowDialog', 'Nosaka, vai paradit drukas dialogu parlukprogramma');
    Add('propShowRowHeader', 'Nosaka, vai paradit rindu virsrakstus');
    Add('propShowRowTotal', 'Nosaka, vai paradit kopsummu pec rindam');
    Add('propShowText', 'Nosaka, vai paradit tekstu zem svitru koda');
    Add('propSize', 'Fonta izmers');
    Add('propSorted', 'Nosaka, vai saraksts ir jasorte');
    Add('propSpacing', 'Atstarpe starp attelu un uzrakstu');
    Add('propSQL', 'SQL izteiciens');
    Add('propStartNewPage', 'Nosaka, vai formatet lappuses dalisanu pirms joslas drukas');
    Add('propStretch', 'Izstiept attelu pec objekta izmeriem');
    Add('propStretched', 'Nosaka, vai objektu var izstiept');
    Add('propStretchMode', 'Objekta izstiepsanas rezims');
    Add('propStyle.TFont', 'Fonta veids');
    Add('propStyle', 'Vadosa elementa veids');
    Add('propStyle.TfrxFrame', 'Ramja veids');
    Add('propSuppressRepeated', 'Nosaka, vai uzradit atkartotas nozimes');
    Add('propTableName', 'Tabulas nosaukums');
    Add('propTag', 'Objekta iezime, datums');
    Add('propTagStr', 'Objekta iezime, izteiksme');
    Add('propText', 'Objekta teksts');
    Add('propTitleBeforeHeader', 'Nosaka, vai jauzrada atskaites virsraksts pirms lappuses virsraksta');
    Add('propTop', ' Y objekta koordinates');
    Add('propTopMargin', 'Lappuses augsejas robezas izmers');
    Add('propTyp', 'Ramja veids');
    Add('propUnderlines', 'Nosaka, vai pasvitrot katru teksta rindu');
    Add('propURL', 'URL objekta - izteiksme ');
    Add('propUserName', 'Objekta lietotajvards');
    Add('propVAlign', 'Vertikala teksta izlidzinasana');
    Add('propVersionBuild', 'Versija build');
    Add('propVersionMajor', ' Versija, major version');
    Add('propVersionMinor', ' Versija, minor version');
    Add('propVersionRelease', ' Versija, release');
    Add('propVisible', 'Nosaka, vai objekts ir redzams');
    Add('propWidth', 'Objekta platums');
    Add('propWidth.TfrxFrame', 'Ramja biezums');
    Add('propWindowState', 'Loga pirmatnejais stavoklis');
    Add('propWordBreak', 'Sadalit krievu vardus pa zilbem');
    Add('propWordWrap', 'Nosaka, vai teksts ir japarnes pa vardiem');
    Add('propZoom.TfrxBarCodeView', 'Svitru koda merogs');
  end;
end;


initialization
  frAddInspectorRes;

end.