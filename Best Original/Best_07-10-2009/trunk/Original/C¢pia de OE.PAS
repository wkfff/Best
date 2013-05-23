unit OE;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,Provider,DBClient,
  ADODb,dbTables,math,strUtils,DB;

 type
  uEmp = ^Temp;
  TEmp = record
     Fcli: integer;
  end;
                            
  type
  uCen = ^TCen;
  TCen = record
     Fcli: integer;
     fCenario : integer;
  end;

  type
  uDiag = ^TDiag;
  TDiag = record
     Fcli       : integer;
     fCenario   : integer;
     fDiag      : integer;
  end;


  type
  uObj = ^TObj;
  TObj = record
     Fcodigo     : string;
     fDesc       : string;
  end;

TDados= Class(TADOQuery)   // modificar para Tquery para não usar ADO
  Private
     fdatasource : TdataSource;
     fChave     : string;
     fCpoLista1 : string;
     fCpoLista2 : string;
     FSQL: Tstrings;
     Db : Tdatabase;

     procedure SetdataSource ( value : TdataSource);
     procedure AftrPost (dataSet : TdataSet);
     procedure PostErr(DataSet: TDataSet; E: EDatabaseError;var Action: TDataAction);
     procedure OnErrorRec(DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
  published

   property DataExt: TdataSource read fdataSource write SetDataSource;

   public
    Status     : char;
    fprovider : TDatasetProvider;
    fClient : TClientDataset;
    constructor Create (Aowner : TComponent);
    procedure Cria_lista (pLista: TTreeView;pMostraKey,pLimpa : boolean );
end;

{Objeto IDF_OE}
Tidf_oe=Class(Tdados)
private
     {private}
  FSUB_NIVEL : integer ;
  FSUB_ID : integer ;
  FIDG_ID : integer ;
  FIDF_VISIBLE : string ;
  FIDF_VERSAO_DATA : real ;
  FIDF_VERSAO : string ;
  FIDF_UPDATE_DATE : real ;
  FIDF_TIPO_ATIVIDADE : string ;
  FIDF_TIPO_ATIV : string ;
  FIDF_SYSTEMTABLE : string ;
  FIDF_RESPONSAVEL : string ;
  FIDF_OI : integer ;
  FIDF_OBJETIVO : string ;
  FIDF_NOME : string ;
  FIDF_ID_FISICO : integer ;
  FIDF_ID : integer ;
  FIDF_DESIGNACAO : string ;
  FIDF_DESCRICAO : string ;
  FIDF_DEL : string ;
  FIDF_DBTYPE : string ;
  FIDF_DBDIR : string ;
  FIDF_DATABASE : string ;
  FIDF_CLASSEOBJETO : string ;
  FATIVIDADE_MAE : integer ;
  FIDF_CODIGO : integer ;
  FPRJ_ID : integer ;
  FCLI_ID : integer ;
  procedure SetSUB_NIVEL(const value   : integer );
  procedure SetSUB_ID(const value   : integer );
  procedure SetIDG_ID(const value   : integer );
  procedure SetIDF_VISIBLE(const value   : string );
  procedure SetIDF_VERSAO_DATA(const value   : real );
  procedure SetIDF_VERSAO(const value   : string );
  procedure SetIDF_UPDATE_DATE(const value   : real );
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string );
  procedure SetIDF_TIPO_ATIV(const value   : string );
  procedure SetIDF_SYSTEMTABLE(const value   : string );
  procedure SetIDF_RESPONSAVEL(const value   : string );
  procedure SetIDF_OI(const value   : integer );
  procedure SetIDF_OBJETIVO(const value   : string );
  procedure SetIDF_NOME(const value   : string );
  procedure SetIDF_ID_FISICO(const value   : integer );
  procedure SetIDF_ID(const value   : integer );
  procedure SetIDF_DESIGNACAO(const value   : string );
  procedure SetIDF_DESCRICAO(const value   : string );
  procedure SetIDF_DEL(const value   : string );
  procedure SetIDF_DBTYPE(const value   : string );
  procedure SetIDF_DBDIR(const value   : string );
  procedure SetIDF_DATABASE(const value   : string );
  procedure SetIDF_CLASSEOBJETO(const value   : string );
  procedure SetATIVIDADE_MAE(const value   : integer );
  procedure SetIDF_CODIGO(const value   : integer );
  procedure SetPRJ_ID(const value   : integer );
  procedure SetCLI_ID(const value   : integer );
  procedure AftrScroll (DataSet: TDataSet);

public
     {publicTidf_oe}
   constructor Create (Aowner : TComponent);

published
  property SUB_NIVEL : integer  read FSUB_NIVEL write SetSUB_NIVEL;
  property SUB_ID : integer  read FSUB_ID write SetSUB_ID;
  property IDG_ID : integer  read FIDG_ID write SetIDG_ID;
  property IDF_VISIBLE : string  read FIDF_VISIBLE write SetIDF_VISIBLE;
  property IDF_VERSAO_DATA : real  read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
  property IDF_VERSAO : string  read FIDF_VERSAO write SetIDF_VERSAO;
  property IDF_UPDATE_DATE : real  read FIDF_UPDATE_DATE write SetIDF_UPDATE_DATE;
  property IDF_TIPO_ATIVIDADE : string  read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
  property IDF_TIPO_ATIV : string  read FIDF_TIPO_ATIV write SetIDF_TIPO_ATIV;
  property IDF_SYSTEMTABLE : string  read FIDF_SYSTEMTABLE write SetIDF_SYSTEMTABLE;
  property IDF_RESPONSAVEL : string  read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
  property IDF_OI : integer  read FIDF_OI write SetIDF_OI;
  property IDF_OBJETIVO : string  read FIDF_OBJETIVO write SetIDF_OBJETIVO;
  property IDF_NOME : string  read FIDF_NOME write SetIDF_NOME;
  property IDF_ID_FISICO : integer  read FIDF_ID_FISICO write SetIDF_ID_FISICO;
  property IDF_ID : integer  read FIDF_ID write SetIDF_ID;
  property IDF_DESIGNACAO : string  read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
  property IDF_DESCRICAO : string  read FIDF_DESCRICAO write SetIDF_DESCRICAO;
  property IDF_DEL : string  read FIDF_DEL write SetIDF_DEL;
  property IDF_DBTYPE : string  read FIDF_DBTYPE write SetIDF_DBTYPE;
  property IDF_DBDIR : string  read FIDF_DBDIR write SetIDF_DBDIR;
  property IDF_DATABASE : string  read FIDF_DATABASE write SetIDF_DATABASE;
  property IDF_CLASSEOBJETO : string  read FIDF_CLASSEOBJETO write SetIDF_CLASSEOBJETO;
  property ATIVIDADE_MAE : integer  read FATIVIDADE_MAE write SetATIVIDADE_MAE;
  property IDF_CODIGO : integer  read FIDF_CODIGO write SetIDF_CODIGO;
  property PRJ_ID : integer  read FPRJ_ID write SetPRJ_ID;
  property CLI_ID : integer  read FCLI_ID write SetCLI_ID;
 
    { Inclui 1 registro}
 
 
    { atualizar Objeto específico}
 
 
 
    { Inclui 1 registro}
  function Inclui : boolean;
 
 
    { atualizar Objeto específico}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pATIVIDADE_MAE : integer ) : boolean;
 
    { Procura a próxima PK}
  function Get_MaxKey() :integer;
 
 
    { Deleta 1 registro (Chave Primária)}
  function Delete_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pATIVIDADE_MAE : integer ) : boolean;
 
 
    { retorna Objeto específico}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pATIVIDADE_MAE : integer ) : boolean;
 
    { retorna todos os registros}
  function get_All : boolean;
 
end;

resourcestring

  Mens1       = 'Confirma a Eliminação ?';

var
 mObj : uObj;
 GenCount : Integer;


implementation

constructor Tdados.Create;
 begin
 inherited create(application);
   inc(GenCount);
     {informar Database ou ADO connection aqui}
   //Databasename := 'xx';   para não ADO
   //connection     := dm.xx;  //para ADO
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

   fprovider  := TProvider.create(self);         //eliminar se não for ADO

   with fProvider do                             //eliminar se não for ADO
   begin
      Name        := 'PRV'+inttostr(genCount);
      DataSet     := self;
      //OnUpdateError := ClienteUpdate;
   end;
   fClient := TClientdataSet.create(self);         //eliminar se não for ADO
   with fClient do
   begin
    ProviderName     := fProvider.Name;             //eliminar se não for ADO
    Name             := 'CDS'+inttostr(genCount);   //eliminar se não for ADO
    //OnDeleteError := clientedelete;
    OnReconcileError := OnErrorRec;                 //eliminar se não for ADO
    AggregatesActive  := true;                      //eliminar se não for ADO
   end;
   Dataext.DataSet     := fClient;                  //eliminar se não for ADO
   fClient.AfterPost   := AftrPost;
   fclient.OnPostError         := PostErr;  //eliminar se não for ADO
   fclient.PacketRecords       := 500;   //eliminar se não for ADO
   fclient.FetchOnDemand       := true;  //eliminar se não for ADO

 end;

procedure TDados.PostErr(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  dataset.cancel;
  showmessage('Erro de Gravação(post)');
end;

procedure Tdados.OnErrorRec(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
 //  If UpdateKind = ukDelete then
     begin
      showmessage(e.Message);
      action := racancel;
     end;

end;



procedure Tdados.AftrPost(DataSet: TDataSet);
begin
  fClient.ApplyUpdates(0);
end;




procedure Tdados.Cria_lista (pLista: TTreeView;pMostraKey,pLimpa : boolean );
var
i : integer;
 begin
   If pLimpa then
     pLista.Items.clear;

    with Self do
     begin
      while not eof do
       begin
         new(mObj);
         mObj^.Fcodigo := fieldbyname(fcpoLista1).asstring ;
         mObj^.fDesc   := fieldbyname(fcpoLista2).asstring ;
         If pMostraKey then
            pLista.Items.AddObject(nil,mObj^.Fcodigo+'-'+mObj^.fDesc,mObj)
         else
            pLista.Items.AddObject(nil,mObj^.fDesc,mObj) ;
        // pLista.repaint;

       next;
       end;
      pLista.SortType := stText;
      pLista.AlphaSort(true);
     end;
 end;

procedure Tdados.SetdataSource ( value : TdataSource);
 begin
    fdataSource  := value;
 end;



 
{Tidf_oe Métodos}

procedure Tidf_oe.AftrScroll(DataSet: TDataSet);
begin
      SUB_NIVEL                 := DataSet.fieldbyname('SUB_NIVEL').asinteger;
      SUB_ID                    := DataSet.fieldbyname('SUB_ID').asinteger;
      IDG_ID                    := DataSet.fieldbyname('IDG_ID').asinteger;
      IDF_VISIBLE               := DataSet.fieldbyname('IDF_VISIBLE').asstring;
      IDF_VERSAO_DATA           := DataSet.fieldbyname('IDF_VERSAO_DATA').asfloat;
      IDF_VERSAO                := DataSet.fieldbyname('IDF_VERSAO').asstring;
      IDF_UPDATE_DATE           := DataSet.fieldbyname('IDF_UPDATE_DATE').asfloat;
      IDF_TIPO_ATIVIDADE        := DataSet.fieldbyname('IDF_TIPO_ATIVIDADE').asstring;
      IDF_TIPO_ATIV             := DataSet.fieldbyname('IDF_TIPO_ATIV').asstring;
      IDF_SYSTEMTABLE           := DataSet.fieldbyname('IDF_SYSTEMTABLE').asstring;
      IDF_RESPONSAVEL           := DataSet.fieldbyname('IDF_RESPONSAVEL').asstring;
      IDF_OI                    := DataSet.fieldbyname('IDF_OI').asinteger;
      IDF_OBJETIVO              := DataSet.fieldbyname('IDF_OBJETIVO').asstring;
      IDF_NOME                  := DataSet.fieldbyname('IDF_NOME').asstring;
      IDF_ID_FISICO             := DataSet.fieldbyname('IDF_ID_FISICO').asinteger;
      IDF_ID                    := DataSet.fieldbyname('IDF_ID').asinteger;
      IDF_DESIGNACAO            := DataSet.fieldbyname('IDF_DESIGNACAO').asstring;
      IDF_DESCRICAO             := DataSet.fieldbyname('IDF_DESCRICAO').asstring;
      IDF_DEL                   := DataSet.fieldbyname('IDF_DEL').asstring;
      IDF_DBTYPE                := DataSet.fieldbyname('IDF_DBTYPE').asstring;
      IDF_DBDIR                 := DataSet.fieldbyname('IDF_DBDIR').asstring;
      IDF_DATABASE              := DataSet.fieldbyname('IDF_DATABASE').asstring;
      IDF_CLASSEOBJETO          := DataSet.fieldbyname('IDF_CLASSEOBJETO').asstring;
      ATIVIDADE_MAE             := DataSet.fieldbyname('ATIVIDADE_MAE').asinteger;
      IDF_CODIGO                := DataSet.fieldbyname('IDF_CODIGO').asinteger;
      PRJ_ID                    := DataSet.fieldbyname('PRJ_ID').asinteger;
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
end;

function Tidf_oe.Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pATIVIDADE_MAE : integer ) : boolean;
begin
DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 sql.add('UPDATE IDF_OE');
 sql.add('SET ');
 sql.add('IDF_CLASSEOBJETO = '+#39+IDF_CLASSEOBJETO+#39+',');
 sql.add('IDF_DATABASE = '+#39+IDF_DATABASE+#39+',');
 sql.add('IDF_DBDIR = '+#39+IDF_DBDIR+#39+',');
 sql.add('IDF_DBTYPE = '+#39+IDF_DBTYPE+#39+',');
 sql.add('IDF_DEL = '+#39+IDF_DEL+#39+',');
 sql.add('IDF_DESCRICAO = '+#39+IDF_DESCRICAO+#39+',');
 sql.add('IDF_DESIGNACAO = '+#39+IDF_DESIGNACAO+#39+',');
 sql.add('IDF_ID = '+IntToStr(IDF_ID)+',');
 sql.add('IDF_ID_FISICO = '+IntToStr(IDF_ID_FISICO)+',');
 sql.add('IDF_NOME = '+#39+IDF_NOME+#39+',');
 sql.add('IDF_OBJETIVO = '+#39+IDF_OBJETIVO+#39+',');
 sql.add('IDF_OI = '+IntToStr(IDF_OI)+',');
 sql.add('IDF_RESPONSAVEL = '+#39+IDF_RESPONSAVEL+#39+',');
 sql.add('IDF_SYSTEMTABLE = '+#39+IDF_SYSTEMTABLE+#39+',');
 sql.add('IDF_TIPO_ATIV = '+#39+IDF_TIPO_ATIV+#39+',');
 sql.add('IDF_TIPO_ATIVIDADE = '+#39+IDF_TIPO_ATIVIDADE+#39+',');
 sql.add('IDF_UPDATE_DATE = '+#39+formatdatetime('yyyy/mm/dd',IDF_UPDATE_DATE)+#39+',');
 sql.add('IDF_VERSAO = '+#39+IDF_VERSAO+#39+',');
 sql.add('IDF_VERSAO_DATA = '+#39+formatdatetime('yyyy/mm/dd',IDF_VERSAO_DATA)+#39+',');
 sql.add('IDF_VISIBLE = '+#39+IDF_VISIBLE+#39+',');
 sql.add('IDG_ID = '+IntToStr(IDG_ID)+',');
 sql.add('SUB_ID = '+IntToStr(SUB_ID)+',');
 sql.add('SUB_NIVEL = '+IntToStr(SUB_NIVEL));
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+IntToStr(pCLI_ID)+' AND ');
 sql.add('PRJ_ID = '+IntToStr(pPRJ_ID)+' AND ');
 sql.add('IDF_CODIGO = '+IntToStr(pIDF_CODIGO)+' AND ');
 sql.add('ATIVIDADE_MAE = '+IntToStr(pATIVIDADE_MAE));
 execsql;
 If rowsaffected > 0 then 
    Result := true;
DecimalSeparator := ',';
end;

function Tidf_oe.Inclui : boolean;
VAR
Wkey,wcli,wproj : integer;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 If Idf_codigo = 0 then ;
  begin
   wcli  := CLI_ID;
   wproj := PRJ_ID;
   with Tdados_tab.Create(self) do
    begin
     CLI_ID := WCLI;
     PRJ_ID:= wproj;
     wkey := get_maxkey('IDF_OE') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
  end;
sql.text := 'INSERT INTO IDF_OE('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_DATABASE,'+
'IDF_DBDIR,'+
'IDF_DBTYPE,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_NOME,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_SYSTEMTABLE,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_DATABASE,chr(39))+','+
AnsiQuotedStr(IDF_DBDIR,chr(39))+','+
AnsiQuotedStr(IDF_DBTYPE,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_SYSTEMTABLE,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
' ) ;'
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;




sql.text := 'INSERT INTO IDF_OE('+
'CLI_ID,'+
'PRJ_ID,'+
'IDF_CODIGO,'+
'ATIVIDADE_MAE,'+
'IDF_CLASSEOBJETO,'+
'IDF_DATABASE,'+
'IDF_DBDIR,'+
'IDF_DBTYPE,'+
'IDF_DEL,'+
'IDF_DESCRICAO,'+
'IDF_DESIGNACAO,'+
'IDF_ID,'+
'IDF_ID_FISICO,'+
'IDF_NOME,'+
'IDF_OBJETIVO,'+
'IDF_OI,'+
'IDF_RESPONSAVEL,'+
'IDF_SYSTEMTABLE,'+
'IDF_TIPO_ATIV,'+
'IDF_TIPO_ATIVIDADE,'+
'IDF_UPDATE_DATE,'+
'IDF_VERSAO,'+
'IDF_VERSAO_DATA,'+
'IDF_VISIBLE,'+
'IDG_ID,'+
'SUB_ID,'+
'SUB_NIVEL'') '+
'VALUES ('+

InttoStr(CLI_ID)+','+
InttoStr(PRJ_ID)+','+
InttoStr(IDF_CODIGO)+','+
InttoStr(ATIVIDADE_MAE)+','+
AnsiQuotedStr(IDF_CLASSEOBJETO,chr(39))+','+
AnsiQuotedStr(IDF_DATABASE,chr(39))+','+
AnsiQuotedStr(IDF_DBDIR,chr(39))+','+
AnsiQuotedStr(IDF_DBTYPE,chr(39))+','+
AnsiQuotedStr(IDF_DEL,chr(39))+','+
AnsiQuotedStr(IDF_DESCRICAO,chr(39))+','+
AnsiQuotedStr(IDF_DESIGNACAO,chr(39))+','+
InttoStr(IDF_ID)+','+
InttoStr(IDF_ID_FISICO)+','+
AnsiQuotedStr(IDF_NOME,chr(39))+','+
AnsiQuotedStr(IDF_OBJETIVO,chr(39))+','+
InttoStr(IDF_OI)+','+
AnsiQuotedStr(IDF_RESPONSAVEL,chr(39))+','+
AnsiQuotedStr(IDF_SYSTEMTABLE,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIV,chr(39))+','+
AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_UPDATE_DATE),chr(39))+','+
AnsiQuotedStr(IDF_VERSAO,chr(39))+','+
AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39))+','+
AnsiQuotedStr(IDF_VISIBLE,chr(39))+','+
InttoStr(IDG_ID)+','+
InttoStr(SUB_ID)+','+
InttoStr(SUB_NIVEL)+
' ) ;'
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;


function Tidf_oe.get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ;pATIVIDADE_MAE : integer ) : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_OE');
 sql.add(' WHERE ');
 sql.add('CLI_ID = '+''+InttoStr(pCLI_ID)+''+' AND ');
 sql.add('PRJ_ID = '+''+InttoStr(pPRJ_ID)+''+' AND ');
 sql.add('IDF_CODIGO = '+''+InttoStr(pIDF_CODIGO)+''+' AND ');
 sql.add('ATIVIDADE_MAE = '+''+InttoStr(pATIVIDADE_MAE)+'');
 open;
 If not eof then 
      Result := true;
 aftrscroll(self); // Carrega as propriedades com valores do banco 
end;

function Tidf_oe.Get_all : boolean;
begin
 result := false;
 close;
 sql.clear;
 sql.add('SELECT * FROM IDF_OE');
 open;
 If not eof then 
    Result := true;
end;

constructor Tidf_oe.Create ; 
begin
 inherited create(application);
 AfterScroll := AftrScroll;
end;
 
{Tidf_oe Métodos}

{Set Value} 

procedure Tidf_oe.SetSUB_NIVEL(const value   : integer );
 begin
  FSUB_NIVEL := value;
 end;

procedure Tidf_oe.SetSUB_ID(const value   : integer );
 begin
  FSUB_ID := value;
 end;

procedure Tidf_oe.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure Tidf_oe.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure Tidf_oe.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure Tidf_oe.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure Tidf_oe.SetIDF_UPDATE_DATE(const value   : real );
 begin
  FIDF_UPDATE_DATE := value;
 end;

procedure Tidf_oe.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure Tidf_oe.SetIDF_TIPO_ATIV(const value   : string );
 begin
  FIDF_TIPO_ATIV := value;
 end;

procedure Tidf_oe.SetIDF_SYSTEMTABLE(const value   : string );
 begin
  FIDF_SYSTEMTABLE := value;
 end;

procedure Tidf_oe.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure Tidf_oe.SetIDF_OI(const value   : integer );
 begin
  FIDF_OI := value;
 end;

procedure Tidf_oe.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure Tidf_oe.SetIDF_NOME(const value   : string );
 begin
  FIDF_NOME := value;
 end;

procedure Tidf_oe.SetIDF_ID_FISICO(const value   : integer );
 begin
  FIDF_ID_FISICO := value;
 end;

procedure Tidf_oe.SetIDF_ID(const value   : integer );
 begin
  FIDF_ID := value;
 end;

procedure Tidf_oe.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure Tidf_oe.SetIDF_DESCRICAO(const value   : string );
 begin
  FIDF_DESCRICAO := value;
 end;

procedure Tidf_oe.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure Tidf_oe.SetIDF_DBTYPE(const value   : string );
 begin
  FIDF_DBTYPE := value;
 end;

procedure Tidf_oe.SetIDF_DBDIR(const value   : string );
 begin
  FIDF_DBDIR := value;
 end;

procedure Tidf_oe.SetIDF_DATABASE(const value   : string );
 begin
  FIDF_DATABASE := value;
 end;

procedure Tidf_oe.SetIDF_CLASSEOBJETO(const value   : string );
 begin
  FIDF_CLASSEOBJETO := value;
 end;

procedure Tidf_oe.SetATIVIDADE_MAE(const value   : integer );
 begin
  FATIVIDADE_MAE := value;
 end;

procedure Tidf_oe.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure Tidf_oe.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure Tidf_oe.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

end.
