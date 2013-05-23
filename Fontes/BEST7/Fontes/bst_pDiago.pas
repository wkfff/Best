unit bst_pDiago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pDiago = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    pdg: TQRImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pDiago: Tfrm_pDiago;

implementation

{$R *.dfm}

procedure Tfrm_pDiago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 frm_pDiago := nil;
 action := cafree;
end;

end.