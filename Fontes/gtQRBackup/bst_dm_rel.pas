unit bst_dm_rel;

interface

uses
  SysUtils, Classes, DB, ADODB, bstdb, gtQrCtrls,OOSEG,CL_ACCESS2;

type
  Tdm_rel = class(TDataModule)
    qry_atiid: TADOQuery;
    src_atiid: TDataSource;
    qry_atiidIDF_CODIGO: TIntegerField;
    qry_atiidCLI_ID: TSmallintField;
    qry_atiidPRJ_ID: TSmallintField;
    qry_atiidIDG_ID: TIntegerField;
    qry_atiidIDF_OI: TIntegerField;
    qry_atiidIDF_TIPO_ATIVIDADE: TWideStringField;
    qry_atiidIDF_DESIGNACAO: TWideStringField;
    qry_atiidIDF_CAUSA_INATIVIDADE: TMemoField;
    qry_atiidIDF_CLASSIFICACAO_PP: TWideStringField;
    qry_atiidIDF_COMPLEXIDADE: TWideStringField;
    qry_atiidIDF_CUSTO_ANUAL: TFloatField;
    qry_atiidIDF_DESCRICAO: TMemoField;
    qry_atiidIDF_DURATION_TPU: TFloatField;
    qry_atiidIDF_OBJETIVO_UC: TMemoField;
    qry_atiidIDF_RESPONSAVEL: TWideStringField;
    qry_atiidIDF_TEMPO_INATIVO_TPI: TFloatField;
    qry_atiidIDF_UNIDADE_TEMPO: TWideStringField;
    qry_atiidIDF_VALOR_AGREGADO: TWideStringField;
    qry_atiidIDF_VOLUME: TMemoField;
    qry_atiidIDF_VOLUME_PICO: TMemoField;
    qry_atiidIDF_VOLUME_LOOPING: TFloatField;
    qry_atiidIDF_VOLUME_PROC: TFloatField;
    qry_atiidIDF_V_PICO: TFloatField;
    qry_atiidIDF_V_REGULAR: TFloatField;
    qry_atiidIDF_V_MINIMO: TFloatField;
    qry_atiidIDF_WBS_CODE: TWideStringField;
    qry_atiidIDF_DEL: TWideStringField;
    qry_atiidIDF_VERSAO: TWideStringField;
    qry_atiidIDF_VERSAO_DATA: TDateTimeField;
    qry_atiidIDF_TIPO_ATIV: TWideStringField;
    qry_atiidIDF_VISIBLE: TWideStringField;
    qry_atiidIDF_ATOR1: TWideStringField;
    qry_atiidIDF_ATOR2: TWideStringField;
    qry_atiidSUB_ID: TIntegerField;
    qry_atiidIDF_VOLUME_REG: TFloatField;
    qry_atu_idg: TADOQuery;
    src_atu_idg: TDataSource;
    qry_atu_idgCLI_ID: TIntegerField;
    qry_atu_idgPRJ_ID: TIntegerField;
    qry_atu_idgIDG_ID: TIntegerField;
    qry_atu_idgSUB_ID: TIntegerField;
    qry_atu_idgDIAG_PAI_ID: TIntegerField;
    qry_atu_idgSUB_NOME: TWideStringField;
    qry_atu_idgDIAG_ID: TWideStringField;
    qry_atu_idgATIVIDADE_MAE: TIntegerField;
    qry_atu_idgGRID_ALT: TSmallintField;
    qry_atu_idgGRID_LARG: TSmallintField;
    qry_atu_idgGRID_COR: TFloatField;
    qry_atu_idgGRID_SHOW: TSmallintField;
    qry_atu_idgGRID_SNAP: TWideStringField;
    qry_atu_idgIDG_DIR: TWideStringField;
    qry_atu_idgIDG_NIVEL: TIntegerField;
    qry_atu_idgIDG_UPDATEDATE: TDateTimeField;
    qry_atu_idgIDG_DIAGRAM_STATUS: TWideStringField;
    qry_atu_idgIDG_IDGCLASS: TWideStringField;
    qry_atu_idgIDG_DIAG: TMemoField;
    qry_req: TADOQuery;
    src_req: TDataSource;
    qry_delPlan: TADOQuery;
    src_DelPlan: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    FoAcesso: TAccess;
    procedure SetoAcesso(const Value: TAccess);
    { Private declarations }
  public
    { Public declarations }
  published

  end;

var
  dm_rel: Tdm_rel;
  oAcesso : TAccess ;
implementation

{$R *.dfm}

procedure Tdm_rel.DataModuleCreate(Sender: TObject);
var
i : integer;
begin
  for i := 0 to componentcount - 1 do
   begin
    If Components[i] is TAdoQuery then
       (Components[i] as TAdoQuery).Connection := bdx;
   end;
   oAcesso := TAccess.create;
end;

procedure Tdm_rel.SetoAcesso(const Value: TAccess);
begin
  FoAcesso := Value;
end;

end.
