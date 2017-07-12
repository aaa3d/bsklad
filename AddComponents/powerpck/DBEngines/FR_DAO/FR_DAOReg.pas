
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOReg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, DsgnIntf, FR_DAODB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrDAOComponents]);
end;

end.
