//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("FrStAddDialogControls5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("fr5.bpi");
#ifdef RX_CHECKLISTBOX
USEPACKAGE("RxCtl5.bpi");
#endif

#ifdef RX_CHECKLISTBOX
USEUNIT("frRxCheckListBox.pas");
#else
USEUNIT("frCheckListBox.pas");
#endif
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
