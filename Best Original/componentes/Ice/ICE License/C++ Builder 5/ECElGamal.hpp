// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ECElGamal.pas' rev: 5.00

#ifndef ECElGamalHPP
#define ECElGamalHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Math.hpp>	// Pascal unit
#include <ECGFp.hpp>	// Pascal unit
#include <FGInt.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ecelgamal
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall ECElGamalEncrypt(AnsiString M, const Fgint::TFGInt &P, const Fgint::TFGInt 
	&a, const Fgint::TFGInt &b, const Fgint::TFGInt &k, const Ecgfp::TECPoint &g, const Ecgfp::TECPoint 
	&y, bool Compression, AnsiString &E);
extern PACKAGE void __fastcall ECElGamalDecrypt(AnsiString E, const Fgint::TFGInt &P, const Fgint::TFGInt 
	&a, const Fgint::TFGInt &b, const Fgint::TFGInt &x, AnsiString &D);

}	/* namespace Ecelgamal */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Ecelgamal;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// ECElGamal
