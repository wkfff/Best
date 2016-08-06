unit ExportaExcel;

interface

uses
  SysUtils, Classes, DB, ADODB, BSTDB;

type
  TDMExportacaoExcel = class(TDataModule)
    ADOExportTeste: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExportacaoExcel: TDMExportacaoExcel;

implementation

{$R *.dfm}

end.
