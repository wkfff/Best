unit BST_pentext;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL,  Qrctrls, QuickRpt, ExtCtrls, jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF,bstdb, gtQRXport_Hub;

type
  Tfrm_pEntext = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    QRDBText1: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    gtQRDBRichText1: TgtQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Fiee: Tdados_tab;
    procedure Setiee(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iee : Tdados_tab read Fiee write Setiee;
  end;

var
  frm_pEntext: Tfrm_pEntext;

implementation



{$R *.DFM}

procedure Tfrm_pEntext.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_pEntExt := nil;
  action := caFree;
end;

procedure Tfrm_pEntext.Setiee(const Value: Tdados_tab);
begin
  Fiee := Value;
end;

procedure Tfrm_pEntext.FormCreate(Sender: TObject);
begin
  inherited;
iEE :=  TDados_tab.create(self);

end;
end.
