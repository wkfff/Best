unit bst_selmissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, Buttons, StdCtrls, ExtCtrls;

type
  Tfrm_selmissao = class(Tprim)
    rdg: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_selmissao: Tfrm_selmissao;

implementation

uses bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_selmissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_selmissao := nil;
  action := cafree;
end;

procedure Tfrm_selmissao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If rdg.ItemIndex = 0 then
     frm_Treeativ.selmissao := false
  else
    frm_Treeativ.selmissao := true;
  frm_TreeAtiv.Geramanual(nil);
end;

end.
