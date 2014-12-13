unit DD_BEST;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,Provider,DBClient,
  ADODb, dbTables, math, strUtils, DB, db_tier, basetier, fonctions;

type
  uLst = ^TLst;
  TLst = record
    eObj     : string;
end;

type

TQuerAdo = class(TAdoQuery)
  private
    FDS: TDataSource;
    procedure SetDS(const Value: TDataSource);     // query ADO


  published
    property DS : TDataSource  read FDS write SetDS;

  public
   constructor create(pds : TdataSource);overload;

end;

TQuer = class(TQuery)
  private
    FDS: TDataSource;
    procedure SetDS(const Value: TDataSource);



  published
    property DS : TDataSource   read FDS write SetDS;

  public
   constructor create(pds : TdataSource);overload;

end;


TDad = class(TDOBject)
  private
    FdDS: TDataSource;
    procedure SetdDS(const Value: TDataSource);


 protected
   DBD          : TDB;
   TipoQuery    : TClass;
   dSql         : string;
   dTabela      : string;
   DBdad        : TClass;


 published
  property dDS : TDataSource read FdDS write SetdDS;

 public
   constructor create(sender : Tclass);

end;

{INICIO CLASSES}

  
{Classe Tprperty}
Tprperty=Class(Tdad)
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
    function Get_MaxSeq(pCLI_ID, pPRJ_ID, pIDF_CODIGO,
      pCLASS_ID: integer): integer;

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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
end;  


  


  
{Classe Tdominios}
Tdominios=Class(Tdad)
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


  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  

  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
end;  


  
{Classe Tmetodos}
Tmetodos=Class(Tdad)
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
    function Get_MaxSeq(pCLI_ID, pPRJ_ID, pIDF_CODIGO,
      pCLASS_ID: integer): integer;

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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;

    { Deleta da Classe}
  function DeleteDClasse() : boolean;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
end;  


  
{Classe Taliass}
Taliass=Class(Tdad)
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

{ salva  1 registro}
  function SaveObject(PDObject: TOObject): TObjectID ;override;
  
    { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;
  
{ retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;
  
 { popula as properties do objeto de dados}
  procedure ddMap(DataSet : Tdataset);
 { construtor}

constructor Create (sender : TClass);
end;  



{FIM CLASSES}


implementation


{INICIO METODOS}


Constructor Tdad.create(sender : TClass);
   begin
      Dbd := Tdb.create(sender)
   end;

Constructor TQuerAdo.create(pds : TdataSource);   //ado query
   begin
    inherited create(application);

   end;

Constructor TQuer.create(pds : TdataSource);   //query   normal
   begin
    inherited create(application);

   end;




  procedure Tprperty.ddMap(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      CLASS_ID                  := DataSet.fieldbyname('CLASS_ID').asinteger;
      IDF_SEQ                   := DataSet.fieldbyname('IDF_SEQ').asinteger;
      IDF_CAT                   := DataSet.fieldbyname('IDF_CAT').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      IDF_LISTA                 := DataSet.fieldbyname('IDF_LISTA').asinteger;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      LCK                       := DataSet.fieldbyname('LCK').asstring;
      PROP_DEFAULT              := DataSet.fieldbyname('PROP_DEFAULT').asstring;
      PROP_DOMINIO              := DataSet.fieldbyname('PROP_DOMINIO').asstring;
      PROP_TIPO                 := DataSet.fieldbyname('PROP_TIPO').asstring;
      PROP_VISIBIL              := DataSet.fieldbyname('PROP_VISIBIL').asstring;
  end;


{Tprperty Métodos}

constructor Tprperty.Create ; 
  begin
   DBD := DBATU;
  end;


function Tprperty.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tprperty;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do
  begin
    Connection  := (dbd.DbTipo as TAdoConnection);
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_PY'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


    open;
    If eof then
     begin
      begin
         oObj := Tprperty.create(nil);
         oObj.CLI_ID:= CLI_ID;
         oObj.PRJ_ID:= PRJ_ID;
         oObj.IDF_CODIGO:= IDF_CODIGO;
         oObj.CLASS_ID:= CLASS_ID;
         oObj.IDF_SEQ:= IDF_SEQ;
         wkey := oObj.get_maxkey(CLI_ID,PRJ_ID,0,CLASS_ID) + 1;
         IDF_CODIGO := WKEY;

         wkey := oObj.get_maxSeq(CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID) + 10;
         IDF_SEQ := WKEY;
         Freeandnil(oObj);
      end;
       sql.text := 'INSERT INTO IDF_PY('+
       'CLI_ID,'+
       'PRJ_ID,'+
       'IDF_CODIGO,'+
       'CLASS_ID,'+
       'IDF_SEQ,'+
       'IDF_CAT,'+
       'IDF_DEL,'+
       'IDF_DESIGNACAO,'+
       'IDF_DIRETORIO,'+
       'IDF_LISTA,'+
       'IDF_OBJETIVO,'+
       'IDF_RESPONSAVEL,'+
       'IDF_TIPO_ATIVIDADE,'+
       'IDF_VERSAO,'+
       'IDF_VERSAO_DATA,'+
       'IDF_VISIBLE,'+
       'IDG_ID,'+
       'LCK,'+
       'PROP_DEFAULT,'+
       'PROP_DOMINIO,'+
       'PROP_TIPO,'+
        'PROP_VISIBIL)'+
       'VALUES ('+

       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+','+
       InttoStr(IDF_CODIGO)+','+
       InttoStr(CLASS_ID)+','+
       InttoStr(IDF_SEQ)+','+
       AnsiQuotedStr(IDF_CAT,chr(39))+','+
       AnsiQuotedStr(IDF_DEL,chr(39))+','+
       AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
       AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
       InttoStr(IDF_LISTA)+','+
       AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
       AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
       AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
       AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
       AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
       InttoStr(IDG_ID)+','+
       AnsiQuotedStr(LCK,chr(39))+','+
       AnsiQuotedStr(PROP_DEFAULT,chr(39))+','+
       AnsiQuotedStr(PROP_DOMINIO,chr(39))+','+
       AnsiQuotedStr(PROP_TIPO,chr(39))+','+
       AnsiQuotedStr(PROP_VISIBIL,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := IDF_CODIGO;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_PY'+
   ' SET '+
   'IDF_CAT = '+AnsiQuotedStr(IDF_CAT,chr(39))+','+
   'IDF_DEL = '+AnsiQuotedStr(IDF_DEL,chr(39))+','+
   'IDF_DESIGNACAO = '+AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
   'IDF_DIRETORIO = '+AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
   'IDF_LISTA = '+InttoStr(IDF_LISTA)+','+
   'IDF_OBJETIVO = '+AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
   'IDF_RESPONSAVEL = '+AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
   'IDF_TIPO_ATIVIDADE = '+AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
   'IDF_VERSAO = '+AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
   'IDF_VERSAO_DATA = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
   'IDF_VISIBLE = '+AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
   'IDG_ID = '+InttoStr(IDG_ID)+','+
   'LCK = '+AnsiQuotedStr(LCK,chr(39))+','+
   'PROP_DEFAULT = '+AnsiQuotedStr(PROP_DEFAULT,chr(39))+','+
   'PROP_DOMINIO = '+AnsiQuotedStr(PROP_DOMINIO,chr(39))+','+
   'PROP_TIPO = '+AnsiQuotedStr(PROP_TIPO,chr(39))+','+
   'PROP_VISIBIL = '+AnsiQuotedStr(PROP_VISIBIL,chr(39))+
    ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


   execsql;
   If rowsaffected > 0 then
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tprperty.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_PY'+
     ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


      execsql;
      If rowsaffected > 0 then
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Tprperty.LoadObject (PDObject: TOObject);
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_PY'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(pdobject.ID)
+' AND CLASS_ID = '+InttoStr(CLASS_ID);



       open;
       If not Eof then 
         begin
           ddmap(iEmp);
         end; 
     end;
end;


function Tprperty.Get_MaxKey (pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do
  begin
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_CODIGO AS MAXK FROM IDF_PY'+
' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_PY'
+' WHERE CLI_ID = '+InttoStr(PCLI_ID)
+' AND PRJ_ID = '+InttoStr(PPRJ_ID)
+' AND CLASS_ID = '+InttoStr(PCLASS_ID)+')';

   open;
   If not eof  then
    Result := fieldbyName('MAXK').asinteger;
  end;
end;

function Tprperty.Get_MaxSeq (pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do
  begin
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_SEQ AS MAXK FROM IDF_PY'+
' WHERE  IDF_SEQ = (SELECT MAX(IDF_SEQ) FROM IDF_PY'
+' WHERE CLI_ID = '+InttoStr(PCLI_ID)
+' AND PRJ_ID = '+InttoStr(PPRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(pIDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(PCLASS_ID)+')';

   open;
   If not eof  then
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tprperty.GetAllObjects(PDObject: TOObject) :TStringList;
var
 pList : TStringList;
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_PY'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND CLASS_ID = '+InttoStr(CLASS_ID);


    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('IDF_CODIGO').Value;
         pList.AddObject(fieldbyname('IDF_DESIGNACAO').Value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;






  procedure Tdominios.ddMap(DataSet: TDataSet);
  begin
      DI_TIPO                   := DataSet.fieldbyname('DI_TIPO').asstring;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      DI_DESCRICAO              := DataSet.fieldbyname('DI_DESCRICAO').asstring;
  end;


{Tdominios Métodos}

constructor Tdominios.Create ; 
  begin
   DBD := DBATU;
  end;






procedure Tdominios.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM CMB_DIVERSOS'+
' WHERE DI_TIPO = '+ PDObject.Id ;


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;




function Tdominios.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM CMB_DIVERSOS'
    +' WHERE DI_TIPO = '+''''+DI_TIPO+'''';

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('DI_TIPO').Value; 
         pList.AddObject(uppercase(fieldbyname(PDObject.AtributoLista).value),NewOObject);
        next;
      end;
      result := pList;
 end;
end;


  procedure Tmetodos.ddMap(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      CLASS_ID                  := DataSet.fieldbyname('CLASS_ID').asinteger;
      IDF_SEQ                   := DataSet.fieldbyname('IDF_SEQ').asinteger;
      IDF_CAT                   := DataSet.fieldbyname('IDF_CAT').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
      IDF_METBIND               := DataSet.fieldbyname('IDF_METBIND').asstring;
      IDF_METDIRECT             := DataSet.fieldbyname('IDF_METDIRECT').asstring;
      IDF_METTYPE               := DataSet.fieldbyname('IDF_METTYPE').asstring;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_TIPO                  := DataSet.fieldbyname('IDF_TIPO').asstring;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      LCK                       := DataSet.fieldbyname('LCK').asstring;
      MET_COMENT                := DataSet.fieldbyname('MET_COMENT').asstring;
      MET_NOME                  := DataSet.fieldbyname('MET_NOME').asstring;
      MET_VISIBIL               := DataSet.fieldbyname('MET_VISIBIL').asstring;
  end;


{Tmetodos Métodos}

constructor Tmetodos.Create ; 
  begin
   DBD := DBATU;
  end; 


function Tmetodos.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Tmetodos;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_MT'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


    open;
    If eof then 
     begin
      begin
         oObj := Tmetodos.create(nil);
         oObj.CLI_ID:= CLI_ID;
         oObj.PRJ_ID:= PRJ_ID;
         oObj.IDF_CODIGO:= IDF_CODIGO;
         oObj.CLASS_ID:= CLASS_ID;
         oObj.IDF_SEQ:= IDF_SEQ;
         wkey := oObj.get_maxkey(CLI_ID,PRJ_ID,0,CLASS_ID) + 1;
         IDF_CODIGO := WKEY;

         wkey := oObj.get_maxSeq(CLI_ID,PRJ_ID,IDF_CODIGO,CLASS_ID) + 10;
         IDF_SEQ := WKEY;


         Freeandnil(oObj);
      end;
       sql.text := 'INSERT INTO IDF_MT('+
       'CLI_ID,'+
       'PRJ_ID,'+
       'IDF_CODIGO,'+
       'CLASS_ID,'+
       'IDF_SEQ,'+
       'IDF_CAT,'+
       'IDF_DEL,'+
       'IDF_DESIGNACAO,'+
       'IDF_DIRETORIO,'+
       'IDF_METBIND,'+
       'IDF_METDIRECT,'+
       'IDF_METTYPE,'+
       'IDF_OBJETIVO,'+
       'IDF_RESPONSAVEL,'+
       'IDF_TIPO,'+
       'IDF_TIPO_ATIVIDADE,'+
       'IDF_VERSAO,'+
       'IDF_VERSAO_DATA,'+
       'IDF_VISIBLE,'+
       'IDG_ID,'+
       'LCK,'+
       'MET_COMENT,'+
       'MET_NOME,'+
        'MET_VISIBIL)'+
       'VALUES ('+

       InttoStr(CLI_ID)+','+
       InttoStr(PRJ_ID)+','+
       InttoStr(IDF_CODIGO)+','+
       InttoStr(CLASS_ID)+','+
       InttoStr(IDF_SEQ)+','+
       AnsiQuotedStr(IDF_CAT,chr(39))+','+
       AnsiQuotedStr(IDF_DEL,chr(39))+','+
       AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
       AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
       AnsiQuotedStr(IDF_METBIND,chr(39))+','+
       AnsiQuotedStr(IDF_METDIRECT,chr(39))+','+
       AnsiQuotedStr(IDF_METTYPE,chr(39))+','+
       AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
       AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
       AnsiQuotedStr(IDF_TIPO,chr(39))+','+
       AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
       AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
       AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
       AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
       InttoStr(IDG_ID)+','+
       AnsiQuotedStr(LCK,chr(39))+','+
       AnsiQuotedStr(MET_COMENT,chr(39))+','+
       AnsiQuotedStr(MET_NOME,chr(39))+','+
       AnsiQuotedStr(MET_VISIBIL,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := IDF_CODIGO;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_MT'+
   ' SET '+
   'IDF_CAT = '+AnsiQuotedStr(IDF_CAT,chr(39))+','+
   'IDF_DEL = '+AnsiQuotedStr(IDF_DEL,chr(39))+','+
   'IDF_DESIGNACAO = '+AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
   'IDF_DIRETORIO = '+AnsiQuotedStr(IDF_DIRETORIO,chr(39))+','+
   'IDF_METBIND = '+AnsiQuotedStr(IDF_METBIND,chr(39))+','+
   'IDF_METDIRECT = '+AnsiQuotedStr(IDF_METDIRECT,chr(39))+','+
   'IDF_METTYPE = '+AnsiQuotedStr(IDF_METTYPE,chr(39))+','+
   'IDF_OBJETIVO = '+AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
   'IDF_RESPONSAVEL = '+AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
   'IDF_TIPO = '+AnsiQuotedStr(IDF_TIPO,chr(39))+','+
   'IDF_TIPO_ATIVIDADE = '+AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
   'IDF_VERSAO = '+AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
   'IDF_VERSAO_DATA = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
   'IDF_VISIBLE = '+AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
   'IDG_ID = '+InttoStr(IDG_ID)+','+
   'LCK = '+AnsiQuotedStr(LCK,chr(39))+','+
   'MET_COMENT = '+AnsiQuotedStr(MET_COMENT,chr(39))+','+
   'MET_NOME = '+AnsiQuotedStr(MET_NOME,chr(39))+','+
   'MET_VISIBIL = '+AnsiQuotedStr(MET_VISIBIL,chr(39))+
    ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


   execsql;
   If rowsaffected > 0 then
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Tmetodos.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do
    begin
      Connection  := (dbd.DbTipo as TAdoConnection);
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_MT'+
     ' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(IDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+' AND IDF_SEQ = '+InttoStr(IDF_SEQ);


      execsql;
      If rowsaffected > 0 then
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;

function Tmetodos.DeleteDClasse() : boolean;
   begin
   result := false;
    with TQuerAdo.create(nil) do
      begin
        Connection  := (dbd.DbTipo as TAdoConnection);
        DecimalSeparator := '.';
        close;
        sql.clear;
        sql.text := 'DELETE FROM IDF_MT'+
        ' WHERE CLI_ID = '+InttoStr(CLI_ID)
        +' AND PRJ_ID = '+InttoStr(PRJ_ID)
        +' AND CLASS_ID = '+InttoStr(CLASS_ID) ;
        execsql;
        If rowsaffected > 0 then
          result := true;
      end;
      DecimalSeparator := ',';
   end;

procedure Tmetodos.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_MT'+
' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(pdobject.ID)
+' AND CLASS_ID = '+InttoStr(CLASS_ID);


       open;
       If not Eof then
         begin
           ddmap(iEmp);
         end;
     end;
end;


function Tmetodos.Get_MaxKey (pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_CODIGO AS MAXK FROM IDF_MT'+
' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_MT'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND CLASS_ID = '+InttoStr(CLASS_ID)
+')'
;

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;

function TMetodos.Get_MaxSeq (pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pCLASS_ID : integer ) : integer;
 begin
  with TQuerAdo.create(nil) do
  begin
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_SEQ AS MAXK FROM IDF_PY'+
' WHERE  IDF_SEQ = (SELECT MAX(IDF_SEQ) FROM IDF_PY'
+' WHERE CLI_ID = '+InttoStr(PCLI_ID)
+' AND PRJ_ID = '+InttoStr(PPRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(pIDF_CODIGO)
+' AND CLASS_ID = '+InttoStr(PCLASS_ID)+')';

   open;
   If not eof  then
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Tmetodos.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_MT'
+' WHERE CLI_ID = '+InttoStr(CLI_ID)
+' AND PRJ_ID = '+InttoStr(PRJ_ID)
+' AND CLASS_ID = '+InttoStr(CLASS_ID);


    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('IDF_CODIGO').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;


  procedure Taliass.ddMap(DataSet: TDataSet);
  begin
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      IDF_ALIAS                 := DataSet.fieldbyname('IDF_ALIAS').asstring;
      IDF_DIRETORIO             := DataSet.fieldbyname('IDF_DIRETORIO').asstring;
  end;


{Taliass Métodos}

constructor Taliass.Create ; 
  begin
   DBD := DBATU;
  end; 


function Taliass.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Taliass;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
 result := 0;
 With TQuerAdo.create(nil) do  
  begin 
    Connection  := (dbd.DbTipo as TAdoConnection); 
    DecimalSeparator := '.';
    close;
    sql.clear;
    sql.text :=     'SELECT * FROM IDF_ALIAS'+
' WHERE IDF_CODIGO = '+InttoStr(IDF_CODIGO);


    open;
    If eof then 
     begin
      begin
         oObj := Taliass.create(nil);
         oObj.IDF_CODIGO:= IDF_CODIGO;
         wkey := oObj.get_maxkey() + 1;
         Freeandnil(oObj);
         IDF_CODIGO := WKEY;
      end;
       sql.text := 'INSERT INTO IDF_ALIAS('+
       'IDF_CODIGO,'+
       'IDF_ALIAS,'+
        'IDF_DIRETORIO)'+
       'VALUES ('+

       InttoStr(IDF_CODIGO)+','+
       AnsiQuotedStr(IDF_ALIAS,chr(39))+','+
       AnsiQuotedStr(IDF_DIRETORIO,chr(39))+
      ')';
      execsql;
      If rowsaffected > 0 then 
        begin
          PDObject.resulta := 'Incluido!';
         result := wkey;
        end;
 end
 else 
  begin 
   close;
   sql.clear;
   sql.text := 'UPDATE IDF_ALIAS'+
   ' SET '+
   'IDF_ALIAS = '+AnsiQuotedStr(IDF_ALIAS,chr(39))+','+
   'IDF_DIRETORIO = '+AnsiQuotedStr(IDF_DIRETORIO,chr(39))+
    ' WHERE IDF_CODIGO = '+InttoStr(IDF_CODIGO);


   execsql;
   If rowsaffected > 0 then 
     PDObject.resulta := 'Atualizado!';
   end; 
  end; 
 DecimalSeparator := ',';
end;


procedure Taliass.DeleteObject (PDObject: TOObject);
 begin
  with TQuerAdo.create(nil) do 
    begin   
      Connection  := (dbd.DbTipo as TAdoConnection); 
      DecimalSeparator := '.';
      close;
      sql.clear;
      sql.text := 'DELETE FROM IDF_ALIAS'+
     ' WHERE IDF_CODIGO = '+InttoStr(IDF_CODIGO);


      execsql;
      If rowsaffected > 0 then 
        PDObject.resulta := 'Excluido!';
    end;
  DecimalSeparator := ',';
end;


procedure Taliass.LoadObject (PDObject: TOObject);
var 
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil); 
   with iEmp do  
    begin
       iEmp.Connection  := (dbd.DbTipo as TAdoConnection);
       close;
       sql.clear;
       sql.text := 'SELECT * FROM IDF_ALIAS'+
' WHERE IDF_CODIGO = '+ PDObject.Id ;


       open;
       If not Eof then 
         begin 
           ddmap(iEmp);
         end; 
     end;
end;


function Taliass.Get_MaxKey () : integer;
 begin
  with TQuerAdo.create(nil) do 
  begin  
   Connection  := (dbd.DbTipo as TAdoConnection);
   result := 0;
   close;
   sql.clear;
   sql.text := 'SELECT IDF_CODIGO AS MAXK FROM IDF_ALIAS'+
' WHERE IDF_CODIGO = (SELECT MAX(IDF_CODIGO) FROM IDF_ALIAS'
+')'
;

   open;
   If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
  end;
end;


function Taliass.GetAllObjects(PDObject: TOObject) :TStringList;
var  
 pList : TStringList; 
 NewOObject : TPK;
 begin
  pList := TStringList.create;
  with TQuerAdo.create(nil) do 
   begin;
    Connection  := (dbd.DbTipo as TAdoConnection);
    close;
    sql.clear;
    sql.text := 'SELECT * FROM IDF_ALIAS'
;

    open;
    While not Eof do 
      begin;
         NewOObject     := TPK.Create;
         NewOObject.PK1 := fieldbyname('IDF_CODIGO').Value; 
         pList.AddObject(fieldbyname(PDObject.AtributoLista).value,NewOObject);
        next;
      end;
      result := pList;
 end;
end;



{FIM METODOS}

{INICIO SET VALUES}


procedure TQuerAdo.SetDS(const Value: TDataSource);
begin
  FDS := Value;
end;

procedure TQuer.SetDS(const Value: TDataSource);
begin
  FDS := Value;
end;

procedure TDad.SetdDS(const Value: TDataSource);
begin
  FdDS := Value;
end;
  {Set Value Tprperty}

procedure Tprperty.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tprperty.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tprperty.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tprperty.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure Tprperty.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Tprperty.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure Tprperty.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tprperty.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tprperty.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tprperty.SetIDF_LISTA(const value   : integer );
 begin
  FIDF_LISTA := value;
 end;

procedure Tprperty.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tprperty.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tprperty.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tprperty.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tprperty.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tprperty.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tprperty.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tprperty.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Tprperty.SetPROP_DEFAULT(const value   : string );
 begin
  FPROP_DEFAULT := value;
 end;

procedure Tprperty.SetPROP_DOMINIO(const value   : string );
 begin
  FPROP_DOMINIO := value;
 end;

procedure Tprperty.SetPROP_TIPO(const value   : string );
 begin
  FPROP_TIPO := value;
 end;

procedure Tprperty.SetPROP_VISIBIL(const value   : string );
 begin
  FPROP_VISIBIL := value;
 end;


  

  {Set Value Tdominios}

procedure Tdominios.SetDI_TIPO(const value   : string );
 begin
  FDI_TIPO := value;
 end;

procedure Tdominios.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tdominios.SetDI_DESCRICAO(const value   : string );
 begin
  FDI_DESCRICAO := value;
 end;


  {Set Value Tmetodos}

procedure Tmetodos.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tmetodos.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tmetodos.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tmetodos.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure Tmetodos.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure Tmetodos.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure Tmetodos.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tmetodos.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tmetodos.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure Tmetodos.SetIDF_METBIND(const value   : string );
 begin
  FIDF_METBIND := value;
 end;

procedure Tmetodos.SetIDF_METDIRECT(const value   : string );
 begin
  FIDF_METDIRECT := value;
 end;

procedure Tmetodos.SetIDF_METTYPE(const value   : string );
 begin
  FIDF_METTYPE := value;
 end;

procedure Tmetodos.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tmetodos.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tmetodos.SetIDF_TIPO(const value   : string );
 begin
  FIDF_TIPO := value;
 end;

procedure Tmetodos.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tmetodos.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tmetodos.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tmetodos.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tmetodos.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tmetodos.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure Tmetodos.SetMET_COMENT(const value   : string );
 begin
  FMET_COMENT := value;
 end;

procedure Tmetodos.SetMET_NOME(const value   : string );
 begin
  FMET_NOME := value;
 end;

procedure Tmetodos.SetMET_VISIBIL(const value   : string );
 begin
  FMET_VISIBIL := value;
 end;


  {Set Value Taliass}

procedure Taliass.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Taliass.SetIDF_ALIAS(const value   : string );
 begin
  FIDF_ALIAS := value;
 end;

procedure Taliass.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;



{FIM SET VALUES}

end.
