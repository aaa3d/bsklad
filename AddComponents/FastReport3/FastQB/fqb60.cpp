//---------------------------------------------------------------------------

#include <basepch.h>
#pragma hdrstop
USEFORMNS("fqbDBForm.pas", Fqbdbform, fDBForm);
USERES("fqb.dcr");
USEFORMNS("fqbLinkForm.pas", Fqblinkform, fqbLinkForm);
USEFORMNS("fqbSynmemo.pas", Fqbsynmemo, SynMemoSearch);
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
