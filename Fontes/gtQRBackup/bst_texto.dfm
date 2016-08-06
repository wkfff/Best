object frm_texto: Tfrm_texto
  Left = 503
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = ' '
  ClientHeight = 54
  ClientWidth = 115
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Edit1: TEdit
    Left = 12
    Top = 64
    Width = 153
    Height = 22
    MaxLength = 50
    TabOrder = 0
    Visible = False
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 58
    Top = 94
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object rdg: TRadioGroup
    Left = 0
    Top = 0
    Width = 115
    Height = 54
    Align = alClient
    Color = clBtnFace
    Items.Strings = (
      'Sim'
      'N'#227'o')
    ParentColor = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
