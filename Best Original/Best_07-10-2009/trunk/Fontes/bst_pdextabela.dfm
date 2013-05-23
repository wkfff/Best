inherited frm_pdextabela: Tfrm_pdextabela
  Width = 794
  Height = 505
  HorzScrollBar.Position = 191
  Caption = 'frm_pdextabela'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = -24
    Top = -5
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      200
      2970
      100
      2100
      250
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 266
      Size.Values = (
        111.125
        1751.54166666667)
      inherited QRLabel1: TgtQRLabel
        Size.Values = (
          44.9791666666667
          21.1666666666667
          58.2083333333333
          285.75)
        FontSize = 10
      end
      inherited QRLabel8: TgtQRLabel
        Size.Values = (
          44.9791666666667
          539.75
          58.2083333333333
          235.479166666667)
        FontSize = 10
      end
      inherited QRLabel9: TgtQRLabel
        Size.Values = (
          44.9791666666667
          21.1666666666667
          15.875
          156.104166666667)
        FontSize = 10
      end
      inherited QRLabel2: TgtQRLabel
        Size.Values = (
          44.9791666666667
          1121.83333333333
          58.2083333333333
          203.729166666667)
        FontSize = 10
      end
    end
    inherited ph1: TQRBand
      Size.Values = (
        275.166666666667
        1751.54166666667)
      inherited titulo: TgtQRLabel
        Size.Values = (
          60.8541666666667
          769.9375
          105.833333333333
          246.0625)
        FontSize = 12
      end
      inherited QRShape1: TgtQRShape
        Size.Values = (
          275.166666666667
          1471.08333333333
          0
          2.64583333333333)
      end
      inherited QRSysData3: TgtQRSysData
        Size.Values = (
          44.9791666666667
          1473.72916666667
          148.166666666667
          121.708333333333)
        FontSize = 10
      end
      inherited QRShape3: TgtQRShape
        Size.Values = (
          2.64583333333333
          1471.08333333333
          132.291666666667
          283.104166666667)
      end
      inherited pr_cli: TgtQRLabel
        Size.Values = (
          44.9791666666667
          1005.41666666667
          5.29166666666667
          87.3125)
        FontSize = 10
      end
      inherited pr_proj: TgtQRLabel
        Size.Values = (
          44.9791666666667
          1002.77083333333
          50.2708333333333
          113.770833333333)
        FontSize = 10
      end
      inherited pLogo: TgtQRImage
        Height = 118
        Size.Values = (
          312.208333333333
          0
          0
          396.875)
      end
      inherited subtitulo: TgtQRLabel
        Size.Values = (
          52.9166666666667
          714.375
          211.666666666667
          341.3125)
        FontSize = 12
      end
      inherited QRSysData1: TgtQRSysData
        Size.Values = (
          44.9791666666667
          1481.66666666667
          211.666666666667
          148.166666666667)
        FontSize = 8
      end
      inherited tot_page: TgtQRLabel
        Size.Values = (
          44.9791666666667
          1608.66666666667
          317.5
          129.645833333333)
        FontSize = 10
      end
    end
    inherited qr_sum: TQRBand
      Top = 226
      Size.Values = (
        105.833333333333
        1751.54166666667)
    end
    object QRBand1: TQRBand
      Left = 94
      Top = 142
      Width = 662
      Height = 40
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
        105.833333333333
        1751.54166666667)
      BandType = rbColumnHeader
    end
    object DB: TQRBand
      Left = 94
      Top = 205
      Width = 662
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = DBBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.5625
        1751.54166666667)
      BandType = rbDetail
      object gtQRDBText1: TgtQRDBText
        Left = 26
        Top = 2
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          68.7916666666667
          5.29166666666667
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_TABELA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object pp: TgtQRLabel
        Left = 266
        Top = 2
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          703.791666666667
          5.29166666666667
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '                        '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRG: TQRGroup
      Left = 94
      Top = 182
      Width = 662
      Height = 23
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
        60.8541666666667
        1751.54166666667)
      Expression = 'IDF_DESIGNACAO'
      Master = qrp
      ReprintOnNewPage = False
      object gtQRDBText3: TgtQRDBText
        Left = 2
        Top = 2
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          5.29166666666667
          5.29166666666667
          301.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clBtnFace
        DataField = 'IDF_DESIGNACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
