unit bst_mens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, StdCtrls,cls_obj, jpeg, ExtCtrls;

type
  Tfrm_mens = class(Tprim)
    mens: TLabel;
    Image1: TImage;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    { Private declarations }
  public
    procedure LoadCOnstantObj;OVERRIDE;
  end;

var
  frm_mens: Tfrm_mens;

implementation

uses bst_main;

{$R *.dfm}

procedure Tfrm_mens.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   If key = VK_ESCAPE then
         wStop := true;
end;

procedure Tfrm_mens.LoadCOnstantObj;
begin
  inherited;
  caption   :=   defm7  ;//mensgem
end;

end.
