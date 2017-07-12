//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("RsFrOrder5.res");
USEPACKAGE("vcl50.bpi");
USEFORMNS("RsFrOrder.pas", Rsfrorder, SetOrderForm);
USEUNIT("frOrderConst.pas");
USEPACKAGE("fr5.bpi");
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
