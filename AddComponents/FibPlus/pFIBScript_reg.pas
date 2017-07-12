{*************************************************}
{                                                 }
{             FIBPlus Script, version 1.5         }
{                                                 }
{     Copyright by Nikolay Trifonov, 2003-2004    }
{                                                 }
{           E-mail: t_nick@mail.ru                }
{                                                 }
{*************************************************}

unit pFIBScript_reg;

interface

uses Classes;

procedure Register;

implementation

uses pFIBScript, pFIBExtract;

procedure Register;
begin
  RegisterComponents('FIBPlusScript', [TpFIBScript,TpFIBExtract]);
end;

end.
