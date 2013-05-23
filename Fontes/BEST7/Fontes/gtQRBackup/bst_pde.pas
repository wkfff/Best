unit bst_pde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, QuickRpt, Qrctrls, ExtCtrls, jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pde = class(Tfrm_pvertstd)
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
  {If qrp.DataSet.FieldByName('IDF_DOMINIO').value = '' then
   qrlabel3.caption := ''
  else
   qrlabel3.caption := def55;}
end;

procedure Tfrm_pde.FormCreate(Sender: TObject);
begin
  inherited;
   {qrlabel10.caption          :=  def10005;//        nome
   qrlabel5.caption           :=  'Default';
   qrlabel7.caption           :=  def1210;//       tipo
   qrlabel6.caption           :=  def270;//        tamanho
   qrlabel3.caption           :=  def55 ;//        dominio}

end;

end.
