unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB;

type
  TForm1 = class(TForm)
    Conn: TADOConnection;
    TBCMD_DIVERSOS: TADOTable;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses cls_bd, bst_main, BSTDB;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Conn := bdx;


end;

end.
