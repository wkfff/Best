


unit bst_pac1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, QuickRpt, Qrctrls, ExtCtrls,  StdCtrls, jpeg,cls_utils,bstdb, gtQrCtrls,
  gtQRXport_WMF, gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP,
  gtQRXport_JPEG, gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text,
  gtQRXport_Excel, gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML,
  gtQRXport, gtQRXport_Doc, gtQRXport_PDF, gtQRXport_Hub;

type
  Tfrm_pac1 = class(Tfrm_pvertstd)
    QRBand1: TQRBand;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel6: TgtQRLabel;
    pcausa: TgtQRDBRichText;
    QRDBRichText4: TgtQRDBRichText;
    QRBand2: TQRBand;
    QRLabel5: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBRichText2: TgtQRDBRichText;
    QRLabel3: TgtQRLabel;
    QRDBRichText3: TgtQRDBRichText;
    QRLabel14: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRDBRichText2: TgtQRDBRichText;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    QRDBText13: TgtQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FiAp: Tdados_tab;
    procedure SetiAp(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iAp : Tdados_tab read FiAp write SetiAp;
  end;

var
  frm_pac1: Tfrm_pac1;
  pps : Boolean;

implementation

uses bst_treeAtiv, bst_Escaspect, bst_main;

{$R *.DFM}

procedure Tfrm_pac1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // freeandnil(iAp);
   frm_pac1 := nil;
   action := cafree;
end;

procedure Tfrm_pac1.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 mtab ,mTipo: string;
begin
  inherited;


end;

procedure Tfrm_pac1.FormCreate(Sender: TObject);
begin
  inherited;
  QRLabel6.Caption := defe8;//'Expectativas de ganho'   ;
  QRLabel5.Caption := Mensasp1;//'Causa '  ;
  QRLabel4.Caption := Mensasp2;//'Efeito' ;
  QRLabel3.Caption := defa6;//'Ação Corretiva '  ;
  QRLabel14.Caption :=defp7;// 'Prazo para Conclusão'  ;
  gtQRLabel1.Caption := def450;//'Responsável'  ;
  gtQRLabel2.Caption := def63;//'Atividade'  ;


end;

procedure Tfrm_pac1.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 iOper : TDiag_dados;
begin
  inherited;

  

end;

procedure Tfrm_pac1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
 mTipo,mtab : string;
 iOper : TDiag_dados;
begin
  inherited;
 {If qrp.DataSet.fieldbyname('IDF_TIPO__ASPECTO').asstring =  def40 then
   QRDBRichText3.BringToFront
  else
   gtQRDBRichText2.BringToFront;
  }
end;

procedure Tfrm_pac1.SetiAp(const Value: Tdados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_pac1.qrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
  mtab,mTipo : string;
begin
  inherited;
  
end;

end.
