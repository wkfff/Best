object Form1: TForm1
  Left = 390
  Top = 200
  Width = 527
  Height = 486
  Caption = 'ICE License v2.0 - Demo Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 328
    Top = 8
    Width = 10
    Height = 417
    Shape = bsRightLine
  end
  object Label3: TLabel
    Left = 352
    Top = 16
    Width = 121
    Height = 13
    Caption = 'Example of features :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 352
    Top = 248
    Width = 90
    Height = 13
    Caption = 'Machine Identifier :'
  end
  object Label11: TLabel
    Left = 352
    Top = 312
    Width = 156
    Height = 13
    Caption = 'Avoid Registration Form using file'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 519
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 73
    Caption = 'License ID'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 54
      Height = 13
      Caption = 'Username :'
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 90
      Height = 13
      Caption = 'User Organization :'
    end
    object Edit1: TEdit
      Left = 104
      Top = 16
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 104
      Top = 40
      Width = 201
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 313
    Height = 153
    Caption = 'LicenseKey'
    TabOrder = 2
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 309
      Height = 136
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 248
    Width = 313
    Height = 49
    Caption = 'ActiveKey (only for Full License)'
    TabOrder = 3
    object Edit3: TEdit
      Left = 8
      Top = 18
      Width = 297
      Height = 21
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Quit Demo'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 400
    Width = 97
    Height = 25
    Caption = 'Check License'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object GroupBox4: TGroupBox
    Left = 352
    Top = 48
    Width = 129
    Height = 73
    Caption = 'Trial Options'
    Enabled = False
    TabOrder = 6
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Trial CheckBox1'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object Button1: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Trial Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 352
    Top = 144
    Width = 129
    Height = 89
    Caption = 'Full Options'
    Enabled = False
    TabOrder = 7
    object CheckBox2: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Full CheckBox2'
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object Button2: TButton
      Left = 8
      Top = 48
      Width = 97
      Height = 25
      Caption = 'Full Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Edit4: TEdit
    Left = 352
    Top = 264
    Width = 145
    Height = 21
    TabOrder = 8
    Text = 'Edit4'
  end
  object Button3: TButton
    Left = 216
    Top = 400
    Width = 105
    Height = 25
    Caption = 'Erase LicenseKey'
    TabOrder = 9
    OnClick = Button3Click
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 304
    Width = 313
    Height = 81
    Caption = 'License Information'
    TabOrder = 10
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 13
      Caption = 'License Owner :'
    end
    object Label6: TLabel
      Left = 8
      Top = 40
      Width = 70
      Height = 13
      Caption = 'License Type :'
    end
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 92
      Height = 13
      Caption = 'Expiration License :'
    end
    object Label8: TLabel
      Left = 120
      Top = 24
      Width = 24
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 120
      Top = 40
      Width = 24
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 120
      Top = 56
      Width = 24
      Height = 13
      Caption = 'none'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox7: TGroupBox
    Left = 352
    Top = 336
    Width = 145
    Height = 73
    Caption = 'Load License From file'
    TabOrder = 11
    object BitBtn3: TBitBtn
      Left = 8
      Top = 32
      Width = 129
      Height = 25
      Hint = 'You can load licensekey from file, to avoid Registration Form'
      Caption = 'Load license from file '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn3Click
    end
  end
  object IceLicense1: TIceLicense
    CodeEncryption = True
    AntiDebugging = True
    AntiMonitoring = True
    WebBrowserState = bsNormal
    OnExeModified = IceLicense1ExeModified
    OnBadMachineID = IceLicense1BadMachineID
    OnLicenseExpired = IceLicense1LicenseExpired
    OnLicenseInvalid = IceLicense1LicenseInvalid
    OnLicenseInfo = IceLicense1LicenseInfo
    OnLicenseTrial = IceLicense1LicenseTrial
    OnTrialExpired = IceLicense1TrialExpired
    OnLicenseFull = IceLicense1LicenseFull
    OnClockMovedBack = IceLicense1ClockMovedBack
    OnNetworkRefused = IceLicense1NetworkRefused
    OnNoneLicense = IceLicense1NoneLicense
    Left = 464
    Top = 232
    ICE_Data1 = 
      'ZMoGaGm00PQ2fqRl60BvfIpuUiw5zHxEIS1XUbc+yp1iFopwLMeDuTp9K1ncN2rj' +
      'LSTSH2rSL+/7P/sL7/7h2A=='
    ICE_Data2 = 'R93HAcynuNbtbeU03wsAO+5O9h9gLh1nsANMZeZ8bzk='
    ICE_Data3 = 'Qe5bW1EEiYBvC78r6Kenxg=='
    ICE_Data4 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data5 = 'GfoMN17H88+qShJ78ACgVl5QluzvAFShay5UnQXXSt4='
    ICE_Data6 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data7 = 'clfYn3FHYaJn3nMe2izCsLq0FqfVSqAuidW2AIIJOHE='
    ICE_Data8 = 'YwXec12uXVR0NTQjhVN6jA=='
    ICE_Data9 = 'YwXec12uXVR0NTQjhVN6jA=='
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.ldf'
    Filter = 
      'ICE License License File (*.ldf)|*.ldf|License File (*.lic)|*.li' +
      'c|Data File (*.dat)|*.dat'
    Title = 'Load ICE License License (*.ldf)'
    Left = 400
    Top = 392
  end
end
