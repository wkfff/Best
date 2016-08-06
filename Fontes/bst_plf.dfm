inherited frm_plf: Tfrm_plf
  Left = 217
  Top = 150
  Width = 788
  Height = 505
  HorzScrollBar.Position = 0
  Caption = 'frm_plf'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = 61
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
      Top = 251
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
          844.020833333333500000
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
    object DetailBand1: TQRBand [1]
      Left = 57
      Top = 131
      Width = 700
      Height = 62
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
        164.041666666666700000
        1852.083333333333000000)
      BandType = rbDetail
      object QRDBRichText1: TQRDBRichText
        Left = 137
        Top = 42
        Width = 532
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          362.479166666667000000
          111.125000000000000000
          1407.583333333330000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_DESCRICAO'
      end
      object PLF: TQRDBText
        Left = 137
        Top = 21
        Width = 165
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          362.479166666667000000
          55.562500000000000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'IDF_LOCALIZACAO_FISICA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object ppdes: TQRDBText
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
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 21
        Width = 127
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          55.562500000000000000
          336.020833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Localiza'#231#227'o F'#237'sica :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 42
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          111.125000000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o : '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
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
      Top = 211
      Width = 700
      Size.Values = (
        105.833333333333300000
        1852.083333333333000000)
    end
    object qr_at: TQRSubDetail
      Left = 57
      Top = 193
      Width = 700
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_atBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel3: TQRLabel
        Left = 8
        Top = 0
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          0.000000000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Atividades : '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object PWBS: TQRDBText
        Left = 93
        Top = 0
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          246.062500000000000000
          0.000000000000000000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_WBS_CODE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object PDES: TQRDBText
        Left = 210
        Top = 0
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          555.625000000000000000
          0.000000000000000000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_DESIGNACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
