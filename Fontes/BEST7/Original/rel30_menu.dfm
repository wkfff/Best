object Form2: TForm2
  Left = 359
  Top = 181
  Width = 333
  Height = 164
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
    Left = 328
    Top = 287
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 30'
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 110
    Top = 18
    Width = 94
    Height = 22
    Caption = 'Banco de dados'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 327
    Top = 43
    Width = 94
    Height = 22
    Caption = 'Criar Index rel 30'
    Visible = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 564
    Top = 281
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 32'
    Visible = False
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 432
    Top = 279
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 33'
    Visible = False
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 314
    Top = 221
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 34'
    Visible = False
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TSpeedButton
    Left = 306
    Top = 261
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 6.37'
    Visible = False
    OnClick = SpeedButton7Click
  end
  object SpeedButton8: TSpeedButton
    Left = 114
    Top = 59
    Width = 94
    Height = 22
    Caption = 'Atualizar rel 6.37p'
    OnClick = SpeedButton8Click
  end
  object Memo1: TMemo
    Left = 416
    Top = 56
    Width = 185
    Height = 175
    Lines.Strings = (
      'Rel 30 --> cria tabela IDF_DADOS e '
      'Index'
      ''
      'Rel 32 Crai atributos IDF_CAPTION E '
      'IDF_OBRIG na tabela IDF_DADOS'
      ''
      'Rel 33 : Cria  atributos LCK, em todas '
      'as Tabelas'
      ''
      'Rel. 34 : cria atributo TIPO NA '
      'TABELA  PROVIDER_DATA')
    TabOrder = 0
    Visible = False
  end
  object lb: TMemo
    Left = 426
    Top = 14
    Width = 221
    Height = 247
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 316
    Top = 94
    Width = 219
    Height = 115
    TabOrder = 2
    Visible = False
    object chk1: TCheckBox
      Left = 14
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Cria Tipos'
      TabOrder = 0
    end
    object chk2: TCheckBox
      Left = 14
      Top = 36
      Width = 143
      Height = 17
      Caption = 'Cria provider Padr'#227'o'
      TabOrder = 1
    end
    object CHK3: TCheckBox
      Left = 14
      Top = 56
      Width = 159
      Height = 17
      Caption = 'Elimina Atributos IDF_AP'
      TabOrder = 2
    end
    object chk4: TCheckBox
      Left = 14
      Top = 76
      Width = 197
      Height = 17
      Caption = 'Cria Atributo caminho no cenario'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object qry_cria_idf_dados: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'CREATE TABLE IDF_DADOS('
      #9'IDF_CODIGO LONG NULL  ,'
      #9'CLI_ID LONG NULL ,'
      #9'PRJ_ID LONG NULL ,'
      #9'IDF_TABELA varchar (60) NULL ,'
      #9'IDF_DESIGNACAO varchar (50)  NULL ,'
      #9'SUB_NIVEL LONG NULL ,'
      #9'IDF_NOME varchar (60)  NULL ,'
      #9'IDF_DEL varchar (1) NULL ,'
      #9'IDF_VISIBLE varchar (1) NULL ,'
      #9'IDF_DESCRICAO LONGTEXT NULL ,'
      #9'IDF_DATA_TYPE varchar (60)  NULL ,'
      #9'IDF_DEFAULT_VALUE varchar (20)  NULL ,'
      #9'IDF_DOMINIO text   NULL ,'
      #9'IDF_NAMING_PREFIX varchar (8)  NULL ,'
      #9'IDF_NATUREZA varchar (50)  NULL ,'
      #9'IDF_NORMALIZE varchar (1)  NULL ,'
      #9'IDF_TYPE_QUALIFIERS varchar (20)  NULL ,'
      #9'IDF_DE_REPET LONG NULL ,'
      #9'IDF_PK LONG NULL ,'
      #9'IDF_SEQ LONG NULL ,'
      #9'IDF_CAPTION varchar (40)  NULL ,'
      #9'IDF_OBRIG varchar (1) NULL ,'
      #9'LCK varchar  (1) NULL)')
    Left = 31
    Top = 53
  end
  object QRY_CRIAiNDEX: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'ALTER TABLE IDF_DADOS ADD CONSTRAINT IDF_DADOSPrim PRIMARY KEY (' +
        ' CLI_ID,PRJ_ID,IDF_CODIGO,IDF_TABELA,IDF_SEQ )')
    Left = 303
    Top = 105
  end
  object adoc: TADOConnection
    LoginPrompt = False
    Left = 52
    Top = 102
  end
end
