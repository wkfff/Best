inherited frm_pativ1: Tfrm_pativ1
  Left = 275
  Top = 100
  Width = 786
  Height = 374
  HorzScrollBar.Position = 83
  Caption = 'frm_pativ1'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = -32
    Top = -7
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      200.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      250.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited PageFooterBand1: TQRBand
      Top = 233
      Height = 37
      Size.Values = (
        97.895833333333340000
        1751.541666666667000000)
      inherited QRLabel1: TQRLabel
        Top = 18
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          47.625000000000000000
          235.479166666666700000)
        FontSize = 10
      end
      inherited QRLabel8: TQRLabel
        Left = 222
        Top = 18
        Size.Values = (
          44.979166666666670000
          587.375000000000000000
          47.625000000000000000
          206.375000000000000000)
        FontSize = 10
      end
      inherited QRLabel9: TQRLabel
        Top = 2
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          5.291666666666667000
          150.812500000000000000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Left = 506
        Top = 18
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          47.625000000000000000
          174.625000000000000000)
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand [1]
      Left = 94
      Top = 131
      Width = 662
      Height = 62
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        164.041666666666700000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clSilver
        DataField = 'IDF_DESIGNACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 4
        Top = 22
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          58.208333333333340000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dm_rel.qry_atiid
        DataField = 'IDF_WBS_CODE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 10
      end
      object QRDBRichText1: TQRDBRichText
        Left = 4
        Top = 42
        Width = 645
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          10.583333333333300000
          111.125000000000000000
          1706.562500000000000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_DESCRICAO'
        DataSet = dm_rel.qry_atiid
      end
    end
    inherited ph1: TQRBand
      Height = 93
      Size.Values = (
        246.062500000000000000
        1751.541666666667000000)
      inherited titulo: TQRLabel
        Width = 116
        Size.Values = (
          60.854166666666680000
          769.937500000000000000
          105.833333333333300000
          306.916666666666700000)
        Font.Height = -19
        FontSize = 14
      end
      inherited pr_cli: TQRLabel
        Size.Values = (
          44.979166666666670000
          1005.416666666667000000
          5.291666666666667000
          87.312500000000000000)
        FontSize = 10
      end
      inherited pr_proj: TQRLabel
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          50.270833333333330000
          113.770833333333300000)
        FontSize = 10
      end
      inherited pLogo: TQRImage
        Left = 4
        Top = 3
        Height = 118
        Size.Values = (
          312.208333333333400000
          10.583333333333330000
          7.937500000000000000
          396.875000000000000000)
      end
      inherited subtitulo: TQRLabel
        Left = 180
        Top = 68
        Size.Values = (
          52.916666666666660000
          476.250000000000000000
          179.916666666666700000
          341.312500000000000000)
        FontSize = 12
      end
      inherited tot_page: TQRLabel
        Size.Values = (
          44.979166666666700000
          1608.666666666670000000
          317.500000000000000000
          129.645833333333000000)
        FontSize = 10
      end
      inherited gtQRSysData1: TQRSysData
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          209.020833333333300000
          224.895833333333300000)
        FontSize = 8
      end
      inherited gtQRSysData2: TQRSysData
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          150.812500000000000000
          224.895833333333300000)
        FontSize = 8
      end
      inherited gtQRSysData3: TQRSysData
        Size.Values = (
          50.270833333333330000
          1505.479166666667000000
          23.812500000000000000
          224.895833333333300000)
        FontSize = 12
      end
    end
    inherited qr_sum: TQRBand
      Top = 193
      Size.Values = (
        105.833333333333300000
        1751.541666666667000000)
    end
    inherited QRShape1: TQRShape
      Size.Values = (
        269.875000000000000000
        1733.020833333333000000
        95.250000000000000000
        2.645833333333333000)
    end
    inherited QRShape2: TQRShape
      Size.Values = (
        2.645833333333333000
        1735.666666666667000000
        219.604166666666700000
        259.291666666666700000)
    end
  end
end
