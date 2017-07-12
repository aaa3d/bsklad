
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
{    Romanian resource                     }
{    Translated by: Sorin Pohontu          }
{    www.frontline.ro                      }
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
    Add('propActive', 'Specifica daca dataset-ul este sau nu deschis');
    Add('propActive.TfrxHighlight', 'Specifica daca evidentierea sintaxei este sau nu activa');
    Add('propAliasName', 'Numele aliasului BDE');
    Add('propAlign', 'Determina alinierea obiectului relativ la banda sau pagina');
    Add('propAlignment', 'Alinierea textului obiectului');
    Add('propAllowAllUp', 'Specifica daca toate butoanele de acces dintr-un grup pot fi deselectate in acelasi timp');
    Add('propAllowEdit', 'Determina daca utilizatorul poate edita paginile dintr-un raport pregatit de listare');
    Add('propAllowExpressions', 'Determina daca un obiect text poate contine expresii in cadrul textului');
    Add('propAllowGrayed', 'Permite a 3-a stare (greyed)pentru controalele de tip checkbox');
    Add('propAllowHTMLTags', 'Determina daca un obiect text poate contine tag-uri HTML in cadrul textului');
    Add('propAllowSplit', 'Determina daca o banda isi poate intinde continutul pe suprafata paginilor');
    Add('propAuthor', 'Autorul raportului');
    Add('propAutoSize', 'Determina daca imaginea ar trebui sa-si determine automat dimensiunile');
    Add('propAutoWidth', 'Determina daca obiectul text ar trebui sa-si determine automat dimensiunile');
    Add('propBackPicture', 'Imaginea de fundal a paginii');
    Add('propBarType', 'Tipul de cod de bare');
    Add('propBevelInner', 'Tip bevel interior');
    Add('propBevelOuter', 'Tip bevel exterior');
    Add('propBevelWidth', 'Latime bevel');
    Add('propBorder', 'Determina daca bordura exterioara este sau nu vizibila');
    Add('propBorderStyle', 'Stilul ferestrei');
    Add('propBottomMargin', 'Dimensiunea marginii de jos a paginii');
    Add('propBrushStyle', 'Stilul pensulei utilizate pentru fundalul obiectului');
    Add('propButtons', 'Seteaza butoanele vizibile in fereastra de previzualizare');
    Add('propCacheSize', 'Dimensiunea maxima a memoriei utilizate de motorul de rapoarte. Daca memoria depaseste aceasta valoare, paginile pregatite vor fi salvate intr-un fisier temporar de pe harddisk');
    Add('propCalcCheckSum', 'Determina daca va fi calculata suma de control pentru codul de bare');
    Add('propCancel', 'Determina daca butonul va fi activat la apasarea tastei ESC');
    Add('propCaption', 'Titlul controlului');
    Add('propCellFields', 'Numele campurilor DB reprezentand celulele incrucisate');
    Add('propCellLevels', 'Numarul de nivele ale celulelor');
    Add('propCenter', 'Determina daca imaginea trebuie centrata in interiorul controlului');
    Add('propCharset', 'Setul de caractere al fontului');
    Add('propCharSpacing', 'Numarul de pixeli dintre doua caractere');
    Add('propCheckColor', 'Culoarea semnului de selectare');
    Add('propChecked', 'Indica daca controlul este selectat');
    Add('propCheckStyle', 'Stilul semnului de selectare');
    Add('propChild', 'Benzile copil conectate la aceasta banda');
    Add('propCollate', 'Setarile implicite pentru collation');
    Add('propColor.TFont', 'Culoarea textului');
    Add('propColor', 'Culoarea obiectului');
    Add('propColor.TfrxFrame', 'Culoarea cadrului');
    Add('propColor.TfrxHighlight', 'Determina culoarea obiectului daca evidentierea este activa');
    Add('propColumnFields', 'Numele campurilor DB reprezentand coloanele incrucisate');
    Add('propColumnGap', 'Distanta intre coloanele benzii');
    Add('propColumnLevels', 'Numarul de nivele ale coloanelor');
    Add('propColumns', 'Numarul de coloane in cadrul benzii');
    Add('propColumnWidth', 'Latimea coloanelor benzii');
    Add('propCondition', 'Conditia de grupare. Grupul se va desparti daca valoarea acestei expresii se modifica');
    Add('propCondition.TfrxHighlight', 'Text expresie. Daca expresia este adevarat, evidentierea va fi activa');
    Add('propConnected', 'Indica daca conexiunea cu baza de date este activa');
    Add('propConvertNulls', 'Determina daca valorile null vor fi convertite la 0, Fals sau sirul vid');
    Add('propCopies', 'Numarul implicit de copii');
    Add('propCursor', 'Cursorul obiectului');
    Add('propDatabaseName', 'Numele bazei de date');
    Add('propDataField', 'Specifica campurile din care obiectul va citi datele');
    Add('propDataSet', 'Leaga obiectul de dataset-ul care contine campul pe care il reprezinta');
    Add('propDate', 'Valoarea tip data a controlului');
    Add('propDateFormat', 'Specifica formatul in care data va fi afisata');
    Add('propDecimalSeparator', 'Separatorul zecimal');
    Add('propDefault', 'Determina daca butonul este implicit');
    Add('propDefHeight', 'Inaltimea implicita a randului');
    Add('propDescription', 'Descrierea raportului');
    Add('propDiagonal', 'Indica faptul ca linia este diagonala');
    Add('propDisplayFormat', 'Formatul de afisare al valorilor');
    Add('propDoubleBuffered', 'Determina daca fereastra de previzualizare va utiliza un dublu-buffer. Activand aceasta se vor evita palpairile imaginii, dar procesul este mai lent');
    Add('propDoublePass', 'Determina daca trebuie realizata o a doua analiza a raportului');
    Add('propDown', 'Determina daca butonul de acces rapid este apasat sau nu');
    Add('propDownThenAcross', 'Determina cat de mult va fi impartit un cross table de-a lungul paginilor');
    Add('propDriverName', 'Numele driver-ului BDE');
    Add('propDropShadow', 'Determina daca obiectul are umbra');
    Add('propDuplex', 'Specifica modul duplex al paginii');
    Add('propEditMask', 'Specifica masca care reprezinta ce text este valid pentru controlul de editare cu masca');
    Add('propEnabled', 'Determina daca controlul este functional');
    Add('propEngineOptions', 'Optiunile pentru motorul raportului');
    Add('propExpression', 'Valuarea expresiei va fi afisata in acest obiect');
    Add('propExpressionDelimiters', 'Caracterul ce va fi utilizat pentru a delimita expresiile continute in text');
    Add('propFieldAliases', 'Aliasurile campurilor dataset-ului');
    Add('propFilter', 'Conditia de filtrare a dataset-ului');
    Add('propFiltered', 'Determina daca dataset-ul trebuie sa filtreze inregistrarile utilizand conditia specificata in proprietatea Filter');
    Add('propFlowTo', 'Obiectul text care va afisa textul care nu incape in obiect');
    Add('propFont', 'Atributele de font ale obiectului');
    Add('propFooterAfterEach', 'Determina daca banda de subsol trebuie afisata dupa fiecare rand de date');
    Add('propFormatStr', 'Sirul de caractere de formatare');
    Add('propFrame', 'Atributele de contur ale obiectului');
    Add('propGapX', 'Spatierea stanga a paragrafului');
    Add('propGapY', 'Spatierea sus a paragrafului');
    Add('propGlyph', 'Imaginea controlului');
    Add('propGroupIndex', 'Permite butoanelor de acces rapid sa lucreze ca un grup');
    Add('propHAlign', 'Alinierea orizontala a textului');
    Add('propHeight', 'Inaltimea obiectului');
    Add('propHGuides', 'Liniile de ghidare orizontale ale paginii');
    Add('propHideZeros', 'Determina daca obiectul text va ascunde valorile es whether the text object will hide the zero values');
    Add('propHighlight', 'Atributele de evidentiere conditionala');
    Add('propIndexName', 'Numele indexului');
    Add('propInitString', 'Sirul de initializare al imprimantei pentru rapoartele listate pe imprimante matriciale');
    Add('propItems', 'Elementele listei obiectului');
    Add('propKeepAspectRatio', 'Pastreaza proportiile originale ale imaginii');
    Add('propKeepChild', 'Determina daca banda va fi tiparita impreuna cu fiii');
    Add('propKeepFooter', 'Determina daca banda va fi tiparita impreuna cu subsolul');
    Add('propKeepHeader', 'Determina daca banda va fi tiparita impreuna cu antetul');
    Add('propKeepTogether', 'Determina daca banda va fi tiparita impreuna cu toate sub-benzile');
    Add('propKind.TfrxFormat', 'Tipul formatarii');
    Add('propKind', 'Tipul butonului');
    Add('propLargeDesignHeight', 'Determina daca pagina va avea inaltime mare in modul design');
    Add('propLayout', 'Asezarea imaginii butonului');
    Add('propLeft', 'Coordonata stanga a obiectului');
    Add('propLeftMargin', 'Dimensiunea marginii stanga a paginii');
    Add('propLines', 'Textul obiectului');
    Add('propLineSpacing', 'Numarul de pixeli dintre doua linii text');
    Add('propLoginPrompt', 'Determina daca trebuie afisat dialogul de autentificare');
    Add('propMargin', 'Determina numarul de pixeli dintre marginea imaginii si marginea butonului');
    Add('propMaster', 'Dataset-ul principal');
    Add('propMasterFields', 'Campurile legate printr-o relatie master-detail');
    Add('propMaximized', 'Determina daca fereastra de previzualizare va fi maximizata');
    Add('propMaxLength', 'Lungimea maxima a textului');
    Add('propMaxPages', 'Numarul maxim de pagini dintr-un raport pregatit');
    Add('propMaxWidth', 'Latimea maxima a unei coloane');
    Add('propMDIChild', 'Determina daca fereastra de previzualizare va fi de tip MDI child');
    Add('propMemo', 'Textul obiectului');
    Add('propMinWidth', 'Latimea minima a unei coloane');
    Add('propMirrorMargins', 'Oglideste marginile paginii pe paginile pare');
    Add('propModal', 'Determina daca fereastra de previzualizare va fi afisata modal');
    Add('propModalResult', 'Determinea cum si cand va inchide butonul forma sa modala');
    Add('propName.TFont', 'Numele fontului');
    Add('propName.TfrxReportOptions', 'Numele raportului');
    Add('propName', 'Numele obiectului');
    Add('propNumGlyphs', 'Indica numarul de imagini existente in imaginea specificata in proprietatea Glyph');
    Add('propOpenDataSource', 'Determina daca sursa de date va fi deschisa automata sau nu');
    Add('propOrientation', 'Orientarea paginii');
    Add('propOutlineText', 'Textul care va fi afisat in controlul de previzualizare outline');
    Add('propOutlineVisible', 'Vizibilitatea controlului de previzualizare outline');
    Add('propOutlineWidth', 'Latimea controlului de previzualizare outline');
    Add('propPageNumbers.TfrxPrintOptions', 'Numarul de pagini care va fi tiparit');
    Add('propPaperHeight', 'Inaltimea paginii');
    Add('propPaperWidth', 'Latimea paginii');
    Add('propParagraphGap', 'Inceputul primei linii a paragrafului');
    Add('propParams.TfrxBDEDatabase', 'Parametrii conexiunii');
    Add('propParams', 'Parametrii interogarii');
    Add('propParentFont', 'Determina daca obiectul va folosi fontul parintelui');
    Add('propPassword', 'Parola raportului');
    Add('propPasswordChar', 'Indica ce caracter, daca exista, va fi afisat in locul caracterelor introduse in control');
    Add('propPicture', 'Imaginea');
    Add('propPicture.TfrxReportOptions', 'Descrierea imaginii raportului');
    Add('propPosition', 'Pozitia initiala a ferestrei');
    Add('propPreviewOptions', 'Optiunile de previzualizare a raportului');
    Add('propPrintable', 'Tiparibilitatea obiectului. Obiectele care au setata proprietatea Printable=False vor fi previzualizate, dar nu vor fi tiparite');
    Add('propPrintChildIfInvisible', 'Determina daca banda fiu va fi tiparita daca parintele sau este invizibila');
    Add('propPrinter', 'Numele imprimantei care va fi selectata la deschiderea sau rularea raportului');
    Add('propPrintIfDetailEmpty', 'Determina daca banda de date va fi tiparita in cazul in care sub-banda sa este goala');
    Add('propPrintIfEmpty', 'Determina daca pagina va fi tiparita in cazul cand toate dataset-urile sunt goale');
    Add('propPrintOnFirstPage', 'Determina daca banda va fi tiparita pe prima pagina');
    Add('propPrintOnLastPage', 'Determina daca banda va fi tiparita pe ultima pagina');
    Add('propPrintOnParent', 'Determina daca subraportul se va tipari pe banda parinte');
    Add('propPrintOnPreviousPage', 'Determina daca pagina poate fi generata spatiul liber al paginii generate anterior');
    Add('propPrintOptions', 'Optiunile de listare a raportului');
    Add('propPrintPages', 'Determina daca vor fi listate toate paginile, cele pare sau impare');
    Add('propRangeBegin', 'Determina punctul de inceput al navigatorului de date');
    Add('propRangeEnd', 'Determina punctul de sfarsit al navigatorului de date');
    Add('propRangeEndCount', 'Determina numarul de inregistrari in dataset daca RageEnd este reCount');
    Add('propReadOnly', 'Determina daca obiectul text este read-only');
    Add('propRepeatHeaders', 'Determina daca coloana si randul antet vor fi retiparite pe o pagina noua');
    Add('propReportOptions', 'Optiunile raportului');
    Add('propReprintOnNewPage', 'Determina daca banda va fi retiparita pe o pagina noua');
    Add('propRestrictions', 'Setul de indicatori de restrictie');
    Add('propRightMargin', 'Dimensiunea marginii din dreapta a paginii');
    Add('propRotation.TfrxBarCodeView', 'Orientarea codului de bare');
    Add('propRotation', 'Rotirea textului');
    Add('propRowCount', 'Numarul de inregistrari virtuale din banda de date');
    Add('propRowFields', 'Numarul de campuri DB care reprezinta randurile incrucisate');
    Add('propRowLevels', 'Numarul de nivele ale randurilor');
    Add('propRTLReading', 'Determina daca obiectul text isi va afisa textul in directie dreapta-la-stanga');
    Add('propScriptLanguage', 'Numele limbajului de scripting folosit de raport');
    Add('propSessionName', 'Numele sesiunii BDE');
    Add('propShadowColor', 'Culoarea umbrei');
    Add('propShadowWidth', 'Latimea umbrei');
    Add('propShape', 'Tipul formei');
    Add('propShiftMode', 'Comportamentul de mutare al obiectului');
    Add('propShowCaptions', 'Determina daca butoanele de previzualizare vor afisa titlurile');
    Add('propShowColumnHeader', 'Determina daca se va afisa antetul coloanei');
    Add('propShowColumnTotal', 'Determines daca se va afisa totalul general al coloanei');
    Add('propShowRowHeader', 'Determina daca se va afisa antetul randului');
    Add('propShowRowTotal', 'Determina daca se va afisa totalul general al randului');
    Add('propShowDialog', 'Determina daca dialogul de listare va fi afisat in fereastra de previzualizare');
    Add('propShowText', 'Determina daca obiectul cod de bare va afisa text vizibil');
    Add('propSize', 'Dimensiunea font-ului');
    Add('propSorted', 'Determina daca elementele vor fi sortate sau nu');
    Add('propSpacing', 'Determina numarul de pixeli dintre imagine si text');
    Add('propSQL', 'Interogarea SQL');
    Add('propStartNewPage', 'Incepe o pagina noua inainte de a tipari o banda');
    Add('propStretch', 'Redimensioneaza imaginea pentru a se incadra in limitele obiectului');
    Add('propStretched', 'Determina daca obiectul va fi redimensionat');
    Add('propStretchMode', 'Comportamentul de redimensionare al obiectului');
    Add('propStyle.TFont', 'Stilul fontului');
    Add('propStyle', 'Stilul controlului');
    Add('propStyle.TfrxFrame', 'Stilul cadrului obiectului');
    Add('propSuppressRepeated', 'Elimina valorile repetate');
    Add('propTableName', 'Numele tabelei de date');
    Add('propTag', 'Numarul de identificare al obiectului');
    Add('propTagStr', 'Textul de identificare al obiectului');
    Add('propText', 'Textul obiectului');
    Add('propTitleBeforeHeader', 'Determina daca titlul raportului va fi afisat inainte de antetul paginii');
    Add('propTop', 'Coordonata sus al obiectului');
    Add('propTopMargin', 'Dimensiunea marginii de sus a paginii');
    Add('propTyp', 'Tipul cadrului');
    Add('propUnderlines', 'Determina daca obiectul text va afisa linia de ghidare dupa fiecare linie de text');
    Add('propURL', 'Adresa URL a obiectului');
    Add('propUserName', 'Numele utilizatorului din obiectul de date. Acest nume va fi afisat in arborele de date');
    Add('propVAlign', 'Alinierea verticala a textului');
    Add('propVersionBuild', 'Informatii de versiune, build');
    Add('propVersionMajor', 'Informatii de versiune, versiunea majora');
    Add('propVersionMinor', 'Informatii de versiune, versiunea minora');
    Add('propVersionRelease', 'Informatii de versiune, release');
    Add('propVGuides', 'Liniile de ghidare verticale ale paginii');
    Add('propVisible', 'Vizibilitatea obiectului');
    Add('propWidth', 'Latimea obiectului');
    Add('propWidth.TfrxFrame', 'Latimea cadrului');
    Add('propWindowState', 'Starea initiala a ferestrei');
    Add('propWordBreak', 'Desparte cuvintele rusesti');
    Add('propWordWrap', 'Determina daca obiectul text va insera caractere de linie noua pentru a desparte cuvintele din partea dreapta');
    Add('propZoom.TfrxBarCodeView', 'Scalare cod de bare');
    Add('propZoom', 'Factorul de scalare initial al ferestrei de previzualizare');
    Add('propZoomMode', 'Modul de scalare initial al ferestrei de previzualizare');
  end;
end;


initialization
  frAddInspectorRes;

end.
