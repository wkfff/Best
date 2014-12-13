// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxProc.pas' rev: 6.00

#ifndef LbxProcHPP
#define LbxProcHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <LbxCipher.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <MMSystem.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxproc
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS ECipherException;
class PASCALIMPLEMENTATION ECipherException : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall ECipherException(const AnsiString Msg) : Sysutils::Exception(Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall ECipherException(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall ECipherException(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall ECipherException(int Ident, const System::TVarRec * Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall ECipherException(const AnsiString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall ECipherException(const AnsiString Msg, const System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall ECipherException(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall ECipherException(System::PResStringRec ResStringRec, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~ECipherException(void) { }
	#pragma option pop
	
};


typedef void __fastcall (*TProgressProc)(int CurPostion, int TotalSize);

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TProgressProc LbOnProgress;
extern PACKAGE int LbProgressSize;
extern PACKAGE void __fastcall BFEncryptFile(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall BFEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall BFEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall BFEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptFile(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall DESEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall LBCEncryptFile(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, int Rounds, bool Encrypt);
extern PACKAGE void __fastcall LBCEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, int Rounds, bool Encrypt);
extern PACKAGE void __fastcall LBCEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, int Rounds, bool Encrypt);
extern PACKAGE void __fastcall LBCEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, int Rounds, bool Encrypt);
extern PACKAGE void __fastcall LQCEncryptFile(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall LQCEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall LQCEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall LQCEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall LSCEncryptFile(const AnsiString InFile, const AnsiString OutFile, const void *Key, int KeySize);
extern PACKAGE void __fastcall RNG32EncryptFile(const AnsiString InFile, const AnsiString OutFile, int Key);
extern PACKAGE void __fastcall RNG64EncryptFile(const AnsiString InFile, const AnsiString OutFile, int KeyHi, int KeyLo);
extern PACKAGE void __fastcall TripleDESEncryptFile(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall TripleDESEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall TripleDESEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall TripleDESEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const Byte * Key, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptFile(const AnsiString InFile, const AnsiString OutFile, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptFileCBC(const AnsiString InFile, const AnsiString OutFile, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall RDLEncryptStreamCBC(Classes::TStream* InStream, Classes::TStream* OutStream, const void *Key, int KeySize, bool Encrypt);
extern PACKAGE void __fastcall FileHashMD5(Byte * Digest, const AnsiString AFileName);
extern PACKAGE void __fastcall StreamHashMD5(Byte * Digest, Classes::TStream* AStream);
extern PACKAGE void __fastcall FileHashSHA1(Byte * Digest, const AnsiString AFileName);
extern PACKAGE void __fastcall StreamHashSHA1(Byte * Digest, Classes::TStream* AStream);

}	/* namespace Lbxproc */
using namespace Lbxproc;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxProc
