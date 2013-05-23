unit pm_phoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, gtQrCtrls;

type
  Tfrm_phoras = class(TForm)
    qrp: TQuickRep;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel1: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRGroup2: TQRGroup;
    QRLabel2: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRGroup3: TQRGroup;
    QRLabel3: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TgtQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_phoras: Tfrm_phoras;

implementation

uses  pm_dm9;

{$R *.DFM}

procedure Tfrm_phoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_pproj := nil;
  action := cAfREE;
end;

end.
