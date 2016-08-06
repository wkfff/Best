object frm_enttext: Tfrm_enttext
  Left = 335
  Top = 236
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frm_enttext'
  ClientHeight = 34
  ClientWidth = 168
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 2
    Top = 5
    Width = 161
    Height = 21
    BevelInner = bvLowered
    MaxLength = 255
    ParentColor = True
    TabOrder = 0
    OnDblClick = Edit1Exit
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
end
