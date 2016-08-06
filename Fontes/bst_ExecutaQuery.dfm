object frm_ExecutaQuery: Tfrm_ExecutaQuery
  Left = 206
  Top = 195
  Width = 865
  Height = 492
  Caption = 'Executa Query'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 857
    Height = 409
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 792
    Top = 424
  end
  object ADOTable1: TADOTable
    TableDirect = True
    Left = 824
    Top = 424
  end
end
