object frm_prnProp: Tfrm_prnProp
  Left = 279
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Propriedades'
  ClientHeight = 321
  ClientWidth = 418
  Color = 16380658
          Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 184
    Top = 276
    Width = 73
    Height = 22
    Caption = 'Fechar'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 92
    Height = 13
    Caption = 'Margem Esquerda :'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 71
    Height = 13
    Caption = 'Margem Direita'
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 86
    Height = 13
    Caption = 'Margem Superior :'
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 79
    Height = 13
    Caption = 'Margem Inferior :'
  end
  object Label5: TLabel
    Left = 8
    Top = 248
    Width = 28
    Height = 13
    Caption = 'Borda'
  end
  object Label6: TLabel
    Left = 8
    Top = 174
    Width = 85
    Height = 13
    Caption = 'Margem Rodap'#233' :'
  end
  object Label7: TLabel
    Left = 8
    Top = 206
    Width = 101
    Height = 13
    Caption = 'Margem Cabe'#231'alho : '
  end
  object cmb_borda: TComboBox
    Left = 130
    Top = 240
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = '0 - Sem Borda'
    OnCloseUp = cmb_bordaCloseUp
    Items.Strings = (
      '0 - Sem Borda'
      '1 - Borda Superior'
      '2-  Borda Inferior'
      '3 - Borda Superior e Inferior'
      '4 - Quadrado'
      '5-  Borda Superior Pontilhada'
      '6-  Borda Inferior Pontilhada'
      '7 - Borda Superior e Inferior Pontilhada'
      '8 - Quadrado Pontilhada'
      '')
  end
  object Edit4: TEdit
    Left = 126
    Top = 141
    Width = 43
    Height = 21
    TabOrder = 1
  end
  object tbmi: TTrackBar
    Left = 178
    Top = 141
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 2
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbmiChange
  end
  object tbms: TTrackBar
    Left = 178
    Top = 109
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 3
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbmsChange
  end
  object Edit5: TEdit
    Left = 126
    Top = 109
    Width = 43
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 126
    Top = 77
    Width = 43
    Height = 21
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 126
    Top = 47
    Width = 43
    Height = 21
    TabOrder = 6
  end
  object tbme: TTrackBar
    Left = 178
    Top = 45
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 7
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbmeChange
  end
  object tbmd: TTrackBar
    Left = 178
    Top = 77
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 8
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbmdChange
  end
  object Edit1: TEdit
    Left = 126
    Top = 171
    Width = 43
    Height = 21
    TabOrder = 9
  end
  object Edit6: TEdit
    Left = 126
    Top = 203
    Width = 43
    Height = 21
    TabOrder = 10
  end
  object tbcab: TTrackBar
    Left = 178
    Top = 203
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 11
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbcabChange
  end
  object tbrod: TTrackBar
    Left = 178
    Top = 171
    Width = 150
    Height = 21
    Max = 1500
    Orientation = trHorizontal
    Frequency = 10
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 12
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = tbrodChange
  end
end
