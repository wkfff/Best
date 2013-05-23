unit bst_ValidaBEST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ExtCtrls, Buttons,bstdb, DB, ADODB, Mask,
  DBCtrls;

type
  TValidaBEST = class(TForm)
    Image1: TImage;
    txtId: TEdit;
    txtChave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnValidar: TSpeedButton;
    txtCliente: TEdit;
    txtDias: TEdit;
    txtDataLimite: TEdit;
    txtDecCliente: TEdit;
    txtDecDias: TEdit;
    txtDecDataLimite: TEdit;
    Label3: TLabel;
    txtQtdDias: TEdit;
    ADOTable1: TADOTable;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    DBEdit3: TDBEdit;
    ADOCommand1: TADOCommand;
    procedure btnValidarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function DateDiff(Date1, Date2: TDate): Integer;
    procedure FormDeactivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValidaBEST: TValidaBEST;

implementation

{$R *.dfm}

procedure TValidaBEST.btnValidarClick(Sender: TObject);
Var
  Qtd, i, Peso, intData, intDiasUso: integer;
  strTemp, V1, V2 : string;
  Valor1, Valor2, Valor3 : extended;
begin
  txtCliente.Text := '';
  txtDias.Text := '';
  txtDataLimite.Text := '';
  txtDecCliente.Text := '';
  txtDecDias.Text := '';
  txtDecDataLimite.Text := '';
  Qtd := length(txtChave.Text);
  for i := 1 to Qtd do
  Begin
    strTemp := Copy(txtChave.Text, i,1);   //Copy(txtchave.Text, 1, i);

    // Verifica e separa o codigo do primeiro grupo(Cliente)
    if strTemp <> 'A' then
    Begin
        If V1 <> 'A' then
        Begin
        txtCliente.Text :=  txtCliente.Text + strTemp
        End;
    End
    Else
    Begin
        V1 := strTemp;
    End;
    // Verifica e separa o codigo do segundo grupo(Dias)
    if strTemp <> 'F' then
    Begin
        If V2 <> 'F' then
        Begin
          if V1 = 'A' then
          Begin
            if strTemp <> 'A' then
            Begin
              txtDias.Text :=  txtDias.Text + strTemp
            End;
          End
        End;
    End
    Else
    Begin
        if V1 = 'A' then
        Begin
          V2 := strTemp;
        End;
    End;
    // Verifica e separa o codigo do segundo grupo(Dias)
    if V1 = 'A' then
    Begin
        If V2 = 'F' then
        Begin
          if strTemp <> 'F' then
          Begin
            txtDataLimite.Text :=  txtDataLimite.Text + strTemp
          End;
        End;
    End
  End;
  Peso := 2;
  if txtchave.Text <> '' then
  Begin
  // Busca o código do cliente.
  Valor1 := (StrToFloat(txtCliente.Text) / Peso);
  txtDecCliente.Text := FloatToStr(Valor1);

  Valor3 := (StrToFloat(txtDataLimite.Text) / Peso);
  txtDecDataLimite.Text := FloatToStr(Valor3);


  //Busca os Dias de validade.
  Valor2 := ((strTofloat(txtDias.Text))/ StrTofloat(txtQtdDias.Text));
  txtDecDias.Text := FloatToStr(Valor2);

  if txtId.Text = txtDecCliente.Text then
  Begin
    if txtDecDias.Text = txtDecDataLimite.Text then
    Begin
      Peso := 2;
      if dbEdit3.text = '0' then
      Begin
         intData := DateDiff(StrToDate('01/01/2000'), now);
         intDiasUso :=  (intData + 3);
         ADOTable1.Edit;
         dbedit1.Text := txtId.Text;
         dbedit2.text := IntToStr(intDiasUso);
         dbedit3.text := '1';
         ADOTable1.Post;
         ShowMessage('Sua cópia de avaliação do BEST está válida para uso por 3 dias.');
      End
      else
      Begin
        intData := DateDiff(StrToDate('01/01/2000'), now);
        intDiasUso :=  (intData + StrToInt(txtQtdDias.Text));
        ADOTable1.Edit;
        dbedit1.Text := txtId.Text;
        dbedit2.text := IntToStr(intDiasUso);
        dbedit3.text := '1';
        ADOTable1.Post;
        ShowMessage('Sua cópia do BEST está válida por um período de ' + txtQtdDias.Text + ' dias.');
      End;
        ValidaBEST.Close;
    End
    else
    Begin
      ShowMessage('A quantidade de dias é diferente da chave de validação');
    End;
  End
  else
  Begin
     ShowMessage('O Id informado é diferente da chave de validação.');
  End;
  End
  else
  Begin
    intData := DateDiff(StrToDate('01/01/2000'), now);
    intDiasUso :=  (intData + 3);
    ADOTable1.Edit;
    dbedit1.Text := txtId.Text;
    dbedit2.text := IntToStr(intDiasUso);
    dbEdit3.Text := '1';
    ADOTable1.Post;
    ValidaBEST.Close;
  End;

end;

procedure TValidaBEST.FormShow(Sender: TObject);
var
  intData : integer;
begin
  try
      ADOTable1.ConnectionString := BDx.ConnectionString;
      ADOTable1.TableName := 'BST_VALIDACAO';
      AdoTable1.Active := true;
      intData := DateDiff(StrToDate('01/01/2000'), now);
      if dbEdit2.Text = '' then
      Begin
          dbEdit2.Text := '0';
      End;
      if intData <= StrToInt(dbEdit2.Text) then
      Begin
         //ValidaBEST.Visible := false;
         timer1.Enabled := true;
      End
      else
      Begin
         ShowMessage('Sua cópia do BEST expirou, entre em contato para solicitar nova chave.');
      End;
  except
      ADOCommand1.ConnectionString := BDx.ConnectionString;
      ADOCommand1.CommandText := 'CREATE TABLE BST_VALIDACAO (IDCLIENTE INT, VALIDADE varchar(50), LIMITE INT);';
      ADOCommand1.Execute;
      ShowMessage('O BEST necessitou efetuar uma atualização no banco de dados, por isso, será encerrado.');
      Application.Terminate;
  End;
end;

procedure TValidaBEST.Button1Click(Sender: TObject);
begin
  ADOTable1.Edit
end;

function TValidaBEST.DateDiff(Date1, Date2: TDate): Integer;
begin
  Result := Trunc(Date2 - Date1);
end;


procedure TValidaBEST.FormDeactivate(Sender: TObject);
begin
    close;
end;

procedure TValidaBEST.Timer1Timer(Sender: TObject);
begin
  close;
end;

procedure TValidaBEST.SpeedButton1Click(Sender: TObject);
begin
  application.Terminate;
end;

end.
