@Echo off
rem 
rem Copyright (c) 1999-2000 Olga Sapozhnikova<soft@office.odessa.ua>, 
rem                         Kirill Smirnoff<kirill@i.am>
rem Last modification: 04.04.2000
rem ѕожалуйста, все замечани€ и исправлени€ посылайте по указанным выше адресам.
rem
brc32.exe rbDADE.rc >NUL
brc32.exe rbIDE.rc >NUL
brc32.exe rbPrint.rc >NUL
brc32.exe rbRAP.rc >NUL
dcc32.exe rbDADE.dpr >NUL
dcc32.exe rbIDE.dpr >NUL
dcc32.exe rbPrint.dpr >NUL
dcc32.exe rbRAP.dpr >NUL