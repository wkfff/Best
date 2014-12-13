unit bst_lf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, Grids, DBGrids, DBCtrls, Mask,
  ImgList, Buttons, ToolWin, ExtCtrls, Menus, QuickRpt, Qrctrls, cls_utils, 
  cls_obj, bstdb, bst_Basefrm, ActnList;

type
  Tfrm_lf = class(Tfrm_obj)
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBRichEdit1: TDBRichEdit;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Memo1: TMemo;
    DBEdit3: TDBEdit;
    //procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    //procedure SpeedButton5Click(Sender: TObject);
procedure LoadCOnstantObj;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lf: Tfrm_lf;

implementation

uses bst_plf, bst_main, BST_pdmig;

{$R *.dfm}

procedure Tfrm_lf.LoadCOnstantObj;
var
i :integer;
begin
  inherited;
  Caption := def30;//'Local de Processamento'  ;
  Label3.Caption := def10005;//'Nome' ;
  Label2.Caption := defl3;//'Localização Física'  ;
  Label1. Caption := def39;//'Descrição'  ;
  TabSheet1.Caption := def11231;//'Métrica'  ;
  Label4.Caption := defc5;//'Custo Anual' ;

  
  
end;

{procedure Tfrm_lf.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;}

procedure Tfrm_lf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
frm_lf  := nil;
action := caFree;
end;

procedure Tfrm_lf.FormShow(Sender: TObject);
begin
  inherited;
  tb_dados.TabVisible := false;
  lv.Columns[1].Width := 0;
  lv.Column[0].Width := 490;
end;

procedure Tfrm_lf.sp_printClick(Sender: TObject);
var
 i : integer;
 iAp : TDados_tab;
begin
  inherited;
  If frm_pLf = nil then
    frm_pLf := tfrm_pLf.create(self);

    try
     iaP := Tdados_tab.create(self);
     iaP.Get_PaisCorrelatos(Cliente,cenario,'AP',Id,'LF','IDF_AP','');
     frm_pLf.qr_at.dataset := iAp;
     qrDataset(frm_pLf.qr_at,iAp);

     frm_pLf.qrp.DataSet := iDataSource.DataSet;

     with frm_pLf do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_pLf.Components[i],idatasource.dataset);
          end;
      end;
      frm_pLf.titulo.caption := def30;
      //frm_pLf.subtitulo.caption := dbedit6.text;
      frm_pLf.qrp.preview;
      FRM_pLf.CLOSE;
    finally

    end;
end;


{procedure Tfrm_lf.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  CLOSE;
end;}

end.
