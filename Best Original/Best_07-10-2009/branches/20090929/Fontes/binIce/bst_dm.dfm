object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 296
  Top = 173
  Height = 374
  Width = 352
  object qry_OpenAP: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RCLI'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RPROJ'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RCODIGO'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM IDF_AP'
      ' WHERE CLI_ID = :RCLI AND'
      ' PRJ_ID = :RPROJ AND'
      ' IDF_CODIGO = :RCODIGO')
    Left = 40
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = qry_OpenAP
    Left = 112
    Top = 24
  end
  object cn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Develop\best2002' +
      '\dados\access\case_db.mdb;Persist Security Info=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 184
    Top = 24
  end
  object qry_APALL: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RCLI'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RPROJ'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM IDF_AP'
      ' WHERE CLI_ID = :RCLI AND'
      ' PRJ_ID = :RPROJ ')
    Left = 40
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = qry_APALL
    Left = 112
    Top = 88
  end
  object DataSource3: TDataSource
    DataSet = qry_AtuAp
    Left = 112
    Top = 152
  end
  object qry_AtuAp: TADOQuery
    Parameters = <
      item
        Name = 'RIDG_ID'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_ID'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_OI'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_TIPO_ATIVIDADE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_DESIGNACAO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RSUB_NIVEL'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RARI_ID'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_DESCRICAO'
        Attributes = [paNullable]
        DataType = ftMemo
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_DURATION_TPU'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_OBJETIVO_UC'
        Attributes = [paNullable]
        DataType = ftMemo
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_RESPONSAVEL'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_TEMPO_INATIVO_TPI'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_TIPO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_TIPO_UC'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_UNIDADE_TEMPO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VALOR_AGREGADO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VOLUME'
        Attributes = [paNullable]
        DataType = ftMemo
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VOLUME_PICO'
        Attributes = [paNullable]
        DataType = ftMemo
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VOLUME_LOOPING'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VOLUME_PROC'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_V_PICO'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_V_REGULAR'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_V_MINIMO'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_WBS_CODE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_DEL'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VERSAO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VERSAO_DATA'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_TIPO_ATIV'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_VISIBLE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_ATOR1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RIDF_ATOR2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RSUB_ID'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RCLI'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RPROJ'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RCODIGO'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE IDF_AP'
      'SET IDG_ID                   =  :RIDG_ID    ,'
      'IDF_ID                   =  :RIDF_ID    ,'
      'IDF_OI                   =  :RIDF_OI   ,'
      'IDF_TIPO_ATIVIDADE       =  :RIDF_TIPO_ATIVIDADE  ,'
      'IDF_DESIGNACAO           =  :RIDF_DESIGNACAO  ,'
      'SUB_NIVEL                =  :RSUB_NIVEL  ,'
      'ARI_ID                   =  :RARI_ID   ,'
      'IDF_DESCRICAO            =  :RIDF_DESCRICAO   ,'
      'IDF_DURATION_TPU         =  :RIDF_DURATION_TPU   ,'
      'IDF_OBJETIVO_UC          =  :RIDF_OBJETIVO_UC  ,'
      'IDF_RESPONSAVEL          =  :RIDF_RESPONSAVEL  ,'
      'IDF_TEMPO_INATIVO_TPI    =  :RIDF_TEMPO_INATIVO_TPI  ,'
      'IDF_TIPO                 =  :RIDF_TIPO   ,'
      'IDF_TIPO_UC              =  :RIDF_TIPO_UC   ,'
      'IDF_UNIDADE_TEMPO        =  :RIDF_UNIDADE_TEMPO  ,'
      'IDF_VALOR_AGREGADO       =  :RIDF_VALOR_AGREGADO ,'
      'IDF_VOLUME               =  :RIDF_VOLUME   ,'
      'IDF_VOLUME_PICO          =  :RIDF_VOLUME_PICO ,'
      'IDF_VOLUME_LOOPING       =  :RIDF_VOLUME_LOOPING ,'
      'IDF_VOLUME_PROC          =  :RIDF_VOLUME_PROC,'
      'IDF_V_PICO               =  :RIDF_V_PICO   ,'
      'IDF_V_REGULAR            =  :RIDF_V_REGULAR ,'
      'IDF_V_MINIMO             =  :RIDF_V_MINIMO ,'
      'IDF_WBS_CODE             =  :RIDF_WBS_CODE ,'
      'IDF_DEL                  =  :RIDF_DEL  ,'
      'IDF_VERSAO               =  :RIDF_VERSAO   ,'
      'IDF_VERSAO_DATA          =  :RIDF_VERSAO_DATA ,'
      'IDF_TIPO_ATIV            =  :RIDF_TIPO_ATIV ,'
      'IDF_VISIBLE              =  :RIDF_VISIBLE ,'
      'IDF_ATOR1                =  :RIDF_ATOR1,'
      'IDF_ATOR2                =  :RIDF_ATOR2 ,'
      'SUB_ID                   =  :RSUB_ID'
      ''
      ' WHERE CLI_ID = :RCLI AND'
      ' PRJ_ID = :RPROJ AND'
      ' IDF_CODIGO = :RCODIGO')
    Left = 40
    Top = 152
  end
  object qry_Tab: TADOQuery
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 40
    Top = 216
  end
  object src_Tab: TDataSource
    DataSet = qry_Tab
    Left = 120
    Top = 216
  end
  object qry_empresas: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM'
      'CLI_CLIENTE')
    Left = 192
    Top = 80
  end
  object qry_cenarios: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RCLI'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM PRJ_PROJETO'
      'WHERE CLI_ID = :RCLI')
    Left = 192
    Top = 136
  end
  object DataSource4: TDataSource
    DataSet = qry_empresas
    Left = 264
    Top = 80
  end
  object DataSource5: TDataSource
    DataSet = qry_cenarios
    Left = 264
    Top = 136
  end
  object qry_generica: TADOQuery
    Parameters = <>
    Left = 192
    Top = 208
  end
  object src_generica: TDataSource
    DataSet = qry_generica
    Left = 264
    Top = 200
  end
end
