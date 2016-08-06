unit bst_pativ1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  std_prel, Qrctrls, QuickRpt, ExtCtrls,  jpeg, gtQrCtrls, gtQRXport_WMF,
  gtQRXport_Metafile, gtQRXport_EMF, gtQRXport_BMP, gtQRXport_JPEG,
  gtQRXport_Graphic, gtQRXport_GIF, gtQRXport_Text, gtQRXport_Excel,
  gtQRXport_RTF, gtQRXport_XHTML, gtQRXport_HTML, gtQRXport, gtQRXport_Doc,
  gtQRXport_PDF,bstdb, gtQRXport_Hub;

type
  Tfrm_pativ1 = class(Tfrm_pvertstd)
    DetailBand1: TQRBand;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBRichText1: TgtQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FiAtor: TDados_tab;
    FiAp: TAp;
    FiRn: TDados_tab;
    FiLocal: TDados_tab;
    FiEn: TDados_tab;
    FiFunc: Tdados_tab;
    Fireq: Treq;
    procedure SetiAp(const Value: TAp);
    procedure SetiAtor(const Value: TDados_tab);
    procedure SetiEn(const Value: TDados_tab);
    procedure SetiLocal(const Value: TDados_tab);
    procedure SetiRn(const Value: TDados_tab);
    procedure SetiFunc(const Value: Tdados_tab);
    procedure Setireq(const Value: Treq);
    { Private declarations }
  public
    { Public declarations }
  published
  property iAtor : TDados_tab read FiAtor write SetiAtor;
  property iLocal : TDados_tab read FiLocal write SetiLocal;
  property iRn  : TDados_tab read FiRn write SetiRn;
  property iEn : TDados_tab read FiEn write SetiEn;
  property iAp : TAp  read FiAp write SetiAp;
  property iFunc : Tdados_tab read FiFunc write SetiFunc;
  property ireq : Treq read Fireq write Setireq;
  end;

var
  frm_pativ1: Tfrm_pativ1;

implementation




{$R *.DFM}

procedure Tfrm_pativ1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FRM_PATIV1 := NIL;
  ACTION := CAFREE;
end;

procedure Tfrm_pativ1.FormCreate(Sender: TObject);
begin
  inherited;
  iAtor := TDados_tab.create(self);
   iRn := TDados_tab.create(self);
   iEn := TDados_tab.create(self);
   iFunc := TDados_tab.create(self);
   iReq:= Treq.create(self) ;
   iLocal := TDados_tab.create(self);
   iAp := Tap.create(self);
end;

procedure Tfrm_pativ1.SetiAp(const Value: TAp);
begin
  FiAp := Value;
end;

procedure Tfrm_pativ1.SetiAtor(const Value: TDados_tab);
begin
  FiAtor := Value;
end;

procedure Tfrm_pativ1.SetiEn(const Value: TDados_tab);
begin
  FiEn := Value;
end;

procedure Tfrm_pativ1.SetiFunc(const Value: Tdados_tab);
begin
  FiFunc := Value;
end;

procedure Tfrm_pativ1.SetiLocal(const Value: TDados_tab);
begin
  FiLocal := Value;
end;

procedure Tfrm_pativ1.Setireq(const Value: Treq);
begin
  Fireq := Value;
end;

procedure Tfrm_pativ1.SetiRn(const Value: TDados_tab);
begin
  FiRn := Value;
end;

end.
