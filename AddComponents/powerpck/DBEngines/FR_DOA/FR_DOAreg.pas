{*******************************************}
{                                           }
{    FastReport v2.4 - DOA components       }
{           Database component              }
{                                           }
{ Copyright (c) 1998-2001 by Tzyganenko A.  }
{ Copyright (c) 2002 by Raschektaev Dmitry. }
{                                           }
{                                           }
{*******************************************}

unit FR_DOAreg;

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
, FR_DOADB;

procedure Register;
begin
  RegisterComponents('FastReport', [TfrDOAComponents]);
end;

end.
