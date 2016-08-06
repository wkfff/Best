unit bst_grid;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin, Buttons, bstdb,cls_obj, AddFlow3Lib_TLB;

type
  Tfrm_grid = class(TBaseFRm)
    ckb: TCheckBox;
    rdg: TRadioGroup;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label2: TLabel;
    ckb1: TCheckBox;
    cd_back: TColorDialog;
    SpeedButton1: TSpeedButton;
    cd_grid: TColorDialog;
    SpeedButton3: TSpeedButton;
    OK: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure OKClick(Sender: TObject);
  private
    FDiagrama: TDg;
    procedure SetDiagrama(const Value: TDg);
    { Private declarations }
  public
  published
   property Diagrama : TDg read FDiagrama write SetDiagrama;
   procedure Loadconstantobj;override;
  end;

var
  frm_grid: Tfrm_grid;

implementation

uses bst_cfg, bst_treeAtiv, bst_main;


{$R *.DFM}

procedure Tfrm_grid.Button1Click(Sender: TObject);
begin
 If frm_Treeativ <> nil then
   tv.Diagrama.ShowGrid  := ckb.checked;
 {Diagrama.ShowGrid  := ckb.checked;
 Diagrama.Gridstyle :=  rdg.ItemIndex ;

  If spinedit1.text = '' then
     spinedit1.text := '0';

  If spinedit2.text = '' then
    spinedit2.text := '0';

  Diagrama.xgrid      := strtoint(Spinedit1.text);
  Diagrama.ygrid      := strtoint(Spinedit2.text);
  Diagrama.SnapToGrid := ckb1.Checked;
 If frm_treeativ <> nil then
   tv.diagrama := diagrama ;  }
 //else

 close;
end;

procedure Tfrm_grid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_grid := nil;
  action := cafree;
end;

procedure Tfrm_grid.SpeedButton1Click(Sender: TObject);
begin
  If cd_grid.execute then
     Diagrama.gridColor := cd_Grid.color;
end;

procedure Tfrm_grid.FormCreate(Sender: TObject);
begin
 
   begin
   
   end;

end;
procedure Tfrm_grid.SpeedButton2Click(Sender: TObject);
begin
   If cd_back.execute then
      Diagrama.BackColor := cd_back.Color;

end;

procedure Tfrm_grid.SetDiagrama(const Value: TDg);
begin
  FDiagrama := Value;
end;

procedure Tfrm_grid.FormShow(Sender: TObject);
begin
     INHERITED;
     tv.Diagrama.Gridstyle;
     ckb.checked    := tv.Diagrama.ShowGrid;
     ckb1.Checked   := tv.Diagrama.SnapToGrid;
     spinedit1.text := floattostr(tv.Diagrama.xgrid);

     spinedit2.text := floattostr(tv.Diagrama.ygrid);
     rdg.ItemIndex  := tv.Diagrama.GridStyle ;
     cd_back.color  := tv.Diagrama.BackColor;
     cd_grid.color  := tv.Diagrama.GridColor;
end;

procedure Tfrm_grid.SpeedButton3Click(Sender: TObject);
begin
 If cd_back.execute then
      Diagrama.BackColor := cd_back.Color;
end;

procedure Tfrm_grid.OKClick(Sender: TObject);
begin
  If frm_Treeativ <> nil then
   begin
     tv.Diagrama.ShowGrid  := ckb.checked;
     tv.Diagrama.Gridstyle :=  rdg.ItemIndex ;
     If spinedit1.text = '' then
       spinedit1.text := '0';

     If spinedit2.text = '' then
       spinedit2.text := '0';

      tv.Diagrama.xgrid      := strtoint(Spinedit1.text);
      tv.Diagrama.ygrid      := strtoint(Spinedit2.text);
      tv.Diagrama.SnapToGrid := ckb1.Checked;
   end;

 {Diagrama.ShowGrid  := ckb.checked;


  If spinedit1.text = '' then
     spinedit1.text := '0';

  If spinedit2.text = '' then
    spinedit2.text := '0';

  Diagrama.xgrid      := strtoint(Spinedit1.text);
  Diagrama.ygrid      := strtoint(Spinedit2.text);
  Diagrama.SnapToGrid := ckb1.Checked;
 If frm_treeativ <> nil then
   tv.diagrama := diagrama ;  }
 //else

 close;
end;

procedure Tfrm_grid.Loadconstantobj;
var
i : integer;

begin
   inherited;
   caption               :=  defg8;//         grid
   ckb.Caption           :=  def220;//     mostra grid
   speedbutton3.caption  :=  defc24;//      cor do fundo
   speedbutton1.caption  :=  defc34 ;//     cor do grid
   rdg.caption           :=  def1210;//       tipo de grid
   rdg.items[0]          :=  defp9;//       pont
   rdg.items[1]          :=  deft11;//       linha
   rdg.items[2]          :=  deft6;//       tracejado
   label1.caption        :=  defa16;//        altura
   label2.caption        :=  defl8;//      largura
   ckb1.Caption          :=  defa17;//      alinha ao grid
end;

end.

