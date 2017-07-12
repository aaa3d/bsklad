//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("frAddFunction5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("fr5.bpi");
USEUNIT("frfunction.pas");
USERES("frfunction.dcr");
USEUNIT("frFConst.pas");
USEUNIT("frFuncDate.pas");
USEUNIT("frFuncNum.pas");
USEUNIT("frFuncSQL.pas");
USEUNIT("frFuncStr.pas");
USEPACKAGE("vcljpg50.bpi");
USEPACKAGE("Vcldb50.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
