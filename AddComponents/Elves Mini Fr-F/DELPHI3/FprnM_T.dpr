program FprnM_T;
{------------------------------------------------------------------------------}
{ Тест "Общего драйвера ККМ". Создан в Delphi 3.0 (build 5.83).                }
{------------------------------------------------------------------------------}
{ Имя объекта драйвера "AddIn.FprnM45", файлы FprnM1C.dll, FprnMLS.exe.        }
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
uses
  Forms,
  untMain in 'untMain.pas' {frmMain},
  untStat in 'untStat.pas' {frmStatus},
  untDevs in 'untDevs.pas' {frmDevices},
  untProg in 'untProg.pas' {frmProgramming},
  untLenta in 'untLenta.pas' {frmLenta},
  untFisc in 'untFisc.pas' {frmFiscal},
  untRoute in 'untRoute.pas' {frmRoute},
  untPLU in 'untPLU.pas' {frmPLU},
  untOrder in 'untOrder.pas' {frmOrder},
  untObj in 'untObj.pas',
  untUtil in 'untUtil.pas',
  untConst in 'untConst.pas';

{------------------------------------------------------------------------------}
{$R *.RES}

{------------------------------------------------------------------------------}
begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmStatus, frmStatus);
  Application.CreateForm(TfrmDevices, frmDevices);
  Application.CreateForm(TfrmProgramming, frmProgramming);
  Application.CreateForm(TfrmLenta, frmLenta);
  Application.CreateForm(TfrmFiscal, frmFiscal);
  Application.CreateForm(TfrmRoute, frmRoute);
  Application.CreateForm(TfrmPLU, frmPLU);
  Application.CreateForm(TfrmOrder, frmOrder);
  Application.Run;
end.
