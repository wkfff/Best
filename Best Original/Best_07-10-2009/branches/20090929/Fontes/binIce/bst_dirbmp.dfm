object frm_dirbmp: Tfrm_dirbmp
  Left = 245
  Top = 159
  BorderStyle = bsSingle
  Caption = 'Imagens'
  ClientHeight = 280
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 26
    Top = 200
    Width = 24
    Height = 14
    Caption = 'Tipo'
  end
  object Label2: TLabel
    Left = 26
    Top = 224
    Width = 32
    Height = 14
    Caption = 'Nome'
  end
  object im: TImage
    Left = 432
    Top = 36
    Width = 640
    Height = 480
    AutoSize = True
    Center = True
    Stretch = True
  end
  object SpeedButton1: TSpeedButton
    Left = 316
    Top = 249
    Width = 106
    Height = 22
    Caption = 'OK'
    Flat = True
    OnClick = flDblClick
  end
  object dl: TDirectoryListBox
    Left = 26
    Top = 36
    Width = 179
    Height = 153
    FileList = fl
    ItemHeight = 16
    TabOrder = 1
    OnDblClick = dlDblClick
  end
  object fl: TFileListBox
    Left = 208
    Top = 36
    Width = 215
    Height = 155
    ItemHeight = 16
    Mask = '*.jpeg;*.bmp;*.wmf;*.gif'
    ShowGlyphs = True
    TabOrder = 0
    OnClick = flClick
    OnDblClick = flDblClick
  end
  object DriveComboBox1: TDriveComboBox
    Left = 26
    Top = 12
    Width = 399
    Height = 20
    DirList = dl
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 60
    Top = 220
    Width = 365
    Height = 22
    TabOrder = 3
  end
  object edit2: TComboBox
    Left = 60
    Top = 194
    Width = 365
    Height = 22
    ItemHeight = 14
    TabOrder = 4
    OnChange = Edit2Change
    Items.Strings = (
      '*.bmp;*.jpg;*.wmf;*.emf;*.jpeg;*.ico'
      '*.wmf'
      '*.emf'
      '*.ico'
      '*.bmp'
      '*.jpeg'
      '*.jpg')
  end
end
