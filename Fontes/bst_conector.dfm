object frm_conector: Tfrm_conector
  Left = 366
  Top = 190
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conector'
  ClientHeight = 54
  ClientWidth = 134
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Edit1: TEdit
    Left = 40
    Top = 8
    Width = 49
    Height = 22
    TabOrder = 0
    Text = ' '
    OnDblClick = Edit1DblClick
    OnKeyPress = Edit1KeyPress
  end
end
