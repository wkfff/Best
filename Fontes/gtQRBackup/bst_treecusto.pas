unit bst_treeCusto;        //6_38

interface
   // testar : mudança de ativiadaee via lista ; se ha decomposicao, nao
   // deletar quando ha outra atividade igual no mesmo diagrama
   //   - Quando cria atividade via lista, na montagem da arvore,colocar os mdados
   // quando deletar uma atividae, se no tv nào estiver com os filhos, delete
   //   somente o pai : antes de deletear, abrir os filhos.   OK
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Buttons, StdCtrls, Menus, ImgList, ExtCtrls,AddFlow3Lib_TLB,bstdb,
   cls_obj, TPCProgressBars,cls_utils,AxCtrls, OleCtrls, QuickRpt, Qrctrls,activex,
  DBCtrls,shellApi,Provider,ADODB,Fonctions,DB,bst_objetos,math, gtQrCtrls,
  Grids, DBGrids, RxGIF, Animate, GIFCtrl,bst_basefrm;

type
  Tfrm_treeCusto = class(TBASEfRM)
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
    Label1: TLabel;
    Edit1: TEdit;
    m_menu: TMainMenu;
    Arquivos1: TMenuItem;
    Novodiagrama1: TMenuItem;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    Sair2: TMenuItem;
    Editar1: TMenuItem;
    Selecionar1: TMenuItem;
    Preferencias1: TMenuItem;
    Objetos1: TMenuItem;
    Grid1: TMenuItem;
    Ajustar1: TMenuItem;
    TamanhoNormal1: TMenuItem;
    N1: TMenuItem;
    cfg: TMenuItem;
    Sair1: TMenuItem;
    SpeedButton11: TSpeedButton;
    Memo1: TMemo;
    SpeedButton16: TSpeedButton;
    rt: TRichEdit;
    dbrt: TDBRichEdit;
    pan_temp: TPanel;
    pan_tit: TLabel;
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
    SpeedButton31: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton75: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
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
    Edit5: TEdit;
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
    cmb_schema: TComboBox;
    SpeedButton80: TSpeedButton;
    Panel2: TPanel;
    CalcularCustos1: TMenuItem;
    MostrarCustos1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Edit12: TEdit;
    Edit11: TEdit;
    Edit2: TEdit;
    pan_stat: TPanel;
    pan_dg: TPanel;
    sp_abre: TSpeedButton;
    Label5: TLabel;
    pan_calc: TPanel;
    sp_calc: TSpeedButton;
    Label6: TLabel;
    pan_show: TPanel;
    sp_custos: TSpeedButton;
    Label8: TLabel;
    pan_end: TPanel;
    sp_concluido: TSpeedButton;
    Label11: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label9: TLabel;
    Edit13: TEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure SpeedButton80Click(Sender: TObject);
    procedure Estmulo1Click(Sender: TObject);
    procedure sppClick(Sender: TObject);
    procedure AtualizarasDescriesdosObjetos1Click(Sender: TObject);
    procedure RegistrarAspectoCrticomelhoria1Click(Sender: TObject);
    procedure RegistrarAspectosCrticosmelhorias1Click(Sender: TObject);
    procedure AspectosCrticos1Click(Sender: TObject);
    procedure SpeedButton76Click(Sender: TObject);
    procedure MostratArvore1Click(Sender: TObject);
    procedure Decompor1Click(Sender: TObject);
    procedure Nivelacima1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirObjeto1Click(Sender: TObject);
    procedure AjustaLinha1Click(Sender: TObject);
    procedure sp_prClick(Sender: TObject);
    procedure sp_copClick(Sender: TObject);
    procedure xp_colClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalcularCustos1Click(Sender: TObject);
    procedure MostrarCustos1Click(Sender: TObject);
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
    

    procedure SetOrigem_dados(const Value: integer);
    procedure ImprimirAP(pCod: integer; pEnt: afNode);
    procedure ImprimirDados;
    procedure ImprimirDG(pClasse: string);
    procedure ImprimirEE(pCod: integer; pEnt: afNode);
    procedure ImprimirEN(pCod: integer; pEnt: afNode);
    procedure ImprimirUC(pCod: integer; pEnt: afNode; pTipo: integer);
    procedure WExport(pCod: integer; pEnt: afNode; pNom: string;
      pRel: TQuickRep);

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
    function Cria_OE(pNode : afNode): boolean;
    function gera_Modelo(pbanco: integer): boolean;
    procedure Setidbado(const Value: TAdoConnection);
    procedure Setschema(const Value: string);
    procedure SetDir_canc(const Value: boolean);
    procedure SetServidor(const Value: string);
    procedure recria_corr(pNode: afNode);
    procedure recria_corrRel(pdg: afLink);
    procedure SetWnoAtu(const Value: TTreeNode);
    procedure Muda_Font(sender : TObject);
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





    { Private declarations }
  public
    { Public declarations }
  published
   property Diagm : Tdg read FDiagm write SetDiagm;
   property wuserdata : integer read Fwuserdata write Setwuserdata; // código da última atividade atualizada
   property WimpTxt : boolean read FWimpTxt write SetWimpTxt;
   property WDirImp : string  read FWDirImp write SetWDirImp;
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
   procedure Calcular_Custos(pDg: Tdg);
    procedure Mostrar_Custos(pDg: Tdg);
   procedure LoadConstantObj; override;


  end;

 // type
 //  cStyle = set of 1..100;



var
  frm_treeCusto: Tfrm_treeCusto;
  I,Wwidg,tot_no: INTEGER;
  Ind,WNodeAtual,IndTop,IndCli,Indproj : TtreeNode;
  Cli_ant,Prj_Ant,Pai_Ant : integer;
  xCli,xPrj,xPai : integer;
  mdado : Udado;
  Cli_nome_ant,Proj_Nome_Ant ,WNome_ju: string;
  Diag_rep,wsql : TstringList;
  WNode,RNode,WNodeAtu : TtreeNode;
  z,Witem,Wtot,zCli,zProj : integer;
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
implementation



uses bst_main, bst_ap, bst_clifull, bst_cenario, bst_diagrama, bst_regra,
  bst_en, bst_ca, bst_data, bst_lista, bst_juncao, bst_if, bst_pessoa,
  bst_ev, bst_conector, bst_propr, bst_cfg, bst_proprlink, bst_origem,
  bst_preprint, bst_ImpProc, BST_pdata, bst_puc,
  bst_pativ, bst_pen, bst_pca, bst_pregra, bst_pdiag, bst_Telastd, bst_pac,
  bst_dir1, bst_preqtitot, bst_text, bst_texto, bst_grid, bst_dir4,
  bst_bancos, qcc_enga, bst_tabenga, bst_log, bst_aspectos, 
  bst_mensagem, BST_pdmig, bst_cimp,bst_prnf, bst_dmicon, bst_pprint,
  bst_pConsistDg, bst_dm_rel;



{$R *.DFM}
procedure Tfrm_treeCusto.LoadConstantObj;
 Begin
  inherited;
 end;
procedure Tfrm_treeCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
var  
 ret : word;
begin
  try
   begin
     freeandnil(Custos_erros);
     freeandnil(tv);
     frm_treeCusto := nil;
      action := cafree;
     
   end;
  except
   begin
     raise;
   end;
  end;

end;




procedure Tfrm_treeCusto.Imp_Ti (sender : Tobject);


begin
  WNoAtu := tv.selected;
  If frm_mensagem = nil then
       frm_mensagem := TFrm_mensagem.create(self);
  If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
    frm_mensagem.sp_ger.Enabled := false;
    frm_mensagem.show;


end;

procedure Tfrm_treeCusto.Consiste_diagt(sender : TObject);
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
            {qrp.DataSet := iTemp;
            qrdataset(db,itemp) ;
            qrdataset(gr,itemp) ;
            qrp.preview;}
            Close;
          end;
      end;
 end;

procedure Tfrm_treeCusto.Muda_Font(sender : TObject);
 Begin
   with TfontDialog.create(self) do
    Begin
      execute;
      tv.Font := font;
    //  Wfnt := fnt.font;
    //  Edit1.font := WFnt;
    end;
   
 end;


procedure Tfrm_treeCusto.Imp_Doc (pNode : TTreeNode;sender : Tobject);
var
n ,warq,wstring: string;

begin
 

end;


procedure Tfrm_treeCusto.Export_arvore(Sender: TObject);
var
wnodeAtu : TTreeNode;
begin

end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end;

procedure Tfrm_treeCusto.exp (sender : Tobject);
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
   GetDir(@(ExDir));
    If ExDir <> '' then
     begin
           If ExtractFileExt(ExDir) <> '.txt' then
            ExDir := ExDir+'.txt' ;
           Wgrid := tv.Diagrama.Showgrid;
           tv.Diagrama.Showgrid := false;
           tv.Diagrama.saveImage(0,1,exdir);
           tv.Diagrama.ShowGrid := WGrid;
           showmessage(mens43+ExDir);
     end;

  { If frm_diretorio = nil then
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
     end;  }
end;


procedure Tfrm_treeCusto.Imp_Aspect(Sender: TObject);
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
        //frm_pac.qrp.DataSet := iAsp;

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

      //frm_pac.qrp.preview;
      //frm_pac.close;

    finally
      // freeandnil(itab);
       freeandnil(iAsp);
    end;

 end;




procedure Tfrm_treeCusto.ImprimirDados;   // Imprime grupo de dados
var
g : integer;
winn : string;
itab : TDados_tab;
iDg : Tdados;
begin

end;
procedure Tfrm_treeCusto.ImprimirUC(pCod : integer;pEnt :afNode;pTipo : integer);
var
iUc : TDados_tab;
begin
   try

     If frm_ev = nil then
        frm_ev := Tfrm_ev.create(self);
     If pTipo = 58 then
       frm_ev.tipo := 'OI'
     else
       frm_ev.Tipo := 'OC';
     iUc := TDados_tab.create(self);
     
     If iUc.Open_Objeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,pCod,'IDF_OI') then
      begin
         with frm_ev do
          begin
            ID := pCod;
            Cliente := tv.Diagrama.EMPRESA;
            Cenario := tv.Diagrama.CENARIO ;
            idatasource :=  iUc.DataExt;
            IMprime('P');
          end;
      end;
   finally
      freeandnil(iUc);
      //frm_puc.close;
      frm_ev.close;
   end;
end;



procedure Tfrm_treeCusto.ImprimirAP(pCod : integer;pEnt :afNode);
var
 iTab : TDados_tab;
Begin
   try
     If frm_Pativ = nil then
      frm_Pativ := tfrm_Pativ.create(self);

   If frm_ap = nil then
    frm_ap := Tfrm_ap.create(self);
   iTab := TDados_tab.create(self);
   iTab.Open_Objeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,pCod,'IDF_AP');
   frm_ap.idatasource := itab.DataExt;
   frm_ap.Mostra_pap('P',frm_pativ);
   finally
      freeandnil(itab);
      frm_ap.close;
      If frm_pativ <> nil then
        frm_pativ.Close;
   end;


end;

procedure Tfrm_treeCusto.ImprimirEN(pCod : integer;pEnt :afNode);
var
iUc : TDados_tab;
begin
   try

     If frm_en = nil then
        frm_en := Tfrm_en.create(self);
     iUc := TDados_tab.create(self);

     If iUc.Open_Objeto(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,pCod,'IDF_EN') then
      begin
         with frm_en do
          begin
            ID := pCod;
            Cliente := tv.Diagrama.EMPRESA;
            Cenario := tv.Diagrama.CENARIO ;
            idatasource :=  iUc.DataExt;
            Imprime('P');
          end;
      end;
   finally
      freeandnil(iUc);
      frm_en.close;
   end;
end;

procedure Tfrm_treeCusto.ImprimirEE(pCod : integer;pEnt :afNode);
var
ica : TDados_tab;
Begin


end;


procedure Tfrm_treeCusto.WExport(pCod : integer;pEnt :afNode;pNom : string;pRel : TQuickRep);
var
wnom : string;
//atext : TQRAsciiExportFilter;
begin

end;




procedure Tfrm_treeCusto.ImprimirDG(pClasse : string);
var
wpic         :IPictureDisp;
WShowgridAnt : boolean;
Wpos         : Integer;
Wnome        : string;
begin

 WShowgridAnt := tv.diagrama.ShowGrid;
 tv.diagrama.SelectAll;
 If tv.diagrama.SelNodes.Count = 0 then
    exit;
 If frm_pdiag = nil then
    frm_pdiag     := Tfrm_pdiag.create(self);


 If frm_treecusto.Wimptxt then           //exporta emf
    begin
     WNome := frm_treecusto.WDirImp + WDiag_id;
     Wpos :=  pos('.',WNome) ;
     If Wpos = 0 then
       WNome := WNome+ '.emf'
     else
      WNome := copy(WNome,1,Wpos-1)+ '.emf';
      Wgrid := tv.diagrama.Showgrid;
      tv.diagrama.Showgrid := false;
      tv.diagrama.saveImage(0,1,WNome);
      tv.diagrama.ShowGrid := WGrid;
    end
 else
    begin
       frm_pdiag.pr_cli.caption  := Wcli_nome;
       frm_pdiag.pr_proj.caption := Wprj_titulo;
       frm_pdiag.Ldesc.caption   := WNome_Nivel;
       Wpic := tv.diagrama.ExportPicture(0,false,false)  ;
       tv.diagrama.saveImage(0,1,frm_main.lastDir+'img.emf');
       frm_pdiag.pdiag.Picture.LoadfromFile(frm_main.lastDir+'img.emf');
       frm_pdiag.qrp.print;
       tv.diagrama.Showgrid := WShowgridAnt;
    end;

 frm_pdiag.close;
 end;




procedure Tfrm_treeCusto.Excluir1Click(Sender: TObject);
var
Wnode,Wparent : TTreeNode;
 begin

   Wnode        := tv.selected;
   Wparent      :=  tv.selected.Parent;

   If Wnode.Level = 1 then   // cenario
      begin
       If MessageDlg(mens16,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                         exit;
       If empresas = nil then
          empresas := Tempresa.create(self);
       empresas.CLI_ID := udado(Wnode.Data)^.fcli;
       empresas.cenarios.CLI_ID := udado(Wnode.Data)^.fcli;
       empresas.cenarios.PRJ_ID := udado(Wnode.Data)^.FProj;
       empresas.cenarios.Apagar;

      end
   else
   If Wnode.Level = 0 then   // cliente
      begin
       If MessageDlg(mens15,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                         exit;
       If empresas = nil then
          empresas := Tempresa.create(self);
       empresas.CLI_ID := udado(Wnode.Data)^.fcli;
       empresas.cenarios.CLI_ID := udado(Wnode.Data)^.fcli;
       empresas.cenarios.PRJ_ID := udado(Wnode.Data)^.FProj;
       empresas.Apagar(udado(Wnode.Data)^.fcli);
      end
   else
      begin
        If MessageDlg(mens40,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                         exit;
        tv.excluir_no(Wparent,Wnode,frm_treecusto);
      end;


   tv.items.Delete(Wnode);
   tv.selected  := WParent;
   If Wparent = nil then   //topitem
      exit;
  // If Wparent.level > 1 then
      tv.TvClick(tv.Selected);
 end;



procedure Tfrm_treeCusto.Expandir(Sender: TObject);
begin
  TV.selected.Expand(true);
end;

procedure Tfrm_treeCusto.tvNovoCli(Sender: TObject);  //nova empresas
begin
 If frm_clifull          = nil then
     frm_clifull            := Tfrm_clifull.create(self);
 frm_clifull.sp_novo.visible := false;
 frm_clifull.sp_del.visible  := false;
 frm_clifull.SpeedButton1.visible := false;
 If empresas = nil then
    Empresas       := Tempresa.create(self);

 If (sender as Tobject) is TmenuItem then
    begin
     If TMenuItem(sender as Tobject).Tag = 1 then  // cliquou editar
        begin
          empresaS.CLI_ID := udado(tv.selected .data)^.Fcli;
          empresas.Status := 'M';
        end
     else
        frm_clifull.sp_novo.Click;
    end;

 frm_clifull.showModal;
 empresas.status := ' ';
end;

procedure Tfrm_treeCusto.Abre_cenario(Sender: TObject);
begin

 If frm_cenario          = nil then
     frm_cenario           := Tfrm_cenario.create(self);
 frm_cenario.activeControl := frm_cenario.edit2;
 frm_cenario.sp_novo.visible := false;
 frm_cenario.pan_cli.visible := false;
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
 frm_cenario.showModal;
 scenario.status := ' ';
end;

procedure Tfrm_treeCusto.Abre_Diag(Sender: TObject);
VAR
 a: string;
begin

 If Empresas = nil then
    empresas := Tempresa.create(self);

 empresas.cenarios.Diagramas.CLI_ID    := udado(tv.selected.data)^.Fcli;
 empresas.cenarios.Diagramas.PRJ_ID    := udado(tv.selected.data)^.FProj;

 empresas.cenarios.Diagramas.IDG_NIVEL := tv.selected.level;
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
         empresas.cenarios.Diagramas.Status := 'I';
       end;
    end;

 If frm_diag = nil then
    frm_diag  := Tfrm_diag.create(self);
 frm_diag.activeControl   := frm_diag.edit2;
 frm_diag.showModal;
 tv.TvClick(frm_treecusto);
end;




procedure Tfrm_treeCusto.encolher(Sender: TObject);
begin
  TV.selected.Collapse(true);
end;



procedure Tfrm_treeCusto.SpeedButton14Click(Sender: TObject);
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

procedure Tfrm_treeCusto.SpeedButton17Click(Sender: TObject);
begin
  tv.diagrama.salvar;
end;

procedure Tfrm_treeCusto.SpeedButton15Click(Sender: TObject);
begin
  with tv.diagrama do
   begin
      acima;
   end;
end;

procedure Tfrm_treeCusto.sp2Click(Sender: TObject);

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



procedure Tfrm_treeCusto.SpeedButton18Click(Sender: TObject);
begin
  tv.diagrama.selectAction := afNoSelection;
  tv.diagrama.shape := TSpeedButton(sender as Tobject).tag;
  WNome_Ju          := Uppercase(TSpeedButton(sender as Tobject).Name);
end;

procedure Tfrm_treeCusto.SpeedButton27Click(Sender: TObject);
begin
  with tv.diagrama do
   begin
      selectAction := afNoSelection;
      linkstyle := TSpeedButton(sender as Tobject).tag;
      If uppercase(TSpeedButton(sender as Tobject).name) = 'SP1' then
        begin
          bt_inf := 1;
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
        end ;
   end;

end;

procedure Tfrm_treeCusto.Lista1Click(Sender: TObject);
var
wdst,iRn,WOrg ,i,j,wNodeSelected: integer;
sqlant,wclass : string;
WNodeExcl : TTreeNode;
iTab : Tdados_tab;
iup,iDown  : afNode;
begin

end;


procedure Tfrm_treeCusto.recria_corr(pNode : afNode);
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

 procedure Tfrm_treeCusto.recria_corrRel(pdg : afLink);
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


procedure Tfrm_treeCusto.Abrir2Click(Sender: TObject);
begin
  tv.Diagrama.Abre_Objeto;
end;

procedure Tfrm_treeCusto.Atrs1Click(Sender: TObject);
var
wbs,wator : afNode;
begin

  tv.Diagrama.SelectedNode.Zorder := 1;
end;

procedure Tfrm_treeCusto.Frente1Click(Sender: TObject);
var
wbs,wator : afNode;
begin
  { If  tv.Diagrama.SelectedNode.Shape in[11,50,79,62] then
   Begin
     wbs   := tv.Diagrama.Obtem_wbs(tv.Diagrama.SelectedNode);
     wator := tv.Diagrama.Obtem_ator(tv.Diagrama.SelectedNode);
     If wbs <> nil then
       wbs.ZOrder := 0;
     If wAtor <> nil then
       wAtor.ZOrder := 0;
   end;  }


 tv.Diagrama.SelectedNode.Zorder := 0;
end;

procedure Tfrm_treeCusto.IncluiImagem1Click(Sender: TObject);
begin
  tv.Diagrama.Insere_imagem(sender);
end;

procedure Tfrm_treeCusto.AjustaImagemaEntidade1Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(true);
end;

procedure Tfrm_treeCusto.frm_dgAjustaEntidadeaImagem1Click(Sender: TObject);
begin
 tv.Diagrama.Ajusta_Imagem(false);
end;

procedure Tfrm_treeCusto.SpeedButton35Click(Sender: TObject);
begin
  tv.Diagrama.selectAction := afNoSelection;
  tv.Diagrama.Shape        := TSpeedButton(sender as Tobject).tag;
  WNome_Ju                 := Uppercase(TSpeedButton(sender as Tobject).Name);
end;

procedure Tfrm_treeCusto.SpeedButton37Click(Sender: TObject);
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

procedure Tfrm_treeCusto.Lista2Click(Sender: TObject);
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

procedure Tfrm_treeCusto.SpeedButton4Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(4);
end;

procedure Tfrm_treeCusto.SpeedButton5Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(1);
end;

procedure Tfrm_treeCusto.SpeedButton3Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(2);
end;

procedure Tfrm_treeCusto.spyClick(Sender: TObject);
begin
 tv.Diagrama.Alinha(3);
end;

procedure Tfrm_treeCusto.SpeedButton42Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(8);
end;

procedure Tfrm_treeCusto.SpeedButton49Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(9);
end;

procedure Tfrm_treeCusto.SpeedButton6Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(6);
end;

procedure Tfrm_treeCusto.SpeedButton2Click(Sender: TObject);
begin
  tv.Diagrama.Alinha(5);
end;

procedure Tfrm_treeCusto.SpeedButton8Click(Sender: TObject);
begin
 tv.Diagrama.Alinha(5);
 tv.Diagrama.Alinha(6);
end;

procedure Tfrm_treeCusto.spb_normalClick(Sender: TObject);
begin
  tv.Diagrama.xzoom := 100;
  tv.Diagrama.yzoom := 100;
end;

procedure Tfrm_treeCusto.spb_ajusteClick(Sender: TObject);
begin
  tv.Diagrama.xzoom := 0;
  tv.Diagrama.yzoom := 0;
end;

procedure Tfrm_treeCusto.SpeedButton13Click(Sender: TObject);
begin
  with tv.Diagrama do
   begin
    xZoom := xzoom - 10;
    yzoom := xzoom;
   end;
end;

procedure Tfrm_treeCusto.SpeedButton1Click(Sender: TObject);
begin
   with tv.Diagrama do
   begin
    xZoom := xzoom + 10;
    yzoom := xzoom;
   end;
end;

procedure Tfrm_treeCusto.getdst1Click(Sender: TObject);

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

procedure Tfrm_treeCusto.SpeedButton43Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := afSelectItems;
end;

procedure Tfrm_treeCusto.SpeedButton20Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := 2;
end;

procedure Tfrm_treeCusto.Delete1Click(Sender: TObject);
begin
  tv.Diagrama.SelectedNode.picture := nil;
end;

procedure Tfrm_treeCusto.Propriedades1Click(Sender: TObject);
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
      wfont := tv.Diagrama.selNodes.Item(1).font;
      SetOleFont(fnt.font,Wfont);

      Wi := tv.Diagrama.selNodes.Item(1).DrawWidth  ;
      rg_espessura.Itemindex := Wi ;
      showmodal;
   end;


end;

procedure Tfrm_treeCusto.SpeedButton84Click(Sender: TObject);
begin
  If frm_cfg = nil then
     frm_cfg := tfrm_cfg.create(self);
    
  frm_cfg.showmodal;
end;

procedure Tfrm_treeCusto.Propriedades2Click(Sender: TObject);  // objetos a partir do diagrama
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
      //edit1.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowOrg);
      edit2.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowMid);
      //edit3.text                := inttostr(tv.diagrama.SelLinks.item(1).ArrowDst);
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

procedure Tfrm_treeCusto.SetOrigem_dados(const Value: integer);
begin
  FOrigem_dados := Value;
end;

procedure Tfrm_treeCusto.MenuItem9Click(Sender: TObject);
begin
  tv.Diagrama.SelectedNode.picture := nil;
end;

procedure Tfrm_treeCusto.AjustaImagemaEntidade2Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(true);
end;

procedure Tfrm_treeCusto.AjustaEntidadeaImagem2Click(Sender: TObject);
begin
  tv.Diagrama.Ajusta_Imagem(false);
end;

procedure Tfrm_treeCusto.MenuItem8Click(Sender: TObject);
begin
  tv.Diagrama.Insere_imagem(sender);
end;

procedure Tfrm_treeCusto.MenuItem10Click(Sender: TObject);
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

procedure Tfrm_treeCusto.SpeedButton11Click(Sender: TObject);
begin
 { If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;}
 If frm_pprint= nil then
    frm_pprint     := Tfrm_pprint.create(self);
 
  frm_pprint.showmodal;
end;

procedure Tfrm_treeCusto.SetWimpTxt(const Value: boolean);
begin
  FWimpTxt := Value;
end;


procedure Tfrm_treeCusto.SetWDirImp(const Value: string);
begin
  FWDirImp := Value;
end;

procedure Tfrm_treeCusto.SetExportDir(const Value: string);
begin
  FExportDir := Value;
end;

procedure Tfrm_treeCusto.SetTI(const Value: integer);
begin
  FTI := Value;
end;





procedure Tfrm_treeCusto.Executar1Click(Sender: TObject);
var
iTab : Tdados_tab;
s :string;
wprg : string;
wdir,wexec : string;
begin


end;

procedure Tfrm_treeCusto.SpeedButton68Click(Sender: TObject);
begin
  tv.Diagrama.SelectAction := afSelectItems;
end;

procedure Tfrm_treeCusto.SelecionarTudo1Click(Sender: TObject);
begin
  tv.Diagrama.SelectAll;
             { TODO : acresc 26/11/04 -> versào 36 }
  tv.Diagrama.WClick(nil);
end;



procedure Tfrm_treeCusto.Grid1Click(Sender: TObject);
begin

  If frm_grid = nil then
     frm_grid := tfrm_Grid.create(self);
  frm_grid.Diagrama := TDg.Create;   
  frm_grid.Diagrama := tv.diagrama;
  frm_grid.showModal;
end;



procedure Tfrm_treeCusto.Setdir_db(const Value: string);
begin
  Fdir_db := Value;
end;

procedure Tfrm_treeCusto.SetTipo_banco(const Value: integer);
begin
  FTipo_banco := Value;
end;

procedure Tfrm_treeCusto.SetDiretorio(const Value: string);
begin
  FDiretorio := Value;
end;

procedure Tfrm_treeCusto.SetNome_banco(const Value: string);
begin
  FNome_banco := Value;
end;




function Tfrm_treeCusto.gera_Modelo(pbanco : integer) : boolean;
 Begin
   cria_oe(nil);
 end;

function Tfrm_treeCusto.Cria_OE(pNode : afNode) : boolean;
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


procedure Tfrm_treeCusto.Setidbado(const Value: TAdoConnection);
begin
  Fidbado := Value;
end;

procedure Tfrm_treeCusto.Setschema(const Value: string);
begin
  Fschema := Value;
end;

procedure Tfrm_treeCusto.SetDir_canc(const Value: boolean);
begin
  FDir_canc := Value;
end;

procedure Tfrm_treeCusto.SetServidor(const Value: string);
begin
  FServidor := Value;
end;





function Tfrm_treeCusto.Juncao_Percentual(pDiag : Tdg;pJunc,pAtiv : afnode) : real;
var
i,j ,wper,wid: integer;
mList,mSeg : uLst;
oList,oSeguinte : TList;
mens : string;
oObj : afNode;
begin


end;



procedure Tfrm_treeCusto.SpeedButton80Click(Sender: TObject);
begin
  spl.left := 180;
end;

procedure Tfrm_treeCusto.Estmulo1Click(Sender: TObject);
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

procedure Tfrm_treeCusto.sppClick(Sender: TObject);
begin
  tv.Diagrama.atualiza_entity;
end;

procedure Tfrm_treeCusto.AtualizarasDescriesdosObjetos1Click(
  Sender: TObject);
begin
  tv.Diagrama.Atualiza_entity;
end;

procedure Tfrm_treeCusto.RegistrarAspectoCrticomelhoria1Click(
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

procedure Tfrm_treeCusto.RegistrarAspectosCrticosmelhorias1Click(
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



procedure Tfrm_treeCusto.SetWnoAtu(const Value: TTreeNode);
begin
  FWnoAtu := Value;
end;

procedure Tfrm_treeCusto.AspectosCrticos1Click(Sender: TObject);
var
iTab : Tdados_tab;
existe : boolean;
begin


end;

procedure Tfrm_treeCusto.SpeedButton76Click(Sender: TObject);
begin
     { TODO -c6-000-24 : Corrigido tipo de Link - DMI }
  tv.Diagrama.LinkStyle := TSpeedButton(sender as Tobject).tag;
end;

procedure Tfrm_treeCusto.MostratArvore1Click(Sender: TObject);
begin
  spl.left := 180;
  spl.repaint;
end;


procedure Tfrm_treeCusto.Decompor1Click(Sender: TObject);
begin
  SpeedButton14Click(nil);
end;

procedure Tfrm_treeCusto.Nivelacima1Click(Sender: TObject);
begin
  SpeedButton15Click(nil);
end;

procedure Tfrm_treeCusto.FormShow(Sender: TObject);
begin
  inherited;
  frm_treecusto.width  := width+ 200;
 pan_temp.height := 43;
// pan_temp.height := 0;
 If tv = nil then
    tv  := TTv.create;

 frm_treecusto.InsertControl(tv);
 {insertControl(tv.Diagrama);
 If not tv.Diagrama.Carga_Atrib then
    raise exception.create(mens8);tv.selected    := tv.TopItem;}
 tv.NodeAnterior:= tv.Selected;
 tv.align       := alLeft;
 tv.width       := 250;
 frm_treecusto.spl.Align := alLeft;
 frm_treecusto.top       := 60;
 tv.PopupMenu := frm_treecusto.pop;
 frm_treecusto.ActiveControl := tv;
 tv.Constraints.MinWidth := 2;
 tv.Mostra;
 fromDim := false;
 If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
   Begin
     popupMenu := nil;
   end
 else
  Begin
    popupMenu := pop ;
  end;

end;

procedure Tfrm_treeCusto.ImprimirObjeto1Click(Sender: TObject);
var
ide : Tdad;
iOn : Tdados_tab;
i : integer;
begin


end;




procedure Tfrm_treeCusto.SetBANCO_ATU(const Value: string);
begin
  FBANCO_ATU := Value;
end;

procedure Tfrm_treeCusto.SetSERVIDOR_ATU(const Value: STRING);
begin
  FSERVIDOR_ATU := Value;
end;

procedure Tfrm_treeCusto.Setwuserdata(const Value: integer);
begin
  Fwuserdata := Value;
end;

procedure Tfrm_treeCusto.AjustaLinha1Click(Sender: TObject);
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

procedure Tfrm_treeCusto.Setdmi_desc(const Value: string);
begin
  Fdmi_desc := Value;
end;

procedure Tfrm_treeCusto.sp_prClick(Sender: TObject);
begin
   If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;
end;

procedure Tfrm_treeCusto.sp_copClick(Sender: TObject);
var
i,j : integer;
aWbs,aAtor : afNode;
begin
  tv.Diagrama.Copia_Sel;
end;

procedure Tfrm_treeCusto.xp_colClick(Sender: TObject);
var
i,j ,tot: integer;
awbs,aAtor : afNode;
begin
   tv.Diagrama.Cola_sel(true,true,false,0);
end;

procedure Tfrm_treeCusto.SetDiagm(const Value: Tdg);
begin
  FDiagm := Value;
end;


procedure Tfrm_treeCusto.SetPERC(const Value: real);
begin
  FPERC := Value;
end;

procedure Tfrm_treeCusto.Get_objetosGraf(pDiag: Tdg; pNode: afNode);
begin

end;

procedure Tfrm_treeCusto.SpeedButton10Click(Sender: TObject);
begin
  
  tv.Diagrama.consiste_dg(TV.Diagrama.EMPRESA,TV.Diagrama.CENARIO,udado(tv.Selected.Data)^.FDiag);
end;



procedure Tfrm_treeCusto.SetLISTA_DG(const Value: BOOLEAN);
begin
  FLISTA_DG := Value;
end;

procedure Tfrm_treeCusto.FormCreate(Sender: TObject);
begin
  Custos_erros := TStringList.create;
end;

procedure Tfrm_treeCusto.CalcularCustos1Click(Sender: TObject);
var
iAp : Tdados_tab;
begin
  frm_treeCusto.cursor := crno;
  pan_stat.Visible := true;
  sp_abre.Visible := false;
  sp_calc.Visible := false;
  sp_custos.Visible := false;
  sp_concluido.Visible := false;
  pan_stat.Repaint;
 { pan_dg.Visible := false;
  pan_calc.Visible := false;
  pan_show.Visible := false;

  
  pan_dg.Visible := true;
  pan_dg.Repaint; }
  sp_abre.Visible := true;
  sp_abre.Repaint;
  tv.Diagrama.Abre_diagrama(tv.selected) ;
 // pan_calc.Visible := true;
 // pan_calc.Repaint;
  sp_calc.Visible := true;
  sp_calc.Repaint;
  Calcular_Custos (tv.Diagrama);
//pan_show.Visible := true;
 // pan_show.Repaint;
  sp_custos.Visible := true;
  sp_custos.Repaint;
  Mostrar_Custos(tv.Diagrama);
  //pan_end.Visible := true;
 // pan_end.Repaint;
  sp_concluido.Visible := true;
  sp_concluido.Repaint;
  cursor := crDefault;
end;

procedure Tfrm_treeCusto.Mostrar_Custos(pDg : Tdg);
var
iAp : Tdados_tab;
oList : Tlist;
begin
  tv.Diagrama.Abre_diagrama(tv.selected) ;
  iAp :=  TDados_tab.create(self);
  oList := tv.Diagrama.Get_Atividades;
  If oList.Count = 0 then
   Raise exception.create(Mens68);
  iAp.get_ListaAp(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,oList);

  dbgrid1.DataSource := iAp.DataExt;
  dbg_format(dbgrid1);
  edit2.Text := '';
  edit11.Text := '';
  edit12.Text := '';
  If iap.fClient.Aggregates[0].Value > 0 then
    edit2.text := floattostrf(iap.fClient.Aggregates[0].Value,ffnumber,12,2);
  If iap.fClient.Aggregates[1].Value > 0 then
    edit11.text := floattostrf(iap.fClient.Aggregates[1].Value,ffnumber,12,2);
  If iap.fClient.Aggregates[2].Value > 0 then
    edit12.text := floattostrf(iap.fClient.Aggregates[2].Value,ffnumber,12,2);
  If iap.fClient.Aggregates[3].Value > 0 then
    edit13.text := floattostrf(iap.fClient.Aggregates[3].Value,ffnumber,12,2);
end;

procedure Tfrm_treeCusto.Calcular_Custos(pDg : Tdg);
var
  i,j : integer;
  mList,mSeg : uLst;
  oIniciais : TList ;
  tot : real;
 Begin
   If not frm_main.Consiste_Tudo(pdg.EMPRESA,pdg.CENARIO) then
    Raise exception.create(mens72);
   tot := 0;

   //If form3     = nil then
   //   form3     := Tform3.create(self);
  // form3.Memo1.Clear;

   pDg.CustoMo := 0   ;
   pdg.CustoTec:= 0;
   pdg.CustoGeral:= 0;
   pDg.custAntes := 0;
   pDg.CustoAntesMp := 0;
   pDg.PercAcum := 1;
   oIniciais    := pdg.Get_Atividadesiniciais;
   wj := 0;
   for i := 0 to oIniciais.Count -1 do
    Begin
       mList := oIniciais.Items[i];
        Begin    //calcula custos dos processos externos iniciais
          for j := 1 to mList^.dstNode.InLinks.Count do
           Begin
            If mList^.dstNode.InLinks.Item(j).Org.shape = 54 then
              Begin
               pdg.percacum := 100;
               //pdg.Trata_node(pdg.EMPRESA,pdg.CENARIO,mList^.dstNode.InLinks.Item(j).org,0,0,0,0,0,0,pdg,true);   Conflito com o AddFlow3 Voltar depois LCK
              end;
           end;
          pdg.percacum := 100;
          //pdg.Trata_node(pdg.EMPRESA,pdg.CENARIO,mList^.dstnode,0,0,0,0,0,0,pdg,false);   Conflito com o AddFlow3 Voltar depois LCK
        end;

    end;
 //   form3.Memo1.Lines.add('     Total : '+floattostr(pdg.customo));
 //   form3.showmodal;


 end;

procedure Tfrm_treeCusto.MostrarCustos1Click(Sender: TObject);
begin
  Mostrar_Custos (tv.Diagrama);
end;

end.






