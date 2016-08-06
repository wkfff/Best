inherited FRM_ALIAS: TFRM_ALIAS
  Left = 304
  Top = 141
  Caption = 'Form3'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object l_IDF_DIRETORIO: TLabel [1]
    Left = 358
    Top = 134
    Width = 48
    Height = 15
    Caption = 'Diret'#243'rio'
  end
  object l_IDF_ALIAS: TLabel [2]
    Left = 358
    Top = 93
    Width = 26
    Height = 15
    Caption = 'Alias'
  end
  object l_IDF_CODIGO: TLabel [3]
    Left = 358
    Top = 52
    Width = 35
    Height = 15
    Caption = 'C'#243'digo'
  end
  inherited Panel3: TPanel
    Width = 688
    TabOrder = 3
  end
  inherited lb: TListBox
    TabOrder = 4
  end
  object IDF_DIRETORIO: TEdit [6]
    Left = 358
    Top = 150
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object IDF_ALIAS: TEdit [7]
    Left = 358
    Top = 109
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object IDF_CODIGO: TEdit [8]
    Left = 358
    Top = 68
    Width = 121
    Height = 23
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
end
