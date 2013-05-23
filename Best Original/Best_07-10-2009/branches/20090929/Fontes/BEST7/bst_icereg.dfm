object frm_icerg: Tfrm_icerg
  Left = 525
  Top = 192
  Width = 709
  Height = 332
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  Caption = 'BEST - Registro/License'
  Color = 16776957
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object SpeedButton1: TSpeedButton
    Left = 786
    Top = 378
    Width = 23
    Height = 22
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton6: TSpeedButton
    Left = 0
    Top = 250
    Width = 94
    Height = 22
    Hint = 'Sair'
    Caption = 'Sair/Quit    '
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Glyph.Data = {
      76020000424D7602000000000000760000002800000020000000200000000100
      0400000000000002000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000FFFFFFFFFFFFFFF033
      33333333333007FFFFFFFFFFFFFFF03333333333330807FFFFFFFFFFFFFFF033
      33333333308807FFFFFFFFFFFFFFF03333333333088807FFFFFFFFFFFFFFF033
      33333333788807FFFFFFFFFFFFFFF0A333333333788807FFFFFFFFFFFFFFF0AA
      AA333333788807FFFFFFFFFFFFFFF0AAAAAAAAAA788807FFFFFFFFFFFFFFF022
      2AAAAAAA788807FFFFFFFFFFFFFFF0FFFF2222AA788807FFFFFFFFFFFFFFF0FF
      FF2222227F8807FFFFFFFFFFFFFFF0FFFF2222227F8807FFFFFFFFFFFFF00FFF
      FF5555557F8807FFFFFFFFFFFFF0A0FFFFFF55557F8807FFFFFFFFFF0000220F
      FFFFFFF57F8807FFFFFFFFFF7A222220FFFFFFFF788807FFFFFFFFFF7A222222
      0FFFFFFF788807FFFFFFFFFF7AAAA220FFEEEEEE788807FFFFFFFFFF7777A20F
      FFFFFFFF788807FFFFFFFFFFFFF7A0FFFFEEEEFF788807FFFFFFFFFFFFF70FFF
      FFEEEEEE788807FFFFFFFFFFFFFFF0FFFFFFFEEE788807FFFFFFFFFFFFFFF0FF
      FFFEEEEE788807FFFFFFFFFFFFFFF0FFEEEEEEEE788807FFFFFFFFFFFFFFF0EE
      EEEEEEEEE78807FFFFFFFFFFFFFFF0EEEEEEEEEEEE7807FFFFFFFFFFFFFFF0EE
      EEEEEEEEEEE707FFFFFFFFFFFFFFF00000000000000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton6Click
  end
  object pcont: TSpeedButton
    Left = 97
    Top = 250
    Width = 141
    Height = 22
    Hint = 'Entrar no BEST'
    Caption = 'Continuar/Continue  '
    Enabled = False
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Glyph.Data = {
      26050000424D260500000000000036040000280000000E0000000F0000000100
      080000000000F000000000000000000000000001000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
      0707070707070707000007070707070000000007070707070000070707000000
      000000000007070700000707000000FAFAFAFA0000000707000007070000FAFA
      FAFAFAFA000007077C00070000FAFAFAFAFAFAFAFA0000070110070000FAFAFA
      FAFAFAFAFA000007E28D070000FAFAFAFAFAFAFAFA000007F400070000FFFAFA
      FAFAFAFAFA0000070200070000FFFFFAFAFAFAFAFA000007030007070000FFFF
      FAFAFAFA0000070791020707000000FFFFFAFA00000007070E23070707000000
      000000000007070701000707070707000000000707070707FFFF070707070707
      07070707070707070000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = pcontClick
  end
  object gb1: TGroupBox
    Left = 0
    Top = 4
    Width = 291
    Height = 245
    Caption = 'Informa'#231#245'es sobre a Licen'#231'a/License Information'
    Color = 16776957
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label9: TLabel
      Left = 167
      Top = 71
      Width = 45
      Height = 15
      Caption = '               '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 46
      Width = 76
      Height = 17
      Caption = 'Usu'#225'rio/User'
    end
    object Label6: TLabel
      Left = 24
      Top = 71
      Width = 121
      Height = 18
      AutoSize = False
      Caption = 'Tipo Licen'#231'a '
      WordWrap = True
    end
    object Label7: TLabel
      Left = 24
      Top = 132
      Width = 121
      Height = 21
      AutoSize = False
      Caption = 'Data Expira'#231#227'o :'
      WordWrap = True
    end
    object Label8: TLabel
      Left = 167
      Top = 46
      Width = 45
      Height = 15
      Caption = '               '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 167
      Top = 132
      Width = 42
      Height = 15
      Caption = '              '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 111
      Height = 17
      Caption = 'Data Registro/Date'
    end
    object Label12: TLabel
      Left = 167
      Top = 96
      Width = 45
      Height = 15
      Caption = '               '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 171
      Top = 148
      Width = 120
      Height = 17
      Caption = '                              '
      Color = clWhite
      ParentColor = False
      Visible = False
    end
    object Label17: TLabel
      Left = 24
      Top = 161
      Width = 117
      Height = 17
      Caption = '(A Licen'#231'a vence em :'
      Color = clWhite
      ParentColor = False
      Visible = False
    end
  end
  object gb: TGroupBox
    Left = 0
    Top = 4
    Width = 291
    Height = 237
    Caption = 'Licen'#231'a/License'
    Color = 16776957
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 84
      Height = 17
      Caption = 'Usu'#225'rio/User :'
    end
    object Label2: TLabel
      Left = 6
      Top = 48
      Width = 91
      Height = 18
      AutoSize = False
      Caption = 'Company'
      WordWrap = True
    end
    object Label4: TLabel
      Left = 6
      Top = 85
      Width = 99
      Height = 18
      AutoSize = False
      Caption = 'ID Computador'
      WordWrap = True
    end
    object SpeedButton2: TSpeedButton
      Left = 267
      Top = 74
      Width = 23
      Height = 20
      Hint = 'Gravar dados para Licenciamento'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F7333A030F0800
        F0F033377F7F73773737333AA00FFFFFFFF03FF7777F3FF3FFF70AAAAA0F00F0
        00007777777F773777770AAAAAA0FFF0FF0377777777FF37F3730AAAAAAA08F0
        F033777777777337F7330AAAAAA0FFF0033377777777FFF773330AAAAA000000
        33337777777777773333333AA033333333333337773333333333333A03333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object Edit1: TEdit
      Left = 103
      Top = 16
      Width = 165
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 103
      Top = 45
      Width = 165
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object GroupBox7: TGroupBox
      Left = 6
      Top = 178
      Width = 277
      Height = 51
      Caption = 'Importar Licen'#231'a do Arquivo/Import form File'
      TabOrder = 2
      object SpeedButton4: TSpeedButton
        Left = 128
        Top = 18
        Width = 23
        Height = 22
        Hint = ' '
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333A03333333333333377FF333333333333AA
          03333FFFFFFFFF777FF3000000AAAAAAA03377777777777777FF0FFFF0AAAAAA
          AA037F3337777777777F0FFFF0AAAAAAAAA07F3FF777777777770F00F0AAAAAA
          AA037F773777777777730FFFF0AAAAAAA0337F3FF777777777330F00FFFFF0AA
          03337F773333377773330FFFFFFFF0A033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = SpeedButton4Click
      end
    end
    object Edit4: TEdit
      Left = 103
      Top = 82
      Width = 165
      Height = 25
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 292
    Top = 190
    Width = 413
    Height = 87
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 16776957
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label11: TLabel
      Left = 27
      Top = 46
      Width = 244
      Height = 17
      Caption = 'Mytech - Servi'#231'os de Inform'#225'tica Ltda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 11
      Top = 4
      Width = 371
      Height = 18
      Caption = 'BEST - BUSINESS ENGINEERING SOLUTION TOOL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ptipo: TLabel
      Left = 27
      Top = 28
      Width = 27
      Height = 15
      Caption = 'ptipo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pver: TLabel
      Left = 158
      Top = 26
      Width = 23
      Height = 15
      Caption = 'pver'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 27
      Top = 64
      Width = 99
      Height = 15
      Caption = 'www.mytech.inf.br'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 214
      Top = 64
      Width = 123
      Height = 15
      Cursor = crHandPoint
      Caption = 'suporte@mytech.inf.br'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = Label15Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 277
    Width = 705
    Height = 23
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 3
    object Edit5: TEdit
      Left = 0
      Top = 2
      Width = 807
      Height = 23
      TabStop = False
      Color = 16776957
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.ldf'
    Filter = 
      'ICE License License File (*.ldf)|*.ldf|License File (*.lic)|*.li' +
      'c|Data File (*.dat)|*.dat'
    Title = 'Load ICE License License (*.ldf)'
    Left = 190
    Top = 202
  end
  object sv: TSaveDialog
    DefaultExt = '*.txt'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 560
    Top = 124
  end
end
