inherited frm_prod: Tfrm_prod
  Left = 210
  Top = 211
  ActiveControl = DBEdit1
  Caption = 'frm_prod'
  ClientHeight = 382
  ClientWidth = 801
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 232
    Top = 40
    Width = 37
    Height = 14
    Caption = 'Produto'
  end
  object Label5: TLabel [1]
    Left = 240
    Top = 232
    Width = 66
    Height = 14
    Caption = 'Observa'#231#245'es'
  end
  object Label6: TLabel [2]
    Left = 680
    Top = 112
    Width = 79
    Height = 14
    Caption = 'Custo reposi'#231#227'o'
  end
  object Label7: TLabel [3]
    Left = 240
    Top = 136
    Width = 34
    Height = 14
    Caption = 'Modelo'
  end
  object Label4: TLabel [4]
    Left = 240
    Top = 168
    Width = 57
    Height = 14
    Caption = 'Fabricante ;'
  end
  inherited Panel3: TPanel
    Width = 801
    inherited sp2: TSpeedButton
      Left = 691
    end
    inherited SP_X: TSpeedButton
      OnClick = nil
    end
  end
  object DBEdit1: TDBEdit [6]
    Left = 232
    Top = 56
    Width = 121
    Height = 22
    DataField = 'COD_PRODUTO'
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [7]
    Left = 232
    Top = 88
    Width = 441
    Height = 22
    DataField = 'DESCRICAO'
    TabOrder = 3
  end
  object DBEdit9: TDBEdit [8]
    Left = 360
    Top = 56
    Width = 313
    Height = 22
    DataField = 'DESC_REDUZ'
    TabOrder = 2
  end
  object DBMemo1: TDBMemo [9]
    Left = 240
    Top = 256
    Width = 441
    Height = 105
    DataField = 'COMPLEMENTO'
    TabOrder = 6
  end
  object DBRadioGroup1: TDBRadioGroup [10]
    Left = 680
    Top = 48
    Width = 113
    Height = 57
    Caption = 'Tipo'
    DataField = 'TIPO_COMP'
    Items.Strings = (
      'Hardware'
      'Software')
    TabOrder = 4
    Values.Strings = (
      'H'
      'S')
  end
  object DBEdit2: TDBEdit [11]
    Left = 680
    Top = 128
    Width = 105
    Height = 22
    DataField = 'CUSTO_REPOS'
    TabOrder = 5
  end
  inherited DBGrid1: TDBGrid
    Left = 0
    Width = 201
    Height = 329
    Options = [dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgCancelOnExit]
    TabOrder = 7
    Columns = <
      item
        Expanded = False
        FieldName = 'DESC_REDUZ'
        Title.Caption = 'Descri'#231#227'o'
        Width = 230
        Visible = True
      end>
  end
  object cmb_grupo: TDBLookupComboBox
    Left = 296
    Top = 132
    Width = 49
    Height = 22
    DataField = 'COD_MODELO'
    DropDownRows = 15
    DropDownWidth = 300
    KeyField = 'COD_GRUPO'
    ListField = 'COD_GRUPO;DESCRICAO'
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 360
    Top = 132
    Width = 193
    Height = 22
    TabStop = False
    TabOrder = 9
  end
  object cmb_fab: TDBLookupComboBox
    Left = 296
    Top = 164
    Width = 49
    Height = 22
    DataField = 'COD_FABRICANTE'
    DropDownRows = 15
    DropDownWidth = 300
    KeyField = 'COD_FABRICANTE'
    ListField = 'COD_FABRICANTE;FANTASIA'
    TabOrder = 10
  end
  object DBEdit6: TDBEdit
    Left = 360
    Top = 164
    Width = 193
    Height = 22
    TabStop = False
    TabOrder = 11
  end
end
