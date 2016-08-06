unit bst_conector;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,cls_obj;

type
  Tfrm_conector = class(TBaseFRm)
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Atu;
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_conector: Tfrm_conector;

implementation

uses  bst_main, bst_treeAtiv;

{$R *.DFM}

procedure Tfrm_conector.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tv.diagrama.selectednode.text := edit1.text ;
  frm_conector := nil;
  action := cafree;
end;

procedure Tfrm_conector.FormCreate(Sender: TObject);
begin
   If frm_treeativ <> nil then
   begin
     If tv.diagrama.selectednode <> nil then
      begin
        edit1.text := tv.diagrama.selectednode.text;
      end;
   end;

end;

procedure Tfrm_conector.Atu;
begin
   If frm_treeativ <> nil then
   begin
     If tv.diagrama.selectednode <> nil then
      begin
        tv.diagrama.selectednode.text := edit1.text ;
      end;
   end;
   close;
end;
procedure Tfrm_conector.Edit1DblClick(Sender: TObject);
begin
   atu;
end;

procedure Tfrm_conector.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 If key = chr(13) then
     atu;
end;

procedure Tfrm_conector.Loadconstantobj;
var
i : integer;

begin

end;

end.

