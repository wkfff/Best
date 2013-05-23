unit bst_icereg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IceLicense, StdCtrls, Buttons, ComCtrls, ExtCtrls,fonctions,
  Animate, GIFCtrl, {Psock, NMsmtp,}winsock, Clipbrd, {PushBtn,}reinit,bst_basefrm;

type
  Tfrm_icerg = class(TBasefrm)
    gb1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    Label12: TLabel;
    gb: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    GroupBox7: TGroupBox;
    Panel1: TPanel;
    Label11: TLabel;
    Label13: TLabel;
    ptipo: TLabel;
    pver: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    sv: TSaveDialog;
    Panel3: TPanel;
    Edit5: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    pcont: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure IceLicense1TrialExpired(Sender: TObject);
    procedure IceLicense1ClockMovedBack(Sender: TObject);
    procedure IceLicense1LicenseInvalid(Sender: TObject);
    procedure IceLicense1LicenseExpired(Sender: TObject);
    procedure IceLicense1ExeModified(Sender: TObject);
    procedure IceLicense1BadMachineID(Sender: TObject);
    procedure IceLicense1NetworkRefused(ErrorMsg: String);
    procedure FormCreate(Sender: TObject);
    procedure IceLicense1LicenseTrial(TrialStatus: Integer;
      ExtraLicenseInfo: String);
    procedure IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
      UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
      ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure IceLicense1NoneLicense(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure erasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IceLicense1LicenseFull(ExpiresInfo: Integer;ExtraLicenseInfo: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure pcont1Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure pcontClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure IceLicense1ExeNotEncrypted(Sender: TObject);
  private
    FVALIDADE: INTEGER;
    FDATAFIM: REAL;
    FDATAINI: REAL;
    FFS: TFormstate;
    Fexpired: boolean;
    Ffull: boolean;
    Finfo: boolean;
    Finvalid: boolean;
    Ftrial: boolean;
    Fnetworkrefusal: boolean;
    Fnonelicense: boolean;
    Ftrialexpired: booleAN;
    FHardwareLocked: boolean;
    FNetworkControl: boolean;
    FVendorName: string;
    FDateCreation: string;
    FExpirationMode: string;
    FUserOrg: string;
    FUserName: string;
    FVendorOrg: string;
    FExpirationInfo: String;
    FLicenseType: TLS;
    FpTRialStatus: integer;
    FpExtraLicenseInfo: string;
    FpKeyExported: boolean;
   FpExenotencrypted: boolean;
    Fpexemodified: boolean;
    FpBadMachine: boolean;
    FpClock: boolean;
    FpNetworkrefused: boolean;
    FpRegExcluido: boolean;
    Fpsair: boolean;
    FpResult: boolean;
    procedure SetDATAFIM(const Value: REAL);
    procedure SetDATAINI(const Value: REAL);
    procedure SetVALIDADE(const Value: INTEGER);
    procedure SetFS(const Value: TFormstate);
    procedure Setexpired(const Value: boolean);
    procedure Setfull(const Value: boolean);
    procedure Setinfo(const Value: boolean);
    procedure Setinvalid(const Value: boolean);
    procedure Settrial(const Value: boolean);
    procedure Setnetworkrefusal(const Value: boolean);
    procedure Setnonelicense(const Value: boolean);
    procedure Settrialexpired(const Value: boolean);
    procedure SetDateCreation(const Value: string);
    procedure SetExpirationInfo(const Value: String);
    procedure SetExpirationMode(const Value: string);
    procedure SetHardwareLocked(const Value: boolean);
    procedure SetLicenseType(const Value: TLS);
    procedure SetNetworkControl(const Value: boolean);
    procedure SetUserName(const Value: string);
    procedure SetUserOrg(const Value: string);
    procedure SetVendorName(const Value: string);
    procedure SetVendorOrg(const Value: string);
    procedure SetpExtraLicenseInfo(const Value: string);
    procedure SetpTRialStatus(const Value: integer);
    procedure SetpBadMachine(const Value: boolean);
    procedure SetpClock(const Value: boolean);
    procedure Setpexemodified(const Value: boolean);
    procedure SetpExenotencrypted(const Value: boolean);
    procedure SetpKeyExported(const Value: boolean);
    procedure SetpNetworkrefused(const Value: boolean);
    procedure SetpRegExcluido(const Value: boolean);
    procedure Setpsair(const Value: boolean);
    procedure SetpResult(const Value: boolean);
    procedure Limpa_Eventos;


    { Déclarations privées }
  public
    { Déclarations publiques }
  published
   property DATAINI : REAL read FDATAINI write SetDATAINI;
   property DATAFIM : REAL read FDATAFIM write SetDATAFIM;
   property VALIDADE : INTEGER read FVALIDADE write SetVALIDADE;
   property FS : TFormstate read FFS write SetFS;
   property expired : boolean read Fexpired write Setexpired;
   property full : boolean read Ffull write Setfull;
   property info : boolean read Finfo write Setinfo;
   property invalid : boolean read Finvalid write Setinvalid;
   property trial : boolean read Ftrial write Settrial;
   property networkrefusal : boolean read Fnetworkrefusal write Setnetworkrefusal;
   property nonelicense : boolean read Fnonelicense write Setnonelicense;
   property trialexpired : boolean read Ftrialexpired write Settrialexpired;

   property  pLicenseType: TLS  read FLicenseType write SetLicenseType;
   property  pDateCreation : string read FDateCreation write SetDateCreation;
   property  pUserName : string read FUserName write SetUserName;
   property  pUserOrg : string read FUserOrg write SetUserOrg;
   property  pVendorName : string read FVendorName write SetVendorName;
   property  pVendorOrg : string read FVendorOrg write SetVendorOrg;
   property  pExpirationMode : string read FExpirationMode write SetExpirationMode;
   property  pExpirationInfo: String read FExpirationInfo write SetExpirationInfo;
   property  pNetworkControl : boolean read FNetworkControl write SetNetworkControl;
   property  pHardwareLocked: boolean read FHardwareLocked write SetHardwareLocked;
   property  pTRialStatus : integer read FpTRialStatus write SetpTRialStatus;
   property  pExtraLicenseInfo : string read FpExtraLicenseInfo write SetpExtraLicenseInfo;
   property  pBadMachine : boolean read FpBadMachine write SetpBadMachine;
   property  pClock : boolean read FpClock write SetpClock;
   property  pexemodified : boolean read Fpexemodified write Setpexemodified;
   property  pExenotencrypted : boolean read FpExenotencrypted write SetpExenotencrypted;
   property  pKeyExported : boolean read FpKeyExported write SetpKeyExported;
   property  pNetworkrefused : boolean read FpNetworkrefused write SetpNetworkrefused;
   property  pRegExcluido: boolean read FpRegExcluido write SetpRegExcluido;
   property  psair : boolean read Fpsair write Setpsair;

   property  pResult : boolean read FpResult write SetpResult;
   function testa_licenca: boolean;
   procedure LoadConstantObj;override;
  end;

{resourcestring
mensreg1 = 'Dados para Licenciamento foram salvos no arquivo :';
Mensreg1_1 = 'Enviar esse Arquivo para MYTECH : best.suporte@5a.com.br para obter Licença' ;
Mensreg2 = 'A Licença expirou! Favor Registrar!';
MensReg3 = 'A Data do Sistema foi recuada! Voltar a Data Correta! !';
Mensreg4 = 'O Programa executável foi modificado! Voltar o Original! !';
MensReg5 = 'Esse Computador não esta autorizado a usar este programa!Solicite uma Licença !';
MensReg6 = 'Licença Inválida!' +#13+ 'Verificar usuário, Empresa e Chave e Tentar Outra Vez!';
MensReg7 = 'Licença Full Expirada, favor renovar !';
MensReg8 = 'Licença Provisória para ';
Mensreg8_8= 'Empresa :';
MensReg9 = 'Nenhuma Licença foi detectada para esse Programa : (ID Computador : ';
MensReg10= 'Registro Excluido!';
MensReg11= 'Licença Provisória!';
MensReg12= 'Sem Licença'  ;   }
var
  frm_icerg: Tfrm_icerg;
  mens : string;
implementation

uses bst_main;


{$R *.dfm}

procedure Tfrm_icerg.BitBtn2Click(Sender: TObject);
begin
 frm_main.LicencaOK := testa_licenca;

 close;

end;


procedure Tfrm_icerg.IceLicense1TrialExpired(Sender: TObject);
begin
 Mens := MensReg2;
 TRIALEXPIRED := TRUE;


end;

procedure Tfrm_icerg.IceLicense1ClockMovedBack(Sender: TObject);
begin
 Mens := MensReg3;
 pClock := true;
// Application.Terminate;
end;

procedure Tfrm_icerg.IceLicense1LicenseInvalid(Sender: TObject);
begin
 Mens := MensReg6;
 INVALID := TRUE;
end;

procedure Tfrm_icerg.IceLicense1LicenseExpired(Sender: TObject);
begin
 Mens := Mensreg7;
 EXPIRED := TRUE;

end;

procedure Tfrm_icerg.IceLicense1ExeModified(Sender: TObject);
begin
 Mens := MensReg4;
  pExeModified := true;
// Application.Terminate;
end;

procedure Tfrm_icerg.IceLicense1BadMachineID(Sender: TObject);
begin
 Mens := Mensreg5;
 pbadMachine := true;
 //Application.Terminate;
end;

procedure Tfrm_icerg.IceLicense1NetworkRefused(ErrorMsg: String);
begin
 mens := ErrorMsg;
 pNetWorkRefused := true;
// Application.Terminate;
end;

procedure Tfrm_icerg.FormCreate(Sender: TObject);
begin
 {pResult := true;

If (frm_main.viewer) then
    //  IceLicense1.AppPublicKey := 'PrLBPximPREjPDDkPke9PDmuKDvmNm5vPpvM7whLP7N9PNBiK9rD7xCEP9NFPvBdPFej7sBePDLm7uPgPAm7P4FeKPtD7sHCJGtz7tkLPFBmPLDPQC~yQbbyQbjy.'
    ////IceLicense1.AppPublicKey := 'PrLBPximPREjPDDkPke9PDmuKDvmNm5vPpvM7whLP7N9PNBiK9rD7xCEP9NFPvBdPFej7sBePDLm7uPgPAm7P4FeKPtD7sHCJGtz7tkLPFBmPLDPQC~yQbbyQbjy.'
  else
    ////IceLicense1.AppPublicKey := 'PmD9PBAnP53rPmFUPkMh7sGNKjtHNEmsKFt7PTGvKstkPmFpPCCuN#FrKKrDPnMfPBNb7rnmP5nFPU3fPk6DNRCsP5tCPM53PhdRNjhuPH8nJdwvQN~yQbbyQbsy.';
     // IceLicense1.AppPublicKey :=   'PmD9PBAnP53rPmFUPkMh7sGNKjtHNEmsKFt7PTGvKstkPmFpPCCuN#FrKKrDPnMfPBNb7rnmP5nFPU3fPk6DNRCsP5tCPM53PhdRNjhuPH8nJdwvQN~yQbbyQbsy.';

    ////edit4.Text := IceLicense1.GetMachineID;
 with frm_main do
  Begin
   If Viewer then
     self.ptipo.caption  := 'BEST VIEWER'
  else
     self.ptipo.caption := 'BEST DESIGN';
  self.pver.caption := frm_main.edit2.Text;
  end;

 IceLicense1.Run;
 If not Testa_Licenca then
  Begin
    
     Begin
       frm_main.LicencaOK := false;
       close;
     end;
    
  end;}
end;

procedure Tfrm_icerg.IceLicense1LicenseTrial(TrialStatus: Integer;
  ExtraLicenseInfo: String);
begin
 TRIAL := TRUE;
 label16.caption := inttostr(TrialStatus)+ def351+')';
 pTRialStatus      := TRialStatus;
 pExtraLicenseInfo :=  ExtraLicenseInfo  ;
 //frm_main.MensAbout := MensReg8+ IceLicense1.UserName+#13+ MensReg8_8+ IceLicense1.UserOrganization;

//GroupBox4.Enabled := True;
end;

procedure Tfrm_icerg.IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
  UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
  ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);

begin
  INFO := TRUE;
  pLicenseType     :=   LicenseType;
  pDateCreation    :=   DateCreation ;
  pUserName        :=   UserName ;
  pUserOrg         :=   UserOrg ;
  pVendorName      :=   VendorName ;
  pVendorOrg       :=   VendorOrg ;
  pExpirationMode  :=   ExpirationMode  ;
  pExpirationInfo  :=   ExpirationInfo ;
  pNetworkControl  :=   NetworkControl ;
  pHardwareLocked  :=   HardwareLocked ;
end;

procedure Tfrm_icerg.BitBtn3Click(Sender: TObject);
begin
 If OpenDialog1.Execute Then
  Begin
   If FileExists(OpenDialog1.FileName) Then
    Begin
     //IceLicense1.LoadLicenseFromFile(OpenDialog1.FileName);
     Limpa_eventos;

     Mens := '';
     //IceLicense1.CheckLicense;
     presult := Testa_licenca;
    End;
  End;
end;

procedure Tfrm_icerg.IceLicense1NoneLicense(Sender: TObject);
begin
 //Mens:= MensReg9+IceLicense1.GetMachineID+')';
 NONELICENSE := TRUE;

end;

procedure Tfrm_icerg.Limpa_Eventos;
 Begin
  expired        := false;
  full           := false;
  info           := false;
  invalid        := false;
  trial          := false;
  networkrefusal :=  false;
  nonelicense    := false;
  trialexpired   := false;
  pClock         := false;
  pexemodified   := false;
  pExenotencrypted := false;
  pKeyExported   := false;
  pNetworkrefused:= false;
  pRegExcluido   := false;
  psair          := false;
 end;

procedure Tfrm_icerg.BitBtn1Click(Sender: TObject);
begin
 psair := true;
 mens := '';
 frm_main.LicencaOK := testa_licenca;
 close;
end;

procedure Tfrm_icerg.SetDATAFIM(const Value: REAL);
begin
  FDATAFIM := Value;
end;

procedure Tfrm_icerg.SetDATAINI(const Value: REAL);
begin
  FDATAINI := Value;
end;

procedure Tfrm_icerg.SetVALIDADE(const Value: INTEGER);
begin
  FVALIDADE := Value;
end;

procedure Tfrm_icerg.BitBtn4Click(Sender: TObject);
begin
 If (edit1.text = '') or (edit2.text = '') or (edit4.text = '') then
      Raise exception.create(Mens78);
 //IceLicense1.UserName         := Edit1.Text;
 //IceLicense1.UserOrganization := Edit2.Text;
 //IceLicense1.LicenseKey.Assign(Memo1.Lines);
 //IceLicense1.ActiveKey        := Edit3.Text;
 Limpa_Eventos;
 Mens := '';
 //IceLicense1.CheckLicense;
 pResult := testa_licenca;
end;

procedure Tfrm_icerg.erasClick(Sender: TObject);
begin
 {If IceLicense1.EraseLicenseInfo Then
   Begin
    Mens := MensReg10;
    pregExcluido := true;
    frm_main.LicencaOK := testa_licenca;
    close;
   end;}
end;

procedure Tfrm_icerg.SetFS(const Value: TFormstate);
begin
  FFS := Value;
end;

procedure Tfrm_icerg.FormShow(Sender: TObject);
begin
//with frm_icerg do
   inherited  ;

  //rg1.Animate := true;
end;

procedure Tfrm_icerg.LoadConstantObj;
Begin
     Caption := DEF902;
     gb.Caption  := def361;
     SPEEDbUTTON6.Hint := def901; //'Sair'
     speedButton6.Caption := def901 ;//'Sair'
     pCont.Hint := def1111;
     pCont.Caption := def7774;//'Continuar/Continue  '
     label5.Caption := def6401; //'Usuário/User :'
     label1.Caption := def6401; //'Usuário/User :'
     label2.Caption := Mensreg8_8;//'Empresa / Company'
     label4.Caption := def7890;//'ID Computador/ ID Computer'
     speedButton2.Hint := def78901;//'Gravar dados para Licenciamento'
     GroupBox7.Caption := def741;//'Importar Licença do Arquivo/Import form File'
     gb1.Caption := def361;//'Informações sobre a Licença/License Information'
     //label5.Caption := def6401;//'Usuário/User'
     Label6.Caption := def122;//'Tipo Licença / License Type'
     label7.Caption := def621;//'Data Expiração /License End :'
     label3.Caption := def622;// 'Data Registro/Date'
     label17.Caption :=  def1020;//'(A Licença vence em :'
    end;

procedure Tfrm_icerg.Setexpired(const Value: boolean);
begin
  Fexpired := Value;
end;

procedure Tfrm_icerg.Setfull(const Value: boolean);
begin
  Ffull := Value;
end;

procedure Tfrm_icerg.Setinfo(const Value: boolean);
begin
  Finfo := Value;
end;

procedure Tfrm_icerg.Setinvalid(const Value: boolean);
begin
  Finvalid := Value;
end;

procedure Tfrm_icerg.Settrial(const Value: boolean);
begin
  Ftrial := Value;
end;

procedure Tfrm_icerg.Setnetworkrefusal(const Value: boolean);
begin
  Fnetworkrefusal := Value;
end;

procedure Tfrm_icerg.Setnonelicense(const Value: boolean);
begin
  Fnonelicense := Value;
end;

procedure Tfrm_icerg.Settrialexpired(const Value: booleAN);
begin
  Ftrialexpired := Value;
end;

procedure Tfrm_icerg.IceLicense1LicenseFull(ExpiresInfo: Integer;
  ExtraLicenseInfo: String);
begin
  FULL := TRUE;
  frm_main.LicencaOK := true;
  //frm_main.MensAbout := MensReg8+ IceLicense1.UserName+#13+ MensReg8_8+ IceLicense1.UserOrganization;
  close;
end;

procedure Tfrm_icerg.SetDateCreation(const Value: string);
begin
  FDateCreation := Value;
end;

procedure Tfrm_icerg.SetExpirationInfo(const Value: String);
begin
  FExpirationInfo := Value;
end;

procedure Tfrm_icerg.SetExpirationMode(const Value: string);
begin
  FExpirationMode := Value;
end;

procedure Tfrm_icerg.SetHardwareLocked(const Value: boolean);
begin
  FHardwareLocked := Value;
end;

procedure Tfrm_icerg.SetLicenseType(const Value: TLS);
begin
  FLicenseType := Value;
end;

procedure Tfrm_icerg.SetNetworkControl(const Value: boolean);
begin
  FNetworkControl := Value;
end;

procedure Tfrm_icerg.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure Tfrm_icerg.SetUserOrg(const Value: string);
begin
  FUserOrg := Value;
end;

procedure Tfrm_icerg.SetVendorName(const Value: string);
begin
  FVendorName := Value;
end;

procedure Tfrm_icerg.SetVendorOrg(const Value: string);
begin
  FVendorOrg := Value;
end;

procedure Tfrm_icerg.SetpExtraLicenseInfo(const Value: string);
begin
  FpExtraLicenseInfo := Value;
end;

procedure Tfrm_icerg.SetpTRialStatus(const Value: integer);
begin
  FpTRialStatus := Value;
end;

function Tfrm_icerg.testa_licenca : boolean;
 Begin
  result := true;

  with self do
   Begin
       edit5.text:= mens;
       gb1.visible :=  false;
       gb.Visible  :=  true;
       If (pSair) then
           result := false
       else
        If (pBadMachine) or (pClock) or (pNetworkRefused) or (pRegExcluido) then
         Begin
         If not self.Active then
               ShowModal;
         result := false;

         end
       else

       If full then
        Begin
          frm_main.wdemo := false;
          Close ;
        end

       else
       begin
        If (EXPIRED) or (INVALID) THEN
         Begin
          If not frm_main.wdemo then
             showmessage(mens);
         end  ;

        If INFO then
         Begin
            //Label8.Caption  := icelicense1.Username;
            label12.Caption := Invertedata(copy(pdateCreation,1,10));

           dataini :=   strtodate(Invertedata(copy(pdateCreation,1,10)));
           label12.Caption := formatdatetime('dd-mmm-yyyy',dataini);
           If pLicenseType = ltFull Then
            // close
           else
           If pLicenseType = ltTrial Then
              Label9.Caption := MensReg11
           else
           If pLicenseType = ltNone Then
              Label9.Caption := MensReg12;

        end  ;

        If TRIAL then
         Begin
           caption := caption + ' : '+MensReg11;
           VALIDADE :=  pTrialStatus;
          // dataFim :=   strtodate(Invertedata(copy(pdateCreation,1,10)))+ VALIDADE;
           dataFim :=   date + VALIDADE;
           label10.Caption := formatdatetime('dd-mmm-yyyy',datafim);
           gb1.visible := true;
           gb.Visible := false;
           pCont.enabled := true;
           frm_main.wdemo := false;
         end ;

        If (NONELICENSE) or (TRIALEXPIRED) then
         Begin
          // If not frm_main.wdemo then
            Begin
              showmessage(Mens);
              gb1.visible :=  false;
              gb.Visible  :=  true;
              frm_main.wdemo := true;
            end;


         end;

         If frm_main.wdemo then
            pCont.enabled := true;

         If not self.Active then
               ShowModal;



      end;
  end;
 end;

procedure Tfrm_icerg.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 // frm_icerg := nil;
  action := caHide;
end;

procedure Tfrm_icerg.SetpBadMachine(const Value: boolean);
begin
  FpBadMachine := Value;
end;

procedure Tfrm_icerg.SetpClock(const Value: boolean);
begin
  FpClock := Value;
end;

procedure Tfrm_icerg.Setpexemodified(const Value: boolean);
begin
  Fpexemodified := Value;
end;

procedure Tfrm_icerg.SetpExenotencrypted(const Value: boolean);
begin
  FpExenotencrypted := Value;
end;

procedure Tfrm_icerg.SetpKeyExported(const Value: boolean);
begin
  FpKeyExported := Value;
end;

procedure Tfrm_icerg.SetpNetworkrefused(const Value: boolean);
begin
  FpNetworkrefused := Value;
end;

procedure Tfrm_icerg.SetpRegExcluido(const Value: boolean);
begin
  FpRegExcluido := Value;
end;

procedure Tfrm_icerg.Setpsair(const Value: boolean);
begin
  Fpsair := Value;
end;

procedure Tfrm_icerg.SetpResult(const Value: boolean);
begin
  FpResult := Value;
end;

procedure Tfrm_icerg.SpeedButton1Click(Sender: TObject);
begin

 { try
    with smt do
     Begin
       PostMessage.ToAddress.Add(IceLicense1.eMail);
       Postmessage.Subject := 'Solicitação de Licença';
       PostMessage.Date := datetostr(date);
       PostMessage.FromName := IceLicense1.UserName;
       PostMessage.Body.Add('Nome : '+ IceLicense1.UserName);
       PostMessage.Body.Add('');
       PostMessage.Body.Add('Empresa : '+IceLicense1.UserOrganization);
       PostMessage.Body.Add('');
       PostMessage.Body.Add('ID Computafor : '+IceLicense1.GetMachineID);
       Connect;
       SendMail;
     end;
    
  finally
     smt.Disconnect;
  end;  }

  

end;

procedure Tfrm_icerg.Label15Click(Sender: TObject);
begin
  //icelicense1.GoURL;
end;



procedure Tfrm_icerg.SpeedButton2Click(Sender: TObject);
var
pstring : TstringList;
pClip : TClipBoard;
wnom : string;
begin

try
  Begin
   pString := TStringList.create;
   If (edit1.text = '') or (edit2.text = '') or (edit4.text = '') then
      Raise exception.create(Mens78);
   pstring.add(edit1.Text);
   pstring.add(edit2.Text);
   pstring.add(edit4.Text);
   If frm_main.viewer then
     pstring.add('VIEWER')
   else
     pstring.add('DESIGN') ;

   pClip :=  TClipBoard.Create ;
   pclip.AsText := pString.Text;
   wNom := ExtractFileDir(application.ExeName)+'\licenca.bst' ;
   pstring.SaveToFile(wNom);
  showmessage(Mensreg1+#13+wnom+#13+MensReg1_1 );
  { showmessage('Dados para Licenciamento foram salvos no arquivo :'+#13+
                wnom+#13+
                'Enviar esse Arquivo para MYTECH : best.suporte@5a.com.br para obter Licença' );  }
  end;


finally
  freeandnil(pstring);
  freeandnil(pClip);
end;
end;

procedure Tfrm_icerg.Image1Click(Sender: TObject);
begin
  SpeedButton2Click(nil);
end;

procedure Tfrm_icerg.Image2Click(Sender: TObject);
begin
 BitBtn4Click(nil);
end;

procedure Tfrm_icerg.Image3Click(Sender: TObject);
begin
  BitBtn3Click(nil);
end;

procedure Tfrm_icerg.Panel4Click(Sender: TObject);
begin
 // bevelInner := bvLowered;
 // repaint;
  BitBtn1Click(nil );
end;

procedure Tfrm_icerg.pcont1Click(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure Tfrm_icerg.Label17Click(Sender: TObject);
begin
   BitBtn2Click(nil);
end;

procedure Tfrm_icerg.Label16Click(Sender: TObject);
begin
  BitBtn1Click(nil );
end;

procedure Tfrm_icerg.Panel6Click(Sender: TObject);
begin
  erasClick(nil);
end;

procedure Tfrm_icerg.SpeedButton3Click(Sender: TObject);
begin
  BitBtn4Click(nil);
end;

procedure Tfrm_icerg.SpeedButton4Click(Sender: TObject);
begin
  BitBtn3Click(nil);
end;

procedure Tfrm_icerg.SpeedButton5Click(Sender: TObject);
begin
  erasClick(nil);
end;

procedure Tfrm_icerg.pcontClick(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure Tfrm_icerg.SpeedButton6Click(Sender: TObject);
begin
  BitBtn1Click(nil );
end;

procedure Tfrm_icerg.IceLicense1ExeNotEncrypted(Sender: TObject);
begin
  pExenotencrypted := true;
end;



end.
