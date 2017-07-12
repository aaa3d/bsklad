//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("FrStAddDialogControls6.res");
USEPACKAGE("vcl.bpi");
USEPACKAGE("rtl.bpi");
USEPACKAGE("fr6.bpi");
#ifdef RX_CHECKLISTBOX
USEPACKAGE("RxCtl6.bpi");
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
