unit bst_basefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TBasefrm = class(TForm)
    procedure FormShow(Sender: TObject);
  private

  protected
   procedure LoadConstantobj; virtual;abstract;
    { Private declarations }
  public
  procedure LoadConstant;virtual;
    { Public declarations }
  end;

var
  Basefrm: TBasefrm;

implementation

uses bst_main, bst_idiomas,BSTDB, Math;


{$R *.dfm}

procedure TBasefrm.LoadConstant;
 Begin
    LoadConstantobj;
 end;

procedure TBasefrm.FormShow(Sender: TObject);
begin
  Ling(frm_main.Idioma,self) ;
end;

end.
