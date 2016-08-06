object frm_diretorio: Tfrm_diretorio
  Left = 247
  Top = 162
  Width = 387
  Height = 314
  ActiveControl = Edit1
  Caption = 'Diret'#243'rios'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 288
    Top = 198
    Width = 85
    Height = 23
    Caption = 'OK'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 288
    Top = 226
    Width = 85
    Height = 23
    Caption = 'Cancelar'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 288
    Top = 252
    Width = 85
    Height = 23
    Caption = 'Sair'
    Flat = True
    OnClick = SpeedButton3Click
  end
  object Label1: TLabel
    Left = 4
    Top = 200
    Width = 59
    Height = 14
    Caption = 'Salvar em :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object fl: TFileListBox
    Left = 182
    Top = 32
    Width = 191
    Height = 159
    ItemHeight = 16
    ShowGlyphs = True
    TabOrder = 0
    OnDblClick = flDblClick
  end
  object dl: TDirectoryListBox
    Left = 4
    Top = 32
    Width = 177
    Height = 159
    FileList = fl
    ItemHeight = 16
    TabOrder = 1
  end
  object dc: TDriveComboBox
    Left = 4
    Top = 7
    Width = 366
    Height = 20
    DirList = dl
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 4
    Top = 223
    Width = 259
    Height = 22
    TabOrder = 3
  end
end
