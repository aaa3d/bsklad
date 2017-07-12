//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EhLib.res");
USEPACKAGE("VCLX35.bpi");
USEPACKAGE("VCL35.bpi");
USEPACKAGE("VCLDB35.bpi");
USEPACKAGE("VCLDBX35.bpi");
USEUNIT("DBGridEh.pas");
USEUNIT("DBSumLst.pas");
USEFORMNS("GridEhEd.pas", Gridehed, DBGridEHColumnsEditor);
USEUNIT("MonthCal.pas");
USEUNIT("PrViewEh.pas");
USEUNIT("PrnDbgeh.pas");
USEFORMNS("Prndgdlg.pas", Prndgdlg, fPrnDBGridEHSetupDialog);
USEUNIT("Prntseh.pas");
USEFORMNS("Prvfrmeh.pas", Prvfrmeh, PreviewFormEh);
USEUNIT("Ehlibreg.pas");
USERES("Ehlibreg.dcr");

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
