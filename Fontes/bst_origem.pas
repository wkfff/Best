unit bst_origem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, bst_BaseFrm;

type
  Tfrm_dados = class(TBasefrm)
    rgb: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgbClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure LoadConstantObj;override;
    { Public declarations }
  end;

var
  frm_dados: Tfrm_dados;

implementation

uses bst_treeAtiv, bst_main;


{$R *.DFM}

procedure Tfrm_dados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 If frm_treeativ <> nil then
    frm_treeativ.Origem_dados := rgb.ItemIndex;
  frm_dados    := nil;
  action := caFree;
end;

procedure Tfrm_dados.rgbClick(Sender: TObject);
begin
 { if rgb.ItemIndex = 0 then
     raise exception.create(mens39)
  else    }
    begin
      close;
    end;
end;
procedure Tfrm_dados.LoadConstantObj;
  Begin
   caption :=  def8882 ;//origem dos dados
   rgb.caption := def67200      ;//procura os dados
   rgb.items[0] := def650      ;//em bancos de dados
   rgb.items[1] := def6500      ;//enos objetos de negócio
   end;


end.
