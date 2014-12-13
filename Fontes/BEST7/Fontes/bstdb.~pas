unit BSTDB;
{
Criar TAP : inibidos atributos IDF_DIRETORIO E TELA_DIRETORIO}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, ibQuery,DB,IBDatabase,
  IBCustomDataSet, Provider, DBClient, cls_bd, ADODb, dbTables, math, strUtils, 
  fonctions, AddFlow3Lib_TLB  ,dbgrids;

 type
  uEmp = ^Temp;
  TEmp = record
     Fcli: integer;
  end;

  type
  uCen = ^TCen;
  TCen = record
     Fcli: integer;
     fCenario : integer;
  end;

  type
  uDiag = ^TDiag;
  TDiag = record
     Fcli       : integer;
     fCenario   : integer;
     fDiag      : integer;
  end;

  type
  uLst = ^TLst;
  TLst = record
     eNode    : afNode;
     elnk     : afLink;
     eTipo    : char;  //i : link entrando - o : link saindo
  end;

  type
  uListaMult = ^TListaMult;
  TListaMult = record
     cod : integer;
     des : string;
     WBS : STRING;
  end;

  type
  uLstdado = ^TLstdado;
  TLstdado = record
     elnk     : afLink;
  end;


  type
  uObj = ^TObj;
  TObj = record
     Fcodigo     : string;
     fDesc       : string;
     fWbs        : string;
     fcat        : string;
     fnome       : string; //nome aplicativo
  end;


 type
//  uCusto = ^TCusto;
  TCusto = record
     Custo_mo    : real;
     Custo_Tec   : real;
     Custo_Outros: real;
     Custo_Mp    : real;
     obs         : TRichedit;
  end;


TDados = Class(TADOQuery)
  Private
     fdatasource : TdataSource;
     fProvider   : TProvider;
     fChave     : string;
     fCpoLista1 : string;
     fCpoLista2 : string;
     fCpoLista3 : string;
     fCpoLista4 : string;
     fCpoLista5 : string;
     FSQL: Tstrings;


     procedure SetdataSource ( value : TdataSource);
     procedure AftPost(DataSet: TDataSet);
     procedure AftDel(DataSet: TDataSet);


   ///  procedure OnErrorRec(DataSet: TCustomClientDataSet;
          //                E: EReconcileError; UpdateKind: TUpdateKind;
            //               var Action: TReconcileAction);


  published
   DB: TBD  ;
   property DataExt: TdataSource read fdataSource write SetDataSource;

   public
    fClient     : TClientDataset;
    Status     : char;
    mEmp : uemp;
    mObj : uObj;
    constructor Create (Aowner : TComponent);
    function Cria_index(pClient : TClientDataSet; pField : string;  pGroup : integer) : string;
    function Criar (sender : Tobject) : boolean;
    procedure Cria_lista (pLista: TTreeView;pMostraKey,pLimpa : boolean );


end;

Tbanco = Class(Tdados)
  private
    Fdados: string;
    Falias: string;
    Fbanco: string;
    procedure Setalias(const Value: string);
    procedure Setbanco(const Value: string);
    procedure Setdados(const Value: string);

  Private

  published
     property alias : string read Falias write Setalias;
     property dados : string  read Fdados write Setdados;
     property servidor : string read Fdados write Setdados;
     property banco : string read Fbanco write Setbanco;
     function OpenAll : boolean;
     function Incluir : boolean;
     function Get_bd : boolean;
  public


end;

TDados_tab = Class(Tdados)
  Private
    FTabelas: string;
    FCodigo_lista: integer;
    FListaEdit: boolean;
    FListaId: integer;
    FListaDim: string;
    FListaTag: integer;
    FListaTree: TTreeView;
    FListaTit: string;
    FListaProj: integer;
    FListaCli: integer;
    FListaFecha: Boolean;
    FListadesc: string;
    FListaCanc: boolean;
    FOperacao: integer;
    FListaWbs: string;
    FListaPesq: string;

    procedure SetTabelas(const Value: string);
    procedure SetCodigo_lista(const Value: integer);
    procedure SetListaDim(const Value: string);
    procedure SetListaEdit(const Value: boolean);
    procedure SetListaId(const Value: integer);
    procedure SetListaTag(const Value: integer);
    procedure SetListaTree(const Value: TTreeView);
    procedure SetListaTit(const Value: string);
    procedure SetListaCli(const Value: integer);
    procedure SetListaProj(const Value: integer);
    procedure SetListaFecha(const Value: Boolean);
    procedure SetListadesc(const Value: string);
    function zTab(pTipo: string): string;
    procedure SetListaCanc(const Value: boolean);
    procedure SetOperacao(const Value: integer);
    function Atu_PercCorrelacoes(pCli, pProj,pCodigoPai: integer; pPerc : real): boolean;
    procedure SetListaWbs(const Value: string);
    procedure SetListaPesq(const Value: string);
  published
     property Tabela : string read FTabelas write SetTabelas;
     property ListaPesq : string read FListaPesq write SetListaPesq;
     property ListaCli  : integer read FListaCli write SetListaCli;
     property ListaProj : integer read FListaProj write SetListaProj;
     property ListaCodigo : integer read FCodigo_lista write SetCodigo_lista;
     property ListaEdit : boolean read FListaEdit write SetListaEdit;
     property ListaDim  : string read FListaDim write SetListaDim;
     property ListaTag  : integer read FListaTag write SetListaTag;
     property ListaId   : integer read FListaId write SetListaId;
     property ListaTree : TTreeView read FListaTree write SetListaTree;
     property ListaTit  : string read FListaTit write SetListaTit;
     property ListaFecha: Boolean read FListaFecha write SetListaFecha;
     property Listadesc : string read FListadesc write SetListadesc;
     property ListaWbs : string read FListaWbs write SetListaWbs;
     property ListaCanc: boolean read FListaCanc write SetListaCanc;
     property Operacao : integer read FOperacao write SetOperacao; //somente para AC
     function get_maxKey(ptab : string) : integer;
     function Get_Inst(pCli,pProj,pId : integer;pTab : string) : boolean;
     function OpenAll(pCli,pProj : integer;pTab,pTipo,pTipoAtiv : string;pOp : integer) : boolean;
     procedure VerificaEmpresas();

      { abre todos classificados por descricao}
     function OpenAllbydesc(pCli,pProj : integer;pTab,pTipo,pTipoAtiv : string) : boolean;
        { abre um classificados por descricao}
     function Objetobydesc(pCli, pProj, pCodigo: integer; pTab, pTipo,
      pTipoAtiv: string): boolean;

      { abre todos classificados por sub_nivel (sequencia para elementos de dados}
     function OpenAllbySeq(pCli,pProj : integer;pTab,pTipo,pTipoAtiv : string) : boolean;
     //abre objeto específico
     function Open_Objeto(pCli,pProj,pId : integer;pTab : string) : boolean;
     function BuscaUltimoRegistro(pTab : string) : integer;

      // abre todos os objetos
     function Open_Objetos(pCli, pProj : integer; pTab: string): boolean;

     function Abre_aderencia(pCli,pProj,pId,pTi : integer) : boolean;
     function Get_layOut(pCli,pProj,poi : integer) : boolean;
      { cria instancia de qqr tabela}
     function Cria_Inst(pCli,pProj,pIdg : integer;pTab,pTipoAtiv,pVisible,pdesc,pDescricao : string) : boolean;
      { cria instancia de qqr tabela}
     function Cria_InstDE(pCli, pProj, pIdg: integer; pTab,
                pTipoAtiv, pVisible, pDesc, pdataType,pLength: string): boolean;
     function Apagar(ptab : string) : boolean;
     function Apaga_Objeto(pCli,pProj,pId : integer;pTab : string) : boolean;

     function Get_Correlato( pCli : integer;            // pega uma correlaçào específica
                             pProj : integer;
                             pTipoPai : string;
                             pCodigoPai : integer;
                             pTipoFilho : string;
                             pCodigoFilho : integer) : boolean;

     function Get_Correlatos( pCli : integer;            // pega todos os correlatos
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   ptab : string) : boolean;
      { devolve os dados da tabela correlat + os dados da correlaçào}
     function Get_CorrelatosBis( pCli : integer;    // pega todos os correlatos  com dados do cor_objetos,
                                                       //conhecendo o pai(codigo e tipo) e
                                   pProj : integer;    // o tipo do filho
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pClass,pSentido : string ) : boolean;  //editável!!!!!
     { pega todos os correlatos  com dados do cor_objetos,
     //conhecendo o pai(codigo e tipo) e  o tipo do filho (retorna linha do Cor_objeto)}

     function Get_Correlacoes(pCli, pProj: integer; pTipoPai: string;
      pCodigoPai: integer; pTipoFilho: string): boolean;

      { retorna todas as correlações do cliente/projeto}
     function Get_TodasCorrelacoes(pCli, pProj: integer): boolean;

     function Get_CorrelatosByDesc(pCli, pProj: integer; pTipoPai: string;
               pCodigoPai: integer; pTipoFilho, ptab: string): boolean;

     function Get_PaisCorrelatos( pCli : integer;    // pega todos os pais  ,
                                                       //conhecendo o tipo do pai e
                                   pProj : integer;    // o tipo e codigo do filho
                                   pTipoPai : string;   //Não editável!!!!!
                                   pCodigoFilho : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pOrder : string) : boolean;   //sequencia de campos para classificaçào
    // pega todos os pais  ,
    //conhecendo o tipo do pai e
    // o tipo e codigo do filho (retorna so os codigod)

     function Get_PaisCorrelatosCod(pCli, pProj: integer; pTipoPai: string;
      pCodigoFilho: integer; pTipoFilho,pAtor: string): TList;

    {pega todos os pais  ,conhecendo o tipo do pai e o tipo e codigo do filho}

     function Get_PaisCorrelatosBis( pCli : integer;    // pega todos os pais  ,
                                                       //conhecendo o tipo do pai e
                                   pProj : integer;    // o tipo e codigo do filho + dados da correlação
                                   pTipoPai : string;   //Não editável!!!!!
                                   pCodigoFilho : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pClass : string;
                                   pSentido: string) : boolean;

     function Get_PaisFilhos(pCli, pProj: integer; pTipoPai: string;
                              pTipoFilho, ptab: string): boolean;
     function Get_PaisFilhosByDesc(pCli, pProj: integer; pTipoPai,
                              pTipoFilho, ptab: string): boolean;
     function Get_PaidosFilhos(pCli, pProj: integer; pTipoPai, pTipoFilho,
      ptab: string): boolean;

       // Cria uma correlação específica
     function Cria_Correlacao( pCli : integer;            // Cria uma correlaçào específica
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   pCodigoFilho : integer;
                                   pCat : string ;
                                   pPerc_Custo : real;
                                   pPerc_id : integer) : boolean;
      // Apaga todas as correlaçoes
     function Apaga_correlacoes(   pCli : integer;
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string) : boolean;
     { apaga todas as correalçoes soltas = pai nào existe}
     function Apaga_CorrPaiSolto(   pCli : integer;
                                   pProj : integer;
                                   pTipoPai : string
                                   ) : boolean;
     { apaga todas as correalçoes soltas = filho nào existe}
     function Apaga_CorrFilhoSolto(   pCli : integer;
                                   pProj : integer;
                                   pTipoFilho : string
                                   ) : boolean;

     function Apaga_Todascorrelacoes( pCli : integer;            // Apaga todas as correlaçoes
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer ) : boolean;

     function Apaga_TodascorrelacoesObj( pCli : integer;            // Apaga todas as correlaçoes soltas de determinado objeto
                                   pProj : integer;
                                   pTipoPai : string
                                   ) : boolean;

     function Apaga_correlacao( pCli : integer;            //Apaga uma correlação específica
                                pProj : integer;
                                pTipoPai : string;
                                pCodigoPai : integer;
                                pTipoFilho : string;
                                pCodigoFilho : integer) : boolean;
     function Apaga_ProjCorrelacoes( pCli : integer;      // Apaga todas as correlações do projeto
                                   pProj : integer) : boolean;
     function Mostra_lista  : string;
      { Mostra Lista com escolha múltila}
     function Mostra_listaMult: TList;

     function AplicDadosDe(pCli, pProj: integer): boolean;
     function AplicDadosIf(pCli, pProj: integer): boolean;
     function AplicDadosDg(pCli, pProj: integer): boolean;
     function AplicDadosRb(pCli, pProj: integer): boolean;
      { retorna o lead time da atividade}
     function Get_Lead : real;
      { retorna os objetos de interface da ativiadade UC}
     function Get_OI(pCli, pProj: integer): boolean;
     function Get_Aspectos(pCli, pProj, pOperacao, pAsp: integer): boolean;
     {coloca '' no atributo idf_del das tabelas}
     function Resetar : boolean;
     {coloca S  no atributo idf_del das tabelas}
     function MarcaDel(pTipo : string) : boolean;
     {coloca S  no atributo idf_del das tabelas}
     function MarcaDelDe : boolean;
     {Mostra os objetos orfãos (existentes logicamente e inexistentes fisicamente}
     function Mostra_orfas (pTipo : string): boolean;
       { marca deleção de objetos invisiveis}
     function MarcaDelInvisivel (pTipo : string): boolean;
     { Limpa todos os objetos c/descrição em branco}
     function LimpaNull(pTipo : string): boolean;
     { limpa todas as entidades com S no IDF_DEL}
     function Limpa_todas (pTipo : string) : boolean;

     { abre todos os diagramas}
    function get_diag(pcli,pproj : integer) : boolean;

     { Inclui DE (data element)}
    function Inclui_de(cli,prj,cod : integer;ativ,design ,descr,tipo,qual,dom,def : string) : boolean;

       { total de atividades cadastradas (para Dem)}
    function TotalObj (pTab : string): integer;
       { total de ATORES cadastradas (para Dem)}
    function TotalObjCA: integer;
    { total de TABELAS cadastradas (para Dem)}
    function TotalObjIF: integer;
    { total de TABELAS cadastradas (para Dem)}
    function TotalObjOE: integer;
    { total de REGRAS cadastradas (para Dem)}
    function TotalObjRN: integer;
    { total de USE CASE cadastradas (para Dem)}
    function TotalObjUC: integer;

        {atualiza percentual de pasagem de uma correlaçãoi}
     function Atu_PercCorrelato(pCli, pProj,pId: integer; pPerc : real): boolean;
             { pega o mairo código de percentaula de passagem}
     function Get_maxCorrelato( pCli : integer;            // pega o maiot código de uma correlaçào específica
                                   pProj : integer ) :integer;
     function Get_Aplicativos( pCli : integer; pProj : integer; pId : integer ) :integer;

     function Get_MecanismosComAplic(pCli, pProj: integer): boolean;

     //PID : LOCAL DE PROC
    // retorna a qtde de atividades com local de proc = pId
    function Get_qtdeAtivLoc(pCli, pProj, pId: integer): integer;
    //atualiza custos da atividade
    function Atualiza_CustoAp(pCli,pProj,pId : integer; pCustomo,pCustotec,pCustoger,pCustoMP : real) : integer;
    // retorna as atividades do diagrama
   function get_AtivCustos(pCli, pProj, pDiag: integer): boolean;
      // retorna atividades da lista pList
   function Get_ListaAp(pCli,pProj : integer; pList: TList): boolean;

   function Atualiza_procedural(pcli,pcenario, pId : integer): boolean;
     { retora uma lista de objetos}
   function Get_ListaObjeto(pCli,pProj,pShape : integer; pTab : string;
                                     pList : TList;pAtiv,pFlag,pAtor : integer) : boolean;

    {retorna a lsita dos atributos da tabela IDF_DADoS , não repetidos}
   function OpenAllDistinct(pCli, pProj: integer): boolean;
     { exporta tabela  para outro cenário}
   function Exporta_Dim(pCli_de, pProj_de, pCli_ate, pProj_ate: integer;
      pTabela: string): boolean;

   function Get_Mecanismos(pCli, pProj, pAplic: integer): boolean;
       {RETORNA TODOS OS USE CASE COM seus requerimentos de TI}
   function get_AllAtivComReq(pCli, pProj: integer): boolean;

   function Open_ObjetosByDesc(pCli, pProj: integer; pTab: string): boolean;
   // retorna as tabelas onde o atributo pDesc é usado
   function GetTab(pCli, pProj: integer; pDESC: string): boolean;

   ///////usado para importação
            { atualiza IDF_CODIGO_NOVO na tabela origem(temp) =  novo ID criado na tabela destino}
   function Atualiza_IdNovo(pCli, pProj, pId, pIdnovo: integer;ptabela : string): boolean;
            { Verifica na tabela origem(temp) se objeto já foi criado na Tabela destino :  IDF_CODIGO_NOVO > 0}
   function Existe_IdNovo(pCli,pProj,pId : integer; ptabela: string) : integer;
   //////////////USADOS P/CORRECAO
     {atualiza key da tabela : somente p/correção de erros}
   function Atualiza_Key(pCli, pProj, pId, pNovoId: integer; pTab: string): integer;
     { atualiza filho_id da tabela cor_objetos : somenete para correcaio de problemas}
   function Atualiza_KeyCorr(pCli,pProj,pFilhoid,pNovoId : integer;pTipoPai,pTipoFilho : string) : integer;
   function get_CA(pCli, pProj, pId: integer): boolean;
     {Apagar as correlações do filho}
   function Apaga_correlacoesFilho(pCli, pProj,pcodfilho : integer;
      pTipofilho: string): boolean;
    //////////////USADOS P/CORRECAO

  public
  CLI_ID              : integer;
  PRJ_ID              : integer;
  IDF_CODIGO          : integer;
  IDF_DEL             : string;
  IDF_TIPO_ATIVIDADE  : string;
  IDF_VISIBLE         : string;
end;

TProv = Class(Tdados_tab)
  private
    FDATA_TYPE: integer;
    FTYPE_NAME: string;
    FPROVIDER_NAME: string;
    FCOLUMN_SIZE: integer;
    procedure SetDATA_TYPE(const Value: integer);
    procedure SetTYPE_NAME(const Value: string);
    procedure SetPROVIDER_NAME(const Value: string);
    procedure SetCOLUMN_SIZE(const Value: integer);

  Private

  published
     property PROVIDER_NAME : string read FPROVIDER_NAME write SetPROVIDER_NAME;
     property TYPE_NAME : string read FTYPE_NAME write SetTYPE_NAME;
     property DATA_TYPE : integer read FDATA_TYPE write SetDATA_TYPE;
     property COLUMN_SIZE : integer read FCOLUMN_SIZE write SetCOLUMN_SIZE;
     { retorna PROVIDER ESPECÍFICO}
     function Get_provider : boolean;
     { retorna data type específico}
     function Get_DataType: boolean;
     function Get_Type: boolean;

     {inclui novo provider}
     function Incluir: boolean;
     function Excluir: boolean;
  public

end;

TPs = Class(Tdados_tab)
  private
    FCLI_ID: INTEGER;
    FIDF_CODIGO: integer;
    FPRJ_ID: integer;
    procedure SetCLI_ID(const Value: INTEGER);
    procedure SetIDF_CODIGO(const Value: integer);
    procedure SetPRJ_ID(const Value: integer);

  Private

  published
    property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
    property CLI_ID     : INTEGER  read FCLI_ID write SetCLI_ID;
    property PRJ_ID     : integer  read FPRJ_ID write SetPRJ_ID;
    function OpenPessoa : boolean;
  public

end;

TAtor = Class(Tdados_tab)
  private
    FCLI_ID: INTEGER;
    FIDF_CODIGO: integer;
    FPRJ_ID: integer;
    FIDF_TIPO_ATIVIDADE: string;
    FPESSOA: Tps;
    procedure SetCLI_ID(const Value: INTEGER);
    procedure SetIDF_CODIGO(const Value: integer);
    procedure SetIDF_TIPO_ATIVIDADE(const Value: string);
    procedure SetPRJ_ID(const Value: integer);
    procedure SetPESSOA(const Value: Tps);
  Private

  published
    property IDF_CODIGO : integer read FIDF_CODIGO write SetIDF_CODIGO;
    property CLI_ID     : INTEGER read FCLI_ID write SetCLI_ID;
    property PRJ_ID     : integer read FPRJ_ID write SetPRJ_ID;
    property IDF_TIPO_ATIVIDADE : string read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
    property PESSOA : Tps read FPESSOA write SetPESSOA;
    { pega as atividades do ator}
    function Pega_ativ : boolean;

    constructor Create (Aowner : TComponent);
  public


end;


TAP = Class(Tdados_tab)
  Private
    FIDF_DESCRICAO: string;
    FATOR: TAtor;
    FIDF_ID_FISICO: integer;
    FSUB_NIVEL: integer;
    FARI_ID: integer;
    FIDG_ID: integer;
    FATIVIDADE_MAE: integer;
    FIDF_OI: integer;
    FIDF_ID: integer;
    FSUB_ID: integer;
    FIDF_VOLUME_PROC: real;
    FIDF_V_MINIMO: real;
    FIDF_VOLUME_REG: real;
    FIDF_DURATION_TPU: real;
    FIDF_VERSAO_DATA: real;
    FIDF_VOLUME_LOOPING: real;
    FIDF_TEMPO_INATIVO_TPI: real;
    FIDF_ADERENCIA: real;
    FIDF_V_REGULAR: real;
    FIDF_V_PICO: real;
    FIDF_TIPO_UC: string;
    FIDF_DESIGNACAO: string;
    FIDF_VALOR_AGREGADO: string;
    FIDF_VOLUME: string;
    FIDF_UPDATE_DATE: REAL;
    FIDF_NATUREZA: string;
    FIDF_ATIVIDADE_CONTEXTO: string;
    FIDF_TIPO_IMPLEMENT: string;
    FIDF_OBJETIVO_PROCESSO: string;
    FIDF_UNIDADE_TEMPO: string;
    FIDF_REPONSABILIDADE: string;
    FIDF_RESPONSAVEL: string;
    FIDF_OBJETIVO: string;
    FIDF_ATOR2: string;
    FIDF_VERSAO: string;
    FIDF_CLASSIFICACAO_PP: string;
    FIDF_CAUSA_INATIVIDADE: string;
    FIDF_TIPO: string;
    FIDF_ATOR1: string;
    FIDF_WBS_CODE: string;
    FIDF_ATIVIDADE_SUMARIA: string;
    FIDF_VOLUME_PICO: string;
    FIDF_PRIORIDADE: string;
    FIDF_TIPO_ATIV: string;
    FIDF_DEFINICAO_CONTEXTO: string;
    FIDF_OBJETIVO_UC: string;
    FIDF_NOME: string;
    FIDF_DURATION_TPU2: real;
    FIDF_DURATION_TPU1: real;
    FIDF_DE_REPET: integer;
    FIDF_CUSTO_MP: real;
    FIDF_CUSTO_TEC: real;
    FIDF_CUSTO_GERAL: real;
    FIDF_CUSTO_ANUAL: real;
    FIDF_DIRETORIO: string;
    FIDF_TELADIR: string;
    procedure SetIDF_DESCRICAO(const Value: string);
    procedure SetATOR(const Value: TAtor);
    procedure SetARI_ID(const Value: integer);
    procedure SetATIVIDADE_MAE(const Value: integer);
    procedure SetIDF_ADERENCIA(const Value: real);
    procedure SetIDF_ATIVIDADE_CONTEXTO(const Value: string);
    procedure SetIDF_ATIVIDADE_SUMARIA(const Value: string);
    procedure SetIDF_ATOR1(const Value: string);
    procedure SetIDF_ATOR2(const Value: string);
    procedure SetIDF_CAUSA_INATIVIDADE(const Value: string);
    procedure SetIDF_CLASSIFICACAO_PP(const Value: string);
    procedure SetIDF_DEFINICAO_CONTEXTO(const Value: string);
    procedure SetIDF_DESIGNACAO(const Value: string);
    procedure SetIDF_DURATION_TPU(const Value: real);
    procedure SetIDF_ID(const Value: integer);
    procedure SetIDF_ID_FISICO(const Value: integer);
    procedure SetIDF_NATUREZA(const Value: string);
    procedure SetIDF_NOME(const Value: string);
    procedure SetIDF_OBJETIVO(const Value: string);
    procedure SetIDF_OBJETIVO_PROCESSO(const Value: string);
    procedure SetIDF_OBJETIVO_UC(const Value: string);
    procedure SetIDF_OI(const Value: integer);
    procedure SetIDF_PRIORIDADE(const Value: string);
    procedure SetIDF_REPONSABILIDADE(const Value: string);
    procedure SetIDF_RESPONSAVEL(const Value: string);
    procedure SetIDF_TEMPO_INATIVO_TPI(const Value: real);
    procedure SetIDF_TIPO(const Value: string);
    procedure SetIDF_TIPO_ATIV(const Value: string);
    procedure SetIDF_TIPO_IMPLEMENT(const Value: string);
    procedure SetIDF_TIPO_UC(const Value: string);
    procedure SetIDF_UNIDADE_TEMPO(const Value: string);
    procedure SetIDF_UPDATE_DATE(const Value: REAL);
    procedure SetIDF_V_MINIMO(const Value: real);
    procedure SetIDF_V_PICO(const Value: real);
    procedure SetIDF_V_REGULAR(const Value: real);
    procedure SetIDF_VALOR_AGREGADO(const Value: string);
    procedure SetIDF_VERSAO(const Value: string);
    procedure SetIDF_VERSAO_DATA(const Value: real);
    procedure SetIDF_VOLUME(const Value: string);
    procedure SetIDF_VOLUME_LOOPING(const Value: real);
    procedure SetIDF_VOLUME_PICO(const Value: string);
    procedure SetIDF_VOLUME_PROC(const Value: real);
    procedure SetIDF_VOLUME_REG(const Value: real);
    procedure SetIDF_WBS_CODE(const Value: string);
    procedure SetIDG_ID(const Value: integer);
    procedure SetSUB_ID(const Value: integer);
    procedure SetSUB_NIVEL(const Value: integer);
    procedure SetIDF_DURATION_TPU1(const Value: real);
    procedure SetIDF_DURATION_TPU2(const Value: real);
    procedure SetIDF_DE_REPET(const Value: integer);
    procedure SetIDF_CUSTO_ANUAL(const Value: real);
    procedure SetIDF_CUSTO_GERAL(const Value: real);
    procedure SetIDF_CUSTO_MP(const Value: real);
    procedure SetIDF_CUSTO_TEC(const Value: real);
    procedure SetIDF_DIRETORIO(const Value: string);
    procedure SetIDF_TELADIR(const Value: string);
   // function Atualizar: boolean;

  published
   property IDF_DESCRICAO                          : string read FIDF_DESCRICAO write SetIDF_DESCRICAO;
   PROPERTY IDG_ID                                 :    integer read FIDG_ID write SetIDG_ID;
   property IDF_ID                                 :    integer read FIDF_ID write SetIDF_ID;
   property IDF_ID_FISICO                          :    integer read FIDF_ID_FISICO write SetIDF_ID_FISICO;
   property IDF_OI                                 :    integer read FIDF_OI write SetIDF_OI;

   property ATIVIDADE_MAE                          :    integer read FATIVIDADE_MAE write SetATIVIDADE_MAE;
   property IDF_DESIGNACAO                         :    string read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
   property SUB_NIVEL                              :    integer read FSUB_NIVEL write SetSUB_NIVEL;
   property ARI_ID                                 :    integer read FARI_ID write SetARI_ID;
   property IDF_ATIVIDADE_CONTEXTO                 :    string read FIDF_ATIVIDADE_CONTEXTO write SetIDF_ATIVIDADE_CONTEXTO;
   property IDF_ATIVIDADE_SUMARIA                   :    string read FIDF_ATIVIDADE_SUMARIA write SetIDF_ATIVIDADE_SUMARIA;
   property IDF_CAUSA_INATIVIDADE                  :    string read FIDF_CAUSA_INATIVIDADE write SetIDF_CAUSA_INATIVIDADE;
   property IDF_CLASSIFICACAO_PP                   :    string read FIDF_CLASSIFICACAO_PP write SetIDF_CLASSIFICACAO_PP;
   property IDF_DEFINICAO_CONTEXTO                 :    string read FIDF_DEFINICAO_CONTEXTO write SetIDF_DEFINICAO_CONTEXTO;
   property IDF_DURATION_TPU                       :    real read FIDF_DURATION_TPU write SetIDF_DURATION_TPU;
   property IDF_NATUREZA                           :    string read FIDF_NATUREZA write SetIDF_NATUREZA;
   property IDF_NOME                               :    string read FIDF_NOME write SetIDF_NOME;
   property IDF_OBJETIVO                           :    string read FIDF_OBJETIVO write SetIDF_OBJETIVO;
   property IDF_OBJETIVO_UC                        :    string read FIDF_OBJETIVO_UC write SetIDF_OBJETIVO_UC;
   property IDF_OBJETIVO_PROCESSO                  :    string read FIDF_OBJETIVO_PROCESSO write SetIDF_OBJETIVO_PROCESSO;
   property IDF_PRIORIDADE                         :    string read FIDF_PRIORIDADE write SetIDF_PRIORIDADE;
   property IDF_RESPONSAVEL                        :    string read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
   property IDF_TEMPO_INATIVO_TPI                  :    real read FIDF_TEMPO_INATIVO_TPI write SetIDF_TEMPO_INATIVO_TPI;
   property IDF_TIPO                               :    string read FIDF_TIPO write SetIDF_TIPO;
   property IDF_TIPO_IMPLEMENT                     :    string read FIDF_TIPO_IMPLEMENT write SetIDF_TIPO_IMPLEMENT;
   property IDF_TIPO_UC                            :    string read FIDF_TIPO_UC write SetIDF_TIPO_UC;
   property IDF_UNIDADE_TEMPO                      :    string read FIDF_UNIDADE_TEMPO write SetIDF_UNIDADE_TEMPO;
   property IDF_VALOR_AGREGADO                     :    string read FIDF_VALOR_AGREGADO write SetIDF_VALOR_AGREGADO;
   property IDF_VOLUME                             :    STRING read FIDF_VOLUME write SetIDF_VOLUME;
   property IDF_VOLUME_PICO                        :    STRING read FIDF_VOLUME_PICO write SetIDF_VOLUME_PICO;
   property IDF_VOLUME_LOOPING                     :    real read FIDF_VOLUME_LOOPING write SetIDF_VOLUME_LOOPING;
   property IDF_VOLUME_PROC                        :    real read FIDF_VOLUME_PROC write SetIDF_VOLUME_PROC;
   property IDF_V_PICO                             :    real read FIDF_V_PICO write SetIDF_V_PICO;
   property IDF_V_REGULAR                          :    real read FIDF_V_REGULAR write SetIDF_V_REGULAR;
   property IDF_V_MINIMO                           :    real read FIDF_V_MINIMO write SetIDF_V_MINIMO;
   property IDF_WBS_CODE                           :    string read FIDF_WBS_CODE write SetIDF_WBS_CODE;
   property IDF_VERSAO                             :    string read FIDF_VERSAO write SetIDF_VERSAO;
   property IDF_VERSAO_DATA                        :    real read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
   property IDF_TIPO_ATIV                          :    string read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;

   property IDF_ADERENCIA                          :    real read FIDF_ADERENCIA write SetIDF_ADERENCIA;
   property IDF_REPONSABILIDADE                    :    string read FIDF_REPONSABILIDADE write SetIDF_REPONSABILIDADE;
   property IDF_ATOR1                              :    string read FIDF_ATOR1 write SetIDF_ATOR1;
   property IDF_ATOR2                              :    string read FIDF_ATOR2 write SetIDF_ATOR2;
   property SUB_ID                                 :    integer read FSUB_ID write SetSUB_ID;
   property IDF_VOLUME_REG                         :    real read FIDF_VOLUME_REG write SetIDF_VOLUME_REG;
   property ATOR :TAtor read FATOR write SetATOR;
   property IDF_DURATION_TPU1                      : real read FIDF_DURATION_TPU1 write SetIDF_DURATION_TPU1;
   property IDF_DURATION_TPU2                      : real read FIDF_DURATION_TPU2 write SetIDF_DURATION_TPU2;
   property IDF_UPDATE_DATE                        : REAL read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
   proPerty IDF_DE_REPET                           : integer read FIDF_DE_REPET write SetIDF_DE_REPET;
   proPerty IDF_CUSTO_TEC                          : real read FIDF_CUSTO_TEC write SetIDF_CUSTO_TEC;
   proPerty IDF_CUSTO_ANUAL                        : real read FIDF_CUSTO_ANUAL write SetIDF_CUSTO_ANUAL;
   proPerty IDF_CUSTO_GERAL                        : real read FIDF_CUSTO_GERAL write SetIDF_CUSTO_GERAL;
   proPerty IDF_CUSTO_MP                           : real read FIDF_CUSTO_MP write SetIDF_CUSTO_MP;
   proPerty IDF_DIRETORIO                          : string read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   proPerty IDF_TELADIR                            : string read FIDF_TELADIR write SetIDF_TELADIR;

   function  Atualizar : boolean;
   function Open_ap(pCli,pProj,pId : integer) : boolean;

   function AtivPr(pCli, pProj: integer; ptipo,pWbs: string;
      pFlag, pAtiv: integer): boolean;
   function Open_uc(pCli, pProj, pId: integer): boolean;
   constructor Create (Aowner : TComponent);
   public


end;




TReq = Class(Tdados)     // requerimentos de TI
  Private
    FID: integer;
    FCLIENTE: integer;
    FCENARIO: integer;
    procedure SetCENARIO(const Value: integer);
    procedure SetCLIENTE(const Value: integer);
    procedure SetID(const Value: integer);
    procedure BefrPost(DataSet: TDataSet);
    function get_maxKey : integer;
    procedure AftDelete(dataset: Tdataset);
    procedure Aftpost(dataset: Tdataset);

    

  published
     function OpenAll : boolean;
     function Get_TI : boolean;
     function Get_TIgLOB(pCli, pProj: integer): boolean;

  public
    constructor Create (Aowner : TComponent);
  published
   property CLIENTE : integer read FCLIENTE write SetCLIENTE;
   property CENARIO : integer read FCENARIO write SetCENARIO;
   property ID      : integer read FID write SetID;

   {inclui na Tabela TI_REQ a partir da Tabela IDF_EV}
   function Inclui(pCli,pProj,pTiCodigo,pId:integer): boolean;
     { inclui na tabela TI_REq a partir da Tabela TI_Req}
   function Inclui_alt(pCli, pProj, pTiCodigo, pId: integer): boolean;
end;

TDiagClass = Class(Tdados)
  Private

  published
     function OpenAll : boolean;
  public

end;

TDiag_dados = Class(Tdados)
  Private
    FObjeto: TDados_tab;
    FPrimAncestor: integer;
    FTOTDIAGRAMAS: integer;

    procedure SetObjeto(const Value: TDados_tab);

    procedure SetPrimAncestor(const Value: integer);
    procedure SetTOTDIAGRAMAS(const Value: integer);

  published
     property Objeto : TDados_tab read FObjeto write SetObjeto;
     property TOTDIAGRAMAS : integer read FTOTDIAGRAMAS write SetTOTDIAGRAMAS;
     property PrimAncestor : integer read FPrimAncestor write SetPrimAncestor;
          // abre diagrama de pai específico
     function Open_Diagrama(pEmp,pCenario,pDiag,pPai : integer) : boolean;
        { abre todos os diagramas indepeneden temente do cliente --> importação,
          escolhendo tipo : dpn,dmi,.. e nivel 0 quando pNivel0 = TRUE }
     function Open_todos(pTipo : string;pNivel0 : boolean) : boolean;

         { abre todos os diagramas do cliente/cenario --> importação,
          escolhendo tipo : dpn,dmi,.. e nivel 0 quando pNivel0 = TRUE }
     function Open_todosCli(pEmp,pCenario : integer;pTipo : string;pNivel0 : boolean) : boolean;

     function Open_Diagramas0(pEmp,pCenario : integer) : boolean; // nível 0

     {abre todos os diagramas do Cliente/projeto}
     function Open_Diagramas(pEmp,pCenario : integer) : boolean;

      { abre todos os diagramas}
     function OpenAll : boolean; // todos

     function Get_Filhos(pCli,pProj,pDiag : integer;pClasse,pOrder : string) : boolean;


     { apaga todos os diagramas específicos}
     function Apagar(pCli,pProj,pDiag : integer;pDiagId : string) : boolean;
         { abre diagrama específico  }
     function Get_Diagrama(pEmp,pCenario,pDiag : integer) : boolean;
          { abre diagrama específico, de classe específica  }
     function Get_DiagramadaClasse(pEmp,pCenario,pDiag : integer; pClasse: string) : boolean;
      { pega os diagramas de pai específico}
     function Get_DiagramaDoPai(pEmp, pCenario, pDiag,
      pPai: integer): boolean;
     function Atualizar : boolean;
     function Open_Operacoes(pEmp, pcenario: integer): boolean;
     { apaga todos os diagramas de um pai específico}
     function ApagardoPai(pCli, pProj, pDiag, ppai: integer;
      pDiagId: string): boolean;
      { TRUE  se o diagrama pDiag tem pai <> pPai}
     function TemOutroPai(pCli, pProj, pDiag, ppai: integer): boolean;
      { pega descrição do diagrama}
     function Get_desc(pCli, pProj, pId: integer): string;
     { atualiza diagrama fisico no BD}
     function Atua_diag : boolean;
     { atualiza descricao do diagrama}
     function Atua_DescDiag : boolean;
     {a atualiza O PAI}
     function Atu_Pai: boolean;
      { retorna o total de diagramas na tabeal sub_subordinacao para cliente/cenario específix}
     function TotalDiag : integer;

      { retorna o total de diagramas na tabeal sub_subordinacao}
     function TotalDiagg: integer;

     { Locka o diagrama}
      function Lock_diag(pEmp,pCenario,pIdg : integer) : boolean;

       { DesLocka o diagrama}
      function UnLock_diag(pEmp,pCenario,pIdg : integer) : boolean;

       function Get_DiagramasDPN(pEmp,pCenario: integer) : boolean;
      { retorna os diagramas da atividade}
     function Get_DiagramasAtiv(pCli,pProj : integer; ptipoDiag : string;pAtiv : integer) : TList;

     function Get_DiagAtiv(pCli, pProj: integer; ptipoDiag: string;pList: TList): TList;
     { retorna o ancestral mais alto do digarma}
     function Get_PrimeiroAncestral(pCli, pProj, pDiag: integer;pTipoDiag : string): integer;

     function get_maxKey : integer;

     constructor create (aowner : Tcomponent);

     ///somente para importaçao de diagramas

     { atualiza o novo ID}
     function Atualizar_idnovo(pIdnovo : integer; PDiagid : string) : boolean;
       { atualiza o pai}
     function Atu_PaiId: boolean;

  public

   mDiag : Udiag;
   Node : TTreeNode;
   REC_COUNT            : integer;
   CLI_ID               : integer;
   PRJ_ID               : integer;
   IDG_ID               : integer;
   SUB_ID               : integer;
   DIAG_PAI_ID          : integer;
   SUB_NOME             : string;
   DIAG_ID              : string;
   ATIVIDADE_MAE        : integer;
   GRID_ALT             : integer;
   GRID_LARG            : integer;
   GRID_COR             : real;
   GRID_SHOW            : integer;
   GRID_SNAP            : string;
   IDG_DIR              : string;
   IDG_NIVEL            : integer;
   IDG_UPDATEDATE       : Tdate;
   IDG_DIAGRAM_STATUS   : string;
   IDG_IDGCLASS         : string;
   IDG_DIAG             : Tmemo;
end;

Tcenario = Class(Tdados)
  Private
     Diaginst : TDiag_Dados;
    FTabelas: TDados_tab;
    FDiagramas: TDiag_dados;
     function Get_Diagramas : TDiag_Dados;
     function get_maxKey : integer;
    procedure SetTabelas(const Value: TDados_tab);
    procedure SetDiagramas(const Value: TDiag_dados);

  published
     property Diagramas : TDiag_dados  read FDiagramas write SetDiagramas;
     property Tabelas : TDados_tab read FTabelas write SetTabelas;
     function Open_Cenarios(pEmp : integer) : boolean;
     procedure OpenAll;
     function  Atualizar : boolean;
     function  Open_Cenario(pEmpresa,pCenario : integer) : boolean;
     function  Apagar : boolean;
      { retorna qtde de cenários}
     function Count_All: integer;

     constructor create (aowner : Tcomponent);
  public
    mCen : uCen;
    CLI_ID                        :  INTEGER;
    PRJ_ID                        :  INTEGER;
    PRJ_TITULO                    :  string;
    PRJ_OBJETIVO                  :  string;
    PRJ_PREMISSAS                 :  string;
    PRJ_RESTRICOES                :  string;
    PRJ_EXPECTATIVA_GANHO         :  string;
    PRJ_ALVOS_MELHORIA            :  string;
    PRJ_CARATER_RELEVANTE         :  string;
    PRJ_DEFINICAO_CONTEXTO        :  string;
    PRJ_FATORES_RESTRITIVOS       :  string;
    PRJ_DATA_INICIO               :  string;
    PRJ_DATA_FIM_PLANEJADA        :  string;
    PRJ_PATH                      : string;
    PRJ_PATROCINADOR              :  string;
    PRJ_CAMINHO                   :  string;
    IDF_DIRETORIO                 :  string;
end;

TEmpresa = Class(Tdados)
  Private
     CenarioInst : Tcenario;
     Fcenarios: TCenario;

     function Get_cenarios : Tcenario;
     function  get_maxKey : integer;
    procedure Setcenarios(const Value: TCenario);

  published
     property cenarios : TCenario  read Fcenarios write Setcenarios;
     Procedure Get_cenario(pCenario : integer);
   procedure Open_All;
   function  Atualizar(pEmpresa :integer) : boolean;
   function  Open_Empresa(pEmpresa : integer) : boolean;
  // function  Localizar(banco_Id,Agencia_id,pConta : string) : boolean;
  // function  Open_Conta(banco_Id,Agencia_id,pConta : string) : boolean;
   function  Apagar(pempresa : integer) : boolean;
   //procedure Novo (pbanco,pCodigo,pConta,pdata : string;psaldo : real);
     { retorna qtde de clientes}
   function Count_All: integer;

   constructor Create (Aowner : TComponent);
  public
    CLI_ID              :	INTEGER;
    CLI_RAZ_O_SOCIAL    :	string;
    CLI_NOME            :	string;
    CLI_AREA_INTERESSE  :	string;
    CLI_DIR             :	string;
    DIR_ALIAS           :	string;
end;

TTemp = Class(Tdados)
  Private

  published
     function get_all: boolean;
     procedure del_temp;
     function Inclui_temp(pCli,pcenario,pIdg : integer;pNOme : string;pCodigo : integer;pTipo : string;pDes , pObs : string) : boolean;
  public
end;

Tdominios = Class(Tdados)
  Private

  published
   function Atualizar(pTipo,pLing: string;pDesc : Tmemo) : boolean;
   function  Open_Dominio(pTipo,pLing : string) : boolean;
  public
    DI_TIPO                     :	string;
    DI_DESCRICAO                :	string;
end;

TTodo = Class(Tdados)
  Private
    FIDG_ID: INTEGER;
    FCLI_ID: INTEGER;
    FPRJ_ID: INTEGER;
    procedure SetCLI_ID(const Value: INTEGER);
    procedure SetIDG_ID(const Value: INTEGER);
    procedure SetPRJ_ID(const Value: INTEGER);
    procedure BefrPost (dataset : Tdataset);
    function get_maxKey: integer;
    procedure AftrPost(dataSet: TdataSet);

  published
      property CLI_ID : INTEGER read FCLI_ID write SetCLI_ID;
      PROPERTY PRJ_ID : INTEGER read FPRJ_ID write SetPRJ_ID;
      PROPERTY IDG_ID : INTEGER read FIDG_ID write SetIDG_ID;

  public
    constructor Create (Aowner : TComponent);

  published
    function Get_dados(pCli,pproj,pIdg : integer;pAberto : boolean): boolean;

    function Get_dadosGeral(pCli,pproj : integer): boolean;

end;

TLimpa = Class(Tdados)
  Private
    FCODIGO: integer;
    FTIPO: string;
    FDESIGNACAO: string;
    procedure SetCODIGO(const Value: integer);
    procedure SetDESIGNACAO(const Value: string);
    procedure SetTIPO(const Value: string);

  published
    property CODIGO : integer read FCODIGO write SetCODIGO;
    property DESIGNACAO : string read FDESIGNACAO write SetDESIGNACAO;
    property TIPO : string read FTIPO write SetTIPO;
    { inclui objetos físicos na tabela IDF_LIMPA}
    function Adeletar : boolean;
    { lIMPA tabela IDF_LIMPA}
    function Limpa: boolean;


  public

end;

TDad = Class(TDados)
  Private
    FIDF_DE_REPET: integer;
    FIDF_SEQ: integer;
    FSUB_NIVEL: integer;
    FPRJ_ID: integer;
    FCLI_ID: integer;
    FIDF_CODIGO: integer;
    FIDF_PK: integer;
    FIDF_DESIGNACAO: string;
    FIDF_DEFAULT_VALUE: string;
    FIDF_NOME: string;
    FIDF_TYPE_QUALIFIERS: string;
    FIDF_VISIBLE: string;
    FIDF_DOMINIO: string;
    FIDF_DEL: string;
    FIDF_DATA_TYPE: string;
    FIDF_NAMING_PREFIX: string;
    FIDF_DESCRICAO: string;
    FIDF_NORMALIZE: string;
    FIDF_TABELA: string;
    FIDF_NATUREZA: string;
    FDataFonte: TdataSource;
    FIDF_CAPTION: STRING;
    FIDF_OBRIG: STRING;
    procedure AftrPost (dataset : Tdataset);
    procedure BefrPost (dataset : Tdataset);
    procedure SetCLI_ID(const Value: integer);
    procedure SetIDF_CODIGO(const Value: integer);
    procedure SetIDF_DATA_TYPE(const Value: string);
    procedure SetIDF_DE_REPET(const Value: integer);
    procedure SetIDF_DEFAULT_VALUE(const Value: string);
    procedure SetIDF_DEL(const Value: string);
    procedure SetIDF_DESCRICAO(const Value: string);
    procedure SetIDF_DESIGNACAO(const Value: string);
    procedure SetIDF_DOMINIO(const Value: string);
    procedure SetIDF_NAMING_PREFIX(const Value: string);
    procedure SetIDF_NATUREZA(const Value: string);
    procedure SetIDF_NOME(const Value: string);
    procedure SetIDF_NORMALIZE(const Value: string);
    procedure SetIDF_PK(const Value: integer);
    procedure SetIDF_SEQ(const Value: integer);
    procedure SetIDF_TABELA(const Value: string);
    procedure SetIDF_TYPE_QUALIFIERS(const Value: string);
    procedure SetIDF_VISIBLE(const Value: string);
    procedure SetPRJ_ID(const Value: integer);
    procedure SetSUB_NIVEL(const Value: integer);
    procedure SetDataFonte(const Value: TdataSource);
    procedure SetIDF_CAPTION(const Value: STRING);
    procedure SetIDF_OBRIG(const Value: STRING);

  published
    property DataFonte: TdataSource read FDataFonte write SetDataFonte;
    property IDF_CODIGO  :  integer read FIDF_CODIGO write SetIDF_CODIGO;
	  property CLI_ID  :  integer read FCLI_ID write SetCLI_ID;
	  property PRJ_ID  :  integer read FPRJ_ID write SetPRJ_ID;
 	  property IDF_TABELA  : string read FIDF_TABELA write SetIDF_TABELA;
	  property IDF_DESIGNACAO  : string read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
	  property SUB_NIVEL  :  integer read FSUB_NIVEL write SetSUB_NIVEL;
	  property IDF_NOME  : string read FIDF_NOME write SetIDF_NOME;
	  property IDF_DEL  : string read FIDF_DEL write SetIDF_DEL;
	  property IDF_VISIBLE  : string read FIDF_VISIBLE write SetIDF_VISIBLE;
	  property IDF_DESCRICAO  : string read FIDF_DESCRICAO write SetIDF_DESCRICAO;
	  property IDF_DATA_TYPE  : string read FIDF_DATA_TYPE write SetIDF_DATA_TYPE;
	  property IDF_DEFAULT_VALUE  : string read FIDF_DEFAULT_VALUE write SetIDF_DEFAULT_VALUE;
	  property IDF_DOMINIO  : string read FIDF_DOMINIO write SetIDF_DOMINIO;
	  property IDF_NAMING_PREFIX  : string read FIDF_NAMING_PREFIX write SetIDF_NAMING_PREFIX;
	  property IDF_NATUREZA  : string read FIDF_NATUREZA write SetIDF_NATUREZA;
	  property IDF_NORMALIZE  : string read FIDF_NORMALIZE write SetIDF_NORMALIZE;
	  property IDF_TYPE_QUALIFIERS  : string read FIDF_TYPE_QUALIFIERS write SetIDF_TYPE_QUALIFIERS;
	  property IDF_DE_REPET  :  integer read FIDF_DE_REPET write SetIDF_DE_REPET;
	  property IDF_PK  :  integer read FIDF_PK write SetIDF_PK;
    property IDF_SEQ  :  integer read FIDF_SEQ write SetIDF_SEQ;
    property IDF_CAPTION : STRING read FIDF_CAPTION write SetIDF_CAPTION;
    property IDF_OBRIG : STRING read FIDF_OBRIG write SetIDF_OBRIG;
    { cria tabela a partir de IDF_IF}
    function inclui(ptab : string): boolean;
    { inclui elementos diretamente}
    function Incluidad: boolean;
    {Retorna tudo}
    function get_all (pCli,pProj : integer) : boolean;
    {Retorna tudo,por descriçào}
    function get_allbyDesc(pCli, pProj: integer): boolean;


        { Imprime tabela Específica}
        function get_ObjetobyDesc(pCli, pProj: integer; pTabela,pOrder : string): boolean;

        //Nova função que será usada no relatório de objetos
        function get_ObjetoDescricao(pCli, pProj: integer): boolean;
     
        { retorna os elementos de dados data tabela}
        function Get_dados(ptab : string): boolean;

        { retorna os elementos de dados da tabela com opçaõ obrigatórios (Classes)}
        function Get_dadosObrig(ptab : string): boolean;

        { retorna a sequencia anterior}
        function Get_seq(pCli,pProj : integer;ptab : string):integer;

        { retorna atributo específico}
        function Get_atrib(pCli,pProj : integer;ptab : string;pAtrib : integer): boolean;

        { delete atributo específico}
        function Del_atrib(pCli,pProj : integer;ptab : string;pAtrib : integer): boolean;
         { delete tabelas do cliente/cenario}
        function DelDoCenario(pCli, pCenario: integer): boolean;

         { retorna todas as tabelas do cliente/projeto}
        function Get_Tabelas(pCli,pProj : integer; pLike : boolean; pNome : string): boolean;

         {deleta linha}
        function Del_Object(pCli, pProj, pcodigo : integer;ptabela : string;pSeq : integer): boolean;
           { inclui um objeto de negócio de uma tabela para outra}
        function incluiObj(pTabde,ptabate : string): boolean;
          {retorna atributo específico}
        function Get_Objeto(pCli, pProj, pAtrib: integer): boolean;
           {atualiza Atributos}
        function Atu_atrib(pCli,pproj,pCodigo,pDecimal : integer;pdesign,pdesc,pnome,ptype,pdominio,
                           pNormal,pqual,ptab : string): boolean;
          { retorana o código do objeto com a descriçào informada}
        function Get_atribDesc(pCli, pProj: integer; pdesc: string): integer;
  public
      constructor Create (Aowner : TComponent);
end;

Tprovider_data = Class(Tdados)
  Private

  published
     { rtetorna tudo}
     function Get_all : boolean;

     function Carga_Array: boolean;
  public
   constructor Create (Aowner : TComponent);
end;

{Objeto IDF_PY}
Tidf_py=Class(Tdados)
private
     {private}
  FPROP_VISIBIL : string ;
  FPROP_TIPO : string ;
  FPROP_DOMINIO : string ;
  FPROP_DEFAULT : string ;
  FLCK : string ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_SEQ : integer ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OBJETIVO : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DEL : string ;
  FCLASS_ID : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
    FIDF_LISTA: INTEGER;
  procedure SetPROP_VISIBIL(const value   : string );
  procedure SetPROP_TIPO(const value   : string );
  procedure SetPROP_DOMINIO(const value   : string );
  procedure SetPROP_DEFAULT(const value   : string );
  procedure SetLCK(const value   : string );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_SEQ(const value   : integer );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetCLASS_ID(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  procedure AftrScroll (DataSet: TDataSet);
    procedure AftrPost(dataSet: TdataSet);
    procedure BefrPost(dataset: Tdataset);
    procedure SetIDF_LISTA(const Value: INTEGER);

public
     {publicTidf_py}
   constructor Create (Aowner : TComponent);

published
  property PROP_VISIBIL : string  read FPROP_VISIBIL write SetPROP_VISIBIL;
  property PROP_TIPO : string  read FPROP_TIPO write SetPROP_TIPO;
  property PROP_DOMINIO : string  read FPROP_DOMINIO write SetPROP_DOMINIO;
  property PROP_DEFAULT : string  read FPROP_DEFAULT write SetPROP_DEFAULT;
  property LCK : string  read FLCK write SetLCK;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_SEQ : integer  read FIDF_SEQ write SetIDF_SEQ;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property CLASS_ID : integer  read FCLASS_ID write SetCLASS_ID;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
  property IDF_LISTA : INTEGER read FIDF_LISTA write SetIDF_LISTA;
    { Inclui 1 registro}
  function Inclui : boolean;


    { atualizar Objeto específico}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;



    { Deleta os properties da Classe}
  function Del_DaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pClasse : integer) : boolean;

   { obtem os properties da Classe}
  function get_DaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pClasse : integer) : boolean;

    { retorna Objeto específico de classe específica}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;

    { retorna todosc  os Objetos de classe específica}
  function get_AtributosdaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pCLASS_ID : integer ) : boolean;

    { retorna todos os registros}
  function get_All : boolean;

  function Get_atrib(pCli, pProj, pClass, pAtrib: integer): boolean;

  function Get_seq(pCli, pProj, pClass: integer): integer;

  function incluiObj(pCli,pProj,pcod,pclass: integer; pTab : string): boolean;
    { retorn todos os atributos que devem ser listados no form do framework}
  function Get_AtribLista(pCLI_ID, pPRJ_ID, pClasse: integer): boolean;

  { deletea properies sem classe}
  function Delete_orfao(pCLI_ID, pPRJ_ID: integer): boolean;

end;


{Objeto IDF_MT}
Tidf_mt=Class(Tdados)
   private
      FCLI_ID : integer ;
      FPRJ_ID : integer ;
      FIDF_CODIGO : integer ;
      FCLASS_ID : integer ;
      FIDF_SEQ : integer ;
      FIDF_CAT : string ;
      FIDF_DEL : string ;
      FIDF_DESIGNACAO : string ;
      FIDF_DIRETORIO : string ;
      FIDF_METBIND : string ;
      FIDF_METDIRECT : string ;
      FIDF_METTYPE : string ;
      FIDF_OBJETIVO : string ;
      FIDF_RESPONSAVEL : string ;
      FIDF_TIPO : string ;
      FIDF_TIPO_ATIVIDADE : string ;
      FIDF_VERSAO : string ;
      FIDF_VERSAO_DATA : real ;
      FIDF_VISIBLE : string ;
      FIDG_ID : integer ;
      FLCK : string ;
      FMET_COMENT : string ;
      FMET_NOME : string ;
      FMET_VISIBIL : string ;
      procedure SetCLI_ID(const value   : integer ) ;
      procedure SetPRJ_ID(const value   : integer ) ;
      procedure SetIDF_CODIGO(const value   : integer ) ;
      procedure SetCLASS_ID(const value   : integer ) ;
      procedure SetIDF_SEQ(const value   : integer ) ;
      procedure SetIDF_CAT(const value   : string ) ;
      procedure SetIDF_DEL(const value   : string ) ;
      procedure SetIDF_DESIGNACAO(const value   : string ) ;
      procedure SetIDF_DIRETORIO(const value   : string ) ;
      procedure SetIDF_METBIND(const value   : string ) ;
      procedure SetIDF_METDIRECT(const value   : string ) ;
      procedure SetIDF_METTYPE(const value   : string );
      procedure SetIDF_OBJETIVO(const value   : string ) ;
      procedure SetIDF_RESPONSAVEL(const value   : string );
      procedure SetIDF_TIPO(const value   : string );
      procedure SetIDF_TIPO_ATIVIDADE(const value   : string ) ;
      procedure SetIDF_VERSAO(const value   : string );
      procedure SetIDF_VERSAO_DATA(const value   : real ) ;
      procedure SetIDF_VISIBLE(const value   : string );
      procedure SetIDG_ID(const value   : integer ) ;
      procedure SetLCK(const value   : string ) ;
      procedure SetMET_COMENT(const value   : string ) ;
      procedure SetMET_NOME(const value   : string ) ;
      procedure SetMET_VISIBIL(const value   : string );
      procedure AftrScroll (DataSet: TDataSet);
      procedure AftrPost(dataSet: TdataSet);
      procedure BefrPost(dataset: Tdataset);


public
     {public Tidf_mt}
   constructor Create (Aowner : TComponent);

published
   property CLI_ID : integer read FCLI_ID write SetCLI_ID;
   property PRJ_ID : integer read FPRJ_ID write SetPRJ_ID;
   property IDF_CODIGO : integer read FIDF_CODIGO write SetIDF_CODIGO;
   property CLASS_ID : integer read FCLASS_ID write SetCLASS_ID;
   property IDF_SEQ  : integer read FIDF_SEQ write SetIDF_SEQ;
   property IDF_CAT   : string  read FIDF_CAT write SetIDF_CAT;
   property IDF_DEL   : string read FIDF_DEL write SetIDF_DEL;
   property IDF_DESIGNACAO   : string read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
   property IDF_DIRETORIO   : string read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   property IDF_METBIND   : string read FIDF_METBIND write SetIDF_METBIND;
   property IDF_METDIRECT   : string read FIDF_METDIRECT write SetIDF_METDIRECT;
   property IDF_METTYPE   : string read FIDF_METTYPE write SetIDF_METTYPE;
   property IDF_OBJETIVO   : string read FIDF_OBJETIVO write SetIDF_OBJETIVO;
   property IDF_RESPONSAVEL  : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
   property IDF_TIPO   : string read FIDF_TIPO write SetIDF_TIPO;
   property IDF_TIPO_ATIVIDADE   : string read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
   property IDF_VERSAO   : string read FIDF_VERSAO write SetIDF_VERSAO;
   property IDF_VERSAO_DATA   : real read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
   property IDF_VISIBLE   : string read FIDF_VISIBLE write SetIDF_VISIBLE;
   property IDG_ID  : integer read FIDG_ID write SetIDG_ID;
   property LCK   : string read FLCK write SetLCK;
   property MET_COMENT   : string read FMET_COMENT write SetMET_COMENT;
   property MET_NOME   : string read FMET_NOME write SetMET_NOME;
   property MET_VISIBIL   : string read FMET_VISIBIL write SetMET_VISIBIL;


    { Inclui 1 registro}
  function Inclui : boolean;


    { atualizar Objeto específico}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;



    { Deleta 1 registro (Chave Primária)}
  function Delete_ObjetoDaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pCLASS_ID : integer ) : boolean;

    { retorna Objeto específico}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;

    { retorna todos os registros}
  function get_All : boolean;


   function Get_atrib(pCli, pProj, pClass, pAtrib: integer): boolean;

   function get_MetodosdaClasse(pCLI_ID, pPRJ_ID,pCLASS_ID: integer): boolean;

   function Get_seq(pCli, pProj, pClass: integer): integer;

   function incluiObj(pCli, pProj, pcod, pclass: integer): boolean;

     { retorna todos os registros com a descrição solicitadda}
  function get_ObjectbyDesc(pCLI_ID, pPRJ_ID, pClass: integer; pDesc: string): boolean;

    { delete métoddos orfaos}
  function Delete_orfao(pCLI_ID, pPRJ_ID: integer): boolean;

end;

 {Objeto IDF_CS}
Tidf_cs=Class(Tdados)
private
     {private}
  FLCK : string ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OBJETIVO : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DEL : string ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  FATRIBUTOS: TIDF_PY;
  FMETODOS: Tidf_mt;
    FIDF_FORM: string;
    FIDF_UNIT_OO: string;
    FIDF_UNIT: string;
    FIDF_TABELA: string;
    FIDF_DIRPROJ: string;
  procedure SetLCK(const value   : string );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  procedure AftrScroll (DataSet: TDataSet);
    procedure SetATRIBUTOS(const Value: TIDF_PY);
    procedure SetMETODOS(const Value: Tidf_mt);
    procedure SetIDF_DIRPROJ(const Value: string);
    procedure SetIDF_FORM(const Value: string);
    procedure SetIDF_TABELA(const Value: string);
    procedure SetIDF_UNIT(const Value: string);
    procedure SetIDF_UNIT_OO(const Value: string);

public
     {publicTidf_cs}
   constructor Create (Aowner : TComponent);

published
  property LCK : string  read FLCK write SetLCK;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
  property ATRIBUTOS : TIDF_PY read FATRIBUTOS write SetATRIBUTOS;
  property METODOS  : Tidf_mt read FMETODOS write SetMETODOS;
  property IDF_FORM       : string read FIDF_FORM write SetIDF_FORM;
  property IDF_UNIT       : string  read FIDF_UNIT write SetIDF_UNIT;
  property IDF_UNIT_OO    : string  read FIDF_UNIT_OO write SetIDF_UNIT_OO;
  property IDF_DIRPROJ    : string  read FIDF_DIRPROJ write SetIDF_DIRPROJ;
  property IDF_TABELA     : string  read FIDF_TABELA write SetIDF_TABELA;
    { Inclui 1 registro}
  function Inclui : boolean;


    { atualizar Objeto específico}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;



    { Deleta 1 registro (Chave Primária)}
  function Del_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;


    { retorna Objeto específico}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;

     { retorna a Classe conhecendo o nome}
  function get_ObjectByNome(pCLI_ID, pPRJ_ID: integer;pnome: string): integer;

    { retorna todos os registros}
  function get_All : boolean;
     { retorna todos os registros exceto pcodigo}
  function Get_allBut(pCod: integer): boolean;
    { deleta todas marcads com idf_del = s}
  function Del_Limpa(pCLI_ID, pPRJ_ID : integer): boolean;
    { ATUALIZA ATRIBUTOS USADOS NA GERAÇÃO DE CÓDIGO}
  function Atu_geracao(pCLI_ID, pPRJ_ID, pIDF_CODIGO: integer): boolean;


end   ;


{Objeto IDF_EN}
Tidf_en=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_IMPLEMENT : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_TIPO : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_PRE_REQUISITOS : string ;
  FIDF_PERIOD_EVENTO_TEMPORA : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;

  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_IMPLEMENT(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_TIPO(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_PRE_REQUISITOS(const value   : string );
  procedure SetIDF_PERIOD_EVENTO_TEMPORA(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_en}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_IMPLEMENT : string  read FIDF_TIPO_IMPLEMENT write SetIDF_TIPO_IMPLEMENT;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_TIPO : string  read FIDF_TIPO write SetIDF_TIPO;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_PRE_REQUISITOS : string  read FIDF_PRE_REQUISITOS write SetIDF_PRE_REQUISITOS;
  property IDF_PERIOD_EVENTO_TEMPORA : string  read FIDF_PERIOD_EVENTO_TEMPORA write SetIDF_PERIOD_EVENTO_TEMPORA;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

      { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_JU}
Tidf_ju=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_LOGICA : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_LOGICA(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );

public
     {publicTidf_ju}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_LOGICA : string  read FIDF_LOGICA write SetIDF_LOGICA;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_RN}
Tidf_rn=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_USE_CASE_ACTOR_TYPE : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_IMPLEMENT : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_REGRA_EXCECAO : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_FORMALIZACAO : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_USE_CASE_ACTOR_TYPE(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_IMPLEMENT(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_REGRA_EXCECAO(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_FORMALIZACAO(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_rn}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_USE_CASE_ACTOR_TYPE : string  read FIDF_USE_CASE_ACTOR_TYPE write SetIDF_USE_CASE_ACTOR_TYPE;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_IMPLEMENT : string  read FIDF_TIPO_IMPLEMENT write SetIDF_TIPO_IMPLEMENT;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_REGRA_EXCECAO : string  read FIDF_REGRA_EXCECAO write SetIDF_REGRA_EXCECAO;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_FORMALIZACAO : string  read FIDF_FORMALIZACAO write SetIDF_FORMALIZACAO;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_CA}
Tidf_ca=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_USE_CASE_ACTOR_TYPE : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_REPONSABILIDADE : string ;
  FIDF_QUANTIDADE_TURNOS : real ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_JORNADA_PADRAO : real ;
  FIDF_JORNADA_ANUAL : real ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_FUNCAO_NIVEL : string ;
  FIDF_FORMACAO : string ;
  FIDF_EXPERIENCA : string ;
  FIDF_ESPECIALIZACAO : string ;
  FIDF_EFETIVO_DA_CLASSE : real ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CUSTO_ANUAL : real ;
  FIDF_CONHECIMENTO : string ;
  FIDF_COND_TRABALHO : string ;
  FIDF_COMPETENCIA : string ;
  FIDF_CLASSEOBJETO : string ;
  FIDF_ACTOR_ROLE : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_USE_CASE_ACTOR_TYPE(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_REPONSABILIDADE(const value   : string );
  procedure SetIDF_QUANTIDADE_TURNOS(const value   : real );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_JORNADA_PADRAO(const value   : real );
  procedure SetIDF_JORNADA_ANUAL(const value   : real );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_FUNCAO_NIVEL(const value   : string );
  procedure SetIDF_FORMACAO(const value   : string );
  procedure SetIDF_EXPERIENCA(const value   : string );
  procedure SetIDF_ESPECIALIZACAO(const value   : string );
  procedure SetIDF_EFETIVO_DA_CLASSE(const value   : real );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CUSTO_ANUAL(const value   : real );
  procedure SetIDF_CONHECIMENTO(const value   : string );
  procedure SetIDF_COND_TRABALHO(const value   : string );
  procedure SetIDF_COMPETENCIA(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetIDF_ACTOR_ROLE(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_ca}
constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_USE_CASE_ACTOR_TYPE : string  read FIDF_USE_CASE_ACTOR_TYPE write SetIDF_USE_CASE_ACTOR_TYPE;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_REPONSABILIDADE : string  read FIDF_REPONSABILIDADE write SetIDF_REPONSABILIDADE;
  property IDF_QUANTIDADE_TURNOS : real  read FIDF_QUANTIDADE_TURNOS write SetIDF_QUANTIDADE_TURNOS;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_JORNADA_PADRAO : real  read FIDF_JORNADA_PADRAO write SetIDF_JORNADA_PADRAO;
  property IDF_JORNADA_ANUAL : real  read FIDF_JORNADA_ANUAL write SetIDF_JORNADA_ANUAL;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_FUNCAO_NIVEL : string  read FIDF_FUNCAO_NIVEL write SetIDF_FUNCAO_NIVEL;
  property IDF_FORMACAO : string  read FIDF_FORMACAO write SetIDF_FORMACAO;
  property IDF_EXPERIENCA : string  read FIDF_EXPERIENCA write SetIDF_EXPERIENCA;
  property IDF_ESPECIALIZACAO : string  read FIDF_ESPECIALIZACAO write SetIDF_ESPECIALIZACAO;
  property IDF_EFETIVO_DA_CLASSE : real  read FIDF_EFETIVO_DA_CLASSE write SetIDF_EFETIVO_DA_CLASSE;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CUSTO_ANUAL : real  read FIDF_CUSTO_ANUAL write SetIDF_CUSTO_ANUAL;
  property IDF_CONHECIMENTO : string  read FIDF_CONHECIMENTO write SetIDF_CONHECIMENTO;
  property IDF_COND_TRABALHO : string  read FIDF_COND_TRABALHO write SetIDF_COND_TRABALHO;
  property IDF_COMPETENCIA : string  read FIDF_COMPETENCIA write SetIDF_COMPETENCIA;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property IDF_ACTOR_ROLE : string  read FIDF_ACTOR_ROLE write SetIDF_ACTOR_ROLE;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;


end;

{Objeto IDF_DG}
Tidf_dg=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VOLUME_PROC2 : integer ;
  FIDF_VOLUME_PROC1 : integer ;
  FIDF_VOLUME_PROC : real ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_UNIDADE_TEMPO : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_MEDIA : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VOLUME_PROC2(const value   : integer );
  procedure SetIDF_VOLUME_PROC1(const value   : integer );
  procedure SetIDF_VOLUME_PROC(const value   : real );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_UNIDADE_TEMPO(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_MEDIA(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_dg}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VOLUME_PROC2 : integer  read FIDF_VOLUME_PROC2 write SetIDF_VOLUME_PROC2;
  property IDF_VOLUME_PROC1 : integer  read FIDF_VOLUME_PROC1 write SetIDF_VOLUME_PROC1;
  property IDF_VOLUME_PROC : real  read FIDF_VOLUME_PROC write SetIDF_VOLUME_PROC;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_UNIDADE_TEMPO : string  read FIDF_UNIDADE_TEMPO write SetIDF_UNIDADE_TEMPO;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_MEDIA : string  read FIDF_MEDIA write SetIDF_MEDIA;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;




end;

{Objeto IDF_LF}
Tidf_lf=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_LOCALIZACAO_FISICA : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CUSTOAMBIENTE : real ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_LOCALIZACAO_FISICA(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CUSTOAMBIENTE(const value   : real );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  

public
     {publicTidf_lf}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_LOCALIZACAO_FISICA : string  read FIDF_LOCALIZACAO_FISICA write SetIDF_LOCALIZACAO_FISICA;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CUSTOAMBIENTE : real  read FIDF_CUSTOAMBIENTE write SetIDF_CUSTOAMBIENTE;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;




end;

{Objeto IDF_SE}
Tidf_se=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_SIGLA : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CUSTO_TEC : real ;
  FIDF_COD_APLIC : integer ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_SIGLA(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CUSTO_TEC(const value   : real );
  procedure SetIDF_COD_APLIC(const value   : integer );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_se}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_SIGLA : string  read FIDF_SIGLA write SetIDF_SIGLA;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CUSTO_TEC : real  read FIDF_CUSTO_TEC write SetIDF_CUSTO_TEC;
  property IDF_COD_APLIC : integer  read FIDF_COD_APLIC write SetIDF_COD_APLIC;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;



 
end;







{Objeto IDF_TX}
Tidf_tx=Class(Tdados)
private
     {private}
  FPRJ_ID : integer ;
  FLCK : string ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OBJETIVO : string ;
  FIDF_IMPLANTACAO : real ;
  FIDF_FORNECEDOR : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DEL : string ;
  FIDF_CUSTO_OUTROS : real ;
  FIDF_CUSTO_MANUT : real ;
  FIDF_CUSTO_LIC : real ;
  FIDF_CODIGO : integer ;
  FIDF_BD : string ;
  FCLI_ID : integer ;
  procedure SetPRJ_ID(const value   : integer );
  procedure SetLCK(const value   : string );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_IMPLANTACAO(const value   : real );
  procedure SetIDF_FORNECEDOR(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CUSTO_OUTROS(const value   : real );
  procedure SetIDF_CUSTO_MANUT(const value   : real );
  procedure SetIDF_CUSTO_LIC(const value   : real );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetIDF_BD(const value   : string );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_tx}
   constructor Create (Aowner : TComponent);

published
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property LCK : string  read FLCK write SetLCK;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_IMPLANTACAO : real  read FIDF_IMPLANTACAO write SetIDF_IMPLANTACAO;
  property IDF_FORNECEDOR : string  read FIDF_FORNECEDOR write SetIDF_FORNECEDOR;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CUSTO_OUTROS : real  read FIDF_CUSTO_OUTROS write SetIDF_CUSTO_OUTROS;
  property IDF_CUSTO_MANUT : real  read FIDF_CUSTO_MANUT write SetIDF_CUSTO_MANUT;
  property IDF_CUSTO_LIC : real  read FIDF_CUSTO_LIC write SetIDF_CUSTO_LIC;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property IDF_BD : string  read FIDF_BD write SetIDF_BD;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
  function Inclui : boolean;


end;

{Objeto TI_REQ}
Tti_req=Class(Tdados)
private
     {private}
  FIDF_CODIGO : integer ;
  FTI_REQ_RN : string ;
  FTI_REQ_PG : string ;
  FTI_REQ_AP : string ;
  FTI_PESO_RN : integer ;
  FTI_PESO_PG : integer ;
  FTI_PESO_AP : integer ;
  FTI_ALTERNATE : string ;
  FTI_SEQ : integer ;
  FTI_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetTI_REQ_RN(const value   : string );
  procedure SetTI_REQ_PG(const value   : string );
  procedure SetTI_REQ_AP(const value   : string );
  procedure SetTI_PESO_RN(const value   : integer );
  procedure SetTI_PESO_PG(const value   : integer );
  procedure SetTI_PESO_AP(const value   : integer );
  procedure SetTI_ALTERNATE(const value   : string );
  procedure SetTI_SEQ(const value   : integer );
  procedure SetTI_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  

public
     {publicTti_req}
   constructor Create (Aowner : TComponent);

published
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property TI_REQ_RN : string  read FTI_REQ_RN write SetTI_REQ_RN;
  property TI_REQ_PG : string  read FTI_REQ_PG write SetTI_REQ_PG;
  property TI_REQ_AP : string  read FTI_REQ_AP write SetTI_REQ_AP;
  property TI_PESO_RN : integer  read FTI_PESO_RN write SetTI_PESO_RN;
  property TI_PESO_PG : integer  read FTI_PESO_PG write SetTI_PESO_PG;
  property TI_PESO_AP : integer  read FTI_PESO_AP write SetTI_PESO_AP;
  property TI_ALTERNATE : string  read FTI_ALTERNATE write SetTI_ALTERNATE;
  property TI_SEQ : integer  read FTI_SEQ write SetTI_SEQ;
  property TI_CODIGO : integer  read FTI_CODIGO write SetTI_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_OI}
Tidf_oi=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_TELADIR : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_NAMING_PREFIX : string ;
  FIDF_MINIESPECIFICACAO : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DISTRIBUICAO : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_DE_REPET : integer ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_TELADIR(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_NAMING_PREFIX(const value   : string );
  procedure SetIDF_MINIESPECIFICACAO(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DISTRIBUICAO(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_DE_REPET(const value   : integer );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );

public
     {publicTidf_oi}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_TELADIR : string  read FIDF_TELADIR write SetIDF_TELADIR;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_NAMING_PREFIX : string  read FIDF_NAMING_PREFIX write SetIDF_NAMING_PREFIX;
  property IDF_MINIESPECIFICACAO : string  read FIDF_MINIESPECIFICACAO write SetIDF_MINIESPECIFICACAO;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DISTRIBUICAO : string  read FIDF_DISTRIBUICAO write SetIDF_DISTRIBUICAO;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_DE_REPET : integer  read FIDF_DE_REPET write SetIDF_DE_REPET;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_EV}
Tidf_ev=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_TELADIR : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_NOME : string ;
  FIDF_MINIESPECIFICACAO : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_TELADIR(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_MINIESPECIFICACAO(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );

public
     {publicTidf_ev}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_TELADIR : string  read FIDF_TELADIR write SetIDF_TELADIR;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_MINIESPECIFICACAO : string  read FIDF_MINIESPECIFICACAO write SetIDF_MINIESPECIFICACAO;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;



 
end;

{Objeto IDF_DADOS}
Tidf_dados=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FIDF_VISIBLE : string ;
  FIDF_TYPE_QUALIFIERS : string ;
  FIDF_TABELA : string ;
  FIDF_SEQ : integer ;
  FIDF_PK : integer ;
  FIDF_OBRIG : string ;
  FIDF_NORMALIZE : string ;
  FIDF_NOME : string ;
  FIDF_NATUREZA : string ;
  FIDF_NAMING_PREFIX : string ;
  FIDF_DOMINIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_DEFAULT_VALUE : string ;
  FIDF_DECIMAL : integer ;
  FIDF_DE_REPET : integer ;
  FIDF_DATA_TYPE : string ;
  FIDF_CAPTION : string ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_TYPE_QUALIFIERS(const value   : string );
  procedure SetIDF_TABELA(const value   : string );
  procedure SetIDF_SEQ(const value   : integer );
  procedure SetIDF_PK(const value   : integer );
  procedure SetIDF_OBRIG(const value   : string );
  procedure SetIDF_NORMALIZE(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_NATUREZA(const value   : string );
  procedure SetIDF_NAMING_PREFIX(const value   : string );
  procedure SetIDF_DOMINIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_DEFAULT_VALUE(const value   : string );
  procedure SetIDF_DECIMAL(const value   : integer );
  procedure SetIDF_DE_REPET(const value   : integer );
  procedure SetIDF_DATA_TYPE(const value   : string );
  procedure SetIDF_CAPTION(const value   : string );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  

public
     {publicTidf_dados}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_TYPE_QUALIFIERS : string  read FIDF_TYPE_QUALIFIERS write SetIDF_TYPE_QUALIFIERS;
  property IDF_TABELA : string  read FIDF_TABELA write SetIDF_TABELA;
  property IDF_SEQ : integer  read FIDF_SEQ write SetIDF_SEQ;
  property IDF_PK : integer  read FIDF_PK write SetIDF_PK;
  property IDF_OBRIG : string  read FIDF_OBRIG write SetIDF_OBRIG;
  property IDF_NORMALIZE : string  read FIDF_NORMALIZE write SetIDF_NORMALIZE;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_NATUREZA : string  read FIDF_NATUREZA write SetIDF_NATUREZA;
  property IDF_NAMING_PREFIX : string  read FIDF_NAMING_PREFIX write SetIDF_NAMING_PREFIX;
  property IDF_DOMINIO : string  read FIDF_DOMINIO write SetIDF_DOMINIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_DEFAULT_VALUE : string  read FIDF_DEFAULT_VALUE write SetIDF_DEFAULT_VALUE;
  property IDF_DECIMAL : integer  read FIDF_DECIMAL write SetIDF_DECIMAL;
  property IDF_DE_REPET : integer  read FIDF_DE_REPET write SetIDF_DE_REPET;
  property IDF_DATA_TYPE : string  read FIDF_DATA_TYPE write SetIDF_DATA_TYPE;
  property IDF_CAPTION : string  read FIDF_CAPTION write SetIDF_CAPTION;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
  function Inclui : boolean;

 
end;

{Objeto IDF_IF}
Tidf_if=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VOLUME_PROC : real ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_UNIDADE_TEMPO : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_MEDIA : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VOLUME_PROC(const value   : real );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_UNIDADE_TEMPO(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_MEDIA(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_if}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VOLUME_PROC : real  read FIDF_VOLUME_PROC write SetIDF_VOLUME_PROC;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_UNIDADE_TEMPO : string  read FIDF_UNIDADE_TEMPO write SetIDF_UNIDADE_TEMPO;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_MEDIA : string  read FIDF_MEDIA write SetIDF_MEDIA;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_DE}
Tidf_de=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TYPE_QUALIFIERS : string ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NORMALIZE : string ;
  FIDF_NOME : string ;
  FIDF_NATUREZA : string ;
  FIDF_NAMING_PREFIX : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DOMINIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_DEFAULT_VALUE : string ;
  FIDF_DE_REPET : integer ;
  FIDF_DATA_TYPE : string ;
  FIDF_CONSTRAINT_NAME : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TYPE_QUALIFIERS(const value   : string );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NORMALIZE(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_NATUREZA(const value   : string );
  procedure SetIDF_NAMING_PREFIX(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DOMINIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_DEFAULT_VALUE(const value   : string );
  procedure SetIDF_DE_REPET(const value   : integer );
  procedure SetIDF_DATA_TYPE(const value   : string );
  procedure SetIDF_CONSTRAINT_NAME(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  

public
     {publicTidf_de}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TYPE_QUALIFIERS : string  read FIDF_TYPE_QUALIFIERS write SetIDF_TYPE_QUALIFIERS;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NORMALIZE : string  read FIDF_NORMALIZE write SetIDF_NORMALIZE;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_NATUREZA : string  read FIDF_NATUREZA write SetIDF_NATUREZA;
  property IDF_NAMING_PREFIX : string  read FIDF_NAMING_PREFIX write SetIDF_NAMING_PREFIX;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DOMINIO : string  read FIDF_DOMINIO write SetIDF_DOMINIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_DEFAULT_VALUE : string  read FIDF_DEFAULT_VALUE write SetIDF_DEFAULT_VALUE;
  property IDF_DE_REPET : integer  read FIDF_DE_REPET write SetIDF_DE_REPET;
  property IDF_DATA_TYPE : string  read FIDF_DATA_TYPE write SetIDF_DATA_TYPE;
  property IDF_CONSTRAINT_NAME : string  read FIDF_CONSTRAINT_NAME write SetIDF_CONSTRAINT_NAME;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
  function Inclui : boolean;
 
 
 
end;

{Objeto IDF_PS}
Tidf_ps=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FPS_TEL : string ;
  FPS_MAIL : string ;
  FPS_CELULAR : string ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_TEMPO_CONTRATACAO : integer ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_ESTADO : string ;
  FIDF_DIRETORIO : string ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_CUSTO_ANUAL : real ;
  FIDF_COMPLEXIDADE : string ;
  FIDF_CLASSIFICACAO_PP : string ;
  FIDF_CLASSEOBJETO : string ;
  FIDF_CARGO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetPS_TEL(const value   : string );
  procedure SetPS_MAIL(const value   : string );
  procedure SetPS_CELULAR(const value   : string );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_TEMPO_CONTRATACAO(const value   : integer );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_ESTADO(const value   : string );
  procedure SetIDF_DIRETORIO(const value   : string );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_CUSTO_ANUAL(const value   : real );
  procedure SetIDF_COMPLEXIDADE(const value   : string );
  procedure SetIDF_CLASSIFICACAO_PP(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetIDF_CARGO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );


public
     {publicTidf_ps}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property PS_TEL : string  read FPS_TEL write SetPS_TEL;
  property PS_MAIL : string  read FPS_MAIL write SetPS_MAIL;
  property PS_CELULAR : string  read FPS_CELULAR write SetPS_CELULAR;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_TEMPO_CONTRATACAO : integer  read FIDF_TEMPO_CONTRATACAO write SetIDF_TEMPO_CONTRATACAO;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_ESTADO : string  read FIDF_ESTADO write SetIDF_ESTADO;
  property IDF_DIRETORIO : string  read FIDF_DIRETORIO write SetIDF_DIRETORIO;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_CUSTO_ANUAL : real  read FIDF_CUSTO_ANUAL write SetIDF_CUSTO_ANUAL;
  property IDF_COMPLEXIDADE : string  read FIDF_COMPLEXIDADE write SetIDF_COMPLEXIDADE;
  property IDF_CLASSIFICACAO_PP : string  read FIDF_CLASSIFICACAO_PP write SetIDF_CLASSIFICACAO_PP;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property IDF_CARGO : string  read FIDF_CARGO write SetIDF_CARGO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;

    { Inclui 1 registro}
  function Inclui : boolean;

end;

{Objeto IDF_PR}
Tidf_pr=Class(Tdados)
private
     {private}
  FIDF_DEL : STRING ;
  FIDF_SEQ : integer ;
  FIDF_TIPO_ATIVIDADE : STRING ;
  FPR_TIPO : string ;
  FPR_NOME : string ;
  FPR_DESCRICAO : string ;
  FIDF_METODO : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetIDF_DEL(const value   : STRING );
  procedure SetIDF_SEQ(const value   : integer );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : STRING );
  procedure SetPR_TIPO(const value   : string );
  procedure SetPR_NOME(const value   : string );
  procedure SetPR_DESCRICAO(const value   : string );
  procedure SetIDF_METODO(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  procedure AftrScroll (DataSet: TDataSet);
  procedure AftrPost(dataSet: TdataSet);
  procedure BefrPost(dataset: Tdataset);
    function Get_seq(pCli, pProj, pMetodo: integer): integer;


public
     {publicTidf_pr}
   constructor Create (Aowner : TComponent);

published
  property IDF_DEL : STRING  read FIDF_DEL write SetIDF_DEL;
  property IDF_SEQ : integer  read FIDF_SEQ write SetIDF_SEQ;
  property IDF_TIPO_ATIVIDADE : STRING  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property PR_TIPO : string  read FPR_TIPO write SetPR_TIPO;
  property PR_NOME : string  read FPR_NOME write SetPR_NOME;
  property PR_DESCRICAO : string  read FPR_DESCRICAO write SetPR_DESCRICAO;
  property IDF_METODO : integer  read FIDF_METODO write SetIDF_METODO;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
  function Inclui : boolean;
 

    { atualizar Objeto específico}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;


    { retorna Objeto específico}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;

    { retorna todos os registros}
  function get_All : boolean;

    { retorna os parámetos do método}
  function get_DoMetodo(pCLI_ID, pPRJ_ID, pMetodo: integer): boolean;

    { deletea os parámetros orfãos dos métodos}
  function Del_Orfaos(pCLI_ID, pPRJ_ID: integer): boolean;

end;

procedure dbg_format ( pDbg : Tdbgrid);
function Checa_Acesso(pForm : string;phabilitado : boolean;pDiag : integer) : boolean;
var
  BDx : TBd;
  wTab,wtipo : string;
  GenCount ,Prim: Integer;
  aType,aTipos : array of string;
  mList : uLst     ;

const WOe: array[1..17] of sTRING = ('AP','AC', 'CA', 'DG', 'OI',
                                        'PS', 'OE','DE','JU','RN','SE',
                                         'EN','LF','EV','IF','TX','CS');
const wBlan : string = '              ';

const WCodClass: array[1..6] of sTRING = ('DPN','DUC', 'DMI', 'DEO', 'LIV','CLS');


implementation


uses bst_ap, bst_treeAtiv, bst_main, bst_lista, bst_log,bst_dm_rel,ooseg,cl_access2;

function Checa_Acesso(pForm : string;phabilitado : boolean;pDiag : integer) : boolean;
var
wUse,i : integer;
begin
 oAcesso.LING := frm_main.idioma;
 If pHabilitado then
  begin
    result := false;
    If {(uppercase(pForm) = 'FRM_MAIN') or}
       (uppercase(pForm) = 'FRM_ICERG') or
       (uppercase(pForm) = 'FRM_LOGO') then
       result := true
    else
    begin

    wUse := 0;
    If pDiag = 0 then   //form
     begin
      with TAccess.Create do
        Begin
          LING := frm_Main.idioma;
          wuse := GetUseCase(pForm,frm_main.idioma);
          oAcesso.IDUSECASE := wUse;
          oAcesso.ID_DIAGRAMA := 0;

          free;
        end;
      end
     else
       Begin
        oAcesso.ID_DIAGRAMA := pDiag;
        oAcesso.IDUSECASE   := 0;
       end;
      

       begin

        oAcesso.CLIENTE := Currempresa.cenarios.CLI_ID;
        oAcesso.CENARIO := CurrEmpresa.cenarios.PRJ_ID;
        If oAcesso.NOME <> '' then  //já logou uma vez.
          begin
           If oAcesso.Check_access(oAcesso.NOME,oAcesso.SENHA,wUse,pDiag)  then   // verifica o nome anterior é válido
              Begin
               result := true;
               exit;
              end
           else
              result := false;
            {If not oAcesso.MUTE then
               ShowMessage(oAcesso.nome+' não tem privilégio para acessar essa Função'); }
          end
        else
           Begin
             result := true;
            {primeiro login mostra a tela de login}
            for i := 0 to 2 do
              Begin
                oAcesso.exec(pForm);
                If oACesso.canc then
                   Begin
                     result := false ;
                     break;
                   end                 
                else
                begin
                If oAcesso.VALIDO then
                   Begin
                    result := TRUE ;
                    break;
                   end                  
                else
                   Begin
                    result := false;
                    oAcesso.NOMEANT := oAcesso.NOME;
                    oAcesso.NOME := '';
                    oAcesso.SENHA:= '';

                   end;
                 end ;
              end;
              end;
        end;
    end;
  end
  else
   result := true;
end;


procedure dbg_format ( pDbg : Tdbgrid);
 var
  i : integer;
   s : string;
  t : variant;
 begin
   for i := 0 to pDbg.Columns.Count - 1 do
    begin

     If pdbg.Columns[i].Field is TFloatField then
           (pdbg.Columns[i].Field as TFloatField).DisplayFormat := '### ### ##0.00'
     else
     If pdbg.Columns[i].Field is TdateTimeField then
           ( pdbg.Columns[i].Field as TdateTImeField).DisplayFormat := 'dd/mm/yy'
     else
     If pdbg.Columns[i].Field is TCurrencyField then
           (pdbg.Columns[i].Field as TCurrencyField ).DisplayFormat := '### ### ##0.00'
     else
     If pdbg.Columns[i].Field is TIntegerField then
           (pdbg.Columns[i].Field as TIntegerField ).DisplayFormat := '### ### ##0';
    end;
 end;


constructor Tdados.Create;
 begin
   inherited create(application);

   If BDx = nil then
      BDx := TBD.Create(false,true,true)  ;
   Connection := BDx;
   DataExt               := TdataSource.create(self);
   dataext.DataSet       := self;

 end;

function Tdados.Criar(sender : Tobject) : boolean;
 begin
     try
      begin
       // bdx.BeginTrans;
       DecimalSeparator := '.';
        with TADOQuery.create(self) do
          begin
            connection := bdx;
            If Tdados(sender as TObject) is TEmpresa then
              begin
               with  TEmpresa(sender as TObject) do
                 begin
                   result := false;
                   //CLI_ID := get_maxkey + 1;
                   CLI_ID := CODIF(CLI_NOME);
                   close;
                   sql.clear;
                   sql.add('INSERT INTO CLI_CLIENTE ');
                   sql.add( '(CLI_ID,CLI_RAZ_O_SOCIAL,CLI_NOME,CLI_AREA_INTERESSE,USUARIO,DATATU)');
                   sql.add(' VALUES ');
                   sql.add('(');
                   sql.add(''+inttostr(CLI_ID)+''+',');
                   sql.add(''''+CLI_RAZ_O_SOCIAL+''''+',');
                   sql.add(''''+CLI_NOME+''''+','+''''+CLI_AREA_INTERESSE+''''+',');
                   sql.add(''''+oAcesso.NOME+''''+',');
                   sql.add(''+floattostr(date)+'');
                   sql.add(')');
                   execsql;
                   If rowsaffected > 0 then
                     result := true;
                end;
              end
            else
              If Tdados(sender as TObject) is TCenario then
              begin
               with  Tcenario(sender as TObject) do
                 begin
                   result := false;
                   PRJ_ID := get_maxkey + 1;
                   close;
                   sql.clear;
                   sql.add('INSERT INTO PRJ_PROJETO ');
                   sql.add( '(CLI_ID,PRJ_ID,PRJ_TITULO,PRJ_OBJETIVO,PRJ_PREMISSAS,');
                   sql.add( 'PRJ_CARATER_RELEVANTE,PRJ_FATORES_RESTRITIVOS,PRJ_PATH,PRJ_PATROCINADOR,PRJ_CAMINHO,IDF_DIRETORIO,USUARIO,DATATU)');
                   sql.add(' VALUES ');
                   sql.add('(');
                   sql.add(''+inttostr(CLI_ID)+''+',');
                   sql.add(''+inttostr(PRJ_ID)+''+',');
                   sql.add(''''+PRJ_TITULO+''''+',');
                   sql.add(''''+PRJ_OBJETIVO+''''+',');
                   sql.add(''''+PRJ_PREMISSAS+''''+',');
                   sql.add(''''+PRJ_CARATER_RELEVANTE+''''+',');
                   sql.add(''''+PRJ_FATORES_RESTRITIVOS+''''+',');
                   sql.add(''''+PRJ_PATH+''''+',');
                   sql.add(''''+PRJ_PATROCINADOR+''''+',');
                   sql.add(''''+PRJ_CAMINHO+''''+',');
                   sql.add(''''+IDF_DIRETORIO+''''+',');
                   sql.add(''''+oAcesso.NOME+''''+',');
                   sql.add(''+floattostr(date)+'');
                   sql.add(')');
                   execsql;
                   If rowsaffected > 0 then
                     result := true;
                end;
              end
             else
              If Tdados(sender as TObject) is TAP then
              begin
               with  TAP(sender as TObject) do
                 begin
                   result := false;
                   IDF_CODIGO := get_maxkey('IDF_AP') + 1;
                   close;
                   sql.clear;
                   sql.add('INSERT INTO IDF_AP (');
                   sql.add('IDF_CODIGO,');
                   SQL.ADD('CLI_ID,');
                   sql.add('PRJ_ID,');
                   sql.add('IDG_ID,');
                   sql.add('IDF_ID,');
                   sql.add('IDF_OI,');
                   sql.add('IDF_TIPO_ATIVIDADE,');
                   sql.add('ATIVIDADE_MAE,');
                   sql.add('IDF_DESIGNACAO,');
                   sql.add('SUB_NIVEL,');
                   sql.add('IDF_ATIVIDADE_SUMARIA,');
                   sql.add('IDF_CAUSA_INATIVIDADE,');
                   sql.add('IDF_DESCRICAO,');
                   sql.add('IDF_DURATION_TPU,');
                   sql.add('IDF_DURATION_TPU1,');
                   sql.add('IDF_DURATION_TPU2,');
                   sql.add('IDF_NATUREZA,');
                   sql.add('IDF_OBJETIVO,');
                   sql.add('IDF_OBJETIVO_UC,');
                   sql.add('IDF_RESPONSAVEL,');
                   sql.add('IDF_TEMPO_INATIVO_TPI,');
                   sql.add('IDF_TIPO,');
                   sql.add('IDF_TIPO_IMPLEMENT,');
                   sql.add('IDF_TIPO_UC,');
                   sql.add('IDF_UNIDADE_TEMPO,');
                   SQL.ADD('IDF_UPDATE_DATE,');
                   sql.add('IDF_VALOR_AGREGADO,');
                   sql.add('IDF_VOLUME,');
                   sql.add('IDF_VOLUME_PICO,');
                   sql.add('IDF_VOLUME_LOOPING,');
                   sql.add('IDF_VOLUME_PROC,');
                   sql.add('IDF_V_PICO,');
                   sql.add('IDF_V_REGULAR,');
                   sql.add('IDF_V_MINIMO,');
                   sql.add('IDF_WBS_CODE,');
                   sql.add('IDF_DEL,');
                   sql.add('IDF_VERSAO,');
                   sql.add('IDF_VERSAO_DATA,');
                   sql.add('IDF_TIPO_ATIV,');
                   sql.add('IDF_VISIBLE,');
                   sql.add('IDF_REPONSABILIDADE,');
                   SQL.ADD('IDF_DE_REPET,');
                   sql.add('IDF_ATOR1,');
                   sql.add('IDF_ATOR2,');
                   sql.add('SUB_ID,');
                   sql.add('IDF_VOLUME_REG,');
                   SQL.ADD('IDF_CUSTO_TEC,');
                   SQL.ADD('IDF_CUSTO_ANUAL,');
                   SQL.ADD('IDF_CUSTO_GERAL,');
                   SQL.ADD('IDF_CUSTO_MP,');
                   SQL.ADD('IDF_DIRETORIO,');
                   SQL.ADD('IDF_TELADIR,USUARIO,DATATU )');
                   sql.add(' VALUES ');
                   sql.add('(');
                   sql.add(''+INTTOSTR(IDF_CODIGO)+''+',');
                   SQL.ADD(''+INTTOSTR(CLI_ID)+''+',');
                   sql.add(''+INTTOSTR(PRJ_ID)+''+',');
                   sql.add(''+INTTOSTR(IDG_ID)+''+',');;
                   sql.add(''+INTTOSTR(IDF_ID)+''+',');
                   sql.add(''+INTTOSTR(IDF_OI)+''+',');
                   sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
                   sql.add(''+INTTOSTR(ATIVIDADE_MAE)+''+',');
                   sql.add(AnsiQuotedStr(IDF_DESIGNACAO,CHR(39))+',');
                   sql.add(''+INTTOSTR(SUB_NIVEL)+''+',');
                   sql.add(''''+IDF_ATIVIDADE_SUMARIA+''''+',');
                   sql.add(AnsiQuotedStr(IDF_CAUSA_INATIVIDADE,chr(39))+',');;
                   sql.add(AnsiQuotedStr(IDF_DESCRICAO,chr(39))+',');
                   sql.add(''+FLOATTOSTR(IDF_DURATION_TPU)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_DURATION_TPU1)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_DURATION_TPU2)+''+',');
                   sql.add(''''+IDF_NATUREZA+''''+',');
                   sql.add(AnsiQuotedStr(IDF_OBJETIVO,chr(39))+',');
                   sql.add(AnsiQuotedStr(IDF_OBJETIVO_UC,chr(39))+',');
                   sql.add(''''+IDF_RESPONSAVEL+''''+',');
                   sql.add(''+FLOATTOSTR(IDF_TEMPO_INATIVO_TPI)+''+',');
                   sql.add(''''+IDF_TIPO+''''+',');
                   sql.add(''''+IDF_TIPO_IMPLEMENT+''''+',');
                   sql.add(''''+IDF_TIPO_UC+''''+',');
                   sql.add(''''+IDF_UNIDADE_TEMPO+''''+',');
                   SQL.ADD(''+FLOATTOSTR(IDF_UPDATE_DATE)+''+',');
                   sql.add(''''+IDF_VALOR_AGREGADO+''''+',');
                   sql.add(AnsiQuotedStr(IDF_VOLUME,chr(39))+',');
                   sql.add(AnsiQuotedStr(IDF_VOLUME_PICO,chr(39))+',');
                   sql.add(''+FLOATTOSTR(IDF_VOLUME_LOOPING)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_VOLUME_PROC)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_V_PICO)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_V_REGULAR)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_V_MINIMO)+''+',');
                   sql.add(''''+IDF_WBS_CODE+''''+',');
                   sql.add(''''+IDF_DEL+''''+',');
                   sql.add(''''+IDF_VERSAO+''''+',');
                   sql.add(''+FLOATTOSTR(IDF_VERSAO_DATA)+''+',');
                   sql.add(''''+IDF_TIPO_ATIV+''''+',');;
                   sql.add(''''+IDF_VISIBLE+''''+',');
                   sql.add(AnsiQuotedStr(IDF_REPONSABILIDADE,chr(39))+',');
                   SQL.ADD(''+INTTOSTR(IDF_DE_REPET)+''+',');
                   sql.add(''''+IDF_ATOR1+''''+',');
                   sql.add(''''+IDF_ATOR2+''''+',');
                   sql.add(''+INTTOSTR(SUB_ID)+''+',');
                   sql.add(''+FLOATTOSTR(IDF_VOLUME_REG)+''+',');
                   SQL.ADD(''+FLOATTOSTR(IDF_CUSTO_TEC)+''+',');
                   SQL.ADD(''+FLOATTOSTR(IDF_CUSTO_ANUAL)+''+',');
                   SQL.ADD(''+FLOATTOSTR(IDF_CUSTO_GERAL)+''+',');
                   SQL.ADD(''+FLOATTOSTR(IDF_CUSTO_MP)+''+',');
                   SQL.ADD(''''+IDF_DIRETORIO+''''+',');
                   SQL.ADD(''''+IDF_TELADIR+''''+',');
                   sql.add(''''+oAcesso.NOME+''''+',');
                   sql.add(''+floattostr(date)+'');
                   sql.add(')');
                   execsql;
                   If rowsaffected > 0 then
                     result := true;
                 end;
               end
              else
              If Tdados(sender as TObject) is TDiag_dados then
              begin
               with  TDiag_dados(sender as TObject) do
                 begin
                   result := false;
                   If Idg_id = 0 then
                      IDG_ID := get_maxkey + 1;
                   DIAG_ID := 'DG'+inttostr(CLI_ID)+inttostr(PRJ_ID)+inttostr(IDG_ID)+'.ADD';
                   TDiag_dados(sender as TObject).IDG_ID := IDG_ID;
                   TDiag_dados(sender as TObject).DIAG_ID:= DIAG_ID;
                   close;
                   sql.clear;
                   sql.add('INSERT INTO SUB_SUBORDINACAO ');
                   sql.add('(');
                   sql.add('CLI_ID,PRJ_ID,IDG_ID,DIAG_PAI_ID,');
                   sql.add('SUB_NOME,DIAG_ID,IDG_DIR,IDG_NIVEL,USUARIO,DATATU)');
                   sql.add(' VALUES ');
                   sql.add('(');
                   sql.add(''+inttostr(CLI_ID)+''+',');
                   sql.add(''+inttostr(PRJ_ID)+''+',');
                   sql.add(''+inttostr(IDG_ID)+''+',');
                   sql.add(''+inttostr(DIAG_PAI_ID)+''+',');
                   sql.add(CHR(34)+SUB_NOME+CHR(34)+',');
                   sql.add(''''+DIAG_ID+''''+',');
                   sql.add(''''+IDG_DIR+''''+',');
                   sql.add(''+inttostr(IDG_NIVEL)+''+',');
                   sql.add(''''+oAcesso.NOME+''''+',');
                   sql.add(''+floattostr(date)+'');
                   sql.add(')');
                   execsql;
                   If rowsaffected > 0 then
                     result := true;
                end;
              end
              else
              If Tdados(sender as TObject) is TDados_Tab then
              begin
               with  Tdados_Tab(sender as TObject) do
                 begin
                   result := false;
                   If IDF_CODIGO = 0 then
                      IDF_CODIGO := get_maxkey(TABELA) + 1;
                   close;
                   sql.clear;
                   sql.add('INSERT INTO '+''+TABELA+'');
                   sql.add('(CLI_ID,PRJ_ID,IDF_CODIGO,USUARIO,DATATU)');
                   sql.add(' VALUES ');
                   sql.add('(');
                   sql.add(''+inttostr(CLI_ID)+''+',');
                   sql.add(''+inttostr(PRJ_ID)+''+',');
                   sql.add(''+inttostr(IDF_CODIGO)+''+',');
                   sql.add(''''+oAcesso.NOME+''''+',');
                   sql.add(''+floattostr(date)+'');
                   sql.add(')');
                   execsql;
                   If rowsaffected > 0 then
                     result := true;
                end;
              end


          end;
         // bdx.CommitTrans;
      end;
     except
      begin
       // sql.savetofile(GetCurrentDir+'\sql.txt');
       // bdx.RollbackTrans;
        raise;
      end;
     end;
     DecimalSeparator := ',';
 end;


procedure Tdados.Cria_lista (pLista: TTreeView;pMostraKey,pLimpa : boolean );
var
i : integer;
 begin
    If pLimpa then
      pLista.Items.clear;

    with Self do
     begin
      while not eof do
       begin
         new(mObj);
         mObj^.Fcodigo := fieldbyname(fcpoLista1).asstring ;
         mObj^.fDesc   := fieldbyname(fcpoLista2).asstring ;
         If fcpolista3 <> '' then
            mObj^.fWbs    := fieldbyname(fcpoLista3).asstring ;
         If fcpolista4 <> '' then
           Begin
              If fieldbyname(fcpoLista4).asstring = 'Responsável' then
               mObj^.fcat := def45
              else
              If fieldbyname(fcpoLista4).asstring = 'Participante' then
               mObj^.fcat := Def46
              else
               mObj^.fcat := Def380;
             // mObj^.fcat    := fieldbyname(fcpoLista4).asstring ;
           end;

         If fcpolista5 <> '' then
            mObj^.fnome    := fieldbyname(fcpoLista5).asstring ;
         If pMostraKey then
            pLista.Items.AddObject(nil,mObj^.Fcodigo+'-'+mObj^.fDesc,mObj)
         else
            pLista.Items.AddObject(nil,mObj^.fDesc,mObj) ;

       next;
       end;
      pLista.SortType := stText;
      pLista.AlphaSort(true);
     end;
 end;

procedure Tdados.SetdataSource ( value : TdataSource);
 begin
    fdataSource  := value;
 end;

procedure Tdados.AftPost(DataSet: TDataSet);
begin
  {fClient.ApplyUpdates(0);
  If fClient.ChangeCount = 0 then
     fClient.refresh; }
end;

procedure Tdados.AftDel(DataSet: TDataSet);
begin
   aftPost( dataset);
end;

{procedure Tdados.OnErrorRec(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);

  begin
    handleReconcileError(dataset,UpdateKind,e);
  end; }

function Tdados.Cria_index(pClient : TClientDataSet ;
        pField : string;pGroup : integer): string;
var
wCount,i : integer   ;
 begin
    With pClient do
    begin
      with  pClient.IndexDefs.create(self) do
       begin
          AddIndexDef ;
          WCount := IndexDefs.count-1;
          Name          := 'iIndex'+inttostr(WCount);

           With IndexDefs.Items[Wcount] do
           begin
             Fields        := pField;
             GroupingLevel := pGroup;
           end;

       end;
      result                         := pClient.IndexDefs.Items[WCount].Name;
      AggregatesActive               := true;
      //FieldByName('BANCO').OnGetText := BcoGettext;
    end;
 end;

function TDados_tab.TotalObj(ptab : string) : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  If pTab ='OC' then
    pTab :=  'OI';
  If pTab ='EE' then
    pTab :=  'CA';
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_'+ptab  );
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDados_tab.TotalObjUC : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_OI ');
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDados_tab.TotalObjCA : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_CA ');
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDados_tab.TotalObjRN : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_RN  ');
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDados_tab.TotalObjIF : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_IF ');
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDados_tab.TotalObjOE : integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM IDF_OE  ');
  open;
  result := fieldbyname('TOT').asinteger;
end;


function TDados_tab.Atualiza_CustoAp(pCli,pProj,pId : integer; pCustomo,pCustotec,pCustoger,pCustoMP : real) : integer;
begin
  DecimalSeparator := '.';
  result := 0;
  close;
  sql.CLEAR;
  sql.add('UPDATE IDF_AP  ');
  sql.add('SET IDF_CUSTO_ANUAL = '+''+floattostr(pCustomo)+''+',');
  sql.add('IDF_CUSTO_TEC = '+''+floattostr(pCustotec)+''+',');
  sql.add('IDF_CUSTO_GERAL = '+''+floattostr(pCustoger)+''+',');
  sql.add('IDF_CUSTO_MP = '+''+floattostr(pCustoMP)+''+',');
  sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
  sql.add('DATATU = '+''+floattostr(date)+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
  EXECSQL;;
  DecimalSeparator := ',';
end;

function TDados_tab.Atualiza_IdNovo(pCli,pProj,pId,pIdnovo : integer; ptabela: string) : boolean;
begin
  DecimalSeparator := '.';
  result := false;

  close;
  sql.CLEAR;
  sql.add('UPDATE '+''+pTabela+'');
  sql.add('SET IDF_CODIGO_NOVO = '+''+inttostr(pIdnovo)+''+',');
  sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
  sql.add('DATATU = '+''+floattostr(date)+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
  EXECSQL;
  If RowsAffected > 0 then
   result := true;
  DecimalSeparator := ',';
end;

function TDados_tab.Existe_IdNovo(pCli,pProj,pId : integer; ptabela: string) : integer;
begin
  DecimalSeparator := '.';
  result := 0;
  //showmessage(connection.ConnectionString);
  close;
  sql.CLEAR;
  sql.add('SELECT * FROM '+''+pTabela+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+' AND ');
  sql.add(' IDF_CODIGO_NOVO > '+''+'0'+'');
  //sql.SaveToFile('c:\sql.txt');
  open;
  If not eof then
   result := fieldbyname('IDF_CODIGO_NOVO').ASINTEGER;
  DecimalSeparator := ',';
end;

function TDados_tab.Exporta_Dim(pCli_de,pProj_de,pCli_ate,pProj_ate : integer;pTabela : string) : boolean;
var
iFld : TstringList;
wcpo,wcpo1 : string;
i : integer;
begin
  iFld :=  TStringList.create;
  DecimalSeparator := '.';
  result := false;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM '+''+pTabela+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI_ATE)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ_ATE)+'');
  OPEN;
  If fieldbyname('TOT').asinteger = 0 then  //não foi exportado
   Begin
      close;
      sql.CLEAR;            
      BDX.GetFieldNames(''+pTabela+'',ifld);
    //  showmessage(bdx.ConnectionString);
    //  showmessage(pTabela);
     //showmessage(ifld.Text);
      for i := 0 to iFld.Count -1 do
       Begin
        If uppercase(iFld[i]) = 'PRJ_ID' then
          Begin
           wCpo  := wcpo + iFld[i] ;
           wcpo1 := wcpo1+ ''+inttostr(pProj_ate)+''
          end
        else
         Begin
           If  (uppercase(copy(iFld[i],1,4)) = 'IDF_') OR (uppercase(copy(iFld[i],1,4)) = 'CLI_') then
             Begin
               wcpo := wcpo + iFld[i] ;
               wcpo1 := wcpo1 + iFld[i] ;
             
               If i < iFld.Count -1 THEN
                Begin
                 wcpo := wcpo + ',';
                 wcpo1 := wcpo1 + ',';
                end;
             end;
         end;
       end;

      sql.add('INSERT INTO '+''+pTabela+'');
      sql.add('('+wcpo+')');
      sql.add('SELECT '+wcpo1+' FROM '+ ''+pTabela+'');
      sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI_de)+''+' AND ');
      sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ_de)+'');
      //sql.SaveToFile('c:\sql.txt');
      EXECSQL;
     end
     else
       showmessage(MensReg13);

  DecimalSeparator := ',';
end;

function TDados_tab.Atualiza_Key(pCli,pProj,pId,pNovoId : integer; pTab : string) : integer;
begin
  DecimalSeparator := '.';
  result := 0;
  close;
  sql.CLEAR;
  sql.add('UPDATE '+''+ptab+'');
  sql.add('SET IDF_CODIGO = '+''+inttostr(pNovoId));
  sql.add('USUARIO = '+''''+oAcesso.NOME+''''+',');
  sql.add('DATATU = '+''+FLOATtostr(DATE)+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
  EXECSQL;;
  DecimalSeparator := ',';
end;

function TDados_tab.Atualiza_KeyCorr(pCli,pProj,pFilhoid,pNovoId : integer;pTipoPai,pTipoFilho : string) : integer;
begin
  DecimalSeparator := '.';
  result := 0;
  close;
  sql.CLEAR;
  sql.add('UPDATE COR_OBJETOS ');
  sql.add('SET FILHO_ID = '+''+inttostr(pNovoId)+'');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
 // sql.add(' AND PAI_TIPO = '+''''+pTipoPai+'''');
  sql.add(' AND FILHO_ID = '+''+INTTOSTR(pFilhoid)+'');
  sql.add(' AND FILHO_TIPO = '+''''+pTipoFilho+'''');
  EXECSQL;;
  DecimalSeparator := ',';
end;

function Tdados_Tab.get_CA(pCli,pProj,pId : integer) : boolean;
 begin
    result := false;                //
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_CA');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_ID = '+''+INTTOSTR(PID)+'');
    open;
    If not eof then
       begin
          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';
          result := true;
       end;

 end;

 function Tdados_Tab.get_AllAtivComReq(pCli,pProj : integer) : boolean;
 begin
    result := false;                //
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_AP P');
    sql.add('LEFT OUTER JOIN TI_REQ R ON R.CLI_ID = P.CLI_ID AND ');
    sql.add('AND R.PRJ_ID = P.PRJ_ID AND R.TI_CODIGO = P.IDF_CODIGO') ;
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    SQL.ADD('AND IDF_TIPO_ATIV = '+''''+'UC'+'''');

    open;
    If not eof then
       begin
          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';
          result := true;
       end;

 end;



function Tdados_Tab.get_Inst(pCli,pProj,pId : integer;pTab : string) : boolean;
 begin
    result := false;                //
    close;
    sql.clear;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
    open;
    If not eof then
       begin
          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';
          result := true;
       end;

 end;

function Tdados_Tab.Get_ListaAp(pCli,pProj : integer; pList : TList) : boolean;
var
i : integer;
s : string;
wlist : boolean;
 begin
    fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV';
      DataSet     := self;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS';
    AfterPost        := AftPost;
    AfterDelete      := AftDel;
    AggregatesActive  := true;
   end;
   dataext.DataSet := fclient;
    wList  := false;
    result := false;
    close;
    sql.clear;
    fclient.Active := false;
    sql.add('SELECT * FROM IDF_AP ');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO IN (' );
    for i := 0 to pList.Count - 1 do
     Begin
        Begin
          mList := pList.Items[i];
          If mList^.eNode.Shape = 50 then
           Begin
            wlist := true;
            sql.add(inttostr(mList^.eNode.UserData)+',') ;
           end;
        end;
     end;
   If wlist then
    Begin
         s := sql[sql.Count-1];
         s[length(s)] := ')';
         sql[sql.Count-1] := s;
    end
   else
    sql[sql.Count-1] :=sql[sql.Count-1]+ '-1)';


  // sql.SaveToFile('c:\sql.txt');
   open;
   fclient.Active := true;

   fclient.AggregatesActive := true;
   fclient.Aggregates.Add;
   fclient.Aggregates[0].Expression    := 'SUM(IDF_CUSTO_ANUAL)';
   fclient.Aggregates[0].GroupingLevel := 0;
   fclient.Aggregates[0].Active := true;

   fclient.AggregatesActive := true;
   fclient.Aggregates.Add;
   fclient.Aggregates[1].Expression    := 'SUM(IDF_CUSTO_TEC)';
   fclient.Aggregates[1].GroupingLevel := 0;
   fclient.Aggregates[1].Active := true;

   fclient.AggregatesActive := true;
   fclient.Aggregates.Add;
   fclient.Aggregates[2].Expression    := 'SUM(IDF_CUSTO_GERAL)';
   fclient.Aggregates[2].GroupingLevel := 0;
   fclient.Aggregates[2].Active := true;

   fclient.AggregatesActive := true;
   fclient.Aggregates.Add;
   fclient.Aggregates[3].Expression    := 'SUM(IDF_CUSTO_MP)';
   fclient.Aggregates[3].GroupingLevel := 0;
   fclient.Aggregates[3].Active := true;

    If not fclient.eof then
       begin
         result := true;
       end;

 end;

function Tdados_Tab.Get_ListaObjeto(pCli,pProj,pShape : integer; pTab : string;
                                     pList : TList;pAtiv,pFlag,pAtor : integer) : boolean;
var
  i : integer;
  s : string;
  wList : boolean;
  wwbs ,ruc,ruc1,pLista: string;
  mLnk : uLstDado;
begin
    pLista := '';
    If pShape >= 0 then
     Begin
        for i := 0 to pList.Count - 1 do
         Begin
            Begin
              mList := pList.Items[i];
              If mList^.eNode.Shape = pShape then
                Begin
                  wList := true;
                  pLista := pLista +(inttostr(mList^.eNode.UserData)+',')
                end;

            end;
         end;
     end
    else        //fluxos de dados
    for i := 0 to pList.Count - 1 do
      Begin
        mLnk := pList.Items[i];
        wList := true;
        pLista := pLista +inttostr(mLnk^.elnk.UserData)+',';
      end;

    pLista:= pLista+'-1';
    result := false;
    close;
    sql.clear;
    wList := false;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO IN (' );
    sql.add(''+pLista+''+')');
    If (ptab = 'IDF_AP') and (pAtor > 0) then
      Begin
        sql.add(' AND EXISTS (SELECT * FROM COR_OBJETOS WHERE PAI_ID IN ('+''+pLista+''+')');
        sql.add('AND PAI_TIPO = '+''''+'AP'+'''');
        sql.add('AND FILHO_ID = '+''+inttostr(pAtor)+'');
        sql.add('AND FILHO_TIPO = '+''''+'CA'+''''+')');
      end;

  { If wlist then
    Begin
         s := sql[sql.Count-1];
         s[length(s)] := ')';
         sql[sql.Count-1] := s;
    end
   else
    sql[sql.Count-1] :=sql[sql.Count-1]+ '-1)';   }

   If ptab = 'IDF_AP' then
       Begin
          If pAtiv = 3 then
           sql.add(' AND (IDF_TIPO_ATIVIDADE =  '+''''+'AP'+''''+' OR IDF_TIPO_ATIVIDADE = '+''''+'UC'+''''+')'+' AND ')
            else
               sql.add(' AND IDF_TIPO_ATIVIDADE =  '+''''+'AP'+''''+' AND ');
            case pAtiv of

               0 : begin
                        ruc     := 'AP';
                        ruc1     := 'AP';
                   end;
               1 : begin
                        ruc     := 'UC';
                        ruc1    := 'UC';
                   end;
               2,3 : begin
                      ruc     := 'AP';
                      ruc1    := 'UC';
                   end;


           end;
            sql.add('( IDF_TIPO_ATIV =  '+''''+RUC+''''+' OR  IDF_TIPO_ATIV = '+''''+RUC1+''''+')');
            If pAtiv  = 3 then
               sql.add(' AND IDF_ATIVIDADE_SUMARIA = '+''''+'S'+'''');
            sql.add(' AND IDF_DESIGNACAO <> '+''''+''+'''');

            If pFlag= 0 then
               sql.add(' ORDER BY CLI_ID,PRJ_ID,IDF_DESIGNACAO ')
            else
               sql.add(' ORDER BY CLI_ID,PRJ_ID,IDF_WBS_CODE ')    ;
       end
    else
      sql.add(' ORDER BY CLI_ID,PRJ_ID,IDF_DESIGNACAO ');
   // sql.SaveToFile('c:\sql.txt');
    open;
    If not eof then
       result := true;

end;


function Tdados_Tab.get_AtivCustos(pCli,pProj,pDiag: integer) : boolean;
 begin
    result := false;
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_AP');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDG_ID = '+''+INTTOSTR(pDiag)+'');
    open;
    If not eof then
       result := true;

 end;


function Tdados_Tab.Get_maxCorrelato( pCli : integer;            // pega o maiot código de uma correlaçào específica
                                   pProj : integer ) :integer;
begin

   close;
   result := 0;
   sql.clear;
   sql.add('SELECT MAX(PERC_CODIGO) AS MAXCOD  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+'');


   open;
   If not eof then
      result := fieldbyname('MAXCOD').asinteger;
end;

function Tdados_Tab.Atu_PercCorrelato(pCli, pProj,pId: integer; pPerc : real): boolean;
begin

   close;
   result := false;
   sql.clear;
   sql.add('UPDATE COR_OBJETOS ' );
   sql.add('SET PERC_CUSTO = '+''+floattostr(pperc)+'');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PERC_CODIGO = '+''+inttostr(pId)+'');


   execsql;;
   If RowsAffected > 0 then
      result := true;
end;

function Tdados_Tab.Atu_PercCorrelacoes(pCli, pProj,pCodigoPai: integer; pPerc : real): boolean;
begin

   close;
   result := false;
   sql.clear;
   sql.add('UPDATE COR_OBJETOS ' );
   sql.add('SET PERC_CUSTO = '+''+floattostr(pperc)+'');
   sql.add('WHERE O.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('O.PRJ_ID = '+''+Inttostr(pProj)+'');
   sql.add('                    AND O.PAI_ID = '+''+inttostr(pCodigoPai)+'');
   sql.add('                    AND  O.PAI_TIPO = '+''''+'JU'+'''');
   sql.add('                    AND  O.FILHO_TIPO = '+''''+'AP'+'''');


   execsql;;
   If RowsAffected > 0 then
      result := true;
end;


function TDados_tab.Cria_InstDE(pCli, pProj, pIdg: integer; pTab,
  pTipoAtiv, pVisible, pDesc, pdataType,pLength: string): boolean;
begin
  begin
    result := false;
    
    close;
    CLI_ID := pCli;
    PRJ_ID := pProj;
    IDF_CODIGO := get_maxkey(ptab) + 1;

    sql.clear;
    sql.add('INSERT INTO '+''+pTab+'');
    sql.add('(CLI_ID,PRJ_ID,IDF_CODIGO ,IDF_TIPO_ATIVIDADE,IDF_VISIBLE,IDG_ID,');
    sql.add('IDF_DEL,IDF_DESIGNACAO,IDF_DATA_TYPE,USUARIO,DATATU,IDF_TYPE_QUALIFIERS)');
    sql.add(' VALUES ('+''+inttostr(pCli)+''+',');
    sql.add(''+inttostr(pproj)+''+',');
    sql.add(''+inttostr(IDF_CODIGO)+''+',');
    sql.add(''''+pTipoAtiv+''''+',');
    sql.add(''''+pVisible+''''+',');
    sql.add(''+inttostr(pIdg)+''+',');
    sql.add(''''+''+''''+',');
    sql.add(''''+pdesc+''''+',');
    sql.add(''''+pDataType+''''+',');
    sql.add(''''+oAcesso.NOME+''''+',');
    sql.add(''+floattostr(date)+''+',');
    sql.add(''''+plength+''''+')');
    execsql ;
    If Rowsaffected > 0 then
       result := true;
 end;

end;

function Tdados_Tab.Cria_Inst(pCli,pProj,pIdg : integer;pTab,pTipoAtiv,pVisible,pdesc,pDescricao : string) : boolean;

 begin
    result := false;
    
    close;
    CLI_ID := pCli;
    PRJ_ID := pProj;
    IDF_CODIGO := get_maxkey(ptab) + 1;

    sql.clear;
    sql.add('INSERT INTO '+''+pTab+'');
    sql.add('(CLI_ID,PRJ_ID,IDF_CODIGO ,IDF_TIPO_ATIVIDADE,IDF_VISIBLE,IDG_ID,IDF_DEL,IDF_OBJETIVO,USUARIO,DATATU,IDF_DESIGNACAO)');
    sql.add(' VALUES ('+''+inttostr(pCli)+''+',');
    sql.add(''+inttostr(pproj)+''+',');
    sql.add(''+inttostr(IDF_CODIGO)+''+',');
    sql.add(''''+pTipoAtiv+''''+',');
    sql.add(''''+pVisible+''''+',');
    sql.add(''+inttostr(pIdg)+''+',');
    sql.add(''''+''+''''+',');
    sql.add(''''+pdescricao+''''+',');
    sql.add(''''+oAcesso.NOME+''''+',');
    sql.add(''+floattostr(date)+''+',');
    sql.add(''''+pdesc+''''+')');
   // sql.SaveToFile('c:\qry.txt');
    execsql ;
    If Rowsaffected > 0 then
       result := true;

 end;

function TDados_tab.get_diag(pcli, pproj: integer): boolean;
begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM SUB_SUBORDINACAO ');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    fCpoLista2 := 'IDF_DESIGNACAO';
    If eof then
       result := false;
end;

function TDados_tab.OpenAllbySeq(pCli, pProj: integer; pTab, pTipo,
  pTipoAtiv: string): boolean;
begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' AND (IDF_DESIGNACAO <> '+''''+''+'''');
    sql.add(' AND  IDF_DESIGNACAO <> '+''''+ ' '+''''+')');
    If ptipo <> '' then   // somente para OI e OC
       sql.add(' AND IDF_TIPO_ATIVIDADE IN ('+''''+pTipo+''''+')');
    If pTipoAtiv <> '' then // somente para AP
       sql.add(' AND IDF_TIPO_ATIV = '+''''+pTipoAtiv+'''');
    sql.add(' ORDER BY CLI_ID,PRJ_ID,SUB_NIVEL');
   // sql.SaveToFile('sql.txt');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    If pTab = 'IDF_REQ' then
      fCpoLista2 := 'TI_REQ_AP'
    else
      fCpoLista2 := 'IDF_DESIGNACAO';
    If eof then
       result := false;
end;


function TDados_tab.OpenAllbydesc(pCli,pProj : integer;pTab,pTipo,pTipoAtiv : string) : boolean;
begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+'');
    // corrigido 10/09/05
   // If pTab = 'IDF_AP' then
     sql.add('  AND PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' AND (IDF_DESIGNACAO <> '+''''+''+'''');
    sql.add(' AND  IDF_DESIGNACAO <> '+''''+ ' '+''''+')');
    If ptipo <> '' then   // somente para OI e OC
       sql.add(' AND IDF_TIPO_ATIVIDADE IN ('+''''+pTipo+''''+')');
    If pTipoAtiv <> '' then // somente para AP
       sql.add(' AND IDF_TIPO_ATIV = '+''''+pTipoAtiv+'''');
    sql.add(' ORDER BY CLI_ID,PRJ_ID,IDF_DESIGNACAO');
   // sql.SaveToFile('c:\sql.txt');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    If pTab = 'IDF_REQ' then
      fCpoLista2 := 'TI_REQ_AP'
    else
      fCpoLista2 := 'IDF_DESIGNACAO';
    If eof then
       result := false;
end;

function TDados_tab.Objetobydesc(pCli,pProj,pCodigo : integer;pTab,pTipo,pTipoAtiv : string) : boolean;
begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' AND (IDF_DESIGNACAO <> '+''''+''+'''');
    sql.add(' AND  IDF_DESIGNACAO <> '+''''+ ' '+''''+')');
    If ptipo <> '' then   // somente para OI e OC
       sql.add(' AND IDF_TIPO_ATIVIDADE IN ('+''''+pTipo+''''+')');
    If pTipoAtiv <> '' then // somente para AP
       sql.add(' AND IDF_TIPO_ATIV = '+''''+pTipoAtiv+'''');
    sql.add(' AND IDF_CODIGO = '+'' +inttostr(pCodigo)+'');
    sql.add(' ORDER BY CLI_ID,PRJ_ID,IDF_DESIGNACAO');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    fCpoLista2 := 'IDF_DESIGNACAO';
    If eof then
       result := false;
end;


function Tdados_Tab.OpenAllDistinct(pCli,pProj : integer) : boolean;
 begin
    result := true;
    close;
    sql.clear;
    sql.add(' SELECT DISTINCT CLI_ID,PRJ_ID,IDF_CODIGO,IDF_DESIGNACAO FROM IDF_DADOS');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' AND (IDF_DESIGNACAO <> '+''''+''+'''');
    sql.add(' AND  IDF_DESIGNACAO <> '+''''+ ' '+''''+')');
   //  sql.SaveToFile('c:\sql.txt');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    fCpoLista2 := 'IDF_DESIGNACAO';
    fCpoLista3 := '';
    fCpoLista4 := '';
    fCpoLista5 := '';

    If eof then
       result := false;
  end;

function Tdados_Tab.OpenAll(pCli,pProj : integer;pTab,pTipo,pTipoAtiv : string;pOp : integer) : boolean;
 begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+'');
   // corrigido 10/09/05
  //  If pTab = 'IDF_AP' then
     sql.add('  AND PRJ_ID = '+''+INTTOSTR(PPROJ)+'');

    If pTab = 'TI_REQ' then
      begin
       sql.add(' AND (TI_REQ_AP <> '+''''+''+'''');
       sql.add(' AND  TI_REQ_AP <> '+''''+ ' '+''''+')');
      end
    else
      begin
       sql.add(' AND (IDF_DESIGNACAO <> '+''''+''+'''');
       sql.add(' AND  IDF_DESIGNACAO <> '+''''+ ' '+''''+')');
      end;


    If ptipo <> '' then   // somente para OI e OC
       sql.add(' AND IDF_TIPO_ATIVIDADE IN ('+''''+pTipo+''''+')');
    If pTipoAtiv <> '' then // somente para AP
       sql.add(' AND IDF_TIPO_ATIV = '+''''+pTipoAtiv+'''');
    If pOp > 0 then   // somente AC (aspectos)
       sql.add(' AND IDF_ID = '+''+inttostr(pOp)+'');
   // sql.SaveToFile('c:\sql.txt');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    If pTab = 'TI_REQ' then
      fCpoLista2 := 'TI_REQ_AP'
    else
    fCpoLista2 := 'IDF_DESIGNACAO';
    fCpoLista3 := '';
    fCpoLista4 := '';
    fCpoLista5 := '';
    If uppercase(pTab) = 'IDF_AP' then
       fCpoLista3 := 'IDF_WBS_CODE';
    If eof then
       result := false;
 end;

 function Tdados_Tab.Get_Mecanismos(pCli,pProj,pAplic : integer) : boolean;
 begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_SE');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+'');
    sql.add('  AND PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add('  AND IDF_COD_APLIC = '+''+INTTOSTR(PAPLIC)+'');
    open;
    fCpoLista1 := 'IDF_CODIGO';
    fCpoLista2 := 'IDF_DESIGNACAO';
    fCpoLista3 := '';
    fCpoLista4 := '';
    fCpoLista5 := '';
    
    If eof then
       result := false;
 end;

 function Tdados_Tab.Get_MecanismosComAplic(pCli,pProj : integer) : boolean;
 begin
    result := true;
    close;
    sql.clear;
    sql.add('SELECT S.IDF_DESIGNACAO,S.IDF_DESCRICAO,X.IDF_DESIGNACAO AS APLIC,S.IDF_SIGLA FROM IDF_SE S');
    sql.add('LEFT OUTER JOIN IDF_TX X ON S.PRJ_ID = X.PRJ_ID AND S.CLI_ID = X.CLI_ID');
    sql.add('AND S.IDF_COD_APLIC = X.IDF_CODIGO');
    sql.add(' WHERE S.CLI_ID = '+''+INTTOSTR(PCLI)+'');
    sql.add('  AND S.PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add('ORDER BY X.CLI_ID,X.PRJ_ID,X.IDF_DESIGNACAO');

    open;
    fCpoLista1 := 'IDF_CODIGO';
    fCpoLista2 := 'IDF_DESIGNACAO';
    fCpoLista3 := '';
    fCpoLista4 := '';
    fCpoLista5 := '';

    If eof then
       result := false;
 end;




function TDados_tab.Get_Aspectos(pCli,pProj,pOperacao,pAsp : integer) : boolean;
var                             // pega todoas aspectos de uma determinada operação
s : string;
 begin
    result := false;
    close    ;
    sql.clear;
    sql.add('SELECT * FROM IDF_AC ');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_ID = '+''+INTTOSTR(POPERACAO)+'');
    If pAsp = 1  then
       sql.add(' AND IDF_TIPO__ASPECTO = '+''''+'AC'+'''')
    else
       sql.add(' AND IDF_TIPO__ASPECTO = '+''''+'AM'+'''');
    open;
    If not eof then
       begin
          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';
          result     := true;
          CLI_ID     := pCli;
          PRJ_ID     := pProj;
          //IDF_CODIGO := pId;
       end;

 end;



function Tdados_Tab.Apagar(pTab : string) : boolean;
var
i : integer;
 begin
    result := false;
    close;
    sql.clear;

    sql.add('DELETE  FROM '+''+pTab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(CLI_ID)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PRJ_ID)+'');
    execsql;;
    If rowsaffected > 0 then
       result := true;
 end;



function Tdados_Tab.Get_Correlato( pCli : integer;            // pega uma correlaçào específica
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   pCodigoFilho : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('SELECT * FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_ID = '+''+inttostr(pCodigoPai)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add(' FILHO_ID = '+''+inttostr(pCodigoFilho)+''+' AND ');
   sql.add(' FILHO_TIPO = '+''''+pTipoFilho+'''');

   open;
   If eof then
      result := false;
end;

function Tdados_Tab.Get_PaisFilhos( pCli : integer;     //Não editável!!!!!

                                   pProj : integer;    // pega todos os correlatos  ,
                                   pTipoPai : string;  //conhecendo o pai(codigo (link com master) e tipo) e
                                   pTipoFilho : string; // o tipo do filho;
                                   ptab : string) : boolean;
begin

   close;
   result := true;
   sql.clear;

   sql.add('SELECT * FROM  COR_OBJETOS O LEFT OUTER JOIN '+''+ptab+''+' I ON   '); { TODO -c6-00022-2 : Teste de otimização }
   sql.add('I.CLI_ID = O.CLI_ID AND  ');
   sql.add('I.PRJ_ID = O.PRJ_ID AND  ');
   sql.add('I.IDF_CODIGO = O.FILHO_ID  ');

   sql.add('WHERE O.CLI_ID = '+ Inttostr(pCli)+' AND  ');
   sql.add('O.PRJ_ID = '+ Inttostr(pProj)+' AND  ');
   sql.add('          O.PAI_ID = :IDF_CODIGO AND ');
   sql.add('          O.PAI_TIPO = '+#39+pTipoPai+#39+' AND ');
   sql.add('          O.FILHO_TIPO = '+#39+pTipoFilho+#39' AND ');

   sql.add('          I.IDF_DESIGNACAO <> '+''''+''+'''');



   If(ptab = 'IDF_DE') or (ptab = 'IDF_DATA') or (ptab = 'IDF_IF')then
     sql.add('ORDER BY I.CLI_ID,I.PRJ_ID,I.SUB_NIVEL');
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;

  //SQL.SaveToFile('C:\SQL.TXT');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;

function Tdados_Tab.Get_PaisFilhosByDesc( pCli : integer;     //Não editável!!!!!

                                   pProj : integer;    // pega todos os correlatos  ,
                                   pTipoPai : string;  //conhecendo o pai(codigo (link com master) e tipo) e
                                   pTipoFilho : string; // o tipo do filho;
                                   ptab : string) : boolean;
begin

   close;
   result := true;
   sql.clear;

   sql.add('SELECT * FROM  COR_OBJETOS O LEFT OUTER JOIN '+''+ptab+''+' I ON   '); { TODO -c6-00022-2 : Teste de otimização }
   sql.add('I.CLI_ID = O.CLI_ID AND  ');
   sql.add('I.PRJ_ID = O.PRJ_ID AND  ');
   sql.add('I.IDF_CODIGO = O.FILHO_ID  ');

   sql.add('WHERE O.CLI_ID = '+ Inttostr(pCli)+' AND  ');
   sql.add('O.PRJ_ID = '+ Inttostr(pProj)+' AND  ');
   sql.add('          O.PAI_ID = :IDF_CODIGO AND ');
   sql.add('          O.PAI_TIPO = '+#39+pTipoPai+#39+' AND ');
   sql.add('          O.FILHO_TIPO = '+#39+pTipoFilho+#39+' AND ');

   sql.add('          I.IDF_DESIGNACAO <> '+''''+''+'''');
   sql.add('ORDER BY I.CLI_ID,I.PRJ_ID,I.IDF_DESIGNACAO');
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;

  // frm_main.MEMO2.text := sql.Text;
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;


function Tdados_Tab.Get_Correlatos( pCli : integer;    // pega todos os correlatos  ,
                                                       //conhecendo o pai(codigo e tipo) e
                                   pProj : integer;    // o tipo do filho
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   ptab : string) : boolean;  //editável!!!!!
begin

   close;
   result := true;
   sql.clear;


   sql.add('SELECT * FROM '+''+ptab+''+' I ');
   //sql.add('WHERE I.IDF_CODIGO IN  ');
   sql.add('WHERE EXISTS  ');
   sql.add('(SELECT * FROM COR_OBJETOS O WHERE  ');
   sql.add('                      O.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('                      O.PRJ_ID = '+''+Inttostr(pProj)+''+' AND ');
   sql.add('                      O.PAI_ID = '+''+inttostr(pCodigoPai)+''+ ' AND ');
   sql.add('                      O.PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add('                      O.FILHO_ID = I.IDF_CODIGO AND ');
   sql.add('                      O.FILHO_TIPO = '+''''+pTIPOFILHO+''''+')  AND ');
   sql.add('I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('I.PRJ_ID = '+''+Inttostr(pProj)+'');
   //SQL.SaveToFile('C:\SQL.TXT');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
   If ptab = 'IDF_SE' then
     fCpoLista5 := 'IDF_NOME';
end;

function Tdados_Tab.Get_Aplicativos( pCli : integer; pProj : integer; pId : integer ) :integer;
begin

   close;
   result := 0;
   sql.clear;
   sql.add('SELECT COUNT(*) AS TOT FROM IDF_SE S ');
   sql.add ('WHERE CLI_ID = '+''+INTTOSTR(pCli) +'');
   sql.add(' AND PRJ_ID = '+''+ INTTOSTR(pproj) +'');
   sql.add(' AND S.IDF_COD_APLIC= '+''+INTTOSTR(pId)+'');


   open;
   If NOT eof then
      result := FIELDBYNAME('TOT').ASINTEGER;


end;

function Tdados_Tab.Get_qtdeAtivLoc( pCli : integer; pProj : integer; pId : integer ) :integer;
begin                                          //PID : LOCAL DE PROC
                                              // retorna a qtde de atividades com local de proc = pId
   close;
   result := 0;
   sql.clear;
   sql.add('SELECT COUNT(*) AS TOT FROM COR_OBJETOS S ');
   sql.add('WHERE    ');
   sql.add ('S.CLI_ID = '+''+INTTOSTR(pCli) +'');
   sql.add(' AND S.PRJ_ID = '+''+ INTTOSTR(pproj) +'');
   sql.add(' AND S.PAI_TIPO = '+''''+'AP'+'''');
   sql.add(' AND s.FILHO_TIPO = '+''''+'LF'+'''');
   sql.add(' AND S.FILHO_ID= '+''+INTTOSTR(pId)+'');

 //  sql.SaveToFile('c:\sql.txt');
   open;
   If NOT eof then
      result := FIELDBYNAME('TOT').ASINTEGER;


end;


function Tdados_Tab.Get_CorrelatosBis( pCli : integer;    // pega todos os correlatos  com dados do cor_objetos,
                                                       //conhecendo o pai(codigo e tipo) e
                                   pProj : integer;    // o tipo do filho
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pClass,pSentido : string ): boolean;  //editável!!!!!
begin

   close;
   result := true;
   sql.clear;


   sql.add('SELECT * FROM '+''+ptab+''+' I ');
   sql.add('LEFT OUTER JOIN COR_OBJETOS O ON  ');
   sql.add('                      O.CLI_ID = I.CLI_ID AND ');
   sql.add('                      O.PRJ_ID = I.PRJ_ID AND ');
   sql.add('                      O.FILHO_ID = I.IDF_CODIGO ');
   sql.add('WHERE I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('I.PRJ_ID = '+''+Inttostr(pProj)+'');
   sql.add('                    AND O.PAI_ID = '+''+inttostr(pCodigoPai)+'');
   sql.add('                    AND  O.PAI_TIPO = '+''''+pTipoPai+'''');
   sql.add('                    AND  O.FILHO_TIPO = '+''''+pTIPOFILHO+'''');
   If pClass <> '' then
    Begin
       sql.add('ORDER BY '+''+PcLASS+'');
       If (pSentido = '') or (pSentido = 'A') then
         sql.add(' ASC ')
       else
       If (pSentido = 'D') then
         sql.add(' DESC ')
    end;
  // SQL.SaveToFile('C:\SQL.TXT');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
   fCpoLista3 := '';
   fCpoLista4 := 'ATOR_CATEGORIA';
end;

function Tdados_Tab.Get_Correlacoes( pCli : integer;

                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string) : boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('SELECT * FROM COR_OBJETOS O ');
   sql.add('WHERE O.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('O.PRJ_ID = '+''+Inttostr(pProj)+'');
   sql.add('                    AND O.PAI_ID = '+''+inttostr(pCodigoPai)+'');
   sql.add('                    AND  O.PAI_TIPO = '+''''+pTipoPai+'''');
   sql.add('                    AND  O.FILHO_TIPO = '+''''+pTIPOFILHO+'''');

  // SQL.SaveToFile('C:\SQL.TXT');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;

function Tdados_Tab.Get_TodasCorrelacoes( pCli : integer;pProj : integer): boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('SELECT * FROM COR_OBJETOS O ');
   sql.add('WHERE O.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('O.PRJ_ID = '+''+Inttostr(pProj)+'');

  // SQL.SaveToFile('C:\SQL.TXT');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;


function Tdados_Tab.Get_CorrelatosByDesc( pCli : integer;    // pega todos os correlatos  ,
                                                       //conhecendo o pai(codigo e tipo) e
                                   pProj : integer;    // o tipo do filho
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   ptab : string) : boolean;  //editável!!!!!
begin

   close;
   result := true;
   sql.clear;


   sql.add('SELECT * FROM '+''+ptab+''+' I ');
  // sql.add('WHERE I.IDF_CODIGO IN  ');
   sql.add('WHERE EXISTS  ');
   sql.add('(SELECT O.FILHO_ID FROM COR_OBJETOS O WHERE  ');
   sql.add('                      I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('                      I.PRJ_ID = '+''+Inttostr(pProj)+''+' AND ');
   sql.add('                      O.PAI_ID = '+''+inttostr(pCodigoPai)+''+ ' AND ');
   sql.add('                      O.PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add('                      O.FILHO_ID = I.IDF_CODIGO AND ');
   sql.add('                      O.FILHO_TIPO = '+''''+pTIPOFILHO+''''+')  AND ');
   sql.add('I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('I.PRJ_ID = '+''+Inttostr(pProj)+'');
   sql.add(' ORDER BY I.IDF_DESIGNACAO');

   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;

function Tdados_Tab.Get_PaisCorrelatos( pCli : integer;    // pega todos os pais  ,
                                                       //conhecendo o tipo do pai e
                                   pProj : integer;    // o tipo e codigo do filho
                                   pTipoPai : string;   //Não editável!!!!!
                                   pCodigoFilho : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pOrder : string) : boolean;   //sequencia de campos para classificaçào
begin

   close;
   result := true;
   sql.clear;

   sql.add('SELECT * FROM '+''+ptab+''+' I ');
   sql.add('WHERE I.IDF_CODIGO IN  ');
   sql.add('(SELECT O.PAI_ID FROM COR_OBJETOS O WHERE  ');
   sql.add('                      I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('                      I.PRJ_ID = '+''+Inttostr(pProj)+''+' AND ');
   sql.add('                      O.FILHO_ID = '+''+inttostr(pCodigoFilho)+''+ ' AND ');
   sql.add('                      O.FILHO_TIPO = '+''''+pTIPOFILHO+''''+' AND ');
   sql.add('                      O.PAI_TIPO = '+''''+pTipoPai+''''+')'+' AND ');


   sql.add('I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('I.PRJ_ID = '+''+Inttostr(pProj)+'');
   If pOrder <> '' then
    sql.add('ORDER BY '+''+PORDER+'');
   //FRM_MAIN.Memo1.Text := SQL.Text;
   open;
   If eof then
      result := false;
  // showmessage(inttostr(recordCount));   
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;

function Tdados_Tab.Get_PaisCorrelatosCod( pCli : integer;    // pega todos os pais  ,
                                                             //conhecendo o tipo do pai e
                                   pProj : integer;          // o tipo e codigo do filho (retorna so os codigod)
                                   pTipoPai : string;
                                   pCodigoFilho : integer;
                                   pTipoFilho ,pAtor: string) : TList;


 type
  PCod = ^ACod;
  ACod = record
    I: Integer;
  end;

var
  wlst : TList;

  ARec: Pcod;

begin
   wLst := TList.create;
   close;

   sql.clear;

   sql.add('SELECT * FROM COR_OBJETOS O WHERE  ');
   sql.add('O.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('O.PRJ_ID = '+''+Inttostr(pProj)+''+' AND ');
   sql.add('                      O.FILHO_ID = '+''+inttostr(pCodigoFilho)+''+ ' AND ');
   sql.add('                      O.FILHO_TIPO = '+''''+pTIPOFILHO+''''+' AND ');
   sql.add('                      O.PAI_TIPO = '+''''+pTipoPai+'''');
   If pAtor <> '' then
    sql.add(' AND ATOR_CATEGORIA = '+''''+pAtor+'''');
 //  sql.SaveToFile('c:\sql.txt');

   open;
   while not eof do
    Begin
     new(arec);
     aRec^.I := fieldbyname('PAI_ID').asinteger;
     wLst.Add(arec);
     next;
    end;
   result := wlst;

end;


function Tdados_Tab.Get_PaisCorrelatosBis( pCli : integer;    // pega todos os pais  ,
                                                       //conhecendo o tipo do pai e
                                   pProj : integer;    // o tipo e codigo do filho + dados da correlação
                                   pTipoPai : string;   //Não editável!!!!!
                                   pCodigoFilho : integer;
                                   pTipoFilho : string;
                                   ptab : string;
                                   pClass : string;
                                   pSentido : string) : boolean;
begin

   close;
   result := true;
   sql.clear;

   sql.add('SELECT * FROM '+''+ptab+''+' I ');
   sql.add('LEFT OUTER JOIN COR_OBJETOS O ON  ');
   sql.add('                      O.CLI_ID = I.CLI_ID AND ');
   sql.add('                      O.PRJ_ID =  I.PRJ_ID AND ');
   sql.add('                      O.PAI_ID = I.IDF_CODIGO ');
   sql.add('WHERE I.CLI_ID = '+''+Inttostr(pCli)+''+' AND ');
   sql.add('I.PRJ_ID = '+''+Inttostr(pProj)+'');
   sql.add('                    AND  O.PAI_TIPO = '+''''+pTipoPai+'''');
   sql.add('                    AND  O.FILHO_TIPO = '+''''+pTIPOFILHO+'''');
   sql.add('                    AND  O.FILHO_ID = '+''+inttostr(pCodigoFILHO)+'');
   If pClass <> '' then
    Begin
       sql.add('ORDER BY '+''+PcLASS+'');
       If (pSentido = '') or (pSentido = 'A') then
         sql.add(' ASC ')
       else
       If (pSentido = 'D') then
         sql.add(' DESC ')
    end;
      

  // sql.SaveToFile('c:\sql.txt');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;


function Tdados_Tab.Get_PaidosFilhos( pCli : integer;    // pega todos os pais  master/detail,
                                                       //conhecendo o tipo do pai ,
                                   pProj : integer;    // o tipo  do filho  e o codigo do filho como parametro de link com pai
                                   pTipoPai : string;   //Não editável!!!!!
                                   pTipoFilho : string;
                                   ptab : string) : boolean;
begin

   close;
   result := true;
   sql.clear;

   sql.add('SELECT * FROM  COR_OBJETOS O LEFT OUTER JOIN '+''+ptab+''+' I ON    '); { TODO -c6-00022-2 : Teste de otimização }
   sql.add('I.CLI_ID = O.CLI_ID  AND  ');
   sql.add('I.PRJ_ID = O.PRJ_ID AND  ');
   sql.add('I.IDF_CODIGO = O.PAI_ID  ');

   sql.add('WHERE O.CLI_ID = '+ Inttostr(pCli)+' AND  ');
   sql.add('O.PRJ_ID = '+ Inttostr(pProj)+' AND  ');
   sql.add('          O.FILHO_ID = :IDF_CODIGO AND ');
   sql.add('          O.FILHO_TIPO = '+#39+pTipoFilho+#39' AND ');
   sql.add('           O.PAI_TIPO = '+#39+pTipoPai+#39+' AND ');
   sql.add('                      I.IDF_DESIGNACAO <> '+''''+''+'''');
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;

 //sql.SaveToFile('c:\sql.txt');
   open;
   If eof then
      result := false;
   fCpoLista1 := 'IDF_CODIGO';
   fCpoLista2 := 'IDF_DESIGNACAO';
end;



function Tdados_Tab.Cria_Correlacao( pCli : integer;            // Cria uma correlaçào específica
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string;
                                   pCodigoFilho : integer;
                                   pCat : string;
                                   pPerc_Custo : real;
                                   pPerc_Id : integer) : boolean;
begin
  If self.Get_Correlato(pCli,pProj,pTipoPai,pCodigoPai,pTipoFilho,pCodigoFilho) then
     exit;
  close;
  If pCat = '' then
   pCat := ' ';
  sql.clear;
  result := false;
  sql.add('INSERT INTO COR_OBJETOS(');
  sql.add('CLI_ID, PRJ_ID, PAI_TIPO, PAI_ID, FILHO_TIPO, FILHO_ID,ATOR_CATEGORIA,PERC_CUSTO,PERC_CODIGO)');
  sql.add('VALUES( ');
  sql.add(''+inttostr(pCli)+''+',');
  sql.add(''+inttostr(pProj)+''+',');
  sql.add(''''+pTipoPai+''''+',');
  sql.add(''+inttostr(pCodigoPai)+''+',');
  sql.add(''''+pTipoFilho+''''+',');
  sql.add(''+inttostr(pCodigoFilho)+''+',');
  sql.add(''''+pCat+''''+',');
  sql.add(''+floattostr(pPerc_Custo)+''+',');
  sql.add(''+Inttostr(pPerc_Id)+''+')');
  execsql;
  If RowsAffected > 0 then
     result := true;

end;

function Tdados_Tab.Apaga_correlacoes( pCli : integer;            // Apaga todas as correlaçoes
                                   pProj : integer;
                                   pTipoPai : string;
                                   pCodigoPai : integer;
                                   pTipoFilho : string) : boolean;
begin

   close;
   result := false;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add(' PAI_ID = '+''+inttostr(pCodigoPai)+''+' AND ');
   sql.add(' FILHO_TIPO = '+''''+pTipoFilho+'''');
  execsql;
  If RowsAffected > 0 then
     result := true;

end;

function Tdados_Tab.Apaga_correlacoesFilho( pCli : integer;  // Apaga todas as correlaçoes  do filho
                                   pProj : integer;
                                   pcodfilho : integer;
                                   pTipofilho : string) : boolean;
begin

   close;
   result := false;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' FILHO_ID = '+''+inttostr(pCodFilho)+''+' AND ');
   sql.add(' FILHO_TIPO = '+''''+pTipoFilho+'''');
  execsql;
  If RowsAffected > 0 then
     result := true;

end;

function TDados_tab.Apaga_CorrFilhoSolto(pCli, pProj: integer;
  pTipoFilho: string): boolean;
var
ptab : string;
begin
   close;
  { If pTipoFilho = 'OC' then
    ptab := 'IDF_OI'
   else
    ptab := 'IDF_'+pTipoFilho;  }
   pTab := zTab(pTipoFilho);
   result := true;
   sql.clear;
   sql.add('DELETE FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' FILHO_TIPO = '+''''+pTipoFilho+'''');
   sql.add(' AND FILHO_ID NOT IN (SELECT X.IDF_CODIGO FROM '+''+PTab+''+' X ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = ' +''+inttostr(pProj)+''+' AND ');
   sql.add(' FILHO_ID = X.IDF_CODIGO)');
   execsql;
  If RowsAffected > 0 then
     result := true;
end;

function TDados_tab.Apaga_CorrPaiSolto(pCli, pProj: integer;
  pTipoPai: string): boolean;
var
ptab : string;
begin
  close;
  { If pTipopai = 'OC' then
    ptab := 'IDF_OI'
   else
    ptab := 'IDF_'+pTipoPai; }
   pTab := zTab(pTipoPai);
   result := true;
   sql.clear;
   sql.add('DELETE FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+'''');
   sql.add(' AND PAI_ID NOT IN (SELECT X.IDF_CODIGO FROM '+''+PTab+''+' X ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = ' +''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_ID = X.IDF_CODIGO)');

   execsql;
  If RowsAffected > 0 then
     result := true;
end;

function TDiag_dados.Lock_diag(pEmp,pCenario,pIdg : integer): boolean;
begin
     result := false;
     close;
     sql.clear;
     sql.add('UPDATE SUB_SUBORDINACAO ');
     sql.add('SET GRID_COR = 1'+',');
     sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
     sql.add('DATATU = '+''+floattostr(date)+'');
     sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
     sql.add(' AND PRJ_ID = '+''+inttostr(pCenario)+'');
     sql.add(' AND IDG_ID = '+''+inttostr(pIdg)+'');
     sql.add(' AND (GRID_COR <> 1 OR GRID_COR IS NULL '+')');

     execsql;
     If rowsaffected > 0 then
        result := true;

end;

function TDiag_Dados.UnLock_diag (pEmp,pCenario,pIdg : integer): boolean;
begin
     result := false;
     close;
     sql.clear;
     sql.add('UPDATE SUB_SUBORDINACAO ');
     sql.add('SET GRID_COR = 0'+',');
     sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
     sql.add('DATATU = '+''+floattostr(date)+'');
     sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
     sql.add(' AND PRJ_ID = '+''+inttostr(pcenario)+'');
     sql.add(' AND IDG_ID = '+''+inttostr(pIdg)+'');
     execsql;
     If rowsaffected > 0 then
        result := true;
end;

function TDiag_Dados.Get_PrimeiroAncestral(pCli,pProj,pDiag : integer; pTipoDiag : string): integer;
var
wdg ,wpai: integer;
begin
     result := -1;
     close;
     sql.clear;
     sql.add('SELECT * FROM SUB_SUBORDINACAO');
     sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
     sql.add(' AND PRJ_ID = '+''+inttostr(pProj)+'');
     sql.add(' AND IDG_ID = '+''+inttostr(pDiag)+'');
     sql.add(' AND IDG_DIR = '+''''+pTipoDiag+'''');
     open;

     If not eof then
       Begin
        wdg:= fieldbyname('IDG_ID').asinteger;
        If fieldbyname('DIAG_PAI_ID').asinteger = 0 then
           exit
        else
         Begin
          wpai := fieldbyname('DIAG_PAI_ID').asinteger ;
          prim := wdg;
          with TDiag_dados.create(self) do
            Get_PrimeiroAncestral(pCli,pProj,wpai,pTipoDiag) ;
         end;

       end;
    PrimAncestor := prim;
end;

                {retorna o digrama da atividade}
function TDiag_Dados.Get_DiagAtiv(pCli,pProj : integer; ptipoDiag : string;pList : TList) : TList;
type
  PCod = ^ACod;
  ACod = record
    CD: Integer;
  end;

var
  wlst,wdg : TList;
  ARec: Pcod;

  i : integer;
begin
     wdg := TList.create;

     close;
     sql.clear;
     sql.add('select distinct(s.idg_id) from sub_subordinacao s') ;
     sql.add(' WHERE s.CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
     sql.add(' s.PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
     sql.add(' s.IDG_DIR = '+''''+pTipoDiag+''''+' AND ');
     sql.add('S.idg_id IN (select a.idg_id from idf_ap a where A.idf_codigo in ( ');
     for i := 0 to pList.Count - 1 do
     Begin
        aRec := pList[i];
        sql.add(inttostr(aRec^.CD)+',') ;
     end;
     sql[sql.Count-1] :=sql[sql.Count-1]+ '-1))';
   //  sql.SaveToFile('c:\sql.txt');
     open;
     while not eof do
      Begin
        new(arec);
        aRec^.cd := fieldbyname('IDG_ID').asinteger;
        wdg.Add(arec);
        next;
      end;
      result := wdg;
end ;

                {retorna o digrama da atividade}
function TDiag_Dados.Get_DiagramasAtiv(pCli,pProj : integer; ptipoDiag : string;pAtiv : integer) : TList;
type
  PCod = ^ACod;
  ACod = record
    CD: Integer;
  end;

var
  wlst,wdg : TList;
  ARec: Pcod;

  i : integer;
begin
     wdg := nil;

     close;
     sql.clear;
     sql.add('select distinct(s.idg_id) from sub_subordinacao s') ;
     sql.add(' WHERE s.CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
     sql.add(' s.PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
     sql.add(' s.IDG_DIR = '+''''+pTipoDiag+''''+' AND ');
     sql.add(' s.IDG_ID = '+''+inttostr(pAtiv)+'');

    { sql.add('S.idg_id IN (select a.idg_id from idf_ap a where A.idf_codigo in ( ');
     for i := 0 to pList.Count - 1 do
     Begin
        aRec := pList[i];
        sql.add(inttostr(aRec^.CD)+',') ;
     end;
     sql[sql.Count-1] :=sql[sql.Count-1]+ '-1)';
     sql.add(' AND A.CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
     sql.add(' A.PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' ) ');  }


     //sql.SaveToFile('c:\sql.txt');
     open;
     If not eof then
      begin
         wdg := TList.create;
         while not eof do
          Begin
            new(arec);
            aRec^.cd := fieldbyname('IDG_ID').asinteger;
            wdg.Add(arec);
            next;
          end;

      end;
    
      result := wdg;
end ;


function TDados_tab.Apaga_Todascorrelacoes(pCli, pProj: integer;
  pTipoPai: string; pCodigoPai: integer): boolean;
begin
   close;
   result := true;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add(' PAI_ID = '+''+inttostr(pCodigoPai)+'');
  execsql;
  If RowsAffected > 0 then
     result := true;
end;

function TDados_tab.Apaga_TodascorrelacoesObj(pCli, pProj: integer;
  pTipoPai: string): boolean;
begin
   close;
   wtab := ztab(pTipoPai);
   result := true;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS  ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add(' PAI_ID NOT IN(SELECT I.IDF_CODIGO FROM '+''+WTAB+'');
   sql.add(' I WHERE CLI_ID = I.CLI_ID AND PRJ_ID = I.PRJ_ID )');
   execsql;
   If RowsAffected > 0 then
     result := true;
end;

function Tdados_Tab.Apaga_correlacao( pCli : integer;            //Apaga uma correlaçào específica
                                      pProj : integer;
                                      pTipoPai : string;
                                      pCodigoPai : integer;
                                      pTipoFilho : string;
                                      pCodigoFilho : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
   sql.add(' PAI_TIPO = '+''''+pTipoPai+''''+' AND ');
   sql.add(' PAI_ID = '+''+inttostr(pCodigoPai)+''+' AND ');
   sql.add(' FILHO_TIPO = '+''''+pTipoFilho+''''+' AND ');
   sql.add(' FILHO_ID = '+''+inttostr(pCodigoFilho)+'');
  execsql;
  If RowsAffected > 0 then
     result := true;

end;

function Tdados_Tab.Apaga_ProjCorrelacoes( pCli : integer;      // Apaga todas as correlaçoes do projeto
                                   pProj : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('DELETE  FROM COR_OBJETOS ' );
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(pProj)+'');
   //frm_treeativ.memo1.text := sql.text;
   execsql;
  If RowsAffected > 0 then
     result := true;

end;

function Tdados_Tab.AplicDadosDe( pCli : integer;      //Aplicação de dados
                                   pProj : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;


   sql.add('SELECT D.IDF_CODIGO,D.IDF_DESIGNACAO AS PDES,D.IDF_DESCRICAO AS PDESC ');
   sql.add(' FROM IDF_DE D ' );
   sql.add(' WHERE  D.CLI_ID = '+''+inttostr(pCli)+''+ ' AND ');
   sql.add(' D.PRJ_ID = '+''+inttostr(pProj)+'');
   sql.add(' ORDER BY 2 ' );



 //   frm_main.Memo2.Text := sql.text;
   open;
  If eof then
      result := false;

end;

function Tdados_Tab.AplicDadosIf( pCli : integer;      //Aplicação de dados  IF
                                   pProj : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
 
   sql.add('SELECT * FROM IDF_DADOS R  ');
   sql.add(' WHERE R.IDF_CODIGO = :IDF_CODIGO ');
   sql.add(' AND CLI_ID = '+''+INTTOSTR(Pcli)+'');
   sql.add(' AND PRJ_ID = '+''+INTTOSTR(PPROJ)+'');

   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;



   open;
  If eof then
      result := false;

end;

function Tdados_Tab.AplicDadosDg( pCli : integer;      //Aplicação de dados  IF
                                   pProj : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
   
   sql.add('SELECT * FROM IDF_DG R  ');
   sql.add(' WHERE R.IDF_CODIGO IN(SELECT O.PAI_ID FROM COR_OBJETOS O  ');
   sql.add(' WHERE O.CLI_ID= '+''+INTTOSTR(pCLI)+'');
   sql.add(' AND O.PRJ_ID = '+''+INTTOSTR(pPROJ)+''+'  AND ');
   sql.add(' O.PAI_TIPO = '+''''+ 'DG'+''''+' AND O.FILHO_ID = :IDF_CODIGO )');
   sql.add(' AND R.CLI_ID = '+''+INTTOSTR(pCLI)+'');
   sql.add(' AND R.PRJ_ID = '+''+INTTOSTR(pPROJ)+'');
  // sql.SaveToFile('c:\sql.txt');
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;
   open;
  If eof then
      result := false;

end;

function Tdados_Tab.AplicDadosRb( pCli : integer;      //Aplicação de dados  IF
                                   pProj : integer) : boolean;
begin

   close;
   result := true;
   sql.clear;
   sql.add('SELECT * FROM IDF_RN R  ');
   sql.add(' WHERE R.IDF_CODIGO IN(SELECT O.PAI_ID FROM COR_OBJETOS O  ');
   sql.add(' WHERE O.CLI_ID= '+''+INTTOSTR(pCLI)+'');
   sql.add(' AND O.PRJ_ID = '+''+INTTOSTR(pPROJ)+''+'  AND ');
   sql.add(' O.PAI_TIPO = '+''''+ 'RN'+''''+' AND O.FILHO_ID = :IDF_CODIGO )');
   sql.add(' AND R.CLI_ID = '+''+INTTOSTR(pCLI)+'');
   sql.add(' AND R.PRJ_ID = '+''+INTTOSTR(pPROJ)+'');
  // sql.SaveToFile('c:\sql.txt');
 //  showmessage(sql.Text);
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;
   open;;
   If eof then
      result := false;

end;

function Tdados_tab.Mostra_lista : string;
                       {pCli : Cliente corrente
                        pCenario : Cenario Corrente
                        pDim     : Tabela a pesquisar
                        pTit     : Cabeçalho a mostrar na Lista
                        pTag     : opção de menu usado
                        pEdit    : True : habilita o botão edit
                                   False: Habilita o botão escolher.
                        pTree    : Lista TTreeView on'de deverá ser incluida
                                   a escolha feita.
                        pId      : Código do Objeto corrente}
var
iTipo,iTipoAtiv  : string;
Lista : Tfrm_lista;
wtipo : integer;
 begin
      result := '';  
      listaCodigo:= 0;
      ListaDesc  := '';
      ListaWbs  := '';
      iTipo := '';
      If ListaTag = 5 then  // OI
         iTipo := 'OI'
      else
      If ListaTag = 16 then  // OC
         iTipo := 'OC'
      else
      If ListaTag = 999 then // usecase
       iTipoAtiv := 'UC';

      try
       lista  := TFrm_lista.create(self);
       lista.itabPesq := self;
       with lista do
       begin
         If ListaPesq = '' then
           Begin
            pan1.visible := true;
            pan2.visible := false;
           end
          else
           Begin
            pan1.visible := false;
            pan2.visible := true;
           end ;
         tag           := ListaTag;
         Caption       := ListaTit;
         Cliente       := ListaCli;
         Cenario       := ListaProj;
         Id            := ListaId;
         Tree          := ListaTree;
         AutoFecha     := ListaFecha;
         If ListaEdit then
           begin
             sp_detalhe.Enabled := true;
             sp_confirm.Enabled := false;
           end
         else
           begin
             sp_detalhe.Enabled := false;
             sp_confirm.Enabled := true;
           end;
       { se a Lista a mostrar é de elementos de dados (IDF_DE, inclui também os atributos de IDF_DADOS}
        If ListaDim = 'IDF_DADOS' then
            OpenAllDistinct(ListaCli ,ListaProj)
        else
           OpenAll(ListaCli ,ListaProj,ListaDim,iTipo,iTipoAtiv,Operacao);

        Cria_lista(Lb_lista,false,true);

         { se a Lista a mostrar é de elementos de dados (IDF_DE, inclui também os atributos de IDF_DADOS}
       { If ListaDim = 'IDF_DE' then
         Begin
            with Tdad.create(self) do
               Begin
                  CLI_ID := ListaCli;
                  PRJ_ID := ListaProj;
                  Get_dados('');
                  Cria_lista(Lb_lista,false,false);
               end;
         end; }


        lb_Lista.SortType := sttext;
        lb_lista.AlphaSort(true);
        edit2.text := inttostr(lb_lista.Items.Count);
        showModal;
        
        If lb_Lista.selected <> nil then
           begin
             ListaCodigo := strtoint(uObj(lb_Lista.selected.data)^.Fcodigo);
             ListaDesc   := lb_lista.selected.text;
             ListaWbs    := uObj(lb_Lista.selected.data)^.fWbs;
             If ListaDim = 'IDF_DADOS' then
             Begin
                with Tdad.create(self) do
                Begin
                  Get_objeto(LiStaCli,ListaProj,strtoint(uObj(lb_Lista.selected.data)^.Fcodigo));
                  ListaWbs    := IDF_TABELA;;
                 free;
                end;
             end;
           end;

       end;
      finally

      end;
end;

function Tdados_tab.Mostra_listaMult : TList;
                       {pCli : Cliente corrente
                        pCenario : Cenario Corrente
                        pDim     : Tabela a pesquisar
                        pTit     : Cabeçalho a mostrar na Lista
                        pTag     : opção de menu usado
                        pEdit    : True : habilita o botão edit
                                   False: Habilita o botão escolher.
                        pTree    : Lista TTreeView on'de deverá ser incluida
                                   a escolha feita.
                        pId      : Código do Objeto corrente}
var
iTipo,iTipoAtiv  : string;
Lista : Tfrm_lista;
wtipo,i : integer;
wlist: TList;
mLista : uListaMult;
 begin
      wList := TList.create;
      result := wlist;
      listaCodigo:= 0;
      ListaDesc  := '';
      ListaWbs  := '';
      iTipo := '';
      If ListaTag = 5 then  // OI
         iTipo := 'OI'
      else
      If ListaTag = 16 then  // OC
         iTipo := 'OC'
      else
      If ListaTag = 999 then // usecase
       iTipoAtiv := 'UC';

      try

       lista  := TFrm_lista .create(self);
       lista.itabPesq := self;
       with lista do
       begin

         If ListaPesq = '' then
           Begin
            pan1.visible := true;
            pan2.visible := false;
           end
          else
           Begin
            pan1.visible := false;
            pan2.visible := true;
           end ;
         tag           := ListaTag;
         Caption       := ListaTit;
         Cliente       := ListaCli;
         Cenario       := ListaProj;
         Id            := ListaId;
         Tree          := ListaTree;
         AutoFecha     := ListaFecha;
         If ListaEdit then
           begin
             sp_detalhe.Enabled := true;
             sp_confirm.Enabled := false;
           end
         else
           begin
             sp_detalhe.Enabled := false;
             sp_confirm.Enabled := true;
           end;
       { se a Lista a mostrar é de elementos de dados (IDF_DE, inclui também os atributos de IDF_DADOS}
        If ListaDim = 'IDF_DADOS' then
            OpenAllDistinct(ListaCli ,ListaProj)
        else
           OpenAll(ListaCli ,ListaProj,ListaDim,iTipo,iTipoAtiv,Operacao);
        lb_lista.MultiSelect := true;
        Cria_lista(Lb_lista,false,true);


        lb_Lista.SortType := sttext;
        lb_lista.AlphaSort(true);
        edit2.text := inttostr(lb_lista.Items.Count);
        showModal;
        for i := 0 to lb_lista.Items.Count - 1 do
          begin
           If lb_lista.Items[i].Selected then
            begin
               new(mLista);
               mLista^.cod := strtoint(uObj(lb_lista.Items[i].data)^.Fcodigo);
               mLista^.des := lb_lista.Items[i].text;
               mLista^.WBS := uObj(lb_lista.Items[i].data)^.fWbs;
               If ListaDim = 'IDF_DADOS' then
               Begin
                  with Tdad.create(self) do
                  Begin
                    Get_objeto(LiStaCli,ListaProj,strtoint(uObj(lb_lista.Items[i].data)^.Fcodigo));
                     mLista^.WBS := IDF_TABELA;;
                   free;
                  end;
               end;
               wlist.Add(mLista);
            end;

          end;

       end;
      finally
        result := wlist;
      end;
end;



function TDados_tab.Abre_aderencia(pCli, pProj, pId, pTi: integer): boolean;
begin
   close;
   sql.clear;
   sql.add('SELECT * FROM TI_ADERENCIA  ');
   sql.add('WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
   sql.add('            PRJ_ID = '+''+Inttostr(pProj)+''+' AND ');
   sql.add('            IDF_CODIGO = '+''+Inttostr(pId)+''+' AND ');
   sql.add('            TI_CODIGO = '+''+Inttostr(pTi)+'');
   open;
end;

function TDados_tab.BuscaUltimoRegistro(pTab : string) : integer;
Begin
  close;
  sql.clear;
  sql.Add('Select Max(IDF_CODIGO) AS CODIGO FROM ' + pTab +'');
  open;
  result := FieldbyName('CODIGO').AsInteger;
End;

function TDados_tab.Open_Objeto(pCli,pProj,pId : integer;pTab : string) : boolean;
var
s : string;
 begin

    close    ;
    sql.clear;
    sql.add('SELECT * FROM '+''+ptab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
    If(ptab = 'IDF_DE') or (ptab = 'IDF_DATA') or (ptab = 'IDF_IF')then
     sql.add('ORDER BY CLI_ID,PRJ_ID,SUB_NIVEL');
    open;
    If not eof then
       begin
          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';
          result     := true;
          CLI_ID     := pCli;
          PRJ_ID     := pProj;
          IDF_CODIGO := pId;

       end;

 end;

 function TDados_tab.Open_Objetos(pCli,pProj : integer;pTab : string) : boolean;
var
s : string;
 begin

    close    ;
    sql.clear;
    sql.add('SELECT * FROM '+''+ptab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    open;
    If not eof then
       result := true;

 end;

function TDados_tab.Open_ObjetosByDesc(pCli,pProj : integer;pTab : string) : boolean;
var
s : string;
 begin

    close    ;
    sql.clear;
    sql.add('SELECT * FROM '+''+ptab+'');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' ORDER BY IDF_DESIGNACAO');
    open;
    If not eof then
       result := true;

 end;

 function TDados_tab.GetTab(pCli,pProj : integer;pDESC : string) : boolean;
var
s : string;
 begin

    close    ;
    sql.clear;
    sql.add('SELECT * FROM IDF_DADOS');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+'');
    sql.add(' AND IDF_DESIGNACAO =  '+''''+pDesc+'''');

    open;
    If not eof then
       result := true;

 end;


function TDados_tab.MarcadelInvisivel ( pTipo : string): boolean;
var
mtipo : string;
i : integer;
begin
       begin
          close;
          wtab := ztab(pTipo);
          sql.clear;
          sql.add(' UPDATE '+''+wtab+''+'');
          sql.add(' SET IDF_DEL = '+''''+'S' +'''');
          sql.add(' WHERE CLI_ID = '+''+INTTOSTR(CLI_ID)+''+' AND ');
          sql.add(' PRJ_ID = '+''+INTTOSTR(PRJ_ID)+''+' AND ');
          sql.add(' IDF_TIPO_ATIVIDADE IN '+''+wtipo+''+' AND ');
          sql.add(' (IDF_CODIGO NOT IN (SELECT  O.FILHO_ID FROM COR_OBJETOS O WHERE O.CLI_ID = '+''+inttostr(CLI_ID)+'');
          sql.add(' AND O.PRJ_ID = '+''+INTTOSTR(PRJ_ID)+'');
          sql.add(' AND O.FILHO_ID = IDF_CODIGO AND O.FILHO_TIPO IN '+''+wTipo+''+' )');
          sql.add(' AND IDF_CODIGO NOT IN (SELECT CODIGO  FROM IDF_LIMPA ');
          sql.add(' WHERE TIPO IN  '+''+ wTipo+''+') )');
          execsql;

          If (Ptipo = 'PS') OR
             (PTIPO = 'LF') OR
             (PTIPO = 'DE') OR
             (PTIPO = 'EV') OR
             (PTIPO = 'CA') OR
             (PTIPO = 'UO') OR
             (PTIPO = 'SE')     then   // so podem ser filhos  (eXceto CA)
            exit;
          sql.clear;
          sql.add(' UPDATE '+''+wtab+''+'');
          sql.add(' SET IDF_DEL = '+''''+'S' +'''');
          sql.add(' WHERE CLI_ID = '+''+INTTOSTR(CLI_ID)+''+' AND ');
          sql.add(' PRJ_ID = '+''+INTTOSTR(PRJ_ID)+''+' AND ');
          sql.add(' IDF_TIPO_ATIVIDADE IN '+''+wtipo+''+' AND ');
          sql.add(' (IDF_CODIGO NOT IN (SELECT  O.PAI_ID FROM COR_OBJETOS O WHERE O.CLI_ID = '+''+inttostr(CLI_ID)+'');
          sql.add(' AND O.PRJ_ID = '+''+INTTOSTR(PRJ_ID)+'');
          sql.add(' AND O.PAI_ID = IDF_CODIGO AND O.PAI_TIPO IN '+''+wTipo+''+' ) ') ;
          sql.add(' AND IDF_CODIGO NOT IN (SELECT CODIGO  FROM IDF_LIMPA ');
          sql.add(' WHERE TIPO IN  '+''+ wTipo+''+') )');
        //  sql.SaveToFile('c:\sql.txt');
          execsql;
       end;
       { sql.add(' AND IDF_CODIGO NOT IN (SELECT CODIGO  FROM IDF_LIMPA ');
        sql.add(' WHERE TIPO IN  '+''+ wTipo+''+')'); }


end;

function TDados_tab.Atualiza_procedural (pcli,pcenario,pId : integer): boolean;
var                       // atualiza o campo  DF_ATIVIDADE_SUMARIA quando decompoe no gráfico
mtipo : string;
i : integer;
begin
   begin
      close;
      sql.clear;
      sql.add(' UPDATE IDF_AP');
      sql.add(' SET IDF_ATIVIDADE_SUMARIA = '+''''+'N' +''''+',');
      sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
      sql.add('DATATU = '+''+floattostr(date)+'');
      sql.add(' WHERE CLI_ID = '+''+INTTOSTR(pCli)+''+' AND ');
      sql.add(' PRJ_ID = '+''+INTTOSTR(pCenario)+''+' AND ');
      sql.add(' IDF_CODIGO = '+''+INTTOSTR(pID)+'');
      execsql;
   end;
end;


function TDados_tab.Apaga_Objeto(pCli,pProj,pId : integer;pTab : string) : boolean;
var
pTipoPai : string;

begin
   try
    begin
        ptipopai := rightstr(ptab,2);
       // bdx.BeginTrans;
        result := false;
        close    ;
        sql.clear;
        sql.add('DELETE  FROM '+''+ptab+'');
        sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
        sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
        sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
        execsql;
        If RowsAffected > 0 then
           begin
             result     := true;
             Apaga_todasCorrelacoes(pCli,pProj,pTipoPai,pId);
            // bdx.CommitTrans
           end;
           
    end;
   except
    begin
    //  bdx.RollbackTrans;
      raise;
    end;
   end;

end;


function Tdados_tab.get_maxKey(ptab : string) : integer; // pega o último número
                   //usado para diagramas
 Var
 key0,key1,key2,key3,key4,key5 : integer;
 begin
   key0 := 0;
   key1 := 0;
   key2 := 0;
   key3 := 0;
   key4 := 0;
   key5 := 0;
   { para as 4 tabelas abaixo, as chaves nào podem ser repetidas para nào gerar mesmo diagrama}
   If (Uppercase(pTab) = 'IDF_AP') or (Uppercase(pTab) = 'IDF_OI')
       or (Uppercase(pTab) = 'IDF_IF')  or (Uppercase(pTab) = 'IDF_CA') then
    begin
       close;
       sql.clear;
       sql.add('SELECT IDG_ID FROM SUB_SUBORDINACAO ');
       sql.add(' WHERE IDG_ID = (SELECT MAX(IDG_ID) FROM SUB_SUBORDINACAO ');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key1 := fieldbyname('IDG_ID').asinteger;

       close;
       sql.clear;
       sql.add('SELECT IDF_CODIGO FROM IDF_AP');
       sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_AP');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key2 := fieldbyname('IDF_CODIGO').asinteger;

       close;
       sql.clear;
       sql.add('SELECT IDF_CODIGO FROM IDF_OI');
       sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_OI');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key3 := fieldbyname('IDF_CODIGO').asinteger;

       close;
       sql.clear;
       sql.add('SELECT IDF_CODIGO FROM IDF_IF');
       sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_IF');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key4 := fieldbyname('IDF_CODIGO').asinteger;

       close;
       sql.clear;
       sql.add('SELECT IDF_CODIGO FROM IDF_CA');
       sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_CA');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key5 := fieldbyname('IDF_CODIGO').asinteger;

       key0 := max(key1,key2);
       key0 := max(key0,key3);
       key0 := max(key0,key4);
       key0 := max(key0,key5);
    end
   else
    Begin
       close;
       sql.clear;
       sql.add('SELECT IDF_CODIGO FROM '+''+ptab+'');
       sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM '+''+PTAB+'');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
       open;
       key0 := fieldbyname('IDF_CODIGO').asinteger;
    end;
   result := key0;
 end;

function Tdados_tab.Resetar: boolean;
var
  i : integer;

begin
   for i := 1 to length(wObj) do
   begin

       close;
       result := false;
       sql.clear;
       {If WObj[i] = 'OC' THEN
        Wtab := 'IDF_OI'
       else
        Wtab := 'IDF_'+WObj[i];  }
       wtab := ztab(WObj[i]);
       sql.add('UPDATE '+''+Wtab+'');
       sql.add(' SET IDF_DEL = '+''''+''+'''');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+''+' AND PRJ_ID = '+''+INTTOSTR(PRJ_ID)+'');
       execsql;
   end;


   If RowsAfFected > 0 then
     result := true;
end;

function TDados_tab.Get_layOut(pCli, pProj, poi: integer): boolean;
begin
  close;
  result := false;
  sql.clear;
  sql.add('SELECT * FROM TI_LAY ');
  sql.add('WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
  sql.add('             PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
  sql.add('             LAY_OI = '+''+inttostr(poi)+'');
  open;
  If not eof then
     result := true;
end;

function TDados_tab.Get_OI(pCli, pProj: integer): boolean;
begin
  close;
  result := false;
  sql.clear;
  sql.add('SELECT * FROM IDF_OI ');
  sql.add('WHERE CLI_ID = '+''+inttostr(pCli)+''+' AND ');
  sql.add('             PRJ_ID = '+''+inttostr(pProj)+''+' AND ');
  sql.add('             IDG_ID = :IDF_CODIGO');
  open;
  If not eof then
     result := true;
end;

function TDados_tab.MarcaDel(pTipo : string): boolean;
var
i : integer;

begin
    If frm_log = nil then
     frm_log := Tfrm_log.create(self);
    frm_log.show;

     begin
        wtab := ztab(ptipo);
        If wtab = 'IDF_PS' then  // pessoa pode ser visivel ou invisivel - vide marcadelinvisivel
         exit;
        close;
        sql.clear;
        sql.add('UPDATE '+ ''+Wtab+'');
        sql.add(' SET IDF_DEL = '+''''+'S'+'''');
        sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+''+' AND PRJ_ID = '+''+INTTOSTR(PRJ_ID)+'');
        If (pTipo = 'OI') or (pTipo = 'OC') or (pTipo = 'CA') or (pTipo = 'EE') then
           sql.add(' AND IDF_TIPO_ATIVIDADE IN '+''+Wtipo+''+'');
        sql.add(' AND IDF_CODIGO NOT IN (SELECT CODIGO  FROM IDF_LIMPA ');
        sql.add(' WHERE TIPO IN  '+''+ wTipo+''+')');
       // frm_main.memo2.text := sql.text;
        execsql;
        frm_log.memo1.lines.add(wtab+' updated');
        frm_log.memo1.Repaint;
     end;
     frm_log.close;

end;

function TDados_tab.MarcaDelDe: boolean;
begin
  close;
  sql.clear;
  sql.add('UPDATE IDF_DE   ');
  sql.add(' SET IDF_DEL = '+''''+'S'+'''');
  sql.add(' WHERE IDF_CODIGO NOT IN  ');
  sql.add('(SELECT O.FILHO_ID FROM COR_OBJETOS O WHERE  ');
  sql.add('                 CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
  sql.add('                 PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
  sql.add('                O.FILHO_TIPO = '+''''+'DE'+''''+') AND');
  sql.add(' CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
  sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+'');

  execsql;
end;

function TDados_tab.Mostra_orfas(pTipo: string): boolean;

begin
       result := false;
       close;
       sql.clear;
       wtab := ztab(ptipo);
       sql.add('SELECT * FROM '+''+Wtab+'');
       sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
       sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+'');
       sql.add(' AND IDF_DEL = '+''''+'S'+'''');
       If (pTipo = 'OI') or (pTipo = 'OC') or (pTipo = 'CA') or (pTipo = 'EE') then
           sql.add(' AND IDF_TIPO_ATIVIDADE in '+''+Wtipo+'');
       sql.add('ORDER BY IDF_DESIGNACAO');   
       //frm_main.memo2.text := sql.text;
       open;
       If not eof then
        result := true;
end;

function TDados_tab.LimpaNull(pTipo : string): boolean;
begin
         close;
         wtab := ZTAB(pTipo);
         sql.clear;
         sql.add('DELETE FROM '+ Wtab+'');
         sql.add(' WHERE (IDF_DESIGNACAO IS NULL ');
         sql.add(' OR IDF_DESIGNACAO = '+''''+'       '+''''+') AND ');
         sql.add(' CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
         sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+'');
         If (pTipo = 'OI') or (pTipo = 'OC') or (pTipo = 'CA') or (pTipo = 'EE') then
           sql.add(' AND IDF_TIPO_ATIVIDADE IN '+''+wtipo+'');
         execsql;
end;


function TDados_tab.Limpa_todas(pTipo: string): boolean;
begin
      result := false;
      try
       begin
      //  bdx.BeginTrans;
        wTab := ztab(ptipo);
        If wTab = 'IDF_CS' then
         begin
          With Tidf_cs.create(self) do
           begin
             Del_Limpa(Currempresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID);
             free;
             exit;

           end;
           
         end;


        sql.clear;
        sql.add('DELETE FROM '+ ''+Wtab+'');
        sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
        sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+'');
        sql.add(' AND IDF_DEL = '+''''+'S'+'''');

        If (pTipo = 'OI') or (pTipo = 'OC') or (pTipo = 'CA') or (pTipo = 'EE') then
             sql.add(' AND IDF_TIPO_ATIVIDADE IN '+''+wtipo+'');
        execsql;
        If rowsaffected > 0  then
         result := true;

       If wtab = 'IDF_IF' then
         Begin
           sql.clear;
          sql.add('DELETE FROM IDF_DADOS ');
          sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
          sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+'');
          sql.add(' AND IDF_TABELA NOT IN (SELECT F.IDF_DESIGNACAO FROM IDF_IF F WHERE ');
          sql.add(' F.CLI_ID = '+''+inttostr(CLI_ID)+''+' AND ');
          sql.add(' F.PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
          //SQL.SaveToFile('C:\SQL.TXT');

          execsql;
         end;


        Apaga_TodascorrelacoesObj(CLI_ID,PRJ_ID,pTipo);

       

     //   bdx.CommitTrans ;
       end;
      except
       begin

       //  bdx.RollbackTrans;
         raise;
       end;
      end;


end;

function Tdados_tab.zTab (pTipo : string) : string;
 begin
   result := '';
   WTIPO := ''+'('+''''+ptipo+''''+')'+'';
   If  pTipo =  'OC'  then
    wtab := 'IDF_OI'
   else
   If  pTipo =  'EE'  then
    wtab := 'IDF_CA'
   else
    wTab := 'IDF_'+pTipo ;
   If wtab = 'IDF_CA'  then
    //wtipo := ''+'('+''''+'CA'+''''+','+''''+'EE'+''''+','+''''+'UO'+''''+''+')';
    wtipo := ''+'('+''''+'CA'+''''+','+''''+'UO'+''''+''+')';
   result := wtab;
 end;



procedure  TEmpresa.Open_All;
begin
  close;
  sql.clear;
  Self.active := false;
  sql.add('SELECT * FROM CLI_CLIENTE');
  open;
  Self.active := true;
  fCpoLista1 := 'CLI_ID';
  fCpoLista2 := 'CLI_NOME';

end;

function  TEmpresa.Count_All : integer;
begin
  close;
  result := 0;
  sql.clear;
  sql.add('SELECT count (*) as TOT_CLI FROM CLI_CLIENTE');
  open;
  //Self.active := true;
  fCpoLista1 := 'CLI_ID';
  fCpoLista2 := 'CLI_NOME';
  result := fieldbyname('TOT_CLI').asinteger;
end;

function TEmpresa.get_maxKey : integer;

 begin
   close;
   sql.clear;
   sql.add('SELECT CLI_ID FROM CLI_CLIENTE');
   sql.add(' WHERE CLI_ID = (SELECT MAX(CLI_ID) FROM CLI_CLIENTE )');
   open;
   result := fieldbyname('CLI_ID').asinteger;
 end;

function  TEmpresa.Open_Empresa(pEmpresa : integer) : boolean;
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM CLI_CLIENTE ');
   sql.add(' WHERE CLI_ID = '+''+INTTOSTR(pEmpresa)+'');
   open;
   CLI_ID              := fieldbyname('CLI_ID').asinteger;
   CLI_RAZ_O_SOCIAL    := fieldbyname('CLI_RAZ_O_SOCIAL').asstring;
   CLI_NOME            := fieldbyname('CLI_NOME').asstring;
   CLI_AREA_INTERESSE  := fieldbyname('CLI_AREA_INTERESSE').asstring;
   If not eof then
      begin
         result := true;
         Self.active := true;
         //cria_index(fclient,'CLI_ID',1);
   end;
end;

function  TEmpresa.Atualizar(pEmpresa :integer) : boolean;
begin
  close;
  Result := false;
  sql.clear;
  sql.add('UPDATE CLI_CLIENTE ');
  sql.add('SET CLI_RAZ_O_SOCIAL = '+''''+CLI_RAZ_O_SOCIAL+''''+',');
  sql.add('CLI_NOME = '+''''+CLI_NOME+''''+',');
  sql.add('CLI_AREA_INTERESSE  = '+''''+CLI_AREA_INTERESSE+''''+',');
  sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
  sql.add('DATATU = '+''+floattostr(date)+'');
  sql.add(' WHERE CLI_ID = '+''+inttostr(pempresa)+'');
  execsql;
  If rowsaffected > 0 then
     result := true;

end;

function  TEmpresa.Apagar(pempresa : integer) : boolean;
var
Wcenario : TCenario;
begin
   try
    begin
     If not bdx.InTransaction then
        bdx.BeginTrans;
     close;
     result := false;
     sql.clear;
     sql.add(' DELETE FROM CLI_CLIENTE ');
     sql.add(' WHERE CLI_ID = '+''+ inttostr(CLI_ID)+'');
     execsql;

    // DELETAR CENARIOS....
     Wcenario := Tcenario.create(self);
     cenarios.Open_Cenarios(CLI_ID);
     with cenarios do
      begin
       while not eof do
        begin
          Wcenario.CLI_ID := self.cli_id;
          Wcenario.PRJ_ID := cenarios.fieldbyname('PRJ_ID').asinteger;
          Wcenario.apagar;
          next;
        end;
      end;

     bdx.CommitTrans;
     freeandnil(Wcenario);
    end;
   except
    begin
    freeandnil(Wcenario);
    If bdx.InTransaction then
       bdx.RollbackTrans;
      raise;
    end;
   end;

 end;

function TEmpresa.Get_cenarios : Tcenario;

 begin
    If cenarioInst = nil then
       cenarioInst := Tcenario.create(self);

    result := CenarioInst;
 end;

Procedure TEmpresa.Get_cenario(pCenario : integer);
 begin
   If cenarioInst = nil then
      cenarioInst := Tcenario.create(self);
     cenarioInst.open_Cenario(CLI_ID,pCenario);
 end;

constructor TEmpresa.create;
begin
 Inherited create(screen.ActiveForm);
 Cenarios := Tcenario.create(screen.ActiveForm);
end;

constructor TCenario.create;
begin
 Inherited create(screen.ActiveForm);
 Tabelas := Tdados_tab.create(screen.ActiveForm);
 Diagramas := TDiag_dados.create(screen.ActiveForm);

end;

constructor TDiag_dados.create;
begin
         Inherited create(screen.ActiveForm);
 Objeto := Tdados_tab.create(application);

end;

function Tcenario.Atualizar : boolean;
 begin
     result := false;
     close;
     sql.clear;
     sql.add('UPDATE PRJ_PROJETO ');
     sql.add('SET PRJ_TITULO = '+''''+PRJ_TITULO+''''+',');
     sql.add('PRJ_OBJETIVO = '+''''+PRJ_OBJETIVO+''''+',');
     sql.add('PRJ_PREMISSAS = '+''''+PRJ_PREMISSAS+''''+',');
     sql.add('PRJ_CARATER_RELEVANTE = '+''''+PRJ_CARATER_RELEVANTE+''''+',');
     sql.add('PRJ_PATH = '+''''+PRJ_PATH+''''+',');
     sql.add('PRJ_PATROCINADOR = '+''''+PRJ_PATROCINADOR+''''+',');
     sql.add('PRJ_CAMINHO = '+''''+PRJ_CAMINHO+''''+',');
     sql.add('IDF_DIRETORIO = '+''''+IDF_DIRETORIO+''''+',');
     sql.add('PRJ_FATORES_RESTRITIVOS = '+''''+PRJ_FATORES_RESTRITIVOS+''''+',');
     sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
     sql.add('DATATU = '+''+floattostr(date)+'');
     sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
     sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+'');

     execsql;
     If rowsaffected > 0 then
        result := true;

 end;


 function TCenario.Get_Diagramas : TDiag_dados;

 begin
    If DiagInst = nil then
       DiagInst := TDiag_Dados.create(self);

    result := DiagInst;
 end;

 function Tcenario.get_maxKey : integer;

 begin
   close;
   sql.clear;
   sql.add('SELECT PRJ_ID FROM PRJ_PROJETO');
   sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
   sql.add(' AND PRJ_ID = (SELECT MAX(PRJ_ID) FROM PRJ_PROJETO WHERE CLI_ID = '+''+inttostr(CLI_ID)+'' +')');
   open;
   result := fieldbyname('PRJ_ID').asinteger;
 end;

function  Tcenario.Open_Cenario(pEmpresa,pCenario : integer ) : boolean; // open cenario específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM PRJ_PROJETO ');
   sql.add(' WHERE CLI_ID = '+''+INTTOSTR(pEmpresa)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(pcenario)+'');
   
   open;
   CLI_ID                   := fieldbyname('CLI_ID').asinteger;
   PRJ_ID                   := fieldbyname('PRJ_ID').asinteger;
   PRJ_TITULO               := fieldbyname('PRJ_TITULO').asstring;
   PRJ_OBJETIVO             := fieldbyname('PRJ_OBJETIVO').asstring;
   PRJ_PREMISSAS            := fieldbyname('PRJ_PREMISSAS').asstring;
   PRJ_CARATER_RELEVANTE    := fieldbyname('PRJ_CARATER_RELEVANTE').asstring;
   PRJ_FATORES_RESTRITIVOS  := fieldbyname('PRJ_FATORES_RESTRITIVOS').asstring;
   PRJ_PATH                 := fieldbyname('PRJ_PATH').asstring;
   PRJ_PATROCINADOR         := fieldbyname('PRJ_PATROCINADOR').asstring;
   PRJ_CAMINHO              := fieldbyname('PRJ_CAMINHO').asstring;
   IDF_DIRETORIO            := fieldbyname('IDF_DIRETORIO').asstring;
   If not eof then
      begin
         result := true;
         Self.active := true;
         //cria_index(fclient,'CLI_ID;PRJ_ID',1);
   end;
end;

function  Tcenario.Open_Cenarios(pEmp : integer) : boolean;  //pega cenários da empresas
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM PRJ_PROJETO ');
   sql.add(' WHERE CLI_ID = '+''+INTTOSTR(pEmp)+'');
   open;
   If not eof then
      begin
         result := true;
         Self.active := true;
      end;
  fCpoLista2 := 'PRJ_TITULO';
  fCpoLista1 := 'PRJ_ID';
 end;

procedure Tcenario.OpenAll;  //pega todos os cenários
 begin
   close;
   sql.clear;
   sql.add('SELECT * FROM PRJ_PROJETO ');
   open;
 end;

function Tcenario.Count_All : integer;  //pega todos os cenários
 begin
   close;
   result := 0;
   sql.clear;
   sql.add('SELECT COUNT(*) AS TOT_CEN FROM PRJ_PROJETO ');
   open;
   result := fieldbyname('TOT_CEN').asinteger;
 end;

 function  Tcenario.Apagar : boolean;
 var
  I : integer;
  WDiag : Tdiag_dados;
  wnome : string;
 begin
   try
    begin
   //  bdx.BeginTrans ;
     result := false;
     close;
     sql.clear;
     sql.add(' DELETE FROM PRJ_PROJETO ');
     sql.add(' WHERE CLI_ID = '+''+ inttostr(CLI_ID)+'');
     sql.add('AND PRJ_ID = '+''+inttostr(PRJ_ID)+'');
     execsql;

     // apagar tabelas IDF...............
     for i := 1 to length(woe) do   //`deleta tabelas de objetos
      begin
         tabelas.CLI_ID := CLI_ID;
         Tabelas.PRJ_ID := PRJ_ID;
         Tabelas.Apagar('IDF_'+woe[i]);
      end;
      { apaga tabela de objetos de negócio}
     with Tdad.create(self) do
      Begin
        Deldocenario(self.cli_id,self.PRJ_ID) ;
        free;
      end;
     tabelas.Apagar('TI_ADERENCIA');
     tabelas.Apagar('TI_LAY');
     tabelas.Apagar('TI_REQ');
     tabelas.Apagar('IDF_PRIVILEGIOS');
     Tabelas.Apaga_ProjCorrelacoes(SELF.CLI_ID,SELF.PRJ_ID);  // apaga correalções do projeto

     self.Diagramas.Open_Diagramas(SELF.CLI_ID,SELF.PRJ_ID);  // apaga os diagramas
     Wdiag := Tdiag_dados.create(self);
     with self.Diagramas do
      begin
       while not eof do
        begin
          Wdiag.Apagar(SELF.CLI_ID,SELF.PRJ_ID,fieldbyname('IDG_ID').asinteger,fieldbyname('DIAG_ID').asstring);
          wnome := bdx.DirFluxo+fieldbyname('DIAG_ID').asstring;
          If FileExists(wnome) then  // apaga diagrama ADD
           Begin
              If not DeleteFile(wnome) then
               showmessage(wnome);

           end;
            
          next;
        end;
      end;
    // bdx.CommitTrans;
     freeandnil(Wdiag);
    end;
   except
    begin
    freeandnil(Wdiag);
   // bdx.RollbackTrans;
      raise;
    end;
   end;

 end;

 procedure TTemp.del_temp;
 Begin
      close;
      sql.clear;
      sql.add('DELETE FROM CUSTO_TEMP ');
      execsql;

 end;

function TTemp.Inclui_temp(pCli,pcenario,pIdg : integer;pNOme : string;pCodigo : integer;pTipo : string;pDes , pObs : string) : boolean;
 var
 s : string;
 Begin
      s := bdx.ConnectionString;
      result := false;
      close;
      sql.clear;
      sql.add('INSERT INTO CUSTO_TEMP( ');
      sql.add('	CLI_ID,PRJ_ID,IDG_ID ,SUB_NOME ,IDF_CODIGO ,IDF_TIPO_ATIVIDADE,IDF_DESIGNACAO,OBS) ');

      sql.add(' VALUES (');
      sql.add(''+inttostr(pCLI)+''+',');
      sql.add(''+inttostr(pcenario)+''+',');
      sql.add(''+inttostr(pIdg)+''+',');
      sql.add(''''+pNome+''''+',');
      sql.add(''+inttostr(pCodigo)+''+',');
      sql.add(''''+pTipo+''''+',');
      sql.add(''''+pDes+''''+',');
      sql.add(''''+pObs+'''');
      sql.add(')');
       // sql.SaveToFile('C:\SQL.TXT');
      execsql;
      If rowsaffected >0 then
       result := true;


 end;

function  TTemp.get_all : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM CUSTO_TEMP ORDER BY IDG_ID ');

   open;

   If not eof then
      result := true;
end; 


 function  TDominios.Open_Dominio(pTipo,pLing : string) : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;

   sql.add('SELECT * FROM CMB_DIVERSOS ');
   sql.add(' WHERE DI_TIPO = '+''''+pTipo+'''');
   sql.add(' AND DI_LING = '+''''+pliNG+'''');
   open;
   DI_TIPO       := fieldbyname('DI_TIPO').asstring;
   DI_DESCRICAO  := fieldbyname('DI_DESCRICAO').asstring;
   If not eof then
      begin
         result := true;
         Self.active := true;
         //cria_index(fclient,'DI_TIPO',1);
   end;
   fCpoLista2 := 'DI_DESCRICAO';
   fCpoLista1 := 'DI_TIPO';
end;

function TDominios.Atualizar(pTipo,pLing: string;pDesc : Tmemo) : boolean;
 var
  i : integer;
 begin
     result := false;
      
     try
      begin
       // bdx.BeginTrans ;
        close;
        sql.clear;
        sql.add('DELETE FROM CMB_DIVERSOS WHERE DI_TIPO = '+''''+pTipo+'''');
        sql.add(' AND DI_LING = '+''''+pliNG+'''');
        execsql;
       for i := 0 to pDesc.Lines.Count - 1 do
        begin
           close;
           sql.clear;
           sql.add('INSERT INTO CMB_DIVERSOS ');
           sql.add(' (DI_TIPO,DI_DESCRICAO,USUARIO,DATATU,DI_LING)');
           sql.add('VALUES('+''''+ptipo+''''+',');
           sql.add(''''+pdesc.lines[i]+''''+',');
           sql.add(''''+oAcesso.NOME+''''+',');
           sql.add(''+floattostr(date)+''+',');
           sql.add(''''+pLING+''''+')');
           execsql;
        end;

       If rowsaffected > 0 then
          result := true;
      // bdx.CommitTrans;
      end;
     except
      begin
      //  bdx.RollbackTrans;
        raise;
      end;
     end;
 end;

function TDiag_dados.TotalDiag: integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM SUB_SUBORDINACAO ');
  sql.add(' WHERE CLI_ID = '+''+INTTOSTR(CLI_ID)+''+'  AND PRJ_ID = '+''+INTTOSTR(prj_id)+'');
  open;
  result := fieldbyname('TOT').asinteger;
end;

function TDiag_dados.TotalDiagg: integer;
begin
  result := 0;
  close;
  sql.CLEAR;
  sql.add('SELECT COUNT(*) AS TOT FROM SUB_SUBORDINACAO ');
  open;
  result := fieldbyname('TOT').asinteger;
end;



function TDiag_Dados.Get_desc(pCli,pProj,pId : integer): string;
begin
   result := '';
   close;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(pproj)+'');
   sql.add(' AND IDG_ID = '+''+inttostr(pId)+'');
   open;
   result  := fieldbyname('SUB_NOME').asstring;
end;

function TDiag_dados.get_maxKey : integer;

 begin
   close;
   sql.clear;
   sql.add('SELECT IDG_ID FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE IDG_ID = (SELECT MAX(IDG_ID) FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(CLI_ID)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(PRJ_ID)+''+')');
   open;
   result := fieldbyname('IDG_ID').asinteger;
 end;


function  TDiag_dados.Open_Diagramas0(pEmp,pcenario : integer) : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND DIAG_PAI_ID = 0');
   sql.add(' ORDER BY CLI_ID,PRJ_ID,IDG_NIVEL');
   open;

   If not eof then
      result := true;

   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := 'IDG_ID';
end;

function  TDiag_dados.Open_Operacoes(pEmp,pcenario : integer) : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_DIR = '+''''+'DPN'+'''');
   sql.add(' ORDER BY SUB_NOME');
   open;

   If not eof then
      result := true;

   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := 'IDG_ID';
end;

function  TDiag_dados.Open_Diagramas(pEmp,pcenario : integer) : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   open;

   If not eof then
      result := true;

   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := '';
end;

function  TDiag_dados.OpenAll : boolean; // open  específico
begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add('WHERE IDG_DIR = '+''''+'DPN'+''''+' AND ');
   sql.add(' DIAG_PAI_ID = 0');
   open;

   If not eof then
      result := true;

   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := 'IDG_ID';
end;


function TDiag_dados.Get_Diagrama(pEmp,pCenario,pDiag : integer) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_ID = '+''+InttoStr(pdiag)+'');
   open;
   If not eof then
      begin

       begin
         CLI_ID               := fieldbyname('CLI_ID').asinteger;
         PRJ_ID               := fieldbyname('PRJ_ID').asinteger;
         IDG_ID               := fieldbyname('IDG_ID').asinteger;
         SUB_ID               := fieldbyname('SUB_ID').asinteger;
         DIAG_PAI_ID          := fieldbyname('DIAG_PAI_ID').asinteger;
         SUB_NOME             := fieldbyname('SUB_NOME').asstring;
         DIAG_ID              := fieldbyname('DIAG_ID').asstring;
         IDG_DIR              := fieldbyname('IDG_DIR').asstring;
         IDG_NIVEL            := fieldbyname('IDG_NIVEL').asinteger;

        // idg_diag             := Self.fieldbyname('idg_diag');

         result := true;

       end;
   end;
   fCpoLista2 := 'SUB_NOME';
  fCpoLista1 := '';
 end;

function TDiag_dados.Get_DiagramadaClasse(pEmp,pCenario,pDiag : integer; pClasse : string) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_ID = '+''+InttoStr(pdiag)+'');
   sql.add(' AND IDG_DIR = '+''''+pClasse+'''');
   open;
   If not eof then
      begin

       begin
         CLI_ID               := fieldbyname('CLI_ID').asinteger;
         PRJ_ID               := fieldbyname('PRJ_ID').asinteger;
         IDG_ID               := fieldbyname('IDG_ID').asinteger;
         SUB_ID               := fieldbyname('SUB_ID').asinteger;
         DIAG_PAI_ID          := fieldbyname('DIAG_PAI_ID').asinteger;
         SUB_NOME             := fieldbyname('SUB_NOME').asstring;
         DIAG_ID              := fieldbyname('DIAG_ID').asstring;
         IDG_DIR              := fieldbyname('IDG_DIR').asstring;
         IDG_NIVEL            := fieldbyname('IDG_NIVEL').asinteger;

        // idg_diag             := Self.fieldbyname('idg_diag');

         result := true;

       end;
   end;
   fCpoLista2 := 'SUB_NOME';
  fCpoLista1 := '';
 end;

 function TDiag_dados.Get_DiagramasDPN(pEmp,pCenario : integer) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_DIR = '+''''+'DPN'+'''');
   open;
   If not eof then


       begin
         CLI_ID               := fieldbyname('CLI_ID').asinteger;
         PRJ_ID               := fieldbyname('PRJ_ID').asinteger;
         IDG_ID               := fieldbyname('IDG_ID').asinteger;
         SUB_ID               := fieldbyname('SUB_ID').asinteger;
         DIAG_PAI_ID          := fieldbyname('DIAG_PAI_ID').asinteger;
         SUB_NOME             := fieldbyname('SUB_NOME').asstring;
         DIAG_ID              := fieldbyname('DIAG_ID').asstring;
         IDG_DIR              := fieldbyname('IDG_DIR').asstring;
         IDG_NIVEL            := fieldbyname('IDG_NIVEL').asinteger;

        // idg_diag             := Self.fieldbyname('idg_diag');

         result := true;

       end;


 end  ;

 function TDiag_dados.Get_DiagramaDoPai(pEmp,pCenario,pDiag,pPai : integer) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_ID = '+''+InttoStr(pdiag)+'');
   sql.add(' AND DIAG_PAI_ID = '+''+inttostr(PPAI)+'');
   open;
   If not eof then
      begin

       begin
         CLI_ID               := fieldbyname('CLI_ID').asinteger;
         PRJ_ID               := fieldbyname('PRJ_ID').asinteger;
         IDG_ID               := fieldbyname('IDG_ID').asinteger;
         SUB_ID               := fieldbyname('SUB_ID').asinteger;
         DIAG_PAI_ID          := fieldbyname('DIAG_PAI_ID').asinteger;
         SUB_NOME             := fieldbyname('SUB_NOME').asstring;
         DIAG_ID              := fieldbyname('DIAG_ID').asstring;
         IDG_DIR              := fieldbyname('IDG_DIR').asstring;
         IDG_NIVEL            := fieldbyname('IDG_NIVEL').asinteger;

        // idg_diag             := Self.fieldbyname('idg_diag');

         result := true;

       end;
   end;
   fCpoLista2 := 'SUB_NOME';
  fCpoLista1 := '';
 end;

function TDiag_dados.Open_Diagrama(pEmp,pCenario,pDiag,pPai : integer) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pcenario)+'');
   sql.add(' AND IDG_ID = '+''+InttoStr(pdiag)+'');
   sql.add(' AND DIAG_PAI_ID = '+''+InttoStr(ppai)+'');
   open;
   If not eof then
      begin
       begin
         CLI_ID               := fieldbyname('CLI_ID').asinteger;
         PRJ_ID               := fieldbyname('PRJ_ID').asinteger;
         IDG_ID               := fieldbyname('IDG_ID').asinteger;
         SUB_ID               := fieldbyname('SUB_ID').asinteger;
         DIAG_PAI_ID          := fieldbyname('DIAG_PAI_ID').asinteger;
         SUB_NOME             := fieldbyname('SUB_NOME').asstring;
         DIAG_ID              := fieldbyname('DIAG_ID').asstring;
         IDG_DIR              := fieldbyname('IDG_DIR').asstring;
         IDG_NIVEL            := fieldbyname('IDG_NIVEL').asinteger;

         result := true;
       end;
   end;
   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := '';
 end;

function TDiag_dados.Open_todos(pTipo : string;pNivel0 : boolean) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE IDG_DIR = '+''''+pTipo+'''');
   If pNivel0 then
     sql.add(' AND DIAG_PAI_ID = 0');
   open;
   If not eof then
      result := true;

   fCpoLista2 := 'SUB_NOME';
   fCpoLista1 := '';
 end;

 function TDiag_dados.Open_todosCli(pEmp,pCenario : integer;pTipo : string;pNivel0 : boolean) : boolean;
 begin
   close;
   Result := false;
   sql.clear;
   sql.add('SELECT COUNT(*) AS TOT FROM SUB_SUBORDINACAO ');
   sql.add('WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add('AND PRJ_ID = '+''+inttostr(pCenario)+'');
   open;
   If not eof then
      TOTDIAGRAMAS := fieldbyname('TOT').asinteger;

   close;
   Result := false;
   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add('WHERE CLI_ID = '+''+inttostr(pEmp)+'');
   sql.add('AND PRJ_ID = '+''+inttostr(pCenario)+'');
   sql.add('AND IDG_DIR = '+''''+pTipo+'''');
   If pNivel0 then
     sql.add(' AND DIAG_PAI_ID = 0');
   open;
   If not eof then
      result := true;
 end;



function  TDiag_Dados.Get_Filhos(pCli,pProj,pDiag : integer;pClasse,pOrder : string) : boolean; // open  específico

begin
   close;
   Result := false;

   sql.clear;
   sql.add('SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pProj)+'');
   sql.add(' AND DIAG_PAI_ID ='+''+inttostr(pDiag)+'');
   If pClasse <> '' then
    Begin
      If pClasse = 'DPN' then
         sql.add(' AND (IDG_DIR = '+''''+pClasse+''''+' OR IDG_DIR = '+''''+'DUC'+''''+')')
      else
         sql.add(' AND IDG_DIR = '+''''+pClasse+'''');
    end;
   If pOrder <> '' then
      sql.add(' ORDER BY '+ pOrder)
   else
    sql.add(' ORDER BY CLI_ID,PRJ_ID,IDG_ID,IDG_DIR');
   open;
  // SQL.SaveToFile('C:\SQL.TXT');
   If not eof then
      result := true;

    fCpoLista2 := 'SUB_NOME';
    fCpoLista1 := '';
end;


function  TDiag_Dados.Apagar(pCli,pProj,pDiag : integer;pDiagId : string) : boolean; // open  específico

begin
  Result := false;

 // If FileExists(bdx.DirFluxo+pDiagid) then  // apaga diagrama ADD
    //  DeleteFile(bdx.DirFluxo+pDiagid);
   close;
   sql.clear;
   sql.add('DELETE FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pProj)+'');
   sql.add(' AND IDG_ID ='+''+inttostr(pDiag)+'');
   EXECSQL;

   If RowsAffected > 0  then
      result := true;
end;

function  TDiag_Dados.ApagardoPai(pCli,pProj,pDiag,ppai : integer;pDiagId : string) : boolean; // open  específico

begin
   Result := false;

   {If FileExists(bdx.DirFluxo+pDiagid) then  // apaga diagrama ADD
      DeleteFile(bdx.DirFluxo+pDiagid);}
   close;
   sql.clear;
   sql.add('DELETE  FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pProj)+'');
   sql.add(' AND IDG_ID ='+''+inttostr(pDiag)+'');
   sql.add(' AND DIAG_PAI_ID = '+''+inttostr(PPAI)+'');
   EXECSQL;

   If RowsAffected > 0  then
      result := true;
end;

function  TDiag_Dados.TemOutroPai(pCli,pProj,pDiag,ppai : integer) : boolean;
begin
   Result := false;
   close;
   sql.clear;
   sql.add(' SELECT * FROM SUB_SUBORDINACAO ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+InttoStr(pProj)+'');
   sql.add(' AND IDG_ID ='+''+inttostr(pDiag)+'');
   sql.add(' AND DIAG_PAI_ID <> '+''+inttostr(PPAI)+'');
   open;

   If not eof  then
      result := true;
end;


function  TDiag_dados.Atualizar : boolean;
begin
   close;
   Result := false;
   sql.clear;
   sql.add('UPDATE SUB_SUBORDINACAO ');
   sql.add('SET SUB_NOME = '+''''+SUB_NOME+''''+',');
   sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
   sql.add('DATATU = '+''+floattostr(date)+'');
   sql.add(' WHERE CLI_ID = '+ ''+inttostr(CLI_ID)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   sql.add(' IDG_ID = '+''+inttostr(IDG_ID)+'' );
   execsql;

   If rowsaffected > 0 then
     result := true;

end;

function  TDiag_dados.Atualizar_idnovo(pIdnovo : integer; PDiagid : string) : boolean;
begin
   close;
   Result := false;
   sql.clear;
   sql.add('UPDATE SUB_SUBORDINACAO ');
   sql.add('SET IDG_ID_NOVO = '+''+inttostr(pIdnovo)+''+',');
   sql.add('DIAG_ID_NOVO = '+''''+pDiagId+''''+',');
   sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
   sql.add('DATATU = '+''+floattostr(date)+'');
   sql.add(' WHERE CLI_ID = '+ ''+inttostr(CLI_ID)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   sql.add(' IDG_ID = '+''+inttostr(IDG_ID)+'' );
   execsql;

   If rowsaffected > 0 then
     result := true;

end;

function  TDiag_dados.Atu_Pai : boolean;
begin
   close;
   Result := false;
   sql.clear;
   sql.add('UPDATE SUB_SUBORDINACAO ');
   sql.add('SET DIAG_PAI_ID = '+''+inttostr(DIAG_PAI_ID)+''+',');
   sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
   sql.add('DATATU = '+''+floattostr(date)+'');
   sql.add(' WHERE CLI_ID = '+ ''+inttostr(CLI_ID)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   sql.add(' IDG_ID = '+''+inttostr(IDG_ID)+'' );
   execsql;

   If rowsaffected > 0 then
     result := true;

end;

function  TDiag_dados.Atu_PaiId : boolean;
begin
   close;
   Result := false;
   sql.clear;
   sql.add('UPDATE SUB_SUBORDINACAO ');
   sql.add('SET DIAG_PAI_ID = '+''+inttostr(DIAG_PAI_ID)+''+',');
   sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
   sql.add('DATATU = '+''+floattostr(date)+'');
   sql.add(' WHERE CLI_ID = '+ ''+inttostr(CLI_ID)+''+' AND ');
   sql.add(' PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   sql.add(' DIAG_PAI_ID = '+''+inttostr(IDG_ID)+'' );
   execsql;

   If rowsaffected > 0 then
     result := true;

end;

function TDiag_dados.Atua_DescDiag: boolean;
begin

end;

function  TDiag_dados.Atua_Diag : boolean;
begin
   close;
   Result := false;
  

   If rowsaffected > 0 then
     result := true;

end;


function  TAP.Atualizar : boolean;
begin

end;

function  TAP.AtivPr (pCli,pProj : integer; ptipo,pWbs : string;pFlag,pAtiv: integer) : boolean  ;
var
wwbs ,ruc,ruc1: string;                           //pCli  : cliente
begin                                    //pProj : PROJETO
   result := false;                      //pTipo : Tipo atividade
   begin
    close;                               // pFlag : classificação
    sql.clear;                           // pAtiv : seleçào atividade (AP e UC)
    sql.add('SELECT * FROM IDF_AP I ');
    sql.add(' WHERE CLI_ID = '+ ''+Inttostr(pCli)+'');
    sql.add(' AND PRJ_ID = '+ ''+Inttostr(pProj)+'');
    If pAtiv = 3 then
       sql.add(' AND (I.IDF_TIPO_ATIVIDADE =  '+''''+'AP'+''''+' OR IDF_TIPO_ATIVIDADE = '+''''+'UC'+''''+')'+' AND ')
    else
       sql.add(' AND I.IDF_TIPO_ATIVIDADE =  '+''''+'AP'+''''+' AND ');
    case pAtiv of

       0 : begin
                ruc     := 'AP';
                ruc1     := 'AP';
           end;
       1 : begin
                ruc     := 'UC';
                ruc1    := 'UC';
           end;
       2,3 : begin
              ruc     := 'AP';
              ruc1    := 'UC';
           end;


   end;
    sql.add('( I.IDF_TIPO_ATIV =  '+''''+RUC+''''+' OR  I.IDF_TIPO_ATIV = '+''''+RUC1+''''+')');
    If pAtiv  = 3 then
       sql.add(' AND IDF_ATIVIDADE_SUMARIA = '+''''+'S'+'''');
    sql.add(' AND IDF_DESIGNACAO <> '+''''+''+'''');


    If pFlag = 1 then
       begin
         If pWbs <> '' then
            begin
              WWbs := pwbs+bdx.WLike;
              sql.add(' AND IDF_WBS_CODE LIKE '+''''+WWbs+'''');
            end;
       end;
    If pFlag= 0 then
       sql.add(' ORDER BY I.CLI_ID,I.PRJ_ID,I.IDF_DESIGNACAO ')
    else
       sql.add(' ORDER BY I.CLI_ID,I.PRJ_ID,I.IDF_WBS_CODE ')
   end;
 // sql.SaveToFile('C:\SQL.TXT');
   open;
   If not eof then
      result := true;


end;

function TAP.Open_uc(pCli,pProj,pId : integer) : boolean;
var
s : string;
 begin
    result := false;
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_AP');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
    sql.add(' AND IDF_TIPO_ATIV = '+''''+'UC'+'''');
    open;
    If not eof then
       result := true;

 end;

function TDados_tab.Get_Lead: real;
begin
  // If (fieldbyname('') = '') or (dbedit17.text = '') or (dbedit3.text = '') then
 //  Raise exception.create(mens47);
  result :=  (Fieldbyname('IDF_DURATION_TPU').asfloat +
                Fieldbyname('IDF_TEMPO_INATIVO_TPI').asfloat ) * Fieldbyname('IDF_VOLUME_LOOPING').asfloat ;
end;

{function TAP.get_(pCli,pProj,pId : integer) : boolean;
var
s : string;
 begin
    result := false;
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_AP');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
    open;
    If not eof then
       begin
          //cria_index(Self,'IDF_DESIGNACAO',1);
          //Self.IndexName := cria_index(Self,'IDF_CODIGO',1);
         // Self.active := true;

          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';

          IDF_CODIGO                   := Self.fieldbyname('IDF_CODIGO').asinteger ;
          CLI_ID                       := Self.fieldbyname('CLI_ID').asinteger ;
          PRJ_ID                       := Self.fieldbyname('PRJ_ID').asinteger ;
          IDG_ID                       := Self.fieldbyname('IDG_ID').asinteger ;;
          IDF_OI                       := Self.fieldbyname('IDF_OI').asinteger ;
          IDF_TIPO_ATIVIDADE           := Self.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
          IDF_DESIGNACAO               := Self.fieldbyname('IDF_DESIGNACAO').asstring ;
          IDF_DESCRICAO                := Self.fieldbyname('IDF_DESCRICAO').AsString;
          IDF_DURATION_TPU             := Self.fieldbyname('IDF_DURATION_TPU').asfloat;
          IDF_OBJETIVO_UC              := Self.fieldbyname('IDF_OBJETIVO_UC').asstring ;
          IDF_RESPONSAVEL              := Self.fieldbyname('IDF_RESPONSAVEL').asstring ;
          IDF_TEMPO_INATIVO_TPI        := Self.fieldbyname('IDF_TEMPO_INATIVO_TPI').asfloat;;
          IDF_UNIDADE_TEMPO            := Self.fieldbyname('IDF_UNIDADE_TEMPO').asstring ;
          IDF_VALOR_AGREGADO           := Self.fieldbyname('IDF_VALOR_AGREGADO').asstring ;
          IDF_VOLUME                   := Self.fieldbyname('IDF_VOLUME').asstring ;
          IDF_VOLUME_PICO              := Self.fieldbyname('IDF_VOLUME_PICO').asstring ;
          IDF_VOLUME_LOOPING           := Self.fieldbyname('IDF_VOLUME_LOOPING').asfloat;
          IDF_VOLUME_PROC              := Self.fieldbyname('IDF_VOLUME_PROC').asfloat;
          IDF_V_PICO                   := Self.fieldbyname('IDF_V_PICO').asfloat;
          IDF_V_REGULAR                := Self.fieldbyname('IDF_V_REGULAR').asfloat;
          IDF_V_MINIMO                 := Self.fieldbyname('IDF_V_MINIMO').asfloat;
          IDF_WBS_CODE                 := Self.fieldbyname('IDF_WBS_CODE').asstring ;
          IDF_DEL                      := Self.fieldbyname('IDF_DEL').asstring ;
          IDF_VERSAO                   := Self.fieldbyname('IDF_VERSAO').asstring ;
          IDF_VERSAO_DATA              := Self.fieldbyname('IDF_VERSAO_DATA').asdatetime ;
          IDF_TIPO_ATIV                := Self.fieldbyname('IDF_TIPO_ATIV').asstring ;
          IDF_VISIBLE                  := Self.fieldbyname('IDF_VISIBLE').asstring ;
          IDF_ATOR1                    := Self.fieldbyname('IDF_ATOR1').asstring ;
          IDF_ATOR2                    := Self.fieldbyname('IDF_ATOR2').asstring ;
          SUB_ID                       := Self.fieldbyname('SUB_ID').asinteger ;
          IDF_VOLUME_REG               := Self.fieldbyname('IDF_VOLUME_REG').asfloat;
          result := true;
       end;

 end;}



function TAP.Open_ap(pCli,pProj,pId : integer) : boolean;
var
s : string;
 begin
    result := false;
    close;
    sql.clear;
    sql.add('SELECT * FROM IDF_AP');
    sql.add(' WHERE CLI_ID = '+''+INTTOSTR(PCLI)+''+' AND ');
    sql.add(' PRJ_ID = '+''+INTTOSTR(PPROJ)+''+' AND ');
    sql.add(' IDF_CODIGO = '+''+INTTOSTR(PID)+'');
    open;
    If not eof then
       begin
          //cria_index(Self,'IDF_DESIGNACAO',1);
          //Self.IndexName := cria_index(Self,'IDF_CODIGO',1);
         // Self.active := true;

          fCpoLista1 := 'IDF_CODIGO';
          fCpoLista2 := 'IDF_DESIGNACAO';

          IDF_CODIGO                   := Self.fieldbyname('IDF_CODIGO').asinteger ;
          CLI_ID                       := Self.fieldbyname('CLI_ID').asinteger ;
          PRJ_ID                       := Self.fieldbyname('PRJ_ID').asinteger ;
          IDG_ID                       := Self.fieldbyname('IDG_ID').asinteger ;;
          IDF_OI                       := Self.fieldbyname('IDF_OI').asinteger ;
          IDF_TIPO_ATIVIDADE           := Self.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
          IDF_DESIGNACAO               := Self.fieldbyname('IDF_DESIGNACAO').asstring ;
          IDF_DESCRICAO                := Self.fieldbyname('IDF_DESCRICAO').AsString;
          IDF_DURATION_TPU             := Self.fieldbyname('IDF_DURATION_TPU').asfloat;
          IDF_OBJETIVO_UC              := Self.fieldbyname('IDF_OBJETIVO_UC').asstring ;
          IDF_RESPONSAVEL              := Self.fieldbyname('IDF_RESPONSAVEL').asstring ;
          IDF_TEMPO_INATIVO_TPI        := Self.fieldbyname('IDF_TEMPO_INATIVO_TPI').asfloat;;
          IDF_UNIDADE_TEMPO            := Self.fieldbyname('IDF_UNIDADE_TEMPO').asstring ;
          IDF_VALOR_AGREGADO           := Self.fieldbyname('IDF_VALOR_AGREGADO').asstring ;
          IDF_VOLUME                   := Self.fieldbyname('IDF_VOLUME').asstring ;
          IDF_VOLUME_PICO              := Self.fieldbyname('IDF_VOLUME_PICO').asstring ;
          IDF_VOLUME_LOOPING           := Self.fieldbyname('IDF_VOLUME_LOOPING').asfloat;
          IDF_VOLUME_PROC              := Self.fieldbyname('IDF_VOLUME_PROC').asfloat;
          IDF_V_PICO                   := Self.fieldbyname('IDF_V_PICO').asfloat;
          IDF_V_REGULAR                := Self.fieldbyname('IDF_V_REGULAR').asfloat;
          IDF_V_MINIMO                 := Self.fieldbyname('IDF_V_MINIMO').asfloat;
          IDF_WBS_CODE                 := Self.fieldbyname('IDF_WBS_CODE').asstring ;
          IDF_DEL                      := Self.fieldbyname('IDF_DEL').asstring ;
          IDF_VERSAO                   := Self.fieldbyname('IDF_VERSAO').asstring ;
          IDF_VERSAO_DATA              := Self.fieldbyname('IDF_VERSAO_DATA').asdatetime ;
          IDF_TIPO_ATIV                := Self.fieldbyname('IDF_TIPO_ATIV').asstring ;
          IDF_VISIBLE                  := Self.fieldbyname('IDF_VISIBLE').asstring ;
          IDF_ATOR1                    := Self.fieldbyname('IDF_ATOR1').asstring ;
          IDF_ATOR2                    := Self.fieldbyname('IDF_ATOR2').asstring ;
          SUB_ID                       := Self.fieldbyname('SUB_ID').asinteger ;
          IDF_VOLUME_REG               := Self.fieldbyname('IDF_VOLUME_REG').asfloat;
          result := true;
       end;

 end;

function  TDiagClass.openall: boolean;
begin
   result := false;
   close;
   sql.clear;
   sql.add('SELECT * FROM IDG_CLASS') ;
   open;
   If not eof then
      result := true;
   fCpoLista2 := 'IDG_DESC';
    fCpoLista1 := 'IDG_ID';
end;


procedure TAP.SetIDF_DESCRICAO(const Value: string);
begin
  FIDF_DESCRICAO := Value;
end;



{ TCod }


procedure Tcenario.SetTabelas(const Value: TDados_tab);
begin
  FTabelas := Value;
end;

procedure TEmpresa.Setcenarios(const Value: TCenario);
begin
  Fcenarios := Value;
end;

procedure Tcenario.SetDiagramas(const Value: TDiag_dados);
begin
  FDiagramas := Value;
end;

procedure TDados_tab.SetTabelas(const Value: string);
begin
  FTabelas := Value;
end;

procedure TDiag_dados.SetObjeto(const Value: TDados_tab);
begin
  FObjeto := Value;
end;

procedure TDados_tab.SetCodigo_lista(const Value: integer);
begin
  FCodigo_lista := Value;
end;

procedure TDados_tab.SetListaDim(const Value: string);
begin
  FListaDim := Value;
end;

procedure TDados_tab.SetListaEdit(const Value: boolean);
begin
  FListaEdit := Value;
end;

procedure TDados_tab.SetListaId(const Value: integer);
begin
  FListaId := Value;
end;

procedure TDados_tab.SetListaTag(const Value: integer);
begin
  FListaTag := Value;
end;

procedure TDados_tab.SetListaTree(const Value: TTreeView);
begin
  FListaTree := Value;
end;

procedure TDados_tab.SetListaTit(const Value: string);
begin
  FListaTit := Value;
end;

procedure TDados_tab.SetListaCli(const Value: integer);
begin
  FListaCli := Value;
end;

procedure TDados_tab.SetListaProj(const Value: integer);
begin
  FListaProj := Value;
end;




procedure TDados_tab.SetListaFecha(const Value: Boolean);
begin
  FListaFecha := Value;
end;


procedure TDados_tab.SetListadesc(const Value: string);
begin
  FListadesc := Value;
end;

{ TReq }

procedure TReq.BefrPost(DataSet: TDataSet);
var
iReq : Treq;
wid : integer;
begin
 inherited;
 try
   iReq := Treq.create(self);
   wid := iReq.get_maxKey;
 finally
   freeandnil(ireq);
 end;

  fclient.fieldbyname('CLI_ID').Value := CLIENTE;
  fclient.fieldbyname('PRJ_ID').Value  := CENARIO;
  fclient.fieldbyname('IDF_CODIGO').Value     :=  Wid + 1;
  fclient.fieldbyname('TI_CODIGO').Value  := ID;
end;

constructor TReq.Create(Aowner: TComponent);
begin
 inherited;
 BeforePost := BefrPost;
end;

function TReq.get_maxKey: integer;
begin
 result := 0;
 close;

 sql.clear;
 sql.add('SELECT MAX(IDF_CODIGO) AS ID FROM TI_REQ');
 open;

 If not eof then
  result := fieldbyname('ID').asinteger;
end;

function TReq.Get_TI: boolean;
begin
   close;
   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV';
      DataSet     := self;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS';
    AfterPost        := AftPost;
    AfterDelete      := AftDelete;
    BeforePost       := BefrPost;
    AggregatesActive  := true;
   end;
   dataext.DataSet := fclient;

   If fclient.IndexDefs.IndexOf('TISEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('TISEQ','TI_SEQ',[]);
          Items[0].GroupingLevel := 0;

        end;
   end;

  fclient.IndexName := 'TISEQ';

   result := false;
   sql.clear;
   fclient.active := false;
   sql.add('SELECT * FROM TI_REQ ');
   sql.add(' WHERE CLI_ID = '+''+inttostr(CLIENTE)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(CENARIO)+'');
   sql.add(' AND TI_CODIGO = '+''+inttostr(ID)+'');

   open;
   fclient.active := true;

   If not fclient.eof then
    result := true;
end;

procedure TReq.Aftpost(dataset : Tdataset);  // link com master
begin
 fClient.ApplyUpdates(0);

end;

procedure TReq.AftDelete(dataset : Tdataset);
begin
 fClient.ApplyUpdates(0);

end;

function TReq.Get_TIGlob(pCli,pProj : integer): boolean;
begin
   close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM TI_REQ R');
   sql.add(' WHERE R.CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND R.PRJ_ID = '+''+inttostr(pProj)+'');
   sql.add(' AND R.TI_CODIGO = :IDF_CODIGO');
   parameters.Clear;
   parameters.AddParameter;
   parameters[0].Name     := 'IDF_CODIGO';
   parameters[0].Datatype := ftInteger;

   open;
   If not eof then
    result := true;
end;


function TReq.Inclui(pCli,pProj,pTiCodigo,pId:integer): boolean;
var
wid : integer;
begin
   with Treq.create(self) do
    begin
     wid := Get_Maxkey +1;
     free;
    end;
   close;
   result := false;
   sql.clear;
   sql.add('INSERT INTO TI_REQ (CLI_ID,PRJ_ID,IDF_CODIGO,TI_CODIGO,TI_SEQ,TI_REQ_AP,TI_ALTERNATE)');
   sql.add('SELECT CLI_ID,PRJ_ID,');
   sql.add(''+inttostr(wid)+''+',');
   sql.add(''+inttostr(pTicodigo)+''+',');
   sql.add(''+'5'+''+',');
   SQL.ADD('IDF_DESIGNACAO,IDF_MINIESPECIFICACAO FROM IDF_EV');
   sql.add('WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(pProj)+'');
   sql.add(' AND IDF_CODIGO = '+''+inttostr(pId)+'');
   execsql;
   If rowsaffected > 0 then
    result := true;
end;

function TReq.Inclui_alt(pCli,pProj,pTiCodigo,pId:integer): boolean;
var
wid : integer;
begin
   with Treq.create(self) do
    begin
     wid := Get_Maxkey +1;
     free;
    end;
   close;
   result := false;
   sql.clear;
   sql.add('INSERT INTO TI_REQ (CLI_ID,PRJ_ID,IDF_CODIGO,TI_CODIGO,TI_SEQ,TI_REQ_AP,TI_ALTERNATE)');
   sql.add('SELECT CLI_ID,PRJ_ID,');
   sql.add(''+inttostr(wid)+''+',');
   sql.add(''+inttostr(pTicodigo)+''+',');
   sql.add(''+'5'+''+',');
   SQL.ADD('TI_REQ_AP,TI_ALTERNATE FROM TI_REQ');
   sql.add('WHERE CLI_ID = '+''+inttostr(pCli)+'');
   sql.add(' AND PRJ_ID = '+''+inttostr(pProj)+'');
   sql.add(' AND IDF_CODIGO = '+''+inttostr(pId)+'');
   execsql;
   If rowsaffected > 0 then
    result := true;
end;

function TReq.OpenAll: boolean;
begin

end;

procedure TReq.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

procedure TReq.SetCLIENTE(const Value: integer);
begin
  FCLIENTE := Value;
end;

procedure TReq.SetID(const Value: integer);
begin
  FID := Value;
end;






{ TAtor }

constructor TAtor.Create(Aowner: TComponent);
begin
 inherited;
 PESSOA := Tps.create(application);
end;


function TAtor.Pega_ativ: boolean;
begin
   close;
   result := false;
   sql.clear;
   sql.add('SELECT I.CLI_ID,I.IDF_CODIGO,I.IDF_DESIGNACAO,O.PAI_ID,O.FILHO_ID,');
   sql.add('  (SELECT W.IDF_DESIGNACAO FROM IDF_AP W ');
   sql.add('              WHERE W.CLI_ID = '+''+inttostr(CLI_ID)+''+'  AND ');
   sql.add('              O.PAI_ID = W.IDF_CODIGO ');
   sql.add('                    AND W.PRJ_ID = '+''+inttostr(PRJ_ID)+''+') AS ATIVIDADE, ');
   sql.add('   (SELECT W.IDF_WBS_CODE FROM IDF_AP W  ');
   sql.add('              WHERE W.CLI_ID = '+''+inttostr(CLI_ID)+''+'  AND ');
   sql.add('              O.PAI_ID = W.IDF_CODIGO  ');
   sql.add('                    AND W.PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AS WBS ');
   sql.add(' FROM COR_OBJETOS O LEFT OUTER JOIN IDF_CA I ON I.CLI_ID = O.CLI_ID AND  ');
   sql.add('                 I.IDF_CODIGO = O.FILHO_ID and I.PRJ_ID = O.PRJ_ID ');
   sql.add(' WHERE  I.CLI_ID =  '+''+inttostr(CLI_ID)+''+'  AND ');
   sql.add('             I.PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   SQL.ADD('    O.PAI_TIPO = '+''''+'AP'+''''+'  AND ');
   sql.add('    O.FILHO_TIPO = '+''''+'CA'+'''');
   sql.add(' ORDER BY I.CLI_ID,I.PRJ_ID,I.IDF_DESIGNACAO ');
   open;
   If not eof then
     result := true;
end;



procedure TAtor.SetCLI_ID(const Value: INTEGER);
begin
  FCLI_ID := Value;
end;

procedure TAtor.SetIDF_CODIGO(const Value: integer);
begin
  FIDF_CODIGO := Value;
end;

procedure TAtor.SetIDF_TIPO_ATIVIDADE(const Value: string);
begin
  FIDF_TIPO_ATIVIDADE := Value;
end;

procedure TAtor.SetPESSOA(const Value: Tps);
begin
  FPESSOA := Value;
end;

procedure TAtor.SetPRJ_ID(const Value: integer);
begin
  FPRJ_ID := Value;
end;

{ TPs }

function TPs.OpenPessoa: boolean;

begin
   close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM IDF_PS');
   sql.add(' WHERE  I.CLI_ID =  '+''+inttostr(CLI_ID)+''+'  AND ');
   sql.add('             I.PRJ_ID = '+''+inttostr(PRJ_ID)+''+' AND ');
   SQL.ADD(' IDF_CODIGO = '+''+inttostr(IDF_CODIGO)+'');
   open;
   If not eof then
     result := true;
end;



procedure TPs.SetCLI_ID(const Value: INTEGER);
begin
  FCLI_ID := Value;
end;

procedure TPs.SetIDF_CODIGO(const Value: integer);
begin
  FIDF_CODIGO := Value;
end;

procedure TPs.SetPRJ_ID(const Value: integer);
begin
  FPRJ_ID := Value;
end;

procedure TAP.SetATOR(const Value: TAtor);
begin
  FATOR := Value;
end;

constructor TAP.Create(Aowner: TComponent);
begin
 Inherited;
 ATOR := TATOR.CREATE(application);
end;

procedure TAP.SetARI_ID(const Value: integer);
begin
  FARI_ID := Value;
end;

procedure TAP.SetATIVIDADE_MAE(const Value: integer);
begin
  FATIVIDADE_MAE := Value;
end;

procedure TAP.SetIDF_ADERENCIA(const Value: real);
begin
  FIDF_ADERENCIA := Value;
end;

procedure TAP.SetIDF_ATIVIDADE_CONTEXTO(const Value: string);
begin
  FIDF_ATIVIDADE_CONTEXTO := Value;
end;

procedure TAP.SetIDF_ATIVIDADE_SUMARIA(const Value: string);
begin
  FIDF_ATIVIDADE_SUMARIA := Value;
end;

procedure TAP.SetIDF_ATOR1(const Value: string);
begin
  FIDF_ATOR1 := Value;
end;

procedure TAP.SetIDF_ATOR2(const Value: string);
begin
  FIDF_ATOR2 := Value;
end;

procedure TAP.SetIDF_CAUSA_INATIVIDADE(const Value: string);
begin
  FIDF_CAUSA_INATIVIDADE := Value;
end;

procedure TAP.SetIDF_CLASSIFICACAO_PP(const Value: string);
begin
  FIDF_CLASSIFICACAO_PP := Value;
end;

procedure TAP.SetIDF_DEFINICAO_CONTEXTO(const Value: string);
begin
  FIDF_DEFINICAO_CONTEXTO := Value;
end;

procedure TAP.SetIDF_DESIGNACAO(const Value: string);
begin
  FIDF_DESIGNACAO := Value;
end;

procedure TAP.SetIDF_DURATION_TPU(const Value: real);
begin
  FIDF_DURATION_TPU := Value;
end;

procedure TAP.SetIDF_ID(const Value: integer);
begin
  FIDF_ID := Value;
end;

procedure TAP.SetIDF_ID_FISICO(const Value: integer);
begin
  FIDF_ID_FISICO := Value;
end;

procedure TAP.SetIDF_NATUREZA(const Value: string);
begin
  FIDF_NATUREZA := Value;
end;

procedure TAP.SetIDF_NOME(const Value: string);
begin
  FIDF_NOME := Value;
end;

procedure TAP.SetIDF_OBJETIVO(const Value: string);
begin
  FIDF_OBJETIVO := Value;
end;

procedure TAP.SetIDF_OBJETIVO_PROCESSO(const Value: string);
begin
  FIDF_OBJETIVO_PROCESSO := Value;
end;

procedure TAP.SetIDF_OBJETIVO_UC(const Value: string);
begin
  FIDF_OBJETIVO_UC := Value;
end;

procedure TAP.SetIDF_OI(const Value: integer);
begin
  FIDF_OI := Value;
end;

procedure TAP.SetIDF_PRIORIDADE(const Value: string);
begin
  FIDF_PRIORIDADE := Value;
end;

procedure TAP.SetIDF_REPONSABILIDADE(const Value: string);
begin
  FIDF_REPONSABILIDADE := Value;
end;

procedure TAP.SetIDF_RESPONSAVEL(const Value: string);
begin
  FIDF_RESPONSAVEL := Value;
end;

procedure TAP.SetIDF_TEMPO_INATIVO_TPI(const Value: real);
begin
  FIDF_TEMPO_INATIVO_TPI := Value;
end;

procedure TAP.SetIDF_TIPO(const Value: string);
begin
  FIDF_TIPO := Value;
end;

procedure TAP.SetIDF_TIPO_ATIV(const Value: string);
begin
  FIDF_TIPO_ATIV := Value;
end;

procedure TAP.SetIDF_TIPO_IMPLEMENT(const Value: string);
begin
  FIDF_TIPO_IMPLEMENT := Value;
end;

procedure TAP.SetIDF_TIPO_UC(const Value: string);
begin
  FIDF_TIPO_UC := Value;
end;

procedure TAP.SetIDF_UNIDADE_TEMPO(const Value: string);
begin
  FIDF_UNIDADE_TEMPO := Value;
end;

procedure TAP.SetIDF_UPDATE_DATE(const Value: REAL);
begin
  FIDF_UPDATE_DATE := Value;
end;

procedure TAP.SetIDF_V_MINIMO(const Value: real);
begin
  FIDF_V_MINIMO := Value;
end;

procedure TAP.SetIDF_V_PICO(const Value: real);
begin
  FIDF_V_PICO := Value;
end;

procedure TAP.SetIDF_V_REGULAR(const Value: real);
begin
  FIDF_V_REGULAR := Value;
end;

procedure TAP.SetIDF_VALOR_AGREGADO(const Value: string);
begin
  FIDF_VALOR_AGREGADO := Value;
end;

procedure TAP.SetIDF_VERSAO(const Value: string);
begin
  FIDF_VERSAO := Value;
end;

procedure TAP.SetIDF_VERSAO_DATA(const Value: real);
begin
  FIDF_VERSAO_DATA := Value;
end;

procedure TAP.SetIDF_VOLUME(const Value: string);
begin
  FIDF_VOLUME := Value;
end;

procedure TAP.SetIDF_VOLUME_LOOPING(const Value: real);
begin
  FIDF_VOLUME_LOOPING := Value;
end;

procedure TAP.SetIDF_VOLUME_PICO(const Value: string);
begin
  FIDF_VOLUME_PICO := Value;
end;

procedure TAP.SetIDF_VOLUME_PROC(const Value: real);
begin
  FIDF_VOLUME_PROC := Value;
end;

procedure TAP.SetIDF_VOLUME_REG(const Value: real);
begin
  FIDF_VOLUME_REG := Value;
end;

procedure TAP.SetIDF_WBS_CODE(const Value: string);
begin
  FIDF_WBS_CODE := Value;
end;

procedure TAP.SetIDG_ID(const Value: integer);
begin
  FIDG_ID := Value;
end;

procedure TAP.SetSUB_ID(const Value: integer);
begin
  FSUB_ID := Value;
end;

procedure TAP.SetSUB_NIVEL(const Value: integer);
begin
  FSUB_NIVEL := Value;
end;

{ TLimpa }
function TLimpa.Limpa: boolean;
begin
  close;
  result := false;
  sql.clear;
  sql.add(' DELETE FROM IDF_LIMPA ');
  execsql;
  If RowsAfFected > 0 then
     result := true;
end;


function TLimpa.Adeletar: boolean;
begin
  try
   begin
     close;
  result := false;
  sql.clear;
  sql.add(' INSERT INTO IDF_LIMPA(CODIGO,DESIGNACAO,TIPO) ');
  sql.add('VALUES ('+''+inttostr(CODIGO)+''+','+''''+designacao+''''+','+''''+TIPO+'''');
  sql.add(')');
  execsql;
  If RowsAfFected > 0 then
     result := true;
   end;
  except
   begin
     showmessage(inttostr(CODIGO)+'-'+designacao+'-'+tipo);
     raise;
   end;
  end;

end;



procedure TLimpa.SetCODIGO(const Value: integer);
begin
  FCODIGO := Value;
end;

procedure TLimpa.SetDESIGNACAO(const Value: string);
begin
  FDESIGNACAO := Value;
end;

procedure TLimpa.SetTIPO(const Value: string);
begin
  FTIPO := Value;
end;


{ TProv }

function Tprov.Incluir: boolean;
begin
  try
   begin
     close;
  result := false;
  sql.clear;
  sql.add(' INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,DATA_TYPE,COLUMN_SIZE) ');
  sql.add('VALUES (');
  sql.add(''''+PROVIDER_NAME+''''+','+''''+TYPE_NAME+''''+','+''+inttostr(DATA_TYPE)+''+','+''+inttostr(COLUMN_SIZE)+'');
  sql.add(')');
  execsql;
  If RowsAfFected > 0 then
     result := true;
   end;
  except
   begin

     raise;
   end;
  end;
end;
function Tprov.Excluir: boolean;
begin
  try
   begin
     close;
  result := false;
  sql.clear;
  sql.add(' DELETE FROM PROVIDER_DATA  ');
  sql.add('WHERE PROVIDER = '+''''+PROVIDER_NAME+'''');
  
  execsql;
  If RowsAfFected > 0 then
     result := true;
   end;
  except
   begin

     raise;
   end;
  end;

end;

function TProv.Get_provider: boolean;
begin
   close;
   result := false;
   sql.clear;
  // showmessage(SELF.Connection.ConnectionString);
   sql.add('SELECT * FROM PROVIDER_DATA ');
   sql.add(' WHERE PROVIDER = '+''''+PROVIDER_NAME+'''');

   open;
   If not eof then
    result := true;
end;

function TProv.Get_DataType: boolean;
begin
   close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM PROVIDER_DATA ');
   sql.add(' WHERE PROVIDER = '+''''+PROVIDER_NAME+'''');
   sql.add(' AND TYPE_NAME = '+''''+TYPE_NAME+'''');
   sql.add(' AND DATA_TYPE = '+''+inttostr(DATA_TYPE)+'');
   sql.add(' AND COLUMN_SIZE= '+''+inttostr(COLUMN_SIZE)+'');
   open;
   If not eof then
    result := true;
end;



function TProv.Get_Type: boolean;
begin
   close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM PROVIDER_DATA ');
   sql.add(' WHERE PROVIDER = '+''''+PROVIDER_NAME+'''');

   sql.add(' AND DATA_TYPE = '+''+inttostr(DATA_TYPE)+'');

   open;
   If not eof then
    Begin
      result := true;
      TYPE_NAME := fieldbyname('TYPE_NAME').asstring;
    end;
    
end;

procedure TProv.SetDATA_TYPE(const Value: integer);
begin
  FDATA_TYPE := Value;
end;



procedure TProv.SetTYPE_NAME(const Value: string);
begin
  FTYPE_NAME := Value;
end;

procedure TProv.SetPROVIDER_NAME(const Value: string);
begin
  FPROVIDER_NAME := Value;
end;

procedure TProv.SetCOLUMN_SIZE(const Value: integer);
begin
  FCOLUMN_SIZE := Value;
end;





{ Tbanco }

function Tbanco.Get_bd: boolean;
begin
  close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM BD ');
   sql.add(' WHERE ALIAS = '+''''+ALIAS+'''');
   open;
   If not eof then
    result := true;
end;

function Tbanco.Incluir: boolean;
begin
   close;
  result := false;
  sql.clear;
  sql.add(' INSERT INTO BD (ALIAS,BANCO,SERVIDOR,DADOS) ');
  sql.add('VALUES (');
  sql.add(''''+ALIAS+''''+','+''''+BANCO+''''+','+''''+SERVIDOR+''''+','+''''+DADOS+'''');
  sql.add(')');
  execsql;
  If RowsAfFected > 0 then
     result := true;
end;

function Tbanco.OpenAll: boolean;
begin
  close;
   result := false;
   sql.clear;
   sql.add('SELECT * FROM BD ');

   open;
   If not eof then
    result := true;
end;

procedure Tbanco.Setalias(const Value: string);
begin
  Falias := Value;
end;

procedure Tbanco.Setbanco(const Value: string);
begin
  Fbanco := Value;
end;

procedure Tbanco.Setdados(const Value: string);
begin
  Fdados := Value;
end;



procedure TDados_tab.SetListaCanc(const Value: boolean);
begin
  FListaCanc := Value;
end;

procedure TDados_tab.SetOperacao(const Value: integer);
begin
  FOperacao := Value;
end;



{ TDad }

constructor Tdad.Create;
 begin
   inherited create(screen.activeForm);
   inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    //OnDeleteError := clientedelete;
    //OnReconcileError := OnErrorRec;
    AggregatesActive  := true;
   end;
   Dataext.DataSet     := fClient;
   fClient.AfterPost   := AftrPost;
   fClient.BeforePost  := BefrPost;
   fClient.AfterDelete := AftrPost;
   //fclient.afterOpen           := AftrOpen;
  // fclient.OnPostError         := PostErr;
   //fclient.PacketRecords       := 500;
   //fclient.FetchOnDemand       := true;


 end;


 { TTodo }

function TTodo.get_maxKey : integer;

 begin
   close;
   sql.clear;
   sql.add('SELECT IDF_CODIGO FROM IDF_TODO');
   sql.add(' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_TODO WHERE ');
   sql.add(' CLI_ID ='+''+INTTOSTR(CLI_ID)+'');
   sql.add(' AND PRJ_ID ='+''+INTTOSTR(PRJ_ID)+''+')');
  // sql.SaveToFile('c:\sql.txt');
   open;
   result := fieldbyname('IDF_CODIGO').asinteger;
 end;

function TTodo.Get_dadosGeral(pCli,pproj : integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT S.SUB_NOME,T.IDF_DESCRICAO,T.TODO_DATA,T.TODO_STATUS FROM IDF_TODO T  ');
  sql.add('LEFT OUTER JOIN SUB_SUBORDINACAO S oN S.CLI_ID =  T.CLI_ID AND S.PRJ_ID = T.PRJ_ID');
  sql.add(' AND S.IDG_ID = T.IDG_ID');
  sql.add('WHERE T.CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' T.PRJ_ID = '+ ''+INTTOSTR(pProj)+'');
 // sql.SaveToFile('c:\sql.txt');
  open;
  fclient.active := true;

  If fclient.IndexDefs.IndexOf('TODO_DATA') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('TODO_DATA','TODO_DATA',[]);
          Items[0].GroupingLevel := 0;
        end;
   end;

  fclient.IndexName := 'TODO_DATA';
  fCpoLista1 := 'IDF_CODIGO';
  fCpoLista2 := 'IDF_DESIGNACAO';
  If not fclient.Eof then
   result := true;
end  ;

 function TTodo.Get_dados(pCli,pproj,pIdg : integer;pAberto : boolean): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_TODO WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+'');
  If pIdg > 0 then
     sql.add(' AND IDG_ID ='+''+INTTOSTR(pIdg)+'');
  If pAberto then
     sql.add('AND (TODO_STATUS IS NULL OR TODO_STATUS = '+''''+''+''''+ ')');
  open;
  fclient.active := true;
  fclient.IndexDefs.Clear;
  If fclient.IndexDefs.IndexOf('TODO_DATA') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('TODO_DATA','TODO_DATA',[]);
          Items[0].GroupingLevel := 0;

        end;
   end;
  fclient.IndexName := 'TODO_DATA';
  fCpoLista1 := 'IDF_CODIGO';
  fCpoLista2 := 'IDF_DESIGNACAO';
  If not fclient.Eof then
   result := true;
end;

constructor TTodo.Create;
 begin
   inherited create(screen.activeForm);
   inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    //OnDeleteError := clientedelete;
    //OnReconcileError := OnErrorRec;
    AggregatesActive  := true;
   end;
   Dataext.DataSet     := fClient;
   fClient.AfterPost   := AftrPost;
   fClient.BeforePost  := BefrPost;
   fClient.AfterDelete := AftrPost;
   //fclient.afterOpen           := AftrOpen;
  // fclient.OnPostError         := PostErr;
   //fclient.PacketRecords       := 500;
   //fclient.FetchOnDemand       := true;


 end;

procedure TTodo.BefrPost(dataset: Tdataset);
var
wid,wcli,wproj,widg : integer;
begin
   
   Dataset.fieldbyname('CLI_ID').asinteger := CLI_ID;
   Dataset.fieldbyname('PRJ_ID').asinteger := PRJ_ID;
   Dataset.fieldbyname('IDG_ID').asinteger := IDG_ID;
   wcli  :=    CLI_ID;
   wproj :=  PRJ_ID;
   wIdg  :=  IDG_ID;
   with TTodo.create(self) do
    Begin
     CLI_ID := wcli;
     PRJ_ID := wproj;
     IDG_ID := widg;
     wId    := get_maxkey + 1 ;
     free;
    end;
   Dataset.fieldbyname('IDF_CODIGO').asinteger :=  WId ;

end ;

procedure TTodo.AftrPost(dataSet: TdataSet);
begin

  fClient.ApplyUpdates(0);

end;


procedure TDad.AftrPost(dataSet: TdataSet);
begin
  fClient.ApplyUpdates(0);

end;

procedure TDad.BefrPost(dataset: Tdataset);
var
ide : Tdados_tab;
begin
  inherited;
  If  Dataset.fieldbyname('IDF_CODIGO').asinteger = 0 then
   Begin
      ide := Tdados_tab.create(SELF) ;
       Begin
        ide.Inclui_de(SELF.CLI_ID,
                  SELF.PRJ_ID,
                  Dataset.fieldbyname('IDF_CODIGO').asinteger,
                  'DE',
                  Dataset.fieldbyname('IDF_DESIGNACAO').asstring,
                  Dataset.fieldbyname('IDF_DESCRICAO').asstring,
                  Dataset.fieldbyname('IDF_DATA_TYPE').asstring,
                  Dataset.fieldbyname('IDF_TYPE_QUALIFIERS').asstring,
                  Dataset.fieldbyname('IDF_DOMINIO').asstring,
                  Dataset.fieldbyname('IDF_DEFAULT_VALUE').asstring);

        Dataset.fieldbyname('IDF_CODIGO').asinteger := ide.IDF_CODIGO;
        Dataset.fieldbyname('CLI_ID').asinteger := SELF.CLI_ID;
        Dataset.fieldbyname('PRJ_ID').asinteger := SELF.PRJ_ID;
        Dataset.fieldbyname('IDF_TABELA').asstring := SELF.IDF_TABELA;
        freeandnil(Ide);
       end;
      
   end  ;  

end;


procedure TDad.SetCLI_ID(const Value: integer);
begin
  FCLI_ID := Value;
end;

procedure TDad.SetIDF_CODIGO(const Value: integer);
begin
  FIDF_CODIGO := Value;
end;

procedure TDad.SetIDF_DATA_TYPE(const Value: string);
begin
  FIDF_DATA_TYPE := Value;
end;

procedure TDad.SetIDF_DE_REPET(const Value: integer);
begin
  FIDF_DE_REPET := Value;
end;

procedure TDad.SetIDF_DEFAULT_VALUE(const Value: string);
begin
  FIDF_DEFAULT_VALUE := Value;
end;

procedure TDad.SetIDF_DEL(const Value: string);
begin
  FIDF_DEL := Value;
end;

procedure TDad.SetIDF_DESCRICAO(const Value: string);
begin
  FIDF_DESCRICAO := Value;
end;

procedure TDad.SetIDF_DESIGNACAO(const Value: string);
begin
  FIDF_DESIGNACAO := Value;
end;

procedure TDad.SetIDF_DOMINIO(const Value: string);
begin
  FIDF_DOMINIO := Value;
end;

procedure TDad.SetIDF_NAMING_PREFIX(const Value: string);
begin
  FIDF_NAMING_PREFIX := Value;
end;

procedure TDad.SetIDF_NATUREZA(const Value: string);
begin
  FIDF_NATUREZA := Value;
end;

procedure TDad.SetIDF_NOME(const Value: string);
begin
  FIDF_NOME := Value;
end;

procedure TDad.SetIDF_NORMALIZE(const Value: string);
begin
  FIDF_NORMALIZE := Value;
end;

procedure TDad.SetIDF_PK(const Value: integer);
begin
  FIDF_PK := Value;
end;

procedure TDad.SetIDF_SEQ(const Value: integer);
begin
  FIDF_SEQ := Value;
end;

procedure TDad.SetIDF_TABELA(const Value: string);
begin
  FIDF_TABELA := Value;
end;

procedure TDad.SetIDF_TYPE_QUALIFIERS(const Value: string);
begin
  FIDF_TYPE_QUALIFIERS := Value;
end;

procedure TDad.SetIDF_VISIBLE(const Value: string);
begin
  FIDF_VISIBLE := Value;
end;

procedure TDad.SetPRJ_ID(const Value: integer);
begin
  FPRJ_ID := Value;
end;

procedure TDad.SetSUB_NIVEL(const Value: integer);
begin
  FSUB_NIVEL := Value;
end;

function Tdad.Incluidad : boolean;
var
wmax,wcod : integer;
begin;
DecimalSeparator := '.';

  Begin
     with TDad.create(self) do
       Begin
        If self.IDF_PK = 0 then
          wmax := Get_seq(self.CLI_ID,self.PRJ_ID,self.IDF_TABELA) + 10
        else
           wmax := self.IDF_PK;
        If Get_atrib(self.CLI_ID,self.PRJ_ID,self.IDF_TABELA,self.IDF_CODIGO) then
         exit;
            { PROCURA DESCRÇÃO IGUAL P/APROVEITAR A CHAVE}
        wcod := Get_atribDesc(self.CLI_ID,self.PRJ_ID,self.IDF_DESIGNACAO) ;
        If wCod > 0 then
         SELF.IDF_CODIGO := wCod;

        free;
       end;
  end ;



 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_DADOS ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('IDF_TABELA,');
 sql.add('IDF_SEQ,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DATA_TYPE,');
 sql.add('IDF_TYPE_QUALIFIERS,');
 sql.add('IDF_PK,USUARIO,DATATU');


 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''''+IDF_TABELA+''''+',');
 sql.add(''+InttoStr(wmax)+''+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DESCRICAO+''''+',');
 sql.add(''''+IDF_DATA_TYPE+''''+',');
 sql.add(''''+IDF_TYPE_QUALIFIERS+''''+',');
 sql.add(''+'0'+''+',');
 sql.add(''''+oAcesso.NOME+''''+',');
 sql.add(''+datetostr(date)+'');


 sql.add(')');
 //sql.savetofile('c:\sql.txt');
 execsql;

 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;




function TDad.Atu_atrib(pCli,pproj,pCodigo,pDecimal : integer;pdesign,pdesc,pnome,ptype,pdominio,pNormal,pqual,ptab : string): boolean;

begin
  result := false;      // ...tenta incluir o atributo a partir da Tabela IDF_DE...
  sql.clear;
  fclient.Active := false;
  sql.add('UPDATE IDF_DADOS ');
  sql.add('SET IDF_DESIGNACAO = '+''''+ pdesign+''''+',');
  sql.add('IDF_DESCRICAO = '+''''+ pdesC+''''+',');
  sql.add('IDF_NOME = '+''''+ pNOME+''''+',');
  sql.add('IDF_DATA_TYPE = '+''''+ pTYPE+''''+',');
  sql.add('IDF_DOMINIO = '+''''+ pDOMINIO+''''+',');
  sql.add('IDF_NORMALIZE = '+''''+ pnormal+''''+',');
  sql.add('IDF_TYPE_QUALIFIERS = '+''''+ pqual+'''');
 // sql.add('IDF_DECIMAL = '+''''+ inttostr(pdecimal)+'''');
  sql.add(' WHERE ');
  sql.add(' CLI_ID = '+ ''+inttostr(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pproj)+''+' AND ');
  sql.add(' IDF_CODIGO = '+ ''+INTTOSTR(pCODIGO)+'');
 // sql.add(' IDF_TABELA <> '+ ''''+ptab+'''');
 // sql.SaveToFile('c:\sqlInclui.txt');
  execsql;

  If Rowsaffected > 0 then
   result := true


 end;

function TDad.inclui(pTab : string): boolean;
var
wmax : integer;
begin

  with TDad.create(self) do
   Begin
    wmax := Get_seq(self.CLI_ID,self.PRJ_ID,pTab) + 10;
    If Get_atrib(self.CLI_ID,self.PRJ_ID,ptab,self.IDF_CODIGO) then
     exit;
    free;
   end;
  result := false;      // ...tenta incluir o atributo a partir da Tabela IDF_DE...
  sql.clear;
  fclient.active := false;
  sql.add('INSERT INTO IDF_DADOS (');
  sql.add('IDF_CODIGO ,CLI_ID ,PRJ_ID,IDF_TABELA,IDF_DESIGNACAO,');
  sql.add('IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
  sql.add('IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,IDF_SEQ)');

  sql.add(' SELECT IDF_CODIGO ,CLI_ID ,PRJ_ID,');
  sql.add(''''+pTab+''''+',');
  sql.add(' IDF_DESIGNACAO,');
  sql.add(' IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
  sql.add(' IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,');
  sql.add(''''+INTTOSTR(wmax)+'''' );
  sql.add(' FROM IDF_DE WHERE ');
  sql.add(' CLI_ID = '+ ''+INTTOSTR(CLI_ID)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(PRJ_ID)+''+' AND ');
  sql.add(' IDF_CODIGO = '+ ''+INTTOSTR(IDF_CODIGO)+'');
 // sql.SaveToFile('c:\sqlInclui.txt');
  execsql;
  If Rowsaffected > 0 then
   result := true
  else                 // ..tenta incluir o atributo a partir da Tabela IDF_DADOS...
   Begin
    result := false;
    sql.clear;
    fclient.active := false;
    sql.add('INSERT INTO IDF_DADOS (');
    sql.add('IDF_CODIGO ,CLI_ID ,PRJ_ID,IDF_TABELA,IDF_DESIGNACAO,');
    sql.add('IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
    sql.add('IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,IDF_OBRIG,IDF_CAPTION,IDF_SEQ)');

    sql.add(' SELECT IDF_CODIGO ,CLI_ID ,PRJ_ID,');
    sql.add(''''+pTab+''''+',');
    sql.add(' IDF_DESIGNACAO,');
    sql.add(' IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
    sql.add(' IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,IDF_OBRIG,IDF_CAPTION,');
    sql.add(''''+INTTOSTR(wmax)+'''' );
    sql.add(' FROM IDF_DADOS WHERE ');
    sql.add(' CLI_ID = '+ ''+INTTOSTR(CLI_ID)+''+' AND ');
    sql.add(' PRJ_ID = '+ ''+INTTOSTR(PRJ_ID)+''+' AND ');
    sql.add(' IDF_CODIGO = '+ ''+INTTOSTR(IDF_CODIGO)+'');
   // sql.SaveToFile('c:\sqlInclui.txt');
    execsql;
    If Rowsaffected > 0 then
     result := true
     end;

 end;


function TDad.incluiObj(pTabde,ptabate : string): boolean;
var
wmax : integer;
idad : Tdad;
begin
  result := false;
  with TDad.create(self) do
   Begin
    If Get_atrib(self.CLI_ID,self.PRJ_ID,ptabATE,self.IDF_CODIGO) then
     exit;
    wmax := Get_seq(self.CLI_ID,self.PRJ_ID,pTabATE) + 10;

    free;
   end;

  // ..tenta incluir o atributo a partir da Tabela IDF_DADOS...
   Begin
    result := false;
    sql.clear;
    fclient.active := false;
    sql.add('INSERT INTO IDF_DADOS (');
    sql.add('IDF_CODIGO ,CLI_ID ,PRJ_ID,');
    sql.add('IDF_TABELA,IDF_DESIGNACAO,IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
    sql.add('IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,IDF_OBRIG,IDF_CAPTION,IDF_SEQ)');

    sql.add(' SELECT IDF_CODIGO,CLI_ID,PRJ_ID,');
    sql.add(''''+pTabate+''''+',');
    sql.add(' IDF_DESIGNACAO,');
    sql.add(' IDF_NOME,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
    sql.add(' IDF_DOMINIO ,IDF_NORMALIZE,IDF_TYPE_QUALIFIERS,IDF_OBRIG,IDF_CAPTION,');
    sql.add(''+INTTOSTR(wmax)+'' );
    sql.add(' FROM IDF_DADOS  ');
    SQL.ADD(' WHERE CLI_ID = '+''+INTTOSTR(CLI_ID)+'');
    SQL.ADD(' AND PRJ_ID = ' + ''+INTTOSTR(PRJ_ID)+'');
    sql.add(' AND IDF_CODIGO = '+''+INTTOSTR(IDF_CODIGO)+'');
    sql.add(' AND IDF_TABELA = '+''''+pTabDe+'''');
    //sql.SaveToFile('c:\sql.txt');
    execsql;
    If Rowsaffected > 0 then
     result := true
    end;

 end;


 function TDad.Del_Object(pCli, pProj, pcodigo : integer;ptabela : string;pSeq : integer): boolean;
 Begin
  result := true;
  close;
  sql.clear;
  //fclient.active := false;
  sql.add('DELETE FROM IDF_DADOS ');
  sql.add(' WHERE CLI_ID = '+''+inttostr(pCli)+'');
  sql.add(' AND PRJ_ID = '+''+inttostr(pproj)+'');
  sql.add(' AND IDF_CODIGO = '+''+inttostr(pCodigo)+'');
  sql.add(' AND IDF_TABELA = '+''''+pTabela+'''');
  sql.add('AND IDF_SEQ = '+''+inttostr(pseq)+'');
  execsql;
  If rowsaffected > 0 then
   result := true;
 end;



function TDad.Get_dados(ptab : string): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  //sql.add('SELECT * FROM IDF_DADOS WHERE ');
  sql.add('SELECT * FROM IDF_DE WHERE ');
  sql.add(' CLI_ID = '+ ''+INTTOSTR(CLI_ID)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(PRJ_ID)+'');
  //If pTab <> '' then
     //sql.add(' AND IDF_TABELA = '+''''+ptab+'''');
  open;
  fclient.active := true;

  If fclient.IndexDefs.IndexOf('IDF_SEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('IDF_SEQ','IDF_SEQ',[]);
          Items[0].GroupingLevel := 0; 
        end;
   end;
  //fclient.IndexName := 'IDF_SEQ';
  fCpoLista1        := 'IDF_CODIGO';
  fCpoLista2        := 'IDF_DESIGNACAO';  

  If not fclient.Eof then
   result := true;   
end;

function TDad.Get_dadosObrig(ptab : string): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_DADOS WHERE ');
  sql.add(' CLI_ID = '+ ''+INTTOSTR(CLI_ID)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(PRJ_ID)+'');
  If pTab <> '' then
     sql.add(' AND IDF_TABELA = '+''''+ptab+'''');
  sql.add(' AND IDF_VISIBLE <> '+ ''''+''+'''');
  sql.add(' AND IDF_OBRIG <> '+ ''''+''+'''');
  open;
  fclient.active := true;

  If fclient.IndexDefs.IndexOf('IDF_SEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('IDF_SEQ','IDF_SEQ',[]);
          Items[0].GroupingLevel := 0;

        end;
   end;
  fclient.IndexName := 'IDF_SEQ';
  fCpoLista1        := 'IDF_CODIGO';
  fCpoLista2        := 'IDF_DESIGNACAO'; 

  If not fclient.Eof then
   result := true;
end;

function TDad.DelDoCenario(pCli,pCenario : integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('DELETE  FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pcenario)+'');
  execsql;
  If RowsAffected > 0 then
   result := true;
end;


procedure TDad.SetDataFonte(const Value: TdataSource);
begin
  FDataFonte := Value;
end;

function TDad.Get_atrib(pCli,pProj : integer;ptab: string; pAtrib: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_TABELA = '+''''+ptab+''''+' AND ');
  sql.add(' IDF_CODIGO = '+''+inttostr(pAtrib)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
    IDF_DESCRICAO := fclient.fieldbyname('IDF_DESCRICAO').asstring;
    IDF_CODIGO    := fclient.fieldbyname('IDF_CODIGO').asinteger;
    result := true;
   end;
end;

function TDad.Get_atribDesc(pCli,pProj : integer;pdesc: string): integer;
begin
  result := 0;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_DESIGNACAO = '+''''+pDesc+'''');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
    IDF_DESCRICAO := fclient.fieldbyname('IDF_DESCRICAO').asstring;
    IDF_CODIGO    := fclient.fieldbyname('IDF_CODIGO').asinteger;
    result := fclient.fieldbyname('IDF_CODIGO').asinteger;
   end;
end;

function TDad.Get_Objeto(pCli,pProj,pAtrib: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+inttostr(pAtrib)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
    IDF_DESCRICAO := fclient.fieldbyname('IDF_DESCRICAO').asstring;
    IDF_CODIGO    := fclient.fieldbyname('IDF_CODIGO').asinteger;
    IDF_TABELA    := fclient.fieldbyname('IDF_TABELA').asstring;
    result := true;
   end;

end;

function TDad.Get_Tabelas(pCli,pProj : integer; pLike : boolean; pNome : string): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT DISTINCT IDF_TABELA FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+'');
  If plike then
     sql.add('AND IDF_TABELA LIKE '+ ''''+pNome+'''');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
     result := true;
   end;

end;

function TDad.Get_seq(pCli,pProj : integer;ptab: string): integer;
begin
  result := 0;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT MAX(IDF_SEQ) AS MAXSEQ FROM IDF_DADOS WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_TABELA = '+''''+ptab+'''');
  open;
  fclient.active := true;
  If not fclient.Eof then
   result := fclient.fieldbyname('MAXSEQ').asinteger;
end;

function TDad.Del_atrib(pCli, pProj: integer; ptab: string; pAtrib: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('DELETE FROM IDF_DADOS WHERE ');
  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_TABELA = '+ ''''+ptab+''''+' AND ');
  sql.add(' IDF_CODIGO = '+ ''+INTTOSTR(pAtrib)+'');

  execsql;
  If Rowsaffected > 0 then
   result := true;
end;


function TDados_tab.Inclui_de(cli, prj, cod: integer; ativ, design, descr,
  tipo, qual, dom, def: string): boolean;
var
iDe : Tdados_tab;
wcod : integer;
begin
   try
     ide := Tdados_tab.create(self);
     ide.CLI_ID := CLI;
     ide.PRJ_ID := PRJ;
     wCod := ide.get_maxkey('IDF_DE') + 1;
   finally
      freeandnil(iDe);
   end;


  result := false;
  sql.clear;
  //fclient.active := false;
  sql.add('INSERT INTO IDF_DE (');
  sql.add('IDF_CODIGO ,CLI_ID ,PRJ_ID,IDF_DESIGNACAO,');
  sql.add('IDF_TIPO_ATIVIDADE,IDF_DESCRICAO,IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
  sql.add('IDF_DOMINIO ,IDF_TYPE_QUALIFIERS)');
  sql.add('VALUES ( ' );
  sql.add(''+inttostr(WCOD)+''+',');
  sql.add(''+inttostr(CLI)+''+',');
  sql.add(''+inttostr(PRJ)+''+',');
  sql.add(''''+DESIGN+''''+',');
  sql.add(''''+ATIV+''''+',');
  sql.add(''''+DESCR+''''+',');
  sql.add(''''+TIPO+''''+',');
  sql.add(''''+DEF+''''+',');
  sql.add(''''+DOM+''''+',');
  sql.add(''''+QUAL+''''+')');
  // showmessage(sql.text);

  execsql;
  If Rowsaffected > 0 then
   Begin
    IDF_CODIGO := wcod;
    result := true;
   end;

end;



function TDad.get_all(pCli, pProj: integer): boolean;
begin
   result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_DADOS WHERE ');
  sql.add(' CLI_ID = '+ ''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' IDF_TABELA = :IDF_DESIGNACAO');
  sql.add('ORDER BY IDF_SEQ');
  open;
  fclient.active := true;


  If not fclient.Eof then
   result := true;
end;

function TDad.get_allbyDesc(pCli, pProj: integer): boolean;
begin
   result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT D.IDF_CODIGO ,D.CLI_ID,D.PRJ_ID,D.IDF_TABELA,D.IDF_DESIGNACAO,D.SUB_NIVEL,D.IDF_NOME,D.IDF_DESCRICAO,') ;
  SQL.ADD('D.IDF_DATA_TYPE,D.IDF_DEFAULT_VALUE,D.IDF_DOMINIO, D.IDF_NATUREZA,D.IDF_NORMALIZE,D.IDF_TYPE_QUALIFIERS,');
  sql.add('D.IDF_DE_REPET,D.IDF_PK,IDF_SEQ,D.IDF_CAPTION,D.IDF_OBRIG,I.IDF_DESCRICAO AS DESCR ,I.IDF_OBJETIVO,IDF_TIPODOMINIO,IDF_TABREF');
  sql.add('  FROM IDF_DADOS D LEFT OUTER JOIN IDF_IF I ON D.CLI_ID = I.CLI_ID AND D.PRJ_ID = I.PRJ_ID AND ');
  sql.add(' D.IDF_TABELA = I.IDF_DESIGNACAO WHERE ');
  sql.add(' D.CLI_ID = '+ ''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' D.PRJ_ID = '+ ''+INTTOSTR(PPROJ)+'');
  sql.add('ORDER BY D.CLI_ID,D.PRJ_ID,D.IDF_TABELA,D.IDF_SEQ');
  open;
  fclient.active := true;

  If not fclient.Eof then
   result := true;
end;

function TDad.get_ObjetobyDesc(pCli, pProj: integer; pTabela,pOrder : string): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT D.IDF_CODIGO ,D.CLI_ID,D.PRJ_ID,D.IDF_TABELA,D.IDF_DESIGNACAO,D.SUB_NIVEL,D.IDF_NOME,D.IDF_DESCRICAO,') ;
  SQL.ADD('D.IDF_DATA_TYPE,D.IDF_DEFAULT_VALUE,D.IDF_DOMINIO, D.IDF_NATUREZA,D.IDF_NORMALIZE,D.IDF_TYPE_QUALIFIERS,');
  sql.add('D.IDF_DE_REPET,D.IDF_PK,D.IDF_SEQ,D.IDF_CAPTION,D.IDF_OBRIG,I.IDF_DESCRICAO AS DESCR,I.IDF_OBJETIVO,IDF_TIPODOMINIO,IDF_TABREF,D.IDF_VISIBLE');
  sql.add(' FROM IDF_DADOS D LEFT OUTER JOIN IDF_IF I ON D.CLI_ID = I.CLI_ID AND D.PRJ_ID = I.PRJ_ID AND ');
  sql.add(' D.IDF_TABELA = I.IDF_DESIGNACAO WHERE ');
  sql.add(' D.CLI_ID = '+ ''+INTTOSTR(PCLI)+''+' AND ');
  sql.add(' D.PRJ_ID = '+ ''+INTTOSTR(PPROJ)+''+' AND ');
  sql.add(' D.IDF_TABELA = '+''''+pTabela+'''');
  If pOrder <> '' then
     sql.add(' ORDER BY '+pOrder);
  open;
  fclient.active := true;

  If not fclient.Eof then
   result := true;
end;

//Aqui estou colcoando a nova função
function TDad.get_ObjetoDescricao(pCli, pProj: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT OBJ.PAI_TIPO, OBJ.PAI_ID, DE.IDF_DESIGNACAO, DE.IDF_DESCRICAO, ');
  sql.add('DE.IDF_DATA_TYPE, DE.IDF_DEFAULT_VALUE, DE.IDF_DOMINIO, DE.IDF_TYPE_QUALIFIERS, ');
  sql.add('FI.IDF_DESIGNACAO, FI.IDF_DEL, FI.IDF_OBJETIVO, FI.IDF_UNIDADE_TEMPO, ');
  sql.add('FI.IDF_VOLUME_PROC, FI.IDF_DESCRICAO ');
  sql.add('FROM IDF_IF FI, COR_OBJETOS OBJ, IDF_DE DE ');
  sql.add('WHERE DE.CLI_ID = '+ ''+INTTOSTR(PCLI)+''+' ');
  sql.add('AND DE.PRJ_ID = '+ ''+INTTOSTR(PPROJ)+''+'  ');
  sql.add('AND OBJ.PAI_TIPO = "IF" ');
  sql.add('AND OBJ.PAI_ID = FI.IDF_CODIGO ');
  sql.add('AND OBJ.FILHO_ID = DE.IDF_ID ');
  sql.add('ORDER BY FI.IDF_DESIGNACAO ');
  open;
  fclient.active := true;

  if not fclient.Eof then
    result := true;
end;


procedure TDad.SetIDF_CAPTION(const Value: STRING);
begin
  FIDF_CAPTION := Value;
end;

procedure TDad.SetIDF_OBRIG(const Value: STRING);
begin
  FIDF_OBRIG := Value;
end;


{ Tprovider_data }

constructor TProvider_data.Create;
 begin
   inherited create(screen.activeForm);
   inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    AggregatesActive  := true;
   end;
end;



function Tprovider_data.Get_all: boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM PROVIDER_DATA ');
  open;
  fclient.active := true;


  If not fclient.Eof then
   result := true;
end;

function Tprovider_data.Carga_Array: boolean;
var
i : integer;
begin
 If length(aType) > 0 then
  exit;
  result := false;
  Get_all;
  i := -1;
  setlength(aType,fclient.RecordCount);
  setlength(aTipos,fclient.RecordCount);
  while not fclient.eof do
   Begin
    inc(i);
    aType[i]  := uppercase(fclient.fieldbyname('TYPE_NAME').asstring);
    aTipos[i] := uppercase(fclient.fieldbyname('TIPO').asstring);

    fclient.next;
   end;
end;

procedure TDados_tab.SetListaWbs(const Value: string);
begin
  FListaWbs := Value;
end;

procedure TDiag_dados.SetPrimAncestor(const Value: integer);
begin
  FPrimAncestor := Value;
end;

procedure TDados_tab.SetListaPesq(const Value: string);
begin
  FListaPesq := Value;
end;
{Tidf_cs Métodos}

procedure Tidf_cs.AftrScroll(DataSet: TDataSet);
begin
      LCK                       := DataSet.fieldbyname('LCK').asstring;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;

      IDF_FORM                  := DataSet.fieldbyname('IDF_FORM').asstring;
      IDF_UNIT                  := DataSet.fieldbyname('IDF_UNIT').asstring;
      IDF_UNIT_OO               := DataSet.fieldbyname('IDF_UNIT_OO').asstring;
      IDF_DIRPROJ               := DataSet.fieldbyname('IDF_DIRPROJ').asstring;
      IDF_TABELA                := DataSet.fieldbyname('IDF_TABELA').asstring;

end;

function Tidf_cs.Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_CS');
 sql.add('SET ');
 sql.add('IDF_DEL = '+#39+IDF_DEL+#39+',');
 sql.add('IDF_DESIGNACAO = '+#39+IDF_DESIGNACAO+#39+',');
 sql.add('IDF_DIRETORIO = '+#39+IDF_DIRETORIO+#39+',');
 sql.add('IDF_OBJETIVO = '+#39+IDF_OBJETIVO+#39+',');
 sql.add('IDF_RESPONSAVEL = '+#39+IDF_RESPONSAVEL+#39+',');
 sql.add('IDF_TIPO_ATIVIDADE = '+#39+IDF_TIPO_ATIVIDADE+#39+',');
 sql.add('IDF_VERSAO = '+#39+IDF_VERSAO+#39+',');
 sql.add('IDF_VERSAO_DATA = '+#39+formatdatetime('yyyy/mm/dd',IDF_VERSAO_DATA)+#39+',');
 sql.add('IDF_VISIBLE = '+#39+IDF_VISIBLE+#39+',');
 sql.add('IDG_ID = '+IntToStr(IDG_ID)+',');
 sql.add('LCK = '+#39+LCK+#39+',');
 sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
 sql.add('DATATU = '+''+floattostr(date)+'');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO));
 execsql;
 If rowsaffected > 0 then 
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_cs.Atu_geracao(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_CS');
 sql.add('SET ');
 sql.add('IDF_DIRPROJ = '+#39+IDF_DIRPROJ+#39+',');
 sql.add('IDF_UNIT = '+#39+IDF_UNIT+#39+',');
 sql.add('IDF_UNIT_OO = '+#39+IDF_UNIT_OO+#39+',');
 sql.add('IDF_TABELA = '+#39+IDF_TABELA+#39+',');
 sql.add('IDF_FORM = '+#39+IDF_FORM+#39+',');
 sql.add('USUARIO ='+''''+oAcesso.NOME+''''+',');
 sql.add('DATATU = '+''+floattostr(date)+'');
 sql.add('WHERE CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO));
 execsql;
 If rowsaffected > 0 then 
    Result := true;
DecimalSeparator := ',';
end;


function Tidf_cs.Inclui : boolean;
var
iDe : Tdados_tab;

wcod ,CLI,PRJ: integer;
begin
   CLI := CLI_ID;
   PRJ := PRJ_ID;
    try
     ide := Tdados_tab.create(self);
     ide.CLI_ID := CLI;
     ide.PRJ_ID := PRJ;
     wCod := ide.get_maxkey('IDF_CS') + 1;
    finally
      freeandnil(iDe);
    end;

   If IDF_CODIGO = 0  then
    begin
       try
         ide := Tdados_tab.create(self);
         ide.CLI_ID := CLI;
         ide.PRJ_ID := PRJ;
         wCod := ide.get_maxkey('IDF_CS') + 1;
       finally
          freeandnil(iDe);
       end;
    end;
IDF_CODIGO :=wCod ;
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_CS ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('LCK');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''''+IDF_OBJETIVO+''''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''''+LCK+'''');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_cs.get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_CS');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+'');
 open;
 If not eof then
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function Tidf_cs.Del_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('DELETE FROM IDF_CS');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+'');
 execsql;
 If rowsaffected > 0 then
   begin
    // deleta os Métodos da Classe
     with TIdf_mt.create(application) do
      begin
       Delete_ObjetoDaClasse(pCli_id,pPrj_id,pIdf_codigo);
       free;
      end;
     // deleta as properties da Classe
     with TIdf_py.create(application) do
      begin
       Del_DaClasse(pCli_id,pPrj_id,pIdf_codigo);
       free;
      end;
     Result := true;
   end;
end;


function Tidf_cs.Del_Limpa(pCLI_ID : integer ;pPRJ_ID : integer) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('DELETE FROM IDF_CS');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_DEL = '+''''+'S'+'''');
 execsql;
 If rowsaffected > 0 then
   begin
    // deleta os Métodos da Classe
     with TIdf_mt.create(application) do
      begin
       Delete_Orfao(pCli_id,pPrj_id);
       free;
      end;
     // deleta as properties da Classe
     with TIdf_py.create(application) do
      begin
       Delete_Orfao(pCli_id,pPrj_id);
       free;
      end;
     Result := true;
   end;
end;

function Tidf_cs.get_ObjectByNome(pCLI_ID : integer ;pPRJ_ID : integer ;pnome : string ) : integer;
begin
 result := 0;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_CS');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_DESIGNACAO = '+''''+pNome+'''');
 open;
 If not eof then
      Result := fieldbyname('IDF_CODIGO').asinteger;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;


function Tidf_cs.Get_all : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_CS');
 open;
 If not eof then
    Result := true;
end;

function Tidf_cs.Get_allBut(pCod : integer) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_CS');
 sql.add('WHERE IDF_CODIGO <> '+''+INTTOSTR(PCOD)+'');
 open;
 If not eof then
    Result := true;
end;

constructor Tidf_cs.Create ;
begin
 inherited create(application);
 ATRIBUTOS := TIDF_PY.CREATE(APPLICATION);
 METODOS := TIDF_MT.CREATE(APPLICATION);
 AfterScroll := AftrScroll;
end;

{Tidf_py Métodos}

procedure Tidf_py.AftrScroll(DataSet: TDataSet);
begin
      PROP_VISIBIL              := DataSet.fieldbyname('PROP_VISIBIL').asstring;
      PROP_TIPO                 := DataSet.fieldbyname('PROP_TIPO').asstring;
      PROP_DOMINIO              := DataSet.fieldbyname('PROP_DOMINIO').asstring;
      PROP_DEFAULT              := DataSet.fieldbyname('PROP_DEFAULT').asstring;
      LCK                       := DataSet.fieldbyname('LCK').asstring;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_SEQ                   := DataSet.fieldbyname('IDF_SEQ').asinteger;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      CLASS_ID                  := DataSet.fieldbyname('CLASS_ID').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      IDF_LISTA                 := DataSet.fieldbyname('IDF_LISTA').asinteger;
end;

function Tidf_py.Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_PY');
 sql.add('SET ');
 sql.add('IDF_DEL = '+#39+IDF_DEL+#39+',');
 sql.add('IDF_DESIGNACAO = '+#39+IDF_DESIGNACAO+#39+',');
 sql.add('IDF_DIRETORIO = '+#39+IDF_DIRETORIO+#39+',');
 sql.add('IDF_OBJETIVO = '+#39+IDF_OBJETIVO+#39+',');
 sql.add('IDF_RESPONSAVEL = '+#39+IDF_RESPONSAVEL+#39+',');
 sql.add('IDF_SEQ = '+IntToStr(IDF_SEQ)+',');
 sql.add('IDF_TIPO_ATIVIDADE = '+#39+IDF_TIPO_ATIVIDADE+#39+',');
 sql.add('IDF_VERSAO = '+#39+IDF_VERSAO+#39+',');
 sql.add('IDF_VERSAO_DATA = '+#39+formatdatetime('yyyy/mm/dd',IDF_VERSAO_DATA)+#39+',');
 sql.add('IDF_VISIBLE = '+#39+IDF_VISIBLE+#39+',');
 sql.add('IDG_ID = '+IntToStr(IDG_ID)+',');
 sql.add('LCK = '+#39+LCK+#39+',');
 sql.add('PROP_DEFAULT = '+#39+PROP_DEFAULT+#39+',');
 sql.add('PROP_DOMINIO = '+#39+PROP_DOMINIO+#39+',');
 sql.add('PROP_TIPO = '+#39+PROP_TIPO+#39+',');
 sql.add('IDF_LISTA = '+#39+IntToStr(IDF_LISTA)+#39+',');
 sql.add('PROP_VISIBIL = '+#39+PROP_VISIBIL+#39);
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO)+' AND ');
 sql.add('CLASS_ID = '+IntToStr(pCLASS_ID));
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_py.Inclui : boolean;

var
iDe : Tdados_tab;
wcod ,CLI,PRJ: integer;
begin
   try
     ide := Tdados_tab.create(self);
     ide.CLI_ID := CLI;
     ide.PRJ_ID := PRJ;
     wCod := ide.get_maxkey('IDF_PY') + 1;
   finally
      freeandnil(iDe);
   end;

DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_PY ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('CLASS_ID,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_SEQ,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('LCK,');
 sql.add('PROP_DEFAULT,');
 sql.add('PROP_DOMINIO,');
 sql.add('PROP_TIPO,');
 sql.add('IDF_LISTA,');
 sql.add('PROP_VISIBIL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(CLASS_ID)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''''+IDF_OBJETIVO+''''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''+InttoStr(IDF_SEQ)+''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''''+LCK+''''+',');
 sql.add(''''+PROP_DEFAULT+''''+',');
 sql.add(''''+PROP_DOMINIO+''''+',');
 sql.add(''''+PROP_TIPO+''''+',');
 sql.add(''+InttoStr(IDF_LISTA)+''+',');
 sql.add(''''+PROP_VISIBIL+'''');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
  Begin
    IDF_CODIGO := wcod;
    Result := true;
  end;

DecimalSeparator := ',';
end;

function Tidf_py.get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_PY');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pCLASS_ID)+'');
 open;
 If not eof then
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function TIdf_py.Del_DaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pClasse : integer) : boolean;
 begin
   result := false;
   close;
   sql.clear;
   sql.text := 'DELETE FROM IDF_PY WHERE CLI_ID = '+InttoStr(pCLI_ID) +
   ' AND PRJ_ID = '+InttoStr(pPRJ_ID) +
   ' AND CLASS_ID = '+InttoStr(pClasse);
   execsql;
   If RowsAffected > 0 then
     result := true;

 end;

function Tidf_py.Delete_orfao(pCLI_ID : integer ;pPRJ_ID : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('DELETE FROM IDF_PY');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('NOT EXISTS ( SELECT * FROM IDF_CS C WHERE C.CLI_ID = CLI_ID AND C.PRJ_ID = PRJ_ID AND C.IDF_CODIGO = CLASS_ID)');
 execsql;
 If RowsAffected >0then
   Result := true;

end;

 function TIdf_py.Get_DaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pClasse : integer) : boolean;
 begin
   result := false;
   close;
   sql.clear;
   sql.text := 'SELECT * FROM IDF_PY WHERE CLI_ID = '+InttoStr(pCLI_ID) +
   ' AND PRJ_ID = '+InttoStr(pPRJ_ID) +
   ' AND CLASS_ID = '+InttoStr(pClasse);
   open;
   If NOT EOF then
     result := true;

 end;

  function TIdf_py.Get_AtribLista(pCLI_ID : integer ;pPRJ_ID : integer ;pClasse : integer) : boolean;
 begin
   result := false;
   afterscroll := nil;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_DESIGNACAO FROM IDF_PY WHERE CLI_ID = '+InttoStr(pCLI_ID) +
   ' AND PRJ_ID = '+InttoStr(pPRJ_ID) +
   ' AND CLASS_ID = '+InttoStr(pClasse)+
   ' AND IDF_LISTA = 1';
   open;
   If NOT EOF then
     result := true;

 end;

function Tidf_py.get_AtributosdaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pCLASS_ID : integer ) : boolean;
 Begin
   result := false;
 close;
 fclient.active := false;
 sql.clear;
 sql.add('SELECT * FROM IDF_PY');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pCLASS_ID)+'');
 open;
 fclient.Active := true;
 {If fclient.IndexDefs.IndexOf('IDF_SEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('IDF_SEQ','IDF_SEQ',[]);
          Items[0].GroupingLevel := 0;

        end;
   end;
  fclient.IndexName := 'IDF_SEQ'; }
 If not fclient.eof then
      Result := true;

 end;

function TIdf_py.Get_atrib(pCli,pProj,pClass,pAtrib: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_PY WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' CLASS_ID = '+''+INTTOSTR(pClass)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+inttostr(pAtrib)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
  //  IDF_DESCRICAO := fclient.fieldbyname('IDF_DESCRICAO').asstring;
    IDF_CODIGO    := fclient.fieldbyname('IDF_CODIGO').asinteger;
    result := true;
   end;

end;


function TIdf_py.Get_seq(pCli,pProj,pClass : integer): integer;
begin
  result := 0;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT MAX(IDF_SEQ) AS MAXSEQ FROM IDF_PY WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' CLASS_ID= '+''+INTTOSTR(pClass)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   result := fclient.fieldbyname('MAXSEQ').asinteger;
end;


function TIdf_py.incluiObj(pCli,pProj,pcod,pclass: integer; pTab : string): boolean;
var
wmax : integer;
idad,idados : Tdad;
begin
  result := false;
  idados := Tdad.create(self);
  idados.SQL.Text := 'SELECT * FROM IDF_DADOS  '+
                      ' WHERE CLI_ID = '+INTTOSTR(SELF.CLI_ID)+
                      ' AND PRJ_ID = ' + INTTOSTR(SELF.PRJ_ID)+
                      ' AND IDF_CODIGO = '+INTTOSTR(SELF.IDF_CODIGO)+
                      ' AND IDF_TABELA = '+ AnsiQuotedStr(ptab,chr(39));
  idados.Open;

  with TIdf_py.create(self) do
   Begin
    wmax := Get_seq(pCLI,pProj,pclass) + 10;
    If Get_atrib(pCLI,pProj,pclass,pCod) then
     exit;
    free;
   end;

  // ..tenta incluir o atributo a partir da Tabela IDF_DADOS...
   Begin
    result := false;
    sql.clear;
    fclient.active := false;
    sql.Text := 'INSERT INTO IDF_PY (CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,PROP_TIPO,PROP_DEFAULT,PROP_VISIBIL'+
                ',IDF_SEQ,IDF_DESIGNACAO,IDF_TIPO_ATIVIDADE)'+
                ' VALUES ('+
                inttostr(pcli)+','+inttostr(pProj)+',' +inttostr(pCod)+','
                +inttostr(pClass)+','+AnsiquotedStr(idados.fieldbyname('IDF_DATA_TYPE').ASSTRING,chr(39))+','
                +AnsiquotedStr(idados.fieldbyname('IDF_DEFAULT_VALUE').ASSTRING,chr(39))+',' +
                AnsiQuotedStr('Published',chr(39))+','+INTTOSTR(WmAX)+','+
                AnsiquotedStr(idados.fieldbyname('IDF_DESIGNACAO').ASSTRING,chr(39))+','
                + AnsiquotedStr('PY',chr(39))+')';


   // sql.SaveToFile('c:\sql.txt');
    execsql;
    If Rowsaffected > 0 then
     result := true
    end;

 end;



procedure TIdf_py.AftrPost(dataSet: TdataSet);
begin

   self.fClient.ApplyUpdates(0);

end;

procedure TIdf_py.BefrPost(dataset: Tdataset);
var
ide : Tdados_tab;
wcod,cli,prj : integer;
begin
  inherited;
  If  Dataset.fieldbyname('IDF_CODIGO').asinteger = 0 then
   Begin
      cli := SELF.CLI_ID;
      prj := SELF.PRJ_ID;
      try
       ide := Tdados_tab.create(self);
       ide.CLI_ID := CLI;
       ide.PRJ_ID := PRJ;
       wCod := ide.get_maxkey('IDF_PY') + 1;
     finally
      freeandnil(iDe);
     end;
     Dataset.fieldbyname('IDF_CODIGO').asinteger := wcod;
     Dataset.fieldbyname('CLI_ID').asinteger := CLI;
     Dataset.fieldbyname('PRJ_ID').asinteger := PRJ;
     Dataset.fieldbyname('CLASS_ID').asinteger := SELF.CLASS_ID;

   end;

end;


function Tidf_py.Get_all : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_PY');
 open;
 If not eof then
    Result := true;
end;

constructor Tidf_py.Create ;
begin
 inherited create(application);

 inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    AggregatesActive  := true;
   end;
   Dataext.DataSet     := fClient;
   fClient.AfterPost   := AftrPost;
   fClient.BeforePost  := BefrPost;
   fClient.AfterDelete := AftrPost;
end;




{Tidf_mt Métodos}

procedure Tidf_mt.AftrScroll(DataSet: TDataSet);
begin
      MET_VISIBIL               := DataSet.fieldbyname('MET_VISIBIL').asstring;
      MET_NOME                  := DataSet.fieldbyname('MET_NOME').asstring;
      MET_COMENT                := DataSet.fieldbyname('MET_COMENT').asstring;
      LCK                       := DataSet.fieldbyname('LCK').asstring;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      CLASS_ID                  := DataSet.fieldbyname('CLASS_ID').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      IDF_TIPO                  := DataSet.fieldbyname('IDF_TIPO').asstring;
end;

function Tidf_mt.Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_MT');
 sql.add('SET ');
 sql.add('IDF_DEL = '+#39+IDF_DEL+#39+',');
 sql.add('IDF_DESIGNACAO = '+#39+IDF_DESIGNACAO+#39+',');
 sql.add('IDF_DIRETORIO = '+#39+IDF_DIRETORIO+#39+',');
 sql.add('IDF_OBJETIVO = '+#39+IDF_OBJETIVO+#39+',');
 sql.add('IDF_RESPONSAVEL = '+#39+IDF_RESPONSAVEL+#39+',');
 sql.add('IDF_TIPO_ATIVIDADE = '+#39+IDF_TIPO_ATIVIDADE+#39+',');
 sql.add('IDF_VERSAO = '+#39+IDF_VERSAO+#39+',');
 sql.add('IDF_VERSAO_DATA = '+#39+formatdatetime('yyyy/mm/dd',IDF_VERSAO_DATA)+#39+',');
 sql.add('IDF_VISIBLE = '+#39+IDF_VISIBLE+#39+',');
 sql.add('IDG_ID = '+IntToStr(IDG_ID)+',');
 sql.add('LCK = '+#39+LCK+#39+',');
 sql.add('MET_COMENT = '+#39+MET_COMENT+#39+',');
 sql.add('MET_NOME = '+#39+MET_NOME+#39+',');
 sql.add('IDF_TIPO = '+#39+IDF_TIPO+#39+',');
 sql.add('MET_VISIBIL = '+#39+MET_VISIBIL+#39);
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO)+' AND ');
 sql.add('CLASS_ID = '+IntToStr(pCLASS_ID));
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;


function Tidf_mt.Inclui : boolean;
VAR
Wkey,wcli,wproj,wseq,WcLASS : integer;
iMet : TIdf_mt;
begin
 DecimalSeparator := '.';
 result := false;

   iMet := TIdf_mt.create(application);
   try
    iMet.CLI_ID := CLI_ID;
    iMet.PRJ_ID := PRJ_ID;
    iMet.CLASS_ID := IDF_CODIGO;
    If iMet.Get_ObjectByDesc(CLI_ID,PRJ_ID,CLASS_ID,MET_NOME) then
       exit;

   finally
    freeandnil(iMet);
   end;

 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   WcLASS := class_id;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     CLASS_ID := WCLASS;
     wkey := get_maxkey('IDF_MT') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
  with TIdf_mt.create(application) do
   begin
    wseq :=  get_Seq(wcli,wproj,wclass) + 10;
    free;
   end;

 close;
 sql.clear;
 sql.add('INSERT INTO IDF_MT ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('CLASS_ID,');
 sql.add('IDF_SEQ,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('LCK,');
 sql.add('MET_COMENT,');
 sql.add('MET_NOME,');
 sql.add('IDF_TIPO,');
 sql.add('IDF_METTYPE,');
 sql.add('MET_VISIBIL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(CLASS_ID)+''+',');
 sql.add(''+InttoStr(WSEQ)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''''+IDF_OBJETIVO+''''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''''+LCK+''''+',');
 sql.add(''''+MET_COMENT+''''+',');
 sql.add(''''+MET_NOME+''''+',');
 sql.add(''''+IDF_TIPO+''''+',');
 sql.add(''''+IDF_METTYPE+''''+',');
 sql.add(''''+MET_VISIBIL+'''');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_mt.get_ObjectbyDesc(pCLI_ID : integer ;pPRJ_ID,pClass : integer ;pDesc : string ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_MT');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pClass)+''+' AND ');
 sql.add('MET_NOME = '+''''+Uppercase(pdesc)+'''');
 open;
 If not eof then
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function Tidf_mt.get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_MT');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pCLASS_ID)+'');
 open;
 If not eof then
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;



function Tidf_mt.Delete_ObjetoDaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pCLASS_ID : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('DELETE FROM IDF_MT');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pCLASS_ID)+'');
 execsql;
 If RowsAffected >0then
   begin
    With TIdf_pr.create(application) do
     begin
      DEL_ORFAOS(pCli_id,pPrj_id);
      free;
     end;
     Result := true;
   end;

// aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function Tidf_mt.Delete_orfao(pCLI_ID : integer ;pPRJ_ID : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('DELETE FROM IDF_MT');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('NOT EXISTS ( SELECT * FROM IDF_CS C WHERE C.CLI_ID = CLI_ID AND C.PRJ_ID = PRJ_ID AND C.IDF_CODIGO = CLASS_ID)');
 execsql;
 If RowsAffected >0then
   begin
    With TIdf_pr.create(application) do
     begin
      DEL_ORFAOS(pCli_id,pPrj_id);
      free;
     end;
     Result := true;
   end;

// aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function Tidf_mt.Get_all : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_MT');
 open;
 If not eof then
    Result := true;
end;

function Tidf_mt.get_MetodosdaClasse(pCLI_ID : integer ;pPRJ_ID : integer ;pCLASS_ID : integer ) : boolean;
 Begin
 result := false;
 close;
 fclient.active := false;
 sql.clear;
 sql.add('SELECT * FROM IDF_MT');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('CLASS_ID = '+''+InttoStr(pCLASS_ID)+'');
 open;
 fclient.Active := true;
 If fclient.IndexDefs.IndexOf('IDF_SEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('IDF_SEQ','IDF_SEQ',[]);
          Items[0].GroupingLevel := 0;
        end;
   end;
  fclient.IndexName := 'IDF_SEQ';

  If not fclient.eof then
      Result := true;

 end;

function TIdf_mt.Get_atrib(pCli,pProj,pClass,pAtrib: integer): boolean;
begin
  result := false;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT * FROM IDF_MT WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' CLASS_ID = '+''+INTTOSTR(pClass)+''+' AND ');
  sql.add(' IDF_CODIGO = '+''+inttostr(pAtrib)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   Begin
  //  IDF_DESCRICAO := fclient.fieldbyname('IDF_DESCRICAO').asstring;
    IDF_CODIGO    := fclient.fieldbyname('IDF_CODIGO').asinteger;
    result := true;
   end;

end;


function TIdf_mt.Get_seq(pCli,pProj,pClass : integer): integer;
begin
  result := 0;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT MAX(IDF_SEQ) AS MAXSEQ FROM IDF_MT WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' CLASS_ID= '+''+INTTOSTR(pClass)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   result := fclient.fieldbyname('MAXSEQ').asinteger;
end;


function TIdf_mt.incluiObj(pCli,pProj,pcod,pclass: integer): boolean;
var
wmax : integer;
idad : Tdad;
begin
  result := false;
  with TIdf_py.create(self) do
   Begin
    wmax := Get_seq(pCLI,pProj,pclass) + 10;
    If Get_atrib(pCLI,pProj,pclass,pCod) then
     exit;
    free;
   end;

  // ..tenta incluir o atributo a partir da Tabela IDF_DADOS...
   Begin
    result := false;
    sql.clear;
    fclient.active := false;
    sql.add('INSERT INTO IDF_MT (');
    sql.add('CLI_ID,IDF_CODIGO,PRJ_ID,CLASS_ID,MET_VISIBIL');
    sql.add(',IDF_SEQ,IDF_DESIGNACAO,IDF_OBJETIVO,IDF_TIPO_ATIVIDADE)');

    sql.add(' SELECT CLI_ID,IDF_CODIGO,PRJ_ID,');
    sql.add(''+inttostr(pClass)+''+',');
    sql.add(' IDF_DATA_TYPE,IDF_DEFAULT_VALUE,');
    sql.add(''''+'+'+''''+',');
   // sql.add('IDF_DOMINIO ');
    sql.add(''+inttostr(wmax)+''+',');
    sql.add(' IDF_DESIGNACAO,');
    sql.add(''''+' '+''''+','+''''+'MT'+'''');
    sql.add(' FROM IDF_DADOS  ');
    SQL.ADD(' WHERE CLI_ID = '+''+INTTOSTR(SELF.CLI_ID)+'');
    SQL.ADD(' AND PRJ_ID = ' + ''+INTTOSTR(SELF.PRJ_ID)+'');
    sql.add(' AND IDF_CODIGO = '+''+INTTOSTR(SELF.IDF_CODIGO)+'');

    //sql.SaveToFile('c:\sql.txt');
    execsql;
    If Rowsaffected > 0 then
     result := true
    end;

 end;



procedure TIdf_mt.AftrPost(dataSet: TdataSet);
begin

   self.fClient.ApplyUpdates(0);

end;

procedure TIdf_mt.BefrPost(dataset: Tdataset);
var
ide : Tdados_tab;
wcod,cli,prj : integer;
begin
  inherited;
  If  Dataset.fieldbyname('IDF_CODIGO').asinteger = 0 then
   Begin
      cli := self.CLI_ID;
      prj := PRJ_ID;
      try
       ide := Tdados_tab.create(self);
       ide.CLI_ID := CLI;
       ide.PRJ_ID := PRJ;
       wCod := ide.get_maxkey('IDF_MT') + 1;
     finally
      freeandnil(iDe);
     end;
     Dataset.fieldbyname('IDF_CODIGO').asinteger := wcod;
     Dataset.fieldbyname('CLI_ID').asinteger := CLI;
     Dataset.fieldbyname('PRJ_ID').asinteger := PRJ;
     Dataset.fieldbyname('CLASS_ID').asinteger := CLASS_ID;

   end;

end;



constructor Tidf_mt.Create ;
begin
 inherited create(application);
 inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    AggregatesActive  := true;
   end;
   Dataext.DataSet     := fClient;
   fClient.AfterPost   := AftrPost;
   fClient.BeforePost  := BefrPost;
   fClient.AfterDelete := AftrPost;

end;


 { eventos de negócio}

constructor Tidf_en.Create ;
begin
 inherited create(application);

end;

function Tidf_en.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_EN') + 1;
    FREE;
  end;
  IDF_CODIGO := WKEY;


 sql.clear;
 sql.add('INSERT INTO IDF_EN ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_ID,');
 sql.add('IDF_ID_FISICO,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_PERIOD_EVENTO_TEMPORA,');
 sql.add('IDF_PRE_REQUISITOS,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_TIPO_IMPLEMENT,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('SUB_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,chr(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''''+IDF_PERIOD_EVENTO_TEMPORA+''''+',');
 sql.add(AnsiQuotedStr(IDF_PRE_REQUISITOS,chr(39))+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(AnsiQuotedStr(IDF_TIPO_IMPLEMENT,chr(39))+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
 //SQL.SAVETOFILE('C:\SQL.TXT');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;


{ insert junçào}

constructor Tidf_ju.Create ;
begin
 inherited create(application);

end;


function Tidf_ju.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_JU') + 1;
    FREE;
  end;
  IDF_CODIGO := WKEY;

 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_JU ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_ID,');
 sql.add('IDF_ID_FISICO,');
 sql.add('IDF_LOGICA,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('SUB_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''''+IDF_LOGICA+''''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,chr(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

 { REGRAS DE NEGOCIO}
constructor Tidf_rn.Create ;
begin
 inherited create(application);

end;

{function Tidf_rn.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_RN') + 1;
    FREE;
  end;
  IDF_CODIGO := WKEY;
TRY
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_RN ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_FORMALIZACAO,');
 sql.add('IDF_ID,');
 sql.add('IDF_ID_FISICO,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_REGRA_EXCECAO,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_TIPO_IMPLEMENT,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_USE_CASE_ACTOR_TYPE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('SUB_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(AnsiQuotedStr(IDF_CLASSEOBJETO,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_DEL,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DIRETORIO,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_FORMALIZACAO,CHR(39))+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(AnsiQuotedStr(IDF_NOME,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,CHR(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(AnsiQuotedStr(IDF_REGRA_EXCECAO,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_RESPONSAVEL,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_TIPO_ATIV,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_TIPO_ATIVIDADE,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_TIPO_IMPLEMENT,CHR(39))+',');
 sql.add(AnsiQuotedStr(formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE),CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_USE_CASE_ACTOR_TYPE,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_VERSAO,CHR(39))+',');
 sql.add(AnsiQuotedStr(formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA),CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_VISIBLE,CHR(39))+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
{ sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(CHR(34)+IDF_DESCRICAO+CHR(34)+',');
 sql.add(chr(34)+IDF_DESIGNACAO+chr(34)+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''''+IDF_FORMALIZACAO+''''+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(CHR(34)+IDF_OBJETIVO+CHR(34)+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(CHR(34)+IDF_REGRA_EXCECAO+CHR(34)+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+IDF_TIPO_IMPLEMENT+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_USE_CASE_ACTOR_TYPE+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+''); }
{ sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
EXCEPT
   //sql.SaveToFile('c:\sql.txt');
   raise;
END;
end;}

function Tidf_rn.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_RN') + 1;
    FREE;
  end;
  IDF_CODIGO := WKEY;
TRY
 close;
 sql.clear;
 sql.Text := 'INSERT INTO IDF_RN '+
 '('+
 'CLI_ID,'+
 'PRJ_ID,'+
 'IDF_CODIGO,'+
 'ATIVIDADE_MAE,'+
 'IDF_CLASSEOBJETO,'+
 'IDF_DEL,'+
 'IDF_DESCRICAO,'+
 'IDF_DESIGNACAO,'+
 'IDF_DIRETORIO,'+
 'IDF_FORMALIZACAO,'+
 'IDF_ID,'+
 'IDF_ID_FISICO,'+
 'IDF_NOME,'+
 'IDF_OBJETIVO,'+
 'IDF_OI,'+
 'IDF_REGRA_EXCECAO,'+
 'IDF_RESPONSAVEL,'+
 'IDF_TIPO_ATIV,'+
 'IDF_TIPO_ATIVIDADE,'+
 'IDF_TIPO_IMPLEMENT,'+
 'IDF_UPDATE_DATE,'+
 'IDF_USE_CASE_ACTOR_TYPE,'+
 'IDF_VERSAO,'+
 'IDF_VERSAO_DATA,'+
 'IDF_VISIBLE,'+
 'IDG_ID,'+
 'SUB_ID,'+
 'SUB_NIVEL'+
 ')'+
 'VALUES'+
 '('+
InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,CHR(39))+','+
AnsiQuotedStr(IDF_DEL,CHR(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,CHR(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DIRETORIO,CHR(39))+','+
AnsiQuotedStr(IDF_FORMALIZACAO,CHR(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_NOME,CHR(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,CHR(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_REGRA_EXCECAO,CHR(39))+','+
AnsiQuotedStr(IDF_RESPONSAVEL,CHR(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,CHR(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,CHR(39))+','+
AnsiQuotedStr(IDF_TIPO_IMPLEMENT,CHR(39))+','+
AnsiQuotedStr(formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE),CHR(39))+','+
AnsiQuotedStr(IDF_USE_CASE_ACTOR_TYPE,CHR(39))+','+
AnsiQuotedStr(IDF_VERSAO,CHR(39))+','+
AnsiQuotedStr(formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA),CHR(39))+','+
AnsiQuotedStr(IDF_VISIBLE,CHR(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+ ')';


 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
EXCEPT
   sql.SaveToFile('c:\sql.txt');
   raise;
END;
end;


function Tidf_ca.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_CA') + 1;
    FREE;
  end;
  IDF_CODIGO := WKEY;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_CA ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
// sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_ACTOR_ROLE,');
// sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_COMPETENCIA,');
 sql.add('IDF_COND_TRABALHO,');
 sql.add('IDF_CONHECIMENTO,');
 sql.add('IDF_CUSTO_ANUAL,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_EFETIVO_DA_CLASSE,');
 sql.add('IDF_ESPECIALIZACAO,');
 sql.add('IDF_EXPERIENCA,');
 sql.add('IDF_FORMACAO,');
 sql.add('IDF_FUNCAO_NIVEL,');
 //sql.add('IDF_ID,');
// sql.add('IDF_ID_FISICO,');
 sql.add('IDF_JORNADA_ANUAL,');
 sql.add('IDF_JORNADA_PADRAO,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_QUANTIDADE_TURNOS,');
 sql.add('IDF_REPONSABILIDADE,');
 sql.add('IDF_RESPONSAVEL,');
// sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_USE_CASE_ACTOR_TYPE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID');
 //sql.add('SUB_ID,');
// sql.add('SUB_NIVEL');  }
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
// sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_ACTOR_ROLE+''''+',');
// sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(AnsiQuotedStr(IDF_COMPETENCIA,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_COND_TRABALHO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_CONHECIMENTO,chr(39))+',');
 sql.add(''+FloattoStr(IDF_CUSTO_ANUAL)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''+FloattoStr(IDF_EFETIVO_DA_CLASSE)+''+',');
 sql.add(AnsiQuotedStr(IDF_ESPECIALIZACAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_EXPERIENCA,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_FORMACAO,chr(39))+',');
 sql.add(''''+IDF_FUNCAO_NIVEL+''''+',');
// sql.add(''+InttoStr(IDF_ID)+''+',');
// sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''+FloattoStr(IDF_JORNADA_ANUAL)+''+',');
 sql.add(''+FloattoStr(IDF_JORNADA_PADRAO)+''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,chr(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''+FloattoStr(IDF_QUANTIDADE_TURNOS)+''+',');
 sql.add(AnsiQuotedStr(IDF_REPONSABILIDADE,chr(39))+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
// sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_USE_CASE_ACTOR_TYPE+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+'');
// sql.add(''+InttoStr(SUB_ID)+''+',');
// sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
// sql.SaveToFile('c:\sql.txt');
 execsql;

 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

constructor Tidf_ca.Create ;
begin
 inherited create(application);

end;

function Tidf_dg.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin
DecimalSeparator := '.';
 result := false;
 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_DG') + 1;
    FREE;
  end;

 IDF_CODIGO := WKEY;
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_DG ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,',);
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_MEDIA,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_UNIDADE_TEMPO,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDF_VOLUME_PROC,');
 sql.add('IDF_VOLUME_PROC1,');
 sql.add('IDF_VOLUME_PROC2,');
 sql.add('IDG_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,CHR(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''''+IDF_MEDIA+''''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,chr(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+IDF_UNIDADE_TEMPO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+FloattoStr(IDF_VOLUME_PROC)+''+',');
 sql.add(''+InttoStr(IDF_VOLUME_PROC1)+''+',');
 sql.add(''+InttoStr(IDF_VOLUME_PROC2)+''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
//sql.savetofile('c:\sql.txt');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

constructor Tidf_dg.Create ;
begin
 inherited create(application);

end;



function Tidf_lf.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin


 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_LF') + 1;
    FREE;
  end;

 IDF_CODIGO := WKEY;
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_LF ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_CUSTOAMBIENTE,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_ID,');
 sql.add('IDF_ID_FISICO,');
 sql.add('IDF_LOCALIZACAO_FISICA,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('SUB_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''+FloattoStr(IDF_CUSTOAMBIENTE)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,CHR(39))+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''''+IDF_LOCALIZACAO_FISICA+''''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,CHR(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;


constructor Tidf_lf.Create ;
begin
 inherited create(application);

end;

function Tidf_se.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin

 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_SE') + 1;
    FREE;
  end;

 IDF_CODIGO := WKEY;
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_SE ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('IDF_CODIGO,');
 sql.add('ATIVIDADE_MAE,');
 sql.add('IDF_CLASSEOBJETO,');
 sql.add('IDF_COD_APLIC,');
 sql.add('IDF_CUSTO_TEC,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESCRICAO,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_ID,');
 sql.add('IDF_ID_FISICO,');
 sql.add('IDF_NOME,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_OI,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_SIGLA,');
 sql.add('IDF_TIPO_ATIV,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_UPDATE_DATE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('SUB_ID,');
 sql.add('SUB_NIVEL');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+InttoStr(ATIVIDADE_MAE)+''+',');
 sql.add(''''+IDF_CLASSEOBJETO+''''+',');
 sql.add(''+InttoStr(IDF_COD_APLIC)+''+',');
 sql.add(''+FloattoStr(IDF_CUSTO_TEC)+''+',');
 sql.add(''''+IDF_DEL+''''+',');
 sql.add(AnsiQuotedStr(IDF_DESCRICAO,CHR(39))+',');
 sql.add(''''+IDF_DESIGNACAO+''''+',');
 sql.add(''''+IDF_DIRETORIO+''''+',');
 sql.add(''+InttoStr(IDF_ID)+''+',');
 sql.add(''+InttoStr(IDF_ID_FISICO)+''+',');
 sql.add(''''+IDF_NOME+''''+',');
 sql.add(AnsiQuotedStr(IDF_OBJETIVO,CHR(39))+',');
 sql.add(''+InttoStr(IDF_OI)+''+',');
 sql.add(''''+IDF_RESPONSAVEL+''''+',');
 sql.add(''''+IDF_SIGLA+''''+',');
 sql.add(''''+IDF_TIPO_ATIV+''''+',');
 sql.add(''''+IDF_TIPO_ATIVIDADE+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_UPDATE_DATE)+''''+',');
 sql.add(''''+IDF_VERSAO+''''+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(''''+IDF_VISIBLE+''''+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(''+InttoStr(SUB_ID)+''+',');
 sql.add(''+InttoStr(SUB_NIVEL)+'');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

constructor Tidf_se.Create ;
begin
 inherited create(application);

end;


{Tidf_tx Métodos}



function Tidf_tx.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin

 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('IDF_TX') + 1;
    FREE;
  end;

 IDF_CODIGO := WKEY;
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO IDF_TX ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('IDF_BD,');
 sql.add('IDF_CODIGO,');
 sql.add('IDF_CUSTO_LIC,');
 sql.add('IDF_CUSTO_MANUT,');
 sql.add('IDF_CUSTO_OUTROS,');
 sql.add('IDF_DEL,');
 sql.add('IDF_DESIGNACAO,');
 sql.add('IDF_DIRETORIO,');
 sql.add('IDF_FORNECEDOR,');
 sql.add('IDF_IMPLANTACAO,');
 sql.add('IDF_OBJETIVO,');
 sql.add('IDF_RESPONSAVEL,');
 sql.add('IDF_TIPO_ATIVIDADE,');
 sql.add('IDF_VERSAO,');
 sql.add('IDF_VERSAO_DATA,');
 sql.add('IDF_VISIBLE,');
 sql.add('IDG_ID,');
 sql.add('LCK,');
 sql.add('PRJ_ID');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(AnsiQuotedStr(IDF_BD,chr(39))+',');
 sql.add(''+InttoStr(IDF_CODIGO)+''+',');
 sql.add(''+FloattoStr(IDF_CUSTO_LIC)+''+',');
 sql.add(''+FloattoStr(IDF_CUSTO_MANUT)+''+',');
 sql.add(''+FloattoStr(IDF_CUSTO_OUTROS)+''+',');
 sql.add(AnsiQuotedStr(IDF_DEL,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_DIRETORIO,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_FORNECEDOR,chr(39))+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_IMPLANTACAO)+''''+',');
 sql.add(''''+IDF_OBJETIVO+''''+',');
 sql.add(AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+',');
 sql.add(AnsiQuotedStr(IDF_VERSAO,chr(39))+',');
 sql.add(''''+formatdateTime('yyyy/mm/dd',IDF_VERSAO_DATA)+''''+',');
 sql.add(AnsiQuotedStr(IDF_VISIBLE,chr(39))+',');
 sql.add(''+InttoStr(IDG_ID)+''+',');
 sql.add(AnsiQuotedStr(LCK,chr(39))+',');
 sql.add(''+InttoStr(PRJ_ID)+'');
 sql.add(')');
 //sql.Savetofile('C:\SQL.TXT');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;



constructor Tidf_tx.Create ;
begin
 inherited create(application);
end;
 
{Tti_req Métodos}


function Tti_req.Inclui : boolean;
var
wkey,wcli,wproj : integer;
begin

 close;
 wcli  := CLI_ID;
 wproj := PRJ_ID;

 with Tdados_tab.Create(self) do
  begin
    CLI_ID := WCLI;
    PRJ_ID:= wproj;
    wkey := get_maxkey('TI_REQ') + 1;
    FREE;
  end;

 IDF_CODIGO := WKEY;
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('INSERT INTO TI_REQ ');
 sql.add('(');
 sql.add('CLI_ID,');
 sql.add('PRJ_ID,');
 sql.add('TI_CODIGO,');
 sql.add('TI_SEQ,');
 sql.add('TI_ALTERNATE,');
 sql.add('TI_PESO_AP,');
 sql.add('TI_PESO_PG,');
 sql.add('TI_PESO_RN,');
 sql.add('TI_REQ_AP,');
 sql.add('TI_REQ_PG,');
 sql.add('TI_REQ_RN,');
 sql.add('IDF_CODIGO');
 sql.add(')');
 sql.add('VALUES');
 sql.add('(');
 sql.add(''+InttoStr(CLI_ID)+''+',');
 sql.add(''+InttoStr(PRJ_ID)+''+',');
 sql.add(''+InttoStr(TI_CODIGO)+''+',');
 sql.add(''+InttoStr(TI_SEQ)+''+',');
 sql.add(AnsiQuotedStr(TI_ALTERNATE,chr(39))+ ',');
 sql.add(''+InttoStr(TI_PESO_AP)+''+',');
 sql.add(''+InttoStr(TI_PESO_PG)+''+',');
 sql.add(''+InttoStr(TI_PESO_RN)+''+',');
 sql.add(AnsiQuotedStr(TI_REQ_AP,chr(39))+',');
 sql.add(AnsiQuotedStr(TI_REQ_PG,chr(39))+',');
 sql.add(AnsiQuotedStr(TI_REQ_RN,chr(39))+',');
 sql.add(''+InttoStr(IDF_CODIGO)+'');
 sql.add(')');
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;


constructor Tti_req.Create ;
begin
 inherited create(application);

end;

{Tidf_oi Métodos}


function Tidf_oi.Inclui : boolean ;
VAR
Wkey,wcli,wproj : integer ;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_OI') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_OI('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_DE_REPET,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_DIRETORIO,'+
'IDF_DISTRIBUICAO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_MINIESPECIFICACAO,'+
'IDF_NAMING_PREFIX,'+
'IDF_NOME,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_TELADIR,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL'+
') '+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
InttoStr(IDF_DE_REPET)+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
AnsiQuotedStr(IDF_DISTRIBUICAO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_MINIESPECIFICACAO,chr(39))+','+
AnsiQuotedStr(IDF_NAMING_PREFIX,chr(39))+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_TELADIR,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
')';
//sql.SaveToFile('c:\sql.txt');
 execsql;
 If rowsaffected > 0 then
    Result := true;
 DecimalSeparator := ',';
end;



constructor Tidf_oi.Create ;
begin
 inherited create(application);

end;

{Tidf_ev Métodos}


function Tidf_ev.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_EV') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_EV('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_MINIESPECIFICACAO,'+
'IDF_NOME,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_TELADIR,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_MINIESPECIFICACAO,chr(39))+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_TELADIR,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
 ' ) ';

 execsql;

 If rowsaffected > 0 then
    Result := true;
 DecimalSeparator := ',';
end;



constructor Tidf_ev.Create ;
begin
 inherited create(application);

end;

{Tidf_dados Métodos}


function Tidf_dados.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
wtab : string;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 wcli  := CLI_ID;
 wproj := PRJ_ID;
 wtab := IDF_TABELA;
 

 If Idf_codigo = 0 then ;
  begin

   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_DADOS') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;

sql.text := 'INSERT INTO IDF_DADOS('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'IDF_CAPTION,'+
'IDF_DATA_TYPE,'+
'IDF_DE_REPET,'+
'IDF_DECIMAL,'+
'IDF_DEFAULT_VALUE,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_DOMINIO,'+
'IDF_NAMING_PREFIX,'+
'IDF_NATUREZA,'+
'IDF_NOME,'+
'IDF_NORMALIZE,'+
'IDF_OBRIG,'+
'IDF_PK,'+
'IDF_SEQ,'+
'IDF_TABELA,'+
'IDF_TYPE_QUALIFIERS,'+
'IDF_VISIBLE,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
AnsiQuotedStr(IDF_CAPTION,chr(39))+','+
AnsiQuotedStr(IDF_DATA_TYPE,chr(39))+','+
InttoStr(IDF_DE_REPET)+','+
InttoStr(IDF_DECIMAL)+','+
AnsiQuotedStr(IDF_DEFAULT_VALUE,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DOMINIO,chr(39))+','+
AnsiQuotedStr(IDF_NAMING_PREFIX,chr(39))+','+
AnsiQuotedStr(IDF_NATUREZA,chr(39))+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_NORMALIZE,chr(39))+','+
AnsiQuotedStr(IDF_OBRIG,chr(39))+','+
InttoStr(IDF_PK)+','+
InttoStr(IDF_SEQ)+','+
AnsiQuotedStr(IDF_TABELA,chr(39))+','+
AnsiQuotedStr(IDF_TYPE_QUALIFIERS,chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(SUB_NIVEL)+
' ) ';

//sql.SaveToFile('c:\sql.txt');
 execsql;
 If rowsaffected > 0 then
    Result := true;
 DecimalSeparator := ',';
end;



constructor Tidf_dados.Create ;
begin
 inherited create(application);

end;
 
{Tidf_if Métodos}


function Tidf_if.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
begin
 // verifica se a tabela já existe ]
 wcli  := CLI_ID;
 wproj := PRJ_ID;
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin

   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_IF') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_IF('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_DIRETORIO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_MEDIA,'+
'IDF_NOME,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UNIDADE_TEMPO,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDF_VOLUME_PROC,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_MEDIA,chr(39))+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(IDF_UNIDADE_TEMPO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
FloattoStr(IDF_VOLUME_PROC)+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
' )' ;
 execsql;
 If rowsaffected > 0 then
    Result := true;
 DecimalSeparator := ',';
end;


constructor Tidf_if.Create ;
begin
 inherited create(application);

end;
 
{Tidf_de Métodos}


function Tidf_de.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_DE') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_DE('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_CONSTRAINT_NAME,'+
'IDF_DATA_TYPE,'+
'IDF_DE_REPET,'+
'IDF_DEFAULT_VALUE,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_DOMINIO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_NAMING_PREFIX,'+
'IDF_NATUREZA,'+
'IDF_NOME,'+
'IDF_NORMALIZE,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_TYPE_QUALIFIERS,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_CONSTRAINT_NAME,chr(39))+','+
AnsiQuotedStr(IDF_DATA_TYPE,chr(39))+','+
InttoStr(IDF_DE_REPET)+','+
AnsiQuotedStr(IDF_DEFAULT_VALUE,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DOMINIO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_NAMING_PREFIX,chr(39))+','+
AnsiQuotedStr(IDF_NATUREZA,chr(39))+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_NORMALIZE,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(IDF_TYPE_QUALIFIERS,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
' )';
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;



constructor Tidf_de.Create ;
begin
 inherited create(application);

end;
 
{Tidf_ps Métodos}


function Tidf_ps.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_PS') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_PS('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CARGO,'+
'IDF_CLASSEOBJETO,'+
'IDF_CLASSIFICACAO_PP,'+
'IDF_COMPLEXIDADE,'+
'IDF_CUSTO_ANUAL,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_DIRETORIO,'+
'IDF_ESTADO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_NOME,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_TEMPO_CONTRATACAO,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'PS_CELULAR,'+
'PS_MAIL,'+
'PS_TEL,'+
'SUB_ID,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CARGO,chr(39))+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_CLASSIFICACAO_PP,chr(39))+','+
AnsiQuotedStr(IDF_COMPLEXIDADE,chr(39))+','+
FloattoStr(IDF_CUSTO_ANUAL)+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
AnsiQuotedStr(IDF_ESTADO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
InttoStr(IDF_TEMPO_CONTRATACAO)+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
AnsiQuotedStr(PS_CELULAR,chr(39))+','+
AnsiQuotedStr(PS_MAIL,chr(39))+','+
AnsiQuotedStr(PS_TEL,chr(39))+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
' )';
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;



constructor Tidf_ps.Create ;
begin
 inherited create(application);

end;
 


 
{Tidf_pr Métodos}

procedure Tidf_pr.AftrScroll(DataSet: TDataSet);
begin
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      IDF_SEQ                   := DataSet.fieldbyname('IDF_SEQ').asinteger;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      PR_TIPO                   := DataSet.fieldbyname('PR_TIPO').asstring;
      PR_NOME                   := DataSet.fieldbyname('PR_NOME').asstring;
      PR_DESCRICAO              := DataSet.fieldbyname('PR_DESCRICAO').asstring;
      IDF_METODO                := DataSet.fieldbyname('IDF_METODO').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
end;

function Tidf_pr.Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_PR');
 sql.add('SET ');
 sql.add('IDF_METODO = '+IntToStr(IDF_METODO)+',');
 sql.add('PR_DESCRICAO = '+#39+PR_DESCRICAO+#39+',');
 sql.add('PR_NOME = '+#39+PR_NOME+#39+',');
 sql.add('PR_TIPO = '+#39+PR_TIPO+#39+',');
 sql.add('IDF_TIPO_ATIVIDADE = '+IDF_TIPO_ATIVIDADE+',');
 sql.add('IDF_SEQ = '+IntToStr(IDF_SEQ)+',');
 sql.add('IDF_DEL = '+IDF_DEL);
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO));
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_pr.Del_Orfaos(pCLI_ID : integer ;pPRJ_ID : integer  ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.text := 'DELETE FROM IDF_PR WHERE CLI_ID = '+INTTOSTR(pCli_id)+
 '  AND PRJ_ID = '+ inttostr(pPrj_id) +
 ' AND NOT EXISTS(SELECT * FROM IDF_MT M WHERE M.CLI_ID = ' + INTTOSTR(pCli_id)+
 '  AND M.PRJ_ID = '+ inttostr(pPrj_id) +' AND M.IDF_CODIGO = IDF_METODO)';
 execsql;
 If rowsaffected > 0 then
    Result := true;
DecimalSeparator := ',';
end;

function TIdf_pr.Get_seq(pCli,pProj,pMetodo : integer): integer;
begin
  result := 0;
  sql.clear;
  fclient.active := false;
  sql.add('SELECT MAX(IDF_SEQ) AS MAXSEQ FROM IDF_PR WHERE ');

  sql.add(' CLI_ID = '+ ''+INTTOSTR(pCli)+''+' AND ');
  sql.add(' PRJ_ID = '+ ''+INTTOSTR(pProj)+''+' AND ');
  sql.add(' IDF_METODO = '+''+INTTOSTR(pMetodo)+'');
  open;
  fclient.active := true;
  If not fclient.Eof then
   result := fclient.fieldbyname('MAXSEQ').asinteger;
end;

function Tidf_pr.Inclui : boolean;
VAR
Wkey,wcli,wproj,wmetodo,wseq : integer;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   wmetodo := IDF_METODO;

   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_PR') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;

with TIdf_pr.create(application) do
 begin
  wseq := Get_seq(wcli,wproj,wmetodo)+1;
  free;
 end;

sql.text := 'INSERT INTO IDF_PR('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'IDF_METODO,'+
'PR_DESCRICAO,'+
'PR_NOME,'+
'PR_TIPO,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_SEQ,'+
'IDF_DEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(IDF_METODO)+','+
AnsiQuotedStr(PR_DESCRICAO,chr(39))+','+
AnsiQuotedStr(PR_NOME,chr(39))+','+
AnsiQuotedStr(PR_TIPO,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
InttoStr(wSEQ)+','+
AnsiQuotedStr(IDF_DEL,chr(39))+
' )';
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;


function Tidf_pr.get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_PR');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+'');
 open;
 If not eof then
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco
end;


function Tidf_pr.get_DoMetodo(pCLI_ID : integer ;pPRJ_ID : integer ;pMetodo : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 fclient.Active := FALSE;
 sql.add('SELECT * FROM IDF_PR');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_METODO = '+''+InttoStr(pmetodo)+'');
 open;
 fclient.Active := true;
 If fclient.IndexDefs.IndexOf('IDF_SEQ') < 0 then
   Begin
      with fClient.IndexDefs do
        begin
          add('IDF_SEQ','IDF_SEQ',[]);
          Items[0].GroupingLevel := 0;

        end;
   end;
  fclient.IndexName := 'IDF_SEQ';
 If not fclient.eof then
      Result := true;

 aftrscroll(self); // Carrega as propriedades com valores do banco
end;

function Tidf_pr.Get_all : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_PR');
 open;
 If not eof then 
    Result := true;
end;

procedure TIdf_PR.BefrPost(dataset: Tdataset);
var
ide : Tdados_tab;
wcod,cli,prj : integer;
begin
  inherited;
  If  Dataset.fieldbyname('IDF_CODIGO').asinteger = 0 then
   Begin
      cli := self.CLI_ID;
      prj := self.PRJ_ID;
      try
       ide := Tdados_tab.create(self);
       ide.CLI_ID := CLI;
       ide.PRJ_ID := PRJ;
       wCod := ide.get_maxkey('IDF_PR') + 1;
     finally
      freeandnil(iDe);
     end;
     Dataset.fieldbyname('IDF_CODIGO').asinteger := wcod;
     Dataset.fieldbyname('CLI_ID').asinteger := CLI;
     Dataset.fieldbyname('PRJ_ID').asinteger := PRJ;
     Dataset.fieldbyname('IDF_METODO').asinteger := IDF_METODO;

   end;

end ;
procedure TIdf_pr.AftrPost(dataSet: TdataSet);
begin

   self.fClient.ApplyUpdates(0);

end;

constructor Tidf_pr.Create ;
begin
 inherited create(application);
 inc(GenCount);

  // databasename     := 'ST';
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);

   with fProvider do
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);
   with fClient do
   begin
    ProviderName     := fProvider.Name;
    Name             := 'CDS'+inttostr(genCount);
    AggregatesActive  := true;
   end;
   Dataext.DataSet     := fClient;
   fClient.AfterPost   := AftrPost;
   fClient.BeforePost  := BefrPost;
   fClient.AfterDelete := AftrPost;

end;


{Set Value}

procedure Tidf_pr.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_pr.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Tidf_pr.SetIDF_TIPO_ATIVIDADE(const value   : STRING );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_pr.SetPR_TIPO(const value   : string );
 begin
  FPR_TIPO := value;
 end;

procedure Tidf_pr.SetPR_NOME(const value   : string );
 begin
  FPR_NOME := value;
 end;

procedure Tidf_pr.SetPR_DESCRICAO(const value   : string );
 begin
  FPR_DESCRICAO := value;
 end;

procedure Tidf_pr.SetIDF_METODO(const value   : integer );
 begin
  FIDF_METODO := value;
 end;

procedure Tidf_pr.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_pr.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_pr.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;










procedure Tidf_ps.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_ps.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_ps.SetPS_TEL(const value   : string );
 begin
  FPS_TEL := value;
 end;

procedure Tidf_ps.SetPS_MAIL(const value   : string );
 begin
  FPS_MAIL := value;
 end;

procedure Tidf_ps.SetPS_CELULAR(const value   : string );
 begin
  FPS_CELULAR := value;
 end;

procedure Tidf_ps.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_ps.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_ps.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_ps.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_ps.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_ps.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_ps.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_ps.SetIDF_TEMPO_CONTRATACAO(const value   : integer );
 begin
  FIDF_TEMPO_CONTRATACAO := value;
 end;

procedure Tidf_ps.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_ps.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_ps.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_ps.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_ps.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_ps.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_ps.SetIDF_ESTADO(const value   : string );
 begin
  FIDF_ESTADO := value;
 end;

procedure Tidf_ps.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_ps.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_ps.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_ps.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_ps.SetIDF_CUSTO_ANUAL(const value   : real );
 begin
  FIDF_CUSTO_ANUAL := value;
 end;

procedure Tidf_ps.SetIDF_COMPLEXIDADE(const value   : string );
 begin
  FIDF_COMPLEXIDADE := value;
 end;

procedure Tidf_ps.SetIDF_CLASSIFICACAO_PP(const value   : string );
 begin
  FIDF_CLASSIFICACAO_PP := value;
 end;

procedure Tidf_ps.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_ps.SetIDF_CARGO(const value   : string );
 begin
  FIDF_CARGO := value;
 end;

procedure Tidf_ps.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_ps.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_ps.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_ps.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_de.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_de.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_de.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_de.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_de.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_de.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_de.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_de.SetIDF_TYPE_QUALIFIERS(const value   : string );
 begin
  FIDF_TYPE_QUALIFIERS := value;
 end;

procedure Tidf_de.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_de.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_de.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_de.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_de.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_de.SetIDF_NORMALIZE(const value   : string );
 begin
  FIDF_NORMALIZE := value;
 end;

procedure Tidf_de.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_de.SetIDF_NATUREZA(const value   : string );
 begin
  FIDF_NATUREZA := value;
 end;

procedure Tidf_de.SetIDF_NAMING_PREFIX(const value   : string );
 begin
  FIDF_NAMING_PREFIX := value;
 end;

procedure Tidf_de.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_de.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_de.SetIDF_DOMINIO(const value   : string );
 begin
  FIDF_DOMINIO := value;
 end;

procedure Tidf_de.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_de.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_de.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_de.SetIDF_DEFAULT_VALUE(const value   : string );
 begin
  FIDF_DEFAULT_VALUE := value;
 end;

procedure Tidf_de.SetIDF_DE_REPET(const value   : integer );
 begin
  FIDF_DE_REPET := value;
 end;

procedure Tidf_de.SetIDF_DATA_TYPE(const value   : string );
 begin
  FIDF_DATA_TYPE := value;
 end;

procedure Tidf_de.SetIDF_CONSTRAINT_NAME(const value   : string );
 begin
  FIDF_CONSTRAINT_NAME := value;
 end;

procedure Tidf_de.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_de.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_de.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_de.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_de.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_if.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_if.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_if.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_if.SetIDF_VOLUME_PROC(const value   : real );
 begin
  FIDF_VOLUME_PROC := value;
 end;

procedure Tidf_if.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_if.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_if.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_if.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_if.SetIDF_UNIDADE_TEMPO(const value   : string );
 begin
  FIDF_UNIDADE_TEMPO := value;
 end;

procedure Tidf_if.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_if.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_if.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_if.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_if.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_if.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_if.SetIDF_MEDIA(const value   : string );
 begin
  FIDF_MEDIA := value;
 end;

procedure Tidf_if.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_if.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_if.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_if.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_if.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_if.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_if.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_if.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_if.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_if.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_if.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_dados.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_dados.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_dados.SetIDF_TYPE_QUALIFIERS(const value   : string );
 begin
  FIDF_TYPE_QUALIFIERS := value;
 end;

procedure Tidf_dados.SetIDF_TABELA(const value   : string );
 begin
  FIDF_TABELA := value;
 end;

procedure Tidf_dados.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Tidf_dados.SetIDF_PK(const value   : integer );
 begin
  FIDF_PK := value;
 end;

procedure Tidf_dados.SetIDF_OBRIG(const value   : string );
 begin
  FIDF_OBRIG := value;
 end;

procedure Tidf_dados.SetIDF_NORMALIZE(const value   : string );
 begin
  FIDF_NORMALIZE := value;
 end;

procedure Tidf_dados.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_dados.SetIDF_NATUREZA(const value   : string );
 begin
  FIDF_NATUREZA := value;
 end;

procedure Tidf_dados.SetIDF_NAMING_PREFIX(const value   : string );
 begin
  FIDF_NAMING_PREFIX := value;
 end;

procedure Tidf_dados.SetIDF_DOMINIO(const value   : string );
 begin
  FIDF_DOMINIO := value;
 end;

procedure Tidf_dados.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_dados.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_dados.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_dados.SetIDF_DEFAULT_VALUE(const value   : string );
 begin
  FIDF_DEFAULT_VALUE := value;
 end;

procedure Tidf_dados.SetIDF_DECIMAL(const value   : integer );
 begin
  FIDF_DECIMAL := value;
 end;

procedure Tidf_dados.SetIDF_DE_REPET(const value   : integer );
 begin
  FIDF_DE_REPET := value;
 end;

procedure Tidf_dados.SetIDF_DATA_TYPE(const value   : string );
 begin
  FIDF_DATA_TYPE := value;
 end;

procedure Tidf_dados.SetIDF_CAPTION(const value   : string );
 begin
  FIDF_CAPTION := value;
 end;

procedure Tidf_dados.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_dados.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_dados.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_ev.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_ev.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_ev.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_ev.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_ev.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_ev.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_ev.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_ev.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_ev.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_ev.SetIDF_TELADIR(const value   : string );
 begin
  FIDF_TELADIR := value;
 end;

procedure Tidf_ev.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_ev.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_ev.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_ev.SetIDF_MINIESPECIFICACAO(const value   : string );
 begin
  FIDF_MINIESPECIFICACAO := value;
 end;

procedure Tidf_ev.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_ev.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_ev.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_ev.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_ev.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_ev.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_ev.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_ev.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_ev.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_ev.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_oi.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_oi.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_oi.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_oi.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_oi.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_oi.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_oi.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_oi.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_oi.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_oi.SetIDF_TELADIR(const value   : string );
 begin
  FIDF_TELADIR := value;
 end;

procedure Tidf_oi.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_oi.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_oi.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_oi.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_oi.SetIDF_NAMING_PREFIX(const value   : string );
 begin
  FIDF_NAMING_PREFIX := value;
 end;

procedure Tidf_oi.SetIDF_MINIESPECIFICACAO(const value   : string );
 begin
  FIDF_MINIESPECIFICACAO := value;
 end;

procedure Tidf_oi.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_oi.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_oi.SetIDF_DISTRIBUICAO(const value   : string );
 begin
  FIDF_DISTRIBUICAO := value;
 end;

procedure Tidf_oi.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_oi.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_oi.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_oi.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_oi.SetIDF_DE_REPET(const value   : integer );
 begin
  FIDF_DE_REPET := value;
 end;

procedure Tidf_oi.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_oi.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_oi.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_oi.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_oi.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tti_req.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tti_req.SetTI_REQ_RN(const value   : string );
 begin
  FTI_REQ_RN := value;
 end;

procedure Tti_req.SetTI_REQ_PG(const value   : string );
 begin
  FTI_REQ_PG := value;
 end;

procedure Tti_req.SetTI_REQ_AP(const value   : string );
 begin
  FTI_REQ_AP := value;
 end;

procedure Tti_req.SetTI_PESO_RN(const value   : integer );
 begin
  FTI_PESO_RN := value;
 end;

procedure Tti_req.SetTI_PESO_PG(const value   : integer );
 begin
  FTI_PESO_PG := value;
 end;

procedure Tti_req.SetTI_PESO_AP(const value   : integer );
 begin
  FTI_PESO_AP := value;
 end;

procedure Tti_req.SetTI_ALTERNATE(const value   : string );
 begin
  FTI_ALTERNATE := value;
 end;

procedure Tti_req.SetTI_SEQ(const value   : integer );
 begin
  FTI_SEQ := value;
 end;

procedure Tti_req.SetTI_CODIGO(const value   : integer );
 begin
  FTI_CODIGO := value;
 end;

procedure Tti_req.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tti_req.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_tx.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_tx.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Tidf_tx.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_tx.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_tx.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_tx.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_tx.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_tx.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_tx.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_tx.SetIDF_IMPLANTACAO(const value   : real );
 begin
  FIDF_IMPLANTACAO := value;
 end;

procedure Tidf_tx.SetIDF_FORNECEDOR(const value   : string );
 begin
  FIDF_FORNECEDOR := value;
 end;

procedure Tidf_tx.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_tx.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_tx.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_tx.SetIDF_CUSTO_OUTROS(const value   : real );
 begin
  FIDF_CUSTO_OUTROS := value;
 end;

procedure Tidf_tx.SetIDF_CUSTO_MANUT(const value   : real );
 begin
  FIDF_CUSTO_MANUT := value;
 end;

procedure Tidf_tx.SetIDF_CUSTO_LIC(const value   : real );
 begin
  FIDF_CUSTO_LIC := value;
 end;

procedure Tidf_tx.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_tx.SetIDF_BD(const value   : string );
 begin
  FIDF_BD := value;
 end;

procedure Tidf_tx.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;


procedure Tidf_py.SetPROP_VISIBIL(const value   : string );
 begin
  FPROP_VISIBIL := value;
 end;

procedure Tidf_py.SetPROP_TIPO(const value   : string );
 begin
  FPROP_TIPO := value;
 end;

procedure Tidf_py.SetPROP_DOMINIO(const value   : string );
 begin
  FPROP_DOMINIO := value;
 end;

procedure Tidf_py.SetPROP_DEFAULT(const value   : string );
 begin
  FPROP_DEFAULT := value;
 end;

procedure Tidf_py.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Tidf_py.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_py.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_py.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_py.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_py.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_py.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Tidf_py.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_py.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_py.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_py.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_py.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_py.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure Tidf_py.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_py.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_py.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_cs.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Tidf_cs.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_cs.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_cs.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_cs.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_cs.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_cs.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_cs.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_cs.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_cs.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_cs.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_cs.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_cs.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_cs.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_cs.SetATRIBUTOS(const Value: TIDF_PY);
begin
  FATRIBUTOS := Value;
end;

procedure Tidf_cs.SetMETODOS(const Value: Tidf_mt);
begin
  FMETODOS := Value;
end;

procedure TTodo.SetCLI_ID(const Value: INTEGER);
begin
  FCLI_ID := Value;
end;

procedure TTodo.SetIDG_ID(const Value: INTEGER);
begin
  FIDG_ID := Value;
end;

procedure TTodo.SetPRJ_ID(const Value: INTEGER);
begin
  FPRJ_ID := Value;
end;

procedure TAP.SetIDF_DURATION_TPU1(const Value: real);
begin
  FIDF_DURATION_TPU1 := Value;
end;

procedure TAP.SetIDF_DURATION_TPU2(const Value: real);
begin
  FIDF_DURATION_TPU2 := Value;
end;

procedure TAP.SetIDF_DE_REPET(const Value: integer);
begin
  FIDF_DE_REPET := Value;
end;

procedure TAP.SetIDF_CUSTO_ANUAL(const Value: real);
begin
  FIDF_CUSTO_ANUAL := Value;
end;

procedure TAP.SetIDF_CUSTO_GERAL(const Value: real);
begin
  FIDF_CUSTO_GERAL := Value;
end;

procedure TAP.SetIDF_CUSTO_MP(const Value: real);
begin
  FIDF_CUSTO_MP := Value;
end;

procedure TAP.SetIDF_CUSTO_TEC(const Value: real);
begin
  FIDF_CUSTO_TEC := Value;
end;

procedure TAP.SetIDF_DIRETORIO(const Value: string);
begin
  FIDF_DIRETORIO := Value;
end;

procedure TAP.SetIDF_TELADIR(const Value: string);
begin
  FIDF_TELADIR := Value;
end;


procedure Tidf_en.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_en.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_en.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_en.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_en.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_en.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_en.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_en.SetIDF_TIPO_IMPLEMENT(const value   : string );
 begin
  FIDF_TIPO_IMPLEMENT := value;
 end;

procedure Tidf_en.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_en.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_en.SetIDF_TIPO(const value   : string );
 begin
  FIDF_TIPO := value;
 end;

procedure Tidf_en.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_en.SetIDF_PRE_REQUISITOS(const value   : string );
 begin
  FIDF_PRE_REQUISITOS := value;
 end;

procedure Tidf_en.SetIDF_PERIOD_EVENTO_TEMPORA(const value   : string );
 begin
  FIDF_PERIOD_EVENTO_TEMPORA := value;
 end;

procedure Tidf_en.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_en.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_en.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_en.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_en.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_en.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_en.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_en.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_en.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_en.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_en.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_en.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_en.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_en.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_ju.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_ju.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_ju.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_ju.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_ju.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_ju.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_ju.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_ju.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_ju.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_ju.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_ju.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_ju.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_ju.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_ju.SetIDF_LOGICA(const value   : string );
 begin
  FIDF_LOGICA := value;
 end;

procedure Tidf_ju.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_ju.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_ju.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_ju.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_ju.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_ju.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_ju.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_ju.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_ju.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_ju.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_rn.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_rn.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_rn.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_rn.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_rn.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_rn.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_rn.SetIDF_USE_CASE_ACTOR_TYPE(const value   : string );
 begin
  FIDF_USE_CASE_ACTOR_TYPE := value;
 end;

procedure Tidf_rn.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_rn.SetIDF_TIPO_IMPLEMENT(const value   : string );
 begin
  FIDF_TIPO_IMPLEMENT := value;
 end;

procedure Tidf_rn.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_rn.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_rn.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_rn.SetIDF_REGRA_EXCECAO(const value   : string );
 begin
  FIDF_REGRA_EXCECAO := value;
 end;

procedure Tidf_rn.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_rn.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_rn.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_rn.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_rn.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_rn.SetIDF_FORMALIZACAO(const value   : string );
 begin
  FIDF_FORMALIZACAO := value;
 end;

procedure Tidf_rn.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_rn.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_rn.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_rn.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_rn.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_rn.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_rn.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_rn.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_rn.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;
 

procedure Tidf_ca.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_ca.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_ca.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_ca.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_ca.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_ca.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_ca.SetIDF_USE_CASE_ACTOR_TYPE(const value   : string );
 begin
  FIDF_USE_CASE_ACTOR_TYPE := value;
 end;

procedure Tidf_ca.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_ca.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_ca.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_ca.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_ca.SetIDF_REPONSABILIDADE(const value   : string );
 begin
  FIDF_REPONSABILIDADE := value;
 end;

procedure Tidf_ca.SetIDF_QUANTIDADE_TURNOS(const value   : real );
 begin
  FIDF_QUANTIDADE_TURNOS := value;
 end;

procedure Tidf_ca.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_ca.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_ca.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_ca.SetIDF_JORNADA_PADRAO(const value   : real );
 begin
  FIDF_JORNADA_PADRAO := value;
 end;

procedure Tidf_ca.SetIDF_JORNADA_ANUAL(const value   : real );
 begin
  FIDF_JORNADA_ANUAL := value;
 end;

procedure Tidf_ca.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_ca.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_ca.SetIDF_FUNCAO_NIVEL(const value   : string );
 begin
  FIDF_FUNCAO_NIVEL := value;
 end;

procedure Tidf_ca.SetIDF_FORMACAO(const value   : string );
 begin
  FIDF_FORMACAO := value;
 end;

procedure Tidf_ca.SetIDF_EXPERIENCA(const value   : string );
 begin
  FIDF_EXPERIENCA := value;
 end;

procedure Tidf_ca.SetIDF_ESPECIALIZACAO(const value   : string );
 begin
  FIDF_ESPECIALIZACAO := value;
 end;

procedure Tidf_ca.SetIDF_EFETIVO_DA_CLASSE(const value   : real );
 begin
  FIDF_EFETIVO_DA_CLASSE := value;
 end;

procedure Tidf_ca.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_ca.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_ca.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_ca.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_ca.SetIDF_CUSTO_ANUAL(const value   : real );
 begin
  FIDF_CUSTO_ANUAL := value;
 end;

procedure Tidf_ca.SetIDF_CONHECIMENTO(const value   : string );
 begin
  FIDF_CONHECIMENTO := value;
 end;

procedure Tidf_ca.SetIDF_COND_TRABALHO(const value   : string );
 begin
  FIDF_COND_TRABALHO := value;
 end;

procedure Tidf_ca.SetIDF_COMPETENCIA(const value   : string );
 begin
  FIDF_COMPETENCIA := value;
 end;

procedure Tidf_ca.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_ca.SetIDF_ACTOR_ROLE(const value   : string );
 begin
  FIDF_ACTOR_ROLE := value;
 end;

procedure Tidf_ca.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_ca.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_ca.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_ca.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_dg.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_dg.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_dg.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_dg.SetIDF_VOLUME_PROC2(const value   : integer );
 begin
  FIDF_VOLUME_PROC2 := value;
 end;

procedure Tidf_dg.SetIDF_VOLUME_PROC1(const value   : integer );
 begin
  FIDF_VOLUME_PROC1 := value;
 end;

procedure Tidf_dg.SetIDF_VOLUME_PROC(const value   : real );
 begin
  FIDF_VOLUME_PROC := value;
 end;

procedure Tidf_dg.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_dg.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_dg.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_dg.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_dg.SetIDF_UNIDADE_TEMPO(const value   : string );
 begin
  FIDF_UNIDADE_TEMPO := value;
 end;

procedure Tidf_dg.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_dg.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_dg.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_dg.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_dg.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_dg.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_dg.SetIDF_MEDIA(const value   : string );
 begin
  FIDF_MEDIA := value;
 end;

procedure Tidf_dg.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_dg.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_dg.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_dg.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_dg.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_dg.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_dg.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_dg.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_dg.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_dg.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_dg.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

 procedure Tidf_lf.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_lf.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_lf.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_lf.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_lf.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_lf.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_lf.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_lf.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_lf.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_lf.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_lf.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_lf.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_lf.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_lf.SetIDF_LOCALIZACAO_FISICA(const value   : string );
 begin
  FIDF_LOCALIZACAO_FISICA := value;
 end;

procedure Tidf_lf.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_lf.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_lf.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_lf.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_lf.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_lf.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_lf.SetIDF_CUSTOAMBIENTE(const value   : real );
 begin
  FIDF_CUSTOAMBIENTE := value;
 end;

procedure Tidf_lf.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_lf.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_lf.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_lf.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_lf.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tidf_se.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_se.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_se.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_se.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_se.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_se.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_se.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_se.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_se.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_se.SetIDF_SIGLA(const value   : string );
 begin
  FIDF_SIGLA := value;
 end;

procedure Tidf_se.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_se.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_se.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_se.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_se.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_se.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_se.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tidf_se.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_se.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_se.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_se.SetIDF_CUSTO_TEC(const value   : real );
 begin
  FIDF_CUSTO_TEC := value;
 end;

procedure Tidf_se.SetIDF_COD_APLIC(const value   : integer );
 begin
  FIDF_COD_APLIC := value;
 end;

procedure Tidf_se.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_se.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_se.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_se.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_se.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;


 

procedure TDiag_dados.SetTOTDIAGRAMAS(const Value: integer);
begin
  FTOTDIAGRAMAS := Value;
end;

procedure Tidf_mt.SetIDF_TIPO(const Value: STRING);
begin
  FIDF_TIPO := Value;
end;

 {Set Value Tmetodos}

procedure TIdf_mt.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure TIdf_mt.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure TIdf_mt.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure TIdf_mt.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure TIdf_mt.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure TIdf_mt.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure TIdf_mt.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure TIdf_mt.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure TIdf_mt.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure TIdf_mt.SetIDF_METBIND(const value   : string );
 begin
  FIDF_METBIND := value;
 end;

procedure TIdf_mt.SetIDF_METDIRECT(const value   : string );
 begin
  FIDF_METDIRECT := value;
 end;

procedure TIdf_mt.SetIDF_METTYPE(const value   : string );
 begin
  FIDF_METTYPE := value;
 end;

procedure TIdf_mt.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure TIdf_mt.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure TIdf_mt.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure TIdf_mt.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure TIdf_mt.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure TIdf_mt.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure TIdf_mt.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure TIdf_mt.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure TIdf_mt.SetMET_COMENT(const value   : string );
 begin
  FMET_COMENT := value;
 end;

procedure TIdf_mt.SetMET_NOME(const value   : string );
 begin
  FMET_NOME := value;
 end;

procedure TIdf_mt.SetMET_VISIBIL(const value   : string );
 begin
  FMET_VISIBIL := value;
 end;


procedure Tidf_py.SetIDF_LISTA(const Value: INTEGER);
begin
  FIDF_LISTA := Value;
end;



procedure Tidf_cs.SetIDF_DIRPROJ(const Value: string);
begin
  FIDF_DIRPROJ := Value;
end;

procedure Tidf_cs.SetIDF_FORM(const Value: string);
begin
  FIDF_FORM := Value;
end;

procedure Tidf_cs.SetIDF_TABELA(const Value: string);
begin
  FIDF_TABELA := Value;
end;

procedure Tidf_cs.SetIDF_UNIT(const Value: string);
begin
  FIDF_UNIT := Value;
end;

procedure Tidf_cs.SetIDF_UNIT_OO(const Value: string);
begin
  FIDF_UNIT_OO := Value;
end;

procedure TDados_tab.VerificaEmpresas();
Var
  Result : integer;
Begin
    Result := 0;
    close;
    sql.clear;
    sql.add('SELECT COUNT(*) AS TOT FROM CLI_CLIENTE');
    open;
    Result := FieldByName('TOT').AsInteger;
    IF Result = 0 then
    Begin
        frm_main.ToolButton1.Enabled := false;
        ShowMessage('Não existe empresa cadastrada'+#13+'favor cadastrá-la.');
    End
    ELSE
    Begin
        frm_main.ToolButton1.Enabled := true;
    End;
End;



end.
