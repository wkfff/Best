inherited frm_se: Tfrm_se
  Left = 318
  Top = 154
  Caption = 'Mecanismos'
  ClientHeight = 429
  ClientWidth = 513
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Top = 448
  end
  inherited Panel3: TPanel
    Width = 513
    Visible = False
    inherited sp2: TSpeedButton
      Left = 757
    end
    inherited sp_print: TSpeedButton
      OnClick = sp_printClick
    end
    inherited DBEdit6: TDBEdit
      Left = 306
      Top = 8
      Width = 223
    end
  end
  inherited BitBtn1: TBitBtn
    Top = 448
  end
  inherited pgcp: TPageControl
    Width = 513
    Height = 399
    ActivePage = tb_dados
    inherited tb_geral: TTabSheet
      Caption = 'Mecanismos/Programs'
      inherited docext: TSpeedButton
        Top = 302
      end
      object Label2: TLabel [1]
        Left = 5
        Top = 0
        Width = 69
        Height = 14
        Caption = 'Nome/Name'
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel [2]
        Left = 6
        Top = 83
        Width = 169
        Height = 14
        Caption = 'Sistema Aplicativo/Application'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [3]
        Left = 5
        Top = 42
        Width = 11
        Height = 14
        Caption = 'Id'
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [4]
        Left = 6
        Top = 124
        Width = 121
        Height = 14
        Caption = 'Descri'#231#227'o/Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object spp: TSpeedButton [5]
        Left = 469
        Top = 57
        Width = 28
        Height = 26
        Hint = 'Diret'#243'rios'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
          333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
          300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
          333337F373F773333333303330033333333337F3377333333333303333333333
          333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
          333337777F337F33333330330BB00333333337F373F773333333303330033333
          333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
          333377777F77377733330BBB0333333333337F337F33333333330BB003333333
          333373F773333333333330033333333333333773333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sppClick
      end
      object SpeedButton1: TSpeedButton [6]
        Left = 469
        Top = 96
        Width = 28
        Height = 27
        Hint = 'Aplicativos'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Glyph.Data = {
          66050000424D6605000000000000260300002800000018000000180000000100
          08000000000040020000120B0000120B0000BC000000BC00000000000000FFFF
          FF00FF00FF00FEFBFB00FEFCFC0096351100FEFBFA00FEFCFB0098441000FEF8
          F400BD580C00FEF7F200FEFAF70067360D00FEF3EA00FEF8F300E97F1E00FEEF
          E100FEF4EB00FEF6EF00FEDAB600FEDEBD00FEE6CE00FEEBD800FEEFE000FEF0
          E200FEF4EA00FEF6EE00FEF7F000FEF8F200FEFAF600FEFBF800FEFCFA00FEDA
          B400FEDEBC00FEE0BF00FEE2C400FEE3C500FEE3C600FEE5C900FEE5CA00FEE6
          CB00FEE6CC00FEE7CF00FEEAD400FEEAD500FEEBD700FEEDDA00FEEEDC00FEEE
          DD00FEF0E100FEF2E500FEF4E900FEF6ED00FEE9D000FEEAD300FEEBD500FEED
          D900FEEFDE00FEF3E600FEF7EF00FEEAD100FEEED900FEEEDA00FEF2E200FEF2
          E300FEF4E700FEF8F000FEFBF700FEF6EB00FEFAF400FEFEFB00FEFEFC00353D
          0A00B0BA8400B1D7A3004B803A00B1D9A70041843B00012E0200012D02004299
          430002670600013E0300013D0300013C0300013B03000134030003970B000391
          0A0003890A0003840A00025F0600025605000130030003800900037E09000250
          05004FB454005FBB6300039F0D00039E0C00039C0C00039A0C00027A09000274
          090003950B0003920B0004A01000049F0F00049E0F00036E090005A0100005A0
          1100046C0B0007871000098B130006A1130007A11600098E1400098B14000A8F
          16000A8E16000A8C15000A8C16000B9018000B8C160044B24F0044AD4D0007A3
          180008A3190008A31A0009A41C000AA520000BA623000CA623000CA624000CA6
          25000DA727000EA929000FAA2D000FA92C000FAA2E0010AA300011AA30000D82
          250012AB350013AC370013AC380014AD3A0015AD3D0018AF400016AF400017AF
          410017AF420018B1470018B044001AB149001BB24C001BB14B001CB24D001CB2
          4E002DB8590022B5540024B6560026B757002EBB5E002FBB600035BD650036BD
          66003EC16C0041C16E0047C474005ACB830062CE890069D08F006BD191006FD3
          95007DD79E0089DAA70095DEB00099E0B4009AE1B500A5E3BC0083D9A400ADE6
          C400FEFEFE00DCDCDC0002020202020202020202020202020253545556020202
          0202020202020202020202020202025354585A5F684F57020202020202020202
          0202020202026F766E586A6A595B69500202050505050505050505050D728B85
          81706565656558604F0205453B18393D292415144E98928D8783016565656567
          5E02050F1B42193F2C162623919F9A948E890101646565656B5D051F461C3441
          31382B277CA4A19C95900101016D6565665C05BA03441D123B3A39367BACA3A0
          9B96010101816C65655205BABA470C0F353B322F78B0AAA1A19D01018D868271
          655205BABABA481F0F13344080AEB3A5A1A10199938C8884756105BABABABABA
          06461C1A4B79B6B8A6A1A19E9C958F8A730205BABABABABABA070C0B12627DB7
          B9AFABA8A9A29774490205BABABABABABABA04440F1B6379B1B5B4B2ADA77E4C
          050205BABABABABABABABABA20463C4D7F77797A74514A21050205BABABABABA
          BABABABABA071E0B1233181736282422050205BABABABABABABABABABABA470C
          1D1B3B113E372A25050205BABABABABABABABABABABABA481F093C0E40302D16
          050205BABABABABABABABABABABABABABA201E4312413A2E050205BBBBBBBBBB
          BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB05020508080808080808080808080808
          080808080808080805020A101010101010101010101010101010101010101010
          0A02020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          02020202020202020202}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      inherited DBEdit12: TDBEdit
        Top = 302
        Width = 327
        TabOrder = 5
      end
      object cmb_aplic: TDBLookupComboBox
        Left = 6
        Top = 97
        Width = 459
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 5
        Top = 15
        Width = 492
        Height = 22
        DataField = 'IDF_DESIGNACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 405
        Top = 130
        Width = 91
        Height = 22
        DataField = 'idf_cod_aplic'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object DBEdit3: TDBEdit
        Left = 5
        Top = 57
        Width = 460
        Height = 22
        DataField = 'IDF_SIGLA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBRichEdit1: TDBRichEdit
        Left = 5
        Top = 140
        Width = 492
        Height = 154
        DataField = 'IDF_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    inherited tb_dados: TTabSheet [1]
      Caption = 'Caracter'#237'sticas/Data'
      inherited lb2: TLabel
        Top = 193
      end
      inherited sLista: TSpeedButton
        Left = 781
        Top = 17
        Glyph.Data = {00000000}
      end
      inherited dbg_dg1: TDBGrid
        Top = 201
      end
      inherited db_desc: TDBMemo
        Top = 209
      end
      inherited dbg_dg: TDBGrid
        Height = 172
      end
      inherited gb_dom: TGroupBox
        Top = 200
      end
    end
    inherited Tb_atv: TTabSheet [2]
      inherited lv: TListView
        Left = 0
        Width = 505
        Height = 289
      end
    end
    object TabSheet1: TTabSheet [3]
      Caption = 'Indicadores/Indicators'
      ImageIndex = 4
      object Label1: TLabel
        Left = 5
        Top = 55
        Width = 65
        Height = 14
        Caption = 'Custo Anual'
        Visible = False
      end
      object Label6: TLabel
        Left = 5
        Top = 7
        Width = 255
        Height = 14
        Caption = 'Custo Anual Aplicativo/Yeraly Application Cost '
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 4
        Top = 70
        Width = 497
        Height = 227
        Lines.Strings = (
          'Considerar todos os Custos de Tecnologia '
          'envolvidos na Aplica'#39#39'c'#227'o :'
          '- Licen'#231'as de uso'
          '- Manuten'#231#227'o Fornecedores'
          '- Manuten'#231#227'o Interna'
          '- Rede'
          ''
          'O C usto ser'#225' rateado linearmente com '
          'todas as Atividades que usam '
          'o Aplicativo.')
        TabOrder = 0
        Visible = False
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 26
        Width = 149
        Height = 22
        DataField = 'IDF_CUSTO_TEC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
    Width = 513
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 513
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 513
      end>
    inherited StandardToolBar: TToolBar
      Width = 500
    end
    inherited ToolBar1: TToolBar
      Width = 500
      inherited ToolButton6: TToolButton
        OnClick = sp_printClick
      end
    end
  end
  inherited ToolbarImages: TImageList
    Left = 364
    Top = 455
  end
  inherited fnt: TFontDialog
    Left = 250
    Top = 450
  end
  inherited PopupMenu1: TPopupMenu
    Left = 277
    Top = 455
  end
  inherited OD: TOpenDialog
    Left = 334
    Top = 454
  end
  inherited MainMenu1: TMainMenu
    Left = 308
    Top = 451
  end
end
