unit bst_pen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL,  Qrctrls, QuickRpt, ExtCtrls, jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF,bstdb, gtQRXport_Hub;

type
  Tfrm_pen = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    pver: TgtQRDBText;
    pdataver: TgtQRDBText;
    presp: TgtQRDBText;
    qr_at: TQRSubDetail;
    QRLabel7: TgtQRLabel;
    pat: TgtQRDBText;
    QRDBText1: TgtQRDBText;
    QRLabel4: TgtQRLabel;
    ptipo: TgtQRDBText;
    pdes: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    pper: TgtQRDBText;
    QRLabel6: TgtQRLabel;
    QRDBRichText1: TgtQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FiEn: TDados_tab;
    FiAp: TDados_tab;
    procedure SetiAp(const Value: TDados_tab);
    procedure SetiEn(const Value: TDados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iEn: TDados_tab  read FiEn write SetiEn;
   property iAp: TDados_tab  read FiAp write SetiAp;
  end;

var
  frm_pen: Tfrm_pen;
  fat : Boolean;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_pen := nil;
  action := cAFREE;
end;

procedure Tfrm_pen.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  fat := true;
end;

procedure Tfrm_pen.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If fat then
    begin
      qrlabel7.caption := def56 ;
      fat := false;
    end
  else
    qrlabel7.caption := '';
end;

procedure Tfrm_pen.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  // subtitulo.caption  := pdes.dataset.Fieldbyname('idf_designacao').value
end;

procedure Tfrm_pen.SetiAp(const Value: TDados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_pen.SetiEn(const Value: TDados_tab);
begin
  FiEn := Value;
end;

procedure Tfrm_pen.FormCreate(Sender: TObject);
begin
  inherited;
   iEn :=  TDados_tab.create(self);
   iAp :=  TDados_tab.create(self);

   ////
 QRLabel4.Caption := def1210;//'Tipo ' ;
 QRLabel5.Caption := def460;//'Período ' ;
 QRLabel6.Caption := def39;//'Descrição ' ;
 QRLabel7. Caption:= def56;//'Atividades Disparadas ' ;


end;

end.
