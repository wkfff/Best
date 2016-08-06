unit frm_prim;

interface

uses
  Windows,bst_Basefrm, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, db, dbtables, DBCtrls, stdCtrls;

type
  Tprim = class(TBasefrm)
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
   procedure LoadCOnstantObj;override;
  end;

var
  prim: Tprim;
  s : string;
  i : integer;
implementation



{$R *.dfm}

procedure Tprim.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 // action := caFree;
end;

procedure Tprim.FormShow(Sender: TObject);
var
i : integer;
begin
  inherited;
 //caption := Aplicativo;
end;



procedure Tprim.FormCreate(Sender: TObject);
begin
 acesso := true;

  


end;

procedure Tprim.SetAcesso(const Value: boolean);
begin
  FAcesso := Value;
end;

procedure Tprim.Setaplicativo(const Value: string);
begin
  Faplicativo := Value;
end;

class function TPrim. Execute(pForm : TForm;pCaption : string):TModalResult;

begin;

pForm := self.Create(application);

try
  pForm.Caption := pCaption;
  result        := pForm.ShowModal;
finally
  pForm.release;
  end; 
end;

procedure Tprim.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
end;
end.
