object frm_enc: Tfrm_enc
  Left = 465
  Top = 196
  Width = 544
  Height = 375
  Caption = 'Enciclop'#233'dia'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbg: TDBGrid
    Left = 0
    Top = 64
    Width = 513
    Height = 177
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ALIAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVIDOR'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DADOS'
        Width = 176
        Visible = True
      end>
  end
end
