// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'IceLicense.pas' rev: 5.00

#ifndef IceLicenseHPP
#define IceLicenseHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Buttons.hpp>	// Pascal unit
#include <WinSock.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <NetworkTCP.hpp>	// Pascal unit
#include <LbxUtils.hpp>	// Pascal unit
#include <LbxString.hpp>	// Pascal unit
#include <LbxClass.hpp>	// Pascal unit
#include <LbxCipher.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <ECGFp.hpp>	// Pascal unit
#include <ECElGamal.hpp>	// Pascal unit
#include <FPrimeGeneration.hpp>	// Pascal unit
#include <FGInt.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <IniFiles.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <TLHelp32.hpp>	// Pascal unit
#include <ShellAPI.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Icelicense
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 1)
struct TRC4Data
{
	Byte Key[256];
	Byte OrgKey[256];
} ;
#pragma pack(pop)

#pragma option push -b-
enum TLS { ltNone, ltFull, ltTrial };
#pragma option pop

#pragma option push -b-
enum LState { lsNone, lsExpired, lsValid };
#pragma option pop

typedef void __fastcall (__closure *TrialInfoEvent)(int TrialStatus, AnsiString ExtraLicenseInfo);

typedef void __fastcall (__closure *LicenseInfoEvent)(TLS LicenseType, AnsiString DateCreation, AnsiString 
	UserName, AnsiString UserOrg, AnsiString VendorName, AnsiString VendorOrg, AnsiString ExpirationMode
	, AnsiString ExpirationInfo, bool NetworkControl, bool HardwareLocked);

typedef void __fastcall (__closure *TFullLicenseEvent)(int ExpiresInfo, AnsiString ExtraLicenseInfo)
	;

typedef void __fastcall (__closure *TNetworkRefused)(AnsiString ErrorMsg);

#pragma option push -b-
enum TBrowserState { bsMaximized, bsNormal };
#pragma option pop

class DELPHICLASS TIceLicense;
class PASCALIMPLEMENTATION TIceLicense : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	AnsiString FDateCreation;
	AnsiString FDateLicense;
	AnsiString FPKey;
	AnsiString FLicenseExpires;
	AnsiString FActiveKey;
	System::SmallString<4>  FUserID;
	BOOL FTransfer;
	AnsiString FUsername;
	AnsiString FUserOrg;
	AnsiString FCopyright;
	AnsiString FProgName;
	AnsiString FVendor;
	AnsiString FVendorOrg;
	BOOL FHardwardLock;
	#pragma pack(push, 1)
	TRC4Data FCipher;
	#pragma pack(pop)
	
	AnsiString FTrialMode;
	AnsiString FTrialInfo;
	BOOL FCP;
	BOOL FAM;
	BOOL FAD;
	bool FNetworkMode;
	bool FHardwareLockMode;
	System::SmallString<65>  FExtraInfo;
	AnsiString FLicenseDateCreation;
	AnsiString FActivationDate;
	AnsiString FTrialCStatus;
	AnsiString FCurrentDate;
	Extctrls::TTimer* FTimeOut;
	Extctrls::TTimer* FCSys;
	Extctrls::TTimer* FADPTimer;
	int FTimeInterval;
	AnsiString FURL;
	AnsiString FeMail;
	AnsiString FeMailSubject;
	AnsiString FeMailCC;
	TBrowserState FBrowserState;
	AnsiString FServerIP;
	int FServerPort;
	BOOL FReg;
	Classes::TStringList* FStrings;
	Classes::TStringList* FLicenseCode;
	Classes::TNotifyEvent FOnNoLicense;
	Classes::TNotifyEvent FOnTrialExpired;
	Classes::TNotifyEvent FOnLicenseExpired;
	Classes::TNotifyEvent FOnLicenseInvalid;
	TrialInfoEvent FOnLicenseTrial;
	Classes::TNotifyEvent FOnClockisBack;
	Classes::TNotifyEvent FOnExeCheck;
	TFullLicenseEvent FOnLicenseFull;
	LicenseInfoEvent FOnLicenseInfo;
	Classes::TNotifyEvent FOnExeNotEncrypted;
	Classes::TNotifyEvent FOnMachineIDInvalid;
	Classes::TNotifyEvent FOnKeyExported;
	TNetworkRefused FOnNetworkRefused;
	Classes::TNotifyEvent FOnNetworkAccepted;
	Classes::TNotifyEvent FOnLicenseTransfered;
	TLS FLS;
	LState FSLicense;
	void __fastcall DoTimer(System::TObject* Sender);
	void __fastcall DoCheck(System::TObject* Sender);
	void __fastcall DoADP(System::TObject* Sender);
	void __fastcall SecureMemoryTrial(AnsiString SCkey);
	void __fastcall SecureMemoryFull(AnsiString SCkey);
	void __fastcall ReadLicense(AnsiString license);
	void __fastcall PreLoad3(void);
	bool __fastcall FPEF(void);
	AnsiString __fastcall GetCRC32File();
	AnsiString __fastcall GetMD5(AnsiString text);
	int __fastcall DateToInt(AnsiString s);
	AnsiString __fastcall GetCurrentDate();
	int __fastcall DayLeft(AnsiString DateInitial, int FTrialDays);
	
protected:
	bool __fastcall RC4SelfTest(void);
	void __fastcall RC4Init(TRC4Data &Data, void * Key, int Len);
	void __fastcall RC4Burn(TRC4Data &Data);
	void __fastcall RC4Crypt(TRC4Data &Data, void * InData, void * OutData, int Len);
	void __fastcall RC4Reset(TRC4Data &Data);
	virtual void __fastcall DefineProperties(Classes::TFiler* filer);
	virtual void __fastcall ReadData1(Classes::TStream* Reader)/* overload */;
	virtual void __fastcall WriteData1(Classes::TStream* Writer)/* overload */;
	virtual void __fastcall ReadData2(Classes::TStream* Reader)/* overload */;
	virtual void __fastcall WriteData2(Classes::TStream* Writer)/* overload */;
	void __fastcall PKReadData(Classes::TReader* reader);
	void __fastcall PKWriteData(Classes::TWriter* writer);
	void __fastcall CRReadData(Classes::TReader* reader);
	void __fastcall CRWriteData(Classes::TWriter* writer);
	void __fastcall ANReadData(Classes::TReader* reader);
	void __fastcall ANWriteData(Classes::TWriter* writer);
	void __fastcall AKReadData(Classes::TReader* reader);
	void __fastcall AKWriteData(Classes::TWriter* writer);
	void __fastcall EMReadData(Classes::TReader* reader);
	void __fastcall EMWriteData(Classes::TWriter* writer);
	void __fastcall MSReadData(Classes::TReader* reader);
	void __fastcall MSWriteData(Classes::TWriter* writer);
	void __fastcall URLReadData(Classes::TReader* reader);
	void __fastcall URLWriteData(Classes::TWriter* writer);
	void __fastcall UNReadData(Classes::TReader* reader);
	void __fastcall UNWriteData(Classes::TWriter* writer);
	void __fastcall UOReadData(Classes::TReader* reader);
	void __fastcall UOWriteData(Classes::TWriter* writer);
	void __fastcall SetStrings(Classes::TStrings* AStrings);
	Classes::TStrings* __fastcall GetStrings(void);
	void __fastcall SetStringsA(Classes::TStrings* AStrings);
	Classes::TStrings* __fastcall GetStringsA(void);
	void __fastcall SetAKStrings(AnsiString value);
	void __fastcall SetANStrings(AnsiString value);
	void __fastcall SetcString(AnsiString value);
	void __fastcall SetPKStrings(AnsiString value);
	void __fastcall SetUNStrings(AnsiString value);
	void __fastcall SetUGStrings(AnsiString value);
	void __fastcall SetBrowserState(TBrowserState value);
	void __fastcall TriPublicKey(AnsiString pk);
	bool __fastcall ReadRL(void);
	void __fastcall WriteRL(AnsiString Username, AnsiString UserOrg, AnsiString LicenseK, AnsiString ActiveK
		, AnsiString DActivation);
	bool __fastcall ResetRL(void);
	bool __fastcall TLicenseRL(void);
	bool __fastcall ReadTrialRL(AnsiString LicenseDateCreation);
	void __fastcall WriteTrialRL(AnsiString LicenseDateCreation, AnsiString DateActivation, AnsiString 
		LastDate, AnsiString TrialStatus);
	AnsiString __fastcall GetRealDS();
	AnsiString __fastcall SystemFolder(AnsiString sCle);
	AnsiString __fastcall ELData(AnsiString s, AnsiString key);
	AnsiString __fastcall DLData(AnsiString s, AnsiString key);
	virtual bool __fastcall IsEmpty(void);
	virtual bool __fastcall IsEmpty2(void);
	AnsiString __fastcall BrowserPath();
	void __fastcall TransferLicense(void);
	
public:
	__fastcall virtual TIceLicense(Classes::TComponent* AOwner);
	__fastcall virtual ~TIceLicense(void);
	TLS __fastcall LicenseType(void);
	LState __fastcall LicenseState(void);
	AnsiString __fastcall Base64Encode(const AnsiString s);
	AnsiString __fastcall Base64Decode(const AnsiString s);
	AnsiString __fastcall HexToStr(AnsiString s);
	AnsiString __fastcall StrToHex(AnsiString s);
	AnsiString __fastcall GetMachineID();
	AnsiString __fastcall GetExtraInfo();
	AnsiString __fastcall GetLicenseKey();
	AnsiString __fastcall GetLicenseUsername();
	AnsiString __fastcall GetLicenseUserOrg();
	void __fastcall ServerIP(AnsiString ServerIPAddress);
	void __fastcall ServerPort(int ServerPort);
	void __fastcall ClientReadData(System::TObject* Sender, Classes::TStream* Stream);
	void __fastcall ClientErrorMsg(System::TObject* Sender, int Socket, int ErrorCode, const AnsiString 
		ErrorMsg);
	void __fastcall ClientConnected(System::TObject* Sender);
	bool __fastcall LoadLicenseFromFile(AnsiString filename);
	bool __fastcall EraseLicenseInfo(void);
	bool __fastcall IsAdminMode(void);
	AnsiString __fastcall AESEncrypt(AnsiString s, AnsiString cryptkey);
	AnsiString __fastcall AESDecrypt(AnsiString s, AnsiString cryptkey);
	void __fastcall PreLoad(void);
	void __fastcall PreLoad2(void);
	bool __fastcall CodeProtectorFull(AnsiString ActiveKey);
	bool __fastcall CodeProtectorTrial(void);
	void __fastcall ProtectCode(AnsiString ActiveKey);
	BOOL __fastcall SendMail(void);
	BOOL __fastcall GoURL(void);
	bool __fastcall FCode(void);
	void __fastcall Run(void);
	void __fastcall CheckLicense(void);
	void __fastcall Antitrace(void);
	
__published:
	__property Classes::TStrings* SecureStrings = {read=GetStrings, write=SetStrings, stored=false};
	__property Classes::TStrings* LicenseKey = {read=GetStringsA, write=SetStringsA, stored=false};
	__property BOOL CodeEncryption = {read=FCP, write=FCP, stored=true, nodefault};
	__property BOOL AntiDebugging = {read=FAD, write=FAD, stored=true, nodefault};
	__property BOOL AntiMonitoring = {read=FAM, write=FAM, stored=true, nodefault};
	__property AnsiString AboutCopyright = {read=FCopyright, write=SetcString, stored=false};
	__property AnsiString AppPublicKey = {read=FPKey, write=SetPKStrings, stored=false};
	__property AnsiString ApplicationName = {read=FProgName, write=SetANStrings, stored=false};
	__property AnsiString ActiveKey = {read=FActiveKey, write=SetAKStrings, stored=false};
	__property AnsiString UserName = {read=FUsername, write=SetUNStrings, stored=false};
	__property AnsiString UserOrganization = {read=FUserOrg, write=SetUGStrings, stored=false};
	__property TBrowserState WebBrowserState = {read=FBrowserState, write=SetBrowserState, nodefault};
	__property AnsiString WebURL = {read=FURL, write=FURL, stored=false};
	__property AnsiString eMail = {read=FeMail, write=FeMail, stored=false};
	__property AnsiString eMailCC = {read=FeMailCC, write=FeMailCC, stored=true};
	__property AnsiString eMailSubject = {read=FeMailSubject, write=FeMailSubject, stored=false};
	__property Classes::TNotifyEvent OnExeModified = {read=FOnExeCheck, write=FOnExeCheck};
	__property Classes::TNotifyEvent OnExeNotEncrypted = {read=FOnExeNotEncrypted, write=FOnExeNotEncrypted
		};
	__property Classes::TNotifyEvent OnBadMachineID = {read=FOnMachineIDInvalid, write=FOnMachineIDInvalid
		};
	__property Classes::TNotifyEvent OnLicenseExpired = {read=FOnLicenseExpired, write=FOnLicenseExpired
		};
	__property Classes::TNotifyEvent OnLicenseInvalid = {read=FOnLicenseInvalid, write=FOnLicenseInvalid
		};
	__property LicenseInfoEvent OnLicenseInfo = {read=FOnLicenseInfo, write=FOnLicenseInfo};
	__property TrialInfoEvent OnLicenseTrial = {read=FOnLicenseTrial, write=FOnLicenseTrial};
	__property Classes::TNotifyEvent OnTrialExpired = {read=FOnTrialExpired, write=FOnTrialExpired};
	__property TFullLicenseEvent OnLicenseFull = {read=FOnLicenseFull, write=FOnLicenseFull};
	__property Classes::TNotifyEvent OnClockMovedBack = {read=FOnClockisBack, write=FOnClockisBack};
	__property TNetworkRefused OnNetworkRefused = {read=FOnNetworkRefused, write=FOnNetworkRefused};
	__property Classes::TNotifyEvent OnNetworkAccepted = {read=FOnNetworkAccepted, write=FOnNetworkAccepted
		};
	__property Classes::TNotifyEvent OnKeyExported = {read=FOnKeyExported, write=FOnKeyExported};
	__property Classes::TNotifyEvent OnNoneLicense = {read=FOnNoLicense, write=FOnNoLicense};
	__property Classes::TNotifyEvent OnLicenseTransfered = {read=FOnLicenseTransfered, write=FOnLicenseTransfered
		};
};


//-- var, const, procedure ---------------------------------------------------
#define ICELicenseHeader "--------(LicenseKey)-------"
#define ICELicenseData "--------(LicenseData)-------"
extern PACKAGE void __fastcall Register(void);

}	/* namespace Icelicense */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Icelicense;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// IceLicense
