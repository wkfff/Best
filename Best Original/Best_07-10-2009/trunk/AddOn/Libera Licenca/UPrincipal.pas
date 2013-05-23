unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB;

type
  TfrmLibera = class(TForm)
    ADOConnection1: TADOConnection;
    OpenDialog1: TOpenDialog;
    eBancoDados: TEdit;
    Label1: TLabel;
    sbLocalBanco: TSpeedButton;
    bbExecuta: TBitBtn;
    ADOTable1: TADOTable;
    procedure sbLocalBancoClick(Sender: TObject);
    procedure bbExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibera: TfrmLibera;

implementation

{$R *.dfm}

procedure TfrmLibera.sbLocalBancoClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  eBancoDados.Text := OpenDialog1.FileName;
end;

procedure TfrmLibera.bbExecutaClick(Sender: TObject);
var
  local: String;
  i,c : byte;
  resp, Chave, Encripta, Texto : string;
begin
  local := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
      OpenDialog1.FileName + ';Persist Security Info=False';
  ADOConnection1.ConnectionString := local;

  ADOConnection1.Connected := True;
  ADOTable1.Open;

  Chave := 'Best71';
  Encripta := '45';
  Texto := '3';

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

  ADOTable1.Edit;
  ADOTable1.FieldByName('ATUACAO').AsString := RESP;
  ADOTable1.Post;

  ADOTable1.Close;
  ADOConnection1.Connected := False;
  Halt
end;

end.
