inherited frm_demoassist: Tfrm_demoassist
  Left = 315
  Top = 175
  Caption = 'Demo Assist'
  ClientHeight = 438
  ClientWidth = 511
  Font.Height = -12
  Font.Name = 'Calibri'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object bt: TSpeedButton
    Tag = 1
    Left = 204
    Top = 386
    Width = 123
    Height = 22
    Caption = 'Criar Empresa'
    OnClick = btClick
  end
  object Memo1: TMemo
    Left = 12
    Top = 2
    Width = 497
    Height = 357
    TabStop = False
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    Lines.Strings = (
      '                      Obrigado por Testar o BEST!'
      ''
      'Em 3 passos, vamos desenhar o primeiro Digarama de Processos; '
      'o BEST mant'#233'm seus diagramas e Bancos de Dados em Reposit'#243'rios, '
      'estruturados em :'
      
        '- Empresa : o n'#237'vel mais alto; n'#227'o h'#225' limita'#231#227'o de n'#250'mero de Emp' +
        'resas.'
      '- Cen'#225'rio  : A Empresa pode trabalhar com v'#225'rios cen'#225'rios ; '
      
        '                  ex : Sitaau'#231#227'o Atual ou Situa'#231#227'o Ideal, etc...' +
        '.'
      
        '                  N'#227'o h'#225' limita'#231#227'o de n'#250'mero de cen'#225'rios por cli' +
        'ente.'
      '- Diagrama  : O Cen'#225'rio cont'#233'm diagramas ( de v'#225'rios tipos), '
      
        '                     em uma arborescencia infinita, ou seja, cad' +
        'a atividade do'
      
        '                     diagrama  pode ser decomposta em outro diag' +
        'rama, contendo '
      
        '                     Atividades que por sua vez podem ser decomp' +
        'ostas em outros'
      '                     Diagramas, e assim por diante.'
      ''
      
        'Portanto vamos criar uma Empresa, um Cen'#225'rio para essa Empresa e' +
        ' o Primeiro'
      'Diagrama para esse cen'#225'rio. '
      ''
      'Passo 1 : criar uma Empresa;'
      'Passo 2 : criar um Cen'#225'rio'
      'Passo 3 : criar o primeiro Diagrama (N'#237'vel 0).')
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
