unit bst_pregra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF,bstdb, gtQRXport_Hub;

type
  Tfrm_pregra = class(Tfrm_pvertstd)            pver: TgtQRDBText;
    pdataver: TgtQRDBText;
    presp: TgtQRDBText;
    qr_at: TQRSubDetail;
    pat: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    qr_dad: TQRSubDetail;
    QRLabel10: TgtQRLabel;
    pdad: TgtQRDBText;
    ld: TQRBand;
    QRLabel11: TgtQRLabel;
    pObj: TgtQRDBRichText;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    qr_impl: TQRChildBand;
    QRLabel13: TgtQRLabel;
    pExc: TgtQRDBRichText;
    QRLabel14: TgtQRLabel;
    pImpl: TgtQRDBText;
    pdesc: TgtQRDBRichText;
    gtQRLabel1: TgtQRLabel;
    gtQRDBRichText1: TgtQRDBRichText;
    gtQRDBText1: TgtQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qr_dadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ldBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FiDe: TDados_tab;
    FiRn: TDados_tab;
    FiAp: TDados_tab;
    procedure SetiAp(const Value: TDados_tab);
    procedure SetiDe(const Value: TDados_tab);
    procedure SetiRn(const Value: TDados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iRn  : TDados_tab read FiRn write SetiRn;
   property iAp : TDados_tab read FiAp write SetiAp;
   property iDe : TDados_tab read FiDe write SetiDe;
  end;

var
  frm_pregra: Tfrm_pregra;
   prn ,pda: boolean;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pregra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   frm_pRegra := nil;
   action := caFree;
end;

procedure Tfrm_pregra.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If prn then
     begin
       qrlabel3.caption := def61;
       prn := false;
     end
  else
     begin
      qrlabel3.caption := '';
     end;

end;

procedure Tfrm_pregra.FormCreate(Sender: TObject);
begin
  inherited;
   prn := true;
   pda := true;
   iRn :=  TDados_tab.create(self);
   iAp :=  TDados_tab.create(self);
   iDe :=  TDados_tab.create(self);
   qrlabel11.caption := def1010;//objetivo
   gtqrlabel1.caption := def39;//descriçao;
   qrlabel13.caption := def7220;//exceção;
   qrlabel14.caption := def12200;//tipo de implement;
   qrlabel3.caption := def61;//atividades aplicadas
   qrlabel10.caption :=def9//data groups;
end;

procedure Tfrm_pregra.qr_dadBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   If pda then
     begin
       qrlabel10.caption := def62;
       pda := false;
     end
  else
     begin
       qrlabel10.caption := '';
     end;
end;

procedure Tfrm_pregra.qrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  prn := true;
  pda := true;
end;

procedure Tfrm_pregra.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
pcentro : integer;
begin
  inherited;
 // subtitulo.caption := qrp.dataset.fieldbyname('idf_designacao').asstring;
  //pcentro := ph1.width div 2 ;
  //subtitulo.left     := (pCentro - subtitulo.width div 2) ;
end;

procedure Tfrm_pregra.ldBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   prn := true;
   pda := true;
end;

procedure Tfrm_pregra.SetiAp(const Value: TDados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_pregra.SetiDe(const Value: TDados_tab);
begin
  FiDe := Value;
end;

procedure Tfrm_pregra.SetiRn(const Value: TDados_tab);
begin
  FiRn := Value;
end;

end.
