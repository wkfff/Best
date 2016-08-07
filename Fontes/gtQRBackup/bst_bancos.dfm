object frm_bancos: Tfrm_bancos
  Left = 538
  Top = 154
  Width = 401
  Height = 193
  Caption = 'Bancos de Dados/Data base'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton3: TSpeedButton
    Left = 151
    Top = 500
    Width = 110
    Height = 22
    Caption = 'Query SQL'
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
    Visible = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton1: TSpeedButton
    Tag = 1
    Left = 34
    Top = 500
    Width = 110
    Height = 22
    Caption = 'Tabelas/Tables'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 274
    Top = 500
    Width = 110
    Height = 22
    Caption = 'Cancelar/Cancel'
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
    Visible = False
    OnClick = SpeedButton2Click
  end
  object rdg: TRadioGroup
    Left = 8
    Top = 32
    Width = 185
    Height = 121
    Caption = 'Bancos de Dados/Data Base'
    Items.Strings = (
      'Access'
      'Paradox'
      'Dbase'
      'SQL Server'
      'Informix')
    TabOrder = 0
    OnClick = rdgClick
  end
  object gpb: TGroupBox
    Left = 200
    Top = 32
    Width = 185
    Height = 121
    Caption = 'SQL Server'
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 10
      Top = 64
      Width = 139
      Height = 14
      Caption = 'Nome do Banco/DB name'
    end
    object Label2: TLabel
      Left = 10
      Top = 25
      Width = 82
      Height = 14
      Caption = 'Servidor/Server'
    end
    object cmb_nome: TComboBox
      Left = 8
      Top = 80
      Width = 169
      Height = 22
      ItemHeight = 14
      TabOrder = 3
      OnCloseUp = cmb_nomeCloseUp
    end
    object cmb_ip: TComboBox
      Left = 8
      Top = 40
      Width = 169
      Height = 22
      ItemHeight = 14
      TabOrder = 2
      Text = ' '
      OnCloseUp = cmb_ipCloseUp
    end
    object Edit1: TEdit
      Left = 8
      Top = 40
      Width = 149
      Height = 22
      TabOrder = 0
      Text = '*.*'
    end
    object Edit2: TEdit
      Left = 8
      Top = 80
      Width = 149
      Height = 22
      TabOrder = 1
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 393
    Height = 22
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 22
        Width = 393
      end>
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 380
      Height = 22
      AutoSize = True
      Caption = 'ToolBar1'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList1
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        OnClick = SpeedButton1Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
        OnClick = SpeedButton2Click
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 160
    Width = 377
    Height = 209
    TabOrder = 3
    Visible = False
    object dc: TDriveComboBox
      Left = 8
      Top = 10
      Width = 361
      Height = 20
      TabOrder = 0
    end
    object dl: TDirectoryListBox
      Left = 8
      Top = 34
      Width = 177
      Height = 159
      ItemHeight = 16
      TabOrder = 1
    end
    object fl: TFileListBox
      Left = 186
      Top = 34
      Width = 183
      Height = 159
      FileEdit = Edit1
      ItemHeight = 16
      ShowGlyphs = True
      TabOrder = 2
      OnDblClick = flDblClick
    end
  end
  object ImageList1: TImageList
    Left = 80
    Top = 568
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001079F000313A9000418AE000419AE000313A9000108A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      940084848400747474006C6C6C006C6C6C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000104
      9D00041CB1000730C0000734C4000735C5000735C5000734C3000731C100041F
      B30001069E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400747474006C6C6C0064646400646464007C7C7C008C8C8C00000000000000
      00000000000000000000000000000000000000000000000000000109A100052B
      C3000735C7000733C2000732C2000732C2000732C2000732C2000733C3000735
      C400062DBE00020CA40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C8C
      54003C5C24002424240024341C00646464006C6C6C007C7C7C008C8C8C000000
      0000000000000000000000000000000000000000000001049B00052BCA000636
      D8000431CD000027C400032EC1000732C2000732C2000430C1000027BF00042F
      C1000735C400072EBE0001069E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006CD4
      04006CD40400448404001C3C0400747C74006C6C6C0074747400848484009494
      94000000000000000000000000000000000000000000031ABA000537E7000331
      DD00123DD8006480E0001840CB00002CC100022DC0000F38C4006580D9001B43
      C700052FC1000735C500051FB300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084FC
      0C0084FC14006CDC04002C5C040044543C006C6C6C006C6C6C007C7C7C008C8C
      8C000000000000000000000000000000000001049E000430E4000436F100002A
      E4005070E900FFFFFF00B7C4F1000D36CA00042DC300A2B2E800FFFFFF006984
      DA000026BE000733C3000731C1000108A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4C4A4007CFC040084FC
      140084FC140084FC14006CD404002C5C0400747474006C6C6C006C6C6C007474
      740084848400000000000000000000000000020FAF000336FA000335F8000232
      EE000A35E8008CA2F200FFFFFF00B4C2F100A9B8ED00FFFFFF00A7B7E900133A
      C400052FC1000732C2000734C4000313AA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094D45C0084FC0C0094FC
      240094FC24008CFC240084FC0C00449404008C948C00747474006C6C6C006C6C
      6C00747474000000000000000000000000000619BC001747FE00093AFC000435
      F8000131F000002BE80091A5F400FFFFFF00FFFFFF00ABBAEF00062FC500022D
      C0000732C2000732C2000736C5000419AE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCC4B400ACFC64009CFC44009CF4
      4C00BCCCB400BCF48400A4FC4C0084FC14001C3C04007C7C7C007C7C7C007474
      74006C6C6C007C7C7C008C8C8C00000000000B1DBE004168FE001C49FC000335
      FB000031F9000531F200A4B5F700FFFFFF00FFFFFF00B9C6F2000D36D000002C
      C6000732C2000732C2000736C5000418AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400A4FC4C00BCC4
      B40000000000BCCCAC00B4FC6C009CFC3C004484040024341C008C8C8C007C7C
      7C00747474007474740084848400949494000613B4005B7CFC00486CFD000133
      FB00113CFB00A1B4FE00FFFFFF00A4B6F80092A7F500FFFFFF00B6C4F2001A41
      D300042FC8000732C4000734C3000212A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4F4740084FC140054AC04001C3C04006C6C
      6C008C8C8C007C7C7C00848484008C8C8C000003A0004A6AF3008FA6FF001F46
      FB004C6FFC00FFFFFF00A7B8FE000733F600002AED008CA2F600FFFFFF00627F
      E7000028D0000734CC000730C30000069F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BCCCAC009CFC440084FC1400449404001C34
      04008C948C008C8C8C008C8C8C0094949400000000001A2FCB0099AFFF008BA2
      FE00214DFB004D71FC000E3DFB000030FB000031F7000636F1004C6EF100103C
      E3000432DB000636D700041CB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCFC7C00A4FC4C0084FC14004494
      04001C340400000000000000000000000000000000000004A000415EEC00B8C7
      FF009CAFFD003A5CFC000A3AFB000335FB000335FB000133F900052FF2000635
      EB000537E900052CCD0000049C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400C4FC8C00B4FC
      6C008CFC1C0054743C00000000000000000000000000000000000309A5004260
      EC00A9BBFF00BDCAFF008EA5FE006483FD005073FC004A6EFD003961FD001444
      F900042CD7000109A20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCC4B400C4F4
      9400B4FC6C0074F40400B4C4A400000000000000000000000000000000000004
      A0001E32CD005876F600859EFE008BA3FF007994FE005376FC00234AF000051E
      C50001049C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BCCCAC0000000000000000000000000000000000000000000000
      0000000000000004A0000917B6001022C3000D1FC2000311B40001059F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F8FFF81F00000000E07FE00700000000
      E03FC00300000000E01F800100000000E00F800100000000E00F000000000000
      8007000000000000800700000000000000010000000000008800000000000000
      FE00000000000000FE00800100000000FF07800100000000FF83C00300000000
      FFC1E00700000000FFFBF81F0000000000000000000000000000000000000000
      000000000000}
  end
end