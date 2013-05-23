inherited frm_pativ: Tfrm_pativ
  Left = 203
  Top = 96
  Width = 847
  Height = 738
  Caption = 'frm_pativ'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qrp: TQuickRep
    Left = 17
    Top = 3
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    ShowProgress = False
    inherited PageFooterBand1: TQRBand
      Left = 57
      Top = 500
      Width = 700
      Height = 43
      Size.Values = (
        113.770833333333300000
        1852.083333333333000000)
      inherited QRLabel1: TgtQRLabel
        Width = 106
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          58.208333333333340000
          280.458333333333400000)
        Caption = 'Data da Vers'#227'o :'
        FontSize = 10
      end
      inherited QRLabel8: TgtQRLabel
        Left = 214
        Width = 81
        Size.Values = (
          44.979166666666670000
          566.208333333333400000
          58.208333333333340000
          214.312500000000000000)
        Caption = 'Respons'#225'vel'
        FontSize = 10
      end
      inherited QRLabel9: TgtQRLabel
        Width = 105
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          15.875000000000000000
          277.812500000000000000)
        Caption = 'Vers'#227'o/Version :'
        FontSize = 10
      end
      object QRDBText3: TgtQRDBText [3]
        Left = 302
        Top = 22
        Width = 126
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          799.041666666666800000
          58.208333333333340000
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
      object QRDBText4: TgtQRDBText [4]
        Left = 112
        Top = 6
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          15.875000000000000000
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
      object QRDBText5: TgtQRDBText [5]
        Left = 112
        Top = 22
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          58.208333333333340000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_VERSAO_DATA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      inherited QRLabel2: TgtQRLabel
        Left = 476
        Width = 73
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          58.208333333333340000
          193.145833333333300000)
        Caption = 'Aprova'#231#227'o '
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
      inherited titulo: TgtQRLabel
        Top = 42
        Width = 116
        Size.Values = (
          60.854166666666680000
          769.937500000000000000
          111.125000000000000000
          306.916666666666700000)
        Font.Height = -19
        FontSize = 14
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
        Height = 84
        Size.Values = (
          222.250000000000000000
          10.583333333333330000
          0.000000000000000000
          396.875000000000000000)
      end
      inherited subtitulo: TgtQRLabel
        Left = 180
        Top = 68
        Size.Values = (
          52.916666666666670000
          476.250000000000000000
          179.916666666666700000
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
        Top = 67
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          177.270833333333300000
          224.895833333333300000)
        FontSize = 8
      end
      inherited gtQRSysData2: TgtQRSysData
        Top = 45
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          119.062500000000000000
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
      Left = 57
      Top = 460
      Width = 700
      Size.Values = (
        105.833333333333300000
        1852.083333333333000000)
    end
    object qr_main: TQRBand
      Left = 57
      Top = 131
      Width = 700
      Height = 66
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = ChildBand1
      Size.Values = (
        174.625000000000000000
        1852.083333333333000000)
      BandType = rbDetail
      object qrdbtext2: TgtQRDBRichText
        Left = 160
        Top = 45
        Width = 433
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          423.333333333333300000
          119.062500000000000000
          1145.645833333333000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_DESCRICAO'
      end
      object QRDBText11: TgtQRDBText
        Left = 2
        Top = 27
        Width = 111
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          5.291666666666667000
          71.437500000000000000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_WBS_CODE'
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
      object QRLabel6: TgtQRLabel
        Left = 3
        Top = 45
        Width = 146
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          119.062500000000000000
          386.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o/Description :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TgtQRDBText
        Left = 0
        Top = 3
        Width = 128
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          7.937500000000000000
          338.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clSilver
        DataField = 'IDF_DESIGNACAO'
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
      object gtQRDBText2: TgtQRDBText
        Left = 598
        Top = 47
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1582.208333333333000000
          124.354166666666700000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_VALOR_AGREGADO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel2: TgtQRLabel
        Left = 582
        Top = 4
        Width = 115
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333340000
          1539.875000000000000000
          10.583333333333330000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valor Agregado / Added value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object ChildBand1: TQRChildBand
      Left = 57
      Top = 317
      Width = 700
      Height = 68
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = ChildBand1AfterPrint
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        179.916666666666700000
        1852.083333333333000000)
      ParentBand = qr_main
      object qrdbtext12: TgtQRDBRichText
        Left = 184
        Top = 47
        Width = 511
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          124.354166666666700000
          1352.020833333333000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'IDF_OBJETIVO_UC'
      end
      object gtQRDBText3: TgtQRDBText
        Left = 216
        Top = 23
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          60.854166666666680000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'IDF_TELADIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel3: TgtQRLabel
        Left = 31
        Top = 23
        Width = 174
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          82.020833333333340000
          60.854166666666680000
          460.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prot'#243'tipoTela/Screen Prototype'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel4: TgtQRLabel
        Left = 33
        Top = 47
        Width = 138
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          87.312500000000000000
          124.354166666666700000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o/Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel5: TgtQRLabel
        Left = 5
        Top = 5
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Use Case'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QR_METR: TQRChildBand
      Left = 57
      Top = 385
      Width = 700
      Height = 0
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
        0.000000000000000000
        1852.083333333333000000)
      ParentBand = ChildBand1
    end
    object QRSubDetail5: TQRSubDetail
      Left = 57
      Top = 197
      Width = 700
      Height = 0
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
        0.000000000000000000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
    end
    object ChildBand2: TQRChildBand
      Left = 57
      Top = 385
      Width = 700
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1852.083333333333000000)
      ParentBand = QR_METR
      object plinkin: TgtQRMemo
        Left = 4
        Top = 15
        Width = 227
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          10.583333333333300000
          39.687500000000000000
          600.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel15: TgtQRLabel
        Left = 4
        Top = 0
        Width = 234
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          0.000000000000000000
          619.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fluxos de Entrada/Input Data Groups'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object pLinkOut: TgtQRMemo
        Left = 272
        Top = 15
        Width = 227
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          719.666666666667000000
          39.687500000000000000
          600.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel16: TgtQRLabel
        Left = 272
        Top = 0
        Width = 232
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          719.666666666666800000
          0.000000000000000000
          613.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fluxos de Saida/Output Data Groups'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qr_ator: TQRSubDetail
      Left = 57
      Top = 197
      Width = 700
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_atorBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRLabel10: TgtQRLabel
        Left = 5
        Top = 1
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Atores/Actors :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText10: TgtQRDBText
        Left = 109
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
          288.395833333333400000
          2.645833333333333000
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
      object patorativ: TgtQRLabel
        Left = 277
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
          732.895833333333400000
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
    end
    object qr_func: TQRSubDetail
      Left = 57
      Top = 217
      Width = 700
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_funcBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText9: TgtQRDBText
        Left = 207
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
          547.687500000000000000
          2.645833333333333000
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
      object gtQRLabel11: TgtQRLabel
        Left = 5
        Top = 3
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          7.937500000000000000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tecnologia/Technology'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel12: TgtQRLabel
        Left = 207
        Top = 20
        Width = 133
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          547.687500000000000000
          52.916666666666670000
          351.895833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aplicativo/Software :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBRichText3: TgtQRDBRichText
        Left = 328
        Top = 1
        Width = 361
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333500000
          2.645833333333333000
          955.145833333333500000)
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
      object paplic: TgtQRLabel
        Left = 346
        Top = 20
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          915.458333333333400000
          52.916666666666670000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'paplic'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qr_evento: TQRSubDetail
      Left = 57
      Top = 257
      Width = 700
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_eventoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText1: TgtQRDBText
        Left = 251
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
          664.104166666666800000
          2.645833333333333000
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
      object gtQRLabel1: TgtQRLabel
        Left = 5
        Top = 1
        Width = 230
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          608.541666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Eventos de Neg'#243'cio/Business Events'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qr_regra: TQRSubDetail
      Left = 57
      Top = 279
      Width = 700
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_regraBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText13: TgtQRDBText
        Left = 251
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
          664.104166666666800000
          2.645833333333333000
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
      object gtQRLabel13: TgtQRLabel
        Left = 5
        Top = 1
        Width = 219
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          579.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Regras de Neg'#243'cio/Business Rules'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qr_local: TQRSubDetail
      Left = 57
      Top = 298
      Width = 700
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qr_localBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1852.083333333333000000)
      Master = qrp
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText14: TgtQRDBText
        Left = 285
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
          754.062500000000000000
          2.645833333333333000
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
      object gtQRLabel14: TgtQRLabel
        Left = 5
        Top = 1
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Local/Site :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QR_ti: TQRSubDetail
      Left = 57
      Top = 421
      Width = 700
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QR_tiBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        103.187500000000000000
        1852.083333333333000000)
      Master = qrp
      HeaderBand = ChildBand1
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRLabel17: TgtQRLabel
        Left = 5
        Top = 1
        Width = 155
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          2.645833333333333000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Alternativos/Alternatives'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText15: TgtQRDBText
        Left = 7
        Top = 17
        Width = 311
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          44.979166666666670000
          822.854166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'TI_REQ_AP'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBRichText1: TgtQRDBRichText
        Left = 331
        Top = 17
        Width = 356
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          875.770833333333400000
          44.979166666666670000
          941.916666666666800000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'TI_ALTERNATE'
      end
    end
  end
  inherited gtQRPDFExport1: TgtQRPDFExport
    Left = 34
    Top = 6
  end
  inherited gtQRHTMLExport1: TgtQRHTMLExport
    Left = 130
    Top = 6
  end
  inherited gtQRXHTMLExport1: TgtQRXHTMLExport
    Left = 218
    Top = 6
  end
  inherited gtQRRTFExport1: TgtQRRTFExport
    Left = 386
    Top = 6
  end
  inherited gtQRExcelExport1: TgtQRExcelExport
    Left = 522
    Top = 6
  end
  inherited gtQRTextExport1: TgtQRTextExport
    Left = 578
    Top = 6
  end
  inherited gtQRGIFExport1: TgtQRGIFExport
    Left = 602
    Top = 6
  end
  inherited gtQRGIFExport2: TgtQRGIFExport
    Left = 650
    Top = 6
  end
  inherited gtQRJPEGExport1: TgtQRJPEGExport
    Left = 714
    Top = 6
  end
  inherited gtQRBMPExport1: TgtQRBMPExport
    Left = 482
    Top = 6
  end
  inherited gtQREMFExport1: TgtQREMFExport
    Left = 304
    Top = 6
  end
  inherited gtQRWMFExport1: TgtQRWMFExport
    Left = 434
    Top = 6
  end
end
