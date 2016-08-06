unit frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,inh_carga;

type
  Tfrm = class(TForm)
    procedure FormShow(Sender: TObject);
  private

  protected
   procedure LoadConstantobj; virtual;abstract;
    { Private declarations }
  public
  procedure LoadConstant; virtual;
    { Public declarations }
  end;

var
  frm: Tfrm;

implementation


{$R *.dfm}

procedure Tfrm.LoadConstant;
 Begin
 // Load_Constants(self);
 end;

procedure Tfrm.FormShow(Sender: TObject);
begin
 
 // Load_Constants(self);
end;

end.
