unit bst_patoi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF, gtQRXport_Hub;

type
  TFRM_PATOI = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    QR_OI: TQRSubDetail;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRBand2: TQRBand;
    QRLabel3: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_PATOI: TFRM_PATOI;

implementation

uses bst_main;

{$R *.dfm}

procedure TFRM_PATOI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   frm_patoi := nil;
   action := caFree;
end;

procedure TFRM_PATOI.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If qr_OI.DataSet.FieldByName('IDF_DESIGNACAO').asstring = '' then
   Begin
      qrband2.Height := 0 ;
      qr_oi.Height := 0;
   end
    
  else
   Begin
      qrband2.Height := 18;
      qr_oi.Height := 18;
   end;
end;

procedure TFRM_PATOI.FormCreate(Sender: TObject);
begin
  inherited;


  qrlabel3.caption     :=   def86;//objetos de intrface     ;
  qrlabel5.caption     :=   defn2;//nome externo     ;


end;

end.
