{******************************************}
{                                          }
{     FastReport v2.4 - ADS components     }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

{ 
  Registration unit.
  
  Adapted by Dmitry Koudryavtsev
  http://juliasoft.chat.ru
  juliasoft@mail.ru

  for use with Advantage TDataSet descendant components
}

unit FR_ADSreg;

interface

{$I FR.inc}

procedure Register;

implementation

uses
  SysUtils, Classes
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF}
, FR_ADSDB;


procedure Register;
begin
  RegisterComponents('FastReport', [TfrADSComponents]);
end;

end.
