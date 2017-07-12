//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("frAdvPict5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("fr5.bpi");
USEUNIT("frAdvPicture.pas");
USERES("frAdvPicture.dcr");
USEFORMNS("fr_G2Edit.pas", Fr_g2edit, frAdvPictureEditorForm);
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
