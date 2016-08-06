object frm_preprint: Tfrm_preprint
  Left = 510
  Top = 160
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o do Diagrama'
  ClientHeight = 234
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 129
    Top = 207
    Width = 81
    Height = 22
    Caption = 'Preview'
    OnClick = SpeedButton1Click
  end
  object Image1: TImage
    Left = 346
    Top = 8
    Width = 16
    Height = 16
    Cursor = crHandPoint
    AutoSize = True
    Center = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000CE0E0000D80E0000100000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00222222222222222200000000000022000FFFFFFFFFF020000FFFFFFF0000
      80020FFFFFF0877808220FFFFF0877E880220FFFFF07777870220FFFFF07E778
      70220FFFFF08EE7880220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF0
      22220FFFFFFF000022220FFFFFFF070222220FFFFFFF00222222000000000222
      2222}
    Visible = False
    OnClick = Image1Click
  end
  object Label6: TLabel
    Left = 366
    Top = 10
    Width = 42
    Height = 14
    Cursor = crHandPoint
    Caption = 'Preview'
    Visible = False
    OnClick = Image1Click
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 1
    Width = 336
    Height = 204
    Caption = 'Diagrama'
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 111
      Width = 30
      Height = 14
      Caption = 'Zoom'
    end
    object ckFundo: TCheckBox
      Left = 6
      Top = 66
      Width = 171
      Height = 17
      Caption = 'Imprime Cor de Fundo'
      TabOrder = 0
    end
    object ckback: TCheckBox
      Left = 6
      Top = 84
      Width = 171
      Height = 17
      Caption = 'Imprime Imagem de fundo'
      TabOrder = 1
    end
    object rg: TRadioGroup
      Left = 4
      Top = 19
      Width = 141
      Height = 45
      Caption = 'Sele'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'Imprime tudo'
        'Imprime Sele'#231#227'o')
      TabOrder = 2
    end
    object pZoom: TSpinEdit
      Left = 44
      Top = 105
      Width = 51
      Height = 23
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 100
    end
    object ck_fit1: TCheckBox
      Left = 6
      Top = 134
      Width = 139
      Height = 17
      Caption = 'Ajusta a p'#225'gina'
      TabOrder = 4
    end
    object rdg_imp: TRadioGroup
      Left = 176
      Top = 145
      Width = 100
      Height = 49
      Caption = 'Orienta'#231#227'o'
      ItemIndex = 1
      Items.Strings = (
        'Retrato'
        'Paisagem')
      TabOrder = 5
    end
    object stret: TCheckBox
      Left = 6
      Top = 152
      Width = 139
      Height = 17
      Caption = 'Estica desenho'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object GroupBox2: TGroupBox
      Left = 176
      Top = 19
      Width = 151
      Height = 127
      Caption = 'Margens(mm)'
      TabOrder = 7
      object Label2: TLabel
        Left = 9
        Top = 21
        Width = 46
        Height = 14
        Caption = 'Superior'
      end
      object Label3: TLabel
        Left = 9
        Top = 49
        Width = 41
        Height = 14
        Caption = 'Inferior'
      end
      object Label4: TLabel
        Left = 9
        Top = 74
        Width = 51
        Height = 14
        Caption = 'Esquerda'
      end
      object Label5: TLabel
        Left = 9
        Top = 99
        Width = 38
        Height = 14
        Caption = 'Direita'
      end
      object wsup: TSpinEdit
        Left = 83
        Top = 18
        Width = 61
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 0
        Value = 18
      end
      object winf: TSpinEdit
        Left = 83
        Top = 44
        Width = 61
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 8
      end
      object wesq: TSpinEdit
        Left = 83
        Top = 69
        Width = 61
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 8
      end
      object wdiret: TSpinEdit
        Left = 83
        Top = 94
        Width = 61
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 3
        Value = 8
      end
    end
  end
end
