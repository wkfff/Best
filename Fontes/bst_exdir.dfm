object frm_exdir: Tfrm_exdir
  Left = 373
  Top = 184
  Width = 385
  Height = 310
  Caption = 'Bancos de dados'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 284
    Top = 196
    Width = 85
    Height = 23
    Caption = 'OK'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 284
    Top = 224
    Width = 85
    Height = 23
    Caption = 'Cancelar'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 284
    Top = 250
    Width = 85
    Height = 23
    Caption = 'Sair'
    Flat = True
    OnClick = SpeedButton3Click
  end
  object fl: TFileListBox
    Left = 182
    Top = 32
    Width = 191
    Height = 159
    FileEdit = Edit1
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
    Width = 370
    Height = 20
    DirList = dl
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 4
    Top = 196
    Width = 259
    Height = 22
    TabOrder = 3
    Text = '*.*'
    Visible = False
  end
  object Edit2: TEdit
    Left = 4
    Top = 220
    Width = 259
    Height = 22
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 3
    Top = 247
    Width = 37
    Height = 22
    TabOrder = 5
    Text = 'Edit3'
    Visible = False
  end
  object Edit4: TEdit
    Left = 59
    Top = 247
    Width = 46
    Height = 22
    TabOrder = 6
    Text = 'Edit4'
    Visible = False
  end
end
