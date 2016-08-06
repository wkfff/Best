unit bst_diversos;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, bstdb, ComCtrls, bst_dm_rel,
  ActnList, ImgList, ToolWin;

type
  Tfrm_diversos = class(TBaseFRm)
    SpeedButton2: TSpeedButton;
    cl: TRadioGroup;
    mem_dom: TMemo;
    SpeedButton1: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Confirmar: TAction;
    Sair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_diversos: Tfrm_diversos;
  Dclasse : array[1..9] of string;
  Wtip    : string;

const aDominios: array[0..15] of sTRING = ('TEM','COM','PRI','SIT','MID','PAP','IMP',
                                      'VIS','NOR','DIM','CLS','PRP','FMT','TIM','BIN','DIR');
implementation

uses bst_main;


{$R *.DFM}

procedure Tfrm_diversos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
inherited;
 frm_diversos := nil;
 action       := cafree;
end;


procedure Tfrm_diversos.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_diversos.FormCreate(Sender: TObject);
begin
  If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
  begin
     speedButton2.visible := false;
     ToolButton1.Enabled := false
  end;
  Dominios := Tdominios.create(self);
end;



procedure Tfrm_diversos.clClick(Sender: TObject);
begin

  dominios.Open_Dominio(aDominios[cl.ItemIndex],frm_main.Idioma) ;
  mem_dom.clear;
  with dominios do
   begin
    while not eof do
     begin
      mem_dom.Lines.Add(dominios.fieldbyname('DI_DESCRICAO').AsString);
      next;
     end;
   end;
 // dominios.Cria_lista(trv_dom,false);

end;

procedure Tfrm_diversos.SpeedButton2Click(Sender: TObject);
begin
  dominios.Atualizar(aDominios[cl.ItemIndex],frm_main.Idioma,mem_dom);
end;

procedure Tfrm_diversos.Loadconstantobj;
var
i : integer;

begin
  Caption :=  def55;//'Domínios'  ;
  SpeedButton2.Hint :=def903;// 'Refresh'   ;
  SpeedButton2.Caption :=def903;// 'Refresh'   ;
  SpeedButton1.Caption := def901;//'Sair ' ;
  CL.Items[0]   :=  defU1;// 'Unidades de tempo/Time Unit'   ;
  CL.Items[1]   :=  defc7;// 'Complexidade/Complexity'  ;
  CL.Items[2]   :=   defp3;// 'Prioridade/Priority'   ;
  CL.Items[3]   :=  defS2;// 'Situação/Situation'  ;
  CL.Items[4]   :=  defM2;// 'Mídia/Media'     ;
  CL.Items[5]   :=   defp1;//'Papel do Ator/Actor Role' ;
  CL.Items[6]   :=   def12200;//'Implementação/Implementation' ;
  CL.Items[7]   :=   defp4;//'Ponto de Vista/Point of View' ;
  CL.Items[8]   :=   defn1;//'Norma/Policy'        ;
  CL.Items[9]   :=   defD1;//;'Dimensões/Dimensions'  ;
  CL.Items[10]  :=   def23;//'Classe/Class'      ;
  CL.Items[11]  :=   def91130;//'Propriedades/Properties'  ;
  CL.Items[12]  :=  defF1;// 'Formato Dado/Data Format' ;
  CL.Items[13]  :=  deft1;// 'Tipo Método/Method'  ;
//  CL.Items[14]  :=   'Binding'    ;
  CL.Items[15]  :=    defd2;//'Diretivas/Directives';


 
end;

end.

