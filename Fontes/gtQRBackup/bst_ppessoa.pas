unit bst_ppessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_ppessoa = class(Tfrm_pvertstd)
    QRDBText3: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText9: TgtQRDBText;
    QRLabel4: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    Nome: TgtQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ppessoa: Tfrm_ppessoa;

implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_ppessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frm_ppessoa := nil;
  action := caFree;

end;

procedure Tfrm_ppessoa.FormCreate(Sender: TObject);
begin
  inherited;


  //

  inherited ;

  gtQRLabel1.Caption := 'E-Mail'  ;
  gtQRLabel2.Caption := deft3;//'Fone'  ;
  gtQRLabel3.Caption := defc9;//'Celular'  ;
  QRLabel5. Caption  := deft2+' ('+defA15+'(s))' ;//'Tempo de Contratação' ;
  QRLabel6.Caption   := defs3;//'Sexo'   ;
  QRLabel7.Caption   := 'CBO'  ;
  QRLabel10.Caption  := defc5;//'Custo Anual'  ;
  QRLabel4.Caption   := defc8;//'Cargo' ;
  nome.caption       := def10005 ;//

end;

end.
