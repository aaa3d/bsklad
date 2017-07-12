// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frFuncStr.pas' rev: 6.00

#ifndef frFuncStrHPP
#define frFuncStrHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frfuncstr
{
//-- type declarations -------------------------------------------------------
typedef Set<char, 0, 255>  TfrCharSet;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE int __fastcall frWordPosition(const int N, const AnsiString S, const TfrCharSet &WordDelims);
extern PACKAGE AnsiString __fastcall frExtractWord(int N, const AnsiString S, const TfrCharSet &WordDelims);
extern PACKAGE int __fastcall frWordCount(const AnsiString S, const TfrCharSet &WordDelims);
extern PACKAGE bool __fastcall frIsWordPresent(const AnsiString W, const AnsiString S, const TfrCharSet &WordDelims);
extern PACKAGE int __fastcall frNPos(const AnsiString C, AnsiString S, int N);
extern PACKAGE AnsiString __fastcall frReplaceStr(const AnsiString S, const AnsiString Srch, const AnsiString Replace);
extern PACKAGE AnsiString __fastcall frReplicate(AnsiString cStr, int nLen);
extern PACKAGE AnsiString __fastcall frPadLeft(AnsiString cStr, int nLen, AnsiString cChar);
extern PACKAGE AnsiString __fastcall frPadRight(AnsiString cStr, int nLen, AnsiString cChar);
extern PACKAGE AnsiString __fastcall frPadCenter(AnsiString cStr, int nWidth, AnsiString cChar);
extern PACKAGE int __fastcall frEndPos(AnsiString cStr, AnsiString cSubStr);
extern PACKAGE AnsiString __fastcall frLeftCopy(AnsiString cStr, int nNum);
extern PACKAGE AnsiString __fastcall frRightCopy(AnsiString cStr, int nNum);
extern PACKAGE AnsiString __fastcall frDelete(AnsiString cStr, int nIndex, int nCount);
extern PACKAGE AnsiString __fastcall frInsert(AnsiString cStr1, AnsiString cStr2, int nIndex);
extern PACKAGE int __fastcall frCompareStr(AnsiString cStr1, AnsiString cStr2);

}	/* namespace Frfuncstr */
using namespace Frfuncstr;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// frFuncStr
