unit bst_ger;

{ acrescentar : - opção de escolha dos campos a serem listados (lb)



}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, Buttons, ToolWin, Mask, ExtCtrls,bst_objetos,bstdb,dbtables,db,
  strUtils,cls_obj,fonctions, ADODB,bst_Basefrm, Aligrid;
  
 type
  OODesign = class(TObject)
  private
    FPK: string;
    Foounit: string;
    FClasse: string;
    FNomeLista: string;
    FTela: string;
    FTabela: string;
    FClasseId: integer;
    FClassFilho: string;
    FTabelaFilho: string;
    FPrgUnit: TMemo;
    FClasseDados: string;
    FIDPai: integer;
    FTip: integer;
    FTABREF: string;
    procedure SetClasse(const Value: string);
    procedure SetNomeLista(const Value: string);
    procedure Setoounit(const Value: string);
    procedure SetPK(const Value: string);
    procedure SetTabela(const Value: string);
    procedure SetTela(const Value: string);
    procedure SetClasseId(const Value: integer);
    procedure SetClassFilho(const Value: string);
    procedure SetPrgUnit(const Value: TMemo);
    procedure SetIDPai(const Value: integer);
    procedure SetTip(const Value: integer);
    procedure SetTABREF(const Value: string);
    
   published
     property ID             : integer read FIDPai write SetIDPai;
     property Tela           : string read FTela write SetTela;
     property Classe         : string read FClasse write SetClasse;
     property oounit         : string read Foounit write Setoounit;
     property Tabel          : string read FTabela write SetTabela;
     property PK             : string read FPK write SetPK;
     property NomeLista      : string read FNomeLista write SetNomeLista;
     property ClasseId       : integer read FClasseId write SetClasseId;
     property ClassFilho     : string read FClassFilho write SetClassFilho;
     property PrgUnit        : TMemo read FPrgUnit write SetPrgUnit;
     property Tip            : integer  read FTip write SetTip; //0 : Pai com filhos;1: filho sem nada; 2 : Paia sem filho
     property TABREF         : string read FTABREF write SetTABREF;
     function PopulaDD(pTipo : integer)       : boolean;
     function GetAtributos(pTipo : integer) : boolean;
     function GetAtributoLista(pTabela: string): string;
   constructor create;
  end;


type
  Tfrm_ger = class(TBasefrm)
    GroupBox2: TGroupBox;
    Label12: TLabel;
    BT1: TSpeedButton;
    Label21: TLabel;
    SpeedButton4: TSpeedButton;
    Edit1: TEdit;
    Tipo: TRadioGroup;
    eOOunit: TEdit;
    prg_unit: TMemo;
    oo_unit: TMemo;
    gbpai: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    spbpai: TSpeedButton;
    Label17: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    etela_pai: TEdit;
    enomeLista: TEdit;
    eClasse_pai: TEdit;
    eTab_pai: TEdit;
    pk_pai: TEdit;
    Nivel: TRadioGroup;
    idObj: TEdit;
    gbDet: TGroupBox;
    Label1: TLabel;
    sg: TStringAlignGrid;
    Panel1: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Panel2: TPanel;
    sp2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sp_verooClick(Sender: TObject);
    procedure BT1Click(Sender: TObject);
   
    procedure bt_cancelarClick(Sender: TObject);
    procedure spbpaiClick(Sender: TObject);
    procedure sgDblClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TipoClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure NivelClick(Sender: TObject);
  private
    Fidados: TIdf_cs;
    FiProp: TIdf_Py;
    FiAncestor: TIdf_cs;
    Fiparm: TIDF_pr;
    FObjDir: string;
    FObj: string;
    FObjName: string;
    Fidad: Tdad;
    FNOMEDD: STRING;
    FNOME_DFM: STRING;
    FNOME_UNIT: STRING;
    Fform_name: string;
    FPROGDIR: STRING;
    FwList: TStringList;
    FwText: TStringList;
    FNOMEOO: string;
    FObjNameOO: string;
    FoTABELA: STRING;
    FNOMETELAMASTER: STRING;
    FNOMETELADETAIL: STRING;
    FCliente: integer;
    FCenario: integer;
    FID: integer;
    FClasse: string;
    FIDDT: integer;
    FClasseDT: string;
    FoTABELADT: STRING;
    FObjNameOODT: STRING;
    FNOMEOODT: STRING;
    FObjNameDT: STRING;
    FObjetoDT: STRING;
    FNOMEDDDT: STRING;
    FNOMELISTA: STRING;
    FMASTER: BOOLEAN;
    FWKEYMASTER: STRING;
    FTELA: string;
    FoTABELAFILHO: STRING;
    Fidesign: OODesign;
    FiDesignFilho: OODesign;
    procedure Setidados(const Value: TIdf_cs);
    procedure SetiProp(const Value: TIdf_Py);
    procedure SetiAncestor(const Value: TIdf_cs);
    procedure Setiparm(const Value: TIDF_pr);
    function Preparar_Geracao: boolean;
    procedure SetObjDir(const Value: string);
    procedure SetObj(const Value: string);
    procedure SetObjName(const Value: string);
    procedure Setidad(const Value: Tdad);
    procedure Delete_class(pObjeto,pFuncao : string);
    procedure Deleta_Funcao(pObjeto: string);
    procedure Get_prop(pClasse : integer);
    procedure aScroll(Dataset: Tdataset);
    procedure SetNOMEDD(const Value: STRING);
    function Carrega_edit(odesign : OOdesign;pTipo : string) : boolean;
    function Cria_Confirma(oDesign : OODesign) : boolean;
    function Cria_Consiste(oDesign : OODesign) : boolean;
    function Cria_Create(oDesign : OODesign) : boolean;
    function Cria_DataClose(oDesign : OOdesign;pPref : string) : boolean;
    function Cria_del(odesign : OODesign) : boolean;
   // function Cria_Edit(pPreflab, pprefdate: string): boolean;
    function Cria_Limpa(pFunc: string): boolean;
    function Cria_MostraCampos(oDesign : OODesign): boolean;
    function Cria_Property(oDesign : OODesign): boolean;
    function Cria_Show(oDesign : OODesign) : boolean;
    procedure Gera_tela(odesign,oDesignFilho : OODesign);
    function Insert_code(pLinhaFim: integer; pText,
      pCode: TstringList): TStringList;
    procedure Setform_name(const Value: string);
    procedure SetNOME_DFM(const Value: STRING);
    procedure SetNOME_UNIT(const Value: STRING);
    function Altera_use(odesign : OODesign) : boolean;
    procedure SetPROGDIR(const Value: STRING);
    procedure SetwList(const Value: TStringList);
    procedure SetwText(const Value: TStringList);
    function Editavel(pIndex: integer): boolean;
    function Gerar_ClasseOO (oDesign : OODesign): boolean;
    procedure SetNOMEOO(const Value: string);
    procedure SetObjNameOO(const Value: string);
    function Cria_Close(oDesign : OODesign) : boolean;
    function Cria_VarGrid(odesign : OODesign): boolean;
    procedure ddmap_atrib(dataset: Tdataset);
    function Monta_dominio(odesign : OOdesign;pDom : TstringList;pNome : string) : boolean;
    procedure SetoTABELA(const Value: STRING);
    procedure SetNOMETELADETAIL(const Value: STRING);
    procedure SetNOMETELAMASTER(const Value: STRING);
    procedure SetCenario(const Value: integer);
    procedure SetCliente(const Value: integer);
    procedure SetID(const Value: integer);
    procedure SetClasse(const Value: string);
    procedure SetClasseDT(const Value: string);
    procedure SetIDDT(const Value: integer);
    procedure SetoTABELADT(const Value: STRING);
    procedure SetNOMEOODT(const Value: STRING);
    procedure SetObjetoDT(const Value: STRING);
    procedure SetObjNameDT(const Value: STRING);
    procedure SetObjNameOODT(const Value: STRING);
    procedure SetNOMEDDDT(const Value: STRING);
    procedure SetNOMELISTA(const Value: STRING);
    procedure SetMASTER(const Value: BOOLEAN);
    function Cria_Monta_Cab(odesign,oDesignFilho : OODesign): boolean;
    function Cria_Mostra_contatos(odesign,oDesignFilho : OODesign): boolean;
    function Cria_GridClick(oDesign,oDesignFilho : OODesign): boolean;
    function Cria_ObjetoDet (oDesign,oDesignFilho : OODesign): boolean;
    procedure alteraUses;
    function Checa_arquivos (iDesign : OODesign;pPrgOrig : string) : boolean;
    function Altera_detail(oDesign,oDesignFilho : OODesign): boolean;
    procedure SetWKEYMASTER(const Value: STRING);
    procedure SetTELA(const Value: string);
    procedure ProgDT;
    procedure SetoTABELAFILHO(const Value: STRING);
    procedure Setidesign(const Value: OODesign);
    function Cria_OOMap(oDesign : OODesign): boolean;
    procedure Consiste_Pai;
    procedure SetiDesignFilho(const Value: OODesign);
    procedure Atualiza(pdesign: OODesign);
    function Deleta_Classe(oDesign : OOdesign): Tmemo;
    function Cria_loadConstant(odesign: OOdesign): boolean;


    { Private declarations }
  public
    { Public declarations }
  published
   property idados : TIdf_cs read Fidados write Setidados;
   property ObjDir : string read FObjDir write SetObjDir;
   property iProp  : TIdf_Py read FiProp write SetiProp;
   property idad : Tdad read Fidad write Setidad;
   property PROGDIR  : STRING read FPROGDIR write SetPROGDIR; // diretório do programa (BEST)
   property Cliente : integer read FCliente write SetCliente;
   property Cenario : integer read FCenario write SetCenario;
   property ID : integer read FID write SetID;
   property idesign : OODesign read Fidesign write Setidesign;
   property iDesignFilho : OODesign read FiDesignFilho write SetiDesignFilho;
   procedure LoadConstantObj;override;
   property wList : TStringList read FwList write SetwList;
   property wText : TStringList read FwText write SetwText;
   property form_name : string  read Fform_name write Setform_name;
   property NOME_UNIT : STRING read FNOME_UNIT write SetNOME_UNIT;
   PROPERTY NOME_DFM : STRING read FNOME_DFM write SetNOME_DFM;


 end;


 { Marcador de Blocos}
  const WMarc: array[1..8] of sTRING = ('{Início Classe ', '{Fim Classe ', '{Início Métodos ','{Fim Métodos ','{Início Set Values ','{Fim Set Values ','{Inicio Const ','{Fim Const ');


var
  frm_ger: Tfrm_ger;
  wInserttext : TstringList;
  atucol,current,xini: integer;
implementation

uses bst_main, bst_log, bst_treeAtiv, bst_dir1, bst_cs,cls_codigo;


{$R *.dfm}

procedure Tfrm_ger.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   frm_ger := nil;
   action := caFree;
end;

procedure Tfrm_ger.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_ger.FormShow(Sender: TObject);
begin
  inherited;
  //sp2.enabled := true;
end;  


procedure Tfrm_ger.Setidados(const Value: TIdf_cs);
begin
  Fidados := Value;
end;

procedure Tfrm_ger.FormCreate(Sender: TObject);
begin

  with ttv.Create do
    Begin
     diagrama.Carrega_tipo;// sp2.enabled := true;
     free;
    end;

  idados      :=  TIdf_cs.create(self);
  iDad        :=  TDad.create(self);
   If CurrEmpresa = nil then
      frm_main.SpeedButton10Click(frm_main) ;
   frm_main.wfecha := true;
   If not frm_main.canc_cli then
       Begin
        cliente := CurrEmpresa.cenarios.CLI_ID ;
        Cenario := CurrEmpresa.Cenarios.PRJ_ID ;

       end;

   frm_main.wfecha  := true;
   wtext := TstringList.create;
   wList := TstringList.create;
   wInserttext := TstringList.create;

END;

procedure Tfrm_ger.SetoTABELA(const Value: STRING);
begin
  FoTABELA := Value;
end;



procedure Tfrm_ger.SetiProp(const Value: TIdf_Py);
begin
  FiProp := Value;
end;

procedure Tfrm_ger.sp2Click(Sender: TObject);   //confirma
  Begin
  If iDesign <>  nil then
      Atualiza(iDesign);
  If iDesignFilho <>  nil then
      Atualiza(iDesignFilho);

  end;


procedure Tfrm_ger.Atualiza (pdesign : OODesign);   //confirma
 begin
  inherited;

      with TIdf_cs.Create(self) do
       Begin
        IDF_FORM                  :=   eTela_pai.text ;
       // IDF_UNIT                  :=   eoounit.TEXT;
        IDF_UNIT_OO               :=   eoounit.TEXT;//.TEXT;
        IDF_DIRPROJ               :=   EDIT1.TEXT;
        IDF_TABELA                :=   eTab_pai.text;
        IDF_CODIGO                :=   strtoint(IDObj.Text);;
        atu_geracao(cliente,cenario,IDF_CODIGO);
        free;
       end;
 end;



constructor OODesign.Create;
 Begin
   inherited;
   prgunit := TMemo.create(application);
 end;



procedure Tfrm_ger.Excluir1Click(Sender: TObject);
begin
 // inherited;

end;

procedure Tfrm_ger.SetiAncestor(const Value: TIdf_cs);
begin
  FiAncestor := Value;
end;

procedure Tfrm_ger.Setiparm(const Value: TIDF_pr);
begin
  Fiparm := Value;
end;


function Tfrm_ger.Preparar_Geracao : boolean;   //prepara a geração do código
var
i,j : integer;
wmens : string;
wl : integer;
s,prg,PRGORIG,WCLASS : string;
begin
  inherited;
   If ObjDir = '' then   //diretório
    raise exception.Create('Informar o Diretório do projeto');
   If RightSTR(ObjDir,1) = '\' then
      ObjDir := leftstr(ObjDir,length(ObjDir)-1);
   If not DirectoryExists(ObjDir) then
     CreateDir(ObjDir);
   //copia arquivos
   If not FileExists(ObjDir+'\basetier.pas') then
      xCopyFile(ProgDir,ObjDir,'basetier.pas','basetier.pas');
   If not FileExists(ObjDir+'\db_tier.pas') then
      xCopyFile(ProgDir,ObjDir,'db_tier.pas','db_tier.pas');
   If not FileExists(ObjDir+'\cad_stand.pas') then
      xCopyFile(ProgDir,ObjDir,'cad_stand.pas','cad_stand.pas');
   If not FileExists(ObjDir+'\cad_stand.dfm') then
     xCopyFile(ProgDir,ObjDir,'cad_stand.dfm','cad_stand.dfm');
   If not FileExists(ObjDir+'\frm_primar.dfm') then
      xCopyFile(ProgDir,ObjDir,'frm_primar.dfm','frm_primar.dfm');
   If not FileExists(ObjDir+'\frm_primar.pas') then
     xCopyFile(ProgDir,ObjDir,'frm_primar.pas','frm_primar.pas');
   If not FileExists(ObjDir+'\pd_tier.pas') then
     xCopyFile(ProgDir,ObjDir,'pd_tier.pas','frm_prim.pas');
   If not FileExists(ObjDir+'\bst_basefrm.pas') then
     xCopyFile(ProgDir,ObjDir,'bst_basefrm.pas','bst_basefrm.pas');
   If not FileExists(ObjDir+'\bst_basefrm.dfm') then
      xCopyFile(ProgDir,ObjDir,'bst_basefrm.dfm','bst_basefrm.dfm');
   If not FileExists(ObjDir+'\datatier.pas') then
      xCopyFile(ProgDir,ObjDir,'datatier.pas','datatier.pas');
end;

function Tfrm_ger.Checa_arquivos (iDesign : OODesign;pPrgOrig : string) : boolean;   //prepara a geração do código
var
i,j : integer;
wmens : string;
wl : integer;
s,prg,PRGORIG,WCLASS : string;

 Begin
   If iDesign.oounit {ObjNameOO} = '' then
    raise exception.Create('Informar o nome da Camada de Objetos de Negócio');
   idesign.PrgUnit.Lines.Clear;
   If fileexists(Objdir+ '\'+iDesign.oounit+'.pas') then
     begin
      wMens := AnsireplaceStr(Mens145,'&',ObjDir + '\'+iDesign.oounit+'.pas');
      //verifica se o a arquivo existe......
      If MessageDlg(wmens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
        begin
          deletefile(ObjDir + '\'+iDesign.oounit+'.pas') ;
          idesign.PrgUnit.lines.LoadFromFile(ProgDir + pPRGORIG) ;
        end
      else
         //...usa o atual...
         idesign.PrgUnit.lines.LoadFromFile(ObjDir + '\'+iDesign.oounit+'.pas')
     end
   else
     Begin
       idesign.PrgUnit.lines.LoadFromFile(ProgDir + pPRGORIG) ;
       idesign.PrgUnit.lines.saveToFile(ObjDir +'\'+ iDesign.oounit+'.pas');
     end;


   //verifica se o objeto já existe....
   If Localiza_Objeto(idesign.PrgUnit,wMarc[1]+'o'+iDesign.Classe+'}',0) = -1 then
    begin
      If MessageDlg(def23+'o'+iDesign.Classe+ def24+#13+def25, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
         Gerar_ClasseOO (iDesign)
    end
    else  //... já existe
      Begin
        wMens := AnsireplaceStr(Mens140,'&','o'+iDesign.Classe);
        If MessageDlg(wMens, mtConfirmation,[mbYes, mbNo], 0)= mrYes then
         Begin
           Deleta_Classe(iDesign);
           Gerar_ClasseOO(iDesign);
         end;
      end;

 end;


function Tfrm_ger.Gerar_ClasseOO (oDesign : OODesign) : boolean;
var                             { gera os comandos sql para o CRUDE}
wmemoo : Tmemo;
wcod : integer;
oo : TIdf_cs;
begin
  inherited;
  try
    //verificar se classe oo já existe  , senão cria..
    OO := TIdf_Cs.create(self);
    If OO.get_ObjectByNome(Cliente,Cenario,odesign.Classe) = 0 then
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
     // OO.IDF_OBJETIVO := 'Objeto de negócio da Classe '+NOMEDD;
      OO.IDF_DIRETORIO := '';
      OO.IDF_DESIGNACAO := odesign.Classe;
      OO.IDF_DEL := '';
      OO.Inclui;
      //.. e criar as properties
      Get_prop(OO.IDF_CODIGO);
     end;

    idad.fClient.first;
    Gera_OO(oDesign,idad);

    If oDesign.prgunit.lines.count > 0 then
        oDesign.prgunit.lines.saveToFile(ObjDir + '\' + odesign.oounit+'.pas')

  finally
  end;
end;  



// deleta classe no DD  e OO
function Tfrm_ger.Deleta_Classe(odesign : OODesign) : Tmemo;
var                                   // delete declaracoa da funçào pFuncaoa específica
i,j,begCont,Lin_Ini,Lin_fim,k,m: integer;
wnom : string;
wUnitOOback : TStringList;

 Begin
 wUnitOOBack := TstringList.create;
 try
  try
      wnom   := 'O'+uppercase(odesign.Classe); 
      oDesign.PRGUNIT.Lines.LoadFromFile(ObjDir + '\' + oDesign.oounit+'.pas');
      wUnitOOBack.AddStrings(oDesign.PRGUNIT.lines);    //salva

      j := 1;
      While j <= 7 do
        begin
        K := Localiza_Objeto (oDesign.PrgUnit,wMarc[j] + WNom+'}',0) ; //posiciona na linha  da Classes
        If k >= 0 then
          Begin
           Lin_ini := K;
           K := Localiza_Objeto (oDesign.PrgUnit,wMarc[j+1] + WNom+'}',0) ; //posiciona na linha  da Classes
           If (k >=0) and (k >= Lin_ini) then
             Begin
               Lin_Fim := K;
               for i := Lin_Fim Downto Lin_Ini do
                  oDesign.PrgUnit.Lines.Delete(i);
               If oDesign.PrgUnit.lines.count > 0 then
                  oDesign.PrgUnit.lines.saveToFile(ObjDir + '\' + odesign.oounit+'.pas')  ;
             end;
          end
        else
          Raise Exception.create('Código não pode ser atualizado! Foi Alterado Manualmente! Classe '+wnom+ '  '+wmarc[j]);
        
        j := j + 2;
        end;
  except
    wUnitOOBack.saveToFile(ObjDir +'\'+ oDesign.oounit+'.pas');
    raise;
  end;
 finally
  odesign.PRGUNIT.Lines.LoadFromFile(ObjDir + '\' + oDesign.oounit+'.pas');
  wUnitOOBack.free;
 end;
 end;


procedure Tfrm_ger.SetObjDir(const Value: string);
begin
  FObjDir := Value;
end;

procedure Tfrm_ger.SetObj(const Value: string);
begin
  FObj := Value;
end;

procedure Tfrm_ger.SetObjName(const Value: string);
begin
  FObjName := Value;
end;

procedure Tfrm_ger.Setidad(const Value: Tdad);
begin
  Fidad := Value;
end;


procedure Tfrm_ger.SetNOMEDD(const Value: STRING);
begin
  FNOMEDD := Value;
end;


procedure Tfrm_ger.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  Consiste_Pai;
  ProgDT;
  sp2Click(nil);
  If (Tipo.ItemIndex = 0) and (Nivel.ItemIndex = 0) then
     Begin
       idesign.Tip := 0  ;
       If iDesignFilho = nil then
         raise exception.create('Criar o Filho antes!');
       Gera_tela(iDesign,iDesignFilho);
     end
  else
     Begin
       If (Tipo.ItemIndex = 0) and (Nivel.ItemIndex = 1) then
         idesignFilho.tip := 1
       else
        idesignFilho.tip := Tipo.ItemIndex;
       Gera_tela(iDesignFilho,nil);
     end;



 // memo1.Visible := true;
end;

procedure Tfrm_ger.Gera_tela(oDesign,oDesignFilho : OODesign);
var
i,Lin_ini : integer;
ws : string;
begin
  inherited;

  FORM_NAME := 'FRM_'+ oDesign.Tela ;
  NOME_UNIT :=  oDesign.Tela+'.PAS';
  NOME_DFM  :=  oDesign.Tela+'.DFM';

  If wlist = nil then
    wList := Tstringlist.Create;
    wlist.Clear;
    oDesign.PrgUnit.Lines.clear;
    oDesign.PrgUnit.Lines.loadfromfile(PROGDIR+'\FORM0.PAS');
    oDesign.PrgUnit.Lines.Delete(0);
    oDesign.PrgUnit.lines[0] := 'unit '+ leftstr(NOME_UNIT,LENGTH(NOME_UNIT)-4)+';';

    oDesign.PrgUnit.Text := Replacestr(oDesign.PrgUnit.Text,'TForm3 = class(TForm)','T'+
                             form_name +' = class(TCAD_STAND)');
    oDesign.PrgUnit.Text := Replacestr(oDesign.PrgUnit.Text,'Form3',form_name);
    oDesign.PrgUnit.Text := Replacestr(oDesign.PrgUnit.Text,'TForm3','T'+form_name);
    oDesign.PrgUnit.Lines.SAVETOFILE(OBJDIR+'\'+NOME_UNIT);

   { cria DFM}
    wList.loadfromfile(PROGDIR+'\FORM0.DFM');
    wlist[0] := 'inherited '+ form_name +' : T'+form_name;
    wlist[1] := 'Color = 14145495';
    Lin_ini := Localiza_objeto(wList,'Caption',0);
    If Lin_ini >= 0 then
      wList[lin_ini] := 'Caption = '+''''+oDesign.Tela+'''';
    wList.SAVETOFILE(OBJDIR+'\'+NOME_DFM);

   Carrega_edit(oDesign,'M');        //cria os tedits e tlabels;
                         // coloca o nome da unit de classes no use;
   If odesign.Tip = 0 then   //pai
      Begin
        Cria_VarGrid(odesign);   // cria campos do grid detalhe no form Master
        Cria_monta_cab(odesign,oDesignFilho); // criação cabeçalho do grid detalhe
        Cria_Mostra_Contatos(odesign,oDesignFilho); // criação proc mostra contatos
        Cria_GridClick(oDesign,oDesignFilho); // criação click do grid detalhe
        Cria_ObjetoDet(odesign,oDesignFilho); //cria classe do objeto detalhe
        Altera_detail(oDesign,oDesignFilho);  // cria move Foeign Key
        altera_use(oDesign);
      end
    else
     altera_use(oDesign);

   Cria_property (oDesign) ;         //cria property para objetop de negócio
   Cria_OOMap(oDesign); ;            //cria property para popular as properties do Objeto de negócio
   Cria_create(oDesign);             //  cria o create do objeto no formcreate;
   Cria_close(oDesign);              //  cria o close do objeto no formcreate;
   Cria_Show(oDesign) ;              // Cria método onShow
   Cria_Confirma(oDesign);           //  cria o método de Confirmação
   Cria_Consiste(odesign);          //  cria o método de consistencia
   Cria_MostraCampos(oDesign);      //  cria oo método que popula os tedit a partir dos atributos da TABELA
   Cria_DataClose(odesign,'d_');    // Cria o método para colocar a data do Datetimepicker no tedit;
   Cria_del(odesign);               // Cria o método de deleção;
   Cria_loadConstant(oDesign);       // Cria a funcção de carga das constatntes de idiomas
end;

function Tfrm_ger.Cria_loadConstant(odesign : OOdesign) : boolean;
 var
 wleft,wtop,i,j,wtaborder,dt,Lin_ini,Lin_end,wpos,Linha: integer;
//// ws: string;
// wCode,wtxt,wDom : TstringList;
 Begin

 //  If not idad.Get_dados(odesign.tabel) then
 //     Raise exception.create(def27+odesign.tabel+def271);
   oDesign.PrgUnit.lines.loadfromfile(OBJDIR+'\'+NOME_UNIT);
  // salva_cpo(idad);
  // wList.loadfromfile(OBJDIR+'\'+NOME_DFM);
 //  odesign.PrgUnit.Lines.clear;
  // oDesign.prgunit.lines := wlist;
   Lin_ini := 0;
   wText.Clear;
   Lin_end :=  oDesign.PrgUnit.lines.count-1;
   wtext.add('procedure Tfrm_'+odesign.Tela+'.Loadconstantobj;');
   wtext.add('   begin');
   wtext.add('       caption :=   '+''''+''+''''+';');
   for j := 0 to length(aCpo) - 1 do
    begin   
    If Editavel(j) then
      begin
       If (aTipo[j] = 'D') or (aTipo[j] = 'M' ) then
         wtext.add('     l_'+ formataCampo(aCpo[j]+'.Caption := ','B',50,'R')+''''+''+''''+' ;')
       else
         wtext.add('       '+ formataCampo(aCpo[j]+'.EditLabel.Caption := ','B',50,'R')+''''+''+''''+' ;')
      end;
   end;


  { idad.fclient.first;
    while not idad.fclient.eof do
     begin
        If ((idad.fclient.fieldbyname('IDF_VISIBLE').asstring <> '') and
              (uppercase(idad.fclient.fieldbyname('IDF_VISIBLE').asstring) <> 'N') ) OR
              (idad.fclient.fieldbyname('IDF_PK').asinteger > 0 )then
               Begin
                If (uppercase(idad.fClient.FieldByName('IDF_DATA_TYPE').AsString) = 'D') or
                 (uppercase(idad.fClient.FieldByName('IDF_DATA_TYPE').AsString) = 'M') then
                    wtext.add('     l_'+ formataCampo(idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+'.Caption ','B',50,'R')+' :=  '+''''+''+''''+' ;')
                else
                    wtext.add('     '+ formataCampo(idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+'.EditLabel.Caption ','B',50,'R')+' :=  '+''''+''+''''+' ;');

               end;
       idad.fClient.next;
     end;    }
      wtext.add('   end;');
    Insere_bloco(oDesign.PrgUnit,0,lin_end,wtext.text,false,FALSE);
    oDesign.PrgUnit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
 end;


function Tfrm_ger.Cria_OOMap(oDesign : OODesign): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt,wtipo,wpk : string;

 Begin
   wtext.clear;
   oDesign.PrgUnit.lines.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   wtext.add('{ Popula os campos do Objeto de negócio com os edit da tela} ');
   wtext.add('procedure T'+FORM_NAME +'.ooMap;') ;
   wtext.add('{Início OOMAP}  ');
   wtext.add(' begin');

   for j := 0 to length(aCpo) - 1 do
    begin

    wtxt :=  formataCampo('(iObj as o'+oDesign.Classe+').'+trim(aCpo[j]),'B',50,'R') ;
    If Editavel(j) then
      begin
      If (aTipo[j] = 'C')  then
          wtext.add('   '+wtxt+':= self.'+acpo[j]+'.text;')
       else
       If (aTipo[j] = 'I') then
         begin
          wtext.add('    If self.'+acpo[j]+'.text = '+ ansiquotedstr('',chr(39))+' then');
          wtext.add('      '+ wtxt+ ' := 0 ' ) ;
          wtext.add('    else');
          wtext.add('      '+wtxt+':= StrtoInt(self.'+acpo[j]+'.text);');

          If ((aPk[j] = '1')) then
             wtext.add('   (iObj as o'+oDesign.Classe+').ID'+       '  := (iObj as o'+oDesign.Classe+').'+acpo[j]+';');
         end
      else
      If aTipo[j] = 'N' then
         begin
           wtext.add('    If self.'+acpo[j]+'.text = '+ ansiquotedstr('',chr(39))+' then');
           wtext.add('      '+ wtxt+ ' := 0' );
           wtext.add('    else');
           wtext.add('   '+wtxt+':= StrToFloat(self.'+acpo[j]+'.text);') ;
         end

      else
      If aTipo[j] = 'D' then
        wtext.add('   '+wtxt+':= Strtodate(self.'+acpo[j]+'.text);')
      else
      If aTipo[j] = 'M' then
         wtext.add('   '+wtxt+':= self.'+acpo[j]+'.text;')
      end;

   end;
   wtext.add(' end;');
   wtext.add('{Fim OOMAP}  ');
   Insere_bloco(oDesign.PrgUnit,0,odesign.PrgUnit.Lines.Count-1,wtext.text,false,FALSE);
   oDesign.PrgUnit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
end;


function Tfrm_ger.Carrega_edit(odesign : OOdesign;pTipo : string) : boolean;
 var
 wleft,wtop,i,wtaborder,dt,Lin_ini,Lin_end,wpos,Linha: integer;
 ws: string;
 wCode,wtxt,wDom : TstringList;
 Begin
   wtxt := TStringList.create;
   wDom := TStringList.create;
   If not idad.Get_dados(odesign.tabel) then
    Raise exception.create(def27+odesign.tabel+def271);
   Salva_cpo(idad); //ativar
   If (tipo.itemindex = 0) and (nivel.itemindex = 0)  then //e master
      aCpoMast      := aCpo;

   wList.loadfromfile(OBJDIR+'\'+NOME_DFM);
   prg_unit.Lines.clear;
   prg_unit.lines := wlist;
   wtaborder := 0;
   Lin_ini := 0;
   wText.Clear;

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
             If (uppercase(idad.fClient.FieldByName('IDF_DATA_TYPE').AsString) = 'D') or
                 (uppercase(idad.fClient.FieldByName('IDF_DATA_TYPE').AsString) = 'M') then
                  Begin
                     wtext.add('   object '+''+'l_'+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': Tlabel');
                     If idad.fclient.fieldbyname('IDF_CAPTION').asstring = '' then
                        wtext.add('     caption = '+''''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+'''')
                     else
                        wtext.add('     caption = '+''''+idad.fclient.fieldbyname('IDF_CAPTION').asstring+'''');
                     wtext.add('     Height = 13');
                     wtext.add('     Width = 32');
                     wtext.add('     Top = '+''+inttostr(wtop)+'');
                     wtext.add('     Left = '+''+inttostr(wleft)+'');
                     wtext.add('   end');
                  end;


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

             If (idad.fClient.FieldByName('IDF_DOMINIO').Value <> null) { or
                (idad.fClient.FieldByName('IDF_TIPODOMINIO').AsString = 'A')} then
             begin
             If ((trim(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and
                (uppercase(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)')){ OR
                (idad.fClient.FieldByName('IDF_TIPODOMINIO').AsString = 'A')} then
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

                 Monta_dominio(odesign,wDom,'c_'+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring);
                end;
             end;

             { monta Tedits}
             If uppercase(idad.fclient.fieldbyname('IDF_DATA_TYPE').asstring) = 'M' then
                wtext.add('object '+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': Tmemo')
             else
                 Begin
                  wtext.add('object '+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': TlabelEdEdit');
                  wtext.add('EditLabel.caption = '+''''+idad.fclient.fieldbyname('IDF_CAPTION').asstring+'''');
                 end;

             wtext.add('Left = '+''+inttostr(wleft)+'');
             wtext.add('Top = '+''+inttostr(wtop)+'');
             wtext.add('Width = 121');
             wtext.add('Height = 21');
             wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
             wtext.add('BorderStyle = bsNone');
             wtext.add('Color = 13224393');

             If (idad.fClient.FieldByName('IDF_DOMINIO').Value <> null)  then
             begin
               If (trim(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(idad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
                  wtext.add('     ReadOnly = TRUE ');
             end;
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
                     // wkeymaster :=  idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring;
                    end;
               end;

             wtext.add('end');
             If (idad.fClient.FieldByName('IDF_TIPODOMINIO').AsString = 'A') then //tabela = aberto
                   Begin
                     wtext.add('object c_'+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+' : TComboBox');
                     wtext.add('Left = '+''+inttostr(wleft)+'');
                     wtext.add('Top = '+''+inttostr(wtop)+'');
                     wtext.add('Width = 145');
                     wtext.add('Height = 21');
                     wtext.add('ItemHeight = 17');
                     wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
                     wtext.add('OnCloseUp = CmbClose');
                     wtext.add('end');

                     wtext.add('object s_'+''+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring+''+': TLabelEdEdit');
                     wtext.add('Left = '+''+inttostr(wleft)+'');
                     wtext.add('EditLabel.caption = '+''''+idad.fclient.fieldbyname('IDF_CAPTION').asstring+'''');
                     wtext.add('Top = '+''+inttostr(wtop)+'');
                     wtext.add('Width = 121');
                     wtext.add('Height = 21');
                     wtext.add('TabOrder = '+''+inttostr(wtabOrder)+'');
                     wtext.add('BorderStyle = bsNone');
                     wtext.add('Color = 13224393');
                     wtext.add('end');
                     Monta_dominio(odesign,wDom,'c_'+idad.fclient.fieldbyname('IDF_DESIGNACAO').asstring);
                   end;


               Begin
                wtop := wtop + 50;
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
    //showmessage(wlist.Text);
    wList.SAVETOFILE(OBJDIR+'\'+NOME_DFM);
    wDom.free;

 end;

function Tfrm_ger.Cria_Property(oDesign : OODesign): boolean;
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
  oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
  Lin_ini := Localiza_objeto(oDesign.PrgUnit,'private',0);
  for j := 0 to length(aCpo) - 1 do
       Begin

        If Editavel(j) then
         Begin
           If (aTipo[j] = 'C') or (aTipo[j] = 'N') or (aTipo[j] = 'I') then
              Begin
                wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : TlabelEdEdit;') ;
                If aDominio[j] = 'A' then  //domínio aberto
                   Begin
                    wtext.add('     c_'+formataCampo(acpo[j],'B',35,'R')+' : TComboBox;') ;
                    wtext.add('     s_'+formataCampo(acpo[j],'B',35,'R')+' : TlabelEdEdit;') ;
                   end;
              end

           else
           begin
             If aTipo[j] = 'M' then
                wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : TMemo;');
             If aTipo[j] = 'D' THEN
             Begin
               inc(dt);
               s := 'D_'+aCpo[j];
               wtext.add('     '+formataCampo(s,'B',35,'R')+' : TDateTimePicker;');
               wtext.add('     '+formataCampo(acpo[j],'B',35,'R')+' : TlabelEdEdit;')
             end;
             wtext.add('     '+formataCampo('L_'+acpo[j],'B',35,'R')+' : Tlabel;');
           end;
         end;
       end;
   Insere_bloco(oDesign.PrgUnit,0,Lin_ini,wtext.text,false,FALSE);
   oDesign.prgunit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);


 // antes do private
   wtext.clear;
   oDesign.PrgUnit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(oDesign.PrgUnit,'private',0);
   If Lin_ini > -1 then
    begin
       wtext.add('     procedure FormCreate (sender : TObject);');
       wtext.add('     procedure FormClose (Sender: TObject; var Action: TCloseAction);');
       wtext.add('     procedure FormShow (Sender: TObject);');
       wtext.add('     procedure DateClose(sender : Tobject);');
       If Localiza_objeto(oDesign.prgunit,'{Início CmbClose}',0) >=0 then
          wtext.add('     procedure CmbClose(sender : Tobject);');
       wtext.add('     procedure sp2click(Sender: TObject);');
       //wtext.add('     procedure spb_delClick(sender : TObject);');
       wtext.add('     procedure Loadconstantobj; override;');
       If odesign.Tip = 0 then   //pai
          Begin
             wtext.add('     Procedure Monta_cab ;override;');
             wtext.add('     Procedure Mostra_Contatos ;override;');
             wtext.add('     Procedure Abre_Det(Sender: TObject);override; ');
          end;

       Insere_bloco(oDesign.PrgUnit,0,Lin_ini,wtext.text,false,FALSE);
       oDesign.PrgUnit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
    end;

    // após o private
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;
   Lin_ini := Localiza_objeto(oDesign.prgunit,'private',0);

   wtext.add('     function  consiste : boolean;override;');
   wtext.add('     procedure ooMap;override;');
   Insere_bloco(oDesign.prgunit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   oDesign.prgunit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;

   // após o published
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(oDesign.prgunit,'published',0);
   wtext.add('     property iObj; ');
   wtext.add('     function  Mostra_Campos : boolean;override;');
  // wtext.add('     procedure Mostra_Objeto(pNome : string);');
   Insere_bloco(oDesign.prgunit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   oDesign.prgunit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);

   //combos
    oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
    wtext.Clear;
   Lin_ini := Localiza_objeto(oDesign.prgunit,'T'+form_name +' = class(TCAD_STAND)',0);

    odad :=Tdad.create(self);
    odad.CLI_ID := cliente;
    oDad.PRJ_ID := Cenario;
    If not odad.Get_dados(oDesign.Tabel) then
      Raise exception.create(def27+odesign.Tabel+def271);
    odad.fclient.first;
   while not odad.fclient.eof do
     Begin

     If (idad.fClient.FieldByName('IDF_DOMINIO').Value <> null)  then
      begin
        If (trim(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(odad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
           wtext.add('     C_'+formataCampo(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring,'B',35,'R')+' : TComboBox;');
      end;
        odad.fclient.next;
     end;
   Insere_bloco(oDesign.prgunit,Lin_ini+1,0,wtext.text,TRUE,FALSE);
   oDesign.prgunit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
   odad.free;
end;

procedure Tfrm_ger.alteraUses;   //master/detail
var
Lin_ini : integer;
begin
// após o published
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(prg_unit,'uses',0);
   wtext.Clear;
   wtext.add(' Aligrid, ');
   Insere_bloco(prg_unit,Lin_ini,0,wtext.text,TRUE,FALSE);
   prg_unit.Lines.saveToFile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Insert_code(pLinhaFim : integer;pText,pCode : TstringList) : TStringList;   //insere código no dfm
var
i,lin_fim : integer;
 begin
  lin_fim := pLinhaFim ;
  for i := ptext.Count -1 downto 0  do
     pCode.Insert(Lin_Fim,pText[i]);
   result := pCode;
 end;

function Tfrm_ger.Cria_GridClick(oDesign,oDesignFilho : OODesign) : boolean; //cria procedure de click do grid detalhe
var
i,lin_ini,lin_fim,lin_proc,Lin_end,wqt: integer;
wtit,wcpo : string;
 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);

   begin
    wInserttext.Clear;
    wInserttext.Add('     {Início click Grid - Master/detail}  ') ;
    wInserttext.Add('procedure TFrm_'+oDesign.Tela +'.Abre_det;') ;   //somente master
    wInserttext.Add(' var');
    wInserttext.Add('  wpk : variant;');
    wInserttext.Add('  i : integer;');
    wInserttext.Add('  Begin');
    wInserttext.Add('   Inherited;');
    wInserttext.Add('   If Frm_'+oDesignFilho.Tela+' = nil then     ');
    wInserttext.Add('      Frm_'+oDesignFilho.Tela +' := TFrm_'+oDesignFilho.Tela+'.create(self);   ');

    wInserttext.Add('   Frm_'+   oDesignFilho.Tela+'.grid_cont.visible := false; ');
    wInserttext.Add('   Frm_'+   oDesignFilho.Tela+'.sp_print.visible := false;  ');
    wInserttext.Add('   Frm_'+   oDesignFilho.Tela+'.panel1.visible := false;  ');
    wInserttext.Add('   Frm_'+   oDesignFilho.Tela+'.Type_Form := 1;    //simples = detail ');
    wInserttext.Add('   Frm_'+   oDesignFilho.Tela+'.Key_master := self.Key_Detail; ');


    wInserttext.Add('   If (sender as TObject) is TSpeedButton then  ');
    wInserttext.Add('      Frm_'+oDesignFilho.Tela+'.sp_insertClick(nil)  ');
    wInserttext.Add('   else            ');
    wInserttext.Add('      Begin    ');
    wInserttext.Add('        If grid_cont.Objects[0,grid_cont.row] <> nil then   ');
    wInserttext.Add('           Begin    ');
    wInserttext.Add('              wpk := TPK(grid_cont.Objects[0,grid_cont.row]).pk1 ; ');
    wInserttext.Add('              Frm_'+ oDesignFilho.Tela+'.Key_detail := wpk; ');
    wInserttext.Add('              Frm_'+ oDesignFilho.Tela+'.Mostra_Objeto(wpk); ');
    wInserttext.Add('           end;     ');
    wInserttext.Add('      end;     ');

    wInserttext.Add('     Frm_'+oDesignFilho.Tela+'.showmodal;   ');
    wInserttext.Add('     Mostra_Contatos; ');
    wInserttext.Add('  end;     ') ;
    wInserttext.Add('     {fim click Grid - Master/detail}');
    wInserttext.Add('') ;
     Insere_bloco(odesign.prgunit,lin_ini,oDesign.prgunit.Lines.Count,wInserttext.text,FALSE,FALSE);
     oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

  end;
end;

function Tfrm_ger.Cria_Mostra_contatos (odesign,oDesignFilho : OODesign): boolean; //cria procedure de montagem do cabeçalho do grid detalhe
var
i,lin_ini,lin_fim,lin_proc,Lin_end,wqt: integer;
wtit,wcpo : string;
 Begin
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
  wInserttext.Add('     {Mostra Contatos - Master/detail}  ') ;
  wInserttext.Add('     procedure TFrm_'+oDesign.Tela +'.Mostra_Contatos;') ;   //somente master
  wInserttext.Add('     var      ') ;
  wInserttext.Add('     i : integer;  ') ;
  wInserttext.Add('     begin       ') ;
  wInserttext.Add('       inherited; ') ;
  wInserttext.Add('       Limpa_grid(Grid_cont);') ;
  wInserttext.Add('       iFilhos           := o'+oDesignFilho.Classe+'.create; ') ;
  wInserttext.Add('       iFilhos.ListaGrid := Grid_cont;    ') ;
  wInserttext.Add('       iFilhos.GetDetailsGrid('+''''+oDesign.PK+''''+',strtoint(iObj.Getitem(lb)))') ;
  wInserttext.Add('     end;  ') ;
  wInserttext.Add('     {fim Mostra COntatos - Master/detail}');
  wInserttext.Add('') ;
  Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,FALSE,FALSE);
  oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Cria_Monta_Cab(odesign,oDesignFilho : OODesign) : boolean; //cria procedure de montagem do cabeçalho do grid detalhe
var
i,lin_ini,lin_fim,lin_proc,Lin_end,wqt: integer;
wtit,wcpo : string;
 Begin
   odesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('             {Monta Grid - Master/detail}  ') ;
   wInserttext.Add('procedure TFrm_'+oDesign.Tela +'.Monta_cab;  ') ;
   wInserttext.Add(' var    ') ;
   wInserttext.Add(' i : integer;   ') ;
   wInserttext.Add('   begin;  ') ;
   wInserttext.Add('    Inherited;  ') ;
   wInserttext.Add('    grid_cont.ColCount := length(cCaption); ') ;
   wInserttext.Add('    for i := 0 to length(ccaption)-1 do  ') ;
   wInserttext.Add('     begin  ') ;
   wInserttext.Add('       grid_cont.Objects[i,0] := TProp.create; ') ;
   wInserttext.Add('       grid_cont.Cells[i,0]   := cCaption[i];  ') ;
   wInserttext.Add('       (grid_cont.Objects[i,0] as TProp).nomecampo := cCampos[i];') ;
   wInserttext.Add('     end;  ') ;
   wInserttext.Add('   end;  ') ;
   wInserttext.Add(' {fim Monta Grid - Master/detail}');
   wInserttext.Add('') ;
   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,FALSE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Cria_VarGrid(odesign : OODesign) : boolean; //cria as constantes do do form Master
var
i,lin_ini,lin_fim,lin_proc,Lin_end,wqt: integer;
wtit,wcpo : string;
 Begin

   for i := 0 to sg.colcount - 1 do
     Begin
       wtit := wtit+ansiquotedstr(sg.cells[i,0],CHR(39));
       If i < sg.ColCount -1 then
         wtit := wtit + ','
       else
         wtit := wtit + ');' ;
       wCpo := wCpo+ansiquotedstr(sg.cells[i,1],CHR(39));
       If i < sg.ColCount -1 then
         wCpo := wCpo + ','
       else
         wCpo := wCpo + ');' ;
     end;
   odesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(oDesign.prgunit,'var',0);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('{definição dos campos a mostrar no grid (master-detail)}') ;
   wInserttext.Add('const');
   wInserttext.Add('cCampos  : array [0..'+inttostr(sg.colcount - 1)+'] of string = ('+wCpo) ;
   wInserttext.Add('cCaption  : array [0..'+inttostr(sg.colcount - 1)+'] of string = ('+wTit) ;
   wInserttext.Add(' {fim definição dos campos a mostrar no grid (master-detail)}');
   wInserttext.Add('') ;
   Insere_bloco(oDesign.prgunit,0,lin_ini,wInserttext.text,FALSE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Cria_ObjetoDet (oDesign,oDesignFilho : OODesign): boolean; //cria clase do objeto detalhe (MASTER ONLY)
var
i,lin_ini,lin_fim,lin_proc,Lin_end,wqt: integer;
wtit,wcpo : string;
 Begin
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(odesign.prgunit,'published',0);
   wInserttext.Clear;

   wInserttext.Add('     property iFilhos : o'+ oDesignFilho.Classe+' read FoContato write SetoContato;');
   Insere_bloco(oDesign.prgunit,lin_ini,oDesign.prgunit.Lines.Count,wInserttext.text,TRUE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(oDesign.prgunit,'private',0);
   wInserttext.Clear;
   wInserttext.Add('     FoContato: o'+oDesignFilho.Classe+';');
   Insere_bloco(oDesign.prgunit,lin_ini,oDesign.prgunit.Lines.Count,wInserttext.text,TRUE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure TFrm_'+odesign.Tela +'.SetoContato(const Value: o'+oDesignFilho.Classe+');');
   wInserttext.Add('begin  ');
   wInserttext.Add('  FoContato := Value;  ');
   wInserttext.Add('end; ');
   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,FALSE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   Lin_ini := Localiza_objeto(oDesign.prgunit,'public',0);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('      procedure SetoContato(const Value: o' +oDesignFilho.Classe+');');
   Insere_bloco(oDesign.prgunit,0,lin_ini,wInserttext.text,FALSE,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

end;


function Tfrm_ger.Cria_Create(oDesign : OODesign) : boolean;
var
i,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;
 Begin
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormCreate(Sender: TObject);') ;
   wInserttext.Add('var') ;
   wInserttext.Add(' wdir,wfile,P1,P2: string;') ;
   wInserttext.Add(' wbd : TstringList;') ;
   wInserttext.Add('  begin') ;
   wInserttext.Add('    Type_Form := '+ inttostr(odesign.tip)+';') ;
   wInserttext.Add('   inherited;') ;
  { wInserttext.Add('   wBd := TstringList.create;') ;
   wInserttext.Add('   wFile := '+''''+'\'+oDesign.tela+''''+' ;') ;
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

   winserttext.add('   wbd.free;');  }
   for i := 0 to length(aTabRef)-1 do
     Begin
       If aDominio[i] = 'A' then
         Begin
             wInserttext.Add('  with o'+aTabRef[i]+'.create do ');
             wInserttext.Add('     Begin    ');
             wInserttext.Add('       PopulaCombo (c_'+aCpo[i]+'); ');
             wInserttext.Add('       free; ');
             wInserttext.Add('     end;  ') ;
         end;
     end;

   winserttext.add('   iObj := o'+oDesign.Classe+ '.create;');
   wInserttext.Add(' end;') ;
   wInserttext.Add('') ;
   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,false,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Cria_Close(oDesign : OODesign) : boolean;
var
i,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;

 Begin
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormClose(Sender: TObject; var Action: TCloseAction);');
   wInserttext.Add('  begin;') ;
   wInserttext.Add('   Inherited;');
   wInserttext.Add('  '+FORM_NAME +' := nil;');
   wInserttext.Add('   action := cafree;');
   wInserttext.Add(' end;') ;
   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,false,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;

function Tfrm_ger.Cria_Show(oDesign : OODesign) : boolean;
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
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);

   wInserttext.Clear;
   wInserttext.Add('') ;
   wInserttext.Add('procedure T'+FORM_NAME +'.FormShow(Sender: TObject);');
   wInserttext.Add('  begin') ;
   wInserttext.Add('   Inherited;');
   //carrega combos com dominios
   If not oDad.Get_dados(oDesign.Tabel) then
    Raise exception.create(def27+oDesign.Tabel+def271);
   oDad.fclient.first;
   while not oDad.fclient.eof do
     Begin
      If (idad.fClient.FieldByName('IDF_DOMINIO').Value <> null)  then
       begin
        If (trim(oDad.fClient.FieldByName('IDF_DOMINIO').Value) <> '') and (uppercase(oDad.fClient.FieldByName('IDF_DOMINIO').Value) <> '(MEMO)') then
          Begin
            pDom.Text := oDad.fClient.FieldByName('IDF_DOMINIO').Value;
            wInserttext.Add('        c_'+oDad.fClient.FieldByName('IDF_DESIGNACAO').asstring+'.clear;');

            for j := 0 to pDom.Count - 1 do
             Begin
               wInserttext.Add('        c_'+oDad.fClient.FieldByName('IDF_DESIGNACAO').asstring+'.items.add('+''''+pdom[j]+''''+');');
             end;
          end;
        end;
      oDad.fclient.next;
     end;
   wInserttext.Add(' end;') ;
   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,false,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
   pdom.Free;
   oDad.Free;

end;


function Tfrm_ger.Cria_DataClose(oDesign : OOdesign;pPref : string) : boolean;
var
j : integer;
s : string;
 Begin
   oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
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

   Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wInserttext.text,false,FALSE);
   oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

end;

function Tfrm_ger.Monta_dominio(odesign : OOdesign;pDom : TstringList;pNome : string) : boolean;
var                        //monta os combos apra atributis com domminios fechados
j,lin_ini : integer;
s : string;
odad : Tdad;
 Begin
   prg_unit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   If LOcaliza_objeto(prg_unit,'{Início CmbClose}',0) < 0 then
   begin
     wInserttext.Clear;
     wInserttext.Add('{Início CmbClose}') ;
     wInserttext.Add('procedure T'+FORM_NAME +'.CmbClose(sender : TObject);');
     wInserttext.Add('  begin') ;
     wInserttext.Add('   inherited;') ;
     wInserttext.Add('        ');

    //closeup dos combos
    odad :=Tdad.create(self);
    odad.CLI_ID := cliente;
    oDad.PRJ_ID := Cenario;
     If not odad.Get_dados(oDesign.tabel) then
      Raise exception.create(def27+oDesign.tabel+def271);
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
        end
       else
       If (trim(odad.fClient.FieldByName('IDF_TIPODOMINIO').asstring) = 'A') then
         Begin
            pNome := 'C_'+Uppercase(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring);
            pDom.Text := odad.fClient.FieldByName('IDF_DOMINIO').ASSTRING;
            wInserttext.Add('  If UpperCase(TComboBox(sender as Tobject).name) = '+''''+pNome+''''+' then ');
            wInserttext.Add('    begin ');
            wInserttext.Add('      with  TComboBox(sender as Tobject) do ');
            wInserttext.Add('        begin');
            wInserttext.Add('          If itemIndex >= 0 then');
            wInserttext.Add('             begin');
            wInserttext.Add('               s_'+Uppercase(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring)+'.Text    := Items[itemIndex];');
            wInserttext.Add('              '+Uppercase(odad.fClient.FieldByName('IDF_DESIGNACAO').asstring)+'.Text := inttostr(Tpk(Items.Objects[itemIndex]).PK1);');
            wInserttext.Add('               exit;');
            wInserttext.Add('             end');
            wInserttext.Add('       end;');
            wInserttext.Add('   end; ');
         end;
        odad.fclient.next;
       end;

     wInserttext.Add('  end; ') ;
     wInserttext.Add('{Fim CmbClose}') ;
     Insere_bloco(prg_unit,0,prg_unit.Lines.Count,wInserttext.text,false,FALSE);
     prg_unit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
     odad.free;
   end;
end;




function Tfrm_ger.Cria_Confirma(oDesign : OODesign) : boolean;
var
ini,fim,i : integer;
S : STRING;
 Begin
   oDesign.PrgUnit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
   wtext.Clear;
   wtext.add(' ');

   wtext.add('procedure T'+FORM_NAME +'.sp2click(Sender: TObject);');
   wtext.add('  Begin  ');
   wtext.add('   inherited;');
   wtext.add('   If Status = '+ansiquotedstr('I',CHR(39))+' then');
   wtext.add('      begin' );
   wtext.add('        If iObj.ID > 0 then //gravou novo ');
   wtext.add('        begin ');
   wtext.add('          iObj.PK.PK1  := iObj.ID;' );
   If Tipo.ItemIndex in [0,2]   then // comlistbox
   begin
       i := Get_InfoCPO(odesign.NomeLista);
       If i >=0 then
         Begin
          If In_Array(aTipo[i],wInteiro) >= 0 then
              Begin
                wtext.add('          lb.ItemIndex := lb.Items.AddObject(Inttostr((iObJ as '+'o'+oDesign.Classe+').'+oDesign.NomeLista+'),iObj.PK);' );
                s      := '          lb.Items[lb.ItemIndex] := Inttostr((iObJ as '+'o'+oDesign.Classe+').'+oDesign.NomeLista+');';
              end
          else
              Begin
                wtext.add('          lb.ItemIndex := lb.Items.AddObject((iObJ as '+'o'+oDesign.Classe+').'+oDesign.NomeLista+',iObj.PK);' );
                s      := '          lb.Items[lb.ItemIndex] := (iObJ as '+'o'+oDesign.Classe+').'+oDesign.NomeLista+';';

              end;
         end;
       wtext.add('          Mostra_objeto(StrToInt(iObj.Getitem(lb))); ');
   end;
   wtext.add('          Status := '+''''+'M'+''''+';' );
   wtext.add('        end;' );
   wtext.add('      end' );
   wtext.add('   else ');
   wtext.add(s);
    wtext.add(' end;');
   wtext.add('  ');

   Insere_bloco(prg_unit,0,oDesign.prgunit.Lines.Count,wtext.text,false,FALSE);
   odesign.PrgUnit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);

   end;



function Tfrm_ger.Cria_del(odesign : OODesign) : boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo : string;
 Begin
  odesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
  wtext.Clear;
  wtext.add('  ');
  wtext.add('{Evento do Elimina}');
  //wtext.add('procedure T'+FORM_NAME +'.spb_delClick(Sender: TObject)'+';');
  wtext.add('  begin');
  wtext.add('    inherited;');
  wtext.add('  end;');
  wtext.add('  ');
  Insere_bloco(odesign.prgunit,0,oDesign.prgunit.Lines.Count,wtext.text,false,FALSE);
  odesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;


function Tfrm_ger.Cria_MostraCampos(oDesign : OODesign): boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws,wcpo,wtxt,wtipo,WOBJ  : string;

 Begin
   wtext.clear;
   odesign.PrgUnit.Lines.loadfromfile(OBJDIR+'\'+NOME_UNIT);
   wObj := '(iObj as o'+oDesign.Classe+')';
   wtext.add('{ Popula os campos Edit com os atributos da TABELA} ');
   wtext.add('function T'+FORM_NAME +'.Mostra_Campos : boolean;') ;
   wtext.add(' begin');
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
      If aDominio[j] = 'A' then
        Begin
            wtext.add('   '+''+' with o'+aTabRef[j]+'.Create do ');
            wtext.add('       '+''+'Begin');
            wtext.add('          '+''+'Load(strtoint(self.'+acpo[j]+'.text)); ');
            wtext.add('          '+''+'self.'+'s_'+aCpo[j]+'.Text := '+odesign.GetAtributoLista(aTabRef[j])+';');
            wtext.add('      '+''+' end;');
        end;

     // free;

   end;
   wtext.add(' end;');
   wtext.add('  ');
   Insere_bloco(oDesign.PrgUnit,0,oDesign.PrgUnit.Lines.Count,wtext.text,false,FALSE);
   oDesign.PrgUnit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;



function Tfrm_ger.Altera_detail(oDesign,oDesignFilho : OODesign): boolean;
var
Lin_ini,Lin_Fim,Lin : integer;
 Begin
  If fileexists(ObjDir + '\'+odesignFilho.Tela+'.pas') then
  begin
    oDesign.prgunit.Lines.LoadFromFile(ObjDir + '\'+odesignFilho.Tela+'.pas');
    Lin_ini := Localiza_objeto(oDesign.prgunit,'{Fim OOMAP}',0);
  //  Lin_ini := Localiza_objeto(oDesign.prgunit,'(iObj as O'+e_classeDT.text+').ddmap',0);
    If Lin_ini >=0 then
     Begin
       wtext.Clear;
       wtext.add(' (iObj as O'+oDesignFilho.Classe+').'+oDesign.PK+' := Key_master;');
       wtext.add(' '+oDesign.PK+'.text := InttoStr(Key_master);');
       Insere_bloco(oDesign.prgunit,0,Lin_ini,wtext.text,FALSE,FALSE);
       oDesign.prgunit.Lines.saveToFile(ObjDir + '\'+odesignFilho.Tela+'.pas');
     end
   else
     showmessage('procedure T'+odesignFilho.Tela +'.ooMap;'+' - '+'(altera_det)'+'- não encontrado');
  end;
 end;


function Tfrm_ger.Editavel(pIndex : integer): boolean;
begin
 result := false;
 If ( (aVisible[pIndex] <> '')  and (uppercase(aVisible[pIndex]) <> 'N') ) OR    // é visivel...
    ( (aPk[pIndex] <> '') AND ( aPk[pIndex] <> '0') ) then         // .. ou é PK.
     result := true;
end;


{function Tfrm_ger.Cria_Edit(pPreflab,pprefdate : string) : boolean;  //declara os tipos dos componentes no programa
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
   wList.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;  }

function Tfrm_ger.Cria_Limpa(pFunc : string) : boolean;
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


function Tfrm_ger.Cria_Consiste(oDesign : OODesign) : boolean;
var
i,j,lin_ini,lin_fim,lin_proc,Lin_end: integer;
ws : string;

 Begin
    oDesign.prgunit.Lines.LoadFromFile(OBJDIR+'\'+NOME_UNIT);
    wtext.Clear;
    wtext.add(' ');
    wtext.add('{ Consiste Obrigatoriedade dos Campos antes da Inclusão ou Atualização} ');
    wtext.add('function T'+FORM_NAME +'.Consiste : boolean;');
    wtext.add(' begin');
    wtext.add('   inherited;');
    wtext.add('   result := true;');
    for j := 0 to length(aCpo) - 1 do
      begin
          If (aObrig[j]<> '') and (uppercase(aVisible[j])<> '') and ( (apk[j] = '0') or (apk[j]= '') ) then  // campos Obrigatorios
            Begin
              wtext.add('    If '+''+'self.'+aCpo[j]+''+'.text'+' =' +''''+''+''''+' then ');     //campo obrigatorio
              wtext.add('         raise exception.create('+''''+'Informar o campo '+aCaption[j]+''''+');');
            end;
      end;
    wtext.add(' end;');
    wtext.add('');
    Insere_bloco(oDesign.prgunit,0,oDesign.prgunit.Lines.Count,wtext.text,false,FALSE);
    oDesign.prgunit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
end;




function Tfrm_ger.altera_use(odesign : OODesign) : boolean;
var
i,lin_ini,lin_fim: integer;
ws : string;

 Begin
   odesign.prgunit.lines.loadfromfile(OBJDIR+'\'+NOME_UNIT);
    //acrscenta nome da unit de objetos no uses principal
   for i := 0 to  odesign.prgunit.lines.count -1 do
    Begin
     ws := trim(odesign.prgunit.lines[i]);
     If pos('uses', ws) > 0 then
       Lin_ini := i;

     If pos('type', ws) > 0 then
      Begin
         Lin_fim := i-1;
         break;
      end;

    end;
    i := Lin_fim;
    while i >= Lin_ini do
     Begin
       ws := trim(odesign.prgunit.lines[i]);
       If ws = '' then
        i := i -1
       else
        Begin
          odesign.prgunit.lines[i] := leftstr(ws,length(ws)-1)+','+ oDesign.oounit+','+'baseTier'+';';
           break;
        end;

     end;
    oDesign.PrgUnit.Lines.Savetofile(OBJDIR+'\'+NOME_UNIT);
 end;

procedure Tfrm_ger.Setform_name(const Value: string);
begin
  Fform_name := Value;
end;

procedure Tfrm_ger.SetNOME_DFM(const Value: STRING);
begin
  FNOME_DFM := Value;
end;

procedure Tfrm_ger.SetNOME_UNIT(const Value: STRING);
begin
  FNOME_UNIT := Value;
end;

procedure Tfrm_ger.SetPROGDIR(const Value: STRING);
begin
  FPROGDIR := Value;
end;

procedure Tfrm_ger.SetwList(const Value: TStringList);
begin
  FwList := Value;
end;

procedure Tfrm_ger.SetwText(const Value: TStringList);
begin
  FwText := Value;
end;

procedure Tfrm_ger.SetNOMEOO(const Value: string);
begin
  FNOMEOO := Value;
end;

procedure Tfrm_ger.SetObjNameOO(const Value: string);
begin
  FObjNameOO := Value;
end;


procedure Tfrm_ger.sp_verooClick(Sender: TObject);
begin
  inherited;

  If FileExists(ObjDir+'\'+eOOUNit.text+'.pas') then
    Begin
      If frm_log = nil  then
        frm_log := Tfrm_log.create(self);
        frm_log.Panel1.Visible := false;
       // frm_log.BorderIcons := [biSystemMenu];
        frm_log.Caption := 'Objetos de Negócio';
        frm_log.Memo1.lines.LoadFromFile(ObjDir+'\'+eOOUNit.text+'.pas');
      frm_log.showmodal;
     end;
end;


procedure Tfrm_ger.LoadConstantObj;
begin
inherited ;

 { Caption := 'Classes'   ;
  Label1.Caption := 'Nome da Classe '  ;
  Label2.Caption := 'Descrição ' ;
  Label3.Caption := 'Classe mãe' ;
  Label10.Caption := 'Tabela '  ;
  SpeedButton11.Caption := 'Lista  '  ;
  SpeedButton7.Caption := 'Propriedades'   ;
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
  SpeedButton6.Caption := 'Salvar'  ;
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
  rg.items[1]     :=  'Master/Detail'    ;    }

end;



procedure Tfrm_ger.aScroll(Dataset: Tdataset);
begin

end;

procedure Tfrm_ger.ddmap_atrib(dataset: Tdataset);
begin

end;



procedure Tfrm_ger.Deleta_Funcao(pObjeto: string);
begin

end;

procedure Tfrm_ger.Delete_class(pObjeto, pFuncao: string);
begin

end;

procedure Tfrm_ger.Get_prop(pClasse: integer);
begin

end;


procedure Tfrm_ger.SetNOMETELADETAIL(const Value: STRING);
begin
  FNOMETELADETAIL := Value;
end;

procedure Tfrm_ger.SetNOMETELAMASTER(const Value: STRING);
begin
  FNOMETELAMASTER := Value;
end;

procedure Tfrm_ger.SetCenario(const Value: integer);
begin
  FCenario := Value;
end;

procedure Tfrm_ger.SetCliente(const Value: integer);
begin
  FCliente := Value;
end;

procedure Tfrm_ger.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure Tfrm_ger.SetClasse(const Value: string);
begin
  FClasse := Value;
end;

procedure GetDir(PDir: Pointer);
begin
  If frm_diretorio = nil then
     frm_diretorio := TFrm_Diretorio.CreateDir(PDir, application);
  frm_diretorio.ShowModal;

end ;

procedure Tfrm_ger.BT1Click(Sender: TObject);
var
ExDir : string;
begin
  inherited;

  GetDir(@(ExDir));
  If ExDir <> '' then
  begin
     edit1.Text := Exdir;
     If not DirectoryExists (Edit1.text) then
        CreateDir(Edit1.text);
       ObjDir         := edit1.Text;
  end;
end;





procedure Tfrm_ger.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_ger.ProgDT;   //// pega o diretórtio do Preprg
var
i,j : integer;
 Begin
    PROGDIR        :=  ExtractFileDir(application.ExeName);
    If fileexists(ProgDir+ '\preprg\bst_unit.pas' ) then
       PROGDIR := ProgDir+ '\preprg'
    else
      begin
       wmens := AnsireplaceStr(Mens144,'&', 'bst_unit.pas');
       wmens := AnsireplaceStr(wmens,'#', ProgDir+ '\preprg');
       Raise exception.create(wmens);
      end;
 end;

procedure Tfrm_ger.Consiste_Pai;
 Begin
  If edit1.text  =  '' then
     Begin
      activeControl := edit1;
      raise exception.create('Informar Diretório do Projeto');
     end;

  If eTela_pai.text = '' then
     Begin
      activeControl := eTela_pai;
      raise exception.create('Informar o Nome da tela ');
     end;

  If eClasse_pai.text = '' then
     Begin
      activeControl := eClasse_pai;
      raise exception.create('Informar Nome Classe de Objetos de Negócio');
     end;

  If ENomeLista.text  = '' then
    Begin
       raise exception.create('O Atributo Pai a ser Listado deve ser Informado (Verifique as Propriedades da Classe) ');
     end;
     
  If eTab_pai.text  = '' then
    Begin
       raise exception.create('Tabela Indefinida ');
     end;
 end;

procedure Tfrm_ger.spbpaiClick(Sender: TObject);

begin
  inherited;
  If (Tipo.itemindex = 0) and (Nivel.itemIndex = 0) then //pai
     Begin
      iDesign := OODesign.create;
      iDesign.PopulaDD(nivel.Itemindex);
     end
   else
 //  If nivel.itemindex = 1 then //filho
     Begin
      iDesignFilho := OODesign.create;
      iDesignFilho.PopulaDD(nivel.Itemindex);
     end
   end;


function OODesign.PopulaDD(pTipo : integer): boolean;
begin
  with Tdados_tab.create(application) do
     begin
       ListaCli := frm_ger.Cliente ;
       ListaProj:= frm_ger.Cenario ;
       ListaDim := 'IDF_CS' ;
       ListaTit := def233 ;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       Listafecha:= true;
       mostra_lista;

       If ListaCodigo = 0 then
          exit
       else
         Begin
            ID           := ListaCodigo;
           frm_ger.iDados.CLI_ID  := FRM_GeR.cliente;
           frm_ger.iDados.PRJ_ID  := FRM_ger.Cenario;
           frm_ger.idados.Get_object(frm_ger.Cliente,frm_ger.Cenario,ID);
           If frm_ger.iDados.eof then
            raise exception.create('Classe não encontrada!');
           frm_ger.edit1.text       := frm_ger.iDados.fieldbyname('IDF_DIRPROJ').ASSTRING;
           frm_ger.eTela_pai.text   :=  frm_ger.iDados.fieldbyname('IDF_FORM').ASSTRING;
           frm_ger.eOOunit.text     := frm_ger.iDados.fieldbyname('IDF_UNIT_OO').ASSTRING;
           frm_ger.eTab_Pai.text    := frm_ger.iDados.fieldbyname('IDF_TABELA').ASSTRING;
           frm_ger.eClasse_pai.text := frm_ger.iDados.fieldbyname('IDF_DESIGNACAO').ASSTRING;
           frm_ger.idObj.text       := frm_ger.iDados.fieldbyname('IDF_CODIGO').ASSTRING;

           Tela         := frm_ger.eTela_pai.text;
           Classe       := frm_ger.eClasse_pai.text;
           oounit       := frm_ger.eOOunit.text;
           Tabel        := frm_ger.eTab_Pai.text;
           NomeLista    := frm_ger.eNomeLista.text;
           PrgUnit      := frm_ger.prg_unit;
           ID           := strtoint(frm_ger.idObj.text);
           GetAtributos(0);
         end;

    end;
end;

function ooDesign.GetAtributos(pTipo : integer) : boolean;   //// pega as informações da Tabela Dados para montar Array CPO
var
i,j : integer;
 Begin
      //pega atributos da tabela

       Begin
          frm_ger.iDad.CLI_ID := frm_ger.Cliente;
          frm_ger.idad.PRJ_ID := frm_ger.Cenario;
          If not frm_ger.idad.Get_dados(TABEL) then
            exit;
         Salva_Cpo(frm_ger.idad);
          i := 0;
          j := 0 ;
          while not frm_ger.idad.Eof do
            Begin
              If  uppercase(frm_ger.idad.fieldbyname('IDF_VISIBLE').asstring) = 'S' then
                Begin
                  frm_ger.sg.Cells[j,i] := frm_ger.idad.fieldbyname('IDF_CAPTION').asstring ;
                  frm_ger.sg.Cells[j,i+1] := frm_ger.idad.fieldbyname('IDF_DESIGNACAO').asstring ;
                  inc(j);
                  If j > frm_ger.sg.ColCount then
                    frm_ger.sg.ColCount := frm_ger.sg.ColCount +1 ;
                end;
              frm_ger.idad.Next;
            end;
          pk := get_Chave;

          frm_ger.iProp         := TIdf_pY.Create(application);
          frm_ger.iProp.CLI_ID  :=  frm_ger.cliente;
          frm_ger.iProp.PRJ_ID  :=  frm_ger.Cenario;
          frm_ger. iProp.Get_AtribLista(frm_ger.cliente,frm_ger.Cenario ,Id);
          frm_ger.enomeLista.Text := frm_ger.iProp.fieldbyname('IDF_DESIGNACAO').asstring;
          NOMELISTA          := frm_ger.enomeLista.Text;
          frm_ger.pk_pai.Text := PK;
          frm_ger.iProp.free;
       end;

 end;

function ooDesign.GetAtributoLista(pTabela : string) : string;   //// devolve aatributo Lista
var
i,j,wid : integer;
 Begin
      //pega atributos da tabela

       Begin
          with TIdf_cs.Create(application) do
           Begin
            wid := Get_ObjectByNOme(frm_ger.Cliente ,frm_ger.Cenario,pTabela);
            free;
           end;
          frm_ger.iProp         := TIdf_pY.Create(application);
          frm_ger.iProp.CLI_ID  :=  frm_ger.cliente;
          frm_ger.iProp.PRJ_ID  :=  frm_ger.Cenario;
          frm_ger. iProp.Get_AtribLista(frm_ger.cliente,frm_ger.Cenario ,wId);
          result := frm_ger.iProp.fieldbyname('IDF_DESIGNACAO').asstring;
          frm_ger.iProp.free;
       end;
 end;



procedure Tfrm_ger.SetClasseDT(const Value: string);
begin
  FClasseDT := Value;
end;

procedure Tfrm_ger.SetIDDT(const Value: integer);
begin
  FIDDT := Value;
end;

procedure Tfrm_ger.SetoTABELADT(const Value: STRING);
begin
  FoTABELADT := Value;
end;

procedure Tfrm_ger.SetNOMEOODT(const Value: STRING);
begin
  FNOMEOODT := Value;
end;

procedure Tfrm_ger.SetObjetoDT(const Value: STRING);
begin
  FObjetoDT := Value;
end;

procedure Tfrm_ger.SetObjNameDT(const Value: STRING);
begin
  FObjNameDT := Value;
end;

procedure Tfrm_ger.SetObjNameOODT(const Value: STRING);
begin
  FObjNameOODT := Value;
end;

procedure Tfrm_ger.SetNOMEDDDT(const Value: STRING);
begin
  FNOMEDDDT := Value;
end;


procedure Tfrm_ger.sgDblClick(Sender: TObject);
begin
  inherited;
  If sg.row > 0 then
    sg.RemoveCol(sg.Col); 
end;

procedure Tfrm_ger.SetNOMELISTA(const Value: STRING);
begin
  FNOMELISTA := Value;
end;

procedure Tfrm_ger.SetMASTER(const Value: BOOLEAN);
begin
  FMASTER := Value;
end;



procedure Tfrm_ger.SetWKEYMASTER(const Value: STRING);
begin
  FWKEYMASTER := Value;
end;

procedure Tfrm_ger.SetTELA(const Value: string);
begin
  FTELA := Value;
end;


procedure Tfrm_ger.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Consiste_Pai ;
  ProgDT;
  sp2Click(nil);
  Preparar_geracao;
  If (Tipo.ItemIndex = 0 ) and (nivel.ItemIndex = 0 ) then
     Checa_arquivos(iDesign,'\pd_tier.pas')
  else
     Checa_arquivos(iDesignFilho,'\pd_tier.pas')
end;


procedure Tfrm_ger.SetoTABELAFILHO(const Value: STRING);
begin
  FoTABELAFILHO := Value;
end;

{ OODesign }




procedure OODesign.SetClasse(const Value: string);
begin
  FClasse := Value;
end;


procedure OODesign.SetClasseId(const Value: integer);
begin
  FClasseId := Value;
end;

procedure OODesign.SetClassFilho(const Value: string);
begin
  FClassFilho := Value;
end;

procedure OODesign.SetIDPai(const Value: integer);
begin
  FIDPai := Value;
end;

procedure OODesign.SetNomeLista(const Value: string);
begin
  FNomeLista := Value;
end;

procedure OODesign.Setoounit(const Value: string);
begin
  Foounit := Value;
end;

procedure OODesign.SetPK(const Value: string);
begin
  FPK := Value;
end;

procedure OODesign.SetPrgUnit(const Value: TMemo);
begin
  FPrgUnit := Value;
end;

procedure OODesign.SetTabela(const Value: string);
begin
  FTabela := Value;
end;


procedure OODesign.SetTela(const Value: string);
begin
  FTela := Value;
end;

procedure Tfrm_ger.Setidesign(const Value: OODesign);
begin
  Fidesign := Value;
end;

procedure Tfrm_ger.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   If FileExists(ObjDir+'\'+eTela_Pai.text+'.pas') then
    Begin
      If frm_log = nil  then
        frm_log := Tfrm_log.create(self);
        frm_log.Panel1.Visible := false;
       // frm_log.BorderIcons := [biSystemMenu];
        frm_log.Caption := 'Tela';
        frm_log.Memo1.lines.LoadFromFile(ObjDir+'\'+eTela_Pai.text+'.pas');
      frm_log.showmodal;
     end;
end;

procedure Tfrm_ger.TipoClick(Sender: TObject);
begin
  inherited;
  case tipo.ItemIndex of
   0 :  Begin
          gbpai.visible := true;
          nivel.Visible := true;
          nivel.ItemIndex := -1;
        end;
   1,2 :Begin
         gbpai.visible := true;
         nivel.ItemIndex := 0;
         nivel.Visible := false;
         gbdet.Visible := false;
        end;
  end;
end;

{ OODesignFilho }
             

procedure Tfrm_ger.SetiDesignFilho(const Value: OODesign);
begin
  FiDesignFilho := Value;
end;

procedure Tfrm_ger.Edit1Change(Sender: TObject);
begin
  inherited;
  ObjDir := edit1.Text;
end;

procedure OODesign.SetTip(const Value: integer);
begin
  FTip := Value;
end;

procedure Tfrm_ger.NivelClick(Sender: TObject);
begin
  inherited;
  If (Tipo.ItemIndex = 0) and (nivel.itemIndex = 0)  then
    gbDet.Visible := true
  else
  If (Tipo.ItemIndex = 0) and (nivel.itemIndex = 1)  then
    gbDet.Visible := false;
end;

procedure OODesign.SetTABREF(const Value: string);
begin
  FTABREF := Value;
end;

end.

