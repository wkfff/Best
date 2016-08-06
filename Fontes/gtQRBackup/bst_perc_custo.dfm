inherited frm_perc_custo: Tfrm_perc_custo
  Left = 321
  Top = 149
  Caption = 'Percentual de Passagem'
  ClientHeight = 62
  ClientWidth = 246
  Color = clBtnFace
  Font.Height = -12
  Font.Name = 'Calibri'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 137
    Height = 14
    Caption = 'Percentual de passagem:'
    WordWrap = True
  end
  object SpeedButton1: TSpeedButton
    Left = 90
    Top = 36
    Width = 89
    Height = 22
    Caption = 'OK'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 149
    Top = 11
    Width = 29
    Height = 22
    TabOrder = 0
    Text = '100'
    OnExit = Edit1Exit
  end
end
