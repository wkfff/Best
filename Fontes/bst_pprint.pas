unit bst_pprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, Buttons, StdCtrls, ExtCtrls;

type
  Tfrm_pprint = class(Tprim)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;
  end;

var
  frm_pprint: Tfrm_pprint;

implementation

uses bst_prnf, bst_preprint, bst_main;

{$R *.dfm}

procedure Tfrm_pprint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_pprint := nil;
  action := caFree;
end;

procedure Tfrm_pprint.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If frm_prnf     = nil then
    frm_prnf     := Tfrm_prnf.create(self);
  frm_prnf.show;
end;

procedure Tfrm_pprint.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;
end;

procedure Tfrm_pprint.Image1Click(Sender: TObject);
begin
  inherited;
   If frm_prnf     = nil then
    frm_prnf     := Tfrm_prnf.create(self);
  frm_prnf.show;
end;

procedure Tfrm_pprint.Image2Click(Sender: TObject);
begin
  inherited;
  If frm_preprint= nil then
    frm_preprint     := Tfrm_preprint.create(self);
 frm_preprint.show;
end;

procedure Tfrm_pprint.Loadconstantobj;
var
i : integer;

begin
  inherited;
  caption                  := defi12;// 'Impressão'  ;
  label1.Caption           := defm5;//multi página;//
  Label2.Caption           := deff5;// folha unica
end;

end.
