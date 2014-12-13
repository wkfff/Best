object frm_enga: Tfrm_enga
  Left = 426
  Top = 227
  Width = 544
  Height = 375
  Caption = 'frm_enga'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 72
    Width = 489
    Height = 241
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object tabelas: TADODataSet
    Parameters = <>
    Left = 40
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = tabelas
    Left = 104
    Top = 8
  end
end
