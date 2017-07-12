// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'RsFrOrder.pas' rev: 6.00

#ifndef RsFrOrderHPP
#define RsFrOrderHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <FR_DCtrl.hpp>	// Pascal unit
#include <FR_Class.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
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

namespace Rsfrorder
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSetOrderForm;
class PASCALIMPLEMENTATION TSetOrderForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Buttons::TBitBtn* OKBitBtn;
	Buttons::TBitBtn* ExitBitBtn;
	Stdctrls::TGroupBox* GroupBox1;
	Stdctrls::TListBox* OrderListBox;
	Buttons::TBitBtn* UpBitBtn;
	Buttons::TBitBtn* DownBitBtn;
	Stdctrls::TLabel* HintLabel;
	void __fastcall UpBitBtnClick(System::TObject* Sender);
	void __fastcall DownBitBtnClick(System::TObject* Sender);
	void __fastcall OrderListBoxMouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	void __fastcall OrderListBoxEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall OrderListBoxDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	bool FModifiedOrder;
	Classes::TList* FOldTabOrder;
	bool FIsUndo;
	void __fastcall Localize(void);
	void __fastcall UndoTabOrder(void);
	
public:
	void __fastcall OnTabOrderSetClick(System::TObject* Sender);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TSetOrderForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSetOrderForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TSetOrderForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TSetOrderForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rsfrorder */
using namespace Rsfrorder;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RsFrOrder
