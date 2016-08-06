unit bst_preqti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_preqti = class(Tfrm_pvertstd)
    QRBand2: TQRBand;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    gtQRDBText1: TgtQRDBText;
    gtQRDBRichText1: TgtQRDBRichText;
    QR_REQ: TQRSubDetail;
    gtQRDBText2: TgtQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_preqti: Tfrm_preqti;

implementation

uses bst_dm_rel;



{$R *.dfm}

procedure Tfrm_preqti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_preqti := nil;
  action := cafree;
end;

procedure Tfrm_preqti.CBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
 { If dm_rel.qry_req.FieldByName('REGRA').AsString = '' then
    cb.Height := 0
  else
    cb.height := 18; } 
end;

end.
