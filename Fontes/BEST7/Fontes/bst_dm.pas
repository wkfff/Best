unit bst_dm;

interface

uses
  SysUtils, Classes, DB, ADODB, cls_bd, bstdb;

type
  Tdm = class(TDataModule)
    qry_OpenAP: TADOQuery;
    DataSource1: TDataSource;
    cn: TADOConnection;
    qry_APALL: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    qry_AtuAp: TADOQuery;
    qry_Tab: TADOQuery;
    src_Tab: TDataSource;
    qry_empresas: TADOQuery;
    qry_cenarios: TADOQuery;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    qry_generica: TADOQuery;
    src_generica: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation



{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
 i : integer;
begin
 for i := 1 to ComponentCount - 1 do
  begin
   If Components[i] is TAdoQuery then
    begin
     (Components[i] as TAdoQuery ).Connection := bdx;
    end;
  end;
 {qry_AtuAp.Connection := BDx;
 qry_ApAll.Connection := BDx;
 qry_OpenAp.Connection := BDx;
 qry_Tab.Connection   := BDx;
 qry_empresas.Connection   := BDx;
 qry_cenarios.Connection   := BDx;  }
end;

end.
