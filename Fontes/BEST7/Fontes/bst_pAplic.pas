unit bst_pAplic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, bstdb, jpeg;

type
  Tfrm_pAplic = class(Tfrm_pvertstd)
    qr_at: TQRBand;
    PLF: TQRDBText;
    PRESP: TQRDBText;
    PVER: TQRDBText;
    PVERDATA: TQRDBText;
    QRBand1: TQRBand;
    gtQRLabel1: TQRLabel;
    gtQRDBRichText1: TQRDBRichText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qr_atBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FiLf: Tdados_tab;
    FiAp: Tdados_tab;
    procedure SetiAp(const Value: Tdados_tab);
    procedure SetiLf(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iLf : Tdados_tab read FiLf write SetiLf;
   property iAp : Tdados_tab read FiAp write SetiAp;
  end;

var
  frm_pAplic: Tfrm_pAplic;
  pat , pator : Boolean;
implementation

uses bst_main;



{$R *.DFM}

procedure Tfrm_pAplic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pAplic := nil;
  action := caFree;
end;

procedure Tfrm_pAplic.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  pat := true;
  pator := true;
end;

procedure Tfrm_pAplic.qr_atBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {If pat then
    begin
      qrlabel3.caption := def63+'s : ' ;
      pat := false;
    end
  else
    qrlabel3.caption := '';  }
end;

procedure Tfrm_pAplic.SetiAp(const Value: Tdados_tab);
begin
  FiAp := Value;
end;

procedure Tfrm_pAplic.SetiLf(const Value: Tdados_tab);
begin
  FiLf := Value;
end;

procedure Tfrm_pAplic.FormCreate(Sender: TObject);
begin
  inherited;
  iLf :=  TDados_tab.create(self);
  iAp :=  TDados_tab.create(self);
end;

end.
