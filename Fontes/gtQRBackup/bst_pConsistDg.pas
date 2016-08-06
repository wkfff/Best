unit bst_pConsistDg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF,
  gtQRXport_BMP, gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF,
  gtQRXport_Text, gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML,
  gtQRXport_HTML, gtQRXport, gtQRXport_Doc, gtQRXport_PDF, jpeg, QRCtrls,
  gtQrCtrls, QuickRpt, ExtCtrls, gtQRXport_Hub;

type
  Tfrm_pconsistdg = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    db: TQRBand;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRDBText5: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    gr: TQRGroup;
    gtQRDBText6: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pconsistdg: Tfrm_pconsistdg;

implementation

uses bst_main;

{$R *.dfm}

procedure Tfrm_pconsistdg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_pConsistDg := nil;
  action := caFree;
end;

procedure Tfrm_pconsistdg.FormCreate(Sender: TObject);
begin
  inherited;
  //titulo/.caption := defC33;//          conasistencia diag
  //gtqrlabel2.caption  := defd12;// diagrama
  //gtqrlabel3.caption  := def10005 ;// nome
  //gtqrlabel4.caption  := defi14;// oncosnist


end;

end.
