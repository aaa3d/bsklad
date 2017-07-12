{******************************************}
{ }
{ FastReport v3.0 }
{ Gradient RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxGradientRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxGradient, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

initialization
  with fsGlobalUnit do
  begin
    AddEnum('TfrxGradientStyle', 'gsHorizontal, gsVertical, gsElliptic, '+
      'gsRectangle, gsVertCenter, gsHorizCenter');
    AddClass(TfrxGradientView, 'TfrxView');
  end;

end.
