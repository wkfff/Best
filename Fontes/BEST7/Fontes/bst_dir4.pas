unit bst_dir4 ;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, ImgList, ComCtrls, ToolWin;

type
  Tfrm_dir4 = class(TBasefrm)
    fl: TFileListBox;
    dl: TDirectoryListBox;
    dc: TDriveComboBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    procedure flClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure flDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_dir4: Tfrm_dir4;

implementation

uses bst_ev, bst_treeAtiv, bst_main;





{$R *.DFM}

procedure Tfrm_dir4.flClick(Sender: TObject);
begin
 edit1.text := fl.filename;
end;

procedure Tfrm_dir4.SpeedButton2Click(Sender: TObject);
begin
  edit1.text := '';
  edit2.text := '';
end;

procedure Tfrm_dir4.SpeedButton3Click(Sender: TObject);
begin

  SpeedButton2Click(nil);
  flDblClick(nil);
  close;
end;

procedure Tfrm_dir4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_dir4 := nil;
  action := caFree;
end;

procedure Tfrm_dir4.SpeedButton1Click(Sender: TObject);
begin
 flDblClick(self) ;

end;

procedure Tfrm_dir4.FormCreate(Sender: TObject);
begin
 dl.directory := frm_main.lastDir;
end;

procedure Tfrm_dir4.FormActivate(Sender: TObject);
begin
  edit4.text := ''
end;

procedure Tfrm_dir4.flDblClick(Sender: TObject);
begin
  edit2.text := EDIT1.TEXT ;
  If frm_treeativ <> nil then
   Begin
     frm_treeativ.dir_db    := fl.FileName;
     frm_treeativ.diretorio := dl.Directory;
   end;

  close;
end;  
procedure Tfrm_dir4. Loadconstantobj;
var
i : integer;

begin
  inherited;
  Caption               := def88;//'Diretórios' ;
  SpeedButton1. Caption := 'OK' ;
  SpeedButton2.Caption  := defc32;//'Cancelar'  ;
  SpeedButton3.Caption := def901;//'Sair'  ;
  
end;

end.

