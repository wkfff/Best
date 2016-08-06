object frmDirCenarios: TfrmDirCenarios
  Left = 285
  Top = 200
  Width = 285
  Height = 253
  Caption = 'Escolha o diret'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 104
    Height = 14
    Caption = 'Escolha a unidade:'
  end
  object dl: TDirectoryListBox
    Left = 2
    Top = 33
    Width = 271
    Height = 156
    ItemHeight = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 200
    Top = 192
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object drv: TDriveComboBox
    Left = 120
    Top = 6
    Width = 153
    Height = 20
    DirList = dl
    TabOrder = 2
    OnChange = drvChange
  end
end
