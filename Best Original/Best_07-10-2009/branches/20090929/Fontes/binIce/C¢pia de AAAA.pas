unit AAAA;

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
  
{Classe Tcliente}
Tcliente=Class(Tdados)
     private
      FCLI_ID                         : integer ;
      FCLI_AREA_INTERESSE             : string ;
      FCLI_DIR                        : string ;
      FCLI_NOME                       : string ;
      FCLI_RAZ_O_SOCIAL               : string ;
      FDIR_ALIAS                      : string ;
      procedure SetCLI_ID(const value   : integer );
      procedure SetCLI_AREA_INTERESSE(const value   : string );
      procedure SetCLI_DIR(const value   : string );
      procedure SetCLI_NOME(const value   : string );
      procedure SetCLI_RAZ_O_SOCIAL(const value   : string );
      procedure SetDIR_ALIAS(const value   : string );
      procedure AftrScroll (DataSet: TDataSet);

  published
   property CLI_ID                        : integer            read FCLI_ID write SetCLI_ID;
   property CLI_AREA_INTERESSE            : string             read FCLI_AREA_INTERESSE write SetCLI_AREA_INTERESSE;
   property CLI_DIR                       : string             read FCLI_DIR write SetCLI_DIR;
   property CLI_NOME                      : string             read FCLI_NOME write SetCLI_NOME;
   property CLI_RAZ_O_SOCIAL              : string             read FCLI_RAZ_O_SOCIAL write SetCLI_RAZ_O_SOCIAL;
   property DIR_ALIAS                     : string             read FDIR_ALIAS write SetDIR_ALIAS;

{ inclui 1 registro}
  function Inclui() : boolean;
  
{ Atualiza 1 registro (Chave Primária)}
  function Atualiza(pCLI_ID : integer ) : boolean;
  
    { Deleta 1 registro (Chave Primária)}
  function Delete_object(pCLI_ID : integer ) : boolean;
  
{ retorna Objeto específico}
  function Get_Object(pCLI_ID : integer ) : boolean;
  
{ retorna maior código}
  function Get_MaxKey() : integer;
  
{ retorna todos os registros}
  function Get_All () : boolean;
  

  constructor Create (Aowner : TComponent);
end;  



{FIM CLASSES}

resourcestring

  Mens1       = 'Confirma a Eliminação ?';

var
 mObj : uObj;
 GenCount : Integer;


implementation

uses aform;


{INICIO METODOS}

constructor Tdados.Create;
 begin
 inherited create(application);
   inc(GenCount);
     {informar Database ou ADO connection aqui}
   //Databasename := 'xx';   para não ADO
   //connection     := dm.xx;  //para ADO
   Connection := frm_aform.adoc;
   DataExt          := TdataSource.create(self);
   DataExt.Name     := 'DS'+inttostr(GenCount);
   dataext.DataSet  := self;

 {  fprovider  := TProvider.create(self);         //eliminar se não for ADO

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
   fclient.FetchOnDemand       := true;  //eliminar se não for ADO  }

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
  procedure Tcliente.AftrScroll(DataSet: TDataSet);
  begin
      CLI_ID                    := DataSet.fieldbyname('CLI_ID').asinteger;
      CLI_AREA_INTERESSE        := DataSet.fieldbyname('CLI_AREA_INTERESSE').asstring;
      CLI_DIR                   := DataSet.fieldbyname('CLI_DIR').asstring;
      CLI_NOME                  := DataSet.fieldbyname('CLI_NOME').asstring;
      CLI_RAZ_O_SOCIAL          := DataSet.fieldbyname('CLI_RAZ_O_SOCIAL').asstring;
      DIR_ALIAS                 := DataSet.fieldbyname('DIR_ALIAS').asstring;
  end;


{Tcliente Métodos}

constructor Tcliente.Create ; 
  begin
   inherited create(application);
   AfterScroll := AftrScroll;
  end; 


function Tcliente.Inclui() : boolean;
VAR
Wkey : integer;
oObj : Tcliente;
begin
 DecimalSeparator := '.';
 result := false;
 close;
 sql.clear;
 Afterscroll := nil;
 If CLI_ID = 0 then ;
  begin
     oObj := Tcliente.create(application);
     oObj.CLI_ID:= CLI_ID;
     ooBj.Afterscroll := nil;
     wkey := oObj.get_maxkey() + 1;
     Freeandnil(oObj);
    CLI_ID := WKEY;
  end;
sql.text := 'INSERT INTO CLI_CLIENTE('+
'CLI_ID,'+
'CLI_AREA_INTERESSE,'+
'CLI_DIR,'+
'CLI_NOME,'+
'CLI_RAZ_O_SOCIAL,'+
'DIR_ALIAS)'+
'VALUES ('+

InttoStr(CLI_ID)+','+
AnsiQuotedStr(CLI_AREA_INTERESSE,chr(39))+','+
AnsiQuotedStr(CLI_DIR,chr(39))+','+
AnsiQuotedStr(CLI_NOME,chr(39))+','+
AnsiQuotedStr(CLI_RAZ_O_SOCIAL,chr(39))+','+
AnsiQuotedStr(DIR_ALIAS,chr(39))+
' )';
 execsql;
 If rowsaffected > 0 then 
    Result := true;
 DecimalSeparator := ',';
end;


function Tcliente.Atualiza (pCLI_ID : integer ) : boolean;
 begin
  DecimalSeparator := '.';
  result := false;
  close;
  sql.clear;
  sql.text := 'UPDATE CLI_CLIENTE'+
'  SET '+
   'CLI_ID = '+InttoStr(CLI_ID)+','+
   'CLI_AREA_INTERESSE = '+AnsiQuotedStr(CLI_AREA_INTERESSE,chr(39))+','+
   'CLI_DIR = '+AnsiQuotedStr(CLI_DIR,chr(39))+','+
   'CLI_NOME = '+AnsiQuotedStr(CLI_NOME,chr(39))+','+
   'CLI_RAZ_O_SOCIAL = '+AnsiQuotedStr(CLI_RAZ_O_SOCIAL,chr(39))+','+
   'DIR_ALIAS = '+AnsiQuotedStr(CLI_RAZ_O_SOCIAL,chr(39))+
' WHERE CLI_ID = '+InttoStr(pCLI_ID)

;

  execsql;
  If rowsaffected > 0 then 
    Result := true;
  DecimalSeparator := ',';
end;


function Tcliente.Delete_Object (pCLI_ID : integer ) : boolean;
 begin
  DecimalSeparator := '.';
  result := false;
  close;
  sql.clear;
  sql.text := 'DELETE FROM CLI_CLIENTE'+
' WHERE CLI_ID = '+InttoStr(pCLI_ID)

;

  execsql;
  If rowsaffected > 0 then 
    Result := true;
  DecimalSeparator := ',';
end;


function Tcliente.Get_Object (pCLI_ID : integer ) : boolean;
 begin
  result := false;
  close;
  sql.clear;
  sql.text := 'SELECT * FROM CLI_CLIENTE'+
' WHERE CLI_ID = '+InttoStr(pCLI_ID)

;

  open;
  If not Eof then 
     begin 
      AftrScroll(self); 
      Result := true;
     end; 
end;


function Tcliente.Get_MaxKey () : integer;
 begin
  result := 0;
  close;
  sql.clear;
  sql.text := 'SELECT CLI_ID AS MAXK FROM CLI_CLIENTE'+
' WHERE CLI_ID = (SELECT MAX(CLI_ID) FROM CLI_CLIENTE'
+')'
;
  SQL.SAVETOFILE('C:\SQL.TXT');
  open;
  If not eof  then 
    Result := fieldbyName('MAXK').asinteger;
end;


function Tcliente.Get_All () : boolean;
 begin
  result := false;
  close;
  sql.clear;
  sql.text := 'SELECT * FROM CLI_CLIENTE'
;

  open;
  If not Eof then 
    Result := true;
end;



{FIM METODOS}

{INICIO SET VALUES}

procedure Tdados.SetdataSource ( value : TdataSource);
 begin
    fdataSource  := value;
 end;
  {Set Value Tcliente}

procedure Tcliente.SetCLI_ID(const value   : integer );
 begin
  FCLI_ID := value;
 end;

procedure Tcliente.SetCLI_AREA_INTERESSE(const value   : string );
 begin
  FCLI_AREA_INTERESSE := value;
 end;

procedure Tcliente.SetCLI_DIR(const value   : string );
 begin
  FCLI_DIR := value;
 end;

procedure Tcliente.SetCLI_NOME(const value   : string );
 begin
  FCLI_NOME := value;
 end;

procedure Tcliente.SetCLI_RAZ_O_SOCIAL(const value   : string );
 begin
  FCLI_RAZ_O_SOCIAL := value;
 end;

procedure Tcliente.SetDIR_ALIAS(const value   : string );
 begin
  FDIR_ALIAS := value;
 end;


 
{FIM SET VALUES}

end.
