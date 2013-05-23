inherited frm_ger: Tfrm_ger
  Left = 339
  Top = 126
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o de C'#243'digo'
  ClientHeight = 519
  ClientWidth = 611
  Color = 16776957
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Comic Sans MS'
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 611
    Height = 519
    Align = alClient
    TabOrder = 0
    object Label12: TLabel
      Left = 6
      Top = 62
      Width = 114
      Height = 17
      Caption = 'Diret'#243'rio do projeto'
    end
    object BT1: TSpeedButton
      Left = 376
      Top = 79
      Width = 22
      Height = 25
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000404040404040404040404040606060202020FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FA0A0A0A0A0A0A0A0
        A0A0A0A0404040404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        00004000007F7F7FC0C0C0C0C0C0C0C0C0C0C0C0404040404040FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400000FFFFFF3F3F3F7F7F7FAFAFAFDFDF
        DFDFDFDF505050202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        0000FFFFFF3F3F007F7F003F3F00000000000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400000FFFFFF0000004040404040404040
        40404040606060202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        0000FFFFFF6F6F6FC0C0C0C0C0C0C0C0C0C0C0C0606060404040FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6000004000007F7F7FC0C0C0C0C0C0C0C0
        C0C0C0C0606060404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
        0000FFFFFF3F3F3F7F7F7FAFAFAFDFDFDFDFDFDF606060202020FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400000FFFFFF3F3F007F7F003F3F000000
        00000000000000FFFFFF00000040404040404040404040404060606020202040
        0000FFFFFF0000004040404040404040404040406060602020206F6F6FA0A0A0
        A0A0A0A0A0A0A0A0A0404040404040400000FFFFFF6F6F6FA0A0A0A0A0A0A0A0
        A0A0A0A04040404040407F7F7FC0C0C0C0C0C0C0C0C0C0C0C040404060202060
        00004000007F7F7FC0C0C0C0C0C0C0C0C0C0C0C04040404040403F3F3F7F7F7F
        AFAFAFDFDFDFDFDFDF505050202020FFFFFFFFFFFF3F3F3F7F7F7FAFAFAFDFDF
        DFDFDFDF5050502020203F003F7F007F3F003F000000000000000000FFFFFFFF
        FFFFFFFFFF3F3F007F7F003F3F00000000000000000000FFFFFF}
      OnClick = BT1Click
    end
    object Label21: TLabel
      Left = 6
      Top = 113
      Width = 138
      Height = 17
      Caption = 'Unit Objetos de Neg'#243'cio'
    end
    object SpeedButton4: TSpeedButton
      Left = 157
      Top = 133
      Width = 84
      Height = 25
      Caption = 'Ver C'#243'digo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      OnClick = sp_verooClick
    end
    object Edit1: TEdit
      Left = 6
      Top = 81
      Width = 364
      Height = 25
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Tipo: TRadioGroup
      Left = 408
      Top = 73
      Width = 201
      Height = 81
      Caption = 'Tipo de Relat'#243'rio(s)'
      Items.Strings = (
        'Pai (com Lista e Grid Filho)'
        'Filho (sem Lista, nem grid)'
        'Normal (com Lista)')
      TabOrder = 1
      OnClick = TipoClick
    end
    object eOOunit: TEdit
      Left = 6
      Top = 133
      Width = 138
      Height = 25
      TabOrder = 2
    end
    object gbpai: TGroupBox
      Left = 2
      Top = 174
      Width = 607
      Height = 323
      TabOrder = 3
      Visible = False
      object Label20: TLabel
        Left = 6
        Top = 120
        Width = 78
        Height = 17
        Caption = 'Nome da Tela '
      end
      object Label22: TLabel
        Left = 6
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Atributo da Lista'
      end
      object SpeedButton1: TSpeedButton
        Left = 133
        Top = 144
        Width = 84
        Height = 25
        Caption = 'Ver C'#243'digo'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object spbpai: TSpeedButton
        Tag = 1
        Left = 487
        Top = 30
        Width = 26
        Height = 26
        Hint = 'Lista Classes'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333300333
          33333333333773FF333333333330F0033333333333373773FF333333330FFFF0
          03333333337F333773FF3333330FFFFFF003333333733FF33773333330FF00FF
          FF80333337F3773F3337333330FFFF0FFFF03FFFF7FFF3733F3700000000FFFF
          0FF0777777773FF373370000000000FFFFF07FFFFFF377FFF3370CCCCC000000
          FF037777773337773F7300CCC000003300307F77733337F37737000C00000033
          33307F373333F7F333370000007B703333307FFFF337F7F33337099900BBB033
          33307777F37777FF33370999007B700333037777F3373773FF73099900000030
          00337777FFFFF7F7773300000000003333337777777777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spbpaiClick
      end
      object Label17: TLabel
        Left = 358
        Top = 13
        Width = 35
        Height = 17
        Caption = 'Classe'
      end
      object Label23: TLabel
        Left = 358
        Top = 58
        Width = 36
        Height = 17
        Caption = 'Tabela'
      end
      object Label2: TLabel
        Left = 358
        Top = 105
        Width = 13
        Height = 17
        Caption = 'PK'
      end
      object etela_pai: TEdit
        Left = 6
        Top = 144
        Width = 121
        Height = 25
        TabStop = False
        TabOrder = 0
      end
      object enomeLista: TEdit
        Left = 6
        Top = 88
        Width = 121
        Height = 25
        Color = clWhite
        ReadOnly = True
        TabOrder = 1
        Text = 'enomeLista'
      end
      object eClasse_pai: TEdit
        Left = 358
        Top = 32
        Width = 128
        Height = 25
        TabStop = False
        ReadOnly = True
        TabOrder = 2
      end
      object eTab_pai: TEdit
        Left = 358
        Top = 77
        Width = 128
        Height = 25
        TabOrder = 3
        Text = 'eTab_pai'
      end
      object pk_pai: TEdit
        Left = 358
        Top = 120
        Width = 128
        Height = 25
        Color = clWhite
        ReadOnly = True
        TabOrder = 4
        Text = ' '
      end
      object Nivel: TRadioGroup
        Left = 8
        Top = 8
        Width = 137
        Height = 49
        Caption = 'Nivel'
        Items.Strings = (
          'Pai'
          'Filho')
        TabOrder = 5
        Visible = False
        OnClick = NivelClick
      end
      object idObj: TEdit
        Left = 552
        Top = 16
        Width = 33
        Height = 25
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 6
      end
      object gbDet: TGroupBox
        Left = 8
        Top = 174
        Width = 577
        Height = 112
        Caption = 'Detalhe Grid'
        TabOrder = 7
        Visible = False
        object Label1: TLabel
          Left = 4
          Top = 24
          Width = 477
          Height = 17
          Caption = 
            'Atributos Detalhe(Duplo Clique : elimina Coluna; Arrastar Coluna' +
            '  para formatar Grid)'
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 288
        Width = 603
        Height = 33
        Align = alBottom
        ParentColor = True
        TabOrder = 8
        object SpeedButton6: TSpeedButton
          Left = 155
          Top = 2
          Width = 126
          Height = 29
          Hint = 'Gerar camada de dados e camada de Obetos de neg'#243'cio'
          Caption = 'Gerar C'#243'digos  '
          Flat = True
          Glyph.Data = {
            16020000424D160200000000000076000000280000001A0000001A0000000100
            040000000000A001000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777700000077777777777777777777777777000000700000000000
            0000077777777700000070EFEF6FEFE6EFEF607777777700000070FEFE6EFEF6
            FEFE660777777700000070EFEF6FEFE6EFEF660077777700000070FEFE6EFEF6
            FEFE6606077777000000706666666660FFFF660600777700000070FEFE6EFEF6
            0EFEF60606077700000070EFEF6FEFE66000000606077700000070FEFE6EFEF6
            6066666006077700000070EFEF6FEFE660666F660607770000007066660FFFF6
            6066FE6600077700000070EFEF6066EF606FEF6606077700000070FEFE660000
            00FFFF6606077700000070EFEF660666660FEFE606000700000070FEFE660666
            F6600000060F6000000070FFFF66066FE660666660FEF6000000770EFEF606FE
            F660666E0FEFEF000000777066660FFFF66066EF60FEF600000077770EFEF6FE
            FE606EFE660F600000007777706666666660FFFF6600070000007777770EFEF6
            FEFE6EFEF6077700000077777770000000000000000777000000777777777777
            7777777777777700000077777777777777777777777777000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton6Click
        end
        object SpeedButton9: TSpeedButton
          Left = 310
          Top = 2
          Width = 126
          Height = 29
          Caption = 'Gerar Form      '
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAF8F8F8F8F8FDADAD8F8F848F8F8ADADAF8F8F4F8F8FDADAD8F8F848F8F80
            0000F8F44444F8FFFFF08F8F444F8F8FFFF0F8F8F4F8F8FFFFF000000000000F
            FFF008888888880FFFF044444444444FFFF044444444444FFFF0DADADA0FFFFF
            0000ADADAD0FFFFF0F0DDADADA0FFFFF00DAADADAD0000000DAD}
          OnClick = SpeedButton9Click
        end
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 19
      Width = 607
      Height = 25
      Align = alTop
      Caption = ' '
      ParentColor = True
      TabOrder = 4
      object sp2: TSpeedButton
        Left = 493
        Top = 0
        Width = 111
        Height = 25
        Caption = 'Atualizar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF20FFFFFFFFFFFFF2220FFFFFFFFFFFF2220FFFF
          FFFFFFF222220FFFFFFFFF2222220FFFFFFFF8220F2220FFFFFF820FFFF220FF
          FFFFFFFFFFF2220FFFFFFFFFFFFF220FFFFFFFFFFFFFF220FFFFFFFFFFFFFF82
          0FFFFFFFFFFFFFF820FFFFFFFFFFFFFFF220FFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = sp2Click
      end
      object SpeedButton5: TSpeedButton
        Left = 2
        Top = 0
        Width = 71
        Height = 25
        Caption = 'Sair   '
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        OnClick = SpeedButton5Click
      end
    end
  end
  object prg_unit: TMemo
    Left = 16
    Top = 640
    Width = 769
    Height = 33
    Lines.Strings = (
      'pr'
      'g_'
      'uni'
      't')
    TabOrder = 1
    Visible = False
  end
  object oo_unit: TMemo
    Left = 16
    Top = 604
    Width = 769
    Height = 29
    Lines.Strings = (
      'oo_'
      'unit')
    TabOrder = 2
    Visible = False
  end
end
