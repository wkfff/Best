unit bst_plista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF,
  gtQRXport_BMP, gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF,
  gtQRXport_Text, gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML,
  gtQRXport_HTML, gtQRXport, gtQRXport_Doc, gtQRXport_PDF, jpeg, QRCtrls,
  gtQrCtrls, QuickRpt, ExtCtrls, gtQRXport_Hub;

type
  Tfrm_pLista = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    pst: TQRMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pLista: Tfrm_pLista;

implementation

{$R *.dfm}

procedure Tfrm_pLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pLista := nil;
  action := caFree;
end;

end.
