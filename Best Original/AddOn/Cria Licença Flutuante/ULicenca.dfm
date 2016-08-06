object fQtdLicenca: TfQtdLicenca
  Left = 550
  Top = 251
  BorderStyle = bsSingle
  Caption = 'Quantidade de Licen'#231'as'
  ClientHeight = 198
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 156
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Licen'#231'a Servidor'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Id do Cliente'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 56
    Height = 13
    Caption = 'Quant. Dias'
  end
  object Label4: TLabel
    Left = 16
    Top = 108
    Width = 53
    Height = 13
    Caption = 'Data Limite'
  end
  object Label5: TLabel
    Left = 116
    Top = 147
    Width = 66
    Height = 13
    Caption = 'N'#250'mero Serial'
  end
  object Label6: TLabel
    Left = 156
    Top = 68
    Width = 76
    Height = 13
    Caption = 'Licen'#231'a Reader'
  end
  object bGravarLicenca: TButton
    Left = 168
    Top = 118
    Width = 108
    Height = 25
    Caption = 'Grava N'#250'm. M'#225'q.'
    Enabled = False
    TabOrder = 0
    Visible = False
    OnClick = bGravarLicencaClick
  end
  object eIdCliente: TEdit
    Left = 16
    Top = 24
    Width = 100
    Height = 21
    TabOrder = 1
  end
  object eQuantDias: TEdit
    Left = 16
    Top = 76
    Width = 100
    Height = 21
    TabOrder = 2
  end
  object bGeraSerial: TButton
    Left = 16
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Gerar Serial'
    TabOrder = 3
    OnClick = bGeraSerialClick
  end
  object eSerial: TEdit
    Left = 116
    Top = 162
    Width = 161
    Height = 21
    TabOrder = 4
  end
  object seReader: TSpinEdit
    Left = 156
    Top = 84
    Width = 81
    Height = 22
    MaxValue = 250
    MinValue = 1
    TabOrder = 5
    Value = 0
  end
  object eqtdLicenca: TSpinEdit
    Left = 156
    Top = 24
    Width = 81
    Height = 22
    MaxValue = 250
    MinValue = 1
    TabOrder = 6
    Value = 0
  end
  object meDataLimite: TDateTimePicker
    Left = 16
    Top = 124
    Width = 97
    Height = 21
    Date = 40093.583724756940000000
    Time = 40093.583724756940000000
    TabOrder = 7
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\BEST\Dados\case2' +
      '000.mdb;Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 108
    Top = 104
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'BST_VALIDACAO'
    Left = 136
    Top = 104
  end
end
