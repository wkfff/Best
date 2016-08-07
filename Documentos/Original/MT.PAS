unit MT;

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
{INICIO CLASSES}
  
{Classe METODOS}
Tmetodos=Class(Tdados)
     private
      FCLI_ID : integer ;
      FPRJ_ID : integer ;
      FIDF_CODIGO : integer ;
      FCLASS_ID : integer ;
      FIDF_SEQ : integer ;
      FIDF_CAT : string ;
      FIDF_DEL : string ;
      FIDF_DESIGNACAO : string ;
      FIDF_DIRETORIO : string ;
      FIDF_METBIND : string ;
      FIDF_METDIRECT : string ;
      FIDF_METTYPE : string ;
      FIDF_OBJETIVO : string ;
      FIDF_RESPONSAVEL : string ;
      FIDF_TIPO : string ;
      FIDF_TIPO_ATIVIDADE : string ;
      FIDF_VERSAO : string ;
      FIDF_VERSAO_DATA : real ;
      FIDF_VISIBLE : string ;
      FIDG_ID : integer ;
      FLCK : string ;
      FMET_COMENT : string ;
      FMET_NOME : string ;
      FMET_VISIBIL : string ;
      procedure SetCLI_ID(const value   : integer )
      procedure SetPRJ_ID(const value   : integer )
      procedure SetIDF_CODIGO(const value   : integer )
      procedure SetCLASS_ID(const value   : integer )
      procedure SetIDF_SEQ(const value   : integer )
      procedure SetIDF_CAT(const value   : string )
      procedure SetIDF_DEL(const value   : string )
      procedure SetIDF_DESIGNACAO(const value   : string )
      procedure SetIDF_DIRETORIO(const value   : string )
      procedure SetIDF_METBIND(const value   : string )
      procedure SetIDF_METDIRECT(const value   : string )
      procedure SetIDF_METTYPE(const value   : string )
      procedure SetIDF_OBJETIVO(const value   : string )
      procedure SetIDF_RESPONSAVEL(const value   : string )
      procedure SetIDF_TIPO(const value   : string )
      procedure SetIDF_TIPO_ATIVIDADE(const value   : string )
      procedure SetIDF_VERSAO(const value   : string )
      procedure SetIDF_VERSAO_DATA(const value   : real )
      procedure SetIDF_VISIBLE(const value   : string )
      procedure SetIDG_ID(const value   : integer )
      procedure SetLCK(const value   : string )
      procedure SetMET_COMENT(const value   : string )
      procedure SetMET_NOME(const value   : string )
      procedure SetMET_VISIBIL(const value   : string )
       procedure AftrScroll (DataSet: TDataSet);

  published
   property CLI_ID read FCLI_ID write SetCLI_ID;
   property PRJ_ID read FPRJ_ID write SetPRJ_ID;
   property IDF_CODIGO read FIDF_CODIGO write SetIDF_CODIGO;
   property CLASS_ID read FCLASS_ID write SetCLASS_ID;
   property IDF_SEQ read FIDF_SEQ write SetIDF_SEQ;
   property IDF_CAT read FIDF_CAT write SetIDF_CAT;
   property IDF_DEL read FIDF_DEL write SetIDF_DEL;
   property IDF_DESIGNACAO read FIDF_DESIGNACAO write SetIDF_DESIGNACAO;
   property IDF_DIRETORIO read FIDF_DIRETORIO write SetIDF_DIRETORIO;
   property IDF_METBIND read FIDF_METBIND write SetIDF_METBIND;
   property IDF_METDIRECT read FIDF_METDIRECT write SetIDF_METDIRECT;
   property IDF_METTYPE read FIDF_METTYPE write SetIDF_METTYPE;
   property IDF_OBJETIVO read FIDF_OBJETIVO write SetIDF_OBJETIVO;
   property IDF_RESPONSAVEL read FIDF_RESPONSAVEL write SetIDF_RESPONSAVEL;
   property IDF_TIPO read FIDF_TIPO write SetIDF_TIPO;
   property IDF_TIPO_ATIVIDADE read FIDF_TIPO_ATIVIDADE write SetIDF_TIPO_ATIVIDADE;
   property IDF_VERSAO read FIDF_VERSAO write SetIDF_VERSAO;
   property IDF_VERSAO_DATA read FIDF_VERSAO_DATA write SetIDF_VERSAO_DATA;
   property IDF_VISIBLE read FIDF_VISIBLE write SetIDF_VISIBLE;
   property IDG_ID read FIDG_ID write SetIDG_ID;
   property LCK read FLCK write SetLCK;
   property MET_COMENT read FMET_COMENT write SetMET_COMENT;
   property MET_NOME read FMET_NOME write SetMET_NOME;
   property MET_VISIBIL read FMET_VISIBIL write SetMET_VISIBIL;

{ inclui 1 registro}
  function Inclui;
  
{ Atualiza 1 registro (Chave Primária)}
  function Atualiza(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
  
    { Deleta 1 registro (Chave Primária)}
  function Delete_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
  
{ retorna todos os registros}
  function get_All : boolean;
  
{ retorna Objeto específico}
  function get_Object(pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer ) : boolean;
  

  constructor Create (Aowner : TComponent);
end;  



{FIM CLASSES}

resourcestring

  Mens1       = 'Confirma a Eliminação ?';

var
 mObj : uObj;
 GenCount : Integer;


implementation


{INICIO METODOS}

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
  
{Tmetodos Métodos}

constructor Tmetodos.Create ; 
  begin
   inherited create(application);
   AfterScroll := AftrScroll;
  end; 


function Tmetodos.Inclui : boolean;
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
     wkey := get_maxkey('IDF_MT') + 1;
     FREE;
   end;
  IDF_CODIGO := WKEY;
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
' )';
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;


function Tmetodos.Atualiza pCLI_ID : integer ;pPRJ_ID : integer ;pIDF_CODIGO : integer  : boolean;
 begin
  DecimalSeparator := '.';
  sql.text := 'UPDATE IDF_MT'+
'  SET '+
   'CLI_ID = '+InttoStr(CLI_ID),+
   'PRJ_ID = '+InttoStr(PRJ_ID),+
   'IDF_CODIGO = '+InttoStr(IDF_CODIGO),+
   'CLASS_ID = '+InttoStr(CLASS_ID),+
   'IDF_SEQ = '+InttoStr(IDF_SEQ),+
   'IDF_CAT = '+AnsiQuotedStr(IDF_CAT,chr(39)),+
   'IDF_DEL = '+AnsiQuotedStr(IDF_DEL,chr(39)),+
   'IDF_DESIGNACAO = '+AnsiQuotedStr(IDF_DESIGNACAO,chr(39)),+
   'IDF_DIRETORIO = '+AnsiQuotedStr(IDF_DIRETORIO,chr(39)),+
   'IDF_METBIND = '+AnsiQuotedStr(IDF_METBIND,chr(39)),+
   'IDF_METDIRECT = '+AnsiQuotedStr(IDF_METDIRECT,chr(39)),+
   'IDF_METTYPE = '+AnsiQuotedStr(IDF_METTYPE,chr(39)),+
   'IDF_OBJETIVO = '+AnsiQuotedStr(IDF_OBJETIVO,chr(39)),+
   'IDF_RESPONSAVEL = '+AnsiQuotedStr(IDF_RESPONSAVEL,chr(39)),+
   'IDF_TIPO = '+AnsiQuotedStr(IDF_TIPO,chr(39)),+
   'IDF_TIPO_ATIVIDADE = '+AnsiQuotedStr(IDF_TIPO_ATIVIDADE,chr(39)),+
   'IDF_VERSAO = '+AnsiQuotedStr(IDF_VERSAO,chr(39)),+
   'IDF_VERSAO_DATA = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',IDF_VERSAO_DATA),chr(39)),+
   'IDF_VISIBLE = '+AnsiQuotedStr(IDF_VISIBLE,chr(39)),+
   'IDG_ID = '+InttoStr(IDG_ID),+
   'LCK = '+AnsiQuotedStr(LCK,chr(39)),+
   'MET_COMENT = '+AnsiQuotedStr(MET_COMENT,chr(39)),+
   'MET_NOME = '+AnsiQuotedStr(MET_NOME,chr(39)),+
   'MET_VISIBIL = '+AnsiQuotedStr(MET_NOME,chr(39))+
' WHERE CLI_ID = '+InttoStr(pCLI_ID)
+' AND PRJ_ID = '+InttoStr(pPRJ_ID)
+' AND IDF_CODIGO = '+InttoStr(pIDF_CODIGO)


  execsql;
  If rowsaffected > 0 then 
    Result := true;
  DecimalSeparator := ',';
end;



{FIM METODOS}

{INICIO SET VALUES}

procedure Tdados.SetdataSource ( value : TdataSource);
 begin
    fdataSource  := value;
 end;
  {Set Value Tmetodos}

procedure TIdf_m.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure TIdf_mt.SetPRJ_ID(const value   : integer );
 begin
  FPRJ_ID := value;
 end;

procedure TIdf_mt.SetIDF_CODIGO(const value   : integer );
 begin
  FIDF_CODIGO := value;
 end;

procedure TIdf_mt.SetCLASS_ID(const value   : integer );
 begin
  FCLASS_ID := value;
 end;

procedure TIdf_mt.SetIDF_SEQ(const value   : integer );
 begin
  FIDF_SEQ := value;
 end;

procedure TIdf_mt.SetIDF_CAT(const value   : string );
 begin
  FIDF_CAT := value;
 end;

procedure TIdf_mt.SetIDF_DEL(const value   : string );
 begin
  FIDF_DEL := value;
 end;

procedure TIdf_mt.SetIDF_DESIGNACAO(const value   : string );
 begin
  FIDF_DESIGNACAO := value;
 end;

procedure TIdf_mt.SetIDF_DIRETORIO(const value   : string );
 begin
  FIDF_DIRETORIO := value;
 end;

procedure TIdf_mt.SetIDF_METBIND(const value   : string );
 begin
  FIDF_METBIND := value;
 end;

procedure TIdf_mt.SetIDF_METDIRECT(const value   : string );
 begin
  FIDF_METDIRECT := value;
 end;

procedure TIdf_mt.SetIDF_METTYPE(const value   : string );
 begin
  FIDF_METTYPE := value;
 end;

procedure TIdf_mt.SetIDF_OBJETIVO(const value   : string );
 begin
  FIDF_OBJETIVO := value;
 end;

procedure TIdf_mt.SetIDF_RESPONSAVEL(const value   : string );
 begin
  FIDF_RESPONSAVEL := value;
 end;

procedure TIdf_mt.SetIDF_TIPO(const value   : string );
 begin
  FIDF_TIPO := value;
 end;

procedure TIdf_mt.SetIDF_TIPO_ATIVIDADE(const value   : string );
 begin
  FIDF_TIPO_ATIVIDADE := value;
 end;

procedure TIdf_mt.SetIDF_VERSAO(const value   : string );
 begin
  FIDF_VERSAO := value;
 end;

procedure TIdf_mt.SetIDF_VERSAO_DATA(const value   : real );
 begin
  FIDF_VERSAO_DATA := value;
 end;

procedure TIdf_mt.SetIDF_VISIBLE(const value   : string );
 begin
  FIDF_VISIBLE := value;
 end;

procedure TIdf_mt.SetIDG_ID(const value   : integer );
 begin
  FIDG_ID := value;
 end;

procedure TIdf_mt.SetLCK(const value   : string );
 begin
  FLCK := value;
 end;

procedure TIdf_mt.SetMET_COMENT(const value   : string );
 begin
  FMET_COMENT := value;
 end;

procedure TIdf_mt.SetMET_NOME(const value   : string );
 begin
  FMET_NOME := value;
 end;

procedure TIdf_mt.SetMET_VISIBIL(const value   : string );
 begin
  FMET_VISIBIL := value;
 end;



{FIM SET VALUES}

end.
