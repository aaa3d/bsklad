//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("IBO40_FRIB_C5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("FR_IBOReg.pas");
USERES("FR_IBOReg.dcr");
USEUNIT("FR_IB_Connection.pas");
USEPACKAGE("IBO4_FR5.bpi");
USEPACKAGE("IBO40CRT_C5.bpi");
USEPACKAGE("vcldb50.bpi");
USEPACKAGE("vclib50.bpi");
USEPACKAGE("IBO40EDT_C5.bpi");
USEPACKAGE("IBO40FRT_C5.bpi");
USEUNIT("FR_IB_DataSet.pas");
USEUNIT("FR_IB_Query.pas");
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
