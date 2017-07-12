
{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_IBOreg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, DsgnIntf, FR_IBODB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrIBOComponents]);
end;

end.
