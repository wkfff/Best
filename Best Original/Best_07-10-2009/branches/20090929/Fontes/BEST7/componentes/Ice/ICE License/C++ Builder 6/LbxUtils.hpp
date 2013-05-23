// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxUtils.pas' rev: 6.00

#ifndef LbxUtilsHPP
#define LbxUtilsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxutils
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall BufferToHex(const void *Buf, unsigned BufSize);
extern PACKAGE bool __fastcall HexToBuffer(const AnsiString Hex, void *Buf, unsigned BufSize);
extern PACKAGE int __fastcall Min(int A, int B);
extern PACKAGE int __fastcall Max(int A, int B);
extern PACKAGE bool __fastcall CompareBuffers(const void *Buf1, const void *Buf2, unsigned BufSize);

}	/* namespace Lbxutils */
using namespace Lbxutils;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxUtils
