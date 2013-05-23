inherited frm_pativ1: Tfrm_pativ1
  Left = 238
  Top = 188
  Width = 786
  Height = 577
  HorzScrollBar.Position = 38
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        164.041666666666700000
        1751.541666666667000000)
      BandType = rbDetail
    end
    inherited ph1: TQRBand
      Height = 93
      Size.Values = (
        246.062500000000000000
        1751.541666666667000000)
    end
    inherited qr_sum: TQRBand
      Top = 193
      Size.Values = (
        105.833333333333300000
        1751.541666666667000000)
    end
  end
end
