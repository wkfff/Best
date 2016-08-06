unit bst_idiomas;

 {transforma todos os strings, menu grids, etcc.conforme o idioma

 Para criar variáveis em vários idiomas :

 - Criar a variável defnnn no pgm bst_main

 - criar a variável defPTnnn com conteúdo português , no pgm bst_mainpt
 - Carregar a variável defPTnnn , na variável correspondente defnnn (função fResPT)

 - criar a variável defXXnnn em todos os pgm de linguas best_mainXX
 - Carregar a variável defXXnnn , na variável correspondente defnnn  (função fResXX)

 A variável a ser usada no BEST deverá sempre ser defnnn.

 Atualizar também o load_constant, para cada form
 }
interface
uses windows,menus,dialogs,forms;

function LingPT(sender : TObject) : boolean;


function Ling(pIdioma : string; sender : TObject) : boolean;
function Load_constants(sender : TObject) : boolean; //carrega as constantes nas variáveis do form, no iduoma escolhido

implementation

uses  bst_MainPT, bst_main, bst_icereg, bst_treeAtiv,
  bst_telaObj, bst_ap, bst_if, bst_lista, bst_clifull, bst_basefrm,
  bst_tabenga, bst_qry, CAD_STAND;

function Ling(pIdioma : string; sender : TObject) : boolean;
 Begin

   LingPT(sender);
   Load_constants(sender);   //carrega as constantes nas variáveis do form, no iduoma escolhido

 end;

function LingPT(sender : TObject) : boolean;
 Begin
    fMainMenuPT (frm_main.MM) ;
    fResPT;
    If frm_treeativ <> nil then
      Begin
         fTreeAtivPopnodePT (frm_treeativ.PopNode) ; //menu Popup PopNode
         fTreeAtivEntPopePT (frm_treeativ.EntPop) ; //menu Popup EntPop
         fTreeAtivPopLinkPT (frm_treeativ.PopLink) ; //menu Popup PopLink
         fTreeAtivPopLivPT (frm_treeativ.PopLiv) ; //memu PopUp do free diagram
      end;
     If frm_qry <> nil then
       fQueryPT (frm_qry.MainMenu1);
 end;



function Load_constants(sender : TObject) : boolean;
 Begin
     If (sender as TForm) is TBasefrm then     //tabelas
        (sender as TBaseFrm).LoadConstant;
     If (sender as TForm) is TCad_STand then     //tabelas
        (sender as TCad_STand).LoadConstant;
end;

end.
