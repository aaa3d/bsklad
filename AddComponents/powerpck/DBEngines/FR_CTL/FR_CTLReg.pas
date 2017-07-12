
{******************************************}
{                                          }
{     FastReport v2.4 - CTL components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2001 by Chudinov A.   }
{                                          }
{******************************************}

unit FR_CTLreg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, DsgnIntf, FR_CTLDB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrCTLComponents]);
end;

end.
