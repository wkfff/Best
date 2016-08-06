inherited frm_impdim: Tfrm_impdim
  Left = 392
  Top = 254
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exporta'#231#227'o de Dimens'#245'es'
  ClientHeight = 301
  ClientWidth = 564
  Font.Name = 'Calibri'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 564
    Height = 301
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 556
        Height = 237
        Align = alTop
        Caption = 'pan_de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object trv_cli: TTreeView
          Left = 1
          Top = 21
          Width = 554
          Height = 215
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          ShowLines = False
          TabOrder = 0
          OnClick = trv_cliClick
        end
        object TPanel
          Left = 1
          Top = 1
          Width = 554
          Height = 20
          Align = alTop
          ParentColor = True
          TabOrder = 1
          object Label2: TLabel
            Left = 8
            Top = 2
            Width = 52
            Height = 15
            Caption = 'Clientes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object SpeedButton1: TSpeedButton
        Left = 4
        Top = 244
        Width = 81
        Height = 22
        Caption = 'Voltar'
        Flat = True
        Glyph.Data = {
          56030000424D5603000000000000560200002800000010000000100000000100
          08000000000000010000120B0000120B0000880000008800000000000000FFFF
          FF00FF00FF00F6F4F600EEEAE700DED9D500F8F4EF00F8FAF600FBFEFF00C5ED
          FF00FCFEFF00A4DCFC00A7DEFF00E9F6FE0041AFFC0045B4FE005EB8F8007FC5
          FA0081C7FA008AC9F8008ECAF800CCE7FB00D9E6F000F8FCFF00F7FBFE003AA0
          F6006CB7F70076BFFA0088C6F800CBE6FC00CAE5FB00E6F2FC00E3EEF7001C8E
          F2001F91F3002591F2002891F2003298F2003599F300369CF40077BCF80089C4
          F7008EC7F800C9E3FB00E9F3FC001E87EF00228CF00082BCF60087C0F6009ECA
          F700809EBC00ADD4FA00FAFCFE00137AEA001A82EE003A8EEB004586CF00529E
          F400599FEE005CA5F2005EA5F2005EA3F00066A7EF0070AFF40070ADF20073B0
          F40076B2F4005B89BC005580B00070A9E6005E8CBF007AB5F60077B1F0006392
          C70096C4F6009ECAF800B5D0EE00B7D3F000C5DEFA00C4DDF800CFDAE600E7F2
          FE00EBF4FE00096CE7000E74EA001176EA001674E7001878E9003688ED004787
          D1003D73B400589EEF00589EEE005A9FEF005A9FEE005CA0EF0064A6F2000365
          E6000363E3000D67E2000F6AE500106AE5000F6AE0000F6ADE001169DE00297E
          E9003584EA00F8FBFF00005DE300025CE300025CE200035CE200035BDE00045B
          DE00034BB500034BB400043E900008479F00094FAF000C5DCF001169E5000058
          E2000055E1000058E100003A99000142A5000241A4000052E1000053E100004F
          E0000050E0000051E0000052E0000053E0000054E000FEFEFF00020202020274
          747474747402020202020202027272773849465A757C74020202020272714803
          164D4C5005447E7402020273704B015B786E6D785F06327D7402027247876982
          83407B8681580743740267686B5D83834A017F85858560047674673C2C566C31
          01015C3A5E8664205974672F2B55330101010118347A6F4F457467291D361401
          01010101017A6F4E4274672852252E1C01013737378465513974672608112123
          1301536279813E17637402670B871022241A5461806A0A41720202670E090112
          272D35573D014B7072020202670F0C010D151E1F013F71720202020202676719
          1B2A303B66727202020202020202026767676767670202020202}
        OnClick = SpeedButton1Click
      end
      object pan_de: TPanel
        Left = 0
        Top = 0
        Width = 556
        Height = 237
        Align = alTop
        Caption = 'pan_de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object trv_cende: TTreeView
          Left = 1
          Top = 21
          Width = 552
          Height = 215
          Align = alCustom
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          ShowLines = False
          TabOrder = 0
          OnClick = trv_cendeClick
        end
        object TPanel
          Left = 1
          Top = 1
          Width = 554
          Height = 20
          Align = alTop
          ParentColor = True
          TabOrder = 1
          object Label4: TLabel
            Left = 8
            Top = 2
            Width = 107
            Height = 15
            Caption = 'Cen'#225'rios Origem'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object SpeedButton2: TSpeedButton
        Left = 4
        Top = 244
        Width = 81
        Height = 22
        Caption = 'Voltar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Glyph.Data = {
          56030000424D5603000000000000560200002800000010000000100000000100
          08000000000000010000120B0000120B0000880000008800000000000000FFFF
          FF00FF00FF00F6F4F600EEEAE700DED9D500F8F4EF00F8FAF600FBFEFF00C5ED
          FF00FCFEFF00A4DCFC00A7DEFF00E9F6FE0041AFFC0045B4FE005EB8F8007FC5
          FA0081C7FA008AC9F8008ECAF800CCE7FB00D9E6F000F8FCFF00F7FBFE003AA0
          F6006CB7F70076BFFA0088C6F800CBE6FC00CAE5FB00E6F2FC00E3EEF7001C8E
          F2001F91F3002591F2002891F2003298F2003599F300369CF40077BCF80089C4
          F7008EC7F800C9E3FB00E9F3FC001E87EF00228CF00082BCF60087C0F6009ECA
          F700809EBC00ADD4FA00FAFCFE00137AEA001A82EE003A8EEB004586CF00529E
          F400599FEE005CA5F2005EA5F2005EA3F00066A7EF0070AFF40070ADF20073B0
          F40076B2F4005B89BC005580B00070A9E6005E8CBF007AB5F60077B1F0006392
          C70096C4F6009ECAF800B5D0EE00B7D3F000C5DEFA00C4DDF800CFDAE600E7F2
          FE00EBF4FE00096CE7000E74EA001176EA001674E7001878E9003688ED004787
          D1003D73B400589EEF00589EEE005A9FEF005A9FEE005CA0EF0064A6F2000365
          E6000363E3000D67E2000F6AE500106AE5000F6AE0000F6ADE001169DE00297E
          E9003584EA00F8FBFF00005DE300025CE300025CE200035CE200035BDE00045B
          DE00034BB500034BB400043E900008479F00094FAF000C5DCF001169E5000058
          E2000055E1000058E100003A99000142A5000241A4000052E1000053E100004F
          E0000050E0000051E0000052E0000053E0000054E000FEFEFF00020202020274
          747474747402020202020202027272773849465A757C74020202020272714803
          164D4C5005447E7402020273704B015B786E6D785F06327D7402027247876982
          83407B8681580743740267686B5D83834A017F85858560047674673C2C566C31
          01015C3A5E8664205974672F2B55330101010118347A6F4F457467291D361401
          01010101017A6F4E4274672852252E1C01013737378465513974672608112123
          1301536279813E17637402670B871022241A5461806A0A41720202670E090112
          272D35573D014B7072020202670F0C010D151E1F013F71720202020202676719
          1B2A303B66727202020202020202026767676767670202020202}
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object pan_ate: TPanel
        Left = 0
        Top = 0
        Width = 556
        Height = 237
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Panel1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object TPanel
          Left = 1
          Top = 1
          Width = 554
          Height = 20
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 2
            Width = 110
            Height = 15
            Caption = 'Cen'#225'rios Destino'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object trv_cenate: TTreeView
          Left = 1
          Top = 21
          Width = 554
          Height = 215
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          ShowLines = False
          TabOrder = 1
          OnClick = trv_cenateClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object SpeedButton3: TSpeedButton
        Left = 454
        Top = 244
        Width = 96
        Height = 22
        Caption = 'Concluir'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Glyph.Data = {
          02030000424D0203000000000000360100002800000013000000170000000100
          080000000000CC010000C30E0000C30E000040000000000000001C3404002434
          1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
          54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
          7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
          94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
          040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
          2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
          6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
          B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C0003F3F3F3F3F3F
          191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
          3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
          11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
          3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
          3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
          221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
          3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
          08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
          2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
          110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
          3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
          3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
          3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
          3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
          3F3F373F3F00}
        ParentFont = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton5: TSpeedButton
        Left = 4
        Top = 244
        Width = 98
        Height = 22
        Caption = 'Voltar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Glyph.Data = {
          56030000424D5603000000000000560200002800000010000000100000000100
          08000000000000010000120B0000120B0000880000008800000000000000FFFF
          FF00FF00FF00F6F4F600EEEAE700DED9D500F8F4EF00F8FAF600FBFEFF00C5ED
          FF00FCFEFF00A4DCFC00A7DEFF00E9F6FE0041AFFC0045B4FE005EB8F8007FC5
          FA0081C7FA008AC9F8008ECAF800CCE7FB00D9E6F000F8FCFF00F7FBFE003AA0
          F6006CB7F70076BFFA0088C6F800CBE6FC00CAE5FB00E6F2FC00E3EEF7001C8E
          F2001F91F3002591F2002891F2003298F2003599F300369CF40077BCF80089C4
          F7008EC7F800C9E3FB00E9F3FC001E87EF00228CF00082BCF60087C0F6009ECA
          F700809EBC00ADD4FA00FAFCFE00137AEA001A82EE003A8EEB004586CF00529E
          F400599FEE005CA5F2005EA5F2005EA3F00066A7EF0070AFF40070ADF20073B0
          F40076B2F4005B89BC005580B00070A9E6005E8CBF007AB5F60077B1F0006392
          C70096C4F6009ECAF800B5D0EE00B7D3F000C5DEFA00C4DDF800CFDAE600E7F2
          FE00EBF4FE00096CE7000E74EA001176EA001674E7001878E9003688ED004787
          D1003D73B400589EEF00589EEE005A9FEF005A9FEE005CA0EF0064A6F2000365
          E6000363E3000D67E2000F6AE500106AE5000F6AE0000F6ADE001169DE00297E
          E9003584EA00F8FBFF00005DE300025CE300025CE200035CE200035BDE00045B
          DE00034BB500034BB400043E900008479F00094FAF000C5DCF001169E5000058
          E2000055E1000058E100003A99000142A5000241A4000052E1000053E100004F
          E0000050E0000051E0000052E0000053E0000054E000FEFEFF00020202020274
          747474747402020202020202027272773849465A757C74020202020272714803
          164D4C5005447E7402020273704B015B786E6D785F06327D7402027247876982
          83407B8681580743740267686B5D83834A017F85858560047674673C2C566C31
          01015C3A5E8664205974672F2B55330101010118347A6F4F457467291D361401
          01010101017A6F4E4274672852252E1C01013737378465513974672608112123
          1301536279813E17637402670B871022241A5461806A0A41720202670E090112
          272D35573D014B7072020202670F0C010D151E1F013F71720202020202676719
          1B2A303B66727202020202020202026767676767670202020202}
        ParentFont = False
        OnClick = SpeedButton5Click
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 556
        Height = 237
        Align = alTop
        Caption = 'Panel1'
        ParentColor = True
        TabOrder = 0
        object trv_dim: TTreeView
          Left = 1
          Top = 21
          Width = 554
          Height = 215
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Indent = 19
          MultiSelect = True
          ParentFont = False
          ReadOnly = True
          ShowLines = False
          TabOrder = 0
          Items.Data = {
            060000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            0641746F726573200000000000000000000000FFFFFFFFFFFFFFFF0000000000
            00000007506573736F6173280000000000000000000000FFFFFFFFFFFFFFFF00
            000000000000000F466C75786F73206465204461646F732A0000000000000000
            000000FFFFFFFFFFFFFFFF000000000000000011456C656D656E746F73206465
            206461646F2A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            0011526567726173206465204E6567F363696F300000000000000000000000FF
            FFFFFFFFFFFFFF0000000000000000174C6F636169732064652050726F636573
            73616D656E746F}
        end
        object TPanel
          Left = 1
          Top = 1
          Width = 554
          Height = 20
          Align = alTop
          ParentColor = True
          TabOrder = 1
          object Label3: TLabel
            Left = 6
            Top = 2
            Width = 69
            Height = 15
            Caption = 'Dimens'#245'es'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object lb_tab: TListBox
          Left = 360
          Top = 30
          Width = 185
          Height = 157
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ItemHeight = 15
          Items.Strings = (
            'IDF_CA'
            'IDF_PS'
            'IDF_DG'
            'IDF_DE'
            'IDF_RN'
            'IDF_LF')
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 2
    Width = 795
    Height = 25
    Caption = ' '
    ParentColor = True
    TabOrder = 1
    object Edit1: TEdit
      Left = 0
      Top = 0
      Width = 561
      Height = 22
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
