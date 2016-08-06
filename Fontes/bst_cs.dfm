inherited frm_cs: Tfrm_cs
  Left = 432
  Top = 182
  Caption = 'frm_cs'
  ClientHeight = 323
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Top = 324
  end
  inherited Panel3: TPanel
    Width = 522
    inherited sp2: TSpeedButton
      Left = 427
    end
    inherited SP_X: TSpeedButton
      Left = 572
    end
    object spp: TSpeedButton [5]
      Left = 109
      Top = 4
      Width = 19
      Height = 18
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sppClick
    end
    inherited DBEdit6: TDBEdit
      Left = 129
      Width = 293
    end
  end
  inherited pgcp: TPageControl
    Top = 51
    Width = 561
    Height = 273
    inherited tb_geral: TTabSheet
      Font.Name = 'Calibri'
      inherited docext: TSpeedButton
        Left = 6
        Visible = False
      end
      object Label1: TLabel [1]
        Left = 0
        Top = 69
        Width = 91
        Height = 14
        Caption = 'Nome da Classe:'
        FocusControl = BitBtn1
      end
      object Label2: TLabel [2]
        Left = 0
        Top = 95
        Width = 59
        Height = 14
        Caption = 'Descri'#231#227'o :'
        FocusControl = BitBtn1
      end
      object Label3: TLabel [3]
        Left = -1
        Top = 124
        Width = 63
        Height = 14
        Caption = 'Classe m'#227'e'
        FocusControl = BitBtn1
        Visible = False
      end
      object Label10: TLabel [4]
        Left = 1
        Top = 44
        Width = 44
        Height = 14
        Caption = 'Tabela :'
        FocusControl = BitBtn1
      end
      object SpeedButton11: TSpeedButton [5]
        Left = 239
        Top = 40
        Width = 54
        Height = 20
        Caption = 'Lista   '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton10Click
      end
      object spmet: TSpeedButton [6]
        Left = 408
        Top = 163
        Width = 105
        Height = 21
        Caption = 'M'#233'todos      '
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADAD00CDADADDADADAD00CDADADAAD000070CDADADADD0DADA0BDADA
          DADA0DAFFFF0000000000AF7F770FFFFFFF00DFFFFF0FFFFFFF00AF77F70F7FF
          FFF0A0FFFF0FFFFFFFF0DA00007F77FFFFF0AD0FFFFFFFFFFFF0DA0F7777F77F
          FFF0AD0FFFFFFFFFFFF0DA00000000000000ADADADADADADADAD}
        Margin = 10
        OnClick = spmetClick
      end
      object spb_ger: TSpeedButton [7]
        Left = 408
        Top = 187
        Width = 105
        Height = 22
        Caption = 'Gerar C'#243'digo'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        Margin = 10
        NumGlyphs = 2
        OnClick = spb_gerClick
      end
      inherited DBEdit12: TDBEdit
        Left = 219
        Height = 24
        DataField = ''
        Visible = False
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 66
        Width = 138
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDF_DESIGNACAO'
        TabOrder = 1
      end
      object rg_style: TDBRadioGroup
        Left = 296
        Top = 37
        Width = 219
        Height = 97
        Caption = 'Estilo de Classe'
        DataField = 'IDF_CSSTYLE'
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 91
        Width = 196
        Height = 22
        DataField = 'IDF_OBJETIVO'
        MaxLength = 50
        TabOrder = 3
      end
      object CMB_ANCESTOR: TDBLookupComboBox
        Left = 96
        Top = 119
        Width = 198
        Height = 22
        TabOrder = 4
        Visible = False
      end
      object DBEdit3: TDBEdit
        Left = 96
        Top = 40
        Width = 138
        Height = 22
        DataField = 'IDF_TABELA'
        MaxLength = 50
        ReadOnly = True
        TabOrder = 5
        OnExit = DBEdit3Exit
      end
    end
    inherited Tb_atv: TTabSheet
      TabVisible = False
    end
    inherited tb_dados: TTabSheet
      TabVisible = False
    end
    object tab_atributos: TTabSheet [3]
      Caption = 'Propriedades'
      ImageIndex = 4
      TabVisible = False
      object SpeedButton8: TSpeedButton
        Left = 479
        Top = 0
        Width = 266
        Height = 25
        Caption = 'Incluir Atributo de Objeto de Neg'#243'cio'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          16020000424D160200000000000076000000280000001A0000001A0000000100
          040000000000A001000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777700070077777777777777777777777777210300777777777777
          777777777777770091027788888888888888888888777700EE2677F000000000
          0000000008777700010077F0FFFFFFFFFFFF077708777700FFFF77F087777777
          777F078708777700000077F087777777777F0888087777FF020177F087000000
          007F0787087777FF120177F087777777777F0000087777FF220177F087000000
          007F0777087777FF320177F087777777777F0777087777FF420177F087000000
          007F0777087777FF520177F087777777777F0777087777FF620177F087000000
          007F0777087777FF720177F087777777777F000008777700940377F087000000
          007F078708777700000077F087777777777F088808777700000077F087777777
          777F078708777700000077F088888888888F077708777700000077F000000000
          0000000008777700000077FFFFFFFFFFFFFFFFFFF87777000000777777777777
          7777777777777700000077777777777777777777777777000000777777777777
          7777777777777700FF0777777777777777777777777777000000}
        ParentFont = False
        Visible = False
        OnClick = sListaClick
      end
      object SpeedButton1: TSpeedButton
        Left = 176
        Top = 0
        Width = 154
        Height = 25
        Caption = 'Excluir por Propriedades     '
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object sp_atrib: TSpeedButton
        Left = 7
        Top = 0
        Width = 154
        Height = 25
        Caption = 'Gerar Propriedades'
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          16020000424D160200000000000076000000280000001A0000001A0000000100
          040000000000A001000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777700070077777777777777777777777777210300777777777777
          777777777777770091027788888888888888888888777700EE2677F000000000
          0000000008777700010077F0FFFFFFFFFFFF077708777700FFFF77F087777777
          777F078708777700000077F087777777777F0888087777FF020177F087000000
          007F0787087777FF120177F087777777777F0000087777FF220177F087000000
          007F0777087777FF320177F087777777777F0777087777FF420177F087000000
          007F0777087777FF520177F087777777777F0777087777FF620177F087000000
          007F0777087777FF720177F087777777777F000008777700940377F087000000
          007F078708777700000077F087777777777F088808777700000077F087777777
          777F078708777700000077F088888888888F077708777700000077F000000000
          0000000008777700000077FFFFFFFFFFFFFFFFFFF87777000000777777777777
          7777777777777700000077777777777777777777777777000000777777777777
          7777777777777700FF0777777777777777777777777777000000}
        ParentFont = False
        OnClick = sp_atribClick
      end
      object Label7: TLabel
        Left = 472
        Top = 168
        Width = 53
        Height = 14
        Caption = 'Descri'#231#227'o'
      end
      object Label13: TLabel
        Left = 472
        Top = 40
        Width = 79
        Height = 14
        Caption = 'Nome Atributo'
      end
      object Label14: TLabel
        Left = 472
        Top = 81
        Width = 71
        Height = 14
        Caption = 'Valor padr'#227'o'
      end
      object Label15: TLabel
        Left = 616
        Top = 40
        Width = 84
        Height = 14
        Caption = 'Mostra na Lista'
      end
      object Label16: TLabel
        Left = 616
        Top = 82
        Width = 24
        Height = 14
        Caption = 'Tipo'
      end
      object Label17: TLabel
        Left = 472
        Top = 123
        Width = 68
        Height = 14
        Caption = 'Visibilidade'
      end
      object DBG_ATRIB: TDBGrid
        Left = -9
        Top = 26
        Width = 250
        Height = 391
        FixedColor = clBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        OnCellClick = DBG_ATRIBCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            PickList.Strings = (
              'C'
              'I'
              'N'
              'M'
              'D'
              'T')
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 196
            Visible = True
          end>
      end
      object Edit2: TEdit
        Left = 472
        Top = 60
        Width = 121
        Height = 25
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 472
        Top = 102
        Width = 121
        Height = 25
        TabOrder = 2
      end
      object Memo2: TMemo
        Left = 472
        Top = 184
        Width = 297
        Height = 89
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 616
        Top = 61
        Width = 33
        Height = 25
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 616
        Top = 104
        Width = 145
        Height = 25
        TabOrder = 5
      end
      object Edit7: TEdit
        Left = 472
        Top = 144
        Width = 121
        Height = 25
        TabOrder = 6
      end
      object rg_vis: TRadioGroup
        Left = 272
        Top = 32
        Width = 185
        Height = 65
        Caption = 'Visibilidade'
        TabOrder = 7
        OnClick = rg_visClick
      end
      object rd_tipo: TRadioGroup
        Left = 272
        Top = 104
        Width = 185
        Height = 313
        Caption = 'Tipos'
        TabOrder = 8
      end
    end
    object tab_metodos: TTabSheet [4]
      Caption = 'M'#233'todos'
      ImageIndex = 5
      TabVisible = False
      object Label4: TLabel
        Left = 0
        Top = 258
        Width = 62
        Height = 14
        Caption = 'Par'#225'metros'
      end
      object Label5: TLabel
        Left = 328
        Top = 258
        Width = 112
        Height = 14
        Caption = 'Descri'#231#227'o Par'#225'metro'
      end
      object RD_MVIS: TDBRadioGroup
        Left = 482
        Top = 4
        Width = 137
        Height = 97
        Caption = 'Visibilidade'
        TabOrder = 1
      end
      object RD_MTIPO: TDBRadioGroup
        Left = 482
        Top = 115
        Width = 137
        Height = 246
        Caption = 'Tipo'
        TabOrder = 2
      end
      object RD_TIM: TDBRadioGroup
        Left = 632
        Top = 4
        Width = 137
        Height = 95
        Caption = 'Tipo M'#233'todo'
        TabOrder = 3
      end
      object RD_BIN: TDBRadioGroup
        Left = 632
        Top = 112
        Width = 137
        Height = 97
        Caption = 'Binding'
        TabOrder = 4
      end
      object RD_DIR: TDBRadioGroup
        Left = 632
        Top = 222
        Width = 137
        Height = 136
        Caption = 'Diretivas'
        TabOrder = 5
      end
      object dbg_met: TDBGrid
        Left = 0
        Top = 69
        Width = 470
        Height = 189
        FixedColor = clBlue
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        OnCellClick = dbg_metCellClick
        OnEnter = dbg_metEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_SEQ'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Seq.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 245
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TIPO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Caption = 'Tipo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 157
            Visible = True
          end>
      end
      object DBG_PARM: TDBGrid
        Left = 0
        Top = 282
        Width = 302
        Height = 83
        FixedColor = clBlue
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 6
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        OnCellClick = DBG_PARMCellClick
        OnEnter = DBG_PARMEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_SEQ'
            Title.Caption = 'Seq.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PR_NOME'
            Title.Caption = 'Par'#225'metro'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PR_TIPO'
            Title.Caption = 'Tipo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 87
            Visible = True
          end>
      end
      object DBMemo1: TDBMemo
        Left = 320
        Top = 282
        Width = 153
        Height = 83
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object DBMemo2: TDBMemo
        Left = 0
        Top = 8
        Width = 473
        Height = 57
        TabOrder = 8
      end
    end
    object TabSheet1: TTabSheet [5]
      Caption = 'Eventos'
      ImageIndex = 6
      TabVisible = False
      object DBGrid1: TDBGrid
        Left = 9
        Top = 9
        Width = 772
        Height = 310
        FixedColor = clBlue
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_SEQ'
            Title.Caption = 'Seq.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MET_VISIBIL'
            Title.Caption = 'Vis.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 657
            Visible = True
          end>
      end
    end
    object Tab_objeto: TTabSheet [6]
      Caption = 'Gera'#231#227'o'
      ImageIndex = 7
      TabVisible = False
      object SpeedButton2: TSpeedButton
        Left = 2
        Top = 162
        Width = 103
        Height = 32
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
        OnClick = SpeedButton2Click
      end
      object sp_crude: TSpeedButton
        Left = 2
        Top = 240
        Width = 103
        Height = 32
        Hint = 
          'Recria M'#233'todos B'#225'sicos iniciais ;  preserva os m'#233'todos criados m' +
          'anualmente.'
        Caption = 'Recriar CRUDE'
        Flat = True
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7700000777777777777777777777777770000007777777777777777777777777
          7077700777777777777777777777707770777007777077777777777777770007
          0078700007000777777777777770800007787700007000777777777777088807
          777777770777000777777777708F88877FFFFF07788770077777777777088888
          F88888FF08870077777777777770880888877778F07000777777777777088888
          880007778F770077777777700008F088007777077F07000000777700008F0888
          0800077778F7700000777708888F0880F08F807078F7777700777708F88F0780
          F070F07078F7887700777708888F0780F077807088F7777700777700008F0788
          FF00080888F77000007777777708F0780FFFF0088F770077777777777708F077
          88000888887700777777777777708F0778888888087000777777777777088FF0
          077788088887000777777777708F888FF00000F878877007777777777708F808
          8FFFFF8807870077777777777770800008888800007007777777777777770077
          70888007770077777777777777777777708F8007777777777777777777777777
          7088800777777777777777777777777770000007777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        ParentShowHint = False
        ShowHint = True
      end
      object SpeedButton9: TSpeedButton
        Left = 2
        Top = 201
        Width = 103
        Height = 31
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
      object prg_unit: TMemo
        Left = 112
        Top = 161
        Width = 600
        Height = 182
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object OO_unit: TMemo
        Left = 112
        Top = 161
        Width = 600
        Height = 182
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Memo1: TMemo
        Left = 112
        Top = 352
        Width = 609
        Height = 75
        Lines.Strings = (
          'Para Compilar o Form :'
          ' - abrir um Projeto'
          ' - adicionar ao projeto :'
          '   .. frm_primar'
          '   .. cad_standd,'
          '   .. o form criado'
          '   '
          ''
          'Nas options do Projeto, colocar o form criado como autocreate'
          '')
        ScrollBars = ssVertical
        TabOrder = 1
        Visible = False
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 2
        Width = 761
        Height = 157
        Caption = 'Projeto'
        TabOrder = 3
        object Label12: TLabel
          Left = 7
          Top = 14
          Width = 108
          Height = 14
          Caption = 'Diret'#243'rio do projeto'
        end
        object Label9: TLabel
          Left = 455
          Top = 19
          Width = 158
          Height = 14
          Caption = 'Nome Unit Classes de Dados'
        end
        object Label11: TLabel
          Left = 455
          Top = 59
          Width = 229
          Height = 14
          Caption = 'Nome Unit Classes de Objetos de Neg'#243'cio'
        end
        object sp_veroo: TSpeedButton
          Left = 660
          Top = 75
          Width = 71
          Height = 22
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
        object sp_verdd: TSpeedButton
          Left = 660
          Top = 35
          Width = 71
          Height = 22
          Caption = 'Ver C'#243'digo'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
          OnClick = sp_verddClick
        end
        object Label6: TLabel
          Left = 455
          Top = 102
          Width = 79
          Height = 14
          Caption = 'Nome da Tela '
        end
        object BT1: TSpeedButton
          Left = 420
          Top = 29
          Width = 23
          Height = 21
          Flat = True
          Glyph.Data = {
            36080000424D3608000000000000360400002800000020000000200000000100
            0800000000000004000000000000000000000001000000000000000000004000
            000080000000FF000000002000004020000080200000FF200000004000004040
            000080400000FF400000006000004060000080600000FF600000008000004080
            000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
            000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
            200080002000FF002000002020004020200080202000FF202000004020004040
            200080402000FF402000006020004060200080602000FF602000008020004080
            200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
            200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
            400080004000FF004000002040004020400080204000FF204000004040004040
            400080404000FF404000006040004060400080604000FF604000008040004080
            400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
            400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
            600080006000FF006000002060004020600080206000FF206000004060004040
            600080406000FF406000006060004060600080606000FF606000008060004080
            600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
            600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
            800080008000FF008000002080004020800080208000FF208000004080004040
            800080408000FF408000006080004060800080608000FF608000008080004080
            800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
            800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
            A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
            A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
            A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
            A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
            C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
            C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
            C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
            C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
            FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
            FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
            FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
            FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0CFCFC0CFF0091009100910091009100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C
            0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CFC
            FC0CFF009100910091009100910091FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C
            0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF0CFCFC0CFF00910091009100910091FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0CFCFC0CFF0091009100910091009100FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0CFCFC0CFFB600910091009100910091FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0C0C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C
            0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CFC
            FC0CFF00B600B600B600B600B600B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C
            0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = BT1Click
        end
        object DBEdit7: TDBEdit
          Left = 5
          Top = 30
          Width = 412
          Height = 25
          DataField = 'IDF_DIRPROJ'
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 455
          Top = 35
          Width = 204
          Height = 25
          DataField = 'IDF_UNIT'
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 455
          Top = 75
          Width = 204
          Height = 25
          DataField = 'IDF_UNIT_OO'
          TabOrder = 2
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 54
          Width = 433
          Height = 98
          Caption = 'Telas'
          TabOrder = 3
          object Label18: TLabel
            Left = 8
            Top = 72
            Width = 90
            Height = 14
            Caption = 'Atributo da Lista'
          end
          object g_master: TGroupBox
            Left = 234
            Top = 12
            Width = 149
            Height = 84
            Caption = 'Master/Detail'
            Enabled = False
            TabOrder = 0
            Visible = False
            object sp_ger: TSpeedButton
              Left = 24
              Top = 55
              Width = 95
              Height = 25
              Caption = 'Gerar Form    '
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
            end
            object Label8: TLabel
              Left = 10
              Top = 16
              Width = 75
              Height = 14
              Caption = 'Tabela Detail'
            end
            object Edit4: TEdit
              Left = 10
              Top = 29
              Width = 127
              Height = 25
              TabOrder = 0
            end
          end
          object rg: TRadioGroup
            Left = 8
            Top = 12
            Width = 217
            Height = 49
            Caption = 'Tipo tela'
            ItemIndex = 0
            Items.Strings = (
              'Simples'
              'Master/Detail')
            TabOrder = 1
            Visible = False
            OnClick = rgClick
          end
          object e_nomeLista: TEdit
            Left = 96
            Top = 68
            Width = 129
            Height = 25
            ReadOnly = True
            TabOrder = 2
          end
        end
        object DBEdit8: TDBEdit
          Left = 455
          Top = 114
          Width = 204
          Height = 25
          DataField = 'idf_form'
          TabOrder = 4
        end
      end
    end
    inherited tb_ger: TTabSheet
      inherited gb: TGroupBox
        inherited db_versao: TDBEdit
          Height = 23
          Font.Name = 'Calibri'
        end
      end
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 522
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 522
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        Width = 522
      end>
    inherited StandardToolBar: TToolBar
      Width = 509
      Height = 25
      ButtonHeight = 25
      inherited spb_copy: TSpeedButton
        Height = 25
      end
      inherited spb_Paste: TSpeedButton
        Height = 25
      end
    end
    inherited ToolBar1: TToolBar
      Width = 509
    end
  end
  inherited ToolbarImages: TImageList
    Left = 746
    Top = 403
  end
  inherited fnt: TFontDialog
    Left = 752
    Top = 380
  end
  inherited PopupMenu1: TPopupMenu
    Left = 701
    Top = 231
  end
  inherited OD: TOpenDialog
    Left = 648
    Top = 222
  end
  inherited MainMenu1: TMainMenu
    Left = 348
    Top = 435
  end
end
