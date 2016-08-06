inherited FRM_PERS: TFRM_PERS
  Top = 324
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'TPessoa'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object l_PES_SENHA: TLabel [2]
    Left = 358
    Top = 216
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object l_PES_NOME: TLabel [3]
    Left = 358
    Top = 175
    Width = 34
    Height = 15
    Caption = 'Pessoa'
  end
  object l_ID_USUARIO: TLabel [4]
    Left = 358
    Top = 134
    Width = 55
    Height = 15
    Caption = 'Id Usu'#225'rio'
  end
  object l_DATATU: TLabel [5]
    Left = 358
    Top = 93
    Width = 79
    Height = 15
    Caption = 'Dt. Atualiza'#231#227'o'
  end
  object l_ID_PESSOA: TLabel [6]
    Left = 358
    Top = 52
    Width = 49
    Height = 15
    Caption = 'Id Pessoa'
  end
  inherited Panel3: TPanel
    TabOrder = 5
  end
  inherited grid_cont: TStringAlignGrid
    TabOrder = 6
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  inherited Panel1: TPanel
    TabOrder = 7
  end
  object PES_SENHA: TEdit [10]
    Left = 358
    Top = 232
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Color = 13224393
    TabOrder = 4
  end
  object PES_NOME: TEdit [11]
    Left = 358
    Top = 191
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Color = 13224393
    TabOrder = 3
  end
  object ID_USUARIO: TEdit [12]
    Left = 358
    Top = 150
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Color = 13224393
    TabOrder = 2
  end
  object d_DATATU: TDateTimePicker [13]
    Left = 358
    Top = 109
    Width = 145
    Height = 21
    Date = 38140.524316932900000000
    Time = 38140.524316932900000000
    TabOrder = 8
    OnCloseUp = DateClose
  end
  object DATATU: TEdit [14]
    Left = 358
    Top = 109
    Width = 121
    Height = 21
    BorderStyle = bsNone
    Color = 13224393
    TabOrder = 1
  end
  object ID_PESSOA: TEdit [15]
    Left = 358
    Top = 68
    Width = 121
    Height = 21
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
end
