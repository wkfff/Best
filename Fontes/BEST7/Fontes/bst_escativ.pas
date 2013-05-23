unit bst_escativ;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, std_prel, DB, ADODB, bstdb, cls_utils, 
  QuickRpt, Qrctrls, cls_obj;

type
  TFRM_ESCATIV = class(TBasefrm)
    rg: TRadioGroup;
    rdg2: TRadioGroup;
    ckb: TCheckBox;
    ckb_prev: TCheckBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    ckb1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure rdg2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ckbClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure Loadconstantobj;override;
  end;

var
  FRM_ESCATIV: TFRM_ESCATIV;
  wfrm : Tfrm_pvertstd;

implementation

uses bst_pativ,  bst_pativ1, bst_main;

{$R *.DFM}

procedure TFRM_ESCATIV.FormClose(Sender: TObject;
  var  action: TCloseAction);
  begin
    frm_escativ := nil;
    action := cafree;
  end;

procedure TFRM_ESCATIV.BitBtn1Click(Sender: TObject);
var
  wForm : TForm;
  wView : string;
Begin
 If ckb.Checked then
  Begin
    If frm_pAtiv1     = nil then
      frm_pAtiv1     := Tfrm_pAtiv1.create(self);
    wForm := frm_pativ1;
    If not frm_pativ1.iAp.AtivPr(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'',
                                 edit1.text,rdg2.itemindex,rg.itemindex ) then
      exit;
  end
 else
  Begin
    If frm_pAtiv     = nil then
      frm_pAtiv     := Tfrm_pAtiv.create(self);
    wForm := frm_pativ;
    If not frm_pativ.iAp.AtivPr(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,'',edit1.text,rdg2.itemindex,rg.itemindex ) then
        exit;
  end;

  If ckb_prev.Checked then
   wView := 'V'
  else
   wView := 'P';

 Imprime_atividades(CurrEmpresa.Cenarios.CLI_ID,CurrEmpresa.Cenarios.PRJ_ID,edit1.Text,
                     rg.ItemIndex,rdg2.itemIndex,wView,ckb.Checked,wForm,ckb1.Checked);

 If ckb.Checked then
    Tfrm_pAtiv1(wForm).close

 else
    Tfrm_pAtiv(wForm).close;
end;

procedure TFRM_ESCATIV.rdg2Click(Sender: TObject);
begin
  If rdg2.ItemIndex = 1 then
     edit1.visible := true
  else
     edit1.visible := false;
end;

procedure TFRM_ESCATIV.Image1Click(Sender: TObject);
begin
  BitBtn1Click(nil);
end;

procedure TFRM_ESCATIV.SpeedButton1Click(Sender: TObject);
begin
  BitBtn1Click(nil);
end;

procedure TFRM_ESCATIV.ckbClick(Sender: TObject);
begin
  ckb1.Visible:= not ckb.Checked;
 // ckb1.Checked := not ckb.Checked;
end;

procedure TFRM_ESCATIV.Loadconstantobj;
var
i : integer;

begin
  Caption             := def106;//'Relatório de Atividades'  ;
  SpeedButton1.Caption:= def7774 ;//'Concluir' ;
  rg.Caption          := defs5;//'Seleção' ;
  rg.Items[0]         := def106;//'Atividades'     ;
  rg.Items[1]         := def64;//'Use Cases'     ;
  rg.Items[2]         := defa10;//Ambos'     ;
  rg.Items[3]         := defp8;//'Procedural somente'     ;

  rdg2.Caption        := defc18;//'Classificação' ;
  rdg2.Items[0]       := defo2;// 'Ordem alfabética'    ;
  rdg2.Items[1]       := 'WBS'     ;
  ckb.Caption         := defr3;//'Resumido'  ;
  ckb_prev.Caption    := 'Preview'   ;
  ckb1.Caption        := defq2;//'Quebra por Objeto'  ;

end;

end.

