//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("fr_lzw_5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("vcldb50.bpi");
USEPACKAGE("fr5.bpi");
USEUNIT("Lzrwkh.pas");
USEUNIT("FR_LZWComp.pas");
USERES("FR_LZWComp.dcr");
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
