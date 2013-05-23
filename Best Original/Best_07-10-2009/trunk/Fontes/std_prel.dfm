object frm_pvertstd: Tfrm_pvertstd
  Left = 196
  Top = 129
  Width = 806
  Height = 543
  Caption = 'frm_pvertstd'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrp: TQuickRep
    Left = 33
    Top = 5
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AfterPreview = qrpAfterPreview
    BeforePrint = qrpBeforePrint
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnStartPage = qrpStartPage
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      200.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      250.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object PageFooterBand1: TQRBand
      Left = 94
      Top = 182
      Width = 662
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        1751.541666666667000000)
      BandType = rbPageFooter
      object QRLabel1: TgtQRLabel
        Left = 8
        Top = 22
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          58.208333333333340000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Version date :'
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
      object QRLabel8: TgtQRLabel
        Left = 204
        Top = 22
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          539.750000000000000000
          58.208333333333340000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Responsible'
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
      object QRLabel9: TgtQRLabel
        Left = 8
        Top = 6
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          15.875000000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Version :'
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
      object QRLabel2: TgtQRLabel
        Left = 426
        Top = 22
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1127.125000000000000000
          58.208333333333340000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Approval :'
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
    object ph1: TQRBand
      Left = 94
      Top = 38
      Width = 662
      Height = 104
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ph1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        275.166666666666700000
        1751.541666666667000000)
      BandType = rbPageHeader
      object titulo: TgtQRLabel
        Left = 291
        Top = 40
        Width = 93
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          769.937500000000000000
          105.833333333333300000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '                       '
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
      object pr_cli: TgtQRLabel
        Left = 380
        Top = 2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1005.416666666667000000
          5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'pr_cli'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object pr_proj: TgtQRLabel
        Left = 379
        Top = 19
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          50.270833333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'pr_proj'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object pLogo: TgtQRImage
        Left = 0
        Top = 0
        Width = 150
        Height = 97
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          256.645833333333400000
          0.000000000000000000
          0.000000000000000000
          396.875000000000000000)
        AutoSize = True
      end
      object subtitulo: TgtQRLabel
        Left = 270
        Top = 80
        Width = 129
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          714.375000000000000000
          211.666666666666700000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '                                '
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
      object tot_page: TgtQRLabel
        Left = 608
        Top = 120
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1608.666666666670000000
          317.500000000000000000
          129.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRSysData1: TgtQRSysData
        Left = 569
        Top = 79
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          209.020833333333300000
          224.895833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object gtQRSysData2: TgtQRSysData
        Left = 569
        Top = 57
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1505.479166666667000000
          150.812500000000000000
          224.895833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object gtQRSysData3: TgtQRSysData
        Left = 569
        Top = 9
        Width = 85
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1505.479166666667000000
          23.812500000000000000
          224.895833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 12
      end
    end
    object qr_sum: TQRBand
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
      BeforePrint = qr_sumBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1751.541666666667000000)
      BandType = rbSummary
    end
  end
  object gtQRPDFExport1: TgtQRPDFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = True
    Preferences.OpenAfterGenerate = True
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    BackgroundColor = clWhite
    BackgroundImageDisplayType = dtCenter
    Compressed = True
    CompressionMethod = cmMaxCompress
    DocInfo.Creator = 'QuickReport'
    ExportImageFormat = ifBMP
    ImageDPI = -1
    ImagePixelFormat = pf24bit
    IncludedItems = [ikText, ikImage, ikLine, ikShape, ikRichText]
    JPEGQuality = 100
    OptimizeBackgroundPainting = False
    RichTextDPI = 300
    RichTextEncodingType = rtImage
    Left = 40
    Top = 8
  end
  object gtQRHTMLExport1: TgtQRHTMLExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    Preferences.AutoScroll = False
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    BackgroundColor = clWhite
    BackgroundImageDisplayType = dtCenter
    DocInfo.Creator = 'QuickReport'
    ExportImageFormat = ifJPG
    ImageDPI = -1
    ImagePixelFormat = pf24bit
    IncludedItems = [ikText, ikImage, ikLine, ikShape, ikRichText]
    JPEGQuality = 100
    Navigator.Show = True
    Navigator.LinkFont.Charset = DEFAULT_CHARSET
    Navigator.LinkFont.Color = clBlue
    Navigator.LinkFont.Height = -24
    Navigator.LinkFont.Name = 'Wingdings'
    Navigator.LinkFont.Style = []
    OptimizeForIE = True
    OptimizeBackgroundPainting = False
    OutputScriptsToJavaScriptFile = True
    OutputStylesToCSSFile = True
    RichTextEncodingType = rtImage
    Left = 136
    Top = 8
  end
  object gtQRXHTMLExport1: TgtQRXHTMLExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = True
    Preferences.OpenAfterGenerate = True
    Preferences.AutoScroll = False
    Preferences.PageEndLines = False
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    BackgroundColor = clWhite
    BackgroundImageDisplayType = dtCenter
    DocInfo.Creator = 'QuickReport'
    ExportImageFormat = ifJPG
    ImageDPI = -1
    ImagePixelFormat = pf24bit
    IncludedItems = [ikText, ikImage, ikLine, ikShape, ikRichText]
    JPEGQuality = 100
    Navigator.Show = True
    Navigator.LinkFont.Charset = DEFAULT_CHARSET
    Navigator.LinkFont.Color = clBlue
    Navigator.LinkFont.Height = -24
    Navigator.LinkFont.Name = 'Wingdings'
    Navigator.LinkFont.Style = []
    OptimizeForIE = True
    OptimizeBackgroundPainting = False
    OutputScriptsToJavaScriptFile = True
    OutputStylesToCSSFile = True
    RichTextEncodingType = rtImage
    Left = 224
    Top = 8
  end
  object gtQRRTFExport1: TgtQRRTFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = True
    Preferences.OpenAfterGenerate = True
    Preferences.GraphicDataInBinary = True
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    BackgroundImageDisplayType = dtCenter
    DocInfo.Creator = 'QuickReport'
    ExportImageFormat = ifJPG
    IncludedItems = [ikText, ikImage, ikLine, ikShape, ikRichText]
    ImagePixelFormat = pf24bit
    ImageDPI = -1
    JPEGQuality = 100
    OptimizeBackgroundPainting = False
    RichTextDPI = -1
    RichTextEncodingType = rtImage
    Left = 392
    Top = 8
  end
  object gtQRExcelExport1: TgtQRExcelExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = True
    Preferences.OpenAfterGenerate = True
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    BackgroundImageDisplayType = dtTile
    ImagePixelFormat = pf24bit
    ImageDPI = -1
    RichTextDPI = -1
    RichTextEncodingType = rtPlainText
    Formatting.DefaultGridDimension.Height = 12.700000000000000000
    Formatting.DefaultGridDimension.Width = 8.430000000000000000
    IncludedItems = [ikText, ikRichText]
    ExportImageFormat = ifBMP
    Left = 528
    Top = 8
  end
  object gtQRTextExport1: TgtQRTextExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    Preferences.OpenAfterGenerate = True
    RestrictToPages = True
    Version = '3.01'
    ShowSetupDialog = True
    LineSpacing = lsActual
    ContinuousMode = True
    XScaleFactor = 1.000000000000000000
    Left = 584
    Top = 8
  end
  object gtQRGIFExport1: TgtQRGIFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Monochrome = False
    PixelFormat = pf24bit
    Left = 608
    Top = 8
  end
  object gtQRGIFExport2: TgtQRGIFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Monochrome = False
    PixelFormat = pf24bit
    Left = 656
    Top = 8
  end
  object gtQRJPEGExport1: TgtQRJPEGExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Monochrome = False
    PixelFormat = pf24bit
    ProgressiveEncoding = True
    Left = 720
    Top = 8
  end
  object gtQRBMPExport1: TgtQRBMPExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Monochrome = False
    PixelFormat = pf24bit
    Left = 488
    Top = 8
  end
  object gtQREMFExport1: TgtQREMFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Left = 310
    Top = 8
  end
  object gtQRWMFExport1: TgtQRWMFExport
    About = 'Gnostice QuickReport Export (www.gnostice.com)'
    Visible = False
    RestrictToPages = True
    Version = '3.01'
    Left = 440
    Top = 8
  end
  object gtQRExportHub1: TgtQRExportHub
    VisibleFilters = [fkPDF, fkXHTML, fkRTF, fkExcel]
    PDF.Preferences.OpenAfterGenerate = True
    PDF.DocInfo.Creator = 'QuickReport'
    PDF.RichTextDPI = 300
    PDF.OptimizeBackgroundPainting = False
    PDF.BackgroundImageDisplayType = dtCenter
    HTML.Preferences.AutoScroll = False
    HTML.Visible = False
    HTML.DocInfo.Creator = 'QuickReport'
    HTML.OptimizeBackgroundPainting = False
    HTML.RichTextEncodingType = rtImage
    HTML.BackgroundImageDisplayType = dtCenter
    HTML.Navigator.Show = True
    HTML.Navigator.LinkFont.Charset = DEFAULT_CHARSET
    HTML.Navigator.LinkFont.Color = clBlue
    HTML.Navigator.LinkFont.Height = -24
    HTML.Navigator.LinkFont.Name = 'Wingdings'
    HTML.Navigator.LinkFont.Style = []
    XHTML.Preferences.OpenAfterGenerate = True
    XHTML.Preferences.AutoScroll = False
    XHTML.Preferences.PageEndLines = False
    XHTML.DocInfo.Creator = 'QuickReport'
    XHTML.OptimizeBackgroundPainting = False
    XHTML.RichTextEncodingType = rtImage
    XHTML.BackgroundImageDisplayType = dtCenter
    XHTML.Navigator.Show = True
    XHTML.Navigator.LinkFont.Charset = DEFAULT_CHARSET
    XHTML.Navigator.LinkFont.Color = clBlue
    XHTML.Navigator.LinkFont.Height = -24
    XHTML.Navigator.LinkFont.Name = 'Wingdings'
    XHTML.Navigator.LinkFont.Style = []
    RTF.Preferences.OpenAfterGenerate = True
    RTF.Preferences.GraphicDataInBinary = True
    RTF.DocInfo.Creator = 'QuickReport'
    RTF.OptimizeBackgroundPainting = False
    RTF.BackgroundImageDisplayType = dtCenter
    RTF.IncludeRichText = False
    Text.Preferences.OpenAfterGenerate = True
    Text.Visible = False
    Text.DocInfo.Creator = 'QuickReport'
    Text.OptimizeBackgroundPainting = False
    Text.LineSpacing = lsActual
    Text.XScaleFactor = 1.000000000000000000
    Excel.Preferences.OpenAfterGenerate = True
    Excel.DocInfo.Creator = 'QuickReport'
    Excel.ExportImageFormat = ifBMP
    Excel.IncludedItems = [ikText, ikRichText]
    Excel.OptimizeBackgroundPainting = False
    Excel.RichTextEncodingType = rtPlainText
    Excel.BackgroundImageDisplayType = dtTile
    Excel.Formatting.DefaultGridDimension.Height = 12.700000000000000000
    Excel.Formatting.DefaultGridDimension.Width = 8.430000000000000000
    GIF.Visible = False
    JPEG.Visible = False
    JPEG.ProgressiveEncoding = True
    BMP.Visible = False
    EMF.Visible = False
    WMF.Visible = False
    Left = 332
    Top = 51
  end
end
