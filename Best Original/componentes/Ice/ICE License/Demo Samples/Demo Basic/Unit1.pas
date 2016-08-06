unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IceLicense, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IceLicense1: TIceLicense;
    Bevel1: TBevel;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    Button1: TButton;
    GroupBox5: TGroupBox;
    CheckBox2: TCheckBox;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Button3: TButton;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox7: TGroupBox;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label11: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure IceLicense1TrialExpired(Sender: TObject);
    procedure IceLicense1ClockMovedBack(Sender: TObject);
    procedure IceLicense1LicenseInvalid(Sender: TObject);
    procedure IceLicense1LicenseExpired(Sender: TObject);
    procedure IceLicense1ExeModified(Sender: TObject);
    procedure IceLicense1BadMachineID(Sender: TObject);
    procedure IceLicense1NetworkRefused(ErrorMsg: String);
    procedure FormCreate(Sender: TObject);
    procedure IceLicense1LicenseFull(ExpiresInfo: Integer;
      ExtraLicenseInfo: String);
    procedure IceLicense1LicenseTrial(TrialStatus: Integer;
      ExtraLicenseInfo: String);
    procedure Button3Click(Sender: TObject);
    procedure IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
      UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
      ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure IceLicense1NoneLicense(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 IceLicense1.UserName := Edit1.Text;
 IceLicense1.UserOrganization := Edit2.Text;
 IceLicense1.LicenseKey.Assign(Memo1.Lines);
 IceLicense1.ActiveKey := Edit3.Text;
 IceLicense1.CheckLicense;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 ShowMessage('Trial Button Action !');
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 ShowMessage('Trial CheckBox Action !'); 
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ShowMessage('Full Button Action !');
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
 ShowMessage('Full Button Action !');
end;

procedure TForm1.IceLicense1TrialExpired(Sender: TObject);
begin
 MessageDlg(#13+'Your trial period has been expired, please register now !',MtInformation,[MbOk],0);
// Application.Terminate;
end;

procedure TForm1.IceLicense1ClockMovedBack(Sender: TObject);
begin
 MessageDlg(#13+'Your system is move back, please restore it !',MtInformation,[MbOk],0);
// Application.Terminate;
end;

procedure TForm1.IceLicense1LicenseInvalid(Sender: TObject);
begin
 MessageDlg(#13+'This License Key is not valid, please retry again !',MtInformation,[MbOk],0);
end;

procedure TForm1.IceLicense1LicenseExpired(Sender: TObject);
begin
 MessageDlg(#13+'Your Full License has been expired, please renew it !',MtInformation,[MbOk],0);
end;

procedure TForm1.IceLicense1ExeModified(Sender: TObject);
begin
 MessageDlg(#13+'The executable file has been modified, please restore from original !',MtInformation,[MbOk],0);
 Application.Terminate;
end;

procedure TForm1.IceLicense1BadMachineID(Sender: TObject);
begin
 MessageDlg(#13+'This computer is not allowed to use this application, ask license from the author !',MtInformation,[MbOk],0);
 Application.Terminate;
end;

procedure TForm1.IceLicense1NetworkRefused(ErrorMsg: String);
begin
 MessageDlg(#13+ErrorMsg,MtInformation,[MbOk],0);
 Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Edit4.Text := IceLicense1.GetMachineID;
 IceLicense1.Run;
end;

procedure TForm1.IceLicense1LicenseFull(ExpiresInfo: Integer;
  ExtraLicenseInfo: String);
begin
 ShowMessage('Full Options is enabled now');
 GroupBox5.Enabled := True;
end;

procedure TForm1.IceLicense1LicenseTrial(TrialStatus: Integer;
  ExtraLicenseInfo: String);
begin
 ShowMessage('Trial Options is enabled now');
 Label10.Caption := IntToStr(TrialStatus);
 GroupBox4.Enabled := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 If IceLicense1.EraseLicenseInfo Then ShowMessage('LicenseKey removed with success');
 
end;

procedure TForm1.IceLicense1LicenseInfo(LicenseType: TLS; DateCreation,
  UserName, UserOrg, VendorName, VendorOrg, ExpirationMode,
  ExpirationInfo: String; NetworkControl, HardwareLocked: Boolean);
begin
 Label8.Caption := Username;

 If LicenseType = ltFull Then Label9.Caption := 'Full License'
 Else If LicenseType = ltTrial Then Label9.Caption := 'Trial License'
 Else If LicenseType = ltNone Then Label9.Caption := 'No License';

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 If OpenDialog1.Execute Then
  Begin
   If FileExists(OpenDialog1.FileName) Then
    Begin
     IceLicense1.LoadLicenseFromFile(OpenDialog1.FileName);
     IceLicense1.CheckLicense;
    End;
  End;
end;

procedure TForm1.IceLicense1NoneLicense(Sender: TObject);
begin
 MessageDlg('No license has been detected for this application : '+IceLicense1.ApplicationName+ #13+'Go to ICE License Manager and create a new license, use "ICE License v2.0 Demo Sample" profile.'+#13+'NOTE : This a little demo sample, you can change this text from OnNoneLicense event.',MtInformation,[MbOk],0);
end;

end.
