unit OO_BEST;

interface
{INICIO USES}

 uses
DD_BEST,
  windows,DB, ADODB,forms,Messages,Dialogs,basetier,variants,
  stdctrls,classes,db_tier;

{FIM USES}

{INICIO CLASSES}
  
type
 {Classe Oprperty}
Oprperty=Class(TOObject)
     private
      FCLI_ID                         : integer ;
      FPRJ_ID                         : integer ;
      FIDF_CODIGO                     : integer ;
      FCLASS_ID                       : integer ;
      FIDF_SEQ                        : integer ;
      FIDF_CAT                        : string ;
      FIDF_DEL                        : string ;
      FIDF_DESIGNACAO                 : string ;
      FIDF_DIRETORIO                  : string ;
      FIDF_LISTA                      : integer ;
      FIDF_OBJETIVO                   : string ;
      FIDF_RESPONSAVEL                : string ;
      FIDF_TIPO_ATIVIDADE             : string ;
      FIDF_VERSAO                     : string ;
      FIDF_VERSAO_DATA                : real ;
      FIDF_VISIBLE                    : string ;
      FIDG_ID                         : integer ;
      FLCK                            : string ;
      FPROP_DEFAULT                   : string ;
      FPROP_DOMINIO                   : string ;
      FPROP_TIPO                      : string ;
      FPROP_VISIBIL                   : string ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
      procedure SetIDF_CODIGO(const value   : integer );
      procedure SetCLASS_ID(const value   : integer );
      procedure SetIDF_SEQ(const value   : integer );
      procedure SetIDF_CAT(const value   : string );
      procedure SetIDF_DEL(const value   : string );
      procedure SetIDF_DESIGNACAO(const value   : string );
      procedure SetIDF_DIRETORIO(const value   : string );
      procedure SetIDF_LISTA(const value   : integer );
      procedure SetIDF_OBJETIVO(const value   : string );
      procedure SetIDF_RESPONSAVEL(const value   : string );
      procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
      procedure SetIDF_VERSAO(const value   : string );
      procedure SetIDF_VERSAO_DATA(const value   : real );
      procedure SetIDF_VISIBLE(const value   : string );
      procedure SetIDG_ID(const value   : integer );
      procedure SetLCK(const value   : string );
      procedure SetPROP_DEFAULT(const value   : string );
      procedure SetPROP_DOMINIO(const value   : string );
      procedure SetPROP_TIPO(const value   : string );
      procedure SetPROP_VISIBIL(const value   : string );

  published
   property CLI_ID                        : integer            read FCLI_ID write SetCLI_ID;
   property PRJ_ID                        : integer            read FPRJ_ID write SetPRJ_ID;
   property IDF_CODIGO                    : integer            read FIDF_CODIGO write SetIDF_CODIGO;
   property CLASS_ID                      : integer            read FCLASS_ID write SetCLASS_ID;
   property IDF_SEQ                       : integer            read FIDF_SEQ write SetIDF_SEQ;
   property IDF_CAT                       : string             read FIDF_CAT write SetIDF_CAT;
   property IDF_DEL                       : string             read FIDF_DEL write SetIDF_DEL;
   property IDF_DESIGNACAO                : string             read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
   property IDF_DIRETORIO                 : string             read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   property IDF_LISTA                     : integer            read FIDF_LISTA write SetIDF_LISTA;
   property IDF_OBJETIVO                  : string             read FIDF_OBJETIVO write SetIDF_OBJETIVO;
   property IDF_RESPONSAVEL               : string             read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
   property IDF_TIPO_ATIVIDADE            : string             read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
   property IDF_VERSAO                    : string             read FIDF_VERSAO write SetIDF_VERSAO;
   property IDF_VERSAO_DATA               : real               read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
   property IDF_VISIBLE                   : string             read FIDF_VISIBLE write SetIDF_VISIBLE;
   property IDG_ID                        : integer            read FIDG_ID write SetIDG_ID;
   property LCK                           : string             read FLCK write SetLCK;
   property PROP_DEFAULT                  : string             read FPROP_DEFAULT write SetPROP_DEFAULT;
   property PROP_DOMINIO                  : string             read FPROP_DOMINIO write SetPROP_DOMINIO;
   property PROP_TIPO                     : string             read FPROP_TIPO write SetPROP_TIPO;
   property PROP_VISIBIL                  : string             read FPROP_VISIBIL write SetPROP_VISIBIL;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
  
{construtor}
  constructor Create ;
end;  


  


  
type
 {Classe Odominios}
Odominios=Class(TOObject)
     private
      FDI_TIPO                        : string ;
      FCLI_ID                         : integer ;
      FDI_DESCRICAO                   : string ;
      procedure SetDI_TIPO(const value   : string );
      procedure SetCLI_ID(const value   : integer );
      procedure SetDI_DESCRICAO(const value   : string );

  published
   property DI_TIPO                       : string             read FDI_TIPO write SetDI_TIPO;
   property CLI_ID                        : integer            read FCLI_ID write SetCLI_ID;
   property DI_DESCRICAO                  : string             read FDI_DESCRICAO write SetDI_DESCRICAO;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
  
{construtor}
  constructor Create ;
end;  


  
type
 {Classe Ometodos}
Ometodos=Class(TOObject)
     private
      FCLI_ID                         : integer ;
      FPRJ_ID                         : integer ;
      FIDF_CODIGO                     : integer ;
      FCLASS_ID                       : integer ;
      FIDF_SEQ                        : integer ;
      FIDF_CAT                        : string ;
      FIDF_DEL                        : string ;
      FIDF_DESIGNACAO                 : string ;
      FIDF_DIRETORIO                  : string ;
      FIDF_METBIND                    : string ;
      FIDF_METDIRECT                  : string ;
      FIDF_METTYPE                    : string ;
      FIDF_OBJETIVO                   : string ;
      FIDF_RESPONSAVEL                : string ;
      FIDF_TIPO                       : string ;
      FIDF_TIPO_ATIVIDADE             : string ;
      FIDF_VERSAO                     : string ;
      FIDF_VERSAO_DATA                : real ;
      FIDF_VISIBLE                    : string ;
      FIDG_ID                         : integer ;
      FLCK                            : string ;
      FMET_COMENT                     : string ;
      FMET_NOME                       : string ;
      FMET_VISIBIL                    : string ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetPRJ_ID(const value   : integer );
      procedure SetIDF_CODIGO(const value   : integer );
      procedure SetCLASS_ID(const value   : integer );
      procedure SetIDF_SEQ(const value   : integer );
      procedure SetIDF_CAT(const value   : string );
      procedure SetIDF_DEL(const value   : string );
      procedure SetIDF_DESIGNACAO(const value   : string );
      procedure SetIDF_DIRETORIO(const value   : string );
      procedure SetIDF_METBIND(const value   : string );
      procedure SetIDF_METDIRECT(const value   : string );
      procedure SetIDF_METTYPE(const value   : string );
      procedure SetIDF_OBJETIVO(const value   : string );
      procedure SetIDF_RESPONSAVEL(const value   : string );
      procedure SetIDF_TIPO(const value   : string );
      procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
      procedure SetIDF_VERSAO(const value   : string );
      procedure SetIDF_VERSAO_DATA(const value   : real );
      procedure SetIDF_VISIBLE(const value   : string );
      procedure SetIDG_ID(const value   : integer );
      procedure SetLCK(const value   : string );
      procedure SetMET_COMENT(const value   : string );
      procedure SetMET_NOME(const value   : string );
      procedure SetMET_VISIBIL(const value   : string );

  published
   property CLI_ID                        : integer            read FCLI_ID write SetCLI_ID;
   property PRJ_ID                        : integer            read FPRJ_ID write SetPRJ_ID;
   property IDF_CODIGO                    : integer            read FIDF_CODIGO write SetIDF_CODIGO;
   property CLASS_ID                      : integer            read FCLASS_ID write SetCLASS_ID;
   property IDF_SEQ                       : integer            read FIDF_SEQ write SetIDF_SEQ;
   property IDF_CAT                       : string             read FIDF_CAT write SetIDF_CAT;
   property IDF_DEL                       : string             read FIDF_DEL write SetIDF_DEL;
   property IDF_DESIGNACAO                : string             read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
   property IDF_DIRETORIO                 : string             read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   property IDF_METBIND                   : string             read FIDF_METBIND write SetIDF_METBIND;
   property IDF_METDIRECT                 : string             read FIDF_METDIRECT write SetIDF_METDIRECT;
   property IDF_METTYPE                   : string             read FIDF_METTYPE write SetIDF_METTYPE;
   property IDF_OBJETIVO                  : string             read FIDF_OBJETIVO write SetIDF_OBJETIVO;
   property IDF_RESPONSAVEL               : string             read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
   property IDF_TIPO                      : string             read FIDF_TIPO write SetIDF_TIPO;
   property IDF_TIPO_ATIVIDADE            : string             read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
   property IDF_VERSAO                    : string             read FIDF_VERSAO write SetIDF_VERSAO;
   property IDF_VERSAO_DATA               : real               read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
   property IDF_VISIBLE                   : string             read FIDF_VISIBLE write SetIDF_VISIBLE;
   property IDG_ID                        : integer            read FIDG_ID write SetIDG_ID;
   property LCK                           : string             read FLCK write SetLCK;
   property MET_COMENT                    : string             read FMET_COMENT write SetMET_COMENT;
   property MET_NOME                      : string             read FMET_NOME write SetMET_NOME;
   property MET_VISIBIL                   : string             read FMET_VISIBIL write SetMET_VISIBIL;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
  
{construtor}
  constructor Create ;
end;  


  
type
 {Classe Oaliass}
Oaliass=Class(TOObject)
     private
      FIDF_CODIGO                     : integer ;
      FIDF_ALIAS                      : string ;
      FIDF_DIRETORIO                  : string ;
      procedure SetIDF_CODIGO(const value   : integer );
      procedure SetIDF_ALIAS(const value   : string );
      procedure SetIDF_DIRETORIO(const value   : string );

  published
   property IDF_CODIGO                    : integer            read FIDF_CODIGO write SetIDF_CODIGO;
   property IDF_ALIAS                     : string             read FIDF_ALIAS write SetIDF_ALIAS;
   property IDF_DIRETORIO                 : string             read FIDF_DIRETORIO write SetIDF_DIRETORIO;

 { popula os atributos do Objeto de Negócio}
  procedure GetProperties;
  
{ popula as properties do objeto de dados}
  procedure ddMap;
  
{ retorna ítem escolhido na lista}
  function GetItem(pList : TListBox) : string;
  
{posiciona no id do Listbox informado}
 function Posiciona(pList: TListBox;pId : integer): integer;
  
{construtor}
  constructor Create ;
end;  



{FIM CLASSES}

implementation


{INICIO METODOS}

  procedure Oprperty.ddMap;
  begin
   (DMObject as TPrperty).CLI_ID            := CLI_ID;
   (DMObject as TPrperty).PRJ_ID            := PRJ_ID;
   (DMObject as TPrperty).IDF_CODIGO        := IDF_CODIGO;
   (DMObject as TPrperty).CLASS_ID          := CLASS_ID;
   (DMObject as TPrperty).IDF_SEQ           := IDF_SEQ;
   (DMObject as TPrperty).IDF_CAT           := IDF_CAT;
   (DMObject as TPrperty).IDF_DEL           := IDF_DEL;
   (DMObject as TPrperty).IDF_DESIGNACAO    := IDF_DESIGNACAO;
   (DMObject as TPrperty).IDF_DIRETORIO     := IDF_DIRETORIO;
   (DMObject as TPrperty).IDF_LISTA         := IDF_LISTA;
   (DMObject as TPrperty).IDF_OBJETIVO      := IDF_OBJETIVO;
   (DMObject as TPrperty).IDF_RESPONSAVEL   := IDF_RESPONSAVEL;
   (DMObject as TPrperty).IDF_TIPO_ATIVIDADE := IDF_TIPO_ATIVIDADE;
   (DMObject as TPrperty).IDF_VERSAO        := IDF_VERSAO;
   (DMObject as TPrperty).IDF_VERSAO_DATA   := IDF_VERSAO_DATA;
   (DMObject as TPrperty).IDF_VISIBLE       := IDF_VISIBLE;
   (DMObject as TPrperty).IDG_ID            := IDG_ID;
   (DMObject as TPrperty).LCK               := LCK;
   (DMObject as TPrperty).PROP_DEFAULT      := PROP_DEFAULT;
   (DMObject as TPrperty).PROP_DOMINIO      := PROP_DOMINIO;
   (DMObject as TPrperty).PROP_TIPO         := PROP_TIPO;
   (DMObject as TPrperty).PROP_VISIBIL      := PROP_VISIBIL;
  end;

procedure Oprperty.GetProperties;
  begin
   CLI_ID                    := (DMObject as TPrperty).CLI_ID;
   PRJ_ID                    := (DMObject as TPrperty).PRJ_ID;
   IDF_CODIGO                := (DMObject as TPrperty).IDF_CODIGO;
   CLASS_ID                  := (DMObject as TPrperty).CLASS_ID;
   IDF_SEQ                   := (DMObject as TPrperty).IDF_SEQ;
   IDF_CAT                   := (DMObject as TPrperty).IDF_CAT;
   IDF_DEL                   := (DMObject as TPrperty).IDF_DEL;
   IDF_DESIGNACAO            := (DMObject as TPrperty).IDF_DESIGNACAO;
   IDF_DIRETORIO             := (DMObject as TPrperty).IDF_DIRETORIO;
   IDF_LISTA                 := (DMObject as TPrperty).IDF_LISTA;
   IDF_OBJETIVO              := (DMObject as TPrperty).IDF_OBJETIVO;
   IDF_RESPONSAVEL           := (DMObject as TPrperty).IDF_RESPONSAVEL;
   IDF_TIPO_ATIVIDADE        := (DMObject as TPrperty).IDF_TIPO_ATIVIDADE;
   IDF_VERSAO                := (DMObject as TPrperty).IDF_VERSAO;
   IDF_VERSAO_DATA           := (DMObject as TPrperty).IDF_VERSAO_DATA;
   IDF_VISIBLE               := (DMObject as TPrperty).IDF_VISIBLE;
   IDG_ID                    := (DMObject as TPrperty).IDG_ID;
   LCK                       := (DMObject as TPrperty).LCK;
   PROP_DEFAULT              := (DMObject as TPrperty).PROP_DEFAULT;
   PROP_DOMINIO              := (DMObject as TPrperty).PROP_DOMINIO;
   PROP_TIPO                 := (DMObject as TPrperty).PROP_TIPO;
   PROP_VISIBIL              := (DMObject as TPrperty).PROP_VISIBIL;
  end;

function Oprperty.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Oprperty.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Oprperty.create;
 begin
  DMObject := TDObject(TPrperty.create(nil));
  AtributoLista := 'IDF_DESIGNACAO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;



  procedure Odominios.ddMap;
  begin
   (DMObject as TDominios).DI_TIPO          := DI_TIPO;
   (DMObject as TDominios).CLI_ID           := CLI_ID;
   (DMObject as TDominios).DI_DESCRICAO     := DI_DESCRICAO;
  end;

procedure Odominios.GetProperties;
  begin
   DI_TIPO                   := (DMObject as TDominios).DI_TIPO;
   CLI_ID                    := (DMObject as TDominios).CLI_ID;
   DI_DESCRICAO              := (DMObject as TDominios).DI_DESCRICAO;
  end;

function Odominios.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Odominios.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Odominios.create;
 begin
  DMObject := TDObject(TDominios.create(nil));
  AtributoLista := 'DI_DESCRICAO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;


  procedure Ometodos.ddMap;
  begin
   (DMObject as TMetodos).CLI_ID            := CLI_ID;
   (DMObject as TMetodos).PRJ_ID            := PRJ_ID;
   (DMObject as TMetodos).IDF_CODIGO        := IDF_CODIGO;
   (DMObject as TMetodos).CLASS_ID          := CLASS_ID;
   (DMObject as TMetodos).IDF_SEQ           := IDF_SEQ;
   (DMObject as TMetodos).IDF_CAT           := IDF_CAT;
   (DMObject as TMetodos).IDF_DEL           := IDF_DEL;
   (DMObject as TMetodos).IDF_DESIGNACAO    := IDF_DESIGNACAO;
   (DMObject as TMetodos).IDF_DIRETORIO     := IDF_DIRETORIO;
   (DMObject as TMetodos).IDF_METBIND       := IDF_METBIND;
   (DMObject as TMetodos).IDF_METDIRECT     := IDF_METDIRECT;
   (DMObject as TMetodos).IDF_METTYPE       := IDF_METTYPE;
   (DMObject as TMetodos).IDF_OBJETIVO      := IDF_OBJETIVO;
   (DMObject as TMetodos).IDF_RESPONSAVEL   := IDF_RESPONSAVEL;
   (DMObject as TMetodos).IDF_TIPO          := IDF_TIPO;
   (DMObject as TMetodos).IDF_TIPO_ATIVIDADE := IDF_TIPO_ATIVIDADE;
   (DMObject as TMetodos).IDF_VERSAO        := IDF_VERSAO;
   (DMObject as TMetodos).IDF_VERSAO_DATA   := IDF_VERSAO_DATA;
   (DMObject as TMetodos).IDF_VISIBLE       := IDF_VISIBLE;
   (DMObject as TMetodos).IDG_ID            := IDG_ID;
   (DMObject as TMetodos).LCK               := LCK;
   (DMObject as TMetodos).MET_COMENT        := MET_COMENT;
   (DMObject as TMetodos).MET_NOME          := MET_NOME;
   (DMObject as TMetodos).MET_VISIBIL       := MET_VISIBIL;
  end;

procedure Ometodos.GetProperties;
  begin
   CLI_ID                    := (DMObject as TMetodos).CLI_ID;
   PRJ_ID                    := (DMObject as TMetodos).PRJ_ID;
   IDF_CODIGO                := (DMObject as TMetodos).IDF_CODIGO;
   CLASS_ID                  := (DMObject as TMetodos).CLASS_ID;
   IDF_SEQ                   := (DMObject as TMetodos).IDF_SEQ;
   IDF_CAT                   := (DMObject as TMetodos).IDF_CAT;
   IDF_DEL                   := (DMObject as TMetodos).IDF_DEL;
   IDF_DESIGNACAO            := (DMObject as TMetodos).IDF_DESIGNACAO;
   IDF_DIRETORIO             := (DMObject as TMetodos).IDF_DIRETORIO;
   IDF_METBIND               := (DMObject as TMetodos).IDF_METBIND;
   IDF_METDIRECT             := (DMObject as TMetodos).IDF_METDIRECT;
   IDF_METTYPE               := (DMObject as TMetodos).IDF_METTYPE;
   IDF_OBJETIVO              := (DMObject as TMetodos).IDF_OBJETIVO;
   IDF_RESPONSAVEL           := (DMObject as TMetodos).IDF_RESPONSAVEL;
   IDF_TIPO                  := (DMObject as TMetodos).IDF_TIPO;
   IDF_TIPO_ATIVIDADE        := (DMObject as TMetodos).IDF_TIPO_ATIVIDADE;
   IDF_VERSAO                := (DMObject as TMetodos).IDF_VERSAO;
   IDF_VERSAO_DATA           := (DMObject as TMetodos).IDF_VERSAO_DATA;
   IDF_VISIBLE               := (DMObject as TMetodos).IDF_VISIBLE;
   IDG_ID                    := (DMObject as TMetodos).IDG_ID;
   LCK                       := (DMObject as TMetodos).LCK;
   MET_COMENT                := (DMObject as TMetodos).MET_COMENT;
   MET_NOME                  := (DMObject as TMetodos).MET_NOME;
   MET_VISIBIL               := (DMObject as TMetodos).MET_VISIBIL;
  end;

function Ometodos.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Ometodos.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Ometodos.create;
 begin
  DMObject := TDObject(TMetodos.create(nil));
  AtributoLista := 'IDF_DESIGNACAO';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;


  procedure Oaliass.ddMap;
  begin
   (DMObject as TAliass).IDF_CODIGO         := IDF_CODIGO;
   (DMObject as TAliass).IDF_ALIAS          := IDF_ALIAS;
   (DMObject as TAliass).IDF_DIRETORIO      := IDF_DIRETORIO;
  end;

procedure Oaliass.GetProperties;
  begin
   IDF_CODIGO                := (DMObject as TAliass).IDF_CODIGO;
   IDF_ALIAS                 := (DMObject as TAliass).IDF_ALIAS;
   IDF_DIRETORIO             := (DMObject as TAliass).IDF_DIRETORIO;
  end;

function Oaliass.GetItem(pList : TListBox) : string;
 begin
  result := TPK(pList.Items.Objects[pList.ItemIndex] ).PK1; 
end;

function Oaliass.Posiciona(pList : TListBox;pId : integer) : integer;
var
i :integer; 
 begin
  for i := 0 to pList.Count - 1 do 
   begin
    If TPK(pList.Items.Objects[i] ).PK1 = pId then
      begin
        result := i;
        break;
      end;
   end;
 end;

constructor Oaliass.create;
 begin
  DMObject := TDObject(TAliass.create(nil));
  AtributoLista := 'IDF_ALIAS';
  PK := TPK.create;
  Pk.pk1    := null;
  Pk.pk2    := null;
  Pk.pk3    := null;
  Pk.pk1ant := null;
  Pk.pk2ant := null;
  Pk.pk3ant := null;
end;



{FIM METODOS}




{INICIO SET VALUES}
  {Set Value Oprperty}

procedure Oprperty.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Oprperty.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Oprperty.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Oprperty.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure Oprperty.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Oprperty.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure Oprperty.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Oprperty.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Oprperty.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Oprperty.SetIDF_LISTA(const value   : integer );
 begin
  FIDF_LISTA := value;
 end;

procedure Oprperty.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Oprperty.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Oprperty.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Oprperty.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Oprperty.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Oprperty.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Oprperty.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Oprperty.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Oprperty.SetPROP_DEFAULT(const value   : string );
 begin
  FPROP_DEFAULT := value;
 end;

procedure Oprperty.SetPROP_DOMINIO(const value   : string );
 begin
  FPROP_DOMINIO := value;
 end;

procedure Oprperty.SetPROP_TIPO(const value   : string );
 begin
  FPROP_TIPO := value;
 end;

procedure Oprperty.SetPROP_VISIBIL(const value   : string );
 begin
  FPROP_VISIBIL := value;
 end;





  {Set Value Odominios}

procedure Odominios.SetDI_TIPO(const value   : string );
 begin
  FDI_TIPO := value;
 end;

procedure Odominios.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Odominios.SetDI_DESCRICAO(const value   : string );
 begin
  FDI_DESCRICAO := value;
 end;


  {Set Value Ometodos}

procedure Ometodos.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Ometodos.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Ometodos.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Ometodos.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure Ometodos.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Ometodos.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure Ometodos.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Ometodos.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Ometodos.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Ometodos.SetIDF_METBIND(const value   : string );
 begin
  FIDF_METBIND := value;
 end;

procedure Ometodos.SetIDF_METDIRECT(const value   : string );
 begin
  FIDF_METDIRECT := value;
 end;

procedure Ometodos.SetIDF_METTYPE(const value   : string );
 begin
  FIDF_METTYPE := value;
 end;

procedure Ometodos.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Ometodos.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Ometodos.SetIDF_TIPO(const value   : string );
 begin
  FIDF_TIPO := value;
 end;

procedure Ometodos.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Ometodos.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Ometodos.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Ometodos.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Ometodos.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Ometodos.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Ometodos.SetMET_COMENT(const value   : string );
 begin
  FMET_COMENT := value;
 end;

procedure Ometodos.SetMET_NOME(const value   : string );
 begin
  FMET_NOME := value;
 end;

procedure Ometodos.SetMET_VISIBIL(const value   : string );
 begin
  FMET_VISIBIL := value;
 end;


  {Set Value Oaliass}

procedure Oaliass.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Oaliass.SetIDF_ALIAS(const value   : string );
 begin
  FIDF_ALIAS := value;
 end;

procedure Oaliass.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;



{FIM SET VALUES}

end.
