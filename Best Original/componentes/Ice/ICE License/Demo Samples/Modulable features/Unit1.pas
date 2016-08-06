unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, IceLicense, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Standard: TMenuItem;
    Pro: TMenuItem;
    Entreprise: TMenuItem;
    Close1: TMenuItem;
    Option11: TMenuItem;
    Option21: TMenuItem;
    Option12: TMenuItem;
    Option22: TMenuItem;
    Option13: TMenuItem;
    Option23: TMenuItem;
    About1: TMenuItem;
    BitBtn1: TBitBtn;
    IceLicense1: TIceLicense;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    LoadStandardLicense1: TMenuItem;
    LoadProLicense1: TMenuItem;
    LoadEntrepriseLicense1: TMenuItem;
    N1: TMenuItem;
    LoadFullStandardLicense1: TMenuItem;
    LoadFullProLicense1: TMenuItem;
    LoadFullEntrepriseLicense1: TMenuItem;
    N2: TMenuItem;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Close1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Option11Click(Sender: TObject);
    procedure Option21Click(Sender: TObject);
    procedure Option12Click(Sender: TObject);
    procedure Option22Click(Sender: TObject);
    procedure Option13Click(Sender: TObject);
    procedure Option23Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IceLicense1LicenseTrial(TrialStatus: Integer;
      ExtraLicenseInfo: String);
    procedure IceLicense1LicenseFull(ExpiresInfo: Integer;
      ExtraLicenseInfo: String);
    procedure IceLicense1LicenseInvalid(Sender: TObject);
    procedure IceLicense1TrialExpired(Sender: TObject);
    procedure LoadStandardLicense1Click(Sender: TObject);
    procedure LoadProLicense1Click(Sender: TObject);
    procedure LoadEntrepriseLicense1Click(Sender: TObject);
    procedure LoadFullStandardLicense1Click(Sender: TObject);
    procedure LoadFullProLicense1Click(Sender: TObject);
    procedure LoadFullEntrepriseLicense1Click(Sender: TObject);
    procedure IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
      UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
      ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);
    procedure IceLicense1LicenseExpired(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Close1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.Option11Click(Sender: TObject);
begin
 ShowMessage('Option1 Enabled');
end;

procedure TForm1.Option21Click(Sender: TObject);
begin
 ShowMessage('Option2 Enabled');
end;

procedure TForm1.Option12Click(Sender: TObject);
begin
 ShowMessage('Option1 Enabled');
end;

procedure TForm1.Option22Click(Sender: TObject);
begin
 ShowMessage('Option2 Enabled');
end;

procedure TForm1.Option13Click(Sender: TObject);
begin
 ShowMessage('Option1 Enabled');
end;

procedure TForm1.Option23Click(Sender: TObject);
begin
 ShowMessage('Option2 Enabled');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 IceLicense1.Run;
end;

procedure TForm1.IceLicense1LicenseTrial(TrialStatus: Integer;
  ExtraLicenseInfo: String);
begin
 // Standard
 If ExtraLicenseInfo = IceLicense1.SecureStrings[0] Then
  Begin
   Standard.Enabled := True;
   Pro.Enabled := False;
   Entreprise.Enabled := False;
   MessageDlg(#13+'Welcome to Trial of our application Standard Edition',MtInformation,[MbOk],0);
  End;
 // Pro
 If ExtraLicenseInfo = IceLicense1.SecureStrings[1] Then
  Begin
   Standard.Enabled := False;
   Pro.Enabled := True;
   Entreprise.Enabled := False;
   MessageDlg(#13+'Welcome to Trial of our application Pro Edition',MtInformation,[MbOk],0);
  End;
 // Entreprise
 If ExtraLicenseInfo = IceLicense1.SecureStrings[2] Then
  Begin
   Standard.Enabled := False;
   Pro.Enabled := False;
   Entreprise.Enabled := True;
   MessageDlg(#13+'Welcome to Trial of our application Entreprise Edition',MtInformation,[MbOk],0);
  End;

 If IceLicense1.LicenseState = lsNone Then Label6.Caption := 'No License loaded.';
 If IceLicense1.LicenseState = lsExpired Then Label6.Caption := 'Expired License';
 If IceLicense1.LicenseState = lsValid Then Label6.Caption := 'Valid License';
  
end;

procedure TForm1.IceLicense1LicenseFull(ExpiresInfo: Integer;
  ExtraLicenseInfo: String);
begin
  // Standard
 If ExtraLicenseInfo = IceLicense1.SecureStrings[0] Then
  Begin
   Standard.Enabled := True;
   Pro.Enabled := False;
   Entreprise.Enabled := False;
   MessageDlg(#13+'Thank you for your order, you are in registered mode Standard Edition',MtInformation,[MbOk],0);
  End;
 // Pro
 If ExtraLicenseInfo = IceLicense1.SecureStrings[1] Then
  Begin
   Standard.Enabled := False;
   Pro.Enabled := True;
   Entreprise.Enabled := False;
   MessageDlg(#13+'Thank you for your order, you are in registered mode Pro Edition',MtInformation,[MbOk],0);
  End;
 // Entreprise
 If ExtraLicenseInfo = IceLicense1.SecureStrings[2] Then
  Begin
   Standard.Enabled := False;
   Pro.Enabled := False;
   Entreprise.Enabled := True;
   MessageDlg(#13+'Thank you for your order, you are in registered mode Entreprise Edition',MtInformation,[MbOk],0);
  End;

 If IceLicense1.LicenseState = lsNone Then Label6.Caption := 'No License loaded.';
 If IceLicense1.LicenseState = lsExpired Then Label6.Caption := 'Expired License';
 If IceLicense1.LicenseState = lsValid Then Label6.Caption := 'Valid License';

end;

procedure TForm1.IceLicense1LicenseInvalid(Sender: TObject);
begin
 MessageDlg(#13+'This LicenseKey is not correct please retry again !',MtWarning,[MbOk],0);
end;

procedure TForm1.IceLicense1TrialExpired(Sender: TObject);
begin
 MessageDlg(#13+'Your Trial period has been expired, please register now !',MtWarning,[MbOk],0);
 If IceLicense1.LicenseState = lsNone Then Label6.Caption := 'No License loaded.';
 If IceLicense1.LicenseState = lsExpired Then Label6.Caption := 'Expired License';
 If IceLicense1.LicenseState = lsValid Then Label6.Caption := 'Valid License';

end;

procedure TForm1.LoadStandardLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'TStd.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.LoadProLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'TPro.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.LoadEntrepriseLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'TEnt.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.LoadFullStandardLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'FStd.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.LoadFullProLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'FPro.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.LoadFullEntrepriseLicense1Click(Sender: TObject);
begin
 If IceLicense1.LoadLicenseFromFile(ExtractFilePath(ParamStr(0))+'FEnt.ldf') = False Then
  Begin
   ShowMessage('Error on reading file !');
  End;
 IceLicense1.CheckLicense;
end;

procedure TForm1.IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
  UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
  ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);
begin
 If LicenseType = ltNone Then Label5.Caption := 'No License loaded.';
 If LicenseType = ltFull Then Label5.Caption := 'Full Mode';
 If LicenseType = ltTrial Then Label5.Caption := 'Trial Mode';
 Label9.Caption := IceLicense1.UserName;
 Label10.Caption := IceLicense1.UserOrganization;
end;

procedure TForm1.IceLicense1LicenseExpired(Sender: TObject);
begin
 MessageDlg(#13+'Your License validity has been expired, please register now !',MtWarning,[MbOk],0);
 If IceLicense1.LicenseState = lsNone Then Label6.Caption := 'No License loaded.';
 If IceLicense1.LicenseState = lsExpired Then Label6.Caption := 'Expired License';
 If IceLicense1.LicenseState = lsValid Then Label6.Caption := 'Valid License';
end;

end.
