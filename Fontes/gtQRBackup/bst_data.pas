unit bst_data;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  ImgList, Buttons, ToolWin, ExtCtrls,cls_obj,bstdb, Menus,
  Qrctrls,cls_utils, QuickRpt, gtQrCtrls, ActnList;

type
  Tfrm_data = class(Tfrm_obj)
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    dbmemo1: TDBRichEdit;
    cmb_tempo: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    cmb_midia: TDBLookupComboBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Button1: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure cmb_tempoCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbg_dgDblClick(Sender: TObject);
  private
    FiDe: Tdados_tab;
    FiDado: Tdados_tab;
    procedure SetiDado(const Value: Tdados_tab);
    procedure SetiDe(const Value: Tdados_tab);
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  published
   property iDado : Tdados_tab read FiDado write SetiDado;
   property iDe : Tdados_tab read FiDe write SetiDe;

  end;

var
  frm_data: Tfrm_data;

implementation

uses bst_treeAtiv, BST_pdata, bst_main, bst_de, ADODB, bst_ExecutaQuery,
  UfrmViewED;

{$R *.dfm}

procedure Tfrm_data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_data  := nil;
  action := caFree;
end;

procedure Tfrm_data.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_data.FormCreate(Sender: TObject);
var
Tempo : TDominios;
Midia : TDominios;
begin
  inherited;
  try

    tempo := Tdominios.create(self);
    tempo.Open_Dominio('TEM',frm_main.Idioma);
    cmb_tempo.ListSource := tempo.DataExt;

    Midia:= Tdominios.create(self);
    Midia.Open_Dominio('MID',frm_main.Idioma);
    cmb_midia.ListSource := Midia.DataExt;
  finally

  end;

end;



procedure Tfrm_data.FormShow(Sender: TObject);

begin
  inherited;
   tb_atv.TabVisible := false;
  // If frm_treeativ <> nil then
    Begin
        with Tcenario.create(self) do
         Begin
           open_cenario(self.Cliente,self.Cenario);
           edit1.Text := PRJ_PATH;

           free;
         end;
        
    end;


end;

procedure Tfrm_data.sp_printClick(Sender: TObject);
var
iTab : Tdados_tab;
i : integer;
begin
  inherited;
  If frm_pData = nil then
    frm_pData := tfrm_pData.create(self);

    try
      iTab := Tdados_tab.create(self);
      frm_pData.qr_de.dataset := iTab;
      qrdataset(frm_pData.qr_de,iTab) ;
      iTab.Get_Correlatos(Cliente,cenario,'DG',Id,'DE','IDF_DE');

      with frm_pData do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],idatasource.dataset);
          end;


      //qrp.dataset := idatasource.dataset;

      //titulo.caption     :=uppercase(def9);
      //subtitulo.caption  := dbedit5.Text;
      //qRP.preview;
      close;
      end;

    finally
      freeandnil(iTab);
    end;

end;



procedure Tfrm_data.SetiDado(const Value: Tdados_tab);
begin
  FiDado := Value;
end;

procedure Tfrm_data.SetiDe(const Value: Tdados_tab);
begin
  FiDe := Value;
end;

procedure Tfrm_data.cmb_tempoCloseUp(Sender: TObject);
begin
  inherited;
  edit1.text := cmb_tempo.Text;
end;

procedure Tfrm_data.Loadconstantobj;
var
i : integer;

begin
  Caption := def9;//'Input/Output' ;
  Label9.Caption := def10005;//'Nome/Name' ;
  Label5.Caption := def39;//'Descrição/Description'  ;
  Label4.Caption := defM2;// 'Midia/Media'  ;
  Label1. Caption := defp5;//'por/per' ;

end;

procedure Tfrm_data.Button1Click(Sender: TObject);
var
itab : Tdados_tab;
wid : integer;
wcat, Tipe, Query : string;
Client, Projeto, SelfId, Cod : integer;
begin

  //inherited;
  //If frm_de = nil then
  //Begin
  //   frm_de := tfrm_de.create(self);
  //   frm_de.idatasource := dbg_dg.DataSource;
  //   frm_de.dbg_de.DataSource := dbg_dg.DataSource;
  //End;
  //frm_de.showmodal;
end;

procedure Tfrm_data.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Excluir1Click(sender);
  //Tfrm_obj.Excluir1Click(sender);
end;

procedure Tfrm_data.dbg_dgDblClick(Sender: TObject);
Var
  wid : integer;
begin
  inherited;
   wid := StrToInt(dbg_dg.Columns[9].Field.Value);
   frmViewED.CarregaItem(wid);
   frmViewED.Show;
end;

end.

