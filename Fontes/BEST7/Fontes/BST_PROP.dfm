inherited FRM_PROP: TFRM_PROP
  Left = 453
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Propriedades da Classe'
  ClientHeight = 364
  ClientWidth = 671
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited LTot: TLabel
    Left = 4
    Top = 350
  end
  object l_PROP_DOMINIO: TLabel [1]
    Left = 483
    Top = 423
    Width = 47
    Height = 14
    Caption = 'Dominio'
    Visible = False
  end
  object l_PROP_DEFAULT: TLabel [2]
    Left = 391
    Top = 109
    Width = 41
    Height = 14
    Caption = 'Default'
  end
  object l_LCK: TLabel [3]
    Left = 479
    Top = 349
    Width = 3
    Height = 14
  end
  object l_IDG_ID: TLabel [4]
    Left = 503
    Top = 310
    Width = 3
    Height = 14
  end
  object l_IDF_VISIBLE: TLabel [5]
    Left = 503
    Top = 272
    Width = 3
    Height = 14
  end
  object l_IDF_VERSAO_DATA: TLabel [6]
    Left = 503
    Top = 234
    Width = 3
    Height = 14
  end
  object l_IDF_VERSAO: TLabel [7]
    Left = 503
    Top = 196
    Width = 3
    Height = 14
  end
  object l_IDF_TIPO_ATIVIDADE: TLabel [8]
    Left = 503
    Top = 157
    Width = 3
    Height = 14
  end
  object l_IDF_RESPONSAVEL: TLabel [9]
    Left = 503
    Top = 119
    Width = 3
    Height = 14
  end
  object l_IDF_OBJETIVO: TLabel [10]
    Left = 265
    Top = 65
    Width = 45
    Height = 14
    Caption = 'Objetivo'
  end
  object l_IDF_LISTA: TLabel [11]
    Left = 319
    Top = 459
    Width = 26
    Height = 14
    Caption = 'Lista'
    Visible = False
  end
  object l_IDF_DIRETORIO: TLabel [12]
    Left = 330
    Top = 349
    Width = 3
    Height = 14
  end
  object l_IDF_DESIGNACAO: TLabel [13]
    Left = 265
    Top = 27
    Width = 64
    Height = 14
    Caption = 'Designacao'
  end
  object l_IDF_DEL: TLabel [14]
    Left = 354
    Top = 272
    Width = 3
    Height = 14
  end
  object l_IDF_CAT: TLabel [15]
    Left = 610
    Top = 434
    Width = 52
    Height = 14
    Caption = 'Categoria'
    Visible = False
  end
  object l_IDF_SEQ: TLabel [16]
    Left = 354
    Top = 196
    Width = 3
    Height = 14
  end
  object l_CLASS_ID: TLabel [17]
    Left = 354
    Top = 157
    Width = 3
    Height = 14
  end
  object l_IDF_CODIGO: TLabel [18]
    Left = 338
    Top = 111
    Width = 19
    Height = 14
  end
  object l_PRJ_ID: TLabel [19]
    Left = 354
    Top = 81
    Width = 3
    Height = 14
  end
  object l_CLI_ID: TLabel [20]
    Left = 354
    Top = 43
    Width = 3
    Height = 14
  end
  object Label1: TLabel [21]
    Left = 272
    Top = 275
    Width = 32
    Height = 14
    Caption = 'Ver'#224'o'
    Visible = False
  end
  object Label2: TLabel [22]
    Left = 498
    Top = 54
    Width = 129
    Height = 42
    Caption = 
      'Escolher o Campo a ser listado na lista de Sele'#231#227'o (alfanum'#233'rico' +
      ')'
    WordWrap = True
  end
  object Label3: TLabel [23]
    Left = 265
    Top = 109
    Width = 24
    Height = 14
    Caption = 'Tipo'
  end
  inherited lb: TListBox
    Left = 4
    Top = 26
    TabOrder = 21
  end
  inherited CoolBar1: TCoolBar
    Width = 671
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 671
      end>
    inherited ToolBar1: TToolBar
      Width = 658
    end
  end
  object PROP_VISIBIL: TEdit [26]
    Left = 610
    Top = 365
    Width = 113
    Height = 22
    TabOrder = 19
    Visible = False
  end
  object PROP_TIPO: TEdit [27]
    Left = 265
    Top = 124
    Width = 112
    Height = 22
    TabOrder = 18
  end
  object PROP_DOMINIO: TEdit [28]
    Left = 416
    Top = 393
    Width = 113
    Height = 22
    TabOrder = 17
    Visible = False
  end
  object PROP_DEFAULT: TEdit [29]
    Left = 391
    Top = 124
    Width = 182
    Height = 22
    TabOrder = 16
  end
  object LCK: TEdit [30]
    Left = 170
    Top = 385
    Width = 25
    Height = 22
    TabOrder = 15
    Visible = False
  end
  object IDG_ID: TEdit [31]
    Left = 162
    Top = 436
    Width = 26
    Height = 22
    TabOrder = 14
    Visible = False
  end
  object IDF_VISIBLE: TEdit [32]
    Left = 567
    Top = 345
    Width = 25
    Height = 22
    TabOrder = 13
    Visible = False
  end
  object IDF_TIPO_ATIVIDADE: TEdit [33]
    Left = 140
    Top = 462
    Width = 113
    Height = 22
    TabOrder = 12
    Visible = False
  end
  object IDF_RESPONSAVEL: TEdit [34]
    Left = 469
    Top = 476
    Width = 112
    Height = 22
    TabOrder = 11
    Visible = False
  end
  object IDF_OBJETIVO: TEdit [35]
    Left = 265
    Top = 80
    Width = 204
    Height = 22
    TabOrder = 10
  end
  object IDF_LISTA: TEdit [36]
    Left = 364
    Top = 444
    Width = 25
    Height = 22
    TabOrder = 9
    Visible = False
  end
  object IDF_DIRETORIO: TEdit [37]
    Left = 103
    Top = 385
    Width = 32
    Height = 22
    TabOrder = 8
    Visible = False
  end
  object IDF_DESIGNACAO: TEdit [38]
    Left = 265
    Top = 42
    Width = 211
    Height = 22
    TabOrder = 7
  end
  object IDF_DEL: TEdit [39]
    Left = 103
    Top = 465
    Width = 32
    Height = 22
    TabOrder = 6
    Visible = False
  end
  object IDF_CAT: TEdit [40]
    Left = 610
    Top = 449
    Width = 113
    Height = 22
    TabOrder = 5
    Visible = False
  end
  object IDF_SEQ: TEdit [41]
    Left = 270
    Top = 330
    Width = 26
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object CLASS_ID: TEdit [42]
    Left = 103
    Top = 425
    Width = 32
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object IDF_CODIGO: TEdit [43]
    Left = 50
    Top = 379
    Width = 26
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object PRJ_ID: TEdit [44]
    Left = 43
    Top = 415
    Width = 40
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object CLI_ID: TEdit [45]
    Left = 35
    Top = 444
    Width = 26
    Height = 22
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object rg_vis: TRadioGroup [46]
    Left = 265
    Top = 152
    Width = 172
    Height = 61
    Caption = 'Visibilidade'
    TabOrder = 22
    OnClick = rg_visClick
  end
  object rd_tipo: TRadioGroup [47]
    Left = 366
    Top = 538
    Width = 173
    Height = 292
    Caption = 'Tipos'
    TabOrder = 23
    Visible = False
    OnClick = rd_tipoClick
  end
  object chk_lista: TCheckBox [48]
    Left = 498
    Top = 39
    Width = 123
    Height = 16
    Caption = 'Mostra na Lista'
    TabOrder = 24
    OnClick = chk_listaClick
  end
  object GroupBox1: TGroupBox [49]
    Left = 265
    Top = 216
    Width = 172
    Height = 75
    Caption = 'Vers'#227'o'
    TabOrder = 25
    object d_IDF_VERSAO_DATA: TDateTimePicker
      Left = 9
      Top = 45
      Width = 89
      Height = 21
      Date = 38140.524316932900000000
      Time = 38140.524316932900000000
      TabOrder = 1
      OnCloseUp = DateClose
    end
    object IDF_VERSAO_DATA: TEdit
      Left = 9
      Top = 45
      Width = 74
      Height = 22
      TabOrder = 0
    end
    object IDF_VERSAO: TEdit
      Left = 9
      Top = 20
      Width = 73
      Height = 22
      TabOrder = 2
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 280
    Top = 368
  end
  inherited ImageList1: TImageList
    Left = 388
    Top = 178
  end
  inherited ActionList1: TActionList
    Left = 420
    Top = 178
  end
end
