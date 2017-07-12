//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("IBO40_FRIB_C4.res");
USEUNIT("FR_IBOReg.pas");
USERES("FR_IBOReg.dcr");
USEUNIT("FR_IB_Connection.pas");
USEUNIT("FR_IB_DataSet.pas");
USEUNIT("FR_IB_Query.pas");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("vcldb40.bpi");
USEPACKAGE("IBO40_FR_C4.bpi");
USEPACKAGE("IBO40CRT_C4.bpi");
USEPACKAGE("IBO40EDT_C4.bpi");
USEPACKAGE("IBO40FRT_C4.bpi");
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
