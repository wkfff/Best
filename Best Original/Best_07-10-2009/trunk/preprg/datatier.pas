unit DataTier;

// This unit provides data management support for BDE databases.
// Note that this is the first (only) unit which references the BDE.
// Therefore, changing the implementation of our object allows us to completely
// change the nature of the persistent storage of our objects.

interface

uses
  Classes, DBTables,basetier,ADODb,db,DIALOGS,Aligrid,stdctrls,db_tier;

type
  TDad = class (TDObject)
  private
    Query: TADOQuery;
    
    Fdds: TDataSOurce;
    FDBD: TDB;
    FFields: TStringList;
    function GetIntegerField (Name: String): Integer;
    function GetStringField (Name: String): String;
    function GetDateTimeField (Name: String): TDateTime;
    function GetBooleanField (Name: String): Boolean;
    procedure SetIntegerField (Name: String; Value: Integer);
    procedure SetStringField (Name: String; Value: String);
    procedure SetDateTimeField (Name: String; Value: TDateTime);
    procedure SetBooleanField (Name: String; Value: Boolean);
    procedure UpdateFields;
    procedure ExecuteSQL (SQL: String);
    procedure Setdds(const Value: TDataSOurce);
    procedure SetDBD(const Value: TDB);
    function NextObject (ObjectToLoad: TOObject;pList : TObject ): Boolean;override;
    function GetFloatField(Name: String): real;
    procedure SetFloatField(Name: String; Value: real);
    


  protected
    // Override this method if you want a different table name other than the
    // default (based on the class name, less any "DM" suffix);
    property dds : TDataSOurce read Fdds write Setdds;
    property DBD          : TDB read FDBD write SetDBD;
    function TableName: String; virtual;
       // These properties are provided for use in the methods below
    property IntegerField[Name: String]: Integer read GetIntegerField write SetIntegerField;
    property StringField[Name: String]: String read GetStringField write SetStringField;
    property DateTimeField[Name: String]: TDateTime read GetDateTimeField write SetDateTimeField;
    property BooleanField[Name: String]: Boolean read GetBooleanField write SetBooleanField;
    property FLoatField [Name: String]: real read GetFLoatField write SetFloatField;

    // All descendant classes must override these methods and use the
    // IntegerField, StringField etc properties to update the object and database
    procedure PopulateObject (PDObject: TOObject); virtual; abstract;
    procedure PopulateFields (PDObject: TOObject); virtual; abstract;
   // function GetObjectProperties( PDObject: TOObject) : TStringList;override;

    // This is the standard "contract" that our DMObject must provide.
    // TDad does not implement the SaveObject method. Therefore, all
    // class-specific descendants must implement this appropriately by constructing
    // the appropriate SQL text and calling ExecuteSQL. They must detect whether the
    // instance is a new one, and if so, allocate a new ID appropriately.
    {carrega uma instancia - chamado pelmétodo LOAD}
    procedure LoadObject (ObjectToLoad: TOObject); override;
     {retorna lista de objetos com object.chave = pId}
    function GetObjects(PDObject: TOObject;pId : integer): TStringList;override;
     {deletea lista de objetos com object.chave = pId}
    procedure DeleteObjects(PDObject: TOObject;pId : integer);override;
     {inclui (se não existe) ou atualiza objeto}
    procedure SaveObject (ObjectToSave: TOObject); override;
     {deleta objeto com object.chave = pId}
    procedure DeleteObject (ObjectToDelete: TOObject); override;
     {retorna todos os objetos da tabela}
    function GetAllObjects (PDObject: TOObject) : TStringList; override;
      {retorna todos os objetos da tabela alignGrid}
    function GetAllObjectsGrid(PDObject: TOObject;pWhereField,pSortField : string): TStringAlignGrid; override;
     {retorna todos os objetos da tabela com pFIeld = pFK}
    function GetAllDetailsGrid(PDObject: TOObject;pField : string;pFK : integer ): TStringAlignGrid; override;
     {retorna o maior ID do objeto}
    function GetMaxkey (PDObject: TOObject) : integer; override;
      {popula o combobox do Objeto}
    function PopulaComboObject (PDObject: TOObject; pCombo : TComboBox) :TStringList; override;
    { retorna detalhes do pai (Chave estrangeira) pField atributo estrangeiro;pFk : valor pField}
    function  GetObjectsFK(PDObject: TOObject;pField : string;pFK : integer ): TStringList;override;
    { retorna dados pField ;pFk : valor pField}
    function  GetObjectsSpec(PDObject: TOObject;pField : string;pFK : string ): TStringList;override;
  public
    //novo
     Fields: TStringList  ;
  
    
    //novo
    // This constructor creates the DMObject for standard load/save operations
    constructor Create; overload;
    // This constructor creates the DMObject for list operations, using the supplied query
    constructor Create (SQLQuery: String); overload;
    destructor Destroy; override;
    {retrona o menor valor de um campo}
    procedure GetMinField(pField: string; PDobject: TOObject);

  //  procedure Initialise;
  end;



implementation

uses
  SysUtils;

var
  // The database connection we will use
  Database: TDatabase;
  iRow,iCol : integer;
constructor TDad.Create;
begin
  inherited;
  Fields := TStringList.Create;
  Query := TADOQuery.Create (nil);
  Dbd := DBatu;
  dDs := TDatasource.Create(nil);
  dds.DataSet :=  query ;
  query.Connection := (dbd.DbTipo as TAdoConnection);

 // Query.DatabaseName := Database.DatabaseName;
end;

constructor TDad.Create (SQLQuery: String);
begin
  Create;
  ExecuteSQL (SQLQuery);
end;

destructor TDad.Destroy;
begin
  Query.Free;
  Fields.Free;
  inherited;
end;


function TDad.GetMaxkey(PDObject: TOObject) : integer;
begin
  // Initialise our ID allocator with the maximum ID on file
  ExecuteSQL ('SELECT MAX('+PDObject.CHAVE+') AS MAXID FROM ' + TableName);
  result := Query.FieldByName ('MAXID').AsInteger + 1;
  Query.Close;
end;

procedure Tdad.GetMinField(pField : string;PDobject : TOObject) ;
begin
   inherited; 
   Create ('SELECT * FROM SALDOS  WHERE '+pField + '= (SELECT MIN('+pField+') FROM SALDOS)');
   updateFields;
   PopulateObject (PDObject);
end;

function TDad.TableName: String;

begin
  Result := Copy (ClassName, 2, Length (ClassName) - 1);
  if Copy (Result, Length (Result) - 1, 2) = 'DM'  then
     Result := Copy (Result, 1, Length (Result) - 2) ;
end;

function Tdad.PopulaComboObject (PDObject: TOObject; pCombo : TComboBox) :TStringList;
begin
    GetAllObjects(PDObject);
end;

function TDad.GetIntegerField (Name: String): Integer;
begin
  Result := StrToIntDef (Fields.Values[Name], 0);
end;

function TDad.GetFloatField (Name: String): real;
begin
  decimalseparator := ',';
  If Fields.Values[Name] = '' then
     result := 0
  else
     Result := strtofloat (Fields.Values[Name]);
  decimalseparator := ',';
end;

function TDad.GetStringField (Name: String): String;
begin
  Result := Fields.Values[Name];
end;

function TDad.GetDateTimeField (Name: String): TDateTime;
begin
  try
    If Fields.Values[Name] <> '' then
       Result := strtodate(Fields.Values[Name])
    else
       result := 0.00;
  except

  end;
end;

function TDad.GetBooleanField (Name: String): Boolean;
begin
  Result := (Fields.Values[Name] = 'True');
end;

{function TDad.GetObjectProperties( PDObject: TOObject) : TstringList;
begin
  Result := fields;
end; }

procedure TDad.SetIntegerField (Name: String; Value: Integer);
begin
  Fields.Values[Name] := IntToStr (Value);
end;

procedure TDad.SetFloatField (Name: String; Value: real);
begin
 decimalseparator := '.';
  Fields.Values[Name] := FloatToStr (Value);
  decimalseparator := ',';
end;

procedure TDad.SetStringField (Name: String; Value: String);
begin
  Fields.Values[Name] := '''' + Value + '''';
end;

procedure TDad.SetDateTimeField (Name: String; Value: TDateTime);
begin
  decimalseparator := '.';
  Fields.Values[Name] := formatfloat('0.00',Value) ;
//  decimalseparator := ',';
end;

procedure TDad.SetBooleanField (Name: String; Value: Boolean);
begin
  if Value then begin
    Fields.Values[Name] := 'True';
  end else begin
    Fields.Values[Name] := 'False';
  end;
end;

procedure TDad.UpdateFields;
var
  Index: Integer;
begin
  Fields.Clear;
  for Index := 0 to Query.FieldCount - 1 do
  begin
    Fields.Values[Query.Fields[Index].FieldName] := Query.Fields[Index].AsString;

  end;

end;

procedure TDad.ExecuteSQL (SQL: String);
begin
  DECIMALSEPARATOR := '.';
  Query.SQL.Clear;
  Query.SQL.Add (SQL);
 // showmessage(sql);
  if UpperCase (Copy (Trim (SQL), 1, 6)) = 'SELECT' then begin
    // Hold query open
    Query.Open;
  end
  else
  begin
    // Just bang off the query to the database
    Query.ExecSQL;

  end;
  DECIMALSEPARATOR := ',';
end;

procedure TDad.LoadObject (ObjectToLoad: TOObject);
begin
  ExecuteSQL ('SELECT * FROM ' + TableName + ' WHERE '+ObjectToLoad.CHAVE+ ' =' + IDToStr (ObjectToLoad.ID));
  SetObjectID (ObjectToLoad, Query.FieldByName (ObjectToLoad.CHAVE).AsInteger);
  UpdateFields;
  PopulateObject (ObjectToLoad);
  Query.Close;
end;

function Tdad.GetAllObjects(PDObject: TOObject) :TStringList;
var
 ptest : boolean;
 pList : TStringList;
 NewOObject : TPK;
 begin
  ptest := true;
  pList := TStringList.create;
  ExecuteSQL ('SELECT * FROM ' + TableName) ;
  while ptest do
    ptest := nextOBject(PDObject,pList);
  result := pList;
 end;

function TDad.GetAllDetailsGrid(PDObject: TOObject;pField : sTring;pFK : integer ): TStringAlignGrid;
var
ptest : boolean  ;
pList : TStringAlignGrid;
  Begin
    pList := PDObject.ListaGrid;
    ptest := true;
   // showmessage(pdobject.ClassName);
    ExecuteSQL ('SELECT * FROM ' + TableName + ' WHERE '+pField+ ' =' + inttostr(pFK));
    iCol := (pList as TStringAlignGrid).FixedCols ;
    iRow := (pList as TStringAlignGrid).FixedRows;
    If iRow > 0 then
      iRow := iRow - 1;
    while ptest do
      ptest := nextOBject(PDObject,pList);
    result := pList
  end;

function TDad.GetAllObjectsGrid(PDObject: TOObject;pWhereField,pSortField : string): TStringAlignGrid;
var
ptest : boolean  ;
pList : TStringAlignGrid;
i : integer;
wwhere : string;
  Begin
    pList := PDObject.ListaGrid;
    ptest := true;
     wwhere := '';
    If pWhereField <> '' then
      wwhere := ' WHERE '+pWhereField  ;
    If psortField <> '' then
       ExecuteSQL ('SELECT * FROM ' + TableName +wwhere+' ORDER BY '+''+pSortField+'')
    else
       ExecuteSQL ('SELECT * FROM ' + TableName+wwhere) ;

    iCol := (pList as TStringAlignGrid).FixedCols ;
    iRow := (pList as TStringAlignGrid).FixedRows;
    If iRow > 0 then
      iRow := iRow - 1;
    while ptest do
      ptest := nextOBject(PDObject,pList);
    result := pList
  end;

function TDad.GetOBjectsFK(PDObject: TOObject;pField : string;pFK : integer ): TStringList;
var
ptest : boolean  ;
pList : TStringList;
  Begin
    pList := TStringList.create;
    ptest := true;
   // showmessage(pdobject.ClassName);
    ExecuteSQL ('SELECT * FROM ' + TableName + ' WHERE '+pField+ ' = ' +inttostr(pFK));
    while ptest do
      ptest := nextOBject(PDObject,pList);
    result := pList  ;
  end;

 function TDad.GetOBjectsSpec(PDObject: TOObject;pField : string;pFK : string ): TStringList;
var
ptest : boolean  ;
pList : TStringList;
  Begin
    pList := TStringList.create;
    ptest := true;
   // showmessage(pdobject.ClassName);
    ExecuteSQL ('SELECT * FROM ' + TableName + ' WHERE '+pField+ ' = ' +''''+pFK+'''');
    while ptest do
      ptest := nextOBject(PDObject,pList);
    result := pList  ;
  end;

function Tdad.GetObjects(PDObject: TOObject;pId : integer) :TStringList;
var
 ptest : boolean;
 pList : TStringList;
 NewOObject : TPK;
 begin
  ptest := true;
  pList := TStringList.create;
  ExecuteSQL ('SELECT * FROM ' + TableName + ' WHERE '+PDObject.CHAVE+ ' = ' + Inttostr(pId));
  while ptest do
    ptest := nextOBject(PDObject,pList);
  result := pList;
 end;

procedure Tdad.DeleteObjects(PDObject: TOObject;pId : integer);
 begin
  ExecuteSQL ('DELETE * FROM ' + TableName + ' WHERE '+PDObject.CHAVE+ ' =' + Inttostr(pId)); 
 end;


procedure TDad.SaveObject (ObjectToSave: TOObject);
var
  Qry: String;
  Index: Integer;
begin
  Fields.Clear;
  //novo
  If ObjectToSave.oFields.Count > 0 then
     fields := Objecttosave.oFields
  else
     PopulateFields (ObjectToSave);
  
  if ObjectToSave.ID <> 0 then
   begin
    // Build up "UPDATE" SQL Text
    Qry := 'UPDATE ' + TableName + ' SET ';
    If  Fields.Count = 0 then
      exit
    else
     Begin
        for Index := 0 to Fields.Count - 1 do
          begin
            Qry := Qry + Fields[Index];
            if Index <> Fields.Count - 1 then
              Qry := Qry + ',';
          end;
          Qry := Qry + ' WHERE '+ObjectToSave.Chave+' =' + IDToStr (ObjectToSave.ID);
     end;

   
  end
  else
  begin
    // Assign unique ID
    //SetObjectID (ObjectToSave, IDAllocator.NextID);

    // Build up "INSERT" SQL Text
    Qry := 'INSERT INTO ' + TableName + ' (';
    for Index := 0 to Fields.Count - 1 do begin
       Begin
         If Index = 0 then
            Qry := Qry + Fields.Names[Index]
         else
           Qry := Qry + ',' + Fields.Names[Index];
       end;

    end;
    Qry := Qry + ') VALUES (' ;

    for Index := 0 to Fields.Count - 1 do begin
       Begin
        If Fields.Names[Index] = ObjectToSave.CHAVE then
          Begin
            ObjectToSave.ID := GetMaxkey(ObjectTosave);
            Fields.Values[Fields.Names[Index]] := inttostr(ObjectToSave.ID );
            
           // Qry := Qry +  Fields.Values[Fields.Names[Index]];
          end;
        If Index = 0 then
           Qry := Qry +  Fields.Values[Fields.Names[Index]]
        else
           Qry := Qry + ',' + Fields.Values[Fields.Names[Index]];
       end;


    end;
    Qry := Qry + ')';
  end;
  ExecuteSQL (Qry);
 // PopulateObject(ObjectTosave); //verificar se ok (retorna o objeto de negocio atualizado, especialmene com a PK criada
end;

procedure TDad.DeleteObject (ObjectToDelete: TOObject);
begin
  ExecuteSQL ('DELETE FROM ' + TableName + ' WHERE '+ObjectToDelete.CHAVE+ ' = ' + IDToStr (ObjectToDelete.ID));
end;


function TDad.NextObject (ObjectToLoad: TOObject;pList : TObject ): Boolean;
var
 NewOObject : TPK;
 m,n : integer;
begin
  If Query.EOF then
  begin
    Query.Close;
    Result := False;
  end
  else
  begin
    If pList <> nil then
      Begin
        If pList is TStringList then
          Begin
            NewOObject     := TPK.Create;
            NewOObject.PK1 := Query.FieldByName(ObjectToLoad.CHAVE).ASSTRING;//
            (pList as TStringList).AddObject(Query.FieldByName(ObjectToLoad.AtributoLista).ASSTRING,NewOObject);
          end
        else
        If pList is TStringAlignGrid then
           Begin
             inc(iRow);
             If iRow > (pList as TStringAlignGrid).RowCount - (pList as TStringAlignGrid).FixedRows then
               (pList as TStringAlignGrid).RowCount  := (pList as TStringAlignGrid).RowCount+1;
             for m := 0 to (pList as TStringAlignGrid).colcount -1 do  //monta o grid a aprtir dos campos definidos no objeto do grid (monta_cab)
                (pList as TStringAlignGrid).Cells[m,iRow] := query.fieldbyname(((pList as TStringAlignGrid).Objects[m,0] as TProp).nomecampo).AsString;

             ObjectToLoad.PK     := Tpk.create;
             ObjectToLoad.PK.PK1 := query.fieldbyname(ObjectToLoad.CHAVE).Value;
             (pList as TStringAlignGrid).Objects[ 0,iRow] := ObjectToLoad.PK;  //chave primária dA LINHA
             (pList as TStringAlignGrid).Objects[1,iRow] := Tprop.create;
             ((pList as TStringAlignGrid).Objects[1,iRow] as Tprop).Status := 'N';

           end;
      end;

    UpdateFields;
    PopulateObject (ObjectToLoad);
    Query.Next;
    Result := True;
  end;
end;

// Unit methods


procedure TDad.Setdds(const Value: TDataSOurce);
begin
  Fdds := Value;
end;

procedure TDad.SetDBD(const Value: TDB);
begin
  FDBD := Value;
end;



end.

