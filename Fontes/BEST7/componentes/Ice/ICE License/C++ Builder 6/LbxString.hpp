// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxString.pas' rev: 6.00

#ifndef LbxStringHPP
#define LbxStringHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <LbxCipher.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxstring
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall LbDecodeBase64(Classes::TStream* InStream, Classes::TStream* OutStream);
extern PACKAGE void __fastcall LbEncodeBase64(Classes::TStream* InStream, Classes::TStream* OutStream);
extern PACKAGE AnsiString __fastcall BFEncryptStringEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall BFEncryptStringCBCEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall BFEncryptString(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall BFEncryptStringCBC(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall DESEncryptStringEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall DESEncryptStringCBCEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptString(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptStringCBC(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall TripleDESEncryptStringEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall TripleDESEncryptStringCBCEx(const AnsiString InString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall TripleDESEncryptString(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall TripleDESEncryptStringCBC(const AnsiString InString, AnsiString &OutString, const Byte * Key, bool Encrypt);
extern PACKAGE AnsiString __fastcall RDLEncryptStringEx(const AnsiString InString, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE AnsiString __fastcall RDLEncryptStringCBCEx(const AnsiString InString, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptString(const AnsiString InString, AnsiString &OutString, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptStringCBC(const AnsiString InString, AnsiString &OutString, const void *Key, int KeySize, bool Encrypt);

}	/* namespace Lbxstring */
using namespace Lbxstring;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxString
