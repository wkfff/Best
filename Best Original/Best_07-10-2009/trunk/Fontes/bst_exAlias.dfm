object frm_exalias: Tfrm_exalias
  Left = 285
  Top = 190
  Width = 297
  Height = 159
  ActiveControl = Edit1
  Caption = 'Novo Alias'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 30
    Top = 54
    Width = 40
    Height = 13
    Caption = 'DBMS : '
  end
  object Label2: TLabel
    Left = 30
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Nome : '
  end
  object drv: TComboBox
    Left = 81
    Top = 50
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 81
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 105
    Top = 90
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
end
