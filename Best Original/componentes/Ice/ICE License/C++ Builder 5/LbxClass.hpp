// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxClass.pas' rev: 5.00

#ifndef LbxClassHPP
#define LbxClassHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <LbxCipher.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxclass
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TLBBaseComponent;
class PASCALIMPLEMENTATION TLBBaseComponent : public Lbxcipher::TLBBase 
{
	typedef Lbxcipher::TLBBase inherited;
	
protected:
	AnsiString __fastcall GetVersion();
	void __fastcall SetVersion(const AnsiString Value);
	
__published:
	__property AnsiString Version = {read=GetVersion, write=SetVersion, stored=false};
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TLBBaseComponent(Classes::TComponent* AOwner) : Lbxcipher::TLBBase(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TLBBaseComponent(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TLbCipherMode { cmECB, cmCBC };
#pragma option pop

class DELPHICLASS TLbCipher;
class PASCALIMPLEMENTATION TLbCipher : public TLBBaseComponent 
{
	typedef TLBBaseComponent inherited;
	
public:
	__fastcall virtual TLbCipher(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbCipher(void);
	unsigned __fastcall DecryptBuffer(const void *InBuf, unsigned InBufSize, void *OutBuf);
	unsigned __fastcall EncryptBuffer(const void *InBuf, unsigned InBufSize, void *OutBuf);
	virtual void __fastcall DecryptFile(const AnsiString InFile, const AnsiString OutFile) = 0 ;
	virtual void __fastcall DecryptStream(Classes::TStream* InStream, Classes::TStream* OutStream) = 0 
		;
	virtual AnsiString __fastcall DecryptString(const AnsiString InString) = 0 ;
	virtual void __fastcall EncryptFile(const AnsiString InFile, const AnsiString OutFile) = 0 ;
	virtual void __fastcall EncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream) = 0 
		;
	virtual AnsiString __fastcall EncryptString(const AnsiString InString) = 0 ;
	virtual unsigned __fastcall OutBufSizeNeeded(unsigned InBufSize) = 0 ;
};


class DELPHICLASS TLbSymmetricCipher;
class PASCALIMPLEMENTATION TLbSymmetricCipher : public TLbCipher 
{
	typedef TLbCipher inherited;
	
protected:
	TLbCipherMode FCipherMode;
	
public:
	__fastcall virtual TLbSymmetricCipher(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbSymmetricCipher(void);
	virtual void __fastcall GenerateKey(const AnsiString Passphrase) = 0 ;
	virtual void __fastcall GenerateRandomKey(void) = 0 ;
	__property TLbCipherMode CipherMode = {read=FCipherMode, write=FCipherMode, nodefault};
};


class DELPHICLASS TLbBlowfish;
class PASCALIMPLEMENTATION TLbBlowfish : public TLbSymmetricCipher 
{
	typedef TLbSymmetricCipher inherited;
	
protected:
	Byte FKey[16];
	
public:
	__fastcall virtual TLbBlowfish(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbBlowfish(void);
	virtual void __fastcall DecryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall DecryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall DecryptString(const AnsiString InString);
	virtual void __fastcall EncryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall EncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall EncryptString(const AnsiString InString);
	virtual void __fastcall GenerateKey(const AnsiString Passphrase);
	virtual void __fastcall GenerateRandomKey(void);
	void __fastcall GetKey(Byte * Key);
	void __fastcall SetKey(const Byte * Key);
	virtual unsigned __fastcall OutBufSizeNeeded(unsigned InBufSize);
	
__published:
	__property CipherMode ;
};


class DELPHICLASS TLbDES;
class PASCALIMPLEMENTATION TLbDES : public TLbSymmetricCipher 
{
	typedef TLbSymmetricCipher inherited;
	
protected:
	Byte FKey[8];
	
public:
	__fastcall virtual TLbDES(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbDES(void);
	virtual void __fastcall DecryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall DecryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall DecryptString(const AnsiString InString);
	virtual void __fastcall EncryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall EncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall EncryptString(const AnsiString InString);
	virtual void __fastcall GenerateKey(const AnsiString Passphrase);
	virtual void __fastcall GenerateRandomKey(void);
	void __fastcall GetKey(Byte * Key);
	void __fastcall SetKey(const Byte * Key);
	virtual unsigned __fastcall OutBufSizeNeeded(unsigned InBufSize);
	
__published:
	__property CipherMode ;
};


class DELPHICLASS TLb3DES;
class PASCALIMPLEMENTATION TLb3DES : public TLbSymmetricCipher 
{
	typedef TLbSymmetricCipher inherited;
	
protected:
	Byte FKey[16];
	
public:
	__fastcall virtual TLb3DES(Classes::TComponent* AOwner);
	__fastcall virtual ~TLb3DES(void);
	virtual void __fastcall DecryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall DecryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall DecryptString(const AnsiString InString);
	virtual void __fastcall EncryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall EncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall EncryptString(const AnsiString InString);
	virtual void __fastcall GenerateKey(const AnsiString Passphrase);
	virtual void __fastcall GenerateRandomKey(void);
	void __fastcall GetKey(Byte * Key);
	void __fastcall SetKey(const Byte * Key);
	virtual unsigned __fastcall OutBufSizeNeeded(unsigned InBufSize);
	
__published:
	__property CipherMode ;
};


#pragma option push -b-
enum TLbKeySizeRDL { ks128, ks192, ks256 };
#pragma option pop

class DELPHICLASS TLbRijndael;
class PASCALIMPLEMENTATION TLbRijndael : public TLbSymmetricCipher 
{
	typedef TLbSymmetricCipher inherited;
	
protected:
	Byte FKey[32];
	TLbKeySizeRDL FKeySize;
	int FKeySizeBytes;
	void __fastcall SetKeySize(TLbKeySizeRDL Value);
	
public:
	__fastcall virtual TLbRijndael(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbRijndael(void);
	virtual void __fastcall DecryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall DecryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall DecryptString(const AnsiString InString);
	virtual void __fastcall EncryptFile(const AnsiString InFile, const AnsiString OutFile);
	virtual void __fastcall EncryptStream(Classes::TStream* InStream, Classes::TStream* OutStream);
	virtual AnsiString __fastcall EncryptString(const AnsiString InString);
	virtual void __fastcall GenerateKey(const AnsiString Passphrase);
	virtual void __fastcall GenerateRandomKey(void);
	void __fastcall GetKey(void *Key);
	void __fastcall SetKey(const void *Key);
	virtual unsigned __fastcall OutBufSizeNeeded(unsigned InBufSize);
	
__published:
	__property CipherMode ;
	__property TLbKeySizeRDL KeySize = {read=FKeySize, write=SetKeySize, nodefault};
};


class DELPHICLASS TLbHash;
class PASCALIMPLEMENTATION TLbHash : public TLBBaseComponent 
{
	typedef TLBBaseComponent inherited;
	
protected:
	Byte FBuf[1024];
	
public:
	__fastcall virtual TLbHash(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbHash(void);
	virtual void __fastcall HashBuffer(const void *Buf, unsigned BufSize) = 0 ;
	virtual void __fastcall HashFile(const AnsiString AFileName) = 0 ;
	virtual void __fastcall HashStream(Classes::TStream* AStream) = 0 ;
	virtual void __fastcall HashString(const AnsiString AStr) = 0 ;
};


class DELPHICLASS TLbMD5;
class PASCALIMPLEMENTATION TLbMD5 : public TLbHash 
{
	typedef TLbHash inherited;
	
protected:
	Byte FDigest[16];
	
public:
	__fastcall virtual TLbMD5(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbMD5(void);
	void __fastcall GetDigest(Byte * Digest);
	virtual void __fastcall HashBuffer(const void *Buf, unsigned BufSize);
	virtual void __fastcall HashFile(const AnsiString AFileName);
	virtual void __fastcall HashStream(Classes::TStream* AStream);
	virtual void __fastcall HashString(const AnsiString AStr);
};


class DELPHICLASS TLbSHA1;
class PASCALIMPLEMENTATION TLbSHA1 : public TLbHash 
{
	typedef TLbHash inherited;
	
protected:
	Byte FDigest[20];
	
public:
	__fastcall virtual TLbSHA1(Classes::TComponent* AOwner);
	__fastcall virtual ~TLbSHA1(void);
	void __fastcall GetDigest(Byte * Digest);
	virtual void __fastcall HashBuffer(const void *Buf, unsigned BufSize);
	virtual void __fastcall HashFile(const AnsiString AFileName);
	virtual void __fastcall HashStream(Classes::TStream* AStream);
	virtual void __fastcall HashString(const AnsiString AStr);
};


class DELPHICLASS TLbSCStream;
class PASCALIMPLEMENTATION TLbSCStream : public Classes::TMemoryStream 
{
	typedef Classes::TMemoryStream inherited;
	
protected:
	#pragma pack(push, 1)
	Lbxcipher::TLSCContext FContext;
	#pragma pack(pop)
	
	
public:
	__fastcall TLbSCStream(const void *Key, int KeySize);
	DYNAMIC void __fastcall Reinitialize(const void *Key, int KeySize);
	DYNAMIC void __fastcall ChangeKey(const void *Key, int KeySize);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TLbSCStream(void) { }
	#pragma option pop
	
};


class DELPHICLASS TLbSCFileStream;
class PASCALIMPLEMENTATION TLbSCFileStream : public Classes::TFileStream 
{
	typedef Classes::TFileStream inherited;
	
protected:
	#pragma pack(push, 1)
	Lbxcipher::TLSCContext FContext;
	#pragma pack(pop)
	
	
public:
	__fastcall TLbSCFileStream(const AnsiString FileName, Word Mode, const void *Key, int KeySize);
	DYNAMIC void __fastcall Reinitialize(const void *Key, int KeySize);
	DYNAMIC void __fastcall ChangeKey(const void *Key, int KeySize);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TFileStream.Destroy */ inline __fastcall virtual ~TLbSCFileStream(void) { }
	#pragma option pop
	
};


class DELPHICLASS TLbRNG32Stream;
class PASCALIMPLEMENTATION TLbRNG32Stream : public Classes::TMemoryStream 
{
	typedef Classes::TMemoryStream inherited;
	
protected:
	Byte FContext[4];
	
public:
	__fastcall TLbRNG32Stream(const int Key);
	DYNAMIC void __fastcall Reinitialize(const int Key);
	DYNAMIC void __fastcall ChangeKey(const int Key);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TLbRNG32Stream(void) { }
	#pragma option pop
	
};


class DELPHICLASS TLbRNG32FileStream;
class PASCALIMPLEMENTATION TLbRNG32FileStream : public Classes::TFileStream 
{
	typedef Classes::TFileStream inherited;
	
protected:
	Byte FContext[4];
	
public:
	__fastcall TLbRNG32FileStream(const AnsiString FileName, Word Mode, const int Key);
	DYNAMIC void __fastcall Reinitialize(const int Key);
	DYNAMIC void __fastcall ChangeKey(const int Key);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TFileStream.Destroy */ inline __fastcall virtual ~TLbRNG32FileStream(void) { }
	#pragma option pop
	
};


class DELPHICLASS TLbRNG64Stream;
class PASCALIMPLEMENTATION TLbRNG64Stream : public Classes::TMemoryStream 
{
	typedef Classes::TMemoryStream inherited;
	
protected:
	Byte FContext[8];
	
public:
	__fastcall TLbRNG64Stream(const int KeyHi, const int KeyLo);
	DYNAMIC void __fastcall Reinitialize(const int KeyHi, const int KeyLo);
	DYNAMIC void __fastcall ChangeKey(const int KeyHi, const int KeyLo);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TLbRNG64Stream(void) { }
	#pragma option pop
	
};


class DELPHICLASS TLbRNG64FileStream;
class PASCALIMPLEMENTATION TLbRNG64FileStream : public Classes::TFileStream 
{
	typedef Classes::TFileStream inherited;
	
protected:
	Byte FContext[8];
	
public:
	__fastcall TLbRNG64FileStream(const AnsiString FileName, Word Mode, const int KeyHi, const int KeyLo
		);
	DYNAMIC void __fastcall Reinitialize(const int KeyHi, const int KeyLo);
	DYNAMIC void __fastcall ChangeKey(const int KeyHi, const int KeyLo);
	virtual int __fastcall Read(void *Buffer, int Count);
	virtual int __fastcall Write(const void *Buffer, int Count);
public:
	#pragma option push -w-inl
	/* TFileStream.Destroy */ inline __fastcall virtual ~TLbRNG64FileStream(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Lbxclass */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Lbxclass;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxClass
