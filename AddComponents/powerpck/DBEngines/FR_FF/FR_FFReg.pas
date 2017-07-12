
{******************************************}
{                                          }
{     FastReport v2.4 - FF components      }
{            Registration unit             }
{                                          }
{ Unit created with FR NewEngin wizard.    }
{                                          }
{ All FlashFiler related changes are       }
{ Copyright (c) Eivind Bakkestuen.         }
{                                          }
{******************************************}

unit FR_FFreg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, {DesignIntf, }FR_FFDB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrFFComponents]);
end;

end.
