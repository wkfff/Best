unit data_tier;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,Provider,DBClient,
  ADODb,dbTables,math,strUtils,DB,db_tier,basetier,fonctions;

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

{Classe Ttempresas}
TTempresas=Class(Tdad)
     private
      FFANTASIA                       : string ;
      FEMPRESA                        : string ;
      FCGC                            : string ;
      FINSCR                          : string ;
      FCARGO                          : string ;
      FENDER                          : string ;
      FESTADO                         : string ;
      FCIDAD                          : string ;
      FCEP                            : string ;
      FREGIAO                         : string ;
      FPAIS                           : string ;
      FTELEF                          : string ;
      FTELEF1                         : string ;
      FFAX                            : string ;
      FE_MAIL                         : string ;
      FATIV                           : string ;
      FCOMMENT                        : string ;
      FDATA                           : real ;
      FTIPO                           : string ;
      FSITE                           : string ;
      procedure SetFANTASIA(const value   : string );
      procedure SetEMPRESA(const value   : string );
      procedure SetCGC(const value   : string );
      procedure SetINSCR(const value   : string );
      procedure SetCARGO(const value   : string );
      procedure SetENDER(const value   : string );
      procedure SetESTADO(const value   : string );
      procedure SetCIDAD(const value   : string );
      procedure SetCEP(const value   : string );
      procedure SetREGIAO(const value   : string );
      procedure SetPAIS(const value   : string );
      procedure SetTELEF(const value   : string );
      procedure SetTELEF1(const value   : string );
      procedure SetFAX(const value   : string );
      procedure SetE_MAIL(const value   : string );
      procedure SetATIV(const value   : string );
      procedure SetCOMMENT(const value   : string );
      procedure SetDATA(const value   : real );
      procedure SetTIPO(const value   : string );
      procedure SetSITE(const value   : string );
      procedure ddmap_empresa(dataset : TdataSet);

  published
   property FANTASIA                      : string             read FFANTASIA write SetFANTASIA;
   property EMPRESA                       : string             read FEMPRESA write SetEMPRESA;
   property CGC                           : string             read FCGC write SetCGC;
   property INSCR                         : string             read FINSCR write SetINSCR;
   property ENDER                         : string             read FENDER write SetENDER;
   property ESTADO                        : string             read FESTADO write SetESTADO;
   property CIDAD                         : string             read FCIDAD write SetCIDAD;
   property CEP                           : string             read FCEP write SetCEP;
   property PAIS                          : string             read FPAIS write SetPAIS;
   property TELEF                         : string             read FTELEF write SetTELEF;
   property TELEF1                        : string             read FTELEF1 write SetTELEF1;
   property FAX                           : string             read FFAX write SetFAX;
   property E_MAIL                        : string             read FE_MAIL write SetE_MAIL;
   property ATIV                          : string             read FATIV write SetATIV;
   property COMMENT                       : string             read FCOMMENT write SetCOMMENT;
   property DATA                          : real               read FDATA write SetDATA;
   property TIPO                          : string             read FTIPO write SetTIPO;
   property SITE                          : string             read FSITE write SetSITE;

{ inclui 1 registro}
 {  Atualiza 1 registro (Chave Primária)}
  function SaveObject(PDObject: TOObject): TObjectID ;override;

   { Deleta 1 registro (Chave Primária)}
  procedure Deleteobject(PDObject: TOObject);override;

   { retorna Objeto específico}
  procedure LoadObject (PDObject: TOObject); override;

  { retorna todos os registros}
  function GetAllObjects(PDObject: TOObject) : TStringList;override;

  { retorna maior código}
  function Get_MaxKey() : integer;


  public
   constructor create(sender : TClass);

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
  {  DS         := TDataSource.create(application);
    DS.DataSet := self;    }
   end;

Constructor TQuer.create(pds : TdataSource);   //query   normal
   begin
    inherited create(application);
   { DS         := TDataSource.create(application);
    DS.DataSet := self;   }
   end;

{Ttempresas Métodos}

constructor TTEmpresas.create(sender : TClass);
  begin
   // inherited create(TADOConnection);
    DBD := DBATU;
  end;


  procedure Ttempresas.ddmap_empresa(dataset : Tdataset);
  begin
      FANTASIA                  := DataSet.fieldbyname('FANTASIA').asstring;
      EMPRESA                   := DataSet.fieldbyname('EMPRESA').asstring;
      CGC                       := DataSet.fieldbyname('CGC').asstring;
      INSCR                     := DataSet.fieldbyname('INSCR').asstring;
      ENDER                     := DataSet.fieldbyname('ENDER').asstring;
      ESTADO                    := DataSet.fieldbyname('ESTADO').asstring;
      CIDAD                     := DataSet.fieldbyname('CIDAD').asstring;
      CEP                       := DataSet.fieldbyname('CEP').asstring;
      PAIS                      := DataSet.fieldbyname('PAIS').asstring;
      TELEF                     := DataSet.fieldbyname('TELEF').asstring;
      TELEF1                    := DataSet.fieldbyname('TELEF1').asstring;
      FAX                       := DataSet.fieldbyname('FAX').asstring;
      E_MAIL                    := DataSet.fieldbyname('E_MAIL').asstring;
      ATIV                      := DataSet.fieldbyname('ATIV').asstring;
      COMMENT                   := DataSet.fieldbyname('COMMENT').asstring;
      DATA                      := DataSet.fieldbyname('DATAT').asfloat;
      TIPO                      := DataSet.fieldbyname('TIPO').asstring;
      SITE                      := DataSet.fieldbyname('SITE').asstring;
  end;


function Ttempresas.SaveObject(PDObject: TOObject): TObjectID ;
VAR
Wkey : integer;
oObj : Ttempresas;
begin
 PDOBJECT.resulta := 'Operação Não concluida!';
  with TQuerAdo.create(nil) do
     begin
      // dDs := DS;
       Connection  := (dbd.DbTipo as TAdoConnection);
       AfterScroll := nil;
       DecimalSeparator := '.';
       close;
       sql.clear;
       sql.text := 'SELECT * FROM EMPRESAS'+
       ' WHERE FANTASIA = '+AnsiQuotedStr(FANTASIA,chr(39))  ;
        open;

       If eof  then        // não existe = inclui
         begin

          sql.text := 'INSERT INTO EMPRESAS('+
          'FANTASIA,'+
          'EMPRESA,'+
          'CGC,'+
          'INSCR,'+
          'ENDER,'+
          'ESTADO,'+
          'CIDAD,'+
          'CEP,'+
          'PAIS,'+
          'TELEF,'+
          'TELEF1,'+
          'FAX,'+
          'E_MAIL,'+
          'ATIV,'+
          'COMMENT,'+
          'DATAT,'+
          'TIPO,'+
          'SITE)'+
          'VALUES ('+

          AnsiQuotedStr(FANTASIA,chr(39))+','+
          AnsiQuotedStr(EMPRESA,chr(39))+','+
          AnsiQuotedStr(CGC,chr(39))+','+
          AnsiQuotedStr(INSCR,chr(39))+','+
          AnsiQuotedStr(ENDER,chr(39))+','+
          AnsiQuotedStr(ESTADO,chr(39))+','+
          AnsiQuotedStr(CIDAD,chr(39))+','+
          AnsiQuotedStr(CEP,chr(39))+','+
          AnsiQuotedStr(PAIS,chr(39))+','+
          AnsiQuotedStr(TELEF,chr(39))+','+
          AnsiQuotedStr(TELEF1,chr(39))+','+
          AnsiQuotedStr(FAX,chr(39))+','+
          AnsiQuotedStr(E_MAIL,chr(39))+','+
          AnsiQuotedStr(ATIV,chr(39))+','+
          AnsiQuotedStr(COMMENT,chr(39))+','+
          AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATA),chr(39))+','+
          AnsiQuotedStr(TIPO,chr(39))+','+
          AnsiQuotedStr(SITE,chr(39))+
          ' )';
           execsql;
          If Rowsaffected > 0 then
            PDObject.resulta := 'Incluido!';
          end
       else
        begin
         close;
         sql.clear;
         sql.text := 'UPDATE EMPRESAS '+
         'SET '+
         'EMPRESA = '+AnsiQuotedStr(EMPRESA,chr(39))+','+
         'CGC = '+AnsiQuotedStr(CGC,chr(39))+','+
         'INSCR = '+AnsiQuotedStr(INSCR,chr(39))+','+
         'ENDER = '+AnsiQuotedStr(ENDER,chr(39))+','+
         'ESTADO = '+AnsiQuotedStr(ESTADO,chr(39))+','+
         'CIDAD = '+AnsiQuotedStr(CIDAD,chr(39))+','+
         'CEP = '+AnsiQuotedStr(CEP,chr(39))+','+
         'PAIS = '+AnsiQuotedStr(PAIS,chr(39))+','+
         'TELEF = '+AnsiQuotedStr(TELEF,chr(39))+','+
         'TELEF1 = '+AnsiQuotedStr(TELEF1,chr(39))+','+
         'FAX = '+AnsiQuotedStr(FAX,chr(39))+','+
         'E_MAIL = '+AnsiQuotedStr(E_MAIL,chr(39))+','+
         'ATIV = '+AnsiQuotedStr(ATIV,chr(39))+','+
         'COMMENT = '+AnsiQuotedStr(COMMENT,chr(39))+','+
         'DATAT = '+AnsiQuotedStr(FormatDateTime('YYYY/MM/DD',DATA),chr(39))+','+
         'TIPO = '+AnsiQuotedStr(TIPO,chr(39))+','+
         'SITE = '+AnsiQuotedStr(TIPO,chr(39))+
        ' WHERE FANTASIA = '+AnsiQuotedStr(FANTASIA,chr(39)) ;
        execsql;
         If Rowsaffected > 0 then
            PDObject.resulta := 'Atuáliszado!';
        end;

      

       DecimalSeparator := ',';
     end;
end;


procedure Ttempresas.DeleteObject (PDObject: TOObject);
 begin
   with TQuerAdo.create(nil) do
     begin
        dDs := DS;
        Connection  := (dbd.DbTipo as TAdoConnection);
        DecimalSeparator := '.';
        close;
        sql.clear;
        sql.text := 'DELETE FROM EMPRESAS'+
      ' WHERE FANTASIA = '+AnsiQuotedStr(FANTASIA,chr(39)) ;
        execsql;
        If Rowsaffected > 0 then
            PDObject.resulta := 'Excluido!!';

        DecimalSeparator := ',';
   end;
end;


procedure Ttempresas.LoadObject (PDObject: TOObject);
var
iEmp : TQuerAdo;
 begin
   iEmp := TQuerAdo.create(nil);
   with iEmp do
     begin
       dDs := DS;
       Connection  := (dbd.DbTipo as TAdoConnection);

        close;
        sql.clear;
        sql.text := 'SELECT * FROM EMPRESAS'+
       ' WHERE FANTASIA = '+AnsiQuotedStr(PDobject.ID,chr(39))  ;

        open;
        If not Eof then
           begin
            ddMap_empresa(iEmp);
           
           end;
     end;
end;


function Ttempresas.Get_MaxKey () : integer;
 begin
   with TQuerAdo.create(nil) do
     begin
       dDs := DS;
       Connection  := (dbd.DbTipo as TAdoConnection);
        result := 0;
        close;
        sql.clear;
        sql.text := 'SELECT FANTASIA AS MAXK FROM EMPRESAS'+
      'WHERE FANTASIA = (SELECT MAX(FANTASIA) FROM EMPRESAS'
      +')'
      ;

        open;
        If not eof  then
          Result := fieldbyName('MAXK').asinteger;
   end;
end;


function Ttempresas.GetAllObjects(PDObject: TOObject) :TStringList;
var
pList : TStringList;
mlst : uLst;
NewOObject : TPK;
 begin
  pList := TStringList.create;
   with TQuerAdo.create(nil) do
     begin
        dDs := DS;
        Connection  := (dbd.DbTipo as TAdoConnection);
        close;
        sql.clear;
        sql.text := 'SELECT * FROM EMPRESAS';
        open;
        If not Eof then
         begin
          while not eof do
           begin
             {new(mLst);
             mLst^.eObj    := fieldbyname('FANTASIA').asstring;
             pList.Add(mLst); }
             NewOObject     := TPK.Create;
             NewOObject.PK1 := fieldbyname('FANTASIA').Value;
             pList.AddObject(formataCampo(fieldbyname('FANTASIA').asstring,'B',22,'R'){+
             formataCampo(fieldbyname('EMPRESA').asstring,'B',60,'R')},TObject(NewOObject)) ;
             next;
           end;
           result := pList;
         end;
     end;
end;



{FIM METODOS}

{INICIO SET VALUES}

  {Set Value Ttempresas}

procedure Ttempresas.SetFANTASIA(const value   : string );
 begin
  FFANTASIA := value;
 end;

procedure Ttempresas.SetEMPRESA(const value   : string );
 begin
  FEMPRESA := value;
 end;

procedure Ttempresas.SetCGC(const value   : string );
 begin
  FCGC := value;
 end;

procedure Ttempresas.SetINSCR(const value   : string );
 begin
  FINSCR := value;
 end;

procedure Ttempresas.SetCARGO(const value   : string );
 begin
  FCARGO := value;
 end;

procedure Ttempresas.SetENDER(const value   : string );
 begin
  FENDER := value;
 end;

procedure Ttempresas.SetESTADO(const value   : string );
 begin
  FESTADO := value;
 end;

procedure Ttempresas.SetCIDAD(const value   : string );
 begin
  FCIDAD := value;
 end;

procedure Ttempresas.SetCEP(const value   : string );
 begin
  FCEP := value;
 end;

procedure Ttempresas.SetREGIAO(const value   : string );
 begin
  FREGIAO := value;
 end;

procedure Ttempresas.SetPAIS(const value   : string );
 begin
  FPAIS := value;
 end;

procedure Ttempresas.SetTELEF(const value   : string );
 begin
  FTELEF := value;
 end;

procedure Ttempresas.SetTELEF1(const value   : string );
 begin
  FTELEF1 := value;
 end;

procedure Ttempresas.SetFAX(const value   : string );
 begin
  FFAX := value;
 end;

procedure Ttempresas.SetE_MAIL(const value   : string );
 begin
  FE_MAIL := value;
 end;

procedure Ttempresas.SetATIV(const value   : string );
 begin
  FATIV := value;
 end;

procedure Ttempresas.SetCOMMENT(const value   : string );
 begin
  FCOMMENT := value;
 end;

procedure Ttempresas.SetDATA(const value   : real );
 begin
  FDATA := value;
 end;

procedure Ttempresas.SetTIPO(const value   : string );
 begin
  FTIPO := value;
 end;

procedure Ttempresas.SetSITE(const value   : string );
 begin
  FSITE := value;
 end;



{FIM SET VALUES}

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



end.
