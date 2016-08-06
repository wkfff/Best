unit BST_pdmig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, jpeg, StdCtrls, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pdmig = class(Tfrm_pvertstd)
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    HB1: TQRBand;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    PK: TgtQRLabel;
    QRGroup1: TQRGroup;
    gtQRDBText2: TgtQRDBText;
    gtQRDBRichText1: TgtQRDBRichText;
    QRBand1: TQRBand;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRDBText5: TgtQRDBText;
    gtQRDBText6: TgtQRDBText;
    gtQRDBText8: TgtQRDBText;
    gtQRDBText9: TgtQRDBText;
    pPk: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRDBText7: TgtQRDBText;
    gtQRDBText10: TgtQRDBText;
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
    {If (QRP.DataSet.fieldbyname('idf_descricao').asstring = '') or
     (QRP.DataSet.fieldbyname('idf_descricao').asstring = ' ') then
     Begin
      QRBAND1.height := 18;
      //imag.height := 0;
     end
  else
     qrband1.height := 41;
     //imag.height := 17;}
end;

procedure Tfrm_pdmig.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

    {If QRP.DataSet.fieldbyname('idf_pk').asinteger = 0 then
     pPk.Caption := ''
    else
     pPk.Caption := QRP.DataSet.fieldbyname('idf_pk').AsString;
    If (QRP.DataSet.fieldbyname('idf_descricao').asstring = '') or
     (QRP.DataSet.fieldbyname('idf_descricao').asstring = ' ') then
     Begin
  //    QRBAND1.height := 18;
    
     end
  else
  //   qrband1.height := 41;
  gtQRDBText8.Frame.DrawTop    := false;
  gtQRDBText8.Frame.DrawBottom := false;
  gtQRDBText8.Frame.DrawLeft   := false;
  gtQRDBText8.Frame.DrawRight  := false;

 IF QRP.DataSet.fieldbyname('idf_tipodominio').asstring = 'F' then
     Begin
       gtQRDBText8.BringToFront;
       IF trim(QRP.DataSet.fieldbyname('idf_dominio').asstring) <> '' then
         Begin
           gtQRDBText8.Frame.DrawTop    := TRue;
           gtQRDBText8.Frame.DrawBottom := TRue;
           gtQRDBText8.Frame.DrawLeft   := TRue;
           gtQRDBText8.Frame.DrawRight  := TRue;
         end;
       
     end
  else
     Begin
       gtQRDBText1.BringToFront;     

     end;
 IF trim(QRP.DataSet.fieldbyname('idf_descricao').asstring) = '' then
  Begin
       gtQRDBText9.Frame.DrawTop    := false;
       gtQRDBText9.Frame.DrawBottom := false;
       gtQRDBText9.Frame.DrawLeft   := false;
       gtQRDBText9.Frame.DrawRight  := false;
  end
 else
   Begin
       gtQRDBText9.Frame.DrawTop    := TRue;
       gtQRDBText9.Frame.DrawBottom := TRue;
       gtQRDBText9.Frame.DrawLeft   := TRue;
       gtQRDBText9.Frame.DrawRight  := TRue;
   end;}

      
    

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
