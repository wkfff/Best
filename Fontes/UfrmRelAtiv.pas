unit UfrmRelAtiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLXLSFilter, RLFilters, RLPDFFilter, RLRichText;

type
  TfrmRelAtiv = class(TForm)
    rlrAtiv: TRLReport;
    rlbTopPag: TRLBand;
    rlbAtividade: TRLBand;
    rlbRodape: TRLBand;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBRichText1: TRLDBRichText;
    procedure rlrAtivBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlrAtivAfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAtiv: TfrmRelAtiv;

implementation

{$R *.dfm}

procedure TfrmRelAtiv.rlrAtivBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
//teste
end;

procedure TfrmRelAtiv.rlrAtivAfterPrint(Sender: TObject);
begin
//teste2
end;

end.
