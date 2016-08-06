unit bst_pdextabela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STD_PREL, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_pdextabela = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    DB: TQRBand;
    gtQRDBText1: TQRDBText;
    QRG: TQRGroup;
    gtQRDBText3: TQRDBText;
    pp: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pdextabela: Tfrm_pdextabela;

implementation

{$R *.dfm}

procedure Tfrm_pdextabela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_pdextabela := nil;
  action := caFree;
end;

procedure Tfrm_pdextabela.DBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   If qrp.DataSet.fieldbyname('IDF_PK').asinteger >0 then
     pp.caption  := 'Index primário'
   else
    pp.Caption := '';
end;

end.
