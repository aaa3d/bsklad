// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'FR_RDot.pas' rev: 6.00

#ifndef FR_RDotHPP
#define FR_RDotHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Variants.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <FR_Class.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fr_rdot
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TfrFillStyle { fsDot, fsLineVertical, fsLineHorizontal, fsLineVH, fsSquare, fsFrame, fsEllipse, fsDiagonalR, fsDiagonalL, fsDiagonalRL };
#pragma option pop

class DELPHICLASS TfrFillRectObject;
class PASCALIMPLEMENTATION TfrFillRectObject : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TfrFillRectObject(Classes::TComponent* AOwner) : Classes::TComponent(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TfrFillRectObject(void) { }
	#pragma option pop
	
};


#pragma pack(push, 1)
struct TfrFillRect
{
	int StepX;
	int StepY;
	int StartX;
	int StartY;
	TfrFillStyle wStyle;
	Graphics::TColor Color;
	int Size;
	int Thick;
} ;
#pragma pack(pop)

class DELPHICLASS TfrFillRectView;
class PASCALIMPLEMENTATION TfrFillRectView : public Fr_class::TfrMemoView 
{
	typedef Fr_class::TfrMemoView inherited;
	
protected:
	virtual void __fastcall SetPropValue(AnsiString Index, const Variant &Value);
	virtual Variant __fastcall GetPropValue(AnsiString Index);
	
public:
	#pragma pack(push, 1)
	TfrFillRect FFillRect;
	#pragma pack(pop)
	
	__fastcall virtual TfrFillRectView(void);
	virtual void __fastcall LoadFromStream(Classes::TStream* Stream);
	virtual void __fastcall SaveToStream(Classes::TStream* Stream);
	virtual void __fastcall ShowFrame(void);
	virtual void __fastcall DefineProperties(void);
public:
	#pragma option push -w-inl
	/* TfrMemoView.Destroy */ inline __fastcall virtual ~TfrFillRectView(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Register(void);

}	/* namespace Fr_rdot */
using namespace Fr_rdot;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FR_RDot
