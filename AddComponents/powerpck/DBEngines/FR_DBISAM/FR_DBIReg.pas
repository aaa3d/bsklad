
{******************************************}
{                                          }
{     FastReport v2.4 - DBI components     }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DBIreg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, DsgnIntf, FR_DBIDB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrDBIComponents]);
end;

end.
