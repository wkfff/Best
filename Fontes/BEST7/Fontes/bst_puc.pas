unit bst_puc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  STD_PREL, Qrctrls, QuickRpt, ExtCtrls, qrextra, jpeg, bstdb, QRExport,
  QRXMLSFilt, QRPDFFilt, QRWebFilt;

type
  Tfrm_puc = class(Tfrm_pvertstd)
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRLabel19: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBRichText2: TQRDBRichText;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    qrdb1: TQRDBRichText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FiOi: TDados_tab;
    FiTab: Tdados_tab;
    procedure SetiOi(const Value: TDados_tab);
    procedure SetiTab(const Value: Tdados_tab);
    { Private declarations }
  public
    { Public declarations }
  published
   property iOi :  TDados_tab read FiOi write SetiOi;
   property iTab : Tdados_tab read FiTab write SetiTab;
  end;

var
  frm_puc: Tfrm_puc;
  pps : Boolean;
implementation

uses bst_ev, bst_main;


{$R *.DFM}

procedure Tfrm_puc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_puc := nil;
  action := caFree;
end;

procedure Tfrm_puc.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

   Begin
      If (( frm_ev <> nil) and ( frm_ev.Tipo = 'OI')) or ( frm_ev = nil) then
        begin
          If pps then
          begin
            qrlabel19.caption := def18 + ' : ' ;
            pps := false;
          end
        else
          qrlabel19.caption := '';
        end;
   end;
  
  
end;

procedure Tfrm_puc.FormCreate(Sender: TObject);
begin
  inherited;
 pps := true;
 iOi :=  TDados_tab.create(self);
 iTab :=  TDados_tab.create(self);

 //
  QRLabel19.Caption := def18;//'Eventos'  ;
  QRLabel4.Caption           := defl2;//'Lay Out da Tela .ca ' ;
  QRLabel4.Caption  := def39;//'Descrição'   ;
  QRLabel5.Caption  := defc12;//'Consulta'  ;
  QRLabel7.Caption  := def71 ;//'Edição'   ;
  QRLabel6.Caption  := def39;//'Descrição' ;
  QRLabel10.Caption := defn2;//'Nome Externo ';


end;

procedure Tfrm_puc.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
   i : integer;
begin
  inherited;
    pps := true;
end;
procedure Tfrm_puc.SetiOi(const Value: TDados_tab);
begin
  FiOi := Value;
end;

procedure Tfrm_puc.SetiTab(const Value: Tdados_tab);
begin
  FiTab := Value;
end;

end.
