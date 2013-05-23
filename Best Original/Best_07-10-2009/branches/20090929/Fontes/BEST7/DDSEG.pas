unit DDSEG;

interface
uses
Aligrid,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,Provider,DBClient,
  ADODb,dbTables,math,strUtils,DB,db_tier,basetier;

type
  uLst = ^TLst;
  TLst = record
    eObj     : string;
end;

type

TQuerAdo = class(TAdoQuery)
  private
    FDS: TDataSource;
    procedure SetDS(const Value: TDataSource);     // query ADO


  published
    property DS : TDataSource  read FDS write SetDS;

  public
   constructor create(pds : TdataSource);overload;

end;

TQuer = class(TQuery)
  private
    FDS: TDataSource;
    procedure SetDS(const Value: TDataSource);



  published
    property DS : TDataSource   read FDS write SetDS;

  public
   constructor create(pds : TdataSource);overload;

end;


TDad = class(TDOBject)
  private
    FdDS: TDataSource;
    procedure SetdDS(const Value: TDataSource);


 protected
   DBD          : TDB;
   TipoQuery    : TClass;
   dSql         : string;
   dTabela      : string;
   DBdad        : TClass;


 published
  property dDS : TDataSource read FdDS write SetdDS;

 public
   constructor create(sender : Tclass);

end;

{INICIO CLASSES}

  
{Início Classe Tpessoa}
{Classe Tpessoa}
Tpessoa = Class(Tdad)
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
  
 { retorna todos os registros num Grid}
  function GetAllDetailsGrid(PDObject: TOObject;pFK : string ): TStringAlignGrid;

 { deleta todos os registros de contatos de uma empresa}
  function DeletaDaEmpresa(pid : integer) : boolean;
  
  {verifica login  - nome e senha}
  function CheckLogin(pNome, pSenha: string): boolean;

  {atualiza senha}
  function AtuSenha(pId: integer; pSenha: string): boolean;

   {Checa se o nome existe}
  function CHeckNOme(pNOme: string): boolean;




 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tpessoa}
end;  


  
{Início Classe Tusuario}
{Classe Tusuario}
Tusuario = Class(Tdad)
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tusuario}
end;  


  
{Início Classe Tcompany}
{Classe Tcompany}
Tcompany = Class(Tdad)
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tcompany}
end;  


  
{Início Classe Tscenario}
{Classe Tscenario}
Tscenario = Class(Tdad)
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
      FPRJ_DEFINICAO_CONTEXTO                             : string;
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey(pCLI_ID : integer ) : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);

  function GetFromCompany(PDObject: TOObject; PK: integer): TStringList;


 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tscenario}
end;  


  
{Início Classe Tusecase}
{Classe Tusecase}
Tusecase = Class(Tdad)
     private
      FID_USECASE                                         : integer ;
      FDATATU                                             : real ;
      FUC_NOME                                            : string ;
      FUS_DESCRICAO                                       : string ;
      FUSUARIO                                            : string ;
      FCLI_ID                                             : integer ;
      FPRJ_ID                                             : integer ;
    FUC_LING: sTring;
      procedure SetID_USECASE(const value   : integer );
      procedure SetDATATU(const value   : real );
      procedure SetUC_NOME(const value   : string );
      procedure SetUS_DESCRICAO(const value   : string );
      procedure SetUSUARIO(const value   : string );
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
    procedure SetUC_LING(const Value: sTring);






  published
   property ID_USECASE                                        : integer            read FID_USECASE write SetID_USECASE;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property UC_NOME                                           : string             read FUC_NOME write SetUC_NOME;
   property US_DESCRICAO                                      : string             read FUS_DESCRICAO write SetUS_DESCRICAO;
   property GRUPO                                             : string             read FUSUARIO write SetUSUARIO;
   property UC_LING                                           : string read FUC_LING write SetUC_LING;
{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;

 { RETOrNA OS PRIVILEGIOS que não são do usuario}
  function GetAllObjectsNOT(PDObject: TOObject; pUsu, pCli, pProj: integer): TStringList;

   { retorna os usecase do Grupo}
  function GetGrupo(PDObject: TOObject;pGrupo : string) :TStringList;

  { retorna os usecase do Grupo que não tem privilegiso para o usuario}
  function GetGrupoNOT(PDObject: TOObject; pGrupo: string; pUsu, pCli,pProj: integer): TStringList;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);

  {retorna o id do usecase a partir do nome do form}
  function GetIdUseCase(pForm,pLing : string) : integer;
 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tusecase}
end;  


  
{Início Classe Tprivilegio}
{Classe Tprivilegio}
Tprivilegio = Class(Tdad)
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
    FIDG_ID: integer;
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
    procedure SetIDG_ID(const Value: integer);





  published
   property ID_PRIV                                           : integer            read FID_PRIV write SetID_PRIV;
   property DATATU                                            : real               read FDATATU write SetDATATU;
   property ID_USECASE                                        : integer            read FID_USECASE write SetID_USECASE;
   property ID_USUARIO                                        : integer            read FID_USUARIO write SetID_USUARIO;
   property USUARIO                                           : string             read FUSUARIO write SetUSUARIO;
   property ACESSO                                            : string             read FACESSO write SetACESSO;
   property NIVEIS_ABAIXO                                     : string             read FNIVEIS_ABAIXO write SetNIVEIS_ABAIXO;
   property PRV_DESCRICAO                                     : string             read FPRV_DESCRICAO write SetPRV_DESCRICAO;
   property CLI_ID                                            : INTEGER read FCLI_ID write SetCLI_ID;
   property PRJ_ID                                            : INTEGER read FPRJ_ID write SetPRJ_ID;
   property IDG_ID                                            : integer read FIDG_ID write SetIDG_ID;

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;

{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
   {retorna os privilégios do usuário}
  function GetDoUsuario(PDObject: TOObject;pUsu,pCli,pProj : integer;pTipo : integer;pLIng : string) :TStringList;

  {deleta o privilégio do usuário}
  function DelDoUsuario(PDObject: TOObject;pPriv,pTipo : integer;pLing : string) : boolean;
  
  { checa privilégios}
  function  CheckPriv (pUsecase,pDiag,pUsu,pCli,pProj : integer;pLing : string) : integer;

  { retorna o # do privilegio do Diagrama/usuario}
  function GetDoUsuarioDiag(PDObject: TOObject; pUsu, pCli, pProj,pDiag: integer): integer;

   { delete o do privilegio do Diagrama/usuario}
  function DelDoUsuarioDiag(PDObject: TOObject; pUsu, pCli, pProj,pDiag: integer): boolean;

    { deleta todos do privilegios do usuario}
  function DelAllDoUsuario(pCli,pProj,pUsu : integer;pLing : string) : boolean;
 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tprivilegio}
end;  


  
{Início Classe Tdiagramas}
{Classe Tdiagramas}
Tdiagramas = Class(Tdad)
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey(pCLI_ID : integer ;pPRJ_ID : integer ) : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;

{ retorna todos os objetos sem privilégios}
  function GetAllObjectsNOT(PDObject: TOObject; pUsu, pCli, pProj: integer): TStringList;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
{Fim Classe Tdiagramas}
end;  



{FIM CLASSES}


implementation


{INICIO METODOS}


Constructor Tdad.create(sender : TClass);
   begin
      Dbd := Tdb.create(sender)
   end;

Constructor TQuerAdo.create(pds : TdataSource);   //ado query
   begin
    inherited create(application);

   end;

Constructor TQuer.create(pds : TdataSource);   //query   normal
   begin
    inherited create(application);

   end;




  {Início Métodos Tpessoa}
procedure Tpessoa.ddMap(DataSet: TDataSet);
  begin
      ID_PESSOA                 := DataSet.fieldbyname('ID_PESSOA').asinteger;
      DATATU                    := DataSet.fieldbyname('DATATU').asfloat;
      ID_USUARIO                := DataSet.fieldbyname('ID_USUARIO').asinteger;
      PES_NOME                  := DataSet.fieldbyname('PES_NOME').asstring;
      PES_SENHA                 := DataSet.fieldbyname('PES_SENHA').asstring;
      USUARIO                   := DataSet.fieldbyname('USUARIO').asstring;
  end;


{Tpessoa Métodos}

constructor Tpessoa.Create ;
  begin
   DBD := DBATU;
  end;


function TPessoa.CheckLogin(pNome,pSenha : string) :boolean;
 var 
iEmp : TQuerAdo;
 begin
  iEmp := TQuerAdo.create(nil);
  with iEmp do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PESSOA WHERE PES_NOME = '+''''+pNOme +''''+ 'AND ' +
                ' PES_SENHA = '+ ''''+pSenha+'''';

    open;
    If not Eof THEN
       Begin
         result := true  ;
         ddmap(iEmp);
       end     
    else
     result := false;
 end;
end;


 function Tpessoa.GetAllDetailsGrid(PDObject: TOObject;pFK : string ): TStringAlignGrid; 
 var                                                                                       
  i,j,m,n : integer;                                                                       
  pList : TStringAlignGrid;                                                                
  begin                                                                                    
   pList := PDObject.ListaGrid;                                                            
   j := pList.FixedCols ;                                                                  
   i := pList.FixedRows;                                                                   
   with TQuerAdo.create(nil) do                                                            
    begin                                                                                  
                                                                                           
     Connection  := (dbd.DbTipo as TAdoConnection);                                        
     close;                                                                                
     sql.clear;                                                                            
     sql.text := 'SELECT * FROM IDF_PESSOA WHERE ID_USUARIO = '+pfk;
     open;                                                                                 
     While not Eof do                                                                      
       begin;                                                                              
        for m := 0 to pList.colcount -1 do  //monta o grid a aprtir dos campos definidos no objeto do grid (monta_cab) 
         begin                                                                             
           pList.Cells[m,i] := fieldbyname((pList.Objects[m,0] as TProp).nomecampo).AsString;
         end;                                                                     
         PDObject.PK := Tpk.create;                                               
         PDObject.PK.PK1 := fieldbyname('ID_PESSOA').Value; 
         pList.Objects[ 0,i] := PDObject.PK;                                      
         inc(i);                                                                  
         If i > pList.RowCount - pList.FixedRows then                             
          begin                                                                  
            pList.RowCount  := pList.RowCount+1;                                 
          end;                                                                   
                                                                                 
         next;                                                                    
       end;                                                                       
       result := pList;                                                           
    end;                                                                            
  end;                                                                             


 function Tpessoa.DeletadaEmpresa (pId : integer) : boolean;
  begin
   with TQuerAdo.create(nil) do
     begin
       Connection  := (dbd.DbTipo as TAdoConnection);
       DecimalSeparator := '.';
       close;
       sql.clear;
       sql.text := 'DELETE * FROM IDF_PESSOA WHERE '+
       'WHERE ID_EMP = IDF_USUARIO'+InttoStr(pid);
       execsql;
       If rowsaffected > 0 then
         result := true;
     end;
   DecimalSeparator := '.';
 end;
  


function Tpessoa.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tpessoa;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do
  begin
    Connection  := (dbd.DbTipo as TAdoConnection);
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_PESSOA'+
' WHERE ID_PESSOA = '+InttoStr(ID_PESSOA);


    open;
    If eof then 
     begin
      begin
         oObj := Tpessoa.create(nil);
         oObj.ID_PESSOA:= ID_PESSOA;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         ID_PESSOA := WKEY;
      end;
       sql.text := 'INSERT INTO IDF_PESSOA('+
       'ID_PESSOA,'+
       'DATATU,'+
       'ID_USUARIO,'+
       'PES_NOME,'+
       'PES_SENHA,'+
        'USUARIO)'+
       'VALUES ('+

       InttoStr(ID_PESSOA)+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
       InttoStr(ID_USUARIO)+','+
       AnsiQuotedStr(PES_NOME,chr(39))+','+
       AnsiQuotedStr(PES_SENHA,chr(39))+','+
       AnsiQuotedStr(USUARIO,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else
  begin
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_PESSOA'+
   ' SET '+
   'DATATU = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
   'ID_USUARIO = '+InttoStr(ID_USUARIO)+','+
   'PES_NOME = '+AnsiQuotedStr(PES_NOME,chr(39))+','+
   'PES_SENHA = '+AnsiQuotedStr(PES_SENHA,chr(39))+','+
   'USUARIO = '+AnsiQuotedStr(USUARIO,chr(39))+
    ' WHERE ID_PESSOA = '+InttoStr(ID_PESSOA);


   execsql;
   If rowsaffected > 0 then
     PDObject.resulta := 'Atualizado!';
   end;
  end;
 DecimalSeparator := ',';
end;

function Tpessoa.AtuSenha(pId : integer;pSenha : string): boolean;

begin

 With TQuerAdo.create(nil) do
  begin
    Connection  := (dbd.DbTipo as TAdoConnection);
    DecimalSeparator := '.';
    close;
    sql.clear;
    close;
   sql.clear;
   sql.text := 'UPDATE IDF_PESSOA '+
   'SET PES_SENHA = '+AnsiQuotedStr(pSenha,chr(39))+
   ' WHERE ID_PESSOA = '+''+InttoStr(pId)+'';
   
   execsql;
   If rowsaffected > 0 then
    result := true
   else
    result := false;
  end;
 DecimalSeparator := ',';
end;


procedure Tpessoa.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_PESSOA'+
     ' WHERE ID_PESSOA = '+InttoStr(ID_PESSOA);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tpessoa.LoadObject (PDObject: TOObject);
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_PESSOA'+
' WHERE ID_PESSOA = '+ PDObject.Id ;


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;

function Tpessoa.CHeckNOme(pNOme : string) : boolean;
var
iEmp : TQuerAdo;
 begin
   result := false;
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_PESSOA'+
                   ' WHERE PES_NOME = '+ ''''+pNome+'''' ;


       open;
       If not Eof then 
         begin
           result := true;
           ddmap(iEmp);
         end; 
     end;
end;


function Tpessoa.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT ID_PESSOA AS MAXK FROM IDF_PESSOA'+
' WHERE ID_PESSOA = (SELECT MAX(ID_PESSOA) FROM IDF_PESSOA'+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tpessoa.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PESSOA'
;

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_PESSOA').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

{Fim Métodos Tpessoa}

  {Início Métodos Tusuario}
procedure Tusuario.ddMap(DataSet: TDataSet);
  begin
      ID_USUARIO                := DataSet.fieldbyname('ID_USUARIO').asinteger;
      DATATU                    := DataSet.fieldbyname('DATATU').asfloat;
      US_NOME                   := DataSet.fieldbyname('US_NOME').asstring;
      USUARIO                   := DataSet.fieldbyname('USUARIO').asstring;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
  end;


{Tusuario Métodos}

constructor Tusuario.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tusuario.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tusuario;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_USUARIO'+
' WHERE ID_USUARIO = '+InttoStr(ID_USUARIO);


    open;
    If eof then 
     begin
      begin
         oObj := Tusuario.create(nil);
         oObj.ID_USUARIO:= ID_USUARIO;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         ID_USUARIO := WKEY;
      end;
       sql.text := 'INSERT INTO IDF_USUARIO('+
       'ID_USUARIO,'+
       'DATATU,'+
       'US_NOME,'+
       'USUARIO,'+
       'CLI_ID,'+
        'PRJ_ID)'+
       'VALUES ('+

       InttoStr(ID_USUARIO)+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
       AnsiQuotedStr(US_NOME,chr(39))+','+
       AnsiQuotedStr(USUARIO,chr(39))+','+
       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_USUARIO'+
   ' SET '+
   'DATATU = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
   'US_NOME = '+AnsiQuotedStr(US_NOME,chr(39))+','+
   'USUARIO = '+AnsiQuotedStr(USUARIO,chr(39))+','+
   'CLI_ID = '+InttoStr(CLI_ID)+','+
   'PRJ_ID = '+InttoStr(PRJ_ID)+
    ' WHERE ID_USUARIO = '+InttoStr(ID_USUARIO);


   execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tusuario.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_USUARIO'+
     ' WHERE ID_USUARIO = '+InttoStr(ID_USUARIO);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tusuario.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do  
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_USUARIO'+
' WHERE ID_USUARIO = '+ PDObject.Id ;


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;


function Tusuario.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT ID_USUARIO AS MAXK FROM IDF_USUARIO'+
' WHERE ID_USUARIO = (SELECT MAX(ID_USUARIO) FROM IDF_USUARIO'+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tusuario.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_USUARIO'
;

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_USUARIO').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;


{Fim Métodos Tusuario}

  {Início Métodos Tcompany}
procedure Tcompany.ddMap(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      CLI_AREA_INTERESSE        := DataSet.fieldbyname('CLI_AREA_INTERESSE').asstring;
      CLI_DIR                   := DataSet.fieldbyname('CLI_DIR').asstring;
      CLI_NOME                  := DataSet.fieldbyname('CLI_NOME').asstring;
      CLI_RAZ_O_SOCIAL          := DataSet.fieldbyname('CLI_RAZ_O_SOCIAL').asstring;
      DIR_ALIAS                 := DataSet.fieldbyname('DIR_ALIAS').asstring;
  end;


{Tcompany Métodos}

constructor Tcompany.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tcompany.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tcompany;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM CLI_CLIENTE'+
' WHERE CLI_ID = '+InttoStr(CLI_ID);


    open;
    If eof then 
     begin
      begin
         oObj := Tcompany.create(nil);
         oObj.CLI_ID:= CLI_ID;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         CLI_ID := WKEY;
      end;
       sql.text := 'INSERT INTO CLI_CLIENTE('+
       'CLI_ID,'+
       'CLI_AREA_INTERESSE,'+
       'CLI_DIR,'+
       'CLI_NOME,'+
       'CLI_RAZ_O_SOCIAL,'+
        'DIR_ALIAS)'+
       'VALUES ('+

       InttoStr(CLI_ID)+','+
       AnsiQuotedStr(CLI_AREA_INTERESSE,chr(39))+','+
       AnsiQuotedStr(CLI_DIR,chr(39))+','+
       AnsiQuotedStr(CLI_NOME,chr(39))+','+
       AnsiQuotedStr(CLI_RAZ_O_SOCIAL,chr(39))+','+
       AnsiQuotedStr(DIR_ALIAS,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE CLI_CLIENTE'+
   ' SET '+
   'CLI_AREA_INTERESSE = '+AnsiQuotedStr(CLI_AREA_INTERESSE,chr(39))+','+
   'CLI_DIR = '+AnsiQuotedStr(CLI_DIR,chr(39))+','+
   'CLI_NOME = '+AnsiQuotedStr(CLI_NOME,chr(39))+','+
   'CLI_RAZ_O_SOCIAL = '+AnsiQuotedStr(CLI_RAZ_O_SOCIAL,chr(39))+','+
   'DIR_ALIAS = '+AnsiQuotedStr(DIR_ALIAS,chr(39))+
    ' WHERE CLI_ID = '+InttoStr(CLI_ID);


   execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tcompany.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM CLI_CLIENTE'+
     ' WHERE CLI_ID = '+InttoStr(CLI_ID);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tcompany.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do  
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM CLI_CLIENTE'+
' WHERE CLI_ID = '+ PDObject.Id ;


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;


function Tcompany.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT CLI_ID AS MAXK FROM CLI_CLIENTE'+
' WHERE CLI_ID = (SELECT MAX(CLI_ID) FROM CLI_CLIENTE'+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tcompany.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM CLI_CLIENTE'
;

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('CLI_ID').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function TScenario.GetFromCompany(PDObject: TOObject;PK : integer) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM PRJ_PROJETO  WHERE CLI_ID = '+''+inttostr(PK)+'';

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('PRJ_ID').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

{Fim Métodos Tcompany}

  {Início Métodos Tscenario}
procedure Tscenario.ddMap(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      PRJ_TITULO                := DataSet.fieldbyname('PRJ_TITULO').asstring;
      
  end;


{Tscenario Métodos}

constructor Tscenario.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tscenario.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tscenario;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM PRJ_PROJETO'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID);


    open;
    If eof then 
     begin
      begin
         oObj := Tscenario.create(nil);
         oObj.CLI_ID:= CLI_ID;
         oObj.PRJ_ID:= PRJ_ID;
         wkey := oObj.get_maxkey(CLI_ID) + 1;
         Freeandnil(oObj);
         PRJ_ID := WKEY;
      end;
       sql.text := 'INSERT INTO PRJ_PROJETO('+
       'CLI_ID,'+
       'PRJ_ID,'+
       'PRJ_TITULO,'+
       'PRJ_AREA_INTERESSE,'+
       'PRJ_CAMINHO,'+
       'PRJ_CARATER_RELEVANTE,'+
       'PRJ_CARGA_HORA_DEMANDADA,'+
       'PRJ_CLIENTE,'+
       'PRJ_COMPLEXIDADE,'+
       'PRJ_DATA_FIM_PLANEJADA,'+
       'PRJ_DATA_INICIO,'+
       'IDF_DIRETORIO,'+
       'PRJ_DEFINICAO_CONTEXTO,'+
       'PRJ_EQUIPE_PROJETO,'+
       'PRJ_EXPECTATIVA_GANHO,'+
       'PRJ_FATORES_RESTRITIVOS,'+
       'PRJ_OBJETIVO,'+
       'PRJ_PATH,'+
       'PRJ_PATROCINADOR,'+
       'PRJ_PREMISSAS,'+
       'PRJ_QTDE_NECES_PROCES,'+
       'PRJ_RESTRICOES,'+
       'PRJ_ALVOS_MELHORIA,'+
        'PRJ_STATUS)'+
       'VALUES ('+

       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+','+
       AnsiQuotedStr(PRJ_TITULO,chr(39))+','+
       AnsiQuotedStr(PRJ_AREA_INTERESSE,chr(39))+','+
       AnsiQuotedStr(PRJ_CAMINHO,chr(39))+','+
       AnsiQuotedStr(PRJ_CARATER_RELEVANTE,chr(39))+','+
       FloattoStr(PRJ_CARGA_HORA_DEMANDADA)+','+
       AnsiQuotedStr(PRJ_CLIENTE,chr(39))+','+
       AnsiQuotedStr(PRJ_COMPLEXIDADE,chr(39))+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',PRJ_DATA_FIM_PLANEJADA),chr(39))+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',PRJ_DATA_INICIO),chr(39))+','+
       AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
       AnsiQuotedStr(PRJ_DEFINICAO_CONTEXTO,chr(39))+','+
       InttoStr(PRJ_EQUIPE_PROJETO)+','+
       AnsiQuotedStr(PRJ_EXPECTATIVA_GANHO,chr(39))+','+
       AnsiQuotedStr(PRJ_FATORES_RESTRITIVOS,chr(39))+','+
       AnsiQuotedStr(PRJ_OBJETIVO,chr(39))+','+
       AnsiQuotedStr(PRJ_PATH,chr(39))+','+
       AnsiQuotedStr(PRJ_PATROCINADOR,chr(39))+','+
       AnsiQuotedStr(PRJ_PREMISSAS,chr(39))+','+
       FloattoStr(PRJ_QTDE_NECES_PROCES)+','+
       FloattoStr(PRJ_RESTRICOES)+','+
       AnsiQuotedStr(PRJ_ALVOS_MELHORIA,chr(39))+','+
       AnsiQuotedStr(PRJ_STATUS,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE PRJ_PROJETO'+
   ' SET '+
   'PRJ_TITULO = '+AnsiQuotedStr(PRJ_TITULO,chr(39))+','+
   'PRJ_AREA_INTERESSE = '+AnsiQuotedStr(PRJ_AREA_INTERESSE,chr(39))+','+
   'PRJ_CAMINHO = '+AnsiQuotedStr(PRJ_CAMINHO,chr(39))+','+
   'PRJ_CARATER_RELEVANTE = '+AnsiQuotedStr(PRJ_CARATER_RELEVANTE,chr(39))+','+
   'PRJ_CARGA_HORA_DEMANDADA = '+FloattoStr(PRJ_CARGA_HORA_DEMANDADA)+','+
   'PRJ_CLIENTE = '+AnsiQuotedStr(PRJ_CLIENTE,chr(39))+','+
   'PRJ_COMPLEXIDADE = '+AnsiQuotedStr(PRJ_COMPLEXIDADE,chr(39))+','+
   'PRJ_DATA_FIM_PLANEJADA = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',PRJ_DATA_FIM_PLANEJADA),chr(39))+','+
   'PRJ_DATA_INICIO = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',PRJ_DATA_INICIO),chr(39))+','+
   'IDF_DIRETORIO = '+AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
   'PRJ_DEFINICAO_CONTEXTO = '+AnsiQuotedStr(PRJ_DEFINICAO_CONTEXTO,chr(39))+','+
   'PRJ_EQUIPE_PROJETO = '+InttoStr(PRJ_EQUIPE_PROJETO)+','+
   'PRJ_EXPECTATIVA_GANHO = '+AnsiQuotedStr(PRJ_EXPECTATIVA_GANHO,chr(39))+','+
   'PRJ_FATORES_RESTRITIVOS = '+AnsiQuotedStr(PRJ_FATORES_RESTRITIVOS,chr(39))+','+
   'PRJ_OBJETIVO = '+AnsiQuotedStr(PRJ_OBJETIVO,chr(39))+','+
   'PRJ_PATH = '+AnsiQuotedStr(PRJ_PATH,chr(39))+','+
   'PRJ_PATROCINADOR = '+AnsiQuotedStr(PRJ_PATROCINADOR,chr(39))+','+
   'PRJ_PREMISSAS = '+AnsiQuotedStr(PRJ_PREMISSAS,chr(39))+','+
   'PRJ_QTDE_NECES_PROCES = '+FloattoStr(PRJ_QTDE_NECES_PROCES)+','+
   'PRJ_RESTRICOES = '+FloattoStr(PRJ_RESTRICOES)+','+
   'PRJ_ALVOS_MELHORIA = '+AnsiQuotedStr(PRJ_ALVOS_MELHORIA,chr(39))+','+
   'PRJ_STATUS = '+AnsiQuotedStr(PRJ_STATUS,chr(39))+
    ' WHERE CLI_ID = '+''+InttoStr(CLI_ID)+''
+' AND PRJ_ID = '+''+InttoStr(PRJ_ID)+'';


   execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tscenario.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM PRJ_PROJETO'+
     ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tscenario.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do  
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM PRJ_PROJETO'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID);


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;


function Tscenario.Get_MaxKey (pCLI_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT CLI_ID AS MAXK FROM PRJ_PROJETO'+
' WHERE CLI_ID = (SELECT MAX(CLI_ID) FROM PRJ_PROJETO'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tscenario.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM PRJ_PROJETO'
+' WHERE CLI_ID = '+InttoStr(CLI_ID);


    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('PRJ_ID').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

{Fim Métodos Tscenario}

  {Início Métodos Tusecase}
procedure Tusecase.ddMap(DataSet: TDataSet);
  begin
      ID_USECASE                := DataSet.fieldbyname('ID_USECASE').asinteger;
      DATATU                    := DataSet.fieldbyname('DATATU').asfloat;
      UC_NOME                   := DataSet.fieldbyname('UC_NOME').asstring;
      US_DESCRICAO              := DataSet.fieldbyname('US_DESCRICAO').asstring;
      GRUPO                     := DataSet.fieldbyname('GRUPO').asstring;
      UC_LING                   := DataSet.fieldbyname('UC_LING').asstring;
  end;


{Tusecase Métodos}

constructor Tusecase.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tusecase.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tusecase;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do
  begin
    Connection  := (dbd.DbTipo as TAdoConnection);
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_USECASE WHERE ID_USECASE = '+InttoStr(ID_USECASE)+
                    ' AND UC_LING = ' +''''+UC_LING+'''';
    open;
    If eof then
     begin
      sql.text :=     'SELECT * FROM IDF_USECASE WHERE UC_NOME  = '+''''+UC_NOME+''''+
                       ' AND UC_LING = ' +''''+UC_LING+'''';
      open;
      If not eof then
         Begin
            PDObject.resulta := 'Já existe uma Tela com esse Nome !';
            Result := 0;
         end
      else
      begin
         oObj := Tusecase.create(nil);
         oObj.ID_USECASE:= ID_USECASE;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         ID_USECASE := WKEY;
         sql.text := 'INSERT INTO IDF_USECASE('+
         'ID_USECASE,'+
         'DATATU,'+
         'UC_NOME,'+
         'UC_LING,'+
         'US_DESCRICAO,'+
         'GRUPO)'+

         'VALUES ('+

         InttoStr(ID_USECASE)+','+
         AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
         AnsiQuotedStr(UC_NOME,chr(39))+','+
         AnsiQuotedStr(UC_LING,chr(39))+','+
         AnsiQuotedStr(US_DESCRICAO,chr(39))+','+
         AnsiQuotedStr(GRUPO,chr(39))+')';
        execsql;
        If rowsaffected > 0 then
          begin
            PDObject.resulta := 'Incluido!';
           result := wkey;
         end;
       end;
     end
 else
      begin
       close;
       sql.clear;
       sql.text := 'UPDATE IDF_USECASE'+
       ' SET '+
       'DATATU = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
       'UC_NOME = '+AnsiQuotedStr(UC_NOME,chr(39))+','+
       'UC_LING = '+AnsiQuotedStr(UC_LING,chr(39))+','+
       'US_DESCRICAO = '+AnsiQuotedStr(US_DESCRICAO,chr(39))+','+
       'GRUPO = '+AnsiQuotedStr(GRUPO,chr(39))+
       ' WHERE ID_USECASE = '+InttoStr(ID_USECASE);


       execsql;
       If rowsaffected > 0 then
         PDObject.resulta := 'Atualizado!';
       end;
      end;
 DecimalSeparator := ',';
end;


procedure Tusecase.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do
    begin
      Connection  := (dbd.DbTipo as TAdoConnection);
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_USECASE'+
     ' WHERE ID_USECASE = '+InttoStr(ID_USECASE)+
     ' AND UC_LING = ' +''''+UC_LING+'''';


      execsql;
      If rowsaffected > 0 then
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tusecase.LoadObject (PDObject: TOObject);
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_USECASE'+
                   ' WHERE ID_USECASE = '+ PDObject.Id ;  
       open;
       If not Eof then
         begin
           ddmap(iEmp);
         end;
     end;
end;

function Tusecase.GetIdUseCase(pForm,pLing : string) : integer;
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_USECASE WHERE UC_NOME = '+ ''''+pForm+'''' +
                   ' AND UC_LING = ' +''''+pLing+'''';
       open;
       If not Eof then
         begin
           ddmap(iEmp);
           result := ID_USECASE;
         end
       else
         result := 0;
     end;
end;


function Tusecase.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do
  begin
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT ID_USECASE AS MAXK FROM IDF_USECASE'+
' WHERE ID_USECASE = (SELECT MAX(ID_USECASE) FROM IDF_USECASE'+')';

   open;
   If not eof  then
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tusecase.GetAllObjects(PDObject: TOObject) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_USECASE '+
                '   WHERE UC_LING = ' +''''+UC_LING+'''';
    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_USECASE').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function Tusecase.GetGrupo(PDObject: TOObject;pGrupo : string) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_USECASE WHERE GRUPO = '+''''+pGrupo+''''+
                ' AND UC_LING = ' +''''+UC_LING+'''';
    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_USECASE').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function Tusecase.GetGrupoNOT(PDObject: TOObject;pGrupo : string;pUsu,pCli,pProj : integer) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
   // sql.text := 'SELECT * FROM IDF_USECASE WHERE GRUPO = '+''''+pGrupo+'''';

    sql.text := 'SELECT * FROM IDF_USECASE WHERE ID_USECASE NOT IN '+
                '(SELECT ID_USECASE FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+''+INTTOSTR(PuSU)+'' +
                ' AND UC_LING = ' +''''+UC_LING+''''+
                ' AND CLI_ID = '+''+INTTOSTR(pCli)+'' +
                ' AND PRJ_ID = '+''+INTTOSTR(pProj)+'' +')' +
                ' AND GRUPO = '+''''+pGrupo+'''' +
                ' AND UC_LING = ' +''''+UC_LING+'''';
    sql.SaveToFile('C:\sql.txt');
    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_USECASE').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function Tusecase.GetAllObjectsNOT(PDObject: TOObject;pUsu,pCli,pProj : integer) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_USECASE WHERE ID_USECASE NOT IN '+
                '(SELECT ID_USECASE FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+''+INTTOSTR(PuSU)+'' +
                ' AND UC_LING = ' +''''+UC_LING+''''+
                ' AND CLI_ID = '+''+INTTOSTR(pCli)+'' +
                ' AND PRJ_ID = '+''+INTTOSTR(pProj)+'' +')' +
                ' AND UC_LING = ' +''''+UC_LING+'''';


    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_USECASE').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;



{Fim Métodos Tusecase}

  {Início Métodos Tprivilegio}
procedure Tprivilegio.ddMap(DataSet: TDataSet);
  begin
      ID_PRIV                   := DataSet.fieldbyname('ID_PRIV').asinteger;
      DATATU                    := DataSet.fieldbyname('DATATU').asfloat;
      ID_USECASE                := DataSet.fieldbyname('ID_USECASE').asinteger;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      ID_USUARIO                := DataSet.fieldbyname('ID_USUARIO').asinteger;
      USUARIO                   := DataSet.fieldbyname('USUARIO').asstring;
      ACESSO                    := DataSet.fieldbyname('ACESSO').asstring;
      NIVEIS_ABAIXO             := DataSet.fieldbyname('NIVEIS_ABAIXO').asstring;
      PRV_DESCRICAO             := DataSet.fieldbyname('PRV_DESCRICAO').asstring;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;

  end;


{Tprivilegio Métodos}

constructor Tprivilegio.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tprivilegio.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tprivilegio;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_PRIVILEGIOS WHERE ID_PRIV = '+InttoStr(ID_PRIV);
    open;

    If eof then 
     begin  
         oObj := Tprivilegio.create(nil);
         oObj.ID_PRIV:= ID_PRIV;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         ID_PRIV := WKEY;

       sql.text := 'INSERT INTO IDF_PRIVILEGIOS('+
       'ID_PRIV,'+
       'DATATU,'+
       'ID_USECASE,'+
       'IDG_ID,'+
       'ID_USUARIO,'+
       'USUARIO,'+
       'ACESSO,'+
       'NIVEIS_ABAIXO,'+
       'CLI_ID,'+
       'PRJ_ID,'+
        'PRV_DESCRICAO)'+
       'VALUES ('+

       InttoStr(ID_PRIV)+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
       InttoStr(ID_USECASE)+','+
       InttoStr(IDG_ID)+','+
       InttoStr(ID_USUARIO)+','+
       AnsiQuotedStr(USUARIO,chr(39))+','+
       AnsiQuotedStr(ACESSO,chr(39))+','+
       AnsiQuotedStr(NIVEIS_ABAIXO,chr(39))+','+
       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+','+
       AnsiQuotedStr(PRV_DESCRICAO,chr(39))+
      ')';
     // sql.savetofile('c:\sql.txt');
      execsql;
      If rowsaffected > 0 then
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_PRIVILEGIOS'+
   ' SET '+
   'DATATU = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATATU),chr(39))+','+
   'ID_USECASE = '+InttoStr(ID_USECASE)+','+
   'IDG_ID = '+InttoStr(IDG_ID)+','+
   'ID_USUARIO = '+InttoStr(ID_USUARIO)+','+
   'USUARIO = '+AnsiQuotedStr(USUARIO,chr(39))+','+
   'ACESSO = '+AnsiQuotedStr(ACESSO,chr(39))+','+
   'NIVEIS_ABAIXO = '+AnsiQuotedStr(NIVEIS_ABAIXO,chr(39))+','+
   'PRV_DESCRICAO = '+AnsiQuotedStr(PRV_DESCRICAO,chr(39))+ ','+
   'CLI_ID = '+InttoStr(CLI_ID)+','+
   'PRJ_ID = '+InttoStr(PRJ_ID)+
    ' WHERE ID_PRIV = '+InttoStr(ID_PRIV);
    execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tprivilegio.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_PRIVILEGIOS'+
     ' WHERE ID_PRIV = '+PDObject.Id ;


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tprivilegio.LoadObject (PDObject: TOObject);
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_PRIVILEGIOS'+
' WHERE ID_PRIV = '+ PDObject.Id ;


       open;
       If not Eof then
         begin
           ddmap(iEmp);
         end;
     end;
end;

function Tprivilegio.CheckPriv (pUsecase,pDiag,pUsu,pCli,pProj : integer;pLing : string) : integer;
var
iEmp : TQuerAdo;
begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       If (pDiag = 0) and (pUseCase = 0) then
        result := -1
       else
       begin
         If pDiag = 0 then  // form normal
           sql.Text := 'SELECT * FROM IDF_PRIVILEGIOS WHERE ID_USECASE = '+''+inttostr(pUseCase)+''+
                      ' AND ID_USUARIO = '+ ''+inttostr(pUsu)+'' +
                      ' AND id_usecase in(SELECT id_usecase FROM IDF_USECASE WHERE UC_LING = '+''''+pLing+''''+')'

         else
           sql.Text := 'SELECT * FROM IDF_PRIVILEGIOS WHERE IDG_ID = '+''+inttostr(pDiag)+''+
                      ' AND ID_USUARIO = '+ ''+inttostr(pUsu)+'' ;

         If not (pUseCase in [10,20,34,139,140]) then // áras de interesse,empresa,diversos,Usuarios,Use case
            Begin
              sql.Text := sql.Text + ' AND CLI_ID = '+ ''+inttostr(pCli)+''+' AND prj_id = '+ ''+inttostr(pProj)+''
            end;
         open;
         If not Eof then
              Begin
               ddmap(iEmp);
               result := fieldbyname('ACESSO').asinteger;
              end

           else
             result := -1;
       end;
     end;
end;



function Tprivilegio.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT ID_PRIV AS MAXK FROM IDF_PRIVILEGIOS'+
' WHERE ID_PRIV = (SELECT MAX(ID_PRIV) FROM IDF_PRIVILEGIOS'+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tprivilegio.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PRIVILEGIOS'
;

    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_PRIV').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function Tprivilegio.GetDoUsuario(PDObject: TOObject;pUsu,pCli,pProj : integer;pTipo : integer;pLIng : string) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+ ''+inttostr(pUsu)+''+
                ' AND CLI_ID = '+ ''+inttostr(pCli)+'' +
                ' AND PRJ_ID = '+ ''+inttostr(pProj)+'' ;

    If pTipo = 1 then
       sql.text := sql.text + ' AND ID_USECASE <> 0'  +
                              ' AND id_usecase in(SELECT id_usecase FROM IDF_USECASE WHERE UC_LING = '+''''+PLiNG+''''+')';

     If pTipo = 2 then
        sql.text := sql.text + ' AND IDG_ID <> 0 ' ;
   // sql.savetofile('c:\qry.txt');
    open;
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('ID_PRIV').Value;
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function Tprivilegio.GetDoUsuarioDiag(PDObject: TOObject;pUsu,pCli,pProj,pDiag : integer) : integer;
 begin
  result := 0 ;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+ ''+inttostr(pUsu)+''+
                ' AND CLI_ID = '+ ''+inttostr(pCli)+'' +
                ' AND PRJ_ID = '+ ''+inttostr(pProj)+'' +
                ' AND IDG_ID = '+ ''+inttostr(pDiag)+'' ;

    open;
    result := fieldbyname('ID_PRIV').asinteger;
 end;
end;

function Tprivilegio.DelDoUsuarioDiag(PDObject: TOObject;pUsu,pCli,pProj,pDiag : integer) : BOOLEAN;
 begin
  result := false ;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'DELETE FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+ ''+inttostr(pUsu)+''+
                ' AND CLI_ID = '+ ''+inttostr(pCli)+'' +
                ' AND PRJ_ID = '+ ''+inttostr(pProj)+'' +
                ' AND IDG_ID = '+ ''+inttostr(pDiag)+'' ;

    EXECSQL;
    If RowsAffected > 0 then
       result :=TRUE;
 end;
end;

function Tprivilegio.DelDoUsuario(PDObject: TOObject;pPriv,pTipo : integer;pLing : string) : boolean;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
   // If pTipo = 0 then  //forms
       sql.text := 'DELETE * FROM IDF_PRIVILEGIOS WHERE ID_PRIV = '+ ''+inttostr(pPriv)+''+
          ' AND id_usecase in(SELECT id_usecase FROM IDF_USECASE WHERE UC_LING = '+''''+PLiNG+''''+')';
 //   else
 //      sql.text := 'DELETE * FROM IDF_PRIVILEGIOS WHERE IDG_ID = '+ ''+inttostr(pPriv)+'' ;
    EXECSQL;
    If rOWSaFFECTED > 0 THEN
      result :=TRUE
    ELSE
      result := false;
 end;
end;

function Tprivilegio.DelAllDoUsuario(pCli,pProj,pUsu : integer;pLing : string) : boolean;

 begin

  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'DELETE * FROM IDF_PRIVILEGIOS  WHERE ID_USUARIO = '+ ''+inttostr(pUsu)+''+
                ' AND id_usecase in(SELECT id_usecase FROM IDF_USECASE WHERE UC_LING = '+''''+PLiNG+''''+')'+
                ' AND CLI_ID = '+ ''+inttostr(pCli)+'' +
                ' AND PRJ_ID = '+ ''+inttostr(pProj)+'' ;
    EXECSQL;
    If rOWSaFFECTED > 0 THEN
      result :=TRUE
    ELSE
      result := false;
 end;
end;

{Fim Métodos Tprivilegio}

  {Início Métodos Tdiagramas}
procedure Tdiagramas.ddMap(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      DIAG_ID                   := DataSet.fieldbyname('DIAG_ID').asstring;
      DIAG_PAI_ID               := DataSet.fieldbyname('DIAG_PAI_ID').asinteger;
      IDG_DIR                   := DataSet.fieldbyname('IDG_DIR').asstring;
      SUB_NOME                  := DataSet.fieldbyname('SUB_NOME').asstring;
      GRID_SHOW                 := DataSet.fieldbyname('GRID_SHOW').asinteger;
      GRID_SNAP                 := DataSet.fieldbyname('GRID_SNAP').asstring;
      IDG_DIAGRAM_STATUS        := DataSet.fieldbyname('IDG_DIAGRAM_STATUS').asinteger;
      ATIVIDADE_MAE             := DataSet.fieldbyname('ATIVIDADE_MAE').asinteger;
      IDG_IDGCLASS              := DataSet.fieldbyname('IDG_IDGCLASS').asstring;
      IDG_NIVEL                 := DataSet.fieldbyname('IDG_NIVEL').asinteger;
      IDG_UPDATEDATE            := DataSet.fieldbyname('IDG_UPDATEDATE').asfloat;
      SUB_ID                    := DataSet.fieldbyname('SUB_ID').asinteger;
      GRID_COR                  := DataSet.fieldbyname('GRID_COR').asfloat;
      GRID_ALT                  := DataSet.fieldbyname('GRID_ALT').asinteger;
      IDG_DIAG                  := DataSet.fieldbyname('IDG_DIAG').asinteger;
      GRID_LARG                 := DataSet.fieldbyname('GRID_LARG').asinteger;
  end;


{Tdiagramas Métodos}

constructor Tdiagramas.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tdiagramas.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tdiagramas;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM SUB_SUBORDINACAO'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDG_ID = '+InttoStr(IDG_ID);


    open;
    If eof then 
     begin
      begin
         oObj := Tdiagramas.create(nil);
         oObj.CLI_ID:= CLI_ID;
         oObj.PRJ_ID:= PRJ_ID;
         oObj.IDG_ID:= IDG_ID;
         wkey := oObj.get_maxkey(CLI_ID,PRJ_ID) + 1;
         Freeandnil(oObj);
         IDG_ID := WKEY;
      end;
       sql.text := 'INSERT INTO SUB_SUBORDINACAO('+
       'CLI_ID,'+
       'PRJ_ID,'+
       'IDG_ID,'+
       'DIAG_ID,'+
       'DIAG_PAI_ID,'+
       'IDG_DIR,'+
       'SUB_NOME,'+
       'GRID_SHOW,'+
       'GRID_SNAP,'+
       'IDG_DIAGRAM_STATUS,'+
       'ATIVIDADE_MAE,'+
       'IDG_IDGCLASS,'+
       'IDG_NIVEL,'+
       'IDG_UPDATEDATE,'+
       'SUB_ID,'+
       'GRID_COR,'+
       'GRID_ALT,'+
       'IDG_DIAG,'+
        'GRID_LARG)'+
       'VALUES ('+

       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+','+
       InttoStr(IDG_ID)+','+
       AnsiQuotedStr(DIAG_ID,chr(39))+','+
       InttoStr(DIAG_PAI_ID)+','+
       AnsiQuotedStr(IDG_DIR,chr(39))+','+
       AnsiQuotedStr(SUB_NOME,chr(39))+','+
       InttoStr(GRID_SHOW)+','+
       AnsiQuotedStr(GRID_SNAP,chr(39))+','+
       InttoStr(IDG_DIAGRAM_STATUS)+','+
       InttoStr(ATIVIDADE_MAE)+','+
       AnsiQuotedStr(IDG_IDGCLASS,chr(39))+','+
       InttoStr(IDG_NIVEL)+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDG_UPDATEDATE),chr(39))+','+
       InttoStr(SUB_ID)+','+
       FloattoStr(GRID_COR)+','+
       InttoStr(GRID_ALT)+','+
       InttoStr(IDG_DIAG)+','+
       InttoStr(GRID_LARG)+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE SUB_SUBORDINACAO'+
   ' SET '+
   'DIAG_ID = '+AnsiQuotedStr(DIAG_ID,chr(39))+','+
   'DIAG_PAI_ID = '+InttoStr(DIAG_PAI_ID)+','+
   'IDG_DIR = '+AnsiQuotedStr(IDG_DIR,chr(39))+','+
   'SUB_NOME = '+AnsiQuotedStr(SUB_NOME,chr(39))+','+
   'GRID_SHOW = '+InttoStr(GRID_SHOW)+','+
   'GRID_SNAP = '+AnsiQuotedStr(GRID_SNAP,chr(39))+','+
   'IDG_DIAGRAM_STATUS = '+InttoStr(IDG_DIAGRAM_STATUS)+','+
   'ATIVIDADE_MAE = '+InttoStr(ATIVIDADE_MAE)+','+
   'IDG_IDGCLASS = '+AnsiQuotedStr(IDG_IDGCLASS,chr(39))+','+
   'IDG_NIVEL = '+InttoStr(IDG_NIVEL)+','+
   'IDG_UPDATEDATE = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDG_UPDATEDATE),chr(39))+','+
   'SUB_ID = '+InttoStr(SUB_ID)+','+
   'GRID_COR = '+FloattoStr(GRID_COR)+','+
   'GRID_ALT = '+InttoStr(GRID_ALT)+','+
   'IDG_DIAG = '+InttoStr(IDG_DIAG)+','+
   'GRID_LARG = '+InttoStr(GRID_LARG)+
    ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDG_ID = '+InttoStr(IDG_ID);


   execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tdiagramas.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM SUB_SUBORDINACAO'+
     ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDG_ID = '+InttoStr(IDG_ID);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tdiagramas.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do  
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM SUB_SUBORDINACAO'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDG_ID = '+InttoStr(IDG_ID);


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;


function Tdiagramas.Get_MaxKey (pCLI_ID : integer ;pPRJ_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT  AS MAXK FROM SUB_SUBORDINACAO'+
' WHERE  = (SELECT MAX() FROM SUB_SUBORDINACAO'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+')';

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tdiagramas.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM SUB_SUBORDINACAO'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND DIAG_PAI_ID = 0';


    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('IDG_ID').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;

function TDiagramas.GetAllObjectsNOT(PDObject: TOObject;pUsu,pCli,pProj : integer) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 BR : STRING;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM SUB_SUBORDINACAO WHERE IDG_ID NOT IN '+
                '(SELECT IDG_ID FROM IDF_PRIVILEGIOS WHERE ID_USUARIO = '+''+INTTOSTR(PuSU)+'' +
                ' AND CLI_ID = '+''+INTTOSTR(pCli)+'' +
                ' AND PRJ_ID = '+''+INTTOSTR(pProj)+'' +')' +
                ' AND CLI_ID = '+''+INTTOSTR(pCli)+''  +
                ' AND PRJ_ID = '+''+INTTOSTR(pProj)+'' +
                ' AND DIAG_PAI_ID IN (1,0)'+
                ' ORDER BY DIAG_PAI_ID';
    open;
    //sql.SaveToFile('c:\sql.txt');
    While not Eof do
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('CLI_ID').Value;
         NewOObject.PK2 := fieldbyname('PRJ_ID').Value;
         NewOObject.PK3 := fieldbyname('IDG_ID').Value;
         If fieldbyname('DIAG_PAI_ID').asinteger = 0 then
           br := '  '
         else
         If fieldbyname('DIAG_PAI_ID').asinteger = 1 then
           br := '    ';
         pList.AddObject(br+fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;


{Fim Métodos Tdiagramas}


{FIM METODOS}

{INICIO SET VALUES}


procedure TQuerAdo.SetDS(const Value: TDataSource);
begin
  FDS := Value;
end;

procedure TQuer.SetDS(const Value: TDataSource);
begin
  FDS := Value;
end;

procedure TDad.SetdDS(const Value: TDataSource);
begin
  FdDS := Value;
end;
  {Início Set Values Tpessoa}
{Set Value Tpessoa}

procedure Tpessoa.SetID_PESSOA(const value   : integer );
 begin
  FID_PESSOA := value;
 end;

procedure Tpessoa.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Tpessoa.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Tpessoa.SetPES_NOME(const value   : string );
 begin
  FPES_NOME := value;
 end;

procedure Tpessoa.SetPES_SENHA(const value   : string );
 begin
  FPES_SENHA := value;
 end;

procedure Tpessoa.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

{Fim Set Values Tpessoa}

  {Início Set Values Tusuario}
{Set Value Tusuario}

procedure Tusuario.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Tusuario.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Tusuario.SetUS_NOME(const value   : string );
 begin
  FUS_NOME := value;
 end;

procedure Tusuario.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Tusuario.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tusuario.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

{Fim Set Values Tusuario}

  {Início Set Values Tcompany}
{Set Value Tcompany}

procedure Tcompany.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tcompany.SetCLI_AREA_INTERESSE(const value   : string );
 begin
  FCLI_AREA_INTERESSE := value;
 end;

procedure Tcompany.SetCLI_DIR(const value   : string );
 begin
  FCLI_DIR := value;
 end;

procedure Tcompany.SetCLI_NOME(const value   : string );
 begin
  FCLI_NOME := value;
 end;

procedure Tcompany.SetCLI_RAZ_O_SOCIAL(const value   : string );
 begin
  FCLI_RAZ_O_SOCIAL := value;
 end;

procedure Tcompany.SetDIR_ALIAS(const value   : string );
 begin
  FDIR_ALIAS := value;
 end;

{Fim Set Values Tcompany}

  {Início Set Values Tscenario}
{Set Value Tscenario}

procedure Tscenario.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tscenario.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tscenario.SetPRJ_TITULO(const value   : string );
 begin
  FPRJ_TITULO := value;
 end;

procedure Tscenario.SetPRJ_AREA_INTERESSE(const value   : string );
 begin
  FPRJ_AREA_INTERESSE := value;
 end;

procedure Tscenario.SetPRJ_CAMINHO(const value   : string );
 begin
  FPRJ_CAMINHO := value;
 end;

procedure Tscenario.SetPRJ_CARATER_RELEVANTE(const value   : string );
 begin
  FPRJ_CARATER_RELEVANTE := value;
 end;

procedure Tscenario.SetPRJ_CARGA_HORA_DEMANDADA(const value   : real );
 begin
  FPRJ_CARGA_HORA_DEMANDADA := value;
 end;

procedure Tscenario.SetPRJ_CLIENTE(const value   : string );
 begin
  FPRJ_CLIENTE := value;
 end;

procedure Tscenario.SetPRJ_COMPLEXIDADE(const value   : string );
 begin
  FPRJ_COMPLEXIDADE := value;
 end;

procedure Tscenario.SetPRJ_DATA_FIM_PLANEJADA(const value   : real );
 begin
  FPRJ_DATA_FIM_PLANEJADA := value;
 end;

procedure Tscenario.SetPRJ_DATA_INICIO(const value   : real );
 begin
  FPRJ_DATA_INICIO := value;
 end;

procedure Tscenario.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tscenario.SetPRJ_DEFINICAO_CONTEXTO(const value   : string );
 begin
  FPRJ_DEFINICAO_CONTEXTO := value;
 end;

procedure Tscenario.SetPRJ_EQUIPE_PROJETO(const value   : integer );
 begin
  FPRJ_EQUIPE_PROJETO := value;
 end;

procedure Tscenario.SetPRJ_EXPECTATIVA_GANHO(const value   : string );
 begin
  FPRJ_EXPECTATIVA_GANHO := value;
 end;

procedure Tscenario.SetPRJ_FATORES_RESTRITIVOS(const value   : string );
 begin
  FPRJ_FATORES_RESTRITIVOS := value;
 end;

procedure Tscenario.SetPRJ_OBJETIVO(const value   : string );
 begin
  FPRJ_OBJETIVO := value;
 end;

procedure Tscenario.SetPRJ_PATH(const value   : string );
 begin
  FPRJ_PATH := value;
 end;

procedure Tscenario.SetPRJ_PATROCINADOR(const value   : string );
 begin
  FPRJ_PATROCINADOR := value;
 end;

procedure Tscenario.SetPRJ_PREMISSAS(const value   : string );
 begin
  FPRJ_PREMISSAS := value;
 end;

procedure Tscenario.SetPRJ_QTDE_NECES_PROCES(const value   : real );
 begin
  FPRJ_QTDE_NECES_PROCES := value;
 end;

procedure Tscenario.SetPRJ_RESTRICOES(const value   : real );
 begin
  FPRJ_RESTRICOES := value;
 end;

procedure Tscenario.SetPRJ_ALVOS_MELHORIA(const value   : string );
 begin
  FPRJ_ALVOS_MELHORIA := value;
 end;

procedure Tscenario.SetPRJ_STATUS(const value   : string );
 begin
  FPRJ_STATUS := value;
 end;

{Fim Set Values Tscenario}

  {Início Set Values Tusecase}
{Set Value Tusecase}

procedure Tusecase.SetID_USECASE(const value   : integer );
 begin
  FID_USECASE := value;
 end;

procedure Tusecase.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Tusecase.SetUC_NOME(const value   : string );
 begin
  FUC_NOME := value;
 end;

procedure Tusecase.SetUS_DESCRICAO(const value   : string );
 begin
  FUS_DESCRICAO := value;
 end;

procedure Tusecase.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Tusecase.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tusecase.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

{Fim Set Values Tusecase}

  {Início Set Values Tprivilegio}
{Set Value Tprivilegio}

procedure Tprivilegio.SetID_PRIV(const value   : integer );
 begin
  FID_PRIV := value;
 end;

procedure Tprivilegio.SetDATATU(const value   : real );
 begin
  FDATATU := value;
 end;

procedure Tprivilegio.SetID_USECASE(const value   : integer );
 begin
  FID_USECASE := value;
 end;

procedure Tprivilegio.SetID_USUARIO(const value   : integer );
 begin
  FID_USUARIO := value;
 end;

procedure Tprivilegio.SetUSUARIO(const value   : string );
 begin
  FUSUARIO := value;
 end;

procedure Tprivilegio.SetACESSO(const value   : string );
 begin
  FACESSO := value;
 end;

procedure Tprivilegio.SetNIVEIS_ABAIXO(const value   : string );
 begin
  FNIVEIS_ABAIXO := value;
 end;

procedure Tprivilegio.SetPRV_DESCRICAO(const value   : string );
 begin
  FPRV_DESCRICAO := value;
 end;

{Fim Set Values Tprivilegio}

  {Início Set Values Tdiagramas}
{Set Value Tdiagramas}

procedure Tdiagramas.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tdiagramas.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tdiagramas.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tdiagramas.SetDIAG_ID(const value   : string );
 begin
  FDIAG_ID := value;
 end;

procedure Tdiagramas.SetDIAG_PAI_ID(const value   : integer );
 begin
  FDIAG_PAI_ID := value;
 end;

procedure Tdiagramas.SetIDG_DIR(const value   : string );
 begin
  FIDG_DIR := value;
 end;

procedure Tdiagramas.SetSUB_NOME(const value   : string );
 begin
  FSUB_NOME := value;
 end;

procedure Tdiagramas.SetGRID_SHOW(const value   : integer );
 begin
  FGRID_SHOW := value;
 end;

procedure Tdiagramas.SetGRID_SNAP(const value   : string );
 begin
  FGRID_SNAP := value;
 end;

procedure Tdiagramas.SetIDG_DIAGRAM_STATUS(const value   : integer );
 begin
  FIDG_DIAGRAM_STATUS := value;
 end;

procedure Tdiagramas.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tdiagramas.SetIDG_IDGCLASS(const value   : string );
 begin
  FIDG_IDGCLASS := value;
 end;

procedure Tdiagramas.SetIDG_NIVEL(const value   : integer );
 begin
  FIDG_NIVEL := value;
 end;

procedure Tdiagramas.SetIDG_UPDATEDATE(const value   : real );
 begin
  FIDG_UPDATEDATE := value;
 end;

procedure Tdiagramas.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tdiagramas.SetGRID_COR(const value   : real );
 begin
  FGRID_COR := value;
 end;

procedure Tdiagramas.SetGRID_ALT(const value   : integer );
 begin
  FGRID_ALT := value;
 end;

procedure Tdiagramas.SetIDG_DIAG(const value   : integer );
 begin
  FIDG_DIAG := value;
 end;

procedure Tdiagramas.SetGRID_LARG(const value   : integer );
 begin
  FGRID_LARG := value;
 end;

{Fim Set Values Tdiagramas}


{FIM SET VALUES}

procedure Tprivilegio.SetCLI_ID(const Value: INTEGER);
begin
  FCLI_ID := Value;
end;

procedure Tprivilegio.SetPRJ_ID(const Value: INTEGER);
begin
  FPRJ_ID := Value;
end;

procedure Tprivilegio.SetIDG_ID(const Value: integer);
begin
  FIDG_ID := Value;
end;

procedure Tusecase.SetUC_LING(const Value: string);
begin
  FUC_LING := Value;
end;

end.
