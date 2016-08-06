unit bst_ExecutaQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, bstdb, Grids, DBGrids;

type
  Tfrm_ExecutaQuery = class(TForm)
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    procedure ExecutaQuery(CLI_ID: integer;PRJ_ID:integer;PAI_TIPO:string;PAI_ID:integer;FILHO_TIPO:string;FILHO_ID:integer;ATOR_CATEGORIA:string;PERC_CUSTO:integer;PERC_CODIGO:integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExecutaQuery: Tfrm_ExecutaQuery;

implementation

uses bst_main;

{$R *.dfm}

Procedure Tfrm_ExecutaQuery.ExecutaQuery(CLI_ID: integer;PRJ_ID:integer;PAI_TIPO:string;PAI_ID:integer;FILHO_TIPO:string;FILHO_ID:integer;ATOR_CATEGORIA:string;PERC_CUSTO:integer;PERC_CODIGO:integer);
Begin
  ADOTable1.Insert;
  ADOTable1.FieldByName('CLI_ID').AsInteger := CLI_ID;
  ADOTable1.FieldByName('PRJ_ID').AsInteger := PRJ_ID;
  ADOTable1.FieldByName('PAI_TIPO').AsString := PAI_TIPO;
  ADOTable1.FieldByName('PAI_ID').AsInteger := PAI_ID;
  ADOTable1.FieldByName('FILHO_TIPO').AsString := FILHO_TIPO;
  ADOTable1.FieldByName('FILHO_ID').AsInteger := FILHO_ID;
  ADOTable1.FieldByName('ATOR_CATEGORIA').AsString := ATOR_CATEGORIA;
  ADOTable1.FieldByName('PERC_CUSTO').AsInteger := PERC_CUSTO;
  ADOTable1.FieldByName('PERC_CODIGO').AsInteger := PERC_CODIGO;
  ADOTable1.Post;
  ADOTable1.Close;
End;

procedure Tfrm_ExecutaQuery.FormShow(Sender: TObject);
var componentes :integer;
begin
  ADOTable1.ConnectionString := BDx.ConnectionString;
  ADOTable1.TableName := 'COR_OBJETOS';
  ADOTable1.Active := True;
end;

end.
