unit bst_texto;

interface

uses
  Windows, Messages, bst_basefrm,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cls_obj;

type
  Tfrm_texto = class(TBaseFRm)
    Edit1: TEdit;
    Button1: TButton;
    rdg: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    procedure LoadConstantObj;override;
  end;

var
  frm_texto: Tfrm_texto;

implementation

uses bst_main;


{$R *.DFM}

procedure Tfrm_texto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_texto := nil;
  action := caFree;
end;

procedure Tfrm_texto.Button1Click(Sender: TObject);
begin
  If tv.diagrama.selectedNode <> nil then
     begin
       tv.diagrama.SelectedNode.text := rdg.items[rdg.ItemIndex];
     end
     
  else
  If tv.diagrama.selectedLink <> nil then
     tv.diagrama.SelectedLink.text := edit1.text;

  close;
end;

procedure Tfrm_texto.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If key = chr(13) then
    button1Click(frm_texto);;
end;

procedure Tfrm_texto.LoadConstantObj ;
begin
  inherited;
  caption := def935 +'/' +   def240;
  rdg.items[0]   := def935   ; //  sim
  rdg.items[1]   := def240    ; //  não
end;


end.
