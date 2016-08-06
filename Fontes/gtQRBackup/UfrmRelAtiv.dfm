object frmRelAtiv: TfrmRelAtiv
  Left = 239
  Top = 103
  Width = 894
  Height = 500
  Caption = 'frmRelAtiv'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlrAtiv: TRLReport
    Left = 4
    Top = 4
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    AfterPrint = rlrAtivAfterPrint
    BeforePrint = rlrAtivBeforePrint
    object rlbTopPag: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 79
      BandType = btHeader
    end
    object rlbAtividade: TRLBand
      Left = 38
      Top = 117
      Width = 718
      Height = 132
      object RLDBText1: TRLDBText
        Left = 84
        Top = 56
        Width = 70
        Height = 16
      end
      object RLLabel1: TRLLabel
        Left = 56
        Top = 32
        Width = 58
        Height = 16
      end
      object RLDBRichText1: TRLDBRichText
        Left = 204
        Top = 88
        Width = 185
        Height = 18
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 249
      Width = 718
      Height = 16
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v3.23 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 624
    Top = 20
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 664
    Top = 20
  end
end
