//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("fqb40.res");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("vclsmp40.bpi");
USERES("fqb.dcr");
USEUNIT("fqbReg.pas");
USEPACKAGE("vcldb40.bpi");
USEPACKAGE("vclx40.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
