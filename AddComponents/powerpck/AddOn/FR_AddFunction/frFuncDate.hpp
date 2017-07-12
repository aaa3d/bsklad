// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frFuncDate.pas' rev: 6.00

#ifndef frFuncDateHPP
#define frFuncDateHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frfuncdate
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall frIsLeapYear(int AYear);
extern PACKAGE int __fastcall frDaysPerMonth(int nYear, int nMonth);
extern PACKAGE System::TDateTime __fastcall frFirstDayOfNextMonth(System::TDateTime dDate);
extern PACKAGE System::TDateTime __fastcall frFirstDayOfPrevMonth(System::TDateTime dDate);
extern PACKAGE System::TDateTime __fastcall frLastDayOfPrevMonth(System::TDateTime dDate);
extern PACKAGE System::TDateTime __fastcall frIncDate(System::TDateTime dDate, int nDays, int nMonths, int nYears);
extern PACKAGE System::TDateTime __fastcall frIncDay(System::TDateTime dDate, int nDelta);
extern PACKAGE System::TDateTime __fastcall frIncYear(System::TDateTime dDate, int nDelta);
extern PACKAGE System::TDateTime __fastcall frIncMonth(System::TDateTime dDate, int nDelta);
extern PACKAGE void __fastcall frDateDiffEx(System::TDateTime dDate1, System::TDateTime dDate2, AnsiString &cDelta);
extern PACKAGE bool __fastcall frIsRangeDate(System::TDateTime dBegDate, System::TDateTime dEndDate, System::TDateTime dDate);
extern PACKAGE System::TDateTime __fastcall frStrToDateDef(AnsiString cDate, System::TDateTime dDefault);
extern PACKAGE bool __fastcall frValidDate(AnsiString cDate);
extern PACKAGE System::TDateTime __fastcall frIncDateEx(System::TDateTime dDate, AnsiString cDelta);
extern PACKAGE System::TDateTime __fastcall frIncTimeEx(System::TDateTime dTime, AnsiString cDelta);

}	/* namespace Frfuncdate */
using namespace Frfuncdate;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// frFuncDate
