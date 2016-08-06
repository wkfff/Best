unit bst_lista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Menus, ComCtrls, Buttons, StdCtrls, ExtCtrls,db,dbTables,
  cls_utils,BstDB, gtQrCtrls,cls_obj,bst_basefrm, ActnList, ImgList,
  ToolWin;

type
  Tfrm_lista = class(TBaseFrm)
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Detalhes1: TMenuItem;
    Edit1: TEdit;
    lb_lista: TTreeView;
    Label1: TLabel;
    Edit2: TEdit;
    pan1: TPanel;
    SpeedButton3: TSpeedButton;
    sp_detalhe: TSpeedButton;
    sp_confirm: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pan2: TPanel;
    SpeedButton2: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Editar: TAction;
    Escolher: TAction;
    Imprimir: TAction;
    Sair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure lb_listaDblClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure lb_listaClick(Sender: TObject);
    procedure lb_listaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    FCliente: integer;
    FCenario: integer;
    FLista: TTreeView;
    FId: Integer;
    FAutoFecha: Boolean;
    FCancela: boolean;
    FOperacao: integer;
    FitabPesq: Tdados_tab;
    procedure SetCenario(const Value: integer);
    procedure SetCliente(const Value: integer);
    procedure SetLista(const Value: TTreeView);
    procedure SetId(const Value: Integer);
    procedure SetAutoFecha(const Value: Boolean);
    procedure SetCancela(const Value: boolean);
    procedure SetOperacao(const Value: integer);
    procedure SetitabPesq(const Value: Tdados_tab);
    
    { Private declarations }
  public
    { Public declarations }
  published
   property Cliente : integer read FCliente write SetCliente;
   property Cenario : integer read FCenario write SetCenario;
   property Id      : Integer read FId write SetId;
   property Tree    : TTreeView read FLista write SetLista;
   property AutoFecha : Boolean read FAutoFecha write SetAutoFecha;
   property Cancela  : boolean read FCancela write SetCancela;
   property itabPesq : Tdados_tab read FitabPesq write SetitabPesq;
    procedure LoadconstantObj;override;
  end;

var
  frm_lista: Tfrm_lista;
  pesq : string;
implementation

uses bst_main, bst_ap, bst_ca, bst_en, bst_regra, bst_pessoa, bst_se,
     bst_lf, bst_ev, bst_aspectos, bst_data, bst_de, bst_plista,
  bst_treeAtiv;


{$R *.DFM}

procedure Tfrm_lista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure Tfrm_lista.DBGrid1DblClick(Sender: TObject);
begin
 If autoFecha then
     close;
end;

procedure Tfrm_lista.BitBtn2Click(Sender: TObject);
begin
  iTabPesq.ListaCanc := true;
  If  frm_main.itab <> nil then
      frm_main.itab.ListaCanc := true;

  lb_lista.Selected := nil;
     
  close;
  frm_main.wfecha := false;
end;


procedure Tfrm_lista.SpeedButton1Click(Sender: TObject);
var
 i : integer;
begin
  If frm_plista = nil then
     frm_plista := tfrm_pLista.create(self);


     //frm_Plista.pr_cli.caption  := frm_main.lb_cli.caption;
     //frm_Plista.pr_proj.caption := frm_main.lb_cen.caption;
     //frm_plista.titulo.caption  := caption;
     for i := 0 to lb_lista.Items.Count - 1 do
      Begin
       frm_plista.pSt.Lines.Add(lb_lista.Items[i].Text);
      end;


  //frm_plista.qrp.preview;
  //frm_plista.close;
end;

procedure Tfrm_lista.Edit1Change(Sender: TObject);
begin
lb_lista.selected := (locate_data(lb_lista,edit1.Text) as TTReeNode);

 activeControl := edit1;
end;

procedure Tfrm_lista.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key=VK_ESCAPE) and (activeControl = edit1) then //escape
      begin
        edit1.text := '';
        ActiveControl := edit1;
      end;
end;

procedure Tfrm_lista.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 { If key = chr(13) then //enter
      begin
        DBGrid1DblClick(frm_lista);
      end;   }
end;

procedure Tfrm_lista.DBGrid1ColEnter(Sender: TObject);
begin
   activecontrol := edit1;
end;

procedure Tfrm_lista.FormActivate(Sender: TObject);
begin
  activeControl := lb_lista;
end;

procedure Tfrm_lista.DBGrid1CellClick(Column: TColumn);
begin
  activecontrol := edit1;
end;

procedure Tfrm_lista.lb_listaDblClick(Sender: TObject);
begin
  DBGrid1DblClick(lb_lista);
end;

procedure Tfrm_lista.SetCenario(const Value: integer);
begin
  FCenario := Value;
end;

procedure Tfrm_lista.SetCliente(const Value: integer);
begin
  FCliente := Value;
end;

procedure Tfrm_lista.SetLista(const Value: TTreeView);
begin
  FLista := Value;
end;

procedure Tfrm_lista.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure Tfrm_lista.SetAutoFecha(const Value: Boolean);
begin
  FAutoFecha := Value;
end;

procedure Tfrm_lista.SetCancela(const Value: boolean);
begin
  FCancela := Value;
end;

procedure Tfrm_lista.SetOperacao(const Value: integer);
begin
  FOperacao := Value;
end;

procedure Tfrm_lista.Image1Click(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure Tfrm_lista.Image2Click(Sender: TObject);
begin
DBGrid1DblClick(nil);
end;

procedure Tfrm_lista.Image3Click(Sender: TObject);
begin
 DBGrid1DblClick(nil);
end;

procedure Tfrm_lista.Image4Click(Sender: TObject);
begin
  SpeedButton1Click(nil);
end;

procedure Tfrm_lista.SpeedButton2Click(Sender: TObject);
begin
  If frm_Treeativ <> nil then
   Begin
    close;
   end;
end;

procedure Tfrm_lista.Image5Click(Sender: TObject);
begin
  SpeedButton2Click(nil);
end;

procedure Tfrm_lista.SetitabPesq(const Value: Tdados_tab);
begin
  FitabPesq := Value;
end;

procedure Tfrm_lista.SpeedButton3Click(Sender: TObject);
begin
  BitBtn2Click(nil);
end;

procedure Tfrm_lista.lb_listaClick(Sender: TObject);
begin
 // edit1.Text := '';

end;

procedure Tfrm_lista.lb_listaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   If (Key=VK_UP) OR(Key=VK_DOWN) then
    exit
  else
  If (Key=VK_ESCAPE)  then
      edit1.text := ''
  else
  If (activeControl = lb_lista) then
      begin
           // activecontrol := edit3;
            //edit1.text    := char(key);
            //edit1.SelStart :=1;
      end;
end;

procedure Tfrm_lista.LoadconstantObj;
 Begin
   speedbutton2.caption := def6720       ;//Procura  nos Diagramas
   sp_detalhe.caption  := def71       ; //Editar
   sp_confirm.caption  :=  def904       ;//Escolher
   speedbutton1.caption := def761       ;//Pimprimir
   speedbutton3.caption :=  def901       ;//sair
 end;

procedure Tfrm_lista.FormShow(Sender: TObject);
begin
 inherited;
 // Ling(frm_main.Idioma,self);
end;

end.
