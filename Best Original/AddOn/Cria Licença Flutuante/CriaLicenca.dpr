program CriaLicenca;

uses
  Forms,
  ULicenca in 'ULicenca.pas' {fQtdLicenca};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerador de Serial/Licenças';
  Application.CreateForm(TfQtdLicenca, fQtdLicenca);
  Application.Run;
end.
