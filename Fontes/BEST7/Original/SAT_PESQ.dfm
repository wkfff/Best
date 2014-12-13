inherited frm_pesq: Tfrm_pesq
  Left = 270
  Top = 161
  Caption = 'frm_pesq'
  ClientHeight = 306
  ClientWidth = 354
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 306
    Align = alClient
    TabOrder = 0
    object IncludeBtn: TSpeedButton
      Left = 160
      Top = 96
      Width = 24
      Height = 24
      Caption = '>'
      OnClick = IncludeBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 160
      Top = 128
      Width = 24
      Height = 24
      Caption = '<'
      OnClick = ExcludeBtnClick
    end
    object SpeedButton1: TSpeedButton
      Left = 152
      Top = 240
      Width = 41
      Height = 22
      Caption = 'OK'
      OnClick = SpeedButton1Click
    end
    object SRC: TTreeView
      Left = 16
      Top = 32
      Width = 137
      Height = 193
      Indent = 19
      TabOrder = 0
      OnDblClick = SRCDblClick
    end
    object DST: TTreeView
      Left = 192
      Top = 32
      Width = 137
      Height = 193
      Indent = 19
      TabOrder = 1
      OnDblClick = DSTDblClick
    end
  end
end
