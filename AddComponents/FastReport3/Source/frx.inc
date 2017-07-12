{******************************************}
{                                          }
{             FastReport v3.0              }
{              Include file                }
{                                          }
{         Copyright (c) 1998-2004          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}


{$B-} {- Complete Boolean Evaluation }
{$R-} {- Range-Checking }
{$V-} {- Var-String Checking }
{$T-} {- Typed @ operator }
{$X+} {- Extended syntax }
{$P+} {- Open string params }
{$J+} {- Writeable structured consts }
{$H+} {- Use long strings by default }

{$IFDEF VER120}      // Delphi 4.0
  {$DEFINE Delphi4}
{$ENDIF}

{$IFDEF VER130}      // Delphi 5.0
  {$DEFINE Delphi4}
  {$DEFINE Delphi5}
{$ENDIF}

{$IFDEF VER140}      // Delphi 6.0
  {$DEFINE Delphi4}
  {$DEFINE Delphi5}
  {$DEFINE Delphi6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF VER150}      // Delphi 7.0
  {$DEFINE Delphi4}
  {$DEFINE Delphi5}
  {$DEFINE Delphi6}
  {$DEFINE Delphi7}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF VER170}      // Delphi 9.0
  {$DEFINE Delphi4}
  {$DEFINE Delphi5}
  {$DEFINE Delphi6}
  {$DEFINE Delphi7}
  {$DEFINE Delphi9}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF VER125}      // Borland C++ Builder 4.0
  {$DEFINE Delphi4}
  {$ObjExportAll On}
  {$DEFINE BCB}
{$ENDIF}

{$IFDEF VER130}      // Borland C++ Builder 5.0
 {$IFDEF BCB}
  {$ObjExportAll On}
 {$ENDIF}
{$ENDIF}

{$IFDEF VER140}      // Borland C++ Builder 6.0
 {$IFDEF BCB}
  {$ObjExportAll On}
 {$ENDIF}
{$ENDIF}

// Uncomment the following line if you don't want to include component editors
// into your exe (in case if you don't use designer)
//{$DEFINE NO_EDITORS}

//-------------------------Additional components----------------------------

//------------------- JPEG images -----------------------------------
// JPEG images. Adds approximately 100Kb to your EXE.
// If you want to show jpeg images in "Picture" object, uncomment
// the following line:
{$DEFINE JPEG}

//------------------- "Open Picture" dialog -------------------------
// Adds approximately 60Kb to your EXE.
// If you want to use standard "Open picture" dialog in picture editor,
// uncomment the following line:
//{$DEFINE OPENPICTUREDLG}

//------------------- Visual Query builder --------------------------
// To use visual query builder, you should install FastQBuilder component.
//{$DEFINE QBUILDER}

