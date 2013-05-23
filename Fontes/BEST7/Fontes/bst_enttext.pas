unit bst_enttext;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_enttext = class(TForm)
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_enttext: Tfrm_enttext;

implementation

uses bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_enttext.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  frm_enttext:= nil;
  action := cafree;
end;

procedure Tfrm_enttext.Edit1Exit(Sender: TObject);
begin
  frm_treeativ.dmi_desc := edit1.text;
  close;
end;

procedure Tfrm_enttext.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   If ord(key) = 13 then
     Edit1Exit(nil)
   else
   If ord(key) = 27 then
    Begin

     close;
    end;
end;

end.
