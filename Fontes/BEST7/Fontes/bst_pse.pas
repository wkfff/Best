unit bst_pse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg;

type
  Tfrm_pse = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    qr_at: TQRSubDetail;
    QRLabel7: TQRLabel;
    pat: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    gtQRDBText1: TQRDBText;
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
