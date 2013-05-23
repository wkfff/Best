unit bst_dirbmp;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, Buttons,Activex,OleCtrls, AxCtrls,jpeg,cls_obj, gtQrCtrls;

type
  Tfrm_dirbmp = class(TBaseFRm)
    fl: TFileListBox;
    dl: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    im: TImage;
    edit2: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure flDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure flClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dlDblClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_dirbmp: Tfrm_dirbmp;

implementation

uses bst_treeAtiv, bst_main;


{$R *.DFM}

procedure Tfrm_dirbmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frm_dirbmp := nil;
   action := cafree;
end;



procedure Tfrm_dirbmp.flDblClick(Sender: TObject);
var
Wpic : IpictureDisp;
Wimagem : Tpicture;
begin
  WImagem := TPicture.create;
  WImagem.loadfromfile(fl.FileName);
  GetOlePicture(WImagem,WPic);
  tv.Diagrama.SelectedNode.picture := Wpic;
  close;
end;

procedure Tfrm_dirbmp.FormCreate(Sender: TObject);
begin
  edit2.ItemIndex := 0;
  edit2Change(frm_dirbmp);
  dl.Directory := frm_main.lastDir;
  fl.directory := dl.directory;
end;

procedure Tfrm_dirbmp.flClick(Sender: TObject);
var
wwp : TPicture;
begin
  wwp := TPicture.create;
  wwp.LoadFromFile(fl.filename);
  im.picture := wwp;
end;

procedure Tfrm_dirbmp.SpeedButton1Click(Sender: TObject);
begin
dl.bringtofront;
end;

procedure Tfrm_dirbmp.dlDblClick(Sender: TObject);
begin
  dl.sendtoback;
end;

procedure Tfrm_dirbmp.Edit2Change(Sender: TObject);
begin
 fl.mask := trim(edit2.text);
end;

procedure Tfrm_dirbmp.Loadconstantobj;
var
i : integer;

begin
 inherited;
  Caption              := defi13;//'Imagens'  ;
  Label1.Caption       := def1210;//'Tipo'   ;
  Label2.Caption       := def10005;//'Nome';
  SpeedButton1.Caption := defc31;//Concluir'  ;

end;

end.

