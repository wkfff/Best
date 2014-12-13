inherited frm_preqti: Tfrm_preqti
  Left = 193
  Top = 180
  Width = 815
  Height = 425
  HorzScrollBar.Position = 0
  Caption = 'frm_preqti'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = 1
    Top = -9
    Width = 1123
    Height = 794
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Orientation = poLandscape
    Page.Values = (
      200.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      250.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited PageFooterBand1: TQRBand
      Top = 281
      Width = 991
      Size.Values = (
        111.125000000000000000
        2622.020833333333000000)
      inherited QRLabel1: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          58.208333333333340000
          235.479166666666700000)
        FontSize = 10
      end
      inherited QRLabel8: TQRLabel
        Size.Values = (
          44.979166666666670000
          539.750000000000000000
          58.208333333333340000
          206.375000000000000000)
        FontSize = 10
      end
      inherited QRLabel9: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          15.875000000000000000
          150.812500000000000000)
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
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
      Width = 991
      Size.Values = (
        275.166666666666700000
        2622.020833333333000000)
      inherited titulo: TQRLabel
        Left = 379
        Size.Values = (
          60.854166666666680000
          1002.770833333333000000
          105.833333333333300000
          246.062500000000000000)
        FontSize = 12
      end
      inherited QRShape1: TQRShape
        Left = 884
        Size.Values = (
          275.166666666667000000
          2338.916666666670000000
          0.000000000000000000
          2.645833333333330000)
      end
      inherited QRSysData3: TQRSysData
        Left = 885
        Size.Values = (
          44.979166666666670000
          2341.562500000000000000
          148.166666666666700000
          121.708333333333300000)
        FontSize = 10
      end
      inherited QRShape3: TQRShape
        Left = 884
        Size.Values = (
          2.645833333333330000
          2338.916666666670000000
          132.291666666667000000
          283.104166666667000000)
      end
      inherited pr_cli: TQRLabel
        Left = 468
        Size.Values = (
          44.979166666666670000
          1238.250000000000000000
          5.291666666666667000
          87.312500000000000000)
        FontSize = 10
      end
      inherited pr_proj: TQRLabel
        Left = 467
        Size.Values = (
          44.979166666666670000
          1235.604166666667000000
          50.270833333333330000
          113.770833333333300000)
        FontSize = 10
      end
      inherited pLogo: TQRImage
        Left = 4
        Top = 3
        Size.Values = (
          312.208333333333400000
          10.583333333333330000
          7.937500000000000000
          396.875000000000000000)
      end
      inherited subtitulo: TQRLabel
        Size.Values = (
          52.916666666666670000
          714.375000000000000000
          211.666666666666700000
          341.312500000000000000)
        FontSize = 12
      end
      inherited QRSysData1: TQRSysData
        Left = 888
        Size.Values = (
          44.979166666666670000
          2349.500000000000000000
          211.666666666666700000
          148.166666666666700000)
        FontSize = 8
      end
      inherited tot_page: TQRLabel
        Size.Values = (
          44.979166666666700000
          1608.666666666670000000
          317.500000000000000000
          129.645833333333000000)
        FontSize = 10
      end
    end
    inherited qr_sum: TQRBand
      Top = 241
      Width = 991
      Size.Values = (
        105.833333333333300000
        2622.020833333333000000)
    end
    object QRBand2: TQRBand
      Left = 94
      Top = 142
      Width = 991
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
        2622.020833333333000000)
      BandType = rbColumnHeader
    end
    object QRBand1: TQRBand
      Left = 94
      Top = 185
      Width = 991
      Height = 24
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
        63.500000000000000000
        2622.020833333333000000)
      BandType = rbDetail
      object gtQRDBRichText1: TQRDBRichText
        Left = 8
        Top = 0
        Width = 100
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          21.166666666666670000
          0.000000000000000000
          264.583333333333400000)
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
    end
    object QRGroup1: TQRGroup
      Left = 94
      Top = 161
      Width = 991
      Height = 24
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
        63.500000000000000000
        2622.020833333333000000)
      Expression = 'IDF_DESIGNACAO'
      Master = qrp
      ReprintOnNewPage = True
      object gtQRDBText1: TQRDBText
        Left = 8
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
          21.166666666666670000
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
    object QR_REQ: TQRSubDetail
      Left = 94
      Top = 209
      Width = 991
      Height = 32
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
        84.666666666666680000
        2622.020833333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText2: TQRDBText
        Left = 8
        Top = 8
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'TI_REQ_AP'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
