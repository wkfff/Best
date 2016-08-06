unit listaemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LISTA_STD, Menus, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_lista_emp = class(TLISTA_STD)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lista_emp: Tfrm_lista_emp;

implementation

{$R *.dfm}

procedure Tfrm_lista_emp.FormCreate(Sender: TObject);
begin
  inherited;
  iObj := OTempresas.create;
end;

end.
