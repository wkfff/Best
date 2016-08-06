unit bst_dg;

interface


     // nào usar link 10,11,12,13 ja usados para connectar objetos dentro de objetos
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, AxCtrls, StdCtrls, FileCtrl, ExtCtrls, Menus,
  Buttons, ComCtrls,Db,DbTables, Mask, DBCtrls, Activex,AddFlow3Lib_TLB,
  ImgList, PRNFLOWLib_TLB, QRExport,QuickRpt, TPCProgressBars, gtQrCtrls;


type
  Tfrm_dg = class(TForm)
    m_menu: TMainMenu;
    Arquivos1: TMenuItem;
    Imprimir1: TMenuItem;
    Editar1: TMenuItem;
    Pan_ger: TPanel;
    Pan_Alinh: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    spy: TSpeedButton;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    EntPop: TPopupMenu;
    Edit1: TEdit;
    Label1: TLabel;
    Preferencias1: TMenuItem;
    Objetos1: TMenuItem;
    L_NODE: TListBox;
    L_CLI: TListBox;
    L_ID: TListBox;
    Edit2: TEdit;
    Novodiagrama1: TMenuItem;
    Salvar1: TMenuItem;
    pan_proc: TPanel;
    SpeedButton18: TSpeedButton;
    SpeedButton21: TSpeedButton;
    spb_jo: TSpeedButton;
    SpeedButton23: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    Abrir1: TMenuItem;
    Grid1: TMenuItem;
    Ajustar1: TMenuItem;
    TamanhoNormal1: TMenuItem;
    cd: TColorDialog;
    SpeedButton31: TSpeedButton;
    SpeedButton33: TSpeedButton;
    N1: TMenuItem;
    cfg: TMenuItem;
    pan_use: TPanel;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton47: TSpeedButton;
    Edit5: TEdit;
    Edit6: TEdit;
    SpeedButton37: TSpeedButton;
    SpeedButton39: TSpeedButton;
    pan_org: TPanel;
    SpeedButton40: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton46: TSpeedButton;
    Edit7: TEdit;
    Edit8: TEdit;
    SpeedButton44: TSpeedButton;
    SpeedButton50: TSpeedButton;
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
    Edit9: TEdit;
    Edit10: TEdit;
    pan_dpn: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    spp: TSpeedButton;
    SpeedButton19: TSpeedButton;
    Pan_Inf: TPanel;
    SpeedButton68: TSpeedButton;
    SpeedButton70: TSpeedButton;
    sp1: TSpeedButton;
    Edit11: TEdit;
    Edit12: TEdit;
    sp2: TSpeedButton;
    sp3: TSpeedButton;
    pop1: TPopupMenu;
    Espessura1: TMenuItem;
    Cor1: TMenuItem;
    Estilo1: TMenuItem;
    SpeedButton22: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton48: TSpeedButton;
    popcli: TPopupMenu;
    Novo1: TMenuItem;
    Editar2: TMenuItem;
    Excluir1: TMenuItem;
    N3: TMenuItem;
    SpeedButton41: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton64: TSpeedButton;
    SpeedButton69: TSpeedButton;
    SpeedButton71: TSpeedButton;
    SpeedButton72: TSpeedButton;
    SpeedButton73: TSpeedButton;
    SpeedButton74: TSpeedButton;
    SpeedButton75: TSpeedButton;
    SpeedButton76: TSpeedButton;
    PopNode: TPopupMenu;
    Abrir2: TMenuItem;
    Executar1: TMenuItem;
    Propriedades1: TMenuItem;
    PopLink: TPopupMenu;
    Lista1: TMenuItem;
    Lista2: TMenuItem;
    N6: TMenuItem;
    Propriedades2: TMenuItem;
    N7: TMenuItem;
    Atrs1: TMenuItem;
    Frente1: TMenuItem;
    SpeedButton42: TSpeedButton;
    SpeedButton49: TSpeedButton;
    Estmulo1: TMenuItem;
    SpeedButton12: TSpeedButton;
    ltree: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton17: TSpeedButton;
    spb_ajuste: TSpeedButton;
    spb_normal: TSpeedButton;
    BitBtn1: TBitBtn;
    pb: TPCProgressBar;
    SpeedButton7: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton45: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton77: TSpeedButton;
    Selecionar1: TMenuItem;
    SpeedButton78: TSpeedButton;
    SpeedButton79: TSpeedButton;
    SpeedButton80: TSpeedButton;
    SpeedButton81: TSpeedButton;
    SpeedButton82: TSpeedButton;
    Imagem1: TMenuItem;
    IncluiImagem1: TMenuItem;
    AjustaImagemaEntidade1: TMenuItem;
    PopLiv: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    SpeedButton83: TSpeedButton;
    Edit13: TEdit;
    Edit14: TEdit;
    SpeedButton84: TSpeedButton;




    FUNCTION Novo_Diag(pNomeDiag : string; pNome_nivel : string) : Boolean;
    procedure restaura_variaveis;
    procedure Salva_variaveis;
    procedure WMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
    function Procura_tipo_Rel(pRel : afLink) : string;
    function Procura_tipo_Ent(pEntity : afNode) : string;
    procedure Trata_Entity(pEnt : afNode; pMouse : integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WDblClick(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject); //ENTIDADE
    procedure WEntityAdded;
    function  WRelationAdded :boolean;
    procedure WClickRelation;   //Click relation

    procedure SpeedButton17Click(Sender: TObject);
    procedure WClick(Sender: TObject);
    procedure Objetos1Click(Sender: TObject);
    procedure WKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Function  Salvar : Boolean;
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure Abaixo(pEntity : afNode);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Acima;
    procedure SpeedButton15Click(Sender: TObject);
    procedure Lista1Click(Sender: TObject);
    procedure Propriedades2Clic(Sender: TObject);
    procedure sp_oiClick(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure fgridStyle;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure spb_ajusteClick(Sender: TObject);
    procedure spb_normalClick(Sender: TObject);
    procedure Ajustar1Click(Sender: TObject);
    procedure TamanhoNormal1Click(Sender: TObject);
   // procedure tvDblClick(Sender: TObject);
    function  Alinha(pTipo : integer) : boolean;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure EntPopPopup(Sender: TObject);
    procedure WFillColor(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sppClick(Sender: TObject);
    procedure Atualiza_entity;
    procedure FonteEntidades1Click(Sender: TObject);
    procedure FonteFluxodeDados1Click(Sender: TObject);
    procedure CorEntidades1Click(Sender: TObject);
    procedure CorFluxodeDados1Click(Sender: TObject);
    procedure ImprimirrDocumentao1Click(Sender: TObject);
    procedure ImprimirAP(pCod : integer;pEnt :afNode);
    procedure ImprimirDG;
    procedure Wpicture(Sender: TObject);
    procedure Wtexto(Sender: TObject);
    procedure Mostra_detalhe(pTree : TtreeView);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
   // procedure Ajuste1Click(Sender: TObject);
    procedure Ajusta1(Sender: TObject);
    procedure Ajusta2(Sender: TObject);
    Procedure AddPic(pPos : integer);
    procedure Inclui_arvore(pDesc : string;pCompl : string;pWbs : string) ;
    procedure Deleta_Ativ(pNode : afnode);
    procedure stat_salvou(psalv : boolean);
    procedure BordaCor(sender : Tobject);
    procedure wespess(sender : TObject);
    procedure wstyle(sender : TObject);
    procedure CorFonte(sender : Tobject);
    procedure wfrente(sender : TObject);
    procedure WSeta(sender : TObject);
    procedure ExportarcomoBMP1Click(Sender: TObject);
    procedure ImprimirRN(pCod : integer;pEnt :afNode);
    procedure WExecutar(sender : TObject);
    procedure Percorre(pNode : TTreeNode);
    procedure ImprimirDoc ;
    procedure ImprimirUC(pCod : integer;pEnt :afNode;pTipo : integer);
    procedure WExport(pCod : integer;pEnt : afNode;pNom : string;pRel : TQuickRep);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Cria_Sub(pNode : afNode;pCria : Boolean);
    procedure Ajusta_Seta(pLink : afLink);
    Procedure cria_Junction(pNode : afNode);
    procedure Del_Junction(pNode : afNode ; pLink : afLink);
    procedure Abrir2Click(Sender: TObject);
    procedure Propriedades1Click(Sender: TObject);
    procedure Propriedades2Click(Sender: TObject);
    procedure Executar1Click(Sender: TObject);
    procedure Atrs1Click(Sender: TObject);
    procedure Frente1Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    Procedure cria_Atv(pNode : afNode);
    Procedure delete_Atv_fisico(pNode : afNode);
    procedure poe_ator(pNode : afNode;pAtor : string);
    procedure poe_wbs(pNode : afNode;pwbs : string);
    Function  Atrib_Link(pLink : afLink;pDiag : string) : boolean;
    procedure cfgClick(Sender: TObject);
    procedure spyClick(Sender: TObject);
    procedure Estmulo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Procura_Pai(pNode : TTreeNode);
    procedure Deleta_Dg(pLink : afLink);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Selecionar1Click(Sender: TObject);
    procedure SelTudo(sender : TObject);
    procedure Ator1Click(Sender: TObject);
    procedure IncluiImagem1Click(Sender: TObject);
    procedure AjustaImagemaEntidade1Click(Sender: TObject);
    procedure AjustaEntidadeaImagem1Click(Sender: TObject);
    procedure Salva_Diag(pNome : string;pCli : integer;
                             pProj : integer; PIdg : integer;
                             pmae : integer; pClass : string;pPai : integer);
    procedure FormDeactivate(Sender: TObject);
    procedure ImprimirEN(pCod : integer;pEnt :afNode);
    procedure ImprimirDados;
    procedure ImprimirEE(pCod : integer;pEnt :afNode);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    { Private declarations }
  public
    { Public declarations }
  end;
type
  udado = ^Tdado;
  Tdado = record
     FCodigo: integer;
     fCli   : integer;
     fCliNOme : string;
     fProj  : integer;
     fprojNome : string;
end;
type
  uProc = ^TProc;
  TProc = record
     FCodigo: integer;
     fCli   : integer;
     fCliNOme : string;
     fProj  : integer;
     fprojNome : string;
end;

var
  frm_dg: Tfrm_dg;
  wl : integer;
  DIAG ,Diag_Limpo: TAddFlow  ;
  Proc_atu : string;
  //WDiag_Nome : string;
  dg_nivelant   :  integer;
  dg_idgant     :  integer;
  dg_Cliant     :  integer;
  dg_Projant    :  integer;
  dg_subidant   :  integer;
  dg_nomenivelant : string;
  dg_maeant     : integer;
  dg_paiAnt     : integer;
  dg_AvoAnt     : integer;
  dg_Classant   : string;
  Wnivel,Wstyl : integer;
  Wcod : integer;
  x,waj,WtotDelSel : integer;
  Wwcli ,Wwproj,wwidg,wwsub : integer;
  Wdesc : string;
  ind,IndTop,IndCli : TTreeNode;
  WNodeAtual : TTreeNode;
  WTextEntitySelected : afNode;
  i,j,Cli_ant: integer;

  AidIn : array[0..100] of integer;
  
  wAcod : TstringList;
  Wtipo : string;
  WTmouse : integer ;       //1 : Left doubleClick
                            //2 : Right doubleClick
                            //3 : Right Click
                            //4 : Left Click
  Wmdbl : integer;                          
  mProc : uProc;
  bt_Inf : integer;
  WNome_JU : string;
  WtipoBotao : integer;
  top_ant,height_ant,width_ant,left_ant : integer;
  WnodeWidth_ant ,WNodeheight_ant : real ;
  Creat : Boolean;
  WListDg,Wlist,WListAt : TstringList;
  JaDg,JaAt: boolean;
  Kdg ,Kat: integer;
implementation

uses bst_main;


{$R *.DFM}
procedure Tfrm_dg.WMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
begin
   If Shift = [ssright] then
    begin
      If diag.selNodes.count > 0 then   { DONE -oyves -c5.13 : Inserção de Imagem nas entidades. }
         begin
           If Wclass_dg = 'LIV'  then
              diag.Popupmenu := popliv
           else
              diag.Popupmenu := popnode ;
         end     
      else
      If diag.selLinks.count > 0 then
         begin
           If (Wclass_dg = 'DMI') or (Wclass_dg = 'LIV') then    //    { DONE -oyves -c5.12 : As linhas de relacionamento do DMI não permite acesso a Lista
              poplink.Items[0].caption := ''
           else
              poplink.Items[0].caption := 'Lista';
           diag.Popupmenu := popLink  ;
         end
         
      else
         diag.PopupMenu := EntPop;
      exit;
    end;
   If diag.selectedNode <> nil then
    begin
       WnodeWidth_ant  := diag.SelectedNode.Width;
       WNodeheight_ant := diag.SelectedNode.height;
    end;
end;



procedure Tfrm_dg.WMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
Act,i : LongInt;
Wleft : single;
w ,wtotlink: integer;
WSUbNode,pNode,NodeAnt: afNode;
NOdeEsc,LinkEsc : boolean;
begin
  Act := diag.LastUserAction ;
try
  begin
  If viewer then
     exit;
    With Diag do
    begin
     Stat_Salvou(false);

     If act = afNodeCreation then
      begin
         Stat_Salvou(false);
         If Diag.SelectedNode <> nil then
            begin
              case Diag.selectedNode.Shape of     //objetos informativos
                51,62 :
                   begin          //connector
                    If (WClass_dg = 'DPN') OR (WClass_dg = 'DMI') then  //{ DONE -oyves -c5.12 : Painel de agrupamento no diagrama a DMI
                       begin
                        If Diag.selectedNode.Shape = 51 then//panel
                         begin
                           Diag.selectedNode.Transparent := true;
                           Diag.SelectedNode.Zorder := 1;
                         end;
                         exit
                       end

                    else
                    If WClass_dg = 'DUC' then  //use case DUC
                      begin
                        WentityAdded(Diag.selectedNode);
                        frm_main.Atributos(Diag.SelectedNode,1,WClass_Dg);
                        exit;
                      end;
                    end;
                61 :
                   begin
                     diag.SelectedNode.DrawColor := diag.backColor;   //texto
                     diag.selectednode.transparent := true;
                     diag.selectednode.text := 'O';
                   end;
                75 :
                    begin
                       diag.SelectedNode.DrawColor := diag.backColor;   //texto
                       diag.selectednode.transparent := true;
                    If WClass_dg = 'DPN' then
                    begin
                      If (Uppercase(Wnome_Ju) = 'SPEEDBUTTON41') then
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

              end;
              If (WClass_dg = 'DPN')  or (WClass_dg = 'DUC')
                  or (WClass_dg = 'DMI') or( WClass_dg = 'DEO')then
                 begin
                    If (diag.SelectedNode.shape = 58) or (diag.SelectedNode.shape = 15)then    //oi
                    begin

                       //Diag.selectedNode.DrawColor   := diag.BackColor;
                    end;
                    WentityAdded(Diag.selectedNode);
                    frm_main.Atributos(Diag.SelectedNode,1,WClass_dg);
                    If diag.SelectedNode.shape = 14 then    //jregra
                      begin
                        diag.SelectedNode.text := 'Regra';
                       //frm_main.Atributos(Diag.SelectedNode,1,WClass_dg);
                      end
                    else
                    If diag.SelectedNode.shape = 2 then    //junction
                       begin
                         diag.SelectedNode.DrawColor := diag.backColor;   //texto
                         diag.selectednode.transparent := true;
                         Cria_Junction(diag.SelectedNode);
                       //  frm_main.Atributos(Diag.SelectedNode,1,WClass_dg);
                       end
                    else
                    If diag.SelectedNode.shape = 50 then    //atividade
                       begin
                         Cria_atv(diag.SelectedNode);
                         frm_main.Atributos(Diag.SelectedNode,1,WClass_dg);
                       end ;
                    end;
                 end;
       Diag.SelectedNode := nil;  //atenção
      end
      else
      If act = afLinkCreation then
         begin
            Stat_Salvou(false);
            Wl := Diag.selectedLink.LinkStyle;
            case Diag.selectedLink.LinkStyle of     //objetos informativos
                13 : exit;
                 0: begin
                      If (WClass_dg = 'DUC')  or (WClass_dg = 'DMI') then
                      Begin
                        Ajusta_Seta(Diag.selectedLink);
                        exit;
                      end;
                        
                     end;
            end;

           Ajusta_Seta(Diag.selectedLink);
           If not WRelationAdded then
              raise exception.create('Conexão não criada!');
           Atrib_Link(Diag.selectedLink,WClass_dg);
         end
      else
      If act = afNodeResizing then
         begin
           frm_main.Resize_Rigid(SelectedNode);
         end;
   end;
  end;
except
  begin
    Diag.selectedLink.Marked := true;
    Diag.DeleteMarked;
    raise;
  end;
end;
end;

procedure Tfrm_dg.Ajusta_Seta(pLink : afLink);
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
          Worg.x := plink.org.left + pLink.org.width / 2;
          Worg.y :=  plink.ExtraPoints.Item[0].y + plink.Org.Height / 2 +
                    plink.Org.Height / 6;
          plink.Extrapoints.Item[tot-2] := Worg;

          Wdst :=  plink.ExtraPoints.Item[tot-1];
          Wdst.x := plink.org.left + pLink.org.width / 2;
          Wdst.y := plink.Org.top + plink.Org.height;
          plink.Extrapoints.Item[tot-1] := Wdst;

          end;
          
        end;

    5 : begin
          Worg :=  plink.ExtraPoints.Item[0];
          Worg.x := plink.Org.Left + plink.Org.Width;
          Worg.y := plink.Org.Top + plink.Org.Height / 2;
          plink.Extrapoints.Item[0] := Worg;

          Wdst :=  plink.ExtraPoints.Item[tot-1];
          Wdst.x := plink.Dst.Left;
          Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;
          plink.Extrapoints.Item[tot-1] := Wdst;
        end;
    2 : begin
          Worg   :=  plink.ExtraPoints.Item[0];
          Worg.x := plink.Org.Left + plink.Org.Width/2;
          Worg.y := plink.Org.Top + plink.Org.Height;
          plink.Extrapoints.Item[0] := Worg;

          Wdst :=  plink.ExtraPoints.Item[tot-1];
          Wdst.x := plink.Dst.Left;
          Wdst.y := plink.Dst.Top + plink.Dst.Height / 2 ;
          plink.Extrapoints.Item[tot-1] := Wdst;
        end;
    4,13 : begin           //regra de negócio

          If (pLink.Linkstyle = 4) {and( WClass_dg <> 'DPN')} then
          begin
            Worg :=  plink.ExtraPoints.Item[0];
            Worg.x := plink.Org.left + plink.Org.width/2;
            Worg.y := plink.Org.top + plink.Org.height;
            plink.Extrapoints.Item[0] := Worg;

            Wdst :=  plink.ExtraPoints.Item[tot-1];
            Wdst.x := plink.Dst.Left + plink.dst.width/2;;
            Wdst.y := plink.Dst.Top  ;
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
            //If wp1.y > diag.top + diag.height then
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


function Tfrm_dg.Procura_tipo_Ent(pEntity : afNode) : string;
Begin
   case pEntity.Shape of
     11,54,50,79 : result :='AP'  ;
     10,61 : result :='PS' ;
     9 : result :='OG' ;
     56,59 ,65: result :='EN' ;
     55 : result :='EE' ;
     0  : result :='OE' ;
     58,15 : result :='OI' ;
     2  : result :='JU' ;
     8  : result :='OC' ;
     14 : result :='RN' ;
     1  : result :='IF' ;
   end;
end;

function Tfrm_dg.Procura_tipo_Rel(pRel : afLink) : string;
Begin
   
   Case prel.LinkStyle of
   4 : result := 'RN' ;
   else
       result := 'DG' ;
   end;
end;

procedure  Tfrm_dg.Trata_Entity(pEnt : afNode; pMouse : integer); //ENTIDADE
var
Wshape : integer;
wn : string;
Begin
    WShape := Pent.Shape ;
    fromDim := false;
    Case Wshape of
    11,54,50,62,79: Begin      // 'processo_externo')'acao_processo')
             If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_PesqAp) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;
             fromtree := false;   
             If frm_ap = nil then
              frm_ap := Tfrm_ap.create(self);

              frm_ap.show;
              
            end;
    56,59,65 : begin  //'evento_negocio'
             If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_en) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;
             If frm_en = nil then
                frm_en := Tfrm_en.create(self);
             frm_en.Show;
           end ;
    58,15 : Begin
          If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oi) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;
          If frm_EV = nil then // 'objeto_interface'
            frm_ev := Tfrm_ev.create(self);
          frm_ev.caption := 'Interface';
          frm_ev.Show;
         end ;
    8 : Begin   //'objeto_controle'
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oi) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;
           If frm_ev = nil then
             frm_ev := Tfrm_ev.create(self);
           frm_ev.caption := 'Controle';
           frm_ev.Show;
         end ;

    1 : Begin         // Modelo de Informaçào
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_if) then
              begin
                  showmessage(mens4) ;
                  exit;
                end;
           If frm_if = nil then   //Modelod e informacao'
              frm_if := Tfrm_IF.create(self);
           frm_if.Show;
         end   ;

     2 : Begin
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ju) then
              begin
                  showmessage(mens4) ;
                  exit;
                end;
           If frm_juncao = nil then   //objeto_juncao'
              frm_juncao := Tfrm_juncao.create(self);
           frm_juncao.Show;
         end   ;
    55,9,53: Begin     //objeto_ator  objeto_externa  organo') then
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ca) then
              begin
                showmessage(mens4) ;
                exit;
              end;
           If frm_ca = nil then
                frm_ca := Tfrm_ca.create(self);
             frm_ca.Muda_DataSet(frm_dg);
             frm_ca.ShowModal;
           end  ;
    10,61 : Begin     //Pessoa
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ps) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;;
           If frm_Pessoa = nil then
                frm_Pessoa := Tfrm_Pessoa.create(self);
             frm_Pessoa.ShowModal;
           end  ;
    0 :  Begin   // 'objeto_entidade'
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oe) then
                begin
                  showmessage(mens4) ;
                  exit;
                end;
          If not viewer then
          Begin
          If  frm_dados    =   nil then
              frm_dados     := Tfrm_dados .Create(self);
           frm_dados .showModal;

          If WOrigemdados = 0 then
          Begin
            If frm_explor1 = nil then
             frm_explor1 := tfrm_explor1.create(self) ;

               frm_explor1.pan_esc.visible      := true;
               frm_explor1.lb_tab.visible       := true;
               frm_explor1.lb_tab.height        := frm_explor1.pgc.height - frm_explor1.pan_esc.height;

               //pesquisa Tabela
               frm_explor1.label4.visible       := true;
               frm_explor1.edit3.visible        := true;

               frm_explor1.tb_attr.tabvisible   := true;
               frm_explor1.tb_SQL.tabVISIBLE    := true;

               frm_explor1.tv.width             := frm_explor1.pan_esc.width div 2;
               frm_explor1.tv.height            := frm_explor1.pgc.height - frm_explor1.pan_esc.height;

               frm_explor1.label1.caption       := 'Tabelas : ';

               //browse Diagramas
               frm_explor1.speedbutton5.visible := false;

              frm_explor1.showmodal;
              dm2.qry_oe.edit;
              If frm_explor1.WWBot.text = '1' then
                 begin
                   dm2.qry_oe.fieldbyname('idf_designacao').asstring := frm_explor1.Edit2.text;
                   dm2.qry_oe.fieldbyname('idf_nome').asstring       := frm_explor1.Edit1.text;
                 end;
              DM2.QRY_OE.post;
              diag.SelectedNode.text := frm_explor1.Edit2.text;
           end
          else
             Begin
               If  frm_OBjetos   =   nil then
                   frm_OBjetos    := Tfrm_OBjetos.Create(self);
                frm_OBjetos.showModal;
             end;
          end;
         end  ;
    14 : Begin  // Regra'
          If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_rn) then
             begin
                  showmessage(mens4) ;
                  exit;
                end;
          If frm_regra = nil then
              frm_regra := tfrm_regra.Create(self);
          //frm_regra.procura_regra(pent.Userdata);
          frm_regra.show;
         end ;
    end;

end;

procedure Tfrm_dg.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
try
 begin
   If not viewer then
   begin
      If (frm_treeAtiv.tv.selected <> nil) and
         (frm_treeAtiv.tv.selected.level > 1)then
      begin
          case MessageDlg('Deseja salvar o Diagrama ?', mtConfirmation,
                [mbYes, mbNo], 0) of	{ produce the message dialog box }
          id_Yes: begin
                    Wlibera := 0;
                    If frm_TreeAtiv.tv.Selected.level > 1 then
                     begin
                       Salva_Diag(frm_TreeAtiv.tv.selected.text,
                                 udado(frm_TreeAtiv.tv.selected.data)^.fCli,
                                 udado(frm_TreeAtiv.tv.selected.data)^.fProj,
                                 udado(frm_TreeAtiv.tv.selected.data)^.fCodigo,
                                 0,
                                 Wclass_dg,
                                 udado(frm_TreeAtiv.tv.selected.parent.data)^.fcodigo);

                     end;
                    Stat_salvou(true);
                  end;
          id_no  : begin
                   end;

        {  id_cancel : begin

                        raise exception.create;
                      end; }

          end;
      end;

   end;

   If frm_TreeAtiv <> nil then
      frm_TreeAtiv.close;
   dg_created := false;
   frm_dg := nil;
   action := caFree;
 end;
except
  begin
    raise;
  end;
end;
end;

procedure Tfrm_dg.WDblClick(Sender: TObject);
begin
   WTmouse := 1 ;
   With Diag do
   begin
     If SelectedNode <> nil then
        begin
          case SelectedNode.Shape of
           51 : begin                    { DONE -oyves -c5.13 : Símbolo de Sub sistema no diagrama de use case }
                  If WClass_dg = 'DUC' then
                     begin
                       If frm_text = nil then
                          frm_text  := Tfrm_text.create(self);
                       frm_text.show;
                     end;
                end;

           62 : begin
                 If Wclass_dg = 'DUC' then
                    begin
                      Trata_entity(SelectedNode,0);
                      exit;
                    end;
                 If frm_conector = nil then
                    frm_conector  := Tfrm_conector.create(self);
                 frm_conector.show;
                end;
           75 : begin
                    If (SelectedNode.text = 'sim') or
                        (SelectedNode.text = 'não')   then
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
           else
              begin
               If (Wclass_dg = 'DPN')OR (Wclass_dg = 'DUC')
                     OR (Wclass_dg = 'DEO') or(Wclass_dg = 'DMI')then
                     Trata_entity(SelectedNode,0)
                else
                   begin
                     Wtexto(frm_dg);
                   end;
              end;
              
          end;
        end

     else
     If SelectedLink <> nil then
        begin

          If SelectedLink.LinkStyle = 13 then
            begin
               If frm_texto = nil then
                  frm_texto  := Tfrm_texto.create(self);
               frm_texto.show;
            end
          else
             WclickRelation ;
        end
   end;
end;

procedure Tfrm_dg.WClickRelation;   //Click relation
var
Wrel : afLink;
WentSource : afNode;
Wlink : integer;
z ,Tot : integer;
  x0,y0,x1,y1  : real;
begin
   Wrel := diag.SelectedLink;
   WEntSource   := Wrel.org;
   WEntDestination := Wrel.dst;
   WrelSelected := Wrel;
   Wlink := Wrel.LinkStyle    ;
   Case Wlink of
   2,5,6,9 : begin     //fluxo de dados
               If Wclass_dg = 'DPN' then
                begin
                 If WRel.org.Shape = 2 then  // Junction
                    exit;
                 If not frm_main.Procura_Registro(Wrel.Userdata,dm2.Qry_dg) then
                    begin
                     showmessage(mens4) ;
                     exit;
                    end;
                If frm_data = nil then
                   frm_data := tfrm_data.create(self);
                frm_data.show;
               end;
             end;
   end;
   If Diag.selectedLink.LinkStyle = 9 then
 
end;


procedure Tfrm_dg.SpeedButton18Click(Sender: TObject);
begin
  Diag.selectAction := afNoSelection;
  diag.shape        := TSpeedButton(sender as Tobject).tag;
  WNome_Ju          := Uppercase(TSpeedButton(sender as Tobject).Name);
end;

function Tfrm_dg.WRelationAdded :boolean;
var
  WRel  : afLink;
  Wentrel : afNode;
  Wstyle : integer;
  Wdst,Worg : integer;
  Wfont : IFontDisp;
  z ,Tot : integer;
  x0,y0,x1,y1  : real;
  Lp : afLinkPoint;
Begin
   result          := true;
   Wrel            := diag.SelectedLink;
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
      Case Wstyle of      { DONE -oyves -c5.13 : Conexões suplementares no DMI }
     0,2,3,5,6,7,8,9,10,11,12,13,61,79 :
          begin
             If  Wrel.Org = Wrel.Dst then
                 begin
                  wrel.marked := true;
                  diag.deletemarked;
                  exit
                 end;
             If ((Wrel.Org.shape = 2) and (Wrel.dst.shape = 1)) or
                 ((Wrel.dst.shape = 2) and (Wrel.org.shape = 1))    then // tentativa de linkar o box d emnsagem a juncao
                begin
                  wrel.marked := true;
                  diag.deletemarked;
                  exit
                end;
             If WClass_dg = 'DPN' then //use case
               begin
                 If (WentSource.shape = 65) and ((WentDestination.Shape = 11) or
                     (WentDestination.Shape IN [50,79])) then
                 begin
                   If  (WEntDestination.text ='') or(WentSource.text='') then
                        raise exception.create(Mens6);
                   frm_main.Cria_Correlacao ( WCli,WProj,
                               'AP',
                               WEntDestination.Userdata,'EN',
                               WentSource.userData,' ',0,0);
                 end;
                 Wrel.ArrowDst := 3;
               end
             else  
             If WClass_dg = 'DMI' then //Modelo de Informação
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
             end
             else
             If WClass_dg <> 'DUC' then //use case
               begin
                 Wrel.ArrowDst := 4;
               end
             else
             If WClass_dg <> 'DPN' then //Ator do diagrama
                exit;

             Wrel.UserData := frm_main.Cria_Registro(Wrel.userData,'',0,'DG',Wrel.text,WIdg);
          end;

     4,1 : Begin             //link com regra de negócio

            If (WClass_dg <> 'DPN') and (WClass_dg <> 'DUC') then
               begin
                 wrel.drawstyle := 0;
                 exit;
               end;
            If  (WEntDestination.text ='') or (WentSource.text='') then
                        raise exception.create(Mens6);
            //wrel.drawstyle := 2; //tracejado
             { DONE -oyves -c5.14 : Criada Correlação lógica entre Evento de negócio e Atividade. }
            If (Wdst in [11,50,79]) and (Worg = 14 ) then // Regra x acao_processo
                frm_main.Cria_Correlacao ( WCli,WProj,
                               'AP',
                               WEntDestination.Userdata,'RN',
                               WentSource.userData,' ',0,0);
            else
            If (Wdst in [11,50,79])  and
            ((Worg in [11,50]) or (Wdst = 79)) then  //acao_processo x acao_processo
               Begin
                 frm_main.Cria_Correlacao ( WCli,WProj,
                               'AP',
                               WEntDestination.Userdata,'AP',
                               WentSource.userData,' ',0,0);
               end
            else
            If (Wdst = 8) and (Worg = 0)  then
                 frm_main.Cria_Correlacao ( WCli,WProj,'OC',
                             WEntDestination.Userdata,'OE',
                             WentSource.userData,' ',0,0);
            else
            If (Wdst = 0) and (Worg = 8) then //objeto_controle xobjeto_entidade
               frm_main.Cria_Correlacao ( WCli,WProj,'OC',
                             WentSource.userData ,'OE',
                             WEntDestination.Userdata,' ',0,0);
            else
              If (Wdst = 58)  and (Worg = 0) THEN
                 frm_main.Cria_Correlacao ( WCli,WProj,'OI',
                             WEntDestination.Userdata,'OE',
                             WentSource.userData,' ',0,0);
            else
              If (Worg = 58)  and (Wdst = 0)  then //objeto_interface xobjeto_entidade
                 frm_main.Cria_Correlacao ( WCli,WProj,'OI',
                             WentSource.userData ,'OE',
                             WEntDestination.Userdata,' ',0,0);
            else
              If (Wdst = 58) and (Worg = 8) then //objeto_interface xobjeto_controle
                  frm_main.Cria_Correlacao ( WCli,WProj,'OI',
                             WEntDestination.Userdata,'OC',
                             WentSource.userData,' ',0,0);
            else
            If  (Wdst = 58) AND (Worg= 58) THEN //objeto_interface x objeto_interface
                  frm_main.Cria_Correlacao ( WCli,WProj,'OI',
                             WEntDestination.Userdata,'OI',
                             WentSource.userData,' ',0,0);
             else
               begin
                  Wrel.marked := true;
                  Diag.Deletemarked;
                  raise exception.create('Conexão não permitida ');
               end;

          end

        end;

   end;
 except
   begin
      result := false;
      raise;
   end;
 end;

end;
procedure Tfrm_dg.WEntityAdded;
  var
  Went,Wtexto1 : afNode;
  wcodigo,WTextoNome : string;
  WTotId,WtextoLeft,WTextoTop,WTextoId,WTextoWidth : integer;
  i : integer;
  Wuser : string;
  Wfont : IFontDisp;

 Begin
   Went := diag.selectedNode;

     {If DemoMaior(wdemo,frm_main.wqtdemo,frm_main.wqtativ) then  //versào demo ultrapassou
        begin

           begin
             went.width := 1;
             went.height := 1;
             Went.hidden := true;
             Raise exception.create(mens55);

             exit;
           end;
        end;  }

   case Went.Shape of
    11,50,79,62 : begin
                    Wtipo := 'AP';                  //atividade
                  end;

     54 : begin
           Wtipo := 'AP';                  //processo externo
           went.FillColor := clSilver;
          end;
     56,59,65 : Wtipo := 'EN' ;
     10,61 : begin
             Wtipo := 'PS' ;
             diag.selectedNode.Drawstyle :=  5 ; //Borda transparente
             Went.text := 'Pessoa Nova';
          end;

     9 : begin
           // wtipo := 'OG' ;
            wtipo := 'CA' ;   //CORRIGIDO EM 31/07/2005 ; GERAVA QUERIES NULAS
            Diag.SelectedNode.Alignment := 0;
         end;

     58,15: begin
            Wtipo := 'OI' ;
            went.drawstyle := 5;
            AddPic(58);
          end;

     8  : begin
            Wtipo := 'OC' ;
            went.drawstyle := 5;
            AddPic(8);
          end;

     0  : Wtipo := 'OE' ;
     55 : begin
            Wtipo := 'EE' ;
            went.FillColor := clSilver;
          end;
     2 : begin
            Wtipo := 'JU' ;
            //went.text := 'NOVA JUNÇÃO';
            //AddPic(2);
            //Cria_junction(Went);
         end;

     14 : begin
            Wtipo := 'RN' ;
            went.transparent := true;
            went.drawstyle := 5;
          end;
     53 : begin              //ATOR
            Wtipo := 'CA' ;
            diag.SelectedNode.DrawColor := diag.backColor;
            diag.selectedNode.Transparent := true;
            AddPic(53);
          end;

     1 : Wtipo := 'IF' ;
   end;
 //  went.text       := '' ;
   Wuser := InttoStr(frm_main.Cria_Registro(Went.userData,
                     '',WAtividademae,WTipo,Went.text,WIdg)) ;
   Went.Userdata := strtoInt(Wuser);
   diag.SelectedNode := went;

 end;

Procedure tfrm_dg.cria_Atv(pNode : afNode);
var                             //cria os o quadrado do wbs e o quadrado do ator.
 wtop,Wleft : real;
 WSubNOde,WSubNode1 : afNode;
 WSubLink,WSubLink1,WSubLink2,WSubLink3 : afLink;
 j ,wtot,wst : integer;
 worg,Wdst,Wp1,Wp2,Wp3,Wp4,Wp5 : afLinkPoint;
 Tot,i : integer;
 WFont : IFontDisp;
 Wfnt : Tfont;
begin

   If frm_dg <> nil then
      frm_dg.Stat_Salvou(false);

      //retangulo wbs
     {WSubnode := Diag.Nodes.add(pNode.left,              //LEFT
                  pnode.top + pnode.height - wwbs_height,  //TOP
                  WWbs_Width,                              //WIDTH
                  wwbs_height);                            //HEIGHT  }
      WSubnode := Diag.Nodes.add(wwbs_Left,              //LEFT
                  wwbs_Top,                              //TOP
                  WWbs_Width,                              //WIDTH
                  wwbs_height);                            //HEIGHT  }

     //ator
     {wSubnode1 := Diag.Nodes.add(WSubnode.left+wsubnode.width,
                  Wsubnode.top,
                  pnode.width - Wwbs_Width,
                  Wwbs_height); }

     WSubnode1 := Diag.Nodes.add(WAtor_Left,
                  WAtor_Top,
                  WAtor_Width,
                  WAtor_height);

    // Wsubnode.left   := (pNode.left+pNode.width) - WSubnode.width;
     WSubnode.shape      := 1;
     WsubNode.Sizeable   := true;
     WSubNode.FillColor  := clWhite;
     WSUbNode.Selectable := false;
     WSUbNode.Moveable   := true;

    // Wsubnode1.left   := WSubnode.Left;
     WSubnode1.shape      := 1;
     WSubNode1.FillColor  := clWhite;
     WsubNode1.Sizeable   := true;
     WSUbNode1.Selectable := false;
     WSUbNode1.Moveable   := true;

     WSubLink1 := pnode.OutLinks.Add(Wsubnode);  //ator
     WSublink1.linkstyle  := 10;
     Wsublink1.Rigid      := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden     := true;  


     WSubLink3 := pnode.OutLinks.Add(WSubNode1);
     WSublink3.linkstyle  := 11;
     Wsublink3.Rigid      := true;
     WSublink3.Selectable := false;
     WSubLink3.Hidden     := true;  
end;


Procedure tfrm_dg.cria_Junction(pNode : afNode);
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
   If frm_dg <> nil then
      frm_dg.Stat_Salvou(false);
      WSubnode := Diag.Nodes.add(pNode.left ,
                  pNode.top ,
                  pNode.width ,
                  pNode.height);

     //retangulo interno
     WSubnode1 := Diag.Nodes.add(WSubNode.left ,
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
     WSublink.linkstyle := 13;
     Wsublink.Rigid := true;
     WSublink.Selectable := false;
     WSubLink.Hidden := true;

     WSubLink1 := WsubNode1.OutLinks.Add(Wsubnode);
     WSublink1.linkstyle := 13;
     Wsublink1.Rigid := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden := true;

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
     diag.AdjustOrg := false;
     diag.Adjustdst := false;
     WSubLink2 := pnode.OutLinks.Add(WsubNode);
     WSublink2.linkstyle := 4;
     WSublink2.Drawstyle := 2;
     //ajusta_seta(WSubLink2);
end;


Procedure tfrm_dg.AddPic(pPos : integer);
var
Wpic : IpictureDisp;
begin
  Case pPos of
   11 : WImagem := fram_pic1.im_ap.picture;
   58,15 : WImagem := fram_pic1.im15.picture;
   8  : WImagem := fram_pic1.im8.picture;
   53 :begin
         WImagem := fram_pic1.im53.picture;
         diag.SelectedNode.Alignment := 0;
       end;
  end;

  GetOlePicture(WImagem,WPic);
  diag.SelectedNode.picture     := Wpic;
  diag.SelectedNode.picturePosition := 1;
  diag.SelectedNode.autosize    := 1;   //ajusta imagem a entidade
  Diag.selectedNode.DrawStyle   := afTransparent;
  Diag.selectedNode.Transparent := true;
  Diag.SelectedNode.ZOrder      := 1;

end;

Function  Tfrm_dg.Atrib_Link(pLink : afLink;pDiag : string) : boolean;
begin
   result := true; 
   If pLink = nil then
      Begin
         result := false;
         exit;
      end;               

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
                 pLink.ArrowOrg   := Wdg_AOrg  ;
                 pLink.ArrowMid   := Wdg_AMid ;
                 pLink.Arrowdst   := Wdg_Adst;
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
                 pLink.ArrowOrg   := Wcrn_AOrg  ;
                 pLink.ArrowMid   := Wcrn_AMid ;
                 pLink.Arrowdst   := Wcrn_Adst;
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
             pLink.ArrowOrg   := Wcnx_AOrg  ;
             pLink.ArrowMid   := Wcnx_AMid ;
             pLink.Arrowdst   := Wcnx_Adst;
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
             pLink.ArrowOrg   := Wlnk_AOrg  ;
             pLink.ArrowMid   := Wlnk_AMid ;
             pLink.Arrowdst   := Wlnk_Adst;
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
            // pLink.ArrowOrg   := Wrl_AOrg  ;
             //pLink.ArrowMid   := Wrl_AMid ;
            // pLink.Arrowdst   := Wrl_Adst;
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
       pLink.ArrowOrg   := Wdeo_AOrg  ;
       pLink.ArrowMid   := Wdeo_AMid ;
       pLink.Arrowdst   := Wdeo_Adst;
     end;
end;

procedure Tfrm_dg.SpeedButton17Click(Sender: TObject);
begin

  Salva_Diag(frm_TreeAtiv.tv.selected.text,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCli,
                               udado(frm_TreeAtiv.tv.selected.data)^.fProj,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCodigo,
                               0,
                               Wclass_dg,
                               udado(frm_TreeAtiv.tv.selected.parent.data)^.fcodigo);
end;

procedure Tfrm_dg.Salva_Diag(pNome : string;pCli : integer;
                             pProj : integer;PIdg : integer;
                             pmae : integer; pClass : string;pPai : integer);
begin
   If viewer then
      exit;
   If (pcli * pidg * pproj) > 0 then
       begin
         Wlibera := 1;
         If diag <> nil then
            begin
              frm_Main.Salva_Idg(pnome,pcli,pproj,pidg,
                                 0,'',Wclass_dg,pPai);
              Stat_salvou(true);
            end;
       end

  else
      showmessage('Não foi possível salvar o diagrama! Cliente : '+inttostr(Wcli) +
                     ' Idg : '+ inttostr(WIdg) + ' Projeto : ' +inttostr(Wproj));
end;

procedure Tfrm_dg.WClick(Sender: TObject);
begin
  WTmouse := 4  ;
end;

procedure Tfrm_dg.Objetos1Click(Sender: TObject);
begin
  If frm_objeto = nil then
     frm_Objeto := tfrm_Objeto.Create(self);
  frm_objeto.Show;
end;

procedure Tfrm_dg.wKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 w ,x : integer;
 Wnoatu : TtreeNode;
begin
    If viewer then
       exit;
    WnoAtu := frm_TreeAtiv.tv.selected; //salva a posiçào do diagrama atual
    If key = VK_DELETE then
       begin
          If Diag.SelNodes.count > 0 then     //entidades
            begin
              WtotDelSel :=  Diag.SelNodes.count;
              for x := 1 to  WtotDelSel do
                begin
                  Deleta_Ativ(diag.Selnodes.item(x));
                end;
               diag.deleteMarked;
            end
         else
          If Diag.SelLinks.count > 0 then       //links
           begin
             WtotDelSel :=  Diag.SelLinks.count;
             for x := 1 to  WtotDelSel do
                begin
                  Deleta_Dg(diag.SelLinks.item(x));
                end;
               diag.deleteMarked;
               //WCurrentNode := WNoAtu;
              // frm_treeativ.Abre_diagrama(WnoAtu);
              // frm_Main.Salva_Idg(wnome_nivel,wcli,Wproj,Widg,
              //      WAtividadeMae,'',Wclass_dg,wpai);

           end;
        WCurrentNode := WNoAtu;
        frm_main.identifica_node(WNoAtu);
        frm_Main.Salva_Idg(wnome_nivel,wcli,Wproj,Widg,    {TODO -c5.26 : Não gravava o diagrama após deleçào da atividade -> a ativid. aparecia no di agrama e não no treeview }
                           WAtividadeMae,'',Wclass_dg,wpai);
        Stat_salvou(true);
       end;
end;

procedure Tfrm_dg.Deleta_Ativ(pNode : afnode);
var
  Worg,Wdst,j,w : integer;
  Wno,Wparent : TtreeNode;
  WLink : afLink;
  Wcod,Wp,WShape : integer;
  Wnode : afnode;
begin
  frm_dg.Stat_Salvou(false);
  WNode  := pNode;
  WShape := Wnode.shape;
  If (WClass_dg <> 'DPN') and (WClass_dg <> 'DUC')  and
             (WClass_dg <> 'DEO') and (WClass_dg <> 'DMI')then
      begin
           WNode.marked := true ;
           exit;
      end;
      case Wshape of

      2 :   begin       // junction
              Del_Junction(WNode,nil);
              WNode.marked := true;
            end  ;

      0 :  begin         //Objeto entidade
             If WNode.OutLinks.count > 0 then
               begin
                 WLink := WNode.Links.item(1);
                 WOrg  := WLink.org.userdata;
                 Wdst  := WLink.dst.userdata;
                 With dm4.qry_DelCorr do
                 begin
                   close;
                   parambyname('rcli').asinteger := wcli;
                   parambyname('rproj').asinteger := wproj;
                   parambyname('rtipo').asstring := 'OE';
                   parambyname('rFILHO').asinteger := Worg;
                   prepare;
                   execsql;
                 end;
               end;
               WNode.marked := true;
           end;

      8,58,15 :  begin            //Objeto Interface/Controle
                If WNode.Links.count > 0 then
                   begin
                     WLink := WNode.Links.item(1);
                     WOrg  := WLink.org.userdata;
                     Wdst  := WLink.dst.userdata;
                     If (WShape = 58) or (WShape = 15 ) then
                        frm_main.Apaga_Correlacao (WCli,WProj,'OI',
                             Wdst,'OE')
                     else
                       frm_main.Apaga_Correlacao (WCli,WProj,'OC',
                             Wdst,'OE') ;
                   end;
                   WNode.marked := true;
              end;
      14 : begin      //Se apagar a regra de Negócio, apagar a correlação
            If WNode.OutLinks.count > 0 then
               begin
                 WLink := WNode.Links.item(1);
                 WOrg  := WLink.org.userdata;
                 Wdst  := WLink.dst.userdata;
                 with dm10.qry_DelRn do
                 begin
                  close;
                  parambyname('rcli').asinteger  := Wcli;
                  parambyname('rproj').asinteger := WProj;
                  parambyname('rpai').asinteger  := Wdst ;
                  parambyname('rfilho').asinteger:= Worg ;
                  parambyname('rtipop').asstring := 'AP' ;
                  parambyname('rtipof').asstring := 'RN' ;
                  prepare;
                  execsql;
                 end;
               end ;
               WNode.marked := true;
           end;
      65   : begin    // Evento de negócio
               If WNode.OutLinks.count > 0 then
               begin
                 WLink := WNode.Links.item(1);
                 WOrg  := WLink.org.userdata;
                 Wdst  := WLink.dst.userdata;
                 with dm10.qry_DelRn do
                 begin
                  close;
                  parambyname('rcli').asinteger  := Wcli;
                  parambyname('rproj').asinteger := WProj;
                  parambyname('rpai').asinteger  := Wdst ;
                  parambyname('rfilho').asinteger:= Worg ;
                  parambyname('rtipop').asstring := 'AP' ;
                  parambyname('rtipof').asstring := 'EN' ;
                  prepare;
                  execsql;
                 end;
               end ;
               WNode.marked := true;

             end;
      11,1,50,79 : begin     // atividades
               If (WClass_dg = 'DPN') and (WShape = 1) then
                  begin
                    exit;
                  end;

               If frm_TreeAtiv <> nil then
                  begin
                    WCloseTree := true;
                    Wcod := WNode.userdata  ;
                    Wp   := WIdg;
                  end
               else
                  begin
                  end;

               If WNode.Links.count > 0 then  //Se tiver regra de Negócio, apagar a correlação
               begin
                 for j := 1 to WNode.Links.count do
                 begin
                   WLink := WNode.Links.item(j);
                   WOrg  := WLink.org.userdata;
                   Wdst  := WLink.dst.userdata;
                   If WNode.Links.Item(j).LinkStyle = 4 then    //conexão Regra de negócio
                     begin
                        with dm10.qry_DelRn do
                          begin
                            close;
                            parambyname('rcli').asinteger  := Wcli;
                            parambyname('rproj').asinteger := WProj;
                            parambyname('rpai').asinteger  := Wdst ;
                            parambyname('rfilho').asinteger:= Worg ;
                            parambyname('rtipop').asstring := 'AP' ;
                            parambyname('rtipof').asstring := 'RN' ;
                            prepare;
                            execsql;
                          end;
                     end
                   else
                     begin
                       If Wlink.org.shape =  65 then // evento de negócio
                         begin
                            with dm10.qry_DelRn do
                              begin
                                close;
                                parambyname('rcli').asinteger  := Wcli;
                                parambyname('rproj').asinteger := WProj;
                                parambyname('rpai').asinteger  := Wdst ;
                                parambyname('rfilho').asinteger:= Worg ;
                                parambyname('rtipop').asstring := 'AP' ;
                                parambyname('rtipof').asstring := 'EN' ;
                                prepare;
                                execsql;
                              end;
                         end;
                     end;
                 end;
               end;
               For w := 1 to WNode.Outlinks.Count do
                begin
                 If (WNode.Outlinks.Item(w).Linkstyle = 13) or
                    (WNode.Outlinks.Item(w).Linkstyle = 12)then//decomposicao
                  begin
                    WNode.Outlinks.Item(w).dst.Marked := true;
                  end;
                end;
                If WClass_dg = 'DPN'then
                   delete_Atv_fisico(WNode); //deleta WBS e Ator
                WNode.marked := true;
                Wno := frm_TreeAtiv.procura_node(Wcod,Wcli,Wproj,Widg);
                If Wno <> nil then
                 begin
                   frm_TreeAtiv.tv.selected := Wno;
                   frm_TreeAtiv.ExcluirAtiv(Wno,frm_dg) ;
                   //frm_treeativ.tv.selected := WNoAtu;
                   //frm_main.identifica_node(WNoAtu);
                   
                 end;

                exit;
              end
      else
        begin       // outros : apaga sem checagem
           WNode.marked := true ;
           exit;
        end;
      end;   //endcase

end;

procedure Tfrm_dg.Deleta_Dg(pLink : afLink);
var
  Worg,Wdst,j,w : integer;
  Wno,Wparent : TtreeNode;
  WLink : afLink;
  Wcod,Wp : integer;
  Wstyle : integer;
begin
  frm_dg.Stat_Salvou(false);
  Wlink := pLink;
  WStyle := Wlink.LinkStyle;

  If (WClass_dg <> 'DPN') and (WClass_dg <> 'DUC')  and
             (WClass_dg <> 'DEO') and (WClass_dg <> 'DMI')then
    begin
         Wlink.marked := true ;
         diag.deleteMarked;
         exit;
    end;
    WOrg := Wlink.org.userdata;
    Wdst := Wlink.dst.userdata;
    If WClass_dg = 'DPN' then
       begin
          If WLink.org.shape = 2 then  // junction
             begin
                Del_Junction(nil,WLink);
                Wlink.Marked := true;
              end
          else
          If WStyle = 4 then   // conexão regra de negocio
             begin
               If (WLink.org.shape = 14 ) then //regra de negócio
               begin
                // with dm10.qry_DelRn do
                  begin
                    frm_main.Deleta_Correlacao ( Wcli,Wproj, 'AP',WDST,'RN',Worg)
                   { close;
                    parambyname('rcli').asinteger  := Wcli;
                    parambyname('rproj').asinteger := WProj;
                    parambyname('rpai').asinteger  := Wdst ;
                    parambyname('rfilho').asinteger:= Worg ;
                    parambyname('rtipop').asstring := 'AP' ;
                    parambyname('rtipof').asstring := 'RN' ;
                    prepare;
                    execsql;  }
                  end;
              end;
              Wlink.Marked := true;
             end
           else
              begin
                If (WLink.org.shape in [11,50, 65,79]) then
                  begin     // deleta correlaçào de evento de negócio
                    // with dm10.qry_DelRn do
                      begin
                        frm_main.Deleta_Correlacao ( Wcli,Wproj, 'AP',WDST,'EN',Worg)
                       { close;                                       
                        parambyname('rcli').asinteger  := Wcli;
                        parambyname('rproj').asinteger := WProj;
                        parambyname('rpai').asinteger  := Wdst ;
                        parambyname('rfilho').asinteger:= Worg ;
                        parambyname('rtipop').asstring := 'AP' ;
                        parambyname('rtipof').asstring := 'EN' ;
                        prepare;
                        execsq}
                      end;
                  end;
                Wlink.Marked := true;
              end  ;
       end
       else
       If WClass_dg = 'DUC' then
         begin
            If WStyle = 1 then     // conexão Interface x entidade
            begin
              If (WLink.org.shape = 0 )  then // origem ;objeto entidade
                begin
                  If (WLink.dst.shape  in [15,58]) then  // objeto interface
                     frm_main.Deleta_Correlacao ( Wcli,Wproj, 'OI',WDST,'OE',Worg)

                   // frm_main.Apaga_Correlacao (WCli,WProj,'OI',
                           //  Wdst,'OE')
                  else
                     frm_main.Deleta_Correlacao ( Wcli,Wproj, 'OC',Wdst,'OE',Worg);
                    // frm_main.Apaga_Correlacao (WCli,WProj,'OC',
                            // Wdst,'OE')
                end
              else
                If WLink.org.shape in [8,58]   then // origem : objeto interface or Controle
                begin
                  If (WLink.dst.shape  = 0) then  // objeto entidade
                     frm_main.Deleta_Correlacao ( Wcli,Wproj, 'OI',WORG,'OE',WDST)

                   // frm_main.Apaga_Correlacao (WCli,WProj,'OI',
                           //  Wdst,'OE')
                  else
                     frm_main.Deleta_Correlacao ( Wcli,Wproj, 'OC',WORG,'OE',WDST);
                    // frm_main.Apaga_Correlacao (WCli,WProj,'OC',
                            // Wdst,'OE')
                end
            end ;

            WLink.Marked := true;
         end
       else
          Wlink.Marked := true;

        
end;


Procedure Tfrm_dg.delete_Atv_fisico(pNode : afNode);
var
i : integer;
Wsubnode1,Wsubnode2 : afNode;
begin
   for i := 1 to pNode.outlinks.count do
   begin
     If pNode.Outlinks.item(i).linkstyle = 10 then
        begin
          Wsubnode1 := pNode.Outlinks.item(i).dst;
          WSubnode1.marked := true;
        end;
     If pNode.Outlinks.item(i).linkstyle = 11 then
        begin
          Wsubnode2 := pNode.Outlinks.item(i).dst;
          WSubnode2.marked := true;
        end;
   end;
  //Diag.DeleteMarked;
end;


Procedure Tfrm_dg.del_Junction(pNode : afNode ; pLink : afLink);
var
Wsub,Wsub1 : afNode;
tot ,i: integer ;
begin
 If pNode <> nil then
    begin
      If pNode.shape = 1 then
        begin
          tot := pNode.InLinks.count;
          for i := 1 to tot do
          begin
            If pNode.InLinks.Item(i).linkStyle = 4 then
                 begin
                   pNode.InLinks.Item(i).org.marked := true;
                 end
              else
              If pNode.InLinks.Item(i).linkStyle = 13 then
                 begin
                   pNode.InLinks.Item(i).org.marked := true;
                 end
          end;
          pNode.marked := true;
          //Diag.deletemarked;
        end
      else
        begin
          If pNode.OutLinks.count > 0 then
             begin
               Wsub := pNode.OutLinks.Item(1).dst;
               Wsub.OutLinks.item(1).dst.marked := true;
               Wsub.marked := true;
              // Diag.deletemarked;
             end;
        end;
    end
 else
  If pLink <> nil then
    begin
      Wsub         := pLink.org;
      Wsub.marked  := true;
      Wsub1        := pLink.dst;
      Wsub1.OutLinks.item(1).dst.marked := true;
      Wsub1.marked := true;
      //Diag.deletemarked;
    end
end;

Function Tfrm_dg.Salvar : Boolean;

begin
result := true;
If Diag <> nil then
  begin
//    Chg := Diag.IsChanged;
    If (Wcli * Widg * Wproj) > 0 then
      Begin
        If  not chg then  // se o diagrama n~foi alterado, libera apenas
          Begin
            Wlibera := 0;
          end
        else
          begin
            case MessageDlg('Deseja salvar o Diagrama ?', mtConfirmation,
                  [mbYes, mbNo, mbCancel], 0) of	{ produce the message dialog box }
            id_Yes: begin
                      Wlibera := 0;
                      frm_Main.Salva_Idg(wnome_nivel,wcli,Wproj,Widg,WAtividadeMae,'',WClass_dg,Wpai);
                      Stat_salvou(true);
                    end;
            id_no  : begin
                      // frm_main.Desbloqueia(Wcli,Wproj,WIdg);
                     end;

            id_cancel : begin
                          result := false;
                          exit;
                        end;

            end;
          end;
      end
   else
      begin
        showmessage('Não foi possível salvar o diagrama! Cliente : '+inttostr(Wcli) +
                     ' Idg : '+ inttostr(WIdg) + ' Projeto : ' +inttostr(Wproj));
      end;
    
    Diag.free;
    Diag := nil;
  end;
end;

procedure Tfrm_dg.SpeedButton24Click(Sender: TObject);
begin
  Diag.SelectAction := afSelectItems;
end;

procedure Tfrm_dg.SpeedButton27Click(Sender: TObject);

begin
 Diag.selectAction := afNoSelection;
 diag.linkstyle := TSpeedButton(sender as Tobject).tag;
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


procedure Tfrm_dg.Salva_variaveis;   //salva antes de mudar
begin
   WDiag_ant       := WDiag_Id;     //Diagrama
   dg_nivelant     := Wnivel_ativo; //Nível
   dg_idgant       := Widg;        //Código do Diagrama
   dg_Cliant       := Wcli;        //Cliente
   dg_Projant      := WProj;        //Projeto
   dg_nomenivelant := WNome_NIvel; //Nome do nível
   dg_maeant       := WAtividademae;//Atividade mae
   dg_PaiAnt       := Wpai;         //Diagrama pai
   dg_AvoAnt       := WAvo;         //Diagrama pai
   dg_Classant     := WClass_dg;    // Classe de diagrama
end;

procedure Tfrm_dg.restaura_variaveis;      //restaura variaveis
begin
   WDiag_Id      :=     WDiag_ant  ;
   Wnivel_ativo  :=     dg_nivelant  ;
   Widg          :=     dg_idgant ;
   Wcli          :=     dg_Cliant ;
   WProj         :=     dg_Projant;
   WNome_NIvel   :=     dg_nomenivelant ;
   WAtividademae :=     dg_maeant      ;
   Wpai          :=     dg_PaiAnt;
   WAvo          :=     dg_AvoAnt;
   WClass_dg     :=     dg_Classant   ;
end;

FUNCTION Tfrm_dg.Novo_Diag(pNomeDiag : string; pNome_nivel : string) : Boolean; // cria novo diagrama
var
Wnomediag,WNomeDiagAnt : string;
Went : afNode;
ok : boolean;
WTnode : TTreeNode;
x,k : integer;
Begin
Grava := true;
result := false;
try
   begin
      WNomeDiagAnt := WnomeDiagAtu;
      WnomeDiag    := Wdir +pNomeDiag ;
      WnomeDiagAtu := WnomeDiag;
      If pNomeDiag = 'USADO' then
         begin
           result := false;
           raise exception.create('Diagrama usado por outro usuário! tente mais tarde!');
         end;
      Novo := false;
      If (pNomeDiag <> '') and (pNomeDiag <> '0') then      // diagrama ja existe... abre
         Begin
           If FileExists(WnomeDiag) then
                 Ok   := true
            else
                novo := true;
         end
      else
         novo := true;
      { TODO : Comentado em 21/9/01 - verificar pbs }

        If Wclass_DgEsc = '' then
           begin
             result := false;
             raise exception.create('Decomposição Cancelada!');
           end;
       Wclass_dg     := WClass_DgEsc;
       If diag <> nil then
          diag.visible := true;
       If diag = nil then
        Begin
         Diag := TAddflow.CREATE(SELF);
         InsertControl(Diag);
         Diag.Align       := alClient;
         Diag.AdjustOrg   := true;
         Diag.Adjustdst   := true;
         Diag.DisplayPropertyPage(15);
         Diag.OnDblClick  := WDblClick;
         Diag.OnMOuseDown := WmouseDown;
         Diag.OnMOuseUp   := WmouseUp;
         Diag.OnKeyDown   := WKeyDown;
         Diag.OnClick     := WClick;
         Diag.PopUpMenu   := PopNode ; //EntPop;
         diag.SaveFile(wdir+'limpo.add') ;
        end
      else
        begin
          If fileExists(wdir+'limpo.add') then
             diag.LoadFile(wdir+'limpo.add')
          else
             raise exception.create('Erro Interno - Arquivo limpo.add inexistente!');
        end;
      
      fgridStyle;

      Diag.Shape     := frm_main.palette(1);  //define entidade default (button down)
      Diag.LinkStyle := frm_main.palette(2);  //define link default (button down)


      If ok then      // diagrama ja existe... abre
      Begin
       If not novo then
          Diag.LoadFile(WnomeDiag);
      end;
      If Novo then
         Stat_salvou(false);

     edit13.text := inttostr(WIdg);
     result := true;
   end;
except
   Begin
     Wtnode := frm_treeativ.tv.selected.parent;  { DONE -oyves -c5.13 : Cancelamento da decomposição : cria nó no treeview - corrigido }
     //frm_TreeAtiv.Excluir1Click(frm_dg) ;
     frm_main.Identifica_node(Wtnode);
     WnomeDiagAtu              := WNomeDiagAnt;
     frm_TreeAtiv.tv.selected  := Wtnode;
     raise;
   end;
end;
end;

procedure Tfrm_dg.Cria_Sub(pNode : afNode;pCria : Boolean);
var                   //retangulo simbolo de decomposiçao
 WSubNOde : afNode;                   //vide funcao resize_rigid
 WSubLink,WSubLink1 : afLink;
 j,Wlst,Wtotl : integer;
begin
   frm_dg.Stat_Salvou(false);
   WTotl := pNode.OutLinks.Count ;
   If (pNode.Shape <> 11) and (pnode.Shape <> 50) then
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
                   diag.deleteMarked;
                   exit;
                 end;
            end
         else
          exit;
        end;

   end;

   If pCria then
   begin
      WSubnode := Diag.Nodes.add(pNode.left+pNode.width / 6,
                  pNode.top + pNode.height,
                  pNode.width / 9,
                  pNode.height / 11);

     WSubnode.shape      := 1;
     WsubNode.Sizeable   := false;
     WSubNode.FillColor  := clBlack;
     WSUbNode.Selectable := false;

     WSubLink            := pNode.OutLinks.Add(WSubnode);
     WSublink.linkstyle  := 13;
     Wsublink.Rigid      := true;
     WSublink.Selectable := false;
     WSubLink.Hidden     := true;

     WSubLink1 := WsubNode.OutLinks.Add(pNode);
     WSublink1.linkstyle := 13;
     Wsublink1.Rigid := true;
     WSublink1.Selectable := false;
     WSubLink1.Hidden := true;
   end;

end;

procedure Tfrm_dg.Abaixo(pEntity : afNode);
var
 Wtot,i,Wfilho,Wpos : integer;
 Wnode : TTreeNode;
 mens : string;
Begin
try
  begin
    
    mens := 'Erro Interno na Decomposição : '+#13+
              'Sincronismo diagrama ('+
                inttostr(Widg) +') x árvore ('+inttostr(udado(frm_TreeAtiv.tv.selected.data)^.fcodigo)+')';

    If udado(frm_TreeAtiv.tv.selected.data)^.fcodigo <> Widg then
         raise exception.create(mens);
    If (pEntity.shape = 11) or (pEntity.shape = 50 )
        or (pEntity.shape = 79 )
        or (pEntity.shape = 1 ) then //'acao_processo'then
       Begin
         If (pEntity.shape = 11) or (pEntity.shape = 50) then   // acao de processo
            Cria_Sub(pEntity,True);
            Salva_Diag(frm_TreeAtiv.tv.selected.text,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCli,
                               udado(frm_TreeAtiv.tv.selected.data)^.fProj,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCodigo,
                               0,
                               Wclass_dg,
                               udado(frm_TreeAtiv.tv.selected.parent.data)^.fcodigo);

         WuserId       := pEntity.userdata;
         Wpai          := Widg;
         If frm_TreeAtiv.tv.selected.Parent.Level < 2 then
            Wavo := 0
         else
            Wavo          := udado(frm_TreeAtiv.tv.selected.Parent.data)^.fcodigo;
         speedbutton17.enabled := true;
         diag.SelectedNode := pEntity;
         WClass_dgEsc := '';
         WAtividadeMae := pEntity.userdata;//Atividade MAE
         WNome_nivel   := pEntity.text;             ;
         WDiag_Id      := frm_Main.Procura_Idg(Wcli,Wproj,WUserId,Wnome_Nivel,WPai,true,WClass_dg);
                   // diagrama pai

         If not Novo_Diag(WDiag_Id,WNome_Nivel)then
            begin
              If (pEntity.shape = 11) or (pEntity.shape = 50) then   // acaod e processo
                 Cria_Sub(pEntity,false);
            end;
         Wnode := frm_TreeAtiv.procura_Node(Wuserid,Wcli,Wproj,WPai);
         WpreviousNode := WcurrentNode;
         WcurrentNode  := WNode;
         WNivel_ativo  := WCurrentNode.Level-2;
         edit1.text    := inttostr(WNivel_ativo);//inttostr(Wnivel_Ativo);
         If wnode <> nil then
            begin
              frm_main.Identifica_node(Wnode);
              frm_Treeativ.tv.selected := Wnode;
              frm_TreeAtiv.tv.selected.Expand(true);
            end;
         edit13.text := inttostr(udado(frm_TreeAtiv.tv.selected.data)^.fcodigo);
         edit14.text := inttostr(Widg);
       end;
  end
except
  begin
     If (pEntity.shape = 11) or (pEntity.shape = 50) then   // acao de processo
            Cria_Sub(pEntity,false);
     raise;
  end;
end;

end;

procedure Tfrm_dg.Acima;
var
 i,WAtiv,Wpai_ant : integer;
 Wnode   : TTreeNode;
 mens : string;
 empty : boolean;
Begin
try
     begin     //verifica nenhuma entidade selecionada  ou entidade selecionada
               // não ''e atividade
      
      mens := 'Erro Interno na recomposição : '+#13+
              'Sincronismo diagrama ('+
                inttostr(Widg) +') x árvore ('+inttostr(udado(frm_TreeAtiv.tv.selected.data)^.fcodigo)+')';
      If udado(frm_TreeAtiv.tv.selected.data)^.fcodigo <> Widg then
         raise exception.create (mens);
      If frm_treeativ.tv.selected.level = 2 then  // se nível diagram, não faz nada
         exit;
      Salva_Diag(frm_TreeAtiv.tv.selected.text,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCli,
                               udado(frm_TreeAtiv.tv.selected.data)^.fProj,
                               udado(frm_TreeAtiv.tv.selected.data)^.fCodigo,
                               0,
                               Wclass_dg,
                               udado(frm_TreeAtiv.tv.selected.parent.data)^.fcodigo);
     diag.SelectAll;
     If diag.selnodes.Count = 0 then
        empty := true
     else
        empty := false;
      WPreviousNode := frm_TreeAtiv.tv.selected;//WCurrentNode;   //salva atual como anterior
      WcurrentNode  := frm_TreeAtiv.tv.selected.parent; //procura pai atual
      If WCurrentNode = nil then
         raise exception.create('Erro Interno - função acima');
      If (Diag.selectedNode = nil) or ((Diag.selectedNode.shape <> 11) or
          (Diag.selectedNode.Shape <> 50)) then
         begin
           for i := 1 to diag.nodes.count do
           begin
             If (diag.nodes.item(i).shape = 11) or (diag.nodes.item(i).shape = 50) then
                begin
                  diag.selectednode := diag.nodes.item(i) ;  //escolhe a primeira
                  break;                                     // atividade encontrada
                end;
           end;
         end ;

      Wpai_ant := udado(WPreviousNode.data)^.fcodigo;

      If WCurrentNode.Parent.level < 2 then
         Wpai := 0
      else
         Wpai  := udado(WCurrentNode.parent.data)^.fcodigo;
      If WCurrentNode.parent.parent.level < 2 then
         Wavo := 0
      else
         WAvo  := udado(WCurrentNode.parent.parent.data)^.fcodigo;

      WAtiv := udado(WCurrentNode.data)^.fcodigo;
      {WNome_nivel    := WCurrentNode.Text;
      WCurrentNode.Expand(true);
      WDiag_Id  := frm_Main.Procura_Idg(wcli,Wproj,WAtiv,WNome_Nivel,WPai,false);
      If wdiag_Id = '' then
         raise exception.create('Problema na estrutura : Diagrama pai não encontrado!');}
      WIdg := Wativ;
      frm_main.Identifica_node(Wcurrentnode);
      If not Novo_Diag(WDiag_Id,WNome_Nivel) then
        Begin
          raise exception.create('Erro Interno : Problema na abertura do Diagrama');
        end;
        for i := 1 to Diag.Nodes.Count do
          begin
           If Diag.Nodes.Item(i).userdata = WPai_Ant then
             begin
               Diag.nodes.Item(i).selected := true;
               frm_TreeAtiv.tv.selected.Collapse(true);
               Diag.nodes.Item(i).ensureVisible;
               If empty then
                  Cria_Sub(Diag.Nodes.Item(i),false){ TODO -c5.26 : Na hora de  recompor e se o diagrama abaixo estiver vazio, tira o quadradinho da atividade. };

               break;
             end;
          end;
     frm_TreeAtiv.tv.selected   := WCurrentNode;
     WNivel_ativo               := WCurrentNode.Level-2;
     edit1.text                 := inttostr(WNivel_ativo);//inttostr(Wnivel_Ativo);
     edit13.text := inttostr(udado(frm_TreeAtiv.tv.selected.data)^.fcodigo);
     edit14.text := inttostr(Widg);


     end;
except
  Begin
    raise;
  end;
end;
end;

procedure Tfrm_dg.SpeedButton14Click(Sender: TObject);
begin
   If frm_treeativ.tv.selected.level < 2 then
         exit;
   If Diag.SelectedNode <> nil then
   begin
     Wentselected := Diag.SelectedNode;
     IF Wentselected.text = '' then
        showmessage('Informar a Descrição do Objeto antes de Decompor!')
     else
        abaixo(diag.SelectedNode);
   end;

end;

procedure Tfrm_dg.Abrir1Click(Sender: TObject);
begin
  Grid1Click(EntPop);
end;

procedure Tfrm_dg.SpeedButton15Click(Sender: TObject);
begin
  If frm_treeativ.tv.selected.level < 2 then
         exit;
  Acima;
end;

procedure Tfrm_dg.Lista1Click(Sender: TObject);
var
wdst,iRn,WOrg ,i,j: integer;
sqlant : string;
WNodeExcl : TTreeNode;
begin
  If Diag.SelectedNode <> nil then
     begin
        Creat := true;
        Case Diag.SelectedNode.Shape of
        55,53 :frm_main.Mostra_Lista('Entidades Externas','EE', 'UO','CA', false,true,1,'IDF_CA');
        9  :frm_main.Mostra_Lista('Classes de atores','CA', 'UO','EE',false,true,1,'IDF_CA');
        10,61  :frm_main.Mostra_Lista('Pessoas','PS', 'PS','PS',false,true,1,'IDF_PS');
        56,59,65 :frm_main.Mostra_Lista('Eventos de Negócio','EN', 'EN','EN',false,true,1,'IDF_EN');
        11,54,50,79:
              begin
                Wcodigo_Ant := diag.SelectedNode.userdata;
                frm_main.Mostra_Lista('Atividades','AP', 'AP','AP',false,true,1,'IDF_AP') ;
               end;
        62:      //USE CASE
              begin
                Wcodigo_Ant := diag.SelectedNode.userdata;
                frm_main.Mostra_Lista('Atividades','AP', 'UC','UC',false,true,1,'IDF_AP') ;
               end;
        2 :frm_main.Mostra_Lista('Decisão','JU', 'JU','JU',false,true,1,'IDF_JU') ;
        14 :Begin
             Wcodigo_Ant := diag.SelectedNode.userdata;
             frm_main.Mostra_Lista('Regras de Negócio','RN', 'RN','RN',false,true,1,'IDF_RN');
            end ;
        0  :frm_main.Mostra_Lista('Objetos Entidade','OE', 'OE','OE',false,true,1,'IDF_OE');
        58,15 :frm_main.Mostra_Lista('Objetos de Interface','OI', 'OI','OI',false,true,1,'IDF_OI');
        8 :frm_main.Mostra_Lista('Objetos de Controle','OC', 'OC','OC',false,true,1,'IDF_OI');
        1 : begin
              If Wclass_Dg = 'DMI' then
                begin
                   frm_main.Mostra_Lista('Objetos de Negócio','IF', 'IF','IF',false,true,1,'IDF_IF')
                end
              else
              begin
                If Diag.selectedNode.InLinks.Count > 1 then
                   begin
                     case Diag.selectedNode.InLinks.Item(2).Linkstyle of
                     4 : exit;
                     end;
                   end;
                If Diag.selectedNode.inLinks.Count > 0 then
                   begin
                     for i := 1 to Diag.selectedNode.InLinks.Count do
                     begin
                       case Diag.selectedNode.inLinks.Item(i).Linkstyle of
                         10,11,12,13 : exit;
                        end;
                     end;

                   end;
              end;
              end;
        end;
      If WClose then
         exit;
      case Diag.SelectedNode.Shape of    //Acao de Processo
        1 : begin
               If WClass_dg = 'DMI'then
               begin
                  If dm2.qry_Lista.FieldbyName('idf_codigo').value = WIdg then
                  begin
                    Showmessage('O Objeto escolhida é o mesmo que o Objeto corrente!');
                    exit;
                  end;
                  Diag.SelectedNode.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring;//
                  Diag.SelectedNode.UserData :=  WCodigo_Lista;
                  Inclui_Arvore( dm2.qry_Lista.FieldbyName('idf_designacao').asstring,'','');
               end;
            end;

        62 :  Diag.SelectedNode.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring ;

        2 :  begin
               Diag.SelectedNode.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring ;
               If diag.selectedNode.OutLinks.count > 0 then
                  diag.selectedNode.outlinks.item(1).dst.text := dm2.qry_Lista.FieldbyName('idf_logica').asstring
             end;


        11,54,50,79 :    //atividade
           begin
             If dm2.qry_Lista.FieldbyName('idf_codigo').value = WIdg then
                begin

                  Showmessage('A atividade escolhida é a mesma que a atividade corrente!');
                  exit;
                end;
             WNodeExcl := frm_TreeAtiv.Procura_Node(Diag.SelectedNode.UserData,Wcli,WProj,WIdg);
             If WNodeExcl <> nil then
             Begin
               If WnodeExcl.HasChildren then
                Begin
                  If MessageDlg('Atenção! Essa Atividade possui decomposição! A alteração provocará a perda de todos os níveis abaixo!Continua ?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                     exit;
                end;
             end;
            
             If WNodeExcl <> nil then
                frm_TreeAtiv.ExcluirAtiv(WNodeExcl,frm_dg);
             Diag.SelectedNode.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring;//
             If Diag.SelectedNode.shape IN [11,50,79] then
             begin
               Diag.SelectedNode.UserData :=  WCodigo_Lista;
               Inclui_Arvore( dm2.qry_Lista.FieldbyName('idf_designacao').asstring,
                              dm2.qry_Lista.FieldbyName('IDF_ATOR1').asstring,
                              dm2.qry_Lista.FieldbyName('IDF_WBS_CODE').asstring) ;
             end;
             
             If dm2.Qry_Lista.Fieldbyname('IDF_TIPO_ATIV').value = 'UC' then
                begin
                  Rig_width  := Diag.SelectedNode.Width / 7;
                  Rig_Height := Rig_Width ;;
                  Rig_top    := Diag.SelectedNode.Top + Diag.SelectedNode.Height;
                  Rig_Left   := (Diag.SelectedNode.Left +
                                 Diag.SelectedNode.Width) - Rig_width;
                  frm_main.Cria_duc( Diag.SelectedNode,True,
                              0,Rig_top,Rig_left,Rig_width,rig_height,12);
                end
             else
                  frm_main.Cria_duc( Diag.SelectedNode,False,
                             0,0,0,0,0,12);
           end;
        else
           begin
              Diag.SelectedNode.text :=  dm2.qry_Lista.FieldbyName('idf_designacao').asstring;
           end;
       end;
      Diag.SelectedNode.UserData :=  WCodigo_Lista;

      If Diag.SelectedNode.Shape = 14 then  // se muda RN, atualizar correlacao
         begin
           If Diag.SelectedNode.OutLinks.count = 0 then
              exit
           else
              begin
                Wdst := Diag.SelectedNode.OutLinks.Item(1).dst.userdata;
                with dm10.qry_UpdCorr do
                begin
                  close;
                  parambyname('rcli').asinteger     := Wcli;
                  parambyname('rproj').asinteger    := WProj;
                  parambyname('rpaiAtu').asinteger  := WCodigo_Lista ;
                  parambyname('rpaiAnt').asinteger  :=  Wdst;
                  parambyname('rfilho').asinteger   := Wcodigo_Ant ;
                  parambyname('rtipop').asstring    := 'AP' ;
                  parambyname('rtipof').asstring    := 'RN' ;
                  prepare;
                  execsql;
                end;
               frm_Main.Salva_Idg(wnome_nivel,wcli,Wproj,Widg,WAtividadeMae,'',WClass_dg,wpai);
               Stat_salvou(true);
              end;
         end
         else
         If (Diag.SelectedNode.Shape IN [11,50,79]) then  // se muda AP, atualizar correlacao com regra.......
         begin
           //Inclui_Arvore(Diag.SelectedNode.text);
           frm_main.Cria_Correlacao(WCli,WProj,'XX',Widg,'AP', Diag.SelectedNode.userData,' ',0,0);
           If Diag.SelectedNode.InLinks.count = 0 then
              exit
           else
              begin
                for iRn:= 1 to Diag.SelectedNode.InLinks.count do
                begin
                  If Diag.SelectedNode.InLinks.Item(iRn).linkstyle = 4  then//correlacao com regra
                     begin
                         WOrg := Diag.SelectedNode.InLinks.Item(iRn).org.userdata;
                         with dm10.qry_UpdCorr1 do
                         begin
                          close;
                          parambyname('rcli').asinteger  := Wcli;
                          parambyname('rproj').asinteger := WProj;
                          parambyname('rpaiAtu').asinteger  := WCodigo_Lista;
                          parambyname('rpaiAnt').asinteger  := Wcodigo_Ant ;
                          parambyname('rfilho').asinteger:= Worg;
                          parambyname('rtipop').asstring := 'AP' ;
                          parambyname('rtipof').asstring := 'RN' ;
                          prepare;
                          execsql;
                        end;
                        frm_Main.Salva_Idg(wnome_nivel,wcli,Wproj,Widg,WAtividadeMae,'',WClass_dg,wpai);
                        Stat_salvou(true);
                    end;
                end;
              end;
         end
     end
  else                 //relações
     If Diag.sellinks.count > 0 then
     begin
    //If Diag.SelectedLink <> nil then
      for j := 1 to Diag.sellinks.count do
      begin
        case  Diag.sellinks.item(j).LinkStyle of
        2,5,6,9 :
          begin
            If wclass_dg = 'DMI' then
               exit;
          end
        else
          begin
            showmessage('A seleção deve conter o mesmo tipo de conexão');
             exit;
          end;

        end;
      end;
     frm_main.Mostra_Lista('Grupo de dados','DG', 'DG','DG',false,true,1,'IDF_DG');
     for j := 1 to Diag.sellinks.count do
     begin
       If Wcodigo_Lista <> 0 then     //selecionado
       Begin

          begin
            Diag.sellinks.Item(j).userdata := WCodigo_Lista;
            Diag.sellinks.Item(j).text := dm2.qry_Lista.FieldbyName('Idf_designacao').asstring;
           // Diag.SelectedLink.Userdata := WCodigo_Lista;
           // Diag.SelectedLink.text     := dm2.qry_Lista.FieldbyName('Idf_designacao').asstring ;
          end;

       end;
     creat := false;
     end;
     end;
end;

procedure Tfrm_dg.Wpicture(Sender: TObject);
begin
   If frm_dirbmp = nil then
      frm_dirbmp := tfrm_dirbmp.create(self);
   frm_dirbmp.show;
end;


procedure Tfrm_dg.Propriedades2Clic(Sender: TObject);
var
WFont :IFontDisp;
Wfont1 : Tfont;
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
        HaSelNodes := true;
        SetOleFont(frm_main.Fnt.font,Diag.Nodes.item(1).font);
        If frm_main.Fnt.execute then
        begin
         FontNode := true;
         GetOleFont(frm_main.Fnt.Font,WFont);
         for i := 1 to Diag.SelNodes.count do
         begin
           Diag.Selnodes.Item(i).ForeColor := frm_main.font.Color;
           Diag.SelNodes.Item(i).font      := wfont;
         end;
        end
        else
          exit;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      If not FontNode then
         begin
           SetOleFont(frm_main.Fnt.font,Diag.SelLinks.item(1).font);
            If frm_main.Fnt.execute then
               begin
                 GetOleFont(frm_main.Fnt.Font,WFont);
               end
            else
               exit;   
         end;
         for i := 1 to Diag.SelLinks.count do
           begin
             Diag.SelLinks.Item(i).ForeColor := frm_main.font.Color;
             Diag.SelLinks.Item(i).font      := wfont;
           end;
      end;
      If not (HaSelLinks) and not (HaSelNodes) then
         begin
           If frm_main.Fnt.execute then
           begin
             If Diag.selectedNode <> nil then
                begin
                 GetOleFont(frm_main.Fnt.Font,WFont);
                 Diag.SelectedNode.ForeColor := frm_main.font.Color;
                 Diag.SelectedNode.font      := wfont;
                end
             else
              begin
                Diag.SelLinks.Item(i).ForeColor := frm_main.font.Color;
                Diag.SelLinks.Item(i).font      := wfont;
              end;
           end;
         end;
end;

procedure Tfrm_dg.sp_oiClick(Sender: TObject);
var
Wpic : IPictureDisp;
begin
  //Diag.selectAction := afNoSelection;

end;

procedure Tfrm_dg.Grid1Click(Sender: TObject);
begin
  dg_corrente := diag;
  If frm_grid = nil then
     frm_grid := tfrm_Grid.create(self);
  frm_grid.show;
end;

procedure Tfrm_dg.Procura_Pai(pNode : TTreeNode);
begin
  If pNode.parent.level = 2 then
     begin
        pnode.parent.selected := true;
        frm_treeativ.TVDblClick(frm_dg);
     end
  else
     procura_pai(pNode.parent);
end;

procedure Tfrm_dg.SpeedButton16Click(Sender: TObject);
begin
  Procura_pai(WCurrentNode);
end;

procedure Tfrm_dg.fgridStyle;

begin
   diag.ShowGrid  := WShowGrid;
   diag.Gridstyle := WTipoGrid;

   If Wx > 0 then
      diag.xgrid := wx
   else
      diag.xgrid := 100;

   If Wy > 0 then
      diag.Ygrid := Wy
   else
      diag.ygrid := 100;
   diag.SnapToGrid := WSnapToGrid;
   Diag.GridColor  := WGridColor;
   Diag.backColor  := WDiagColor;
end;

procedure Tfrm_dg.SpeedButton1Click(Sender: TObject);
begin
 diag.xZoom := diag.xzoom + 10;
 diag.yzoom := diag.xzoom;
end;

procedure Tfrm_dg.SpeedButton13Click(Sender: TObject);
begin
  diag.xZoom := diag.xzoom - 10;
 diag.yzoom := diag.xzoom;
end;

procedure Tfrm_dg.spb_ajusteClick(Sender: TObject);
begin
  diag.xzoom := 0;
  diag.yzoom := 0;
end;

procedure Tfrm_dg.spb_normalClick(Sender: TObject);
begin
  diag.xzoom := 100;
  diag.yzoom := 100;
end;

procedure Tfrm_dg.Ajustar1Click(Sender: TObject);
begin
  spb_ajusteclick(frm_dg);
end;

procedure Tfrm_dg.TamanhoNormal1Click(Sender: TObject);
begin
    spb_normalclick(frm_dg);
end;


procedure Tfrm_dg.Mostra_detalhe(pTree : TtreeView);
var
i  : integer;
Wn : TtreeNode;

begin
    If pTree.Parent = frm_TreeAtor then
       begin
           ptree.Parent.left := 0;
        end;

    WIdg := udado(pTree.Selected.Data)^.Fcodigo;
    Salva_variaveis;
    frm_dg.caption := pTree.Selected.Text;
    WNome_nivel   := dm1.qry_subnivelSub_nome.asstring;
    WDiag_Id      := frm_Main.Procura_Idg(Wcli,Wproj,WIdg,WNome_Nivel,Widg,true,WClass_dg);
    //WNivel_Ativo  := dm1.qry_subnivelIdg_Nivel.asinteger;
    Wpai          := dm1.qry_subnivelDiag_Pai_id.asinteger;
    WAtividademae := dm1.qry_subnivelAtividade_mae.asinteger;
    Novo_Diag(WDiag_Id ,WNome_nivel) ;
end;


function Tfrm_dg.Alinha(pTipo : integer) : boolean;
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
 Went : afNode;
 Wt : string;
begin
  result := true;
  Wcount := diag.SelNodes.count;
  If Wcount > 1 then
  Begin
     Went    := diag.SelNodes.item(1);
     wt      := went.text;
     Wtopp   := Went.tOP;
     Wleft   := Went.Left;
     Wheight := Went.height;
     Wwidth  := Went.Width;
     for i := 2 to Wcount do
     Begin
       Went    := diag.SelNodes.item(i);
       wt := went.text;
       case pTipo of
       1 :  Begin                             //top
              Went.Top := Wtopp;
            end;

       2 :  Begin                            //bottom
             Went.Top := wtopp + (Wheight - went.height) ;
	    end;

       3 :  Begin
              Went.left := Wleft ;   //left
            end;

       4 :  Begin
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
              went.left :=Wleft + Wwidth/2 - went.width/2 ;
            end;

       end;
     frm_main.resize_rigid(Went);
     end;
  end;

end;


procedure Tfrm_dg.SpeedButton5Click(Sender: TObject);
begin
   alinha(1);
end;

procedure Tfrm_dg.SpeedButton3Click(Sender: TObject);
begin
  Alinha(2);
end;

procedure Tfrm_dg.SpeedButton12Click(Sender: TObject);
begin
   alinha(8);
end;

procedure Tfrm_dg.SpeedButton4Click(Sender: TObject);
begin
  alinha(4)
end;

procedure Tfrm_dg.SpeedButton6Click(Sender: TObject);
begin
  alinha(6);
end;

procedure Tfrm_dg.SpeedButton2Click(Sender: TObject);
begin
  alinha(5);
end;

procedure Tfrm_dg.SpeedButton8Click(Sender: TObject);
begin
  alinha(5);
  alinha(6);
end;

procedure Tfrm_dg.SpeedButton11Click(Sender: TObject);

begin

 If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show; 

end;

procedure Tfrm_dg.Ajusta1(Sender: TObject);
begin
 with diag do
 If selectedNode <> nil then
    If selectednode.Picture <> nil then
       begin
         selectednode.autosize := 1;
         selectednode.Transparent := true;
       end
    else

end;
procedure Tfrm_dg.Ajusta2(Sender: TObject);
begin
 with diag do
 If selectedNode <> nil then
    If selectednode.Picture <> nil then
       begin
         selectednode.autosize := 2;
         selectednode.Transparent := true;
       end
    else

end;
procedure Tfrm_dg.EntPopPopup(Sender: TObject);
var
popIt1,PopIt2,PopIt3 ,PopIt4,PopIt5,PopIt6,PopIt7,PopIt8,PopIt9,
popit10,popit11,POPIT12,popit13,popit14,popit15,popit16: TmenuItem;
popit151,popit152,popit153,popit154,popit155,popit156,popit157,popit158  : TmenuItem;
popit120,popit121,popit122,popit123,popit124,popit125,popit126 : TmenuItem;
popit17,popit18,popit19,popi20,popit21,popit22,popit23,popit24 ,popit25,popit26: TmenuItem;

rrr : string;
begin
  EntPop.items.Clear;
  If (diag.selectedNode = nil) and (Diag.SelectedLink = nil) and (Diag.Selnodes.count = 0) and (Diag.SelLinks.count = 0)then
     begin
      

      Popit25 := TmenuItem.create(self);
      Popit25.caption := 'Selecionar Tudo';
      Popit25.onClick :=  SelTudo;;
      EntPop.Items.add (popit25);

      Popit26 := TmenuItem.create(self);
      Popit26.caption := '-';
      EntPop.Items.add (popit26);

      Popit1 := TmenuItem.create(self);
      Popit1.caption := 'Propriedades';
      Popit1.onClick :=  Abrir1Click;
      EntPop.Items.add (popit1);
      exit;
     end
  else
     begin
       EntPop.items.Clear;
       If (WClass_dg = 'DPN')  or (WClass_dg = 'DUC')  then
          begin
            Popit1 := TmenuItem.create(self);
            Popit1.caption := 'Abrir';
            Popit1.onClick :=  WDblClick;
            EntPop.Items.add (popit1);
            If WClass_dg = 'DPN' then
              begin
                  If diag.selectedNode <> nil then
                  begin
                    If (Diag.SelectedNode.Shape = 11) or (Diag.SelectedNode.Shape = 79)
                        or (Diag.SelectedNode.shape = 50)then
                    begin
                      Popit24 := TmenuItem.create(self);
                      Popit24.caption := 'Executar';
                      Popit24.onClick :=  WExecutar;
                      EntPop.Items.add (popit24);
                    end;
                  end;
              end;
          end
       else
          begin
             Popit8 := TmenuItem.create(self);
             Popit8.caption := def950;
             Popit8.onClick :=  Wtexto;
             EntPop.Items.add (popit8);
          end;
      begin            //comum
         Popit4 := TmenuItem.create(self);
         Popit4.caption := '-';
         EntPop.Items.add (popit4);

         Popit3 := TmenuItem.create(self);
         Popit3.caption := 'Fonte';
         Popit3.onClick :=  Propriedades2Click;
         EntPop.Items.add (popit3);

         Popit16 := TmenuItem.create(self);
         Popit16.caption := 'Cor da Fonte';
         Popit16.onClick :=  CorFonte;
         EntPop.Items.add (popit16);

         Popit5:= TmenuItem.create(self);
         Popit5.caption := 'Cor';
         Popit5.onClick :=  WFillColor;
         EntPop.Items.add (popit5);
         
         Popit11:= TmenuItem.create(self);
         Popit11.caption := 'Bordas';
         EntPop.Items.add (popit11);

           Popit13:= TmenuItem.create(self);
           Popit13.caption := 'Espessura';
           popit11.add (popit13);

             popit151:= TmenuItem.create(self);
             Popit151.caption := '1';
             Popit151.onClick :=  Wespess;
             popit13.add (popit151);

             popit152:= TmenuItem.create(self);
             Popit152.caption := '2';
             Popit152.onClick :=  Wespess;
             popit13.add (popit152);

             popit153:= TmenuItem.create(self);
             Popit153.caption := '3';
             Popit153.onClick :=  Wespess;
             popit13.add (popit153);

             popit154:= TmenuItem.create(self);
             Popit154.caption := '4';
             Popit154.onClick :=  Wespess;
             popit13.add (popit154);

             popit155:= TmenuItem.create(self);
             Popit155.caption := '5';
             Popit155.onClick :=  Wespess;
             popit13.add (popit155);

             popit156:= TmenuItem.create(self);
             Popit156.caption := '6';
             Popit156.onClick :=  Wespess;
             popit13.add (popit156);

             popit157:= TmenuItem.create(self);
             Popit157.caption := '7';
             Popit157.onClick :=  Wespess;
             popit13.add (popit157);

             popit158:= TmenuItem.create(self);
             Popit158.caption := '8';
             Popit158.onClick :=  Wespess;
             popit13.add (popit158);


           Popit12:= TmenuItem.create(self);
           Popit12.caption := 'Cor da Borda';
           Popit12.onClick :=  BordaCor;
           popit11.add (popit12);

           Popit12:= TmenuItem.create(self);
           Popit12.caption := 'Estilo';
           //Popit11.onClick :=  Bordas;
           popit11.add (popit12);

             popit120:= TmenuItem.create(self);
             //Popit120.caption := 'Cheio';
             popit120.Bitmap  := fram_pic1.cheio.glyph;
             popit120.Bitmap.TransparentMode := tmauto;
             Popit120.onClick :=  Wstyle;
             popit12.add (popit120);

             popit121:= TmenuItem.create(self);
             //Popit121.caption := 'Tracejado';
             popit121.Bitmap  := fram_pic1.tracej.glyph;
             popit121.Bitmap.TransparentMode := tmauto;
             Popit121.onClick :=  Wstyle;
             popit12.add (popit121);

             popit122:= TmenuItem.create(self);
             //Popit122.caption := 'Pontilhado';
             popit122.Bitmap  := fram_pic1.ponti.glyph;
             popit122.Bitmap.TransparentMode := tmauto;
             Popit122.onClick :=  Wstyle;
             popit12.add (popit122);

             popit123:= TmenuItem.create(self);
             //Popit123.caption := 'Traço-Ponto';
             popit123.Bitmap  := fram_pic1.pont_trac.glyph;
             popit123.Bitmap.TransparentMode := tmauto;
             Popit123.onClick :=  Wstyle;
             popit12.add (popit123);

             popit124:= TmenuItem.create(self);
             //Popit124.caption := 'Traço-Ponto-Ponto';
             popit124.Bitmap  := fram_pic1.Trac_pont_pont.glyph;
             Popit124.onClick :=  Wstyle;
             popit12.add (popit124);

             popit125:= TmenuItem.create(self);
             Popit125.caption := 'Transparente';
             Popit125.onClick :=  Wstyle;
             popit12.add (popit125);

             popit126:= TmenuItem.create(self);
             //Popit126.caption := 'Cheio Interno';
             popit126.Bitmap  := fram_pic1.cheio.glyph;
             Popit126.onClick :=  Wstyle;
             popit12.add (popit126);

         If diag.sellinks.count = 0 then
         begin
          Popit7:= TmenuItem.create(self);
          Popit7.caption := 'Imagem';
          Popit7.onClick :=  WPicture;
          EntPop.Items.add (popit7);

         end;
         
         Popit19:= TmenuItem.create(self);
         Popit19.caption := '-';
         EntPop.Items.add (popit19);

         Popit18:= TmenuItem.create(self);
         Popit18.caption := 'Frente';
         PopIt18.Tag := 0;
         Popit18.onClick :=  Wfrente;
         EntPop.Items.add (popit18);

         Popit17:= TmenuItem.create(self);
         Popit17.caption := 'Atrás';
         PopIt17.Tag := 1;
         Popit17.onClick :=  Wfrente;
         EntPop.Items.add (popit17);

         If diag.selectedNode <> nil then
         begin
             If diag.selectedNode.picture <> nil then
             begin
               Popit10:= TmenuItem.create(self);
               Popit10.caption := Mens5;
               Popit10.onClick :=  Ajusta1;
               EntPop.Items.add (popit10);

               Popit11:= TmenuItem.create(self);
               Popit11.caption := mens5;
               Popit11.onClick :=  Ajusta2;
               EntPop.Items.add (popit11);
             end;
         end;
      end;
          end;

       If (WClass_dg = 'DPN')  or (WClass_dg = 'DUC') or (WClass_dg = 'DMI')then
          begin
             If WClass_dg = 'DUC' then
                begin
                   If Diag.SelectedLink <> nil then
                   begin
                     If Diag.SelectedLink.ArrowOrg = 0 then
                       begin
                         Popit1 := TmenuItem.create(self);
                         Popit1.caption := 'Mostrar Seta Origem';
                         Popit1.Tag     := 1;
                         Popit1.onClick := Wseta;
                         EntPop.Items.add (popit1)
                       end
                     else
                       begin
                         Popit6 := TmenuItem.create(self);
                         Popit6.caption := 'Eliminar Seta Origem';
                         Popit6.Tag     := 2;
                         Popit6.onClick := Wseta;
                         EntPop.Items.add (popit6);
                       end;

                     If Diag.SelectedLink.Arrowdst = 0 then
                       begin
                         Popit5 := TmenuItem.create(self);
                         Popit5.caption := 'Mostrar Seta Destino';
                         Popit5.Tag     := 3;
                         Popit5.onClick := Wseta;
                         EntPop.Items.add (popit5);
                       end
                     else
                       begin
                         Popit3 := TmenuItem.create(self);
                         Popit3.caption := 'Eliminar Seta Destino';
                         Popit3.Tag     := 4;
                         Popit3.onClick :=  Wseta;
                         EntPop.Items.add (popit3);
                       end;
                  end;     
                end;
             Popit6 := TmenuItem.create(self);
             Popit6.caption := '-';
             EntPop.Items.add (popit6);

             Popit2 := TmenuItem.create(self);
             Popit2.caption := 'Lista';
             Popit2.onClick :=  Lista1Click;
             EntPop.Items.add (popit2);
          end
       else
       If WClass_dg = 'DEO' then
          begin
             Popit6 := TmenuItem.create(self);
             Popit6.caption := '-';
             EntPop.Items.add (popit6);
             If Diag.SelectedNode.Shape = 9 then
                begin
                 Popit2 := TmenuItem.create(self);
                 Popit2.caption := 'Lista Atores';
                 Popit2.onClick :=  Lista1Click;
                 EntPop.Items.add (popit2);
                end
             else
             If (Diag.SelectedNode.Shape = 10) or (Diag.SelectedNode.Shape = 61) then
                begin
                 Popit9 := TmenuItem.create(self);
                 Popit9.caption := 'Lista Pessoas';
                 Popit9.onClick :=  Lista1Click;
                 EntPop.Items.add (popit9);
                end;
          end
   else
          If WClass_dg = 'LIV' then
             EXIT
     ELSE        
     begin
       EntPop.items.Clear;

       Popit3 := TmenuItem.create(self);
       Popit3.caption := 'Preferencias';
       Popit3.onClick :=  Grid1Click;
       EntPop.Items.add (popit3);

       Popit6 := TmenuItem.create(self);
       Popit6.caption := '-';
       EntPop.Items.add (popit6);

       Popit1 := TmenuItem.create(self);
       Popit1.caption := 'Fonte';
       Popit1.onClick :=  Propriedades2Click;
       EntPop.Items.add (popit1);

       Popit5:= TmenuItem.create(self);
       Popit5.caption := 'Cor';
       Popit5.onClick :=  WFillColor;
       EntPop.Items.add (popit5);

     end;

end;

procedure Tfrm_dg.SelTudo(sender : TObject);
begin
  diag.selectAll;
end;

procedure Tfrm_dg.WExecutar(sender : TObject);
var
Wexecutavel,Wpath,Wparam : string;
wpos : integer;
begin
try
  begin
    with dm8.qry_CorrSe do
    Begin
       close;
       parambyname('rcli').asinteger          := wCli;
       parambyname('rproj').asinteger         := WProj;
       parambyname('rtipo').asstring          := 'AP';
       parambyname('rpai').asinteger          := Diag.SelectedNode.userdata;
       parambyname('rtipofilho').asstring     := 'SE';
       prepare;
       open;
    end;
  If dm8.Qry_CorrSe.FieldbyName('IDF_SIGLA').asstring  = '' then
     raise exception.create('Não ha executável cadastrado para essa atividade!');
 // If ExtractFileExt(dm8.Qry_CorrSe.FieldbyName('IDF_SIGLA').VALUE)  <> 'exe'  then

  Wexecutavel := ExtractFileName(dm8.Qry_CorrSe.FieldbyName('IDF_SIGLA').VALUE);
  Wpos := pos('.',Wexecutavel);
  If Wpos = 0 then
    Wexecutavel := Wexecutavel + '.exe';
  WPath := ExtractFileDir(dm8.Qry_CorrSe.FieldbyName('IDF_SIGLA').VALUE);
  WParam := '';
  frm_main.ExecuteF(Wexecutavel,WParam,WPath,SW_SHOWNORMAL);
  end;
except
  begin
    raise;
  end;
end;
   
end;

procedure Tfrm_dg.WSeta(sender : TObject);
begin
  case tmenuitem(sender as Tobject).Tag of
    1 : Diag.SelectedLink.ArrowOrg := 4;
    2 : Diag.SelectedLink.ArrowOrg := 0;
    3 : Diag.SelectedLink.ArrowDst := 4;
    4 : Diag.SelectedLink.ArrowDst := 0;
  end;
end;

procedure Tfrm_dg.wfrente(sender : TObject);
begin
  Diag.SelectedNode.Zorder := tmenuitem(sender as Tobject).Tag;
end;

procedure Tfrm_dg.wstyle(sender : TObject);
var
pos : integer;
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   pos := tmenuitem(sender as Tobject).MenuIndex;
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
         HaSelNodes := true;
         FontNode := true;
         for i := 1 to Diag.SelNodes.count do
         begin
           diag.selNodes.Item(i).DrawStyle := pos;
         end;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      for i := 1 to Diag.SelLinks.count do
           begin
             diag.sellinks.item(i).DrawStyle := pos;
           end;
      end;

end;



procedure Tfrm_dg.wespess(sender : TObject);
var
pos : integer;
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   pos := tmenuitem(sender as Tobject).MenuIndex;
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
         HaSelNodes := true;
         FontNode := true;
         for i := 1 to Diag.SelNodes.count do
         begin
           diag.selNodes.Item(i).DrawWidth := pos+1;
         end;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      for i := 1 to Diag.SelLinks.count do
           begin
             diag.sellinks.item(i).DrawWidth := pos+1;
           end;
      end;

end;


procedure Tfrm_dg.CorFonte(sender : Tobject);
var
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
        HaSelNodes := true;
        cd.color := Diag.Nodes.item(1).forecolor;
        If cd.execute then
        begin
         FontNode := true;
         for i := 1 to Diag.SelNodes.count do
         begin
           Diag.Selnodes.Item(i).ForeColor := cd.Color;
         end;
        end
        else
          exit;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      If not FontNode then
         begin
            cd.color := Diag.Nodes.item(1).forecolor;
            If not cd.execute then
               exit;
         end;
         for i := 1 to Diag.SelLinks.count do
           begin
             Diag.SelLinks.Item(i).ForeColor := cd.Color;
           end;
      end;

end;


procedure Tfrm_dg.BordaCor(sender : Tobject);
var
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
        HaSelNodes := true;
        cd.color := Diag.Nodes.item(1).forecolor;
        If cd.execute then
        begin
         FontNode := true;
         for i := 1 to Diag.SelNodes.count do
         begin
           Diag.Selnodes.Item(i).DrawColor := cd.Color;
         end;
        end
        else
          exit;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      If not FontNode then
         begin
            cd.color := Diag.Nodes.item(1).forecolor;
            If not cd.execute then
               exit;
         end;
         for i := 1 to Diag.SelLinks.count do
           begin
             Diag.SelLinks.Item(i).DrawColor := cd.Color;
           end;
      end;

end;


procedure Tfrm_dg.WFillColor(sender : Tobject);
var
i : integer;
FontNode,HaSelNodes,HaSelLinks : boolean;
begin
   FontNode := false;
   HaSelNodes := false;
   HaSelLinks := false;
   If Diag.SelNodes.count > 0 then
      begin
        HaSelNodes := true;
        cd.color := Diag.Nodes.item(1).forecolor;
        If cd.execute then
        begin
         FontNode := true;
         for i := 1 to Diag.SelNodes.count do
         begin
           Diag.Selnodes.Item(i).FillColor := cd.Color;
         end;
        end
        else
          exit;
      end;

   If Diag.SelLinks.count > 0 then
      begin
      HaSelLinks := true;
      If not FontNode then
         begin
            cd.color := Diag.Nodes.item(1).forecolor;
            If not cd.execute then
               exit;
         end;
         for i := 1 to Diag.SelLinks.count do
           begin
             Diag.SelLinks.Item(i).DrawColor := cd.Color;
           end;
      end;

end;

procedure Tfrm_dg.SpeedButton9Click(Sender: TObject);
begin
  // problemas com objetos compostos
   diag.Copy(1);
end;


procedure Tfrm_dg.SpeedButton10Click(Sender: TObject);
begin
  diag.Paste(true);
end;

procedure Tfrm_dg.FormResize(Sender: TObject);
begin
  If (frm_dg <> nil ) and (frm_TreeAtiv <> nil) and
      (frm_dg.WindowState = wsNormal) and
      (frm_TreeAtiv.WindowState = wsNormal)  then
     frm_main.docaTree;
end;

procedure Tfrm_dg.Wtexto(Sender: TObject);
begin
  If frm_text = nil then
     frm_text := tfrm_text.create(self);
  frm_text.memo1.text := diag.selectedNode.text;   
  frm_text.show;
end;

procedure Tfrm_dg.sppClick(Sender: TObject);
begin
  Atualiza_entity;
end;

procedure Tfrm_Dg.Atualiza_entity; // reatualiza as descrições
var
i,tot,j,totLink,Tb,WShape,Wcod : integer;
pent,wnode  : afNode;
Wrel : afLink;
WClassName : string;
begin
  tot := diag.Nodes.Count;
  WChangeText := false;

  for i := 1 to tot do
  Begin
    Pent := diag.Nodes.item(i);
    TotLink := pent.links.Count;
    WShape := pent.Shape;
    Case Wshape of
    11,54,50,62,79: Begin      // 'processo_externo')'acao_processo')
             If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_PesqAp) then
                continue;
             pent.text := dm2.qry_PesqAp.Fieldbyname('Idf_Designacao').asstring;
            { WNode := frm_main.obtem_ator(pent);
             If wnode <> nil then
               Wnode.text :=  dm2.qry_PesqAp.Fieldbyname('Idf_ator1').asstring;}

             Wnode := frm_main.obtem_wbs(pent);
             If wnode <> nil then
               Wnode.text  :=  dm2.qry_PesqAp.Fieldbyname('Idf_wbs_code').asstring;
            end;
    56,59,65 : begin  //'evento_negocio'
             If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_en) then
               continue;
             pent.text := dm2.Qry_en.Fieldbyname('Idf_Designacao').asstring;
           end ;
    58,15 : Begin
          If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oi) then
                continue;
             pent.text := dm2.Qry_oi.Fieldbyname('Idf_Designacao').asstring;
         end ;
    8 : Begin   //'objeto_controle'
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oi) then
            continue;
            pent.text := dm2.Qry_oi.Fieldbyname('Idf_Designacao').asstring;
         end ;
    2 : Begin   //juncao
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ju) then
             continue;
             pent.text := dm2.Qry_ju.Fieldbyname('Idf_Designacao').asstring;
         end   ;
    55,9,53: Begin     //objeto_ator  objeto_externa  organo') then
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ca) then
               continue;
             pent.text := dm2.Qry_ca.Fieldbyname('Idf_Designacao').asstring;
           end  ;
    10,61 : Begin     //Pessoa
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_ps) then
               continue;
             pent.text := dm2.Qry_ps.Fieldbyname('Idf_Designacao').asstring;
           end  ;
    0 :  Begin   // 'objeto_entidade'
           If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_oe) then
              continue;
             pent.text := dm2.Qry_oe.Fieldbyname('Idf_Designacao').asstring;
         end  ;
    14 : Begin  // Regra'
          If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_rn) then
             continue;
             pent.text := dm2.Qry_rn.Fieldbyname('Idf_Designacao').asstring;
         end ;
    end;
    for j := 1 to TotLink do
        begin
           Wrel   :=  pent.links.item(j);
           Wstyl :=  WRel.LinkStyle ;
           Wcod   :=  Wrel.userdata;
           If Wcod = 0 then
              continue;
           Case  Wstyl of
           2,5,6,9 : begin     //fluxo de dados
                       If Wclass_dg = 'DPN' then
                         begin
                           If not frm_main.Procura_Registro(Wrel.Userdata,dm2.Qry_dg) then
                              continue;
                           Wrel.text := dm2.qry_dg.Fieldbyname('Idf_Designacao').asstring;
                         end;
                    end;
          end;
        end;
  end;
end;

procedure Tfrm_dg.FonteEntidades1Click(Sender: TObject);
var
WFont : IFontDisp;
Wtot,i : integer;
begin

   frm_main.fnt.font := WfontEntidade;
   If frm_main.Fnt.execute then
      begin
        GetOleFont(WFontEntidade,WFont);
        if MessageDlg('Aplicar ao Diagrama Corrente ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
            Wtot := Diag.Nodes.Count;
            for i := 1 to wtot do
            begin
              Diag.nodes.Item(i).font := Wfont;
            end;
           end;
        
      end;
end;

procedure Tfrm_dg.FonteFluxodeDados1Click(Sender: TObject);
var
WFont : IFontDisp;
Wtot,j,i,Wtot1 : integer;
begin
   If frm_main.Fnt.execute then
      begin
        GetOleFont(WFontLink,WFont);
         if MessageDlg('Aplicar ao Diagrama Corrente ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
            Wtot := Diag.Nodes.Count;
            for i := 1 to wtot do
            begin
              Wtot1 := Diag.nodes.item(i).links.count;
              for j := 1 to Wtot1 do
              begin
                 Diag.nodes.Item(i).Links.Item(j).font := Wfont;
              end;

            end;
           end;
      end;


end;


procedure Tfrm_dg.CorEntidades1Click(Sender: TObject);
var
Wtot,i : integer;
begin
  If cd.execute then
  begin
    WCorEntidade := cd.Color;
    if MessageDlg('Aplicar ao Diagrama Corrente ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
            Wtot := Diag.Nodes.Count;
            for i := 1 to wtot do
            begin
              Diag.nodes.Item(i).FillColor := cd.color;
            end;
           end;
  end;
  
end;

procedure Tfrm_dg.CorFluxodeDados1Click(Sender: TObject);
var
Wtot,j,i,Wtot1 : integer;
begin
  If cd.execute then
   begin
     WCorLink := cd.Color;
     if MessageDlg('Aplicar ao Diagrama Corrente ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
        Wtot := Diag.Nodes.Count;
        for i := 1 to wtot do
        begin
          Wtot1 := Diag.nodes.item(i).links.count;
          for j := 1 to Wtot1 do
          begin
             Diag.nodes.Item(i).Links.Item(j).DrawColor := cd.color;
          end;
             
        end;
       end;
   end;
      
end;

procedure TFrm_dg.Percorre(pNode : TTreeNode);  //le a arvore descendente a a partir do pai
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
         //Wniv := Wnome_nivel;
         //wnome := pnode.item[i].text;
         frm_treeativ.tv.selected := pnode.item[i];
         frm_treeativ.tvdblclick(frm_treeAtiv);
         If frm_ImpProc.cb_dg.checked then
            ImprimirDG;
         Imprimirdoc;
         percorre(pnode.Item[i]);
       end;
     end;
  end;
except
  begin
     raise;
  end;
end;

end;

procedure Tfrm_dg.ImprimirrDocumentao1Click(Sender: TObject);
begin
  If MessageDlg('Confirma a Impressão da Documentação ?', mtConfirmation,
          [mbYes, mbNo, mbCancel], 0) <> id_Yes then	{ produce the message dialog box }
      exit;
  ImprimirDoc;
  showmessage('Impressão terminada!');
end;

procedure Tfrm_dg.ImprimirDoc;
var
  Went : afNode;
  Wcount,CountDg,Wcod,j,tot,g : integer;

  rep : boolean;
  Wrel : afLink;
  Wnome,Winn : string;
  
begin

  Wcount := diag.Nodes.Count ;
  If Wcount = 0 then
     exit;

  for i := 1 to Wcount do     // total de entidades no diagrama
    Begin
     Went := diag.Nodes.item(i);
     Wcod := went.userdata;
     Wnome := went.text;
     for j := 0 to Wlist.count - 1 do
     Begin
        rep := false;
        If strtoint(Wlist[j]) = Wcod then
           Begin
              rep := true;
              break;
           end;
     end; 								
     If not rep then
     begin
     Wlist.add(inttostr(Wcod));
          Begin
             Case Went.Shape of
               11,50,79 :  begin     //atividades
                             Begin
                                JaAt := false;
                                for kat := 1 to WListAt.Count - 1 do
                                Begin
                                  If strtoint(WListAt[kat]) =  went.userdata then
                                     Begin
                                       JaAt := true;
                                       break;
                                     end;
                                end;
                                If not jaAt then
                                   WlistAt.add(inttostr(Went.userdata));
                               end;
                             If (frm_ImpProc.cb_ap.checked) then
                                 ImprimirAP(Wcod,Went);
                             If (frm_ImpProc.cb_gd.checked) then
                             begin
                                CountDg := went.links.count;
                                for g := 1 to CountDg do
                                 begin
                                   If went.Links.item(g).userdata > 0 then
                                      Begin
                                        Case went.links.item(g).LinkStyle of
                                         2,5,6,9 : Begin
                                                    JaDg := false;
                                                    for kdg := 1 to WListDg.Count - 1 do
                                                    Begin
                                                      If strtoint(WListDg[kdg]) =  went.Links.item(g).userdata then
                                                         Begin
                                                           JaDg := true;
                                                           break;
                                                         end;
                                                    end;
                                                    If not jadg then
                                                       WlistDg.add(inttostr(Went.Links.item(g).userdata));
                                                   end;
                                        end;
                                      end;
                                 end;
                             end;
                           end;

               14       : begin        // regras de negócio
                            If (frm_ImpProc.cb_rn.checked) then
                                ImprimirRN(Wcod,Went) ;
                          end;
  
               58       : begin       // objeto interface
                            If (frm_ImpProc.cb_oi.checked) then
                                ImprimirUC(Wcod,WEnt,58);
                          end;

               8        : begin      // obejeto controle
                            If (frm_ImpProc.cb_oc.checked) then
                                ImprimirUC(Wcod,WEnt,8);
                          end;

               65       : begin      // Evento de negócio
                            If (frm_ImpProc.cb_en.checked) then
                                ImprimirEN(Wcod,WEnt);
                          end;
               55       : begin      // Entidades externas
                            If (frm_ImpProc.cb_ee.checked) then
                                ImprimirEE(Wcod,WEnt);
                          end;

             end;
          end;
    end;
    end;
end;

procedure Tfrm_dg.ImprimirDados;
var
g : integer;
winn : string;
begin
If (frm_ImpProc.cb_gd.checked) then
    begin
        winn := '';
       for g := 0 to WListDg.Count - 1 do
        begin
           winn := winn + Wlistdg[g];
           If g < Wlistdg.count-1 then
              Winn := winn +',';
        end;
        If winn = '' then
           exit;
        with dm11.qry_std do
        begin
          close;
          sql.clear;
          sql.add('SELECT * FROM IDF_DG ');
          sql.add(' WHERE CLI_ID = '+''+inttostr(wCLI)+'');
          sql.add(' AND PRJ_ID  = '+''+inttostr(wPROJ)+'');
          sql.add(' AND IDF_DESIGNACAO <> '+''''+''+'''');
          sql.add(' AND IDF_CODIGO IN ('+ ''+Winn+''+')');
          sql.add(' ORDER BY IDF_DESIGNACAO ');
          open;
        end;
        with dm11.qry_DgDe4 do
          Begin
             close;
             parambyname('rcli').asinteger          := wCli;
             parambyname('rproj').asinteger         := wProj;
             prepare;
             open;
          end;
          If frm_pdata = nil then
             frm_pdata := tfrm_pdata.create(self);
         frm_Pdata.titulo.caption  := 'Fluxos de Dados';
         frm_Pdata.pr_cli.caption  := WCli_Nome;
         frm_Pdata.pr_proj.caption := WPrj_titulo;
         frm_Pdata.qrp.dataSet      := dm11.Qry_std;
         frm_Pdata.pNome.dataSet    := dm11.Qry_std;
         frm_Pdata.pdesc.dataSet    := dm11.Qry_std;
         frm_Pdata.pvol.dataSet     := dm11.Qry_std;
         frm_Pdata.pfreq.dataSet    := dm11.Qry_std;
         frm_Pdata.pMid.dataSet     := dm11.Qry_std;
         frm_Pdata.pver.dataSet     := dm11.Qry_std;
         frm_Pdata.pdataver.dataSet := dm11.Qry_std;
         frm_Pdata.presp.dataSet    := dm11.qry_dg;
         frm_Pdata.qr_de.dataSet    := dm11.qry_dgde4;
         frm_Pdata.pdes.dataSet     := dm11.qry_dgde4;
         If wImptxt then
           Wexport(Widg,nil,'DG',frm_pdata.qrp)
         else
           frm_pdata.qrp.print;
         FRM_PDATA.CLOSE;
    end;
end;
procedure Tfrm_dg.ImprimirUC(pCod : integer;pEnt :afNode;pTipo : integer);
begin
  If frm_puc = nil then
    frm_puc := Tfrm_Puc.Create(self);
  If (pTipo = 58 ) or (pTipo = 15)then
    Begin
       frm_puc.titulo.caption := 'OBJETO DE INTERFACE';
       frm_Puc.subtitulo.caption := pent.text;
    end
  else
    Begin
       frm_puc.titulo.caption := 'OBJETO DE CONTROLE';
    end  ;

  frm_Puc.subtitulo.caption := pent.text;
  frm_puc.pr_proj.caption   := Wprj_Titulo;
  frm_puc.pr_cli.caption    := WCli_Nome;
  with dm2.qry_oi do
  Begin
    close;
    parambyname('rcli').asinteger  := wcli;
    parambyname('rproj').asinteger  := wproj;
    parambyname('rcodigo').asinteger  := pcod;
    prepare;
    open;
  end;
  with dm2.Qry_ev do
   Begin
      close;
      parambyname('rcli').asinteger      := Wcli;
      parambyname('rproj').asinteger     := Wproj;
      parambyname('roi').asinteger       := pcod;
      prepare;
      open;
   end;
    with dm10.qry_lay do
       begin
         close;
         parambyname('rcli').asinteger := Wcli;
         parambyname('rproj').asinteger:= Wproj;
         parambyname('rcodigo').asinteger := pcod;
         prepare;
         open;
       end;
  If wImptxt then
     Wexport(pent.userdata,pent,'UC',frm_puc.qrp)
  else
     frm_puc.qrp.print;
  frm_puc.close;
end;

procedure Tfrm_dg.ImprimirAP(pCod : integer;pEnt :afNode);

Begin

   with dm2.qry_pesqAp do
   Begin
      close;
      parambyname('rcli').asinteger    := Wcli;
      parambyname('rproj').asinteger   := WProj;
      parambyname('rcodigo').asinteger := pcod;
      prepare;
      open;
   end;
   If frm_Pativ = nil then
      frm_Pativ := tfrm_Pativ.create(self);
   frm_main.Mostra_pap(pCod,frm_main);
   If wImptxt then
      Wexport(pent.userdata,pent,'AP',frm_Pativ.Qrp)
   else
     begin
	frm_pativ.qrp.print;
        frm_Pativ.close;
     end;

     
end;

procedure Tfrm_dg.ImprimirEN(pCod : integer;pEnt :afNode);

Begin

   If frm_pen = nil then
     frm_pen:= tfrm_pen.create(self);
    with dm2.qry_en do
     Begin
        close;
        parambyname('rcli').asinteger    := Wcli;
        parambyname('rproj').asinteger   := WProj;
        parambyname('rcodigo').asinteger := pcod;
        prepare;
        open;
     end;
    Begin
    with dm11.qry_ren do
      Begin
         close;
         parambyname('rcli').asinteger    := Wcli;
         parambyname('rproj').asinteger   := WProj;
         parambyname('rcodigo').asinteger := pCod;
         prepare;
         open;
      end;
    end;  
   frm_Pen.pr_cli.caption  := WCli_Nome;
   frm_Pen.pr_proj.caption := WPrj_titulo;
   frm_Pen.titulo.caption := 'EVENTO DE NEGÓCIO';
   frm_pen.subtitulo.caption := dm2.qry_en.Fieldbyname('idf_designacao').value;
   

   If wImptxt then
      Wexport(pent.userdata,pent,'EN',frm_pen.Qrp)
   else
     begin
       frm_pen.qrp.print;
     end;
   frm_Pen.CLOSE;

end;

procedure Tfrm_dg.ImprimirEE(pCod : integer;pEnt :afNode);

Begin
If frm_pca = nil then
    frm_pca := tfrm_pca.create(self);

    with dm2.qry_ca do
    Begin
        close;
        parambyname('rcli').asinteger    := Wcli;
        parambyname('rproj').asinteger   := WProj;
        parambyname('rcodigo').asinteger := pcod;
        prepare;
        open;
     end;
    with dm2.qry_IdfCorr1 do
    Begin
       close;
       parambyname('rcli').asinteger          := wCli;
       parambyname('rproj').asinteger         := wProj;
       parambyname('rtipo').asstring          := 'EE';
       parambyname('rpai').asinteger          := pCod;
       parambyname('rtipofilho').asstring     := 'PS';
       prepare;
       open;
    end;;

   frm_pca.qrp.dataset := dm2.qry_ca;
    //frm_pca.pTipo.dataset := dm2.qry_ca;
    frm_pca.pRole.dataset := dm2.qry_ca;
    frm_pca.pEfet.dataset := dm2.qry_ca;
    frm_pca.pQtde.dataset := dm2.qry_ca;
    frm_pca.pJorn.dataset := dm2.qry_ca;
    frm_pca.qrp.dataset := dm2.qry_ca;
    frm_pca.pDesc.dataset := dm2.qry_ca;
    frm_pca.pVer.dataset := dm2.qry_ca;
    frm_pca.pDataVer.dataset := dm2.qry_ca;
    frm_pca.presp.dataset := dm2.qry_ca;

    frm_pca.pForm.dataset := dm2.qry_ca;
    frm_pca.pCon.dataset := dm2.qry_ca;
    frm_pca.pComp.dataset := dm2.qry_ca;
    frm_pca.pRespons.dataset := dm2.qry_ca;
    frm_pca.pCond.dataset := dm2.qry_ca;
    frm_pca.pExp.dataset := dm2.qry_ca;

   frm_pca.qr_ps.dataset := dm2.qry_IdfCorr1;
   frm_pca.pPessoa.dataset := dm2.qry_IdfCorr1;

   frm_pca.childband2.height := 0;
   frm_pca.childband3.height := 0;
   frm_pca.childband4.height := 0;
   frm_pca.childband5.height := 0;
   frm_pca.childband6.height := 0;
   frm_pca.childband7.height := 0;

    frm_pca.qrlabel7.height := 0;
    frm_pca.qrlabel10.height := 0;
    frm_pca.qrlabel11.height := 0;

    frm_pca.pefet.height := 0;
    frm_pca.pjorn.height := 0;
    frm_pca.pqtde.height := 0;
  //frm_pca.subtitulo.caption := dbedit4.text;
   frm_Pca.titulo.caption  := 'ENTIDADES EXTERNAS';
   frm_PCA.pr_cli.caption  := WCli_Nome;
   frm_PCA.pr_proj.caption := WPrj_titulo;
   
   If wImptxt then
      Wexport(pent.userdata,pent,'EE',frm_pCA.Qrp)
   else
     begin
       frm_pca.qrp.print;
     end;
   frm_Pca.CLOSE;
end;


procedure Tfrm_dg.WExport(pCod : integer;pEnt :afNode;pNom : string;pRel : TQuickRep);
var
wnom : string;
//atext : TQRAsciiExportFilter;
begin
 {Wnom := WDirImp+pnom+inttostr(Wcli)+inttostr(Wproj)+
           inttostr(pCod)+'.txt';
 Atext := TQRAsciiExportFilter.Create(Wnom);
 try
    prel.ExportToFilter(Atext);
 finally
    Atext.Free;
 end; }
end;


procedure Tfrm_dg.ImprimirRN(pCod : integer;pEnt :afNode);
Begin
   If frm_pregra = nil then
      frm_pregra := tfrm_pregra.create(self);
     with dm2.qry_rn do
      Begin
         close;
         parambyname('rcli').asinteger := Wcli;
         parambyname('rproj').asinteger := WProj;
         parambyname('rcodigo').asinteger := pCod;
         open;
      end;

   with dm6.qry_rnat do
      Begin
         close;
         parambyname('rcli').asinteger := Wcli;
         parambyname('rproj').asinteger := WProj;
         parambyname('rcodigo').asinteger := pCod;
         prepare;
         open;
      end;
   frm_Pregra.titulo.caption  := 'REGRA DE NEGÓCIO';
  // frm_Pregra.subtitulo.caption  := dm2.qry_rnIdf_designacao.value;
   frm_Pregra.pr_cli.caption  := WCli_Nome;
   frm_Pregra.pr_proj.caption := WPrj_titulo;
   If wImptxt then
   begin
       Wexport(pent.userdata,pent,'RN',frm_pregra.qRP);
   end
   else
   frm_pregra.qRP.print;
   frm_pregra.close;

end;


procedure Tfrm_dg.ImprimirDG;
var
wpic         :IPictureDisp;
WShowgridAnt : boolean;
Wpos         : Integer;
Wnome        : string;
begin
 WShowgridAnt := Diag.ShowGrid;
 diag.SelectAll;
 If diag.SelNodes.Count = 0 then
    exit;
 If frm_pdiag = nil then
    frm_pdiag     := Tfrm_pdiag.create(self);

 {with dm10.qry_PesqCli do
 begin
   close;
   sql.clear;
   sql.add('SELECT * FROM CLI_CLIENTE WHERE CLI_ID = '+''+inttostr(Wcli)+'');
   open;
   Wcli_nome := dm10.qry_PesqClicli_nome.value;
 end;
  with dm10.qry_Pesqproj do
 begin
   close;
   sql.clear;
   sql.add('SELECT * FROM PRJ_PROJETO WHERE PRJ_ID = '+''+inttostr(Wproj)+'');
   sql.add(' AND CLI_ID ='+''+inttostr(Wcli)+'');
    open;
   Wprj_titulo := dm10.qry_PesqProj.fieldbyname('prj_titulo').value;
 end;  }
 If Wimptxt then           //exporta emf
    begin
     WNome := Wdirimp + WDiag_id;
     Wpos :=  pos('.',WNome) ;
     If Wpos = 0 then
       WNome := WNome+ '.emf'
     else
      WNome := copy(WNome,1,Wpos-1)+ '.emf';
      Wgrid := Diag.Showgrid;
      Diag.Showgrid := false;
      Diag.saveImage(0,1,WNome);
      Diag.ShowGrid := WGrid;
    end
 else
    begin
       frm_pdiag.pr_cli.caption  := Wcli_nome;
       frm_pdiag.pr_proj.caption := Wprj_titulo;
       frm_pdiag.Ldesc.caption   := WNome_Nivel;
       Wpic := diag.ExportPicture(0,false,false)  ;
       Diag.saveImage(0,1,frm_main.lastDir+'img.emf');
       frm_pdiag.pdiag.Picture.LoadfromFile(frm_main.lastDir+'img.emf');

       
      // frm_Pdiag.ldesc.left      := (frm_Pdiag.ph1.width - frm_Pdiag.Ldesc.width) div 2;
       //Wpic := diag.ExportPicture(0,false ,false)  ;
      // SetOlePicture(frm_pdiag.pdiag.Picture ,Wpic);
       frm_pdiag.qrp.print;
       Diag.Showgrid := WShowgridAnt;
    end;
 
 frm_pdiag.close;
 end;

procedure Tfrm_dg.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_dg.SpeedButton60Click(Sender: TObject);
var
wdes,hdes,esq: real;
begin

end;


procedure Tfrm_dg.poe_wbs(pNode : afNode;pwbs : string);
var
i :integer;
Wbs : afNode;
begin
  Wbs        := frm_main.Obtem_Wbs(pNode);
  If Wbs <> nil then
     Wbs.text   := pWbs;
end;

procedure Tfrm_dg.poe_ator(pNode : afNode;pAtor : string);
var
i :integer;
Wator : afNode;
begin
  WAtor      := frm_main.Obtem_Ator(pNode);
  If Wator <> nil then
     Wator.text := pAtor;
  
end;

procedure Tfrm_dg.Inclui_arvore
(pDesc : string; pCompl : string;pWbs : string); //atualiza descrição ou inclui node(rotina procura_idg) qdo não existe
var
Wpai_Ant,WNivel_Ant,i,WAvo_ant,WCli_ant,WProj_Ant,WIdg_ant : integer;
WNome_Ant,Class_Ant,Classdgant : string;
Wnode : TTreeNode;
begin
try
  begin
    If  diag.selectedNode <> nil then
    begin
      diag.selectedNode.text := pDesc ;
      Poe_ator(Diag.selectedNode,pCompl);
      Poe_wbs(Diag.selectedNode,pwbs);
      If diag.selectedNode.Shape = 54  then //processo externo
         exit;
    end;
  WIdg_Ant   := WIdg;
  Wcli_Ant   := Wcli;
  Wproj_Ant  := Wproj;
  Wpai_Ant   := Wpai;           //Cria um registra de de diagrama para a atividade criada
  WNivel_Ant := WNivel_Ativo;   // para que possa aparecer no treeView
  WNome_Ant  := WNome_Nivel;
  Class_Ant  := WClass_DgEsc;
  Classdgant := WClass_dg;
  WAvo_Ant   := WAvo;
  If frm_ap <> nil then
  begin
     If frm_ap.dbedit11.text = 'UC' then
        Wclass_dg := 'DUC';
  end;

  frm_Main.Procura_Idg(Wcli,Wproj,diag.selectedNode.Userdata,pDesc,Wpai,true,WClass_dg);
  begin
  If frm_TReeAtiv <> nil then
    begin
       Wnode := frm_TreeAtiv.Procura_Node(diag.selectedNode.Userdata,Wcli,Wproj,WIdg);
       frm_treeativ.tv.selected := Wnode;//
       If Wnode = nil then
          exit;
       WNode.text := pDesc;
    end;
  end;
  Wcli         := WCli_Ant;
  WProj        := WProj_ant;
  Widg         := WIdg_Ant;
  Wpai         := Wpai_Ant;
  Wavo         := Wavo_Ant;
  WNivel_Ativo := WNivel_Ant;
  WNome_Nivel  := WNome_Ant;
  WClass_DgEsc := Class_Ant;
  WClass_dg    := Classdgant;
 //frm_main.identifica_node(frm_TreeAtiv.tv.Selected.parent);
  //frm_TreeAtiv.tv.Selected:= frm_TreeAtiv.tv.Selected.parent;
  frm_TreeAtiv.tv.Selected:= WcurrentNode;
  end;
except
  begin
    raise;
  end;
end;
end;

procedure Tfrm_dg.stat_salvou(psalv : boolean);
begin
   If pSalv then
      begin
        chg := false;
        speedbutton17.enabled := false;
      end
   else
      begin
        chg := true;
        speedbutton17.enabled := true;
      end;

end;


procedure Tfrm_dg.ExportarcomoBMP1Click(Sender: TObject);
var
Wgrid : boolean;
Wpict : TPicture;
Wpic : IpictureDisp;
WPos : integer;
begin
Wpict := Tpicture.create;
Wpict.Metafile;

If frm_dg <> nil then
begin
   
   If frm_diretorio = nil then
     frm_diretorio := tfrm_diretorio.create(self);
  //frm_diretorio.fl.mask := '.add';
  frm_diretorio.showModal;
  If Wdiretorio <> '' then
     begin
     Wpos :=  pos('.',WDiretorio) ;
      If Wpos = 0 then
         Wdiretorio := WDiretorio+ '.emf'
      else
      Wdiretorio := copy(Wdiretorio,1,Wpos-1)+ '.emf';
      Wgrid := Diag.Showgrid;
      Diag.Showgrid := false;
      Diag.saveImage(0,1,WDiretorio);
      {Wpic := Diag.ExportPicture(afAllItems, True, True);
      
      setOlePicture(WPict,Wpic);
      Wpict.SaveToFile(WDiretorio);  }
      Diag.ShowGrid := WGrid;
     end;
end;

end;

procedure Tfrm_dg.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  If dg_created then
  begin
     If frm_dg.WindowState = wsNormal  then
      begin
        width_ant  := width;
        height_ant := height;
        top_ant    := top;
        left_ant   := left;
      end
     else
     If frm_dg.WindowState = wsmaximized  then
      begin
        Newwidth := width_ant;
        Newheight   := height_ant;
        top := top_ant;
        left := left_ant;
      end
  end;
  

end;

procedure Tfrm_dg.FormCreate(Sender: TObject);
begin
   If frm_logo <> nil then
      frm_logo.close;
   Diag := nil  ;
   If viewer then
      SpeedButton17.visible := false;
end;

procedure Tfrm_dg.Abrir2Click(Sender: TObject);
begin
  Creat := false;
  WDblClick(frm_dg);
end;

procedure Tfrm_dg.Propriedades1Click(Sender: TObject);
var
i : integer;
wi : variant;
begin
  Dg_Corrente := Diag;
  If frm_propr = nil then
     frm_propr := Tfrm_propr.Create(self);
  frm_propr.rg_Align.Itemindex  := diag.selNodes.item(1).Alignment;
  frm_propr.rg_estilo.Itemindex := diag.selNodes.item(1).Drawstyle;
  frm_propr.cd_borda.color      := diag.selNodes.Item(1).DrawColor;
  frm_propr.cd_fundo.color      := diag.selNodes.Item(1).fillColor;
  frm_propr.cd_fonte.color      := diag.selNodes.Item(1).ForeColor;
  frm_propr.fnt.font.color      := diag.selNodes.Item(1).ForeColor;
  Wi := diag.selNodes.Item(1).DrawWidth  ;
  frm_propr.rg_espessura.Itemindex := Wi ;
  frm_propr.show;
end;

procedure Tfrm_dg.Propriedades2Click(Sender: TObject);
begin
   Dg_Corrente := Diag;
   If frm_ProprLink = nil then
      frm_proprLink := tfrm_ProprLink.Create(self);
   frm_ProprLink.show;     
end;

procedure Tfrm_dg.Executar1Click(Sender: TObject);
begin
  WExecutar(frm_dg);
end;

procedure Tfrm_dg.Atrs1Click(Sender: TObject);
begin
  Diag.SelectedNode.Zorder := 1;
end;

procedure Tfrm_dg.Frente1Click(Sender: TObject);
begin
  Diag.SelectedNode.Zorder := 0;
end;

procedure Tfrm_dg.SpeedButton49Click(Sender: TObject);
begin
  Alinha(9);
end;

procedure Tfrm_dg.cfgClick(Sender: TObject);
begin
  If frm_cfg = nil then
     frm_cfg := tfrm_cfg.create(self);
  frm_cfg.show;   
end;

procedure Tfrm_dg.spyClick(Sender: TObject);
begin
 alinha(3);
end;

procedure Tfrm_dg.Estmulo1Click(Sender: TObject);
begin
  If diag.selectedLink.ArrowMid > 0 then
     diag.selectedLink.ArrowMid := 0
  else
     diag.selectedLink.ArrowMid := diag.selectedLink.Arrowdst;
end;

procedure Tfrm_dg.FormActivate(Sender: TObject);
begin
   If frm_treeativ <> nil then
      begin
        If WcurrentNode = nil then
           exit;
        //WCurrentNode := WCurrentAnt;
        frm_main.Identifica_node(WCurrentNode);
        frm_treeativ.tv.selected := WCurrentnode;
      //  frm_treeativ.Abre_diagrama(WCurrentNode);
      end;
  ;
end;

procedure Tfrm_dg.SpeedButton7Click(Sender: TObject);
begin
   Diag.SelectAction := 2;
end;

procedure Tfrm_dg.Selecionar1Click(Sender: TObject);
begin
  diag.selectAll;
end;

procedure Tfrm_dg.Ator1Click(Sender: TObject);
var
pent : afNode;
begin
  pent := diag.selnodes.item(1);
  If not frm_main.Procura_Registro(pent.Userdata,dm2.Qry_PesqAp) then
    begin
      showmessage(Mens4) ;
      exit;
    end;
    fromtree := false;
  If frm_ap = nil then
     frm_ap := Tfrm_ap.create(self);
  frm_ap.pgc.activepage := frm_ap.Tabsheet6;
  frm_ap.pgcChange(frm_dg);  
  frm_ap.show;
end;

procedure Tfrm_dg.IncluiImagem1Click(Sender: TObject);
begin
  Wpicture(frm_dg) ;
end;

procedure Tfrm_dg.AjustaImagemaEntidade1Click(Sender: TObject);
begin
  Ajusta1(frm_dg);
end;

procedure Tfrm_dg.AjustaEntidadeaImagem1Click(Sender: TObject);
begin
  Ajusta2(frm_dg);
end;

procedure Tfrm_dg.FormDeactivate(Sender: TObject);
begin
  //If frm_treeAtiv <> nil then
    // WCurrentAnt := frm_TreeAtiv.tv.Selected;
end;

procedure Tfrm_dg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If viewer then
       exit;
    If key = VK_ESCAPE then
       begin

       end;
end;

end.

