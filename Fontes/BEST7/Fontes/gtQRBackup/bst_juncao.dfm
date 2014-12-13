inherited frm_juncao: Tfrm_juncao
  Left = 624
  Top = 213
  Caption = 'Jun'#231#227'o'
  ClientHeight = 323
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Top = 488
  end
  inherited Panel3: TPanel
    Width = 497
    Color = clBtnFace
    Visible = False
    inherited sp2: TSpeedButton
      Left = 449
      Top = 5
    end
    inherited SP_X: TSpeedButton
      Left = 694
    end
    inherited DBEdit6: TDBEdit
      Left = 278
      Width = 67
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 90
    Top = 490
    OnClick = BitBtn1Click
  end
  inherited pgcp: TPageControl
    Top = 49
    Width = 497
    Height = 274
    ActivePage = tb_geral
    inherited tb_geral: TTabSheet
      Font.Name = 'Calibri'
      inherited docext: TSpeedButton
        Top = 212
        Caption = 'Doc. externo'
        Visible = False
      end
      object Label3: TLabel [1]
        Left = 6
        Top = 6
        Width = 32
        Height = 14
        Caption = 'Nome'
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [2]
        Left = 6
        Top = 50
        Width = 53
        Height = 14
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      inherited DBEdit12: TDBEdit
        Top = 212
        Width = 319
        DataField = ''
        TabOrder = 3
        Visible = False
      end
      object DBEdit2: TDBEdit
        Left = 6
        Top = 23
        Width = 369
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
      object dbrg: TDBRadioGroup
        Left = 385
        Top = 6
        Width = 98
        Height = 51
        Caption = 'L'#243'gica'
        DataField = 'IDF_LOGICA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Items.Strings = (
          'E'
          'OU')
        ParentFont = False
        TabOrder = 1
        Values.Strings = (
          'E'
          'O')
      end
      object DBRichEdit1: TDBRichEdit
        Left = 6
        Top = 70
        Width = 477
        Height = 137
        DataField = 'IDF_DESCRICAO'
        TabOrder = 2
      end
    end
    inherited Tb_atv: TTabSheet
      TabVisible = False
    end
    inherited tb_dados: TTabSheet
      TabVisible = False
    end
    object tab_perc: TTabSheet [3]
      Caption = 'Percentuais de Passagem'
      ImageIndex = 4
      object Label4: TLabel
        Left = 8
        Top = 4
        Width = 79
        Height = 14
        Caption = 'Para Atividade'
      end
      object trv_ativ: TTreeView
        Left = 8
        Top = 21
        Width = 419
        Height = 219
        Indent = 19
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
      end
    end
    inherited tb_ger: TTabSheet
      inherited gb: TGroupBox
        Left = 2
        inherited db_versao: TDBEdit
          Height = 23
          Font.Name = 'Calibri'
        end
      end
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 497
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 497
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Visible = False
        Width = 497
      end>
    inherited StandardToolBar: TToolBar
      Visible = False
    end
    inherited ToolBar1: TToolBar
      Width = 484
    end
  end
  inherited ToolbarImages: TImageList
    Left = 192
    Top = 489
  end
  inherited fnt: TFontDialog
    Left = 286
    Top = 486
  end
  inherited PopupMenu1: TPopupMenu
    Left = 225
    Top = 489
  end
  inherited OD: TOpenDialog
    Left = 254
    Top = 486
  end
  inherited MainMenu1: TMainMenu
    Left = 164
    Top = 491
  end
end
