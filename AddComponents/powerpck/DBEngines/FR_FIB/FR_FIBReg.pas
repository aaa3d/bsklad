
{******************************************}
{                                          }
{     FastReport v2.4 - IBX components     }
{            Registration unit             }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_FIBReg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, FR_FIBDB
  {$IFNDEF VER140},DsgnIntf;{$ENDIF}
  {$IFDEF VER140},DesignIntf;{$ENDIF}


procedure Register;
begin
  RegisterComponents('FastReport', [TfrFIBComponents]);
end;

end.
