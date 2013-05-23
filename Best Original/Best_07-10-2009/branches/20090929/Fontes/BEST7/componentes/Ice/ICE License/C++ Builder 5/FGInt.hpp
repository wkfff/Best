// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'FGInt.pas' rev: 5.00

#ifndef FGIntHPP
#define FGIntHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Math.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Fgint
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TCompare { Lt, St, Eq, Er };
#pragma option pop

#pragma option push -b-
enum TSign { negative, positive };
#pragma option pop

typedef DynamicArray<unsigned >  FGInt__1;

struct TFGInt
{
	TSign Sign;
	DynamicArray<unsigned >  Number;
} ;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall zeronetochar8(char &g, const AnsiString x);
extern PACKAGE void __fastcall zeronetochar6(int &g, const AnsiString x);
extern PACKAGE void __fastcall initialize8(AnsiString * trans, const int trans_Size);
extern PACKAGE void __fastcall initialize6(AnsiString * trans, const int trans_Size);
extern PACKAGE void __fastcall initialize6PGP(AnsiString * trans, const int trans_Size);
extern PACKAGE void __fastcall ConvertBase256to64(const AnsiString str256, AnsiString &str64);
extern PACKAGE void __fastcall ConvertBase64to256(const AnsiString str64, AnsiString &str256);
extern PACKAGE void __fastcall ConvertBase256to2(const AnsiString str256, AnsiString &str2);
extern PACKAGE void __fastcall ConvertBase64to2(const AnsiString str64, AnsiString &str2);
extern PACKAGE void __fastcall ConvertBase2to256(AnsiString str2, AnsiString &str256);
extern PACKAGE void __fastcall ConvertBase2to64(AnsiString str2, AnsiString &str64);
extern PACKAGE void __fastcall ConvertBase256StringToHexString(AnsiString Str256, AnsiString &HexStr
	);
extern PACKAGE void __fastcall ConvertHexStringToBase256String(AnsiString HexStr, AnsiString &Str256
	);
extern PACKAGE void __fastcall PGPConvertBase256to64(AnsiString &str256, AnsiString &str64);
extern PACKAGE void __fastcall PGPConvertBase64to256(AnsiString str64, AnsiString &str256);
extern PACKAGE void __fastcall PGPConvertBase64to2(AnsiString str64, AnsiString &str2);
extern PACKAGE void __fastcall FGIntToBase2String(const TFGInt &FGInt, AnsiString &S);
extern PACKAGE void __fastcall Base2StringToFGInt(AnsiString S, TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntToBase256String(const TFGInt &FGInt, AnsiString &str256);
extern PACKAGE void __fastcall Base256StringToFGInt(AnsiString str256, TFGInt &FGInt);
extern PACKAGE void __fastcall PGPMPIToFGInt(AnsiString PGPMPI, TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntToPGPMPI(const TFGInt &FGInt, AnsiString &PGPMPI);
extern PACKAGE void __fastcall Base10StringToFGInt(AnsiString Base10, TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntToBase10String(const TFGInt &FGInt, AnsiString &Base10);
extern PACKAGE void __fastcall FGIntDestroy(TFGInt &FGInt);
extern PACKAGE TCompare __fastcall FGIntCompareAbs(const TFGInt &FGInt1, const TFGInt &FGInt2);
extern PACKAGE void __fastcall FGIntAdd(const TFGInt &FGInt1, const TFGInt &FGInt2, TFGInt &Sum);
extern PACKAGE void __fastcall FGIntChangeSign(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntSub(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &dif);
extern PACKAGE void __fastcall FGIntMulByInt(const TFGInt &FGInt, TFGInt &res, unsigned by);
extern PACKAGE void __fastcall FGIntMulByIntbis(TFGInt &FGInt, unsigned by);
extern PACKAGE void __fastcall FGIntDivByInt(const TFGInt &FGInt, TFGInt &res, unsigned by, unsigned 
	&modres);
extern PACKAGE void __fastcall FGIntDivByIntBis(TFGInt &FGInt, unsigned by, unsigned &modres);
extern PACKAGE void __fastcall FGIntModByInt(const TFGInt &FGInt, unsigned by, unsigned &modres);
extern PACKAGE void __fastcall FGIntAbs(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntCopy(const TFGInt &FGInt1, TFGInt &FGInt2);
extern PACKAGE void __fastcall FGIntShiftLeft(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntShiftRight(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntShiftRightBy31(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntAddBis(TFGInt &FGInt1, const TFGInt &FGInt2);
extern PACKAGE void __fastcall FGIntSubBis(TFGInt &FGInt1, const TFGInt &FGInt2);
extern PACKAGE void __fastcall FGIntMul(const TFGInt &FGInt1, const TFGInt &FGInt2, TFGInt &Prod);
extern PACKAGE void __fastcall FGIntSquare(const TFGInt &FGInt, TFGInt &Square);
extern PACKAGE void __fastcall FGIntExp(const TFGInt &FGInt, const TFGInt &exp, TFGInt &res);
extern PACKAGE void __fastcall FGIntFac(const TFGInt &FGInt, TFGInt &res);
extern PACKAGE void __fastcall FGIntShiftLeftBy31(TFGInt &FGInt);
extern PACKAGE void __fastcall FGIntDivMod(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &QFGInt, TFGInt &MFGInt
	);
extern PACKAGE void __fastcall FGIntDiv(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &QFGInt);
extern PACKAGE void __fastcall FGIntMod(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &MFGInt);
extern PACKAGE void __fastcall FGIntSquareMod(TFGInt &FGInt, TFGInt &Modb, TFGInt &FGIntSM);
extern PACKAGE void __fastcall FGIntAddMod(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &base, TFGInt &FGIntres
	);
extern PACKAGE void __fastcall FGIntMulMod(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &base, TFGInt &FGIntres
	);
extern PACKAGE void __fastcall FGIntModExp(TFGInt &FGInt, TFGInt &exp, TFGInt &modb, TFGInt &res);
extern PACKAGE void __fastcall FGIntModBis(const TFGInt &FGInt, TFGInt &FGIntOut, unsigned b, unsigned 
	head);
extern PACKAGE void __fastcall FGIntMulModBis(const TFGInt &FGInt1, const TFGInt &FGInt2, TFGInt &Prod
	, unsigned b, unsigned head);
extern PACKAGE void __fastcall FGIntMontgomeryMod(const TFGInt &GInt, const TFGInt &base, const TFGInt 
	&baseInv, TFGInt &MGInt, unsigned b, unsigned head);
extern PACKAGE void __fastcall FGIntMontgomeryModExp(TFGInt &FGInt, TFGInt &exp, TFGInt &modb, TFGInt 
	&res);
extern PACKAGE void __fastcall FGIntGCD(const TFGInt &FGInt1, const TFGInt &FGInt2, TFGInt &GCD);
extern PACKAGE void __fastcall FGIntLCM(const TFGInt &FGInt1, const TFGInt &FGInt2, TFGInt &LCM);
extern PACKAGE void __fastcall FGIntTrialDiv9999(const TFGInt &FGInt, bool &ok);
extern PACKAGE void __fastcall FGIntRandom1(TFGInt &Seed, TFGInt &RandomFGInt);
extern PACKAGE void __fastcall FGIntRabinMiller(TFGInt &FGIntp, unsigned nrtest, bool &ok);
extern PACKAGE void __fastcall FGIntBezoutBachet(TFGInt &FGInt1, TFGInt &FGInt2, TFGInt &a, TFGInt &
	b);
extern PACKAGE void __fastcall FGIntModInv(const TFGInt &FGInt1, const TFGInt &base, TFGInt &Inverse
	);
extern PACKAGE void __fastcall FGIntPrimetest(TFGInt &FGIntp, int nrRMtests, bool &ok);
extern PACKAGE void __fastcall FGIntLegendreSymbol(TFGInt &a, TFGInt &p, int &L);
extern PACKAGE void __fastcall FGIntSquareRootModP(const TFGInt &Square, const TFGInt &Prime, TFGInt 
	&SquareRoot);

}	/* namespace Fgint */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Fgint;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FGInt
