unit CA1;

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
  {Objeto ATOR}
Tator=Class(Tdados)
   private
   FCLI_ID : integer ;
   FPRJ_ID : integer ;
   FIDF_CODIGO : integer ;
   FATIVIDADE_MAE : integer ;
   FIDF_ACTOR_ROLE : string ;
   FIDF_CLASSEOBJETO : string ;
   FIDF_COMPETENCIA : string ;
   FIDF_COND_TRABALHO : string ;
   FIDF_CONHECIMENTO : string ;
   FIDF_CUSTO_ANUAL : real ;
   FIDF_DEL : string ;
   FIDF_DESCRICAO : string ;
   FIDF_DESIGNACAO : string ;
   FIDF_DIRETORIO : string ;
   FIDF_EFETIVO_DA_CLASSE : real ;
   FIDF_ESPECIALIZACAO : string ;
   FIDF_EXPERIENCA : string ;
   FIDF_FORMACAO : string ;
   FIDF_FUNCAO_NIVEL : string ;
   FIDF_ID : integer ;
   FIDF_ID_FISICO : integer ;
   FIDF_JORNADA_ANUAL : real ;
   FIDF_JORNADA_PADRAO : real ;
   FIDF_NOME : string ;
   FIDF_OBJETIVO : string ;
   FIDF_OI : integer ;
   FIDF_QUANTIDADE_TURNOS : real ;
   FIDF_REPONSABILIDADE : string ;
   FIDF_RESPONSAVEL : string ;
   FIDF_TIPO_ATIV : string ;
   FIDF_TIPO_ATIVIDADE : string ;
   FIDF_UPDATE_DATE : real ;
   FIDF_USE_CASE_ACTOR_TYPE : string ;
   FIDF_VERSAO : string ;
   FIDF_VERSAO_DATA : real ;
   FIDF_VISIBLE : string ;
   FIDG_ID : integer ;
   FSUB_ID : integer ;
   FSUB_NIVEL : integer ;
  procedure SetCLI_ID(const value   : integer )
  procedure SetPRJ_ID(const value   : integer )
  procedure SetIDF_CODIGO(const value   : integer )
  procedure SetATIVIDADE_MAE(const value   : integer )
  procedure SetIDF_ACTOR_ROLE(const value   : string )
  procedure SetIDF_CLASSEOBJETO(const value   : string )
  procedure SetIDF_COMPETENCIA(const value   : string )
  procedure SetIDF_COND_TRABALHO(const value   : string )
  procedure SetIDF_CONHECIMENTO(const value   : string )
  procedure SetIDF_CUSTO_ANUAL(const value   : real )
  procedure SetIDF_DEL(const value   : string )
  procedure SetIDF_DESCRICAO(const value   : string )
  procedure SetIDF_DESIGNACAO(const value   : string )
  procedure SetIDF_DIRETORIO(const value   : string )
  procedure SetIDF_EFETIVO_DA_CLASSE(const value   : real )
  procedure SetIDF_ESPECIALIZACAO(const value   : string )
  procedure SetIDF_EXPERIENCA(const value   : string )
  procedure SetIDF_FORMACAO(const value   : string )
  procedure SetIDF_FUNCAO_NIVEL(const value   : string )
  procedure SetIDF_ID(const value   : integer )
  procedure SetIDF_ID_FISICO(const value   : integer )
  procedure SetIDF_JORNADA_ANUAL(const value   : real )
  procedure SetIDF_JORNADA_PADRAO(const value   : real )
  procedure SetIDF_NOME(const value   : string )
  procedure SetIDF_OBJETIVO(const value   : string )
  procedure SetIDF_OI(const value   : integer )
  procedure SetIDF_QUANTIDADE_TURNOS(const value   : real )
  procedure SetIDF_REPONSABILIDADE(const value   : string )
  procedure SetIDF_RESPONSAVEL(const value   : string )
  procedure SetIDF_TIPO_ATIV(const value   : string )
  procedure SetIDF_TIPO_ATIVIDADE(const value   : string )
  procedure SetIDF_UPDATE_DATE(const value   : real )
  procedure SetIDF_USE_CASE_ACTOR_TYPE(const value   : string )
  procedure SetIDF_VERSAO(const value   : string )
  procedure SetIDF_VERSAO_DATA(const value   : real )
  procedure SetIDF_VISIBLE(const value   : string )
  procedure SetIDG_ID(const value   : integer )
  procedure SetSUB_ID(const value   : integer )
  procedure SetSUB_NIVEL(const value   : integer )



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
{FIM METODOS}

{INICIO SET VALUES}

procedure Tdados.SetdataSource ( value : TdataSource);
 begin
    fdataSource  := value;
 end;
{FIM SET VALUES}

end.
