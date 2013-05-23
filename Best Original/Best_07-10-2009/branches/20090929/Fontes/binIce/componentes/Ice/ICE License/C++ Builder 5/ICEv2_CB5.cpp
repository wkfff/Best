//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("ICEv2_CB5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("AES_Rijndael.pas");
USEUNIT("ECElGamal.pas");
USEUNIT("ECGFp.pas");
USEUNIT("FGInt.pas");
USEUNIT("FPrimeGeneration.pas");
USEUNIT("IceLicense.pas");
USERES("IceLicense.dcr");
USEUNIT("LbxCipher.pas");
USEUNIT("LbxClass.pas");
USEUNIT("LbxConst.pas");
USEUNIT("LbxProc.pas");
USEUNIT("LbxString.pas");
USEUNIT("LbxUtils.pas");
USEUNIT("NetworkTCP.pas");
USERES("NetworkTCP.dcr");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Source du paquet.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
