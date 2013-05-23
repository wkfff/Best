unit cls_obj;     // best 6_38

{ pendencias :

criar Get_maxkey
criar get_alldoPai (masterdetail)
}
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls,ComCtrls, DB,IBDatabase,forms,menus,
  strutils,bstdb,AddFlow3Lib_TLB,Activex, OleCtrls,AxCtrls,Buttons,
  ADODb,fonctions,Qrctrls, QuickRpt,math, cls_bd, filectrl,ooseg;

 type
  uDado = ^Tdado;
  Tdado = record
     fClasse    : shortstring;
     Fcli       : integer;
     FProj      : integer;
     FDiag      : integer;
     FNome      : shortstring;
     FDiagId    : shortstring;
  end;

  type
  uLst = ^TLst;
  TLst = record
     eNode    : afNode;
     elnk     : afLink;
     eTipo    : char;  //i : link entrando - o : link saindo
     eObj     : string;
  end;

  type
  uListaObj = ^TListaObj;
  TListaObj = record
     eNode    : afNode;

  end;


TDG = Class(TAddFlow)

   Private
      fProporcProp : integer;  // proporçao propriedades
      fProporcMet : integer;   // proporçao Métodos
      fProporcTitle : integer;  // proporçao Título
      fProporcBase : integer;
      TabInst   : TDados_tab;
      FEntidade : afNode;
      FLink     : afLink;
      FBT_INF   : integer;
      FIDG_PAI  : INTEGER;
      FEMPRESA  : integer;
      FCENARIO  : integer;
      FIDG      : INTEGER;
      FDIAG_ID  : shortstring;
      FIDG_DIR  : shortSTRING;
      FIsOpen: boolean;
    FDG_DADOS: TDiag_dados;
    FCurrent_Lock: integer;
    FEDITAVEL: boolean;
    FNODESELECTED: afNode;
    Fpercacum: real;
    Fcustomo: real;
    FcustAntes: real;
    Fantes: integer;
    FCustoGeral: real;
    FCustoTec: real;
    FCustantesTec: real;
    FCustAntesGeral: real;
    FCustoMP: reaL;
    FCustoAntesMp: real;
    FiEn: Tdados;
    FiAtor: Tdados;
    FiRn: Tdados;
    FiLocal: Tdados;
    FiFunc: Tdados;
    FiAp: Tdados;
    FNOME_DIAGRAMA: STRING;
    FIDF_WBS_CODE: string;
    FABRE_FORMDG: boolean;
    FMYLOCK: BOOLEan;

      procedure AtDblClick(Sender: TObject) ;   //doubleclick entidade diagrama
      function  Get_Objeto : Tdados_tab;
      procedure SetEntidade(const Value: afNode);
      procedure SetLink(const Value: afLink);

      procedure SetBT_INF(const Value: integer);
      procedure SetCENARIO(const Value: integer);
      procedure SetDIAG_ID(const Value: shortstring);
      procedure SetEMPRESA(const Value: integer);
      procedure SetIDG(const Value: INTEGER);
      procedure SetIDG_DIR(const Value: shortSTRING);
      procedure SetIDG_PAI(const Value: INTEGER);
      procedure SetIsOpen(const Value: boolean);
      procedure Cria_SubAnt(pNode: afNode; pCria: Boolean);
    procedure SetDG_DADOS(const Value: TDiag_dados);
    procedure SetCurrent_Lock(const Value: integer);
    procedure WMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SetEDITAVEL(const Value: boolean);
    procedure SetNODESELECTED(const Value: afNode);
    procedure Setcustomo(const Value: real);
    procedure Setpercacum(const Value: real);
    procedure Deleta_PercCorrelacao(pLink: afLink);
    procedure Mostrar_Pessoas(pNode: afNode);
    procedure SetcustAntes(const Value: real);
    procedure Setantes(const Value: integer);
    procedure SetCustoGeral(const Value: real);
    procedure SetCustoTec(const Value: real);
    procedure SetCustAntesGeral(const Value: real);
    procedure SetCustantesTec(const Value: real);
    function Abaixa_Objeto(pDg : Tdg;pNode : afNode)  : Tdg;
   

    function ClassList(pList: TList; pNode: afNode): boolean;

    function ClassLink(pList: TList; pLink: afLink): boolean;
    procedure SetCustoAntesMp(const Value: real);
    procedure SetCustoMP(const Value: reaL);
    procedure SetiAp(const Value: Tdados);
    procedure SetiAtor(const Value: Tdados);
    procedure SetiEn(const Value: Tdados);
    procedure SetiFunc(const Value: Tdados);
    procedure SetiLocal(const Value: Tdados);
    procedure SetiRn(const Value: Tdados);
    procedure SetNOME_DIAGRAMA(const Value: STRING);
    procedure SetIDF_WBS_CODE(const Value: string);
    procedure SetABRE_FORMDG(const Value: boolean);
       { move as setas entrando e saindo, quando o Objeto é movido}
    procedure Move_Seta(pNode : afNode;pOffset : integer;pDir : string);
    procedure SetMYLOCK(const Value: BOOLEan);



   published

      property DG_DADOS : TDiag_dados read FDG_DADOS write SetDG_DADOS;
      property Current_Lock : integer read FCurrent_Lock write SetCurrent_Lock;
      property Link : afLink read FLink write SetLink;
      property Entidade : afNode read FEntidade write SetEntidade;
      property Objeto : Tdados_tab read Get_Objeto;
      property BT_INF    : integer read FBT_INF write SetBT_INF;
      property EMPRESA   : integer read FEMPRESA write SetEMPRESA;
      property CENARIO   : integer read FCENARIO write SetCENARIO;
      property IDG       : INTEGER  read FIDG write SetIDG;
      property IDG_PAI   : INTEGER read FIDG_PAI write SetIDG_PAI;
      property DIAG_ID   : shortstring read FDIAG_ID write SetDIAG_ID;
      property IDG_DIR   : SHORTSTRING read FIDG_DIR write SetIDG_DIR;
      property IsOpen : boolean read FIsOpen write SetIsOpen;
      property EDITAVEL : boolean read FEDITAVEL write SetEDITAVEL;
      property NODESELECTED : afNode read FNODESELECTED write SetNODESELECTED;
      property NOME_DIAGRAMA : STRING read FNOME_DIAGRAMA write SetNOME_DIAGRAMA;
      property IDF_WBS_CODE : string read FIDF_WBS_CODE write SetIDF_WBS_CODE;
      //custo
      property customo : real read Fcustomo write Setcustomo;  //custo mao de obra
      property CustoTec: real read FCustoTec write SetCustoTec; //custo tecnologia
      property CustoGeral : real read FCustoGeral write SetCustoGeral;  //custo geral
      property CustoMP    : reaL  read FCustoMP write SetCustoMP;//Custo M.prima
      property custAntes: real  read FcustAntes write SetcustAntes;  //custo mao de obra antes dajuncao
      property CustantesTec : real read FCustantesTec write SetCustantesTec;  //custo tecnologia antes da juncao
      property CustAntesGeral : real  read FCustAntesGeral write SetCustAntesGeral; //custo geral antes da juncao
      property CustoAntesMp   : real read FCustoAntesMp write SetCustoAntesMp;// custo MP antes da junção
      property percacum: real  read Fpercacum write Setpercacum; //percentual acumulado
      property antes : integer read Fantes write Setantes;
      property ABRE_FORMDG : boolean read FABRE_FORMDG write SetABRE_FORMDG;
      proPERTY MYLOCK : BOOLEan read FMYLOCK write SetMYLOCK; // INDICA QUE EU LOCKEI O DIAGRAMA
      { cria objeto contendo % de Passagem, na hora da criaçào da conexào entre JU e AP
          prel : link com o qual é mantida uma correlação; pNode : JU , source do pRel
          wval : Valor do %}
      function cria_Perc(pRel : afLInk; pNode : afNode ; wval : string) : integer;

      { gera lista de todos os nodes saindo(tipo O) ou  entrando(tipo I) do Node OrgNode}
      function Get_Nodes(orgNode: afNode;pTipo : char): TList;
      // true se o diagrama correspondente for vazio
      function IsEmpty (pNo : TTreenode ) : boolean;
      function Abre_diagrama(pNode : TTreeNode) : boolean;
      { decompoe abaixo}
      procedure Abaixo(pEntity : afNode);
      {recompoe acima}
      procedure Acima;
      { salva o diagrma}
      function  Salvar : boolean;
      { CRia bola de identificaçào de use case}
      procedure Cria_Duc(pNode : afNode;pCria : Boolean;
                              pNodeInside : integer;pTop : real;
                              pLeft : real;pWidth : real;
                              pHeight : real;pRel : integer);
      procedure Cria_DucAnt(pNode: afNode; pCria: Boolean;
                            pNodeInside: integer; pTop, pLeft, pWidth, pHeight: real;
                            pRel: integer);
         { mouse up}
      procedure WMouseUp(Sender: TObject; Button: TMouseButton;
                Shift: TShiftState; X, Y: Integer);
       { mouse down}
      procedure WMouseDown(Sender: TObject; Button: TMouseButton;
                 Shift: TShiftState; X, Y: Integer);

       { trata entidade}
      procedure WEntityAdded(pNode : afNode);
      { trata Fluxo de dados}
      function  WRelationAdded (prel : afLink):boolean;

       { Cria os box WBS e Ator na Atividade}
      Procedure cria_Atv(pNode : afNode) ;
      { endireita a seta entre dois nos}
      procedure Ajusta_Seta(pLink : afLink);
      Function  Atrib_Link(pLink : afLink;pDiag : string) : boolean;
       { corige o tamanho do wbs e do ator quando o tamanho da atividade foi alterado}
      procedure Resize_Rigid(pNode : afNode);

      Procedure AddPic(pPos : integer);
      { retorna o wbs da atividade}
      function  Obtem_wbs(pNode : afNode) : afNode;
       { retorna o ator da atividade}
      function  Obtem_Ator(pNode : afNode) : afNode;

         { retorna o tipo de componente da ativiadae : 1--> wbs; 2 : ator}
      function  Tipo_compo(pNode: afNode): integer;
      function  Palette (pgroup : integer) : integer;
      function  Def_Button( pPn : Tpanel;pGroup : integer) : integer;
      function  Carga_Atrib : boolean;
      procedure Salva_Atrib(pDiag : string);
      { retorna a parte baixa da junção : quadraro}
      function  Obtem_Junc(pNode : afNode) : afNode;
      { retorna a parte alta da junção : quadrado  arredondado c/descrição}
      function  Obtem_JuncUp(pNode: afNode): afNode;
      Function  Atributos (pEnt : afNode;pDg : integer;pDiag : string) : boolean;
      Procedure Delete_Componentes(pNode : afNode);
      { DELETA ATIVIDADES}
      procedure Deleta_Ativ(pNode : afnode);
      procedure wKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
      procedure WClick(sender : Tobject);
      procedure DiagExit(Sender: TObject);
      procedure Abre_Objeto;
      procedure Insere_imagem(Sender: TObject);
      procedure Ajusta_Imagem(pAjusta : Boolean);
      procedure Mostra_propriedades;

      Procedure Cria_Junction(pNode : afNode);

      procedure del_Junction(pNode: afNode; pLink: afLink);

      { deleta links}
      procedure Deleta_Dg(pLink: afLink);

      function  Alinha(pTipo: integer): boolean;

      {retorna os fluxos de dados saindo de determina atividade}
      function Get_FluxoOut(pNode: afNode;ptestaJuncao : boolean): TStringList;

      {retorna a atividade origem de determinado fluxo}
      function Get_OrgAtiv(plInk : afLink) : TstringList;

      { gera lista de todos os Fluxos de dados(estímulos) entrando na Atividade}
      function Get_FluxosIn(pNode: afNode): TstringList;

      { gera volume (somatório dos estímulos da atividade)}
      function Get_Volume(pNode: afNode): real;

      { atualiza as descrições dos objetos a partir das tabelas}
      procedure Atualiza_entity;

      { retorna objeto físico conhecendo o código do digrama e o ID da atividade}
      function Get_Node(pDiag: Tdg;pId : integer) : afNode;

      { retorna objeto físico  conhecendo o código do digrama e o ID da atividade eo tipo (shape)}
      function Get_NodeGraph(pDiag : Tdg;pId,pTipo: integer): afNode;

      { verifica se a versão é demo : pDiag se diagrama em criacao; pGraph se obj. garfico}
      function DemoMaior(ptipo : string;pGlobal : boolean) : boolean;

      { carrega os tipos do atributos a partir da tabela PROVIDER_DATA}
      function Carrega_tipo : boolean;

      function Get_property (pdf : Tdg) : boolean;
       { copia seleção de objetos(frame)}
      procedure Cola_sel( pCompleto : boolean;pConfirm : boolean;pABaixo : boolean;IdNode : integer);

       {cola seleção de objetos(frame)}
      procedure Copia_Sel;
       {desmarca todos os objetos de um diagrama}
      procedure Desmarca;

      procedure UnselectAll;

      // devolve todos as atividades iniciais do Diagrama(anterior não é atividade, juncao)
      function Get_Atividadesiniciais: TList;
      // devolve lista de todas as atividades do digrama que não possuem nada após
      function Get_AtividadesFinais: TList;
      // devolve lista de todas as atividades do digrama
      function Get_Atividades: TList;

       { gera lista de todos os objetos selecionaveis do diagrama}
      function Get_ObJetos(): TList;
     // procedure Carrega_obj(pCli, pCen, pId: integer);
      function get_passagem(pCli, pProj, pIdPai, pIdFilho: integer): real;
      function pega_Seguinte(pObj : integer;pTipo : string) : Tdados;



      function pega_primeiras: Tdados;
      procedure Update_Fluxo(pObj,pObjseg : integer;pFluxo ,pFluxAnt,pTipo,pTipoSeg: string;pPer : real);
      function Get_Fluxant(pId : integer;pTipo : string) : Tdados;
      function pega_JU: Tdados;
      procedure Update_FluxAnt(pObj, pObjseg: integer; pFluxAnt, pTipo,pTipoSeg: string; pPer: real);
      procedure Update_Perc;
      function Get_Fluxo(pFluxo: string): Tdados;

      function Atu_percTot(pFluxo : string;pPer : real) : real;

      function Trata_node(pEmpresa,pCenario : integer;pNode : afNode;pCustoAntes,pCustoAntestec,pCustoAntesGeral,pCustoAntesMP,CustoTotal : real;
                        pAntes : integer; pDiag : Tdg;Procexterno : Boolean) : TCusto;

        {retorna objeto físico do percentula de passagem  conhecendo o código do digrama e o ID da atividade}
      function Get_NodePerc(pDiag: Tdg; pId: integer): afNode;

      { consiste o diagrama}
      function Consiste_dg(pCli,pCenario,pId : integer) : boolean;


       //retorna os custos da atividade
     // pTipo : 1 : total;2 : Mobra;3: Tecnologia;4 : Outros
     // pGrava : TRUE : atualiza atividade
     function Get_Custos_ativ(pCli, pProj, pId, pTipo: integer; pGrava: boolean): TCusto;
       { verifica se a atividade é inicial}
     function AtivInicial(pNode: afNode): boolean;

     function Get_NodesEntrando(pNode: afNode; pList: Tlist): TList;

     function Get_NodesSaindo(pNode: afNode; pList: Tlist): TList;

     procedure Cria_Sub(pNode : afNode;pCria : Boolean);

     {retorna a parte mais a direita do digrama}
     function Get_RightDiagrama: integer;

     procedure Inclui_Node(pDg: Tdg);

      { retorna os fluxos de entrada e saida da atividade}
     function Get_Fluxos(tvin, tvout: TTreeView; pNode: afNode): integer;
       {cria as correlações do diagrama recém-decomposto}
     procedure Criar_correl_decomposto(pDg: Tdg; pEntity: afnode);
      { verifica se a atividade pCodigo já existe nos pais do diagrama pIdg =refcircular}
     function Check_Ascendencia(pCli, pCenario, pidg,pCodigo: integer): boolean;


   //U M L ......................

     {cria classe UML}
     function Create_class(pleft,pheight,pTop,pWidth : integer) : afNode;
      { retorna o objeto gráfico das propriedades}
     function Get_attributes(pNode : afnode) : afnode;
      { retorna o objeto gráfico dos métodos}
     function Get_Metodos(pNode : afnode) : afnode;
       { retorna o objeto gráfico doo t'titulo}
     function Get_Title(pNode: afnode): afnode;
      { aplica a cor em todas as partes}
     function Apply_color(pNode: afnode): afnode;
       { deleta o objeto gráfico de classe}
     function Del_class(pNode: afnode): afnode;

   procedure wKeyaction(Key: word; Shift: TShiftState);public


     // Atributos Atividade --> DPN
    WAtv_align     : integer;
    WAtv_Borda     : integer;
    WAtv_EspBorda  : variant;
    WAtv_CorBorda  : TColor;


    WAtv_CorFundo  : TColor;
    WAtv_Fonte     : IFontDisp;
    WAtv_CorFonte  : TColor;
    WAtv_Width     : variant;
    WAtv_Height    : variant;

    WWbs_align     : integer;
    WWbs_Borda     : integer;
    WWbs_EspBorda  : variant;
    WWbs_CorBorda  : TColor;
    WWbs_CorFundo  : TColor;
    WWbs_Fonte     : IFontDisp;
    WWbs_CorFonte  : TColor;
    WWbs_Width     : variant;
    WWbs_Height    : variant;
    WWbs_Left      : variant;
    WWbs_Top       : variant;

    WAtor_align     : integer;
    WAtor_Borda     : integer;
    WAtor_EspBorda  : variant;
    WAtor_CorBorda  : TColor;
    WAtor_CorFundo  : TColor;
    WAtor_Fonte     : IFontDisp;
    WAtor_CorFonte  : TColor;
    WAtor_Width     : variant;
    WAtor_Height    : variant;
    Wator_Left      : variant;
    WAtor_Top       : variant;
    //proporções ator e Wbs em relaçào a atividade
    WWbs_prop_Width : variant;
    WWbs_prop_Height: variant;
    WAtor_prop_Width : variant;
    WAtor_prop_Height: variant;

    Wen_align       : integer;
    Wen_Borda       : integer;
    Wen_EspBorda    : variant;
    Wen_CorBorda    : TColor;
    Wen_CorFundo    : TColor;
    Wen_Fonte       : IFontDisp;
    Wen_CorFonte    : TColor;
    Wen_Width       : variant;
    Wen_Height      : variant;

    Wrn_align       : integer;
    Wrn_Borda       : integer;
    Wrn_EspBorda    : variant;
    Wrn_CorBorda    : TColor;
    Wrn_CorFundo    : TColor;
    Wrn_Fonte       : IFontDisp;
    Wrn_CorFonte    : TColor;
    Wrn_Width       : variant;
    Wrn_Height      : variant;

    Wju_align       : integer;
    Wju_Borda       : integer;
    Wju_EspBorda    : variant;
    Wju_CorBorda    : TColor;
    Wju_CorFundo    : TColor;
    Wju_Fonte       : IFontDisp;
    Wju_CorFonte    : TColor;
    Wju_Width       : variant;
    Wju_Height      : variant;


    Wjufixo_align       : integer;
    Wjufixo_Borda       : integer;
    Wjufixo_EspBorda    : variant;
    Wjufixo_CorBorda    : TColor;
    Wjufixo_CorFundo    : TColor;
    Wjufixo_Fonte       : IFontDisp;
    Wjufixo_CorFonte    : TColor;
    Wjufixo_Width       : variant;
    Wjufixo_Height      : variant;

    Wee_align       : integer;
    Wee_Borda       : integer;
    Wee_EspBorda    : variant;
    Wee_CorBorda    : TColor;
    Wee_CorFundo    : TColor;
    Wee_Fonte       : IFontDisp;
    Wee_CorFonte    : TColor;
    Wee_Width       : variant;
    Wee_Height      : variant;

    Wpe_align       : integer;
    Wpe_Borda       : integer;
    Wpe_EspBorda    : variant;
    Wpe_CorBorda    : TColor;
    Wpe_CorFundo    : TColor;
    Wpe_Fonte       : IFontDisp;
    Wpe_CorFonte    : TColor;
    Wpe_Width       : variant;
    Wpe_Height      : variant;

    Wiso_align       : integer;
    Wiso_Borda       : integer;
    Wiso_EspBorda    : variant;
    Wiso_CorBorda    : TColor;
    Wiso_CorFundo    : TColor;
    Wiso_Fonte       : IFontDisp;
    Wiso_CorFonte    : TColor;
    Wiso_Width       : variant;
    Wiso_Height      : variant;

    // data group
    Wdg_fonte       : IFontDisp;
    Wdg_CorFonte    : TColor;
    Wdg_CorTraco    : TColor;
    Wdg_EspTraco    : variant;
    Wdg_TipoTraco   : Integer;
    Wdg_adjorg      : Boolean;
    Wdg_adjdst      : Boolean;
    Wdg_AOrg        : integer;
    Wdg_AMid        : integer;
    Wdg_Adst        : integer;

    // conexào regra negócio
    Wcrn_fonte       : IFontDisp;
    Wcrn_CorFonte    : TColor;
    Wcrn_CorTraco    : TColor;
    Wcrn_EspTraco    : variant;
    Wcrn_TipoTraco   : Integer;
    Wcrn_adjorg      : Boolean;
    Wcrn_adjdst      : Boolean;
    Wcrn_AOrg        : integer;
    Wcrn_AMid        : integer;
    Wcrn_Adst        : integer;

    // ator DUC
    Wat_align       : integer;
    Wat_Borda       : integer;
    Wat_EspBorda    : variant;
    Wat_CorBorda    : TColor;
    Wat_CorFundo    : TColor;
    Wat_Fonte       : IFontDisp;
    Wat_CorFonte    : TColor;
    Wat_Width       : variant;
    Wat_Height      : variant;

    // oe
    Woe_align       : integer;
    Woe_Borda       : integer;
    Woe_EspBorda    : variant;
    Woe_CorBorda    : TColor;
    Woe_CorFundo    : TColor;
    Woe_Fonte       : IFontDisp;
    Woe_CorFonte    : TColor;
    Woe_Width       : variant;
    Woe_Height      : variant;

    // OI
    Woi_align       : integer;
    Woi_Borda       : integer;
    Woi_EspBorda    : variant;
    Woi_CorBorda    : TColor;
    Woi_CorFundo    : TColor;
    Woi_Fonte       : IFontDisp;
    Woi_CorFonte    : TColor;
    Woi_Width       : variant;
    Woi_Height      : variant;

    // OC
    Woc_align       : integer;
    Woc_Borda       : integer;
    Woc_EspBorda    : variant;
    Woc_CorBorda    : TColor;
    Woc_CorFundo    : TColor;
    Woc_Fonte       : IFontDisp;
    Woc_CorFonte    : TColor;
    Woc_Width       : variant;
    Woc_Height      : variant;

    // Use case
    Wuc_align       : integer;
    Wuc_Borda       : integer;
    Wuc_EspBorda    : variant;
    Wuc_CorBorda    : TColor;
    Wuc_CorFundo    : TColor;
    Wuc_Fonte       : IFontDisp;
    Wuc_CorFonte    : TColor;
    Wuc_Width       : variant;
    Wuc_Height      : variant;

    // Conexão OE OI
    Wcnx_fonte       : IFontDisp;
    Wcnx_CorFonte    : TColor;
    Wcnx_CorTraco    : TColor;
    Wcnx_EspTraco    : variant;
    Wcnx_TipoTraco   : Integer;
    Wcnx_adjorg      : Boolean;
    Wcnx_adjdst      : Boolean;
    Wcnx_AOrg        : integer;
    Wcnx_AMid        : integer;
    Wcnx_Adst        : integer;

    // Conexão DUC normal
    Wlnk_fonte       : IFontDisp;
    Wlnk_CorFonte    : TColor;
    Wlnk_CorTraco    : TColor;
    Wlnk_EspTraco    : variant;
    Wlnk_TipoTraco   : Integer;
    Wlnk_adjorg      : Boolean;
    Wlnk_adjdst      : Boolean;
    Wlnk_AOrg        : integer;
    Wlnk_AMid        : integer;
    Wlnk_Adst        : integer;

    // Objeto de negócio
    Won_align       : integer;
    Won_Borda       : integer;
    Won_EspBorda    : variant;
    Won_CorBorda    : TColor;
    Won_CorFundo    : TColor;
    Won_Fonte       : IFontDisp;
    Won_CorFonte    : TColor;
    Won_Width       : variant;
    Won_Height      : variant;

    // Conexão DMI
    Wrl_fonte       : IFontDisp;
    Wrl_CorFonte    : TColor;
    Wrl_CorTraco    : TColor;
    Wrl_EspTraco    : variant;
    Wrl_TipoTraco   : Integer;
    Wrl_adjorg      : Boolean;
    Wrl_adjdst      : Boolean;
    Wrl_AOrg        : integer;
    Wrl_AMid        : integer;
    Wrl_Adst        : integer;

    // Classe de ator  DEO
    wif_align       : integer;
    wif_Borda       : integer;
    wif_EspBorda    : variant;
    wif_CorBorda    : TColor;
    wif_CorFundo    : TColor;
    wif_Fonte       : IFontDisp;
    wif_CorFonte    : TColor;
    wif_Width       : variant;
    wif_Height      : variant;

    // pessoa  DEO
    Wps_align       : integer;
    Wps_Borda       : integer;
    Wps_EspBorda    : variant;
    Wps_CorBorda    : TColor;
    Wps_CorFundo    : TColor;
    Wps_Fonte       : IFontDisp;
    Wps_CorFonte    : TColor;
    Wps_Width       : variant;
    Wps_Height      : variant;

    // Conexão DEO
    Wdeo_fonte       : IFontDisp;
    Wdeo_CorFonte    : TColor;
    Wdeo_CorTraco    : TColor;
    Wdeo_EspTraco    : variant;
    Wdeo_TipoTraco   : Integer;
    Wdeo_adjorg      : Boolean;
    Wdeo_adjdst      : Boolean;
    Wdeo_AOrg        : integer;
    Wdeo_AMid        : integer;
    Wdeo_Adst        : integer;

     // Classe
    wcs_align       : integer;
    wcs_Borda       : integer;
    wcs_EspBorda    : variant;
    wcs_CorBorda    : TColor;
    wcs_CorFundo    : TColor;
    wcs_Fonte       : IFontDisp;
    wcs_CorFonte    : TColor;
    wcs_Width       : variant;
    wcs_Height      : variant;
   constructor Create;
end;



TTv = Class(TTreeView)

   Private
      EmpInst : TEmpresa;
      DiagInst : TDG;
      Fdg: Tdg;
      FNodeAnteriro: TTreeNode;
    FDiagrama: Tdg;
    FEmpresas: TEmpresa;
    FTreeTi: TstringList;
    FTreeList: TstringList;
    FTreeCod: TstringList;
    FTreeproj: TstringList;
    FTreeCli: TstringList;
    FTreeWbs: TstringList;


    function  Get_Empresas : TEmpresa;
    procedure Setdg(const Value: Tdg);
    procedure SetNodeAnteriro(const Value: TTreeNode);
    procedure SetDiagrama(const Value: Tdg);
    procedure SetEmpresas(const Value: TEmpresa);
    procedure SetTreeCli(const Value: TstringList);
    procedure SetTreeCod(const Value: TstringList);
    procedure SetTreeList(const Value: TstringList);
    procedure SetTreeproj(const Value: TstringList);
    procedure SetTreeTi(const Value: TstringList);
    procedure SetTreeWbs(const Value: TstringList);
    procedure tUnlcoka_Diag;
    function Locka_Diag(pEmp, pCenario, pIdg: integer): boolean;
    procedure TvKeyup(Sender: TObject; var Key: Word; Shift: TShiftState);
    function CriaIcone(pNode : TTreeNode;pTipo : string;pId : integer) : boolean;
    


   published
    property Empresas : TEmpresa  read FEmpresas write SetEmpresas;
    property Diagrama : Tdg read FDiagrama write SetDiagrama;
   // property Diagrama : TDG read  get_Diagrama;
    property NodeAnterior : TTreeNode read FNodeAnteriro write SetNodeAnteriro;
   public
     mdado : udado;
     procedure Inclui_filhos(pCli,pCenario,pDiag : integer;pNode : TTreeNode;pClasse : string);
     function  get_filho(pPai : TTreeNode;pCodigo : integer) : TTreeNode;
     procedure Mostra;
     procedure TvClick(Sender: TObject);
     procedure Excluir_No(pNodePai,pNode : TTreeNode;sender : TObject);
     function  Incluir_TVDiag(pNodePai : TTreeNode;pCli,pProj,pDiag : integer;
                            pDesc,pClasse: string;pNew : boolean) : TTreeNode;
    function Incluir_No(pNodePai : TTreeNode;pCli,pProj,pDiag : integer;pDesc: string) : TTreeNode;
     procedure Le_arvore(pNode: TTreeNode);
     procedure MouseDown(Sender: TObject;
               Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function Unlocka_Diag(pEmp,pCenario,pIdg : integer) : boolean;
    function Locate_activity(pNode: TTreeNode; pAtiv: integer;pDiag: string): TTreeNode;
    property TreeList : TstringList  read FTreeList write SetTreeList;
    property TreeCli  : TstringList  read FTreeCli write SetTreeCli;
    property Treeproj : TstringList   read FTreeproj write SetTreeproj;
    property TreeTi   : TstringList  read FTreeTi write SetTreeTi;
    property TreeCod  : TstringList  read FTreeCod write SetTreeCod;
    property TreeWbs  : TstringList   read FTreeWbs write SetTreeWbs;

     constructor Create;

end;

   { rotina de montagem da populaçao dos atributos}
 { retorna o objeto físico no diagrma , dados o código e o tipo}
 function Localiza_Fisico(pCli,pCenario,pCod,pDg : integer;pTipo : string;pDiag : string;pflow : TAddFlow) : afNode;

      { retorna os fluxos que entram e/ou saem da atividade }
 function Get_links(orgNode: afNode; pTipo: char): TList;
    { consiste o cenario}
 function Consiste_modelo(pCli,pCenario : integer) : boolean;

 procedure ImprimeAtorAtividade(pcli,pProj,pAtor : integer;pView : string);
  { imprime todas as atividades}
procedure Imprime_atividades(pCli,pProj : integer;pWbs : string;ptipoativ,pClass : integer;
                             pView: string;pResum : boolean;pForm: TForm;pForceNew : boolean);
   { imprime regras de negócio}
 procedure Imprime_regra(pCli,pProj : integer;pPrev : string;pQuebra : boolean);

 { imprime eventos de negócio}
 procedure Imprime_Evento(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
 procedure Imprime_Externo(pCli,pProj : integer;pPrev : string;pQuebra : boolean);

 procedure Imprime_OI(pCli,pProj : integer;pPrev : string;pQuebra : boolean;pTag : integer);

 procedure Imprime_FluxoDado(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
 procedure Imprime_LF(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
 function Check_erro(pCli,pProj,pDiag : integer;pClasse : string) : integer;

   { atualiza a estrutura do BD}
 procedure Atu_schema;

procedure Atu_schema1;
  { cria diretório novo}
function salvar_diretorio(pBd,pBDImport : Tbd ) : boolean;




var
wformdg : boolean;
adoc : TAdoConnection ;
qry_cria_idf_dados : TadoQuery;

dg_copy  : Tdg;
dg_classe : string;
dg_cli,dg_cenario : integer;
oPop : TpopUpMenu;
PopItem: array[1..10] of TMenuItem;
i , w,aaa,www : integer;
IndProj ,WCurrentNode : TTreeNode;
CurrentDiag : TDg;
mLst : ulst;
s : string;
a1,b1,c1,d1,tot : integer;
a2,a3,a4 : double;
aCpo,aCpoMast,aPk,aTipo,aDef,aTerm,aCaption,aObrig,aVisible : array of string;

lList,wcposql,wvalorsql,wtiposql,wsql,wpk: TstringList;
mListaObj : uListaObj;
CustoTotal : real;
//varia'veis para locate_activity
wstop : boolean;
wLocatedNode : TTreeNode;
oDGLocked : Tdg;
const cClasse: array[1..5] of sTRING = ('DPN','DMI','DEO','DUC','CLS');

implementation

uses bst_main, bst_text, bst_treeAtiv, bst_images, bst_cfg, bst_texto,
  bst_dirbmp, bst_propr,  bst_if, bst_perc_custo,
  bst_escFluxos, bst_treeCusto, bst_cimp, bst_patorat,cls_utils, bst_pativ,
  bst_pativ1, bst_pregra, bst_pen, BST_pentext, bst_puc, BST_pdata, bst_plf,
  bst_dm_rel, bst_log, bst_mens, bst_mensagem;



function salvar_diretorio(pBd,pBDImport : Tbd ) : boolean;
var
i : integer;
s,nome,dirnome,panterior,wmens : string;
NewDir : array [0..1024] of char;
OldDir :  array [0..1024] of char;
cFile : TfileListbox;

 begin
 try
   result := true;
   pAnterior := pbdImport.Dirbanco;
   nome := ExtractFileName(pBdImport.Dirbanco);
   cFile := TFileListBox.create(screen.ActiveForm);
   cfile.Visible := false ;
   screen.ActiveForm.InsertControl(cFile);
   DirNome := pbdImport.DirFluxo+'Temp';

    // cria dirétório
   if DirectoryExists(DirNome) then
    begin
      cFile.Directory := DirNome;

      for i := 0 to cFile.Count - 1 do
        begin
         If not deletefile(cFile.items[i]) then
           begin
             result := false;
             exit;
           end;
        end;

    end
   else
    begin
      if not CreateDir(DirNome) then
        begin
          result := false;
          exit;
        end;
    end;

    wMens := AnsireplaceStr(Mens133,'&',pBdImport.dirfluxo);
    wMens := AnsireplaceStr(wmens,'@',DirNome);
    cFile.Directory := pBdImport.DirFluxo;

    //copia digarmas para o temporário

    for i := 0 to cFile.Count - 1 do
     begin
        s:= cFile.Items[i];
        strPcopy(NewDir,DirNome+'\'+s);
        strPcopy(OldDir,pBdImport.dirfluxo +'\'+s);
        If not copyfile(OldDir,Newdir,true) then
           RESULT := FALSE;
     end;


     pBDImport.DirFluxo := DirNome +'\';
     pBDImport.Dirbanco := pBDImport.DirFluxo+nome;
     pbdImport.Connected := false;
     pBdImport.ConnectionString := AnsireplaceStr(pBdImport.ConnectionString,pAnterior, pBdImport.Dirbanco);
 finally
   freeandnil(cFIle);
 end;
 end;


constructor TTV.Create;

 begin
 Inherited create(application);
  try
   begin
   
   OnClick     := tvClick;
   OnKeyUp     := TvKeyup;
   Images      := frm_main.im;

   Diagrama    := Tdg.create;
   Diagrama.EDITAVEL := true;
   OnMouseDown := MouseDown;

   empresas    := Tempresa.create(application);
   TreeList    := Tstringlist.create;
   TreeCli     := Tstringlist.create;
   TreeProj    := Tstringlist.create;
   TreeCod     := Tstringlist.create;
   TreeTi      := Tstringlist.create;
   end;
  except
   begin
     raise;
   end;
  end;
 end;

procedure TTv.TvKeyup(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;


end;

procedure TTV.MouseDown(Sender: TObject;
               Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   begin
    //  If TTreeview(sender as Tobject).selected <> nil then
    //    showmessage(  udado(TTreeview(sender as Tobject).selected.data)^.FDiagId);
   end;



function TTv.Locate_activity(pNode : TTreeNode;pAtiv : integer;pDiag : string) : TTreeNode;  //le a arvore descendente a a partir do pai e procura atividad a cada diagra lido
var
i , Tot_filho,Wlevel: integer;
wAtv : afNode;
Wnode : TTreeNode;
Wnome,Wniv ,Wblan: string;
Wgrid : boolean;
begin
result := nil;
try
  begin
  If wStop then
   exit;
  If pnode = nil then
      raise exception.create(mens101);
  If not tv.Diagrama.Abre_diagrama(pnode) then
    exit;
 tv.Diagrama.Visible   := false;
 frm_mens.mens.Caption := '                                                       ';
 frm_mens.mens.caption := mens137 +' : '+ pNode.Text;
 frm_mens.mens.repaint;

  watv:= tv.Diagrama.Get_NodeGraph(Tv.Diagrama,pAtiv,50);
  If watv <> nil then
     begin
       wLocatedNode := pNode;
       result := pNode;
       wstop := true;
       exit;
     end;

  If not pnode.HasChildren   then
     begin
       Inclui_filhos(udado(pnode.data)^.Fcli,
                     udado(pnode.data)^.FProj,
                     udado(pnode.data)^.FDiag,pnode,
                     udado(pnode.data)^.fClasse);
     end;
     Tot_Filho := pNode.Count;
     If tot_filho > 0 then
       begin
         for i := 0 to Tot_filho-1 do
          begin
            If Locate_Activity(pnode.Item[i],pAtiv,pDiag) <> nil then
             exit;
          end;
       end;
     end;

  Tot_Filho := pNode.Count;
  If tot_filho > 0 then
     begin
       for i := 0 to Tot_filho-1 do
       begin
        If not pnode.Item[i].HasChildren   then
           begin
             Inclui_filhos(udado(pnode.Item[i].data)^.Fcli,
                           udado(pnode.Item[i].data)^.FProj,
                           udado(pnode.Item[i].data)^.FDiag,pnode.Item[i],
                           udado(pnode.Item[i].data)^.fClasse);
           end;
         Locate_Activity(pnode.Item[i],pAtiv,pDiag);
       end;
     end;
//  end;
except
  begin
     raise;
  end;
end;
end;

procedure TTv.Le_arvore(pNode : TTreeNode);  //le a arvore descendente a a partir do pai
var
i , Tot_filho,Wlevel: integer;
Wnode : TTreeNode;
Wnome,Wniv ,Wblan: string;
Wgrid : boolean;
begin
try
  begin
    Wblan := '                                                        ';
  If pnode = nil then
      raise exception.create(mens101);

  Tot_Filho := pNode.Count;
  If tot_filho > 0 then
     begin
       for i := 0 to Tot_filho-1 do
       begin
         Wlevel := pnode.item[i].level+3;
         wnome := copy(Wblan,1,Wlevel)+pnode.item[i].text;
         tv.treeList.Add(Wnome);
         frm_mensagem.Memo1.Lines.Add(wnome) ;
         //frm_mensagem.Memo1.lines.SaveToFile('c:/buffer/it.txt');
         frm_mensagem.Memo1.repaint;
         tv.TreeCli.add(inttostr(udado(pnode.item[i].Data)^.FCli)) ;
         tv.TreepROJ.add(inttostr(udado(pnode.item[i].Data)^.FProj)) ;
         tv.TreecOD.add(inttostr(udado(pnode.item[i].Data)^.FDiag)) ;
          If not pnode.Item[i].HasChildren   then
           begin
             Inclui_filhos(udado(pnode.Item[i].data)^.Fcli,
                           udado(pnode.Item[i].data)^.FProj,
                           udado(pnode.Item[i].data)^.FDiag,pnode.Item[i],
                           udado(pnode.Item[i].data)^.fClasse);
           end;
         le_Arvore(pnode.Item[i]);
       end;
     end;
  end;
except
  begin
     raise;
  end;
end;
end;

function TTV.Unlocka_Diag(pEmp,pCenario,pIdg : integer) : boolean;  //
 begin
     result := false;

     If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
       exit
     else
      begin
        If odgLocked.MYLOCK THEN    // se foi eu que lokou, liberar
           begin
             If oDgLocked.DG_DADOS.UnLock_diag(pEmp,pCenario,pIdg) then    // libera anterior
               begin
                odgLocked.EMPRESA :=0;
                oDgLocked.CENARIO := 0;
                oDgLocked.IDG     := 0;
                oDgLocked.MYLOCK  := false;
                result := true;
               end;
           end;
      end;
 end;

 function TTV.Locka_Diag(pEmp,pCenario,pIdg : integer) : boolean;  //
 begin
     result := false;
     If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
       exit
     else
       begin
        If (oDgLocked.EMPRESA = pEmp) and
          (oDgLocked.CENARIO = pCenario) and
          (oDgLocked.IDG = pIdg) then
          begin
           If oDgLocked.MYLOCK then
             begin
              result := true;
              exit;
             end;
          end;
        If oDgLocked.dg_dados.Lock_diag(pEmp,pCenario,pIdg) then    // libera anterior
         begin
           oDgLocked.EMPRESA := pEmp;
           oDgLocked.CENARIO := pCenario;
           oDgLocked.IDG     := pIdg;
           oDgLocked.MYLOCK  := TRUE;
           result := true;
         end;
       end;

 end;

procedure TTV.tvClick(Sender: TObject);  // clique no Treeview -> abre diagrama correspondente
var
nm : string;
i ,j,k,m : integer;
pNode : TTreeNode;
macesso : boolean;
 begin
    begin
    UnLocka_Diag(odgLocked.EMPRESA,odgLocked.CENARIO,oDgLocked.IDG);
    diagrama.visible := true;
    If tv.selected = nil then
     exit;
    If frm_treeCusto <> nil then
     Begin
        If udado(tv.Selected.Data)^.fClasse <> 'DPN' then
         exit;
        If tv.Selected.Level > 1 then
         Begin
          with frm_TreeCusto do
           Begin
               Panel2.visible := true;
               label2.Caption := udado(tv.Selected.Data)^.FNome;
           end;
           diagrama.Visible := false;
           frm_Treecusto.pan_temp.height := 0;
           frm_TreeCusto.pan_stat.Visible := false;
         end;
     end
   else
      frm_treeativ.sss.enabled := false;
   begin
      Begin
         begin
              If selected.level > 1 then    //diagramas
               begin
                   If frm_treeativ <> nil then
                      frm_treeativ.sss.enabled :=  true;
                   If CurrEmpresa = nil then
                      CurrEmpresa := TEmpresa.create(self);
                      CurrEmpresa.cenarios.cli_id := udado(tv.selected.data)^.Fcli;
                      CurrEmpresa.cenarios.prj_id := udado(tv.selected.data)^.FProj;

                      oAcesso.CLIENTE :=  CurrEmpresa.cenarios.cli_id;
                      oAcesso.CENARIO :=  CurrEmpresa.cenarios.prj_id;
                      mAcesso :=  Checa_Acesso('',frm_main.SEGHABILIATADO,udado(tv.selected.data)^.FDiag) ;
                      If ((oAcesso.NOME <> oACesso.NOMEANT) or (oAcesso.NOME = '')) and (frm_main.SEGHABILIATADO) then
                        begin
                        pNode       := tv.Selected;
                        tv.selected := tv.TopItem;
                        for m:= 0  to  tv.Items.Count-1  do
                          Begin
                           CriaIcone(tv.items[m],udado(tv.items[m].data)^.fClasse,udado(tv.items[m].data)^.FDiag);
                          end;
                          tv.selected := pNode; {}
                          oAcesso.NOMEANT := oAcesso.NOME;
                      end;
                     If mACesso then
                     Begin
                      begin

                       If not Diagrama.Abre_diagrama(selected) then
                          begin
                           If MessageDlg(mens45,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                               Begin
                                    tv.Diagrama.LoadFile(Bdx.DirFluxo+'limpo.add');
                                    tv.Diagrama.DIAG_ID :=  udado(tv.selected.Data)^.FDiagId;
                                    //tv.Diagrama.Salvar;
                               end
                           else
                            Begin
                               showmessage(mens7);
                               selected := tv.selected.parent;
                            end;
                           tvclick(frm_treeativ);
                          end;
                       end;

                   If frm_TreeAtiv <> nil then
                    Begin
                      If (udado(tv.selected.data)^.Fcli <>  empresas.cenarios.CLI_ID ) or
                      (udado(tv.selected.data)^.FProj <> empresas.cenarios.PRJ_ID ) then
                        Begin
                          frm_Treeativ.atordef      := 0;
                          frm_Treeativ.atordefdesc  :='';
                          frm_TreeAtiv.localdef     := 0;
                          frm_TreeAtiv.localdefdesc := '';
                        end;
                    end;

                   empresas.cenarios.CLI_ID           := udado(tv.selected.data)^.Fcli;
                   empresas.cenarios.PRJ_ID           := udado(tv.selected.data)^.FProj;
                   If frm_treeativ <> nil then
                    Begin
                       //frm_Treeativ.edit1.text := inttostr(tv.selected.level - 2);
                       //frm_Treeativ.pan_tit.caption    :=  udado(tv.selected.data)^.fNome;
                       frm_Treeativ.pan_temp.BringToFront;
                    end
                   else
                    Begin
                       frm_TreeCusto.edit1.text := inttostr(tv.selected.level - 2);
                       frm_TreeCusto.pan_tit.caption    :=  udado(tv.selected.data)^.fNome;
                    end;

                  end;

                  If not tv.selected.HasChildren   then
                     Inclui_filhos(udado(selected.data)^.Fcli,udado(selected.data)^.FProj,
                                   udado(selected.data)^.FDiag,selected,
                                   udado(selected.data)^.fClasse);

                     
               end
               else
                 begin
                  Begin
                   //frm_treeativ.Pan_tit.caption := '';
                   If tv.selected.level = 0 then //clietne
                      frm_treeativ.Label2.Caption := def922
                   else
                   If tv.selected.level = 1 then //cenario
                      frm_treeativ.Label2.Caption := def923;
                   diagrama.palette(0);
                   diagrama.visible := false;
                  end;
                 end;


                If frm_treeativ <> nil then
                 Begin
                   If tv.Diagrama.IDG_DIR = 'DMI' then
                     Begin
                       tv.Diagrama.Carrega_tipo;
                       for i := 0 to frm_treeativ.PopNode.Items.Count -1 do
                        Begin
                          If (frm_treeativ.PopNode.Items[i].Caption  = def211) or
                             (frm_treeativ.PopNode.Items[i].Caption  = def212) or
                             (frm_treeativ.PopNode.Items[i].caption  = def788) OR
                             (frm_treeativ.PopNode.Items[i].caption  = def789) then
                                frm_treeativ.PopNode.Items[i].Enabled  := true;
                        end;
                     end ;

                     If tv.Diagrama.IDG_DIR = 'CLS' then
                     Begin
                       tv.Diagrama.Carrega_tipo;
                     end;

                     If frm_treeativ.wuserdata <> 0 then
                      Begin
                         tv.Diagrama.SelectedNode := tv.Diagrama.Get_Node(tv.Diagrama,frm_treeativ.wuserdata) ;
                         If  tv.Diagrama.SelectedNode <> nil then
                              tv.Diagrama.SelectedNode.EnsureVisible;

                      end;
                 end;
            If frm_TreeAtiv <> nil then
            begin
              If udado(tv.selected.Data)^.fClasse = 'DPN' then
              Begin
                tv.Diagrama.ArrowDst := 3;
                tv.Diagrama.ArrowOrg := 0;
                 //frm_Treeativ.pan_tit.caption := Dim1+ ': '+frm_Treeativ.pan_tit.caption
              End
              else
              If udado(tv.selected.Data)^.fClasse = 'DUC' then
              Begin
                tv.Diagrama.ArrowDst := 3;
                tv.Diagrama.ArrowOrg := 0;
                 //frm_Treeativ.pan_tit.caption := Dim2 + ': '+frm_Treeativ.pan_tit.caption
              End
              else
              If udado(tv.selected.Data)^.fClasse = 'DEO' then
              Begin
                tv.Diagrama.ArrowDst := 0;
                tv.Diagrama.ArrowOrg := 0;
                 //frm_Treeativ.pan_tit.caption := Dim4 + ': '+frm_Treeativ.pan_tit.caption
              End
              else
              If udado(tv.selected.Data)^.fClasse = 'LIV' then
              Begin
                tv.Diagrama.ArrowDst := 3;
                tv.Diagrama.ArrowOrg := 0;
                 //frm_Treeativ.pan_tit.caption := Dim4 + ': '+frm_Treeativ.pan_tit.caption
              End
              else
              If udado(tv.selected.Data)^.fClasse = 'DMI' then
              Begin
                tv.Diagrama.ArrowDst := 16;
                tv.Diagrama.ArrowOrg := 17;
              //frm_Treeativ.pan_tit.caption := Dim3 + ': '+frm_Treeativ.pan_tit.caption
              End
              else
              If udado(tv.selected.Data)^.fClasse = 'CLS' then   //CLASSES UML
                 //frm_Treeativ.pan_tit.caption := Dim6 + ': '+frm_Treeativ.pan_tit.caption;

              If frm_TreeCusto <> nil then
                frm_TreeCusto.MostrarCustos1Click(nil);
            end;
         end;
      end;
   end;
   end;
end;

function TTv.get_filho(pPai : TTreeNode;pCodigo : integer) : TTreeNode;
                        // procura o filho específico
var
WNode : TTreeNode;
 begin
   try
    begin
      result := nil;
      If pPai = nil then
        exit;
       begin
         WNode :=  pPai.GetFirstChild ;

         while  result = nil do
          begin
             If Wnode = nil then
                begin
                  result := nil;
                  break;
                end;
             If ((udado(Wnode.data)^.fDiag = pCodigo) and (udado(Wnode.data)^.fClasse = udado(pPai.data)^.fClasse)) or
                ((udado(Wnode.data)^.FDiag = pCodigo) and (udado(Wnode.data)^.fClasse = 'DUC'))
              then
                begin
                   result := Wnode ;
                end;
            WNode := WNode.GetNextSibling;
          end;
       end;
    end;
   except
    begin
      raise;
    end;
   end;
 end;


function TTv.Get_empresas : TEmpresa;
 begin
    If EmpInst = nil then
       EmpInst := TEmpresa.create(self);
    result := EmpInst;
 end;



procedure TTv.Mostra;      //monta a árvore
 var
   Wdesc : string;
   i,Wpai,ipos : integer;
   AA : CHAR;
begin
    oAcesso.MUTE := true;
    repaint ;
    mdado := nil;
    items.clear;
    readOnly := true;

    try

      with empresas do                //self.Get_Empresas
       begin
          Open_All;

         while not Eof do
           begin
             new(mDado);
             mdado^.Fcli           := fieldbyname('CLI_ID').asinteger;
             mdado^.FProj          := 0;
             mdado^.fdiag          := 0;
             mdado^.FNome          := fieldbyname('CLI_NOME').asstring ;
             mdado^.FDiagid        := '';
             mdado^.FClasse        := '';
             WCurrentNode := items.addchildObject(nil,fieldbyname('CLI_NOME').asstring,mdado);
             WCurrentNode.ImageIndex    := 6;
             WCurrentNode.SelectedIndex := 2;
             cenarios.Open_Cenarios(mdado^.Fcli) ;
             with cenarios do
               begin
                 while not Eof do
                  begin
                    new(mDado);
                    mdado^.Fcli           := fieldbyname('CLI_ID').asinteger;
                    mdado^.FProj          := fieldbyname('PRJ_ID').asinteger;
                    mdado^.fdiag          := 0;
                    mdado^.FNome          := fieldbyname('PRJ_TITULO').asstring;
                    mdado^.FDiagid        := '';
                    mdado^.FClasse        := '';
                    IndProj := items.addchildObject(WCurrentNode,fieldbyname('PRJ_TITULO').asstring,mDADO);
                    indProj.SelectedIndex := 10;
                    indProj.ImageIndex    := 11;
                    Inclui_filhos(mdado^.Fcli,mdado^.FProj,0,IndProj,mdado^.fClasse);
                    next;
                  end;
                end;
            next;
           end;
           FullExpand;
       end;
    finally
       oAcesso.MUTE := false;
    end;


end;

procedure TTv.Inclui_filhos(pCli,pCenario,pDiag : integer;pNode : TTreeNode;pClasse : string);
var                           // inclui os sub diagramas no treeview
Diag : TDiag_dados;
 a : integer;
 begin
    oAcesso.MUTE := true;
    diag := Tdiag_dados.create(self);

    with Diag do
     begin      // qery alterada em 24/03/05 : acrescentado classe
       get_filhos(pCli,pCenario,pDiag,pClasse,'CLI_ID,PRJ_ID,IDG_DIR,SUB_NOME');

       while not diag.eof do
        begin
        If ( (frm_TreeCusto <> nil) and  (fieldbyname('IDG_DIR').asstring  = 'DPN') or
           (frm_treeAtiv <> nil) ) then
         begin

          new(mDado);
          mdado^.Fcli           := pCli;
          mdado^.FProj          := pCenario  ;
          mdado^.FClasse       :=  fieldbyname('IDG_DIR').asstring;
          mdado^.fdiag          := diag.fieldbyname('IDG_ID').asinteger;
          mdado^.FNome          := diag.fieldbyname('SUB_NOME').asstring;
          mdado^.FDiagid        := BDx.DirFluxo+fieldbyname('DIAG_ID').asstring;
                                                   //  pNode,diag.fieldbyname('IDG_ID').asstring+'-'+
          diag.Node         := items.addchildObject(pNode,fieldbyname('SUB_NOME').asstring,mDado);
         // Inclui_filhos(mDado^.Fcli,mDado^.FProj,mDado^.FDiag,Diag.Node,mdado^.FClasse);

          CriaIcone(diag.Node,fieldbyname('IDG_DIR').asstring,diag.fieldbyname('IDG_ID').asinteger);
         end;
        Diag.Next;
        end ;

        freeandnil(diag);
     end;
     oAcesso.MUTE := false;
  end;



function TTV.CriaIcone(pNode : TTreeNode;pTipo : string;pId : integer) : boolean;
 begin
 //showmessage(pnode.Text);
 If pNode.Level > 1 then
 begin
    with pNode  do
     begin
      If (pTipo = 'DPN') THEN
         begin
            ImageIndex       := 12;
            SelectedIndex    := 20;
         end
      else
      If (pTipo = 'DMI')            THEN
         begin
          ImageIndex       := 22;
          SelectedIndex    := 23;
         end   ;
      If pTipo = 'DUC' THEN
         begin
          SelectedIndex := 18;
          ImageIndex    := 17;
         end
      else
      If pTipo = 'DEO' THEN
         begin
          SelectedIndex := 16;
          ImageIndex    := 15;
         end
      else
      If pTipo = 'LIV' THEN
         begin
          SelectedIndex := 25;
          ImageIndex    := 24;
         end
      else
      If pTipo = 'CLS' THEN
         begin
          SelectedIndex := 27;
          ImageIndex    := 26;
         end  ;
      If oACesso.NOME <> '' then
        Begin
          oAcesso.MUTE := true;
          If not Checa_Acesso('',frm_main.SEGHABILIATADO,pId) then
             Begin
               selectedIndex    := 28;
               imageindex       := 28;
             end
          else
             Begin
              If oAcesso.WACCESS = 1 then
                 Begin
                   selectedIndex    := 29;
                   imageindex       := 29;
                 end;
             end;

          oAcesso.MUTE := false;
        end;
       repaint; 
      end;
 end;
 end;

function TTv.Incluir_TVDiag(pNodePai : TTreeNode;pCli,pProj,pDiag : integer;
                            pDesc,pClasse: string;pNew : boolean) : TTreeNode;
var                       // incluir atividade /diagrama no Treeview após criaçaò da atividade no
                          // diagrama
Diag : TDiag_dados;
widg : integer;
 begin
   result := nil;
   If pNodepai <> nil then
    begin
       If Get_filho(pNodePai,pDiag) <> nil then  // verifica se já não esta na árvore
          exit;
    end;

   tv.diagrama.Salvar;

   diag := Tdiag_dados.create(self);

   Diag.CLI_ID          := pCli;
   Diag.PRJ_ID          := pProj;
   Diag.IDG_ID          := pDiag;
   Diag.SUB_NOME        := pDesc;
   Diag.DIAG_PAI_ID     := udado(self.selected.Data)^.FDiag;
   Diag.IDG_DIR         := pClasse; //udado(self.selected.Data)^.fClasse;
   Diag.IDG_NIVEL       := pNodePai.level - 2;
                        // salva diagrama corrente
   If not diag.Get_DiagramaDoPai(pCli,pProj,pDiag,Diag.DIAG_PAI_ID) then   // cria novo digrama
      begin
        Diag.Criar(Diag);
        If pNew then     // cria novo diagrama  branco
         Begin
           If not FileExists(Bdx.DirFluxo+'limpo.add') then
              Raise exception.create(mens115+Bdx.DirFluxo);
           tv.Diagrama.LoadFile(Bdx.DirFluxo+'limpo.add');
           tv.Diagrama.SaveFile(BDx.DirFluxo+diag.Diag_id);   // salva o diagrama físico
         end;
      end ;

      new(mDado);
      mdado^.Fcli    := pCli;
      mdado^.FProj   := pProj  ;
      mdado^.fdiag   := Diag.IDG_ID;
      mdado^.FNome   := pDesc;
      mdado^.FDiagid := BDx.DirFluxo+Diag.DIAG_ID;
      mdado^.FClasse := pClasse; //udado(self.selected.Data)^.fClasse;

      diag.node := items.addchildObject(pNodePai,pdesc,mdado);  //insere no treeview
     with diag.Node  do
           begin
            If (diag.IDG_DIR = 'DPN') THEN
               begin
                ImageIndex       := 12;
                SelectedIndex    := 20;
               end
            else
            If (diag.IDG_DIR = 'DMI')            THEN
               begin
                ImageIndex    := 22;
                SelectedIndex    := 23;
               end   ;
            If diag.IDG_DIR = 'DUC' THEN
               begin
                SelectedIndex := 18;
                ImageIndex    := 17;
               end
            else
            If diag.IDG_DIR = 'DEO' THEN
               begin
                SelectedIndex := 16;
                ImageIndex    := 15;
               end
            else
            If diag.IDG_DIR = 'LIV' THEN
               begin
                SelectedIndex := 25;
                ImageIndex    := 24;
               end
            else
            If diag.IDG_DIR= 'CLS' THEN
               begin
                SelectedIndex := 27;
                ImageIndex    := 26;
               end  ;
            end;
         result := Diag.node;


   freeandnil(Diag);

   tv.TvClick(pNodepai);

 end;

function Check_erro(pCli,pProj,pDiag : integer;pClasse : string) : integer;
var
iDg : TDiag_dados;
iTab : Tdados_tab;
wmax : integer;
begin
try
 result := 0;
 iDg :=  TDiag_dados.create(application);
 iTab :=  TDados_tab.create(application);

  // If pClasse = 'DEO' then
    Begin
       //verifica se existe diagrama de outra classe
   //   If idg.Get_DiagramadaClasse(pCli,pProj,pDiag,'DPN') then
       Begin
         iTab. PRJ_ID := pProj;
         iTab.CLI_ID  := pCli;
         iTab.get_CA(pCli,pProj,pDiag);
         If iTab.fieldbyname('IDF_CODIGO').asinteger = iTab.fieldbyname('IDF_ID').asinteger then
          Begin
            with TDados_tab.create(application) do
             Begin
                PRJ_ID := pProj;
                CLI_ID  := pCli;
                wmax := get_maxKey('IDF_CA') + 1;
                Atualiza_Key(pCli,pProj,pDiag,wmax,'IDF_CA');
                Atualiza_KeyCorr(pCli,pProj,pDiag,wmax,'AP','CA');
                result := wmax;
                free;
             end;
            
          end
         else
          Begin
           result := iTab.fieldbyname('IDF_CODIGO').asinteger;
          end;




       end;

    end;




finally
  freeandnil(idg);
  freeandnil(iTab);

end;  
end;

function TTv.Incluir_No(pNodePai : TTreeNode;pCli,pProj,pDiag : integer;pDesc: string) : TTreeNode;
var                       // incluir atividade /diagrama no Treeview após criaçaò da atividade no
                          // diagrama
Diag : TDiag_dados;
 begin
   result := nil;


   tv.diagrama.Salvar;
   If pDiag = 0 then
      diag := Tdiag_dados.create(self)
   else
      Diag := empresas.cenarios.Diagramas;



    new(mDado);
    mdado^.Fcli    := pCli;
    mdado^.FProj   := pProj  ;
    mdado^.fdiag   := pDiag;
    mdado^.FNome   := pDesc;
    mdado^.FDiagid := '';
    mdado^.FClasse := '';

    diag.node := items.addChildObject(pNodePai,pdesc,mdado);  //insere no treeview

     with diag.Node  do
      begin
      If (Diag.IDG_DIR = 'DPN') THEN
       begin
         ImageIndex    := 12;
         SelectedIndex := 20;
       end
            else
      If Diag.IDG_DIR = 'DUC' THEN
       begin
          SelectedIndex := 18;
          ImageIndex    := 17;
       end ;
      end;
      result := Diag.node;


   freeandnil(Diag);
   If pNodepai <> nil then
      tv.TvClick(pNodepai);
 end;


procedure TTV.Excluir_No(pNodePai,pNode : TTreeNode;sender : TObject);  //exclui nó e filhos logicamente(SUB_SUBORDINACAO)
var
mens : string;
wc,wp : integer;
Wnode : TTreenode;
Diag : TDiag_Dados;
begin
  try
   If pNodePai = nil then
    exit;
   diag := Tdiag_dados.create(self);
   WNode :=  pNodePai.GetFirstChild ;
   
   while  Wnode <> nil do   // first child.....
    begin
       If pNode <> nil then    // nó específico
        begin
           If pNode = Wnode then
              begin
                 If not WNode.HasChildren   then  //expandir antes de excluir
                 begin
                    Inclui_filhos(udado(Wnode.data)^.Fcli,
                                 udado(WNode.data)^.FProj,
                                 udado(WNode.data)^.FDiag,WNode,
                                 udado(wnode.data)^.fClasse);
                 end;
                  diag.ApagarDoPai(udado(Wnode.Data)^.fCli,udado(Wnode.Data)^.fProj,
                                   udado(Wnode.Data)^.fDiag,Udado(pNodePai.Data)^.FDiag,
                                   Udado(pnode.Data)^.FDiagId);    //delete logicamente
                
                 Excluir_No(Wnode,nil ,self); //deleta os filhos
              end ;
        end
       else
          begin
              If not WNode.HasChildren   then
                 begin
                    Inclui_filhos(udado(Wnode.data)^.Fcli,
                                 udado(WNode.data)^.FProj,
                                 udado(WNode.data)^.FDiag,WNode,
                                 udado(wnode.data)^.fClasse);
                 end;
                 {Procura o diagrama pai}
              If not diag.Get_Diagrama(udado(Wnode.Data)^.fCli,udado(Wnode.Data)^.fProj,
                                            Udado(pNodePai.Data)^.FDiag) then
                 diag.ApagarDoPai(udado(Wnode.Data)^.fCli,udado(Wnode.Data)^.fProj,
                              udado(Wnode.Data)^.fDiag,Udado(pNodePai.Data)^.FDiag,
                              Udado(wnode.Data)^.FDiagId);


              Excluir_No(Wnode,nil ,self);
          end ;
      WNode := WNode.GetNextSibling;
    end;
   finally
     freeandnil(diag);
     freeandnil(Wnode);
end;

end;



constructor TDG.Create;

 begin
 Inherited create(screen.ActiveForm);
  try
   begin
  // frm_TreeAtiv.InsertControl(self);

   Align       := alClient;
   AdjustOrg   := true;
   Adjustdst   := true;
   MulTiSel    := true;
   DisplayPropertyPage(15);
   DG_DADOS := TDiag_dados.create(self);
   OnDblClick  := AtDblClick;
   OnMOuseDown := WmouseDown;
   OnMOuseUp   := WmouseUp;
   OnKeyDown   := WKeyDown;
   OnClick     := WClick;
   OnExit      := DiagExit;
   OnMOuseMove := wMouseMOve;
   fProporcBase := 12;
   fProporcProp := 5;
   fProporcMet  := 5;
   fProporcTitle  := 2;
 //  If not Carga_Atrib then
 //     raise exception.create(mens8);
  // PopUpMenu   := PopNode ; //EntPop;

   end;
  except
   begin
     raise;
   end;
  end;
 end;

procedure Tdg.Criar_correl_decomposto(pDg : Tdg;pEntity : afnode) ;
var
i : integer;
 begin
    for i := 1 to pDg.selectednode.InLinks.Count do
     begin
       If pDg.selectednode.InLinks.item(i).Org.Shape = 56 then    //evento de negócio
          Begin
            with TDados_tab.create(self) do
             Begin
               Cria_Correlacao ( pDg.EMPRESA,pDg.CENARIO,'AP', pDg.selectednode.UserData,'EN',pdg.selectednode.InLinks.item(i).Org.userData,' ' ,0,0);
               free
             end;
          end

      else
      If pDg.selectednode.InLinks.item(i).Org.Shape = 14 then    //regra de negócio
          Begin
            with TDados_tab.create(self) do
             Begin
               Cria_Correlacao ( pDg.EMPRESA,pDg.CENARIO,'AP', pDg.selectednode.UserData,'RN',pdg.selectednode.InLinks.item(i).Org.userData,' ' ,0,0);
               free
             end;
          end
      end
 end;

function Tdg.Check_Ascendencia(pCli,pCenario,pidg,pCodigo : integer) : boolean;
var
iDiag : TDiag_dados;
Begin
   result := false;
   try
    If pidg = pCodigo then
     Begin
      DiagDupl := true;
      exit;
     end;

   iDiag := TDiag_dados.create(self);
   with iDiag do
    Begin

      Get_Diagrama(udado(tv.selected.data)^.Fcli, udado(tv.selected.data)^.FProj,pIdg);
      If iDiag.fieldbyname('DIAG_PAI_ID').asinteger = 0 then
         exit;

      If iDiag.fieldbyname('DIAG_PAI_ID').asinteger = pCodigo then
        Begin
           DiagDupl := true;  ;
           exit;
        end
      else
       Check_Ascendencia(pCli,pCenario,fieldbyname('DIAG_PAI_ID').asinteger,pCodigo);
    end;
  finally
     result := DiagDupl;
     freeandnil(iDiag);

   end;
end;


function Tdg.Get_Fluxos(tvin,tvout : TTreeView;pNode :afNode) : integer;
var
oList : TList;
mObj : uobj;
begin
 If pNode <> nil then
        Begin
           oList := Get_links(pNode,' ');
           for i := 0 to oList.Count-1 do
            Begin
              mLst := oList.Items[i];
              If trim(mLst^.elnk.Text) = '' then
               continue;
              If mLst^.etipo = 'I' then
                Begin
                 If InList(mLst^.elnk.Text,tvin) then
                    continue;
                  new(mObj);
                  mObj.Fcodigo := inttostr(mLst^.elnk.userdata);
                  tvIn.Items.AddObject(nil,mLst^.elnk.Text,mObj)  ;

                end
              else
              If mLst^.etipo = 'O' then
                Begin
                 If InList(mLst^.elnk.Text,tvOut) then
                    continue;
                 new(mObj);
                 mObj.Fcodigo := inttostr(mLst^.elnk.userdata);
                 tvout.Items.AddObject(nil,mLst^.elnk.Text,mObj)  ;

                end;

            end;
        end;
end;


function TDG.Get_RightDiagrama : integer;   // retorna a parte + a esquersa do diagrama ; p/caber em folha A4 horizontal , largura max = 15720
vAR
wmax : integer;
Begin
  wmax := 0;

  for i := 1 to self.Nodes.Count do
   Begin
     wmax := max( wmax,trunc(self.Nodes.Item(i).left+ self.Nodes.Item(i).width) );
   end;
  result := wmax;
 // showmessage( inttostr(wmax))
end;


function TDG.Get_NodePerc(pDiag : Tdg;pId: integer): afNode;
var
i ,tot: integer;
iNode : afNode;
begin
  result := nil;
  tot := pDiag.Nodes.count;
  for i := 1 to tot do
   Begin
    If (pDiag.Nodes.Item(i).UserData = pId) and (pDiag.Nodes.Item(i).shape = 63) then
     Begin
       result := pDiag.Nodes.Item(i);
       break;
     end;

   end;

end;


function TDg.Trata_node(pEmpresa,pCenario : integer;pNode : afNode;pCustoAntes,pCustoAntestec,pCustoAntesGeral,pCustoAntesMP,CustoTotal : real;
                        pAntes : integer; pDiag : Tdg;Procexterno : Boolean) : TCusto;
var                                 //calcula os custos do digrama atividade por atividade
i,j,k,ws,wid : integer;             // Procexyterno "true : trata proc externo
mList,mSeg,mSeg1 : uLst;
oList,oSeguinte,oSeguinte1 : TList;
mens,nm : string;
wJunc,oObj : afNode;
wperc,wpercjunc ,tot: real;
jDg ,aDg : Tdg;
oCusto : TCusto;
begin
    result := oCusto;
    ws := pNode.shape;
    wPerc := PercAcum;

    If ws in [1,2] then  //encontrou juncao....
      Begin
        oObj := Obtem_JUncUp(pNode);
        wid :=  oObj.UserData;
       // form3.Memo1.Lines.add('   Junção '+oObj.Text);
        oSeguinte1 := Get_nodes(pNode,'O');
        jDg := Tdg.create;

         Begin
            for j := 0 to oSeguinte1.Count -1  do  //.. percorre todas as saidas da juncao
             Begin
               mSeg1 := oSeguinte1.Items[j];
               with jDg do
                Begin
                  wPercJunc := Get_passagem(pEMPRESA,pCENARIO,wId,mSeg1.eNode.UserData) ;
                  PercAcum := (wPerc * wPercJunc )/ 100;   //...acumula percentual
                   If j = 0 then
                    Begin//..salva custo até a junçaò qdo é a primeira saida da junção
                      custantes := pDiag.custAntes ;
                      Antes          := 0;
                    end
                   else
                     Begin
                        Antes     := 1;
                        pDiag.custAntes      := custantes; //.. reseta o custo anterior do diagrama
                        pDiag.CustantesTec   := CustAntestec;
                        pDiag.CustAntesGeral := CustAntesGeral;
                        pDiag.CustoMP        := CustoAntesMP;
                     end;
                  Trata_node(pEmpresa,pCenario,mseg1^.eNode,jdg.CustAntes,custantes,CustAntestec,CustAntesGeral,CustoAntesMP,Antes,pDiag,false);
                end;
             end;
             freeandnil(jdg);
         end;
      end
    else
    If ws in [11,50,59,79,54] then //...atividade...
     Begin

       aDg := Tdg.create;
       If (ws in [11,50,59,79]) or ((ProcExterno) and (ws = 54) ) then
       with adg do
        Begin
          PercAcum     := wPerc;
        //  result := 0;
         // adg.CustoMo := ( (strtoint(pNode.text) * (PercAcum/100) ) );
          with Tdg.Create do
           Begin
            oCusto := Get_custos_Ativ( pEmpresa,pCenario,pNode.UserData,4,true);
           // free;
           end;

          If pAntes = 1 then       // trata as outra saida da junçao
            Begin
             //pDiag.customo := pDiag.customo + pCustoAntes;
             pDiag.customo    := oCusto.Custo_mo + pCustoAntes;
             pDiag.CustoTec   := oCusto.Custo_Tec + pCustoAntesTec;
             pDiag.CustoGeral := oCusto.Custo_Outros + pCustoAntesGeral;
             pDiag.CustoMP    := oCusto.Custo_Mp + pCustoAntesMP;
             pAntes := 0;
            end ;

           // pDiag.custAntes := pDiag.custAntes + adg.customo;
           pDiag.custAntes      := pDiag.custAntes + oCusto.Custo_mo;
           pDiag.custAntesTec   := pDiag.custAntesTec + oCusto.Custo_Tec;
           pDiag.custAntesGeral := pDiag.custAntesGeral + oCusto.Custo_Outros;
           pDiag.CustoAntesMp   := pDiag.CustoAntesMp + oCusto.Custo_Mp;
           // pDiag.customo := pDiag.customo + adg.CustoMo;

           pDiag.customo      := pDiag.customo + oCusto.Custo_mo;
           pDiag.custoTec     := pDiag.CustoTec + oCusto.Custo_Tec;
           pDiag.custoGeral   := pDiag.CustoGeral + oCusto.Custo_Outros;
           pDiag.CustoMP      := pDiag.CustoMP    + oCusto.Custo_Mp;
         //  form3.Memo1.Lines.add('   '+pNode.text+ ' - '+
         //                           '.....Anterior : '+floattostr(pcustoAntes)+'.....Custo Total : '+floattostr(pDiag.customo) );


          oSeguinte    := Get_Nodes(pNode,'O');
          If oSeguinte.Count = 0 then
             exit;
          mSeg := oSeguinte.Items[0];
          ws   := mSeg^.eNode.Shape ;
          nm   := mSeg^.eNode.Text;
          Trata_node(pEmpresa,pCenario,mseg^.eNode,pCustoAntes,pcustoAntes,pCustoAntesTec,pCustoAntesGeral,pCustoAntesMP, pAntes,pDiag,false);
        end;
        freeandnil(adg);
     end
    else
     Begin

     end;
end;

function Tdg.Get_Custos_ativ( pCli,pProj,pId ,pTipo : integer;pGrava : boolean ) : Tcusto;
var
wtec,wMo,woutros,Custo_mo,Horas_anual ,wambiente: real;
wtot ,wid: integer;
mCusto : TCusto;
iAp : tDados_tab;
oDg : TTreeNode;
oTv : Ttv;
begin                                    // pTipo : 1 : total;2 : Mobra;3: Tecnologia;4 : Outros
 iAp := Tdados_tab.Create(self);
 otv := TTv.create   ;                                        // pGrava : TRUE : atualiza atividade
 try
   result := mCusto;
  // abre os dados da atividade
  try

   with iAp do
      Begin
       If Open_objeto(pCli,pProj, pID,'IDF_AP') then
          Begin          // se não sumária, calcula os custos dos filhos...
            If iap.FieldByName('IDF_ATIVIDADE_SUMARIA').AsString <> 'S' then
             Begin
               oDg := oTv.get_filho(tv.selected,pId );
               If oDg <> nil then
                Begin
                  oTv.Diagrama.Abre_diagrama(oDg) ; // pega nó da atividade atual) ;
                  frm_TreeCusto.Calcular_Custos(oTv.Diagrama );
                end;
               with Tdados_tab.create(self) do//atualiza atividad pai
                 begin
                  Atualiza_CustoAP( pCli,pProj,pId,oTv.Diagrama.customo,oTv.diagrama.CustoTec,oTv.diagrama.CustoGeral,
                                    oTv.Diagrama.CustoMP);
                  free;
                 end;
               exit;
             end;
          end;
      end;
    finally
      freeandnil(oTv);
    end;


   If pTipo in [1,4] then
    Begin

    //custo M.Prima
    mCusto.Custo_Mp :=  iAp.fieldbyname('IDF_CUSTO_MP').asfloat;

     //custos Tecnologia
     with Tdados_tab.Create(self) do
      Begin
        Get_Correlatos(pCli,pProj,'AP',pId,'SE','IDF_SE') ;

        while not eof do
         Begin
           wId := fieldbyname('IDF_COD_APLIC').asinteger ;
           with Tdados_tab.Create(self) do
            Begin
             wtot := Get_Aplicativos(pCli,pProj,wid);
             Open_objeto(pCli,pProj, WID,'IDF_TX');

             If wTot > 0 then
              wTec := wTec +((fieldbynAME('idf_custo_lic').asfloat +
                             fieldbynAME('idf_custo_manut').asfloat  +
                             fieldbynAME('idf_custo_outros').asfloat ) / wTot);

              free;
            end;
          next;
         end;
        free;
      end;
      mCusto.Custo_Tec := wtec;
    end;


    If pTipo in [1,4] then
      Begin
         //custos Mão de Obra
         with Tdados_tab.Create(self) do
          Begin
            Get_Correlatos(pCli,pProj,'AP',pId,'CA','IDF_CA') ;

            while not eof do
             Begin
               If (fieldbyname('idf_Custo_Anual').asfloat > 0) AND (fieldbyname('Idf_jornada_Anual').asfloat > 0) then
                 Begin
                   Custo_mo    := fieldbyname('idf_Custo_Anual').asfloat  ;
                   Horas_anual := fieldbyname('Idf_jornada_Anual').asfloat;
                   wMo := wMo +(iAp.fieldbynAME('idf_duration_tpu').asfloat +
                                     iAp.fieldbynAME('idf_tempo_inativo_tpi').asfloat) ;
                   wmo := wmo * (Custo_mo /Horas_anual);
                  end;
             next;
             end;
            free;
          end;
          mCusto.Custo_mo := wMo;
       // end;
      end;

    If pTipo in [1,4] then
    begin
     //custos Ambiente
     with Tdados_tab.Create(self) do
      Begin
        Get_Correlatos(pCli,pProj,'AP',pId,'LF','IDF_LF') ;
        wtot := 0;

        while not eof do
         Begin
          wId := fieldbyname('IDF_CODIGO').asinteger ;
        //  inc(wtot);
          wambiente := fieldbynAME('idf_custoAmbiente').asfloat ;
           with Tdados_tab.Create(self) do
            Begin
             wtot := Get_QtdeAtivLoc(pCli,pProj,wid);
             If wTot > 0 then
               wOutros := wOutros +( wAmbiente / wtot );
             free;
          end;
          next;
         end;

        free;
      end;
      mCusto.Custo_Outros := wOutros;
    end;
    If pGrava then
     Begin
      with Tdados_tab.create(self) do
       Begin
         Atualiza_CustoAP( pCli,pProj,pId,mCusto.Custo_mo,mCusto.Custo_Tec,mCusto.Custo_Outros,mCusto.Custo_Mp);

        free;
       end;
     end;

    result := mCusto;
 finally
   freeandnil(iAp);
 end;
end;





procedure TDg.Desmarca;  //desmarca todos os objetos de um diagrama
var
i,j : integer;
awbs,aAtor : afNode;
 Begin
    
    for i := 1 to  Nodes.Count do
      Begin
       Nodes.Item(i).Marked := false;

       for j := 1 to Nodes.Item(i).Links.Count do
          begin
            Nodes.Item(i).Links.item(j).Marked := false;
           // showmessage(Nodes.Item(i).Links.item(j).text);

          end;
           
        If Nodes.Item(i).Shape = 50 then
          Begin

           aWbs  := Obtem_wbs(Nodes.Item(i));
           aAtor := Obtem_ator(Nodes.Item(i));
           If awbs <> nil then
            Begin
              aWbs.marked := false;
              for j := 1 to awbs.Links.Count do
                 awbs.Links.Item(j).marked := false;
            end;

           If aAtor <> nil then
            Begin
               aAtor.marked := false;
               for j := 1 to aAtor.Links.Count do
                 aAtor.Links.Item(j).marked := false;
            end;
          end;
      
      end;
      
 end;

procedure TDg.UnselectAll;  //desmarca todos os objetos de um diagrama
var
i,j : integer;
awbs,aAtor : afNode;
 Begin

     for i := 1 to  Nodes.Count do
      Begin
       If nodes.item(i).selectable then
        Begin
          Nodes.Item(i).selected := false;
          for j := 1 to Nodes.Item(i).Links.Count do
           Nodes.Item(i).Links.item(j).selected := false;
        end;
       

      end;
 end;

function tdg.cria_Perc(pRel : afLInk; pNode : afNode ; wval : string) : integer;
var
 wtop,Wleft,X,Y : real;
 wSubNode : afNode;

 j ,wtot,wst : integer;
 worg,Wdst,Wp1,Wp2,Wp3,Wp4,Wp5 : afLinkPoint;
 Tot,i,wmax : integer;
 WFont : IFontDisp;
 Wfnt : Tfont;
begin
try
   result := 0;
   Wfnt := tfont.Create;
   X := prel.ExtraPoints.Item[0].x  ;
   Y := prel.ExtraPoints.Item[0].y  ;
   WSubnode := tv.diagrama.Nodes.add(X,Y ,300 ,300);
   WSubnode.shape        := 63;
   wsubnode.DrawStyle    := 5;
   wsubnode.DrawWidth    := 0;
   WsubNode.Sizeable     := true;
   WSubNode.FillColor    := clWhite;
   wSubnode.Text         := wval+'%';

   { cria id do perc}
   with Tdados_tab.create(self) do
    Begin
     wmax := Get_Maxcorrelato(empresa,cenario);
     inc(wmax);
     free;
    end;
    wSubNode.UserData := wmax;
    result := wmax;
except


end;
end;

procedure TDg.Copia_Sel;
var
i,j : integer;
aWbs,aAtor,iUp : afNode;
begin
     dg_classe  := tv.Diagrama.IDG_DIR;
     dg_cenario := tv.Diagrama.CENARIO;
     dg_cli     := tv.Diagrama.EMPRESA;
     Desmarca ; //desmarca todos os objetos

     for i := 1 to  Nodes.Count do
      Begin
        If not Nodes.Item(i).Selected then   // desmarca tudo
           continue;

        If (Nodes.Item(i).Shape = 1) and (dg_classe = 'DPN') then  //junção
         begin
           iUp := Obtem_JuncUp(Nodes.Item(i));
           If iUp <> nil then
             begin
               iUp.Selected := true;
               iUp.Marked := true;
             end;
         end;

        If (Nodes.Item(i).Shape = 50) and (dg_classe = 'DPN') then
        begin
          Begin
           aWbs  := Obtem_wbs(Nodes.Item(i));
           aAtor := Obtem_ator(Nodes.Item(i));
           aWbs.marked := true;
           aAtor.marked := true;
           for j := 1 to awbs.Links.Count do
              awbs.Links.Item(j).marked := true;
           for j := 1 to aAtor.Links.Count do
             aAtor.Links.Item(j).marked := true;
          end;
          If Nodes.Item(i).Shape in [50,79] then
           Begin
             for j := 1 to Nodes.Item(i).Links.Count do
              Begin
                If Nodes.Item(i).Links.Item(j).LinkStyle = 3 then
                 Begin
                   If Nodes.Item(i).Links.Item(j).Org.Shape = 1 then //decomposição
                      Nodes.Item(i).Links.Item(j).Org.marked := true;
                 end;
              end;
           end;
         end;
          // inibido = problema com correlacao --> vide cola_sel
          for j := 1 to Nodes.Item(i).Links.Count do
           Begin
             Nodes.Item(i).Links.item(j).Marked := true;
           end;
         Nodes.Item(i).Marked := true;
      end;
      Copy(2);  //copia os marcados(marked = true)
      Desmarca;

end;

procedure TDG.Cola_sel( pCompleto : boolean;pConfirm : boolean;pABaixo : boolean;IdNode : integer);
var
i,j,k: integer;
awbs,aAtor,oAtiv : afNode;
wmin,wleft : double;
listaadeletar : tstringlist;
wlista : uListaObj;
oList : TList;
begin
   oList := TList.create;
   pCompleto := false;
   If self.IDG_DIR <> 'LIV' then
   Begin
     If pConfirm then
        Begin
          If MessageDlg(mens67, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            pcompleto := true;
        end
       else
        pCompleto := true;
       end;

     //reativar
   If self.IDG_DIR <> dg_classe then
     Raise exception.create(Mens66);

   If (self.EMPRESA <>  dg_cli) or (self.CENARIO <> dg_CENARIO) and (pCompleto)then
       Raise exception.create(Mens65);

    Paste(true);

    dg_copy := nil;
    tot := Nodes.Count;

     for i := 1 to  self.Nodes.Count do
      Begin

       If not self.Nodes.Item(i).MARKED then
          continue;
       If not self.Nodes.Item(i).Selectable then
          continue;

        If self.IDG_DIR <> 'LIV' then
        begin
         If self.Nodes.Item(i).Shape = 50 then
          Begin
           aWbs  := self.Obtem_wbs(Nodes.Item(i));
           If aWbs = nil then
            raise exception.create(EI1+' WBS');
           aAtor := self.Obtem_ator(Nodes.Item(i));
           If aAtor = nil then
            raise exception.create(EI1+ def1000);
           aWbs.selectable  := false;
          If not pCompleto then
           Begin
              awbs.Text  :='';
              aAtor.Text := '';
           end;
          { showmessage( inttostr(awbs.Links.count));
           for k := 1 to awbs.Links.Count do
              awbs.Links.Item(k).selectable := false;
           for k := 1 to aAtor.Links.Count do
             aAtor.Links.Item(k).selectable := false;  }
          end;
         end;
         If not pCompleto then
          Begin
           self.Nodes.Item(i).text := '';
           If self.Nodes.Item(i).Shape in [11,50,79,62,54,56,59,65,10,61,9,58,15,8,0,55,14,53,1] then
              wentityadded  (Nodes.Item(i));
          end
         else
          begin

            If pAbaixo then   //usado para copiar no nível decomposto (abaixo); zera aatividade
             begin

               If Nodes.Item(i).Shape in [50] then
                 begin
                   If  self.Nodes.Item(i).userdata = IdNode then // atividade decomposta
                    begin
                       self.Nodes.Item(i).text := '';
                       self.obtem_wbs(Nodes.Item(i)).Text := '';
                       self.Obtem_Ator(Nodes.Item(i)).Text := '';
                       wentityadded  (Nodes.Item(i));
                       self.Nodes.Item(i).Selected := true;
                       frm_main.Decomposto := true;
                    end
                   else
                     begin
                       oAtiv :=  self.Nodes.Item(i) ;
                       new(wlista);
                       wlista.eNode := oAtiv;
                       oList.Add(wLista) ;
                       oAtiv.shape    := 54;
                       Atributos(oAtiv,0,'DPN');
                     end;
                 end;

             end
            else
            If ( (self.IDG_DIR = 'DPN') and (self.Nodes.Item(i).Shape in [50]) or
                 (self.IDG_DIR = 'DMI') and (self.Nodes.Item(i).Shape in [1]) or
                 (self.IDG_DIR = 'DEO') and (self.Nodes.Item(i).Shape in [9])) THEN
             
             begin
                DiagDupl := false;
              //  showmessage( self.Nodes.Item(i).text+ inttostr(self.Nodes.Item(i).userdata));
                self.Check_Ascendencia(udado(tv.selected.data)^.Fcli,
                                     udado(tv.selected.data)^.FProj,
                                     udado(tv.selected.data)^.FDiag,
                                     self.Nodes.Item(i).UserData); 
                If DiagDupl then
                 begin
                   self.Nodes.Item(i).UserData := 0;
                   self.Nodes.Item(i).Text := '';
                   showmessage(Mens12);
                 end;

              tv.Incluir_TVDiag(tv.Selected,udado(tv.selected.data)^.Fcli,
                                     udado(tv.selected.data)^.FProj,
                                     Nodes.Item(i).UserData,Nodes.Item(i).Text,SELF.IDG_DIR,false);

             end;

          end;

      end;



      {If pAbaixo then
       begin

         for i := 1 to nodes.count do
          begin
             If not Nodes.Item(i).MARKED then
                continue;
             If wmin = 0 then
                wmin := nodes.item(i).left;

             wmin := min(nodes.item(i).left,wmin);
             If wmin = nodes.item(i).left then
                 k := i;
             for j := 1 to nodes.item(i).Links.Count do
              begin
               If (nodes.item(i).Links.Item(j).linkstyle in cFluxos) or  (nodes.item(i).Links.Item(j).linkstyle = 4) then
                  nodes.item(i).Links.Item(j).Rigid := true;

              end;
          end;


        //  wmin := wmin - 500;
       //   nodes.Item(k).Left := nodes.Item(k).Left - wmin;

          for i := 1 to nodes.count do
            nodes.Item(i).Left := nodes.Item(i).Left - wmin;


        {for i := 1 to nodes.count do
          begin

            for j := 1 to nodes.item(i).Links.Count do
              begin
               If (nodes.item(i).Links.Item(j).linkstyle in cFluxos) or  (nodes.item(i).Links.Item(j).linkstyle = 4) then
                  nodes.item(i).Links.Item(j).Rigid := false;

              end;
          end;

       end;    }

            // problemas com correlacao  : o fluxo é deleteado já que nào pode ser criado entre 2 entidades nào identificadas
     for i := 1 to  self.Nodes.Count do
      Begin
         If not self.Nodes.Item(i).Marked then
           continue;
          self.Nodes.Item(i).Selected := true;
          Begin
           for j := 1 to  self.Nodes.Item(i).Links.Count do
            Begin

              If self.Nodes.Item(i).Links.Item(j).LinkStyle in cFluxos then
               Begin
                If not pCompleto then
                  begin
                    self.Nodes.Item(i).Links.Item(j).UserData := 0  ;
                    self.Nodes.Item(i).Links.Item(j).text := ''
                  end

                else
                   self.Nodes.Item(i).Links.Item(j).Selected := true;

               end;
            end;
          end;


      end;


      self.Desmarca;
      // somente na fucção abaixo
      If pAbaixo then
       begin
          for i := 0 to oList.count-1 do
           begin
            wLista := oList[i];
            delete_Componentes(wLista.eNode) ;
           end;
          deletemarked;

       end;
      


       // deleta ref. circular (userdata = 0}
     { for i := 1 to  self.Nodes.Count do
      Begin
        for j := 1 to  self.Nodes.Item(i).Links.Count do
         begin
          If  self.Nodes.Item(i).Links.Item(j).UserData = 0 then
            Deleta_dg(self.Nodes.Item(i).Links.Item(j));
         end;
        If self.Nodes.Item(i).UserData = 0 then
          self.deleta_ativ(Nodes.Item(i));
      end; }
      


     { for i := 1 to  self.Nodes.Count do
      Begin
          for j := 1 to  self.Nodes.Item(i).Links.Count do
            Begin
              If self.Nodes.Item(i).Links.Item(j).Marked then
                 showmessage(Nodes.Item(i).Links.Item(j).Text);

            end;


      end;  }


   //  self.DeleteMarked;

end;


function  Tdg.Get_Nodes(orgNode : afNode;pTipo : char) : TList;
var                              // gera lista de todos os nodes saindo(tipo O) ou
 i ,j: integer;                    // entrando(tipo I) do Node OrgNode;
 iList : TList;
 nm,nm1 : string;
 mLst : uLst;
Begin
  iList := TList.create;
  result := nil;
  If pTipo = 'O'  then       // atividades destino
     iList := Get_nodesSaindo(OrgNode,iList)
  else
   If pTipo = 'I'  then   // atividades origem
     iList := Get_nodesEntrando(OrgNode,iList)
  else        // tudo :origem e destino
      Begin
       iList := Get_nodesEntrando(OrgNode,iList);
       iList := Get_nodesSaindo(OrgNode,iList);
      end;

   result := iList;
end;

function  Tdg.Get_NodesEntrando(pNode : afNode;pList : Tlist) : TList;
var
 i,j: integer;                    // entrando(tipo I) do Node OrgNode;
 nm,nm1 : string;
 mlst : uLst;
 Begin
   For i := 1 to pNode.InLinks.count do
   Begin
     If  pNode.Inlinks.item(i).org.Selectable then   // elimina os nodes usados p/wbs,ativ,etc..
       Begin
         new(mLst);
         If ClassList(pList,pNode.Inlinks.item(i).org) then    //verif se node ja na lista
            mLst^.eNode    := pNode.Inlinks.item(i).org
         else
            mLst^.eNode    := nil;

         If ClassLink(pList,pNode.Inlinks.item(i)) then
            mLst^.elnk     := pNode.Inlinks.item(i)
         else
            mLst^.elnk := nil;
         mLst^.eTipo    := 'I';
         pList.Add(mLst);
       end;
   end;
   result := pList;
end;

function  Tdg.Get_NodesSaindo(pNode : afNode;pList : Tlist) : TList;
var
 i,j: integer;                    // saindo(tipo O) do Node OrgNode;
 nm,nm1 : string;
 mLst : ulst ;
 Begin
   For i := 1 to pNode.OutLinks.count do
   Begin
     If  pNode.Outlinks.item(i).dst.Selectable then   // elimina os nodes usados p/wbs,ativ,etc..
       Begin
         new(mLst);
         If ClassList(pList,pNode.Outlinks.item(i).dst) then    //verif se node ja na lista
            mLst^.eNode    := pNode.Outlinks.item(i).dst
         else
            mLst^.eNode    := nil;

         If ClassLink(pList,pNode.Outlinks.item(i)) then
            mLst^.elnk     := pNode.Outlinks.item(i)
         else
            mLst^.elnk := nil;
         mLst^.eTipo    := 'O';
         pList.Add(mLst);
       end;
   end;
   result := pList;

end;

function  Tdg.ClassList(pList : TList;pNode : afNode) : boolean;
var                          //verifica e pNode existe em pList
j : integer ;
 Begin
  result := true;
  for j := 0 to pList.Count - 1 do
   Begin
    mLst := pList.Items[j];
    If mlst^.eNode <> nil then
     Begin
       If (mlst^.eNode.UserData =  pNode.userdata) and
       (mlst^.eNode.Shape =  pNode.Shape) then
         Begin
           result := false;
           break;
         end;
     end;

   end;
 end;

function  Tdg.ClassLink(pList : TList;pLink : afLink) : boolean;
var                          //verifica se pLink existe em pList
j : integer ;
 Begin
  result := true;
  for j := 0 to pList.Count - 1 do
   Begin
    mLst := pList.Items[j];
    If (mlst^.elnk) <> nil then
     Begin
       If (mlst^.elnk.UserData =  pLink.userdata)  then
         Begin
           result := false;
           break;
         end;
   end;
     end;

 end;


function  Get_links(orgNode : afNode;pTipo : char) : TList;
var                              // gera lista de todos os fluxos saindo(tipo O) ou
 i,j : integer;                    // entrando(tipo I) da atividade OrgNode;
 iList : TList;

Begin
  iList := TList.create;
  result := nil;
//  If not (OrgNode.Shape in [ 11,54,50,62,79 ]) then   // seleciona somente atividades
 //    exit;
  If pTipo = 'O'  then       // atividades destino
   Begin
      If  OrgNode.OutLinks.count > 0 then
       Begin
          for i := 1 to OrgNode.OutLinks.count do
           Begin  //seguinte é junção
             If OrgNode.Outlinks.item(i).Dst.Shape in[1,2] then
              Begin
                for j := 1 to OrgNode.Outlinks.item(i).Dst.OutLinks.count do
                 Begin
                   If OrgNode.Outlinks.item(i).Text <> '' then
                    Begin
                       new(mLst);
                       If  OrgNode.Outlinks.item(i).Dst.OutLinks.Item(j).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
                         Begin
                           // mLst^.eNode := OrgNode.Outlinks.item(i).Dst;
                            mLst^.elnk     := OrgNode.Outlinks.item(i);
                            mLst^.eTipo   := 'O';
                            iList.Add(mLst);
                         end;
                        end;
                 end;
              end;
             If OrgNode.Outlinks.item(i).Text <> '' then
              Begin
                 new(mLst);
                 If  OrgNode.Outlinks.item(i).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
                   Begin
                     // mLst^.eNode := OrgNode.Outlinks.item(i).Dst;
                      mLst^.elnk     := OrgNode.Outlinks.item(i);
                      mLst^.eTipo   := 'O';
                      iList.Add(mLst);
                   end;
              end;

           end;
       end;
   end
   else
   If pTipo = 'I'  then   // atividades origem
    begin
       For i := 1 to OrgNode.InLinks.count do
       Begin
         new(mLst);
         If  OrgNode.Inlinks.item(i).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
           Begin
              //mLst^.eNode := OrgNode.Inlinks.item(i).org;
              mLst^.elnk     := OrgNode.Inlinks.item(i);
              mLst^.eTipo   := 'I';
              iList.Add(mLst);
           end;

       end;
    end
    else        // tudo :origem e destino
      Begin
       If  OrgNode.OutLinks.count > 0 then
       Begin
          for i := 1 to OrgNode.OutLinks.count do
           Begin
             If OrgNode.Outlinks.item(i).Dst.Shape in[1,2] then
              Begin
                for j := 1 to OrgNode.Outlinks.item(i).Dst.OutLinks.count do
                 Begin
                   If  OrgNode.Outlinks.item(i).Dst.OutLinks.Item(j).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
                     Begin
                       If  OrgNode.Outlinks.item(i).Dst.OutLinks.Item(j).Text <> '' then
                        Begin
                         
                          new(mLst);
                          mLst^.elnk     := OrgNode.Outlinks.item(i).Dst.OutLinks.Item(j);
                          mLst^.eTipo   := 'O';
                          iList.Add(mLst);
                        end;
                     end;
                 end;
              end;

             If  OrgNode.Outlinks.item(i).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
               Begin
                //  mLst^.eNode := OrgNode.Outlinks.item(i).Dst;
                  new(mLst);
                  mLst^.elnk     := OrgNode.Outlinks.item(i);
                  mLst^.eTipo   := 'O';
                  iList.Add(mLst);
               end;
           end;
      end;
       For i := 1 to OrgNode.InLinks.count do
       Begin

         If  OrgNode.Inlinks.item(i).linkstyle in cFluxos then   // elimina os nodes usados p/wbs,ativ,etc..
           Begin
              new(mLst);
              mLst^.elnk     := OrgNode.Inlinks.item(i);
              mLst^.eTipo   := 'I';
              iList.Add(mLst);
           end;

       end;

   end;
   result := iList;

end;

function  Localiza_Fisico(pCli,pCenario,pCod,pDg : integer;pTipo : string;pDiag : string;pflow : TAddFlow) : afNode;
var                              // localiza o objeto orgnode no diagrama
 i : integer;                    // tipo : ap,oi,.... ; pDiag : DPN,DUC,....
 iDiag : TDiag_dados;            // pdgAberto : true qunado o diagrama provém diretamnet do diagrama em uso
 Obj_Tipo,wDir,wNomeDiag : string;

Begin
  result := nil;
  try


  wdir := bdx.DirFluxo;
  { abre todos os diagramas do cliente/projeto}
  iDiag :=  TDiag_dados.create(Application);
 // iDiag.Get_Diagrama(pCli,pCenario,pDg);
  If pcod > 0 then
    Begin
      iDiag.Get_Diagrama(pCli,pCenario,pCod);
      iDiag.Get_Diagrama(pCli,pCenario,iDiag.fieldbyname('DIAG_PAI_ID').ASINTEGER);
    end
  else
  If pdg > 0 then
     Begin
      iDiag.Get_Diagrama(pCli,pCenario,pdg);
     end
  else
    raise exception.Create(EI1);

  

    begin
     If Wdir <> '' then
       WNomeDiag := Wdir + iDiag.fieldbyname('diag_id').asstring
     else
       raise exception.create(mens94+Wdir);

    If FileExists(WNomeDiag) then    // abre o diagrama físico...
     Begin
     // Diagx := TAddFlow.create(self);
      pFlow.Loadfile(WNomeDiag);
     end;

     If iDiag.fieldbyname('Idg_Dir').asstring = pDiag then
       Begin
          for i := 1 to pFlow.Nodes.Count do
            Begin
              If pDiag = 'DPN' then
                 Begin
                  case pFlow.Nodes.Item(i).Shape of
                      11,54,50,62,79 : Obj_Tipo := 'AP';
                      56,59,65       : Obj_Tipo := 'EN';
                      55             : Obj_Tipo := 'EE';
                      14             : Obj_Tipo := 'RN';
                      1,2            : Obj_Tipo := 'JU';
                  end;
                 end;

              If obj_Tipo = pTipo then
               Begin
                // showmessage( inttostr(pFlow.Nodes.Item(i).UserData ));
                 If pFlow.Nodes.Item(i).UserData = pCod then
                  Begin
                    result := pFlow.Nodes.Item(i);
                    exit;
                  end;

               end;

            end;
       end;
    // iDiag.next;
    end;
    finally
     freeandnil(iDiag);

  end;
end;


{function  Localiza_Fisico(pCli,pCenario,pCod,pDg : integer;pTipo : string;pDiag : string;pflow : TAddFlow) : afNode;
var                              // localiza o objeto orgnode no diagrama
 i : integer;                    // tipo : ap,oi,.... ; pDiag : DPN,DUC,....
 iDiag : TDiag_dados;            // pdgAberto : true qunado o diagrama provém diretamnet do diagrama em uso
 Obj_Tipo,wDir,wNomeDiag : string;

Begin
  result := nil;
  try


  wdir := bdx.DirFluxo;
  // abre todos os diagramas do cliente/projeto
  iDiag :=  TDiag_dados.create(Application);
 //  iDiag.Get_Diagrama(pCli,pCenario,pDg);
 iDiag.Get_Diagrama(pCli,pCenario,pCod);
 iDiag.Get_Diagrama(pCli,pCenario,iDiag.fieldbyname('DIAG_PAI_ID').ASINTEGER);

    begin
     If Wdir <> '' then
       WNomeDiag := Wdir + iDiag.fieldbyname('diag_id').asstring
     else
       raise exception.create(mens94+Wdir);

    If FileExists(WNomeDiag) then    // abre o diagrama físico...
     Begin
     // Diagx := TAddFlow.create(self);
      pFlow.Loadfile(WNomeDiag);
     end;

     If iDiag.fieldbyname('Idg_Dir').asstring = pDiag then
       Begin
          for i := 1 to pFlow.Nodes.Count do
            Begin
              If pDiag = 'DPN' then
                 Begin
                  case pFlow.Nodes.Item(i).Shape of
                      11,54,50,62,79 : Obj_Tipo := 'AP';
                      56,59,65       : Obj_Tipo := 'EN';
                      55             : Obj_Tipo := 'EE';
                      14             : Obj_Tipo := 'RN';
                      1,2            : Obj_Tipo := 'JU';
                  end;
                 end;

              If obj_Tipo = pTipo then
               Begin
                // showmessage( inttostr(pFlow.Nodes.Item(i).UserData ));
                 If pFlow.Nodes.Item(i).UserData = pCod then
                  Begin
                    result := pFlow.Nodes.Item(i);
                    exit;
                  end;

               end;

            end;
       end;
    // iDiag.next;
    end;
    finally
     freeandnil(iDiag);

  end;
end;}

function  Consiste_modelo(pCli,pCenario : integer) : boolean;
var                              // localiza o objeto orgnode no diagrama
 i : integer;                    // tipo : ap,oi,.... ; pDiag : DPN,DUC,....
 iDiag : TDiag_dados;            // pdgAberto : true qunado o diagrama provém diretamnet do diagrama em uso
 Obj_Tipo,wDir,wNomeDiag : string;
 Diagx : TAddFlow;
 iDg : TDg;
Begin
  result := false;
  try
      wdir := bdx.DirFluxo;
      { abre todos os diagramas do cliente/projeto}
      iDiag :=  TDiag_dados.create(Application);
      iDiag.Get_DiagramasDPN(pCli,pCenario);
      iDg := Tdg.create;
      while not iDiag.eof do
      begin
         If Wdir <> '' then
           WNomeDiag := Wdir + iDiag.fieldbyname('diag_id').asstring
         else
           raise exception.create(mens94+Wdir);

        If FileExists(WNomeDiag) then    // abre o diagrama físico...
         Begin
           iDg.Loadfile(WNomeDiag);
           tot :=  idg.Nodes.Count;
           idg.Consiste_dg(pCli,pCenario,iDiag.FieldByName('IDG_ID').asinteger) ;
          end;

       iDiag.next;
      end;
    finally
    // freeandnil(iDiag);
    // idg.Free;
  end;
end;




function  Tdg.IsEmpty (pno : TTreenode) : boolean;
var
 ino : Ttreenode;
begin
  result := false;
 // iNo := tv.selected;
 // visible := false;

  if abre_diagrama(pNo) then
     begin
       selectall;
       If (Selnodes.count = 0) and (SelLinks.count = 0) then
          begin
            result := true;
          end;

     end;
   //  visible := true;
  // tv.selected := iNo;
end;

procedure Tdg.DiagExit(Sender: TObject);
 begin
   self.Salvar;
 end;

function Tdg.Get_Objeto : Tdados_tab;
 begin
    If TabInst = nil then
       TabInst := TDados_Tab.create(self);
    result := TabInst;
 end;

procedure Tdg.WMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
begin
   If Shift = [ssright] then
    begin
      If frm_cfg <> nil then
       begin
        If dgCfg.selNodes.count > 0 then
           dgCfg.Popupmenu := frm_cfg.popnode
        else
        If dgCfg.selLinks.count > 0 then
           dgCfg.Popupmenu := frm_cfg.popLink;
        exit;
       end;


      If frm_treeativ <> nil then
      begin
      If self.selNodes.count > 0 then   { DONE -oyves -c5.13 : Inserção de Imagem nas entidades. }
         begin
           If self.IDG_DIR = 'LIV'  then
              self.Popupmenu := frm_Treeativ.popliv
           else
              Begin
                self.Popupmenu := frm_Treeativ.popnode ;
                If self.IDG_DIR = 'DUC' then
                   self.popupMenu.Items[4].Enabled := false
                else
                   self.popupMenu.Items[4].Enabled := true;
                If self.IDG_DIR <> 'DPN' then
                   self.popupMenu.Items[3].Enabled := false
                else
                   self.popupMenu.Items[3].Enabled := true;
              end;
         end
      else
      If self.selLinks.count > 0 then
         begin
           If (self.IDG_DIR = 'DMI') or (self.IDG_DIR = 'LIV') or (self.IDG_DIR = 'DEO')then
              Begin
               frm_Treeativ.poplink.Items[0].enabled := false ;
               frm_Treeativ.poplink.Items[2].enabled := false ;
               frm_Treeativ.poplink.Items[3].enabled := false ;
               frm_Treeativ.poplink.Items[6].enabled := false ;

              end

           else
              Begin
              //frm_Treeativ.poplink.Items[0].caption := def102;
               frm_Treeativ.poplink.Items[0].enabled := true;
               frm_Treeativ.poplink.Items[2].enabled := true;
               frm_Treeativ.poplink.Items[3].enabled := true;
               frm_Treeativ.poplink.Items[6].enabled := true;
              end;
              
           self.Popupmenu := frm_Treeativ.popLink  ;
         end

      else
         self.PopupMenu := frm_Treeativ.EntPop;
      exit;

   end ;

  end;
end;


procedure Tdg.AtDblClick(Sender: TObject) ; // double click em objeto do diagrama
 begin
   If frm_cfg <> nil then
         exit;

   Abre_Objeto;
 end;

procedure Tdg.Abre_objeto ; // double click em objeto do diagrama
begin
  with self do
   begin
     If SelectedNode <> nil then
        begin
          entidade := selectedNode;
          frm_TreeAtiv.Trata_Entity(entidade,0);
        end
     else
     If SelectedLink <> nil then
        begin
          Link := SelectedLink;
          frm_TreeAtiv.Trata_Link(link,0);
        end;
   end;
end;

procedure Tdg.WMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
 Begin
  { S := (sender as Tobject).classname;
//   If frm_TreeAtiv = nil then
    Begin
      If  Tdg(sender as Tobject).selectednode <> nil then
       Begin
         Tdg(sender as Tobject).selectednode.ToolTip :=
            floattostr(Tdg(sender as Tobject).selectednode.Height)+' x '+
            floattostr(Tdg(sender as Tobject).selectednode.width);
       end;
    end;  }
 end;


procedure Tdg.WClick(sender : Tobject);
var
wLock : boolean;
 begin
    { TODO -c6-00-0029b :
Help : mostra o banco de dados em uso
Inibe Backup quando banco é SQL.
Não permite double click quand tela de configuração }

   If frm_cfg <> nil then
    exit;
   If (frm_main.Viewer) or (oAcesso.WACCESS = 1) then
    exit;
   editavel := true;

   If tv.Diagrama.IDG_DIR = 'LIV' then
    exit;

   If frm_treeAtiv <> nil then
    Begin
        {Begin
          wLock := tv.Locka_Diag(udado(tv.selected.data)^.Fcli,
                                 udado(tv.selected.data)^.FProj,
                                 udado(tv.selected.data)^.FDiag);
          If not wLock then  // encontrou diagrama bloquueado e nào conseguiu bloquear
            Begin
               Editavel         := false;
               odgLocked.MYLOCK := false;
               refresh;
               Raise exception.create(mens48);
            end ;
        end ;}
    end;
    If not editavel then
       Raise exception.create(mens48);
end;

function Tdg.Abre_diagrama(pNode : TTreeNode) : boolean;
var
dg_nome,iNome : string;      // mostra o diagrama correspondente ao nó da árvore
iMemo : Tmemo;

 begin
     result := false  ;
       begin
       tv.Diagrama.DG_DADOS.IDG_ID := 0;
        { TODO -c6.00.027 : Corrigido ; zerar diagram anterior para fins de lock }
       Current_lock := 0;
       If FileExists( udado(pNode.data)^.fDiagId) then
          begin
            EMPRESA :=  udado(tv.selected.data)^.Fcli;
            CENARIO :=  udado(tv.selected.data)^.FProj;
            DIAG_ID :=  udado(tv.selected.data)^.FDiagId;
            IDG_DIR :=  udado(tv.selected.data)^.fClasse;
            LoadFile(udado(pNode.data)^.fDiagId) ;
            self.IsOpen  := true;
            IDF_WBS_CODE := '';
            with TDados_tab.create(self) do  // pega wbs do diagrama
             Begin
              Open_objeto( udado(tv.selected.data)^.Fcli,udado(tv.selected.data)^.FProj,
                           udado(tv.selected.data)^.FDiag,'IDF_AP');
              self.IDF_WBS_CODE := fieldbyname('IDF_WBS_CODE').asstring;
              free;
             end;
            If frm_treeativ <> nil then
             Begin
               Shape       := palette(1);  //define entidade default (button down)
               LinkStyle   := palette(2);  //define link default (button down)
             end;
            result      := true;
          end ;
        end;
end;

function Tdg.salvar : boolean;
var
iNome,wDiag : string;
iMemo : Tmemo;
 begin
   If frm_cfg <> nil then
      exit;
   wdiag := self.DIAG_ID;
  // wDiag := LeftStr(self.DIAG_ID,length(self.DIAG_ID)-4);
 // wDiag := wDiag + inttostr(tv.Diagrama.IDG_PAI)+'.add';
   If frm_treeAtiv <> nil then
    begin
      try
       begin
         If (tv.Selected <> nil) and (tv.selected.level > 1) then
          begin
            self.SaveFile(wDiag);
          end;
       end;
      except
       begin
         If (tv.Selected <> nil) and (tv.selected.level > 1) then
          //self.SaveFile(wDiag);
       end;
      end;

    end;

 end;

function TDg.Create_class(pleft, pheight, pTop, pWidth: integer): afNode;
var
wtitle,wProp,wMet,wprinc : afnode;
wlink1,wlink2,wlink3 : aflink;
wpropTex : Tmemo;
begin
  wprinc := tv.Diagrama.SelectedNode;//.Diagrama.Nodes.Add(pLeft,pTop,pWidth,pHeight) ;
  pLeft := trunc(tv.Diagrama.SelectedNode.left);
  pTop  := trunc(tv.Diagrama.SelectedNode.top);
  pHeight := trunc(tv.Diagrama.SelectedNode.height);
  pWidth := trunc(tv.Diagrama.SelectedNode.width);
 // wprinc.shape := 1;
  wprinc.Text := '';

  { área do nome da classe}
  wtitle := tv.Diagrama.nodes.Add(pleft,ptop,pwidth,pheight * fProporcTitle div fProporcBase );
  wTitle.Shape := 1;
  wtitle.UserData := 1;
  wtitle.Moveable := false;
  wtitle.Selectable := false;
  //wtitle.Text := 'title';

  WLink1            := wprinc.OutLinks.Add(Wtitle);  //wbs
  Wlink1.LinkStyle  := 3;
  Wlink1.Rigid      := true;
  Wlink1.Selectable := false;
  WLink1.Hidden     := true;
  Wlink1.AdjustOrg  := false;
  Wlink1.AdjustDst  := false;

  { área dos atributos}
  wProp := tv.Diagrama.nodes.Add(pleft,ptop+wtitle.Height,pwidth,pheight * fProporcProp div fProporcBase);
  wProp.Shape := 1;
  wProp.UserData := 2; //properties
  wProp.Moveable := false;
  wProp.Selectable := false;
  //wprop.Text := 'property';
  wProp.Alignment := 0;

  WLink2            := wprinc.OutLinks.Add(Wprop);  //properties
  Wlink2.LinkStyle  := 3;
  Wlink2.Rigid      := true;
  Wlink2.Selectable := false;
  WLink2.Hidden     := true;
  Wlink2.AdjustOrg  := false;
  Wlink2.AdjustDst  := false;


  { área dos métodos}
  wMet := tv.Diagrama.nodes.Add(pleft,wProp.top+wprop.Height,pwidth,pheight * fProporcMet div fProporcBase);
  wMet.Shape := 1;
  wMet.Moveable := false;
  wMet.Selectable := false;
  wmet.UserData := 3; //metodos
 // wmet.Text := 'Métodos';
  wmet.Alignment := 0;

  WLink3            := wprinc.OutLinks.Add(WMet);  //métodos
  Wlink3.LinkStyle  := 3;
  Wlink3.Rigid      := true;
  Wlink3.Selectable := false;
  WLink3.Hidden     := true;
  Wlink3.AdjustOrg  := false;
  Wlink3.AdjustDst  := false;

  result := wprinc;
end;




function TDg.Apply_color(pNode: afnode): afnode;
var
wtitulo,watrib,wmetodo : afnode;
Begin
 wtitulo := get_title(pNode);
 watrib := get_attributes(pNode);
 wMetodo:= get_metodos(pNode);
 If Wtitulo <> nil then
       Begin
          Wtitulo.fillcolor        := pNode.FillColor;
          Wtitulo.drawcolor        := pNode.DrawColor;
          Wtitulo.DrawStyle       := pNode.DrawStyle;
          Wtitulo.DrawWidth       := pNode.DrawWidth;
          wtitulo.font            := pNode.Font;
       end;
       If Watrib <> nil then
       Begin
          wAtrib.fillcolor         := pNode.FillColor;
          wAtrib.drawcolor         := pNode.DrawColor;
          wAtrib.DrawStyle        := pNode.DrawStyle;
          wAtrib.DrawWidth        := pNode.DrawWidth;
          wAtrib.font             := pNode.Font;
       end;
       If WMetodo<> nil then
       Begin
          WMetodo.fillcolor        := pNode.FillColor;
          WMetodo.drawcolor        := pNode.DrawColor;
          WMetodo.DrawStyle       := pNode.DrawStyle;
          WMetodo.DrawWidth       := pNode.DrawWidth;
          WMetodo.font            := pNode.Font;
       end;

end;





function TDg.Get_Title(pNode: afnode): afnode;
var
i : integer;
begin
 result := nil;
 for i := 1 to pNode.OutLinks.Count do
  Begin
   If pNode.OutLinks.Item(i).LinkStyle = 3 then
    Begin
     If pNode.OutLinks.Item(i).Dst.UserData = 1 then
        result :=  pNode.OutLinks.Item(i).Dst;
    end;
  end;
end;

function TDg.Get_Attributes(pNode: afnode): afnode;
var
i : integer;
begin
 result := nil;
 for i := 1 to pNode.OutLinks.Count do
  Begin
   If pNode.OutLinks.Item(i).LinkStyle = 3 then
    Begin
     If pNode.OutLinks.Item(i).Dst.UserData = 2 then
        result :=  pNode.OutLinks.Item(i).Dst;
    end;
  end;
end;

function TDg.Get_Metodos(pNode: afnode): afnode;
var
i : integer;
begin
 result := nil;
 for i := 1 to pNode.OutLinks.Count do
  Begin
   If pNode.OutLinks.Item(i).LinkStyle = 3 then
    Begin
     If pNode.OutLinks.Item(i).Dst.UserData = 3 then
        result :=  pNode.OutLinks.Item(i).Dst;
    end;
  end;
end;



procedure TDG.SetEntidade(const Value: afNode);
begin
  FEntidade := Value;
end;

procedure TDG.SetLink(const Value: afLink);
begin
  FLink := Value;
end;

procedure Tdg.Abaixo(pEntity : afNode);
var
 Wtot,i,Wfilho,Wpos,watorid ,IdEntity: integer;
 Wnode ,wnodeFilho: TTreeNode;
 mens ,wclass,watortext,wdesc : string;
 oDg : Tdg;
 oAtor : afnode;
 wnew : boolean;
Begin
try
  begin
   wnew := false;
   If not checa_acesso('',frm_main.SEGHABILIATADO,pEntity.userdata) then
      exit;
   with pEntity do
     begin
       Identity := pentity.userdata;
       wDesc    := pentity.Text;
       If self.IDG_DIR = 'DPN' then
       begin
       case shape  of //'acao_processo'then
         11,50,79  :
          begin
            If wDesc = '' then
               raise exception.create(mens17);
            If pEntity.tooltip = 'UC' then
               begin
                  wclass := 'DUC' ;
                  {with TDados_tab.create(self) do
                   begin
                      Get_CorrelatosBis(uDado(tv.selected.Data)^.Fcli,
                                    uDado(tv.selected.Data)^.FProj,'AP',pEntity.UserData,'CA','IDF_CA','ATOR_CATEGORIA','D') ;
                      wAtortext := fieldbyname('IDF_DESIGNACAO').asstring;
                      wAtorId :=  fieldbyname('IDF_CODIGO').asinteger;
                      free;
                   end; }
               end
            else
             Begin
               wclass := 'DPN';
               If (frm_main.viewer) then    //security
                 exit
               else
                begin
                   with Tdados_tab.create(self) do
                    Begin
                      Atualiza_Procedural(uDado(tv.selected.Data)^.Fcli,
                                    uDado(tv.selected.Data)^.FProj, pEntity.userdata);
                      free;
                    end;
                end;
             end;

            Cria_Sub(pEntity,True);
            self.salvar;

            If pEntity.tooltip = 'AP' then
                  oDg := tv.Diagrama.Abaixa_Objeto(tv.Diagrama,pEntity);

            WNode := tv.get_filho(tv.selected,pEntity.userdata) ; // pega nó da atividade atual
            If Wnode = nil then
               begin

                 Wnode := tv.Incluir_TVDiag(tv.selected,uDado(tv.selected.Data)^.Fcli,
                                uDado(tv.selected.Data)^.FProj,
                                pEntity.userdata,pEntity.Text,wclass,true);
                If Wnode = nil then
                   raise exception.create(EI3);
               end   ;




            tv.selected := Wnode;

            { If (wClass = 'DUC') and (tv.Diagrama.IsEmpty(tv.Selected)) then
                begin
                 // desenha ator no diagrama use case
                 frm_treeAtiv.SpeedButton35Click(frm_treeativ.SpeedButton35);  //aperta botão ator
                 oAtor := tv.Diagrama.Nodes.Add(400,400,400,400);
                 oAtor.Selected := true;
                 oAtor.Shape :=  53;
                 tv.Diagrama.Inclui_Node(tv.Diagrama);

                 oAtor.Text :=  wAtortext;
                 oAtor.UserData := wAtorId;
                end;   }
            //gera atividade no nível abaixo automaticamente
            If tv.Diagrama.IsEmpty(tv.Selected) then
             Begin
                If (wClass = 'DPN') and (wclass <> 'DUC') then
                  begin
                    If MessageDlg(mens127,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                     begin
                        tv.Diagrama.Cola_sel(true,false,true,IdEntity);
                        tv.Diagrama.Salvar;
                        wNew := true;
                     end;
                  end;
                 If oAcesso.WACCESS = 2 then
                   Begin
                     If uppercase(oAcesso.NOME) <> 'SUPERVISOR' then
                      Begin
                        with oPrivilegio.Create do  //cria privilégio para o criador
                          Begin
                           CriaPrivilegioDiag(uDado(tv.selected.Data)^.Fcli ,uDado(tv.selected.Data)^.FProj,
                                              Identity , oAcesso.IDUSUARIO ,'3' ,'1' ,wDesc ,DATE);
                           free;
                          end;
                      end;
                   end;

             end;
              

             tv.TvClick(self);
             If wnew then
              begin
               for i := 1 to tv.Diagrama.Nodes.count do
                begin
                 If tv.Diagrama.Nodes.Item(i).Shape = 50 then
                    begin
                     tv.Diagrama.Nodes.Item(i).EnsureVisible;
                     break;
                    end;
                end;
               tv.Diagrama.SelectAll;
                wNew := false;
              end;
          end;
       end;//end case
     end     // END DPN
     else
     If self.IDG_DIR = 'DMI' then
       begin
       case shape  of //'acao_processo'then
         1  :
          begin
            If wDesc = '' then
               raise exception.create(mens17);

             self.salvar;
            WNode := tv.get_filho(tv.selected,pEntity.userdata) ;
            If Wnode = nil then   // não ha Filho...
               begin
                  Wnode := tv.Incluir_TVDiag(tv.selected,uDado(tv.selected.Data)^.Fcli,
                           uDado(tv.selected.Data)^.FProj,
                           pEntity.userdata,pEntity.Text,self.IDG_DIR,true);
                  If Wnode = nil then
                     raise exception.create(EI3);

               end;
            tv.selected := Wnode;
            tv.TvClick(self);
           end;
          end; //end case

       end // END dmi
     else
     If self.IDG_DIR = 'DEO' then
       begin
       case shape  of //'acao_processo'then
         9  :
          begin
            If wDesc = '' then
               raise exception.create(mens17);

             self.salvar;
            WNode := tv.get_filho(tv.selected,pEntity.userdata) ;
            If Wnode = nil then   // não ha Filho...
               begin
                  Wnode := tv.Incluir_TVDiag(tv.selected,uDado(tv.selected.Data)^.Fcli,
                                uDado(tv.selected.Data)^.FProj,
                                pEntity.userdata,pEntity.Text,self.IDG_DIR,true);
                  If Wnode = nil then
                     raise exception.create(EI3);

               end;
            tv.selected := Wnode;
            tv.TvClick(self);
           end;
          end; //end case

       end // END dmi

     end;  // END PENTITY
  end; //END TRY
except
  begin
     If (pEntity.shape = 11) or (pEntity.shape = 50) or (pEntity.shape = 79) then   // acao de processo
        begin
          Cria_Sub(pEntity,false);
          Cria_SubAnt(pEntity,false);   // mantem compatibiliadde
        end;

     raise;
  end;
end;

end;

function Tdg.Abaixa_Objeto(pDg : Tdg;pNode : afNode)  : Tdg;
var                            //cria automaticamento objetos antecessores no fluxo decomposto
 lst,lst1 : Tlist;
 mLst,mlst1 : uLst;
 idg : Tdg;
 iNode,iNodeBranco : afNode;
 iLink : afLink;
   wx,wy,i,j ,delta: integer;
wtop,wleft : extended;
 begin

    Lst := pDg.Get_Nodes(pNode,'I');
    for i := 0 to Lst.Count-1 do
      Begin
       mLst := Lst.Items[i];
       If mlst.elnk <> nil then
        begin
           If mlst.elnk.Org <> nil then
            begin
               If  mLst.elnk.Org.Selectable then
                begin
                  mLst.elnk.Org.selected := true;
                   If mLst.elnk.Org.Shape = 1 then //connector
                    begin
                      Abaixa_Objeto(pdg,mLst.elnk.Org);
                    end;

                end;
               

            end;
       


        end;
      

      end;
    pdg.Copia_Sel;
    result := pDg;

 end;

{function Tdg.Abaixa_Objeto(pDg : Tdg;pNode : afNode)  : Tdg;
var                            //cria automaticamento objetos antecessores no fluxo decomposto
 lst : Tlist;
 mLst : uLst;
 idg : Tdg;
 iNode,iNodeBranco : afNode;
 iLink : afLink;
   wx,wy,i,j ,delta: integer;
wtop,wleft : extended;
 begin
 iDg := Tdg.Create;
 iDg.EMPRESA := pDg.EMPRESA;
 iDg.CENARIO := pDg.CENARIO;
 iDg.IDG     := pNode.UserData;
 iDg.Carga_Atrib;
 try
 { If pdg.AtivInicial(pNode) then
    Begin
     for i := 1 to pdg.Nodes.Count do
      Begin
       If pdg.Nodes.Item(i).Left < pNode.Left then
        Begin
          pdg.Nodes.Item(i).Selected := true;
        end;
      end;
      pdg.Copia_Sel;
    end
   else }
 {    begin


   Lst := pDg.Get_Nodes(pNode,'I');
    wtop :=  1000;
    wleft := 300;
    for i := 0 to Lst.Count-1 do
    Begin
     mLst := Lst.Items[i];
     If mlst.eNode <> nil then
        Begin
           If mlst.elnk.Org.Shape = 56 then
            Begin
             If  mLst.elnk.Org.Left < wleft + mlst.elnk.Org.Width + 1500 then
              iNode := idg.Nodes.Add(mLst.elnk.Org.Left,mLst.elnk.Org.top,50,50)
             else
              iNode := idg.Nodes.Add(wLeft,mLst.elnk.Org.top,50,50);
            end
           else
            iNode := idg.Nodes.Add(wLeft,mLst.elnk.Org.top,50,50);

       If mlst.elnk.Org.Shape <> 1 then
        Begin
          If mlst.elnk.Org.Shape IN [50,79] then
           iNode.Shape := 54
          else
           iNode.shape := mlst.elnk.Org.Shape;

         iNode.userdata := mlst.eNode.UserData;
         iNode.Text     := mlst.eNode.Text
        end
       else
        Begin
          iNode.Shape := 54;
          for j:= 1 to mlst.elnk.Org.InLinks.count do
            Begin
               If not mlst.elnk.Org.InLinks.item(j).Hidden then
                Begin
                  iNode.userdata := mlst.elnk.Org.InLinks.item(j).org.userdata;
                  iNode.Text     := mlst.elnk.Org.InLinks.item(j).org.text;
                end;
            end;
        end;


       Atributos(iNode,1,'DPN');

       wtop := wtop + iNode.height + 500;
       If i = 0 then   //cria atividade inicial em branco
        Begin
           iNodeBranco := idg.Nodes.Add(wLeft +iNode.Width+ 2000,iNode.Top,10,10)    ;
           iNodeBranco.shape := 50;

           idg.SelectedNode := iNodeBranco;
           idg.IDG_DIR := 'DPN';
           idg.Inclui_Node(iDg);
        end;


       If mlst.elnk.Org.Shape = 56 then    //evento de negócio
        Begin
          for j := 1 to mlst.elnk.Org.OutLinks.Count do
           Begin          //conecta todos os links saindo do evento
              If  mlst.elnk.Org.OutLinks.Item(j).LinkStyle in cFluxos then
               Begin
                 iLink := iNode.Links.Add(iNodeBranco);
                 iLink.LinkStyle := 2 ;
                 idg.Ajusta_Seta(iLink);
                 idg.Atrib_Link(iLink,'DPN');
                 iLink.UserData := mlst.elnk.Org.OutLinks.Item(j).UserData;
                 iLink.Text     := mlst.elnk.Org.OutLinks.Item(j).Text;
                 If j = 1 then
                  Begin
                    with TDados_tab.create(self) do
                     Begin
                       Cria_Correlacao ( idg.EMPRESA,idg.CENARIO,'AP', iNodeBranco.UserData,'EN',iNode.userData,' ' ,0,0);
                       free
                     end;
                  end;

               end;
           end;
        end

       else
        Begin
         iLink := iNode.Links.Add(iNodeBranco);
         iLink.LinkStyle := 5;
         idg.Ajusta_Seta(iLink);
         idg.Atrib_Link(iLink,'DPN');
         iLink.UserData := mlst.elnk.UserData;
         iLink.Text     := mlst.elnk.Text;

        end;
     end;

    end;
   end;
 finally
    idg.SelectAll;
    iDg.Copia_Sel;
    result := idg;
    //freeandnil(iDg);

 end;
end;}

procedure TDG.Acima;
var
 i,WAtiv,Wpai_ant,WIDG : integer;
 Wnode   : TTreeNode;
 mens : string;
 empty : boolean;
Begin
try
     begin
     self.salvar;
     If tv.selected.level < 3 then  // se nível diagram, não faz nada
         exit;

     If not checa_acesso('',frm_main.SEGHABILIATADO,udado(tv.selected.Data)^.fDiag) then
      exit;

     self.SelectAll;
     empty := (self.selnodes.Count = 0 );

     Wativ       := udado(tv.selected.Data)^.fDiag;
     tv.selected := tv.selected.Parent;
     

     tv.tvClick(self);
     With self do    //posiciona na atividade recomposta
      begin
        for i := 1 to Nodes.Count do
          begin
           If Nodes.Item(i).userdata = WAtiv then
             begin
               nodes.Item(i).selected := true;
               nodes.Item(i).ensureVisible;
               If empty then
                  begin
                   Cria_SubAnt(Nodes.Item(i),false);   // mantem compatibiliadde

                   Cria_Sub(Nodes.Item(i),false);
                  end;

               break;
             end;
          end;
       end;


     end;
except
  Begin
    raise;
  end;
end;
end;

procedure Tdg.Cria_SubAnt(pNode : afNode;pCria : Boolean);  // mantem compatibilidade
var                   //retangulo simbolo de decomposiçao
 WSubNOde : afNode;                   //vide funcao resize_rigid
 WSubLink,WSubLink1 : afLink;
 j,Wlst,Wtotl : integer;
begin
   WTotl := pNode.OutLinks.Count ;
   If (pNode.Shape <> 11) and not (pnode.Shape in [11,50,79]) then
      exit;
   For j := 1 to WTotl do
   begin
     Wlst := pNode.OutLinks.Item(j).LinkStyle ;
     If Wlst = 13 then
        begin
          If not pCria then      //destroi a retangulo de decomposicao
            begin
              If pNode.Outlinks.Item(j).dst.shape = 1 then
                 begin
                   pNode.Outlinks.Item(j).dst.marked := true;
                   self.deleteMarked;
                   exit;
                 end;
            end
         else
          exit;
        end;

   end;
end;


procedure TDG.Cria_Sub(pNode : afNode;pCria : Boolean);
var                   //retangulo simbolo de decomposiçao
 WSubNOde : afNode;                   //vide funcao resize_rigid
 WSubLink,WSubLink1 : afLink;
 j,Wlst,Wtotl : integer;
begin

  WTotl := pNode.OutLinks.Count ;

   For j := 1 to WTotl do
   begin
     Wlst := pNode.OutLinks.Item(j).LinkStyle ;
     If Wlst in [2,13] then
        begin
          If not pCria then      //destroi a retangulo de decomposicao
            begin
              If pNode.Outlinks.Item(j).dst.shape = 1 then
                 begin
                   pNode.Outlinks.Item(j).dst.marked := true;
                   self.deleteMarked;
                   exit;
                 end;
            end
         else
          exit;
        end;
   end;


   If pCria then
   begin
      WSubnode := self.Nodes.add(pNode.left+pNode.width / 6,
                  pNode.top + pNode.height,
                  pNode.width / 9,
                  pNode.height / 11);

     WSubnode.shape      := 1;
     WsubNode.Sizeable   := false;
     WSubNode.FillColor  := clBlack;
     WSUbNode.Selectable := false;

     WSubLink            := pNode.OutLinks.Add(WSubnode);
     WSublink.linkstyle  := 2;
     Wsublink.Rigid      := true;
     WSublink.Selectable := false;
     WSubLink.Hidden     := true;

     {WSubLink1 := WsubNode.OutLinks.Add(pNode);
     WSublink1.linkstyle := 13;
     Wsublink1.Rigid := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden := true;}
   end;

end;

procedure Tdg.Cria_DucAnt(pNode : afNode;pCria : Boolean;
                              pNodeInside : integer;pTop : real;
                              pLeft : real;pWidth : real;
                              pHeight : real;pRel : integer);  // usado para apagar bola UC versoes anteriores

var                   // círculo símbolo de use case
 WSubNOde ,wAtor: afNode;
 WSubLink,WSubLink1 : afLink;
 j ,wtot,wst : integer;
begin

   if not (pNode.shape in [11,50,79]) then
      exit;

   
   Wtot := pNode.OutLinks.Count ;
   For j := 1 to Wtot do
   begin
     Wst := pNode.outLinks.Item(j).LinkStyle ;
     If Wst = pRel then
        begin
        If not pCria then
          begin
            If pNode.outlinks.Item(j).dst.shape = 0 then
               begin
                 pNode.outlinks.Item(j).dst.marked := true;
                 self.deleteMarked;
                 exit;
               end;
          end
        else
          exit;
        end;
   end;

end;



procedure Tdg.Cria_Duc(pNode : afNode;pCria : Boolean;
                              pNodeInside : integer;pTop : real;
                              pLeft : real;pWidth : real;
                              pHeight : real;pRel : integer);

var                   // círculo símbolo de use case
 WSubNOde ,wAtor: afNode;
 WSubLink,WSubLink1 : afLink;
 j ,wtot,wst : integer;
begin

   if not (pNode.shape in [11,50]) then
      exit;
   WAtor := obtem_ator(pNode);
   If wator = nil then             { TODO -c6-00-022-1 : Testa retorno <> nil do ator }
     exit;
   Wtot := wator.OutLinks.Count ;
   For j := 1 to Wtot do
   begin
     Wst := wator.outLinks.Item(j).LinkStyle ;
     If Wst = pRel then
        begin
        If not pCria then
          begin
            If wator.outlinks.Item(j).dst.shape = 0 then
               begin
                 wAtor.outlinks.Item(j).dst.marked := true;
                 self.deleteMarked;
                 exit;
               end;
          end
        else
          exit;
        end;
   end;
   If pCria then
   begin
     WSubnode := self.Nodes.add(wAtor.left+wAtor.width-wAtor.width / 6
                  - wAtor.width / 9,
                  wAtor.top +wAtor.height,
                  wAtor.width / 9,
                  wAtor.height / 9);
     WSubnode.shape     := pNodeInside;
     WsubNode.Sizeable  := false;
     WSubNode.FillColor := clblack;
     WSUbNode.Selectable:= false;


     WSubLink := wAtor.OutLinks.Add(WSubnode);
     WSublink.linkstyle := pRel;
     Wsublink.Rigid     := true;
     WSublink.Selectable:= false;
     WSubLink.Hidden    := true;

     WSubLink1            := WsubNode.OutLinks.Add(wAtor);
     WSublink1.linkstyle  := pRel;
     Wsublink1.Rigid      := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden     := true;
   end;

end;



{procedure TDG.Cria_Duc(pNode : afNode;pCria : Boolean;
                              pNodeInside : integer;pTop : real;
                              pLeft : real;pWidth : real;
                              pHeight : real;pRel : integer);

var                   // cria círculo símbolo de use case
 WSubNOde : afNode;
 WSubLink,WSubLink1 : afLink;
 j ,wtot,wst : integer;
begin
   If not pNode.shape in[11,79,50] then
      exit;

   Wtot := pNode.OutLinks.Count ;
   For j := 1 to Wtot do
   begin
     Wst := pNode.outLinks.Item(j).LinkStyle ;
     If Wst = pRel then
        begin
        If not pCria then
          begin
            If pNode.outlinks.Item(j).dst.shape = 0 then
               begin
                 pNode.outlinks.Item(j).dst.marked := true;
                 self.deleteMarked;
                 exit;
               end;
          end
        else
          exit;
        end;
   end;
   If pCria then
   begin
     WSubnode := self.Nodes.add(pNode.left+pNode.width-pNode.width / 6
                  - pNode.width / 9,
                  pNode.top +pNode.height,
                  pNode.width / 9,
                  pNode.height / 9);
     WSubnode.shape     := pNodeInside;
     WsubNode.Sizeable  := false;
     WSubNode.FillColor := clblack;
     WSUbNode.Selectable:= false;


     WSubLink := pNode.OutLinks.Add(WSubnode);
     WSublink.linkstyle := pRel;
     Wsublink.Rigid     := true;
     WSublink.Selectable:= false;
     WSubLink.Hidden    := true;

     WSubLink1            := WsubNode.OutLinks.Add(pNode);
     WSublink1.linkstyle  := pRel;
     Wsublink1.Rigid      := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden     := true;
   end;

end; }

procedure Tdg.Inclui_Node(pDg : Tdg);
Begin
with pdg do
begin
     If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
        Raise exception.create(Mens49);

     If SelectedNode <> nil then
        begin
          entidade := selectedNode;
          case selectedNode.Shape of
            1 : Begin
                 If tv.Diagrama.IDG_DIR = 'CLS' then
                  Begin
                   tv.Diagrama.Create_class(500,5000,500,5000);
                   WentityAdded(selectedNode);
                     Atributos(SelectedNode,1,IDG_DIR);
                     exit;
                  end;
                end;
            //objetos informativos
            5,51 :     //connector
               begin
                If (IDG_DIR ='DPN') or (IDG_DIR  = 'DMI') or (IDG_DIR  = 'DUC') then
                   begin
                       If selectedNode.Shape = 5 then //arquivamento
                         Begin
                           selectedNode.Text        := def103;
                           selectedNode.Transparent := false;
                         end
                       else
                         Begin
                           selectedNode.Transparent := true;
                           SelectedNode.Zorder      := 1;
                         end;
                   end;
                     exit
               end;
            62 :
               begin

                If IDG_DIR = 'DUC' then  //use case DUC
                  begin
                    WentityAdded(selectedNode);
                    Atributos(SelectedNode,1,IDG_DIR);
                    exit;
                  end;
               end;
            61 :
               begin
                 SelectedNode.DrawColor   := backColor;   //texto
                 selectednode.transparent := true;
                 selectednode.text        := 'O';
               end;
            75 :
                begin
                   SelectedNode.DrawColor   := backColor;   //texto
                   selectednode.transparent := true;
                   selectedNode.DrawStyle   := 0;
                   If IDG_DIR = 'DPN' then
                   begin
                   // If Wnome_Ju = 'SPEEDBUTTON41' then
                   If frm_treeativ.Speedbutton41.Down then
                      begin
                        If frm_text = nil then
                          frm_text  := Tfrm_text.create(self);
                        frm_text.show;
                        exit;
                     end
                   else
                     begin
                      If frm_texto = nil then
                         frm_texto  := Tfrm_texto.create(self);
                      frm_texto.show;
                      exit;
                     end;
                   end
                  else
                    begin
                      If frm_text = nil then
                         frm_text  := Tfrm_text.create(self);
                      frm_text.show;
                      exit;
                    end;
                end;
          end;  //endcase

          If (IDG_DIR ='DPN') or (IDG_DIR  = 'DMI') or
             (IDG_DIR ='DUC') or (IDG_DIR  = 'DEO') or (IDG_DIR  = 'CLS') then

             begin
                WentityAdded(selectedNode);

                If SelectedNode.shape in[58] then    //oi
                  Begin
                    self.selectedNode.DrawColor   := self.BackColor;
                    Atributos(SelectedNode,1,IDG_DIR);
                  end;

                If SelectedNode.shape = 14 then    //regra
                   SelectedNode.text := def90
                else
                If SelectedNode.shape = 2 then    //junction
                   begin
                     SelectedNode.DrawColor := self.backColor;   //texto
                     selectednode.transparent := true;
                     Cria_Junction(self.SelectedNode);
                     Atributos(SelectedNode,1,self.IDG_DIR);
                   end
                else
                If  SelectedNode.shape in[11,79,50] then    //atividade
                   begin
                      // TODO -c6.00.026 : Corrigido : desenho atividade quando muito pequeno - erro
                     Atributos(SelectedNode,1,self.IDG_DIR);
                     If SelectedNode.shape in[11,50] then
                        Cria_atv(SelectedNode);
                     Atributos(SelectedNode,1,self.IDG_DIR);
                   end
                else
                    Atributos(SelectedNode,1,self.IDG_DIR);
                end  ;

        end; //selected node
        SelectedNode := nil;  //atenção
end;
end;

procedure Tdg.WMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
Act,i : LongInt;
Wleft : single;
w ,wtotlink, wat,wca,wif,woi: integer;
WSUbNode,pNode,NodeAnt: afNode;
NOdeEsc,LinkEsc : boolean;
begin
  Act := self.LastUserAction ;
try
  begin

    With self do
    begin
     If not Editavel then
      exit;
     If act = afNodeCreation then
      begin

         begin
           {wat := frm_main.WQTATIV;
           wca :=  frm_main.WQTCA;
           woi :=  frm_main.WQTOI ;
           If IDG_DIR = 'DPN' then
              wat := frm_main.WQTATIV-1
           else
           If IDG_DIR = 'DEO' then
              wca :=  frm_main.WQTCA-1
           else
           If IDG_DIR = 'DUC' then
              woi :=  frm_main.WQTOI-1 ;
           with Tdg.Create do
           Begin
              If DemoMaior(frm_main.wdemo,FALSE,TRUE,frm_main.wqtdemo,wat,wca,
                         frm_main.WQTRN-1,frm_main.WQTIF-1,frm_main.WQTOE-1,woi ) then  //versào demo ultrapassou
                 begin
                   raise exception.create(mens55);

                 end;
           end;   }

         end;

        Inclui_node(self);

      end  //node creation
      else
      If act = afLinkCreation then
         begin
           If (frm_main.viewer)  or (oAcesso.WACCESS = 1) then
            Raise exception.create(Mens49);
            case selectedLink.LinkStyle of
                13 : exit;
                 0: begin     //objetos informativos
                      If (IDG_DIR = 'DUC') or (IDG_DIR = 'DMI') then
                      Begin
                        exit;
                      end;

                     end;
                 4,5,7: begin    
                      If (IDG_DIR = 'CLS')  then      //uml
                      Begin
                        Ajusta_Seta(self.selectedLink);
                        If  selectedLink.LinkStyle = 4 then      //generalização
                          Begin
                           If bt_inf = 4 then
                              //selectedLink.ArrowDst := 14
                           else
                              //selectedLink.ArrowDst := 6;
                          end

                        else
                        If  selectedLink.LinkStyle = 5 then
                          Begin
                           // selectedLink.ArrowDst := 6 ;
                            selectedLink.DrawStyle := 2;
                          end
                        else
                        If  selectedLink.LinkStyle = 7 then
                           //selectedLink.ArrowDst := 0;
                        If not WRelationAdded(selectedLink) then
                           raise exception.create(mens116);
                        exit;
                      end;

                     end;
            end;

           Ajusta_Seta(self.selectedLink);

           If not WRelationAdded(selectedLink) then
              raise exception.create(mens116);
           Atrib_Link(selectedLink,tv.Diagrama.IDG_DIR);

          // If selectedLink.LinkStyle in cFluxos then
          //   selectedLink.ArrowMid :=selectedLink.Arrowdst;
           If tv.Diagrama.IDG_DIR = 'DPN' then
            Begin
              If SelectedLink.LinkStyle in cFluxos then
               Begin
                  If frm_escFluxos     = nil then
                   frm_escFluxos     := Tfrm_escFluxos.create(self);
                   frm_escFluxos.showmodal;

                  If frm_treeativ.FORMDG then
                   begin
                     If frm_treeativ.LISTA_DG then
                       frm_treeativ.Lista2Click(nil)
                     else
                       AtDblClick(nil);

                   end;
                 
               end;

            end;


         end
      else
      If act = afNodeResizing then
         begin
           Resize_Rigid(SelectedNode);
         end;

    end; //self
  end;
except
  begin
    If self.SelectedLink <> nil then
     Begin
       self.selectedLink.Marked := true;
       self.DeleteMarked;
     end;
    If self.SelectedNode <> nil then
     Begin
       self.selectedNode.Marked := true;
       self.DeleteMarked;
     end;

    raise;
  end;
end;
end;



procedure Tdg.WEntityAdded(pNode : afNode);
  var
  Went,Wtexto1 : afNode;
  wcodigo,WTextoNome,Wvis ,pTipo: string;
  WTotId,WtextoLeft,WTextoTop,WTextoId,WTextoWidth : integer;
  i : integer;
  Wuser,WTab : string;
  Wfont : IFontDisp;

 Begin
  // Went := self.selectedNode;
   Went := pNode;
   case Went.Shape of
    11,50,79,62 : went.tag := 'AP';                  //atividade


     54 : begin
           went.tag := 'AP';                  //processo externo
           went.FillColor := clSilver;
          end;
     56,59,65 : went.tag := 'EN' ;
     10,61 : begin
             went.tag := 'PS' ;
             self.selectedNode.Drawstyle :=  5 ; //Borda transparente
             Went.text := def91;
          end;

     9 : begin
            //went.tag := 'OG' ;
            went.tag := 'CA' ; //CORRIGIDO EM 31/07/2005
            self.SelectedNode.Alignment := 0;
         end;

     58,15: begin
            went.tag := 'OI' ;
            went.drawstyle := 5;
            AddPic(58);
          end;

     63   : begin
            went.tag := 'OI' ;
            went.drawstyle := 5;
            AddPic(63);
          end;


     8  : begin
            went.tag := 'OC' ;
            went.drawstyle := 5;
            AddPic(8);
          end;

     0  : went.tag := 'IF' ;
     55 : begin
            went.tag := 'EE' ;
            went.FillColor := clSilver;
          end;
     2 : begin
            went.tag := 'JU' ;
            //went.text := 'NOVA JUNÇÃO';
            //AddPic(2);
            //Cria_junction(Went);
         end;

     14 : begin
            went.tag := 'RN' ;
            went.transparent := true;
            went.drawstyle := 5;
          end;
     53 : begin              //ATOR
            went.tag := 'CA' ;
            self.SelectedNode.DrawColor := self.backColor;
            self.selectedNode.Transparent := true;
            AddPic(53);
          end;

     1 : Begin
          If tv.Diagrama.IDG_DIR = 'DMI'then
             went.tag := 'IF'
          else
          If tv.Diagrama.IDG_DIR = 'CLS'then
             went.tag := 'CS'
         end;



   end;
  WVis := 'N';

  If (went.tag = 'AP') OR      //VISIBLE
     (went.tag = 'EN') OR
     (went.tag = 'PE') OR
     (went.tag = 'OE') OR
     (went.tag = 'OI') OR
     (went.tag = 'OC') OR
     (went.tag = 'JU') OR
     (went.tag = 'DG') OR
     (went.tag = 'RN') OR
     (went.tag = 'OU') OR
     (went.tag = 'OS') OR
     (went.tag = 'OX') OR
     (went.tag = 'JS') OR
     (went.tag = 'JN') OR
     (went.tag = 'LJ') OR
     (went.tag = 'UR') OR
     (went.tag = 'TE') OR
     (went.tag = 'OG') OR
     (went.tag = 'CA') OR
     (went.tag = 'IF') or
     (went.tag = 'CS') or
     (went.tag = 'EE') then
        WVis := 'S';

   If went.tag = 'PE' then
        pTipo := 'AP'
     else
     If (went.tag = 'EE') or (went.tag = 'OG') then
        pTipo := 'CA'
     else
     If went.tag = 'OC' then
        pTipo := 'OI'
     else
        pTipo := went.tag;
      WTab := 'IDF_'+ptipo;
   If pTipo = '' then
     exit;
   If Tab = nil then
      Tab := TDados_tab.create(self);
   Tab.CLI_ID := self.EMPRESA;
   Tab.prj_id := self.CENARIO;
  If Demomaior(pTipo,false) then
     Begin
        Raise exception.create(mens55+'('+pTipo+')');
        exit;
     end;
   If pTipo <> 'OE' then // não cria objeto entidade nesse momento
      Tab.Cria_Inst(self.EMPRESA,self.CENARIO,self.IDG,Wtab,went.tag,Wvis,'',' ');
      // Tab.Cria_Inst(udado(tv.Selected.Data)^.Fcli,udado(tv.Selected.Data)^.FProj,udado(tv.Selected.Data)^.FDiag,Wtab,went.tag,Wvis,'',' ');
   Went.Userdata := Tab.IDF_CODIGO;
 end;

Procedure tdg.Mostrar_Pessoas(pNode : afNode);
 Begin
  tv.Diagrama.Nodes.Add(pNode.left + 100,pnode.top + 200,pNode.width,pNode.Height) ;
 end;


Procedure tdg.cria_Atv(pNode : afNode);
var                             //cria os o quadrado do wbs e o quadrado do ator.
 wtop,Wleft : real;
 WSubNOde,WSubNode1 : afNode;
 WSubLink,WSubLink1,WSubLink2,WSubLink3,WSubLink4,WSubLink5 : afLink;
 j ,wtot,wst : integer;
 worg,Wdst,Wp1,Wp2,Wp3,Wp4,Wp5 : afLinkPoint;
 Tot,i,Wlstyle : integer;
 WFont : IFontDisp;
 Wfnt : Tfont;
begin
  with self do
  begin

      WSubnode := Nodes.add(0,0,0,0);
      //ator
      WSubnode1 := Nodes.add(0,0,0,0);


     WSubnode.shape      := 1;
     WsubNode.Sizeable   := true;
     WSubNode.FillColor  := clWhite;
     WSUbNode.Selectable := false;
     WSUbNode.Moveable   := true;
     WSubNode.UserData   := 1; //wbs

     WSubnode1.shape      := 1;
     WSubNode1.FillColor  := clWhite;
     WsubNode1.Sizeable   := true;
     WSUbNode1.Selectable := false;
     WSUbNode1.Moveable   := true;
     WSubNode1.UserData   := 2; //Ator

     Wlstyle := 3;
     WSubLink1            := pnode.OutLinks.Add(Wsubnode);  //wbs
     WSublink1.LinkStyle  := Wlstyle;
     Wsublink1.Rigid      := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden     := true;
     Wsublink1.AdjustOrg  := false;
     Wsublink1.AdjustDst  := false;

     WSubLink3            := wsubnode.OutLinks.Add(pNode);
     WSublink3.linkstyle  := Wlstyle;
     Wsublink3.Rigid      := true;
     WSublink3.Selectable := false;
     WSubLink3.Hidden     := true;
     Wsublink3.AdjustOrg  := false;
     Wsublink3.AdjustDst  := false;

     WSubLink2            := pNode.outLinks.Add(WSubNode1);
     WSublink2.linkstyle  := Wlstyle;
     Wsublink2.Rigid      := true;
     WSublink2.Selectable := false;
     WSubLink2.Hidden     := true;
     Wsublink2.AdjustOrg  := false;
     Wsublink2.AdjustDst  := false;

     WSubLink4            := WSubNode1.outLinks.Add(pNode);
     WSublink4.linkstyle  := Wlstyle;
     Wsublink4.Rigid      := true;
     WSublink4.Selectable := false;
     WSubLink4.Hidden     := true;
     Wsublink4.AdjustOrg  := false;
     Wsublink4.AdjustDst  := false;
     //Wsublink4.ArrowDst   := 0;

     WSubnode.Left      :=  pNode.left;              //LEFT
     WSubNode.Top       := 2;
    // showmessage(floattostr(pNode.top)+'-'+floattostr(pNode.height)+'-'+inttostr(wwbs_height));
     WSubnode.top       :=  pNode.Top+pNode.Height-wwbs_height;                             //TOP
   //  showmessage(floattostr(wSubnode.top));
     WSubnode.width     :=  WWbs_Width;                             //WIDTH
     WSubnode.height    :=  wwbs_height;

     WSubNode1.Top       := 2;
//     wsubnode1.Top       := wsubnode.top;
     WSubnode1.width    :=  pNode.width-Wsubnode.width;//WAtor_Width;                             //WIDTH
     WSubnode1.height   :=  WAtor_height;

  end;


end;

function Tdg.WRelationAdded (prel : afLink):boolean;
var
  WRel  : afLink;
  Wentrel : afNode;
  Wstyle : integer;
  Wdst,Worg : integer;
  Wfont : IFontDisp;
  z ,Tot,i,wmax ,Junc_Id: integer;
  x0,y0,x1,y1  : real;
  Lp : afLinkPoint;
  iTab : Tdados_tab;
  wNodeSource,wNodeDest : afNode;
  iList : TList;
  mLst : uLst;
  Perc_atual : real;
Begin
   result          := true;
  // Wrel            := self.SelectedLink;
   wrel := prel;
   WEntDestination := Wrel.Dst;
   WEntSource      := Wrel.org;
   Wdst            := Wentdestination.Shape;
   Worg            := Wentsource.Shape;
   Wstyle          :=  Wrel.LinkStyle;
   GetOleFont(WFontLink,WFont);
   Wrel.Font       := Wfont;
   Wrel.DrawColor  := WCorLink;


 try
   begin
   iTab := TDados_tab.create(self);
   iTab.CLI_ID := self.EMPRESA;
   iTab.prj_id := self.CENARIO;
   with tv.Diagrama do
   begin
     If IDG_DIR = 'LIV' then
      exit;
                         //inibido em abr2005 : atençào
    If  ((WEntDestination.text = '' ) or (WentSource.text = '')) and ((IDG_DIR = 'DPN')OR (IDG_DIR = 'DUC')) then
           raise exception.create(Mens6);   //objetos não definidos

     If IDG_DIR = 'DPN' then    //
        begin
         //Wrel.ArrowDst := 4;
          If  Wrel.Org = Wrel.Dst then  // autorelação
           begin
            wrel.marked := true;
            deletemarked;
            exit
           end;
         If Wstyle in cFluxos then   //fluxos de dados
            begin
                 // evento com atividade
               If (WentSource.shape in [56,65]) and (WentDestination.Shape in [11,50,79]) then
                 begin
                   itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,'AP', WEntDestination.Userdata,'EN',WentSource.userData,' ' ,0,0);
                    //Wrel.ArrowDst := 3;
                    salvar;
                 end
               else    // correlação para custos
               If (WentSource.shape in [1]) and ( (WentDestination.Shape in [11,50,79,54]) or
                                                  (WentDestination.Shape in [1]) )  then  //  Junção(origem) com atividade ou Junção (destino)
                 begin

                  Junc_Id :=Obtem_JUncup(WentSource).UserData;
                  If Wentsource.Text = 'O'  then
                   Begin
                      tot := Get_FluxoOut(WentSource,false).Count;
                      {If  Tot = 2 then   // calculta automaticamente o % da segunta saida
                          Begin
                             with TDados_Tab.create(self) do
                              Begin
                                 Get_Correlacoes(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'JU',JUnc_Id,'AP');
                                 Perc_atual := 100 - Fieldbyname('PERC_CUSTO').asfloat;
                              end;

                          end
                      else }
                       Begin
                          //% de custo
                          If frm_perc_custo     = nil then
                             frm_perc_custo      := Tfrm_perc_custo.create(self);
                          frm_perc_custo.showmodal;
                          Perc_atual := frm_main.wPerc_Custo
                       end;
                   end
                  else
                   Begin
                     Perc_Atual := 100;
                   end;

                  // wmax := Cria_perc(wrel,WentSource,floattostr(Perc_atual));
                   itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,'JU',Junc_Id ,'AP',
                                         WEntDestination.Userdata ,' ',Perc_Atual,wMax) ;

                  //Wrel.ArrowDst := 3;
                  salvar;
                 end
              else
              If  (WentDestination.Shape in [1])  then  //  Junção(destino)
                 Begin
                   If not (Wentsource.Shape in [1,50,54]) then    //..provem de atividade ou outra junção
                    Raise exception.create(mens63);
                    //reativar e corrigir
                 { for i :=1 to wentDestination.InLinks.Count do
                    Begin
                     If wentDestination.InLinks.Item(i).linkstyle in cFluxos then
                      Raise exception.create(mens71);

                    end;  }

                 end
              else

               //atividade com atividade : não deixa conectar 2 atividadees destino saibdo de uma atividade fonte
              If (wentSource.Shape in [11,50,79,54])  then
               Begin
                  iList := Get_Nodes(wentsource,'O');
                  for i := 0 to iList.Count-1 do
                    Begin
                      mLst := iList.Items[i];
                      If mLst^.elnk <> wrel then
                       Begin
                          If mLst^.eNode <> nil then
                           Raise exception.create(Mens60);

                         end;
                     end;
               end;
             end
         else
         If Wstyle = 4 then   // Regra x acao_processo
              begin
                 If ((Wdst in [11,50,79]) and (Worg = 14 )) then
                   begin
                      If iTab.Get_Correlato( self.EMPRESA,self.CENARIO,'AP',WEntDestination.Userdata,'RN',WentSource.userData) then
                        Raise exception.create(Mens57);
                      itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                       'AP',WEntDestination.Userdata,'RN',
                                        WentSource.userData,' ',0,0);
                      wrel.drawstyle := 2; //tracejado
                      salvar;
                   end
                 else
                 If ((Worg in [11,50,79]) and (Wdst = 14 )) then
                   begin
                    raise exception.Create(mens37);
                   end
                 else

                 If (Worg in [11,50,79]) and (Wdst in [11,50,79]) then  //acao_processo x acao_processo
                     Begin
                       itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                        'AP',WentSource.userData,'AP',
                                         WEntDestination.Userdata,' ',0,0);
                       salvar;
                     end
                else
                 Raise exception.create(Mens56);
              end;
        end  //end DPN
       else
       If IDG_DIR = 'DUC' then
         begin
          If  Wrel.Org = Wrel.Dst then  // autorelacao
           begin
            wrel.marked := true;
            deletemarked;
            exit
           end;
          If Wstyle = 1 then     //correlacao OC --> OE
           begin
              { correlações entre OC e OE terão sempre OC como pai qualquer que seja o sentido da seta}

              If (Wdst = 8) and (Worg = 0)  then  //entidade(origem) com controle
                 begin
                   itab.Cria_Correlacao (self.EMPRESA,self.CENARIO,
                                  'OC',WEntDestination.Userdata,WentSource.Tag,
                                   WentSource.userData,' ',0,0);
                   salvar;
                 end
              else           //correlacao OE --> OC
              If  (Wdst = 0) and (Worg = 8)  then  // controle(origem) com entidade
                 begin
                   itab.Cria_Correlacao (self.EMPRESA,self.CENARIO,
                                  'OC',WentSource.userData,WEntDestination.Tag,WEntDestination.Userdata,' ',0,0);
                   salvar;
                 end

              { correlações entre OI e OE terão sempre OI como pai qualquer que seja o sentido da seta}
              else       //correlacao OE-->OI
              If (Wdst = 58)  and (Worg = 0) THEN  //  entidade (origem) comInterface
                 begin
                  itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                   'OI', WEntDestination.Userdata,WentSource.Tag,
                                       WentSource.userData,' ',0,0);
                  salvar;
                 end

              else        //correlacao OI-->OE
              If (Wdst = 0)  and (Worg = 58) THEN  // Interface(origem) com entidade
                 begin
                  itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                   'OI', WentSource.userData,WentDestination.Tag, WEntDestination.Userdata,' ',0,0);
                  salvar;
                 end
              else

              { correlações entre OC e OI terão sempre OI como pai qualquer que seja o sentido da seta}

              If (Wdst = 58) and (Worg = 8) then //objeto_controle(origem) x objeto_interface
                   begin
                     itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'OI', WEntDestination.Userdata,'OC',
                                     WentSource.userData,' ',0,0);
                     salvar;
                   end

              else

              If (Wdst = 8) and (Worg = 58) then //objeto_interface(origem)x objeto_controle
                   begin
                     itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'OI',  WentSource.userData ,'OC',
                                     WEntDestination.Userdata,' ',0,0);
                     salvar;
                   end

              else
              { correlações entre OI e OI terão sempre OI origem da setac omo pai }
              If  (Wdst = 58) AND (Worg= 58) THEN //objeto_interface x objeto_interface
                  begin
                     itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'OI', WentSource.userData   ,'OI',
                                    WEntDestination.Userdata,' ',0,0);
                     salvar;
                  end

              else
              { correlações entre OC e OC terão sempre OC origem da seta como pai }
              If  (Wdst = 8) AND (Worg= 8) THEN //objeto_interface x objeto_interface
                  begin
                     itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'OC', WentSource.userData   ,'OC',
                                    WEntDestination.Userdata,' ',0,0);
                     salvar;
                  end

              else
              { correlações entre OI e Ator CA terão sempre OI como pai qualquer que seja o sentido da seta}
              If  (Wdst = 58) AND (Worg= 53) THEN //ATOR x objeto_interface
                  begin
                     itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'OI',  WEntDestination.Userdata ,
                                     'CA',WentSource.userData ,' ' ,0,0);
                     salvar;
                  end

              else
              If  ((Wdst = 62) AND (Worg= 53))   THEN //ATOR x USE CASE
               begin
                 with Tdados_tab.Create(self) do
                  Begin
                    If not Get_Correlato(self.EMPRESA,self.CENARIO,'AP',WEntDestination.Userdata,'CA',WentSource.userData) then
                     Raise exception.create(mens125) ;
                  end;

               end
              else

              If  ((Wdst = 62) AND (Worg= 62))   THEN //USE CASE x USE CASE
              else
               begin
                  Wrel.marked := true;
                  self.Deletemarked;
                  raise exception.create(mens37);
               end;
           end;

         end   // end DUC
       else
      If IDG_DIR = 'DMI' then
        begin
          {case Wstyle of  0,2,3,5,6,7,8,9,10,11,12,13,61,79 :
           begin
              case bt_inf of
               1 :begin               //one to many
                   Wrel.ArrowOrg := 17;
                   Wrel.ArrowDst := 15;
                  end;
               2 :begin             //one optional to many
                   Wrel.ArrowOrg := 18;
                   Wrel.ArrowDst := 15;
                  end;
               3 :begin       // one ou many to many
                   Wrel.ArrowOrg := 19;
                   Wrel.ArrowDst := 15;
                  end;
              end;
           end;
          end;} // endcase

        end //end DMI
    else
    If IDG_DIR = 'CLS' then
        begin
          If Wstyle =  4 then
           Begin
             itab.Cria_Correlacao ( self.EMPRESA,self.CENARIO,
                                     'CS', WEntDestination.Userdata  ,'CS',
                                     WentSource.userData,' ',0,0);
             salvar;
           end;


        end //end CLS
    else
    If IDG_DIR = 'LIV'then
       exit;

       itab.Cria_Inst(self.EMPRESA,self.CENARIO,self.IDG,'IDF_DG','DG','S','',' ');
       Wrel.Userdata := itab.IDF_CODIGO;


   end;
   end;
 finally
    freeandnil(itab);
 end;

end;

procedure TDg.Atualiza_entity; // reatualiza as descrições
var
i,tot,j,totLink,Tb,WShape,Wcod,wstyl : integer;
pent,wnode  : afNode;
Wrel : afLink;
WClassName : string;
begin
  tot := tv.Diagrama.Nodes.Count;
  WChangeText := false;

  for i := 1 to tot do
  Begin
    Pent := tv.Diagrama.Nodes.item(i);
    TotLink := pent.links.Count;
    WShape := pent.Shape;
    If pent.UserData = 0 then
     continue;
     with  tv.empresas.cenarios.Diagramas.Objeto do
      begin
        CLI_ID := udado(tv.selected.Data)^.Fcli;
        PRJ_ID := udado(tv.selected.Data)^.FProj;
        Case wshape of
         11,50,79: Begin
                     for j := 1 to TotLink do
                      begin
                         Wrel   :=  pent.links.item(j);
                         Wstyl  :=  WRel.LinkStyle ;
                         Wcod   :=  Wrel.userdata;
                         If Wcod = 0 then
                            continue;
                         Case  Wstyl of
                          2,5,6,9 : begin     //fluxo de dados
                                     Tabela := 'IDF_DG';
                                     If not Open_Objeto(CLI_ID,PRJ_ID,wCod,TABELA) then
                                       raise exception.Create(EI1);
                                      Wrel.text := Fieldbyname('Idf_Designacao').asstring;
                                   end;
                         end;
                      end;
                      Tabela := 'IDF_AP';

                   end;
         56,59,65 :  Tabela := 'IDF_EN';  //'evento_negocio'

         58,15 ,8:   Tabela := 'IDF_OI';  //oi,oc
         2 :         Tabela := 'IDF_JU';  //Junção
         55,9,53:    Tabela := 'IDF_CA';  //objeto_ator  objeto_externa  organo') then
         10,61 :     Tabela := 'IDF_PS';   //Pessoa
         0 :         Tabela := 'IDF_OE';   // 'objeto_entidade'
         14 :        Tabela := 'IDF_RN';  // Regra'
        else
         continue;
        end;
         If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
             raise exception.Create(EI1+ '-'+Tabela+'-'+inttostr(pent.userdata)+'-'+inttostr(wshape));
         pent.text := Fieldbyname('Idf_Designacao').asstring;
         If Tabela = 'IDF_AP' then
          Begin
            Wnode := obtem_wbs(pent);
            If wnode <> nil then
              Wnode.text  := Fieldbyname('Idf_wbs_code').asstring;
            Wnode := obtem_ator(pent);
            If wnode <> nil then
               Get_Correlatos(CLI_ID,PRJ_ID,'AP',pent.userdata,'CA','IDF_CA') ;
            wnode.Text :=  Fieldbyname('Idf_designacao').asstring;
          end;


     end;
  end;
end;

procedure Tdg.Ajusta_Seta(pLink : afLink);
var
worg,Wdst,Wp1,Wp2,Wp3,Wp4,Wp5 : afLinkPoint;
Tot,i : integer;
begin
    plink.AdjustOrg := True ;
    Tot := plink.ExtraPoints.count;
    plink.AdjustDst := True ;

    case pLink.Linkstyle of
    0 : begin
          If WClass_dg = 'DMI' then
          Begin
            plink.extraPoints.add(plink.ExtraPoints.Item[0].x,plink.ExtraPoints.Item[0].y);
            inc(tot);
            Worg :=  plink.ExtraPoints.Item[0];
            Worg.x := plink.ExtraPoints.Item[0].x;
            Worg.y := plink.Org.Top + plink.Org.Height / 2;
            plink.Extrapoints.Item[0] := Worg;

            Worg :=  plink.ExtraPoints.Item[1];
            Worg.x := plink.Org.Left + pLink.Org.width + plink.Org.Width / 3;
            Worg.y := plink.ExtraPoints.Item[0].y;
            plink.Extrapoints.Item[1] := Worg;

            Worg :=  plink.ExtraPoints.Item[2];
            Worg.x := plink.ExtraPoints.Item[1].x ;
            Worg.y := plink.ExtraPoints.Item[1].y + plink.Org.Height / 2 +
                      plink.Org.Height / 6;
            plink.Extrapoints.Item[2] := Worg;

            for i:= 3 to tot - 3 do
            Begin
              Worg   :=  plink.ExtraPoints.Item[i];
              Worg.x := plink.ExtraPoints.Item[2].x;
              Worg.y :=  plink.ExtraPoints.Item[2].y;

              plink.Extrapoints.Item[i] := Worg;
            end;

          Worg   :=  plink.ExtraPoints.Item[tot-2];
          Worg.x :=  plink.org.left + pLink.org.width / 2;
          Worg.y :=  plink.ExtraPoints.Item[0].y + plink.Org.Height / 2 +
                     plink.Org.Height / 6;
          plink.Extrapoints.Item[tot-2] := Worg;

          Wdst :=  plink.ExtraPoints.Item[tot-1];
          Wdst.x := plink.org.left + pLink.org.width / 2;
          Wdst.y := plink.Org.top + plink.Org.height;
          plink.Extrapoints.Item[tot-1] := Wdst;

          end;

        end;

    5,7 : begin

          Worg   :=  plink.ExtraPoints.Item[0];
          Worg.x := plink.Org.Left + plink.Org.Width;
          Worg.y := plink.Org.Top + plink.Org.Height / 2;

          plink.Extrapoints.Item[0] := Worg;

          Wdst :=  plink.ExtraPoints.Item[tot-1];
          Wdst.x := plink.Dst.Left;
          Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;

          Wdst :=  plink.ExtraPoints.Item[tot-1];

          plink.Extrapoints.Item[tot-1] := Wdst;
        end;

    2 : begin
           Worg   :=  plink.ExtraPoints.Item[0];
           Wdst :=  plink.ExtraPoints.Item[tot-1];

           If (tv.Diagrama.IDG_DIR = 'CLS') then  //uml - classes
           Begin
             Worg.x := plink.Org.Left + plink.Org.Width/2;
             Worg.y := plink.Org.Top ;
             Wdst.x := plink.Dst.Left + plink.Dst.Width/2;
             Wdst.y := plink.Dst.Top + plink.Dst.Height  ;
           end
           else
            Begin
              Worg.x := plink.Org.Left + plink.Org.Width/2;
              Worg.y := plink.Org.Top + plink.Org.Height ;


              Wdst.x := plink.Dst.Left;
              Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;
              If pLink.Org.Shape = 1 then // juncao
               Begin      //juncao
                 If wDst.y <= plink.Org.Top then
                   Worg.y := plink.Org.Top ;
               end;
            end;

          plink.Extrapoints.Item[tot-1] := Wdst;
          plink.Extrapoints.Item[0] := Worg;
        end;
    4,13 : begin           //regra de negócio

          If (pLink.Linkstyle = 4) then
          begin
            Worg :=  plink.ExtraPoints.Item[0];
            Wdst :=  plink.ExtraPoints.Item[tot-1];

             If (tv.Diagrama.IDG_DIR = 'CLS') then  //uml - classes
               Begin
                 Worg.x := plink.Org.Left + plink.Org.Width/2;
                 Worg.y := plink.Org.Top ;
                 Wdst.x := plink.Dst.Left + plink.Dst.Width/2;
                 Wdst.y := plink.Dst.Top + plink.Dst.Height  ;
               end
             else
               Begin
                 Worg.x := plink.Org.left + plink.Org.width/2;
                 Worg.y := plink.Org.top + plink.Org.height;
                 Wdst.x := plink.Dst.Left + plink.dst.width/2;;
                 Wdst.y := plink.Dst.Top  ;
               end;

            plink.Extrapoints.Item[0] := Worg;
           
            plink.Extrapoints.Item[tot-1] := Wdst;
            exit;
          end;

        end;
    9  : begin
            Worg :=  plink.ExtraPoints.Item[0];
            Worg.x := plink.Org.Left + plink.Org.Width;
            Worg.y := plink.Org.Top + plink.Org.Height/2;
            plink.Extrapoints.Item[0] := Worg;

            Wdst :=  plink.ExtraPoints.Item[tot-1];
            Wdst.x := plink.Dst.Left;
            Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;
            plink.Extrapoints.Item[tot-1] := Wdst;

            Wp1   :=  plink.ExtraPoints.Item[1];
            Wp1.x := worg.x + plink.Org.Width/4;
            Worg.y := worg.y ;
            plink.Extrapoints.Item[1] := Wp1;

            Wp2   :=  plink.ExtraPoints.Item[2];
            Wp2.x := Wp1.x;
            Wp2.y := plink.Org.Top - plink.Org.Height / 4;
            plink.Extrapoints.Item[2] := Wp2;

            Wp3   :=  plink.ExtraPoints.Item[3];
            Wp3.x := plink.Dst.Left- plink.Dst.Width/4;
            Wp3.y := wp2.y ;
            plink.Extrapoints.Item[3] := Wp3;

            Wp4   :=  plink.ExtraPoints.Item[4];
            Wp4.x := Wp3.x  ;
            Wp4.y := wp1.y;
            plink.Extrapoints.Item[4] := Wp4;
          end;

    6  : begin
            Worg   := plink.ExtraPoints.Item[0];
            Worg.x := plink.Org.Left + plink.Org.Width/2;
            Worg.y := plink.Org.Top + plink.Org.Height;
            plink.Extrapoints.Item[0] := Worg;

            Wdst :=  plink.ExtraPoints.Item[tot-1];
            Wdst.x := plink.Dst.Left;
            Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;
            plink.Extrapoints.Item[tot-1] := Wdst;
            
            Wp1   := plink.ExtraPoints.Item[1];
            Wp1.x := Worg.x;
            Wp1.y := plink.Org.Top + plink.Org.Height +
                      pLink.org.Height/4;
            //If wp1.y > self.top + diag.height then
               //wp1.y := diag.top + diag.height;
            plink.Extrapoints.Item[1] := Wp1;

            Wp2   :=  plink.ExtraPoints.Item[2];
            Wp2.x := plink.Dst.Left - plink.Dst.Width/4;
            If Wp2.x < 0 then
               Wp2.x := 0;
            Wp2.y := wp1.y ;
            plink.Extrapoints.Item[2] := Wp2;

            Wp3   :=  plink.ExtraPoints.Item[3];
            Wp3.x := Wp2.x  ;
            Wp3.y := wdst.y;
            plink.Extrapoints.Item[3] := Wp3;
          end;
    end;
end;

Function  Tdg.Atrib_Link(pLink : afLink;pDiag : string) : boolean;
begin
   result := true; 
   If pLink = nil then
      Begin
         result := false;
         exit;
      end;
   with self do
   begin
   If pDiag = 'DPN' then
     begin
        case pLink.LinkStyle of
          2,5,6,9 :                     // DG normal DPN
             begin
                 pLink.font       := Wdg_fonte    ;
                 pLink.ForeColor  := Wdg_CorFonte ;
                 pLink.DrawColor  := Wdg_CorTraco ;
                 pLink.DrawWidth  := Wdg_EspTraco ;
                 pLink.DrawStyle  := Wdg_TipoTraco ;
                 pLink.AdjustOrg  := Wdg_adjorg ;
                 pLink.AdjustDst  := Wdg_adjdst ;
                 //pLink.ArrowOrg   := Wdg_AOrg  ;
                 pLink.ArrowMid   := Wdg_AMid ;
                 //pLink.Arrowdst   := Wdg_Adst;
             end;
          4 :                     // Conexão regra de Negócio
             begin
                 pLink.font       := Wcrn_fonte    ;
                 pLink.ForeColor  := Wcrn_CorFonte ;
                 pLink.DrawColor  := Wcrn_CorTraco ;
                 pLink.DrawWidth  := Wcrn_EspTraco ;
                 pLink.DrawStyle  := Wcrn_TipoTraco ;
                 pLink.AdjustOrg  := Wcrn_adjorg ;
                 pLink.AdjustDst  := Wcrn_adjdst ;
                 //pLink.ArrowOrg   := Wcrn_AOrg  ;
                 pLink.ArrowMid   := Wcrn_AMid ;
                 //pLink.Arrowdst   := Wcrn_Adst;
             end;
        end;
     end
   else
     If pDiag = 'DUC' then
     begin
        case pLink.LinkStyle of
       1 :               // conexão OI OE
          begin
             pLink.font       := Wcnx_fonte    ;
             pLink.ForeColor  := Wcnx_CorFonte ;
             pLink.DrawColor  := Wcnx_CorTraco ;
             pLink.DrawWidth  := Wcnx_EspTraco ;
             pLink.DrawStyle  := Wcnx_TipoTraco ;
             pLink.AdjustOrg  := Wcnx_adjorg ;
             pLink.AdjustDst  := Wcnx_adjdst ;
             //pLink.ArrowOrg   := Wcnx_AOrg  ;
             pLink.ArrowMid   := Wcnx_AMid ;
             //pLink.Arrowdst   := Wcnx_Adst;
          end;

       0 :                 // link DUC
         begin
             pLink.font       := Wlnk_fonte    ;
             pLink.ForeColor  := Wlnk_CorFonte ;
             pLink.DrawColor  := Wlnk_CorTraco ;
             pLink.DrawWidth  := Wlnk_EspTraco ;
             pLink.DrawStyle  := Wlnk_TipoTraco ;
             pLink.AdjustOrg  := Wlnk_adjorg ;
             pLink.AdjustDst  := Wlnk_adjdst ;
             //pLink.ArrowOrg   := Wlnk_AOrg  ;
             pLink.ArrowMid   := Wlnk_AMid ;
             //pLink.Arrowdst   := Wlnk_Adst;
         end;
       end;
     end
    else
     If pDiag = 'DMI' then
     begin
             pLink.font       := Wrl_fonte    ;
             pLink.ForeColor  := Wrl_CorFonte ;
             pLink.DrawColor  := Wrl_CorTraco ;
             pLink.DrawWidth  := Wrl_EspTraco ;
             pLink.DrawStyle  := Wrl_TipoTraco ;
             pLink.AdjustOrg  := Wrl_adjorg ;
             pLink.AdjustDst  := Wrl_adjdst ;
             //pLink.ArrowOrg   := Wrl_AOrg  ;
             pLink.ArrowMid   := Wrl_AMid ;
             //pLink.Arrowdst   := Wrl_Adst;
     end
     else
     If pDiag = 'DEO' then
     begin
       pLink.font       := Wdeo_fonte    ;
       pLink.ForeColor  := Wdeo_CorFonte ;
       pLink.DrawColor  := Wdeo_CorTraco ;
       pLink.DrawWidth  := Wdeo_EspTraco ;
       pLink.DrawStyle  := Wdeo_TipoTraco ;
       pLink.AdjustOrg  := Wdeo_adjorg ;
       pLink.AdjustDst  := Wdeo_adjdst ;
       //pLink.ArrowOrg   := Wdeo_AOrg  ;
       pLink.ArrowMid   := Wdeo_AMid ;
       //pLink.Arrowdst   := Wdeo_Adst;
     end;
   end;
end;

procedure TDG.Resize_Rigid(pNode : afNode);
var
WSUbNode,Wbs,Wator,wtitle,wproperty,wmet : afNode;
Wtot ,w: integer;
Wprop,Wh,WWidth,Wheight : real;
Wfont : IFontDisp;
Wfnt : Tfont;

begin
try
  Wfnt := Tfont.create;
  Wtot := pNode.OutLinks.Count ;


  If IDG_DIR = 'DPN' then
  begin
     { If pNode.Shape in [50,79,56,2,54,55,14] then
         begin
          If pNode.userdata = 0 then
             showmessage(def1011 + pNode.text)  ;
             exit;
         end;}
      If pNode <> nil then
      begin
        case pNode.Shape of    //Acao de processo
        54,11,50,62 :
         begin
          //
           begin
            Wbs    := Obtem_Wbs(pnode);
            Wwidth := pNode.width * Wwbs_prop_width;
            Wheight:= pNode.height * Wwbs_prop_Height;

            If Wbs <> nil then
            begin
              Wheight:= wbs.height;
              Wbs.Left := pnode.left;
              Wbs.Top  := pNode.Top + pNode.Height -Wheight;
              Wbs.width:= Wwidth;
              //Wbs.height := Wheight;
              Wwidth := pNode.width - Wbs.width;


            end;

            Wator := Obtem_Ator(pnode);
            If wator <> nil then
            begin
              If wbs = nil then
                Begin
                   raise exception.create(E20+def104+pNode.Text);
                  // exit;
                end;

              Wator.Left := pnode.left+ Wbs.width-1;
              Wator.Top  := Wbs.top;
              Wator.width:= Wwidth;
              Wator.height := Wheight;
            end;

            For w := 1 to WTot  do
            begin
              If pNode.OutLinks.Item(w).LinkStyle in [2,13] then    // decomposiçào
               begin
                  WsubNode        := pNode.OutLinks.Item(w).dst ;
                  WSubnode.left   := pNode.left+pNode.width / 6 ;
                  WSubnode.top    := pNode.top +pNode.height;
                  WSubnode.width  := pNode.width / 9;
                  WSubnode.height := pNode.height / 11;
                  pNode.OutLinks.Item(w).Hidden := true;
               end;

            end;
           // Wator := Obtem_Ator(pnode);
            If wator <> nil then
            begin

              Wator.Left   := pnode.left+ Wbs.width-1;
              Wator.Top    := Wbs.top;
              Wator.width  := Wwidth;
              Wator.height := Wheight;
              for w := 1 to wator.outlinks.Count do
               Begin
                 If (wator.OutLinks.Item(w).LinkStyle = 4) and
                     (wator.OutLinks.Item(w).dst.shape = 0) then      // bola duc
                   begin
                      WsubNode        := wator.outLinks.Item(w).dst ;
                      WSubnode.left   := wator.left+pNode.width / 6 ;
                      WSubnode.top    := wator.top +wator.height;
                      WSubnode.width  := wator.width / 7;
                      WSubnode.height := wator.height / 8;
                      Wsubnode.left   := (wator.left+wator.width) - WSubnode.width;
                      Wsubnode.height := WsubNode.width /2;
                   end;
               end;
            end;

           end;
         end;
        1 : begin
              for w := 1 to Wtot do
              begin
                
                If pNode.OutLinks.Item(w).LinkStyle = 13 then
                 begin
                   WWidth := pnode.width  ;
                   Wheight := pnode.height;
                   pnode.InLinks.Item(w).org.Height := WHeight;
                   pnode.InLinks.Item(w).org.Width  := Wwidth / 6;
                   pnode.InLinks.Item(w).org.Top    := pNode.Top;
                   pnode.InLinks.Item(w).org.Left   := pNode.Left;

                   {Wprop := (wwidth * wheight) / (Wnodewidth_ant * WNodeHeight_ant);
                   Wfont := pnode.Font ;
                   setOleFont(Wfnt,Wfont);
                   Wh := Wfnt.Height * Wprop ;
                   Wfnt.height:= round(wh);
                   Wfnt.Size :=  -wfnt.Height * 72  div wfnt.PixelsperInch ;
                   getOleFont(WFnt,Wfont);
                   pnode.Font := wfont; }
                   exit;
                 end;
              end;
            end;
        end;
      end;
  end
  else
  If IDG_DIR = 'CLS' then   //diagrama de classe
   Begin
     //título
     wTitle := Get_Title(pNode);
     If wtitle <> nil then
      Begin
        wTitle.Width := pNode.Width;
         wTitle.Left  := pNode.Left;
         wTitle.top := pNode.Top;
         wTitle.Height := pnode.height * fProporcTitle / fProporcBase ;
      end;


     //properties
     wProperty := Get_attributes(pNode);
     If wProperty <> nil then
      Begin
         wProperty.Width := pNode.Width;
         wProperty.Left  := pNode.Left;
         wProperty.top := pNode.Top + wtitle.Height;
         wProperty.Height := pnode.height * fProporcProp / fProporcBase ;
      end;


     //métodos
     wMet := Get_Metodos(pNode);
     If wMet <> nil then
      Begin
         wMet.Width := pNode.Width;
         wMet.Left  := pNode.Left;
         wMet.top := wProperty.Top + wProperty.Height;
         wMet.Height := pnode.height * fProporcMet / fProporcBase ;
      end;


   end;
except
 begin
  If  pNode.Shape = 1 then //junction
     begin

        showmessage(Def7771 + pnode.InLinks.item(1).org.text)
     end
    
  else
     showmessage(pnode.Text);

   end;
  pNode.selected := true;
  raise;
 end;

end;

Procedure tdg.AddPic(pPos : integer);
var
Wpic : IpictureDisp;
begin
  If frm_images = nil then
     frm_images := Tfrm_Images.create(self);
  Case pPos of
   11 : WImagem         := frm_images.im_ap.picture;
   58,15 : WImagem      := frm_images.im15_2.picture; // Antigo im15
   8  : WImagem         := frm_images.im8_2.picture; // Antigo im8
   63 : WImagem         := frm_images.im99.Picture;
   53 :begin
       WImagem := frm_images.im54.picture; // Antigo im53
        //  WImagem := frm_images.im55.picture;
         self.SelectedNode.Alignment := 0;
       end;
  end;

  GetOlePicture(WImagem,WPic);
  self.SelectedNode.picture            := Wpic;
  self.SelectedNode.picturePosition    := 1;
  self.SelectedNode.autosize           := 1;   //ajusta imagem a entidade
  self.selectedNode.DrawStyle          := afTransparent;
  self.selectedNode.Transparent        := true;
  self.SelectedNode.ZOrder             := 1;

end;

function Tdg.Obtem_wbs(pNode : afNode) : afNode;
var
z,tot : integer;

begin
  result := nil;
 tot :=  pNode.Outlinks.Count;
 for z := 1 to pNode.Outlinks.Count do
  begin
    a1 :=  pNode.Outlinks.Item(z).linkstyle;
    If pNode.Outlinks.Item(z).linkstyle = 3 then
    begin
      a2 :=  pNode.Outlinks.Item(z).dst.Left;
      a3 :=  pNode.left;
      www := pNode.Outlinks.Item(z).dst.UserData;
      If (www = 1) then
       Begin
          result := pNode.Outlinks.Item(z).dst;
          break;
       end
      else
       Begin
        If (pNode.Outlinks.Item(z).dst.Left = pNode.left) then
         Begin
          pNode.Outlinks.Item(z).dst.UserData := 1;
          result := pNode.Outlinks.Item(z).dst;
          break;
       end
       end;


    end;
  end;

  If result = nil then
   Begin
      for z := 1 to pNode.Outlinks.Count do  // mantém compatibilidade
        begin
          If pNode.Outlinks.Item(z).linkstyle = 10 then
          begin
            //If pNode.Outlinks.Item(z).dst.left = pNode.Left then
              Begin
                pNode.Outlinks.Item(z).dst.UserData := 1;
                result := pNode.Outlinks.Item(z).dst;
                break
              end;
             ;
          end;
        end;
   end;

   If result = nil then
    Begin
      for z := 1 to pNode.Outlinks.Count do
        begin
          a1 :=  pNode.Outlinks.Item(z).linkstyle;
          If pNode.Outlinks.Item(z).linkstyle = 3 then
          begin
            a2 :=  pNode.Outlinks.Item(z).dst.Left;
            a3 :=  pNode.left;
            www := pNode.Outlinks.Item(z).dst.UserData;
            If pNode.Outlinks.Item(z).dst.Left < Wator_left then
               begin
                result := pNode.Outlinks.Item(z).dst;
                pNode.Outlinks.Item(z).dst.UserData := 1;
                break;
               end;
          end;
        end;
    end;


end;

function Tdg.Obtem_Ator(pNode : afNode) : afNode;
var
z: integer;
begin
  result := nil;
  w := pNode.Outlinks.Count;
  for z := 1 to pNode.Outlinks.Count do
  begin
    If pNode.Outlinks.Item(z).linkstyle = 3 then
    begin
      www := pNode.Outlinks.Item(z).dst.UserData;
      If (www = 2)  then   { TODO -c6-00-022-1 : Ator se userdata = 2 ou left <. left da atividade }
         begin
            result := pNode.Outlinks.Item(z).dst;
            break;
         end
      else
       If (pNode.Outlinks.Item(z).dst.Left <> pNode.left)  then
        begin
           // pNode.Outlinks.Item(z).dst;
            result := pNode.Outlinks.Item(z).dst;
            break;
         end;
    end;
  end;

  If result = nil then               //`mantem compatibiliade
   Begin
      for z := 1 to pNode.Outlinks.Count do
        begin
          If pNode.Outlinks.Item(z).linkstyle = 11 then
          begin
            pNode.Outlinks.Item(z).dst.UserData := 2;
            result := pNode.Outlinks.Item(z).dst;
            break;
          end;
        end;
   end;

end;

function Tdg.Tipo_compo(pNode : afNode) : integer;  // 1 wbs ; 2 : ator
var
z: integer;
begin
  result := 0;
  w := pNode.Outlinks.Count;
  for z := 1 to pNode.Outlinks.Count do
    begin
      If pNode.Outlinks.Item(z).linkstyle = 3 then
        begin
          www := pNode.Outlinks.Item(z).dst.UserData;
          a2 :=  pNode.Outlinks.Item(z).dst.Left;
          a3 :=  pNode.left;
              { TODO -c6-00-022-1 : Ator se userdata = 2 ou left <. left da atividade }
          If (www = 2)  then   //ator
             begin
                result := 2;
                break;
             end
          else
          If (www = 1) then     //wbs
           Begin
              result := 1;
              break;
           end
          else
           If (pNode.Outlinks.Item(z).dst.Left <> pNode.left)  then
            begin
               // pNode.Outlinks.Item(z).dst;
                result := 2;     //ator
                break;
             end
          else
           If (pNode.Outlinks.Item(z).dst.Left = pNode.left) then
             Begin
              pNode.Outlinks.Item(z).dst.UserData := 1;
              result := 1;                  //wbs
              break;
             end ;
        end;
    end;



end;


function  Tdg.Palette (pgroup : integer) : integer;
var                         // 1 : entidade; 2 : link
k ,j: integer;
wpn : Tpanel;

begin
  Result := 0;

   begin
     {frm_TreeAtiv.pan_use.visible := false;
     frm_TreeAtiv.Pan_Proc.visible := false;
     frm_TreeAtiv.Pan_Org.visible := false;
     frm_TreeAtiv.Pan_Liv.visible := false;
     frm_TreeAtiv.pan_inf.visible := false;
     frm_treeAtiv.pan_class.visible := false;}

     //frm_TreeAtiv.Pan_tit.align := alNone;
     If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
         Begin
           frm_TreeAtiv.pan_alinh.visible := false;
           If (oAcesso.WACCESS = 1) then
             Begin
               frm_TreeAtiv.pan_use.visible := false;
               frm_TreeAtiv.Pan_Proc.visible := false;
               frm_TreeAtiv.Pan_Org.visible := false;
               frm_TreeAtiv.Pan_Liv.visible := false;
               frm_TreeAtiv.pan_inf.visible := false;
               frm_treeAtiv.pan_class.visible := false;
             end;
           exit;
         end;

      begin             // cliente e cenários
        If tv.Selected.Level = 0 then //cliente
         begin
         frm_treeativ.ToolBar1.Visible := false;
         frm_treeativ.ToolBar2.Visible := false;
         frm_treeativ.ToolBar3.Visible := false;
         frm_treeativ.ToolBar4.Visible := false;
           frm_TreeAtiv.pan_proc.visible := false;
           frm_TreeAtiv.Pan_Org.visible := false;
           frm_TreeAtiv.Pan_use.visible := false;
           frm_TreeAtiv.pan_Liv.visible := false;
           frm_TreeAtiv.Pan_class.visible := false;
           frm_TreeAtiv.Pan_cenario.visible := false;
           frm_TreeAtiv.pan_inf.visible := false;
           frm_TreeAtiv.Pan_cli.Visible := true;
           frm_TreeAtiv.Pan_cli.align := alTop;
           exit;
         end
        else
        If tv.Selected.Level = 1 then //cenario
         begin
         frm_treeativ.ToolBar1.Visible := false;
         frm_treeativ.ToolBar2.Visible := false;
         frm_treeativ.ToolBar3.Visible := false;
         frm_treeativ.ToolBar4.Visible := false;
           frm_TreeAtiv.pan_proc.visible := false;
           frm_TreeAtiv.Pan_Org.visible := false;
           frm_TreeAtiv.Pan_use.visible := false;
           frm_TreeAtiv.pan_Liv.visible := false;
           frm_TreeAtiv.Pan_class.visible := false;
           frm_TreeAtiv.pan_inf.visible := false;
           frm_TreeAtiv.Pan_cli.visible := false;
           frm_TreeAtiv.Pan_cenario.Visible := true;
           frm_TreeAtiv.Pan_cenario.align := alTop;
           exit;
         end
      end;

     If tv.diagrama.IDG_DIR = 'DPN'then
      begin
        If not frm_TreeAtiv.Pan_Proc.visible then

          begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
            frm_TreeAtiv.pan_use.visible := false;
            frm_TreeAtiv.Pan_Org.visible := false;
            frm_TreeAtiv.Pan_Liv.visible := false;
            frm_TreeAtiv.pan_inf.visible := false;
            frm_TreeAtiv.pan_class.visible := false;
            frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
            frm_TreeAtiv.SpeedButton9.visible := false;
            frm_TreeAtiv.SpeedButton14.enabled := true;
            frm_TreeAtiv.SpeedButton15.enabled := true;
            frm_TreeAtiv.Pan_Proc.visible := true;
            frm_TreeAtiv.pan_dpn.visible  := true;
            frm_TreeAtiv.Pan_proc.align   := alTop;

          end;
          result := Def_Button( frm_TreeAtiv.Pan_Proc,pgroup);
      end
   else
   If tv.diagrama.IDG_DIR = 'DUC' then
      begin
        If not frm_TreeAtiv.pan_use.visible then

          begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
            frm_TreeAtiv.pan_proc.visible := false;
            frm_TreeAtiv.Pan_Org.visible := false;
            frm_TreeAtiv.Pan_Liv.visible := false;
            frm_TreeAtiv.pan_inf.visible := false;
            frm_TreeAtiv.pan_class.visible := false;
            frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
            frm_TreeAtiv.SpeedButton14.enabled := false;
            frm_TreeAtiv.SpeedButton15.enabled := true;
            frm_TreeAtiv.pan_use.visible := TRUE;
            frm_TreeAtiv.Pan_use.align := alTop;

          end;
          result := Def_Button( frm_TreeAtiv.Pan_use,pGroup);
      end
    else
   If tv.diagrama.IDG_DIR = 'DEO'then
      begin
        If not frm_TreeAtiv.Pan_Org.visible then
         begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
            frm_TreeAtiv.Pan_Org.visible := true;
            frm_TreeAtiv.pan_proc.visible := false;
            frm_TreeAtiv.Pan_Liv.visible := false;
            frm_TreeAtiv.Pan_use.visible := false;
            frm_TreeAtiv.pan_inf.visible := false;
            frm_TreeAtiv.pan_class.visible := false;
            frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
            frm_TreeAtiv.SpeedButton9.visible  := false;
         //   frm_TreeAtiv.SpeedButton10.visible := false;
            frm_TreeAtiv.SpeedButton14.enabled := TRUE;
            frm_TreeAtiv.SpeedButton15.enabled := true;
            frm_TreeAtiv.Pan_org.align := alTop;

         end;
         result := Def_Button( frm_TreeAtiv.Pan_Org,pgroup);
      end
   else
   If tv.diagrama.IDG_DIR = 'LIV'then
      begin
        If not frm_TreeAtiv.Pan_Liv.visible then
         begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
           frm_TreeAtiv.pan_proc.visible := false;
           frm_TreeAtiv.Pan_Org.visible := false;
           frm_TreeAtiv.Pan_use.visible := false;
           frm_TreeAtiv.pan_inf.visible := false;
           frm_TreeAtiv.pan_class.visible := false;
           frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
           frm_TreeAtiv.SpeedButton9.visible := true;
         //  frm_TreeAtiv.SpeedButton10.visible := true;
           frm_TreeAtiv.SpeedButton14.enabled := false;
           frm_TreeAtiv.SpeedButton15.enabled := false;
           frm_TreeAtiv.Pan_Liv.visible := true;
           frm_TreeAtiv.Pan_Liv.align := alTop;

           frm_TreeAtiv.popupMenu := frm_TreeAtiv.popliv;
         end;
         result := Def_Button( frm_TreeAtiv.Pan_Liv,pGroup);
      end
   else
   If tv.diagrama.IDG_DIR = 'DMI'then
      begin
        If not frm_TreeAtiv.Pan_Inf.visible then
         begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
           frm_TreeAtiv.pan_proc.visible := false;
           frm_TreeAtiv.Pan_Org.visible := false;
           frm_TreeAtiv.Pan_use.visible := false;
           frm_TreeAtiv.pan_Liv.visible := false;
           frm_TreeAtiv.pan_class.visible := false;
           frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
           frm_TreeAtiv.SpeedButton9.visible := false;
         //  frm_TreeAtiv.SpeedButton10.visible := false;
           frm_TreeAtiv.SpeedButton14.enabled := true;
           frm_TreeAtiv.SpeedButton15.enabled := true;
           frm_TreeAtiv.Pan_Inf.visible := true;
           //frm_TreeAtiv.Pan_Inf.align := alTop;

         end;
         result := Def_Button( frm_TreeAtiv.Pan_inf,pgroup);
      end
   else
   If tv.diagrama.IDG_DIR = 'CLS'then
      begin
        If not frm_TreeAtiv.Pan_Class.visible then
         begin
         frm_treeativ.ToolBar1.Visible := true;
         frm_treeativ.ToolBar2.Visible := true;
         frm_treeativ.ToolBar3.Visible := true;
         frm_treeativ.ToolBar4.Visible := true;
           frm_TreeAtiv.pan_proc.visible := false;
           frm_TreeAtiv.Pan_Org.visible := false;
           frm_TreeAtiv.Pan_use.visible := false;
           frm_TreeAtiv.pan_Liv.visible := false;
           frm_TreeAtiv.pan_cli.visible := false;
            frm_TreeAtiv.pan_cenario.visible := false;
           frm_TreeAtiv.SpeedButton9.visible := false;
         //  frm_TreeAtiv.SpeedButton10.visible := false;
           frm_TreeAtiv.SpeedButton14.enabled := false;
           frm_TreeAtiv.SpeedButton15.enabled := false;
           frm_TreeAtiv.Pan_class.visible := true;
           frm_TreeAtiv.Pan_class.align := alTop;
           frm_TreeAtiv.Pan_Inf.visible := false;

         end;
         result := Def_Button( frm_TreeAtiv.Pan_class,pgroup);
      end ;


    //  result := Def_Button( frm_TreeAtiv.Pan_class,pgroup);
   end;
   //frm_TreeAtiv.Pan_tit.visible := true;
   //frm_TreeAtiv.Pan_tit.align := alTop;
   //frm_TreeAtiv.Pan_tit.Enabled := false;
   //frm_TreeAtiv.Pan_tit.Visible := false;
   frm_treeativ.ToolBar1.Width := 48;
   frm_treeativ.ToolBar2.Width := 350;
   frm_treeativ.ToolBar3.Width := 122;
   frm_treeativ.ToolBar4.Width := 169;
   frm_treeativ.ToolBar1.Height := 22;
   frm_treeativ.ToolBar2.Height := 22;
   frm_treeativ.ToolBar3.Height := 22;
   frm_treeativ.ToolBar4.Height := 22;

end;

function Tdg.Def_Button( pPn : Tpanel;pGroup : integer) : integer;
var                           // pGroup 1 : entidade; 2 : link
k : integer;
begin
   result := 0;
   for k := 0 to pPn.ControlCount - 1 do
    begin
      If pPn.Controls[k] is TSpeedButton then
      begin
        If TspeedButton(pPn.Controls[k]).down then
           begin
             If TspeedButton(pPn.Controls[k]).GroupIndex = pgroup then
             Begin
               result := pPn.Controls[k].tag;
               If (pGroup = 2) and (tv.diagrama.IDG_DIR = 'DMI') then   //link  DMI
                  Begin
                    bt_inf := 1;
                  end;
               break;
             end;

           end;
      end;
    end;
end;

function Tdg.Carga_Atrib : boolean;     // carrega os atributos a partir dos templates
var
i : integer;

begin
result := true;
 If frm_cfg = nil then
   frm_cfg := tfrm_cfg.create(self);

try
  begin
      for i := 1 to length(cClasse) do
      begin
         DG_ATU := 'CFG'+cClasse[i]+'.ADD';
         If not fileexists(BDx.DirFluxo +dg_atu) then
           begin
            result := false;
            exit;
           end;
         dgcfg.Loadfile(BDx.DirFluxo +dg_atu);
         self.Salva_Atrib(cClasse[i]);
      end;
      frm_cfg.close;
  end;
except
  begin
     result := false;
     raise;
  end;
end;
end;

procedure TDG.Salva_Atrib(pDiag : string);
var
i,z : integer;
Wator,WWbs : afNode;
WLink : afLink;
t : tcolor;
begin
 with self do
  begin
       WShowGrid      := dgcfg.ShowGrid;
       WTipoGrid      := dgcfg.Gridstyle ;
       Wx             := dgcfg.XGrid;
       Wy             := dgcfg.YGrid;
       WSnapToGrid    := dgcfg.SnapToGrid ;
       WGridColor     := dgcfg.gridcolor;
       WDiagColor     := dgcfg.backcolor;



  If pDiag = 'DPN' then
  begin
    for i := 1 to dgcfg.nodes.count do
      begin
        If dgcfg.nodes.item(i).shape in [11,50] then
        begin
          WAtv_Height    :=  dgcfg.nodes.item(i).Height;
          WAtv_align     :=  dgcfg.nodes.item(i).alignment;
          WAtv_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
          WAtv_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
          WAtv_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
          WAtv_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
          WAtv_Fonte     :=  dgcfg.nodes.item(i).Font;
          WAtv_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
          WAtv_width     :=  dgcfg.nodes.item(i).Width;


          WWbs := dgcfg.obtem_Wbs(dgcfg.nodes.item(i));
          If WWbs <> nil then
          begin
            WWbs_align     :=  WWbs.alignment;
            WWbs_Borda     :=  WWbs.DrawStyle;
            WWbs_EspBorda  :=  WWbs.DrawWidth;
            WWbs_CorBorda  :=  WWbs.DrawColor;
            WWbs_CorFundo  :=  WWbs.FillColor;
            WWbs_Fonte     :=  WWbs.Font;
            WWbs_CorFonte  :=  WWbs.ForeColor;
            WWbs_width     :=  WWbs.Width;
            WWbs_Height    :=  WWbs.Height;
            WWbs_Prop_Width := Wwbs_width / WAtv_Width;
            WWbs_Prop_height := Wwbs_Height / WAtv_Width;
            WWbs_Left      :=  WWbs.Left;
            WWbs_Top       :=  WWbs.Top;
           // wwbs.userdata  := 1;
          end;

          WAtor := dgcfg.obtem_Ator(dgcfg.nodes.item(i));
          If Wator <> nil then
          begin
            WAtor_align     :=  WAtor.alignment;
            WAtor_Borda     :=  WAtor.DrawStyle;
            WAtor_EspBorda  :=  WAtor.DrawWidth;
            WAtor_CorBorda  :=  WAtor.DrawColor;
            WAtor_CorFundo  :=  WAtor.FillColor;
            WAtor_Fonte     :=  WAtor.Font;
            WAtor_CorFonte  :=  WAtor.ForeColor;
            WAtor_width     :=  WAtor.Width;
            WAtor_Height    :=  WAtor.Height;
            WAtor_Left      :=  WAtor.Left;
            WAtor_Top       :=  WAtor.Top;
            WAtor_Prop_Width := WAtor_width / WAtv_Width;
            WAtor_Prop_height := WAtor_Height / WAtv_Width;
            wAtor.userdata   := 2;
          end;
        end
        else
        If dgcfg.nodes.item(i).shape in [56,65] then    //evento de negocio
          begin
            Wen_align     :=  dgcfg.nodes.item(i).alignment;
            Wen_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wen_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wen_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wen_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wen_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wen_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wen_width     :=  dgcfg.nodes.item(i).Width;
            Wen_Height    :=  dgcfg.nodes.item(i).Height;
            If dgcfg.nodes.item(i).outlinks.Count > 0 then
              begin
                Wlink := dgcfg.nodes.item(i).Outlinks.item(1) ;
                Wdg_fonte       := Wlink.font  ;
                Wdg_CorFonte    := Wlink.ForeColor  ;
                Wdg_CorTraco    := Wlink.DrawColor  ;
                Wdg_EspTraco    := Wlink.DrawWidth  ;
                Wdg_TipoTraco   := Wlink.DrawStyle   ;
                Wdg_adjorg      := Wlink.AdjustOrg  ;
                Wdg_adjdst      := Wlink.AdjustDst  ;
                //Wdg_AOrg        := Wlink.ArrowOrg  ;
                Wdg_AMid        := Wlink.ArrowMid  ;
                //Wdg_Adst        := Wlink.Arrowdst ;
              end;
          end
        else
        If dgcfg.nodes.item(i).shape = 14 then  //regra
          begin
            Wrn_align     :=  dgcfg.nodes.item(i).alignment;
            Wrn_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wrn_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wrn_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wrn_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wrn_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wrn_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wrn_width     :=  dgcfg.nodes.item(i).Width;
            Wrn_Height    :=  dgcfg.nodes.item(i).Height;
            If dgcfg.nodes.item(i).outlinks.Count > 0 then
              begin
                Wlink := dgcfg.nodes.item(i).Outlinks.item(1) ;
                Wcrn_fonte       := Wlink.font  ;
                Wcrn_CorFonte    := Wlink.ForeColor  ;
                Wcrn_CorTraco    := Wlink.DrawColor  ;
                Wcrn_EspTraco    := Wlink.DrawWidth  ;
                Wcrn_TipoTraco   := Wlink.DrawStyle   ;
                Wcrn_adjorg      := Wlink.AdjustOrg  ;
                Wcrn_adjdst      := Wlink.AdjustDst  ;
                //Wcrn_AOrg        := Wlink.ArrowOrg  ;
                Wcrn_AMid        := Wlink.ArrowMid  ;
                //Wcrn_Adst        := Wlink.Arrowdst ;
              end;
          end
         else
         If dgcfg.nodes.item(i).shape = 2 then  //juncao
          begin
            Wju_align     :=  dgcfg.nodes.item(i).alignment;
            Wju_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wju_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wju_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wju_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wju_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wju_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wju_width     :=  dgcfg.nodes.item(i).Width;
            Wju_Height    :=  dgcfg.nodes.item(i).Height;
            WWbs := obtem_Junc(dgcfg.nodes.item(i));
            If WWbs <> nil then
            begin
              WjuFixo_align     :=  WWbs.alignment;
              WjuFixo_Borda     :=  WWbs.DrawStyle;
              WjuFixo_EspBorda  :=  WWbs.DrawWidth;
              WjuFixo_CorBorda  :=  WWbs.DrawColor;
              WjuFixo_CorFundo  :=  WWbs.FillColor;
              WjuFixo_Fonte     :=  WWbs.Font;
              WjuFixo_CorFonte  :=  WWbs.ForeColor;
              WjuFixo_width     :=  WWbs.Width;
              WjuFixo_Height    :=  WWbs.Height;
            end;
          end
          else
          If dgcfg.nodes.item(i).shape = 54 then  //processo externo
          begin
            Wpe_align     :=  dgcfg.nodes.item(i).alignment;
            Wpe_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wpe_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wpe_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wpe_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wpe_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wpe_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wpe_width     :=  dgcfg.nodes.item(i).Width;
            Wpe_Height    :=  dgcfg.nodes.item(i).Height;
          end
         else
         If dgcfg.nodes.item(i).shape = 55 then  //entidade externa
          begin
            Wee_align     :=  dgcfg.nodes.item(i).alignment;
            Wee_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wee_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wee_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wee_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wee_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wee_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wee_width     :=  dgcfg.nodes.item(i).Width;
            Wee_Height    :=  dgcfg.nodes.item(i).Height;
          end
         else
         If dgcfg.nodes.item(i).shape = 79 then  //ativ ISO
          begin
            Wiso_align     :=  dgcfg.nodes.item(i).alignment;
            Wiso_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
            Wiso_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
            Wiso_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
            Wiso_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
            Wiso_Fonte     :=  dgcfg.nodes.item(i).Font;
            Wiso_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
            Wiso_width     :=  dgcfg.nodes.item(i).Width;
            Wiso_Height    :=  dgcfg.nodes.item(i).Height;
          end
      end
    end
    else
       If pDiag = 'DUC' then
       begin
           for i := 1 to dgcfg.nodes.count do
           begin
             If dgcfg.nodes.item(i).shape = 0 then  //OE
              begin
                Woe_align     :=  dgcfg.nodes.item(i).alignment;
                Woe_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Woe_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Woe_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Woe_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Woe_Fonte     :=  dgcfg.nodes.item(i).Font;
                Woe_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Woe_width     :=  dgcfg.nodes.item(i).Width;
                Woe_Height    :=  dgcfg.nodes.item(i).Height;
                If dgcfg.nodes.item(i).outlinks.Count > 0 then
                  begin
                    Wlink := dgcfg.nodes.item(i).Outlinks.item(1) ;
                    Wcnx_fonte       := Wlink.font  ;
                    Wcnx_CorFonte    := Wlink.ForeColor  ;
                    Wcnx_CorTraco    := Wlink.DrawColor  ;
                    Wcnx_EspTraco    := Wlink.DrawWidth  ;
                    Wcnx_TipoTraco   := Wlink.DrawStyle   ;
                    Wcnx_adjorg      := Wlink.AdjustOrg  ;
                    Wcnx_adjdst      := Wlink.AdjustDst  ;
                    //Wcnx_AOrg        := Wlink.ArrowOrg  ;
                    Wcnx_AMid        := Wlink.ArrowMid  ;
                    //Wcnx_Adst        := Wlink.Arrowdst ;
                  end;
              end
             else
             If dgcfg.nodes.item(i).shape = 58 then  //OI
              begin
                Woi_align     :=  dgcfg.nodes.item(i).alignment;
                Woi_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Woi_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Woi_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Woi_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Woi_Fonte     :=  dgcfg.nodes.item(i).Font;
                Woi_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Woi_width     :=  dgcfg.nodes.item(i).Width;
                Woi_Height    :=  dgcfg.nodes.item(i).Height;
                If dgcfg.nodes.item(i).outlinks.Count > 0 then
                  begin
                    Wlink := dgcfg.nodes.item(i).Outlinks.item(1) ;
                    Wlnk_fonte       := Wlink.font  ;
                    Wlnk_CorFonte    := Wlink.ForeColor  ;
                    Wlnk_CorTraco    := Wlink.DrawColor  ;
                    Wlnk_EspTraco    := Wlink.DrawWidth  ;
                    Wlnk_TipoTraco   := Wlink.DrawStyle   ;
                    Wlnk_adjorg      := Wlink.AdjustOrg  ;
                    Wlnk_adjdst      := Wlink.AdjustDst  ;
                    //Wlnk_AOrg        := Wlink.ArrowOrg  ;
                    Wlnk_AMid        := Wlink.ArrowMid  ;
                    //Wlnk_Adst        := Wlink.Arrowdst ;

                  end;
              end
             else
             If dgcfg.nodes.item(i).shape = 8 then  //OC
              begin
                Woc_align     :=  dgcfg.nodes.item(i).alignment;
                Woc_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Woc_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Woc_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Woc_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Woc_Fonte     :=  dgcfg.nodes.item(i).Font;
                Woc_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Woc_width     :=  dgcfg.nodes.item(i).Width;
                Woc_Height    :=  dgcfg.nodes.item(i).Height;
              end
              else
             If dgcfg.nodes.item(i).shape = 53 then  //ator DUC
              begin
                Wat_align     :=  dgcfg.nodes.item(i).alignment;
                Wat_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Wat_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Wat_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Wat_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Wat_Fonte     :=  dgcfg.nodes.item(i).Font;
                Wat_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Wat_width     :=  dgcfg.nodes.item(i).Width;
                Wat_Height    :=  dgcfg.nodes.item(i).Height;
              end
             else
             If dgcfg.nodes.item(i).shape = 62 then  //Use case DUC
              begin
                Wuc_align     :=  dgcfg.nodes.item(i).alignment;
                Wuc_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Wuc_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Wuc_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Wuc_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Wuc_Fonte     :=  dgcfg.nodes.item(i).Font;
                Wuc_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Wuc_width     :=  dgcfg.nodes.item(i).Width;
                Wuc_Height    :=  dgcfg.nodes.item(i).Height;
              end;
           end ;
       end
    else
       If pDiag = 'DMI' then
       begin
           i := 1;
           begin
             If (dgcfg.nodes.item(i).shape = 1) then  //Objeto de Negócio
              begin
                Won_align     :=  dgcfg.nodes.item(i).alignment;
                Won_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                Won_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                Won_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                Won_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                Won_Fonte     :=  dgcfg.nodes.item(i).Font;
                Won_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                Won_width     :=  dgcfg.nodes.item(i).Width;
                Won_Height    :=  dgcfg.nodes.item(i).Height;

                Wlink           := dgcfg.nodes.item(i).Outlinks.item(1) ;
                If Wlink <> nil then
                begin
                  Wrl_fonte       := Wlink.font  ;
                  Wrl_CorFonte    := Wlink.ForeColor  ;
                  Wrl_CorTraco    := Wlink.DrawColor  ;
                  Wrl_EspTraco    := Wlink.DrawWidth  ;
                  Wrl_TipoTraco   := Wlink.DrawStyle   ;
                  Wrl_adjorg      := Wlink.AdjustOrg  ;
                  Wrl_adjdst      := Wlink.AdjustDst  ;
                  //Wrl_AOrg        := Wlink.ArrowOrg  ;
                  Wrl_AMid        := Wlink.ArrowMid  ;
                  //Wrl_Adst        := Wlink.Arrowdst ;
                end;
              end ;
           end;
       end
     else
    If pDiag = 'DEO' then     // organograma
       begin
           for i := 1 to dgcfg.nodes.count do
           begin
             If (dgcfg.nodes.item(i).shape = 9) then  //Classe de ator
              begin
                wif_align     :=  dgcfg.nodes.item(i).alignment;
                wif_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                wif_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                wif_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                wif_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                wif_Fonte     :=  dgcfg.nodes.item(i).Font;
                wif_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                wif_width     :=  dgcfg.nodes.item(i).Width;
                Wif_Height    :=  dgcfg.nodes.item(i).Height;

                Wlink           := dgcfg.nodes.item(i).Outlinks.item(1) ;
                If Wlink <> nil then
                begin
                  Wdeo_fonte       := Wlink.font  ;
                  Wdeo_CorFonte    := Wlink.ForeColor  ;
                  Wdeo_CorTraco    := Wlink.DrawColor  ;
                  Wdeo_EspTraco    := Wlink.DrawWidth  ;
                  Wdeo_TipoTraco   := Wlink.DrawStyle   ;
                  Wdeo_adjorg      := Wlink.AdjustOrg  ;
                  Wdeo_adjdst      := Wlink.AdjustDst  ;
                  //Wdeo_AOrg        := Wlink.ArrowOrg  ;
                  Wdeo_AMid        := Wlink.ArrowMid  ;
                  //Wdeo_Adst        := Wlink.Arrowdst ;
                end;
              end
              else
              begin
                If (dgcfg.nodes.item(i).shape = 61) then  //pessoa
                begin
                  Wps_align     :=  dgcfg.nodes.item(i).alignment;
                  Wps_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                  Wps_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                  Wps_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                  Wps_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                  Wps_Fonte     :=  dgcfg.nodes.item(i).Font;
                  Wps_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                  Wps_width     :=  dgcfg.nodes.item(i).Width;
                  Wps_Height    :=  dgcfg.nodes.item(i).Height;
                end;
              end;
           end;
       end
        else
    If pDiag = 'CLS' then     // classes
         begin
          // for i := 1 to dgcfg.nodes.count do
          i := 1;
           begin
             If (dgcfg.nodes.item(i).shape = 1) then  //classe uml
              begin
                wcs_align     :=  dgcfg.nodes.item(i).alignment;
                wcs_Borda     :=  dgcfg.nodes.item(i).DrawStyle;
                wcs_EspBorda  :=  dgcfg.nodes.item(i).DrawWidth;
                wcs_CorBorda  :=  dgcfg.nodes.item(i).DrawColor;
                wcs_CorFundo  :=  dgcfg.nodes.item(i).FillColor;
                wcs_Fonte     :=  dgcfg.nodes.item(i).Font;
                wcs_CorFonte  :=  dgcfg.nodes.item(i).ForeColor;
                wcs_width     :=  dgcfg.nodes.item(i).Width;
                Wcs_Height    :=  dgcfg.nodes.item(i).Height;
             end;
          end;
         end;
 end;
end;

function TDG.Obtem_Junc(pNode : afNode) : afNode;
var
z : integer;
begin
  result := nil;
  for z := 1 to pNode.Outlinks.Count do
  begin
    If pNode.Outlinks.Item(z).linkstyle = 4 then
    begin
      result := pNode.Outlinks.Item(z).dst;
      break;
    end;
  end;
end;

function TDG.Obtem_JuncUp(pNode : afNode) : afNode;
var
z : integer;
begin
  result := nil;
  for z := 1 to pNode.Inlinks.Count do
  begin
    If pNode.Inlinks.Item(z).linkstyle = 4 then
    begin
      result := pNode.Inlinks.Item(z).org;
      break;
    end;
  end;
end;

Function  Tdg.Atributos (pEnt : afNode;pDg : integer;pDiag : string) : boolean;
var
i , z,w,v: integer;
Wbs,WAtor,WJunc : afNode;
wObj : Tdados_tab;
Begin
  result := true;
try
  with self do
  begin
  If pDiag = 'DPN' then
    begin
      If (pEnt.shape = 50) or (pEnt.shape = 11) then   // atividade
        begin
          pEnt.alignment   := WAtv_align       ;
          pEnt.DrawStyle   := WAtv_Borda     ;
          pEnt.DrawWidth   := WAtv_EspBorda;
          pEnt.DrawColor   := WAtv_CorBorda;
          pEnt.FillColor   := WAtv_CorFundo;
          pEnt.Font        := WAtv_Fonte;
          pEnt.ForeColor   := WAtv_CorFonte;
          pEnt.width       := WAtv_Width;
          pEnt.Height      := WAtv_Height;
         
          Wbs := self.Obtem_Wbs(pEnt);     //wbs
          If Wbs <> nil then
             begin
              Wbs.alignment   := Wwbs_align       ;
              Wbs.DrawStyle   := Wwbs_Borda     ;
              Wbs.DrawWidth   := Wwbs_EspBorda;
              Wbs.DrawColor   := Wwbs_CorBorda;
              Wbs.FillColor   := Wwbs_CorFundo;
              Wbs.Font        := Wwbs_Fonte;
              Wbs.ForeColor   := Wwbs_CorFonte;
              Wbs.width       := Wwbs_Width;
              Wbs.Height      := WWbs_height;
             // Wbs.Left        := WWbs_left;
              Wbs.Top         := WWbs_Top;

             end;
          WAtor := self.Obtem_Ator(pEnt);     //ator
          If WAtor <> nil then
             begin
              Wator.alignment   := Wator_align       ;
              Wator.DrawStyle   := Wator_Borda     ;
              Wator.DrawWidth   := Wator_EspBorda;
              Wator.DrawColor   := Wator_CorBorda;
              Wator.FillColor   := Wator_CorFundo;
              Wator.Font        := Wator_Fonte;
              Wator.ForeColor   := Wator_CorFonte;
              Wator.width       := Wator_Width;
              WAtor.Height      := Wator_Height;
              //WAtor.left        := Wator_left;
              WAtor.Top         := Wator_Top;

             end;
          self.resize_rigid(pEnt);
        end
      else
        If pEnt.shape in [56,65] then   // evento de negocio
          begin
            pEnt.alignment   := Wen_align       ;
            pEnt.DrawStyle   := Wen_Borda     ;
            pEnt.DrawWidth   := Wen_EspBorda;
            pEnt.DrawColor   := Wen_CorBorda;
            pEnt.FillColor   := Wen_CorFundo;
            pEnt.Font        := Wen_Fonte;
            pEnt.ForeColor   := Wen_CorFonte;
            pEnt.width       := Wen_Width;
            pEnt.Height      := Wen_Height;
          end
      else
        If pEnt.shape = 2 then   // juncao
        begin
          pEnt.alignment   := Wju_align       ;
          pEnt.DrawStyle   := Wju_Borda     ;
          pEnt.DrawWidth   := Wju_EspBorda;
          pEnt.DrawColor   := Wju_CorBorda;
          pEnt.FillColor   := Wju_CorFundo;
          pEnt.Font        := Wju_Fonte;
          pEnt.ForeColor   := Wju_CorFonte;
          pEnt.width       := Wju_Width;
          pEnt.Height      := Wju_Height;
          WJunc := self.Obtem_junc(pEnt);
          If Wjunc <> nil then
          begin
            begin
              Wjunc.Drawstyle := Wjufixo_Borda     ;
              Wjunc.Drawwidth := Wjufixo_EspBorda     ;
              Wjunc.DrawColor := Wjufixo_CorBorda     ;
              Wjunc.fillcolor := Wjufixo_CorFundo     ;
              Wjunc.font      := Wjufixo_fonte     ;
              Wjunc.forecolor := Wjufixo_corfonte     ;
              Wjunc.width     := Wjufixo_width     ;
              Wjunc.height    := Wjufixo_height    ;
              for v := 1 to Wjunc.Outlinks.count do
               begin
                 If Wjunc.Outlinks.item(v).Linkstyle = 13  then
                    begin
                      Wjunc.Outlinks.item(v).dst.drawStyle := Wjufixo_Borda     ;
                      Wjunc.Outlinks.item(v).dst.Drawwidth := Wjufixo_EspBorda     ;
                      Wjunc.Outlinks.item(v).dst.DrawColor := Wjufixo_CorBorda     ;
                      Wjunc.Outlinks.item(v).dst.fillcolor := Wjufixo_CorFundo     ;
                      Wjunc.Outlinks.item(v).dst.font      := Wjufixo_fonte     ;
                      Wjunc.Outlinks.item(v).dst.forecolor := Wjufixo_corfonte     ;
                    end;
               end;
               self.resize_rigid(Wjunc);
            end;
          end;
        end
      else
         If pEnt.shape = 54 then   // processo externo
          begin
            pEnt.alignment   := Wpe_align       ;
            pEnt.DrawStyle   := Wpe_Borda     ;
            pEnt.DrawWidth   := Wpe_EspBorda;
            pEnt.DrawColor   := Wpe_CorBorda;
            pEnt.FillColor   := Wpe_CorFundo;
            pEnt.Font        := Wpe_Fonte;
            pEnt.ForeColor   := Wpe_CorFonte;
            pEnt.width       := Wpe_Width;
            pEnt.Height      := Wpe_Height;
          end
      else
        If pEnt.shape = 55 then   // entidade externa
            begin
              pEnt.alignment   := Wee_align       ;
              pEnt.DrawStyle   := Wee_Borda     ;
              pEnt.DrawWidth   := Wee_EspBorda;
              pEnt.DrawColor   := Wee_CorBorda;
              pEnt.FillColor   := Wee_CorFundo;
              pEnt.Font        := Wee_Fonte;
              pEnt.ForeColor   := Wee_CorFonte;
              pEnt.width       := Wee_Width;
              pEnt.Height      := Wee_Height;
            end
      else
        If pEnt.shape = 14 then   // regra de negocio
          begin
            pEnt.alignment   := Wrn_align       ;
            pEnt.DrawStyle   := Wrn_Borda     ;
            pEnt.DrawWidth   := Wrn_EspBorda;
            pEnt.DrawColor   := Wrn_CorBorda;
            pEnt.FillColor   := Wrn_CorFundo;
            pEnt.Font        := Wrn_Fonte;
            pEnt.ForeColor   := Wrn_CorFonte;
            pEnt.width       := Wrn_Width;
            pEnt.Height      := Wrn_Height;
          end
      else
       If pEnt.shape = 79 then   // atividade ISO
          begin
            pEnt.alignment   := Wiso_align       ;
            pEnt.DrawStyle   := Wiso_Borda     ;
            pEnt.DrawWidth   := Wiso_EspBorda;
            pEnt.DrawColor   := Wiso_CorBorda;
            pEnt.FillColor   := Wiso_CorFundo;
            pEnt.Font        := Wiso_Fonte;
            pEnt.ForeColor   := Wiso_CorFonte;
            pEnt.width       := Wiso_Width;
            pEnt.Height      := Wiso_Height;
          end;
    end
  else
    If pDiag = 'DUC' then
        begin
          If (pEnt.shape = 0)   then // OE
            begin
                pEnt.alignment   := Woe_align       ;
                pEnt.DrawStyle   := Woe_Borda     ;
                pEnt.DrawWidth   := Woe_EspBorda;
                pEnt.DrawColor   := Woe_CorBorda;
                pEnt.FillColor   := Woe_CorFundo;
                pEnt.Font        := Woe_Fonte;
                pEnt.ForeColor   := Woe_CorFonte;
                pEnt.width       := Woe_Width;
                pEnt.Height      := Woe_Height
            end
            else
            If pEnt.shape = 58 then   // OI
            begin
              pEnt.alignment   := Woi_align       ;
              pEnt.DrawStyle   := 5     ;   //transparente
              pEnt.DrawWidth   := Woi_EspBorda;
              pEnt.DrawColor   := Woi_CorBorda;
              pEnt.FillColor   := Woi_CorFundo;
              pEnt.Font        := Woi_Fonte;
              pEnt.ForeColor   := Woi_CorFonte;
              pEnt.width       := Woi_Width;
              pEnt.Height      := Woi_Height;
            end
            else
            If pEnt.shape = 8 then   // OC
            begin
              pEnt.alignment   := Woc_align       ;
              pEnt.DrawStyle   := 5     ;   //transparente
              pEnt.DrawWidth   := Woc_EspBorda;
              pEnt.DrawColor   := Woc_CorBorda;
              pEnt.FillColor   := Woc_CorFundo;
              pEnt.Font        := Woc_Fonte;
              pEnt.ForeColor   := Woc_CorFonte;
              pEnt.width       := Woc_Width;
              pEnt.Height      := Woc_Height;
            end
            else
            If pEnt.shape = 53 then   // Ator DUC
            begin
              pEnt.alignment   := Wat_align       ;
              pEnt.DrawStyle   := Wat_Borda     ;
              pEnt.DrawWidth   := Wat_EspBorda;
              pEnt.DrawColor   := Wat_CorBorda;
              pEnt.FillColor   := Wat_CorFundo;
              pEnt.Font        := Wat_Fonte;
              pEnt.ForeColor   := Wat_CorFonte;
              pEnt.width       := Wat_Width;
              pEnt.Height      := Wat_Height;
            end
            else
            If (pEnt.shape = 62) then   // Use CASE
            begin
                pEnt.alignment   := Wuc_align       ;
                pEnt.DrawStyle   := Wuc_Borda     ;
                pEnt.DrawWidth   := Wuc_EspBorda;
                pEnt.DrawColor   := Wuc_CorBorda;
                pEnt.FillColor   := Wuc_CorFundo;
                pEnt.Font        := Wuc_Fonte;
                pEnt.ForeColor   := Wuc_CorFonte;
                pEnt.width       := Wuc_Width;
                pEnt.Height      := Wuc_Height;

            end;
       end
     else
        If pDiag = 'DMI' then
        begin
          If (pEnt.shape = 1) then   // Objeto de negócio
              begin
                pEnt.alignment   := Won_align       ;
                pEnt.DrawStyle   := Won_Borda     ;
                pEnt.DrawWidth   := Won_EspBorda;
                pEnt.DrawColor   := Won_CorBorda;
                pEnt.FillColor   := Won_CorFundo;
                pEnt.Font        := Won_Fonte;
                pEnt.ForeColor   := Won_CorFonte;
                pEnt.width       := Won_Width;
                pEnt.Height      := Won_Height;
              end;
        end
    else
       If pDiag = 'DEO' then
        begin
          If (pEnt.shape = 9) then   // classe de ator
              begin
                pEnt.alignment   := wif_align       ;
                pEnt.DrawStyle   := wif_Borda     ;
                pEnt.DrawWidth   := wif_EspBorda;
                pEnt.DrawColor   := wif_CorBorda;
                pEnt.FillColor   := wif_CorFundo;
                pEnt.Font        := wif_Fonte;
                pEnt.ForeColor   := wif_CorFonte;
                pEnt.width       := wif_Width;
                pEnt.Height      := Wif_Height;
              end
          else
          If (pEnt.shape = 61) then   // pessoa
              begin
                pEnt.alignment   := Wps_align       ;
               // pEnt.DrawStyle   := Wps_Borda     ;
               // pEnt.DrawWidth   := Wps_EspBorda;
               // pEnt.DrawColor   := Wps_CorBorda;
               // pEnt.FillColor   := Wps_CorFundo;
                pEnt.Font        := Wps_Fonte;
                pEnt.ForeColor   := Wps_CorFonte;
               // pEnt.width       := Wps_Width;
               // pEnt.Height      := Wps_Height;
              end ;
        
       end
      else
       If pDiag = 'CLS' then
        begin
          If (pEnt.shape = 1) then   // classe de ator
              begin
                pEnt.alignment   := wcs_align       ;
                pEnt.DrawStyle   := wcs_Borda     ;
                pEnt.DrawWidth   := wcs_EspBorda;
                pEnt.DrawColor   := wcs_CorBorda;
                pEnt.FillColor   := wcs_CorFundo;
                pEnt.Font        := wcs_Fonte;
                pEnt.ForeColor   := wcs_CorFonte;
                pEnt.width       := wcs_Width;
                pEnt.Height      := wcs_Height;
               
               apply_color(pEnt);
               resize_rigid(pEnt);
              end
        end;
       end;
finally
   
end;

end;

procedure Tdg.Deleta_Ativ(pNode : afnode);
type
  uLst = ^TLst;
  TLst = record
    eNode : afNode;
    elnk     : afLink;
    etipo    : char;
end;
var
  Worg,Wdst,j,w : integer;
  Wno,Wparent : TtreeNode;
  WLink : afLink;
  Wcod,Wp,WShape : integer;
  Wnode : afnode;
  iTab : TDados_tab;
  iList : TList;
  i : integer;

mLst : uLst;
begin

  WNode  := pNode;
  WShape := Wnode.shape;
  itab := Tdados_tab.create(self);
  itab.CLI_ID := self.EMPRESA;
  itab.PRJ_ID := self.CENARIO;
  iList := TList.create;
  with iTab do
  begin
  If IDG_DIR = 'DPN' then
   begin        //verifica se os objetos tem usredata
      { If wshape in [50,79,56,2,54,55,14] then
         begin
          If wNode.userdata = 0 then
             showmessage(def1011 + wNode.text)  ;
             WNode.marked := true;
             exit;
         end;      }

       If WShape = 1 then
         begin
           If tv.Diagrama.Obtem_JuncUp(pNode) <> nil  then //pega a parte superior da junnção
              del_Junction(pNode,nil);
         end
       else
       If WShape = 2 then      //juncao
         begin
           If tv.Diagrama.Obtem_Junc(pNode) <> nil  then //pega a parte Inferiro da junnção
              del_Junction(pNode,nil)
           else
              begin
                WNode.marked := true;
                exit;
              end;

         end

       else
         Begin
            begin
               iList := Get_Nodes(WNode,' ');    // pega lista de nós linkados
               for i := 0 to iList.Count-1 do
                Begin
                  mLst := iList.Items[i];   // link
                  If Wnode.Shape in [11,50,79] then    // atividade
                    Begin
                       If  mLst^.eTipo = 'I'  then      //links entrando....
                         Begin
                           If mLst^.eLnk <> nil then
                           begin
                             If mLst^.eLnk.LinkStyle  = 4 then   // .. como conexào de regra
                                Begin

                                 If mLst^.eNode.Shape = 14 then // ..proveniente de regra
                                    Apaga_correlacao(empresa,cenario,'AP',wNode.UserData,'RN',mLst^.eNode.UserData)
                                 else
                                 If mLst^.eNode.Shape in [11,50,79] then // ..proveniente de atividade
                                    Apaga_correlacao(empresa,cenario,'AP',mLst^.eNode.UserData,'AP',wNode.UserData)

                                end
                             else
                              Begin
                                If mLst^.eLnk.LinkStyle  in cFluxos then  // ... como fluxo
                                 Begin
                                  If mLst^.eNode.Shape in [56,65] then
                                     Apaga_correlacao(empresa,cenario,'AP',wNode.UserData,'EN',mLst^.eNode.UserData);
                                 end;
                              end;

                           end


                         end
                        else             // ..links saindo....
                          Begin
                           If mLst^.eLnk <> nil then
                            Begin
                              If mLst^.eLnk.LinkStyle  = 4 then  // .. como conexào de regra
                                 Apaga_correlacao(empresa,cenario,'AP',wNode.UserData,'AP',mLst^.eNode.UserData);
                            end;

                         end;
                     end
                   else  //end atividade
                   If Wnode.Shape in [14] then  // regra de negócio...
                      Begin
                       If  mLst^.eTipo = 'O'  then   // ..links saindo
                       Begin
                         If mLst^.eLnk.LinkStyle  = 4 then   // ..como conexão de regra
                            Apaga_correlacao(empresa,cenario,'AP',mLst^.eNode.UserData,'RN',wNode.UserData);
                       end
                      end
                    else
                    If Wnode.Shape in [56,65] then   // evento de negócio
                      Begin
                       If  mLst^.eTipo = 'O'  then   // ..links saindo
                       Begin
                         If mLst^.eLnk.LinkStyle in cFluxos then  // ..como fluxos
                            Apaga_correlacao(empresa,cenario,'AP',mLst^.eNode.UserData,'EN',wNode.UserData);
                       end
                      end ;

                end;
            end ;

         end;

       If Wshape in [11,50,79] then   // delete atividade na árvore
        Begin
          // If MessageDlg(mens40,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            //             exit;
           Cria_sub(Wnode,false); //delete retangulo de decomposição
           Cria_subAnt(Wnode,false); //mantem compatibiliadde
           Cria_ducant(WNode,false,0,Rig_top,Rig_left,Rig_width,rig_height,12); // compatibilidade versoes anteriores
           Cria_duc( WNode,False,0,0,0,0,0,4); // deletea símolode Use case (c'rculo inferior)
           { deleta correlações objetos invisiveis}
           //Apaga_Todascorrelacoes(empresa,cenario,'AP',wNode.UserData);
           delete_Componentes(WNode); //deleta WBS e Ator

           { apaga correlações dos links dg sainod(requer TI)}


           for j := 1 to wNode.OutLinks.Count do
            begin
             If wNode.OutLinks.Item(j).LinkStyle in cFluxos then
              Apaga_correlacao(empresa,cenario,'AP',wNode.UserData,'DG', wNode.OutLinks.Item(j).UserData);

            end;
           for j := 1 to wNode.InLinks.Count do
            begin
             If (wNode.InLinks.Item(j).Org.Shape = 1) and (wNode.InLinks.Item(j).Org.Selectable) then   // antecessor = junção
               Deleta_PercCorrelacao(wNode.InLinks.Item(j));//delete percentuais
            end;

           WNode.marked := true;
           W            := Wnode.userdata ;
           for j := 1 to self.Nodes.Count do // verifica se ha outras instancias do nó a ser deletado
             begin
              If (self.Nodes.Item(j).UserData = w) and (self.Nodes.Item(j).Selected = false) then
                  exit;
             end;
           Wno := Tv.get_filho(Tv.selected,w);
            If Wno <> nil then
             begin
               tv.Excluir_No(tv.selected,Wno,self) ;
               tv.Items.Delete(Wno);
             end;

        end;
   end//end DPN
   else
   If IDG_DIR = 'DEO' then
    Begin
     W := Wnode.userdata ;

     Wno := Tv.get_filho(Tv.selected,w);
      If Wno <> nil then
       begin
         tv.Excluir_No(tv.selected,Wno,self) ;
         tv.Items.Delete(Wno);
       end;
    end
   else

   If IDG_DIR = 'DUC' then
   begin
       iList := Get_Nodes(WNode,' ');    // pega lista de nós linkados
       for i := 0 to iList.Count-1 do
        Begin
          mLst := iList.Items[i];   // link
          If Wnode.Shape in [0] then    // Objeto entidade
            Begin
               If mLst^.eNode.Shape = 8 then // ..proveniente de OC
                  Apaga_correlacao(empresa,cenario,'OC',mLst^.eNode.UserData,Wnode.Tag,wNode.UserData)
               else
               If mLst^.eNode.Shape in [58] then // ..proveniente de OI
                  Apaga_correlacao(empresa,cenario,'OI',mLst^.eNode.UserData,Wnode.Tag,wNode.UserData)
           end

          else  //end OE
           If Wnode.Shape in [8] then  // objeto de controle...
               Begin
                 If mLst^.eNode.Shape = 0  then   // ..proveniente de OE
                    Apaga_correlacao(empresa,cenario,'OC',wNode.UserData,mLst^.eNode.Tag,mLst^.eNode.UserData)
                 else
                 If mLst^.eNode.Shape = 58 then   // ..proveniente de OI
                      Apaga_correlacao(empresa,cenario,'OI',mLst^.eNode.UserData,'OC',wNode.UserData);
               end

            else
            If Wnode.Shape in [58] then   // OI
              Begin
                 If mLst^.eNode.Shape = 8 then   // ..proveniente de OC
                    Apaga_correlacao(empresa,cenario,'OI',wNode.UserData,'OC',mLst^.eNode.UserData)
                 else
                 If mLst^.eNode.Shape = 0 then   // ..proveniente de OE
                      Apaga_correlacao(empresa,cenario,'OI',wNode.UserData,mLst^.eNode.Tag,mLst^.eNode.UserData)
                 else
                 If mLst^.eNode.Shape = 58 then   // ..proveniente de OI
                      Apaga_correlacao(empresa,cenario,'OI',wNode.UserData,Wnode.Tag,mLst^.eNode.UserData)
                 else
                 If mLst^.eNode.Shape = 53 then   // ..proveniente de ator
                      Apaga_correlacao(empresa,cenario,'OI',wNode.UserData,'CA',mLst^.eNode.UserData)
               end

          end ;



   end    //end DMI
   else
   If IDG_DIR = 'CLS' then
    Begin
     If tv.Diagrama.SelectedNode.Shape = 1 then
      Begin
        TV.Diagrama.Del_class(tv.Diagrama.SelectedNode);
        iList := Get_Nodes(WNode,' ');    // pega lista de nós linkados
        for i := 0 to iList.Count-1 do
         Begin
           mLst := iList.Items[i];   // link
           Apaga_correlacao(empresa,cenario,'CS',mLst^.eNode.UserData,'CS',wNode.UserData) ;
           Apaga_correlacao(empresa,cenario,'CS',wNode.UserData,'CS',mLst^.eNode.UserData)
         end;
       // Apaga_correlacoes(empresa,cenario,'CS',wNode.UserData,'CS'); // apaga onde é pai
      //  Apaga_correlacoesFilho(empresa,cenario,wNode.UserData,'CS');  // apaga onde é filho
         EXIT;
      end;

    

    end   ;


   WNode.marked := true;
  end; // end itab
  freeandNil(iList);
  freeandNil(itab);
end;




procedure TTv.Setdg(const Value: Tdg);
begin
  If value = nil then
     value.Create;
  Fdg := value;
end;

Procedure Tdg.Delete_Componentes(pNode : afNode);  // deleta WBS e ATOR
var
i : integer;
Wbs,WAtor : afNode;
begin
   Wbs := Obtem_wbs (pNode);
   If Wbs <> nil then
      wbs.Marked := true;
   Wator := Obtem_ator (pNode);
   If Wator <> nil then
      wAtor.Marked := true;

end;

procedure Tdg.wKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);

 Begin
   wkeyaction(key,Shift) ;
 end;

//procedure Tdg.wKeyaction(Sender: TObject; var Key: Word;Shift: TShiftState);
procedure Tdg.wKeyaction(Key : word;Shift: TShiftState);
var
 w ,x ,WtotDelSel,i: integer;
 Wnoatu : TtreeNode;
 owbs,oAtor : afnode;
begin
    If (shift = ([ssAlt])) and (key = VK_LEFT) then
     begin
      If self.SelectedNode <> nil then
        begin
          self.selectedNode.Left := self.selectedNode.Left - 10 ;
          self.Resize_Rigid( self.SelectedNode);
          Move_Seta(self.SelectedNode,10,'L');
        end;
     end;

     If (shift = ([ssAlt])) and (key = VK_RIGHT) then
     begin
      If self.SelectedNode <> nil then
        begin
          self.selectedNode.Left := self.selectedNode.Left + 10 ;
          self.Resize_Rigid( self.SelectedNode);
          Move_Seta(self.SelectedNode,10,'R');
        end;
     end;

     If (shift = ([ssAlt])) and (key = VK_UP) then
     begin
      If self.SelectedNode <> nil then
        begin
          self.selectedNode.TOP := self.selectedNode.TOP - 10 ;
          self.Resize_Rigid( self.SelectedNode);
          Move_Seta(self.SelectedNode,10,'U');
        end;
     end;

     If (shift = ([ssAlt])) and (key = VK_DOWN) then
     begin
      If self.SelectedNode <> nil then
        begin
          self.selectedNode.TOP := self.selectedNode.TOP + 10 ;
          self.Resize_Rigid( self.SelectedNode);
          Move_Seta(self.SelectedNode,10,'D');
        end;
     end;

    If (shift = ([ssCtrl])) and (key = ord('Y')) then
        Begin
               { deletea objetos incompletos}
          for i := 1 to Nodes.Count do
           Begin
             If Nodes.Item(i). shape = 1 then
              Begin
               If Nodes.Item(i).Selectable = false then
                  Begin
                   If (Nodes.item(i).OutLinks.Count = 0) and
                      (Nodes.Item(i).InLinks.Count = 0)  then
                      Begin
                         Nodes.Item(i).Marked := true;
                         DeleteMarked;
                      end;

                  end;
              end;
           end;
        end
    else
    If (key = ord('H')) or (key = ord('h')) then
        Begin
               { alinhar centro}
         tv.Diagrama.Alinha(8);
        end
    else
    If (key = ord('E')) or (key = ord('e')) then
        Begin
               { alinhar esquerda horizontal}
         tv.Diagrama.Alinha(3);
        end

     else
    If (key = ord('T')) or (key = ord('t')) then
        Begin
               { mesmo tananho}
         tv.Diagrama.Alinha(5);
         tv.Diagrama.Alinha(6);
        end
    else
    If (shift = ([ssCtrl])) and (key = ord('C')) then
        Begin
               { COPIA seleçào}
         tv.Diagrama.Copia_Sel;
        end
    else
    If (shift = ([ssCtrl])) and (key = ord('V')) then
        Begin
               { COPIA seleçào}
         tv.Diagrama.Cola_sel(true,true,false,0);
        end  ;
    If key = VK_ESCAPE then
        Begin
             {CRIA ATIVIDADE GRÁFICA}
         frm_treeativ.SpeedButton79Click(nil);
         wStop := true;
         EXIT
        end  ;

    If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
       exit;
    If key = VK_DELETE then
       begin
          If self.SelNodes.count > 0 then     //entidades
            begin
              WtotDelSel :=  self.SelNodes.count;
              for x := 1 to  WtotDelSel do
                  Deleta_Ativ(self.Selnodes.item(x));
             //  self.deleteMarked;
            end
         else
          If self.SelLinks.count > 0 then       //links
           begin
             WtotDelSel :=  self.SelLinks.count;
             for x := 1 to  WtotDelSel do
                begin
                  Deleta_Dg(self.SelLinks.item(x));
                end;
             //  self.deleteMarked;
           end;
          self.deleteMarked;
          self.Salvar;
       end;

end;
   { move as setas entrando e saindo, quando o Objeto é movido}
procedure Tdg.Move_Seta(pNode : afNode;pOffset : integer;pDir : string);
var
i , t,j: integer;  //pos : posição de entrada(ou saida) da seta : L(eft),R(ight),U(p), D(own)
Wp ,wOrg, wDst: afLinkPoint;
Lst : TList;
pLink : afLink  ;
pos : string;
 begin
   Lst := get_nodes(pNode,' ');
   for i := 0 to Lst.Count-1 do
    Begin
     mLst  := Lst.Items[i];
     pLink := mLst.elnk;

     t := plink.ExtraPoints.count- 1;   //ponto destino

     Worg   := plink.ExtraPoints.Item[0];
     Worg.x := plink.ExtraPoints.Item[0].x;
     Worg.y := plink.ExtraPoints.Item[0].y;

     Wdst   := plink.ExtraPoints.Item[t];
     Wdst.x := plink.ExtraPoints.Item[t].x;
     Wdst.y := plink.ExtraPoints.Item[t].y;

     // deslocamento
     If pDir = 'R' then  //movim. p/direita
      begin
       If mlst.eTipo = 'I' then //fluxo entrando
          wDst.x := wDst.x + pOffset;

       If mlst.eTipo = 'O' then //fluxo saindo
          wOrg.x := worg.x + pOffset;
      end;

      If pDir = 'L' then  //movim. p/esquerda
      begin
       If mlst.eTipo = 'I' then //fluxo entrando
          wDst.x := wDst.x - pOffset;

       If mlst.eTipo = 'O' then //fluxo saindo
          wOrg.x := worg.x - pOffset;
      end;

      If pDir = 'L' then  //movim. p/esquerda
      begin
       If mlst.eTipo = 'I' then //fluxo entrando
          wDst.x := wDst.x - pOffset;

       If mlst.eTipo = 'O' then //fluxo saindo
          wOrg.x := worg.x - pOffset;
      end;

      If pDir = 'U' then  //movim. p/cima
      begin
       If mlst.eTipo = 'I' then //fluxo entrando
          wDst.y := wDst.y - pOffset;

       If mlst.eTipo = 'O' then //fluxo saindo
          wOrg.y := worg.y - pOffset;
      end;

      If pDir = 'D' then  //movim. p/baixo
      begin
       If mlst.eTipo = 'I' then //fluxo entrando
          wDst.y := wDst.y + pOffset;

       If mlst.eTipo = 'O' then //fluxo saindo
          wOrg.y := worg.y + pOffset;
      end;

     If plink.adjustorg then
         plink.Extrapoints.Item[0] := Worg;
     If pLink.AdjustDst then
        plink.Extrapoints.Item[t] := Wdst;
    end;

 end;

procedure Tdg.Insere_imagem(Sender: TObject);
begin
   If frm_dirbmp = nil then
      frm_dirbmp := tfrm_dirbmp.create(self);
   frm_dirbmp.showModal;
end;

Procedure tdg.cria_Junction(pNode : afNode);
var
 wtop,Wleft : real;

 WSubNOde,WSubNode1 : afNode;
 WSubLink,WSubLink1,WSubLink2,WSubLink3 : afLink;
 j ,wtot,wst : integer;
 worg,Wdst,Wp1,Wp2,Wp3,Wp4,Wp5 : afLinkPoint;
 Tot,i : integer;
 WFont : IFontDisp;
 Wfnt : Tfont;
begin
   Wfnt := tfont.Create;

   WSubnode := tv.diagrama.Nodes.add(pNode.left ,
                  pNode.top ,
                  pNode.width ,
                  pNode.height);

     //retangulo interno
     WSubnode1 := tv.diagrama.Nodes.add(WSubNode.left ,
                  WSubNode.top ,
                  WSubNode.width/6 ,
                  WSubNode.height);

    // Wsubnode.left   := (pNode.left+pNode.width) - WSubnode.width;
     WSubnode.shape        := 1;
     WsubNode.Sizeable     := true;
     WSubNode.FillColor    := clWhite;

     WSubnode1.shape       := 1;
     WSubNode1.FillColor   := clWhite;
     WsubNode1.Sizeable    := true;
     WSUbNode1.Selectable  := false;

     WSubLink := Wsubnode.OutLinks.Add(WSubnode1);
     WSublink.linkstyle   := 13;
     Wsublink.Rigid       := true;
     WSublink.Selectable  := false;
     WSubLink.Hidden      := true;

     WSubLink1            := WsubNode1.OutLinks.Add(Wsubnode);
     WSublink1.linkstyle  := 13;
     Wsublink1.Rigid      := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden     := true;

    //  conexão com parte de cima
     WTop := (Wsubnode.top - (pNode.height * 1.5 ));
     If WTop < 0 then
        Wtop := 0;
     Wleft := Wsubnode.left +(Wsubnode.width - pnode.width) / 2;
     If Wleft <0 then
        Wleft := 0  ;
     pNode.top  :=  Wtop;

     pNode.Left := WLeft;
     pNode.text := 'xxxxxxxx';
     tv.diagrama.AdjustOrg := false;
     tv.diagrama.Adjustdst := false;
     WSubLink2 := pnode.OutLinks.Add(WsubNode);
     WSublink2.linkstyle := 4;
     WSublink2.Drawstyle := 2;
     //ajusta_seta(WSubLink2);
end;

procedure Tdg.Ajusta_Imagem(pAjusta : Boolean);
begin
 with tv.Diagrama do
 If selectedNode <> nil then
    If selectednode.Picture <> nil then
       begin
         If pAjusta then   // ajusta imagem a o no
             selectednode.autosize := 1
         else
             selectednode.autosize := 2;  // ajusta no a imagem
         selectednode.Transparent := true;
         resize_rigid(SelectedNode);
       end
    else

end;
Procedure Tdg.del_Junction(pNode : afNode ; pLink : afLink);
var
Wsub,Wsub1,iUp,iDown: afNode;
tot ,i,Junc_Id: integer ;
begin
  If Pnode.Shape = 1 then // parte inferior da junçaõ
   begin
    iDown := pNode;
    iUp := Obtem_JuncUp(pNode);
    tot := pNode.InLinks.count;
    Junc_id := iUp.UserData;
    for i := 1 to tot do
    begin
      If pNode.InLinks.Item(i).linkStyle = 13 then
         pNode.InLinks.Item(i).org.marked := true;
    end;
    iUp.marked := true;
    pNode.Marked := true;
   end
  else
   begin
    Junc_id := pNode.UserData;
    iUp   := pNode;
    iDown := Obtem_Junc(iUp);
    tot := iDown.InLinks.count;
    for i := 1 to tot do
    begin
      If iDown.InLinks.Item(i).linkStyle = 13 then
         iDown.InLinks.Item(i).org.marked := true;
    end;
    iUp.marked := true;
    iDown.Marked := true;

   end;
   // delete correlacoes de percentual de custo

   for i := 1 to iDown.OutLinks.Count do
    Begin
     Deleta_PercCorrelacao(iDown.OutLinks.Item(i));
    end;


end;


procedure Tdg.Mostra_propriedades;
var
i : integer;
wi : variant;
begin
 // Dg_Corrente := Diag;
  If frm_propr = nil then
     frm_propr := Tfrm_propr.Create(self);
  frm_propr.rg_Align.Itemindex  := tv.Diagrama.selNodes.item(1).Alignment;
  frm_propr.rg_estilo.Itemindex := tv.Diagrama.selNodes.item(1).Drawstyle;
  frm_propr.cd_borda.color      := tv.Diagrama.selNodes.Item(1).DrawColor;
  frm_propr.cd_fundo.color      := tv.Diagrama.selNodes.Item(1).fillColor;
  frm_propr.cd_fonte.color      := tv.Diagrama.selNodes.Item(1).ForeColor;
  frm_propr.fnt.font.color      := tv.Diagrama.selNodes.Item(1).ForeColor;
  Wi := tv.Diagrama.selNodes.Item(1).DrawWidth  ;
  frm_propr.rg_espessura.Itemindex := Wi ;
  frm_propr.show;
end;

function Tdg.Alinha(pTipo : integer) : boolean;
					     //1 : top;
                                             //2 : bottom;
                                             //3 : left;
					     //4 : right;
                                             //5 : width;
                                             //6 : heigth;
					     //7 : heigth and width
                                             //8 : centers horizontal
 var                                         //9 : centers vertical
 i,Wcount : integer;
 WTopp,WBottom,Wleft,Wheight,Wright ,Wwidth: single;
 Went,wbs : afNode;
 Wt : string;

begin
  result := true;
 // Wcount := tv.Diagrama.SelNodes.count;
  Wcount := Self.Selnodes.count;
  If Wcount > 1 then
  Begin
    // Went    := tv.Diagrama.SelNodes.item(1);
     Went    := self.SelNodes.item(1);
     wt      := went.text;
     Wtopp   := Went.tOP;
     Wleft   := Went.Left;
     Wheight := Went.height;
     Wwidth  := Went.Width;
     for i := 2 to Wcount do
     Begin
       //Went    := tv.Diagrama.SelNodes.item(i);
       Went    := self.SelNodes.item(i);
       wt := went.text;
       case pTipo of
       1 :  Begin                             //top
              Went.Top := Wtopp;
            end;

       2 :  Begin                            //bottom
             Went.Top := wtopp + (Wheight - went.height) ;
	    end;

       3 :  Begin
              wbs := obtem_wbs(went);
              If wbs <> nil then
                 wbs.left := Wleft;
              Went.left := Wleft ;   //left

            end;

       4 :  Begin
              wbs := obtem_wbs(went);
              If wbs <> nil then
                 wbs.left := Wleft;
              Went.Left := wleft + (Wwidth - went.width) ;   //right
	    end;

       5 :  Begin                            //width
	      went.width  := Wwidth;
            end;

       6 :  Begin                            //height
              went.height:= Wheight;
            end;

       7 :  Begin                            //all
              went.width  := Wwidth;
	      went.height := Wheight;
            end;

       8 :  Begin                            //centers  horizontal
              went.top := Wtopp + Wheight/2 - went.height/2 ;
            end;
       9 :  Begin                            //centers  vertical
              wbs := obtem_wbs(went);
              If wbs <> nil then
                 wbs.left := Wleft;
              went.left :=Wleft + Wwidth/2 - went.width/2 ;
            end;

       end;
     resize_rigid(Went);
     end;
  end;

end;

procedure Tdg.Deleta_PercCorrelacao(pLink : afLink);
var
iCorr : Tdados_tab;
wid,wDst,wOrg : Integer;
iDel,iJuncup : afNode;
begin
   iCorr := TDados_tab.create(self);
   WOrg := plink.org.userdata;
   Wdst := plink.dst.userdata;
   try
       with iCorr do
        Begin
           iJuncUp :=  Obtem_JUncUp(plink.org) ;
           If iJuncUp = nil then
             begin
               showmessage(def7771 + pLink.org.inlinks.item(1).org.text);
               exit;
             end;

           Get_correlato (empresa,cenario,'JU',iJuncUp.UserData,'AP',wdst ) ;
           wid := fieldbyname('PERC_CODIGO').asinteger;  // Valor do percentual
           If wid <> 0 then
            Begin
              idel := get_nodePerc(Tv.Diagrama,wid);
              if idel <> nil then
               Begin
                 If idel.Shape = 63 then  //% de passagem
                   idel.Marked := true;
               end;
            end;
            Apaga_correlacao(empresa,cenario,'JU',Obtem_JuncUp(plink.org).UserData,'AP',wdst ) ; // apag correlaÇaò de custo

        end;
        plink.Marked := true;
   finally
     freeandnil(iCorr);
   end;
end;

procedure Tdg.Deleta_Dg(pLink : afLink);
var
  Worg,Wdst,j,w : integer;
  Wno,Wparent : TtreeNode;
  WLink : afLink;
  Wcod,Wp : integer;
  Wstyle ,wId: integer;
  iTab : Tdados_tab;
  apaga : boolean;
  idel : afNode;
begin
  apaga := true;
  Wlink := pLink;
  WStyle := Wlink.LinkStyle;
  itab := Tdados_tab.create(self);
  If (tv.diagrama.IDG_DIR <> 'DPN') and (tv.diagrama.IDG_DIR <> 'DUC')  and
             (tv.diagrama.IDG_DIR <> 'DEO') and (tv.diagrama.IDG_DIR <> 'DMI')
             and (tv.diagrama.IDG_DIR <> 'CLS') then
    begin
         Wlink.marked := true ;
         tv.Diagrama.DeleteMarked;
         exit;
    end;


    WOrg := Wlink.org.userdata;
    Wdst := Wlink.dst.userdata;



    with iTab do
     begin

       If IDG_DIR = 'DPN' then
        begin
          {If pLink.LinkStyle in cFluxos then
           begin
            If pLink.UserData = 0 then
              begin
                 showmessage(def1011 + wLink.text);
                 Wlink.marked := true ;
                 tv.Diagrama.DeleteMarked;
                 exit;

              end;  
            
           end;     }
          If WLink.org.shape = 2 then  // junction
             begin
                Del_Junction(WLink.org,nil);
                Wlink.Marked := true;
              end
          else
          If WStyle = 4 then   // conexão regra de negocio
             begin
               If (WLink.org.shape = 14 ) then //regra de negócio
                 Apaga_correlacao(empresa,cenario,'AP',Wdst,'RN',worg)
               else
               If WLink.org.shape in [11,50,79] then //ativiadad com atividade
                  Apaga_correlacao(empresa,cenario,'AP',Worg,'AP',wdst );
              Wlink.Marked := true;
             end
           else
           If wStyle in cFluxos then  // deletea cvorrelação requerimentos de ti
             begin
               Apaga_correlacao(empresa,cenario,'AP',Worg,'DG',wlink.UserData ) ;
               If wLink.org.Shape = 1 then  //junção
                Deleta_PercCorrelacao(pLink);
             end;


              If (pLink.Org.Shape = 56) and  (pLink.DST.Shape IN [50,79])  then
              begin     //apaga correlação evento x atividade (EN X AP)}
                        { se for o último relaton, deleta a correlaçào}
                If (pLink.org.OutLinks.Count = 1) and  (pLink.org.OutLinks.Item(1).dst = pLink.Dst)  then
                    Apaga_correlacao(empresa,cenario,'AP',Wdst,'EN',worg);

                
              end  ;
              Wlink.Marked := true;
     end
    else
       If IDG_DIR = 'DUC' then
         begin
            If WStyle = 1 then     // conexão Interface x entidade
            begin
              If (WLink.org.shape = 0 )  then // origem ;objeto entidade
                begin
                  If (WLink.dst.shape  in [15,58]) then  // objeto interface
                     Apaga_Correlacao (Empresa,cenario,'OI', wdst,wlink.Org.Tag,Worg)
                  else
                  If (WLink.dst.shape  in [8]) then  // objeto interface
                     Apaga_Correlacao (Empresa,cenario,'OC', Wdst,wlink.Org.Tag,worg)
                end
              else
              If WLink.org.shape in [58]   then // origem : objeto interface
                begin
                  If (WLink.dst.shape  = 0) then  // objeto entidade
                     Apaga_Correlacao (Empresa,cenario,'OI', WORG,wlink.dst.Tag,wdst)
                  else
                  If (WLink.dst.shape  = 8) then  // objeto entidade
                     Apaga_Correlacao (Empresa,cenario,'OI', WORG,'OC',wdst)
                  else
                  If (WLink.dst.shape  = 58) then  // objeto interface
                     Apaga_Correlacao (Empresa,cenario,'OI', WORG,'OI',wdst)
                end
              else
              If WLink.org.shape in [8]   then // origem : objeto  Controle

                 begin
                  If (WLink.dst.shape  in [15,58]) then  // objeto interface
                     Apaga_Correlacao (Empresa,cenario,'OI', WDST,'OC',wORG)
                  else
                  If (WLink.dst.shape  in [0]) then  // objeto ENTIDADE
                     Apaga_Correlacao (Empresa,cenario,'OC', Worg,wlink.dst.Tag,wdst)
                  else
                  If (WLink.org.shape  in [8]) then  // objeto de CONTROLE
                     Apaga_Correlacao (Empresa,cenario,'OC', Worg,wlink.dst.Tag,wdst ) ;

                end ;
            end ;

            WLink.Marked := true;
         end
       else
       If IDG_DIR = 'CLS' then
         begin
            If WStyle = 4 then     // conexão generaliaçào entre classes uml
            begin
               Apaga_Correlacao (Empresa,cenario,'CS', wdst,'CS',Worg) ;

            end ;

            WLink.Marked := true;
         end
       else
          Wlink.Marked := true;

     end;
end;


procedure TDG.SetBT_INF(const Value: integer);
begin
  FBT_INF := Value;
end;

procedure TDG.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

procedure TDG.SetDIAG_ID(const Value: SHORTstring);
begin
  FDIAG_ID := Value;
end;

procedure TDG.SetEMPRESA(const Value: integer);
begin
  FEMPRESA := Value;
end;

procedure TDG.SetIDG(const Value: INTEGER);
begin
  FIDG := Value;
end;

procedure TDG.SetIDG_DIR(const Value: SHORTSTRING);
begin
  FIDG_DIR := Value;
end;

procedure TDG.SetIDG_PAI(const Value: INTEGER);
begin
  FIDG_PAI := Value;
end;

procedure TDG.SetIsOpen(const Value: boolean);
begin
  FIsOpen := Value;
end;

procedure TTv.SetNodeAnteriro(const Value: TTreeNode);
begin
  FNodeAnteriro := Value;
end;

procedure TTv.SetDiagrama(const Value: Tdg);
begin
  FDiagrama := Value;
end;

procedure TTv.SetEmpresas(const Value: TEmpresa);
begin
  FEmpresas := Value;
end;


procedure TTv.SetTreeCli(const Value: TstringList);
begin
  FTreeCli := Value;
end;

procedure TTv.SetTreeCod(const Value: TstringList);
begin
  FTreeCod := Value;
end;

procedure TTv.SetTreeList(const Value: TstringList);
begin
  FTreeList := Value;
end;

procedure TTv.SetTreeproj(const Value: TstringList);
begin
  FTreeproj := Value;
end;

procedure TTv.SetTreeTi(const Value: TstringList);
begin
  FTreeTi := Value;
end;

function TDG.Get_FluxoOut(pNode: afNode;ptestaJuncao : boolean): TStringList;
var                                        //ptestajuncao : true , verifica se há junção após fluxo de saida e retorn
i,k,ifluxo : integer;                               // fluxos de saída da junçã
vList : TstringList;
ptext : string;
begin
 vList := TstringList.Create;
 result := nil;
 for i :=1 to pNode.OutLinks.Count do
  begin
  // showmessage(pNode.Text+' - '+inttostr(pNode.OutLinks.Item(i).LinkStyle));

   If pNode.OutLinks.Item(i).LinkStyle in cFluxos then
       Begin
         If not pTestaJuncao then
            vList.Add(inttostr(pNode.OutLinks.Item(i).UserData))
         else
             Begin
            //   showmessage( inttostr(pNode.OutLinks.Item(i).Dst.Shape)) ;
               If pNode.OutLinks.Item(i).Dst.Shape in [1,2] then  //junção após fluxo de saida
                 Begin
                   for k := 1 to pNode.OutLinks.Item(i).Dst.OutLinks.count do
                     Begin
                       vList.Add(inttostr(pNode.OutLinks.Item(i).Dst.OutLinks.Item(k).UserData))
                     end;
                 end
               else
                 Begin
                    vList.Add(inttostr(pNode.OutLinks.Item(i).UserData));
                 end;

             end;

       end;
      
  end;
  result := vList;
end;

{function TDG.Get_FluxoOut(pNode: afNode): TStringList;
var
i : integer;
vList : TstringList;
begin
 vList := TstringList.Create;
 result := nil;
 for i :=1 to pNode.OutLinks.Count do
  begin

   If pNode.OutLinks.Item(i).LinkStyle in cFluxos then
      vList.Add(inttostr(pNode.OutLinks.Item(i).UserData));
  end;
  result := vList;
end; }

function TDG.Get_OrgAtiv(plInk: afLink): TstringList;
begin

end;

function TDG.Get_FluxosIn(pNode: afNode): TstringList;
var
i : integer;
wlist : TstringList;
begin
  result := nil;
  try
    wList := TstringList.Create;
    for i := 1 to pNode.InLinks.Count do
    Begin
       If pnode.InLinks.item(i).LinkStyle in[2,5,6,9]  then
        Begin
         If pnode.InLinks.item(i).ArrowMid > 0 then   // estímulo
            wList.Add(inttostr(pnode.InLinks.item(i).userdata)) ;
        end;

    end;

  finally
     result := wlist;
    // freeandnil(wlist);
  end;


end;

function TDG.Get_Volume(pNode: afNode): real;
var
wList : TstringList;
i : integer;
iFlux : Tdados_tab;
wvol : real;
begin
  wvol := 0;
  wList := TstringList.create;
  If tv.Diagrama.SelectedNode <> nil then
     Begin
      iFlux :=  TDados_Tab.create(self);
      try
        { pega os fluxos(estímulos) que entram na ativ}
        wList := tv.Diagrama.Get_FluxosIn(pNode);
        for i := 0 to wList.Count - 1 do
        Begin
           { abre o objeto}
           iFlux.Open_Objeto(udado(tv.selected.Data)^.Fcli,
                             udado(tv.selected.Data)^.Fcli,
                             strtoint(wList[i]),'IDF_DG') ;
           wvol := wvol + iflux.fieldbyname('IDF_VOLUME_PROC').asfloat;
        end;

      finally
         result := wvol;
         freeandnil(iFlux);
        // freeandnil(wList);
      end;
    end;
end;




procedure TDG.SetDG_DADOS(const Value: TDiag_dados);
begin
  FDG_DADOS := Value;
end;

procedure TDG.SetCurrent_Lock(const Value: integer);
begin
  FCurrent_Lock := Value;
end;

procedure TTv.SetTreeWbs(const Value: TstringList);
begin
  FTreeWbs := Value;
end;

function TDG.Get_Node(pDiag : Tdg;pId: integer): afNode;
var
i ,tot: integer;
iNode : afNode;
begin
  result := nil;
  tot := pDiag.Nodes.count;
  for i := 1 to tot do
   Begin
    If pDiag.Nodes.Item(i).UserData = pId then
     Begin
       result := pDiag.Nodes.Item(i);
       break;
     end;
   end;
end;

function TDG.Get_NodeGraph(pDiag : Tdg;pId,pTipo: integer): afNode;
var
i ,tot: integer;
iNode : afNode;
begin
  result := nil;
  tot := pDiag.Nodes.count;
  for i := 1 to tot do
   Begin
    If (pDiag.Nodes.Item(i).UserData = pId) and (pDiag.Nodes.Item(i).shape = pTipo) then
     Begin
       result := pDiag.Nodes.Item(i);
       break;
     end;
   end;
end;

procedure TDG.SetEDITAVEL(const Value: boolean);
begin
  FEDITAVEL := Value;
end;

function TDG.DemoMaior(pTipo : string;pGlobal : boolean) : boolean;
var
wqtd , WQTDMAX,m: integer;
begin
 result := false;
 If not frm_main.wDemo then
  exit;

 If pTipo = 'DIAG' then   //total diagramas
   Begin
     with TDiag_dados.create(self) do
      Begin
        wQtd := TotalDiagg;
        If wQtd > frm_main.wqtdemo then
         result := true;
        free;
        EXIT;
      end;
   end;


 with Tdados_tab.create(self) do
  Begin
    wQtd := TotalObj(pTipo);            //dimensões
    If not pGlobal then
      wqtd := wqtd +1;
    m := In_Array(ptipo,wobj);
    If m = -1 then
       raise exception.create(E21);
    wqtdmax := wObjqt[m+1];   
    If wQtd > wqtdmax then
     result := true ;
   free;
  end;
end;

function TDG.Carrega_tipo: boolean;
begin
  with TProvider_data.create(self) do
   Begin
    Carga_array;
    free;
   end;
end;



procedure TDG.SetNODESELECTED(const Value: afNode);
begin
  FNODESELECTED := Value;
end;

function TDG.Get_property(pdf: Tdg): boolean;
var
WFont :IFontDisp;
Wfont1 : Tfont  ;
begin

end;







procedure TDG.Update_Perc;
var
iTmp,iFluxo ,iseg: Tdados;
wper,wPerant : real;
 Begin
   iTmp := Pega_JU;
   while not iTmp.eof do
    Begin

      iFluxo := Get_fluxo(iTmp.fieldbyname('FLUXANT').asstring );
       iF iFluxo = nil then
           wperant := 100
       else
           wperant := iFluxo.fieldbyname('PERC_PASSAG').asfloat ;
       wper := (iTmp.fieldbyname('PERC_PASSAG').asfloat * wperant) /100;
       Atu_PercTot( iTmp.fieldbyname('FLUXO').asstring,wPER);
     iTmp.Next;
    end;
 end;



function TDG.get_passagem(pCli,pProj,pIdPai,pIdFilho : integer) : real;
Begin
 with Tdados_tab.create(self) do
  Begin
    result := 0;
    If  Get_correlato(pCli,pProj,'JU',pIdpai,'AP',pIdfilho) then
       result := fieldbyname('PERC_CUSTO').asfloat;

   free;
  end;
end;




 function  TDG.Atu_percTot(pFluxo : string;pPer : real) : real;
 Begin
   with TDados.Create(self) do
    Begin
      result := 0;
      close;
      sql.clear;
      sql.add(' UPDATE CUSTO_TEMP  ');
      sql.add(' SET PERC_PASSAG = '+''+floattostr(pPer)+'');
      sql.add('	WHERE FLUXO = '+''''+pFluxo+'''');
      execsql;
      free;
    end;
 end;



 function  TDG.Get_Fluxant(pId : integer;pTipo : string) : Tdados;
 var
  idad : Tdados  ;
 Begin
  idad :=  TDados.Create(self);
  with idad do
    Begin
      result := nil;
      close;
      sql.clear;
      sql.add('SELECT * FROM CUSTO_TEMP  ');
      sql.add('	WHERE OBJ_SEGUINTE = '+''+inttostr(pId)+'');
      sql.add(' AND TIPO_SEG = '+''''+pTipo+'''');
      open;
      If not eof then
       result := idad;

    end;
 end;

 function  TDG.Get_Fluxo(pFluxo : string) : Tdados;
 var
  idad : Tdados  ;
 Begin
  idad :=  TDados.Create(self);
  with idad do
    Begin
      result := nil;
      close;
      sql.clear;
      sql.add('SELECT * FROM CUSTO_TEMP  ');
      sql.add('	WHERE FLUXO  = '+''''+pFluxo+'''');
      sql.add(' AND TIPO = '+''''+'JU'+'''');
      open;
      If not eof then
       result := idad;

    end;
 end;

 function  TDG.pega_Primeiras : Tdados;
 var
  idad : Tdados;
 Begin
   idad := TDados.Create(self);
   with idad do
    Begin
      result := nil;
      close;
      sql.clear;
      sql.add('SELECT * FROM CUSTO_TEMP  ');
      sql.add(' WHERE FLUXO = '+''''+''+'''');
      sql.add('ORDER BY TIPO DESC');

      open;
      If not eof then
        result := iDad;
     // freeandnil(idad);
    end;
 end;

function  TDG.pega_JU: Tdados;
 var
  idad : Tdados;
 Begin
   idad := TDados.Create(self);
   with idad do
    Begin
      result := nil;
      close;
      sql.clear;
      sql.add('SELECT * FROM CUSTO_TEMP  ');
      sql.add(' WHERE TIPO = '+''''+'JU'+'''');
      open;
      If not eof then
        result := iDad;
     // freeandnil(idad);
    end;
 end;


 function  TDG.pega_Seguinte(pObj : integer;pTipo : string) : Tdados;
 var
  idad : Tdados;
 Begin
   idad := TDados.Create(self);
   with idad do
    Begin
      result := nil;
      close;
      sql.clear;
      sql.add('SELECT * FROM CUSTO_TEMP  ');
      sql.add('	WHERE OBJETO = '+''+inttostr(pObj)+'');
      sql.add(' AND TIPO = '+''''+pTipo+'''');

      open;
      If not eof then
        result := iDad;
     // freeandnil(idad);
    end;
 end;



 function TDG.Consiste_dg(pCli,pCenario,pId : integer) : boolean;
 var
 oList,iList : Tlist;
 mList : uLst;
 wdescdg : string;
 i,j,ws,y : integer;
 wnode,wUp : afNode;
 iTemp : TTemp;
 Begin
   itemp := ttemp.create(self);
   result := false;
try

   with TDiag_dados.create(self) do
    Begin
      Get_diagrama(pcli,pcenario,pId);
      wdescdg := fieldbyname('SUB_NOME').asstring;
     free;
    end;

   // consiste atividades sem sucessor
   oList := Get_atividadesFinais;
   for i := 0 to oList.Count -1 do
    Begin
      mList := oList.Items[i];
      itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,mList^.eNode.UserData,'',mList^.eNode.Text,def24);
      result := true;
    end;

     //consistencias nodes
   tot := nodes.Count;
   for i := 1 to nodes.Count  do
    Begin
      If not Nodes.item(i).Selectable then
       continue;
//Geral
            //verifica descri'xcão da atividade
      If trim(Nodes.Item(i).Text) = '' then
        Begin
          result := true;
          itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defo6);

         end;

//atividades
      If nodes.Item(i).shape  in [50,79] then
         // consiste conexoes de uma atividada com outra atividades

         Begin
            iList := get_nodes(nodes.Item(i),'I');
            If iList.Count = 0 then
             Begin
               itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defa20);
               result := true;
             end;

            oList := get_nodes(nodes.Item(i),'O');
            If oList.Count > 1 then
             Begin
                mLst := oList.Items[0];
                wNode := mLst^.eNode;
                If wnode <> nil then
                 Begin
                   for j := 1 to oList.Count-1 do
                    Begin
                      mLst := oList.Items[j];
                      If mLst^.eNode <> wNode then
                       Begin
                          itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defa21);
                          result := true;
                       end;
                     end;
                 end;

             end;

              //verifica existencia de ator
          with Tdados_tab.create(self) do
           Begin
            If not Get_correlatos(pCli,pcenario,'AP',nodes.item(i).userdata,'CA','IDF_CA') then
               Begin
                result := true;
               itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defa22);

               end;


            free;
           end;

               //verifica existencia de local de Processamento
          with Tdados_tab.create(self) do
           Begin
            If not Get_correlatos(pCli,pcenario,'AP',nodes.item(i).userdata,'LF','IDF_LF') then
              begin
               itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defa23);
               result := true;
              end;
            free;
           end;
         end
      else

//Junção

      If nodes.Item(i).shape  in [1] then    // junção
       // consiste mais de duas saidas para juncao tipo <O>
       Begin
          If Get_FluxoOut(Nodes.Item(i),false).Count < 2 then   // com menos de duas saidas
             Begin
                wUp := Obtem_JuncUp(Nodes.Item(i) );
                itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',wUp.Text,defj7);
                result := true;
             end;

         { If Nodes.Item(i).Text = 'O' then
           Begin
            If Get_FluxoOut(Nodes.Item(i)).Count > 2 then
             Begin
                wUp := Obtem_JuncUp(Nodes.Item(i) );
                itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',wUp.Text,'Junção Tipo <Ou> possui mais de 2 saídas!');
             end;
           end; }

          oList := Get_nodes(Nodes.Item(i),'I');
          for j := 0 to oList.Count -1 do
           Begin
            mList := oList.Items[j];
            If mList^.enode <> nil then
               ws :=mList^.eNode.shape ;
            If not ( ws  in [1,2,50,79]) then  // se não é atividade ou junção  entrando na juncao ..
              Begin
                 wUp := Obtem_JuncUp(Nodes.Item(i) );
                 itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',wUp.Text,defj8);
                 result := true;
              end;

           end;

       end
     else
//Evento de negócio

     If nodes.Item(i).shape  in [56] then    // jevento
       // consiste mais de duas saidas para juncao tipo <O>
       Begin
          If Get_FluxoOut(Nodes.Item(i),false).Count= 0 then   // sem fluxo de saida
             Begin
                itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).userdata,'',nodes.item(i).Text,defe28);
                result := true;
             end;



       end;


       //verifica dg sem descrição
       If nodes.item(i).Outlinks.Count > 0 then
        Begin
          for y := 1 to nodes.item(i).Outlinks.Count do
            Begin
               If nodes.item(i).Outlinks.item(y).LinkStyle in cFluxos then
                Begin
                 If (trim(nodes.item(i).Outlinks.item(y).Text) = '') and (nodes.item(i).Outlinks.item(y).UserData <> 0) then
                   begin
                    itemp.Inclui_temp(pCli,pCenario,pId,wDescdg,nodes.item(i).Outlinks.item(y).userdata,'','??',deff6+nodes.item(i).text+defs21);
                    result := true;
                   end;
                end;
            end;
        end;

    end;

 finally
  freeandnil(iTemp);

 end;
 end;

 {procedure TDG.Update_temp(pObj,pSeg,pAnt : integer;pTipo,pTipo_seg,pTipoAnt : string;ptot,pPerc,pPond : real);
 Begin
   with TDados.Create(self) do
    Begin
      close;
      sql.clear;
      sql.add('UPDATE CUSTO_TEMP SET ');
      If pSeg > 0 then
       Begin
         SQL.ADD('obj_seguinte  = '+''+inttostr(pSeg)+''+',');
         SQL.ADD('Tipo_seg  = '+''''+pTipo_Seg+'''');
       end;

       If pAnt > 0 then
        Begin
           SQL.ADD('obj_ant  = '+''+inttostr(pAnt)+''+',');
           SQL.ADD('Tipo_ObjAnt = '+''''+pTipoAnt+'''');
        end;



      sql.add(' WHERE OBjeto = '+''+inttostr(pObj)+'');
      sql.add(' AND TIPO = '+''''+pTipo+'''');
      execsql;
      free;
    end;
 end; }

procedure TDG.Update_Fluxo(pObj,pObjseg : integer;pFluxo ,pFluxAnt,pTipo,pTipoSeg: string;pPer : real);
 Begin
   with TDados.Create(self) do
    Begin
      close;
      sql.clear;
      sql.add('UPDATE CUSTO_TEMP SET ');
      SQL.ADD('FLUXO  = '+''''+pFluxo+''''+',');
      SQL.ADD('FLUXANT  = '+''''+pFluxant+''''+',');
      SQL.ADD('PERC_PASSAG  = '+''+floattostr(pPer)+'');
      sql.add(' WHERE OBjeto = '+''+inttostr(pObj)+'');
      sql.add(' AND TIPO = '+''''+pTipo+'''');
      sql.add(' AND TIPO_SEG = '+''''+pTiposEG+'''');
      sql.add(' AND OBJ_SEGUINTE = '+''+inttostr(pObjSeg)+'');
      execsql;
      free;
    end;
 end;



procedure TDG.Update_FluxAnt(pObj,pObjseg : integer;pFluxAnt,pTipo,pTipoSeg: string;pPer : real);
 Begin
   with TDados.Create(self) do
    Begin
      close;
      sql.clear;
      sql.add('UPDATE CUSTO_TEMP SET ');
      SQL.ADD('FLUXANT  = '+''''+pFluxant+'''');

      sql.add(' WHERE OBjeto = '+''+inttostr(pObj)+'');
      sql.add(' AND TIPO = '+''''+pTipo+'''');
      sql.add(' AND TIPO_SEG = '+''''+pTiposEG+'''');
      sql.add(' AND OBJ_SEGUINTE = '+''+inttostr(pObjSeg)+'');
      execsql;
      free;
    end;
 end;


function  Tdg.Get_ObJetos() : TList;
var                              // devolve todos os objetos selecionáveis do Diagrama}
 i,tot : integer;
 iList : TList;

Begin
  iList := TList.create;
  result := nil;
  tot := self.nodes.Count;
  for i := 1 to tot do
   Begin
      If  self.Nodes.Item(i).Selectable then
       Begin
         new(mListaObj);
         mListaObj^.eNode    := self.Nodes.Item(i);
         iList.Add(mListaObj);
       end;

   end ;

   result := iList;

end;


function  Tdg.Get_Atividadesiniciais() : TList;
var                              // devolve todos as atividades iniciais do Diagrama(anterior deve ser evento ou
 i,tot,j,w: integer;             // processo externo com estímulo
 iList,oList : TList;            // - nõa pode haver outros objetos anteriores
 mList : uLst;
 inicial : boolean;
Begin
  iList := TList.create;
  result := nil;
  tot := self.nodes.Count;
  for i := 1 to tot do
   Begin
      If  self.Nodes.Item(i).Selectable then
       Begin
         If self.Nodes.Item(i).shape  in [11,50,59,79] then
          Begin
             inicial := false;

             oList := get_nodes(self.Nodes.Item(i),'I');
             for j := 0 to oList.Count-1 do
              Begin
                mList := oList.items[j];
                If mList^.eNode <> nil then
                Begin
                  If  (mList^.eNode.Shape in [54,56]) then   //processo externo,evento de negocio
                   Begin
                      inicial := true;
                   end
                  else
                   inicial := false ;
                end;
                
              end;
              If Inicial then
               Begin
                  new(mListaObj);
                  mListaObj^.eNode    := self.Nodes.Item(i);
                  iList.Add(mListaObj);
                 // mListaObj^.eNode.FillColor := clAcqua;
               end;
          end;

      end;
   end ;

   result := iList;

end;

function  Tdg.AtivInicial ( pNode : afNode) : boolean;
var                              // true se atividade é inicial (sem outra atividade antes
 i,tot,j,w: integer;
 iList,oList : TList;
 mList : uLst;
 inicial : boolean;
Begin
  iList := TList.create;
  result := false;
  If  pNode.Selectable then
   Begin
     If pNode.shape  in [50,79] then
      Begin
         inicial := false;
         oList := get_nodes(pNode,'I');
         for j := 0 to oList.Count-1 do
          Begin
            mList := oList.items[j];
            If mList^.eNode <> nil then
            Begin
              If  (mList^.eNode.Shape in [54,56]) then   //processo externo,evento de negocio
                  inicial := true
              else
               inicial := false ;
            end;

          end;
          If Inicial then
             result := true;
      end;

  end;
end;

function  Tdg.Get_AtividadesFinais() : TList;
var                              // devolve todos as atividades sem sucessor)
 i,tot,j: integer;
 iList,oList : TList;
 mList : uLst;
Begin
  iList := TList.create;
  result := nil;
  tot := self.nodes.Count;
  for i := 1 to tot do
   Begin
      If self.Nodes.Item(i).shape  in [11,50,59,79] then
          Begin
             oList := get_nodes(self.Nodes.Item(i),'O');
             If oList.count = 0 then
              Begin
               new(mListaObj);
               mListaObj^.eNode    := self.Nodes.Item(i);
               iList.Add(mListaObj);
              end;
          end;
   end ;

   result := iList;

end;

function  Tdg.Get_Atividades() : TList;
var                              // devolve todos as atividades )
 i,tot,j: integer;
 iList,oList : TList;
 mList : uLst;
Begin
  iList := TList.create;
  result := nil;
  tot := self.nodes.Count;
  for i := 1 to tot do
   Begin
      If self.Nodes.Item(i).shape  in [11,50,59,79] then
          Begin
           new(mListaObj);
           mListaObj^.eNode    := self.Nodes.Item(i);
           iList.Add(mListaObj);
          end;
   end ;

   result := iList;
end;






procedure TDG.Setcustomo(const Value: real);
begin
  Fcustomo := Value;
end;

procedure TDG.Setpercacum(const Value: real);
begin
  Fpercacum := Value;
end;

procedure TDG.SetcustAntes(const Value: real);
begin
  FcustAntes := Value;
end;

procedure TDG.Setantes(const Value: integer);
begin
  Fantes := Value;
end;

procedure TDG.SetCustoGeral(const Value: real);
begin
  FCustoGeral := Value;
end;

procedure TDG.SetCustoTec(const Value: real);
begin
  FCustoTec := Value;
end;

procedure TDG.SetCustAntesGeral(const Value: real);
begin
  FCustAntesGeral := Value;
end;

procedure TDG.SetCustantesTec(const Value: real);
begin
  FCustantesTec := Value;
end;


procedure ImprimeAtorAtividade(pcli,pProj,pAtor : integer;pView : string);
var
iCa ,iAp: Tdados_tab;
I : INTEGER;
begin
  iCa := Tdados_tab.Create(application);
  iAp := Tdados_tab.Create(application);
  iAp.DataSource := iCa.DataExt;

  try
    //frm_patorat.db2.DataSet := iAp;
    //frm_patorat.qrp.dataset := iCa;
    iCa.Open_Objeto(pCli,pProj,pAtor,'IDF_CA');
    iAp.Get_PaisCorrelatosBis(pCli,pProj,'AP',pAtor,'CA','IDF_AP','ATOR_CATEGORIA','D') ;

    qrDataSet(frm_patorat.DB2,iAp);
    with frm_patorat do
      begin
          //titulo.caption  := uppercase(def105);
          for i := 0 to componentCount -1 do
           begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_patorat.Components[i],ica);
           end;


  //    titulo.caption  := 'MANUAL DE GESTÃO DE PROCESSOS';
      If pView = 'V' then
//        qRP.preview
     else
     If pView = 'P' then
//        qrp.print
     else
//     frm_Treeativ.ReportList.Add(frm_patorat.QRP);

      end;

  finally
   //  freeandnil(iPs);

  end;


end;


procedure Imprime_atividades(pCli,pProj : integer;pWbs : string;ptipoativ,pClass : integer;
                             pView: string;pResum : boolean;pForm: TForm;pForceNew : boolean);
var

Wwbs ,ruc,ruc1: string;
i : integer;
begin

  If presum then    //resumido
      begin
        //TFrm_Pativ1(pForm).qrp.DataSet := TFrm_Pativ1(pForm).iAp;
        with TFrm_Pativ1(pForm)do
          begin
             for i := 0 to componentCount -1 do
              begin
               If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
                  qrdataset(Tfrm_pativ1(pform).Components[i],TFrm_Pativ1(pForm).iAp);
              end;
          end;

        case pTipoAtiv of
         0 : TFrm_Pativ1(pForm).Titulo.caption  := def106;
         1 : TFrm_Pativ1(pForm).Titulo.caption  := def107 ;
         2 : TFrm_Pativ1(pForm).Titulo.caption  := def108 ;
         3 : TFrm_Pativ1(pForm).Titulo.caption  := def109;
        end;
        iF pView = 'V' then
           TFrm_Pativ1(pForm).QRP.preview
        else
        iF pView = 'P' then
            TFrm_Pativ1(pForm).QRP.print;
        TFrm_Pativ1(pForm).close;
        exit;
      end ;


 Tfrm_pAtiv(pForm).qr_func.Height := 57;
    case pTipoAtiv of
     0 : Begin
          Tfrm_pAtiv(pForm).qr_func.Height := 0;
         end;
    end;

 Tfrm_pAtiv(pForm).qrp.DataSet := Tfrm_pAtiv(pForm).iAp;
 Tfrm_pAtiv(pForm).qr_main.ForceNewPage := pForceNew;
 with Tfrm_pAtiv(pForm) do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Tfrm_pativ(pForm).Components[i],Tfrm_pAtiv(pForm).iAp);
          end;
      end;

   case pTipoAtiv of
         0 : Tfrm_pAtiv(pForm).Titulo.caption := def106;
         1 : Tfrm_pAtiv(pForm).Titulo.caption := def107;
         2 : Tfrm_pAtiv(pForm).Titulo.caption := def108;
         3 : Tfrm_pAtiv(pForm).Titulo.caption := def109;
   end;


   Tfrm_pAtiv(pForm).pr_cli.caption     :=  frm_main.lb_cli.caption;
   Tfrm_pAtiv(pForm).pr_proj.caption    :=  frm_main.lb_cen.caption;

    try
     //ator

     Tfrm_pAtiv(pForm).iAtor.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
     Tfrm_pAtiv(pForm).iAtor.Get_PaisFilhos(pCli,pProj,'AP','CA','IDF_CA') ;
     qrDataSet(Tfrm_pAtiv(pForm).Qr_ator,Tfrm_pAtiv(pForm).iAtor);
     //local de processamento
     Tfrm_pAtiv(pForm).iLocal.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
     Tfrm_pAtiv(pForm).iLocal.Get_PaisFilhos(pCli,pProj,'AP','LF','IDF_LF') ;
     qrDataSet(Tfrm_pAtiv(pForm).Qr_lOCAL,Tfrm_pAtiv(pForm).iLocal);
     //regras de negócio

     Tfrm_pAtiv(pForm).iRn.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
     Tfrm_pAtiv(pForm).iRn.Get_PaisFilhos(pCli,pProj,'AP','RN','IDF_RN') ;
     qrDataSet(Tfrm_pAtiv(pForm).Qr_Regra,Tfrm_pAtiv(pForm).iRn);
     // Evento de negócio

     Tfrm_pAtiv(pForm).iEn.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
     Tfrm_pAtiv(pForm).iEn.Get_PaisFilhos(pCli,pProj,'AP','EN','IDF_EN') ;
     qrDataSet(Tfrm_pAtiv(pForm).Qr_Evento,Tfrm_pAtiv(pForm).iEn);
     // mecanismos

     Tfrm_pAtiv(pForm).iFunc.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
     Tfrm_pAtiv(pForm).iFunc.Get_PaisFilhos(pCli,pProj,'AP','SE','IDF_SE') ;
     qrDataSet(Tfrm_pAtiv(pForm).Qr_FUNC,Tfrm_pAtiv(pForm).iFunc);

     //TI
      Tfrm_pAtiv(pForm).iReq.DataSource := Tfrm_pAtiv(pForm).iAp.DataExt;
      Tfrm_pAtiv(pForm).iReq.Get_tigLOB(pCli,pProj) ;
      qrDataset(Tfrm_pativ(pForm).qr_ti,Tfrm_pAtiv(pForm).iReq);

      iF pView = 'V' then
         Tfrm_pAtiv(pForm).QRP.preview
      else
      iF pView = 'P' then
         Tfrm_pAtiv(pForm).QRP.print
      else
        frm_Treeativ.ReportList.Add(TFRM_PATIV(pForm).QRP);
   finally

   end;

end;


procedure Imprime_regra(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
begin

       with frm_pregra do
           begin
           ld.ForceNewPage  :=  pQuebra  ;
           qrDataset(frm_pregra.ld,iRn) ; // aloca dataset aos componentes principais(DBtext,...)
           qrDataset(frm_pregra.ChildBand1,iRn) ; // aloca dataset aos componentes principais(DBtext,...)
           qrDataset(frm_pregra.ChildBand2,iRn) ; // aloca dataset aos componentes principais(DBtext,...)
           qrDataset(frm_pregra.qr_impl,iRn) ; // aloca dataset aos componentes principais(DBtext,...)


           iAp.DataSource := iRn.DataExt;
           iAp.Get_PaidosFilhos(pCli,pProj,'AP','RN','IDF_AP');
           qrDataset(frm_pregra.qr_at,iAp) ; // aloca dataset aos componentes principais(DBtext,...)


           iDe.DataSource := iRn.DataExt;
           iDe.Get_PaisFilhos(pCli,pProj,'RN','DE','IDF_DE');
           qrDataset(frm_pregra.qr_DAD,iDe) ; // aloca dataset aos componentes principais(DBtext,...)

           titulo.caption       := def5;

           qrp.dataset     := iRn;


           If pprev = 'V' then
            qrp.preview
          else
          If pprev = 'P' then
            qrp.print
          else
            frm_Treeativ.ReportList.Add(FRM_PREGRA.QRP);
      end;

end;

procedure Imprime_Evento(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
begin

    with frm_pen do
    begin
     DetailBand1.ForceNewPage := pQuebra;
     titulo.caption := uppercase(def110);
     qrDataSet(frm_pen.DetailBand1,iEn);
     qrp.dataset := iEn;


     iAp.DataSource := iEn.DataExt;
     iAp.Get_PaiDosFilhos(pCli,pProj,'AP','EN','IDF_AP') ;

     qrDataSet(frm_pen.Qr_at,iAp);


      If pprev = 'V' then
            qrp.preview
      else
      If pprev = 'P' then
            qrp.print
      else
      frm_Treeativ.ReportList.Add(FRM_PEN.QRP);
    end;


end;


procedure Imprime_Externo(pCli,pProj : integer;pPrev : string;pQuebra : boolean);

begin

//     iEe.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_CA','EE','',0) ;
     with frm_pEntExt do
      Begin
        DetailBand1.ForceNewPage := pQuebra;
        titulo.caption := uppercase(def111);
        qrDataSet(frm_pEntExt.DetailBand1,iEE);
        frm_pEntExt.qrp.dataset := iEe;

     If pprev = 'V' then
            qrp.preview
      else
      If pprev = 'P' then
            qrp.print
      else
      frm_Treeativ.ReportList.Add(frm_pEntExt.QRP);
      end;
end;

procedure Imprime_OI(pCli,pProj : integer;pPrev : string;pQuebra : boolean;pTag : integer);
begin
   with frm_puc do
      begin

         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_puc.Components[i],ioi);
          end;
          qrband2.ForceNewPage := pQuebra;
          qrp.DataSet := iOi;
          qrDataset(frm_puc.qrband2,iOi);
          qrDataset(frm_puc.QRsubdetail1,iTab);
          iTab.DataSource := iOi.DataExt;
          iTab.Get_PaisFilhos(pCli,pProj,'OI','EV','IDF_EV') ;
          qrDataSet(frm_puc.QrSubDetail1,iTab);

          QRLabel19.caption := def18 +' ';
          frm_puc.qrband1.height := 0;
          frm_puc.qrsubdetail2.height := 0;
           If pprev = 'V' then
            qrp.preview
           else
            If pprev = 'P' then
                  qrp.print
           else
             frm_Treeativ.ReportList.Add(frm_puc.QRP);
      end;

end;

procedure Imprime_FluxoDado(pCli,pProj : integer;pPrev : string;pQuebra : boolean);
var
I : INTEGER;
begin

   with frm_pdata do
   begin
    Qrband1.ForceNewPage := pQuebra;
    qrp.dataset := idado;
    for i := 0 to componentCount -1 do
      begin
       If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
          qrdataset(frm_pdata.Components[i],idado);
      end;

     iDe.DataSource := iDado.DataExt;
     iDe.Get_PaisFilhos(pCli,pProj,'DG','DE','IDF_DE') ;

     qrDataSet(frm_pdata.Qr_DE,iDe);

     frm_pdata.titulo.caption  := uppercase(def9);

     If pPrev = 'V' then
        frm_pdata.qRP.preview
     else
     If pPrev = 'p' then
        frm_pdata.qrp.print
     else
       frm_Treeativ.ReportList.Add(frm_pdata.QRP);
   end;
END;


procedure Atu_schema;  // atualizaçào DDL : atualizar a constante WTABELAS com novas tabelas
var
iTab,iFld : TstringList;
i,wseq : integer;
   begin
  adoc := TAdoConnection.create(application);
  qry_cria_idf_dados := TadoQuery.create(application);

  Atu_schema1;
//  SpeedButton5Click(nil); //atributos lck

  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;

   begin
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
      //ACRESCENTA OS CAMPOS USUARIO E DATA DE ATUALIZAÇÃO PARA CONTROLE DE USUARIOS
     for i := 0 to iTab.Count - 1 do
        Begin
           If  (UPPERCASE(copy(iTab[i],1,3)) = 'IDF') or
               (uppercase(iTab[i]) = 'CLI_CLIENTE') OR
               (uppercase(iTab[i]) = 'COR_OBJETOS') OR
               (uppercase(iTab[i]) = 'PRJ_PROJETO') OR
               (uppercase(iTab[i]) = 'SUB_SUBORDINACAO') OR
               (uppercase(iTab[i]) = 'REQUERIMENTOS') OR
               (uppercase(iTab[i]) = 'TI_ADERENCIA') OR
               (uppercase(iTab[i]) = 'TI_LAY') OR
               (uppercase(iTab[i]) = 'TI_REQ') OR
               (uppercase(iTab[i]) = 'IDG_CLASS') then
           begin
               adoc.GetFieldNames(iTab[i],ifld);
               If not Inlist('USUARIO',iFld) then
                 Begin
                  with qry_cria_Idf_dados do
                   begin
                     close;
                     sql.clear;
                     sql.add('ALTER TABLE '+iTab[i]);
                     sql.add('ADD USUARIO VARCHAR(20) NULL');
                     execsql;
                     close;
                     sql.clear;
                     sql.add('ALTER TABLE '+iTab[i]);
                     sql.add('ADD DATATU DATE NULL');
                     execsql;
                  end;
                 end;
           end ;
        end;



        If not InList('IDF_USUARIO',itab) then
             begin
             with qry_cria_Idf_dados do
              begin
                close;
                sql.clear;
                If bdx.TIPOBANCO = 1 then
                   begin
                    sql.add('CREATE TABLE IDF_USUARIO( ');
                    sql.add('ID_USUARIO INTEGER NOT NULL ');
                    sql.add('       ,DATATU DATE         ');
                    sql.add('        ,US_NOME VARCHAR(30)  ');
                    sql.add('        ,USUARIO VARCHAR(30)  ');
                    sql.add('        ,CLI_ID INTEGER      ');
                    sql.add('        ,PRJ_ID INTEGER)');
                    execsql ;
                   end
                else
                    Begin
                        sql.add('CREATE TABLE IDF_USUARIO( ');
                        sql.add('ID_USUARIO LONG NOT NULL ');
                        sql.add('       ,DATATU DATE         ');
                        sql.add('        ,US_NOME VARCHAR(30)  ');
                        sql.add('        ,USUARIO VARCHAR(30)  ');
                        sql.add('        ,CLI_ID LONG      ');
                        sql.add('        ,PRJ_ID LONG)');
                        execsql ;
                    end;
                close;
                sql.clear;
                sql.add('ALTER TABLE IDF_USUARIO ADD CONSTRAINT IO_USUARIO PRIMARY KEY ( ID_USUARIO ); ');
                execsql;
                close;
                sql.clear;
                sql.add('CREATE INDEX iCLI ON IDF_USUARIO ( CLI_ID,PRJ_ID ); ');
                execsql;
              end;
             end;

          If not InList('IDF_USECASE',itab) then
           Begin
              with qry_cria_Idf_dados do
                Begin
                 close;
                 sql.clear;
                 If bdx.TIPOBANCO = 1 then
                  Begin
                     sql.add('CREATE TABLE IDF_USECASE( ');
                     sql.add('ID_USECASE INTEGER NOT NULL   ');
                     sql.add('         ,DATATU DATE          ');
                     sql.add('         ,UC_NOME VARCHAR(30) ');
                     sql.add('         ,GRUPO VARCHAR(30)   ');
                     sql.add('         ,US_DESCRICAO VARCHAR(50))   ');
                     execsql ;
                  end
                 else
                  Begin
                     sql.add('CREATE TABLE IDF_USECASE( ');
                     sql.add('ID_USECASE LONG NOT NULL   ');
                     sql.add('         ,DATATU DATE          ');
                     sql.add('         ,UC_NOME VARCHAR(30) ');
                     sql.add('         ,GRUPO VARCHAR(30)   ');
                     sql.add('         ,US_DESCRICAO VARCHAR(50) )  ');
                     execsql ;
                   end;
                   close;
                  sql.clear;
                  sql.add('ALTER TABLE IDF_USECASE ADD CONSTRAINT I0_USECASE PRIMARY KEY ( ID_USECASE ) ');
                  execsql;
                  sql.clear;
                  sql.add('CREATE UNIQUE INDEX iUc ON IDF_USECASE(UC_NOME) ');
                  execsql;
                end;
            end;
            //tabela IDF_USECASE
      If InList('IDF_USECASE',itab) then
       Begin
           adoc.GetFieldNames('IDF_USECASE',ifld);
           If not Inlist('UC_LING',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_USECASE ');
               sql.add('ADD UC_LING VARCHAR(2)');
               execsql;
              end;
           end;
        END;


            If not InList('BST_VALIDACAO',itab) then
             begin
             with qry_cria_Idf_dados do
              begin
                close;
                sql.clear;
                If bdx.TIPOBANCO = 1 then
                   begin
                    sql.add('CREATE TABLE BST_VALIDACAO( ');
                    sql.add('IDCLIENTE INTEGER NOT NULL ');
                    sql.add('       ,VALIDADE VARCHAR(50)');
                    sql.add('        ,LIMITE INTEGER  ');
                    sql.add('        ,ATUACAO VARCHAR(50)  ');
                    sql.add('        ,DISCO VARCHAR(50)    ');
                    sql.add('        ,LEITURA VARCHAR(50))  ');
                    execsql ;
                   end
                else
                    Begin
                        sql.add('CREATE TABLE BST_VALIDACAO( ');
                        sql.add('IDCLIENTE INTEGER NOT NULL ');
                        sql.add('       ,VALIDADE VARCHAR(50)');
                        sql.add('        ,LIMITE INTEGER  ');
                        sql.add('        ,ATUACAO VARCHAR(50)  ');
                        sql.add('        ,DISCO VARCHAR(50))      ');
                        sql.add('        ,LEITURA VARCHAR(50))  ');                        
                        execsql ;
                    end;
                close;
                sql.clear;
              end;
             end;



          If not InList('IDF_PESSOA',itab) then
           Begin
              with qry_cria_Idf_dados do
                Begin
                 close;
                 sql.clear;
                 If bdx.TIPOBANCO = 1 then
                  Begin
                     sql.add('CREATE TABLE IDF_PESSOA( ');
                     sql.add('ID_PESSOA INTEGER NOT NULL     ');
                     sql.add('         ,DATATU DATE          ');
                     sql.add('         ,ID_USUARIO INTEGER   ');
                     sql.add('         ,PES_NOME VARCHAR(30) ');
                     sql.add('         ,PES_SENHA VARCHAR(30)');
                     sql.add('         ,USUARIO VARCHAR(30))');
                     execsql ;
                  end
                 else
                  Begin
                      sql.add('CREATE TABLE IDF_PESSOA( ');
                     sql.add('ID_PESSOA INTEGER NOT NULL     ');
                     sql.add('         ,DATATU DATE          ');
                     sql.add('         ,ID_USUARIO LONG   ');
                     sql.add('         ,PES_NOME VARCHAR(30) ');
                     sql.add('         ,PES_SENHA VARCHAR(30)');
                     sql.add('         ,USUARIO VARCHAR(30))');
                     execsql ;
                  end;
                  close;
                  sql.clear;
                  sql.add('ALTER TABLE IDF_PESSOA ADD CONSTRAINT I0_PESSOA PRIMARY KEY ( ID_PESSOA ) ');
                  execsql;
                  close;
                  sql.clear;
                  sql.add('CREATE INDEX iUSUPESS ON IDF_PESSOA ( ID_USUARIO ) ');
                  execsql;

               end;
          end;




          If not InList('IDF_PRIVILEGIOS',itab) then
           Begin
              with qry_cria_Idf_dados do
                Begin
                 close;
                 sql.clear;
                 If bdx.TIPOBANCO = 1 then
                  Begin
                     sql.add('CREATE TABLE IDF_PRIVILEGIOS( ');
                     sql.add('ID_PRIV INTEGER NOT NULL      ');
                     sql.add('         ,DATATU DATE         ');
                     sql.add('         ,ID_USECASE INTEGER  ');
                     sql.add('         ,IDG_ID INTEGER  ');
                     sql.add('         ,ID_USUARIO INTEGER  ');
                     sql.add('         ,USUARIO VARCHAR(30)  ');
                     sql.add('         ,ACESSO VARCHAR(40)  ');
                     sql.add('         ,PRV_DESCRICAO VARCHAR(50)  ');
                     sql.add('        ,CLI_ID INTEGER      ');
                     sql.add('        ,PRJ_ID INTEGER');
                     sql.add('         ,NIVEIS_ABAIXO VARCHAR(1) )');
                     execsql ;
                  end
                 else
                  Begin
                     sql.add('CREATE TABLE IDF_PRIVILEGIOS( ');
                     sql.add('ID_PRIV LONG NOT NULL      ');
                     sql.add('         ,DATATU DATE         ');
                     sql.add('         ,ID_USECASE LONG  ');
                     sql.add('         ,IDG_ID LONG  ');
                     sql.add('         ,ID_USUARIO LONG  ');
                     sql.add('         ,USUARIO VARCHAR(30)  ');
                     sql.add('         ,ACESSO VARCHAR(40)  ');
                     sql.add('         ,PRV_DESCRICAO VARCHAR(50)  ');
                     sql.add('        ,CLI_ID LONG     ');
                     sql.add('        ,PRJ_ID LONG');
                     sql.add('         ,NIVEIS_ABAIXO VARCHAR(1) )');
                     execsql ;
                  end;
                  close;
                  sql.clear;
                  sql.add('ALTER TABLE IDF_PRIVILEGIOS ADD CONSTRAINT I0_PRIVILEGIOS PRIMARY KEY ( ID_PRIV ); ');
                  execsql;
                  close;
                  sql.clear;
                  sql.add('CREATE INDEX iPRIVCLI ON IDF_PRIVILEGIOS ( CLI_ID,PRJ_ID ) ');
                  execsql;
               end;
          end;



       If not InList('IDF_CUSTOS',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_CUSTOS( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER)');
                 execsql ;
              end
             else
              Begin
                sql.add('CREATE TABLE IDF_CUSTOS( ');
                 sql.add('CLI_ID LONG,PRJ_ID LONG,IDG_ID LONG  ,IDF_CODIGO LONG)');
                 execsql ;
              end;
           end;
      end;


        //tabela de custos  dos últiomos dg
      If not InList('IDF_CUSTODG',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_CUSTODG( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER,');
                 sql.add('IDF_CUSTO_MO FLOAT,IDF_CUSTO_TEC FLOAT,IDF_CUSTO_GERAL FLOAT,IDF_CUSTO_MP FLOAT)');
                 execsql ;
              end
             else
              Begin
                sql.add('CREATE TABLE IDF_CUSTODG( ');
                sql.add('CLI_ID LONG,PRJ_ID LONG,IDG_ID LONG  ,IDF_CODIGO LONG,');
                sql.add('IDF_CUSTO_MO FLOAT,IDF_CUSTO_TEC FLOAT,IDF_CUSTO_GERAL FLOAT,IDF_CUSTO_MP FLOAT)');
                execsql ;
              end;
           end;
      end
      else
       Begin
          adoc.GetFieldNames('IDF_CUSTODG',ifld);

          If not Inlist('IDF_CUSTO_MP',iFld) then
            Begin
               with qry_cria_Idf_dados do
                Begin
                   sql.clear;
                   sql.add('ALTER TABLE IDF_CUSTODG ');
                   sql.add('ADD IDF_CUSTO_MP FLOAT NULL');
                   execsql;
                end;

            end;
       end;

      If not InList('CUSTO_TEMP',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE CUSTO_TEMP( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,SUB_NOME varchar(50),IDF_CODIGO INTEGER,IDF_TIPO_ATIVIDADE VARCHAR(16), ');
                 sql.add(' IDF_DESIGNACAO VARCHAR(50),OBS VARCHAR(100))');
                 execsql ;
              end
             ELSE
              Begin
                sql.add('CREATE TABLE CUSTO_TEMP( ');
                sql.add('CLI_ID LONG,PRJ_ID INTEGER,IDG_ID LONG  ,SUB_NOME varchar(50),IDF_CODIGO INTEGER,IDF_TIPO_ATIVIDADE VARCHAR(16), ');
                sql.add(' IDF_DESIGNACAO VARCHAR(50),OBS VARCHAR(100))');
                execsql ;
              end;


            end;
       end;

      //tabela TI_REQ
      If InList('TI_REQ',itab) then
       Begin
           adoc.GetFieldNames('TI_REQ',ifld);
           If not Inlist('TI_SEQ',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE TI_REQ ');
               sql.add('ADD TI_SEQ INTEGER');
               execsql;
               close;
               sql.clear;
               sql.add('UPDATE TI_REQ ');
               sql.add('SET TI_SEQ = IDF_CODIGO');
               execsql;

               close;
               sql.clear;
               sql.add('ALTER TABLE TI_REQ ');
               sql.add('ADD CONSTRAINT tiprim ');
               sql.add('PRIMARY KEY (CLI_ID,PRJ_ID,TI_CODIGO,TI_SEQ,IDF_CODIGO)');
               execsql;

              end;
           end;
           If not Inlist('TI_ALTERNATE',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE TI_REQ ');
               sql.add('ADD TI_ALTERNATE LONGTEXT');
               execsql;


              end;
           end;


       end;

        //tabela IDF_PS
     If InList('IDF_PS',itab) then
       Begin
           adoc.GetFieldNames('IDF_PS',ifld);
           If not Inlist('PS_MAIL',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_PS ');
               sql.add('ADD PS_MAIL VARCHAR(60),');
               sql.add('PS_CELULAR VARCHAR(30),');
               sql.add('PS_TEL VARCHAR(30)');
               execsql;


              end;
           end;

       end;


      //tabela IDF_DADOS
      If InList('IDF_DADOS',itab) then
       Begin
           adoc.GetFieldNames('IDF_DADOS',ifld);
           If not Inlist('IDF_CAPTION',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_DADOS ');
               sql.add('ADD IDF_CAPTION VARCHAR(40) ,');
               sql.add('IDF_OBRIG VARCHAR(1) ');
               execsql;
              end;
           end;
           If not Inlist('IDF_DECIMAL',iFld) then
            begin
              with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_DADOS ');
               sql.add('ADD IDF_DECIMAL INTEGER');
               execsql;
              end;
            end;
            If not Inlist('IDF_TIPODOMINIO',iFld) then
            begin
              with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_DADOS ');
               sql.add('ADD IDF_TIPODOMINIO VARCHAR(1)');
               execsql;
              end;
            end;
            If not Inlist('IDF_TABREF',iFld) then
            begin
              with qry_cria_Idf_dados do
              Begin
               close;
               sql.clear;
               sql.add('ALTER TABLE IDF_DADOS ');
               sql.add('ADD IDF_TABREF VARCHAR(50)');
               execsql;
              end;
           end;

       end;


       If not InList('IDF_DADOS',itab) then
        Begin
          If bdx.TIPOBANCO = 1 then    //SQL
           Begin
           with qry_cria_Idf_dados do
            Begin
              close;
               sql.clear;
              sql.add('CREATE TABLE IDF_DADOS(   ');
              sql.add('IDF_CODIGO INTEGER   , ');
              sql.add('CLI_ID INTEGER  ,     ');
              sql.add('PRJ_ID INTEGER  ,     ');
              sql.add('IDF_TABELA varchar (60)  ,    ');
              sql.add('IDF_DESIGNACAO varchar (50)   , ');
              sql.add('SUB_NIVEL LONG  ,              ');
              sql.add('IDF_NOME varchar (60)   ,      ');
              sql.add('IDF_DEL varchar (1)  ,        ');
              sql.add('IDF_VISIBLE varchar (1)  ,     ');
              sql.add('IDF_DESCRICAO LONGTEXT  ,      ');
              sql.add('IDF_DATA_TYPE varchar (60)   , ');
              sql.add('IDF_DEFAULT_VALUE varchar (20)   , ');
              sql.add('IDF_DOMINIO text    ,            ');
              sql.add('IDF_NAMING_PREFIX varchar (8)   , ');
              sql.add('IDF_NATUREZA varchar (50)   ,  ');
              sql.add('IDF_NORMALIZE varchar (1)   ,    ');
              sql.add('IDF_TYPE_QUALIFIERS varchar (20)   , ');
              sql.add('IDF_DE_REPET LONG  ,           ');
              sql.add('IDF_PK INTEGER  ,                   ');
              sql.add('IDF_SEQ INTEGER  ,                ');
              sql.add('IDF_CAPTION varchar (40)   ,   ');
              sql.add('IDF_OBRIG varchar (1)  ,       ');
              sql.add('LCK varchar  (1) )            ');
              execsql;
            end;

           end
        else
          Begin
           with qry_cria_Idf_dados do
            Begin
              close;
               sql.clear;
              sql.add('CREATE TABLE IDF_DADOS(   ');
              sql.add('IDF_CODIGO LONG   , ');
              sql.add('CLI_ID LONG  ,     ');
              sql.add('PRJ_ID LONG  ,       ');
              sql.add('IDF_TABELA varchar (60)  ,    ');
              sql.add('IDF_DESIGNACAO varchar (50)   , ');
              sql.add('SUB_NIVEL LONG  ,              ');
              sql.add('IDF_NOME varchar (60)   ,      ');
              sql.add('IDF_DEL varchar (1)  ,        ');
              sql.add('IDF_VISIBLE varchar (1)  ,     ');
              sql.add('IDF_DESCRICAO LONGTEXT  ,      ');
              sql.add('IDF_DATA_TYPE varchar (60)   , ');
              sql.add('IDF_DEFAULT_VALUE varchar (20)   , ');
              sql.add('IDF_DOMINIO text    ,            ');
              sql.add('IDF_NAMING_PREFIX varchar (8)   , ');
              sql.add('IDF_NATUREZA varchar (50)   ,  ');
              sql.add('IDF_NORMALIZE varchar (1)   ,    ');
              sql.add('IDF_TYPE_QUALIFIERS varchar (20)   , ');
              sql.add('IDF_DE_REPET LONG  ,           ');
              sql.add('IDF_PK LONG  ,                   ');
              sql.add('IDF_SEQ LONG  ,                ');
              sql.add('IDF_CAPTION varchar (40)   ,   ');
              sql.add('IDF_OBRIG varchar (1)  ,       ');
              sql.add('LCK varchar  (1) )            ');
              //SQL.SaveToFile('C:\SQL.TXT');
              execsql;
            end;
            with qry_cria_Idf_dados do
                  Begin
                   close;
                   sql.clear;
                   sql.add('CREATE INDEX IDF_DADOSPRIM ON IDF_DADOS(CLI_ID,PRJ_ID,IDF_CODIGO,IDF_TABELA,IDF_SEQ)');
                   execsql;
                  end;
           end;

        end;

        //tabela IDF_APLICATIVO
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
      If not InList('IDF_TX',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_TX( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDF_CODIGO integer  ,IDF_DESIGNACAO varchar(50),');
                 sql.add('IDF_OBJETIVO varchar(50), IDF_BD varchar(30),IDF_FORNECEDOR varchar(50),');
                 sql.add(' IDF_IMPLANTACAO DATETIME,IDF_CUSTO_LIC FLOAT,IDF_CUSTO_MANUT FLOAT,IDF_CUSTO_OUTROS FLOAT,');
                 SQL.ADD('IDF_TIPO_ATIVIDADE VARCHAR(16),IDF_VISIBLE VARCHAR(1),IDF_DEL VARCHAR(1),IDG_ID INTEGER,');
                 sql.add('LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATETIME,IDF_RESPONSAVEL VARCHAR(30))');
                 execsql ;
              end
             ELSE
              Begin
                sql.add('CREATE TABLE IDF_TX( ');
                 sql.add('CLI_ID LONG,PRJ_ID INTEGER,IDF_CODIGO integer  ,IDF_DESIGNACAO varchar(50),');
                 sql.add('IDF_OBJETIVO varchar(50), IDF_BD varchar(30),IDF_FORNECEDOR varchar(50),');
                 sql.add(' IDF_IMPLANTACAO DATE,IDF_CUSTO_LIC FLOAT,IDF_CUSTO_MANUT FLOAT,IDF_CUSTO_OUTROS FLOAT,');
                 SQL.ADD('IDF_TIPO_ATIVIDADE VARCHAR(16),IDF_VISIBLE VARCHAR(1),IDF_DEL VARCHAR(1),IDG_ID INTEGER,');
                 sql.add('LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATE,IDF_RESPONSAVEL VARCHAR(30))');

                 execsql ;
              end;


            end;
       end;
        //tabela IDF_PR : parámetros de entrada do método
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
      If not InList('IDF_PR',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
            // If bdx.TIPOBANCO = 1 then
             SQL.Text := '  CREATE TABLE IDF_PR(CLI_ID INTEGER,PRJ_ID INTEGER '+
                               ' ,IDF_CODIGO INTEGER ,PR_DESCRICAO LONGTEXT '+
                               ' ,PR_NOME VARCHAR(50),PR_TIPO VARCHAR(25)'+
                               ' ,IDF_TIPO_ATIVIDADE VARCHAR(16),IDF_SEQ INTEGER ,IDF_DEL STRING)';
             execsql ;
             //primaru key
             close;
             sql.clear;
             SQL.Text := '  ALTER TABLE IDF_PR ADD CONSTRAINT I0_IDF_PR PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO )';
            execsql ;
            end;
       end;

      If InList('IDF_PR',itab) then
      begin
       adoc.GetFieldNames('IDF_PR',ifld);
       If not Inlist('IDF_METODO',iFld) then
       Begin
         with qry_cria_Idf_dados do
          Begin
           close;
           sql.clear;
           sql.add('ALTER TABLE IDF_PR ');
           sql.add('ADD IDF_METODO INTEGER NULL');
           execsql;
          end;
       end;

    end;

          //tabela IDF_TODO
      adoc.GetTableNames(itab,false);
      qry_cria_Idf_dados.Connection := BDX;
      If not InList('IDF_TODO',itab) then
       Begin
          with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;
             If bdx.TIPOBANCO = 1 then
              Begin
                 sql.add('CREATE TABLE IDF_TODO( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER,');
                 sql.add(' TODO_DATA DATETIME,IDF_DESCRICAO VARCHAR(255),TODO_STATUS VARCHAR(20))');
                 execsql ;
              end
             ELSE
              Begin
                 sql.add('CREATE TABLE IDF_TODO( ');
                 sql.add('CLI_ID INTEGER,PRJ_ID INTEGER,IDG_ID integer  ,IDF_CODIGO INTEGER,');
                 sql.add(' TODO_DATA DATE,IDF_DESCRICAO VARCHAR(255),TODO_STATUS VARCHAR(20))');
                 execsql ;
              end;
             with qry_cria_Idf_dados do
                  Begin
                   close;
                   sql.clear;
                   sql.add('CREATE INDEX IDF_TODOPRIM ON IDF_TODO(CLI_ID,PRJ_ID,IDF_CODIGO)');
                   execsql;
                  end;

            end;
       end;


            //tabela LIMPA
       adoc.GetFieldNames('IDF_LIMPA',ifld);
        begin
         with qry_cria_Idf_dados do
            Begin
               close;
               sql.clear;
               sql.add('DROP TABLE IDF_LIMPA');
               execsql;
               close;
               sql.clear;
               sql.add('CREATE TABLE IDF_LIMPA(CODIGO INTEGER,TIPO VARCHAR(2),DESIGNACAO VARCHAR(255))');
               execsql;
            end;
        end;



        //tabela PROJETOS
       adoc.GetFieldNames('PRJ_PROJETO',ifld);
        begin
          with qry_cria_Idf_dados do
            BEGIN
              If not Inlist('PRJ_CAMINHO',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE PRJ_PROJETO');
                 sql.add('ADD PRJ_CAMINHO VARCHAR(60)');
                 execsql;

                end;
              If not Inlist('IDF_DIRETORIO',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE PRJ_PROJETO');
                 sql.add('ADD IDF_DIRETORIO VARCHAR(250)');
                 execsql;

                end;
            end;
       end;

         //tabela TODO
       adoc.GetFieldNames('IDF_TODO',ifld);
        begin
          with qry_cria_Idf_dados do
            BEGIN
              If not Inlist('TODO_REP',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_TODO');
                 sql.add('ADD TODO_REP VARCHAR(30)');
                 execsql;

                end;
              If not Inlist('TODO_CAT',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_TODO');
                 sql.add('ADD TODO_CAT VARCHAR(30)');
                 execsql;

                end;

            end;
       end;


        //tabela PROVIDER_DATA
       adoc.GetFieldNames('PROVIDER_DATA',ifld);
        begin
          with qry_cria_Idf_dados do
            BEGIN
              If not Inlist('TIPO',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE PROVIDER_DATA');
                 sql.add('ADD TIPO VARCHAR(1)');
                 execsql;

                end;

            end;
       end;

         //tabela Domínios (diversos)
       adoc.GetFieldNames('CMB_DIVERSOS',ifld);
        begin
          with qry_cria_Idf_dados do
            BEGIN
              If not Inlist('DI_LING',iFld) then
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE CMB_DIVERSOS');
                 sql.add('ADD DI_LING VARCHAR(2)');
                 execsql;
                 close;
                 sql.clear;
                 sql.add('UPDATE CMB_DIVERSOS');
                 sql.add('SET DI_LING = '+''''+'PT'+'''');
                 execsql;
                end;

            end;
       end;

       //tabela COR_OBJETOS
       adoc.GetFieldNames('COR_OBJETOS',ifld);

         with qry_cria_Idf_dados do
          begin
           If not Inlist('PERC_CUSTO',iFld) then
            Begin

               sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD PERC_CUSTO INTEGER NULL');
               execsql;
            end;
           If not Inlist('PERC_CODIGO',iFld) then
            Begin
                sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD PERC_CODIGO INTEGER NULL');
               execsql;
            end;
           If not Inlist('ATOR_CATEGORIA',iFld) then
            Begin
                sql.clear;
               sql.add('ALTER TABLE COR_OBJETOS ');
               sql.add('ADD ATOR_CATEGORIA VARCHAR(25) NULL');
               execsql;
            end;

         //tabela informações
         adoc.GetFieldNames('IDF_IF',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_IF ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

        //tabela objetos de interface
         adoc.GetFieldNames('IDF_OI',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_OI ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         If not Inlist('IDF_TELADIR',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_OI ');
             sql.add('ADD IDF_TELADIR VARCHAR(250) NULL');
             execsql;
           end;
        //tabela métodos dos objetos de interface
         adoc.GetFieldNames('IDF_EV',ifld);

         If not Inlist('IDF_TELADIR',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_EV ');
             sql.add('ADD IDF_TELADIR VARCHAR(250) NULL');
             execsql;
           end;

        //tabela pessoas
         adoc.GetFieldNames('IDF_PS',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_PS ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
        //tabela LOCAIS
         adoc.GetFieldNames('IDF_LF',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_LF ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
        //tabela eventos de negócio
         adoc.GetFieldNames('IDF_EN',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_EN ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
       //tabela fluxos de dados
         adoc.GetFieldNames('IDF_DG',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_DG ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         If not Inlist('IDF_VOLUME_PROC1',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_DG ');
             sql.add('ADD IDF_VOLUME_PROC1 FLOAT NULL');
             execsql;
           end;

         If not Inlist('IDF_VOLUME_PROC2',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_DG ');
             sql.add('ADD IDF_VOLUME_PROC2 FLOAT NULL');
             execsql;
           end;

         //tabela regras de negócio
         adoc.GetFieldNames('IDF_RN',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_RN ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         //tabela rsistemas
         adoc.GetFieldNames('IDF_SE',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_SE ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

         //tabela aplicativos
         adoc.GetFieldNames('IDF_TX',ifld);

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_TX ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
         //tabela ASPECTOS CRITICOS
         adoc.GetFieldNames('IDF_AC',ifld);
         If not Inlist('DIMENSAO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AC ');
             sql.add('ADD DIMENSAO VARCHAR(25) NULL');
             execsql;
           end;
         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AC ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

           with qry_cria_Idf_dados do
              Begin

                    Begin
                      close;
                      sql.clear;
                      sql.add('UPDATE IDF_AC  ');
                      sql.add('SET IDF_TIPO__ASPECTO = '+''''+'AC'+'''');
                      sql.add('WHERE IDF_TIPO__ASPECTO =  '+''''+'Aspecto Crítico'+'''');
                      execsql;
                      close;
                      sql.clear;
                      sql.add('UPDATE IDF_AC  ');
                      sql.add('SET IDF_TIPO__ASPECTO = '+''''+'AM'+'''');
                      sql.add('WHERE IDF_TIPO__ASPECTO =  '+''''+'Alvo de Melhoria'+'''');
                      execsql;


                    end;
              end;


         //tabela ator
         adoc.GetFieldNames('IDF_CA',ifld);
         If not Inlist('IDF_JORNADA_ANUAL',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_CA ');
             sql.add('ADD IDF_JORNADA_ANUAL FLOAT NULL');
             execsql;
           end;
        If not Inlist('IDF_CUSTO_ANUAL',iFld) then
         Begin
           sql.clear;
           sql.add('ALTER TABLE IDF_CA ');
           sql.add('ADD IDF_CUSTO_ANUAL FLOAT NULL');
           execsql;
         end;

         If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_CA ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;

           //tabela IDF_SE
         adoc.GetFieldNames('IDF_SE',ifld);
         If not Inlist('IDF_CUSTO_TEC',iFld) then
           Begin

             sql.clear;
             sql.add('ALTER TABLE IDF_SE ');
             sql.add('ADD IDF_CUSTO_TEC FLOAT NULL');
             execsql;
           end;


              //tabela IDF_AP
         adoc.GetFieldNames('IDF_AP',ifld);
         If not Inlist('IDF_TELADIR',iFld) then   //diretorio da tela
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_TELADIR VARCHAR(250)');
             execsql;
           end;
         If not Inlist('IDF_CUSTO_TEC',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_TEC FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_ANUAL',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_ANUAL FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_GERAL',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_GERAL FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_CUSTO_MP',iFld) then
           Begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_CUSTO_MP FLOAT NULL');
             execsql;
           end;
          If not Inlist('IDF_DIRETORIO',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_DIRETORIO VARCHAR(250) NULL');
             execsql;
           end;
          If not Inlist('IDF_DURATION_TPU1',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_DURATION_TPU1 INTEGER NULL');
             execsql;
           end;
          If not Inlist('IDF_DURATION_TPU2',iFld) then
           Begin
                 //ATOR
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('ADD IDF_DURATION_TPU2 INTEGER NULL');
             execsql;
           end;
         end;

        //tabela IDF_SE

         adoc.GetFieldNames('IDF_SE',ifld);


         If not Inlist('IDF_COD_APLIC',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_SE ');
               sql.add('ADD IDF_COD_APLIC INTEGER NULL');
               execsql;
              end;

           end;

        //tabela IDF_LF

         adoc.GetFieldNames('IDF_LF',ifld);


         If not Inlist('IDF_CUSTOAMBIENTE',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_LF ');
               sql.add('ADD IDF_CUSTOAMBIENTE FLOAT NULL');
               execsql;
              end;

           end;

        //tabela IDF_CS      classes UML

          If not InList('IDF_CS',itab) then
           Begin
           with qry_cria_Idf_dados do
            Begin
             close;
             sql.clear;

             If bdx.TIPOBANCO = 1 then       //sql
              Begin
                 sql.add('CREATE TABLE IDF_CS(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL');
                 sql.add(',IDF_CODIGO INTEGER NOT NULL ,IDF_DESIGNACAO VARCHAR(30)');
                 sql.add(',IDF_OBJETIVO varchar(50),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                 sql.add(',IDG_ID INTEGER,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1)');
                 sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATETIME,');
                 sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),');
                 sql.add('IDF_CSSTYLE VARCHAR(20),IDF_ANCESTOR VARCHAR(30))');

                 execsql ;

                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_CS ADD CONSTRAINT IDF_CLASSEPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO )');
                 execsql ;
              end
            else
              begin
                 sql.add('CREATE TABLE IDF_CS(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL');
                 sql.add(',IDF_CODIGO INTEGER NOT NULL ,IDF_DESIGNACAO VARCHAR(30)');
                 sql.add(',IDF_OBJETIVO varchar(50),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                 sql.add(',IDG_ID INTEGER,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1)');
                 sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATE,');
                 sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),');
                 sql.add('IDF_CSSTYLE VARCHAR(20),IDF_ANCESTOR VARCHAR(30))');

                 execsql ;

                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_CS ADD CONSTRAINT IDF_CLASSEPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO )');
                 execsql ;
            end;
            end;
           end;

         adoc.GetFieldNames('IDF_CS',ifld);
         If not Inlist('IDF_DIRPROJ',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_DIRPROJ VARCHAR(255) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_TABELA',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_TABELA VARCHAR(50) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_FORM',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_FORM VARCHAR(50) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_UNIT',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_UNIT VARCHAR(255) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_UNIT_OO',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_UNIT_OO VARCHAR(255) NULL');
               execsql;
              end;

           end;

         If not Inlist('IDF_TABELADT',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_TABELADT VARCHAR(50) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_FORMDT',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_FORMDT VARCHAR(50) NULL');
               execsql;
              end;

           end;

           If not Inlist('IDF_UNITDT',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_UNITDT VARCHAR(255) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_UNIT_OODT',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_UNIT_OODT VARCHAR(255) NULL');
               execsql;
              end;

           end;
         If not Inlist('IDF_CSSTYLE',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_CSSTYLE VARCHAR(20) NULL');
               execsql;
              end;

           end;
           If not Inlist('IDF_ANCESTOR',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_ANCESTOR VARCHAR(30) NULL');
               execsql;
              end;

           end;
           If not Inlist('IDF_CODIGONOVO',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDF_CODIGONOVO INTEGER NULL');
               execsql;
              end;

           end;
            If not Inlist('IDG_ID_NOVO',iFld) then
           Begin
             with qry_cria_Idf_dados do
              Begin
                sql.clear;
               sql.add('ALTER TABLE IDF_CS ');
               sql.add('ADD IDG_ID_NOVO INTEGER NULL');
               execsql;
              end;

           end;

           //tabela IDF_PY      PROIPERTY CLASS UML

           If not InList('IDF_PY',itab) then
           begin
            with qry_cria_Idf_dados do
             begin
                 close;
                 sql.clear;

                 If bdx.TIPOBANCO = 1 then       //sql
                 begin
                   SQL.ADD('CREATE TABLE IDF_PY(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(',CLASS_ID INTEGER NOT NULL,PROP_TIPO VARCHAR(25),PROP_DEFAULT VARCHAR(30) null,PROP_VISIBIL VARCHAR(20) not null');
                   SQL.ADD(',PROP_DOMINIO VARCHAR (150) null,IDF_DEL VARCHAR(1) null,IDF_VISIBLE VARCHAR(20) null,IDF_SEQ INTEGER NOT NULL');
                   SQL.ADD(',IDF_DESIGNACAO VARCHAR(30) not null,IDG_ID INTEGER,IDF_OBJETIVO varchar(50) null,IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   sql.add(',LCK VARCHAR(1) null,IDF_VERSAO VARCHAR(6) null,IDF_VERSAO_DATA DATETIME,IDF_RESPONSAVEL VARCHAR(30) null,');
                   sqL.add('IDF_DIRETORIO VARCHAR(250) null,IDF_CAT VARCHAR(20))');

                   execsql ;

                   close;
                   sql.clear;

                   SQL.ADD('ALTER TABLE IDF_PY ADD CONSTRAINT IDF_PROPERTYPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,IDF_SEQ)');
                   execsql ;
                 end
                 else
                 begin
                   SQL.ADD('CREATE TABLE IDF_PY(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(',CLASS_ID INTEGER NOT NULL,PROP_TIPO VARCHAR(25),PROP_DEFAULT VARCHAR(30) null,PROP_VISIBIL VARCHAR(20) not null');
                   SQL.ADD(',PROP_DOMINIO VARCHAR (150) null,IDF_DEL VARCHAR(1) null,IDF_VISIBLE VARCHAR(20) null,IDF_SEQ INTEGER NOT NULL');
                   SQL.ADD(',IDF_DESIGNACAO VARCHAR(30) not null,IDG_ID INTEGER,IDF_OBJETIVO varchar(50) null,IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   sql.add(',LCK VARCHAR(1) null,IDF_VERSAO VARCHAR(6) null,IDF_VERSAO_DATA DATE,IDF_RESPONSAVEL VARCHAR(30) null,');
                   sqL.add('IDF_DIRETORIO VARCHAR(250) null,IDF_CAT VARCHAR(20))');

                   execsql ;

                   close;
                   sql.clear;

                   SQL.ADD('ALTER TABLE IDF_PY ADD CONSTRAINT IDF_PROPERTYPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,IDF_SEQ)');
                   execsql ;
                 end
             end;
            end;
           end;

         adoc.GetFieldNames('IDF_PY',ifld);
         If not Inlist('IDF_LISTA',iFld) then
            
             Begin
               with qry_cria_Idf_dados do
                Begin
                 close;
                 sql.clear;
                 sql.add('ALTER TABLE IDF_PY ');
                 sql.add('ADD IDF_LISTA INTEGER NULL');
                 execsql;
                end;
             end;

           //tabela IDF_MT      METODOSCLASS UML
            If not InList('IDF_MT',itab) then
             begin
              with qry_cria_Idf_dados do
               BEGIN
                 close;
                 sql.clear;

                 If bdx.TIPOBANCO = 1 then       //sql
                 begin
                   SQL.ADD('CREATE TABLE IDF_MT(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(' ,CLASS_ID INTEGER NOT NULL,MET_NOME VARCHAR(30),MET_VISIBIL VARCHAR(20),MET_COMENT VARCHAR(200)');
                   SQL.ADD(' ,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1),IDF_DESIGNACAO VARCHAR(30),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   SQL.ADD(' ,IDF_OBJETIVO varchar(50),IDG_ID INTEGER,IDF_SEQ integer NOT NULL');
                   sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATETIME,')  ;
                   sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),IDF_CAT VARCHAR(20),');
                   sql.add('IDF_METTYPE VARCHAR(20),IDF_METBIND VARCHAR(20),IDF_METDIRECT VARCHAR(20),IDF_TIPO VARCHAR (25))');

                   execsql ;

                   close;
                   sql.clear;

                   sql.add('ALTER TABLE IDF_MT ADD CONSTRAINT IDF_METODOSPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,IDF_SEQ )');
                   execsql;
                 end
                 else
                 begin
                   SQL.ADD('CREATE TABLE IDF_MT(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(' ,CLASS_ID INTEGER,MET_NOME VARCHAR(30),MET_VISIBIL VARCHAR(20),MET_COMENT VARCHAR(200)');
                   SQL.ADD(' ,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1),IDF_DESIGNACAO VARCHAR(30),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   SQL.ADD(' ,IDF_OBJETIVO varchar(50),IDG_ID INTEGER,IDF_SEQ integer');
                   sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATE,')  ;
                   sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),IDF_CAT VARCHAR(20),');
                   sql.add('IDF_METTYPE VARCHAR(20),IDF_METBIND VARCHAR(20),IDF_METDIRECT VARCHAR(20),IDF_TIPO VARCHAR (25))');

                   execsql ;

                   close;
                   sql.clear;

                   sql.add('ALTER TABLE IDF_MT ADD CONSTRAINT IDF_METODOSPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,IDF_SEQ )');
                   execsql;
                 end;

              end;
             END ;


             If not InList('IDF_ET',itab) then  //EVENTOS
             begin
              with qry_cria_Idf_dados do
               BEGIN
                 close;
                 sql.clear;
         
                 If bdx.TIPOBANCO = 1 then       //sql
                 begin
                   SQL.ADD('CREATE TABLE IDF_ET(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(' ,CLASS_ID INTEGER NOT NULL,EVE_NOME VARCHAR(60),EVE_TYPE VARCHAR(40),EVE_COMENT VARCHAR(200)');
                   SQL.ADD(' ,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1),IDF_DESIGNACAO VARCHAR(30),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   SQL.ADD(' ,IDF_OBJETIVO varchar(50),IDG_ID INTEGER,IDF_SEQ integer NOT NULL,EVE_VISIBIL VARCHAR(20) ');
                   sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATETIME,') ;
                   sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),IDF_CAT VARCHAR(20))');

                   execsql ;
                 end
                 else
                 begin
                   SQL.ADD('CREATE TABLE IDF_ET(CLI_ID INTEGER NOT NULL,PRJ_ID INTEGER NOT NULL,IDF_CODIGO INTEGER NOT NULL');
                   SQL.ADD(' ,CLASS_ID INTEGER,EVE_NOME VARCHAR(60),EVE_TYPE VARCHAR(40),EVE_COMENT VARCHAR(200)');
                   SQL.ADD(' ,IDF_DEL VARCHAR(1),IDF_VISIBLE VARCHAR(1),IDF_DESIGNACAO VARCHAR(30),IDF_TIPO_ATIVIDADE VARCHAR(16)');
                   SQL.ADD(' ,IDF_OBJETIVO varchar(50),IDG_ID INTEGER,IDF_SEQ integer,EVE_VISIBIL VARCHAR(20) ');
                   sql.add(',LCK VARCHAR(1),IDF_VERSAO VARCHAR(6),IDF_VERSAO_DATA DATE,') ;
                   sql.add('IDF_RESPONSAVEL VARCHAR(30),IDF_DIRETORIO VARCHAR(250),IDF_CAT VARCHAR(20))');

                   execsql ;
                 end;
                 close;
                 sql.clear;

                 sql.add('ALTER TABLE IDF_ET ADD CONSTRAINT IDF_EVENTOSPrim PRIMARY KEY ( CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID,IDF_SEQ )');
                 execsql;
              end;
            END;

end;
    
procedure Atu_chema1;
var
iTab,iFld : TstringList;
i : integer;
begin
  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;

  adoc.LoginPrompt := false;
  qry_cria_Idf_dados.Connection := BDX;

 If InList('PROVIDER_DATA',itab) then
  Begin
     adoc.GetFieldNames('PROVIDER_DATA',ifld);
     If not Inlist('TIPO',iFld) then
       Begin
         with qry_cria_Idf_dados do
          Begin
           close;
           Connection := BDX;
           sql.clear;
           sql.add('ALTER TABLE PROVIDER_DATA ');
           sql.add('ADD TIPO VARCHAR(1)');
           execsql;
          end;
       end   ;
  end;



 adoc.GetTableNames(itab,false);


 If not InList('PROVIDER_DATA',itab) then
  Begin
    with qry_cria_Idf_dados do
    Begin
     close;
     sql.clear;
     sql.add('CREATE TABLE PROVIDER_DATA (PROVIDER VARCHAR(50),TYPE_NAME VARCHAR(60) ,');
     sql.add('DATA_TYPE INTEGER ,COLUMN_SIZE INTEGER ,TIPO VARCHAR(1),LCK VARCHAR(50))');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
    // Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'C'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;



    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'I'+''''+',') ;
     sql.add(''''+'I'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'N'+''''+',') ;
     sql.add(''''+'N'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'M'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'D'+''''+',') ;
     sql.add(''''+'D'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
 //   Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'T'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;
 end;


   adoc.GetFieldNames('IDF_AP',ifld);

   If bdx.TIPOBANCO <> 1 then
    begin
      with qry_cria_Idf_dados do
        Begin
         close;

          If Inlist('IDF_ID_FISICO',iFld) then
          begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('DROP IDF_ID_FISICO,');
             sql.add(' IDF_ACAO_CORRETIVA,');
             sql.add(' IDF_ACTOR_ROLE,');
             sql.add(' IDF_ALVOS_MELHORIA,');
             sql.add(' IDF_BUSSINESS_OWNER,');
             sql.add(' IDF_CARACTER_RELEVANTES,');
             sql.add(' IDF_CARGO,');
             sql.add(' IDF_CONSTRAINT_NAME,');
             sql.add(' IDF_DATA_TYPE,');
             sql.add(' IDF_DEFAULT_VALUE,');
             sql.add(' IDF_DIAGRAM_STATUS,');
             sql.add(' IDF_DOMINIO,');
             sql.add(' IDF_EFETIVO_DA_CLASSE,');
             sql.add(' IDF_EQUIPE_PROJETO,');
             sql.add(' IDF_ESTADO,');
             sql.add(' IDF_EXPECTATIVAS_GANHO,');
             sql.add(' IDF_FATORES_RESTRITIVOS,');
             sql.add(' IDF_IDENTIFYING,');
             sql.add(' IDF_JORNADA_PADRAO,');
             sql.add(' IDF_LOCALIZACAO_FISICA,');
             sql.add(' IDF_MINIESPECIFICACAO,');
             sql.add(' IDF_NAMING_PREFIX,');
             sql.add(' IDF_NORMALIZE,');
             sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
             sql.add(' IDF_PONTO_DE_VISTA,');
             sql.add(' IDF_PRE_REQUISITOS,');
             sql.add(' IDF_PROJECT,');
             sql.add(' IDF_QUANTIDADE_TURNOS,');
             sql.add(' IDF_REVERSE_PHRASE,');
             sql.add(' IDF_ROLE,');
             sql.add(' IDF_ROLE_PREFIX,');
             sql.add(' IDF_TYPE_QUALIFIERS,');
             sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
             sql.add(' IDF_REGRA_EXCECAO,');
             sql.add(' IDF_DATABASE,');
             sql.add(' IDF_DBDIR,');
             sql.add(' IDF_DBTYPE,');
             sql.add(' IDF_SYSTEMTABLE,');
             sql.add(' IDF_TIPO__ASPECTO,');
             sql.add(' IDF_ASPECTOS_CRITICOS,');
             sql.add(' IDF_COND_TRABALHO,');
             sql.add(' IDF_FORMACAO,');
             sql.add(' IDF_CONHECIMENTO,');
             sql.add(' IDF_EXPERIENCA,');
             sql.add(' IDF_COMPETENCIA,');
             sql.add(' ARI_ID,');
             sql.add(' IDF_ADERENCIA,');
             sql.add(' IDF_ATIVIDADE_CONTEXTO,');
             sql.add(' IDF_CARGA_HORA_DEMANDADA,');
             sql.add(' IDF_CLASSEOBJETO,');
             sql.add(' IDF_CLASSIFICACAO_PP,');
             sql.add(' IDF_COMPLEXIDADE,');
             sql.add(' IDF_CUSTO_ANUAL,');
             sql.add(' IDF_DEFINICAO_CONTEXTO,');
             sql.add(' IDF_DISTRIBUICAO,');
             sql.add(' IDF_EFEITO,');
             sql.add(' IDF_ESPECIALIZACAO,');
             sql.add(' IDF_FORMALIZACAO,');
             sql.add(' IDF_FUNCAO_NIVEL,');
             sql.add(' IDF_LOGICA,');
             sql.add(' IDF_MEDIA,');
             sql.add(' IDF_NOME,');
             sql.add(' IDF_OBJETIVO_PROCESSO,');
             sql.add(' IDF_PERIODICIDADE,');
             sql.add(' IDF_PREMISSAS,');
             sql.add(' IDF_PRIORIDADE,');
             sql.add(' IDF_QTDE_NECES_PROCES,');
             sql.add(' IDF_SIGLA,');
             sql.add(' IDF_SITUACAO,');
             sql.add(' IDF_TEMPO_CONTRATACAO,');
             sql.add(' IDF_TIMING');
             execsql;
           end;
        end;
    end
   else
    begin
     If Inlist('IDF_ID_FISICO',iFld) then
      begin
        with qry_cria_Idf_dados do
        Begin
         close;

        // Connection := BDX;
         sql.clear;
         sql.add('ALTER TABLE IDF_AP ');
         sql.add('DROP COLUMN IDF_ID_FISICO,');
         sql.add(' IDF_ACAO_CORRETIVA,');
         sql.add(' IDF_ACTOR_ROLE,');
         sql.add(' IDF_ALVOS_MELHORIA,');
         sql.add(' IDF_BUSSINESS_OWNER,');
         sql.add(' IDF_CARACTER_RELEVANTES,');
         sql.add(' IDF_CARGO,');
         sql.add(' IDF_CONSTRAINT_NAME,');
         sql.add(' IDF_DATA_TYPE,');
         sql.add(' IDF_DEFAULT_VALUE,');
         sql.add(' IDF_DIAGRAM_STATUS,');
         sql.add(' IDF_DOMINIO,');
         sql.add(' IDF_EFETIVO_DA_CLASSE,');
         sql.add(' IDF_EQUIPE_PROJETO,');
         sql.add(' IDF_ESTADO,');
         sql.add(' IDF_EXPECTATIVAS_GANHO,');
         sql.add(' IDF_FATORES_RESTRITIVOS,');
         sql.add(' IDF_IDENTIFYING,');
         sql.add(' IDF_JORNADA_PADRAO,');
         sql.add(' IDF_LOCALIZACAO_FISICA,');
         sql.add(' IDF_MINIESPECIFICACAO,');
         sql.add(' IDF_NAMING_PREFIX,');
         sql.add(' IDF_NORMALIZE,');
         sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
         sql.add(' IDF_PONTO_DE_VISTA,');
         sql.add(' IDF_PRE_REQUISITOS,');
         sql.add(' IDF_PROJECT,');
         sql.add(' IDF_QUANTIDADE_TURNOS,');
         sql.add(' IDF_REVERSE_PHRASE,');
         sql.add(' IDF_ROLE,');
         sql.add(' IDF_ROLE_PREFIX,');
         sql.add(' IDF_TYPE_QUALIFIERS,');
         sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
         sql.add(' IDF_REGRA_EXCECAO,');
         sql.add(' IDF_DATABASE,');
         sql.add(' IDF_DBDIR,');
         sql.add(' IDF_DBTYPE,');
         sql.add(' IDF_SYSTEMTABLE,');
         sql.add(' IDF_TIPO__ASPECTO,');
         sql.add(' IDF_ASPECTOS_CRITICOS,');
         sql.add(' IDF_COND_TRABALHO,');
         sql.add(' IDF_FORMACAO,');
         sql.add(' IDF_CONHECIMENTO,');
         sql.add(' IDF_EXPERIENCA,');
         sql.add(' IDF_COMPETENCIA,');
         sql.add(' ARI_ID,');
         sql.add(' IDF_ADERENCIA,');
         sql.add(' IDF_ATIVIDADE_CONTEXTO,');
         sql.add(' IDF_CARGA_HORA_DEMANDADA,');
         sql.add(' IDF_CLASSEOBJETO,');
         sql.add(' IDF_CLASSIFICACAO_PP,');
         sql.add(' IDF_COMPLEXIDADE,');
         sql.add(' IDF_CUSTO_ANUAL,');
         sql.add(' IDF_DEFINICAO_CONTEXTO,');
         sql.add(' IDF_DISTRIBUICAO,');
         sql.add(' IDF_EFEITO,');
         sql.add(' IDF_ESPECIALIZACAO,');
         sql.add(' IDF_FORMALIZACAO,');
         sql.add(' IDF_FUNCAO_NIVEL,');
         sql.add(' IDF_LOGICA,');
         sql.add(' IDF_MEDIA,');
         sql.add(' IDF_NOME,');
         sql.add(' IDF_OBJETIVO_PROCESSO,');
         sql.add(' IDF_PERIODICIDADE,');
         sql.add(' IDF_PREMISSAS,');
         sql.add(' IDF_PRIORIDADE,');
         sql.add(' IDF_QTDE_NECES_PROCES,');
         sql.add(' IDF_SIGLA,');
         sql.add(' IDF_SITUACAO,');
         sql.add(' IDF_TEMPO_CONTRATACAO,');
         sql.add(' IDF_TIMING');
         execsql;
       end ;
      end;
     end;


end;

procedure Atu_schema1;
var
iTab,iFld : TstringList;
i : integer;
begin
  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.ConnectionString := bdx.ConnectionString ;

  adoc.LoginPrompt := false;
  qry_cria_Idf_dados.Connection := BDX;

 If InList('PROVIDER_DATA',itab) then
  Begin
     adoc.GetFieldNames('PROVIDER_DATA',ifld);
     If not Inlist('TIPO',iFld) then
       Begin
         with qry_cria_Idf_dados do
          Begin
           close;
           Connection := BDX;
           sql.clear;
           sql.add('ALTER TABLE PROVIDER_DATA ');
           sql.add('ADD TIPO VARCHAR(1)');
           execsql;
          end;
       end   ;
  end;



 adoc.GetTableNames(itab,false);


 If not InList('PROVIDER_DATA',itab) then
  Begin
    with qry_cria_Idf_dados do
    Begin
     close;
     sql.clear;
     sql.add('CREATE TABLE PROVIDER_DATA (PROVIDER VARCHAR(50),TYPE_NAME VARCHAR(60) ,');
     sql.add('DATA_TYPE INTEGER ,COLUMN_SIZE INTEGER ,TIPO VARCHAR(1),LCK VARCHAR(50))');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
    // Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'C'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;



    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'I'+''''+',') ;
     sql.add(''''+'I'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'N'+''''+',') ;
     sql.add(''''+'N'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
     //Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'M'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
   //  Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'D'+''''+',') ;
     sql.add(''''+'D'+'''') ;

     sql.add(')');
     execsql;

    end;

    with qry_cria_Idf_dados do
    Begin
     close;
 //   Connection := BDX;
     sql.clear;
     sql.add('INSERT INTO PROVIDER_DATA (PROVIDER,TYPE_NAME,TIPO)');
     sql.add('VALUES(');
     sql.add(''''+'STD'+''''+',') ;
     sql.add(''''+'T'+''''+',') ;
     sql.add(''''+'C'+'''') ;

     sql.add(')');
     execsql;

    end;
 end;


   adoc.GetFieldNames('IDF_AP',ifld);

   If bdx.TIPOBANCO <> 1 then
    begin
      with qry_cria_Idf_dados do
        Begin
         close;

          If Inlist('IDF_ID_FISICO',iFld) then
          begin
             sql.clear;
             sql.add('ALTER TABLE IDF_AP ');
             sql.add('DROP IDF_ID_FISICO,');
             sql.add(' IDF_ACAO_CORRETIVA,');
             sql.add(' IDF_ACTOR_ROLE,');
             sql.add(' IDF_ALVOS_MELHORIA,');
             sql.add(' IDF_BUSSINESS_OWNER,');
             sql.add(' IDF_CARACTER_RELEVANTES,');
             sql.add(' IDF_CARGO,');
             sql.add(' IDF_CONSTRAINT_NAME,');
             sql.add(' IDF_DATA_TYPE,');
             sql.add(' IDF_DEFAULT_VALUE,');
             sql.add(' IDF_DIAGRAM_STATUS,');
             sql.add(' IDF_DOMINIO,');
             sql.add(' IDF_EFETIVO_DA_CLASSE,');
             sql.add(' IDF_EQUIPE_PROJETO,');
             sql.add(' IDF_ESTADO,');
             sql.add(' IDF_EXPECTATIVAS_GANHO,');
             sql.add(' IDF_FATORES_RESTRITIVOS,');
             sql.add(' IDF_IDENTIFYING,');
             sql.add(' IDF_JORNADA_PADRAO,');
             sql.add(' IDF_LOCALIZACAO_FISICA,');
             sql.add(' IDF_MINIESPECIFICACAO,');
             sql.add(' IDF_NAMING_PREFIX,');
             sql.add(' IDF_NORMALIZE,');
             sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
             sql.add(' IDF_PONTO_DE_VISTA,');
             sql.add(' IDF_PRE_REQUISITOS,');
             sql.add(' IDF_PROJECT,');
             sql.add(' IDF_QUANTIDADE_TURNOS,');
             sql.add(' IDF_REVERSE_PHRASE,');
             sql.add(' IDF_ROLE,');
             sql.add(' IDF_ROLE_PREFIX,');
             sql.add(' IDF_TYPE_QUALIFIERS,');
             sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
             sql.add(' IDF_REGRA_EXCECAO,');
             sql.add(' IDF_DATABASE,');
             sql.add(' IDF_DBDIR,');
             sql.add(' IDF_DBTYPE,');
             sql.add(' IDF_SYSTEMTABLE,');
             sql.add(' IDF_TIPO__ASPECTO,');
             sql.add(' IDF_ASPECTOS_CRITICOS,');
             sql.add(' IDF_COND_TRABALHO,');
             sql.add(' IDF_FORMACAO,');
             sql.add(' IDF_CONHECIMENTO,');
             sql.add(' IDF_EXPERIENCA,');
             sql.add(' IDF_COMPETENCIA,');
             sql.add(' ARI_ID,');
             sql.add(' IDF_ADERENCIA,');
             sql.add(' IDF_ATIVIDADE_CONTEXTO,');
             sql.add(' IDF_CARGA_HORA_DEMANDADA,');
             sql.add(' IDF_CLASSEOBJETO,');
             sql.add(' IDF_CLASSIFICACAO_PP,');
             sql.add(' IDF_COMPLEXIDADE,');
             sql.add(' IDF_CUSTO_ANUAL,');
             sql.add(' IDF_DEFINICAO_CONTEXTO,');
             sql.add(' IDF_DISTRIBUICAO,');
             sql.add(' IDF_EFEITO,');
             sql.add(' IDF_ESPECIALIZACAO,');
             sql.add(' IDF_FORMALIZACAO,');
             sql.add(' IDF_FUNCAO_NIVEL,');
             sql.add(' IDF_LOGICA,');
             sql.add(' IDF_MEDIA,');
             sql.add(' IDF_NOME,');
             sql.add(' IDF_OBJETIVO_PROCESSO,');
             sql.add(' IDF_PERIODICIDADE,');
             sql.add(' IDF_PREMISSAS,');
             sql.add(' IDF_PRIORIDADE,');
             sql.add(' IDF_QTDE_NECES_PROCES,');
             sql.add(' IDF_SIGLA,');
             sql.add(' IDF_SITUACAO,');
             sql.add(' IDF_TEMPO_CONTRATACAO,');
             sql.add(' IDF_TIMING');
             execsql;
           end;
        end;
    end
   else
    begin
     If Inlist('IDF_ID_FISICO',iFld) then
      begin
        with qry_cria_Idf_dados do
        Begin
         close;

        // Connection := BDX;
         sql.clear;
         sql.add('ALTER TABLE IDF_AP ');
         sql.add('DROP COLUMN IDF_ID_FISICO,');
         sql.add(' IDF_ACAO_CORRETIVA,');
         sql.add(' IDF_ACTOR_ROLE,');
         sql.add(' IDF_ALVOS_MELHORIA,');
         sql.add(' IDF_BUSSINESS_OWNER,');
         sql.add(' IDF_CARACTER_RELEVANTES,');
         sql.add(' IDF_CARGO,');
         sql.add(' IDF_CONSTRAINT_NAME,');
         sql.add(' IDF_DATA_TYPE,');
         sql.add(' IDF_DEFAULT_VALUE,');
         sql.add(' IDF_DIAGRAM_STATUS,');
         sql.add(' IDF_DOMINIO,');
         sql.add(' IDF_EFETIVO_DA_CLASSE,');
         sql.add(' IDF_EQUIPE_PROJETO,');
         sql.add(' IDF_ESTADO,');
         sql.add(' IDF_EXPECTATIVAS_GANHO,');
         sql.add(' IDF_FATORES_RESTRITIVOS,');
         sql.add(' IDF_IDENTIFYING,');
         sql.add(' IDF_JORNADA_PADRAO,');
         sql.add(' IDF_LOCALIZACAO_FISICA,');
         sql.add(' IDF_MINIESPECIFICACAO,');
         sql.add(' IDF_NAMING_PREFIX,');
         sql.add(' IDF_NORMALIZE,');
         sql.add(' IDF_PERIOD_EVENTO_TEMPORA,');
         sql.add(' IDF_PONTO_DE_VISTA,');
         sql.add(' IDF_PRE_REQUISITOS,');
         sql.add(' IDF_PROJECT,');
         sql.add(' IDF_QUANTIDADE_TURNOS,');
         sql.add(' IDF_REVERSE_PHRASE,');
         sql.add(' IDF_ROLE,');
         sql.add(' IDF_ROLE_PREFIX,');
         sql.add(' IDF_TYPE_QUALIFIERS,');
         sql.add(' IDF_USE_CASE_ACTOR_TYPE,');
         sql.add(' IDF_REGRA_EXCECAO,');
         sql.add(' IDF_DATABASE,');
         sql.add(' IDF_DBDIR,');
         sql.add(' IDF_DBTYPE,');
         sql.add(' IDF_SYSTEMTABLE,');
         sql.add(' IDF_TIPO__ASPECTO,');
         sql.add(' IDF_ASPECTOS_CRITICOS,');
         sql.add(' IDF_COND_TRABALHO,');
         sql.add(' IDF_FORMACAO,');
         sql.add(' IDF_CONHECIMENTO,');
         sql.add(' IDF_EXPERIENCA,');
         sql.add(' IDF_COMPETENCIA,');
         sql.add(' ARI_ID,');
         sql.add(' IDF_ADERENCIA,');
         sql.add(' IDF_ATIVIDADE_CONTEXTO,');
         sql.add(' IDF_CARGA_HORA_DEMANDADA,');
         sql.add(' IDF_CLASSEOBJETO,');
         sql.add(' IDF_CLASSIFICACAO_PP,');
         sql.add(' IDF_COMPLEXIDADE,');
         sql.add(' IDF_CUSTO_ANUAL,');
         sql.add(' IDF_DEFINICAO_CONTEXTO,');
         sql.add(' IDF_DISTRIBUICAO,');
         sql.add(' IDF_EFEITO,');
         sql.add(' IDF_ESPECIALIZACAO,');
         sql.add(' IDF_FORMALIZACAO,');
         sql.add(' IDF_FUNCAO_NIVEL,');
         sql.add(' IDF_LOGICA,');
         sql.add(' IDF_MEDIA,');
         sql.add(' IDF_NOME,');
         sql.add(' IDF_OBJETIVO_PROCESSO,');
         sql.add(' IDF_PERIODICIDADE,');
         sql.add(' IDF_PREMISSAS,');
         sql.add(' IDF_PRIORIDADE,');
         sql.add(' IDF_QTDE_NECES_PROCES,');
         sql.add(' IDF_SIGLA,');
         sql.add(' IDF_SITUACAO,');
         sql.add(' IDF_TEMPO_CONTRATACAO,');
         sql.add(' IDF_TIMING');
         execsql;
       end ;
      end;
     end;


end;





procedure Imprime_LF(pCli,pProj : integer;pPrev : string;pQuebra : boolean);

begin

     with frm_pLf do
      Begin

         DetailBand1.ForceNewPage := pQuebra;
         //qrp.dataset := iLf;
         qrDataSet(frm_pLf.DetailBand1,iLf);
         
         iAp.DataSource := iLf.DataExt;
         qrDataSet(frm_pLf.Qr_at,iAp);
         iAp.Get_PaiDosFilhos(pCli,pProj,'AP','LF','IDF_AP') ;

         If pPrev = 'V' then
           //frm_pLf.qRP.preview
         else
         If pPrev = 'P' then
            //frm_pLf.qrp.print
         else
            //frm_Treeativ.ReportList.Add(frm_pLf.QRP);
     end;
end;




procedure TDG.SetCustoAntesMp(const Value: real);
begin
  FCustoAntesMp := Value;
end;

procedure TDG.SetCustoMP(const Value: reaL);
begin
  FCustoMP := Value;
end;

procedure TDG.SetiAp(const Value: Tdados);
begin
  FiAp := Value;
end;

procedure TDG.SetiAtor(const Value: Tdados);
begin
  FiAtor := Value;
end;

procedure TDG.SetiEn(const Value: Tdados);
begin
  FiEn := Value;
end;

procedure TDG.SetiFunc(const Value: Tdados);
begin
  FiFunc := Value;
end;

procedure TDG.SetiLocal(const Value: Tdados);
begin
  FiLocal := Value;
end;

procedure TDG.SetiRn(const Value: Tdados);
begin
  FiRn := Value;
end;

procedure TDG.SetNOME_DIAGRAMA(const Value: STRING);
begin
  FNOME_DIAGRAMA := Value;
end;

function TDG.Del_class(pNode: afnode): afnode;
begin

 tv.Diagrama.Get_Title(pNode).Marked := TRUE;
 tv.Diagrama.Get_attributes(pNode).Marked := TRUE;
 tv.Diagrama.Get_Metodos(pNode).Marked := TRUE;
 tv.Diagrama.SelectedNode.Marked := TRUE;

end;

procedure TDG.SetIDF_WBS_CODE(const Value: string);
begin
  FIDF_WBS_CODE := Value;
end;

procedure TDG.SetABRE_FORMDG(const Value: boolean);
begin
  FABRE_FORMDG := Value;
end;

procedure TDG.SetMYLOCK(const Value: BOOLEan);
begin
  FMYLOCK := Value;
end;

procedure TTv.tUnlcoka_Diag;
begin

end;


end.
