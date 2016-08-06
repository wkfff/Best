object Form2: TForm2
  Left = 214
  Top = 173
  Width = 360
  Height = 128
  Caption = 'BEST - Atualiza'#231#227'o Estrutura de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 92
    Top = 53
    Width = 94
    Height = 22
    Caption = 'Atualizar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 90
    Top = 18
    Width = 94
    Height = 22
    Caption = 'Banco de dados'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 219
    Top = 53
    Width = 94
    Height = 22
    Caption = 'Criar Index'
    Visible = False
    OnClick = SpeedButton3Click
  end
  object qry_cria_idf_dados: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'ALTER TABLE IDF_DADOS'
      'ADD IDF_CAPTION VARCHAR(40),'
      'ADD IDF_OBRIG VARCHAR(1)')
    Left = 177
    Top = 107
  end
  object QRY_CRIAiNDEX: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'ALTER TABLE IDF_DADOS ADD CONSTRAINT IDF_DADOSPrim PRIMARY KEY (' +
        ' CLI_ID,PRJ_ID,IDF_CODIGO,IDF_TABELA,IDF_SEQ )')
    Left = 269
    Top = 105
  end
end
