unit bst_impdim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_prim, StdCtrls, Buttons, DBCtrls,bstdb,cls_obj, ComCtrls,
  ExtCtrls, TPCProgressBars;

type
  Tfrm_impdim = class(Tprim)
    pgc: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    trv_cli: TTreeView;
    Label2: TLabel;
    pan_de: TPanel;
    trv_cende: TTreeView;
    Label4: TLabel;
    pan_ate: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    trv_dim: TTreeView;
    Label3: TLabel;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit1: TEdit;
    trv_cenate: TTreeView;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lb_tab: TListBox;
    //pb: TPCProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trv_cliClick(Sender: TObject);
    procedure trv_cendeClick(Sender: TObject);
    procedure trv_cenateClick(Sender: TObject);
    procedure spb1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FiCenario: Tcenario;
    FiCli: TEmpresa;
    FITab: Tdados_tab;
    Fcende_sel: integer;
    Fcli_sel: integer;
    Fcenate_sel: integer;
    procedure SetiCenario(const Value: Tcenario);
    procedure SetiCli(const Value: TEmpresa);
    procedure SetITab(const Value: Tdados_tab);
    procedure Setcenate_sel(const Value: integer);
    procedure Setcende_sel(const Value: integer);
    procedure Setcli_sel(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
  published
   property iCli : TEmpresa read FiCli write SetiCli;
   property iCenario : Tcenario read FiCenario write SetiCenario;
   property ITab : Tdados_tab read FITab write SetITab;
   property cli_sel : integer read Fcli_sel write Setcli_sel;
   property cende_sel  : integer read Fcende_sel write Setcende_sel;
   property cenate_sel : integer read Fcenate_sel write Setcenate_sel;
   procedure LoadConstantObj;override;

  end;

var
  frm_impdim: Tfrm_impdim;

implementation

uses bst_main;

{$R *.dfm}

procedure Tfrm_impdim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_impdim := nil;
  action := caFree;
end;

procedure Tfrm_impdim.SetiCenario(const Value: Tcenario);
begin
  FiCenario := Value;
end;

procedure Tfrm_impdim.SetiCli(const Value: TEmpresa);
begin
  FiCli := Value;
end;

procedure Tfrm_impdim.SetITab(const Value: Tdados_tab);
begin
  FITab := Value;
end;

procedure Tfrm_impdim.FormCreate(Sender: TObject);
begin
  inherited;
  iCli :=   TEmpresa.create(self);
  iTab :=  TDados_tab.create(self);
  pgc.ActivePage := tabsheet1;

end;

procedure Tfrm_impdim.FormShow(Sender: TObject);
begin
  inherited;
  iCli.Open_All;
  iCli.Cria_lista(trv_cli,false,true);
end;

procedure Tfrm_impdim.trv_cliClick(Sender: TObject);
begin
  inherited;
  If trv_cli.Selected <> nil then
   Begin
      trv_cende.Items.clear;
      iCli.cenarios.Open_Cenarios(strtoint(uObj(trv_cli.selected.data)^.Fcodigo)) ;
      iCli.cenarios.Cria_lista(trv_cende,false,true);
      cli_sel := strtoint(uObj(trv_cli.selected.data)^.Fcodigo);

      pgc.SelectNextPage(true);
   end;

end;

procedure Tfrm_impdim.trv_cendeClick(Sender: TObject);
var
i : integer;
begin
  inherited;
  If trv_cende.Selected <> nil then
   Begin
      pgc.SelectNextPage(true);
      trv_cenate.Items.Clear;
      for i := 0 to trv_cende.Items.Count - 1 do
       Begin
        If not trv_cende.Items[i].Selected then
         Begin

           trv_cenate.Items.AddObject(nil,trv_cende.Items[i].text,trv_cende.Items[i].data) ;

         end;
       end;
     cende_sel := strtoint(uObj(trv_cende.selected.data)^.Fcodigo)  ;
   end;


end;

procedure Tfrm_impdim.trv_cenateClick(Sender: TObject);
begin
  inherited;
  If trv_cenate.Selected <> nil then
   Begin
     edit1.text := def67210 {'Cliente}+' : '+ trv_cli.selected.text +' - '+ defc29{Cenário Origem}+' : '+ trv_cende.Selected.Text
                 +'  '+defc30{' - Cenário Destino}+' : '+ trv_cenate.Selected.Text;
     cenate_sel := strtoint(uObj(trv_cenate.selected.data)^.Fcodigo)  ;
     pgc.SelectNextPage(true);
   end;


end;

procedure Tfrm_impdim.spb1Click(Sender: TObject);
begin
  inherited;
  If (trv_cli.Selected = nil) or (trv_cende.Selected = nil)  or(trv_cenate.Selected = nil)
     or (trv_dim.Selected = nil)then
     Raise exception.create(mens122);

  If MessageDlg(def777, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
end;

procedure Tfrm_impdim.Setcenate_sel(const Value: integer);
begin
  Fcenate_sel := Value;
end;

procedure Tfrm_impdim.Setcende_sel(const Value: integer);
begin
  Fcende_sel := Value;
end;

procedure Tfrm_impdim.Setcli_sel(const Value: integer);
begin
  Fcli_sel := Value;
end;

procedure Tfrm_impdim.SpeedButton3Click(Sender: TObject);
var
i : integer;
begin
  inherited;
  //pb.visible := true;
  //pb.Position := 0;
  //pb.Max      := trv_dim.Items.Count -1;
  If cende_sel = cenate_sel then
   Raise exception.create(mens123);
  for i := 0 to trv_dim.Items.Count -1 do
   Begin
     If trv_dim.Items[i].Selected then
      Begin
       iTab.Exporta_Dim(cli_sel,cende_sel,cli_sel,cenate_sel,lb_tab.Items[i]);
       //pb.Position := pb.position + 1;
      end;

   end;
   //pb.Position := 0;
   edit1.Text := defe19 ;//'Exportação Concluida! ';
end;

procedure Tfrm_impdim.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  pgc.SelectNextPage(false);
end;

procedure Tfrm_impdim.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  pgc.SelectNextPage(false);
end;

procedure Tfrm_impdim.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  pgc.SelectNextPage(false);
end;



procedure Tfrm_impdim.LoadConstantObj;
begin
  inherited;
  Caption                  := defe18;//'Exportação de Dimensões' ;
  Label2.Caption           := def65;//'Clientes'  ;
  SpeedButton1.Caption     := defv1;//'Voltar'  ;
  Label4.Caption           := defc29;//'Cenários Origem' ;
  SpeedButton2.Caption     := defv1;//'Voltar' ;
  Label1.Caption           := defc30;//'Cenários Destino' ;
  SpeedButton3.Caption     := defc31;//'Concluir' ;
  SpeedButton5.Caption     := defv1;//'Voltar'  ;
  Label3.Caption           := defd1;//'Dimensões' ;

  trv_dim.Items[0].Text    := def10;//atores;
  trv_dim.Items[1].Text    := def13;//pessoas;
  trv_dim.Items[2].Text    := def9;//fluxos de dados;
  trv_dim.Items[3].Text    := def26;//elementos de dados;
  trv_dim.Items[4].Text    := def5;//regras de negócio;
  trv_dim.Items[5].Text    := def48;//locais de processamento;



end;

end.
