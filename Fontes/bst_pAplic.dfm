inherited frm_pAplic: Tfrm_pAplic
  Left = 217
  Top = 150
  Width = 788
  Height = 505
  HorzScrollBar.Position = 59
  Caption = 'frm_pAplic'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = -30
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      200.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      150.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited PageFooterBand1: TQRBand
      Left = 57
      Top = 215
      Width = 700
      Height = 37
      Size.Values = (
        97.895833333333340000
        1852.083333333333000000)
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
        Left = 220
        Top = 18
        Size.Values = (
          44.979166666666670000
          582.083333333333400000
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
      object PRESP: TQRDBText
        Left = 319
        Top = 18
        Width = 126
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          844.020833333333400000
          47.625000000000000000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_RESPONSAVEL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object PVER: TQRDBText
        Left = 75
        Top = 3
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          198.437500000000000000
          7.937500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_VERSAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object PVERDATA: TQRDBText
        Left = 123
        Top = 18
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          325.437500000000000000
          47.625000000000000000
          328.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_VERSAO_DATA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qr_at: TQRBand [1]
      Left = 57
      Top = 153
      Width = 700
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = DetailBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1852.083333333333000000)
      BandType = rbDetail
      object PLF: TQRDBText
        Left = 5
        Top = 0
        Width = 276
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          0.000000000000000000
          730.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'IDF_DESIGNACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBRichText1: TQRDBRichText
        Left = 292
        Top = 0
        Width = 400
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          772.583333333333400000
          0.000000000000000000
          1058.333333333333000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_DESCRICAO'
      end
    end
    inherited ph1: TQRBand
      Left = 57
      Width = 700
      Height = 93
      Size.Values = (
        246.062500000000000000
        1852.083333333333000000)
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
        Left = 610
        Top = 52
        Width = 45
        Size.Values = (
          44.979166666666700000
          1613.958333333330000000
          137.583333333333000000
          119.062500000000000000)
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
      object QRLabel20: TQRLabel
        Left = 604
        Top = 100
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1598.083333333330000000
          264.583333333333000000
          171.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited qr_sum: TQRBand
      Left = 57
      Top = 175
      Width = 700
      Size.Values = (
        105.833333333333300000
        1852.083333333333000000)
    end
    object QRBand1: TQRBand
      Left = 57
      Top = 131
      Width = 700
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1852.083333333333000000)
      BandType = rbTitle
      object gtQRLabel1: TQRLabel
        Left = 1
        Top = 1
        Width = 91
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2.645833333333333000
          2.645833333333333000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Mecanismos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
