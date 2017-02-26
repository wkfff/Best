unit bst_aspectos;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, Grids, DBGrids, ExtCtrls, StdCtrls,
  DBCtrls, Mask, bst_main,ImgList, Buttons, ToolWin, Menus, bstdb, QuickRpt, 
  Qrctrls, cls_utils, ActnList;

type
  Tfrm_aspectos = class(Tfrm_obj)
    TabSheet2: TTabSheet;
    tb_corretiva: TTabSheet;
    Label19: TLabel;
    DBEdit11: TDBEdit;
    Label7: TLabel;
    cmb_oper: TDBLookupComboBox;
    entrev: TDBRichEdit;
    Label5: TLabel;
    Dbmemo9: TDBRichEdit;
    Label25: TLabel;
    Dbmemo7: TDBRichEdit;
    Label24: TLabel;
    SPB_LISTA1: TSpeedButton;
    ganho: TDBRichEdit;
    gb1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    RadioGroup2: TRadioGroup;
    Label1: TLabel;
    dbmemo1: TDBRichEdit;
    Label26: TLabel;
    Dbmemo2: TDBRichEdit;
    Label6: TLabel;
    Dbmemo4: TDBRichEdit;
    spb_lista2: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtp2: TDateTimePicker;
    dtp1: TDateTimePicker;
    cmb_status: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    drg_dim: TDBRadioGroup;
    trv_dim: TTreeView;
    Label27: TLabel;
    dbg_afet: TDBGrid;
    cmb_dim: TComboBox;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    db_asp: TDBRadioGroup;
    Label22: TLabel;
    cmb_norma: TDBLookupComboBox;
    Label8: TLabel;
    cmb_ptvista: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure db_aspClick(Sender: TObject);
    procedure drg_dimClick(Sender: TObject);
    procedure trv_dimDblClick(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
    procedure dbg_afetDblClick(Sender: TObject);
    procedure SPB_LISTA1Click(Sender: TObject);
    procedure spb_lista2Click(Sender: TObject);
    procedure dtp1CloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtp2CloseUp(Sender: TObject);
    procedure spb_delClick(Sender: TObject);
    procedure sp_insertClick(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure sp_printClick(Sender: TObject);
    procedure cmb_dimCloseUp(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    FCurrentDim: string;
    procedure Tipo_Aspecto;
    procedure SetCurrentDim(const Value: string);
    procedure Load_constantsAC;
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  published
   property CurrentDim : string read FCurrentDim write SetCurrentDim;
  end;

var
  frm_aspectos: Tfrm_aspectos;
  iAfet : Tdados_tab;
  Aclassed: array[1..11] of string;
 { Mensasp1 : string;
  Mensasp2 : string;
  Mensasp3 : string;
  Mensasp4 : string;
  Mensasp5 : string; }


const AClasse: array[1..11] of string = ('CA','PS','AP','EN','OI','OC','OE','DG','DE','SE','RN');

implementation

uses  bst_pac, bst_pca, bst_dm_rel;

{$R *.dfm}


procedure Tfrm_aspectos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;


procedure Tfrm_aspectos.Load_constantsAC;
begin
   Aclassed  [1]  := Def51 ;
   Aclassed  [2]  := Def13 ;
   Aclassed  [3]  := def63 ;
   Aclassed  [4]  := Def110 ;
   Aclassed  [5]  := def86 ;
   Aclassed  [6]  := def87 ;
   Aclassed  [7]  := def888 ;
   Aclassed  [8]  := def9 ;
   Aclassed  [9]  := def26 ;
   Aclassed  [10]  := def49 ;
   Aclassed  [11]  := def5 ;
end;


procedure Tfrm_aspectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  freeandnil(iAfet);
  frm_aspectos  := nil;
  action := caFree;
end;

procedure Tfrm_aspectos.FormShow(Sender: TObject);
var
  mtipo : string;
begin
  inherited;
  dtp1.date := date;
  dtp2.Date := date;
  tb_atv.TabVisible   := false;
  tb_dados.TabVisible := false;
  with Tdominios.create(self) do
    begin
      Open_Dominio('NOR',frm_main.Idioma) ;
      cmb_norma.ListSource := Dataext;
     end;
  with Tdominios.create(self) do
    begin
      Open_Dominio('VIS',frm_main.Idioma) ;
      cmb_ptVista.ListSource := Dataext;
     end;

  with TDiag_Dados.create(self)  do     //operaçoes
    begin
      Open_operacoes(cliente,cenario);
      cmb_oper.ListSource := dataext;
    end;

 If (frm_main.viewer) or (oAcesso.WACCESS = 1) then
 begin
   //spb_del.Visible := false;
   ToolButton4.Enabled := false;
   ToolButton5.Enabled := false;
 end
 else
 begin
   //spb_del.visible := true;
   ToolButton4.Enabled := true;
   ToolButton5.Enabled := true;
 end;
 If drg_dim.ItemIndex = -1 then
     currentDim := ''
  else
     CurrentDim := drg_dim.values[drg_dim.ItemIndex] ;
  db_aspClick(self);


 // dbgrid1.DataSource := idataSource;
end;

procedure Tfrm_aspectos.Tipo_Aspecto;
begin
 If db_asp.ItemIndex = 0  then
 begin
   label25.visible := true;
   label25.caption := Mensasp2;
   label26.visible := true;
   dbmemo9.visible := true;
   dbmemo1.visible := true;
   spb_lista1.visible := true;
   dbmemo7.height := dbmemo9.height ;
   tb_corretiva.TabVisible := true;
   dbmemo7.DataField := 'IDF_ASPECTOS_CRITICOS';
   label24.caption := Mensasp1;
 end
 else
 begin
   label25.caption := MensAsp3;
   label26.visible := false;
   dbmemo9.visible := false;
   dbmemo1.visible := false;
   ganho.Visible   := true;
   spb_lista1.visible := true;
   tb_corretiva.TabVisible := false;
    dbmemo7.DataField := 'IDF_ALVOS_MELHORIA';
   label24.caption := Mensasp4;
 end ;

end;


procedure Tfrm_aspectos.db_aspClick(Sender: TObject);
begin
  inherited;
  tipo_aspecto;
end;

procedure Tfrm_aspectos.drg_dimClick(Sender: TObject);
var
ptab : string;
iItemAnt : integer;
begin
  inherited;

  If (CurrentDim <> drg_dim.values[drg_dim.itemIndex]) and (CurrentDim <> '') then
   begin
      If MessageDlg(mens28, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
         raise EXCEPTION.Create('');

    with Tdados_tab.create(self) do
     begin
       Apaga_correlacoes(cliente,cenario,'AC',Id,CurrentDim );
       If currentDim <> '' then
          Begin
           If dbg_afet.DataSource <> nil then
              dbg_afet.DataSource.DataSet.Close;
          end;

     end;
   end;
   
  If (CurrentDim <> drg_dim.values[drg_dim.itemIndex]) or (trv_dim.Items.count = 0) then
  begin
  pTab := 'IDF_'+drg_dim.values[drg_dim.itemIndex];
  If drg_dim.values[drg_dim.itemIndex] = 'OC' then
     ptab := 'IDF_OI';
  with Tdados_tab.create(self) do
   begin
        { TODO -c6-000-24 : Corrigido  ordem alpha - }
     OpenAll(cliente,cenario,pTab,drg_dim.values[drg_dim.itemIndex],'',0);
     Cria_Lista(trv_dim,false,true);
   end;
   CurrentDim :=drg_dim.values[drg_dim.itemIndex];
  end;

end;

procedure Tfrm_aspectos.trv_dimDblClick(Sender: TObject);
begin
  inherited;

  with Tdados_tab.Create(self) do
   begin
     cria_correlacao(cliente,cenario,'AC',Id,drg_dim.values[drg_dim.ItemIndex],
                     strtoint(uObj(trv_dim.selected.data)^.Fcodigo),' ',0,0);
     pgcpchange(self);
                 
   end;



end;

procedure Tfrm_aspectos.pgcpChange(Sender: TObject);
var
ptab,pTipo : string;
begin
  inherited;

  If pgcp.ActivePage = tabSheet2 then
    begin
    If drg_dim.ItemIndex = - 1 then
       exit;
     pTipo:= drg_dim.values[drg_dim.ItemIndex];
     pTab := 'IDF_'+ pTipo;

     If pTipo = 'OC' then
        pTab := 'IDF_OI';
     drg_dimClick(self);   
    // with Tdados_tab.create(self) do
      begin
         iAfet.get_correlatos(cliente,cenario,'AC',Id,pTipo,Ptab);
         dbg_afet.DataSource := iAfet.dataext;
      end;

    end;
end;

procedure Tfrm_aspectos.dbg_afetDblClick(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
    begin
      Apaga_correlacao(cliente,cenario,'AC',Id,
      drg_dim.values[drg_dim.ItemIndex],
      dbg_afet.DataSource.DataSet.fieldbyname('IDF_CODIGO').value);
      free;
    end;
    pgcpchange(self);
end;

procedure Tfrm_aspectos.SPB_LISTA1Click(Sender: TObject);
begin
  inherited;
   with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_PS' ;
       ListaTit := Mensasp5;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       idatasource.DataSet.edit;   
       entrev.lines.Add(ListaDesc);
       Close;
     end;
end;

procedure Tfrm_aspectos.spb_lista2Click(Sender: TObject);
begin
  inherited;
  with Tdados_tab.create(self) do
     begin
       ListaCli := Cliente ;
       ListaProj:= Cenario ;
       ListaDim := 'IDF_PS' ;
       ListaTit := Mensasp5;
       ListaTag := 0 ;
       ListaEdit:= false ;
       ListaTree:= nil;
       ListaId  := 0;
       ListaFecha := true;
       mostra_lista;
       If ListaCodigo = 0 then
          exit;
       idatasource.DataSet.edit;   
       dbMemo2.lines.Add(ListaDesc);
       Close;
     end;
end;

procedure Tfrm_aspectos.SetCurrentDim(const Value: string);
begin
  FCurrentDim := Value;
end;

procedure Tfrm_aspectos.dtp1CloseUp(Sender: TObject);
begin
  inherited;
  idatasource.DataSet.edit;
  dbedit5.Field.Text := formatdatetime('dd/mm/yyyy',dtp1.Date);
end;

procedure Tfrm_aspectos.FormCreate(Sender: TObject);
var
istat : Tdominios;
begin
  inherited;
  Load_constantsAC; //carrega as constatntes;
  try
    istat := Tdominios.create(self);
    istat.Open_Dominio('SIT',frm_main.Idioma);
    cmb_status.ListSource := iStat.DataExt;
    iAfet := TDados_tab.create(self);
  finally

  end;

 with Tdominios.create(self) do
 begin
  try
    begin
      Open_Dominio('DIM',frm_main.Idioma) ;
        while not eof do
         begin
           cmb_dim.Items.Add(fieldbyname('DI_DESCRICAO').AsString);
           next;
         end;
     end;
  finally
    free;
  end;
  end;
end;

procedure Tfrm_aspectos.dtp2CloseUp(Sender: TObject);
begin
  inherited;
   idatasource.DataSet.edit;
  dbedit9.Field.Text := formatdatetime('dd/mm/yyyy',dtp2.Date);
end;

procedure Tfrm_aspectos.spb_delClick(Sender: TObject);
begin
  inherited;
  If MessageDlg(mens29,
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    raise exception.create(mens25);
  with Tdados_tab.creaTE(SELF) do
   begin
    If  not apaga_objeto(cliente,cenario,Id,'IDF_'+Tipo) then
        raise exception.create(mens30);
   end;
 sp_insertClick(self) ;

end;

procedure Tfrm_aspectos.sp_insertClick(Sender: TObject);
begin
  inherited;
  CurrentDim := '';
end;

procedure Tfrm_aspectos.sp2Click(Sender: TObject);
begin
  inherited;
  If idatasource.DataSet.FieldByName('IDF_ID').asstring = '' then
     raise exception.create(Mens31);
  If idatasource.DataSet.FieldByName('IDF_TIPO__ASPECTO').asstring = '' then
     raise exception.create(Mens32);
  If idatasource.DataSet.FieldByName('IDF_PONTO_DE_VISTA').asstring = '' then
     raise exception.create(Mens33);
  If drg_dim.ItemIndex > -1 then
   begin
     idatasource.DataSet.edit;
     idatasource.DataSet.FieldByName('IDF_NATUREZA').Value := drg_dim.items[drg_dim.ItemIndex];
     idatasource.dataset.post;
   end;
 If idatasource.DataSet.FieldByName('DIMENSAO').asstring = '' then
 Begin
     raise exception.create(Mens58);
 End;
 close;
end;

procedure Tfrm_aspectos.sp_printClick(Sender: TObject);
var
  iTab : TDados_tab;
  i : integer;
  wtipo : string;
begin
  inherited;
   sp2Click(frm_aspectos);
   If frm_pac = nil then
      frm_pac := Tfrm_Pac.create(self);
    try
      frm_pac.qrp.DataSet := iDataSource.DataSet;
      with frm_pac do    // aloca dataset aos controles
      begin
         for i := 0 to componentCount -1 do
          begin
           If (Components[i] is Tqrband) or  (Components[i] is TqrChildband) then
              qrdataset(Components[i],idatasource.dataset);
          end;
      end;   
      qrDataset(frm_pac.qrsubdetail1,iTab);
      frm_pac.l_oper.caption := cmb_oper.ListSource.DataSet.fieldbyname('SUB_NOME').asstring;

      If idatasource.dataset.fieldbyname('IDF_TIPO__ASPECTO').ASSTRING = 'AC'  then
        begin
          frm_pac.pcausa.DataField := 'IDF_ASPECTOS_CRITICOS';
        end
      else
        begin
          frm_pac.pcausa.DataField := 'IDF_ALVOS_MELHORIA';
        end ;
      frm_pac.qrp.preview;
      frm_pac.close;
    finally
       freeandnil(itab);
    end;



end;

procedure Tfrm_aspectos.cmb_dimCloseUp(Sender: TObject);
begin
  inherited;
  dbedit1.DataSource.DataSet.Edit;
  dbedit1.Field.Text := cmb_dim.Items[cmb_dim.itemIndex];

end;

procedure Tfrm_aspectos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_aspectos.Loadconstantobj;
var
i : integer;

begin
  inherited
  Caption := def40 ;//'Aspectos Críticos/Alvos de Melhoria' ;
  Label19.Caption :=def10005;// 'Nome/Name' ;
  Label10.Caption := defe5;//'Existentes';
  Label7.Caption := dim1;//'Operação/Operation . '  ;
  Label22.Caption := defn1;//'Norma/Policy' ;
  Label8.Caption := defp4;//'Ponto de Vista/Point of View'  ;
  Label12.Caption := def450;//'Responsável/Responsible ' ;
  Label5. Caption := defe6;//'Entrevistados/People Involved' ;
  Label25.Caption :=  Mensasp2;//'Efeito/Effect' ;
  Label24. Caption := Mensasp1;//'Causa/Cause'   ;
  SPB_LISTA1.Caption := def102;//'Lista Pessoas/List    '   ;

  Label9.Caption := defd1;//'Dimensão/Dimension' ;
  db_asp.Caption := deft4;//'Tipo de Aspecto/Aspect Kind' ;
  db_asp.Items[0]  :=  def40;//'Aspecto Crítico/Critical'    ;
  db_asp.Items[1]  := defa2;//'Alvo de Melhoria/Improvement';
  Tb_atv.Caption := def61 ;//'Atividades onde Aplicada' ;
  lv.Columns[0].Caption  := def63;// 'Atividade'   ;
  lv.Columns[1].Caption  :=  defe1 ;//'Envolvimento Ator/Actor Involved'  ;
  tb_dados. Caption := def62;//'Dados'   ;
  TabSheet2.Caption := defd8;//'Dimensão Afetada/Involved Dimension'   ;
  gb1.Caption := ''  ;
  SpeedButton1. Hint := defa4;//ocar Dimensão'  ;
  SpeedButton3.Hint := defd6;//salocar Dimensão'  ;
  Label27. Caption := defd7;//etadas/Involved'     ;
  drg_dim.Caption := defd1;//'Dimensões' ;
  drg_dim.Items[0] := def63;//'Atividade/Activity'  ;
  drg_dim.Items[1] := def5;// 'Regra de Negócio/Business Rules'   ;
  drg_dim.Items[2] := def51 ;// 'Classe de Atores/Actors Classes' ;
  drg_dim.Items[3] :=  def13;//'Pessoa/People'    ;
  drg_dim.Items[4] :=  def9;//'Fluxo de Dados/data Groups'    ;
  drg_dim.Items[5] := def26 ;// 'Elemento de dado/data Elements'   ;
  drg_dim.Items[6] := def87 ;// 'Objeto de Controle/Control Object'  ;
  drg_dim.Items[7] := def86;// 'Objeto de Interface/Interface Object'  ;
  drg_dim.Items[8] := def110;// 'Evento de Negócio/Business Event' ;
  drg_dim.Items[9] :=  def30 ;//'Local de Processamento/Site' ;
  drg_dim.Items[10] := def49;// 'Funcionalidade/Program'  ;
  tb_corretiva. Caption := defa6;//ão Corretiva'  ;
  Label1. Caption := defa6;//'Ação Corretiva/Fixing Action'  ;
  Label26.Caption := defe7;//volvidos na Ação Corretiva/People invilved in Correction' ;
  Label6. Caption := defe8;//pectativa de ganho/Estimated Gains'   ;
  spb_lista2.Caption := defl4;//'Lista Pessoas/  List ' ;
  Label3.Caption := def6220;//'Data/Date'  ;
  Label4.Caption := defp7;//'Prazo para Conclusão/ETD'   ;
 tb_ger.Caption := defg1 ;//'Gerenciamento/Management'  ;

end;

end.

