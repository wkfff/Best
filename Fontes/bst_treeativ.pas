unit bst_treeAtiv;        //6_38

interface
   // testar : mudança de ativiadaee via lista ; se ha decomposicao, nao
   // deletar quando ha outra atividade igual no mesmo diagrama
   //   - Quando cria atividade via lista, na montagem da arvore,colocar os mdados
   // quando deletar uma atividae, se no tv nào estiver com os filhos, delete
   //   somente o pai : antes de deletear, abrir os filhos.   OK
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, StdCtrls, Menus, ImgList, ExtCtrls, AddFlow3Lib_TLB, bstdb,
  cls_obj, TPCProgressBars,cls_utils,AxCtrls, OleCtrls, QuickRpt, Qrctrls,
  activex, DBCtrls,shellApi,Provider,ADODB,Fonctions,DB,bst_objetos,math,
  printers, bst_pativ,bst_pregra,bst_pdata,QRPrntr,cls_bd, FileCtrl, Animate,
  bst_dm_rel, GIFCtrl, bst_basefrm, ActnList, ToolWin;
type
  uDupl= ^TLst;
  TLst = record
     eNode    : afNode;
     elnk     : afLink;
     eTipo    : char;  //i : link entrando - o : link saindo
     eShape   : integer;
  end;

type
  ulstdad= ^TLstdad;
  TLstdad = record
     elnk     : afLink;
  end;

  type
  uLista = ^TLista;
    TLista = record
       eNode    : afNode;
       elnk     : afLink;
       eTipo    : char;  //i : link entrando - o : link saindo
       eObj     : string;
    end;

type
  Tfrm_treeativ = class(TBasefrm)
    im: TImageList;
    st: TImageList;
    pop: TPopupMenu;
    Expandir1: TMenuItem;
    Encolher1: TMenuItem;
    Exportar1: TMenuItem;
    Excluir1: TMenuItem;
    bckcolor: TColorDialog;
    fnt: TFontDialog;
    spl: TSplitter;
    Pan_ger: TPanel;
    Pan_Alinh: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    spy: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton49: TSpeedButton;
    pan_dpn: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    spp: TSpeedButton;
    PopNode: TPopupMenu;
    Lista1: TMenuItem;
    N7: TMenuItem;
    Abrir2: TMenuItem;
    Executar1: TMenuItem;
    Imagem1: TMenuItem;
    IncluiImagem1: TMenuItem;
    AjustaImagemaEntidade1: TMenuItem;
    Propriedades1: TMenuItem;
    EntPop: TPopupMenu;
    Abrir1: TMenuItem;
    PopLiv: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    PopLink: TPopupMenu;
    Lista2: TMenuItem;
    N6: TMenuItem;
    Estmulo1: TMenuItem;
    Propriedades2: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton13: TSpeedButton;
    spb_ajuste: TSpeedButton;
    spb_normal: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Delete1: TMenuItem;
    SpeedButton16: TSpeedButton;
    SpeedButton84: TSpeedButton;
    AjustaImagemaEntidade2: TMenuItem;
    AjustaEntidadeaImagem2: TMenuItem;
    rt: TRichEdit;
    dbrt: TDBRichEdit;
    pan_temp: TPanel;
    //pan_tit: TLabel;
    pan_proc: TPanel;
    SpeedButton18: TSpeedButton;
    SpeedButton21: TSpeedButton;
    spb_jo: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    spt: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton75: TSpeedButton;
    SpeedButton7: TSpeedButton;
    pan_org: TPanel;
    SpeedButton40: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton46: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton48: TSpeedButton;
    SpeedButton76: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Edit7: TEdit;
    Edit8: TEdit;
    pan_use: TPanel;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton47: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton45: TSpeedButton;
    SpeedButton83: TSpeedButton;
    Edit6: TEdit;
    pan_liv: TPanel;
    SpeedButton52: TSpeedButton;
    SpeedButton53: TSpeedButton;
    SpeedButton54: TSpeedButton;
    SpeedButton55: TSpeedButton;
    SpeedButton56: TSpeedButton;
    SpeedButton57: TSpeedButton;
    SpeedButton58: TSpeedButton;
    SpeedButton59: TSpeedButton;
    SpeedButton61: TSpeedButton;
    SpeedButton62: TSpeedButton;
    SpeedButton63: TSpeedButton;
    SpeedButton65: TSpeedButton;
    SpeedButton66: TSpeedButton;
    SpeedButton67: TSpeedButton;
    SpeedButton64: TSpeedButton;
    SpeedButton69: TSpeedButton;
    SpeedButton71: TSpeedButton;
    SpeedButton72: TSpeedButton;
    SpeedButton73: TSpeedButton;
    SpeedButton74: TSpeedButton;
    SpeedButton51: TSpeedButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Pan_Inf: TPanel;
    SpeedButton68: TSpeedButton;
    SpeedButton70: TSpeedButton;
    sp1: TSpeedButton;
    sp2: TSpeedButton;
    sp3: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton77: TSpeedButton;
    SpeedButton78: TSpeedButton;
    sp10: TSpeedButton;
    sp12: TSpeedButton;
    sp11: TSpeedButton;
    SP4: TSpeedButton;
    SP5: TSpeedButton;
    SP6: TSpeedButton;
    SP7: TSpeedButton;
    SP8: TSpeedButton;
    SelecionarTudo1: TMenuItem;
    N2: TMenuItem;
    Atrs1: TMenuItem;
    Frente1: TMenuItem;
    idbext: TADOConnection;
    idbparadox: TADOConnection;
    iDBDbase: TADOConnection;
    cmb_schema: TComboBox;
    IdbsqlServer: TADOConnection;
    AtualizarasDescriesdosObjetos1: TMenuItem;
    N4: TMenuItem;
    RegistrarAspectoCrticomelhoria1: TMenuItem;
    N5: TMenuItem;
    RegistrarAspectosCrticosmelhorias1: TMenuItem;
    AspectosCrticos1: TMenuItem;
    elaCheia1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Decompor1: TMenuItem;
    N10: TMenuItem;
    Nivelacima1: TMenuItem;
    ImprimirObjeto1: TMenuItem;
    N11: TMenuItem;
    GerarScriptSQL1: TMenuItem;
    IdbInformix: TADOConnection;
    AjustaLinha1: TMenuItem;
    sp_cop: TSpeedButton;
    xp_col: TSpeedButton;
    SpeedButton80: TSpeedButton;
    N12: TMenuItem;
    DefinirAtorDefault1: TMenuItem;
    spb9: TSpeedButton;
    sd: TSaveDialog;
    ImprimirMissoAtor1: TMenuItem;
    sss: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton79: TSpeedButton;
    pan_class: TPanel;
    SpeedButton81: TSpeedButton;
    SpeedButton82: TSpeedButton;
    SpeedButton85: TSpeedButton;
    SpeedButton90: TSpeedButton;
    SpeedButton91: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    sp_gener: TSpeedButton;
    SpeedButton87: TSpeedButton;
    SpeedButton88: TSpeedButton;
    sp_agreg: TSpeedButton;
    N13: TMenuItem;
    RegistrarPendncias1: TMenuItem;
    pan_cli: TPanel;
    Edit4: TEdit;
    Edit11: TEdit;
    pan_cenario: TPanel;
    Edit12: TEdit;
    Edit13: TEdit;
    SpeedButton86: TSpeedButton;
    SpeedButton89: TSpeedButton;
    SpeedButton92: TSpeedButton;
    SpeedButton94: TSpeedButton;
    Label2: TLabel;
    sp_recort: TSpeedButton;
    SpeedButton95: TSpeedButton;
    SpeedButton93: TSpeedButton;
    SpeedButton96: TSpeedButton;
    GerarCasosdeUso1: TMenuItem;
    EscondeMostraFluxo1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    ImportarDiagrama1: TMenuItem;
    cfile: TFileListBox;
    cdir: TDirectoryListBox;
    MostrarDados1: TMenuItem;
    SpeedButton31: TSpeedButton;
    //gfa: TRxGIFAnimator;
    spb_sql: TSpeedButton;
    SpeedButton97: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Salvar: TAction;
    ToolButton3: TToolButton;
    Imprimir: TAction;
    ToolButton5: TToolButton;
    Up: TAction;
    Down: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Atualizar: TAction;
    ZoomPlus: TAction;
    ZoomMinus: TAction;
    Ajustar: TAction;
    AjusteNormal: TAction;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    Copiar: TAction;
    Colar: TAction;
    Recortar: TAction;
    Propriedades: TAction;
    ConfiguracaoObjetos: TAction;
    AlinharDireita: TAction;
    AlinharAcima: TAction;
    AlinharAbaixo: TAction;
    AlinharEsquerda: TAction;
    AlinhaCentrosHorizontal: TAction;
    AlinhaCentroVertical: TAction;
    MesmaAltura: TAction;
    MesmaLargura: TAction;
    MesmoTamanho: TAction;
    ImageList2: TImageList;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    Edit1: TEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fPopup  ;
    procedure popPopup(sender : TObject);
    procedure Trata_Entity(pEnt : afNode; pMouse : integer);
    procedure Trata_link(pLink : afLink;pMouse :integer);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure Expandir(Sender: TObject);
    procedure encolher(Sender: TObject);
    procedure tvNovoCli(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Lista1Click(Sender: TObject);
    procedure Abrir2Click(Sender: TObject);
    procedure Atrs1Click(Sender: TObject);
    procedure Frente1Click(Sender: TObject);
    procedure IncluiImagem1Click(Sender: TObject);
    procedure AjustaImagemaEntidade1Click(Sender: TObject);
    procedure frm_dgAjustaEntidadeaImagem1Click(Sender: TObject);
    procedure Abre_cenario(Sender: TObject);
    procedure Abre_Diag(Sender: TObject);
    procedure Tree_Edit(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure Lista2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure spyClick(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure spb_normalClick(Sender: TObject);
    procedure spb_ajusteClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure getdst1Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Propriedades1Click(Sender: TObject);
    procedure SpeedButton84Click(Sender: TObject);
    procedure Propriedades2Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure AjustaImagemaEntidade2Click(Sender: TObject);
    procedure AjustaEntidadeaImagem2Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Export_arvore(Sender: TObject);
    procedure exp (sender : Tobject) ;
    procedure Imp_Ti (sender : Tobject);
    procedure Imp_Doc (pNode : TTreeNode;sender : Tobject);
    procedure Executar1Click(Sender: TObject);
    procedure SpeedButton68Click(Sender: TObject);
    procedure SelecionarTudo1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure PopNodePopup(Sender: TObject);
    procedure cmb_schemaCloseUp(Sender: TObject);
    procedure SpeedButton79Click(Sender: TObject);
    procedure SpeedButton80Click(Sender: TObject);
    procedure Estmulo1Click(Sender: TObject);
    procedure sppClick(Sender: TObject);
    procedure AtualizarasDescriesdosObjetos1Click(Sender: TObject);
    procedure RegistrarAspectoCrticomelhoria1Click(Sender: TObject);
    procedure RegistrarAspectosCrticosmelhorias1Click(Sender: TObject);
    procedure AspectosCrticos1Click(Sender: TObject);
    procedure SpeedButton76Click(Sender: TObject);
    procedure MostratArvore1Click(Sender: TObject);
    procedure elaCheia1Click(Sender: TObject);
    procedure Decompor1Click(Sender: TObject);
    procedure Nivelacima1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirObjeto1Click(Sender: TObject);
    procedure GerarScriptSQL1Click(Sender: TObject);
    procedure AjustaLinha1Click(Sender: TObject);
    procedure sp_prClick(Sender: TObject);
    procedure sp_copClick(Sender: TObject);
    procedure xp_colClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DefinirAtorDefault1Click(Sender: TObject);
    procedure spb9Click(Sender: TObject);
    procedure dASDClick(Sender: TObject);
    procedure ImprimirMissoAtor1Click(Sender: TObject);
    procedure sssClick(Sender: TObject);
    procedure RegistrarPendncias1Click(Sender: TObject);
    procedure SpeedButton86Click(Sender: TObject);
    procedure sp_recortClick(Sender: TObject);
    procedure SpeedButton96Click(Sender: TObject);
    procedure GerarCasosdeUso1Click(Sender: TObject);
    procedure EscondeMostraFluxo1Click(Sender: TObject);
    procedure ImportarDiagramas1Click(Sender: TObject);
    procedure ImportarDiagrama1Click(Sender: TObject);
    procedure Exec_mecanismo(pId : integer; pProg : string) ;
    procedure sptClick(Sender: TObject);
    procedure spb_sqlClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

   private
   FBrushStyle: TBrushStyle;
   FDefaultDraw,
    FDefaultDrawItem: Boolean;
    FOrigem_dados: integer;
    FWimpTxt: boolean;
    FWDirImp: string;
    FExportDir: string;
    FTI: integer;
    FTreeTi: TstringList;
    FTreeList: TstringList;
    FTreeproj: TstringList;
    FTreeCli: TstringList;
    FTreeCod: TstringList;
    Fdir_db: string;
    FTipo_banco: integer;
    FDiretorio: string;
    FNome_banco: string;
    Fidbado: TAdoConnection;
    Fschema: string;
    FDir_canc: boolean;
    FServidor: string;
    FWnoAtu: TTreeNode;
    FSERVIDOR_ATU: STRING;
    FBANCO_ATU: string;
    Fwuserdata: integer;
    Fdmi_desc: string;
    FDiagm: Tdg;
    FPERC: real;
    FLISTA_DG: BOOLEAN;
    FATORDEF: INTEGER;
    FLOCALDEF: INTEGER;
    Fatordefdesc: string;
    Flocaldefdesc: string;
    Fwnome_exportado: string;
    FReportList: TList;
    Fwprint: string;
    FFormList: TList;
    FDuplic: TList;
    FDataList: Tlist;
    FListadados: TList;
    FPesq_ativ: integer;
    Fpesq_dg: string;
    Fselmissao: boolean;
    FPARA: boolean;
    Fwbs: boolean;
    FFORMDG: BOOLEAN;
    FBDIMPORT: TBD;
    FoWbs: afnode;
    FoAtor: afnode;


    procedure SetOrigem_dados(const Value: integer);
   // procedure ImprimirAP(pCod: integer; pEnt: afNode);
    procedure ImprimirDados(pList : TList) ;
    procedure ImprimirDG(pDg : Tdg;pTipo : string);
    procedure ImprimirEE(pList : TList);
    procedure ImprimirEN(pList : TList);
    procedure ImprimirRN(pList : TList);
    procedure ImprimirTudo(Sender: TObject);
    procedure ImprimirUC(pList : Tlist);
    procedure ImprimirOC(pList : Tlist);
   //  procedure Percorre(pNode: TTreeNode);

    procedure SetWimpTxt(const Value: boolean);
    procedure SetWDirImp(const Value: string);
    procedure Imp_Aspect(Sender: TObject);
    procedure SetExportDir(const Value: string);
    procedure SetTI(const Value: integer);
    procedure Grid1Click(Sender: TObject);
    procedure Setdir_db(const Value: string);
    procedure SetTipo_banco(const Value: integer);
    procedure SetDiretorio(const Value: string);
    procedure SetNome_banco(const Value: string);
    procedure Cria_tabela;
    function Cria_OE(pNode : afNode): boolean;
    function gera_Modelo(pbanco: integer): boolean;
    procedure Setidbado(const Value: TAdoConnection);
    function  gera_SQL(pdg : TDg) : boolean;
    procedure Setschema(const Value: string);
    procedure SetDir_canc(const Value: boolean);
    procedure SetServidor(const Value: string);
    procedure recria_corr(pNode: afNode);
    procedure recria_corrRel(pdg: afLink);
    procedure SetWnoAtu(const Value: TTreeNode);
    procedure Muda_Font(sender : TObject);
    function gera_Triggers: boolean;
    procedure SetBANCO_ATU(const Value: string);
    procedure SetSERVIDOR_ATU(const Value: STRING);
    procedure Setwuserdata(const Value: integer);
    procedure Setdmi_desc(const Value: string);
    procedure SetDiagm(const Value: Tdg);
    procedure Get_objetosGraf(pDiag : Tdg;pNode : afNode);
    function Juncao_Percentual(pDiag : Tdg;pJunc,pAtiv : afnode) : real;
    procedure SetPERC(const Value: real);
    procedure Consiste_diagt(sender: TObject);
    procedure SetLISTA_DG(const Value: BOOLEAN);
    procedure SetATORDEF(const Value: INTEGER);
    procedure SetLOCALDEF(const Value: INTEGER);
    procedure Setatordefdesc(const Value: string);
    procedure Setlocaldefdesc(const Value: string);
    procedure Setwnome_exportado(const Value: string);

    procedure SetReportList(const Value: TList);
    procedure Setwprint(const Value: string);
    procedure SetFormList(const Value: TList);
    procedure SetDuplic(const Value: TList);
    function Duplicado(pList: TList; pCod: integer; pShape : integer): boolean;
    procedure SetDataList(const Value: Tlist);

    procedure ImprimirAP(pList : Tlist;pDg : Tdg;pFolha : boolean;pAtor : integer);
    function Carreguar_Obj(pDg : Tdg;pData : boolean) : Tlist;
    procedure SetListadados(const Value: TList);
    function Duplicado_dado(pList: TList; pCod: integer): boolean;

    procedure SetPesq_ativ(const Value: integer);
    procedure Setpesq_dg(const Value: string);
    procedure LOcalizativ  (sender : Tobject);
    function drilldown(pDiag: integer; pNode: TTreeNode): TTreeNode;
    procedure Setselmissao(const Value: boolean);
    function Pega_diretorio_padrao(pcli, pProj: integer): string;
    function geraSQL_filho(pdg : Tdg; pId : integer) : boolean;
    function Mostra_sql: boolean;
    procedure Ed_todo(Sender: TObject);
    procedure Imp_Dim(sender: Tobject);
    procedure Pend(sender: Tobject);
    procedure SetPARA(const Value: boolean);
    procedure Setwbs(const Value: boolean);
    procedure Gera_Usecase(Sender: TObject);
    procedure SetFORMDG(const Value: BOOLEAN);
    procedure SetBDIMPORT(const Value: TBD);
    procedure salvar_diretorio;
    procedure Localiza_ativdiag(sender: Tobject);
    procedure SetoAtor(const Value: afnode);
    procedure SetoWbs(const Value: afnode);
    procedure LoadconstantObj;override;
    procedure Privilegios(sender: Tobject);
    procedure fLogin(sender: Tobject);
    { Private declarations }
  public
    { Public declarations }
  published
   property Diagm : Tdg read FDiagm write SetDiagm;
   property wuserdata : integer read Fwuserdata write Setwuserdata; // código da última atividade atualizada
   property WimpTxt : boolean read FWimpTxt write SetWimpTxt;
   property WDirImp : string  read FWDirImp write SetWDirImp;
   property wnome_exportado : string read Fwnome_exportado write Setwnome_exportado;
   property Origem_dados : integer read FOrigem_dados write SetOrigem_dados;
   property ExportDir : string read FExportDir write SetExportDir;
   property TI : integer read FTI write SetTI;
   property dir_db : string read Fdir_db write Setdir_db;
   property Diretorio : string read FDiretorio write SetDiretorio;
   property Tipo_banco : integer read FTipo_banco write SetTipo_banco;
   property Nome_banco : string read FNome_banco write SetNome_banco;
   property Servidor : string read FServidor write SetServidor;
   property idbado : TAdoConnection read Fidbado write Setidbado;
   property schema : string read Fschema write Setschema;
   property Dir_canc : boolean read FDir_canc write SetDir_canc;
   property WnoAtu : TTreeNode read FWnoAtu write SetWnoAtu;
   property BANCO_ATU : string read FBANCO_ATU write SetBANCO_ATU;
   property dmi_desc : string read Fdmi_desc write Setdmi_desc;
   property SERVIDOR_ATU : STRING read FSERVIDOR_ATU write SetSERVIDOR_ATU;
   property PERC : real read FPERC write SetPERC;
   property LISTA_DG : BOOLEAN read FLISTA_DG write SetLISTA_DG;
   property ATORDEF : INTEGER read FATORDEF write SetATORDEF;      // ATOR DEFAULT
   property LOCALDEF: INTEGER read FLOCALDEF write SetLOCALDEF;      // LOCAL DE PROC DEFAULT
   property atordefdesc : string read Fatordefdesc write Setatordefdesc;
   property localdefdesc : string read Flocaldefdesc write Setlocaldefdesc;
   property ReportList: TList read FReportList write SetReportList;
   property FormList : TList read FFormList write SetFormList;

   property wprint : string read Fwprint write Setwprint;
   property Duplic : TList read FDuplic write SetDuplic;
   property Listadados : TList read FListadados write SetListadados;
   property DataList : Tlist read FDataList write SetDataList;
   property Pesq_ativ : integer read FPesq_ativ write SetPesq_ativ;
   property pesq_dg : string read Fpesq_dg write Setpesq_dg;
   property selmissao : boolean read Fselmissao write Setselmissao;
   property FORMDG : BOOLEAN read FFORMDG write SetFORMDG;
   property BDIMPORT : TBD read FBDIMPORT write SetBDIMPORT;
   property oAtor: afnode read FoAtor write SetoAtor;
   property oWbs : afnode read FoWbs write SetoWbs;

   procedure Pesq_Banco(pDir : boolean; pTab : string;plist : TListBox);
   function Pesq_Bancos(pDir: boolean; pTipo_banco: integer;
      pTab: string): TAdoConnection;
   procedure Mostra_tabelas(pbanco : Tadoconnection; pTab : string;pForm : TForm ;pList: TListBox;pMostraTudo : boolean);
   procedure Gera_PLanilha(pNode: TTreeNode);
          { imprimir os objetos selecionados do(s) diagrama(s)}
          { pDg diagram;todisniveis : imnprime os objetos dos filhos; pListDoc : imprime os documentos
            da Lista; pImprssão : P ; impressora ; outro filtro; pFile : arquivo onde gravar o filtro,}
   procedure Imprimir_Completo(pdg : Tdg;TodosNiveis : boolean;pListDoc : TStringList;pImpressao,pFile : string;pdata : boolean);

   procedure ImprimirDoc(pDg : Tdg;pImp :string);

   procedure Imprime_Diagrama(pBack, pFundo, pStretch, pFit: boolean;
      pCli, pProj, pbottom, pTop, pLeft, pRight, pOrient, pZoom,
      pTotal: integer; pNome: string; pDg: Tdg);

  procedure Geramanual(Sender: TObject);
end;

var
  iTv : TTv;
  ide : TDad;
  wTab : TstringList;
  frm_treeativ: Tfrm_treeativ;
  I, Wwidg, tot_no: INTEGER;
  Ind, WNodeAtual, IndTop, IndCli, Indproj : TtreeNode;
  Cli_ant, Prj_Ant, Pai_Ant : integer;
  xCli, xPrj, xPai : integer;
  mdado : Udado;
  Cli_nome_ant, Proj_Nome_Ant , WNome_ju: string;
  Diag_rep, wsql : TstringList;
  WNode, RNode, WNodeAtu : TtreeNode;
  z,Witem, Wtot, zCli, zProj : integer;
  IndNovo :TTreeNode;
 // cFluxos : cStyle;
  Wlistdg :Tstringlist;
  Wlist   :Tstringlist;
  Wlistat :Tstringlist;
  idbext : TadoConnection;
  sh : integer;
  wScript : Tstrings;
  wt : string;
  wJ,kSeq : integer;
  Custos_erros : TStringList;

  wForm   : Tfrm_pativ;
  wregra  : TFrm_pregra;
  wdata   : TFrm_pdata;
  DiagDupl : boolean;
  drillnode : TTreeNode;
  wexit : boolean;
implementation

uses bst_main, bst_ap, bst_clifull, bst_cenario, bst_diagrama, bst_regra,
  bst_en, bst_ca, bst_data, bst_lista, bst_juncao, bst_if, bst_pessoa,
  bst_ev, bst_conector, bst_propr, bst_cfg, bst_proprlink, bst_origem,
  bst_preprint, bst_ImpProc,  bst_puc,
   bst_pen, bst_pca,  bst_pdiag, bst_Telastd, bst_pac,
  bst_dir1, bst_preqtitot, bst_text, bst_texto, bst_grid, bst_dir4,
  bst_bancos, qcc_enga, bst_tabenga, bst_log, bst_aspectos,
  bst_mensagem, BST_pdmig, bst_cimp,bst_prnf, bst_dmicon, bst_pprint,
  bst_pConsistDg, bst_atordef, BST_pentext, bst_pDiago, bst_patorat,
   bst_selmissao, bst_demoassist, bst_mens, bst_enttext, bst_cs,
  bst_todo, bst_impdim, bst_todoger, bst_se, bst_qry,
  bst_MainPT,  BST_PRIVILEGIO, bst_usuario, OOSEG, bst_PreviewDiagrama;

{$R *.DFM}

procedure Tfrm_treeativ.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 ret : word;
begin
  try
   begin
     freeandnil(Custos_erros);
     If frm_main.Viewer then
     begin
       ret := MessageDlg(mens361,mtCustom, [mbYes, mbNo,mbCancel], 0);
       if (ret = mrcancel) or( ret = mrno)  then
         raise exception.Create(mens100);
     end
     else
       if not frm_main.para then
       begin
         if tv.selected <> nil then
         begin
           if tv.Selected.Level > 1 then
           begin
             ret := MessageDlg(mens36,mtCustom, [mbYes, mbNo,mbCancel], 0);
             if ret = mrYes then
             begin
               if tv.Diagrama <> nil then
                 tv.Diagrama.Salvar
             end
             else
             if ret = mrcancel then
              raise exception.Create(mens100);
            if (tv.Selected <> nil) then
            begin
              tv.Diagrama.DG_DADOS.CLI_ID := udado(tv.Selected.Data)^.Fcli;
              tv.Diagrama.DG_DADOS.PRJ_ID := udado(tv.Selected.Data)^.FProj;
              tv.Diagrama.DG_DADOS.IDG_ID := tv.Diagrama.Current_Lock;
              tv.UnLocka_Diag(odgLocked.EMPRESA,odgLocked.CENARIO,oDgLocked.IDG);
            end;
          end;
        end;
      end;
      freeandnil(tv);
      If currentdiag <> nil then
         freeandnil(CurrentDiag);
      frm_treeAtiv := nil;
      action := cafree;
      If frm_objetos <> nil then
       Begin
         frm_objetos.fecha := true;
         frm_objetos.close;
       end;
   end;
  except
   begin
     raise;
   end;
  end;
  frm_main.FormShow(sender);
  frm_main.CoolBar2.Visible := true;
end;

procedure Tfrm_treeativ.popPopup(Sender: TObject);
begin
  fPopup;
end;

procedure Tfrm_treeativ.fPopup;
var
  i : integer;
begin
  with Pop do
   begin
     items.Clear;
     i := 1 ;
      // If not viewer then
        begin
         //nivel empresa, cenario, diagrama                      0
         If (tv.selected <> nil) and (tv.Selected.level <= 2) then
            Begin
            end;

          // nivel cliente
          If (tv.selected <> nil) and (tv.Selected.level = 0) then
           Begin
              inc(i);
              PopItem[i] :=  TmenuItem.create(self) ;
              PopItem[i].caption := def69;
              PopItem[i].onClick :=  Abre_Cenario ;
              Items.add(PopItem[i]) ;
              If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;
           end;

         //nivel cenario
         If (tv.selected <> nil) and (tv.Selected.level = 1)  then
            begin
               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := def70;
               PopItem[i].onClick :=  Abre_Diag ;
               Items.add(PopItem[i]) ;
               If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;


               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := def733;
               PopItem[i].onClick :=  Imp_dim ;
               Items.add(PopItem[i]) ;
               If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;

             {   inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := def911;
               PopItem[i].onClick :=  pend;
               Items.add(PopItem[i]) ;
               If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;   }

               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := '-';
              Items.add(PopItem[i]) ;
               If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;
            end;

         If (tv.selected <> nil) and (tv.Selected.level <= 2) then
            Begin
               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := '-';
               Items.add(PopItem[i]) ;
               // Editar


              {inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption :=  def911;
               PopItem[i].onClick :=   ed_todo;
               PopItem[i].Tag     :=   1;
               Items.add(PopItem[i]) ;
               If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                  popitem[i].Enabled := false; }

            end;

         // outros
         If (tv.selected <> nil) and (tv.Selected.level > 1)  then
            Begin
               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := def72;
               PopItem[i].onClick :=  exp ;
               Items.add(PopItem[i]) ;

               If tv.diagrama.IDG_DIR = 'DPN' then
               begin
                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := '-';
                 Items.add(PopItem[i]) ;

                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := def73;
                 PopItem[i].onClick :=  Imp_Ti;
                 Items.add(PopItem[i]) ;
                 PopItem[i].Tag  := 1;

                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := def74;
                 PopItem[i].onClick :=  Imp_Aspect;
                 popitem[i].Tag     := 101;
                 Items.add(PopItem[i]) ;

                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption :=  def75;
                 popitem[i].Tag     := 102;
                 PopItem[i].onClick :=  Imp_Aspect;
                 Items.add(PopItem[i]) ;


                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := '-';
                 Items.add(PopItem[i]) ;
                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption :=  def76;
                 PopItem[i].onClick :=  ImprimirTudo;
                 Items.add(PopItem[i]) ;

                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := '-';
                 Items.add(PopItem[i]) ;


                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption :=  def77;
                 popitem[i].Tag     := 104;
                 PopItem[i].onClick := Consiste_diagt;
                 Items.add(PopItem[i]) ;
                 If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                   popitem[i].Enabled := false;

                 inc(i);
                 PopItem[i] :=  TmenuItem.create(self) ;
                 PopItem[i].caption := def799;
                 PopItem[i].onClick := Localiza_ativdiag;
                 Items.add(PopItem[i]) ;

                  //custo
                 {If tv.diagrama.IDG_DIR = 'DPN'  then
                 Begin
                      inc(i);
                       PopItem[i] :=  TmenuItem.create(self) ;
                       PopItem[i].caption := 'Calcular Custo';
                     //  PopItem[i].onClick :=  Menu_custo;
                       Items.add(PopItem[i]) ;
                       PopItem[i].Tag  := 1;
                 end; }
               end;
               inc(i);
               PopItem[i] :=  TmenuItem.create(self) ;
               PopItem[i].caption := '-';
               Items.add(PopItem[i]) ;

               If tv.diagrama.IDG_DIR = 'DMI' then
                 Begin
                    inc(i);
                    PopItem[i] :=  TmenuItem.create(self) ;
                      PopItem[i].caption :=  def78;
                      //PopItem[i].onClick :=    GeraSQL;
                      Items.add(PopItem[i]) ;
                 end;
              { If tv.diagrama.IDG_DIR = 'DEO' then
                 Begin
                    inc(i);
                    PopItem[i] :=  TmenuItem.create(self) ;
                    PopItem[i].caption := '-';
                    Items.add(PopItem[i]) ;

                    inc(i);
                    PopItem[i] :=  TmenuItem.create(self) ;
                    PopItem[i].caption :=  'Imprimir Missão Ator';
                    PopItem[i].onClick :=    GeraManual;
                    Items.add(PopItem[i]) ;

                    inc(i);
                    PopItem[i] :=  TmenuItem.create(self) ;
                    PopItem[i].caption := '-';
                    Items.add(PopItem[i]) ;
                 end; }
                  If tv.diagrama.IDG_DIR = 'DPN' then
                   Begin
                      If tv.Selected.Level = 2 then
                       Begin
                          inc(i);
                          PopItem[i] :=  TmenuItem.create(self) ;
                          PopItem[i].caption := '-';
                          Items.add(PopItem[i]) ;

                          inc(i);
                          PopItem[i] :=  TmenuItem.create(self) ;
                          PopItem[i].caption :=  def79;
                          PopItem[i].onClick :=    Localizativ;
                          Items.add(PopItem[i]) ;

                          inc(i);
                          PopItem[i] :=  TmenuItem.create(self) ;
                          PopItem[i].caption := '-';
                          Items.add(PopItem[i]) ;
                       end;

                   end;
            end;

           //Fonte
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption := def80;;
           PopItem[i].onClick :=  muda_font;
           Items.add(PopItem[i]) ;
           //Expandir
           inc(i);
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption := def81;
           PopItem[i].onClick :=   expandir;
           Items.add(PopItem[i]) ;
           //Encolher
           inc(i);
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption := def82;
           PopItem[i].onClick :=   Encolher;
           Items.add(PopItem[i]) ;
           //Exportar Arvore
           inc(i);
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption := def83;
           PopItem[i].onClick :=   Export_arvore;
           Items.add(PopItem[i]) ;

           inc(i);
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption := '-';
           Items.add(PopItem[i]);

           //Nova empresa
          inc(i);
          PopItem[i] :=  TmenuItem.create(self) ;
          PopItem[i].caption := def85;
          PopItem[i].onClick :=  tvNovoCli;
          Items.add(PopItem[i]) ;
          If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
             popitem[i].Enabled := false;

           //Editar
           inc(i);
            PopItem[i] :=  TmenuItem.create(self) ;
            PopItem[i].caption :=  def71;
            PopItem[i].onClick :=   Tree_Edit;
            PopItem[i].Tag     :=   1;
            Items.add(PopItem[i]) ;
            If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
              popitem[i].Enabled := false;

           //Excluir
           inc(i);
           PopItem[i] :=  TmenuItem.create(self) ;
           PopItem[i].caption :=  def84;
           PopItem[i].onClick :=    Excluir1Click;
           Items.add(PopItem[i]) ;
           If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
             popitem[i].Enabled := false;

          If (uppercase(oAcesso.NOME) =  'SUPERVISOR') and (FRM_MAIN.SEGHABILIATADO) then
           Begin
              inc(i);
              PopItem[i] :=  TmenuItem.create(self) ;
              PopItem[i].caption := '-';
              Items.add(PopItem[i]) ;

             {} inc(i);     //reativar privilégios
              PopItem[i] :=  TmenuItem.create(self) ;
              PopItem[i].caption := defs22;
              PopItem[i].onClick :=  privilegios;
              Items.add(PopItem[i]) ;
              If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
                 popitem[i].Enabled := false;
           end;
           //inc(i);
           //PopItem[i] :=  TmenuItem.create(self) ;
           //PopItem[i].caption := '-';
           //Items.add(PopItem[i]) ;
           ////Login
           //{} inc(i);     //reativar privilégios
           //PopItem[i] :=  TmenuItem.create(self) ;
           //PopItem[i].caption := defl9;
           //PopItem[i].onClick :=  flogin;
           //Items.add(PopItem[i]) ;

      end;
   end;
end;

procedure Tfrm_treeativ.fLogin(sender : Tobject);
  Begin
   oAcesso.NOMEANT := oAcesso.NOME;
   oAcesso.NOME  := '';
   oAcesso.SENHA := '';
   oAcesso.WACCESS := 0;
   oAcesso.IDUSUARIO := 0;
   oAcesso.ID_DIAGRAMA := 0;
   oAcesso.JUSTLOGIN := true;
   Checa_acesso('',frm_main.SEGHABILIATADO,udado(tv.Selected.Data)^.FDiag);
   oAcesso.JUSTLOGIN := false;
   If tv.Selected.Level > 1 then
     tv.Diagrama.Visible := false;
  end;

procedure Tfrm_treeativ.Privilegios(sender : Tobject);
begin
 //If uppercase(oAcesso.NOME) = 'SUPERVISOR'  then
  Begin
     oAcesso.NOMEANT := oAcesso.NOME;
     oAcesso.nome := '';
     oAcesso.SENHA := '';
     If  Checa_Acesso(uppercase('frm_usuario'),frm_main.SEGHABILIATADO,udado(tv.selected.data)^.FDiag) then
       Begin
         If frm_usuario  = nil  then
           frm_usuario := Tfrm_usuario.create(self);
         frm_usuario.CLIENTE := udado(tv.Selected.Data)^.Fcli;
         frm_usuario.cenario := udado(tv.Selected.Data)^.FProj;
         frm_usuario.diagrama := udado(tv.selected.data)^.FDiag;
         frm_usuario.Classe := udado(tv.selected.data)^.fClasse;
         frm_usuario.NOME_DIAGRAMA := tv.selected.Text;
         frm_usuario.gb_cliente.Visible := false;
         frm_usuario.GPB_PRIV.Visible := false;
         frm_usuario.Edit3.Text := frm_usuario.NOME_DIAGRAMA;
         frm_usuario.showmodal;
         If tv.Selected.Level > 1 then
            tv.Diagrama.Visible := false;
       end;
      oAcesso.NOMEANT := oAcesso.NOME;
      oAcesso.nome := '';
      oAcesso.SENHA := '';
  end;
end;

           //localiza a atividade no diagrama}
procedure Tfrm_treeativ.Localiza_ativdiag(sender : Tobject);
var
  wAtv : afNode;
  wativ : integer;
begin
   iTab := Tdados_tab.create(self);
   with itab  do
   begin
     ListaCli := udado(tv.Selected.Data)^.Fcli ;
     ListaProj:= udado(tv.Selected.Data)^.FProj ;
     ListaDim := 'IDF_AP' ;
     ListaTit := def63+'s' ;
     ListaTag := 0 ;
     ListaPesq := 'S';
     ListaEdit:= false ;
     ListaTree:= nil;
     Listafecha := true;
     ListaId  := 0;
     OPERACAO := 0;
     mostra_lista;
     If  ListaCanc then
      exit;
     wativ := ListaCodigo;
   end;
   watv:= tv.Diagrama.Get_NodeGraph(Tv.Diagrama,wAtiv,50);
   If watv <> nil then
     begin
       watv.Selected := true;
       watv.EnsureVisible;
       exit;
     end
   else
     raise exception.create(mens79);
end;

procedure Tfrm_treeativ.Localizativ(sender : Tobject);
var
  iTab : TDados_tab;
  wno, wNodeatual : TTREeNode;
  watv : afNode;
begin
try
    wNodeATual := tv.selected;
    iTab := Tdados_tab.create(self);
   //mostra lista de atividades
   with itab  do
   begin
     ListaCli := udado(tv.Selected.Data)^.Fcli ;
     ListaProj:= udado(tv.Selected.Data)^.FProj ;
     ListaDim := 'IDF_AP' ;
     ListaTit := def63+'s' ;
     ListaTag := 0 ;
     ListaPesq := 'S';
     ListaEdit:= false ;
     ListaTree:= nil;
     Listafecha := true;
     ListaId  := 0;
     OPERACAO := 0;
     mostra_lista;
     If  ListaCanc then
      exit;
     If  iTab.ListaCodigo = 0 then
      exit;
   end;
   wstop := false;
   wLocatedNode := nil;
   If frm_mens = nil then
    frm_mens := Tfrm_mens.create(self);
   frm_mens.mens.caption := mens137 +' : '+ iTab.ListaDesc;
   frm_mens.show;
   frm_mens.repaint;

   tv.Locate_Activity(tv.selected,iTab.ListaCodigo,'DPN') ;
   If wLocatedNode <> nil then
    begin
      frm_mens.close;
      wLocatedNode.Selected := true;
      tv.TvClick(nil);
      watv:= tv.Diagrama.Get_NodeGraph(Tv.Diagrama,iTab.ListaCodigo,50);
      If watv <> nil then
       begin
         watv.Selected := true;
         watv.EnsureVisible;
       end;
   end
  else
    begin
     wNodeAtual.Selected := true;
     tv.TvClick(nil);
     showmessage(mens79);
    end;
  finally
    freeandnil(iTab);
    frm_mens.close;
  end;
end;

{procedure Tfrm_treeativ.Localizativ(sender : Tobject);
type
  PCod = ^ACod;
  ACod = record
    CD: Integer;
  end;

var
  wlst,wdg : TList;
  ARec: Pcod;
  plst : Tlist;
  iTab : Tdados_tab;
  i,j ,wdiag,wativ: integer;
  wnode : TTreeNode;
  existe : boolean;
  iDiag : TDiag_dados;
  watv : afnode;
 Begin
   pLst := TList.create;
   iTab := Tdados_tab.create(self);
   //mostra lista de atividades
   with itab  do
   begin
     ListaCli := udado(tv.Selected.Data)^.Fcli ;
     ListaProj:= udado(tv.Selected.Data)^.FProj ;
     ListaDim := 'IDF_AP' ;
     ListaTit := def63+'s' ;
     ListaTag := 0 ;
     ListaPesq := 'S';
     ListaEdit:= false ;
     ListaTree:= nil;
     Listafecha := true;
     ListaId  := 0;
     OPERACAO := 0;
     mostra_lista;
     If  ListaCanc then
      exit;
     If  iTab.ListaCodigo = 0 then
      exit;
   end;
   new(arec);
   arec^.CD := iTab.ListaCodigo ;
   pLst.Add(arec);
   wAtiv :=  iTab.ListaCodigo ;;       //atividade a pesquisar
   iDiag := TDiag_Dados.Create(self);
    Begin
        If wativ = 0 then
         exit;
        watv:= tv.Diagrama.Get_NodeGraph(Tv.Diagrama,wAtiv,50);
        If watv <> nil then
           begin
             watv.Selected := true;
             watv.EnsureVisible;
             exit;
           end;

        //procura os diagramas da atividade....
        wlst := iDiag.Get_DiagramasAtiv(udado(tv.Selected.Data)^.Fcli,udado(tv.Selected.Data)^.FProj,'DPN',wAtiv) ;
        If wLst = nil then
           raise exception.create(mens79);
        begin
           arec := wLst[0];
           wDiag := arec^.CD ;
           existe := true;
           iDiag.Get_primeiroAncestral(udado(tv.Selected.Data)^.Fcli,udado(tv.Selected.Data)^.FProj,arec^.CD,'DPN') ;
        end;

        If  udado(tv.selected .Data)^.FDiag <> iDiag.PrimAncestor  then
            Begin
                wNode := tv.Selected.getFirstChild;
                while udado(wNode.Data)^.FDiag <> iDiag.PrimAncestor do
                 Begin
                   wnode := wnode.getNextSibling;
                   If wNode = nil then
                    Begin
                         existe := false;
                         break;
                    end;
                   If (udado(wNode.Data)^.Fcli <>  udado(tv.Selected.Data)^.Fcli ) or
                      (udado(wNode.Data)^.FProj <>  udado(tv.Selected.Data)^.FProj ) or
                      (udado(wNode.Data)^.fClasse <>  udado(tv.Selected.Data)^.fClasse ) then
                       Begin
                         existe := false;
                         break;
                       end;
                 end;
            end;


        If existe then
          Begin
            wexit := false;
            DrillDown(wDiag,wNode);
            If drillNode <> nil then
             Begin
               tv.Selected := drillNode.Parent  ;
               tv.TvClick(nil);
               watv:= tv.Diagrama.Get_NodeGraph(Tv.Diagrama,wAtiv,50);
               If watv <> nil then
                 begin
                  watv.Selected := true;
                  watv.EnsureVisible;
                 end;
             end
            else
             raise exception.create(mens79);
          end
        else
           raise exception.create(mens79);
        end;

 end;  }

//le a arvore descendente a partir do pai para localizar  o Diagrama

function Tfrm_treeativ.drilldown(pDiag : integer;pNode : TTreeNode) : TTreeNode;
var
  i , Tot_filho,Wlevel: integer;
  Wnode : TTreeNode;
  Wnome,Wniv ,Wblan: string;
  Wgrid : boolean;
begin
try
  begin
//  showmessage(udado(pnode.data)^.FNome);
  If wexit then
   exit;
  result := nil;
  If pnode = nil then
      raise exception.create(mens101);
  If udado(pnode.data)^. fDiag = pDiag then
    Begin
      drillNode := pNode;
      wexit := true;
      exit;
    end;
  If not pnode.HasChildren   then
     begin
       tv.Inclui_filhos(udado(pnode.data)^.Fcli,
                     udado(pnode.data)^.FProj,
                     udado(pnode.data)^.FDiag,pnode,
                     udado(pnode.data)^.fClasse);

     end;
  Tot_Filho := pNode.Count;

  If tot_filho > 0 then
     begin

       for i := 0 to Tot_filho-1 do
       begin
           If wexit then
             exit;
          If not pnode.Item[i].HasChildren   then
           begin
             tv.Inclui_filhos(udado(pnode.Item[i].data)^.Fcli,
                           udado(pnode.Item[i].data)^.FProj,
                           udado(pnode.Item[i].data)^.FDiag,pnode.Item[i],
                           udado(pnode.Item[i].data)^.fClasse);

           end;
           drillDown(pDiag,pnode.Item[i]);
       end;
     end;
     result := DrillNode;
  end;
except
  begin
     raise;
  end;
end;
end;

procedure Tfrm_treeativ.Pend (sender : Tobject);
begin
  WNoAtu := tv.selected;
  If frm_TodoGer = nil then
    frm_TodoGer := Tfrm_TodoGer.create(self);
  frm_TodoGer.iTodo.CLI_ID := udado(tv.selected.Data)^.Fcli;
  frm_TodoGer.iTodo.PRJ_ID := udado(tv.selected.Data)^.FProj;
  frm_TodoGer.iTodo.IDG_ID := udado(tv.selected.Data)^.FDiag;

  frm_TodoGer.iTodo.Get_dadosGeral (udado(tv.selected.Data)^.Fcli,udado(tv.selected.Data)^.FProj);
  frm_TodoGer.showmodal;

  tv.selected := wnodeatu;
  tv.TvClick(self);
end;

procedure Tfrm_treeativ.Imp_Dim(sender : Tobject);
begin
  WNoAtu := tv.selected;
  If frm_Impdim = nil then
       frm_IMpdim := Tfrm_IMpdim.create(self);
  with frm_impdim do
   Begin
      Caption := def733;
      cli_sel := udado(tv.selected.Data)^.Fcli;
      {cenate_sel := udado(tv.selected.Data)^.FProj;
      Edit1.text := def7331;

      trv_cenate.Items.clear;
      iCli.cenarios.Open_Cenarios(cli_sel) ;
      iCli.cenarios.Cria_lista(trv_cenate,false,true);
      pgc.ActivePage := tabsheet3; }
      showmodal ;
   end;
  tv.selected := wnodeatu;
  tv.TvClick(self);
end;


procedure Tfrm_treeativ.Imp_Ti (sender : Tobject);
begin
  WNoAtu := tv.selected;
  If frm_mensagem = nil then
       frm_mensagem := TFrm_mensagem.create(self);
  If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
    frm_mensagem.sp_ger.Enabled := false;
  frm_mensagem.show;
end;

{procedure Tfrm_treeativ.Imp_Dim(sender : Tobject);
begin
  WNoAtu := tv.selected;
  If frm_Impdim = nil then
       frm_IMpdim := Tfrm_IMpdim.create(self);
  with frm_impdim do
   Begin
      Caption := def733;
      cli_sel := udado(tv.selected.Data)^.Fcli;
      {cenate_sel := udado(tv.selected.Data)^.FProj;
      Edit1.text := def7331;

      trv_cenate.Items.clear;
      iCli.cenarios.Open_Cenarios(cli_sel) ;
      iCli.cenarios.Cria_lista(trv_cenate,false,true);
      pgc.ActivePage := tabsheet3; }
 {     showmodal ;
   end;
  tv.selected := wnodeatu;
  tv.TvClick(self);

end; }

procedure Tfrm_treeativ.Consiste_diagt(sender : TObject);
var
iTemp : TTemp;
 begin
    itemp := TTemp.create(self);
    itemp.del_temp;
    tv.Diagrama.consiste_dg(TV.Diagrama.EMPRESA,TV.Diagrama.CENARIO,udado(tv.Selected.Data)^.FDiag);

    with iTemp do
      Begin
         get_all;

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

procedure Tfrm_treeativ.Muda_Font(sender : TObject);
 Begin
   with TfontDialog.create(self) do
    Begin
      execute;
      tv.Font := font;
    //  Wfnt := fnt.font;
    //  Edit1.font := WFnt;
    end;

 end;


procedure Tfrm_treeativ.Imp_Doc (pNode : TTreeNode;sender : Tobject);
var
  n ,warq,wstring: string;
begin
  try


   { If frm_pReqTiTot = nil then
       frm_pReqTiTot :=  Tfrm_pReqTiTot.create(self);

    tv.TreeList.Clear  ;
    tv.TreeCli.Clear   ;
    tv.TreeProj.Clear  ;
    tv.TreeCod.Clear   ;
    tv.TreeTi.Clear    ;

    Dm_rel.qry_delPlan.ExecSQL;

    tv.treeList.Add(pNode.text);
    tv.TreeCli.add(inttostr(udado(pNode.Data)^.FCli)) ;
    tv.TreepROJ.add(inttostr(udado(pNode.Data)^.FProj)) ;
    tv.TreecOD.add(inttostr(udado(pNode.Data)^.FDiag)) ;
    tv.Le_arvore(pNode);
    Ti := -1;
    If pNode.level = 1 then  //cenário
      begin
        frm_preqTiTot.titulo.caption := '';
      end
    else
    If pNode.level > 1 then  //diagrama
      begin
        frm_preqTiTot.titulo.caption := pNode.text;
      end ;  }


  //  frm_pReqTiTot.qrp.PreView ;

    // grava a planilha de requerimentos
   { warq :=bdx.DirFluxo+frm_pReqTiTot.pr_cli.caption+'_'+'Requer.xls' ;
    If fileexists(wArq) then
      deletefile( wArq);
    wstring := 'SELECT * INTO REQUERIMENTOS IN '+ ''+'"'+warq+'"'+ ''+' "EXCEL 8.0;"'+''+'  FROM REQUERIMENTOS';
    bdx.Execute(wstring);   }
   //bdx.Execute('SELECT * INTO REQUERIMENTOS '+ ' IN "C:\REQUER.XLS" "EXCEL 8.0;"  FROM REQUERIMENTOS');






     finally
        {freeandnil(TreeList) ;
        freeandnil(TreeCli) ;
        freeandnil(TreeProj) ;
        freeandnil(TreeCod) ;
        freeandnil(TreeTi) ;}
        frm_pReqTiTot.close;
      end;
end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end;

procedure Tfrm_treeativ.Export_arvore(Sender: TObject);
var
  wnodeAtu : TTreeNode;
  ExDir : string;
begin
  WNodeAtu := tv.Selected;
  GetDir(@(ExDir));
  If ExDir <> '' then
  begin
       If ExtractFileExt(ExDir) <> '.txt' then
        ExDir := ExDir+'.txt' ;
       tv.SaveTofile(Exdir);
       showmessage(mens43+ExDir);
  end;
{ If frm_diretorio = nil then
     frm_diretorio := Tfrm_diretorio.create(SELF);
  frm_diretorio.caption := def83;
  FRM_DIRetorio.SHOWMODAL;
 If exportdir <> '' then
     begin
       tv.SaveTofile(ExportDir+'.txt');
       showmessage(mens43+ExportDir+'.txt');
     end; }
  tv.selected := wnodeatu;
  tv.TvClick(self);
end;

procedure Tfrm_treeativ.exp (sender : Tobject);
var
  Wgrid : boolean;
  Wpict : TPicture;
  Wpic : IpictureDisp;
  WPos : integer;
  ExDir : string;
begin
  // tv.TvClick(tv);
   Wpict := Tpicture.create;
   Wpict.Metafile;

   WNodeAtu := tv.Selected;
   GetDir(@(ExDir));
   If ExDir <> '' then
   begin
         If ExtractFileExt(ExDir) <> '.wmf' then
          ExDir := ExDir+'.wmf' ;
         Wgrid := tv.Diagrama.Showgrid;
         tv.Diagrama.Showgrid := false;
         tv.Diagrama.saveImage(0,1,exdir);
         tv.Diagrama.ShowGrid := WGrid;
         showmessage(mens43+ExDir);
   end;

 {  If frm_diretorio = nil then
     frm_diretorio := tfrm_diretorio.create(self);
   frm_diretorio.showModal;
   If exportdir <> '' then
     begin
     Wpos :=  pos('.',WDiretorio) ;
      If Wpos = 0 then
         exportdir := exportdir+ '.emf'
      else
      exportdir := copy(exportdir,1,Wpos-1)+ '.emf';
      Wgrid := tv.Diagrama.Showgrid;
      tv.Diagrama.Showgrid := false;
      tv.Diagrama.saveImage(0,1,exportdir);
      tv.Diagrama.ShowGrid := WGrid;
     end; }
end;


procedure Tfrm_treeativ.Imp_Aspect(Sender: TObject);
var
  wtipo : string;
  iTab : TDados_tab;
  iAsp : Tdados_tab;
  cli,proj,wAsp:  integer;
begin
  cli  := tv.Diagrama.EMPRESA;
  proj := tv.Diagrama.CENARIO;
  If TMenuItem(sender as TObject).tag = 101 then
     Wasp := 1
  else
     Wasp := 2;

    try
      iAsp := Tdados_tab.create(self);
      with iAsp do
       begin
        If not get_aspectos(Cli,Proj,udado(tv.Selected.Data)^.FDiag,wAsp) then
         begin
          If wasp = 1 then
              raise exception.create(mens41)
          else
              raise exception.create(mens42);
         end;
        If frm_pac = nil then
           frm_pac := Tfrm_Pac.create(self);
        frm_pac.qrp.DataSet := iAsp;

          with frm_pac do    // aloca dataset aos controles
          begin
             for i := 0 to componentCount -1 do
              begin
               If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
                  qrdataset(Components[i],iAsp);
              end;
          end;
       end;

      frm_pac.l_oper.caption := tv.selected.text;

      frm_pac.pcausa.DataField := 'IDF_ASPECTOS_CRITICOS';

      frm_pac.qrp.preview;
      frm_pac.close;

    finally
      // freeandnil(itab);
       freeandnil(iAsp);
    end;

 end;

procedure Tfrm_treeativ.ImprimirTudo(Sender: TObject);
var
  Wnome : string;
  Wpos : integer;
  Wn : TTreeNode;
begin
  try
    begin
        ReportList.Clear;
        Duplic.Clear;
        DataList.Clear;
        Wlistdg := Tstringlist.create;
        Wlist   := Tstringlist.create;
        Wlistat := Tstringlist.create;
        Wn := tv.selected;
        If frm_ImpProc = nil then
           frm_impProc := tfrm_ImpProc.create(self);
        frm_Impproc.Edit3.Text := tv.Selected.text;
        frm_Impproc.ShowModal;
{        If frm_ImpProc.edit2.text = '' then
           exit;

        tv.TvClick(frm_treeAtiv); //abre diagrama
        If frm_ImpProc.cb_dg.checked then
          ImprimirDG(tv.diagrama.IDG_DIR);
        If (frm_ImpProc.cb_ap.checked) or
           (frm_ImpProc.cb_rn.checked) or
           (frm_ImpProc.cb_gd.checked) or
           (frm_ImpProc.cb_ee.checked) or
           (frm_ImpProc.cb_oi.checked) or
           (frm_ImpProc.cb_oc.checked) or
           (frm_ImpProc.cb_en.checked) then
                Imprimirdoc;
        If frm_ImpProc.tudo.checked  then            // imprime nível pai
           percorre(tv.selected);          // imprime níveis abaixo
        If frm_ImpProc.cb_gd.checked then
          ImprimirDados(DataList);

        If reportList.Count > 0 then
//          CombinedExportToFile(ReportList, ExportType, 'c:\buffer\teste.rtf', false, False);
        //limpa os forms abertos p/emissào do relatório
       for z := 0 to ReportList.Count - 1 do
        Begin
         If (TQuickrep(ReportList[z]).Parent is  Tfrm_pativ) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_ap) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_regra) or
            (TQuickrep(ReportList[z]).Parent is  Tfrm_pregra) then

            Tform(TQuickrep(ReportList[z]).Parent).Close;
        end;

}


       tv.selected := Wn;
       ferme := true;
//       frm_impProc.Close;
       Wlist.Destroy;
       Wlistdg.Destroy;
       Wlistat.destroy;
       If tv.Selected <> nil then
          tv.TvClick(frm_treeAtiv); //abre diagrama
    end;
  except
    begin
      tv.selected := Wn;
      tv.TvClick(frm_treeAtiv); //abre diagrama
      Wlist.Destroy;
      Wlistdg.Destroy;
      Wlistat.destroy;
      raise;
    end;
  end;
end;

{procedure Tfrm_treeativ.ImprimirTudo(Sender: TObject);
Begin
   If frm_ImpProc = nil then
      frm_impProc := tfrm_ImpProc.create(self);
   frm_Impproc.Edit3.Text := tv.Selected.text;
   frm_Impproc.ShowModal;
end;
}
procedure Tfrm_treeativ.Geramanual(Sender: TObject);  //imprime em 4 partes :
type                                                  // - DEO onde esta o ator escolhido
  PCod = ^ACod;                                       // - Relatório atividades do ator escolhido (miissào)
  ACod = record                                       // - Processos (diagramas) onde o ator é reponsável
    I: Integer;                                       // - Lista das atividades dos processos acima
  end;
var
  ARec: Pcod;
  wpic :IPictureDisp;
  wsel,wtudo,wback,wfundo,WShowgridAnt : boolean;
  i ,j: integer;
  iNode : afNode;
  idiag,jDiag : TAddFlow;
  iemp : Tempresa ;
  wnome,wDir,wNome_diag : string;
  wlst,dglst : TList;
  iDg : Tdg;
  iDiagrama : TDiag_Dados;
  wnode : TTreeNode;
begin
try
 frm_mens :=  Tfrm_mens.create(self);
 frm_mens.mens.caption := mens119;
 frm_mens.show;
 frm_mens.repaint;
 If sd.Execute Then
   wNome := sd.FileName;
 wnome := ChangeFIleExt(wNome,'.doc');
 ReportList.Clear;
 Duplic.Clear;
// DEO onde esta o ator escolhido
 frm_pdiag     := Tfrm_pdiag.create(self);
 with Tdados_Tab.create(self) do
  Begin
    Get_Correlatos(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'CA',tv.Diagrama.SelectedNode.UserData,'PS','IDF_PS') ;
    wNome_diag := tv.Diagrama.SelectedNode.Text + ' : '+fieldbyname('IDF_DESIGNACAO').asstring;;
    free;
  end;

    //impressão orgqanograma
 Imprime_Diagrama(false,false,true,true,tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,5,5,5,5,1,100,0,wnome_diag,tv.Diagrama);
 ReportList.Add(frm_pDiag.QRP);

 {If frm_pdiago = nil then
    frm_pdiago     := Tfrm_pdiago.create(self);
 frm_pdiago.qrp.page.BottomMargin  := 5;
 frm_pdiago.qrp.page.TopMargin     := 5;
 frm_pdiago.qrp.page.LeftMargin := 5;
 frm_pdiago.qrp.page.RightMargin := 5;

 iEmp := tempresa.create(self);
 try
   iemp.Open_Empresa(udado(tv.Selected.Data)^.Fcli) ;
   frm_pdiago.pr_cli.caption  := iEmp.CLI_NOME;
   iEmp.cenarios.Open_Cenario(udado(tv.Selected.Data)^.Fcli,udado(tv.Selected.Data)^.FProj);
   frm_pdiago.pr_proj.caption := iEmp.cenarios.PRJ_TITULO;

   frm_pdiago.pr_cli.left := trunc(frm_pdiago.ph1.width/2 - frm_pdiago.pr_cli.width/2);
   frm_pdiago.pr_proj.left := trunc(frm_pdiago.ph1.width/2 - frm_pdiago.pr_proj.width/2);

 finally
   iEmp.Free;
 end;


 frm_pdiago.titulo.left := trunc(frm_pdiago.ph1.width/2 - frm_pdiago.titulo.width/2);
 frm_pdiago.subtitulo.caption   := udado(tv.Selected.Data)^.FNome;
 with Tdados_Tab.create(self) do
  Begin
    Get_Correlatos(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'CA',tv.Diagrama.SelectedNode.UserData,'PS','IDF_PS') ;
   // Open_Objeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,fieldbyname('FILHO_ID').asinteger,'IDF_CA');
    frm_pdiago.subtitulo.caption   := frm_pdiago.subtitulo.caption+' : '+fieldbyname('IDF_DESIGNACAO').asstring;
    free;
  end;
 frm_pdiago.subtitulo.left := trunc(frm_pdiago.ph1.width/2 - frm_pdiago.subtitulo.width/2);

 tv.diagrama.saveImage(0,1,GetCurrentDir+'\img.emf');
 frm_pdiago.pdg.Picture.LoadfromFile(GetCurrentDir+'\img.emf');
 frm_pdiago.QRSysData3.text := '';
 frm_pdiago.QRSysData1.text := '';
 frm_pdiago.qrshape3.width := 0;
 frm_pdiago.qrshape3.height := 0;
 frm_pdiago.qrshape1.width := 0;
 frm_pdiago.qrshape1.height := 0;

 // frm_pdiago.scaleby(pzoom.value,50);
 //frm_pdiago.PrintScale := true;


 with frm_pdiago.qrp do
  begin
    //Get the current papersize from the default printer and set the report to use it
    with TQRPrinter.Create(self) do
    begin
      Printerindex := -1;
      frm_pdiago.qrp.Page.PaperSize := PaperSize;
      Free;
    end;

  end;
 frm_pDiago.PrintScale := poPrinttoFit ;


 ReportList.Add(frm_pDiago.QRP);}

 // - Relatório atividades do ator escolhido (miissào)

 If frm_patorat     = nil then
    frm_patorat      := Tfrm_patorat.create(self);

  frm_patorat .gtQRSysData3.text := '';
  frm_patorat .gtQRSysData1.text := '';
 {frm_patorat .qrshape3.width := 0;
 frm_patorat .qrshape3.height := 0;
 frm_patorat .qrshape1.width := 0;
 frm_patorat .qrshape1.height := 0; }

 ImprimeAtorAtividade(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,tv.Diagrama.SelectedNode.UserData,' ');

 //pega a lista de atividades do ator....
 with TDados_Tab.create(self) do
  Begin
     wlst := Get_PaisCorrelatosCod(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'AP',tv.Diagrama.SelectedNode.UserData,'CA','Responsável');
     free;
  end;

//If selmissao then
begin
  /// e encontra em que diagramas estão essas atividades....
 with TDiag_dados.create(self) do
  Begin
    dgLst := Get_DiagAtiv(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'DPN',wlst) ;
    free;
  end;

 // - Processos (diagramas) onde o ator é reponsável
// ...imprime os diagramas

 try

   iDiagrama :=  TDiag_dados.create(self);
   iDg := Tdg.create;

   for i := 0 to dgLst.Count - 1 do
    Begin
       with iDiagrama do
        Begin
         arec := dgLst.Items[i];
         Get_Diagrama(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,aRec^.I);
         wdir := bdx.DirFluxo + fieldbyname('diag_id').asstring;
         wNome_Diag :=  fieldbyname('sub_nome').asstring;
         If FileExists(Wdir) then    // abre o diagrama físico...
             iDg.Loadfile(wDir);
        end;
        //imprime diagramas d eprocessos
       { frm_pdiag     := Tfrm_pdiag.create(self);
        Imprime_Diagrama(false,false,true,true,tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,5,5,5,5,1,100,0,tv.Diagrama.IDF_WBS_CODE+'-'+wnome_diag,iDg);
        ReportList.Add(frm_pDiag.QRP); }
        Duplic.Clear;
         // - Lista das atividades dos processos acima
        iDg.EMPRESA    := tv.Diagrama.EMPRESA;
        idg.CENARIO    := tv.Diagrama.CENARIO;

        Carreguar_obj(idg,false);
        ImprimirAP(Duplic,idg,false,tv.Diagrama.SelectedNode.UserData);

    end;
  finally
    freeandnil(iDiagrama);
    freeandnil(iDg);
     frm_mens.Close;
  end;
end;

If reportList.Count > 0 then
  Begin
//     CombinedExportToFile(ReportList, etRTF, wNome, false, false)  ;
  end;



finally
  for z := 0 to ReportList.Count - 1 do
  Begin
   If (TQuickrep(ReportList[z]).Parent is  Tfrm_pdiag) or
      (TQuickrep(ReportList[z]).Parent is  Tfrm_pdiago) or
      (TQuickrep(ReportList[z]).Parent is  Tfrm_patorat)  then
       Tform(TQuickrep(ReportList[z]).Parent).Close;
  end;
end;

end;

procedure Tfrm_treeativ.Imprimir_Completo(pdg : Tdg;TodosNiveis : boolean;pListDoc : TStringList;pImpressao,pFile : string;pdata : boolean);
var
  Wnome : string;
  Wpos : integer;
  Wn : TTreeNode;
  i : integer;
  iDiag : TDg;
begin
  try
    begin
        If pdg = nil then
         exit;
        If frm_ImpProc.cb_dg.checked then
           ImprimirDG(pdg,pImpressao);
        Carreguar_obj(pdg,pData);

        If frm_ImpProc.tudo.checked  then   { DONE -c5.15 : Opção de Imprimir somente o diagrama corrente, quando usado a opção IMPRIMPIR PROCESSO do treeView }                   // imprime nível pai
          Begin
             with TDiag_dados.create(self) do
               Begin
                Get_filhos(pdg.EMPRESA,pdg.CENARIO,pdg.IDG,'','');
                while not eof do
                 Begin
                 //frm_Impproc.Memo1.lines.add(fieldbyname('SUB_NOME').asstring);
                 // frm_Impproc.Memo1.repaint;
                  iDiag := Tdg.Create;
                  wNome := bdx.DirFluxo + fieldbyname('DIAG_ID').asstring;
                  If  FileExists(wNome) then
                    //Raise exception.create(EI5+'-'+wNome);
                  begin
                    iDiag.LoadFile(wNome);
                    iDiag.IDG     := fieldbyname('IDG_ID').ASINTEGER;
                    iDiag.EMPRESA := pDg.EMPRESA;
                    iDiag.CENARIO := pDg.CENARIO;
                    iDiag.NOME_DIAGRAMA := fieldbyname('SUB_NOME').asstring;
                    Imprimir_Completo(iDiag,TodosNiveis,pListDoc,pImpressao,pFile,pData);
                 //   Duplic.Clear;
                  end;
              //    freeandnil(iDiag);
                  next;
                 end;
                 free;
               end;
          end;
    end;
  finally


  end;
end;

{procedure TFrm_Treeativ.Percorre(pNode : TTreeNode);  //le a arvore descendente a a partir do pai
var
i , Tot_filho: integer;
Wnode : TTreeNode;
Wnome,Wniv : string;
Wgrid : boolean;
begin
try
  begin
  If pnode = nil then
      raise exception.create('Problema na árvore!');
  Tot_Filho := pNode.Count;
  If tot_filho > 0 then
     begin
       for i := 0 to Tot_filho-1 do
       begin
         tv.selected := pnode.item[i];
         tv.tvclick(frm_treeAtiv);
         If not tv.Diagrama.IsEmpty(tv.Selected) then
          begin
           If frm_ImpProc.cb_dg.checked then
              begin
                If udado(tv.Selected.Data)^.fClasse = 'DPN'then
                   ImprimirDG('');
              end ;

           If frm_ImpProc.cb_uc.checked then
              If udado(tv.Selected.Data)^.fClasse = 'DUC'then
                 ImprimirDG('DUC');

           Imprimirdoc(tv.Diagrama, '');
         end;
         percorre(pnode.Item[i]);
       end;
     end;
  end;
except
  begin
     raise;
  end;
end;
end;    }

function Tfrm_TreeAtiv.Carreguar_Obj(pDg : Tdg;pData : boolean) : Tlist;
var
  Went : afNode;
  Wcount,CountDg,Wcod,i,j,tot,g ,kAt,kDg,z: integer;

  rep, Jaat,Jadg: boolean;
  Wrel : afLink;
  Wnome,Winn : string;
  mlst : uDupl;
  mLnk : uLstDad;
begin
 // wPrint := pImp;
  result := nil;
  Wcount := pDg.Nodes.Count ;
  If Wcount = 0 then
     exit;

  for i := 1 to Wcount do     // total de entidades no diagrama
    Begin
     Went := pDg.Nodes.item(i);
     If not went.Selectable then
       continue;
     Wcod := went.userdata;
     If Wcod = 0 then
        continue;
     Wnome := went.text;
     If Duplicado(Duplic,wCod,went.Shape)  then
        continue
     else
      Begin
        new(mlst);
        mlst^.enode := went;
        Duplic.Add(mLst);
        // pega dados
       // If (frm_ImpProc.cb_gd.checked) then
       If pdata then
          Begin
            for j:= 1 to went.Links.Count do
             Begin
              If went.Links.Item(j).LinkStyle in cFluxos then
               Begin
                If not Duplicado_dado(ListaDados, went.Links.Item(j).userdata) then
                 Begin
                  If trim(went.Links.Item(j).Text) <> '' then
                   Begin
                      new(mlnk);
                      mlnk^.elnk := went.Links.Item(j);
                      ListaDados.Add(mLnk);
                   end;

                 end;
               end;
             end;
          end;
      end;
  end;
  result := Duplic;

end;

function  Tfrm_TreeAtiv.Duplicado(pList : TList;pCod : integer;pShape : integer) : boolean ;
var
 mlst : uDupl;
 i : integer;
Begin
  result := false;
  wtot :=  pList.Count;
  for i := 0 to pList.Count -1 do
   Begin
    mLst := pList[i];
    If (mLst.eNode.UserData = pcod ) and (mlst.eNode.Shape = pShape) then
     Begin
       result := true;
       break;
     end;
   end;
end;

function  Tfrm_TreeAtiv.Duplicado_dado(pList : TList;pCod : integer) : boolean ;
var
 mlnk : uLstDad;
 i : integer;
Begin
  result := false;
  wtot :=  pList.Count;
  for i := 0 to pList.Count -1 do
   Begin
    mLnk := pList[i];
    If (mLnk.elnk.UserData = pcod )  then
     Begin
       result := true;
       break;
     end;
   end;
end;

procedure Tfrm_TreeAtiv.ImprimirDoc(pDg : Tdg;pImp :string);
var
  Went : afNode;
  Wcount,CountDg,Wcod,i,j,tot,g ,kAt,kDg,z: integer;

  rep, Jaat,Jadg: boolean;
  Wrel : afLink;
  Wnome,Winn : string;
  mlst : uDupl;
begin
  wPrint := pImp;
  If (frm_ImpProc.cb_ap.checked) then    // atividade
     ImprimirAP(Duplic,pdg,frm_ImpProc.ckb_at_fl.checked,0);
  If (frm_ImpProc.cb_rn.checked) then // regras
     ImprimirRN(Duplic) ;
  If (frm_ImpProc.cb_en.checked) then  // eventos de negocio
     ImprimirEN(Duplic) ;
  If (frm_ImpProc.cb_ee.checked) then  // entidades externas
     ImprimirEE(Duplic);
  If (frm_ImpProc.cb_oi.checked) then  // objetos de interface
       ImprimirUC(Duplic);
  If (frm_ImpProc.cb_oc.checked) then  // objetos de controle
       ImprimirOC(Duplic);
  If (frm_ImpProc.cb_gd.checked) then  //fluxos de dados
     ImprimirDados(ListaDados);
  If (frm_ImpProc.cb_lf.checked) then
end;



procedure Tfrm_TreeAtiv.ImprimirUC(pList : Tlist);
var
woi : integer;
begin
     frm_puc := Tfrm_puc.create(self);
     //frm_puc.titulo.caption := uppercase(def86);
     If not frm_puc.iOi.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,58,'IDF_OI',pList,-1,-1,0) then
      exit;
     Imprime_OI(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_oi_fl.Checked ,1);

end;

procedure Tfrm_TreeAtiv.ImprimirOC(pList : Tlist);
var
woi : integer;
begin
     frm_puc := Tfrm_puc.create(self);
     //frm_puc.titulo.caption := uppercase(def87);
     If not frm_puc.iOi.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,8,'IDF_OI',pList,-1,-1,0) then
      exit;
     Imprime_OI(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_oc_fl.Checked ,1);

end  ;



procedure Tfrm_TreeAtiv.ImprimirAP(pList : Tlist;pDg : Tdg;pFolha : boolean;pAtor : integer);
var
 iTab : TDados_tab;
begin
   try
     wform :=  tfrm_Pativ.create(self);
     If not Tfrm_Pativ(wform).iAp.Get_ListaObjeto(pDg.EMPRESA,pDg.CENARIO,50,'IDF_AP',pList,2,0,pAtor) then
          exit;
     // testa 1 objeto por folha
     Tfrm_pativ(wForm).qr_main.ForceNewPage := pFolha ;
    //     frm_ap.Mostra_pap(wprint,wform);
     Imprime_atividades(pDg.EMPRESA,pDg.CENARIO,'',2,0,' ',FALSE,wForm,frm_impproc.ckb_at_fl.checked);
   finally

   end;
end;

procedure Tfrm_TreeAtiv.ImprimirRN(pList : TList);
var
 iTab : TDados_tab;
begin
  frm_regra := Tfrm_regra.create(self);
  frm_pregra := Tfrm_pregra.create(self);
  If not frm_pregra.iRn.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,14,'IDF_RN',pList,-1,-1,0) then
  exit;
  Imprime_regra(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_rn_fl.Checked );
end;

procedure Tfrm_TreeAtiv.ImprimirEN(pList : TList);
begin
   //  If frm_pen = nil then
  frm_pen:= tfrm_pen.create(self);
  If not frm_pen.iEn.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,56,'IDF_EN',pList,-1,-1,0) then
    exit;
  Imprime_Evento(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_ev_fl.Checked );
end;

procedure Tfrm_TreeAtiv.ImprimirEE(pList : TList);
begin
  frm_pentext:= tfrm_pentext.create(self);
  If not frm_pentext.iEe.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,55,'IDF_CA',pList,-1,-1,0) then
    exit;
  Imprime_Externo(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_ev_fl.Checked );
end;

procedure Tfrm_TreeAtiv.Imprimirdados(pList : TList);
begin
  frm_pdata := Tfrm_pdata.create(self);
  If not frm_pdata.idado.Get_ListaObjeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,-1,'IDF_DG',pList,-1,0,0) then
  exit;
  Imprime_Fluxodado(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,' ',frm_impproc.ckb_dg_fl.Checked );
end;

procedure Tfrm_TreeAtiv.ImprimirDG(pDg : Tdg;pTipo : string);
var
  wpic         :IPictureDisp;
  WShowgridAnt : boolean;
  Wpos,h         : Integer;
  Wnome,s1        : string;
begin
  If pDg.Nodes.Count = 0 then
       exit;
  If frm_ImpProc <> nil then
  begin
     If frm_ImpProc.rdg_imp.ItemIndex = 0 then
     begin
         frm_pdiag     := Tfrm_pdiag.create(self);
         Imprime_Diagrama(false,false,true,true,pdg.EMPRESA,pDg.CENARIO,5,5,5,5,1,100,0,tv.Diagrama.IDF_WBS_CODE+'-'+pdg.NOME_DIAGRAMA,pdg);
         If pTipo = 'P' then
           Begin
             frm_pdiag.qrp.print  ;
             frm_pdiag.Close;
           end
         else
          Begin
            frm_Treeativ.ReportList.Add(frm_pDiag.QRP);
          end;
      // pdg.UnselectAll;
     end
     else
      Begin
        If frm_prnf     = nil then
           frm_prnf     := Tfrm_prnf.create(self);
      with frm_prnf do
       Begin
        prnf.hWndFlow := tv.Diagrama.hWnd;
        prnf.DocName := udado(tv.Selected.Data)^.FNome;
        prnf.preview := true;
        s :=  Def65+wcli_NOme;//+'  Cenário : '+  pproj.caption  ;
        s1 := formatdatetime('dd-mmm-yyyy',date)+'|'+prnf.DocName+'|'+'<PAGE>';
        PrnF.Header :=   S1;
       // PrnF.Footer := '|- Page <PAGE> -|'+formatdatetime('dd-mmm-yyyy',date);
        prnF.Footer := '';
        prnf.Zoom := 100;

        edit1.Text := '100';

        prnf.Font := self.Font;
        w := prnf.Width;
        h := prnf.height;
      //  prnf.PrintDoc;
        prnf.PrinterSettings := false;
        prnf.preview := false;
        printer.PrinterIndex := -1;
        printer.Orientation := poLandscape;
        If pTipo = 'P' then
          prnf.PrintDoc
        else
//          frm_Treeativ.ReportList.Add(frm_prnf.QRP);
        Close;
       end;
     end;
 end;
end;



procedure Tfrm_treeativ.Excluir1Click(Sender: TObject);
var
  Wnode,Wparent : TTreeNode;
begin
  Wnode        := tv.selected;
  Wparent      :=  tv.selected.Parent;

  If Wnode.Level = 1 then   // cenario
  begin
    If Checa_acesso('FRM_CENARIO',FRM_MAIN.SEGHABILIATADO,0) THEN
    begin
      If oAcesso.WACCESS = 2 then
      Begin
        If MessageDlg(mens16,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit
        else
        Begin
        If empresas = nil then
          empresas := Tempresa.create(self);
          empresas.CLI_ID := udado(Wnode.Data)^.fcli;
          empresas.cenarios.CLI_ID := udado(Wnode.Data)^.fcli;
          empresas.cenarios.PRJ_ID := udado(Wnode.Data)^.FProj;
          empresas.cenarios.Apagar;
          tv.items.Delete(Wnode);
          tv.selected  := WParent;
        end;
      end;
    end;
   end
   else
   If Wnode.Level = 0 then   // cliente
      begin
       If Checa_acesso('FRM_CLIFULL',FRM_MAIN.SEGHABILIATADO,0) THEN
           begin
            If oAcesso.WACCESS = 2 then
              Begin
                If MessageDlg(mens15,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                             exit
                else
                  Begin
                    If empresas = nil then
                       empresas := Tempresa.create(self);
                     empresas.CLI_ID := udado(Wnode.Data)^.fcli;
                     empresas.cenarios.CLI_ID := udado(Wnode.Data)^.fcli;
                     empresas.cenarios.PRJ_ID := udado(Wnode.Data)^.FProj;
                     empresas.Apagar(udado(Wnode.Data)^.fcli);
                     tv.items.Delete(Wnode);
                     tv.selected  := WParent;
                  end;
              end;
           end;
      end
   else
      begin

        If checa_acesso('',frm_main.SEGHABILIATADO,udado(Wnode.Data)^.FDiag) then
           Begin
             If oAcesso.WACCESS = 2 then
                 Begin
                   If MessageDlg(mens40,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                         exit
                   else
                     Begin
                        tv.excluir_no(Wparent,Wnode,frm_TreeAtiv);
                        //pan_tit.Caption := '';
                        tv.items.Delete(Wnode);
                        tv.selected  := WParent;
                     end;
                 end;
           end; 
      end;


   
   If Wparent = nil then   //topitem
      exit;

   tv.TvClick(tv.Selected);
 end;



procedure Tfrm_treeativ.Expandir(Sender: TObject);
begin
  TV.selected.Expand(true);
end;

procedure Tfrm_treeativ.tvNovoCli(Sender: TObject);  //nova empresas
VAR
  NomeEmpresa, RazaoSocial : String;
begin
 If checa_acesso('frm_clifull',FRM_mAIN.SEGHABILIATADO,0) then
   Begin
     If frm_clifull          = nil then
        frm_clifull            := Tfrm_clifull.create(self);
     //frm_clifull.SpeedButton1.visible := false;
     If empresas = nil then
        Empresas       := Tempresa.create(self);

     If (sender as Tobject) is TmenuItem then
        begin
         If TMenuItem(sender as Tobject).Tag = 1 then  // cliquou editar
            begin
              empresas.CLI_ID := udado(tv.selected.data)^.Fcli;
              empresas.Status := 'M';
              frm_clifull.Edit1.Text := empresas.FieldByName('CLI_NOME').AsString;
              frm_clifull.Edit2.Text := empresas.FieldByName('CLI_RAZ_O_SOCIAL').AsString;
            end
         else
            frm_clifull.sp_novo.Click;
        end;

     //frm_clifull.showModal;
     frm_clifull.Show;
     //empresas.status := ' ';
   end;


end;

procedure Tfrm_treeativ.Abre_cenario(Sender: TObject);
begin

 If Checa_Acesso('frm_cenario',frm_main.SEGHABILIATADO,0) then
   Begin
      If frm_cenario          = nil then
         frm_cenario           := Tfrm_cenario.create(self);

       frm_cenario.sp_novo.visible := false;
      // frm_cenario.pan_cli.visible := false;
       frm_cenario.Edit1.Text := tv.selected.Text;
       frm_cenario.sp_del.visible  := false;
       frm_cenario.SpeedButton1.visible := false;
       frm_cenario.SpeedButton2.visible := false;
       If scenario = nil then
          scenario := Tcenario.create(self);
       Scenario.CLI_ID := udado(tv.selected.Data)^.Fcli;
       If (sender as Tobject) is TmenuItem then
          begin
           If TMenuItem(sender as Tobject).tag = 1 then    // cliquou editar
              begin
                 scenario.Status := 'M';
                 Scenario.CLI_ID := udado(tv.selected.Data)^.Fcli;
                 Scenario.PRJ_ID := udado(tv.selected.Data)^.FProj;
              end
           else
              begin
               If tv.selected.Level <> 0 then
                  exit;
               frm_cenario.sp_novo.Click;
              end;
          end;
       frm_cenario.activeControl := frm_cenario.edit2;
       frm_cenario.showModal;

       scenario.status := ' ';
   end;


end;

procedure Tfrm_treeativ.Abre_Diag(Sender: TObject);
VAR
 a: string;
begin

 If checa_acesso ('FRM_DIAGRAMA',frm_main.SEGHABILIATADO,0) then
  Begin
     If Empresas = nil then
        empresas := Tempresa.create(self);

     empresas.cenarios.Diagramas.CLI_ID    := udado(tv.selected.data)^.Fcli;
     empresas.cenarios.Diagramas.PRJ_ID    := udado(tv.selected.data)^.FProj;

     empresas.cenarios.Diagramas.IDG_NIVEL := tv.selected.level;
     empresas.cenarios.Diagramas.Status := 'I';

     If (sender as Tobject) is TmenuItem then
        begin
         If TMenuItem(sender as Tobject).tag = 1 then    // cliquou editar
            begin
               empresas.cenarios.Diagramas.Status := 'M';
               empresas.cenarios.Diagramas.IDG_ID := udado(tv.selected.data)^.FDiag;
               empresas.cenarios.Diagramas.IDG_DIR:= udado(tv.selected.data)^.fClasse;
            end
         else
           begin    //novo
             If tv.selected.Level <> 1 then
                exit;
             with Tdg.create do
              Begin
                If DemoMaior('DIAG',true) then  //versào demo ultrapassou
                   begin
                     Raise exception.create(mens55);
                     exit;
                   end;
              end;

             empresas.cenarios.Diagramas.Status := 'I';
           end;
        end;

     If frm_diag = nil then
        frm_diag  := Tfrm_diag.create(self);
     frm_diag.activeControl   := frm_diag.edit2;
     If (sender as Tobject) is TSpeedButton then
      Begin
        frm_diag.label3.Visible := false;
        frm_diag.Edit2.Visible := false;
        frm_diag.SpeedButton3.Visible := false;
        frm_diag.Height := 120;
        //empresas.cenarios.Diagramas.Status := 'I' ;

       case TSpeedButton (sender as Tobject).Tag  of
         1 : Begin
              frm_diag.Edit2.Text := 'DPN';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'DPN';
             end;
          2 : Begin
              frm_diag.Edit2.Text := 'DUC';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'DUC';
             end;
           3 : Begin
              frm_diag.Edit2.Text := 'DEO';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'DEO';
             end;

           4 : Begin
              frm_diag.Edit2.Text := 'CLS';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'CLS';
             end;

           5 : Begin
              frm_diag.Edit2.Text := 'LIV';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'LIV';
             end;

           6 : Begin
              frm_diag.Edit2.Text := 'DMI';
              empresas.cenarios.Diagramas.Status := 'I' ;
              empresas.cenarios.Diagramas.IDG_DIR := 'DMI';
             end;

       end;
      end;
     frm_diag.showModal;
     tv.TvClick(frm_treeativ);
  end;


end;

function Tfrm_treeativ.Pesq_Bancos(pDir : boolean; pTipo_banco : integer;pTab : string) : TAdoConnection;

Begin
  Result := nil;
  
  idbext.Connected := false;
  Idbext.ConnectionString := '';
  case pTipo_Banco of
   0,1,2 : Begin
             If pDir then
               Begin
                 If frm_dir4 = nil then
                    frm_dir4 := Tfrm_dir4.create(self);
               end;
           end;
  4 :
  end;

  case pTipo_banco of
   0 : Begin
         
         If pDir then
          Begin
            frm_dir4.fl.Mask := '*.mdb';
            frm_dir4.ShowModal;
          end;
         iDbext.connected        := false;
         If bdx.Dirbanco = Dir_db then ///usando o mesmo banco de dados mdb já aberto
            iDbext := Bdx
         else
            iDbext.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Dir_db+';Persist Security Info=False';
                                       //'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\case2000.mdb;Persist Security Info=False'
         iDBado := idbExt;
       end;
   1 : Begin
         If pDir then
          Begin
            frm_dir4.fl.Mask := '*.db';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbParadox.connected        := false;
         idbParadox.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Paradox 7.x;Persist Security Info=False';
         IdbAdo := iDbParadox;
       end;

   2 : Begin         //dbase
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.dbf';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbDbase.connected        := false;
         idbDbase.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Dbase III;Persist Security Info=False';
         IdbAdo := iDbDbase;
       end;

   3 : Begin      //SQL SERVER
        IdbSqlserver.connected := false;
        idbSQLServer.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+NOME_BANCO+';Data Source='+SERVIDOR;
        IdbAdo := IdbSqlserver;
       end;

   4: Begin     //INFORMIX
        IdbInformix.connected := false;
        IdbInformix.ConnectionString := 'Provider=Ifxoledbc.2;Persist Security Info=False;Data Source='+NOME_BANCO+'@'+SERVIDOR;
       // idbSQLServer.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+NOME_BANCO+';Data Source='+SERVIDOR;
        IdbAdo := IdbInformix;
       end;
  end;

  result := IdbAdo;
  frm_bANCOS.CLOSE;



end;

procedure Tfrm_treeativ.Mostra_tabelas(pbanco : Tadoconnection; pTab : string;pForm : TForm ;pList: TListBox;pMostraTudo : boolean);
var
i: integer;
 Begin
   Begin
      If pBanco <> nil then
      begin
      pList.Clear;
      try
       pbanco.GetTableNames(pList.items,false);
         { verifica se a Tabela já não existe na Tabelas IDF_DADOS.....}
       with Tdad.create(self) do
        Begin
         Get_Tabelas(udado(tv.selected.data)^.Fcli,udado(tv.selected.data)^.FProj,false,'');
        If not pMostraTudo then
         Begin
            while not eof do
            Begin
               i := inLista( fieldbyname('IDF_TABELA').asstring,pList);
               If i >= 0 then
                pList.Items.Delete(i);    ; //....SE EXISTIR, DELETA DA LISTA
             next;
            end;
         end;  {}
         
          free;
        end;
      except
       If pForm <> nil then
         Begin
          If pForm is Tfrm_objetos then
           (pForm as Tfrm_objetos).fecha := true;
          pForm.close;
         end;
        raise;
      end;

      with pForm do
       Begin
         pList.BringToFront;
         Caption := Def88;
         If pForm is Tfrm_objetos then
          Begin
           (pForm as Tfrm_objetos). Edit1.Text := DIR_DB ;
           (pForm as Tfrm_objetos). Edit2.Text := Nome_banco;
           (pForm as Tfrm_objetos).gb.Caption  := def88;
          end
         else
         If pForm is Tfrm_Tabenga then
          Begin
           If TIPO_BANCO > 2 THEN
            Begin
              (pForm as Tfrm_Tabenga ). Edit1.Text := servidor ;

            end;
           (pForm as Tfrm_Tabenga ). Edit2.Text := Nome_banco;
           (pForm as Tfrm_Tabenga ).gb.Caption  := def88;
           (pForm as Tfrm_Tabenga ).label1.caption := inttostr((pForm as Tfrm_Tabenga ).srclist.Count);
          end   ;

         If ptab <> '' then
          Begin
            pList.ItemIndex := pList.items.IndexOf(ptab);
          end;
         show;
       end;
   end;
   end;
 end;


procedure Tfrm_treeativ.Pesq_Banco(pDir : boolean; pTab : string;pList : TListBox);

Begin
  If pDir then
   Begin
     If frm_dir4 = nil then
        frm_dir4 := Tfrm_dir4.create(self);
   end;



  case Tipo_banco of
   0 : Begin
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.mdb';
            frm_dir4.ShowModal;
          end;
         iDbext.connected        := false;
         iDbext.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Dir_db+';Persist Security Info=False';
         iDBado := idbExt;

       end;
   1 : Begin
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.db';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbParadox.connected        := false;
         idbParadox.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Paradox 7.x;Persist Security Info=False';
         IdbAdo := iDbParadox;
       end;

   2 : Begin         //dbase
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.dbf';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbDbase.connected        := false;
         idbDbase.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Dbase III;Persist Security Info=False';
         IdbAdo := iDbDbase;
       end;



  end;



  If tv.Diagrama.IDG_DIR = 'DUC' then
   Begin
      plist.Clear;

      try
       iDBado.GetTableNames(frm_objetos.lb.items,false);
      except
       If frm_objetos <> nil then

         Begin
          frm_objetos.fecha := true;
          frm_objetos.close;
         end;
        raise;
      end;
      with frm_objetos do
       Begin
         lb.BringToFront;
         Caption := def88;
         gb.Caption := def88;
         Edit2.Text := Nome_banco;
         Edit1.Text := dir_db;
       end;


   end
  else
   If tv.Diagrama.IDG_DIR = 'DMI' then
     Begin
       If frm_objetos = nil then
         frm_objetos := Tfrm_objetos.Create(SELF);
       frm_objetos.lb.items.Clear;

      try
       iDBado.GetTableNames(frm_objetos.lb.items,false);
      except
        If frm_objetos <> nil then
         Begin
          frm_objetos.fecha := true;
          frm_objetos.close;
         end;
        raise;
      end;

      frm_objetos.lb.BringToFront;
      frm_objetos.Caption := def88;
      frm_objetos.gb.Caption := def88;
      frm_Objetos.Edit2.Text := Nome_banco;
      frm_objetos.Edit1.Text := dir_db;


      frm_objetos.ShowModal;
      Cria_tabela;
     end;
     If ptab <> '' then
      Begin
        frm_objetos.lb.ItemIndex := frm_objetos.lb.items.IndexOf(ptab);
      end;

end;

procedure Tfrm_treeativ.Cria_tabela;
var
iTab : tdados_tab;
 Begin

 end;


procedure Tfrm_treeativ.Tree_Edit(Sender: TObject);
begin
 case tv.selected.level of
    0 : TVNovoCli(sender);
    1 : Abre_cenario(sender);
    2 : Abre_Diag(sender);
 end;
end;

procedure Tfrm_treeativ.Ed_todo(Sender: TObject);
var
  wnodeatu : TTreenode;
begin
  wNodeatu := tv.Selected;
  If frm_Todo     = nil then
    frm_Todo      := Tfrm_Todo.create(self);
  frm_todo.iTodo.CLI_ID := udado(tv.selected.Data)^.Fcli;
  frm_todo.iTodo.PRJ_ID := udado(tv.selected.Data)^.FProj;
  frm_todo.iTodo.IDG_ID := udado(tv.selected.Data)^.FDiag;
  If tv.selected.Level = 1 then //cenario
    frm_todo.iTodo.Get_dados (udado(tv.selected.Data)^.Fcli,udado(tv.selected.Data)^.FProj,0,false)
  else
    frm_todo.iTodo.Get_dados (udado(tv.selected.Data)^.Fcli,udado(tv.selected.Data)^.FProj,udado(tv.selected.Data)^.FDiag,false);

  frm_todo.showmodal;

  tv.selected := wnodeatu;
  tv.TvClick(self);
end;

procedure Tfrm_treeativ.encolher(Sender: TObject);
begin
  TV.selected.Collapse(true);
end;

procedure  Tfrm_treeativ.Trata_Entity(pEnt : afNode; pMouse : integer); //ENTIDADE
var
Wshape ,w: integer;
iTab : Tdados_tab;
wn : string;
iObj : afNode;
wlist : Tstrings;
s : String;
Begin
  If tv.Diagrama.IDG_DIR = 'LIV' then
   Begin
     If pent.Shape = 75 then
       begin
            If frm_text = nil then
               frm_text  := Tfrm_text.create(self);
            frm_text.show;
       end
     else
       Begin
           If frm_enttext = nil then
              frm_enttext := Tfrm_enttext.create(self);
           frm_enttext.edit1.text :=  pEnt.Text;
           frm_enttext.showmodal;
           pent.Text :=  dmi_desc;
       end;

      exit;
   end;

   with pEnt do
    begin
         //sh := pent.shape;
         Case shape of

         54,50,62,79,11:
            Begin      // 'processo_externo','acao_processo'
              If Shape = 62 then
               begin
                 If tv.Diagrama.IDG_DIR <> 'DUC' then
                    begin
                      If frm_conector = nil then
                         frm_conector  := Tfrm_conector.create(self);
                       frm_conector.show;
                      exit;
                    end;

                end;

          //    If  Checa_Acesso(uppercase('frm_ap'),frm_main.SEGHABILIATADO,0) then
              begin
                with  tv.empresas.cenarios.Diagramas.Objeto do
                  begin
                     Tabela := 'IDF_AP';
                     CLI_ID := udado(tv.selected.Data)^.Fcli;
                     PRJ_ID := udado(tv.selected.Data)^.FProj;

                     If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                         raise exception.Create(EI1);

                   end;

                   If frm_ap = nil then
                      frm_ap := Tfrm_ap.create(self);
                   with frm_ap do
                    begin
                      Tipo        := 'AP';
                      Visivel     := 'S';
                      Mode        := 'M';
                      AutoFecha   := true;
                      frm_ap.idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;

                      showModal;
                    end;
            end;
            end;
          14 : Begin  // Regra de negócio
              // If  Checa_Acesso(uppercase('frm_REGRA'),frm_main.SEGHABILIATADO,0) then
               BEGIN
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_RN';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_regra = nil then
                    frm_regra := tfrm_regra.Create(self);
                with frm_regra do
                 begin
                    Tipo        := 'RN';
                    Visivel     := 'S';
                    Mode        := 'M';
                    AutoFecha   := true;
                    idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                    showmodal;

                 end;
                 end;

              end ;
   56,59,65  : Begin  // evento de negócio
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_EN';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_en   = nil then
                    frm_en := tfrm_en.Create(self);
                frm_en.Tipo        := 'EN';
                frm_en.Visivel     := 'S';
                frm_en.Mode        := 'M';
                frm_en.AutoFecha   := true;
                frm_en.idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                frm_en.showmodal;
              end ;

   55,9,53  : Begin  // Entidade externa
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_CA';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_ca   = nil then
                    frm_ca := tfrm_ca.Create(self);
                frm_ca.Tipo        := 'CA';
                frm_ca.Visivel     := 'N';
                frm_ca.Mode        := 'M';
                frm_ca.AutoFecha   := true;
                frm_ca.dbrg.ItemIndex := 1;
                frm_ca.idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                frm_ca.showmodal;
              end ;


      2    : Begin  // juncao
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_JU';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_juncao   = nil then
                    frm_juncao := tfrm_juncao.Create(self);
                with frm_juncao do
                 begin
                    Tipo        := 'JU';
                    Visivel     := 'S';
                    Mode        := 'M';
                    AutoFecha   := true;
                    idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                    showmodal;
                 end;

              end ;
        10,61 : Begin  // pessoa
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_PS';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_pessoa   = nil then
                    frm_pessoa := tfrm_pessoa.Create(self);
                with frm_pessoa do
                 begin
                    Tipo        := 'PS';
                    Visivel     := 'S';
                    Mode        := 'M';
                    AutoFecha   := true;
                    idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                    showmodal;
                 end;

              end ;
          58,15,8 : Begin  // Objeto Interface
                with  tv.empresas.cenarios.Diagramas.Objeto do
                begin
                   Tabela := 'IDF_OI';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                       raise exception.Create(EI1);
                 end;

                If frm_ev   = nil then
                    frm_ev := tfrm_ev.Create(self);
                with frm_ev do
                 begin
                    If shape = 8 then
                       tipo := 'OC'
                    else
                       Tipo  := 'OI';
                    Visivel     := 'S';
                    Mode        := 'M';
                    AutoFecha   := true;
                    idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                    showmodal;
                 end;
              end ;

           1  : Begin  // Modelo informaçao  ou Junção

                If tv.Diagrama.IDG_DIR = 'DPN' then    // junção
                 begin
                    iObj := tv.Diagrama.Obtem_JUncUp(pEnt);
                    If iObj = nil then
                       raise exception.Create(EI1);
                    with  tv.empresas.cenarios.Diagramas.Objeto do
                    begin
                       Tabela := 'IDF_JU';
                       CLI_ID := udado(tv.selected.Data)^.Fcli;
                       PRJ_ID := udado(tv.selected.Data)^.FProj;

                     If not Open_Objeto(CLI_ID,PRJ_ID,iObj.userdata,TABELA) then
                           raise exception.Create(EI1);
                     end;

                    If frm_juncao   = nil then
                        frm_juncao := tfrm_juncao.Create(self);
                    with frm_juncao do
                     begin
                        Tipo        := 'JU';
                        Visivel     := 'S';
                        Mode        := 'M';
                        AutoFecha   := true;
                        idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                        showmodal;
                     end;
                 end
                else
                If tv.Diagrama.IDG_DIR = 'DMI' then    // objeto de negócio
                  begin
                      with  tv.empresas.cenarios.Diagramas.Objeto do
                      begin
                         Tabela := 'IDF_IF';
                         CLI_ID := udado(tv.selected.Data)^.Fcli;
                         PRJ_ID := udado(tv.selected.Data)^.FProj;

                       If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                             raise exception.Create(EI1);
                       end;

                      If frm_if   = nil then
                          frm_if := tfrm_if.Create(self);
                      with frm_if do
                       begin
                          Tipo        := 'IF';
                          Visivel     := 'S';
                          Mode        := 'M';
                          AutoFecha   := true;
                          idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                          showmodal;
                       end;
                    end
               else
               If tv.Diagrama.IDG_DIR = 'CLS' then    // diagrama de classes
                  begin
                      with  tv.empresas.cenarios.Diagramas.Objeto do
                      begin
                         Tabela := 'IDF_CS';
                         CLI_ID := udado(tv.selected.Data)^.Fcli;
                         PRJ_ID := udado(tv.selected.Data)^.FProj;
                       If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                             raise exception.Create(EI1);
                       end;
                      If frm_CS   = nil then
                          frm_CS := tfrm_CS.Create(self);
                      with frm_CS do
                       begin
                          Tipo        := 'CS';
                          Visivel     := 'S';
                          Mode        := 'M';
                          AutoFecha   := true;
                          idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                          showmodal;
                       end;
                    end

              else
              If tv.Diagrama.IDG_DIR = 'DUC' then    // objeto de negócio
                  begin
                      with  tv.empresas.cenarios.Diagramas.Objeto do
                      begin
                         Tabela := 'IDF_IF';
                         CLI_ID := udado(tv.selected.Data)^.Fcli;
                         PRJ_ID := udado(tv.selected.Data)^.FProj;

                       If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                            raise exception.Create(EI1);
                       end;

                      If frm_if   = nil then
                          frm_if := tfrm_if.Create(self);
                      with frm_if do
                       begin
                          Tipo        := 'IF';
                          Visivel     := 'S';
                          Mode        := 'M';
                          AutoFecha   := true;
                          idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                          showmodal;
                       end;
                    end
              end;

          75 :
           begin
             If (text = def935{'Sim'}) or (text = def240  {nao})   then
                begin
                  If frm_texto = nil then
                     frm_texto  := Tfrm_texto.create(self);
                  frm_texto.show;
                end
             else
              begin
                If frm_text = nil then
                   frm_text  := Tfrm_text.create(self);
                frm_text.show;
              end
         end;

          0 :  Begin   // 'objeto_entidade'
               If tv.Diagrama.IDG_DIR = 'DUC' then    // objeto de negócio
                  begin
                      with  tv.empresas.cenarios.Diagramas.Objeto do
                      begin
                         Tabela := 'IDF_IF';
                         CLI_ID := udado(tv.selected.Data)^.Fcli;
                         PRJ_ID := udado(tv.selected.Data)^.FProj;

                       If not Open_Objeto(CLI_ID,PRJ_ID,pEnt.userdata,TABELA) then
                             raise exception.Create(EI1);
                       end;

                      If frm_if   = nil then
                          frm_if := tfrm_if.Create(self);
                      with frm_if do
                       begin
                          Tipo        := 'IF';
                          Visivel     := 'S';
                          Mode        := 'M';
                          AutoFecha   := true;
                          idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                          showmodal;
                       end;
                    end;
              end;
           end;
         end;
    end;

procedure Tfrm_TreeAtiv.Trata_link(pLink : afLink;pMouse :integer);   //Click relation
var
  Wrel : afLink;
  WentSource : afNode;
  Wlink : integer;
  z ,Tot : integer;
  x0,y0,x1,y1  : real;
  iCorr : Tdados_tab;
begin
   Wrel                 := tv.diagrama.Link;
   WEntSource           := Wrel.org;
   WEntDestination      := Wrel.dst;
   WrelSelected         := Wrel;
   Wlink                := Wrel.LinkStyle;

   if tv.diagrama.IDG_DIR = 'DMI' then
   begin
     Case Wlink of
        2,3,4,5 :   Begin   //conexões
                      If frm_dmicon     = nil then
                         frm_dmicon     := Tfrm_dmicon.create(self);

                      frm_dmicon.edit1.text :=  pLink.Text;
                      frm_dmicon.showmodal;
                      pLink.Text :=  dmi_desc;
                      exit;
                    end;
        else
          exit;
     end;
    end;
   Case Wlink of
   2,5,6,9 : begin     //fluxo de dados
               If tv.diagrama.IDG_DIR = 'DPN' then
                begin
                 If WRel.org.Shape = 2 then  // Junction
                    exit;

                 with  tv.empresas.cenarios.Diagramas.Objeto do
                 begin
                   Tabela := 'IDF_DG';
                   CLI_ID := udado(tv.selected.Data)^.Fcli;
                   PRJ_ID := udado(tv.selected.Data)^.FProj;

                 If not Open_Objeto(CLI_ID,PRJ_ID,pLink.userdata,TABELA) then
                       raise exception.Create(EI1);


                If frm_data  = nil then
                   frm_data := tfrm_Data.Create(self);
                frm_data.Tipo         := 'DG';
                frm_data.Visivel      := 'S';
                frm_data.Mode         := 'M';
                frm_data.AutoFecha    := true;
                frm_data.idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                frm_data.showmodal;
                { Quando link é fluxo de dados, cria correlação c/ativiadade origem = produto de requerim. de TI}
                If wRel.Text <> '' then
                begin
                If wLink in cFluxos then   //fluxos de dados
                 begin
                   if (WentSource.shape in [11,50,79,62])  then  // atividade
                   begin
                    {cria correlação com origem}
                    try
                      iCorr := Tdados_tab.Create(self);
                      iCorr.Cria_Correlacao(CLI_ID,PRJ_ID,'AP',WEntSource.Userdata,'DG',wrel.userData,' ',0,0);
                      tv.Diagrama.Salvar;
                    finally
                      freeandnil(iCorr);
                    end;
                   end;
                end;
              end;
            end;
          end ;
        end;
   end;
end;

procedure Tfrm_treeativ.SpeedButton14Click(Sender: TObject);
begin
  with Tv.Diagrama do
   begin
     If  SelNodes.Count = 1 then
         begin
           entidade := selectedNode;
           abaixo(entidade);
         end
     else
       raise exception.Create(mens11);
   end;
end;

procedure Tfrm_treeativ.SpeedButton17Click(Sender: TObject);
begin
  tv.diagrama.salvar;
end;

procedure Tfrm_treeativ.SpeedButton15Click(Sender: TObject);
begin
  with tv.diagrama do
   begin
      acima;
   end;
end;

procedure Tfrm_treeativ.sp2Click(Sender: TObject);

begin
 tv.diagrama.selectAction := afNoSelection;
 tv.diagrama.linkstyle := TSpeedButton(sender as Tobject).tag;
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP1' then
   begin
      tv.diagrama.bt_inf := 1;
   end
 else
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP2' then
   begin
      tv.diagrama.bt_inf := 2;
   end
 else
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP3' then
   begin
      tv.diagrama.bt_inf  := 3;
   end ;
end;



procedure Tfrm_treeativ.SpeedButton18Click(Sender: TObject);
begin
  tv.diagrama.selectAction := afNoSelection;
  tv.diagrama.shape := TSpeedButton(sender as Tobject).tag;


  if TSpeedButton(sender as Tobject).tag <> 2 then
  Begin
     //tv.diagrama.Shadow := 1;
     if TSpeedButton(sender as Tobject).tag <> 51 then
     Begin
         //tv.diagrama.Shadow := 1;
         if TSpeedButton(sender as Tobject).tag <> 75 then
         Begin
            //tv.diagrama.Shadow := 1;
            if TSpeedButton(sender as Tobject).tag <> 14 then
            Begin
               //tv.diagrama.Shadow := 1;
            End
            Else
            Begin
               //tv.diagrama.Shadow := 0;
            End
         End
         Else
         Begin
            //tv.diagrama.Shadow := 0;
         End
     End
     Else
     Begin
         //tv.diagrama.Shadow := 0;
     End
  End
  Else
  Begin
     //tv.diagrama.Shadow := 0;
  End;
  WNome_Ju := Uppercase(TSpeedButton(sender as Tobject).Name);
end;

procedure Tfrm_treeativ.SpeedButton27Click(Sender: TObject);
begin
  with tv.diagrama do
   begin
      selectAction := afNoSelection;
      linkstyle := TSpeedButton(sender as Tobject).tag;
      If uppercase(TSpeedButton(sender as Tobject).name) = 'SP1' then
        begin
          bt_inf := 1;
          //tv.Diagrama.ArrowDst := 16;
          //tv.Diagrama.ArrowOrg := 17;
        end
      else
      If uppercase(TSpeedButton(sender as Tobject).name) = 'SP2' then
        begin
          bt_inf := 2;
        end
      else
      If uppercase(TSpeedButton(sender as Tobject).name) = 'SP3' then
        begin
          bt_inf := 3;
        end
      else
      If uppercase(TSpeedButton(sender as Tobject).name) = 'SP_AGREG' then
        begin
          bt_inf := 4;    //UML
        end

   end;
end;

procedure Tfrm_treeativ.Lista1Click(Sender: TObject);
var
  wdst,iRn,WOrg ,i,j,wNodeSelected: integer;
  sqlant,wclass : string;
  WNodeExcl : TTreeNode;
  iTab : Tdados_tab;
  iup,iDown  : afNode;
begin
  If (tv.Diagrama.SelNodes.Count > 1) or (tv.Diagrama.SelNodes.Count = 0) then
   Raise exception.create(mens11);

  If (tv.Diagrama.SelectedNode.Text <> '')
     and (tv.Diagrama.SelectedNode.Text <> def90)
     and (tv.Diagrama.SelectedNode.Text <> def91)
     and (tv.Diagrama.SelectedNode.Text <> 'xxxxxxxx') then
   Raise exception.create(Mens46);
  iTab := Tdados_tab.create(self);
try
  with itab  do
  begin
   ListaCli := tv.Empresas.cenarios.CLI_ID ;
   ListaProj:= tv.Empresas.cenarios.PRJ_ID ;
   ListaTag := 0 ;
   ListaEdit:= false ;
   ListaTree:= nil;
   Listafecha := true;
   ListaId  := 0;
  end;
  wNodeSelected :=  tv.Diagrama.SelectedNode.UserData;
  with tv.Diagrama do
   begin
// diagramas atividades

       If IDG_DIR = 'DPN' then
        begin
          If SelectedNode <> nil then
          begin
           Case SelectedNode.Shape of     //atividade
           11,50,79:
              begin
                 iTab.ListaDim := 'IDF_AP' ;
                 itab.ListaTit := Def63+'s' ;
                 iTab.mostra_lista;
                 If (iTab.ListaCodigo = 0)  then
                    raise exception.create(mens11);
                 DiagDupl := false;
                 Check_Ascendencia(udado(tv.selected.data)^.Fcli,udado(tv.selected.data)^.FProj,udado(tv.selected.data)^.FDiag,
                                                                            itab.listaCodigo);
                 If DiagDupl then
                     raise exception.create(Mens12);
            //    If iTab.ListaCodigo = tv.Diagrama.IDG then   // atividade escolhida = diagrama corrente



               //verifica se a atividade tem decomposição ...........
                WNodeExcl := tv.get_filho(tv.selected,SelectedNode.UserData);
                IF WNodeExcl <> nil then
                   tv.Items.Delete(WNodeexcl);

                  If SelectedNode.shape in [11,79,50] then
                     begin
                       with Tdados_tab.create(self) do
                        begin
                          open_objeto(udado(tv.selected.data)^.Fcli,
                                      udado(tv.selected.data)^.FProj,
                                      itab.listaCodigo,'IDF_AP');
                          If SelectedNode.shape in [11,50] then
                           Begin
                             tv.Diagrama.Obtem_Ator(selectedNode).Text := fieldbyname('IDF_ATOR1').asstring;
                             tv.Diagrama.Obtem_wbs(selectedNode).text  := fieldbyname('IDF_WBS_CODE').asstring;
                           end;

                          selectednode.ToolTip :=  fieldbyname('IDF_TIPO_ATIV').asstring;

                        end;
                       If selectednode.ToolTip = 'UC' then
                          begin
                            wclass := 'DUC' ;
                            Rig_width  := tv.Diagrama.Width / 7;
                            Rig_Height := Rig_Width ;;
                            Rig_top    := tv.Diagrama.SelectedNode.Top + tv.Diagrama.SelectedNode.Height;
                            Rig_Left   := (tv.Diagrama.SelectedNode.Left +
                                           tv.Diagrama.SelectedNode.Width) - Rig_width;
                            tv.Diagrama.Cria_ducant(tv.Diagrama.SelectedNode,false,
                              0,Rig_top,Rig_left,Rig_width,rig_height,12); // compatibilidade versoes anteriores
                            tv.Diagrama.Cria_duc(tv.Diagrama.SelectedNode,True,
                              0,Rig_top,Rig_left,Rig_width,rig_height,4);
                          end

                       else
                          begin
                            wclass := 'DPN';
                            tv.Diagrama.Cria_duc( tv.Diagrama.SelectedNode,False,
                             0,0,0,0,0,4);
                             
                            
                          end;


                       SelectedNode.text        :=  itab.Listadesc;
                       SelectedNode.UserData    :=  itab.ListaCodigo;


                      // Recria_corr(SelectedNode); // recria as correlações com nova atividade
                       tv.Incluir_TVDiag(Tv.selected,udado(tv.selected.data)^.Fcli,
                                      udado(tv.selected.data)^.FProj,
                                      itab.listaCodigo,iTab.ListaDesc,wclass,false);

                       { TODO 4 -c6.00.023 :
Corrigido :	Quando e pressionado alguma letra como atalho em uma lista qualquer e não e confirmado a escolha,  o BEST confirma a escolha do item da lista, obrigando o usuário a apagar o item e refazer o desenho
Lay out tela requerimentos de TI rearrangada
Reposicionamento na atividade após escolha na lista }
                       tv.Diagrama.SelectedNode := tv.Diagrama.Get_Node(tv.Diagrama,itab.ListaCodigo) ;
                       frm_main.decomposto := false;
                       tv.Diagrama.Criar_correl_decomposto(tv.Diagrama,tv.Diagrama.SelectedNode);
                     end;

              end;
              54 :              //processo externo
              begin
                 iTab.ListaDim := 'IDF_AP' ;
                 itab.ListaTit := Def63+'s' ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc+#13+#13+iTab.ListaWbs;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;
              55 :              //entidade externa
              begin
                 iTab.ListaDim := 'IDF_CA' ;
                 itab.ListaTit := Def4 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;

               53 :              //ator  externo
                begin
                   iTab.ListaDim := 'IDF_CA' ;
                   itab.ListaTit := Def4 ;
                   iTab.mostra_lista;
                   If iTab.ListaCodigo = 0 then
                     raise exception.create(mens11);
                   SelectedNode.text        :=  itab.Listadesc;
                   SelectedNode.UserData    :=  itab.ListaCodigo;
                end;
                 14 :              //regras
              begin
                 iTab.ListaDim := 'IDF_RN' ;
                 itab.ListaTit := Def5 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
                // Recria_corr(selectedNode); // cria correl. entre nova regra e atividade
              end;
              65,56 :              //evento de negócio
              begin
                 iTab.ListaDim := 'IDF_EN' ;
                 itab.ListaTit := Def2 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
                // Recria_corr(SelectedNode);   // cria correlação entre novo evento e atividade
              end;
              2 :              //Junção   (parte de cima)
              begin
                 iTab.ListaDim := 'IDF_JU' ;
                 itab.ListaTit := Def3 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 iDown:= tv.diagrama.Obtem_Junc(SelectedNode);
                 with Tdados_tab.create(self) do
                   Begin
                    If  open_objeto(udado(tv.selected.data)^.Fcli,
                                      udado(tv.selected.data)^.FProj,
                                      itab.listaCodigo,'IDF_JU') then
                       Begin
                         If  iDown <> nil then
                            iDown.Text := fieldbyname('IDF_LOGICA').asstring;;

                       end;
                    free;
                  end;
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;
             1 :              //Junção  (parte de baixo0
              begin   { TODO -c6-00-25 : Corrigido : colocação do O,E,E/OU na parte inferior do objeto junção }
                 iUp := tv.Diagrama.Obtem_JuncUp(selectedNode)  ;
                 iDown := selectedNode;
                 If iUp <> nil then
                  begin
                   iTab.ListaDim := 'IDF_JU' ;
                   itab.ListaTit := Def3 ;
                   iTab.mostra_lista;
                   If iTab.ListaCodigo = 0 then
                     raise exception.create(mens11);

                   with Tdados_tab.create(self) do
                   Begin
                    If  open_objeto(udado(tv.selected.data)^.Fcli,
                                      udado(tv.selected.data)^.FProj,
                                      itab.listaCodigo,'IDF_JU') then
                       Begin
                         If  iDown <> nil then
                            iDown.Text := fieldbyname('IDF_LOGICA').asstring;;

                       end;


                    free;
                  end;

                   iUp.text        :=  itab.Listadesc;
                   iUp.UserData    :=  itab.ListaCodigo;

                  end;

              end;

           end; //endcase
          end // end selectednode <> nil
        end //end IDGDIR
        else
//diagramas use case
        If IDG_DIR = 'DUC' then
          begin
           If SelectedNode <> nil then
           begin
             Case SelectedNode.Shape of
             53 :              //atores
              begin
                 iTab.ListaDim := 'IDF_CA' ;
                 itab.ListaTit := Def10 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;
             58 :              //Objeto de interface
              begin
                 iTab.ListaTag := 5;
                 iTab.ListaDim := 'IDF_OI' ;
                 itab.ListaTit := Def6 ;
                 z :=  SelectedNode.UserData ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                   { atualiza dewscrição da instancia criada : para cada descricao obtida da lista,
                     é criada um registro na tabela OI - atenção todos os objetos aparecem duplicados na lista}

                {inibido em 12/07/2005, para evitar redundancia na tabela OI}
                { with Tdados_tab.create(self) do
                  Begin
                    If  Open_objeto(tv.Empresas.cenarios.CLI_ID,tv.Empresas.cenarios.PRJ_ID,
                                 SelectedNode.UserData ,'IDF_OI') then
                        Begin
                         edit;
                         fieldbyname('IDF_DESIGNACAO').value :=  itab.Listadesc;
                         post;
                         free;
                        end;  
                  end;     }
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
                // ReCria_corr(SelectedNode);
              end;
             62 :              //use case
              begin
                 iTab.ListaTag := 999;
                 iTab.ListaDim := 'IDF_AP' ;
                 itab.ListaTit := Def64+'s' ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);

                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;
               8 :              //Objeto de controle
              begin
                 iTab.ListaTag := 16;
                 iTab.ListaDim := 'IDF_OI' ;
                 itab.ListaTit := Def7 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                   { atualiza dewscrição da instancia criada : para cada descricao obtida da lista,
                     é criada um registro na tabela OI - atenção todos os objetos aparecem duplicados na lista}
                 with Tdados_tab.create(self) do
                  Begin
                    If  Open_objeto(tv.Empresas.cenarios.CLI_ID,tv.Empresas.cenarios.PRJ_ID,
                                 SelectedNode.UserData ,'IDF_OI') then
                        Begin
                         edit;
                         fieldbyname('IDF_DESIGNACAO').value :=  itab.Listadesc;
                         post;
                         free;
                        end;
                  end;        
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;
              end;
              0 :              //Objeto entidade
              begin
                //Abre_Objeto;

                 iTab.ListaDim := 'IDF_IF' ;
                 itab.ListaTit := Def8 ;
                 iTab.mostra_lista;
                 If iTab.ListaCodigo = 0 then
                   raise exception.create(mens11);
                 SelectedNode.text        :=  itab.Listadesc;
                 SelectedNode.UserData    :=  itab.ListaCodigo;

              end;
             end; // endcase
           end;
          end
        else
          If IDG_DIR = 'DMI' then
           begin
             If SelectedNode <> nil then
              begin
                Case SelectedNode.Shape of
                   1 :              //Objeto de Negocio
                  begin
                     iTab.ListaDim := 'IDF_IF' ;
                     itab.ListaTit := Def12 ;
                     iTab.mostra_lista;
                     If iTab.ListaCodigo = 0 then
                       raise exception.create(mens11);
                     DiagDupl := false;
                     Check_Ascendencia(udado(tv.selected.data)^.Fcli,udado(tv.selected.data)^.FProj,udado(tv.selected.data)^.FDiag,
                                                                            itab.listaCodigo);
                     If DiagDupl then
                       raise exception.create(Mens12);
                     SelectedNode.text        :=  itab.Listadesc;
                     SelectedNode.UserData    :=  itab.ListaCodigo;
                  end;

                end;
              end;
           end
         else
          If IDG_DIR = 'DEO' then
           begin
             If SelectedNode <> nil then
              begin
                Case SelectedNode.Shape of
                  9 :              //atores
                  begin
                     iTab.ListaDim := 'IDF_CA' ;
                     itab.ListaTit := Def10 ;
                     iTab.mostra_lista;
                     If iTab.ListaCodigo = 0 then
                       raise exception.create(mens11);
                       DiagDupl := false;
                       Check_Ascendencia(udado(tv.selected.data)^.Fcli,udado(tv.selected.data)^.FProj,udado(tv.selected.data)^.FDiag,
                                                                            itab.listaCodigo);
                       If DiagDupl then
                         raise exception.create(Mens12);//stadesc;
                     SelectedNode.UserData    :=  itab.ListaCodigo;
                     SelectedNode.text        :=  itab.Listadesc;
                  end;
                   61 :              //pessoas
                  begin
                     iTab.ListaDim := 'IDF_PS' ;
                     itab.ListaTit := Def13 ;
                     iTab.mostra_lista;
                     If iTab.ListaCodigo = 0 then
                       raise exception.create(mens11);
                     SelectedNode.text        :=  itab.Listadesc;
                     SelectedNode.UserData    :=  itab.ListaCodigo;
                  end;

                end;
              end;
           end
          else
          If IDG_DIR = 'CLS' then
           begin
             If SelectedNode <> nil then
              begin
                Case SelectedNode.Shape of
                  1 :              //atores
                  begin
                     iTab.ListaDim := 'IDF_CS' ;
                     itab.ListaTit := Def233 ;
                     iTab.mostra_lista;
                     If iTab.ListaCodigo = 0 then
                       raise exception.create(mens11);
                       DiagDupl := false;

                     If DiagDupl then
                         raise exception.create(Mens12);//stadesc;
                     SelectedNode.UserData    :=  itab.ListaCodigo;


                     with  tv.empresas.cenarios.Diagramas.Objeto do
                      begin
                         Tabela := 'IDF_CS';
                         CLI_ID := udado(tv.selected.Data)^.Fcli;
                         PRJ_ID := udado(tv.selected.Data)^.FProj;

                       If not Open_Objeto(CLI_ID,PRJ_ID,SelectedNode.UserData,TABELA) then
                             raise exception.Create(EI1);
                       end;

                      If frm_CS   = nil then
                          frm_CS := tfrm_CS.Create(self);
                      with frm_CS do
                       begin
                          Id          :=  SelectedNode.UserData  ;
                          Tipo        := 'CS';
                          Visivel     := 'S';
                          Mode        := 'M';
                          AutoFecha   := true;
                          idatasource := tv.empresas.cenarios.Diagramas.Objeto.DataExt;
                          FormShow(nil);
                          sp2Click(nil);   //confirma
                          
                       end;
                 end;

                end;
              end;
           end

   end;
finally
 If  tv.Diagrama.SelectedNode <> nil then
   tv.Diagrama.SelectedNode.EnsureVisible;
 freeandnil(iTab);
end;
end;

procedure Tfrm_treeativ.recria_corr(pNode : afNode);
var
  i : integer;
  itb : TDados_tab;
Begin
   try
     iTb :=  tDados_tab.create(self);
     If pNode.shape in [11,79,50] then //atividade
     Begin
        for i := 1 to pNode.iNlinks.Count do
         Begin
            case pNode.inLinks.Item(i).LinkStyle of
             4 :  Begin    // cria corr entre ativ e rn
                    itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                        udado(tv.selected.data)^.FProj, 'AP', pNode.UserData,
                                      'RN',pNode.inLinks.Item(i).Org.UserData,' ',0,0);
                  end;
             2,5,6,8 : Begin   // cria corr entre ativ e evento de negocio
                        If  pNode.inLinks.Item(i).Org.Shape in  [56,59,65] then
                         Begin
                           itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                        udado(tv.selected.data)^.FProj, 'AP', pNode.UserData,
                                      'EN',pNode.inLinks.Item(i).Org.UserData,' ',0,0);
                         end;
                       end;


            end;
         end;

        for i := 1 to pNode.outlinks.Count do
        Begin
          case pNode.outLinks.Item(i).LinkStyle of

           2,5,6,8 : Begin   // cria corr entre ativ e produto(fluxo)
                       Begin
                         itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                      udado(tv.selected.data)^.FProj, 'AP', pNode.UserData,
                                    'DG',pNode.outLinks.Item(i).UserData,' ',0,0);
                       end;
                     end;
          end;
        end;

     end
   else
     If pNode.shape in [56,59,65] then //evento de negócio
     Begin
        for i := 1 to pNode.outlinks.Count do
         Begin
           case pNode.outLinks.Item(i).LinkStyle of
             2,5,6,8 : Begin   // cria corr entre ativ e evento de negocio
                        If  pNode.outLinks.Item(i).Org.Shape in  [56,59,65] then
                         Begin
                           itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                        udado(tv.selected.data)^.FProj, 'AP',
                                        pNode.outLinks.Item(i).dst.UserData ,
                                        'EN',pNode.UserData,' ',0,0);
                         end;
                       end;
            end;
         end;
     end
   else
     If pNode.shape in [14] then //Regra de negócio
     Begin
        for i := 1 to pNode.outlinks.Count do
         Begin
           case pNode.outLinks.Item(i).LinkStyle of
             4 : Begin   // cria corr entre ativ e evento de negocio
                    //    If  pNode.outLinks.Item(i).Org.Shape in  [56,59,65] then
                         Begin
                           itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                        udado(tv.selected.data)^.FProj, 'AP',
                                        pNode.outLinks.Item(i).dst.UserData ,
                                        'RN',pNode.UserData,' ',0,0);
                         end;
                       end;
            end;
         end;
     end ;

   finally
     freeandnil(itb);
   end;


 end;

 procedure Tfrm_treeativ.recria_corrRel(pdg : afLink);
var
i : integer;
itb : TDados_tab;
 Begin
   try
     iTb :=  tDados_tab.create(self);
     If pDg.LinkStyle in [2,5,6,9] then //fluxos
     Begin
        If pDg.Org.Shape in [11,79,50] then
         Begin      // cria corr entre ativ e fluxo
              itb.cria_Correlacao(udado(tv.selected.data)^.Fcli,
                                udado(tv.selected.data)^.FProj, 'AP', pDg.Org.UserData,
                                'DG',pDg.UserData,' ',0,0);
         end;

     end
   finally
     freeandnil(itb);
   end;
 end;


procedure Tfrm_treeativ.Abrir2Click(Sender: TObject);
begin
  tv.Diagrama.Abre_Objeto;
end;

procedure Tfrm_treeativ.Atrs1Click(Sender: TObject);
var
wbs,wator : afNode;
i : integer;
begin
  If tv.Diagrama.SelNodes.Count > 0 then
   begin
    for i := 1 to tv.Diagrama.SelNodes.Count do
     begin
       tv.Diagrama.SelNodes.Item(i).ZOrder := 1;
     end;

   end;
 
end;

procedure Tfrm_treeativ.Frente1Click(Sender: TObject);
var
wbs,wator : afNode;
i : integer;
begin

 If tv.Diagrama.SelNodes.Count > 0 then
   begin
    for i := 1 to tv.Diagrama.SelNodes.Count do
     begin
       tv.Diagrama.SelNodes.Item(i).ZOrder := 0;
     end;

   end;
end;

procedure Tfrm_treeativ.IncluiImagem1Click(Sender: TObject);
begin
  tv.Diagrama.Insere_imagem(sender);
end;

procedure Tfrm_treeativ.AjustaImagemaEntidade1Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(true);
end;

procedure Tfrm_treeativ.frm_dgAjustaEntidadeaImagem1Click(Sender: TObject);
begin
 tv.Diagrama.Ajusta_Imagem(false);
end;

procedure Tfrm_treeativ.SpeedButton35Click(Sender: TObject);
begin
  tv.Diagrama.selectAction := afNoSelection;
  tv.Diagrama.Shape        := TSpeedButton(sender as Tobject).tag;
  WNome_Ju                 := Uppercase(TSpeedButton(sender as Tobject).Name);
end;

procedure Tfrm_treeativ.SpeedButton37Click(Sender: TObject);
begin
 tv.Diagrama.selectAction := afNoSelection;
 tv.Diagrama.linkstyle := TSpeedButton(sender as Tobject).tag;
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP1' then
   begin
      tv.Diagrama.BT_INF := 1;
   end
 else
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP2' then
   begin
     tv.Diagrama.BT_INF := 2;
   end
 else
 If uppercase(TSpeedButton(sender as Tobject).name) = 'SP3' then
   begin
      tv.Diagrama.BT_INF := 3;
   end ;
end;

procedure Tfrm_treeativ.Lista2Click(Sender: TObject);
var
  wdst,iRn,WOrg ,i,j: integer;
  sqlant,wclass : string;
  WNodeExcl : TTreeNode;
  iTab : Tdados_tab;
begin
  for i := 1 to tv.Diagrama.SelLinks.Count do
   Begin
    If tv.Diagrama.sellinks.Item(i).text <> '' then
     Begin
      Raise exception.create(mens46);
      exit;
     end;
   end;

  iTab := Tdados_tab.create(self) ;
  with itab  do
  begin
   ListaCli := tv.Empresas.cenarios.CLI_ID ;
   ListaProj:= tv.Empresas.cenarios.PRJ_ID ;
   ListaTag := 0 ;
   ListaEdit:= false ;
   ListaTree:= nil;
   Listafecha := true;
   ListaId  := 0;
  end;

  with tv.Diagrama do
   begin
// diagramas atividades
   If IDG_DIR = 'DPN' then
    begin
     If sellinks.count > 0 then
       begin
        for j := 1 to sellinks.count do
         begin
           case  sellinks.item(j).LinkStyle of
            2,5,6,9 :
              begin
                //Recria_CorrRel(sellinks.item(j));
              end
           else
            begin
              showmessage(mens35);
              exit;
            end;
            end; // endcase
         end;
       end;

    iTab.ListaDim := 'IDF_DG' ;
    itab.ListaTit := Def9 ;
    iTab.mostra_lista;
    If iTab.ListaCodigo = 0 then
     raise exception.create(mens11);

    for j := 1 to tv.Diagrama.sellinks.count do
    begin
       tv.Diagrama.sellinks.Item(j).userdata := iTab.ListaCodigo;
       tv.Diagrama.sellinks.Item(j).text     := itab.Listadesc;
       If tv.Diagrama.sellinks.Item(j).linkStyle in cFluxos
        then   //fluxos de dados
            begin
              // If (WentSource.shape in [11,50,79,62])  then  // evento com atividade
               If (tv.Diagrama.sellinks.Item(j).Org.Shape in [11,50,79,62])  then  // evento com atividade
                 begin
                    {cria correlação com origem}
                   itab.Cria_Correlacao ( tv.Empresas.cenarios.CLI_ID ,tv.Empresas.cenarios.PRJ_ID ,
                                     'AP', tv.Diagrama.sellinks.Item(j).Org.Userdata,'DG',
                                     tv.Diagrama.sellinks.Item(j).userdata,' ',0,0);
                    salvar;
                 end;
             end
    end;
   end; //end DPN
   //diagramas use case
   end;// tv.diagrama
end;

procedure Tfrm_treeativ.SpeedButton4Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(4);
end;

procedure Tfrm_treeativ.SpeedButton5Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(1);
end;

procedure Tfrm_treeativ.SpeedButton3Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(2);
end;

procedure Tfrm_treeativ.spyClick(Sender: TObject);
begin
 tv.Diagrama.Alinha(3);
end;

procedure Tfrm_treeativ.SpeedButton42Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(8);
end;

procedure Tfrm_treeativ.SpeedButton49Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(9);
end;

procedure Tfrm_treeativ.SpeedButton6Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(6);
end;

procedure Tfrm_treeativ.SpeedButton2Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(5);
end;

procedure Tfrm_treeativ.SpeedButton8Click(Sender: TObject);
begin
 tv.Diagrama.Alinha(5);
 tv.Diagrama.Alinha(6);
end;

procedure Tfrm_treeativ.spb_normalClick(Sender: TObject);
begin
  tv.Diagrama.xzoom := 100;
  tv.Diagrama.yzoom := 100;
end;

procedure Tfrm_treeativ.spb_ajusteClick(Sender: TObject);
begin
  tv.Diagrama.xzoom := 0;
  tv.Diagrama.yzoom := 0;
end;

procedure Tfrm_treeativ.SpeedButton13Click(Sender: TObject);
begin
  with tv.Diagrama do
  begin
    xZoom := xzoom - 10;
    yzoom := xzoom;
  end;
end;

procedure Tfrm_treeativ.SpeedButton1Click(Sender: TObject);
begin
   with tv.Diagrama do
   begin
    xZoom := xzoom + 10;
    yzoom := xzoom;
   end;
end;

procedure Tfrm_treeativ.getdst1Click(Sender: TObject);

type
  uLst = ^TLst;
  TLst = record
    dstNode : afNode;
    lnk     : afLink;
    tipo    : char;
end;

var
iList : TList;
i : integer;
s : string;
mLst : uLst;
begin
   iList := TList.create;
   iList := tv.Diagrama.Get_Nodes(tv.Diagrama.SelectedNode,'O');
   for i := 0 to iList.Count-1 do
    Begin
      mLst := iList.Items[i];
      s := s + #13+mLst^.dstNode.Text +'-'+mLst^.tipo+'-'+inttostr(mLst^.lnk.LinkStyle);

    end;
    showmessage(s);
end;

procedure Tfrm_treeativ.SpeedButton43Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := afSelectItems;
end;

procedure Tfrm_treeativ.SpeedButton20Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := 2;
end;

procedure Tfrm_treeativ.Delete1Click(Sender: TObject);
begin
  tv.Diagrama.SelectedNode.picture := nil;
end;

procedure Tfrm_treeativ.Propriedades1Click(Sender: TObject);
var
  i : integer;
  wi : variant;
  wfont : iFontDisp;
begin
  If frm_propr = nil then
     frm_propr := Tfrm_propr.Create(self);
  with frm_propr do
   Begin
      rg_Align.Itemindex  := tv.Diagrama.selNodes.item(1).Alignment;
      rg_estilo.Itemindex := tv.Diagrama.selNodes.item(1).Drawstyle;
      cd_borda.color      := tv.Diagrama.selNodes.Item(1).DrawColor;
      cd_fundo.color      := tv.Diagrama.selNodes.Item(1).fillColor;
      cd_fonte.color      := tv.Diagrama.selNodes.Item(1).ForeColor;
      fnt.font.color      := tv.Diagrama.selNodes.Item(1).ForeColor;

      If tv.Diagrama.selNodes.item(1).shape = 50 then
      Begin
        oWbs   := tv.diagrama.Obtem_wbs(tv.Diagrama.selNodes.item(1)) ;
        oAtor  := tv.diagrama.Obtem_ator(tv.Diagrama.selNodes.item(1)) ;
      end;


      wfont := tv.Diagrama.selNodes.Item(1).font;
      SetOleFont(fnt.font,Wfont);

      Wi := tv.Diagrama.selNodes.Item(1).DrawWidth  ;
      rg_espessura.Itemindex := Wi ;
      showmodal;
   end;


end;

procedure Tfrm_treeativ.SpeedButton84Click(Sender: TObject);
begin
  If frm_cfg = nil then
     frm_cfg := tfrm_cfg.create(self);

  frm_cfg.showmodal;
end;

procedure Tfrm_treeativ.Propriedades2Click(Sender: TObject);  // objetos a partir do diagrama
begin
  If frm_proprlink = nil then
     frm_proprlink := Tfrm_proprlink.create(self);
  with frm_proprlink do
   Begin
      dg                        := tv.diagrama;
      wfnt                      := Tfont.create;
      Wfont                     := tv.diagrama.SelLinks.item(1).font;
      setolefont(wfnt,Wfont);
      fnt.font                  := Wfnt;
      fnt.font.color            := tv.diagrama.SelLinks.item(1).ForeColor;
      edit4.font                := fnt.font;
      cd_fonte.color            := tv.diagrama.SelLinks.item(1).ForeColor;
      cd_borda.color            := tv.diagrama.SelLinks.item(1).DrawColor;
      panel2.color              := cd_Borda.color;
      wi                        := tv.diagrama.SelLinks.item(1).DrawWidth ;
      rg_espessura.ItemIndex    :=  wi ;
      rg_estilo.ItemIndex       :=  tv.diagrama.SelLinks.item(1).DrawStyle ;
      ck_org.Checked            := tv.diagrama.SelLinks.item(1).AdjustOrg ;
      ck_dst.Checked            := tv.diagrama.SelLinks.item(1).AdjustDst ;
      edit1.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowOrg);
      edit2.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowMid);
      edit3.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowDst);
      Classe_dg := udado(tv.selected.Data)^.fClasse;
      If Classe_dg = 'DMI' then
       begin
          pgc.Pages[2].Tabvisible := true;
          pgc.Pages[1].Tabvisible := false ;
       end
      else
       begin
          pgc.Pages[2].Tabvisible := false;
          pgc.Pages[1].Tabvisible := true ;
       end;
      showModal;
   end;


end;

procedure Tfrm_treeativ.SetOrigem_dados(const Value: integer);
begin
  FOrigem_dados := Value;
end;

procedure Tfrm_treeativ.MenuItem9Click(Sender: TObject);
begin
  tv.Diagrama.SelectedNode.picture := nil;
end;

procedure Tfrm_treeativ.AjustaImagemaEntidade2Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(true);
end;

procedure Tfrm_treeativ.AjustaEntidadeaImagem2Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(false);
end;

procedure Tfrm_treeativ.MenuItem8Click(Sender: TObject);
begin
  tv.Diagrama.Insere_imagem(sender);
end;

procedure Tfrm_treeativ.MenuItem10Click(Sender: TObject);
begin
  If frm_propr = nil then
     frm_propr := Tfrm_propr.Create(self);
  with frm_propr do
   Begin
      rg_Align.Itemindex  := tv.Diagrama.selNodes.item(1).Alignment;
      rg_estilo.Itemindex := tv.Diagrama.selNodes.item(1).Drawstyle;
      cd_borda.color      := tv.Diagrama.selNodes.Item(1).DrawColor;
      cd_fundo.color      := tv.Diagrama.selNodes.Item(1).fillColor;
      cd_fonte.color      := tv.Diagrama.selNodes.Item(1).ForeColor;
      fnt.font.color      := tv.Diagrama.selNodes.Item(1).ForeColor;
      Wi := tv.Diagrama.selNodes.Item(1).DrawWidth  ;
      rg_espessura.Itemindex := Wi ;
      showmodal;
   end;  
end;

procedure Tfrm_treeativ.SpeedButton11Click(Sender: TObject);
begin
{  frm_DiagramaPreview.PrnFlow1.hWndFlow := tv.Diagrama.hWnd;
  frm_DiagramaPreview.PrnFlow1.Preview := true;
	frm_DiagramaPreview.PrnFlow1.PrintDoc;
  frm_DiagramaPreview.ShowModal;
 }

 { If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;}
 If frm_pprint= nil then
    frm_pprint     := Tfrm_pprint.create(self);

  frm_pprint.showmodal;

end;

procedure Tfrm_treeativ.SetWimpTxt(const Value: boolean);
begin
  FWimpTxt := Value;
end;


procedure Tfrm_treeativ.SetWDirImp(const Value: string);
begin
  FWDirImp := Value;
end;

procedure Tfrm_treeativ.SetExportDir(const Value: string);
begin
  FExportDir := Value;
end;

procedure Tfrm_treeativ.SetTI(const Value: integer);
begin
  FTI := Value;
end;

procedure Tfrm_treeativ.Executar1Click(Sender: TObject);
var
  iTab : Tdados_tab;
  s,wSigla :string;
  wprg: string;
  wdir,wexec : string;
begin
  try
    If tv.Diagrama.IDG_DIR = 'DUC' then
     Begin
      with Tdados_tab.Create(self) do
       Begin
         If not Open_Objeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,tv.diagrama.selectednode.userdata,'IDF_OI') then
                       raise exception.Create(EI1);
         s := fieldbyname('IDF_NOME').asstring;
         free;
       end;

      wdir :=  ExtractFiledir(s) ;
      wprg :=  ExtractFileName(s)  ;
      If wdir = '' then
          wdir := Pega_Diretorio_Padrao(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO);

      If wdir <> '' then
         Begin
           If (wdir[length(wdir)] <> '\') and  (wdir[length(wdir)] <> '/') then
             wexec := wdir + '\' +wprg
           else
             wexec := wdir + wprg;
         end
      else
        Raise exception.create(mens117);

     end
    else
        itab := Tdados_tab.create(self);
        with itab  do
         begin
           ListaCli := tv.Diagrama.EMPRESA;
           ListaProj:= tv.Diagrama.CENARIO;
           ListaDim := 'IDF_SE' ;
           ListaTit := 'Mecanismos' ;
           ListaTag := 0 ;
           ListaEdit:= false ;
           ListaTree:= nil;
           Listafecha := true;
           ListaId  := 0;
           OPERACAO := 0;
           mostra_lista;
           If  ListaCanc then
            exit;
            begin
              Tabela := 'IDF_SE';

            If not  Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA)  then
               raise exception.Create(EI1);
            wSigla := iTab.fieldbyname('IDF_SIGLA').asstring;
            Exec_mecanismo (ListaCli,wSigla);
             {If frm_se   = nil then
                frm_se := tfrm_se.Create(self);
             frm_se.Tipo        := 'SE';
             frm_se.Visivel     := 'N';
             frm_se.Mode        := 'M';
             frm_se.AutoFecha   := false;
             frm_se.idatasource := DataExt;
             frm_se.CLIENTE     := ListaCli;
             frm_se.CENARIO     := ListaProj;
             frm_se.OnDblClick := Exec_Mecanismo;
             frm_se.showmodal; }
            end;
         end;
  finally
     freeandnil(itab);
  end;


end;

procedure Tfrm_treeativ.Exec_mecanismo(pId : integer; pProg : string) ;
var
iTab : Tdados_tab;
s :string;
wprg : string;
wdir,wexec : string;
 begin
       wdir :=  ExtractFiledir(pProg) ;
       wprg :=  ExtractFileName(pProg) ;
       // itab := Tdados_tab.Create(self);
        If pProg = '' then
            raise exception.create(mens44);
        If wdir = '' then
            wdir := Pega_Diretorio_Padrao(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO);
         wprg :=  ExtractFilename( pProg);

        If wdir <> '' then
         Begin
           If (wdir[length(wdir)] <> '\') and  (wdir[length(wdir)] <> '/') then
             wexec := wdir + '\' +wprg
           else
             wexec := wdir + wprg;
         end
        else
         wexec := pProg;
        If not fileExists(wexec ) then
          Raise exception.create(mens1010+wexec+mens102);
         ExecProg(wexec,'');

             //   iF iTab.Get_Correlatos(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'AP',
     //                       TV.Diagrama.SelectedNode.UserData,'SE','IDF_SE') then
    {     begin
             If iTab.fieldbyname('IDF_SIGLA').asstring = '' then
                raise exception.create(mens44);
            If wdir = '' then
               wdir := Pega_Diretorio_Padrao(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO);
            wprg :=  ExtractFilename( iTab.fieldbyname('IDF_SIGLA').asstring);

            If wdir <> '' then
             Begin
               If (wdir[length(wdir)] <> '\') and  (wdir[length(wdir)] <> '/') then
                 wexec := wdir + '\' +wprg
               else
                 wexec := wdir + wprg;
             end
            else
             wexec := iTab.fieldbyname('IDF_SIGLA').asstring;

        end;
      end;
       If not fileExists(wexec ) then
        Raise exception.create(mens1010+wexec+mens102);
       ExecProg(wexec,'');

     If wprg = '' then
         Raise exception.create(mens103);
       //   ExecProg(iTab.fieldbyname('IDF_SIGLA').asstring,''); }

 end;

function Tfrm_treeativ.Pega_diretorio_padrao(pcli,pProj : integer) : string;
 Begin
   with Tcenario.create(self) do
     Begin
       Open_cenario(pCli,pProj);
       result := PRJ_CAMINHO;
       FREE;
     end;

 end;

procedure Tfrm_treeativ.SpeedButton68Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := afSelectItems;
end;

procedure Tfrm_treeativ.SelecionarTudo1Click(Sender: TObject);
begin
  tv.Diagrama.SelectAll;
             { TODO : acresc 26/11/04 -> versào 36 }
  tv.Diagrama.WClick(nil);
end;

procedure Tfrm_treeativ.Abrir1Click(Sender: TObject);
begin
  Grid1Click(EntPop);
end;

procedure Tfrm_TreeAtiv.Grid1Click(Sender: TObject);
begin

  If frm_grid = nil then
     frm_grid := tfrm_Grid.create(self);
  frm_grid.Diagrama := TDg.Create;   
  frm_grid.Diagrama := tv.diagrama;
  frm_grid.showModal;
end;

procedure Tfrm_treeativ.Gera_Usecase(Sender: TObject);
var
  i : integer;
  wtop,wleft : double;
  wnode : afnode;
  wlink : aflink;
begin
  with Tdados_Tab.create(SELF) do
   begin
     Get_PaisCorrelatos( tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'AP',tv.Diagrama.SelectedNode.UserData,
                         'CA','IDF_AP','');
     wtop := tv.Diagrama.SelectedNode.Top;
     while not eof do
      begin
       If fieldbyname('IDF_TIPO_ATIV').asstring = 'UC'then
        begin
           wnode := tv.Diagrama.Nodes.Add(tv.Diagrama.SelectedNode.Left + 1500,wTop+ 1500,2500,1100);
           wnode.Shape := 62;
           wnode.UserData := fieldbyname('IDF_CODIGO').asinteger;
           wnode.Text  := fieldbyname('IDF_DESIGNACAO').asstring;
           wlink := tv.Diagrama.SelectedNode.OutLinks.Add(wnode) ;
           wlink.LinkStyle := 1;
           Wlink.Selectable := true;
           Wlink.AdjustOrg  := true;
           Wlink.AdjustDst  := true;
           wtop := wtop + 1500;
        end;
       next;
      end;
   end;
 end;

procedure Tfrm_treeativ.PopNodePopup(Sender: TObject);
var
  i : integer;
begin
  If tv.Diagrama.SelNodes.Count > 0 then
   Begin
   PopNode.Items[19].visible := false; //importar Diagramas
   PopNode.Items[20].visible := false; //mostrar dados da tabela
   If tv.Diagrama.IDG_DIR = 'DPN' then //ver 637m
   begin
     PopNode.Items[16].enabled := false ;  //imprimir missão
     PopNode.Items[17].Enabled := false; //gerar use case



     If  tv.Diagrama.SelNodes.Item(1).shape in[11,50,79,62] then
       Begin
         PopNode.Items[7].Enabled := false;     //atras
         PopNode.Items[8].Enabled := false;     //frente
         PopNode.Items[12].Enabled := TRUE;     //nivel abaixo
     //    PopNode.Items[19].visible := true; //importar Diagramas
       end
     else
       Begin
         PopNode.Items[7].Enabled := true;
         PopNode.Items[8].Enabled := true;
         PopNode.Items[12].Enabled := false;
         If tv.Diagrama.selnodes.item(1).Shape = 58 then
            PopNode.Items[3].Enabled := true; //excutar
       end ;
      PopNode.Items[13].Enabled := false; //imprimir objeto
      PopNode.Items[15].Enabled := false; //script
      PopNode.Items[16].Enabled := false; //imprimir missao
      PopNode.Items[17].Enabled := false //gerar use case
   end
  else
  If tv.Diagrama.IDG_DIR = 'DEO' then //ver 637m
    Begin
      PopNode.Items[7].Enabled := true;     //atras
      PopNode.Items[8].Enabled := true;     //frente
      PopNode.Items[3].Enabled := false; //excutar
      PopNode.Items[10].Enabled := false; //aspectos criticos
      PopNode.Items[13].Enabled := false; //imprimir objeto
      PopNode.Items[15].Enabled := false; //script
      PopNode.Items[16].Enabled := false; //imprimir missao
      PopNode.Items[12].enabled := false ; //nivel abaixo
      PopNode.Items[16].enabled := false ;  //imprimir missao
      PopNode.Items[17].Enabled := false ;//gerar use case
      If  tv.Diagrama.SelNodes.Item(1).shape in[9] then
       Begin
         PopNode.Items[12].enabled := true ; //nivel abaixo
         PopNode.Items[16].enabled := true ;  //imprimir missao
       end;

   end

  else
  If tv.Diagrama.IDG_DIR = 'DMI' then //ver 637o
    Begin

      PopNode.Items[7].Enabled := true;     //atras
      PopNode.Items[8].Enabled := true;     //frente
      PopNode.Items[3].Enabled := false; //excutar
      PopNode.Items[10].Enabled := false; //aspectos criticos
      PopNode.Items[13].Enabled := true; //imprimir objeto
      PopNode.Items[15].Enabled := true; //script
      PopNode.Items[16].Enabled := false; //imprimir missao
      PopNode.Items[17].Enabled := false ;//gerar use case
    //  PopNode.Items[20].visible := true; //mostrar dados da tabela
      If  tv.Diagrama.SelNodes.Item(1).shape in[1] then
         PopNode.Items[12].enabled := true ; //nivel abaixo
    end
  else
  If tv.Diagrama.IDG_DIR = 'DUC' then //ver 637o
   begin
    If tv.Diagrama.SelNodes.Count > 1 then
     begin
       If tv.Diagrama.SelNodes.Item(1).Shape = 53 then
        begin
          for i := 2 to tv.Diagrama.SelNodes.Count do
            begin
             If tv.Diagrama.SelNodes.Item(i).Shape <> 53  then
              break
             else
              PopNode.Items[17].Enabled := TRUE //gerar use case
            end;
        end;
     end;

    PopNode.Items[3].Enabled  := TRUE; //excutar
    PopNode.Items[10].Enabled := false; //aspectos criticos
    PopNode.Items[13].Enabled := false; //imprimir objeto
    PopNode.Items[15].Enabled := false; //script
    PopNode.Items[16].Enabled := false; //imprimir missao
    PopNode.Items[12].enabled := false ; //nivel abaixo
    PopNode.Items[17].Enabled := false ;//gerar use case


   end
  else
  If tv.Diagrama.IDG_DIR = 'LIV' then //ver 637o
    Begin
      PopNode.Items[7].Enabled := true;     //atras
      PopNode.Items[8].Enabled := true;     //frente
      PopNode.Items[3].Enabled := false; //excutar
      PopNode.Items[10].Enabled := false; //aspectos criticos
      PopNode.Items[12].Enabled := false; //nivel abaixo
      PopNode.Items[13].Enabled := false; //imprimir objeto
      PopNode.Items[15].Enabled := false; //script
      PopNode.Items[16].Enabled := false; //imprimir missao
      PopNode.Items[17].Enabled := false ;//gerar use case
    end
  else
  If tv.Diagrama.IDG_DIR = 'CLS' then //ver 637o
    Begin
      PopNode.Items[7].Enabled := true;     //atras
      PopNode.Items[8].Enabled := true;     //frente
      PopNode.Items[3].Enabled := false; //excutar
      PopNode.Items[4].Enabled := false; //imagem
      PopNode.Items[10].Enabled := false; //aspectos criticos
      PopNode.Items[12].Enabled := false; //nivel abaixo
      PopNode.Items[13].Enabled := false; //imprimir objeto
      PopNode.Items[15].Enabled := false; //script
      PopNode.Items[16].Enabled := false; //imprimir missao
      PopNode.Items[17].Enabled := false ;//gerar use case
    end   ;
    end   ;
end;

procedure Tfrm_treeativ.Setdir_db(const Value: string);
begin
  Fdir_db := Value;
end;

procedure Tfrm_treeativ.SetTipo_banco(const Value: integer);
begin
  FTipo_banco := Value;
end;

procedure Tfrm_treeativ.SetDiretorio(const Value: string);
begin
  FDiretorio := Value;
end;

procedure Tfrm_treeativ.SetNome_banco(const Value: string);
begin
  FNome_banco := Value;
end;

procedure Tfrm_treeativ.cmb_schemaCloseUp(Sender: TObject);
begin
  dir_canc := false;

  case cmb_schema.ItemIndex of

    0 : Begin
          wScript := TstringList.Create;
          wtab := TstringList.create;
          ide := Tdad.Create(self);
          Gera_Sql(tv.diagrama);
          gera_triggers;   // triggers de integridade de PK
          Mostra_sql;
          freeandnil(ide);
          freeandnil(wScript);
          freeandnil(wtab);
          Mostra_sql;
          //pb.Position := 0;
        end;

    1 : Begin
         If frm_bancos = nil then
          frm_bancos := Tfrm_bancos.create(self);
         frm_bancos.edit1.Text := SERVIDOR_ATU;
         frm_bancos.edit2.Text := BANCO_ATU;
          //frm_bancos.SpeedButton1.Visible := true;
         //frm_bancos.SpeedButton3.Visible := false;
         frm_bancos.ShowModal;
         If dir_canc then
          exit;
         If frm_tabEnga = nil then
          frm_TabEnga := Tfrm_tabEnga.create(self);
         Mostra_tabelas(iDbAdo,'',frm_TabEnga,frm_tabEnga.srcList,false);
        end;

  end;
  cmb_schema.ItemIndex := -1;
  cmb_schema.Text := def92;

end;

function Tfrm_treeativ.gera_SQL(pdg : TDg) : boolean;
var
  Tot, i, icode, wpos: integer;
  sematrib : boolean;
  wTipo, s, windex, wtamanho :string;
  tvant :TTreeNode;
  HaPk, First :boolean;
begin
  if pdg.IDG_DIR <> 'DMI' then
    raise exception.create(mens107);
  HaPk := false;
  try
    begin
      // Total de objetos selecionados
      tot := pdg.SelNodes.count;
      for i := 1 to tot  do
      begin
        First := true;
        inc(wpos);

        // Aqui é capturado o PAI_ID do objeto selecionado. Isso é
        // referente a tabela COR_OBJETOS
        iCode := pdg.SelNodes.item(i).UserData;

       //showmessage(pdg.SelNodes.item(i).text);
        If pdg.SelNodes.item(i).Shape <> 1 then
          continue;
        If InList(pdg.SelNodes.item(i).text,wtab) then
          continue;

        If (iCode = 0 ) or   (trim(pdg.SelNodes.item(i).text) = '') then
           continue;

        sematrib := false;
        with ide do
           begin
             CLI_ID := pdg.EMPRESA;
             PRJ_ID := pdg.CENARIO;

             get_dados_unico(pdg.SelNodes.item(i).Text, icode);
             If ide.fClient.Eof then
               sematrib := true
             else
               Begin
                  windex := 'ALTER TABLE ';
                  wscript.add ('CREATE TABLE '+trim(pdg.SelNodes.item(i).text)+'(');
                  Wtab.Add(pdg.SelNodes.item(i).text) ;
               end;

             ide.fClient.First;
             windex := windex + pdg.SelNodes.item(i).Text+ ' ADD CONSTRAINT '+
                                'I0_'+ pdg.SelNodes.item(i).Text+' PRIMARY KEY ( ';
           end;
        while not ide.fClient.Eof do
        begin

          wTamanho :=  ide.fClient.fieldbyname('idf_type_qualifiers').asstring;
          If ide.fClient.fieldbyname('idf_id').asinteger  > 0 then
           Begin
            If haPk then
               windex := windex + ','+ ide.fClient.fieldbyname('idf_designacao').asstring
            else
               windex := windex + ide.fClient.fieldbyname('idf_designacao').asstring  ;
            Hapk := true;
           end;
          If uppercase(ide.fClient.fieldbyname('idf_data_type').asstring)= 'C' then
             Wtipo := 'VARCHAR(' + ide.fClient.fieldbyname('idf_type_qualifiers').asstring+')'
          else
          If uppercase(ide.fClient.fieldbyname('idf_data_type').asstring)= 'I' then
             Wtipo := 'INTEGER'
          else
          If (uppercase(ide.fClient.fieldbyname('idf_data_type').asstring))= 'N' then
           begin
              Wtipo := 'NUMBER(' ;
              wtipo := wtipo + trim(Ide.fClient.fieldbyname('IDF_TYPE_QUALIFIERS').asstring);

              If Ide.fClient.fieldbyname('IDF_DECIMAL').asstring = '' then
               wtipo := wtipo +')'
              else
               wTipo := wTipo + ','+ide.fClient.fieldbyname('IDF_DECIMAL').asstring+')';
           end

          else
          If uppercase(ide.fClient.fieldbyname('idf_data_type').asstring)= 'M' then
             Wtipo := 'BLOB SUB_TYPE 1 SEGMENT SIZE 80'
          else
          If (uppercase(ide.fClient.fieldbyname('idf_data_type').asstring))= 'D' then
             Wtipo := 'DATE'
          else
          If (uppercase(ide.fClient.fieldbyname('idf_data_type').asstring))= 'T' then
             Wtipo := 'DATETIME'
          else
           Begin
             If ide.fClient.fieldbyname('idf_data_type').asstring = '' then
                Raise exception.create(mens121 + ' -  '+def121 + ' '+ide.fClient.fieldbyname('idf_data_type').asstring +' - '+def27 + pdg.SelNodes.item(i).Text );

             begin
               If (ide.fClient.fieldbyname('idf_type_qualifiers').asstring= '') or (ord(wTamanho[1]) = 32) or (ord(wTamanho[1]) = 0)  then
                   Wtipo :=  uppercase(ide.fClient.fieldbyname('idf_data_type').asstring)
                else
                   Wtipo :=  uppercase(ide.fClient.fieldbyname('idf_data_type').asstring)+'('+
                                   ide.fClient.fieldbyname('idf_type_qualifiers').asstring+')';
             end;
           end;

          If first then
             wscript.Add(ide.fClient.fieldbyname('idf_designacao').asstring + ' '+Wtipo)
           else
             wscript.Add(','+ide.fClient.fieldbyname('idf_designacao').asstring + ' '+Wtipo) ;
          If ide.fClient.fieldbyname('idf_id').asinteger  > 0 then
           wscript[wscript.Count - 1] :=wscript[wscript.Count - 1] + (' NOT NULL ');
          first := false;
          ide.fClient.next;
         end;
         wscript.Add(' );');
         If Hapk then
          Begin
           hapk      := false;
           windex    := windex +' );';
           wscript.add('');
           wscript.add(windex);
           wscript.add('');
           windex    := 'ALTER TABLE  ';
          end;
        //  If not sematrib then

          Gerasql_filho(pdg,pdg.SelNodes.item(i).UserData);
      end;

    end;

   // ptv.selected := tvant;

 finally

 end;
end;

function Tfrm_treeativ.geraSQL_filho(pdg : Tdg; pId : integer) : boolean;
var
  iDiag : Tdg;
  wnome : string;
begin
with TDiag_dados.create(self) do
   Begin
    Get_Diagrama(pdg.EMPRESA,pdg.CENARIO,pId);
    while not eof do
     Begin

      iDiag := Tdg.Create;
      wNome := bdx.DirFluxo + fieldbyname('DIAG_ID').asstring;
      If  FileExists(wNome) then
        //Raise exception.create(EI5+'-'+wNome);
      begin
        iDiag.LoadFile(wNome);
        iDiag.IDG     := fieldbyname('IDG_ID').ASINTEGER;
        iDiag.EMPRESA := pDg.EMPRESA;
        iDiag.CENARIO := pDg.CENARIO;
        iDiag.IDG_DIR := pdg.IDG_DIR;
        iDiag.NOME_DIAGRAMA := fieldbyname('SUB_NOME').asstring;
        iDiag.SelectAll;
        Gera_sql(iDiag);

      end;
  //    freeandnil(iDiag);
      next;
     end;
     free;
   end;
end;

function Tfrm_treeativ.gera_Triggers: boolean;
var
  Tot,i ,icode,wpos: integer;
  wTipo ,s : string;
  tvant   : TTreeNode;
  HaPk,First    : boolean;
  wexcept,wtrigger : Tstrings;
  wexc : string;
Begin
  // Aqui é capturado o PAI_ID do objeto selecionado. Isso é
  // referente a tabela COR_OBJETOS
  //iCode := pdg.SelNodes.item(i).UserData;

  If wexcept = nil then
    wexcept := TStringList.create;
  wtrigger := nil;
  If wtrigger = nil then
    wtrigger:= TStringList.create;
  HaPk := false;

  //PRIMARY KEY (CLIENTE, NO_DOC, EMISSAO)
 try
   // while (tv.selected <> nil)  do
    Begin

     tot := wtab.Count;
      If tot = 0 then
       Raise exception.create(Mens106);
      //PB.Max := tot;

      for i := 0 to tot - 1  do
      Begin
        First := true;

        inc(wpos);
        //pb.Position := wpos;
        //pb.Repaint;
        with ide do
           begin
             CLI_ID := TV.Diagrama.EMPRESA;
             PRJ_ID := TV.Diagrama.CENARIO;
             get_dados_unico(wtab[i], icode);
             ide.fClient.First;

           end;

            WEXC := ' CREATE EXCEPTION '+ trim(wtab[i])+'_REST ' + ''''+
                mens108+trim(wtab[i])+ ''''+';';
            wexcept.add(wexc);


         wTrigger.add ('CREATE TRIGGER TRIG_'+trim(wtab[i])+ ' FOR  ' +trim(wtab[i])+' BEFORE UPDATE POSITION 0 AS ');
        wTrigger.add (' BEGIN ');

        while not ide.fClient.Eof do
         Begin
         
          If ide.fClient.fieldbyname('idf_codigo').asinteger  > 0 then
           Begin
            If haPk then
               wTrigger.add( ' OR (NEW.'+ide.fClient.fieldbyname('idf_designacao').asstring  +
                         ' <> OLD.'+ ide.fClient.fieldbyname('idf_designacao').asstring +')' )
            else
               wTrigger.add('If ((NEW.'+ ide.fClient.fieldbyname('idf_designacao').asstring  +
                         '<> OLD.'+ ide.fClient.fieldbyname('idf_designacao').asstring+') ') ;
            Hapk := true;
           end
          else
            Begin
              wTrigger.add(')');
              break;
            end;

          first := false;
          ide.fClient.next;
         end;
         wTrigger.add( ' THEN ' );
         wTrigger.add( '  EXCEPTION '+ trim(wtab[i])+'_REST;' );

        wTrigger.add( 'END ') ;
         wTrigger.add( '^') ;
         If Hapk then
          Begin
           hapk      := false;

          end;

      end;
    end;
    for i := 0 to wexcept.Count -1 do
     Begin
      wscript.add (wexcept[i]);
     end;
     wscript.Add('SET TERM '+''+'^'+''+';');
     for i := 0 to wTrigger.Count -1 do
     Begin
      wscript.add (wTrigger[i])
     end;

 finally
   freeandnil(wexcept);
   freeandnil(wtrigger);
 end;
end;


function Tfrm_treeativ.Mostra_sql : boolean;
 Begin
  If frm_log = nil then
       frm_log := tfrm_log.create(self);
    If wscript = nil then
      exit;   
    frm_log.Memo1.Lines := wscript;
    frm_log.Caption := def93;
    panel1.Visible := true;
    panel1.BringToFront;
    frm_log.showMOdal;
    {If not dir_canc then
       wscript.SaveToFile(schema);
    cmb_schema.text := def92;  //esquema   }
    //pb.Position := 0;
    //tv.selected := tvant;
   // tv.TvClick(self);
 end;



function Tfrm_treeativ.gera_Modelo(pbanco : integer) : boolean;
 Begin
   cria_oe(nil);
 end;

function Tfrm_treeativ.Cria_OE(pNode : afNode) : boolean;
var
iTab : Tdados_tab;
Begin
  iTab := Tdados_tab.create(self);
 try 
  with iTab do
   begin
    CLI_ID := TV.Diagrama.EMPRESA;
    PRJ_ID := TV.Diagrama.CENARIO;
    TABELA := 'IDF_OE';
    Cria_Inst(TV.Diagrama.EMPRESA,TV.Diagrama.CENARIO,TV.Diagrama.IDG,'IDF_OE','OE','S','',' ');
    pNode.UserData := IDF_CODIGO;

    If not Open_Objeto(CLI_ID,PRJ_ID,pNode.userdata,TABELA) then
      raise exception.Create(EI1);
    edit;
    fieldbyname('IDF_DESIGNACAO').value      := tv.diagrama.SelectedNode.text;
    fieldbyname('IDF_NOME').value            := Dir_Db;
    fieldbyname('IDF_TIPO_ATIVIDADE').value  := 'OE';
    fieldbyname('SUB_ID').value  :=Tipo_banco;     //0 : access
                                                     //1 : paradox
                                                     //2 : Dbase
    fieldbyname('IDF_DBDIR').value  := DIR_DB;
    post;
   end;
 finally

  FREEANDNIL(iTab);
 end;
end;


procedure Tfrm_treeativ.Setidbado(const Value: TAdoConnection);
begin
  Fidbado := Value;
end;

procedure Tfrm_treeativ.Setschema(const Value: string);
begin
  Fschema := Value;
end;

procedure Tfrm_treeativ.SetDir_canc(const Value: boolean);
begin
  FDir_canc := Value;
end;

procedure Tfrm_treeativ.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure Tfrm_treeativ.SpeedButton79Click(Sender: TObject);
var
  wleft,wtop,wwidth,wheight : double;
  wnode : afNode;
Begin

  If tv.Diagrama.SelectedNode <> nil then
   Begin
     wleft := tv.Diagrama.SelectedNode.Left + 2*(tv.Diagrama.SelectedNode.width );
     wheight :=  tv.Diagrama.SelectedNode.Height;
     wwidth := tv.Diagrama.SelectedNode.Width;
     wtop   := tv.Diagrama.SelectedNode.Top;
     wnode := tv.Diagrama.Nodes.Add(wleft,wtop,wwidth,wheight);
     wnode.Shape := tv.Diagrama.SelectedNode.shape;
     tv.Diagrama.SelectedNode := wNode;
     tv.Diagrama.Inclui_Node(tv.Diagrama);

   end;

end;

function Tfrm_treeativ.Juncao_Percentual(pDiag : Tdg;pJunc,pAtiv : afnode) : real;
var
  i,j ,wper,wid: integer;
  mList,mSeg : uLst;
  oList,oSeguinte : TList;
  mens : string;
  oObj : afNode;
begin
   Begin
     with Tdados_tab.Create(self) do
      Begin
        If not Get_correlato(pDiag.EMPRESA,pDiag.CENARIO,'JU',wid,'AP',pAtiv.UserData) then
         Raise exception.create(mens109);
        wper := fieldbyname('PERC_CUSTO').asinteger;
        free;

      end;
    // tv.Diagrama.PercAcum := tv.Diagrama.PercAcum * (wper div 100);
   end;
end;

procedure Tfrm_treeativ.SpeedButton80Click(Sender: TObject);
begin
  spl.left := 180;
end;

procedure Tfrm_treeativ.Estmulo1Click(Sender: TObject);
var
  i: integer;
begin

  for i := 1 to tv.Diagrama.SelLinks.Count do
   Begin
      If tv.Diagrama.SelLinks.Item(i).ArrowMid > 0 then
         tv.Diagrama.SelLinks.Item(i).ArrowMid := 0
      else
         tv.Diagrama.SelLinks.Item(i).ArrowMid := tv.Diagrama.SelLinks.Item(i).Arrowdst;
   end;

end;

procedure Tfrm_treeativ.sppClick(Sender: TObject);
begin
  tv.Diagrama.atualiza_entity;
end;

procedure Tfrm_treeativ.AtualizarasDescriesdosObjetos1Click(
  Sender: TObject);
begin
  tv.Diagrama.Atualiza_entity;
end;

procedure Tfrm_treeativ.RegistrarAspectoCrticomelhoria1Click(
  Sender: TObject);
var
  iTab : Tdados_tab;
begin
  iTab := Tdados_tab.create(self);
  try
   If frm_aspectos   = nil then
      frm_aspectos := tfrm_aspectos.Create(self);
   
   itab.OpenAll(udado(tv.selected.data)^.fcli,udado(tv.selected.data)^.FProj,
                'IDF_AC', 'AC','',0);
   with frm_aspectos do
    begin
      Tipo        := 'AC';
      Visivel     := 'N';
      Mode        := 'M';
      AutoFecha   := false;
      idatasource := itab.DataExt;
      CLIENTE     := udado(tv.Selected.Data)^.Fcli;
      CENARIO     := udado(tv.Selected.Data)^.FProj;
      Mode := 'I';
      sp_insertClick(self);
      showmodal;
    end;
  finally
     freeandnil(iTab);
  end;


end;

procedure Tfrm_treeativ.RegistrarAspectosCrticosmelhorias1Click(
  Sender: TObject);
var
  iTab : Tdados_tab;  
begin
   iTab := Tdados_tab.create(self);
  try
   If frm_aspectos   = nil then
      frm_aspectos := tfrm_aspectos.Create(self);
   
   itab.OpenAll(udado(tv.selected.data)^.fcli,udado(tv.selected.data)^.FProj,
                'IDF_AC', 'AC','',0);
   with frm_aspectos do
    begin
      Tipo        := 'AC';
      Visivel     := 'N';
      Mode        := 'M';
      AutoFecha   := false;
      idatasource := itab.DataExt;
      CLIENTE     := udado(tv.Selected.Data)^.Fcli;
      CENARIO     := udado(tv.Selected.Data)^.FProj;
      Mode := 'I';
      sp_insertClick(self);
      showmodal;
    end;
  finally
     freeandnil(iTab);
  end;

end;
procedure Tfrm_treeativ.Gera_PLanilha(pNode : TTreeNode);
var
  i,j,wMax,k,w : integer;
  iUc : Tap;
  iTab,Ippg : TDados_tab;
  iTi : TReq;
  uNode : afnode;
  wseq ,wSubSeq: integer;
  istrRegra,iStrProd,iStrReq,iStrdg : Tstrings;
  dgx : TAddFlow;
begin

  iStrRegra := TstringList.create;
  iStrProd  := TstringList.create;
  iStrReq   := TstringList.create;
  iStrDG   := TstringList.create;
  dgx := TAddFlow.create(self);
    tv.TreeList.Clear  ;
    tv.TreeCli.Clear   ;
    tv.TreeProj.Clear  ;
    tv.TreeCod.Clear   ;
    tv.TreeTi.Clear    ;
   // tv.TreeDG.Clear    ;

    dm_rel.qry_req.Connection := bdx;
    dm_rel.qry_DelPlan.Connection := bdx;
    Dm_rel.qry_delPlan.ExecSQL;
    dm_rel.qry_req.Open;

    tv.treeList.Add(pNode.text);
    tv.TreeCli.add(inttostr(udado(pNode.Data)^.FCli)) ;
    tv.TreepROJ.add(inttostr(udado(pNode.Data)^.FProj)) ;
    tv.TreecOD.add(inttostr(udado(pNode.Data)^.FDiag)) ;
    tv.Le_arvore(pNode);
    //frm_mensagem.pcg.Max :=  tv.TreeList.count;

try
  for i := 0 to tv.TreeList.count - 1 do
  begin
          istrregra.Clear;
          iStrprod.Clear;
          istrreq.Clear;
          istrDG.Clear;

          //frm_mensagem.pcg.Position := i+1;
          frm_mensagem.Repaint;
          If iUc = nil then
            iUc := Tap.Create(self);




          dm_rel.qry_req.Insert;
          //gerar sequenci e sub-sequencia
          wsubseq := 0;
          inc(wseq);
          inc(wsubseq);
          dm_rel.qry_req.fieldbyname('SEQ').value    :=  wseq;
          dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;

          dm_rel.qry_req.fieldbyname('PROCESSO').value :=  tv.TreeList[i];

          iUc.Open_uc(strtoInt(tv.TreeCli[i]),strtoInt(tv.TreeProj[i]),
                               strtoInt(tv.Treecod[i])) ;
          If not iuc.Eof then   //abre somente Use case
          begin
              dm_rel.qry_req.fieldbyname('WBS').value :=  IUC.FIELDBYNAME('idf_wbs_code').ASSTRING;
              //descricao atividade
              dbrt.DataSource := iUc.DataExt;
              dbrt.DataField := 'IDF_DESCRICAO';
              dm_rel.qry_req.fieldbyname('DESC_PROCESSO').value :=  dbrt.Text;

              //objetivo use case
              dbrt.DataSource := iUc.DataExt;
              dbrt.DataField := 'IDF_OBJETIVO_UC';
           //   dm_rel.qry_req.fieldbyname('OBJETIVOUC').value    :=  dbrt.Text;
              dm_rel.qry_req.fieldbyname('OBJETIVOUC').AsString    :=  dbrt.Text;
              dbrt.DataSource := nil;

               // Regras
               If itab = nil then
                  iTab := Tdados_tab.create(self);
               iTab.Get_Correlatos(strtoInt(tv.TreeCli[i]),
                                 strtoInt(tv.TreeProj[i]),'AP',
                                 strtoInt(tv.Treecod[i]),'RN','IDF_RN' ) ;
               while not itab.eof do
               begin
                 iStrRegra.Add(itab.fieldbyname('IDF_DESIGNACAO').asstring);
                 itab.next;
               end;


               //produtos

               uNode := localiza_fisico(strtoInt(tv.TreeCli[i]),strtoInt(tv.TreeProj[i]),strtoInt(tv.Treecod[i]),
                                 0,'AP','DPN',dgx);
               If unode <> nil then
                  iStrdG := tv.Diagrama.get_fluxoOut(uNode,true);

               If iStrdG.Count > 0 then
                 Begin
                   for w := 0 to iStrdG.Count-1 do
                     Begin
                      If itab = nil then
                         iTab := Tdados_tab.create(self);

                      iTab.Open_Objeto(strtoInt(tv.TreeCli[i]),strtoInt(tv.TreeProj[i]),STRTOINT(iStrDG[w]),'IDF_DG');
                      If not itab.eof then
                        iStrProd.Add(itab.fieldbyname('IDF_DESIGNACAO').asstring);

                     END;
                 end;


              { If iTi = nil then
                  iTi := Treq.create(self)  ;    }


              wmax := iStrProd.Count;
              wmax := max(wmax,iStrregra.count);
              wmax := max(wmax,iStrProd.count);

              for j := 0 to wmax - 1 do
               Begin
                 If j > 0 then
                  Begin
                    inc(wsubseq);
                    dm_rel.qry_req.Insert;
                    dm_rel.qry_req.fieldbyname('SEQ').value    :=  wseq;
                    dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;
                  end;


                 If j <= iStrRegra.Count - 1 then
                    dm_rel.qry_req.fieldbyname('REGRA').value := iStrRegra[j];
                 If j <= iStrProd.Count - 1 then
                    dm_rel.qry_req.fieldbyname('PRODUTOS').value := iStrProd[j];

               end;
           end;
           dm_rel.qry_req.post;
           //freeandnil(iTi);
  end;
finally
        freeandnil(iUc);
        freeandnil(iTab);
        freeandnil(iPpg);
        freeandnil(iStrProd);
        freeandnil(iStrRegra);
        freeandnil(iStrReq);
        //frm_mensagem.pcg.Visible := false;
       frm_mensagem.sp_imp.Enabled := true;
       If bdx.TIPOBANCO = 0 then
       frm_mensagem.sp_exp.Enabled := true;
end;
end;


{procedure Tfrm_treeativ.Gera_PLanilha(pNode : TTreeNode);
var
  i,j,wMax,k : integer;
  iUc : Tap;
  iTab,Ippg : TDados_tab;
  iTi : TReq;
  wseq ,wSubSeq: integer;
  istrRegra,iStrProd,iStrReq : Tstrings;
begin

  iStrRegra := TstringList.create;
  iStrProd  := TstringList.create;
  iStrReq   := TstringList.create;


    tv.TreeList.Clear  ;
    tv.TreeCli.Clear   ;
    tv.TreeProj.Clear  ;
    tv.TreeCod.Clear   ;
    tv.TreeTi.Clear    ;

    dm_rel.qry_req.Connection := bdx;
    dm_rel.qry_DelPlan.Connection := bdx;
    Dm_rel.qry_delPlan.ExecSQL;
    dm_rel.qry_req.Open;

    tv.treeList.Add(pNode.text);
    tv.TreeCli.add(inttostr(udado(pNode.Data)^.FCli)) ;
    tv.TreepROJ.add(inttostr(udado(pNode.Data)^.FProj)) ;
    tv.TreecOD.add(inttostr(udado(pNode.Data)^.FDiag)) ;
    tv.Le_arvore(pNode);


  frm_mensagem.pcg.Max :=  tv.TreeList.count;

try
  for i := 0 to tv.TreeList.count - 1 do
  begin
          frm_mensagem.pcg.Position := i+1;
          frm_mensagem.Repaint;
          If iUc = nil then
            iUc := Tap.Create(self);


          dm_rel.qry_req.Insert;

          dm_rel.qry_req.fieldbyname('PROCESSO').value :=  tv.TreeList[i];;

          wsubseq := 0;
          inc(wseq);
          inc(wsubseq);
          dm_rel.qry_req.fieldbyname('SEQ').value    :=  wseq;
          dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;
          

          iUc.Open_uc(strtoInt(tv.TreeCli[i]),strtoInt(tv.TreeProj[i]),
                               strtoInt(tv.Treecod[i])) ;
          dm_rel.qry_req.fieldbyname('WBS').value :=  IUC.FIELDBYNAME('idf_wbs_code').ASSTRING;
          //descricao atividade
          dbrt.DataSource := iUc.DataExt;
          dbrt.DataField := 'IDF_DESCRICAO';
          dm_rel.qry_req.fieldbyname('DESC_PROCESSO').value :=  dbrt.Text;

          //objetivo use case
          dbrt.DataSource := iUc.DataExt;
          dbrt.DataField := 'IDF_OBJETIVO_UC';
       //   dm_rel.qry_req.fieldbyname('OBJETIVOUC').value    :=  dbrt.Text;


           If itab = nil then
              iTab := Tdados_tab.create(self);
           iTab.Get_Correlatos(strtoInt(tv.TreeCli[i]),
                             strtoInt(tv.TreeProj[i]),'AP',
                             strtoInt(tv.Treecod[i]),'RN','IDF_RN' ) ;

           If iPpg = nil then
              ippg := Tdados_tab.create(self);
           ippg.Get_Correlatos(strtoInt(tv.TreeCli[i]),
                             strtoInt(tv.TreeProj[i]),'AP',
                             strtoInt(tv.Treecod[i]),'DG','IDF_DG' ) ;
           If iTi = nil then
              iTi := Treq.create(self)  ;





          // requerimentos
         for k := 0 to Dbrt.lines.Count - 1 do
           begin
             iStrReq.add(trim(dbrt.lines[k]));
            
           end;

           // Regras
           while not itab.eof do
           begin
             iStrRegra.Add(itab.fieldbyname('IDF_DESIGNACAO').asstring);
             itab.next;
           end;

           //produtos

           while not iPPG.eof do
           begin
             iStrProd.add(ippg.fieldbyname('IDF_DESIGNACAO').asstring);
             ippg.next;
           end;

          wmax := iStrProd.Count;
          wmax := max(wmax,iStrregra.count);
          wmax := max(wmax,iStrreq.count);

          for j := 0 to wmax - 1 do
           Begin
             If j > 0 then
              Begin
                inc(wsubseq);
                dm_rel.qry_req.Insert;
                dm_rel.qry_req.fieldbyname('SEQ').value    :=  wseq;
                dm_rel.qry_req.fieldbyname('SUBSEQ').value :=  wSubseq;
              end;

             If j <= iStrReq.count - 1  then
                dm_rel.qry_req.fieldbyname('REQUERIMENTO').value := iStrReq[j];
             If j <= iStrRegra.Count - 1 then
                dm_rel.qry_req.fieldbyname('REGRA').value := iStrRegra[j];
             If j <= iStrProd.count - 1 then
                dm_rel.qry_req.fieldbyname('PRODUTOS').value := iStrProd[j];

           end;
           dm_rel.qry_req.post;
           freeandnil(iTi);
  end;
finally
        freeandnil(iUc);
        freeandnil(iTab);
        freeandnil(iPpg);
       //eandnil(iTi);
        freeandnil(iStrProd);
        freeandnil(iStrRegra);
        freeandnil(iStrReq);
      // frm_mensagem.lb.Visible := false;
       frm_mensagem.pcg.Visible := false;
       frm_mensagem.sp_imp.Enabled := true;
       If bdx.TIPOBANCO = 0 then
       frm_mensagem.sp_exp.Enabled := true;
end;
end;   }


procedure Tfrm_treeativ.SetWnoAtu(const Value: TTreeNode);
begin
  FWnoAtu := Value;
end;

procedure Tfrm_treeativ.AspectosCrticos1Click(Sender: TObject);
var
iTab : Tdados_tab;
existe : boolean;
begin
    try
      iTab := Tdados_tab.create(self);
      with itab  do
       Begin
         ListaCli := udado(tv.Selected.Data)^.Fcli ;
         ListaProj:= udado(tv.Selected.Data)^.fproj ;
         ListaDim := 'IDF_AC' ;
         ListaTit := def40+'s' ;
         ListaTag := 2 ;
         ListaEdit:= true ;
         ListaTree:= nil;
         Listafecha := true;
         ListaId  := 0;
         OPERACAO := udado(tv.Selected.Data)^.FDiag;
         mostra_lista;
         If  (ListaCanc)  or (ListaCodigo = 0) then
             abort;

               Tabela := 'IDF_AC';
               existe := Open_Objeto(ListaCli,ListaProj,ListaCodigo,TABELA) ;
                //   raise exception.Create(EI1);

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
    finally
       freeandnil(iTab);
    end;
end;

procedure Tfrm_treeativ.SpeedButton76Click(Sender: TObject);
begin
     { TODO -c6-000-24 : Corrigido tipo de Link - DMI }
  tv.Diagrama.LinkStyle := TSpeedButton(sender as Tobject).tag;
end;

procedure Tfrm_treeativ.MostratArvore1Click(Sender: TObject);
begin
  spl.left := 180;
  spl.repaint;
end;

procedure Tfrm_treeativ.elaCheia1Click(Sender: TObject);
var
wpan : Tpanel;
begin
  If tv.Selected.Level <= 1 then
   exit;
  If tv.Diagrama.IDG_DIR = 'DPN' then
  Begin
   wpan := pan_proc;
  End
  else
  If tv.Diagrama.IDG_DIR = 'DUC' then
   wpan := pan_use
  else
  If tv.Diagrama.IDG_DIR = 'DMI' then
   wpan := pan_inf
  else
  If tv.Diagrama.IDG_DIR = 'DEO' then
   wpan := pan_org ;

  If wpan.Visible then
   Begin
     self.WindowState := wsmaximized;
     wpan.Visible := false;
     pan_ger.Visible  := false;
     //pan_temp.Height := pan_tit.Height;
     entPop.Items[7].Caption := def94;
   end
 else
   Begin
     pan_ger.Visible  := true;
     pan_ger.Align    := alTop;
     pan_temp.Align   := alTop;
     pan_temp.visible := true;
     //pan_temp.Height  := pan_tit.Height + wpan.Height;
     wpan.Visible     := true;
     entPop.Items[7].Caption := def95;
   end

end;

procedure Tfrm_treeativ.Decompor1Click(Sender: TObject);
begin
  SpeedButton14Click(nil);
end;

procedure Tfrm_treeativ.Nivelacima1Click(Sender: TObject);
begin
  SpeedButton15Click(nil);
end;

procedure Tfrm_treeativ.FormShow(Sender: TObject);
var
  wtext : Tstringlist;
  pfont : TFont;
begin
  inherited;
  pFont := Tfont.create;
  pFont.Name  :='Calibri';
  pFont.Size  := 9;
  frm_Treeativ.width  := width;
  pan_temp.height     := 43;
  frm_treeativ.InsertControl(tv);
  insertControl(tv.Diagrama);
  {If not tv.Diagrama.Carga_Atrib then
   Begin
     Showmessage(mens8+ ' '+BDx.DirFluxo +dg_atu);
     close;
     frm_main.PARA := true;
     exit;
   end;   }
  frm_main.CoolBar2.Visible := false;
  tv.NodeAnterior:= tv.Selected;
  tv.align       := alLeft;
  tv.width       := 250;
  frm_treeAtiv.spl.Align := alLeft;
  frm_treeAtiv.top       := 60;
  tv.PopupMenu := frm_treeAtiv.pop;
  frm_Treeativ.ActiveControl := tv;
  tv.Constraints.MinWidth := 2;
  pan_ger.Align    := alTop;
  tv.Font := pFont;
  tv.Mostra;

  fromDim := false;
  // Aqui são feitas mudanças para o caso do Reader
  If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
   Begin
     speedbutton17.Enabled := false;
     entPop.Items[4].Enabled := false;
     speedbutton84.Enabled := false;
     sp_cop.Enabled       := false;
     xp_col.Enabled        := false;
     sp_recort.Enabled     := false;
     sss.Enabled        := false;
     ToolButton16.Enabled := false;
     ToolButton1.Enabled := false;
     popNode.Items[4].Enabled := false;
     popNode.Items[5].Enabled := false;
   end;

   If frm_main.wassist then
    Begin
      tv.Selected := tv.Items[tv.Items.Count-1];    //ultimo
      tv.TVCLICK(NIL);
      If frm_demoassist.bt.Tag = 3 then
       Begin
        tv.selected := tv.Incluir_TVDiag(tv.selected,frm_demoassist.cliente,
                   frm_demoassist.cenario,
                   empresas.cenarios.Diagramas.IDG_ID,
                   empresas.cenarios.Diagramas.SUB_NOME,
                   empresas.cenarios.Diagramas.IDG_DIR,true);
        tv.TVCLICK(NIL);
        tv.diagrama.selectAction := afNoSelection;
        tv.diagrama.shape := 75;
        tv.Diagrama.SelectedNode := tv.diagrama.Nodes.Add(500,500,4000,4000);

        tv.Diagrama.inclui_node(tv.Diagrama);
        wtext := TstringList.create;
        wtext.add('Parabens! Você esta agora dentro do Diagrama de Processos! Agora é com você! Pode desenhar as Atividades usando a palete acima!' +
                  'Cada Objeto criado pode ser aberto e editado, usando e menu de contexto!');

        trata_entity(tv.Diagrama.SelectedNode,0);
        frm_text.Memo1.Font.Name  := 'Arial';
        frm_text.Memo1.Font.Size  := 14;
        frm_text.Memo1.Text := wtext.Text;
        frm_text.Memo1.Alignment := taLeftJustify;
        frm_text.close;
        tv.Diagrama.SelectedNode := nil;
       end;
    end;
    

    tv.Selected := tv.TopItem;
    tv.TVCLICK(NIL);
end;

procedure Tfrm_treeativ.ImprimirObjeto1Click(Sender: TObject);
var
  ide : Tdad;
  iOn : Tdados_tab;
  i,j : integer;
begin
  If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(self);
  frm_cimp.label1.caption := TmenuItem(sender as Tobject).caption;

  frm_Cimp.showModal;
  If canc then
     exit;

  If frm_pdmig = nil then
    frm_pdmig := tfrm_pdmig.create(self);

  try

  for j := 1 to tv.Diagrama.SelNodes.Count do
  begin

  iDe := Tdad.Create(self);


  If not ide.get_ObjetobyDesc(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,TV.Diagrama.SelNodes.item(j).text,'') then
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
     frm_Pdmig.titulo.caption  := uppercase(def96);

     If Prev then
        frm_Pdmig.qRP.preview
     else
        frm_Pdmig.qrp.print;
  end;

  finally
     frm_Pdmig.close;
     freeandnil(iDe);
  end;

end;


procedure Tfrm_treeativ.GerarScriptSQL1Click(Sender: TObject);
begin
  wScript := TstringList.Create;
  wtab := TstringList.create;
  ide := Tdad.Create(self);

  Gera_Sql(Tv.Diagrama);
  gera_triggers;   // triggers de integridade de PK
  Mostra_sql;
  //pb.Position := 0;
   freeandnil(ide);
   freeandnil(wScript);
   freeandnil(wtab);
end;

procedure Tfrm_treeativ.SetBANCO_ATU(const Value: string);
begin
  FBANCO_ATU := Value;
end;

procedure Tfrm_treeativ.SetSERVIDOR_ATU(const Value: STRING);
begin
  FSERVIDOR_ATU := Value;
end;

procedure Tfrm_treeativ.Setwuserdata(const Value: integer);
begin
  Fwuserdata := Value;
end;

procedure Tfrm_treeativ.AjustaLinha1Click(Sender: TObject);
var
i ,wcount: integer;
wx,wy ,wmeio: real;
worg ,wdst : afLinkPoint;
ObjDst,ObjOrg : afNode;
begin
  wcount := tv.Diagrama.SelLinks.Count ;
  If wCount > 0 then
   Begin
     for i := 1 to wcount do
      Begin
        objdst := tv.Diagrama.selLInks.item(i).Dst;
        objOrg := tv.Diagrama.selLInks.item(i).Org;
        wmeio  := ObjOrg.Top +( ObjOrg.Height / 2 ) ;
        If (wmeio >= (Objdst.top+ ObjDst.Height)) or (wmeio <= Objdst.top)  then
          exit;
        Worg   :=  tv.diagrama.SelLinks.item(i).ExtraPoints.Item[0];
        wdst   := tv.diagrama.SelLinks.item(i).ExtraPoints.Item[tv.diagrama.SelLinks.item(i).ExtraPoints.count-1];
        wdst.y := worg.y;
        tv.diagrama.SelLinks.item(i).ExtraPoints.Item[tv.diagrama.SelLinks.item(i).ExtraPoints.count-1]  := wdst;
      end;
   end;
  
end;

procedure Tfrm_treeativ.Setdmi_desc(const Value: string);
begin
  Fdmi_desc := Value;
end;

procedure Tfrm_treeativ.sp_prClick(Sender: TObject);
begin
   If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;
end;

procedure Tfrm_treeativ.sp_copClick(Sender: TObject);
var
i,j : integer;
aWbs,aAtor : afNode;
begin
  tv.Diagrama.Copia_Sel;
end;

procedure Tfrm_treeativ.xp_colClick(Sender: TObject);
var
i,j ,tot: integer;
awbs,aAtor : afNode;
begin
   tv.Diagrama.Cola_sel(true,true,false,0);
end;

procedure Tfrm_treeativ.SetDiagm(const Value: Tdg);
begin
  FDiagm := Value;
end;


procedure Tfrm_treeativ.SetPERC(const Value: real);
begin
  FPERC := Value;
end;

procedure Tfrm_treeativ.Get_objetosGraf(pDiag: Tdg; pNode: afNode);
begin

end;

procedure Tfrm_treeativ.SpeedButton10Click(Sender: TObject);
begin
 tv.Diagrama.Get_Nodes(tv.Diagrama.SelectedNode,'I');
end;



procedure Tfrm_treeativ.SetLISTA_DG(const Value: BOOLEAN);
begin
  FLISTA_DG := Value;
end;



procedure Tfrm_treeativ.FormCreate(Sender: TObject);
begin
  frm_main.wbs := true;
  frm_main.para := false;
  Custos_erros := TStringList.create;
  ReportList := TList.Create;
  Duplic := TList.Create;
  DataList := TList.Create;
  ListaDados := TList.Create;
  oDgLocked := TDg.create;
  If tv = nil then
    tv  := TTv.create;

  If not tv.Diagrama.Carga_Atrib then
   Begin
     Showmessage(mens8+ ' '+BDx.DirFluxo +dg_atu);
     frm_main.PARA := true;
     close;
     exit;
   end;
 // LOad_constantTreeAtiv;
end;

procedure Tfrm_treeativ.LoadconstantObj;
begin
  caption :=  deft17 ;   //treeview;
  //label1.Caption := def223;//'Nível/Level'
  speedbutton17.Hint := def903;//'Salvar'
  speedButton11.Hint := def761;//'Imprimir'
  SpeedButton84.Hint := def7777 ;// 'Configuração dos Objetos'
  sp_cop.Hint := def7778; //Copiar'
  xp_col.Hint := def510;// 'Colar'
  sss.Hint := def9111;//'Pendências do Diagrama';
  ToolButton16.Hint := def9111;
  sp_recort.Hint := def1081;//'Recortar' ;
  SpeedButton4.Hint := def381;//'Alinhar a Direita'                        ;
  SpeedButton5.Hint :=def382;// 'Alinhar acima'                             ;
  SpeedButton3.Hint := def383;//'Alinhar abaixo'                            ;
  SpeedButton2.Hint := DEF1121;//'Mesma largura'                             ;
  SpeedButton6.Hint := DEF1122;//'Mesma Altura'                              ;
  SpeedButton8.Hint := DEF1123;//'Mesmo Tamanho (T)'                         ;
  spy.Hint := def384;//'Alinhar a esquerda (E)'                             ;
  SpeedButton14.Hint := def224;//'Nível abaixo'                             ;
  //ToolButton6.Hint := def224;
  SpeedButton15.Hint := def225;//'Nível acima'                      ;
  ToolButton5.Hint :=  def225;
  spp.Hint := def10002 ;//'Atualiza nomes de Atividades e Fluxos de Dados'     ;
  SpeedButton1.Hint := def10003;//'Aumentar'                                  ;
  SpeedButton13.Hint := def2991;//'Diminuir'                                 ;
  spb_ajuste.Hint := def385;//'Ajustar Diagrama'                            ;
  spb_normal.Hint := def354;//'Diagrama tamanho Normal'                     ;
  SpeedButton18.Hint := def63;//'Processo'                                 ;
  SpeedButton21.Hint := def18                                  ;
  spb_jo.Hint := def333                                          ;
  SpeedButton23.Hint := def671;//'Processo Externo'                         ;
  SpeedButton24.Hint := def904;//'Selecionar'                               ;
  SpeedButton25.Hint := def67                        ;
  //SpeedButton25.Caption := def90                            ;
  SpeedButton26.Hint := def52                         ;
  SpeedButton27.Hint := def9                           ;
  SpeedButton28.Hint := def777779;//'Conexão de regra de negócio'              ;
  SpeedButton29.Hint := def9                           ;
  SpeedButton30.Hint := def9                           ;
  spt.Hint := def7779;//'Conector'                                           ;
  SpeedButton33.Hint :=def123;//'Texto'                                    ;
  SpeedButton33.Caption := def934  ;//'S/N'
  SpeedButton42.Hint := defa18                          ; // Alinha centros horizontalmente (H)
  SpeedButton49.Hint := defa19                          ; // Alinha Centros Verticalmente                                 ;
  SpeedButton50.Hint := def9                           ;
  SpeedButton41.Hint := def123;//'Texto'
  //SpeedButton41.Caption := def123;//'Texto/Text'
  SpeedButton60.Hint := def672;//'Processo ISO 9000'                        ;
  SpeedButton75.Hint := def461;//'Painel'                                   ;
  SpeedButton7.Hint := def904;//'Selecionar'                                ;
  SpeedButton80.Hint := def103;//'Arquivamento'                             ;
  spb9.hint := def10004;//'Definir Ator default e Local de Processamento default';
  //spb9.Caption := def10004;//'Default (Ator e Local/Actor and Site)'          ;
  SpeedButton96.Hint := def951;//'Troca WBS por Aplicativo'                 ;
  SpeedButton31.Hint := def1000                                     ;
  SpeedButton43.Hint := def904;//'Selecionar'                               ;
  SpeedButton46.Hint := def123                                    ;
  //SpeedButton46.Caption := def123;//'Texto'
  SpeedButton20.Hint := def904;//'Selecionar'                               ;
  SpeedButton10.Hint := def461;//'Painel'                                   ;
  SpeedButton34.Hint := def888                          ;
  SpeedButton35.Hint := def86                     ;
  SpeedButton38.Hint := def904;//'Selecionar'                               ;
  SpeedButton47.Hint := def123;//'Texto'
  //SpeedButton47.Caption := def123;//'Texto/Text'                            ;
  SpeedButton48.Hint := def77779                                    ;
  // SpeedButton48.Caption := def77779;
  SpeedButton22.Hint := def1000                                     ;
  SpeedButton32.Hint := def64;//'Use Case'                                 ;
  SpeedButton45.Hint := def904;//'Selecionar'                               ;
  //  SpeedButton83.Hint := 'Sub Sistema'                              ;
  SpeedButton97.Hint := def933;//'SQL'                                      ;
  //SpeedButton97.Caption := def933;//'SQL'                                   ;
  SpeedButton52.Hint := def63;//'Processo'                                 ;
  speedButton53.Hint := def110;//'Evento'                                   ;
  SpeedButton54.Hint := def333;//'Decisão'                                  ;
  SpeedButton55.Hint := def671;//'Processo Externo'                         ;
  SpeedButton56.Hint := def904;//'Selecionar'                               ;
  SpeedButton59.Hint := def77779                           ;
  SpeedButton61.Hint := def77779                           ;
  SpeedButton62.Hint := def77779                           ;
  SpeedButton63.Hint := def7779                                 ;
  //SpeedButton65.Hint := def123;//'Texto'
  SpeedButton66.Hint := def77779                                 ;
  SpeedButton67.Hint := def77779                                 ;
  SpeedButton64.Hint := def888                          ;
  SpeedButton69.Hint := def77779              ;
  SpeedButton71.Hint := def77779                         ;
  SpeedButton72.Hint := def77779                          ;
  SpeedButton73.Hint := def77779                          ;
  SpeedButton74.Hint := def77779                        ;
  SpeedButton76.Hint := def77779                        ;
  SpeedButton79.Hint := defc35 ;  // Criar Atividade seguinte (ESC)
  SpeedButton81.Hint := def1000                                     ;
  SpeedButton82.Hint := def904;//'Selecionar'                               ;
  SpeedButton85.hint := def123;//'Texto'                                    ;
  //SpeedButton85.Caption := def123;//'Texto/Text'                            ;
  SpeedButton90.Hint := def904;//'Selecionar'                               ;
  SpeedButton91.Hint := def461;//'Painel'                                   ;
  sp_gener.Hint := def191;//'Generalização'                                 ;
  SpeedButton87.Hint := def3841;//'Associação'                               ;
  SpeedButton88.hint := def6221;//'Dependência'                               ;
  sp_agreg.Hint := def38001;//'Agregação'                                     ;
  SpeedButton86.Hint := def355;//'Diagrama de Processos'                    ;
  SpeedButton89.Hint := def356;//'Diagrama de Análise'                      ;
  SpeedButton92.Hint := def357;//'Organograma'                              ;
  SpeedButton94.Hint := def358;//'Diagrama Livre'                           ;
  SpeedButton95.Hint := def359;//'Diagrama de Classe'                       ;
  SpeedButton93.Hint := def22;//'Modelo de Informação'                     ;
  SpeedButton68.Hint := def904;//'Selecionar'                               ;
  SpeedButton70.Hint := def123;//'Texto'                                 ;
  //SpeedButton70.Caption := def123;//'Texto'                            ;
  sp1.Hint := def3800;//'1 para n'                                           ;
  sp2.Hint := def3802;//'0,1 para n'                                         ;
  sp3.Hint := def3803;//'1,n para n'                                         ;
  SpeedButton12.Hint := def96;//'Objeto de Negócio'                        ;
  SpeedButton77.Hint := def904;//'Selecionar'                               ;
  SpeedButton78.Hint := def461;//'Painel'                                   ;
  sp10.Hint := def3805;//'0,1 PARA 1,N'                                    ;
  sp12.Hint := def3805;//'0,1 PARA 1,N'                                     ;
  sp11.Hint := def3805;//'0,1 PARA 1,N' '                                     ;
  SP4.Hint := def3805;//'0,1 PARA 1,N'                                         ;

  SP5.Hint := def3805;//'0,1 PARA 1,N'                                       ;
  SP6.Hint := def3806;//'1,PARA 1,N'                                         ;
  SP7.Hint := def3807;//'1 PARA 1'                                           ;
  SP8.Hint := def3808;//'1 PARA 0,1'                                         ;
  spb_sql.Hint := def933;//'SQL'                                            ;
  cmb_schema.Text := def92;//'Esquema'                                     ;
  cmb_schema.Items [0] := def78;//               ;
  cmb_schema.Items [1] :=def260;//  'Engenharia Reversa/Reverse Engineering';

  {object pop1: TPopupMenu
    AutoPopup = False
    Left = 396
    Top = 208
    object Espessura1: TMenuItem
      Caption = 'Espessura'
    end
    object Cor1: TMenuItem
      Caption = 'Cor '
    end
    object Estilo1: TMenuItem
      Caption = 'Estilo'
    end
  end

  end
  object PopLiv: TPopupMenu
    Left = 160
    Top = 306
    object MenuItem5: TMenuItem
      Caption = 'Atrás'
    end
    object MenuItem6: TMenuItem
      Caption = 'Frente'
    end
    object MenuItem7: TMenuItem
      Caption = 'Imagem'
      object MenuItem8: TMenuItem
        Caption = 'Inclui Imagem'
        OnClick = MenuItem8Click
      end
      object MenuItem9: TMenuItem
        Caption = 'Excluir Imagem'
        OnClick = MenuItem9Click
      end
      object AjustaImagemaEntidade2: TMenuItem
        Caption = 'Ajusta Imagem a Entidade'
        OnClick = AjustaImagemaEntidade2Click
      end
      object AjustaEntidadeaImagem2: TMenuItem
        Caption = 'Ajusta Entidade a Imagem'
        OnClick = AjustaEntidadeaImagem2Click
      end
    end
    object MenuItem10: TMenuItem
      Caption = 'Propriedades'
      OnClick = MenuItem10Click
    end
  end   }
end;


procedure Tfrm_treeativ.DefinirAtorDefault1Click(Sender: TObject);
begin
   If tv.Diagrama <> nil then
    Begin
      If frm_Atordef     = nil then
         frm_Atordef      := Tfrm_Atordef.create(self);
      frm_Atordef.cliente := tv.Diagrama.EMPRESA;
      frm_Atordef.cenario := tv.Diagrama.CENARIO;
     frm_Atordef.showmodal;
    end;
   
end;

procedure Tfrm_treeativ.SetATORDEF(const Value: INTEGER);
begin
  FATORDEF := Value;
end;

procedure Tfrm_treeativ.SetLOCALDEF(const Value: INTEGER);
begin
  FLOCALDEF := Value;
end;

procedure Tfrm_treeativ.Setatordefdesc(const Value: string);
begin
  Fatordefdesc := Value;
end;

procedure Tfrm_treeativ.Setlocaldefdesc(const Value: string);
begin
  Flocaldefdesc := Value;
end;

procedure Tfrm_treeativ.spb9Click(Sender: TObject);
begin
  DefinirAtorDefault1Click(nil);
end;

procedure Tfrm_treeativ.dASDClick(Sender: TObject);
begin
  tv.Diagrama.Get_Nodes(tv.Diagrama.SelectedNode,' ');
end;

procedure Tfrm_treeativ.Setwnome_exportado(const Value: string);
begin
  Fwnome_exportado := Value;
end;

procedure Tfrm_treeativ.SetReportList(const Value: TList);
begin
  FReportList := Value;
end;

procedure Tfrm_treeativ.Setwprint(const Value: string);
begin
  Fwprint := Value;
end;

procedure Tfrm_treeativ.SetFormList(const Value: TList);
begin
  FFormList := Value;
end;

procedure Tfrm_treeativ.SetDuplic(const Value: TList);
begin
  FDuplic := Value;
end;

procedure Tfrm_treeativ.SetDataList(const Value: Tlist);
begin
  FDataList := Value;
end;

procedure Tfrm_treeativ.SetListadados(const Value: TList);
begin
  FListadados := Value;
end;

procedure Tfrm_treeativ.ImprimirMissoAtor1Click(Sender: TObject);
begin
{  If frm_selmissao     = nil then
     frm_selmissao     := Tfrm_selmissao.create(self);
  frm_selmissao.showmodal;}
 Geramanual(nil);

end;

procedure Tfrm_Treeativ.Imprime_Diagrama(pBack,pFundo,pStretch,pFit : boolean;
                                         pCli,pProj,pbottom,pTop,pLeft,pRight,pOrient,pZoom,pTotal : integer;
                                         pNome : string;
                                         pDg :Tdg);
var
  wpic :IPictureDisp;
  i ,j,larguraAtual,wzoom: integer;
  iNode : afNode;
  idiag,jDiag : TAddFlow;
  iemp : Tempresa ;
begin

 with  frm_pdiag  do
  Begin
    //qrp.page.BottomMargin  := pBottom;
    //qrp.page.TopMargin     := pTop;
    //qrp.page.LeftMargin    := pLeft;
    //qrp.page.RightMargin   := pRight   ;
    pdiag.stretch          := pStretch;
 {    If pOrient = 0 then
        qrp.page.orientation := poPortrait
     else   }
     qrp.page.orientation := poLandscape;
     wzoom := pZoom;


     If pFit then
       Begin
         LarguraAtual := pdg.Get_RightDiagrama;
         If LarguraATual > 15720 then
          Begin
           wzoom := ((15720* 100) div LarguraAtual)  ;
          end;

       end;

     iEmp := tempresa.create(self);
     try
       ph1.Zoom := wzoom;
       iemp.Open_Empresa(pcli) ;
       pr_cli.caption  := iEmp.CLI_NOME;
       iEmp.cenarios.Open_Cenario(pcli,pProj);
       pr_proj.caption := iEmp.cenarios.PRJ_TITULO;
       Ldesc.caption   := pNome;

       pr_cli.left := trunc(ph1.width/2 - pr_cli.width/2);
       pr_proj.left := trunc(ph1.width/2 - pr_proj.width/2);
       ldesc.left := trunc(ph1.width/2 - ldesc.width/2);
       qrlabel1.left := trunc(ph1.width - (qrnivel.width+qrlabel1.width));
       qrsysdata1.left := qrlabel1.Left;

       qrnivel.left := qrlabel1.Left + qrLabel1.Width + 10;//(ph1.width - qrNivel.width);
     finally
       iEmp.Free;
     end;
  end;


 If pTotal = 0 then  // total
  Begin
    pDg.saveImage(0,1,GetCurrentDir+'\img.emf');
    frm_pDiag.pdiag.Picture.LoadfromFile(GetCurrentDir+'\img.emf');
  end
 else
  Begin
   iDiag := Tdg.create ;
   try
      for i := 1 to pDg.selNodes.Count do
        Begin
         If pDg.selnodes.item(i).shape in [11,50] then
            Begin
              iNode :=  pDg.Obtem_ator(pDg.selnodes.item(i));
              If Inode <> nil then
                 Begin
                   iNode.Selectable := true;
                   iNode.Selected   := true;
                 end;
              iNode :=  pDg.Obtem_wbs(tv.diagrama.selnodes.item(i));
              If Inode <> nil then
                 Begin
                   iNode.Selectable := true;
                   iNode.Selected   := true;
                 end;

            end;
        end;

     try
      begin
         pDg.copy(afSelectedItems);
       end;
      except
       begin
         pdg.copy(afSelectedItems);
       end;
      end;


     with iDiag do
      Begin
        paste(true);
        saveImage(0,1,GetCurrentDir+'\img.emf');
        frm_pdiag.pdiag.Picture.LoadfromFile(GetCurrentDir+'\img.emf');
        for i := 1 to pdg.Nodes.Count do
        Begin
         If pDg.nodes.item(i).shape in [11,50] then
            Begin
              iNode :=  pDg.Obtem_ator(pDg.nodes.item(i));
              If Inode <> nil then
                 iNode.Selectable := false;

              iNode :=  pDg.Obtem_wbs(tv.diagrama.nodes.item(i));
              If Inode <> nil then
                 iNode.Selectable := false;

            end;
        end;
      end;
   finally
      freeandnil(iDiag);
   end;

  end;
  frm_pdiag.scaleby(wzoom,100);
 with frm_pdiag.qrp do
  begin
    //Get the current papersize from the default printer and set the report to use it
    with TQRPrinter.Create(self) do
    begin
      Printerindex := -1;
      //frm_pdiag.qrp.Page.PaperSize := PaperSize;
      Free;
    end;
  end;
end;

procedure Tfrm_treeativ.SetPesq_ativ(const Value: integer);
begin
  FPesq_ativ := Value;
end;

procedure Tfrm_treeativ.Setpesq_dg(const Value: string);
begin
  Fpesq_dg := Value;
end;

procedure Tfrm_treeativ.sssClick(Sender: TObject);
var
  i,j,w,it : integer;
begin
  If frm_treeativ <> nil then
    tv.diagrama.salvar;
  Ed_todo(nil);
 //
end;

procedure Tfrm_treeativ.Setselmissao(const Value: boolean);
begin
  Fselmissao := Value;
end;

procedure Tfrm_treeativ.RegistrarPendncias1Click(Sender: TObject);
begin
  sssClick(nil);
end;

procedure Tfrm_treeativ.SpeedButton86Click(Sender: TObject);
begin
  Abre_Diag(sender);
end;

procedure Tfrm_treeativ.sp_recortClick(Sender: TObject);
var
tp : TShiftState;
begin
 tp := [ssctrl];
 tv.Diagrama.wKeyAction(VK_DELETE,tp);
end;

procedure Tfrm_treeativ.SetPARA(const Value: boolean);
begin
  FPARA := Value;
end;

procedure Tfrm_treeativ.SpeedButton96Click(Sender: TObject);
var
i,xid : integer;
wtab,wdesc : string;
begin
  If tv.Diagrama.IDG_DIR = 'DPN' then
   begin
    for i := 1 to tv.Diagrama.Nodes.Count do

     begin
      If tv.Diagrama.Nodes.Item(i).Shape = 50 then //atividade
       begin
           begin
              with Tdados_tab.create(self) do
               begin
                  If not frm_main.wbs then
                     begin
                      Get_Correlatos(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'AP',tv.Diagrama.Nodes.Item(i).UserData,'SE','IDF_SE') ;
                      xid := fieldbyname('IDF_COD_APLIC').asinteger ;
                      wtab := 'IDF_TX';
                     end
                   else
                     begin
                       xid :=  tv.Diagrama.Nodes.Item(i).UserData;
                       wtab := 'IDF_AP';
                     end;

                   Open_objeto( tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,xid,wtab);
                   If wtab = 'IDF_TX' then
                    wdesc := fieldbyname('IDF_DESIGNACAO').asstring
                   else
                    wdesc := fieldbyname('IDF_WBS_CODE').asstring  ;
                   If frm_treeativ <> nil then
                    begin
                       If wdesc <> '' then
                         tv.Diagrama.Obtem_wbs(tv.Diagrama.Nodes.Item(i)).Text := wdesc;
                    end;

               end;
           end
       end;
     end;
     frm_main.wbs := not frm_main.wbs;
   end;
end;

procedure Tfrm_treeativ.Setwbs(const Value: boolean);
begin
  Fwbs := Value;
end;

procedure Tfrm_treeativ.GerarCasosdeUso1Click(Sender: TObject);
begin
  Gera_Usecase(nil);
end;

procedure Tfrm_treeativ.EscondeMostraFluxo1Click(Sender: TObject);
var
i : integer;
begin
  If tv.Diagrama.SelLinks.Count > 0 then
   begin
    for i := 1 to tv.Diagrama.SelLinks.Count do
     begin
       If tv.Diagrama.SelLinks.Item(i).DrawStyle = afTransparent then
          tv.Diagrama.SelLinks.Item(i).DrawStyle :=  afSolid
       else
          tv.Diagrama.SelLinks.Item(i).DrawStyle :=  afTransparent;

     end;


   end;
end;

procedure Tfrm_treeativ.SetFORMDG(const Value: BOOLEAN);
begin
  FFORMDG := Value;
end;

procedure Tfrm_treeativ.ImportarDiagramas1Click(Sender: TObject);
begin
  BDImport := TBD.Create(true,false,false);
end;

procedure Tfrm_treeativ.SetBDIMPORT(const Value: TBD);
begin
  FBDIMPORT := Value;
end;

procedure Tfrm_treeativ.ImportarDiagrama1Click(Sender: TObject);
var
TvImport : TTv;
begin
 TvImport := TTv.create;
 BdImport := Tbd.create(true,true,true);
 //copia do diretório a importar para diretório temporário
 salvar_diretorio;
end;

procedure Tfrm_treeativ.salvar_diretorio;
var
  i : integer;
  s : string;
  NewDir : array [0..1024] of char;
  OldDir :  array [0..1024] of char;
begin
  try
    // cria dirétório
    if DirectoryExists(bdx.DirFluxo+'\temp') then
    begin
      cFile.Directory := bdx.DirFluxo+'\temp';
      for i := 0 to cFile.Count - 1 do
         deletefile(cFile.items[i]);
    end
    else
    begin
      if not CreateDir(bdx.DirFluxo+'\temp') then
       raise Exception.Create(mens126 +bdx.DirFluxo+'\temp');
    end;

    cFile.Directory := bdx.DirFluxo;
    //copia digarmas para o temporário
    for i := 0 to cFile.Count - 1 do
    begin
      s:= cFile.Items[i];
      strPcopy(NewDir,bdx.dirfluxo+'\temp\'+s);
      strPcopy(OldDir,bdx.dirfluxo +'\'+s);
      copyfile(OldDir,Newdir,true);
    end;
    cFile.Directory := bdx.DirFluxo;
    //copia banco para o temporário
    for i := 0 to cFile.Count - 1 do
     begin
        s:= cFile.Items[i];
        strPcopy(NewDir,bdx.Dirbanco+'\temp\'+s);
        strPcopy(OldDir,bdx.Dirbanco +'\'+s);
        copyfile(OldDir,Newdir,true);

     end;







 finally

 end;
 end;
procedure Tfrm_treeativ.SetoAtor(const Value: afnode);
begin
  FoAtor := Value;
end;

procedure Tfrm_treeativ.SetoWbs(const Value: afnode);
begin
  FoWbs := Value;
end;

procedure Tfrm_treeativ.sptClick(Sender: TObject);
var
i : integer;
begin
  for i := 1 to tv.Diagrama.Nodes.Count do
    showmessage(tv.Diagrama.Nodes.item(i).text + ' '+inttostr(tv.Diagrama.Nodes.item(i).userdata));
end;



procedure Tfrm_treeativ.spb_sqlClick(Sender: TObject);
begin
  If frm_qry = nil    then
    Begin
        frm_qry := Tfrm_qry.create(self);
        If frm_bancos = nil then
           frm_bancos := Tfrm_bancos.create(self);
         frm_bancos.edit1.Text := SERVIDOR_ATU;
         frm_bancos.edit2.Text := BANCO_ATU;
         frm_bancos.ShowModal;
         frm_qry.Nome_banco := frm_treeativ.Nome_banco;
    end;
  frm_qry.WindowState := wsnormal;
  frm_qry.show;
end;

procedure Tfrm_treeativ.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If key = VK_ESCAPE then
         wStop := true;
end;

end.






