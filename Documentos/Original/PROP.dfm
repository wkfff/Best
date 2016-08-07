inherited FRM_PROP: TFRM_PROP
  Left = 219
  Top = 147
  Caption = 'Form3'
  ClientHeight = 453
  ClientWidth = 800
  Color = clBtnFace
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object l_PROP_VISIBIL: TLabel [1]
    Left = 678
    Top = 175
    Width = 61
    Height = 15
    Caption = 'Visibilidade'
  end
  object l_PROP_TIPO: TLabel [2]
    Left = 678
    Top = 134
    Width = 23
    Height = 15
    Caption = 'Tipo'
  end
  object l_PROP_DOMINIO: TLabel [3]
    Left = 678
    Top = 93
    Width = 42
    Height = 15
    Caption = 'Dominio'
  end
  object l_PROP_DEFAULT: TLabel [4]
    Left = 678
    Top = 52
    Width = 39
    Height = 15
    Caption = 'Default'
  end
  object l_LCK: TLabel [5]
    Left = 518
    Top = 380
    Width = 3
    Height = 15
  end
  object l_IDG_ID: TLabel [6]
    Left = 518
    Top = 339
    Width = 3
    Height = 15
  end
  object l_IDF_VISIBLE: TLabel [7]
    Left = 518
    Top = 298
    Width = 3
    Height = 15
  end
  object l_IDF_VERSAO_DATA: TLabel [8]
    Left = 518
    Top = 257
    Width = 3
    Height = 15
  end
  object l_IDF_VERSAO: TLabel [9]
    Left = 518
    Top = 216
    Width = 3
    Height = 15
  end
  object l_IDF_TIPO_ATIVIDADE: TLabel [10]
    Left = 518
    Top = 175
    Width = 3
    Height = 15
  end
  object l_IDF_RESPONSAVEL: TLabel [11]
    Left = 518
    Top = 134
    Width = 3
    Height = 15
  end
  object l_IDF_OBJETIVO: TLabel [12]
    Left = 518
    Top = 93
    Width = 45
    Height = 15
    Caption = 'Objetivo'
  end
  object l_IDF_LISTA: TLabel [13]
    Left = 518
    Top = 52
    Width = 25
    Height = 15
    Caption = 'Lista'
  end
  object l_IDF_DIRETORIO: TLabel [14]
    Left = 358
    Top = 380
    Width = 3
    Height = 15
  end
  object l_IDF_DESIGNACAO: TLabel [15]
    Left = 358
    Top = 339
    Width = 59
    Height = 15
    Caption = 'Designacao'
  end
  object l_IDF_DEL: TLabel [16]
    Left = 358
    Top = 298
    Width = 3
    Height = 15
  end
  object l_IDF_CAT: TLabel [17]
    Left = 358
    Top = 257
    Width = 50
    Height = 15
    Caption = 'Categoria'
  end
  object l_IDF_SEQ: TLabel [18]
    Left = 358
    Top = 216
    Width = 3
    Height = 15
  end
  object l_CLASS_ID: TLabel [19]
    Left = 358
    Top = 175
    Width = 3
    Height = 15
  end
  object l_IDF_CODIGO: TLabel [20]
    Left = 358
    Top = 134
    Width = 3
    Height = 15
  end
  object l_PRJ_ID: TLabel [21]
    Left = 358
    Top = 93
    Width = 3
    Height = 15
  end
  object l_CLI_ID: TLabel [22]
    Left = 358
    Top = 52
    Width = 3
    Height = 15
  end
  inherited Panel3: TPanel
    Width = 800
    TabOrder = 22
  end
  inherited lb: TListBox
    TabOrder = 23
    OnClick = lbClick
  end
  object PROP_VISIBIL: TEdit [25]
    Left = 678
    Top = 191
    Width = 121
    Height = 23
    TabOrder = 21
  end
  object PROP_TIPO: TEdit [26]
    Left = 678
    Top = 150
    Width = 121
    Height = 23
    TabOrder = 20
  end
  object PROP_DOMINIO: TEdit [27]
    Left = 678
    Top = 109
    Width = 121
    Height = 23
    TabOrder = 19
  end
  object PROP_DEFAULT: TEdit [28]
    Left = 678
    Top = 68
    Width = 121
    Height = 23
    TabOrder = 18
  end
  object LCK: TEdit [29]
    Left = 518
    Top = 396
    Width = 121
    Height = 23
    TabOrder = 17
  end
  object IDG_ID: TEdit [30]
    Left = 518
    Top = 355
    Width = 121
    Height = 23
    TabOrder = 16
  end
  object IDF_VISIBLE: TEdit [31]
    Left = 518
    Top = 314
    Width = 121
    Height = 23
    TabOrder = 15
  end
  object IDF_VERSAO_DATA: TEdit [32]
    Left = 518
    Top = 273
    Width = 121
    Height = 23
    TabOrder = 24
  end
  object d_IDF_VERSAO_DATA: TDateTimePicker [33]
    Left = 518
    Top = 273
    Width = 145
    Height = 21
    Date = 38140.524316932900000000
    Time = 38140.524316932900000000
    TabOrder = 14
    OnCloseUp = DateClose
  end
  object IDF_VERSAO: TEdit [34]
    Left = 518
    Top = 232
    Width = 121
    Height = 23
    TabOrder = 13
  end
  object IDF_TIPO_ATIVIDADE: TEdit [35]
    Left = 518
    Top = 191
    Width = 121
    Height = 23
    TabOrder = 12
  end
  object IDF_RESPONSAVEL: TEdit [36]
    Left = 518
    Top = 150
    Width = 121
    Height = 23
    TabOrder = 11
  end
  object IDF_OBJETIVO: TEdit [37]
    Left = 518
    Top = 109
    Width = 121
    Height = 23
    TabOrder = 10
  end
  object IDF_LISTA: TEdit [38]
    Left = 518
    Top = 68
    Width = 121
    Height = 23
    TabOrder = 9
  end
  object IDF_DIRETORIO: TEdit [39]
    Left = 358
    Top = 396
    Width = 121
    Height = 23
    TabOrder = 8
  end
  object IDF_DESIGNACAO: TEdit [40]
    Left = 358
    Top = 355
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object IDF_DEL: TEdit [41]
    Left = 358
    Top = 314
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object IDF_CAT: TEdit [42]
    Left = 358
    Top = 273
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object IDF_SEQ: TEdit [43]
    Left = 358
    Top = 232
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object CLASS_ID: TEdit [44]
    Left = 358
    Top = 191
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object IDF_CODIGO: TEdit [45]
    Left = 358
    Top = 150
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object PRJ_ID: TEdit [46]
    Left = 358
    Top = 109
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object CLI_ID: TEdit [47]
    Left = 358
    Top = 68
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  inherited PopupMenu1: TPopupMenu
    Left = 248
    Top = 16
  end
end
