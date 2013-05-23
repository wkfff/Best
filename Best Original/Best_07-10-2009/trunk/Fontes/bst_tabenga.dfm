inherited frm_tabenga: Tfrm_tabenga
  Left = 524
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Engenharia reversa - Tabelas'
  ClientHeight = 483
  ClientWidth = 370
  ParentFont = False
  Font.Charset = ANSI_CHARSET
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited SrcLabel: TLabel
    Top = 59
    Width = 105
    Caption = 'Tabelas Dispon'#237'veis'
  end
  inherited DstLabel: TLabel
    Left = 202
    Top = 59
    Width = 104
    Caption = 'Tabelas Escolhidas'
  end
  inherited IncludeBtn: TSpeedButton
    Left = 174
    Top = 83
    Flat = True
  end
  inherited IncAllBtn: TSpeedButton
    Left = 174
    Top = 109
    Flat = True
  end
  inherited ExcludeBtn: TSpeedButton
    Left = 175
    Top = 140
    Flat = True
  end
  inherited ExAllBtn: TSpeedButton
    Left = 175
    Top = 170
    Flat = True
  end
  object sp1: TSpeedButton [6]
    Left = 136
    Top = 15
    Width = 140
    Height = 23
    Caption = 'Novo banco de Dados'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
    Visible = False
    OnClick = sp1Click
  end
  object SpeedButton1: TSpeedButton [7]
    Left = 103
    Top = 458
    Width = 75
    Height = 20
    Caption = 'Importar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
    OnClick = OKBtnClick
  end
  object SpeedButton2: TSpeedButton [8]
    Left = 187
    Top = 458
    Width = 71
    Height = 20
    Caption = 'Cancelar'
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF444FFFFFFFF444FF4444FFFFFF4444FFF4444FFFF44
      44FFFFF4444FF4444FFFFFFF44444444FFFFFFFFF444444FFFFFFFFFF44444FF
      FFFFFFFF4444444FFFFFFFF4444F4444FFFFFF4444FFF4444FFFF4444FFFFF44
      44FFF444FFFFFFF444FFF44FFFFFFFFF44FFFFFFFFFFFFFFFFFF}
  end
  object edit3: TLabel [9]
    Left = 329
    Top = 59
    Width = 6
    Height = 13
    Alignment = taRightJustify
    Caption = '0'
  end
  object Label1: TLabel [10]
    Left = 151
    Top = 59
    Width = 6
    Height = 13
    Alignment = taRightJustify
    Caption = '0'
  end
  inherited OKBtn: TButton
    Left = 10
    Top = 457
    Caption = 'Importar'
    OnClick = OKBtnClick
  end
  inherited CancelBtn: TButton
    Left = 296
    Top = 455
    OnClick = CancelBtnClick
  end
  inherited HelpBtn: TButton
    Left = 551
    Top = 379
  end
  inherited SrcList: TListBox
    Top = 73
    Width = 157
    Height = 380
    Items.Strings = ()
    OnDblClick = SrcListDblClick
  end
  inherited DstList: TListBox
    Left = 204
    Top = 73
    Width = 157
    Height = 373
    OnDblClick = DstListDblClick
  end
  object gb: TGroupBox
    Left = 7
    Top = 4
    Width = 358
    Height = 53
    Caption = 'Banco de Dados'
    TabOrder = 5
    object Label2: TLabel
      Left = 5
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Nome :'
    end
    object Label3: TLabel
      Left = 5
      Top = 30
      Width = 63
      Height = 13
      Caption = 'Localiza'#231#227'o :'
    end
    object Edit1: TEdit
      Left = 74
      Top = 30
      Width = 276
      Height = 14
      BorderStyle = bsNone
      MaxLength = 200
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 52
      Top = 15
      Width = 298
      Height = 14
      BorderStyle = bsNone
      MaxLength = 200
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 572
    Top = 438
    Width = 62
    Height = 40
    TabOrder = 6
    Visible = False
  end
  object adod: TADODataSet
    Parameters = <>
    Left = 184
    Top = 456
  end
end
