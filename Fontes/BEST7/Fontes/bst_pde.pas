unit bst_pde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, QuickRpt, Qrctrls, ExtCtrls, jpeg;

type
  Tfrm_pde = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pde: Tfrm_pde;

implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pde := nil;
  action := caFree;
end;

procedure Tfrm_pde.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If qrp.DataSet.FieldByName('IDF_DOMINIO').value = '' then
   qrlabel3.caption := ''
  else
   qrlabel3.caption := def55;
end;

procedure Tfrm_pde.FormCreate(Sender: TObject);
begin
  inherited;
   qrlabel10.caption          :=  def10005;//        nome
   qrlabel5.caption           :=  'Default';
   qrlabel7.caption           :=  def1210;//       tipo
   qrlabel6.caption           :=  def270;//        tamanho
   qrlabel3.caption           :=  def55 ;//        dominio

end;

end.
