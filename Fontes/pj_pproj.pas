unit pm_phoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  Tfrm_phoras = class(TForm)
    qrp: TQuickRep;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
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
