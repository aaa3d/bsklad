FastReport 2.4
for Delphi 2-6 ¨ C++Builder 1-5


READ THIS FILE ACCURATELY BEFORE INSTALLING FR2.4!

----------------------------------------------------------------------------
TABLE OF CONTENTS

1. Introduction
2. Capabilities
3. Installing
4. Backward compatibility
5. Ordering
6. Notes
7. Credits


----------------------------------------------------------------------------
1. INTRODUCTION
   FastReport is reporting tool component. It consists of report engine,
designer and preview. Its capabilities comparable with in ReportBuilder 5.xx.
It written on 100% Object Pascal and can be installed in Delphi 2-5
and C++Builder 1-4.
   FastReport 2.4 is SHAREWARE. See "Ordering" topic for details.


----------------------------------------------------------------------------
2. CAPABILITIES
- Band-oriented report generator.
- Built-in powerful designer, also available in run-time.
- Preview like in MS Word.
- Fast like QuickReport.
- Compact code - w/o designer smaller than QR3.
- Unlimited number of pages in prepared report.
- Multi-page reports; composite reports; subreports; groups;
  multi-column reports; master-detail-detail reports;
  cross-tab reports; two-pass reports; "live" reports.
- Full control over printing process; support all paper sizes.
- Set of most useful components: Text, Line, Picture, Shape, OLE object,
  RichText, RX Rich 2.0, Chart, Barcode.
- TXT, RTF, CSV, HTML export (RTF and HTML - with pictures).
- Text search in prepared report.
- Add-in component TfrDataStorage intended for creating tables and queries
  in run-time like QRDesigner does. Especially for end-user reports. Supports
  Interbase Express (IBX) and ActiveX Data Objects (ADO).
- Editing pages of prepared report.
- Built-in Pascal-like interpreter for handling of building process.
- Report form can store in DFM resources, external file, BLOb field
  of DB table, or in stream.
- Ability of expanding functionality by own report components, wizards,
  function libraries.


----------------------------------------------------------------------------
3. INSTALLING
   Before installing, remove any other version of FastReport from the Delphi
component palette. Create a folder under your Delphi folder, typically FR240
and decompress the files in 240core.zip, 240reg.zip
(or 240trial.zip, if you evaluating FR) to this directory.

   FR2.4 includes full source code. Trial version contains almost all sources
(only one compiled unit). Before installing, you should copy this unit
from ..\FR\LIB_DX to ..\FR\SOURCE.

3.1. Delphi 2.0
   Copy file FR_Class.dcu from ..\FR\LIB_D2 to ..\FR\SOURCE (if you have
trial version of FR).
   If you have TChart or TeeChartPro open the file \fr240\source\FR.inc
with any text editor and uncomment the required string, then save the file -
this will allow the TfrChart component to be installed.
   Now open Delphi 2 and select close all from the file menu this will close
the default starting project. Select Install from the component menu select
add the select browse in the dialog box select the source folder under the
folder to which you installed FastReport then select FR_REG.PAS file, click
Ok, when you return to the install dialog window click Ok again and your
library should recompile.
   If you have any problems see installing components in your Delphi Manual.
Note: You should make a backup copy of the Delphi CMPLIB32.DCL AND SAVE IT
IN A DIFFERENT FOLDER - THIS WILL ALLOW YOU TO REPLACE YOUR LIBRARY IF IT
FAILS TO COMPILE .
   After compiling, "FastReport" and "FR Tools" tabs appears in Delphi's
components palette. AFTER INSTALLING YOU SHOULD REBOOT DELPHI!
   For adding FR help file to the Delphi help system, you should:
- copy files from ..\FR\Help\English to ..\Delphi2\Help;
- make reserved copy of file ..\Delphi2\BIN\Delphi.hdx;
- run ..\Delphi2\HELP\TOOLS\HelpInst.exe;
- open file ..\Delphi2\BIN\Delphi.hdx and choose "Keywords/Add Keyword File";
- open file FR.kwf from ..\Delphi2\HELP;
- save all work by "File/Save" menu command;
- add the following lines to ..\Delphi2\Help\Delphi.cnt:
:Index FastReport Reference=FR.hlp
:Link FR.hlp

3.2. Delphi 3.0
   Copy file FR_Class.dcu from ..\FR\LIB_D3 to ..\FR\SOURCE (if you have
trial version of FR).
   If you want JPEG images support open the file \fr240\source\FR.inc
with any text editor and uncomment the required string, then save the file -
this will allow you to work with JPEG images.
   Run Delphi, choose "File/Open..." menu command and open package
FR3.dpk from ..\FR\SOURCE. In package editor, choose "Compile" button
to compile package. After compiling, press "Install" button to install
package into Delphi.
   After installing, "FastReport" and "FR Tools" tabs appears in Delphi's
components palette. AFTER INSTALLING YOU SHOULD REBOOT DELPHI!
   Choose "Tools/Environment options..." menu command. Go "Library" tab
and add path to ..\FR\SOURCE directory to the "Library path" string.
   For adding FR help file to the Delphi help system, you should:
- copy files from ..\FR\Help\English to ..\Delphi3\Help;
- add the following lines to ..\Delphi3\Help\Delphi3.cnt:
:Index FastReport Reference=FR.hlp
:Link FR.hlp

3.3. Delphi 4.0.
   Copy file FR_Class.dcu from ..\FR\LIB_D4 to ..\FR\SOURCE (if you have
trial version of FR).
   If you want JPEG images support open the file \fr240\source\FR.inc
with any text editor and uncomment the required string, then save the file -
this will allow you to work with JPEG images.
   Run Delphi, choose "File/Open..." menu command and open package
FR4.dpk from ..\FR\SOURCE. In package editor, choose "Compile" button
to compile package. After compiling, press "Install" button to install
package into Delphi.
   After installing, "FastReport" and "FR Tools" tabs appears in Delphi's
components palette. AFTER INSTALLING YOU SHOULD REBOOT DELPHI!
   Choose "Tools/Environment options..." menu command. Go "Library" tab
and add path to ..\FR\SOURCE directory to the "Library path" string.
   For adding FR help file to the Delphi help system, you should:
- copy files from ..\FR\Help\English to ..\Delphi4\Help;
- add the following lines to ..\Delphi4\Help\Delphi4.cnt:
:Index FastReport Reference=FR.hlp
:Link FR.hlp

3.4. Delphi 5.0.
   Copy file FR_Class.dcu from ..\FR\LIB_D5 to ..\FR\SOURCE (if you have
trial version of FR).
   If you want JPEG images support open the file \fr240\source\FR.inc
with any text editor and uncomment the required string, then save the file -
this will allow you to work with JPEG images.
   Run Delphi, choose "File/Open..." menu command and open package
FR5.dpk from ..\FR\SOURCE. In package editor, choose "Compile" button
to compile package. After compiling, press "Install" button to install
package into Delphi.
   After installing, "FastReport" and "FR Tools" tabs appears in Delphi's
components palette. AFTER INSTALLING YOU SHOULD REBOOT DELPHI!
   Choose "Tools/Environment options..." menu command. Go "Library" tab
and add path to ..\FR\SOURCE directory to the "Library path" string.
   For adding FR help file to the Delphi help system, you should:
- copy files from ..\FR\Help\English to ..\Delphi5\Help;
- add the following lines to ..\Delphi5\Help\Delphi5.cnt:
:Index FastReport Reference=FR.hlp
:Link FR.hlp

3.5. C++Builder 4.0.
   Copy files FR_Class.obj, FR_Class.hpp from ..\FR\CBUILD4 and FR_Class.dcu
from ..\FR\LIB_D4 to ..\FR\SOURCE (if you have trial version of FR).
   Run C++Builder, choose "File/Open..." menu command and open package
FR4.bpk from ..\FR\SOURCE. In package editor, choose "Compile" button
to compile package. After compiling, press "Install" button to install
package into IDE. After installing, "FastReport" and "FR Tools" tabs
appears in C++Builder components palette.
   Choose "Tools/Environment options..." menu command. Go "Library" tab
and add path to ..\FR\SOURCE directory to the "Library path" string.
AFTER INSTALLING YOU SHOULD REBOOT C++BUILDER!
   For adding FR help file to the C++Builder help system, choose
"Help/Customize..." menu command. In "OpenHelp" dialog in "Contents" tab
add file ..\FR\FR.cnt, and in "Index" tab add file ..\FR\FR.hlp. After this,
save help project ("File|Save Project" menu command).

3.6. Installing additional components.
   There are three additional components included in standard FR package.
These components can be found in SOURCE\BDE, SOURCE\IBX and SOURCE\ADO
folders. They supersede old datamanager (TfrDataStorage component). To
install them, use same technique as described above. Each component have
a package file. To install in Delphi2, use file with Reg suffix (for instance,
FR_BDEReg.pas).
   WARNING! The old datamanager (TfrDataStorage) is outdated. It included in
this FR version, but will be removed in the next version 2.5. We highly 
recommended to stop using it, move to new components and convert your existing
reports.


----------------------------------------------------------------------------
4. BACKWARD COMPATIBILITY
   .frf files from FR2.1...FR2.4 is compatible. You can use FR2.1 .frf
in FR2.4; but you can't use new .frf files in older FR versions and builds.
   Old datamanager (TfrDataManager) is not installed by default. Remove
comment from {$DEFINE DATAMANAGER} line in FR.inc file to install it.


----------------------------------------------------------------------------
5. REGISTERING
   FastReport 2.4 is shareware. You can try trial version of FR2.4, which
prints only one page of report with nag label "FastReport - unregistered".
Full version of FR shipped with full source code.
   Single copy of FR2.4 costs $99. Site license (unlimited number of copies)
costs $990. You can register it with RegisterNow! or ShareIt online services
which accepts all kinds of payment. To buy site license, buy 10 copies of FR.
   To register, go FR home page http://www.fastreport.ru or
http://www.fast-report.com, "Register Now" reference. Registered
users gets technical support and can upgrade to the next version of FR with
no additional payment.


----------------------------------------------------------------------------
6. NOTES
   All units written by author, except the following:
 - RichEdit editor taked from \DEMOS\RICHEDIT.
 - Delphi version determining taken from RX 2.60.
 - TfrSpeedButton component is based on RX TrxSpeedButton.
 - Barcode component (frBarcod.pas) is written by Andreas Schmidt
   and friends (freeware).
 - See also "CREDITS" topic.

   Images - MS Windows, MS Office, ReportBuilder, QuickReport, Delphi\Images.
   Ideology - ReportBuilder, QuickReport, 1S-Bookkeeping 6.0.


----------------------------------------------------------------------------
7. CREDITS

Olivier Guilbaud <golivier@free.fr>:
 - Barcode add-in (FR_BarC.pas)
 - RoundRect add-in (FR_RRect.pas)
 - Interface with OpenQueryBuilder (FR_QBEng.pas)

Vladislav Necheporenko <vlad@kometa.dp.ua>:
 - Flat comboboxes (FR_Combo.pas)

Andrew Semack <sammy@profix.poltava.ua>:
 - Interface with IB_Objects

EMS Company, Alexander Khvastunov <avx@ems.chel.su>:
 - TfrIBXComponents
 - TfrFIBComponents

Michael Shmakov <misha@petrosoft.karelia.ru>:
 - TfrDAOComponents

Andrew Dyrda <andrewdyrda@chat.ru>:
 - Documentation

Konstantin Butov <kos@sp.iae.nsk.su>:
 - Idea and first version of TfrPrintGrid component

Sergey Repalov <ReSerg@mail.ru>:
 - TfrRTF_RS_ExportFilter

Oleg Kharin <ok@uvadrev.udmnet.ru>:
 - Full WYSIWYG support

Stalker <stalker732_4@yahoo.com>:
 - A lot of suggestions and bug reports
 - TfrAsaComponents and others

Boris Loboda <barry@audit.kharkov.com>:
 - Help with hosting

Akzhan Abdulin <akzhan@mtgroup.ru>:
 - Life-time "moderatorial [-]" in RU.DELPHI :))

Pavel Ishenin <webpirat@mail.ru>
 - RTF, HTM export


Localization:
 - Carsten Bech <carsten.bech@teliamail.dk> (danish)
 - Wy <wy6688@163.net> (chinese)
 - Roberto Mambriani <rmambriani@fasanocomputers.com> (italian)
 - Bartlomiej Zass <zass@pro.onet.pl> (polish)
 - Bolek Umnicki <strato@polandmail.com> (polish)
 - Josep Mas <xci@jet.es> (catalan)
 - Nei <coopcred@leosoft.com.br> (portuguese-brazil)
 - Isaque Pinheiro <axial@escelsa.com.br> (portuguese-brazil)
 - Bobby Gallagher <bobbyg@indigo.ie> (english)
 - Francisco Purrinos <purrinhos@cif.es> (spanish)
 - Andreas Pohl <apohl@ibp-consult.com> (german)
 - Stefan Diestelmann <sd@itsds.de> (german)
 - Arpad Toth <ekosoft@signalsoft.sk> (czech, slovak)
 - Le Hung <lehung@main.antszbar.hu> (hungary)
 - Tochenjuk Oleg <frodo@uct.kiev.ua> (ukrainian)
 - Pierre Demers <dempier2@hotmail.com> (french)
 - Olivier Guilbaud <golivier@free.fr> (french)
 - Craig Manley <c.manley@chello.nl> (dutch)
 - Burhan Chakmak <bakisoft@nursat.kz> (turkish)
 - Jan W <jan@ideida.se> (swedish)

Also thanks to all FR users who sent bugreports and suggestions!


----------------------------------------------------------------------------
Author:    Alexander Tzyganenko
e-mail:    support@fast-report.com
home page: http://www.fastreport.ru  
           http://www.fast-report.com
