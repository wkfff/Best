inherited FRM_METOD : TFRM_METOD
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
  PixelsPerInch = 96
  TextHeight = 15
   object l_MET_VISIBIL: Tlabel
     caption = 'Visibilidade'
     Height = 13
     Width = 32
     Top = 257
     Left = 678
   end
object MET_VISIBIL: TEdit
Left = 678
Top = 273
Width = 121
Height = 21
TabOrder = 23
end
   object l_MET_NOME: Tlabel
     caption = 'Nome'
     Height = 13
     Width = 32
     Top = 216
     Left = 678
   end
object MET_NOME: TEdit
Left = 678
Top = 232
Width = 121
Height = 21
TabOrder = 22
end
   object l_MET_COMENT: Tlabel
     caption = 'Coment.'
     Height = 13
     Width = 32
     Top = 175
     Left = 678
   end
object MET_COMENT: TEdit
Left = 678
Top = 191
Width = 121
Height = 21
TabOrder = 21
end
   object l_LCK: Tlabel
     caption = ''
     Height = 13
     Width = 32
     Top = 134
     Left = 678
   end
object LCK: TEdit
Left = 678
Top = 150
Width = 121
Height = 21
TabOrder = 20
end
   object l_IDG_ID: Tlabel
     caption = ''
     Height = 13
     Width = 32
     Top = 93
     Left = 678
   end
object IDG_ID: TEdit
Left = 678
Top = 109
Width = 121
Height = 21
TabOrder = 19
end
   object l_IDF_VISIBLE: Tlabel
     caption = ''
     Height = 13
     Width = 32
     Top = 52
     Left = 678
   end
object IDF_VISIBLE: TEdit
Left = 678
Top = 68
Width = 121
Height = 21
TabOrder = 18
end
   object l_IDF_VERSAO_DATA: Tlabel
     caption = 'Data Versão'
     Height = 13
     Width = 32
     Top = 380
     Left = 518
   end
object IDF_VERSAO_DATA: TEdit
Left = 518
Top = 396
Width = 121
Height = 21
TabOrder = 17
end
object d_IDF_VERSAO_DATA: TDateTimePicker
Left = 518
Top = 396
Width = 145
Height = 21
TabOrder = 17
kind = dtkdate
parseInput = false
dateFormat = dfShort
time = 38140.5243169329
date = 38140.5243169329
CalAlignment = dtaLeft
OnCloseUp = DateClose
end
   object l_IDF_VERSAO: Tlabel
     caption = 'Versão'
     Height = 13
     Width = 32
     Top = 339
     Left = 518
   end
object IDF_VERSAO: TEdit
Left = 518
Top = 355
Width = 121
Height = 21
TabOrder = 16
end
   object l_IDF_TIPO_ATIVIDADE: Tlabel
     caption = 'Tipo Ati'
     Height = 13
     Width = 32
     Top = 298
     Left = 518
   end
object IDF_TIPO_ATIVIDADE: TEdit
Left = 518
Top = 314
Width = 121
Height = 21
TabOrder = 15
end
   object l_IDF_TIPO: Tlabel
     caption = 'Tipo'
     Height = 13
     Width = 32
     Top = 257
     Left = 518
   end
object IDF_TIPO: TEdit
Left = 518
Top = 273
Width = 121
Height = 21
TabOrder = 14
end
   object l_IDF_RESPONSAVEL: Tlabel
     caption = 'Responsável'
     Height = 13
     Width = 32
     Top = 216
     Left = 518
   end
object IDF_RESPONSAVEL: TEdit
Left = 518
Top = 232
Width = 121
Height = 21
TabOrder = 13
end
   object l_IDF_OBJETIVO: Tlabel
     caption = 'Objetivo'
     Height = 13
     Width = 32
     Top = 175
     Left = 518
   end
object IDF_OBJETIVO: TEdit
Left = 518
Top = 191
Width = 121
Height = 21
TabOrder = 12
end
   object l_IDF_METTYPE: Tlabel
     caption = 'Type'
     Height = 13
     Width = 32
     Top = 134
     Left = 518
   end
object IDF_METTYPE: TEdit
Left = 518
Top = 150
Width = 121
Height = 21
TabOrder = 11
end
   object l_IDF_METDIRECT: Tlabel
     caption = 'Direct'
     Height = 13
     Width = 32
     Top = 93
     Left = 518
   end
object IDF_METDIRECT: TEdit
Left = 518
Top = 109
Width = 121
Height = 21
TabOrder = 10
end
   object l_IDF_METBIND: Tlabel
     caption = 'Bind'
     Height = 13
     Width = 32
     Top = 52
     Left = 518
   end
object IDF_METBIND: TEdit
Left = 518
Top = 68
Width = 121
Height = 21
TabOrder = 9
end
   object l_IDF_DIRETORIO: Tlabel
     caption = 'Diretório'
     Height = 13
     Width = 32
     Top = 380
     Left = 358
   end
object IDF_DIRETORIO: TEdit
Left = 358
Top = 396
Width = 121
Height = 21
TabOrder = 8
end
   object l_IDF_DESIGNACAO: Tlabel
     caption = 'Designacao'
     Height = 13
     Width = 32
     Top = 339
     Left = 358
   end
object IDF_DESIGNACAO: TEdit
Left = 358
Top = 355
Width = 121
Height = 21
TabOrder = 7
end
   object l_IDF_DEL: Tlabel
     caption = ''
     Height = 13
     Width = 32
     Top = 298
     Left = 358
   end
object IDF_DEL: TEdit
Left = 358
Top = 314
Width = 121
Height = 21
TabOrder = 6
end
   object l_IDF_CAT: Tlabel
     caption = 'Categoria'
     Height = 13
     Width = 32
     Top = 257
     Left = 358
   end
object IDF_CAT: TEdit
Left = 358
Top = 273
Width = 121
Height = 21
TabOrder = 5
end
   object l_IDF_SEQ: Tlabel
     caption = 'Seq.'
     Height = 13
     Width = 32
     Top = 216
     Left = 358
   end
object IDF_SEQ: TEdit
Left = 358
Top = 232
Width = 121
Height = 21
TabOrder = 4
     ReadOnly = TRUE 
     Color = clBtnFace
Text = ''
end
   object l_CLASS_ID: Tlabel
     caption = 'Classe'
     Height = 13
     Width = 32
     Top = 175
     Left = 358
   end
object CLASS_ID: TEdit
Left = 358
Top = 191
Width = 121
Height = 21
TabOrder = 3
     ReadOnly = TRUE 
     Color = clBtnFace
Text = ''
end
   object l_IDF_CODIGO: Tlabel
     caption = 'Código'
     Height = 13
     Width = 32
     Top = 134
     Left = 358
   end
object IDF_CODIGO: TEdit
Left = 358
Top = 150
Width = 121
Height = 21
TabOrder = 2
     ReadOnly = TRUE 
     Color = clBtnFace
Text = ''
end
   object l_PRJ_ID: Tlabel
     caption = 'Cenário'
     Height = 13
     Width = 32
     Top = 93
     Left = 358
   end
object PRJ_ID: TEdit
Left = 358
Top = 109
Width = 121
Height = 21
TabOrder = 1
     ReadOnly = TRUE 
     Color = clBtnFace
Text = ''
end
   object l_CLI_ID: Tlabel
     caption = 'Cliente'
     Height = 13
     Width = 32
     Top = 52
     Left = 358
   end
object CLI_ID: TEdit
Left = 358
Top = 68
Width = 121
Height = 21
TabOrder = 0
     ReadOnly = TRUE 
     Color = clBtnFace
Text = ''
inherited lb: TListBox
TabOrder = 15
OnClick = lbClick
end
end
end
