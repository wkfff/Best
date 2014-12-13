unit bst_ValidaBEST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ExtCtrls, Buttons,bstdb, DB, ADODB, Mask,
  DBCtrls;

type
  TValidaBEST = class(TForm)
    Image1: TImage;
    eNumeroGerado: TEdit;
    eChave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnValidar: TSpeedButton;
    sbSaida: TSpeedButton;
    Label3: TLabel;
    eNomeMaquina: TEdit;
    procedure sbSaidaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
  private
    { Private declarations }
    procedure geraNumeroLocal(serialRecebido: String);
  public
    { Public declarations }
  end;

var
  ValidaBEST: TValidaBEST;

implementation

uses fonctions, UProcEFunc;

{$R *.dfm}

procedure TValidaBEST.sbSaidaClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TValidaBEST.geraNumeroLocal(serialRecebido: String);
const
  Raiz : String = 'Software\Best72\viaLactea';
var
  iQtdCaractere, i, usuario, modelo, visao, modeloAux, visaoAux : Integer;
  ano, mes, dia : Word;
  aux, data, maquina, anoAux, mesAux, diaAux, dataRegistro, vDemo: String;
  dataFinal : TDateTime;

  RegLicenca : TRegistry;

  aquila    : String;     // Máquina
  crater    : String;     // Data da validade para o caso de aluguel
  fornax    : String;     // Quantidade de Licença Modeler
  lupus     : String;     // Quantidade de Licença Viewer
  serpens   : String;     // Modalidade da Venda

begin
  iQtdCaractere := Length(serialRecebido);
  aux := '';
  for i := 2 to iQtdCaractere do
  begin
    if Copy(serialRecebido,i,1) = 'M' then
    begin
      usuario := StrToInt(aux);
      aux := '';
      Continue;
    end;

    if Copy(serialRecebido,i,1) = 'R' then
      Continue;
    if Copy(serialRecebido,i,1) = 'S' then
    begin
      maquina := aux;
      aux := '';
      Continue;
    end;

    if Copy(serialRecebido,i,1) = 'Y' then
    begin
      AnoAux := aux;
      aux := '';
      Continue;
    end;

    if Copy(serialRecebido,i,1) = 'U' then
    begin
      MesAux := aux;
      aux := '';
      Continue;
    end;

    if Copy(serialRecebido,i,1) = 'O' then
    begin
      DiaAux := aux;
      aux := '';
      Continue;
    end;

    if (Copy(serialRecebido,i,1) = 'L') then
    begin
      vDemo := 'L';
      aux := '';
      Continue;
    end;

    if (Copy(serialRecebido,i,1) = 'P')  or (Copy(serialRecebido,i,1) = 'W') then
    begin
      if (Copy(serialRecebido,i,1) = 'W') then
        vDemo := 'S';

      modeloAux := StrToInt(aux);
      modelo := (modeloAux - usuario) div 7;
      aux := '';
      Continue;
    end;

    aux := aux + Copy(serialRecebido,i,1);
  end;
  visaoAux := StrToInt(aux);
  visao := (visaoAux - usuario) div 7;

  if (anoAux<>'00') and (mesAux<>'00') and (diaAux<>'00') then
  begin
    ano := (StrToInt(anoAux) - usuario) div 5;
    mes := (StrToInt(mesAux) - usuario) div 5;
    if mes = 0 then
      mes := 1;
    dia := (StrToInt(diaAux) - usuario) div 5;
    dataFinal := EncodeDate(ano,mes,dia);
    dataRegistro := DateToStr(dataFinal);
  end
  else
    dataRegistro := 'NAluguel';

  // Cria os locais no Registry
  RegLicenca := TRegistry.Create;
  RegLicenca.RootKey := HKEY_CURRENT_USER;
  RegLicenca.OpenKey(Raiz, true);
  RegLicenca.WriteString('aquila',Encripta(maquina,'Best72'));
  RegLicenca.WriteString('crater',Encripta(dataRegistro,'Best72'));
  RegLicenca.WriteString('fornax',Encripta(IntToStr(modelo),'Best72'));
  RegLicenca.WriteString('lupus',Encripta(IntToStr(visao),'Best72'));
  if dataRegistro = 'NAluguel' then
    RegLicenca.WriteString('serpens',Encripta('V','Best72'));
  if vDemo = 'S' then
    RegLicenca.WriteString('serpens',Encripta('D','Best72'));
  if vDemo = 'L' then
    RegLicenca.WriteString('aquila',Encripta('Livre','Best72'));
  RegLicenca.CloseKey;
  RegLicenca.Free;
end;

procedure TValidaBEST.FormShow(Sender: TObject);
const
  Raiz : String = 'Software\Best72\viaLactea';
var
  RegLicenca : TRegistry;

  aquila    : String;     // Máquina
  crater    : String;     // Data da validade para o caso de aluguel
  fornax    : String;     // Quantidade de Licença Modeler
  lupus     : String;     // Quantidade de Licença Viewer
  serpens   : String;     // Modalidade da Venda

  dia, mes, ano: word;
begin
  // Cria os locais no Registry
  RegLicenca := TRegistry.Create;
  RegLicenca.RootKey := HKEY_CURRENT_USER;
  RegLicenca.OpenKey(Raiz, true);
  RegLicenca.WriteString('aquila','Best7x');
  RegLicenca.WriteString('crater','Best7x');
  RegLicenca.WriteString('fornax','Best7x');
  RegLicenca.WriteString('lupus','Best7x');
  RegLicenca.WriteString('serpens','Best7x');

  RegLicenca.CloseKey;
  RegLicenca.Free;

  DecodeDate(now,ano,mes,dia);
  eNumeroGerado.Text :=  SerialDiscoHexa+'P'+IntToStr(ano)+IntToStr(mes)+IntToStr(dia);
  eNomeMaquina.Text := nomeComputador;
end;

procedure TValidaBEST.btnValidarClick(Sender: TObject);
begin
  if Length(eChave.Text) = 0 then
    Application.Terminate;
  geraNumeroLocal(eChave.Text);
  close;
end;

end.
