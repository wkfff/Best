unit bst_cs;

{ acrescentar : - opção de escolha dos campos a serem listados (lb)



}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, Menus, ImgList, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, Buttons, ToolWin, Mask, ExtCtrls,bst_objetos,bstdb, AddFlow3Lib_TLB,
  dbtables, db, strUtils, cls_obj, cls_codigo, fonctions, ADODB,bst_ger, ActnList;

type
  Tfrm_cs = class(Tfrm_obj)
    DBEdit2: TDBEdit;
    Label1: TLabel;
    tab_atributos: TTabSheet;
    tab_metodos: TTabSheet;
    DBG_ATRIB: TDBGrid;
    dbg_met: TDBGrid;
    SpeedButton8: TSpeedButton;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    rg_style: TDBRadioGroup;
    RD_MVIS: TDBRadioGroup;
    RD_MTIPO: TDBRadioGroup;
    RD_TIM: TDBRadioGroup;
    RD_BIN: TDBRadioGroup;
    RD_DIR: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    CMB_ANCESTOR: TDBLookupComboBox;
    DBG_PARM: TDBGrid;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    Tab_objeto: TTabSheet;
    SpeedButton2: TSpeedButton;
    prg_unit: TMemo;
    sp_crude: TSpeedButton;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    sp_atrib: TSpeedButton;
    Memo1: TMemo;
    OO_unit: TMemo;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    sp_veroo: TSpeedButton;
    sp_verdd: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    g_master: TGroupBox;
    sp_ger: TSpeedButton;
    Label8: TLabel;
    Edit4: TEdit;
    rg: TRadioGroup;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo2: TMemo;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit5: TEdit;
    Label15: TLabel;
    Edit6: TEdit;
    Label16: TLabel;
    Edit7: TEdit;
    Label17: TLabel;
    rg_vis: TRadioGroup;
    rd_tipo: TRadioGroup;
    e_nomeLista: TEdit;
    Label18: TLabel;
    spmet: TSpeedButton;
    BT1: TSpeedButton;
    DBEdit8: TDBEdit;
    spb_ger: TSpeedButton;
    spp: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sListaClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure dbg_metCellClick(Column: TColumn);
    procedure DBG_PARMCellClick(Column: TColumn);
    procedure dbg_metEnter(Sender: TObject);
    procedure DBG_PARMEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure sp_atribClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
   // procedure sp_crudeClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sp_verddClick(Sender: TObject);
    procedure sp_verooClick(Sender: TObject);
    procedure rgClick(Sender: TObject);
    procedure DBG_ATRIBCellClick(Column: TColumn);
    procedure rg_visClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure spmetClick(Sender: TObject);
    procedure BT1Click(Sender: TObject);
    procedure spb_geracaoClick(Sender: TObject);
    procedure spb_gerClick(Sender: TObject);
    procedure sppClick(Sender: TObject);
  private
    Fidados: TIdf_cs;
    FiProp: TIdf_Py;
    FiAncestor: TIdf_cs;
    Fiparm: TIDF_pr;
    FObjDir: string;
    FObj: string;
    FObjName: string;
    Fidad: Tdad;
    FNOMECLASSE: STRING;
    FNOME_DFM: STRING;
    FNOME_UNIT: STRING;
    Fform_name: string;
    FPROGDIR: STRING;
    FwList: TStringList;
    FwText: TStringList;
    FNOMEOO: string;
    FObjNameOO: string;
    FiDesign: OODesign;
    procedure Setidados(const Value: TIdf_cs);
    procedure SetiProp(const Value: TIdf_Py);
    procedure SetiAncestor(const Value: TIdf_cs);
    procedure Setiparm(const Value: TIDF_pr);
    function Deleta_Classe(pClasse : string; pUNit : TMemo ) : Tmemo;
  //  function Gerar_Classe: boolean;
    function Preparar_Geracao: boolean;
  //  function Recriar_Crude(pClasse : string;pUnit : Tmemo) : Tmemo;
    procedure SetObjDir(const Value: string);
    procedure SetObj(const Value: string);
    procedure SetObjName(const Value: string);
    procedure Setidad(const Value: Tdad);
    procedure Delete_class(pObjeto,pFuncao : string);
    procedure Deleta_Funcao(pObjeto: string);
    function Importa_property(pCli,pProj,pClasse : integer;pTabela : string) : boolean;
    procedure Get_prop(pClasse : integer);
    procedure SetNOMECLASSE(const Value: STRING);
    function Carrega_cpo_Confirma(pList: TstringList): TstringList;
    function Carrega_edit(pTab, pTipo: string): boolean;
    function Cria_Confirma(pClass, pObj: string): boolean;
    function Cria_Consiste: boolean;
    function Cria_Create: boolean;
    function Cria_DataClose(pPref: string): boolean;
    function Cria_DBGrid1Click: boolean;
    function Cria_Edit(pPreflab, pprefdate: string): boolean;
    function Cria_Limpa(pFunc: string): boolean;
    function Cria_MostraCampos(pClass, pObj: string): boolean;
    function Cria_MostraCamposDet(pClass, pObj: string): boolean;
    function Cria_Property(MasterDet: boolean): boolean;
    function Cria_Show: boolean;
    function CriaParmMetodo: string;
    procedure Gera_tela(pnom: string);
    function Insert_code(pLinhaFim: integer; pText,
      pCode: TstringList): TStringList;
    procedure Setform_name(const Value: string);
    procedure SetNOME_DFM(const Value: STRING);
    procedure SetNOME_UNIT(const Value: STRING);
    function Altera_use: boolean;
    procedure SetPROGDIR(const Value: STRING);
    procedure SetwList(const Value: TStringList);
    procedure SetwText(const Value: TStringList);
    function Editavel(pIndex: integer): boolean;
    function Gerar_ClasseOO: boolean;
    procedure SetNOMEOO(const Value: string);
    procedure SetObjNameOO(const Value: string);
    function Cria_LBclick(pClass,pObj : string): boolean;
    function Cria_MostraObjeto(pClass, pObj: string): boolean;
    function Cria_Close: boolean;
    procedure ddmap_atrib(dataset: Tdataset);
    procedure ddmap_atu(pde, ppara: TIdf_py);
    procedure salvar;
    function Monta_dominio(pDom: TstringList;pNome : string): boolean;
    procedure SetiDesign(const Value: OODesign);

    { Private declarations }
  public
    { Public declarations }
  published
   property iDesign : OODesign read FiDesign write SetiDesign;
   property ObjName : string read FObjName write SetObjName;
   property ObjNameOO : string read FObjNameOO write SetObjNameOO;
   property ObjDir : string read FObjDir write SetObjDir;
   property Objeto : string read FObj write SetObj;
   property idados : TIdf_cs read Fidados write Setidados;
   property iProp  : TIdf_Py read FiProp write SetiProp;
   property iAncestor : TIdf_cs read FiAncestor write SetiAncestor;
   property iparm : TIDF_pr read Fiparm write Setiparm;
   property idad : Tdad read Fidad write Setidad;
   property NOMECLASSE : STRING read FNOMECLASSE write SetNOMECLASSE;
   property NOMEOO : string read FNOMEOO write SetNOMEOO;
   property form_name : string  read Fform_name write Setform_name;
   property NOME_UNIT : STRING read FNOME_UNIT write SetNOME_UNIT;
   PROPERTY NOME_DFM : STRING read FNOME_DFM write SetNOME_DFM;
   property PROGDIR  : STRING read FPROGDIR write SetPROGDIR; // diretório do programa (BEST)
   property wList : TStringList read FwList write SetwList;
   property wText : TStringList read FwText write SetwText;
   procedure LoadConstantObj;override;
 end;

 { Marcador de Blocos}
 // const WMarc: array[1..6] of sTRING = ('{Início Classe ', '{Fim Classe ', '{Início Métodos ','{Fim Métodos ','{Início Set Values ','{Fim Set Values ');


var
  frm_cs: Tfrm_cs;
  wInserttext : TstringList;
implementation

uses bst_main, bst_treeAtiv, bst_if, BST_PROP, BST_METOD, bst_dir4;


{$R *.dfm}

procedure Tfrm_cs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   frm_cs := nil;
   action := caFree;
end;

procedure Tfrm_cs.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_cs.FormShow(Sender: TObject);
begin
  inherited;
  Tab_objeto.TabVisible := FALSE;
 // rD_tipo.DataSource := idados.ATRIBUTOS.DataExt;
 // rd_tipo.DataField  := 'PROP_TIPO';
 sp2.enabled := true;


  rD_mvis.DataSource := idados.METODOS.DataExt;
  rd_mvis.DataField  := 'MET_VISIBIL';

  rD_Mtipo.DataSource := idados.METODOS.DataExt;
  rd_Mtipo.DataField  := 'IDF_TIPO';

  rD_tim.DataSource := idados.METODOS.DataExt;
  rd_tim.DataField  := 'IDF_METTYPE';

  rD_BIN.DataSource := idados.METODOS.DataExt;
  rd_BIN.DataField  := 'IDF_METBIND';

  rD_DIR.DataSource := idados.METODOS.DataExt;
  rd_DIR.DataField  := 'IDF_METDIRECT';

  caption := 'Classe';

  iAncestor.get_AllBut(dbedit2.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger);
  dbmemo1.DataSource     := iParm.dataext;
  dbmemo1.DataField      := 'PR_DESCRICAO';

  dbmemo2.DataSource     := idados.METODOS.DataExt;
  dbmemo2.DataField      := 'IDF_OBJETIVO';


  
end;

procedure Tfrm_cs.pgcpChange(Sender: TObject);
var
oProp : TIdf_py;
begin
  //inherited;

  dbg_met.DataSource := nil;
  If pgcp.ActivePage = Tab_atributos then
    Begin
        rg_vis.Items.Clear;
        rd_tipo.Items.Clear;
        If NOMECLASSE <> '' then
         begin
          sp_atrib.Enabled     := true;
          SpeedButton1.Enabled := false;
         end
        else
         begin
          sp_atrib.Enabled     := false;
          SpeedButton1.Enabled := true;
         end;

        with Tdominios.create(self) do
           begin
            try
              begin
                Open_Dominio('PRP',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rg_vis.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
                 Open_Dominio('FMT',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_tipo.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;

               end;
            finally
              free;
            end;
            end;
        sp2.Enabled := true;
         with iDados do
           begin
              try
                atributos.CLI_ID := cliente;
                atributos.PRJ_ID := Cenario;
                atributos.CLASS_ID := ID;

                If dbedit2.Text = '' then
                 exit;
                 dbg_atrib.DataSource    := atributos.dataext;
                 atributos.Get_AtributosdaClasse(CLIENTE,CENARIO,ID);
                 sp_atrib.Enabled     := true;
                 SpeedButton1.Enabled := false;
                 If not atributos.fClient.Eof then
                  begin
                    sp_atrib.Enabled     := false;
                    SpeedButton1.Enabled := true;
                    DBG_ATRIB.DataSource.DataSet.First;
                    DBG_ATRIBCellClick(nil);
                  end;
              finally
                dbg_dg.cursor     := crDefault  ;
              end;
           end;
     caption := def22 +' - '+ idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').asstring;

    end
  else
  If pgcp.ActivePage = Tab_metodos then     //métodos
    Begin
         rd_mvis.Items.Clear;
         rd_mtipo.Items.Clear;
         rd_tim.Items.Clear;
         rd_bin.Items.clear;
         rd_dir.Items.Clear;

         with Tdominios.create(self) do
           begin
            try
              begin
                Open_Dominio('PRP',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_mvis.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
                 Open_Dominio('FMT',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_mtipo.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
                 Open_Dominio('TIM',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_TIM.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
                  Open_Dominio('BIN',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_BIN.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
                  Open_Dominio('DIR',frm_main.Idioma) ;
                  while not eof do
                   begin
                     rd_DIR.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
               end;
            finally
              free;
            end;
            end;

         sp2.Enabled := true;
         with iDados do
           begin
              try
                metodos.CLI_ID   := cliente;
                metodos.PRJ_ID   := Cenario;
                metodos.CLASS_ID := ID;

                If dbedit2.Text = '' then
                 exit;
                 dbg_met.DataSource    := metodos.dataext;
                 metodos.Get_metodosdaClasse(CLIENTE,CENARIO,ID);
              finally
                dbg_dg.cursor     := crDefault  ;
              end;
           end;

     //mostra parámetros
     dbg_metCellClick(nil);
     caption := def22 +' - '+ idatasource.DataSet.fieldbyname('IDF_DESIGNACAO').asstring;


    end ;
end;



procedure Tfrm_cs.Setidados(const Value: TIdf_cs);
begin
  Fidados := Value;
end;

procedure Tfrm_cs.FormCreate(Sender: TObject);
begin
  inherited;
  iDesign := OOdesign.create;
  sp2.enabled := true;
  idados :=  TIdf_cs.create(self);
  iAncestor :=  TIdf_cs.create(self);
  iDad := TDad.create(self);
  iParm := TIdf_pr.create(self);
  wList := TStringList.create;
  wtext := TStringList.create;
  wInserttext := TstringList.create;
  tab_objeto.TabVisible := FALSE;
  with cmb_ancestor do

   Begin
    ListSource := iAncestor.DataExt;
    ListField := 'IDF_DESIGNACAO';
    kEYFIELD  := 'IDF_CODIGO';
    DataField := 'IDF_ANCESTOR';
   end;
  iProp  :=  TIdf_py.create(self);
   with Tdominios.create(self) do
           begin
            try
              begin
                Open_Dominio('CLS',frm_main.Idioma) ;
                  while not eof do
                   begin
                     RG_STYLE.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
                     next;
                   end;
               end;
            finally
              free;
            end;
            end;
  
end;

procedure Tfrm_cs.SetiProp(const Value: TIdf_Py);
begin
  FiProp := Value;
end;

procedure Tfrm_cs.sListaClick(Sender: TObject);
VAR
WTAbde : string;
begin
 // inherited;

begin
 with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
      // ListaDim := 'IDF_DE' ;
       ListaDim := 'IDF_DADOS' ;
       ListaTit := def26 ;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       Listafecha:= true;
       mostra_lista;

       If ListaCodigo = 0 then
          exit;

      with TIdf_py.create(self) do
       Begin
          CLI_ID := Cliente;
          PRJ_ID := cenario;
          IDF_CODIGO := ListaCodigo;
          IncluiObj(CLI_ID,PRJ_ID,IDF_CODIGO,ID,dbedit3.text) ;
          free;
       end;

       pgcpChange(self);
     end;
end;
end;

procedure Tfrm_cs.sp2Click(Sender: TObject);   //confirma
 begin
  inherited;
  Salvar;
  close;

 end;

procedure Tfrm_cs.salvar;   //confirma
var
wnode : afnode;
i : integer;
begin
  If dbedit2.Text = '' then
   raise exception.create( 'Informar a Classe');
  If dbedit3.Text = '' then
   raise exception.create( 'Informar a Tabela');
  //speedButton6Click(nil);//salva properties
  If (idados.METODOS.fClient.State = dsedit) or (idados.METODOS.fClient.State = dsinsert) then
     iDados.METODOS.fClient.Post;
  If (idados.ATRIBUTOS.fClient.State = dsedit) or (idados.ATRIBUTOS.fClient.State = dsinsert) then
     iDados.ATRIBUTOS.fClient.Post;
  If (iParm.fClient.State = dsedit) or (iParm.fClient.State = dsinsert) then
     iParm.fClient.Post;
  If frm_treeativ <> nil then
   Begin
    tv.Diagrama.Get_Title(tv.Diagrama.SelectedNode).Text := dbedit2.Text;
    wNode := tv.Diagrama.Get_attributes(tv.Diagrama.SelectedNode);
  //  If pgcp.ActivePage <> tab_atributos  then
     Begin
      with iDados do
           begin
              try
                atributos.CLI_ID := cliente;
                atributos.PRJ_ID := Cenario;
                atributos.CLASS_ID := ID;
                dbg_atrib.DataSource    := atributos.dataext;
                atributos.Get_AtributosdaClasse(CLIENTE,CENARIO,ID);
              finally
                dbg_dg.cursor     := crDefault  ;

              end;
           end;
           wnode.Text := '';
            while not idados.ATRIBUTOS.fClient.Eof DO
             Begin
              wnode.text := wnode.text + idados.ATRIBUTOS.fClient.fieldbyname('PROP_VISIBIL').ASSTRING+ ' '+
                            idados.ATRIBUTOS.fClient.fieldbyname('IDF_DESIGNACAO').ASSTRING+  #13;

              idados.ATRIBUTOS.fClient.Next;
             end;
     end;
    //else
    //If pgcp.ActivePage <> tab_metodos then
    Begin
      with iDados do

           begin
             wNode := tv.Diagrama.Get_Metodos(tv.Diagrama.SelectedNode);
              try
                metodos.CLI_ID := cliente;
                metodos.PRJ_ID := Cenario;
                metodos.CLASS_ID := ID;
                dbg_met.DataSource    := metodos.dataext;
                metodos.Get_metodosdaClasse(CLIENTE,CENARIO,ID);
              finally
                dbg_dg.cursor     := crDefault  ;

              end;
           end;
           wnode.Text := '';
            while not idados.metodos.fClient.Eof do
             Begin
              wnode.text := wnode.text + idados.metodos.fClient.fieldbyname('MET_VISIBIL').ASSTRING+' '+
                            idados.metodos.fClient.fieldbyname('IDF_DESIGNACAO').ASSTRING+  #13;

              idados.metodos.fClient.Next;
             end;
     end
   end;

end;

procedure Tfrm_cs.Excluir1Click(Sender: TObject);
begin
 // inherited;

end;

procedure Tfrm_cs.SetiAncestor(const Value: TIdf_cs);
begin
  FiAncestor := Value;
end;

procedure Tfrm_cs.Setiparm(const Value: TIDF_pr);
begin
  Fiparm := Value;
end;

procedure Tfrm_cs.dbg_metCellClick(Column: TColumn);
begin
 // inherited;
  rd_Mtipo.DataField  := '';
  rD_Mtipo.DataSource := idados.METODOS.DataExt;
  rd_Mtipo.DataField  := 'IDF_TIPO';
  RD_MVIS.Visible  := true;
  RD_TIM.Visible  := true;
  RD_BIN.Visible  := true;
  RD_DIR.Visible  := true;

   with iParm do
     begin
        try
          CLI_ID   := cliente;
          PRJ_ID   := Cenario;
          Get_DoMetodo(CLIENTE,CENARIO,dbg_met.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger);
          dbg_parm.DataSource    := iParm.dataext;
          CLI_ID     := cliente;
          PRJ_ID     := Cenario;
          IDF_METODO := dbg_met.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger
        finally
          dbg_dg.cursor     := crDefault  ;
        end;
     end;
end;

procedure Tfrm_cs.DBG_PARMCellClick(Column: TColumn);
begin
  inherited;
  rd_mtipo.DataField  := '';
  rD_Mtipo.DataSource := iParm.DataExt;
  rd_mtipo.DataField  := 'PR_TIPO';
  RD_MVIS.Visible  := false;
  RD_TIM.Visible  := false;
  RD_BIN.Visible  := false;
  RD_DIR.Visible  := false;
end;

procedure Tfrm_cs.dbg_metEnter(Sender: TObject);
begin
  inherited;
  rd_Mtipo.DataField  := '';
  rD_Mtipo.DataSource := idados.METODOS.DataExt;
  rd_Mtipo.DataField  := 'IDF_TIPO';
  RD_MVIS.Visible  := true;
  RD_TIM.Visible  := true;
  RD_BIN.Visible  := true;
  RD_DIR.Visible  := true;
end;

procedure Tfrm_cs.DBG_PARMEnter(Sender: TObject);
begin
  inherited;
  rd_mtipo.DataField  := '';
  rD_Mtipo.DataSource := iParm.DataExt;
  rd_mtipo.DataField  := 'PR_TIPO';
  RD_MVIS.Visible  := false;
  RD_TIM.Visible  := false;
  RD_BIN.Visible  := false;
  RD_DIR.Visible  := false;
end;

procedure Tfrm_cs.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Salvar;
  ObjDir     := dbedit7.Text;//(dbedit5.Text);
  ObjName    := dbedit5.Text;
  ObjNameOO  := dbedit4.Text;
  NOMECLASSE := 'T'+FirstUpper(Dbedit2.text);
  NOMEOO     := 'O'+FirstUpper(Dbedit2.text);
  Objeto     := NOMECLASSE;
  Preparar_geracao;
end;

function Tfrm_cs.Preparar_Geracao : boolean;   //prepara a geração do código

var
i,j : integer;
wmens : string;
wl : integer;
s : string;
begin
  inherited;
   If Dbedit7.text = '' then   //diretório
    raise exception.Create('Informar o Diretório do projeto');
   If RightSTR(Dbedit7.text,1) = '\' then
     begin
      Dbedit7.DataSource.DataSet.Edit;
      Dbedit7.Text := leftstr(Dbedit7.Text,length(Dbedit7.Text)-1);
     end;
   If not DirectoryExists(Dbedit7.text) then
     CreateDir(Dbedit7.Text);
   //copia arquivos
   If not FileExists(Dbedit7.Text+'\basetier.pas') then
      xCopyFile(ProgDir,Dbedit7.Text,'basetier.pas','basetier.pas');
   If not FileExists(Dbedit7.Text+'\db_tier.pas') then
      xCopyFile(ProgDir,Dbedit7.Text,'db_tier.pas','db_tier.pas');
   If not FileExists(Dbedit7.Text+'\cad_stand.pas') then
      xCopyFile(ProgDir,Dbedit7.Text,'cad_stand.pas','cad_stand.pas');
   If not FileExists(Dbedit7.Text+'\cad_stand.dfm') then
     xCopyFile(ProgDir,Dbedit7.Text,'cad_stand.dfm','cad_stand.dfm');
   If not FileExists(Dbedit7.Text+'\frm_primar.dfm') then
      xCopyFile(ProgDir,Dbedit7.Text,'frm_primar.dfm','frm_primar.dfm');
   If not FileExists(Dbedit7.Text+'\frm_primar.pas') then
     xCopyFile(ProgDir,Dbedit7.Text,'frm_primar.pas','frm_primar.pas');
   If not FileExists(Dbedit7.Text+'\pd_tier.pas') then
     xCopyFile(ProgDir,Dbedit7.Text,'pd_tier.pas','frm_prim.pas');
   If not FileExists(Dbedit7.Text+'\bst_basefrm.pas') then
     xCopyFile(ProgDir,Dbedit7.Text,'bst_basefrm.pas','bst_basefrm.pas');
   If not FileExists(Dbedit7.Text+'\bst_basefrm.dfm') then
     xCopyFile(ProgDir,Dbedit7.Text,'bst_basefrm.dfm','bst_basefrm.dfm');
   If Dbedit5.text = '' then
    raise exception.Create('Informar o nome da Camada de Dados');
   If ExtractFileext(Dbedit5.text) <> '' then
     begin
      i := pos('.',Dbedit5.Text);
      dbedit5.Text := leftstr(Dbedit5.Text,length(dbedit5.Text) - i);
     end;

   If Dbedit4.text = '' then
    raise exception.Create('Informar o nome da Camada de Objetos de Negócio');

   If ExtractFileext(Dbedit4.text) <> '' then
     begin
      i := pos('.',Dbedit4.Text);
      dbedit4.Text := LeftStr(Dbedit4.Text,length(dbedit4.Text) - i);
     end;

   ObjDir     := dbedit7.Text;
   ObjName    := dbedit5.Text;
   ObjNameOO  := dbedit4.Text;
   NOMECLASSE := 'T'+FirstUpper(Dbedit2.text);
   NOMEOO     := 'O'+FirstUpper(Dbedit2.text);
   Objeto     := NOMECLASSE;

  //Gera Data Tier
   prg_unit.Lines.Clear;

   If fileexists(ObjDir + '\'+Dbedit5.Text+'.pas') then
     begin
      wMens := AnsireplaceStr(Mens145,'&',ObjDir + '\'+Dbedit5.Text+'.pas');
      If MessageDlg(wmens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
        begin
          deletefile(ObjDir + '\'+Dbedit5.Text+'.pas') ;
          prg_unit.lines.LoadFromFile(ProgDir + '\bst_unit.pas') ;
        end
      else
         prg_unit.lines.LoadFromFile(ObjDir + '\'+dbedit5.text+'.pas')
     end ;

   // prg_unit.lines.saveToFile(ObjDir +'\'+ Dbedit5.Text+'.pas');
   { If Localiza_Objeto(prg_unit,NOMECLASSE,0) = -1 then
    begin
    If MessageDlg(def23+NOMECLASSE+ def24+#13+def25, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
       Begin
         prg_unit.lines.LoadFromFile(ProgDir + '\bst_unit.pas') ;
         Gerar_Classe;
       end;
    end;
    prg_unit.lines.saveToFile(ObjDir +'\'+ Dbedit5.Text+'.pas'); }

   //Objetos de negócio Tier
   oo_unit.Lines.Clear;

   If fileexists(ObjDir + '\'+Dbedit4.Text+'.pas') then
      begin
      wMens := AnsireplaceStr(Mens145,'&',ObjDir + '\'+Dbedit4.Text+'.pas');
      If MessageDlg(wmens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
        begin
          deletefile(ObjDir + '\'+Dbedit4.Text+'.pas') ;
          oo_unit.lines.LoadFromFile(ProgDir + '\pd_tier.pas') ;
        end
      else
        oo_unit.lines.LoadFromFile(ObjDir + '\'+dbedit4.text+'.pas')
      end ;


    If Localiza_Objeto(OO_unit,NOMEOO,0) = -1 then
    begin
       If MessageDlg(def23+NOMEOO+ def24+#13+def25, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
         Begin
         oo_unit.lines.LoadFromFile(ProgDir + '\pd_tier.pas') ;
         Gerar_ClasseOO;
       end; 
    end;
    oo_unit.lines.saveToFile(ObjDir +'\'+ dbedit4.text+'.pas');
end;

{function Tfrm_cs.Gerar_Classe : boolean;
var                             // gera os comandos sql para o CRUDE
wmem : Tmemo;
wcod : integer;
begin
  inherited;
  wmem := Tmemo.Create(self);
  wmem.Visible := false;
  self.InsertControl(wmem);
  wmem.Lines.ADD(' ');
  try
    idad.fClient.first;
    wmem := Gera_objeto(id,Dbedit3.text,objname,Dbedit2.text,prg_unit,idad,true,frm_ger.edit2.text,frm_ger.edit3.text,frm_ger.edit10.text) ;
    If wmem <> nil then
     Begin
      prg_unit := wmem;
      If prg_unit.lines.count > 0 then
        prg_unit.lines.saveToFile(ObjDir + '\' + objname+'.pas')
     end;
  finally

  end;
end;  }

function Tfrm_cs.Gerar_ClasseOO : boolean;
var                             { gera os comandos sql para o CRUDE}
wmemoo : Tmemo;
wcod : integer;
oo : TIdf_cs;
begin
  inherited;
  wmemoo := Tmemo.Create(self);
  wmemoo.Visible := false;
  self.InsertControl(wmemoo);
  wmemoo.Lines.ADD(' ');
  try
    //verificar se classe oo já existe  , senão cria..
    OO := TIdf_Cs.create(self);
    If OO.get_ObjectByNome(Cliente,Cenario,NomeOO) = 0 then
     begin
      OO.CLI_ID := Cliente;
      OO.PRJ_ID := Cenario  ;
      OO.LCK    := '';
      OO.IDG_ID := 0;
      OO.IDF_VISIBLE := '';
      OO.IDF_VERSAO_DATA := date;
      OO.IDF_VERSAO := '1';
      OO.IDF_TIPO_ATIVIDADE := 'CS';
      OO.IDF_RESPONSAVEL := '';
      OO.IDF_OBJETIVO := 'Objeto de negócio da Classe '+NOMECLASSE;
      OO.IDF_DIRETORIO := '';
      OO.IDF_DESIGNACAO := NOMEOO;
      OO.IDF_DEL := '';
      OO.Inclui;
      //.. e criar as properties
      Get_prop(OO.IDF_CODIGO);

     end;


    idad.fClient.first;
    wmemoo := Gera_OO(idesign,idad) ;
    If wmemoo <> nil then
     Begin
      oo_unit := wmemoo;
      If oo_unit.lines.count > 0 then
        oo_unit.lines.saveToFile(ObjDir + '\' + objnameOO+'.pas')
     end;
  finally

  end;
end;




procedure Tfrm_cs.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  //Gerar_Classe;
end;

{procedure Tfrm_cs.sp_crudeClick(Sender: TObject);
begin
  inherited;
  sp_verddClick(nil);
  Recriar_Crude(Dbedit2.Text,prg_unit);
end; }


{function Tfrm_cs.Recriar_Crude(pClasse : string;pUnit : Tmemo) : TMemo;
begin
  inherited;
  Deleta_Classe(pClasse,pUnit);     //deleta classes, métodos e set values do DD e do OO
  Gerar_classe ;
  Gerar_ClasseOO;

end;  }
// deleta classe no DD  e OO
function Tfrm_cs.Deleta_Classe(pClasse : string; pUNit : TMemo ) : Tmemo;
var                                   // delete declaracoa da funçào pFuncaoa específica
i ,j,Lin_Ini,Lin_fim,k,m: integer;
wnom,wObj : string;
wUnitDD,wUnitOO : TStringList;

 Begin
 wUnitDD := TstringList.create;
 wUnitOO := TstringList.create;
 try
  try
     prg_unit.Lines.LoadFromFile(ObjDir + '\' + Dbedit5.text+'.pas');
     OO_unit.Lines.LoadFromFile(ObjDir + '\' + Dbedit4.text+'.pas');
     wUnitDD.AddStrings(prg_Unit.lines);   //salva
     wUnitOO.AddStrings(OO_Unit.lines);    //salva
     wnom   := 'T'+lowercase(pClasse);
     for m := 1 to 2 do   //1 DD ;2 : OO
     begin
       Begin
         If m = 1 then    //DD
            Begin
             wnom   := 'T'+lowercase(pClasse) ;
             pUnit  := prg_unit;
             wObj   := Dbedit5.Text;
            end
         else      //OO
             Begin
              wnom   := 'O'+lowercase(pClasse) ;
              pUnit  := OO_Unit;
              wObj   := Dbedit4.Text;
             end;
         j := 1;
         While j <= 5 do
          begin
            K := Localiza_Objeto (pUnit,wMarc[j] + WNom+'}',0) ; //posiciona na linha  da Classes
            If k >= 0 then
             Begin
               Lin_ini := K;
               K := Localiza_Objeto (pUnit,wMarc[j+1] + WNom+'}',0) ; //posiciona na linha  da Classes
               If (k >=0) and (k >= Lin_ini) then
                 Begin
                   Lin_Fim := K;
                   for i := Lin_Fim Downto Lin_Ini do
                      pUnit.Lines.Delete(i);
                   If punit.lines.count > 0 then
                      punit.lines.saveToFile(ObjDir + '\' + wObj+'.pas')  ;
                 end;
             end
            else
             Raise Exception.create('Código não pode ser atualizado! Foi Alterado Manualmente!');
            j := j + 2;
          end;

      end;
     end;
  except
    prg_unit.Lines  := wUnitDD;
    oo_unit.lines   := wUnitOO;
    prg_unit.lines.saveToFile(ObjDir + '\' + Dbedit5.text+'.pas')  ;
    oo_unit.lines.saveToFile(ObjDir +'\'+ dbedit4.text+'.pas');
    raise;
  end;
 finally
  prg_unit.Lines.LoadFromFile(ObjDir + '\' + Dbedit5.text+'.pas');
  OO_unit.Lines.LoadFromFile(ObjDir + '\' + Dbedit4.text+'.pas');
 end;
 end;


procedure Tfrm_cs.SetObjDir(const Value: string);
begin
  FObjDir := Value;
end;

procedure Tfrm_cs.SetObj(const Value: string);
begin
  FObj := Value;
end;

procedure Tfrm_cs.SetObjName(const Value: string);
begin
  FObjName := Value;
end;

procedure Tfrm_cs.Setidad(const Value: Tdad);
begin
  Fidad := Value;
end;


procedure Tfrm_cs.Delete_class(pObjeto,pFuncao : string);
var
i ,begCont: integer;
wline :string;
wtab : string;
begin
  inherited;
  with prg_unit do
   Begin
     wtab := uppercase(copy(pObjeto,2,length(pObjeto)-1));
     //deleta classe
       for i := 0 to prg_unit.Lines.count - 1 do
          Begin
           wline := trim(prg_unit.lines[i]);
           If (pos(pObjeto,wline) > 0)  or (BegCont > 0) then
              Begin
               begin
                 while true do
                 begin
                    while (pos('END;',Uppercase(prg_unit.lines[i])) = 0)  do
                     Begin
                       if  pos('BEGIN',uppercase(prg_unit.lines[i]))  > 0 then
                        inc(BegCont);
                        prg_unit.Lines.delete(i);
                     end;
                    prg_unit.Lines.delete(i);
                    If BegCOnt > 0 then
                       Dec(BegCont);

                    If BegCont = 0 then
                       break;
                 end; //end true
               end;
              end;
          end;


       //deletea comentários
      i := 0;
        while true do
          Begin
           wline := trim(prg_unit.lines[i]);
           If pos('{'+pObjeto,wline) > 0 then
              Begin
                 prg_unit.Lines.delete(i);
                 i := 0;
              end;
           If pos('end.',wline) > 0 then
              Break;
           inc(i);
          end;

       //deletea comentários
        i := 0;
        while true do
          Begin
           wline := trim(prg_unit.lines[i]);
           If pos('{Objeto '+uppercase(wTab),wline) > 0 then
              Begin
                 prg_unit.Lines.delete(i);
                 i := 0;
              end;
           If pos('end.',wline) > 0 then
              Break;
           inc(i);
          end;
   end;
end;

procedure Tfrm_cs.Deleta_Funcao(pObjeto : string);
var                                   // delete funçào específica ; ex : function Tobjeto.inclui
i ,begCont: integer;
wtxt,wtxt1,wtxt2,wline :string;
wtab : string;
 Begin
  for i := 0 to prg_unit.Lines.count - 1 do
    Begin
     wline := trim(uppercase(prg_unit.lines[i]));
     If pos(trim(uppercase(pObjeto)),wline) > 0 then
        Begin

            while  pos('END;',Uppercase(prg_unit.lines[i]))  = 0 do
               Begin
                 if  pos('BEGIN',uppercase(prg_unit.lines[i]))  > 0 then
                  inc(BegCont);
                 prg_unit.Lines.delete(i);
               end;

            while BegCOnt > 0 do
              Begin
                prg_unit.Lines.delete(i);
                Dec(BegCont);
              end;
        end;
    end;
 end;

procedure Tfrm_cs.DBEdit3Exit(Sender: TObject);
 begin
  Get_prop(Id);
  SpeedButton7Click(NIL);
  salvar;
 end;

procedure Tfrm_cs.Get_prop(pClasse : integer);     // importa os atributos da tabela como propery da Classe
var
wmens : string;
begin
  inherited;
  If dbedit3.text <> '' then
    begin
      tab_objeto.TabVisible := FALSE ;
      sp_atrib.enabled      := true;
      wmens := AnsireplaceStr(Mens141,'&',uppercase(NOMECLASSE));
      wmens := AnsireplaceStr(wmens,'#',uppercase(DbEdit2.text));
      // verifica se já existe atrtibutos para a Classe....
      If MessageDlg(wMens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
       begin
        with TIdf_py.create(self) do
         begin
          If get_DaClasse(cliente,cenario,pClasse) then
           begin
              wmens := AnsireplaceStr(Mens142,'&',uppercase(DbEdit2.text));
              //... e reinicializa (deletea os proipertie atuais
             If MessageDlg(wMens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
                Del_DaClasse(cliente,cenario,id);

           end;
           Importa_property(Cliente,Cenario,pClasse,Dbedit3.text);
          free;
         end;

       end;
    end
  else
     tab_objeto.TabVisible := false;
end;

function Tfrm_cs.Importa_property(pCli,pProj,pClasse : integer;pTabela : string) : boolean;
var
wprop : integer;
 begin
   with TDad.create(self) do
    begin
     CLI_ID  := pCli;
     PRJ_ID  := pproj;
     Get_dados(pTabela);
     while not eof do
      begin
        wProp := fieldbyname('IDF_CODIGO').asinteger;
        with TIdf_py.create(self) do
         Begin
            CLI_ID     := pCli;
            PRJ_ID     := pProj;
            IDF_CODIGO := wProp;
            IncluiObj(pCli,pProj,wProp,pClasse,Dbedit3.text) ;
            free;
         end;
       next;
      end;
     free;
    end;

 end;

procedure Tfrm_cs.sp_atribClick(Sender: TObject);
begin
  inherited;
   Get_prop(ID);
   pgcpChange(nil);
end;

procedure Tfrm_cs.SpeedButton1Click(Sender: TObject);
begin
  If MessageDlg(mens143, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
   begin
     //antes de excluir, verificar se não houve geração de códigos
      with TIdf_py.create(self) do
       begin

        Del_DaClasse(cliente,cenario,id);
        pgcpChange(nil);
        sp_atrib.Enabled     := true;
        SpeedButton1.Enabled := false;
        free;
       end;

   end;
  
  
end;

procedure Tfrm_cs.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_IF' ;
       ListaTit := def12;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo >0 then
         begin
           dbedit3.DataSource.DataSet.Edit;
           dbedit3.Text := ListaDesc;
           dbedit2.DataSource.DataSet.Edit;
           dbedit2.Text := ListaDesc;
           salvar;
           DBEdit3Exit(nil);
         end;

       Close;
       
     end;

end;

procedure Tfrm_cs.SetNOMECLASSE(const Value: STRING);
begin
  FNOMECLASSE := Value;
end;


procedure Tfrm_cs.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  ObjDir     := dbedit7.Text;//(dbedit5.Text);
  ObjName    := dbedit5.Text;
  ObjNameOO  := dbedit4.Text;
  NOMECLASSE := 'T'+FirstUpper(Dbedit2.text);
  NOMEOO     := 'O'+FirstUpper(Dbedit2.text);
  Objeto  := NOMECLASSE;
  If DBEdit8.text = '' then
     raise exception.create('Informar o Nome da tela!');
  If e_NomeLista.text = '' then
     raise exception.create('Informar o Nome do Atributo a Listar!');
   Gera_tela(Dbedit8.text);
   memo1.Visible := true;
end;

procedure Tfrm_cs.Gera_tela(pnom : string);
var
i,Lin_ini : integer;
ws : string;
begin
  inherited;
  FORM_NAME := 'FRM_'+ pNom ;
  NOME_UNIT :=  pNom+'.PAS';
  NOME_DFM  :=  pNom+'.DFM';
  If wlist = nil then
    wList := Tstringlist.Create;
    wlist.Clear;
    prg_unit.Lines.clear;
    PRG_UNIT.Lines.loadfromfile(PROGDIR+'\FORM0.PAS');
    prg_unit.lines[0] := 'unit '+ leftstr(NOME_UNIT,LENGTH(NOME_UNIT)-4)+';';  
    prg_unit.Text := Replacestr(prg_unit.Text,'TForm3 = class(TForm)','T'+
                             form_name +' = class(TCAD_STAND)');
    prg_unit.Text := Replacestr(prg_unit.Text,'Form3',form_name);
    prg_unit.Text := Replacestr(prg_unit.Text,'TForm3','T'+form_name);
    prg_unit.Lines.SAVETOFILE(OBJDIR+'\'+NOME_UNIT);

   { cria DFM}

    wList.loadfromfile(PROGDIR+'\FORM0.DFM');
    wlist[0] := 'inherited '+ form_name +' : T'+form_name;
    wlist[1] := 'Color = 14145495';
    Lin_ini := Localiza_objeto(wList,'Caption',0);
    If Lin_ini >= 0 then
      wList[lin_ini] := 'Caption = '+''''+dbedit2.Text+'''';
    wList.SAVETOFILE(OBJDIR+'\'+NOME_DFM);

   Carrega_edit(dbedit3.text,'M');   //cria os tedits e tlabels;
   altera_use;                       // coloca o nome da unit de classes no use;
   Cria_property (false) ;           //cria property para objetop de negócio
   //Cria_ddmap(NOMEOO,'iObj'); ;      //cria property para popular as properties do Objeto de negócio
   Cria_create;                      //  cria o create do objeto no formcreate;
   Cria_close;                      //  cria o close do objeto no formcreate;
   Cria_Show ;                     // Cria método onShow
   Cria_Confirma(NOMEOO,'iObj');     //  cria o método de Confirmação
   Cria_Consiste;                    //  cria o método de consistencia
  // Cria_Edit('l_','d_');             //  cria os Objetos Tedit (type)_
   Cria_MostraCampos(NOMEOO,'iObj'); //  cria oo método que popula os tedit a partir dos atributos da tabela
   Cria_MostraObjeto(NOMEOO,'iObj'); // mostra o objeto a partir da Chava
   Cria_LBClick(NOMEOO,'iObj');      // Cria o método do click do ListBox ;
  // Cria_Limpa('Limpa_campos');       // Cria o método para limpar os Tedit;
   Cria_DataClose('d_');             // Cria o método para colocar a data do Datetimepicker no tedit;

end;

function Tfrm_cs.Carrega_edit(pTab : string;pTipo : string) : boolean;
 var
 wleft,wtop,i,wtaborder,dt,Lin_ini,Lin_end,wpos,Linha: integer;
 ws: string;
 wCode,wtxt,wDom : TstringList;
 Begin
   wtxt := TStringList.create;
   wDom := TStringList.create;
   If not idad.Get_dados(pTab) then
    Raise exception.create(def27+pTab+def271);
  // Salva_cpo(idad); ativar
   If pTipo <> 'D' then //e master
    aCpoMast := aCpo;
   wList.loadfromfile(OBJDIR+'\'+NOME_DFM);
   prg_unit.Lines.clear;
   prg_unit.lines := wlist;
   wtaborder := 0;
   Lin_ini := 0;
   wText.Clear;

   If pTipo = 'D' then  //detalhe
    Begin
       dt     := 0;
       wleft  := 0;
       wtop   := 0;
       for i := 0 to  WLIST.count -1 do
        Begin
         ws := trim(wlist[i]);
         wpos := pos('Panel4', ws) ;
         If  wpos  > 0 then
          Begin
             Lin_ini := i;
             break;
          end;
         end;

       If Lin_ini = 0 then
        exit;
       for i := Lin_ini to  WLIST.count -1 do
        Begin
         ws := trim(wlist[i]);
         If pos('end', ws) > 0 then
          Begin
             Lin_end := i;
             break;
          end;
         end;

    end
   else       //master
     Begin
        Lin_end := wlist.count-1;
        dt     := 0;
        wleft  := 358;
        wtop   := 52;
     end;


   idad.fclient.first;
    while not idad.fclient.eof do
     begin
    //  If not InMemo(idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring,wtext,0,0) then   // verifica duplicidade
      begin
         // Monta labels
         If ((idad.fclient.fieldbyname('IDF_VISIBLE').asstring <> '') and
              (uppercase(idad.fclient.fieldbyname('IDF_VISIBLE').asstring) <> 'N') ) OR
              (idad.fclient.fieldbyname('IDF_PK').asinteger > 0 )then

          Begin
             //NOME DO CAMPO (LABEL)
             wtext.clear;
             wtext.add('   object '+''+'l_'+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': Tlabel');
             wtext.add('     caption = '+''''+idad.fclient.fieldbyname('IDF_CAPTION').asstring+'''');
             wtext.add('     Height = 13');
             wtext.add('     Width = 32');
             wtext.add('     Top = '+''+inttostr(wtop)+'');
             wtext.add('     Left = '+''+inttostr(wleft)+'');
             wtext.add('   end');

             wtop := wtop+16;

              If uppercase(idad.fClient.FieldByName('IDF_DATA_TYPE').AsString) = 'D' then
                Begin
                  // Monta datetime picker em caso de data
                 inc(dt);
                 wtext.add('object d_'+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': TDateTimePicker');
                 wtext.add('Left = '+''+inttostr(wleft)+'');
                 wtext.add('Top = '+''+inttostr(wtop)+'');
                 wtext.add('Width = 145');
                 wtext.add('Height = 21');
                 wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
                 wtext.add('kind = dtkdate');  wtext.add('parseInput = false');
                 wtext.add('dateFormat = dfShort');
                 wtext.add('time = 38140.5243169329');
                 wtext.add('date = 38140.5243169329');
                 wtext.add('CalAlignment = dtaLeft');
                 wtext.add('OnCloseUp = DateClose');
                 wtext.add('end');
                end;


             If (trim(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
                Begin
                  // Monta Combo Domínio
                 inc(dt);
                 wtext.add('object c_'+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+' : TComboBox');   
                 wtext.add('Left = '+''+inttostr(wleft)+'');
                 wtext.add('Top = '+''+inttostr(wtop)+'');
                 wtext.add('Width = 145');
                 wtext.add('Height = 21');
                 wtext.add('ItemHeight = 17');
                 wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
                 wtext.add('Text = '+''''+'CMB_TAB'+'''' );
                 wtext.add('OnCloseUp = CmbClose');
                 wtext.add('end');
                 wDom.Clear;
                 wdOm.Text := idad.fClient.FieldByName('IDF_DOMINIO').Value;
                 inc(wTaborder);
                 Monta_dominio(wDom,'c_'+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring);

                end;



             { monta Tedits}
             If uppercase(idad.fclient.fieldbyname('IDF_DATA_TYPE').asstring) = 'M' then
                wtext.add('object '+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': Tmemo')
             else
                wtext.add('object '+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': TEdit');


             wtext.add('Left = '+''+inttostr(wleft)+'');
             wtext.add('Top = '+''+inttostr(wtop)+'');
             wtext.add('Width = 121');
             wtext.add('Height = 21');
             wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
             wtext.add('BorderStyle = bsNone');
             wtext.add('Color = 13224393');

             If uppercase(idad.fclient.fieldbyname('IDF_DATA_TYPE').asstring) = 'M' then
                wtext.add('Lines.Strings  = ('+ ansiquotedstr('',chr(39))+')')
             else
               begin
                 If (idad.fclient.fieldbyname('IDF_PK').asstring <> '') AND
                    (idad.fclient.fieldbyname('IDF_PK').asstring <> '0') then
                    begin
                      wtext.add('     ReadOnly = TRUE ');
                      wtext.add('     TabStop  = FALSE ');
                      wtext.add('     Color = clBtnFace');
                      wtext.add('     Top = '+''+'5'+'');
                    end;

               end;

             wtext.add('end');


             If pTipo = 'D'  then
               Begin
                  wtop := wtop - 16;
                  wleft := wleft + 121;
                  If wleft >1500 then
                   Begin
                    wtop := wtop + 25;
                    wleft := 0;
                   end;
               end
              else //master
               Begin
                wtop := wtop + 25;
                If wTop >400 then
                 Begin
                  wtop := 52;
                  wleft := wleft +  160;
                 end;
               end;

             inc(wTaborder);
             Insert_code(lin_end,wtext,wlist);
             
          end;
      end;
     idad.fClient.next;
     end;
     wtext.add('inherited lb: TListBox');
     wtext.add('TabOrder = 15');
     wtext.add('OnClick = lbClick');
     wtext.add('end');

    wList.SAVETOFILE(OBJDIR+'\'+NOME_DFM);
    wDom.free;

 end;

function TFRm_cs.Cria_Property(MasterDet : boolean) : boolean;
var
  i,lin_ini,lin_fim,lin_proc,Lin_end,j: integer;
  wtext : TStringList;
  dt : integer;
  ws : string;
  odad : Tdad;
Begin
   Lin_fim := 0;
   Lin_proc := 0;
   wtext := TStringList.create;
   dt := 0;

  wtext.clear;
  prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(prg_unit,'private',0);
   for j := 0 to length(aCpo) - 1 do
       Begin

        If Editavel(j) then
         Begin
           If (aTipo[j] = 'C') or (aTipo[j] = 'N') or (aTipo[j] = 'I') then
              wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : Tedit;')
           else
           If aTipo[j] = 'M' then
              wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : TMemo;');
           If aTipo[j] = 'D' THEN
           Begin
             inc(dt);
             s := 'D_'+aCpo[j];
             wtext.add('     '+formataCampo(s,'B',35,'R')+' : TDateTimePicker;');
             wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : Tedit;')
           end;
          wtext.add('     '+formataCampo('L_'+acpo[j],'B',35,'R')+' : Tlabel;');
         end;
       end;
   Insere_bloco(prg_unit,0,Lin_ini,wtext.text,false,FALSE);
   prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);


 // antes do private
   wtext.clear;
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(prg_unit,'private',0);
   If Lin_ini > -1 then
    begin
       wtext.add('     procedure FormCreate (sender : TObject);');
       wtext.add('     procedure FormClose (Sender: TObject; var Action: TCloseAction);');
       wtext.add('     procedure FormShow (Sender: TObject);');
       wtext.add('     procedure DateClose(sender : Tobject);');
       wtext.add('     procedure CmbClose(sender : Tobject);');
       wtext.add('     procedure lbClick(Sender: TObject);');
       wtext.add('     procedure sp2click(Sender: TObject);');
       //wtext.add('     Procedure spb_delClick(sender : TObject);');
       Insere_bloco(prg_unit,0,Lin_ini,wtext.text,false,FALSE);
       prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);

    end;

    // após o private
  prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;
   Lin_ini := Localiza_objeto(prg_unit,'private',0);
   wtext.add('     procedure Mostra_Objeto(pNome : string);');
   wtext.add('     function  consiste : boolean;');
 //  wtext.add('     function  Limpa_Campos : boolean;');
   wtext.add('     procedure ooMap;');
   Insere_bloco(prg_unit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);

    wtext.Clear;
   // após o published
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(prg_unit,'published',0);
   wtext.add('     property iObj; ');
 //  wtext.add('     function  consiste : boolean;');
 //  wtext.add('     function  Limpa_Campos : boolean;');
   wtext.add('     function  Mostra_Campos : boolean;');
 //  wtext.add('     procedure ooMap;');
   Insere_bloco(prg_unit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);

   //combos
    prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
    wtext.Clear;
   Lin_ini := Localiza_objeto(prg_unit,'T'+form_name +' = class(TCAD_STAND)',0);

    odad :=Tdad.create(self);
    odad.CLI_ID := cliente;
    oDad.PRJ_ID := Cenario;
    If not odad.Get_dados(Dbedit3.text) then
      Raise exception.create(def27+Dbedit3.text+def271);
    odad.fclient.first;
   while not odad.fclient.eof do
     Begin
      If (trim(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
         wtext.add('     C_'+formataCampo(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring,'B',35,'R')+' : TComboBox;');

        odad.fclient.next;
     end;
   Insere_bloco(prg_unit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
   odad.free;
end;


function TFRm_cs.Insert_code(pLinhaFim : integer;pText,pCode : TstringList) : TStringList;   //insere código no dfm
var
i,lin_fim : integer;
 begin
  lin_fim := pLinhaFim ;
  for i := ptext.Count -1 downto 0  do
     pCode.Insert(Lin_Fim,pText[i]);
   result := pCode;
 end;



function TFRm_cs.Cria_Create : boolean;
var
i,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;

 Begin

   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormCreate(Sender: TObject);') ;
   wInserttext.Add('var') ;
   wInserttext.Add(' wdir,wfile,P1,P2: string;') ;
   wInserttext.Add(' wbd : TstringList;') ;
   wInserttext.Add('  begin') ;
   wInserttext.Add('   inherited;') ;
   wInserttext.Add('   wBd := TstringList.create;') ;
   wInserttext.Add('   wFile := '+''''+'\'+DBedit8.text+''''+' ;') ;
   wInserttext.Add('   wFile := wFile+'+''''+'.ini'+''''+' ;') ;
   wInserttext.Add('   wdir := ExtractFileDir(Application.ExeName);') ;
   wInserttext.Add('   wdir := wdir + wFile'+';') ;
   wInserttext.Add('   If FileExists(wDir) then') ;
   wInserttext.Add('     begin') ;
   wInserttext.Add('      wbd.Loadfromfile(wDir);') ;
   wInserttext.Add('      DBAtu := Tdb.create(TADOConnection);') ;
   wInserttext.Add('      P1:= '+''''+'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+''''+';') ;
   wInserttext.Add('      P2:= '+''''+';Persist Security Info=False'+''''+';') ;
   wInserttext.Add('      (Dbatu.DbTipo as TAdoConnection).connectionstring := '+''+'P1'+'+'+'wbd'+'.text'+'+'+'p2'+''+';');
   wInserttext.Add('      end') ;
   wInserttext.Add('     else') ;
   wInserttext.Add('      Raise exception.create('+''''+'Arquivo '+''''+'+'+'wfile'+'+'+''''+' não Encontrado no Diretório!)'+''''+');') ;
   winserttext.add('   iObj := '+NOMEOO+ '.create;');
   winserttext.add('   wbd.free;;');
   wInserttext.Add(' end;') ;
   wInserttext.Add('') ;
   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function TFRm_cs.Cria_Close : boolean;
var
i,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;

 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);

   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormClose(Sender: TObject; var Action: TCloseAction);');
   wInserttext.Add('  begin;') ;
   wInserttext.Add('   Inherited;');
   wInserttext.Add('  '+FORM_NAME +' := nil;');
   wInserttext.Add('   action := cafree;');
   wInserttext.Add(' end;') ;
   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

end;

function TFRm_cs.Cria_Show : boolean;
var
i,lin_ini,lin_fim,lin_proc,Lin_end,j: integer;
ws : string;
pDom : TStringList;
odad : Tdad;
 Begin
   odad := Tdad.Create(self);
   odad.CLI_ID := cliente;
   oDad.PRJ_ID := Cenario;
   pDom := TStringList.create;
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);

   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormShow(Sender: TObject);');
   wInserttext.Add('  begin') ;
   wInserttext.Add('   Inherited;');
   wInserttext.Add('   If lb.Count > 0 then');
   wInserttext.Add('     begin');
   wInserttext.Add('       lb.ItemIndex := 0;');
   wInserttext.Add('       lbClick(nil);');
   wInserttext.Add('       ActiveControl := lb;');
   wInserttext.Add('     end;');


   //carrega combos com dominios
   If not oDad.Get_dados(Dbedit3.text) then
    Raise exception.create(def27+Dbedit3.text+def271);
   oDad.fclient.first;
   while not oDad.fclient.eof do
     Begin
      If (trim(oDad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(oDad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
          Begin
            pDom.Text := oDad.fClient.FieldByName('IDF_DOMINIO').Value;
            wInserttext.Add('        c_'+oDad.fClient.FieldByName('IDF_DESIGNACAO').asstring+'.clear;');

            for j := 0 to pDom.Count - 1 do
             Begin
               wInserttext.Add('        c_'+oDad.fClient.FieldByName('IDF_DESIGNACAO').asstring+'.items.add('+''''+pdom[j]+''''+');');
             end;
          end;

      oDad.fclient.next;
     end;
    wInserttext.Add(' end;') ;
   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
   pdom.Free;
   oDad.Free;

end;

function TFRm_cs.Cria_DBGrid1Click : boolean;

 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'. DBGrid1CellClick(Column: TColumn);') ;
   wInserttext.Add('  begin;') ;
   wInserttext.Add('   inherited;') ;
   wInserttext.Add('   Mostra_campos;') ;
   wInserttext.Add('  end; ') ;
   wInserttext.Add('') ;

   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);


end;

function TFRm_cs.Cria_DataClose(pPref : string) : boolean;
var
j : integer;
s : string;
 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.DateClose(sender : TObject);');
   wInserttext.Add('  begin;') ;
   wInserttext.Add('   inherited;') ;
   for j := 0 to length(aCpo) - 1 do
   begin
     If aTipo[j] = 'D' then
       Begin
         If Editavel(j) then
          Begin
           s := uppercase(pPref+  acpo[j]);
           wInserttext.Add('   If uppercase(TDatetimePicker(sender as Tobject).name) = '+''''+s+'''' +' then ');
           wInserttext.Add('    begin');
           wInserttext.Add('          '+''+acpo[j]+''+'.text := DateToStr(TDatetimePicker(sender as Tobject).date);');
           wInserttext.Add('          exit;');
           wInserttext.Add('    end;');
          end;
         end;
   end;
   wInserttext.Add('  end; ') ;
   wInserttext.Add('') ;

   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

end;

function TFRm_cs.Monta_dominio(pDom : TstringList;pNome : string) : boolean;
var                        //monta os combos apra atributis com domminios fechados
j,lin_ini : integer;
s : string;
odad : Tdad;
 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   If LOcaliza_objeto(prg_unit,'procedure T'+FORM_NAME +'.CmbClose(sender : TObject);',0) < 0 then
   begin
     wInserttext.Clear;
     wInserttext.Add('') ;
     wInserttext.Add('procedure T'+FORM_NAME +'.CmbClose(sender : TObject);');
     wInserttext.Add('  begin') ;
     wInserttext.Add('   inherited;') ;
     wInserttext.Add('        ');

    //closeup dos combos
    odad :=Tdad.create(self);
    odad.CLI_ID := cliente;
    oDad.PRJ_ID := Cenario;
     If not odad.Get_dados(Dbedit3.text) then
      Raise exception.create(def27+Dbedit3.text+def271);
     odad.fclient.first;
     while not odad.fclient.eof do
       Begin
        If (trim(odad.fClient.FieldByName('IDF_TIPODOMINIO').asstring) = 'F') then
        Begin
          If (trim(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
              Begin
                pNome := 'C_'+Uppercase(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring);
                pDom.Text := odad.fClient.FieldByName('IDF_DOMINIO').Value;
                wInserttext.Add('  If UpperCase(TComboBox(sender as Tobject).name) = '+''''+pNome+''''+' then ');
                wInserttext.Add('    begin');
                wInserttext.Add('      '+''+odad.fClient.FieldByName('IDF_DESIGNACAO').asstring+''+'.text := TComboBox(sender as Tobject).Items[TComboBox(sender as Tobject).ItemIndex];');
                wInserttext.Add('      exit;');
                wInserttext.Add('    end;');
              end;
        end;
        odad.fclient.next;
       end;


     wInserttext.Add('  end; ') ;
     wInserttext.Add('') ;
     Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
     prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
     odad.free;
   end;
end;


{function TFRm_cs.Cria_DataClose(pPref : string) : boolean;
var
j,lin_ini,lin_fim,lin_proc,Lin_end,i: integer;
ws,s : string;
first : boolean;
 Begin
   first := TRUE;
   wtext.Clear;
   Lin_fim := 0;
   Lin_proc := 0;
   Lin_ini := 0;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   lin_end := wlist.count-1;
   for j := 0 to wList.Count - 1 do
    Begin
     If pos('T'+FORM_NAME +'.DateClose',wlist[j]) > 0 then
      Begin
       lin_ini := j;
       for i := lin_ini to wlist.count - 1 do
        Begin
         If pos( 'Begin',wlist[I]) > 0 then
          Begin
           lin_end := i+1;
           first := false;
           break;
          end;
        end;
        If Lin_end <> wlist.count -1  then
         break;
      end;
    end;

   If first then   //primeira vez, do master
    Begin
       wtext.add('{Evento do Close Up datetimePicker}{');
       {wtext.add('procedure T'+FORM_NAME +'.DateClose(sender : TObject);');
       wtext.add(' Begin' );
    end;

   for j := 0 to length(aCpo) - 1 do
   begin

   If aTipo[j] = 'D' then
     Begin
       If Editavel(j) then
        Begin
           s := uppercase(pPref+  acpo[j]);
           wtext.add('  If uppercase(TDatetimePicker(sender as Tobject).name) = '+''''+s+'''' +' then ');
           wtext.add('      begin');
           wtext.add('            '+''+acpo[j]+''+'.text := DateToStr(TDatetimePicker(sender as Tobject).date);');
           wtext.add('            exit;');
           wtext.add('      end;');

        end;
     end;

   end;
   If first then
    Begin
       wtext.add(' end;');
       wtext.add('  ');
    end;


   Insert_code(lin_end,wtext,wlist);

   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;}


function TFRm_cs.Cria_Confirma(pClass,pObj : string) : boolean;
var
ini,fim : integer;
 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;
   wtext.add(' ');

   wtext.add('procedure T'+FORM_NAME +'.sp2click(Sender: TObject);');
   wtext.add('  Begin  ');
   wtext.add('   If not Consiste then');
   wtext.add('     raise exception.create('+''''+'Inclusão não efetuada!'+''''+');');
   wtext.add('   oomap;');
   wtext.add('   inherited;');
   wtext.add('   If Status = '+ansiquotedstr('I',CHR(39))+' then');
   wtext.add('      begin' );
   wtext.add('        If iObj.ID > 0 then //gravou novo ');
   wtext.add('        begin ');
   wtext.add('          (iObj as '+NOMEOO+').GetProperties; ');
   wtext.add('          iObj.PK.PK1  := iObj.ID;' );
   wtext.add('          lb.ItemIndex := lb.Items.AddObject((iObJ as '+NOMEOO+').'+frm_cs.e_nomeLista.text+',iObj.PK);' );
   wtext.add('          Mostra_objeto(iObj.Getitem(lb)); ');
   wtext.add('        end;' );
   wtext.add('      end;' );
  // wtext.add('   else ');
 //  wtext.add('        begin ');
 //  wtext.add('         lb.Items[lb.ItemIndex] := (iObJ as '+NOMEOO+').'+frm_cs.e_nomeLista.text+';');

 //  wtext.add('        end;');

   If uppercase(pObj) = 'IMASTER' then
      wtext.add('  Mostra_Itens;');
   wtext.add(' end;');
   wtext.add('  ');

   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wtext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

   end;

function TFRm_cs.Carrega_cpo_Confirma(pList : TstringList) : TstringList;
var
j,k : integer;
wpk : TstringList;
Begin                // monta a carga das propriedades do objeto a partir dos edit da tela (sem identificar o objeto)
 result := nil;
  for j := 0 to length(aCpo) - 1 do
    begin
          If Editavel(j) then
          begin
            If (aTipo[j] = 'C')  then
               pList.add('      '+''+FormataCampo(acpo[j],'B',35,'R')+''+' := self.' +''+acpo[j]+''+'.text;')
            else
            If (aTipo[j] = 'M') then
               pList.add('      '+''+FormataCampo(acpo[j],'B',35,'R')+''+' := self.' +''+acpo[j]+''+'.text;')
             else
            If aTipo[j] = 'I' then
               Begin
                 pList.add('      If self.'+''+FormataCampo(aCpo[j],'B',35,'R')+''+'.text <> '+''''+''+''''+' then');
                 pList.add('         '+''+acpo[j]+''+' := strtoint(self.' +''+acpo[j]+''+'.text);') ;
               end
            else
            If aTipo[j] = 'N' then
              Begin
                pList.add('      If self.'+''+aCpo[j]+''+'.text <> '+''''+''+''''+' then');
                pList.add('        '+''+FormataCampo(acpo[j],'B',35,'R')+''+' := strtofloat(self.' +''+acpo[j]+''+'.text);') ;
              end
            else
            If aTipo[j] = 'D' then
              Begin
                pList.add('      If self.'+''+aCpo[j]+''+'.text <> '+''''+''+''''+' then');
                pList.add('        '+''+FormataCampo(acpo[j],'B',35,'R')+''+' := STRTODATE(self.' +''+acpo[j]+''+'.text);');

              end;
         end;

    end;

   { wpk := Get_chave() ;
    k :=  wPk.count -2  ;

    for j := 0 to k do
     begin
       pList.add('        '+''+FormataCampo(wPk[j],'B',35,'R')+''+' := iObj.' +''+acpo[j]+''+';');

     end; }
    result := pList;
end;




function TFRm_cs.Cria_MostraCampos(pClass,pObj : string): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt,wtipo,WOBJ  : string;

 Begin
   wtext.clear;
   Lin_fim := 0;
   Lin_proc := 0;
   Lin_ini := 0;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   lin_end := wlist.count-1;
   wObj := '(iObj as '+NOMEOO+')';
   wtext.add('{ Popula os campos Edit com os atributos da tabela} ');
   If (uppercase(pObj) = 'IMASTER') or (uppercase(pObj) = 'IOBJ') then
    Begin
      wtext.add('function T'+FORM_NAME +'.Mostra_Campos : boolean;') ;
      wTipo := 'M';
    end

   else
    Begin
      wtext.add('function T'+FORM_NAME +'.Mostra_Campos_Itens : boolean;') ;
       wTipo := 'D';
    end;


   wtext.add(' begin');
    wtext.add('   '+wObj+'.GetProperties;');
    for j := 0 to length(aCpo) - 1 do
    begin
    If wTipo = 'D' then
     Begin
       If inArray( aCpo[j],aCpoMast) then   // se detalhe e existe atributo noa master,ignora(ex : PK)
        continue;
     end;
    wtxt :=  formataCampo('self.'+trim(aCpo[j]+'.text'),'B',35,'R') ;

    If Editavel(j) then
      begin
      If (aTipo[j] = 'C')  then
          wtext.add('   '+''+wtxt+''+':= '+WObj+'.'+''+acpo[j]+''+';')
       else
       If aTipo[j] = 'I' then
          wtext.add('   '+''+wTxt+''+':= '+'InttoStr('+wObj+'.'+''+acpo[j]+''+');')
      else
      If aTipo[j] = 'N' then
         wtext.add('   '+''+wTxt+''+':= '+'FloattoStr('+wObj+'.'+''+acpo[j]+''+');')
      else
      If aTipo[j] = 'D' then
         wtext.add('   '+''+wTxt+''+':= '+'DatetoStr('+wObj+'.'+''+acpo[j]+''+');')
      else
      If aTipo[j] = 'M' then
         wtext.add('   '+''+wtxt+''+':= '+wObj+'.'+''+acpo[j]+''+';')
      end;
   end;
   wtext.add(' end;');
   wtext.add('  ');
   insert_code(lin_end,wtext,wlist);
   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function TFRm_cs.Cria_LBclick(pClass,pObj : string): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt,wtipo : string;

 Begin
   wtext.clear;
   Lin_fim := 0;
   Lin_proc := 0;
   Lin_ini := 0;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   lin_end := wlist.count-1;

   wtext.add('{ Cria o click do ListBox} ');
   If (uppercase(pObj) = 'IMASTER') or (uppercase(pObj) = 'IOBJ') then
    Begin
      wtext.add('procedure T'+FORM_NAME +'.lbClick(Sender: TObject);') ;
      wTipo := 'M';
    end
   else
    Begin
      wtext.add('procedure T'+FORM_NAME +'.lbClick(Sender: TObject);') ;
       wTipo := 'D';
    end;


   wtext.add(' begin');
   wtext.add('   Inherited;');
   wtext.add('   Mostra_objeto(iObj.Getitem(lb));');
   wtext.add(' end;');
   wtext.add('  ');
   insert_code(lin_end,wtext,wlist);
   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);


   wList.loadfromfile(OBJDIR+'\'+NOME_DFM);
   wText.Clear;

     wtext.add('inherited lb: TListBox');
     wtext.add('TabOrder = 15');
     wtext.add('OnClick = lbClick');
     wtext.add('end');

   insert_code(wList.Count-2,wtext,wlist);
    wList.SAVETOFILE(OBJDIR+'\'+NOME_DFM);
end;

function TFRm_cs.Cria_MostraObjeto(pClass,pObj : string): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt,wtipo,wObj : string;

 Begin
   wtext.clear;
   Lin_fim := 0;
   Lin_proc := 0;
   Lin_ini := 0;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   lin_end := wlist.count-1;

   wtext.add('{ Popula os campos Edit com os atributos da tabela} ');
   If (uppercase(pObj) = 'IMASTER') or (uppercase(pObj) = 'IOBJ') then
    Begin
      wtext.add('procedure T'+FORM_NAME +'.Mostra_Objeto(pNome : string);') ;
      wTipo := 'M';
    end

   else
    Begin
      wtext.add('procedure T'+FORM_NAME +'.Mostra_Objeto(pNome : string);') ;
       wTipo := 'D';
    end;


   wtext.add(' begin');
   wtext.add('   iObj.Load(pNome);');
   wtext.add('   Mostra_Campos;');
   //wtext.add('   spb_del.Enabled := true;');
   //wtext.add('   sp_Insert.Enabled := true;');
   wtext.add(' end;');
   wtext.add('  ');
   insert_code(lin_end,wtext,wlist);
   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;



function TFRm_cs.Editavel(pIndex : integer): boolean;
begin
 result := false;
 If ( (aVisible[pIndex] <> '')  and (uppercase(aVisible[pIndex]) <> 'N') ) {AND    // é visivel...
    ( (aPk[pIndex] = '') or ( aPk[pIndex] = '0') )} then         // .. e não é PK.
     result := true;

end;


function TFRm_cs.Cria_MostraCamposDet(pClass,pObj : string): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt ,wObj: string;

 Begin
   wtext.clear;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   lin_end := wlist.count-1;
   wObj := '('+Pobj+' as '+NOMEOO+')';

   wtext.add('{ Popula os campos Edit com os atributos ta tabela} ');
   wtext.add('function T'+FORM_NAME +'.Mostra_Campos_Itens : boolean;');
   wtext.add(' begin');
   for j := 0 to length(aCpo) - 1 do
    begin
      If Editavel(j) then
        begin
        wtxt :=  formataCampo(trim(aCpo[j]+'.text'),'B',25,'R') ;
        If (aTipo[j] = 'C') or (aTipo[j] = 'M') then
           // wtext.add('   '+wtxt+':= '+pObj+'.'+AnsiQuotedStr(acpo[j],chr(39))+';')
            wtext.add('   '+''+wtxt+''+':= '+wObj+'.'+''+acpo[j]+''+';')
         else
        If aTipo[j] = 'I' then
            wtext.add('   '+''+wTxt+''+':= '+'InttoStr('+wObj+'.'+''+acpo[j]+''+');')
        else
        If aTipo[j] = 'N' then
           wtext.add('   '+''+wTxt+''+':= '+'FloattoStr('+wObj+'.'+''+acpo[j]+''+');')
        else
        If aTipo[j] = 'D' then
           wtext.add('   '+''+wTxt+''+':= '+'DatetoStr('+wObj+'.'+''+acpo[j]+''+');') ;
        end;
    end;

   wtext.add(' end;');
   wtext.add('  ');
   Insert_code(lin_end,wtext,wlist);

   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function TFRm_cs.Cria_Edit(pPreflab,pprefdate : string) : boolean;  //declara os tipos dos componentes no programa
var                                                    // ppref : prefxo no nome do componente
i,j,lin_ini,lin_fim,lin_proc,Lin_end,dt: integer;
ws,s : string;

 Begin
   dt := 0;
   Lin_fim := 0;
   Lin_proc := 0;
   Lin_ini := 0;
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;
   for i := 0 to  WLIST.count -1 do
    Begin
     ws := trim(wlist[i]);
     If pos('type', ws) > 0 then
          Begin
          lin_proc := i+1;
           break;
          end;
     end;

    for i := lin_proc to  WLIST.count -1 do
    Begin
     ws := trim(wlist[i]);
     If pos('procedure', ws) > 0 then
          Begin
          lin_fim := i;
           break;
          end;
     end;

     for j := 0 to length(aCpo) - 1 do
       Begin
     //  If InMemo(acpo[j],wlist,lin_proc,lin_fim) then   // verifica duplicidade
      //    continue;
        If Editavel(j) then
         Begin
           If (aTipo[j] = 'C') or (aTipo[j] = 'N') or (aTipo[j] = 'I') then
              wlist.Insert(lin_proc+1,'     '+formataCampo(acpo[j],'B',35,'R')+' : Tedit;')
           else
           If aTipo[j] = 'M' then
              wlist.Insert(lin_proc+1,'     '+formataCampo(acpo[j],'B',35,'R')+' : TMemo;');
           If aTipo[j] = 'D' THEN
           Begin
             inc(dt);
             s := pprefDate+aCpo[j];
             wlist.Insert(lin_proc+1,'     '+formataCampo(s,'B',35,'R')+' : TDateTimePicker;');
             wlist.Insert(lin_proc+1,'     '+formataCampo(acpo[j],'B',35,'R')+' : Tedit;')
           end;
           wlist.Insert(lin_proc+1,'     '+formataCampo(pPrefLab+acpo[j],'B',35,'R')+' : Tlabel;');
         end;
       end;
     // wList.insert(lin_proc+1,'adoc: TADOConnection;');
   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function TFRm_cs.Cria_Limpa(pFunc : string) : boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
w,wtxt : string;

 Begin
  prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
  wtext.Clear;
  wtext.add(' ');
  wtext.add('{ Limpa os Tedits} ');
  wtext.add('function T'+FORM_NAME +'.'+pFunc+' : boolean;');
  wtext.add(' begin');
  wtext.add('   inherited;');
  wtext.add(' end;');
  wtext.add('  ');
  Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wtext.text,false,FALSE);
 prg_unit.lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;


function TFRm_cs.Cria_Consiste : boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;

 Begin
  prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
    wtext.Clear;
    wtext.add(' ');
    wtext.add('{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} ');
    wtext.add('function T'+FORM_NAME +'.Consiste : boolean;');
    wtext.add(' begin');
    wtext.add('   inherited;');
    wtext.add('   result := true;');
    for j := 0 to length(aCpo) - 1 do
      begin
       {If (apk[j]<> '') and (apk[j] <> '0')  then  // chave primáriaa
        Begin
              wtext.add('    If '+''+acpo[j]+''+'.text'+' = ' +''''+''+''''+' then ');
              wtext.add('         raise exception.create('+''''+'Informar o campo '+aCaption[j]+''''+');');
        end
       else }
        Begin
           If (aObrig[j]<> '') and ( (apk[j] = '0') or (apk[j]= '') ) then  // campos Obrigatorios
            Begin
              wtext.add('    If '+''+'self.'+aCpo[j]+''+'.text'+' =' +''''+''+''''+' then ');     //campo obrigatorio
              wtext.add('         raise exception.create('+''''+'Informar o campo '+aCaption[j]+''''+');');
            end;
        end;
      end;

   wtext.add(' end;');
   wtext.add('');
   Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wtext.text,false,FALSE);
   prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

end;

function TFRm_cs.CriaParmMetodo : string;   //cria os parámetros do metodo (inclui,atualiza,deleta)
var
wparm : string;
i : integer;
Begin
  for i := 0 to length(aPk)- 1 do
    Begin
     If (apk[i]<> '') and (apk[i]<> '0')then
       Begin
         If aTipo[i] = 'C' THEN
           wparm := wparm+ 'self.'+acpo[i] + '.text,'
         else
         If aTipo[i] = 'I' THEN
           wparm := wparm+ 'StrToInt(self.'+acpo[i] + '.text),'
         else
         If aTipo[i] = 'N' THEN
           wparm := wparm+ 'StrToFGloat(self.'+acpo[i] + '.text),'
         else
         If aTipo[i] = 'D' THEN
           wparm := wparm+ 'StrToDate(self.'+acpo[i] + '.text),' ;
       end;

    end;
   delete(wparm,length(wparm),1);
   result := wparm;
end;

function Tfrm_cs.Altera_use : boolean;
var
i,lin_ini,lin_fim: integer;
ws : string;

 Begin
   wList.loadfromfile(OBJDIR+'\'+NOME_UNIT);
    //acrscenta nome da unit de objetos no uses principal
   for i := 0 to  WLIST.count -1 do
    Begin
     ws := trim(wlist[i]);
     If pos('uses', ws) > 0 then
      begin
       Lin_ini := i;
      end;

     If pos('type', ws) > 0 then
      Begin
         Lin_fim := i-1;
         break;
      end;

    end;
    i := Lin_fim;
    while i >= Lin_ini do
     Begin
       ws := trim(wlist[i]);
       If ws = '' then
        i := i -1
       else
        Begin

        //  wlist[i] := leftstr(ws,length(ws)-1)+','+ leftstr(ObjNameOO,length(ObjNameOO)-4)+';';
          wlist[i] := leftstr(ws,length(ws)-1)+','+ ObjNameOO+';';
          break;
        end;

     end;
    wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
 end;

procedure Tfrm_cs.Setform_name(const Value: string);
begin
  Fform_name := Value;
end;

procedure Tfrm_cs.SetNOME_DFM(const Value: STRING);
begin
  FNOME_DFM := Value;
end;

procedure Tfrm_cs.SetNOME_UNIT(const Value: STRING);
begin
  FNOME_UNIT := Value;
end;

procedure Tfrm_cs.SetPROGDIR(const Value: STRING);
begin
  FPROGDIR := Value;
end;

procedure Tfrm_cs.SetwList(const Value: TStringList);
begin
  FwList := Value;
end;

procedure Tfrm_cs.SetwText(const Value: TStringList);
begin
  FwText := Value;
end;

procedure Tfrm_cs.SetNOMEOO(const Value: string);
begin
  FNOMEOO := Value;
end;

procedure Tfrm_cs.SetObjNameOO(const Value: string);
begin
  FObjNameOO := Value;
end;

procedure Tfrm_cs.sp_verddClick(Sender: TObject);
begin
  inherited;
  If FileExists(dbedit7.Text+'\'+dbedit5.Text+'.pas') then
    Begin
      Prg_unit.Lines.LoadFromFile(dbedit7.Text+'\'+dbedit5.Text+'.pas');
      prg_unit.BringToFront;
    end;


end;

procedure Tfrm_cs.sp_verooClick(Sender: TObject);
begin
  inherited;
  If FileExists(dbedit7.Text+'\'+dbedit4.Text+'.pas') then
    Begin
      oo_unit.Lines.LoadFromFile(dbedit7.Text+'\'+dbedit4.Text+'.pas');
      oo_unit.BringToFront;
    end;

end;

procedure Tfrm_cs.rgClick(Sender: TObject);
begin
  inherited;
  If rg.ItemIndex = 1 then
    g_master.enabled := true
  else
    g_master.enabled := false;
end;

procedure Tfrm_cs.DBG_ATRIBCellClick(Column: TColumn);
var
i : integer   ;
begin
  inherited;
  ddmap_atrib(dbg_atrib.DataSource.DataSet);
  edit2.Text := dbg_atrib.DataSource.DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
  edit3.Text := dbg_atrib.DataSource.DataSet.fieldbyname('PROP_DEFAULT').asstring;
  edit5.Text := dbg_atrib.DataSource.DataSet.fieldbyname('IDF_LISTA').asstring;
  memo2.Text := dbg_atrib.DataSource.DataSet.fieldbyname('IDF_OBJETIVO').asstring;
  edit6.Text := dbg_atrib.DataSource.DataSet.fieldbyname('PROP_TIPO').asstring;
  edit7.Text := dbg_atrib.DataSource.DataSet.fieldbyname('PROP_VISIBIL').asstring;
  for i := 0 to rg_vis.Items.Count - 1 do
   begin
    If uppercase(edit7.Text) = uppercase(rg_vis.Items[i]) then
     begin
      rg_vis.ItemIndex := i;
      break;
     end;
   end;
   for i := 0 to rd_tipo.Items.Count - 1 do
   begin
    If uppercase(edit6.Text) = uppercase(rd_tipo.Items[i]) then
     begin
      rd_tipo.ItemIndex := i;
      break;
     end;
   end;

end;

procedure Tfrm_cs.ddmap_atrib(dataset : Tdataset);
begin
      idados.ATRIBUTOS.PROP_VISIBIL              := DataSet.fieldbyname('PROP_VISIBIL').asstring;
      idados.ATRIBUTOS.PROP_TIPO                 := DataSet.fieldbyname('PROP_TIPO').asstring;
      idados.ATRIBUTOS.PROP_DOMINIO              := DataSet.fieldbyname('PROP_DOMINIO').asstring;
      idados.ATRIBUTOS.PROP_DEFAULT              := DataSet.fieldbyname('PROP_DEFAULT').asstring;
      idados.ATRIBUTOS.LCK                       := DataSet.fieldbyname('LCK').asstring;
      idados.ATRIBUTOS.IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      idados.ATRIBUTOS.IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      idados.ATRIBUTOS.IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      idados.ATRIBUTOS.IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      idados.ATRIBUTOS. IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      idados.ATRIBUTOS.IDF_SEQ                   := DataSet.fieldbyname('IDF_SEQ').asinteger;
      idados.ATRIBUTOS.IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      idados.ATRIBUTOS.IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      idados.ATRIBUTOS.IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      idados.ATRIBUTOS.IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      idados.ATRIBUTOS.IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      idados.ATRIBUTOS.CLASS_ID                  := DataSet.fieldbyname('CLASS_ID').asinteger;
      idados.ATRIBUTOS.IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      idados.ATRIBUTOS.PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      idados.ATRIBUTOS.CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      idados.ATRIBUTOS.IDF_LISTA                 := DataSet.fieldbyname('IDF_LISTA').asinteger;
end;

procedure Tfrm_cs.ddmap_atu(pde,ppara :TIdf_py);
begin
      ppara.PROP_VISIBIL              := pde.PROP_VISIBIL ;
      ppara.PROP_TIPO                 := pde.PROP_TIPO ;
      ppara.PROP_DOMINIO              := pde.PROP_DOMINIO ;
      ppara.PROP_DEFAULT              := pde.PROP_DEFAULT ;
      ppara.LCK                       := pde.LCK      ;
      ppara.IDG_ID                    := pde.IDG_ID  ;
      ppara.IDF_VISIBLE               := pde.IDF_VISIBLE  ;
      ppara.IDF_VERSAO_DATA           := pde.IDF_VERSAO_DATA  ;
      ppara.IDF_VERSAO                := pde.IDF_VERSAO       ;
      ppara. IDF_TIPO_ATIVIDADE       := pde. IDF_TIPO_ATIVIDADE   ;
      ppara.IDF_SEQ                   := pde.IDF_SEQ           ;
      ppara.IDF_RESPONSAVEL           := pde.IDF_RESPONSAVEL  ;
      ppara.IDF_OBJETIVO              := pde.IDF_OBJETIVO    ;
      ppara.IDF_DIRETORIO             := pde.IDF_DIRETORIO  ;
      ppara.IDF_DESIGNACAO            := pde.IDF_DESIGNACAO  ;
      ppara.IDF_DEL                   := pde.IDF_DEL      ;
      ppara.CLASS_ID                  := pde.CLASS_ID      ;
      ppara.IDF_CODIGO                := pde.IDF_CODIGO  ;
      ppara.PRJ_ID                    := pde.PRJ_ID         ;
      ppara.CLI_ID                    := pde.CLI_ID      ;
      ppara.IDF_LISTA                 := pde.IDF_LISTA     ;
end;



procedure Tfrm_cs.rg_visClick(Sender: TObject);
begin
  inherited;
  edit7.Text := rg_vis.Items[rg_vis.itemindex];
end;

procedure Tfrm_cs.SpeedButton6Click(Sender: TObject);
var
pPy :  TIDF_PY;
begin
  inherited;
 //salvar;
 pPy := TIDF_PY.create(self);
 with pPy do
   begin
    ddmap_atu(idados.ATRIBUTOS,pPy);
    PROP_VISIBIL              :=  edit7.Text;
    PROP_TIPO                 :=  edit7.Text;
 //   PROP_DOMINIO              :=
    PROP_DEFAULT              :=  edit3.Text;
 //   LCK                       :=
 //   IDG_ID                    :=
 //   IDF_VISIBLE               :=
 //   IDF_VERSAO_DATA           :=
//    IDF_VERSAO                :=
//    IDF_TIPO_ATIVIDADE        :=
//    IDF_SEQ                   :=
//    IDF_RESPONSAVEL           :=
    IDF_OBJETIVO              :=  memo2.Text;
//    IDF_DIRETORIO             :=
//    IDF_DESIGNACAO            :=
//    IDF_DEL                   :=
//    CLASS_ID                  :=
//  IDF_CODIGO                :=
//   PRJ_ID                    :=
//    CLI_ID                    :=
If edit5.Text <> '' then
    IDF_LISTA                 :=  strtoint(edit5.text);

    atualiza(cliente,cenario,idf_codigo,id);
    idados.ATRIBUTOS.fClient.close;
    idados.ATRIBUTOS.fClient.open;

   end;
end;

procedure Tfrm_cs.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  If frm_prop = nil then
     frm_prop := Tfrm_prop.create(self);
  with frm_prop do
   begin
      CLIENTE := self.cliente;
      CENARIO := self.cenario;
      CLASSE  := self.ID;
      showmodal;
   end;
end;

procedure Tfrm_cs.spmetClick(Sender: TObject);
begin
  inherited;
   If frm_metod = nil then
     frm_metod := Tfrm_metod.create(self);
  with frm_metod do
   begin
      CLIENTE := self.cliente;
      CENARIO := self.cenario;
      CLASSE  := self.ID;
      showmodal;
   end;
end;

procedure Tfrm_cs.BT1Click(Sender: TObject);
begin
  inherited;
   If frm_DIR4 = NIL   then
     frm_DIR4 := Tfrm_DIR4.create(self);
   frm_DIR4.showmodal;
   Dbedit7.DataSource.DataSet.Edit;
   Dbedit7.Text := frm_treeativ.Diretorio;
end;

procedure Tfrm_cs.LoadConstantObj;
begin
inherited ;

  Caption := 'Classes'   ;
  Label1.Caption := 'Nome da Classe '  ;
  Label2.Caption := 'Descrição ' ;
  Label3.Caption := 'Classe mãe' ;
  Label10.Caption := 'Tabela '  ;
  SpeedButton11.Caption := 'Lista  '  ;
  //SpeedButton7.Caption := 'Propriedades'   ;
  spmet.Caption := 'Métodos      '  ;
  rg_style.Caption := 'Estilo de Classe' ;
  tab_atributos.Caption := 'Propriedades'  ;
  SpeedButton8.Caption := 'Incluir Atributo de Objeto de Negócio';
  SpeedButton1.Caption := 'Excluir por Propriedades     '  ;
  sp_atrib.Caption := 'Gerar Propriedades' ;
  Label7.Caption := 'Descrição' ;
  Label13.Caption := 'Nome Atributo'   ;
  Label14.Caption := 'Valor padrão' ;
  Label15. Caption := 'Mostra na Lista'  ;
  Label16.Caption := 'Tipo' ;
  Label17.Caption := 'Visibilidade'   ;
  //SpeedButton6.Caption := 'Salvar'  ;
  DBG_ATRIB.columns[0].title.caption:= 'Nome'             ;
  rg_vis.Caption := 'Visibilidade'   ;
  rd_tipo.Caption := 'Tipos'  ;
  tab_metodos.Caption := 'Métodos'  ;
  Label4.Caption := 'Parámetros' ;
  Label5.Caption := 'Descrição Parámetro' ;
  RD_MVIS. Caption := 'Visibilidade' ;
  RD_MTIPO.Caption := 'Tipo';
  RD_TIM.Caption := 'Tipo Método'  ;
  RD_BIN.Caption := 'Binding' ;
  RD_DIR. Caption := 'Diretivas'  ;
  dbg_met.columns[0].title.caption :=  'Seq.';
  dbg_met.columns[1].title.caption :=  'Nome';
  dbg_met.columns[2].title.caption :=  'Tipo';

  dbg_parm.columns[0].title.caption :=  'Seq.';
  dbg_parm.columns[1].title.caption :=  'Parámetro';
  dbg_parm.columns[2].title.caption :=  'Tipo';
  TabSheet1.Caption := 'Eventos' ;
  DBGrid1.columns[0].title.caption :=  'Seq.';
  DBGrid1.columns[1].title.caption :=  'Vis.';
  DBGrid1.columns[2].title.caption :=  'Nome';
  Tab_objeto.Caption := 'Geração' ;
  SpeedButton2.Hint := 'Gerar camada de dados e camada de Objetos de negócio' ;
  SpeedButton2.Caption := 'Gerar Códigos' ;
  sp_crude.Hint :=
          'Recria Métodos Básicos iniciais ;  preserva os métodos criados m' +
          'anualmente.'  ;
 SpeedButton9.Caption := 'Gerar Form    ' ;
 Memo1.  text := (
          'Para Compilar o Form .'  +
          ' - abrir um Projeto'      +
          ' - adicionar ao projeto .' +
          '   .. frm_primar'            +
          '   .. cad_stand,'            +
          '   .. o form criado'       +
          '   -- Unia Class Objetos'  +
          '   -- Unita Classes DD'    +
          '   -- Base_tier'           +
          ''                          +
          ''                          +
          ''                          +
          'Nas options do Projeto, colocar o form criado como autocreate')  ;
  GroupBox3.Caption := 'Projeto'   ;
  Label11.Caption := 'Nome Unit Classes de Objetos de Negócio' ;
  sp_veroo. Caption := 'Ver Código' ;
  sp_verdd.Caption := 'Ver Código'  ;
  Caption := 'Nome da Tela '  ;
  GroupBox1. Caption := 'Telas'  ;
  Caption := 'Atributo da Lista'  ;
  g_master.  Caption := 'Master/Detail'  ;
  sp_ger.Caption := 'Gerar Form    ' ;
  Label8. Caption := 'Tabela Detail' ;
  rg.caption  :=  'Tipo tela'  ;
  rg.items[0]     :=  'Simples'    ;
  rg.items[1]     :=  'Master/Detail'    ;

end;

procedure Tfrm_cs.spb_geracaoClick(Sender: TObject);
begin
  inherited;
  If frm_ger  = nil  then
    frm_ger := Tfrm_ger.create(self);
  with frm_ger do
    Begin
     objDir     := self.DBEdit7.text;
     ObjName    := self.dbedit5.Text;
     ObjNameOO  := self.dbedit4.Text;
     NOMECLASSE := 'T'+FirstUpper(self.Dbedit2.text);
     NOMEOO     := 'O'+FirstUpper(self.Dbedit2.text);
     idataSource:= self.idatasource;
    end;

  frm_ger.showmodal;
end;

procedure Tfrm_cs.spb_gerClick(Sender: TObject);
begin
  inherited;
  If frm_ger  = nil  then
    frm_ger := Tfrm_ger.create(self);
  frm_ger.showmodal;
end;

procedure Tfrm_cs.sppClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure Tfrm_cs.SetiDesign(const Value: OODesign);
begin
  FiDesign := Value;
end;

end.


