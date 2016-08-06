unit qcc_enga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB;

type
  Tfrm_enga = class(TForm)
    tabelas: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_enga: Tfrm_enga;

implementation

{$R *.dfm}

procedure Tfrm_enga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frm_enga := nil;
 action := caFree;
end;

end.
