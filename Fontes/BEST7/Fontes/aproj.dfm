inherited FRM_aproj: TFRM_aproj
  Left = 219
  Top = 147
  Caption = 'Form3'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object l_PRJ_STATUS: TLabel [0]
    Left = 518
    Top = 175
    Width = 46
    Height = 15
    Caption = 'Situa'#231#227'o'
  end
  object l_PRJ_ALVOS_MELHORIA: TLabel [1]
    Left = 518
    Top = 134
    Width = 92
    Height = 15
    Caption = 'Alvos de Melhoria'
  end
  object l_PRJ_RESTRICOES: TLabel [2]
    Left = 518
    Top = 93
    Width = 54
    Height = 15
    Caption = 'Restri'#231#245'es'
  end
  object l_PRJ_PREMISSAS: TLabel [3]
    Left = 518
    Top = 52
    Width = 50
    Height = 15
    Caption = 'Premissas'
  end
  object l_PRJ_PATH: TLabel [4]
    Left = 358
    Top = 380
    Width = 55
    Height = 15
    Caption = 'Dir Padr'#227'o'
  end
  object l_PRJ_OBJETIVO: TLabel [5]
    Left = 358
    Top = 339
    Width = 45
    Height = 15
    Caption = 'Objetivo'
  end
  object l_PRJ_FATORES_RESTRITIVOS: TLabel [6]
    Left = 358
    Top = 298
    Width = 97
    Height = 15
    Caption = 'Fatores Restritivos'
  end
  object l_PRJ_DEFINICAO_CONTEXTO: TLabel [7]
    Left = 358
    Top = 257
    Width = 46
    Height = 15
    Caption = 'Contexto'
  end
  object l_PRJ_DATA_FIM_PLANEJADA: TLabel [8]
    Left = 358
    Top = 216
    Width = 45
    Height = 15
    Caption = 'Data Fim'
  end
  object l_PRJ_CARATER_RELEVANTE: TLabel [9]
    Left = 358
    Top = 175
    Width = 106
    Height = 15
    Caption = 'Carateres releventes'
  end
  object l_PRJ_CAMINHO: TLabel [10]
    Left = 358
    Top = 134
    Width = 86
    Height = 15
    Caption = 'Diret'#243'rio Padr'#227'o'
  end
  object l_PRJ_AREA_INTERESSE: TLabel [11]
    Left = 358
    Top = 93
    Width = 92
    Height = 15
    Caption = #193'rea de Interesse'
  end
  object l_PRJ_TITULO: TLabel [12]
    Left = 358
    Top = 52
    Width = 72
    Height = 15
    Caption = 'Nome Cen'#225'rio'
  end
  inherited Panel3: TPanel
    Width = 688
    TabOrder = 13
  end
  inherited DBGrid1: TDBGrid
    TabOrder = 14
  end
  object PRJ_STATUS: TEdit [15]
    Left = 518
    Top = 191
    Width = 121
    Height = 23
    TabOrder = 12
  end
  object PRJ_ALVOS_MELHORIA: TMemo [16]
    Left = 518
    Top = 150
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 11
  end
  object PRJ_RESTRICOES: TMemo [17]
    Left = 518
    Top = 109
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 10
  end
  object PRJ_PREMISSAS: TMemo [18]
    Left = 518
    Top = 68
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 9
  end
  object PRJ_PATH: TEdit [19]
    Left = 358
    Top = 396
    Width = 121
    Height = 23
    TabOrder = 8
  end
  object PRJ_OBJETIVO: TMemo [20]
    Left = 358
    Top = 355
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 7
  end
  object PRJ_FATORES_RESTRITIVOS: TMemo [21]
    Left = 358
    Top = 314
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 6
  end
  object PRJ_DEFINICAO_CONTEXTO: TMemo [22]
    Left = 358
    Top = 273
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object PRJ_DATA_FIM_PLANEJADA: TEdit [23]
    Left = 358
    Top = 232
    Width = 121
    Height = 23
    TabOrder = 15
  end
  object d_PRJ_DATA_FIM_PLANEJADA: TDateTimePicker [24]
    Left = 358
    Top = 232
    Width = 145
    Height = 21
    Date = 38140.524316932900000000
    Time = 38140.524316932900000000
    TabOrder = 4
    OnCloseUp = DateClose
  end
  object PRJ_CARATER_RELEVANTE: TMemo [25]
    Left = 358
    Top = 191
    Width = 121
    Height = 21
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object PRJ_CAMINHO: TEdit [26]
    Left = 358
    Top = 150
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object PRJ_AREA_INTERESSE: TEdit [27]
    Left = 358
    Top = 109
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object PRJ_TITULO: TEdit [28]
    Left = 358
    Top = 68
    Width = 121
    Height = 23
    TabOrder = 0
  end
end
