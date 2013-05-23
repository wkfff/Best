inherited frm_ap: Tfrm_ap
  Left = 212
  Top = 126
  Caption = 'Atividade'
  ClientHeight = 428
  ClientWidth = 782
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Top = 512
  end
  inherited Panel3: TPanel
    Width = 782
    Color = clBtnFace
    Visible = False
    inherited sp2: TSpeedButton
      Left = 586
      Top = 4
    end
    inherited sp_print: TSpeedButton
      OnClick = sp_printClick
    end
    object sb1: TSpeedButton [5]
      Left = 664
      Top = 8
      Width = 23
      Height = 22
      Flat = True
      Visible = False
      OnClick = sb1Click
    end
    inherited DBEdit6: TDBEdit
      Width = 233
      Color = clBtnFace
      Font.Name = 'Calibri'
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 111
    Top = 547
    OnClick = BitBtn1Click
  end
  inherited pgcp: TPageControl
    Top = 51
    Width = 782
    Height = 378
    ActivePage = TabSheet6
    OnDrawTab = pgcpDrawTab
    inherited tb_geral: TTabSheet
      Caption = 'Geral'
      Font.Name = 'Calibri'
      object Label18: TLabel [0]
        Left = 5
        Top = 20
        Width = 24
        Height = 14
        Caption = 'WBS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel [1]
        Left = 4
        Top = 58
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
      object Label1: TLabel [2]
        Left = 94
        Top = 20
        Width = 101
        Height = 14
        Caption = 'Designa'#231#227'o/Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object spp1: TSpeedButton [3]
        Tag = 1
        Left = 488
        Top = 307
        Width = 281
        Height = 23
        Caption = 'Exibir Objetivo do use Case/Show  Use case Obejctive'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        OnClick = spp1Click
      end
      object l7: TLabel [4]
        Left = 328
        Top = 58
        Width = 296
        Height = 15
        AutoSize = False
        Caption = 'Objetivo do use Case/Use Case Objective'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      inherited docext: TSpeedButton
        Left = 6
        Top = 286
        Width = 160
        Caption = 'Documento externo'
      end
      object DBEdit1: TDBEdit [6]
        Left = 5
        Top = 35
        Width = 81
        Height = 22
        DataField = 'IDF_WBS_CODE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBRichEdit1: TDBRichEdit [7]
        Left = 4
        Top = 71
        Width = 761
        Height = 206
        BevelInner = bvLowered
        BevelOuter = bvRaised
        BevelKind = bkSoft
        BorderStyle = bsNone
        DataField = 'IDF_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssHorizontal
        TabOrder = 1
        OnClick = DBRichEdit1Click
      end
      object DBEdit2: TDBEdit [8]
        Left = 95
        Top = 35
        Width = 386
        Height = 22
        DataField = 'IDF_DESIGNACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBRG: TDBRadioGroup [9]
        Left = 484
        Top = 7
        Width = 141
        Height = 49
        Caption = 'Tipo de Atividade'
        DataField = 'IDF_TIPO_ATIV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'Atividade'
          'Caso de Uso ')
        ParentFont = False
        TabOrder = 3
        Values.Strings = (
          'AP'
          'UC')
        OnClick = DBRGClick
      end
      object DBRG1: TDBRadioGroup [10]
        Left = 630
        Top = 7
        Width = 137
        Height = 49
        Caption = 'Atividade Procedural/Task'
        DataField = 'IDF_ATIVIDADE_SUMARIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'N'#227'o'
          'Sim')
        ParentFont = False
        TabOrder = 4
        Values.Strings = (
          'N'
          'S')
        OnClick = DBRGClick
      end
      object dbl: TDBRichEdit [11]
        Left = 326
        Top = 72
        Width = 343
        Height = 206
        DataField = 'IDF_OBJETIVO_UC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 5
        Visible = False
        OnClick = dblClick
      end
      inherited DBEdit12: TDBEdit
        Left = 171
        Top = 286
        Width = 598
        TabOrder = 6
      end
    end
    object tb_evento: TTabSheet [1]
      Caption = 'Eventos de Neg'#243'cio'
      ImageIndex = 10
      object Label17: TLabel
        Left = 4
        Top = 4
        Width = 321
        Height = 14
        Caption = 'Eventos que Disparam Atividade/Events that trigger Activity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object TR_EN: TTreeView
        Left = 2
        Top = 21
        Width = 761
        Height = 297
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        ShowRoot = False
        TabOrder = 0
        OnDblClick = TR_ENDblClick
      end
    end
    inherited Tb_atv: TTabSheet
      Caption = 'Atividades onde Aplicada'
      Font.Height = -9
      inherited trv_atv: TTreeView
        Left = 258
        Top = 160
      end
      inherited lv: TListView
        Left = 3
        Top = 12
        Width = 761
        Height = 306
        Columns = <
          item
            Caption = 'Atividade/Activity'
            Width = 300
          end
          item
            Caption = 'Envolvimento Ator/Actor'
            Width = 200
          end>
      end
    end
    object TabSheet12: TTabSheet [3]
      Caption = 'M'#233'trica'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 437
        Top = 2
        Width = 269
        Height = 127
        Caption = 'Volumes de Processamento (Anuais)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object SpeedButton9: TSpeedButton
          Left = 132
          Top = 91
          Width = 60
          Height = 25
          Caption = 'Pico'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton9Click
        end
        object SpeedButton11: TSpeedButton
          Left = 132
          Top = 64
          Width = 60
          Height = 25
          Caption = 'Regular'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton11Click
        end
        object Label4: TLabel
          Left = 132
          Top = 42
          Width = 41
          Height = 14
          Caption = 'M'#237'nimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 9
          Top = 64
          Width = 100
          Height = 14
          Caption = 'Per'#237'odo referencia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label15: TLabel
          Left = 9
          Top = 18
          Width = 43
          Height = 14
          Caption = 'Looping'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 9
          Top = 84
          Width = 87
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object DBEdit3: TDBEdit
          Left = 9
          Top = 35
          Width = 65
          Height = 22
          DataField = 'IDF_VOLUME_LOOPING'
          TabOrder = 1
          OnExit = DBEdit3Exit
        end
        object DBEdit13: TDBEdit
          Left = 197
          Top = 63
          Width = 65
          Height = 22
          DataField = 'IDF_V_REGULAR'
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 197
          Top = 33
          Width = 65
          Height = 22
          DataField = 'IDF_V_MINIMO'
          TabOrder = 3
        end
        object DBEdit15: TDBEdit
          Left = 197
          Top = 94
          Width = 65
          Height = 22
          DataField = 'IDF_V_PICO'
          TabOrder = 4
        end
      end
      object GroupBox4: TGroupBox
        Left = 218
        Top = 2
        Width = 217
        Height = 313
        Caption = 'Tempos de Processamento (minutos)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label7: TLabel
          Left = 10
          Top = 24
          Width = 83
          Height = 42
          Caption = 'Tempo de Processamento Unit'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label8: TLabel
          Left = 105
          Top = 23
          Width = 84
          Height = 42
          Caption = 'Tempo de processamento Inativo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label9: TLabel
          Left = 42
          Top = 354
          Width = 108
          Height = 16
          Caption = 'Unidade de Tempo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label10: TLabel
          Left = 10
          Top = 94
          Width = 116
          Height = 14
          Caption = 'Causa da Inatividade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 12
          Top = 198
          Width = 56
          Height = 14
          Caption = 'Lead Time'
          Visible = False
        end
        object Label3: TLabel
          Left = 12
          Top = 233
          Width = 42
          Height = 14
          Caption = 'Volume'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label16: TLabel
          Left = 12
          Top = 269
          Width = 28
          Height = 14
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Edit4: TEdit
          Left = 98
          Top = 360
          Width = 115
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object DBEdit16: TDBEdit
          Left = 10
          Top = 72
          Width = 73
          Height = 22
          DataField = 'IDF_DURATION_TPU'
          TabOrder = 1
          OnExit = DBEdit16Exit
        end
        object DBEdit17: TDBEdit
          Left = 105
          Top = 74
          Width = 73
          Height = 22
          DataField = 'IDF_TEMPO_INATIVO_TPI'
          TabOrder = 2
          OnExit = DBEdit17Exit
        end
        object DBRichEdit6: TDBRichEdit
          Left = 10
          Top = 107
          Width = 169
          Height = 90
          DataField = 'IDF_CAUSA_INATIVIDADE'
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object Edit2: TEdit
          Left = 12
          Top = 211
          Width = 121
          Height = 22
          ParentColor = True
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object Edit3: TEdit
          Left = 12
          Top = 247
          Width = 121
          Height = 22
          ParentColor = True
          ReadOnly = True
          TabOrder = 5
          Visible = False
        end
        object Edit5: TEdit
          Left = 12
          Top = 282
          Width = 121
          Height = 22
          ParentColor = True
          ReadOnly = True
          TabOrder = 6
          Visible = False
        end
      end
      object DBRichEdit7: TDBRichEdit
        Left = 439
        Top = 129
        Width = 163
        Height = 89
        DataField = 'IDF_VOLUME'
        ScrollBars = ssVertical
        TabOrder = 2
        Visible = False
      end
      object DBRichEdit8: TDBRichEdit
        Left = 447
        Top = 146
        Width = 163
        Height = 89
        DataField = 'IDF_VOLUME_PICO'
        ScrollBars = ssVertical
        TabOrder = 3
        Visible = False
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 2
        Top = 218
        Width = 215
        Height = 97
        Caption = 'Utilidade'
        DataField = 'IDF_VALOR_AGREGADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'Valor Agregado - Transforma'#231#227'o'
          'Valor Agregado - Controle'
          'Sem Valor Agregado - Descart'#225'vel'
          'Sem Valor Agregado - Obrigat'#243'rio')
        ParentFont = False
        TabOrder = 4
        Values.Strings = (
          'RUT'
          'RUC'
          'NUD'
          'NUO')
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 92
        Width = 215
        Height = 105
        Caption = 'Custos Rateados'
        TabOrder = 5
        object Label25: TLabel
          Left = 2
          Top = 23
          Width = 93
          Height = 14
          Caption = 'Custo Tecnologia'
        end
        object Label26: TLabel
          Left = 2
          Top = 49
          Width = 84
          Height = 14
          Caption = 'Meio Ambiente'
        end
        object DBEdit7: TDBEdit
          Left = 111
          Top = 45
          Width = 73
          Height = 22
          DataField = 'IDF_CUSTO_GERAL'
          TabOrder = 0
          OnExit = DBEdit16Exit
        end
        object DBEdit5: TDBEdit
          Left = 111
          Top = 19
          Width = 73
          Height = 22
          DataField = 'IDF_CUSTO_TEC'
          ReadOnly = True
          TabOrder = 1
          OnExit = DBEdit16Exit
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 2
        Width = 215
        Height = 77
        Caption = 'Custos Diretos'
        TabOrder = 6
        object Label22: TLabel
          Left = 2
          Top = 19
          Width = 54
          Height = 14
          Caption = 'Custo M.O'
        end
        object Label27: TLabel
          Left = 2
          Top = 45
          Width = 77
          Height = 14
          Caption = 'Custo M.Prima'
        end
        object DBEdit8: TDBEdit
          Left = 111
          Top = 15
          Width = 73
          Height = 22
          DataField = 'IDF_CUSTO_ANUAL'
          ReadOnly = True
          TabOrder = 0
          OnExit = DBEdit16Exit
        end
        object DBEdit10: TDBEdit
          Left = 111
          Top = 41
          Width = 73
          Height = 22
          DataField = 'IDF_CUSTO_MP'
          TabOrder = 1
          OnExit = DBEdit16Exit
        end
      end
    end
    object TabSheet4: TTabSheet [4]
      Caption = 'Regras de Neg'#243'cio'
      ImageIndex = 9
      object Label24: TLabel
        Left = 4
        Top = 4
        Width = 190
        Height = 14
        Caption = 'Regras de Neg'#243'cio/Business Rules'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object trv_regras: TTreeView
        Left = 2
        Top = 21
        Width = 761
        Height = 297
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
        OnDblClick = trv_regrasDblClick
      end
    end
    object TabSheet5: TTabSheet [5]
      Caption = 'Locais de Processamento'
      ImageIndex = 5
      object SpeedButton7: TSpeedButton
        Left = 458
        Top = 0
        Width = 101
        Height = 20
        Caption = 'Lista                 '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton8: TSpeedButton
        Left = 662
        Top = 0
        Width = 101
        Height = 20
        Hint = 'Eliminar registro'
        Caption = 'Excluir             '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Del_stdClick
      end
      object SpeedButton12: TSpeedButton
        Left = 560
        Top = 0
        Width = 101
        Height = 20
        Caption = 'Criar               '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object trv_local: TTreeView
        Left = 2
        Top = 21
        Width = 761
        Height = 297
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
        OnChange = trv_localChange
        OnDblClick = trv_localDblClick
      end
    end
    object TabSheet6: TTabSheet [6]
      Caption = 'Atores'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object SpeedButton2: TSpeedButton
        Left = 277
        Top = 3
        Width = 101
        Height = 20
        Caption = 'Lista                 '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton4Click
      end
      object SpeedButton3: TSpeedButton
        Left = 381
        Top = 3
        Width = 101
        Height = 20
        Caption = 'Criar               '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton14: TSpeedButton
        Left = 485
        Top = 3
        Width = 101
        Height = 20
        Hint = 'Eliminar registro'
        Caption = 'Excluir             '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton13Click
      end
      object Label21: TLabel
        Left = 458
        Top = 372
        Width = 83
        Height = 16
        Caption = 'Categoria Ator'
        Visible = False
      end
      object Label23: TLabel
        Left = 584
        Top = 408
        Width = 55
        Height = 16
        Caption = 'Categoria'
        Visible = False
      end
      object LV1: TListView
        Left = 2
        Top = 25
        Width = 583
        Height = 294
        Columns = <
          item
            Caption = 'Atividade/Activity'
            Width = 300
          end
          item
            Caption = 'Envolvimento Ator/Actor Involvement'
            Width = 200
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 4
        ViewStyle = vsReport
        OnDblClick = LV1DblClick
      end
      object trv_ator: TTreeView
        Left = 532
        Top = 268
        Width = 407
        Height = 305
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Indent = 19
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
        Visible = False
        OnChange = trv_atorChange
        OnDblClick = trv_atorDblClick
      end
      object cmb_cat: TComboBox
        Left = 470
        Top = 384
        Width = 145
        Height = 24
        ItemHeight = 16
        TabOrder = 1
        Visible = False
        Items.Strings = (
          'Respons'#225'vel'
          'Alternativo'
          'Participante')
      end
      object trv_cat: TTreeView
        Left = 662
        Top = 388
        Width = 171
        Height = 305
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Indent = 19
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 2
        Visible = False
        OnChange = trv_atorChange
        OnDblClick = trv_atorDblClick
      end
      object rdg_cat: TRadioGroup
        Left = 589
        Top = 30
        Width = 185
        Height = 105
        Caption = 'Categoria Ator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Respons'#225'vel/Responsible'
          'Alternativo/Altenate'
          'Participante/Participant')
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet8: TTabSheet [7]
      Caption = 'Mecanismos/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ImageIndex = 7
      ParentFont = False
      object SpeedButton1: TSpeedButton
        Left = 460
        Top = 2
        Width = 101
        Height = 20
        Caption = 'Lista                 '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton10Click
      end
      object SpeedButton4: TSpeedButton
        Left = 563
        Top = 2
        Width = 101
        Height = 20
        Caption = 'Criar               '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton5Click
      end
      object SpeedButton13: TSpeedButton
        Left = 666
        Top = 2
        Width = 101
        Height = 20
        Hint = 'Eliminar registro'
        Caption = 'Excluir             '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton6Click
      end
      object trv_mec: TTreeView
        Left = 0
        Top = 23
        Width = 769
        Height = 296
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
        OnChange = trv_mecChange
        OnDblClick = trv_mecDblClick
      end
    end
    object TabSheet2: TTabSheet [8]
      Caption = 'Requerimentos TI'
      ImageIndex = 8
      object Label2: TLabel
        Left = 3
        Top = 4
        Width = 174
        Height = 21
        AutoSize = False
        Caption = 'Objetivo do UC/UC Objective'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label12: TLabel
        Left = 3
        Top = 337
        Width = 101
        Height = 16
        Caption = 'Regra de neg'#243'cio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label14: TLabel
        Left = 394
        Top = 337
        Width = 105
        Height = 16
        Caption = 'Produtos Gerados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object sp6: TSpeedButton
        Left = 177
        Top = 0
        Width = 101
        Height = 22
        Caption = 'Tela/Form        '
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
          FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
          FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
          FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C880733777777777733700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sp6Click
      end
      object dbg_rn: TDBGrid
        Left = 3
        Top = 353
        Width = 384
        Height = 42
        Options = [dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        Visible = False
        OnDblClick = dbg_rnDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Visible = True
          end>
      end
      object dbg_pg: TDBGrid
        Left = 393
        Top = 353
        Width = 393
        Height = 42
        Options = [dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Requerimentos Funcionais'
            Width = 319
            Visible = True
          end>
      end
      object DBEdit4: TDBEdit
        Left = 280
        Top = 0
        Width = 503
        Height = 22
        BevelOuter = bvNone
        DataField = 'IDF_TELADIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 250
        ParentFont = False
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 201
        Width = 793
        Height = 200
        ParentColor = True
        TabOrder = 4
        object Label11: TLabel
          Left = 4
          Top = 4
          Width = 67
          Height = 15
          Caption = 'Alternativos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label28: TLabel
          Left = 395
          Top = 5
          Width = 116
          Height = 14
          Caption = 'Descri'#231#227'o Alternativo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object sp_evento: TSpeedButton
          Left = 157
          Top = 0
          Width = 105
          Height = 22
          Caption = 'Lista Eventos'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
            FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
            FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
            FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
            FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
            FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
            C880733777777777733700000000000000007777777777777777333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          Visible = False
          OnClick = sp_eventoClick
        end
        object sp_alt: TSpeedButton
          Left = 264
          Top = 0
          Width = 117
          Height = 22
          Caption = 'Lista Alternativos  '
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
          Visible = False
          OnClick = sp_altClick
        end
        object dbg_ader: TDBGrid
          Left = 4
          Top = 20
          Width = 781
          Height = 93
          FixedColor = 16380658
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
          Visible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'AD_FORNECEDOR'
              Title.Caption = 'Fornecedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AD_AP_AVAL'
              Title.Caption = 'Avalia'#231#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AD_AP_ADER'
              Title.Caption = 'Ader.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end>
        end
        object dbg_ap: TDBGrid
          Left = 4
          Top = 20
          Width = 384
          Height = 93
          FixedColor = 16380658
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
          Visible = False
          OnCellClick = dbg_apCellClick
          OnDblClick = dbg_apDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TI_SEQ'
              Title.Caption = 'Seq.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TI_REQ_AP'
              Title.Caption = 'Alternativo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 308
              Visible = True
            end>
        end
        object DBRichEdit4: TDBRichEdit
          Left = 394
          Top = 20
          Width = 392
          Height = 93
          ScrollBars = ssVertical
          TabOrder = 1
          Visible = False
          OnExit = DBRichEdit4Exit
        end
      end
      object DBRichEdit2: TDBRichEdit
        Left = 3
        Top = 23
        Width = 784
        Height = 297
        DataField = 'IDF_OBJETIVO_UC'
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    inherited tb_dados: TTabSheet
      Caption = 'Dados'
      inherited sLista: TSpeedButton
        Left = 672
        Width = 101
        Height = 20
        Glyph.Data = {00000000}
      end
      inherited dbg_dg1: TDBGrid
        Left = 503
      end
      inherited dbg_dg: TDBGrid
        FixedColor = clBtnFace
        TitleFont.Name = 'Calibri'
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Nome/Name'
            Width = 285
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DATA_TYPE'
            PickList.Strings = (
              'C'
              'I'
              'N'
              'M'
              'D'
              'T')
            Title.Caption = 'Tipo/Type'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TYPE_QUALIFIERS'
            Title.Caption = 'Tamanho/Size'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DEFAULT_VALUE'
            Title.Caption = 'Default'
            Width = 120
            Visible = True
          end>
      end
    end
    object tb_dg: TTabSheet [10]
      Caption = 'Fluxos'
      ImageIndex = 11
      object Label19: TLabel
        Left = 1
        Top = 4
        Width = 191
        Height = 14
        Caption = 'Fluxos Entrando/Input data Groups'
      end
      object Label20: TLabel
        Left = 385
        Top = 4
        Width = 189
        Height = 14
        Caption = 'Fluxos Saindo/Output Data Groups'
      end
      object trv_in: TTreeView
        Left = 0
        Top = 22
        Width = 380
        Height = 293
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        ShowRoot = False
        TabOrder = 0
        OnDblClick = trv_atvDblClick
      end
      object trv_out: TTreeView
        Left = 384
        Top = 22
        Width = 380
        Height = 293
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        ShowRoot = False
        TabOrder = 1
        OnDblClick = trv_outDblClick
      end
    end
    inherited tb_ger: TTabSheet
      Caption = 'Gerenciamento'
      inherited gb: TGroupBox
        Height = 75
        Caption = 'Gerenciamento/Control'
        inherited lb6: TLabel
          Left = 226
        end
        inherited db_versao: TDBEdit
          Height = 23
          Font.Name = 'Calibri'
        end
        inherited db_resp: TDBEdit
          Left = 227
        end
      end
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 782
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 782
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 782
      end>
    inherited StandardToolBar: TToolBar
      Width = 769
    end
    inherited ToolBar1: TToolBar
      Width = 769
      inherited ToolButton6: TToolButton
        Visible = True
      end
    end
  end
  inherited ToolbarImages: TImageList
    Left = 76
    Top = 479
  end
  inherited fnt: TFontDialog
    Left = 23
    Top = 475
  end
  inherited PopupMenu1: TPopupMenu
    Left = 135
    Top = 479
  end
  inherited OD: TOpenDialog
    Left = 102
    Top = 478
  end
  inherited MainMenu1: TMainMenu
    Left = 52
    Top = 475
  end
end
