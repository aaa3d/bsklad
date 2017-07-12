EhLib 1.5
----------

The Library contains two components for Borland Delphi versions 3,4 & 5 
and Borland C++ Builder versions 3 & 4.

TABLE OF CONTENTS
-----------------
Overview
Installation Library
Installation Help
Demonstration Programs
Registering



Overview
--------

The Library contains two components.

TDBGridEh component
TDBGridEh provides all functionality of TDBGrid 
 and adds several new features as follows:
   Special titles that can correspond to several/all columns.
   Footer that is able to show sum/count/other field values.
   Automatic column resizing to set grid width equal client width.
   Ability to change row and title height.
   Allows automatic broken of a single line long title and data row 
     to a multiline.
   Title can act as button and, optionally show a sort marker.
   Automatically sortmarking.
   Ability to truncate long text with ellipsis.
   Lookup list can show several fields.
   Incremental search in lookup fields.
   Frozen columns.
   DateTime picker support for TDateField and TDateTimeField.
   Allows to show bitmaps from TImageList depending on field value.
   Allows to hide and track horizontal or vertical scrollbars.
   Allows to hide columns.
   Allows to show 3D frame for frozen, footer and data rows.
   Allows to draw memo fields.
   Multiline inplace editor.
   Proportional scrolling independently of sequenced of dataset.
   Automatically show checkboxes for Boolean fields. Allows to show 
    checkboxes for other type of fields.
   Has a procedures to save and restore layout (visible columns, columns 
    order, columns width, sortmarkers, row height) in/from registry or ini file.


TDBSumList component
This component is intended for totaling sums and amounts of records in a 
TDataSet with dynamic changes. Component keeps a list of TDBSum 
objects, which contains types of group operations (goSum or goCount) 
and name sum field (goCount name of field is unnecessary).


TPrintDBGridEh component
TPrintDBGridEh provides properties and routines for preview and 
  print of TDBGridEh component with several features:
    Ability to expand rows vertically until all text is printed.
    Ability to scale grid to fit it to page width.
    Ability to print/preview title for grid.
    Ability to print/preview page header and page footer where you can 
     specify macros for current page, current date, current time and/or static 
     text.

TPreviewBox component
TPreviewBox lets you create a customizable runtime preview.


TPrinterPreview object
TPrinterPreview lets you to record printable data in buffer for following 
output them on screen and to printer. TPrinterPreview have all functions and 
properties as in TPrinter object. You can use TPrinterPreview object similarly 
of TPrinter except some details. In TPrinter Printer.Canvas.Handle and 
Printer.Handle is the same but in TPrinterPreview PrinterPreview.Canvas.Handle
represent the metafile in that is recored the data and PrinterPreview.Handle 
represent Printer.Handle. That is mean that you have to use 
PrinterPreview.Canvas.Handle for draw operation (DrawText, DrawTexteEx, e.t.c.) 
and use PrinterPreview.Handle in functions that return information about 
printer facilities (GetDeviceCaps, e.t.c.). Global function PrinterPreview 
returns default PrinterPreview object and shows data in default preview form.


Installation Library
--------------------

1. Delphi 4.x:

Uninstall previous installed version of EhLib from Delphi 4 IDE.


Use "File\Open..." menu item of Delphi IDE to open the EHLib package EHLib.DPK.
In "Package..." window click "Install" button to install the library.
Add, (if needed) EhLib directory in Tools->Environment Options->Library->
Library Path.


2. Delphi 3.x:

Uninstall previous installed version of EhLib from Delphi 3 IDE.


Use "File\Open..." menu item of Delphi IDE to open the EHLib package EHLib.DPK.
In "Package..." window click "Install" button to install the library.
Add, (if needed) EhLib directory in Tools->Environment Options->Library->
Library Path.


3. C++Builder 4.x: 

Use "File\Open..." menu item of C++Builder IDE to open the EHLib package 
EHLib.BPK. Then use "Project\Make..." or "Project\Build..." menu item to 
compile package EHLib.BPK. Use "Component\Install packages..." menu item 
to open "Packages" dialog box. Then click "Add..." button and locate 
EHLib.BPL from the EHLib directory and click "OK" to install package into IDE.
Add, (if needed) EhLib directory in Tools->Environment Options->Library->
Library Path.


4. C++Builder 3.x:

Use "File\Open..." menu item of C++Builder IDE to open the EHLib package 
EHLib.BPK. Then use "Project\Make..." or "Project\Build..." menu item to 
compile package EHLib.BPK. Use "Component\Install packages..." menu item 
to open "Packages" dialog box. Then click "Add..." button and locate 
EHLib.BPL from the EHLib directory and click "OK" to install package into IDE.
Add, (if needed) EhLib directory in Tools->Environment Options->Library->
Library Path.



Installation Help
-----------------

1. Delphi 4.x:

Copy the EhLib.hlp and EhLib.cnt files to the Delphi 4 HELP subdirectory.
Select Help|Customize to start the OpenHelp application. Add the EhLib.cnt 
file to the Contents page, add the EhLib.hlp file to the Index and Link pages.


2. Delphi 3.x:

Copy the EhLib.hlp and EhLib.cnt files to the Delphi 3 HELP subdirectory.
Add string ":Link EhLib.HLP" to the "Third-Party Help" section of DELPHI3.CFG.
If the DELPHI3.GID file exists, delete it so that it will be recreated 
with the new help files linked in.


3. C++Builder 4.x: 

Copy the EhLib.hlp and EhLib.cnt files to the C++Builder 4 HELP subdirectory.
Select Help|Customize to start the OpenHelp application. Add the EhLib.cnt 
file to the Contents page, add the EhLib.hlp file to the Index and Link pages.


4. C++Builder 3.x:

Copy the EhLib.hlp and EhLib.cnt files to the C++Builder 3 HELP subdirectory.
Select Help|Customize to start the OpenHelp application. Add the EhLib.cnt 
file to the Contents page, add the EhLib.hlp file to the Index and Link pages.



Demonstration Programs
----------------------
Demonstration programs use tables from the DEMOS directory 
and BDE alias "DBDEMOS".

DEMOS/DEMO1              - Demonstration of use TDBGridEh, TPrintDBGridEh
DEMOS/DEMO2              - Demonstration of use TDBSumList



Registering
-----------
The EhLib is a Shareware product. If you find it useful and want to receive 
the latest versions please register your evaluation copy.

By registering the components you get the following advantages:

1. You will be notified about new versions of the library.
2. You will receive new versions of EhLib FREE. 
3. You encourage the author do make the components even better.



Contact me if you have any questions, comments or suggestions:
Programmer: Dmitry V. Bolshakov
(4232)41-19-82 (voice in Russia)
Home page: tax25.marine.su/dmitryb
E-mail: dmitryb@tax25.marine.su
FidoNet 2:5045/41.63
QCI # 10785451