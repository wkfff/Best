unit bst_escFluxos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, StdCtrls, ExtCtrls;

type
  Tfrm_escFluxos = class(Tprim)
    rdg: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure LoadCOnstantObj;override;
  end;

var
  frm_escFluxos: Tfrm_escFluxos;

implementation

uses bst_treeAtiv, bst_main;

{$R *.dfm}

procedure Tfrm_escFluxos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   If rdg.itemIndex < 0 then
     frm_treeativ.FORMDG := false
   else
     frm_treeativ.FORMDG := true;
   frm_EscFluxos := nil;
   action := caFree;
end;

procedure Tfrm_escFluxos.rdgClick(Sender: TObject);
begin
  inherited;
  If rdg.itemindex = 0 then
   frm_treeativ.LISTA_DG := false
  else
   frm_treeativ.LISTA_DG := true;
  close; 
end;

procedure Tfrm_escFluxos.LoadCOnstantObj;

begin
inherited;
  Caption       := def9;//'Fluxos de Dados'  ;
  rdg.Caption   := def9;// 'Fluxo de Dados'  ;
  rdg.items[0]  :=  defn6;//'Novo Fluxo de Dados'       ;
  rdg.items[1]  := defo4; //'Obter Fluxo da Lista'      ;

end;

end.
