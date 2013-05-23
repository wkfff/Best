unit OOSEG;

interface
{INICIO USES}

 uses
DDSEG,
Aligrid,
  windows,DB, ADODB,forms,Messages,Dialogs,basetier,variants,
  stdctrls,classes,db_tier,bstdb;

{FIM USES}

{INICIO CLASSES}

{Início Classe Opessoa}
type
 {Classe Opessoa}
Opessoa = Class(TOObject)
     private
      FID_PESSOA                                          : integer ;
      FDATATU                                             : real ;
      FID_USUARIO                                         : integer ;
      FPES_NOME                                           : string ;
      FPES_SENHA                                          : string ;
      FUSUARIO                                            : string ;
      procedure SetID_PESSOA(const value   : integer );
      procedure SetDATATU(const value   : real );
      procedure SetID_USUARIO(const value   : integer );
      procedure SetPES_NOME(const value   : string );
      procedure SetPES_SENHA(const value   : string );
      procedure SetUSUARIO(const value   : string );



  published
   property ID_PESSOA                                         : integer            read FID_PESSOA write SetID_PESSOA;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property ID_USUARIO                                        : integer            read FID_USUARIO write SetID_USUARIO;
   property PES_NOME                                          : string             read FPES_NOME write SetPES_NOME;
   property PES_SENHA                                         : string             read FPES_SENHA write SetPES_SENHA;
   property USUARIO                                           : string             read FUSUARIO write SetUSUARIO;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;

{ popula as properties do objeto de dados}
  procedure ddMap;

{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;


 {Checa se o nome existe}
 function CheckNOme(pNome : string): boolean;

   { Retorna os Contatos doa Empresa}
function GetContatos(pFK : string) : TStringAlignGrid;

{ deleta os contatos da empresa}
function DeletaContatos(pId: integer): boolean;

 {checa login}
function CheckAccess(pNome, pSenha: string): boolean;

 {atualiza senha}
function AtuSenha(pId: integer; pSenha: string): boolean;

{construtor}
  constructor Create ;
end;

{Fim Classe Opessoa}


{Início Classe Ousuario}
type
 {Classe Ousuario}
Ousuario = Class(TOObject)
     private
      FID_USUARIO                                         : integer ;
      FDATATU                                             : real ;
      FUS_NOME                                            : string ;
      FUSUARIO                                            : string ;
      FCLI_ID                                             : integer ;
      FPRJ_ID                                             : integer ;
      procedure SetID_USUARIO(const value   : integer );
      procedure SetDATATU(const value   : real );
      procedure SetUS_NOME(const value   : string );
      procedure SetUSUARIO(const value   : string );
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );

  published
   property ID_USUARIO                                        : integer            read FID_USUARIO write SetID_USUARIO;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property US_NOME                                           : string             read FUS_NOME write SetUS_NOME;
   property USUARIO                                           : string             read FUSUARIO write SetUSUARIO;
   property CLI_ID                                            : integer            read FCLI_ID write SetCLI_ID;
   property PRJ_ID                                            : integer            read FPRJ_ID write SetPRJ_ID;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;

{ popula as properties do objeto de dados}
  procedure ddMap;

{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;

{construtor}
  constructor Create ;
end;

{Fim Classe Ousuario}


{Início Classe Ocompany}
type
 {Classe Ocompany}
Ocompany = Class(TOObject)
     private
      FCLI_ID                                             : integer ;
      FCLI_AREA_INTERESSE                                 : string ;
      FCLI_DIR                                            : string ;
      FCLI_NOME                                           : string ;
      FCLI_RAZ_O_SOCIAL                                   : string ;
      FDIR_ALIAS                                          : string ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetCLI_AREA_INTERESSE(const value   : string );
      procedure SetCLI_DIR(const value   : string );
      procedure SetCLI_NOME(const value   : string );
      procedure SetCLI_RAZ_O_SOCIAL(const value   : string );
      procedure SetDIR_ALIAS(const value   : string );



  published
   property CLI_ID                                            : integer            read FCLI_ID write SetCLI_ID;
   property CLI_AREA_INTERESSE                                : string            read FCLI_AREA_INTERESSE write SetCLI_AREA_INTERESSE;
   property CLI_DIR                                           : string             read FCLI_DIR write SetCLI_DIR;
   property CLI_NOME                                          : string             read FCLI_NOME write SetCLI_NOME;
   property CLI_RAZ_O_SOCIAL                                  : string             read FCLI_RAZ_O_SOCIAL write SetCLI_RAZ_O_SOCIAL;
   property DIR_ALIAS                                         : string             read FDIR_ALIAS write SetDIR_ALIAS;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;

{ popula as properties do objeto de dados}
  procedure ddMap;

{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;

 function GetaLL(): TstringList;

 function GetDesc(pCli: TOBjectId): string;


{construtor}
  constructor Create ;
end;

{Fim Classe Ocompany}


{Início Classe Oscenario}
type
 {Classe Oscenario}
Oscenario = Class(TOObject)
     private
      FCLI_ID                                             : integer ;
      FPRJ_ID                                             : integer ;
      FPRJ_TITULO                                         : string ;
      FPRJ_AREA_INTERESSE                                 : string ;
      FPRJ_CAMINHO                                        : string ;
      FPRJ_CARATER_RELEVANTE                              : string ;
      FPRJ_CARGA_HORA_DEMANDADA                           : real ;
      FPRJ_CLIENTE                                        : string ;
      FPRJ_COMPLEXIDADE                                   : string ;
      FPRJ_DATA_FIM_PLANEJADA                             : real ;
      FPRJ_DATA_INICIO                                    : real ;
      FIDF_DIRETORIO                                      : string ;
      FPRJ_DEFINICAO_CONTEXTO                             : string ;
      FPRJ_EQUIPE_PROJETO                                 : integer ;
      FPRJ_EXPECTATIVA_GANHO                              : string ;
      FPRJ_FATORES_RESTRITIVOS                            : string ;
      FPRJ_OBJETIVO                                       : string ;
      FPRJ_PATH                                           : string ;
      FPRJ_PATROCINADOR                                   : string ;
      FPRJ_PREMISSAS                                      : string ;
      FPRJ_QTDE_NECES_PROCES                              : real ;
      FPRJ_RESTRICOES                                     : real ;
      FPRJ_ALVOS_MELHORIA                                 : string ;
      FPRJ_STATUS                                         : string ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
      procedure SetPRJ_TITULO(const value   : string );
      procedure SetPRJ_AREA_INTERESSE(const value   : string );
      procedure SetPRJ_CAMINHO(const value   : string );
      procedure SetPRJ_CARATER_RELEVANTE(const value   : string );
      procedure SetPRJ_CARGA_HORA_DEMANDADA(const value   : real );
      procedure SetPRJ_CLIENTE(const value   : string );
      procedure SetPRJ_COMPLEXIDADE(const value   : string );
      procedure SetPRJ_DATA_FIM_PLANEJADA(const value   : real );
      procedure SetPRJ_DATA_INICIO(const value   : real );
      procedure SetIDF_DIRETORIO(const value   : string );
      procedure SetPRJ_DEFINICAO_CONTEXTO(const value   : string );
      procedure SetPRJ_EQUIPE_PROJETO(const value   : integer );
      procedure SetPRJ_EXPECTATIVA_GANHO(const value   : string );
      procedure SetPRJ_FATORES_RESTRITIVOS(const value   : string );
      procedure SetPRJ_OBJETIVO(const value   : string );
      procedure SetPRJ_PATH(const value   : string );
      procedure SetPRJ_PATROCINADOR(const value   : string );
      procedure SetPRJ_PREMISSAS(const value   : string );
      procedure SetPRJ_QTDE_NECES_PROCES(const value   : real );
      procedure SetPRJ_RESTRICOES(const value   : real );
      procedure SetPRJ_ALVOS_MELHORIA(const value   : string );
      procedure SetPRJ_STATUS(const value   : string );



  published
   property CLI_ID                                            : integer            read FCLI_ID write SetCLI_ID;
   property PRJ_ID                                            : integer            read FPRJ_ID write SetPRJ_ID;
   property PRJ_TITULO                                        : string             read FPRJ_TITULO write SetPRJ_TITULO;
   property PRJ_AREA_INTERESSE                                : string             read FPRJ_AREA_INTERESSE write SetPRJ_AREA_INTERESSE;
   property PRJ_CAMINHO                                       : string             read FPRJ_CAMINHO write SetPRJ_CAMINHO;
   property PRJ_CARATER_RELEVANTE                             : string             read FPRJ_CARATER_RELEVANTE write SetPRJ_CARATER_RELEVANTE;
   property PRJ_CARGA_HORA_DEMANDADA                          : real               read FPRJ_CARGA_HORA_DEMANDADA write SetPRJ_CARGA_HORA_DEMANDADA;
   property PRJ_CLIENTE                                       : string             read FPRJ_CLIENTE write SetPRJ_CLIENTE;
   property PRJ_COMPLEXIDADE                                  : string             read FPRJ_COMPLEXIDADE write SetPRJ_COMPLEXIDADE;
   property PRJ_DATA_FIM_PLANEJADA                            : real               read FPRJ_DATA_FIM_PLANEJADA write SetPRJ_DATA_FIM_PLANEJADA;
   property PRJ_DATA_INICIO                                   : real               read FPRJ_DATA_INICIO write SetPRJ_DATA_INICIO;
   property IDF_DIRETORIO                                     : string             read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   property PRJ_DEFINICAO_CONTEXTO                            : string            read FPRJ_DEFINICAO_CONTEXTO write SetPRJ_DEFINICAO_CONTEXTO;
   property PRJ_EQUIPE_PROJETO                                : integer            read FPRJ_EQUIPE_PROJETO write SetPRJ_EQUIPE_PROJETO;
   property PRJ_EXPECTATIVA_GANHO                             : string             read FPRJ_EXPECTATIVA_GANHO write SetPRJ_EXPECTATIVA_GANHO;
   property PRJ_FATORES_RESTRITIVOS                           : string             read FPRJ_FATORES_RESTRITIVOS write SetPRJ_FATORES_RESTRITIVOS;
   property PRJ_OBJETIVO                                      : string             read FPRJ_OBJETIVO write SetPRJ_OBJETIVO;
   property PRJ_PATH                                          : string             read FPRJ_PATH write SetPRJ_PATH;
   property PRJ_PATROCINADOR                                  : string             read FPRJ_PATROCINADOR write SetPRJ_PATROCINADOR;
   property PRJ_PREMISSAS                                     : string             read FPRJ_PREMISSAS write SetPRJ_PREMISSAS;
   property PRJ_QTDE_NECES_PROCES                             : real               read FPRJ_QTDE_NECES_PROCES write SetPRJ_QTDE_NECES_PROCES;
   property PRJ_RESTRICOES                                    : real               read FPRJ_RESTRICOES write SetPRJ_RESTRICOES;
   property PRJ_ALVOS_MELHORIA                                : string             read FPRJ_ALVOS_MELHORIA write SetPRJ_ALVOS_MELHORIA;
   property PRJ_STATUS                                        : string             read FPRJ_STATUS write SetPRJ_STATUS;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;

  function GetOfCompany(pCli : integer): TstringList;

 function GetDesc(pCenario: TObjectId): string;
{construtor}
  constructor Create ;
end;

procedure GetCompanyinCombo(pComboCli : TComboBox); 

{Fim Classe Oscenario}

  
{Início Classe Ousecase}
type
 {Classe Ousecase}
Ousecase = Class(TOObject)
     private
      FID_USECASE                                         : integer ;
      FDATATU                                             : real ;
      FUC_NOME                                            : string ;
      FUS_DESCRICAO                                       : string ;
      FUSUARIO                                            : string ;
      FCLI_ID                                             : integer ;
      FPRJ_ID                                             : integer ;
    FUC_LING: string;
      procedure SetID_USECASE(const value   : integer );
      procedure SetDATATU(const value   : real );
      procedure SetUC_NOME(const value   : string );
      procedure SetUS_DESCRICAO(const value   : string );
      procedure SetUSUARIO(const value   : string );
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
    procedure SetUC_LING(const Value: string);


  published
   property ID_USECASE                                        : integer            read FID_USECASE write SetID_USECASE;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property UC_NOME                                           : string             read FUC_NOME write SetUC_NOME;
   property US_DESCRICAO                                      : string             read FUS_DESCRICAO write SetUS_DESCRICAO;
   property GRUPO                                             : string             read FUSUARIO write SetUSUARIO;
   property UC_LING                                           : string read FUC_LING write SetUC_LING;
 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
 { retorna todos os usacase que não são do uauario}
 function GetAllNOT(pUsu,pCli,pProj: integer): TStringList;
 {retorna o código do use case a parrir do form}
 function CheckuseCase (pForm,pLing : string) : integer;

    { retorna os usecase do Grupo}
 function GetGrupo (pGrupo : string;pUsu,pCli,pProj : integer) : TStringList;

{construtor}
  constructor Create ;
end;

{Fim Classe Ousecase}


{Início Classe Oprivilegio}
type
 {Classe Oprivilegio}
Oprivilegio = Class(TOObject)
     private
      FID_PRIV                                            : integer ;
      FDATATU                                             : real ;
      FID_USECASE                                         : integer ;
      FID_USUARIO                                         : integer ;
      FUSUARIO                                            : string ;
      FACESSO                                             : string ;
      FNIVEIS_ABAIXO                                      : string ;
      FPRV_DESCRICAO                                      : string ;
    FCLI_ID: INTEGER;
    FPRJ_ID: INTEGER;
    FIDG_ID: INTEGER;
      procedure SetID_PRIV(const value   : integer );
      procedure SetDATATU(const value   : real );
      procedure SetID_USECASE(const value   : integer );
      procedure SetID_USUARIO(const value   : integer );
      procedure SetUSUARIO(const value   : string );
      procedure SetACESSO(const value   : string );
      procedure SetNIVEIS_ABAIXO(const value   : string );
      procedure SetPRV_DESCRICAO(const value   : string );
    procedure SetCLI_ID(const Value: INTEGER);
    procedure SetPRJ_ID(const Value: INTEGER);
    procedure SetIDG_ID(const Value: INTEGER);


  published
   property ID_PRIV                                           : integer            read FID_PRIV write SetID_PRIV;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property ID_USECASE                                        : integer            read FID_USECASE write SetID_USECASE;
   property ID_USUARIO                                        : integer            read FID_USUARIO write SetID_USUARIO;
   property USUARIO                                             : string             read FUSUARIO write SetUSUARIO;
   property ACESSO                                            : string             read FACESSO write SetACESSO;
   property NIVEIS_ABAIXO                                     : string             read FNIVEIS_ABAIXO write SetNIVEIS_ABAIXO;
   property PRV_DESCRICAO                                     : string             read FPRV_DESCRICAO write SetPRV_DESCRICAO;
   property CLI_ID                                            : INTEGER read FCLI_ID write SetCLI_ID;
   property PRJ_ID                                            : INTEGER read FPRJ_ID write SetPRJ_ID;
   property IDG_ID                                            : INTEGER read FIDG_ID write SetIDG_ID;
 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;

{ popula as properties do objeto de dados}
  procedure ddMap;

{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;

 {retorna os privilégios do usuário}
 function GetDoUsuario(pUsu,pCli,pProj,pTipo : integer;PlING : STRING) : TStringList; //pTipo : 1 : use case ; 2 : diagramas

 {delete os privilégios do usuário}
 function DelDoUsuario(pPriv,pTipo : integer; pLIng : string) : boolean;

 {checa privilégios}
 function CheckPrivilegio(pUsecase,pDiag,pUsu,pCli,pProj : integer;pLing : string) : integer;

{ retorna o # do privilegio do Diagrama/usuario}
 function GetDoUsuarioDiag(pUsu, pCli, pProj,pDiag: integer): integer;

 { deleata do privilegio do Diagrama/usuario}
 function DelDoUsuarioDiag(pUsu, pCli, pProj,pDiag: integer): boolean;

  { cria privilegio de Diagrama para usuario}
 function CriaPrivilegioDiag(pCli,pProj,pDiag,pUsu : integer;pAcesso,pNivel,pDesc : string;pdata : real): integer;

  { deleta todos os privilegios do usuario}
 function DelAllDoUsuario(pCli,pProj,pUsu : integer;pLIng : string) : boolean;



 {construtor}
  constructor Create ;
end;

{Fim Classe Oprivilegio}


{Início Classe Odiagramas}
type
 {Classe Odiagramas}
Odiagramas = Class(TOObject)
     private
      FCLI_ID                                             : integer ;
      FPRJ_ID                                             : integer ;
      FIDG_ID                                             : integer ;
      FDIAG_ID                                            : string ;
      FDIAG_PAI_ID                                        : integer ;
      FIDG_DIR                                            : string ;
      FSUB_NOME                                           : string ;
      FGRID_SHOW                                          : integer ;
      FGRID_SNAP                                          : string ;
      FIDG_DIAGRAM_STATUS                                 : integer ;
      FATIVIDADE_MAE                                      : integer ;
      FIDG_IDGCLASS                                       : string ;
      FIDG_NIVEL                                          : integer ;
      FIDG_UPDATEDATE                                     : real ;
      FSUB_ID                                             : integer ;
      FGRID_COR                                           : real ;
      FGRID_ALT                                           : integer ;
      FIDG_DIAG                                           : integer ;
      FGRID_LARG                                          : integer ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
      procedure SetIDG_ID(const value   : integer );
      procedure SetDIAG_ID(const value   : string );
      procedure SetDIAG_PAI_ID(const value   : integer );
      procedure SetIDG_DIR(const value   : string );
      procedure SetSUB_NOME(const value   : string );
      procedure SetGRID_SHOW(const value   : integer );
      procedure SetGRID_SNAP(const value   : string );
      procedure SetIDG_DIAGRAM_STATUS(const value   : integer );
      procedure SetATIVIDADE_MAE(const value   : integer );
      procedure SetIDG_IDGCLASS(const value   : string );
      procedure SetIDG_NIVEL(const value   : integer );
      procedure SetIDG_UPDATEDATE(const value   : real );
      procedure SetSUB_ID(const value   : integer );
      procedure SetGRID_COR(const value   : real );
      procedure SetGRID_ALT(const value   : integer );
      procedure SetIDG_DIAG(const value   : integer );
      procedure SetGRID_LARG(const value   : integer );

  published
   property CLI_ID                                            : integer            read FCLI_ID write SetCLI_ID;
   property PRJ_ID                                            : integer            read FPRJ_ID write SetPRJ_ID;
   property IDG_ID                                            : integer            read FIDG_ID write SetIDG_ID;
   property DIAG_ID                                           : string             read FDIAG_ID write SetDIAG_ID;
   property DIAG_PAI_ID                                       : integer            read FDIAG_PAI_ID write SetDIAG_PAI_ID;
   property IDG_DIR                                           : string             read FIDG_DIR write SetIDG_DIR;
   property SUB_NOME                                          : string             read FSUB_NOME write SetSUB_NOME;
   property GRID_SHOW                                         : integer            read FGRID_SHOW write SetGRID_SHOW;
   property GRID_SNAP                                         : string             read FGRID_SNAP write SetGRID_SNAP;
   property IDG_DIAGRAM_STATUS                                : integer            read FIDG_DIAGRAM_STATUS write SetIDG_DIAGRAM_STATUS;
   property ATIVIDADE_MAE                                     : integer            read FATIVIDADE_MAE write SetATIVIDADE_MAE;
   property IDG_IDGCLASS                                      : string             read FIDG_IDGCLASS write SetIDG_IDGCLASS;
   property IDG_NIVEL                                         : integer            read FIDG_NIVEL write SetIDG_NIVEL;
   property IDG_UPDATEDATE                                    : real               read FIDG_UPDATEDATE write SetIDG_UPDATEDATE;
   property SUB_ID                                            : integer            read FSUB_ID write SetSUB_ID;
   property GRID_COR                                          : real               read FGRID_COR write SetGRID_COR;
   property GRID_ALT                                          : integer            read FGRID_ALT write SetGRID_ALT;
   property IDG_DIAG                                          : integer            read FIDG_DIAG write SetIDG_DIAG;
   property GRID_LARG                                         : integer            read FGRID_LARG write SetGRID_LARG;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;

 { retorna todos os diagramas que não são do uauario}
 function GetAllNOT(pUsu,pCli,pProj: integer): TStringList;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
  
{construtor}
  constructor Create ;
end;  

{Fim Classe Odiagramas}


{FIM CLASSES}

function Encripta(pSenha : string) : string;


implementation

uses bst_dm_rel;


{INICIO METODOS}

function Encripta(pSenha : string) : string;
var
i : integer;
a1,a2 : integer;

begin
   result := '';
   for i := 1 to length(pSenha) do
     Begin
       a1 := 255 - ord(pSenha[i]);
       result  :=  result + chr(a1);
     end;

end;



procedure GetCompanyinCombo(pComboCli : TComboBox);
 Begin
  with OCompany.create do
    Begin
     pComboCli.items := GetAll;
     free;
    end;

 end;

  {Início Métodos Opessoa}
procedure Opessoa.ddMap;
  begin
   (DMObject as TPessoa).ID_PESSOA                    := ID_PESSOA;
   (DMObject as TPessoa).DATATU                       := DATATU;
   (DMObject as TPessoa).ID_USUARIO                   := ID_USUARIO;
   (DMObject as TPessoa).PES_NOME                     := PES_NOME;
   (DMObject as TPessoa).PES_SENHA                    := PES_SENHA;
   (DMObject as TPessoa).USUARIO                      := USUARIO;
  end;

procedure Opessoa.GetProperties;
  begin
   ID_PESSOA                                          := (DMObject as TPessoa).ID_PESSOA;
   DATATU                                             := (DMObject as TPessoa).DATATU;
   ID_USUARIO                                         := (DMObject as TPessoa).ID_USUARIO;
   PES_NOME                                           := (DMObject as TPessoa).PES_NOME;
   PES_SENHA                                          := (DMObject as TPessoa).PES_SENHA;
   USUARIO                                            := (DMObject as TPessoa).USUARIO;
  end;

function Opessoa.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;

function Opessoa.CheckAccess(pNome,pSenha : string) : boolean;
 begin
  result :=  (DMObject as Tpessoa).CheckLogin(pNome,encripta(pSenha));
end;

function Opessoa.CheckNOme(pNome : string): boolean;
 begin
  result :=  (DMObject as Tpessoa).CheckNOme(pNome);
end;

function Opessoa.AtuSenha(pId : integer;pSenha : string) : boolean;
 begin
  result :=  (DMObject as Tpessoa).AtuSenha(pId,encripta(pSenha));
end;


function Opessoa.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer;
 begin
  for i := 0 to pList.Count - 1 do
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Opessoa.create;
 begin
  DMObject := TDObject(TPessoa.create(nil));
  AtributoLista := 'PES_NOME';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Opessoa}

  {Início Métodos Ousuario}
procedure Ousuario.ddMap;
  begin
   (DMObject as TUsuario).ID_USUARIO                  := ID_USUARIO;
   (DMObject as TUsuario).DATATU                      := DATATU;
   (DMObject as TUsuario).US_NOME                     := US_NOME;
   (DMObject as TUsuario).USUARIO                     := USUARIO;
   (DMObject as TUsuario).CLI_ID                      := CLI_ID;
   (DMObject as TUsuario).PRJ_ID                      := PRJ_ID;
  end;

procedure Ousuario.GetProperties;
  begin
   ID_USUARIO                                         := (DMObject as TUsuario).ID_USUARIO;
   DATATU                                             := (DMObject as TUsuario).DATATU;
   US_NOME                                            := (DMObject as TUsuario).US_NOME;
   USUARIO                                            := (DMObject as TUsuario).USUARIO;
   CLI_ID                                             := (DMObject as TUsuario).CLI_ID;
   PRJ_ID                                             := (DMObject as TUsuario).PRJ_ID;
  end;

function Ousuario.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;



function Opessoa.GetContatos(pFK : string) : TStringAlignGrid;
 begin
   (DMObject as Tpessoa).GetAllDetailsGrid(self,pFK);
 end;

function Opessoa.DeletaContatos(pId: integer) : boolean;
 begin
  If (DMObject as Tpessoa).DeletaDaEmpresa(pId) then
     showmessage('Todos os Contatos da Empresa foram Eliminados!')
 end;

function Ousuario.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer;
 begin
  for i := 0 to pList.Count - 1 do
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Ousuario.create;
 begin
  DMObject := TDObject(TUsuario.create(nil));
  AtributoLista := 'US_NOME';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Ousuario}

  {Início Métodos Ocompany}
procedure Ocompany.ddMap;
  begin
   (DMObject as TCompany).CLI_ID                      := CLI_ID;
   (DMObject as TCompany).CLI_AREA_INTERESSE          := CLI_AREA_INTERESSE;
   (DMObject as TCompany).CLI_DIR                     := CLI_DIR;
   (DMObject as TCompany).CLI_NOME                    := CLI_NOME;
   (DMObject as TCompany).CLI_RAZ_O_SOCIAL            := CLI_RAZ_O_SOCIAL;
   (DMObject as TCompany).DIR_ALIAS                   := DIR_ALIAS;
  end;

procedure Ocompany.GetProperties;
  begin
   CLI_ID                                             := (DMObject as TCompany).CLI_ID;
   CLI_AREA_INTERESSE                                 := (DMObject as TCompany).CLI_AREA_INTERESSE;
   CLI_DIR                                            := (DMObject as TCompany).CLI_DIR;
   CLI_NOME                                           := (DMObject as TCompany).CLI_NOME;
   CLI_RAZ_O_SOCIAL                                   := (DMObject as TCompany).CLI_RAZ_O_SOCIAL;
   DIR_ALIAS                                          := (DMObject as TCompany).DIR_ALIAS;
  end;

function Ocompany.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Ocompany.GetaLL() : TstringList;
 begin
  result := (DMObject as TCompany).GetAlloBJECTS(self);
end;

function Ocompany.GetDesc(pCli : TObjectId) : string;
 begin
   Load(PcLI);
   GetProperties;
  result := Cli_nome;
end;


function Ocompany.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer;
 begin
  for i := 0 to pList.Count - 1 do
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Ocompany.create;
 begin
  DMObject := TDObject(TCompany.create(nil));
  AtributoLista := 'CLI_NOME';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Ocompany}

  {Início Métodos Oscenario}
procedure Oscenario.ddMap;
  begin
   (DMObject as TScenario).CLI_ID                     := CLI_ID;
   (DMObject as TScenario).PRJ_ID                     := PRJ_ID;
   (DMObject as TScenario).PRJ_TITULO                 := PRJ_TITULO;

  end;

procedure Oscenario.GetProperties;
  begin
   CLI_ID                                             := (DMObject as TScenario).CLI_ID;
   PRJ_ID                                             := (DMObject as TScenario).PRJ_ID;
   PRJ_TITULO                                         := (DMObject as TScenario).PRJ_TITULO;
   
  end;

function Oscenario.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;

function OScenario.GetOfCompany(pCli : integer) : TstringList;
 begin
  result := (DMObject as TScenario).GetFromCompany(self,pCli);
end;

function OScenario.GetDesc(pCenario: TObjectId) : string;
 begin
   Load(pCenario);
   GetProperties;
  //(DMObject as TCompany).LoadObject(self);
  result := prj_titulo;
end;

function Oscenario.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer;
 begin
  for i := 0 to pList.Count - 1 do
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Oscenario.create;
 begin
  DMObject := TDObject(TScenario.create(nil));
  AtributoLista := 'PRJ_TITULO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Oscenario}

  {Início Métodos Ousecase}
procedure Ousecase.ddMap;
  begin
   (DMObject as TUsecase).ID_USECASE                  := ID_USECASE;
   (DMObject as TUsecase).DATATU                      := DATATU;
   (DMObject as TUsecase).UC_NOME                     := UC_NOME;
   (DMObject as TUsecase).US_DESCRICAO                := US_DESCRICAO;
   (DMObject as TUsecase).GRUPO                       := GRUPO;
   (DMObject as TUsecase).UC_LING                     := UC_LING;
  end;

procedure Ousecase.GetProperties;
  begin
   ID_USECASE                                         := (DMObject as TUsecase).ID_USECASE;
   DATATU                                             := (DMObject as TUsecase).DATATU;
   UC_NOME                                            := (DMObject as TUsecase).UC_NOME;
   US_DESCRICAO                                       := (DMObject as TUsecase).US_DESCRICAO;
   GRUPO                                              := (DMObject as TUsecase).GRUPO;
   UC_LING                                            := (DMObject as TUsecase).UC_LING;
  end;

function Ousecase.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;

function OUseCase.GetAllNOT (pUsu,pCli,pProj : integer) : TStringList;
  Begin
    result := (DMObject as TUseCase).GetAllObjectsNOT(self,pUsu,pCli,pProj);
  end;

function OUseCase.GetGrupo (pGrupo : string;pUsu,pCli,pProj : integer) : TStringList;
  Begin
    result := (DMObject as TUseCase).GetGrupoNOT(self,pGrupo,pUsu,pCli,pProj);
  end;

function OUseCase.CheckuseCase (pForm,pLing : string) : integer;
  Begin
    result := (DMObject as TUseCase).GetIdUseCase(pForm,pLIng);
  end;


function Ousecase.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Ousecase.create;
 begin
  DMObject := TDObject(TUsecase.create(nil));
  AtributoLista := 'US_DESCRICAO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Ousecase}

  {Início Métodos Oprivilegio}
procedure Oprivilegio.ddMap;
  begin
   (DMObject as TPrivilegio).ID_PRIV                  := ID_PRIV;
   (DMObject as TPrivilegio).DATATU                   := DATATU;
   (DMObject as TPrivilegio).ID_USECASE               := ID_USECASE;
   (DMObject as TPrivilegio).IDG_ID                   := IDG_ID;
   (DMObject as TPrivilegio).ID_USUARIO               := ID_USUARIO;
   (DMObject as TPrivilegio).USUARIO                  := USUARIO;
   (DMObject as TPrivilegio).ACESSO                   := ACESSO;
   (DMObject as TPrivilegio).NIVEIS_ABAIXO            := NIVEIS_ABAIXO;
   (DMObject as TPrivilegio).PRV_DESCRICAO            := PRV_DESCRICAO;
   (DMObject as TPrivilegio).CLI_ID                   := CLI_ID;
   (DMObject as TPrivilegio).PRJ_ID                   := PRJ_ID;
  end;

procedure Oprivilegio.GetProperties;
  begin
   ID_PRIV                                            := (DMObject as TPrivilegio).ID_PRIV;
   DATATU                                             := (DMObject as TPrivilegio).DATATU;
   ID_USECASE                                         := (DMObject as TPrivilegio).ID_USECASE;
   IDG_ID                                             := (DMObject as TPrivilegio).IDG_ID;
   ID_USUARIO                                         := (DMObject as TPrivilegio).ID_USUARIO;
   USUARIO                                            := (DMObject as TPrivilegio).USUARIO;
   ACESSO                                             := (DMObject as TPrivilegio).ACESSO;
   NIVEIS_ABAIXO                                      := (DMObject as TPrivilegio).NIVEIS_ABAIXO;
   PRV_DESCRICAO                                      := (DMObject as TPrivilegio).PRV_DESCRICAO;
   CLI_ID                                             :=  (DMObject as TPrivilegio).CLI_ID ;                   ;
   PRJ_ID                                             :=  (DMObject as TPrivilegio).PRJ_ID  ;                 ;
  end;

function Oprivilegio.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1;
end;

function Oprivilegio.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer;
 begin
  for i := 0 to pList.Count - 1 do
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

function Oprivilegio.CriaPrivilegioDiag(pCli,pProj,pDiag,pUsu : integer;pAcesso,pNivel,pDesc : string;pdata : real): integer;
  Begin

    ID_PRIV      :=  0;
    DATATU       :=  pdata;
    ID_USECASE   :=  0;
    IDG_ID       := pDiag  ;
    ID_USUARIO   := pUsu;
    USUARIO      :=  '';
    ACESSO       := pAcesso;
    NIVEIS_ABAIXO:= pNivel;
    CLI_ID       := pcli;
    PRJ_ID       := pProj;
    PRV_DESCRICAO:= pDesc;
    ddmap;
    save;
    result := ID_PRIV;
  end;


constructor Oprivilegio.create;
 begin
  DMObject := TDObject(TPrivilegio.create(nil));
  AtributoLista := 'PRV_DESCRICAO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

function Oprivilegio.GetDoUsuario(pUsu,pCli,pProj,pTipo : integer;PlING : STRING) : TStringList;
  Begin
    result := (DMObject as TPrivilegio).GetDoUsuario(self,pUsu,pCli,pProj,pTipo,pLing);
  end;

function Oprivilegio.GetDoUsuarioDiag(pUsu, pCli, pProj,pDiag: integer): integer;
  Begin
    result := (DMObject as TPrivilegio).GetDoUsuarioDiag(self,pUsu,pCli,pProj,pDiag);
  end;

function Oprivilegio.DelDoUsuarioDiag(pUsu, pCli, pProj,pDiag: integer): boolean;
  Begin
    result := (DMObject as TPrivilegio).DelDoUsuarioDiag(self,pUsu,pCli,pProj,pDiag);
  end;

function Oprivilegio.DelDoUsuario(pPriv,pTipo : integer;pLing : string) : boolean;
  Begin
    result := (DMObject as TPrivilegio).DelDoUsuario(self, pPriv,pTipo,pLing);
  end;

function Oprivilegio.DelAllDoUsuario(pCli,pProj,pUsu : integer;pLIng : string) : boolean;
  Begin
    result := (DMObject as TPrivilegio).DelAllDoUsuario(pCli,pProj,pUsu,pLIng);
  end;

function Oprivilegio.CheckPrivilegio(pUsecase,pDiag,pUsu,pCli,pProj : integer;pLIng : string) : integer;
 begin
  result :=  (DMObject as TPrivilegio).CheckPriv(pUseCase,pDiag,pUsu,pCli,pProj,pLIng);
end;


{Fim Métodos Oprivilegio}

  {Início Métodos Odiagramas}
procedure Odiagramas.ddMap;
  begin
   (DMObject as TDiagramas).CLI_ID                    := CLI_ID;
   (DMObject as TDiagramas).PRJ_ID                    := PRJ_ID;
   (DMObject as TDiagramas).IDG_ID                    := IDG_ID;
   (DMObject as TDiagramas).DIAG_ID                   := DIAG_ID;
   (DMObject as TDiagramas).DIAG_PAI_ID               := DIAG_PAI_ID;
   (DMObject as TDiagramas).IDG_DIR                   := IDG_DIR;
   (DMObject as TDiagramas).SUB_NOME                  := SUB_NOME;
   (DMObject as TDiagramas).GRID_SHOW                 := GRID_SHOW;
   (DMObject as TDiagramas).GRID_SNAP                 := GRID_SNAP;
   (DMObject as TDiagramas).IDG_DIAGRAM_STATUS        := IDG_DIAGRAM_STATUS;
   (DMObject as TDiagramas).ATIVIDADE_MAE             := ATIVIDADE_MAE;
   (DMObject as TDiagramas).IDG_IDGCLASS              := IDG_IDGCLASS;
   (DMObject as TDiagramas).IDG_NIVEL                 := IDG_NIVEL;
   (DMObject as TDiagramas).IDG_UPDATEDATE            := IDG_UPDATEDATE;
   (DMObject as TDiagramas).SUB_ID                    := SUB_ID;
   (DMObject as TDiagramas).GRID_COR                  := GRID_COR;
   (DMObject as TDiagramas).GRID_ALT                  := GRID_ALT;
   (DMObject as TDiagramas).IDG_DIAG                  := IDG_DIAG;
   (DMObject as TDiagramas).GRID_LARG                 := GRID_LARG;
  end;

procedure Odiagramas.GetProperties;
  begin
   CLI_ID                                             := (DMObject as TDiagramas).CLI_ID;
   PRJ_ID                                             := (DMObject as TDiagramas).PRJ_ID;
   IDG_ID                                             := (DMObject as TDiagramas).IDG_ID;
   DIAG_ID                                            := (DMObject as TDiagramas).DIAG_ID;
   DIAG_PAI_ID                                        := (DMObject as TDiagramas).DIAG_PAI_ID;
   IDG_DIR                                            := (DMObject as TDiagramas).IDG_DIR;
   SUB_NOME                                           := (DMObject as TDiagramas).SUB_NOME;
   GRID_SHOW                                          := (DMObject as TDiagramas).GRID_SHOW;
   GRID_SNAP                                          := (DMObject as TDiagramas).GRID_SNAP;
   IDG_DIAGRAM_STATUS                                 := (DMObject as TDiagramas).IDG_DIAGRAM_STATUS;
   ATIVIDADE_MAE                                      := (DMObject as TDiagramas).ATIVIDADE_MAE;
   IDG_IDGCLASS                                       := (DMObject as TDiagramas).IDG_IDGCLASS;
   IDG_NIVEL                                          := (DMObject as TDiagramas).IDG_NIVEL;
   IDG_UPDATEDATE                                     := (DMObject as TDiagramas).IDG_UPDATEDATE;
   SUB_ID                                             := (DMObject as TDiagramas).SUB_ID;
   GRID_COR                                           := (DMObject as TDiagramas).GRID_COR;
   GRID_ALT                                           := (DMObject as TDiagramas).GRID_ALT;
   IDG_DIAG                                           := (DMObject as TDiagramas).IDG_DIAG;
   GRID_LARG                                          := (DMObject as TDiagramas).GRID_LARG;
  end;

function Odiagramas.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Odiagramas.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

function ODiagramas.GetAllNOT (pUsu,pCli,pProj : integer) : TStringList;
  Begin
    result := (DMObject as TDiagramas).GetAllObjectsNOT(self,pUsu,pCli,pProj);
  end;

constructor Odiagramas.create;
 begin
  DMObject := TDObject(TDiagramas.create(nil));
  AtributoLista := 'SUB_NOME';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;

{Fim Métodos Odiagramas}


{FIM METODOS}




{INICIO SET VALUES}
  {Início Set Values Opessoa}
{Set Value Opessoa}

procedure Opessoa.SetID_PESSOA(const value   : integer );
 begin
  FID_PESSOA := value;
 end;

procedure Opessoa.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Opessoa.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Opessoa.SetPES_NOME(const value   : string );
 begin
  FPES_NOME := value;
 end;

procedure Opessoa.SetPES_SENHA(const value   : string );
 begin
  FPES_SENHA := value;
 end;

procedure Opessoa.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

{Fim Set Values Opessoa}

  {Início Set Values Ousuario}
{Set Value Ousuario}

procedure Ousuario.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Ousuario.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Ousuario.SetUS_NOME(const value   : string );
 begin
  FUS_NOME := value;
 end;

procedure Ousuario.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Ousuario.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Ousuario.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

{Fim Set Values Ousuario}

  {Início Set Values Ocompany}
{Set Value Ocompany}

procedure Ocompany.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Ocompany.SetCLI_AREA_INTERESSE(const value   : string );
 begin
  FCLI_AREA_INTERESSE := value;
 end;

procedure Ocompany.SetCLI_DIR(const value   : string );
 begin
  FCLI_DIR := value;
 end;

procedure Ocompany.SetCLI_NOME(const value   : string );
 begin
  FCLI_NOME := value;
 end;

procedure Ocompany.SetCLI_RAZ_O_SOCIAL(const value   : string );
 begin
  FCLI_RAZ_O_SOCIAL := value;
 end;

procedure Ocompany.SetDIR_ALIAS(const value   : string );
 begin
  FDIR_ALIAS := value;
 end;

{Fim Set Values Ocompany}

  {Início Set Values Oscenario}
{Set Value Oscenario}

procedure Oscenario.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Oscenario.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Oscenario.SetPRJ_TITULO(const value   : string );
 begin
  FPRJ_TITULO := value;
 end;

procedure Oscenario.SetPRJ_AREA_INTERESSE(const value   : string );
 begin
  FPRJ_AREA_INTERESSE := value;
 end;

procedure Oscenario.SetPRJ_CAMINHO(const value   : string );
 begin
  FPRJ_CAMINHO := value;
 end;

procedure Oscenario.SetPRJ_CARATER_RELEVANTE(const value   : string );
 begin
  FPRJ_CARATER_RELEVANTE := value;
 end;

procedure Oscenario.SetPRJ_CARGA_HORA_DEMANDADA(const value   : real );
 begin
  FPRJ_CARGA_HORA_DEMANDADA := value;
 end;

procedure Oscenario.SetPRJ_CLIENTE(const value   : string );
 begin
  FPRJ_CLIENTE := value;
 end;

procedure Oscenario.SetPRJ_COMPLEXIDADE(const value   : string );
 begin
  FPRJ_COMPLEXIDADE := value;
 end;

procedure Oscenario.SetPRJ_DATA_FIM_PLANEJADA(const value   : real );
 begin
  FPRJ_DATA_FIM_PLANEJADA := value;
 end;

procedure Oscenario.SetPRJ_DATA_INICIO(const value   : real );
 begin
  FPRJ_DATA_INICIO := value;
 end;

procedure Oscenario.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Oscenario.SetPRJ_DEFINICAO_CONTEXTO(const value   : string );
 begin
  FPRJ_DEFINICAO_CONTEXTO := value;
 end;

procedure Oscenario.SetPRJ_EQUIPE_PROJETO(const value   : integer );
 begin
  FPRJ_EQUIPE_PROJETO := value;
 end;

procedure Oscenario.SetPRJ_EXPECTATIVA_GANHO(const value   : string );
 begin
  FPRJ_EXPECTATIVA_GANHO := value;
 end;

procedure Oscenario.SetPRJ_FATORES_RESTRITIVOS(const value   : string );
 begin
  FPRJ_FATORES_RESTRITIVOS := value;
 end;

procedure Oscenario.SetPRJ_OBJETIVO(const value   : string );
 begin
  FPRJ_OBJETIVO := value;
 end;

procedure Oscenario.SetPRJ_PATH(const value   : string );
 begin
  FPRJ_PATH := value;
 end;

procedure Oscenario.SetPRJ_PATROCINADOR(const value   : string );
 begin
  FPRJ_PATROCINADOR := value;
 end;

procedure Oscenario.SetPRJ_PREMISSAS(const value   : string );
 begin
  FPRJ_PREMISSAS := value;
 end;

procedure Oscenario.SetPRJ_QTDE_NECES_PROCES(const value   : real );
 begin
  FPRJ_QTDE_NECES_PROCES := value;
 end;

procedure Oscenario.SetPRJ_RESTRICOES(const value   : real );
 begin
  FPRJ_RESTRICOES := value;
 end;

procedure Oscenario.SetPRJ_ALVOS_MELHORIA(const value   : string );
 begin
  FPRJ_ALVOS_MELHORIA := value;
 end;

procedure Oscenario.SetPRJ_STATUS(const value   : string );
 begin
  FPRJ_STATUS := value;
 end;

{Fim Set Values Oscenario}

  {Início Set Values Ousecase}
{Set Value Ousecase}

procedure Ousecase.SetID_USECASE(const value   : integer );
 begin
  FID_USECASE := value;
 end;

procedure Ousecase.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Ousecase.SetUC_NOME(const value   : string );
 begin
  FUC_NOME := value;
 end;

procedure Ousecase.SetUS_DESCRICAO(const value   : string );
 begin
  FUS_DESCRICAO := value;
 end;

procedure Ousecase.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Ousecase.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Ousecase.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

{Fim Set Values Ousecase}

  {Início Set Values Oprivilegio}
{Set Value Oprivilegio}

procedure Oprivilegio.SetID_PRIV(const value   : integer );
 begin
  FID_PRIV := value;
 end;

procedure Oprivilegio.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Oprivilegio.SetID_USECASE(const value   : integer );
 begin
  FID_USECASE := value;
 end;

procedure Oprivilegio.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Oprivilegio.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Oprivilegio.SetACESSO(const value   : string );
 begin
  FACESSO := value;
 end;

procedure Oprivilegio.SetNIVEIS_ABAIXO(const value   : string );
 begin
  FNIVEIS_ABAIXO := value;
 end;

procedure Oprivilegio.SetPRV_DESCRICAO(const value   : string );
 begin
  FPRV_DESCRICAO := value;
 end;

{Fim Set Values Oprivilegio}

  {Início Set Values Odiagramas}
{Set Value Odiagramas}

procedure Odiagramas.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Odiagramas.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Odiagramas.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Odiagramas.SetDIAG_ID(const value   : string );
 begin
  FDIAG_ID := value;
 end;

procedure Odiagramas.SetDIAG_PAI_ID(const value   : integer );
 begin
  FDIAG_PAI_ID := value;
 end;

procedure Odiagramas.SetIDG_DIR(const value   : string );
 begin
  FIDG_DIR := value;
 end;

procedure Odiagramas.SetSUB_NOME(const value   : string );
 begin
  FSUB_NOME := value;
 end;

procedure Odiagramas.SetGRID_SHOW(const value   : integer );
 begin
  FGRID_SHOW := value;
 end;

procedure Odiagramas.SetGRID_SNAP(const value   : string );
 begin
  FGRID_SNAP := value;
 end;

procedure Odiagramas.SetIDG_DIAGRAM_STATUS(const value   : integer );
 begin
  FIDG_DIAGRAM_STATUS := value;
 end;

procedure Odiagramas.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Odiagramas.SetIDG_IDGCLASS(const value   : string );
 begin
  FIDG_IDGCLASS := value;
 end;

procedure Odiagramas.SetIDG_NIVEL(const value   : integer );
 begin
  FIDG_NIVEL := value;
 end;

procedure Odiagramas.SetIDG_UPDATEDATE(const value   : real );
 begin
  FIDG_UPDATEDATE := value;
 end;

procedure Odiagramas.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Odiagramas.SetGRID_COR(const value   : real );
 begin
  FGRID_COR := value;
 end;

procedure Odiagramas.SetGRID_ALT(const value   : integer );
 begin
  FGRID_ALT := value;
 end;

procedure Odiagramas.SetIDG_DIAG(const value   : integer );
 begin
  FIDG_DIAG := value;
 end;

procedure Odiagramas.SetGRID_LARG(const value   : integer );
 begin
  FGRID_LARG := value;
 end;

{Fim Set Values Odiagramas}


{FIM SET VALUES}

procedure Oprivilegio.SetCLI_ID(const Value: INTEGER);
begin
  FCLI_ID := Value;
end;

procedure Oprivilegio.SetPRJ_ID(const Value: INTEGER);
begin
  FPRJ_ID := Value;
end;

procedure Oprivilegio.SetIDG_ID(const Value: INTEGER);
begin
  FIDG_ID := Value;
end;

procedure Ousecase.SetUC_LING(const Value: string);
begin
  FUC_LING := Value;
end;

end.
