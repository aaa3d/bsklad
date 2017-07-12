// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'FR_IB_Dataset.pas' rev: 5.00

#ifndef FR_IB_DatasetHPP
#define FR_IB_DatasetHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <IB_Schema.hpp>	// Pascal unit
#include <IB_Components.hpp>	// Pascal unit
#include <FR_DBSet.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <FR_Class.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fr_ib_dataset
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrIB_Dataset;
class PASCALIMPLEMENTATION TfrIB_Dataset : public Fr_class::TfrNonVisualControl 
{
	typedef Fr_class::TfrNonVisualControl inherited;
	
protected:
	Ib_components::TIB_BDataset* FDataSet;
	Ib_components::TIB_DataSource* FDataSource;
	Fr_dbset::TfrDBDataSet* FDBDataSet;
	void __fastcall SQLEditor(System::TObject* Sender);
	virtual void __fastcall SetPropValue(AnsiString Index, const Variant &Value);
	virtual Variant __fastcall GetPropValue(AnsiString Index);
	virtual Variant __fastcall DoMethod(AnsiString MethodName, const Variant &Par1, const Variant &Par2
		, const Variant &Par3);
	
public:
	__fastcall virtual TfrIB_Dataset(void);
	__fastcall virtual ~TfrIB_Dataset(void);
	virtual void __fastcall DefineProperties(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall ShowEditor(void);
};


class DELPHICLASS TfrIB_BDataset;
class PASCALIMPLEMENTATION TfrIB_BDataset : public TfrIB_Dataset 
{
	typedef TfrIB_Dataset inherited;
	
private:
	Ib_components::TIB_BDataset* FBDataset;
	
protected:
	void __fastcall QueryEditor(System::TObject* Sender);
	
public:
	__fastcall virtual TfrIB_BDataset(void);
	__fastcall virtual ~TfrIB_BDataset(void);
	virtual void __fastcall ShowEditor(void);
	__property Ib_components::TIB_BDataset* BDataset = {read=FBDataset};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Fr_ib_dataset */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Fr_ib_dataset;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FR_IB_Dataset
