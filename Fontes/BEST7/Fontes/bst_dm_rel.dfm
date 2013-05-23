object dm_rel: Tdm_rel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 270
  Height = 177
  Width = 496
  object qry_atiid: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RPROJ'
        DataType = ftInteger
        Value = 1
      end
      item
        Name = 'RCLI'
        DataType = ftInteger
        Value = 1
      end
      item
        Name = 'RTIPO'
        DataType = ftString
        Size = 4
        Value = 'AP'
      end
      item
        Name = 'RUC'
        DataType = ftString
        Size = 4
        Value = 'AP'
      end
      item
        Name = 'RUC1'
        DataType = ftString
        Size = 4
        Value = 'AP'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM IDF_AP I'
      'WHERE'
      ' I.PRJ_ID = :RPROJ AND I.CLI_ID = :RCLI AND '
      ' I.IDF_TIPO_ATIVIDADE =  :RTIPO AND '
      '( I.IDF_TIPO_ATIV =  :RUC OR  I.IDF_TIPO_ATIV =  :RUC1)'
      'ORDER BY I.IDF_DESIGNACAO ')
    Left = 60
    Top = 32
    object qry_atiidIDF_CODIGO: TIntegerField
      FieldName = 'IDF_CODIGO'
    end
    object qry_atiidCLI_ID: TSmallintField
      FieldName = 'CLI_ID'
    end
    object qry_atiidPRJ_ID: TSmallintField
      FieldName = 'PRJ_ID'
    end
    object qry_atiidIDG_ID: TIntegerField
      FieldName = 'IDG_ID'
    end
    object qry_atiidIDF_OI: TIntegerField
      FieldName = 'IDF_OI'
    end
    object qry_atiidIDF_TIPO_ATIVIDADE: TWideStringField
      FieldName = 'IDF_TIPO_ATIVIDADE'
      Size = 16
    end
    object qry_atiidIDF_DESIGNACAO: TWideStringField
      FieldName = 'IDF_DESIGNACAO'
      Size = 50
    end
    object qry_atiidIDF_CAUSA_INATIVIDADE: TMemoField
      FieldName = 'IDF_CAUSA_INATIVIDADE'
      BlobType = ftMemo
    end
    object qry_atiidIDF_CLASSIFICACAO_PP: TWideStringField
      FieldName = 'IDF_CLASSIFICACAO_PP'
      Size = 10
    end
    object qry_atiidIDF_COMPLEXIDADE: TWideStringField
      FieldName = 'IDF_COMPLEXIDADE'
      Size = 14
    end
    object qry_atiidIDF_CUSTO_ANUAL: TFloatField
      FieldName = 'IDF_CUSTO_ANUAL'
    end
    object qry_atiidIDF_DESCRICAO: TMemoField
      FieldName = 'IDF_DESCRICAO'
      BlobType = ftMemo
    end
    object qry_atiidIDF_DURATION_TPU: TFloatField
      FieldName = 'IDF_DURATION_TPU'
    end
    object qry_atiidIDF_OBJETIVO_UC: TMemoField
      FieldName = 'IDF_OBJETIVO_UC'
      BlobType = ftMemo
    end
    object qry_atiidIDF_RESPONSAVEL: TWideStringField
      FieldName = 'IDF_RESPONSAVEL'
      Size = 30
    end
    object qry_atiidIDF_TEMPO_INATIVO_TPI: TFloatField
      FieldName = 'IDF_TEMPO_INATIVO_TPI'
    end
    object qry_atiidIDF_UNIDADE_TEMPO: TWideStringField
      FieldName = 'IDF_UNIDADE_TEMPO'
      Size = 30
    end
    object qry_atiidIDF_VALOR_AGREGADO: TWideStringField
      FieldName = 'IDF_VALOR_AGREGADO'
      Size = 14
    end
    object qry_atiidIDF_VOLUME: TMemoField
      FieldName = 'IDF_VOLUME'
      BlobType = ftMemo
    end
    object qry_atiidIDF_VOLUME_PICO: TMemoField
      FieldName = 'IDF_VOLUME_PICO'
      BlobType = ftMemo
    end
    object qry_atiidIDF_VOLUME_LOOPING: TFloatField
      FieldName = 'IDF_VOLUME_LOOPING'
    end
    object qry_atiidIDF_VOLUME_PROC: TFloatField
      FieldName = 'IDF_VOLUME_PROC'
    end
    object qry_atiidIDF_V_PICO: TFloatField
      FieldName = 'IDF_V_PICO'
    end
    object qry_atiidIDF_V_REGULAR: TFloatField
      FieldName = 'IDF_V_REGULAR'
    end
    object qry_atiidIDF_V_MINIMO: TFloatField
      FieldName = 'IDF_V_MINIMO'
    end
    object qry_atiidIDF_WBS_CODE: TWideStringField
      FieldName = 'IDF_WBS_CODE'
      Size = 50
    end
    object qry_atiidIDF_DEL: TWideStringField
      FieldName = 'IDF_DEL'
      Size = 1
    end
    object qry_atiidIDF_VERSAO: TWideStringField
      FieldName = 'IDF_VERSAO'
      Size = 6
    end
    object qry_atiidIDF_VERSAO_DATA: TDateTimeField
      FieldName = 'IDF_VERSAO_DATA'
    end
    object qry_atiidIDF_TIPO_ATIV: TWideStringField
      FieldName = 'IDF_TIPO_ATIV'
      Size = 16
    end
    object qry_atiidIDF_VISIBLE: TWideStringField
      FieldName = 'IDF_VISIBLE'
      Size = 1
    end
    object qry_atiidIDF_ATOR1: TWideStringField
      FieldName = 'IDF_ATOR1'
      Size = 50
    end
    object qry_atiidIDF_ATOR2: TWideStringField
      FieldName = 'IDF_ATOR2'
      Size = 50
    end
    object qry_atiidSUB_ID: TIntegerField
      FieldName = 'SUB_ID'
    end
    object qry_atiidIDF_VOLUME_REG: TFloatField
      FieldName = 'IDF_VOLUME_REG'
    end
  end
  object src_atiid: TDataSource
    DataSet = qry_atiid
    Left = 120
    Top = 31
  end
  object qry_atu_idg: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RCLI'
        DataType = ftString
        Size = 1
        Value = '1'
      end
      item
        Name = 'RPROJ'
        DataType = ftString
        Size = 1
        Value = '1'
      end
      item
        Name = 'RIDG'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM SUB_SUBORDINACAO'
      ''
      '')
    Left = 56
    Top = 120
    object qry_atu_idgCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object qry_atu_idgPRJ_ID: TIntegerField
      FieldName = 'PRJ_ID'
    end
    object qry_atu_idgIDG_ID: TIntegerField
      FieldName = 'IDG_ID'
    end
    object qry_atu_idgSUB_ID: TIntegerField
      FieldName = 'SUB_ID'
    end
    object qry_atu_idgDIAG_PAI_ID: TIntegerField
      FieldName = 'DIAG_PAI_ID'
    end
    object qry_atu_idgSUB_NOME: TWideStringField
      FieldName = 'SUB_NOME'
      Size = 50
    end
    object qry_atu_idgDIAG_ID: TWideStringField
      FieldName = 'DIAG_ID'
      Size = 50
    end
    object qry_atu_idgATIVIDADE_MAE: TIntegerField
      FieldName = 'ATIVIDADE_MAE'
    end
    object qry_atu_idgGRID_ALT: TSmallintField
      FieldName = 'GRID_ALT'
    end
    object qry_atu_idgGRID_LARG: TSmallintField
      FieldName = 'GRID_LARG'
    end
    object qry_atu_idgGRID_COR: TFloatField
      FieldName = 'GRID_COR'
    end
    object qry_atu_idgGRID_SHOW: TSmallintField
      FieldName = 'GRID_SHOW'
    end
    object qry_atu_idgGRID_SNAP: TWideStringField
      FieldName = 'GRID_SNAP'
      Size = 1
    end
    object qry_atu_idgIDG_DIR: TWideStringField
      FieldName = 'IDG_DIR'
      Size = 40
    end
    object qry_atu_idgIDG_NIVEL: TIntegerField
      FieldName = 'IDG_NIVEL'
    end
    object qry_atu_idgIDG_UPDATEDATE: TDateTimeField
      FieldName = 'IDG_UPDATEDATE'
    end
    object qry_atu_idgIDG_DIAGRAM_STATUS: TWideStringField
      FieldName = 'IDG_DIAGRAM_STATUS'
      Size = 12
    end
    object qry_atu_idgIDG_IDGCLASS: TWideStringField
      FieldName = 'IDG_IDGCLASS'
      Size = 5
    end
    object qry_atu_idgIDG_DIAG: TMemoField
      FieldName = 'IDG_DIAG'
      BlobType = ftMemo
    end
  end
  object src_atu_idg: TDataSource
    DataSet = qry_atu_idg
    Left = 128
    Top = 119
  end
  object qry_req: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM REQUERIMENTOS'
      'ORDER BY SEQ,SUBSEQ')
    Left = 224
    Top = 32
  end
  object src_req: TDataSource
    DataSet = qry_req
    Left = 296
    Top = 32
  end
  object qry_delPlan: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DELETE  FROM REQUERIMENTOS')
    Left = 232
    Top = 104
  end
  object src_DelPlan: TDataSource
    DataSet = qry_delPlan
    Left = 304
    Top = 104
  end
end
