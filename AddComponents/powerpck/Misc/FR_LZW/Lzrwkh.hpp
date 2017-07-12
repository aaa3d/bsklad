// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LZRWKH.pas' rev: 5.00

#ifndef LZRWKHHPP
#define LZRWKHHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lzrwkh
{
//-- type declarations -------------------------------------------------------
typedef short Int16;

typedef Word BufferIndex;

typedef Word BufferSize;

typedef Byte BufferArray[32783];

typedef Byte *BufferPtr;

class DELPHICLASS ELzrw1KHCompressor;
class PASCALIMPLEMENTATION ELzrw1KHCompressor : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall ELzrw1KHCompressor(const AnsiString Msg) : Sysutils::Exception(
		Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall ELzrw1KHCompressor(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall ELzrw1KHCompressor(int Ident)/* overload */ : Sysutils::Exception(
		Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall ELzrw1KHCompressor(int Ident, const System::TVarRec 
		* Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall ELzrw1KHCompressor(const AnsiString Msg, int AHelpContext
		) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall ELzrw1KHCompressor(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall ELzrw1KHCompressor(int Ident, int AHelpContext)/* overload */
		 : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall ELzrw1KHCompressor(System::PResStringRec ResStringRec
		, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(
		ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~ELzrw1KHCompressor(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word ChunkSize = 0x8000;
static const Word IOBufSize = 0x8010;
static const Word BufferMaxSize = 0x8000;
static const Word BufferMax = 0x7fff;
static const Byte FLAG_Copied = 0x80;
static const Shortint FLAG_Compress = 0x40;
extern PACKAGE BufferSize __fastcall LZWCompression(BufferPtr Source, BufferPtr Dest, BufferSize SourceSize
	);
extern PACKAGE BufferSize __fastcall LZWDecompression(BufferPtr Source, BufferPtr Dest, BufferSize SourceSize
	);
extern PACKAGE void __fastcall CompressStream(Classes::TStream* inStream, Classes::TStream* outStream
	);
extern PACKAGE void __fastcall DecompressStream(Classes::TStream* inStream, Classes::TStream* outStream
	);

}	/* namespace Lzrwkh */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Lzrwkh;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LZRWKH
