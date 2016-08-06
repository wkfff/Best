program LiberaLicenca;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {frmLibera};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Liberação de Licença';
  Application.CreateForm(TfrmLibera, frmLibera);
  Application.Run;
end.
