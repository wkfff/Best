unit bst_ppessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls,  jpeg, QRExport, QRXMLSFilt,
  QRPDFFilt, QRWebFilt;

type
  Tfrm_ppessoa = class(Tfrm_pvertstd)
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    gtQRDBText1: TQRDBText;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRDBText3: TQRDBText;
    Nome: TQRLabel;
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
  inherited ;

  gtQRLabel1.Caption := 'E-Mail'  ;
  gtQRLabel2.Caption := deft3;//'Fone'  ;
  gtQRLabel3.Caption := defc9;//'Celular'  ;
  QRLabel5. Caption  := deft2+' ('+defA15+'(s))' ;//'Tempo de Contrata��o' ;
  QRLabel6.Caption   := defs3;//'Sexo'   ;
  QRLabel7.Caption   := 'CBO'  ;
  QRLabel10.Caption  := defc5;//'Custo Anual'  ;
  QRLabel4.Caption   := defc8;//'Cargo' ;
  nome.caption       := def10005 ;//

end;

end.