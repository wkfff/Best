unit ULicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Mask, Spin, ComCtrls;

type
  TfQtdLicenca = class(TForm)
    bGravarLicenca: TButton;
    Label1: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    eIdCliente: TEdit;
    eQuantDias: TEdit;
    bGeraSerial: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eSerial: TEdit;
    Label5: TLabel;
    seReader: TSpinEdit;
    eqtdLicenca: TSpinEdit;
    Label6: TLabel;
    meDataLimite: TDateTimePicker;
    procedure bGravarLicencaClick(Sender: TObject);
    procedure bGeraSerialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function geraSenha(idCliente: Integer; qtdDias: Integer; dataLimite: TDate;
             licencaServ: Integer; licencaReader: Integer): String;
    function DateDiff(Date1, Date2: TDate): Integer;
  public
    { Public declarations }
  end;

var
  fQtdLicenca: TfQtdLicenca;

implementation

{$R *.dfm}

procedure TfQtdLicenca.bGravarLicencaClick(Sender: TObject);
var i,c : byte;
    resp, Chave, Encripta, Texto : string;
begin
  ADOConnection1.Connected := True;
  ADOTable1.Open;

  Chave := 'Best71';
  Encripta := eIdCliente.Text;
  Texto := IntToStr(eqtdLicenca.Value);

  if chave = '' then
    begin
      Encripta:=Texto;
      exit;
    end;
  resp:=Texto;
  if texto = '' then
    for i:=1 to length(chave) do resp:=resp+' ';
  i:=0;
  c:=0;
  repeat
    if c < length(chave) then c:=c+1 else c:=1;
    i:=i+1;
    if (i mod 2 = 0 )
    then resp[i]:=chr(ord(resp[i])+ord(Chave[c]))
    else resp[i]:=chr(ord(resp[i])-ord(Chave[c]));
  until i = length(Texto);
  ShowMessage(Resp);

  ADOTable1.Edit;
  ADOTable1.FieldByName('ATUACAO').AsString := RESP;
  ADOTable1.Post;

  ADOTable1.Close;
  ADOConnection1.Connected := False;
  Halt
end;


/// Gera a chave de validação da cópia do BEST
/// </summary>
/// <param name="IdCliente">Código do Cliente</param>
/// <param name="QuantidadeDias">Quantidade de dias de uso da aplicação antes de expirar</param>
/// <param name="DataLimite">Data limite de uso da chave(após isso deve-se gerar outra).</param>
/// <returns>Chave de acesso</returns>
function TfQtdLicenca.geraSenha(idCliente: Integer; qtdDias: Integer;
         dataLimite: TDate; licencaServ: Integer; licencaReader: Integer): String;
var
  peso: Integer;
  span, tsDataLimite: TDate;
  dia, mes, ano, dia2, mes2, ano2: word;
  strClientId, strQtdDias, strDataLimite, QtdLicSer, QtdLicRea: String;
begin
  peso:= 2;

  span:= DateDiff(StrToDate('01/01/2000'), now);;
  DecodeDate(span, ano, mes, dia);

  //Calcula chave do Cliente;
  //Regra de Calculo:
  //IdCliente multiplicado pelo peso 2;
  strClientId := IntToStr(IdCliente * peso);

  //Calcula a quantidade de Dias.
  //Regra de Cálculo:
  //QuantidadeDias multiplicado pelo substract de dias a partir de 01/01/2000
  strQtdDias := FloatToStr((qtdDias * span) + (idCliente* peso));

  //Calcula a Data limite para utilização da chave.
  //Regra de Cálculo:
  //Verifica a diferença da data limite informada com a data de 01/01/2000
  //A diferença da data é aplicado o mesmo peso para o cálculo do IdCliente ou seja 9

  tsDataLimite := DateDiff(StrToDate('01/01/2000'), dataLimite);
  strDataLimite := FloatToStr(tsDataLimite * peso);

  // Quantidade de Licenças Servidor
  // Regra para a geração
  // Quantidade de licenças * peso + peso
  QtdLicSer := IntToStr(licencaServ * peso + peso);

  // Quantidade de Licenças Reader
  // Regra para a geração
  // Quantidade de licenças * peso + peso + 15
  QtdLicRea := IntToStr(licencaReader * peso + 15);

  Result := strClientId + 'A' + strQtdDias + 'F' + strDataLimite + 'B'
            + QtdLicSer + 'K' + QtdLicRea;
end;

procedure TfQtdLicenca.bGeraSerialClick(Sender: TObject);
begin
  if (Length(eIdCliente.Text)=0) or (Length(eQuantDias.Text)=0) then
  begin
    MessageDlg('Todos os campos são OBRIGATÓRIOS', mtError, [mbOK],0);
    eIdCliente.SetFocus;
    Abort;
  end
  else
  eSerial.Text := geraSenha(StrToInt(eIdCliente.text), StrToInt(eQuantDias.Text),
                  meDataLimite.Date, eqtdLicenca.Value, seReader.Value);
end;

function TfQtdLicenca.DateDiff(Date1, Date2: TDate): Integer;
begin
  Result := Trunc(Date2 - Date1);
end;
procedure TfQtdLicenca.FormShow(Sender: TObject);
begin
  meDataLimite.Date := date;
end;

end.
