unit bst_plista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pLista = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    pst: TQRMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pLista: Tfrm_pLista;

implementation

{$R *.dfm}

procedure Tfrm_pLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pLista := nil;
  action := caFree;
end;

end.
