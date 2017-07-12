
{******************************************}
{                                          }
{     FastReport v2.4 - ADO components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

(*  Adapted by A-D-E.net for use with ADONIS ado components.

    tested with ADONIS 4.1 and ADO 2.6

    date : 6 feb. 2001

*)

unit FR_ADNreg;

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
  , FR_ADNDB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrADNComponents]);
end;

end.
