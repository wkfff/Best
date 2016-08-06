unit bst_perc_custo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, RXSpin, StdCtrls, Buttons,BSTDB;

type
  Tfrm_perc_custo = class(Tprim)
    Edit1: TEdit;
    Label1: TLabel;
    //RxSpinButton1: TRxSpinButton;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    //procedure RxSpinButton1TopClick(Sender: TObject);
    //procedure RxSpinButton1BottomClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FCLIENTE: integer;
    FCENARIO: integer;
    FID: integer;
    FPERC: real;
    procedure SetCENARIO(const Value: integer);
    procedure SetCLIENTE(const Value: integer);
    procedure SetID(const Value: integer);
    procedure SetPERC(const Value: real);
    { Private declarations }
  public
    { Public declarations }
  published
   property CLIENTE : integer read FCLIENTE write SetCLIENTE;
   property CENARIO : integer read FCENARIO write SetCENARIO;
   property ID : integer read FID write SetID;
   property PERC : real read FPERC write SetPERC;
  end;

var
  frm_perc_custo: Tfrm_perc_custo;

implementation

uses bst_main, bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_perc_custo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Edit1Exit(nil);
  frm_perc_custo := nil;
  action := caFree;
end;

procedure Tfrm_perc_custo.FormCreate(Sender: TObject);
begin
  inherited;
  edit1.Text := '1';
end;

{procedure Tfrm_perc_custo.RxSpinButton1TopClick(Sender: TObject);
var
i : integer;
begin
  inherited;
  i := strtoint(edit1.Text);
  inc(i);
  If i > 100 then
    i := 100 ;
  edit1.Text := inttostr(i);
end;}

{procedure Tfrm_perc_custo.RxSpinButton1BottomClick(Sender: TObject);
begin
  inherited;
  i := strtoint(edit1.Text);
  dec(i);
  If i = 0 then
    i :=1;
  edit1.Text := inttostr(i);
end;}

procedure Tfrm_perc_custo.Edit1Exit(Sender: TObject);
begin
  inherited;
  If (strtoint(edit1.Text) > 100) or (strtoint(edit1.Text) < 1) then
   Raise exception.create(def57);
end;

procedure Tfrm_perc_custo.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frm_main.wPerc_Custo := strtoint(edit1.Text);
  If edit1.Text = '' then
   Raise exception.create(def58);
  with Tdados_tab.create(self) do
   Begin
       Atu_PercCorrelato(CLIENTE,CENARIO,ID,strtofloat(edit1.text));
       free;
   end;
  If frm_treeativ <> nil then
   frm_TreeAtiv.PERC := strtofloat(edit1.Text);
  close;
end;

procedure Tfrm_perc_custo.SetCENARIO(const Value: integer);
begin
  FCENARIO := Value;
end;

procedure Tfrm_perc_custo.SetCLIENTE(const Value: integer);
begin
  FCLIENTE := Value;
end;

procedure Tfrm_perc_custo.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure Tfrm_perc_custo.SetPERC(const Value: real);
begin
  FPERC := Value;
end;

end.
