// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frFunction.pas' rev: 6.00

#ifndef frFunctionHPP
#define frFunctionHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <FR_Utils.hpp>	// Pascal unit
#include <FR_Const.hpp>	// Pascal unit
#include <FR_Class.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frfunction
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrAddFunctionLibrary;
class PASCALIMPLEMENTATION TfrAddFunctionLibrary : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	AnsiString FFormatDate;
	void __fastcall SetFormatDate(const AnsiString Value);
	
__published:
	__fastcall virtual TfrAddFunctionLibrary(Classes::TComponent* AOwner);
	__property AnsiString FormatDate = {read=FFormatDate, write=SetFormatDate};
public:
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TfrAddFunctionLibrary(void) { }
	#pragma option pop
	
};


class DELPHICLASS TAddFunctionLibrary;
class PASCALIMPLEMENTATION TAddFunctionLibrary : public Fr_class::TfrFunctionLibrary 
{
	typedef Fr_class::TfrFunctionLibrary inherited;
	
private:
	void __fastcall DoScriptF(AnsiString cScript);
	void __fastcall DoInitStr(void);
	void __fastcall DoInitNum(void);
	void __fastcall DoInitDate(void);
	void __fastcall DoInitSQL(void);
	void __fastcall DoInitMath(void);
	void __fastcall DoInitOther(void);
	
public:
	__fastcall virtual TAddFunctionLibrary(void);
	virtual void __fastcall DoFunction(int FNo, const Variant &p1, const Variant &p2, const Variant &p3, Variant &val);
public:
	#pragma option push -w-inl
	/* TfrFunctionLibrary.Destroy */ inline __fastcall virtual ~TAddFunctionLibrary(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Register(void);

}	/* namespace Frfunction */
using namespace Frfunction;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// frFunction
