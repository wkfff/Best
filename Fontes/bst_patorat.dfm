inherited frm_patorat: Tfrm_patorat
  Left = 194
  Top = 178
  Width = 830
  Height = 590
  HorzScrollBar.Position = 113
  VertScrollBar.Position = 8
  Caption = 'frm_patorat'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = -58
    Top = -13
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
    ShowProgress = False
    inherited PageFooterBand1: TQRBand
      Top = 429
      Width = 991
      Height = 37
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        97.895833333333340000
        2622.020833333333000000)
      inherited QRLabel1: TQRLabel
        Left = 6
        Top = 19
        Width = 86
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          50.270833333333330000
          227.541666666666700000)
        Caption = 'Data Vers'#227'o :'
        FontSize = 10
      end
      inherited QRLabel8: TQRLabel
        Left = 246
        Top = 18
        Width = 81
        Size.Values = (
          44.979166666666670000
          650.875000000000000000
          47.625000000000000000
          214.312500000000000000)
        Caption = 'Respons'#225'vel'
        FontSize = 10
      end
      inherited QRLabel9: TQRLabel
        Top = 2
        Width = 45
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          5.291666666666667000
          119.062500000000000000)
        Caption = 'Vers'#227'o'
        FontSize = 10
      end
      inherited QRLabel2: TQRLabel
        Left = 506
        Top = 18
        Width = 69
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          47.625000000000000000
          182.562500000000000000)
        Caption = 'Aprova'#231#227'o'
        FontSize = 10
      end
    end
    inherited ph1: TQRBand
      Width = 991
      Height = 127
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        336.020833333333400000
        2622.020833333333000000)
      inherited titulo: TQRLabel
        Left = 279
        Top = 62
        Width = 116
        Size.Values = (
          60.854166666666680000
          738.187500000000000000
          164.041666666666700000
          306.916666666666700000)
        Font.Height = -19
        FontSize = 14
      end
      inherited pr_cli: TQRLabel
        Top = 10
        Size.Values = (
          44.979166666666670000
          1005.416666666667000000
          26.458333333333330000
          87.312500000000000000)
        FontSize = 10
      end
      inherited pr_proj: TQRLabel
        Top = 35
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          92.604166666666680000
          113.770833333333300000)
        FontSize = 10
      end
      inherited pLogo: TQRImage
        Left = 6
        Top = 5
        Height = 118
        Size.Values = (
          312.208333333333400000
          15.875000000000000000
          13.229166666666670000
          396.875000000000000000)
      end
      inherited subtitulo: TQRLabel
        Left = 176
        Top = 96
        Size.Values = (
          52.916666666666660000
          465.666666666666800000
          254.000000000000000000
          341.312500000000000000)
        FontSize = 12
      end
      inherited tot_page: TQRLabel
        Left = 930
        Top = 64
        Width = 27
        Size.Values = (
          44.979166666666700000
          2460.625000000000000000
          169.333333333333000000
          71.437500000000000000)
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
      Top = 389
      Width = 991
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        105.833333333333300000
        2622.020833333333000000)
    end
    object db: TQRBand
      Left = 94
      Top = 217
      Width = 991
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = QRBand3
      Size.Values = (
        190.500000000000000000
        2622.020833333333000000)
      BandType = rbDetail
      object gtQRDBRichText1: TQRDBRichText
        Left = 8
        Top = 42
        Width = 947
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          21.166666666666700000
          111.125000000000000000
          2505.604166666670000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_DESCRICAO'
      end
      object gtQRShape1: TQRShape
        Left = 228
        Top = 2
        Width = 515
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          603.250000000000000000
          5.291666666666670000
          1362.604166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 451
        Top = 8
        Width = 63
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          1193.270833333333000000
          21.166666666666670000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MISS'#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object db2: TQRSubDetail
      Left = 94
      Top = 369
      Width = 991
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = db2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        2622.020833333333000000)
      Master = qrp
      HeaderBand = QRBand3
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 122
        Top = 1
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          322.791666666666700000
          2.645833333333333000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_DESIGNACAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object patorativ: TQRLabel
        Left = 830
        Top = 1
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2196.041666666667000000
          2.645833333333333000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'patorativ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 2
        Top = 1
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          2.645833333333333000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_WBS_CODE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 94
      Top = 289
      Width = 991
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = ChildBand1
      Size.Values = (
        105.833333333333300000
        2622.020833333333000000)
      BandType = rbGroupHeader
      object gtQRShape2: TQRShape
        Left = 228
        Top = 2
        Width = 515
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          603.250000000000000000
          5.291666666666670000
          1362.604166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 438
        Top = 8
        Width = 104
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          1158.875000000000000000
          21.166666666666670000
          275.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PROCESSOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object ChildBand1: TQRChildBand
      Left = 94
      Top = 329
      Width = 991
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2622.020833333333000000)
      ParentBand = QRBand3
      object gtQRLabel3: TQRLabel
        Left = 6
        Top = 1
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          2.645833333333333000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o'
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
      object gtQRLabel4: TQRLabel
        Left = 830
        Top = 1
        Width = 143
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333300000
          2196.041666666670000000
          2.645833333333330000
          378.354166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Respons'#225'vel ou Participante'
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
    object ChildBand2: TQRChildBand
      Left = 94
      Top = 165
      Width = 991
      Height = 52
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = ChildBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = db
      Size.Values = (
        137.583333333333300000
        2622.020833333333000000)
      ParentBand = ph1
      object gtQRLabel5: TQRLabel
        Left = 10
        Top = 8
        Width = 135
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          21.166666666666670000
          357.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Manual de Processos'
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
      object gtQRDBText1: TQRDBText
        Left = 228
        Top = 8
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          603.250000000000000000
          21.166666666666670000
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
      object ppes: TQRMemo
        Left = 102
        Top = 28
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          269.875000000000000000
          74.083333333333300000
          743.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 10
        Top = 28
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          74.083333333333340000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Respons'#225'vel :'
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
  end
end
