object Form1: TForm1
  Left = 216
  Top = 160
  Width = 640
  Height = 498
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Conn: TADOConnection
    LoginPrompt = False
    Left = 8
    Top = 8
  end
  object TBCMD_DIVERSOS: TADOTable
    Connection = Conn
    LockType = ltReadOnly
    TableDirect = True
    TableName = 'CMD_DIVERSOS'
    Left = 40
    Top = 8
  end
end
