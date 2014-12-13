inherited frm_aplic: Tfrm_aplic
  Left = 628
  Top = 135
  Caption = 'Aplicativos'
  ClientHeight = 401
  ClientWidth = 409
  PixelsPerInch = 96
  TextHeight = 14
  inherited SpeedButton5: TSpeedButton
    Left = 706
  end
  inherited Panel3: TPanel
    Width = 409
    Color = clBtnFace
    Visible = False
    inherited sp_print: TSpeedButton
      OnClick = sp_printClick
    end
    inherited spb_del: TSpeedButton
      Left = 163
      Width = 59
      Visible = True
    end
    inherited DBEdit6: TDBEdit
      Left = 246
      Width = 291
    end
  end
  inherited BitBtn1: TBitBtn
    Left = 650
    Top = 521
  end
  inherited pgcp: TPageControl
    Top = 52
    Width = 409
    Height = 349
    inherited tb_geral: TTabSheet
      inherited docext: TSpeedButton
        Left = 18
        Top = 290
      end
      object Label1: TLabel [1]
        Left = 17
        Top = 1
        Width = 32
        Height = 14
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel [2]
        Left = 17
        Top = 47
        Width = 45
        Height = 14
        Caption = 'Objetivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [3]
        Left = 17
        Top = 163
        Width = 61
        Height = 14
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [4]
        Left = 17
        Top = 203
        Width = 125
        Height = 14
        Caption = 'Banco de dados Usado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel [5]
        Left = 17
        Top = 246
        Width = 98
        Height = 14
        Caption = 'Data Implanta'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      inherited DBEdit12: TDBEdit
        Left = 182
        Top = 291
        Width = 211
        TabOrder = 5
      end
      object dtp: TDateTimePicker
        Left = 17
        Top = 262
        Width = 99
        Height = 22
        Date = 38414.626578900500000000
        Time = 38414.626578900500000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnCloseUp = dtpCloseUp
      end
      object DBEdit1: TDBEdit
        Left = 17
        Top = 20
        Width = 374
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
      object DBEdit2: TDBEdit
        Left = 17
        Top = 179
        Width = 374
        Height = 22
        DataField = 'IDF_FORNECEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 17
        Top = 262
        Width = 80
        Height = 22
        DataField = 'IDF_IMPLANTACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 17
        Top = 222
        Width = 374
        Height = 22
        DataField = 'IDF_BD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBRichEdit
        Left = 16
        Top = 60
        Width = 376
        Height = 99
        BevelInner = bvLowered
        BevelOuter = bvRaised
        BevelKind = bkSoft
        BorderStyle = bsNone
        DataField = 'IDF_OBJETIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssHorizontal
        TabOrder = 6
      end
    end
    inherited Tb_atv: TTabSheet
      TabVisible = False
    end
    object TabSheet2: TTabSheet [2]
      Caption = 'Mecanismos'
      ImageIndex = 5
      object trv_mec: TTreeView
        Left = 7
        Top = 8
        Width = 386
        Height = 193
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        ReadOnly = True
        ShowLines = False
        TabOrder = 0
        OnDblClick = trv_mecDblClick
      end
    end
    inherited tb_dados: TTabSheet
      TabVisible = False
    end
    object TabSheet1: TTabSheet [4]
      Caption = 'M'#233'trica'
      ImageIndex = 4
      object Label6: TLabel
        Left = 12
        Top = 4
        Width = 187
        Height = 14
        Caption = 'Custo Aquisi'#231#227'o/Desenvolvimento'
      end
      object Label7: TLabel
        Left = 12
        Top = 43
        Width = 153
        Height = 14
        Caption = 'Custo Anual de Manuten'#231#227'o'
      end
      object Label8: TLabel
        Left = 12
        Top = 83
        Width = 75
        Height = 14
        Caption = 'Outros Custos'
      end
      object DBEdit8: TDBEdit
        Left = 12
        Top = 18
        Width = 147
        Height = 22
        DataField = 'IDF_CUSTO_LIC'
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 12
        Top = 58
        Width = 147
        Height = 22
        DataField = 'IDF_CUSTO_MANUT'
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 12
        Top = 99
        Width = 147
        Height = 22
        DataField = 'IDF_CUSTO_OUTROS'
        TabOrder = 2
      end
    end
    inherited tb_ger: TTabSheet
      inherited gb: TGroupBox
        inherited dtp_data: TDateTimePicker
          ParentFont = False
        end
        inherited db_data: TDBEdit
          ParentFont = False
        end
        inherited db_versao: TDBEdit
          Height = 23
          Font.Name = 'Calibri'
        end
        inherited db_resp: TDBEdit
          ParentFont = False
        end
      end
    end
  end
  inherited CoolBar1: TCoolBar
    Width = 409
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 409
      end
      item
        Control = StandardToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 409
      end>
    inherited StandardToolBar: TToolBar
      Width = 396
    end
    inherited ToolBar1: TToolBar
      Width = 396
      inherited ToolButton6: TToolButton
        OnClick = sp_printClick
      end
    end
  end
  inherited ToolbarImages: TImageList
    Left = 160
    Top = 513
  end
  inherited fnt: TFontDialog
    Left = 286
    Top = 510
  end
  inherited PopupMenu1: TPopupMenu
    Top = 513
  end
  inherited OD: TOpenDialog
    Left = 252
    Top = 514
  end
  inherited MainMenu1: TMainMenu
    Left = 188
    Top = 515
  end
end
