unit bst_exdir;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, gtQrCtrls;

type
  Tfrm_exdir = class(TBaseFRm)
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
  frm_exdir: Tfrm_exdir;

implementation

uses bst_treeAtiv, bst_main;




{$R *.DFM}

procedure Tfrm_exdir.flClick(Sender: TObject);
begin
 edit1.text := fl.filename;
end;

procedure Tfrm_exdir.SpeedButton2Click(Sender: TObject);
begin
  edit1.text := '';
  edit2.text := '';
  frm_main.dir_canc := true;
  If frm_treeativ <> nil then
    frm_treeativ.Dir_canc := true;
end;

procedure Tfrm_exdir.SpeedButton3Click(Sender: TObject);
begin
  edit4.text := '2';
  frm_main.dir_canc := true;
  If frm_treeativ <> nil then
    frm_treeativ.Dir_canc := true;
  close;
end;

procedure Tfrm_exdir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_main.Lastdir := dl.directory;
  frm_exdir := nil;
  action := cafree;
end;

procedure Tfrm_exdir.SpeedButton1Click(Sender: TObject);
begin
 flDblClick(frm_exdir) ;
 close;

end;

procedure Tfrm_exdir.FormCreate(Sender: TObject);
begin
 dl.directory := frm_main.lastDir ;
 
end;

procedure Tfrm_exdir.FormActivate(Sender: TObject);
begin
  edit4.text := ''
end;

procedure Tfrm_exdir.flDblClick(Sender: TObject);
var
wdir : string;
begin
  If dl.directory = 'C:\' then
     wdir := dl.directory + edit2.text
    else
      wdir:= dl.directory +'\'+ edit2.text ;

  If frm_treeativ <> nil then
   Begin

    frm_treeativ.Dir_canc := false;
    If dl.directory = 'C:\' then
     frm_treeativ.schema := dl.directory + edit2.text
    else
      frm_treeativ.schema := dl.directory +'\'+ edit2.text ;
   end;
  frm_main.Dir_canc := false;
  frm_main.back     :=  dl.Directory;
  frm_main.nome_back := edit2.text;
  
  If dl.directory = 'C:\' then
     edit2.text := 'C:\'+EDIT1.TEXT
  else
     edit2.text := dl.directory+'\'+edit1.text;
  

end;

procedure Tfrm_exdir.Loadconstantobj;
var
i : integer;

begin

end;

end.

