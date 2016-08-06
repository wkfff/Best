unit db_tier;     {classes de connection  com Bancos de dados}

interface

uses
  windows,DB, ADODB,forms,Messages,Dialogs,DBtables;


type

//classe genérica de BD
TDb = Class
  private
    FDbTipo: TObject;
    procedure SetDbTipo(const Value: TObject);
 protected


 public
    constructor create(pClass : Tclass);overload;

 published
  property DbTipo : TObject read FDbTipo write SetDbTipo;
end;

var
DBAtu : TDB;

implementation


  Constructor TDB.create(pClass : Tclass);
   begin
     pClass.Create;
     If pClass = TADOConnection then
      begin
         DbTipo := TadoConnection.create(application);
      //   (DbTipo as Tadoconnection).ConnectionString := dbs.adoc.connectionstring;
         (DbTipo as Tadoconnection).LoginPrompt := false;
      end;
     If pClass = TDatabase then
      begin
          DbTipo := TDatabase.create(Application);  // Interbase
         {(DbTipo as TdataBase).DriverName         := dbs.INTERDB.DriverName;
         (DbTipo as TdataBase).DatabaseName       := 'SAT';
         (DbTipo as TdataBase).Name               := 'iib';
         (DbTipo as TdataBase).LoginPrompt        := false;
         (DbTipo as TdataBase).Params             := dbs.INTERDB.Params; }
      end;


   end;

{ constructor TDB.create(pServer,pLogin,pPass : string ) ;
   begin
     
   end;   }



procedure TDb.SetDbTipo(const Value: TObject);
begin
  FDbTipo := Value;
end;

end.
