unit bst_dirCenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TfrmDirCenarios = class(TForm)
    dl: TDirectoryListBox;
    Button1: TButton;
    drv: TDriveComboBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure drvChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDirCenarios: TfrmDirCenarios;

implementation

uses bst_cenario;

{$R *.dfm}

procedure TfrmDirCenarios.Button1Click(Sender: TObject);
begin
     frm_cenario.Edit5.Text := dl.Directory;
     frmDirCenarios.Close;
end;

procedure TfrmDirCenarios.drvChange(Sender: TObject);
begin
     dl.Drive :=  drv.Drive;
end;

end.
