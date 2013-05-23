unit bst_preprint;

interface

uses
  Windows, Messages, SysUtils, bst_BaseFrm,classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,aCTIVEX,OleCtrls, AxCtrls, Spin,printers,QRPrntr,
  AddFlow3Lib_TLB, cls_obj, bstdb;

type
  Tfrm_preprint = class(TBasefrm)
    GroupBox1: TGroupBox;
    ckFundo: TCheckBox;
    ckback: TCheckBox;
    SpeedButton1: TSpeedButton;
    rg: TRadioGroup;
    pZoom: TSpinEdit;
    Label1: TLabel;
    ck_fit1: TCheckBox;
    rdg_imp: TRadioGroup;
    stret: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    wsup: TSpinEdit;
    winf: TSpinEdit;
    wesq: TSpinEdit;
    wdiret: TSpinEdit;
    Image1: TImage;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

   
    { Private declarations }
  public
    procedure LoadCOnstantObj;override;
  end;

var
  frm_preprint: Tfrm_preprint;

implementation

uses bst_main, bst_pdiag,bst_prnf, bst_treeAtiv, bst_pprint;



{$R *.DFM}
procedure Tfrm_preprint.SpeedButton1Click(Sender: TObject);
 Begin
   If frm_pdiag = nil then
    frm_pdiag     := Tfrm_pdiag.create(self);    { DONE -oyves -c5.14 : Margens no digarma }
   frm_treeativ.Imprime_Diagrama(ckBack.Checked,ckFundo.Checked,stret.Checked,ck_fit1.Checked,tv.Diagrama.EMPRESA,
                    tv.Diagrama.CENARIO,winf.Value,wSup.Value,wesq.Value,wdiret.Value,rdg_imp.ItemIndex,
                    pzoom.Value,rg.ItemIndex,tv.Diagrama.IDF_WBS_CODE+'-'+udado(tv.Selected.data)^.FNome,tv.Diagrama);
   
   frm_pdiag.qrp.preview;

   frm_pdiag.close;
   frm_preprint.close;
   If frm_pprint <> nil then
    frm_pprint.close;
 end;


procedure Tfrm_preprint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_preprint := nil;
  action := cafree;
end;

procedure Tfrm_preprint.BitBtn1Click(Sender: TObject);
begin
  If frm_prnf     = nil then
    frm_prnf     := Tfrm_prnf.create(self);

  frm_prnf.showmodal;

end;

procedure Tfrm_preprint.Image1Click(Sender: TObject);
begin
  SpeedButton1Click(nil);
end;

procedure Tfrm_preprint.LoadCOnstantObj;

begin

  Caption                   := defi6;//'Impressão do Diagrama'  ;
  SpeedButton1.Caption      := defv2;//'Preview' ;
  Label6.Caption            := defv2;//'Preview'  /
  GroupBox1.Caption         := ''   ;
  Label1.Caption            := 'Zoom'  ;
  ckFundo.Caption           := defi7;//'Imprime Cor de Fundo'  ;
  ckback.Caption            := defi8 ;//'Imprime Imagem de fundo'  ;
  rg.Caption                := defs5 ;//'Seleção' ;
  rg.items[0]               :=  defi9;//'Imprime tudo'         ;
  rg.items[1]               := defi10;// 'Imprime Seleção'         ;
  ck_fit1.Caption           := defa13;//'Ajusta a página' ;
  rdg_imp.Caption           := defo3;//'Orientação'   ;
  rdg_imp.items[0]          := defr6;//'Retrato'               ;
  rdg_imp.items[1]          := defp15;//'Paisagem'               ;
  stret.Caption             := defe26;//'Estica desenho'  ;
  GroupBox2. Caption        := defm6;//'Margens(mm)'  ;
  Label2.Caption            := defs19;//'Superior'  ;
  Label3.Caption            := defi11;//'Inferior'  ;
  Label4.Caption            := defe25;//'Esquerda'  ;
  Label5.Caption            := defd10;//'Direita'  ;

end;

end.
