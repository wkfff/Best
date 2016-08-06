unit cls_codigo;     // best 6_38

{ pendencias :

criar Get_maxkey
criar get_alldoPai (masterdetail)

}
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls,ComCtrls, DB,IBDatabase,forms,menus,
  strutils,bstdb,AddFlow3Lib_TLB,Activex, OleCtrls,AxCtrls,Buttons, gtQrCtrls,
  ADODb,fonctions,Qrctrls, QuickRpt,math, cls_bd,filectrl, bst_ger;



 type
 // Forward references

    // Class reference type
 TOOClass = class of TObject;

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


  function Altera_nome_unit(wnom,wprg: string;pUnit : Tmemo) : Boolean;
  // localiza a linha de pObjeto dentro de pUnit, começando a partir de pLin
  function Localiza_Objeto(pUnit : TObject;pObjeto : string;pLin : integer ) : integer;

  function Insere_Bloco (pUnit : Tmemo;pIni,pFim : integer;pText : string;pLocIni,pexiste : boolean) : TMemo;

 // function Atu_Property (pUnit : Tmemo;pobj : string) : Tmemo;

  function Gera_OO (oDesign : OODesign;pSet : TDad) : Tmemo;

  procedure Salva_cpo (pSet : TDad);  
 
  // Inclui as declarações das Funções de Obejtos de negócio
  function Inclui_DeclaracaoOO (pClasseId : integer;pParm,pTabela : string; pCompleto : boolean;pooClasseFilho : string) : TstringList;
   // gera o código das properties
  function Inclui_Property (odesign : OOdesign;pCompleto : boolean) : TStringList;
   //cria variáveis das properties
  function Inclui_VariaveisProp (odesign : OOdesign;pCompleto : boolean) : TStringList;

  function Inclui_SetValue (wNom : string;pCompleto : boolean) : TStringList;


  // Inclui o Método  na Tabela IDF_MT  (pTipo I ; INCUI; U: UPDATE ; D : DELETE
  function Inclui_Metodo (pClasse : integer;pTabela,pFunction,pObjetivo: string;
                         pParm : TstringList;pCompleto : boolean;pVisibility,pTipo,pType : string) : TstringList;
  { gera a funcáo GetItem do objeto de negócio}
 // function Cria_GetItem(pTabela,pClassdados,pClasse : string;pCompleto : boolean) : TStringList;

 
  { gera a funcáo Posiciona do objeto de negócio}
//  function Cria_Posiciona(pTabela,pClassdados,pClasse : string;pCompleto : boolean) : TStringList;

  {retorna a posição do campo CPO}
  function get_InfoCPO (pCpo: string) : integer;
  {retorna PK}
  function get_Chave () : string;

  function Inclui_Constante (odesign : OOdesign) : TStringList;

  function Desloca(pObject : TObject;pDirection,pDist : integer) : boolean;   //1 : direita;2 : esquerda; 3 : up; 4 : down
var
wformdg : boolean;

dg_classe : string;
dg_cli,dg_cenario : integer;
oPop : TpopUpMenu;
i , w,aaa,www : integer;

s,firstargum,lastargum ,TIPO_LASTARGUM: string;
a1,b1,c1,d1,tot : integer;
a2,a3,a4 : double;
aCpo,aCpoMast,aPk,aTipo,aDef,aTerm,aCaption,aObrig,aVisible,aDominio,aTabref : array of string;
lList,wcposql,wvalorsql,wtiposql,wsql,wpk: TstringList;

const
wInteiro: array[0..8] of sTRING = ('I','INTEGER', 'INT', 'SMALLINT', 'LONG', 'SHORT','SERIAL','SHORTINT','LONGINT');
wString : array[0..5] of string = ('C','VARCHAR','NVARCHAR','TEXT','NTEXT','CHARACTER');
wReal   : array[0..6] of string = ('N','FLOAT','SMALLFLOAT','SINGLE','REAL','DECIMAL','DOUBLE');
wdate   : array[0..2] of string = ('D','DATETIME','DATE');

implementation

uses bst_main, bst_cs;

{gera unidade com Classes e comandos SQL, a partir das Classes}



function  Altera_nome_unit(wnom,wprg: string;pUnit : Tmemo) : Boolean;
var                       //wnom : nome do objeto
i,j : integer;              //prg : nome da unit
 Begin                    //punit : programa
   result := true;

   i := Localiza_objeto(pUnit,'USES',0);
   Insere_Bloco(pUnit,i,i+1,'Aligrid,DataTier'+',',TRUE,TRUE);

   //altera nome unit
   for i := 0 to pUnit.Lines.Count - 1 do
    Begin
      If pos('unit', trim(pUnit.Lines[i])) > 0 then
       Begin
        pUnit.Lines.Delete(i);
        pUnit.lines.Insert(0,'unit '+wprg+';');
       end;
    end;
 end;

function Localiza_Objeto(pUnit : TObject;pObjeto : string;pLin : integer ) : integer;
var                        // localiza a linha de pObjeto dentro de pUnit, começando a partir de pLin
i,y : integer;
s : string;
 Begin
    result := -1;
    If pUnit is Tmemo then
      Begin

         for i := pLin to Tmemo(pUnit).Lines.Count - 1 do
          Begin
            s := (pUnit as TMemo).Lines[i];
            If pos(uppercase(pObjeto), UPPERCASE(trim(s))) in [1,2,3] then
             Begin
                result := i;
                break;
             end;
          end;
      end
     else
      If pUnit is TStringList then
      Begin
         for i := pLin to TStringList(pUnit).Count - 1 do
          Begin
            s := (pUnit as TStringList)[i];
            If pos(uppercase(pObjeto), UPPERCASE(trim(s))) in [1,2,3] then
             Begin
                result := i;
                break;
             end;
          end;
      end

 end;

function Insere_Bloco (pUnit : Tmemo;pIni,pFim : integer;pText : string;pLocIni,pexiste : boolean) : TMemo;
var                                             //insere pText entre linhas pIni e pFim no pUnit(memo)
i ,k ,Y,j,LinIni,LinFim,PrivIni: integer;       // se pLocIni true, insere logo apos pIni; senão logo antes pFim
wlinecode : string;                             // se pexiste = true, verifica se já nào existe
wlote  : TStringList;
wcpo : array of string;
 Begin
   result := punit;
   for j := pIni to pFim do
    Begin
    If pexiste then
     Begin
       wLineCode := trim(UPPERCASE(pUnit.Lines[j]));
       If pos(trim(Uppercase(pText)),  wLineCode ) > 0 then  //já existe, sai;
        exit;
     end;

    end;
    If pLocini then
      Begin
        Begin
          punit.Lines.Insert(pIni+1,pText)
        end;
      end
    else
      Begin
        punit.Lines.Insert(pFim-1,'  '+pText);
      end;

 end;


{function Atu_Property (pUnit : Tmemo;pobj : string) : Tmemo;
var
i ,k ,Y,j,w,ObjIni,ObjFim,PrivIni,LinIni,LinFim,wCount,LinvalIni,LinValFim: integer;
wlinecode : string;
wlote  : TStringList;
wcpo : array of string;
 Begin

   Objini := Localiza_objeto(pUnit,pObj,0);  // localizas Objeto

     //variaveis das properties
   LinIni := Localiza_objeto(pUnit,'PRIVATE',ObjIni);
   LinFim := Localiza_objeto(pUnit,'PUBLIC',LinIni);
    for i := 0 to length(aCpo) - 1 do
      Begin
        wLineCode := '  F'+aCpo[i] + adef[i]+';';
        Insere_bloco(pUnit,LinIni,LinFim,wLineCode,true,true)
      end;

     //procedures das properties
   LinIni := Localiza_objeto(pUnit,'PRIVATE',ObjIni);
   LinFim := Localiza_objeto(pUnit,'PUBLIC',LinIni);
    for i := 0 to length(aCpo) - 1 do
      Begin
        wLineCode := ' procedure Set'+aCpo[i] + '(const value  '+adef[i]+');';;
        Insere_bloco(pUnit,LinIni,LinFim,wLineCode,false,true)
      end;

      // properties
   LinIni := Localiza_objeto(pUnit,'PUBLISHED',ObjIni);
   LinFim := Localiza_objeto(pUnit,'END;',LinIni);
   wCount := pUnit.Lines.count;
    for i := 0 to length(aCpo) - 1 do
      Begin
        wLineCode := '  property '+uppercase(aCpo[i]) + adef[i] + ' read F'+ aCpo[i] +  ' write Set'+ aCpo[i] +';';
        Insere_bloco(pUnit,LinIni,LinFim,wLineCode,true,true);
        If pUnit.LInes.count > wCount then       // incluiu uma linha
           Begin
                 // set values
              LinValIni := Localiza_objeto(pUnit,'{Set Value}{',ObjIni);
              LinValFim := Localiza_objeto(pUnit,'END;',LinValIni);
              wLineCode :=' end;';
              Insere_bloco(pUnit,LinValIni,LinValFim,wLineCode,true,false);
              wLineCode := '  F'+aCpo[i]+' := value;';
              Insere_bloco(pUnit,LinValIni,LinValFim,wLineCode,true,false);
              wLineCode :=' begin';
              Insere_bloco(pUnit,LinValIni,LinvalFim,wLineCode,true,false);
              wLineCode := 'procedure '+pObj+'.Set'+ aCpo[i]+'(const value  '+adef[i]+');';
              Insere_bloco(pUnit,LinValIni,LinValFim,wLineCode,true,false);
           end;
      end;
 end;  }


 // retorna os atributos que compoe a PK}
function get_Chave () : string;
var
i,j : integer;
 begin
    j := -1;
    result := '';

    for i := 0 to length(aPk) - 1 do
     begin
      If (aPk[i] = '1') then
         Begin
           result := aCpo[i] ;
           j := i;
           break;
         end;
     end;
   If j < 0 then
     raise exception.create(mens146);
 end;


function get_InfoCPO (pCpo: string) : integer;
var
i : integer;
 begin
    result := -1;
    for i := 0 to length(aCpo) - 1 do
     begin
      If (aCpo[i] = pCpo)  then
       begin
         result := i;
         break;
       end;
     end;
 end;
 
// Inclui o Método  na Tabela IDF_MT  (pTipo I ; INCUI; U: UPDATE ; D : DELETE
function Inclui_Metodo (pClasse : integer;pTabela,pFunction,pObjetivo: string;
                        pParm : TstringList;pCompleto : boolean;pVisibility,pTipo,pType : string) : TstringList;
var
iMt : TIdf_mt;
iPr : TIdf_pr;
i,k : integer;
wpk : TstringList;
 begin
  iMt := TIdf_mt.create(application);
  iPr := TIdf_pr.create(application);
   with iMt do
       begin
         CLI_ID              := frm_ger.cliente;
         PRJ_ID              := frm_ger.Cenario;
         IDF_CODIGO          := 0;
         CLASS_ID            := pClasse;
         IDF_DEL             := ' ';
         IDF_DESIGNACAO := pFunction;
         IDF_DIRETORIO       := ' ';
         IDF_OBJETIVO :=  pObjetivo ;
         IDF_RESPONSAVEL     := ' ';
         IDF_TIPO_ATIVIDADE  := 'MT';
         IDF_VERSAO          := ' ';
         IDF_VERSAO_DATA     := 0;
         IDF_VISIBLE         := 'N';
         IDG_ID              := 0;
         LCK                 := ' ';
         MET_COMENT          := ' ';
         MET_NOME            := pFunction;
         MET_VISIBIL         := pVisibility;
         IDF_TIPO            := pTipo;
         IDF_METTYPE         := pType;
         inclui;


         If pparm <> nil then    //inclui parámetro da função
         begin
            i := 0;
            K := pParm.count ;
            If k > 0 then  // há parámetros
            begin
              while i <= k - 1 do
               begin
                 with iPr do
                 begin
                    IDF_DEL                 := ' ';
                    IDF_SEQ                 := 0;
                    IDF_TIPO_ATIVIDADE      := 'PR';
                    PR_TIPO                 := LowerCase(pParm[i+1]);
                    PR_NOME                 := pParm[i];
                    PR_DESCRICAO            := 'Parámetro '+ lowerCase(pParm[i]);
                    IDF_METODO              := iMt.IDF_CODIGO;
                    IDF_CODIGO              := 0;
                    PRJ_ID                  := iMt.PRJ_ID;
                    CLI_ID                  := iMt.CLI_ID;
                    Inclui;
                    i := i + 2;
                 end;
               end;
            end;
        end;
       end;

 end;



 function Inclui_DeclaracaoOO (pClasseId : integer;pParm,pTabela : string; pCompleto : boolean;pooClasseFilho : string) : TstringList;   // Inclui as declarações das Funções
 var
 wList : TstringList;
 wparm : TstringList;
 wfunction,wobjetivo : string;
 begin
       wList := TstringList.Create;
       wParm := TstringList.Create;
       wFunction := 'Create()';
       wObjetivo := '{construtor}' ;
       wList.Add(wObjetivo) ;
       wParm.Clear;
       wList.add('  constructor Create ;override;');
       inclui_Metodo(pClasseId,pTabela,wFunction,wObjetivo,wparm,PCompleto,'Published','String','Constructor');


       wFunction := 'Create()';
       wObjetivo := '{destuctor}' ;
       wList.Add(wObjetivo) ;
       wParm.Clear;
       wList.add('  destructor Destroy ;override;');
       wList.Add('end;  ') ;
       inclui_Metodo(pClasseId,pTabela,wFunction,wObjetivo,wparm,PCompleto,'Published','String','destructor');
       result := wList;

       wFunction := 'Class DM()';
       wObjetivo := '{}' ;
       wList.Add(wObjetivo) ;
       wParm.Clear;
       wList.add(' T'+pTabela+'DM = class (TDad) ');
       wList.add('   public  ');
       wList.add('      procedure PopulateObject (PDObject: TOObject); override;');
       wList.add('      procedure PopulateFields (PDObject: TOObject); override; ');
       wList.add('   end; ');


end;
 // gera o código das properties
function Inclui_Property (odesign : OOdesign;pCompleto : boolean) : TStringList;
 var
 wList : TstringList;
 i : integer;
 begin
   wList :=TStringList.create;

   wList.add(' published');
   for i := 0 to length(aCpo) - 1 do
    Begin

      wList.add('   property '+formataCampo(uppercase(aCpo[i]),'B',30,'R')+
                formataCampo(adef[i],'B',10,'R') +' read F'+ aCpo[i] + ' write Set'+ aCpo[i] +';');

    end;
    
   result := wList;

 end;

 //cria variáveis das properties
function Inclui_VariaveisProp (oDesign : OOdesign;pCompleto : boolean) : TStringList;
var
 wList : TstringList;
 i : integer;
begin
  wList :=TStringList.create;
  wList.add('     private');
  for i := 0 to length(aCpo) - 1 do
     wList.add('      F'+formataCampo(uppercase(aCpo[i]),'B',50,'R')+adef[i]+';') ;
  wList.add('      o'+oDesign.Classe +'ant : o'+odesign.Classe+';') ;

  for i := 0 to length(aCpo) - 1 do
     wList.add('      procedure Set'+aCpo[i] + '(const value  '+adef[i]+');');
  result := wList;
end;

{Criação Sret Value}
function Inclui_SetValue (wNom : string;pCompleto : boolean) : TStringList;
var
t : integer;
 wList : TstringList;
 begin
 wList := TStringList.create;
 wList.add('{Set Value '+wnom+'}' );
  // cria procedures de leitura das properties
  for t := 0 to length(aCpo) - 1 do
  Begin
    wlist.Add('');
    wList.add('procedure '+wnom+'.Set'+ aCpo[t]+'(const value  '+adef[t]+');' );
    wList.Add(' begin') ;
    wList.add('  F'+aCpo[t]+' := value;');
    wList.Add(' end;')

  end;
 result := wList;
end;





{ gera a funcáo GetItem do objeto de negócio}
{function Cria_GetItem(pTabela,pClassdados,pClasse : string;pCompleto : boolean) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('function o'+pClasse+'.GetItem(pList : TListBox) : string;');
    LList.add(' begin');
    LList.add('  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; ');
     LList.add('end;');

    result := LList;
 end; }


 { gera a funcáo Posiciona do objeto de negócio}
{function Cria_Posiciona(pTabela,pClassdados,pClasse : string;pCompleto : boolean) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('function o'+pClasse+'.Posiciona(pList : TListBox;pId : integer) : integer;');
    LList.add('var');
    LList.add('i :integer; ');
    LList.add(' begin');
    LList.add('  for i := 0 to pList.Count - 1 do ');
    LList.add('   begin');
    LList.add('    If TPK(pList.Items.Objects[i] ).PK1 = pId then');
    LList.add('      begin');
    LList.add('        result := i;');
    LList.add('        break;');
    LList.add('      end;');
    LList.add('   end;');
    LList.add(' end;');
    result := LList;
 end;   }


{ gera a funcáo constructor do objeto de negócio}
function Cria_Constructor(pTabela,pClasse,pNomeLista : string) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('constructor o'+pClasse+'.create;');
    LList.add(' begin');
    LList.add('   inherited;');
    LList.add('   Chave         := '+ ''''+Get_Chave+''''+';');
    LList.add('   DMObject      := T'+pTabela+'DM.create;');
    LList.add('   AtributoLista := '+ansiquotedstr(pnomeLista,chr(39))+';');
    LList.add('   oFields := TStringList.Create; ');
    LList.add('   PK            := TPK.create;');

    LList.add('end;');

   result := LList;
 end;

{ gera a funcáo destructor do objeto de negócio}
function Cria_Destructor(pClasse : string) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('destructor o'+pClasse+'.destroy;');
    LList.add(' begin');
    LList.add('   DMObject.free;');
    LList.add('   inherited;');
    LList.add('end;');

   result := LList;
 end;

 { gera a funcáo destructor do objeto de negócio}
function Cria_PopulateObjects(odesign : OODesign) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('procedure T'+odesign.Tabel+'DM.PopulateObject (PDObject: TOObject);');
    LList.add(' begin');
    LList.add('   with o'+odesign.Classe+'(PDObject) do');
    LList.add('      begin');
    for i := 0 to length(aCpo) - 1 do
    Begin
      If In_Array(uppercase(trim(aTipo[i])),wInteiro) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := integerfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wstring) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := stringfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wReal) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := floatfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wDate) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := datetimefield['+
                   ''''+ uppercase(aCpo[i])+''''+'];') ;

      If uppercase(trim(aTipo[i]))= 'M' then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := stringfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

    end;
    LList.add('      end;');

    LList.add('     If O'+oDesign.Classe+'(PDObject).O'+oDesign.Classe+'ANT =  nil then  ');
    LList.add('        O'+oDesign.Classe+'(PDObject).O'+oDesign.Classe+'ANT := O'+oDesign.Classe+'.create; ');
    LList.add('     With O'+oDesign.Classe+'(PDObject).O'+oDesign.Classe+'ANT do  ');
    LList.add('       Begin  ');
    for i := 0 to length(aCpo) - 1 do
    Begin
      If In_Array(uppercase(trim(aTipo[i])),wInteiro) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := integerfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wstring) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := stringfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wReal) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := floatfield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');

      If In_Array(uppercase(trim(aTipo[i])),wDate) >= 0 then
         lList.add('        '+formataCampo(uppercase(aCpo[i]),'B',25,'R')+ ' := datetimefield['+
                   ''''+ uppercase(aCpo[i])+''''+'];');
    end;


    LList.add('       end;  ');

    LList.add(' end;');

   result := LList;
 end;

  { gera a funcáo destructor do objeto de negócio}
function Cria_PopulateFields(pClasse,pTab : string) : TStringList;
var
i : integer;
 LList : TstringList;
 oSql  : TstringList;
 WVAL : STRING;
 begin
    LList := TStringList.create;
    LList.add('procedure T'+pTab+'DM.PopulateFields (PDObject: TOObject);');
    LList.add('begin');
    LList.add('  with '+pClasse+'(PDObject) do');
    LList.add('    begin');
    LList.add('       If PDObject.id <> 0 then ');
           LList.add('          begin');
    for i := 0 to length(aCpo) - 1 do
    Begin
      If In_Array(uppercase(trim(aTipo[i])),wInteiro) >= 0 then
         Begin
           lList.add('             If '+pClasse+'(PDObject).'+pClasse+'ant.'+''+uppercase(aCpo[i])+''+' <> '+
                                ''+uppercase(aCpo[i])+''+ ' then ' );
           lList.add('              '+formataCampo('integerfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',40,'R')+
                   ' := '+ formataCampo(uppercase(aCpo[i]),'B',30,'R')+';');
         end;


      If In_Array(uppercase(trim(aTipo[i])),wstring) >= 0 then
          Begin
           lList.add('             If '+pClasse+'(PDObject).'+pClasse+'ant.'+''+uppercase(aCpo[i])+''+' <> '+
                                ''+uppercase(aCpo[i])+''+ ' then ' );
           lList.add('              '+formataCampo('stringfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',40,'R')+
                   ' := '+ formataCampo(uppercase(aCpo[i]),'B',30,'R')+';');
          end;


      If In_Array(uppercase(trim(aTipo[i])),wReal) >= 0 then
          Begin
           lList.add('             If '+pClasse+'(PDObject).'+pClasse+'ant.'+''+uppercase(aCpo[i])+''+' <> '+
                                    ''+uppercase(aCpo[i])+''+ ' then ' );
           lList.add('              '+formataCampo('floatfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',40,'R')+
                      ' := '+ formataCampo(uppercase(aCpo[i]),'B',30,'R')+';');
          end;


      If In_Array(uppercase(trim(aTipo[i])),wDate) >= 0 then
          Begin
           lList.add('             If '+pClasse+'(PDObject).'+pClasse+'ant.'+''+uppercase(aCpo[i])+''+' <> '+
                                ''+uppercase(aCpo[i])+''+ ' then ' );
           lList.add('              '+formataCampo('dateTimefield['+''''+uppercase(aCpo[i])+''''+']' ,'B',40,'R')+
                         ' := '+ formataCampo(uppercase(aCpo[i]),'B',30,'R')+';');
          end;

     If uppercase(trim(aTipo[i]))= 'M'then
          Begin
           lList.add('             If '+pClasse+'(PDObject).'+pClasse+'ant.'+''+uppercase(aCpo[i])+''+' <> '+
                                ''+uppercase(aCpo[i])+''+ ' then ' );
           lList.add('              '+formataCampo('stringfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',40,'R')+
                   ' := '+ formataCampo(uppercase(aCpo[i]),'B',30,'R')+';');
          end;

    end;
    LList.add('       end');
    LList.add('  else');
    LList.add('       begin');
    for i := 0 to length(aCpo) - 1 do
    Begin
      If In_Array(uppercase(trim(aTipo[i])),wInteiro) >= 0 then
         lList.add('        '+formataCampo('integerfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',35,'R')+
                   ' := '+ formataCampo(uppercase(aCpo[i]),'B',20,'R')+';');
      If In_Array(uppercase(trim(aTipo[i])),wstring) >= 0 then
         lList.add('        '+formataCampo('stringfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',35,'R')+
                   ' := '+ formataCampo(uppercase(aCpo[i]),'B',20,'R')+';');
      If In_Array(uppercase(trim(aTipo[i])),wReal) >= 0 then
         lList.add('        '+formataCampo('floatfield['+''''+uppercase(aCpo[i])+''''+']' ,'B',35,'R')+
          ' := '+ formataCampo(uppercase(aCpo[i]),'B',20,'R')+';');
      If In_Array(uppercase(trim(aTipo[i])),wDate) >= 0 then
         lList.add('        '+formataCampo('dateTimefield['+''''+uppercase(aCpo[i])+''''+']' ,'B',35,'R')+
          ' := '+ formataCampo(uppercase(aCpo[i]),'B',20,'R')+';');
    end;


    LList.add('      end;');
    LList.add('    end;');
    LList.add(' end;');
   result := LList;
 end;


 { gera objetos de negócio}
function Gera_OO (oDesign : OODesign;pSet : TDad) : Tmemo;
var
i ,k,t: integer;
wnom,wprg,wlineCode,wQry ,wCpo,wtxt: string;
oSql,wCode : TstringList;
wList : TstringList;
 wparm : TstringList;
 wfunction,wobjetivo : string;
//atençaõ : não alterar os comentários (inicio, fim...) que são usados como marcadores

 Begin
   result := oDesign.PrgUnit;
   wnom   := 'O'+oDesign.Classe;// 'O'+lowercase(pClasse);
   oSql   := TStringList.create;
   wCode  := TStringList.create;

   If lList = nil then
       lList := TstringList.create;

    {procura objeto e altera o nome da unit}
     Altera_nome_unit(wNom,oDesign.oounit,oDesign.PrgUnit);

     K := Localiza_Objeto (oDesign.PrgUnit,'{FIM CLASSES}',0) ; //posiciona na linha anterior ao fim das Classes
     //showmessage(oDesign.PrgUnit.Text);
     wLineCode := '('+wlineCode+')';
     wCode.add('');
     wCode.add(WMarc[1]+ Wnom+'}');
     wCode.add('type');
     wCode.add(' {Classe ' + WNom+'}');
     wCode.add(wnom+' = Class(TOObject)');

     wCode.add(Inclui_VariaveisProp(oDesign, false).text);
     wCode.add(Inclui_property(odesign,false).Text);
     wCode.add(Inclui_declaracaoOO(oDesign.ClasseId,wLinecode,oDesign.Tabel,false,oDesign.ClassFilho).text);
     wCode.add(WMarc[2] + WNom+'}');
     Insere_Bloco(oDesign.PrgUnit,0,k,wcode.text,false,false);

     K := Localiza_Objeto (oDesign.PrgUnit,'{FIM METODOS}',0) ; //posiciona na linha anterior ao fim das Classes
     wCode.Clear;
     wCode.add(WMarc[3]+ Wnom+'}');
     wCode.add(Cria_constructor(oDesign.Tabel,oDesign.Classe,oDesign.NomeLista).text);
     wCode.add(Cria_Destructor(oDesign.Classe).Text);
     wCode.add(Cria_PopulateObjects(oDesign).Text);
     wCode.add(Cria_PopulateFields(wNom,oDesign.Tabel).Text);
     wCode.add(WMarc[4] + WNom+'}');
     Insere_Bloco(oDesign.PrgUnit,0,k,wcode.text,false,false);

     K := Localiza_Objeto (oDesign.PrgUnit,'{FIM SET VALUES}',0) ; //posiciona na linha anterior ao fim das Classes
     wCode.Clear;
     wCode.add(WMarc[5]+ Wnom+'}');
     wCode.add(Inclui_SetValue(wNom,false).text);
     wCode.add(WMarc[6] + WNom+'}');
     Insere_Bloco(oDesign.PrgUnit,0,k,wcode.text,false,false);

     K := Localiza_Objeto (oDesign.PrgUnit,'implementation',0) ; //posiciona na linha anterior ao fim das Classes
     wCode.Clear;
     wCode.add(WMarc[7]+ Wnom+'}');
     wCode.add(Inclui_Constante(odesign).text);
     wCode.add(WMarc[8] + WNom+'}');
     Insere_Bloco(oDesign.PrgUnit,0,k,wcode.text,false,false);
end;

function Inclui_Constante (odesign : OOdesign) : TStringList;
 var
 wList : TstringList;
 wList1,wList2,wList3,TP : string;
 i : integer;
 begin

   wList :=TStringList.create;

   wList.add('const');
   wList1 := 'ao'+odesign.Classe+'cpos : array[0..'+inttostr(length(acpo)-1)+'] of string = (';
   wList2 := 'ao'+odesign.Classe+'capt :array[0..'+inttostr(length(acpo)-1)+'] of string = (';
   wList3 := 'ao'+odesign.Classe+'tipo :array[0..'+inttostr(length(acpo)-1)+'] of string = (';
    for i := 0 to length(aCpo) - 1 do
    Begin
      If In_Array(uppercase(aTipo[i]),wString) >= 0 then
         TP := 'C'
      else
      If (uppercase(aTipo[i])  = 'M') then
        TP := 'M'
      else
      If In_Array(uppercase(aTipo[i]),wInteiro) >= 0 then
        TP := 'I'
      else
      If In_Array(uppercase(aTipo[i]),wreal) >= 0 then
        TP := 'N'
      else
      If In_Array(uppercase(aTipo[i]),wDate) >= 0 then
         TP := 'D'  ;

      If i > 0 then
        Begin
          wList1 := wlist1 +','+''''+aCpo[i]+'''';
          wList2 := wList2 +','+''''+aCaption[i]+'''';
          wList3 := wList3 +','+''''+TP+'''';
         end
      else
         Begin
          wList1 := wlist1 +''''+aCpo[i]+'''';
          wList2 := wList2 +''''+aCaption[i]+'''';
           wList3 := wList3 +''''+TP+'''';
         end;


    end;
   wlist.add(wList1+');');
   wlist.add(wList2+');');
   wlist.add(wList3+');');
   result := wList;

 end;


procedure Salva_cpo (pSet : TDad);
var
m,z : integer;
 Begin
    m := 0;
    Setlength(aCpo,m);
    Setlength(aPk,m);
    Setlength(aTipo,m);
    Setlength(aDef,m);
    Setlength(aTerm,m);
    Setlength(aCaption,m);
    Setlength(aObrig,m);
    Setlength(aVisible,m);
   pSet.fclient.first;
    while not pSet.fclient.eof do
      Begin
        inc(m);
        Setlength(aCpo,m);  // nome do atributo
        Setlength(aPk,m);   // posicao primary key
        Setlength(aTipo,m);  // tipo
        Setlength(aDef,m);   // tipo extentido para definicao de funcao
        Setlength(aTerm,m);  // tipo para typecasting
        Setlength(aCaption,m);  // caption
        Setlength(aObrig,m);  // se campo obrigatório
        Setlength(aVisible,m);  // se campo visivel;
        Setlength(aDominio,m);  // Tipo Dominio (F : fechado; A : aberto)
        Setlength(aTabRef,m);  // Tabela do domíbio aberto

        aCpo[m-1]       := uppercase(pSet.fclient.FieldByName('IDF_DESIGNACAO').AsString );

        { carrega a Tabela de correspondencia entre PROVIDER_DATA e tipo padrão}
        z               := In_Array(uppercase(pSet.fclient.FieldByName('IDF_DATA_TYPE').AsString),aType);
        If z < 0 then
           Raise exception.create(mens114+pSet.fclient.FieldByName('IDF_DATA_TYPE').AsString)
        else
         If aTipos[z] = '' then
           Raise exception.create(mens114+pSet.fclient.FieldByName('IDF_DATA_TYPE').AsString);

        aTipo[m-1]      := aTipos[z] ;
        aPk[m-1]        := pSet.fclient.FieldByName('IDF_PK').AsString ;
        acaption[m-1]   := pSet.fclient.FieldByName('IDF_CAPTION').AsString ;
        aObrig[m-1]     := pSet.fclient.FieldByName('IDF_OBRIG').AsString ;
        aVisible[m-1]   := pSet.fclient.FieldByName('IDF_VISIBLE').AsString ;
        aDominio[m-1]   := pSet.fclient.FieldByName('IDF_TIPODOMINIO').AsString ;
        aTabRef [m-1]   := pSet.fclient.FieldByName('IDF_TABREF').AsString ;
        If In_Array(uppercase(aTipo[m-1]),wString) >= 0 then
         Begin
           adef[m-1] := ' : string '  ;
           aTerm[m-1] := 'asstring';
         end
        else
        If (uppercase(aTipo[m-1])  = 'M') or
           (uppercase(aTipo[m-1])  = 'LONGTEXT') then
         Begin
           adef[m-1]  := ' : string '  ;
           aTerm[m-1] := 'asstring';
         end
        else
       If In_Array(uppercase(aTipo[m-1]),wInteiro) >= 0 then
         Begin
           adef[m-1] := ' : integer ' ;
           aterm[m-1]:= 'asinteger';
         end
        else
        If In_Array(uppercase(aTipo[m-1]),wreal) >= 0 then
         Begin
            adef[m-1] :=' : real ';
            aTerm[m-1] := 'asfloat';
         end
        else
        If In_Array(uppercase(aTipo[m-1]),wDate) >= 0 then
         Begin
            adef[m-1] :=' : real ' ;
            aTerm[m-1] := 'asfloat';
         end
        else
        If uppercase(aTipo[m-1] ) = 'T' then
         Begin
           adef[m-1] := ' : string ' ;
           aterm[m-1] := 'asstring';
         end ;
       pset.fclient.Next;
     end;
 end;

  { gera a funcáo destructor do objeto de negócio}
function Desloca(pObject : TObject;pDirection,pDist : integer) : boolean;   //1 : direita;2 : esquerda; 3 : up; 4 : down
 var
 i : integer;
  Begin
    for i := 0 to pDist do
      Begin
       case pDirection of
        1 : (pObject as TWInControl).Left := (pObject as TWInControl).Left + 1;
        2 : (pObject as TWInControl).Left := (pObject as TWInControl).Left -1;
        3 : (pObject as TWInControl).top := (pObject as TWInControl).top -1;
        4 : (pObject as TWInControl).top := (pObject as TWInControl).top  +1;
        end;
      end;
  end;

end.
