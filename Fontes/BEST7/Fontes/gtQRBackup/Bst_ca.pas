unit bst_ca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, StdCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, Mask,
  ComCtrls, ImgList, Buttons, ToolWin,cls_obj,bstdb, Menus,Qrctrls,QuickRpt,cls_utils, gtQrCtrls,bst_basefrm,
  ActnList;

type
  Tfrm_ca = class(Tfrm_obj)
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBRichEdit1: TDBRichEdit;
    dbrg: TDBRadioGroup;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit9: TDBEdit;
    Panel1: TPanel;
    Label8: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBMemo6: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo1: TDBMemo;
    DBMemo7: TDBMemo;
    TabSheet3: TTabSheet;
    trv_pessoa: TTreeView;
    sp_Lista: TSpeedButton;
    SP_CRIA: TSpeedButton;
    SpeedButton13: TSpeedButton;
    cmb: TComboBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    //procedure BitBtn1Click(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure sp_ListaClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SP_CRIAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure cmbClick(Sender: TObject);
    procedure trv_pessoaDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lvDblClick(Sender: TObject);
    procedure LoadCOnstantObj;override;
    procedure sp2Click(Sender: TObject);
  private

    { Private declarations }
  public
  procedure IMprime(pTipo: string);
    { Public declarations }
  end;

var
  frm_ca: Tfrm_ca;
   iPessoa : Tdados_tab;

implementation

uses bst_main, bst_pessoa, bst_pca, bst_cimp, bst_patorat;

{$R *.dfm}

procedure Tfrm_ca.LoadCOnstantObj;
var
i :integer;
begin
  inherited;

  Caption := def1000;//'Ator' ;
  Label4.Caption := def10005;//'NomeName'  ;
  Label5.Caption := def39;//'Descrição/Description'   ;
  Label1. Caption := defp1;//'Papel do Ator/Actor Role' ;
  Label2.Caption := def882;//'Categoria/Category'  ;
  dbrg.Caption   :=  ''    ;// Tipo de Ator/Actor Kind'
  dbrg.Items[0]  := def111      ; // 'Entidade externa/External Entity'
  dbrg.Items[1]  := defc2      ; //   Classe de Pessoas/People Class'
  dbrg.Items[2]  :=  def53     ; // 'Unidade Organizacional/BU')
  TabSheet2.Caption := def91130;//'Propriedades'    ;
  TabSheet3.Caption := def13;//'pessoas'    ;
  groupBox1.Caption  := defd1      ;//  'Dimensões'

  //      Label10.Caption := def500  ;//'Jornada padrão em horas' ;
  //      Label7. Caption := 'Efetivo da Classe' ;
  //     Label11.Caption := 'Qtde de Turnos'  ;
       Label8. Caption := def8000;//'Formação escolar' ;
       Label12.Caption := defc1    ;//'Conhecimentos específicos'  ;
       Label9.Caption := defc3  ;//'Competência Intelectual'   ;
       Label13.Caption := defe2 ;//'Experiência'  ;
       Label14.Caption := defr1   ;//'Responsabilidades' ;
       Label15.Caption := defc4   ;//'Condições de Trabalho' ;
       //sp_Lista.Caption := def102;//'Lista      '   ;
       SP_CRIA. Caption :=   def850;//'Criar        '  ;

       SpeedButton13.Hint :=  def84;//'Eliminar registro' ;
       SpeedButton13. Caption := def84;//'Excluir     ' ;
      TabSheet1.Caption := def11231;//'Métrica'  ;
      GroupBox2. Caption := defi2 ;//'Indicadores'  ;
      Label3.Caption := defe3;//'Efetivo da Classe'  ;
      Label6.Caption := def500 ;//'Jornada padrão em horas';
      Label16.Caption := defq1  ;// 'Qtde de Turnos'    ;
      Label17.Caption := defh1 ;//'Horas Trabalhadas por Ano' ;
      Label18.Caption := defc5;//'Custo Anual ' ;

end;

procedure Tfrm_ca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  freeandnil(iPessoa);
  frm_ca  := nil;
  action := caFree;

end;

procedure Tfrm_ca.FormCreate(Sender: TObject);
begin
 with Tdominios.create(self) do
 begin
  try
    begin
      Open_Dominio('PAP',frm_main.Idioma) ;
        while not eof do
         begin
           cmb.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
           next;
         end;
     end;
  finally
    free;
  end;
  end;
  inherited;
end;

{procedure Tfrm_ca.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;}

procedure Tfrm_ca.pgcpChange(Sender: TObject);
begin
  inherited;
  If pgcp.ActivePage = TabSheet3 then // pessoas
  begin
     with Tdados_tab.create(self) do
       begin
          Get_Correlatos(Cliente,cenario,'CA',Id,'PS','IDF_PS') ;
          Cria_lista(trv_pessoa,false,true);
          free;
       end;
  end ;

end;

procedure Tfrm_ca.sp_ListaClick(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_PS' ;
       ListaTit := dEF13;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       Cria_Correlacao(Cliente,Cenario,'CA',self.Id,'PS',ListaCodigo,' ',0,0);
       Close;
     end;
     pgcpChange(frm_ca);
end;

procedure Tfrm_ca.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin

       If  trv_pessoa.selected = nil then
           raise exception.create(mens11);
       ListaId  := strtoint(uObj(trv_pessoa.selected.Data)^.Fcodigo);

       If ListaId <> 0 then
          Apaga_Correlacao(Cliente,Cenario,'CA',self.Id,'PS',ListaId) ;
       pgcpChange(frm_ca);
     end;
end;

procedure Tfrm_ca.SP_CRIAClick(Sender: TObject);
var
itab : Tdados_tab;
begin
  inherited;
     iTab := Tdados_tab.create(self)  ;
     try
       with iTab do
         begin
           Tabela := 'IDF_PS';
           If frm_pessoa   = nil then
              frm_pessoa := tfrm_pessoa.Create(self);
           with frm_pessoa do
            begin
             // ActiveControl := DBedit6;
              Tipo          := 'PS';
              Visivel       := 'N';
              Mode          := 'I';
              AutoFecha     := true;
              sp_Insertclick(frm_pESSOA);
              showModal;
            end;
         end;
     finally
        freeandnil(iTab);
     end;
end;

procedure Tfrm_ca.FormShow(Sender: TObject);
begin
  inherited;
  tb_dados.TabVisible := false;
end;

procedure Tfrm_ca.sp_printClick(Sender: TObject);
Begin
 Imprime('V');
end;

procedure Tfrm_ca.Imprime(pTipo : string);
var
iTab : Tdados_tab;
i : integer;
begin
  inherited;
  If frm_pca = nil then
    Begin
      //frm_pca := tfrm_pca.create(self);
      //frm_Pca.titulo.caption     := Def51;
      //frm_Pca.Subtitulo.caption  := Dbedit4.Text;
    end;     
    try
      iTab := Tdados_tab.create(self);
      iTab.Get_Correlatos(Cliente,cenario,'CA',Id,'PS','IDF_PS');
      frm_pca.qr_ps.dataset := iTab;

     //frm_pca.qrp.DataSet := iDataSource.DataSet;

     with frm_pca do
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(frm_pca.Components[i],idatasource.dataset);
          end;
      end;
      qrDataset(frm_pca.qr_ps,iTab);
     If pTipo = 'V' then
        //frm_pca.qRP.preview
     else
         //frm_pca.qRP.print;
     frm_pca.close;
    finally
      freeandnil(iTab);
    end;
end;



procedure Tfrm_ca.cmbClick(Sender: TObject);
begin
  inherited;
  dbedit1.DataSource.DataSet.edit;
  dbedit1.Field.Text := cmb.Text;
end;

procedure Tfrm_ca.trv_pessoaDblClick(Sender: TObject);
begin
  inherited;
    { TODO -c6.00.26 : Novo : mostrar detalhe pessoa na tela de ator }
   If trv_pessoa.Selected = nil then
      exit;
   iPessoa :=  Tdados_tab.create(self);
   with iPessoa  do
   begin

     If not Open_Objeto(Cliente,Cenario,strtoint(uobj(trv_pessoa.selected.Data)^.fcodigo),'IDF_PS') then
         raise exception.Create(EI1);
   end;
   If frm_PESSOA   = nil then
      frm_PESSOA := tfrm_PESSOA.Create(self);
   with frm_PESSOA do
    begin
       Tipo        := 'PS';
       Visivel     := 'N';
       Mode        := 'M';
       AutoFecha   := true;
       idatasource := ipessoa.DataExt;
       showmodal;

    end;
end;

procedure Tfrm_ca.SpeedButton1Click(Sender: TObject);
var

ppview : string;
begin
  inherited;
   If  frm_Cimp    =   nil then
     frm_Cimp    := Tfrm_Cimp.Create(application);
  frm_cimp.label1.caption := def10001;

  frm_Cimp.showModal;
  If canc then
     exit;
  If Prev then
    ppview := 'V'
  ELSE
    ppView := 'P';
  If frm_patorat = nil then
    frm_patorat := tfrm_patorat.create(application);
  ImprimeAtorAtividade(dbedit1.DataSource.DataSet.fieldbyname('CLI_ID').asinteger,
                       dbedit1.DataSource.DataSet.fieldbyname('PRJ_ID').asinteger,
                       dbedit1.DataSource.DataSet.fieldbyname('IDF_CODIGO').asinteger,ppView);
 frm_patorat.close;
end;

procedure Tfrm_ca.lvDblClick(Sender: TObject);
begin
  inherited;
  pgcpChange(nil);
end;
procedure Tfrm_ca.sp2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
