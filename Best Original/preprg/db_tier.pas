unit db_tier;     {classes de connection  com Bancos de dados}

interface

uses
  windows,DB, ADODB,forms,Messages,Dialogs,DBtables,basetier;



Type

 // Forward references
  TDados = class;
  TDb = class;

//classe genérica de query
Tdados = Class(TDObject)
  private
    FDbTipo: TDb;
    FDbqry: TDataset;
    procedure SetDbTipo(const Value: TDb);
    procedure SetDbqry(const Value: TDataset);

 public
   constructor create(pClass : Tclass);overload;

 published
  property DbTipo : TDb read FDbTipo write SetDbTipo;
  property Dbqry  : TDataset read FDbqry write SetDbqry;



end;

//classe genérica de BD
TDb = Class
  private
    FDbTipo: TObject;
    FDBqry: Tdados;
    procedure SetDbTipo(const Value: TObject);
    procedure SetDBqry(const Value: Tdados);

 protected


 public
    constructor create(pClass : Tclass);overload;

 published
  property DbTipo   : TObject read FDbTipo write SetDbTipo;
  property DBDados  : Tdados read FDBqry write SetDBqry;
end;

var
DBAtu : TDB;

implementation

  Constructor TDB.create(pClass : Tclass);
   begin
   //  pClass.Create;
     If pClass = TADOConnection then
      begin
          DbTipo   := TadoConnection.create(application);
         //Provider := pProvider;
         //(DbTipo as TADoConnection).DefaultDatabase := pDbname;
         //DbQry    := TAdoQuery.Create(application);
         //(DbQry as TADoQuery).Connection := (DbTipo as TADoConnection);
      //   (DbTipo as Tadoconnection).ConnectionString := dbs.adoc.connectionstring;
         (DbTipo as Tadoconnection).LoginPrompt := false;
      //   DbDados := Tdados.Create;
      //   (DbDados.Dbqry as TAdoquery).Connection := (DbTipo as Tadoconnection);
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

   Constructor TDados.create(pClass : Tclass);
   begin
     inherited Create;
    // pClass.Create;
     If pClass = TADOQuery then
      begin
         Classtype.InheritsFrom(pClass);

        // (self as TAdoquery)    := TAdoQuery.Create(application);
        // (DbQry as TADoQuery).Connection := (DbTipo as TADoConnection);
      //   (DbTipo as Tadoconnection).ConnectionString := dbs.adoc.connectionstring;
      end;
     


   end;

procedure TDb.SetDBqry(const Value: Tdados);
begin
  FDBqry := Value;
end;

procedure TDb.SetDbTipo(const Value: TObject);
begin
  FDbTipo := Value;
end;

procedure Tdados.SetDbqry(const Value: TDataset);
begin
  FDbqry := Value;
end;

procedure Tdados.SetDbTipo(const Value: TDb);
begin
  FDbTipo := Value;
end;

end.
