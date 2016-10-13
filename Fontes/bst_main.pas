unit bst_main;
   { Ver. p7
      1 - Recriadas telas Property e métodos (diagrama Classe), com 3 tier
   }

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, db, dbTables, Buttons, ExtCtrls, StdCtrls, FileCtrl,
  ComCtrls, OleCtrls, AxCtrls, DBCtrls, ImgList, dbGrids, AddFlow3Lib_TLB,
  registry, ShellAPI, jpeg, ActnList, ActnMan, cls_bd, ADODB, BSTDB, DBClient,
  cls_obj, cls_utils, strutils, bst_telaobj, Qrctrls, QuickRpt, Grids, RxGIF,
  Animate, GIFCtrl, reinit, idglobal, fonctions, DB_TIER, bst_BaseFrm, CL_ACCESS2,
  bst_dm_rel, ToolWin, bst_objetos;

type
  Tfrm_main = class (TBasefrm)
    MM  : TMainMenu;
    Projetos1  : TMenuItem;
    AreadeInteresse1  : TMenuItem;
    Sair1  : TMenuItem;
    pop_tv  : TPopupMenu;
    Excluir1  : TMenuItem;
    lb_dg  : TListBox;
    Class1  : TMenuItem;
    Definies1  : TMenuItem;
    C1  : TMenuItem;
    Atividades1  : TMenuItem;
    Atividades2  : TMenuItem;
    RegrasdeNegcio1  : TMenuItem;
    Informao1  : TMenuItem;
    InfraEstrutura1  : TMenuItem;
    ClassedeAtor1  : TMenuItem;
    ObjetodeInterface1  : TMenuItem;
    ObjetodeContorle1  : TMenuItem;
    SistemasExistentes1  : TMenuItem;
    Processador1  : TMenuItem;
    Fluxodedados1  : TMenuItem;
    Elementodedado1  : TMenuItem;
    LocalFsico1  : TMenuItem;
    Diretrio1  : TMenuItem;
    Pessoas1  : TMenuItem;
    Wcase  : TListBox;
    fnt  : TFontDialog;
    ToolbarImages  : TImageList;
    Ferramentas1  : TMenuItem;
    Avaliaodeproblemas1  : TMenuItem;
    im2  : TImageList;
    Relatrios1  : TMenuItem;
    Atividades3  : TMenuItem;
    Consistencia1  : TMenuItem;
    N2  : TMenuItem;
    N3  : TMenuItem;
    N4  : TMenuItem;
    AspectosCrticos2  : TMenuItem;
    Alvosdemelhoria1  : TMenuItem;
    Empresas1  : TMenuItem;
    AtorxAtividade1  : TMenuItem;
    AtorxPessoa1  : TMenuItem;
    AtividadexTecnologia1  : TMenuItem;
    RegrasdeNegcio2  : TMenuItem;
    Fluxosdedados1  : TMenuItem;
    Ajuda1  : TMenuItem;
    Ajuda2  : TMenuItem;
    SobreBEST1  : TMenuItem;
    Memo1  : TMemo;
    Session1  : TSession;
    RelaocomMercado1  : TMenuItem;
    N6  : TMenuItem;
    ObjetosdeNegcio1  : TMenuItem;
    EntidadesExternas1  : TMenuItem;
    ObjetosdeNegcio2  : TMenuItem;
    Atores1  : TMenuItem;
    EventosdeNegcio1  : TMenuItem;
    Elementosdedado1  : TMenuItem;
    LocaisdeProcessamento1  : TMenuItem;
    lb_cod  : TListBox;
    lb_pai  : TListBox;
    AplicaodosDados2  : TMenuItem;
    fl  : TFileListBox;
    Image1  : TImage;
    Pessoas2  : TMenuItem;
    Mecanismos1  : TMenuItem;
    Edit1  : TEdit;
    AtividadesxObjetosdeInterface1  : TMenuItem;
    N8  : TMenuItem;
    ObjetosdeInterface1  : TMenuItem;
    ObjetosdeControle1  : TMenuItem;
    N5  : TMenuItem;
    ConfiguraoAtual1  : TMenuItem;
    Panel2  : TPanel;
    Label1  : TLabel;
    Label2  : TLabel;
    sp_tree  : TSpeedButton;
    SpeedButton1  : TSpeedButton;
    sp_cliente  : TSpeedButton;
    SpeedButton7  : TSpeedButton;
    SpeedButton8  : TSpeedButton;
    SpeedButton9  : TSpeedButton;
    SpeedButton10  : TSpeedButton;
    lb_cen  : TLabel;
    lb_cli  : TLabel;
    ConfiguraodeOBjetos1  : TMenuItem;
    IntegraodosDiagramas1  : TMenuItem;
    ImportarDimenses1  : TMenuItem;
    im  : TImageList;
    Compressao1  : TMenuItem;
    ABC  : TSpeedButton;
    Segurana1  : TMenuItem;
    Usurios1  : TMenuItem;
    Pessoas3  : TMenuItem;
    CasosdeUso1  : TMenuItem;
    Privilgios1  : TMenuItem;
    spp  : TSpeedButton;
    StatusBar1  : TStatusBar;
    imgNovo_Old  : TImageList;
    ActionList1  : TActionList;
    Action1  : TAction;
    Action2  : TAction;
    Action3  : TAction;
    Action4  : TAction;
    Action5  : TAction;
    Action6  : TAction;
    Action7  : TAction;
    Action8  : TAction;
    imgNovo  : TImageList;
    CoolBar2  : TCoolBar;
    ToolBar1  : TToolBar;
    ToolButton1  : TToolButton;
    ToolButton2  : TToolButton;
    ToolButton3  : TToolButton;
    ToolButton4  : TToolButton;
    ToolButton5  : TToolButton;
    ToolButton6  : TToolButton;
    ToolButton7  : TToolButton;
    Image2  : TImage;
    EmpresasxCenrios1  : TMenuItem;
    adotControleLicenca  : TADOTable;
    procedure Clientes1Click(Sender : TObject);
    procedure FormCreate(Sender : TObject);
    procedure AreadeInteresse1Click(Sender : TObject);

    //procedure fViewer;
    function ExecuteF(const FileName, Params, DefaultDir : string;
      ShowCmd : Integer) : THandle;
    procedure Empresas1Click(Sender : TObject);
    procedure SpeedButton5Click(Sender : TObject);
    procedure sp_cenarioClick(Sender : TObject);
    procedure Class1Click(Sender : TObject);
    procedure sp_treeClick(Sender : TObject);
    procedure SpeedButton10Click(Sender : TObject);
    procedure AppException(Sender : TObject; E : Exception);
    procedure Configurao1Click(Sender : TObject);
    procedure ConfiguraoObjetos1Click(Sender : TObject);
    procedure Atividades2Click(Sender : TObject);
    procedure MenuItemClick(Sender : TObject);
    procedure SpeedButton1Click(Sender : TObject);
    procedure ObjetodeInterface1Click(Sender : TObject);
    procedure ObjetodeContorle1Click(Sender : TObject);
    procedure Abre_objeto(pTag : integer; pTit : string; MostraLista : Boolean);
    procedure ObjetosdeNegcio1Click(Sender : TObject);
    procedure Atividades3Click(Sender : TObject);
    procedure EventosdeNegcio1Click(Sender : TObject);
    procedure RegrasdeNegcio2Click(Sender : TObject);
    procedure Atores1Click(Sender : TObject);
    procedure Pessoas2Click(Sender : TObject);
    procedure Mecanismos1Click(Sender : TObject);
    procedure Fluxosdedados1Click(Sender : TObject);
    procedure Elementosdedado1Click(Sender : TObject);
    procedure LocaisdeProcessamento1Click(Sender : TObject);
    procedure AspectosCrticos2Click(Sender : TObject);
    procedure SobreBEST1Click(Sender : TObject);
    procedure Alvosdemelhoria1Click(Sender : TObject);
    procedure ObjetosdeNegcio2Click(Sender : TObject);
    procedure EntidadesExternas1Click(Sender : TObject);
    procedure AplicaodosDados2Click(Sender : TObject);
    procedure Sair1Click(Sender : TObject);
    procedure SpeedButton4Click(Sender : TObject);
    procedure Compactar1Click(Sender : TObject);
    procedure Edit1KeyPress(Sender : TObject; var Key : Char);
    procedure Ajuda2Click(Sender : TObject);
    procedure sppClick(Sender : TObject);
    procedure SpeedButton3Click(Sender : TObject);
    procedure Backup1Click(Sender : TObject);
    procedure SS2MaxUsers(Sender : TObject);
    procedure SS2Terminate(Sender : TObject);
    procedure AtorxAtividade1Click(Sender : TObject);
    procedure AtividadesxObjetosdeInterface1Click(Sender : TObject);
    procedure ObjetosdeInterface1Click(Sender : TObject);
    procedure ConverterBancoparaverso6001Click(Sender : TObject);
    procedure ConfiguraoAtual1Click(Sender : TObject);
    procedure Consistencia1Click(Sender : TObject);
    procedure SpeedButton6Click(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure Image5MouseMove(Sender : TObject; Shift : TShiftState; X,
      Y : Integer);
    procedure Image4Click(Sender : TObject);
    procedure ConfiguraodeOBjetos1Click(Sender : TObject);
    procedure Diretrio1Click(Sender : TObject);
    procedure IntegraodosDiagramas1Click(Sender : TObject);
    procedure ImportarDimenses1Click(Sender : TObject);
    procedure ImportaodeDiagramas1Click(Sender : TObject);
    procedure Explorador1Click(Sender : TObject);
    procedure ABCClick(Sender : TObject);
    procedure Usurios1Click(Sender : TObject);
    procedure CasosdeUso1Click(Sender : TObject);
    procedure dasdasClick(Sender : TObject);
    procedure ToolButton8Click(Sender : TObject);
    procedure FormShow(Sender : TObject);
    procedure FormCloseQuery(Sender : TObject; var CanClose : Boolean);
  private
    Fver  : string;
    FCanc_cli  : boolean;
    FDir_canc  : boolean;
    FBack  : string;
    FlastDir  : string;
    FNOme_back  : string;
    Fitab  : Tdados_tab;
    FViewer  : boolean;
    FWdemo  : boolean;
    FWQTDEMO  : INTEGER;
    Fwfecha  : boolean;
    FWQTATIV  : integer;
    FwPerc_Custo  : real;
    Fwtagoi  : integer;
    FLicencaOK  : boolean;
    FMensAbout  : string;
    Fwassist  : boolean;
    Flanguag  : integer;
    FPARA  : boolean;
    FULT_DIR  : string;
    FWBS  : boolean;
    FDECOMPOSTO  : boolean;
    Fbdimport  : Tbd;
    FiDgImport  : TDg;
    FiDgNovo  : TDg;
    FiDiagImport  : TDiag_dados;
    FiDiag  : TDiag_dados;
    FEmpImport  : Tempresa;
    FNOVODIAGID  : STRING;
    FWQTOE  : integer;
    FWQTRN  : integer;
    FWQTOI  : integer;
    FWQTIF  : integer;
    FWQTCA  : integer;
    Fidioma  : string;
    FSEGHABILIATADO  : boolean;
    procedure Setver(const Value : string);
    procedure SetCanc_cli(const Value : boolean);
    procedure SetBack(const Value : string);
    procedure SetDir_canc(const Value : boolean);
    procedure SetlastDir(const Value : string);
    procedure SetNOme_back(const Value : string);
    procedure Setitab(const Value : Tdados_tab);
    procedure SetViewer(const Value : boolean);
    procedure SetWdemo(const Value : boolean);
    procedure SetWQTDEMO(const Value : INTEGER);
    procedure Setwfecha(const Value : boolean);
    procedure SetWQTATIV(const Value : integer);
    procedure SetwPerc_Custo(const Value : real);
    procedure Setwtagoi(const Value : integer);
    function Checa_Icelicenca : boolean;
    procedure SetLicencaOK(const Value : boolean);
    procedure SetMensAbout(const Value : string);
    //procedure demo_Assist;
    procedure Setwassist(const Value : boolean);
    procedure Setlanguag(const Value : integer);
    procedure SetPARA(const Value : boolean);
    procedure SetULT_DIR(const Value : string);
    procedure SetWBS(const Value : boolean);
    function Abre_banco(pChoose : boolean) : boolean;
    procedure SetDECOMPOSTO(const Value : boolean);
    procedure Cria_ChaveDupl;
    procedure Importa_diagramas(pBd, pbdImport : Tbd; pempImport : Tempresa);
    function Importa_objetos(pDgImport : Tdg; pDiag : TDiag_dados; pNomeDiagImport : string) : boolean;
    procedure Importar_Diagramas;
    function Cria_NovaAtiv(ptabImport : Tdados_tab; pNode : afNode; pDiag : TDiag_dados; PtB : STRING) : integer;
    function Atualiza_node(pTabImport : Tdados_tab; pUserdataatu, puserdataNovo, pShape : integer; pDiag : TDiag_dados) : boolean;
    procedure Inicializa_Diag(pDiag : Tdg);
    procedure Mostra_erro(pNode : afnode; pLink : afLink; pMens : string);
    procedure Atualiza_Fluxos(pDg : Tdg; pNode : afNode; pDiag : TDiag_dados);
    function Inclui_Diagrama(pDiagImport : TDiag_dados; pIdgId, pDiag_pai_id : integer) : TDiag_dados;
    procedure Setbdimport(const Value : Tbd);
    procedure SetEmpImport(const Value : Tempresa);
    procedure SetiDgImport(const Value : TDg);
    procedure SetiDgNovo(const Value : TDg);
    procedure SetiDiag(const Value : TDiag_dados);
    procedure SetiDiagImport(const Value : TDiag_dados);
    procedure SetNOVODIAGID(const Value : STRING);
    function Atua_Chave_Diag(pDiagImport : TDiag_dados; pDiag : TDiag_dados) : boolean;
    function Inclui_Fluxo(pIDgImport : Tdados_tab; pId : integer) : integer;
    function Incluir_ap(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
    function Incluir_en(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_Ju(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_RN(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_EE(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    procedure Mostra_Mensagem(pMens : string);
    function Importar_corr(pCli, pProj : integer) : boolean;
    function Importa_NaoGraficos(pCli, pProj : integer) : boolean;
    function Jaimportado(pCli, pProj, pId : integer; ptab : string) : integer;
    function Incluir_LF(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_SE(pTabImport : TDados_tab; pDiag : TDiag_dados; pAplic : integer) : integer;
    function Incluir_TX(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_REQ(pTabImport : TDados_tab; pDiag : TDiag_dados;
      pAtiv : integer) : integer;
    function Incluir_OI(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_EV(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_DAD(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_IF(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_DE(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    function Incluir_ps(pTabImport : TDados_tab;
      pDiag : TDiag_dados) : integer;
    procedure SetWQTCA(const Value : integer);
    procedure SetWQTIF(const Value : integer);
    procedure SetWQTOE(const Value : integer);
    procedure SetWQTOI(const Value : integer);
    procedure SetWQTRN(const Value : integer);
    procedure Setidioma(const Value : string);
    procedure LoadconstantObj; override;
    procedure SetSEGHABILIATADO(const Value : boolean);
    function checaLicencaModelo(sinal : String; modelo : Integer) : Integer;
    function checaLicencaVisao(sinal : String; visao : Integer) : Integer;
  public
    //Codigo_Lista : string;
    procedure atualizaSerial;
  published
    property PARA  : boolean read FPARA write SetPARA;
    property wtagoi  : integer read Fwtagoi write Setwtagoi;
    property ver  : string read Fver write Setver;
    property Canc_cli  : boolean read FCanc_cli write SetCanc_cli; // qdo escli cancelou
    property Dir_canc  : boolean read FDir_canc write SetDir_canc;
    property Back  : string read FBack write SetBack;
    property lastDir  : string read FlastDir write SetlastDir;
    property NOme_back  : string read FNOme_back write SetNOme_back;
    property itab  : Tdados_tab read Fitab write Setitab;
    property Viewer  : boolean read FViewer write SetViewer;
    property Wdemo  : boolean read FWdemo write SetWdemo;
    property wassist  : boolean read Fwassist write Setwassist;
    property WQTDEMO  : INTEGER read FWQTDEMO write SetWQTDEMO; //qtde máxima diagaram p/versão demo
    property WQTATIV  : integer read FWQTATIV write SetWQTATIV; // qtde máxima de atividades para versão demo
    property WQTCA  : integer read FWQTCA write SetWQTCA;
    property WQTOE  : integer read FWQTOE write SetWQTOE;
    property WQTIF  : integer read FWQTIF write SetWQTIF;
    property WQTRN  : integer read FWQTRN write SetWQTRN;
    property WQTOI  : integer read FWQTOI write SetWQTOI;
    property wfecha  : boolean read Fwfecha write Setwfecha;
    property wPerc_Custo  : real read FwPerc_Custo write SetwPerc_Custo;
    property LicencaOK  : boolean read FLicencaOK write SetLicencaOK;
    property MensAbout  : string read FMensAbout write SetMensAbout;
    property languag  : integer read Flanguag write Setlanguag;
    property ULT_DIR  : string read FULT_DIR write SetULT_DIR;
    property WBS  : boolean read FWBS write SetWBS;
    property DECOMPOSTO  : boolean read FDECOMPOSTO write SetDECOMPOSTO; //true quando a ativdade acabou de ser decomposta; false no comfirma de frm_ap
    property idioma  : string read Fidioma write Setidioma;
   // para importação de diagramas
  //property  bdimport : Tbd read Fbdimport write Setbdimport;
 // property iDiag : TDiag_dados read FiDiag write SetiDiag;
    property iDiagImport  : TDiag_dados read FiDiagImport write SetiDiagImport;
    property iDgImport  : TDg read FiDgImport write SetiDgImport;   {diagrama a importar}
    property iDgNovo{diagrama importado(novo)}  : TDg read FiDgNovo write SetiDgNovo;
    property EmpImport  : Tempresa read FEmpImport write SetEmpImport;
    property NOVODIAGID  : STRING read FNOVODIAGID write SetNOVODIAGID;
    property SEGHABILIATADO  : boolean read FSEGHABILIATADO write SetSEGHABILIATADO; // controle de acesso habilitado
    function Consiste_tudo(pCli, pProj : integer) : boolean;
    function Checa_Ambiente(pDir : string) : boolean;
  end;
type
  cStyle = set of 1..100;

type TSysLocale = packed record

    DefaultLCID  : LCID;
    PriLangID  : LANGID;
    SubLangID  : LANGID;
    FarEast  : Boolean;
    MiddleEast  : Boolean;
  end;
var
  dim1  : STRING;
  dim2  : STRING;
  dim3  : STRING;
  dim4  : STRING;
  dim5  : STRING;
  dim6  : STRING;
  def97  : STRING;
  def970  : STRING;
  def907  : STRING;
  def38  : STRING;
  def381  : STRING;
  def382  : STRING;
  def383  : STRING;
  def384  : STRING;
  def3841  : STRING;
  def385  : STRING;
  def380  : STRING;
  def3800  : STRING;
  def38001  : STRING;
  def3802  : STRING;
  def3803  : STRING;
  def3804  : STRING;
  def3805  : STRING;
  def3806  : STRING;
  def3807  : STRING;
  def3808  : STRING;
  def3801  : STRING;
  def32  : STRING;
  def321  : STRING;
  def3211  : STRING;
  def103  : STRING;
  def40  : STRING;
  def63  : STRING;
  def56  : STRING;
  def61  : STRING;
  def34  : STRING;
  def340  : STRING;
  def10  : STRING;
  def1000  : STRING;
  def10000  : STRING;
  def10001  : STRING;
  def10002  : STRING;
  def10003  : STRING;
  def100030  : STRING;
  def10006  : STRING;
  def10004  : STRING;
  def10005  : STRING;
  def100051  : STRING;
  def88  : STRING;
  def881  : STRING;
  def882  : STRING;
  def8821  : STRING;
  def883  : STRING;
  def20  : STRING;
  def23  : STRING;
  def233  : STRING;
  def51  : STRING;
  def510  : STRING;
  def28  : STRING;
  def280  : STRING;
  def77  : STRING;
  def777  : STRING;
  def7771  : STRING;
  def7772  : STRING;
  def7773  : STRING;
  def7774  : STRING;
  def7775  : STRING;
  def7776  : STRING;
  def7777  : STRING;
  def1  : string;
  def1opt  : string;
  def12n  : string;
  defa1  : string;
  defa2  : string;
  defa3  : string;
  defa4  : string;
  defa5  : string;
  defa6  : string;
  defa7  : string;
  defa8  : string;
  defa9  : string;
  defa10  : string;
  defa11  : string;
  defa12  : string;
  defa13  : string;
  defa14  : string;
  defa15  : string;
  defa16  : string;
  defa17  : string;
  defa18  : string;
  defa19  : string;
  defa20  : string;
  defa21  : string;
  defa22  : string;
  defa23  : string;
  defa24  : string;
  defa25  : string;
  defa26  : string;
  defa27  : string;
  defa28  : string;

  defc1  : STRING;
  defc2  : STRING;
  defc3  : STRING;
  defc4  : STRING;
  defc5  : STRING;
  defc6  : STRING;
  defc7  : STRING;
  defc8  : STRING;
  defc9  : STRING;
  defc10  : STRING;
  defc11  : STRING;
  defc12  : STRING;
  defc13  : STRING;
  defc14  : STRING;
  defc15  : STRING;
  defc16  : STRING;
  defc17  : STRING;
  defc18  : STRING;
  defc19  : STRING;
  defc20  : STRING;
  defc21  : STRING;
  defc22  : STRING;
  defc23  : STRING;
  defc24  : STRING;
  defc25  : STRING;
  defc26  : STRING;
  defc27  : STRING;
  defc28  : STRING;
  defc29  : STRING;
  defc30  : STRING;
  defc31  : STRING;
  defc32  : STRING;
  defc33  : STRING;
  defc34  : STRING;
  defc35  : STRING;
  defc36  : STRING;
  defc37  : STRING;
  defd1  : STRING;
  defd2  : STRING;
  defd3  : string;
  defd4  : string;
  defd5  : string;
  defd6  : string;
  defd7  : string;
  defd8  : string;
  defd9  : string;
  defd10  : string;
  defd11  : string;
  defd12  : string;
  defe1  : STRING;
  defe2  : STRING;
  defe3  : STRING;
  defe4  : string;
  defe5  : string;
  defe6  : string;
  defe7  : string;
  defe8  : string;
  defe9  : string;
  defe10  : string;
  defe11  : string;
  defe12  : string;
  defe13  : string;
  defe14  : string;
  defe15  : string;
  defe16  : string;
  defe17  : string;
  defe18  : string;
  defe19  : string;
  defe20  : string;
  defe21  : string;
  defe22  : string;
  defe23  : string;
  defe24  : string;
  defe25  : string;
  defe26  : string;
  defe27  : string;
  defe28  : string;
  defe29  : string;
  defe30  : string;
  deff1  : STRING;
  deff2  : STRING;
  deff3  : STRING;
  deff4  : STRING;
  deff5  : STRING;
  deff6  : STRING;
  deff7  : STRING;
  defg1  : STRING;
  defg2  : STRING;
  defg3  : STRING;
  defg4  : STRING;
  defg5  : STRING;
  defg6  : STRING;
  defg7  : STRING;
  defg8  : STRING;
  defh1  : STRING;
  defi1  : STRING;
  defi2  : STRING;
  defi3  : STRING;
  defi4  : STRING;
  defi5  : STRING;
  defi6  : STRING;
  defi7  : STRING;
  defi8  : STRING;
  defi9  : STRING;
  defi10  : STRING;
  defi11  : STRING;
  defi12  : STRING;
  defi13  : STRING;
  defi14  : STRING;

  defj1  : STRING;
  defj2  : STRING;
  defj3  : STRING;
  defj4  : STRING;
  defj5  : STRING;
  defj6  : STRING;
  defj7  : STRING;
  defj8  : STRING;

  defl2  : string;
  defl3  : string;
  defl4  : string;
  defl5  : string;
  defl6  : string;
  defl7  : string;
  defl8  : string;
  defl9  : string;

  defm1  : STRING;
  defM2  : STRING;
  defM3  : STRING;
  defM4  : STRING;
  defM5  : STRING;
  defM6  : STRING;
  defM7  : STRING;
  defM8  : STRING;
  defM9  : STRING;

  defn1  : STRING;
  defn2  : string;
  defn3  : STRING;
  defn4  : string;
  defn5  : string;
  defn6  : string;
  defn7  : string;

  defo1  : string;
  defo2  : string;
  defo3  : string;
  defo4  : string;
  defo5  : string;
  defo6  : string;

  defp1  : STRING;
  defp2  : STRING;
  defp3  : STRING;
  defp4  : STRING;
  defp5  : STRING;
  defp6  : string;
  defp7  : string;
  defp8  : string;
  defp9  : string;
  defp10  : STRING;
  defp11  : string;
  defp12  : string;
  defp13  : string;
  defp14  : string;
  defp15  : string;
  defp16  : string;
  defp17  : string;
  defp18  : string;
  defp19  : string;

  defq1  : STRING;
  defq2  : STRING;

  defr1  : STRING;
  defr2  : STRING;
  defr3  : STRING;
  defr4  : STRING;
  defr5  : STRING;
  defr6  : STRING;
  defr7  : STRING;

  defS2  : STRING;
  defS3  : STRING;
  defS4  : STRING;
  defS5  : STRING;
  defS6  : STRING;
  defS7  : STRING;
  defS8  : STRING;
  defS9  : STRING;
  defS10  : STRING;
  defS11  : STRING;
  defS12  : STRING;
  defS13  : STRING;
  defS14  : STRING;
  defS15  : STRING;
  defS16  : STRING;
  defS17  : STRING;
  defS18  : STRING;
  defS19  : STRING;
  defS20  : STRING;
  defS21  : STRING;
  defS22  : STRING;
  defs23  : STRING;
  defs24  : STRING;

  deft1  : STRING;
  deft2  : STRING;
  deft3  : STRING;
  deft4  : STRING;
  deft5  : STRING;
  deft6  : STRING;
  deft7  : STRING;
  deft8  : STRING;
  deft9  : STRING;
  deft10  : STRING;
  deft11  : STRING;
  deft12  : STRING;
  deft13  : STRING;
  deft14  : STRING;
  deft15  : STRING;
  deft16  : STRING;
  deft17  : STRING;
  deft18  : STRING;

  defU1  : STRING;

  defv1  : STRING;
  defv2  : STRING;
  defv3  : STRING;
  def7778  : STRING;
  def7779  : STRING;
  def77779  : STRING;
  def777779  : STRING;
  def104  : STRING;
  def1040  : STRING;
  def1041  : STRING;
  def1042  : STRING;
  def1043  : STRING;
  def1044  : STRING;
  def1045  : STRING;
  def62  : STRING;
  def621  : STRING;
  def622  : STRING;
  def6220  : STRING;
  def6221  : STRING;
  def39  : STRING;
  def35  : STRING;
  def351  : STRING;
  def352  : STRING;
  def353  : STRING;
  def354  : STRING;
  def355  : STRING;
  def356  : STRING;
  def357  : STRING;
  def358  : STRING;
  def359  : STRING;
  def25  : STRING;
  def299  : STRING;
  def2991  : STRING;
  def55  : STRING;
  def550  : STRING;
  def71  : STRING;
  def26  : STRING;
  def260  : STRING;
  def65  : STRING;
  def650  : STRING;
  def6500  : STRING;
  def651  : STRING;
  def4  : STRING;
  def52  : STRING;
  def111  : STRING;
  def1111  : STRING;
  def92  : STRING;
  def922  : STRING;
  def923  : STRING;
  def9230  : STRING;
  def18  : STRING;
  def110  : STRING;
  def2  : STRING;
  def222  : STRING;
  def2220  : STRING;
  def72  : STRING;
  def722  : STRING;
  def7220  : STRING;
  def81  : STRING;
  def82  : STRING;
  def83  : STRING;
  def84  : STRING;
  def840  : STRING;
  def98  : STRING;
  def288  : STRING;
  def9  : STRING;
  def900  : STRING;
  def9000  : STRING;
  def57  : STRING;
  def80  : STRING;
  def800  : STRING;
  def8000  : STRING;
  def80000  : STRING;
  def49  : STRING;
  def19  : STRING;
  def191  : STRING;
  def41  : STRING;
  def410  : STRING;
  def78  : STRING;
  def788  : STRING;
  def789  : STRING;
  def7890  : STRING;
  def78901  : STRING;
  def78902  : STRING;
  def73  : STRING;
  def733  : STRING;
  def7331  : STRING;
  def74  : STRING;
  def741  : STRING;
  def75  : STRING;
  def76  : STRING;
  def761  : STRING;
  def7610  : STRING;
  def7611  : STRING;
  def271  : STRING;
  def36  : STRING;
  def361  : STRING;
  def58  : STRING;
  def21  : STRING;
  def211  : STRING;
  def212  : STRING;
  def213  : STRING;
  def2131  : STRING;
  def2132  : STRING;
  def214  : STRING;
  def2141  : STRING;
  def29  : STRING;
  def3  : STRING;
  def333  : STRING;
  def102  : STRING;
  def1020  : STRING;
  def30  : STRING;
  def48  : STRING;
  def79  : STRING;
  def799  : STRING;
  def105  : STRING;
  def1051  : STRING;
  def1050  : STRING;
  DEF112  : STRING;
  DEF1121  : STRING;
  DEF1122  : STRING;
  DEF1123  : STRING;
  DEF11231  : STRING;
  DEF11232  : STRING;
  def22  : STRING;
  def221  : STRING;
  def220  : STRING;
  def223  : STRING;
  def224  : STRING;
  def225  : STRING;
  def100  : STRING;
  def69  : STRING;
  def70  : STRING;
  def85  : STRING;
  def850  : STRING;
  def24  : STRING;
  def240  : STRING;
  def101  : STRING;
  def1010  : STRING;
  def42  : STRING;
  def96  : STRING;
  def12  : STRING;
  def86  : STRING;
  def87  : STRING;
  def7  : STRING;
  def6  : STRING;
  def8  : STRING;
  def888  : STRING;
  def8888  : STRING;
  def8881  : STRING;
  def8882  : STRING;
  def46  : STRING;
  def460  : STRING;
  def461  : STRING;
  def50  : STRING;
  def500  : STRING;
  def59  : STRING;
  def13  : STRING;
  def91  : STRING;
  def911  : STRING;
  def9111  : STRING;
  def9112  : STRING;
  def9113  : STRING;
  def91130  : STRING;
  def67  : STRING;
  def671  : STRING;
  def672  : STRING;
  def6720  : STRING;
  def67200  : STRING;
  def6721  : STRING;
  def67210  : STRING;
  def6722  : STRING;
  def5  : STRING;
  def106  : STRING;
  def107  : STRING;
  def1070  : STRING;
  def108  : STRING;
  def1081  : STRING;
  def109  : STRING;
  def37  : STRING;
  def45  : STRING;
  def450  : STRING;
  def43  : STRING;
  def90  : STRING;
  def901  : STRING;
  def903  : STRING;
  def904  : STRING;
  def902  : STRING;
  def99  : STRING;
  def93  : STRING;
  def933  : STRING;
  def934  : STRING;
  def935  : STRING;
  def47  : STRING;
  def27  : STRING;
  def270  : STRING;
  def94  : STRING;
  def960  : STRING;
  def95  : STRING;
  def950  : STRING;
  def9500  : STRING;
  def951  : STRING;
  def952  : STRING;
  def53  : STRING;
  def64  : STRING;
  def6400  : STRING;
  def6401  : STRING;
  def120  : STRING;
  def1200  : STRING;
  def12000  : STRING;
  def12001  : STRING;
  def123  : STRING;
  def121  : STRING;
  def1210  : STRING;
  def122  : STRING;
  def12200  : STRING;
  def1220  : STRING;
  def1221  : STRING;
  def1230  : STRING;
  def1240  : STRING;
  def1250  : STRING;
  def1260  : STRING;
  def1270  : STRING;
  def1280  : STRING;
  Mensap1  : STRING;
  Mensap2  : STRING;
  Mensap3  : STRING;
  Mensap4  : STRING;
  Mensap5  : STRING;
  Mensap6  : STRING;
  mens1  : STRING;
  mens2  : STRING;
  mens3  : STRING;
  mens4  : STRING;
  mens5  : STRING;
  mens6  : STRING;
  mens7  : STRING;
  mens8  : STRING;
  mens9  : STRING;
  mens10  : STRING;
  mens11  : STRING;
  mens12  : STRING;
  mens13  : STRING;
  mens14  : STRING;
  mens15  : STRING;
  mens16  : STRING;
  mens17  : STRING;
  mens18  : STRING;
  mens19  : STRING;
  mens20  : STRING;
  mens21  : STRING;
  mens22  : STRING;
  mens23  : STRING;
  mens24  : STRING;
  mens25  : STRING;
  mens26  : STRING;
  mens27  : STRING;
  mens28  : STRING;
  mens29  : STRING;
  mens30  : STRING;
  mens31  : STRING;
  mens32  : STRING;
  mens33  : STRING;
  mens34  : STRING;
  mens35  : STRING;
  mens36  : STRING;
  mens361  : STRING;
  mens37  : STRING;
  mens38  : STRING;
  mens39  : STRING;
  mens40  : STRING;
  mens41  : STRING;
  mens42  : STRING;
  mens43  : STRING;
  mens44  : STRING;
  mens45  : STRING;
  mens46  : STRING;
  mens47  : STRING;
  mens48  : STRING;
  mens49  : STRING;
  mens50  : STRING;
  mens51  : STRING;
  mens52  : STRING;
  mens53  : STRING;
  mens54  : STRING;
  mens55  : STRING;
  mens56  : STRING;
  mens57  : STRING;
  mens58  : STRING;
  mens59  : STRING;
  mens60  : STRING;
  mens61  : STRING;
  mens62  : STRING;
  mens63  : STRING;
  mens64  : STRING;
  mens65  : STRING;
  mens66  : STRING;
  mens67  : STRING;
  mens68  : STRING;
  mens69  : STRING;
  mens70  : STRING;
  mens71  : STRING;
  mens72  : STRING;
  mens73  : STRING;
  mens74  : STRING;
  mens75  : STRING;
  mens76  : STRING;
  mens77  : STRING;
  mens78  : STRING;
  mens79  : STRING;
  mens80  : STRING;
  mens81  : STRING;
  mens82  : STRING;
  mens83  : STRING;
  mens84  : STRING;
  mens85  : STRING;
  mens86  : STRING;
  mens87  : STRING;
  mens88  : STRING;
  mens89  : STRING;
  mens90  : STRING;
  mens91  : STRING;
  mens92  : STRING;
  mens93  : STRING;
  mens94  : STRING;
  mens95  : STRING;
  mens96  : STRING;
  mens97  : STRING;
  mens98  : STRING;
  mens99  : STRING;
  mens100  : STRING;
  mens101  : STRING;
  mens1010  : STRING;
  mens102  : STRING;
  mens103  : STRING;
  mens104  : STRING;
  mens105  : STRING;
  mens106  : STRING;
  mens107  : STRING;
  mens108  : STRING;
  mens109  : STRING;
  mens110  : STRING;
  mens111  : STRING;
  mens112  : STRING;
  mens113  : STRING;
  mens114  : STRING;
  mens115  : STRING;
  mens116  : STRING;
  mens117  : STRING;
  mens118  : STRING;
  mens119  : STRING;
  mens120  : STRING;
  mens121  : STRING;
  mens122  : STRING;
  mens123  : STRING;
  mens124  : STRING;
  mens125  : STRING;
  mens126  : STRING;
  mens127  : STRING;
  mens128  : STRING;
  mens129  : STRING;
  mens130  : STRING;
  mens131  : STRING;
  mens132  : STRING;
  mens133  : STRING;
  mens134  : STRING;
  mens135  : STRING;
  mens136  : STRING;
  mens137  : STRING;
  mens138  : STRING;
  mens139  : STRING;
  mens140  : STRING;
  mens141  : STRING;
  mens142  : STRING;
  mens143  : STRING;
  mens144  : STRING;
  mens145  : STRING;
  mens146  : STRING;
  mens147  : STRING;
  mens148  : STRING;
  mens149  : STRING;
  mens150  : STRING;
  mens151  : STRING;
  mens152  : STRING;
  mens153  : STRING;
  mens154  : STRING;
  mens155  : STRING;
  mens156  : STRING;
  mens157  : STRING;
  mens158  : STRING;
  mens159  : STRING;
  mens160  : STRING;
  mens161  : STRING;
  mens162  : STRING;
  mens163  : STRING;
  mens164  : STRING;
  mens165  : STRING;
  mens166  : STRING;
  mens167  : STRING;
  mens168  : STRING;
  mens169  : STRING;
  mens170  : STRING;
  mens171  : STRING;
  mens172  : STRING;
  mens173  : STRING;
  Mensasp1  : STRING;
  Mensasp2  : STRING;
  Mensasp3  : STRING;
  Mensasp4  : STRING;
  Mensasp5  : STRING;

//icereg
  mensreg1  : STRING;
  Mensreg1_1  : STRING;
  Mensreg2  : STRING;
  MensReg3  : STRING;
  Mensreg4  : STRING;
  MensReg5  : STRING;
  MensReg6  : STRING;
  MensReg7  : STRING;
  MensReg8  : STRING;
  Mensreg8_8  : STRING;
  MensReg9  : STRING;
  MensReg10  : STRING;
  MensReg11  : STRING;
  MensReg12  : STRING;
  MensReg13  : STRING;

  EI1  : STRING;
  EI2  : STRING;
  EI3  : STRING;
  EI4  : STRING;
  EI5  : STRING;
  EI6  : STRING;
  EI7  : STRING;
  EI8  : STRING;
  E19  : STRING;
  E20  : STRING;
  E21  : STRING;

  serpens  : String;     // Modalidade da Venda

  WTit  : array[1..17] of sTRING;

  WClass  : array[1..6] of sTRING;

  BdImport  : Tbd;
  wmens  : string;
  cFluxos  : cStyle;
  Empresas, CurrEmpresa  : Tempresa;
  Scenario  : Tcenario;
  Dominios  : TDominios;
  Atividades, CurrAtiv  : TAP;
  Tab  : Tdados_tab;
 // Diagramas  : TDiagrama;
  TV  : TTv;
  DG  : TDG;

  ///////////////////////////////////////////////
  WdirPad, WFilePad, WDirComp  : string;
  Ferme, prev, canc, Wusers, wForcenewpage  : Boolean;
  chk_k  : integer;
  Wisregistered, WcheckLic  : integer;
  FromDim, WLib  : boolean;
  WnoAnt, WCurrentAnt  : TTreeNode;
  TreeList, Treecli, TreeProj, TreeCod, TreeTi, TreeLevel  : TStringList;
  Ti  : integer;
  Cli_Import, prj_Import, dg_import, Cli_export,
  prj_export, dg_export  : integer;
  efromAtual, eFromImport  : Boolean;
  xxlevel  : integer;
  WfrmSrc, WfrnTrg  : Tform;
  WTvsrc, Wtvtrg  : TtreeNode;
  Fout, F  : TextFile;
  Arqout, S, Hist_db  : string;
  frm_main  : Tfrm_main;
  wfrm, cod  : integer;
  Wsource  : Tdatasource;
  Wqry  : Tquery;
  case_name, WNomeNivel  : string;
  Wgrid, WSnap  : Boolean;
  WGrid_Alt, WGrid_Larg  : integer;
  WNivel_Ativo, WuserId  : Integer;
  WSubid, WPai, WAvo, WSubIdPai, WAtividadeMae  : integer;
  WDiag_Id, WClass_Dg, WClass_dgEsc, WUnidade_Tempo  : string;
  WColor  : Tcolor;
  WNome_nivel  : string;
  WdirPalete  : string;
  WCurrentEntity  : afNode;
  WModif  : Boolean;
  Wwin  : integer;
  WWbsPai  : string;
  Worigemdados  : integer;
  WrelSelected  : afLink;
  WentSelected, WEntdestination, WentSource  : afNode;
  WtextCopy, WPopUpClick  : string;
  Novo, WChangeText, WChangeRelationText  : boolean;
  WcodigoCopy  : integer;
  WDirDb, Wdb, Wdbms  : string;
  WNomeDiagAtu  : string;
  Acli  : array of integer;
  Aprj  : array of integer;
  ANode  : array of TtreeNode;
  AId  : array of integer;
  AIdg  : array of integer;

  ANodeCli  : array of TtreeNode;
  Acliger  : array of integer;
  AcliIdg  : array of integer;

  ANodeprj  : array of TtreeNode;
  APrjger  : array of integer;

  WnodeCli  : TtreeNode;
  WPrj_titulo, winteresse, WDiag_Status, WCli_Nome, WDiag_nome  : string;
  Wcli, WProj, Widg, WCliAnt, WProjAnt, WcliImport, WprojImport, WidgImport  : integer;
  Grava  : Boolean;
  WCodigo_Lista, Wcodigo_Ant, Wmenu  : integer;
  WGera_Correlacao  : Boolean;
  WDataset  : string;

  WDiag_Palette  : string;
  FirstDg  : Boolean;
  Wtot  : integer;
  WSubIdtv  : integer;
  WBanco, WDiag_Ant  : string;
  WDirBanco, Wdir, WAlias  : string;
  WBot, Wtip  : string;
  Wlibera  : integer;
  GravDir  : string;
  Editor  : TdbRichEdit;
  Ed_Memo  : TdbMemo;
  mWidth, mHeight, mTop, mLeft  : integer;
  Wclose  : boolean;
  Wbmp  : integer;

  WShowGrid, WSnapToGrid  : Boolean;
  Wx, Wy  : single;
  WGridColor, WDiagColor  : Tcolor;
  WTipoGrid  : integer;
  WFontEntidade, WFontLink  : Tfont;
  WCorEntidade, WCorLink  : TColor;
  Wimagem  : Tpicture;
  WcloseTree  : Boolean;
  mDado  : udado;
  ok  : Boolean;
  Wdiretorio, retour, WdirImp, WNomeDg  : string;
  Wno  : TtreeNode;
  Wimptxt, dg_created, fromTree, FromTreeator  : boolean;
  WTipoObjeto  : string;
  Rig_width, Rig_height, Rig_Top, Rig_Left  : real;
  chg  : boolean;
  WIdg_Ex, Wexp  : integer;
  WDiag_Id_ex  : string;
  Dg_Corrente  : TaddFlow;
  Drv_Atu  : string;
  WCurrentNode, WpreviousNode  : TTreeNode;
  WEntWidth, WEntHeight  : variant;

const Wdim  : array[1..17] of sTRING = ('AP', 'AC', 'CA', 'DG', 'OI', 'PS',
    'OE', 'DE', 'JU', 'RN', 'SE', 'EN', 'LF', 'EV', 'IF', 'DE', 'CS');

const Wobj  : array[1..17] of sTRING = ('AP', 'CA', 'DG', 'OI', 'PS', 'OE', 'DE', 'JU', 'RN', 'SE', 'EN', 'LF',
    'EV', 'IF', 'OC', 'EE', 'CS');
    { tabelas de qtdes permitidas em versão demo}
   //EE tem ser igual a CA, AP <= QTD DIAGRAMAS
const WObjQt  : array[1..17] of integer = (20, 20, 40, 3, 3, 3, 10, 10, 5, 10, 5, 2, 5, 10, 10, 20, 10);
 // const WObjQt: array[1..17] of integer = (2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2);

const wtabelas  : array[0..38] of string = ('IDF_AP', 'IDF_AC', 'IDF_CA', 'IDF_CS', 'IDF_DE',
    'IDF_DG', 'IDF_EN', 'IDF_ET', 'IDF_EV', 'IDF_IF',
    'IDF_JU', 'IDF_LF', 'IDF_MT', 'IDF_OE', 'IDF_OI',
    'IDF_PS', 'IDF_PY', 'IDF_RN', 'IDF_SE', 'IDF_TX',
    'ARI_AREA_INTERESSE', 'CLI_CLIENTE', 'CMB_DIVERSOS',
    'COR_OBJETOS', 'CUSTO_TEMP', 'ELEM_DADO', 'IDF_CUSTODG', 'IDF_CUSTOS',
    'IDF_DADOS', 'IDF_LIMPA', 'IDF_TODO', 'IDF_CLASS', 'PRJ_PROJETO',
    'PROVIDER_DATA', 'REQUERIMENTOS',
    'SUB_SUBORDINACAO', 'IDF_ADERENCIA', 'TI_LAY', 'TI_REQ');
const DPNnaografico  : array[0..8] of string = ('IDF_CA', 'IDF_DE', 'IDF_ET', 'IDF_EV',
    'IDF_LF', 'IDF_MT', 'IDF_PY', 'IDF_RN', 'IDF_SE');

const DPNnaograficoGer  : array[0..6] of string = ('IDF_AC', 'IDF_IF', 'IDF_PS', 'IDF_TX', 'TI_REQ', 'TI_LAY', 'IDF_DADOS');

  { tabelas objetos gráficos dos diagramas}
const WTab  : array[0..7] of sTRING = ('IDF_AP', 'IDF_AP', 'IDF_EN', 'IDF_JU', 'IDF_AP', 'IDF_CA', 'IDF_RN', 'IDF_IF');


   {shape do objeto gráfico DPN}
const Wobj_shape  : array[0..6] of integer = (50, 79, 56, 2, 54, 55, 14);

  { tabelas objetos gráficos Duc}
const WTab_UC  : array[0..4] of sTRING = ('IDF_OI', 'IDF_OI', 'IDF_CA', 'IDF_AP', 'IDF_IF');

   {shape do objeto gráfico DUC}
const Wobj_shape_UC  : array[0..4] of integer = (58, 8, 53, 62, 0);

const WVis  : array[1..17] of sTRING = ('S', 'N', 'S', 'S', 'N', 'S', 'N', 'S', 'S', 'N', 'S', 'N', 'N', 'S', 'S', 'S', 'S');


const WOeIMP  : array[1..5] of sTRING = ('COR_OBJETOS', 'CMB_DIVERSOS',
    'TI_ADERENCIA', 'TI_LAY', 'TI_REQ');

const  wtype  : array[1..6] of string = ('C', 'I', 'N', 'M', 'D', 'T');

{Acrescentar abaixo os ocx usados no programa para que possam ser registrados
 função : registra_ocx}

implementation

uses bst_clifull, bst_logo, bst_cenario, bst_ari, bst_diversos,
  bst_treeAtiv, bst_escli, bst_lista, bst_cfg, bst_ap, bst_aspectos, bst_ca,
  bst_data, bst_ev, bst_pessoa, bst_de, bst_regra, bst_se, bst_en, bst_lf,
  bst_if, bst_escativ, bst_cimp, bst_pen, bst_pregra, bst_pca, bst_ppessoa,
  bst_pse, BST_pdata, bst_pde, bst_plf, bst_Escaspect, bst_about, BST_pdmig,
  BST_pentext, bst_PApde, bst_treeator, bst_limpa, BST_help, bst_exdir,
  bst_enc, bst_patorat, bst_patoi, bst_puc, bst_check, bst_pConsistDg,
  bst_aplic, bst_treeCusto, bst_icereg, bst_Configdb, bst_demoassist,
  bst_impdim, bst_tabenga, bst_log, bst_escliImport, bst_qry,
  best_eng, bst_MainPT, bst_ger, bst_usuario, BST_SEGUC,
  bst_login, bst_mens, bst_idiomas, bst_ValidaBEST, UProcEFunc;

{$R *.DFM}
{$D+}
{/F}
procedure Tfrm_main.Clientes1Click(Sender : TObject);

begin
  If Checa_Acesso(uppercase('frm_clifull'), SEGHABILIATADO, 0) then
  Begin
    If frm_clifull = nil then
    begin frm_clifull := Tfrm_clifull.create(self) end;
    frm_clifull.sp_novo.enabled := true;
    frm_clifull.showModal;
  end;
end;

function Tfrm_main.Checa_Ambiente(pDir : string) : boolean;
var
  i  : integer;
  temp  : string;
begin
  result := true;
  for i := 1 to length(cClasse) do
  begin
    temp := 'CFG' + cClasse[i] + '.ADD';
    If not fileexists(pDir + temp) then
    begin
      Showmessage(mens8 + ' ' + pDir + temp);
      result := false;
      exit;
    end;
  end;
end;

procedure Tfrm_main.FormCreate(Sender : TObject);
VAR
  mens, Wparm, WDir  : string;
  Wini  : string;
  y  : integer;
  idi  : Tlanguages;
  widiom  : TstringList;
begin
  SEGHABILIATADO := false;  //habilita ou o controle de acesso;

  oAcesso.WACCESS := 2;     //Valor 2 permite a atualização - 1 Reader
  Viewer := false; { TODO : Aqui parece que habilita o Viewer }

  Wusers := false;
  if viewer = true then
    SEGHABILIATADO := false;

  IDIOMA := 'PT';
  inherited;

  edit2.Text := '7.30';
  cFluxos := [2, 5, 6, 9]; //fluxos de dados

  If frm_logo = nil then
  Begin
    frm_logo := Tfrm_logo.create(self);
    frm_logo.Show;
    frm_logo.repaint;
  End;

  If Checa_IceLicenca then        //reativar
  begin
    LastDir := 'c:\';
    decimalSeparator := '.';
    Ver := GetBuildInfo;
    FromDim := false;
    FromTree := false;
    FromTreeAtor := false;
    Dg_Created := false;

    WQTDEMO := 1725;  // qtde de diagramas p versão demo
    WCloseTree := true;
    Wimagem := Tpicture.create;
    WFontEntidade := Fnt.Font;
    WFontLink := Fnt.Font;
    WCorEntidade := clwhite;
    WCorLink := clblack;
  end;

  if (serpens = 'D') then
    Relatrios1.Enabled := false
  else
    Relatrios1.Enabled := true;


  If not viewer then
    Case_Name := 'BEST - Business Engineering Solution Tool'
  else
    Case_Name := 'BEST - Business Engineering Solution Tool - Reader';
  wfrm := 0;
  frm_main.Caption := case_name;

 {Abre o Banco de Dados}
  while not Abre_banco(false) do
  begin
    if para then
    begin
      bdx := nil;
      close;
      application.Terminate;
      break;
    end;
  end;
  Diretrio1Click(nil);
 //SpeedButton10Click(nil);
  image2.Width := frm_main.Width;
  image2.Left := 0;
  image2.Top := 0;
  image2.Height := frm_main.Height;


{  if ToolButton1.Enabled = false then
  Begin
      if frm_clifull = nil then
      Begin
        ShowMessage('Não existe empresa cadastrada');
        Empresas1Click(sender);
        frm_main.SendToBack;
      end;
  End;
}
end;

function Tfrm_main.Abre_banco(pChoose : boolean) : boolean;
var
  i  : integer;
begin
  try
    result := true;
    begin
      if bdx = nil then
        bdx := TBd.create(true, true, pChoose);

      Atu_schema;

      iTab := Tdados_tab.create(self);
      iTab.Connection := bdx;
      If viewer then
      Begin
        sp_cliente.Enabled := false;
        speedbutton7.Enabled := false;
        speedbutton8.Enabled := false;
        mm.Items[3].Enabled := false;
        mm.Items[0].Enabled := false;
        bdx.Connected := false;
        bdx.Mode := (cmRead);
      end;

      { If bdx.TIPOBANCO  > 0 then // bancos SQL
         mm.Items[3].Items[6].Enabled := false
       else
        mm.Items[3].Items[6].Enabled := true; }
      fl.Directory := bdx.DirFluxo;  //tirar

      If wdemo then
      Begin
        frm_main.Caption := frm_main.Caption + ' - ' + def6400;
        With Tdg.create do
        Begin
          for i := 1 to length(wobjQT) do
          Begin
            If DemoMaior(WOBJ[I], true) then  //versào demo ultrapassou
            begin
              free;
              showmessage(mens118 + '(' + WOBJ[I] + ')');
              bdx := nil;
              result := false;
              exit;
                   //  Diretrio1Click(nil);
            end;
          end;
          free;
        end;
      end;
      If not Checa_Ambiente(bdx.DirFluxo) then
        halt;
    end;
  except
    begin
      freeandnil(bdx);
      showmessage(mens95);
      raise;

    end;
  end;
end;

procedure Tfrm_main.AppException(Sender : TObject; E : Exception);
begin
  //  Application.ShowException(E);
   // application.Terminate;
end;

function Tfrm_main.ExecuteF(const FileName, Params, DefaultDir : string;
  ShowCmd : Integer) : THandle;
var
  zFileName, zParams, zDir  : array[0..79] of Char;
begin
  Result := ShellExecuteA(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

procedure Tfrm_main.AreadeInteresse1Click(Sender : TObject);
begin
  If Checa_Acesso(uppercase('frm_ari'), SEGHABILIATADO, 0) then
  Begin

    If frm_ari = nil then
    begin
//       frm_ari := Tfrm_ari.create(self);
      Application.CreateForm(Tfrm_ari, frm_ari);
    end;
    {frm_ari.Top := 0;
    frm_ari.Left := 0;
    frm_ari.Show;}
    //frm_ari.ShowModal;
  end;
end;

procedure Tfrm_main.Empresas1Click(Sender : TObject);
begin
  If Checa_Acesso(uppercase('frm_clifull'), SEGHABILIATADO, 0) then
  Begin
    If frm_clifull = nil then
    begin
      Application.CreateForm(Tfrm_clifull, frm_clifull);
         //frm_clifull := Tfrm_clifull.create(self);
    end;
      //frm_clifull.Top := 0;
      //frm_clifull.Left := 0;
      //frm_clifull.show;
  end;
end;

procedure Tfrm_main.SpeedButton5Click(Sender : TObject);
begin
{ TODO : Inserção da Checagem de Licenças }
  if MessageDlg('Confirma a saída do Best ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    atualizaSerial;
    Halt;
  end;
end;

procedure Tfrm_main.sp_cenarioClick(Sender : TObject);
begin
  If frm_cenario = nil then
  begin frm_cenario := Tfrm_cenario.create(self) end;
  frm_cenario.showModal;
end;

procedure Tfrm_main.Class1Click(Sender : TObject);
begin
  If Checa_Acesso(uppercase('frm_diversos'), SEGHABILIATADO, 0) then
  Begin
    If frm_diversos = nil then
    begin
        //frm_diversos := Tfrm_diversos.create(self);
      Application.CreateForm(Tfrm_diversos, frm_diversos);
    end;
      {frm_diversos.Top := 0;
      frm_diversos.Left := 0;
      frm_diversos.Show;}
      //frm_diversos.showModal;
  end;
end;

procedure Tfrm_main.sp_treeClick(Sender : TObject);
begin
  try
    begin
      oAcesso.JUSTLOGIN := TRUE;
      Checa_Acesso('', frm_main.SEGHABILIATADO, 0);
      oAcesso.JUSTLOGIN := FALSE;
      If bdx = nil then
      begin Raise exception.create(mens124) end;
      If tv <> nil then
      begin freeandnil(tv) end;
      If frm_logo <> nil then
      begin frm_logo.close end;
      If frm_treeativ <> nil then
      begin close end;

      Application.CreateForm(Tfrm_TreeAtiv, frm_TreeAtiv);
    end;
  except
    begin
      If frm_treeativ <> nil then
      begin frm_treeativ.close end;
      raise;
    end;
  end;
end;

procedure Tfrm_main.SpeedButton10Click(Sender : TObject);
begin
  If frm_esccli = nil then
  begin frm_esccli := tfrm_esccli.create(self) end;
  frm_esccli.top := 0;
  frm_esccli.showModal;
end;

procedure Tfrm_main.Configurao1Click(Sender : TObject);
begin
  freeandnil(BDx);
  freeandnil(Empresas);
  freeandnil(CurrEmpresa);
  freeandnil(Scenario);
  freeandnil(Atividades);
  freeandnil(CurrAtiv);
  freeandnil(Dominios);
  freeandnil(Tab);
  lb_cli.Caption := '';
  lb_cen.Caption := '';

  BDx := TBD.Create(true, true, true);
  If bdx.TIPOBANCO > 0 then // bancos SQL
  begin mm.Items[3].Items[6].Enabled := false end
  else
  begin mm.Items[3].Items[6].Enabled := true end;
end;

procedure Tfrm_main.ConfiguraoObjetos1Click(Sender : TObject);
begin
  If frm_cfg = nil then
  begin frm_cfg := tfrm_cfg.create(self) end;
  frm_cfg.showmodal;
end;

procedure Tfrm_main.MenuItemClick(Sender : TObject);
begin
  If CurrEmpresa = nil then
  begin SpeedButton10Click(frm_main) end;
  wfecha := true;
  If not canc_cli then
  begin Abre_Objeto(TMenuItem(sender as Tobject).Tag, TMenuItem(sender as Tobject).Caption, true) end;
  wfecha := true;
end;

procedure Tfrm_main.Abre_objeto(pTag : integer; pTit : string; mostraLista : boolean);
var
mTab,mCodigo : string;
//itab : Tdados_tab;
iFrm : Tfrm_obj;
Existe : boolean;
begin
  iTab.Connection := bdx;
  case  ptag of
    1 : mtab := 'IDF_AP';
    2 : mtab := 'IDF_AC';
    3 : mtab := 'IDF_CA';
    4 : mtab := 'IDF_DG';
 5,16 : mtab := 'IDF_OI';
    6 : mtab := 'IDF_PS';
    8 : mtab := 'IDF_DE';

   10 : mtab := 'IDF_RN';
   11 : mtab := 'IDF_SE';
   12 : mtab := 'IDF_EN';
   13 : mtab := 'IDF_LF';
   15 : mtab := 'IDF_IF';
   20 : mtab := 'IDF_TX';
  end;

  try
   with itab  do
   while true do
   begin
   begin
     ListaCli := CurrEmpresa.cenarios.CLI_ID ;
     ListaProj:= CurrEmpresa.Cenarios.PRJ_ID ;
     ListaDim := mTab ;
     ListaTit := pTit ;
     ListaTag := ptag ;
     ListaEdit:= true ;
     ListaTree:= nil;
     Listafecha := true;
     ListaId  := 0;
     OPERACAO := 0;
     if mostraLista then
     Begin
      mostra_lista;
     End;
     If  ListaCanc then
      exit;

     case Listatag of
       1 : begin       //atividade
              If Checa_Acesso(uppercase('frm_ap'),SEGHABILIATADO,0) then
               Begin
                 begin
               Tabela := 'IDF_AP';
                existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                 // raise exception.Create(EI1);
                end;

                 If frm_ap = nil then
                    frm_ap := Tfrm_ap.create(self);
                  with frm_ap do
                  begin
                    Tipo        := 'AP';
                    Visivel     := 'S';
                    Mode        := 'M';
                    AutoFecha   := false;
                    idatasource := DataExt;
                    CLIENTE     := ListaCli;
                    CENARIO     := ListaProj;
                    If not existe then
                    Begin
                      Mode := 'I';
                      sp_insertClick(self);
                    end;
                    showmodal;
                  end;
                end;
            end;

       2 : begin       //Aspectos críticos
           If Checa_Acesso(uppercase('frm_aspectos'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_AC';
             existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
             //  existe := Openall(ListaCli,ListaProj,TABELA,'AC','',0);


             If frm_aspectos   = nil then
                frm_aspectos := tfrm_aspectos.Create(self);
             with frm_aspectos do
              begin
                Tipo        := 'AC';
                Visivel     := 'N';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                showmodal;
              end;
             end;
            end;

       3 : begin       //Ator
           If Checa_Acesso(uppercase('frm_ca'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_CA';
               existe := Open_Objeto(ListaCli,ListaProj,itab.ListaCodigo,TABELA) ;
                  // raise exception.Create(EI1);

             If frm_ca   = nil then
                frm_ca := tfrm_ca.Create(self);
             frm_ca.Tipo        := 'CA';
             frm_ca.Visivel     := 'N';
             frm_ca.Mode        := 'M';
             frm_ca.AutoFecha   := false;
             frm_ca.idatasource := DataExt;
             frm_ca.CLIENTE     := ListaCli;
             frm_ca.CENARIO     := ListaProj;
             If not existe then
                  Begin
                    frm_ca.Mode := 'I';
                    frm_ca.sp_insertClick(self);
                  end;
             frm_ca.showmodal;
            end;
           end;
       4 : begin       //Fluxo de dados
           If Checa_Acesso(uppercase('frm_data'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_DG';
               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA);
                  // raise exception.Create(EI1);


             If frm_data   = nil then
                frm_data := tfrm_data.Create(self);
             with frm_data do
              begin
                Tipo        := 'DG';
                Visivel     := 'S';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                showmodal;
              end;
            end;
            end;

      16,5 : begin       //Objeto de Interface
            If Checa_Acesso(uppercase('frm_ev'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_OI';
               existe :=  Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA);
                  // raise exception.Create(EI1);


             If frm_ev   = nil then
                frm_ev := tfrm_ev.Create(self);
             with frm_ev do
              begin
                If ListaTag = 5 then
                   begin
                      caption := def6 ;
                      Tipo    := 'OI';
                   end
                else
                   begin
                      caption := def7;
                      Tipo    := 'OC';
                     // Tabsheet2.TabVisible := false;
                      ts_lay.TabVisible    := false;
                   end;

                Visivel     := 'S';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;

                showmodal;
              end;
            end;
            end;
       6 : begin       //Pessoa
           If Checa_Acesso(uppercase('frm_pessoa'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_PS';

               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
               //  raise exception.Create(EI1);


             If frm_pessoa   = nil then
                frm_pessoa := tfrm_pessoa.Create(self);
             frm_pessoa.Tipo        := 'PS';
             frm_pessoa.Visivel     := 'N';
             frm_pessoa.Mode        := 'M';
             frm_pessoa.AutoFecha   := false;
             frm_pessoa.idatasource := DataExt;
             frm_pessoa.CLIENTE     := ListaCli;
             frm_pessoa.CENARIO     := ListaProj;
             If not existe then
                  Begin
                    frm_pessoa.Mode := 'I';
                    frm_pessoa.sp_insertClick(self);
                  end;
             frm_pessoa.showmodal;
            end;
            end;
        8 : begin       //Elemento de Dado
            If Checa_Acesso(uppercase('frm_de'),SEGHABILIATADO,0) then
             begin
             Tabela := 'IDF_DE';
             if frm_if = nil then
             Begin
                existe :=  Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA);
             End
             else
             Begin
                existe := false
             End;
                //   raise exception.Create(EI1);
             If frm_de   = nil then
                frm_de := tfrm_de.Create(self);
             with frm_de do
              begin
                Tipo        := 'DE';
                Visivel     := 'N';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                dbg_de.DataSource       := dataext;
                db_descricao.DataSource := dataext;
                db_dominio.DataSource   := Dataext;
                db_Descricao.dataField  := 'IDF_DESCRICAO';
                db_Dominio.dataField    := 'IDF_DOMINIO';
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                frm_de.showmodal;
              end;
            end;
            end;

        10 : begin       //Regras de negócio
             If Checa_Acesso(uppercase('frm_REGRA'),SEGHABILIATADO,0) then
             begin
              Tabela := 'IDF_RN';
              existe :=  Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                //   raise exception.Create(EI1);
              If frm_regra   = nil then
                frm_regra := tfrm_regra.Create(self);
             frm_regra.Tipo        := 'RN';
             frm_regra.Visivel     := 'S';
             frm_regra.Mode        := 'M';
             frm_regra.AutoFecha   := false;
             frm_regra.idatasource := DataExt;
             frm_regra.CLIENTE     := ListaCli;
             frm_regra.CENARIO     := ListaProj;
             If not existe then
                  Begin
                    frm_regra.Mode := 'I';
                    frm_regra.sp_insertClick(self);
                  end;
             frm_regra.showmodal;
            end;
            end;

        11 : begin       //Mecanismos
             If Checa_Acesso(uppercase('frm_se'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_SE';
               existe :=  Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                  // raise exception.Create(EI1);


             If frm_se   = nil then
                frm_se := tfrm_se.Create(self);
             frm_se.Tipo        := 'SE';
             frm_se.Visivel     := 'N';
             frm_se.Mode        := 'M';
             frm_se.AutoFecha   := false;
             frm_se.idatasource := DataExt;
             frm_se.CLIENTE     := ListaCli;
             frm_se.CENARIO     := ListaProj;
             If not existe then
                  Begin
                    frm_se.Mode := 'I';
                    frm_se.sp_insertClick(self);
                  end;
             frm_se.showmodal;
            end;
            end;

        12 : begin       //evento de negócio
			      If Checa_Acesso(uppercase('frm_en'),SEGHABILIATADO,0) then
             begin
               Tabela := 'IDF_EN';
               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                 //  raise exception.Create(EI1);


             If frm_en   = nil then
                frm_en := tfrm_en.Create(self);
             frm_en.Tipo        := 'EN';
             frm_en.Visivel     := 'S';
             frm_en.Mode        := 'M';
             frm_en.AutoFecha   := false;
             frm_en.idatasource := DataExt;
             frm_en.CLIENTE     := ListaCli;
             frm_en.CENARIO     := ListaProj;
             If not existe then
                  Begin
                    frm_en.Mode := 'I';
                    frm_en.sp_insertClick(self);
                  end;
             frm_en.showmodal;
            end;
            end;

         13 : begin       //Locais
              If Checa_Acesso(uppercase('frm_lf'),SEGHABILIATADO,0) then
              begin
               Tabela := 'IDF_LF';
               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                 //  raise exception.Create(EI1);


             If frm_lf   = nil then
                frm_lf := tfrm_lf.Create(self);
             with frm_lf do
              begin
                Tipo        := 'LF';
                Visivel     := 'N';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                showmodal;
              end;
            end;
            end;

         15 : begin       //Objetos de negócio
              If Checa_Acesso(uppercase('frm_if'),SEGHABILIATADO,0) then
               begin
               Tabela := 'IDF_IF';
               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                   //raise exception.Create(EI1);


             If frm_if   = nil then
                frm_if := tfrm_if.Create(self);
             with frm_if do
              begin
                Tipo        := 'IF';
                Visivel     := 'S';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                showmodal;
              end;
            end;
            end;

          20 : begin       //Aplicativos
               If Checa_Acesso(uppercase('frm_aplic'),SEGHABILIATADO,0) then
                begin
                 Tabela := 'IDF_TX';
                 existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                   //raise exception.Create(EI1);


             If frm_aplic   = nil then
                frm_aplic := tfrm_aplic.Create(self);
             with frm_aplic do
              begin
                Tipo        := 'TX';
                Visivel     := 'N';
                Mode        := 'M';
                AutoFecha   := false;
                idatasource := DataExt;
                CLIENTE     := ListaCli;
                CENARIO     := ListaProj;
                If not existe then
                  Begin
                    Mode := 'I';
                    sp_insertClick(self);
                  end;
                showmodal;
              end;
            end;
            end;
     end; //endcase
   end;
   end;
   finally
    iTab.ListaCanc := false;
   // freeandNil(iTab);
   end;

end;


procedure Tfrm_main.Atividades2Click(Sender: TObject);
var
idados : Tdados_tab;
begin
   MenuItemClick(Sender);
end;

procedure Tfrm_main.SpeedButton1Click(Sender: TObject);
var
Wdiag : Tdiag_dados;
i,p : integer;
Wname : string;
begin
  Wdiag := TDiag_dados.create(self);
  for i := 0 to fl.Items.count -1 do
   begin
    Wname := fl.Items[i] ;
    p := pos('.',Wname);
    Wname := leftstr(Wname,p-1);
    If leftstr(wname,2) <> 'DG' then
       continue;
    Wname := rightstr(Wname,length(WName)-6) ;
    If wname = '' then
       continue;
    If not Wdiag.Get_Diagrama(12,14,strtoint(Wname)) then
       deletefile(fl.filename);
   end;


end;

procedure Tfrm_main.ObjetodeInterface1Click(Sender: TObject);
begin
  MenuItemClick(Sender);
end;

procedure Tfrm_main.ObjetodeContorle1Click(Sender: TObject);
begin
   MenuItemClick(Sender);
end;

procedure Tfrm_main.ObjetosdeNegcio1Click(Sender: TObject);
begin
   MenuItemClick(Sender);
end;

procedure Tfrm_main.Atividades3Click(Sender: TObject);
begin
//    MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
   If not canc_cli then
    begin
      If frm_escativ = nil then
         frm_escativ  := tfrm_escativ.create(self);
      frm_escativ.show;
    end;

end;

procedure Tfrm_main.EventosdeNegcio1Click(Sender: TObject);
var
wprev : string;
begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  If prev then
    wprev := 'V'
  else
    wPrev := 'P';
  If frm_pen = nil then
        frm_pen:= tfrm_pen.create(self);
  FRM_PEN.iEn.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_EN','EN','') ;
  Imprime_Evento(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage);
  frm_pen.close;

end;


procedure Tfrm_main.RegrasdeNegcio2Click(Sender: TObject);
var
wprev : string;

begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;

  If canc then
     exit;
  If prev then
    wprev := 'V'
  else
    wPrev := 'P';
  If frm_pregra = nil then
     frm_pregra := Tfrm_pregra.create(self);
  frm_pregra.iRn.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_RN','','',0);
  Imprime_regra(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage);
  frm_pregra.close;
end;

procedure Tfrm_main.EntidadesExternas1Click(Sender: TObject);
var
wprev : string;
 Begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;

  If prev then
    wprev := 'V'
  else
    wPrev := 'P';
  If frm_pEntExt = nil then
      frm_pEntExt:= Tfrm_pEntExt.create(self);
  frm_pEntExt.iEe.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_CA','EE','',0) ;
  Imprime_Externo(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage);
  frm_pEntExt.close;
end;

procedure Tfrm_main.Fluxosdedados1Click(Sender: TObject)  ;
var
wprev : string;
 Begin
// MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);

   If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
   If  canc_cli then
    exit;
   If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;

  If canc then
     exit;
   If prev then
    wprev := 'V'
  else
    wPrev := 'P';


  If frm_pdata = nil then
    frm_pdata := tfrm_pdata.create(self);

   frm_pData.idado.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_DG','DG','');
   Imprime_Fluxodado(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage);
   frm_pdata.close;
end;

procedure Tfrm_main.LocaisdeProcessamento1Click(Sender: TObject);
var
  wprev : string;
Begin
// MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);

   If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;

  If prev then
    wprev := 'V'
  else
    wPrev := 'P';
    If frm_pLf = nil then
        frm_pLf:= tfrm_pLf.create(self);

    frm_pLf.iLf.OpENAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_LF','LF','',0) ;
    Imprime_LF(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage);
    frm_pLf.Close;
end;

procedure Tfrm_main.ObjetosdeInterface1Click(Sender: TObject);
var
wprev : string;
 Begin
// MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);

  wtagOi := TMenuItem(sender as Tobject).Tag;

  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  If frm_puc = nil then
     frm_puc := Tfrm_Puc.Create(self);

   If wtagOi = 2 then
      frm_puc.iOi.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_OI','OC','',0)
   else
      frm_puc.iOi.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_OI','OI','',0);
  If prev then
    wprev := 'V'
  else
    wPrev := 'P';
  Imprime_OI(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,wprev,wForceNewpage,wTagOi);
  frm_puc.close;
end;



procedure Tfrm_main.Atores1Click(Sender: TObject);
var
iCa,iPs : Tdados_tab;
I : INTEGER;
begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  If frm_pca = nil then
    frm_pca := tfrm_pca.create(self);

  try

    iCa := Tdados_tab.Create(self);
    iPs := Tdados_tab.Create(self);
    frm_pca.qrp.dataset := iCa;
    If not iCa.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_CA','CA','') then
     Raise exception.create(Mens76);
    with frm_pca do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_pca.Components[i],ica);
          end;
      end;


     iPs.DataSource := iCa.DataExt;
     iPs.Get_PaisFilhos(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'CA','PS','IDF_PS') ;

     qrDataSet(frm_pCA.Qr_ps,iPs);

     frm_Pca.titulo.caption  := uppercase(DEF51);

     If Prev then
        frm_pca.qRP.preview
     else
        frm_pca.qrp.print;
     frm_pca.close;
  finally
     freeandnil(iPs);
     freeandnil(iCa);
  end;

end;

procedure Tfrm_main.Pessoas2Click(Sender: TObject);
var
iEn : TDados_tab;
begin

  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  try
     iEn := TDados_tab.create(self);
     iEn.OpenAll(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_PS','PS','',0) ;
     If frm_pPessoa = nil then
        frm_pPessoa:= tfrm_pPessoa.create(self);
     frm_pPessoa.titulo.caption := UPPERCASE(DEF13);
     qrDataSet(frm_pPessoa.DetailBand1,iEn);
     frm_pPessoa.qrp.dataset := iEn;

     If prev then
        frm_pPessoa.qrp.preview
     else
        frm_pPessoa.Print;
     frm_pPessoa.close;
  finally
     FREEANDNIL(IeN);

  end;
end;

procedure Tfrm_main.Mecanismos1Click(Sender: TObject);
var
  iEn,iAp : Tdados_tab;
  I : INTEGER;
begin
  if CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  try
     iEn := TDados_tab.create(self);
    // iEn.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_SE','SE','') ;
    iEn.Get_MecanismosComAplic(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID) ;
     If frm_PSE = nil then
        frm_PSE:= tfrm_PSE.create(self);
     frm_PSE.titulo.caption := TmenuItem(sender as Tobject).caption;
     with frm_pse do
     begin
       for i := 0 to componentCount -1 do
       begin
         if (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],iEn);
       end;
     end;
     frm_PSE.qrp.dataset := iEn;

     iAp := Tdados_tab.Create(self);
     iAp.DataSource := iEn.DataExt;
     iAp.Get_PaiDosFilhos(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'AP','SE','IDF_AP') ;

     qrDataSet(frm_PSE.Qr_at,iAp);
     qrDataSet(frm_PSE.Qrgroup1,iEn);

     If prev then
       frm_PSE.qrp.preview
     else
       frm_PSE.qrp.Print;
     frm_pse.close ;
  finally
     FREEANDNIL(IeN);
     FREEANDNIL(iAp);
  end;
end;

procedure Tfrm_main.Elementosdedado1Click(Sender: TObject);
var
  iEn : TDados_tab;
begin
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;

  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  try
     iEn := TDados_tab.create(self);
     iEn.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_DE','DE','') ;
     If frm_pDe = nil then
        frm_pDe:= tfrm_pDe.create(self);
     frm_pDe.titulo.caption := uppercase(def26);
     qrDataSet(frm_pDe.QRBand1,iEn);
     frm_pDe.qrp.dataset := iEn;

     If prev then
        frm_pDe.qrp.preview
     else
        frm_pDe.Print;
    frm_pde.close
  finally
     FREEANDNIL(IeN);

  end;
end;



procedure Tfrm_main.AspectosCrticos2Click(Sender: TObject);
begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);
 If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
 If  frm_EscAspect    =   nil then
      frm_EscAspect    := Tfrm_EscAspect.Create(self);
      frm_escAspect.conc.tag := TmenuItem(sender as Tobject).tag;
      frm_EscAspect.caption := TmenuItem(sender as Tobject).caption;
   frm_EscAspect.showModal;
end;

procedure Tfrm_main.SobreBEST1Click(Sender: TObject);
begin
  If frm_about = nil then
     frm_about := tfrm_about.create(self);
  frm_about.show;
end;

procedure Tfrm_main.Alvosdemelhoria1Click(Sender: TObject);
begin
 If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
 If  canc_cli then
    exit;
 If  frm_EscAspect    =   nil then
      frm_EscAspect    := Tfrm_EscAspect.Create(self);
      frm_escAspect.conc.tag := TmenuItem(sender as Tobject).tag;
      frm_EscAspect.caption := TmenuItem(sender as Tobject).caption;
  // frm_escaspect.rdg3.Visible := false;
   frm_EscAspect.showModal;
end;

procedure Tfrm_main.ObjetosdeNegcio2Click(Sender: TObject);
var
  ide : Tdad;
  iOn : Tdados_tab;
  i : integer;
begin
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main);
  If  canc_cli then
    exit;
  If  frm_Cimp = nil then
     frm_Cimp := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_cimp.ckb1.Visible := true;

  frm_Cimp.showModal;
  If canc then
     exit;

  If frm_pdmig = nil then
    frm_pdmig := tfrm_pdmig.create(self);
  If wForcenewpage then
    frm_pdmig.QRGroup1.ForceNewPage := true
  else
    frm_pdmig.QRGroup1.ForceNewPage := false;
  try

  iDe := Tdad.Create(self);

  If not ide.get_allbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID) then
     Raise exception.create(mens76);
     with frm_pdmig do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) or  (Components[i] is TqrSubDetail)
              or  (Components[i] is Tqrgroup)then
              qrdataset(frm_pdmig.Components[i],iDe);
          end;
      end;

     frm_Pdmig.qrp.DataSet := ide;
     frm_Pdmig.titulo.caption  := def12;

     If Prev then
        frm_Pdmig.qRP.preview
     else
        frm_Pdmig.qrp.print;
     frm_Pdmig.close;
  finally
     freeandnil(iDe);
  end;

end;



procedure Tfrm_main.AplicaodosDados2Click(Sender: TObject);
var
  iGer,iDg,iIf,iRn : Tdados_tab;
begin
  if CurrEmpresa = nil then
    SpeedButton10Click(frm_main);
  if  canc_cli then
    exit;

  if frm_Cimp = nil then
     frm_Cimp := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;
  try
     iGer := TDados_tab.create(self);
     iGer.AplicDadosDe(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID);
     If  frm_PApde = nil then
      frm_PApde := Tfrm_PApde.Create(self);
     frm_pApde.titulo.caption := def32;
     qrDataSet(frm_paPDE.Detailband1,iger);

     frm_pApde.qrp.dataset := iger;

     iDg := TDados_tab.create(self);
     idg.DataSource := iGer.DataExt;
     iDg.AplicDadosDg(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID);
     qrDataSet(frm_paPDE.QRSubDetail1,iDg);

     iif := TDados_tab.create(self);
     iif.DataSource := iGer.DataExt;
     iif.AplicDadosIf(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID);
     qrDataSet(frm_paPDE.QRSubDetail2,iif);

     iRN := TDados_tab.create(self);
     iRN.DataSource := iGer.DataExt;
     iRN.AplicDadosRb(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID);
     qrDataSet(frm_paPDE.QRSubDetail3,iRN);

     If prev then
        frm_pApde.qrp.preview
     else
        frm_pApde.Print;
     frm_pApde.close
  finally
     FREEANDNIL(IGer);
     FREEANDNIL(Iif);
     FREEANDNIL(Idg);
     FREEANDNIL(Irn);
  end;
end;

procedure Tfrm_main.Sair1Click(Sender: TObject);
begin
  SpeedButton5Click(nil);
end;

procedure Tfrm_main.SpeedButton4Click(Sender: TObject);
begin
  If frm_TreeAtiv <> nil then
      frm_TreeAtiv.close;
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  Checa_Acesso(uppercase('frm_treeAtor'),SEGHABILIATADO,0) then
   Begin
      If frm_treeator =  nil then
        Application.CreateForm(tfrm_TreeAtor, frm_TreeAtor);
        //frm_TreeAtor := tfrm_TreeAtor.create(self);

       //frm_TreeAtor.left           := 0;
       //frm_TreeAtor.top            := 70;

       //frm_treeator.tv.align       := alLeft;
       //frm_TreeAtor.showModal;
       frm_TreeAtor.Height := 563;
       frm_TreeAtor.Width := 378;
       //frm_TreeAtor.Show;
   end;
end;

procedure Tfrm_main.Compactar1Click(Sender: TObject);
begin
  frm_main.SpeedButton10Click(frm_main);
  If  canc_cli then
    exit;
  If  Checa_Acesso(uppercase('frm_limpa'),SEGHABILIATADO,0) then
  begin
    if frm_limpa = nil then
      frm_limpa := tfrm_limpa.create(self);
    frm_limpa.showModal;
  end;
end;

procedure Tfrm_main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
//showmessage(inttostr(ord(key)));
end;

procedure Tfrm_main.Setver(const Value: string);
begin
  Fver := Value;
end;

procedure Tfrm_main.Ajuda2Click(Sender: TObject);
var
  Caminho : WideChar;
begin

  //shellexecute(handle,'open', 'Iexplore.exe C:\Best\Bin\HELP_BEST.mht','','',sw_shownormal);

 if frm_help  = nil then
     frm_help := tfrm_help.create(self);
  frm_help.show;
end;

procedure Tfrm_main.SetCanc_cli(const Value: boolean);
begin
  FCanc_cli := Value;
end;

procedure Tfrm_main.sppClick(Sender: TObject);
var
  I : integer;
begin
  AreadeInteresse1Click(nil);
end;

procedure Tfrm_main.SpeedButton3Click(Sender: TObject);
begin
  Class1Click(self);
end;

procedure Tfrm_main.Backup1Click(Sender: TObject);
var
  wtxt,wzip,wn : string;
begin
 {If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;

  If frm_exdir = nil then
   frm_exdir := tfrm_exdir.create(self);
  frm_exdir.edit2.visible := false;
  frm_exdir.showmodal;
  If length(lb_cli.caption) < 3 then
   wn := lb_cli.Caption
  else
   wn := copy(lb_Cli.caption,1,3);
  If not frm_main.Dir_canc then
   Begin
    bdx.Connected := false;
    wzip := frm_main.Back  + '\'+wn+formatdatetime('yymmddhhmmss',now)+'.zip';;

    wtxt := wzip+' '+bdx.dirFluxo+'*.add '+ bdx.dirFluxo+'*.mdb';
    ShellExecute(0,nil, 'wzzip.exe' ,pChar(wtxt),nil,sw_showmaximized);
    Showmessage(mens96+ frm_main.back);

   end;     }

end;

procedure Tfrm_main.SetBack(const Value: string);
begin
  FBack := Value;
end;

procedure Tfrm_main.SetDir_canc(const Value: boolean);
begin
  FDir_canc := Value;
end;

procedure Tfrm_main.SetlastDir(const Value: string);
begin
  FlastDir := Value;
end;

procedure Tfrm_main.SS2MaxUsers(Sender: TObject);
begin

  // If ss2.UsersCount > ss2.Counter then
    begin
      wlib   := false;
      Wusers := true;
    end;


end;

procedure Tfrm_main.SS2Terminate(Sender: TObject);
begin
 { If ss2.lastSSerror > 0 then
     begin
       case ss2.lastSSerror of
       10 : showmessage('010  Invalid code: the code entered in the registration dialog is empty.');
       11 : showmessage('011  Invalid code: the code entered in the registration dialog has illegal characters. The only permitted ones are 0-9 and A-F.');
       12 : showmessage('012  Bad CRC in code entered in the registration dialog. The most common causes are: '+#13+'1) a character has been mistyped, 2) you have generated a code for a different application 3) License files were deleted, or application was reinstalled after getting the customer code, so the system seed number has changed.');
       133 : showmessage('133 System date/time manipulation: '+#13+'SafeSerial has detected that date/time has been moved backwards from the last run.'+#13+'This can be intentional in time-limited licenses. SafeSerial only displays an error if the difference is greater than 15 minutes, since in a network different workstations may have different times.');
       141 : showmessage('141 Access denied to Windows directory: Read/write access to Windows directory is required.');
       142 : showmessage('142 Access denied to the application directory: Read/write access to the application’s main directory is required. This is the same directory of the executable.');
       201 : showmessage('201 Wrong Disk: This error will happen when customer tries to restore a License with SafeImport from a disk that has been copied/manipulated.');
       202 : showmessage('202 Floating license required for this operation: You are trying to use a function which is only available with floating license, but Network property is set to false.');
       701 : showmessage('701 Invalid path: A protected application is being run from an UNC path (e.g \\servername\drive\path\ type). SafeSerial can’t allow a protected application to be run without a mapped drive.');
       904 : showmessage('904 Error writing to disk: Disk is write protected, has a format error or disk drive is locked.');
     else
       showmessage('Erro '+inttostr(ss2.LastSSerror) );
     end ;
     end;  }

end;

procedure Tfrm_main.SetNOme_back(const Value: string);
begin
  FNOme_back := Value;
end;

procedure Tfrm_main.AtorxAtividade1Click(Sender: TObject);
var
  iCa ,iAp: Tdados_tab;
  I : INTEGER;
begin
//MessageBox(Application.Handle,'Disponível apenas na versão completa do sistema','BEST', MB_ICONINFORMATION + MB_OK);

  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;
  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;
  If canc then
     exit;

  iCa := Tdados_tab.Create(self);
  iAp := Tdados_tab.Create(self);
  iAp.DataSource := iCa.DataExt;

  //qrDataSet(frm_patorat.qr_at,iAp);
  If frm_patorat = nil then
    frm_patorat := tfrm_patorat.create(self);

  try
     frm_patorat.db2.DataSet := iAp;
    //frm_patorat.qrp.dataset := iCa;
    iCa.OpenAllbyDesc(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'IDF_CA','','');
    iAp.Get_PaiDosFilhos(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'AP','CA','IDF_AP') ;

    qrDataSet(frm_patorat.DB2,iAp);
   with frm_patorat do
      begin
          for i := 0 to componentCount -1 do
         begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_patorat.Components[i],ica);
          end;

      //titulo.caption  := uppercase(def105);
      If Prev then
        qRP.preview
     else
       qrp.print;
      close;
      end;

  finally
   //  freeandnil(iPs);

  end;

end;

procedure Tfrm_main.AtividadesxObjetosdeInterface1Click(Sender: TObject);
var
  Wwbs ,ruc,ruc1: string;
  iOi,iSe: Tdados_tab;
  iAp : Tap;
  i : integer;
begin
  If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;

  If  canc_cli then
    exit;
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;
  frm_Cimp.showModal;


  If canc then
     exit;

   iAp := Tap.create(self);
   //DBgrid1.DataSource := iap.DataExt;
   iAp.AtivPr(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,
              'AP','',0,1)  ;

  If frm_patoi = nil then
    frm_patoi := Tfrm_patoi .create(self);

  frm_patoi.qrp.DataSet := iAp;
  with frm_patoi do
  begin
    for i := 0 to componentCount -1 do
      begin
        If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_patoi.Components[i],iAp);
      end;
  end;

  frm_patoi.Titulo.caption := def34;
  frm_patOI.pr_cli.caption     :=  frm_main.lb_cli.caption;
  frm_patOI.pr_proj.caption    :=  frm_main.lb_cen.caption;

    try
     //ator
     iOi := TDados_tab.create(self);
     iOi.DataSource := iAp.DataExt;
     ioI.Get_OI(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID) ;
     qrDataSet(frm_pAtOI.Qr_OI,ioI);

{     ise := TDados_tab.create(self);
     ise.DataSource := iAp.DataExt;

     ise.Get_SE(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'AP',) ;
     qrDataSet(frm_pAtOI.Qr_se,ise); }
      if PREV then
        frm_patOI.QRP.preview
      else
        frm_patOI.QRP.print;
      frm_patOI.close;
   finally
      FreeAndNil(ioI);
      FreeAndNil(iAp);
   end;
end;

procedure Tfrm_main.Setitab(const Value: Tdados_tab);
begin
  Fitab := Value;
end;

procedure Tfrm_main.SetViewer(const Value: boolean);
begin
  FViewer := Value;
end;

procedure Tfrm_main.ConverterBancoparaverso6001Click(Sender: TObject);
var
  bdxnovo :TBd;
  DirNovo : string;
  i,j : integer;
  TableList : Tstrings;
  FieldList : Tstrings;
  sqlList   : tstrings;
begin
   TableList := TStringList.create;
   FieldList := TStringList.create;
   SqlList:= TStringList.create;
   bdxNovo := TBD.create(false,true,true);
   BdxNovo.Connected := false;
   Dirnovo := ExtractFilePath(bdx.Dirbanco);
   DirNovo := DirNovo + 'CASE2000.MDB';
   BdxNovo.provider         := 'Microsoft.Jet.OLEDB.4.0';
   BdxNovo.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DirNovo+';Persist Security Info=False';
   BdxNovo.connected := true;
   bdxNovo.GetTableNames(TableList,false);
   for i := 0 to TableList.Count -1 do
    Begin
     bdx.GetFieldNames(TableList[i], FieldList);
     for j := 0 to FieldList.count - 1 do
      Begin
        If j = FieldList.count -1 then
           SqlList.add(FieldList[j])
        else
           SqlList.add(FieldList[j]+',');
      end;
     with TadoQuery.Create(self) do
      Begin
       close;
       sql.Clear;
       connection := bdxnovo;
       sql.add('SELECT * FROM '+''+tableList[i]+'');
       open;
       while not eof do
        Begin


         next;
        end;
      end;
    end;
end;

procedure Tfrm_main.ConfiguraoAtual1Click(Sender: TObject);
var
wbanco : string;
begin
 { TODO -c6-00-0029b : 
Help : mostra o banco de dados em uso
Inobe Backip quando banco é SQL. }
If bdx.TIPOBANCO = 0 then    //access
 wbanco := 'Access : '+ bdx.Dirbanco
else
If bdx.TIPOBANCO = 1 then  //sql.server
 wbanco := 'SQL Server : '+ bdx.Servidor;
  showmessage(def35+bdx.DirFluxo+#13+ wbanco);

end;

procedure Tfrm_main.Consistencia1Click(Sender: TObject);
 Begin
  If CurrEmpresa = nil then
       SpeedButton10Click(frm_main) ;
     If canc_cli then
       exit;
  COnsiste_tudo(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID);
 end;

function Tfrm_main.COnsiste_tudo(pCli,pProj : integer) : boolean;
var
iTemp : TTemp;
wcli,wproj : integer;
begin
 { frm_main.SpeedButton10Click(frm_main);
  If frm_check = nil then
     frm_check := tfrm_check.create(self);
  frm_check.Label1.caption := frm_main.lb_cli.caption;
  frm_check.Label2.caption := frm_main.lb_cen.caption;
  frm_check.showModal;    }
  result := true;


  itemp := TTemp.create(self);
  itemp.del_temp;
  Consiste_Modelo(pcli,pProj);


    with iTemp do
      Begin
         get_all;
         If not eof then
          Begin
             result := false;
             If frm_pConsistdg     = nil then
                frm_pConsistdg       := Tfrm_pConsistdg .create(self);

             With frm_pCOnsistDg do
              Begin
                qrp.DataSet := iTemp;
                qrdataset(db,itemp) ;
                qrdataset(gr,itemp) ;
                qrp.preview;
                Close;
              end;
          end;
         
      end;
end;

procedure Tfrm_main.SpeedButton6Click(Sender: TObject);
begin
  compactar1Click(nil);
end;

procedure Tfrm_main.SetWdemo(const Value: boolean);
begin
  FWdemo := Value;
end;

procedure Tfrm_main.SetWQTDEMO(const Value: INTEGER);
begin
  FWQTDEMO := Value;
end;

procedure Tfrm_main.Setwfecha(const Value: boolean);
begin
  Fwfecha := Value;
end;

procedure Tfrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  wdir : string;
  widiom : TStringList;
begin
  try
     If wdemo then
        Showmessage (def8881+#13+#13+def36+#13+ ' - e-mail best.suporte@5a.com.br '+ #13+
                     '-  site http://www.mytech.com.br/');
     wIdiom := TstringList.Create ;
     wdir := ExtractFileDir(application.exename);;
     widiom.Add(IDIOMA);
     widiom.SaveToFile(wdir +'\'+'Idiom.ini');

  finally
     widiom.Free;
  end;
end;

procedure Tfrm_main.SetWQTATIV(const Value: integer);
begin
  FWQTATIV := Value;
end;

procedure Tfrm_main.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  TImage(sender as Tobject).Cursor :=  crHandPoint ;
end;

procedure Tfrm_main.SetwPerc_Custo(const Value: real);
begin
  FwPerc_Custo := Value;
end;

procedure Tfrm_main.Image4Click(Sender: TObject);
begin
  try
   begin
     If frm_logo <> nil then
      frm_logo.close;
     If frm_treeCusto = nil then
        frm_treeCusto := Tfrm_treeCusto.Create(self);
     freeandnil(tv);
     
     frm_treeCusto.showModal;
   end;
  except
   begin
     frm_treeCusto.close;
     raise;
   end;
  end;
end;

procedure Tfrm_main.Setwtagoi(const Value: integer);
begin
  Fwtagoi := Value;
end;

function Tfrm_main.Checa_Icelicenca : boolean;
const
  Raiz  : String = 'Software\Best72\viaLactea';
var
  RegLicenca  : TRegistry;

  aquila  : String;     // Máquina
  crater  : String;     // Data da validade para o caso de aluguel
  fornax  : String;     // Quantidade de Licença Modeler
  lupus  : String;     // Quantidade de Licença Viewer

  nFornax  : String;
  nLupus  : String;
begin
  RegLicenca := TRegistry.Create;
  RegLicenca.RootKey := HKEY_CURRENT_USER;
  nFornax := '0';
  nLupus := '0';
  if not RegLicenca.OpenKey(Raiz, false) then
  begin
    ValidaBEST := TValidaBEST.Create(self);
    ValidaBEST.ShowModal;
  end
  else
  begin
    aquila := DesEncripta(RegLicenca.ReadString('aquila'), 'Best72');
    crater := DesEncripta(RegLicenca.ReadString('crater'), 'Best72');
    fornax := DesEncripta(RegLicenca.ReadString('fornax'), 'Best72');
    lupus := DesEncripta(RegLicenca.ReadString('lupus'), 'Best72');
    serpens := DesEncripta(RegLicenca.ReadString('serpens'), 'Best72');

    if aquila <> 'Livre' then
    begin
      // Vamos checar se a máquina é a mesmo
      if aquila <> SerialDiscoHexa then
      begin
        ValidaBEST := TValidaBEST.Create(self);
        ValidaBEST.ShowModal;

        aquila := DesEncripta(RegLicenca.ReadString('aquila'), 'Best72');
        crater := DesEncripta(RegLicenca.ReadString('crater'), 'Best72');
        fornax := DesEncripta(RegLicenca.ReadString('fornax'), 'Best72');
        lupus := DesEncripta(RegLicenca.ReadString('lupus'), 'Best72');
        serpens := DesEncripta(RegLicenca.ReadString('serpens'), 'Best72');
      end;

      // Agora vamos checar o caso do aluguel
      if (serpens = 'A') or (serpens = 'D') then
      begin
        if Now > StrToDate(crater) then
        begin
          ValidaBEST := TValidaBEST.Create(self);
          ValidaBEST.ShowModal;

          aquila := DesEncripta(RegLicenca.ReadString('aquila'), 'Best72');
          crater := DesEncripta(RegLicenca.ReadString('crater'), 'Best72');
          fornax := DesEncripta(RegLicenca.ReadString('fornax'), 'Best72');
          lupus := DesEncripta(RegLicenca.ReadString('lupus'), 'Best72');
          serpens := DesEncripta(RegLicenca.ReadString('serpens'), 'Best72');
        end;
      end;

      If Viewer = false then
      begin
      //Licença Modeler
        nFornax := IntToStr(checaLicencaModelo('-', StrToInt(fornax)));
        RegLicenca.WriteString('fornax',Encripta(nFornax,'Best72'));
      end
      else
      begin
      //Licença Reader
        nLupus := IntToStr(checaLicencaVisao('-', StrToInt(lupus)));
        RegLicenca.WriteString('lupus',Encripta(nLupus,'Best72'));
      end;
    end
    else
    begin
      nFornax := '999';
      RegLicenca.WriteString('fornax',Encripta(nFornax,'Best72'));
      nLupus := '999';
      RegLicenca.WriteString('lupus',Encripta(nLupus,'Best72'));
    end;
  end;
  RegLicenca.CloseKey;
  RegLicenca.Free;
end;

procedure Tfrm_main.SetLicencaOK(const Value: boolean);
begin
  FLicencaOK := Value;
end;

procedure Tfrm_main.SetMensAbout(const Value: string);
begin
  FMensAbout := Value;
end;

procedure Tfrm_main.ConfiguraodeOBjetos1Click(Sender: TObject);
begin
If  Checa_Acesso(uppercase('frm_cfg'),SEGHABILIATADO,0) then
  Begin
    If frm_cfg = nil then
       frm_cfg := tfrm_cfg.create(self);
    frm_cfg.showmodal;
  end;

end;

procedure Tfrm_main.Diretrio1Click(Sender: TObject);
begin
  freeandnil(BDx);
  freeandnil(Empresas);
//  freeandnil(CurrEmpresa);
  freeandnil(Scenario);
  freeandnil(Atividades);
  freeandnil(CurrAtiv );
  freeandnil(Dominios);
  freeandnil(Tab);

  lb_cen.Caption := '';

   while not Abre_banco(true) do
   begin
     if para then
     begin
       bdx := nil;
       close;
       application.Terminate;
       break;
     end;
   end;
   frm_main.FormShow(sender);
   if frm_treeativ <> nil then
   Begin
       frm_treeativ.Close;
   End;
end;

procedure Tfrm_main.IntegraodosDiagramas1Click(Sender: TObject);
begin
  If frm_check     = nil then
     frm_check      := Tfrm_check .create(self);
  frm_check .showmodal;
end;

procedure Tfrm_main.Setwassist(const Value: boolean);
begin
  Fwassist := Value;
end;

procedure Tfrm_main.Setlanguag(const Value: integer);
begin
  Flanguag := Value;
end;

procedure Tfrm_main.ImportarDimenses1Click(Sender: TObject);
begin
  If  Checa_Acesso(uppercase('frm_impDim'),SEGHABILIATADO,0) then
    Begin
      If frm_impdim     = nil then
        frm_impdim      := Tfrm_impdim .create(self);
      frm_impdim .showmodal;
    end;
  
end;

procedure Tfrm_main.SetPARA(const Value: boolean);
begin
  FPARA := Value;
end;

procedure Tfrm_main.SetULT_DIR(const Value: string);
begin
  FULT_DIR := Value;
end;

procedure Tfrm_main.SetWBS(const Value: boolean);
begin
  FWBS := Value;
end;

procedure Tfrm_main.ImportaodeDiagramas1Click(Sender: TObject);
 begin
  iDgNovo                := Tdg.create;
  Importar_Diagramas;
 end;

procedure Tfrm_main.Importar_Diagramas;
begin
try
 If CurrEmpresa = nil then
      SpeedButton10Click(frm_main) ;

 //cria novo banco de dados para importação
 If BDIMport = nil then
    BDImport := TBD.Create(true,false,false);

  iDiagImport            := TDiag_dados.create(self);
  iDiagImport.Connection := bdImport;
  iDgImport              := Tdg.create;

  If frm_EsccliImport   = nil then
    frm_esccliImport := Tfrm_EsccliImport.create(self);
  frm_esccliImport.BD := BDImport;

  // objeto contendo os dados da escolha do cenario a importar
  empImport := frm_esccliImport.EMP;

  frm_EsccliImport.showmodal;
  If frm_main.Canc_cli then
    exit;

  If frm_log = nil then
   frm_log := Tfrm_log.create(self);
  frm_log.caption := 'Andamento das Importações';
  //frm_log.panel1.visible := false;
  frm_log.BorderIcons := [biSystemMenu,biMaximize];
  frm_log.Memo1.Clear;
  frm_log.show;

  //salva os dados a importar
  Mostra_mensagem( def7772 );

  If not Salvar_diretorio(bdx,bdImport) then
    begin
     Mostra_mensagem( mens132);
     exit;
    end;
  //cria os atributos (PK) novos na área temporária

  Mostra_mensagem(def7773);
  Cria_ChaveDupl;

  //importa diagramas e atividades;
  Importa_Diagramas(bdx,bdImport,EmpImport);

  Mostra_mensagem(mens135);
finally
// If frm_log <> nil then
//  frm_log.close;
If BDImport <> nil then
 begin
   BDImport.Connected := false;
   freeandnil(bdimport);
 end;
end;
end;


procedure Tfrm_main.Importa_diagramas(pBd,pbdImport : Tbd;pempImport : Tempresa);   //
var
oList : TList;
j,WPAINOVO,wpaiAntigo : integer;
widgnovo : integer;
iDiagZero : TDiag_dados;
 begin

   //abre todos os diagramas do cenario origem
   iDiagImport.Open_todosCli(pEmpImport.cenarios.cli_id,pEmpimport.cenarios.prj_id,'DPN',TRUE);
   If iDiagImport.Eof   then
      raise exception.create(Mens138);
   //frm_log.pg.Visible := true;
   //frm_log.pg.Max      := iDiagImport.TOTDIAGRAMAS;
   //frm_log.pg.Position := 0;
   //diagramas 0
   while not iDiagImport.Eof do
    begin
        // inclui o diagrama nível 0 importado no banco atual
        iDiagZero:= Inclui_Diagrama(iDiagImport,0,0);
        iDiagImport.Next;
    end;

   // Importa tabelas não gráficas
   Mostra_mensagem(def2131);
   Importa_NaoGraficos (pEmpImport.cenarios.CLI_ID,pEmpImport.cenarios.PRJ_ID);

   //Criar correlações
   Mostra_mensagem(def2132);
   Importar_Corr(pEmpImport.cenarios.CLI_ID,pEmpImport.cenarios.PRJ_ID);


 end;

      //inclui tabelas não gráficas
function Tfrm_main.Importa_NaoGraficos(pCli,pProj : integer) : boolean;
var
iTabImport,iTab : Tdados_tab;
i,IDNovo,wCod : integer;
existe : boolean;
 begin
    iTabImport := TDados_tab.create(self);
    iTabImport.Connection := BDImport;

    iTab := TDados_tab.create(self);
    iTab.Connection := BDx;

    // inclui os Objetos gerais não gráficos
    for i := 0 to length(DPNNaoGraficoGer) - 1 do
     begin
      iTabImport.Open_Objetos(pCli,pProj,DPNnaoGraficoGer[i]) ;
      while not iTabIMport.eof do
       begin
        If DPNnaoGraficoGer[i] = 'IDF_TX' then
         begin

         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGraficoGer[i]) = 0 then
           begin
              IdNovo := Incluir_TX(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGraficoGer[i]);// then
                free;
              end;
           end;
         end
        else
        If DPNnaoGraficoGer[i] = 'IDF_PS' then
         begin

         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGraficoGer[i]) = 0 then
           begin
              IdNovo := Incluir_ps(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGraficoGer[i]);// then
                free;
              end;
           end;
         end
        else
        //verifica se a tabela já existe (pode já existir no modelo destino ou já ter sisdo importado)
        If DPNnaoGraficoGer[i] = 'IDF_DADOS' then
         begin
          with TDad.create(self) do
          begin
           connection := bdx;
           CLI_ID := CurrEmpresa.cenarios.CLI_ID;
           PRJ_ID := CurrEmpresa.cenarios.PRJ_ID;
           existe := Get_dados(iTabImport.fieldbyname('IDF_TABELA').asstring);
           free;

          end;
         If Existe then
            begin
                wmens := AnsireplaceStr(Mens139,'&',iTabImport.fieldbyname('IDF_TABELA').asstring);
                Mostra_erro(nil,nil,wmens);
             end
         else
           begin
           //inclui a tabela inteira (todos os atributos)
           with Tdad.create(self) do
            begin
             Connection := BDImport;
             CLI_ID := pCli;
             PRJ_ID := pProj;
             Get_dados (iTabImport.fieldbyname('IDF_TABELA').asstring);
             while not eof do
              begin
               If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGraficoGer[i]) = 0 then
                 begin
                    IdNovo := Incluir_DAD(iTabImport,nil);
                    with Tdados_tab.create(self) do
                    begin
                      Connection := BDImport;
                      Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGraficoGer[i]);// then
                      free;
                    end;
                 end;
               next;
              end;
             free;
            end;
           end;
         end
        else
        If DPNnaoGraficoGer[i] = 'TI_REQ' then
         begin
          wCod := itabImport.fieldbyname('TI_CODIGO').asinteger  ;
          wCod :=  JaImportado(pCli,pProj,wCod,'IDF_AP') ;

         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGraficoGer[i]) = 0 then
           begin
              IdNovo := Incluir_REQ(iTabImport,nil,wCod);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGraficoGer[i]);// then
                free;
              end;
           end;
         end;
        iTabImport.Next;
       end;
     end;

     // importa objetos não gráficos correlacionados

    for i := 0 to length(DPNNaoGrafico) - 1 do
     begin
      iTabImport.Open_Objetos(pCli,pProj,DPNnaoGrafico[i]) ;
      while not iTabIMport.eof do
       begin
        If DPNnaoGrafico[i] = 'IDF_CA' then
         begin
         If JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGrafico[i]) = 0 then
           begin
              IdNovo := Incluir_EE(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGrafico[i]);// then
                free;
              end;
           end;
         end
        else
        If DPNnaoGrafico[i] = 'IDF_DE' then
         begin
         If JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGrafico[i]) = 0 then
           begin
              IdNovo := Incluir_DE(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGrafico[i]);// then
                free;
              end; 
           end;
         end
        else
         If DPNnaoGrafico[i] = 'IDF_LF' then
         begin
         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGrafico[i]) = 0 then
           begin
              IdNovo := Incluir_LF(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGrafico[i]);// then
                free;
              end;
           end;
         end
         else
         If DPNnaoGrafico[i] = 'IDF_EV' then
         begin
         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGrafico[i]) = 0 then
           begin
              IdNovo := Incluir_EV(iTabImport,nil);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGrafico[i]);// then
                free;
              end;
           end;
         end
         else
         If DPNnaoGrafico[i] = 'IDF_SE' then
         begin
         wCod := itabImport.fieldbyname('IDF_COD_APLIC').asinteger  ;

         with TDados_tab.creATE(SELF) do
          begin
           Connection := BDImport;
           wCod :=  JaImportado(pCli,pProj,wCod,'IDF_TX') ;
           free;
          end;

         If  JaImportado(pCli,pProj,itabImport.fieldbyname('IDF_CODIGO').asinteger,DPNnaoGrafico[i]) = 0 then
           begin
              IdNovo := Incluir_SE(iTabImport,nil,wCod);
              with Tdados_tab.create(self) do
              begin
                Connection := BDImport;
                Atualiza_IdNovo(pCli,pProj,iTabImport.fieldbyname('IDF_CODIGO').ASINTEGER ,IDNovo, DPNnaoGrafico[i]);// then
                free;
              end;
           end;
         end ;
        iTabImport.Next;
       end;
     end;
 end;

function Tfrm_main.Jaimportado(pCli,pProj,pId : integer;ptab : string) : integer;
var
iTabImport : TDados_tab;
 begin
  itabImport := TDados_tab.create(self);
  itabImport.Connection := BDImport;
     //verifica se objeto já não foi criado ( verifca na BD Temp origem : ID : IDF_CODIGO_NOVO
  result :=  itabImport.Existe_IdNovo(pCli,pProj,pId,pTab);
 end;

      //cria as novas correlaçõles
function Tfrm_main.Importar_corr(pCli,pProj : integer) : boolean;
var
iCorrAnt,iTabant,iTab : Tdados_tab;
wpai,wfilho : integer;
wtipopai,wtipofilho,wTab : string;
 begin

  iCorrAnt := TDados_tab.create(self);
  iCorrant.Connection := BDImport;

  iTabAnt := TDados_tab.create(self);
  iTabant.Connection := BDImport;

  iTab := TDados_tab.create(self);
  iTab.Connection := BDx;

  iCorrant.Get_TodasCorrelacoes(pCli,pProj);
  while not iCorrant.eof do
   begin

    wtipopai := iCorrant.fieldbyname('PAI_TIPO').asstring ;

    wtab := 'IDF_'+wTipoPai ;
    If (wTipoPai = 'EE') or (wTipoPai = 'OG') then
     wtab := 'IDF_CA';
    If wTipoPai = 'OC'  then
     wtab := 'IDF_OI';

    iTabAnt.Open_Objeto(pCli,pProj,iCorrant.fieldbyname('PAI_ID').asinteger,WTAB);
    wpai := iTabAnt.fieldbyname('IDF_CODIGO_NOVO').asinteger;

    wtipoFilho := iCorrant.fieldbyname('FILHO_TIPO').asstring ;

    wtab := 'IDF_'+wTipoFilho ;

    If (wTipoFilho = 'EE') or (wTipoFilho = 'OG') then
     wtab := 'IDF_CA';
    If wTipoFilho = 'OC'  then
     wtab := 'IDF_OI';
    iTabAnt.Open_Objeto(pCli,pProj,iCorrant.fieldbyname('FILHO_ID').asinteger,wTab);
    wFilho := iTabAnt.fieldbyname('IDF_CODIGO_NOVO').asinteger;


    iTab.Cria_Correlacao(CurrEmpresa.cenarios.CLI_ID,CurrEmpresa.cenarios.PRJ_ID,
                         wTipoPai,wpai,wTipoFilho,wFilho,
                         iCorrant.fieldbyname('ATOR_CATEGORIA').asstring,
                         iCorrant.fieldbyname('PERC_CUSTO').asinteger,
                         iCorrant.fieldbyname('PERC_CODIGO').asinteger );

    iCorrant.Next;
   end;
 end;

function Tfrm_main.Atua_Chave_Diag(pDiagImport : TDiag_dados; pDiag : TDiag_dados) : boolean;
 begin
  // atualiza as chaves novas no diagrama do cenario origem
  with TDiag_dados.create(self) do
   begin
    connection := bdimport;
    CLI_ID := EmpImport.cenarios.CLI_ID;
    PRJ_ID := EmpImport.cenarios.PRJ_ID ;
    IDG_ID := pDiagImport.fieldbyname('IDG_ID').asinteger;
    Atualizar_IDnovo(pDiag.IDG_ID,pDiag.DIAG_ID);
    free;
   end;
 end;

         // inclui diagrama na base nova a partir da base origem
function Tfrm_main.Inclui_Diagrama(pDiagImport : TDiag_dados;pIdgId,pDiag_pai_id : integer) : TDiag_dados;
var
iDiagIncluido : TDiag_dados;
iDgOrigem : Tdg;
begin
try
  iDiagIncluido            := TDiag_dados.create(self);
  iDiagIncluido.Connection := Bdx;
  Result := nil;
 // Mostra_mensagem(def3801 + pDiagImport.fieldbyname('SUB_NOME').ASSTRING);

  with iDiagIncluido do
   begin
      IDG_ID       :=  pIdgId;
      CLI_ID       :=  CurrEmpresa.cenarios.CLI_ID;
      PRJ_ID       :=  CurrEmpresa.cenarios.PRJ_ID;
      DIAG_PAI_ID  :=  pDiag_Pai_id;//pDiagImport.fieldbyname('DIAG_PAI_ID').asinteger;
      SUB_NOME     :=  pDiagImport.fieldbyname('SUB_NOME').ASSTRING;
      IDG_DIR      :=  pDiagImport.fieldbyname('IDG_DIR').ASSTRING;
      IDG_NIVEL    :=  pDiagImport.fieldbyname('IDG_NIVEL').asinteger;

      // copia o diagrama .add do origem para o destino, com novo nome
      If not FileExists(BDImport.DirFluxo+PDiagImport.fieldbyname('DIAG_ID').asstring) then
       begin
        wMens := AnsireplaceStr(Mens136,'&',BDImport.DirFluxo+PDiagImport.fieldbyname('DIAG_ID').asstring);
        Mostra_erro(nil,nil,wmens);
        exit;
       end
       else
       criar(iDiagIncluido);
       //frm_log.pg.Position := frm_log.pg.Position + 1;
       //frm_log.pg.Repaint;
       Copia_Arquivo(BDImport.DirFluxo+PDiagImport.fieldbyname('DIAG_ID').asstring,BDX.DirFluxo+iDiagIncluido.DIAG_ID );

       If iDiagIncluido <> nil then
          begin
          wMens  := AnsireplaceStr(def352,'&',SUB_NOME);
        //  Mostra_mensagem(wMens);
          idgImport.IDG := iDiagIncluido.IDG_ID;
        //  Mostra_mensagem(def214 + iDiagIncluido.SUB_NOME);

          iDgOrigem := Tdg.create;
         //carrega o diagram origem
          iDgOrigem.LoadFile(BDImport.DirFluxo+PDiagImport.fieldbyname('DIAG_ID').asstring);

          // importa os objetos do origem para o destino (novo)
           Importa_Objetos(iDgOrigem,iDiagIncluido,BDImport.DirFluxo+PDiagImport.fieldbyname('DIAG_ID').asstring);
          // atualiza as chaves novas no diagrama do cenario origem
           Atua_Chave_Diag(pDiagImport,iDiagIncluido);
          end;

      result := iDiagIncluido;

   end;
except
  raise;
end;

end;

procedure Tfrm_main.Inicializa_Diag(pDiag : Tdg);   // colocar como logical todos os objetos do diagrama novo
var
i,j : integer;
oList : TList;
 begin
    oList := pDiag.Get_ObJetos();
    for i := 0 to oList.Count-1 do
     begin
       mListaObj := oList[i];
       mListaObj.eNode.Logical := true;
       for j := 1 to  mListaObj.eNode.links.count do
           mListaObj.eNode.links.Item(j).Logical := true;
     end;
 end;


function Tfrm_main.Importa_objetos(pDgImport : Tdg;pDiag : TDiag_dados;pNomeDiagImport : string) : boolean;   // le o diagrama e inclui no banco atual
var
oListImport,oList : TList;
i,j,wind,IDnovo : integer;
iTab,iTabImport : Tdados_tab;
wtb,wNomeDiagNovo : string;
begin
result := false;
try
 try
   iTab := TDados_tab.create(self);
   iTab.Connection := BDx;

   iTabImport := TDados_tab.create(self);
   iTabImport.Connection := BdImport;

   oListImport := pDgImport.Get_ObJetos();
   If oListImport.Count = 0 then
         begin
         //  Mostra_mensagem(def2141 + pDiag.SUB_NOME);
           exit;
         end;
   for i := 0 to oListIMport.Count-1 do
    begin
       mListaObj := oListImport[i];
       begin
         // atividade
         begin
              begin
               If mListaObj.eNode = nil then
                 exit;

               If pDiag.IDG_DIR = 'DPN' then
                begin
                   wInd := In_Arrayn(mListaObj.eNode.Shape,wObj_Shape);
                   If (wind < 0)  then
                    begin
                      Mostra_erro(mListaObj.eNode,nil,Mens128);
                      continue;
                    end;

                  wTb := wTab[wind];

                end
               else
               If pDiag.IDG_DIR = 'DUC' then
                begin
                   wInd := In_Arrayn(mListaObj.eNode.Shape,wObj_Shape_uc);
                   If (wind < 0)  then
                    begin
                      Mostra_erro(mListaObj.eNode,nil,Mens128);
                      continue;
                    end;

                  wTb := wTab_uc[wind];

                end ;

              result := true;

              // abre a atividade no cenario origem
              iTabImport.Open_objeto(EmpImport.cenarios.CLI_ID,EmpImport.cenarios.PRJ_ID,mListaObj.eNode.userdata,wTb);

               // cria nova instancia da atividade no cenario destino
              IDNovo :=Cria_NovaAtiv(itabImport,mListaObj.eNode,pDiag,wTb);

                 // atualiza a nova chave da atividade no diagrama origem
              If not iTabImport.Atualiza_IdNovo(EmpIMport.cenarios.CLI_ID,
                                                EmpIMport.cenarios.PRJ_ID,
                                                iTabImport.IDF_CODIGO ,
                                                IDNovo,
                                                wTb) then
                 Mostra_erro(mListaObj.eNode,nil,Mens130);

              end;
          end;
        end;

    end;


  except
    frm_log.close;
    raise;

  end;
 finally
   freeandnil(iTab);
   freeandnil(iTabImport);
 end;
 end;

// atualiza o userdata do node no diagrama destino
procedure TFrm_main.Atualiza_Fluxos(pDg : Tdg ;pNode : afNode;pDiag : TDiag_dados);  //cria PK de fluxos de dados no destino
var
i,j,k,IdNovo,IdAtual : integer;
oList : TList;
mList : uLst     ;
iFlux : TIdf_dg;
iDgImport,iDad  : Tdados_tab;


 begin
 try
  oList := pDg.Get_Nodes(pNode,' ');  // pega os links entrando e saindo do node

  for i := 0 to oList.Count-1 do
   begin
      mLst := oList[i];

     If mLst^.elnk = nil then
       continue;
     If mLst^.elnk.LinkStyle in cFluxos then
      begin
       IdAtual              :=  mLst^.elnk.UserData ;
       iDgImport            :=  Tdados_tab.create(self) ;
       iDgImport.Connection :=  BdImport;
       If not iDgImport.Open_objeto(EmpImport.cenarios.CLI_ID,
                                    EmpImport.cenarios.PRJ_ID,
                                    IDAtual,'IDF_DG') then
          begin
            Mostra_erro(nil,mLst^.elnk,Mens129);
            continue;
          end;
      idad := Tdados_tab.create(self);
      idad.Connection := BdImport;
      IDNovo := JaIMportado (EmpImport.cenarios.CLI_ID,EmpImport.cenarios.PRJ_ID,IDAtual,'IDF_DG') ;
      If IDNovo = 0 then
         IDNovo := Inclui_Fluxo(IdgImport,pDiag.IDG_ID);

      // atualiza userdata dos links saindo de pNode
      If mLst^.elnk.Logical then
         begin
           mLst^.elnk.UserData := IDNovo;
           mLst^.elnk.Logical := false;
           // atualiza a chave novo do cenario origem
           If not idad.Atualiza_IdNovo(EmpImport.cenarios.CLI_ID,EmpImport.cenarios.PRJ_ID,
                              IDAtual ,IDNovo,'IDF_DG') then
           Mostra_erro(nil,mLst^.elnk,Mens130);
         end;

      end; // link sahpe

   end; //end for
finally
 { If oList <> nil then
     freeandnil(oList);
  If idad <> nil then
     freeandnil(idad);
  If iDgImport <> nil then
     freeandnil(iDgImport);}
end;
end; //GERAL

function TFrm_main.Inclui_Fluxo(pIDgImport : Tdados_tab; pId : integer) : integer;
var
iFlux : TIdf_dg;

 begin
 try
   iFlux := TIdf_dg.create(self);
   iFlux.Connection := BDx;
   result := 0;
   with iFlux do
        begin
           CLI_ID                                    :=  CurrEmpresa.cenarios.CLI_ID;
           PRJ_ID                                    :=  CurrEmpresa.cenarios.PRJ_ID;
           SUB_NIVEL                                 :=  pID;//.fieldbyname('IDG_ID').asinteger;
           SUB_ID                                    :=  piDgImport.fieldbyname('SUB_ID').asinteger;
           IDG_ID                                    :=  piDgImport.fieldbyname('IDG_ID').asinteger;
           IDF_VOLUME_PROC2                          :=  piDgImport.fieldbyname('IDF_VOLUME_PROC2').ASINTEGER;
           IDF_VOLUME_PROC1                          :=  piDgImport.fieldbyname('IDF_VOLUME_PROC1').asinteger;
           IDF_VOLUME_PROC                           :=  piDgImport.fieldbyname('IDF_VOLUME_PROC').asinteger;
           IDF_VISIBLE                               :=  piDgImport.fieldbyname('IDF_VISIBLE').asstring;
           IDF_VERSAO_DATA                           :=  piDgImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
           IDF_VERSAO                                :=  piDgImport.fieldbyname('IDF_versao').asstring;
           IDF_UPDATE_DATE                           :=  piDgImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
           IDF_UNIDADE_TEMPO                         :=  piDgImport.fieldbyname('IDF_UNIDADE_TEMPO').asstring;
           IDF_TIPO_ATIVIDADE                        :=  piDgImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
           IDF_TIPO_ATIV                             :=  piDgImport.fieldbyname('IDF_TIPO_ATIV').asstring;
           IDF_RESPONSAVEL                           :=  piDgImport.fieldbyname('IDF_RESPONSAVEL').asstring;
           IDF_OI                                    :=  piDgImport.fieldbyname('IDF_OI').asinteger;
           IDF_OBJETIVO                              :=  piDgImport.fieldbyname('IDF_OBJETIVO').asstring;
           IDF_NOME                                  :=  piDgImport.fieldbyname('IDF_NOME').asstring;
           IDF_MEDIA                                 :=  piDgImport.fieldbyname('IDF_MEDIA').asstring;
           If piDgImport.fieldbyname('IDF_DIRETORIO').asstring = '' then
             IDF_DIRETORIO := ' '
           else
             IDF_DIRETORIO                           :=   piDgImport.fieldbyname('IDF_DIRETORIO').asstring;
           IDF_DESIGNACAO                            :=   piDgImport.fieldbyname('IDF_DESIGNACAO').asstring;
           IDF_DESCRICAO                             :=   piDgImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
           IDF_DEL                                   :=   piDgImport.fieldbyname('IDF_DEL').asstring;
           IDF_CLASSEOBJETO                          :=   piDgImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
           Inclui;
           Result                                    := iFlux.IDF_CODIGO;
        end;
 finally
  // freeandnil(iFlux);

 end;

 end;

 procedure TFrm_main.Mostra_Mensagem(pMens : string);
var
s : string;
wshape : string;
 begin

   {} frm_log.Memo1.Lines.add(pMens);
    frm_log.Repaint;

 end;


procedure TFrm_main.Mostra_erro(pNode : afnode;pLink : afLink; pMens : string);
var
s : string;
wshape : string;
 begin
  {  If pNode <> nil then
     begin
        s :=  pNode.text ;
        wShape := inttostr(pnode.shape)  ;
     end
    else
    If pLink <> nil then
      begin
       s :=  pLink.text ;
       wShape := inttostr(pLink.LinkStyle)  ;
      end;
    Mostra_mensagem('    '+pMens+ S +' ['+wShape+']');  }
 end;

function TFrm_main.Atualiza_node(pTabImport : Tdados_tab;pUserdataatu,puserdataNovo,pShape : integer; pDiag : TDiag_dados) : boolean;
 var
 j : integer ;
 oList : TList;
 iDgNode : TDg;
 begin
  result := true;
  iDgNode := Tdg.create ;
  iDgNode.loadFile(Bdx.DirFluxo + pDiag.DIAG_ID);

  // torna os objetos do digrama destino como logical = true}
 // Inicializa_Diag(iDgNode);
 try
  try
   with iDgNode do
    begin
       oList := Get_ObJetos();

       for j := 0 to oList.Count - 1 do
         begin
            mListaObj := oList[j];
            If mListaObj.eNode <> nil then
              begin
                If mListaObj.eNode.Logical then
                begin
                  If mListaObj.eNode.UserData = pUserdataAtu then
                   begin
                     mListaObj.eNode.UserData := pUserdataNovo;
                     mListaObj.eNode.Logical := false;

                     // cria nova instancia dos Fluxos
                     If (pShape in [50,79,54]) then
                        Atualiza_Fluxos(iDgNode,mListaObj.eNode,pDiag);
                    // Mostra_erro(mListaObj.eNode,nil,' Id Anterior : '+inttostr(pUserdataAtu)+
                     //                                ' - Id Atual    : '+inttostr(pUserdataNovo)+'....') ;
                     result := true;
                    // BREAK;
                   end;
                end;
            end;
         end;
    end;
  finally
//   Inicializa_Diag(iDgNode);
   iDgNode.SaveFile(Bdx.DirFluxo + pDiag.DIAG_ID);

   freeandnil(iDgNode);
 {  If Olist <> nil then
     freeandnil(oList); }
    // torna os objetos do digrama destino como logical = true}

  end;
 except

   raise;
 end;
 end;

function  TFrm_main.Cria_NovaAtiv(ptabImport : Tdados_tab;pNode : afNode;pDiag : TDiag_dados;PtB : STRING) : integer;
var
iAp : Tap;
iEn : TIdf_en;
iJu : TIdf_ju;
Irn : TIdf_rn;
ICa : TIdf_ca;
IdAtual,IdNovo,wcod : integer;
iDiagOrigem : TDiag_Dados;
wMens : string;
 begin
 try
 try

  result := 0;
  iAp := TAp.create(self);
  iAp.Connection := BDImport;

  If (pDiag.IDG_DIR ='DPN') or (pDiag.IDG_DIR ='DUC') then
  begin
   // showmessage(pNode.text +' shape : '+ inttostr(pNode.shAPE)+' userdata : '+inttostr(pNode.userdata));
    IdAtual := pTabImport.fieldbyname('IDF_CODIGO').asinteger;
    //verifica se objeto já não foi criado ( verifca na BD Temp origem : ID : IDF_CODIGO_NOVO

    wcod := Jaimportado(ptabImport.fieldbyname('CLI_ID').asinteger,ptabImport.fieldbyname('PRJ_ID').asinteger,IDAtual,pTb) ;
    If wCod > 0 then
      result  := wcod
    else
    If pNode.shape in [50,79,54,62] then  //atividade
       result := Incluir_Ap(pTabImport,pDiag)
    else
    If pNode.shape in [56] then  //evento
       result := Incluir_En(pTabImport,pDiag)
     else
    If pNode.shape in [2] then  //Junção
      result := Incluir_Ju(pTabImport,pDiag)
     else
    If pNode.shape in [14] then  //regras
      result := Incluir_rn(pTabImport,pDiag)
     else
    If pNode.shape in [55,53] then  //entidade externa e ator OI
       result := Incluir_ee(pTabImport,pDiag)
     else
    If pNode.shape in [58,8] then  //OI e OC
       result := Incluir_OI(pTabImport,pDiag)
     else
    If (pNode.shape in [0]) and (pDiag.IDG_DIR ='DUC') then  // Objeto entidade
       result := Incluir_IF(pTabImport,pDiag) ;

   //Atualiza a chave no objeto físico do diagrama destino
   If not Atualiza_node(pTabImport,IdAtual,result,pNode.Shape,pDiag) then
     Mostra_erro(mListaObj.eNode,nil,Mens130+ ' - '+pNode.text);

   If pNode.shape in [50,79] then  //atividade
     begin
     //procura diagrama velho ...
            iDiagOrigem :=  TDiag_dados.create(self);
            iDiagOrigem.Connection := BdImport;
            with iDiagOrigem do
             begin
               If not Get_Diagrama(ptabImport.fieldbyname('CLI_ID').asinteger,
                                   ptabImport.fieldbyname('PRJ_ID').asinteger,
                                   ptabImport.fieldbyname('IDF_CODIGO').asinteger) then
                begin
                 wmens := AnsireplaceStr(Mens136,'&',pNode.Text);
                 Mostra_erro(pNode,nil,wMens);
                end
               else   // ...e cria o novo
                begin
                If pDiag.IDG_DIR = 'DPN' then
                 begin
                   If iDiagOrigem.FieldByName('IDG_ID_NOVO').AsInteger = 0 then
                      Inclui_Diagrama(iDiagOrigem,result,pDiag.IDG_ID);

                 end;
                end;
             end;
             freeandnil(iDiagOrigem);
     end;
   end;
 except
   raise;

 end;

 finally
 { If  iAp <> nil then
    freeandnil(iAp);
  If  ien <> nil then
    freeandnil(ien);
 If  iJu <> nil then
    freeandnil(iJu);
 If  iRn <> nil then
    freeandnil(iRn);
 If  iCa <> nil then
    freeandnil(iCa);
 If  iDiagOrigem <> nil then
    freeandnil(iDiagOrigem);   }

 end;
end;

function Tfrm_main.Incluir_EE(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iCA : TIdf_ca;
 begin
 try

   result := 0;
   ica := TIdf_ca.create(self);
   with iCa do
        begin

         PRJ_ID                                           := CurrEmpresa.cenarios.PRJ_ID;
         CLI_ID                                           := CurrEmpresa.cenarios.CLI_ID;
         SUB_NIVEL                                        := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
         SUB_ID                                           := pTabImport.fieldbyname('SUB_ID').asinteger;
       //  IDG_ID                                           := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
         IDF_VISIBLE                                      := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
         IDF_VERSAO_DATA                                  := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
         IDF_VERSAO                                       := pTabImport.fieldbyname('IDF_versao').asstring;
         IDF_USE_CASE_ACTOR_TYPE                          := pTabImport.fieldbyname('IDF_USE_CASE_ACTOR_TYPE').asstring;
         IDF_UPDATE_DATE                                  := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
         IDF_TIPO_ATIVIDADE                               := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
         IDF_TIPO_ATIV                                    := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
         IDF_RESPONSAVEL                                  := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
         IDF_REPONSABILIDADE                              := pTabImport.fieldbyname('IDF_REPONSABILIDADE').asstring;
         IDF_QUANTIDADE_TURNOS                            := pTabImport.fieldbyname('IDF_QUANTIDADE_TURNOS').asinteger;
         IDF_OI                                           := pTabImport.fieldbyname('IDF_OI').asinteger;
         IDF_OBJETIVO                                     := pTabImport.fieldbyname('IDF_OBJETIVO').ASSTRING;
         IDF_NOME                                         := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
         IDF_JORNADA_PADRAO                               := pTabImport.fieldbyname('IDF_JORNADA_PADRAO').asinteger;
         IDF_JORNADA_ANUAL                                := pTabImport.fieldbyname('IDF_JORNADA_ANUAL').ASINTEGER;
         IDF_ID_FISICO                                    := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
         IDF_ID                                           := pTabImport.fieldbyname('IDF_ID').asinteger;
         IDF_FUNCAO_NIVEL                                 := pTabImport.fieldbyname('IDF_FUNCAO_NIVEL').asstring;
         IDF_FORMACAO                                     := pTabImport.fieldbyname('IDF_FORMACAO').ASSTRING;
         IDF_EXPERIENCA                                   := pTabImport.fieldbyname('IDF_EXPERIENCA').asstring;
         IDF_ESPECIALIZACAO                               := pTabImport.fieldbyname('IDF_ESPECIALIZACAO').asstring;
         IDF_EFETIVO_DA_CLASSE                            := pTabImport.fieldbyname('IDF_EFETIVO_DA_CLASSE').asfloat;
         If pTabImport.fieldbyname('IDF_DIRETORIO').asstring = '' then
            IDF_DIRETORIO  := ' '
         else
            IDF_DIRETORIO                                    := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
         IDF_DESIGNACAO                                   := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
         IDF_DESCRICAO                                    := pTabImport.fieldbyname('IDF_DESCRICAO').asstring;
         IDF_DEL                                          := pTabImport.fieldbyname('IDF_DEL').asstring;
         IDF_CUSTO_ANUAL                                  := pTabImport.fieldbyname('IDF_CUSTO_ANUAL').asfloat;
         IDF_CONHECIMENTO                                 := pTabImport.fieldbyname('IDF_CONHECIMENTO').asstring;
         IDF_COND_TRABALHO                                := pTabImport.fieldbyname('IDF_COND_TRABALHO').asstring;
         IDF_COMPETENCIA                                  := pTabImport.fieldbyname('IDF_COMPETENCIA').asstring;
         IDF_CLASSEOBJETO                                 := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
         IDF_ACTOR_ROLE                                   := pTabImport.fieldbyname('IDF_ACTOR_ROLE').asstring;
         ATIVIDADE_MAE                                    := pTabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
         Inclui;
         result           := iCa.IDF_CODIGO;
        end;
 finally
   freeandnil(iCa);


 end;
end;


function Tfrm_main.Incluir_RN(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
irn : TIdf_rn;
 begin
 try
   result := 0;
   irn := TIdf_rn.create(self)  ;
   with iRn do
        begin

          PRJ_ID                                        := CurrEmpresa.cenarios.PRJ_ID;
          CLI_ID                                        := CurrEmpresa.cenarios.CLI_ID;
          SUB_NIVEL                                     := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
          SUB_ID                                        := pTabImport.fieldbyname('SUB_ID').asinteger;
          IDG_ID                                        := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
          IDF_VISIBLE                                   := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
          IDF_VERSAO_DATA                               := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
          IDF_VERSAO                                    := pTabImport.fieldbyname('IDF_versao').asstring;
          IDF_USE_CASE_ACTOR_TYPE                       := pTabImport.fieldbyname('IDF_USE_CASE_ACTOR_TYPE').asstring;
          IDF_UPDATE_DATE                               := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
          IDF_TIPO_IMPLEMENT                            := pTabImport.fieldbyname('IDF_TIPO_IMPLEMENT').asstring;
          IDF_TIPO_ATIVIDADE                            := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
          IDF_TIPO_ATIV                                 := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
          IDF_RESPONSAVEL                               := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
          IDF_REGRA_EXCECAO                             := pTabImport.fieldbyname('IDF_REGRA_EXCECAO').asstring;
          IDF_OI                                        := pTabImport.fieldbyname('IDF_OI').asinteger;
          IDF_OBJETIVO                                  := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
          IDF_NOME                                      := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
          IDF_ID_FISICO                                 := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
          IDF_ID                                        := pTabImport.fieldbyname('IDF_ID').ASINTEGER;
          IDF_FORMALIZACAO                              := pTabImport.fieldbyname('IDF_FORMALIZACAO').asstring;
          IDF_DIRETORIO                                 := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
          IDF_DESIGNACAO                                := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
          IDF_DESCRICAO                                 := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
          IDF_DEL                                       := pTabImport.fieldbyname('IDF_DEL').asstring;
          IDF_CLASSEOBJETO                              := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
          ATIVIDADE_MAE                                 := pTabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
          Inclui;
          //pTab.IDF_CODIGO  := iRn.IDF_CODIGO;
          result := iRn.IDF_CODIGO;
        end;
   finally
      freeandnil(iRn);

   end;

end;

function Tfrm_main.Incluir_Ju(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iJu : TIdf_Ju;
 begin
   try
   result := 0;
   iJu := TIdf_Ju.create(self);
    with iJu do
        begin
          PRJ_ID                                        := CurrEmpresa.cenarios.PRJ_ID;
          CLI_ID                                        := CurrEmpresa.cenarios.CLI_ID;
          SUB_NIVEL                                     := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
          SUB_ID                                        := pTabImport.fieldbyname('SUB_ID').asinteger;
          IDG_ID                                        := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
          IDF_VISIBLE                                   := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
          IDF_VERSAO_DATA                               := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
          IDF_VERSAO                                    := pTabImport.fieldbyname('IDF_versao').asstring;
          If IDF_VERSAO =  '' then
           IDF_VERSAO := ' ';
          IDF_UPDATE_DATE                               := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
          IDF_TIPO_ATIVIDADE                            := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
          IDF_TIPO_ATIV                                 := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
          IDF_RESPONSAVEL                               := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
          IDF_OI                                        := pTabImport.fieldbyname('IDF_OI').asinteger;
          IDF_OBJETIVO                                  := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
          IDF_NOME                                      := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
          IDF_LOGICA                                    := pTabImport.fieldbyname('IDF_LOGICA').asstring;
          IDF_ID_FISICO                                 := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
          IDF_ID                                        := pTabImport.fieldbyname('IDF_ID').ASINTEGER;
          IDF_DESIGNACAO                                := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
          IDF_DESCRICAO                                 := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
          IDF_DEL                                       := pTabImport.fieldbyname('IDF_DEL').asstring;
          IDF_CLASSEOBJETO                              := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
          ATIVIDADE_MAE                                 := pTabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
          IDF_CODIGO                                    := pTabImport.fieldbyname('IDF_CODIGO').asinteger;
          Inclui;
          //pTab.IDF_CODIGO  := iJu.IDF_CODIGO;
          result := iJu.IDF_CODIGO;
        end;
  finally
      freeandnil(iJu);

   end;

end;

function Tfrm_main.Incluir_en(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iEn : TIdf_en;
 begin
 try
   result := 0;
   iEn := TIdf_en.create(self);
   with iEn do
      begin
        PRJ_ID                                    := CurrEmpresa.cenarios.PRJ_ID;
        CLI_ID                                    := CurrEmpresa.cenarios.CLI_ID;
        SUB_NIVEL                                 := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                    := pTabImport.fieldbyname('SUB_ID').asinteger;
        IDG_ID                                    := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
        IDF_VISIBLE                               := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
        IDF_VERSAO_DATA                           := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
        IDF_VERSAO                                := pTabImport.fieldbyname('IDF_versao').asstring;
        IDF_UPDATE_DATE                           := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
        IDF_TIPO_IMPLEMENT                        := pTabImport.fieldbyname('IDF_tipo_implement').asstring;
        IDF_TIPO_ATIVIDADE                        := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
        IDF_TIPO_ATIV                             := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
        IDF_TIPO                                  := pTabImport.fieldbyname('IDF_TIPO').asstring;
        IDF_RESPONSAVEL                           := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
        IDF_PRE_REQUISITOS                        := pTabImport.fieldbyname('IDF_PRE_REQUISITOS').asstring;
        IDF_PERIOD_EVENTO_TEMPORA                 := pTabImport.fieldbyname('IDF_PERIOD_EVENTO_TEMPORA').asstring;
        IDF_OI                                    := pTabImport.fieldbyname('IDF_OI').asinteger;
        IDF_OBJETIVO                              := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
        IDF_NOME                                  := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
        IDF_ID_FISICO                             := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
        IDF_ID                                    := pTabImport.fieldbyname('IDF_ID').ASINTEGER;
        IDF_DIRETORIO                             := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
        IDF_DESIGNACAO                            := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
        IDF_DESCRICAO                             := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
        IDF_DEL                                   := pTabImport.fieldbyname('IDF_DEL').asstring;
        IDF_CLASSEOBJETO                          := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
        ATIVIDADE_MAE                             := pTabImport.fieldbyname('ATIVIDADE_MAE').ASINTEGER;
        Inclui;
        //pTab.IDF_CODIGO  := iEn.IDF_CODIGO;
        result := iEn.IDF_CODIGO;
      end;
   finally
      freeandnil(iEn);

   end;

 end;


function Tfrm_main.Incluir_ap(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iAp : Tap;
 begin
 try
    result := 0;
    iAp := TAp.create(self);
    iAp.Connection := Bdx;
      with iAp do
       begin
          CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
          PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
          IDG_ID                                  :=  pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
          IDF_ID                                  :=  ptabImport.fieldbyname('IDF_ID').asinteger;
          IDF_OI                                  :=  ptabImport.fieldbyname('IDF_OI').asinteger;
          IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
          ATIVIDADE_MAE                           :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
          IDF_DESIGNACAO                          :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
          SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
          IDF_CAUSA_INATIVIDADE                   :=  ptabImport.fieldbyname('IDF_CAUSA_INATIVIDADE').asstring;
          IDF_DESCRICAO                           :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
          IDF_DURATION_TPU                        :=  ptabImport.fieldbyname('IDF_DURATION_TPU').asfloat;
          IDF_DURATION_TPU1                       :=  ptabImport.fieldbyname('IDF_DURATION_TPU1').asfloat;
          IDF_DURATION_TPU2                       :=  ptabImport.fieldbyname('IDF_DURATION_TPU2').asfloat;
          IDF_NATUREZA                            :=  ptabImport.fieldbyname('IDF_NATUREZA').asstring;
          IDF_OBJETIVO                            :=  ptabImport.fieldbyname('IDF_OBJETIVO').asstring;
          IDF_OBJETIVO_UC                         :=  ptabImport.fieldbyname('IDF_OBJETIVO_UC').asstring;
          IDF_RESPONSAVEL                         :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
          IDF_TEMPO_INATIVO_TPI                   :=  ptabImport.fieldbyname('IDF_TEMPO_INATIVO_TPI').asfloat;
          IDF_TIPO                                :=  ptabImport.fieldbyname('IDF_TIPO').asstring;
          IDF_TIPO_IMPLEMENT                      :=  ptabImport.fieldbyname('IDF_TIPO_IMPLEMENT').asstring;
          IDF_TIPO_UC                             :=  ptabImport.fieldbyname('IDF_TIPO_UC').asstring;
          IDF_UNIDADE_TEMPO                       :=  ptabImport.fieldbyname('IDF_UNIDADE_TEMPO').asstring;
          IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
          IDF_VALOR_AGREGADO                      :=  ptabImport.fieldbyname('IDF_VALOR_AGREGADO').asstring;
          IDF_VOLUME                              :=  ptabImport.fieldbyname('IDF_VOLUME').asstring;
          IDF_VOLUME_PICO                         :=  ptabImport.fieldbyname('IDF_VOLUME_PICO').asstring;
          IDF_VOLUME_LOOPING                      :=  ptabImport.fieldbyname('IDF_VOLUME_LOOPING').asfloat;
          IDF_VOLUME_PROC                         :=  ptabImport.fieldbyname('IDF_VOLUME_PROC').asfloat;
          IDF_V_PICO                              :=  ptabImport.fieldbyname('IDF_V_PICO').asfloat;
          IDF_V_REGULAR                           :=  ptabImport.fieldbyname('IDF_V_REGULAR').asfloat;
          IDF_V_MINIMO                            :=  ptabImport.fieldbyname('IDF_V_MINIMO').asfloat;
          IDF_WBS_CODE                            :=  ptabImport.fieldbyname('IDF_WBS_CODE').asstring;
          IDF_DEL                                 :=  ptabImport.fieldbyname('IDF_DEL').asstring;
          IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
          IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
          IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
          IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
          IDF_REPONSABILIDADE                     :=  ptabImport.fieldbyname('IDF_REPONSABILIDADE').asstring;
          IDF_DE_REPET                            :=  ptabImport.fieldbyname('IDF_DE_REPET').asinteger;
          IDF_ATOR1                               :=  ptabImport.fieldbyname('IDF_ATOR1').asstring;
          IDF_ATOR2                               :=  ptabImport.fieldbyname('IDF_ATOR2').asstring;
          SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
          IDF_VOLUME_REG                          :=  ptabImport.fieldbyname('IDF_VOLUME_REG').asfloat  ;
          IDF_CUSTO_TEC                           :=  ptabImport.fieldbyname('IDF_CUSTO_TEC').asfloat  ;
          IDF_CUSTO_ANUAL                         :=  ptabImport.fieldbyname('IDF_CUSTO_ANUAL').asfloat  ;
          IDF_CUSTO_GERAL                         :=  ptabImport.fieldbyname('IDF_CUSTO_GERAL').asfloat  ;
          IDF_CUSTO_MP                            :=  ptabImport.fieldbyname('IDF_CUSTO_MP').asfloat  ;
          If ptabImport.fieldbyname('IDF_DIRETORIO').asstring= '' then
             IDF_DIRETORIO := ' '
          else
             IDF_DIRETORIO                           :=  ptabImport.fieldbyname('IDF_DIRETORIO').asstring;

          If ptabImport.fieldbyname('IDF_TELADIR').asstring = '' then
             IDF_TELADIR := ' '
          else
             IDF_TELADIR                             :=  ptabImport.fieldbyname('IDF_TELADIR').asstring;

          Criar(iAp);
          result := iAp.IDF_CODIGO;

       end;
    finally
      freeandnil(iAp);

   end;
 end;

function Tfrm_main.Incluir_LF(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
ilf : TIdf_lf;
 begin
 try
   result := 0;
   ilf := TIdf_lf.create(self);
   with ilf do
      begin
       PRJ_ID                                    := CurrEmpresa.cenarios.PRJ_ID;
       CLI_ID                                    := CurrEmpresa.cenarios.CLI_ID;
       SUB_NIVEL                                 := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                    := pTabImport.fieldbyname('SUB_ID').asinteger;
      //  IDG_ID                                    := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
       IDF_VISIBLE                               := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
       IDF_VERSAO_DATA                           := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
       IDF_VERSAO                                := pTabImport.fieldbyname('IDF_versao').asstring;
       IDF_UPDATE_DATE                           := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
       IDF_TIPO_ATIVIDADE                        := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
       IDF_TIPO_ATIV                             := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
       IDF_RESPONSAVEL                           := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
       IDF_OI                                    := pTabImport.fieldbyname('IDF_OI').asinteger;
       IDF_OBJETIVO                              := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
       IDF_NOME                                  := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
       IDF_LOCALIZACAO_FISICA                    := pTabImport.fieldbyname('IDF_LOCALIZACAO_FISICA').asstring;
       IDF_ID_FISICO                             := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
       IDF_ID                                    := pTabImport.fieldbyname('IDF_ID').ASINTEGER;
       IDF_DIRETORIO                             := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
       IDF_DESIGNACAO                            := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
       IDF_DESCRICAO                             := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
       IDF_DEL                                   := pTabImport.fieldbyname('IDF_DEL').asstring;
       IDF_CUSTOAMBIENTE                         := pTabImport.fieldbyname('IDF_CUSTOAMBIENTE').asfloat;
       IDF_CLASSEOBJETO                          := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
       ATIVIDADE_MAE                             := pTabImport.fieldbyname('ATIVIDADE_MAE').ASINTEGER;

        Inclui;
        //pTab.IDF_CODIGO  := iEn.IDF_CODIGO;
        result := iLF.IDF_CODIGO;
      end;
    finally
      freeandnil(iLf);

   end;
 end;

function Tfrm_main.Incluir_TX(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iTX : TIdf_TX;
 begin
 try
   result := 0;
   iTX := TIdf_TX.create(self);
   with iTX do
      begin
       PRJ_ID                                    := CurrEmpresa.cenarios.PRJ_ID;
       CLI_ID                                    := CurrEmpresa.cenarios.CLI_ID;
       LCK                                       := pTabImport.fieldbyname('LCK').asstring;
       IDF_VISIBLE                               := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
       IDF_VERSAO_DATA                           := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
       IDF_VERSAO                                := pTabImport.fieldbyname('IDF_versao').asstring;
       IDF_TIPO_ATIVIDADE                        := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
       IDF_RESPONSAVEL                           := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
       IDF_OBJETIVO                              := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
       IDF_IMPLANTACAO                           := pTabImport.fieldbyname('IDF_IMPLANTACAO').asfloat;
       IDF_FORNECEDOR                            := pTabImport.fieldbyname('IDF_FORNECEDOR').asstring;
       IDF_DIRETORIO                             := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
       IDF_DESIGNACAO                            := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
       IDF_DEL                                   := pTabImport.fieldbyname('IDF_DEL').asstring;
       IDF_CUSTO_OUTROS                          := pTabImport.fieldbyname('IDF_CUSTO_OUTROS').asfloat;
       IDF_CUSTO_MANUT                           := pTabImport.fieldbyname('IDF_CUSTO_MANUT').asfloat;
       IDF_CUSTO_LIC                             := pTabImport.fieldbyname('IDF_CUSTO_LIC').asfloat;
       IDF_BD                                    := pTabImport.fieldbyname('IDF_BD').asstring;
       Inclui;
        //pTab.IDF_CODIGO  := iEn.IDF_CODIGO;
        result := iTX.IDF_CODIGO;
      end;
    finally
      freeandnil(iTx);

   end;
 end;

function Tfrm_main.Incluir_DAD(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
  idad: TIdf_dados;
begin
 try
   result := 0;
   idad := TIdf_dados.create(self);
   with idad do
      begin
       CLI_ID                      := CurrEmpresa.cenarios.CLI_ID;
       PRJ_ID                      := CurrEmpresa.cenarios.PRJ_ID;
       SUB_NIVEL                   := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
       IDF_VISIBLE                 := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
       IDF_TYPE_QUALIFIERS         := pTabImport.fieldbyname('IDF_TYPE_QUALIFIERS').asstring;
       IDF_TABELA                  := pTabImport.fieldbyname('IDF_TABELA').asstring;
       IDF_SEQ                     := pTabImport.fieldbyname('IDF_SEQ').asinteger;
       IDF_PK                      := pTabImport.fieldbyname('IDF_PK').asinteger;
       IDF_OBRIG                   := pTabImport.fieldbyname('IDF_OBRIG').asstring;
       IDF_NORMALIZE               := pTabImport.fieldbyname('IDF_NORMALIZE').asstring;
       IDF_NOME                    := pTabImport.fieldbyname('IDF_NOME').asstring;
       IDF_NATUREZA                := pTabImport.fieldbyname('IDF_NATUREZA').asstring;
       IDF_NAMING_PREFIX           := pTabImport.fieldbyname('IDF_NAMING_PREFIX').asstring;
       IDF_DOMINIO                 := pTabImport.fieldbyname('IDF_DOMINIO').asstring;
       IDF_DESIGNACAO              := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
       IDF_DESCRICAO               := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
       IDF_DEL                     := pTabImport.fieldbyname('IDF_DEL').asstring;
       IDF_DEFAULT_VALUE           := pTabImport.fieldbyname('IDF_DEFAULT_VALUE').asstring;
       IDF_DECIMAL                 := pTabImport.fieldbyname('IDF_DECIMAL').asinteger;
       IDF_DE_REPET                := pTabImport.fieldbyname('IDF_DE_REPET').asinteger;
       IDF_DATA_TYPE               := pTabImport.fieldbyname('IDF_DATA_TYPE').asstring;
       IDF_CAPTION                 := pTabImport.fieldbyname('IDF_CAPTION').asstring;

       
       Inclui;
       result := idad.IDF_CODIGO;
      end;
    finally
      freeandnil(iDad);

   end;
 end;


 function Tfrm_main.Incluir_SE(pTabImport : TDados_tab; pDiag : TDiag_dados;pAplic : integer) : integer;
var
iSE : TIdf_SE;
 begin
 try
   result := 0;
   iSE := TIdf_SE.create(self);
   with iSE do
      begin
       PRJ_ID                                    := CurrEmpresa.cenarios.PRJ_ID;
       CLI_ID                                    := CurrEmpresa.cenarios.CLI_ID;
       SUB_NIVEL                                 := pTabImport.fieldbyname('SUB_NIVEL').asinteger;
       SUB_ID                                    := pTabImport.fieldbyname('SUB_ID').asinteger;
       //  IDG_ID                                    := pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
       IDF_VISIBLE                               := pTabImport.fieldbyname('IDF_VISIBLE').asstring;
       IDF_VERSAO_DATA                           := pTabImport.fieldbyname('IDF_VERSAO_DATA').asfloat;
       IDF_VERSAO                                := pTabImport.fieldbyname('IDF_versao').asstring;
       IDF_UPDATE_DATE                           := pTabImport.fieldbyname('IDF_UPDATE_DATE').ASFLOAT;
       IDF_TIPO_ATIVIDADE                        := pTabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
       IDF_TIPO_ATIV                             := pTabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
       IDF_RESPONSAVEL                           := pTabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
       If pTabImport.fieldbyname('IDF_SIGLA').asstring = '' then
         IDF_SIGLA := ' '
       else
         IDF_SIGLA                               := pTabImport.fieldbyname('IDF_SIGLA').asstring;
       IDF_OI                                    := pTabImport.fieldbyname('IDF_OI').asinteger;
       IDF_OBJETIVO                              := pTabImport.fieldbyname('IDF_OBJETIVO').asstring;
       IDF_NOME                                  := pTabImport.fieldbyname('IDF_NOME').ASSTRING;
       IDF_ID_FISICO                             := pTabImport.fieldbyname('IDF_ID_FISICO').asinteger;
       IDF_ID                                    := pTabImport.fieldbyname('IDF_ID').ASINTEGER;
       IDF_DIRETORIO                             := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;
       IDF_DESIGNACAO                            := pTabImport.fieldbyname('IDF_DESIGNACAO').asstring;
       IDF_DESCRICAO                             := pTabImport.fieldbyname('IDF_DESCRICAO').ASSTRING;
       IDF_DEL                                   := pTabImport.fieldbyname('IDF_DEL').asstring;
       IDF_CLASSEOBJETO                          := pTabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
       ATIVIDADE_MAE                             := pTabImport.fieldbyname('ATIVIDADE_MAE').ASINTEGER;
       IDF_CUSTO_TEC                             := pTabImport.fieldbyname('IDF_CUSTO_TEC').ASFLOAT;
       IDF_COD_APLIC                             := pAplic;
        Inclui;
        //pTab.IDF_CODIGO  := iEn.IDF_CODIGO;
        result := iSE.IDF_CODIGO;
      end;
   finally
      freeandnil(iSe);

   end;
 end;

function Tfrm_main.Incluir_REQ(pTabImport : TDados_tab; pDiag : TDiag_dados;pAtiv : integer) : integer;
var
iReq : TTi_req;
 begin
 try
   result := 0;
   ireq := TTi_req.create(self);
   with ireq do
      begin
       PRJ_ID                                    := CurrEmpresa.cenarios.PRJ_ID;
       CLI_ID                                    := CurrEmpresa.cenarios.CLI_ID;
       TI_CODIGO                                 := pAtiv;
       TI_REQ_RN                                 := pTabImport.fieldbyname('TI_REQ_RN').ASSTRING;
       TI_REQ_PG                                 := pTabImport.fieldbyname('TI_REQ_PG').ASSTRING;
       TI_REQ_AP                                 := pTabImport.fieldbyname('TI_REQ_AP').ASSTRING;
       TI_PESO_RN                                := pTabImport.fieldbyname('TI_PESO_RN').ASinteger;
       TI_PESO_PG                                := pTabImport.fieldbyname('TI_PESO_PG').ASinteger;
       TI_PESO_AP                                := pTabImport.fieldbyname('TI_PESO_AP').ASinteger;
       TI_ALTERNATE                              := pTabImport.fieldbyname('TI_ALTERNATE').ASSTRING;
       TI_SEQ                                    := pTabImport.fieldbyname('TI_SEQ').ASinteger;
       Inclui;
        //pTab.IDF_CODIGO  := iEn.IDF_CODIGO;
       result := iReq.IDF_CODIGO;
      end;
    finally
      freeandnil(iReq);

   end;
 end;

function Tfrm_main.Incluir_OI(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iOi : TIdf_oi;
 begin
 try
    result := 0;
    iOi := TIdf_Oi.create(self);
    iOi.Connection := Bdx;
      with iOi do
       begin
        CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
        PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
        SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
        IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
        IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
        IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
        IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
        IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
        IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
        IDF_TELADIR                             :=  ptabImport.fieldbyname('IDF_TELADIR').asstring;
        IDF_OI                                  :=  ptabImport.fieldbyname('IDF_OI').asinteger;
        IDF_OBJETIVO                            :=  ptabImport.fieldbyname('IDF_OBJETIVO').asstring;
        If ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring = '' then
           IDF_RESPONSAVEL := ' '
        else
           IDF_RESPONSAVEL                         :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring ;
        IDF_NOME                                :=  ptabImport.fieldbyname('IDF_NOME').asstring ;
        IDF_NAMING_PREFIX                       :=  ptabImport.fieldbyname('IDF_NAMING_PREFIX').asstring ;
        IDF_MINIESPECIFICACAO                   :=  ptabImport.fieldbyname('IDF_MINIESPECIFICACAO').asstring ;
        IDF_ID_FISICO                           :=  ptabImport.fieldbyname('IDF_ID_FISICO').asinteger;
        IDF_ID                                  :=  ptabImport.fieldbyname('IDF_ID').asinteger;
        IDF_DISTRIBUICAO                        :=  ptabImport.fieldbyname('IDF_DISTRIBUICAO').asstring;
        IDF_DIRETORIO                           :=  ptabImport.fieldbyname('IDF_DIRETORIO').asstring;
        IDF_DESIGNACAO                          :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
        If ptabImport.fieldbyname('IDF_DESCRICAO').asstring = '' then
           IDF_DESCRICAO := ' '
        else
          IDF_DESCRICAO                           :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
        IDF_DEL                                 :=  ptabImport.fieldbyname('IDF_DEL').asstring;
        IDF_DE_REPET                            :=  ptabImport.fieldbyname('IDF_DE_REPET').asinteger;
        ATIVIDADE_MAE                           :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
        IDF_CLASSEOBJETO                        :=  ptabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
        iOi.Inclui;
        result := iOi.IDF_CODIGO;

       end;
     finally
      freeandnil(iOi);

   end;
 end;

function Tfrm_main.Incluir_IF(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iIf : TIdf_If;
 begin
 try
    result := 0;
    iIf := TIdf_IF.create(self);
    iIf.Connection := Bdx;
      with iIf do
       begin
        CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
        PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
        SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
        IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
        If ptabImport.fieldbyname('IDF_VERSAO').asstring = '' then
          IDF_VERSAO := ' '
        else
          IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
        IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
        IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
        IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
        IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
        IDF_OI                                  :=  ptabImport.fieldbyname('IDF_OI').asinteger;
        IDF_OBJETIVO                            :=  ptabImport.fieldbyname('IDF_OBJETIVO').asstring;
        If ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring = '' then
           IDF_RESPONSAVEL := ' '
        else
           IDF_RESPONSAVEL                       :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring ;
        IDF_NOME                                 :=  ptabImport.fieldbyname('IDF_NOME').asstring ;
        IDF_VOLUME_PROC                          :=  ptabImport.fieldbyname('IDF_VOLUME_PROC').asfloat;
        IDF_UNIDADE_TEMPO                        :=  ptabImport.fieldbyname('IDF_UNIDADE_TEMPO').asstring;
        IDF_MEDIA                                :=  ptabImport.fieldbyname('IDF_MEDIA').asstring ;
        IDF_ID_FISICO                            :=  ptabImport.fieldbyname('IDF_ID_FISICO').asinteger;
        IDF_ID                                   :=  ptabImport.fieldbyname('IDF_ID').asinteger;
        IDF_DIRETORIO                            :=  ptabImport.fieldbyname('IDF_DIRETORIO').asstring;
        IDF_DESIGNACAO                           :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
        IDF_DESCRICAO                            :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
        IDF_DEL                                  :=  ptabImport.fieldbyname('IDF_DEL').asstring;
        IDF_CLASSEOBJETO                         :=  ptabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
        ATIVIDADE_MAE                            :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
        If pTabImport.fieldbyname('IDF_DIRETORIO').asstring = '' then
          IDF_DIRETORIO := ' '
        ELSE
          IDF_DIRETORIO                                 := pTabImport.fieldbyname('IDF_DIRETORIO').asstring;

        iIf.Inclui;
        result := iIf.IDF_CODIGO;

       end;
     finally
      freeandnil(iIf);

   end;
 end;

function Tfrm_main.Incluir_EV(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iEv : TIdf_ev;
 begin
 try
    result := 0;
    iEv := TIdf_ev.create(self);
    iEv.Connection := Bdx;
      with iEv do
       begin
        CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
        PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
        SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
        IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
        IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
        IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
        IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
        IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
        IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
        IDF_TELADIR                             :=  ptabImport.fieldbyname('IDF_TELADIR').asstring;
         If ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring = '' then
           IDF_RESPONSAVEL := ' '
        else
           IDF_RESPONSAVEL                         :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring ;

        IDF_OI                                  :=  ptabImport.fieldbyname('IDF_OI').asinteger;
        IDF_NOME                                :=  ptabImport.fieldbyname('IDF_NOME').asstring ;
        IDF_MINIESPECIFICACAO                   :=  ptabImport.fieldbyname('IDF_MINIESPECIFICACAO').asstring ;
        IDF_ID_FISICO                           :=  ptabImport.fieldbyname('IDF_ID_FISICO').asinteger;
        IDF_ID                                  :=  ptabImport.fieldbyname('IDF_ID').asinteger;
        IDF_DESIGNACAO                          :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
         If ptabImport.fieldbyname('IDF_DESCRICAO').asstring = '' then
           IDF_DESCRICAO := ' '
        else
          IDF_DESCRICAO                           :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
        IDF_DEL                                  :=  ptabImport.fieldbyname('IDF_DEL').asstring;
        IDF_CLASSEOBJETO                        :=  ptabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
        ATIVIDADE_MAE                           :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;

        iev.Inclui;
        result := iEv.IDF_CODIGO;

       end;
    finally
      freeandnil(iEv);

   end;
 end;

function Tfrm_main.Incluir_DE(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iDe : TIdf_de;
 begin
 try
    result := 0;
    iDE := TIdf_de.create(self);
    ide.Connection := Bdx;
      with ide do
       begin
        CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
        PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
        SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
        SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
        IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
        IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
        IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
        IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring ;
        IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
        IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
         If ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring = '' then
           IDF_RESPONSAVEL := ' '
        else
           IDF_RESPONSAVEL                         :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring ;

        IDF_OI                                  :=  ptabImport.fieldbyname('IDF_OI').asinteger;
        IDF_NOME                                :=  ptabImport.fieldbyname('IDF_NOME').asstring ;
        IDF_ID_FISICO                           :=  ptabImport.fieldbyname('IDF_ID_FISICO').asinteger;
        IDF_ID                                  :=  ptabImport.fieldbyname('IDF_ID').asinteger;
        IDF_DESIGNACAO                          :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
         If ptabImport.fieldbyname('IDF_DESCRICAO').asstring = '' then
           IDF_DESCRICAO := ' '
        else
          IDF_DESCRICAO                           :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
        IDF_DEL                                   :=  ptabImport.fieldbyname('IDF_DEL').asstring;
        IDF_CLASSEOBJETO                          :=  ptabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
        ATIVIDADE_MAE                             :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
        IDF_TYPE_QUALIFIERS                       :=  ptabImport.fieldbyname('IDF_TYPE_QUALIFIERS').asstring;
        IDF_OBJETIVO                              :=  ptabImport.fieldbyname('IDF_OBJETIVO').asstring;
        IDF_NORMALIZE                             :=  ptabImport.fieldbyname('IDF_NORMALIZE').asstring;
        IDF_NATUREZA                              :=  ptabImport.fieldbyname('IDF_NATUREZA').asstring;
        IDF_NAMING_PREFIX                         :=  ptabImport.fieldbyname('IDF_NAMING_PREFIX').asstring;
        IDF_DOMINIO                               :=  ptabImport.fieldbyname('IDF_DOMINIO').asstring;
        IDF_DEFAULT_VALUE                         :=  ptabImport.fieldbyname('IDF_DEFAULT_VALUE').asstring;
        IDF_DE_REPET                              :=  ptabImport.fieldbyname('IDF_DE_REPET').asinteger;
        IDF_DATA_TYPE                             :=  ptabImport.fieldbyname('IDF_DATA_TYPE').asstring;
        IDF_CONSTRAINT_NAME                       :=  ptabImport.fieldbyname('IDF_CONSTRAINT_NAME').asstring;
        ide.Inclui;
        result := ide.IDF_CODIGO;
       end;
     finally
      freeandnil(iDe);

   end;
 end;

function Tfrm_main.Incluir_ps(pTabImport : TDados_tab; pDiag : TDiag_dados) : integer;
var
iPs : TIdf_ps;
 begin
 try
    result := 0;
    iPs := TIdf_ps.create(self);
    iPs.Connection := Bdx;
      with iPs do
       begin

          CLI_ID                                  :=  CurrEmpresa.cenarios.CLI_ID;
          PRJ_ID                                  :=  CurrEmpresa.cenarios.PRJ_ID;
        //  IDG_ID                                  :=  pDiag.IDG_ID;//pDiag.fieldbyname('IDG_ID').asinteger;
          IDF_ID                                  :=  ptabImport.fieldbyname('IDF_ID').asinteger;
          IDF_TIPO_ATIVIDADE                      :=  ptabImport.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
          ATIVIDADE_MAE                           :=  ptabImport.fieldbyname('ATIVIDADE_MAE').asinteger;
          IDF_DESIGNACAO                          :=  ptabImport.fieldbyname('IDF_DESIGNACAO').asstring;
          SUB_NIVEL                               :=  ptabImport.fieldbyname('SUB_NIVEL').asinteger;
          IDF_DESCRICAO                           :=  ptabImport.fieldbyname('IDF_DESCRICAO').asstring;
          IDF_OBJETIVO                            :=  ptabImport.fieldbyname('IDF_OBJETIVO').asstring;
          IDF_RESPONSAVEL                         :=  ptabImport.fieldbyname('IDF_RESPONSAVEL').asstring;
          IDF_UPDATE_DATE                         :=  ptabImport.fieldbyname('IDF_UPDATE_DATE').asfloat;
          IDF_DEL                                 :=  ptabImport.fieldbyname('IDF_DEL').asstring;
          IDF_VERSAO                              :=  ptabImport.fieldbyname('IDF_VERSAO').asstring;
          IDF_VERSAO_DATA                         :=  ptabImport.fieldbyname('IDF_VERSAO_DATA').aSFLOAT;
          IDF_TIPO_ATIV                           :=  ptabImport.fieldbyname('IDF_TIPO_ATIV').asstring;
          IDF_VISIBLE                             :=  ptabImport.fieldbyname('IDF_VISIBLE').asstring;
          SUB_ID                                  :=  ptabImport.fieldbyname('SUB_ID').asinteger;
          IDF_DIRETORIO                           :=  ptabImport.fieldbyname('IDF_DIRETORIO').asstring;
          PS_TEL                                  :=  ptabImport.fieldbyname('PS_TEL').asstring;
          PS_MAIL                                 :=  ptabImport.fieldbyname('PS_MAIL').asstring;
          PS_CELULAR                              :=  ptabImport.fieldbyname('PS_CELULAR').asstring;
          IDF_TEMPO_CONTRATACAO                   :=  ptabImport.fieldbyname('IDF_TEMPO_CONTRATACAO').asinteger;
          IDF_NOME                                :=  ptabImport.fieldbyname('IDF_NOME').asstring;
       //   IDF_ID_FISICO                           :=  ptabImport.fieldbyname('IDF_ID_FISICOO').asinteger;
          If ptabImport.fieldbyname('IDF_ESTADO').asstring = '' then
             IDF_ESTADO := ' '
          else
             IDF_ESTADO                              :=  ptabImport.fieldbyname('IDF_ESTADO').asstring;
          IDF_CUSTO_ANUAL                         :=  ptabImport.fieldbyname('IDF_CUSTO_ANUAL').asfloat;
          IDF_COMPLEXIDADE                        :=  ptabImport.fieldbyname('IDF_COMPLEXIDADE').asstring;
          IDF_CLASSIFICACAO_PP                    :=  ptabImport.fieldbyname('IDF_CLASSIFICACAO_PP').asstring;
          IDF_CLASSEOBJETO                        :=  ptabImport.fieldbyname('IDF_CLASSEOBJETO').asstring;
          IDF_CARGO                               :=  ptabImport.fieldbyname('IDF_CARGO').asstring;

          iPs.Inclui;
          result := iPs.IDF_CODIGO;

       end;
    finally
      freeandnil(iPs);

   end;
 end;

procedure Tfrm_main.Cria_ChaveDupl;   // CRIA ATRIBUTO PARA RECEBER NOVA CHAVE , NA IMPORTAÇÀO
var
iTab,iFld,iFldnovo : TstringList;
i,wseq : integer;
  begin
  adoc := TAdoConnection.create(application);
  qry_cria_idf_dados := TadoQuery.create(application);

  itab := TStringList.create;
  ifld := TStringList.create;
  adoc.connected        := false;
  adoc.LoginPrompt := false;
  adoc.ConnectionString := bdImport.ConnectionString ;
 // showmessage(bdimport.Dirbanco);
 // showmessage(bdimport.ConnectionString);
  qry_cria_Idf_dados.Connection := bdImport;

  adoc.GetTableNames(itab,false);
try
  for i := 0 to iTab.Count - 1 do
   begin
     If not InArray(iTab[i],wTabelas) then
       continue;
     adoc.GetFieldNames(iTab[i],ifld);
 //    adoc.GetFieldNames(iTab[i],ifldnovo);

     If Inlist('IDF_CODIGO',iFld) then
      begin

        If not Inlist('IDF_CODIGO_NOVO',ifld) then
         with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD IDF_CODIGO_NOVO INTEGER');
             execsql;
          end;

      end;

     If Inlist('IDG_ID',iFld) then
      begin

         If not Inlist('IDG_ID_NOVO',ifld) then
         with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD IDG_ID_NOVO INTEGER');
             execsql;
          end;
      end;

     If Inlist('DIAG_ID',iFld) then
      begin

        If not Inlist('DIAG_ID_NOVO',ifld) then
         with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD DIAG_ID_NOVO VARCHAR(50)');
             execsql;
          end;
      end;

     If Inlist('DIAG_PAI_ID',iFld) then
      begin

        If not Inlist('DIAG_PAI_ID_NOVO',ifld) then
        with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD DIAG_PAI_ID_NOVO INTEGER');
             execsql;
          end;

      end;

     If Inlist('TI_CODIGO',iFld) then
      begin

        If not Inlist('TI_CODIGO_NOVO',ifld) then
        with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD TI_CODIGO_NOVO INTEGER');
             execsql;
          end;
      end;


     If Inlist('PAI_ID',iFld) then
      begin

         If not Inlist('PAI_ID_NOVO',ifld) then
         with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD PAI_ID_NOVO INTEGER');
             execsql;
          end;
      end;

     If Inlist('FILHO_ID',iFld) then
     begin

       If not Inlist('FILHO_ID_NOVO',ifld) then
       with qry_cria_Idf_dados do
          Begin
             sql.clear;
             sql.add('ALTER TABLE '+''+iTab[i]+'');
             sql.add('ADD FILHO_ID_NOVO INTEGER');
             execsql;
          end;
     end;


   end;
except
  showmessage(qry_cria_Idf_dados.SQL.Text);
  raise;

end;

end;

procedure Tfrm_main.LoadconstantObj;
 const Wobj: array[1..17] of sTRING = ('AP', 'CA', 'DG', 'OI', 'PS','OE','DE','JU','RN','SE','EN','LF',
                                        'EV','IF','OC','EE','CS');

   Begin
     WTIT[1] := def63 ; // 'Atividade';
     WTIT[2] := def51 ; // 'Classe de Atores';
     WTIT[3] := def9 ;  // 'Fluxos de Dados';
     WTIT[4] := def86 ; //'Objeto de Interface';
     WTIT[5] := def59 ; //'Pessoa';
     WTIT[6] := def888 ; //'Objeto Entidade';
     WTIT[7] := def26 ;  //'Elementos de Dado';
     WTIT[8] := def333 ; //'Junção';
     WTIT[9] := def67 ;  //'Regra de Negócio';
     WTIT[10] := def112 ; //'Mecanismos';
     WTIT[11] := def110 ; //'Evento de Negócio';
     WTIT[12] := def30 ; //'Locais de Processamento';
     WTIT[13] := def22 ; //'Eventos IT';
     WTIT[14] := def96 ;  //'Objeto de Negócio';
     WTIT[15] := def87 ;  //'Objeto de Controle';
     WTIT[16] := DEF111 ; //'Entidades Externas';
     WTIT[17] := DEF23 ;  //'Classes ';

     WcLASS [1]  := dim1 ;
     WcLASS [2]  := dim2 ;
     WcLASS [3]  := dim3 ;
     WcLASS [4]  := dim4 ;
     WcLASS [5]  := dim5 ;
     WcLASS [6]  := dim6 ;
     // hints

      sp_tree.hint := def35 ;
//      sp_custo.hint := def1040 ;
      speedButton1.Hint := def10001 ;
      sp_cliente.Hint := def65 ;
      speedButton7.Hint := def55 ;
      speedButton8.Hint := def3211;
      speedButton9.Hint := cMain[6];
      speedButton10.Hint := def881 ;
end;


procedure Tfrm_main.SetDECOMPOSTO(const Value: boolean);
begin
  FDECOMPOSTO := Value;
end;

procedure Tfrm_main.Setbdimport(const Value: Tbd);
begin
  Fbdimport := Value;
end;

procedure Tfrm_main.SetEmpImport(const Value: Tempresa);
begin
  FEmpImport := Value;
end;

procedure Tfrm_main.SetiDgImport(const Value: TDg);
begin
  FiDgImport := Value;
end;

procedure Tfrm_main.SetiDgNovo(const Value: TDg);
begin
  FiDgNovo := Value;
end;

procedure Tfrm_main.SetiDiag(const Value: TDiag_dados);
begin
  FiDiag := Value;
end;

procedure Tfrm_main.SetiDiagImport(const Value: TDiag_dados);
begin
  FiDiagImport := Value;
end;

procedure Tfrm_main.SetNOVODIAGID(const Value: STRING);
begin
  FNOVODIAGID := Value;
end;

procedure Tfrm_main.SetWQTCA(const Value: integer);
begin
  FWQTCA := Value;
end;

procedure Tfrm_main.SetWQTIF(const Value: integer);
begin
  FWQTIF := Value;
end;

procedure Tfrm_main.SetWQTOE(const Value: integer);
begin
  FWQTOE := Value;
end;

procedure Tfrm_main.SetWQTOI(const Value: integer);
begin
  FWQTOI := Value;
end;

procedure Tfrm_main.SetWQTRN(const Value: integer);
begin
  FWQTRN := Value;
end;

procedure Tfrm_main.Explorador1Click(Sender: TObject);
begin
  If frm_qry  = nil  then
    frm_qry := Tfrm_qry .create(self);
  frm_qry .showmodal;
end;


procedure Tfrm_main.Setidioma(const Value: string);
begin
  Fidioma := Value;
end; 


procedure Tfrm_main.ABCClick(Sender: TObject);
begin
  inherited;
   If frm_ger  = nil  then
    frm_ger := Tfrm_ger.create(self);
  frm_ger.showmodal;
end;

procedure Tfrm_main.Usurios1Click(Sender: TObject);
begin
  inherited;
 //ling(idioma,self) ;
 oAcesso.NOMEANT := oAcesso.NOME;
 oAcesso.nome := '';
 oAcesso.SENHA := '';
 If  Checa_Acesso(uppercase('frm_usuario'),SEGHABILIATADO,0) then
   Begin
     If frm_usuario  = nil  then
     Begin
      Application.CreateForm(Tfrm_usuario,frm_usuario);
       //frm_usuario := Tfrm_usuario.create(self);
     End;
     //frm_usuario.gpb_diagrama.Visible := false;
     //frm_usuario.showmodal;
   end;
 oAcesso.NOMEANT := oAcesso.NOME;
 oAcesso.nome := '';
 oAcesso.SENHA := '';
 
end;

procedure Tfrm_main.CasosdeUso1Click(Sender: TObject);
begin
  inherited;
  If  Checa_Acesso(uppercase('frm_seguc'),SEGHABILIATADO,0) then
    Begin
       If frm_SEGUC  = nil  then
         frm_SEGUC := Tfrm_SEGUC.create(self);
       frm_SEGUC.showmodal;
    end;

end;

procedure Tfrm_main.dasdasClick(Sender: TObject);
begin
  inherited;
  If frm_login  = nil  then
    frm_login:= Tfrm_login.create(self);
  frm_login.showmodal;
end;

procedure Tfrm_main.SetSEGHABILIATADO(const Value: boolean);
begin
  FSEGHABILIATADO := Value;
end;


procedure Tfrm_main.ToolButton8Click(Sender: TObject);
begin
  inherited;
  bst_login.frm_login.Show;
end;

procedure Tfrm_main.FormShow(Sender : TObject);
Var
  txt  : TDados_tab;
begin
  inherited;
  Application.Title := 'Best ' + GetBuildInfo;
  txt := TDados_tab.Create(self);
  txt.VerificaEmpresas();
end;

procedure Tfrm_main.FormCloseQuery(Sender : TObject; var CanClose : Boolean);
begin
  inherited;
{ TODO : Inserção da Checagem de Licenças }
  tv.Unlocka_Diag(odgLocked.EMPRESA,odgLocked.CENARIO,oDgLocked.IDG);
  atualizaSerial;
end;

function Tfrm_main.checaLicencaVisao(sinal : String; visao : Integer) : Integer;
begin
  if sinal = '-' then
  begin
    visao := visao - 1;
    if visao < 0 then
    begin
      MessageDLG('Sua aplicação atingiu o limite de licenças !', mtError, [mbOk], 0);
      visao := visao + 1;
      Application.Terminate;
    end;
    result := visao;
  end;

  if sinal = '+' then
  begin
    visao := visao + 1;
    result := visao;
  end;
end;

function Tfrm_main.checaLicencaModelo(sinal : String; modelo : Integer) : Integer;
var
  QuantBanco  : Integer;
  ValAtuacao  : String;
begin
  if sinal = '-' then
  begin
    modelo := modelo - 1;
    if modelo < 0 then
    begin
      MessageDLG('Sua aplicação atingiu o limite de licenças !', mtError, [mbOk], 0);
      modelo := modelo + 1;
      Application.Terminate;
    end;
    result := modelo;
  end;

  if sinal = '+' then
  begin
    modelo := modelo + 1;
    result := modelo;
  end;
end;

procedure Tfrm_main.AtualizaSerial;
const
  Raiz  : String = 'Software\Best72\viaLactea';
var
  Reg  : TRegistry;

  fornax  : String;     // Quantidade de Licença Modeler
  lupus  : String;     // Quantidade de Licença Viewer

  nFornax  : Integer;
  nLupus  : Integer;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(Raiz, false);

  fornax := DesEncripta(reg.ReadString('fornax'), 'Best72');
  lupus := DesEncripta(reg.ReadString('lupus'), 'Best72');

  If Viewer = false then
  begin
    //Licença Modeler
    nFornax := checaLicencaModelo('+', StrToInt(fornax));
    Reg.WriteString('fornax', Encripta(IntToStr(nFornax), 'Best72'));
  end
  else
  begin
    //Licença Viewer
    nLupus := checaLicencaVisao('+', StrToInt(lupus));
    Reg.WriteString('lupus', Encripta(IntToStr(nLupus), 'Best72'));
  end;
  Reg.CloseKey;
  Reg.Free;
end;

end.
