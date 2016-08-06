object frm_dmicon: Tfrm_dmicon
  Left = 268
  Top = 170
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frm_dmicon'
  ClientHeight = 55
  ClientWidth = 406
  Color = 16776957
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 6
    Width = 108
    Height = 13
    Caption = 'Descri'#231#227'o da Conex'#227'o'
  end
  object Edit1: TEdit
    Left = 4
    Top = 25
    Width = 400
    Height = 21
    BevelInner = bvLowered
    ParentColor = True
    TabOrder = 0
    OnDblClick = Edit1Exit
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
end
