inherited FRM_aprojeto : TFRM_aprojeto
  Left = 219
  Top = 147
  Width = 696
  Height = 480
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
   object l_PRJ_STATUS: Tlabel
     caption = 'Situação'
     Height = 13
     Width = 32
     Top = 175
     Left = 518
   end
object PRJ_STATUS: TEdit
Left = 518
Top = 191
Width = 121
Height = 21
TabOrder = 12
Text = ''
end
   object l_PRJ_ALVOS_MELHORIA: Tlabel
     caption = 'Alvos de Melhoria'
     Height = 13
     Width = 32
     Top = 134
     Left = 518
   end
object PRJ_ALVOS_MELHORIA: Tmemo
Left = 518
Top = 150
Width = 121
Height = 21
TabOrder = 11

end
   object l_PRJ_RESTRICOES: Tlabel
     caption = 'Restrições'
     Height = 13
     Width = 32
     Top = 93
     Left = 518
   end
object PRJ_RESTRICOES: TEdit
Left = 518
Top = 109
Width = 121
Height = 21
TabOrder = 10
Text = ''
end
   object l_PRJ_PREMISSAS: Tlabel
     caption = 'Premissas'
     Height = 13
     Width = 32
     Top = 52
     Left = 518
   end
object PRJ_PREMISSAS: Tmemo
Left = 518
Top = 68
Width = 121
Height = 21
TabOrder = 9

end
   object l_PRJ_PATH: Tlabel
     caption = 'Dir Padrão'
     Height = 13
     Width = 32
     Top = 380
     Left = 358
   end
object PRJ_PATH: TEdit
Left = 358
Top = 396
Width = 121
Height = 21
TabOrder = 8
Text = ''
end
   object l_PRJ_OBJETIVO: Tlabel
     caption = 'Objetivo'
     Height = 13
     Width = 32
     Top = 339
     Left = 358
   end
object PRJ_OBJETIVO: Tmemo
Left = 358
Top = 355
Width = 121
Height = 21
TabOrder = 7

end
   object l_PRJ_FATORES_RESTRITIVOS: Tlabel
     caption = 'Fatores Restritivos'
     Height = 13
     Width = 32
     Top = 298
     Left = 358
   end
object PRJ_FATORES_RESTRITIVOS: Tmemo
Left = 358
Top = 314
Width = 121
Height = 21
TabOrder = 6

end
   object l_PRJ_DEFINICAO_CONTEXTO: Tlabel
     caption = 'Contexto'
     Height = 13
     Width = 32
     Top = 257
     Left = 358
   end
object PRJ_DEFINICAO_CONTEXTO: Tmemo
Left = 358
Top = 273
Width = 121
Height = 21
TabOrder = 5

end
   object l_PRJ_DATA_FIM_PLANEJADA: Tlabel
     caption = 'Data Fim'
     Height = 13
     Width = 32
     Top = 216
     Left = 358
   end
object PRJ_DATA_FIM_PLANEJADA: TEdit
Left = 358
Top = 232
Width = 121
Height = 21
TabOrder = 4
Text = ''
end
object d_PRJ_DATA_FIM_PLANEJADA: TDateTimePicker
Left = 358
Top = 232
Width = 145
Height = 21
TabOrder = 4
kind = dtkdate
parseInput = false
dateFormat = dfShort
time = 38140.5243169329
date = 38140.5243169329
CalAlignment = dtaLeft
OnCloseUp = DateClose
end
   object l_PRJ_CARATER_RELEVANTE: Tlabel
     caption = 'Carateres releventes'
     Height = 13
     Width = 32
     Top = 175
     Left = 358
   end
object PRJ_CARATER_RELEVANTE: Tmemo
Left = 358
Top = 191
Width = 121
Height = 21
TabOrder = 3

end
   object l_PRJ_CAMINHO: Tlabel
     caption = 'Diretório Padrão'
     Height = 13
     Width = 32
     Top = 134
     Left = 358
   end
object PRJ_CAMINHO: TEdit
Left = 358
Top = 150
Width = 121
Height = 21
TabOrder = 2
Text = ''
end
   object l_PRJ_AREA_INTERESSE: Tlabel
     caption = 'Área de Interesse'
     Height = 13
     Width = 32
     Top = 93
     Left = 358
   end
object PRJ_AREA_INTERESSE: TEdit
Left = 358
Top = 109
Width = 121
Height = 21
TabOrder = 1
Text = ''
end
   object l_PRJ_TITULO: Tlabel
     caption = 'Nome Cenário'
     Height = 13
     Width = 32
     Top = 52
     Left = 358
   end
object PRJ_TITULO: TEdit
Left = 358
Top = 68
Width = 121
Height = 21
TabOrder = 0
Text = ''
end
end
