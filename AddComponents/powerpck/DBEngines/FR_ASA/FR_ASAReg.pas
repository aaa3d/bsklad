
{*********************************************}
{                                             }
{ FastReport v2.4 - NativeDB components       }
{            Registration unit                }
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 2000-2001 by Stalker SoftWare }
{                                             }
{*********************************************}

unit FR_ASAReg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes 
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF}
, FR_ASADB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrASAComponents]);
end;

end.
