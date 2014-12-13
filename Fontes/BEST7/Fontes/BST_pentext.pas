unit BST_pentext;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL,  Qrctrls, QuickRpt, ExtCtrls, jpeg, bstdb, QRExport,
  QRXMLSFilt, QRPDFFilt, QRWebFilt;

type
  Tfrm_pEntext = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRRichText1: TQRRichText;
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
