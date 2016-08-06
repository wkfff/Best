// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AES_Rijndael.pas' rev: 5.00

#ifndef AES_RijndaelHPP
#define AES_RijndaelHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Aes_rijndael
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EAESError;
class PASCALIMPLEMENTATION EAESError : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EAESError(const AnsiString Msg) : Sysutils::Exception(Msg)
		 { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EAESError(const AnsiString Msg, const System::TVarRec * 
		Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EAESError(int Ident)/* overload */ : Sysutils::Exception(
		Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EAESError(int Ident, const System::TVarRec * Args, const 
		int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EAESError(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(
		Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EAESError(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EAESError(int Ident, int AHelpContext)/* overload */
		 : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EAESError(System::PResStringRec ResStringRec, const 
		System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(
		ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EAESError(void) { }
	#pragma option pop
	
};


typedef int *PInteger;

typedef Byte TAESBuffer[16];

typedef Byte TAESKey128[16];

typedef Byte TAESKey192[24];

typedef Byte TAESKey256[32];

typedef unsigned TAESExpandedKey128[44];

typedef unsigned TAESExpandedKey192[54];

typedef unsigned TAESExpandedKey256[64];

typedef Byte *PAESBuffer;

typedef Byte *PAESKey128;

typedef Byte *PAESKey192;

typedef Byte *PAESKey256;

typedef unsigned *PAESExpandedKey128;

typedef unsigned *PAESExpandedKey192;

typedef unsigned *PAESExpandedKey256;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::ResourceString _SInvalidInBufSize;
#define Aes_rijndael_SInvalidInBufSize System::LoadResourceString(&Aes_rijndael::_SInvalidInBufSize)
	
extern PACKAGE System::ResourceString _SReadError;
#define Aes_rijndael_SReadError System::LoadResourceString(&Aes_rijndael::_SReadError)
extern PACKAGE System::ResourceString _SWriteError;
#define Aes_rijndael_SWriteError System::LoadResourceString(&Aes_rijndael::_SWriteError)
extern PACKAGE void __fastcall ExpandAESKeyForEncryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall ExpandAESKeyForEncryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall ExpandAESKeyForEncryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall EncryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall EncryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall EncryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(unsigned * ExpandedKey)/* overload */;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(unsigned * ExpandedKey)/* overload */;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(unsigned * ExpandedKey)/* overload */;
extern PACKAGE void __fastcall ExpandAESKeyForDecryption(const Byte * Key, unsigned * ExpandedKey)/* overload */
	;
extern PACKAGE void __fastcall DecryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall DecryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall DecryptAES(const Byte * InBuf, const unsigned * Key, Byte * OutBuf)/* overload */
	;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamECB(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall EncryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const Byte 
	* Key, const Byte * InitVector, Classes::TStream* Dest)/* overload */;
extern PACKAGE void __fastcall DecryptAESStreamCBC(Classes::TStream* Source, unsigned Count, const unsigned 
	* ExpandedKey, const Byte * InitVector, Classes::TStream* Dest)/* overload */;

}	/* namespace Aes_rijndael */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Aes_rijndael;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AES_Rijndael
