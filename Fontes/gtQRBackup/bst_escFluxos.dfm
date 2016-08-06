inherited frm_escFluxos: Tfrm_escFluxos
  Left = 387
  Top = 206
  Caption = 'Fluxos de Dados'
  ClientHeight = 63
  ClientWidth = 210
  Color = 16776957
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object rdg: TRadioGroup
    Left = 0
    Top = 0
    Width = 210
    Height = 63
    Align = alClient
    Caption = 'Fluxo de Dados'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    Items.Strings = (
      'Novo Fluxo de Dados'
      'Obter Fluxo da Lista')
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnClick = rdgClick
  end
end
