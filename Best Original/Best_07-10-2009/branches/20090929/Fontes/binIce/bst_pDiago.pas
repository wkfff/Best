unit bst_pDiago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF,
  gtQRXport_BMP, gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF,
  gtQRXport_Text, gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML,
  gtQRXport_HTML, gtQRXport, gtQRXport_Doc, gtQRXport_PDF, jpeg, QRCtrls,
  gtQrCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pDiago = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    pdg: TgtQRImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pDiago: Tfrm_pDiago;

implementation

{$R *.dfm}

procedure Tfrm_pDiago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 frm_pDiago := nil;
 action := cafree;
end;

end.
