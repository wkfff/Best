unit bst_pca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pca = class(Tfrm_pvertstd)
    presp: TgtQRDBText;
    pVer: TgtQRDBText;
    pDataVer: TgtQRDBText;
    QRBand2: TQRBand;
    qr_ps: TQRSubDetail;
    pPessoa: TgtQRDBText;
    QRLabel19: TgtQRLabel;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel17: TgtQRLabel;
    pExp: TgtQRDBText;
    QRLabel16: TgtQRLabel;
    pCond: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    pRespons: TgtQRDBText;
    QRLabel14: TgtQRLabel;
    pComp: TgtQRDBText;
    QRLabel13: TgtQRLabel;
    pCon: TgtQRDBText;
    QRLabel21: TgtQRLabel;
    pForm: TgtQRDBText;
    QRLabel4: TgtQRLabel;
    pRole: TgtQRDBText;
    QRLabel7: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    pEfet: TgtQRDBText;
    pJorn: TgtQRDBText;
    Pqtde: TgtQRDBText;
    tipo_desc: TgtQRLabel;
    QRDBRichText1: TgtQRDBRichText;
    QRDBText1: TgtQRDBText;
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
