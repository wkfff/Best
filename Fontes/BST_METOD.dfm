inherited FRM_METOD: TFRM_METOD
  Left = 323
  Top = 173
  Caption = 'M'#233'todos da Classe'
  ClientHeight = 444
  ClientWidth = 704
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 14
  inherited LTot: TLabel
    Top = 432
  end
  object l_MET_NOME: TLabel [1]
    Left = 270
    Top = 160
    Width = 32
    Height = 14
    Caption = 'Nome'
  end
  object l_MET_COMENT: TLabel [2]
    Left = 270
    Top = 120
    Width = 44
    Height = 14
    Caption = 'Coment.'
  end
  object l_LCK: TLabel [3]
    Left = 678
    Top = 134
    Width = 3
    Height = 14
  end
  object l_IDG_ID: TLabel [4]
    Left = 678
    Top = 93
    Width = 3
    Height = 14
  end
  object l_IDF_VISIBLE: TLabel [5]
    Left = 678
    Top = 52
    Width = 3
    Height = 14
  end
  object l_IDF_OBJETIVO: TLabel [6]
    Left = 270
    Top = 79
    Width = 45
    Height = 14
    Caption = 'Objetivo'
  end
  object l_IDF_DESIGNACAO: TLabel [7]
    Left = 270
    Top = 35
    Width = 64
    Height = 14
    Caption = 'Designacao'
  end
  object l_IDF_DEL: TLabel [8]
    Left = 358
    Top = 298
    Width = 3
    Height = 14
  end
  object l_IDF_CAT: TLabel [9]
    Left = 526
    Top = 513
    Width = 52
    Height = 14
    Caption = 'Categoria'
    Visible = False
  end
  object Label1: TLabel [10]
    Left = 270
    Top = 200
    Width = 68
    Height = 14
    Caption = 'Visibilidade'
  end
  object Label2: TLabel [11]
    Left = 270
    Top = 240
    Width = 86
    Height = 14
    Caption = 'Tipo de M'#233'todo'
  end
  object Label3: TLabel [12]
    Left = 270
    Top = 280
    Width = 24
    Height = 14
    Caption = 'Tipo'
  end
  inherited lb: TListBox
    Height = 393
    TabOrder = 22
  end
  object MET_VISIBIL: TEdit [14]
    Left = 270
    Top = 216
    Width = 315
    Height = 22
    TabOrder = 21
  end
  object MET_NOME: TEdit [15]
    Left = 270
    Top = 176
    Width = 419
    Height = 22
    TabOrder = 20
  end
  object MET_COMENT: TEdit [16]
    Left = 270
    Top = 136
    Width = 419
    Height = 22
    TabOrder = 19
  end
  object LCK: TEdit [17]
    Left = 182
    Top = 502
    Width = 35
    Height = 22
    TabOrder = 18
    Visible = False
  end
  object IDG_ID: TEdit [18]
    Left = 350
    Top = 477
    Width = 43
    Height = 22
    TabOrder = 17
    Visible = False
  end
  object IDF_VISIBLE: TEdit [19]
    Left = 134
    Top = 524
    Width = 219
    Height = 22
    TabOrder = 16
    Visible = False
  end
  object IDF_TIPO_ATIVIDADE: TEdit [20]
    Left = 78
    Top = 458
    Width = 51
    Height = 22
    TabOrder = 15
    Visible = False
  end
  object IDF_TIPO: TEdit [21]
    Left = 270
    Top = 296
    Width = 315
    Height = 22
    TabOrder = 14
  end
  object IDF_RESPONSAVEL: TEdit [22]
    Left = 294
    Top = 472
    Width = 35
    Height = 22
    TabOrder = 13
    Visible = False
  end
  object IDF_OBJETIVO: TEdit [23]
    Left = 270
    Top = 95
    Width = 419
    Height = 22
    TabOrder = 12
  end
  object IDF_METTYPE: TEdit [24]
    Left = 270
    Top = 256
    Width = 315
    Height = 22
    TabOrder = 11
  end
  object IDF_METDIRECT: TEdit [25]
    Left = 566
    Top = 437
    Width = 121
    Height = 22
    TabOrder = 10
    Visible = False
  end
  object IDF_METBIND: TEdit [26]
    Left = 582
    Top = 484
    Width = 227
    Height = 22
    TabOrder = 9
    Visible = False
  end
  object IDF_DIRETORIO: TEdit [27]
    Left = 246
    Top = 460
    Width = 51
    Height = 22
    TabOrder = 8
    Visible = False
  end
  object IDF_DESIGNACAO: TEdit [28]
    Left = 270
    Top = 51
    Width = 419
    Height = 22
    TabOrder = 7
  end
  object IDF_DEL: TEdit [29]
    Left = 182
    Top = 466
    Width = 43
    Height = 22
    TabOrder = 6
    Visible = False
  end
  object IDF_CAT: TEdit [30]
    Left = 374
    Top = 505
    Width = 121
    Height = 22
    TabOrder = 5
    Visible = False
  end
  object IDF_SEQ: TEdit [31]
    Left = 6
    Top = 512
    Width = 99
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object CLASS_ID: TEdit [32]
    Left = 142
    Top = 463
    Width = 35
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object IDF_CODIGO: TEdit [33]
    Left = 30
    Top = 486
    Width = 35
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object PRJ_ID: TEdit [34]
    Left = 30
    Top = 453
    Width = 51
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object CLI_ID: TEdit [35]
    Left = 6
    Top = 444
    Width = 27
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object rd_bin: TRadioGroup [36]
    Left = 792
    Top = 286
    Width = 161
    Height = 105
    Caption = 'Binding'
    TabOrder = 23
    Visible = False
    OnClick = RD_BINClick
  end
  object rd_dir: TRadioGroup [37]
    Left = 792
    Top = 170
    Width = 161
    Height = 113
    Caption = 'Diretivas'
    TabOrder = 24
    Visible = False
    OnClick = RD_DIRClick
  end
  object rd_mtipo: TRadioGroup [38]
    Left = 752
    Top = 104
    Width = 153
    Height = 257
    Caption = 'Tipos'
    TabOrder = 25
    Visible = False
    OnClick = RD_MTIPOClick
  end
  object rd_mvis: TRadioGroup [39]
    Left = 792
    Top = 48
    Width = 161
    Height = 121
    Caption = 'Visibilidade'
    TabOrder = 26
    Visible = False
    OnClick = RD_MVISClick
  end
  object GroupBox2: TGroupBox [40]
    Left = 272
    Top = 324
    Width = 225
    Height = 73
    Caption = 'Vers'#227'o'
    TabOrder = 27
    object d_IDF_VERSAO_DATA: TDateTimePicker
      Left = 6
      Top = 44
      Width = 94
      Height = 22
      Date = 38140.524316932900000000
      Time = 38140.524316932900000000
      TabOrder = 2
      OnCloseUp = DateClose
    end
    object IDF_VERSAO: TEdit
      Left = 6
      Top = 18
      Width = 73
      Height = 22
      TabOrder = 0
    end
    object IDF_VERSAO_DATA: TEdit
      Left = 6
      Top = 44
      Width = 75
      Height = 22
      TabOrder = 1
    end
  end
  object rd_timm: TRadioGroup [41]
    Left = 840
    Top = 399
    Width = 153
    Height = 81
    Caption = 'Tipo M'#233'todo'
    TabOrder = 28
    Visible = False
    OnClick = RD_TIMmClick
  end
  inherited CoolBar1: TCoolBar
    Width = 704
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 704
      end>
    inherited ToolBar1: TToolBar
      Width = 691
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 560
    Top = 152
  end
end
