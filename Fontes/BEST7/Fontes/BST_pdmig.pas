unit BST_pdmig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, jpeg, StdCtrls, QRXMLSFilt,
  QRPDFFilt, QRExport, QRWebFilt;

type
  Tfrm_pdmig = class(Tfrm_pvertstd)
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    HB1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    PK: TQRLabel;
    QRGroup1: TQRGroup;
    gtQRDBText2: TQRDBText;
    gtQRDBRichText1: TQRDBRichText;
    QRBand1: TQRBand;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRDBText5: TQRDBText;
    gtQRDBText6: TQRDBText;
    gtQRDBText8: TQRDBText;
    gtQRDBText9: TQRDBText;
    pPk: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRDBText7: TQRDBText;
    gtQRDBText10: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pdmig: Tfrm_pdmig;

implementation

uses bst_main;


{$R *.DFM}

procedure Tfrm_pdmig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pdmig := nil;
  action :=caFree;
end;

procedure Tfrm_pdmig.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
    If (QRP.DataSet.fieldbyname('idf_descricao').asstring = '') or
     (QRP.DataSet.fieldbyname('idf_descricao').asstring = ' ') then
     Begin
      QRBAND1.height := 18;
      //imag.height := 0;
     end
  else
     qrband1.height := 41;
     //imag.height := 17;
end;

procedure Tfrm_pdmig.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {
    If QRP.DataSet.fieldbyname('idf_codigo').asinteger = 0 then
     pPk.Caption := ''
    else
     pPk.Caption := QRP.DataSet.fieldbyname('idf_codigo').AsString;

    if (QRP.DataSet.fieldbyname('idf_descricao').asstring = '') or
     (QRP.DataSet.fieldbyname('idf_descricao').asstring = ' ') then
     begin
  //    QRBAND1.height := 18;

     end
  else
  //   qrband1.height := 41;
  }
  gtQRDBText8.Frame.DrawTop    := false;
  gtQRDBText8.Frame.DrawBottom := false;
  gtQRDBText8.Frame.DrawLeft   := false;
  gtQRDBText8.Frame.DrawRight  := false;

 if QRP.DataSet.fieldbyname('idf_tipodominio').asstring = 'F' then
     begin
       gtQRDBText8.BringToFront;
       if trim(QRP.DataSet.fieldbyname('idf_dominio').asstring) <> '' then
         begin
           gtQRDBText8.Frame.DrawTop    := TRue;
           gtQRDBText8.Frame.DrawBottom := TRue;
           gtQRDBText8.Frame.DrawLeft   := TRue;
           gtQRDBText8.Frame.DrawRight  := TRue;
         end;

     end
  else
     begin
       gtQRDBText1.BringToFront;

     end;
 if trim(QRP.DataSet.fieldbyname('idf_descricao').asstring) = '' then
  begin
       gtQRDBText9.Frame.DrawTop    := false;
       gtQRDBText9.Frame.DrawBottom := false;
       gtQRDBText9.Frame.DrawLeft   := false;
       gtQRDBText9.Frame.DrawRight  := false;
  end
 else
   begin
       gtQRDBText9.Frame.DrawTop    := TRue;
       gtQRDBText9.Frame.DrawBottom := TRue;
       gtQRDBText9.Frame.DrawLeft   := TRue;
       gtQRDBText9.Frame.DrawRight  := TRue;
   end;

end;

procedure Tfrm_pdmig.FormCreate(Sender: TObject);
begin
  inherited;
   /////////////
  QRLabel5.Caption  := def26;//'Elemento de Dados'  ;
  QRLabel6.Caption := def1210;//'Tipo'  ;
  QRLabel7.Caption  := def270;//'Tam.'  ;
  QRLabel10.Caption := 'Default'  ;
  QRLabel11.Caption := def55;//'Domínio'  ;
  PK.Caption        := 'PK' ;
 //pPk.Caption       := 'pPk'  ;


end;

end.
