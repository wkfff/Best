inherited FRM_PATOI: TFRM_PATOI
  Left = 233
  Top = 127
  Width = 714
  Height = 528
  HorzScrollBar.Position = 0
  Caption = 'FRM_PATOI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = 38
    Top = -1
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
      Top = 237
      Size.Values = (
        111.125000000000000000
        1751.541666666667000000)
      inherited QRLabel1: TgtQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          58.208333333333340000
          235.479166666666700000)
        FontSize = 10
      end
      inherited QRLabel8: TgtQRLabel
        Size.Values = (
          44.979166666666670000
          539.750000000000000000
          58.208333333333340000
          206.375000000000000000)
        FontSize = 10
      end
      inherited QRLabel9: TgtQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          15.875000000000000000
          150.812500000000000000)
        FontSize = 10
      end
      inherited QRLabel2: TgtQRLabel
        Left = 424
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          58.208333333333340000
          174.625000000000000000)
        FontSize = 10
      end
    end
    inherited ph1: TQRBand
      Size.Values = (
        275.166666666666700000
        1751.541666666667000000)
      inherited titulo: TgtQRLabel
        Size.Values = (
          60.854166666666680000
          769.937500000000000000
          105.833333333333300000
          246.062500000000000000)
        FontSize = 12
      end
      inherited pr_cli: TgtQRLabel
        Size.Values = (
          44.979166666666670000
          1005.416666666667000000
          5.291666666666667000
          87.312500000000000000)
        FontSize = 10
      end
      inherited pr_proj: TgtQRLabel
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          50.270833333333330000
          113.770833333333300000)
        FontSize = 10
      end
      inherited pLogo: TgtQRImage
        Left = 4
        Top = 3
        Height = 118
        Size.Values = (
          312.208333333333400000
          10.583333333333330000
          7.937500000000000000
          396.875000000000000000)
      end
      inherited subtitulo: TgtQRLabel
        Size.Values = (
          52.916666666666660000
          714.375000000000000000
          211.666666666666700000
          341.312500000000000000)
        FontSize = 12
      end
      inherited tot_page: TgtQRLabel
        Size.Values = (
          44.979166666666700000
          1608.666666666670000000
          317.500000000000000000
          129.645833333333000000)
        FontSize = 10
      end
      inherited gtQRSysData1: TgtQRSysData
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          209.020833333333300000
          224.895833333333300000)
        FontSize = 8
      end
      inherited gtQRSysData2: TgtQRSysData
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          150.812500000000000000
          224.895833333333300000)
        FontSize = 8
      end
      inherited gtQRSysData3: TgtQRSysData
        Size.Values = (
          50.270833333333330000
          1505.479166666667000000
          23.812500000000000000
          224.895833333333300000)
        FontSize = 12
      end
    end
    inherited qr_sum: TQRBand
      Top = 197
      Size.Values = (
        105.833333333333300000
        1751.541666666667000000)
    end
    object QRBand1: TQRBand
      Left = 94
      Top = 142
      Width = 662
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1751.541666666667000000)
      BandType = rbDetail
      object QRDBText1: TgtQRDBText
        Left = 1
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
          2.645833333333333000
          0.000000000000000000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
    end
    object QR_OI: TQRSubDetail
      Left = 94
      Top = 179
      Width = 662
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1751.541666666667000000)
      Master = qrp
      HeaderBand = QRBand2
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TgtQRDBText
        Left = 30
        Top = 0
        Width = 313
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          79.375000000000000000
          0.000000000000000000
          828.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_DESIGNACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TgtQRDBText
        Left = 368
        Top = 0
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          0.000000000000000000
          743.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 94
      Top = 161
      Width = 662
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1751.541666666667000000)
      BandType = rbGroupHeader
      object QRLabel3: TgtQRLabel
        Left = 28
        Top = 0
        Width = 125
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          74.083333333333340000
          0.000000000000000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Objetos de Interface :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TgtQRLabel
        Left = 368
        Top = 0
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          0.000000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome Externo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  inherited gtQRXHTMLExport1: TgtQRXHTMLExport
    Left = 184
  end
end