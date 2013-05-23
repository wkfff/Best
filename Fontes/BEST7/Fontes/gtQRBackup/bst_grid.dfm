object frm_grid: Tfrm_grid
  Left = 214
  Top = 227
  Width = 226
  Height = 204
  Caption = 'Diagrama'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 82
    Width = 33
    Height = 13
    Caption = 'Altura :'
  end
  object Label2: TLabel
    Left = 106
    Top = 84
    Width = 42
    Height = 13
    Caption = 'Largura :'
  end
  object SpeedButton1: TSpeedButton
    Left = 114
    Top = 120
    Width = 98
    Height = 22
    Caption = 'Cor do Grid     '
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001111EEEECCCC
      99991111EEEECCCC99991111EEEECCCC99991111EEEECCCC99999999CCCCFFFF
      11119999CCCCFFFF11119999CCCCFFFF11119999CCCCFFFF1111CCCCFFFF1111
      EEEECCCCFFFF1111EEEECCCCFFFF1111EEEECCCCFFFF1111EEEEEEEE11112222
      CCCCEEEE11112222CCCCEEEE11112222CCCCEEEE11112222CCCC}
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = 7
    Top = 120
    Width = 98
    Height = 22
    Caption = 'Cor de Fundo'
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF001111EEEECCCC
      99991111EEEECCCC99991111EEEECCCC99991111EEEECCCC99999999CCCCFFFF
      11119999CCCCFFFF11119999CCCCFFFF11119999CCCCFFFF1111CCCCFFFF1111
      EEEECCCCFFFF1111EEEECCCCFFFF1111EEEECCCCFFFF1111EEEEEEEE11112222
      CCCCEEEE11112222CCCCEEEE11112222CCCCEEEE11112222CCCC}
    OnClick = SpeedButton3Click
  end
  object OK: TSpeedButton
    Left = 112
    Top = 144
    Width = 100
    Height = 22
    Caption = 'Ok'
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF20FFFFFFFFFFFFF2220FFFFFFFFFFFF2220FFFF
      FFFFFFF222220FFFFFFFFF2222220FFFFFFFF8220F2220FFFFFF820FFFF220FF
      FFFFFFFFFFF2220FFFFFFFFFFFFF220FFFFFFFFFFFFFF220FFFFFFFFFFFFFF82
      0FFFFFFFFFFFFFF820FFFFFFFFFFFFFFF220FFFFFFFFFFFFFFFF}
    OnClick = OKClick
  end
  object ckb: TCheckBox
    Left = 8
    Top = 100
    Width = 81
    Height = 17
    Caption = 'Mostra Grid'
    TabOrder = 0
  end
  object rdg: TRadioGroup
    Left = 6
    Top = 6
    Width = 206
    Height = 69
    Caption = 'Tipo de Grid'
    ItemIndex = 0
    Items.Strings = (
      'Ponto'
      'Linha'
      'Tracejado')
    TabOrder = 1
  end
  object SpinEdit1: TSpinEdit
    Left = 50
    Top = 76
    Width = 55
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 100
  end
  object SpinEdit2: TSpinEdit
    Left = 158
    Top = 75
    Width = 55
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 100
  end
  object ckb1: TCheckBox
    Left = 104
    Top = 102
    Width = 105
    Height = 17
    Caption = 'Alinhado ao Grid'
    TabOrder = 4
  end
  object cd_back: TColorDialog
    Left = 40
    Top = 146
  end
  object cd_grid: TColorDialog
    Left = 8
    Top = 146
  end
end
