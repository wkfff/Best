unit des_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,db,dbTables,  Buttons, ExtCtrls, StdCtrls, FileCtrl,
  ComCtrls, OleCtrls, AxCtrls,DBCtrls, ImgList, cls_bd, ADODB,BSTDB, DBClient,cls_obj,
  cls_utils,strutils,bst_telaobj,duallist, gtQrCtrls,fonctions;

type
  Tfrm_desmain = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_desmain: Tfrm_desmain;

implementation

uses bst_main, bst_dm_rel;

{$R *.dfm}

procedure Tfrm_desmain.FormCreate(Sender: TObject);
begin
  try
   //   frm_main := TFrm_main.create(self);
      begin
        If bdx = nil then
           bdx := TBd.create(true,true,false);
      end;
     except
      begin
         freeandnil(bdx);
         raise;
         showmessage('Não foi possível abrir o Banco de dados!'+#13+'Verificar as Configurações!'+#13+'Acesse o sistema e clique no item de menu "Repositórios".');
      end;
     end;
     bdx.Connected := false;
     bdx.Mode := (cmShareExclusive);
end;

procedure Tfrm_desmain.SpeedButton2Click(Sender: TObject);
begin
  begin
  freeandnil(BDx);
  BDx := TBD.Create(true,true,false);
end;
end;

procedure Tfrm_desmain.SpeedButton1Click(Sender: TObject);
var
wrow : integer;
begin

//  edit1.Text := bdx.ConnectionString;
  with TAdoquery.create(self) do
   Begin
    connection := bdx;
    sql.add('UPDATE SUB_SUBORDINACAO ');
    sql.add('SET GRID_COR = 0 ');
    execsql;
    If rowsaffected = 0 then
      Begin
      showmessage('Não foi possível desbloquear!');
    // wrow := rowsaffected;
    //  showmessage(inttostr(wrow));
      free;
      end
    else
      begin
        showmessage('Desbloqueado com sucesso!');
      end;
   end;
end;

end.
