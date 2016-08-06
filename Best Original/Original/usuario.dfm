inherited FRM_usuario : TFRM_usuario
Color = 14145495
  Top = 324
  Width = 724
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize]
Caption = 'TUsuario'
  Color = 14145495
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
   object l_PRJ_ID: Tlabel
     caption = 'Id Cenário'
     Height = 13
     Width = 32
     Top = 216
     Left = 358
   end
object PRJ_ID: TEdit
Left = 358
Top = 232
Width = 121
Height = 21
TabOrder = 4
BorderStyle = bsNone
Color = 13224393
end
   object l_CLI_ID: Tlabel
     caption = 'Id Cliente'
     Height = 13
     Width = 32
     Top = 175
     Left = 358
   end
object CLI_ID: TEdit
Left = 358
Top = 191
Width = 121
Height = 21
TabOrder = 3
BorderStyle = bsNone
Color = 13224393
end
   object l_US_NOME: Tlabel
     caption = 'Usuário'
     Height = 13
     Width = 32
     Top = 134
     Left = 358
   end
object US_NOME: TEdit
Left = 358
Top = 150
Width = 121
Height = 21
TabOrder = 2
BorderStyle = bsNone
Color = 13224393
end
   object l_DATATU: Tlabel
     caption = 'Dt. Atualização'
     Height = 13
     Width = 32
     Top = 93
     Left = 358
   end
object d_DATATU: TDateTimePicker
Left = 358
Top = 109
Width = 145
Height = 21
TabOrder = 1
kind = dtkdate
parseInput = false
dateFormat = dfShort
time = 38140.5243169329
date = 38140.5243169329
CalAlignment = dtaLeft
OnCloseUp = DateClose
end
object DATATU: TEdit
Left = 358
Top = 109
Width = 121
Height = 21
TabOrder = 1
BorderStyle = bsNone
Color = 13224393
end
   object l_ID_USUARIO: Tlabel
     caption = 'Id Usuário'
     Height = 13
     Width = 32
     Top = 52
     Left = 358
   end
object ID_USUARIO: TEdit
Left = 358
Top = 68
Width = 121
Height = 21
TabOrder = 0
BorderStyle = bsNone
Color = 13224393
     ReadOnly = TRUE 
     TabStop  = FALSE 
     Color = clBtnFace
inherited lb: TListBox
TabOrder = 15
OnClick = lbClick
end
end
end
