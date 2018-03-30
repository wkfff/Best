inherited frm_de: Tfrm_de
  Left = 477
  Top = 203
  Caption = 'Elemento de Dado'
  ClientHeight = 360
  ClientWidth = 650
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel3: TPanel
    Width = 650
    Visible = False
    inherited sp2: TSpeedButton
      Left = 683
    end
    inherited sp_print: TSpeedButton
      OnClick = sp_printClick
    end
    inherited sp_insert: TSpeedButton
      Width = 101
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 2
    Top = 377
    OnClick = BitBtn1Click
  end
  inherited pgcp: TPageControl
    Width = 650
    Height = 311
    inherited tb_geral: TTabSheet
      inherited docext: TSpeedButton
        Left = 10
        Top = 240
        Visible = False
      end
      object Label2: TLabel [1]
        Left = 10
        Top = 129
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
      object Label3: TLabel [2]
        Left = 354
        Top = 129
        Width = 46
        Height = 14
        Caption = 'Dom'#237'nio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object dbg_de: TDBGrid [3]
        Left = 10
        Top = 4
        Width = 631
        Height = 120
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        OnKeyDown = dbg_deKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DATA_TYPE'
            PickList.Strings = (
              'C'
              'D'
              'I'
              'M'
              'N'
              'T')
            Title.Caption = 'Tipo'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TYPE_QUALIFIERS'
            Title.Caption = 'Tamanho'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_PK'
            Title.Caption = 'PK'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DEFAULT_VALUE'
            Title.Caption = 'Valor Default'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_VISIBLE'
            PickList.Strings = (
              'S'
              'N')
            Title.Caption = 'Mostrar'
            Visible = True
          end>
      end
      inherited DBEdit12: TDBEdit
        Left = 176
        Top = 240
        Width = 465
        DataField = ''
        TabOrder = 3
        Visible = False
      end
      object dbg: TDBGrid
        Left = 788
        Top = 291
        Width = 555
        Height = 149
        FixedColor = 13828050
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        Visible = False
        OnKeyDown = dbg_dgKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Title.Caption = 'Nome'
            Title.Color = clBlue
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DATA_TYPE'
            Title.Caption = 'Tipo'
            Title.Color = clBlue
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TYPE_QUALIFIERS'
            Title.Caption = 'Tamanho'
            Title.Color = clBlue
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DEFAULT_VALUE'
            Title.Caption = 'Valor default'
            Title.Color = clBlue
            Width = 148
            Visible = True
          end>
      end
      object db_descricao: TDBMemo
        Left = 10
        Top = 145
        Width = 335
        Height = 89
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object db_dominio: TDBMemo
        Left = 352
        Top = 145
        Width = 289
        Height = 89
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    inherited Tb_atv: TTabSheet
      inherited lv: TListView
        Left = 0
        Width = 513
        Height = 249
      end
    end
    inherited tb_dados: TTabSheet
      inherited lb1: TLabel
        Top = 9
      end
      inherited sLista: TSpeedButton
        Left = 673
        Height = 25
        Glyph.Data = {00000000}
      end
      inherited db_desc: TDBMemo
        Width = 305
      end
      inherited dbg_dg: TDBGrid
        Top = 25
        Width = 633
        Height = 182
        FixedColor = clBtnFace
        TitleFont.Name = 'Calibri'
        Columns = <
          item
            Expanded = False
            FieldName = 'IDF_DESIGNACAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Title.Caption = 'Nome'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DATA_TYPE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Title.Caption = 'Tipo'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_TYPE_QUALIFIERS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Title.Caption = 'Tamanho'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDF_DEFAULT_VALUE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Title.Caption = 'Valor default'
            Width = 148
            Visible = True
          end>
      end
      inherited gb_dom: TGroupBox
        Left = 320
      end
    end
    inherited tb_ger: TTabSheet
      inherited gb: TGroupBox
        inherited db_versao: TDBEdit
          Height = 22
          Font.Height = -12
          Font.Name = 'Calibri'
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Uso do Elemento de Dado'
      ImageIndex = 4
      object Label1: TLabel
        Left = 9
        Top = 8
        Width = 142
        Height = 14
        Caption = 'Uso do Elemento de Dado'
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 25
        Width = 630
        Height = 209
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 650
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 650
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 650
      end>
    inherited StandardToolBar: TToolBar
      Width = 637
    end
    inherited ToolBar1: TToolBar
      Width = 637
      inherited ToolButton2: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        OnClick = sp_printClick
      end
      inherited ToolButton7: TToolButton
        Visible = True
      end
    end
  end
  object DBEdit1: TDBEdit [5]
    Left = 8
    Top = 416
    Width = 265
    Height = 22
    DataField = 'IDF_DESIGNACAO'
    TabOrder = 4
    Visible = False
  end
  object DBEdit2: TDBEdit [6]
    Left = 8
    Top = 440
    Width = 65
    Height = 22
    TabOrder = 5
    Visible = False
  end
  inherited PopupMenu1: TPopupMenu
    Left = 527
    Top = 265
  end
end
