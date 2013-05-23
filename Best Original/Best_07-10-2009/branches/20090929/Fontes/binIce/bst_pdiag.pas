unit bst_pdiag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls,  QRPrntr,printers, StdCtrls,bstdb, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pdiag = class(TForm)
    qrp: TQuickRep;
    ph1: TQRBand;
    ldesc: TgtQRLabel;
    QRBand1: TQRBand;
    pdiag: TgtQRImage;
    pr_proj: TgtQRLabel;
    pr_cli: TgtQRLabel;
    pLogo: TgtQRImage;
    QRSysData1: TgtQRSysData;
    QRLabel1: TgtQRLabel;
    qrnivel: TgtQRLabel;
    pwbs: TLabel;
    gtQRPDFExport1: TgtQRPDFExport;
    gtQRHTMLExport1: TgtQRHTMLExport;
    gtQRXHTMLExport1: TgtQRXHTMLExport;
    gtQRRTFExport1: TgtQRRTFExport;
    gtQRExcelExport1: TgtQRExcelExport;
    gtQRGIFExport1: TgtQRGIFExport;
    gtQRJPEGExport1: TgtQRJPEGExport;
    gtQRBMPExport1: TgtQRBMPExport;
    gtQREMFExport1: TgtQREMFExport;
    gtQRWMFExport1: TgtQRWMFExport;
    gtQRExportHub1: TgtQRExportHub;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pdiag: Tfrm_pdiag;

implementation

uses bst_treeAtiv, bst_main;



{$R *.DFM}

procedure Tfrm_pdiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frm_pdiag := nil;
 action := cafree;
end;

procedure Tfrm_pdiag.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
pcentro: integer;
sFile : string;
begin

  pcentro := ph1.width div 2 ;
 // ldesc.left        := (pCentro - ldesc.width div 2) ;
  //pr_cli.left        := (pCentro - pr_cli.width div 2) ;
 // pr_proj.left       := (pCentro - pr_proj.width div 2) ;

  QRSysData1.left := trunc(ph1.width - QRSysData1.width-50);
  
  If tv.Diagrama.IDG_DIR = 'DEO' then
  Begin
   qrlabel1.caption  := '';

  end
 else
  //qrnivel.caption := frm_treeativ.edit1.text;
  If bdx.DirFluxo <> '' then
     begin
       sFile := WDir + 'Logo.jpg';
       If fileexists(sFile) then
          pLogo.picture.loadfromfile(sFile);
     end;
     
end;

end.
