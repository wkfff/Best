unit bst_pcons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  Tfrm_consist = class(TForm)
    rp_ac: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    titulo: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    pr_cli: TQRLabel;
    QRLabel2: TQRLabel;
    pr_proj: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rp_acNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_consist: Tfrm_consist;

implementation

uses bst_check;



{$R *.DFM}

procedure Tfrm_consist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRM_consist := nil;
  action := caFree;
end;

procedure Tfrm_consist.rp_acNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  moredata := true;
  frm_check.chk_k := frm_check.chk_k + 1;
  If frm_check.chk_k > frm_check.sg.rowcount then
      moredata := false;
  begin
     qrlabel5.caption   := frm_check.sg.cells[0,frm_check.chk_k];
     qrlabel6.caption   := frm_check.sg.cells[1,frm_check.chk_k];
     qrlabel7.caption   := frm_check.sg.cells[2,frm_check.chk_k];
  end;
  
end;

end.
