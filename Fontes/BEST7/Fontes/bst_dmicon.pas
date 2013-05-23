unit bst_dmicon;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_dmicon = class(TBaseFRm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_dmicon: Tfrm_dmicon;

implementation

uses bst_treeAtiv, bst_main;

{$R *.dfm}

procedure Tfrm_dmicon.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  frm_dmicon := nil;
  action := cafree;
end;

procedure Tfrm_dmicon.Edit1Exit(Sender: TObject);
begin
  frm_treeativ.dmi_desc := edit1.text;
  close;
end;

procedure Tfrm_dmicon.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   If ord(key) = 13 then
     Edit1Exit(nil)
   else
   If ord(key) = 27 then
    Begin
    
     close;
    end;
end;

procedure Tfrm_dmicon.Loadconstantobj;
var
i : integer;

begin
  inherited;
  label1.Caption    := def39;//'descrição';
  caption           := def77779;//'conexão';
end;

end.

