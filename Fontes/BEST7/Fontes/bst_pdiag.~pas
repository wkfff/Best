unit bst_pdiag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, QRPrntr, printers, StdCtrls, bstdb;

type
  Tfrm_pdiag = class(TForm)
    qrp: TQuickRep;
    ph1: TQRBand;
    ldesc: TQRLabel;
    QRBand1: TQRBand;
    pdiag: TQRImage;
    pr_proj: TQRLabel;
    pr_cli: TQRLabel;
    pLogo: TQRImage;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    qrnivel: TQRLabel;
    pwbs: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pdiag: Tfrm_pdiag;

implementation

uses bst_treeAtiv, bst_main;



{$R *.DFM}

procedure Tfrm_pdiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frm_pdiag := nil;
 action := cafree;
end;

procedure Tfrm_pdiag.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
pcentro: integer;
sFile : string;
begin

  pcentro := ph1.width div 2 ;
 // ldesc.left        := (pCentro - ldesc.width div 2) ;
  //pr_cli.left        := (pCentro - pr_cli.width div 2) ;
 // pr_proj.left       := (pCentro - pr_proj.width div 2) ;

  QRSysData1.left := trunc(ph1.width - QRSysData1.width-50);
  
  If tv.Diagrama.IDG_DIR = 'DEO' then
  Begin
   qrlabel1.caption  := '';

  end
 else
  qrnivel.caption := frm_treeativ.edit1.text;
  If bdx.DirFluxo <> '' then
     begin
       sFile := WDir + 'Logo.jpg';
       If fileexists(sFile) then
          pLogo.picture.loadfromfile(sFile);
     end;
     
end;

end.
