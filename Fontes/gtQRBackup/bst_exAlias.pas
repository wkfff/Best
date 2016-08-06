unit bst_exAlias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, gtQrCtrls;

type
  Tfrm_exalias = class(TForm)
    Label1: TLabel;
    drv: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_exalias: Tfrm_exalias;

implementation

uses bst_explor1;



{$R *.DFM}

procedure Tfrm_exalias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_exalias := nil;
  action := caFree;
end;

procedure Tfrm_exalias.Button1Click(Sender: TObject);
var
indtv : TtreeNode;
begin
  try
    begin
      indtv := frm_explor1.tv.items.add(nil,uppercase(frm_exalias.edit1.text));
      frm_explor1.tv.alphasort;
      frm_explor1.tv.selected := indTv;
      frm_explor1.edit1.text := Edit1.text;
      If edit1.text = '' then
         raise exception.create('Informar a Alias');
      If drv.text = '' then
         raise exception.create('Informar Tipo de banco de Dados');
      If wprm <> nil then
         wprm.Clear
      else
         wprm := Tstringlist.create;
      drv_atu := drv.text;
      If drv_atu = 'STANDARD' then
         begin
           frm_explor1.session1.AddStandardAlias(frm_exalias.edit1.text,' ','Paradox');
         end
      else
        frm_explor1.session1.AddAlias(frm_exalias.edit1.text,drv_atu,wprm);
      frm_explor1.session1.GetAliasParams(frm_explor1.tv.selected.text,wprm);
      
      frm_explor1.drvChange(frm_exalias);
      frm_explor1.tv.selected := indtv;
      frm_explor1.session1.saveconfigfile;
      close;
    end;
  except
    begin
      raise;
    end;
  end;
  
end;

procedure Tfrm_exalias.FormCreate(Sender: TObject);
begin
  frm_explor1.session1.GetDriverNames(drv.items);
end;

end.
