// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'LbxConst.pas' rev: 6.00

#ifndef LbxConstHPP
#define LbxConstHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Lbxconst
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
static const Shortint cBytes128 = 0x10;
static const Shortint cBytes160 = 0x14;
static const Shortint cBytes192 = 0x18;
static const Shortint cBytes256 = 0x20;
static const Shortint cBytes512 = 0x40;
static const Shortint cBytes768 = 0x60;
static const Byte cBytes1024 = 0x80;
static const Shortint cDefIterations = 0x14;
static const Shortint ASN1_TYPE_SEQUENCE = 0x10;
static const Shortint ASN1_TYPE_Integer = 0x2;
static const Shortint ASN1_TAG_NUM_MASK = 0x1f;
static const Shortint ASN1_TYPE_HIGH_TAG_NUMBER = 0x1f;
static const Byte HIGH_BIT_MASK = 0x80;
static const Shortint BIT_MASK_7F = 0x7f;
extern PACKAGE System::ResourceString _sLbVersion;
#define Lbxconst_sLbVersion System::LoadResourceString(&Lbxconst::_sLbVersion)
extern PACKAGE System::ResourceString _sBIBufferUnderflow;
#define Lbxconst_sBIBufferUnderflow System::LoadResourceString(&Lbxconst::_sBIBufferUnderflow)
extern PACKAGE System::ResourceString _sBIBufferNotAssigned;
#define Lbxconst_sBIBufferNotAssigned System::LoadResourceString(&Lbxconst::_sBIBufferNotAssigned)
extern PACKAGE System::ResourceString _sBINoNumber;
#define Lbxconst_sBINoNumber System::LoadResourceString(&Lbxconst::_sBINoNumber)
extern PACKAGE System::ResourceString _sBISubtractErr;
#define Lbxconst_sBISubtractErr System::LoadResourceString(&Lbxconst::_sBISubtractErr)
extern PACKAGE System::ResourceString _sBIZeroDivide;
#define Lbxconst_sBIZeroDivide System::LoadResourceString(&Lbxconst::_sBIZeroDivide)
extern PACKAGE System::ResourceString _sBIQuotientErr;
#define Lbxconst_sBIQuotientErr System::LoadResourceString(&Lbxconst::_sBIQuotientErr)
extern PACKAGE System::ResourceString _sBIZeroFactor;
#define Lbxconst_sBIZeroFactor System::LoadResourceString(&Lbxconst::_sBIZeroFactor)
extern PACKAGE System::ResourceString _sBIIterationCount;
#define Lbxconst_sBIIterationCount System::LoadResourceString(&Lbxconst::_sBIIterationCount)
extern PACKAGE System::ResourceString _sASNKeyTooLarge;
#define Lbxconst_sASNKeyTooLarge System::LoadResourceString(&Lbxconst::_sASNKeyTooLarge)
extern PACKAGE System::ResourceString _sASNKeyBufferOverflow;
#define Lbxconst_sASNKeyBufferOverflow System::LoadResourceString(&Lbxconst::_sASNKeyBufferOverflow)
extern PACKAGE System::ResourceString _sASNKeyBadModulus;
#define Lbxconst_sASNKeyBadModulus System::LoadResourceString(&Lbxconst::_sASNKeyBadModulus)
extern PACKAGE System::ResourceString _sASNKeyBadExponent;
#define Lbxconst_sASNKeyBadExponent System::LoadResourceString(&Lbxconst::_sASNKeyBadExponent)
extern PACKAGE System::ResourceString _sASNKeyBufferTooSmall;
#define Lbxconst_sASNKeyBufferTooSmall System::LoadResourceString(&Lbxconst::_sASNKeyBufferTooSmall)
extern PACKAGE System::ResourceString _sASNKeyBadKey;
#define Lbxconst_sASNKeyBadKey System::LoadResourceString(&Lbxconst::_sASNKeyBadKey)
extern PACKAGE System::ResourceString _sRSAKeyBadKey;
#define Lbxconst_sRSAKeyBadKey System::LoadResourceString(&Lbxconst::_sRSAKeyBadKey)
extern PACKAGE System::ResourceString _sModulusStringTooBig;
#define Lbxconst_sModulusStringTooBig System::LoadResourceString(&Lbxconst::_sModulusStringTooBig)
extern PACKAGE System::ResourceString _sExponentStringTooBig;
#define Lbxconst_sExponentStringTooBig System::LoadResourceString(&Lbxconst::_sExponentStringTooBig)
extern PACKAGE System::ResourceString _sRSAKeyPairErr;
#define Lbxconst_sRSAKeyPairErr System::LoadResourceString(&Lbxconst::_sRSAKeyPairErr)
extern PACKAGE System::ResourceString _sRSAPublicKeyErr;
#define Lbxconst_sRSAPublicKeyErr System::LoadResourceString(&Lbxconst::_sRSAPublicKeyErr)
extern PACKAGE System::ResourceString _sRSAPrivateKeyErr;
#define Lbxconst_sRSAPrivateKeyErr System::LoadResourceString(&Lbxconst::_sRSAPrivateKeyErr)
extern PACKAGE System::ResourceString _sRSAEncryptErr;
#define Lbxconst_sRSAEncryptErr System::LoadResourceString(&Lbxconst::_sRSAEncryptErr)
extern PACKAGE System::ResourceString _sRSADecryptErr;
#define Lbxconst_sRSADecryptErr System::LoadResourceString(&Lbxconst::_sRSADecryptErr)
extern PACKAGE System::ResourceString _sRSABlockSize128Err;
#define Lbxconst_sRSABlockSize128Err System::LoadResourceString(&Lbxconst::_sRSABlockSize128Err)
extern PACKAGE System::ResourceString _sRSABlockSize256Err;
#define Lbxconst_sRSABlockSize256Err System::LoadResourceString(&Lbxconst::_sRSABlockSize256Err)
extern PACKAGE System::ResourceString _sRSABlockSize512Err;
#define Lbxconst_sRSABlockSize512Err System::LoadResourceString(&Lbxconst::_sRSABlockSize512Err)
extern PACKAGE System::ResourceString _sRSABlockSize768Err;
#define Lbxconst_sRSABlockSize768Err System::LoadResourceString(&Lbxconst::_sRSABlockSize768Err)
extern PACKAGE System::ResourceString _sRSABlockSize1024Err;
#define Lbxconst_sRSABlockSize1024Err System::LoadResourceString(&Lbxconst::_sRSABlockSize1024Err)
extern PACKAGE System::ResourceString _sRSAEncodingErr;
#define Lbxconst_sRSAEncodingErr System::LoadResourceString(&Lbxconst::_sRSAEncodingErr)
extern PACKAGE System::ResourceString _sRSADecodingErrBTS;
#define Lbxconst_sRSADecodingErrBTS System::LoadResourceString(&Lbxconst::_sRSADecodingErrBTS)
extern PACKAGE System::ResourceString _sRSADecodingErrBTL;
#define Lbxconst_sRSADecodingErrBTL System::LoadResourceString(&Lbxconst::_sRSADecodingErrBTL)
extern PACKAGE System::ResourceString _sRSADecodingErrIBT;
#define Lbxconst_sRSADecodingErrIBT System::LoadResourceString(&Lbxconst::_sRSADecodingErrIBT)
extern PACKAGE System::ResourceString _sRSADecodingErrIBF;
#define Lbxconst_sRSADecodingErrIBF System::LoadResourceString(&Lbxconst::_sRSADecodingErrIBF)
extern PACKAGE System::ResourceString _sDSAKeyBadKey;
#define Lbxconst_sDSAKeyBadKey System::LoadResourceString(&Lbxconst::_sDSAKeyBadKey)
extern PACKAGE System::ResourceString _sDSAParametersPQGErr;
#define Lbxconst_sDSAParametersPQGErr System::LoadResourceString(&Lbxconst::_sDSAParametersPQGErr)
extern PACKAGE System::ResourceString _sDSAParametersXYErr;
#define Lbxconst_sDSAParametersXYErr System::LoadResourceString(&Lbxconst::_sDSAParametersXYErr)
extern PACKAGE System::ResourceString _sDSASignatureZeroR;
#define Lbxconst_sDSASignatureZeroR System::LoadResourceString(&Lbxconst::_sDSASignatureZeroR)
extern PACKAGE System::ResourceString _sDSASignatureZeroS;
#define Lbxconst_sDSASignatureZeroS System::LoadResourceString(&Lbxconst::_sDSASignatureZeroS)
extern PACKAGE System::ResourceString _sDSASignatureErr;
#define Lbxconst_sDSASignatureErr System::LoadResourceString(&Lbxconst::_sDSASignatureErr)
extern PACKAGE System::ResourceString _SNoStart;
#define Lbxconst_SNoStart System::LoadResourceString(&Lbxconst::_SNoStart)

}	/* namespace Lbxconst */
using namespace Lbxconst;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// LbxConst
