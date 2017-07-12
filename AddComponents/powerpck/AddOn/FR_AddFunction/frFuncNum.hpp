// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frFuncNum.pas' rev: 6.00

#ifndef frFuncNumHPP
#define frFuncNumHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frfuncnum
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall frIsRangeNum(Extended nBeg, Extended nEnd, Extended nValue);
extern PACKAGE bool __fastcall frValidInt(AnsiString cInt);
extern PACKAGE bool __fastcall frValidFloat(AnsiString cFlt);
extern PACKAGE Extended __fastcall frStrToFloatDef(AnsiString cFlt, Extended nFltDef);

}	/* namespace Frfuncnum */
using namespace Frfuncnum;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// frFuncNum
