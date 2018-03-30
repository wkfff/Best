unit bst_pessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, Mask, DBCtrls, ImgList,
  Buttons, ToolWin, ExtCtrls, Menus, Grids, bstdb, Qrctrls, QuickRpt,cls_utils,
  DBGrids, ActnList;

type
  Tfrm_pessoa = class(Tfrm_obj)
    Label6: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadCOnstantObj;override;
  end;

var
  frm_pessoa: Tfrm_pessoa;
  iAtor : TDados_tab;
implementation

uses bst_ppessoa, bst_pca, bst_treeAtiv, bst_main, bst_ca;

{$R *.dfm}

procedure Tfrm_pessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  freeandnil(iAtor);
  frm_pessoa  := nil;
  action := caFree;
end;

procedure Tfrm_pessoa.FormShow(Sender: TObject);
begin
  inherited;
  tb_atv.TabVisible   := false;
  tb_dados.TabVisible := false;
  with Tcenario.create(self) do
  begin
    open_cenario(self.Cliente,self.Cenario);
    edit1.Text := PRJ_PATH;

    free;
  end;
end;

procedure Tfrm_pessoa.sp_printClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  If frm_ppessoa = nil then
    frm_ppessoa := tfrm_ppessoa.create(self);

    try
      frm_ppessoa.qrp.DataSet := iDataSource.DataSet;

      with frm_ppessoa do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_ppessoa.Components[i],idatasource.dataset);
          end;
      end;
      frm_Ppessoa.titulo.caption := uppercase(def59);
      frm_Ppessoa.subtitulo.caption := dbedit6.text;
      frm_ppessoa.qrp.preview;
      FRM_Ppessoa.CLOSE;
    finally

    end;
end;

procedure Tfrm_pessoa.pgcpChange(Sender: TObject);
var
wcli,wproj,wcod : integer;
begin
  inherited;
     { TODO -c6.00.26 : Novo ; aba com classes de atores a qual pertence a pessoa }
  If pgcp.ActivePage = TabSheet1 then
   Begin
     iAtor :=  TDados_tab.create(self);
     dbgrid1.DataSource := iAtor.DataExt;
     wcli  := dbedit6.DataSource.DataSet.fieldbyname('CLI_ID').asinteger;
     wPROJ := dbedit6.DataSource.DataSet.fieldbyname('PRJ_ID').asinteger;
     WcOD  := Dbedit6.DataSource.DataSet.fieldbyname('idf_codigo').asinteger;
     iAtor.Get_PaisCorrelatos(wcli,wproj,'CA',wcod,'PS','IDF_CA','');
   end;
end;

procedure Tfrm_pessoa.DBGrid1DblClick(Sender: TObject);
var
ipessoa : TDados_tab;
wcod : Integer;
begin
  inherited;
  If dbgrid1.SelectedRows = nil then
      exit;
  wcod := dbgrid1.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger;
  If wcod = 0 then
   exit;
   iPessoa :=  Tdados_tab.create(self);
   with iPessoa  do
   begin

     If not Open_Objeto(Cliente,Cenario,wCod,'IDF_CA') then
         raise exception.Create(EI1);
   end;
   If frm_CA   = nil then
      frm_CA := tfrm_CA.Create(self);
   with frm_CA do
    begin
       Tipo        := 'CA';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := ipessoa.DataExt;
       showmodal;
       freeandnil(iPessoa);
    end;
end;

procedure Tfrm_pessoa.LoadCOnstantObj;
var
i :integer;
begin
  Caption := def59;//'Pessoa'
  Label6.Caption := def10005;//'Nome'
  Label2.Caption := defc8;//'Cargo'
  Label3.Caption := 'CBO'  ;
  Label4.Caption := defc5;//'Custo '
  Label7.Caption := deft2;//'Tempo Contratação'
  Label1.Caption := defp5;//'por'
  Label5.Caption := 'E-Mail' ;
  Label8.Caption := deft3;//'Telefone'
  Label9.Caption := defc9;//'Celular'
  Label10.Caption := '('+DEFA15 +'(s))';//'anos'
  DBRadioGroup1.Caption := defs3 ;//'Sexo'
  DBRadioGroup1.Items[0] := defm3     ;//  'Masculino'
  DBRadioGroup1.Items[1] := deff2;//     ;//  'Feminino'
  TabSheet1.Caption := def51;//'Classes de Ator a qual pertence'





    
end;
procedure Tfrm_pessoa.sp2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
