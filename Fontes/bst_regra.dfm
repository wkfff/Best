inherited frm_regra: Tfrm_regra
  Left = 251
  Top = 126
  Caption = 'Regra de Neg'#243'cio'
  ClientHeight = 443
  ClientWidth = 705
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Left = 626
  end
  inherited Panel3: TPanel
    Width = 705
    Visible = False
    inherited sp2: TSpeedButton
      Left = 634
      Width = 120
      Caption = 'Confirmar'
    end
    inherited sp_print: TSpeedButton
      OnClick = sp_printClick
    end
    inherited sp_insert: TSpeedButton
      Width = 123
    end
    inherited SP_X: TSpeedButton
      Left = 534
    end
    inherited spb_del: TSpeedButton
      Left = 160
      Width = 81
      Caption = 'Eliminar   '
    end
    inherited DBEdit6: TDBEdit
      Left = 248
      Width = 281
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 704
  end
  inherited pgcp: TPageControl
    Width = 705
    Height = 394
    ActivePage = tb_dados
    inherited tb_geral: TTabSheet
      inherited docext: TSpeedButton
        Left = 18
        Top = 341
        Width = 168
      end
      object Label5: TLabel [1]
        Left = 17
        Top = -1
        Width = 69
        Height = 14
        Caption = 'Nome/Name'
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel [2]
        Left = 17
        Top = 38
        Width = 100
        Height = 14
        Caption = 'Objetivo/Objective'
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel [3]
        Left = 17
        Top = 103
        Width = 121
        Height = 14
        Caption = 'Descri'#231#227'o/Description'
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel [4]
        Left = 17
        Top = 264
        Width = 99
        Height = 14
        Caption = 'Exce'#231#227'o/Exception'
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      inherited DBEdit12: TDBEdit
        Left = 189
        Top = 341
        Width = 281
        TabOrder = 6
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 489
        Top = 0
        Width = 249
        Height = 65
        Caption = 'Tipo de Implementa'#231#227'o/Implementation'
        DataField = 'IDF_TIPO_IMPLEMENT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'Automatizado/Automatic'
          'Manual')
        ParentFont = False
        TabOrder = 0
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 488
        Top = 70
        Width = 249
        Height = 65
        Caption = 'Formaliza'#231#227'o/Formal'
        DataField = 'IDF_FORMALIZACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'Sim/Yes'
          'N'#227'o/No')
        ParentFont = False
        TabOrder = 1
        Values.Strings = (
          'S'
          'N')
      end
      object Dbmemo2: TDBRichEdit
        Left = 17
        Top = 53
        Width = 455
        Height = 45
        DataField = 'IDF_OBJETIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Dbmemo1: TDBRichEdit
        Left = 17
        Top = 123
        Width = 455
        Height = 134
        DataField = 'IDF_DESCRICAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object Dbmemo3: TDBRichEdit
        Left = 17
        Top = 283
        Width = 455
        Height = 51
        DataField = 'IDF_REGRA_EXCECAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 17
        Top = 16
        Width = 455
        Height = 22
        DataField = 'IDF_DESIGNACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    inherited Tb_atv: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 0
        Width = 295
        Height = 14
        Caption = 'Atividades Onde a Regra '#233' Aplicada/Acivities Involved'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      inherited lv: TListView
        Left = 14
        Top = 18
        Height = 343
        Columns = <
          item
            Caption = 'Atividade'
            Width = 500
          end
          item
            Caption = 'Envolvimento Ator'
            Width = 0
          end>
        HotTrack = True
      end
    end
    inherited tb_dados: TTabSheet
      OnContextPopup = tb_dadosContextPopup
      inherited sLista: TSpeedButton
        Left = 617
        Top = 25
        Width = 73
        Height = 25
        Caption = 'Lista       '
        Glyph.Data = {00000000}
      end
      inherited dbg_dg1: TDBGrid
        Left = 616
        Top = 224
        Width = 588
        Height = 129
      end
      inherited db_desc: TDBMemo
        Top = 224
        Height = 137
      end
      inherited dbg_dg: TDBGrid
        Width = 593
        TitleFont.Name = 'Calibri'
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Nome'
            Width = 302
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
            Title.Caption = 'Tipo'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TYPE_QUALIFIERS'
            Title.Caption = 'Tamanho'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DEFAULT_VALUE'
            Title.Caption = 'Padr'#227'o'
            Width = 107
            Visible = True
          end>
      end
      inherited gb_dom: TGroupBox
        Height = 145
        inherited db_dom: TDBMemo
          Top = 16
          Height = 121
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
    Width = 705
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 705
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 705
      end>
    inherited StandardToolBar: TToolBar
      Width = 692
    end
    inherited ToolBar1: TToolBar
      Width = 692
      inherited ToolButton6: TToolButton
        Visible = True
        OnClick = sp_printClick
      end
    end
  end
  inherited ToolbarImages: TImageList
    Left = 704
    Top = 521
  end
  inherited fnt: TFontDialog
    Left = 730
    Top = 514
  end
  inherited PopupMenu1: TPopupMenu
    Left = 679
    Top = 519
  end
  inherited OD: TOpenDialog
    Left = 606
    Top = 518
  end
  inherited MainMenu1: TMainMenu
    Left = 644
    Top = 515
  end
end
