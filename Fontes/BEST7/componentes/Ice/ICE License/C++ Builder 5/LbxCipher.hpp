// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxCipher.pas' rev: 5.00

#ifndef LbxCipherHPP
#define LbxCipherHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxcipher
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TLBBase;
class PASCALIMPLEMENTATION TLBBase : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
public:
	#pragma option push -w-inl
	/* TComponent.Create */ inline __fastcall virtual TLBBase(Classes::TComponent* AOwner) : Classes::TComponent(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TComponent.Destroy */ inline __fastcall virtual ~TLBBase(void) { }
	#pragma option pop
	
};


typedef int TLongIntArray[512000000];

typedef int *pLongIntArray;

#pragma pack(push, 1)
struct TLongIntRec
{
	
	union
	{
		struct 
		{
			Byte LoLo;
			Byte LoHi;
			Byte HiLo;
			Byte HiHi;
			
		};
		struct 
		{
			Word Lo;
			Word Hi;
			
		};
		
	};
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TInt64
{
	
	union
	{
		struct 
		{
			Byte LoLoLo;
			Byte LoLoHi;
			Byte LoHiLo;
			Byte LoHiHi;
			Byte HiLoLo;
			Byte HiLoHi;
			Byte HiHiLo;
			Byte HiHiHi;
			
		};
		struct 
		{
			Word LoLo;
			Word LoHi;
			Word HiLo;
			Word HiHi;
			
		};
		struct 
		{
			int Lo;
			int Hi;
			
		};
		
	};
} ;
#pragma pack(pop)

struct TRDLVector
{
	
	union
	{
		struct 
		{
			Byte bt[4];
			
		};
		struct 
		{
			unsigned dw;
			
		};
		
	};
} ;

typedef Byte TKey64[8];

typedef Byte *PKey64;

typedef Byte TKey128[16];

typedef Byte *PKey128;

typedef Byte TKey192[24];

typedef Byte *PKey192;

typedef Byte TKey256[32];

typedef Byte *PKey256;

typedef int TLBCBlock[4];

typedef int *PLBCBlock;

typedef Byte TDESBlock[8];

typedef int TLQCBlock[2];

typedef int TBFBlock[2];

typedef Byte TRDLBlock[16];

#pragma pack(push, 1)
struct TBFContext
{
	int PBox[18];
	int SBox[4][256];
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TDESContext
{
	int TransformedKey[32];
	bool Encrypt;
} ;
#pragma pack(pop)

typedef TDESContext TTripleDESContext[2];

typedef TDESContext TTripleDESContext3Key[3];

#pragma pack(push, 1)
struct TLBCContext
{
	bool Encrypt;
	Byte Dummy[3];
	int Rounds;
	union
	{
		struct 
		{
			int SubKeysInts[4][8];
			
		};
		struct 
		{
			Byte SubKeys64[16][8];
			
		};
		
	};
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TRDLContext
{
	bool Encrypt;
	Byte Dummy[3];
	unsigned Rounds;
	union
	{
		struct 
		{
			Byte Rk[15][16];
			
		};
		struct 
		{
			TRDLVector W[57];
			
		};
		
	};
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TLSCContext
{
	int Index;
	int Accumulator;
	Byte SBox[256];
} ;
#pragma pack(pop)

typedef Byte TRNG32Context[4];

typedef Byte TRNG64Context[8];

typedef Byte TMD5Digest[16];

typedef Byte TSHA1Digest[20];

typedef Byte TLMDContext[280];

typedef Byte TMD5Context[88];

struct TSHA1Context
{
	unsigned sdHi;
	unsigned sdLo;
	unsigned sdIndex;
	unsigned sdHash[5];
	Byte sdBuf[64];
} ;

//-- var, const, procedure ---------------------------------------------------
static const int MaxStructSize = 0x7a120000;
static const Shortint BFRounds = 0x10;
static const Shortint MaxRDLRounds = 0xe;
extern PACKAGE void __fastcall EncryptLBC(const TLBCContext &Context, int * Block);
extern PACKAGE void __fastcall EncryptLBCCBC(const TLBCContext &Context, const int * Prev, int * Block
	);
extern PACKAGE void __fastcall InitEncryptDES(const Byte * Key, TDESContext &Context, bool Encrypt);
	
extern PACKAGE void __fastcall InitEncryptLBC(const Byte * Key, TLBCContext &Context, int Rounds, bool 
	Encrypt);
extern PACKAGE void __fastcall EncryptDES(const TDESContext &Context, Byte * Block);
extern PACKAGE void __fastcall EncryptDESCBC(const TDESContext &Context, const Byte * Prev, Byte * Block
	);
extern PACKAGE void __fastcall InitEncryptTripleDES(const Byte * Key, TDESContext * Context, bool Encrypt
	);
extern PACKAGE void __fastcall EncryptTripleDES(const TDESContext * Context, Byte * Block);
extern PACKAGE void __fastcall EncryptTripleDESCBC(const TDESContext * Context, const Byte * Prev, Byte 
	* Block);
extern PACKAGE void __fastcall InitEncryptTripleDES3Key(const Byte * Key1, const Byte * Key2, const 
	Byte * Key3, TDESContext * Context, bool Encrypt);
extern PACKAGE void __fastcall EncryptTripleDES3Key(const TDESContext * Context, Byte * Block);
extern PACKAGE void __fastcall EncryptTripleDESCBC3Key(const TDESContext * Context, const Byte * Prev
	, Byte * Block);
extern PACKAGE void __fastcall EncryptLQC(const Byte * Key, int * Block, bool Encrypt);
extern PACKAGE void __fastcall EncryptLQCCBC(const Byte * Key, const int * Prev, int * Block, bool Encrypt
	);
extern PACKAGE void __fastcall InitEncryptBF(const Byte * Key, TBFContext &Context);
extern PACKAGE void __fastcall EncryptBF(const TBFContext &Context, int * Block, bool Encrypt);
extern PACKAGE void __fastcall EncryptBFCBC(const TBFContext &Context, const int * Prev, int * Block
	, bool Encrypt);
extern PACKAGE void __fastcall InitEncryptLSC(const void *Key, int KeySize, TLSCContext &Context);
extern PACKAGE void __fastcall EncryptLSC(TLSCContext &Context, void *Buf, int BufSize);
extern PACKAGE void __fastcall InitEncryptRNG32(int Key, Byte * Context);
extern PACKAGE void __fastcall EncryptRNG32(Byte * Context, void *Buf, int BufSize);
extern PACKAGE void __fastcall InitEncryptRNG64(int KeyHi, int KeyLo, Byte * Context);
extern PACKAGE void __fastcall EncryptRNG64(Byte * Context, void *Buf, int BufSize);
extern PACKAGE void __fastcall GenerateRandomKey(void *Key, int KeySize);
extern PACKAGE void __fastcall GenerateLMDKey(void *Key, int KeySize, const AnsiString Str);
extern PACKAGE void __fastcall GenerateMD5Key(Byte * Key, const AnsiString Str);
extern PACKAGE int __fastcall Ran01(int &Seed);
extern PACKAGE int __fastcall Ran02(int &Seed);
extern PACKAGE int __fastcall Ran03(int &Seed);
extern PACKAGE Byte __fastcall Random32Byte(int &Seed);
extern PACKAGE Byte __fastcall Random64Byte(TInt64 &Seed);
extern PACKAGE void __fastcall ShrinkDESKey(Byte * Key);
extern PACKAGE void __fastcall HashELF(int &Digest, const void *Buf, int BufSize);
extern PACKAGE void __fastcall StringHashELF(int &Digest, const AnsiString Str);
extern PACKAGE unsigned __fastcall RolX(unsigned I, unsigned C);
extern PACKAGE void __fastcall InitMD5(Byte * Context);
extern PACKAGE void __fastcall UpdateMD5(Byte * Context, const void *Buf, int BufSize);
extern PACKAGE void __fastcall FinalizeMD5(Byte * Context, Byte * Digest);
extern PACKAGE void __fastcall HashMD5(Byte * Digest, const void *Buf, int BufSize);
extern PACKAGE void __fastcall InitLMD(Byte * Context);
extern PACKAGE void __fastcall UpdateLMD(Byte * Context, const void *Buf, int BufSize);
extern PACKAGE void __fastcall FinalizeLMD(Byte * Context, void *Digest, int DigestSize);
extern PACKAGE void __fastcall HashLMD(void *Digest, int DigestSize, const void *Buf, int BufSize);
extern PACKAGE void __fastcall HashMix128(int &Digest, const void *Buf, int BufSize);
extern PACKAGE void __fastcall StringHashMix128(int &Digest, const AnsiString Str);
extern PACKAGE void __fastcall StringHashMD5(Byte * Digest, const AnsiString Str);
extern PACKAGE void __fastcall StringHashLMD(void *Digest, int DigestSize, const AnsiString Str);
extern PACKAGE void __fastcall XorMem(void *Mem1, const void *Mem2, unsigned Count);
extern PACKAGE void __fastcall HashSHA1(Byte * Digest, const void *Buf, int BufSize);
extern PACKAGE void __fastcall StringHashSHA1(Byte * Digest, const AnsiString Str);
extern PACKAGE void __fastcall InitSHA1(TSHA1Context &Context);
extern PACKAGE void __fastcall UpdateSHA1(TSHA1Context &Context, const void *Buf, int BufSize);
extern PACKAGE void __fastcall FinalizeSHA1(TSHA1Context &Context, Byte * Digest);
extern PACKAGE void __fastcall EncryptRDL(const TRDLContext &Context, Byte * Block);
extern PACKAGE void __fastcall EncryptRDLCBC(const TRDLContext &Context, const Byte * Prev, Byte * Block
	);
extern PACKAGE void __fastcall InitEncryptRDL(const void *Key, int KeySize, TRDLContext &Context, bool 
	Encrypt);

}	/* namespace Lbxcipher */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Lbxcipher;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxCipher
