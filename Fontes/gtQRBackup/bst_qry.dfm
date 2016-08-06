object frm_qry: Tfrm_qry
  Left = 218
  Top = 89
  Width = 989
  Height = 684
  Caption = 'SQL'
  Color = 16776957
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClick = FormClick
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton3: TSpeedButton
    Left = 663
    Top = 40
    Width = 134
    Height = 22
    Caption = 'Mostrar Tabelas'
    Flat = True
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777777700000007444444444444777700000007488
      8888888847777000000074777777770747777000000074700700700047777000
      000074777777770007777000000074700700700B80777000000074777777770B
      707770000000744444444440B8077000000074F44F44F440B707700000007444
      444444440B80700000007777777777770B807000000077777777777770050000
      0000777777777777705500000000777777777777770070000000777777777777
      777770000000}
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 811
    Top = 40
    Width = 153
    Height = 22
    Caption = 'Aplica'#231#227'o dos Dados'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
      33333F3FFFFFFFFFFF3F03000000000003037377777777777F73330800808080
      03333F7F77F7F7F77F3F0308008080800303737F77F737F77F73330080080008
      03333F77F77F777F7F3F03000000000003037377777777777373333333333333
      33333F3F3F3F3F3F3F3F03030303030303037373737373737373333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton4Click
  end
  object QRY_MEM: TMemo
    Left = 9
    Top = 40
    Width = 648
    Height = 121
    ScrollBars = ssVertical
    TabOrder = 0
    OnEnter = QRY_MEMEnter
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 168
    Width = 648
    Height = 417
    DataSource = DataSource1
    FixedColor = 16744576
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -13
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 33
    Align = alTop
    Caption = ' '
    ParentColor = True
    TabOrder = 2
    object LEDOFF: TImage
      Left = 404
      Top = 8
      Width = 17
      Height = 18
      Picture.Data = {
        07544269746D617076010000424D760100000000000076000000280000002000
        000010000000010004000000000000010000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000007F7F
        7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF003333333333333333333333FFFFF3333333333000003333333333F777773F
        F33333300887770033333337733FFF773F33330887000777033333733F777FFF
        73F3308800000007703337F37777777FF7F33080000000007033373777777777
        F73F08700022200077037F3777333777FF7F08000222220007037F777F333377
        7F7F0F000222220007037F777F3333777F7F0F000822220008037F777FF33377
        737F0F7000882000780373F777FFF777F373308000000000803337F777777777
        37F330F8000000088033373F777777733733330F8700078803333373FF77733F
        733333300FFF88003333333773FFFF7733333333300000333333333337777733
        3333}
    end
    object LEDON: TImage
      Left = 404
      Top = 8
      Width = 17
      Height = 18
      Picture.Data = {
        07544269746D617076010000424D760100000000000076000000280000002000
        000010000000010004000000000000010000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000007F7F
        7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF003333333333333333333333FFFFF3333333333000003333333333F777773F
        F33333300887770033333337733FFF773F33330887000777033333733F777FFF
        73F330880FAFAF07703337F37733377FF7F33080F00000F07033373733777337
        F73F087F00A2200F77037F3737333737FF7F080A0A2A220A07037F737F333373
        7F7F0F0F0AAAA20F07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373
        737F0F7F00FFA00F780373F737FFF737F3733080F00000F0803337F733777337
        37F330F80FAFAF088033373F773337733733330F8700078803333373FF77733F
        733333300FFF88003333333773FFFF7733333333300000333333333337777733
        3333}
    end
    object SpeedButton1: TSpeedButton
      Left = 490
      Top = 7
      Width = 104
      Height = 22
      Hint = 'Executar/Run'
      Caption = 'Executar/Run'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 130
      Height = 13
      Caption = 'Banco de dados/DataBase'
    end
    object SpeedButton2: TSpeedButton
      Left = 608
      Top = 7
      Width = 104
      Height = 22
      Caption = 'Cancelar'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF444FFFFFFFF444FF4444FFFFFF4444FFF4444FFFF44
        44FFFFF4444FF4444FFFFFFF44444444FFFFFFFFF444444FFFFFFFFFF44444FF
        FFFFFFFF4444444FFFFFFFF4444F4444FFFFFF4444FFF4444FFFF4444FFFFF44
        44FFF444FFFFFFF444FFF44FFFFFFFFF44FFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton2Click
    end
    object Edit1: TEdit
      Left = 144
      Top = 8
      Width = 253
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = ' '
    end
    object Edit4: TEdit
      Left = 720
      Top = 7
      Width = 249
      Height = 21
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = ' '
    end
  end
  object LB: TListBox
    Left = 779
    Top = 144
    Width = 30
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnDblClick = LBDblClick
    OnKeyDown = LBKeyDown
  end
  object Edit3: TEdit
    Left = 696
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
    Text = ' '
    OnChange = Edit3Change
  end
  object trv_objetos: TTreeView
    Left = 661
    Top = 72
    Width = 305
    Height = 513
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Indent = 19
    ParentFont = False
    RowSelect = True
    ShowLines = False
    TabOrder = 5
    OnClick = trv_objetosClick
    OnDblClick = trv_objetosDblClick
    OnKeyDown = trv_objetosKeyDown
  end
  object Panel2: TPanel
    Left = 0
    Top = 589
    Width = 981
    Height = 41
    Align = alBottom
    Caption = ' '
    ParentColor = True
    TabOrder = 6
    object Label2: TLabel
      Left = 664
      Top = 16
      Width = 54
      Height = 13
      Caption = '                  '
    end
    object Edit2: TEdit
      Left = 16
      Top = 12
      Width = 121
      Height = 21
      BorderStyle = bsNone
      ReadOnly = True
      TabOrder = 0
      Text = ' '
    end
  end
  object qry: TADOQuery
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 888
    Top = 65528
  end
  object DataSource1: TDataSource
    DataSet = adoset
    Left = 912
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 96
    object ArquivosFiles1: TMenuItem
      Caption = 'Queries'
      object AbrirOpen1: TMenuItem
        Caption = 'Abrir/Open'
        OnClick = AbrirOpen1Click
      end
      object SalvarcomoSaveas2: TMenuItem
        Caption = 'Salvar como/Save as'
        OnClick = SalvarcomoSaveas2Click
      end
      object AbrirBancodedadosOpenDataBase1: TMenuItem
        Caption = 'AbrirBanco de dados/Open DataBase'
        OnClick = AbrirBancodedadosOpenDataBase1Click
      end
      object SalvarcomoSaveas1: TMenuItem
        Caption = 'Sair/Quit'
      end
    end
    object SairQuit1: TMenuItem
      Caption = 'Sair/Quit'
      OnClick = SairQuit1Click
    end
  end
  object ImageList1: TImageList
    Left = 400
    Top = 240
  end
  object ADOConnection1: TADOConnection
    Left = 448
    Top = 16
  end
  object adocomm: TADOCommand
    ExecuteOptions = [eoAsyncExecute]
    Parameters = <>
    Left = 856
    Top = 8
  end
  object adoset: TADODataSet
    ExecuteOptions = [eoAsyncFetchNonBlocking]
    OnFetchProgress = adosetFetchProgress
    Parameters = <>
    Left = 936
    Top = 8
  end
end
