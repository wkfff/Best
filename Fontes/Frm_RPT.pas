unit Frm_RPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrm_Relatorio = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Frm_Relatorio: TFrm_Relatorio;
  //bdx : TBd;

implementation

uses ExportaExcel;

{$R *.dfm}


procedure TFrm_Relatorio.Button1Click(Sender: TObject);
begin
  //ExportaExcel.DMExportacaoExcel.ADOExportTeste.Connection :=
end;

end.
