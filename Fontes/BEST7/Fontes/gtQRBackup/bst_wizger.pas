unit bst_wizger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, Buttons, ToolWin, Mask, ExtCtrls,bst_objetos,bstdb,dbtables,db,
  strUtils,cls_obj,cls_codigo,fonctions, ADODB,bst_Basefrm;

type
  Tfrm_wizger = class(TForm)
    pgc: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pan: TPanel;
    bt_voltar: TSpeedButton;
    bt_concluir: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_avancar: TSpeedButton;
    tb1: TTabSheet;
    procedure bt_avancar1Click(Sender: TObject);
    procedure bt_voltar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tb1Enter(Sender: TObject);
    procedure bt_cancelar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const WMarc: array[1..6] of sTRING = ('{Início Classe ', '{Fim Classe ', '{Início Métodos ','{Fim Métodos ','{Início Set Values ','{Fim Set Values ');


var
  frm_wizger: Tfrm_wizger;

implementation

uses bst_main, bst_log, bst_dir1;

{$R *.DFM}

procedure Tfrm_wizger.bt_avancar1Click(Sender: TObject);
begin
  If pgc.ActivePage.PageIndex < pgc.Pagecount - 1  then
     pgc.selectnextPage(true)
  ELSE
     close;
end;

procedure Tfrm_wizger.bt_voltar1Click(Sender: TObject);
begin
  If pgc.ActivePage.PageIndex > 0 then
     pgc.selectnextPage(false);
end;

procedure Tfrm_wizger.FormCreate(Sender: TObject);
begin
  idados      :=  TIdf_cs.create(self);
  iDad        :=  TDad.create(self);
   If CurrEmpresa = nil then
      frm_main.SpeedButton10Click(frm_main) ;
   frm_main.wfecha := true;
   If not frm_main.canc_cli then
       Begin
        cliente := CurrEmpresa.cenarios.CLI_ID ;
        Cenario := CurrEmpresa.Cenarios.PRJ_ID ;

       end;

   frm_main.wfecha  := true;
   wtext := TstringList.create;
   wList := TstringList.create;




   bt_voltar.left   := pan.left + 10;
   bt_avancar.left  := pan.left + (pan.width - 110);
   bt_concluir.left := pgc.left + (pgc.width - 110);
   bt_cancelar.left := pan.left + ((pan.width - bt_cancelar.width) div 2);
   pgc.ActivePageIndex := 0;
   
end;

procedure Tfrm_wizger.tb1Enter(Sender: TObject);    begin
   If pgc.ActivePageIndex = pgc.PageCount - 1 then
      begin
        bt_voltar.visible := true;
        bt_avancar.visible := false;
        bt_concluir.visible := true;
      end
   else
   If pgc.ActivePageIndex = 0 then
      begin
        bt_voltar.visible := false;
        bt_avancar.visible := true;
        bt_concluir.visible := false;
      end
  else
      begin
        bt_voltar.visible := true;
        bt_avancar.visible := true;
        bt_concluir.visible := false;
      end;
 
end;

procedure Tfrm_wizger.bt_cancelar1Click(Sender: TObject);
begin
  close;
end;

end.
