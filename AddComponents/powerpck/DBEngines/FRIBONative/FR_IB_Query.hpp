// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'FR_IB_Query.pas' rev: 5.00

#ifndef FR_IB_QueryHPP
#define FR_IB_QueryHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <FR_DBUtils.hpp>	// Pascal unit
#include <FR_IB_Dataset.hpp>	// Pascal unit
#include <IB_Components.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <FR_Pars.hpp>	// Pascal unit
#include <FR_Class.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fr_ib_query
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrIB_Query;
class PASCALIMPLEMENTATION TfrIB_Query : public Fr_ib_dataset::TfrIB_BDataset 
{
	typedef Fr_ib_dataset::TfrIB_BDataset inherited;
	
private:
	Ib_components::TIB_Query* FQuery;
	Fr_pars::TfrVariables* FParams;
	void __fastcall BeforeOpenQuery(Ib_components::TIB_Dataset* DataSet);
	
protected:
	virtual void __fastcall SetPropValue(AnsiString Index, const Variant &Value);
	virtual Variant __fastcall GetPropValue(AnsiString Index);
	virtual Variant __fastcall DoMethod(AnsiString MethodName, const Variant &Par1, const Variant &Par2
		, const Variant &Par3);
	
public:
	__fastcall virtual TfrIB_Query(void);
	__fastcall virtual ~TfrIB_Query(void);
	virtual void __fastcall LoadFromStream(Classes::TStream* Stream);
	virtual void __fastcall SaveToStream(Classes::TStream* Stream);
	virtual void __fastcall DefineProperties(void);
	virtual void __fastcall Loaded(void);
	void __fastcall LinesEditor(System::TObject* Sender);
	__property Ib_components::TIB_Query* Query = {read=FQuery};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Fr_ib_query */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Fr_ib_query;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FR_IB_Query
