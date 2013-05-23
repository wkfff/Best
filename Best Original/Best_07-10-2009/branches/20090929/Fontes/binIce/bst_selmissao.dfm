inherited frm_selmissao: Tfrm_selmissao
  Left = 308
  Top = 231
  BorderIcons = [biSystemMenu]
  Caption = 'Sele'#231#227'o'
  ClientHeight = 103
  ClientWidth = 217
  Color = clBtnFace
  Font.Height = -12
  Font.Name = 'Calibri'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 68
    Top = 78
    Width = 73
    Height = 22
    Caption = 'Exportar'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object rdg: TRadioGroup
    Left = 2
    Top = 2
    Width = 211
    Height = 71
    Caption = 'Selecionar'
    Items.Strings = (
      'Exportar apenas N'#237'vel em Foco'
      'Exportar N'#237'veis abaixo')
    TabOrder = 0
  end
end
