unit bst_pse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pse = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    QRDBText5: TgtQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qr_at: TQRSubDetail;
    QRLabel7: TgtQRLabel;
    pat: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRDBRichText1: TgtQRDBRichText;
    QRGroup1: TQRGroup;
    QRDBText2: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pse: Tfrm_pse;
  jaImpresso : boolean;
  nomant: string;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pse := nil;
  action := cafree;
end;

procedure Tfrm_pse.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {If nomant <> qrp.DataSet.FieldByName('APLIC').asstring then
   Begin
    nomant :=  qrp.DataSet.FieldByName('APLIC').asstring;
    qrlabel7.Caption := def61;
   end
  else
   qrlabel7.Caption := '';  }

end;

procedure Tfrm_pse.FormCreate(Sender: TObject);
begin
  inherited;

  qrlabel5.caption   :=  def321;//   aplicativo
  qrlabel4.caption   :=  def49;//   programa
  qrlabel6.caption   :=  def39;//   descriçaõ

end;

end.
