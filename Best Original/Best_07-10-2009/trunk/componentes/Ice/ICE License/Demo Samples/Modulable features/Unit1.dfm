object Form1: TForm1
  Left = 258
  Top = 173
  Width = 377
  Height = 308
  Caption = 'ICE License Demo - Modulable Features'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 14
    Width = 219
    Height = 14
    Caption = 'Go to Menu and click on "File", and select one'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 352
    Height = 13
    Caption = 
      'You must load Full or Trial license, without License no function' +
      's is enabled.'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 208
    Width = 353
    Height = 25
    Caption = 'Quit Application'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 243
    Width = 369
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 104
    Width = 353
    Height = 89
    Caption = 'License Info'
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 70
      Height = 13
      Caption = 'License Type :'
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 76
      Height = 13
      Caption = 'License Status :'
    end
    object Label5: TLabel
      Left = 96
      Top = 16
      Width = 29
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 96
      Top = 32
      Width = 29
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 42
      Height = 13
      Caption = 'User ID :'
    end
    object Label8: TLabel
      Left = 8
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Company :'
    end
    object Label9: TLabel
      Left = 96
      Top = 48
      Width = 29
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 96
      Top = 64
      Width = 29
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 353
    Height = 33
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      
        'This Demo illustre how to use ICE License with modulable feature' +
        's'
      'using function TIceLicense.LoadLicenseFromFile')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 320
    object File1: TMenuItem
      Caption = 'File'
      object LoadStandardLicense1: TMenuItem
        Caption = 'Load Trial Standard License'
        OnClick = LoadStandardLicense1Click
      end
      object LoadProLicense1: TMenuItem
        Caption = 'Load Trial Pro License'
        OnClick = LoadProLicense1Click
      end
      object LoadEntrepriseLicense1: TMenuItem
        Caption = 'Load Trial Entreprise License'
        OnClick = LoadEntrepriseLicense1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object LoadFullStandardLicense1: TMenuItem
        Caption = 'Load Full Standard License'
        OnClick = LoadFullStandardLicense1Click
      end
      object LoadFullProLicense1: TMenuItem
        Caption = 'Load Full Pro License'
        OnClick = LoadFullProLicense1Click
      end
      object LoadFullEntrepriseLicense1: TMenuItem
        Caption = 'Load Full Entreprise License'
        OnClick = LoadFullEntrepriseLicense1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Exit Application'
        OnClick = Close1Click
      end
    end
    object Standard: TMenuItem
      Caption = 'Standard Features'
      Enabled = False
      object Option11: TMenuItem
        Caption = 'Option1'
        OnClick = Option11Click
      end
      object Option21: TMenuItem
        Caption = 'Option2'
        OnClick = Option21Click
      end
    end
    object Pro: TMenuItem
      Caption = 'Pro Features'
      Enabled = False
      object Option12: TMenuItem
        Caption = 'Option1'
        OnClick = Option12Click
      end
      object Option22: TMenuItem
        Caption = 'Option2'
        OnClick = Option22Click
      end
    end
    object Entreprise: TMenuItem
      Caption = 'Entreprise Features'
      Enabled = False
      object Option13: TMenuItem
        Caption = 'Option1'
        OnClick = Option13Click
      end
      object Option23: TMenuItem
        Caption = 'Option2'
        OnClick = Option23Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
    end
  end
  object IceLicense1: TIceLicense
    WebBrowserState = bsNormal
    OnLicenseExpired = IceLicense1LicenseExpired
    OnLicenseInvalid = IceLicense1LicenseInvalid
    OnLicenseInfo = IceLicense1LicenseInfo
    OnLicenseTrial = IceLicense1LicenseTrial
    OnTrialExpired = IceLicense1TrialExpired
    OnLicenseFull = IceLicense1LicenseFull
    Left = 280
    ICE_DProtection = {72003FEF45BD0CDAE73B71195EB0E99B9292D93E336DCAE12C0E8536}
    ICE_Data1 = 
      'ZMoGaGm00PQ2fqRl60BvfIpuUiw5zHxEIS1XUbc+yp1iFopwLMeDuTp9K1ncN2rj' +
      'LSTSH2rSL+/7P/sL7/7h2A=='
    ICE_Data2 = 'eO3FpCQB/m9UvFA09cYc6Q=='
    ICE_Data3 = 'twyNmdj2yx/tSQ27GbtAucG9m8CQApzrO1+Tc2lcLj0='
    ICE_Data4 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data5 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data6 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data7 = 'zdAWnLgIrApvpd1/p1iUXXxVFg+VCcHc3c9Umx3QOn5Wwgkxj6EKTZpfJPi6J3oV'
    ICE_Data8 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data9 = 'YwXec12uXVR0NTQjhVN6jA=='
  end
end
