unit bst_pca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg;

type
  Tfrm_pca = class(Tfrm_pvertstd)
    presp: TQRDBText;
    pVer: TQRDBText;
    pDataVer: TQRDBText;
    QRBand2: TQRBand;
    qr_ps: TQRSubDetail;
    pPessoa: TQRDBText;
    QRLabel19: TQRLabel;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel17: TQRLabel;
    pExp: TQRDBText;
    QRLabel16: TQRLabel;
    pCond: TQRDBText;
    QRLabel15: TQRLabel;
    pRespons: TQRDBText;
    QRLabel14: TQRLabel;
    pComp: TQRDBText;
    QRLabel13: TQRLabel;
    pCon: TQRDBText;
    QRLabel21: TQRLabel;
    pForm: TQRDBText;
    QRLabel4: TQRLabel;
    pRole: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    pEfet: TQRDBText;
    pJorn: TQRDBText;
    Pqtde: TQRDBText;
    tipo_desc: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRDBText1: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qr_psBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pca: Tfrm_pca;
  pps : boolean;

implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_pca := nil;
  action := cafree;
end;

procedure Tfrm_pca.qr_psBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If pps then
    begin
      qrlabel19.caption := def50 ;
      pps := false;
    end
  else
    qrlabel19.caption := '';
end;

procedure Tfrm_pca.FormCreate(Sender: TObject);
begin
  inherited;
  pps := true;

  //////////////
  qrLabel19.Caption    := def50;//'Pessoas da Classe/People of the Class '   ;
  Qrlabel4.Caption     := def1210;//'Tipo/Type ' ;
  QRLabel7.Caption     := defe3;//'Efetivo da Classe/Class Qty ' ;
  QRLabel10.Caption    := def500;//'Jornada Padrão/Hours per day  '  ;
  qrLabel11.Caption    := defq1;//'Qtde. de Turnos/Qty of Shifts  '  ;
  QRLabel21.Caption    := def8000;//'Formação/Education' ;
  QRLabel13.Caption    := defc1;//'Conhecimentos/Knowledge'  ;
  QRLabel14.Caption    := defc3;//'Competência/Skills';
  QRLabel15.Caption    := defr1;//'Responsabilidades/Responsabilities';
  qrLabel16.Caption    := defc4;//'Condições de Trabalho/Work Conditions' ;
  QRLabel17.Caption    := defe2;//'Experiência/Experience'  ;

end;

procedure Tfrm_pca.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   pps := true;
end;

procedure Tfrm_pca.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //subtitulo.caption :=pver.dataset.FieldbyName('idf_designacao').asstring;

  inherited;

end;

procedure Tfrm_pca.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {If qrp.dataset.fieldbyname('idf_tipo_atividade').value = 'CA' then
     tipo_desc.caption := def51
  else
  If qrp.dataset.fieldbyname('idf_tipo_atividade').value = 'EE' then
     tipo_desc.caption := def52
  else
  If qrp.dataset.fieldbyname('idf_tipo_atividade').value = 'UO' then
     tipo_desc.caption := def53 ;
  }
end;
end.
