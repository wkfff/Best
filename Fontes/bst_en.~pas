unit bst_en;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, StdCtrls, Grids, DBGrids, DBCtrls, Mask,
  ImgList, Buttons, ToolWin, ExtCtrls,bstdb,cls_obj, Menus ,cls_utils, 
  OleCtrls, ActnList;

type
  Tfrm_en = class(Tfrm_obj)
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBRichEdit1: TDBRichEdit;
    rg_tipo: TDBRadioGroup;
    gb1: TGroupBox;
    dbl: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure rg_tipoClick(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    FiTab: Tdados_tab;
    procedure SetiTab(const Value: Tdados_tab);
    
    { Private declarations }
  public
    procedure Imprime(pTipo: string);
    procedure Loadconstantobj;override;

  published
   property iTab : Tdados_tab read FiTab write SetiTab;
  end;

var
  frm_en: Tfrm_en;

implementation

uses bst_main, bst_treeAtiv, bst_pen;

{$R *.dfm}

procedure Tfrm_en.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_en := nil;
  action := caFree;
end;

procedure Tfrm_en.BitBtn2Click(Sender: TObject);
begin
 close;

end;

procedure Tfrm_en.sp2Click(Sender: TObject);
begin
  try
   begin
   self.AutoFecha := true;
    If Dbedit2.text = '' then
          raise exception.create(mens22);
    If frm_TreeAtiv <> nil then
       Tv.Diagrama.SelectedNode.Text := Dbedit2.Text;
     inherited;
   end;
  except
   begin
     raise;
   end;
  end;
 

end;

procedure Tfrm_en.sp_insertClick(Sender: TObject);
begin
 
  inherited;
   rg_tipo.itemIndex := 2;
end;

procedure Tfrm_en.FormShow(Sender: TObject);
begin
  inherited;
    with Tdominios.create(self) do
    begin
      Open_Dominio('TEM',frm_main.Idioma) ;
      dbl.ListSource := Dataext;
     end;
     tb_dados.TabVisible := false;
     If rg_tipo.itemIndex = 2 then
        gb1.Visible := true;
end;

procedure Tfrm_en.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_en.pgcpChange(Sender: TObject);
begin
  inherited;
  If pgcp.ActivePage = Tb_atv then // atividades
  begin
     with Tdados_tab.create(self) do
       begin
          Get_PaisCorrelatos(Cliente,cenario,'AP',Id,'EN','IDF_AP','') ;
          Cria_lista(trv_atv,false,true);
          free;
       end;
   end;
end;

procedure Tfrm_en.rg_tipoClick(Sender: TObject);
begin
  inherited;
   gb1.Visible :=false;
  If rg_tipo.ItemIndex = 2 then
     gb1.Visible := true;
end;

procedure Tfrm_en.sp_printClick(Sender: TObject);
Begin
 If frm_pen = nil then
    frm_pen:= tfrm_pen.create(self);
 frm_pen.subtitulo.caption  := dbedit2.text;
 Imprime('V');
 frm_pen.close;
end;

procedure Tfrm_en.Imprime(pTipo : string);

begin
  inherited;
     iTab.Get_PaisCorrelatos(Cliente,cenario,'AP',Id,'EN','IDF_AP','');
     frm_pen.qr_at.dataset := iTab;
     qrDataset(frm_pen.qr_at,iTab);
     qrDataset(frm_pen.DetailBand1,iDataSource.DataSet) ;
     frm_pen.qrp.DataSet := iDataSource.DataSet;
     frm_Pen.titulo.caption := uppercase(def110);

     If pTipo = 'V' then
       frm_pen.qrp.preview
     else
     If pTipo = 'P' then
       frm_pen.qrp.print
     else
     frm_Treeativ.ReportList.Add(FRM_PEN.QRP);
end;

procedure Tfrm_en.SetiTab(const Value: Tdados_tab);
begin
  FiTab := Value;
end;

procedure Tfrm_en.FormCreate(Sender: TObject);
begin
  inherited;
  iTab := Tdados_tab.create(self);
end;

procedure Tfrm_en.Loadconstantobj;

begin

  frm_en.Caption := def110;//'Relação com Mercado'
  Label3.Caption := def10005;//'Nome/Name'
  Label5.Caption := def39;// 'Descrição/Description'
  rg_tipo.caption:= def1210;//       tipo 
  rg_tipo.Items[0]  := def280         ;// 'Condicional/Conditional'
  rg_tipo.Items[1]  := def100051        ;// 'Normal/Regular'
  rg_tipo.Items[2]  := def952        ;//  Temporal/Timely')
  gb1.Caption := def460  ;// 'Período Evento temporal/Period'
  Tb_atv.Caption := def56;//'Atividades Disparadas pelo Evento/Activities that trigger this E' +        'vent'
  Label1.Caption := def56;;//'Atividades Disparadas pelo Evento/Activities that trigger this E' +          'vent'
  //   lv.Columns[0].Caption := def63       ;
  //    lv.Columns[1].Caption := def10000 ;// envolvim. ator
      



end;

procedure Tfrm_en.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

