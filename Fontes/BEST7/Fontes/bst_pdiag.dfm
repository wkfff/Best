object frm_pdiag: Tfrm_pdiag
  Left = 175
  Top = 104
  Width = 798
  Height = 570
  HorzScrollBar.Position = 370
  VertScrollBar.Position = 78
  Caption = 'frm_pdiag'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PrintScale = poNone
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object qrp: TQuickRep
    Left = -349
    Top = -63
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
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
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2100.000000000000000000
      180.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object ph1: TQRBand
      Left = 19
      Top = 68
      Width = 1085
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ph1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        190.500000000000000000
        2870.729166666667000000)
      BandType = rbPageHeader
      object pwbs: TLabel
        Left = 110
        Top = 44
        Width = 40
        Height = 18
        Caption = '          '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object ldesc: TQRLabel
        Left = 133
        Top = 44
        Width = 109
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          351.895833333333400000
          116.416666666666700000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'dddddddddddd'
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
      object pr_proj: TQRLabel
        Left = 133
        Top = 24
        Width = 306
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          351.895833333333400000
          63.500000000000000000
          809.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'
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
      object pr_cli: TQRLabel
        Left = 135
        Top = 2
        Width = 307
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          357.187500000000000000
          5.291666666666667000
          812.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'cccccccccccccccccccccccccccccccccc'
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
      object pLogo: TQRImage
        Left = 4
        Top = 3
        Width = 32
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666700000
          10.583333333333300000
          7.937500000000000000
          84.666666666666700000)
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF00FFFFFF7CCCCCCCCCCC7FFFFFFFFFFFFFFFFFFFF7CCCCCCCCCCC7FFFF
          FFFFFFFFFFFFFFFF7CCCCCCCCCCC7FFFFFFFFFFFFFFFFFFFF7CCCCCCCCCCC7FF
          FFFFFFFFFFFFFFFFFF7CCCCCCCCCCC7FFFFFFFFFFFFFFFFFFFF7CCCCCCCCCCC7
          7777777F88888888888888888888888083333333F8888888888888FFFFFFFFF0
          78333333FF8888888888888FFFFFFFF0B7833333FF78888888888888FF888870
          BB733333FFF788888888888888884440BBB38333FFFFFFFFFFFFF8FF88888840
          BBB3FFFFFFFFFFFFFFFFF8F788888880BBB3FFFFFFFFFFFFFFFFF8F888778880
          BBB3FFFFFFFFFFFFFFFFF8F787BB8880BBB3FFFFFFFFFFFFFFFFF8F787BB8880
          BBB3FFFFFFFFFFFFFFFF7888888884447BB3FFFFFFFFFFFFFFFF757FF8888887
          77B3FFFFFFFFFFFFFFFF7558F87888777773FFFFFFFFFFFFFFFF755588777777
          7778FFFFFFFFFFFFFFFF7555588888888888FFFFFFFFFFFFFFFF755557FFFFFF
          FFFFFFFFFFFFFFFFFFFF755557FFFFFFFFFFFFFFFFFFFFFFFFFF755557FFFFFF
          FFFFFFFFFFFFFFFFFFFF755557FFFFFFFFFFFFFFFFFFFFFFFFFF755557FFFFFF
          FFFFFFFFFFFFFFFFFFFF755557FFFFFFFFFFFFFFFFFFFFFFFFFF755557FFFFFF
          FFFFFFFFFFFFFFFFFFFFF75557FFFFFFFFFFFFFFFFFFFFFFFFFFFF7557FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF757FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77FFFFFF
          FFFFFFFF00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000}
      end
      object QRSysData1: TQRSysData
        Left = 980
        Top = 8
        Width = 45
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2592.916666666667000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 980
        Top = 50
        Width = 45
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2592.916666666667000000
          132.291666666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#237'vel :'
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
      object qrnivel: TQRLabel
        Left = 1031
        Top = 50
        Width = 45
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2727.854166666667000000
          132.291666666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '           '
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
    object QRBand1: TQRBand
      Left = 19
      Top = 140
      Width = 1085
      Height = 605
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
        1600.729166666667000000
        2870.729166666667000000)
      BandType = rbDetail
      object pdiag: TQRImage
        Left = 7
        Top = 6
        Width = 1072
        Height = 595
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1574.270833333333000000
          18.520833333333330000
          15.875000000000000000
          2836.333333333333000000)
        AutoSize = True
        Center = True
        Stretch = True
      end
    end
  end
end
