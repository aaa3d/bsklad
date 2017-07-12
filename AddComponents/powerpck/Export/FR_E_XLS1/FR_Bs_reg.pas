{******************************************}
{                                          }
{             FastReport v2.4              }
{            Registration unit             }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}


unit FR_Bs_reg;

{$I FR.inc}

interface


procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs ,
  FR_E_BsExl,FR_E_BsExl01
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF};

{-----------------------------------------------------------------------}

{-----------------------------------------------------------------------}
procedure Register;
begin
  RegisterComponents('FastReport',
    [
      TfrExcelExportFilter   , //kkkkkk
      TfrExcelExportFilter01  //kkkkkk

    ]);
end;

end.
