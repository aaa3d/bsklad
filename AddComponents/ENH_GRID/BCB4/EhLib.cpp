//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EhLib.res");
USEUNIT("DBGridEH.pas");
USEUNIT("DBSumLst.pas");
USEFORMNS("GridEhEd.pas", Gridehed, DBGridEHColumnsEditor);
USEPACKAGE("vclx40.bpi");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("vcldb40.bpi");
USEPACKAGE("vcldbx40.bpi");
USEUNIT("EhLibReg.pas");
USERES("EhLibReg.dcr");
USEUNIT("PrnDbgeh.pas");
USEFORMNS("PrnDGDlg.pas", Prndgdlg, fPrnDBGridEHSetupDialog);
USEUNIT("PrntsEh.pas");
USEFORMNS("PrvFrmEh.pas", Prvfrmeh, PreviewFormEh);
USEUNIT("PrViewEh.pas");
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
