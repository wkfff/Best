object frm_mensagem: Tfrm_mensagem
  Left = 341
  Top = 131
  Width = 449
  Height = 268
  Caption = 'Requerimentos de TI'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object sp_imp: TSpeedButton
    Left = 200
    Top = 186
    Width = 137
    Height = 22
    Caption = 'Imprimir                        '
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    Visible = False
    OnClick = sp_impClick
  end
  object sp_exp: TSpeedButton
    Left = 8
    Top = 6
    Width = 129
    Height = 22
    Caption = 'Gerar em Planilha'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = sp_expClick
  end
  object sp_ger: TSpeedButton
    Left = 8
    Top = 302
    Width = 137
    Height = 22
    Caption = 'Gerar                          '
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
    Visible = False
    OnClick = sp_gerClick
  end
  object Label1: TLabel
    Left = 8
    Top = 33
    Width = 240
    Height = 14
    Caption = 
      '                                                                ' +
      '                '
    WordWrap = True
  end
  object plan: TCheckBox
    Left = 148
    Top = 8
    Width = 201
    Height = 17
    Caption = 'Abrir Planilha ap'#243's gerar'
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 0
    Top = 56
    Width = 441
    Height = 185
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvRaised
    ScrollBars = ssBoth
    TabOrder = 0
  end
end
