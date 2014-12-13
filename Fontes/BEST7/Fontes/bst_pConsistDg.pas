unit bst_pConsistDg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pconsistdg = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    db: TQRBand;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRDBText5: TQRDBText;
    gtQRLabel1: TQRLabel;
    gr: TQRGroup;
    gtQRDBText6: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
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
