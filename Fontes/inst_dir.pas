unit inst_dir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShellCtrls;

type
  Tfrm_shell = class(TForm)
    st: TShellTreeView;
    procedure stDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_shell: Tfrm_shell;

implementation

uses setup1;

{$R *.dfm}

procedure Tfrm_shell.stDblClick(Sender: TObject);
begin
   If st.SelectedFolder.IsFolder then
   begin
    form3.edit1.text := st.SelectedFolder.PathName;
    close;
 //   st.visible := false;
   end;
end;

end.
