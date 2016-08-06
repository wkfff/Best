unit bst_unit;

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

{FIM SET VALUES}

end.
