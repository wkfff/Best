unit SAT_PESQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, ComCtrls, Buttons, ExtCtrls, gtQrCtrls;

type
  Tfrm_pesq = class(Tprim)
    Panel1: TPanel;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    SRC: TTreeView;
    DST: TTreeView;
    SpeedButton1: TSpeedButton;
    procedure IncludeBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SRCDblClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure DSTDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pesq: Tfrm_pesq;

implementation

uses cfg_main;

{$R *.dfm}

procedure Tfrm_pesq.IncludeBtnClick(Sender: TObject);
begin
  inherited;
  If src.selected <> nil then
   begin
    new(mTvdst);
    mTvdst.FCod := uTvsrc(src.selected.data)^.fCod;
    dst.Items.AddObject(nil,src.selected.text,mTvdst);
    src.selected.Delete;
   end;

  
end;

procedure Tfrm_pesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_pesq := nil;
  inherited;

end;

procedure Tfrm_pesq.SRCDblClick(Sender: TObject);
begin
  inherited;
  IncludeBtnClick(src);
end;

procedure Tfrm_pesq.ExcludeBtnClick(Sender: TObject);
begin
  inherited;
    If dst.Selected <> nil then
     begin
       new(mTvsrc);
       mTvsrc.FCod := uTvdst(dst.selected.data)^.fCod;
       src.Items.AddObject(nil,dst.selected.text,mTvsrc);
       dst.selected.Delete;
     end;

end;

procedure Tfrm_pesq.DSTDblClick(Sender: TObject);
begin
  inherited;
  ExcludeBtnClick(dst);
end;

procedure Tfrm_pesq.SpeedButton1Click(Sender: TObject);
var
i : integer;
wsel : string;
begin
  inherited;
  wSel := '';
 
  for i := 0 to dst.Items.count - 1 do
   begin
     If i = 0 then
      wsel := inttostr(uTvdst(dst.items[i].data)^.fcod)
     else
      wSel := wsel + ','+ inttostr(uTvdst(dst.items[i].data)^.fcod);
   end;
  Tree.CONFIGURACAO.SELECAO(wsel) ;
  close;
end;

end.
