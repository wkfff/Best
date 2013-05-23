unit fonctions;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbgrids, pList_std, strUtils, shellApi, QRCtrls, QuickRpt, ComCtrls,
  stdCtrls, math, Registry, FILECTRL, aligrid;

 type

    TGridy = class(TStringAlignGrid)

    private

    published

  end;
// Efetua a contagem de Licença Flutuante - Entrada do Sistema
    function IncluiLicenca(Atual: Integer): Extended;
//Retira a Licença Flutuante - Saida do Sistema
    function RetiraLicenca(Atual: Integer): Extended;


   { substitui um string por uma série de caracteres iguais}
  function RepStr(pStr: string; pIgual : string) : string;
  //procura um substrin pValue no texto pText iniciando na posiça~pStart
  function place(pStart : integer;pValue,pText : string): integer;
  { compoe nome + sobrenome}
  function nom(pNOme,pSobrenome,pseparador: string) : string;
   {converte de yy/mm/dd -> dd/mm/yy  (DATA)}
  function Dataddmmyy(pdata : string) : real;
   {converte de dd/mm/yyyy -> dd/mm/yy  (DATA)}
  function Dataddmmyyyy(pdata : string) : real;//converte de dd/mm/yyyy -> dd/mm/yy
  //converte de AAAAMMDDHHMMSS-> AAAA/MM/DD HH:MM:SS
  function aaaammdd(pdata : string) : STRING;

  //converte de AAAAMMDDHHMMSS-> DD/MM/AAAA HH:MM:SS
  function DDMMAAAA(pdata : string) : STRING;

  function Invertedata1(pdata : string) : string;

  { decrement ou incrementa um mes no formato AA/MM}
  function Incmes(pmes: string; pinc : integer) : string;

  function ListPrt(pDbgrid : TDbGRid;pCab,pFoot : string) : boolean;

// function ListPrt(pDbgrid : TDbGRid;pCab,pFoot,pPortrait : string) : boolean;overload;
  //converte de yyyy/mm/dd -> dd/mm/yyyy
  function Invertedata(pdata : string) : string;//converte de ýyyy/mm/dd -> dd/mm/yyyy
  { pesquisa um valor numa lista e retorna true se achou; a lista pode ser TstringList,TListBox}
  function InList (pValor : string;pList : Tobject) : boolean;

  function InLista (pValor : string;pList : Tobject) : integer;

  { pesquisa um valor dalinha plini ate a linha plinFim ,num texto e retorna true se achou; a lista pode ser TstringList,TMemo}
  function InMemo (pValor : string;pList : Tobject;plinini,plinfim : integer) : boolean;

  { pesquisa um valor dalinha plini ate a linha plinFim ,num texto e retorna true se achou; a lista pode ser TstringList,TMemo}
  function InText (pValor : string;pList : Tobject;plinini,plinfim : integer) : integer;

   { verifcia se pvaloe esta na tabela pArray}
  function InArray (pValor : string;pArray : array of string) : boolean;

   { verifcia se pvaloe esta na tabela pArray e retorna a posição}
  function InArrays (pValor : string;pArray : array of string) :integer;

   { verifcia se pvaloe esta na tabela pArray e retorna a posiçào na tabela}
  function In_Array (pValor : string;pArray : array of string) : integer;
     { verifcia se pvaloe esta na tabela pArray e retorna a posiçào na tabela (array numérico)}
  function In_Arrayn (pValor : integer ;pArray : array of integer) : integer;

  { retorna string contido em pLInha a esquerda de pChar}
  function Parse_Left (pLinha,pChar : string) : string;
  { retorna string contido em pLInha a direita de pChar}
  function Parse_Right (pLinha,pChar : string) : string;
  { retorna string contido em pLInha entree pChar1 e pChar2}
  function Parse_Mid (pLinha,pChar1,pChar2 : string) : string;
   { de um text retorna os campos separados por separador}
  function Parse_linha(pLinha,pseparador : string) : TstringList;overload;
  function Parse_linha(pLinha : string; const playout : array of string) : TstringList;overload;
  
  function FormataCampo(pCpo :string ;pTipo : string;
                pTamanho : integer;pPos :string) : string;
                { pCpo = campo a formatar
                  pTipo ; Z : COMPLEETAR COM ZEROS
                          B : Completar com brancos.
                  pTamanho : tamanho final do campo
                  pPos     : L : preenchimento a esquerd
                             R : preenchimento a direita}

    {executa um programa windows }
   procedure ExecProg (Nome,param : string);
   { classifica os elementos numéricos contido na tabela aListGer;}
   procedure aSort;
   { classifica os elementos numéricos contido nano treeview;}
      { retorna número por extenso}
   function extenso (valor: real): string;

   function extens(pValor : real) : string;
   function Get_unidades (wval : string) : string ;
   function Get_dezenas (wval : string) : string ;
   function Get_centenas (wval : string) : string ;
   function Get_milhares (wval : string) : string ;
   function Get_dezmilhares (wval : string) : string ;
   function Get_CemMilhares (wval : string) : string ;
   function Get_Milhoes (wval : string) : string ;
    { retorna lista para query a ser usado com in : ex ('a','b','c')}
    { pList contém os argumentos}
   function qry_list (pList : TListBox): string;
   { cálculo dc módulo 10 ITAU}
   function DC_10(pNum : string) : integer;
    { tira todos os caracteres nào numérico}
   function Tira_Naonumerico(pCpo : string) : string;

     { verifica se pCpo é numérico}
   function IsNumeric (pCpo : string) : boolean;
      { verifica se pCpo é especial}    // entre 0 e 31
   function IsSpecial (pCpo : string) : boolean;


   function IsDate(pdata : string) : string ; //Verifica se data correta e
                                               // retorna data formato yyyy/mm/dd

   function Check_cgc(num: string): boolean; // calcula digito verificor de cgc

   function Check_cpf(num: string): boolean; // calcula digito verificador de cpf

      { substitui um string por outro}
   function ReplaceStr (Text,oldstring,newstring:string):string;

       { retorna integer = sequencia das pos. alfabéticas de cada letra : ex : AC --> 13}
   function codif (palfa : string): integer;

   function Cria_LinhaSqlupd(pCpo,pValor,pTipo,pPk: Tstrings) : TstringList;

              { gERAR LINHA SQL PARA UPDATE
                pCpo : nome do atributo
                pvalor : Valor do Atributo
                pTipo : Tipo do Atributo : C : ENTRE ASPAS ; N : SEM ASPAS  }
    { retorna o diretório acima}
   function Get_DirPai(pdir : string) : string;
         { retorna no. do drive}
    Function SerialNum(FDrive:String) :String;
     { copy un arquivo paara outro arquivo}
   function Copia_arquivo(pOld,pNew : string) : boolean;
      { Retorna uam palavra em minúscula e com a primeira letra Maiuscual)}
   function FirstUpper(pWord : string) : string;
    { retorna o usuário logado}
   function LoggedUser : String;
  { copia um arquivo de um diretóro para outro}
   function xCopyFile(pDirFrom,pDirTo,pOldname,pNewName : string) : boolean;
    { copia um diretório para outro}
   function CopiarDiretorio(Ordir,DestDir : string ) : boolean;

   function GetRTF(RE: TRichedit): string;
   {retorna rich text}
   CONST
   vintena : array[1..19] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove','Dez','Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
Milhares: array[1..9] of string = ('Mil', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
alpha : array[0..25] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
maxInt ='2147483647';
implementation

//procura um substrin pValue no texto pText iniciando na posiça~pStart
function place(pStart : integer;pValue,pText : string): integer;
var
i ,l,lText : integer;
wvalue : string;
  Begin
     result := 0;
     l := length(pValue);
     lText := length(pText);
     for i := pStart to lText  do
       Begin
        wValue := copy(pText,i,l);
        If uppercase(pValue) = uppercase(Wvalue) then
           Begin
             result := i;
             break;
           end;
       end;
  end; 


 { copia um arquivo de um diretóro para outro}
function xCopyFile(pDirFrom,pDirTo,pOldname,pNewName : string) : boolean;
var
NewDir : array [0..1024] of char;
OldDir :  array [0..1024] of char;
begin
 result := true;

 If not Fileexists(pDirFrom+'\'+pOldname) then
    result := false;

 strPcopy(NewDir,pDirTo+'\'+pNewname);
 strPcopy(OldDir,pDirFrom+'\'+pOldname);
 If not copyfile(OldDir,Newdir,true) then
  result := false;
end;

      { retorna no. do drive}
Function SerialNum(FDrive:String) :String;
Var
Serial:DWord;
DirLen,Flags: DWord;
DLabel : Array[0..11] of Char;
begin
Try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
Result := IntToHex(Serial,8);
Except Result :='';
end;
end;


function nom(pNOme,pSobrenome,pseparador: string) : string;
 begin
  result := trim(pNome)+pSeparador+trim(pSobrenome);

 end;

function InList (pValor : string;pList : Tobject) : boolean;
var
 i ,wcount: integer;
 begin
  result := false;
  If pList is TStrings then
   begin
    wCount :=  (pList as Tstrings).Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as Tstrings)[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end
  else
  If pList is TStringList then
   begin
    wCount :=  (pList as TstringList).Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TstringList)[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end
  else
  If pList is TListBox then
   begin
    wCount :=  (pList as TListBox).Items.Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TListBox).Items[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end
   else
  If pList is TTreeView then
   begin
    wCount :=  (pList as TTreeview).Items.Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TTreeview).Items[i].Text then
         begin
           result := true  ;
           break;
         end;

      end;
   end
  else
 If (pList is TcustomMemo) then
   begin
    wCount :=  (pList as TcustomMemo).Lines.Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TcustomMemo).Lines[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end
 else
 If (pList is TQrmemo) then
   begin
    wCount :=  (pList as TQrmemo).Lines.Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TQrmemo).Lines[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end
 end;

 { retorna o diretório acima}
function Get_DirPai(pdir : string) : string;
var
 i : integer;
 wdir : string;
 begin
   result := '';
   wdir := trim(pDir);
   If (rightstr(wdir,1) = '\') or (rightstr(wdir,1) = '/') then
    wdir := leftstr(wdir,length(wdir) -1) ;
   for i := length(wdir) downto 1 do
    begin
     If (wdir[i] = '/') or (wdir[i] = '\' ) then
       begin
        result :=leftstr(wdir, i-1);
        exit;
       end;
    end;
 end;


function InMemo (pValor : string;pList : Tobject;plinini,plinfim : integer) : boolean;
var
 i ,wcount, wini,wfim : integer;
 begin
  wini := pLinIni;
  wfim := pLinFim;

  If (pLinIni = 0) and (plinFim = 0) then
   Begin
    wini := 0;
    If pList is TStringList then
     wfim := (pList as TstringList).Count -1
    else
     wfim :=  (pList as TMemo).Lines.Count-1;
   end;
  result := false;
  If pList is TStringList then
   begin

     for i := wini to wfim do
      begin
        If pos(pValor,(pList as TStringList)[i]) > 0 then
         begin
           result := true  ;
           break;
         end;

      end;
   end
  else
  If pList is TMemo then
   begin

     for i := wini to wfim do
      begin
        If pos(pValor,(pList as TMemo).lines[i]) > 0 then
         begin
           result := true  ;
           break;
         end;

      end;
   end
   else
   If pList is TRichEdit then
   begin
     for i := wini to wfim do
      begin
        If pos(pValor,(pList as TRichEdit).lines[i]) > 0 then
         begin
           result := true  ;
           break;
         end;

      end;
   end;
 end;

function InText (pValor : string;pList : Tobject;plinini,plinfim : integer) : integer;
var
 i ,wcount, wini,wfim ,j : integer;      //return lie #
 begin
  wini := pLinIni;
  wfim := pLinFim;
  result := -1;
  If (pLinIni = 0) or (plinFim = 0) then
   result := -1
  else
  If pList is TRichEdit then
   begin
     for i := wini to wfim do
      begin
        J := place(1,uppercase(pValor),uppercase((pList as TRichEdit).lines[i])) ;
        If j >0 then
         begin
           result := i  ;
            WITH (pList as TRichEdit) do
             Begin
               SelStart := Perform(EM_LINEINDEX, i, 0) +j-1 ;
               SelLength := length(pValor);
               Perform(EM_SCROLLCARET, 0, 0);
               SETFOCUS;
             end;
           break;
         end;
      end;
   end;
 end;



 function InLista (pValor : string;pList : Tobject) : integer;
var
 i ,wcount: integer;
 begin
  result := -1;
  If pList is TStringList then
   begin
    wCount :=  (pList as TstringList).Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TstringList)[i] then
         begin
           result := i  ;
           break;
         end;

      end;
   end
  else
  If pList is TListBox then
   begin
    wCount :=  (pList as TListBox).Items.Count;
     for i := 0 to wCount - 1 do
      begin
        If pValor = (pList as TListBox).Items[i] then
         begin
           result := i  ;
           break;
         end;

      end;
   end
 end;




function InArray (pValor : string;pArray : array of string) : boolean;
var
 i : integer;
 begin
  result := false;

   begin
     for i := 0 to length(pArray) - 1 do
      begin
        If pValor = pArray[i] then
         begin
           result := true  ;
           break;
         end;

      end;
   end;
 end;

function InArrays (pValor : string;pArray : array of string) : integer;
var
 i : integer;
 begin
  result := -1;

   begin
     for i := 0 to length(pArray) - 1 do
      begin
        If pValor = pArray[i] then
         begin
           result := i  ;
           break;
         end;

      end;
   end;
 end;

function LoggedUser : String;
{Requer a unit Registry declarada na clausula Uses da Unit}
var
Registro:TRegistry;
begin
Registro := TRegistry.Create;
Registro.RootKey := HKEY_LOCAL_MACHINE;
if Registro.OpenKey('Network\Logon', false) then
begin
result := Registro.ReadString('username');
end;
Registro.Free;
end;

function In_Array (pValor : string;pArray : array of string) : integer;
var
 i : integer;
 begin
  result := -1;

   begin
     for i := 0 to length(pArray) - 1 do
      begin
        If pValor = pArray[i] then
         begin
           result := i  ;
           break;
         end;

      end;
   end;
 end;

function In_Arrayn (pValor : integer ;pArray : array of integer) : integer;
var
 i : integer;
 begin
  result := -1;

   begin
     for i := 0 to length(pArray) -1  do
      begin
        If pValor = pArray[i] then
         begin
           result := i  ;
           break;
         end;

      end;
   end;
 end;




function FormataCampo(pCpo :string ;pTipo : string;
                pTamanho : integer;pPos :string) : string;
                { pCpo = campo a formatar
                  pTipo ; Z : COMPLEETAR COM ZEROS
                          B : Completar com brancos.
                  pTamanho : tamanho final do campo
                  pPos     : L : preenchimento a esquerd
                             R : preenchimento a direita}
var

tam,dif : integer;
Wcpo ,wcp1,bl,zr : string;
begin
 bl := '                                                                     ';
 bl := bl+bl+bl+bl+bl+bl+bl+bl+bl+bl+bl+bl+bl;
 zr := '000000000000000000000000000000000000000000000000000000000000000000000000000000000';
 wcpo := trim(pCpo);
 tam := length(Wcpo);
// Wcpo := copy(Wcpo,1,Tam);
If tam = ptamanho then
   begin
    result := Wcpo;
    exit;
   end;
 If tam < pTamanho then
    Dif := pTamanho - tam
 else
    begin
      result :=  copy(Wcpo,1,pTamanho);
      exit;

    end;
    
 If uppercase(ptipo) = 'Z' then
    begin
      If uppercase(pPOs) = 'L' then
         result := copy(zr,1,dif ) + Wcpo
      else
         result := Wcpo + copy(zr,1,dif );
    end
 else
    begin
      If uppercase(pPOs) = 'L' then
         Begin
          result := copy(bl,1,dif ) + Wcpo  ;

         end

      else
        Begin
          result := Wcpo + copy(bl,1,dif );
         
        end;
         
    end ;
  wcp1 := result;
end;

function JultoNormal(pJul : real) : string;//converte Juliano p/ AAAAMM
var
Wano,wmes : string;
Wyear,wresto : real;
WrYear : real;
Begin
  wmes := '';
  Wano := '';
  Wyear := (23760 + pJul) / 12 ;
  WRyear := trunc(Wyear)  ;
  If wyear = Wryear then
     Begin
        Wano := floattostr(Wyear-1);
        Wmes := '12';
     end
  else
     Begin
       Wano := floattostr(WRyear);

       wRESTO := (23760 + pJul)  - (Wryear * 12) ;
       Wmes := floattostr(Wresto);
       If length(Trim(wmes)) = 1 then
          wmes := '0'+wmes;
     end;
  result := Wano+'/'+wmes;
end;

function NormaltoJul(pNormal : string) : string;//converte Juliano p/ AAAAMM
var
Wano,wmes : string;
Wyear,wresto : real;
WrYear : real;
Begin
  wmes := copy(pNormal,5,2);
  Wano := copy(pNormal,1,4);
  Wyear := ((strtofloat(Wano) *12) + strtofloat(Wmes)) - 23760;
  result :=floattostr(Wyear);
end;

function Dataddmmyy(pdata : string) : real;//converte de yyyy/mm/dd -> dd/mm/yy
Begin
  result := strtodate(copy(pdata,9,2)+'/'+copy(pdata,6,2)+'/'+copy(pData,3,2));
end;

function Dataddmmyyyy(pdata : string) : real;//converte de dd/mm/yyyy(d/mm/yyyy,dd/m/yy,etc.. -> dd/mm/yy
var
iPos,i : integer;
dd,mm,yy,resto : string;
Begin
  iPos := pos('/',pData) ;
  If iPos = 3 then
   dd := copy(pdata,1,2)
  else
   dd := FormataCampo(copy(pdata,1,1),'Z',2,'L');
  resto := COPY(pdata,iPos+1,length(pData)-ipos) ;
  iPos := pos('/',Resto) ;
  If iPos = 3 then
   mm := copy(Resto,1,2)
  else
   mm    := FormataCampo(copy(Resto,1,1),'Z',2,'L');
  yy    := rightstr(resto,2) ;
  result := strtodate(dd+'/'+mm+'/'+yy);
end;


function AAAAMMDD(pdata : string) : STRING;//converte de AAAAMMDDHHMMSS-> AAAA/MM/DD HH:MM:SS
var
iPos,i : integer;
dd,mm,yy,hh,mn,ss : string;
Begin
  yy := COPY(pdata,1,4)+'/';
  mm := copy(Pdata,5,2)+'/';
  dd := copy(pdata,7,2)+' ';
  hh := copy(pdata,9,2)+':';
  mn := copy(pdata,11,2)+':';
  ss := copy(pdata,13,2);
  result := yy+mm+dd+hh+mn+ss;

end;

function DDMMAAAA(pdata : string) : STRING;//converte de AAAAMMDDHHMMSS-> DD/MM/AAAA HH:MM:SS
var
iPos,i : integer;
dd,mm,yy,hh,mn,ss : string;
Begin
  yy := COPY(pdata,1,4)+' ';
  mm := copy(Pdata,5,2)+'/';
  dd := copy(pdata,7,2)+'/';
  hh := copy(pdata,9,2)+':';
  mn := copy(pdata,11,2)+':';
  ss := copy(pdata,13,2);
  result := DD+mm+YY+hh+mn+ss;

end;

function Invertedata(pdata : string) : string;//converte de yyyy/mm/dd -> dd/mm/yyyy

Begin
  If pos('/',pdata)  = 3 then
    result := copy(pdata,7,2)+'/'+copy(pdata,4,2)+'/'+copy(pData,1,2)
  else
    result := copy(pdata,9,2)+'/'+copy(pdata,6,2)+'/'+copy(pData,1,4);

end;

function Invertedata1(pdata : string) : string;//converte de dd/mm/yy -> yyyy/mm/dd
Begin
   result := formatdatetime('yyyy/mm/dd',strtodate(pData));

end;


function ListPrt(pDbgrid : TDbGRid;pCab,pFoot : string) : boolean;
var
wForm : Tfrm_pList;
i,wleft : integer;
begin
  wForm := Tfrm_pList.create(application);
  Wleft := 0;
  with wForm do
   begin
     wform.pTot.caption := pFoot;
   If pcab = '' then
    Begin
      If pDbgrid.Parent is Tform  then
        WForm.pTit1.Caption := (pDbgrid.Parent as Tform).caption;
    end
   else
     wform.pTit.caption := pCab;

     with pDbGrid do
      begin

       qrp.DataSet := pDbgrid.DataSource.DataSet;
       with wform do
        begin
          for i := 0 to pdbgrid.Columns.Count - 1 do
          begin
             If not pdbgrid.Columns[i].Visible then
              continue;
              with TQRLabel.create(wForm) do
                 Begin
                   If i > 0 then
                      begin
                        Wleft := Wleft +pdbgrid.Columns[i-1].width + 15  ;
                        left := WLeft;
                      end
                   else
                   left := 1;
                   width := pdbgrid.Columns[i].Width ;
                   top    := 0;
                   WordWrap := true;
                   //parent := ch;
                   font.style := [fsBold];
                   caption := pdbgrid.Columns[i].Title.Caption;
                  end;
              with TQRDBText.create(wForm) do
                 Begin
                   Autosize  := false;
                   left      := Wleft ;
                   WordWrap  := true;
                   height    := 16;
                   width     := pdbgrid.Columns[i].width + 15;
                   top       := 0;
                   //parent    := db;
                   dataset   := pDbgrid.datasource.dataset;
                   datafield := pDbgrid.Columns[i].FieldName;
                  end;
          end;

        end;
      end;
   qrp.Preview;
   close;
   end;

end;



function Parse_Left (pLinha,pChar : string) : string;
VAR
wpos : integer;
 begin
  wpos := pos(pchar,pLinha) ;
  If wpos = 0 then
   result := plinha
  else
  result := LeftStr(pLinha,wpos-1);

 end;

function Parse_Right (pLinha,pChar : string) : string;
VAR
wpos : integer;
var
l : integer;
 begin
  wpos := pos(pchar,pLinha) ;
  If wpos = 0 then
   result := plinha
  else
   Begin
     l := length(trim(pLinha));
     result := RightStr(pLinha,l -wpos-1);
   end;



 end;

function Parse_Mid (pLinha,pChar1,pChar2 : string) : string;
var
 p1,p2,l : integer;
 begin
   p1 := pos(pchar1,pLinha);
   p2 := pos(pchar2,pLinha);
   L := abs((p2-p1)-1);

   result :=  copy(pLinha,p1+1,l);
 end;

function Parse_linha(pLinha,pseparador : string) : TstringList;
var
 i : integer;
 cpo : string   ;
 ret : TstringList;
 begin
   ret := TStringList.Create;
   for i := 1 to length(pLinha)  do
    Begin
       If pLinha[i] = pSeparador then
         Begin
           ret.Add(cpo);
           cpo := '';
         end
       else
        Begin
         cpo := cpo + pLinha[i];
        end;

    end;
   ret.Add(cpo);
   result := ret;
 end;

 function Parse_linha(pLinha : string;const playout : array of string) : TstringList;
var
 i : integer;
 cpo : string   ;
 ret,desloc : TstringList;
 begin
   ret := TStringList.Create;
   desloc := TStringList.Create;
   for i := 0 to length(playout) - 1  do
    Begin
       desloc := Parse_linha(playout[i],',');
       ret.Add(copy(pLinha,strtoint(desloc.strings[0]),strtoint(desloc.strings[1]) - strtoint(desloc.strings[0]) +1) );
       desloc.Clear;


    end;
   result := ret;
 end;


procedure ExecProg (Nome,param : string);
var
comm : array [0..1024] of char;
parm:  array [0..1024] of char;
  begin
    strPcopy(Comm,nome);
    strPcopy(parm,param);
    shellExecute(0,nil,Comm,parm,nil,SW_SHOWMINIMIZED);
  end;


procedure aSort;
{ classifica os elementos numéricos contido na tabela aListGer;}
vAR
aListger,aList1,aList2 : tStringList ;
ilg,il1,il2,i: integer;
cont : boolean;
begin
  aListGer := TstringList.create;
  aList1   := TstringList.create;
  aList2   := TstringList.create;
  cont := true;

 If aListGer.count = 0 then
  exit;
  while  Cont do
  begin
    for i := 0 to  aListGer.Count -2 do   // le até o penúltimo...
     Begin
      If strtoint(aListGer[i]) >=  strtoint(aListGer[i+1]) then  // se maior , guarda na lista 1
       Begin
         aList1.add( aListGer[i]) ;
         If i = aListGer.Count -2 then  // se penúltimo , guarda último na lista 2
            aList2.add( aListGer[i+1]) ;
       end

      else
       Begin
        aList2.add(aListGer[i]);        //se menor , guarda na lista 2
        If i =  aListGer.Count -2 then  // se penúltimo , guarda último na lista 1
            aList1.add( aListGer[i+1]) ;
       end;
     end;

     If aList2.count = 1 then   // se tiver um único elemento na lista 2 = fim
      Begin
         aList1.add(alist2[0]);
        // lb1.Items := aList1;
         cont := false;
      end;
     aListger.clear;
     
      { junta a  lista 1 e 2 na lsita geral}
     for i := 0 to aList1.count - 1 do
        aListGer.add(aList1[i]);
     for i := 0 to aList2.count - 1 do
        aListGer.add(aList2[i]);

      aList1.clear;
      aList2.clear;
   end;
end;




function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;

function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);

  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo.'
 else
  Result:=Result+' Centavos.';
end;
end;

 { retorna lista para query a ser usado com in : ex ('a','b','c')}
    { pList contém os argumentos}
function qry_list (pList : TListBox): string;
var
i : integer;
wseq : string;
 Begin
   wseq := '(';
   for i := 0 to pList.items.count -1 do
    Begin
       If i < pList.items.count-1 then
         wseq := wseq + #39+pList.items[i] +#39+','
       else
         wseq := wseq + #39+pList.items[i] +#39+')' ;
    end;
    result := wseq;
 end;

function extens (pvalor : real) : string;
var
centavos ,principal : string;
wPrinc : integer;
wfrac  : integer;
wf : real;
Begin
  pValor    := roundTo(pValor,-2);
  wprinc    := trunc(int(pvalor)) ;
  principal := floattostr(wprinc);   //valor inteiro
  If pvalor <> wprinc then
    Begin
       centavos  := rightstr(floattostrf(pvalor,ffnumber,12,2),2)  ;
       if length(centavos) < 2 then
        centavos := centavos + '0';
    end

  else
     centavos := '00';
  wfrac     := strtoint(centavos) ;
  Centavos  := inttostr(wfrac);
  case length(principal) of
    1 : result := get_unidades(principal);  //unidades[strtoint(principal)];
    2 : result := get_dezenas(principal);
    3 : result := get_centenas(principal);
    4 : result := get_milhares(principal);
    5 : result := get_Dezmilhares(principal);
    6 : result := get_Cemmilhares(principal);
    7 : result := get_milhoes(principal);
 end;
 result := result + ' Reais ';
 If wfrac > 0 then
    result := result + ' e '+ get_dezenas(centavos) + ' Centavos';
 result := '(' + result +')';   
end;

  function Get_unidades (wval : string) : string ;
  Begin
     If wval <> '0' then
       result := unidades[strtoint(wval[length(wval)] )];
  end;

  function Get_dezenas (wval : string) : string ;
  Begin
         If length(wval) = 1 then
          result := get_Unidades(wval[1])
         else

         If wval[length(wval)-1] = '0' then
          result := get_Unidades(wval[length(wval)])
         else
         If strtoint(rightstr(wval,2)) < 20 then
          result := vintena [strtoint(rightstr(wval,2))]
         else
          Begin
           result := dezenas[strtoint(wval[length(wval)-1])] ;
           If wval[length(wval)] <> '0' then
             result := result + ' e '+get_Unidades(wval[length(wval)]) ;


          end;
  end;

  function Get_centenas (wval : string) : string ;
  Begin

      If strtoint(rightstr(wval,3)) = 100 then
       result := 'Cem'
      else
       Begin
          If  wval[length(wval)-2] = '0' then   //centenas = 0
            result :=  Get_dezenas(wval)
          else
          If rightstr(wval,2) <> '00' then
            result := Centenas[strtoint(wval[length(wval)-2])]  + ' e '+ Get_dezenas(wval)
          else
            result := Centenas[strtoint(wval[length(wval)-2])]  ;
       end;

  end;

  function Get_milhares (wval : string) : string ;
  Begin

      If strtoint(rightstr(wval,4)) = 1000 then
       result := 'Mil '
      else
       Begin
          If  wval[length(wval)-3] = '0' then   //milhares = 0
           result :=  Get_Centenas(wval)
         else
         If strtoint(wval[length(wval)-3]) = 1 then
           result := 'Hum Mil e '+ Get_Centenas(wval)
         else

          If rightstr(wval,3) <> '000' then
            result := Unidades[strtoint(wval[length(wval)-3])]+ ' Mil e '+ Get_Centenas(wval)
          else
            result := Unidades[strtoint(wval[length(wval)-3])]+ ' Mil';
       end;

  end;

  function Get_dezmilhares (wval : string) : string ;
  Begin
       Begin
          If  wval[length(wval)-4] = '0' then   //Dez milhares = 0
           result :=  Get_Milhares(wval)
         else
          If rightstr(wval,3) <> '000' then
            result := Get_dezenas(leftstr(wval,2))+ ' Mil e '+ Get_Centenas(wval)
          else
            result := Get_dezenas(leftstr(wval,2)) + ' Mil';
       end;

  end;

  function Get_CemMilhares (wval : string) : string ;
  Begin
       Begin
          If  wval[length(wval)-5] = '0' then   //cem milhares = 0
           result :=  Get_DezMilhares(wval)
         else
          If rightstr(wval,4) <> '0000' then
            result := Get_centenas(leftstr(wval,3))+ ' Mil e '+ Get_Centenas(wval)
          else
            result := Get_centenas(leftstr(wval,3)) + ' Mil';
       end;

  end;

  function Get_Milhoes (wval : string) : string ;
  Begin
       Begin
          If  wval[length(wval)-6] = '0' then   //milhoes= 0
           result :=  Get_CemMilhares(wval)
         else
          If rightstr(wval,5) <> '00000' then
            Begin
               If  strtoint(leftstr(wval,1)) = 1 then
                   result := {unidades[strtoint(leftstr(wval,1))]+} 'Hum Milhão e '+ Get_CemMilhares(wval)
               else
                 result := unidades[strtoint(leftstr(wval,1))]+ ' Milhões e '+ Get_CemMilhares(wval)
            end

          else
            Begin
              If  strtoint(leftstr(wval,1)) = 1 then
                result := {unidades[strtoint(leftstr(wval,1))] +} 'Hum Milhão'
              else
                result := unidades[strtoint(leftstr(wval,1))] + ' Milhões';
            end;

       end;

  end;

 function DC_10(pNum : string) : integer;    // calcula dígito verifcar módulo 10, com
 var                                         // peso 1 e 2 alternado comecando pela esquerda
 i ,wdc: integer;                            // ex : 1 2 3 4 5 6
 mult : integer;                             //      1 2 1 2 1 2
 wtot : integer;                             //      1 4 3 8 5 12
 war : array of integer;                      // tot := 1+ 4+3+8+6+ (1+2) =  24
 wpar : string;                             //
  Begin                                     //       DC := 24/10  = 2 RESTO : 4
     pNum := trim(pNum);                    //        DC = 10 - 4 (SE RESTO 10, DC = 0)
     mult := 1 ;
     setlength(war,length(pNum));
     for i := 1 to length(pNum)do
       Begin
         war[i-1] := strtoint(pNum[i])*mult;
         If mult = 1 then
          mult := 2
         else
          mult := 1;
      end;
    { soma parcias}
    for i := 0 to length(war)-1  do
     Begin
      If war[i] >= 10 then
       Begin
        wpar:= inttostr(war[i]) ;

        wtot := wtot + strtoint(wpar[1])+ strtoint(wpar[2]);
       end
      else
       wtot := wtot + war[i];
     end;

     { calcual DC}
     wdc := wtot - ((wtot div 10) *  10);
     wdc := 10 - wdc;
     If wdc = 10 then
      wdc := 0;
     result := wdc;

  end;

function IsNumeric (pCpo : string) : boolean;
var
i : integer;
 Begin
    If pCpo = '' then
     begin
      result := false;
      exit;

     end;
    result := true;
    for i := 1  to length(pCpo) do
     Begin
      If (ord(pCpo[i]) < 48) or (ord(pCpo[i]) > 57) then
       Begin
         result := false;
         break;
       end;
     end;
 end;

function IsSpecial (pCpo : string) : boolean;
var
i : integer;
 Begin
    result := false;
    
    for i := 1  to length(pCpo) do
     Begin
      If (ord(pCpo[i]) >=0) and (ord(pCpo[i]) <= 31) then
       Begin
         result := true;
         break;
       end;
     end;
 end;


function Tira_Naonumerico(pCpo : string) : string;
var
i : integer;
wcpo : string;
 Begin
  result := '';
  wcpo := '';
  for i := 1 to length(pcpo) do
   Begin
    If Isnumeric(pcpo[i]) then
     wcpo := wcpo + pcpo[i];
   end;
   result := wcpo;
 end;


function IsDate(pdata : string) : string ; //Verifica se data correta e
                                               // retorna data formato yyyy/mm/dd
var
wano,wmes,wdia,wdat,dat_atu : string;
wdaTA :real;
Wpos : integer;
Begin
  try
   begin
     result := '';
     dat_atu := trim(pdata);
     If length(dat_atu) = 8 then     //formato dd/mm/yy
       Begin
         wano := copy(pdata,7,2);
         Wmes := copy(pdata,4,2);
         Wdia := copy(pData,1,2);
         Wdat := wdia+'/'+wmes+'/'+wano;
       end
     else
     If length(dat_atu) = 10 then
       Begin
         If pos('/',dat_atu) = 5 then    //formato ýyyy/mm/dd
           Begin
             wano := copy(pdata,3,2);
             Wmes := copy(pdata,6,2);
             Wdia := copy(pData,9,2);
             Wdat := wdia+'/'+wmes+'/'+wano;
           end
         else
           Begin
             wano := copy(pdata,9,2);   //formato dd/mm/yyyy
             Wmes := copy(pdata,4,2);
             Wdia := copy(pData,1,2);
             Wdat := wdia+'/'+wmes+'/'+wano;
           end
       end;
       result := '20'+wano+'/'+wmes+'/'+wdia;
       Wdata := strtodate(Wdat);

   end;
  except
   begin
      result := '';
   end;
  end;

end;

function Check_cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2,l: integer;
digitado, calculado: string;
begin
l := length(num) ;
If l > 14 then
  num := copy(num,2,14)
else
If l < 14 then
  result := false
else
begin
  n1:=StrToInt(num[1]);
  n2:=StrToInt(num[2]);
  n3:=StrToInt(num[3]);
  n4:=StrToInt(num[4]);
  n5:=StrToInt(num[5]);
  n6:=StrToInt(num[6]);
  n7:=StrToInt(num[7]);
  n8:=StrToInt(num[8]);
  n9:=StrToInt(num[9]);
  n10:=StrToInt(num[10]);
  n11:=StrToInt(num[11]);
  n12:=StrToInt(num[12]);
  d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=num[13]+num[14];
  if calculado=digitado then
    result:=true
    else
    result:=false;
  end;
end;

function Check_cpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  result:=true
  else
  result:=false;
end;

function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

function Cria_LinhaSqlupd(pCpo,pValor,pTipo,pPk: Tstrings) : TstringList;

              { gERAR LINHA SQL PARA UPDATE
                pCpo : nome do atributo
                pvalor : Valor do Atributo
                pTipo : Tipo do Atributo : C : ENTRE ASPAS ; N : SEM ASPAS
                pPk : tabela de PK }


 var

 i : integer;
 wl : string;
 wLin : TstringList;
begin
 wlin := TstringList.Create;
 for i := 0 to pCpo.Count - 1 do
  Begin
    If (pPk[i] = '') or (pPk[i] = '0') then
    Begin
        If (uppercase(pTipo[i]) = 'C') or (uppercase(pTipo[i]) = 'M') THEN
          wl := ansiquotedstr(pCpo[i] +' = ',#39)+ '+'+'#39'+'+'+pvalor[i]+'+'+'#39'
        else
        If uppercase(pTipo[i]) = 'D' THEN
           wl := ansiquotedstr(pCpo[i] +' = ',#39)+ '+'+'#39'+'+'+ 'formatdatetime('+ansiquotedstr('yyyy/mm/dd',#39)+','+ pvalor[i]+')'+'+'+'#39'
        else
        If uppercase(pTipo[i]) = 'N' THEN
           wl := ansiquotedstr(pCpo[i] +' = ',#39)+ '+'+'FloatToStr('+ pvalor[i]+')'
        else
        If uppercase(pTipo[i]) = 'I' THEN
           wl := ansiquotedstr(pCpo[i] +' = ',#39) +'+'+'IntToStr('+ pvalor[i]+')';

        wl := wl +'+'+''''+','+'''';

        wlin.Add(wl);
    end;
  

  end;
    wl := Leftstr(wlin[0],length(wlin[0])-4) ;
    wlin[0] := wl;
  result := wlin;
end;

 { copy un arquivo para outro arquivo}
function Copia_arquivo(pOld,pNew : string) : boolean;
var
s,nome,wOldDir,wNewDir : string;
NewDir : array [0..1024] of char;
OldDir :  array [0..1024] of char;
i : integer;
 begin
    wOldDir := ExtractFileDir(pOld);
    wNewDir := ExtractFileDir(pNew);
    // cria dirétório novo , quando não existe
   if not DirectoryExists(wNewDir) then
    begin
      If not CreateDir(wNewDir) then
       raise Exception.Create('Impossível Criar Diretório ' +wNewDir);
    end;

    // verifica se diretorio origem existe
   if not DirectoryExists(wOldDir) then
    begin
      If not CreateDir(wOldDir) then
       raise Exception.Create('Diretório inexistente ' +wOldDir);
    end;

    strPcopy(NewDir,pNew);
    strPcopy(OldDir,pOld);
    If not copyfile(OldDir,Newdir,FALSE) then
       raise Exception.Create('Impossível copiar ' +OldDir+ ' para '+NewDir);

 end;


      { retorna integer = sequencia das pos. alfabéticas de cada letra : ex : AC --> 13}
function codif (palfa : string): integer;
var
i : integer;
wcp,wpar,wpart: string;
  Begin
    result := 0;
    wcp := '';
    pAlfa := leftstr(UPPERCASE(pAlfa),5)  ;
    If pAlfa = '' then
     exit;
    for i := 1 to length(pAlfa) do
     Begin
        wpar := inttostr(in_Array(pAlfa[i],Alpha)+1)  ;
       // wpart := FormataCampo(wcp+wPar,'Z',10,'R') ;
       If (length(wcp) = 8) and (wcp + wPar > MaxInt) then
          break
       else
         wcp := wcp + inttostr(in_Array(pAlfa[i],Alpha)+1);
     end;

     result := strtoint(wcp);
   end;

{ decrement ou incrementa um mes no formato AA/MM}
function Incmes(pmes: string; pinc : integer) : string;
var
pdat : real;
 Begin
  result := '01/' + copy(pmes,4,2)+'/'+copy(pMes,1,2);
 // result := pmes+'/01';
  pDat := strtodate(result);
  pdat := IncMonth(pdat,pInc);
  result := formatdatetime('YY/MM',PDAT) ;
 end;

 { substitui um string por uma série de caracteres iguais}
function RepStr(pStr: string; pIgual : string) : string;
var
i : integer;
 Begin
  result := '';
  for i := 0 to length(pStr) -1 do
    Begin
     result := result + pIgual;
    end;

 end;


    { Retorna uam palavra em minúscula e com a primeira letra Maiuscual)}
function FirstUpper(pWord : string) : string;
var
s1,s2 : string;
 begin
  s1 := pword[1];
  s2 := rightstr(pword,length(pWord)-1);
  result := Uppercase(s1)+lowercase(s2);

 end;

function GetRTF(RE: TRichedit): string;
var
   strStream: TStringStream;
   siz : integer;
begin
   strStream := TStringStream.Create('') ;
   try
     RE.PlainText := False;
     RE.Lines.SaveToStream(strStream) ;
    // siz := strstream.Size;
     Result := strStream.DataString;
    // result := ansiQuotedStr(strStream.DataString,chr(39)) ;
   finally
     strStream.Free
   end;
end;



function CopiarDiretorio(Ordir,DestDir : string ) : boolean;
var
i : integer;
s,nome,dirnome,panterior,wmens : string;
NewDir : array [0..1024] of char;
OldDir :  array [0..1024] of char;
cFile : TfileListbox;

 begin
{ try
   result := true;
   pAnterior := Ordir;
  // nome := ExtractFileName(pBdImport.Dirbanco);
   cFile := TFileListBox.create(screen.ActiveForm);
   cfile.Visible := false ;
   screen.ActiveForm.InsertControl(cFile);
   DirNome := DestDir;

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

    wMens := AnsireplaceStr(Mens133,'&',Dirnome);
    //wMens := AnsireplaceStr(wmens,'@',DirNome);
    cFile.Directory := Dirnome;//pBdImport.DirFluxo;

    //copia digarmas para o temporário

    for i := 0 to cFile.Count - 1 do
     begin
        s:= cFile.Items[i];
        strPcopy(NewDir,DirNome+'\'+s);
        strPcopy(OldDir,DestDir +'\'+s);
        If not copyfile(OldDir,Newdir,true) then
           RESULT := FALSE;
     end;


    // pBDImport.DirFluxo := DirNome +'\';
    // pBDImport.Dirbanco := pBDImport.DirFluxo+nome;
    // pbdImport.Connected := false;
     //pBdImport.ConnectionString := AnsireplaceStr(pBdImport.ConnectionString,pAnterior, pBdImport.Dirbanco);
 finally
   freeandnil(cFIle);
 end; }
 end;

  function IncluiLicenca(Atual: Integer): Extended;
  var
    Licenca : Extended;
  begin
    Licenca := Atual * 3 + 54;
    Result := Licenca;
  end;

  function RetiraLicenca(Atual: Integer): Extended;
  var
    Licenca : Extended;
  begin
    Licenca := (Atual - 54) / 3;
    Result := Licenca;
  end;



end.
  { pCpo = campo a formatar
                  pTipo ; Z : COMPLEETAR COM ZEROS
                          B : Completar com brancos.
                  pTamanho : tamanho final do campo
                  pPos     : L : preenchimento a esquerd
                             R : preenchimento a direita}
