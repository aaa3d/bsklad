{******************************************}
{ }
{ FastReport v3.0 }
{ CheckBox RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxChBoxRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxChBox, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

initialization
  with fsGlobalUnit do
  begin
    AddEnum('TfrxCheckStyle', 'csCross, csCheck, csLineCross');
    AddClass(TfrxCheckBoxView, 'TfrxView');
  end;

end.
