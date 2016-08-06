unit bst_dir1;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons;

type
  Tfrm_diretorio = class(TBaseFRm)
    fl: TFileListBox;
    dl: TDirectoryListBox;
    dc: TDriveComboBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    procedure flClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure flDblClick(Sender: TObject);
  private
     FDir: Pointer;

  public
    procedure Loadconstantobj;override;
    constructor CreateDir(Value: Pointer; Owner: TComponent);
  end;


var
  frm_diretorio: Tfrm_diretorio;

implementation

uses bst_treeAtiv, bst_treeator, bst_main;



{$R *.DFM}

constructor Tfrm_diretorio.CreateDir(Value: Pointer; Owner: TComponent);
begin
  create(application);
  FDir := Value;
  String(Fdir^) := '';
end;

procedure Tfrm_diretorio.flClick(Sender: TObject);
begin
 edit1.text := fl.filename;
end;

procedure Tfrm_diretorio.SpeedButton2Click(Sender: TObject);
begin
  edit1.text := '';
end;

procedure Tfrm_diretorio.SpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_diretorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frm_diretorio := nil;
   action := cafree;
end;

procedure Tfrm_diretorio.SpeedButton1Click(Sender: TObject);

begin
  {If edit1.text = '' then
     begin
       showmessage(mens89);
     end
  else }
  begin
 //     If edit1.text = '' then
       begin
        // showmessage(mens89);
       end ;
    //  else
         begin
           If (Pos('\',edit1.text) > 0)  or (Pos('/',edit1.text) > 0) then //já tem diretório
              String(FDir^) := edit1.text
           else
             Begin
               If dl.directory = 'C:\' then
                 edit1.text := 'C:\'+EDIT1.TEXT
               else
                If edit1.text <> '' then
                  Begin
                    edit1.text := dl.directory+'\'+edit1.text  ;                     
                  end
                else
                   edit1.text := dl.directory  ;
                String(FDir^) := edit1.text;
             end;
        end;
  end;
  Close;


end;

procedure Tfrm_diretorio. Loadconstantobj;
var
i : integer;

begin
   inherited;
  Caption               := defd3;//'Diretórios' ;
  SpeedButton1. Caption := 'OK' ;
  SpeedButton2.Caption  := defc32;//'Cancelar'  ;
  SpeedButton3.Caption := def901;//'Sair'  ;
  Label1.Caption := 'Salvar em .'  ;


end;

procedure Tfrm_diretorio.flDblClick(Sender: TObject);
begin
  inherited;
  edit1.Text := fl.FileName;
end;

end.

