// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ECGFp.pas' rev: 6.00

#ifndef ECGFpHPP
#define ECGFpHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Math.hpp>	// Pascal unit
#include <FGInt.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ecgfp
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 4)
struct TECPoint
{
	Fgint::TFGInt XCoordinate;
	Fgint::TFGInt YCoordinate;
	bool Infinity;
} ;
#pragma pack(pop)

#pragma pack(push, 4)
struct TOrderList
{
	Fgint::TFGInt order1;
	Fgint::TFGInt order2;
	Fgint::TFGInt order3;
	Fgint::TFGInt order4;
	Fgint::TFGInt order5;
	Fgint::TFGInt order6;
} ;
#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE int primes[1228];
extern PACKAGE void __fastcall ECPointToECPointString(const TECPoint &ECPoint, const Fgint::TFGInt &Prime, bool Compression, AnsiString &ECPointString);
extern PACKAGE void __fastcall ECPointStringToECPoint(AnsiString ECPointString, const Fgint::TFGInt &Prime, const Fgint::TFGInt &a, const Fgint::TFGInt &b, TECPoint &ECPoint);
extern PACKAGE void __fastcall ECPointCopy(const TECPoint &P, TECPoint &Copied);
extern PACKAGE void __fastcall ECPointDestroy(TECPoint &P);
extern PACKAGE void __fastcall ECDoublePoint(const TECPoint &P, const Fgint::TFGInt &Prime, const Fgint::TFGInt &a, TECPoint &Doubled);
extern PACKAGE void __fastcall ECAddPoints(const TECPoint &P, const TECPoint &Q, const Fgint::TFGInt &Prime, const Fgint::TFGInt &a, TECPoint &Sum);
extern PACKAGE void __fastcall ECPointKMultiple(const TECPoint &P, const Fgint::TFGInt &Prime, const Fgint::TFGInt &a, const Fgint::TFGInt &k, TECPoint &Multiple);
extern PACKAGE void __fastcall ECPointInverse(const TECPoint &P, const Fgint::TFGInt &Prime, TECPoint &Inverse);
extern PACKAGE void __fastcall ECInbedStringOnEC(AnsiString InString, const Fgint::TFGInt &Prime, const Fgint::TFGInt &a, const Fgint::TFGInt &b, TECPoint &P, bool &DidItWork);
extern PACKAGE void __fastcall ECExtractInbeddedString(const TECPoint &P, AnsiString &InBeddedString);
extern PACKAGE void __fastcall ECPrimeSearch(Fgint::TFGInt &GInt, Byte nrRMtests);
extern PACKAGE void __fastcall ECFindNextPointOnEC(Fgint::TFGInt &Prime, Fgint::TFGInt &a, Fgint::TFGInt &b, TECPoint &P);
extern PACKAGE void __fastcall ConstructCurveWithCMD(Byte D, Fgint::TFGInt &a0, Fgint::TFGInt &b0);
extern PACKAGE void __fastcall IsCMD(Fgint::TFGInt &D, Fgint::TFGInt &p, Fgint::TFGInt &W, Fgint::TFGInt &V, bool &IsCMD);
extern PACKAGE void __fastcall FindNextCMCandidate(Fgint::TFGInt &p, Byte &D, bool &Found);
extern PACKAGE void __fastcall FindOrders(Fgint::TFGInt &p, Byte &D, TOrderList &Orders, bool &Found);
extern PACKAGE void __fastcall IsNearlyPrime(Fgint::TFGInt &n, int leastsize, Fgint::TFGInt &k, Fgint::TFGInt &r, bool &INP);
extern PACKAGE void __fastcall ConstructCurveAndPointWithGoodORder(Fgint::TFGInt &p, Fgint::TFGInt &k, Fgint::TFGInt &r, Byte D, Fgint::TFGInt &a, Fgint::TFGInt &b, TECPoint &G);
extern PACKAGE void __fastcall ConstructCurveAndPoint(Fgint::TFGInt &p, int leastsize, Fgint::TFGInt &a, Fgint::TFGInt &b, Fgint::TFGInt &k, Fgint::TFGInt &r, TECPoint &G, bool &DidItWork);
extern PACKAGE void __fastcall FindPrimeGoodCurveAndPoint(Fgint::TFGInt &p, Fgint::TFGInt &a, Fgint::TFGInt &b, Fgint::TFGInt &k, Fgint::TFGInt &r, int leastsize, TECPoint &G);
extern PACKAGE void __fastcall IsECSuperSingular(const Fgint::TFGInt &p, const Fgint::TFGInt &a, const Fgint::TFGInt &b, bool &SS);

}	/* namespace Ecgfp */
using namespace Ecgfp;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// ECGFp
