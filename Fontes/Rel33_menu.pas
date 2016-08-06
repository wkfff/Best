unit rel32_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons,cls_bd,bstdb;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    qry_cria_idf_dados: TADOQuery;
    QRY_CRIAiNDEX: TADOQuery;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  try
      begin
        If bdx = nil then
           bdx := TBd.create(false);
      end;
     except
      begin
         freeandnil(bdx);
         raise;
         showmessage('Não foi possível abrir o Banco de dados!'+#13+'Verificar as Configurações!');
      end;
     end;
     qry_cria_idf_dados.Connection := bdx; 
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  qry_CRia_idf_dados.Connection := BDX;

  qry_CRia_idf_dados.ExecSQL;
  
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
   freeandnil(BDx);
  BDx := TBD.Create(true);
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  QRY_CRIAiNDEX.Connection := BDX;
  QRY_CRIAiNDEX.execsql;
end;

end.
