unit std_prel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, registry, cls_bd, jpeg, strutils, cls_utils,
  bstdb, QrCtrls, QRExport, QRWebFilt, QRXMLSFilt, QRPDFFilt;

type
  Tfrm_pvertstd = class(TForm)
    qrp: TQuickRep;
    PageFooterBand1: TQRBand;
    ph1: TQRBand;
    titulo: TQRLabel;
    pr_cli: TQRLabel;
    pr_proj: TQRLabel;
    pLogo: TQRImage;
    subtitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    qr_sum: TQRBand;
    tot_page: TQRLabel;
    gtQRSysData1: TQRSysData;
    gtQRSysData2: TQRSysData;
    gtQRSysData3: TQRSysData;
    QRWMFFilter1: TQRWMFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRTextFilter1: TQRTextFilter;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRPDFFilter1: TQRPDFFilter;
    QRXMLSFilter1: TQRXMLSFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure ph1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpPreview(Sender: TObject);
    procedure qrpAfterPreview(Sender: TObject);
    procedure qrpStartPage(Sender: TCustomQuickRep);
    procedure qr_sumBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pvertstd: Tfrm_pvertstd;
  sDir,sFile : string;
  TOT ,TotPg: integer;
implementation

uses bst_treeAtiv, bst_main;

{$R *.DFM}

procedure Tfrm_pvertstd.ph1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var pcentro: integer;
begin
  //Qrlabel3.caption := '/'+inttostr(qrp.);
  pcentro := ph1.width div 2 ;
  titulo.left        := (pCentro - titulo.width div 2) ;
  subtitulo.left     := (pCentro - subtitulo.width div 2) ;
  pr_cli.left        := (pCentro - pr_cli.width div 2) ;
  pr_proj.left       := (pCentro - pr_proj.width div 2) ;
 // If sDir <> '' then
     begin
       sFile := bdx.DirFluxo + 'Logo.jpg';
       If fileexists(sFile) then
          pLogo.picture.loadfromfile(sFile);
     end;
  {qrshape3.left := ph1.left + ph1.width -  qrshape3.Width;
  qrshape1.Left := ph1.left + ph1.width -  qrshape3.Width; }
  gtQRSysData3.Left :=  ph1.width - gtQRSysData3.Width - 5 ;
  gtQRSysData1.Left :=  ph1.width - gtQRSysData1.Width - 5;
  gtQRSysData2.Left :=  ph1.width - gtQRSysData2.Width - 5;

end;

procedure Tfrm_pvertstd.FormCreate(Sender: TObject);
var
  Reg : Tregistry;
begin
  qrlabel9.caption := def1220;//vrsão ;
  qrlabel1.caption := def6220;//vrsão date ;
  qrlabel8.caption := def450;//responsável ;
  qrlabel2.caption := defa9;//aprovação ;
   tot := 0;
end;

procedure Tfrm_pvertstd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrm_pvertstd.qrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
 var
  i,j : integer;
 begin
 // tot_page.caption := inttostr(tot);
  i := qrp.qrPrinter.PageNumber;
  j := qrp.qrPrinter.PageCount;
end;

procedure Tfrm_pvertstd.qrpPreview(Sender: TObject);
var
i ,tot : integer;
begin

   
end;

procedure Tfrm_pvertstd.qrpAfterPreview(Sender: TObject);
 var
  i,j : integer;
 begin
  
  i := qrp.qrPrinter.PageNumber;
  j := qrp.qrPrinter.PageCount;
  //tot_page.caption := inttostr(j);
end;


procedure Tfrm_pvertstd.qrpStartPage(Sender: TCustomQuickRep);
begin
   inc(tot);
   If frm_Treeativ = nil then
   begin
     pr_cli.caption     :=  frm_main.lb_cli.caption;
     pr_proj.caption    :=  frm_main.lb_cen.caption;
   end
  else
   begin
     pr_cli.caption     :=   get_Nomcli(tv.selected);
     pr_proj.caption    :=   get_NomProj(tv.selected);
   end;
end;

procedure Tfrm_pvertstd.qr_sumBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrp.qrprinter.master := nil;
  printband  := false;
end;

End.
