unit bst_plf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, StdCtrls,  jpeg, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF,bstdb, gtQRXport_Hub;

type
  Tfrm_plf = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    PLF: TgtQRDBText;
    PRESP: TgtQRDBText;
    PVER: TgtQRDBText;
    PVERDATA: TgtQRDBText;
    qr_at: TQRSubDetail;
    QRLabel3: TgtQRLabel;
    PWBS: TgtQRDBText;
    PDES: TgtQRDBText;
    ppdes: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRDBRichText1: TgtQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FiLf: Tdados_tab;
    FiAp: Tdados_tab;
    procedure SetiAp(const Value: Tdados_tab);
    procedure SetiLf(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iLf : Tdados_tab read FiLf write SetiLf;
   property iAp : Tdados_tab read FiAp write SetiAp;
  end;

var
  frm_plf: Tfrm_plf;
  pat , pator : Boolean;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_plf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_plf := nil;
  action := caFree;
end;

procedure Tfrm_plf.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pat := true;
  pator := true;
end;

procedure Tfrm_plf.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If pat then
    begin
      qrlabel3.caption := def106 ;
      pat := false;
    end
  else
    qrlabel3.caption := '';
end;

procedure Tfrm_plf.SetiAp(const Value: Tdados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_plf.SetiLf(const Value: Tdados_tab);
begin
  FiLf := Value;
end;

procedure Tfrm_plf.FormCreate(Sender: TObject);
begin
  inherited;
  iLf :=  TDados_tab.create(self);
  iAp :=  TDados_tab.create(self);

  ///
  qrlabel5.caption   := def30      ;//loca fisica
  qrlabel6.caption   := def39       ;//descrcao
  qrlabel3.caption   := def106      ;//aividades
end;

end.
