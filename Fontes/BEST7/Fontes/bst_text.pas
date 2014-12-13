unit bst_text;

interface
                      
uses
  Windows, Messages, Bst_BaseFrm,SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cls_obj;

type
  Tfrm_text = class(TBaseFrm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1DblClick(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadConstantObj;override;
  end;

var
  frm_text: Tfrm_text;

implementation

uses bst_treeAtiv, bst_main;



{$R *.DFM}

procedure Tfrm_text.FormClose(Sender: TObject; var Action: TCloseAction);
begin
If tv.Diagrama.selectedNode <> nil then
     tv.Diagrama.SelectedNode.text := memo1.text;
frm_text := nil;
action := cafree;
end;

procedure Tfrm_text.Memo1DblClick(Sender: TObject);
begin
  If tv.Diagrama.selectedNode <> nil then
     tv.Diagrama.SelectedNode.text := memo1.text;
  close;
end;

procedure Tfrm_text.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = VK_RETURN then
     begin
       Memo1DblClick(frm_text);
     end;
end;

procedure Tfrm_text.FormCreate(Sender: TObject);
begin
  Memo1.text := tv.diagrama.selectedNode.text;
end;

procedure Tfrm_text.LoadConstantObj ;
begin
  inherited;
Caption  := def950;// texto
end;

end.
