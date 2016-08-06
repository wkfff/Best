unit bst_unit;

interface
uses
Aligrid,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls,Provider,DBClient,
  ADODb,dbTables,math,strUtils,DB,db_tier,basetier;

type
  uLst = ^TLst;
  TLst = record
    eObj     : string;
end;

type

TDad = class(TDOBject)
  private
    FdDS: TDataSource;
    Fqry: Tobject;
    procedure SetdDS(const Value: TDataSource);
    procedure Setqry(const Value: Tobject);



 protected
   DBD          : TDB;
   TipoQuery    : TClass;
   dSql         : string;
   dTabela      : string;
   DBdad        : TClass;


 published
   property dDS : TDataSource read FdDS write SetdDS;
   property qry : Tobject  read Fqry write Setqry;

 public
   constructor create(sender : Tclass);

end;

{INICIO CLASSES}


{FIM CLASSES}


implementation


{INICIO METODOS}


Constructor Tdad.create(sender : TClass);
   begin
     Dbd := DBatu;
     dDs := TDatasource.Create(application);
     If dbd.DbTipo is TADoConnection then
        Begin
         dds.DataSet :=  (qry as TADoQuery) ;
         qry := TADoquery.create(application);
         (qry as TADoQuery).Connection := (dbd.DbTipo as TAdoConnection);
        end;
   end;





{FIM METODOS}

{INICIO SET VALUES}

procedure TDad.SetdDS(const Value: TDataSource);
begin
  FdDS := Value;
end;

procedure TDad.Setqry(const Value: Tobject);
begin
  Fqry := Value;
end;

{FIM SET VALUES}





end.
