inherited FRM_usuario: TFRM_usuario
  Left = 278
  Top = 130
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Classe de Usu'#225'rios'
  ClientHeight = 560
  ClientWidth = 979
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited LTot: TLabel
    Left = 5
    Top = 354
  end
  inherited sp_insertDet: TSpeedButton
    Top = 367
    Width = 175
    Caption = 'Criar Nova Pessoa  da Classe     '
    Enabled = False
    Margin = 0
    OnClick = Abre_Det
  end
  object l_US_NOME: TLabel [2]
    Left = 285
    Top = 23
    Width = 43
    Height = 14
    Caption = 'Usu'#225'rio'
  end
  object l_DATATU: TLabel [3]
    Left = 781
    Top = 659
    Width = 82
    Height = 14
    Caption = 'Dt. Atualiza'#231#227'o'
  end
  object IncAllBtn: TSpeedButton [4]
    Left = 493
    Top = 500
    Width = 38
    Height = 39
    Caption = '>>'
    Visible = False
  end
  object ExAllBtn: TSpeedButton [5]
    Left = 441
    Top = 493
    Width = 38
    Height = 38
    Caption = '<<'
    Enabled = False
    Visible = False
  end
  object rdg11: TRadioGroup [6]
    Left = 677
    Top = 199
    Width = 172
    Height = 102
    Caption = 'Grupos'
    Items.Strings = (
      'Dimens'#245'es'
      'Tecnologia'
      'Aspectos Cr'#237'ticos'
      'Custodiais'
      'Ferramentas'
      'Reposit'#243'rios'
      'Diagramas')
    TabOrder = 3
    Visible = False
    OnClick = rdgClick
  end
  inherited Panel1: TPanel
    Left = 0
    Width = 277
    Height = 331
    TabOrder = 5
    inherited lb: TListBox
      Width = 269
      Height = 323
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 979
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 979
      end>
    inherited ToolBar1: TToolBar
      Width = 966
    end
  end
  object US_NOME: TEdit [9]
    Left = 285
    Top = 38
    Width = 271
    Height = 22
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object d_DATATU: TDateTimePicker [10]
    Left = 140
    Top = 520
    Width = 135
    Height = 21
    Date = 38140.524316932900000000
    Time = 38140.524316932900000000
    TabOrder = 6
    Visible = False
    OnCloseUp = DateClose
  end
  object DATATU: TEdit [11]
    Left = 871
    Top = 659
    Width = 77
    Height = 20
    BorderStyle = bsNone
    Color = 16382457
    ReadOnly = True
    TabOrder = 1
  end
  object ID_USUARIO: TEdit [12]
    Left = 730
    Top = 659
    Width = 25
    Height = 20
    TabStop = False
    BorderStyle = bsNone
    ParentColor = True
    ReadOnly = True
    TabOrder = 0
  end
  object CLI_ID: TEdit [13]
    Left = 566
    Top = 474
    Width = 25
    Height = 20
    BorderStyle = bsNone
    Color = 13224393
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object PRJ_ID: TEdit [14]
    Left = 567
    Top = 452
    Width = 24
    Height = 19
    BorderStyle = bsNone
    Color = 13224393
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object gb_cliente: TGroupBox [15]
    Left = 284
    Top = 68
    Width = 210
    Height = 106
    Caption = 'Cliente'
    Enabled = False
    TabOrder = 9
    object Label1: TLabel
      Left = 13
      Top = 21
      Width = 47
      Height = 14
      Caption = 'Empresa'
    end
    object Label2: TLabel
      Left = 13
      Top = 63
      Width = 42
      Height = 14
      Caption = 'Cen'#225'rio'
    end
    object CMB_CLI: TComboBox
      Left = 13
      Top = 36
      Width = 185
      Height = 22
      ItemHeight = 14
      TabOrder = 2
      OnClick = CMB_CLIClick
    end
    object CMB_PROJ: TComboBox
      Left = 13
      Top = 77
      Width = 185
      Height = 22
      Enabled = False
      ItemHeight = 14
      TabOrder = 3
      OnClick = CMB_PROJClick
    end
    object Edit1: TEdit
      Left = 13
      Top = 36
      Width = 166
      Height = 22
      Color = clWhite
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 13
      Top = 77
      Width = 166
      Height = 22
      Color = clWhite
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GPB_PRIV: TGroupBox [16]
    Left = 281
    Top = 175
    Width = 656
    Height = 378
    TabOrder = 10
    object SpeedButton1: TSpeedButton
      Left = 7
      Top = 9
      Width = 128
      Height = 24
      Caption = 'Mostra Privil'#233'gios'
      Enabled = False
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000BFBFBFBFBFBF
        DFDFDF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F9F9F9F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBF7F7F7F
        9F9F9F7F7F7FDFDFDF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7FBFBFBF3F3F3F3F3F3F7F7F7F9F9F9FDFDFDF7F7F7F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FFFFFFFFFFFFF
        FFFFFF7F7F7FBFBFBFBFBFBF7F7F7F4080008080008080008080008080004040
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FBFBFBFBFBFBF7F7F7F00
        80000080004080008080008080004040007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7F6060209F9F9F7F7F7F0080000080000080002080006080004040
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FBFBFBFDFDFDF7F7F7F00
        80000080000080000080000080002040007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7FBFBFBFBFBFBF7F7F7F00800060A0603090300080000080000040
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FBFBFBFBFBFBF7F7F7F00
        8000408040DFDF5F7F9F400080000040007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7FBFBFBFBFBFBF7F7F7F7F9F7FFFFF7FFFFF7FFFFF7F7F9F400040
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FDFDFDF9F9F9F7F7F7FFF
        FF3FFFFF3FFFFF3FFFFF3FFFFF3F5F5F207F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7F7F7FDFDFDF7F7F7FFFFF007FFF7FFFFF00FFFF00FFFF007F7F
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F7F7F7F7F
        FF7F00FFFF7FFF7FFFFF00FFFF007F7F007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF}
      Spacing = 3
      OnClick = SpeedButton1Click
    end
    object spm1: TSpeedButton
      Left = 138
      Top = 9
      Width = 175
      Height = 24
      Caption = 'Eliminar Todos os Privil'#233'gios'
      Enabled = False
      Flat = True
      NumGlyphs = 2
      OnClick = spm1Click
    end
    object ExcludeBtn: TSpeedButton
      Left = 267
      Top = 233
      Width = 38
      Height = 39
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00700000000000
        00000000000000000007077777777777777777777777777777700F7777777777
        777777777777777777700FF888888888888888888888888887700FF888888888
        888888888888888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FF8888888888888888888FF888887700FF888888888
        88888888F88F888887700FF888888888888888F8888F888887700FF888888888
        8888F888888F888887700FF88888888888F88888888F888887700FF888888888
        F8888888888F888887700FF8888888F888888888888F888887700FF88888F888
        88888888888F888887700FF888F8888888888888888F888887700FF888008888
        88888888888F888887700FF88888008888888888888F888887700FF888888800
        88888888888F888887700FF88888888800888888888F888887700FF888888888
        88008888888F888887700FF88888888888880088888F888887700FF888888888
        88888800888F888887700FF88888888888888888008F888887700FF888888888
        888888888800888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FFFFFFFFFFFFFFFFFFFFFFFFFFFF7700FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7070000000000000000000000000000007}
      ParentFont = False
      Spacing = 0
      Visible = False
      OnClick = lb_ucDblClick
    end
    object IncludeBtn: TSpeedButton
      Left = 267
      Top = 278
      Width = 38
      Height = 38
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00700000000000
        00000000000000000007077777777777777777777777777777700F7777777777
        777777777777777777700FF888888888888888888888888887700FF888888888
        888888888888888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FF888880F88888888888888888887700FF8888808FF
        888888888888888887700FF888880888FF8888888888888887700FF888880888
        88FF88888888888887700FF8888808888888FF888888888887700FF888880888
        888888FF8888888887700FF88888088888888888FF88888887700FF888880888
        8888888888FF888887700FF888880888888888888888FF8887700FF888880888
        888888888888808887700FF888880888888888888880888887700FF888880888
        888888888088888887700FF888880888888888808888888887700FF888880888
        888880888888888887700FF888880888888088888888888887700FF888880888
        808888888888888887700FF888880880888888888888888887700FF888880088
        888888888888888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FF888888888888888888888888887700FF888888888
        888888888888888887700FFFFFFFFFFFFFFFFFFFFFFFFFFFF7700FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7070000000000000000000000000000007}
      ParentFont = False
      Visible = False
      OnClick = IncludeBtnClick
    end
    object gpb: TGroupBox
      Left = 317
      Top = 7
      Width = 332
      Height = 367
      Caption = 'Casos de Uso'
      Enabled = False
      TabOrder = 0
      object rg1: TRadioGroup
        Left = 7
        Top = 60
        Width = 248
        Height = 53
        Caption = 'Op'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Casos de Uso'
          'Diagramas')
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnClick = rg1Click
      end
      object Panel4: TPanel
        Left = 5
        Top = 134
        Width = 324
        Height = 225
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 4
        Caption = 'Panel1'
        TabOrder = 0
        object Label3: TLabel
          Left = 4
          Top = 0
          Width = 106
          Height = 14
          Caption = 'Par'#226'metros Default'
        end
        object Label4: TLabel
          Left = 4
          Top = 60
          Width = 73
          Height = 14
          Caption = 'Casos de Uso'
        end
        object lb_uc: TListBox
          Left = 4
          Top = 75
          Width = 284
          Height = 128
          BevelInner = bvSpace
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ItemHeight = 13
          MultiSelect = True
          ParentFont = False
          Sorted = True
          TabOrder = 0
          OnDblClick = lb_ucDblClick
        end
        object RDG_ACESSO: TRadioGroup
          Left = 4
          Top = 15
          Width = 145
          Height = 47
          Caption = 'Acesso'
          Items.Strings = (
            'Somente Leitura'
            'Acesso Total')
          TabOrder = 1
        end
        object RDG_NIVEL: TRadioGroup
          Left = 166
          Top = 15
          Width = 106
          Height = 47
          Caption = 'N'#237'veis Abaixo'
          Items.Strings = (
            'S'
            'N')
          TabOrder = 2
        end
      end
      object rdg: TRadioGroup
        Left = 5
        Top = 11
        Width = 324
        Height = 124
        Items.Strings = (
          'Tudo'
          'Dimens'#245'es'
          'Tecnologia'
          'Aspectos Cr'#237'ticos'
          'Custodiais'
          'Ferramentas'
          'Reposit'#243'rios'
          'Diagramas')
        TabOrder = 2
        OnClick = rdgClick
      end
    end
    object GB_PRIV: TGroupBox
      Left = 7
      Top = 35
      Width = 258
      Height = 339
      Caption = 'Privil'#233'gios'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object Panel2: TPanel
        Left = 2
        Top = 16
        Width = 254
        Height = 321
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 4
        Caption = 'Panel1'
        TabOrder = 0
        object lb_priv: TListBox
          Left = 4
          Top = 4
          Width = 246
          Height = 313
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ItemHeight = 14
          MultiSelect = True
          ParentFont = False
          Sorted = True
          TabOrder = 0
          OnDblClick = lb_privDblClick
        end
      end
    end
  end
  object gpb_diagrama: TGroupBox [17]
    Left = 499
    Top = 75
    Width = 394
    Height = 68
    Caption = 'Diagrama'
    TabOrder = 11
    object SpeedButton2: TSpeedButton
      Left = 7
      Top = 42
      Width = 194
      Height = 23
      Caption = 'Eliminar Privil'#233'gios do Diagrama'
      Flat = True
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object Edit3: TEdit
      Left = 7
      Top = 15
      Width = 382
      Height = 25
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 136
    Top = 480
  end
end
