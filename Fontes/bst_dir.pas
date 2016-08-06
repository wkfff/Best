unit bst_dir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons;

type
  Tfrm_dir = class(TForm)
    gp: TGroupBox;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    drl: TDirectoryListBox;
    DCB: TDriveComboBox;
    ed_dir: TEdit;
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure drlChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dir: Tfrm_dir;

implementation

uses pm_treeativ, pm_main, pm_dg;

{$R *.DFM}

procedure Tfrm_dir.SpeedButton11Click(Sender: TObject);
begin
  GravDir := Ed_dir.text;
  Case Wbmp of
    1 : ;//Diag.ExportAsBMPFile(GravDir) ;
    2 :;// FRM_tREEATIV.tv.SaveTofile(GRavDir)  ;
    3 :    ;
  else
    //frm_cli.edit1.text := ed_dir.text;
  end;
  close;
end;

procedure Tfrm_dir.SpeedButton3Click(Sender: TObject);
begin
  CLOSE;
end;

procedure Tfrm_dir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRM_DIR := NIL;
  ACTION :=CAfREE;
end;

procedure Tfrm_dir.drlChange(Sender: TObject);
begin
  ed_dir.text := drl.directory;
end;

end.
