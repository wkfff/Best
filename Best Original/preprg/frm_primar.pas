unit frm_primar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gtQrCtrls,db,dbtables,DBCtrls,stdCtrls;

type
  Tprimar = class(Tform)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FAcesso: boolean;
    Faplicativo: string;
    procedure SetAcesso(const Value: boolean);
    procedure Setaplicativo(const Value: string);

    { Private declarations }
  public
    class function Execute(pForm : TForm;pCaption : string):TModalResult;
  published
   property Acesso : boolean read FAcesso write SetAcesso;
   property aplicativo : string read Faplicativo write Setaplicativo;
  end;

var
  primar: Tprimar;
  s : string;
  i : integer;
implementation



{$R *.dfm}

procedure Tprimar.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 // action := caFree;
end;

procedure Tprimar.FormShow(Sender: TObject);
var
i : integer;
begin
  inherited;
 //caption := Aplicativo;
end;



procedure Tprimar.FormCreate(Sender: TObject);
begin
 acesso := true;
end;

procedure Tprimar.SetAcesso(const Value: boolean);
begin
  FAcesso := Value;
end;

procedure Tprimar.Setaplicativo(const Value: string);
begin
  Faplicativo := Value;
end;

class function Tprimar. Execute(pForm : TForm;pCaption : string):TModalResult;

begin;

pForm := self.Create(application);

try
  pForm.Caption := pCaption;
  result        := pForm.ShowModal;
finally
  pForm.release;
  end; 
end;


end.
