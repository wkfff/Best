unit inst_dir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShellCtrls;

type
  Tfrm_shell = class(TForm)
    st: TShellTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_shell: Tfrm_shell;

implementation

{$R *.dfm}

end.
